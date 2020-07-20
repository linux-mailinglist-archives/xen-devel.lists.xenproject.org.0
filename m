Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED882259F8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 10:26:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxR7H-0006cj-38; Mon, 20 Jul 2020 08:25:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdB1=A7=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1jxR7F-0006ce-H2
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 08:25:41 +0000
X-Inumbo-ID: 98637124-ca62-11ea-98f0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98637124-ca62-11ea-98f0-12813bfff9fa;
 Mon, 20 Jul 2020 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595233541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=49QGHBHrZRjI696+RtSO5XA7ajoUpU7QjWNgVJCHooY=;
 b=HxyrxGPk4R7HlrBYu3byoyLpP+icu39O+U1JwEmye/yE2w8e8ddYWiR1
 sPVjaTbXE3X+r9JXPRHLc0wVw66GFNsLhaLL5Gk8jRod7j4jfIo5gFoaB
 IwJcwKfq0IcJ+50fVn68BglmmTdw3W7aUUuAWVaQbLAWdbFxTbh3Kjgjw w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 75N3jJDKQ8VkZh15pqalXUltCYUKJFpfnL5iGz9RbtVQTXvKU1gvTf8kH9NZFGoIZ8lqAJg7Ko
 Yl8e7cd7riFRjQPBk1JV4TFoKMUtgZXVyU0mlMF6qOTEmGzr4Mo1pNnbKRUikfNbYf5Ad+SuHk
 0iOYp51nbh45vWYKTofsH6jPYMoDYX5hxpqMt7BAxQoMdMaHBoZxs2Qs+meUC/d4FhhfwRuDf6
 iohbT20W+ivBQU/ND69IsqDUeZ3zrfgvRCSpwb4gTqaarFC4fvLTc8QEmKD6N/3M7YQJSpLiom
 QhQ=
X-SBRS: 2.7
X-MesageID: 23056332
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23056332"
From: Christian Lindig <christian.lindig@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Subject: Re: [PATCH 1/2] Partially revert "Cross-compilation fixes."
Thread-Topic: [PATCH 1/2] Partially revert "Cross-compilation fixes."
Thread-Index: AQHWXLPw2WXAlvhnbky26RJ8a7SJFqkQJQKp
Date: Mon, 20 Jul 2020 08:25:36 +0000
Message-ID: <1595233536312.59307@citrix.com>
References: <20200718033121.GA88869@mattapan.m5p.com>
In-Reply-To: <20200718033121.GA88869@mattapan.m5p.com>
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
Sent: 18 July 2020 04:31=0A=
To: xen-devel@lists.xen.org=0A=
Cc: Ian Jackson; wl@xen.org; Christian Lindig; dave@recoil.org=0A=
Subject: [PATCH 1/2] Partially revert "Cross-compilation fixes."=0A=
=0A=
This partially reverts commit 16504669c5cbb8b195d20412aadc838da5c428f7.=0A=
=0A=
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>=0A=
---=0A=
Doesn't look like much of 16504669c5cbb8b195d20412aadc838da5c428f7=0A=
actually remains due to passage of time.=0A=
=0A=
Of the 3, both Python and pygrub appear to mostly be building just fine=0A=
cross-compiling.  The OCAML portion is being troublesome, this is going=0A=
to cause bug reports elsewhere soon.  The OCAML portion though can=0A=
already be disabled by setting OCAML_TOOLS=3Dn and shouldn't have this=0A=
extra form of disabling.=0A=
---=0A=
 tools/Makefile | 3 ---=0A=
 1 file changed, 3 deletions(-)=0A=
=0A=
diff --git a/tools/Makefile b/tools/Makefile=0A=
index 7b1f6c4d28..930a533724 100644=0A=
--- a/tools/Makefile=0A=
+++ b/tools/Makefile=0A=
@@ -40,12 +40,9 @@ SUBDIRS-$(CONFIG_X86) +=3D debugger/gdbsx=0A=
 SUBDIRS-$(CONFIG_X86) +=3D debugger/kdd=0A=
 SUBDIRS-$(CONFIG_TESTS) +=3D tests=0A=
=0A=
-# These don't cross-compile=0A=
-ifeq ($(XEN_COMPILE_ARCH),$(XEN_TARGET_ARCH))=0A=
 SUBDIRS-y +=3D python=0A=
 SUBDIRS-y +=3D pygrub=0A=
 SUBDIRS-$(OCAML_TOOLS) +=3D ocaml=0A=
-endif=0A=
=0A=
 ifeq ($(CONFIG_RUMP),y)=0A=
 SUBDIRS-y :=3D libs libxc xenstore=0A=
--=0A=
2.20.1=0A=
=0A=
-- =0A=
Acked-by: Christian Lindig <christian.lindig@citrix.com>=0A=
=0A=

