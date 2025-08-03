Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71131B19359
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068446.1432554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMw-0008LL-Qx; Sun, 03 Aug 2025 09:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068446.1432554; Sun, 03 Aug 2025 09:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMw-00088h-5k; Sun, 03 Aug 2025 09:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1068446;
 Sun, 03 Aug 2025 09:51:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKk-0005hH-BL
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2412::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cdc835d-704f-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:48 +0200 (CEST)
Received: from MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::23)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Sun, 3 Aug
 2025 09:48:43 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::17) by MW4P222CA0018.outlook.office365.com
 (2603:10b6:303:114::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:37 -0500
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
X-Inumbo-ID: 0cdc835d-704f-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBJLQXF4GlP7Nv6zXStrnrnd+AcyvuvgcTeoRPd6gZNV1iDRk+szg+l9SKLL5aakBS9REFZtDJUaNoUg77HeMtNpYgz5dO5oNWK3aHpXPCg4oU1ReTTVVme2R2tpi2+F2z8BbDxDzchy0cIRgVysNXZZTl5+hdOcC+RN997U1+3Oaj2+QZ/qYis9w0EOS7GxLqlQM9KpfFtYBI9MS+BCb1MJGKV7b4GhHNRgL6bTFCjky7hsHZ0lgVGqqB+ye5FX4QVSwGo+HB+mtXpLbgdbapgansDih0+Wj3Es0z+ABLHL5YhYyp4CRXxJe/7AaLw/6Hqv95/neEb4JpfzjIwqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avlH7/vHIF8/jEKa4bMiJ+1WqK3wvrYKHnTbp1Pn1L0=;
 b=gp3bXd6vG2JWgTeAGEWxeWMYSYhDVI6Ve83UG0BbCmpv01xNqOrQ+gqvkLPK12T88lnuImroHN6aqDDlyAYR0ETaRz2r1vagAZfEfNWxIg79+o+Vr+v5M0ECIVKQuRX4ziYtqNWLV+C157RgdMUncpz61s8TlDpgvAcmOQhOzbYG8VR8smRDLLCS/eu5oM0dx4IlD4uVjiwiWUh5YO+rovXmD5jkeDZ+sHZMIzWk/k16+LY92xiGskhk2snA9MHOe2pt4BGZBX3b01bswSO8VMrFgiKOX2XElvX5URPygYgvUWAqotQCu8I3VguhwPq927R+wT4bkfuHxXnIJaxndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avlH7/vHIF8/jEKa4bMiJ+1WqK3wvrYKHnTbp1Pn1L0=;
 b=lqiCS99oZpUWArpwYrjngBEpCMVztWKvo+NwR3XpALOsdy5UfNklQUWc67gNzdrMbpXosbgoeJqgGvg3+DqtZkQDPZHcoqc0EYPOdyju2sEFIwcc6XqpM+EKV4W4Ac1jFPe9hnUGWJ0cX0XF29bF9bXGy5KAf4Lh9nh4amhbGQM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 13/25] xen/domctl: wrap around XEN_DOMCTL_getvcpucontext
Date: Sun, 3 Aug 2025 17:47:26 +0800
Message-ID: <20250803094738.3625269-14-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 1539411b-88c7-470b-73ce-08ddd272ee86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eRMmRprW07VtdnfcUc6KeekzyP+KscAEVtZiP3/t+3DdU+SAHbsm6NkLLZbz?=
 =?us-ascii?Q?C7odjFtnA7/TeWIbR+NiwGw9Ziv+riCUC5Zf5VHRU/7/uzQM4SpyeBBZyDET?=
 =?us-ascii?Q?mSnVkxgC89b1Kjpl65G+Lll361QpeCh6KuV1nzG4Vf3O2Q6mu1YHtpwPrfBx?=
 =?us-ascii?Q?Ab/DrKhHCpi95x49LwgyFT6hf08AEG+THBImOsSwyLtKOSaLpjaTUvg4d/up?=
 =?us-ascii?Q?pnXxvHVlmlxFymsSVnc9PQIyzrJ/ZvR7lxsXWch6FM3wz+GVJaxfx+9NqYUH?=
 =?us-ascii?Q?HWA7u8ZE21SV4V2BlWJAkzdmDAUg9hU7dcJ7FNlhf0rbCDGRxpmnk62oIP5l?=
 =?us-ascii?Q?UU2P1vnuSkFBSJkj5fAADv/Oxbx801Q72VRzxICCRYHF1iZqXp+J8WZh/NIQ?=
 =?us-ascii?Q?2N20LMf2D4wPqYUrVb+DpLJtqaM8L+CIMFj5JTwKqvZ9ACFIbHYyVxfx2iCU?=
 =?us-ascii?Q?pMVqbXEuZwjV/pIek5T1PR+OrbJQrghWLbV4Al8W5vEip08GP0ut+R0PGvAL?=
 =?us-ascii?Q?AU2Ko7UTsU0xF/O/2pAB/HjyM14WpAl5q6wChuJsGRsDx/6AYFAh6PHGNZ86?=
 =?us-ascii?Q?+APaDGDzLZWjPgzvTWr5/NII4HJoLFcN2jN4H7jUnL7qhQGnXIAQtncoDCUb?=
 =?us-ascii?Q?YV/fK8fj0WreR/VBjr9NDGyelCDlEINKQgmVBjTgz2DUF/BAzHH3PcqyOvrs?=
 =?us-ascii?Q?aaBqw27rZ1oURSUuebSh5i/rVNpmiEnjIF/B+NHZaIw9mr3FG0gj/e+/zYvc?=
 =?us-ascii?Q?2Q6OLI413uSgXaL4eBpzslO/labpbJG03c0EfRPF2h3js8diw/4fEQMzZk35?=
 =?us-ascii?Q?Awagv0bD6wykU1ZJAdrnOKYHbz1JeLX8JAnBLlAjmMUAgWg9m0EZzOGGGAo9?=
 =?us-ascii?Q?slXa3TdO39mWmKyDypojJhcegBnkkDF2ttCUvLCmMV7Io8ZULTkcoPM/UTTH?=
 =?us-ascii?Q?Fkp5DBpSeb2HtbutjomOcIfMZKBBzdsWBymvF0SZX+EVhLeJBkc01yoeNT9I?=
 =?us-ascii?Q?0yyYz92vUGx1wUksXpFTSH3le1pbmzjy/kjaldk3Aay8B77rbf8eojpygJOL?=
 =?us-ascii?Q?03HQwn+nQ3FEFBn5Ltahj1nvWhreiZfsoLSd24804bO3/gd+SiV4K/3B3Ap6?=
 =?us-ascii?Q?Jn7NXn7iB+5BmBpLmZvRnyVxtlzcKTIa8QbGBINX2TSkiVf4vAdGbOLIf6Tr?=
 =?us-ascii?Q?BMPyMJa6eeEL7RfdjYu2SrrYwrG3E6tfS4aFEJUtVd8MQk6CipFakRlbLNb8?=
 =?us-ascii?Q?oGhjwfcpKmK8uEOK42d06kRhMHm5q7gXTKnMG7RbYvoCLUR6IM+CGJLOfO9K?=
 =?us-ascii?Q?BY4vXfjnfRzWyivngIxoYRv8zcsceQ8ldEYuz28VDapdpWstZ0MVqX7ffZP0?=
 =?us-ascii?Q?teZekr1A0Pw+G+IB4GhW5dvb/83NG/DawcUesIJ/6yCAOuVQpBBKASMYjSMS?=
 =?us-ascii?Q?Ics1PE2fMltvXxFNHn9+durEYbaiYaaVLjRipks6+a9izN5zryeDRpd0sv/y?=
 =?us-ascii?Q?5qsln87OkT4Y4Tu65LF2Xlvcv7Jfu23D4jod?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:42.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539411b-88c7-470b-73ce-08ddd272ee86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369

Arch-specific function arch_get_info_guest() is responsible for
XEN_DOMCTL_getvcpucontext domctl-op, and shall be wrapped

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/domctl.c | 2 ++
 xen/arch/x86/domctl.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad914c915f..d508ee2880 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -184,6 +184,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
     }
 }
 
+#ifdef CONFIG_DOMCTL
 void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     struct vcpu_guest_context *ctxt = c.nat;
@@ -199,6 +200,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     if ( !test_bit(_VPF_down, &v->pause_flags) )
         ctxt->flags |= VGCF_online;
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 156c74e07a..29f9db89a1 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1367,6 +1367,7 @@ long arch_do_domctl(
     return ret;
 }
 
+#ifdef CONFIG_DOMCTL
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
@@ -1525,6 +1526,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     c(vm_assist = d->vm_assist);
 #undef c
 }
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Local variables:
-- 
2.34.1


