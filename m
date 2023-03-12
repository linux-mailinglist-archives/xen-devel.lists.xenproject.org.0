Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363846B6416
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508936.783963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0j-0006xW-2B; Sun, 12 Mar 2023 09:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508936.783963; Sun, 12 Mar 2023 09:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0i-0006nW-QZ; Sun, 12 Mar 2023 09:29:00 +0000
Received: by outflank-mailman (input) for mailman id 508936;
 Sun, 12 Mar 2023 09:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHwQ-0000RV-GM
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:24:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1f5d54f-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:24:32 +0100 (CET)
Received: from MW2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:907:1::40)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:24:25 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::4e) by MW2PR16CA0063.outlook.office365.com
 (2603:10b6:907:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:24:24 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:14 -0500
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
X-Inumbo-ID: b1f5d54f-c0b7-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJ8zOA5kGkaSgC7NCCwRyi/7/U65U0kMfdvT8XCDumaCqjrSAzfQVLM0/L1QtYxPyth+cVPsXFCHfSsWa8OWFa9X+65fzDa3XTDJlsmihFBYGM0Zt4NXiisAh3UbUUEULA1zboZHf+f4KJfr8wBWqGyKV4bGWJyHPZtc+kuBSxHTK4C1wWEO6EK7WTiarWN4VPA9Y6qdt+d3+dItwXLZOM/tXAUAzGS/+uiCY3sw+jbokP9qrVJ/L4jFom6jtzo0+AZqvkWcVtYPhlrQiUO4Cpf/Kkf5cTF3qqESeZclRpD2M4N777jEU0WpJkSXz3Xa/HxUmw48GKl2ky0yXsYl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4njz8PcbedF2EFcPkz+yQS3FwMkw58Lg0EB1K4nngM=;
 b=aPLpzrqPmWQN5fExNmE3FlLxTfb2fqy4XW6Hr/C5kSwoM2pvzH+pi/l9sh5p+cF/o08VF4ikN987p/ysJYPFV/ZlMFXIny/2Bu2XOnIXkus/Z4HYy7Rigc6vDLHV8AipEipApdjbkCNhyFa3DRI4wP+ca5p689NROJb76e21L+EmKv3bEInC7wCEfEFJt7laQcekqnuHJbcryTtva7yCNg29Aho2q4sNghDZps3E3Guo7IZ+++zC0rJa8X1vTuncLtRmaBIhcDZ+Y1kCI5SBsU2XOwesFv8sqSvaKLH6qbY1jP/KJkDdKAZz6uuo1LIo/1rCHVvIoS9NRFAjwYD73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4njz8PcbedF2EFcPkz+yQS3FwMkw58Lg0EB1K4nngM=;
 b=Xm9tlht+S2z1npnDreRVji+7EsXdOnKJVStwjsyntl8C+ovf3KydAmoLyTIWJttiISvOVv/FeRejaC+GAxY2q+h31MAE+NfQ1ix4zr0kMtDSbvZ2QtpjozqSkvJldgD3FKfvHN1+L6cHVbzjSFpvOQnIZLVkvvQtMP0/bTwUKBM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC QEMU PATCH 14/18] softmmu: Add ram block check to map the xen ram memory
Date: Sun, 12 Mar 2023 17:22:40 +0800
Message-ID: <20230312092244.451465-15-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT023:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 233e2c47-7e92-4f01-06d9-08db22db91d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHnqSl2fLXBhXNsZMqMSmxcTNXoqbiR9wgoBOqhzuE25PU5xzUBROyipeJ20qdqgBu47Igfhv8BR2S41enqTbfwa6fvu470AmztSdQYuBcJurQJ6Ovrp7PMPQGB3WF0mm6z5FpvUgk7jlaxNTEU/iimnZ1GfzQpIMFaVpS9dRFndou8voXUBKjiZ3QFU51QRupf4fb9QBuWq+CqSpNVILV7Y2dkMFphn4vHbOgwiQ8s1quKz3sViG33+KB+SJrhgvtzC42DF/6s4AeznygswP3dL7QHpADIQ+V9Odx22BdWb/hUYhnR7cUiyX+evy0QMg7zwdWTBZah/MqyT8CpQWESdq/Fi4QwxXGBi16vLDJEo2uIn7iMJSuZEIRdPQvWugpKE25KpkODHZFqdLFjVLH28L2os72QBkjV/sTJljX/S046dig7uVU7eEhEm5THQcGAbx74Y2/NEmCQMBjXW5Gdc0Qp0j6TW/ZZCchwvKoC5EUMj4ceOEqhRnH0TUiKcmWa8tkVxz5+oouPViwTXX5e/9VKJj23OxWMVuOQ4OD/5L1uVZTYQGxktNcZg3ThM6mcI0dBW+q4DWGO1FWbHogbQxMnnykDJ2cFGDaxhNCWGwUhncpmLTSqiCIOMUlFLEhLW5jICSo/UVzPHICtSMStzAhfsrNie3oqOLPTMC1rkD+cH694CIXKlX/tVacoMH0iN6MooKd624mFuC1TGw3zg0XZ96s5KfNXW8lj0VnsiR084vR5wYbP5tEd9GWZe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(40470700004)(36840700001)(46966006)(2906002)(81166007)(82740400003)(83380400001)(36756003)(40460700003)(4744005)(5660300002)(7416002)(40480700001)(70206006)(70586007)(41300700001)(8936002)(8676002)(921005)(356005)(4326008)(316002)(54906003)(86362001)(36860700001)(110136005)(82310400005)(478600001)(7696005)(47076005)(426003)(336012)(2616005)(16526019)(186003)(1076003)(26005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:24.1399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233e2c47-7e92-4f01-06d9-08db22db91d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713

The xen ram memory should be mapped with addr instead of ramblock
offset. So we need to add a check to make sure current ramblock is xen
ram memory.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1b0bb35da9..e54561bace 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2333,7 +2333,7 @@ static void *qemu_ram_ptr_length(RAMBlock *ram_block, ram_addr_t addr,
          * because we don't want to map the entire memory in QEMU.
          * In that case just map the requested area.
          */
-        if (block->offset == 0) {
+        if (block->offset == 0 || (!lock && xen_ram_block_check(block))) {
             return xen_map_cache(addr, *size, lock, lock);
         }
 
-- 
2.25.1


