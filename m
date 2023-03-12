Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C76B63BF
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508865.783767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYU-0003jg-8u; Sun, 12 Mar 2023 07:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508865.783767; Sun, 12 Mar 2023 07:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYU-0003gO-4m; Sun, 12 Mar 2023 07:55:46 +0000
Received: by outflank-mailman (input) for mailman id 508865;
 Sun, 12 Mar 2023 07:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYS-0002sM-Bb
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe59::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 494d1d06-c0ab-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 08:55:43 +0100 (CET)
Received: from MW4PR04CA0239.namprd04.prod.outlook.com (2603:10b6:303:87::34)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Sun, 12 Mar
 2023 07:55:39 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::9d) by MW4PR04CA0239.outlook.office365.com
 (2603:10b6:303:87::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 07:55:38 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:33 -0600
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
X-Inumbo-ID: 494d1d06-c0ab-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQm1k/kBWSRg0LrYU9BK0LeDcz44AbtFQN6dQVO2Y66koz5mealDdRb9+W4eiAPRIVYnY0kmTXoGBtjCoQPOZquGgWA4gOafIPhlxYqhcA7mngzt8OYX5mXJUx7jCELE5d36zSPr8EHSUdy5zf3es0whZ4MSdd18rHZ9i7afKO98B0jMgCP7HqyHVDtEpwXLqAjx7wBwUpAZiJMLydGzmYvsox45mwqEnL2q1noY5Dk6F4dhlUFbmzvtK1nTkbLfI1QdCFUuofBdnYeLy0QTICWVlwuWWr8zF4Z5wde4kHWOcWpDHwnl8jKVGesKLj37kk/e5Vz+UZ7T9nnr6utczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn55rEhs+X6Z6VXqr4ER2FI0Ysbg4HaxOmX8DDwQuGQ=;
 b=hYg+xT6yXl1Y7rEqPXd5Ltgc83S5GBJq4BxJKt83fnkBpBz7qHGQQvUUxefdq/J16plU6KT5ntFDdEuBSFho/HgqAh8Fgnd52wUsnA5agQJbB5n6G4wx+xEBUWxDnMTG0AOoU2PQ795OkXVAunNCDneK790Hnjv0GD0vQ30xniPrMixDYyDizPw4+3VD+nZr661fqFrSLxuvrHQ4Nd/bGX2nnTF9uGfNGddreZ6Rb99C5MDa2o2EdNw7JPO4AsJW0SL5jYIVfuZwnjXOg2z+QP+tBPXf6fm/juHqx4z0MSmUkPoVn4Jv+qT5d/PzDUcr5RnI8XZYCNqnUpRkTH3tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn55rEhs+X6Z6VXqr4ER2FI0Ysbg4HaxOmX8DDwQuGQ=;
 b=1nXhiB7OKGQIi+ike766indDPubgHIgnCW2dt02dT6KBERW6Xz8Gmrqb48XUkcbdAMw5Edh0rkX81SpuioSFr59AufXhcaG5zO1sDrdAbRJF/E39xsH4POtXCZXf/YxYq9yN+bAFAofVgmkh1RWfgGhUSp4rQMc4Q2vMvbDIUEQ=
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
Subject: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need PHYSDEVOP_setup_gsi call
Date: Sun, 12 Mar 2023 15:54:53 +0800
Message-ID: <20230312075455.450187-5-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT053:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0383abac-af91-4308-a80d-08db22cf2b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CEuGiI5kCnShtQiU98Z/oHlA1JZku/GOtE8Iykk3+zmmp0A4Wg1K52MG7LTp2gKCRUdCyqS5Cajlem2xunNM300xqIN5DxEaVN1lzx+/NkYp87QA8DKp+8aRXWMzSiE/PaGdjDYmyfiQ5nL99JHjfwEYIhKCLSYiKoN0ir2igr4XwXpr//55t6bb0xchZO6y0sPJEPe90rQCzG5fCeAcTyAh5Fp4H1Q6p/e3caUFnlnWYGJiYj+DDj9LhoPZy9EdQvjY2rrb3vVbLG7GzbUloB/uHk3AsBFkvHXVabSOuT3zWe29B1IwyPOUCU0CXl2fJ4VZ6MwPwB5SxkfP2YvwLQL+XQ0f2F1Lh9cfSActJmgZVjmnXwv8h8hlVD+G5vI6dDCfBmcGNCp0QGff+MKWgyVA0uSGVNzhfu6YZqMNVGJYD3sETs/9abwfEuB0fyUCcDz5rn6jdnpZnmajYtif2jJv0yOgnrQuW8uuwcOfjNcNoESBdin43QtD+dTvlkzaFFIaC30pZxe2e5Qzc5HJzaTEIge6Er4jRCvublOt8hB+sk8IGwgZv37+qYh0InadmaVlXJRbom19YOLqtoKA4DnZ85asNB7JhnsBD/Zj2KzBY712TZdHs8Wg8dopPWRcMXgrIbT7+UHSNaR0xicPrbtCWVWH2K7Ap/cJU1EuXMqyj/VfDhol+jF7eQh/osCsYv4y650KV1PqQv0ZBYNPqYHIFbtURL0M8YTsVb15q7o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(86362001)(356005)(36860700001)(82740400003)(81166007)(36756003)(2906002)(41300700001)(8936002)(5660300002)(4744005)(40480700001)(40460700003)(82310400005)(4326008)(1076003)(26005)(186003)(16526019)(336012)(426003)(47076005)(316002)(110136005)(2616005)(54906003)(8676002)(70206006)(478600001)(70586007)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:38.0202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0383abac-af91-4308-a80d-08db22cf2b38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344

From: Chen Jiqian <Jiqian.Chen@amd.com>

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 16a2f5c0b3..fce786618c 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -89,6 +89,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
+    case PHYSDEVOP_setup_gsi:
         break;
 
     case PHYSDEVOP_pci_mmcfg_reserved:
-- 
2.25.1


