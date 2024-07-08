Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D414D929DF7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 10:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755134.1163388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQjOd-0000cS-5N; Mon, 08 Jul 2024 08:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755134.1163388; Mon, 08 Jul 2024 08:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQjOc-0000Zz-VG; Mon, 08 Jul 2024 08:06:50 +0000
Received: by outflank-mailman (input) for mailman id 755134;
 Mon, 08 Jul 2024 08:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQjOb-0000IK-8A
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 08:06:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfe3614a-3d00-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 10:05:18 +0200 (CEST)
Received: from CY5PR15CA0109.namprd15.prod.outlook.com (2603:10b6:930:7::14)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 08:05:14 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:7:cafe::61) by CY5PR15CA0109.outlook.office365.com
 (2603:10b6:930:7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 08:05:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 08:05:14 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 03:05:09 -0500
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
X-Inumbo-ID: cfe3614a-3d00-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vhp9a6kUBXdin96p8c8sVnGQMURpHco1/TWZuB9biUOGp8kR4Sb5tiVzZ7RTPU9GG5sHB2VHY/jDRQ+0VkMhNLKHRzo8EfvErC7vqIejUpELk041Aya+79ABH7g3ETRagdBd/hjcgAJPAwt/hWcMR2MeEG4zPVTU6XL54ZhwyDRei4bdbjX1Or0s0eby/OP8QBOVfWSHDF0DAP1evyD1cj6Dkem1gkh4w3wuapzNy5JP6UWaGYVGKZlW4TtncLID8chbCyVl4Km+y0/8+qSl8oGM6TyAk6rWvq0Sw59JC6pyaiwvUCoNrq0XvAuizZRNhKhxZDO2L/QemDjynHWDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHdGyPwdZzpTLwihyTmeTsp1sAiOoMkd/UMlFggw7b8=;
 b=E/Umm9qAiwRf7LPpYfPkjLxdEI8IcrH1yQ5yA1Fa+ERL4pkOMwdC/zNYP2WuYTH4cgQw5BK6/3f+hW9iY6so+RGQys/WpK+dXcWLijcCeqXfMFHLvyOrikhWpjgfd8gcI4pDnQk1lokD1welmI6uTXTpFTsgMbrtEnTT9pqhTaedDGbPJp8O8OBibB9MyEuRV/Dvl/pScXu1w8+n03dEzVp5HwSybftwwflpoogey05X8WoJ2o9xhaD0d7EGzZC8RE9Pol3RjDWcr3R/6qp1UrlzBukZeQoWwWWZdZpp1bkjP+YUlI59QMMSrImoQ4KG+XppJt8YFJwTajSZYb5w5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHdGyPwdZzpTLwihyTmeTsp1sAiOoMkd/UMlFggw7b8=;
 b=ieBkMdMSOXW2PT38VgXAExHN14xejVpBBVjxr4e8jsmXYzpEzCXDnvYSReEXFtMYwhvaI15Nk5bE2ZLRkf2PWbWW2i2e3EGAm5n9bAdBAONKlgro2rKMrvmvkYKMGOmYHCWsslmAx3ARmO3Whhkx2ZVrHV/GxbdV/Pig0IK5liQ=
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
	<roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Jiqian Chen" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH for-4.19 v2] x86/physdev: Return pirq that irq was already mapped to
Date: Mon, 8 Jul 2024 16:04:56 +0800
Message-ID: <20240708080456.401764-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|PH7PR12MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 142f9d9f-77bd-4ef3-0e88-08dc9f24b2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iL44YbgYZ4czpFw6Rzk38hR/JXPzVtsockRUq9MLRrKsThzUWn8RfdPb8MIz?=
 =?us-ascii?Q?1IPPK89+o0Yiw65EwwkeHuyA6uG7Qp3gGTrQJmXI65fromXmA84elguguzwR?=
 =?us-ascii?Q?t3XF7O81bsYOPPcNE2HzG9AabtNgM3Wjf34wWZZVIJYQ0pdPJEeQD29P8sb0?=
 =?us-ascii?Q?Zcv3AND+WaM6oykZO3qour9+7Lodzlr/fm1Xx17hZ65Bk5lmMFtIYxoa+ohX?=
 =?us-ascii?Q?YPtvVGedLDSiDBznv/kzSogHakV3U5pIgSP+rPVQBb7J+R0TPh3ZHd4UEs4+?=
 =?us-ascii?Q?rp09uCWvGLxbykXpTPaVDT55iqbu0/ePG+++69CE8hrkJvznkhJlG7hwnPS+?=
 =?us-ascii?Q?ZIv1Nge3AVPCef5vRstsn6+z8HplzTXTWr4vRbAlpucINursEtIbD5tTn7b3?=
 =?us-ascii?Q?Nii8mp9Gdm6sIcMVebnSm97H9ywjIMnMhmADhTLh+sFqQt8IQ+bqSjI7Wq1B?=
 =?us-ascii?Q?3yhWhcOxiAKB2t3CQxf/5P99dLTY9lacD21g0uh4XpuEYU9AByWztAcn2rlG?=
 =?us-ascii?Q?9AQplwVGAYaZnDAI6e8edjg9uCfSfQmk3pF9UkDNOan6smXGVpVg1aAfHEXx?=
 =?us-ascii?Q?Lc1SPBYyeRgqvD4MyHHRjdwupwLsMdY1wwtlQAwn85X6FjscAT6vbTM5ph1L?=
 =?us-ascii?Q?9xkemTbkjy7/SlB1Y5KuV+GvGV4wEKkN0r73UpZU9krtT3F6KdkSeocgKL0I?=
 =?us-ascii?Q?1fPlVWDIkFQoKV52lomkEOVKDdhLqZy2jQO769jJ62X9qd2WmlGC2qc0oedF?=
 =?us-ascii?Q?RLGZUx7C9ucUjFhrtmzWEFjgKJDr057SxoffGngwOZ+aN1VNjvabKpKq5KFZ?=
 =?us-ascii?Q?3oOXIgKftKGVTV0qsoI/RsnFB5CoBNG38f65JHMJqSQ5RQfPL7O4gmMq0a55?=
 =?us-ascii?Q?SvbrvSUmQnjCCYfClpg0Qob8h1+KL+KQp+0hjXg2woueaQWRgFgXrs5Ju7ln?=
 =?us-ascii?Q?26aEvPA5WTWEiZI0/IQUqD4yU8t3cjUWhpw/VN+EpH+MSutRxfw1ooMl7Di7?=
 =?us-ascii?Q?duBE1biuxocZ2NHnZyykpJd2nNEomyQX06awjfY79Xyr+hY9slpewlfh4RRy?=
 =?us-ascii?Q?RtIIoqdrmQJ2G2k4QmogcXG8QTMh88CLFW8QYF8xkf8gdMLhOXFNvP9Xj3Ob?=
 =?us-ascii?Q?iq2LzSGUud7Tx0XgkS8Ia9QekUWGSItn3D5ph61BcovSiXWEwBQuuhgbKhZM?=
 =?us-ascii?Q?WzSn8+FYxAYJc6kawY6hs3LwEH29TpM/tIGiUxBjv7f+3B7vFQ3gM8WXirds?=
 =?us-ascii?Q?qakUAOlrc5LuE8Rh8OEsX8E68aElWjQQt28BYAN4RPVtEO5VSv6RqOgLqLSR?=
 =?us-ascii?Q?rG2j9HJUlNL75PlSjU6yR+IRD5WtV5vNpvY5JCyFRm81/llu+SSIjf+xSq8O?=
 =?us-ascii?Q?OcKF99uaJIAuVlLw5KhOzTglOdEAvy5iWKcnlz2i/peh7XOfkCrX8Zt1prl9?=
 =?us-ascii?Q?AW4DG2JfZMZsX7IGlnthXMzfq/0TnYBm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 08:05:14.3318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 142f9d9f-77bd-4ef3-0e88-08dc9f24b2a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126

Fix bug introduced by 0762e2502f1f ("x86/physdev: factor out the code to allocate and
map a pirq"). After that re-factoring, when pirq<0 and current_pirq>0, it means
caller want to allocate a free pirq for irq but irq already has a mapped pirq, then
it returns the negative pirq, so it fails. However, the logic before that
re-factoring is different, it should return the current_pirq that irq was already
mapped to and make the call success.

Fixes: 0762e2502f1f ("x86/physdev: factor out the code to allocate and map a pirq")

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 017a94e31155..47477d88171b 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2898,6 +2898,7 @@ static int allocate_pirq(struct domain *d, int index, int pirq, int irq,
                     d->domain_id, index, pirq, current_pirq);
             if ( current_pirq < 0 )
                 return -EBUSY;
+            pirq = current_pirq;
         }
         else if ( type == MAP_PIRQ_TYPE_MULTI_MSI )
         {
-- 
2.34.1


