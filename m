Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFA7A6681
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 16:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604801.942325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibcM-0000lB-9Y; Tue, 19 Sep 2023 14:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604801.942325; Tue, 19 Sep 2023 14:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qibcM-0000iS-5s; Tue, 19 Sep 2023 14:22:22 +0000
Received: by outflank-mailman (input) for mailman id 604801;
 Tue, 19 Sep 2023 14:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tQr=FD=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qibcK-0000iK-8U
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 14:22:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eec85700-56f7-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 16:22:16 +0200 (CEST)
Received: from DM6PR06CA0065.namprd06.prod.outlook.com (2603:10b6:5:54::42) by
 CY5PR12MB6251.namprd12.prod.outlook.com (2603:10b6:930:21::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 14:22:11 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:54:cafe::e3) by DM6PR06CA0065.outlook.office365.com
 (2603:10b6:5:54::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Tue, 19 Sep 2023 14:22:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 14:22:11 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 09:22:05 -0500
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
X-Inumbo-ID: eec85700-56f7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDHMcx5/RpWpKAUnHaA99meZcKmx6/+TGbORYXMQ9tn2sGQ6YDcFmJ5m/coXuwdz+74tfYERKPDWikW3YBbtPex0sjb+T4bdxRTp24FJsgZKqWkLfNXGfutlLCoAco1VOlSWTAkwbDqrCPMjGDcnWYcUDm4nD7auwSUl5uEuHTHq/eu1deqoku9lqBgcMC3ikCCWsezQLW1qw8dcK2Wu/Kllm3tTPcUVrxqyqSKI0dUT3JBjRRN4YK85pOAXb47+8K7pbY2NJKg5mP7l7XzVD5LHQRD5wBjSGuhRf4OR8eogsdDZLR9fMyUGxl4LXLy96Bs3HqdAbfuspX+yerFxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgvsZjqkleztQTOBKHxfCGMxUvKR3l93bJ2rH6pP8a4=;
 b=BW4BDohT07ijpbOoXzcYnj+RRBmDrkrqSmtzSRf3hJwAMICIba+j50q+nTD9cpEcSbIAhK3S6bLmnlGlOziNf/TaXYnUfI1t1N6uWZ3G5RQtCirWN/9EdXEx6rxPm3G6xtAHg1NmXjPT9A0DuNEJAJMCUl0lIz3IsjudEtub44h2rxP6UwFnca7Fa8GxXlCl7TR2Ar4/h8j3XBG3IZjDXzPKisidQibUsW7AydOfBODJbJRVBOM6/2+0OAb2q/jpDMXTAKUgEyu7/Oba+dnMXLGTa/4j+RbkBiaifVMy9aE7OoPZvetRagNpX+MaBw4gvm/gRH63HyImEX8XVkUWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgvsZjqkleztQTOBKHxfCGMxUvKR3l93bJ2rH6pP8a4=;
 b=ZbByqPwRUc5c509LNKo+6FfT6TelHuP3rBfo4/epYEJMukxmWV1xoyoQbhdCjn6eBpTttLprquj9Lj2QfuROOvD8v0apn+YoYEp7CvakXOY7KHPCU96zxGVr74q6Zt47YMakc/Zjob8rqGTT4GYTfn19S27YSHMuPhQP5pcu1k0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <32a68715-201b-9923-9600-fe5ae49e4b7b@amd.com>
Date: Tue, 19 Sep 2023 17:21:49 +0300
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
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <75698621-d210-40eb-872d-f3cfc6e4dbff@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CY5PR12MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 0beb3c87-a39e-4b35-24b3-08dbb91bd084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NQR+Tjn51ujPzVk9ZHQ84nE+EUKnf4FODiVoEnM5g2+KGbK9tvE3N3AoP8YDF0mJQc4N0kVVa1JRXOP7wJVy1yElJwmTAoHFzkXj8mjbq2midAkHhv5QeQKLvfZiAsaCbSHBnLuLUi3MxP9sYFZMTH2L3efacfGT6UvObwy+LlJkERS1gXtV4e/unT/tB+P27Ck2u0BSvXxY6qQraauqmuik/F0RgZ44mVi2OXNITVs0huzxI3lsOJCoziQUqEKHkc2TP4RRckwqQTmyBMx/lTnj6xOqMY70XkwDNzPqs17MVuS0Muv844fALf5DXtT+oiuHhHVnPf9fV8wIhWyyI1/OvO8zB+ifXxQFj1DJ0D4zsImksoeOfDmQjMkR7zvim6peDUQt8yAImRmQHGNR50OaXlduIo3jCsCCXFUVvsCyx8KZ7GmrZd989frQyMRh5tIvlyarfgfCjtLvrVoR9901ePQBQklq6M4c8uBpfo4Y8iSGHmLvzq7JCacXr2v6LNl8nr2OJNO1Dz2S8INiD2uZML/yaiUEMhwxrdZr0YYVeOfiP3CDO5DH7FHbwAG0vuL510VCFuNWnenUasA2ziHrpVdXhFc5KdL6HVjniSRYe0hm+sRmP/0UxbgudL5ItjyDbSl68Oj709IKnkhcrfFcqijmI1h6eQ/pT7nfCDEWkZRo2B3Xl0hEhvQomqTNJJdxNZDgKaLrQbPA77cSO1DFsqF6yeRLOaii03l9LVu0gCMWVHxbdNEaws5sSB8mAwdMN6WqCbH67mUC2OCEoWTV7apmIdaZwPoBJa7ioDgKgbXlmWtjEhAViyQor7urHpDDP3gvnkgQ63YnDP+qFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(82310400011)(451199024)(1800799009)(186009)(40470700004)(46966006)(36840700001)(66899024)(356005)(921005)(82740400003)(81166007)(36756003)(40480700001)(40460700003)(86362001)(31696002)(478600001)(54906003)(70206006)(16576012)(2906002)(70586007)(110136005)(6666004)(53546011)(8676002)(8936002)(44832011)(5660300002)(4326008)(7416002)(31686004)(41300700001)(316002)(47076005)(36860700001)(26005)(16526019)(2616005)(426003)(336012)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:22:11.5071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb3c87-a39e-4b35-24b3-08dbb91bd084
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6251


On 19/9/23 13:44, Akihiko Odaki wrote:
> On 2023/09/19 19:28, Xenia Ragiadakou wrote:
>>
>> On 15/9/23 18:11, Akihiko Odaki wrote:
>>> On 2023/09/15 20:11, Huang Rui wrote:
>>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>
>>>> When the memory region has a different life-cycle from that of her 
>>>> parent,
>>>> could be automatically released, once has been unparent and once 
>>>> all of her
>>>> references have gone away, via the object's free callback.
>>>>
>>>> However, currently, references to the memory region are held by its 
>>>> owner
>>>> without first incrementing the memory region object's reference count.
>>>> As a result, the automatic deallocation of the object, not taking into
>>>> account those references, results in use-after-free memory corruption.
>>>>
>>>> This patch increases the reference count of an owned memory region 
>>>> object
>>>> on each memory_region_ref() and decreases it on each 
>>>> memory_region_unref().
>>>>
>>>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>> ---
>>>>
>>>> V4 -> V5:
>>>>      - ref/unref only owned memory regions (Akihiko)
>>>>
>>>>   softmmu/memory.c | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>> index 7d9494ce70..15e1699750 100644
>>>> --- a/softmmu/memory.c
>>>> +++ b/softmmu/memory.c
>>>> @@ -1800,6 +1800,9 @@ void memory_region_ref(MemoryRegion *mr)
>>>>       /* MMIO callbacks most likely will access data that belongs
>>>>        * to the owner, hence the need to ref/unref the owner whenever
>>>>        * the memory region is in use.
>>>> +     * Likewise, the owner keeps references to the memory region,
>>>> +     * hence the need to ref/unref the memory region object to 
>>>> prevent
>>>> +     * its automatic deallocation while still referenced by its 
>>>> owner.
>>>
>>> This comment does not make sense. Traditionally no such automatic 
>>> deallocation happens so the owner has been always required to free 
>>> the memory region when it gets finalized.
>>>
>>> "[QEMU PATCH v5 09/13] virtio-gpu: Handle resource blob commands" 
>>> introduces a different kind of memory region, which can be freed 
>>> anytime before the device gets finalized. Even in this case, the 
>>> owner removes the reference to the memory owner by doing res->region 
>>> = NULL;
>>
>> Hi Akihiko,
>>
>> You are right, the word "owner" is not correct. The issue observed 
>> was due to the references kept in flatview ranges and the fact that 
>> flatview_destroy() is asynchronous and was called after memory 
>> region's destruction.
>>
>> If I replace the word "owner" with "memory subsystem" in the commit 
>> message and drop the comment, would that be ok with you? or do want 
>> to suggest something else?
>
> This will extend the lifetime of the memory region, but the underlying 
> memory is still synchronously freed. Can you show that the flatview 
> range will not be used to read the freed memory?

Yes, the intention of this patch is to delay the mr object finalization 
until all memory_region_unref() on this mr have been taken place.

What do you mean by "the underlying memory is still synchronously freed"?


