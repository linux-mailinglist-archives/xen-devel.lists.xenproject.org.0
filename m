Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F908559E34
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355715.583597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrV-00016g-A8; Fri, 24 Jun 2022 16:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355715.583597; Fri, 24 Jun 2022 16:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrV-00012w-6D; Fri, 24 Jun 2022 16:08:49 +0000
Received: by outflank-mailman (input) for mailman id 355715;
 Fri, 24 Jun 2022 16:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnh-0004qb-0t
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6071422d-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:52 +0200 (CEST)
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
X-Inumbo-ID: 6071422d-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRUZBzwipLHVi3LrT/VXUcevANDycChtXk37Vv5NYiY=;
  b=DMYhPAbbIc7N/O7kItuByodH0U9FFH9dzWv3JiFilWWwddpzcD65hns+
   pJCC4B3+hO+ggq9zGahMlkOAkBLtdaKI0MaBidwZXzhfKKco2ifaOojNs
   1W0ER5u0yU9ClQOq8NkKtDXv8bXB9Tx/pqBi6gAwyqFiYa/JrDlGKHSV2
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74362364
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8i+vGa/vvvkbrBPzjb/gDrUDyX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TYWD2CGMveCN2v1fdknYIji8U8P756DyYAxQANl+Ho8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LlW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaSUdT8QIbbPo8UmcUEHPx9nH50dpLCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JZCN2A0MkiojxtnZhQTOLcymfaUonDAehx4igikpPI4yj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7NfENfQLl+7/j0Bf4Ao8Bb
 RxPksYzkUQs3HSPcuHEQAa7m1+/nEZDd+RJMd1htA7Yn8I4/D2l6ng4oi9pMYJ76pdtGGR1h
 jdljPuyW2Ux7eT9pWa1s+7N8GjsYXV9wXoqP3dscOcT3zX0TGjfZDrrR80rLqO6h8ad9drYk
 2HT93hWa1n+YKc2O0SHEbPv2WvESmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iVaw5DPtb9SVcnS/MBofAnrNOvxjxpiGG20vLKSN8N5q2TFF4CLJ+i8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AUZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 szAL65BzB8yVMxa8dZBb71Mj+Z1mn9vnj27qFKS503P7IdyrUW9Ed8tWGZipMhjhE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:YDMGN6uB8UFkI1xjn5bcU5m/7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74362364"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 11/25] tools/xentrace: rework Makefile
Date: Fri, 24 Jun 2022 17:04:08 +0100
Message-ID: <20220624160422.53457-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use "$(TARGETS)" to list binary to be built.

Cleanup "clean" rule.

Also drop conditional install of $(BIN) and $(LIBBIN) as those two
variables are now always populated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - fix typo in title
    - drop conditional install of $(BIN) and $(LIBBIN)

 tools/xentrace/Makefile | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index 9fb7fc96e7..0995fa9203 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -14,36 +14,31 @@ SBIN     = xentrace xentrace_setsize
 LIBBIN   = xenctx
 SCRIPTS  = xentrace_format
 
-.PHONY: all
-all: build
+TARGETS := $(BIN) $(SBIN) $(LIBBIN)
 
-.PHONY: build
-build: $(BIN) $(SBIN) $(LIBBIN)
+.PHONY: all
+all: $(TARGETS)
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-ifneq ($(BIN),)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) $(BIN) $(DESTDIR)$(bindir)
-endif
 	$(INSTALL_PROG) $(SBIN) $(DESTDIR)$(sbindir)
 	$(INSTALL_PYTHON_PROG) $(SCRIPTS) $(DESTDIR)$(bindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(LIBBIN))
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(SCRIPTS))
 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(SBIN))
-ifneq ($(BIN),)
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(BIN))
-endif
 
 .PHONY: clean
 clean:
-	$(RM) *.a *.so *.o *.rpm $(BIN) $(SBIN) $(LIBBIN) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


