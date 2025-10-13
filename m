Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355CBD280C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141906.1476102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbe-0004o8-1x; Mon, 13 Oct 2025 10:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141906.1476102; Mon, 13 Oct 2025 10:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fbd-0004ft-SD; Mon, 13 Oct 2025 10:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1141906;
 Mon, 13 Oct 2025 10:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fbb-0004Hi-Uy
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:16:39 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b46e54b7-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:16:39 +0200 (CEST)
Received: from BY3PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:39a::32)
 by PH7PR12MB5880.namprd12.prod.outlook.com (2603:10b6:510:1d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:16:33 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a9) by BY3PR03CA0027.outlook.office365.com
 (2603:10b6:a03:39a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:16:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:16:33 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:16:31 -0700
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
X-Inumbo-ID: b46e54b7-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDNrXw4NO1ytbAkC1dKDJNq7Z5lDZhMsZb4JJrF4zLHspnacHRCa71jpv9rudCQ2rrE6DxYze2VJLzFDOwfqWaGD3lTGPJA5NxofVv315n0cJ5UVo6i/KA9sjQEJgSbQSzlSWiYxUksk5k2fkiYAKw/8111p8UCoDDuXU1CTlgm/3XFG1XXtshYeDvbwNFufreXTWtRZf/rTL8TWFAsPDqG2/3StqZMU6t1VqtYbUrJf0OEVeJnTTG4ny9eX+2YO8+Jo3uLZTPCTq0xS2kQ0VZkCYV3/u8OayroGdEn6Rbn/0BQfGdF/dUi3h66zZTHQw+k1/EguvMC2jAmp4TL1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mql/dsfaYIKIOGvkNWnbjlJZEqTDwvDfgY4DWzwyQkk=;
 b=bsOrAtrTcDWg6rY9MHtfgy6ywgSVRymTPgNP/OArCd+4N8yvvsm6aHAx9qtSpWBFvTZIGs8Y9/aizgJ2akdfF2D7UOkq0xwEb7Qfy274RVmYCc5p1it7ZPVBNjTMBF+ZTKAkdpnewgSvcqs4+J8ANJowSMjOxnopYebMPUOM1HqjC0qfHC0KNFJog4zOHrVfd5GDmcXsKjm0oeUD4ajJPTKKEVFlL5vc2QZgV6cbo6PS8hctq2gkc8gBC9vrvUOz2GcnQb2zoYPjq/u5pFtsWb6JrfpYNKGN6dM8ur5Z2toze+obGtQ71NW5kVWnmK7KpoIr6Dd0k6wxzFMZ3x3pEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mql/dsfaYIKIOGvkNWnbjlJZEqTDwvDfgY4DWzwyQkk=;
 b=YR4R4i73HmiVVi2X7VG+gnILQWjQ+8VDT6sg/0lmGEfJnxE2YKoA83AKDhYJOPFrvXR6/842qe4tkPcRnMiocmC2kPF6nX2N6JOiyDvTx+dz42odoBQMAOTg2ICVNI1Oxxfn23HT9Ex98ChyqQyftS0FRI3YbxBC6R/riPF1+5w=
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
Subject: [PATCH v3 03/28] xen/altp2m: move p2m_set_suppress_ve_multi() forward
Date: Mon, 13 Oct 2025 18:15:15 +0800
Message-ID: <20251013101540.3502842-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|PH7PR12MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: f344523c-4356-4539-00d8-08de0a4195ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MmnZaXGN6BIrBLc1W+uWh8WXswh2ZKdNphxnNXiiC/kHRmq4TCt2aX4YSmEV?=
 =?us-ascii?Q?E5b12xMHfYUGScOxYqzGj5bhb7GnUXEavCU4bQqK9zGokEoMYA3THBwhvAJs?=
 =?us-ascii?Q?O/2hMgB9LfU6+pApgpJ4OdF5sEmkGsCLkErWIEWVybW2ISXRCJ20JOhOnuDE?=
 =?us-ascii?Q?LDef51Qg5Z6KKRAfxdAsAta0wuYyfYYvlGteC1DEawjOXUHxSptZDu7GB67B?=
 =?us-ascii?Q?v6g8U4XHcPMXQ2UJtFVh4OvdILLfJbIosItoSn0LCbrU/+2ol4oLftEmo2LU?=
 =?us-ascii?Q?4WJfoA+5JvMhMonUf5dCaW8qu2B1/wGxKnrLUEoto9NADyShQVIg96AD3xHW?=
 =?us-ascii?Q?DhdUqY3IBAgGfl5t1Kteln3Hg0Byj34jnn+RQwcRHMQ6XiPyAZ5MM81PCnaB?=
 =?us-ascii?Q?oeGKhda4/89Ih4EyB3aZX+TT9FywHumH4bPndgW5oFhaZM+z5Zj4LF59rqdW?=
 =?us-ascii?Q?EUseAxIyDoCtIB/4em6UBeQAxY88XoZxV0yBzHEeB57X41uFSnF9sx3H/lRp?=
 =?us-ascii?Q?toWnVE6DaAQDLgWpCP1fzMWz1yUryRPtfgf7P1YKhDo1HWwfaXY0g0tlDDiz?=
 =?us-ascii?Q?Nwvd+h/zZ+cJCrcVURRaXkJG9z7uqUApiadkc0mkIlyotokywxyZnM98UDY/?=
 =?us-ascii?Q?g9jNnG5N4A4tLTRAgB/EcTsASzW6+hJhjL+yhgu1gYDuSImlUZsT6HjyoZ7A?=
 =?us-ascii?Q?UBgUxleTzkfhifVoodiw1LlmizmrlJMt3uucuOfao3LUR0T9mFnKTo8IPsqe?=
 =?us-ascii?Q?HnbvawkpceYffOznTmlbBhcQtwV+39nUykiTSHXmrsDsZlfpXi7rWgI/4fV6?=
 =?us-ascii?Q?0hUmmmUFhMfSwuSN/uBS2W40xYQuKOJcgNY/w62fcPNaB9dFdLHbAGmXzeD1?=
 =?us-ascii?Q?zCnmp04gwaa85Gs0WeRn2hnbSUIMfZmCGq3Lk2c0wLaRPt8r6MtcaWIDYrVO?=
 =?us-ascii?Q?b8sP1E3XUE5KTpy/XXAO9VLTGeGq4xfCgEeLq/5eRxk4rMDjKBzx3EjQcqsF?=
 =?us-ascii?Q?nG940HCDTCP3wjg5uV+HtdWNNlgdV8UEB3hck1ZijCZloU9WS8sQuT1tTAeA?=
 =?us-ascii?Q?y+UYKwK99ChzSzeOKtPjehkvUuAfZgAPBp4PyqJ0lK8QoQU5Pdk5cnaA6EAU?=
 =?us-ascii?Q?7yC+QMhPKu8vJdpLaVh4FRvMtN29OYGnBhWkiKMQH8gGLcOcQZZkjz8A+vxy?=
 =?us-ascii?Q?vYc6Pya1ZayAHFKt3uuaCPqP2hVmV8rAKGwmPG/0Kc2AtUwxaL6loiNMYZIB?=
 =?us-ascii?Q?s7AnQRM4MsOcwjb8G0UScsqh6tpMHmCwr5UOtW/Y0vFRqlwh8lWmrfjy3Ea1?=
 =?us-ascii?Q?YcImVs7sE6A/y7fJw1CHD8D2Pm6KWA0L1/EVNzAqN3U5dshAuiTgEJtPg0MW?=
 =?us-ascii?Q?/d/7DGuJVcYufAOwgVQ+9sZNkPExWGkmidQ+aFCB2NTkUTiCKxaH7QmSzYLu?=
 =?us-ascii?Q?MMctkM3EmNL/8KSWeTa5yqmjsgH9o81qaGHMHwdB5wKEFyTGkRPXrZ6cdt2A?=
 =?us-ascii?Q?6v6KgCJEPjFGR8+KfxFSJvxjvI9kdUlH1xeacL/saIB4k8R09Sh5k9B+qODd?=
 =?us-ascii?Q?/5U7ZciCIwVk7xNQA20=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:16:33.6419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f344523c-4356-4539-00d8-08de0a4195ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5880

The declaration of p2m_set_suppress_ve_multi() is in <asm/mem_access.h> and
hasn't been included on compiling altp2m.o when VM_EVENT=n, resulting in
undefined error.
To fix it, we could simply move p2m_set_suppress_ve_multi() forward.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/arch/x86/mm/altp2m.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 0261360aae..962111fbb0 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -640,23 +640,6 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
     return ret;
 }
 
-/*
- * Set/clear the #VE suppress bit for a page.  Only available on VMX.
- */
-int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
-                        unsigned int altp2m_idx)
-{
-    int rc;
-    struct xen_hvm_altp2m_suppress_ve_multi sve = {
-        altp2m_idx, suppress_ve, 0, 0, gfn_x(gfn), gfn_x(gfn), 0
-    };
-
-    if ( !(rc = p2m_set_suppress_ve_multi(d, &sve)) )
-        rc = sve.first_error;
-
-    return rc;
-}
-
 /*
  * Set/clear the #VE suppress bit for multiple pages.  Only available on VMX.
  */
@@ -725,6 +708,23 @@ int p2m_set_suppress_ve_multi(struct domain *d,
     return rc;
 }
 
+/*
+ * Set/clear the #VE suppress bit for a page.  Only available on VMX.
+ */
+int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
+                        unsigned int altp2m_idx)
+{
+    int rc;
+    struct xen_hvm_altp2m_suppress_ve_multi sve = {
+        altp2m_idx, suppress_ve, 0, 0, gfn_x(gfn), gfn_x(gfn), 0
+    };
+
+    if ( !(rc = p2m_set_suppress_ve_multi(d, &sve)) )
+        rc = sve.first_error;
+
+    return rc;
+}
+
 int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
                         unsigned int altp2m_idx)
 {
-- 
2.34.1


