Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7864F16C6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 16:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298367.508265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbNNb-0004Ry-Sf; Mon, 04 Apr 2022 14:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298367.508265; Mon, 04 Apr 2022 14:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbNNb-0004PP-Pg; Mon, 04 Apr 2022 14:08:27 +0000
Received: by outflank-mailman (input) for mailman id 298367;
 Mon, 04 Apr 2022 14:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Btr=UO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nbNNZ-0004PJ-Ap
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 14:08:25 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afcb3405-b420-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 16:08:23 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 063D95C012F;
 Mon,  4 Apr 2022 10:08:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 04 Apr 2022 10:08:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Apr 2022 10:08:20 -0400 (EDT)
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
X-Inumbo-ID: afcb3405-b420-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y+pWA6nTgmB2RDy/H
	qeV11THgsCg0yf3WY+brecV0do=; b=GWHMUeUBfbInsoDI+7GohxMU32Bg1RcTK
	5ICW//BwXZnIR5gU7spe7aC/dHtTuweN24QW5vlH2/Tv5jPlC7UaBiyPjBpqvZaA
	JfWXBuHc+hVscI3cHhQ0jD/uLnsP45XnXrB0vXWWE3xbQhqYor3NZLGycfto5nUs
	KDhsHMwpAGlxMps6oMzMFuySL73kaXNVvxE2SDFKlCOgGoYsT+DRGoyELO+PsDOB
	bMdNr5vniPezDYAhx6xacgj6EuLhEAWiP/8dbauyNrGqti9jnR8WNy7CxTlCJJD5
	RZN19+j2Tr1F2r8zTtODHtiUkGAvnWnX0NBZro0lQcwDpJJWiFBgg==
X-ME-Sender: <xms:1ftKYqYSaPDD3tw6xs6mIBALQR7A5HVDtvc_uUAOqIEnPH3SI6icAA>
    <xme:1ftKYtYwD0pnfI9Rv9r5g4fj-XqD1kN0BPAxVjX0e1ikbfcOJwBqX1x9GZ7PyfmjP
    e4D7HqK9_56rw>
X-ME-Received: <xmr:1ftKYk9nAL_-ppL91e_PAyamA7cRJ1--YDPgYKkfIGjrT3Z7R1JE8sVlU1zrFdRL6M8q4K4s8OWK8sB0KJHb3-TLJbFCRJPV1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejvddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1ftKYspitLPi_kuhySN9MwivVD6qvK5oqv0cUsLThEtsJ1LrCe0MDQ>
    <xmx:1ftKYlpQCw8d92_Iz2GMY1VKkcqHaPKWbyz-5JhxyuZpK9wasxE7JQ>
    <xmx:1ftKYqSu4DHjzL06IO1MKlnI6GV2JOKafG7UI3x2nsQggj_qAZfiSQ>
    <xmx:1vtKYmllTpz0ykYXr9uevi3BA_RAb7DoBPJd2KoAWfJIIVxOeuTjMg>
Date: Mon, 4 Apr 2022 16:08:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.14.5 ?
Message-ID: <Ykr70scPNU0+C5dR@mail-itl>
References: <466e1d4b-a4b6-0797-ca1b-1ea59a3993ba@suse.com>
 <YkcCMg8+dDjxBvJW@mail-itl>
 <d2bf04d9-53e1-6658-a1d7-ca61bae01141@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OJ6h1k6N1cxxusss"
Content-Disposition: inline
In-Reply-To: <d2bf04d9-53e1-6658-a1d7-ca61bae01141@suse.com>


--OJ6h1k6N1cxxusss
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Apr 2022 16:08:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.14.5 ?

On Mon, Apr 04, 2022 at 03:42:09PM +0200, Jan Beulich wrote:
> On 01.04.2022 15:46, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Mar 30, 2022 at 12:16:00PM +0200, Jan Beulich wrote:
> >> All,
> >>
> >> while 4.14's general support period ended in January, we're considering
> >> to cut an out-of-band release due to the relatively large number of
> >> security relevant backports which has accumulated in just 2 months. By
> >> doing this we would _not_ be promising to do so again in the future.
> >> Please voice objections to the plan (or support for it) in the next
> >> couple of days.
> >>
> >> Since it's a little easier to "batch" releases, I would intend to keep
> >> 4.14.5 aligned with 4.16.1.
> >>
> >> Commits I have queued but not committed to the branch yet (and I won't
> >> until in a couple of days time, to allow for objections to the plan to
> >> be raised):
> >>
> >> dd6c062a7a4a tools/libxl: Correctly align the ACPI tables
> >> aa390d513a67 build: fix exported variable name CFLAGS_stack_boundary
> >> e62cc29f9b6c tools/libs: Fix build dependencies
> >> eddf13b5e940 x86emul: fix VPBLENDMW with mask and memory operand
> >> 6bd1b4d35c05 x86/console: process softirqs between warning prints
> >> 07449ecfa425 tools/libxl: don't allow IOMMU usage with PoD
> >> 10454f381f91 xz: avoid overlapping memcpy() with invalid input with in=
-place decompression
> >> 0a21660515c2 xz: validate the value before assigning it to an enum var=
iable
> >> b4f211606011 vpci/msix: fix PBA accesses
> >>
> >> Please point out backports you find missing from both the respective
> >> staging branch and the list above, but which you consider relevant.
> >=20
> > I'm not sure if "just" bugfix qualify for 4.14 at this point, but if so,
> > I'd propose:
> > 0a20a53df158 tools/libs/light: set video_mem for PVH guests
> >=20
> > In any case, the above should be backported to 4.15 and 4.16.
>=20
> Hmm, Anthony, I'd like to ask for your view here: This looks more
> like a cosmetic change to me at the first glance. Plus it's a
> little odd to see it being proposed for backporting now, when it's
> already almost 4 months old and hence could have gone into 4.15.2
> and 4.14.4 if it was important.

A little context (from IRC discussion on Friday) - this was only
recently identified to fix videoram set to -1 on PVH:
/local/domain/22/memory/static-max =3D "819200"   (n0,r22)
/local/domain/22/memory/target =3D "819201"   (n0,r22)
/local/domain/22/memory/videoram =3D "-1"   (n0,r22)

And since target =3D static-max - videoram, a guest started with
mem=3Dmaxmem doesn't really have them equal.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OJ6h1k6N1cxxusss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJK+9IACgkQ24/THMrX
1yzbYgf+NQ1rRT1SjBzSQxOYFSKetTg6OIVJGdMFrKnY8JiOQNR+CeirSyDSk3Bs
ODjB0zoseZVexCG/Jgw4BQTOJMQwUHed2qmUXYcDtn/lcjJPM4AlnrRHw6+Jzpy2
MIguWaK/ceZvI4HG6PB2wvnJz6GOhwQQjd0/SEnyJTMBvv3RStwWQie7YoIZ8aCZ
DAClhn5xRekSrcG/arj5IQtHErFR+bD9C6TSSZK8+3rKJVeyoeXIRN9Ft2T2VHuZ
jZbaO62/HQWrpQ+n5abFkkmZq1Aod6xvLTwrUDfJ104ar2Ig66CeyULd55Wiv1BS
JHjNWKxiXW/4L7wB1icBsccqryglUw==
=W3pE
-----END PGP SIGNATURE-----

--OJ6h1k6N1cxxusss--

