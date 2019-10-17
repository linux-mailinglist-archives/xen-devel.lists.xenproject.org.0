Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4FDB069
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL72s-0006N9-Tu; Thu, 17 Oct 2019 14:46:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL72q-0006N0-J1
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:46:28 +0000
X-Inumbo-ID: e6100b6c-f0ec-11e9-beca-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6100b6c-f0ec-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 14:46:27 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id k25so2335495oiw.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bajkATidccafyipZ4lq0ynE1Naf8M8ZKNKlT1UKXdmw=;
 b=j/+HfKY9qh5qec2aOeUg4d4f7/9XxtRn+mHtFFuMr7XhW6yrXcz4RvdipUiyrGpLC6
 tU88+5xNiDMvPERoRf79hLvF+5cN0SytlErxHpDlYBVvtBrVYtpTAskfcT1eSE+453hm
 XTXWYxaoQRRU6f4IEf9WtFSXlR0g9TgepKViVg2Sgrztx+SreSDK6/f+RGyiElmQYTft
 0iWrqXJPbgSC/gLT6CFsxRWE6/20gMUW1bq/Fyw/aDGJIshFziCpOpKY2FQU9wqNDrYJ
 c0YOtCSx3/FMhhK9UltSJEhXfks0pMaadChbLePeNi7OYyIxY+cenV4N/UTsUsWlXGyZ
 pyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bajkATidccafyipZ4lq0ynE1Naf8M8ZKNKlT1UKXdmw=;
 b=tWiCvnOpk/o6WrizmqJ8F/uH6bSfTJfYXLyN+0qR5ZlWTK2EDrN6JBXICdhfnVXRz5
 DExV2/ILPKVM8qk6Sq5YUWj741EZhFCDY5ylXIRnF8r6rMJACFZMUOH4K273V4Sowmgz
 U1GCPUYIsZqnrV/hU+gTr12uw+RDcsbdycmJ3dLVdtfMZAdHm0+HFh7XEqQAQQxzJ8rw
 ih7AilcefKazbiRJ109fd8CJ0jrptxeV3R5QPbjIISvpSPsf6ILbBbk2bRYSh1S9BCyE
 fpvtb0QDt/bIlk5BtDZBR26/W2HEfeHZzfCMocdynbAQKrL+sahKCaXEMPtqK9+X5Fp4
 iidA==
X-Gm-Message-State: APjAAAWxhGR5DPVqGtgI6hUJ3qx1KayvRcds8r0c01SmJdL5Ma+NSK0w
 b06Mgjm3NTfgYwNKS4uuO5iAdzVlptm55iFNsAs=
X-Google-Smtp-Source: APXvYqxeiRwknMSCqcxadDxS+bU5XBfQ5Z/gnWNqt/tiC34SYyeNnjwvTvEZUgXTxaNY6JEXxXGs3Pzr0EjXQSZarJw=
X-Received: by 2002:aca:4e56:: with SMTP id c83mr3569017oib.53.1571323587175; 
 Thu, 17 Oct 2019 07:46:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:46:25
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-19-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-19-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:46:25 +0200
Message-ID: <CAL1e-=izLYnL_gdq3MaAkU6e9=3Dd-MVd8HTyzT1zR3-UadK-w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 18/32] hw/mips/mips_malta: Extract the PIIX4
 creation code as piix4_create()
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
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============5936096042563470002=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5936096042563470002==
Content-Type: multipart/alternative; boundary="0000000000003da91c05951c4808"

--0000000000003da91c05951c4808
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> The Malta board instantiate a PIIX4 chipset doing various
> calls. Refactor all those related calls into a single
> function: piix4_create().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/mips/mips_malta.c | 47 +++++++++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 774bb810f6..0d4312840b 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1210,6 +1210,34 @@ static void mips_create_cpu(MachineState *ms,
> MaltaState *s,
>      }
>  }
>
> +static DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
> +                                 I2CBus **smbus, size_t ide_buses)
> +{
> +    const size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;
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
> +
>  static
>  void mips_malta_init(MachineState *machine)
>  {
> @@ -1231,12 +1259,8 @@ void mips_malta_init(MachineState *machine)
>      PCIBus *pci_bus;
>      ISABus *isa_bus;
>      qemu_irq cbus_irq, i8259_irq;
> -    PCIDevice *pci;
> -    int piix4_devfn;
>      I2CBus *smbus;
>      DriveInfo *dinfo;
> -    const size_t ide_drives =3D MAX_IDE_BUS * MAX_IDE_DEVS;
> -    DriveInfo **hd;
>      int fl_idx =3D 0;
>      int be;
>
> @@ -1407,14 +1431,7 @@ void mips_malta_init(MachineState *machine)
>      pci_bus =3D gt64120_register(s->i8259);
>
>      /* Southbridge */
> -    hd =3D g_new(DriveInfo *, ide_drives);
> -    ide_drive_get(hd, ide_drives);
> -
> -    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> -                                          true, TYPE_PIIX4_PCI_DEVICE);
> -    dev =3D DEVICE(pci);
> -    isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> -    piix4_devfn =3D pci->devfn;
> +    dev =3D piix4_create(pci_bus, &isa_bus, &smbus, MAX_IDE_BUS);
>
>      /* Interrupt controller */
>      qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> @@ -1422,12 +1439,6 @@ void mips_malta_init(MachineState *machine)
>          s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
>      }
>
> -    pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);
> -    g_free(hd);
> -    pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
> -    smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
> -                          isa_get_irq(NULL, 9), NULL, 0, NULL);
> -
>      /* generate SPD EEPROM data */
>      generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
>      generate_eeprom_serial(&smbus_eeprom_buf[6 * 256]);
> --
> 2.21.0
>
>
>

--0000000000003da91c05951c4808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">The Malta board instantiate a PIIX4 chipset doing v=
arious<br>
calls. Refactor all those related calls into a single<br>
function: piix4_create().<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/mips/mips_malta.c | 47 +++++++++++++++++++++++++++---<wbr>--------=
------<br>
=C2=A01 file changed, 29 insertions(+), 18 deletions(-)<br>
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
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 774bb810f6..0d4312840b 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -1210,6 +1210,34 @@ static void mips_create_cpu(MachineState *ms, MaltaS=
tate *s,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I2CBus **smbus, size_t ide_bus=
es)<br>
+{<br>
+=C2=A0 =C2=A0 const size_t ide_drives =3D ide_buses * MAX_IDE_DEVS;<br>
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
+<br>
=C2=A0static<br>
=C2=A0void mips_malta_init(MachineState *machine)<br>
=C2=A0{<br>
@@ -1231,12 +1259,8 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *pci_bus;<br>
=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq cbus_irq, i8259_irq;<br>
-=C2=A0 =C2=A0 PCIDevice *pci;<br>
-=C2=A0 =C2=A0 int piix4_devfn;<br>
=C2=A0 =C2=A0 =C2=A0I2CBus *smbus;<br>
=C2=A0 =C2=A0 =C2=A0DriveInfo *dinfo;<br>
-=C2=A0 =C2=A0 const size_t ide_drives =3D MAX_IDE_BUS * MAX_IDE_DEVS;<br>
-=C2=A0 =C2=A0 DriveInfo **hd;<br>
=C2=A0 =C2=A0 =C2=A0int fl_idx =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int be;<br>
<br>
@@ -1407,14 +1431,7 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0pci_bus =3D gt64120_register(s-&gt;i8259);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Southbridge */<br>
-=C2=A0 =C2=A0 hd =3D g_new(DriveInfo *, ide_drives);<br>
-=C2=A0 =C2=A0 ide_drive_get(hd, ide_drives);<br>
-<br>
-=C2=A0 =C2=A0 pci =3D pci_create_simple_<wbr>multifunction(pci_bus, PCI_DE=
VFN(10, 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, TYPE_PIIX4_PCI_DEVICE);<br>
-=C2=A0 =C2=A0 dev =3D DEVICE(pci);<br>
-=C2=A0 =C2=A0 isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>dev, &quot;isa.0=
&quot;));<br>
-=C2=A0 =C2=A0 piix4_devfn =3D pci-&gt;devfn;<br>
+=C2=A0 =C2=A0 dev =3D piix4_create(pci_bus, &amp;isa_bus, &amp;smbus, MAX_=
IDE_BUS);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Interrupt controller */<br>
=C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out_named(<wbr>dev, &quot;intr&quot;,=
 0, i8259_irq);<br>
@@ -1422,12 +1439,6 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;i8259[i] =3D qdev_get_gpio_in_named=
(dev, &quot;isa&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);<br>
-=C2=A0 =C2=A0 g_free(hd);<br>
-=C2=A0 =C2=A0 pci_create_simple(pci_bus, piix4_devfn + 2, &quot;piix4-usb-=
uhci&quot;);<br>
-=C2=A0 =C2=A0 smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 isa_get_irq(NULL, 9), NULL, 0, NULL);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* generate SPD EEPROM data */<br>
=C2=A0 =C2=A0 =C2=A0generate_eeprom_spd(&amp;smbus_<wbr>eeprom_buf[0 * 256]=
, ram_size);<br>
=C2=A0 =C2=A0 =C2=A0generate_eeprom_serial(&amp;smbus_<wbr>eeprom_buf[6 * 2=
56]);<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000003da91c05951c4808--


--===============5936096042563470002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5936096042563470002==--

