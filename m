Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663C4BF7F9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 13:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276758.473039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMU7S-0007PD-Pr; Tue, 22 Feb 2022 12:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276758.473039; Tue, 22 Feb 2022 12:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMU7S-0007MK-Me; Tue, 22 Feb 2022 12:18:14 +0000
Received: by outflank-mailman (input) for mailman id 276758;
 Tue, 22 Feb 2022 12:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BO+H=TF=invisiblethingslab.com=woju@srs-se1.protection.inumbo.net>)
 id 1nMU7Q-0007Lt-KY
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 12:18:12 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa4b175-93d9-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 13:18:11 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 658803201DE8;
 Tue, 22 Feb 2022 07:18:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Feb 2022 07:18:09 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 07:18:06 -0500 (EST)
Received: by mail-itl.localdomain (Postfix, from userid 1000)
 id 9048588D3F; Tue, 22 Feb 2022 13:18:03 +0100 (CET)
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
X-Inumbo-ID: 7fa4b175-93d9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kcYTy4s/XO5qMDwIt
	AUsf/XzBPXwIFt2A5ax0wPh15s=; b=fTBkdrbijoCmJCqImjrWMzRUW1fyjA7Wo
	t7D1EKwDqoLDr+OFTt39Ev3XfwA5flxIeWXzDmHEda0qlyuizMXyHKZ/aFFVPtMU
	Ba6bByWsaDy5u2NLwnxlb1BFjmp0rtfHFacPX7S1+Hj353/F1GYrE+HYSfbgqPvb
	Q+jK9VjG694+3VausSbWdrRXmQJwOht5vjKxGQfDwgO03tVnB8TtwBLFOqTKKyqb
	6BCOdpe4J0ZRUe5WTHehRRKPAMokn00tfnIHu0NT1cY9H5AdDw3HMUgqLM6kF/do
	/NTroXE0fju3vcpV4li2jxEyhPxjnn8mhzmTCU5r3GpFSy8/SjSbA==
X-ME-Sender: <xms:f9QUYnUEH8Bxpjad_niNS3aOEWUaLZM4wYXhu5xj_dBD2m-q6mTtjA>
    <xme:f9QUYvkfCIUGhnMFGocu71Bqp3vVHyl9cfNbftgg1o0rsRRLnCuCQxc9py3ZiVj5Q
    UVgZMusN6JKE7I>
X-ME-Received: <xmr:f9QUYjarG1AMXlCZTPLl5zo4HMrC_h2w8ney59lMUCx2vF2zlhaNDTtIVfXSlmqkWvE9nRgy3wWw8Z8wVI4umD6RjkYB2jcGV-p0Y4CyJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhephghojhhtvghk
    ucfrohhrtgiihihkuceofihojhhusehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnheptddvffefjeeftddtieevueeigeehgeefheeluefh
    fffhveeuveelueelffejtdegnecuffhomhgrihhnpehrvghpohhlohhghidrohhrghdpgh
    hrrghphhgvnhgvphhrohhjvggtthdrihhonecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepfihojhhusehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:f9QUYiXWReafX3ELfPclN8Tu7E6eBrZPv_t4i-fGeOj0yqH6vZzMbA>
    <xmx:f9QUYhkwgYaNc12eHJnfSdKxVpDI0cevYkjUgeXW05r-NMXtK3Rmxg>
    <xmx:f9QUYveMKtzU880AlSfAAk_0iX82_uWtj3EkdkGW11hzc25o4ATjyg>
    <xmx:f9QUYvZwWpb7T1Cv75vVY-Lhw4gaQMdpIFpwXUqXAbb_9jHo1eNh2g>
Date: Tue, 22 Feb 2022 13:18:03 +0100
From: Wojtek Porczyk <woju@invisiblethingslab.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
Message-ID: <YhTUe7K5/rlek4AA@invisiblethingslab.com>
Mail-Followup-To: George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3UUv3tuJOjWd5m1S"
Content-Disposition: inline
In-Reply-To: <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>


--3UUv3tuJOjWd5m1S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
> I think it=E2=80=99s too much effort to ask developers to try to find the=
 actual
> minimum version of each individual dependency as things evolve.

By "find the actual minimum version", do you mean to get to know the version
number, or install that version on developer's machine?

The first part is easy, may I recommend the excellent https://repology.org/
tool, which also has API to query the version yourself and render a table
yourself. If there's any interest, I could clean up and share a script to do
tables like this: https://noc.grapheneproject.io/~woju/distros/.

The second part very much depends on distro, but all of them have provisions
to install older versions of packages, though not all of them might carry a=
ll
the possible versions (i.e., it might be that you need version X, Distro A =
has
had versions X-1 and X+1, but never packaged version X). Again, if this is
a problem, it depends on the actual package and compatibility situation.


--=20
pozdrawiam / best regards
Wojtek Porczyk
Invisible Things Lab
=20
 I do not fear computers,
 I fear lack of them.
    -- Isaac Asimov

--3UUv3tuJOjWd5m1S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEaO0VFfpr0tEF6hYkv2vZMhA6I1EFAmIU1HsACgkQv2vZMhA6
I1EMqw/7BeG66foOzv+3vFV0LkBV6NOqUm+TW5QPx6Qp1J+DSpQOZdOwKqwE17Vv
2502VuSExJ35F+So8u9uecylxCEfQPOCBwVXYOzhZJbRjYn9UGPFrZd9nhoUcR7K
5xc8/wD6lPFWqaX+uPp72pRwWKXBBCkOn8CawXos3X8uqF1ecjNRw/BqZ/DJs7AD
To11h6tRi4LF6DQstgiNM3Fa+Ub9REs6ljnO6F/8xClyTRLLjmtfRK1++hW3jeDO
bWrzfy4HrquRRG7UpqxG+bHIID1Gui/GhMdi1oBQ1NMWIB+jqIQHqraj3mfbgNsZ
1c5DzPcofrm27Rbt/d0YbfjCDyyDeQU+xxFbi6jIUC77hbBn+u0TIIdn1mEyf9RI
N3Ok/P+7jc6trik9ERoOZ/q6WtePlXWQrSjMIXIm8twS48uubmKf8gqag7dUciZC
iw4tYFpNw5kc4jh6Tus+FEdaya2qX3gKp5Vm7+2pTwWCIYibpv3ebgY0yro1fIcJ
EklbkWTOKqmEzfhATJkHZ1r8nM6uPzmpbBExAqJdLUwD9miqZ5y9fSOFU5uAYFmf
H83GkuYeLGSYWnc8WRWDJLJB+cGIojWhFl+Y8FwuPHNVrF399haTYp0jXSBfs+f4
0KBOe7sqJ+G35IjzKvTX4Il6anuBHzhxXyL6f83Q4apZEwYTt7U=
=POjU
-----END PGP SIGNATURE-----

--3UUv3tuJOjWd5m1S--

