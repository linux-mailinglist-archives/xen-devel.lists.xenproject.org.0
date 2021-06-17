Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0DA3AB697
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 16:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144025.265181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttR1-0002Vm-AM; Thu, 17 Jun 2021 14:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144025.265181; Thu, 17 Jun 2021 14:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttR1-0002Tx-7K; Thu, 17 Jun 2021 14:55:59 +0000
Received: by outflank-mailman (input) for mailman id 144025;
 Thu, 17 Jun 2021 14:55:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKGl=LL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lttQz-0002Tl-LH
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 14:55:57 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 244dcfc2-1b99-44ae-bf60-5ede6eb9e374;
 Thu, 17 Jun 2021 14:55:56 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5HEtt03l
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 17 Jun 2021 16:55:55 +0200 (CEST)
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
X-Inumbo-ID: 244dcfc2-1b99-44ae-bf60-5ede6eb9e374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623941755;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=UkMKWSslt6ZtDAj+DNeNKI2yGQmOSaLuVC7u9tB9URI=;
    b=bYHdj4xe1CYVIl5J4nu911eB3b5lMn1mh3E/jSVND+0wtDsEtbqqLQ/DJqJqXgcyZD
    AKjTxko1mwyCACaPTh1+M0KL8f9DRHgi97YM+RG74n4taGIwKDiJHJLtjN0iMIweepr0
    9dcX3Zd9aMIfFW4L2D2J+gm61MMbgVXlorK8KpSOwlkQ62+ijBW4otYKMbjB2IF76+Gt
    SynaUGeECcoR8eE/FXjXLeLKwQMDyR6PgYjeMu6j4y10tRnTvYK7YzJdnuUfLl2xhdm4
    tPf7ngYYFQD/qeOKbldO0ZS4ztqxZRKqGXIyDR+FQGKWl6E+x5uxOXtE3oJlyHvAcL39
    gOyw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Thu, 17 Jun 2021 16:55:40 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v20210616 00/36] leftover from 2020
Message-ID: <20210617165540.4bf22cc9.olaf@aepfle.de>
In-Reply-To: <861fbbdf-f3a6-ae1e-9487-b3ca37b30ca8@citrix.com>
References: <20210616125129.26563-1-olaf@aepfle.de>
	<968713af-3c99-3fe3-8378-9d9c3985098e@citrix.com>
	<20210616173831.5e8214bc.olaf@aepfle.de>
	<861fbbdf-f3a6-ae1e-9487-b3ca37b30ca8@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qJ.+Ad+bOPC4X91C4iQu7qr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qJ.+Ad+bOPC4X91C4iQu7qr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 Jun 2021 12:24:22 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 16/06/2021 16:38, Olaf Hering wrote:
> > Am Wed, 16 Jun 2021 15:50:24 +0100
> > schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
> > =20
> >> 32bit toolstack build =20
> > as in i386?
> > How is this used in practice? =20
> Every OSSTest run.

This is not what I mean.
I think there is a 32bit xen-tools, a 32bit dom0 kernel and a 64bit Xen?
Is 32bit xen-tools, 64bit dom0 kernel and 64bit Xen expected to work?

Olaf

--Sig_/qJ.+Ad+bOPC4X91C4iQu7qr
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDLYmwACgkQ86SN7mm1
DoDXoA/7B6oQsozyj9wS8rNoWM/eb/cRYx0HEoMB3xwKu1wf3jjkSfHH1l36cGR0
mLnWoMibpO0c/k0wap0vy6ZBjilN4soOryYz9Rl3FLn0kSQV8hEbfh8Z86OdjnHK
Xcg3OFBnBFCoSYDVi2mebpQJ7QrH41tFTUAgp5pusNLVcC+8XxNUwuU1k+QBaW8+
xuZwB5+y0PSFalT4jOxofc8ZPJDJybWCCjQ33GBvvHiV/0emItbUL7nYzhi36OmJ
QXiVmmHaLEWA7ZY+tsRzzZmPhBJpwVj6k3YH0U+0XLP5H6uiZ7DNlDBTFYx7snMC
//7ONwPKKCczwOvxROgzg+O6uzcWmCbhyGidczwJyN+9/lQzZIwFGN/qbuLeTzml
PhBChSkLvoKK+p5IrDDKlkhyReYvSv91lv0gPHBM2fVoNReN/0eTay2jlvFH7FDu
H9yPjBiUVR4javDuE4M+IveUf2yE8N/lVRpbdxwaLQUy0z/RXSp1SuJ5NKUOtBjL
38XltYngs6e4qM4OZaC4gQDoWVTa6PllT2o0JLm/o1o3ccYZfbp4FgOF5/EU7xZi
Fv3Z5QdwIJAZr0dZYEAhN7qEIZ//DD6Ew9sg070m5Mg1iNPATdkrHEeiczCC0+1P
yqGqui/Fyo+mvp+u6CrwqMKhm6V2kKyEn+PoFAU+GQT6wmj1YU8=
=ReOc
-----END PGP SIGNATURE-----

--Sig_/qJ.+Ad+bOPC4X91C4iQu7qr--

