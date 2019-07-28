Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EFE780DA
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2019 20:09:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrnYr-0004S2-4k; Sun, 28 Jul 2019 18:06:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=987i=VZ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hrnYp-0004Rx-UM
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2019 18:06:20 +0000
X-Inumbo-ID: 6549b4a0-b162-11e9-8980-bc764e045a96
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6549b4a0-b162-11e9-8980-bc764e045a96;
 Sun, 28 Jul 2019 18:06:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C10C1DBD;
 Sun, 28 Jul 2019 14:06:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 28 Jul 2019 14:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Wuh+r/
 apknyXeChjuNouckyB6vMRP+244QZYYcOsnlc=; b=wm99k6CR/Q7pt9kdCvdLey
 W/Zd5DFzUtxNhd3HX++suyBzz7TK2G0RL0mJVxzqWORxcoNWAl+nkwRp2ZPrggdC
 efeLioNTIdDu0vkrqnJTdRczhzg2bZRl7b/ZElpgAEGSwzK98cYlgyoXOXDyCzpq
 Op2JcVA1skR2DjpkAsEaXT3UXHsHNTriy7bXq0i5+HPhBD2mnynXOZuFM3JqktPy
 Uxl+pCEZ+f96B307DWmYV7hireznWPHSPS0tchWNI2UB5dnpgwLxaWr0++dWv14c
 DFXD7Ov6bd7XJphdbktpQc3ieyZm8MjGQjgSq3tcvZ1O1qHkip/AXSXrxmxj1PBQ
 ==
X-ME-Sender: <xms:GOQ9XYg31LapBor6tf4MObxmE89H-o2CUI8W0pgKiFx0KigB4lGJKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeelgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehgtd
 erredtreejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgv
 tghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
 hmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlh
 hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:GOQ9XSrcaLktICNydOWNWTRHHdUDgu7W2dZsDXFXaB0e6pw72zCe7A>
 <xmx:GOQ9XUJf7fCHDk0tnWornb7vSjPyJubEEiD74GEL-P75HnWZRvpTYg>
 <xmx:GOQ9XfuBkKs-3neqKbzaoBAgUYJndeiknA6EDwPHU_S6rQj0NyDlAA>
 <xmx:GeQ9XV5IMTOtxrd0_fuHDmmOYrrYsTGaD0IqCuSbnFGHMABzlWugFA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D197D80059;
 Sun, 28 Jul 2019 14:06:14 -0400 (EDT)
Date: Sun, 28 Jul 2019 20:06:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Message-ID: <20190728180611.GA20589@mail-itl>
References: <20190215024830.GA26477@jordon-HP-15-Notebook-PC>
MIME-Version: 1.0
In-Reply-To: <20190215024830.GA26477@jordon-HP-15-Notebook-PC>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v4 8/9] xen/gntdev.c: Convert to use
 vm_map_pages()
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
Cc: jgross@suse.com, mhocko@suse.com, linux@armlinux.org.uk,
 willy@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, akpm@linux-foundation.org,
 robin.murphy@arm.com, boris.ostrovsky@oracle.com
Content-Type: multipart/mixed; boundary="===============2818588475084645118=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2818588475084645118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 08:18:31AM +0530, Souptick Joarder wrote:
> Convert to use vm_map_pages() to map range of kernel
> memory to user vma.
>=20
> map->count is passed to vm_map_pages() and internal API
> verify map->count against count ( count =3D vma_pages(vma))
> for page array boundary overrun condition.

This commit breaks gntdev driver. If vma->vm_pgoff > 0, vm_map_pages
will:
 - use map->pages starting at vma->vm_pgoff instead of 0
 - verify map->count against vma_pages()+vma->vm_pgoff instead of just
   vma_pages().

In practice, this breaks using a single gntdev FD for mapping multiple
grants.

It looks like vm_map_pages() is not a good fit for this code and IMO it
should be reverted.

> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
>  drivers/xen/gntdev.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 5efc5ee..5d64262 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -1084,7 +1084,7 @@ static int gntdev_mmap(struct file *flip, struct vm=
_area_struct *vma)
>  	int index =3D vma->vm_pgoff;
>  	int count =3D vma_pages(vma);
>  	struct gntdev_grant_map *map;
> -	int i, err =3D -EINVAL;
> +	int err =3D -EINVAL;
> =20
>  	if ((vma->vm_flags & VM_WRITE) && !(vma->vm_flags & VM_SHARED))
>  		return -EINVAL;
> @@ -1145,12 +1145,9 @@ static int gntdev_mmap(struct file *flip, struct v=
m_area_struct *vma)
>  		goto out_put_map;
> =20
>  	if (!use_ptemod) {
> -		for (i =3D 0; i < count; i++) {
> -			err =3D vm_insert_page(vma, vma->vm_start + i*PAGE_SIZE,
> -				map->pages[i]);
> -			if (err)
> -				goto out_put_map;
> -		}
> +		err =3D vm_map_pages(vma, map->pages, map->count);
> +		if (err)
> +			goto out_put_map;
>  	} else {
>  #ifdef CONFIG_X86
>  		/*

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl095BIACgkQ24/THMrX
1yziIAf/exzcYKVSO+KS0CX9O2QdFSocXv52LbbEaeXP7AvIDXtfXcdbvxrkBwyA
dM4LYJgnMPbjYusQKNqWNDwi16zSJJgNfM0F4g+B4Ch2wkPXqCsobfHILsV8/x96
uYVr05q30FJ5goCzeMvQMNdPwDHv6+xGalM5Zhl56Xj+BGUQNmKo5sw2dAvarOM2
vdJUiQvbaZSBYSLZnufgbaEoZsXKQpDJftX7uM2gt6qmW3OwcEyhhGVI9loMCyJ5
jCWaVsXNj3EW/pZpwSX2nJgygQEp0C0x6xIZrG9rPNt/mZClap556QsmZzUkZDN7
92r6MMVJJLYyM0f880I5KEOKsIGNaQ==
=PmYG
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============2818588475084645118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2818588475084645118==--

