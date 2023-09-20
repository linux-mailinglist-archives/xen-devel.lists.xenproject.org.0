Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD07A7685
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605338.942955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qit26-0005B5-UW; Wed, 20 Sep 2023 08:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605338.942955; Wed, 20 Sep 2023 08:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qit26-00058x-QI; Wed, 20 Sep 2023 08:58:06 +0000
Received: by outflank-mailman (input) for mailman id 605338;
 Wed, 20 Sep 2023 08:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w30U=FE=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qit25-00057g-Qo
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:58:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce11a2b5-5793-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 10:58:03 +0200 (CEST)
Received: from MN2PR01CA0012.prod.exchangelabs.com (2603:10b6:208:10c::25) by
 CH2PR12MB5513.namprd12.prod.outlook.com (2603:10b6:610:68::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.28; Wed, 20 Sep 2023 08:57:59 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::cf) by MN2PR01CA0012.outlook.office365.com
 (2603:10b6:208:10c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Wed, 20 Sep 2023 08:57:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 20 Sep 2023 08:57:59 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 03:57:53 -0500
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
X-Inumbo-ID: ce11a2b5-5793-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmh5Aqynf1mkcG/xXtE9K2sAqufwe8IDGH4gz+VGHphc6l4c63hyymhiz9easWKc2jl5s0c/LJfGEjg1zq611jL9VoHOuKBAoucdF9RodUeB8939lcRGw/TDWChUWYPDRVf/O4xe3sEbleV8FwWSnK2770X3OzR9wcdLNPt5Zzt7mDSO/wnIgh/nK4SBt1zciWMgXGKdFNqEye4uy6oPjSG0vwvwTiUzvkpeDPzG6YB4zO3gADy9efjo4c0vTX1WNvXzBLkpIvEHBNQtNVi92tL6M0hTw1Ix7GNiQ0yDhoZsHHEbFd59sntHKZGFYx1vZuTPb0zsw/inojNw4RaNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74tPTW4ioZVLVy0YvoVINl98cFQeriV1oowMGyshdMU=;
 b=NqkK/z3pEp0YTIqjdGvPWwGx4yExNtusBH44Rc1wgs0y50Rx4cChYfSzSYyNS5tljxZXqU1tCp9jCHSFs+sQdbAs+6rhVLwQ7BEAur1VMSiNZO7tf2sfiW9hL6zvc5bh1Id6rH+f8j9tZWGCO8g65nyoCC9iV6R82pXsmZ4VyRDP/wvic5eqo0MJvZpehp0X90FGT7RBMDi+hsvzpnw9SwfHsn7cRobIyseAv7YMEwUfeMlL2TkKS2GzZRwNJiLEzj8G7BL1UY8SRTWw5i5Vfp9pNAOXvEmkeHby0inUWfriy9vOgrIPXOwyEQ2yIxEDDkjZLDa5oJQmGBmSc6qScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74tPTW4ioZVLVy0YvoVINl98cFQeriV1oowMGyshdMU=;
 b=Mp1tYltDndF7D7o2VaiGeBM0vCsFBhBvvcD+L1BTNFY4SuMGjWnEJcOWZdsIFVeCq+k2Wh9xL1EjyJRVaxb3GarBRfhX8JFGK0DII59DJgwAR3S7SdGU5p2fVCehIzepCV1AgGfbswTxr59LtScP4gLlYRu2D5trUOXQT3yVP3Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1f8863da-fad1-f983-8ed0-d6bf8d9544b8@amd.com>
Date: Wed, 20 Sep 2023 11:57:33 +0300
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
 <c0370b6e-c17e-2400-ef8a-7a759d2fc2d7@amd.com>
 <75698621-d210-40eb-872d-f3cfc6e4dbff@daynix.com>
 <32a68715-201b-9923-9600-fe5ae49e4b7b@amd.com>
 <73a35fbb-c9a4-41dc-a6c7-26037b0e412f@daynix.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <73a35fbb-c9a4-41dc-a6c7-26037b0e412f@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|CH2PR12MB5513:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fcf1ae-1335-4cb6-ec21-08dbb9b7b05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CjvLctolLrLVkDtK0zLnKiT2urWiLMn+EvulXxVcmT/AbsFN2JZ13mXISgWw8EvBrYYg7ChMomEEKURDzQ+epvCmXcxgGzF8pTwz9L4OGXQ/znc2WNdpZ3Tzj/vGx1qnooSV6eyprR9YqPcqny84Xy22vghQbd+2gO8EhwxwNJ521YgkDzPxTk3nXls7BrIedL3Zp7ZYnDg+Cmv1qzaLblopnIYUdg+hSoYinm4ugQSSbxXxlqMQ0YIDWGI1FV4BgdZDD8/HLBI5Anxce4Yo78fghYnFfur5asmoR1PINsWPJ6mDYC7vfpnA1H5MvMvXLqux0hvuAERpTLzUyf9uWUABt2nAzN3IXpfGnbVNbto1ojaWm5ym5006T7VVYx3nDzYpao5HwHNroJ2F0g2NyX2MAuKfBAp1jHqeL9tRBBBIuO5BUSRRIDzBTCoEHWO3hYlOJPttKsUG5WrE/RVXAem3JOKU8AiJD1yXozPmFBo0tOqO2389mOgiJ8pyd430/3fcT8tCPCbI0KcKLI2dPRQk9rHJ2iWewO2vnQD4RjplozOAfsic/julQ9wcCmNu93DTphIJUvxfP0Yl7oO+ONCQKxtHEcIbMqZbz+TI6s8ueKf1QJ9sr8EM7HsiaUjCtjndpGU1AlO5YjdwiD2M9Rew2nDJDcbCcXj43am6btAyyh/4Uierc3F9RgDTjlhIyCqIFTnCnoakGTJtT3aQYdB3WOZOFVGt8d3noGHPPpc9yl1ELtxzCVRW+ePdC2yfKdExTtD81dhrIjJSw1x88l2Z1M4KYXHGS21NDg/YX2ySpVEc6+sjpi4hZfzmCeta0Y1mHV2xiX5qiyy7P/g0Nw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(5660300002)(31686004)(7416002)(2906002)(44832011)(4326008)(8676002)(41300700001)(8936002)(316002)(54906003)(70206006)(70586007)(66899024)(26005)(16526019)(426003)(336012)(110136005)(16576012)(478600001)(40460700003)(356005)(6666004)(2616005)(83380400001)(82740400003)(36756003)(36860700001)(47076005)(86362001)(40480700001)(921005)(81166007)(31696002)(53546011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:57:59.1556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fcf1ae-1335-4cb6-ec21-08dbb9b7b05b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5513


On 20/9/23 01:18, Akihiko Odaki wrote:
> On 2023/09/19 23:21, Xenia Ragiadakou wrote:
>>
>> On 19/9/23 13:44, Akihiko Odaki wrote:
>>> On 2023/09/19 19:28, Xenia Ragiadakou wrote:
>>>>
>>>> On 15/9/23 18:11, Akihiko Odaki wrote:
>>>>> On 2023/09/15 20:11, Huang Rui wrote:
>>>>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>>>
>>>>>> When the memory region has a different life-cycle from that of 
>>>>>> her parent,
>>>>>> could be automatically released, once has been unparent and once 
>>>>>> all of her
>>>>>> references have gone away, via the object's free callback.
>>>>>>
>>>>>> However, currently, references to the memory region are held by 
>>>>>> its owner
>>>>>> without first incrementing the memory region object's reference 
>>>>>> count.
>>>>>> As a result, the automatic deallocation of the object, not taking 
>>>>>> into
>>>>>> account those references, results in use-after-free memory 
>>>>>> corruption.
>>>>>>
>>>>>> This patch increases the reference count of an owned memory 
>>>>>> region object
>>>>>> on each memory_region_ref() and decreases it on each 
>>>>>> memory_region_unref().
>>>>>>
>>>>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>>> ---
>>>>>>
>>>>>> V4 -> V5:
>>>>>>      - ref/unref only owned memory regions (Akihiko)
>>>>>>
>>>>>>   softmmu/memory.c | 5 +++++
>>>>>>   1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>>> index 7d9494ce70..15e1699750 100644
>>>>>> --- a/softmmu/memory.c
>>>>>> +++ b/softmmu/memory.c
>>>>>> @@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
>>>>>>       /* MMIO callbacks most likely will access data that belongs
>>>>>>        * to the owner, hence the need to ref/unref the owner 
>>>>>> whenever
>>>>>>        * the memory region is in use.
>>>>>> +     * Likewise, the owner keeps references to the memory region,
>>>>>> +     * hence the need to ref/unref the memory region object to 
>>>>>> prevent
>>>>>> +     * its automatic deallocation while still referenced by its 
>>>>>> owner.
>>>>>
>>>>> This comment does not make sense. Traditionally no such automatic 
>>>>> deallocation happens so the owner has been always required to free 
>>>>> the memory region when it gets finalized.
>>>>>
>>>>> "[QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands" 
>>>>> introduces a different kind of memory region, which can be freed 
>>>>> anytime before the device gets finalized. Even in this case, the 
>>>>> owner removes the reference to the memory owner by doing 
>>>>> res->region = NULL;
>>>>
>>>> Hi Akihiko,
>>>>
>>>> You are right, the word "owner" is not correct. The issue observed 
>>>> was due to the references kept in flatview ranges and the fact that 
>>>> flatview_destroy() is asynchronous and was called after memory 
>>>> region's destruction.
>>>>
>>>> If I replace the word "owner" with "memory subsystem" in the commit 
>>>> message and drop the comment, would that be ok with you? or do want 
>>>> to suggest something else?
>>>
>>> This will extend the lifetime of the memory region, but the 
>>> underlying memory is still synchronously freed. Can you show that 
>>> the flatview range will not be used to read the freed memory?
>>
>> Yes, the intention of this patch is to delay the mr object 
>> finalization until all memory_region_unref() on this mr have been 
>> taken place.
>>
>> What do you mean by "the underlying memory is still synchronously 
>> freed"?
>>
>
> A pointer is passed to memory_region_init_ram_ptr() with the ptr 
> parameter when initializing the memory region and the memory region 
> keeps the pointer.
>
> In virtio_gpu_virgl_resource_unmap(), the memory pointed with the 
> pointer is unmapped with virgl_renderer_resource_unmap() and makes the 
> pointer kept by the memory region dangling though the lifetime of the 
> memory region is extended with this patch. Can you show that the 
> dangling pointer the memory region has will never be referenced?

I see your point but I think it is not directly related to this patch. 
IMHO, it is related to the implementation of 
virtio_gpu_virgl_resource_unmap(). Maybe the unmapping should be done in 
the free callback. However, I would expect the pointer to a disabled 
memory region to not be used, not sure though.



