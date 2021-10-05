Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762334227EB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 15:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202260.356966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXkXW-0001ps-NP; Tue, 05 Oct 2021 13:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202260.356966; Tue, 05 Oct 2021 13:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXkXW-0001mY-KH; Tue, 05 Oct 2021 13:31:26 +0000
Received: by outflank-mailman (input) for mailman id 202260;
 Tue, 05 Oct 2021 13:31:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KREk=OZ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mXkXU-0001mS-FU
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 13:31:24 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63476c89-b322-45e5-9025-cb584fd792b7;
 Tue, 05 Oct 2021 13:31:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AB285C026A;
 Tue,  5 Oct 2021 09:31:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 05 Oct 2021 09:31:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Oct 2021 09:31:22 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 63476c89-b322-45e5-9025-cb584fd792b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EivQqt
	+HIo/wojGUEcP7IuAFUMmltKJUbP1xgnBaQeU=; b=Ka1DWS4GDKhLKbThzTImqa
	nWFLSWeI1Gh/YvH08FjeDsr4LqwlVVUGKzbCRJLLA15tfNVbPnB1m6CCT4VSYFiG
	UXRGOgcG7EmXuyL02tXfIHa0rYFLrJuLVZl7xk29N08GG7lUUovHdWDrVZRhjOk+
	BRDZSSyPDulOASEIKRYaJklVweYjNIBWU0K5KG2YcHoDZDESs5zDPmAEtdaFMoqI
	kl2VP1YmYmsCwyq0aujTLO+1hMwaTyu4XFdCghRHoRv6noHNITyIRAY8yhXqrZDs
	/bFwu53R908FN0GXEW2NVyqSRYD/XMO7k/+rZnZkITPU3po41w/qlBUz1ReCsTNQ
	==
X-ME-Sender: <xms:q1NcYSgGo3j8j-yyTflY9TBS4Xh2aMmZVJP3WGJ1UuQWFCM7zzWJ0Q>
    <xme:q1NcYTCrx3nMF1V0KEoby3FuV2wDzz850nT6ZYi-CYdgM94hzr8a7YkxJURggPXKi
    Y_0RTE__xqIKA>
X-ME-Received: <xmr:q1NcYaFbcaVOcA_akfpPwwUpI074ragm8NJ-S87deb9s_BSXB4TBgl_2QoXPzzkBkWFomMUqSt-HjMzPq2X1S-HSm5fhT0Yk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:q1NcYbQV5qT4sNUfka_It223WyqTP1zP4K-r2PMfE-qZeEXK2e1KGA>
    <xmx:q1NcYfy5qkMs6UO_zzihGXQgXggsvPArM0SOpJqPogF_l3xKWuss5Q>
    <xmx:q1NcYZ40ALBb65Zax9A6-QI6eq56fzcdtvZc0tLj7LE8t10x4Ta6vA>
    <xmx:q1NcYdbrFyEHIRsi0G7mCovyA4F7c9XUG46AEnQTEp-Crcqez0dGvg>
Date: Tue, 5 Oct 2021 15:31:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150
Message-ID: <YVxTp9rWmxv0wYBl@mail-itl>
References: <YVk11h2l/u4GJNv0@mail-itl>
 <37c22c61-80be-fc48-18e6-2b1ee22cc765@suse.com>
 <YVrF65BAVsXTgRsd@mail-itl>
 <f707c956-6cdc-9b32-5f22-227e0f5a9f10@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TQOmFEmeMsC7xW5m"
Content-Disposition: inline
In-Reply-To: <f707c956-6cdc-9b32-5f22-227e0f5a9f10@suse.com>


--TQOmFEmeMsC7xW5m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 5 Oct 2021 15:31:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150

On Tue, Oct 05, 2021 at 10:05:39AM +0200, Juergen Gross wrote:
> On 04.10.21 11:14, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Oct 04, 2021 at 07:31:40AM +0200, Juergen Gross wrote:
> > > On 03.10.21 06:47, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > After updating a PVH domU to 5.4.150, I see xen-balloon thread using
> > > > 100% CPU (one thread).
> > > > This is a domain started with memory=3Dmaxmem=3D716800KiB (via libv=
irt). Then,
> > > > inside, I see:
> > > >=20
> > > > # cat /sys/devices/system/xen_memory/xen_memory0/target_kb
> > > > 716924
> > > > # cat /sys/devices/system/xen_memory/xen_memory0/info/current_kb
> > > > 716400
> > > >=20
> > > > Doing `cat info/current_kb > target_kb` "fixes" the issue. But stil=
l,
> > > > something is wrong - on earlier kernel (5.4.143 to be precise), it
> > > > wasn't spinning, with exactly the same values reported in sysfs. It
> > > > shouldn't run in circles if it can't get that much memory it wants.=
 I
> > > > strongly suspect "xen/balloon: use a kernel thread instead a workqu=
eue"
> > > > or related commit being responsible, but I haven't verified it.
> > >=20
> > > I think you are right. I need to handle the BP_ECANCELED case similar=
 to
> > > BP_EAGAIN in the kernel thread (wait until target size changes again).
> > >=20
> > > One further question: do you see any kernel message in the guest rela=
ted
> > > to the looping balloon thread?
> >=20
> > Nothing, only the usual "xen:balloon: Initialising balloon driver", and
> > nothing related to balloon after that.
>=20
> Could you try the attached patch, please? I've tested it briefly with
> PV and PVH guests.

Yes, it helps, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TQOmFEmeMsC7xW5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFcU6cACgkQ24/THMrX
1yxjTQf/aW3yKfiquu0qMc5bvmbmqXYSY8D57IP9xJ9/Ft2hciEkjWs5MgmgogWL
yr76bR1G3WIxZ2YT2lPg6JfBVPgPCkTgDVGW5fyPKcxAh0Fpk/3K0+a3c5zf3c06
iUlZ0zWFydpOayntOfYw1ZBlaHbIdZHvDDceYBv8NSLhoN7qcx12xbWcwKlA7uGh
Gs+Vj0MqlMrD52XeloXRQ51Wpr5rnxgyT9E0/NXFZWI6DOSnbDxVL2Npm60qm8BO
EZxfcyvmKgKNpm98CwoPveNja8tU90GuyHEmgJDRE8m6bPUIou15xmM/qBJlJ/Da
uWTW/W7xu3+fX46e4MPsqlqjf2Jx6A==
=CeFV
-----END PGP SIGNATURE-----

--TQOmFEmeMsC7xW5m--

