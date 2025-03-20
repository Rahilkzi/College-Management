<?php

class AutoloadFixer
{
    private $basePath;
    private $issues = [];
    private $fixedCount = 0;

    public function __construct($basePath)
    {
        $this->basePath = $basePath;
    }

    public function fix()
    {
        echo "Starting autoload fixes...\n";

        // 1. Fix Models namespace issues
        $this->moveFile(
            'app/Models/Roles.php',
            'app/Models/Role.php'
        );

        // 2. Create Role and Permission models
        $this->createRoleModel();
        $this->createPermissionModel();

        // 3. Fix Request folder structure
        $this->moveDirectory(
            'app/Request',
            'app/Http/Requests'
        );

        // 4. Fix composer.json and remove problematic packages
        $this->updateComposerJson();

        // 5. Fix config/app.php providers
        $this->fixServiceProviders();

        // 6. Clear caches
        $this->clearCaches();

        echo "\nFixed {$this->fixedCount} issues.\n";
        echo "Please run 'composer dump-autoload' after the fixes.\n";
    }

    private function moveFile($from, $to)
    {
        $fromPath = $this->basePath . '/' . $from;
        $toPath = $this->basePath . '/' . $to;

        if (!file_exists($fromPath)) {
            echo "Warning: Source file {$from} does not exist.\n";
            return;
        }

        if (!file_exists(dirname($toPath))) {
            mkdir(dirname($toPath), 0755, true);
        }

        if (rename($fromPath, $toPath)) {
            echo "Moved {$from} to {$to}\n";
            $this->fixedCount++;
        } else {
            echo "Failed to move {$from} to {$to}\n";
        }
    }

    private function moveDirectory($from, $to)
    {
        $fromPath = $this->basePath . '/' . $from;
        $toPath = $this->basePath . '/' . $to;

        if (!file_exists($fromPath)) {
            echo "Warning: Source directory {$from} does not exist.\n";
            return;
        }

        if (!file_exists($toPath)) {
            mkdir($toPath, 0755, true);
        }

        $iterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($fromPath, RecursiveDirectoryIterator::SKIP_DOTS),
            RecursiveIteratorIterator::SELF_FIRST
        );

        foreach ($iterator as $item) {
            $targetPath = str_replace($fromPath, $toPath, $item->getPathname());
            
            if ($item->isDir()) {
                if (!file_exists($targetPath)) {
                    mkdir($targetPath);
                }
            } else {
                if (copy($item->getPathname(), $targetPath)) {
                    unlink($item->getPathname());
                    echo "Moved {$item->getPathname()} to {$targetPath}\n";
                    $this->fixedCount++;
                }
            }
        }

        // Remove empty source directory
        if (is_dir($fromPath)) {
            rmdir($fromPath);
        }
    }

    private function createRoleModel()
    {
        $roleModelPath = $this->basePath . '/app/Role.php';
        
        if (!file_exists($roleModelPath)) {
            $roleModelContent = <<<'EOT'
<?php

namespace App;

use Zizaco\Entrust\EntrustRole;

class Role extends EntrustRole
{
    protected $fillable = ['name', 'display_name', 'description'];
}
EOT;

            if (file_put_contents($roleModelPath, $roleModelContent)) {
                echo "Created Role model at app/Role.php\n";
                $this->fixedCount++;
            } else {
                echo "Failed to create Role model\n";
            }
        }

        // Also ensure the Role model in Models directory is properly namespaced
        $roleInModelsPath = $this->basePath . '/app/Models/Role.php';
        if (file_exists($roleInModelsPath)) {
            $content = file_get_contents($roleInModelsPath);
            $content = preg_replace('/namespace\s+App\\\\Models;/', 'namespace App;', $content);
            $content = preg_replace('/class\s+Roles\s+extends/', 'class Role extends', $content);
            
            if (file_put_contents($roleInModelsPath, $content)) {
                echo "Updated Role model namespace\n";
                $this->fixedCount++;
            }
        }
    }

    private function createPermissionModel()
    {
        $permissionModelPath = $this->basePath . '/app/Permission.php';
        
        if (!file_exists($permissionModelPath)) {
            $permissionModelContent = <<<'EOT'
<?php

namespace App;

use Zizaco\Entrust\EntrustPermission;

class Permission extends EntrustPermission
{
    protected $fillable = ['name', 'display_name', 'description'];
}
EOT;

            if (file_put_contents($permissionModelPath, $permissionModelContent)) {
                echo "Created Permission model at app/Permission.php\n";
                $this->fixedCount++;
            } else {
                echo "Failed to create Permission model\n";
            }
        }

        // Also ensure the Permission model in Models directory is properly namespaced
        $permissionInModelsPath = $this->basePath . '/app/Models/Permission.php';
        if (file_exists($permissionInModelsPath)) {
            $content = file_get_contents($permissionInModelsPath);
            $content = preg_replace('/namespace\s+App\\\\Models;/', 'namespace App;', $content);
            
            if (file_put_contents($permissionInModelsPath, $content)) {
                echo "Updated Permission model namespace\n";
                $this->fixedCount++;
            }
        }
    }

    private function updateComposerJson()
    {
        $composerJsonPath = $this->basePath . '/composer.json';
        
        if (!file_exists($composerJsonPath)) {
            echo "Warning: composer.json not found.\n";
            return;
        }

        $composer = json_decode(file_get_contents($composerJsonPath), true);

        // Update autoload section
        $composer['autoload']['psr-4'] = array_merge($composer['autoload']['psr-4'] ?? [], [
            "App\\" => "app/",
        ]);

        // Add classmap for models if it doesn't exist
        if (!isset($composer['autoload']['classmap'])) {
            $composer['autoload']['classmap'] = [];
        }
        if (!in_array("app/Models", $composer['autoload']['classmap'])) {
            $composer['autoload']['classmap'][] = "app/Models";
        }

        // Ensure Entrust package is included
        if (!isset($composer['require']['zizaco/entrust'])) {
            $composer['require']['zizaco/entrust'] = "5.2.x";
            echo "Added zizaco/entrust package\n";
        }

        // Remove problematic packages
        if (isset($composer['require']['beyondcode/laravel-dump-server'])) {
            unset($composer['require']['beyondcode/laravel-dump-server']);
            echo "Removed beyondcode/laravel-dump-server from composer.json\n";
        }

        // Write back to file
        if (file_put_contents($composerJsonPath, json_encode($composer, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES))) {
            echo "Updated composer.json configuration\n";
            $this->fixedCount++;
        } else {
            echo "Failed to update composer.json\n";
        }
    }

    private function fixServiceProviders()
    {
        $configPath = $this->basePath . '/config/app.php';
        
        if (!file_exists($configPath)) {
            echo "Warning: config/app.php not found.\n";
            return;
        }

        $config = file_get_contents($configPath);
        
        // Remove the DumpServer provider if it exists
        $pattern = "/BeyondCode\\\\DumpServer\\\\DumpServerServiceProvider::class,?\n?/";
        $newConfig = preg_replace($pattern, '', $config);
        
        if ($config !== $newConfig) {
            if (file_put_contents($configPath, $newConfig)) {
                echo "Removed DumpServer provider from config/app.php\n";
                $this->fixedCount++;
            } else {
                echo "Failed to update config/app.php\n";
            }
        }
    }

    private function clearCaches()
    {
        // Clear Laravel caches
        $cacheFiles = [
            'bootstrap/cache/packages.php',
            'bootstrap/cache/services.php',
            'bootstrap/cache/config.php'
        ];

        foreach ($cacheFiles as $file) {
            $path = $this->basePath . '/' . $file;
            if (file_exists($path) && unlink($path)) {
                echo "Cleared cache file: {$file}\n";
                $this->fixedCount++;
            }
        }

        // Also clear Laravel's compiled services file
        $compiledServicesPath = $this->basePath . '/storage/framework/compiled.php';
        if (file_exists($compiledServicesPath) && unlink($compiledServicesPath)) {
            echo "Cleared compiled services file\n";
            $this->fixedCount++;
        }

        // Clear view cache
        $viewCachePath = $this->basePath . '/storage/framework/views';
        if (is_dir($viewCachePath)) {
            array_map('unlink', glob("$viewCachePath/*.*"));
            echo "Cleared view cache\n";
            $this->fixedCount++;
        }
    }
}

// Usage
$basePath = __DIR__; // Or provide your project's base path
$fixer = new AutoloadFixer($basePath);
$fixer->fix();

echo "\nNext steps:\n";
echo "1. Run: composer update\n";
echo "2. Run: composer dump-autoload\n";
echo "3. Run: php artisan config:clear\n";
echo "4. Run: php artisan cache:clear\n";
echo "5. Run: php artisan view:clear\n";
?> 