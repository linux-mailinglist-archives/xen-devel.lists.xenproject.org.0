Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC90CB7D36
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184893.1507185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQP-0007UL-4H; Fri, 12 Dec 2025 04:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184893.1507185; Fri, 12 Dec 2025 04:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQP-0007Se-0Q; Fri, 12 Dec 2025 04:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1184893;
 Fri, 12 Dec 2025 04:06:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQN-0007Dl-F2
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:35 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee7d1c40-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:27 +0100 (CET)
Received: from BL0PR02CA0036.namprd02.prod.outlook.com (2603:10b6:207:3c::49)
 by DM6PR12MB4369.namprd12.prod.outlook.com (2603:10b6:5:2a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 04:06:23 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::62) by BL0PR02CA0036.outlook.office365.com
 (2603:10b6:207:3c::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 04:06:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:21 -0600
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
X-Inumbo-ID: ee7d1c40-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEmg+qlR4vwHAlFTQZWsU29BYG8/cNr0ojahX31J3I3wVF+WlbPoWdn7TAkrnU1y5qEEXOyNMBD3wCO55G/KvfsJtxilFfkpJwZfZCFp8hNyCnj/8UAt99iROq7xNmi+p7cbZw43HlteW6OMHqxqeKM43+3uLeLethJ+rw8Zw6fmOz3cbsmT7v+q21Jn4ggvfcSWeqd+jfQ0arRdPsIgGsZ79M47hkjb0SjFFk6HMcGF3yOLoQPYhL7JFtyyfbRVoJN121eqGDqRjChV6Sqd7nE0eZzekdQqF1iQFTHKcgMq0onKYwO9a7EaonvBY6Xruf1kIMuSuRn/HrwZUc3D0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azldVw3LRxDX4G3fQuaEQzTV1XLt1yT4AZM75H1BB28=;
 b=ARNvnk9d4F9uds1dAreSI3YRxFT1IAiG8JU9eGOzazbF+zof3IAdstYFPZIVDdZH3wKA1aoTXG9DJTKnwxiZPEpiaocQKUZfuvs/wERYnLrkhAh9VFF81YPOEb4e2n5GXmXymYHcxEBtIE1AXytGGqz35mZllmKIhKuFT5wYPa1/ym+O5S4utNCCWJsOP/PbtSUSVG7bZMelm31T5csFhZEWPp9h5amPFyBB5JAqZoS/q2OZKdRrH3oQiIO8blsQpZgXtZi7u2PVBkbON1+pJ1qeqmQheMzybojI2PUt5nuwJewYXtDo5dEAFND9D2O+TT9Z2icgUtVChGSf5rWZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azldVw3LRxDX4G3fQuaEQzTV1XLt1yT4AZM75H1BB28=;
 b=0lm3eOVd0OB0F9zGkoep50AKqNBHnnlBHX8lCWwbBvWEmoYLtmrI/1dT7UOEQvNMqeGkr5haDwcIeN5wOVtlOfh5RxyvAkrcnB0hBzhcimuQqUKB6EWJb1tqS1/DGXYC3WV4JmzxYZrhvhA0CdWGb3i3cw1Gw6x8LVJ1KhLCGxc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH v5 01/24] xen/xsm: remove redundant flask_iomem_mapping()
Date: Fri, 12 Dec 2025 12:01:46 +0800
Message-ID: <20251212040209.1970553-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|DM6PR12MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 11989606-9acf-4352-c2f8-08de3933d03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XyffYdFAjWaZeAtdmehN/8ApiLKC8aA1cYz22RAf+YW2QegRGtQHWy/xkvyJ?=
 =?us-ascii?Q?xiD8UvOFfe2yDBlD6RVX71vFaVJTHziF15Xie5xjW+3e5MfGwSLibi5HdaIN?=
 =?us-ascii?Q?ueO4kG4sENeBS86hjLExdNpF3hiKCpsuJIcDCfiBCHndiGqpyQF5NjwZrctW?=
 =?us-ascii?Q?qXBApIeEvRAfxODfLwFrPDZSfxz0Gfx8l2q/aBBKGeo9cOVji8r8U52qLbWb?=
 =?us-ascii?Q?iQEZ9JhExuHhWNCR1q+cunKYl15J6mBORukwajawRij3xg5D4p8XlaXXG0mM?=
 =?us-ascii?Q?8PAFOfBJbjFwkFl6nVerpAXmefU9fvduvVcaKCET6fQDOoPBvfOg1eFBU9kD?=
 =?us-ascii?Q?OAF/4u055LJiVorJgZZd0J26TxMO4/4mzep0qgCf72Pb7x/vRNKSD+tS6uCh?=
 =?us-ascii?Q?bi9M0+XVJ8Kib4xiJ8abQ0JMCs6dJnht7DoSRJH+h3VWDHbgVEE3b24+HUr+?=
 =?us-ascii?Q?A6yWZxVmd7BgAE6uKRzjTo+p6bnQje/OpBg8iI1HnnlJfA1oQA6UL5Kih9Po?=
 =?us-ascii?Q?4V+Xijmt9xTOLuYbkbHIaVqQvL/31LJDmLT1GJ5AXLSkULi9VNio9acoNOLr?=
 =?us-ascii?Q?K6CeBzwARkxSSc848+hBHLeEQxXpTST84zj+jbIAb2GI16PEwRGnZbXEqCIh?=
 =?us-ascii?Q?eh0PvWvLhNfIOwBPpj5Hk4DUT403YF14oA3iBqDtrn72FiSea8mmanDiCdlJ?=
 =?us-ascii?Q?p/TZHHRIk2RpOWtSTZvhNJ+wcQ1K7ZOXXdixfq1ZSQhaYl39tWzpi/TNiMAR?=
 =?us-ascii?Q?pVYaK7ydiU3Rxdf8ArIBMon//a5HeLili98Lnl9OFXvRF18XvrfLHK4om0Lf?=
 =?us-ascii?Q?jpYBAu7F0ocF9mLPLifV4W1udPOQBCW7A+/kJN6To/lh3V4uDI5D7fXO1RLv?=
 =?us-ascii?Q?kw8sIeXIaY+07LivDEFdzzgAeWerGzxPwXH4mitxl+B28LPWLEnwABp956z/?=
 =?us-ascii?Q?LSgz2a7ujqaMHQeZyUHd12xeuDJPYFoBIjLZFTT1N41PZoyXsZSNGaMe/L23?=
 =?us-ascii?Q?Ot871UgtDuOiwCTP1PK7xSNXelB4O/+eQe5/UNLxCrkCzk/6rcR+CnYruZX0?=
 =?us-ascii?Q?CCH+MMLeAPEBqH/2V/GsX+Iujv7N8K4h9BossNjF1UhfQg6cOXf3KMg3aCSD?=
 =?us-ascii?Q?Hp2v75LXulNdmz0rHDeD4Rop31yQZN8MLyJ+w4TAsQUSMs0quq1X2nCYu4JQ?=
 =?us-ascii?Q?Q7iB1CUEGQ8oKmsreySq2kYca6cJPJu34Vip7biIj22U2MHlsBzLhbGuhLuY?=
 =?us-ascii?Q?dWZHt0muXfo3yRvNtA5iSUAoEQeB94v92jG2CqM4ws1Ky3YY3xUPv68ANyx7?=
 =?us-ascii?Q?adiwe9q7/9W9btV6/u9xDyBAdEa00vgSHYpaTUdzGtY8RUmJBveZuC26lyfq?=
 =?us-ascii?Q?gC+v7myEmEpUwysSGvGxZu+zAs6LhkD3FlFgq6sy/IvkrruKHdzA27ubOqa9?=
 =?us-ascii?Q?Ad2rS3qLLYFDydbE/E+W2tGatu1BMlRgbmvPhmOuIGXeY2aC0IIsWh46TzlK?=
 =?us-ascii?Q?RZRf4J8XZRJwZrzqHoHSOmsrhJv+uFMtGaHy3VWP5NZERXvo70ARYDej0hwK?=
 =?us-ascii?Q?wcox8htgj8y6ZrT7fZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:23.2523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11989606-9acf-4352-c2f8-08de3933d03b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4369

xsm_iomem_mapping() in flask policy seems redundant, as it only provides
an extra call layer by calling flask_iomem_permission(). It also has benefit
of making a cf_check disappearing too.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
v4 -> v5:
- only folding redundant xsm_iomem_mapping() implementation
---
 xen/xsm/flask/hooks.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 9f3915617c..a43cd361a2 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1167,11 +1167,6 @@ static int cf_check flask_iomem_permission(
     return security_iterate_iomem_sids(start, end, _iomem_has_perm, &data);
 }
 
-static int cf_check flask_iomem_mapping(struct domain *d, uint64_t start, uint64_t end, uint8_t access)
-{
-    return flask_iomem_permission(d, start, end, access);
-}
-
 static int cf_check flask_pci_config_permission(
     struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
     uint8_t access)
@@ -1945,7 +1940,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .unbind_pt_irq = flask_unbind_pt_irq,
     .irq_permission = flask_irq_permission,
     .iomem_permission = flask_iomem_permission,
-    .iomem_mapping = flask_iomem_mapping,
+    .iomem_mapping = flask_iomem_permission,
     .pci_config_permission = flask_pci_config_permission,
 
     .resource_plug_core = flask_resource_plug_core,
-- 
2.34.1


