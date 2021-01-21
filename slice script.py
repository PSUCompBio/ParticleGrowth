#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# get active source.
deformed_Plot_ = GetActiveSource()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [844, 369]

# get display properties
deformed_Plot_Display = GetDisplayProperties(deformed_Plot_, view=renderView1)

# set scalar coloring
ColorBy(deformed_Plot_Display, ('POINTS', 'materials'))

# show color bar/color legend
deformed_Plot_Display.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'materials'
materialsLUT = GetColorTransferFunction('materials')

# change representation type
deformed_Plot_Display.SetRepresentationType('Point Gaussian')

# Properties modified on deformed_Plot_Display
deformed_Plot_Display.GaussianRadius = 8.298720000000001

# create a new 'Clip'
clip1 = Clip(Input=deformed_Plot_)
clip1.ClipType = 'Plane'
clip1.Scalars = ['POINTS', 'landmarks']
clip1.Value = 0.5

# get opacity transfer function/opacity map for 'materials'
materialsPWF = GetOpacityTransferFunction('materials')

# show data in view
clip1Display = Show(clip1, renderView1)
# trace defaults for the display properties.
clip1Display.Representation = 'Surface'
clip1Display.ColorArrayName = ['POINTS', 'materials']
clip1Display.LookupTable = materialsLUT
clip1Display.OSPRayScaleArray = 'landmarks'
clip1Display.OSPRayScaleFunction = 'PiecewiseFunction'
clip1Display.SelectOrientationVectors = 'None'
clip1Display.ScaleFactor = 32.07455
clip1Display.SelectScaleArray = 'None'
clip1Display.GlyphType = 'Arrow'
clip1Display.GlyphTableIndexArray = 'None'
clip1Display.DataAxesGrid = 'GridAxesRepresentation'
clip1Display.PolarAxes = 'PolarAxesRepresentation'
clip1Display.ScalarOpacityFunction = materialsPWF
clip1Display.ScalarOpacityUnitDistance = 24.921314391972135
clip1Display.GaussianRadius = 16.037275
clip1Display.SetScaleArray = ['POINTS', 'landmarks']
clip1Display.ScaleTransferFunction = 'PiecewiseFunction'
clip1Display.OpacityArray = ['POINTS', 'landmarks']
clip1Display.OpacityTransferFunction = 'PiecewiseFunction'

# show color bar/color legend
clip1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# hide data in view
Hide(deformed_Plot_, renderView1)

# change representation type
clip1Display.SetRepresentationType('Point Gaussian')

# Properties modified on clip1Display
clip1Display.GaussianRadius = 8.0186375

# Properties modified on clip1Display
clip1Display.GaussianRadius = 6.414910000000001

# create a new 'Clip'
clip2 = Clip(Input=clip1)
clip2.ClipType = 'Plane'
clip2.Scalars = ['POINTS', 'landmarks']
clip2.Value = 0.5

# init the 'Plane' selected for 'ClipType'
clip2.ClipType.Origin = [82.999480055, -0.06495000000001028, -0.3687500000000057]

# Properties modified on clip2.ClipType
clip2.ClipType.Origin = [23.997486632894113, -0.06495000000001028, -0.3687500000000057]

# Properties modified on clip2.ClipType
clip2.ClipType.Origin = [23.997486632894113, -0.06495000000001028, -0.3687500000000057]

# show data in view
clip2Display = Show(clip2, renderView1)
# trace defaults for the display properties.
clip2Display.Representation = 'Surface'
clip2Display.ColorArrayName = ['POINTS', 'materials']
clip2Display.LookupTable = materialsLUT
clip2Display.OSPRayScaleArray = 'landmarks'
clip2Display.OSPRayScaleFunction = 'PiecewiseFunction'
clip2Display.SelectOrientationVectors = 'None'
clip2Display.ScaleFactor = 31.623440000000002
clip2Display.SelectScaleArray = 'None'
clip2Display.GlyphType = 'Arrow'
clip2Display.GlyphTableIndexArray = 'None'
clip2Display.DataAxesGrid = 'GridAxesRepresentation'
clip2Display.PolarAxes = 'PolarAxesRepresentation'
clip2Display.ScalarOpacityFunction = materialsPWF
clip2Display.ScalarOpacityUnitDistance = 26.247163511048097
clip2Display.GaussianRadius = 15.811720000000001
clip2Display.SetScaleArray = ['POINTS', 'landmarks']
clip2Display.ScaleTransferFunction = 'PiecewiseFunction'
clip2Display.OpacityArray = ['POINTS', 'landmarks']
clip2Display.OpacityTransferFunction = 'PiecewiseFunction'

# show color bar/color legend
clip2Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# hide data in view
Hide(clip1, renderView1)

# Properties modified on clip2
clip2.InsideOut = 1

# update the view to ensure updated data information
renderView1.Update()

# change representation type
clip2Display.SetRepresentationType('Point Gaussian')

# Properties modified on clip2Display
clip2Display.GaussianRadius = 8.820501250000001

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-1083.713798183381, 53.76372475140775, -55.329801665566656]
renderView1.CameraViewUp = [0.049597797801118934, 0.9987688248353274, -0.0009449816604160394]
renderView1.CameraParallelScale = 281.1956094614032

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).
