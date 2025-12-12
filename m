Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88177CB7D31
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184908.1507254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQi-0001Mv-JK; Fri, 12 Dec 2025 04:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184908.1507254; Fri, 12 Dec 2025 04:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQi-0001K2-E0; Fri, 12 Dec 2025 04:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1184908;
 Fri, 12 Dec 2025 04:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQh-0007Dl-1C
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:55 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd4c3b1a-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:53 +0100 (CET)
Received: from MN2PR15CA0061.namprd15.prod.outlook.com (2603:10b6:208:237::30)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 04:06:45 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::e6) by MN2PR15CA0061.outlook.office365.com
 (2603:10b6:208:237::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 04:06:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:43 -0600
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
X-Inumbo-ID: fd4c3b1a-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhPEswa+DaHG6t5rhRU0PA3rjPDYep1s87M4wSZw5Q5WxKHC7BDs+cirkbolPU/yKMQYq7QmyPtw3TUkTksGwxXjIsC/iXvTM1p+eTFfYgItoZvcNR7ib/gAYLeY4NmybBXAYMdsvr6yxfqOFWQXknprMghtVMTj1SKa3zBRGWYg8nem5E5CQFxXGYyC+r49LUgXdl4VRtj02cIOQnuXuVbn6Kl6ofzKVk9kVa9uRw+7GBz7kScNIvHTR+qtjYDGYrYDkBZbp+y4NzlH05wd0LzCz9TAPW5GNmLBjn6Kv/9a2F9Q9V0IvKXSDULkEykWOaKTQ2D6QdQyhWMzZvxRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynBWoLzkFEqy7wvBamCk0uYlCKmGseA6I5oKFUpt5OQ=;
 b=tbiaT06cLJg0wl3COzIrhXivF+IRHoLFdBPrfEs1QMAniunoQ5GuS1ndQBd3EPG91qwJ0aKi766pq/7XdXoy3VuJ50LwSRe3DU2uCCJcfOQEts0drf3Kp+Eah9WJHISzWg9JXG/nLdHH/2UUPW0rOKmRSnr/RptdnLdfdCuj9DhWkho2wKqyPpOiY80bYZMbt6CxTDuxJqcCFZOir9dBQ03NykB/J6on3f1qKNWfV9+Mu9kglzsGqHgeJ7XDyI1p5R63yAj477CTIMM6Bo3msX2LVIhzgLauvUncq++4YQ/4bgQWemEmjh0KJ0+Iz8Ubj8NVR14XaghyFetAfY1IXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynBWoLzkFEqy7wvBamCk0uYlCKmGseA6I5oKFUpt5OQ=;
 b=qoqBbbyuhqri/5tNAc0pGgFw0T9m+95RgcBQ4imXdbgfcRX9vaR2R0hrXALTCQ8xtbcNHyXfJ4zp1A7PCK0/v6+Lh5bN8dYRYfosO7F0MJ0W4Rt+n8wQkXQ2eqvBm0ALAYZ0gCfHoMJksMHIJVKQKW660FOm099D3kileQ9CaVU=
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
Subject: [PATCH v5 08/24] xen/mem_sharing: make memory sharing depend on MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:53 +0800
Message-ID: <20251212040209.1970553-9-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: b545f5a8-0cec-4de3-d4d6-08de3933dd69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F+ruPS8dlHJTXFzBbKnOyVLsN8ZUci95mNNmMWSZP79sDELRB72xvuk0+UHr?=
 =?us-ascii?Q?q2e5u72lr+Ip6AsrE+YMDlJreYGVc6XpA2qDVUfdI6LTRB8fA2lfPh6XLt6Q?=
 =?us-ascii?Q?wf+tzAUK4n+vzDfT5WgQH2HIBDmO2brM36csA1zmyqVsK/eet9imL95it34K?=
 =?us-ascii?Q?5dlZcd92jjiCXEpwfVDA/tlC+4p3NUaZsRopMMKXNp46iWJal50drya8Su0t?=
 =?us-ascii?Q?w9y+mTXjSzUx5U4Ll6YD1S8ecvUikdGvKMTT6HKv+fHTIfNYmi1abcZbO0HO?=
 =?us-ascii?Q?+UyZJPSKmMkwNXLeiTi3Fm+PBncVctsBW7XPHJlaiP+9+MhoMThaA9rlWbDw?=
 =?us-ascii?Q?EaT3/3447BkovAyKULXG9EWy9sycEcw4RMv5e/krrxWbKmw1wWKpwg5UrYr7?=
 =?us-ascii?Q?9bPUnpVxoYN1YBPwBhBGm2/c8paY8rc6C9Q51DyoCe7afwSr7R5gAeyUvJ9d?=
 =?us-ascii?Q?DTRpT/sp6EomRp5JIYFj4aeAhCbhjs+YQiUBKrPJgCJ2sEY16adnMIC1ClTD?=
 =?us-ascii?Q?enXEsFCY/VVd1dGMU6cZLWMjFwH/CvWvOtvZGbb4yb9SN199AUVtMPG58Cp4?=
 =?us-ascii?Q?15QaeK2CUktUPSim+oPyKNXl5ozyE5ARWNvPK7W2qAX2l+op1kp+krN5jo5v?=
 =?us-ascii?Q?DA3IC3bNTP3RkdFEk/COvZGEi7NiVCFAKfHXsIEL5nBDKYQMtPhw6W2y9Pvw?=
 =?us-ascii?Q?Se9Fi01YQaQzqvakvzkVjSdxbQ0DZaX3nCVW/xc736aSy6CE7i/h2FAhNyPi?=
 =?us-ascii?Q?MAK9O9DOQ4/u3ZTZQvgHJ9lF2AqzcjyPyMwsbDHlU83L7yd/q3lhj/K53ySv?=
 =?us-ascii?Q?4gQcIEsuYNtzPLH8hJ4K15Uj5Ooy8vEVwzTK0byOZNNs+8TVLPG+Qgnymeh3?=
 =?us-ascii?Q?tRwqewRQEJ1naR9Ns0suMJwqj3nKGviU0pG9QYqy53Q6G1SE/NU/GDgSC+7P?=
 =?us-ascii?Q?MCO89xPwTTmCmwKINULf+VF31buPYl7h7WvzeG0boKPpFh+qM9SyA0GL8Shp?=
 =?us-ascii?Q?vblghyDyO4R/fzcXje54PtUY2RLKQVozGtO4XMA4r+mL0X6fHggs6JCL+ZG/?=
 =?us-ascii?Q?7RvqHkAN4f/csB4D7QLSff+f5KnLI1+ASK4ruyj6IQ4SPCiviRAt0hRX7+xQ?=
 =?us-ascii?Q?wYD57WffL4c8IEJrcPVi0zv3Ofi6fRk9dI7cIvl0GcTxwkh3RSSPK281hZHL?=
 =?us-ascii?Q?KKSOALj3w0iq0gz63RVI9ih1ERxlc6SZlAJjFiemQFrQG7024drB4s90qx1V?=
 =?us-ascii?Q?CuIKHvdByUCUvoWQc5ezacr8S3b9n15MZ1uC0qyivB4FnPo7g0FwVPA0FHBb?=
 =?us-ascii?Q?BiO62YnR69raRIqvfdB+FQldbaGz9HDEob290azRdpGJFajSou4W3VsHXJfH?=
 =?us-ascii?Q?vmWC2IGTfr6GqNt6yN4xPG1aBsr1tCcXUCofH6kLRsIogUxZXoXTu/zlINh7?=
 =?us-ascii?Q?akt5MPBPNop8dhn3Ss3zvUIuFjb7nTIq4evtaodjbNJGjCmIB6tV5WN7VrQK?=
 =?us-ascii?Q?fmXSJ5YtKPVXEcPWKR+OjUAp/xQaVgCt3NFKHaXNrRqXywgJVl1Ej31KyueQ?=
 =?us-ascii?Q?svNN309XjRKs92+IYMs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:45.3581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b545f5a8-0cec-4de3-d4d6-08de3933dd69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191

The enabling bit (d->arch.hvm.mem_sharing.enabled) for memory sharing could
only be enabled via domctl-op, so we shall make memory sharing feature
depend on MGMT_HYPERCALLS.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/arch/x86/hvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 25eb3e374f..df9bea65b0 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -79,5 +79,6 @@ config MEM_PAGING
 config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
+	depends on MGMT_HYPERCALLS
 
 endif
-- 
2.34.1


