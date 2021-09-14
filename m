Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF140AC03
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 12:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186421.335146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ621-0006z3-60; Tue, 14 Sep 2021 10:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186421.335146; Tue, 14 Sep 2021 10:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ621-0006w7-34; Tue, 14 Sep 2021 10:51:17 +0000
Received: by outflank-mailman (input) for mailman id 186421;
 Tue, 14 Sep 2021 10:51:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6J8=OE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mQ620-0006w1-0t
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 10:51:16 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aec54248-1549-11ec-b415-12813bfff9fa;
 Tue, 14 Sep 2021 10:51:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C474A5C0069;
 Tue, 14 Sep 2021 06:51:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 14 Sep 2021 06:51:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 06:51:12 -0400 (EDT)
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
X-Inumbo-ID: aec54248-1549-11ec-b415-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K0U22i
	YdgaWPJNYzZWHJRK3jLpUaQw4t+41HSf01KMU=; b=Vf8j1Sqc4VqqlWcLbEaj6e
	OlwA80NMgML4FPQNtCOl/k0C8blxk68lpZv1yTNxoweFpLAU/oseEyGUTf+czHxL
	eTjLLJcmM6KYS/71/s4oBM+68gslak72kkYdGf5wyETyzlhsqPNiXkvYaCFHNUzV
	xyDcheXSCX5ysn7s9dz5kT2yoqhl90Hp+MEhhov0FfNdALacreTOolfgOlKE6LZo
	OJdnqLwCLint6ZF6L/8Ts8DOkbzQKt3AAA3wMds47X3zU5fPOg/wCDB4WeydkpCw
	28juCdhN4KsvgNzL4drJwQ1JAPG6RRu1QfljsuEa7xm1lypSGMfSgvfRI8nHWhYg
	==
X-ME-Sender: <xms:oX5AYf4LpqYIAaN3wt7fmbcNfrwpYbTvy_XA3HauBlY3xHzdkywQbQ>
    <xme:oX5AYU5rl709ozD3fsoxpy_wCKzjx_ouDHPqFA6OVm2Jdx4KWrPHUJNk2HHH13b1B
    AWK-2iAMVfzug>
X-ME-Received: <xmr:oX5AYWccKUsxHBLKxh_GF6lEdY945rsy5YalLh4p0BGrLLcwnjydmlA9L_atxbx48yIJsMtLpNuJ8HBnijve7aKx7FhLkUE1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeff
    hfetgeffueekleehhfetkeetgedttdfhiedvteekjedufffgudeiffefjeenucffohhmrg
    hinhepghhithhhuhgsuhhsvghrtghonhhtvghnthdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:oX5AYQIO3bVKwNtOVQk8behQdR2uoxB7Df4lMJvK-lFStIDadI9kmA>
    <xmx:oX5AYTKH0Os9gtQmhLFx-Yf3Dad1hZ8ekJ8iZckUXRSNinTnNxjvFw>
    <xmx:oX5AYZwYP0DhWEzJMmbA9CfR-VK1wA2a5SgJKy50oP8mpq2ss0jPuw>
    <xmx:on5AYb9sxvbsSbhut3PLLQWQP4lEzh3PMNnmu0x6iHffTfKP8MKaLw>
Date: Tue, 14 Sep 2021 12:51:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading
 related?)
Message-ID: <YUB+nbuIgI4vLilj@mail-itl>
References: <YT9I+Xs9wOPVCIVd@mail-itl>
 <923de2f5-3d33-4c02-acec-739fdaf2ae05@suse.com>
 <ed6b9999-7a7b-31db-9e88-efdeecefa45b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9IO9vSHELR/sHIWS"
Content-Disposition: inline
In-Reply-To: <ed6b9999-7a7b-31db-9e88-efdeecefa45b@suse.com>


--9IO9vSHELR/sHIWS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Sep 2021 12:51:09 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading
 related?)

On Tue, Sep 14, 2021 at 10:39:10AM +0200, Jan Beulich wrote:
> On 14.09.2021 09:14, Juergen Gross wrote:
> > On 13.09.21 14:50, Marek Marczykowski-G=C3=B3recki wrote:
> >> Hi,
> >>
> >> Since 5.13, the Xen (PV) dom0 crashes on boot, before even printing the
> >> kernel version.
> >> Test environment:
> >>   - Xen 4.14.2
> >>   - AMD Ryzen 5 4500U (reported also on AMD Ryzen 7 4750U)
> >>   - Linux 5.13.13, confirmed also on 5.14
> >>
> >> The crash happens only if the initramfs has earlycpio with microcode.
> >> I don't have a serial console, but I've got a photo with crash message
> >> (from Xen, Linux doesn't managed to print anything):
> >> https://user-images.githubusercontent.com/726704/133084966-5038f37e-00=
1b-4688-9f90-83d09be3dc2d.jpg
> >>
> >> Transcription of some of it:
> >>
> >>      mapping kernel into physical memory
> >>      about to get started
> >>      (XEN) Pagetable walk from ffffffff82810888:
> >>      (XEN)  L4[0x1ff] =3D 0000000332815067 0000000000002815
> >>      (XEN)  L3[0x1fe] =3D 0000000332816067 0000000000002816
> >>      (XEN)  L2[0x014] =3D 0000000334018067 0000000000004018
> >>      (XEN)  L1[0x010] =3D 0000000332810067 0000000000002810
> >>      (XEN) domain_crash_sync called from entry.S: fault at ffff82d0403=
3e790 x86_64/entry.S#domain_crash_page_fault
> >>      (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> >>      (XEN) ----[ Xen-4.14.2  x86_64  debug=3Dn  Not tainted ]----
> >>      (XEN) CPU:    0
> >>      (XEN) RIP:    e033:[<0000000000000000>]
> >=20
> > The domain's run state seems to be completely clobbered.
> >=20
> > Did you try to boot the kernel with "earlyprintk=3Dxen" to get some idea
> > how far it progressed?
>=20
> I guess without my "xen/x86: allow "earlyprintk=3Dxen" to work for PV Dom=
0"
> "earlyprintk=3Dxen" would need to be accompanied by "console=3Dxenboot". I
> have not tried whether this helps, this is merely a guess from having
> looked at the code relatively recently.

This boot was with "earlyprintk=3Dxen" already, but I didn't know
about "console=3Dxenboot".
Anyway, it seems it isn't relevant anymore.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9IO9vSHELR/sHIWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFAfp0ACgkQ24/THMrX
1yxj3QgAklzrVFkqulCCimAJBOIO9E4Yn5L9JXT1DXGQ0RH446/gqRWmYU7+Atu2
6r4ZLfsYMIJm0FCKt3DTHvqFr9rWxbb1dOq4HVhLsid3Yp0zJZM39uhRUxKPopG3
rgmE7V7A98pX4RQIw9FGiMiFmUryiAwvMgUI9afdQ1RF71gQwwE1pH8tDgsmMV86
Te2ubFkmYakwszLdT4buG8Bwpc6s+rDcOzgIyruIgYLY20wNHEZm71TjNwqWUr8h
h52671MMCj1/o9uTKPkiqHDSR6EUIwphTyDzKoAMCI5IdND+iIvSmjwqFj8idnNP
ifatm5BSF9Knqy82Gt8CLJnTbkzBJg==
=2izk
-----END PGP SIGNATURE-----

--9IO9vSHELR/sHIWS--

