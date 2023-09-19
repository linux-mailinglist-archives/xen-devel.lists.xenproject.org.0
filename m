Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5517A5F88
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 12:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604563.942012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXyL-0000XB-Lf; Tue, 19 Sep 2023 10:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604563.942012; Tue, 19 Sep 2023 10:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXyL-0000VL-Iq; Tue, 19 Sep 2023 10:28:49 +0000
Received: by outflank-mailman (input) for mailman id 604563;
 Tue, 19 Sep 2023 10:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tQr=FD=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qiXyK-0000VF-6e
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 10:28:48 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f5058d7-56d7-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 12:28:45 +0200 (CEST)
Received: from DM6PR13CA0060.namprd13.prod.outlook.com (2603:10b6:5:134::37)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Tue, 19 Sep
 2023 10:28:40 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:134:cafe::65) by DM6PR13CA0060.outlook.office365.com
 (2603:10b6:5:134::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Tue, 19 Sep 2023 10:28:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Tue, 19 Sep 2023 10:28:40 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 05:28:33 -0500
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
X-Inumbo-ID: 4f5058d7-56d7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdB9w//K7Bw3QQjxbomV+zw+VDSsVTzE/qGcCQB6kxiQToUhXMxWTMnK5NiFFRP1T3fUaTISbOaCwP5p07nmZ7UBNWSJoSYEgpc1i1z8TCdlpkmVDgOtVxM7ui8Ocj7sJC98kPP88xbd5XuX4ScHu6NgJB9C/ECTt/mH8LfiHtUloFyk/JB6k+KfySV8bBxoZC4o7ENHH9BNj+4e5dJw08XqvbncHx9IFE1jDQ24a6BwdIFzGRdS7fKQ/cyGzopViCvqrkC0Nh/aVYKqq2p36pTwc+gZu8HnOng9qShd4cP85Sxk9RHH2VaTrrYzmHNTyNlEUWoihyoJFseojSI8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9uf1xrb9kzJVicQ/7BW/Jp6m5fiVAxzzaxgZLSncVI=;
 b=HAkihXKJKH3wustd8d9BIDe7bE3iScpwiteAmwgBex4EbAQ4OHkO9FTTQXxqRmq5bloUUl8ibCQ9aw1DK8WNJ75jJYP3uED8nctOXei4hni5jCvmDOoaKn9/nR2J2kOuP30VFeto2xqC2WucQL27G6bu6bq1M1ezNpwiMksMVrpE/ZJA0C/Gb7lVMCD2z8dGcm4uQePm6RVaXv19uyjHnATH1r99sLH8HzVJRhdatWcYYGnYiPuEsMAvg7jxxa8oNbD0Yc9FI2miw6RV9oTsrpA/V3cfCtFZJTAWrktafK5ZNJole7ZN49kSfK8D4Q8+OMLoP6co3aHLy4NHspfSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9uf1xrb9kzJVicQ/7BW/Jp6m5fiVAxzzaxgZLSncVI=;
 b=dxqDD0IMNfV5mQ8grgwlCY1uHA+bp1ZhU9j68zFSXZwAxhfZd/sxwk4M9aCfQIkVmGjb/dexZ9wW2P53flynwnJKnYRMPypGEwEHBndORaSKiqtfXy98RDu5VNcm4MoZywRO8heSzhG2v/Cb+diGjMklN3OM6OIJF5K+H1rWRa8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c0370b6e-c17e-2400-ef8a-7a759d2fc2d7@amd.com>
Date: Tue, 19 Sep 2023 13:28:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [QEMU PATCH v5 07/13] softmmu/memory: enable automatic
 deallocation of memory regions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Huang Rui <ray.huang@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	<qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, Albert Esteve <aesteve@redhat.com>,
	<ernunes@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
	<christian.koenig@amd.com>, Pierre-Eric Pelloux-Prayer
	<pierre-eric.pelloux-prayer@amd.com>, Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-8-ray.huang@amd.com>
 <99fb4575-9f8d-4ab6-bc22-911bbaa7ca55@daynix.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <99fb4575-9f8d-4ab6-bc22-911bbaa7ca55@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 97093709-8413-4283-e0e6-08dbb8fb3148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NpBwepw1UrZo3jXYTCr/GFwsKvTOLXh556CrFSJrIyu+LT5BZajL2c99a9s0bQ/yhlCSuYu3TjgE4JylMAxq/EhjLNvGEUt76b1MBGR100vSSmMfqIw6eDP47cvzBFnFoo6Jd9LE4oCjyUgaguHjWxEO8EGVjsJnMgThUrqIvLAK4RkMwh+9vQDTydN0jJquIUWy0U4L1uhZxtjYB4Nv8Dbb2ztct9oG0jvuq8TxhN8y06FaporBcCpckaMhdFZ/y/MbnqQXV5r2JABf8huUa3LZ9BczwS0fYZzEghRf/3I5u6YJhdiD/Y/5dhwLcqpSLe2gwY/nZShLihLBFvQBCeQAbHD/Ek42pXRoHZBXuZcBsiFoPbQxtLXDkuLwE0l9BUhMkVvxvgVttTf05U8VhfhO5asWjQGGlHEai3VUZvQeVoPv7YX5uJ3/b+V+fHZGCY+z5J9dAO97/PZIvmKbRiDY9UpHTIZjrjLU2o95+Y1j2JftTcLXTlLcAV8C5VhaaLhWDr8+/fOG0FBSaNsWlFkUiyoyrxbp1vxbVjPcEn/KuEeqGcYaiODcl/CA/DK82nzTvZgBn8paK/hkT0j8803iriIYcfGsSTpeZhQRwLh62g9irHMVgsAB+MtwoArgN7q6pRcz4Kk6bluTnoLF54vPZliksBwgNHCO0Fgv3CtDbYAfV2+b8CUuUZHKpKQ8S0uHFmWSKTEAqYAZIaybph7Dw6qM+bvIQwoX0TbCdbEuNhEJuFpqRZ656rm3gLWRqjs1m05WOFhY7Zuv7sSewTg4u0IS52b+aJv8jwmpkpfGTyjUm4AcboZpJkUcnSuHT9dN6MuhZAl49jJuwTszQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(70206006)(70586007)(54906003)(53546011)(110136005)(40480700001)(16576012)(316002)(41300700001)(31686004)(478600001)(44832011)(6666004)(66899024)(8936002)(4326008)(8676002)(40460700003)(82740400003)(26005)(5660300002)(16526019)(47076005)(36860700001)(356005)(81166007)(921005)(336012)(83380400001)(426003)(2906002)(2616005)(86362001)(31696002)(7416002)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:28:40.5437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97093709-8413-4283-e0e6-08dbb8fb3148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280


On 15/9/23 18:11, Akihiko Odaki wrote:
> On 2023/09/15 20:11, Huang Rui wrote:
>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>
>> When the memory region has a different life-cycle from that of her 
>> parent,
>> could be automatically released, once has been unparent and once all 
>> of her
>> references have gone away, via the object's free callback.
>>
>> However, currently, references to the memory region are held by its 
>> owner
>> without first incrementing the memory region object's reference count.
>> As a result, the automatic deallocation of the object, not taking into
>> account those references, results in use-after-free memory corruption.
>>
>> This patch increases the reference count of an owned memory region 
>> object
>> on each memory_region_ref() and decreases it on each 
>> memory_region_unref().
>>
>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> ---
>>
>> V4 -> V5:
>>      - ref/unref only owned memory regions (Akihiko)
>>
>>   softmmu/memory.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 7d9494ce70..15e1699750 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
>>       /* MMIO callbacks most likely will access data that belongs
>>        * to the owner, hence the need to ref/unref the owner whenever
>>        * the memory region is in use.
>> +     * Likewise, the owner keeps references to the memory region,
>> +     * hence the need to ref/unref the memory region object to prevent
>> +     * its automatic deallocation while still referenced by its owner.
>
> This comment does not make sense. Traditionally no such automatic 
> deallocation happens so the owner has been always required to free the 
> memory region when it gets finalized.
>
> "[QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands" 
> introduces a different kind of memory region, which can be freed 
> anytime before the device gets finalized. Even in this case, the owner 
> removes the reference to the memory owner by doing res->region = NULL;

Hi Akihiko,

You are right, the word "owner" is not correct. The issue observed was 
due to the references kept in flatview ranges and the fact that 
flatview_destroy() is asynchronous and was called after memory region's 
destruction.

If I replace the word "owner" with "memory subsystem" in the commit 
message and drop the comment, would that be ok with you? or do want to 
suggest something else?

Xenia

>
>
> Regards,
> Akihiko Odaki

