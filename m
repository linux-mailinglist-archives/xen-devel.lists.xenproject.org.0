Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0AC789D1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168689.1494739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtZ-0008Qe-O9; Fri, 21 Nov 2025 11:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168689.1494739; Fri, 21 Nov 2025 11:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtZ-0008Kj-AB; Fri, 21 Nov 2025 11:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1168689;
 Fri, 21 Nov 2025 11:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrW-0007TB-Kh
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:34 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28ee51c7-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:32 +0100 (CET)
Received: from CH2PR14CA0001.namprd14.prod.outlook.com (2603:10b6:610:60::11)
 by DS7PR12MB6023.namprd12.prod.outlook.com (2603:10b6:8:85::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Fri, 21 Nov 2025 10:59:27 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:60:cafe::bf) by CH2PR14CA0001.outlook.office365.com
 (2603:10b6:610:60::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:59:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:27 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:25 -0800
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
X-Inumbo-ID: 28ee51c7-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/Dc5AUUoxY1rqC0Dv4KynBxYJutBlyR9I0r+lu3JJymWtr7k/c29c3IShSDccw2zyT/YLX73MfT2v3Ko4FBP1KEHEdMQrSG7OxvITzKNf8rq4ogNCv+lwRx5pvirUXweRy99shzjQH4HlVzT2h40QyHGbNuMsvmBLzGo2dzwvqvtetjPbpLhjJWux0vTdw48vNFU99NFcjxz3YJTVHIcLee+WvA+va6vkI+Py+zmpk+dJCLQZTk42gFmdVIFskDgTY+G7QCK4crvMvF9b+sYgPQb5WQ7mmWtHSSUDTnDRfYHIwYFrPYKHqcc+wErHu+jX69VvJVVG4ldYjR+t2cRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD9kW6Mt2h6oTqu5hKCaJHPDlQEFB90rWIR9p7g5wLU=;
 b=BnFl7d34GzvCEU2K/Sznq1ynbAKS881m2VEe26xn4eDeJhT7oseN3gFDDvUAfK9uIZU2oeGWVSsvIq5adhGy2R2i437lyLv4d3nTVckJst6LT5qTYr0SihxlNLIGxaLa1guTnCa8PE3ZmKHzgxDRwhqSlyRyHaIJuEs3eR07iW5E3mjOj+7A3HUQfm68T6kNZC0AQvEFxeu+Oq4nwExSOHeimbfnz5+TGkZ1QfFvMSt/PrxGTM7g3KqC8/zHt5rCxs3p/asM5wNKpUxVcWmDDow6VS3kUMAfeH7KTW684Cy6xTGwG6EESRKu7hR5UCYoTZuSFmpRLGzlQQxNT7ZQ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD9kW6Mt2h6oTqu5hKCaJHPDlQEFB90rWIR9p7g5wLU=;
 b=EQp7vPiNVQ74DkQJ2TPy/99tmc935updLG4dedUfdi0ZlBW8XezY2q33tmmuz69+4TB/Z2UTfwYb37aA5g4IeYvhFpe7TbPwk6vZKYzX4TzemkNYK3eCYhRffsosEfB/sDmcgenHLMALPWwlBI4EdF1p2CB41AJaCaTPoF+kxtQ=
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
Subject: [PATCH v4 22/24] xen/domctl: domctl_lock synchronization only when MGMT_HYPERCALLS=y
Date: Fri, 21 Nov 2025 18:57:59 +0800
Message-ID: <20251121105801.1251262-23-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DS7PR12MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: eeaa6272-e1aa-44a8-c775-08de28ed0a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ozAS7wfXu9zG929pj/IzXpXjKzp1BlouDCfPqBZYf1M+5lDLZwEryWWx5OKX?=
 =?us-ascii?Q?Y0fNawyncPkZ/FX3pp17TRgvS65X2uxIIHMDw/oK6apqIe+iiDDdSNvafcIO?=
 =?us-ascii?Q?TSNTCBoL/cijyADL6FdR7egg4/cq57OTJfW5dAuTe0wEc/egRFC5KK8S3Vli?=
 =?us-ascii?Q?Rkayv96jbIyB1uGYhPsIQ7awlWzqlwpY1I+1Mw0qKh5kPrWydcxFbIKggvta?=
 =?us-ascii?Q?fZAQnKSPrYTNvilYLMCHQFwaqmB6/kaRE+gg35SaXtjk4dhx4HtvcvVv70Zd?=
 =?us-ascii?Q?vZODkbAgMZ8APdbv6Caa9IRLwQHb7aPsOUaBCo1uGYyj8T8Y4+qx3AoZfBSe?=
 =?us-ascii?Q?wXt7LkkHDY0tjyX+S73WTHWiR8PWCSLR5el1f+sCUYs19gHD5K44RFR21AkX?=
 =?us-ascii?Q?jaRAjS5Vo9t+HlqRyjRWA4g6w00PkA7ZfLvAVfDCHa++woISlyF4oR/bIP6o?=
 =?us-ascii?Q?yJeeKjPf5bAUAmh92vlteA8vdi/bkQjLG+hxltIJAa5kpRuSMthen1XkwRz4?=
 =?us-ascii?Q?8Lwk2czVEvGWz6fZE0b7lFm0lBPnvUPTzUxX1SxZA/xcZUR9Ay5wneNleMgd?=
 =?us-ascii?Q?LTt1A9EpY/OzZeJDn5/+6nwBjyccCMpQxdP71FVed4n4gffipNuoBYkRDHP/?=
 =?us-ascii?Q?JzgdusFlYcLrKHfqpEnoU28RryfhvUW1laK7ah8KbabPXanf9vXk4COXc5xf?=
 =?us-ascii?Q?x1i21t3+fkQTZsvIxJ6ArIxDXNn3JXjHfG1q5LKC2ESLN/JdVp4Ld9FDPX6B?=
 =?us-ascii?Q?JNMas03IG+N02ZZG+iq/FnPo+gZJtQPjzX762ZYsJNnnn2m0ChPkO1oIdxNL?=
 =?us-ascii?Q?cZjLMRltYuQI5CYy+x0njxWWmFP8Xn1I+2RXBz4y2D2j8Hg43ehx2MyWhJob?=
 =?us-ascii?Q?F40YGbo9ZbFNlWpP5eiopGnwajPnQFZKgVjAZ89cNDXlY3Q/b/HE7+MctK4I?=
 =?us-ascii?Q?PwkaLhVJZf9BdXN5Vh/NlNdZFw6j5SYgXybPXzmoyUg3JyYU48aObSGPCfxT?=
 =?us-ascii?Q?2PB70xidtflOWsP4tUlF38oW0+FjGeUjQNmr+6d7auLKqEzIbNml1e2jncdy?=
 =?us-ascii?Q?ZeS0LHf7IczrM6+exDJI1muBRvYHFx3sHT5v+NlhSG1T7pP7y41UHNY8eFzt?=
 =?us-ascii?Q?nE4ytm+PRyDB44KVUYM9tUQsxEqTtD7TQNs1RqWDUd1SCgy6xnrJy5t8YyWl?=
 =?us-ascii?Q?GQ8XnPnSaP+ELOA9hSQCS7m72O41SphEQp4+qZoIzBJuj8541r/C6THQsucA?=
 =?us-ascii?Q?godVtDj5I/iVRcj1VxCAXfohPb/Va9q4q1+D6BBuZp7wChwtwt8zaZSkW52s?=
 =?us-ascii?Q?cPO++fAh/QapOSzyydweTQQqjBQb8hyP06q6LstrJ8eUwSoWKfzCeC0FKOy2?=
 =?us-ascii?Q?9tiRJOhgiM1u2mJyY0Dn0FuRAPCS19YRIQQ4yqfKxMmCSnjP/gIZzGk3R417?=
 =?us-ascii?Q?wG0xolr18XbXSKKATcmUDBnaQ3N0RCC/qwy8GU+j3Zo1uRR5pv58563lQJlA?=
 =?us-ascii?Q?GI5fYYDZdmhgrBqZm3Wv0Eh3vz/m2eQDOqYfk5GuJmiSY3xcMIN93vBCR8WE?=
 =?us-ascii?Q?SPiiLJnAwETLRNU4dVc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:27.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaa6272-e1aa-44a8-c775-08de28ed0a17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6023

Helper domctl_lock_{acquire,release} is domctl_lock, which HVM_PARAM_IDENT_PT
uses to ensure synchronization on potential domctl-op altering guest state.
So it is only needed when MGMT_HYPERCALLS=y.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/arch/x86/hvm/hvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b03f7dfcf6..8afd0d9d7d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4268,7 +4268,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
          * the domctl_lock.
          */
         rc = -ERESTART;
-        if ( !domctl_lock_acquire() )
+        if ( IS_ENABLED(CONFIG_MGMT_HYPERCALLS) && !domctl_lock_acquire() )
             break;
 
         rc = 0;
@@ -4278,7 +4278,8 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
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


