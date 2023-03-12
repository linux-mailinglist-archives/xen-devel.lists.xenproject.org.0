Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50D6B6410
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:29:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508937.783970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0j-000736-Hz; Sun, 12 Mar 2023 09:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508937.783970; Sun, 12 Mar 2023 09:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0j-0006xf-5d; Sun, 12 Mar 2023 09:29:01 +0000
Received: by outflank-mailman (input) for mailman id 508937;
 Sun, 12 Mar 2023 09:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHw9-00008O-98
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:24:17 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20606.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7465656-c0b7-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 10:24:15 +0100 (CET)
Received: from MW4PR04CA0194.namprd04.prod.outlook.com (2603:10b6:303:86::19)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 09:24:11 +0000
Received: from CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::9f) by MW4PR04CA0194.outlook.office365.com
 (2603:10b6:303:86::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT081.mail.protection.outlook.com (10.13.174.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:24:10 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:05 -0500
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
X-Inumbo-ID: a7465656-c0b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0/tgazRt6cMazx5y/yh3U7aJCK0Nh1WthmW1Px470fGF+LKs/BgGl60c92fsgfTktqWfEh5MFqERNCzLifSqTUA4qmNechJMPbrtRVDWFMaTwBZ5OvtZgiDkPVKHz3LrYnFLowv2oFj1y9akhr+qmJdN1Rhy7ctYVNcGyNjSwcJ1a1zgeirLI0bCeouoyn3uMQu8ibjv2Au0fiqQRxVFXcfzPhPQlIPVWUB2GzlixiZvy6wi2W1T9KM9EkC+ZSbRXGk+RyxvpB4NORR2shTrHVGqNIbiKIe2ssxPhG54LJZdQGzmqhwAfxzccG5fysteIsWBaLrBoX/EBwi3sMjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj6lfkvOPBIVxai9KbL/xN6ZbDyalhOcTyL8nw2E/7U=;
 b=hDjsICdB0D+gVkBsJBtVrO2xMVkm7ErnjgJ9hW/fn2X66dTrSI7AuQ/P9CU+09qzUWEetnFC7rW17urYo0KLV4PY0vJHSU1/3ybHHEro6YlQKH/MTmozyw57gq+KyABPpUw4E736Uc/BI1iGpYZR9/AGlH+HZsQeFLr24swTtOmy7kRTseIsiSzYKa1u02BRpnKpxcJA7y4mH+60rbce9cxOAlBLESVBxpl79SOrJELbrui5eCV3cHiswQvRPAR7uAE9kXpplfs1T4qnxGvzpAjgcrIr3uMJf8ShE5AIfSkcKlPJElH87wvCy49mnBwS3LToK0X2Uw5Wy0Cu4MLvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj6lfkvOPBIVxai9KbL/xN6ZbDyalhOcTyL8nw2E/7U=;
 b=NsxXfEKKS6p/oUmMUpeuyfy09Fis+ZTwtxSC2sGMEOgbzMiD4HPJkn3Un1WGzeLlQZHXYwYtdAxYfAQjzHA7pppoDTzzzqH0pH8SbfU3nUrjfXyIRCira8upicBFJXxzeWdXaaJvpYgL3M5t/QEB6SagAjnoUnES7yYgkd9S+3A=
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
Subject: [RFC QEMU PATCH 12/18] softmmu: Fix the size to map cache with xen for host virtual address
Date: Sun, 12 Mar 2023 17:22:38 +0800
Message-ID: <20230312092244.451465-13-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT081:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: dee7682c-ed0d-4f3d-332d-08db22db89eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m1jlEmupMXRV44cn+86FabSTWSRL5yxQFrDFzXb/jh/UNvcq9PBWDse1XBQ6W5mRDN1nQZNylwg66VM3N8Zmh+nklXnsbjC4dJ0p4HsCmJ3NSrIXD9HSvu75IJX0qoAQgp+t9WVVkmi+ctafdo5ws1RPggDjT+e43B28+M86RpXG+cWTDFlZF9rvZF6Kin1TAjxwAciXOtLHQ7OK5tnplJYmV0fMw+0Is32Qt15bxvAtsRH0Udhcm1IBfWM+Z8o+avg8XbvxGiuKVzPGt9JhUVdYa59QcihDmJ+6/mrpdTbK3wQL0UGmVaqq8dQsswcrekbbw4Pf4RZ3yRY2FbeNVgs+42Z39JX7+Rw2s7xxacaJpqgQ3Zx6bqXSAfx1y84IfaQphd5q5n/xsqYv9AMs054FA4gzRSZ0Qq4Kj9m5zeTgANs0yF0BQmfRPX4jrQqOcsTF4VJhgDIiT6LV1O4WkfiKq9F80AhJZviZinKbBR2qesHoF5lxQ0eCwyTqQFZoOoCwX+a9x85KS32CA+241Qs1F52Sibnv1xEMltsnD9PSouUqYludEAMYh3fqNmceW8u69lQyiCy8ytXPWQgIWCbBjVuzxE6mnChuWFmVa37YT05eYIqG307GzMoTIXLRiS3+bRT0tzMv6/K9Mya47iPOhKn5dhm95LK3R11zsfANtsjnrDEc8aWR8AfHadTCd5zINSUKwmar06lbGeW69rlS5NoZuI6q7WH8rg7IavjLf2NISPmTU/8uXy67ovhi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(36860700001)(82740400003)(6666004)(83380400001)(426003)(47076005)(36756003)(478600001)(54906003)(110136005)(40480700001)(356005)(921005)(316002)(336012)(81166007)(2616005)(40460700003)(186003)(7696005)(26005)(16526019)(1076003)(5660300002)(2906002)(4326008)(8936002)(8676002)(41300700001)(70206006)(70586007)(7416002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:10.8569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee7682c-ed0d-4f3d-332d-08db22db89eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730

The xen_map_cache function wants to pass offset and size of this memory
block as the input parameters to map the host virtual address. However,
block->offset is too large as 0x100000000 (4G), if we assign the size as
block->max_length (0x110000000), the mapped host address will be out of
block->max_length and easy to overflow. We have to assign the size as
(block->max_length - block->offset), then that is able to ensure the
address will be located in legal range inside of max_length.

{rcu = {next = 0x0, func = 0x0}, mr = 0x55555681b620, host = 0x0,
colo_cache = 0x0, offset = 0x100000000, used_length = 0x110000000,
max_length = 0x110000000, resized = 0x0, flags = 0x10, idstr = {0x78,
0x65, 0x6e, 0x2e, 0x72, 0x61, 0x6d, 0x0 <repeats 249 times>}, next = {
    le_next = 0x5555568c61b0, le_prev = 0x55555681c640},
ramblock_notifiers = {lh_first = 0x0}, fd = 0xffffffff, page_size =
0x1000, bmap = 0x0, receivedmap = 0x0, clear_bmap = 0x0,
clear_bmap_shift = 0x0, postcopy_length = 0x0}

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 softmmu/physmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1b606a3002..1b0bb35da9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2304,7 +2304,7 @@ void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr)
             return xen_map_cache(addr, 0, 0, false);
         }
 
-        block->host = xen_map_cache(block->offset, block->max_length, 1, false);
+	block->host = xen_map_cache(block->offset, block->max_length, 1, false);
     }
     return ramblock_ptr(block, addr);
 }
@@ -2337,7 +2337,8 @@ static void *qemu_ram_ptr_length(RAMBlock *ram_block, ram_addr_t addr,
             return xen_map_cache(addr, *size, lock, lock);
         }
 
-        block->host = xen_map_cache(block->offset, block->max_length, 1, lock);
+	block->host = xen_map_cache(block->offset,
+				    block->max_length - block->offset, 1, lock);
     }
 
     return ramblock_ptr(block, addr);
-- 
2.25.1


