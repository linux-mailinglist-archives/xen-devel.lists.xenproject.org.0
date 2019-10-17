Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A545DDB0B3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:05:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7If-0008WB-8X; Thu, 17 Oct 2019 15:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihif=YK=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iL7Id-0008W0-9i
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:02:47 +0000
X-Inumbo-ID: 2d8fa662-f0ef-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d8fa662-f0ef-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 15:02:46 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w6so2398114oie.11
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2019 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2rOcTm1sqKA59B8RWKLJWb/9GvZdB5Zwo6ax6qEP27s=;
 b=Pa0YsQ5VgdFErvtGZD/AyXdh7bsdfMYIjABclSqWwEk0O3WL/cWoChtmitFqpIgUFW
 hLYc/SK1+D8edM1itN0psvO44Q91x4VbvmrobHETzpDEpQ7sjGkdPIkAUbzWecbKrdFB
 9+gsLGNHJsNzJ4vTAeiZhQk0z4L5WS4isgTqlq8EKEG5OIYIfcn8ubNk7S3GGlNel74i
 lFh+nvVAc0zN2UhLmx5diiY0LPChTE9VYSLA9h2oDAwQjyxlL/LGBqScGaON5LD/ovS0
 FKqw4jEOmN/bKos2S+Ud+Cu3boNuYwLt6D4y1LDYrIz5Z000DWFWlkFKqIQN4pH0Z/Ql
 tZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2rOcTm1sqKA59B8RWKLJWb/9GvZdB5Zwo6ax6qEP27s=;
 b=NO9ojvHnbqtdloWRedFtgSooJcoHz4bZzN4wDH/KN+Jiw+Rb414nk3l2eU1nzNNuVG
 QYGlzc21Fs6sbj7RhFI7Mva/49WJs+nyij0Mb2U3S3k/sY6xNlGtjEIx3e+KFL1AY0II
 W2RG0a5F8sjDxU2Bp4YCVzk6wlMQoHJ54Gy4nLVpXj/S48PsQ3WQGI+kZtzQGq+tCgT/
 SLDfVI1hvCc4U8U2m28d06DHHAFyMR3EuBuUGbH1ZTw0c/su1L1rjoDFTFCQptDAwg5X
 ROARHzbwBYk/FpmtCDozMNPqK8W44XPQ4Se02/nqB3DV44sYIPPJZ4IVQ4yAmPDkd+TJ
 QzmQ==
X-Gm-Message-State: APjAAAWMWpQWPzOFPHldOjHfKMtKF0B05A61OoioJ7mkwF0KVMS07dob
 t9AyIDhEINBcXswEJwGMIMzDbvxiroIfLYBC7M4=
X-Google-Smtp-Source: APXvYqyVxk8RcMbzJ7z6I6VLl7CGsWoVXOirTUKBF16CjXjOWggjLG4/TsvWqmsCquRG/zn1zJmj9uYRO1Stg3kL9vM=
X-Received: by 2002:a54:460c:: with SMTP id p12mr3655091oip.62.1571324566072; 
 Thu, 17 Oct 2019 08:02:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Thu, 17 Oct 2019 08:02:44
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-9-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-9-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 17 Oct 2019 17:02:44 +0200
Message-ID: <CAL1e-=i89vA3T2hKSWsg_FkQdJfOAKvi7pGE-o56HxTz-URCXQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 08/32] piix4: rename some variables in
 realize function
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
Content-Type: multipart/mixed; boundary="===============7236947260783133609=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7236947260783133609==
Content-Type: multipart/alternative; boundary="00000000000096802905951c8296"

--00000000000096802905951c8296
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> PIIX4 structure is now 's'
> PCI device is now 'pci_dev'
> DeviceState is now 'dev'
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-6-hpoussin@reactos.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/isa/piix4.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>


> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 3294056cd5..4202243e41 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -88,16 +88,17 @@ static const VMStateDescription vmstate_piix4 =3D {
>      }
>  };
>
> -static void piix4_realize(PCIDevice *dev, Error **errp)
> +static void piix4_realize(PCIDevice *pci_dev, Error **errp)
>  {
> -    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
> +    DeviceState *dev =3D DEVICE(pci_dev);
> +    PIIX4State *s =3D DO_UPCAST(PIIX4State, dev, pci_dev);
>
> -    if (!isa_bus_new(DEVICE(d), pci_address_space(dev),
> -                     pci_address_space_io(dev), errp)) {
> +    if (!isa_bus_new(dev, pci_address_space(pci_dev),
> +                     pci_address_space_io(pci_dev), errp)) {
>          return;
>      }
> -    piix4_dev =3D &d->dev;
> -    qemu_register_reset(piix4_reset, d);
> +    piix4_dev =3D pci_dev;
> +    qemu_register_reset(piix4_reset, s);
>  }
>
>  int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
> --
> 2.21.0
>
>
>

--00000000000096802905951c8296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:h=
poussin@reactos.org">hpoussin@reactos.org</a>&gt;<br>
<br>
PIIX4 structure is now &#39;s&#39;<br>
PCI device is now &#39;pci_dev&#39;<br>
DeviceState is now &#39;dev&#39;<br>
<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redh=
at.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini=
@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-6-hpoussin@reactos.o=
rg">20171216090228.28505-6-hpoussin@reactos.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/isa/piix4.c | 13 +++++++------<br>
=C2=A01 file changed, 7 insertions(+), 6 deletions(-)<br>
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
=3D"V j td"></div></div></div></div></div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 3294056cd5..4202243e41 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -88,16 +88,17 @@ static const VMStateDescription vmstate_piix4 =3D {<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0};<br>
<br>
-static void piix4_realize(PCIDevice *dev, Error **errp)<br>
+static void piix4_realize(PCIDevice *pci_dev, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(pci_dev);<br>
+=C2=A0 =C2=A0 PIIX4State *s =3D DO_UPCAST(PIIX4State, dev, pci_dev);<br>
<br>
-=C2=A0 =C2=A0 if (!isa_bus_new(DEVICE(d), pci_address_space(dev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci_address_space_io(dev), errp)) {<br>
+=C2=A0 =C2=A0 if (!isa_bus_new(dev, pci_address_space(pci_dev),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pci_address_space_io(pci_dev), errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 piix4_dev =3D &amp;d-&gt;dev;<br>
-=C2=A0 =C2=A0 qemu_register_reset(piix4_<wbr>reset, d);<br>
+=C2=A0 =C2=A0 piix4_dev =3D pci_dev;<br>
+=C2=A0 =C2=A0 qemu_register_reset(piix4_<wbr>reset, s);<br>
=C2=A0}<br>
<br>
=C2=A0int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--00000000000096802905951c8296--


--===============7236947260783133609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7236947260783133609==--

