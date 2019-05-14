Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BA1C484
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 10:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQSaa-0000wF-7M; Tue, 14 May 2019 08:15:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQSaY-0000w9-4b
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 08:15:06 +0000
X-Inumbo-ID: 60329018-7620-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::6])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 60329018-7620-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557821703;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Lm8jE2+HzjJITXBz+9sesjLf+bWU/BNjPMQioBLOLOU=;
 b=m1WAOCHtPhLeJSB0fqY6J4mpmZ48coWEVx+YAvNslGTxtg1PCxZmkqO4HC3XubKq5F
 voXpnp1hEgojtP5/uNr16zlTDvs1EG2/FRJR+E3Pl6te3lyvnv9Qln+u/gS4hpKqAoSV
 rOYZUuTeyIl1OAF3YAWX+hRBj41JBxGxnSuOSd5eQsVCKUbrrAzawKIJaHk0WrG/5Omf
 kRySJtM0ZMI+JZDxWH+jBYuGPi++pSw8lOGnNkHsS6grkop9zAekqgMA8+aw4QsL0N4X
 HaDPxiXuPGSAgHw9po4uGbWR/RvMdtr8QSVe3yEwc86Vd/UxjRdMp+40jdSTTZp6nOh8
 0OQw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxvZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4E8Eu4QB
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 14 May 2019 10:14:56 +0200 (CEST)
Date: Tue, 14 May 2019 10:14:52 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190514101452.10c40b6e.olaf@aepfle.de>
In-Reply-To: <20190514080558.14540-1-olaf@aepfle.de>
References: <20190514080558.14540-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0975701872615336832=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0975701872615336832==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/8_sG1PWKO5Z3DkANiIxesBR"; protocol="application/pgp-signature"

--Sig_/8_sG1PWKO5Z3DkANiIxesBR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 10:05:58 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> @@ -459,7 +461,9 @@ int libxl__domain_resume(libxl__gc *gc, uint32_t domi=
d, int suspend_cancel)
>          goto out;
>      }
> =20
> -    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> +    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
> +        libxl__device_model_version_running(gc, domid) =3D=3D
> +        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
>          rc =3D libxl__domain_resume_device_model(gc, domid);
>          if (rc) {
>              LOGD(ERROR, domid, "failed to resume device model:%d", rc);

I think this could be done like that instead, so that libxl__device_model_v=
ersion_running
is called just once:

--- a/tools/libxl/libxl_dom_suspend.c
+++ b/tools/libxl/libxl_dom_suspend.c
@@ -444,6 +444,8 @@ int libxl__domain_resume_device_model(libxl__gc *gc, ui=
nt32_t domid)
         if (libxl__qmp_resume(gc, domid))
             return ERROR_FAIL;
         break;
+    case LIBXL_DEVICE_MODEL_VERSION_NONE:
+        break;
     default:
         return ERROR_INVAL;
     }
@@ -461,14 +463,10 @@ int libxl__domain_resume(libxl__gc *gc, uint32_t domi=
d, int suspend_cancel)
         goto out;
     }
=20
-    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
-        libxl__device_model_version_running(gc, domid) =3D=3D
-        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
-        rc =3D libxl__domain_resume_device_model(gc, domid);
-        if (rc) {
-            LOGD(ERROR, domid, "failed to resume device model:%d", rc);
-            goto out;
-        }
+    rc =3D libxl__domain_resume_device_model(gc, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "failed to resume device model:%d", rc);
+        goto out;
     }
=20
     if (xc_domain_resume(CTX->xch, domid, suspend_cancel)) {


While it is easy for the resume path, doing the same in the suspend path
needs more changes. libxl__domain_suspend_device_model would need to receive
the callback and set it if a device model is active.

Should this be done on top of this change?

Olaf

--Sig_/8_sG1PWKO5Z3DkANiIxesBR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNp4/AAKCRBdQqD6ppg2
fuF0AJ45yZ0+FmU4ej3jZBqXIeadW51Q1QCgm9BbTkX9BDcF1hjKCBRDtvz7+mw=
=0uEf
-----END PGP SIGNATURE-----

--Sig_/8_sG1PWKO5Z3DkANiIxesBR--


--===============0975701872615336832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0975701872615336832==--

