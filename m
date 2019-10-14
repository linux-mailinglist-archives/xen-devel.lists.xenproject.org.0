Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453CED5FAA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 12:04:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJx9V-0002YH-52; Mon, 14 Oct 2019 10:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uk3Z=YH=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iJx9T-0002YB-Rc
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 10:00:31 +0000
X-Inumbo-ID: 73179c19-ee69-11e9-9377-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73179c19-ee69-11e9-9377-12813bfff9fa;
 Mon, 14 Oct 2019 10:00:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01915B744;
 Mon, 14 Oct 2019 10:00:27 +0000 (UTC)
Message-ID: <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Shawn Guo <shawnguo@kernel.org>
Date: Mon, 14 Oct 2019 12:00:25 +0200
In-Reply-To: <20191014082847.GH12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
 <20191014082847.GH12262@dragon>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/11] dts: arm64: layerscape: add
 dma-ranges property to qoric-mc node
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============6030874680697735718=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6030874680697735718==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZhF7YshJftYaREkjx+2D"


--=-ZhF7YshJftYaREkjx+2D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-14 at 16:28 +0800, Shawn Guo wrote:
> On Tue, Sep 24, 2019 at 08:12:38PM +0200, Nicolas Saenz Julienne wrote:
> > qoriq-mc's dpmacs DMA configuration is inherited from their parent node=
,
> > which acts a bus in this regard. So far it maked all devices as
> > dma-coherent but no dma-ranges recommendation is made.
> >=20
> > The truth is that the underlying interconnect has DMA constraints, so
> > add an empty dma-ranges in qoriq-mc's node in order for DT's DMA
> > configuration code to get the DMA constraints from it.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20
> Updated subject prefix as 'arm64: dts: ...', and applied the patch.

Hi Shawn,
these two patches are no longer needed. This series has been superseded by =
this
patch[1] 951d48855d ('of: Make of_dma_get_range() work on bus nodes', avail=
able
in linux-next) which fixed the issue directly in OF code.

Sorry for the noise.

Regards,
Nicolas

[1] https://lkml.org/lkml/2019/10/8/870


--=-ZhF7YshJftYaREkjx+2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2kRzkACgkQlfZmHno8
x/7Fhwf+OOorwS/yz7Mxwwgctc4wXslUVL4P1ubRvAEQYZ0UGUVtM1WJqXjukymn
ydYIWe6mnmNSQqGYAEBcjzP/We/MxjMkpvpyMWkiJXiZvwXRs43BAcW5/eyvHNfD
EEF3n4HCXZYSbmR9kDBwpZPKeoMCsQJbZuEF6rHwGNZeKA+tVpMZFEC17BGhW8LW
MGx2W+1mXq7lLuDI5AIfnMt5Cqgl1IcsCzq4a2uRzNLXEDiQ5MFXaHVzroE0wWOQ
O6GCM0HAcnR1wi0pZgEgDQyFQeiI4txKfLZ0P1z8zgVM+bFtNum4qIrtLbYm0Ny0
y7htdJL8WlxXRHkbLVXIj0D71OiRYQ==
=Ip4t
-----END PGP SIGNATURE-----

--=-ZhF7YshJftYaREkjx+2D--



--===============6030874680697735718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6030874680697735718==--


