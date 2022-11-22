Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4E633FFE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447223.703204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV58-0000AQ-2L; Tue, 22 Nov 2022 15:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447223.703204; Tue, 22 Nov 2022 15:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV57-000082-VQ; Tue, 22 Nov 2022 15:21:05 +0000
Received: by outflank-mailman (input) for mailman id 447223;
 Tue, 22 Nov 2022 15:21:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV56-00082v-PN
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46e43b0a-6a79-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 16:21:03 +0100 (CET)
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
X-Inumbo-ID: 46e43b0a-6a79-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6E4HgUtQnG7TB7MNmlWax1xF4tEg2WobhRgUJRbXoKQ=;
  b=U2Rn5APIPiuwBCJiWQcdJ0UjhuEb8UJAUIisoPRaiN6JTQT31ktj7Vwz
   3CUA2goMCvgneFuXxMdpq0Km2umO96z+T4N9UgYOoLsNrNPwpylGtUFsg
   2xCiTGTb2H/Vvu0JhbP9sovkZPj3NVbyVbKYH4GA0f6QtzaphrYkxbxfv
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85764000
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HQRBuKs4bJThSIADhW0/O2NsY+fnVAReMUV32f8akzHdYApBsoF/q
 tZmKW7SPvqOZDD0fo0ibti3p0pU6sPczIc3TgVoryxgFS0Q+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaEzSFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcBtQRAuupemM5Z2RZftghtQ6FdS3BdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27I+
 z2YozyhWnn2MvS/7hne0VGjmdPivnymAqVCRL3p7KRD1Qj7Kms7V0RNCArTTeOCokK3Rd93M
 UEf/Ssq668o+ySDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1rF3eq+th6QMhIwAkUtdyMEXRI8/oXa9dRbYg30cjpzLEKkpoSrR2Cok
 2vT/XlWa6Y71pBSifjilbzTq3f1/8WSEFZojunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zfWNEkqQQzd6TNDhz0k5NjFKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX0PPcqPtzuUZp0ksAM8OgJsdiNPrJzjmVZLlfbrEmCm2bNt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1iNcWK+FX7T27eK0XODz9jObOPyfME+9t3ZnnRrlR0Z5oaT79q
 753X/ZmAT0FOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:0z8GkanO82M7V452K5Cr/YkwRrDpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7gr5OUtQ/uxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyIMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="85764000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 6/8] tools/oxenstored: Log live update issues at warning level
Date: Tue, 22 Nov 2022 15:20:41 +0000
Message-ID: <20221122152043.8518-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

During live update, oxenstored tries a best effort approach to recover as many
domains and information as possible even if it encounters errors restoring
some domains.

However, logging about misunderstood input is more severe than simply info.
Log it at warning instead.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/xenstored/xenstored.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 6ceab02dee1e..23621bd49397 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -184,9 +184,9 @@ let from_channel_f chan global_f event_f socket_f domain_f watch_f store_f =
 					        (Perms.Node.of_string (unhexify perms ^ "\000"))
 					        (unhexify value)
 				| _ ->
-					info "restoring: ignoring unknown line: %s" line
+					warn "restoring: ignoring unknown line: %s" line
 			with exn ->
-				info "restoring: ignoring unknown line: %s (exception: %s)"
+				warn "restoring: ignoring unknown line: %s (exception: %s)"
 				     line (Printexc.to_string exn);
 				()
 		with End_of_file ->
-- 
2.11.0


