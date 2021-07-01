Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3B3B90E4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 13:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148625.274653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyuSC-0005hH-Gb; Thu, 01 Jul 2021 11:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148625.274653; Thu, 01 Jul 2021 11:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyuSC-0005fF-Cx; Thu, 01 Jul 2021 11:01:56 +0000
Received: by outflank-mailman (input) for mailman id 148625;
 Thu, 01 Jul 2021 11:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyuSB-0005f9-2J
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 11:01:55 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5879899-d063-4e70-95ec-c059ee4bf8fb;
 Thu, 01 Jul 2021 11:01:54 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61B1q5uX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 13:01:52 +0200 (CEST)
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
X-Inumbo-ID: a5879899-d063-4e70-95ec-c059ee4bf8fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625137312;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1Ft3d4S2jt1ugXiZnrYmhDGS1ySaDt8cXXFb/3BIPAA=;
    b=ODtG48Ub/xAzJCrdWPRb54gQQ4meZRvv8XJLwtn+vaFX9shs4mT4hHtaKxM/lRz773
    fzHH5xIjNzxT7JQrNeS6K6QWDeCz5W0lBX6mmC9SY0cSU9gwuq7fKfHgCKpi5wcLFOzb
    sbBzA1jF3e/eZuWx2mU7sE+wo2cGCDnU2MuNCIBs8AA83KWmRiRv5rEKwxm9Xnko+9tT
    BSC13rke64cE9AuByc97Nuk+u3zumFpSesiIvWwN7V0Si7jaYhOc35Q/VnDpZRzV5xg5
    nUhPwZnK37s0xTADktkS+0xGe7WV5DWMf3u1fxn9MJ21ocZhiyz2JfDZ3ARdjz1efOzn
    DAxA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 13:01:43 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v20210701 08/40] MAINTAINERS: add myself as saverestore
 maintainer
Message-ID: <20210701130143.2b8cfce3.olaf@aepfle.de>
In-Reply-To: <13a963c1-639f-5135-734b-9cc1c8d9034e@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
	<20210701095635.15648-9-olaf@aepfle.de>
	<13a963c1-639f-5135-734b-9cc1c8d9034e@suse.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hnFDd7g=OsxECGa+S219NuQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hnFDd7g=OsxECGa+S219NuQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 12:39:06 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> I'm afraid this goes too far: This way you remove all prior
> (direct) maintainers (see "The meaning of nesting" in
> ./MAINTAINERS). And I'm sure Andrew, who has written much of
> this, ought to be considered to become the maintainer of this
> code then as well.

I think this was copy&paste from some other entry, which would still includ=
e the tools/ maintainers when using get_maintainer.pl. I do not remember wh=
ich one it was.

Also I think if Andrew would have a desire to be in there he would have add=
ed himself already.


Olaf

--Sig_/hnFDd7g=OsxECGa+S219NuQ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDdoJcACgkQ86SN7mm1
DoAmCQ/8Dcu9wPw+Og2BtFApKoZlKp2HGXc+NttVZ3mUwhPP2Zf+epS70Fp6tY+m
SkFWXCd/xHUN0/S9xEMYtq1cDO9+QzhThUZU3w328UJqWd0t5wtYeVWo6eynxZGI
lOPV+f7zfKseuP6C5owS2Nakl26XhucE+XOa8f+zb2PAGC4kcK+1GnOOJ0hLDdtq
Ip0dTi3z94zZqXzqv1D68Ce/hYxrCeutH8Xt8oD5SgjGWOSX9BAHPnJXSebcmKbN
IYBGYWTJDxKlV9kmyPLHuTxXJPy8TuyH+dQc0qDYQG5fjyhZBJc7MGeKrF7xWurt
nQHC7WlXHAFbWRJkL1JpZPxIKOAkO6GlKOSrMQAgqlg2BTrJNdPMevZ4HJrtN0di
Se7Y7q7LQgUmE82ozwb/yUMdFwFIRtkl//DDV/X4aIWWy5DnddVI8bhp8nCSnpOV
b5swpfyvZFll0H5RO8aavuOWZL516F+/voAYQk/EqqMHZ0jPCn1NQ5uVj8yKvOGq
qRLwBqAVhFAezqvGyT/CvfHK1KB37ir6qZnJBUgpPzOjQT9unt79NwZyGeGHgrRu
Cd//7GRENf1p5ZgCOHw5u54GchNbhIK878TeD1kjsLNTtx6t6Vq89Cot535veKWF
JYVCR9BsSsv0cr+OvjHzTg7tK6OA3jwVbh/VOSACCx4812Ojyn8=
=G4ey
-----END PGP SIGNATURE-----

--Sig_/hnFDd7g=OsxECGa+S219NuQ--

