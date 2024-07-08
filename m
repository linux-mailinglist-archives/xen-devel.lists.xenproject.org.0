Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A480929C24
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 08:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755006.1163259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQhpO-0007Mn-RX; Mon, 08 Jul 2024 06:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755006.1163259; Mon, 08 Jul 2024 06:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQhpO-0007Kp-Or; Mon, 08 Jul 2024 06:26:22 +0000
Received: by outflank-mailman (input) for mailman id 755006;
 Mon, 08 Jul 2024 06:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQhpM-0007Kj-KF
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 06:26:20 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa9c45d6-3cf2-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 08:26:16 +0200 (CEST)
Received: from SA0PR11CA0144.namprd11.prod.outlook.com (2603:10b6:806:131::29)
 by MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 06:26:12 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::5c) by SA0PR11CA0144.outlook.office365.com
 (2603:10b6:806:131::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Mon, 8 Jul 2024 06:26:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 06:26:11 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 01:26:09 -0500
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
X-Inumbo-ID: fa9c45d6-3cf2-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsfo8dPeKnFft4b0tFK/ZgN1P6Q8tDAQKwakGgK+z5Zb1RR50fjL4qYNCIAnWz2SQC2tOsxeQsSZEfh8q83ttA+UloQo4YV/silIEBzP0hhjNLpx8YupA1dUnufiOtktyG1Ut65NBJNsHe9T1neGUoeStYqkOb1aHU1cNcgMKDP3fDChpPSOEAMGjW6F/VbKcxhV+TpbQnKXTiFmOobnCN2OZlCTizhcaz76/7PONU6rRIB/dpNvgTaNA2yv1kCFI5E0TnjXdQK1an/IlpvE05iorHNVxtD4g14dUV+BQRlLsFrBP2K7XLp5g82Jx9XJyMRiMP4/mRdx2L6KcJCcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tohzRVqTI0hSAsmX0f+iY/yn1JVZZtLAdvD2aQ6XSg=;
 b=So6GeBiX6wmDg+KTQZ17PpWOVmOQDxOFsIRgSqfYsoVZd99OUeDdoUme3m0ZmrB8tPK2bX0cKtP2V6hgbYvHoCjvyuNiO06xK+Va4Gl+v+WdZD0Uk+75U8T8XKD83HyDYvF+lQ+zfsn+Njwgi21JaEn4UgAXnP0YRM4CKBcmg0NDLjfSQS6wL2ktvipaxAOcxyHVC5Cwqa1ts3SldlE/+9Brni0EAgAxqqrX9arTesZRa8AWgEl4WmDWS8wRO+4zFq1fAdZBH5Hiid0HjzNeJydd4BHri+QCAHJja1dz4qqVk4SIVeheIcMfU5u9piUAUfmW2gsjcuVB79Sed5Wn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tohzRVqTI0hSAsmX0f+iY/yn1JVZZtLAdvD2aQ6XSg=;
 b=GPyyScZwIUFv4tj0FztLsUCYp1fmb4hnzNa0maz1IXLo1VdA/qUcdegHNqT86f9TFcI/FWKoJxp+ZkUk4Diw92fmY5L/EHbJEXSNLvu4uAPj+UyTYTEbJTgQkZCs97g+iuTKu12dZnC6jzF4AtKKSH2Jk1PJ31MjMF4fbDjzXIU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, "Huang
 Rui" <Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [PATCH for-4.19] x86/physdev: Return pirq that irq was already mapped to
Date: Mon, 8 Jul 2024 14:25:54 +0800
Message-ID: <20240708062554.399784-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|MW4PR12MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bdd9a74-8340-4c28-cb24-08dc9f16dcae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9OQ3HLlDa8gGWh5c/+ieer2X4oXHq9Vd8K0w33DqArjQe2Ym5OhJbi/JkyB0?=
 =?us-ascii?Q?M5pZKNpa8F4+IUus9kLIsiK9aMWIxjinGG/RzWOh7PzKcgJm9ndvVRwCu787?=
 =?us-ascii?Q?mKDplgl1yxvvi58mvvIDiZ1axMxvNKMRzZDIrS2nTI8Twr2pDx0hBsLGp9hA?=
 =?us-ascii?Q?P37bdNTsgJjOXopT1GV3/6+eLt1jDU0vY6+W92xiZk3QmwJKOUi6PFQv6bWa?=
 =?us-ascii?Q?ghNveQ/xZJYr0ynUm0V9D6LfQ+ndsigi/frqHpVyBH/3vRgu6z7Dqfc0/hiV?=
 =?us-ascii?Q?GOeEasqmEBbKi39mblZsU2b4AXUrEMy/stLm2bO27gevNfGLBB/sBb/sCgy6?=
 =?us-ascii?Q?10lVpPuV0riCRzNTJpfN9BGb1aj+CRYwf1I18wwEgk1b7/Qan23cgrchVl3u?=
 =?us-ascii?Q?G/5uUEUipo8tmSCRn1IAz4MK/sRmdtaGx2+ZG4mAv72tn8KFJ95XEjqwCtLb?=
 =?us-ascii?Q?husVVxkJpeNULd6q1OtAykDvAfKSFAZFTom08TvfHspt1lr9IG2BFAMmfhD2?=
 =?us-ascii?Q?mnN+Q7TS/FrsqX+yWOOpBUxMJ8W8oiV99zsL5+09mBLirxzv1MenKGVcbwtS?=
 =?us-ascii?Q?7pL6eBUf6JuFqSe8mW1Ih9e9DmfqAwQOqIty3Mwl9qE2InvzlycGkHuuYk8c?=
 =?us-ascii?Q?gFOoFUxPY8ppzzoS/Us2TgkC9rtdggSIsYjGlfYm9bFQLbfR2b7QmfvCkJC2?=
 =?us-ascii?Q?9QSZ+HZ5rW/dgcGS+Qg8B1YWbW61WSRvO38qgu83BoBF5Z2Wtck1F+2663uY?=
 =?us-ascii?Q?1pvASkKRUX4ov5a8btwkHQFLnDug6Y5fFPS+sa5m8K8I0wCBGNmFwHlzYrB5?=
 =?us-ascii?Q?cBrDesRmVIdkToMDEtzdGn4Cyc7rmHxXz5ZiymKuYIxJL657pD8bBKm9E/1h?=
 =?us-ascii?Q?MYm2RE8P0d9uEvn13eclav+rs6rkOGSgR0bVgJzJcqVvW84Aqns0LxCRABoM?=
 =?us-ascii?Q?6sQgy+M5p1TBvdj5yDXx2OGTu6VFchxPPC+MGgAQ6pcMIdPrlD+OiZ9Xey9C?=
 =?us-ascii?Q?eJ9U2q78InSGQ+fZadgRHPhatTwlZfK90RX1tV80HmlT+yP1+v0yiS0gCrTJ?=
 =?us-ascii?Q?I0XptyRPYRrwSn3YHzplDafJ0CZ8/oiVTrUNzMNoixx5PLn3qAOAEx2AtgSM?=
 =?us-ascii?Q?5fUY3wWBjVUqp0NvzXmpJhPRNSniV8np1PBnE+IwUsFXxBurWjuC6Ko5U24p?=
 =?us-ascii?Q?8RdRJ1waWOP45j1psLD6O/rQNE7kuI7HPwO7iqu56E9MX8Qk/84TcEuMXlhC?=
 =?us-ascii?Q?SfQ4HHKRjaqJFDDffgt2LJk75iZjZzdkr5IVCxKwEM7Y1+WQHsY9kbUNRrji?=
 =?us-ascii?Q?fLD3lquKXDCjnht1hSWUvNIPdcko0lsvJGKOMEoYpx9GV6OGWu3tHXzkjkEj?=
 =?us-ascii?Q?Z+GQR2XHJuEnKCsBtaB8WcVLmkeOJvPIEWN1qYJsWlGF/whsXN010qKiygym?=
 =?us-ascii?Q?MrmOa9g0A3+e/w9jItczGqVMXWDXehuG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 06:26:11.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdd9a74-8340-4c28-cb24-08dc9f16dcae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8610

Fix bug imported by 0762e2502f1f ("x86/physdev: factor out the code to allocate and
map a pirq"). After that re-factoring, when pirq<0 and current_pirq>0, it means
caller want to allocate a free pirq for irq but irq already has a mapped pirq, then
it returns the negative pirq, so it fails. However, the logic before that
re-factoring is different, it should return the current_pirq that irq was already
mapped to and make the call success.

Fixes: 0762e2502f1f ("x86/physdev: factor out the code to allocate and map a pirq")

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 9a611c79e024..1a827ccc8498 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2897,6 +2897,7 @@ static int allocate_pirq(struct domain *d, int index, int pirq, int irq,
                     d->domain_id, index, pirq, current_pirq);
             if ( current_pirq < 0 )
                 return -EBUSY;
+            pirq = current_pirq;
         }
         else if ( type == MAP_PIRQ_TYPE_MULTI_MSI )
         {
-- 
2.34.1


