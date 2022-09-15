Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848E5B92B1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 04:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407201.649619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYejd-0006F0-AC; Thu, 15 Sep 2022 02:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407201.649619; Thu, 15 Sep 2022 02:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYejd-0006Bd-5L; Thu, 15 Sep 2022 02:36:13 +0000
Received: by outflank-mailman (input) for mailman id 407201;
 Thu, 15 Sep 2022 02:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sVNj=ZS=amd.com=Ruili.Ji@srs-se1.protection.inumbo.net>)
 id 1oYeja-0006BX-Lu
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 02:36:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 269451ba-349f-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 04:36:08 +0200 (CEST)
Received: from MW4PR03CA0210.namprd03.prod.outlook.com (2603:10b6:303:b8::35)
 by DS7PR12MB5909.namprd12.prod.outlook.com (2603:10b6:8:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 02:36:04 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::8e) by MW4PR03CA0210.outlook.office365.com
 (2603:10b6:303:b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 02:36:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 02:36:04 +0000
Received: from rl2-Majolica-RN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 21:36:00 -0500
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
X-Inumbo-ID: 269451ba-349f-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIHyF6hJUEnA596NSw1ntCkU/Gh7T27HDBU9BogeNWTgKazjfLzqZa+gM+U0h7tdOSfMOSVtoqIP3iwYAuwZ8veIdoUA4StXWSxFqJkhL5QhJWkZufIELa2PCDqpuO1OMgFCXAJGjo+9myTROJhhzB7KYgJuwib8sG/mUdpM5LrEmZFBsHSPsYhVTMSuzcn2lmEfzQ5KqTFRd9ZY5n6I8WBkipbDSMPlSUcHnxNsPjpYwcHqPMw1jWBz/MYD0cPfOEgVNSutii4+AN4w3AHD4jfMV5nakuE6qKUUkUa+AVwvCllfL5uLM+YNI6OUTd2pYkhPi0LvUqJ9nksmbVuzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqyNMlb7/J0y1BadjEuQqbqAf+4dxOWDN7lqZDyDBck=;
 b=lfBpeLzq6xBsSYl6Vw50ok8Roa/3ZKaQspgMmrdbNFAeiXLKUv739SvUEbk/I1/kAOGt6c0EGmRFAvHbl651MvqbcG7nuZGw+Z6Hs2ZP/qavBHolH8kAK28x0N8NveQLswcprIiH9fJ22y9d6Ek6yon4ViuvuYlgCp9NwCGDqpZEfC/vTP02E4rJImM02dAtIur66LO8E62xis2dCK8f9v8NjHOuvp69lERYn0/fH325OeCfUtT5Hf70PR9UoyWCVSycLqo/C1oPifqk80Nm4Y02ZZNB5ZOWW06DZMfpG3aLERqn8lXxc8qwQz8fPXl6e24ARiUSn9aiV1UZpP0tJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqyNMlb7/J0y1BadjEuQqbqAf+4dxOWDN7lqZDyDBck=;
 b=D3fhDZpOsEHNlOxS0Dp78oT1TL7CZ/5w4q9voidqQhdknoP1nKE5Aiysp60aMpdbUoeLUSjPsqe0FgdkM9GosElu31uzuIjQfm1Dh9XWiKITEeMs9gJPkChT4Ur3Aj6AK30GVn8869k10v0uRZ9bUcaNyBKL79AOS3jNBB0oVr4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: "Ji, Ruili" <ruili.ji@amd.com>
To: <xadimgnik@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Ruili Ji <ruili.ji@amd.com>, Paul Durrant <paul@xen.org>,
	<Aaron.Liu@amd.com>
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
Date: Thu, 15 Sep 2022 10:35:41 +0800
Message-ID: <20220915023541.5326-1-ruili.ji@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|DS7PR12MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cffd5a-e76c-4989-6194-08da96c30960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PBbiucyYkdgTlf3SmPjtqKXsn6gd0Z03M0h+RMPHCNdNPOyaCIsomW8JfVEDkUDzyxHYAuVhbaZTOYIAFZuPUVXtsIY4jFyfsYlOezcZsaw/qZpoPElYZUH7YqhhSlyvaUk+M6/eAl/xRewKeeSqnhvUE/8zTCuAs2/HMf8wr1DwPfeUIIS1/bxbEtonf3s0jnv11qdIDkPGrhWW4KS6O8rSdvF2ybHJBo8p5f3Ozef0AEujWM0KIKMueoLRFfEhxum5Xsp59xDA9dCboCQV1gOAwhu4fz3EQlele+FXeI0N8nYPX/c8kBm24+NzwqM7vR4vYom35eOIXSyNGAyVl9thSS7i8FTLwD7yI1PVHzcdmRTbf8+gYezJpSxABkPY2Vi8A7RrkkwV4Ju4qGYmwwKdE6Oc28nAIKdkfvMHFEDJH+NcEJlm3D+PtlOmOTUFImKolMKuwgWqFLH32GKXuTlByNDNmH9+ehEPPd++3DX04yr65EKqGeKmltpkViSf5pGZ1k40ZDxRNiCV8DG+NBW8dkUImN1JFFIkh7S8j+Wa0NLT2r0JNjdXJnglua3qTeI7DRUmjtDAUOU6DLkB+wQxrG1xV0yBkHzdKdYk36R/f40KgdZdb+O3fSw5Y8ndclArUuwlJGzrvXxnTE+h3CCkoAaejMVx+PooUekW7YWPQ/Chveyj16nD6mADgltof0myKthTj74HUSfJGmoHS2lbkchyUYpjM0P21Xn5SZfiNosJys/bNtk/+QrtK1QkqUcy67oGHtOkxo1UnDahx9WiG9WehND8nJm40ph82z8DiySbw8KE0sBXH5dcS4EGLxDLijl9bc1YE+CjTafa4FyEMYSKRo7Z63E5Yvjan8c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(83380400001)(8676002)(110136005)(316002)(8936002)(86362001)(70206006)(70586007)(4326008)(16526019)(426003)(47076005)(36860700001)(2616005)(40460700003)(966005)(6666004)(7696005)(54906003)(41300700001)(478600001)(81166007)(336012)(356005)(26005)(186003)(82740400003)(40480700001)(1076003)(2906002)(5660300002)(36756003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 02:36:04.4572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cffd5a-e76c-4989-6194-08da96c30960
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5909

From: Ruili Ji <ruili.ji@amd.com>

Make guest os access pci device control 2 reg for passthrough device
as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
/* reg read only field mask (ON:RO/ROS, OFF:other) */
uint32_t ro_mask;
/* reg emulate field mask (ON:emu, OFF:passthrough) */
uint32_t emu_mask;

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: Aaron.Liu@amd.com
Signed-off-by: ruili.ji@amd.com
---
 hw/xen/xen_pt_config_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..adc565a00a 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .offset     = 0x28,
         .size       = 2,
         .init_val   = 0x0000,
-        .ro_mask    = 0xFFE0,
-        .emu_mask   = 0xFFFF,
+        .ro_mask    = 0xFFA0,
+        .emu_mask   = 0xFFBF,
         .init       = xen_pt_devctrl2_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
-- 
2.34.1


