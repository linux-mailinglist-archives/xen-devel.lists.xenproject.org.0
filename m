Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C61633FFF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447222.703193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV55-0008LN-R9; Tue, 22 Nov 2022 15:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447222.703193; Tue, 22 Nov 2022 15:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV55-0008IO-Nh; Tue, 22 Nov 2022 15:21:03 +0000
Received: by outflank-mailman (input) for mailman id 447222;
 Tue, 22 Nov 2022 15:21:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV53-00082v-T5
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453674ee-6a79-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 16:21:00 +0100 (CET)
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
X-Inumbo-ID: 453674ee-6a79-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U8Mtv4XJ0/V7GDXCKpr+dmKQ2P2iVaWXqmopORRTpv8=;
  b=XqtljNjkrgSEWkZba8m12/Fm83Jy19xqetAP/d2hZ+P2QnCMgsZ8cHGd
   0JhP1v2EeSXR14k+Lkkj26fERMcZdd5FmfrlqO5K+fvvxDl30E4mY8g2j
   grMjpqOyA3r4O7+sJToMVVzBnoqjekVfZFtZ3QB/2gM2jYWUmIp4FFDTj
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85763998
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hTo2yKt7nX/mPVa7uVC3M74eeefnVAReMUV32f8akzHdYApBsoF/q
 tZmKWqPaf+ON2ChfNklbdzloRkGvZSAn4JjTwBkrSBjQShH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaEzSFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMm5dcw+EnMiP/rfqZbhuqpk+NJbkBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27I+
 z2YpDWoUnn2MvTB4yie9Umj1tbhujHDVpgwL+K176Zl1Qj7Kms7V0RNCArTTeOCokK3Rd93M
 UEf/Ssq668o+ySDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qHqOeJsjSpExErKD4tNC0oEBYdvNba9dRbYg30cjpzLEKkpoSrR2Cok
 2vT/XlWa6Y71pBSifjilbzTq3f1/8WSEFZojunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zfWNEkqQQzd6TNDhz0k5NjFKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX0PPcqPtzuUZp0ksAM8OgJsdiNPrJzjmVZLlfbrEmCm2bNt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1iNcWK+FX7T27eK0XODz9jObOPyfME+9t3ZnnRrlR0Z5oaT79q
 753X/ZmAT0GOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:DuguTqnm83TML+DVJOEj+peXo6TpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="85763998"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 4/8] tools/ocaml/evtchn: Extend the init() binding with a cloexec flag
Date: Tue, 22 Nov 2022 15:20:39 +0000
Message-ID: <20221122152043.8518-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

For live update, oxenstored wants to clear CLOEXEC on the evtchn handle, so it
survives the execve() into the new oxenstored.

Have the new interface match how cloexec works in other Ocaml standard
libraries.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Split out of combined patch
---
 tools/ocaml/libs/eventchn/xeneventchn.ml      |  5 ++++-
 tools/ocaml/libs/eventchn/xeneventchn.mli     |  9 ++++++---
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 10 +++++++---
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn.ml b/tools/ocaml/libs/eventchn/xeneventchn.ml
index be4de82f46b9..c16fdd4674f7 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.ml
+++ b/tools/ocaml/libs/eventchn/xeneventchn.ml
@@ -16,7 +16,10 @@
 
 type handle
 
-external init: unit -> handle = "stub_eventchn_init"
+external _init: bool -> handle = "stub_eventchn_init"
+
+let init ?(cloexec=true) () = _init cloexec
+
 external fdopen: Unix.file_descr -> handle = "stub_eventchn_fdopen"
 external fd: handle -> Unix.file_descr = "stub_eventchn_fd"
 
diff --git a/tools/ocaml/libs/eventchn/xeneventchn.mli b/tools/ocaml/libs/eventchn/xeneventchn.mli
index 98b3c86f3702..870429b6b53a 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.mli
+++ b/tools/ocaml/libs/eventchn/xeneventchn.mli
@@ -43,9 +43,12 @@ val to_int: t -> int
 
 val of_int: int -> t
 
-val init: unit -> handle
-(** Return an initialised event channel interface. On error it
-    will throw a Failure exception. *)
+val init: ?cloexec:bool -> unit -> handle
+(** [init ?cloexec ()]
+    Return an initialised event channel interface.
+    The default is to close the underlying file descriptor
+    on [execve], which can be overriden with [~cloexec:false].
+    On error it will throw a Failure exception. *)
 
 val fdopen: Unix.file_descr -> handle
 (** Return an initialised event channel interface, from an already open evtchn
diff --git a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
index 7bdf711bc150..aa8a69cc1ecb 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
+++ b/tools/ocaml/libs/eventchn/xeneventchn_stubs.c
@@ -50,14 +50,18 @@ static struct custom_operations xenevtchn_ops = {
 	.compare_ext = custom_compare_ext_default, /* Can't compare     */
 };
 
-CAMLprim value stub_eventchn_init(void)
+CAMLprim value stub_eventchn_init(value cloexec)
 {
-	CAMLparam0();
+	CAMLparam1(cloexec);
 	CAMLlocal1(result);
 	xenevtchn_handle *xce;
+	unsigned int flags = 0;
+
+	if ( !Bool_val(cloexec) )
+		flags |= XENEVTCHN_NO_CLOEXEC;
 
 	caml_enter_blocking_section();
-	xce = xenevtchn_open(NULL, 0);
+	xce = xenevtchn_open(NULL, flags);
 	caml_leave_blocking_section();
 
 	if (xce == NULL)
-- 
2.11.0


