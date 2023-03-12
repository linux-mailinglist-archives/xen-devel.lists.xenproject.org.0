Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872936B63BD
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508866.783774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYU-0003qP-JE; Sun, 12 Mar 2023 07:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508866.783774; Sun, 12 Mar 2023 07:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYU-0003jV-FO; Sun, 12 Mar 2023 07:55:46 +0000
Received: by outflank-mailman (input) for mailman id 508866;
 Sun, 12 Mar 2023 07:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYS-0003Pk-I7
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45eaf9cc-c0ab-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 08:55:37 +0100 (CET)
Received: from MW4PR03CA0075.namprd03.prod.outlook.com (2603:10b6:303:b6::20)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Sun, 12 Mar
 2023 07:55:31 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::56) by MW4PR03CA0075.outlook.office365.com
 (2603:10b6:303:b6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 07:55:31 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:27 -0600
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
X-Inumbo-ID: 45eaf9cc-c0ab-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjMwgE8mPP0SiC4FrlJnrf//RiKlmVb/kwUWp0dOLZI3XpNR/I58JUdHTN0+sNm2XMb8jTrDu7rst67z6Q0Qc+Q4QdnpUNT+ojYicyFS68w4nVp8nOvzRSYAZZSzB7DCZhF5tsX4UHvl2d3aPPe9jjMt6fRTZt+ymazWBvqFQS7sG6kR2uuPVgR4ERTjUO64AZ3SCEqCz8Ffw40A4UEfPvWiWB1l/Po6JpSoBPp5j3D3PevS5lDVq6S3O4aspk34m6DXpZAOWc3Zv7Xe7NkhFrOKc2A8hnH39MuCF59b7CWVHcusaxO1z/z5g+8MD5GkBrmrRsQyQdT07S6xpJjytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H1lvZLVrUyYMTjixlNAUXTLFqacVwjL/tsS+Mp+YSE=;
 b=oMZQKfSHyPDFMz/WgFcDqzwFhJIvf9zxOi2Or+mafz/UDV5aum9jp0lIYwLxCbHzRV6X9t7T7iFd0aZnJLqdoPclInQHzacw+pg+eD9DbNVd8yfxHgA9D2gV9ypLwck7z6wgrHeLuKXN6z6VZepPM/Cw/DVwmvTjLIjogrX9PwAe7Dt+34W4pTxOuRTstKMm0NyZO5huqDVBoVSdEOd1WzojpEf9dkFVlyWFLyn6O5LhwoVqJx4Vp/67CV8tbz/fcw4CqUzFr0uCquyyg7rYQjvLXpBueA+sEgpCiiEPy6n4Fe+DI285OjYGPjNtRztbCQ8QXswmzCWcEe8tNBe4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H1lvZLVrUyYMTjixlNAUXTLFqacVwjL/tsS+Mp+YSE=;
 b=aFLTQMpv6G6TnNZIF9+YRVleSDcyLDMlwsKv5VP+PUqpJxErOVKMOWAiWZjRmlbs51ELgpHJnOVX44Sqivlhwbx8MqYaWi+ckhNxeFMqUQk8FK14snw3+0b8Z4RFRuqtoXJLaeu7D3FpUccagXjEGrhwAKxaM+vBcZkpT3xXBuQ=
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
Subject: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Date: Sun, 12 Mar 2023 15:54:51 +0800
Message-ID: <20230312075455.450187-3-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca02b2e-99f9-486a-a652-08db22cf2713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LhjfsuJXLp0rfRSLBsmLtugm6VXhYoTckpv0j40DyeBu5W2Ego1kbUXBPaTK8GkOVwFHAm+zkAQEFMDYtYWMxFKFgqZeEa+djHBaTkz4GyVZbze44Qt6M4peHEFFAX0eCKh034NE2+htzsQiDczLJomx6EkD2AUMH82CDP1AJzanTjCZ651oitxwxDXf2rBzp1hZMlbMekxs3ECJdKqwSNHE8S14l7u+orIU+gExG6iTxZib99JcyqZS9PZL7cI5KWqx2DnEFMKHd2MrvYlSs7qYbKqWeR6NSq0tLK+c3D7LcnydZxojgYU0TT/NM1KGmo9WCE8Kt4dFEKRaWpeXwHeoTrYbEhvFB5Eo1DnVQsk13UynyN9bObxU5qv2lGFNh8kpFwvIaXd0s1qGhNBMvUlRgvcEFg2UaCefSk+h9K+8OXvGVyp7y6NA38sUeuk3De28SIeNB+dcoBsC5D36dhkQBUoZ3Ee20N2SUxY54M13AZfscXUQ9R7FsRay9B4CYd/HItIeuNJGcFcpgBJJjtkO0o+jHIct5cS9ZWYDgba5ai8y1PGOluT0D3vgcRRBk7tSCxHfCjASbnw2v8bGC0KcYaXbYEhgisGvUb80CWZDi05MxO5TCBQ1hs+BALfIwp0A5vPawrd6YsEwhQXIvSaBq+FRBsqY32glouw/FWF8rSDRGjFaJl870h5URJT2z0AqLdwoE/XY6tZZs3L6rqvN86Xmiz8IQW2CMn36cTo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(4326008)(5660300002)(4744005)(8936002)(41300700001)(2906002)(81166007)(82740400003)(36860700001)(86362001)(356005)(36756003)(7696005)(70586007)(70206006)(6666004)(8676002)(40480700001)(82310400005)(426003)(47076005)(83380400001)(110136005)(478600001)(54906003)(316002)(186003)(26005)(1076003)(16526019)(336012)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:31.0668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca02b2e-99f9-486a-a652-08db22cf2713
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455

From: Chen Jiqian <Jiqian.Chen@amd.com>

When dom0 is PVH and we want to passthrough gpu to guest,
we should allow BAR writes even through BAR is mapped. If
not, the value of BARs are not initialized when guest firstly
start.

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 xen/drivers/vpci/header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec2e978a4e..918d11fbce 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -392,7 +392,7 @@ static void cf_check bar_write(
      * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
      * writes as long as the BAR is not mapped into the p2m.
      */
-    if ( bar->enabled )
+    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
     {
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
-- 
2.25.1


