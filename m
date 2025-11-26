Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC1C8B07D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173117.1498274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIe2-0001xj-Eq; Wed, 26 Nov 2025 16:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173117.1498274; Wed, 26 Nov 2025 16:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIe2-0001wE-8k; Wed, 26 Nov 2025 16:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1173117;
 Wed, 26 Nov 2025 16:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIe1-0008SW-2e
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:29 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e36c5e6-cae7-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:45:24 +0100 (CET)
Received: from PH7PR17CA0059.namprd17.prod.outlook.com (2603:10b6:510:325::25)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:45:18 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:325:cafe::dd) by PH7PR17CA0059.outlook.office365.com
 (2603:10b6:510:325::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 16:45:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Wed, 26 Nov 2025 16:45:17 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:14 -0600
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
X-Inumbo-ID: 4e36c5e6-cae7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmlDRFD6MNkYY0mD6jA9u8gyRbwuNrdD3jUk7D5aYs8N4OYndwJcLINjST3BY84Iaoz6fOjseXbpF3rhX3PyS7KULQXMDlhUGUnCc3gqUgE+DvkV64gzUPqZFz7/V0d5Tu6WpjtqvTEDAQlGfU0lrhbMgVrOmWiX7W+1fH0UoogoCfu2g8FAWBjRoA8YOY3B17Qt7DQIw6pLK+M9bcT/ahlnfwo2gXbq7iRkITeB2Sq4AvXzfS1MflDMB0sC7Wgt24cIER/j/IxYp5bRwHCCDATU9KNbkU7wArB8O67C3rxcIGKZU+hS5qGRuqGmWcMn/8UBaxFnsVATavXf/L7hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQ+BQunxNt1JDn/totncm1sDyO8K+rrlS0zIt8M0+Wk=;
 b=u3xzSSL3RRS+4uOJTPpoL65QFLmiuCgNyAw+TCGYRECles3NAVtqnKZ9TvF0GafbM77i7QJUz/saJHtfNAsn6xzLS1ELR/CB9RjCusi8ITFPCb2DwlPWSnwkpuJNvWyQMqkR5P2Rj79xtkKzOENZHztYh9hepRzqe/3lbEFMvFVWW/m0FDdQ2/yScNHtzO09W2TEDAnVEnQBqOUgvZGnoPIwZux7LL4qtT4gHK5XqTkwfxP3qgeEZMtPJNY5E7Vg/NC9n476DISSWsm4mCjNlOmVsibin78RysOzO2ITBI2p4uUYUA1cDlzgpgShi/1r0F+a9TNjKiOJw5TL7ZR74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ+BQunxNt1JDn/totncm1sDyO8K+rrlS0zIt8M0+Wk=;
 b=DpYARXRmmrvmOYezdS/3v0YIglI2Q2SAcb9gxBtPfYSUNoJ0yzBM53RFFuX+sNifzgxQYwRaKyR13sEXqeKPF9f9uPxalhCWX7P8b3fapHdJF22fkOywrkUrzcL8qG3Ee3fDy7x0r0UtRnfk7loouR5BNnr0prqwhSR6pJLS8ZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 08/11] x86: Migrate insn emulator to use x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:10 +0100
Message-ID: <20251126164419.174487-9-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: efa0e6b7-d851-406c-b694-08de2d0b2e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wXB2BCj/z6TkNelQLFOzaArxX1SfCr70xpOSr5lot7B9FguAIlqTCYjGGDpu?=
 =?us-ascii?Q?jV83yGNukHpGbdtVHSQ3JbKbH5pcioa1Yn8qPBirHA994S/VLbsV/fpQg9TA?=
 =?us-ascii?Q?hk6e34eAZtjToFfnGuBuMgMKxmxAnVaLjLnuEXGCwh7jJnDEDlEdHgpegnoQ?=
 =?us-ascii?Q?mKJRi7h+QVxYPjhhcTZVw+2eHKe5aSrk+yVCasg9aWfwHaELZaAjbqq7u+eA?=
 =?us-ascii?Q?JUcuBY8M2r9yDpIDXa2bgzPtR55uCAshvQ+c8eti1Q50XFq4wJQQv8oo0vgn?=
 =?us-ascii?Q?1NBWiNNDTC8a8WtSldmwRYBOkuuEL48tSLtormS/vgi7jlj7c5T4ViQUitdd?=
 =?us-ascii?Q?vxe4NnRbPABDfJX3KmQna25LTQrVI41CUc+tD1VsiDIDZR2TM6XTo00lzHqS?=
 =?us-ascii?Q?TQOaWKRLMFOYTsWYvdOTmviv0ovlaNMRIQi//glkkFXmyxI5USpcHBC+XiR2?=
 =?us-ascii?Q?+uewrJApQv59iTgvqKBCTmrJY7KFEJvS0mX6M2qMcMtQCzUqddn2/hJlAg39?=
 =?us-ascii?Q?PTkxb+IlEQ1n2wPOipcJsMNl7KOf0xQOi2VTevQ8yQdKSRyhQflY+Hs/DGP9?=
 =?us-ascii?Q?anbfbZSQxy6WPtJMrxLznM7up1rPIqLBqKjxn9OUmgXN+fjXtBIM4QPd1llx?=
 =?us-ascii?Q?5aQRkKyQXcwQRY0cSazj/I1hPMTTa63u8qiutHa4JvNQawitN7rTK0codMKP?=
 =?us-ascii?Q?+icNI3rtsrEnJvKIW5npxLFwICNO5HuERVBxnRr464Ww8MASTXCC+HfysbXu?=
 =?us-ascii?Q?gsfHY2GNIrTML0jvBBAqdfCSW7g7fHTrLH1e+lIBf3qb37iBxwteb3kM79pH?=
 =?us-ascii?Q?j7vMlsMSXdAQPe6gVOVFGfsD50TDk7BBuz0a7FVaZpT42fDElzeQ/xZF+mjD?=
 =?us-ascii?Q?KACwhijMZFIwdlsfuOErkHGQCmCA6M8fYA0C+56Ga/hTstvpUt9HivmnTimW?=
 =?us-ascii?Q?BR/cyKgpg3y5ittvXsNzyOOiyQDmtdl1+U3vgQLdf8AbFJT+feiGqQtqvXO2?=
 =?us-ascii?Q?TgNrmnMISrs+3a88Kk+EPl4Ko7DtpjeGIZvlWZXFfREBJppQ/EoT0SXSelhX?=
 =?us-ascii?Q?1c13fsAPyblEMvmBYe/KScYBQ76G170x1OBK1F8jcAnD+yw/MgFRYkZOWtpm?=
 =?us-ascii?Q?7W8SpkDVw1KlY7AOSYU6sKmqLB5Sr7+TaiGGv6B0Ofabsjwt09quUGJeV4bt?=
 =?us-ascii?Q?Uscw8qyf27HTFAm1+Oy3GpMw1ZVYyPklS/btSkcgjUfrduWN23PrMyAgh0Fb?=
 =?us-ascii?Q?JbNyzVyqlDKrrOhByqpXXqJAE5WgjwDTpGPc05mx+V5sDnUlISCkBY289uNG?=
 =?us-ascii?Q?7hLoyTNcSrHVv3lfUniJh3fgTjGft65zvSx/Yzk9fRtKIB2oR3Kd/1PBapN0?=
 =?us-ascii?Q?fiuGpr94qkcya1IwNU0Em5uhppL4pwqg018wX46k4Q2A8qK+9r4tCCLs4AtV?=
 =?us-ascii?Q?bUe1TeQv8+Hnwn10QsTVdaqc5wNllYSd89D9c7E/Qg6Ja8NVvsy0M48xt43d?=
 =?us-ascii?Q?d4T9GC/UngQEdZDKAlJjv2PtgI1VYvXnNgUTC7ia5VNHEEQ+tWlxk6uabWPN?=
 =?us-ascii?Q?iZI06j1Tc5YiaTjdl8U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:17.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa0e6b7-d851-406c-b694-08de2d0b2e65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/x86_emulate/private.h     | 4 +++-
 xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 24c79c4e8f..57c5689a1e 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -15,6 +15,7 @@
 # include <xen/kernel.h>
 
 # include <asm/cpu-user-regs.h>
+# include <asm/cpuid.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/stubs.h>
@@ -32,6 +33,7 @@ void BUG(void);
 
 #else /* !__XEN__ */
 # include "x86-emulate.h"
+# define x86_vendor_is(x, y) ((x) & (y))
 #endif
 
 #ifdef __i386__
@@ -520,7 +522,7 @@ in_protmode(
 static inline bool
 _amd_like(const struct cpu_policy *cp)
 {
-    return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
+    return x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON);
 }
 
 static inline bool
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index d830aea430..36544adcec 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3104,7 +3104,7 @@ x86_emulate(
          * in fact risking to make guest OSes vulnerable to the equivalent of
          * XSA-7 (CVE-2012-0217).
          */
-        generate_exception_if(cp->x86_vendor == X86_VENDOR_INTEL &&
+        generate_exception_if(x86_vendor_is(cp->x86_vendor, X86_VENDOR_INTEL) &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
                               X86_EXC_GP, 0);
 #endif
-- 
2.43.0


