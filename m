Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F2A85FF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 17:14:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Wuo-0004zV-C7; Wed, 04 Sep 2019 15:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qwq=W7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1i5Wum-0004zO-LO
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 15:09:45 +0000
X-Inumbo-ID: 060ac7e2-cf26-11e9-b299-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 060ac7e2-cf26-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567609782;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=kJlfBXy4A4yREwXiSo3A2tBJYKDsjarPcfYIzLf7kvk=;
 b=rIpGNDemNYUD9MbsU1hYYpqErqFNpBEWgIraAdc6QYKOiAjJVBJkM/hWdLnKgnagZj
 Rs+LqgWphdjsMXlCXj4hYBvxeseCpdHCwfLfok0pjQnnJJxPa4tgQ9qIRkBX2rFY4u+6
 UUsYgMbQuQiXy1ZIUUMOzy4XaJOPv4ZS0TcPtaLL+tRNUMxWUOPf+12rQSDK8fy35x6X
 Fe8qmhVlSM+1Qs/Jp8PUjbhpTcnhohWiqWvaxuCVh56fjJVJbqELGZ02SQJf3DsT6csg
 LSTj3j0CLB4evmsIiVd7pDlJkn4fPOvdDR+qEnf4Gd/NJ8sOOfm3sYXorVvE9Gz2EfGx
 lEpA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYM5kyQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.27.0 SBL|AUTH)
 with ESMTPSA id x0a054v84F9KUgS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 4 Sep 2019 17:09:20 +0200 (CEST)
Date: Wed, 4 Sep 2019 17:09:13 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190904170913.7daca15d.olaf@aepfle.de>
In-Reply-To: <558d23b7-5cda-271f-0f9a-39b986ed3ae8@suse.com>
References: <20190904091423.23963-1-olaf@aepfle.de>
 <75fe87c1-2f21-b1c1-6589-36807e0b4aaa@citrix.com>
 <20190904113735.349609b4.olaf@aepfle.de>
 <cae6ee14-da0f-883c-148a-5556f26f4b12@suse.com>
 <20190904161324.68599b3c.olaf@aepfle.de>
 <558d23b7-5cda-271f-0f9a-39b986ed3ae8@suse.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] Remove stale crashkernel= example from
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============3497174304453898185=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3497174304453898185==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YGq_uS0UH_DPBl6ZYZHh_Np"; protocol="application/pgp-signature"

--Sig_/YGq_uS0UH_DPBl6ZYZHh_Np
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 4 Sep 2019 16:22:37 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> First of all - does "the code" here mean master/staging, or any
> release branch? And then, yes, on release branches there will be
> EINVAL, but as said before kexec_crash_area.size will get/remain
> set nevertheless (as the error path doesn't zap any of the
> earlier parsing outcome).

The code is anything since staging-4.10, in my case 4.11 and 4.12.
And yes, the side effect is setting the values.

I have tried a number of Xen/dom0/kexec-tools/crashkernel=3D combinations.
SLE12SP4 works, SLE15SP1 fails. I was looking for "crash kernel"
hints in xl dmesg, only much later I spotted the "KDump:" line.
The mentioned entries are not present in /proc/iomem.
All of that led to the conclusion that crashkernel=3Dsize does not work.

It turned out the tooling is not dom0 aware, it fails to translate
"console=3Dcom1 com1=3D57600"+"console=3Dhvc0" into "console=3DttyS0,57600"
for the kdump kernel. This is a common pattern of ignorance.

And finally the kdump kernel fails to initialize hardware due to
low memory and SWIOTBL? errors. Once drm.ko and usbcore.ko are=20
disabled, the first kdump ever was generated on this system.

> > With this change any unknown string will cause EINVAL. =20
> Which is what should happen for unknown (i.e. unsupported) strings,
> shouldn't it?

Yes.

Olaf

--Sig_/YGq_uS0UH_DPBl6ZYZHh_Np
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl1v05kACgkQ86SN7mm1
DoCcPw//f2EoLRfW1bLC/Dq24MUWST1aMIdXcJC7ueWoVOcBfG+Qfh/yhH30Z2cI
3QoX02bKQ6cOs8bN4OR+oRVTda3pDGMsB1SHKJZUqgBveGDU75hLtAG0ftgAkysN
twVOruvZVTAoW10nDIfz4DKZu8iv2FC4+MoBdUhq8J/ov7ebPMP26Tfk11C97Qux
+bs+dUIAJuNhQdPrniHeMo6L0lNpUMAX+L7j7KBXqXpKYD3FgpqQNQMkmhBGkOP/
2ibH+h/dvvolnqhFWpb5xTwCY4NaxyCt4AiNi2pWLoeUCXLzZvWtY/Uktqy4DTWo
eTc/OjsIqT2fjCjuUUSvOl89iwJHOtPXD0wMo0DIuR8/K2vrRjGRXvNPKeWqGnhn
nnezJ4In7WKqGP3uTUBBWSYIaMsiXiapMfvKdKy8Ampm0Ve7LklWQcj11IScfMAG
9/xi/n5ESiTJHy7RyO6JlBOOkXrIT3UY+msO+r/AeTsla1/o4C2fwSYOQ5bVQ69u
KqI4f7v0Yu0agXrtutxxXPkBgscGftL7E+YQFcnjZ09knB20QAXryyVQzKJTYF1z
HOETY32NGLaItixAe9AIcyyueVeNDh9LUuhjIN7Tq23hz9AmAYMUbftVA05RM46g
aBEABCRYU3PnDNtluy6mu4nE6fNMZZxWYRHQruuWWz3GGifVPE8=
=VnM1
-----END PGP SIGNATURE-----

--Sig_/YGq_uS0UH_DPBl6ZYZHh_Np--


--===============3497174304453898185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3497174304453898185==--

