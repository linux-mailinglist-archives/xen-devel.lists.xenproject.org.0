Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322BB233824
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:10:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1D09-0001fF-8B; Thu, 30 Jul 2020 18:09:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1D08-0001eP-A2
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:09:56 +0000
X-Inumbo-ID: dc0f8c5d-d28f-11ea-ab01-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc0f8c5d-d28f-11ea-ab01-12813bfff9fa;
 Thu, 30 Jul 2020 18:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HcrdvdMXYTnUwRBlS2DEneqnqQqoRuCUdn6F6d66Mpw=; b=D1cBZ4spwPKtMsnON5Set8IhhG
 yQrUYCsw9pJV7txoCklBSd1q9DibcLOhEPMENetrg6IitzgsX72WC4dYROj+cXCY7oa1vIN37uWu2
 rKDQeWwc7uRoDNjPN/qd324RVWpKaMaDesgI5c57p+GB/YU/UZqeblmPUw9sdvAeZ8tk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D02-0007cl-7G; Thu, 30 Jul 2020 18:09:50 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1CjK-0004nV-II; Thu, 30 Jul 2020 17:52:34 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 6/6] xen/guest_access: Fix coding style in
 xen/guest_access.h
Date: Thu, 30 Jul 2020 18:52:12 +0100
Message-Id: <20200730175213.30679-13-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730175213.30679-1-julien@xen.org>
References: <20200730175213.30679-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

    * Add space before and after operator
    * Align \
    * Format comments

No functional changes expected.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/xen/guest_access.h | 36 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index 4957b8d1f2b8..52fc7a063249 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -18,20 +18,24 @@
 #define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
 #define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
 
-/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
- * to the specified type of XEN_GUEST_HANDLE_PARAM. */
+/*
+ * Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
+ * to the specified type of XEN_GUEST_HANDLE_PARAM.
+ */
 #define guest_handle_cast(hnd, type) ({         \
     type *_x = (hnd).p;                         \
-    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
+    (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
 })
 
 /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
 #define guest_handle_to_param(hnd, type) ({                  \
     typeof((hnd).p) _x = (hnd).p;                            \
     XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
-    /* type checking: make sure that the pointers inside     \
+    /*                                                       \
+     * type checking: make sure that the pointers inside     \
      * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
-     * the same type, then return hnd */                     \
+     * the same type, then return hnd.                       \
+     */                                                      \
     (void)(&_x == &_y.p);                                    \
     _y;                                                      \
 })
@@ -106,13 +110,13 @@
  * guest_handle_subrange_okay().
  */
 
-#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
-    const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
-    /* Check that the handle is not for a const type */ \
-    void *__maybe_unused _t = (hnd).p;                  \
-    (void)((hnd).p == _s);                              \
-    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
+#define __copy_to_guest_offset(hnd, off, ptr, nr) ({        \
+    const typeof(*(ptr)) *_s = (ptr);                       \
+    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;              \
+    /* Check that the handle is not for a const type */     \
+    void *__maybe_unused _t = (hnd).p;                      \
+    (void)((hnd).p == _s);                                  \
+    __raw_copy_to_guest(_d + (off), _s, sizeof(*_s) * (nr));\
 })
 
 #define __clear_guest_offset(hnd, off, nr) ({    \
@@ -120,10 +124,10 @@
     __raw_clear_guest(_d + (off), nr);           \
 })
 
-#define __copy_from_guest_offset(ptr, hnd, off, nr) ({  \
-    const typeof(*(ptr)) *_s = (hnd).p;                 \
-    typeof(*(ptr)) *_d = (ptr);                         \
-    __raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
+#define __copy_from_guest_offset(ptr, hnd, off, nr) ({          \
+    const typeof(*(ptr)) *_s = (hnd).p;                         \
+    typeof(*(ptr)) *_d = (ptr);                                 \
+    __raw_copy_from_guest(_d, _s + (off), sizeof (*_d) * (nr)); \
 })
 
 #define __copy_field_to_guest(hnd, ptr, field) ({       \
-- 
2.17.1


