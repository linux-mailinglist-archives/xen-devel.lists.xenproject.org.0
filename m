Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78138DC0C5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 11:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLOQL-0007EP-Qh; Fri, 18 Oct 2019 09:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLOQK-0007EK-0N
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 09:19:52 +0000
X-Inumbo-ID: 6feaa8ba-f188-11e9-a531-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6feaa8ba-f188-11e9-a531-bc764e2007e4;
 Fri, 18 Oct 2019 09:19:50 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id i16so4646660oie.4
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6xWp8JokqlCmYuNnfUCWP07HkzfnyDZa9yiMopxBv4g=;
 b=az/4AmOAFyYinS9GlFG0Kyg/Rse9LgzIJzHPzkIKyB+djOVu+UGSGsp/SLB1tqiwzY
 mSGUBYm5jgD3TjZajvmtu5EEkezPvgjHypmN/8AeHjJ6xVuxIdD/wV2PAJP0PY3lZ+ra
 R1dezIxeA57UJR9ex/GLJWXEI0tsMAyWg0ZNrvOWsEEZeTvs1bBp1+bngmxyYc7yNtD9
 lLW12n3PNLRak9Dq8K+KtCadDhcQH7obqY/k4MNDf26yPDsZ9qNvruSOc/yUntvJWmXR
 3NTWW17lBuywa9rZVNquxwgZVdg+aGU5uyFhu0KlBhb4ONCvXm+U1FnvugBwfburkUfK
 s1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6xWp8JokqlCmYuNnfUCWP07HkzfnyDZa9yiMopxBv4g=;
 b=fGWLN4AWoS383o1gxHuWdQwyNHwjaI3NeDX5ZIr84ylzjqbxVxxtfejjtPVcMcNSWw
 Ejs+1c3oOeKi1BxPY9MNRYc15glj249cPxspCtkEvXgJtTmYS3E3qeoYfJtNoegvrZPk
 LN3ZG2tolAv03mxeQm396wiCQs8qrQS70MCTcKrVdF3ywzKscpRkFqVtZREaO1ldrS9E
 sVoCVI/TfKrBwRxUsYa/Jr3CqjcHedWjJAHUhA46UNphfmTF23XHrzXEBaKefAY3tPpe
 4eJ0GCd9Be/p6PvIRTxNLG1id/euzBkWnm50W48TM+hlFT33ZUYsPc3gAUaHzoArcKoq
 99Sg==
X-Gm-Message-State: APjAAAV19YWEBQLHTf5tmgI6eLL0cm2P2m20kKDL8regDiMF206niH+x
 rbvj6yfxXqYjxMsQuYWNSOZ6FP88hSG7SI4PlOk=
X-Google-Smtp-Source: APXvYqyKcmLWEDV/pLnQkOzYOKnqSZdTiZDBQXzxYaNQhitIL9i8hbCFZUuHkgl8L8FBzV09vXhPbQ4huxgNBINocS8=
X-Received: by 2002:a54:460c:: with SMTP id p12mr7170854oip.62.1571390390425; 
 Fri, 18 Oct 2019 02:19:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 02:19:50
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-27-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-27-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 11:19:50 +0200
Message-ID: <CAL1e-=jVr+idQKNdOGSrODeq7XU-0JcCFTwapqk9-JvAKxk6Pw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 26/32] hw/pci-host/piix: Move RCR_IOPORT
 register definition
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
Content-Type: multipart/mixed; boundary="===============9081550864404135444=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9081550864404135444==
Content-Type: multipart/alternative; boundary="000000000000065d3e05952bd6d8"

--000000000000065d3e05952bd6d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The RCR_IOPORT register belongs to the PIIX chipset.
> Move the definition to "piix.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/pci-host/piix.c            | 1 +
>  include/hw/i386/pc.h          | 6 ------
>  include/hw/southbridge/piix.h | 6 ++++++
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
>
Does it make sense to add prefix PIIX_ or a similar one to the register
name?

In any case:

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 3292703de7..3770575c1a 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -27,6 +27,7 @@
>  #include "hw/irq.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> +#include "hw/southbridge/piix.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/isa/isa.h"
>  #include "hw/sysbus.h"
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 183326d9fe..1c20b96571 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -257,12 +257,6 @@ typedef struct PCII440FXState PCII440FXState;
>
>  #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>
> -/*
> - * Reset Control Register: PCI-accessible ISA-Compatible Register at
> address
> - * 0xcf9, provided by the PCI/ISA bridge (PIIX3 PCI function 0,
> 8086:7000).
> - */
> -#define RCR_IOPORT 0xcf9
> -
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      PCII440FXState **pi440fx_state, int *piix_devfn,
>                      ISABus **isa_bus, qemu_irq *pic,
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.=
h
> index add352456b..79ebe0089b 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -18,6 +18,12 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t
> smb_io_base,
>                        qemu_irq sci_irq, qemu_irq smi_irq,
>                        int smm_enabled, DeviceState **piix4_pm);
>
> +/*
> + * Reset Control Register: PCI-accessible ISA-Compatible Register at
> address
> + * 0xcf9, provided by the PCI/ISA bridge (PIIX3 PCI function 0,
> 8086:7000).
> + */
> +#define RCR_IOPORT 0xcf9
> +
>  extern PCIDevice *piix4_dev;
>
>  DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,
> --
> 2.21.0
>
>
>

--000000000000065d3e05952bd6d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
The RCR_IOPORT register belongs to the PIIX chipset.<br>
Move the definition to &quot;piix.h&quot;.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/pci-host/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0include/hw/i386/pc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ------<br>
=C2=A0include/hw/southbridge/piix.h | 6 ++++++<br>
=C2=A03 files changed, 7 insertions(+), 6 deletions(-)<br>
<br></blockquote><div><br></div><div>Does it make sense to add prefix PIIX_=
 or a similar one to the register name?</div><div><br></div><div>In any cas=
e:</div><div><br></div><div><span style=3D"color:rgb(34,34,34);font-size:14=
px;line-height:22.1200008392334px">Reviewed-by: Aleksandar Markovic &lt;</s=
pan><a href=3D"mailto:amarkovic@wavecomp.com" target=3D"_blank" style=3D"fo=
nt-size:14px;line-height:22.1200008392334px">amarkovic@wavecomp.com</a><spa=
n style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334p=
x">&gt;</span></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c<br>
index 3292703de7..3770575c1a 100644<br>
--- a/hw/pci-host/piix.c<br>
+++ b/hw/pci-host/piix.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci.h&quot;<br>
=C2=A0#include &quot;hw/pci/pci_host.h&quot;<br>
+#include &quot;hw/southbridge/piix.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;hw/isa/isa.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
index 183326d9fe..1c20b96571 100644<br>
--- a/include/hw/i386/pc.h<br>
+++ b/include/hw/i386/pc.h<br>
@@ -257,12 +257,6 @@ typedef struct PCII440FXState PCII440FXState;<br>
<br>
=C2=A0#define TYPE_IGD_PASSTHROUGH_I440FX_<wbr>PCI_DEVICE &quot;igd-passthr=
ough-i440FX&quot;<br>
<br>
-/*<br>
- * Reset Control Register: PCI-accessible ISA-Compatible Register at addre=
ss<br>
- * 0xcf9, provided by the PCI/ISA bridge (PIIX3 PCI function 0, 8086:7000)=
.<br>
- */<br>
-#define RCR_IOPORT 0xcf9<br>
-<br>
=C2=A0PCIBus *i440fx_init(const char *host_type, const char *pci_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCII440FXState **pi440fx_state, int *piix_devfn,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ISABus **isa_bus, qemu_irq *pic,<br>
diff --git a/include/hw/southbridge/piix.<wbr>h b/include/hw/southbridge/pi=
ix.<wbr>h<br>
index add352456b..79ebe0089b 100644<br>
--- a/include/hw/southbridge/piix.<wbr>h<br>
+++ b/include/hw/southbridge/piix.<wbr>h<br>
@@ -18,6 +18,12 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t s=
mb_io_base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qemu_irq sci_irq, qemu_irq smi_irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int smm_enabled, DeviceState **piix4_pm);<br>
<br>
+/*<br>
+ * Reset Control Register: PCI-accessible ISA-Compatible Register at addre=
ss<br>
+ * 0xcf9, provided by the PCI/ISA bridge (PIIX3 PCI function 0, 8086:7000)=
.<br>
+ */<br>
+#define RCR_IOPORT 0xcf9<br>
+<br>
=C2=A0extern PCIDevice *piix4_dev;<br>
<br>
=C2=A0DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus,<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--000000000000065d3e05952bd6d8--


--===============9081550864404135444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9081550864404135444==--

