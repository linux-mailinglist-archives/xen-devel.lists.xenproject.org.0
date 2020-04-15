Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5551A9547
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 09:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOcuO-0003YL-5v; Wed, 15 Apr 2020 07:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+FHt=57=kaod.org=clg@srs-us1.protection.inumbo.net>)
 id 1jOcn2-0002ev-WF
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 07:48:57 +0000
X-Inumbo-ID: 8d6eb124-7eed-11ea-8a12-12813bfff9fa
Received: from 10.mo6.mail-out.ovh.net (unknown [87.98.157.236])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d6eb124-7eed-11ea-8a12-12813bfff9fa;
 Wed, 15 Apr 2020 07:48:54 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.110.171.49])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 6261C20B30C
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2020 09:48:53 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id A7A48115D0F3D;
 Wed, 15 Apr 2020 07:48:01 +0000 (UTC)
Subject: Re: [PATCH-for-5.1 3/3] hw: Remove unnecessary DEVICE() cast
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-4-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <353d0861-7c91-1662-7acf-5bebabaa3a4c@kaod.org>
Date: Wed, 15 Apr 2020 09:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200412210954.32313-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13574975176934788083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrfedvgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:56:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/12/20 11:09 PM, Philippe Mathieu-Daudé wrote:
> The DEVICE() macro is defined as:
> 
>   #define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
> 
> Remove unnecessary DEVICE() casts.
> 
> Patch created mechanically using spatch with this script:
> 
>   @@
>   typedef DeviceState;
>   DeviceState *s;
>   @@
>   -   DEVICE(s)
>   +   s
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

For ftgmac100,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/display/artist.c         | 2 +-
>  hw/display/cg3.c            | 2 +-
>  hw/display/sm501.c          | 2 +-
>  hw/display/tcx.c            | 4 ++--
>  hw/display/vga-isa.c        | 2 +-
>  hw/i2c/imx_i2c.c            | 2 +-
>  hw/i2c/mpc_i2c.c            | 2 +-
>  hw/ide/piix.c               | 2 +-
>  hw/misc/macio/pmu.c         | 2 +-
>  hw/net/ftgmac100.c          | 3 +--
>  hw/net/imx_fec.c            | 2 +-
>  hw/nubus/nubus-device.c     | 2 +-
>  hw/pci-host/bonito.c        | 2 +-
>  hw/ppc/spapr.c              | 2 +-
>  hw/sh4/sh_pci.c             | 2 +-
>  hw/xen/xen-legacy-backend.c | 2 +-
>  16 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 753dbb9a77..7e2a4556bd 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -1353,7 +1353,7 @@ static void artist_realizefn(DeviceState *dev, Error **errp)
>      s->cursor_height = 32;
>      s->cursor_width = 32;
>  
> -    s->con = graphic_console_init(DEVICE(dev), 0, &artist_ops, s);
> +    s->con = graphic_console_init(dev, 0, &artist_ops, s);
>      qemu_console_resize(s->con, s->width, s->height);
>  }
>  
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index a1ede10394..f7f1c199ce 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -321,7 +321,7 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
>  
>      sysbus_init_irq(sbd, &s->irq);
>  
> -    s->con = graphic_console_init(DEVICE(dev), 0, &cg3_ops, s);
> +    s->con = graphic_console_init(dev, 0, &cg3_ops, s);
>      qemu_console_resize(s->con, s->width, s->height);
>  }
>  
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index de0ab9d977..2a564889bd 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1839,7 +1839,7 @@ static void sm501_init(SM501State *s, DeviceState *dev,
>                                  &s->twoD_engine_region);
>  
>      /* create qemu graphic console */
> -    s->con = graphic_console_init(DEVICE(dev), 0, &sm501_ops, s);
> +    s->con = graphic_console_init(dev, 0, &sm501_ops, s);
>  }
>  
>  static const VMStateDescription vmstate_sm501_state = {
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 76de16e8ea..1fb45b1aab 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -868,9 +868,9 @@ static void tcx_realizefn(DeviceState *dev, Error **errp)
>      sysbus_init_irq(sbd, &s->irq);
>  
>      if (s->depth == 8) {
> -        s->con = graphic_console_init(DEVICE(dev), 0, &tcx_ops, s);
> +        s->con = graphic_console_init(dev, 0, &tcx_ops, s);
>      } else {
> -        s->con = graphic_console_init(DEVICE(dev), 0, &tcx24_ops, s);
> +        s->con = graphic_console_init(dev, 0, &tcx24_ops, s);
>      }
>      s->thcmisc = 0;
>  
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 0633ed382c..3aaeeeca1e 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -74,7 +74,7 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>                                          0x000a0000,
>                                          vga_io_memory, 1);
>      memory_region_set_coalescing(vga_io_memory);
> -    s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
> +    s->con = graphic_console_init(dev, 0, s->hw_ops, s);
>  
>      memory_region_add_subregion(isa_address_space(isadev),
>                                  VBE_DISPI_LFB_PHYSICAL_ADDRESS,
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index 30b9aea247..2e02e1c4fa 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -305,7 +305,7 @@ static void imx_i2c_realize(DeviceState *dev, Error **errp)
>                            IMX_I2C_MEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> -    s->bus = i2c_init_bus(DEVICE(dev), NULL);
> +    s->bus = i2c_init_bus(dev, NULL);
>  }
>  
>  static void imx_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
> index 0aa1be3ce7..9a724f3a3e 100644
> --- a/hw/i2c/mpc_i2c.c
> +++ b/hw/i2c/mpc_i2c.c
> @@ -332,7 +332,7 @@ static void mpc_i2c_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&i2c->iomem, OBJECT(i2c), &i2c_ops, i2c,
>                            "mpc-i2c", 0x14);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &i2c->iomem);
> -    i2c->bus = i2c_init_bus(DEVICE(dev), "i2c");
> +    i2c->bus = i2c_init_bus(dev, "i2c");
>  }
>  
>  static void mpc_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 3b2de4c312..b402a93636 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -193,7 +193,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>              blk_unref(blk);
>          }
>      }
> -    qdev_reset_all(DEVICE(dev));
> +    qdev_reset_all(dev);
>      return 0;
>  }
>  
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index b8466a4a3f..4b7def9096 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -758,7 +758,7 @@ static void pmu_realize(DeviceState *dev, Error **errp)
>  
>      if (s->has_adb) {
>          qbus_create_inplace(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
> -                            DEVICE(dev), "adb.0");
> +                            dev, "adb.0");
>          s->adb_poll_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, pmu_adb_poll, s);
>          s->adb_poll_mask = 0xffff;
>          s->autopoll_rate_ms = 20;
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 041ed21017..25ebee7ec2 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1035,8 +1035,7 @@ static void ftgmac100_realize(DeviceState *dev, Error **errp)
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>  
>      s->nic = qemu_new_nic(&net_ftgmac100_info, &s->conf,
> -                          object_get_typename(OBJECT(dev)), DEVICE(dev)->id,
> -                          s);
> +                          object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>  }
>  
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index a35c33683e..7adcc9df65 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1323,7 +1323,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
>  
>      s->nic = qemu_new_nic(&imx_eth_net_info, &s->conf,
>                            object_get_typename(OBJECT(dev)),
> -                          DEVICE(dev)->id, s);
> +                          dev->id, s);
>  
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>  }
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 01ccad9e8e..ffe78a8823 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -156,7 +156,7 @@ void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
>  
>  static void nubus_device_realize(DeviceState *dev, Error **errp)
>  {
> -    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(dev)));
> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
>      NubusDevice *nd = NUBUS_DEVICE(dev);
>      char *name;
>      hwaddr slot_offset;
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index cc6545c8a8..f212796044 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -606,7 +606,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
>      BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
>  
>      memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCILO_SIZE);
> -    phb->bus = pci_register_root_bus(DEVICE(dev), "pci",
> +    phb->bus = pci_register_root_bus(dev, "pci",
>                                       pci_bonito_set_irq, pci_bonito_map_irq,
>                                       dev, &bs->pci_mem, get_system_io(),
>                                       0x28, 32, TYPE_PCI_BUS);
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9a2bd501aa..3337f5e79c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4031,7 +4031,7 @@ static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>      /* hotplug hooks should check it's enabled before getting this far */
>      assert(drc);
>  
> -    spapr_drc_attach(drc, DEVICE(dev), &local_err);
> +    spapr_drc_attach(drc, dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index 08f2fc1dde..0a3e86f949 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -129,7 +129,7 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < 4; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>      }
> -    phb->bus = pci_register_root_bus(DEVICE(dev), "pci",
> +    phb->bus = pci_register_root_bus(dev, "pci",
>                                       sh_pci_set_irq, sh_pci_map_irq,
>                                       s->irq,
>                                       get_system_memory(),
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 4a373b2373..f9d013811a 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -705,7 +705,7 @@ int xen_be_init(void)
>  
>      xen_sysdev = qdev_create(NULL, TYPE_XENSYSDEV);
>      qdev_init_nofail(xen_sysdev);
> -    xen_sysbus = qbus_create(TYPE_XENSYSBUS, DEVICE(xen_sysdev), "xen-sysbus");
> +    xen_sysbus = qbus_create(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
>      qbus_set_bus_hotplug_handler(xen_sysbus, &error_abort);
>  
>      return 0;
> 


