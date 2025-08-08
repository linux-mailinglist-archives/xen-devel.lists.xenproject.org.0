Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF6B1EAF2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 17:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074705.1437255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOaJ-0006MQ-69; Fri, 08 Aug 2025 15:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074705.1437255; Fri, 08 Aug 2025 15:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOaJ-0006Kt-2k; Fri, 08 Aug 2025 15:00:43 +0000
Received: by outflank-mailman (input) for mailman id 1074705;
 Fri, 08 Aug 2025 15:00:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOaH-0006Ie-K5
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 15:00:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOaG-00800T-0j;
 Fri, 08 Aug 2025 15:00:40 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVz-009BYT-1b;
 Fri, 08 Aug 2025 14:56:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=OI5YJNC114wPAaP6LK8uGuarwiAKbs2E8HSv0E4xKds=; b=6aVE2vFT0EtHMQZpcEjIyNDb+R
	O59epHd7LvO0+/TYMmLJVos4FH7fsfVTF2lCmrUI6LiFl/O1qqgMR9llBigfyQnJu6lY60dyvzPMz
	1d19COEExUGVbKuYkFGOfoIdYIe8D8SZM/RMksQM2F7k2XGxx/nnZxp9VIbCdKveVLRU=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 11/11] Update CHANGELOG and README with dependency on json-c
Date: Fri,  8 Aug 2025 16:56:02 +0200
Message-Id: <20250808145602.41716-12-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 CHANGELOG.md | 2 ++
 README       | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..83195e2dae 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
    - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
  - Linux based device model stubdomains are now fully supported.
+ - New dependency on library json-c, the toolstack will prefer it to `YAJL`
+   when available.
 
  - On x86:
    - Restrict the cache flushing done as a result of guest physical memory map
diff --git a/README b/README
index 6ee58f7b35..9329f30e13 100644
--- a/README
+++ b/README
@@ -53,7 +53,7 @@ provided by your OS distributor:
     * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
     * Development install of uuid (e.g. uuid-dev)
-    * Development install of yajl (e.g. libyajl-dev)
+    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
     * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
       greater.
     * Development install of GLib v2.0 (e.g. libglib2.0-dev)
-- 
Anthony PERARD


