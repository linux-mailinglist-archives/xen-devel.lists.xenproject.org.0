Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FDAC8D60
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000819.1381048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyaA-0007oK-C6; Fri, 30 May 2025 12:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000819.1381048; Fri, 30 May 2025 12:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyaA-0007mH-8U; Fri, 30 May 2025 12:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1000819;
 Fri, 30 May 2025 12:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySU-00076q-0x
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2415::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1af8e6d6-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:32 +0200 (CEST)
Received: from CH0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:610:b1::8)
 by CYYPR12MB8701.namprd12.prod.outlook.com (2603:10b6:930:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 12:03:25 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::8a) by CH0PR13CA0003.outlook.office365.com
 (2603:10b6:610:b1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 12:03:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:24 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:22 -0500
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
X-Inumbo-ID: 1af8e6d6-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2l1Toe2RZF/N4xhqBhqqgmVCR/CDiSq47ExVoV0yZ6FqpcOp+ZnfVNrTf0SiyVgriNpMhAXiWY/SW/92itvWGe8Uv4IFJ4yzN7nOJLUb5OpMR2BwbKeI5xnoRIRQosl2g4UtLesEFp5K8FFLIAAle9d274GYYcxlr4kXnrUMLCqotgmRKVYNBmISMcdihlozH6tsz4DCjjVj2xn1l/6jvZJ6lka090H763f8rUp2jKG/6kTDZLxV0dPr/PoY5PQwrTTRPamNoYJQ2cmMln5buu6UhaWbnViaGQcadgEQ80SbVni1ki96kXuODBQjLtEBIGZi6xOPtnLvzdvEiH5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCNBXPXD2aKN1qe1F0kvtAXVlpJprW3tfZvK/Z8sjKc=;
 b=HPskpW0DkqHpsjORbSMq2hA2HisLfCY0GeoYgJyR44vpCyLnioHNiX9P74HxQ+nIsf2vK2LaDAqFSEIq6gHqq5lgQTpuBhHeaAwzN1qyccJGEQk8St7RE3AEbO77N4+ppHZbgghyo8uuVPgSuSdO4cW/X4Fzp5ignn5/lH1woJmHZwFBHe/nRsCSVjXsCVmwA8NGCdZTd1fYxX/JNM1VKk7vjP3rVoJVHYfD/ZGgWnzOJ5vq/1OxnyFiyOSQuLro70ubCIrogHIlMgWLQGnEI4eClPDVlRgILrfY+XQraXzLnbfJvWmfZlJKmGCj6J04ihSNsUMzjffskG8IEAP9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCNBXPXD2aKN1qe1F0kvtAXVlpJprW3tfZvK/Z8sjKc=;
 b=UoIgWKwwOG5PfdoJN3/q0roPujJbKYCxiD1qKJgpNKgFlf8iar8hjlQQZWn08vhUaBPFiyEwCoqHrfDrxZQf7RjytVdEGlTdu9CAnwqsriGJBVz9yOhkInoX9mfqyfrmIT3kHLUXZ9BD4VDLaX1rp9jIdKYeHaXtuD7lLBQRdfM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 09/19] x86: Preinitialise all modules to be of kind BOOTMOD_UNKNOWN
Date: Fri, 30 May 2025 14:02:17 +0200
Message-ID: <20250530120242.39398-10-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|CYYPR12MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 0594b330-22c6-49ee-0818-08dd9f71fac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BnlSpW3J1x67g0+/Ocgag8Jp9EC7m2MTi9LfIKWDldWK4SpHHlq9IMuPUZ3Y?=
 =?us-ascii?Q?by5Fb6kelrpa/HkhvSM5diIPzkOTs/tDR+maMvtlr3FXkKsZkbfxpk+q8HUq?=
 =?us-ascii?Q?H9V0xRO58oMG2TO0Fn7qrlvlkAW3MIF4KtuEZq0sNq4sorCABmjMXTN0+6hC?=
 =?us-ascii?Q?ngttbCYBghRkxGxrTeOAgNxNp8ovouSyg/KMsDDpuxVxx45IQqATLcQ+FWSn?=
 =?us-ascii?Q?v+2wG+C1BvuC1EBjJh5K+3gpWxoB9NwM/9w6xn9WC7qbOKERBCtqUF6EMnF9?=
 =?us-ascii?Q?KBwDo4LABhmDiZA4VhDyEwx+umufNCh4EAGxOR+WXvWTdcH9NUpy6oGGlZ0m?=
 =?us-ascii?Q?ftprhEQ6lfu9IKSIG7lZ9r86flVqlwS6id+wCLLGuRrYDpijis6LhBjJLm7L?=
 =?us-ascii?Q?dGqJSZsFT1ySf/fTE8EhSDJkXD9cgVjIiZdAQ4BwXA5DBLRBSVbQG24v7rDE?=
 =?us-ascii?Q?7pE/o0tm/9RA27uulJtlWiR6PA9KGiC0NIJFQiKuFHQEVhCWO0pGWrhPxvbA?=
 =?us-ascii?Q?MsUb+qvIZQCLlE0pXCr7wjIhRAz46tbiSpF52FMy36qTOYTYxnxrnNLCpoz+?=
 =?us-ascii?Q?FwZozNXBTxIEhYfHHiz07xWQE4C3Rg22c1WmW4DL66Ot1o518+oEYLucho8p?=
 =?us-ascii?Q?kZFUkY1eskfWe8h5S0TJI13UTBTvhoOIg6AaRVW8zjVNH1+vslNCcOb5iBoq?=
 =?us-ascii?Q?CsYEgc28PpFB0AGgUNIr5WouiCIe8XzdBfU2zylg86oFaUnzQZAuSXb+pM84?=
 =?us-ascii?Q?63A5eeT3tBN1cHIo7mfhuTJGgMn1t4XbTbH4itJXrSF90XEHNx+2dorgrQ9O?=
 =?us-ascii?Q?ZHTmw8n+32OH1+BJX3hyMdLzVy+38VmYvDN+DdYXdYLXIsKzBVlDp5BY+hmW?=
 =?us-ascii?Q?uMZaliWUSspB0nrdNczgl2pxDQN4mEu6sxO1sqSc//+/RNfY83CGlLnFUQU/?=
 =?us-ascii?Q?f6OmvRZav2X/CkMkb22UNXBboNVNodVY8uRiWXeW8cPQkFmEIpvHa74QErIq?=
 =?us-ascii?Q?z5cMuaUfaDMZ6LLDF5XYmZNF7XMNH84Pfn0Y5gK2UsAl2uPhQlXvnsMsdfD7?=
 =?us-ascii?Q?eVBUPjfx+5Iv7Q7J6iaIn6u5+mOA1Xw+WmXPQoQdcXX2NoZTidipmo/Vds/E?=
 =?us-ascii?Q?qzRBVNNgEhwX0dOgKLkCHKDnpc88SQuhBtSIrUaoWJ8KZiQ9nU3gRsgdjbLb?=
 =?us-ascii?Q?k1g0NXWKo1mv3T3w5U4toRzWZvvEOZ1RjJlsXmNUKTKZMEYc05EYfmJvz2eG?=
 =?us-ascii?Q?nXsLodKMpmhbfX9LqD7pP3qrZolbJRxejAh6q1ex3fYD8XZBnMe2LzBwUxmJ?=
 =?us-ascii?Q?B6lrjs4Xv1Rb6pqFQYQ8j8nT3n/sUc538SXhitXEdK2RA2oaN3Llwlvp0kTg?=
 =?us-ascii?Q?uVK50SJ3v2RiD4e12KXj0xkGJcVqZ5flyHL9V0ZZATeOuGpvPbj5I+tb3Hij?=
 =?us-ascii?Q?BIGNrT/4fz28fe/hRBBYkudliOFVyrw3CN1xmZNxBuM8Z7VdpKczf5r7zV4H?=
 =?us-ascii?Q?+ypylZltmgmZsL20QpGtZSIaLQppulBQSV/3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:24.3319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0594b330-22c6-49ee-0818-08dd9f71fac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8701

A later patch removes boot_module and replaces its uses with bootmodule.
The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
value, so it must be explicitly set in the static xen_boot_info.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/x86/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1f5cb67bd0..5da9df33c9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -298,6 +298,7 @@ struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
     .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
+    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
 };
 
 static struct boot_info *__init multiboot_fill_boot_info(
-- 
2.43.0


