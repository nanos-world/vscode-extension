---@meta

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---A Billboard is a 2D Material that will be rendered always facing the camera.
---@class Billboard : Entity, Actor, Paintable
---@overload fun(location: Vector, material_asset: string, size?: Vector2D, size_in_screen_space?: boolean): Billboard
Billboard = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Decals are Materials that are projected onto meshes in your level, including Static Meshes and Skeletal Meshes.
---@class Decal : Entity, Actor, Paintable
---@overload fun(location: Vector, rotation: Rotator, material_asset: string, size?: Vector, lifespan?: number, fade_screen_size?: number): Decal
Decal = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---VehicleWater are entities which Characters can possesses and drive over the water with dynamic physics.
---@class VehicleWater : Entity, Actor, Vehicle, Paintable, Damageable
---@overload fun(location: Vector, rotation: Rotator, asset: string, collision_type?: CollisionType, gravity_enabled?: boolean): VehicleWater
VehicleWater = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the relative location of the Engine (where the Physics Thruster, sounds and effects are attached). Default is Vector(-200, 0, 0)
---@param offset Vector 
function VehicleWater:SetEngineOffset(offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the force of the Engine/Thruster. Default is 1000
---@param force integer 
function VehicleWater:SetThrustStrength(force) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---The Widget3D class is the 3D representation of a Widget class spawned in the world.
---@class Widget3D : Entity, Actor
Widget3D = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the auto repaint rate
---@param rate number 
function Widget3D:SetAutoRepaintRate(rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Forces this to repaint
function Widget3D:Repaint() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return Widget 
function Widget3D:GetWidget() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Widget3D, event_name: "Spawn", callback: fun(self: Widget3D)): fun(self: Widget3D) @Triggered when an Entity is spawned/created
---@overload fun(self: Widget3D, event_name: "Destroy", callback: fun(self: Widget3D)): fun(self: Widget3D) @Triggered when an Entity is destroyed
---@overload fun(self: Widget3D, event_name: "ValueChange", callback: fun(self: Widget3D, key: string, value: any)): fun(self: Widget3D, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Widget3D, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Widget3D, event_name: "DimensionChange", callback: fun(self: Widget3D, old_dimension: integer, new_dimension: integer)): fun(self: Widget3D, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
function Widget3D:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Widget3D, event_name: "Spawn", callback: fun(self: Widget3D)) @Triggered when an Entity is spawned/created
---@overload fun(self: Widget3D, event_name: "Destroy", callback: fun(self: Widget3D)) @Triggered when an Entity is destroyed
---@overload fun(self: Widget3D, event_name: "ValueChange", callback: fun(self: Widget3D, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Widget3D, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Widget3D, event_name: "DimensionChange", callback: fun(self: Widget3D, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
function Widget3D:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A StaticMesh entity represents a Mesh which can be spawned in the world, can't move and is more optimized for using in decorating the world.
---@class StaticMesh : Entity, Actor, Paintable
---@overload fun(location: Vector, rotation: Rotator, static_mesh_asset: string, collision_type?: CollisionType): StaticMesh
StaticMesh = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Changes the mesh in runtime
---@param static_mesh_asset string @asset
function StaticMesh:SetMesh(static_mesh_asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Asset path mesh used
---@return string @asset path
function StaticMesh:GetMesh() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets if this StaticMesh is from the Level
---@return boolean @if this StaticMesh is from the level
function StaticMesh:IsFromLevel() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Socket Transform in world space given a bone name
---@param socket_name string 
---@return { Location: Vector, Rotation: Rotator } 
function StaticMesh:GetSocketTransform(socket_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Base class for all Damageable entities. It provides Health and Damage related methods and events.
---@class Damageable
Damageable = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Do damage to this entity, will trigger all related events and apply modified damage based on bone. Also will apply impulse if it's a heavy explosion
---@param damage integer 
---@param bone_name? string @(Default: "")
---@param damage_type? DamageType @(Default: DamageType.Shot)
---@param from_direction? Vector @(Default: Vector(0, 0, 0))
---@param instigator? Player @The player which caused the damage (Default: nil)
---@param causer? any @The object which caused the damage (Default: nil)
---@return integer @the damage applied
function Damageable:ApplyDamage(damage, bone_name, damage_type, from_direction, instigator, causer) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the current health
---@return integer 
function Damageable:GetHealth() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Max Health
---@return integer 
function Damageable:GetMaxHealth() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Respawns the Entity, fullying it's Health and moving it to it's Initial Location
---@param location? Vector @If not passed will use the initial location passed when the Entity spawned (Default: initial location)
---@param rotation? Rotator @(Default: Rotator(0, 0, 0))
function Damageable:Respawn(location, rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Health of this Entity. You can only call it on alive Entities (call Respawn first)
---@param new_health integer 
function Damageable:SetHealth(new_health) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the MaxHealth of this Entity
---@param max_health integer 
function Damageable:SetMaxHealth(max_health) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Damageable, event_name: "HealthChange", callback: fun(self: Damageable, old_health: integer, new_health: integer)): fun(self: Damageable, old_health: integer, new_health: integer) @When Entity has it's Health changed, or because took damage or manually set through scripting or respawning
---@overload fun(self: Damageable, event_name: "Respawn", callback: fun(self: Damageable)): fun(self: Damageable) @When Entity Respawns
---@overload fun(self: Damageable, event_name: "Death", callback: fun(self: Damageable, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor)): fun(self: Damageable, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor) @When Entity Dies
---@overload fun(self: Damageable, event_name: "TakeDamage", callback: fun(self: Damageable, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?): fun(self: Damageable, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean? @Triggered when this Entity takes damage
function Damageable:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Damageable, event_name: "HealthChange", callback: fun(self: Damageable, old_health: integer, new_health: integer)) @When Entity has it's Health changed, or because took damage or manually set through scripting or respawning
---@overload fun(self: Damageable, event_name: "Respawn", callback: fun(self: Damageable)) @When Entity Respawns
---@overload fun(self: Damageable, event_name: "Death", callback: fun(self: Damageable, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor)) @When Entity Dies
---@overload fun(self: Damageable, event_name: "TakeDamage", callback: fun(self: Damageable, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?) @Triggered when this Entity takes damage
function Damageable:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Blueprint Class allows spawning any Unreal Blueprint Actor in nanos world.
---@class Blueprint : Entity, Actor, Paintable
---@overload fun(location: Vector, rotation: Rotator, blueprint_asset: string, collision_type?: CollisionType): Blueprint
Blueprint = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Calls a Blueprint Event or Function<br/>Returns all Function return values on <strong>Client Side</strong>
---@param event_name string @Event or Function name
---@param ...? any @Sequence of arguments to pass to the event (Default: nil)
---@return any... @the function return values
function Blueprint:CallBlueprintEvent(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Assigns and Binds a Blueprint Event Dispatcher
---@param dispatcher_name string @Event Dispatcher name
---@param callback function @Callback function to call
---@return function @the callback itself
function Blueprint:BindBlueprintEventDispatcher(dispatcher_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Unbinds a Blueprint Event Dispatcher
---@param dispatcher_name string @Event Dispatcher name
---@param callback? function @Optional callback to unbind
function Blueprint:UnbindBlueprintEventDispatcher(dispatcher_name, callback?) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets a Blueprint Property/Variable value directly
---@param property_name string 
---@param value any 
function Blueprint:SetBlueprintPropertyValue(property_name, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Blueprint Property/Variable value
---@param property_name string 
---@return any @the value
function Blueprint:GetBlueprintPropertyValue(property_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---The Database entity provides programmers a way to access SQL databases easily through scripting.
---@class Database
---@overload fun(database_engine: DatabaseEngine, connection_string: string, pool_size?: integer): Database
Database = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Closes the Database
function Database:Close() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Execute a query asynchronously
---@param query string @Query to execute
---@param callback? function @Callback (Default: nil)
---@param ...? any @Sequence of parameters to escape into the Query (Default: nil)
function Database:ExecuteAsync(query, callback, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Execute a query synchronously
---@param query string @Query to execute
---@param ...? any @Sequence of parameters to escape into the Query (Default: nil)
---@return integer @affected rows
---@return string @error (if any)
function Database:Execute(query, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Execute a select query asynchronously
---@param query string @Query to execute
---@param callback? function @Callback (Default: nil)
---@param ...? any @Sequence of parameters to escape into the Query (Default: nil)
function Database:SelectAsync(query, callback, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Selects a query synchronously
---@param query string @Query to execute
---@param ...? any @Sequence of parameters to escape into the Query (Default: nil)
---@return table[] @rows fetched
---@return string @error (if any)
function Database:Select(query, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---A tool to transform objects at runtime.
---@class Gizmo : Entity, Actor
---@overload fun(): Gizmo
Gizmo = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enable the interaction
---@param location Vector 
---@param rotation Rotator 
---@param scale Vector 
function Gizmo:Activate(location, rotation, scale) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Disable the interaction
function Gizmo:Deactivate() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns if it's currently interacting
---@return boolean 
function Gizmo:IsInteracting() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Triggers the press pointer event on it
function Gizmo:PressPointer() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Triggers the release pointer event on it
function Gizmo:ReleasePointer() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@param transform_mode GizmoTransformMode 
---@param combine_translate_rotate boolean 
function Gizmo:SetTransformMode(transform_mode, combine_translate_rotate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@param align_space GizmoAlignSpace 
function Gizmo:SetAlignSpace(align_space) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@param location_grid_size number 
---@param rotation_grid_size number 
---@param scale_grid_size number 
function Gizmo:SetSnapSettings(location_grid_size, rotation_grid_size, scale_grid_size) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Gizmo, event_name: "Spawn", callback: fun(self: Gizmo)): fun(self: Gizmo) @Triggered when an Entity is spawned/created
---@overload fun(self: Gizmo, event_name: "Destroy", callback: fun(self: Gizmo)): fun(self: Gizmo) @Triggered when an Entity is destroyed
---@overload fun(self: Gizmo, event_name: "ValueChange", callback: fun(self: Gizmo, key: string, value: any)): fun(self: Gizmo, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Gizmo, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Gizmo, event_name: "DimensionChange", callback: fun(self: Gizmo, old_dimension: integer, new_dimension: integer)): fun(self: Gizmo, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Gizmo, event_name: "Transform", callback: fun(self: Gizmo, location: Vector, rotation: Rotator, scale: Vector)): fun(self: Gizmo, location: Vector, rotation: Rotator, scale: Vector) @Triggered when the Gizmo has it's transform updated
function Gizmo:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Gizmo, event_name: "Spawn", callback: fun(self: Gizmo)) @Triggered when an Entity is spawned/created
---@overload fun(self: Gizmo, event_name: "Destroy", callback: fun(self: Gizmo)) @Triggered when an Entity is destroyed
---@overload fun(self: Gizmo, event_name: "ValueChange", callback: fun(self: Gizmo, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Gizmo, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Gizmo, event_name: "DimensionChange", callback: fun(self: Gizmo, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Gizmo, event_name: "Transform", callback: fun(self: Gizmo, location: Vector, rotation: Rotator, scale: Vector)) @Triggered when the Gizmo has it's transform updated
function Gizmo:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Light represents a Lighting source.
---@class Light : Entity, Actor
---@overload fun(location: Vector, rotation?: Rotator, color?: Color, light_type?: LightType, intensity?: number, attenuation_radius?: number, cone_angle?: number, inner_cone_angle_percent?: number, max_daw_distance?: number, use_inverse_squared_falloff?: boolean, cast_shadows?: boolean, visible?: boolean): Light
Light = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the light color
---@param color Color @The light color
function Light:SetColor(color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the light Texture Profile
---@param light_profile LightProfile @The Light Profile to use
function Light:SetTextureLightProfile(light_profile) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@param is_shadows_enabled boolean 
function Light:SetCastShadows(is_shadows_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@param intensity number 
function Light:SetIntensity(intensity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@param attenuation_radius number 
function Light:SetAttenuationRadius(attenuation_radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return boolean 
function Light:GetCastShadows() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return number 
function Light:GetIntensity() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return number 
function Light:GetAttenuationRadius() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Color 
function Light:GetColor() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Class to spawn Particle Systems used to create effects in the world.
---@class Particle : Entity, Actor
---@overload fun(location: Vector, rotation: Rotator, asset: string, auto_destroy?: boolean, auto_activate?: boolean): Particle
Particle = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Activates the Emitter
---@param should_reset boolean @If should reset
function Particle:Activate(should_reset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Deactivate the Emitter
function Particle:Deactivate() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns if this Particle is active
---@return boolean 
function Particle:IsActive() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a float parameter in this Particle System
---@param parameter string @The parameter name
---@param value number @The float value
function Particle:SetParameterFloat(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets an integer parameter in this Particle System
---@param parameter string @The parameter name
---@param value integer @The int value
function Particle:SetParameterInt(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a boolean parameter in this Particle System
---@param parameter string @The parameter name
---@param value boolean @The boolean value
function Particle:SetParameterBool(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Vector parameter in this Particle System
---@param parameter string @The parameter name
---@param value Vector @The Vector value
function Particle:SetParameterVector(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Color parameter in this Particle System
---@param parameter string @The parameter name
---@param value Color @The Color value
function Particle:SetParameterColor(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Material parameter in this Particle System
---@param parameter string @The parameter name
---@param value string @The Material value
function Particle:SetParameterMaterial(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---This will create a Material and set this Texture as it's parameter internally, then set the Material into the Particle parameter
---@param parameter string @The parameter name
---@param value string @The Texture value
function Particle:SetParameterMaterialFromTexture(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---This will create a Material and set this Canvas as it's parameter internally, then set the Material into the Particle parameter
---@param parameter string @The parameter name
---@param value Canvas @The Canvas value
function Particle:SetParameterMaterialFromCanvas(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---This will create a Material and set this WebUI as it's parameter internally, then set the Material into the Particle parameter
---@param parameter string @The parameter name
---@param value WebUI @The WebUI value
function Particle:SetParameterMaterialFromWebUI(parameter, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Text Render class is useful for spawning Texts in 3D world, you can even attach it to other entities.
---@class TextRender : Entity, Actor, Paintable
---@overload fun(location: Vector, rotation: Rotator, text: string, scale?: Vector, color?: Color, font_type?: FontType, align_camera?: TextRenderAlignCamera): TextRender
TextRender = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Color (Internally this will call the <code>SetMaterialColorParameter("Tint", color)</code> method)
---@param color Color 
function TextRender:SetColor(color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Font
---@param font_type FontType 
function TextRender:SetFont(font_type) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Freeze mesh rebuild, to avoid unnecessary mesh rebuilds when setting a few properties together
---@param freeze boolean 
function TextRender:SetFreeze(freeze) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Glyph representation settings to generate the 3D Mesh for this text render
---@param extrude? number @(Default: 0)
---@param level? number @(Default: 0)
---@param bevel_type? TextRenderBevelType @(Default: TextRenderBevelType.Convex)
---@param bevel_segments? integer @(Default: 8)
---@param outline? boolean @(Default: false)
function TextRender:SetGlyphSettings(extrude, level, bevel_type, bevel_segments, outline) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Max Size of the TextRender, optionally scaling it proportionally
---@param max_width? integer @(Default: 0)
---@param max_height? integer @(Default: 0)
---@param scale_proportionally? boolean @(Default: true)
function TextRender:SetMaxSize(max_width, max_height, scale_proportionally) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Text
---@param text string 
function TextRender:SetText(text) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Text & Font settings for this text render
---@param kerning? number @(Default: 0)
---@param line_spacing? number @(Default: 0)
---@param word_spacing? number @(Default: 0)
---@param horizontal_alignment? TextRenderHorizontalAlignment @(Default: TextRenderHorizontalAlignment.Center)
---@param vertical_alignment? TextRenderVerticalAlignment @(Default: 0TextRenderVerticalAlignment.Center)
function TextRender:SetTextSettings(kerning, line_spacing, word_spacing, horizontal_alignment, vertical_alignment) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Trigger class is a utility class to trigger events when any Entity enters an Area.
---@class Trigger : Entity, Actor
---@overload fun(location: Vector, rotation: Rotator, extent: Vector|number, trigger_type?: TriggerType, is_visible?: boolean, color?: Color, overlap_only_classes?: string[]): Trigger
Trigger = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Forces a Overlap checking to occur, will immediately trigger overlaps
function Trigger:ForceOverlapChecking() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets the extent size of this trigger (sphere triggers can receive as float for radius)
---@param extent Vector|number 
function Trigger:SetExtent(extent) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Trigger color (if visible)
---@param color Color 
function Trigger:SetColor(color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets the filter to Trigger to only overlap specific Classes. Leave it empty for all Classes
---@param overlap_only_classes string[] 
function Trigger:SetOverlapOnlyClasses(overlap_only_classes) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Trigger, event_name: "Spawn", callback: fun(self: Trigger)): fun(self: Trigger) @Triggered when an Entity is spawned/created
---@overload fun(self: Trigger, event_name: "Destroy", callback: fun(self: Trigger)): fun(self: Trigger) @Triggered when an Entity is destroyed
---@overload fun(self: Trigger, event_name: "ValueChange", callback: fun(self: Trigger, key: string, value: any)): fun(self: Trigger, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Trigger, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Trigger, event_name: "DimensionChange", callback: fun(self: Trigger, old_dimension: integer, new_dimension: integer)): fun(self: Trigger, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Trigger, event_name: "BeginOverlap", callback: fun(self: Trigger, entity: Actor)): fun(self: Trigger, entity: Actor) @Triggered when something overlaps this Trigger
---@overload fun(self: Trigger, event_name: "EndOverlap", callback: fun(self: Trigger, entity: Actor)): fun(self: Trigger, entity: Actor) @Triggered when something leaves this Trigger
function Trigger:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Trigger, event_name: "Spawn", callback: fun(self: Trigger)) @Triggered when an Entity is spawned/created
---@overload fun(self: Trigger, event_name: "Destroy", callback: fun(self: Trigger)) @Triggered when an Entity is destroyed
---@overload fun(self: Trigger, event_name: "ValueChange", callback: fun(self: Trigger, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Trigger, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Trigger, event_name: "DimensionChange", callback: fun(self: Trigger, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Trigger, event_name: "BeginOverlap", callback: fun(self: Trigger, entity: Actor)) @Triggered when something overlaps this Trigger
---@overload fun(self: Trigger, event_name: "EndOverlap", callback: fun(self: Trigger, entity: Actor)) @Triggered when something leaves this Trigger
function Trigger:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Base class for all Paintable entities. This class provides customization for materials, exposing common functions to allow you to set custom material parameters, including loading textures from disk.
---@class Paintable
Paintable = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the material at the specified index of this Actor
---@param material_path string @The new Material to apply
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
---@param attachable_id? string @The attachable ID (set with <code>AddSkeletalMeshAttached</code> or <code>AddStaticMeshAttached</code>) to apply the material. Pass empty to set on main mesh only (Default: "")
function Paintable:SetMaterial(material_path, index, attachable_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the material at the specified index of this Actor to a Canvas object
---@param canvas Canvas @The Canvas object to use as a material
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
function Paintable:SetMaterialFromCanvas(canvas, index) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the material at the specified index of this Actor to a SceneCapture object
---@param scene_capture SceneCapture @The SceneCapture object to use as a material
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
function Paintable:SetMaterialFromSceneCapture(scene_capture, index) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the material at the specified index of this Actor to a WebUI object
---@param webui WebUI @The WebUI object to use as a material
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
function Paintable:SetMaterialFromWebUI(webui, index) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Resets the material from the specified index to the original one
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
---@param attachable_id? string @The attachable ID (set with <code>AddSkeletalMeshAttached</code> or <code>AddStaticMeshAttached</code>) to reset the material. Pass empty to reset on main mesh only (Default: "")
function Paintable:ResetMaterial(index, attachable_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Color parameter in this Actor's material
---@param parameter_name string @The name of the material parameter
---@param color Color @The value to set
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
---@param attachable_id? string @The attachable ID (set with <code>AddSkeletalMeshAttached</code> or <code>AddStaticMeshAttached</code>) to apply the material parameter. Pass empty to set on main mesh only (Default: "")
function Paintable:SetMaterialColorParameter(parameter_name, color, index, attachable_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Scalar parameter in this Actor's material
---@param parameter_name string @The name of the material parameter
---@param scalar number @The value to set
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
---@param attachable_id? string @The attachable ID (set with <code>AddSkeletalMeshAttached</code> or <code>AddStaticMeshAttached</code>) to apply the material parameter. Pass empty to set on main mesh only (Default: "")
function Paintable:SetMaterialScalarParameter(parameter_name, scalar, index, attachable_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a texture parameter in this Actor's material to an image on disk
---@param parameter_name string @The name of the material parameter
---@param texture_path string @The path to the texture
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
---@param attachable_id? string @The attachable ID (set with <code>AddSkeletalMeshAttached</code> or <code>AddStaticMeshAttached</code>) to apply the material parameter. Pass empty to set on main mesh only (Default: "")
function Paintable:SetMaterialTextureParameter(parameter_name, texture_path, index, attachable_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Vector parameter in this Actor's material
---@param parameter_name string @The name of the material parameter
---@param vector Vector @The value to set
---@param index? integer @The material index to apply (<code>-1</code> means all indices) (Default: -1)
---@param attachable_id? string @The attachable ID (set with <code>AddSkeletalMeshAttached</code> or <code>AddStaticMeshAttached</code>) to apply the material parameter. Pass empty to set on main mesh only (Default: "")
function Paintable:SetMaterialVectorParameter(parameter_name, vector, index, attachable_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Overrides this Actor's Physical Material with a new one
---@param physical_material_path string @The Physical Material to override
function Paintable:SetPhysicalMaterial(physical_material_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---A Cable represents a Physics Constraint which joins two Actors with a rope-like visual representation between them.
---@class Cable : Entity, Actor, Paintable
---@overload fun(location: Vector, enable_visuals?: boolean): Cable
Cable = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Attached the beginning of this cable to another Actor at a specific bone or relative location
---@param other Actor 
---@param relative_location? Vector @(Default: Vector(0, 0, 0))
---@param bone_name? string @(Default: "")
function Cable:AttachStartTo(other, relative_location, bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Attached the end of this cable to another Actor at a specific bone or relative location
---@param other Actor 
---@param relative_location? Vector @(Default: Vector(0, 0, 0))
---@param bone_name? string @(Default: "")
function Cable:AttachEndTo(other, relative_location, bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Detaches the End of this Cable
function Cable:DetachEnd() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Detaches the Start of this Cable
function Cable:DetachStart() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Set the overall settings for this cable (visuals only)
---@param length number @Rest length of the cable. Default is 100
---@param num_segments integer @How many segments the cable has. Default is 10
---@param solver_iterations integer @The number of solver iterations controls how 'stiff' the cable is. Default is 0
function Cable:SetCableSettings(length, num_segments, solver_iterations) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Set the forces the cable has applied (visuals only)
---@param force Vector @Force vector (world space) applied to all particles in cable. Default is Vector(0, 0, 0)
---@param gravity_scale? number @Scaling applied to world gravity affecting this cable. Default is 1 (Default: 1)
function Cable:SetForces(force, gravity_scale) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Physics Angular Limits of this cable
---@param swing_1_motion ConstraintMotion @Indicates whether the Swing1 limit is used
---@param swing_2_motion ConstraintMotion @Indicates whether the Swing2 limit is used
---@param twist_motion ConstraintMotion @Indicates whether the Twist limit is used
---@param swing_1_limit? number @Angle of movement along the XY plane. This defines the first symmetric angle of the cone (Default: 0)
---@param swing_2_limit? number @Angle of movement along the XZ plane. This defines the second symmetric angle of the cone (Default: 0)
---@param twist_limit? number @Symmetric angle of roll along the X-axis (Default: 0)
function Cable:SetAngularLimits(swing_1_motion, swing_2_motion, twist_motion, swing_1_limit, swing_2_limit, twist_limit) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Physics Linear Limits of this cable. If use_soft_constraint is enabled, then stiffness and damping will be used, otherwise restitution will be used.
---@param x_motion ConstraintMotion @Indicates the linear constraint applied along the X-axis. Free implies no constraint at all. Locked implies no movement along X is allowed. Limited implies the distance in the joint along all active axes must be less than the Distance provided
---@param y_motion ConstraintMotion @Indicates the linear constraint applied along the Y-axis. Free implies no constraint at all. Locked implies no movement along Y is allowed. Limited implies the distance in the joint along all active axes must be less than the Distance provided
---@param z_motion ConstraintMotion @Indicates the linear constraint applied along theZX-axis. Free implies no constraint at all. Locked implies no movement along Z is allowed. Limited implies the distance in the joint along all active axes must be less than the Distance provided
---@param limit? number @The distance allowed between between the two joint reference frames. Distance applies on all axes enabled (one axis means line, two axes implies circle, three axes implies sphere) (Default: 0)
---@param restitution? number @Controls the amount of bounce when the constraint is violated. A restitution value of 1 will bounce back with the same velocity the limit was hit. A value of 0 will stop dead (Default: 0)
---@param use_soft_constraint? boolean @Whether we want to use a soft constraint (spring) (Default: false)
---@param stiffness? number @Stiffness of the soft constraint. Only used when Soft Constraint is on (Default: 0)
---@param damping? number @Damping of the soft constraint. Only used when Soft Constraint is on (Default: 0)
function Cable:SetLinearLimits(x_motion, y_motion, z_motion, limit, restitution, use_soft_constraint, stiffness, damping) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Set the rendering settings of this cable (visuals only)
---@param width number @How wide the cable geometry is. Default is 6
---@param num_sides integer @Number of sides of the cable geometry. Default is 4
---@param tile_material integer @How many times to repeat the material along the length of the cable. Default is 1
function Cable:SetRenderingSettings(width, num_sides, tile_material) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Actor attached to Start
---@return Actor @the Actor or nil
function Cable:GetAttachedStartTo() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Actor attached to End
---@return Actor @the Actor or nil
function Cable:GetAttachedEndTo() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---CharacterSimple is a simpler Character implementation with basic Movement implementation. Aimed for custom NPCs or basic Pawns.
---@class CharacterSimple : Entity, Actor, Pawn, Paintable, Damageable
---@overload fun(location: Vector, rotation: Rotator, mesh: string|string, custom_animation_blueprint?: string, collision_type?: CollisionType, gravity_enabled?: boolean): CharacterSimple
CharacterSimple = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Changes the Character Mesh on the fly
---@param mesh_asset string|string 
---@param adjust_capsule_size boolean @Auto adjust the capsule size based on the Mesh size
function CharacterSimple:SetMesh(mesh_asset, adjust_capsule_size) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Plays an Animation Montage on this character
---@param animation_path string 
---@param slot_name? string @(Default: "")
---@param loop_indefinitely? boolean @(Default: false)
---@param blend_in_time? number @(Default: 0.25)
---@param blend_out_time? number @(Default: 0.25)
---@param play_rate? number @(Default: 1.0)
---@param stop_all_montages? boolean @Stops all running Montages from the same Group (Default: false)
function CharacterSimple:PlayAnimation(animation_path, slot_name, loop_indefinitely, blend_in_time, blend_out_time, play_rate, stop_all_montages) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Changes the Character Mesh on the fly
---@param mesh string|string 
---@param adjust_capsule_size boolean @Auto adjust the capsule size based on the Mesh size
function CharacterSimple:SetMesh(mesh, adjust_capsule_size) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the max acceleration
---@param acceleration integer @Default is 2048
function CharacterSimple:SetMaxAcceleration(acceleration) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Spring Arm Settings of this Character
---@param relative_location Vector 
---@param target_arm_length number 
---@param socket_offset Vector 
---@param enable_camera_lag boolean 
---@param camera_lag_speed number 
function CharacterSimple:SetSpringArmSettings(relative_location, target_arm_length, socket_offset, enable_camera_lag, camera_lag_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Rotation Settings of this Character
---@param rotation_rate Rotator 
---@param use_controller_desired_rotation boolean 
---@param orient_rotation_to_movement boolean 
function CharacterSimple:SetRotationSettings(rotation_rate, use_controller_desired_rotation, orient_rotation_to_movement) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Speed Settings of this Character
---@param max_walk_speed integer 
---@param max_walk_speed_crouched integer 
function CharacterSimple:SetSpeedSettings(max_walk_speed, max_walk_speed_crouched) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Pawn Settings of this Character
---@param use_controller_rotation_pitch boolean 
---@param use_controller_rotation_yaw boolean 
---@param use_controller_rotation_roll boolean 
function CharacterSimple:SetPawnSettings(use_controller_rotation_pitch, use_controller_rotation_yaw, use_controller_rotation_roll) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Animation Blueprint of this Character
---@param custom_animation_blueprint string 
function CharacterSimple:SetAnimationBlueprint(custom_animation_blueprint) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Calls an Animation Blueprint Event or Function<br/>Returns all Function return values on <strong>Client Side</strong>
---@param event_name string @Event or Function name
---@param ...? any @Sequence of arguments to pass to the event (Default: nil)
---@return any... @the function return values
function CharacterSimple:CallAnimationBlueprintEvent(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A File represents an entry to a system file.
---@class File
---@overload fun(file_path: string, truncate?: boolean): File
File = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns when a file was last modified in Unix time
---@param path string @Path to file
---@return integer @the last update time in unix time
function File.Time(path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Creates a Directory (for every folder passed)
---@param path string @Path to folder
---@return boolean @if succeeded
function File.CreateDirectory(path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Deletes a folder or file
---@param path string @Path to file or folder
---@return integer @amount of files deleted
function File.Remove(path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Verifies if a entry exists in the file system
---@param path string @Path to file or folder
---@return boolean @if exists
function File.Exists(path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if a path is a directory
---@param path string @Path to folder
---@return boolean @if is a directory
function File.IsDirectory(path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if a path is a file
---@param path string @Path to file
---@return boolean @if is a regular file
function File.IsRegularFile(path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list of all directories given a path, optionally with filters
---@param path_filter? string @Path filter (Default: "")
---@param max_depth? integer @The maximum depth to go further in the folders while searching. Pass -1 for maximum depth (Default: -1)
---@return string[] @List of directories
function File.GetDirectories(path_filter, max_depth) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list of all files in a directory, optionally with filters
---@param path_filter? string|table @Path filter (Default: "")
---@param extension_filter? string @E.g.: <code>.lua</code> (Default: "")
---@param max_depth? integer @The maximum depth to go further in the folders while searching. Pass -1 for maximum depth (Default: -1)
---@return string[] @List of files
function File.GetFiles(path_filter, extension_filter, max_depth) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Closes the file and destroys the entity
function File:Close() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Flushes content to the file
function File:Flush() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if the file status is End of File
---@return boolean @if is EOF
function File:IsEOF() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if the file status is Bad
---@return boolean @if status is Bad
function File:IsBad() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if the file status is Good
---@return boolean @if status is Good
function File:IsGood() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if the last operation has Failed
---@return boolean @if last operation failed
function File:HasFailed() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Reads characters from the File and returns it. Also moves the file pointer to the latest read position. Pass 0 to read the whole file
---@param length? integer @Length to be read from file, leave it empty to read the whole file (Default: 0)
---@return string @file data
function File:Read(length) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Reads characters from the File asynchronously.
---@param length integer @Length to be read from file, leave it empty to read the whole file
---@param callback function @Callback
function File:ReadAsync(length, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Reads and returns the next file line
---@return string @file line data
function File:ReadLine() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Reads the whole file as a JSON and returns it.
---@return table @parsed table
function File:ReadJSON() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Reads the whole file as a JSON and returns it asynchronously.
---@param callback function @Callback with the file read
function File:ReadJSONAsync(callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the file pointer to a specific position
---@param position integer @Position to offset the file pointer
function File:Seek(position) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the size of the file
---@return integer @file size
function File:Size() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Skips n (amount) positions from the current file pointer position
---@param amount integer @Amount to offset the file pointer
function File:Skip(amount) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the current file pointer position
---@return integer @current file pointer position
function File:Tell() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Writes the Data at the current position of the file
---@param data string @Data to write to the file
function File:Write(data) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Grenades are Pickables which Characters can grab and throw. It explodes after X seconds after thrown, causing damage around.
---@class Grenade : Entity, Actor, Paintable, Pickable
---@overload fun(location: Vector, rotation: Rotator, static_mesh_asset?: string, explosion_particles?: string, explosion_sound?: string, collision_type?: CollisionType, gravity_enabled?: boolean): Grenade
Grenade = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Forces this grenade to Explode
function Grenade:Explode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets Damage parameters of this Grenade
---@param base_damage? integer @Max damage when inner radius (Default: 90)
---@param minimum_damage? integer @Min damage when outer radius (Default: 0)
---@param damage_inner_radius? integer @Radius which damage will be 100% (Default: 200)
---@param damage_outer_radius? integer @Radius which damage will be interpoled through falloff (Default: 1000)
---@param damage_falloff? number @Lerp function between Max and Min damage (Default: 1)
function Grenade:SetDamage(base_damage, minimum_damage, damage_inner_radius, damage_outer_radius, damage_falloff) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set Time until Explosion after thrown
---@param time number @Time in seconds
function Grenade:SetTimeToExplode(time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set Impulse applied when throwing
---@param throw_force integer 
function Grenade:SetThrowForce(throw_force) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Damage at Inner Radius
---@return number 
function Grenade:GetBaseDamage() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Radius which BaseDamage will apply proportionally
---@return number 
function Grenade:GetDamageFalloff() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Radius which MinimumDamage will apply
---@return number 
function Grenade:GetDamageInnerRadius() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Radius which BaseDamage will apply
---@return number 
function Grenade:GetDamageOuterRadius() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Damage at Outer Radius
---@return number 
function Grenade:GetMinimumDamage() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Time until Explosion
---@return number 
function Grenade:GetTimeToExplode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Impulse applied when throwing
---@return number 
function Grenade:GetThrowForce() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Grenade, event_name: "Spawn", callback: fun(self: Grenade)): fun(self: Grenade) @Triggered when an Entity is spawned/created
---@overload fun(self: Grenade, event_name: "Destroy", callback: fun(self: Grenade)): fun(self: Grenade) @Triggered when an Entity is destroyed
---@overload fun(self: Grenade, event_name: "ValueChange", callback: fun(self: Grenade, key: string, value: any)): fun(self: Grenade, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Grenade, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Grenade, event_name: "DimensionChange", callback: fun(self: Grenade, old_dimension: integer, new_dimension: integer)): fun(self: Grenade, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Grenade, event_name: "Drop", callback: fun(self: Grenade, character: Character, was_triggered_by_player: boolean)): fun(self: Grenade, character: Character, was_triggered_by_player: boolean) @When a Character drops this Pickable
---@overload fun(self: Grenade, event_name: "Hit", callback: fun(self: Grenade, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: Grenade, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @When this Pickable hits something
---@overload fun(self: Grenade, event_name: "Interact", callback: fun(self: Grenade, character: Character): boolean?): fun(self: Grenade, character: Character): boolean? @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Grenade, event_name: "PickUp", callback: fun(self: Grenade, character: Character)): fun(self: Grenade, character: Character) @Triggered When a Character picks this up
---@overload fun(self: Grenade, event_name: "PullUse", callback: fun(self: Grenade, character: Character)): fun(self: Grenade, character: Character) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Grenade, event_name: "ReleaseUse", callback: fun(self: Grenade, character: Character)): fun(self: Grenade, character: Character) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
---@overload fun(self: Grenade, event_name: "Explode", callback: fun(self: Grenade)): fun(self: Grenade) @Triggered when the grenade has exploded
---@overload fun(self: Grenade, event_name: "Throw", callback: fun(self: Grenade, handler: Character)): fun(self: Grenade, handler: Character) @Triggered when the grenade has been thrown
function Grenade:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Grenade, event_name: "Spawn", callback: fun(self: Grenade)) @Triggered when an Entity is spawned/created
---@overload fun(self: Grenade, event_name: "Destroy", callback: fun(self: Grenade)) @Triggered when an Entity is destroyed
---@overload fun(self: Grenade, event_name: "ValueChange", callback: fun(self: Grenade, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Grenade, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Grenade, event_name: "DimensionChange", callback: fun(self: Grenade, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Grenade, event_name: "Drop", callback: fun(self: Grenade, character: Character, was_triggered_by_player: boolean)) @When a Character drops this Pickable
---@overload fun(self: Grenade, event_name: "Hit", callback: fun(self: Grenade, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @When this Pickable hits something
---@overload fun(self: Grenade, event_name: "Interact", callback: fun(self: Grenade, character: Character): boolean?) @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Grenade, event_name: "PickUp", callback: fun(self: Grenade, character: Character)) @Triggered When a Character picks this up
---@overload fun(self: Grenade, event_name: "PullUse", callback: fun(self: Grenade, character: Character)) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Grenade, event_name: "ReleaseUse", callback: fun(self: Grenade, character: Character)) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
---@overload fun(self: Grenade, event_name: "Explode", callback: fun(self: Grenade)) @Triggered when the grenade has exploded
---@overload fun(self: Grenade, event_name: "Throw", callback: fun(self: Grenade, handler: Character)) @Triggered when the grenade has been thrown
function Grenade:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---A Melee represents an Entity which can be Pickable by a Character and can be used to melee attack, Charactes can hold it with hands with pre-defined handling modes.
---@class Melee : Entity, Actor, Paintable, Pickable
---@overload fun(location: Vector, rotation: Rotator, asset: string, collision_type?: CollisionType, gravity_enabled?: boolean, handling_mode?: HandlingMode, crosshair_material?: string, can_use?: boolean): Melee
Melee = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets an Animation when attacking<br/><br/>You can add more than one animation, which will be selected randomly when attacking
---@param asset_path string @The Animation used when attacking
---@param play_rate number @The Animation Play Rate
---@param slot_Type AnimationSlotType @Whether to play it on upper body or full body
function Melee:AddAnimationCharacterUse(asset_path, play_rate, slot_Type) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Clears the Character Attack Animation list
function Melee:ClearAnimationsCharacterUse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Sound when hitting something<br/><br/>Note: Surfaces <b>Water</b> and <b>Flesh</b> already have default sounds and must be explicitly set to override
---@param surface_type SurfaceType @The surface to apply the sound. Use <code>SurfaceType.Default</code> to be the default to all hits
---@param asset_path string @The Sound used when attacking
---@param volume number 
---@param pitch number 
function Melee:SetImpactSound(surface_type, asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Sound when attacking
---@param asset_path string @The Sound used when attacking
function Melee:SetSoundUse(asset_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Base Damage
---@param damage? integer @The Base Damage value (Default: "")
function Melee:SetBaseDamage(damage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the times when to start applying damage and when to end. During this time the collision of the melee will be enabled and the damage will be applied if it hits something
---@param damage_start_time number @The initial time to start applying damage
---@param damage_duration_time number @The duration time to stop applying damage
function Melee:SetDamageSettings(damage_start_time, damage_duration_time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the cooldown between attacking
---@param cooldown number 
function Melee:SetCooldown(cooldown) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Animations when Character uses it
---@return string[] 
function Melee:GetAnimationsCharacterUse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Sound when Character uses it
---@return string 
function Melee:GetSoundUse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Base Damage
---@return integer 
function Melee:GetBaseDamage() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Cooldown between usages
---@return number 
function Melee:GetCooldown() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Melee, event_name: "Spawn", callback: fun(self: Melee)): fun(self: Melee) @Triggered when an Entity is spawned/created
---@overload fun(self: Melee, event_name: "Destroy", callback: fun(self: Melee)): fun(self: Melee) @Triggered when an Entity is destroyed
---@overload fun(self: Melee, event_name: "ValueChange", callback: fun(self: Melee, key: string, value: any)): fun(self: Melee, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Melee, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Melee, event_name: "DimensionChange", callback: fun(self: Melee, old_dimension: integer, new_dimension: integer)): fun(self: Melee, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Melee, event_name: "Drop", callback: fun(self: Melee, character: Character, was_triggered_by_player: boolean)): fun(self: Melee, character: Character, was_triggered_by_player: boolean) @When a Character drops this Pickable
---@overload fun(self: Melee, event_name: "Hit", callback: fun(self: Melee, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: Melee, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @When this Pickable hits something
---@overload fun(self: Melee, event_name: "Interact", callback: fun(self: Melee, character: Character): boolean?): fun(self: Melee, character: Character): boolean? @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Melee, event_name: "PickUp", callback: fun(self: Melee, character: Character)): fun(self: Melee, character: Character) @Triggered When a Character picks this up
---@overload fun(self: Melee, event_name: "PullUse", callback: fun(self: Melee, character: Character)): fun(self: Melee, character: Character) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Melee, event_name: "ReleaseUse", callback: fun(self: Melee, character: Character)): fun(self: Melee, character: Character) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
---@overload fun(self: Melee, event_name: "Attack", callback: fun(self: Melee, handler: Character)): fun(self: Melee, handler: Character) @Triggered when the Character effectively attacks with this Melee
function Melee:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Melee, event_name: "Spawn", callback: fun(self: Melee)) @Triggered when an Entity is spawned/created
---@overload fun(self: Melee, event_name: "Destroy", callback: fun(self: Melee)) @Triggered when an Entity is destroyed
---@overload fun(self: Melee, event_name: "ValueChange", callback: fun(self: Melee, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Melee, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Melee, event_name: "DimensionChange", callback: fun(self: Melee, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Melee, event_name: "Drop", callback: fun(self: Melee, character: Character, was_triggered_by_player: boolean)) @When a Character drops this Pickable
---@overload fun(self: Melee, event_name: "Hit", callback: fun(self: Melee, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @When this Pickable hits something
---@overload fun(self: Melee, event_name: "Interact", callback: fun(self: Melee, character: Character): boolean?) @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Melee, event_name: "PickUp", callback: fun(self: Melee, character: Character)) @Triggered When a Character picks this up
---@overload fun(self: Melee, event_name: "PullUse", callback: fun(self: Melee, character: Character)) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Melee, event_name: "ReleaseUse", callback: fun(self: Melee, character: Character)) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
---@overload fun(self: Melee, event_name: "Attack", callback: fun(self: Melee, handler: Character)) @Triggered when the Character effectively attacks with this Melee
function Melee:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Prop represents a Dynamic Mesh which can be spawned in the world, can be grabbed around by characters and have physics.
---@class Prop : Entity, Actor, Paintable
---@overload fun(location: Vector, rotation: Rotator, asset: string, collision_type?: CollisionType, gravity_enabled?: boolean, grab_mode?: GrabMode, ccd_mode?: CCDMode): Prop
Prop = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets ability to Characters to Grab this Prop
---@param grab_mode GrabMode @If the Prop will be able to be grabbable or not. Set to Auto to automatically define based on Prop's size.
function Prop:SetGrabMode(grab_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets the Physics damping of this Prop
---@param linear_damping number 
---@param angular_damping number 
function Prop:SetPhysicsDamping(linear_damping, angular_damping) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Changes the mesh in runtime
---@param asset string @asset
function Prop:SetMesh(asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Asset name
---@return string @asset name
function Prop:GetMesh() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Character (if existing) which is holding this
---@return Character? @the character that holds the object
function Prop:GetHandler() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets ability to Grab this Prop
---@return GrabMode 
function Prop:GetGrabMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Socket Transform in world space given a bone name
---@param socket_name string 
---@return { Location: Vector, Rotation: Rotator } 
function Prop:GetSocketTransform(socket_name) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Prop, event_name: "Spawn", callback: fun(self: Prop)): fun(self: Prop) @Triggered when an Entity is spawned/created
---@overload fun(self: Prop, event_name: "Destroy", callback: fun(self: Prop)): fun(self: Prop) @Triggered when an Entity is destroyed
---@overload fun(self: Prop, event_name: "ValueChange", callback: fun(self: Prop, key: string, value: any)): fun(self: Prop, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Prop, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Prop, event_name: "DimensionChange", callback: fun(self: Prop, old_dimension: integer, new_dimension: integer)): fun(self: Prop, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Prop, event_name: "Grab", callback: fun(self: Prop, character: Character)): fun(self: Prop, character: Character) @Triggered when Character grabs a Prop
---@overload fun(self: Prop, event_name: "Hit", callback: fun(self: Prop, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: Prop, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @Triggered when this Prop hits something
---@overload fun(self: Prop, event_name: "Interact", callback: fun(self: Prop, character: Character): boolean?): fun(self: Prop, character: Character): boolean? @When a Character interacts with this Prop (i.e. try to Grab it)
---@overload fun(self: Prop, event_name: "TakeDamage", callback: fun(self: Prop, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator?: Player, causer?: Actor)): fun(self: Prop, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator?: Player, causer?: Actor) @When Prop takes Damage
---@overload fun(self: Prop, event_name: "UnGrab", callback: fun(self: Prop, character: Character)): fun(self: Prop, character: Character) @Triggered when this Prop is ungrabbed
function Prop:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Prop, event_name: "Spawn", callback: fun(self: Prop)) @Triggered when an Entity is spawned/created
---@overload fun(self: Prop, event_name: "Destroy", callback: fun(self: Prop)) @Triggered when an Entity is destroyed
---@overload fun(self: Prop, event_name: "ValueChange", callback: fun(self: Prop, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Prop, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Prop, event_name: "DimensionChange", callback: fun(self: Prop, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Prop, event_name: "Grab", callback: fun(self: Prop, character: Character)) @Triggered when Character grabs a Prop
---@overload fun(self: Prop, event_name: "Hit", callback: fun(self: Prop, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @Triggered when this Prop hits something
---@overload fun(self: Prop, event_name: "Interact", callback: fun(self: Prop, character: Character): boolean?) @When a Character interacts with this Prop (i.e. try to Grab it)
---@overload fun(self: Prop, event_name: "TakeDamage", callback: fun(self: Prop, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator?: Player, causer?: Actor)) @When Prop takes Damage
---@overload fun(self: Prop, event_name: "UnGrab", callback: fun(self: Prop, character: Character)) @Triggered when this Prop is ungrabbed
function Prop:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Scene Capture is an Actor which captures a fully dynamic image of the scene into a Texture. It captures the scene from its view frustum, stores that view as an image, which is then used within a Material.
---@class SceneCapture : Entity, Actor
---@overload fun(location?: Vector, rotation?: Rotator, width?: integer, height?: integer, render_rate?: number, view_distance?: number, fov_angle?: number, enable_distance_optimization?: boolean): SceneCapture
SceneCapture = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Adds an Actor to the Render Only list<br/><br/>Note: adding one actor to this will make the SceneCapture only to render those Actors.
---@param actor Actor 
function SceneCapture:AddRenderActor(actor) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Removes an Actor from the Render Only list
---@param actor Actor 
function SceneCapture:RemoveRenderActor(actor) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Clears the Render Only list
function SceneCapture:ClearRenderActors() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Stops or Restore Capturing
---@param freeze boolean 
function SceneCapture:SetFreeze(freeze) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Takes a snapshot of the SceneCapture and returns a Base64 of it
---@param image_format? ImageFormat @Which format to generate - JPEG is fastest but discards Alpha channel (Default: ImageFormat.JPEG)
---@return string 
function SceneCapture:EncodeToBase64(image_format) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Takes a snapshot of the SceneCapture and returns a Base64 of it (asynchronously)
---@param image_format? ImageFormat @Which format to generate - JPEG is fastest but discards Alpha channel (Default: ImageFormat.JPEG)
---@param callback function @Callback
function SceneCapture:EncodeToBase64Async(image_format, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the FOV
---@param angle number 
function SceneCapture:SetFOVAngle(angle) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables/Disables rendering features from being captured<br/>A complete list of available flags can be found in the <a href='https://docs.unrealengine.com/5.0/en-US/API/Runtime/Engine/FEngineShowFlags/'>Official Unreal Documentation</a>
---@param flag string 
---@param enable boolean 
function SceneCapture:SetShowFlag(flag, enable) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Change the output Texture size<br>Note: too high texture will make the capture slower and will affect game performance
---@param width integer 
---@param height integer 
function SceneCapture:Resize(width, height) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set how frequent is the capture<br>Note: Setting to 0 will make it capture every frame
---@param render_rate number 
function SceneCapture:SetRenderRate(render_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables or not the rendering frequency optimization if the entities with this Material are too far
---@param enabled boolean 
function SceneCapture:SetDistanceOptimizationEnabled(enabled) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: SceneCapture, event_name: "Spawn", callback: fun(self: SceneCapture)): fun(self: SceneCapture) @Triggered when an Entity is spawned/created
---@overload fun(self: SceneCapture, event_name: "Destroy", callback: fun(self: SceneCapture)): fun(self: SceneCapture) @Triggered when an Entity is destroyed
---@overload fun(self: SceneCapture, event_name: "ValueChange", callback: fun(self: SceneCapture, key: string, value: any)): fun(self: SceneCapture, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: SceneCapture, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: SceneCapture, event_name: "DimensionChange", callback: fun(self: SceneCapture, old_dimension: integer, new_dimension: integer)): fun(self: SceneCapture, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: SceneCapture, event_name: "Capture", callback: fun(self: SceneCapture)): fun(self: SceneCapture) @Triggered when this SceneCapture does an update/renders a frame
function SceneCapture:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: SceneCapture, event_name: "Spawn", callback: fun(self: SceneCapture)) @Triggered when an Entity is spawned/created
---@overload fun(self: SceneCapture, event_name: "Destroy", callback: fun(self: SceneCapture)) @Triggered when an Entity is destroyed
---@overload fun(self: SceneCapture, event_name: "ValueChange", callback: fun(self: SceneCapture, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: SceneCapture, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: SceneCapture, event_name: "DimensionChange", callback: fun(self: SceneCapture, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: SceneCapture, event_name: "Capture", callback: fun(self: SceneCapture)) @Triggered when this SceneCapture does an update/renders a frame
function SceneCapture:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Class for playing in-game 2D and 3D sounds.
---@class Sound : Entity, Actor
---@overload fun(location: Vector, asset: string, is_2D_sound?: boolean, auto_destroy?: boolean, sound_type?: SoundType, volume?: number, pitch?: number, inner_radius?: number, falloff_distance?: number, attenuation_function?: AttenuationFunction, keep_playig_when_silent?: boolean, loop_mode?: SoundLoopMode): Sound
Sound = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Plays the sound with a fade effect
---@param fade_in_duration number 
---@param fade_volume_level? number @(Default: 1)
---@param start_time? number @(Default: 0)
function Sound:FadeIn(fade_in_duration, fade_volume_level, start_time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Stops the sound with a fade effect
---@param fade_out_duration number 
---@param fade_volume_level? number @(Default: 0)
---@param destroy_after_fadeout? boolean @(Default: false)
function Sound:FadeOut(fade_out_duration, fade_volume_level, destroy_after_fadeout) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Starts the sound
---@param start_time? number @(Default: 0)
function Sound:Play(start_time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---If a 3D Sound, sets the distance which the sound is inaudible
---@param falloff_distance number 
function Sound:SetFalloffDistance(falloff_distance) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---If a 3D Sound, sets the distance within the volume is 100%
---@param inner_radius number 
function Sound:SetInnerRadius(inner_radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets lowpass filter frequency. Sets 0 to disable it.
---@param frequency number 
function Sound:SetLowPassFilter(frequency) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Pauses the sound
---@param pause? boolean @(Default: true)
function Sound:SetPaused(pause) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Sound's pitch
---@param new_pitch number 
function Sound:SetPitch(new_pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Sound's volume
---@param new_volume number @0-1
function Sound:SetVolume(new_volume) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Stops the sound
function Sound:Stop() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Stops the sound after the provided delay
---@param delay number 
function Sound:StopDelayed(delay) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets if the sound is 2D
---@return boolean 
function Sound:Is2D() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets if the sound is playing
---@return boolean 
function Sound:IsPlaying() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the duration of the Sound
---@return number 
function Sound:GetDuration() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return number 
function Sound:GetPitch() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return number 
function Sound:GetVolume() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return number 
function Sound:GetLowPassFilter() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return number 
function Sound:GetInnerRadius() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return number 
function Sound:GetFalloffDistance() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return number 
function Sound:GetSoundType() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return string 
function Sound:GetPath() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---The Widget class supports spawning Unreal Widgets classes through scripting and manipulate them such as Blueprints!
---@class Widget : Entity
---@overload fun(blueprint_path: string): Widget
---@overload fun(native_widget: NativeWidget): Widget
Widget = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Spawns a 3D Widget actor rendering this Widget in the world
---@param location? Vector @(Default: Vector(0, 0, 0))
---@param rotation? Rotator @(Default: Rotator(0, 0, 0))
---@param widget_space? WidgetSpace @(Default: WidgetSpace.World)
---@param auto_size? bool @(Default: false)
---@param size? Vector2D @Only works if auto_size = false (Default: Vector2D(500, 500))
---@param auto_repaint_rate? number @Leaves -1 to repaint every frame (Default: -1)
---@param pivot? Vector2D @(Default: Vector2D(0.5, 0.5))
---@return Widget3D 
function Widget:SpawnWidget3D(location, rotation, widget_space, auto_size, size, auto_repaint_rate, pivot) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the visibility in screen
---@param visibility WidgetVisibility 
function Widget:SetVisibility(visibility) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns the current WebUI visibility
---@return WidgetVisibility 
function Widget:GetVisibility() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables the focus on this Widget (i.e. can receive Keyboard input and will trigger input events<br/>Note: Only one Widget can have focus per time.
function Widget:SetFocus() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Puts this Widget in the front of all WebUIs and Widgets. Note: You can only call it if the Widget is parented to the Viewport!
function Widget:BringToFront() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Adds it to the game's viewport and fills the entire screen
function Widget:AddToViewport() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Adds a new child widget to this Widget container, if this is a <a href='https://docs.unrealengine.com/5.1/en-US/API/Runtime/UMG/Components/UPanelWidget/'>Panel</a>
---@param other WebUI|Widget 
function Widget:AddChild(other) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the widget for a given <a href='https://docs.unrealengine.com/5.0/en-US/using-named-slots-in-umg-for-unreal-engine/'>slot</a> by name, if this is a <a href='https://docs.unrealengine.com/5.1/en-US/API/Runtime/UMG/Blueprint/UUserWidget/'>UserWidget</a>
---@param slot_name string 
---@param widget? Widget @Pass it nil to remove it
function Widget:SetContentForSlot(slot_name, widget) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Layout as Canvas on Screen.<br/><br/>Note: This method only works if this Widget is child of a Canvas Panel.<br/><br/><strong>Anchors</strong>:<br/><br/><img src='/img/docs/anchors.webp' />
---@param screen_location/offset_left_top? Vector2D @(Default: Vector(0, 0))
---@param size/offset_right_bottom? Vector2D @(Default: Vector(0, 0))
---@param anchors_min? Vector2D @(Default: Vector(0, 0))
---@param anchors_max? Vector2D @(Default: Vector(1, 1))
---@param alignment? Vector2D @(Default: Vector(0.5, 0.5))
function Widget:SetCanvasLayout(screen_location/offset_left_top, size/offset_right_bottom, anchors_min, anchors_max, alignment) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Calls a Blueprint Event or Function<br/>Returns all Function return values on <strong>Client Side</strong>
---@param event_name string @Event or Function name
---@param ...? any @Sequence of arguments to pass to the event (Default: nil)
---@return any... @the function return values
function Widget:CallBlueprintEvent(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Assigns and Binds a Blueprint Event Dispatcher
---@param dispatcher_name string @Event Dispatcher name
---@param callback function @Callback function to call
---@return function @the callback itself
function Widget:BindBlueprintEventDispatcher(dispatcher_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Unbinds a Blueprint Event Dispatcher
---@param dispatcher_name string @Event Dispatcher name
---@param callback? function @Optional callback to unbind
function Widget:UnbindBlueprintEventDispatcher(dispatcher_name, callback?) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets a Blueprint Property/Variable value directly
---@param property_name string 
---@param value any 
function Widget:SetBlueprintPropertyValue(property_name, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Blueprint Property/Variable value
---@param property_name string 
---@return any @the value
function Widget:GetBlueprintPropertyValue(property_name) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Widget, event_name: "Spawn", callback: fun(self: Widget)): fun(self: Widget) @Triggered when an Entity is spawned/created
---@overload fun(self: Widget, event_name: "Destroy", callback: fun(self: Widget)): fun(self: Widget) @Triggered when an Entity is destroyed
---@overload fun(self: Widget, event_name: "ValueChange", callback: fun(self: Widget, key: string, value: any)): fun(self: Widget, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Widget, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
function Widget:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Widget, event_name: "Spawn", callback: fun(self: Widget)) @Triggered when an Entity is spawned/created
---@overload fun(self: Widget, event_name: "Destroy", callback: fun(self: Widget)) @Triggered when an Entity is destroyed
---@overload fun(self: Widget, event_name: "ValueChange", callback: fun(self: Widget, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Widget, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
function Widget:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---<b>Pickables</b> are special Actors which can be <b>grabbed</b>, <b>held</b> and <b>used</b> by Characters.
---@class Pickable
Pickable = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spawns and attaches a SkeletalMesh to this Pickable, the SkeletalMesh must have the same skeleton used by this Actor's mesh, and will follow all animations from it. Uses a custom ID to be used for removing/customizing it afterwards
---@param id string @Used further for removing or applying material settings on it
---@param skeletal_mesh_path string @Path to SkeletalMesh asset to attach
---@param use_parent_bounds? boolean @If true, this component uses its parents bounds when attached. This can be a significant optimization with many components attached together (Default: true)
function Pickable:AddSkeletalMeshAttached(id, skeletal_mesh_path, use_parent_bounds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spawns and attaches a StaticMesh to this Pickable in a Socket with a relative location and rotation. Uses a custom ID to be used for removing/customizing it afterwards
---@param id string @Unique ID to assign to the StaticMesh
---@param static_mesh_path string @Path to StaticMesh asset to attach
---@param socket? string @Bone socket to attach to (Default: "")
---@param relative_location? Vector @Relative location (Default: Vector(0, 0, 0))
---@param relative_rotation? Rotator @Relative rotation (Default: Rotator(0, 0, 0))
---@param use_parent_bounds? boolean @If true, this component uses its parents bounds when attached. This can be a significant optimization with many components attached together (Default: true)
function Pickable:AddStaticMeshAttached(id, static_mesh_path, socket, relative_location, relative_rotation, use_parent_bounds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Static Meshes attached to this entity
---@return string[] @the key as the Attached ID, and the value as the Asset Path
function Pickable:GetAllStaticMeshAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Skeletal Meshes attached to this entity
---@return string[] @the key as the Attached ID, and the value as the Asset Path
function Pickable:GetAllSkeletalMeshAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes, if it exists, a SkeletalMesh from this Pickable given its custom ID
---@param id string @Unique ID of the SkeletalMesh to remove
function Pickable:RemoveSkeletalMeshAttached(id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Static Mesh Attached location and rotation
---@param id string @Unique ID of the StaticMesh set with AddStaticMeshAttached
---@param relative_location Vector @New relative location
---@param relative_rotation Rotator @New relative rotation
function Pickable:SetStaticMeshAttachedTransform(id, relative_location, relative_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes, if it exists, a StaticMesh from this Pickable given its custom ID
---@param id string @Unique ID of the StaticMesh to remove
function Pickable:RemoveStaticMeshAttached(id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes all StaticMeshes attached
function Pickable:RemoveAllStaticMeshesAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes all SkeletalMeshes attached
function Pickable:RemoveAllSkeletalMeshesAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Pulls the usage of this Pickable (will start firing if this is a weapon)
---@param release_use_after? number @Time in seconds to automatically release the usage (-1 will not release, 0 will release one tick after) (Default: -1)
function Pickable:PullUse(release_use_after) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Releases the usage of this Pickable (will stop firing if this is a weapon)
function Pickable:ReleaseUse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Attachment Settings for this Pickable (how it attaches to the Character when Picking up)
---@param relative_location Vector @Location relative to the Socket
---@param relative_rotation? Rotator @Rotation relative to the Socket (Default: Rotator(0, 0, 0))
---@param socket? string @Character Socket to attach to when picked up (Default: hand_r_socket)
function Pickable:SetAttachmentSettings(relative_location, relative_rotation, socket) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the crosshair material for this Pickable
---@param material_asset string @Asset path to the crosshair material
function Pickable:SetCrosshairMaterial(material_asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Pickable can be picked up from ground by the player
---@param is_pickable boolean 
function Pickable:SetPickable(is_pickable) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the name of the asset this Pickable uses
---@return string 
function Pickable:GetMesh() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Character, if it exists, that's holding this Pickable
---@return Character? 
function Pickable:GetHandler() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Handling Mode of this Pickable
---@return HandlingMode 
function Pickable:GetHandlingMode() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Pickable, event_name: "Drop", callback: fun(self: Pickable, character: Character, was_triggered_by_player: boolean)): fun(self: Pickable, character: Character, was_triggered_by_player: boolean) @When a Character drops this Pickable
---@overload fun(self: Pickable, event_name: "Hit", callback: fun(self: Pickable, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: Pickable, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @When this Pickable hits something
---@overload fun(self: Pickable, event_name: "Interact", callback: fun(self: Pickable, character: Character): boolean?): fun(self: Pickable, character: Character): boolean? @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Pickable, event_name: "PickUp", callback: fun(self: Pickable, character: Character)): fun(self: Pickable, character: Character) @Triggered When a Character picks this up
---@overload fun(self: Pickable, event_name: "PullUse", callback: fun(self: Pickable, character: Character)): fun(self: Pickable, character: Character) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Pickable, event_name: "ReleaseUse", callback: fun(self: Pickable, character: Character)): fun(self: Pickable, character: Character) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
function Pickable:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Pickable, event_name: "Drop", callback: fun(self: Pickable, character: Character, was_triggered_by_player: boolean)) @When a Character drops this Pickable
---@overload fun(self: Pickable, event_name: "Hit", callback: fun(self: Pickable, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @When this Pickable hits something
---@overload fun(self: Pickable, event_name: "Interact", callback: fun(self: Pickable, character: Character): boolean?) @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Pickable, event_name: "PickUp", callback: fun(self: Pickable, character: Character)) @Triggered When a Character picks this up
---@overload fun(self: Pickable, event_name: "PullUse", callback: fun(self: Pickable, character: Character)) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Pickable, event_name: "ReleaseUse", callback: fun(self: Pickable, character: Character)) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
function Pickable:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Class for spawning a dynamic Web Browser.
---@class WebUI : Entity
---@overload fun(name: string, path: string, visibility?: WidgetVisibility, is_transparent?: boolean, auto_resize?: boolean, width?: integer, height?: integer): WebUI
WebUI = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Puts this WebUI in the front of all WebUIs and Widgets
function WebUI:BringToFront() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Calls an Event on the Browser's JavaScript
---@param event_name string @The Event Name to trigger the event
---@param ... any @Arguments to pass to the event
function WebUI:CallEvent(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Loads a new File/URL in this Browser
---@param url string 
function WebUI:LoadURL(url) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Loads a pure HTML in this Browser
---@param html string 
function WebUI:LoadHTML(html) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets this WebUI name
---@return string 
function WebUI:GetName() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Executes a JavaScript code in the Browser<br/>Note: This method is experimental and should be used cautiously. Events are still the preferred way of communicating between Packages and WebUI.
---@param javascript_code string 
function WebUI:ExecuteJavaScript(javascript_code) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables the focus on this browser (i.e. can receive Keyboard input and will trigger input events<br/>Note: Only one browser can have focus per time.
function WebUI:SetFocus() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Removes the focus from this WebUI (and sets it back to game viewport)<br/>You MUST call this after you don't need keyboard input anymore
function WebUI:RemoveFocus() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Layout as Canvas on Screen. <strong>Anchors</strong>:<br/><br/><img src='/img/docs/anchors.webp' />
---@param screen_location/offset_left_top? Vector2D @(Default: Vector(0, 0))
---@param size/offset_right_bottom? Vector2D @(Default: Vector(0, 0))
---@param anchors_min? Vector2D @(Default: Vector(0, 0))
---@param anchors_max? Vector2D @(Default: Vector(1, 1))
---@param alignment? Vector2D @(Default: Vector(0.5, 0.5))
function WebUI:SetLayout(screen_location/offset_left_top, size/offset_right_bottom, anchors_min, anchors_max, alignment) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Freezes the WebUI Rendering to the surface (it will still execute the JS under the hood)
---@param freeze boolean 
function WebUI:SetFreeze(freeze) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the visibility in screen
---@param visibility WidgetVisibility 
function WebUI:SetVisibility(visibility) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Spawns a Sound entity to plays this WebUI sound
---@param location? Vector @(Default: Vector(0, 0, 0))
---@param is_2d? boolean @(Default: true)
---@param volume? number @(Default: 1.0)
---@param inner_radius? integer @(Default: 400)
---@param falloff_distance? integer @(Default: 3600)
---@param attenuation_function? AttenuationFunction @(Default: AttenuationFunction.Linear)
---@return Sound 
function WebUI:SpawnSound(location, is_2d, volume, inner_radius, falloff_distance, attenuation_function) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sends a Mouse Event into the WebUI programatically
---@param mouse_x integer @Position X of the mouse
---@param mouse_y integer @Position Y of the mouse
---@param delta_x number 
---@param delta_y number 
function WebUI:SendMouseWheelEvent(mouse_x, mouse_y, delta_x, delta_y) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sends a Key Event into the WebUI programatically
---@param key_type WebUIKeyType 
---@param key_code integer 
---@param modifiers? WebUIModifier @Supports several modifiers separating by <code>|</code> (using bit-wise operations) (Default: WebUIModifier.None)
function WebUI:SendKeyEvent(key_type, key_code, modifiers) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sends a Mouse Move Event into the WebUI programatically
---@param mouse_x integer @Position X of the mouse
---@param mouse_y integer @Position Y of the mouse
---@param modifiers? WebUIModifier @Supports several modifiers separating by <code>|</code> (using bit-wise operations) (Default: WebUIModifier.None)
---@param mouse_leave? boolean @(Default: false)
function WebUI:SendMouseMoveEvent(mouse_x, mouse_y, modifiers, mouse_leave) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---You must send both Down and Up to make it work properly
---@param mouse_x integer @Position X of the mouse
---@param mouse_y integer @Position Y of the mouse
---@param mouse_type WebUIMouseType @Which mouse button
---@param is_mouse_up boolean @Whether the event was up or down
---@param modifiers? WebUIModifier @Supports several modifiers separating by <code>|</code> (using bit-wise operations) (Default: WebUIModifier.None)
---@param click_count? integer @Use 2 for double click event (Default: 1)
function WebUI:SendMouseClickEvent(mouse_x, mouse_y, mouse_type, is_mouse_up, modifiers, click_count) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current size of this WebUI
---@return Vector2D 
function WebUI:GetSize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns the current WebUI visibility
---@return WidgetVisibility 
function WebUI:GetVisibility() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns if this WebUI is currently frozen
---@return boolean 
function WebUI:IsFrozen() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: WebUI, event_name: "Spawn", callback: fun(self: WebUI)): fun(self: WebUI) @Triggered when an Entity is spawned/created
---@overload fun(self: WebUI, event_name: "Destroy", callback: fun(self: WebUI)): fun(self: WebUI) @Triggered when an Entity is destroyed
---@overload fun(self: WebUI, event_name: "ValueChange", callback: fun(self: WebUI, key: string, value: any)): fun(self: WebUI, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: WebUI, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: WebUI, event_name: "Fail", callback: fun(error_code: integer, message: string)): fun(error_code: integer, message: string) @Triggered when this page fails to load
---@overload fun(self: WebUI, event_name: "Ready", callback: fun()): fun() @Triggered when this page is fully loaded
function WebUI:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: WebUI, event_name: "Spawn", callback: fun(self: WebUI)) @Triggered when an Entity is spawned/created
---@overload fun(self: WebUI, event_name: "Destroy", callback: fun(self: WebUI)) @Triggered when an Entity is destroyed
---@overload fun(self: WebUI, event_name: "ValueChange", callback: fun(self: WebUI, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: WebUI, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: WebUI, event_name: "Fail", callback: fun(error_code: integer, message: string)) @Triggered when this page fails to load
---@overload fun(self: WebUI, event_name: "Ready", callback: fun()) @Triggered when this page is fully loaded
function WebUI:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Canvas is an entity which you can draw onto it.
---@class Canvas
---@overload fun(is_visible?: boolean, clear_color?: Color, auto_repaint_rate?: number, should_clear_before_update?: boolean, auto_resize?: boolean, width?: integer, height?: integer, screen_position?: Vector2D): Canvas
Canvas = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws an unfilled box on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event
---@param screen_position Vector2D 
---@param screen_size Vector2D 
---@param thickness number 
---@param render_color? Color @(Default: Color.WHITE)
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawBox(screen_position, screen_size, thickness, render_color, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a line on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event
---@param screen_position_a Vector2D 
---@param screen_position_b Vector2D 
---@param thickness number 
---@param render_color Color 
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawLine(screen_position_a, screen_position_b, thickness, render_color, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Material on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event<br/><br/><strong>Note:</strong> Due how Unreal handles Render Targets, drawing material on Canvas result on a weird translucent effect. Hope in the future to be improved.
---@param material_path string 
---@param screen_position Vector2D 
---@param screen_size Vector2D 
---@param coordinate_position Vector2D 
---@param coordinate_size? Vector2D @(Default: Vector2D(1, 1))
---@param rotation? number @(Default: 0)
---@param pivot_point? Vector2D @(Default: Vector2D(0.5, 0.5))
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawMaterial(material_path, screen_position, screen_size, coordinate_position, coordinate_size, rotation, pivot_point, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a WebUI on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event<br/><br/><strong>Note:</strong> Due how Unreal handles Render Targets, drawing material on Canvas result on a weird translucent effect. Hope in the future to be improved.
---@param webui_entity WebUI 
---@param screen_position Vector2D 
---@param screen_size Vector2D 
---@param coordinate_position Vector2D 
---@param coordinate_size? Vector2D @(Default: Vector2D(1, 1))
---@param rotation? number @(Default: 0)
---@param pivot_point? Vector2D @(Default: Vector2D(0.5, 0.5))
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawMaterialFromWebUI(webui_entity, screen_position, screen_size, coordinate_position, coordinate_size, rotation, pivot_point, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a SceneCapture on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event<br/><br/><strong>Note:</strong> Due how Unreal handles Render Targets, drawing material on Canvas result on a weird translucent effect. Hope in the future to be improved.
---@param scenecapture_entity SceneCapture 
---@param screen_position Vector2D 
---@param screen_size Vector2D 
---@param coordinate_position Vector2D 
---@param coordinate_size? Vector2D @(Default: Vector2D(1, 1))
---@param rotation? number @(Default: 0)
---@param pivot_point? Vector2D @(Default: Vector2D(0.5, 0.5))
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawMaterialFromSceneCapture(scenecapture_entity, screen_position, screen_size, coordinate_position, coordinate_size, rotation, pivot_point, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Text on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event<br/><br/>Shadow and Outline won't work properly with Transparent <code>clear_color</code>
---@param text string 
---@param screen_position Vector2D 
---@param font_type? FontType @(Default: FontType.Roboto)
---@param font_size? integer @(Default: 12)
---@param text_color? Color @(Default: Color.WHITE)
---@param kerning? number @(Default: 0)
---@param center_x? boolean @(Default: false)
---@param center_y? boolean @(Default: false)
---@param shadow_color? Color @(Default: Color.TRANSPARENT)
---@param shadow_offset? Vector2D @(Default: Vector2D(1, 1))
---@param outlined? boolean @(Default: false)
---@param outline_color? Color @(Default: Color.BLACK)
function Canvas:DrawText(text, screen_position, font_type, font_size, text_color, kerning, center_x, center_y, shadow_color, shadow_offset, outlined, outline_color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Texture on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event
---@param texture_path string 
---@param screen_position Vector2D 
---@param screen_size Vector2D 
---@param coordinate_position Vector2D 
---@param coordinate_size? Vector2D @(Default: Vector2D(1, 1))
---@param render_color? Color @(Default: Color.WHITE)
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
---@param rotation? number @(Default: 0)
---@param pivot_point? Vector2D @(Default: Vector2D(0.5, 0.5))
function Canvas:DrawTexture(texture_path, screen_position, screen_size, coordinate_position, coordinate_size, render_color, blend_mode, rotation, pivot_point) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a N-Polygon on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event
---@param texture_path string @Pass empty to use default white Texture
---@param screen_position Vector2D 
---@param radius? Vector2D @(Default: Vector2D(1, 1))
---@param number_of_sides? integer @(Default: 3)
---@param render_color? Color @(Default: Color.WHITE)
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawPolygon(texture_path, screen_position, radius, number_of_sides, render_color, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a fille Rect on the Canvas<br/></br>This method can only be called from inside <code>Update</code> event
---@param texture_path string @Pass empty to use default white Texture
---@param screen_position Vector2D 
---@param screen_size Vector2D 
---@param render_color? Color @(Default: Color.WHITE)
---@param blend_mode? BlendMode @(Default: BlendMode.Opaque)
function Canvas:DrawRect(texture_path, screen_position, screen_size, render_color, blend_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets it to -1 to stop auto repainting or 0 to repaint every frame
---@param auto_repaint_rate boolean 
function Canvas:SetAutoRepaintRate(auto_repaint_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the Canvas Size
---@return Vector2D @the current size
function Canvas:GetSize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Resizes the Canvas if not using auto_resize
---@param width integer 
---@param height integer 
function Canvas:Resize(width, height) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Canvas Screen Position offset
---@param screen_position Vector2D 
function Canvas:SetScreenPosition(screen_position) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets if the canvas should auto resize to screen size
---@param auto_resize boolean 
function Canvas:SetAutoResize(auto_resize) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets if it's visible on screen
---@param visible boolean 
function Canvas:SetVisibility(visible) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Forces the repaint, this will trigger Update event
function Canvas:Repaint() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Clear the Canvas with a specific Color
---@param clear_color Color 
function Canvas:Clear(clear_color) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Canvas, event_name: "Update", callback: fun(self: Canvas, width: integer, height: integer)): fun(self: Canvas, width: integer, height: integer) @Called when the Canvas needs to be painted<br/><br/>You can only call <code>:Draw...()</code> methods from inside this event
function Canvas:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Canvas, event_name: "Update", callback: fun(self: Canvas, width: integer, height: integer)) @Called when the Canvas needs to be painted<br/><br/>You can only call <code>:Draw...()</code> methods from inside this event
function Canvas:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---<b>Entity</b> is the base for all Classes, and all those entities share the same <b>Methods</b> and <b>Events</b> described in this page.
---@class Entity
Entity = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a table containing all Entities of the class this is called on
---@return Entity[] @Copy of table containing all Entities
function Entity.GetAll() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a specific Entity of this class at an index
---@param index integer @The index of the Entity
---@return Entity @Entity at index
function Entity.GetByIndex(index) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns how many Entities of this class exist
---@return integer @Number of Entities of this class
function Entity.GetCount() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns an iterator with all Entities of this class to be used with <code>pairs()</code>. This is a more performant method than <code>GetAll()</code>, as it will return the iterator to access the Entities directly instead of creating and returning a copy of the Entities table.<br><br><b>Note:</b> Destroying Entities from inside a <code>GetPairs()</code> loop will cause the iterable to change size during the process. If you want to loop-and-destroy, please use <code>GetAll()</code>.
---@return iterator @Iterator with all Entities of this class
function Entity.GetPairs() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Inherits this class with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@param name string @The name of the new Class
---@param custom_values? table @An optional table with custom values to be set in the inherited class table
---@return table @The new Class table
function Entity.Inherit(name, custom_values) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list of all directly inherited classes from this Class created with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@param recursively? boolean @Returns all inherited children (Default: false)
---@return table[] @All children Classes
function Entity.GetInheritedClasses(recursively) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the parent class if this Class was created with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@return table? @The parent class
function Entity.GetParentClass() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if this Class is child of another class if this Class was created with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@param class table @The other class to check
---@return boolean 
function Entity.IsChildOf(class) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Subscribes to a custom event called from server
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @Callback that was passed (useful for unsubscribing later if your callback is an anonymous function)
function Entity.SubscribeRemote(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the universal network ID of this Entity (same on both client and server)
---@return integer 
function Entity:GetID() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the class of this entity
---@return table 
function Entity:GetClass() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Recursively checks if this entity is <a href='/docs/core-concepts/scripting/inheriting-classes'>inherited</a> from a Class
---@param class table @The Class
---@return boolean 
function Entity:IsA(class) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Subscribes to a custom event called from server on this specific entity
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @Callback that was passed (useful for unsubscribing later if your callback is an anonymous function)
function Entity:SubscribeRemote(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a value in this Entity, which can be accessed by any package (optionally sync on clients if called from server)<br><br>Please refer to <a href="/docs/core-concepts/scripting/entity-values">Entity Values</a> for more information
---@param key string 
---@param value any 
---@param sync_on_clients? boolean @Server side parameter, if enabled will sync this value with all clients (Default: false)
function Entity:SetValue(key, value, sync_on_clients) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a <a href='/docs/core-concepts/scripting/entity-values'>Value</a> stored on this Entity at the given key. Please refer to <a href="/docs/core-concepts/scripting/entity-values">Entity Values</a> for more information
---@param key string 
---@param fallback any @Fallback value if key doesn't exist
---@return any @Value at key or fallback if key doesn't exist
function Entity:GetValue(key, fallback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gets a list of all values keys
---@return string[] @a list with all values keys
function Entity:GetAllValuesKeys() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Destroys this Entity
function Entity:Destroy() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns true if this Entity is valid (i.e. wasn't destroyed and points to a valid Entity)
---@return boolean 
function Entity:IsValid() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Calls a custom remote event directly on this entity to a specific Player
---@param event_name string @The Event Name to trigger the event
---@param player Player @The remote player to send this event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Entity:CallRemoteEvent(event_name, player, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Calls a custom remote event directly on this entity
---@param event_name string @The Event Name to trigger the event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Entity:CallRemoteEvent(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Calls a custom remote event directly on this entity to all Players
---@param event_name string @The Event Name to trigger the event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Entity:BroadcastRemoteEvent(event_name, ...) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Entity, event_name: "Spawn", callback: fun(self: Entity)): fun(self: Entity) @Triggered when an Entity is spawned/created
---@overload fun(self: Entity, event_name: "Destroy", callback: fun(self: Entity)): fun(self: Entity) @Triggered when an Entity is destroyed
---@overload fun(self: Entity, event_name: "ValueChange", callback: fun(self: Entity, key: string, value: any)): fun(self: Entity, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Entity, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
function Entity:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Entity, event_name: "Spawn", callback: fun(self: Entity)) @Triggered when an Entity is spawned/created
---@overload fun(self: Entity, event_name: "Destroy", callback: fun(self: Entity)) @Triggered when an Entity is destroyed
---@overload fun(self: Entity, event_name: "ValueChange", callback: fun(self: Entity, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Entity, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
function Entity:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Base class for all Character entities.
---@class Pawn
Pawn = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spawns and attaches a SkeletalMesh to this entity, the SkeletalMesh must have the same skeleton used by this Actor's mesh, and will follow all animations from it. Uses a custom ID to be used for removing/customizing it afterwards
---@param id string @Used further for removing or applying material settings on it
---@param skeletal_mesh_path string @Path to SkeletalMesh asset to attach
---@param use_parent_bounds? boolean @If true, this component uses its parents bounds when attached. This can be a significant optimization with many components attached together (Default: true)
function Pawn:AddSkeletalMeshAttached(id, skeletal_mesh_path, use_parent_bounds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spawns and attaches a StaticMesh to this entity in a Socket with a relative location and rotation. Uses a custom ID to be used for removing/customizing it afterwards
---@param id string @Unique ID to assign to the StaticMesh
---@param static_mesh_path string @Path to StaticMesh asset to attach
---@param socket? string @Bone socket to attach to (Default: "")
---@param relative_location? Vector @Relative location (Default: Vector(0, 0, 0))
---@param relative_rotation? Rotator @Relative rotation (Default: Rotator(0, 0, 0))
---@param use_parent_bounds? boolean @If true, this component uses its parents bounds when attached. This can be a significant optimization with many components attached together (Default: true)
function Pawn:AddStaticMeshAttached(id, static_mesh_path, socket, relative_location, relative_rotation, use_parent_bounds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Static Meshes attached to this entity
---@return string[] @the key as the Attached ID, and the value as the Asset Path
function Pawn:GetAllStaticMeshAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Skeletal Meshes attached to this entity
---@return string[] @the key as the Attached ID, and the value as the Asset Path
function Pawn:GetAllSkeletalMeshAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes, if it exists, a SkeletalMesh from this entity given its custom ID
---@param id string @Unique ID of the SkeletalMesh to remove
function Pawn:RemoveSkeletalMeshAttached(id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Static Mesh Attached location and rotation
---@param id string @Unique ID of the StaticMesh set with AddStaticMeshAttached
---@param relative_location Vector @New relative location
---@param relative_rotation Rotator @New relative rotation
function Pawn:SetStaticMeshAttachedTransform(id, relative_location, relative_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes, if it exists, a StaticMesh from this enitity given its custom ID
---@param id string @Unique ID of the StaticMesh to remove
function Pawn:RemoveStaticMeshAttached(id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes all StaticMeshes attached
function Pawn:RemoveAllStaticMeshesAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes all SkeletalMeshes attached
function Pawn:RemoveAllSkeletalMeshesAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Stops an Animation Montage on this character
---@param animation_asset string 
function Pawn:StopAnimation(animation_asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the base Mesh Asset
---@return string 
function Pawn:GetMesh() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Moving To location
---@return Vector @the moving to location or Vector(0, 0, 0) if not moving
function Pawn:GetMovingTo() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---AI: Makes this Character to walk to the Location<br/><br/>Triggers event <a href='character#events-movecomplete'>MoveComplete</a>
---@param location Vector 
---@param acceptance_radius? number @(Default: 50)
function Pawn:MoveTo(location, acceptance_radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---AI: Makes this Character to follow another actor<br/><br/>Triggers event <a href='character#events-movecomplete'>MoveComplete</a>
---@param actor Actor @Actor to follow
---@param acceptance_radius? number @Radius to consider success (Default: 50)
---@param stop_on_succeed? boolean @Whether to stop when reaching the target (Default: false)
---@param stop_on_fail? boolean @Whether to stop when failed to reach the target (Default: false)
---@param update_rate? number @How often to recalculate the AI path (Default: 0.25)
function Pawn:Follow(actor, acceptance_radius, stop_on_succeed, stop_on_fail, update_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---AI: Stops the movement<br/><br/>Triggers event <a href='character#events-movecomplete'>MoveComplete</a>
function Pawn:StopMovement() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the possessing Player
---@return Player? 
function Pawn:GetPlayer() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Control Rotation
---@return Rotator 
function Pawn:GetControlRotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Hides a bone of this Character.<br/><br/>Check <a href='character.mdx#characters-skeleton-bone-names'>Bone Names List</a>
---@param bone_name? string @Bone to hide (Default: "")
function Pawn:HideBone(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---UnHide a bone of this Character.<br/><br/>Check <a href='character.mdx#characters-skeleton-bone-names'>Bone Names List</a>
---@param bone_name string @Bone to unhide
function Pawn:UnHideBone(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if a bone is hidden
---@param bone_name string @Bone to check
---@return boolean @if the bone is hidden
function Pawn:IsBoneHidden(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Triggers this Character to jump
function Pawn:Jump() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the velocity of the jump
---@param jump_z_velocity integer @Default is 450
function Pawn:SetJumpZVelocity(jump_z_velocity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Character's Capsule size (will affect Camera location and Character's collision)
---@param radius integer @Default is 42
---@param half_height integer @Default is 96
function Pawn:SetCapsuleSize(radius, half_height) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Jump
---@param can_jump boolean 
function Pawn:SetCanJump(can_jump) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Crouch and to Prone
---@param can_crouch boolean 
function Pawn:SetCanCrouch(can_crouch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Movement Braking Settings of this Character
---@param ground_friction? number @(Default: 2)
---@param braking_friction_factor? number @(Default: 2)
---@param braking_walking? integer @(Default: 96)
---@param braking_flying? integer @(Default: 3000)
---@param braking_swimming? integer @(Default: 10)
---@param braking_falling? integer @(Default: 0)
function Pawn:SetBrakingSettings(ground_friction, braking_friction_factor, braking_walking, braking_flying, braking_swimming, braking_falling) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Pawn, event_name: "Possess", callback: fun(self: Pawn, possesser: Player)): fun(self: Pawn, possesser: Player) @When Character is possessed
---@overload fun(self: Pawn, event_name: "UnPossess", callback: fun(self: Pawn, old_possesser: Player)): fun(self: Pawn, old_possesser: Player) @When Character is unpossessed
---@overload fun(self: Pawn, event_name: "MoveComplete", callback: fun(self: Pawn, succeeded: boolean)): fun(self: Pawn, succeeded: boolean) @Called when AI reaches it's destination, or when it fails
function Pawn:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Pawn, event_name: "Possess", callback: fun(self: Pawn, possesser: Player)) @When Character is possessed
---@overload fun(self: Pawn, event_name: "UnPossess", callback: fun(self: Pawn, old_possesser: Player)) @When Character is unpossessed
---@overload fun(self: Pawn, event_name: "MoveComplete", callback: fun(self: Pawn, succeeded: boolean)) @Called when AI reaches it's destination, or when it fails
function Pawn:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Base class for all Vehicle entities.
---@class Vehicle
Vehicle = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spawns and attaches a SkeletalMesh to this Pickable, the SkeletalMesh must have the same skeleton used by this Actor's mesh, and will follow all animations from it. Uses a custom ID to be used for removing/customizing it afterwards
---@param id string @Used further for removing or applying material settings on it
---@param skeletal_mesh_path string @Path to SkeletalMesh asset to attach
---@param use_parent_bounds? boolean @If true, this component uses its parents bounds when attached. This can be a significant optimization with many components attached together (Default: true)
function Vehicle:AddSkeletalMeshAttached(id, skeletal_mesh_path, use_parent_bounds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spawns and attaches a StaticMesh to this Pickable in a Socket with a relative location and rotation. Uses a custom ID to be used for removing/customizing it afterwards
---@param id string @Unique ID to assign to the StaticMesh
---@param static_mesh_path string @Path to StaticMesh asset to attach
---@param socket? string @Bone socket to attach to (Default: "")
---@param relative_location? Vector @Relative location (Default: Vector(0, 0, 0))
---@param relative_rotation? Rotator @Relative rotation (Default: Rotator(0, 0, 0))
---@param use_parent_bounds? boolean @If true, this component uses its parents bounds when attached. This can be a significant optimization with many components attached together (Default: true)
function Vehicle:AddStaticMeshAttached(id, static_mesh_path, socket, relative_location, relative_rotation, use_parent_bounds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Static Meshes attached to this entity
---@return string[] @the key as the Attached ID, and the value as the Asset Path
function Vehicle:GetAllStaticMeshAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Skeletal Meshes attached to this entity
---@return string[] @the key as the Attached ID, and the value as the Asset Path
function Vehicle:GetAllSkeletalMeshAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes, if it exists, a SkeletalMesh from this Pickable given its custom ID
---@param id string @Unique ID of the SkeletalMesh to remove
function Vehicle:RemoveSkeletalMeshAttached(id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Static Mesh Attached location and rotation
---@param id string @Unique ID of the StaticMesh set with AddStaticMeshAttached
---@param relative_location Vector @New relative location
---@param relative_rotation Rotator @New relative rotation
function Vehicle:SetStaticMeshAttachedTransform(id, relative_location, relative_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes, if it exists, a StaticMesh from this Pickable given its custom ID
---@param id string @Unique ID of the StaticMesh to remove
function Vehicle:RemoveStaticMeshAttached(id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes all StaticMeshes attached
function Vehicle:RemoveAllStaticMeshesAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Removes all SkeletalMeshes attached
function Vehicle:RemoveAllSkeletalMeshesAttached() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Adds a Door at offset_location from root which will pose the Character at seat_location with seat_rotation rotation.
---@param seat_index integer 
---@param offset_location Vector 
---@param seat_location Vector 
---@param seat_rotation Rotator 
---@param trigger_radius integer 
---@param leave_lateral_offset integer @It's where the Character will be ejected when leaving it (e.g. -150 for left door or 150 for right door)
function Vehicle:SetDoor(seat_index, offset_location, seat_location, seat_rotation, trigger_radius, leave_lateral_offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Plays an Animation on this Vehicle
---@param animation_path string 
---@param slot_name? string @(Default: DefaultSlot)
---@param loop_indefinitely? boolean @This parameter is only used if the Vehicle has an Animation Blueprint (Default: false)
---@param blend_in_time? number @This parameter is only used if the Vehicle has an Animation Blueprint (Default: 0.25)
---@param blend_out_time? number @This parameter is only used if the Vehicle has an Animation Blueprint (Default: 0.25)
---@param play_rate? number @This parameter is only used if the Vehicle has an Animation Blueprint (Default: 1.0)
---@param stop_all_montages? boolean @Stops all running Montages from the same Group. This parameter is only used if the Vehicle has an Animation Blueprint (Default: false)
function Vehicle:PlayAnimation(animation_path, slot_name, loop_indefinitely, blend_in_time, blend_out_time, play_rate, stop_all_montages) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Asset name
---@return string @asset path
function Vehicle:GetMesh() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all configured Doors
---@return { seat_index: integer, offset_location: Vector, seat_location: Vector, seat_rotation: Rotator, leave_lateral_offset: integer, sphere_radius: integer } 
function Vehicle:GetDoors() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Bone Transform in world space given a bone name
---@param bone_name string 
---@return { Location: Vector, Rotation: Rotator } 
function Vehicle:GetBoneTransform(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a passenger from a seat
---@param seat integer 
---@return Character @or nil if no passenger in seat
function Vehicle:GetPassenger(seat) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all passengers
---@return Character[] 
function Vehicle:GetPassengers() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Explosion Settings when health reaches zero
---@param engine_relative_location Vector @Relative location of the Engine. Used to apply particles and effects.
---@param materials_index_burnt_override table @List of material indexes to override to burnt when exploded. Leave it empty for all indexes.
---@param materials_index_burnt_invisible table @List of material indexes to override to invisible when exploded. Leave it empty for all indexes.
function Vehicle:SetExplosionSettings(engine_relative_location, materials_index_burnt_override, materials_index_burnt_invisible) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Vehicle, event_name: "Hit", callback: fun(self: Vehicle, impact_force: integer, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: Vehicle, impact_force: integer, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @Triggered when Vehicle hits something
---@overload fun(self: Vehicle, event_name: "CharacterEnter", callback: fun(self: Vehicle, character: Character, seat: integer)): fun(self: Vehicle, character: Character, seat: integer) @Triggered when a Character fully enters the Vehicle
---@overload fun(self: Vehicle, event_name: "CharacterLeave", callback: fun(self: Vehicle, character: Character)): fun(self: Vehicle, character: Character) @Triggered when a Character fully leaves the Vehicle
---@overload fun(self: Vehicle, event_name: "CharacterAttemptEnter", callback: fun(self: Vehicle, character: Character, seat: integer): boolean?): fun(self: Vehicle, character: Character, seat: integer): boolean? @Triggered when a Character attempts to enter the Vehicle
---@overload fun(self: Vehicle, event_name: "CharacterAttemptLeave", callback: fun(self: Vehicle, character: Character): boolean?): fun(self: Vehicle, character: Character): boolean? @Triggered when a Character attempts to leave the Vehicle
---@overload fun(self: Vehicle, event_name: "TakeDamage", callback: fun(self: Vehicle, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?): fun(self: Vehicle, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean? @Triggered when this Vehicle takes damage
function Vehicle:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Vehicle, event_name: "Hit", callback: fun(self: Vehicle, impact_force: integer, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @Triggered when Vehicle hits something
---@overload fun(self: Vehicle, event_name: "CharacterEnter", callback: fun(self: Vehicle, character: Character, seat: integer)) @Triggered when a Character fully enters the Vehicle
---@overload fun(self: Vehicle, event_name: "CharacterLeave", callback: fun(self: Vehicle, character: Character)) @Triggered when a Character fully leaves the Vehicle
---@overload fun(self: Vehicle, event_name: "CharacterAttemptEnter", callback: fun(self: Vehicle, character: Character, seat: integer): boolean?) @Triggered when a Character attempts to enter the Vehicle
---@overload fun(self: Vehicle, event_name: "CharacterAttemptLeave", callback: fun(self: Vehicle, character: Character): boolean?) @Triggered when a Character attempts to leave the Vehicle
---@overload fun(self: Vehicle, event_name: "TakeDamage", callback: fun(self: Vehicle, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?) @Triggered when this Vehicle takes damage
function Vehicle:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Players are Entities that represents the individual behind the mouse and keyboard. Players are spawned automatically when connected to the server.
---@class Player : Entity
Player = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Bans the player from the server
---@param reason string 
function Player:Ban(reason) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Redirects the player to another server
---@param IP string 
---@param password? string @Server password (Default: "")
function Player:Connect(IP, password) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Kicks the player from the server
---@param reason string 
function Player:Kick(reason) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Makes a Player to possess and control a Pawn
---@param new_pawn Pawn 
---@param blend_time? number @(Default: 0)
---@param exp? number @(Default: 0)
function Player:Possess(new_pawn, blend_time, exp) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Does a camera fade to/from a solid color. Animates automatically
---@param from_alpha number @Alpha at which to begin the fade. Range [0..1], where 0 is fully transparent and 1 is fully opaque solid color.
---@param to_alpha number @Alpha at which to finish the fade.
---@param duration number @How long the fade should take, in seconds.
---@param to_color Color @Color to fade to/from.
---@param should_fade_audio? boolean @True to fade audio volume along with the alpha of the solid color. (Default: false)
---@param hold_when_finished? boolean @True for fade to hold at the ToAlpha until explicitly stopped (e.g. with StopCameraFade) (Default: false)
function Player:StartCameraFade(from_alpha, to_alpha, duration, to_color, should_fade_audio, hold_when_finished) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Turns on camera fading at the given opacity. Does not auto-animate, allowing user to animate themselves. Call StopCameraFade to turn fading back off.
---@param in_fade_amount number @Range [0..1], where 0 is fully transparent and 1 is fully opaque solid color.
---@param color Color 
---@param in_fade_audio boolean 
function Player:SetManualCameraFade(in_fade_amount, color, in_fade_audio) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Stops camera fading.
function Player:StopCameraFade() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Player's Camera Location (only works if not possessing any Character)
---@param location Vector 
function Player:SetCameraLocation(location) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Player's Camera Rotation
---@param rotation Rotator 
function Player:SetCameraRotation(rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Smoothly moves the Player's Camera Location (only works if not possessing any Character)
---@param location Vector 
---@param time number 
---@param exp? number @Exponential used to smooth interp, use 0 for linear movement (Default: 0)
function Player:TranslateCameraTo(location, time, exp) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Smoothly moves the Player's Camera Rotation
---@param rotation Rotator 
---@param time number 
---@param exp? number @Exponential used to smooth interp, use 0 for linear movement (Default: 0)
function Player:RotateCameraTo(rotation, time, exp) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Player's Camera Socket Offset (Spring Arm Offset)
---@param socket_offset Vector 
function Player:SetCameraSocketOffset(socket_offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Player's Camera Arm Length (Spring Arm length)
---@param length number 
---@param force boolean @Whether to bypass interpolation and set the target to its value directly
function Player:SetCameraArmLength(length, force) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Player's Camera FOV (if not possessing a Character)
---@param fov? number @Value must be between 5 and 170. Pass empty to reset to default. (Default: 90)
function Player:SetCameraFOV(fov) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Player's Camera Speed Settings (if not possessing a Character)
---@param max_speed? number @Maximum velocity magnitude allowed (Default: 1200)
---@param acceleration? number @Acceleration applied by input (rate of change of velocity) (Default: 4000)
---@param deceleration? number @Deceleration applied when there is no input (rate of change of velocity) (Default: 4000)
---@param turning_boost? number @Setting affecting extra force applied when changing direction, making turns have less drift and become more responsive. Velocity magnitude is not allowed to increase, that only happens due to normal acceleration. It may decrease with large direction changes. Larger values apply extra force to reach the target direction more quickly, while a zero value disables any extra turn force. (Default: 8)
function Player:SetCameraSpeedSettings(max_speed, acceleration, deceleration, turning_boost) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Attaches the Player`s Camera to an Actor
---@param actor Actor 
---@param socket_offset Vector 
---@param blend_speed number 
function Player:AttachCameraTo(actor, socket_offset, blend_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Resets the Camera to default state (Unspectate and Detaches)
function Player:ResetCamera() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Spectates other Player
---@param player Player 
---@param blend_speed? number @(Default: 0)
function Player:Spectate(player, blend_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the player's name
---@param player_name string 
function Player:SetName(player_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the VOIP Channel of this Player (will only communicate with other players in the same channel)
---@param channel integer 
function Player:SetVOIPChannel(channel) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the VOIP Settings of this Player
---@param voip_setting VOIPSetting 
function Player:SetVOIPSetting(voip_setting) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the VOIP Volume of this Player
---@param volume number 
function Player:SetVOIPVolume(volume) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Release the Player from the Character
function Player:UnPossess() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Player:GetSteamID() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Player:GetAccountID() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Player:GetAccountName() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Return a URL which can be used through WebUI and Widgets to display the Player's Steam Avatar (64x64)
---@return string 
function Player:GetAccountIconURL() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return Vector 
function Player:GetCameraLocation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@param return_base? boolean @Whether to return the current (false) or base (true) value. The base is the same value set by SetCameraArmLength(). (Default: false)
---@return number 
function Player:GetCameraArmLength(return_base) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return Rotator 
function Player:GetCameraRotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Character? 
function Player:GetControlledCharacter() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---
---@return string 
function Player:GetIP() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Player's dimension
---@return integer 
function Player:GetDimension() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets this Player's dimension
---@param dimension integer 
function Player:SetDimension(dimension) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Player:GetName() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return integer 
function Player:GetPing() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return integer 
function Player:GetVOIPChannel() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return boolean 
function Player:IsHost() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return boolean 
function Player:IsLocalPlayer() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return VOIPSetting 
function Player:GetVOIPSetting() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Player, event_name: "Spawn", callback: fun(self: Player)): fun(self: Player) @Triggered when an Entity is spawned/created
---@overload fun(self: Player, event_name: "Destroy", callback: fun(self: Player)): fun(self: Player) @Triggered when an Entity is destroyed
---@overload fun(self: Player, event_name: "ValueChange", callback: fun(self: Player, key: string, value: any)): fun(self: Player, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Player, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Player, event_name: "DimensionChange", callback: fun(self: Player, old_dimension: integer, new_dimension: integer)): fun(self: Player, old_dimension: integer, new_dimension: integer) @Triggered when a Player changes it's dimension
---@overload fun(self: Player, event_name: "Possess", callback: fun(self: Player, character: Character)): fun(self: Player, character: Character) @Trigerred when Player starts controlling a Character
---@overload fun(self: Player, event_name: "Ready", callback: fun(self: Player)): fun(self: Player) @Triggered when Player is ready (the client fully joined, loaded the map and all entities and is ready to play)
---@overload fun(self: Player, event_name: "UnPossess", callback: fun(self: Player, character: Character)): fun(self: Player, character: Character) @A Character was released from the Player
---@overload fun(self: Player, event_name: "VOIP", callback: fun(self: Player, is_talking: boolean): boolean?): fun(self: Player, is_talking: boolean): boolean? @When a Player starts/ends using VOIP
function Player:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Player, event_name: "Spawn", callback: fun(self: Player)) @Triggered when an Entity is spawned/created
---@overload fun(self: Player, event_name: "Destroy", callback: fun(self: Player)) @Triggered when an Entity is destroyed
---@overload fun(self: Player, event_name: "ValueChange", callback: fun(self: Player, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Player, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Player, event_name: "DimensionChange", callback: fun(self: Player, old_dimension: integer, new_dimension: integer)) @Triggered when a Player changes it's dimension
---@overload fun(self: Player, event_name: "Possess", callback: fun(self: Player, character: Character)) @Trigerred when Player starts controlling a Character
---@overload fun(self: Player, event_name: "Ready", callback: fun(self: Player)) @Triggered when Player is ready (the client fully joined, loaded the map and all entities and is ready to play)
---@overload fun(self: Player, event_name: "UnPossess", callback: fun(self: Player, character: Character)) @A Character was released from the Player
---@overload fun(self: Player, event_name: "VOIP", callback: fun(self: Player, is_talking: boolean): boolean?) @When a Player starts/ends using VOIP
function Player:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Vehicles are wheeled entities which Characters can possesses and drive.
---@class VehicleWheeled : Entity, Actor, Vehicle, Paintable, Damageable
---@overload fun(location: Vector, rotation: Rotator, asset: string, collision_type?: CollisionType, gravity_enabled?: boolean, auto_create_physics?: boolean, auto_unflip?: boolean, engine_sound?: string, horn_sound?: string, brake_sound?: string, engine_start_sound?: string, vehicle_door_sound?: string, auto_start_engine?: boolean, custom_animation_blueprint?: string): VehicleWheeled
VehicleWheeled = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Starts or stops the vehicles horn
---@param enable_horn boolean 
function VehicleWheeled:Horn(enable_horn) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Call this after configuring the vehicle if passed <code>auto_create_physics</code> to constructor
function VehicleWheeled:RecreatePhysics() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Vehicle Camera Offset
---@param offset Vector 
function VehicleWheeled:SetCameraOffset(offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if the Engine auto starts when the driver enters the Vehicle
---@param auto_start boolean 
function VehicleWheeled:SetAutoStartEngine(auto_start) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if the Engine is turned off/on (this will affect Lights, Sounds and ability to Throttle)
---@param started boolean 
function VehicleWheeled:SetEngineStarted(started) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Vehicle Steering
---@param steering_type SteeringType 
---@param angle_ratio? number @Only applies when AngleRatio is selected (Default: 0.7)
function VehicleWheeled:SetSteeringSetup(steering_type, angle_ratio) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Vehicle Engine (Torque, RPM, Braking)
---@param max_torque? integer @Max Engine Torque (Nm) is multiplied by TorqueCurve (Default: 700)
---@param max_rpm? integer @Maximum revolutions per minute of the engine (Default: 5700)
---@param idle_rpm? integer @Idle RMP of engine then in neutral/stationary (Default: 1200)
---@param brake_effect? number @Braking effect from engine, when throttle released (Default: 0.05)
---@param rev_up_moi? integer @Affects how fast the engine RPM speed up (Default: 5)
---@param rev_down_rate? integer @Affects how fast the engine RPM slows down (Default: 600)
function VehicleWheeled:SetEngineSetup(max_torque, max_rpm, idle_rpm, brake_effect, rev_up_moi, rev_down_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Vehicle Aerodynamics Settings
---@param mass? integer @Mass of the vehicle chassis (Default: 1500)
---@param drag_coefficient? number @Force resisting forward motion at speed (Default: 0.3)
---@param vehicle_chassis_width? integer @Chassis width used for drag force computation (cm) (Default: 180)
---@param vehicle_chassis_height? integer @Chassis height used for drag force computation (cm) (Default: 140)
---@param vehicle_downforce_coefficient? number @Force pressing vehicle into ground at speed (Default: 0.3)
---@param center_of_mass_override? Vector @Overrides the center of mass. Good for curves stabilization. Ideally the Z should be the same as the wheels radius (Default: Vector(0, 0, 50))
function VehicleWheeled:SetAerodynamicsSetup(mass, drag_coefficient, vehicle_chassis_width, vehicle_chassis_height, vehicle_downforce_coefficient, center_of_mass_override) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Vehicle Transmission
---@param transmission_final_ratio? number @The final gear ratio multiplies the transmission gear ratios (Default: 3.08)
---@param transmission_change_up_rpm? integer @Engine Revs at which gear up change occurs (Default: 4500)
---@param transmission_change_down_rpm? integer @Engine Revs at which gear down change occurs (Default: 2000)
---@param transmission_gear_change_time? number @Time it takes to switch gears (seconds) (Default: 0.4)
---@param transmission_efficiency? number @Mechanical frictional losses mean transmission might operate at 0.94 (94% efficiency) (Default: 0.94)
function VehicleWheeled:SetTransmissionSetup(transmission_final_ratio, transmission_change_up_rpm, transmission_change_down_rpm, transmission_gear_change_time, transmission_efficiency) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Wheels can be updated in runtime by calling SetWheel again, you can for example change the suspension high or disable a wheel totally by toggling affected_by_engine off or setting radius to 0.
---@param index integer @Index of the wheel (0-N). Set it in ASC order
---@param bone_name string @Name of the bone to attach this wheel to
---@param radius? integer @Radius of the wheel (Default: 32)
---@param width? integer @Width of the wheel (Default: 20)
---@param max_steer_angle? integer @Steer angle in degrees for this wheel (Default: 50)
---@param offset? Vector @If bone_name is specified, offset the wheel from the bone's location. Otherwise this offsets the wheel from the vehicle's origin (Default: Vector(0, 0, 0))
---@param is_affected_by_engine? boolean @Whether engine should power this wheel (Default: true)
---@param is_affected_by_brake? boolean @Whether brake should affect this wheel (Default: true)
---@param is_affected_by_handbrake? boolean @Whether handbrake should affect this wheel (Default: true)
---@param has_abs_enabled? boolean @Advanced Braking System Enabled (Default: false)
---@param has_traction_control_enabled? boolean @Straight Line Traction Control Enabled (Default: false)
---@param max_brake_torque? integer @Max brake torque for this wheel (Nm) (Default: 1500)
---@param max_handbrake_torque? integer @Max handbrake brake torque for this wheel (Nm). A handbrake should have a stronger brake torque than the brake (Default: 3000)
---@param cornering_stiffness? integer @Tyre Cornering Ability (Default: 1000)
---@param side_slip_modifier? number @Wheel Lateral Skid Grip Loss, lower number less grip on skid (Default: 1.0)
---@param friction_force_multiplier? number @Friction Force Multiplier (Default: 2.0)
---@param slip_threshold? number @Wheel Longitudinal Slip Threshold (Default: 20.0)
---@param skid_threshold? number @Wheel Lateral Skid Threshold (Default: 20.0)
---@param suspension_spring_rate? number @Spring Force (N/m) (Default: 250.0)
---@param suspension_spring_preload? number @Spring Preload (N/m) (Default: 50.0)
---@param suspension_max_raise? number @How far the wheel can go above the resting position (Default: 10.0)
---@param suspension_max_drop? number @How far the wheel can drop below the resting position (Default: 10.0)
---@param suspension_smoothing? number @Smooth suspension [0-off, 10-max] - Warning might cause momentary visual inter-penetration of the wheel against objects/terrain (Default: 0.0)
---@param suspension_damping_ratio? number @Suspension damping, larger value causes the suspension to come to rest faster [range 0 to 1] (Default: 0.5)
---@param suspension_wheel_load_ratio? number @Amount wheel load effects wheel friction. <br/> - At 0 wheel friction is completely independent of the loading on the wheel (This is artificial as it always assumes even balance between all wheels) <br/> - At 1 wheel friction is based on the force pressing wheel into the ground. This is more realistic. <br/> - Lower value cures lift off over-steer, generally makes vehicle easier to handle under extreme motions. (Default: 0.5)
---@param suspension_axis? Vector @Local body direction in which where suspension forces are applied (typically along -Z-axis) (Default: Vector(0, 0, -1))
---@param suspension_force_offset? Vector @Vertical offset from where suspension forces are applied (along Z-axis) (Default: Vector(0, 0, 0))
function VehicleWheeled:SetWheel(index, bone_name, radius, width, max_steer_angle, offset, is_affected_by_engine, is_affected_by_brake, is_affected_by_handbrake, has_abs_enabled, has_traction_control_enabled, max_brake_torque, max_handbrake_torque, cornering_stiffness, side_slip_modifier, friction_force_multiplier, slip_threshold, skid_threshold, suspension_spring_rate, suspension_spring_preload, suspension_max_raise, suspension_max_drop, suspension_smoothing, suspension_damping_ratio, suspension_wheel_load_ratio, suspension_axis, suspension_force_offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures where the Steering Wheel is located, so Characters can grab it procedurally properly
---@param location Vector 
---@param radius integer 
function VehicleWheeled:SetSteeringWheelSetup(location, radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Headlights Offset and Color.
---@param location Vector 
---@param color? Color @(Default: Color(1, 0.86, 0.5))
function VehicleWheeled:SetHeadlightsSetup(location, color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Configures the Taillights Offset.
---@param location Vector 
function VehicleWheeled:SetTaillightsSetup(location) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets a Tire as Flat or not
---@param wheel_index integer 
---@param is_flat boolean 
function VehicleWheeled:SetTireFlat(wheel_index, is_flat) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current RPM
---@return integer 
function VehicleWheeled:GetRPM() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current Gear
---@return integer 
function VehicleWheeled:GetGear() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: VehicleWheeled, event_name: "Spawn", callback: fun(self: VehicleWheeled)): fun(self: VehicleWheeled) @Triggered when an Entity is spawned/created
---@overload fun(self: VehicleWheeled, event_name: "Destroy", callback: fun(self: VehicleWheeled)): fun(self: VehicleWheeled) @Triggered when an Entity is destroyed
---@overload fun(self: VehicleWheeled, event_name: "ValueChange", callback: fun(self: VehicleWheeled, key: string, value: any)): fun(self: VehicleWheeled, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: VehicleWheeled, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: VehicleWheeled, event_name: "DimensionChange", callback: fun(self: VehicleWheeled, old_dimension: integer, new_dimension: integer)): fun(self: VehicleWheeled, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: VehicleWheeled, event_name: "Hit", callback: fun(self: VehicleWheeled, impact_force: integer, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: VehicleWheeled, impact_force: integer, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @Triggered when Vehicle hits something
---@overload fun(self: VehicleWheeled, event_name: "CharacterEnter", callback: fun(self: VehicleWheeled, character: Character, seat: integer)): fun(self: VehicleWheeled, character: Character, seat: integer) @Triggered when a Character fully enters the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "CharacterLeave", callback: fun(self: VehicleWheeled, character: Character)): fun(self: VehicleWheeled, character: Character) @Triggered when a Character fully leaves the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "CharacterAttemptEnter", callback: fun(self: VehicleWheeled, character: Character, seat: integer): boolean?): fun(self: VehicleWheeled, character: Character, seat: integer): boolean? @Triggered when a Character attempts to enter the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "CharacterAttemptLeave", callback: fun(self: VehicleWheeled, character: Character): boolean?): fun(self: VehicleWheeled, character: Character): boolean? @Triggered when a Character attempts to leave the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "TakeDamage", callback: fun(self: VehicleWheeled, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?): fun(self: VehicleWheeled, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean? @Triggered when this Entity takes damage
---@overload fun(self: VehicleWheeled, event_name: "HealthChange", callback: fun(self: VehicleWheeled, old_health: integer, new_health: integer)): fun(self: VehicleWheeled, old_health: integer, new_health: integer) @When Entity has it's Health changed, or because took damage or manually set through scripting or respawning
---@overload fun(self: VehicleWheeled, event_name: "Respawn", callback: fun(self: VehicleWheeled)): fun(self: VehicleWheeled) @When Entity Respawns
---@overload fun(self: VehicleWheeled, event_name: "Death", callback: fun(self: VehicleWheeled, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor)): fun(self: VehicleWheeled, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor) @When Entity Dies
---@overload fun(self: VehicleWheeled, event_name: "Horn", callback: fun(self: VehicleWheeled, is_honking: boolean)): fun(self: VehicleWheeled, is_honking: boolean) @Triggered when Vehicle honks
function VehicleWheeled:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: VehicleWheeled, event_name: "Spawn", callback: fun(self: VehicleWheeled)) @Triggered when an Entity is spawned/created
---@overload fun(self: VehicleWheeled, event_name: "Destroy", callback: fun(self: VehicleWheeled)) @Triggered when an Entity is destroyed
---@overload fun(self: VehicleWheeled, event_name: "ValueChange", callback: fun(self: VehicleWheeled, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: VehicleWheeled, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: VehicleWheeled, event_name: "DimensionChange", callback: fun(self: VehicleWheeled, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: VehicleWheeled, event_name: "Hit", callback: fun(self: VehicleWheeled, impact_force: integer, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @Triggered when Vehicle hits something
---@overload fun(self: VehicleWheeled, event_name: "CharacterEnter", callback: fun(self: VehicleWheeled, character: Character, seat: integer)) @Triggered when a Character fully enters the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "CharacterLeave", callback: fun(self: VehicleWheeled, character: Character)) @Triggered when a Character fully leaves the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "CharacterAttemptEnter", callback: fun(self: VehicleWheeled, character: Character, seat: integer): boolean?) @Triggered when a Character attempts to enter the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "CharacterAttemptLeave", callback: fun(self: VehicleWheeled, character: Character): boolean?) @Triggered when a Character attempts to leave the Vehicle
---@overload fun(self: VehicleWheeled, event_name: "TakeDamage", callback: fun(self: VehicleWheeled, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?) @Triggered when this Entity takes damage
---@overload fun(self: VehicleWheeled, event_name: "HealthChange", callback: fun(self: VehicleWheeled, old_health: integer, new_health: integer)) @When Entity has it's Health changed, or because took damage or manually set through scripting or respawning
---@overload fun(self: VehicleWheeled, event_name: "Respawn", callback: fun(self: VehicleWheeled)) @When Entity Respawns
---@overload fun(self: VehicleWheeled, event_name: "Death", callback: fun(self: VehicleWheeled, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor)) @When Entity Dies
---@overload fun(self: VehicleWheeled, event_name: "Horn", callback: fun(self: VehicleWheeled, is_honking: boolean)) @Triggered when Vehicle honks
function VehicleWheeled:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---An <b>Actor</b> is an object which can be spawned and destroyed through Lua.<br>Actors support 3D transformations such as translation (location), rotation, and scale.<br><br>An <b>Actor</b> is the base for several entities, and all those entities share the same <b>Methods</b> and <b>Events</b> described in this page.
---@class Actor
Actor = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Applies a force in world world to this Actor (the force is applied client side, by, in most cases, the player closest to this Actor)
---@param force Vector 
---@param velocity_change? boolean @Whether to ignore mass (Default: false)
function Actor:AddImpulse(force, velocity_change) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---<p>Attaches this Actor to any other Actor, optionally at a specific bone</p><ul><li><code>AttachmentRule.KeepRelative</code> will keep the current relative position/rotation if already attached.</li><li><code>AttachmentRule.KeepWorld</code> will calculate the new relative position/rotation so the Actor stays at the same position after being attached.</li><li><code>AttachmentRule.SnapToTarget</code> will set the Actor to the same position/rotation as <code>other_actor</code> (or at the bone location) and reset its relative position/rotation to zero.</li></ul><p>Setting <code>lifespan_when_detached</code> to <code>0</code> will automatically destroy this actor when detached, setting it to <code>10</code> will destroy this after 10 seconds when detached.</p>
---@param other Actor @Other actor to attach
---@param attachment_rule? AttachmentRule @How to attach (Default: SnapToTarget)
---@param bone_name? string @Which bone to attach to (Default: "")
---@param lifespan_when_detached? number @Seconds before destroying this Actor when detached (Default: -1)
---@param use_absolute_rotation? boolean @Whether to force attached object to use absolute rotation (will not follow parent) (Default: false)
function Actor:AttachTo(other, attachment_rule, bone_name, lifespan_when_detached, use_absolute_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Detaches this Actor from AttachedTo Actor
function Actor:Detach() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Actor's collision type
---@param collision_type CollisionType 
function Actor:SetCollision(collision_type) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets this Actor's Dimension
---@param dimension integer 
function Actor:SetDimension(dimension) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Adds a permanent force to this Actor, set to Vector(0, 0, 0) to cancel
---@param force Vector 
---@param is_local? boolean @Whether to apply the force in local space (Default: true)
function Actor:SetForce(force, is_local) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets whether gravity is enabled on this Actor
---@param gravity_enabled boolean 
function Actor:SetGravityEnabled(gravity_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets whether the actor is visible or not
---@param is_visible boolean 
function Actor:SetVisibility(is_visible) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets whether the highlight is enabled on this Actor, and which highlight index to use. This will apply the hight on every attached entity too
---@param is_enabled boolean 
---@param index? integer @Index to use (should be <code>0</code>, <code>1</code> or <code>2</code>) (Default: 0)
function Actor:SetHighlightEnabled(is_enabled, index) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets whether the outline is enabled on this Actor, and which outline index to use. This will apply the outline on every attached entity too
---@param is_enabled boolean 
---@param index? integer @Index to use (should be <code>0</code>, <code>1</code> or <code>2</code>) (Default: 0)
function Actor:SetOutlineEnabled(is_enabled, index) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets the time (in seconds) before this Actor is destroyed. After this time has passed, the actor will be automatically destroyed.
---@param seconds number @Seconds before being destroyed
function Actor:SetLifeSpan(seconds) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Actor's location in the game world
---@param location Vector 
function Actor:SetLocation(location) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Actor's rotation in the game world
---@param rotation Rotator 
function Actor:SetRotation(rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Actor's relative location in local space (only if this actor is attached)
---@param relative_location Vector 
function Actor:SetRelativeLocation(relative_location) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Actor's relative rotation in local space (only if this actor is attached)
---@param relative_rotation Rotator 
function Actor:SetRelativeRotation(relative_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/authority-only.png?raw=true" height="10"> `Authority Side`
---
---Sets this Actor's scale
---@param scale Vector 
function Actor:SetScale(scale) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Player to have network authority over this Actor. This Player will be manually assigned to handle this Actor's physics and share its location with other clients. The authority assignment will still be overridden by the game automatically<br><br>Please refer to <a href="/docs/core-concepts/scripting/authority-concepts#network-authority">Network Authority</a> for more information
---@param player? Player @New player which will assume the Network Authority of this Actor (Default: nil)
function Actor:SetNetworkAuthority(player) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Actor will auto distribute the network authority between players when idle<br><br>Please refer to <a href="/docs/core-concepts/scripting/authority-concepts#network-authority">Network Authority</a> for more information
---@param auto_distribute boolean @If this Actor will be auto network distributed
function Actor:SetNetworkAuthorityAutoDistributed(auto_distribute) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Smoothly moves this actor to a location over a certain time
---@param location Vector 
---@param time number @Time to interpolate from current location to target location
---@param exp? number @Exponent used to smooth interpolation. Use <code>0</code> for linear movement (Default: 0)
function Actor:TranslateTo(location, time, exp) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Smoothly rotates this actor to an angle over a certain time
---@param rotation Rotator 
---@param time number @Time to interpolate from current location to target location
---@param exp? number @Exponent used to smooth interpolation. Use <code>0</code> for linear movement (Default: 0)
function Actor:RotateTo(rotation, time, exp) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns true if this Actor is being destroyed.<br>You can check this inside events like <code>Drop</code> to see if a Pickable is being dropped because it's going to be destroyed
---@return boolean 
function Actor:IsBeingDestroyed() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns true if this Actor is visible
---@return boolean 
function Actor:IsVisible() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns true if gravity is enabled on this Actor
---@return boolean 
function Actor:IsGravityEnabled() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns true if this Actor is in water
---@return boolean 
function Actor:IsInWater() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns true if this Actor is currently network distributed. Only actors being network distributed can have their network authority set<br>Entities have NetworkDistributed automatically disabled when: Attached, Possessed, Grabbed, Picked Up or Driving
---@return boolean 
function Actor:IsNetworkDistributed() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets all Actors attached to this Actor
---@return Actor[] 
function Actor:GetAttachedEntities() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Actor this Actor is attached to
---@return Actor? 
function Actor:GetAttachedTo() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets this Actor's bounds
---@return { Origin: Vector, BoxExtent: Vector, SphereRadius: number } 
function Actor:GetBounds() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's collision type
---@return CollisionType 
function Actor:GetCollision() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's location in the game world
---@return Vector 
function Actor:GetLocation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's Relative Location if it's attached
---@return Vector 
function Actor:GetRelativeLocation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gets this Actor's Network Authority Player
---@return Player? 
function Actor:GetNetworkAuthority() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's angle in the game world
---@return Rotator 
function Actor:GetRotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's Relative Rotation if it's attached
---@return Rotator 
function Actor:GetRelativeRotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's force (set by <code>SetForce()</code>)
---@return Vector 
function Actor:GetForce() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's dimension
---@return integer 
function Actor:GetDimension() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns true if the local Player is currently the Network Authority of this Actor
---@return boolean 
function Actor:HasNetworkAuthority() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets if this Actor was spawned by the client side
---@return boolean @false if it was spawned by the Server or true if it was spawned by the client
function Actor:HasAuthority() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's scale
---@return Vector 
function Actor:GetScale() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Actor's current velocity
---@return Vector 
function Actor:GetVelocity() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Adds an Unreal Actor Tag to this Actor
---@param tag string 
function Actor:AddActorTag(tag) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Removes an Unreal Actor Tag from this Actor
---@param tag string 
function Actor:RemoveActorTag(tag) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets all Unreal Actor Tags on this Actor
---@return string[] 
function Actor:GetActorTags() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets if this Actor was recently rendered on screen
---@return boolean 
function Actor:WasRecentlyRendered() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the distance of this Actor from the Camera
---@return number 
function Actor:GetDistanceFromCamera() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the percentage of this Actor size in the screen
---@return number 
function Actor:GetScreenPercentage() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Actor, event_name: "DimensionChange", callback: fun(self: Actor, old_dimension: integer, new_dimension: integer)): fun(self: Actor, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
function Actor:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Actor, event_name: "DimensionChange", callback: fun(self: Actor, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
function Actor:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Weapons are entities with firing, reloading and aiming functionalities.<br/><br/>They are fully customizable, all pieces of the weapon can be changed with immense possibility of creation.
---@class Weapon : Entity, Actor, Paintable, Pickable
---@overload fun(location: Vector, rotation: Rotator, asset: string, collision_type?: CollisionType, gravity_enabled?: boolean): Weapon
Weapon = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Forces this Weapon to reload (only if being handled by a Character)
function Weapon:Reload() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets this Weapon's Ammo in the Bag
---@param new_ammo_bag integer 
function Weapon:SetAmmoBag(new_ammo_bag) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets this Weapon's Ammo in the Clip
---@param new_ammo_clip integer 
function Weapon:SetAmmoClip(new_ammo_clip) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Aux for setting and configuring ammo
---@param ammo_clip integer 
---@param ammo_bag integer 
---@param ammo_to_reload? integer @(Default: ammo_clip)
---@param clip_capacity? integer @(Default: ammo_clip)
function Weapon:SetAmmoSettings(ammo_clip, ammo_bag, ammo_to_reload, clip_capacity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Animation played by the Weapon when Firing
---@param animation_fire_path string 
---@param play_rate? number @(Default: 1)
function Weapon:SetAnimationFire(animation_fire_path, play_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Animation played by the Character when Firing
---@param animation_character_fire_path string 
---@param play_rate? number @(Default: 1)
function Weapon:SetAnimationCharacterFire(animation_character_fire_path, play_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Animation played by the Character when Reloading
---@param reload_animation_path string 
---@param play_rate? number @(Default: 1)
function Weapon:SetAnimationReload(reload_animation_path, play_rate) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the reload animation
---@return string 
function Weapon:GetAnimationReload() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---If the Character will reload automatically when ammo empties. Default is true
---@param auto_reload boolean 
function Weapon:SetAutoReload(auto_reload) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the Bullet Color<br/><br/>Only has effect if using Bullet Trail particle P_Bullet_Trail or if you particle has the Color parameter
---@param bullet_color Color 
function Weapon:SetBulletColor(bullet_color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Aux for setting and configuring the Bullet
---@param bullet_count integer @1 for common weapons<br/>> 1 for shotguns
---@param bullet_max_distance integer 
---@param bullet_velocity integer @Visuals only
---@param bullet_color Color 
function Weapon:SetBulletSettings(bullet_count, bullet_max_distance, bullet_velocity, bullet_color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Speed of shots
---@param cadence number @1 shot at each <code>cadence</code> second
function Weapon:SetCadence(cadence) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Capacity of the Weapon's clip
---@param clip integer 
function Weapon:SetClipCapacity(clip) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Base Weapon's Damage<br/><br/>This will be multiplied by multiplier factors when hitting specific bones
---@param damage integer 
function Weapon:SetDamage(damage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets how the Character grabs this Weapon
---@param handling_mode HandlingMode 
function Weapon:SetHandlingMode(handling_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Left Hand Offset
---@param left_hand_location Vector 
---@param left_hand_rotation Rotator 
function Weapon:SetLeftHandTransform(left_hand_location, left_hand_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the mesh used when the Character reloads the weapon.<br/><br/>Will drop this Mesh as an animation effect.
---@param magazine_mesh string 
---@param magazine_mesh_hide_bone? string @Weapon bone to hide when reloading it (Default: b_gun_mag)
function Weapon:SetMagazineMesh(magazine_mesh, magazine_mesh_hide_bone) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Plays an Animation on this Weapon
---@param animation_path string 
---@param slot_name? string @(Default: DefaultSlot)
---@param loop_indefinitely? boolean @This parameter is only used if the Weapon has an Animation Blueprint (Default: false)
---@param blend_in_time? number @This parameter is only used if the Weapon has an Animation Blueprint (Default: 0.25)
---@param blend_out_time? number @This parameter is only used if the Weapon has an Animation Blueprint (Default: 0.25)
---@param play_rate? number @This parameter is only used if the Weapon has an Animation Blueprint (Default: 1.0)
---@param stop_all_montages? boolean @Stops all running Montages from the same Group. This parameter is only used if the Weapon has an Animation Blueprint (Default: false)
function Weapon:PlayAnimation(animation_path, slot_name, loop_indefinitely, blend_in_time, blend_out_time, play_rate, stop_all_montages) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Particle of the Bullet flying
---@param particle_bullet_trail_asset_path string 
function Weapon:SetParticlesBulletTrail(particle_bullet_trail_asset_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Particle of the Fire Blast in the muzzle
---@param particle_asset_path string 
function Weapon:SetParticlesBarrel(particle_asset_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Particle of the empty bullet flying from the weapon when shooting
---@param particle_shells_asset_path string 
function Weapon:SetParticlesShells(particle_shells_asset_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the Offset of Right Hand. To position relative to the camera.
---@param right_hand_offset Vector 
function Weapon:SetRightHandOffset(right_hand_offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---The FOV multiplier when ADS
---@param sight_fov_multiplier number 
function Weapon:SetSightFOVMultiplier(sight_fov_multiplier) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Offset applied to align player's head to weapon's sight and rotation applied on the weapon when ADS
---@param sight_location Vector 
---@param sight_rotation Rotator 
function Weapon:SetSightTransform(sight_location, sight_rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when weapon has not bullet and try to shoot
---@param sound_dry_asset_path string 
---@param volume? number @(Default: 1)
---@param pitch? number @(Default: 1)
function Weapon:SetSoundDry(sound_dry_asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when Loading a magazine
---@param sound_load_asset_path string 
---@param volume? number @(Default: 1)
---@param pitch? number @(Default: 1)
function Weapon:SetSoundLoad(sound_load_asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when Unloading a magazine
---@param sound_unload_asset_path string 
---@param volume? number @(Default: 1)
---@param pitch? number @(Default: 1)
function Weapon:SetSoundUnload(sound_unload_asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when Zooming
---@param sound_zooming_asset_path string 
---@param volume? number @(Default: 1)
---@param pitch? number @(Default: 1)
function Weapon:SetSoundZooming(sound_zooming_asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when Shooting
---@param sound_fire_asset_path string 
---@param volume? number @(Default: 1)
---@param pitch? number @(Default: 1)
function Weapon:SetSoundFire(sound_fire_asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when Aiming
---@param sound_aim_asset_path string 
---@param volume? number @(Default: 1)
---@param pitch? number @(Default: 1)
function Weapon:SetSoundAim(sound_aim_asset_path, volume, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sound when firing with only having X remaining bullets in the magazine, useful for last shot 'ping' or sound when low on bullets
---@param sound_asset_path string 
---@param remaining_bullets_count? integer @The amount of remaining bullet to start playing this sound (Default: 1)
function Weapon:SetSoundFireLastBullets(sound_asset_path, remaining_bullets_count) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Base Weapon's Spread
---@param spread number @the higher the less precision - recommended value: 20
function Weapon:SetSpread(spread) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Base Weapon's Recoil
---@param recoil number @0 means no Recoil, default is 1
function Weapon:SetRecoil(recoil) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if the Weapon can hold to keep firing and if it needs to release to fire
---@param can_hold_use boolean 
---@param hold_release_use boolean 
function Weapon:SetUsageSettings(can_hold_use, hold_release_use) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets how the bullet will pass through walls
---@param max_distance integer @Max distance to pass through another wall
---@param damage_multiplier number @Damage given if wallbangged
function Weapon:SetWallbangSettings(max_distance, damage_multiplier) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Weapon's Ammo Bag
---@return integer 
function Weapon:GetAmmoBag() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets this Weapon's Ammo Clip
---@return integer 
function Weapon:GetAmmoClip() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return integer 
function Weapon:GetAmmoToReload() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return HandlingMode 
function Weapon:GetHandlingMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetAnimationCharacterFire() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetAnimationFire() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetMagazineMesh() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetParticlesBulletTrail() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetParticlesShells() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetSoundDry() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetSoundLoad() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetSoundUnload() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetSoundZooming() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetSoundAim() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return string 
function Weapon:GetSoundFire() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return boolean 
function Weapon:GetCanHoldUse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return boolean 
function Weapon:GetHoldReleaseUse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Bone Transform in world space given a bone name
---@param bone_name string 
---@return { Location: Vector, Rotation: Rotator } 
function Weapon:GetBoneTransform(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return integer 
function Weapon:GetBulletCount() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Color 
function Weapon:GetBulletColor() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return number 
function Weapon:GetCadence() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return integer 
function Weapon:GetClipCapacity() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return integer 
function Weapon:GetDamage() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Vector 
function Weapon:GetRightHandOffset() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Vector 
function Weapon:GetLeftHandLocation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Rotator 
function Weapon:GetLeftHandRotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Vector 
function Weapon:GetSightLocation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return Rotator 
function Weapon:GetSightRotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return number 
function Weapon:GetSightFOVMultiplier() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return number 
function Weapon:GetSpread() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---
---@return number 
function Weapon:GetRecoil() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Weapon, event_name: "Spawn", callback: fun(self: Weapon)): fun(self: Weapon) @Triggered when an Entity is spawned/created
---@overload fun(self: Weapon, event_name: "Destroy", callback: fun(self: Weapon)): fun(self: Weapon) @Triggered when an Entity is destroyed
---@overload fun(self: Weapon, event_name: "ValueChange", callback: fun(self: Weapon, key: string, value: any)): fun(self: Weapon, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Weapon, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Weapon, event_name: "DimensionChange", callback: fun(self: Weapon, old_dimension: integer, new_dimension: integer)): fun(self: Weapon, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Weapon, event_name: "Drop", callback: fun(self: Weapon, character: Character, was_triggered_by_player: boolean)): fun(self: Weapon, character: Character, was_triggered_by_player: boolean) @When a Character drops this Pickable
---@overload fun(self: Weapon, event_name: "Hit", callback: fun(self: Weapon, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)): fun(self: Weapon, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector) @When this Pickable hits something
---@overload fun(self: Weapon, event_name: "Interact", callback: fun(self: Weapon, character: Character): boolean?): fun(self: Weapon, character: Character): boolean? @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Weapon, event_name: "PickUp", callback: fun(self: Weapon, character: Character)): fun(self: Weapon, character: Character) @Triggered When a Character picks this up
---@overload fun(self: Weapon, event_name: "PullUse", callback: fun(self: Weapon, character: Character)): fun(self: Weapon, character: Character) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Weapon, event_name: "ReleaseUse", callback: fun(self: Weapon, character: Character)): fun(self: Weapon, character: Character) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
---@overload fun(self: Weapon, event_name: "Fire", callback: fun(self: Weapon, shooter: Character)): fun(self: Weapon, shooter: Character) @Triggered when Weapon fires (this will be triggered for each shot)
---@overload fun(self: Weapon, event_name: "Reload", callback: fun(self: Weapon, character: Character, ammo_to_reload: integer)): fun(self: Weapon, character: Character, ammo_to_reload: integer) @When a Weapon is reloaded, optionally by a Character
---@overload fun(self: Weapon, event_name: "AmmoClipChange", callback: fun(self: Weapon, old_ammo_clip: integer, new_ammo_clip: integer)): fun(self: Weapon, old_ammo_clip: integer, new_ammo_clip: integer) @When the Ammo Clip is changed, by reloading or manually setting through scripting
---@overload fun(self: Weapon, event_name: "AmmoBagChange", callback: fun(self: Weapon, old_ammo_clip: integer, new_ammo_clip: integer)): fun(self: Weapon, old_ammo_clip: integer, new_ammo_clip: integer) @When the Ammo Bag is changed, by reloading or manually setting through scripting
function Weapon:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Weapon, event_name: "Spawn", callback: fun(self: Weapon)) @Triggered when an Entity is spawned/created
---@overload fun(self: Weapon, event_name: "Destroy", callback: fun(self: Weapon)) @Triggered when an Entity is destroyed
---@overload fun(self: Weapon, event_name: "ValueChange", callback: fun(self: Weapon, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Weapon, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Weapon, event_name: "DimensionChange", callback: fun(self: Weapon, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Weapon, event_name: "Drop", callback: fun(self: Weapon, character: Character, was_triggered_by_player: boolean)) @When a Character drops this Pickable
---@overload fun(self: Weapon, event_name: "Hit", callback: fun(self: Weapon, impact_force: number, normal_impulse: Vector, impact_location: Vector, velocity: Vector)) @When this Pickable hits something
---@overload fun(self: Weapon, event_name: "Interact", callback: fun(self: Weapon, character: Character): boolean?) @Triggered when a Character interacts with this Pickable (i.e. tries to pick it up)
---@overload fun(self: Weapon, event_name: "PickUp", callback: fun(self: Weapon, character: Character)) @Triggered When a Character picks this up
---@overload fun(self: Weapon, event_name: "PullUse", callback: fun(self: Weapon, character: Character)) @Triggered when a Character presses the use button for this Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Weapon, event_name: "ReleaseUse", callback: fun(self: Weapon, character: Character)) @Triggered when a Character releases the use button for this Pickable (i.e. releases left mouse button with this equipped)
---@overload fun(self: Weapon, event_name: "Fire", callback: fun(self: Weapon, shooter: Character)) @Triggered when Weapon fires (this will be triggered for each shot)
---@overload fun(self: Weapon, event_name: "Reload", callback: fun(self: Weapon, character: Character, ammo_to_reload: integer)) @When a Weapon is reloaded, optionally by a Character
---@overload fun(self: Weapon, event_name: "AmmoClipChange", callback: fun(self: Weapon, old_ammo_clip: integer, new_ammo_clip: integer)) @When the Ammo Clip is changed, by reloading or manually setting through scripting
---@overload fun(self: Weapon, event_name: "AmmoBagChange", callback: fun(self: Weapon, old_ammo_clip: integer, new_ammo_clip: integer)) @When the Ammo Bag is changed, by reloading or manually setting through scripting
function Weapon:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Characters represents Actors which can be possessed, can move and interact with world. They are the default Skeletal Mesh Character built for nanos world.
---@class Character : Entity, Actor, Pawn, Paintable, Damageable
---@overload fun(location: Vector, rotation: Rotator, skeletal_mesh_asset: string, collision_type?: CollisionType, gravity_enabled?: boolean, max_health?: integer, death_sound?: string, pain_sound?: string): Character
Character = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Drops any Pickable the Character is holding
function Character:Drop() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Enters the Vehicle at Seat (0 - Driver)
---@param vehicle Vehicle 
---@param seat? integer @(Default: 0)
function Character:EnterVehicle(vehicle, seat) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gives a Prop to the Character
---@param prop Prop 
function Character:GrabProp(prop) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Leaves the current Vehicle
function Character:LeaveVehicle() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---AI: Tries to make this Character to look at Location
---@param location Vector @World location to look
function Character:LookAt(location) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gives a Melee/Grenade/Weapon (Pickable) to the Character
---@param pickable Pickable 
function Character:PickUp(pickable) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Plays an Animation Montage on this character
---@param animation_path string 
---@param slot_type? AnimationSlotType @(Default: AnimationSlotType.FullBody)
---@param loop_indefinitely? boolean @(Default: false)
---@param blend_in_time? number @(Default: 0.25)
---@param blend_out_time? number @(Default: 0.25)
---@param play_rate? number @(Default: 1.0)
---@param stop_all_montages? boolean @Stops all running Montages from the same Group (Default: false)
function Character:PlayAnimation(animation_path, slot_type, loop_indefinitely, blend_in_time, blend_out_time, play_rate, stop_all_montages) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Blend Space (2D) Animation for Standing<br/><br/>Horizontal Axis stands for Speed X and Vertical Axis for Speed Y
---@param blend_space_path string 
---@param enable_turn_in_place? boolean @(Default: false)
function Character:SetAnimationIdleWalkRunStanding(blend_space_path, enable_turn_in_place) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Blend Space (2D) Animation for Crouching<br/><br/>Horizontal Axis stands for Speed X and Vertical Axis for Speed Y
---@param blend_space_path string 
---@param enable_turn_in_place? boolean @(Default: false)
function Character:SetAnimationIdleWalkRunCrouching(blend_space_path, enable_turn_in_place) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Blend Space (2D) Animation for Proning<br/><br/>Horizontal Axis stands for Speed X and Vertical Axis for Speed Y
---@param blend_space_path string 
function Character:SetAnimationIdleWalkRunProning(blend_space_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Transition Animation between Standing and Crouching
---@param standing_to_crouching string 
---@param crouching_to_standing string 
function Character:SetAnimationsTransitionStandingCrouching(standing_to_crouching, crouching_to_standing) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Transition Animation between Crouching and Proning
---@param crouching_to_proning string 
---@param pronng_to_crouching string 
function Character:SetAnimationsTransitionCrouchingProning(crouching_to_proning, pronng_to_crouching) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Movement Max Acceleration of this Character
---@param walking? integer @(Default: 768)
---@param parachuting? integer @(Default: 512)
---@param skydiving? integer @(Default: 768)
---@param falling? integer @(Default: 128)
---@param swimming? integer @(Default: 256)
---@param swimming_surface? integer @(Default: 256)
---@param flying? integer @(Default: 1024)
function Character:SetAccelerationSettings(walking, parachuting, skydiving, falling, swimming, swimming_surface, flying) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Camera Mode (i.e. Only TPS, FPS or if allow both)<br/><br/>Using FPSOnly CameraMode on AI will lock his body rotation (when using LookAt)
---@param camera_mode CameraMode 
function Character:SetCameraMode(camera_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Camera Offset (only affects TPS)
---@param camera_offset Vector 
function Character:SetCameraOffset(camera_offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Aim
---@param can_aim boolean 
function Character:SetCanAim(can_aim) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Drop the Picked up item
---@param can_drop boolean 
function Character:SetCanDrop(can_drop) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Dive
---@param can_dive boolean 
function Character:SetCanDive(can_dive) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Sprint
---@param can_sprint boolean 
function Character:SetCanSprint(can_sprint) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Grab any Prop
---@param can_grab_props boolean 
function Character:SetCanGrabProps(can_grab_props) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Pick up any Pickable (Weapon, Grenade, Melee...)
---@param can_pickup boolean 
function Character:SetCanPickupPickables(can_pickup) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to Punch
---@param can_punch boolean 
function Character:SetCanPunch(can_punch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if this Character is allowed to deploy the Parachute
---@param can_deploy_parachute boolean 
function Character:SetCanDeployParachute(can_deploy_parachute) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Changes how much damage this character takes on specific bones
---@param bone_name string 
---@param multiplier number 
function Character:SetDamageMultiplier(bone_name, multiplier) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Changes the Death sound when Character dies
---@param sound_asset string 
function Character:SetDeathSound(sound_asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the Fall Damage multiplier taken when falling from High places.<br/><br/>Setting to 0 will make the Character to do not take any damage
---@param damage integer @Default is 10
function Character:SetFallDamageTaken(damage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Flying Mode
---@param flying_mode boolean 
function Character:SetFlyingMode(flying_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Field of View multiplier
---@param multiplier number 
function Character:SetFOVMultiplier(multiplier) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets time elapsed until automatically transition to HighFalling state (from SmallFalling) in seconds<br/><br/>Set it to -1 to never enter HighFalling time and consequently do not ragdoll when falling
---@param time number @Default is 1 second
function Character:SetHighFallingTime(time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if the character will react to damage by applying small dynamic ragdoll effect to local bones damaged
---@param is_enabled boolean 
function Character:SetHitReactionEnabled(is_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Gait Mode
---@param gait_mode GaitMode 
function Character:SetGaitMode(gait_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Changes the Gravity Scale of this Character (can be negative)
---@param gravity_scale number 
function Character:SetGravityScale(gravity_scale) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the Impact Damage taken when being roamed by things.<br/><br/>Setting to 0 will make the Character to do not take damage or enter ragdoll mode
---@param impact_damage integer @Default is 10
function Character:SetImpactDamageTaken(impact_damage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the minimum radial damage taken (e.g. explosions) to enter in ragdoll mode.<br/><br/>Setting to -1 will make the Character to do not enter ragdoll mode when getting radial damage
---@param damage integer @Default is 50
function Character:SetRadialDamageToRagdoll(damage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the Footstep Volume multiplier
---@param volume_multiplier number 
function Character:SetFootstepVolumeMultiplier(volume_multiplier) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets if the Character can receive any damage
---@param is_invulnerable boolean 
function Character:SetInvulnerable(is_invulnerable) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Changes the Character Mesh on the fly
---@param skeletal_mesh_asset string 
function Character:SetMesh(skeletal_mesh_asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Set Morph Target with Name and Value
---@param name string @Morph Target Name
---@param value number 
function Character:SetMorphTarget(name, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the value of a Morph Target
---@param name string @Morph Target Name
---@return number @value of the Morph Target
function Character:GetMorphTarget(name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Clear all Morph Target that are set to this Mesh
function Character:ClearMorphTargets() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns a table with all morph targets available
---@return string[] @table with all morph targets available
function Character:GetAllMorphTargetNames() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Applies the physical animation settings to the body given
---@param bone string @The body we will be driving
---@param include_self boolean @Whether to modify the given body
---@param is_local_simulation boolean @Whether the drive targets are in world space or local
---@param orientation_strength? number @The strength used to correct orientation error (Default: 0)
---@param angular_velocity_strength? number @The strength used to correct angular velocity error (Default: 0)
---@param position_strength? number @The strength used to correct linear position error. Only used for non-local simulation (Default: 0)
---@param velocity_strength? number @The strength used to correct linear velocity error. Only used for non-local simulation (Default: 0)
---@param max_linear_force? number @The max force used to correct linear errors (Default: 0)
---@param max_angular_force? number @The max force used to correct angular errors (Default: 0)
function Character:SetPhysicalAnimationSettings(bone, include_self, is_local_simulation, orientation_strength, angular_velocity_strength, position_strength, velocity_strength, max_linear_force, max_angular_force) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Resets all Physical Animation settings
function Character:ResetPhysicalAnimationSettings() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Enables/Disables Character's Input
---@param is_enabled boolean 
function Character:SetInputEnabled(is_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Changes the Parachute Texture
---@param texture string 
function Character:SetParachuteTexture(texture) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Changes the Pain sound when Character takes damage
---@param sound_asset string 
function Character:SetPainSound(sound_asset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Set the Punch Damage this Character will apply on others
---@param punch_damage integer @Default is 15
function Character:SetPunchDamage(punch_damage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets Character Ragdoll Mode
---@param ragdoll_enabled boolean 
function Character:SetRagdollMode(ragdoll_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Character Capsule to simulate physics
---@param simulate_physics boolean 
function Character:SetSimulatePhysics(simulate_physics) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets all speed multiplier
---@param speed_multiplier number @1 is normal
function Character:SetSpeedMultiplier(speed_multiplier) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the Stance Mode
---@param stance_mode StanceMode 
function Character:SetStanceMode(stance_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets a Team which will disable damaging same Team Members
---@param team integer @0 is neutral and default
function Character:SetTeam(team) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the View Mode
---@param view_mode ViewMode 
function Character:SetViewMode(view_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the Weapon's Aim Mode
---@param aim_mode AimMode 
function Character:SetWeaponAimMode(aim_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---UnGrabs/Drops the Prop the Character is holding
function Character:UnGrabProp() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if Character is in ragdoll mode
---@return boolean 
function Character:IsInRagdollMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if is invulnerable
---@return boolean 
function Character:IsInvulnerable() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if has input enabled
---@return boolean 
function Character:IsInputEnabled() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the camera mode
---@return CameraMode 
function Character:GetCameraMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can drop
---@return boolean 
function Character:GetCanDrop() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can punch
---@return boolean 
function Character:GetCanPunch() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can aim
---@return boolean 
function Character:GetCanAim() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can crouch
---@return boolean 
function Character:GetCanCrouch() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can sprint
---@return boolean 
function Character:GetCanSprint() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can grab props
---@return boolean 
function Character:GetCanGrabProps() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if can pickup Pickables (Weapons, Melee, Grenade...)
---@return boolean 
function Character:GetCanPickupPickables() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Capsule Size
---@return { Radius: integer, HalfHeight: integer } 
function Character:GetCapsuleSize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a Bone Transform in world space given a bone name
---@param bone_name string 
---@return { Location: Vector, Rotation: Rotator } 
function Character:GetBoneTransform(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Damage Multiplier of a bone
---@param bone_name string 
---@return number @the damage multiplier of the bone
function Character:GetDamageMultiplier(bone_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Fall Damage
---@return integer 
function Character:GetFallDamageTaken() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the FallingMode
---@return FallingMode 
function Character:GetFallingMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets if it's in Flying mode
---@return boolean 
function Character:GetFlyingMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the GaitMode
---@return GaitMode 
function Character:GetGaitMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Grabbed Prop
---@return Prop? 
function Character:GetGrabbedProp() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the gravity scale
---@return number 
function Character:GetGravityScale() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the impact damage taken
---@return integer 
function Character:GetImpactDamageTaken() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Jump Z Velocity
---@return integer 
function Character:GetJumpZVelocity() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Pickable if picking up
---@return Pickable? 
function Character:GetPicked() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the punch damage
---@return integer 
function Character:GetPunchDamage() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the speed multiplier
---@return number 
function Character:GetSpeedMultiplier() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Stance Mode
---@return StanceMode 
function Character:GetStanceMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Swimming Mode
---@return SwimmingMode 
function Character:GetSwimmingMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Team
---@return integer 
function Character:GetTeam() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the entered Vehicle
---@return Vehicle? 
function Character:GetVehicle() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the entered Vehicle seat
---@return integer 
function Character:GetVehicleSeat() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the View Mode
---@return ViewMode 
function Character:GetViewMode() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Weapon Aim Mode
---@return AimMode 
function Character:GetWeaponAimMode() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(self: Character, event_name: "Spawn", callback: fun(self: Character)): fun(self: Character) @Triggered when an Entity is spawned/created
---@overload fun(self: Character, event_name: "Destroy", callback: fun(self: Character)): fun(self: Character) @Triggered when an Entity is destroyed
---@overload fun(self: Character, event_name: "ValueChange", callback: fun(self: Character, key: string, value: any)): fun(self: Character, key: string, value: any) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Character, event_name: "ClassRegister", callback: fun(class: table)): fun(class: table) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Character, event_name: "DimensionChange", callback: fun(self: Character, old_dimension: integer, new_dimension: integer)): fun(self: Character, old_dimension: integer, new_dimension: integer) @Triggered when an Actor changes it's dimension
---@overload fun(self: Character, event_name: "Possess", callback: fun(self: Character, possesser: Player)): fun(self: Character, possesser: Player) @When Character is possessed
---@overload fun(self: Character, event_name: "UnPossess", callback: fun(self: Character, old_possesser: Player)): fun(self: Character, old_possesser: Player) @When Character is unpossessed
---@overload fun(self: Character, event_name: "MoveComplete", callback: fun(self: Character, succeeded: boolean)): fun(self: Character, succeeded: boolean) @Called when AI reaches it's destination, or when it fails
---@overload fun(self: Character, event_name: "HealthChange", callback: fun(self: Character, old_health: integer, new_health: integer)): fun(self: Character, old_health: integer, new_health: integer) @When Entity has it's Health changed, or because took damage or manually set through scripting or respawning
---@overload fun(self: Character, event_name: "Respawn", callback: fun(self: Character)): fun(self: Character) @When Entity Respawns
---@overload fun(self: Character, event_name: "Death", callback: fun(self: Character, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor)): fun(self: Character, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor) @When Entity Dies
---@overload fun(self: Character, event_name: "TakeDamage", callback: fun(self: Character, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?): fun(self: Character, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean? @Triggered when this Entity takes damage
---@overload fun(self: Character, event_name: "AnimationBeginNotify", callback: fun(self: Character, notify_name: string)): fun(self: Character, notify_name: string) @When an Animation Montage Notify begins
---@overload fun(self: Character, event_name: "AnimationEndNotify", callback: fun(self: Character, notify_name: string)): fun(self: Character, notify_name: string) @When an Animation Montage Notify ends
---@overload fun(self: Character, event_name: "Attack", callback: fun(self: Character, melee: Melee)): fun(self: Character, melee: Melee) @Triggered when the Character effectively attacks with a Melee
---@overload fun(self: Character, event_name: "Drop", callback: fun(self: Character, object: Pickable, triggered_by_player: boolean)): fun(self: Character, object: Pickable, triggered_by_player: boolean) @When Character drops the currently picked up Pickable
---@overload fun(self: Character, event_name: "EnterVehicle", callback: fun(self: Character, vehicle: Vehicle, seat_index: integer)): fun(self: Character, vehicle: Vehicle, seat_index: integer) @When Character enters a vehicle
---@overload fun(self: Character, event_name: "AttemptEnterVehicle", callback: fun(self: Character, vehicle: Vehicle, seat_index: integer): boolean?): fun(self: Character, vehicle: Vehicle, seat_index: integer): boolean? @Triggered when a Character attempts to enter a vehicle
---@overload fun(self: Character, event_name: "FallingModeChange", callback: fun(self: Character, old_state: FallingMode, new_state: FallingMode)): fun(self: Character, old_state: FallingMode, new_state: FallingMode) @Called when FallingMode changes
---@overload fun(self: Character, event_name: "Fire", callback: fun(self: Character, weapon: Weapon)): fun(self: Character, weapon: Weapon) @When Character fires a Weapon
---@overload fun(self: Character, event_name: "GaitModeChange", callback: fun(self: Character, old_state: GaitMode, new_state: GaitMode)): fun(self: Character, old_state: GaitMode, new_state: GaitMode) @Called when GaitMode changes
---@overload fun(self: Character, event_name: "GrabProp", callback: fun(self: Character, prop: Prop)): fun(self: Character, prop: Prop) @When Character grabs up a Prop
---@overload fun(self: Character, event_name: "Highlight", callback: fun(self: Character, is_highlighted: boolean, object: Prop|Pickable)): fun(self: Character, is_highlighted: boolean, object: Prop|Pickable) @When Character highlights/looks at a Prop or a Pickable
---@overload fun(self: Character, event_name: "Interact", callback: fun(self: Character, object: Prop|Pickable): boolean?): fun(self: Character, object: Prop|Pickable): boolean? @Triggered when a Character interacts with a Prop or Pickable
---@overload fun(self: Character, event_name: "LeaveVehicle", callback: fun(self: Character, vehicle: Vehicle)): fun(self: Character, vehicle: Vehicle) @When Character leaves a vehicle
---@overload fun(self: Character, event_name: "AttemptLeaveVehicle", callback: fun(self: Character, vehicle: Vehicle): boolean?): fun(self: Character, vehicle: Vehicle): boolean? @Triggered when this Character attempts to leave a vehicle
---@overload fun(self: Character, event_name: "PickUp", callback: fun(self: Character, object: Pickable)): fun(self: Character, object: Pickable) @When Character picks up anything
---@overload fun(self: Character, event_name: "Punch", callback: fun(self: Character)): fun(self: Character) @When Character punches
---@overload fun(self: Character, event_name: "RagdollModeChange", callback: fun(self: Character, old_state: boolean, new_state: boolean)): fun(self: Character, old_state: boolean, new_state: boolean) @When Character enters or leaves ragdoll
---@overload fun(self: Character, event_name: "AttemptReload", callback: fun(self: Character, weapon: Weapon): boolean?): fun(self: Character, weapon: Weapon): boolean? @Triggered when this Character attempts to reload
---@overload fun(self: Character, event_name: "Reload", callback: fun(self: Character, weapon: Weapon, ammo_to_reload: integer)): fun(self: Character, weapon: Weapon, ammo_to_reload: integer) @When Character reloads a weapon
---@overload fun(self: Character, event_name: "StanceModeChange", callback: fun(self: Character, old_state: StanceMode, new_state: StanceMode)): fun(self: Character, old_state: StanceMode, new_state: StanceMode) @Called when StanceMode changes
---@overload fun(self: Character, event_name: "SwimmingModeChange", callback: fun(self: Character, old_state: SwimmingMode, new_state: SwimmingMode)): fun(self: Character, old_state: SwimmingMode, new_state: SwimmingMode) @Called when Swimming Mode changes
---@overload fun(self: Character, event_name: "UnGrabProp", callback: fun(self: Character, prop: Prop)): fun(self: Character, prop: Prop) @When Character drops a Prop
---@overload fun(self: Character, event_name: "ViewModeChange", callback: fun(self: Character, old_state: ViewMode, new_state: ViewMode)): fun(self: Character, old_state: ViewMode, new_state: ViewMode) @When Character changes it's View Mode
---@overload fun(self: Character, event_name: "WeaponAimModeChange", callback: fun(self: Character, old_state: AimMode, new_state: AimMode)): fun(self: Character, old_state: AimMode, new_state: AimMode) @Called when Weapon Aim Mode changes
---@overload fun(self: Character, event_name: "PullUse", callback: fun(self: Character, pickable: Pickable)): fun(self: Character, pickable: Pickable) @Triggered when a Character presses the use button for a Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Character, event_name: "ReleaseUse", callback: fun(self: Character, pickable: Pickable)): fun(self: Character, pickable: Pickable) @Triggered when a Character releases the use button for a Pickable (i.e. releases left mouse button with this equipped)
function Character:Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(self: Character, event_name: "Spawn", callback: fun(self: Character)) @Triggered when an Entity is spawned/created
---@overload fun(self: Character, event_name: "Destroy", callback: fun(self: Character)) @Triggered when an Entity is destroyed
---@overload fun(self: Character, event_name: "ValueChange", callback: fun(self: Character, key: string, value: any)) @Triggered when an Entity has a value changed with <code>:SetValue()</code>
---@overload fun(self: Character, event_name: "ClassRegister", callback: fun(class: table)) @Triggered when a new Class is registered with the <a href='/docs/core-concepts/scripting/inheriting-classes'>Inheriting System</a>
---@overload fun(self: Character, event_name: "DimensionChange", callback: fun(self: Character, old_dimension: integer, new_dimension: integer)) @Triggered when an Actor changes it's dimension
---@overload fun(self: Character, event_name: "Possess", callback: fun(self: Character, possesser: Player)) @When Character is possessed
---@overload fun(self: Character, event_name: "UnPossess", callback: fun(self: Character, old_possesser: Player)) @When Character is unpossessed
---@overload fun(self: Character, event_name: "MoveComplete", callback: fun(self: Character, succeeded: boolean)) @Called when AI reaches it's destination, or when it fails
---@overload fun(self: Character, event_name: "HealthChange", callback: fun(self: Character, old_health: integer, new_health: integer)) @When Entity has it's Health changed, or because took damage or manually set through scripting or respawning
---@overload fun(self: Character, event_name: "Respawn", callback: fun(self: Character)) @When Entity Respawns
---@overload fun(self: Character, event_name: "Death", callback: fun(self: Character, last_damage_taken: integer, last_bone_damaged: string, damage_type_reason: DamageType, hit_from_direction: Vector, instigator?: Player, causer?: Actor)) @When Entity Dies
---@overload fun(self: Character, event_name: "TakeDamage", callback: fun(self: Character, damage: integer, bone: string, type: DamageType, from_direction: Vector, instigator: Player, causer: any): boolean?) @Triggered when this Entity takes damage
---@overload fun(self: Character, event_name: "AnimationBeginNotify", callback: fun(self: Character, notify_name: string)) @When an Animation Montage Notify begins
---@overload fun(self: Character, event_name: "AnimationEndNotify", callback: fun(self: Character, notify_name: string)) @When an Animation Montage Notify ends
---@overload fun(self: Character, event_name: "Attack", callback: fun(self: Character, melee: Melee)) @Triggered when the Character effectively attacks with a Melee
---@overload fun(self: Character, event_name: "Drop", callback: fun(self: Character, object: Pickable, triggered_by_player: boolean)) @When Character drops the currently picked up Pickable
---@overload fun(self: Character, event_name: "EnterVehicle", callback: fun(self: Character, vehicle: Vehicle, seat_index: integer)) @When Character enters a vehicle
---@overload fun(self: Character, event_name: "AttemptEnterVehicle", callback: fun(self: Character, vehicle: Vehicle, seat_index: integer): boolean?) @Triggered when a Character attempts to enter a vehicle
---@overload fun(self: Character, event_name: "FallingModeChange", callback: fun(self: Character, old_state: FallingMode, new_state: FallingMode)) @Called when FallingMode changes
---@overload fun(self: Character, event_name: "Fire", callback: fun(self: Character, weapon: Weapon)) @When Character fires a Weapon
---@overload fun(self: Character, event_name: "GaitModeChange", callback: fun(self: Character, old_state: GaitMode, new_state: GaitMode)) @Called when GaitMode changes
---@overload fun(self: Character, event_name: "GrabProp", callback: fun(self: Character, prop: Prop)) @When Character grabs up a Prop
---@overload fun(self: Character, event_name: "Highlight", callback: fun(self: Character, is_highlighted: boolean, object: Prop|Pickable)) @When Character highlights/looks at a Prop or a Pickable
---@overload fun(self: Character, event_name: "Interact", callback: fun(self: Character, object: Prop|Pickable): boolean?) @Triggered when a Character interacts with a Prop or Pickable
---@overload fun(self: Character, event_name: "LeaveVehicle", callback: fun(self: Character, vehicle: Vehicle)) @When Character leaves a vehicle
---@overload fun(self: Character, event_name: "AttemptLeaveVehicle", callback: fun(self: Character, vehicle: Vehicle): boolean?) @Triggered when this Character attempts to leave a vehicle
---@overload fun(self: Character, event_name: "PickUp", callback: fun(self: Character, object: Pickable)) @When Character picks up anything
---@overload fun(self: Character, event_name: "Punch", callback: fun(self: Character)) @When Character punches
---@overload fun(self: Character, event_name: "RagdollModeChange", callback: fun(self: Character, old_state: boolean, new_state: boolean)) @When Character enters or leaves ragdoll
---@overload fun(self: Character, event_name: "AttemptReload", callback: fun(self: Character, weapon: Weapon): boolean?) @Triggered when this Character attempts to reload
---@overload fun(self: Character, event_name: "Reload", callback: fun(self: Character, weapon: Weapon, ammo_to_reload: integer)) @When Character reloads a weapon
---@overload fun(self: Character, event_name: "StanceModeChange", callback: fun(self: Character, old_state: StanceMode, new_state: StanceMode)) @Called when StanceMode changes
---@overload fun(self: Character, event_name: "SwimmingModeChange", callback: fun(self: Character, old_state: SwimmingMode, new_state: SwimmingMode)) @Called when Swimming Mode changes
---@overload fun(self: Character, event_name: "UnGrabProp", callback: fun(self: Character, prop: Prop)) @When Character drops a Prop
---@overload fun(self: Character, event_name: "ViewModeChange", callback: fun(self: Character, old_state: ViewMode, new_state: ViewMode)) @When Character changes it's View Mode
---@overload fun(self: Character, event_name: "WeaponAimModeChange", callback: fun(self: Character, old_state: AimMode, new_state: AimMode)) @Called when Weapon Aim Mode changes
---@overload fun(self: Character, event_name: "PullUse", callback: fun(self: Character, pickable: Pickable)) @Triggered when a Character presses the use button for a Pickable (i.e. clicks left mouse button with this equipped)
---@overload fun(self: Character, event_name: "ReleaseUse", callback: fun(self: Character, pickable: Pickable)) @Triggered when a Character releases the use button for a Pickable (i.e. releases left mouse button with this equipped)
function Character:Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Server represents all Server controls in the Server side.
---@class Server
Server = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Restarts the server in a new Map, restarts all packages and reconnects all players
---@param map_path string @The new map to load
function Server.ChangeMap(map_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Loads a Package
---@param package_folder_name string @The package to load
---@return boolean @if the Package was loaded
function Server.LoadPackage(package_folder_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Reloads a Package<br/>Note: the package is effectively reloaded in the next server tick
---@param package_folder_name string @The package to reload
---@return boolean @if the Package was found
function Server.ReloadPackage(package_folder_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Unloads a Package<br/>Note: the package is effectively unloaded in the next server tick
---@param package_folder_name string @The package you want unload
---@return boolean @if the Package was found
function Server.UnloadPackage(package_folder_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the description of the server, optionally overrides Config.toml
---@param description string @The new description
---@param persist_to_config_file? boolean @Persist to config file (Default: false)
function Server.SetDescription(description, persist_to_config_file) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the logo of the server, optionally overrides Config.toml
---@param logo_url string @The new logo
---@param persist_to_config_file? boolean @Persist to config file (Default: false)
function Server.SetLogo(logo_url, persist_to_config_file) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the maximum player slots of the server, optionally overrides Config.toml
---@param max_players integer @The maximum players
---@param persist_to_config_file? boolean @Persist to config file (Default: false)
function Server.SetMaxPlayers(max_players, persist_to_config_file) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the name of the server, optionally overrides Config.toml
---@param name string @The new name
---@param persist_to_config_file? boolean @Persist to config file (Default: false)
function Server.SetName(name, persist_to_config_file) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets the password of the server, optionally overrides Config.toml
---@param password string @The new password
---@param persist_to_config_file? boolean @Persist to config file (Default: false)
function Server.SetPassword(password, persist_to_config_file) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sets a global value in the Server, which can be accessed from anywhere (server side)
---@param key string @Key
---@param value any @Value
---@param sync_on_client? boolean @If enabled will sync this value through all clients, accessible through Client.GetValue() static class. (Default: false)
function Server.SetValue(key, value, sync_on_client) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gets a value given a key
---@param key string @Key
---@param fallback any @Fallback Value if key doesn't exist
---@return any @Value at key or fallback if key doesn't exist
function Server.GetValue(key, fallback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gets a list of all values keys
---@return string[] @a list with all values keys
function Server.GetAllValuesKeys() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Unbans a Player by it's account ID
---@param account_id string @nanos account ID
function Server.Unban(account_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Stops the server
function Server.Stop() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Restarts the server, reloading all Packages and reconnecting all Players
function Server.Restart() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the current Map Package name
---@return string @the current map package
function Server.GetMap() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the current Map Asset reference
---@return string @the current map asset
function Server.GetMapAsset() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns a list of the Custom Config of the current map (stored in the MAP_NAME.toml)
---@return table @a list of the Custom Config of the current map
function Server.GetMapConfig() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns a list of the Spawn Points of the current map (stored in the MAP_NAME.toml)
---@return { location: Vector, rotation: Rotator }[] @a list of the Spawn Points of the current map
function Server.GetMapSpawnPoints() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns a list of Packages running, optionally returns all Packages installed in the server
---@param only_loaded? boolean @Set to true the function return only loaded and running packages. Caution: setting to false will retrieve Packages list from disk, which is a slow operation! (Default: true)
---@param package_type_filter? PackageType @Which Package type to return. Leave it default (-1) to return all types. (Default: -1)
---@return { title: string, name: string, type: PackageType, version: string, author: string }[] @a list of Packages data
function Server.GetPackages(only_loaded, package_type_filter) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the server version
---@return string @the server version
function Server.GetVersion() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the server Public IP
---@return string @the server Public IP
function Server.GetIP() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the server Port
---@return integer @the server Port
function Server.GetPort() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the server QueryPort
---@return integer @the server QueryPort
function Server.GetQueryPort() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the server Compression Level being used
---@return integer @the server Compression Level
function Server.GetCompressionLevel() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the Max Players configured
---@return integer @the max players configured
function Server.GetMaxPlayers() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the Server Description
---@return string @the Server Description
function Server.GetDescription() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the Server Custom Settings passed as parameter or New Game screen
---@return table[] @a list of the Custom Settings
function Server.GetCustomSettings() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns the Configured Tick Rate
---@return integer @the server Tick Rate
function Server.GetTickRate() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Gets the Unix Epoch Time in milliseconds
---@return integer @the unix timestamp
function Server.GetTime() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Returns if the Server is announced in the Master List
---@return boolean @if the Server is announced in the Master List
function Server.IsAnnounced() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "Start", callback: fun()): fun() @Server has been started
---@overload fun(event_name: "Restart", callback: fun()): fun() @Server has been restarted
---@overload fun(event_name: "ChangeMap", callback: fun(old_map: string, new_map: string)): fun(old_map: string, new_map: string) @Called when the map changes. This is always called just before Restart event
---@overload fun(event_name: "PlayerConnect", callback: fun(IP: string, player_account_ID: string, player_name: string, player_steam_ID: string): boolean?): fun(IP: string, player_account_ID: string, player_name: string, player_steam_ID: string): boolean? @Called when a player is attempting to connect to the server
---@overload fun(event_name: "Stop", callback: fun()): fun() @Server has been stopped
---@overload fun(event_name: "Tick", callback: fun(delta_time: number)): fun(delta_time: number) @Triggered every 33ms by default<br/><br/>Caution: Only small operations should be performed here, otherwise this can lead to server lag and delays
function Server.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "Start", callback: fun()) @Server has been started
---@overload fun(event_name: "Restart", callback: fun()) @Server has been restarted
---@overload fun(event_name: "ChangeMap", callback: fun(old_map: string, new_map: string)) @Called when the map changes. This is always called just before Restart event
---@overload fun(event_name: "PlayerConnect", callback: fun(IP: string, player_account_ID: string, player_name: string, player_steam_ID: string): boolean?) @Called when a player is attempting to connect to the server
---@overload fun(event_name: "Stop", callback: fun()) @Server has been stopped
---@overload fun(event_name: "Tick", callback: fun(delta_time: number)) @Triggered every 33ms by default<br/><br/>Caution: Only small operations should be performed here, otherwise this can lead to server lag and delays
function Server.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws Debug shapes in the world.
---@class Debug
Debug = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug box in the world
---@param location Vector 
---@param extent Vector 
---@param rotation Rotator 
---@param color Color 
---@param life_time number 
---@param thickness number 
function Debug.DrawBox(location, extent, rotation, color, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug coordinate system in the world
---@param location Vector 
---@param rotation Rotator 
---@param size number 
---@param life_time number 
---@param thickness number 
function Debug.DrawCoordinateSystem(location, rotation, size, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug crosshair in the world
---@param location Vector 
---@param rotation Rotator 
---@param size? number @(Default: 100)
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param thickness number 
function Debug.DrawCrosshairs(location, rotation, size, color, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug cylinder in the world
---@param start_location Vector 
---@param end_location Vector 
---@param radius number 
---@param segments integer 
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param thickness number 
function Debug.DrawCylinder(start_location, end_location, radius, segments, color, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug directional arrow in the world
---@param start_location Vector 
---@param end_location Vector 
---@param arrow_size? number @(Default: 100)
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param thickness number 
function Debug.DrawDirectionalArrow(start_location, end_location, arrow_size, color, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug Line in the World
---@param start_position Vector 
---@param end_position Vector 
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param thickness number 
function Debug.DrawLine(start_position, end_position, color, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug Point in the World
---@param start_position Vector 
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param size number 
function Debug.DrawPoint(start_position, color, life_time, size) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug sphere in the World
---@param start_location Vector 
---@param radius number 
---@param segments integer 
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param thickness number 
function Debug.DrawSphere(start_location, radius, segments, color, life_time, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Draws a Debug string in the world
---@param location Vector 
---@param text string 
---@param color? Color @(Default: Color.RED)
---@param life_time number 
---@param draw_shadow boolean 
---@param font_scale number 
function Debug.DrawString(location, text, color, life_time, draw_shadow, font_scale) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Class which represents the current Package
---@class Package
Package = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Makes any variable available in the global scope
---@param variable_name string @Name of the variable to export
---@param value any @Value to be set in the global scope
function Package.Export(variable_name, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Includes new .lua files<br/><br/>We currently support 5 searchers, which are looked in the following order:<br/><ol><li>Relative to <code>current-file-path/</code></li><li>Relative to <code>current-package/Client/</code> or <code>current-package/Server/</code> (depending on your side)</li><li>Relative to <code>current-package/Shared/</code></li><li>Relative to <code>current-package/</code></li><li>Relative to <code>Packages/</code></li></ol>
---@param script_file string @Path to the script file to require
---@param force_load? boolean @Whether to force loading this file even if it was already loaded
---@return any @Any return values from the included file
function Package.Require(script_file, force_load) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets a Persistent Value which will be saved to disk
---@param key string @Key to index data into
---@param value any @Value to set at the key
function Package.SetPersistentData(key, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list of all files in this package, optionally with filters
---@param path_filter? string @Path filter (Default: "")
---@return string[] @List of directories
function Package.GetDirectories(path_filter) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list of all files in this package, optionally with filters
---@param path_filter? string|table @Path filter (Default: "")
---@param extension_filter? string @Example: <code>.lua</code> (Default: "")
---@return string[] @List of files
function Package.GetFiles(path_filter, extension_filter) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the package name/path
---@return string @The package name/path
function Package.GetName() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the package title
---@return string @The package title
function Package.GetTitle() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the package version
---@return string @The package version
function Package.GetVersion() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the package compatibility version
---@return string @The package compatibility version
function Package.GetCompatibilityVersion() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Persistent Value from the disk
---@param key? string @The key to get the data (Default: "")
---@return table @Persistent values from disk
function Package.GetPersistentData(key) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Flushes the Persistent Data pending changes to disk immediately
function Package.FlushPersistentData() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "Load", callback: fun()): fun() @Called when this package is loaded<br/><br/>This event is triggered differently depending on the situation:<br/><ul><li>When the <b>server starts</b> or you run <code>package reload all</code> the event triggers only after ALL packages are loaded.</li><li>In all other cases (<code>package load/reload</code> or <code>Package.Load/Reload</code>) the event is triggered immediately after the package is loaded/reloaded.</li></ul>
---@overload fun(event_name: "Unload", callback: fun()): fun() @Called when this package is unloaded
function Package.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "Load", callback: fun()) @Called when this package is loaded<br/><br/>This event is triggered differently depending on the situation:<br/><ul><li>When the <b>server starts</b> or you run <code>package reload all</code> the event triggers only after ALL packages are loaded.</li><li>In all other cases (<code>package load/reload</code> or <code>Package.Load/Reload</code>) the event is triggered immediately after the package is loaded/reloaded.</li></ul>
---@overload fun(event_name: "Unload", callback: fun()) @Called when this package is unloaded
function Package.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Interaction with Post Process effects.
---@class PostProcess
PostProcess = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Bloom Settings
---@param intensity? number @(Default: 0.675)
---@param threshold? number @(Default: -1)
function PostProcess.SetBloom(intensity, threshold) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Chromatic Abberation Settings
---@param intensity? number @(Default: 0)
---@param start_offset? number @(Default: 0)
function PostProcess.SetChromaticAberration(intensity, start_offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Image Effect Settings
---@param vignette_intensity? number @(Default: 0.6)
---@param grain_jitter? number @(Default: 0)
---@param grain_intensity? number @(Default: 0)
function PostProcess.SetImageEffects(vignette_intensity, grain_jitter, grain_intensity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Exposure Settings
---@param exposure_compensation? number @(Default: 1)
---@param min_ev100? number @(Default: -10)
---@param max_ev100? number @(Default: 20)
---@param low_percent? number @(Default: 10)
---@param high_percent? number @(Default: 90)
function PostProcess.SetExposure(exposure_compensation, min_ev100, max_ev100, low_percent, high_percent) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Film Settings
---@param slope? number @(Default: 0.8)
---@param toe? number @(Default: 0.55)
---@param shoulder? number @(Default: 0.26)
---@param black_clip? number @(Default: 0)
---@param white_clip? number @(Default: 0.3)
function PostProcess.SetFilm(slope, toe, shoulder, black_clip, white_clip) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Saturation Colors. Use Alpha for everall Saturation intensity
---@param color Color 
function PostProcess.SetGlobalSaturation(color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Set Post Process Lookup Table Texture
---@param texture_path string 
function PostProcess.SetLookupTable(texture_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets a Post Process Material
---@param material_path string @The Material Asset to set as Post Process
function PostProcess.SetMaterial(material_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Removes the current Post Process Material
function PostProcess.RemoveMaterial() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the sun's angle (0-360)
---@param angle number 
function PostProcess.SetSunAngle(angle) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Initialize and set Discord activity.
---@class Discord
Discord = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Initializes the Discord Integration with your custom client_id
---@param client_id integer 
function Discord.Initialize(client_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Communicates with Discord and sets a custom user status
---@param state string 
---@param details string 
---@param large_image string 
---@param large_text string 
---@param reset_time? string @Whether or not to reset current activity elapsed time (Default: false)
function Discord.SetActivity(state, details, large_image, large_text, reset_time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Exposes access to registering Console Commands and Logging messages.
---@class Console
Console = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Logs and formats a message in the console, with formatted arguments
---@param message string @Message to print
---@param ...? any @Other arguments to format with the message using string.format (Default: nil)
function Console.Log(message, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Logs an orange warning in the console, with formatted arguments
---@param message string @Message to print
---@param ...? any @Other arguments to format with the message using string.format (Default: nil)
function Console.Warn(message, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Logs a red error in the console, with formatted arguments
---@param message string @Message to print
---@param ...? any @Other arguments to format with the message using string.format (Default: nil)
function Console.Error(message, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Registers a new Console Command
---@param command string @The command
---@param callback function @The callback to be called when the command is inputted
---@param description string @The command description to display in the console
---@param parameters string[] @The list of supported parameters to display in the console
function Console.RegisterCommand(command, callback, description, parameters) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Runs a Console Command programmatically
---@param command string @The command
function Console.RunCommand(command) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "PlayerSubmit", callback: fun(text: string)): fun(text: string) @Called when a console command is submitted
---@overload fun(event_name: "LogEntry", callback: fun(text: string, type: LogType)): fun(text: string, type: LogType) @Called when a log is received
---@overload fun(event_name: "Open", callback: fun()): fun() @When player opens the Console
---@overload fun(event_name: "Close", callback: fun()): fun() @When player closes the Console
function Console.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "PlayerSubmit", callback: fun(text: string)) @Called when a console command is submitted
---@overload fun(event_name: "LogEntry", callback: fun(text: string, type: LogType)) @Called when a log is received
---@overload fun(event_name: "Open", callback: fun()) @When player opens the Console
---@overload fun(event_name: "Close", callback: fun()) @When player closes the Console
function Console.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Subscribe for user-defined Events.
---@class Events
Events = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Calls an Event which will be triggered in all Local Packages
---@param event_name string @The Event Name to trigger the event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Events.Call(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Calls an Event if on Client which will be triggered in all Server Packages
---@param event_name string @The Event Name to trigger the event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Events.CallRemote(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Calls an Event if on Server which will be triggered in all Client's Packages of a specific Player
---@param event_name string @The Event Name to trigger the event
---@param player Player @The remote player to send this event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Events.CallRemote(event_name, player, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Calls an Event on Server which will be triggered in all Client's Packages of all Players
---@param event_name string @The Event Name to trigger the event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Events.BroadcastRemote(event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Calls an Event on Server which will be triggered in all Client's Packages of all Players in that dimension
---@param dimension integer @The Dimension to send this event
---@param event_name string @The Event Name to trigger the event
---@param ...? any @Arguments to pass to the event (Default: nil)
function Events.BroadcastRemoteDimension(dimension, event_name, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Subscribes for an user-created event which will be triggered for only local called events
---@param event_name string @The Event Name to subscribe
---@param callback function @The callback function to execute
---@return function @the subscribed callback itself
function Events.Subscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Subscribes for an user-created event which will be triggered for only remote called events
---@param event_name string @The Event Name to subscribe
---@param callback function @The callback function to execute
---@return function @the subscribed callback itself
function Events.SubscribeRemote(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Unsubscribes from all subscribed events in this Package with that event name, optionally passing the function to unsubscribe only that callback
---@param event_name string @The Event Name to unsubscribe
---@param callback? function @The callback function to unsubscribe (Default: nil)
function Events.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Unsubscribes from all subscribed remote events in this Package with that event name, optionally passing the function to unsubscribe only that callback
---@param event_name string @The Event Name to unsubscribe
---@param callback? function @The callback function to unsubscribe (Default: nil)
function Events.UnsubscribeRemote(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Retrieve Assets Data from Asset Packs.
---@class Assets
Assets = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing information about all loaded Asset Packs
---@return { Name: string, Path: string, Author: string, Version: string }[] 
function Assets.GetAssetPacks() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the file path of an asset
---@param asset string @The asset reference in the format <code>asset-pack::AssetKey</code>
---@param asset_type AssetType @The Asset Type
---@return string @The file path defined in the Assets.toml
function Assets.GetAssetPath(asset, asset_type) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Animation Assets Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetAnimations(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Blueprints Assets Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetBlueprints(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Map Asset Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetMaps(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Materials Asset Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetMaterials(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Particle Assets Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetParticles(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Sound Assets Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetSounds(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Skeletal Mesh Asset Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetSkeletalMeshes(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Static Mesh Assets Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetStaticMeshes(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets a list containing all Other Assets Keys from an AssetPack
---@param asset_pack_path string @The Asset Pack path to get the assets
---@return { key: string, ...: any }[] @array of tables containing all assets and it's metadata
function Assets.GetOthers(asset_pack_path) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Manually adds an Asset to be loaded during the Player's loading screen
---@param asset_path string @The Asset Key
---@param asset_type AssetType @The Asset Type
function Assets.Precache(asset_path, asset_type) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Static Class present on Client side.
---@class Client
Client = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Disconnects from the server
function Client.Disconnect() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Copies a text to Clipboard
---@param text string 
function Client.CopyToClipboard(text) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Near Clip Plane
---@param near_clip_plane number 
function Client.SetNearClipPlane(near_clip_plane) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Escape Menu text
---@param text string @Supports using <code>&#60h1&#62</code>, <code>&#60h2&#62</code>, <code>&#60h3&#62</code> and <code>&#60strong&#62</code> tags in the text.
function Client.SetEscapeMenuText(text) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the Near Clip Plane value
---@return number 
function Client.GetNearClipPlane() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current connected server IP:Port
---@return string 
function Client.GetConnectedServerIP() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables/Disables Debug settings and Client Console to be used
---@param enable_debug boolean 
function Client.SetDebugEnabled(enable_debug) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Changes the Highlight Color for highlighted actors at a specific Index. Multiply it by 5 (or more) for having a glowing effect.<br/><br/><code>HighlightMode.Always</code> will always be visible, even behind walls<br/><code>HighlightMode.OnlyHidden</code> will only be visible if behind a wall<br/><code>HighlightMode.OnlyVisible</code> will only be visible if not behind a wall<br/><br/>Note: You can only have 3 differents indexes (0, 1 or 2).
---@param highlight_color Color 
---@param index integer 
---@param mode? HighlightMode @(Default: HighlightMode.Always)
function Client.SetHighlightColor(highlight_color, index, mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Changes the Outline Color for outlined actors at a specific Index. Multiply it by 5 (or more) for having a glowing effect.<br/><br/>Note: You can only have 3 differents indexes (0, 1 or 2), and the default Outline color index used by the game is  <code>0</code> (when interacting with stuff).
---@param outline_color Color 
---@param index? integer @(Default: 0)
---@param thickness? number @(Default: 2)
function Client.SetOutlineColor(outline_color, index, thickness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets a global value in the Client, which can be accessed from anywhere (client side)<br/><br/>Please refer to <a href="/docs/core-concepts/scripting/entity-values">Entity Values</a> for more information
---@param key string 
---@param value any 
function Client.SetValue(key, value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the local Player
---@return Player @The local Player
function Client.GetLocalPlayer() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current Frame Time
---@return number @The Frame Time
function Client.GetFrameTime() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the Unix Epoch Time in milliseconds
---@return integer @the unix timestamp
function Client.GetTime() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns the current Map
---@return string @The current Map
function Client.GetMap() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns a list of Packages running
---@param package_type_filter? PackageType @Which Package type to return. Leave it default (-1) to return all types. (Default: -1)
---@return { title: string, name: string, type: PackageType, version: string, author: string }[] @a list of Packages data
function Client.GetPackages(package_type_filter) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a value given a key
---@param key string 
---@param fallback any 
---@return any @Value at key or fallback if key doesn't exist
function Client.GetValue(key, fallback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a list of all values keys
---@return string[] @a list with all values keys
function Client.GetAllValuesKeys() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "Tick", callback: fun(delta_time: number)): fun(delta_time: number) @Called Every Frame. Do not abuse
---@overload fun(event_name: "SpawnLocalPlayer", callback: fun(local_player: Player)): fun(local_player: Player) @Called when the local player spawns (just after the game has loaded)
---@overload fun(event_name: "WindowFocusChange", callback: fun(is_focused: boolean)): fun(is_focused: boolean) @Called when the game is focused/unfocused
function Client.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "Tick", callback: fun(delta_time: number)) @Called Every Frame. Do not abuse
---@overload fun(event_name: "SpawnLocalPlayer", callback: fun(local_player: Player)) @Called when the local player spawns (just after the game has loaded)
---@overload fun(event_name: "WindowFocusChange", callback: fun(is_focused: boolean)) @Called when the game is focused/unfocused
function Client.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Work with screen properties and effects.
---@class Viewport
Viewport = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Transforms a 3D world-space vector into 2D screen coordinates
---@param world_position Vector @World 3D position
---@return Vector2D 
function Viewport.ProjectWorldToScreen(world_position) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Transforms a 2D screen coordinates into 3D world-space location
---@param screen_position Vector2D @Screen position
---@return { Position: Vector, Direction: Vector } 
function Viewport.DeprojectScreenToWorld(screen_position) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Loads and sets a hardware cursor in the game from a PNG image
---@param cursor_shape CursorType 
---@param cursor_path string @a PNG image relative to Assets/
---@param hotspot? Vector2D @(Default: Vector(0, 0))
function Viewport.SetHardwareCursor(cursor_shape, cursor_path, hotspot) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the size of viewport
---@return Vector2D @The size of viewport
function Viewport.GetViewportSize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the scale of viewport
---@return number @The scale of viewport
function Viewport.GetViewportScale() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the mouse position
---@param new_position Vector2D 
function Viewport.SetMousePosition(new_position) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current mouse screen location
---@return Vector2D @The current mouse screen location
function Viewport.GetMousePosition() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables/Disables the Crosshair
---@param is_enabled boolean 
function Viewport.SetCrosshairEnabled(is_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Enables/Disables the Blood Screen effect
---@param is_enabled boolean 
function Viewport.SetBloodScreenEnabled(is_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---If you want the Blood Screen to do not be overridden, disable it with <code>Client.SetBloodScreenEnabled(false)</code> before
---@param intensity number @From 0.0 to 1.0
function Viewport.SetBloodScreenIntensity(intensity) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "Resize", callback: fun(new_size: Vector2D)): fun(new_size: Vector2D) @Called when the screen is resized
function Viewport.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "Resize", callback: fun(new_size: Vector2D)) @Called when the screen is resized
function Viewport.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Execute code at specified time intervals.
---@class Timer
Timer = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Executes a function, after waiting a specified number of milliseconds
---@param callback function @The callback that will be executed
---@param milliseconds? integer @The time in milliseconds to wait before executing the function (Default: 0)
---@param ...? any @Additional parameters to pass to the function (Default: nil)
---@return integer @the timeout_id
function Timer.SetTimeout(callback, milliseconds, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Same as SetTimeout(), but repeats the execution of the function continuously
---@param callback function @The callback that will be executed.<br/>Return false to stop it from being called.
---@param milliseconds? integer @The time in milliseconds the timer should delay in between executions of the specified function (Default: 0)
---@param ...? any @Additional parameters to pass to the function (Default: nil)
---@return integer @the interval_id
function Timer.SetInterval(callback, milliseconds, ...) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Stops the execution of the function specified in SetTimeout()
---@param timeout_id integer @The ID value returned by SetTimeout() is used as the parameter for this method
function Timer.ClearTimeout(timeout_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Stops the execution of the function specified in SetInterval()
---@param interval_id integer @The ID value returned by SetInterval() is used as the parameter for this method
function Timer.ClearInterval(interval_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Binds a Timer to any Actor. The timer will be automatically cleared when the Actor is destroyed
---@param timer_id integer @The Timer ID
---@param actor Actor @Actor to be bound
function Timer.Bind(timer_id, actor) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks if a Timer is currently active or waiting to be triggered
---@param timer_id integer @The Timer ID
---@return boolean 
function Timer.IsValid(timer_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the time elapsed since the last tick
---@param timer_id integer @The Timer ID
---@return integer 
function Timer.GetElapsedTime(timer_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the time remaining to the next tick
---@param timer_id integer @The Timer ID
---@return integer 
function Timer.GetRemainingTime(timer_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Pauses the Timer
---@param timer_id integer @The Timer ID
function Timer.Pause(timer_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Resumes the Timer
---@param timer_id integer @The Timer ID
function Timer.Resume(timer_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Resets a Timer to restart from beginning
---@param timer_id integer @The Timer ID
function Timer.ResetElapsedTime(timer_id) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Floating point Quaternion that can represent a rotation about an axis in 3-D space
---@class Quat
---@field X number @The quaternion's X-component
---@field Y number @The quaternion's Y-component
---@field Z number @The quaternion's Z-component
---@field W number @The quaternion's W-component
---@operator add(Quat|number): Quat
---@operator sub(Quat|number): Quat
---@operator mul(Quat|number): Quat
---@overload fun(X?: number, Y?: number, Z?: number, W?: number): Quat
Quat = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---In place normalize this Quaternion
function Quat:Normalize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get the Rotator representation of this Quaternion
---@return Rotator @Rotator representation of this Quaternion
function Quat:Rotator() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the inverse of this Quaternion
---@return Quat @Inverse of this Quaternion
function Quat:Inverse() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a ray against the world and get collided objects information.
---@class Trace
Trace = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a ray against the world and returns a table with the first blocking hit information<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.
---@param start_location Vector @Start location of the ray
---@param end_location Vector @End location of the ray
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D } 
function Trace.LineSingle(start_location, end_location, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a ray against the world using object types and return overlapping hits and then first blocking hit<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.<br/><br/>Results are sorted, so a blocking hit (if found) will be the last element of the array<br/><br/>Only the single closest blocking result will be generated, no tests will be done after that
---@param start_location Vector @Start location of the ray
---@param end_location Vector @End location of the ray
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D }[] 
function Trace.LineMulti(start_location, end_location, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a sphere against the world and returns a table with the first blocking hit information<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.
---@param start_location Vector @Start location of the sphere
---@param end_location Vector @End location of the sphere
---@param radius number @Radius of the sphere
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D } 
function Trace.SphereSingle(start_location, end_location, radius, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a sphere against the world using object types and return overlapping hits and then first blocking hit<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.<br/><br/>Results are sorted, so a blocking hit (if found) will be the last element of the array<br/><br/>Only the single closest blocking result will be generated, no tests will be done after that
---@param start_location Vector @Start location of the sphere
---@param end_location Vector @End location of the sphere
---@param radius number @Radius of the sphere
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D }[] 
function Trace.SphereMulti(start_location, end_location, radius, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a box against the world and returns a table with the first blocking hit information<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.
---@param start_location Vector @Start location of the box
---@param end_location Vector @End location of the box
---@param half_size Vector @Distance from the center of box along each axis
---@param orientation Rotator @Orientation of the box
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D } 
function Trace.BoxSingle(start_location, end_location, half_size, orientation, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a box against the world using object types and return overlapping hits and then first blocking hit<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.<br/><br/>Results are sorted, so a blocking hit (if found) will be the last element of the array<br/><br/>Only the single closest blocking result will be generated, no tests will be done after that
---@param start_location Vector @Start location of the box
---@param end_location Vector @End location of the box
---@param half_size Vector @Distance from the center of box along each axis
---@param orientation Rotator @Orientation of the box
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D }[] 
function Trace.BoxMulti(start_location, end_location, half_size, orientation, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a capsule against the world and returns a table with the first blocking hit information<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.
---@param start_location Vector @Start location of the capsule
---@param end_location Vector @End location of the capsule
---@param radius number @Radius of the capsule to sweep
---@param half_height number @Distance from center of capsule to tip of hemisphere endcap.
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D } 
function Trace.CapsuleSingle(start_location, end_location, radius, half_height, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Trace a capsule against the world using object types and return overlapping hits and then first blocking hit<br/><br/>Note: The Trace will collide with the ObjectType (in the Collision Settings), even if the channel is ignored below.<br/><br/>Results are sorted, so a blocking hit (if found) will be the last element of the array<br/><br/>Only the single closest blocking result will be generated, no tests will be done after that
---@param start_location Vector @Start location of the capsule
---@param end_location Vector @End location of the capsule
---@param radius number @Radius of the capsule to sweep
---@param half_height number @Distance from center of capsule to tip of hemisphere endcap.
---@param collision_channel? CollisionChannel @Supports several channels separating by <code>|</code> (using bit-wise operations) (Default: WorldStatic)
---@param trace_mode? TraceMode @Trace Mode, pass all parameters separating by <code>|</code> (using bit-wise operations)<br/><br/>You need to explicitily pass the modes to return the values you want (Default: 0)
---@param ignored_actors? Actor[] @Array of actors to ignore during the trace (Default: {})
---@return { Success: boolean, Location: Vector, Normal: Vector, Entity: Actor, BoneName: string, ActorName: string, ComponentName: string, SurfaceType: SurfaceType, UV: Vector2D }[] 
function Trace.CapsuleMulti(start_location, end_location, radius, half_height, collision_channel, trace_mode, ignored_actors) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Create custom keybindings and retrieve input information.
---@class Input
Input = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Binds a function to an Input defined using <code>Register</code> or from the game
---@param binding_name string @The keybinding id
---@param input_event InputEvent @Which event to register (Released/Pressed)
---@param callback function @The function to trigger
function Input.Bind(binding_name, input_event, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Unbinds all Input functions related to the given binding_name and input_event
---@param binding_name string @The keybinding id
---@param input_event InputEvent @Which event to register (Released/Pressed)
---@param callback? function @The specific function to unbind
function Input.Unbind(binding_name, input_event, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Registers a keybinding to a default key
---@param binding_name string @The keybinding id
---@param key_name string @The Key to use by default if this wasn't set before
---@param description string @Text to show on Key Bindings Settings
function Input.Register(binding_name, key_name, description) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Unregisters a keybinding
---@param binding_name string @The keybinding id
---@param key_name string 
function Input.Unregister(binding_name, key_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the icon path of a key
---@param key_name string 
---@param dark_mode? boolean @(Default: false)
---@return string 
function Input.GetKeyIcon(key_name, dark_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the key code of a key
---@param key_name string 
---@return integer 
function Input.GetKeyCode(key_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the currently pressed modifier keys
---@return KeyModifier 
function Input.GetModifierKeys() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns the keys bound to a keybinding
---@param binding_name string @The keybinding id
---@return string[] @list of all keys
function Input.GetMappedKeys(binding_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Resets all bound functions by this Package
function Input.ResetBindings() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns a table with all Scripting KeyBindings
---@return table 
function Input.GetScriptingKeyBindings() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns a table with all Game KeyBindings
---@return table 
function Input.GetGameKeyBindings() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Toggles Local Player input
---@param enable_input boolean 
function Input.SetInputEnabled(enable_input) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Displays/Hides Mouse Cursor
---@param is_enabled boolean 
function Input.SetMouseEnabled(is_enabled) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the current Mouse Cursor type
---@param cursor_type CursorType 
function Input.SetMouseCursor(cursor_type) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Forces an Input Key event on Local Player<br/><br/>This won't trigger any Scripting event as it bypass internal validations
---@param key_name string @Key Name to input
---@param input_event InputEvent @Which Event to input
---@param amount_depressed? number @The amount pressed (Default: 1)
function Input.InputKey(key_name, input_event, amount_depressed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns if a key is being pressed
---@param key_name string 
---@return boolean @if the key is pressed
function Input.IsKeyDown(key_name) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return boolean @if the mouse is visible
function Input.IsMouseEnabled() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---
---@return boolean @if the input is visible
function Input.IsInputEnabled() end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "KeyBindingChange", callback: fun(binding_name: string, key: string, scale: number)): fun(binding_name: string, key: string, scale: number) @A key binding has been changed through the settings
---@overload fun(event_name: "KeyDown", callback: fun(key_name: string, delta?: number): boolean?): fun(key_name: string, delta?: number): boolean? @A keyboard key is being pressed
---@overload fun(event_name: "KeyPress", callback: fun(key_name: string, delta?: number): boolean?): fun(key_name: string, delta?: number): boolean? @A keyboard key has been pressed
---@overload fun(event_name: "KeyUp", callback: fun(key_name: string, delta?: number): boolean?): fun(key_name: string, delta?: number): boolean? @A keyboard key has been released
---@overload fun(event_name: "MouseDown", callback: fun(key_name: string, mouse_x: number, mouse_y: number): boolean?): fun(key_name: string, mouse_x: number, mouse_y: number): boolean? @A mouse button has been pressed / is being pressed
---@overload fun(event_name: "MouseUp", callback: fun(key_name: string, mouse_x: number, mouse_y: number): boolean?): fun(key_name: string, mouse_x: number, mouse_y: number): boolean? @A mouse button has been released
---@overload fun(event_name: "MouseEnable", callback: fun(is_enabled: boolean)): fun(is_enabled: boolean) @When mouse cursor is displayed/hidden
---@overload fun(event_name: "MouseMove", callback: fun(cursor_delta_x: number, cursor_delta_y: number, mouse_x: number, mouse_y: number)): fun(cursor_delta_x: number, cursor_delta_y: number, mouse_x: number, mouse_y: number) @Called when the mouse moves
---@overload fun(event_name: "MouseScroll", callback: fun(mouse_x: number, mouse_y: number, delta: number)): fun(mouse_x: number, mouse_y: number, delta: number) @Called when the mouse scrolls
function Input.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "KeyBindingChange", callback: fun(binding_name: string, key: string, scale: number)) @A key binding has been changed through the settings
---@overload fun(event_name: "KeyDown", callback: fun(key_name: string, delta?: number): boolean?) @A keyboard key is being pressed
---@overload fun(event_name: "KeyPress", callback: fun(key_name: string, delta?: number): boolean?) @A keyboard key has been pressed
---@overload fun(event_name: "KeyUp", callback: fun(key_name: string, delta?: number): boolean?) @A keyboard key has been released
---@overload fun(event_name: "MouseDown", callback: fun(key_name: string, mouse_x: number, mouse_y: number): boolean?) @A mouse button has been pressed / is being pressed
---@overload fun(event_name: "MouseUp", callback: fun(key_name: string, mouse_x: number, mouse_y: number): boolean?) @A mouse button has been released
---@overload fun(event_name: "MouseEnable", callback: fun(is_enabled: boolean)) @When mouse cursor is displayed/hidden
---@overload fun(event_name: "MouseMove", callback: fun(cursor_delta_x: number, cursor_delta_y: number, mouse_x: number, mouse_y: number)) @Called when the mouse moves
---@overload fun(event_name: "MouseScroll", callback: fun(mouse_x: number, mouse_y: number, delta: number)) @Called when the mouse scrolls
function Input.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A container for rotation information (Pitch, Yaw, Roll). All rotation values are stored in degrees.
---@class Rotator
---@field Pitch number @Rotation around the right axis (around Y axis), Looking up and down (0=Straight Ahead, +Up, -Down)
---@field Yaw number @Rotation around the up axis (around Z axis), Running in circles 0=East, +North, -South.
---@field Roll number @Rotation around the forward axis (around X axis), Tilting your head, 0=Straight, +Clockwise, -CCW.
---@operator add(Rotator|number): Rotator
---@operator sub(Rotator|number): Rotator
---@operator mul(Rotator|number): Rotator
---@overload fun(pitch?: number, yaw?: number, roll?: number): Rotator
Rotator = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Generates a random rotation, with optional random roll
---@param roll? boolean @Whether to use a random roll in the rotator, otherwise uses 0 for roll (Default: false)
---@param min? number @Minimum value (Default: -180)
---@param max? number @Maximum value (Default: 180)
---@return Rotator @the random rotation
function Rotator.Random(roll, min, max) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get the forward (X) unit direction vector from this component, in world space.
---@return Vector @the forward direction
function Rotator:GetForwardVector() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get the right (Y) unit direction vector from this component, in world space.
---@return Vector @the right direction
function Rotator:GetRightVector() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get the up (Z) unit direction vector from this component, in world space.
---@return Vector @the up direction
function Rotator:GetUpVector() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Rotate a vector rotated by this rotator.
---@param vector Vector @the vector to rotate by the Rotator
---@return Vector @the rotated vector
function Rotator:RotateVector(vector) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---In-place normalize, removes all winding and creates the âshortest routeâ rotation.
function Rotator:Normalize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the vector rotated by the inverse of this rotator.
---@param vector Vector @The vector to rotate by the inverse of the Rotator
---@return Vector @the unrotated vector
function Rotator:UnrotateVector(vector) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get Rotation as a quaternion.
---@return Quat @the rotation as a quaternion
function Rotator:Quaternion() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a new Rotator normalized.
---@return Rotator @the normalized Rotator
function Rotator:GetNormalized() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks whether rotator is near to zero within a specified tolerance
---@param tolerance? number @Tolerance to check (Default: 0.000001)
---@return boolean @whether the rotator is nearly zero
function Rotator:IsNearlyZero(tolerance) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks whether all components of the rotator are exactly zero
---@return boolean @whether the rotator is exactly zero
function Rotator:IsZero() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Interact with Steam APIs.
---@class Steam
Steam = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets Steam Rich Presence text
---@param text string 
function Steam.SetRichPresence(text) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A color composed of components (R, G, B, A) with floating point precision.
---@class Color
---@field R number @Red color percentage (0-1)
---@field G number @Green color percentage (0-1)
---@field B number @Blue color percentage (0-1)
---@field A number @Alpha transparency percentage (0-1)
---@operator add(Color|number): Color
---@operator sub(Color|number): Color
---@operator mul(Color|number): Color
---@operator div(Color|number): Color
---@overload fun(R?: number, G?: number, B?: number, A?: number): Color
Color = {}
Color.WHITE = Color(1, 1, 1)
Color.BLACK = Color(0, 0, 0)
Color.TRANSPARENT = Color(0, 0, 0, 0)
Color.RED = Color(1, 0, 0)
Color.GREEN = Color(0, 1, 0)
Color.BLUE = Color(0, 0, 1)
Color.YELLOW = Color(1, 1, 0)
Color.CYAN = Color(0, 1, 1)
Color.MAGENTA = Color(1, 0, 1)
Color.ORANGE = Color(1, 0.5, 0)
Color.CHARTREUSE = Color(0.5, 1, 1)
Color.AQUAMARINE = Color(0, 1, 0.5)
Color.AZURE = Color(0, 0.5, 1)
Color.VIOLET = Color(0.5, 0, 1)
Color.ROSE = Color(1, 0, 0.5)

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a random color from Color Palette
---@param includes_black? boolean @Includes blacks in the scope (Default: true)
---@return Color @Random color from Color Palette
function Color.RandomPalette(includes_black) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a random color from all color scope
---@return Color @Random color from all color scope
function Color.Random() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the color from 0-255 range values
---@param r? number @Red (Default: 0)
---@param g? number @Green (Default: 0)
---@param b? number @Blue (Default: 0)
---@param a? number @Alpha (Default: 0)
---@return Color @Final Color
function Color.FromRGBA(r, g, b, a) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a color from the CYMK format
---@param c? number @Cyan (Default: 0)
---@param y? number @Yellow (Default: 0)
---@param m? number @Magenta (Default: 0)
---@param k? number @Black (Default: 0)
---@param a? number @Alpha (Default: 0)
---@return Color @Final Color
function Color.FromCYMK(c, y, m, k, a) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a color from the HSL format
---@param h? number @Hue (Default: 0)
---@param s? number @Saturation (Default: 0)
---@param l? number @Lightness (Default: 0)
---@return Color @Final Color
function Color.FromHSL(h, s, l) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a color from the HSV format
---@param h? number @Hue (Default: 0)
---@param s? number @Saturation (Default: 0)
---@param v? number @Value (Default: 0)
---@return Color @Final Color
function Color.FromHSV(h, s, v) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a color from the Hexadecimal format
---@param hex string @Hexadecimal
---@return Color @Final Color
function Color.FromHEX(hex) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Gets the Hexadecimal representation of this Color
---@param appends_transparency? boolean @Appends transparency part (Default: true)
---@return string @Hexadecimal representation of this Color
function Color:ToHex(appends_transparency) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Matrix is an array of numbers this can be used for geometric and positional calculations. This is mainly used internally.
---@class Matrix
---@overload fun(rotation: Rotator, origin: Vector): Matrix
Matrix = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Transform the vector with the matrix
---@param vector Vector @The vector who will be transformed
---@return Vector @The new vector
function Matrix:TransformVector(vector) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a new matrix transposed (<a href="https://en.wikipedia.org/wiki/Transpose">Wikipedia</a>)
---@return Matrix @The matrix transpoosed
function Matrix:GetTransposed() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---JSON library.
---@class JSON
JSON = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a string representing value encoded in JSON
---@param value table @the table that will become JSON
---@return string @the table in JSON
function JSON.stringify(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a value representing the decoded JSON string
---@param value string @the JSON that will become a table
---@return any @the json in table
function JSON.parse(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Vector composed of components (X, Y, Z) with floating point precision. Used mainly for entity position.
---@class Vector
---@field X number @X Coordinate
---@field Y number @Y Coordinate
---@field Z number @Z Coordinate
---@operator add(Vector|number): Vector
---@operator sub(Vector|number): Vector
---@operator mul(Vector|number): Vector
---@operator div(Vector|number): Vector
---@operator pow(Vector|number): Vector
---@overload fun(X?: number, Y?: number, Z?: number): Vector
Vector = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Check if the vector is equal to another vector, within specified error limits
---@param other Vector @The vector to compare to
---@param tolerance? number @The error limits (Default: 0.000001)
---@return boolean @Are the vectors equal or not
function Vector:Equals(other, tolerance) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the distance of 2 vectors
---@param other Vector @The vector to get the distance to
---@return number @The distance betweem the vectors
function Vector:Distance(other) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Return the squared distance of 2 vectors
---@param other Vector @The vector to get the squared distance to
---@return number @The squared distance betweem the vectors
function Vector:DistanceSquared(other) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the normalized version of vector without checking for zero length
---@return Vector @The unsafe normal
function Vector:GetUnsafeNormal() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a normalized copy of the vector, checking it is safe to do so based on the length
---@return Vector @The safe normal
function Vector:GetSafeNormal() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks whether vector is near to zero within a specified tolerance
---@param tolerance? number @The error limits (Default: 0.000001)
---@return boolean @If the bool is near to zero
function Vector:IsNearlyZero(tolerance) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Checks whether all components of the vector are exactly zero
---@return boolean @If all components of the vector are exactly zero
function Vector:IsZero() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Normalize this vector in-place if it is larger than a given tolerance. Leaves it unchanged if not
---@return boolean @If the vector has been modified
function Vector:Normalize() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get the length (magnitude) of this vector
---@return number @The lenght of the vector
function Vector:Size() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Get the squared length of this vector
---@return number @The squared length of the vector
function Vector:SizeSquared() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns the orientation corresponding to the direction in which the vector points
---@return Rotator @The orientation of the vector
function Vector:Rotation() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Configure, send and intercept chat messages.
---@class Chat
Chat = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Adds a chat message which will display local only
---@param message string 
function Chat.AddMessage(message) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sends a chat message to a Player only
---@param player Player @The player to receive the message
---@param message string @The message
function Chat.SendMessage(player, message) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Configures the Chat visuals and position
---@param screen_location? Vector2D @(Default: Vector2D(-25, 0))
---@param size? Vector2D @(Default: Vector2D(600, 250))
---@param anchors_min? Vector2D @(Default: Vector2D(1, 0.5))
---@param anchors_max? Vector2D @(Default: Vector2D(1, 0.5))
---@param alignment? Vector2D @(Default: Vector2D(1, 0.5))
---@param justify? boolean @(Default: true)
---@param show_scrollbar? boolean @(Default: true)
function Chat.SetConfiguration(screen_location, size, anchors_min, anchors_max, alignment, justify, show_scrollbar) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets if the Chat is visible or not
---@param is_visible boolean 
function Chat.SetVisibility(is_visible) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Clears all messages
function Chat.Clear() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Sends a chat message to all Players
---@param message string @The message to send to all Players
function Chat.BroadcastMessage(message) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "PlayerSubmit", callback: fun(message: string, player: Player): boolean?): fun(message: string, player: Player): boolean? @Called when a player submits a message in the chat
---@overload fun(event_name: "ChatEntry", callback: fun(message: string, player?: Player)): fun(message: string, player?: Player) @Called when a new Chat Message is received, this is also triggered when new messages are sent programatically<br/><br/>This is useful for creating your own Chat interface while still use the built-in system
---@overload fun(event_name: "Open", callback: fun()): fun() @When player opens the Chat
---@overload fun(event_name: "Close", callback: fun()): fun() @When player closes the Chat
function Chat.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "PlayerSubmit", callback: fun(message: string, player: Player): boolean?) @Called when a player submits a message in the chat
---@overload fun(event_name: "ChatEntry", callback: fun(message: string, player?: Player)) @Called when a new Chat Message is received, this is also triggered when new messages are sent programatically<br/><br/>This is useful for creating your own Chat interface while still use the built-in system
---@overload fun(event_name: "Open", callback: fun()) @When player opens the Chat
---@overload fun(event_name: "Close", callback: fun()) @When player closes the Chat
function Chat.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Creates a reachable path into navigable space.
---@class Navigation
Navigation = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Finds random, reachable point in navigable space restricted to radius around origin (only if map has a NavMesh)
---@param origin Vector 
---@param radius number 
---@return Vector @The random point
function Navigation.GetRandomReachablePointInRadius(origin, radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Finds random, point in navigable space restricted to Radius around Origin. Resulting location is not tested for reachability from the Origin (only if map has a NavMesh)
---@param origin Vector 
---@param radius number 
---@return Vector @The random point
function Navigation.GetRandomPointInNavigableRadius(origin, radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Finds a Path given Start and End location (only if map has a NavMesh)
---@param start_location Vector 
---@param end_location Vector 
---@return { IsValid: boolean, IsPartial: boolean, Length: number, Cost: number, PathPoints: Vector[] } 
function Navigation.FindPathToLocation(start_location, end_location) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Interact with built-in Sky & Weather system.
---@class Sky
Sky = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Replaces all Sky/Sun actors with the Ultra Dynamic Sky Actor, to be able to use the functions from this page. Internally this calls <code>Sky.DestroyAllSky()</code> automatically
---@param spawn_weather? boolean @Whether or not to spawn the Weather Actor (to be able to use Weather related methods) (Default: false)
---@param find_existing? boolean @Whether or not to try to find existing Sky & Weather Actors spawned in the map, using their references instead (Default: true)
function Sky.Spawn(spawn_weather, find_existing) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Destroys all Directional Lights, Sky Lights, Exponential Height Fogs, Volumetric Clouds, Sky Atmosphere, Ultra Dynamic Sky Actors and all Actors with the <code>Sun</code> Actor Tag from the Level
function Sky.DestroyAllSky() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Reconstruct the Ultra Dynamic Sky Actor, forces most of the changes to be applied
function Sky.Reconstruct() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Texture<br /><br />Set it to empty to restore the default. After setting it, you must call <code>Sky.Reconstruct()</code> to have it applied properly
---@param texture string 
function Sky.SetMoonTexture(texture) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Texture Rotation
---@param rotation number 
function Sky.SetMoonTextureRotation(rotation) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Vertical Offset
---@param offset number 
function Sky.SetMoonVerticalOffset(offset) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Scale
---@param scale number 
function Sky.SetMoonScale(scale) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Angle
---@param yaw number 
---@param pitch number 
function Sky.SetMoonAngle(yaw, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Phase
---@param phase number @Ranges from 0-30
function Sky.SetMoonPhase(phase) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Glow Intensity
---@param glow_intensity number 
function Sky.SetMoonGlowIntensity(glow_intensity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Moon Light Intensity
---@param intensity number 
function Sky.SetMoonLightIntensity(intensity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Sun Angle
---@param yaw number 
---@param pitch number 
function Sky.SetSunAngle(yaw, pitch) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Sun Scale
---@param radius number 
function Sky.SetSunScale(radius) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Sun Light Intensity
---@param intensity number 
function Sky.SetSunLightIntensity(intensity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Sky Mode<br /><br />After setting it, you must call <code>Sky.Reconstruct()</code> to have it applied properly
---@param sky_mode SkyMode 
function Sky.SetSkyMode(sky_mode) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the Volumetric Cloud Color<br /><br />This is only applied if <code>SetSkyMode(SkyMode.VolumetricClouds)</code> is set
---@param color Color 
function Sky.SetVolumetricCloudColor(color) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---The amount of coverage for the cloud layer, from a clear sky to overcast
---@param cloud_coverage number 
function Sky.SetCloudCoverage(cloud_coverage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---The fogginess of the scene. The impact this has on fog density is scaled from the Fog Density category
---@param fog_percentage number 
function Sky.SetFog(fog_percentage) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---A simple contrast boost for the sky material. Cannot affect volumetric clouds
---@param contrast number 
function Sky.SetContrast(contrast) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---The overall brightness of the shader
---@param intensity number 
function Sky.SetOverallIntensity(intensity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Can be used to scale the brightness of the sky and lighting, at night
---@param brightness number 
function Sky.SetNightBrightness(brightness) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets whether or not to animate the time of day
---@param animate boolean @Whether or not to animate the time of day
---@param day_length? number @The time (in minutes) from sunrise to sunset (Default: 30.0)
---@param night_length? number @The time (in minutes) from sunset to sunrise (Default: 15.0)
function Sky.SetAnimateTimeOfDay(animate, day_length, night_length) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets the current time
---@param hours integer 
---@param minutes integer 
function Sky.SetTimeOfDay(hours, minutes) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current time
---@return integer @hours
---@return integer @minutes
---@return integer @seconds
function Sky.GetTimeOfDay() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Returns if the Ultra Dynamic Sky was spawned
---@param including_weather boolean @if to check for Weather Actor too
---@return boolean 
function Sky.IsSpawned(including_weather) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets the current weather
---@return WeatherType 
function Sky.GetWeather() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Changes the Weather
---@param weather WeatherType @weather to change
---@param transition_time number @fade time to completely change to new weather
function Sky.ChangeWeather(weather, transition_time) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Work with Unreal level in runtime.
---@class Level
Level = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Loads a Level in runtime
---@param level_name string 
---@param should_block_on_load? boolean @If this should be a blocking operation - the game will freeze (Default: false)
---@param make_visible_after_load? boolean @If this should be visible automatically after loaded (Default: true)
function Level.LoadStreamLevel(level_name, should_block_on_load, make_visible_after_load) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Unloads a Level in runtime
---@param level_name string 
---@param should_block_on_unload? boolean @If this should be a blocking operation - the game will freeze (Default: false)
function Level.UnloadStreamLevel(level_name, should_block_on_unload) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Sets a Stream Level visibility
---@param level_name string 
---@param visibility boolean @If this level should be visible
function Level.SetStreamLevelVisibility(level_name, visibility) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Gets a list of all Stream Levels
---@return { name: string, is_loaded: boolean, is_visible: boolean }[] 
function Level.GetStreamLevels() end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/client-only.png?raw=true" height="10"> `Client Side`
---
---Calls a Level Blueprint custom event (which can be added when creating levels through Unreal Engine)
---@param event_name string @Event or Function name
---@param ...? any @Sequence of arguments to pass to the event (Default: nil)
---@return any... @the function return values
function Level.CallLevelBlueprintEvent(event_name, ...) end

---Subscribe to an event
---@param event_name string @Name of the event to subscribe to
---@param callback function @Function to call when the event is triggered
---@return function @The callback function passed
---@overload fun(event_name: "StreamLevelLoad", callback: fun(level_name: string)): fun(level_name: string) @Called when a Stream Level is loaded
---@overload fun(event_name: "StreamLevelUnload", callback: fun(level_name: string)): fun(level_name: string) @Called when a Stream Level is unloaded
---@overload fun(event_name: "StreamLevelShow", callback: fun(level_name: string)): fun(level_name: string) @Called when a Stream Level is shown
---@overload fun(event_name: "StreamLevelHide", callback: fun(level_name: string)): fun(level_name: string) @Called when a Stream Level is hidden
function Level.Subscribe(event_name, callback) end

---Unsubscribe from an event
---@param event_name string @Name of the event to unsubscribe from
---@param callback? function @Optional callback to unsubscribe (if no callback is passed then all callbacks in this Package will be unsubscribed from this event)
---@overload fun(event_name: "StreamLevelLoad", callback: fun(level_name: string)) @Called when a Stream Level is loaded
---@overload fun(event_name: "StreamLevelUnload", callback: fun(level_name: string)) @Called when a Stream Level is unloaded
---@overload fun(event_name: "StreamLevelShow", callback: fun(level_name: string)) @Called when a Stream Level is shown
---@overload fun(event_name: "StreamLevelHide", callback: fun(level_name: string)) @Called when a Stream Level is hidden
function Level.Unsubscribe(event_name, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---HTTP Requests Interface.
---@class HTTP
HTTP = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Makes an asynchronous HTTP Request.<br/><br/>The request will be made asynchronously and returned safetly in the same thread in the callback provided when it's done.<br/><br/><b>Note:</b> If a request is still running when unloading packages, the server will freeze until it's finished, then the package will unload.
---@param uri string @The main URI (the base address)
---@param endpoint? string @The endpoint (Default: "")
---@param method? HTTPMethod @The HTTP Method to be used (Default: HTTPMethod.GET)
---@param data? string @Payload (Default: "")
---@param content_type? string @The <a href='https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types'>Content Type</a> to be used (Default: application/json)
---@param compress? boolean @Whether or not to compress the content with gzip (Default: false)
---@param headers? table @The <a href='https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers'>Headers</a> to be used (Default: {})
---@param callback? function @The result (Default: nil)
function HTTP.RequestAsync(uri, endpoint, method, data, content_type, compress, headers, callback) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/server-only.png?raw=true" height="10"> `Server Side`
---
---Makes a synchronous HTTP Request.<br/><br/>The request will be made synchronously and will freeze the server until it's done.
---@param uri string @The main URI (the base address)
---@param endpoint? string @The endpoint (Default: "")
---@param method? HTTPMethod @The HTTP Method to be used (Default: HTTPMethod.GET)
---@param data? string @Payload (Default: "")
---@param content_type? string @The <a href='https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types'>Content Type</a> to be used (Default: application/json)
---@param compress? boolean @Whether or not to compress the content with gzip (Default: false)
---@param headers? table @The <a href='https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers'>Headers</a> to be used (Default: {})
---@return { Status: integer, Data: string } 
function HTTP.Request(uri, endpoint, method, data, content_type, compress, headers) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the global Connection Timeout in seconds
---@param connection_timeout integer @The timeout in seconds
function HTTP.SetConnectionTimeout(connection_timeout) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Sets the global Read and Write Timeout in seconds
---@param read_write_timeout integer @The timeout in seconds
function HTTP.SetReadWriteTimeout(read_write_timeout) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A Vector2D composed of components (X, Y) with floating point precision. Used mainly for HUD and Drawing on screen.
---@class Vector2D
---@field X number @X Coordinate
---@field Y number @Y Coordinate
---@operator add(Vector2D|number): Vector2D
---@operator sub(Vector2D|number): Vector2D
---@operator mul(Vector2D|number): Vector2D
---@operator div(Vector2D|number): Vector2D
---@overload fun(X?: number, Y?: number): Vector2D
Vector2D = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A table containing useful and aux Math functions.
---@class NanosMath
NanosMath = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Rounds a number
---@param value number @The number to be rounded
---@return number @the rounded number
function NanosMath.Round(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Clamps a number
---@param value number @The number to be clamped
---@param min number @The min value
---@param max number @The max value
---@return number @the number clamped
function NanosMath.Clamp(value, min, max) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Clamps an angle to the range of [0, 360]
---@param value number @The number to be clamped
---@return number @the number clamped
function NanosMath.ClampAxis(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Clamps an angle to the range of [-180, 180]
---@param value number @The number to be clamped
---@return number @the number clamped
function NanosMath.NormalizeAxis(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Calculates the location and rotation relative to an actor
---@param location Vector @The location of the new system
---@param rotation Rotator @The rotation of the new system
---@param actor Actor @The actor to be translated to the new system
---@return Vector @the location relative to the actor
---@return Rotator @the rotation relative to the actor
function NanosMath.RelativeTo(location, rotation, actor) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a random float value
---@param min number @Minimum value
---@param max number @Maximum value
---@return number @the random value
function NanosMath.RandomFloat(min, max) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Interpolate number from Current to Target
---@param current number 
---@param target number 
---@param delta_time number 
---@param interp_speed number 
---@return number 
function NanosMath.FInterpTo(current, target, delta_time, interp_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Interpolate Rotator from Current to Target
---@param current Rotator 
---@param target Rotator 
---@param delta_time number 
---@param interp_speed number 
---@return Rotator 
function NanosMath.RInterpTo(current, target, delta_time, interp_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Interpolate Rotator from Current to Target with a constant step
---@param current Rotator 
---@param target Rotator 
---@param delta_time number 
---@param interp_speed number 
---@return Rotator 
function NanosMath.RInterpConstantTo(current, target, delta_time, interp_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Interpolate Vector from Current to Target
---@param current Vector 
---@param target Vector 
---@param delta_time number 
---@param interp_speed number 
---@return Vector 
function NanosMath.VInterpTo(current, target, delta_time, interp_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Interpolate Vector from Current to Target with a constant step
---@param current Vector 
---@param target Vector 
---@param delta_time number 
---@param interp_speed number 
---@return Vector 
function NanosMath.VInterpConstantTo(current, target, delta_time, interp_speed) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---TOML library.
---@class TOML
TOML = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a string representing value encoded in TOML
---@param value table @the table that will become TOML
---@return string @the table in TOML
function TOML.Dump(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns a value representing the decoded TOML string
---@param value string @the TOML that will become a table
---@return any @the TOML in table
function TOML.Parse(value) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A table containing useful and aux table functions.
---@class NanosTable
NanosTable = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Dumps a table into a readable text
---@param table table @Table to dump
---@return string @the table as readable text
function NanosTable.Dump(table) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Performs a shallow copy of a table
---@param table table @The table to shallow copy
---@return table @the copied table
function NanosTable.ShallowCopy(table) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---A table containing useful and aux functions.
---@class NanosUtils
NanosUtils = {}

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Returns if an entity is valid
---@param entity any @Entity to verify
---@return boolean @if the entity is valid
function NanosUtils.IsEntityValid(entity) end

---<img src="https://github.com/Derpius/nanosworld-vscode/blob/master/assets/both.png?raw=true" height="10"> `Client/Server Side`
---
---Benchmarks a function performance, outputs in the console the elapsed time
---@param name string @Benchmark name to output
---@param amount number @Amount of times to loop
---@param func function @The function to call
---@param ... any @The arguments of the function to call
function NanosUtils.Benchmark(name, amount, func, ...) end

---@enum AimMode
AimMode = {
    ["None"] = 0,
    ["ADS"] = 1,
    ["ZoomedZoom"] = 2,
    ["Zoomed"] = 3,
    ["ZoomedFar"] = 4
}

---@enum AnimationSlotType
AnimationSlotType = {
    ["FullBody"] = 0,
    ["UpperBody"] = 1
}

---@enum AssetType
AssetType = {
    ["Map"] = 2,
    ["StaticMesh"] = 4,
    ["SkeletalMesh"] = 8,
    ["Sound"] = 16,
    ["Animation"] = 32,
    ["Particle"] = 64,
    ["Material"] = 128,
    ["Blueprint"] = 256,
    ["Other"] = 32768
}

---@enum AttachmentRule
AttachmentRule = {
    ["KeepRelative"] = 0,
    ["KeepWorld"] = 1,
    ["SnapToTarget"] = 2
}

---@enum AttenuationFunction
AttenuationFunction = {
    ["Linear"] = 0,
    ["Logarithmic"] = 1,
    ["Inverse"] = 2,
    ["LogReverse"] = 3,
    ["NaturalSound"] = 4
}

---@enum BlendMode
BlendMode = {
    ["Opaque"] = 0,
    ["Masked"] = 1,
    ["Translucent"] = 2,
    ["Additive"] = 3,
    ["Modulate"] = 4,
    ["MaskedDistanceField"] = 5,
    ["MaskedDistanceFieldShadowed"] = 6,
    ["TranslucentDistanceField"] = 7,
    ["TranslucentDistanceFieldShadowed"] = 8,
    ["AlphaComposite"] = 9,
    ["AlphaHoldout"] = 10,
    ["AlphaBlend"] = 11,
    ["TranslucentAlphaOnly"] = 12,
    ["TranslucentAlphaOnlyWriteAlpha"] = 13
}

---@enum CameraMode
CameraMode = {
    ["FPSTPS"] = 0,
    ["FPSOnly"] = 1,
    ["TPSOnly"] = 2
}

---@enum CCDMode
CCDMode = {
    ["Auto"] = 0,
    ["Disabled"] = 1,
    ["Enabled"] = 2
}

---@enum CollisionChannel
CollisionChannel = {
    ["WorldStatic"] = 1 << 0,
    ["WorldDynamic"] = 1 << 1,
    ["Pawn"] = 1 << 2,
    ["PhysicsBody"] = 1 << 5,
    ["Mesh"] = 1 << 17,
    ["Water"] = 1 << 19,
    ["Foliage"] = 1 << 20,
    ["Vehicle"] = 1 << 22
}

---@enum CollisionType
CollisionType = {
    ["Normal"] = 0,
    ["StaticOnly"] = 1,
    ["NoCollision"] = 2,
    ["IgnoreOnlyPawn"] = 3,
    ["Auto"] = 4
}

---@enum CursorType
CursorType = {
    ["None"] = 0,
    ["Default"] = 1,
    ["TextEditBeam"] = 2,
    ["ResizeLeftRight"] = 3,
    ["ResizeUpDown"] = 4,
    ["ResizeSouthEast"] = 5,
    ["ResizeSouthWest"] = 6,
    ["CardinalCross"] = 7,
    ["Crosshairs"] = 8,
    ["Hand"] = 9,
    ["GrabHand"] = 10,
    ["GrabHandClosed"] = 11,
    ["SlashedCircle"] = 12,
    ["EyeDropper"] = 13
}

---@enum ConstraintMotion
ConstraintMotion = {
    ["Free"] = 0,
    ["Limited"] = 1,
    ["Locked"] = 2
}

---@enum DamageType
DamageType = {
    ["Shot"] = 0,
    ["Explosion"] = 1,
    ["Punch"] = 2,
    ["Fall"] = 3,
    ["RunOverProp"] = 4,
    ["RunOverVehicle"] = 5,
    ["Melee"] = 6,
    ["Unknown"] = 7
}

---@enum DatabaseEngine
DatabaseEngine = {
    ["SQLite"] = 0,
    ["MySQL"] = 1,
    ["PostgreSQL"] = 2
}

---@enum FallingMode
FallingMode = {
    ["None"] = 0,
    ["Jumping"] = 1,
    ["Climbing"] = 2,
    ["Vaulting"] = 3,
    ["Falling"] = 4,
    ["HighFalling"] = 5,
    ["Parachuting"] = 6,
    ["SkyDiving"] = 7
}

---@enum FontType
FontType = {
    ["Roboto"] = 0,
    ["GothicA1"] = 1,
    ["PoiretOne"] = 2,
    ["Oswald"] = 3,
    ["RobotoMono"] = 4,
    ["OpenSans"] = 5
}

---@enum GaitMode
GaitMode = {
    ["None"] = 0,
    ["Walking"] = 1,
    ["Sprinting"] = 2
}

---@enum GizmoTransformMode
GizmoTransformMode = {
    ["Translation"] = 0,
    ["Rotation"] = 1,
    ["Scale"] = 2
}

---@enum GizmoAlignSpace
GizmoAlignSpace = {
    ["Local"] = 0,
    ["World"] = 1
}

---@enum GrabMode
GrabMode = {
    ["Disabled"] = 0,
    ["Auto"] = 1,
    ["Enabled"] = 2
}

---@enum HandlingMode
HandlingMode = {
    ["SingleHandedWeapon"] = 0,
    ["DoubleHandedWeapon"] = 1,
    ["SingleHandedMelee"] = 2,
    ["DoubleHandedMelee"] = 3,
    ["Throwable"] = 4,
    ["Torch"] = 5,
    ["Barrel"] = 6,
    ["Box"] = 7
}

---@enum HighlightMode
HighlightMode = {
    ["Always"] = 0,
    ["OnlyHidden"] = 1,
    ["OnlyVisible"] = 2
}

---@enum HTTPMethod
HTTPMethod = {
    ["GET"] = 0,
    ["POST"] = 1,
    ["PUT"] = 2,
    ["HEAD"] = 3,
    ["DELETE"] = 4,
    ["PATCH"] = 5,
    ["OPTIONS"] = 6
}

---@enum ImageFormat
ImageFormat = {
    ["JPEG"] = 0,
    ["PNG"] = 1,
    ["BMP"] = 2
}

---@enum InputEvent
InputEvent = {
    ["Pressed"] = 0,
    ["Released"] = 1
}

---@enum KeyModifier
KeyModifier = {
    ["None"] = 0,
    ["LeftShiftDown"] = 1 << 0,
    ["RightShiftDown"] = 1 << 1,
    ["LeftControlDown"] = 1 << 2,
    ["RightControlDown"] = 1 << 3,
    ["LeftAltDown"] = 1 << 4,
    ["RightAltDown"] = 1 << 5,
    ["LeftCommandDown"] = 1 << 6,
    ["RightCommandDown"] = 1 << 7,
    ["CapsLocked"] = 1 << 8
}

---@enum LightProfile
LightProfile = {
    ["None"] = 0,
    ["Arrow_Star"] = 1,
    ["Arrow_Up"] = 2,
    ["Beam_01"] = 3,
    ["Beam_02"] = 4,
    ["Beam_03"] = 5,
    ["Beam_04"] = 6,
    ["Beam_05"] = 7,
    ["Beam_06"] = 8,
    ["Beam_07"] = 9,
    ["Beam_08"] = 10,
    ["Beam_LED_01"] = 11,
    ["Beam_LED_02"] = 12,
    ["Beam_LED_03"] = 13,
    ["Beam_LED_04"] = 14,
    ["Beam_LED_05"] = 15,
    ["Beam_LED_06"] = 16,
    ["Beam_LED_07"] = 17,
    ["Bow"] = 18,
    ["Capped_01"] = 19,
    ["Capped_02"] = 20,
    ["Shattered_01"] = 21,
    ["Shattered_02"] = 22,
    ["Shattered_03"] = 23,
    ["Shattered_04"] = 24,
    ["Shattered_05"] = 25,
    ["SpotLight_01"] = 26,
    ["SpotLight_02"] = 27,
    ["SpotLight_03"] = 28,
    ["SpotLight_04"] = 29,
    ["Spreadout_01"] = 30,
    ["Spreadout_02"] = 31,
    ["Spreadout_03"] = 32,
    ["Spreadout_04"] = 33,
    ["Star_Bow"] = 34,
    ["Star_Burst_01"] = 35,
    ["Star_Burst_02"] = 36,
    ["Star_Burst_03"] = 37,
    ["Star_Burst_04"] = 38,
    ["Star_Burst_05"] = 39,
    ["Star_Burst_06"] = 40,
    ["Star_Burst_07"] = 41,
    ["Star_Burst_08"] = 42,
    ["Star_X_01"] = 43,
    ["Star_X_02"] = 44,
    ["Wall_Boomerang"] = 45,
    ["Wall_Inverted_V"] = 46,
    ["Wall_Star_T"] = 47,
    ["Wing_6"] = 48,
    ["Wing_V_01"] = 49,
    ["Wing_V_02"] = 50
}

---@enum LogType
LogType = {
    ["Display"] = 0,
    ["Warning"] = 1,
    ["Error"] = 2,
    ["Debug"] = 3,
    ["Verbose"] = 4,
    ["Scripting"] = 5,
    ["ScriptingWarn"] = 6,
    ["ScriptingError"] = 7,
    ["Chat"] = 8,
    ["WebUI"] = 9,
    ["Success"] = 10,
    ["Fatal"] = 11
}

---@enum LightType
LightType = {
    ["Point"] = 0,
    ["Spot"] = 1,
    ["React"] = 2
}

---@enum NativeWidget
NativeWidget = {
    ["Border"] = 0,
    ["Button"] = 1,
    ["CheckBox"] = 2,
    ["Image"] = 3,
    ["ProgressBar"] = 4,
    ["RichTextBlock"] = 5,
    ["Slider"] = 6,
    ["Text"] = 7,
    ["ComboBox"] = 8,
    ["EditableText"] = 9,
    ["EditableTextMultiLine"] = 10,
    ["SpinBox"] = 11,
    ["TextBox"] = 12,
    ["TextBoxMultiLine"] = 13,
    ["CanvasPanel"] = 14,
    ["GridPanel"] = 15,
    ["HorizontalBox"] = 16,
    ["Overlay"] = 17,
    ["ScaleBox"] = 18,
    ["ScrollBox"] = 19,
    ["SizeBox"] = 20,
    ["UniformGridPanel"] = 21,
    ["VerticalBox"] = 22,
    ["WrapBox"] = 23,
    ["BackgroundBlur"] = 24
}

---@enum PackageType
PackageType = {
    ["Script"] = 0,
    ["GameMode"] = 1,
    ["LoadingScreen"] = 2,
    ["Map"] = 4
}

---@enum SkyMode
SkyMode = {
    ["VolumetricClouds"] = 0,
    ["StaticClouds"] = 1,
    ["DynamicClouds2D"] = 2,
    ["NoClouds"] = 3,
    ["VolumetricAurora"] = 4,
    ["Space"] = 5
}

---@enum SoundType
SoundType = {
    ["SFX"] = 0,
    ["Music"] = 1,
    ["UI"] = 2
}

---@enum SoundLoopMode
SoundLoopMode = {
    ["Default"] = 0,
    ["Forever"] = 1,
    ["Never"] = 2
}

---@enum StanceMode
StanceMode = {
    ["None"] = 0,
    ["Standing"] = 1,
    ["Crouching"] = 2,
    ["Proning"] = 3
}

---@enum SteeringType
SteeringType = {
    ["SingleAngle"] = 0,
    ["AngleRatio"] = 1,
    ["Ackermann"] = 2
}

---@enum SurfaceType
SurfaceType = {
    ["Default"] = 0,
    ["Carpet"] = 1,
    ["Concrete"] = 2,
    ["Grass"] = 3,
    ["Gravel"] = 4,
    ["Ground"] = 5,
    ["MetalLight"] = 6,
    ["Plastic"] = 7,
    ["Sand"] = 8,
    ["Snow"] = 9,
    ["Water"] = 10,
    ["WoodLight"] = 11,
    ["Flesh"] = 12,
    ["MetalHeavy"] = 13,
    ["WoodHeavy"] = 14,
    ["Ice"] = 15,
    ["Mud"] = 16,
    ["Rock"] = 17,
    ["Thump"] = 18,
    ["Glass"] = 19,
    ["Rubber"] = 20,
    ["Air"] = 21
}

---@enum SwimmingMode
SwimmingMode = {
    ["None"] = 0,
    ["Surface"] = 1,
    ["Underwater"] = 2
}

---@enum TextRenderAlignCamera
TextRenderAlignCamera = {
    ["Unaligned"] = 0,
    ["AlignCameraRotation"] = 1,
    ["FaceCamera"] = 2
}

---@enum TextRenderBevelType
TextRenderBevelType = {
    ["Linear"] = 0,
    ["HalfCircle"] = 1,
    ["Convex"] = 2,
    ["Concave"] = 3,
    ["OneStep"] = 4,
    ["TwoSteps"] = 5,
    ["Engraved"] = 6
}

---@enum TextRenderHorizontalAlignment
TextRenderHorizontalAlignment = {
    ["Left"] = 0,
    ["Center"] = 1,
    ["Right"] = 2
}

---@enum TextRenderVerticalAlignment
TextRenderVerticalAlignment = {
    ["Top"] = 0,
    ["Center"] = 1,
    ["Bottom"] = 2,
    ["QuadTop"] = 3
}

---@enum TriggerType
TriggerType = {
    ["Sphere"] = 0,
    ["Box"] = 1
}

---@enum TraceMode
TraceMode = {
    ["DrawDebug"] = 1 << 0,
    ["TraceComplex"] = 1 << 1,
    ["ReturnPhysicalMaterial"] = 1 << 2,
    ["ReturnEntity"] = 1 << 3,
    ["ReturnNames"] = 1 << 4,
    ["ReturnUV"] = 1 << 5
}

---@enum ViewMode
ViewMode = {
    ["FPS"] = 0,
    ["TPS1"] = 1,
    ["TPS2"] = 2,
    ["TPS3"] = 3,
    ["TopDown"] = 4
}

---@enum VOIPSetting
VOIPSetting = {
    ["Local"] = 0,
    ["Global"] = 1,
    ["Muted"] = 2
}

---@enum WeatherType
WeatherType = {
    ["ClearSkies"] = 1,
    ["Cloudy"] = 2,
    ["Foggy"] = 3,
    ["Overcast"] = 4,
    ["PartlyCloudy"] = 5,
    ["Rain"] = 6,
    ["RainLight"] = 7,
    ["RainThunderstorm"] = 8,
    ["SandDustCalm"] = 9,
    ["SandDustStorm"] = 10,
    ["Snow"] = 11,
    ["SnowBlizzard"] = 12,
    ["SnowLight"] = 13
}

---@enum WebUIModifier
WebUIModifier = {
    ["None"] = 0,
    ["CapsLockOn"] = 1 << 0,
    ["ShiftDown"] = 1 << 1,
    ["ControlDown"] = 1 << 2,
    ["AltDown"] = 1 << 3,
    ["LeftMouseButton"] = 1 << 4,
    ["MiddleMouseButton"] = 1 << 5,
    ["RightMouseButton"] = 1 << 6,
    ["CommandDown"] = 1 << 7,
    ["NumLockOn"] = 1 << 8,
    ["IsKeyPad"] = 1 << 9,
    ["IsLeft"] = 1 << 10,
    ["IsRight"] = 1 << 11,
    ["AltgrDown"] = 1 << 12,
    ["IsRepeat"] = 1 << 13
}

---@enum WebUIKeyType
WebUIKeyType = {
    ["Down"] = 0,
    ["Up"] = 1,
    ["Char"] = 2
}

---@enum WebUIMouseType
WebUIMouseType = {
    ["Left"] = 0,
    ["Right"] = 1,
    ["Middle"] = 2
}

---@enum WidgetVisibility
WidgetVisibility = {
    ["Hidden"] = 0,
    ["Visible"] = 1,
    ["VisibleNotHitTestable"] = 2
}

---@enum WidgetSpace
WidgetSpace = {
    ["World"] = 0,
    ["Screen"] = 1
}