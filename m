Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE2719FF6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542552.846577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHo-00086f-1Y; Thu, 01 Jun 2023 14:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542552.846577; Thu, 01 Jun 2023 14:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHn-0007vu-QV; Thu, 01 Jun 2023 14:28:19 +0000
Received: by outflank-mailman (input) for mailman id 542552;
 Thu, 01 Jun 2023 14:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHm-0006Od-C5
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:18 +0000
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c62c1b9-0088-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:28:16 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ESD1St
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:28:13 +0200 (CEST)
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
X-Inumbo-ID: 8c62c1b9-0088-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685629693; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GXTCs3A3z/A4tDwzDgPrnzO+QXZJFyTjXNCa1tFuCTDuaccbOzVIm/ileLQVJZZ/vY
    h1qJxVvDz9wWobfX6jIDmd8z3qiWNqI5CgxyEt2O5/U4Dm+8oPy1qaioPW2Svfp0UjLG
    RP29REsdwzf/AtB5S4Ppty1xr05YIHbFOfkpn16JAWVm+OinGN3fNw8rQRnTGu6ViXM3
    ui/hZN3N5Gr70YVMLb5iv6nKYPGLqP8fAPbbxoHLhnqNe2kWifE8pOeo5HxzlBW3Hypn
    wkwnRIy3O0b0WIFDN1BLlxruCPt9cqr68/ILTG0pAd5wtN21n/83ILG819QAvbYR2Hw4
    iVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629693;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SQPnzeSPdSzTN5oSP1cg888bULG0jZM8rNP+r5k/y38=;
    b=bRSqTxPWEgX+Q3mndArTMg/ytsqLcaVXZzI07FNpQPol2GmOXF3SXxHcX5bkJtDw/Q
    3p2t0Vn84Sy+/uH4CODaowGkPhunRyWuIdZqDWYtPUbdLmUXUTYIy36X1vE4uAcnttB2
    8B3ggFm8C1tCGxRlorGqyRhj4eJoUIEckZICUenGoAcPATuRCPUtE6MHg2BtWzyqndgg
    iGNs0ZZqFtglPNqopPS5GJNvSYtCd8rSaxcf9+Y8Y6JoAlKKIThtNCVIlv7ULwqSoW/Y
    tWwr5ilRH0v1ugpqf0wNRf15P0THto1t3Mz+MqAIHAxJ4ItrMKLomTMoraeidsWS/iC0
    9eHA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629693;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SQPnzeSPdSzTN5oSP1cg888bULG0jZM8rNP+r5k/y38=;
    b=DLoJ7ayIeAIhsPq6GiRv8vPJw62l1ovEXlAlB247dZDRqFaBI79x4Q+tFhQf80TD7m
    u68Swltnp5PROnmexmB9go+sZygFQ9LKOoWr3rJv8MbMH/+cJkbsXzn5xBebTPkHT08h
    zuH46ynq1qNh3p+zHCUKP4E64mAidq/4tDJYOFNRP1/S405kmtnrI9ssIKAnBBCHDOKn
    0bXKNWFpUFdhjpMifZEtlX7nYyGBBu9FnQR0H8eP8OWytdk3x5VKmA67TlIG9XautjAx
    OH8GJeGW3hOwlHJ5KcZlQ3+lQeYCn7wWWr3prWRlGzsZphIOKgWwny2D0c5XfiUnZzkX
    7a6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629693;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SQPnzeSPdSzTN5oSP1cg888bULG0jZM8rNP+r5k/y38=;
    b=GiPtReQAZDCrkIY7YgLqP1fmV57RMM38WKtlA6L4snx7wsYCuFq2nAlqzJbTRYl1mB
    xKU0mqEOEeYs5hECXxDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 7/7] xenalyze: handle more potential exit reason values from vmx.h
Date: Thu,  1 Jun 2023 16:27:42 +0200
Message-Id: <20230601142742.15489-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601142742.15489-1-olaf@aepfle.de>
References: <20230601142742.15489-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Copy and use more constants from vmx.h, to turn numbers into strings.
Adjust the REASON_MAX value accordingly.
Remove the size constraint from string array, the compiler will grow it
as needed.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xenalyze.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 9635ff453a..9af17d45bf 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -482,6 +482,7 @@ struct {
 #define EXIT_REASON_MCE_DURING_VMENTRY  41
 #define EXIT_REASON_TPR_BELOW_THRESHOLD 43
 #define EXIT_REASON_APIC_ACCESS         44
+#define EXIT_REASON_EOI_INDUCED         45
 #define EXIT_REASON_ACCESS_GDTR_OR_IDTR 46
 #define EXIT_REASON_ACCESS_LDTR_OR_TR   47
 #define EXIT_REASON_EPT_VIOLATION       48
@@ -492,10 +493,18 @@ struct {
 #define EXIT_REASON_INVVPID             53
 #define EXIT_REASON_WBINVD              54
 #define EXIT_REASON_XSETBV              55
-
-#define HVM_VMX_EXIT_REASON_MAX (EXIT_REASON_XSETBV+1)
-
-const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
+#define EXIT_REASON_APIC_WRITE          56
+#define EXIT_REASON_INVPCID             58
+#define EXIT_REASON_VMFUNC              59
+#define EXIT_REASON_PML_FULL            62
+#define EXIT_REASON_XSAVES              63
+#define EXIT_REASON_XRSTORS             64
+#define EXIT_REASON_BUS_LOCK            74
+#define EXIT_REASON_NOTIFY              75
+
+#define HVM_VMX_EXIT_REASON_MAX (EXIT_REASON_NOTIFY+1)
+
+const char * hvm_vmx_exit_reason_name[] = {
     [EXIT_REASON_EXCEPTION_NMI]="EXCEPTION_NMI",
     [EXIT_REASON_EXTERNAL_INTERRUPT]="EXTERNAL_INTERRUPT",
     [EXIT_REASON_TRIPLE_FAULT]="TRIPLE_FAULT",
@@ -538,6 +547,9 @@ const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_MCE_DURING_VMENTRY]="MCE_DURING_VMENTRY",
     [EXIT_REASON_TPR_BELOW_THRESHOLD]="TPR_BELOW_THRESHOLD",
     [EXIT_REASON_APIC_ACCESS]="APIC_ACCESS",
+    [EXIT_REASON_EOI_INDUCED]="EOI_INDUCED",
+    [EXIT_REASON_ACCESS_GDTR_OR_IDTR]="ACCESS_GDTR_OR_IDTR",
+    [EXIT_REASON_ACCESS_LDTR_OR_TR]="ACCESS_LDTR_OR_TR",
     [EXIT_REASON_EPT_VIOLATION]="EPT_VIOLATION",
     [EXIT_REASON_EPT_MISCONFIG]="EPT_MISCONFIG",
     [EXIT_REASON_INVEPT]="INVEPT",
@@ -546,6 +558,14 @@ const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_INVVPID]="INVVPID",
     [EXIT_REASON_WBINVD]="WBINVD",
     [EXIT_REASON_XSETBV]="XSETBV",
+    [EXIT_REASON_APIC_WRITE]="APIC_WRITE",
+    [EXIT_REASON_INVPCID]="INVPCID",
+    [EXIT_REASON_VMFUNC]="VMFUNC",
+    [EXIT_REASON_PML_FULL]="PML_FULL",
+    [EXIT_REASON_XSAVES]="XSAVES",
+    [EXIT_REASON_XRSTORS]="XRSTORS",
+    [EXIT_REASON_BUS_LOCK]="BUS_LOCK",
+    [EXIT_REASON_NOTIFY]="NOTIFY",
 };
 
 /* SVM data */

