Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057AEA81D67
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943382.1342149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCU-0004DS-EI; Wed, 09 Apr 2025 06:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943382.1342149; Wed, 09 Apr 2025 06:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PCU-00048n-A8; Wed, 09 Apr 2025 06:46:18 +0000
Received: by outflank-mailman (input) for mailman id 943382;
 Wed, 09 Apr 2025 06:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VhX=W3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u2PCS-000466-SN
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:46:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54164855-150e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:46:15 +0200 (CEST)
Received: from MN2PR17CA0003.namprd17.prod.outlook.com (2603:10b6:208:15e::16)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 06:46:08 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::f4) by MN2PR17CA0003.outlook.office365.com
 (2603:10b6:208:15e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 06:46:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 06:46:07 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 01:46:04 -0500
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
X-Inumbo-ID: 54164855-150e-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sroPZVeBh84H84JcDGAdlfv6R9TDhayl9n3PPnQz42euOx7LFBxBac4aVL3jWHlffvahXxOfxj4k56SNgUA+1DHtlnQuGAuwUaXREtpiOPfrj8QF3MWJm1n6DYgaq4kFy96hANoyWAspCf8a0Jn5XqF1ZejaD/Q/5Rt/0+pyUbYBqVoSaUwIlbA6025ut+ZmDW203sqOs7g5cgqkdIVFIbASF1f4C6KjpIXhVs14q6ZwHMJ/PuvGpXKXPjzVOPbICDfs/P6FNWICM1yHcOwRMdhKQ3Ag5M/hxzXMExMVfl0mOEPkXPwPZRC2Z37aIc0HyBKU9F2a5wR+2gQtBl5amw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/h+KmEfjEwaWP7PdqWTKb6YIL4NuLpnIAIStX4bOq1M=;
 b=bvrM9A5Une3nPG2cDVpm/GJ9LV45qh6Ll8p3dk4KWg5IjYqbTVBPdsmYhAQoJbcNGhorChI+nLyfHmX+k1Z/L9Zt/Kz99jNJFrZBJ/+pOi72EeaP36/OKDzhlVFbkqYihZErBqfg4G6Zb68VbMx7sZeAJ4wbCt6pFxDkioaT/SuhYouzjpbgt9gGJTF45QYLjAjFcXd+2HJTsjdEEx4yX5CCcNVZeb/2ZekeKt8RkA83ywS2Ui4nUy6zLPUrQm5zeS0QN0iWGqTfCL0SOHp3hoTdxAcRA+jHrIY12zJ4Nzkq6B9yhxtzJGHComtThS+Nsn9N/BiIFu4gALk6jkQzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h+KmEfjEwaWP7PdqWTKb6YIL4NuLpnIAIStX4bOq1M=;
 b=aQ4VFtn305A4gxRBRFKiM7RCl3P4EZdxWZmnwiZzVm2oPtVF6UpE6FZOXhzu0U7oq/F/ypfbzsoLXt5CdR74IOT6eIepx3XRBvhI7xU0e+W0rB8TMRCYIstWXsczDxvULTyJJ7Zc7IDeWab5jIjpU6wtRh5xwA8Dlew+wB5FgGw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 1/8] driver/pci: Get next capability without passing caps
Date: Wed, 9 Apr 2025 14:45:21 +0800
Message-ID: <20250409064528.405573-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409064528.405573-1-Jiqian.Chen@amd.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: a92275bd-1b4f-4140-4aee-08dd773234ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG1qUlp1dXhOYUgwSDd2S3pZbVJoYkpLQnltWS80dExVRE5kaFNNVWp6SDlF?=
 =?utf-8?B?bkYrUU0rbVVadU9oU2R6MVRSZWVLKzZtcmZ6VlJ2R3dRN29rU1c5Mm95MFFK?=
 =?utf-8?B?VDVram5zUXVSa1NjeTdqN3BVdzRmbll0bnV3SWRWb3EvTHBrek42TEFNZGVC?=
 =?utf-8?B?ZERkWGIxbERqWFdxWWZ1WjZZdU4vTmxMam5IMFN1MG83dUozRGdJd3FPUGhQ?=
 =?utf-8?B?b0NUazM1UFRzcnlLazg1U3lSVW9HTTB1M01Mc2duczhlZXlLa214eE9tUFVo?=
 =?utf-8?B?dG9nNVM0SDhOaUs0dk5qdzUyWDVRMmtEbU0vRytkZ3A2d0w0RlNJNWdyQkMr?=
 =?utf-8?B?VklEWWI1cDlDSjQwNThoR3JvZk9uOFhkWmhpRGdPMFduWng2dlRYbisrOWk2?=
 =?utf-8?B?dUZYRTk4a0srVFBvOUdWaHZhYzhhdnlRVnU1aUZLUlYyOW5menEyOUs0SFBk?=
 =?utf-8?B?aWRYZS9aRFZpdTA3MHJxMzhVWVVsODB5dnE4c0pseHo5RWp2MXpDcDU1MFE0?=
 =?utf-8?B?MkJISVVyWXFvdjY0amdDa2l4bXNxL3pxUDZjL3dQVFNwd204YzJkT2dpemVM?=
 =?utf-8?B?azdnQWtkVTh1UjJQSnk4V0dMMzFEREFJemdMMW12N2ZMdnR4cGZvUW41LzNF?=
 =?utf-8?B?YitibllDSmdEdEoyVTZ2bEdBY3l0OXJPc25zdWJVUEcyTDlsZWpEdjZ3Smdk?=
 =?utf-8?B?WVlJTC9Wc0N5bSt5c0o1WVRlTDNCbUkyZWZpODFYYU5HTDVNelM3Tk1MK0FS?=
 =?utf-8?B?ZkNwNzV0ckJSRmdxQXlrbzZ4bTVyNitsK1RhVlZzK3pSVDcvdXdMRldwK0FO?=
 =?utf-8?B?dnB2UXVTTXEyQ0RmdCt5SmtGMXZrdjlpUzZ0UTJrUStJck0xSVA1QXlwMU9a?=
 =?utf-8?B?WWR1VHdXdTBCSGs1L0NQeGhIeTZsOU5PN3ZOdnlaUmtCQ1V4eDdyeEx5TEV5?=
 =?utf-8?B?NlRtZ0ZIWFEySWlhZFZRQkRWcThtcCtkQm9rVzFCVXZUZFNKR1k2clFhMVUr?=
 =?utf-8?B?UGdyU1hBZWs0aHVkWERFajd0WW5Ua2NONGw1Vm9zaVBYK0tlSDI5Z0RHUktk?=
 =?utf-8?B?aFcwZk9FcDFBYWlzbkV4MU9POWVIZ1owVVNOanBjZGd1RzdDTVFkdEM5SjJC?=
 =?utf-8?B?Ukl6VWF5aEVZaWlkM21OQlhFcFZNSDZjNEpPRG9EbnA5TVQ5WTQvYTNWVjJt?=
 =?utf-8?B?YmZGc3JpcVplMmw4RUdyLzlZaUgvQitvTm1namtub3B1Wnhoc2ZJemJkQW5K?=
 =?utf-8?B?MCtXWnlhZUVmVWFTeHorbmdUSTVZNXdORG44NjREQnlYNjh4TW1IcHpsS3hu?=
 =?utf-8?B?QVVwdjh1Nk9DSnoyRUFDN0ZJRjd1RU5hZEE5M3VKZjhoM2RBcHJMd25hUm9l?=
 =?utf-8?B?QnBTeFQycy9HL1dKcFYwZmljVy9LdWVZVGR1dWhvNlViQ3g0OW9QYXN3YUlk?=
 =?utf-8?B?Ump5a2hsN1VBR2NjUmNlR0RNaUN1SXVjZGl6NVA1SzNWY1Y2bHVGd2s2alpG?=
 =?utf-8?B?WWJSUEhKQnlYZFQyWWlDSzVhZTRlY0c2TS9icVl3aDluTitRMytMdGJTRnFL?=
 =?utf-8?B?NlQ3WXZPUHIrYXMwSDY4cmZEMGJjQWNFWnRINFpubW1YYW94eEZ5TFlJRVlt?=
 =?utf-8?B?Q2VBMXgzc2VuTHpOZExpNmlKc0dhR1k1Z3JLRS9TRkl6aktMSmlmMzdpUFRn?=
 =?utf-8?B?aFZYSVc4Rk8vWDNsbHJ3YmV2TllTRGFPWWZBOW1UbkVpazdSaXl0MnlzRWpr?=
 =?utf-8?B?anM5cHNHSWNhb2dYblhXbmJLMnJ0TGwwbjFIWWo4dWk0SlFWUVlhR1hrT2hL?=
 =?utf-8?B?c3pKN2t5NlVEUFhuZnE4U2t0bFFZaWlYU2FWMGI1aWhGRHBoSnRUZjZGclNJ?=
 =?utf-8?B?OXVreENFMWVlT29WVlZYd1ptTkVKN1E0SEdEZVRlSHVxY2dIdzZBd3YzYmUz?=
 =?utf-8?B?cVJLcmRxU0QvWTVaSzVHaVFsNDlkQWFlQVNCOEVBUDBGNXdDRlhUdjEzK0R2?=
 =?utf-8?B?WGkzWlptVEE4UWJNaERjcUNZZ1pIMTRBYWJKWDM2OTVsSzVxSEdQWUNwREdR?=
 =?utf-8?Q?0RpNJm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:46:07.7225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a92275bd-1b4f-4140-4aee-08dd773234ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855

Modify function pci_find_next_cap_ttl to support returning position
of next capability when array "caps" is empty or size "n" is zero.

That can help caller to get next capability offset if caller just
has a information of current capability offset.

That will be used in a follow-on change.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v1->v2 changes:
new patch

Best regards,
Jiqian Chen.
---
 xen/drivers/pci/pci.c | 6 +++++-
 xen/include/xen/pci.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index edf5b9f7ae9f..ec81d0db6133 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -40,7 +40,7 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
 }
 
 unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
-                                   const unsigned int caps[], unsigned int n,
+                                   const unsigned int *caps, unsigned int n,
                                    unsigned int *ttl)
 {
     while ( (*ttl)-- )
@@ -55,6 +55,10 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
 
         if ( id == 0xff )
             break;
+
+        if ( !caps || n == 0 )
+            return pos;
+
         for ( i = 0; i < n; i++ )
         {
             if ( id == caps[i] )
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index ef601966533e..cc84f2cbebfc 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -251,7 +251,7 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
 unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
-                                   const unsigned int caps[], unsigned int n,
+                                   const unsigned int *caps, unsigned int n,
                                    unsigned int *ttl);
 unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
                                unsigned int cap);
-- 
2.34.1


