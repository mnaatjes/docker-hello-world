import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Starfleet Command: NX-01',
  description: 'United Earth Starfleet Operations Portal - NX-01 Enterprise',
  themeConfig: {
    nav: [
      { text: 'Bridge', link: '/' },
      { text: 'Engineering', link: '/engineering/' },
      { text: 'Operations', link: '/operations/' }
    ],
    sidebar: [
      {
        text: 'Vessel Systems',
        items: [
          { text: 'Bridge Overview', link: '/' },
          { text: 'Warp Five Engine', link: '/engineering/' },
          { text: 'Sensors & Comms', link: '/operations/' }
        ]
      }
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/mnaatjes/docker-hello-world' }
    ],
    footer: {
      message: 'United Earth Space Probe Agency (UESPA) / Starfleet Command',
      copyright: 'NX-01 Enterprise - Warp Delta Testing'
    }
  }
})
