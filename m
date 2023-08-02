Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC1476C6CC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574739.900294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Gm-0004vE-1d; Wed, 02 Aug 2023 07:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574739.900294; Wed, 02 Aug 2023 07:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Gl-0004tX-V1; Wed, 02 Aug 2023 07:27:43 +0000
Received: by outflank-mailman (input) for mailman id 574739;
 Wed, 02 Aug 2023 07:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFyk=DT=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qR6Gj-0004tL-M1
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:27:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fc73d92-3106-11ee-b25e-6b7b168915f2;
 Wed, 02 Aug 2023 09:27:40 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-5-121-62.retail.telecomitalia.it [87.5.121.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 676644EE0737;
 Wed,  2 Aug 2023 09:27:39 +0200 (CEST)
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
X-Inumbo-ID: 0fc73d92-3106-11ee-b25e-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/string: add missing parameter names
Date: Wed,  2 Aug 2023 09:27:32 +0200
Message-Id: <e771afd1e1f6906a440883f4e6ee94847cbc7f7e.1690961143.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violations of MISRA C:2012
Rule 8.2 ("Function types shall be in prototype form with named
parameters").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
index b4d2217a96..805947d82b 100644
--- a/xen/include/xen/string.h
+++ b/xen/include/xen/string.h
@@ -12,27 +12,27 @@
 #define strncpy __xen_has_no_strncpy__
 #define strncat __xen_has_no_strncat__
 
-size_t strlcpy(char *, const char *, size_t);
-size_t strlcat(char *, const char *, size_t);
-int strcmp(const char *, const char *);
-int strncmp(const char *, const char *, size_t);
-int strcasecmp(const char *, const char *);
-int strncasecmp(const char *, const char *, size_t);
-char *strchr(const char *, int);
-char *strrchr(const char *, int);
-char *strstr(const char *, const char *);
-size_t strlen(const char *);
-size_t strnlen(const char *, size_t);
-char *strpbrk(const char *, const char *);
-char *strsep(char **, const char *);
-size_t strspn(const char *, const char *);
-
-void *memset(void *, int, size_t);
-void *memcpy(void *, const void *, size_t);
-void *memmove(void *, const void *, size_t);
-int memcmp(const void *, const void *, size_t);
-void *memchr(const void *, int, size_t);
-void *memchr_inv(const void *, int, size_t);
+size_t strlcpy(char *dest, const char *src, size_t size);
+size_t strlcat(char *dest, const char *src, size_t size);
+int strcmp(const char *cs, const char *ct);
+int strncmp(const char *cs, const char *ct, size_t count);
+int strcasecmp(const char *s1, const char *s2);
+int strncasecmp(const char *s1, const char *s2, size_t len);
+char *strchr(const char *s, int c);
+char *strrchr(const char *s, int c);
+char *strstr(const char *s1, const char *s2);
+size_t strlen(const char *s);
+size_t strnlen(const char *s, size_t count);
+char *strpbrk(const char *cs, const char *ct);
+char *strsep(char **s, const char *ct);
+size_t strspn(const char *s, const char *accept);
+
+void *memset(void *s, int c, size_t n);
+void *memcpy(void *dest, const void *src, size_t count);
+void *memmove(void *dest, const void *src, size_t count);
+int memcmp(const void *cs, const void *ct, size_t count);
+void *memchr(const void *s, int c, size_t n);
+void *memchr_inv(const void *s, int c, size_t n);
 
 #include <asm/string.h>
 
-- 
2.34.1


