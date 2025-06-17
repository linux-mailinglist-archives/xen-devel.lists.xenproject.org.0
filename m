Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73674ADC918
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018115.1395037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUAq-0004dk-IM; Tue, 17 Jun 2025 11:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018115.1395037; Tue, 17 Jun 2025 11:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUAq-0004bs-FZ; Tue, 17 Jun 2025 11:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1018115;
 Tue, 17 Jun 2025 11:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wDO=ZA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRUAp-0004bm-D6
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:08:15 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:200a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c3fc548-4b6b-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 13:08:13 +0200 (CEST)
Received: from SA9PR13CA0093.namprd13.prod.outlook.com (2603:10b6:806:24::8)
 by LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 11:08:09 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::7b) by SA9PR13CA0093.outlook.office365.com
 (2603:10b6:806:24::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 11:08:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 11:08:08 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:08:05 -0500
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
X-Inumbo-ID: 5c3fc548-4b6b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMvGCeL5li0+J2E3W+rmcwPQTuHi/wRb3GcNNIjbIWxrWGxT8TyKmiuHl478VhOjgSuZ3nKQPdia7/Gf42vxu/OIlWVtQWhzUQMF0o9zmvkakpGjgWLAnoKH4ckqMIjiI04s+OD0HTnCaknb3814tJwqwzJDkDDOcVBSrCcyjZj0Rvpz8IXcSM9buxRq8YV9PT/bE6tC+qK9xk6swfp4fAN7e2E/XJeMsiZimTBX/aqtTtu0/8HxXcH6k3lmN5QZiemI91lsVuOnN5EfpDTVdGVY2BGbeh6X/YrYzmdWJwTA8kDWci0KNSU53jkHA8KZ2UAfALdBfN7GxFhF75rkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNYUIHXWtbZjevhX/1UeT4Xuly3MaAkGOlEVEfaYe3w=;
 b=Xhxdy7gO3FINJ7fx9R7ASoTRmdB2xO8VZyDwFkCZC8RvjH7APVOYJkurZEpRvOXnCToJRx+p520RqHNH0JbIyPduG51KmTEpff4QDHnvSw4xCK84+IOyxVUgABnRBDckceCzCUOXkAijWHRQ1TRULtKtAcy/BUHT141k1NhJsImWcJOt0CcRhB2S1HuDw6bkrG1W7lELcS3DkyRrzgIVvqgG4eLcB1wPZwAoWxk2W7pA30E1QRyfjb56WEcoqY0HyVKjjnyTsaMsloTu6P9hKDSTzCs+h7nQrusYAX5IkF2sCiBm16EayAk7tmBoMNNzTpntAsESkJOOKrXw5SNxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNYUIHXWtbZjevhX/1UeT4Xuly3MaAkGOlEVEfaYe3w=;
 b=LEx+cKrLnzY8goeZciLsYQUsW57r9VIbMoqNgFPAGUKJ65JM4vx/1ZhSUP1KZwt8qKpggdvPg2TRGLizPYYjj7eYn4hcd5PJ9xGq1KW5zuQoz9H9CBGSzOV/AtXQcYfrFN7jHLztdAjT5Oz4C34gOiDDryjUYgfMJZA/Ctq3dZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P .
 Smith " <dpsmith@apertussolutions.com>
Subject: [PATCH] xen/dt: Remove loop in dt_read_number()
Date: Tue, 17 Jun 2025 13:07:40 +0200
Message-ID: <20250617110741.34648-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|LV2PR12MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: aea6fb25-62be-48d2-0f7e-08ddad8f3dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oeODxL7zyRB+CNHhF77j08Ak88tLSYZwbiyjzuOVj3fond2G7Edmwtkceu31?=
 =?us-ascii?Q?MnbO2o/cn6Yol+qKvLlF/Bnx+VhfCVAjgY5baDWQN10w/CqztNJcpKehyqvz?=
 =?us-ascii?Q?5Mcg7+x0uwJzr+17AaO9ZRW1/BJOQRflq0m3e2Jtm+qY2JQKEEvMXCIpr9OT?=
 =?us-ascii?Q?mZ1DhcLhpKhlnY/VkTXzMmGluP2bnL96/lyz5WRJlRNNOb5p55OE7ROaBcbg?=
 =?us-ascii?Q?8FWLQWtbInEKzXklUQvpJqnfRsgHf48Q8AUFeN5dH1UDhCXzEVF27KPFaeR3?=
 =?us-ascii?Q?S97aysFzxw9nKKuoTY3iRv+XTPbWfDoQr3Mx7nZTjpo6r9WfCD0C8C0b9wMB?=
 =?us-ascii?Q?MB1gGvS9DadSuyQ3NX1YzKhm3xk7UliyXLcRdvSvre5LeK7D8iUhd5gP4610?=
 =?us-ascii?Q?S2CgBfSq4Z1/r35t4821EIOc0hf8UI99N3RKweeHC4RyC10KOqkYZR4x5z3D?=
 =?us-ascii?Q?wOZ77hFzeVJhWJyxVIZsFg1RKCS/FjHFm8lKo9rCg7zodrgQuMe4GZpDOfq9?=
 =?us-ascii?Q?AolT0xTd5x1zbW5AjiMb8EIyZPG1G0HZnvNgfjTbDljfyFvfK/bYpBZa9b/Y?=
 =?us-ascii?Q?ymS8P/veTlC+Ppf41pfVJwaKzU0kyrElyJDP6E1fNMqeZ9jN8opv7tLP74M5?=
 =?us-ascii?Q?QNlFD0junm36Ald6yUi+sUf3RwhEH/0s+N8tpwitWH7EvRY1TF5GYsRRc2yP?=
 =?us-ascii?Q?CUmuSt/Z5i2IL4nGmv74yj5T85IB8LfjwjbiTAVfwczbx2p7W7GkHQ1uXar0?=
 =?us-ascii?Q?YgGQBMnyg5qbjytHtSqF5vdEpAXLSrSxeNUyhStc/tHIhqfs3SPPeKPalAMc?=
 =?us-ascii?Q?eJHrbb+HRgQF36B6+ysS7LbG7MlYXKjYiC+Lf+N1K/50fRR0oYWOTcL1HLMe?=
 =?us-ascii?Q?90ze6E5rM3L2XQWgHqNZAxX+X9bgVVI1eSiEIGPSMpkqkW1PMYixHWO1YtZt?=
 =?us-ascii?Q?M/03q1J/k9Z+B8os7ivgO/oKg7OZzCEKiips5pe0F9Y5HCoVFH3UpUcvWlx4?=
 =?us-ascii?Q?bWT10bsdBtdpeAIPSspA9I11Fzd8HsKZuv6TfDpu1U42I5K0fcLEN5p+XJtV?=
 =?us-ascii?Q?2pdXn7G/jq/nO50hNyB1cun75kOr4VSCfztESXm7KPL/H5v1ENlFijMRPjNM?=
 =?us-ascii?Q?3QKbJtnQNP2mTLRSMAbo9/Cn7lx9ffRGlg0p62R9DOoXkJjoRuDGamEL8JBC?=
 =?us-ascii?Q?HRxXuJ7GI5cXSQVBatkzFOzIAMte/Xifap8nvIROPXfdiImat05UAwExmlpO?=
 =?us-ascii?Q?zsc15EGLvG1YpxpkRAmK+MGQG4jQoG41+ltAV9fGUZAv+G1YZDTxr9APWnZ3?=
 =?us-ascii?Q?YSk6zoD+A0jrn1StqYk5qPltyhi/5TWCLmAf6r+rrB0IQygt7uJO96YX1kHI?=
 =?us-ascii?Q?QLdgNPbQez6GkLlMcW/oa4kACeIUzIIFcXnvQxONU/SQTxPEIRIZc9U1f4IW?=
 =?us-ascii?Q?5UZgP9OsXaelHzuOosMXUVl2l+iXvQZUFYua14lrlnuIf9YTWMRzAQvuUrPz?=
 =?us-ascii?Q?LitZMH3pVx47fMz9Et3nKL31inSFUgS+Cdf9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:08:08.3896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aea6fb25-62be-48d2-0f7e-08ddad8f3dc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871

The DT spec declares only two number types for a property: u32 and u64,
as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
with a switch statement. Default to a size of 1 cell in the nonsensical
size case, with a warning printed on the Xen console.

Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
Based on this suggestion by Daniel:

    https://lore.kernel.org/xen-devel/a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com/

I'd be happier panicking there, seeing how DTs are by their very nature
trusted blobs. But I suspect defaulting to something will find less
resistance in review. I don't care much either way.
---
 xen/include/xen/device_tree.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 75017e4266..2daef8659e 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -261,10 +261,19 @@ void intc_dt_preinit(void);
 /* Helper to read a big number; size is in cells (not bytes) */
 static inline u64 dt_read_number(const __be32 *cell, int size)
 {
-    u64 r = 0;
+    u64 r = be32_to_cpu(*cell);
+
+    switch ( size )
+    {
+    case 1:
+        break;
+    case 2:
+        r = (r << 32) | be32_to_cpu(cell[1]);
+    default:
+        // Nonsensical size. default to 1.
+        printk(XENLOG_WARNING "dt_read_number(%d) bad size", size);
+    };
 
-    while ( size-- )
-        r = (r << 32) | be32_to_cpu(*(cell++));
     return r;
 }
 

base-commit: 14c57887f36937c1deb9eeca852c3a7595d2d0b8
-- 
2.43.0


