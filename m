Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C347A1D2D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603024.939934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6l7-0005nm-9Q; Fri, 15 Sep 2023 11:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603024.939934; Fri, 15 Sep 2023 11:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6l7-0005lI-68; Fri, 15 Sep 2023 11:13:13 +0000
Received: by outflank-mailman (input) for mailman id 603024;
 Fri, 15 Sep 2023 11:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6l5-0003Cy-8P
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:11 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d98cba82-53b8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 13:13:09 +0200 (CEST)
Received: from DS7PR03CA0125.namprd03.prod.outlook.com (2603:10b6:5:3b4::10)
 by BL1PR12MB5240.namprd12.prod.outlook.com (2603:10b6:208:319::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 11:13:05 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::35) by DS7PR03CA0125.outlook.office365.com
 (2603:10b6:5:3b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 11:13:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 11:13:05 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:12:59 -0500
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
X-Inumbo-ID: d98cba82-53b8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebOp4RsRYYAAUO7G+HFbWeWCGucPSse4Cqf94i8ejKxCZ73shBC26pcnSVYWzoyyZKwaQ7dbAHH1RgN9iJj2BG27V7IWC0dDr3g/U8l/01gd9H67j9w43qpdOylc23DRngb+V9l3VEkaj3mhtPqhVPnBt+hTQmeYyvy617K8DxXoH/E9zahlStGVJkPBsAhrNXU3hA+qrgXJn8aj5S97kIKMa8HnUcIymyVDQmjH7DqSQuW4ALU23KQUAfuFD99yjP8hbGQJdDYfarvTcxLA37er+3ycQSifb2QIA6JOeikeI4lNLZNisqcBv7bDZBOsset8Gv3dayaH/BuJLSAucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SviVy3p1SaMQZ+DeOFS4BSuC7/Crlp0rXdVO1dxpWdg=;
 b=iPkBuMlnpYP+N0MFs0N9ieBOv02xnX3mCL+/hno1W0DoCv7OkA81ARudFQA5e9vdT5GusaZTXZahvsiRxkOxGzS1bKptx6C8xD+BAIpYm1v1yT4p/uy6BLI4hLxt14ImhdulYpuGLUaDeGrXi92eoh93XNEIcGTD14iFc3Q15IZSHs28bDT1+PHIL6TCQbCoh91qJB2V2n7lNwaQ4BONU88YtyXTXEc3TAor8z6qKv6dMjeRv2fQQ0LvpQV6aiycU5L9FcAM4txaBDdet3eaQ0TEOSswmEwQhzXmLrIuFRHU9NFpTd29FkfDJC25wJmHTfCg99GlscylblFlpBa6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SviVy3p1SaMQZ+DeOFS4BSuC7/Crlp0rXdVO1dxpWdg=;
 b=U2/ZhPC/2ePWFg5hIRScJactE8ncxRRs9C+OBYg1YTtPoN9c/LzJRxmIxPfv3o1zzmdcE23BlQPwIt/oDhuf4fBKhk0xNjsdey+JcnCtO5y7AK/y+F8s4AzZVDt4SXVQT8S56yHtjCiA4tOzR/4I7cDI/mVe0BOZ6cZkVNJXKgA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Antonio Caggiano" <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, Albert Esteve <aesteve@redhat.com>,
	<ernunes@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v5 07/13] softmmu/memory: enable automatic deallocation of memory regions
Date: Fri, 15 Sep 2023 19:11:24 +0800
Message-ID: <20230915111130.24064-8-ray.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915111130.24064-1-ray.huang@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|BL1PR12MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ce3266-f3d1-4ed5-5736-08dbb5dcbc0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ySd+YhWxbNTYgniZ4QXeOr6tTNtpYQG3G+qcl9EULXzKb19YRxV/MwdM0YbvpBtN+44yQSiyTI8dP75jZp4euY/kwsOGNDPo/Mm5D0/8zcp5oQceMZgi673aLZpYfrAMOlUni6L5b0w3e0MKy9Y/SDrVRsB5/0/PD7dF9O6q/bCJgb8CFxQOabZ2g8fIUII75yWYjwXBbLNJ2AIVG6WaLELKUNHWvSSWl6dhzVa17qwRfNfaL6+RWddepti3ebtD7+tsF74/zG24qvEBB/6kEMpmSTnlGglmPiFlB8gHooa+lnVlKycvVwHBd2PUd7eQGbNkt1G4JwWRMB2CCPzMjSa6z+piaGQ4J1JLpaxFdI/G4Lze9Z0DYk96NJxoCG7wey6UOry7alEZS7Yv1Tpyio89TewFZRDhMYIr7AAYWzYQ5Y6iEG5fx803LEzXTQAAUqSxRi3tpuF1FehqoGRf0G/AxBnwFT1cXiSbmFpSq97DvfUJMp84hLoel0u6PpquwlB0fOebkXmQgM7sMpZXBXGO35r+FYjDUnUcNbMUS4FvRXqnVuPoODGum4HLBeQMiSXfgNbFNUKdKhdvCSXJPS3yvjpC8Q1aAdYT4bfnV3PhbreX+rVLHvSCyJhHSqDNYsYVzHHjDNqefewa8rqX94Ka843nEMspdHvu1owZBKrN321qpY1X3uRfwcXD+Ti3+zQvns8Z0PI06oyiZsXEFmLIF20FwhCdJGQL/kWDMESl0XMxC6w+js6zYHyH3BSei2qgu1VdXFUGm/YBmub82+xAa6ROD8vwZ1+5MwCmw8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(110136005)(54906003)(6666004)(70586007)(70206006)(40480700001)(7696005)(41300700001)(316002)(478600001)(8676002)(4326008)(2616005)(66899024)(1076003)(8936002)(40460700003)(5660300002)(16526019)(26005)(47076005)(36756003)(921005)(356005)(36860700001)(82740400003)(81166007)(336012)(426003)(2906002)(7416002)(86362001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:13:05.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ce3266-f3d1-4ed5-5736-08dbb5dcbc0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5240

From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

When the memory region has a different life-cycle from that of her parent,
could be automatically released, once has been unparent and once all of her
references have gone away, via the object's free callback.

However, currently, references to the memory region are held by its owner
without first incrementing the memory region object's reference count.
As a result, the automatic deallocation of the object, not taking into
account those references, results in use-after-free memory corruption.

This patch increases the reference count of an owned memory region object
on each memory_region_ref() and decreases it on each memory_region_unref().

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

V4 -> V5:
    - ref/unref only owned memory regions (Akihiko)

 softmmu/memory.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7d9494ce70..15e1699750 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
     /* MMIO callbacks most likely will access data that belongs
      * to the owner, hence the need to ref/unref the owner whenever
      * the memory region is in use.
+     * Likewise, the owner keeps references to the memory region,
+     * hence the need to ref/unref the memory region object to prevent
+     * its automatic deallocation while still referenced by its owner.
      *
      * The memory region is a child of its owner.  As long as the
      * owner doesn't call unparent itself on the memory region,
@@ -1808,6 +1811,7 @@ void memory_region_ref(MemoryRegion *mr)
      * we do not ref/unref them because it slows down DMA sensibly.
      */
     if (mr && mr->owner) {
+        object_ref(OBJECT(mr));
         object_ref(mr->owner);
     }
 }
@@ -1816,6 +1820,7 @@ void memory_region_unref(MemoryRegion *mr)
 {
     if (mr && mr->owner) {
         object_unref(mr->owner);
+        object_unref(OBJECT(mr));
     }
 }
 
-- 
2.34.1


