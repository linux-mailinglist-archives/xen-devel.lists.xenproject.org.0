Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17151AF8E9F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033096.1406574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckk-0000mJ-56; Fri, 04 Jul 2025 09:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033096.1406574; Fri, 04 Jul 2025 09:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckj-0000i1-U4; Fri, 04 Jul 2025 09:30:41 +0000
Received: by outflank-mailman (input) for mailman id 1033096;
 Fri, 04 Jul 2025 09:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcki-0007ek-0y
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a7912c9-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:37 +0200 (CEST)
Received: from MW4PR03CA0254.namprd03.prod.outlook.com (2603:10b6:303:b4::19)
 by DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Fri, 4 Jul
 2025 09:30:29 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::bf) by MW4PR03CA0254.outlook.office365.com
 (2603:10b6:303:b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:23 -0500
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
X-Inumbo-ID: 8a7912c9-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8fmnyN1TzSscwTQZJO3qTYicKpw0wdcO9RhR61mfMQy71UDLXiponrjZ8z+zneBMmH2HjRpE4Q32agrae+RzeMnG/K2JPucSV40epnGcEPrbWLyjcnwyFM7ZStDGQKkWlM21R3sdXU243YYdYo/8iJMd3HyH1Vs05OhVpKE/ROn1tZTDtOV6be/5FWk37hJUru3JMJn9EmPwyR5/MvWY0Fmij5lww/2qvu4U3+6fYM9h4H95TSz2nJvUFMnu+WZF+guOuf8JxLH6fC9XG4MtYPTRPD8V5fwA4cs69tmKDecCvtzI5f6n8vxHlbSg/Uk+qB9LsoQYEO5Ga9PWo677w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WItGqxAhxBw21f3KfwdiFUW2nn+4erXPhuSpx0xV6H8=;
 b=X0OBKC7aSf/hWcLLcVv+avn/D2tGLe7TXwDtv2eAK/MljO/6dO2L7kR24sh831OKpBAXRds9GKvlDgjANKi2oZudAAAu0jXAsTxk2EEC1WewZzqg8qB8f2H+LUxUWtLSH3BPrauf2k2SfLMm0fGg+EA1vy6KCCcpat/vVIZYcXC3y2/kVCB+H9+mmyhWsvaMuwPMSqFaYIXwa9mC4rt20hy3FEeGCQqHGYiyAAEuWb6P48kDRMwP+uL8aFf104CvQLeXqYT1vrzYuA7U4ijt2tJbNol99BRiLvK4oToHAcgnDB9W/k4odaKo5TIAnZs4Sv+Onu5Pi34JL0ZUbvnUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WItGqxAhxBw21f3KfwdiFUW2nn+4erXPhuSpx0xV6H8=;
 b=sW20JJgtVxr/+BgS3vkd6wcUM7oOW8117TkZGngZgneYdRV9PoUg/XeJIGIM+e+pP+9MEillyvPRtbIAILZRlJjjdSKyBU3segCUht7/q5xnMcK4I46eiwcJe38IsSuVV4UlS9WXdPeTr17JA6MlvP9+Gv0c2xzzrJCMH7m/8jA=
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
Subject: [PATCH v6 06/18] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
Date: Fri, 4 Jul 2025 17:29:40 +0800
Message-ID: <20250704092952.822578-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 010835f7-45a2-424f-4e81-08ddbadd6a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bAUE3N3TIdb16tAUcnpyDa4NH/quPAyA0+pnvae3R+X1lwZOSmJQ1+uzR4SI?=
 =?us-ascii?Q?BXU8Zbji8WPmGM7g2tX3GuUZgjKKJ2jhnqRjiCabfLYxw/63a0mFqet6iuqG?=
 =?us-ascii?Q?jCFediEPieANfSmM9YWW5cKf/cGNSDUij/44AAqccJm/mYLZ+lzAsnhAZiP7?=
 =?us-ascii?Q?7gMqV/+HBrsUYYLXbEFXaAMAxzUdmXG4ujQmQI9ARezU0nQbFUTolD2fhvmy?=
 =?us-ascii?Q?Zihk87j6f9e2kScTkVyD8fpPEsffiWNOIoTOibOg/3B8wLsipEiYCKBk7kvK?=
 =?us-ascii?Q?1OpkdrPNzKolSGVz7CMtiPcAllRM8LQJcyIy9uIz16Hf2TL09YPme7HuFjKJ?=
 =?us-ascii?Q?9+vt9ErfIcT8C/ntURDSN7FsR6fB3XA9UdnOZYtfQLSVhV6GsdXK0hn6Z63T?=
 =?us-ascii?Q?tnw02X1DQ4o1D7JPr1GXMpL3E00N32IbpZ1BTojRfHFzTIzBVzZO9C+PMyiD?=
 =?us-ascii?Q?75AdO42Oz18W2jo6HRHQJCKY3kipVy9RaalfeNIbHEUsE4arQa82UMjMl/i2?=
 =?us-ascii?Q?xGCDOdi0wFRMdN3abcSa1BSkpVvnYTJ3x59OY+dRadZ8f++gcSU5KYMKJyZF?=
 =?us-ascii?Q?69SPsFGeovtC/XoBy8GDr9f0z/DQJH8QIYfrlkfZY8+IZytBYROP06p7Pdb6?=
 =?us-ascii?Q?amUjLXwfkVn6mmZHT65F0S8KmD/NL5DRfIf4Ny63ri7wXNcQ9c4mjkzBf+ue?=
 =?us-ascii?Q?OsypdOMfumaf8E88B7r4v/a84v7jJGOICOdgcR814XMqSgRzCUnJI+U4RTqU?=
 =?us-ascii?Q?IPIgsicW3e5d40SRRLWyDIwOy1FN00XX2LV6WRKKvt6MCPeN5DT2CAcKqCQw?=
 =?us-ascii?Q?sjEPtpewnnehx1PG0i6EGJc3fPWJJecq6/ev6x+6+/cVSJ+W5gd9QE9RDAfR?=
 =?us-ascii?Q?fyAfT1pnZmCmNeMxnd7EmnDRMrkNxrEeTLyLwQ48uEzrOxSet62G/Ybuj1Xs?=
 =?us-ascii?Q?LY+w9creyRf8wVOFebVzZA6JYNvqZyTLIR6UggT4bRgGJD71fXjE4p/XO3pE?=
 =?us-ascii?Q?Ifs8PupQvyPttsm0WxvSRGZ0Mzj7KcFCQsGgvLQskhMHc2RX+E+VEXHQTDlF?=
 =?us-ascii?Q?8tXDkc9av5KEK/hrDTwVmULjKV+gZYmaR/6gQbK7huAqV2ETVVxk0es73Ehv?=
 =?us-ascii?Q?orPMZC96/Ue1Pwe7zdFrMNphsX6sqqekNr5Rzo6ieK5gdoA22i75erBSDELx?=
 =?us-ascii?Q?u3KSmAAVFmyFqtldnbYocLUM/1ceHXXnaGJNQXiEsa4yTjBoygPeZUc+b3B9?=
 =?us-ascii?Q?6ufaj7hqooIKBt8Ct9NaaAoi4xE4yfdf+W7KMm81UzYJmy5dsuflN3NDCgxi?=
 =?us-ascii?Q?8lBusHyjg3h/PzAleDt/DZlJuszjXvNdFohEZvdxCJZ8zN6arF2L9ZIrIMs2?=
 =?us-ascii?Q?BFXLcXXpgcnYgNkcgPvS0UF0obhDVFJoq0elPuFXSlOLWS/Yz9OHjia3nwgB?=
 =?us-ascii?Q?dKEUdGQfbtbxpZJfl5E96U7tdQPLGTOHA98oiIzCxFiQnXDTNWngAubBvmYk?=
 =?us-ascii?Q?FTJxd5jTYpsiDQBVIg8C9UqG4lENXQQmJj5c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:28.6709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010835f7-45a2-424f-4e81-08ddbadd6a28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020

perfc_control() and perfc_copy_info() are responsible for providing control
of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- add the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/perfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 8302b7cf6d..0f3b89af2c 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
 static xen_sysctl_perfc_val_t *perfc_vals;
 static unsigned int      perfc_nbr_vals;
@@ -265,6 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Local variables:
-- 
2.34.1


