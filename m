Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB878287BF0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4560.11958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6t-0005Wx-Oi; Thu, 08 Oct 2020 18:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4560.11958; Thu, 08 Oct 2020 18:57:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6t-0005WH-Kr; Thu, 08 Oct 2020 18:57:51 +0000
Received: by outflank-mailman (input) for mailman id 4560;
 Thu, 08 Oct 2020 18:57:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb6r-0005Rd-Gs
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08ecb7e3-5169-43f5-968b-d4e3676090eb;
 Thu, 08 Oct 2020 18:57:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6m-00041U-9S; Thu, 08 Oct 2020 18:57:44 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6m-0002P9-1o; Thu, 08 Oct 2020 18:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb6r-0005Rd-Gs
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:49 +0000
X-Inumbo-ID: 08ecb7e3-5169-43f5-968b-d4e3676090eb
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 08ecb7e3-5169-43f5-968b-d4e3676090eb;
	Thu, 08 Oct 2020 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=KuTv/AiA3AykRxQcQYe5kZtE2uGaDTe4ZnjePHv8ems=; b=4BKw2EiLnQterbDLN/hAsmx+RQ
	yybqjdsv86n0liKGgrRVdDL5IzIPhMQ+5z5x+mfhCgck5YKQ2ldcRbynxBmSL7K5KJwzddY2gLGaH
	Sbhkze0q4Ugn46LP7bOymaTZKGdy4R8KpkBDizxL84lCzG8T/CBnT1uK4VapD+g/30WA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6m-00041U-9S; Thu, 08 Oct 2020 18:57:44 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6m-0002P9-1o; Thu, 08 Oct 2020 18:57:44 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v10 04/11] tools/misc: add xen-domctx to present domain context
Date: Thu,  8 Oct 2020 19:57:28 +0100
Message-Id: <20201008185735.29875-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This tool is analogous to 'xen-hvmctx' which presents HVM context.
Subsequent patches will add 'dump' functions when new records are
introduced.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

v10:
 - Re-base
 - Use err[x]()
 - Keep existing A-b since modifications are trivial

v3:
 - Re-worked to avoid copying onto stack
 - Added optional typecode and instance arguments

v2:
 - Change name from 'xen-ctx' to 'xen-domctx'
---
 .gitignore              |   1 +
 tools/misc/Makefile     |   4 +
 tools/misc/xen-domctx.c | 172 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 tools/misc/xen-domctx.c

diff --git a/.gitignore b/.gitignore
index 188495783e..4d9a61124d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -243,6 +243,7 @@ tools/misc/xen_cpuperf
 tools/misc/xen-cpuid
 tools/misc/xen-detect
 tools/misc/xen-diag
+tools/misc/xen-domctx
 tools/misc/xen-tmem-list-parse
 tools/misc/xen-livepatch
 tools/misc/xenperf
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 7d37f297a9..fb673d0ff6 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -32,6 +32,7 @@ INSTALL_SBIN                   += xenpm
 INSTALL_SBIN                   += xenwatchdogd
 INSTALL_SBIN                   += xen-livepatch
 INSTALL_SBIN                   += xen-diag
+INSTALL_SBIN                   += xen-domctx
 INSTALL_SBIN += $(INSTALL_SBIN-y)
 
 # Everything to be installed in a private bin/
@@ -111,6 +112,9 @@ xen-livepatch: xen-livepatch.o
 xen-diag: xen-diag.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xen-domctx: xen-domctx.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 xen-lowmemd: xen-lowmemd.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
 
diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
new file mode 100644
index 0000000000..ca135b9a28
--- /dev/null
+++ b/tools/misc/xen-domctx.c
@@ -0,0 +1,172 @@
+/*
+ * xen-domctx.c
+ *
+ * Print out domain save records in a human-readable way.
+ *
+ * Copyright Amazon.com Inc. or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <inttypes.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <err.h>
+
+#include <xenctrl.h>
+#include <xen-tools/libs.h>
+#include <xen/xen.h>
+#include <xen/domctl.h>
+#include <xen/save.h>
+
+static void *buf = NULL;
+static size_t len, off;
+
+#define GET_PTR(_x)                                                        \
+    do {                                                                   \
+        if ( len - off < sizeof(*(_x)) )                                   \
+            errx(1, "error: need another %lu bytes, only %lu available",   \
+                    sizeof(*(_x)), len - off);                             \
+        (_x) = buf + off;                                                  \
+    } while (false);
+
+static void dump_start(void)
+{
+    struct domain_context_start *s;
+
+    GET_PTR(s);
+
+    printf("    START: Xen %u.%u\n", s->xen_major, s->xen_minor);
+}
+
+static void dump_end(void)
+{
+    struct domain_context_end *e;
+
+    GET_PTR(e);
+
+    printf("    END\n");
+}
+
+static void usage(void)
+{
+    errx(1, "usage: <domid> [ <type> [ <instance> ]]");
+}
+
+int main(int argc, char **argv)
+{
+    char *s, *e;
+    long domid;
+    long type = -1;
+    long instance = -1;
+    unsigned int entry;
+    xc_interface *xch;
+    int rc;
+
+    if ( argc < 2 || argc > 4 )
+        usage();
+
+    s = e = argv[1];
+    domid = strtol(s, &e, 0);
+
+    if ( *s == '\0' || *e != '\0' ||
+         domid < 0 || domid >= DOMID_FIRST_RESERVED )
+        errx(1, "invalid domid '%s'", s);
+
+    if ( argc >= 3 )
+    {
+        s = e = argv[2];
+        type = strtol(s, &e, 0);
+
+        if ( *s == '\0' || *e != '\0' )
+            errx(1, "invalid type '%s'", s);
+    }
+
+    if ( argc == 4 )
+    {
+        s = e = argv[3];
+        instance = strtol(s, &e, 0);
+
+        if ( *s == '\0' || *e != '\0' )
+            errx(1, "invalid instance '%s'", s);
+    }
+
+    xch = xc_interface_open(0, 0, 0);
+    if ( !xch )
+        err(1, "can't open libxc handle");
+
+    rc = xc_domain_get_context(xch, domid, NULL, &len);
+    if ( rc < 0 )
+        err(1, "can't get context length for dom %lu", domid);
+
+    buf = malloc(len);
+    if ( !buf )
+        err(1, "can't allocate %lu bytes", len);
+
+    rc = xc_domain_get_context(xch, domid, buf, &len);
+    if ( rc < 0 )
+        err(1, "can't get context for dom %lu", domid);
+
+    off = 0;
+
+    entry = 0;
+    for ( ;; )
+    {
+        struct domain_context_record *rec;
+
+        GET_PTR(rec);
+
+        off += sizeof(*rec);
+
+        if ( (type < 0 || type == rec->type) &&
+             (instance < 0 || instance == rec->instance) )
+        {
+            printf("[%u] type: %u instance: %u length: %"PRIu64"\n", entry++,
+                   rec->type, rec->instance, rec->length);
+
+            switch (rec->type)
+            {
+            case DOMAIN_CONTEXT_START: dump_start(); break;
+            case DOMAIN_CONTEXT_END: dump_end(); break;
+            default:
+                printf("Unknown type %u: skipping\n", rec->type);
+                break;
+            }
+        }
+
+        if ( rec->type == DOMAIN_CONTEXT_END )
+            break;
+
+        off += ROUNDUP(rec->length, _DOMAIN_CONTEXT_RECORD_ALIGN);
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.20.1


