Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08F60DECC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430422.682126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWZ-0005Th-IG; Wed, 26 Oct 2022 10:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430422.682126; Wed, 26 Oct 2022 10:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWZ-0005QQ-D1; Wed, 26 Oct 2022 10:20:39 +0000
Received: by outflank-mailman (input) for mailman id 430422;
 Wed, 26 Oct 2022 10:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ondWX-0004c6-Of
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:20:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3bbc3f4-5517-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 12:20:35 +0200 (CEST)
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
X-Inumbo-ID: d3bbc3f4-5517-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666779635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R02ZMC1k6phfC4hNr6bv6e+rmMsxG/5mpBaH4ZGEwOQ=;
  b=GW2gy6Rf5OpvQZjqvAcRmmv1Fqhivd1drAVFA5BIeOClU/NmRtp86TfC
   bB7djA8kGIjva0Imwbhh0w7ADrSGNQf9FFgz+CjtuvrOjxP8Zaz62/Oj6
   x2gcyX8YXyD+awLAIUJubazwtlDirVFoUwj1jSAvFvZrmbLmzokiT4dSk
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82629705
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P8i7P6769hNKx18BiYLetQxRtKjHchMFZxGqfqrLsTDasY5as4F+v
 jRKW2CBMq2JZTOgKI8ja9i//B5V6sDUztZiGgc9rylkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gZgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5LHT1iy
 e4nJwkNVTDcv7yJ6euAeu5V05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUozQG58EwR7Fz
 o7A10voBggxLu6l8CPG1lWiiffkkBqnW7tHQdVU8dY12QbOlwT/EiY+a1y/pvWoj1+kbPhWI
 UcU5ykGoLA78QqgSdyVdx+lpH+JuDYMVtwWFPc1gCmtx6zO8kCmD24LZjdbbZots8pebTYnz
 EOTltXlQzlmqqSISGm1/62R6zi1PEA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adldD+BCvx3
 yGivCU4wbIJgqYjx6i9uFzKnT+ojpzIVRIuoBXaWHq/6QF0b5LjYJangXDE6d5QIYDfSUOO1
 FAmscWD6OEFDbmWiTeABu4KGdmUC+2taWOGxwQ1Rt94qmrrqyXLkZ1sDC9WGFs1HvoWRjDQY
 HTz5jsP27YKB0utVPoiC26uMPgCwa/lHNXjc/nbaNtSf5R8HDO6EDFSiV24hD60zhV1+U0rE
 dLCKJv3Uy5GYUhy5GDuL9rxx4PH0czXKYn7YZnghyqq3rOFDJJ+YedUaQDeBgzVAU7tnek0z
 zq9H5HUo/m8eLekCsUyzWL0BQlTRUXX/bis96Rqmhere2KK4l0JBf7L2q8GcId4halTneqg1
 ijjBBEHkgCu3CSdcVjihpVfhFTHBMgXkJ7GFXZ0YQbAN4YLPe5DE5vzh7NoJOJ6pYSPPNZ/T
 uUfetXoPxi8Ym2vxtjpVrGk9NYKXE3y3WqmZnP1CAXTirY9HmQlDPe/JVCxnMTPZwLq3fYDT
 0qIjFiCEMddGlkzZCsUAdr2p26MUbEmsLoadyP1zhN7IS0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:WsNLS6C5F24WvBXlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ8l6U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="82629705"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"Anthony PERARD" <anthony.perard@citrix.com>
Subject: [PATCH 2/4] tools/tests: Unit test for p2m pool size
Date: Wed, 26 Oct 2022 11:20:16 +0100
Message-ID: <20221026102018.4144-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221026102018.4144-1-andrew.cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Exercise some basic functionality of the new xc_{get,set}_p2m_mempool_size()
hypercalls.

This passes on x86, but fails currently on ARM.  ARM will be fixed up in
future patches.

This is part of XSA-409 / CVE-2022-33747.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Xen Security Team <security@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/tests/Makefile                 |   1 +
 tools/tests/p2m-pool/.gitignore      |   1 +
 tools/tests/p2m-pool/Makefile        |  42 ++++++++
 tools/tests/p2m-pool/test-p2m-pool.c | 181 +++++++++++++++++++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 tools/tests/p2m-pool/.gitignore
 create mode 100644 tools/tests/p2m-pool/Makefile
 create mode 100644 tools/tests/p2m-pool/test-p2m-pool.c

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index d99146d56a64..7ce8b7b881db 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -11,6 +11,7 @@ endif
 SUBDIRS-y += xenstore
 SUBDIRS-y += depriv
 SUBDIRS-y += vpci
+SUBDIRS-y += p2m-pool
 
 .PHONY: all clean install distclean uninstall
 all clean distclean install uninstall: %: subdirs-%
diff --git a/tools/tests/p2m-pool/.gitignore b/tools/tests/p2m-pool/.gitignore
new file mode 100644
index 000000000000..cce6d97b1cc8
--- /dev/null
+++ b/tools/tests/p2m-pool/.gitignore
@@ -0,0 +1 @@
+test-p2m-pool
diff --git a/tools/tests/p2m-pool/Makefile b/tools/tests/p2m-pool/Makefile
new file mode 100644
index 000000000000..24f348f20582
--- /dev/null
+++ b/tools/tests/p2m-pool/Makefile
@@ -0,0 +1,42 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+TARGET := test-p2m-pool
+
+.PHONY: all
+all: $(TARGET)
+
+.PHONY: clean
+clean:
+	$(RM) -- *.o $(TARGET) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+	$(RM) -- *~
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC_BIN)
+
+.PHONY: uninstall
+uninstall:
+	$(RM) -- $(DESTDIR)$(LIBEXEC_BIN)/$(TARGET)
+
+CFLAGS += $(CFLAGS_xeninclude)
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenforeginmemory)
+CFLAGS += $(CFLAGS_libxengnttab)
+CFLAGS += $(APPEND_CFLAGS)
+
+LDFLAGS += $(LDLIBS_libxenctrl)
+LDFLAGS += $(LDLIBS_libxenforeignmemory)
+LDFLAGS += $(LDLIBS_libxengnttab)
+LDFLAGS += $(APPEND_LDFLAGS)
+
+%.o: Makefile
+
+$(TARGET): test-p2m-pool.o
+	$(CC) -o $@ $< $(LDFLAGS)
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/tests/p2m-pool/test-p2m-pool.c b/tools/tests/p2m-pool/test-p2m-pool.c
new file mode 100644
index 000000000000..1ffb19eeb420
--- /dev/null
+++ b/tools/tests/p2m-pool/test-p2m-pool.c
@@ -0,0 +1,181 @@
+#include <err.h>
+#include <errno.h>
+#include <inttypes.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mman.h>
+
+#include <xenctrl.h>
+#include <xenforeignmemory.h>
+#include <xengnttab.h>
+#include <xen-tools/libs.h>
+
+static unsigned int nr_failures;
+#define fail(fmt, ...)                          \
+({                                              \
+    nr_failures++;                              \
+    (void)printf(fmt, ##__VA_ARGS__);           \
+})
+
+static xc_interface *xch;
+static uint32_t domid;
+
+static struct xen_domctl_createdomain create = {
+    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+    .max_vcpus = 1,
+    .max_grant_frames = 1,
+    .grant_opts = XEN_DOMCTL_GRANT_version(1),
+
+    .arch = {
+#if defined(__x86_64__) || defined(__i386__)
+        .emulation_flags = XEN_X86_EMU_LAPIC,
+#endif
+    },
+};
+
+static uint64_t default_p2m_size_bytes =
+#if defined(__x86_64__) || defined(__i386__)
+    256 << 12; /* Only x86 HAP for now.  x86 Shadow broken. */
+#elif defined (__arm__) || defined(__aarch64__)
+    16 << 12;
+#endif
+
+static void run_tests(void)
+{
+    xen_pfn_t physmap[] = { 0 };
+    uint64_t size_bytes, old_size_bytes;
+    int rc;
+
+    printf("Test default p2m mempool size\n");
+
+    rc = xc_get_p2m_mempool_size(xch, domid, &size_bytes);
+    if ( rc )
+        return fail("  Fail: get p2m mempool size: %d - %s\n",
+                    errno, strerror(errno));
+
+    printf("P2M pool size %"PRIu64" bytes (%"PRIu64"kB, %"PRIu64"MB)\n",
+           size_bytes, size_bytes >> 10, size_bytes >> 20);
+
+
+    /*
+     * Check that the domain has the expected default allocation size.  This
+     * will fail if the logic in Xen is altered without an equivelent
+     * adjustment here.
+     */
+    if ( size_bytes != default_p2m_size_bytes )
+        return fail("  Fail: size %"PRIu64" != expected size %"PRIu64"\n",
+                    size_bytes, default_p2m_size_bytes);
+
+
+    printf("Test that allocate doesn't alter pool size\n");
+
+    /*
+     * Populate the domain with some RAM.  This will cause more of the p2m
+     * pool to be used.
+     */
+    old_size_bytes = size_bytes;
+
+    rc = xc_domain_setmaxmem(xch, domid, -1);
+    if ( rc )
+        return fail("  Fail: setmaxmem: : %d - %s\n",
+                    errno, strerror(errno));
+
+    rc = xc_domain_populate_physmap_exact(xch, domid, 1, 0, 0, physmap);
+    if ( rc )
+        return fail("  Fail: populate physmap: %d - %s\n",
+                    errno, strerror(errno));
+
+    /*
+     * Re-get the p2m size.  Should not have changed as a consequence of
+     * populate physmap.
+     */
+    rc = xc_get_p2m_mempool_size(xch, domid, &size_bytes);
+    if ( rc )
+        return fail("  Fail: get p2m mempool size: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( old_size_bytes != size_bytes )
+        return fail("  Fail: p2m mempool size changed %"PRIu64" => %"PRIu64"\n",
+                    old_size_bytes, size_bytes);
+
+
+
+    printf("Test bad set size\n");
+
+    /*
+     * Check that setting a non-page size results in failure.
+     */
+    rc = xc_set_p2m_mempool_size(xch, domid, size_bytes + 1);
+    if ( rc != -1 || errno != EINVAL )
+        return fail("  Fail: Bad set size: expected -1/EINVAL, got %d/%d - %s\n",
+                    rc, errno, strerror(errno));
+
+
+    printf("Test very large set size\n");
+
+    /*
+     * Check that setting a large P2M size succeeds.  This is expecting to
+     * trigger continuations.
+     */
+    rc = xc_set_p2m_mempool_size(xch, domid, 64 << 20);
+    if ( rc )
+        return fail("  Fail: Set size 64MB: %d - %s\n",
+                    errno, strerror(errno));
+
+
+    /*
+     * Check that the reported size matches what set consumed.
+     */
+    rc = xc_get_p2m_mempool_size(xch, domid, &size_bytes);
+    if ( rc )
+        return fail("  Fail: get p2m mempool size: %d - %s\n",
+                    errno, strerror(errno));
+
+    if ( size_bytes != 64 << 20 )
+        return fail("  Fail: expected mempool size %u, got %"PRIu64"\n",
+                    64 << 20, size_bytes);
+}
+
+int main(int argc, char **argv)
+{
+    int rc;
+
+    printf("P2M Shadow memory pool tests\n");
+
+    xch = xc_interface_open(NULL, NULL, 0);
+
+    if ( !xch )
+        err(1, "xc_interface_open");
+
+    rc = xc_domain_create(xch, &domid, &create);
+    if ( rc )
+    {
+        if ( errno == EINVAL || errno == EOPNOTSUPP )
+            printf("  Skip: %d - %s\n", errno, strerror(errno));
+        else
+            fail("  Domain create failure: %d - %s\n",
+                 errno, strerror(errno));
+        goto out;
+    }
+
+    printf("  Created d%u\n", domid);
+
+    run_tests();
+
+    rc = xc_domain_destroy(xch, domid);
+    if ( rc )
+        fail("  Failed to destroy domain: %d - %s\n",
+             errno, strerror(errno));
+ out:
+    return !!nr_failures;
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
2.11.0


