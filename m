Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5CC19E520
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiZP-0005pQ-Em; Sat, 04 Apr 2020 13:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiZN-0005oN-Pd
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:10:41 +0000
X-Inumbo-ID: ad8c47ce-7675-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad8c47ce-7675-11ea-83d8-bc764e2007e4;
 Sat, 04 Apr 2020 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=96KKJCpdFR7vcoVbtVCMECvOok+zumfKbz+sn1zOelQ=; b=Bx9n5y4PjUGHo9AVvHd2x09TNy
 TzNfGgA1U4JsvJ0O5lI95rOe59MG2dt7/T6KkhncRsXe7kXnJoEUo5FclmYSB1CDHd4AAZil3WNIX
 sIKH/nJQa9hxaOzdGEbR0i1bMo/tRHBXwR1yhUD9VL0Za4XDcSOs2rh69HPsMFd3nBJk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZJ-0008GL-Dm; Sat, 04 Apr 2020 13:10:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZJ-0007rM-4v; Sat, 04 Apr 2020 13:10:37 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 7/7] xen/guest_access: Fix coding style in xen/guest_access.h
Date: Sat,  4 Apr 2020 14:10:17 +0100
Message-Id: <20200404131017.27330-8-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
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
 xen/include/xen/guest_access.h | 40 +++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index f724f995c3..24f03a84ff 100644
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
@@ -40,9 +44,11 @@
 #define guest_handle_from_param(hnd, type) ({               \
     typeof((hnd).p) _x = (hnd).p;                           \
     XEN_GUEST_HANDLE(type) _y = { _x };                     \
-    /* type checking: make sure that the pointers inside    \
+    /*                                                      \
+     * type checking: make sure that the pointers inside    \
      * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of   \
-     * the same type, then return hnd */                    \
+     * the same type, then return hnd.                      \
+     */                                                     \
     (void)(&_x == &_y.p);                                   \
     _y;                                                     \
 })
@@ -123,12 +129,12 @@
  * The variable _t is only here to catch at build time whether we are
  * copying back to a const guest handle.
  */
-#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
-    const typeof(*(ptr)) *_s = (ptr);                   \
-    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
-    void *__maybe_unused _t = (hnd).p;                  \
-    ((void)((hnd).p == (ptr)));                         \
-    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
+#define __copy_to_guest_offset(hnd, off, ptr, nr) ({        \
+    const typeof(*(ptr)) *_s = (ptr);                       \
+    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;              \
+    void *__maybe_unused _t = (hnd).p;                      \
+    ((void)((hnd).p == (ptr)));                             \
+    __raw_copy_to_guest(_d + (off), _s, sizeof(*_s) * (nr));\
 })
 
 #define __clear_guest_offset(hnd, off, nr) ({    \
@@ -136,10 +142,10 @@
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


