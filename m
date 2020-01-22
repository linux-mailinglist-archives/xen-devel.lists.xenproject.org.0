Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE0145C31
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 20:04:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuLG0-0007is-5j; Wed, 22 Jan 2020 19:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1mKO=3L=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iuLFy-0007if-0i
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 19:01:38 +0000
X-Inumbo-ID: 9d907cba-3d49-11ea-bd26-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d907cba-3d49-11ea-bd26-12813bfff9fa;
 Wed, 22 Jan 2020 19:01:37 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3980921F32;
 Wed, 22 Jan 2020 14:01:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 22 Jan 2020 14:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=d2SCTo
 SZ+AaILyV5qnSuvtP7+pT5cBDCjvL3lDjWHio=; b=gzWYM3gYuJUVg7BSTl1i/m
 M7OrKezm011qFFcguxOZokEp5CTD53QAJPnWXu3MvbIycBmX6GiT8I+QD4xVPKpm
 5pswJLHkFLsqESV1fAJyz6NU6RN05gOcUzzq0c8L4Wvozbb98AYRpNBMoEZ254H7
 s+fH7qRErbaRtP2HKTeqIbpwc1N612J/pGkyw47vSg/o0KLApo5iWwtZoHzqIf8J
 dE2kmrN4GpLLt+3KGojR2q5HH1MpQhxCDX84YGuzUiOt6KbWB0DFgJyE7lf5/5sH
 q5Q+CBOUklOT/t5QMJ/p/CnqjKXySS/kOaTh2VWSUwMS8TMzmZBxTl0RqogSiHbg
 ==
X-ME-Sender: <xms:EZwoXiJ5mGApElmCfOXsK4Jcg8QTjAVXFfMxy-hY67wGdKfqZwUfpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvddtgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
 khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
 eqnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
 hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:EZwoXnll8pe5VKdr8x4ZHET8HyfcAhRai99rOSaMl3C2ZEzeMPKscg>
 <xmx:EZwoXiqmPBH_634y6hTNIOZGrPcwO55ZSps8MltTq6lJZAQOXkBq9A>
 <xmx:EZwoXpAUGdmBYGXLHg-2SuU2PJ2Ur7pV4Sj8KmJw6OQnspSx4pVcJQ>
 <xmx:EZwoXhVHbHk7_xGJSm1K3XzLRgUPYRAJRSN45kjKQSKs6_4mUkDiRA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D89C328005E;
 Wed, 22 Jan 2020 14:01:36 -0500 (EST)
Date: Wed, 22 Jan 2020 20:01:33 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200122190133.GS2507@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1699773700.2581218.1579712175340@mail.yahoo.com>
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7834300344077687078=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7834300344077687078==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AonAANj1daC6QcQu"
Content-Disposition: inline


--AonAANj1daC6QcQu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] HVM Driver Domain

On Wed, Jan 22, 2020 at 04:56:15PM +0000, tosher 1 wrote:
> Hi Marek,
>=20
> Thanks for your response. The server machine I am using for this setup is=
 an x86_64 Intel Xeon. For the Dom0, I am using Ubuntu 18.04 running on ker=
nel version 5.0.0-37-generic. My Xen version is 4.9.2.=20
>=20
> For the HVM driver domain, I am using Ubuntu 18.04 running on kernel vers=
ion 5.0.0-23-generic. I am doing a NIC PCI passthrough to this domain. The =
Xen config file for this domain looks like the following.
>=20
> builder =3D "hvm"
> name =3D "ubuntu-doment-hvm"
> memory =3D "2048"
> pci =3D [ '01:00.0,permissive=3D1' ]
> vcpus =3D 1
> disk =3D ['phy:/dev/vg/ubuntu-hvm,hda,w']
> vnc =3D 1
> boot=3D"c"
>=20
> I have installed xen-tools of version 4.7 in this driver domain so that t=
he vif-scirpts work. The network configuration here looks like the followin=
g where ens5f0 is the interface name for the NIC I did passthrough.
>=20
> auto lo
> iface lo inet loopback
>=20
> iface ens5f0 inet manual
>=20
> auto xenbr1
> iface xenbr1 inet static
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge_ports ens5f0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address 192.168.1.3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 netmask 255.255.255.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gateway 192.168.1.1

Probably irrelevant at this stage, but do you have "xendriverdomain"
service running in the backend?

> The Xen config file content for the DomU is as the following.
>=20
> name =3D "ubuntu_on_ubuntu"
> bootloader =3D "/usr/lib/xen-4.9/bin/pygrub"
> memory =3D 1024
> vcpus =3D 1
> vif =3D [ 'backend=3Dubuntu-domnet-hvm,bridge=3Dxenbr1' ]
> disk =3D [ '/dev/vg/lv_vm_ubuntu_guest,raw,xvda,rw' ]
>=20
> When I try to launch this DomU, I get the following error.
>=20
> libxl: error: libxl_nic.c:652:libxl__device_nic_set_devids: Domain 31:Una=
ble to set nic defaults for nic 0.

I don't see what is wrong here. Are you sure the backend domain is
running?

> Are these configurations basically very different for what you do for Qub=
es? Please let me know your thoughts.

Looks similar, although we do that through libvirt.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--AonAANj1daC6QcQu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4onA0ACgkQ24/THMrX
1yz3hwf/VmeNCmqa/RcbMWj2A+3aH8UGlk92qBsKPNfBzTR06tjlYSPxa+E47uFs
lK7fYNHMzXS0zIHBC0hQf5/oQlGYlRNf/UViIfO4MIhMZ5u4DHpU50rcdkEm1c5a
SWMcxebwXuovkNH3gnJoVhU28aYgbbNa9bOrdwyzRm0Gq4hlRgaxuYJjxOpyPymF
FvektAxcTBx1ZcJXn+6eDT0p51/mJNYTf5byAinK6sDMPUFd2uiObkALV0OHYkvu
3Hp0c8YQei6FRvd4MENaVoc/oyIyyqRswrjvZIjw40OnxNXrOFcjtFuZoL6NMwNf
rxgM4TAOG4zH7W1/gDGsjsCnkBWLyA==
=K8bw
-----END PGP SIGNATURE-----

--AonAANj1daC6QcQu--


--===============7834300344077687078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7834300344077687078==--

