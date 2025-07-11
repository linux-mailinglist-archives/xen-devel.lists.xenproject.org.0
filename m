Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF7B011C7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040185.1411596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nT-0002Tr-2x; Fri, 11 Jul 2025 03:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040185.1411596; Fri, 11 Jul 2025 03:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nS-0002OB-U6; Fri, 11 Jul 2025 03:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1040185;
 Fri, 11 Jul 2025 03:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nQ-0002LK-PM
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:36 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2417::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d12143-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:35 +0200 (CEST)
Received: from SJ0PR03CA0068.namprd03.prod.outlook.com (2603:10b6:a03:331::13)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 03:51:30 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::3c) by SJ0PR03CA0068.outlook.office365.com
 (2603:10b6:a03:331::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 03:51:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:28 -0500
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
X-Inumbo-ID: 56d12143-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaRWeRV7FrmAkXbdCRARbW83hbGaVVdkchjmpvtGOSOlXjd/x51gmRNu6dMcWZgzODtEmJVms4y58U9XWmdnmcpeS6HKwl0yrd3SLz4zpePiipVoQtYwHKOXL6QjAGzKAjEBk9tfCtJgoZt7EeXXI+s60Lamfu7XsCPx7ezgW1jrTuSn/JisnsoZ3S1B0IC71Ii0QWv8t+t+rYvXBv4PB7DXXEHIye+ZEk8cIazdlhUKx9i/6eK1O+LfOz0G8x9SVHTf5WBMWh+n8M+zI/GOnBYjgkTqQkUPgUmu6QVBoOmRqY8fCyt5mBOC2OxfJ2MDD+fvu+ipwBPisMq2xbRq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZIVkKU+NVaxARBpqZ7HQ3xANg3Teflxal2nncwCBmE=;
 b=nZ0UbqtlG5sS699+7fdycIdxf1IiOJwClFK5pk1aq3C6z+50X0/NcazKQ14j+XhCnC78Zj30JWoPc0MIKRPZ5Hu5A4E7d5f4p+RlWrCt8B2swXaJ9oxK1U028mWglxFHkxKLdIlcBZ/P7v+Of8oWnQeqxh4KEq9aOzv7N59D/P06W2WnuW/fVcQsj+jpusoTuLBgw3QKhpdSueEwz2+NecSPI2AfSct9jr8HpKMYBSATgsRBRNP9hqXSwP6SsTOVWhsJ8KB6bPbWChkGIPALekbg82d1vEUCS0D33qQsmeM8MYwumNoLElugmrOhMM653qrdFD2IjwEkzvIOlbL4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZIVkKU+NVaxARBpqZ7HQ3xANg3Teflxal2nncwCBmE=;
 b=JBOOiOyyzy0+2smO2sDglfLX+BbKgd3Q26vljS4z3tbqT4WBZvTcJgyfpnWlKlnPzrcnmfjbefhA1wFPy6tknrHauMtmQErU74v38H38VenQD6xmJruEVMPlnNYwQJEjMcudEv2fk5MkZrR8nH9ztOWCjTcwtWIKYZ4/1ZpSSbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v6 03/19] tools: optimize cpufreq average freq print
Date: Fri, 11 Jul 2025 11:50:50 +0800
Message-ID: <20250711035106.2540522-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 25692be2-97bf-40e7-55cd-08ddc02e3881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nXpxQpT6VUJYz+LqDjy0tjg7atqfsPNo4Xa5slevkcSSUkIg58lm6igzcqd5?=
 =?us-ascii?Q?/5FbPzPzmc3Hs+WDIKR/aYiejmEaF1/Poj9O/nR/BmdG2pNOBS7k6wAjJyrY?=
 =?us-ascii?Q?qHnY2MpdgSTqw0i/HUoVrf23CcFWSHbNAasTP+W1pJqCP5uatlQEiN4cMNAs?=
 =?us-ascii?Q?DwPaA8WiHJgy1iQ8tK+ne1bMdCfVWsHZcOQazpbh0E4T5Y+MONWDmZfcR8ad?=
 =?us-ascii?Q?51624bRTt7048Bvdqdwnjub3xDBVGJMNEzhSetZwmsNly6MRai+SfrQF7PPm?=
 =?us-ascii?Q?kaCq/eprX4MxsEcCiwoGEdAmpfgKNK9m+RWAlAF9w/y7GkjuiEX8L3HtOM1c?=
 =?us-ascii?Q?62dBBcylBjQjxcAgXqvkb9pGZSJJTc3aE72WG0qCQA961THUcTDZOp8sP26I?=
 =?us-ascii?Q?IIR4fFclywCJVa+faDvbONdEbkQh8N+yvp6aRtcdEZ4mt4XGLjuacmEOTiE7?=
 =?us-ascii?Q?UqY7eyESjiqOyyuN4HYE+IfT2kYHD9BGyqDqeUemfcjExQaRoiCaGJHh4gIM?=
 =?us-ascii?Q?CL63ed25XRix/Po2pMJ3+43CpTYqVVcX6J+L9j2T+5ZwTGp68eJIO8sxoyGZ?=
 =?us-ascii?Q?1ok8kjGlBDN7jL90Y6LpC/ajf86NUsUrL5Bza3Q3EYRzYsfxxrnPZmj1+Kru?=
 =?us-ascii?Q?69aVHQYSiWpKLkGR+hH91DSqr/Nk71Mrjy9Wty4HTAxbV1Lx5VcSNG9/8JdJ?=
 =?us-ascii?Q?0BncanQoVJNqblSmLSe0H1TB/fOk5zPlWmuRXRqKwDVJg962EZ/zBNQwY7N5?=
 =?us-ascii?Q?8VBw9gYzBJqXrqRk3iU9HlaOBxQHDErrFbFqXUWRxe6e0g32tU+45FZs0aEY?=
 =?us-ascii?Q?NhUug6Xg/0Lzu0AP5kfMpF3KEQ3fjE58ftQ1XWqItg7hIJLvUNjrFzcHjOCb?=
 =?us-ascii?Q?CuBwxreVBdkw8aY6hGf5h8SMV7F3KkCZEyooVSaLl6yczOKq+T2VWwJ1IAd+?=
 =?us-ascii?Q?NBUNKoD/bGsotNojlU3Pu9etzPptI9uwtpkhAX0i30rTj/SYMaJWVO1gCmg5?=
 =?us-ascii?Q?ioa4Fgha98vzWWjWtany8L/oYVtm5VCWyuf/oA7eclfdJT8SXRZ3DzyxGSjN?=
 =?us-ascii?Q?7BObPWjHVhfptFknp8zEzpyUPowP4Bzmc3KsnVnpg26MQVAECXo1hXQxsN9N?=
 =?us-ascii?Q?6xy0bmqyO3Af9v1z5lnrmXxAE/EO9DtgJM3+eQ6sT/wsNcjXIgZuyIs7kZer?=
 =?us-ascii?Q?xX6GK4LivU1lM+TPC1mkOqL4w1xVPVyy/E+cSmYfEdIEKYs1w+JkN0Z+0N5E?=
 =?us-ascii?Q?gHQdynB3GZLx577ghLjVHo4zKcJ4Jfx5dUm5eI/JkIG9m/1PG82sHTJkJpdS?=
 =?us-ascii?Q?mqvj4W3NUuALIX2to/7d5E60kSTDwYuAg/iFoHtBaMq0dU9DJBvH5iU/3s9e?=
 =?us-ascii?Q?0urUmf0WUAyWFflYrkvgYgWBUdfoj1/DP0Yawo0RoBcs6Av/zTKOkjtGpRhM?=
 =?us-ascii?Q?RmevP44pqizjaMUr5Z1to+0oxOPU4cXKVOPPL51XUX/HJdvYvDb9dYAEOwAY?=
 =?us-ascii?Q?SylUK7SRIr0XrDga3XG+SvYc8jE7n0S2ojgW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:30.4135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25692be2-97bf-40e7-55cd-08ddc02e3881
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217

Unlike Cx/Px states, for which we need an extra loop to summerize residency (
sum_cx[]/sum_px[]), we could call get_avgfreq_by_cpuid() right before printing.
Also, with later introduction of CPPC mode, average frequency print shall
not depend on the existence of legacy P-states, so we remove "px_cap"
dependancy check.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- refactor title and commit message
- call get_avgfreq_by_cpuid() right before printing
---
v5 -> v6:
- remove "Fixes:xxx"
---
 tools/misc/xenpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index d5387f5f06..bbe45fa548 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -510,9 +510,6 @@ static void signal_int_handler(int signo)
                                  pxstat_start[i].pt[j].residency;
     }
 
-    for ( i = 0; i < max_cpu_nr; i++ )
-        get_avgfreq_by_cpuid(xc_handle, i, &avgfreq[i]);
-
     printf("Elapsed time (ms): %"PRIu64"\n", (usec_end - usec_start) / 1000UL);
     for ( i = 0; i < max_cpu_nr; i++ )
     {
@@ -553,7 +550,8 @@ static void signal_int_handler(int signo)
                         res / 1000000UL, 100UL * res / (double)sum_px[i]);
             }
         }
-        if ( px_cap && avgfreq[i] )
+        get_avgfreq_by_cpuid(xc_handle, i, &avgfreq[i]);
+        if ( avgfreq[i] )
             printf("  Avg freq\t%d\tKHz\n", avgfreq[i]);
     }
 
-- 
2.34.1


