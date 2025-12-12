Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD8CB7D8C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:17:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185018.1507345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTub5-000155-00; Fri, 12 Dec 2025 04:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185018.1507345; Fri, 12 Dec 2025 04:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTub4-00013e-T6; Fri, 12 Dec 2025 04:17:38 +0000
Received: by outflank-mailman (input) for mailman id 1185018;
 Fri, 12 Dec 2025 04:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuRH-0007SS-0h
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:31 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11f87d82-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:27 +0100 (CET)
Received: from BL0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:207:3c::24)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 04:07:22 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::38) by BL0PR02CA0011.outlook.office365.com
 (2603:10b6:207:3c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 04:07:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:20 -0600
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
X-Inumbo-ID: 11f87d82-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUFHwTMtB18A/9HHDSu44CHTGVdTGTHU52FAVUDuVaQAKWhdkXdGC2t//RIrxNjcrpiQDr9oVlaHzHKeALYQ+ufISxtut9Wn6v0mNnlRTERA7U9LAzG7ykWnVFXp+F67h2ANWWhFxc3e1d9v+qNyiyT9Xkh7Jq4XM6RR65V4gnXc+V2GxLT0dAPLEqQ8UW/QTtlTdZChpphzdQI0nSoObPoEfpeE0KjjbRxeNceFOw8f6gEnI5iYqPlgv6Iaa4/pDDMSao2+Hj7NqadEYJLPFG5Cdl6Dd81CnAKcP82fb2KNk1SmRbHrKhNF+blWJbu8jIKDO38a60+oyDmbDw7dPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CDjhjNeGSnpu7WULKozeSHXwJMukMwEQH7YbEo2lUA=;
 b=aUerMAYA4jPiclG9rauJ8U7CyfHEElt3Qy9OoiyGiOX12Oj2gu5gk/SRxXYkacw2rM03Jm/6Ba7Pk3daL+zvLT6K1wQSPNJhCmmGS5/WXOQMRlh0l6g/PP7usv4F02bBvt0b/fn0rJQn9b9dHoc5Ub4TLmVx54/M+Y2Oy8e3gqWCw2vealf4FKjy5Ez8jTSqU1KhCsfb4edF2ll0566zEB0ODD95h/V6lCkzH5R0uBZyLVV6G1vHXPgLXgDj8n/KqB5vOeNhh2rheTTkM4GRCaU1jUHXvDh2EWBORtlf9VvtLME6tRxP0EbpRRCEFNpSBQcTfokeDIoloHKQ7J9xLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CDjhjNeGSnpu7WULKozeSHXwJMukMwEQH7YbEo2lUA=;
 b=UNcmC38UBQZaRFtC6ZU2lrVxsaokTG1Ry5tLKouM/GnlDfhY8Wxg8r/Eezu9x5lj52/g66U7Z1ClGFh28YS9mzOg2QiKIcbSPM+3si3MtK33iEGts7jTAzKMSzF2tehTZrHzP1LESwBIwSUFpXFK7cOimZqMdwDuj1kVHqOok8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v5 22/24] x86/hvm: domctl_lock synchronization only when MGMT_HYPERCALLS=y
Date: Fri, 12 Dec 2025 12:02:07 +0800
Message-ID: <20251212040209.1970553-23-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 523a287a-b7b2-435c-2d9a-08de3933f3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1VoL6zvcy2WF1CMSaBoMno598uddqzaj7gPi/wDN6rLfFyIO17+1aNB7Vi01?=
 =?us-ascii?Q?UNYA9r7CTUVA7IHlXmNl/ayRMDBoYQdAqksqiEN1aKn7+1K3mgq6rEFP0svQ?=
 =?us-ascii?Q?XtJRJiF0xX2UpiZVMR0We6TmqhA/NHGgUo9SVG9yg/qWxBu/LSXD+JzgdodJ?=
 =?us-ascii?Q?MpzmJJ2gd37v+WjaK1s7n6m+53/0bSzLUi9DD6IWGqZ39XnnHvnECXUNjc2E?=
 =?us-ascii?Q?Sv3mctO49uFFDBl54KDVB4bCWCkfzIfHEeJAO8ji5vE0P66GoN0xK936PtKj?=
 =?us-ascii?Q?2aDNEU7MKW9AVAn6+Hv+7SUn7XtGKgVRK8byz4D+v6fub7Jyez69IB1ev6vG?=
 =?us-ascii?Q?YXtdCkDS7NIXlF6/YYgwqDvGcxFpjQFzHsJi3WPZlz3W0AIWdDV2FQYdE0Cw?=
 =?us-ascii?Q?Ch4uJazb4S3s7wyTmmIrKFvebjntYJBHFkIE1ADE4vYuuXIyX0ibj1j8b/FC?=
 =?us-ascii?Q?It+XDF9Iztk1ytqysiUH5p7JqIC3MkGC0OByfVoaYErhLzRXFic+uh7jlFt5?=
 =?us-ascii?Q?0aOT7OGhpLHu9hN4zH1xF9UNMWjl1GMv7IgfLvhkpa9677yb0VCp7xR8uznP?=
 =?us-ascii?Q?8ydBQj859vccqees4TTIgiWJVpheh9OzGME2JsCOpFZPxqq51vU77EFXihRH?=
 =?us-ascii?Q?x74mkLxoqWB7aDeH6IWcORo5CdamlsJZSoADVY+njHBNZd9B8HAiHdy7+2Pp?=
 =?us-ascii?Q?lojh1dyivOQ3xIi4qmUYy9tytL5HcJQ5z0IST48iYNrJM73B7yq3bVAar1ll?=
 =?us-ascii?Q?VT72zb2KzuMTC+iQqEunMYWSvVOlmkVKWK3g1xHtZskfsurw9mJgc9JsBaJF?=
 =?us-ascii?Q?UIjPWKXTC+493jpYfSTp0sI0DaASLMr6NMmU2x3uz8hW5UMQc4iY6QCmYpIa?=
 =?us-ascii?Q?dmmODf/OTNGxUkRbQmHR15t+9i8uQmTeixR0lZFNoIeaaVGXRDraZ1kKtrV8?=
 =?us-ascii?Q?TfI2IUQmCOj2IMCdmKuvZF8SXe76ERPjFvb1pwXGzsHOsajgFJlXbqmJcInv?=
 =?us-ascii?Q?hEPFkDV/5y9ZJvSP2hn2hsMrDx0u6DEgfR+Dd3P2bG9fngvujVA1P11gEUY3?=
 =?us-ascii?Q?jE2x4iq58wvD9hUAoBzJYl8LGTVEBstwcx2DNY73U/I9tNtLkkx5gbcqccCI?=
 =?us-ascii?Q?Xv6Kv8Vu6uZgC+nE8YVedPgKMkTyuid+yeLUDIoxk/p33AmYjRGGC1mT2vQn?=
 =?us-ascii?Q?OXi94iIld67ZL7d4X2FS7NcyGUpvM1cDYFQZkXrEik1vsBb5u94hB3k1d1EN?=
 =?us-ascii?Q?A3SKdCd8TNkdEi6WK0CzkdxNcVCgUT5oVUfYJ8qFxATG/pDXdMDFhelY1HYv?=
 =?us-ascii?Q?HqeoNzpc6Nr7hVC7LHjqrVolq3KRrH3HiuWV+Uyw4H5bX3s7EKPPwcEpOeA3?=
 =?us-ascii?Q?vPj3kCyURtfICH1zBP9VebWlJYfDeZFD/CVJePrLF1qFadp8PL8r6VYTSjH3?=
 =?us-ascii?Q?XUEQCOU83rv76I8+1ycAUt3e42A6m9ZC4U054iDILuVD1aP6eW64XlaA0NVE?=
 =?us-ascii?Q?haCiwYjU9yLrAmqKBXUYm+8QHV+3UG1B1pMOTwxEis7cvzDMpuR/VAYRpWAC?=
 =?us-ascii?Q?VyfT5BuiEywWm8pCCGo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:22.9192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 523a287a-b7b2-435c-2d9a-08de3933f3cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110

Helper domctl_lock_{acquire,release}() is domctl_lock, which HVM_PARAM_IDENT_PT
uses to ensure synchronization on potential domctl-op altering guest state.
So it is only needed when MGMT_HYPERCALLS=y.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- refine title and commit message
---
 xen/arch/x86/hvm/hvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ce75fb7839..b52dd8f1c4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4272,7 +4272,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
          * the domctl_lock.
          */
         rc = -ERESTART;
-        if ( !domctl_lock_acquire() )
+        if ( IS_ENABLED(CONFIG_MGMT_HYPERCALLS) && !domctl_lock_acquire() )
             break;
 
         rc = 0;
@@ -4282,7 +4282,8 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
             paging_update_cr3(v, false);
         domain_unpause(d);
 
-        domctl_lock_release();
+        if ( IS_ENABLED(CONFIG_MGMT_HYPERCALLS) )
+            domctl_lock_release();
         break;
     case HVM_PARAM_DM_DOMAIN:
         /* The only value this should ever be set to is DOMID_SELF */
-- 
2.34.1


