Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42E2259FC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 10:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxR7f-0006ec-DJ; Mon, 20 Jul 2020 08:26:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdB1=A7=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1jxR7d-0006eR-Fb
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 08:26:05 +0000
X-Inumbo-ID: a60c8a4a-ca62-11ea-98f0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a60c8a4a-ca62-11ea-98f0-12813bfff9fa;
 Mon, 20 Jul 2020 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595233563;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=guNi4ozQsd81IcNwzgCs24VYy4hVc9xWBLSEsepPGAw=;
 b=VCSNM1eLchfnWRzSpjaWeGW3K9YmHcz1qMeDhYJO24h7N1fOfEdTfYUv
 1w/3slnbhgNu6uSU/VXhp0IebDdsuvYdFb3FauLVumHKND6ajYlTt0pP9
 94fW2NwYyeYf6aQHXsi8Y+uQ+qYdjTqCIZ3qiz+nf2UbpNCTuIRd3OoUM A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Su7dpSSVRAR/UfzOeBg1WbNzJuw6nJzBsmnvhCxsuU+bizGeoACTzsP1bpNb89Ofx72pMP+hi1
 qdpg+WDo2DOuk0KaFWALa6yn6PMvCfx79q53+1Go7AOyLFn/uqCedGCIRYpS6gTlzpaUpngz13
 tOPpa6g3cj99fVH9L432HMrH80+3m6xJL3WSK8LZJ0KOHzTsZ6fQNZ+51nKixpc2KAKKwyb9nq
 6y1osa5XAGimHlsL/rh8doiAlY1zolagx4jfW9q8xoYx4IQuqk5c0DXmsjEFJQQOgn9Mcx31Ct
 IkI=
X-SBRS: 2.7
X-MesageID: 22925651
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22925651"
From: Christian Lindig <christian.lindig@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Subject: Re: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Topic: [PATCH 2/2] tools/ocaml: Default to useful build output
Thread-Index: AQHWXLQfZqk/9n2Ez0iUq9XU56BN2qkQJVSq
Date: Mon, 20 Jul 2020 08:25:59 +0000
Message-ID: <1595233559536.460@citrix.com>
References: <20200718033242.GB88869@mattapan.m5p.com>
In-Reply-To: <20200718033242.GB88869@mattapan.m5p.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "dave@recoil.org" <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

=0A=
________________________________________=0A=
From: Elliott Mitchell <ehem+xen@m5p.com>=0A=
Sent: 18 July 2020 04:32=0A=
To: xen-devel@lists.xen.org=0A=
Cc: Ian Jackson; wl@xen.org; Christian Lindig; dave@recoil.org=0A=
Subject: [PATCH 2/2] tools/ocaml: Default to useful build output=0A=
=0A=
While hiding details of build output looks pretty to some, defaulting to=0A=
doing so deviates from the rest of Xen.  Switch the OCAML tools to match=0A=
everything else.=0A=
=0A=
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>=0A=
---=0A=
=0A=
Time for a bit of controversy.=0A=
=0A=
Presently the OCAML tools build mismatches the rest of the Xen build.=0A=
My choice is to default to verbose output.  While some may like beauty=0A=
in their build output, function is far more important.=0A=
=0A=
If someone wants to take on the task of making Xen's build output=0A=
consistently beatiful, invite them to do so.  Then call the police and=0A=
tell them you're being robbed.=0A=
---=0A=
 tools/ocaml/Makefile.rules | 19 +++++++++++--------=0A=
 1 file changed, 11 insertions(+), 8 deletions(-)=0A=
=0A=
diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules=0A=
index a893c42b43..abfbc64ce0 100644=0A=
--- a/tools/ocaml/Makefile.rules=0A=
+++ b/tools/ocaml/Makefile.rules=0A=
@@ -1,17 +1,20 @@=0A=
 ifdef V=0A=
-  ifeq ("$(origin V)", "command line")=0A=
-    BUILD_VERBOSE =3D $(V)=0A=
-  endif=0A=
+       ifeq ("$(origin V)", "command line")=0A=
+               BUILD_VERBOSE =3D $(V)=0A=
+       endif=0A=
+else=0A=
+       V :=3D 1=0A=
+       BUILD_VERBOSE :=3D 1=0A=
 endif=0A=
 ifndef BUILD_VERBOSE=0A=
-  BUILD_VERBOSE =3D 0=0A=
+       BUILD_VERBOSE :=3D 0=0A=
 endif=0A=
 ifeq ($(BUILD_VERBOSE),1)=0A=
-  E =3D @true=0A=
-  Q =3D=0A=
+       E :=3D @true=0A=
+       Q :=3D=0A=
 else=0A=
-  E =3D @echo=0A=
-  Q =3D @=0A=
+       E :=3D @echo=0A=
+       Q :=3D @=0A=
 endif=0A=
=0A=
 .NOTPARALLEL:=0A=
--=0A=
2.20.1=0A=
=0A=
-- =0A=
Acked-by: Christian Lindig <christian.lindig@citrix.com>=0A=
=0A=

