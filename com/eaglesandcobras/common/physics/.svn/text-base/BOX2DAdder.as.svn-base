package com.eaglesandcobras.common.physics{
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import flash.display.MovieClip;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2DistanceJoint;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	import com.starz.games.sparty.builder.physics.TetrisActor;
	
	public class BOX2DAdder {
		public static var body:b2Body;
		public static var bodyDef:b2BodyDef;
		public static var boxDef:b2PolygonDef;
		public static var circleDef:b2CircleDef;
		public static var shapeDef:*;
		
		public static const RATIO:Number = 30;
		
		/****************************
		WORLD
		****************************/
		public static function addWorld($doSleep:Boolean= true):b2World {
			var world:b2World;
			
			/// Creat world AABB
			var worldAABB:b2AABB = new b2AABB();
			worldAABB.lowerBound.Set(  meters(-3000) , meters(-3000) );
			worldAABB.upperBound.Set( meters(3000) , meters(3000) );
			
			/// Define the gravity vector
			var gravity:b2Vec2 = new b2Vec2(0.0, 10);
			
			/// Allow bodies to sleep
			var doSleep:Boolean = $doSleep;
			
			/// Construct a world object
			world = new b2World(worldAABB, gravity, doSleep);
			
			return world;
		}
		
		/****************************
		BOX
		****************************/
		public static function addBox($world:b2World, $instance:MovieClip, $x:Number = 0, $y:Number= 0, $width:Number =100, $height:Number=100, $static:Boolean= false ):b2Body {
			bodyDef = new b2BodyDef();	
			bodyDef.position.x = meters($x);
			bodyDef.position.y = meters($y);
			
			boxDef = new b2PolygonDef();
			boxDef.SetAsBox( meters($width)/2 , meters($height)/2 );
			if ($static) boxDef.density = 0.0;
			else boxDef.density = 1.0;
			boxDef.friction=.3;
			boxDef.restitution = .4;
			
			var actor:TetrisActor = new TetrisActor();
			actor.graphic = $instance;
			actor.graphic.width = $width;
			actor.graphic.height = $height;
			
			bodyDef.userData = actor;
			
			body = $world.CreateBody(bodyDef);
			body.CreateShape(boxDef);
			body.SetMassFromShapes();
			
			return body;
		}
		
		/****************************
		CIRCLE
		****************************/
		public static function addCircle($world:b2World, $instance:MovieClip, $x:Number = 0, $y:Number= 0, $radius:Number =50, $static:Boolean= false ):b2Body {
			bodyDef = new b2BodyDef();	
			bodyDef.position.x = meters($x);
			bodyDef.position.y = meters($y);
			
			circleDef = new b2CircleDef();
			circleDef.radius = meters($radius);
			if ($static) circleDef.density = 0.0;
			else circleDef.density = 1.0;
			circleDef.friction = .3;
			circleDef.restitution = .2;
			
			var actor:TetrisActor = new TetrisActor();
			actor.graphic = $instance;
			actor.graphic.width = $radius*2;
			actor.graphic.height = $radius*2;
			
			bodyDef.userData = actor;
			
			body = $world.CreateBody(bodyDef);
			body.CreateShape(circleDef);
			body.SetMassFromShapes();
			
			return body;
		}
		
		/****************************
		TETRIS
		****************************/
		public static function addTetris($world:b2World, $instance:MovieClip, $vertices:Array, $x:Number = 0, $y:Number= 0, $boxSize:Number =50, $angle:Number=0, $static:Boolean= false ):b2Body {
			bodyDef = new b2BodyDef();
          	bodyDef.position.x = meters($x);
			bodyDef.position.y = meters($y);
			bodyDef.angle = radians( $angle );
			
			boxDef = new b2PolygonDef();
            
           	body = $world.CreateBody(bodyDef);
           
		   	if ($static) boxDef.density = 0.0;
			else boxDef.density = 1.0;
            boxDef.friction = .3;
            boxDef.restitution = .2;

            boxDef.vertexCount = 4;
            
			var lx:Number = 0;
			var hx:Number = 0;
			var ly:Number = 0;
			var hy:Number = 0;
			
			for (var i in $vertices) {
				var x1:Number = meters($boxSize)*$vertices[i][0];
				var x2:Number = meters($boxSize)*$vertices[i][2];
				var y1:Number = meters($boxSize)*$vertices[i][1];
				var y2:Number = meters($boxSize)*$vertices[i][3];
				
				if (x1<lx)lx=x1;
				if (x2>hx) hx=x2;
				
				if (y1<ly)ly=y1;
				if (y2>hy) hy=y2;
				
				boxDef.vertices[0].Set(x1, y1);
				boxDef.vertices[1].Set(x2, y1);
				boxDef.vertices[2].Set(x2, y2);
				boxDef.vertices[3].Set(x1, y2);
				body.CreateShape(boxDef);
			}
			
			var actor:TetrisActor = new TetrisActor();
			actor.graphic = $instance;
			actor.boxSize = $boxSize;
			actor.shape = $vertices;
			actor.type = "tetris";
			
           	body.m_userData = actor;
		   
		   	body.SetMassFromShapes();
           
		  	return body;
		}
		
		/****************************
		CONVERSION
		****************************/
		public static function pixels($meters:Number):Number {
			return $meters*RATIO;
		}
		
		public static function meters($pixels:Number):Number {
			return $pixels/RATIO;
		}
		
		public static function radians($angle:Number):Number {
			return ($angle*Math.PI)/180;
		}
	}
}