Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A1B19354
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068419.1432507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMm-0005vB-4X; Sun, 03 Aug 2025 09:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068419.1432507; Sun, 03 Aug 2025 09:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMl-0005nM-OE; Sun, 03 Aug 2025 09:50:55 +0000
Received: by outflank-mailman (input) for mailman id 1068419;
 Sun, 03 Aug 2025 09:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKz-0005hH-AE
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:49:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162fb05f-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:49:03 +0200 (CEST)
Received: from BYAPR21CA0028.namprd21.prod.outlook.com (2603:10b6:a03:114::38)
 by CY3PR12MB9703.namprd12.prod.outlook.com (2603:10b6:930:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 09:48:58 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::e3) by BYAPR21CA0028.outlook.office365.com
 (2603:10b6:a03:114::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.2 via Frontend Transport; Sun, 3
 Aug 2025 09:48:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:55 -0500
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
X-Inumbo-ID: 162fb05f-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fC1OHj1cEdST+Sem+H/jGhJ/X/yidKNipd7iiDwyBGIobZmgq6oovEvKAlua7DjAYeGRMsyMZNJfHon5ZEhfQ57q4VLYT3dMDqFn5f1UNTwf5EOou0lyQ4umu1uCQiUxZaq698yX96e6DDVNSSlcS0vbiIgW2E1Z4lac8H7ehlOO61Qema0FXuD+iynhp+sv+LtirEb4unTcCZIh23chvLgnlLlSg1y49P4ZsdGIBslm8ClY+vnFaZvzPVofEXgNlmG6B9V2zJEfFq6aJS6CPNrl8F6TJ9mROD6dKEE/Ogkdtp/pHoCQSiCD+5D5mOvy1ExrKfgjPS9I+q4pFyESTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxBVVuM9AFCNC1071z+SXo53e0F+nIHP1SBsQrWMLKg=;
 b=IJ3XW5phwL533XiKaSkIw1CMjebW/luFPHSNjQGCCcbhO3LnLf19WGIVXvs3VL0VOoMxFGMF93NQlJ9D0Sfu+oHk6xZkcWoL547BhCqSXD9qGnC9y9u/7mUMRp8OtKrvHTid1llmCzDKmXtWPoT1+Eua24XdpJgeHA2ledRN43MthaISwOc3a2bhwD4Ejj5VP6Vq4cFciP3x3vUAAhdiE8IX/xVdUbbZi/0lULrjFyMfmjOrUcypa6L/mA63PeMdj18zNF2fcBft5dQ1cHB1qXp/HfBS3Tdt+UKe13jBXgvyEKcrK8paXa6TaDlw6DN0u0Y2sGTIL28LwEJPTn7Ckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxBVVuM9AFCNC1071z+SXo53e0F+nIHP1SBsQrWMLKg=;
 b=GGtkZP1h9KC59XMD9VfCYmndLSnSr4elVuGEhWoMck79Pc+SrbLwNnrwbwUxb03bbXLtr0ti65Zk1rvWE284RHTSO6k4/QfLT9HxraR7sEbAKrEoJ3xr5U0Z+hXAwfS2zZ1Qiy2wpBW2Uegb7jGLgtnnZW7qjZp/FRRS1TP6/KQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 20/25] xen/domctl: wrap around XEN_DOMCTL_set_virq_handler
Date: Sun, 3 Aug 2025 17:47:33 +0800
Message-ID: <20250803094738.3625269-21-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|CY3PR12MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c46e3e9-4a44-4a30-1aa0-08ddd272f814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bzv1aLL0QRQT8x3cWbCO/sHIR7hFmbx0/YNtAGVqivZdEaUi/OIpcZPhBdbY?=
 =?us-ascii?Q?hFU8kNGYm2rTwg5wvCWpKCyYPAtpIi64TPBuhAyMO73BDV5xf2Yg6qEEdbIx?=
 =?us-ascii?Q?hHkMWWtgd63QzIWC+pWU3IQvHB69SvCUMAchUzj+J0Vmw8d5tp/Mj8WeODVB?=
 =?us-ascii?Q?6XsSGcD3LAy9ZEGeU4ct4NoLtFgAi4On6p5hjfhhPo7NTEN6cNyxfjpEKNPX?=
 =?us-ascii?Q?6oNLC88ds/+4FAwJ7/ULwx/IwuZfBRJ90OQoNa3Q6FS9XhXT9BbQvwmqpRek?=
 =?us-ascii?Q?NJ7xtmUTESCQ85PKStunvwysaow8dBXiVkDV06dYI/Rfc+vqKcwXzGT9oze/?=
 =?us-ascii?Q?ditKxSIHIB4Rrbw4C9V1w8vv5xqCGi2HGysHoBFzdRfB6p5QRVczAp6g0lgh?=
 =?us-ascii?Q?b0OAf76k6H7kaS/dBtbhm8psKTWj44oiRhCjAhHfMpvqz5rV9hEdRFJhQ2sQ?=
 =?us-ascii?Q?cIHgE1RMRG4ljYp8P6ObIgmOmIR/pFOnFWjS4UA4/UqCRr0m1vCQ/+YKENHR?=
 =?us-ascii?Q?AX4TgS0R2vQR8PPIEF1xIb+98idFtbYoGfgvR8ntaUci4rIaVXWVVJ+9heN4?=
 =?us-ascii?Q?X2gmPv/ujVSvbsFd2T8dZQnjJe9tQeDUdxMSp7hos7dwE+BvoF/PO+QYpqVQ?=
 =?us-ascii?Q?cXsY9IyFBWeXYIcSZN7Q+pZ6/WhNdH+uzttyVmOiqlVGjtMYxOt3jgLopYUv?=
 =?us-ascii?Q?NfJas9c6wd59AF67uTIJLR0B72kHEwOQyBAkd5WfV6vaXVSbCTJ9W4wzL3f6?=
 =?us-ascii?Q?L6dLYvkZO4DZhxMAB99PzXCUWyzCnMTQdfS6CbeV3FjetUKu3jkCh1a2VLQe?=
 =?us-ascii?Q?hDKz6ofXS7/FADxbwn+86bfr+F2pbND/GLGmqd0vm8eCgXdlGFLas/DcEge4?=
 =?us-ascii?Q?puUQYi16QWlUSubB8vtwKqzv2Z+HhXyasN0nDHw3pp0jwpnJJ7INnFMmaRvD?=
 =?us-ascii?Q?zR5QcA8XXmmtuLqHQXcBUwj1G2B54zvRYF9w+msJGaf38d4tpsOxYMgybxVh?=
 =?us-ascii?Q?vzPuS6FUUV66hKjq8+eB5VKvxam0DDSZ/3Cc9lXZYw2Mf6zpj7kuYR8IO5mg?=
 =?us-ascii?Q?tipmybRtrb/hcUvGztiXMwgxcNBIiMAo/FTyMesCty00181QY9n/zLD9bO4X?=
 =?us-ascii?Q?hNclewuy+q11F17Z9zJqV6088uSTRIEWo/Mh7Oh2l5/15cuvrVxs0QA5oaYq?=
 =?us-ascii?Q?V875CGIlR1mOtEjydcjMYWGXcrkjDCbUoQhuUrYT/bNxw0hKqjceYt6WYXuj?=
 =?us-ascii?Q?U8O2uzfCLb9oeT/QpV7eZC639Sxua9texeNOkUyUC7AAqErArlfhOKjKGfZc?=
 =?us-ascii?Q?tV+0Llil6Ilj0c+IkBIbKjyYCZ17Y+n9sep9A1nw1SsEt0Qbl07DolI3BoXp?=
 =?us-ascii?Q?MDAPkBaiIxHOKWLBAgrbjVDN+oI3TYVbJx7FPHYKoipyo23DVveS3gnycUzE?=
 =?us-ascii?Q?trpsrLhoJIaQ4+ZFWGXyc47RWsHbyKJGcTnb++wdzKg5/6oOt23RUXq6lJpC?=
 =?us-ascii?Q?OEa4vuqlVwENyD7/qJZXzlhnbyjdgNcwMcxT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:58.5301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c46e3e9-4a44-4a30-1aa0-08ddd272f814
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9703

Function set_global_virq_handler() is reponsible for
XEN_DOMCTL_set_virq_handler domctl-op, and shall be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/event_channel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050a..e11b677cac 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1006,6 +1006,7 @@ void send_global_virq(uint32_t virq)
     send_guest_domain_virq(get_global_virq_handler(virq), virq);
 }
 
+#ifdef CONFIG_DOMCTL
 int set_global_virq_handler(struct domain *d, uint32_t virq)
 {
     struct domain *old, *hdl;
@@ -1068,6 +1069,7 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
 
     return rc;
 }
+#endif /* CONFIG_DOMCTL */
 
 static void clear_global_virq_handlers(struct domain *d)
 {
-- 
2.34.1


