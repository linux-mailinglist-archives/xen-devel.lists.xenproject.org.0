Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1C1A7105
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 04:32:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOBMB-0006Ug-4d; Tue, 14 Apr 2020 02:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htbk=56=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1jOBM8-0006Ua-MA
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 02:31:21 +0000
X-Inumbo-ID: e0207e9c-7df7-11ea-b4f4-bc764e2007e4
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0207e9c-7df7-11ea-b4f4-bc764e2007e4;
 Tue, 14 Apr 2020 02:31:17 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491TwQ2XQSz9s71; Tue, 14 Apr 2020 12:26:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831398;
 bh=HmsWa8K/94DvliAFszW4AdoanaFl0AvpTunVNJ3j37E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F1gbgrLBXGerhx/EuvZz/DHPqzbBqAmokvVRav+nq7l0m1DAecodD/KDke/MsFPvz
 iEti/u5rxIs2t/PxD7CIs09dbTUeaUM3VNz4q+E+TQYT0xOZFylOeK6blOHXt4szoN
 OXpqW+zYFxxiAgHAlnQIKojbsvMwgW9ihAH2csPU=
Date: Tue, 14 Apr 2020 12:07:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 3/3] hw: Remove unnecessary DEVICE() cast
Message-ID: <20200414020735.GF48061@umbus.fritz.box>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Content-Disposition: inline
In-Reply-To: <20200412210954.32313-4-f4bug@amsat.org>
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2020 at 11:09:54PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The DEVICE() macro is defined as:
>=20
>   #define DEVICE(obj) OBJECT_CHECK(DeviceState, (obj), TYPE_DEVICE)
>=20
> Remove unnecessary DEVICE() casts.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef DeviceState;
>   DeviceState *s;
>   @@
>   -   DEVICE(s)
>   +   s
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

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
>=20
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 753dbb9a77..7e2a4556bd 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -1353,7 +1353,7 @@ static void artist_realizefn(DeviceState *dev, Erro=
r **errp)
>      s->cursor_height =3D 32;
>      s->cursor_width =3D 32;
> =20
> -    s->con =3D graphic_console_init(DEVICE(dev), 0, &artist_ops, s);
> +    s->con =3D graphic_console_init(dev, 0, &artist_ops, s);
>      qemu_console_resize(s->con, s->width, s->height);
>  }
> =20
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index a1ede10394..f7f1c199ce 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -321,7 +321,7 @@ static void cg3_realizefn(DeviceState *dev, Error **e=
rrp)
> =20
>      sysbus_init_irq(sbd, &s->irq);
> =20
> -    s->con =3D graphic_console_init(DEVICE(dev), 0, &cg3_ops, s);
> +    s->con =3D graphic_console_init(dev, 0, &cg3_ops, s);
>      qemu_console_resize(s->con, s->width, s->height);
>  }
> =20
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index de0ab9d977..2a564889bd 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1839,7 +1839,7 @@ static void sm501_init(SM501State *s, DeviceState *=
dev,
>                                  &s->twoD_engine_region);
> =20
>      /* create qemu graphic console */
> -    s->con =3D graphic_console_init(DEVICE(dev), 0, &sm501_ops, s);
> +    s->con =3D graphic_console_init(dev, 0, &sm501_ops, s);
>  }
> =20
>  static const VMStateDescription vmstate_sm501_state =3D {
> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
> index 76de16e8ea..1fb45b1aab 100644
> --- a/hw/display/tcx.c
> +++ b/hw/display/tcx.c
> @@ -868,9 +868,9 @@ static void tcx_realizefn(DeviceState *dev, Error **e=
rrp)
>      sysbus_init_irq(sbd, &s->irq);
> =20
>      if (s->depth =3D=3D 8) {
> -        s->con =3D graphic_console_init(DEVICE(dev), 0, &tcx_ops, s);
> +        s->con =3D graphic_console_init(dev, 0, &tcx_ops, s);
>      } else {
> -        s->con =3D graphic_console_init(DEVICE(dev), 0, &tcx24_ops, s);
> +        s->con =3D graphic_console_init(dev, 0, &tcx24_ops, s);
>      }
>      s->thcmisc =3D 0;
> =20
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 0633ed382c..3aaeeeca1e 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -74,7 +74,7 @@ static void vga_isa_realizefn(DeviceState *dev, Error *=
*errp)
>                                          0x000a0000,
>                                          vga_io_memory, 1);
>      memory_region_set_coalescing(vga_io_memory);
> -    s->con =3D graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
> +    s->con =3D graphic_console_init(dev, 0, s->hw_ops, s);
> =20
>      memory_region_add_subregion(isa_address_space(isadev),
>                                  VBE_DISPI_LFB_PHYSICAL_ADDRESS,
> diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
> index 30b9aea247..2e02e1c4fa 100644
> --- a/hw/i2c/imx_i2c.c
> +++ b/hw/i2c/imx_i2c.c
> @@ -305,7 +305,7 @@ static void imx_i2c_realize(DeviceState *dev, Error *=
*errp)
>                            IMX_I2C_MEM_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> -    s->bus =3D i2c_init_bus(DEVICE(dev), NULL);
> +    s->bus =3D i2c_init_bus(dev, NULL);
>  }
> =20
>  static void imx_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
> index 0aa1be3ce7..9a724f3a3e 100644
> --- a/hw/i2c/mpc_i2c.c
> +++ b/hw/i2c/mpc_i2c.c
> @@ -332,7 +332,7 @@ static void mpc_i2c_realize(DeviceState *dev, Error *=
*errp)
>      memory_region_init_io(&i2c->iomem, OBJECT(i2c), &i2c_ops, i2c,
>                            "mpc-i2c", 0x14);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &i2c->iomem);
> -    i2c->bus =3D i2c_init_bus(DEVICE(dev), "i2c");
> +    i2c->bus =3D i2c_init_bus(dev, "i2c");
>  }
> =20
>  static void mpc_i2c_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 3b2de4c312..b402a93636 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -193,7 +193,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool a=
ux)
>              blk_unref(blk);
>          }
>      }
> -    qdev_reset_all(DEVICE(dev));
> +    qdev_reset_all(dev);
>      return 0;
>  }
> =20
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index b8466a4a3f..4b7def9096 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -758,7 +758,7 @@ static void pmu_realize(DeviceState *dev, Error **err=
p)
> =20
>      if (s->has_adb) {
>          qbus_create_inplace(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BU=
S,
> -                            DEVICE(dev), "adb.0");
> +                            dev, "adb.0");
>          s->adb_poll_timer =3D timer_new_ms(QEMU_CLOCK_VIRTUAL, pmu_adb_p=
oll, s);
>          s->adb_poll_mask =3D 0xffff;
>          s->autopoll_rate_ms =3D 20;
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 041ed21017..25ebee7ec2 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1035,8 +1035,7 @@ static void ftgmac100_realize(DeviceState *dev, Err=
or **errp)
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
> =20
>      s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
> -                          object_get_typename(OBJECT(dev)), DEVICE(dev)-=
>id,
> -                          s);
> +                          object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>  }
> =20
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index a35c33683e..7adcc9df65 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1323,7 +1323,7 @@ static void imx_eth_realize(DeviceState *dev, Error=
 **errp)
> =20
>      s->nic =3D qemu_new_nic(&imx_eth_net_info, &s->conf,
>                            object_get_typename(OBJECT(dev)),
> -                          DEVICE(dev)->id, s);
> +                          dev->id, s);
> =20
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>  }
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 01ccad9e8e..ffe78a8823 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -156,7 +156,7 @@ void nubus_register_rom(NubusDevice *dev, const uint8=
_t *rom, uint32_t size,
> =20
>  static void nubus_device_realize(DeviceState *dev, Error **errp)
>  {
> -    NubusBus *nubus =3D NUBUS_BUS(qdev_get_parent_bus(DEVICE(dev)));
> +    NubusBus *nubus =3D NUBUS_BUS(qdev_get_parent_bus(dev));
>      NubusDevice *nd =3D NUBUS_DEVICE(dev);
>      char *name;
>      hwaddr slot_offset;
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index cc6545c8a8..f212796044 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -606,7 +606,7 @@ static void bonito_pcihost_realize(DeviceState *dev, =
Error **errp)
>      BonitoState *bs =3D BONITO_PCI_HOST_BRIDGE(dev);
> =20
>      memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIL=
O_SIZE);
> -    phb->bus =3D pci_register_root_bus(DEVICE(dev), "pci",
> +    phb->bus =3D pci_register_root_bus(dev, "pci",
>                                       pci_bonito_set_irq, pci_bonito_map_=
irq,
>                                       dev, &bs->pci_mem, get_system_io(),
>                                       0x28, 32, TYPE_PCI_BUS);
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9a2bd501aa..3337f5e79c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4031,7 +4031,7 @@ static void spapr_phb_plug(HotplugHandler *hotplug_=
dev, DeviceState *dev,
>      /* hotplug hooks should check it's enabled before getting this far */
>      assert(drc);
> =20
> -    spapr_drc_attach(drc, DEVICE(dev), &local_err);
> +    spapr_drc_attach(drc, dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
> index 08f2fc1dde..0a3e86f949 100644
> --- a/hw/sh4/sh_pci.c
> +++ b/hw/sh4/sh_pci.c
> @@ -129,7 +129,7 @@ static void sh_pci_device_realize(DeviceState *dev, E=
rror **errp)
>      for (i =3D 0; i < 4; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>      }
> -    phb->bus =3D pci_register_root_bus(DEVICE(dev), "pci",
> +    phb->bus =3D pci_register_root_bus(dev, "pci",
>                                       sh_pci_set_irq, sh_pci_map_irq,
>                                       s->irq,
>                                       get_system_memory(),
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 4a373b2373..f9d013811a 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -705,7 +705,7 @@ int xen_be_init(void)
> =20
>      xen_sysdev =3D qdev_create(NULL, TYPE_XENSYSDEV);
>      qdev_init_nofail(xen_sysdev);
> -    xen_sysbus =3D qbus_create(TYPE_XENSYSBUS, DEVICE(xen_sysdev), "xen-=
sysbus");
> +    xen_sysbus =3D qbus_create(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
>      qbus_set_bus_hotplug_handler(xen_sysbus, &error_abort);
> =20
>      return 0;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VGucACgkQbDjKyiDZ
s5KoIhAAqcK6HrObC31z9u8JjLG9LjEA5kk7/mHXFJlQKMzbaUPmPKy/BC+QgFQ6
fJ55NL/NdQRQpwJTQGFl6o2oFmbZHRXF8cgZvlXD/1QCNVcqdOkDV9wWfB2DuOny
rxeb6A86iunkfnLEb6gA0CFZcUt0Em3bU73GGKkA+/1Q/0mq/BXx5tlJx8+NNnCs
jqeuZwgqyDy1RyjwtL5UL0ai49BQbUpwH+WMqQnnNRIzgDvWkb0+vo7GYeNfzK7v
FCrz2XvCJ0HCPsAtt3eVItl8ZFR7iUqsio3C7pCZKW20+c+1B0iq4ydJdzu6fPgR
hbY7pJWzwRng8qL1/tGy84Bh41vv67W/VMb6JL3RYn36SWYzjp7UnjF7IFrWY6/E
QTR/aw8K4XZiV2kMMyMDeE1hoMTqjaUC601jqbVp6M3PYrPq9dL6HKXXILjpVpxS
zfIrMhb/JsCkW7Kcnvps3wJ2yPJ9ByibIQRHVahFVv7niAYrKSPavnUYkxjKvJoX
WO/sl89qW57rOGbO45goK7aMbyleOe4qmxlrI9p7DEZYicwZEzS4lsLUEfzKb1O+
4A5n4jiwXr1zBgisy54f48pTdxKG7SGuBtmPPWVpmO/lCGUzey9J9LUM9qYiiHwO
fLPRSGBJwYvqAuQGpI16BDKTeWJYpCC358/N4U1iy9apJ8H39Nk=
=WzAC
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--

