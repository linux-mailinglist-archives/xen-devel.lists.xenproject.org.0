Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C021516C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 06:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsIVz-0004nX-Ag; Mon, 06 Jul 2020 04:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NqVp=AQ=gmail.com=nieklinnenbank@srs-us1.protection.inumbo.net>)
 id 1jsAkD-0003Mp-5D
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 19:56:09 +0000
X-Inumbo-ID: 902a64f0-bef9-11ea-bca7-bc764e2007e4
Received: from mail-il1-x141.google.com (unknown [2607:f8b0:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 902a64f0-bef9-11ea-bca7-bc764e2007e4;
 Sun, 05 Jul 2020 19:56:07 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t18so11275007ilh.2
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jul 2020 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQ6l8az03kehxbkrP0p2iddBUqHaPLMKVPPFuTfHu9U=;
 b=kWtw4Dby/XYYuLXEnjh8R367jJFb2MdhvmUNhliOCOidwjq5kztJFVOEv4/R6vhWeC
 RY7gAm4KacL28+mwTTN5KpjoSdAo8vAjWE3civZNTdkbNc1OwRWFgI58VkcmUBPnwTeg
 VhVjkU+933Xy3DQPz37vhwqc6XpqR4/JEPHHwOiCcGP6IQ4b5r/zWA+E0QCxmgfpfKAP
 FjHH57TQKb3R/k2etDT0LHHlvwT02H37/vDecDoLgw7NpwRbhqCnns2Zh2ZdMB9ml7Cj
 epxlcJkXBVkK5YxWhnLxJGl3M8QLz5pFd//ugEQWgu7LWVPk9KIhC/8yCC1piehUBCVP
 7tQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQ6l8az03kehxbkrP0p2iddBUqHaPLMKVPPFuTfHu9U=;
 b=rAPYWQKZ//EuG95xB4QlBsWlNdq5qDEna/ViHcwJuMMuY+v8Qmz+ATl/EVhbLlVxiS
 1U3RQ+/E13hQ3OEG0BngwEkwTLdBvQIhZHLFbO9rDs1j83n3OFCBJJaC8OKK0HZ/7PMT
 zrYbA1KBefvLKYm34tAYBieOn757ZB9wTUNgOua+TrJFLSJT0kt2c7Sv1xg6NKjlByI2
 cyD349HDhJjwJuxek2UvCuQSYEGLj5Lwa9coSaBmPUmtY6wBOAywrXHCQpK1q5kPrRE+
 jSzLPXKCTgvCkOoAcP+dMC0KYxpCAYqq0P4zor0BEPKG4l81FL+HRLAVipDCthrsWSus
 4qFQ==
X-Gm-Message-State: AOAM531RNIq2fzTvPsPPBhDpgR1hR5b3F81kxQZqWociz8ebNnz+ucrA
 oQKWEEO6gMYkZARKgTNU9/CMuugRnDw597aGy4I=
X-Google-Smtp-Source: ABdhPJx+ekJQHdSYhIZ8qbbqu+IUSLrvRvQOkodCUlCfQT65+PH7H0ICsQP//H8L6oiWIEw/oLgCAVEgTfwr7D2Bfgw=
X-Received: by 2002:a92:844b:: with SMTP id l72mr28524731ild.19.1593978966003; 
 Sun, 05 Jul 2020 12:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-23-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-23-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 5 Jul 2020 21:55:57 +0200
Message-ID: <CAPan3WpZ_SCGws05S2sH9jf4MYjciE0kgpeqrDSviGTpcaj_+Q@mail.gmail.com>
Subject: Re: [PATCH 22/26] hw/usb/usb-hcd: Use OHCI type definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000000c5dca05a9b726c6"
X-Mailman-Approved-At: Mon, 06 Jul 2020 04:13:58 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000000c5dca05a9b726c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2020, 16:50 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:

> Various machine/board/soc models create OHCI device instances
> with the generic QDEV API, and don't need to access USB internals.
>
> Simplify header inclusions by moving the QOM type names into a
> simple header, with no need to include other "hw/usb" headers.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

---
>  hw/usb/hcd-ohci.h        |  2 +-
>  include/hw/usb/usb-hcd.h | 16 ++++++++++++++++
>  hw/arm/allwinner-a10.c   |  2 +-
>  hw/arm/allwinner-h3.c    |  9 +++++----
>  hw/arm/pxa2xx.c          |  3 ++-
>  hw/arm/realview.c        |  3 ++-
>  hw/arm/versatilepb.c     |  3 ++-
>  hw/display/sm501.c       |  3 ++-
>  hw/ppc/mac_newworld.c    |  3 ++-
>  hw/ppc/mac_oldworld.c    |  3 ++-
>  hw/ppc/sam460ex.c        |  3 ++-
>  hw/ppc/spapr.c           |  3 ++-
>  hw/usb/hcd-ohci-pci.c    |  2 +-
>  13 files changed, 40 insertions(+), 15 deletions(-)
>  create mode 100644 include/hw/usb/usb-hcd.h
>
> diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
> index 771927ea17..6949cf0dab 100644
> --- a/hw/usb/hcd-ohci.h
> +++ b/hw/usb/hcd-ohci.h
> @@ -21,6 +21,7 @@
>  #ifndef HCD_OHCI_H
>  #define HCD_OHCI_H
>
> +#include "hw/usb/usb-hcd.h"
>  #include "sysemu/dma.h"
>  #include "usb-internal.h"
>
> @@ -91,7 +92,6 @@ typedef struct OHCIState {
>      void (*ohci_die)(struct OHCIState *ohci);
>  } OHCIState;
>
> -#define TYPE_SYSBUS_OHCI "sysbus-ohci"
>  #define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj),
> TYPE_SYSBUS_OHCI)
>
>  typedef struct {
> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
> new file mode 100644
> index 0000000000..21fdfaf22d
> --- /dev/null
> +++ b/include/hw/usb/usb-hcd.h
> @@ -0,0 +1,16 @@
> +/*
> + * QEMU USB HCD types
> + *
> + * Copyright (c) 2020  Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_USB_HCD_TYPES_H
> +#define HW_USB_HCD_TYPES_H
> +
> +/* OHCI */
> +#define TYPE_SYSBUS_OHCI            "sysbus-ohci"
> +#define TYPE_PCI_OHCI               "pci-ohci"
> +
> +#endif
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 52e0d83760..53c24ff602 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -25,7 +25,7 @@
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> -#include "hw/usb/hcd-ohci.h"
> +#include "hw/usb/usb-hcd.h"
>
>  #define AW_A10_MMC0_BASE        0x01c0f000
>  #define AW_A10_PIC_REG_BASE     0x01c20400
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 8e09468e86..d1d90ffa79 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -28,6 +28,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>  #include "hw/misc/unimp.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "hw/usb/hcd-ehci.h"
>  #include "hw/loader.h"
>  #include "sysemu/sysemu.h"
> @@ -381,16 +382,16 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
>                           qdev_get_gpio_in(DEVICE(&s->gic),
>                                            AW_H3_GIC_SPI_EHCI3));
>
> -    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
> +    sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI0],
>                           qdev_get_gpio_in(DEVICE(&s->gic),
>                                            AW_H3_GIC_SPI_OHCI0));
> -    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
> +    sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI1],
>                           qdev_get_gpio_in(DEVICE(&s->gic),
>                                            AW_H3_GIC_SPI_OHCI1));
> -    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
> +    sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI2],
>                           qdev_get_gpio_in(DEVICE(&s->gic),
>                                            AW_H3_GIC_SPI_OHCI2));
> -    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
> +    sysbus_create_simple(TYPE_SYSBUS_OHCI, s->memmap[AW_H3_OHCI3],
>                           qdev_get_gpio_in(DEVICE(&s->gic),
>                                            AW_H3_GIC_SPI_OHCI3));
>
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index f104a33463..27196170f5 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -18,6 +18,7 @@
>  #include "hw/arm/pxa.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/char/serial.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> @@ -2196,7 +2197,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_spac=
e,
>          s->ssp[i] =3D (SSIBus *)qdev_get_child_bus(dev, "ssi");
>      }
>
> -    sysbus_create_simple("sysbus-ohci", 0x4c000000,
> +    sysbus_create_simple(TYPE_SYSBUS_OHCI, 0x4c000000,
>                           qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
>
>      s->pcmcia[0] =3D pxa2xx_pcmcia_init(address_space, 0x20000000);
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index b6c0a1adb9..0aa34bd4c2 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -16,6 +16,7 @@
>  #include "hw/net/lan9118.h"
>  #include "hw/net/smc91c111.h"
>  #include "hw/pci/pci.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> @@ -256,7 +257,7 @@ static void realview_init(MachineState *machine,
>          sysbus_connect_irq(busdev, 3, pic[51]);
>          pci_bus =3D (PCIBus *)qdev_get_child_bus(dev, "pci");
>          if (machine_usb(machine)) {
> -            pci_create_simple(pci_bus, -1, "pci-ohci");
> +            pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>          }
>          n =3D drive_get_max_bus(IF_SCSI);
>          while (n >=3D 0) {
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index e596b8170f..3e6224dc96 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -17,6 +17,7 @@
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/i2c/arm_sbcon_i2c.h"
>  #include "hw/irq.h"
> @@ -273,7 +274,7 @@ static void versatile_init(MachineState *machine, int
> board_id)
>          }
>      }
>      if (machine_usb(machine)) {
> -        pci_create_simple(pci_bus, -1, "pci-ohci");
> +        pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>      }
>      n =3D drive_get_max_bus(IF_SCSI);
>      while (n >=3D 0) {
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 9cccc68c35..5f076c841f 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -33,6 +33,7 @@
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/pci/pci.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/display/i2c-ddc.h"
> @@ -1961,7 +1962,7 @@ static void sm501_realize_sysbus(DeviceState *dev,
> Error **errp)
>      sysbus_init_mmio(sbd, &s->state.mmio_region);
>
>      /* bridge to usb host emulation module */
> -    usb_dev =3D qdev_new("sysbus-ohci");
> +    usb_dev =3D qdev_new(TYPE_SYSBUS_OHCI);
>      qdev_prop_set_uint32(usb_dev, "num-ports", 2);
>      qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7bf69f4a1f..3c32c1831b 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -55,6 +55,7 @@
>  #include "hw/input/adb.h"
>  #include "hw/ppc/mac_dbdma.h"
>  #include "hw/pci/pci.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> @@ -411,7 +412,7 @@ static void ppc_core99_init(MachineState *machine)
>      }
>
>      if (machine->usb) {
> -        pci_create_simple(pci_bus, -1, "pci-ohci");
> +        pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>
>          /* U3 needs to use USB for input because Linux doesn't support
> via-cuda
>          on PPC64 */
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index f8c204ead7..a429a3e1df 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -37,6 +37,7 @@
>  #include "hw/isa/isa.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "hw/boards.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/char/escc.h"
> @@ -301,7 +302,7 @@ static void ppc_heathrow_init(MachineState *machine)
>      qdev_realize_and_unref(dev, adb_bus, &error_fatal);
>
>      if (machine_usb(machine)) {
> -        pci_create_simple(pci_bus, -1, "pci-ohci");
> +        pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);
>      }
>
>      if (graphic_depth !=3D 15 && graphic_depth !=3D 32 && graphic_depth =
!=3D 8)
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 781b45e14b..ac60d17a86 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -36,6 +36,7 @@
>  #include "hw/i2c/ppc4xx_i2c.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/usb/usb.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "hw/usb/hcd-ehci.h"
>  #include "hw/ppc/fdt.h"
>  #include "hw/qdev-properties.h"
> @@ -372,7 +373,7 @@ static void sam460ex_init(MachineState *machine)
>
>      /* USB */
>      sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
> -    dev =3D qdev_new("sysbus-ohci");
> +    dev =3D qdev_new(TYPE_SYSBUS_OHCI);
>      qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
>      qdev_prop_set_uint32(dev, "num-ports", 6);
>      sbdev =3D SYS_BUS_DEVICE(dev);
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 0c0409077f..db1706a66c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -71,6 +71,7 @@
>  #include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
>  #include "hw/usb/usb.h"
> +#include "hw/usb/usb-hcd.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
>  #include "trace.h"
> @@ -2958,7 +2959,7 @@ static void spapr_machine_init(MachineState *machin=
e)
>
>      if (machine->usb) {
>          if (smc->use_ohci_by_default) {
> -            pci_create_simple(phb->bus, -1, "pci-ohci");
> +            pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
>          } else {
>              pci_create_simple(phb->bus, -1, "nec-usb-xhci");
>          }
> diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
> index cb6bc55f59..14df83ec2e 100644
> --- a/hw/usb/hcd-ohci-pci.c
> +++ b/hw/usb/hcd-ohci-pci.c
> @@ -29,8 +29,8 @@
>  #include "trace.h"
>  #include "hcd-ohci.h"
>  #include "usb-internal.h"
> +#include "hw/usb/usb-hcd.h"
>
> -#define TYPE_PCI_OHCI "pci-ohci"
>  #define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
>
>  typedef struct {
> --
> 2.21.3
>
>

--0000000000000c5dca05a9b726c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Jul 4, 2020, 16:50 Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Various machine/board/soc models create=
 OHCI device instances<br>
with the generic QDEV API, and don&#39;t need to access USB internals.<br>
<br>
Simplify header inclusions by moving the QOM type names into a<br>
simple header, with no need to include other &quot;hw/usb&quot; headers.<br=
>
<br>
Suggested-by: BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" targ=
et=3D"_blank" rel=3D"noreferrer">balaton@eik.bme.hu</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br></bl=
ockquote></div></div><div dir=3D"auto">Reviewed-by: Niek Linnenbank &lt;<a =
href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0hw/usb/hcd-ohci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/hw/usb/usb-hcd.h | 16 ++++++++++++++++<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 |=C2=A0 9 +++++----<br>
=C2=A0hw/arm/pxa2xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/arm/realview.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/arm/versatilepb.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0hw/display/sm501.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0hw/ppc/mac_newworld.c=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/ppc/mac_oldworld.c=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/ppc/sam460ex.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/ppc/spapr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<=
br>
=C2=A0hw/usb/hcd-ohci-pci.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A013 files changed, 40 insertions(+), 15 deletions(-)<br>
=C2=A0create mode 100644 include/hw/usb/usb-hcd.h<br>
<br>
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h<br>
index 771927ea17..6949cf0dab 100644<br>
--- a/hw/usb/hcd-ohci.h<br>
+++ b/hw/usb/hcd-ohci.h<br>
@@ -21,6 +21,7 @@<br>
=C2=A0#ifndef HCD_OHCI_H<br>
=C2=A0#define HCD_OHCI_H<br>
<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;sysemu/dma.h&quot;<br>
=C2=A0#include &quot;usb-internal.h&quot;<br>
<br>
@@ -91,7 +92,6 @@ typedef struct OHCIState {<br>
=C2=A0 =C2=A0 =C2=A0void (*ohci_die)(struct OHCIState *ohci);<br>
=C2=A0} OHCIState;<br>
<br>
-#define TYPE_SYSBUS_OHCI &quot;sysbus-ohci&quot;<br>
=C2=A0#define SYSBUS_OHCI(obj) OBJECT_CHECK(OHCISysBusState, (obj), TYPE_SY=
SBUS_OHCI)<br>
<br>
=C2=A0typedef struct {<br>
diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h<br>
new file mode 100644<br>
index 0000000000..21fdfaf22d<br>
--- /dev/null<br>
+++ b/include/hw/usb/usb-hcd.h<br>
@@ -0,0 +1,16 @@<br>
+/*<br>
+ * QEMU USB HCD types<br>
+ *<br>
+ * Copyright (c) 2020=C2=A0 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mai=
lto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</=
a>&gt;<br>
+ *<br>
+ * SPDX-License-Identifier: GPL-2.0-or-later<br>
+ */<br>
+<br>
+#ifndef HW_USB_HCD_TYPES_H<br>
+#define HW_USB_HCD_TYPES_H<br>
+<br>
+/* OHCI */<br>
+#define TYPE_SYSBUS_OHCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sy=
sbus-ohci&quot;<br>
+#define TYPE_PCI_OHCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;pci-ohci&quot;<br>
+<br>
+#endif<br>
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c<br>
index 52e0d83760..53c24ff602 100644<br>
--- a/hw/arm/allwinner-a10.c<br>
+++ b/hw/arm/allwinner-a10.c<br>
@@ -25,7 +25,7 @@<br>
=C2=A0#include &quot;hw/misc/unimp.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
-#include &quot;hw/usb/hcd-ohci.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
<br>
=C2=A0#define AW_A10_MMC0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c0f000<br>
=C2=A0#define AW_A10_PIC_REG_BASE=C2=A0 =C2=A0 =C2=A00x01c20400<br>
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
index 8e09468e86..d1d90ffa79 100644<br>
--- a/hw/arm/allwinner-h3.c<br>
+++ b/hw/arm/allwinner-h3.c<br>
@@ -28,6 +28,7 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/char/serial.h&quot;<br>
=C2=A0#include &quot;hw/misc/unimp.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-ehci.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
@@ -381,16 +382,16 @@ static void allwinner_h3_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AW_H3_GIC_SPI_EHCI3));<br>
<br>
-=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;memmap[A=
W_H3_OHCI0],<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_SYSBUS_OHCI, s-&gt;memmap[AW_H3_OH=
CI0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AW_H3_GIC_SPI_OHCI0));<br>
-=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;memmap[A=
W_H3_OHCI1],<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_SYSBUS_OHCI, s-&gt;memmap[AW_H3_OH=
CI1],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AW_H3_GIC_SPI_OHCI1));<br>
-=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;memmap[A=
W_H3_OHCI2],<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_SYSBUS_OHCI, s-&gt;memmap[AW_H3_OH=
CI2],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AW_H3_GIC_SPI_OHCI2));<br>
-=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, s-&gt;memmap[A=
W_H3_OHCI3],<br>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_SYSBUS_OHCI, s-&gt;memmap[AW_H3_OH=
CI3],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AW_H3_GIC_SPI_OHCI3));<br>
<br>
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c<br>
index f104a33463..27196170f5 100644<br>
--- a/hw/arm/pxa2xx.c<br>
+++ b/hw/arm/pxa2xx.c<br>
@@ -18,6 +18,7 @@<br>
=C2=A0#include &quot;hw/arm/pxa.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/char/serial.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;hw/i2c/i2c.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
@@ -2196,7 +2197,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ssp[i] =3D (SSIBus *)qdev_get_child=
_bus(dev, &quot;ssi&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sysbus_create_simple(&quot;sysbus-ohci&quot;, 0x4c000000,<br=
>
+=C2=A0 =C2=A0 sysbus_create_simple(TYPE_SYSBUS_OHCI, 0x4c000000,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(s-&gt;pic, PXA2XX_PIC_USBH1));<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;pcmcia[0] =3D pxa2xx_pcmcia_init(address_space, 0=
x20000000);<br>
diff --git a/hw/arm/realview.c b/hw/arm/realview.c<br>
index b6c0a1adb9..0aa34bd4c2 100644<br>
--- a/hw/arm/realview.c<br>
+++ b/hw/arm/realview.c<br>
@@ -16,6 +16,7 @@<br>
=C2=A0#include &quot;hw/net/lan9118.h&quot;<br>
=C2=A0#include &quot;hw/net/smc91c111.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
@@ -256,7 +257,7 @@ static void realview_init(MachineState *machine,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(busdev, 3, pic[51]);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus =3D (PCIBus *)qdev_get_child_bus(=
dev, &quot;pci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (machine_usb(machine)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, &=
quot;pci-ohci&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, T=
YPE_PCI_OHCI);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D drive_get_max_bus(IF_SCSI);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (n &gt;=3D 0) {<br>
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c<br>
index e596b8170f..3e6224dc96 100644<br>
--- a/hw/arm/versatilepb.c<br>
+++ b/hw/arm/versatilepb.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;hw/i2c/i2c.h&quot;<br>
=C2=A0#include &quot;hw/i2c/arm_sbcon_i2c.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
@@ -273,7 +274,7 @@ static void versatile_init(MachineState *machine, int b=
oard_id)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (machine_usb(machine)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, &quot;pci-ohci&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0n =3D drive_get_max_bus(IF_SCSI);<br>
=C2=A0 =C2=A0 =C2=A0while (n &gt;=3D 0) {<br>
diff --git a/hw/display/sm501.c b/hw/display/sm501.c<br>
index 9cccc68c35..5f076c841f 100644<br>
--- a/hw/display/sm501.c<br>
+++ b/hw/display/sm501.c<br>
@@ -33,6 +33,7 @@<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/i2c/i2c.h&quot;<br>
=C2=A0#include &quot;hw/display/i2c-ddc.h&quot;<br>
@@ -1961,7 +1962,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sbd, &amp;s-&gt;state.mmio_region);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0/* bridge to usb host emulation module */<br>
-=C2=A0 =C2=A0 usb_dev =3D qdev_new(&quot;sysbus-ohci&quot;);<br>
+=C2=A0 =C2=A0 usb_dev =3D qdev_new(TYPE_SYSBUS_OHCI);<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(usb_dev, &quot;num-ports&quot;, 2)=
;<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint64(usb_dev, &quot;dma-offset&quot;, s=
-&gt;base);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &amp;=
error_fatal);<br>
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c<br>
index 7bf69f4a1f..3c32c1831b 100644<br>
--- a/hw/ppc/mac_newworld.c<br>
+++ b/hw/ppc/mac_newworld.c<br>
@@ -55,6 +55,7 @@<br>
=C2=A0#include &quot;hw/input/adb.h&quot;<br>
=C2=A0#include &quot;hw/ppc/mac_dbdma.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;net/net.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
@@ -411,7 +412,7 @@ static void ppc_core99_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (machine-&gt;usb) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, &quot;pci-ohci&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* U3 needs to use USB for input because =
Linux doesn&#39;t support via-cuda<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on PPC64 */<br>
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c<br>
index f8c204ead7..a429a3e1df 100644<br>
--- a/hw/ppc/mac_oldworld.c<br>
+++ b/hw/ppc/mac_oldworld.c<br>
@@ -37,6 +37,7 @@<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#include &quot;hw/nvram/fw_cfg.h&quot;<br>
=C2=A0#include &quot;hw/char/escc.h&quot;<br>
@@ -301,7 +302,7 @@ static void ppc_heathrow_init(MachineState *machine)<br=
>
=C2=A0 =C2=A0 =C2=A0qdev_realize_and_unref(dev, adb_bus, &amp;error_fatal);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (machine_usb(machine)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, &quot;pci-ohci&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(pci_bus, -1, TYPE_PCI_OHCI);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (graphic_depth !=3D 15 &amp;&amp; graphic_depth !=3D=
 32 &amp;&amp; graphic_depth !=3D 8)<br>
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c<br>
index 781b45e14b..ac60d17a86 100644<br>
--- a/hw/ppc/sam460ex.c<br>
+++ b/hw/ppc/sam460ex.c<br>
@@ -36,6 +36,7 @@<br>
=C2=A0#include &quot;hw/i2c/ppc4xx_i2c.h&quot;<br>
=C2=A0#include &quot;hw/i2c/smbus_eeprom.h&quot;<br>
=C2=A0#include &quot;hw/usb/usb.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-ehci.h&quot;<br>
=C2=A0#include &quot;hw/ppc/fdt.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
@@ -372,7 +373,7 @@ static void sam460ex_init(MachineState *machine)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* USB */<br>
=C2=A0 =C2=A0 =C2=A0sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic=
[2][29]);<br>
-=C2=A0 =C2=A0 dev =3D qdev_new(&quot;sysbus-ohci&quot;);<br>
+=C2=A0 =C2=A0 dev =3D qdev_new(TYPE_SYSBUS_OHCI);<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_string(dev, &quot;masterbus&quot;, &quot;=
usb-bus.0&quot;);<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(dev, &quot;num-ports&quot;, 6);<br=
>
=C2=A0 =C2=A0 =C2=A0sbdev =3D SYS_BUS_DEVICE(dev);<br>
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c<br>
index 0c0409077f..db1706a66c 100644<br>
--- a/hw/ppc/spapr.c<br>
+++ b/hw/ppc/spapr.c<br>
@@ -71,6 +71,7 @@<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;exec/ram_addr.h&quot;<br>
=C2=A0#include &quot;hw/usb/usb.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -2958,7 +2959,7 @@ static void spapr_machine_init(MachineState *machine)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (machine-&gt;usb) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (smc-&gt;use_ohci_by_default) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(phb-&gt;bus, -=
1, &quot;pci-ohci&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_create_simple(phb-&gt;bus, -=
1, TYPE_PCI_OHCI);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_create_simple(phb-&gt;b=
us, -1, &quot;nec-usb-xhci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c<br>
index cb6bc55f59..14df83ec2e 100644<br>
--- a/hw/usb/hcd-ohci-pci.c<br>
+++ b/hw/usb/hcd-ohci-pci.c<br>
@@ -29,8 +29,8 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;hcd-ohci.h&quot;<br>
=C2=A0#include &quot;usb-internal.h&quot;<br>
+#include &quot;hw/usb/usb-hcd.h&quot;<br>
<br>
-#define TYPE_PCI_OHCI &quot;pci-ohci&quot;<br>
=C2=A0#define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI=
)<br>
<br>
=C2=A0typedef struct {<br>
-- <br>
2.21.3<br>
<br>
</blockquote></div></div></div>

--0000000000000c5dca05a9b726c6--

