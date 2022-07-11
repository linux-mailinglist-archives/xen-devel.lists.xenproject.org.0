Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE956FF34
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365016.595039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqp0-0003LR-K6; Mon, 11 Jul 2022 10:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365016.595039; Mon, 11 Jul 2022 10:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqp0-0003Is-GJ; Mon, 11 Jul 2022 10:39:22 +0000
Received: by outflank-mailman (input) for mailman id 365016;
 Mon, 11 Jul 2022 10:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79kg=XQ=citrix.com=prvs=184793b5a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oAqoz-0003Im-PH
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 10:39:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c3f7c5-0105-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 12:39:19 +0200 (CEST)
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
X-Inumbo-ID: b6c3f7c5-0105-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657535959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o61BUL37KyEgTZE8sS7VQM4OGp6wmIPN9Pluham6bUM=;
  b=T/7MiMnBA+feMGhrERur3vzQ6uoh8QQp1PF4hUd9eCSkARIX6q+t1yYz
   d2eGF+kVrG9Quhs2wj4kpL9HeNsgVCqrZzL6fXGMDoyQcgqyi7XoB+ALC
   V1U2q+9cArBxBLPDPSBWZ+EZU400ilsVfQ3WwyWidCEiCWyNsaZr4xmSH
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75498249
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+y3AtqKm47VJzC2NFE+RqZUlxSXFcZb7ZxGr2PjKsXjdYENS1DAPm
 zBKUD2CPP/fY2H0fIx1atm+/RgE6pfQn4QyGQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3dcx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Md8h8CtTDwUApCWyMdHTgVVCztAEqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQquCN
 ppDNWsHgBLobwNfOmgcJrgHtcj1vlOvSRBH9X/Fqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7DQsdL8e30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3J
 U0O9y8jsaU17mS2VdTnRFujp2OetRMSXMBfHqs85R3l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt8HYN2BytYaodU/HppTOsC+/ITIrAmBXMEfoUjA5D8nfTJAb10ySEY07SvPs17UZChmrn
 WnU8XFWa6E7yJdSiv7lpQ2vbyeE/MChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XKlznXlrB0lRu3B2hp/DBXSgER0A74q/Cm39niocOh4uW8jexs2Yp9bJW6zP
 Cc/XD+9A7cKZhOXgVJfOdrtW6zGM4C6fTgaahwkRoUXOcUgHON21CpveVSRzwjQraTYqolmY
 c3zWZ/1VR4yUP07pBLrFrx1+eJ6mUgDKZb7GMmT5w65yoCXeHP9Ye5DaDNimMhitPPayOgUm
 v4CX/a3J+J3CbyhPHiOrtdNRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:QTEt3KDD5hhQgt3lHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.92,262,1650945600"; 
   d="scan'208";a="75498249"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, G.R.
	<firemeteor@users.sourceforge.net>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH] libxl: Check return value of libxl__xs_directory in name2bdf
Date: Mon, 11 Jul 2022 11:38:47 +0100
Message-ID: <20220711103847.21276-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libxl__xs_directory() can potentially return NULL without setting `n`.
As `n` isn't initialised, we need to check libxl__xs_directory()
return value before checking `n`. Otherwise, `n` might be non-zero
with `bdfs` NULL which would lead to a segv.

Reported-by: "G.R." <firemeteor@users.sourceforge.net>
Fixes: 57bff091f4 ("libxl: add 'name' field to 'libxl_device_pci' in the IDL...")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Hi G.R., you've reported a segv in name2bdf(), and that the only
potential segv I've found. I hope it's the same one as you've
experienced!
---
 tools/libs/light/libxl_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96f88795b6..f4c4f17545 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -859,7 +859,7 @@ static int name2bdf(libxl__gc *gc, libxl_device_pci *pci)
     int rc = ERROR_NOTFOUND;
 
     bdfs = libxl__xs_directory(gc, XBT_NULL, PCI_INFO_PATH, &n);
-    if (!n)
+    if (!bdfs || !n)
         goto out;
 
     for (i = 0; i < n; i++) {
-- 
Anthony PERARD


