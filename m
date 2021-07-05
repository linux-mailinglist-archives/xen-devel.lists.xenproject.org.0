Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22043BB899
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149877.277199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JdM-0002zL-2E; Mon, 05 Jul 2021 08:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149877.277199; Mon, 05 Jul 2021 08:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0JdL-0002ws-VQ; Mon, 05 Jul 2021 08:07:15 +0000
Received: by outflank-mailman (input) for mailman id 149877;
 Mon, 05 Jul 2021 08:07:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0JdK-0002wT-6g
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:07:14 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.52])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00ca41c0-dd68-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 08:07:13 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65878KcO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:07:08 +0200 (CEST)
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
X-Inumbo-ID: 00ca41c0-dd68-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625472429;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=wvYRUUMW0u1lIS0ClKqX6IV//60D9uj9l3nt/CtcKzI=;
    b=PT9oG4Vy7eSnKIUIissGUwerOTr55ViFVDgJsfo0SYdcXuig5DCegMgWG486SIsvR0
    T/SLEtZE6FidhjPN+1UovF/lL1J++X8Qq4I3YFkYnrNCfqqDieX07ayEKOgRSd0VWPYu
    C8RcluCJymERLa2x4GaCl014XqLZwgy9Dec1vfZEIeBvfYJRFECQYIfqqKSzH0YpQ+e9
    2S3cpympss2Kq5pGuLcrHnZILTz381zcM15Lmd2vr0J0t8QPPzoSFVhS7GFloEZBOMnD
    eEFooiYMnICmIWi6wpPrqnEKmeixBp1w9v4CkFciLsYr4Mlc8tynW7047QHqsUQPSMZN
    lJ4Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:07:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in
 format string
Message-ID: <20210705100706.48b4a1ef.olaf@aepfle.de>
In-Reply-To: <YN88m0tvHKxF7+NI@mail-itl>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-7-olaf@aepfle.de>
	<YN88m0tvHKxF7+NI@mail-itl>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nTvfTfR5Apkq/O5_Q/rDeFU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nTvfTfR5Apkq/O5_Q/rDeFU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 2 Jul 2021 18:19:39 +0200
schrieb Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>:

> Why bytes()? Encode does already return bytes type.

You are right, this works as well:
  i =3D 123
  b =3D ("str/%x" % (i, )).encode('utf-8')

Any preference regarding the "encoding"? I picked UTF8, but 'ascii' might b=
e more correct in this context. In practice it may not matter.


Olaf

--Sig_/nTvfTfR5Apkq/O5_Q/rDeFU
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDivaoACgkQ86SN7mm1
DoCzuQ/+MfTkkPlSqy3JgXyaZo7J6r6wsH7zFTtot3KMyWvYI6DVyyFL5n4XjE4T
1l0v/02/6DDGa1qNBkXa+1UpZzgEgt5Z5w61bMD/NPwoi1PjgY8A0Zhxgjp+i+y7
wpolbrTc0eNcz0twNbfpsvdco3XqujsSXK0zm2jPmtupDfGRrLjr996V+ikv1Wx6
hCJk91DXUK0piycdffC+apWSzoALXvB5mDgjPMhMhUvc7m23lDwO9fzJFp+NM3Q2
idGZUw+u3F6WjZkssjP+63F0lKYZgyBvOheXaH+un6cMbDfBrNEhqgvmdatG3OJs
hhcguB1/WypQ+/DySgFi2+H0eO+xdjdsZyVe3dVKXnTNbXchgueEZfGoGp60CXyT
7/D2DvuvqZ/CjrXqFRplTHeJes0urZnqStZ6YMJ8Pvtc9sA5e+49VKuJRX6P7Fqr
tV9uaiRWj/vmsJ+BamB6CNQLL3u00mImZUfE8FyxTD2JKSmqPm69RLlpdbWHiiii
A2QsWqpItLiU7Pw0Q6wwtdUUk7JM6ehKdopJWAKSlENiUriPW4d6jDzJjas9ke8E
MHwzVPSbyp3Hj8p4k0d6SlctmICZS2XV0kcIKf4+ple3EFl3Sy33V0gzXLez2hTb
+YThiiEm25BFkOVxuY2fdo7kavyys4b5oM0l7eHfX44LqETw3Is=
=1CbD
-----END PGP SIGNATURE-----

--Sig_/nTvfTfR5Apkq/O5_Q/rDeFU--

