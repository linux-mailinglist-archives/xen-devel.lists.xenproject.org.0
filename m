Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD16B63C2
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508867.783789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYY-0004Lx-WF; Sun, 12 Mar 2023 07:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508867.783789; Sun, 12 Mar 2023 07:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYY-0004I2-R4; Sun, 12 Mar 2023 07:55:50 +0000
Received: by outflank-mailman (input) for mailman id 508867;
 Sun, 12 Mar 2023 07:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYW-0002sM-QX
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e89::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c2c0786-c0ab-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 08:55:48 +0100 (CET)
Received: from MW4PR04CA0079.namprd04.prod.outlook.com (2603:10b6:303:6b::24)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 07:55:44 +0000
Received: from CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::d8) by MW4PR04CA0079.outlook.office365.com
 (2603:10b6:303:6b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT092.mail.protection.outlook.com (10.13.175.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 07:55:44 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:40 -0600
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
X-Inumbo-ID: 4c2c0786-c0ab-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6od8Ui+8rvQqhsi13zA+X91t8sSne8C6Xqcl5Vi8Ac8Irm6fqaj+YavusP0Q5BF3DfFjRtKaISMJZ72SSre89AwzksVmfitwZRWaCxBO8Cc8sT+fchU0mKxhKxrQEXqmzznLLo5L4ATGQ/Weda8QPVqwiporZTqArpXETcptUdG9i5O09F2d9PYBhruRMo7ZDaD7Xsacxjbq1Kj6U6YWYN4lqCt8214NoANu16TScELTJgdx/dJoaMX55RrYUUjLh7pY6rqlg+2LcQ/scNhYZGcRHSS3bPjmGTjCyG1FArYd7tmfut+qT+n4ecKtJYPYtc1p/2LGinZOlne7EXEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvCxL42WhJeLNFutCnPoClf571Zr2l7PD0WD0zKoqR4=;
 b=DbuNGNdmxAVLa5dBFenuNGRSMQuq8VF0W6LFYCNlrR0TL4var87e/XioH5grLMf/V/mNfRhQ8NT/Bnqt3k4BbzvxxRYel7caM1dhV765hqpXtLSKGV3B1X4uDrNI73dkLTaI4fKc9tmrRuMZ6RMd2NPjhsnTmtBi83HrK+ApmsjTaHLd+5Tu7jOo0EZcWy4cOXUJoi1W31Or1ix3BeDunRaIcmlsaU3UidJZLaleeZFiIaCZ8AzC/gF6nOO2zxpqFl1c4ADcnTjQWsV6i7qXbX4KlxgBjZmD2YEiJq0Dpny2k9oKfNl0K7euZg4RMLRvAPXnAIGx1Ee20Ne73zKhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvCxL42WhJeLNFutCnPoClf571Zr2l7PD0WD0zKoqR4=;
 b=Y0yr+8AIyz+Tjm+DEftF0MLEbAi3F3Ayy8+O9ki+5womPX8LiZotpH50JmQCyBzZBgKaQJgt5+JRNiUX8GhMxCWqzVLQv9XZW6aEJsT/xovGTsJ9moFFlC4LvH0h+QJZ/ZFK5mPWfIrSzMT0MqyC58LNFdi1bNqbKPyvL6EFwtw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Date: Sun, 12 Mar 2023 15:54:55 +0800
Message-ID: <20230312075455.450187-7-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312075455.450187-1-ray.huang@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT092:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 4584d947-dae9-4148-93f7-08db22cf2efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mME8tRiX+y0U+BwM87CU6cSmdbkJal1ge1GJLPgSSpTBL9x4zXntuepSUm7dhJXRSp6ignmrInSYc8GBObK1tB5kcT7X8PpQF1RNRCU1nNvKpZFjjEGYVGlvksxl7ZzF31qE9Vpz/FG1c0ArsGMJxLhstb0kdc0zHtVzta2ThmtSk0JaMouWh2vn3v6dGj4k4RMrWUZ3d9k6mKtarlp0lcQxwUVusWutpE+P4TFUBMKMRivXOvAz3+853/PI+YnWaqIEy/UuMxCAZ6ma6lmi8EccDoqDQL+90u+fV+apHzXaIfRThCiPdbca3za+VQ04nOmkR1XFUSufyXbCHpsUAg5S2+kBY1S8IgXt/K1rOa90V+y7TB3odec2nJ6QxA2SuN/QY0YHIlJpzhNvIcdvJmFDCoO26C/YvNRarz1vnwuMzxWskgVB/0xYEDjHYpmqgxmZ8uP3hE3eEPmyGGQdPnr/SgaVljBigW+82S5aiSCG4+4tbIqPBvghR6zTIpbVi4c8mr0dx7vidm38GKs96RIyLFz2Vqu63vtlpccpOphD2Cy7ySSjYEqc8AqevqVxXV4oPS0lRCxzLbzDKW7+nHcEua2xY9EbNiOSWsaF3/eCN0GtWsodpgTWHCL2aIfGU8cw0DJ5w/964jfhiG+qBJteeZ7/qIzewFCzmSE8A+qSe9APTJpTasrsuDWP+88XqJ2CJiJ8vW8PEgOFZ4FQsnR7+19+nBRIvdz2n1yVHsI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(356005)(86362001)(36860700001)(82740400003)(81166007)(36756003)(2906002)(41300700001)(4744005)(8936002)(5660300002)(40480700001)(40460700003)(82310400005)(4326008)(1076003)(26005)(186003)(16526019)(336012)(426003)(47076005)(316002)(110136005)(2616005)(54906003)(8676002)(70206006)(70586007)(478600001)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:44.3308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4584d947-dae9-4148-93f7-08db22cf2efb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124

From: Chen Jiqian <Jiqian.Chen@amd.com>

Use new xc_physdev_gsi_from_irq to get the GSI number

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 tools/libs/light/libxl_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index f4c4f17545..47cf2799bf 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
             LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
-- 
2.25.1


