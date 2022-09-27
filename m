Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C65EC0D8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412492.655860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Z0-0008WV-VV; Tue, 27 Sep 2022 11:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412492.655860; Tue, 27 Sep 2022 11:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Z0-0008UN-Ph; Tue, 27 Sep 2022 11:15:46 +0000
Received: by outflank-mailman (input) for mailman id 412492;
 Tue, 27 Sep 2022 11:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1od8Yy-0008Aw-VC
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:15:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba0b8664-3e55-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 13:15:43 +0200 (CEST)
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
X-Inumbo-ID: ba0b8664-3e55-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664277343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i9j+DS3NCVDB/s2QnXaos+vP3Fy3tX4CBUXsBsSBVAM=;
  b=HBO9s75+laZrXv27uVVi1ge38CVQaNrjuB6O82F7/0FOVov7pHRTQ6ak
   eBZA2OtEdZhHGVOgAZDk14emjf5UilVdiXifM4MJTe+8N5y0hDamxb9t7
   22YZc1JMv/h2+dEP9H/GNGa3pMTyxdkxXkKcwvRGlp5OJI6SsUp2lcD0u
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 83941731
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8CpxNKhq1oOJ9R5TrLC4RYibX161HxAKZh0ujC45NGQN5FlHY01je
 htvXmiDbP+CYTake98jPNuy9R9TsJ/WyddrSwduqH1nRCkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UgHUMja4mtC5ARvP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KURE+
 f8ALi0KUhG43tm62Y2DEPRKxf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tOqkmHj5NSFfslWWjaE2/3LS3Ep6172F3N/9KofbGZwKxR/wS
 mTuzXrSRTolbvGkyxG4+1Osp77yxCz/YddHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pTI
 lIZ0jAjpq8z8AqsVNaVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8iDm+OjATMGg+ZBRddgcc3OG5vadwt0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8N5n9hO0yT5FWy13N2ZDBgBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66KMoAXPcUgJF7frUmCgHJ8OEiy+HXAbIllY
 cvLGSpSJS9y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfMEd843K6mNL9RAFWs/FqIq
 L6y9qKil31ibQEJSnKOqdJOcQ1WRZX5bLivw/Fqmie4ClIOMAkc5zX5m9vNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:/1VZrqpYxodFXY5py2WofDAaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="83941731"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/5] tools/ocaml/Makefile.rules: hide -include on *clean
Date: Tue, 27 Sep 2022 12:14:58 +0100
Message-ID: <074e66ae5f53522361ff0fdae105a3b7f70de0d4.1664276827.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664276827.git.edvin.torok@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/Makefile.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index e0b9de34e4..39ac260a4d 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -44,10 +44,8 @@ META: META.in
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
-ifeq (,$(findstring clean,$(MAKECMDGOALS)))
 .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
-endif
 
 clean: $(CLEAN_HOOKS)
 	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
@@ -94,7 +92,9 @@ define C_PROGRAM_template
 	$(call quiet-command, $(CC) $(LDFLAGS) -o $$@ $$+,BIN,$$@)
 endef
 
+ifeq (,$(findstring clean,$(MAKECMDGOALS)))
 -include .ocamldep.make
+endif
 
 $(foreach lib,$(OCAML_LIBRARY),$(eval $(call OCAML_LIBRARY_template,$(lib))))
 $(foreach lib,$(OCAML_NOC_LIBRARY),$(eval $(call OCAML_NOC_LIBRARY_template,$(lib))))
-- 
2.34.1


