Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B524D206
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k942L-0006sW-Lj; Fri, 21 Aug 2020 10:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cDMa=B7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1k942I-0006sE-29
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:12:40 +0000
X-Inumbo-ID: f033baaa-4fb1-46d5-93a8-ebb03960ef8e
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f033baaa-4fb1-46d5-93a8-ebb03960ef8e;
 Fri, 21 Aug 2020 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598004755;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:Cc:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=yDScki7LVBF/OMK4i9Zan/qzWnU781I0F33uEZg/VSc=;
 b=Zza7FlIFY8TBoNbCLaUWZjgLJ5JsF8IWNEbKH1Gm7jnDtBixhtYI2hMblOrLQRivei
 f/Tgt+Tllv44juplKmh3nFReRS03p4uNJPjB3hJI6Zj9lrhi6Q/AHRcasU/a3HdaiMJX
 BbPJSaS5ApasHlOeUf5KMQ8NHcSecylKH2s97QPvqR3wewxERWNRUSp6Dzwc31+k0gjD
 bOABGXWAZ8nnAO8Jo0BK3PsboWiVHRZU4sBgWwkkpHXv8Y+62WZ9PFeKmYq4SWpkj37+
 3Fd2SpFC7fiHFF4poJiXnr5PuEgRErP1j2oHWnhHMU7twd8HsuoPPh/lrWvyyoEWDBhP
 gU4w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWe6X"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id 60ad29w7LACWAIr
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 21 Aug 2020 12:12:32 +0200 (CEST)
Date: Fri, 21 Aug 2020 12:12:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: shared features in cpuid
Message-ID: <20200821121224.24cecb4e.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.07.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UojaCl4ZRN7UbfvfmYMHGNj"; protocol="application/pgp-signature"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/UojaCl4ZRN7UbfvfmYMHGNj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

While reviewing changed behavior in 'xen-cpuid -d' output between Xen 4.8 a=
nd 4.9 I found commit 20e92c97f904aa460e2223c30dcad36c234496b6 ("x86/cpuid:=
 Only recalculate the shared feature bits once").

I wonder what the mentioned "cross-vendor case" in the comment, which was r=
emoved from sanitise_featureset(), really means.

Does Xen attempt to support domU migration between AMD and Intel hardware?


Olaf

--Sig_/UojaCl4ZRN7UbfvfmYMHGNj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl8/nggACgkQ86SN7mm1
DoBgIA//cwPi82/1a2+cSrGidqs66swizt2JrGIN48P9dremL9ojqmBZZH1gBfwD
/1YG3Rp6q+6fxZjf3YfMM7DHXRzzjd43bYay/6N+vspcaCk1Y31ajzHHuPbOlF+G
pADigU6m2FTaVPHSobhN4VhWlA73QtvSoxrCeWhRtBCsHnUGmm9M7w362hFmPLhC
dEgz/lneMX2hQpGdjltzvFBH5Xg/YyLgDrBMMfV+PGsqgqNDOhISozyXRiukoUS/
AQVr9vOeO0XzzZ3LKkTAKNDlz1jP7C7YpYU7/jkA8ESNc2VnWZoW44EnbVS3X763
ln4YbkQOTAmNKEQLU7igsZI98XoEypv4BbSL8TCY5ZfYgssIxb7aCSn9YRsXkXlU
ILQ49ubzSoq62ypqEkPM3aYmMKLWgNa9JnEKuzQPOeZgW08qtJJPWiKp7YOlIN/o
N3yfH6nlYDbvBDIOc/iFk1e4LJQryR8chddpBWDFVVE4yn9ZFHhVwXFCrRM2O2I7
Ciz9APgZutVtugnE1K3qfBuapSfKqway75a5RjaujQo6zX4I95aOCGUcA+fQrbrj
aCCpG2H6OKVigT/21scbLWnoUtAnh7/SgeTqlAKL+88IebAEb7BGgkDKh9oSN498
96O5DxnCqd5qOXC7jDTtrZBtY3lo8ftpKEToxS1QKyuh+q+E1qU=
=RDqJ
-----END PGP SIGNATURE-----

--Sig_/UojaCl4ZRN7UbfvfmYMHGNj--

