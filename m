Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530A9CF11B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837781.1253701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByt8-0002no-6C; Fri, 15 Nov 2024 16:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837781.1253701; Fri, 15 Nov 2024 16:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByt8-0002kd-2G; Fri, 15 Nov 2024 16:09:38 +0000
Received: by outflank-mailman (input) for mailman id 837781;
 Fri, 15 Nov 2024 16:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHts=SK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tByt6-0001uH-D0
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:09:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2416::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff78e720-a36b-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 17:09:33 +0100 (CET)
Received: from SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::12)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 16:09:29 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::c6) by SA1P222CA0063.outlook.office365.com
 (2603:10b6:806:2c1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 16:09:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 16:09:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:09:27 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 10:09:27 -0600
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
X-Inumbo-ID: ff78e720-a36b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjExIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZmNzhlNzIwLWEzNmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjg2OTczLjA1MTA4Nywic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7PNeZvildj1e/UGOukygLOJYFvd8+M49rvjZf8tQsQ17fskhNSbp9gpjizWmrWz99K4YhMtYs7jMaQ3r7zSmOmXlIcflGCuxD/4YdKoqtH2UwfmYuLEfJU48dEyzzsZz92zXZI6/t44r4FCJ+6TfXJ7LXWC3v3oQVNy3gCXHrOMueqHWpFtFk0cpvlL7GE063LnPjJ93UlWxRqvUjE0/IwrUzL+r62PlKA76NGOStAioub9v92MNTsKqJZ21rdFUWrSXCP8Cw33sV5ZDCJBUu+I/jO6ytnMDLUONo+s4Vr+yPSeWgv/p2bkvKwIJ15uOtvMXWcmlfChog+8b0Wtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7wZt1IMcuMFrVXQ5VvCHPZJN8BgmZL4SJb/J4aUccI=;
 b=E+6MKcwchzuMCUlQLjlDTl+vCookiq+mlQ80eEgWTtx9Fv0Z1/4k881kvx5ZGuc/bIxgIWQgXDcoYqLiswI9hnukHp2BkXDjd2xjSR/8WPJC5ARAJj+nXmobCZvR9igrW1lsFLfHlT/ajVxZIgRd9uBot4456/hvfEgCgk52M+olrnmCSEqvjxmeHK3Y79hWvoViquDVcYFurguEGsS3Y2PnGYWX1rUWKXgmaRZvgamMtw2hMwkR9NJQ85odBoQEqA0KoaH6fO3ftUGsJ335644R6iImcy71689p6GSD6KDdgYnp7ZKIsv9RnEB1wdx4JCxvGSsU0LHzbgWei1BL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7wZt1IMcuMFrVXQ5VvCHPZJN8BgmZL4SJb/J4aUccI=;
 b=B3vdZkst+KgWmTW6mhHDlt0AXkdPz1h1J2Dikw/320XJ1FX7gBuAn7HwY4s+T731wx08cpY82x0Xg8JYS/G4eIz5STaLsRYmT59Hs6GkTLICKY2KGSxHqXb4g/+Hos7nOVcKxRRPdlTsMbvIaPVizHR4EndEasC499xlWBdShwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v8 3/3] xen/pci: remove logic catering to adding VF without PF
Date: Fri, 15 Nov 2024 11:09:04 -0500
Message-ID: <20241115160905.551224-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115160905.551224-1-stewart.hildebrand@amd.com>
References: <20241115160905.551224-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 005b4062-2761-42a9-1e97-08dd058fe1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XRQ5Is108KhBajSMrMht++jzfH3XEO3c3DYNVTb8pj13aJmLI6Kdy8ZyNtDv?=
 =?us-ascii?Q?RqG+4oyZFk20dPYzi2+itImYDIeaMXgTx9iOBwfqMGfefBQEwSfbtUDCwi2b?=
 =?us-ascii?Q?nZWhwoqRw2Si+PKhEVRzyqzAbMPAP0YBz32d3f4bgzEuD14V/JQdnl6ekNFz?=
 =?us-ascii?Q?tQhoiWu3/ZiAkfyft4j8GYmc1PXvQ4PNgcOn69JurSlr6dypjop+EUdhJEQq?=
 =?us-ascii?Q?Yve5cpuejh/Oql2F3AtezmTwoagrhY5SiLswZYood5MZasIpDYgF6tJQ53fc?=
 =?us-ascii?Q?dhTr+tJO9r1zvAPGFarTEI3WloA5UHdPDdFzsBwmd/MQ2xkHyV3jRAaetkkK?=
 =?us-ascii?Q?zB1300EODkc22yyoINwxncjBjYWBQHgQtcqGuKnSnwZZUs9+TnVX+HrtbM0f?=
 =?us-ascii?Q?m5LDQcMmGM8s7PBDZhnU5W5EKEVZtPYkp6hGdMJ8PffZ7Hmg8cUihcL5vKO7?=
 =?us-ascii?Q?FAZ/kFzlMdkOMUCy9YcH6SUDpgV1IxjyNjm/wLKRfe6OatYtJHDaNmn6+ARp?=
 =?us-ascii?Q?b7LLS88hGvWoiOciGoFwHcWXTLRuiDgt6tRwAYFaZlXUSjGA1iPuoGsjs9DU?=
 =?us-ascii?Q?4/+is2GYSesweoqCrgHAZjK+XMN3p8Xn3g8RGpx6wrcHL2znuqd85DdoC8p+?=
 =?us-ascii?Q?fGDkvR2ujzMq/hHEbLVUPq+ombKyQCZIPg4tpSYudKLkxUOnx4pE1SEE6MNo?=
 =?us-ascii?Q?n2wfEcZuGGfP5/Q/R9+i6Sl6t57oXswwmZV60O5iWZzEnhcNC6qF8icoFYQZ?=
 =?us-ascii?Q?bzG3aCFZX5L450lZ3wcpVes1TYWxi6TxYDotMUkfE+f8HtW5/CvGPd7SRF9c?=
 =?us-ascii?Q?cDoYDDSx1Q3tCUPEk3eJlbUPcImWORoiq/RhOcDccPDVKpvc6ZtEWiIbMlO5?=
 =?us-ascii?Q?DMLHbYRi67BrL75hRkYrQs50F62ZIxMyXDFtb1yB2JCz3yMfIdRUL6lMfCZy?=
 =?us-ascii?Q?WkuBqn6N38utHm4vI37a92igG68UY1Z9St2TdP/Fo2fZSxkrWJiLqNZgEDbV?=
 =?us-ascii?Q?q1jspQdXg7XceB+NHKqnCovtXFJXYPMajTEJjPrDf7UI5bCGL6AYtG3BOjLm?=
 =?us-ascii?Q?qROd/HmSMlmR0vKX5AbWutxPCyIqzHzrmDjUXebXEOrg46eXdjcltGHn7KH7?=
 =?us-ascii?Q?8jZ8roO3OJ9yfPYLTc016jfpXmh4jpHKmvvzeYeTtN6tOooy+I9EEJUaJsNy?=
 =?us-ascii?Q?CmLXRE1svf46DO0bhO6CZT5M/LXm+13/g/mRaDNNfXgS/QNraNMvlTfRSbev?=
 =?us-ascii?Q?go0NdUq7615SncKSFSFDSGJbgGYtpsqXNqREja6hORGaOdI87cR2lHL30/lk?=
 =?us-ascii?Q?8mvbzcrOgMOKVZOHcg5VK2cq6n7zew6fnz47G8R2LCZX/soy8NqP9Bl3iNw5?=
 =?us-ascii?Q?9Tvlepg5PY+YIFBheT1diKGc6GWTvk2fbSoiz6n6Iq9f23h90w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 16:09:28.1785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005b4062-2761-42a9-1e97-08dd058fe1cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523

The hardware domain is expected to add a PF first before adding
associated VFs. If adding happens out of order, print a warning and
return an error. Drop the recursive call to pci_add_device().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not for backport

v7->v8:
* new patch, split from PF<->VF links
---
 xen/drivers/passthrough/pci.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 6af1136b6350..f50dfaed75ba 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -699,30 +699,13 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
 
             if ( !pf_pdev )
             {
-                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
-                                     NULL, node);
-                if ( ret )
-                {
-                    printk(XENLOG_WARNING
-                           "Failed to add SR-IOV device PF %pp for VF %pp\n",
-                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
-                           &pdev->sbdf);
-                    free_pdev(pseg, pdev);
-                    goto out;
-                }
-                pf_pdev = pci_get_pdev(NULL, PCI_SBDF(seg, info->physfn.bus,
-                                                      info->physfn.devfn));
-                if ( !pf_pdev )
-                {
-                    printk(XENLOG_ERR
-                           "Inconsistent PCI state: failed to find newly added PF %pp for VF %pp\n",
-                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
-                           &pdev->sbdf);
-                    ASSERT_UNREACHABLE();
-                    free_pdev(pseg, pdev);
-                    ret = -EILSEQ;
-                    goto out;
-                }
+                printk(XENLOG_WARNING
+                       "Attempted to add SR-IOV VF %pp without PF %pp\n",
+                       &pdev->sbdf,
+                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn));
+                free_pdev(pseg, pdev);
+                ret = -ENODEV;
+                goto out;
             }
 
             if ( !pdev->pf_pdev )
-- 
2.47.0


