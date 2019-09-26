Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C7BF002
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:47:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRGd-0002dg-Fn; Thu, 26 Sep 2019 10:44:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k+kJ=XV=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iDRGc-0002db-Js
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:44:58 +0000
X-Inumbo-ID: ae5d6618-e04a-11e9-964e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ae5d6618-e04a-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:44:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D89AAFA7;
 Thu, 26 Sep 2019 10:44:56 +0000 (UTC)
Message-ID: <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Date: Thu, 26 Sep 2019 12:44:53 +0200
In-Reply-To: <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org, "open
 list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============6833543815088923136=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6833543815088923136==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-spHfnjbbIi+e7UZn+wYh"


--=-spHfnjbbIi+e7UZn+wYh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > > Robin, have you looked into supporting multiple dma-ranges? It's th=
e
> > > > next thing
> > > > we need for BCM STB's PCIe. I'll have a go at it myself if nothing =
is in
> > > > the
> > > > works already.
> > >=20
> > > Multiple dma-ranges as far as configuring inbound windows should work
> > > already other than the bug when there's any parent translation. But i=
f
> > > you mean supporting multiple DMA offsets and masks per device in the
> > > DMA API, there's nothing in the works yet.

Sorry, I meant supporting multiple DMA offsets[1]. I think I could still ma=
ke
it with a single DMA mask though.

> > There's also the in-between step of making of_dma_get_range() return a
> > size based on all the dma-ranges entries rather than only the first one
> > - otherwise, something like [1] can lead to pretty unworkable default
> > masks. We implemented that when doing acpi_dma_get_range(), it's just
> > that the OF counterpart never caught up.
>=20
> Right. I suppose we assume any holes in the ranges are addressable by
> the device but won't get used for other reasons (such as no memory
> there). However, to be correct, the range of the dma offset plus mask
> would need to be within the min start and max end addresses. IOW,
> while we need to round up (0xa_8000_0000 - 0x2c1c_0000) to the next
> power of 2, the 'correct' thing to do is round down.

IIUC I also have this issue on my list. The RPi4 PCIe block has an integrat=
ion
bug that only allows DMA to the lower 3GB. With dma-ranges of size 0xc000_0=
000
you get a 32bit DMA mask wich is not what you need. So far I faked it in th=
e
device-tree but I guess it be better to add an extra check in
of_dma_configure(), decrease the mask and print some kind of warning statin=
g
that DMA addressing is suboptimal.

Regards,
Nicolas

[1] https://lkml.org/lkml/2018/9/19/641


--=-spHfnjbbIi+e7UZn+wYh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2MlqUACgkQlfZmHno8
x/6+gwgAlzKCB9vN8cCZUfRnnPT+EcYA2/s3oFjf1ar+/e5UsMfCNI5W7cJaKzg9
w0PGZ5VKk5N0wpkGIpUjOYQ9J5PFZwu5bqsce0zWywlRlYCexKvzpQfkplWi0JuI
cVAt9Sw5mle+ppW+x9T5UlBcHoCByuQDG9ga44Z7O4jrk/lIp7vK2fmSN3hIEcHV
gUPxojWighnxCu+5COgwa182Ncfo3tTLw39oV8uiLOzxXxVkprxdxQHakXPoyg1o
WH0OvR09u1lXZAQ1qKtOxHNgKcrNzpr69VBUL/WYvrSqKdg0EI8QRmkByk5cYgrC
ztco//83y3fCRh8dEph0BSrKU3/vFA==
=P2KB
-----END PGP SIGNATURE-----

--=-spHfnjbbIi+e7UZn+wYh--



--===============6833543815088923136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6833543815088923136==--


