Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50EDB05F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 16:47:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL6zt-00062N-NF; Thu, 17 Oct 2019 14:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL6zs-00062H-Ri
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 14:43:24 +0000
X-Inumbo-ID: 78abfda6-f0ec-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78abfda6-f0ec-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 14:43:24 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k10so62992oij.5
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jhYyEoWc80v0cXKGF4xnB9nyWjXKx6TF8OV3aNOz9qI=;
 b=pUPOVrw+uusHp27rflzA/hwpUQ4nyQOIuu+7hJBv1ozgYVT3LUp9eJvfJ7puokj39i
 NrMsKOYfzUqfSpqTiFwJ1uovuGPjmCCeXjNR74dOHYQAnM488wZXFDFwJwzhhIhMg9r6
 r7j5PWpfwUS0Nf1e4wq/C4OnyUxjzCrUq1JycK8nESIiRWE14kNUSTHO0QdiMoP4oCdW
 0ekvxn5L1tujnescqsNjU1gkQtoX8K1BtkfqUukvS4dOxKfm3FPNxcJC0MozSRiLtbgW
 V1fdoZMesK6suEzuqWXT+bIDBZX+jyPMRvF5bfhL5GscSvso+HdeA/uIDVzEsjubmc/d
 P+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jhYyEoWc80v0cXKGF4xnB9nyWjXKx6TF8OV3aNOz9qI=;
 b=fn2QWJQ+OTzjGjMNVixtZrnnQ/rr76rzWzZXDGWivYhapWg3EL9rvT/0ZyZ8FoOLzK
 D2CrBx34GpbkfReBI+sQc+1r55OQkBsZUeCMGH98cMoE/DnKxFG2VIUcwQ4YW/vMCxEY
 Jn/dyaxMoPM08HeyKN/lSL3Hc96uZyPRPRm+uG2doQQcq5MXWgnadh7KSvRzkh/emufU
 +1h2E2inz9RHOf1mX9SIVe8UUVFFBdhWEyi58u+TAq/rg/wmDYRYYLIq82kPH1Y/5pmr
 K83NEIAuLOndmtA38SO9rAnhs3XUhF3BeK1aRvcuEwMeyJB7S0GRWAPk3a/TkDxuAgEO
 WInA==
X-Gm-Message-State: APjAAAUK+diSpd9xBlFW+8Xzbylyhr5YLG931NnW4pkaqyHSlH6/v/JD
 HqvQmoWInJp+vwA4AgUnkSWHa0UYkrggdE9wRgI=
X-Google-Smtp-Source: APXvYqzberLXObt7P5i4KFNdsg+8EHVGx5o7pI5lJzjmTtciE0umi9YhsRZ9hqL1fxPkFCHs9Z/RziecnQmSI+PmC74=
X-Received: by 2002:aca:4e56:: with SMTP id c83mr3556181oib.53.1571323403635; 
 Thu, 17 Oct 2019 07:43:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 07:43:22
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-16-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-16-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 16:43:22 +0200
Message-ID: <CAL1e-=jA5Cc--eRrNoSUwnZbKtOzjzN9_XQewanfwaUk10HpYA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 15/32] piix4: add a i8254 pit controller as
 specified in datasheet
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
Content-Type: multipart/mixed; boundary="===============7434308053633341344=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7434308053633341344==
Content-Type: multipart/alternative; boundary="0000000000004d11f705951c3d8b"

--0000000000004d11f705951c3d8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Remove i8254 instanciated in malta board, to not have it twice.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-10-hpoussin@reactos.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c       | 4 ++++
>  hw/mips/mips_malta.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>



> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 1bc91b590c..0b0a0ecab1 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -30,6 +30,7 @@
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
>  #include "hw/dma/i8257.h"
> +#include "hw/timer/i8254.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -165,6 +166,9 @@ static void piix4_realize(PCIDevice *pci_dev, Error
> **errp)
>      /* initialize ISA irqs */
>      isa_bus_irqs(isa_bus, s->isa);
>
> +    /* initialize pit */
> +    i8254_pit_init(isa_bus, 0x40, 0, NULL);
> +
>      /* DMA */
>      i8257_dma_init(isa_bus, 0);
>
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index df247177ca..16d7a0e785 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -45,7 +45,6 @@
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "hw/timer/mc146818rtc.h"
> -#include "hw/timer/i8254.h"
>  #include "exec/address-spaces.h"
>  #include "hw/sysbus.h"             /* SysBusDevice */
>  #include "qemu/host-utils.h"
> @@ -99,8 +98,6 @@ typedef struct {
>      qemu_irq i8259[16];
>  } MaltaState;
>
> -static ISADevice *pit;
> -
>  static struct _loaderparams {
>      int ram_size, ram_low_size;
>      const char *kernel_filename;
> @@ -1428,7 +1425,6 @@ void mips_malta_init(MachineState *machine)
>      pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
>      smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
>                            isa_get_irq(NULL, 9), NULL, 0, NULL);
> -    pit =3D i8254_pit_init(isa_bus, 0x40, 0, NULL);
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>
>      /* generate SPD EEPROM data */
> --
> 2.21.0
>
>
>

--0000000000004d11f705951c3d8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
Remove i8254 instanciated in malta board, to not have it twice.<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-10-hpoussin@reactos.=
org">20171216090228.28505-10-hpoussin@reactos.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0hw/mips/mips_malta.c | 4 ----<br>
=C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
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
index 1bc91b590c..0b0a0ecab1 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -30,6 +30,7 @@<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/dma/i8257.h&quot;<br>
+#include &quot;hw/timer/i8254.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;sysemu/reset.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
@@ -165,6 +166,9 @@ static void piix4_realize(PCIDevice *pci_dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0/* initialize ISA irqs */<br>
=C2=A0 =C2=A0 =C2=A0isa_bus_irqs(isa_bus, s-&gt;isa);<br>
<br>
+=C2=A0 =C2=A0 /* initialize pit */<br>
+=C2=A0 =C2=A0 i8254_pit_init(isa_bus, 0x40, 0, NULL);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* DMA */<br>
=C2=A0 =C2=A0 =C2=A0i8257_dma_init(isa_bus, 0);<br>
<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index df247177ca..16d7a0e785 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -45,7 +45,6 @@<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;hw/timer/mc146818rtc.h&quot;<br>
-#include &quot;hw/timer/i8254.h&quot;<br>
=C2=A0#include &quot;exec/address-spaces.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* SysBusDevice */<br>
=C2=A0#include &quot;qemu/host-utils.h&quot;<br>
@@ -99,8 +98,6 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq i8259[16];<br>
=C2=A0} MaltaState;<br>
<br>
-static ISADevice *pit;<br>
-<br>
=C2=A0static struct _loaderparams {<br>
=C2=A0 =C2=A0 =C2=A0int ram_size, ram_low_size;<br>
=C2=A0 =C2=A0 =C2=A0const char *kernel_filename;<br>
@@ -1428,7 +1425,6 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, piix4_devfn + 2, &quot;piix4=
-usb-uhci&quot;);<br>
=C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x110=
0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0isa_get_irq(NULL, 9), NULL, 0, NULL);<br>
-=C2=A0 =C2=A0 pit =3D i8254_pit_init(isa_bus, 0x40, 0, NULL);<br>
=C2=A0 =C2=A0 =C2=A0mc146818_rtc_init(isa_bus, 2000, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* generate SPD EEPROM data */<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000004d11f705951c3d8b--


--===============7434308053633341344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7434308053633341344==--

