Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2846B1934B
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068393.1432415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMa-00036X-Ba; Sun, 03 Aug 2025 09:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068393.1432415; Sun, 03 Aug 2025 09:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMa-0002zP-6r; Sun, 03 Aug 2025 09:50:44 +0000
Received: by outflank-mailman (input) for mailman id 1068393;
 Sun, 03 Aug 2025 09:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKs-0005hH-Bn
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:58 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2405::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11fcd8d7-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:56 +0200 (CEST)
Received: from MW4P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::21)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:53 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::1a) by MW4P222CA0016.outlook.office365.com
 (2603:10b6:303:114::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:49 -0500
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
X-Inumbo-ID: 11fcd8d7-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARczdvGYuOMPm4+UD8Li28EXZU04EKqD0O0n4/KmywKC4/CJPFqD+JfV/WIXHO+onF31bOv4JWWnybxXxRlqVRtXrvVPhrb0Cf/bnY4CkNGqJKaAkcjSsPK/U/MGPpD5yRljzlZElFSug3zCYm6r0kCYudgBjlM5i7df5VbE3gurr8+fwlLp7mt5OZ10cDVB1rHSrMgOopNcg/sKQwrHSfrIv0vDi47vwXz00Do4swVb7xnIR2gCbAmpWJr0gdAnBX1dba1+aIhKXatnv5oci8GcIpSXGpMqiBWbGwxADLWgJL4uTLHJ4RmugGjbBT311JsXvgQS3bIc2dnuv3ju/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfYuMrYWad5Fva1XqLQuOeatNzy3wAWahlriJhtMNLA=;
 b=fGgd5JwW7Sh4587oqj7bP3pyb03YOITOmQsarL8ZlAgpwvsk0DlLl3G9JzosPsjQjnp/zDQ3wcMBJZ0VOC9Eth1/g9DV52mhnGapUD404mjv73oarigEIEckdFqJWkCfhZyHda0xd2l5JnWoz3X2l0PRPAylAFddP1QcSlEgAnDw/WO6HmN4nnY2N4rmCXWBE7AlUk1S5ZGlTWmfiM+YpQrBg2d2oRUjziZaFhxYP7g47tE/V8Ar6kPt1UgciKvmtAe0wb6LaXpKX118e7CO7bmHSO9XzVHxEmoBtDdS7L+D9/4zGqYt+ZQu6ZzGr4EAgrQaKCGV644uLMeqUMuAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfYuMrYWad5Fva1XqLQuOeatNzy3wAWahlriJhtMNLA=;
 b=thfgEEUfz8JMIF4iAA9a13udmQtYQYeXaJm30PdlSMl53uL65zTRpGxpAvnAyTc9+CwGJCkoCIAiFxt+3RsmT66RCBbiZklFh5ecsf6qgZhdaB5R9ozXYVTofZuhIPVCSyph3hirH6y2My1WzKoKBR9p2lTglwIAg497eaBwmUw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 18/25] xen/domctl: wrap around XEN_DOMCTL_set_access_required
Date: Sun, 3 Aug 2025 17:47:31 +0800
Message-ID: <20250803094738.3625269-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5ce328-bfa4-4b86-2563-08ddd272f505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cz8AGoVZiUjlRed6BqehG2wU1rXHMAFtmhvwS0G1sJrC41xymyk99ZwoQpJC?=
 =?us-ascii?Q?ouNVenIrJt+0ojlBcOtCCpjy0d5YRm+xbnvQz8SOPxdfKzYC3i3IrDJc09oL?=
 =?us-ascii?Q?Vmv9WzZ8EAkhGAideXqZrv9YAXLZc6p4xjRh/Xa8XNVaJSf+RRGQcF6ZGFkW?=
 =?us-ascii?Q?HylO6mALkNw02a9ftOvUBjW0bMXx49vrTREYqjEZ/n3mjLxZgVjPkeAiUEuo?=
 =?us-ascii?Q?ntbOxSrK8roGZEtRJkJT0P2+wVg0MtQ5YJkfbgRVGRhP2PaF9un3q+GMIUu4?=
 =?us-ascii?Q?lsZyvzrwdXvWqJVETE07HGANmLnAQ/4Y6qhGZk3XKXbKlEXiBUZqwJ1ov07s?=
 =?us-ascii?Q?1+JSYMi+q4ZQ6Vs2fAJeMVMX9bZegGjjgruk776pczW8qvbvlj/JSR6rX6iR?=
 =?us-ascii?Q?CVSqZEmtTypQJAR6Tdjxipd031tkFKwK6vlsixZ7QQeJdK6Oh3I60X/eqj9f?=
 =?us-ascii?Q?LfjgJX2bJpm5jPujBdk19ZCjmW4N4SovCA0tpEYQACHXar0B7GbF8e1XkOTb?=
 =?us-ascii?Q?k7ERkOQrnGlSjH4ioaeFaM6uAHbM3tcK0eUjlDJsAmmHMdepOTG1+owW2MbS?=
 =?us-ascii?Q?tsvq0oPRDOTK/FrZqZn+SyhC8D9qYfhXeasnlqsztaUYMf7LsczVZsT1/Y78?=
 =?us-ascii?Q?qINSmRzhXNnFthtOM2T0mnyANMPzvcKrjwcww2G6QFmrJ/XZI/VHNpbwT5wm?=
 =?us-ascii?Q?ufZbJP+IjSwsQ5m9Et4AC5n/mJzl2HFNTnpYAlN2/VBgt/+/trl1xT6jp0Ak?=
 =?us-ascii?Q?N6eoB9Kxg0Ubthzyi6X1OrHeZXuAJzOo0GsWq6kf/6c5kLil/hGAc7fxONq3?=
 =?us-ascii?Q?a43Bc4a3Ryzqj8BUyyDSh6aKG+I8uKqbZ1AG2k67zA1gzRlrsC6ggWlmsUm6?=
 =?us-ascii?Q?c31OmhSxPLIvp7lCSQgbpI2IzNc65FQ/O1uAlCX9LI+GdxWjgpZxQnQjy8It?=
 =?us-ascii?Q?YuUJ+2bfcmeLLe/980CmrCJtdkHBoGS3biF1wCYbzBV7eWoa7mWw5U1dUjxr?=
 =?us-ascii?Q?OaK3rdKfmFRx0Iptc7/5FboIUGWUdFSVV2AeHYYGlhXTemTly1TPKjvSUmHk?=
 =?us-ascii?Q?z9NEnJjc2Ct77ubS+UMff7L6D9kq3z+OOZgEHhX49REjOMxhTxK3rVPGwl1c?=
 =?us-ascii?Q?myWvnFcLUpzKi04KVyxb5ft8eibBf7LT4vp6NPaUpO8c1b9yJMIsrGD1q+Tf?=
 =?us-ascii?Q?LndGegdYV/Ci1b6Z8UBc7jR2oyxV9S+n8y9lKtZaliqIR/5J9WTwhMXabIny?=
 =?us-ascii?Q?lCHvNTIDUP7D52jZDNmVnYQGxQVEIXlvsTER9bTk5n8xuR6ge5yrR0Im4wQo?=
 =?us-ascii?Q?Ycr+9L6mb59CX5HZcAcFmS3tukF/FeViuDoFLtkTcz/VtYER+CjMMPfVI9yZ?=
 =?us-ascii?Q?NhCadaBLSNq8IlrUMB/UlkHlhBnnmFhHBs5WzRmmn7G7NgUpJfb4XhdcAlKH?=
 =?us-ascii?Q?t9YBNzg6wE6xlvhas6sTjGlII9NEgHtvSzuLgTIY8Rg56AqV3/7M3WRrz8XH?=
 =?us-ascii?Q?Uudp73phuFIl0jkCpnZ+Q+CPpPcfa/9C046m?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:53.3989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5ce328-bfa4-4b86-2563-08ddd272f505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732

Arch-specific arch_p2m_set_access_required() is reponsible for
XEN_DOMCTL_set_access_required domctl-op, and shall be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/mem_access.c    | 2 ++
 xen/arch/x86/mm/mem_access.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
index 2af92bb402..e205b6be8f 100644
--- a/xen/arch/arm/mem_access.c
+++ b/xen/arch/arm/mem_access.c
@@ -450,11 +450,13 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn,
     return ret;
 }
 
+#ifdef CONFIG_DOMCTL
 void arch_p2m_set_access_required(struct domain *d, bool access_required)
 {
     ASSERT(atomic_read(&d->pause_count));
     p2m_get_hostp2m(d)->access_required = access_required;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index 21b5b7ecda..de694c16e9 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -480,6 +480,7 @@ int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
     return _p2m_get_mem_access(p2m, gfn, access);
 }
 
+#ifdef CONFIG_DOMCTL
 void arch_p2m_set_access_required(struct domain *d, bool access_required)
 {
     ASSERT(atomic_read(&d->pause_count));
@@ -498,6 +499,7 @@ void arch_p2m_set_access_required(struct domain *d, bool access_required)
         }
     }
 }
+#endif /* CONFIG_DOMCTL */
 
 bool p2m_mem_access_sanity_check(const struct domain *d)
 {
-- 
2.34.1


