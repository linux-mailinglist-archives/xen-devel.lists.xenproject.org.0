Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E03161BB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 10:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83499.155552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lRz-0003ax-RQ; Wed, 10 Feb 2021 09:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83499.155552; Wed, 10 Feb 2021 09:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lRz-0003aY-Nz; Wed, 10 Feb 2021 09:06:19 +0000
Received: by outflank-mailman (input) for mailman id 83499;
 Wed, 10 Feb 2021 09:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oq3b=HM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l9lRy-0003aT-MN
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 09:06:18 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99846e07-2bca-4cbe-a49b-d309fd568cb8;
 Wed, 10 Feb 2021 09:06:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 604447x1A96D46z
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 Feb 2021 10:06:13 +0100 (CET)
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
X-Inumbo-ID: 99846e07-2bca-4cbe-a49b-d309fd568cb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612947976;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=o2zy8YJhH4SinklC41ksuuoPwiukLp/2mXQaUSvxX0s=;
	b=jg6ANq+InhImUDGHn1rCWk4xchpMnULsWfTGtpp4b0AY8Y6LpY2gxtdi6FGvsy8VUV
	fW2sLZmLlBdQ6FCWRrQnkcXqFDKa2/zKS6hsOZCVMN8XwXSrnKVnpchNWwBZVzY5DgTr
	zMgswyWz+HAEzEyyXfcpG/MpF1w5LCbqQwumOCxJnOQV62e1bPpF++MM9VdGdL3RlJ9V
	wte0jtc70Ih4KPLuF2dOauSeO42PmQ2rjjOPc0KNomq41oYumoUR3jPqEa9yyRL0zl1h
	84P76XLGQWQzHtZHm9XAxqI/5kEflL1RYcgE7FybaVF4che+swfBVxvx2MRfsehZLga8
	Q96g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Wed, 10 Feb 2021 10:06:06 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 4/4] xl: disable --debug option for xl migrate
Message-ID: <20210210100606.45de7991.olaf@aepfle.de>
In-Reply-To: <24610.49788.493621.307069@mariner.uk.xensource.com>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-5-olaf@aepfle.de>
	<24610.49788.493621.307069@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6cPC=H_55pXAQgsSe3Vgr/P"; protocol="application/pgp-signature"

--Sig_/6cPC=H_55pXAQgsSe3Vgr/P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Feb 2021 17:12:28 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> It seems to me that something is definitely a bug here but I want to
> understand from Andy what the best thing to do is.  I'm hesitant to
> release-ack removing this at this stage.
>=20
> Wouldn't it be better to just fix the docs like in your previously
> suggested patch ?

To make that initial patch accurate, this additional change is required:

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -752,7 +752,7 @@ static int send_domain_memory_live(struct xc_sr_context=
 *ctx)
     if ( rc )
         goto out;
=20
-    if ( ctx->save.debug && ctx->stream_type !=3D XC_STREAM_PLAIN )
+    if ( ctx->save.debug )
     {
         rc =3D verify_frames(ctx);
         if ( rc )

Otherwise there is no way for "xl" to trigger a call into verify_frames.

I will test this patch today.


Olaf

--Sig_/6cPC=H_55pXAQgsSe3Vgr/P
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAjof4ACgkQ86SN7mm1
DoBkZw//Rp/wSMuDlOvHeAxuQlzEseQAtIP0YDoKUqRsICFpZOU+wTdEaQMUN60n
7WwpAefo9zIHSiiqxFGyb/nANE5AN6ZNx06Brk+cxMAQpG3593s2sOXWi//6Q+O1
jxs/ya9cfwvbCWDx9D7FIGbIxrnqA6NNzhzKUktkYulh+UqPoSBYmsCw09NEm90i
dJfN0KywOKc1N44s+wojV7le3sxMRxgBEZtHCtwW4HmlxmpgR2eO3de9FfhxcqLB
84scMTqYi6K4bon+VDGV3btIgJSfRh65Js/1t8Nx9Z12E1XcI0D8cEGnBBFonkDt
xbIVCxDH8176f6kQ9MxgA3s4wk1S3QWDrHsQBG49QuVAxmpwgsjWDFI8BRfR50YS
xIG4mYV+Ka1IwQXbe7z2MskWYpYuCOarOwsd0w2TACpXC3UnSqJbggI00XC4xuv+
UOxXSuvZUKPgdu8SWq9UfPzZPWyYZGW9CegqObGB7uLBjSANX0hgpOQeeSlacYBy
cQhrYnuxi5alqDiuHfpYZ0b2WvhdfmWv4XYRYlckW0Rxr/6oGv2D1Ez1PxtZirpo
iUxDMvkeEm54dTITlQPxgGAgPHwHrZsisFZ4HIT56WZ0dxyuWFjmytAJWkm7POmV
xCs8nt21q5OnHWYe2z0Ba9EH2rGOLuQSEIlPISJCXcHHgnA0u+A=
=euQG
-----END PGP SIGNATURE-----

--Sig_/6cPC=H_55pXAQgsSe3Vgr/P--

