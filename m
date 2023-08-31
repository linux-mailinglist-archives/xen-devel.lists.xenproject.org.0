Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388478E987
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593598.926643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe4A-0000eC-Kc; Thu, 31 Aug 2023 09:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593598.926643; Thu, 31 Aug 2023 09:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe4A-0000bi-HD; Thu, 31 Aug 2023 09:34:18 +0000
Received: by outflank-mailman (input) for mailman id 593598;
 Thu, 31 Aug 2023 09:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe49-0006tw-57
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:34:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eab::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c2f5240-47e1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:34:15 +0200 (CEST)
Received: from BYAPR07CA0055.namprd07.prod.outlook.com (2603:10b6:a03:60::32)
 by CH2PR12MB5003.namprd12.prod.outlook.com (2603:10b6:610:68::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 09:34:09 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::a1) by BYAPR07CA0055.outlook.office365.com
 (2603:10b6:a03:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 09:34:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:34:08 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:34:01 -0500
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
X-Inumbo-ID: 8c2f5240-47e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8HoCiSbJyYGxsfCesVKkpuUe78FZoESbRoKIC9YXh2hXiTvt1SwB70lQaK9LxlQy7gJvB3euw/FDczW/fMVLbpdNBss1L48F3WpW7v+dKm49Y+/MuE/YpkOqKt3sm32zRINJ417JlEFqPhAyDHxEwsBI85FbRrZp1Wcynt339OK1uiJdhWKEo9YGoBFqSkC3gyRHpZzWFOehtznCQkMFWCw/ttqv/13koeMjhLME67C6CdGNURz/QszAebeKJWwhuZKHx7mnHRhOXlKYj87ThmnfQNEfKBx+YwgCvzdR+pa+02USIDIlgnWzWMIPaTq1AtJFkr3vANi5YxDiCL+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeYT00pmQm0gqierfTJ00hW3jq9idCkamPMS44rd90M=;
 b=bK0hSVRXFVcec2NebqQ4yn1zC5FplsV+YSQT2f89jgTBgoGyJi+FH/UvQKcwmZ5bE4Ug2mHQO4BOQmu3q/PxAuAW1pU4av3ZwFQjHg3ja+aSJ2Qd3CZAcB2FEyX+uMOJwqaQUoEJ1gzofdF9wJRZ4I1UtbDV1hT1ECM7x2M+NG07ItTnaePXyOOpVHT2spE1OP5uUkZ+7+nXMIgsJ0bMNOz665EpAfVPv2bEGgAcNtPpn19zzEmbCDsimPO6QDcbn2rA63+/kd/lrGLQ7Ev1b9URiuQ/XePf7Ls4G2ezwYAFrA9qsQ/hIxipbmAiZ1HQcMqKfyFJjWnLaZEJE9InEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeYT00pmQm0gqierfTJ00hW3jq9idCkamPMS44rd90M=;
 b=de4aJkrX5U/AgGo0ZeMp+bj4gG8ZB6fJe0XexMwqQ+eKIy6q1yQBlzjTTlmNBmuYxQQpYcJoRnieSk6JZIAggZtOC7DPl/2WAWsl2iI969YuMw3PsXRi6ZqeBiD3VmiLD3uA/gUP6XgvF2Apb9/qykYKs978V0UUtb8JwbWse6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Akihiko Odaki
	<akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v4 07/13] softmmu/memory: enable automatic deallocation of memory regions
Date: Thu, 31 Aug 2023 17:32:46 +0800
Message-ID: <20230831093252.2461282-8-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831093252.2461282-1-ray.huang@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|CH2PR12MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: d5915b9c-0019-4dfb-a24f-08dbaa056d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oRVVcJJ13RUqImpr8NEIQ2dAkp54ZfX4roNhXnyLp1TcM9W3UMKEnmqDn2Pcwb3bOXv9cujpRX1CUwQ8tAOLVpbbfYeTzCQLNCu6mIZyi7Atxp5AoUm3o20iEeuWDE6BvG3PnW+FWrRXF0kYC8jiFl1W+sds1+WGoygaR74zc2DkK6MnKAsbTz2sfwjqCUgVuITtfUoZyk2+uweTPyrWCq7Mh9xKpdNVSTCh/yLn11hD2SNsYqqmVkVY99BTCJq12Rd3Kj4sXLL312LS48I2B4hilUypkQ6HZTbfSelbtk0tuYhlq7F1kFbQ8/JXwBnt33t8tbsUIoCglrXTlBtW/j6c1wOw1cWYM+AmCy2WYZ9xvEDXCj048gyVIvi/dc+fhVV+F0SJtvj2mrCeBsauNPL0XLFbtkxOiZUflOEa5OEhgW92NWcoPQkcXP+6NebFZK7EDUO0NM2WwwRa9GB5bs1/AMsEpp5jomveQiDJUtQUmd5SskX7jXAJKe7JEhh2m/uWeQEGksHnie5//jsm8RwXczN2dVuOKF5Aupw14LqDF8X9S87Q67zJZN22QsD79e5eig9m+j0ocI1uqTNJzuziYpdL2U22JhXwK4zjOmO1FPWWeyWu78GB/EsgVvxTT/53J1Pt0NhjEYenWE+tFwpzKiDNJ+RF7M7gQhFWQs8bJXgIgfOzZ5twlexCzY0nlviYAvKIhEzpI0wRC7z1dpJLh85/R5zqoOdY3UYHQwBNg1iY6KpSQq4r+a5ZpitlY91CmSDIdzzFdH60TUst5rQN8D2zfxN/srAV80gG73Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(451199024)(186009)(82310400011)(40470700004)(36840700001)(46966006)(82740400003)(66899024)(6666004)(7696005)(40480700001)(1076003)(86362001)(36756003)(40460700003)(47076005)(921005)(36860700001)(81166007)(2616005)(356005)(426003)(478600001)(336012)(16526019)(110136005)(83380400001)(26005)(5660300002)(54906003)(4326008)(8936002)(70206006)(70586007)(2906002)(7416002)(316002)(41300700001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:34:08.5768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5915b9c-0019-4dfb-a24f-08dbaa056d3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5003

From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

When the memory region has a different life-cycle from that of her parent,
could be automatically released, once has been unparent and once all of her
references have gone away, via the object's free callback.

However, currently, references to the memory region are held by its owner
without first incrementing the memory region object's reference count.
As a result, the automatic deallocation of the object, not taking into
account those references, results in use-after-free memory corruption.

This patch increases the reference count of the memory region object on
each memory_region_ref() and decreases it on each memory_region_unref().

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

New patch

 softmmu/memory.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7d9494ce70..0fdd5eebf9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1797,6 +1797,15 @@ Object *memory_region_owner(MemoryRegion *mr)
 
 void memory_region_ref(MemoryRegion *mr)
 {
+    if (!mr) {
+        return;
+    }
+
+    /* Obtain a reference to prevent the memory region object
+     * from being released under our feet.
+     */
+    object_ref(OBJECT(mr));
+
     /* MMIO callbacks most likely will access data that belongs
      * to the owner, hence the need to ref/unref the owner whenever
      * the memory region is in use.
@@ -1807,16 +1816,22 @@ void memory_region_ref(MemoryRegion *mr)
      * Memory regions without an owner are supposed to never go away;
      * we do not ref/unref them because it slows down DMA sensibly.
      */
-    if (mr && mr->owner) {
+    if (mr->owner) {
         object_ref(mr->owner);
     }
 }
 
 void memory_region_unref(MemoryRegion *mr)
 {
-    if (mr && mr->owner) {
+    if (!mr) {
+        return;
+    }
+
+    if (mr->owner) {
         object_unref(mr->owner);
     }
+
+    object_unref(OBJECT(mr));
 }
 
 uint64_t memory_region_size(MemoryRegion *mr)
-- 
2.34.1


