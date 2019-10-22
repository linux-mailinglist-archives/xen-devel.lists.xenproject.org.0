Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73327E0147
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 11:57:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMqra-0002dX-MX; Tue, 22 Oct 2019 09:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rml8=YP=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iMqrZ-0002dR-Ln
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 09:54:01 +0000
X-Inumbo-ID: df221d86-f4b1-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df221d86-f4b1-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 09:54:00 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id i185so13613017oif.9
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MuC1cOmCY0VAJKNV+FNLCsu7bAZApxfEXtr4jhZOoYU=;
 b=k3vpukZaF5UGVkAaoYgWr1QwVADdX7dL8/LwnudhUIqZS8h0DKAo2p130A+fgeynOs
 LhbHrEidErM96Qygj0M1KZUXD7nFnkTAtGJkQDo+XFvgWG0557O7pevTjXuPwx1uExcK
 wFdJzuPUcZzXPBV51ME8gUcgoCBcp3AjeOGcq5IB6MXe7swmDfdEVJZgac8kgdPTQdZJ
 ZW7o3IOFV7P/UcpXW25CxWUYwwUPR4YJrLd3pSL8QXRNECXw7UcQLBjorIFFjQNkuU/n
 /zbTRueT44clPmlnblquMg00RlsMgrKGCK2rN4+TtvJaWwkZqQJsO1it8wgRQVH1c7q3
 gTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MuC1cOmCY0VAJKNV+FNLCsu7bAZApxfEXtr4jhZOoYU=;
 b=Rc7jCznxb3sQxFynxwcf4iqfUn/WogqFvxTvzkSseTrsTjxKp2ZeNfx3QV4I/tT9MD
 MJabgNEWkMf2Pv4oseOSlmwCRJy5trEVRhH3T9T8LiTXUtynR/fw5FSO9/CV9+5V91TB
 CLulMqLp/uX1Qe3g9ytqbH0TJkS+E/5fw3NMXn5Cgt0b8/9Y2tyDiXugiEgd+MoW22tO
 wm74siHzBCTjCWNHuiKxyXN/hyEy+LReve3lz92qqimb46oHDkekqEnZtgpImOqVQamR
 lyNTBMWkfFGcI5VFufTPetiAtmXkozlyEeEzImmUmX6oDYl9VF8lmN3Y62mTYK7E8IdW
 e8og==
X-Gm-Message-State: APjAAAUA4OzNiJis6K8Ry3uAPYnwd2Gs9CF2ENAnDz9HjXLcCByW/+VQ
 cXq1SSMB/0zFeiIXxbcbdoJUzGZdtC4XuQsZ9xY=
X-Google-Smtp-Source: APXvYqzgbcKks95r2ftlQ3Nmq4VMn8TY3gLCWPw+ahSjTC2+ZU9zmvMIvbenJ3HbWTq94EutZ6iDMiOC4YtsFxn3dSU=
X-Received: by 2002:aca:62d5:: with SMTP id w204mr2204887oib.136.1571738039763; 
 Tue, 22 Oct 2019 02:53:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Tue, 22 Oct 2019 02:53:59
 -0700 (PDT)
In-Reply-To: <20191018134754.16362-4-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-4-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 22 Oct 2019 11:53:59 +0200
Message-ID: <CAL1e-=hOQqRj2_QA8LqWdsD9JM6t6YzoyxC1cEaMBhs1vmN8oA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 03/20] piix4: Add a i8259 Interrupt
 Controller as specified in datasheet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============7626563609378840543=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7626563609378840543==
Content-Type: multipart/alternative; boundary="0000000000008a47d105957cc71c"

--0000000000008a47d105957cc71c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Add ISA irqs as piix4 gpio in, and CPU interrupt request as piix4 gpio ou=
t.
> Remove i8259 instanciated in malta board, to not have it twice.
>
> We can also remove the now unused piix4_init() function.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-8-hpoussin@reactos.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> [PMD: rebased, updated includes, use ISA_NUM_IRQS in for loop]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c       | 43 ++++++++++++++++++++++++++++++++-----------
>  hw/mips/mips_malta.c | 32 +++++++++++++-------------------
>  include/hw/i386/pc.h |  1 -
>  3 files changed, 45 insertions(+), 31 deletions(-)
>
>

A detail: In the title:
Add a i8259  -> Add an i8259

A.


> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index d0b18e0586..9c37c85ae2 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -24,6 +24,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "hw/irq.h"
>  #include "hw/i386/pc.h"
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
> @@ -36,6 +37,8 @@ PCIDevice *piix4_dev;
>
>  typedef struct PIIX4State {
>      PCIDevice dev;
> +    qemu_irq cpu_intr;
> +    qemu_irq *isa;
>
>      /* Reset Control Register */
>      MemoryRegion rcr_mem;
> @@ -94,6 +97,18 @@ static const VMStateDescription vmstate_piix4 =3D {
>      }
>  };
>
> +static void piix4_request_i8259_irq(void *opaque, int irq, int level)
> +{
> +    PIIX4State *s =3D opaque;
> +    qemu_set_irq(s->cpu_intr, level);
> +}
> +
> +static void piix4_set_i8259_irq(void *opaque, int irq, int level)
> +{
> +    PIIX4State *s =3D opaque;
> +    qemu_set_irq(s->isa[irq], level);
> +}
> +
>  static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
>                              unsigned int len)
>  {
> @@ -127,29 +142,35 @@ static const MemoryRegionOps piix4_rcr_ops =3D {
>  static void piix4_realize(PCIDevice *dev, Error **errp)
>  {
>      PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
> +    ISABus *isa_bus;
> +    qemu_irq *i8259_out_irq;
>
> -    if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),
> -                     pci_address_space_io(dev), errp)) {
> +    isa_bus =3D isa_bus_new(DEVICE(dev), pci_address_space(dev),
> +                          pci_address_space_io(dev), errp);
> +    if (!isa_bus) {
>          return;
>      }
>
> +    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
> +                            "isa", ISA_NUM_IRQS);
> +    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
> +                             "intr", 1);
> +
>      memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
>                            "reset-control", 1);
>      memory_region_add_subregion_overlap(pci_address_space_io(dev), 0xcf9=
,
>                                          &s->rcr_mem, 1);
>
> +    /* initialize i8259 pic */
> +    i8259_out_irq =3D qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
> +    s->isa =3D i8259_init(isa_bus, *i8259_out_irq);
> +
> +    /* initialize ISA irqs */
> +    isa_bus_irqs(isa_bus, s->isa);
> +
>      piix4_dev =3D dev;
>  }
>
> -int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
> -{
> -    PCIDevice *d;
> -
> -    d =3D pci_create_simple_multifunction(bus, devfn, true, "PIIX4");
> -    *isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
> -    return d->devfn;
> -}
> -
>  static void piix4_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 4d9c64b36a..7d25ab6c23 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -97,7 +97,7 @@ typedef struct {
>      SysBusDevice parent_obj;
>
>      MIPSCPSState cps;
> -    qemu_irq *i8259;
> +    qemu_irq i8259[16];
>  } MaltaState;
>
>  static ISADevice *pit;
> @@ -1235,8 +1235,8 @@ void mips_malta_init(MachineState *machine)
>      int64_t kernel_entry, bootloader_run_addr;
>      PCIBus *pci_bus;
>      ISABus *isa_bus;
> -    qemu_irq *isa_irq;
>      qemu_irq cbus_irq, i8259_irq;
> +    PCIDevice *pci;
>      int piix4_devfn;
>      I2CBus *smbus;
>      DriveInfo *dinfo;
> @@ -1407,30 +1407,24 @@ void mips_malta_init(MachineState *machine)
>      /* Board ID =3D 0x420 (Malta Board with CoreLV) */
>      stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>
> -    /*
> -     * We have a circular dependency problem: pci_bus depends on isa_irq=
,
> -     * isa_irq is provided by i8259, i8259 depends on ISA, ISA depends
> -     * on piix4, and piix4 depends on pci_bus.  To stop the cycle we hav=
e
> -     * qemu_irq_proxy() adds an extra bit of indirection, allowing us
> -     * to resolve the isa_irq -> i8259 dependency after i8259 is
> initialized.
> -     */
> -    isa_irq =3D qemu_irq_proxy(&s->i8259, 16);
> -
>      /* Northbridge */
> -    pci_bus =3D gt64120_register(isa_irq);
> +    pci_bus =3D gt64120_register(s->i8259);
>
>      /* Southbridge */
>      ide_drive_get(hd, ARRAY_SIZE(hd));
>
> -    piix4_devfn =3D piix4_init(pci_bus, &isa_bus, 80);
> +    pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> +                                          true, "PIIX4");
> +    dev =3D DEVICE(pci);
> +    isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> +    piix4_devfn =3D pci->devfn;
>
> -    /*
> -     * Interrupt controller
> -     * The 8259 is attached to the MIPS CPU INT0 pin, ie interrupt 2
> -     */
> -    s->i8259 =3D i8259_init(isa_bus, i8259_irq);
> +    /* Interrupt controller */
> +    qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> +    for (int i =3D 0; i < ISA_NUM_IRQS; i++) {
> +        s->i8259[i] =3D qdev_get_gpio_in_named(dev, "isa", i);
> +    }
>
> -    isa_bus_irqs(isa_bus, s->i8259);
>      pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);
>      pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
>      smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 37bfd95113..374f3e8835 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -286,7 +286,6 @@ PCIBus *i440fx_init(const char *host_type, const char
> *pci_type,
>  PCIBus *find_i440fx(void);
>  /* piix4.c */
>  extern PCIDevice *piix4_dev;
> -int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);
>
>  /* pc_sysfw.c */
>  void pc_system_flash_create(PCMachineState *pcms);
> --
> 2.21.0
>
>
>

--0000000000008a47d105957cc71c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, October 18, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hp=
oussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
Add ISA irqs as piix4 gpio in, and CPU interrupt request as piix4 gpio out.=
<br>
Remove i8259 instanciated in malta board, to not have it twice.<br>
<br>
We can also remove the now unused piix4_init() function.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-8-hpoussin@reactos.o=
rg">20171216090228.28505-8-hpoussin@reactos.org</a>&gt;<br>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om">amarkovic@wavecomp.com</a>&gt;<br>
[PMD: rebased, updated includes, use ISA_NUM_IRQS in for loop]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 +++++++++++++++++++++++=
+++++++<wbr>++-----------<br>
=C2=A0hw/mips/mips_malta.c | 32 +++++++++++++-----------------<wbr>--<br>
=C2=A0include/hw/i386/pc.h |=C2=A0 1 -<br>
=C2=A03 files changed, 45 insertions(+), 31 deletions(-)<br>
<br></blockquote><div><br></div><div><br></div><div>A detail: In the title:=
=C2=A0</div><div><span style=3D"color:rgb(34,34,34);font-family:HelveticaNe=
ue-Light,&#39;Helvetica Neue Light&#39;,&#39;Helvetica Neue&#39;,Helvetica,=
Arial,sans-serif;font-size:14px;line-height:22.1200008392334px;background-c=
olor:rgb(241,241,241)">Add a i8259</span><span style=3D"color:rgb(34,34,34)=
;font-family:HelveticaNeue-Light,&#39;Helvetica Neue Light&#39;,&#39;Helvet=
ica Neue&#39;,Helvetica,Arial,sans-serif;font-size:14px;line-height:22.1200=
008392334px;background-color:rgb(241,241,241)">=C2=A0 -&gt; Add an i8259</s=
pan></div><div><br></div><div>A.</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index d0b18e0586..9c37c85ae2 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -24,6 +24,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/i386/pc.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
@@ -36,6 +37,8 @@ PCIDevice *piix4_dev;<br>
<br>
=C2=A0typedef struct PIIX4State {<br>
=C2=A0 =C2=A0 =C2=A0PCIDevice dev;<br>
+=C2=A0 =C2=A0 qemu_irq cpu_intr;<br>
+=C2=A0 =C2=A0 qemu_irq *isa;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Reset Control Register */<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion rcr_mem;<br>
@@ -94,6 +97,18 @@ static const VMStateDescription vmstate_piix4 =3D {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
+static void piix4_request_i8259_irq(void *opaque, int irq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;cpu_intr, level);<br>
+}<br>
+<br>
+static void piix4_set_i8259_irq(void *opaque, int irq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D opaque;<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;isa[irq], level);<br>
+}<br>
+<br>
=C2=A0static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int len)<br>
=C2=A0{<br>
@@ -127,29 +142,35 @@ static const MemoryRegionOps piix4_rcr_ops =3D {<br>
=C2=A0static void piix4_realize(PCIDevice *dev, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);<br>
+=C2=A0 =C2=A0 ISABus *isa_bus;<br>
+=C2=A0 =C2=A0 qemu_irq *i8259_out_irq;<br>
<br>
-=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(dev), pci_address_space(dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci_address_space_io(dev), errp)) {<br>
+=C2=A0 =C2=A0 isa_bus =3D isa_bus_new(DEVICE(dev), pci_address_space(dev),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 pci_address_space_io(dev), errp);<br>
+=C2=A0 =C2=A0 if (!isa_bus) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 qdev_init_gpio_in_named(<wbr>DEVICE(dev), piix4_set_i8259_ir=
q,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isa&quot;, ISA_NUM_IRQS);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_out_named(<wbr>DEVICE(dev), &amp;s-&gt;cpu_in=
tr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;intr&quot;, 1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;rcr_<wbr>mem, OBJECT(d=
ev), &amp;piix4_rcr_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;reset-control&quot;, 1);<br>
=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion_<wbr>overlap(pci_address_sp=
ace_io(<wbr>dev), 0xcf9,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;s-&gt;rcr_mem, 1);<br>
<br>
+=C2=A0 =C2=A0 /* initialize i8259 pic */<br>
+=C2=A0 =C2=A0 i8259_out_irq =3D qemu_allocate_irqs(piix4_<wbr>request_i825=
9_irq, s, 1);<br>
+=C2=A0 =C2=A0 s-&gt;isa =3D i8259_init(isa_bus, *i8259_out_irq);<br>
+<br>
+=C2=A0 =C2=A0 /* initialize ISA irqs */<br>
+=C2=A0 =C2=A0 isa_bus_irqs(isa_bus, s-&gt;isa);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0piix4_dev =3D dev;<br>
=C2=A0}<br>
<br>
-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)<br>
-{<br>
-=C2=A0 =C2=A0 PCIDevice *d;<br>
-<br>
-=C2=A0 =C2=A0 d =3D pci_create_simple_<wbr>multifunction(bus, devfn, true,=
 &quot;PIIX4&quot;);<br>
-=C2=A0 =C2=A0 *isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>DEVICE(d), &quo=
t;isa.0&quot;));<br>
-=C2=A0 =C2=A0 return d-&gt;devfn;<br>
-}<br>
-<br>
=C2=A0static void piix4_class_init(ObjectClass *klass, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 4d9c64b36a..7d25ab6c23 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -97,7 +97,7 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice parent_obj;<br>
<br>
=C2=A0 =C2=A0 =C2=A0MIPSCPSState cps;<br>
-=C2=A0 =C2=A0 qemu_irq *i8259;<br>
+=C2=A0 =C2=A0 qemu_irq i8259[16];<br>
=C2=A0} MaltaState;<br>
<br>
=C2=A0static ISADevice *pit;<br>
@@ -1235,8 +1235,8 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0int64_t kernel_entry, bootloader_run_addr;<br>
=C2=A0 =C2=A0 =C2=A0PCIBus *pci_bus;<br>
=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
-=C2=A0 =C2=A0 qemu_irq *isa_irq;<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq cbus_irq, i8259_irq;<br>
+=C2=A0 =C2=A0 PCIDevice *pci;<br>
=C2=A0 =C2=A0 =C2=A0int piix4_devfn;<br>
=C2=A0 =C2=A0 =C2=A0I2CBus *smbus;<br>
=C2=A0 =C2=A0 =C2=A0DriveInfo *dinfo;<br>
@@ -1407,30 +1407,24 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0/* Board ID =3D 0x420 (Malta Board with CoreLV) */<br>
=C2=A0 =C2=A0 =C2=A0stl_p(memory_region_get_ram_<wbr>ptr(bios_copy) + 0x10,=
 0x00000420);<br>
<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* We have a circular dependency problem: pci_bus depen=
ds on isa_irq,<br>
-=C2=A0 =C2=A0 =C2=A0* isa_irq is provided by i8259, i8259 depends on ISA, =
ISA depends<br>
-=C2=A0 =C2=A0 =C2=A0* on piix4, and piix4 depends on pci_bus.=C2=A0 To sto=
p the cycle we have<br>
-=C2=A0 =C2=A0 =C2=A0* qemu_irq_proxy() adds an extra bit of indirection, a=
llowing us<br>
-=C2=A0 =C2=A0 =C2=A0* to resolve the isa_irq -&gt; i8259 dependency after =
i8259 is initialized.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 isa_irq =3D qemu_irq_proxy(&amp;s-&gt;i8259, 16);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* Northbridge */<br>
-=C2=A0 =C2=A0 pci_bus =3D gt64120_register(isa_irq);<br>
+=C2=A0 =C2=A0 pci_bus =3D gt64120_register(s-&gt;i8259);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Southbridge */<br>
=C2=A0 =C2=A0 =C2=A0ide_drive_get(hd, ARRAY_SIZE(hd));<br>
<br>
-=C2=A0 =C2=A0 piix4_devfn =3D piix4_init(pci_bus, &amp;isa_bus, 80);<br>
+=C2=A0 =C2=A0 pci =3D pci_create_simple_<wbr>multifunction(pci_bus, PCI_DE=
VFN(10, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, &quot;PIIX4&quot;);<br>
+=C2=A0 =C2=A0 dev =3D DEVICE(pci);<br>
+=C2=A0 =C2=A0 isa_bus =3D ISA_BUS(qdev_get_child_bus(<wbr>dev, &quot;isa.0=
&quot;));<br>
+=C2=A0 =C2=A0 piix4_devfn =3D pci-&gt;devfn;<br>
<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* Interrupt controller<br>
-=C2=A0 =C2=A0 =C2=A0* The 8259 is attached to the MIPS CPU INT0 pin, ie in=
terrupt 2<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 s-&gt;i8259 =3D i8259_init(isa_bus, i8259_irq);<br>
+=C2=A0 =C2=A0 /* Interrupt controller */<br>
+=C2=A0 =C2=A0 qdev_connect_gpio_out_named(<wbr>dev, &quot;intr&quot;, 0, i=
8259_irq);<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; ISA_NUM_IRQS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;i8259[i] =3D qdev_get_gpio_in_named(dev,=
 &quot;isa&quot;, i);<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 isa_bus_irqs(isa_bus, s-&gt;i8259);<br>
=C2=A0 =C2=A0 =C2=A0pci_piix4_ide_init(pci_bus, hd, piix4_devfn + 1);<br>
=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, piix4_devfn + 2, &quot;piix4=
-usb-uhci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x110=
0,<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index 37bfd95113..374f3e8835 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -286,7 +286,6 @@ PCIBus *i440fx_init(const char *host_type, const char *=
pci_type,<br>
=C2=A0PCIBus *find_i440fx(void);<br>
=C2=A0/* piix4.c */<br>
=C2=A0extern PCIDevice *piix4_dev;<br>
-int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn);<br>
<br>
=C2=A0/* pc_sysfw.c */<br>
=C2=A0void pc_system_flash_create(<wbr>PCMachineState *pcms);<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000008a47d105957cc71c--


--===============7626563609378840543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7626563609378840543==--

