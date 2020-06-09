Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD241F3C10
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:18:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jie9A-0007WK-A0; Tue, 09 Jun 2020 13:18:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jie98-0007WB-PZ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:18:30 +0000
X-Inumbo-ID: b45af7f0-aa53-11ea-b31f-12813bfff9fa
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b45af7f0-aa53-11ea-b31f-12813bfff9fa;
 Tue, 09 Jun 2020 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591708707;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=eJHGV41BtyQAam0J+s+OBHJIJPEiips8Xw6SXLrX+m8=;
 b=Jy39DC25024pGAf5JKSoOptlS29yd6F0vKvEdZv0n0ADeet1IE5RJs0tv3YEwpZbCl
 P9PHJMbLGsXPcS6aMqSvUa7PR/UNkbkTAxGYyPmWZOfUnZFGUQRmzBkwNRcK9Aq+2SW8
 zZYa69FhzYqtpY9u960l5uAgBSsFgMzoeDu5snx0DXKIXLsq1tyvBUiif05m0/mJkWGa
 JMqYO4LtGj0B79a0oAoMIx8ncMo+UYTLCXUaW2TqyQEKfdlgsQbYfaQAMonxL6icdSfZ
 jsI3ZIZ6+2q6lTJQmwttuPcE/g1l4zHAKar2Tey3804PEhpJ4VUtgA0Kl0mCJmmCzS7H
 f4Xg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w59DIPKuM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 15:18:25 +0200 (CEST)
Date: Tue, 9 Jun 2020 15:18:23 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2] libxl__prepare_sockaddr_un
Message-ID: <20200609151823.509cf395.olaf@aepfle.de>
In-Reply-To: <24287.34799.645497.809135@mariner.uk.xensource.com>
References: <20200608182539.29415-1-olaf@aepfle.de>
 <24287.34799.645497.809135@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VRTLKantihJdDl/E83V_LxT"; protocol="application/pgp-signature"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/VRTLKantihJdDl/E83V_LxT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 14:00:31 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

> Why do you not use strcpy here ?

Either variant of 'cpy' will work in this context. I decided to use memcpy =
for no specific reason.

Olaf

--Sig_/VRTLKantihJdDl/E83V_LxT
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fjB8ACgkQ86SN7mm1
DoBlrRAAgTAjXaiah0MWz+1pV4TK+CAEvd5YM3sEnQagOnQnbO/QCuNn+irVUbjX
E5TFUWWKt1DPoyQrfrTGOpaKn2XrvjnBkrNQmprBcEVzg4LancCPiGcy1xZeS6Xy
weDRKuEdauZifb4lNqQFj4zHYzH4ibPdkBamfANQKahQ+PVHlbgpqfUIp8oEt8kd
fHWl3MY4S/hzM4t3xl73fto8T7gBTTk6Bv5lhMgti4NbLDJS3Egkvgbvd5dzy5BT
Hr21aZILHVpqnWCNjBb21Nzu464hgv/pi9phWqeN+zDgiQ5sxIacCtU2hWSnFyGT
GntcVfwi5yJLC7ftOHPRLy6TroEKpDylrQzSkcK1LOvumOTjJy6rOxVLIrC9SwRw
VYa1Hl27k3VFseTEGNDaefJybu9yVnuDy5y1vJfX8m1B8dtpWmrJe7pzxSApat2G
4aTmdSRkwPheJMVS8/xOPXTr2H6zAY0hrdg6RmgZknBy7Ke7gwl0GuuF5CgEMtpH
YfPa5514seRUXan51aWgeg3OmDBhl3xyv3U96/kNR7/rB02XL1r05iegNIFkWfzE
HnYJqsItO2wuVOTnTZcHoNJqU6757yfMAVsbkH8CWsbn34y7gTe37agn9fEzlFET
zDLmCf1yjebZzbtN2fIaRqSCqUvTkcsg5R7DrZUzU3w3RiF8XwY=
=4WIx
-----END PGP SIGNATURE-----

--Sig_/VRTLKantihJdDl/E83V_LxT--

