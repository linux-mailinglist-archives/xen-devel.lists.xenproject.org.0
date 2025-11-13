Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C4C5582E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 04:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160538.1488662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpr-0004Tu-9q; Thu, 13 Nov 2025 03:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160538.1488662; Thu, 13 Nov 2025 03:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJNpr-0004SF-66; Thu, 13 Nov 2025 03:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1160538;
 Thu, 13 Nov 2025 03:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zWJc=5V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vJNpq-0004P7-1g
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 03:17:22 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40da3892-c03f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 04:17:16 +0100 (CET)
Received: from BN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:ee::28)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 03:17:07 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::fd) by BN0PR04CA0023.outlook.office365.com
 (2603:10b6:408:ee::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 03:17:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 03:17:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 19:17:05 -0800
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
X-Inumbo-ID: 40da3892-c03f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+91XROzIxgbi2/uG1GWsFz/+BY9qkEynHTeg+aKmlQRF1bxbNudgyrxTljGRXFVv7GgYkga935Wgz8zdlDAVuSMYKRyANbROwudf6GojzX57jrc7AD68O0T7oOcpVMKUjxAIqiAPxTML1pAKYRg0oKWGvCQ4mhboAzJ0g+2z4MKDecJ+vg38m75eeZlk+tnVXW8aW970gLbREqzf7bYLwZ4y4fcJAQ0lcWoe/FyofEyKVHaU4A1I7m2honwz7bkud8UbeED7wq0rZTfDTLGSlttG1oQdLf8yLLkGYiIO09a/L8UmMT9vH8h93oLgxod+5yfUdKyXUghVoOj1H5+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x2ARk3ZxYxwpxUDHDaaqu67aOVqpGDeb1IHQh8e0yI=;
 b=apmDhCjEIOZOnR3pzEiXyEBkgrFfXf+77RqH4cAlDrkcxuIvO4yavAWXGmWgTDhxVOlQnmQBSv2mJDf8++ORIJ1fyfLdBRCV20DW7esj9ED845uC5a57fgj8K4aPf0VfrAJQMnoLoy/2YaPbcUnr2NKDBY7a3xnX4wj5QNsriMNqucs1D6Ip7QOM6bqQ+fH3NcEQJUlVzCJK/L38P4Q+ch969EsbzX1j39oc1ao7axDJDTQBAPsogntA1iF1curYMYiqEPI/7YfoGc4NudKrhU2cDNU3s8XywQ8MmC0xJkDVMApuNXYB0pNLMB42wVU2X6mHAmJq326H6UWRL1EE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x2ARk3ZxYxwpxUDHDaaqu67aOVqpGDeb1IHQh8e0yI=;
 b=kIQutGK+W9quxrILEkzxTqtdFaWp2Nh14MoHckw2TuyjL/829dyUFdtnbAxhwiZmvavnSr7Dr2SyD9lEzcPpRSXK6lbxRkudX7aK8A+JdLva0WdsXlrrlHo8GMoH+uB5Y/2AgHjcMtvYGJ41xYDN0T/HBDrACbeY0J8YuKoixUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, "Alexandru Isaila" <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v1 5/7] xen/x86: move declaration from mem_access.h to altp2m.h
Date: Thu, 13 Nov 2025 11:16:28 +0800
Message-ID: <20251113031630.1465599-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113031630.1465599-1-Penny.Zheng@amd.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: cfeb5208-3e14-4044-f6da-08de22632088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TXxT7zah4uVDg5JCts8aj4ZQRTRbT4Pl/aNhDt7lErszT8h+BabBxrMoJJP8?=
 =?us-ascii?Q?IMEpA/np4TxysIuhgDPs43nolKpxmBaevm6RAntOIWVnp6f9hyESP/0zMFv6?=
 =?us-ascii?Q?2BYQmvCL5iCI6klpxKPRC6jS6p5wGOQjlANirbS1D7A8u9VmLyMG74Pun/h1?=
 =?us-ascii?Q?tpOfeNCo9gfgg06+7/G1bV/GwAMlJqUEIeUezBqprsi1237aECGiVuTCGm5+?=
 =?us-ascii?Q?9qzNXmzuGHxkeM5gQafe7Nhkcw+RAPO2tKn68pgy5UV5w07PbFhsq8KPhdOx?=
 =?us-ascii?Q?kbIfx3RBRXm09sX5LNiDz4iyxBVPIZb2yzoqSIVKwxPvpHMp18yuB7tKRhSP?=
 =?us-ascii?Q?vg6NxsiwrFYd9i+pUXx0auwCNto5MvBGrHsJfI0IEe/B2ShJJL+RPpviX3fN?=
 =?us-ascii?Q?m6eWrqRxPuufeesu5ZIA0GQQPfc12oSIqvZo47dv2TPg+M0z2SHclNrN2p44?=
 =?us-ascii?Q?w1RIWfd3cYkDtqUqcwI/fG4uauushT2G/JYGof+JN+Ztz2h40DjGflLYK1+j?=
 =?us-ascii?Q?SCNmAnUqIlWTtW+R8AZlMmMIaauWJV5g+QT6FcbkV8jkiTlWkj4B9sEwvHd1?=
 =?us-ascii?Q?4wcuTkeqSqSfoGqtWont1eqlY/G6Hn3jMm8/7NH3oZxOgm916v2D3i2Omfti?=
 =?us-ascii?Q?WpcYqfjHQIuxi/dyfiioiwDvuOrcHPUnMDTCZaw4kULNYr4fbYa/hx6STnYF?=
 =?us-ascii?Q?k2pRWY6GBBnZSMSdIJ6jacQTo27YVvP9INzE4HP84hYuJOzYz9l3fuYh2NIK?=
 =?us-ascii?Q?JpoP/GYKbH3g030pL+O/cilQky0sBqV8B7rHx2L3S9P7JFbkY2jx9mEDFOjz?=
 =?us-ascii?Q?jhj8Wz+dME7ook+pFBMMSGK4KvhDlBSwoWvJpVslQGQnnHMYZ1JadtTtTprp?=
 =?us-ascii?Q?P0Zut+OR83K4RBNvTfqNWiUhA7vMTqYYozH70obbb7x5czc08hN71PCI0BmX?=
 =?us-ascii?Q?P+vmkPzYBhHlniJo7+s5VIxcvN+/LL3nZ9HobPvPFGMT2SoMkIzBXu0a8jkE?=
 =?us-ascii?Q?GEv3eLZK+zIHm8gc406QNkxyHWqzmPS9R1HFByuNoUD5xNIb1GGcbhnafl3S?=
 =?us-ascii?Q?GTHgpjxmvGWreXhtlC5c+i9TZ43gZZASDqvO3wWAmkVrJ9eEPBsb+qgubWv7?=
 =?us-ascii?Q?SH9DRhRPPBcqPkfA6IJq9vWmk60pEQ08WPoegiAilY3Lqr7jIjvylP9LalPc?=
 =?us-ascii?Q?Xrs87T9DvA/KRLZDRyPJezkhdLAijiBJQsUNT3DpnWWinMSlw8j/BxV33bnt?=
 =?us-ascii?Q?8uOGmeMMFjiCaLbSLlyLKIMYpvV+0OM8j8ZE8pLjTbpJmtiE9DuNWa2YTIrC?=
 =?us-ascii?Q?WwXgHSKFOoTJtUTJ/23AHwf4xJwWCVB7pqfJ6tl9G+leHA+dcd5ZSl3+yKJg?=
 =?us-ascii?Q?+ND9+CghIFCn85A17iSQGmvmVod+M5P1krjVWKY0u44eXXXDFXTCUvYi4bQ8?=
 =?us-ascii?Q?Jo86JGYiY5uxljWbhNl5TAEFS4DbRGXW8IdAgYP9DoH81fYzJ7N9sXiiMfYR?=
 =?us-ascii?Q?uwARWy35PsO4dKU613UXV4QhJrdQ6Cc4PunlR0NVqkhmbqtJBGXCtW16iXxB?=
 =?us-ascii?Q?A2vUwf2hN79ycRhUU1w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 03:17:07.5706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeb5208-3e14-4044-f6da-08de22632088
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

Memory access and ALTP2M are two seperate features, and each could be
controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration
when ALTP2M=y and VM_EVENT=n on compiling hvm.o/altp2m.o, we move declaration
of the following functions from <asm/mem_access.h> to <asm/altp2m.h>:
- p2m_set_suppress_ve
- p2m_set_suppress_ve_multi
- p2m_get_suppress_ve
Potential error on altp2m.c also breaks Misra Rule 8.4.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/arch/x86/include/asm/altp2m.h     | 10 ++++++++++
 xen/arch/x86/include/asm/mem_access.h | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 8ecd74f363..9c1ac3cc26 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -46,6 +46,16 @@ void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
+int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
+                        unsigned int altp2m_idx);
+
+struct xen_hvm_altp2m_suppress_ve_multi;
+int p2m_set_suppress_ve_multi(struct domain *d,
+                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
+
+int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
+                        unsigned int altp2m_idx);
+
 #else
 
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 1a52a10322..257ed33de1 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -34,16 +34,6 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
 /* Sanity check for mem_access hardware support */
 bool p2m_mem_access_sanity_check(const struct domain *d);
 
-int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
-                        unsigned int altp2m_idx);
-
-struct xen_hvm_altp2m_suppress_ve_multi;
-int p2m_set_suppress_ve_multi(struct domain *d,
-                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
-
-int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
-                        unsigned int altp2m_idx);
-
 #endif /*__ASM_X86_MEM_ACCESS_H__ */
 
 /*
-- 
2.34.1


