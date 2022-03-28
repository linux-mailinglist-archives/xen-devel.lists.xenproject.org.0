Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32D4EA1A5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 22:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295578.503060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYw8m-0003Zw-A0; Mon, 28 Mar 2022 20:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295578.503060; Mon, 28 Mar 2022 20:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYw8m-0003Wi-5b; Mon, 28 Mar 2022 20:39:04 +0000
Received: by outflank-mailman (input) for mailman id 295578;
 Mon, 28 Mar 2022 20:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Y9Q=UH=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nYw8j-0003Wc-QP
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 20:39:02 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16d94938-aed7-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 22:38:58 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D9055C021E;
 Mon, 28 Mar 2022 16:38:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Mar 2022 16:38:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 16:38:55 -0400 (EDT)
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
X-Inumbo-ID: 16d94938-aed7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Jus8ZJ3zuA3UyTCO7
	C2XcvuCNtvWOSEYF+Qqu8mSD30=; b=lZbVk+3scvkwjonIpDObuye6Nl4oWLIID
	LS2NT1AArpO67jTnxMD5erkgegYA3ucDOu8KclTA9lxOBHmRaW9+2L21Z3TEwE7s
	WsVg5xALnwcynV73L30HwJvr+DIHh2ZfcEjXcHKzxy6BiVuCnVh6z388rKczX803
	FMRxvwbfrIqqkzoZ4leGtplei/MTRQlu1nePYwYA2iMCIMa91s8BBSIbN1kBo+M1
	1UKUDCjyhvZHlR6FHtGQWiXRdkGgCvoXDLK7tgFnKATTSY4dDLnHd5swa5zMzgwX
	A0wD3gh0xIIGo92gwjjzRYiHuW7uh8LLnFfA9reqIKuaDTM72G/gQ==
X-ME-Sender: <xms:3xxCYrSA-brB7pdzpTz81xobPFbXCg2LxelIqneDjLFRA-p0GKTTIg>
    <xme:3xxCYsygw8u3_hNZCLo2z4on9vXHgrnG5WrXUf-NW-d0hQOmbhMlZVIWkklFgxSBh
    Kilzh-NgTAJ_Yk>
X-ME-Received: <xmr:3xxCYg0XM6AVXIdq5tB4Rlw0J_T_l6lq0OifjH2VL7-YVoalqdb3sygNxYzQh1rzLKSigw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfvfhfhufgjtgesghdtreertdefjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedugedugfetfeejfeehtdfggeet
    ffelvdegvdejtefhhfekfeeludetveduhfeunecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:3xxCYrDqVefClaZ2O4uNylI3GaNZ3xCbJFV9EX_UF_bgPsMCUL6Paw>
    <xmx:3xxCYkjR8uaHtrsMGkEFZGL1QEo4y_5YiPvWI74tU8QumO5P0u_ELQ>
    <xmx:3xxCYvpnsFwMWTjQs9HI6iRqtRAxEoxoqFTCaQZwxsGp3kkYG-dNSg>
    <xmx:4BxCYtsSHLZkPf0gmf4YNIsgZslYyvz_dxRglstP9A2mwBwdirUrew>
Message-ID: <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
Date: Mon, 28 Mar 2022 16:38:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: djm@mindrot.org, roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 xen-devel@lists.xenproject.org, tech@openbsd.org
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
 <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
 <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
In-Reply-To: <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kxld3QJ8sYt5KflTU7puNuUI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kxld3QJ8sYt5KflTU7puNuUI
Content-Type: multipart/mixed; boundary="------------G4sArzC1TocU1Lwf14jsB78h";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: djm@mindrot.org, roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 xen-devel@lists.xenproject.org, tech@openbsd.org
Message-ID: <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
 <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
 <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>

--------------G4sArzC1TocU1Lwf14jsB78h
Content-Type: multipart/mixed; boundary="------------pwi7rCsQeNxR0kZ0WVjfsB2b"

--------------pwi7rCsQeNxR0kZ0WVjfsB2b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/28/22 10:39, Mark Kettenis wrote:
>> Date: Mon, 28 Mar 2022 09:51:22 -0400
>> From: Demi Marie Obenour <demi@invisiblethingslab.com>
>>
>> On 3/27/22 21:45, Damien Miller wrote:
>>> On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
>>>
>>>> Linux=E2=80=99s netfront and blkfront drivers recently had a securit=
y
>>>> vulnerability (XSA-396) that allowed a malicious backend to potentia=
lly
>>>> compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99=
s xnf(4)
>>>> currently trusts the backend domain.  I reported this privately to T=
heo
>>>> de Raadt, who indicated that OpenBSD does not consider this to be a
>>>> security concern.
>>>>
>>>> This is obviously a valid position for the OpenBSD project to take, =
but
>>>> it is surprising to some (such as myself) from the broader Xen
>>>> ecosystem.  Standard practice in the Xen world is that bugs in front=
ends
>>>> that allow a malicious backend to cause mischief *are* considered
>>>> security bugs unless there is explicit documentation to the contrary=
=2E
>>>> As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=
=80=99s man
>>>> pages.  If the OpenBSD project agrees, I am willing to write a patch=
,
>>>> but I have no experience with mandoc so it might take a few tries.
>>>
>>> Hang on, what is a "malicious backend" in this context? Is it somethi=
ng
>>> other than the Xen Hypervisor? If not, then it seems not to be a usef=
ul
>>> attack model, as the hypervisor typically has near-complete access to=

>>> guests' memory and CPU state.
>>
>> The backend can run in any Xen VM.  It often runs in dom0, but it
>> is not required to, and in Qubes OS the network backend never runs
>> in dom0.  Unless it runs in dom0, it has no access to frontend memory,=

>> except for memory the frontend has explicitly given it access to via
>> grant tables.
>=20
> So this is somewhat similar to the situation on sun4v (Sun's
> virtualization of the SPARC architecture).  When writing the vnet(4)
> and vdsk(4) drivers for OpenBSD, I did consider the implications of
> those drivers talking to a "malicious" domain.  the SPARC hypervisor
> implements a concept similar to grant tables.  It is fairly obvious
> that any memory you grant access to should be considered insecure.
> This means that you either have to make a copy of the data or revoke
> access to the shared memory through some sort of Hypervisor call that
> implements a synchronization point of some sorts.  Otherwise you and
> up TOCTOU issues all over the place.  But this obviously has
> significant performance consequences.  For vnet(4) I decided that an
> extra copy was worth doing and the only reasonable way of doing things
> given how OpenBSD's mbuf layer works.  But for vdsk(4) I decided to
> trust the other domain as there is no way to prevent it from feeding
> you compromised data.  Full disk encryption doesn't really solve the
> problem unless you have a way to securely verify the bootloader.

In Qubes OS, xbf(4) devices are configurable.  While all of them are
provided by dom0 (which is trusted) by default, it is possible to
attach devices that are *not* provided by dom0, and these devices
should not be trusted.

> Personally I think it might be beneficial for us to turn xnf(4) into
> what we colloquially call a "bcopy" network driver.  But folks who
> actually use xen may find the performance impact of doing this
> unacceptable and decide to trust the backend instead.

You actually don=E2=80=99t have to do that.  The Xen network protocol
requires the backend to drop access to the buffer before giving it
to the frontend, so the frontend only needs to ensure that it cannot
regain access.  This will fail if the backend still has access, but
that is a bug in the backend, in which case you should shut down the
interface.  So there should not be any significant performance impact.

If you are curious about how Linux does this, you can look at
drivers/xen/grant-table.c, drivers/net/xen-netfront.c, and
drivers/block/xen-blkfront.c from the Linux source.  They are
dual licensed GPL/MIT so there should not be licensing issues there.
Be sure to use a version at or after =E2=80=9Cxen/netfront: react properl=
y to
failing gnttab_end_foreign_access_ref()=E2=80=9D and the other XSA-396 pa=
tches.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
--------------pwi7rCsQeNxR0kZ0WVjfsB2b
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------pwi7rCsQeNxR0kZ0WVjfsB2b--

--------------G4sArzC1TocU1Lwf14jsB78h--

--------------kxld3QJ8sYt5KflTU7puNuUI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJCHN0ACgkQsoi1X/+c
IsEOSg/+K8nsru6EGEQVDdnj5Cnv69pRuOfBJC/+Mz+iElMXf1hTUHRwfeO4BXFi
XQQuMtXAspjBRYu1yMrsht4NLpKkwJuYpXVufMmXvjMTmezxpHmZJ39n+2Dl/7fe
pQiaVxnVCmA+4l+08gCwnt55Dy1eHrwYf0uEewtR8e/hkZn7hn3/APtERjnnwOYU
M3Usv6OetqMjfYZQQW8VyU9rjVO9FtyG3a++1fQdU0trE62ZlXMytUd/AGSp9aMm
sVQak+URBWmbRu9VRhICXx6hfgeAZTOLut5AUeElfGrT6n67Ha+/iOT37xGIzU1F
FS61Zy3p8MDUA6uxPX8Gf0/dbNCDQ5qmGMMzB6+sAcs+8UvESy1ZibayNcqEZG3e
k5WfrI8G9VH4pJ7+Ly/XxgbWUbV5YXysDx7W2OMcHEDnjGtAgZjrrnhDpF/VfTwa
JM+ECuuu96YjLVwt/6y4RRahgxxsB28YnOUe/mtM9k5zHN59dPrQXbDHbBOMnJsP
KKJEgSLIN1JN1KPndUciJfvnZCmEearMsq+X2IgHzTtCFriRf5iaD2aDUCMjz8bX
xjn9W/7jTvLkp6N/b1cbpszVBSyO2VL2fZM3YZeKNZz61XN/2JANCAL+yS2KR+HU
3blBkPzA6DYL/zOwDtEVgRGXOLTVGpw21s/WZ6cQ/YmK4+IEHK8=
=tnwt
-----END PGP SIGNATURE-----

--------------kxld3QJ8sYt5KflTU7puNuUI--

