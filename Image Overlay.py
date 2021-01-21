#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'PNG Series Reader'
coronalposteriorslicee145png = PNGSeriesReader(FileNames=['/storage/home/mbl66/work/ParticleGrowth/ParticleGrowth/coronal posterior slice e14.5.png'])

# create a new 'PNG Series Reader'
posteriorcoronalsection155png = PNGSeriesReader(FileNames=['/storage/home/mbl66/work/ParticleGrowth/ParticleGrowth/posterior coronal section 15.5.png'])

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [968, 312]

# get color transfer function/color map for 'PNGImage'
pNGImageLUT = GetColorTransferFunction('PNGImage')

# get opacity transfer function/opacity map for 'PNGImage'
pNGImagePWF = GetOpacityTransferFunction('PNGImage')

# show data in view
coronalposteriorslicee145pngDisplay = Show(coronalposteriorslicee145png, renderView1)
# trace defaults for the display properties.
coronalposteriorslicee145pngDisplay.Representation = 'Slice'
coronalposteriorslicee145pngDisplay.ColorArrayName = ['POINTS', 'PNGImage']
coronalposteriorslicee145pngDisplay.LookupTable = pNGImageLUT
coronalposteriorslicee145pngDisplay.OSPRayScaleArray = 'PNGImage'
coronalposteriorslicee145pngDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
coronalposteriorslicee145pngDisplay.SelectOrientationVectors = 'None'
coronalposteriorslicee145pngDisplay.ScaleFactor = 117.9
coronalposteriorslicee145pngDisplay.SelectScaleArray = 'PNGImage'
coronalposteriorslicee145pngDisplay.GlyphType = 'Arrow'
coronalposteriorslicee145pngDisplay.GlyphTableIndexArray = 'PNGImage'
coronalposteriorslicee145pngDisplay.DataAxesGrid = 'GridAxesRepresentation'
coronalposteriorslicee145pngDisplay.PolarAxes = 'PolarAxesRepresentation'
coronalposteriorslicee145pngDisplay.ScalarOpacityUnitDistance = 14.52484480408133
coronalposteriorslicee145pngDisplay.ScalarOpacityFunction = pNGImagePWF

# reset view to fit data
renderView1.ResetCamera()

#changing interaction mode based on data extents
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [589.5, 427.0, 10000.0]
renderView1.CameraFocalPoint = [589.5, 427.0, 0.0]

# show color bar/color legend
coronalposteriorslicee145pngDisplay.SetScalarBarVisibility(renderView1, True)

# show data in view
posteriorcoronalsection155pngDisplay = Show(posteriorcoronalsection155png, renderView1)
# trace defaults for the display properties.
posteriorcoronalsection155pngDisplay.Representation = 'Slice'
posteriorcoronalsection155pngDisplay.ColorArrayName = ['POINTS', 'PNGImage']
posteriorcoronalsection155pngDisplay.LookupTable = pNGImageLUT
posteriorcoronalsection155pngDisplay.OSPRayScaleArray = 'PNGImage'
posteriorcoronalsection155pngDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
posteriorcoronalsection155pngDisplay.SelectOrientationVectors = 'None'
posteriorcoronalsection155pngDisplay.ScaleFactor = 141.1
posteriorcoronalsection155pngDisplay.SelectScaleArray = 'PNGImage'
posteriorcoronalsection155pngDisplay.GlyphType = 'Arrow'
posteriorcoronalsection155pngDisplay.GlyphTableIndexArray = 'PNGImage'
posteriorcoronalsection155pngDisplay.DataAxesGrid = 'GridAxesRepresentation'
posteriorcoronalsection155pngDisplay.PolarAxes = 'PolarAxesRepresentation'
posteriorcoronalsection155pngDisplay.ScalarOpacityUnitDistance = 15.499168875223104
posteriorcoronalsection155pngDisplay.ScalarOpacityFunction = pNGImagePWF

# show color bar/color legend
posteriorcoronalsection155pngDisplay.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Transform'
transform1 = Transform(Input=posteriorcoronalsection155png)
transform1.Transform = 'Transform'

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=transform1.Transform)

# Properties modified on transform1.Transform
transform1.Transform.Translate = [-150.0, -75.0, 0.0]

# Properties modified on transform1.Transform
transform1.Transform.Translate = [-150.0, -75.0, 0.0]

# show data in view
transform1Display = Show(transform1, renderView1)
# trace defaults for the display properties.
transform1Display.Representation = 'Surface'
transform1Display.ColorArrayName = ['POINTS', 'PNGImage']
transform1Display.LookupTable = pNGImageLUT
transform1Display.OSPRayScaleArray = 'PNGImage'
transform1Display.OSPRayScaleFunction = 'PiecewiseFunction'
transform1Display.SelectOrientationVectors = 'None'
transform1Display.ScaleFactor = 141.1
transform1Display.SelectScaleArray = 'PNGImage'
transform1Display.GlyphType = 'Arrow'
transform1Display.GlyphTableIndexArray = 'PNGImage'
transform1Display.DataAxesGrid = 'GridAxesRepresentation'
transform1Display.PolarAxes = 'PolarAxesRepresentation'
transform1Display.ScalarOpacityFunction = pNGImagePWF
transform1Display.ScalarOpacityUnitDistance = 15.499168875223104

# hide data in view
Hide(posteriorcoronalsection155png, renderView1)

# show color bar/color legend
transform1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# Properties modified on transform1Display
transform1Display.Opacity = 0.47

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [589.5, 427.0, 10000.0]
renderView1.CameraFocalPoint = [589.5, 427.0, 0.0]
renderView1.CameraParallelScale = 727.9005770021068

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).