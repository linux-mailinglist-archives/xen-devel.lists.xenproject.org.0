Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB082BB2D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666643.1037415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAp7-0001EJ-1G; Fri, 12 Jan 2024 06:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666643.1037415; Fri, 12 Jan 2024 06:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAp6-0001Ap-Sb; Fri, 12 Jan 2024 06:15:20 +0000
Received: by outflank-mailman (input) for mailman id 666643;
 Fri, 12 Jan 2024 06:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PwP=IW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rOAp5-0000lq-AQ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:15:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3ef2f34-b111-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 07:15:17 +0100 (CET)
Received: from DM6PR11CA0017.namprd11.prod.outlook.com (2603:10b6:5:190::30)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 06:15:13 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::56) by DM6PR11CA0017.outlook.office365.com
 (2603:10b6:5:190::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 06:15:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 06:15:12 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 00:15:08 -0600
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
X-Inumbo-ID: f3ef2f34-b111-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0VsFMxWNGHW+cNTDprSeMNEDXJZvXLGx5MZJRFTHz2IBvk6u/YK1VE63OnexPC8e87TGNDrD7PH1GRSAu5UPxqq+jVN82dTdOpd6MzqqPJsTHd18hDgP+SGc/tJCQCUkT/2GFgpcSzjjBetd4q85AdiOhZDIQUoOnkrfiuNvs7tgvCbDORB3V6mTLEK6GkqOF3V86Vx4iD8JdN8i9hZsoTHUAdysiBgVEulB3GSMU3fS+p5DNPn/lWSEJ+At6DIY4kgNnX0Y7ne9fj1iDEDsdV648VjrcacoyFfzG8r2LNiyRa0t2QzRgvwbzlTjJis3jq+rIEn4NJND4+SD3fJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdiTH6i1r8SUyWtxRAbifltVDLUobikXsc/LwaGqRtA=;
 b=Qm5TDkFVsawzxNgwfR35mZNaLLRaH54LWSqiR5CvwC5w7Cqt4dsSyUYphT1GJHxUB7wxvBcXGJ7S5+MvdhzsDe66nMjAhKY3qi1/poQmwc0lMhDezJdFyXMXJx6PNqnwXP5FyXnf0QvtoByvG/nngHQfppMvrq8yLIig+Lnw68DZ3hhlqnsdb+OALxAqWc+PjxzP3vYBMUk815tx1bt2mi7gZTN5NDVOXiu69KJGAelK1WpDeON8Md6n28VPgr/VL0LV2vJXSJvoUEUJiT6jtOU1i0+Qn2khZa8T7oN7AnGkxEVm38+x9eI/zzIbdWAVv91AbwF6ddoWJjh/i2Lrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdiTH6i1r8SUyWtxRAbifltVDLUobikXsc/LwaGqRtA=;
 b=4COLBEAgtBz17vW8GRpQyRRM6Vx/3AFQxiYA+PszCdKhYPBkkVMCK3IGGsO6/W753dy+yjvAoJH9UtAtpl+B6TYYcqIn9Kxffyt05faxltQxyZ44z6fGnjZ5Hf2Rv44YCRgaehP2NEr3uQG3mtnNT6OF42yB6EyBrvfDf+89Kos=
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
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v5 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Fri, 12 Jan 2024 14:13:15 +0800
Message-ID: <20240112061317.418658-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112061317.418658-1-Jiqian.Chen@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: d720b8a1-5326-4eb9-0ff5-08dc1335d619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6/W2SHCW4qIvbqdEYyFsHQhcWH+U9nv6wEdune/EvkUXtVO7J/rsZnxfabkllsiA/tw996gt61rE0mSt3+8Nap6s0ySMigyDexsqY7INVcwJrjYue3aLXiAB/i6GiM7uftidp+Ym8diWP8pL70aBkV9NNFVXyCd/L1sP66bcQG5aC73rleXWr81WIP/LyVf1Wm7WkIrgXkkDjbWywUxt1qoqtwlh4h69AQci/SnVmVAljUqUw+Dhn4RYesgJVd8epNrH0Z8TxdOO9SYOFsvWri574Km3mDMt8JC/x9/t8unFoq74A+b/TBf+3pQNLmKx6MgNDGSJeCJhN8Z69Ry0Mh10RCaXz0RjaA/l9Z5r7LxWkco64iDeyAziXSXVO3mLzm7l+1C4iOalhOkbaxjxnSyzOoLFQiaZJX4RBufqpOleQISPx0zd9KygQ8T9W4rDMcFJSVLrB29Y3DoFepsVAddfyfqPDj4JwzBSw02R2cih8o8fn7gsz6xDC9KumKEJ8zBy3BHFRePwAih2XJdMVx7SVLB4HRWqqzgURhbvd6Z/AVvH6geGF2cOxP88/dkr4teA+Ka7LA50s5bJB8gXCoBSRp3yGp8Ye4onouUDVjLzhkVO/kcEjp9xtiinbsViyFZTHgDm+Cj95/R2jAZzy7Lj98WxcKeilPQrLN4qAHuo2+9QgS8Tg5Xca7gJf0TaI+PtrkW66v4j598sjFOaapCnxPa/cvnEsyT/TrLoGjb1rzBwJl6E7dWebpNb3gSGefIHESehuhSjhPrwpLx0Og==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(86362001)(36756003)(356005)(81166007)(82740400003)(36860700001)(7696005)(6666004)(8676002)(8936002)(4326008)(5660300002)(16526019)(47076005)(2616005)(1076003)(426003)(336012)(26005)(70206006)(6916009)(316002)(54906003)(70586007)(4744005)(2906002)(7416002)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:15:12.4991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d720b8a1-5326-4eb9-0ff5-08dc1335d619
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073

On PVH dom0, the gsis don't get registered, but
the gsi of a passthrough device must be configured for it to
be able to be mapped into a hvm domU.
On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
passthrough devices to register gsi when dom0 is PVH.
So, add PHYSDEVOP_setup_gsi for above purpose.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 493998b42ec5..46f51ee459f6 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -76,6 +76,12 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_unmap_pirq:
         break;
 
+    case PHYSDEVOP_setup_gsi:
+        if ( !is_hardware_domain(currd) )
+            return -EOPNOTSUPP;
+        ASSERT(!has_pirq(currd));
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


