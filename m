Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742DA71042
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927016.1329869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJi0-0001d8-LY; Wed, 26 Mar 2025 05:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927016.1329869; Wed, 26 Mar 2025 05:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJi0-0001a4-HC; Wed, 26 Mar 2025 05:53:48 +0000
Received: by outflank-mailman (input) for mailman id 927016;
 Wed, 26 Mar 2025 05:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJhy-0008HQ-Cx
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2412::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd59d66-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:53:44 +0100 (CET)
Received: from SJ0PR05CA0210.namprd05.prod.outlook.com (2603:10b6:a03:330::35)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:40 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::88) by SJ0PR05CA0210.outlook.office365.com
 (2603:10b6:a03:330::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:37 -0500
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
X-Inumbo-ID: acd59d66-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ut/Z9bmOWUdnA6PYlBNV/qD/ugzeUwrG6h+CdJP/J98vXVKk6O7khtXA9qnbcS8gruFfpiNhx9SWL5qUSfxxQpu3G5WekYtOnmwfVFzX768pCKx2f6SS4vxKVaMqDqBNpppL7WsQcgftsN5dEOPi6mH3v8l7JSZqNXZnzjDlB3zVr49qmcIe3aKPBcMGjUNxq9uHYwsGQkqtoAATwNL0DyHbw/ON8utRJ59sPL2IF9HFrqupTeVKq5joqwQzpLvHB7Y4090IKJbPzVCDcQWx2W2KmU8FXy8Vo0XdGiJzHWAhXaGKlQB99G9nKA8rtlyiJN/MokifQbE9jjA6DOkfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwQ8BrXH/1fzCxoXpeMoYCH22ialTFdrqt0KWxIUOVs=;
 b=ZujhLumOUi0PRUrkIr6OXPJ3dKQLLSZ5Ufs/dcsfZ0b8BIMuSWNBF//lXqoElik6vzVHYSNK9v91hoVo9Vj4lRwUwuvKuxH1FsBeJzuFCAc5LETwE4vxdImLUN/iTO6FZPHwq1p4la8+nnTI9JMPio4kAfBGS2EGAO6l9qYc3nZsjZBpnHQAA96Gr67VLtN1lDYwGTsEt+rRwIWC5ITg84CNEAp5NBiXOTryW7RhT80w9Uk6xDVvGNaCIQ9ArdzQqv9zAdeR6SW4XA6etmgK3MTeU66DB3Yq31zjZxlmUOC4TwYNJmnFQEK+JZtSH0fjDULycdt9yoXa0xU+zeBTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwQ8BrXH/1fzCxoXpeMoYCH22ialTFdrqt0KWxIUOVs=;
 b=iyFNX2nfLaqKXpThHT0mCk0cAjqSyWTapuEXHH60T98img7NmsQpMBKoDHktuT3fLOmYxCzRr06n12tdswp7JqLbjD2g133+2Jhazm5Uz1ueM9hXzVbzWZzaY3r4ku8amx+BIEDqhrdgw16nU9Fx/slr04NME4bRzt04hxPqQMA=
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
Subject: [PATCH v2 07/19] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
Date: Wed, 26 Mar 2025 13:50:41 +0800
Message-ID: <20250326055053.3313146-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: e5468436-bd5b-4761-a2d0-08dd6c2a8f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?srlMr1+al/wiYy6JAUykLx6/OiuTuCK2Pui3AKLFaDxLrkTXhhE17CmEba9V?=
 =?us-ascii?Q?ZMOFLoF/6N2WiagEeFJZvTSptPoJOCvSX3FjUzM8l9GetvpqQmZjcHJWIhVC?=
 =?us-ascii?Q?oqmFP58tKEd27ptQcM5qIcm+AJwvPz3V8cuFYZDrz46CYs56ZZ+G/B2kVFht?=
 =?us-ascii?Q?I+jpBeyRK4PieoPHJYVlQbjQpdvE4mQvrSqQ8U05dYGN0dO9YEJQuz6sQv/x?=
 =?us-ascii?Q?tcc+VMx0p2kBpUOKLcvQw5yTYA0DmMgdKEs8nexTD3o213GkpNitUMmk5w6Z?=
 =?us-ascii?Q?DAccCqIiYZuCXzudVM98vwlfMCRF3dyARlVMG3yonk9rs9t305MWdJzKcQ5B?=
 =?us-ascii?Q?v40fhGS0LVgMCcadBFOla6S27ZAAJtdNix8CTe9sIqHXrZLxGXcv97Xf0vD4?=
 =?us-ascii?Q?vtHok8mhbMgiGX/p8gBLZRoutm+bxJjyITCvrYPL8kXDdzvu/2oRXFVgn84o?=
 =?us-ascii?Q?aY47bU6PIUgQecGWC4fyw/ohPVrkt3gdnrQPAZc7jeafuiQH8WwUmZ+jrk3P?=
 =?us-ascii?Q?JHMdecimfaQvEpPvnk625P/PkQUoWn9yNeZsQhtl/Dzr4di9/ePDMfsmgqC1?=
 =?us-ascii?Q?V589gWAEmFUidFFVuArs0lihBA/A9M2LW2pPII3P7S98mNglE+/g+1WQfZ87?=
 =?us-ascii?Q?n1HqqczPWGbVB5T1JcQdSnU7+udrHGH7RvAs3l+XBn6HEhmgxMv12tydwXCr?=
 =?us-ascii?Q?s0l/D6mAEPmXZ9xcDv/cVoClG+1f5x23ffxCYvJ4DmmysFzDYXuO6TK9cnO9?=
 =?us-ascii?Q?KpJgr5OWKOP4rcpmSq9vYHPblB0AaaAriwZjtZ5X03XqoBEDturQcy7tBFVf?=
 =?us-ascii?Q?CIMnZ7ik+r+ucUE09Lq/tOSljqRQ+mAEKMQsKJeNawX44QQvmmAgADsyF4K0?=
 =?us-ascii?Q?B5kOKd6DbXbxlQdmUavU8FD7yeEEc5YnhuTBZ7Aqc5TP0kEusStWbPZCTJ3m?=
 =?us-ascii?Q?+qf4al2TtzbyjE8F5d/Fe0VWk6i1/gUmdpi3FQStFVf+3ci4DBBb1ywq5E0m?=
 =?us-ascii?Q?zGJPc0PlzrijW0EzpzcSNqt7vZRljgnhFx/wISO2DFWb9BSfatnNOSdTeQ47?=
 =?us-ascii?Q?OeMPrDt45bCWPAhqSJLyInhip6JQ4Q4jVlDgqI7zcf4jwlp2FXIP7odZgo/C?=
 =?us-ascii?Q?6oNj4pD0YmykwDuN33Hqw/IGtHcZdDHJLqmclAsH6jHR2vQdW6i5yXYcHQgx?=
 =?us-ascii?Q?q6U7IE0JzTqV0pPHopaAkhsz12tKOUOPeGTBN/n/IU2YmjcGEw9Hp18duXww?=
 =?us-ascii?Q?iLVgf5ZbAcH+Xotlf/tAMj3wpoFy02Aht/8fyOTbFmo3a/3bbBdc3UmEXuUS?=
 =?us-ascii?Q?5V3yWFyvZ4bDioJPJItEal35s/Tphm9kKcfXhmSR/ofOmpUte/mXlCaUx4kH?=
 =?us-ascii?Q?lOZUOT04mw+6ZB8b9B+mgoLdYrkI/nhCTfWVXA8cMJOeGGFewk4hVDyCvBF9?=
 =?us-ascii?Q?vRC47OKn1d5KdiMQwiocsW1XVQ+0nsQk4lqtHEb/Flli2Y6Vprev7eOuZUV0?=
 =?us-ascii?Q?xImP2LNyh6FTNP8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:40.4055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5468436-bd5b-4761-a2d0-08dd6c2a8f52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339

perfc_control() and perfc_copy_info() are responsible for providing control
of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/common/perfc.c  | 2 ++
 xen/common/sysctl.c | 2 ++
 2 files changed, 4 insertions(+)

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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c3646517bc..0da82d6e31 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -117,11 +117,13 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     }
     break;
 
+#ifdef CONFIG_SYSCTL
 #ifdef CONFIG_PERF_COUNTERS
     case XEN_SYSCTL_perfc_op:
         ret = perfc_control(&op->u.perfc_op);
         break;
 #endif
+#endif /* CONFIG_SYSCTL */
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     case XEN_SYSCTL_lockprof_op:
-- 
2.34.1


