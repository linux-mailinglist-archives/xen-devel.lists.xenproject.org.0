Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BEB7F71D1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640467.998775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdi-0005Rm-Tj; Fri, 24 Nov 2023 10:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640467.998775; Fri, 24 Nov 2023 10:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdi-0005PJ-Qh; Fri, 24 Nov 2023 10:42:26 +0000
Received: by outflank-mailman (input) for mailman id 640467;
 Fri, 24 Nov 2023 10:42:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibx+=HF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r6Tdh-00044J-Kc
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:42:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26ce204a-8ab6-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:42:25 +0100 (CET)
Received: from DM6PR07CA0054.namprd07.prod.outlook.com (2603:10b6:5:74::31) by
 MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 10:42:19 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:74:cafe::f4) by DM6PR07CA0054.outlook.office365.com
 (2603:10b6:5:74::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Fri, 24 Nov 2023 10:42:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Fri, 24 Nov 2023 10:42:19 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 04:42:04 -0600
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
X-Inumbo-ID: 26ce204a-8ab6-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGaOgSwxxQm/or+BI44ULByzxJAk5Eh4iExtCJfkqzUmYig+o7ynzicPK0Jw2ECQPuaYIr9Ftj2qr8AiCrQCCWmoRdizaptNlaj6KzYbKxhVYLHrCVrQpeIpQY/MGyx8bcO+Oml9iRmj+CAx+sTpFY8khPsFh3V0aLJtgIF7HM1qF1zgouPaUE2pE9Hl7I2Wzi93mzeHPCUy36mPEzqzlLszQKcFK5R4xnSk/h9nWvjHcOX7OeStJxy1/mOwArOy03Y/1KbVv26Moz0QH8QadhYhr+pg8zDc1D65hn3N91dXYpnox5TAo4qg98b40h066kCnMnRCv1JJ5reiMS8wdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9hbAL4FWPfGgAGtUKX3DPgojoAEwTsd0FUOkaqhexU=;
 b=WrZ4QFP0FhJ0RvwmJ6BsmegM9C1TJ3wR8hNUiuzhru+fSfpIqlmVZdNHEmnzk2VfVIqYGlCRJVpdMP81jac282iyMXToQtqPrUaGV9uRtL/2q485lI5gai2HxmUWt9rQf2d4kKWATEHGQjZb2enISkbBrGnRcPPasU+/5aKZPQIGaHMa8ypxyrrHmAiBcappEx4+qfTR1oracvx7cUBFtjxURdUZAQB8rUZZDIHDLMcMgKYnXBbk+UVI9qEfR1QlFOJbbew8KYrTig42b8bzlX/PaMn6MhGv9YwGt9BsG7DY5lmf+3M3hdKHgPlt419zaZ6kOPMw9bpfjrRIdisGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9hbAL4FWPfGgAGtUKX3DPgojoAEwTsd0FUOkaqhexU=;
 b=Eqo7CNbaVgLsXxohpg3xuDxQd1Lw+fdLmZqgPT80naBcxa2Yq89DO31L/Jr0uhQeSobD6AmCMryBPQfMll6OR5JhWbU4IWRnIqr1ZKzAbjYNOKarL94BvX/MXMTDtQ+YCaYyQRLIpFz2Qc4Fbv0mlKU9imGX3MDytE89p6+Nais=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Alex Deucher
	<Alexander.Deucher@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Honglei Huang <Honglei1.Huang@amd.com>, Julia Zhang
	<Julia.Zhang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH dom0
Date: Fri, 24 Nov 2023 18:41:35 +0800
Message-ID: <20231124104136.3263722-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6690d394-d83f-4179-5f91-08dbecda08b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRQJ47bDpkfGWdU+d13CEBGmsBd3430lptsrbg7tqpfekFzbFEV4F9QmJOMNiEfA9vwdmyj5IpYI2eVjn3+uaQS3WxNAHI2fjzf70IG428TwjVBJZ7JQXHsoRENXYx8gP1ZjJkgh5Eoo2JdFjM64UUNtnOpfwZLzO5ohpfNO8XgeoB/MU/AOWJ1nKat9OZbI0o3QROx+eL51HGhhe9YocWPLRNZDdbi2oKySJr2Jq3w3QriWb+8QgwZLiyxSDM+lD5pGZXP+gQTa3N34ruqfPIqAWPyAeCf21q99O8lWfJUIPxxSWnM7ITg2ipbu/iOEQ+k70Ykvuqdz0ZYJNVfGh8lT5/DcR4rsgaaWXz3gB3jHIx67YIzDYfKPBvHCy3q0ZyT6XqUh1sckciWBKrcFklCOz0COsKIEGN87r2toFRurddANPBNqp1/2ne6ZUqGdAFVeqgHeDOOtS2NEJAei4NvHQ8q5jRgqaveQ4Cx2SyOZmUYBl0YLPN0WOXMm8+m/L+CxtEuFMFR0o2lShkcsXqYKmh6/5we90oNMDjmEExD4pACDoMCn5hjQCITGMAxQ91lGZVrTjrITVRppN/eCNWqy6hDzahHscrvKN73Dvxj/i+qE46sBoBmkeR8gQzNFL/hCtMAJ5ZxaouXL0LgHGkrBS96xPE4QP9RWQREz6H82cYSndnVcIwY59t4gFxVPlZ8d2QCy38F7RCLQQap/PaMRmWT7kOWIb9Zma4YVQiuBIiSMb/7TsYsGQslB1s1yCqPjlCEHj5X+6WSA6OEK8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(316002)(70206006)(70586007)(54906003)(110136005)(40460700003)(82740400003)(2906002)(5660300002)(36756003)(356005)(81166007)(8676002)(8936002)(4326008)(26005)(16526019)(7696005)(86362001)(36860700001)(6666004)(336012)(426003)(1076003)(41300700001)(47076005)(478600001)(2616005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 10:42:19.5027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6690d394-d83f-4179-5f91-08dbecda08b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254

If we run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see xen_pt_realize->xc_physdev_map_pirq
and pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq will
call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq is not allowed
because currd is PVH dom0 and PVH has no X86_EMU_USE_PIRQ flag, it will
fail at has_pirq check.

So, I think we may need to allow PHYSDEVOP_map_pirq when currd is dom0 (at
present dom0 is PVH).

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6ad5b4d5f1..f9c4a2243a 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        if (is_hardware_domain(currd))
+            break;
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


