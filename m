Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669DF18D71
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 17:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlNh-0000ao-Nf; Thu, 09 May 2019 15:54:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOlNg-0000af-0f
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:54:48 +0000
X-Inumbo-ID: c44f3b49-7272-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c44f3b49-7272-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557417285;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/+7OGaR1FMVEHZDSvxcDB6tPGZcFr0ZJFA1w+q1TgNE=;
 b=AL4F2cmR0zrsg//W0Ngt2c7/OEZ4NlvfN51B+BmuoIWr1LFriOgvYZX7oXZPlnqV3m
 AaIXy6laARXmwXNNm62G+sQEGhr5r+Ujwb/slqmv1KxXBRgipR+Z7cVd7VMRw0lBbWom
 UtRH7YVXrqFQ8BOtSBsiWmWkqJj+Z0jXvdchyip60EBkNvtAGkgrxUxlPQOblZlBUBok
 meP7U63Z9Ex8SYOqQvYpUTjO2DN677ZBRnmgPVqo6jdfqoj8StNDuxDskjd26klul9Nj
 XnOlveGDDI8UGpTKFESz9XlByqRa+QKWr58DO7mo+9q/WLXHtG2ZMCeWl2BRDrEv7NGs
 m1LQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 AUTH)
 with ESMTPSA id 60a847v49FsgpAh
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 9 May 2019 17:54:42 +0200 (CEST)
Date: Thu, 9 May 2019 17:54:38 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190509175438.3e2016b8.olaf@aepfle.de>
In-Reply-To: <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190503161132.06f85271.olaf@aepfle.de>
 <20190503152953.xcisr7n2bs4v76mi@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============8068243078317855378=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8068243078317855378==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/FdAqCfT2kv=9aHSrGEWCouQ"; protocol="application/pgp-signature"

--Sig_/FdAqCfT2kv=9aHSrGEWCouQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 3 May 2019 17:29:53 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> On Fri, May 03, 2019 at 04:11:32PM +0200, Olaf Hering wrote:
> > Am Fri, 3 May 2019 13:04:11 +0200
> > schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:
> >  =20
> > > Wouldn't it be easier to leave libxl__need_xenpv_qemu alone and just
> > > use the contents of the migration stream to decide whether to launch a
> > > QEMU for the PV backends or not? ie: just parsing the domain config on
> > > the migration stream should be enough for the destination side to
> > > decide whether a QEMU is needed in order to handle the PV backends? =
=20
> >=20
> > I think that is done anyway. How would the receiving side know what to =
do? =20
>=20
> Hm, OK. I will wait for v3 with the domid stuff fixed.

I think it will be as simple as this. In the end b_info.device_model_version
must be set prior the call to store_libxl_entry.

--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -92,9 +92,6 @@ int libxl__domain_build_info_setdefault(
             } else {
                 b_info->device_model_version =3D libxl__default_device_mod=
el(gc);
             }
-        } else {
-            b_info->device_model_version =3D
-                LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
         }
         if (b_info->device_model_version
                 =3D=3D LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
@@ -969,6 +966,18 @@ static void initiate_domain_create(libxl
     dcs->sdss.dm.guest_domid =3D 0; /* means we haven't spawned */
=20
     /*
+     * libxl__domain_build_info_setdefault sets this only for HVM
+     * set it before store_libxl_entry()
+     */
+    if (d_config->b_info.device_model_version
+        =3D=3D LIBXL_DEVICE_MODEL_VERSION_UNKNOWN) {
+        ret =3D libxl__need_xenpv_qemu(gc, d_config);
+        if (ret > 0)
+            d_config->b_info.device_model_version =3D
+                LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
+    }
+
+    /*
      * Set the dm version quite early so that libxl doesn't have to pass t=
he
      * build info around just to know if the domain has a device model or =
not.
      */
--- a/tools/libxl/libxl_dom_suspend.c
+++ b/tools/libxl/libxl_dom_suspend.c
@@ -377,7 +377,9 @@ static void domain_suspend_common_guest_
     libxl__ev_xswatch_deregister(gc, &dsps->guest_watch);
     libxl__ev_time_deregister(gc, &dsps->guest_timeout);
=20
-    if (dsps->type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
+    if (dsps->type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
+        libxl__device_model_version_running(gc, dsps->domid) =3D=3D
+        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
         rc =3D libxl__domain_suspend_device_model(gc, dsps);
         if (rc) {
             LOGD(ERROR, dsps->domid,
@@ -460,7 +462,9 @@ int libxl__domain_resume(libxl__gc *gc,
         goto out;
     }
=20
-    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
+    if (type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
+        libxl__device_model_version_running(gc, domid) =3D=3D
+        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
         rc =3D libxl__domain_resume_device_model(gc, domid);
         if (rc) {
             LOGD(ERROR, domid, "failed to resume device model:%d", rc);

Olaf

--Sig_/FdAqCfT2kv=9aHSrGEWCouQ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNRNPgAKCRBdQqD6ppg2
fvebAKDe6FsCsOHkhdHbwMbHgEOpVwkBLwCg95YPnF2rMnKYbHUF7OQdx3CqFrk=
=F0es
-----END PGP SIGNATURE-----

--Sig_/FdAqCfT2kv=9aHSrGEWCouQ--


--===============8068243078317855378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8068243078317855378==--

