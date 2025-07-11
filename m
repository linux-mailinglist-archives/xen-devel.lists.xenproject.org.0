Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445EB011BE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040194.1411679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4ne-0004eZ-6b; Fri, 11 Jul 2025 03:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040194.1411679; Fri, 11 Jul 2025 03:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4ne-0004bZ-0r; Fri, 11 Jul 2025 03:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1040194;
 Fri, 11 Jul 2025 03:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nc-0002LK-0c
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2417::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dc836d6-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:47 +0200 (CEST)
Received: from SJ0PR03CA0251.namprd03.prod.outlook.com (2603:10b6:a03:3a0::16)
 by CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 03:51:43 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::97) by SJ0PR03CA0251.outlook.office365.com
 (2603:10b6:a03:3a0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.26 via Frontend Transport; Fri,
 11 Jul 2025 03:51:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:40 -0500
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
X-Inumbo-ID: 5dc836d6-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExK/Qp1MRsKNJSD32vwmOtZbtidaiAmcvQtzw19KHdcIjIqTIf3L6ZqquXUy34XopTJvCEiOwC/EQYjkUilUAnyWxr+ntTkHiqeNi2L/fNBzCeNJixX/lOAwvpSf/OE7IbBHyQPzJGzmufZJsQL3q97PaGt5yfcum+4bk0lxsy91rikZ8YHmLYShYaO15j8Ldn2NyH/5Gq54k9eiQEGi2Kce8w+XYwgYLC1ZFzsJQ95MNeAEBdf1fa3peGrD7lTMIwUL5M0x8glz3uY9X+L4Tr7+aUDLkrDjTrOyiCLbab6A7eBm1qOI2rSFSIinsOAxXnEQyZzOk3Lqm8Jbbfu4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf/WnuyeIERI/Rc14bKyV8xkvXuu/ZtjwnyDRRhEpxE=;
 b=fHhs1NzIrB+UQp9kU0HX/kMCRA/49PfgJfd/R4XSM+Qlra0mCOoDUD6Q4qH9cScZT0PgrO+BeHyIErg5LTs++jCGWI3c401grRZKHUCCUxzNMSIZypSOJhUF8YadX8+7JThMC2OVY8oSzjq95h7SLc9C3KT7rz68P9sTS26etiDVtsVFhu70CuDJ4P9otdxzUTbW9a1DJd0h8v8dOIZY3fYIu1KSsrpXctyMvgplWtQlWW2DKr953xtLgtv6Xim2T2ni8v1RJgcxPYWlOSH7ajPCGCZMnxmG/ZFy9BpRYTq/bdQWDk6zEqTD3YId/CUuFyRlLvrRIc4fcwqNk/EOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf/WnuyeIERI/Rc14bKyV8xkvXuu/ZtjwnyDRRhEpxE=;
 b=STsekkTDIUrRSg9RPsPef0srJBT4KBzL1HPVIT8y/M88UBfkdcH43WxfH3hU0JLgOixTEZI+MsjQMDpKg8fjm6RDaR6V05Kx+TtGACaTpxi/qpzWZ6bRSzdFm76qlpcVxOFlsOsBnj3Qmh0Ak1OSXJyDYFAdXKeKN4t3PSIXYgQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 09/19] xen/cpufreq: neglect unsupported-mode request from DOM0
Date: Fri, 11 Jul 2025 11:50:56 +0800
Message-ID: <20250711035106.2540522-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|CH8PR12MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c321701-0e3e-4b23-5261-08ddc02e3ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j/oMU84pLPzEzk0vaUZI20xpyiFTJtvtuc4pOivuzJBO/RZkgcu2OoKytoJh?=
 =?us-ascii?Q?gtMIRMvVTFCXgnkNjto4NkelZiB+5umxslWYEhYhhxPmTQEsGrr/uL1DMmcn?=
 =?us-ascii?Q?43DYLv59ha7U8obrBcaQZ2HTYqH1vbEHiX8VJ7jCqUkkoEsmwiPRUWE6Xp+B?=
 =?us-ascii?Q?Rgvn2BlsFUAE7zJRl7+5pXT6f1/TjE42tRbt7sk4FqlRiMs3lmBuyASixFmU?=
 =?us-ascii?Q?qVGjVICtIstcMmwtwJexKozZqlppAClP1K1mvfBGl+Nzp91GbHwTqPvcZcf3?=
 =?us-ascii?Q?bAZHwqiEYSl7y+XaN2oKBV9c3DI/zQoRFSir3zcNjPU0Y04RhtpeED6SqaXB?=
 =?us-ascii?Q?2L35dPht7YVGztXXrxankfhBYWzLW2JuUhXZgcyLjX/ae9zXMNhBEq7BtiJc?=
 =?us-ascii?Q?a5/UAmRrHvpJoclpEAShaj6iAJaPZyvyypPS34boJGpKpwPnv5UUmXeTZM9Y?=
 =?us-ascii?Q?fcCk4LspJ+XI2zUoszKdJHZfrSZ3G/WXuyrkw2BM2TswsdyAKDqqSwTkJi6k?=
 =?us-ascii?Q?BHWieVaxKit784CnaE5xL0FvJw5CHKKjO2tR1Uawq+JVbj+E2bafldQnFhsQ?=
 =?us-ascii?Q?bmtcM10vADvS2KwIusOLMV0ZwIeN4wVHZM0IIY+RsAoOlkbcmHNHnszNB6e5?=
 =?us-ascii?Q?7XD6T/YMmFFe7dgptSsIW3nuQTSXgsOyZpmStyrrxwJFz+bZQgwL2aOoivAK?=
 =?us-ascii?Q?Dsu1t5+ylTLhvpLhwGU6kfFARhPbzQZmE4PjNWKbetwyh7aLPoXNO4hU3CHx?=
 =?us-ascii?Q?bvKO5KaTUG0e2T3U929flJGA+MIP5mZzY6ZADNxVzFfbeRDRBPP5BwvfAH5J?=
 =?us-ascii?Q?GZmSAUQHG1E4gJoykUQybxL3/C3UcIIm9iKqlbd95UhqmIdeL0pS4VsdWM9r?=
 =?us-ascii?Q?EXGf8hZKizBwVl/jsaHeZZ+aYN4+ZEwX6boja4FRKt8xisoabmfiYouwUqsO?=
 =?us-ascii?Q?QxzWncWpN62fek9KdmaT2MvxEU1WkL/EucUlcueriX8P06jt6Ms1Z7bR/0c0?=
 =?us-ascii?Q?Su02ibyXsckE8pice+U/+McaYYuRtzja/pmHNPnLdtdpQ5X1S2UxveNPnL+v?=
 =?us-ascii?Q?fuHEB5eSrn6S6TyFWyjPDk6STIxFRWFO9LC92guKuP4l8CbxrWpUX0atHW9O?=
 =?us-ascii?Q?40LM1is2oJ+OzFR54Nvk3ETx0UIv8rwGOQ+8XdKTGcMSlTZev3GOCa9thn2g?=
 =?us-ascii?Q?EI+EW2H3djsSz0Do/JwaFZ24StGn1kWfM7hgH3JaoFJAHe3KAKNwD7YW3MNx?=
 =?us-ascii?Q?x9Gjy3SIlWlFJzOXfmyh3hCOBeEQ5gD0MUaCBSdI/XIhcL6pAv68fcsQv801?=
 =?us-ascii?Q?l86N48huCuUSWYliUxr0f6lTMXhYImzy+nNZuIfmpXgAi49RNRWVo8Sn6UCO?=
 =?us-ascii?Q?PZeQK4qW/VjQRRYrOGdBk3uSq+hYU5CyJX8yDS9M9psFh2XWWo05r0tIRdfD?=
 =?us-ascii?Q?IVenhYuyIv+ZLZF9nTpVewmxycyiZFYwmh2VWSDG7dppUL9kSGwr3e/5JNCU?=
 =?us-ascii?Q?treiaZwmhJ8HHtyljtFlJV8edntSrAhWh9Bd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:42.9070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c321701-0e3e-4b23-5261-08ddc02e3ff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9768

DOM0 could deliever whatever performance statistic (Px, _CPC) it parses, it is
Xen's responsibility to decide which one it shall accept.
Xen rely on XEN_PROCESSOR_PM_xxx flag to tell which mode ( Px or CPPC )
current cpufreq driver supports, and accepts relative info. It will neglect
unsupported-mode request and yields success.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v5 -> v6:
- new commit
---
 xen/arch/x86/platform_hypercall.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 90abd3197f..3eba791889 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -539,9 +539,14 @@ ret_t do_platform_op(
         case XEN_PM_PX:
             if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             {
-                ret = -ENOSYS;
+                /*
+                 * Neglect Px-info when registered cpufreq driver
+                 * isn't in Px mode
+                 */
+                ret = 0;
                 break;
             }
+
             ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
             break;
  
-- 
2.34.1


