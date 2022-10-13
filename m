Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DE5FD9D0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422021.667827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu1-0002VW-CF; Thu, 13 Oct 2022 13:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422021.667827; Thu, 13 Oct 2022 13:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu1-0002Rh-8f; Thu, 13 Oct 2022 13:05:33 +0000
Received: by outflank-mailman (input) for mailman id 422021;
 Thu, 13 Oct 2022 13:05:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixtz-0001tl-Qt
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8f303d8-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:08 +0200 (CEST)
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
X-Inumbo-ID: a8f303d8-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z1eIfm9TeIHBAfveoFRjwLU6/76BD/iLNFWSVEzbNJ4=;
  b=Y5igjEucz41YXW/bLXIG7Y+mq/LMV+UeDdUYVKPpY8b99CrMN6DlylYx
   0+DkEZghdQzWUeYlkdY9tOMN1uQ68gHxIWsGZ0jBi8UiHidEA4/UXxorp
   1fIlpv9XY4ILsknrvBayq+WxN4QoJekbW165vg8mKId0DNtxfmfWONLcP
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82281609
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+t8nVa2adLHgrC3tU/bD5c5xkn2cJEfYwER7XKvMYLTBsI5bpzwOm
 zNODz2BO6veMWbzfYsjYYqwoEgEsJ6GxtVkSQFlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GpD5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUI+exxKGIS+
 MYxEzQCdjGZmcLxxL2CH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqPIIzTG50E9qqej
 j/D1ET2XjY6CMyO+Sea736n2v7EoBquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWQdVEI
 VYT/Skohac3/U2vCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf1y1uPhWrsY25PdzZEPHJaC1teizX+nG0tpgLMRNBKE/K4tPTOHT7o4
 iqUjG86iIxG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezP
 Sc/WisLvve/2UdGiocmC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyz/xhY
 c/DKZjzVCxy5UFbIN2eHr517FPW7npmmTO7qW7TlXxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 uuzw/CikkwHONASlwGNrub/23hWciVgbX03wuQLHtO+zv1OQT1xVqCAn+17JuSIXc19z4/1w
 510YWcAoHKXuJENAV/ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:N6/a+qsMkMJW69gRaC2GH9T37skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82281609"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>
Subject: [XEN PATCH for-4.17 v5 03/17] tools: Introduce $(xenlibs-ldflags, ) macro
Date: Thu, 13 Oct 2022 14:04:59 +0100
Message-ID: <20221013130513.52440-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This avoid the need to open-coding the list of flags needed to link
with an in-tree Xen library when using -lxen*.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---

Notes:
    missing-ack: GOLANG BINDINGS

 tools/golang/xenlight/Makefile | 2 +-
 tools/Rules.mk                 | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 64671f246c..00e6d17f2b 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
 # so that it can find the actual library.
 .PHONY: build
 build: xenlight.go $(GOXL_GEN_FILES)
-	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(call xenlibs-ldflags,light toollog) $(APPEND_LDFLAGS)" $(GO) build -x
 
 .PHONY: install
 install: build
diff --git a/tools/Rules.mk b/tools/Rules.mk
index ce77dd2eb1..26958b2948 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -105,6 +105,14 @@ define xenlibs-ldlibs
     $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
 endef
 
+# Provide needed flags for linking an in-tree Xen library by an external
+# project (or when it is necessary to link with "-lxen$(1)" instead of using
+# the full path to the library).
+define xenlibs-ldflags
+    $(call xenlibs-rpath,$(1)) \
+    $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
+endef
+
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
-- 
Anthony PERARD


