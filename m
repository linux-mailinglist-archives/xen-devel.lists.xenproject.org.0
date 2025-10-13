Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CFABD2803
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141903.1476077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbb-0004JE-0d; Mon, 13 Oct 2025 10:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141903.1476077; Mon, 13 Oct 2025 10:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fba-0004Ho-Tm; Mon, 13 Oct 2025 10:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1141903;
 Mon, 13 Oct 2025 10:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FbZ-0004Hi-Gl
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:37 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3068268-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:16:36 +0200 (CEST)
Received: from BY3PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:39a::28)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:16:32 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::d) by BY3PR03CA0023.outlook.office365.com
 (2603:10b6:a03:39a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:16:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:31 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:29 -0700
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
X-Inumbo-ID: b3068268-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goW5LafdwwLn2vJ8osXK2s+u/E4xmHCCjaiEWTSv520tOpr90iiyYv45NB2NmICmiFxYE6+OFwqmXDO+imdBapGAPDOmMIVdHGxHKJwaHi2ChHhy5OkjwsUbJPQCLCnoHobJtVJ5sjA9OP8OgzrCQlKGFrSGMZCGW2RUj9vfqKlps2s86uobSYLe0Rs7vW004k3FgRq0OHN1oNTzJsnWtRt3To7KsVVkAvWVkkqq+/LqAhiyQALQM0H3Yv/yowrWYm1MHV+XJhNLrZ8SE+W+iuscfU+pNTOSX+CrdGbQXLi0hSoL6keQGRG6d7kkgqXNVm2UGgI8FuxcuC8ETQnMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ThHgkV2N7lt0b2i77K3GS/QeYTjBGYYQ5FNTU6Fchk=;
 b=wWaR92eQ743XVockNSmvcsRFsfW046HM4KrOWaZZDm0gkbHOD8i7kocN2waXpwfd3G/5Ix9ustJkvgHL7cg/euCAfMDOsuG4xU+tVuB6Kc+FJwsnEMJXxxIIZx1z3psBJWoV5ZSsHv3ptB+ip22ADsJtU1AC6QJNRGOSQdDwRnBo6GnVkMggZ+OThOUnghw7DO0OyozBAYY2oiOHE3ftc1o5czguM57eosw8CJR3W5Qo1nSEqa4vSjQmdsdeDCC1pmQ3g815Cysa6OCDXczA5ekePJUKZebgMPrixNJMgm7wi+giqY3I86H84q1v2Rbqv8n3AkeuFZ+r1untmhAbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ThHgkV2N7lt0b2i77K3GS/QeYTjBGYYQ5FNTU6Fchk=;
 b=gzi+fJvBLvH/X3Klea4psBHNHy5cM9aAOyM6hauOQ+7rBIb0513v5Dz2sibhTo8Ztu4900b+mK4+IgKRsWu/x0DUvtHubIYXvqqOpZKHu54R32FQ7jCABirlW3Qw+XxhuhfoJ73jKpBv9yXw6xPiHV9QmP7It0gOqX7BKDEGqGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 02/28] xen/mem_sharing: wrap hvm_copy_context_and_params() with CONFIG_MEM_SHARING
Date: Mon, 13 Oct 2025 18:15:14 +0800
Message-ID: <20251013101540.3502842-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: d609d80a-7425-48f3-5474-08de0a4194bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f4DhGQklEqBcFSvPqvJ4QNxfZsgMTFFoVNDGS4SLlbPOqcdcM1Ppf1hTy/DQ?=
 =?us-ascii?Q?X+t4eVPthNUD5m5jaLYVVbrrqtkt6GEyFAQMC52E+JM8V7vAmDYcCRH8UTbj?=
 =?us-ascii?Q?L5upfmhouA5WX9StFlzsOwn5vM+vLb4yViAJmPkO4xym0hZezXqOtcIMiaBp?=
 =?us-ascii?Q?EEyODWut0AW6vixDSQ/oW0esOTVn44u9N3SMuQ7RBXHfOy/uOwblR7f0is9V?=
 =?us-ascii?Q?mn1szuzcbOmREAC8rxkIFOAvhIPTFykhAqEgWqu3M6j0LaRpGv0yMmQtgF/m?=
 =?us-ascii?Q?mYHru9rvdRPvJMVGOl1RxzsWHcafmxbDzdcxwo2iiRAvI/xEU2PpcPE0ej6L?=
 =?us-ascii?Q?ltu9MI0asROFd49Nk2vJvTA65gqvV6IYkFox2iBVYiY++rs/ncJPIulTXDvI?=
 =?us-ascii?Q?6MjIrT7FDZk8e8iEcQHl82u5pmiT7vL+cIJeMENxPDEEoX+wK2G/3INegD5w?=
 =?us-ascii?Q?YS5fr8coyaAtUcew0cXDr6wW99SzmGL9BeYZepo1UKzVTYtUsj3QEQa5jRte?=
 =?us-ascii?Q?dxDJrsEjkQK1rMvzy8ZzT8phc+cs3e0claPkJ1KSdRmIVOg30lPQBoBkoE5z?=
 =?us-ascii?Q?BdrzptrypgbWipsG81fdu03vyTJ7+NFrwBUTzXn5PX9v2RhmZjK7UuXixcm7?=
 =?us-ascii?Q?NCHW9YBxijQ194As2T1fvU9sdN5iOIit7NB8lOtcFXbxX3BDSnDGancUKQez?=
 =?us-ascii?Q?IvzmRk3jpWzLsojcWHmlq2+01QSKAwnkD5k6vHiT7lXKfUg88G0xiJuhNm6U?=
 =?us-ascii?Q?v2Y9A2F5j1Qf8QohMViNdD83C7bP/IoJwV6A3eiPE6U4y1JFWwS2AkOauqqy?=
 =?us-ascii?Q?ssyGHFw2BkR15/pe8xKOjd0srFmXxFMs4RtRQ3a/YctaA61MyK+IW50qTbBY?=
 =?us-ascii?Q?3BDVLK2jiQYYbwsEI6MlH6tb2+O+P1c6ETZJdvJsgrOOo4EbMOZo22ITmoV5?=
 =?us-ascii?Q?OOTzNXrqYpgrBPYvEuFQQMzPCNfP+YUVP8TvJASpSg6Un2/S093FdZ6AJuEN?=
 =?us-ascii?Q?6KEw5O+LcdblaqSzTgDNCwkXCa6U7ze6umKHkT46hZNS7jr8KLCRauDu80Cl?=
 =?us-ascii?Q?BpS1KrDqvN++CPL/GVYuelH4aMMmZs2Dh/KNoHPeKkYm6oSRpgEsaX87vAvI?=
 =?us-ascii?Q?oq7PX3EHmJ5oM+fisbScXSSEykFuk9OljSP5rlJNdkMRgDQ6k/pj8pJ0pnxf?=
 =?us-ascii?Q?BhR/zWo8YhYBiz8Mh/ctMtcS0ICO5Dk2SAhpyyOimVVoDFWc3FuLVahZmCMG?=
 =?us-ascii?Q?MMvsq1FnNjFnZR1+kTrRRMRSaM1rWnuVQakuL/KDxhf0C3Ww21zEFnaBLxLY?=
 =?us-ascii?Q?o8FT1hNK8xLbpEiba2capPu0gZ3OMxHOGSN2/MoQCvh4tizO/iM6s1n8zl11?=
 =?us-ascii?Q?TdUDbPhztYFWiglxfw8Yk4Aq/tC7NGM7RfrOG52cAt3fVLdIhW8rfeUjRqv0?=
 =?us-ascii?Q?7rQmW7JVIOAE+Jsgt3/gKISulGJZF38E5maSbBXX+LsZU/bCvXN8FLez87WM?=
 =?us-ascii?Q?R53wBTt2NKAiyTe2Zo6XGTFgYUbrPgpVjTkkoaZ4U52qcnCxc7itMbbxWEGh?=
 =?us-ascii?Q?OWcKYGmt4SstMx60E3M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:31.6444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d609d80a-7425-48f3-5474-08de0a4194bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

The only reference of hvm_copy_context_and_params() is in
arch/x86/mm/mem_sharing.c, so it shall be wrapped with CONFIG_MEM_SHARING.
Otherwise it will become unreachable when MEM_SHARING=n, and hence violating
Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/arch/x86/hvm/hvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0c60faa39d..239cd992a4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5458,6 +5458,7 @@ void hvm_set_segment_register(struct vcpu *v, enum x86_segment seg,
     alternative_vcall(hvm_funcs.set_segment_register, v, seg, reg);
 }
 
+#ifdef CONFIG_MEM_SHARING
 int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
 {
     struct hvm_domain_context c = { .size = hvm_save_size(src) };
@@ -5489,6 +5490,7 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
 
     return rc;
 }
+#endif /* CONFIG_MEM_SHARING */
 
 /*
  * Local variables:
-- 
2.34.1


