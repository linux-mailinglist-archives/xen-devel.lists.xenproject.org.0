Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLtkLFVYz2llvQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 08:04:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7C3914F4
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 08:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.xenproject.org; s=20200302lists; h=Date:From:Message-Id:Sender:
	List-Subscribe:List-Help:List-Post:List-Unsubscribe:List-Id:Reply-To:Subject:
	To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner:List-Archive;
	bh=zHXLOAwkputQDAed/3u/W6+dmB6s6SIgIz6c6q8DnIw=; b=FGhLxI5KcIPVpYK/yks3vcDexo
	KP9tvqgGlOBDttLuzMvKHvdrGn3SzooQYHwHKJhE202B4kRRkqgvGcJYzdANulDukRJu+FhPzuqKW
	9U2BUCkJBGhECr/tielxR5zJsQPMb8WZevmzqMa1F2McAvS+mG7UHAHNXtIlMbUwxaWw=;
Received: from list by lists.xenproject.org with outflank-mailman.1272521.1560072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Xcj-0002Ye-Bp; Fri, 03 Apr 2026 06:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272521.1560072; Fri, 03 Apr 2026 06:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Xcj-0002VT-3x; Fri, 03 Apr 2026 06:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1272521;
 Fri, 03 Apr 2026 02:50:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pengpeng@iscas.ac.cn>) id 1w8Ubj-0005tH-D3
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 02:50:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Ubi-009xNC-PV
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 04:50:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pengpeng@iscas.ac.cn>)
 id 69cf2a9c-2eae-0a2a0a5409dd-0a2a4503ac78-24
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 04:50:01 +0200
Received: from [159.226.251.81] (helo=cstnet.cn)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <pengpeng@iscas.ac.cn>)
 id 69cf2ad6-02b3-0a2a45030019-9fe2fb51aed2-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 04:50:00 +0200
Received: from 0002-arm-xen.eml (unknown [111.196.245.197])
 by APP-03 (Coremail) with SMTP id rQCowACXtt3UKs9pxlS4DA--.8142S2;
 Fri, 03 Apr 2026 10:49:56 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-purgate-ID: tlsNG-33051d/1775184601-41311C9A-214F4CF7/0/0
X-purgate-type: clean
X-purgate-size: 3762
Message-Id: <E1w8Xcj-0002Ye-Bp@lists.xenproject.org>
From: xen-devel-bounces@lists.xenproject.org
Date: Fri, 03 Apr 2026 06:03:17 +0000
X-Spamd-Result: default: False [3.31 / 15.00];
	MISSING_TO(2.00)[];
	MISSING_SUBJECT(2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.xenproject.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[lists.xenproject.org:s=20200302lists];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[lists.xenproject.org:+];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 4DB7C3914F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From beef0e250a8453d76f9c6fb530a61b8110d4bd53 Mon Sep 17 00:00:00 2001
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 10:42:09 +0800
Message-ID: <20260403111502.2-dt-arm-xen-pengpeng@iscas.ac.cn>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: xen: validate hypervisor compatible before parsing its
 version
X-CM-TRANSID:rQCowACXtt3UKs9pxlS4DA--.8142S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rtFWkCF4rJr1kZF1UKFg_yoW8Zw4fpF
	Zakr9avFWrt3WxWa4IyFyv9Fy5GF4kXrW2qFykZ3Wjyrnrtw1rXrWIvF1SvFn3ArW8W343
	ZrWjyFn5AF47X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5oGQDUUUU
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

fdt_find_hyper_node() reads the raw compatible property and then
derives hyper_node.version from a prefix match before later printing it
with %s. Flat DT properties are external boot input, and this path does
not prove that the compatible string is NUL-terminated within its
declared bounds.

Fetch the first compatible entry with fdt_stringlist_get() so malformed
unterminated properties are rejected before the version suffix is
parsed.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/xen/enlighten.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 4feed2c2498d..f69290a4c639 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -19,6 +19,7 @@
 #include <asm/efi.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/libfdt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -218,8 +219,9 @@ static __initdata struct {
 static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	const void *s = NULL;
+	const char *s = NULL;
 	int len;
+	size_t prefix_len = strlen(hyper_node.prefix);
 
 	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
 		return 0;
@@ -227,10 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 	if (of_flat_dt_is_compatible(node, hyper_node.compat))
 		hyper_node.found = true;
 
-	s = of_get_flat_dt_prop(node, "compatible", &len);
-	if (strlen(hyper_node.prefix) + 3  < len &&
-	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
-		hyper_node.version = s + strlen(hyper_node.prefix);
+	s = fdt_stringlist_get(initial_boot_params, node, "compatible", 0, &len);
+	if (s && len > prefix_len + 2 &&
+	    !strncmp(hyper_node.prefix, s, prefix_len))
+		hyper_node.version = s + prefix_len;
 
 	/*
 	 * Check if Xen supports EFI by checking whether there is the
-- 
2.50.1 (Apple Git-155)


