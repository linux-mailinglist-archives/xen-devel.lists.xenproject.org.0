Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED9F4E98BF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 15:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295451.502766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpmO-0001QK-HR; Mon, 28 Mar 2022 13:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295451.502766; Mon, 28 Mar 2022 13:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYpmO-0001NU-E0; Mon, 28 Mar 2022 13:51:32 +0000
Received: by outflank-mailman (input) for mailman id 295451;
 Mon, 28 Mar 2022 13:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Y9Q=UH=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nYpmM-0001NO-P0
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 13:51:31 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2999d617-ae9e-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 15:51:28 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 513445C0100;
 Mon, 28 Mar 2022 09:51:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Mar 2022 09:51:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 09:51:25 -0400 (EDT)
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
X-Inumbo-ID: 2999d617-ae9e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XvgsUWz/ZapYy1cAF
	pFe7U3jyrIlUSCInZ9aGV0Jihg=; b=cZkVrK62z60Uj9k/yZQU5+mvUI7ePWLZF
	O6Wq4L1+4p6+bVpfFq6FxEV/z9Ff2yZuRIxFxzOh05Q6R6bREbKxEc1geV75rx+w
	YK/CwzrZTRrp1sWY67jk1MKIo/2RtIBnHtk9UAC/nt1VbaQoJGqgflkJi0BuN5eM
	bfR5oeDlh7+RKGzUQyiJ6GQ5mYMRKXYY9buMyB2gTeN7eNFEZi5uQQ0hg6pq4UwE
	IbT5cFzIHKR2tNbH2VEMHmeujJvWnRz9WxOwdTMeZjPAQS+igcqmtQFSr1xweqFO
	q2Oy56yMGgrQf+3FT8lL0UwtfDQSV4nFIdtWPc+SFcXPhaTTK+p0Q==
X-ME-Sender: <xms:Xb1BYgicCdlekY7226BlzL9hR_ICFgrUjHvuDRlhHa6lxg4bjPtn4A>
    <xme:Xb1BYpC7nBoccpAJNjF1BW4QpnWC--6a6u8uD8OLZR3QgN9p7BoO2l_0GblFj-b8P
    LQnCSo9iocNoEY>
X-ME-Received: <xmr:Xb1BYoGUX-U0luJfttvcCnsqHUGrhY5A2S8CPKDhbsNzkQdsBkVkXmJjRTI0zu5vccxJgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtsehgtderredtfeejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeefhefffeetheffffeftdeigedv
    leetffehvdekuefhfeduteetfeetvdelhfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:Xb1BYhSN7ZITi1TQhMZSIkVY72BLScrJ65JiC5Tnvj19pipbaS-PNQ>
    <xmx:Xb1BYtzNmJ7n0WGoOqdrom3q6zYzRvXng1h3vXnvb9vHZvNQBQm7BQ>
    <xmx:Xb1BYv7qud9RySIIvrXfP_9qtibLddDLs0snAKoqSeb4cKzI9aFc1A>
    <xmx:Xr1BYo86JXtYiFA2AiPh1xsfoxjKmi7i0ARj7CPFvsz9KjQ5c9boIg>
Message-ID: <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
Date: Mon, 28 Mar 2022 09:51:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Security support status of xnf(4) and xbf(4)
Content-Language: en-US
To: Damien Miller <djm@mindrot.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 OpenBSD technical mailing list <tech@openbsd.org>
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
In-Reply-To: <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f094q0t0afcdSwpfbNFreBCK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f094q0t0afcdSwpfbNFreBCK
Content-Type: multipart/mixed; boundary="------------OVdNd2Q65LvjbZQB0qhiBAQ9";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Damien Miller <djm@mindrot.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 OpenBSD technical mailing list <tech@openbsd.org>
Message-ID: <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
In-Reply-To: <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>

--------------OVdNd2Q65LvjbZQB0qhiBAQ9
Content-Type: multipart/mixed; boundary="------------3tlhz9nldwzLm4UkA0PZFtno"

--------------3tlhz9nldwzLm4UkA0PZFtno
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/27/22 21:45, Damien Miller wrote:
> On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
>=20
>> Linux=E2=80=99s netfront and blkfront drivers recently had a security
>> vulnerability (XSA-396) that allowed a malicious backend to potentiall=
y
>> compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99s =
xnf(4)
>> currently trusts the backend domain.  I reported this privately to The=
o
>> de Raadt, who indicated that OpenBSD does not consider this to be a
>> security concern.
>>
>> This is obviously a valid position for the OpenBSD project to take, bu=
t
>> it is surprising to some (such as myself) from the broader Xen
>> ecosystem.  Standard practice in the Xen world is that bugs in fronten=
ds
>> that allow a malicious backend to cause mischief *are* considered
>> security bugs unless there is explicit documentation to the contrary.
>> As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=80=
=99s man
>> pages.  If the OpenBSD project agrees, I am willing to write a patch,
>> but I have no experience with mandoc so it might take a few tries.
>=20
> Hang on, what is a "malicious backend" in this context? Is it something=

> other than the Xen Hypervisor? If not, then it seems not to be a useful=

> attack model, as the hypervisor typically has near-complete access to
> guests' memory and CPU state.

The backend can run in any Xen VM.  It often runs in dom0, but it
is not required to, and in Qubes OS the network backend never runs
in dom0.  Unless it runs in dom0, it has no access to frontend memory,
except for memory the frontend has explicitly given it access to via
grant tables.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
--------------3tlhz9nldwzLm4UkA0PZFtno
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------3tlhz9nldwzLm4UkA0PZFtno--

--------------OVdNd2Q65LvjbZQB0qhiBAQ9--

--------------f094q0t0afcdSwpfbNFreBCK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJBvVwACgkQsoi1X/+c
IsGSIQ//ZR0ovOIsBnW0X97CuzYJUBOLZudWGuAADXwpdvbaOnNk6EUgRrYdTwMr
eKB/RklXXE8I6GesiiUwNTss3ZGMcJNzmbdeXfn8VAMjz7xOshIxJnVLJXXU83vU
BJL9iHN9vYRX07RxwQSJ0uRkQLjCGv9hc6DJo7TsRy5v103fH2cRPCiQPm9F+abj
JBL/f0UqVb9C15u0ljPrREyQuSTQoEtX8R0kaNoycaeBWXU4WXlolnEiifAvShCf
1u4z36xCMbcoXapJSzbeko5gTs4OdXks/fMVpJ42xF5Ok1QajoqVsS1MzYkVtKye
4AJ6xKbKNcIkWc38UataMvvW1xotgz70a/6rzVjSOPvtnHmCWgLKyNy1vh3bGfpH
QicqPuoOKbpRP9mJpPk1FO7PFGbEt9JlAOlwGqwo3dHqrzIT2du7z8udUSUfs31E
Y5Q+fwKNN/74bajzd0Hr/uDUugtiSEmvuHvzO+lRmQ2tYIQHfJkHgiBkmbFeNj/Z
Edg9lZmMRUjYURlKSCogw6Dn8E0vd0tfBsnsRZkzlBctI+0Oi1EumcK3/4h0H0oP
coz8b9ZAXJ41tDjtuYThoIzHya01ZuGC7zSKXKbcsva3ltXD4G1JDhQ/9XFlAXFv
a89NJWKPUXVumVlzEFwO7xIWoDWT+6k6H2w5Sq7CROJM4KkOjso=
=lyYK
-----END PGP SIGNATURE-----

--------------f094q0t0afcdSwpfbNFreBCK--

