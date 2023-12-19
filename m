Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF58182A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656529.1024811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwO-0002OE-D1; Tue, 19 Dec 2023 07:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656529.1024811; Tue, 19 Dec 2023 07:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwO-0002LC-9z; Tue, 19 Dec 2023 07:55:00 +0000
Received: by outflank-mailman (input) for mailman id 656529;
 Tue, 19 Dec 2023 07:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUwM-0008Dp-Qk
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:54:58 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e73fc5c6-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:54:58 +0100 (CET)
Received: from MW3PR06CA0016.namprd06.prod.outlook.com (2603:10b6:303:2a::21)
 by PH8PR12MB6915.namprd12.prod.outlook.com (2603:10b6:510:1bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:54:54 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:2a:cafe::88) by MW3PR06CA0016.outlook.office365.com
 (2603:10b6:303:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:54:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.8 via Frontend Transport; Tue, 19 Dec 2023 07:54:54 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:54:46 -0600
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
X-Inumbo-ID: e73fc5c6-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMG88yncB1UafCmWWVyd8M+0DNS/il0n75vxYFCuq31dim6bjZFIt6Ws3zFSRLNPstEFC3I20/3PH3cr5pZllsVw1BG04pSLJfjjTjQUI6YaS6hteDAeJbtauWE6Ijbi4p+6ensjcpf62GQiC34S4Bt1+hObaaTZ+YjC4YBkSOIwY0ee5SOGm0XDxcLLKAe9qHx1V8XaR2tvx+Q0bvFzSfID5yrHh78DulYNX9AKeDk78+WHPZFCNfRTEH7Uq+Imkfy8Ev3Wi+nyWQtaDWgw2R60xfKf63yLwAKuW2R75yUyhLOz8EHpvswZgVQu3nMK4AxtkrRgx4F2DEBmK2Ja4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHthmq3LNlURxrALGteQJH0pznfSph2Flea36JzSsgY=;
 b=MLvBuO3yxMd70JoCsgTbVfSZBMJhGSXFNuanCaxBiUQxEnCNwfxJADmLqievZxMUMU0bcaYLM2TScroFogx4rr4eabiGs0oTuga9+jtG0r3or5RP2nwb2ZKgA/MzUBNkT5aTI4bk7ejBNEH8nRmPh7EyuygCilfSaL+hfTxMsvyS6ln450n6WM57tunUqTzpn34j8iCAnW5ZbR0xPpuzGhZeEja8UOPu0raIPk609XW3SFMcgrWH99M/YuEvfo56Vcm6959rkqSjCXz2mim6mg+JsZbDk5YwlkhXE07psLjfGEWCwtrNWjukyhaYhdzpPIveHRvg89pP6kP6dv4iaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHthmq3LNlURxrALGteQJH0pznfSph2Flea36JzSsgY=;
 b=l0hbwTtsjmSZC/F/x9efoSXDKK17UB42jxjdjRcXiW5teYaWuZjGuBCXRA/k8snnLPloHp308N+7QGggb4FUnl2Lm+g+q+AZPQWjRkPmvBZGBxrpZwkoPxd1D4i4ac59zdoMY8acgTJvecN5qLJGb0vNz32WIvWF/qceraC/sb8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>, Alyssa Ross
	<hi@alyssa.is>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alex Deucher <alexander.deucher@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 06/11] softmmu/memory: enable automatic deallocation of memory regions
Date: Tue, 19 Dec 2023 15:53:15 +0800
Message-ID: <20231219075320.165227-7-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219075320.165227-1-ray.huang@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|PH8PR12MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 8161af65-0cbb-42e1-1c1a-08dc0067c9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LToTb6P6nsFg7OaWjSV02cosNDTZAB+ZJ01LIJwa9HgJ5YvoNgwdcHV62Q71NTJW+MxJbUiMQyEYjuixuvlxH2rJif+mBBxiPonm9mC32VUrzclNNayJbxFxoREe/aTDaF2lrcPY9ZsahMBmvOfOmHl37B2R7SV0cBQaybFw3Egf3tFUDEWmyiDTxwKkEPOuYD6wLdmw7oqkpapNoTWfHB7GuhK6byiPOJhkY0hmjgke1cs4KBAhw+vsijDxum8SDmfOCCrm/XycllwuoZj9E2xBhtKVg0kK1KyMY+ivWcZV/CxYaJTXKKK3Yz6DTCYhq1UQHtSzGvW9wEpifyv8UF+i518deHgVd+aejScheUi+ZZn62dajqboHcH0o8MG2sZ0LR2AzV4yJQcjphH3E3Pf4x0g22CJThUeyCP4NdDPyGA0h9xPHmnXNWJsRlvIY8tAPbipvMxhYLVN13k1qq54k3WVvULhqB969ACAlsSQTpEkAeF8iz5ATT0NPinsqZwlmSLM4GzrYfmiUSb3hKwuLSzD4jQwIsh/b2NxharkaXBVq+TkPTZ/i2QFL8vKuWH5EWfffUs3370u3KWWbezL/DOaUQva+viYwf6kr4qG3G5FJKtlDHAHkzxg8CrwIwdYjOHuv3w5tAAPIvoqe10pCLp3Ad3HN9sjhbSPnjR4LIgiH04PFmK1M1yRpk0MaHkPGbVndON+VkWFIk6B8zjRkDbv8fAEKSlgNMkUedSrgr0lkgfEc7SAtA9/U8P/2KFIO+p9wdF6828ip7BUHGyrJvAGWMys+DIs3/VotZEI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(5660300002)(82740400003)(356005)(66899024)(81166007)(7416002)(40460700003)(2906002)(36756003)(921008)(41300700001)(86362001)(316002)(7696005)(1076003)(8676002)(8936002)(4326008)(6666004)(40480700001)(336012)(426003)(70206006)(70586007)(54906003)(83380400001)(110136005)(36860700001)(478600001)(26005)(16526019)(2616005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:54:54.3089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8161af65-0cbb-42e1-1c1a-08dc0067c9ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6915

From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

When the memory region has a different life-cycle from that of her parent,
could be automatically released, once has been unparent and once all of her
references have gone away, via the object's free callback.

However, currently, the address space subsystem keeps references to the
memory region without first incrementing its object's reference count.
As a result, the automatic deallocation of the object, not taking into
account those references, results in use-after-free memory corruption.

More specifically, reference to the memory region is kept in flatview
ranges. If the reference count of the memory region is not incremented,
flatview_destroy(), that is asynchronous, may be called after memory
region's destruction. If the reference count of the memory region is
incremented, memory region's destruction will take place after
flatview_destroy() has released its references.

This patch increases the reference count of an owned memory region object
on each memory_region_ref() and decreases it on each memory_region_unref().

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes in v6:
- remove in-code comment because it is confusing and explain the issue,
  that the patch attempts to fix, with more details in commit message

 system/memory.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/system/memory.c b/system/memory.c
index 304fa843ea..4d5e7e7a4c 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1824,6 +1824,7 @@ void memory_region_ref(MemoryRegion *mr)
      * we do not ref/unref them because it slows down DMA sensibly.
      */
     if (mr && mr->owner) {
+        object_ref(OBJECT(mr));
         object_ref(mr->owner);
     }
 }
@@ -1832,6 +1833,7 @@ void memory_region_unref(MemoryRegion *mr)
 {
     if (mr && mr->owner) {
         object_unref(mr->owner);
+        object_unref(OBJECT(mr));
     }
 }
 
-- 
2.25.1


