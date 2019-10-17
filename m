Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67167DB073
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL73u-0006Xh-A5; Thu, 17 Oct 2019 14:47:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL73t-0006XY-8u
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:47:33 +0000
X-Inumbo-ID: 0c565254-f0ed-11e9-beca-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c565254-f0ed-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 14:47:31 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 83so2400981oii.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EzzEwr9FQVQQWPxcF80oRuOq7A13UZrLWdbTGNDLsQI=;
 b=I3kFa4mQVyx9cakEkuuVnEjW+zknXAn5uU9pfD5J4LPFgIyxk+NCmgJMIOopPOVltV
 xrC5gfP8+w9KqfZS/YlsPhmnupxsDxZ9B3GRLiSPFmMZSBSFFj0Nb3IrBjWLKbw0T93o
 D/dDUo3dkeZDV2wVnijqzvBMeSo5gJxBgunmMGRLtdDaxlG+EpeNobWdjr1iPyYVs/ce
 JcmbguDrPS2CNM6lw+rzARYWuFGf0LqqK1qULuUzLldZc4LfmPRRlng74CB4hA262CaU
 M+nxlRE++iMVnm9D8Cq22Xj3IdZXCmMyWFZBjEmF12JNu6xoFLwpEYbMM+7HFtBYP9Ew
 +1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EzzEwr9FQVQQWPxcF80oRuOq7A13UZrLWdbTGNDLsQI=;
 b=phARAm+x86iwwEA3GkKXrt/x3iSkSH5RPaLoYAyrB9KsTnCVZbGNybbHvhP8eV2ivm
 78iC87fSg53b3RHhxWhK8otPDiny/eyY+InbA2SEZCtOhDHQAaTKG0thBGhcW2KcP90w
 fMqWRyAPZrIEKYKjnWbZHj8thWQVCmSRc/FJzGshfHVlYJwdEGRp4hWuhTIggf6EvdC5
 Iu1JZAKIJww+oI6Apgu4Iy+MxFWxCf4cL3OfA0hW1zuLQDxx6JJffKJ3ZL6pu6rIf09V
 0bw1qF/TCQeE1QUsAOIthxWiJNGzwJ/f/saN1DEaXQ2DYReNA7QHiV+Yj1WYCR/106BK
 u1Xw==
X-Gm-Message-State: APjAAAWlr0PUo4++EkBj+Jl675qzfJmrFpmleKfumnh4l49TdwYxsQ7P
 jJ6hBg2yeF3kDId417AJb6Ka3Pv8uQKLdy/UDr8=
X-Google-Smtp-Source: APXvYqwSdE8G2wWLz4cypVP6rw4ZrgSMSmoShd4nguDWg5TFoNi6YWVRbEVL2kFXt9Wlwh1muuDyL24IxtmP5S3/hQk=
X-Received: by 2002:aca:62d5:: with SMTP id w204mr3561597oib.136.1571323651309; 
 Thu, 17 Oct 2019 07:47:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:47:30
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-20-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-20-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:47:30 +0200
Message-ID: <CAL1e-=ghBWM7XP8Q8Wpe3_iz0sr7zEcXVA=ZzexCpXc_Chz13Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 19/32] hw/isa/piix4: Move piix4_create() to
 hw/isa/piix4.c
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============6718649808049230011=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6718649808049230011==
Content-Type: multipart/alternative; boundary="00000000000010443805951c4c4c"

--00000000000010443805951c4c4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Now that we properly refactored the piix4_create() function, let's
> move it to hw/isa/piix4.c where it belongs, so it can be reused
> on other places.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c                | 30 ++++++++++++++++++++++++++++++
>  hw/mips/gt64xxx_pci.c         |  1 +
>  hw/mips/mips_malta.c          | 28 ----------------------------
>  include/hw/i386/pc.h          |  2 --
>  include/hw/southbridge/piix.h |  6 ++++++
>  5 files changed, 37 insertions(+), 30 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 9f554747af..d90899e122 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -27,12 +27,14 @@
>  #include "qapi/error.h"
>  #include "hw/irq.h"
>  #include "hw/i386/pc.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
>  #include "hw/dma/i8257.h"
>  #include "hw/timer/i8254.h"
>  #include "hw/timer/mc146818rtc.h"
> +#include "hw/ide.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -234,3 +236,31 @@ static void piix4_register_types(void)
>  }
>
>  type_init(piix4_register_types)
> +
> +DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
> +                          I2CBus **smbus, size_t ide_buses)
> +{
> +    size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;
> +    DriveInfo **hd;
> +    PCIDevice *pci;
> +    DeviceState *dev;
> +
> +    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> +                                          true, TYPE_PIIX4_PCI_DEVICE);
> +    dev =3D DEVICE(pci);
> +    if (isa_bus) {
> +        *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> +    }
> +
> +    hd =3D g_new(DriveInfo *, ide_drives);
> +    ide_drive_get(hd, ide_drives);
> +    pci_piix4_ide_init(pci_bus, hd, pci->devfn + 1);
> +    g_free(hd);
> +    pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
> +    if (smbus) {
> +        *smbus =3D piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100,
> +                               isa_get_irq(NULL, 9), NULL, 0, NULL);
> +   }
> +
> +    return dev;
> +}
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index f325bd6c1c..c277398c0d 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -28,6 +28,7 @@
>  #include "hw/mips/mips.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> +#include "hw/southbridge/piix.h"
>  #include "migration/vmstate.h"
>  #include "hw/i386/pc.h"
>  #include "hw/irq.h"
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 0d4312840b..477a4725c0 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1210,34 +1210,6 @@ static void mips_create_cpu(MachineState *ms,
> MaltaState *s,
>      }
>  }
>
> -static DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
> -                                 I2CBus **smbus, size_t ide_buses)
> -{
> -    const size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;
> -    DriveInfo **hd;
> -    PCIDevice *pci;
> -    DeviceState *dev;
> -
> -    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> -                                          true, TYPE_PIIX4_PCI_DEVICE);
> -    dev =3D DEVICE(pci);
> -    if (isa_bus) {
> -        *isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> -    }
> -
> -    hd =3D g_new(DriveInfo *, ide_drives);
> -    ide_drive_get(hd, ide_drives);
> -    pci_piix4_ide_init(pci_bus, hd, pci->devfn + 1);
> -    g_free(hd);
> -    pci_create_simple(pci_bus, pci->devfn + 2, "piix4-usb-uhci");
> -    if (smbus) {
> -        *smbus =3D piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100,
> -                               isa_get_irq(NULL, 9), NULL, 0, NULL);
> -   }
> -
> -    return dev;
> -}
> -
>  static
>  void mips_malta_init(MachineState *machine)
>  {
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c671c9fd2a..b63fc7631e 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -274,8 +274,6 @@ PCIBus *i440fx_init(const char *host_type, const char
> *pci_type,
>                      MemoryRegion *ram_memory);
>
>  PCIBus *find_i440fx(void);
> -/* piix4.c */
> -extern PCIDevice *piix4_dev;
>
>  /* pc_sysfw.c */
>  void pc_system_flash_create(PCMachineState *pcms);
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
> index b8ce26fec4..add352456b 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -2,6 +2,7 @@
>   * QEMU PIIX South Bridge Emulation
>   *
>   * Copyright (c) 2006 Fabrice Bellard
> + * Copyright (c) 2018 Herv=C3=A9 Poussineau
>   *
>   * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
>   * See the COPYING file in the top-level directory.
> @@ -17,4 +18,9 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t
> smb_io_base,
>                        qemu_irq sci_irq, qemu_irq smi_irq,
>                        int smm_enabled, DeviceState **piix4_pm);
>
> +extern PCIDevice *piix4_dev;
> +
> +DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
> +                          I2CBus **smbus, size_t ide_buses);
> +
>  #endif
> --
> 2.21.0
>
>
>

--00000000000010443805951c4c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
Now that we properly refactored the piix4_create() function, let&#39;s<br>
move it to hw/isa/piix4.c where it belongs, so it can be reused<br>
on other places.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 30 ++++++++++++++++++++++++++++++<br>
=C2=A0hw/mips/gt64xxx_pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br=
>
=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 ---------=
-------------------<br>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<b=
r>
=C2=A0include/hw/southbridge/piix.h |=C2=A0 6 ++++++<br>
=C2=A05 files changed, 37 insertions(+), 30 deletions(-)<br>
<br></blockquote><div><br></div><div><div id=3D"cvcmsg_16dbfeb33c93ed97" cl=
ass=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0p=
x;margin-bottom:11px;overflow:visible"><div class=3D"Vh" id=3D"cvcfullmsg_1=
6dbfeb33c93ed97"><div id=3D"cvcmsgbod_16dbfeb33c93ed97" class=3D"aj"><div c=
lass=3D"Ni"><div class=3D"ni pi " dir=3D"ltr"><p dir=3D"ltr">Reviewed-by: A=
leksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.com" target=3D"=
_blank">amarkovic@wavecomp.com</a>&gt;</p><div style=3D"clear:both"></div><=
/div><div style=3D"clear:both"></div><div><div class=3D"M j T b hc Aj S" ta=
bindex=3D"0"><div class=3D"V j hf"></div></div></div><div style=3D"clear:bo=
th"></div></div></div></div></div><div id=3D"cvcmsg_16dbfecd588da1f7" class=
=3D"yh" style=3D"margin-bottom:11px"><div class=3D"Vh" id=3D"cvcfullmsg_16d=
bfecd588da1f7"><div class=3D"M j Zi Mi  " tabindex=3D"0"><div id=3D"cvcrepl=
y_16dbfecd588da1f7" class=3D"M j T b hc xh S  " tabindex=3D"0"><div class=
=3D"V j td"></div></div></div></div></div></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 9f554747af..d90899e122 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -27,12 +27,14 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/dma/i8257.h&quot;<br>
=C2=A0#include &quot;hw/timer/i8254.h&quot;<br>
=C2=A0#include &quot;hw/timer/mc146818rtc.h&quot;<br>
+#include &quot;hw/ide.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
@@ -234,3 +236,31 @@ static void piix4_register_types(void)<br>
=C2=A0}<br>
<br>
=C2=A0type_init(piix4_register_<wbr>types)<br>
+<br>
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 I2CBus **smbus, size_t ide_buses)<br>
+{<br>
+=C2=A0 =C2=A0 size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;<br>
+=C2=A0 =C2=A0 DriveInfo **hd;<br>
+=C2=A0 =C2=A0 PCIDevice *pci;<br>
+=C2=A0 =C2=A0 DeviceState *dev;<br>
+<br>
+=C2=A0 =C2=A0 pci =3D pci_create_simple_<wbr>multifunction(pci_bus, PCI_DE=
VFN(10, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, TYPE_PIIX4_PCI_DEVICE);<br>
+=C2=A0 =C2=A0 dev =3D DEVICE(pci);<br>
+=C2=A0 =C2=A0 if (isa_bus) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>d=
ev, &quot;isa.0&quot;));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 hd =3D g_new(DriveInfo *, ide_drives);<br>
+=C2=A0 =C2=A0 ide_drive_get(hd, ide_drives);<br>
+=C2=A0 =C2=A0 pci_piix4_ide_init(pci_bus, hd, pci-&gt;devfn + 1);<br>
+=C2=A0 =C2=A0 g_free(hd);<br>
+=C2=A0 =C2=A0 pci_create_simple(pci_bus, pci-&gt;devfn + 2, &quot;piix4-us=
b-uhci&quot;);<br>
+=C2=A0 =C2=A0 if (smbus) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *smbus =3D piix4_pm_init(pci_bus, pci-&gt;devf=
n + 3, 0x1100,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_get_irq(NULL, 9), NULL, 0, NULL);=
<br>
+=C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 return dev;<br>
+}<br>
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c<br>
index f325bd6c1c..c277398c0d 100644<br>
--- a/hw/mips/gt64xxx_pci.c<br>
+++ b/hw/mips/gt64xxx_pci.c<br>
@@ -28,6 +28,7 @@<br>
=C2=A0#include &quot;hw/mips/mips.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 0d4312840b..477a4725c0 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -1210,34 +1210,6 @@ static void mips_create_cpu(MachineState *ms, MaltaS=
tate *s,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2CBus **smbus, size_t ide_bus=
es)<br>
-{<br>
-=C2=A0 =C2=A0 const size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;<br>
-=C2=A0 =C2=A0 DriveInfo **hd;<br>
-=C2=A0 =C2=A0 PCIDevice *pci;<br>
-=C2=A0 =C2=A0 DeviceState *dev;<br>
-<br>
-=C2=A0 =C2=A0 pci =3D pci_create_simple_<wbr>multifunction(pci_bus, PCI_DE=
VFN(10, 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, TYPE_PIIX4_PCI_DEVICE);<br>
-=C2=A0 =C2=A0 dev =3D DEVICE(pci);<br>
-=C2=A0 =C2=A0 if (isa_bus) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>d=
ev, &quot;isa.0&quot;));<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 hd =3D g_new(DriveInfo *, ide_drives);<br>
-=C2=A0 =C2=A0 ide_drive_get(hd, ide_drives);<br>
-=C2=A0 =C2=A0 pci_piix4_ide_init(pci_bus, hd, pci-&gt;devfn + 1);<br>
-=C2=A0 =C2=A0 g_free(hd);<br>
-=C2=A0 =C2=A0 pci_create_simple(pci_bus, pci-&gt;devfn + 2, &quot;piix4-us=
b-uhci&quot;);<br>
-=C2=A0 =C2=A0 if (smbus) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *smbus =3D piix4_pm_init(pci_bus, pci-&gt;devf=
n + 3, 0x1100,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_get_irq(NULL, 9), NULL, 0, NULL);=
<br>
-=C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 return dev;<br>
-}<br>
-<br>
=C2=A0static<br>
=C2=A0void mips_malta_init(MachineState *machine)<br>
=C2=A0{<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index c671c9fd2a..b63fc7631e 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -274,8 +274,6 @@ PCIBus *i440fx_init(const char *host_type, const char *=
pci_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MemoryRegion *ram_memory);<br>
<br>
=C2=A0PCIBus *find_i440fx(void);<br>
-/* piix4.c */<br>
-extern PCIDevice *piix4_dev;<br>
<br>
=C2=A0/* pc_sysfw.c */<br>
=C2=A0void pc_system_flash_create(<wbr>PCMachineState *pcms);<br>
diff --git a/include/hw/southbridge/piix.<wbr>h b/include/hw/southbridge/pi=
ix.<wbr>h<br>
index b8ce26fec4..add352456b 100644<br>
--- a/include/hw/southbridge/piix.<wbr>h<br>
+++ b/include/hw/southbridge/piix.<wbr>h<br>
@@ -2,6 +2,7 @@<br>
=C2=A0 * QEMU PIIX South Bridge Emulation<br>
=C2=A0 *<br>
=C2=A0 * Copyright (c) 2006 Fabrice Bellard<br>
+ * Copyright (c) 2018 Herv=C3=A9 Poussineau<br>
=C2=A0 *<br>
=C2=A0 * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
@@ -17,4 +18,9 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t sm=
b_io_base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_irq sci_irq, qemu_irq smi_irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int smm_enabled, DeviceState **piix4_pm);<br>
<br>
+extern PCIDevice *piix4_dev;<br>
+<br>
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 I2CBus **smbus, size_t ide_buses);<br>
+<br>
=C2=A0#endif<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--00000000000010443805951c4c4c--


--===============6718649808049230011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6718649808049230011==--

