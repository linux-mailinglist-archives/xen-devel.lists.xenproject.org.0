Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23B81AF9C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 08:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658525.1027718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDf2-0001z3-QP; Thu, 21 Dec 2023 07:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658525.1027718; Thu, 21 Dec 2023 07:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDf2-0001v7-NV; Thu, 21 Dec 2023 07:40:04 +0000
Received: by outflank-mailman (input) for mailman id 658525;
 Thu, 21 Dec 2023 07:40:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvtX=IA=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1rGDf1-0001cI-5y
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 07:40:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2376a7b3-9fd4-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 08:39:58 +0100 (CET)
Received: from DS7PR03CA0151.namprd03.prod.outlook.com (2603:10b6:5:3b2::6) by
 IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.20; Thu, 21 Dec 2023 07:39:53 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::20) by DS7PR03CA0151.outlook.office365.com
 (2603:10b6:5:3b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Thu, 21 Dec 2023 07:39:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.20 via Frontend Transport; Thu, 21 Dec 2023 07:39:52 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 01:39:45 -0600
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
X-Inumbo-ID: 2376a7b3-9fd4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOm6xZeaZek3UvxeUeZ20FgMD6FGWgtJ8O/ppS7f0n2IqPEPgMC0A99i/Y2utvL8lzUqYdgoRxFQ180tuRBxsuJup1NPL1agE01vLpdd33MLTLe56cXP363VsS5K26tBbOqJES/U1YdiagCYghsMmbrBPIHKOPFE73rK0osZp54konXoNDmPECLm/rgdnPc58aFFP+P6oSy5UshBrPP3ylIzoUpVkt1Vt51nkSNT/HLJSY3saUGruL6ksch2qXkvZ38YQ1G4cTSCxMTyoVoz5KSBt6blG5c9yO71V1kFjrVOSH4SC0m65nL5tlF9hpH8bOYhoeflu1FhyBuJOAzsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyjw1tmwpT5Pf1kzFODIDGXdLJwV+RU3s8TKgBENjzU=;
 b=jra3PeMz4CY0Ziq20edQ2NljSRaHzxjEglhXxzksaqsUZjUeUDioI922107rc4vtJ7B0RlmKAfzZ3eewC6h9YWnKRAQWIw1qHLWkRUkMC2pmLjbaAD7oiJQnek1wJcfdPTCInaZzdseo2nozyjRz3o3a/PrJ1Ius9QjbhIJCW+Xn4se0dVntXkFlxS1eOyOJaqE0gedzo7CqzukdELLqEdjIZT82NzaEZpJTxDJFvDmwlAJfVTZORpSxO40uVpky6k0o0bdX7ipzL1s3gQVwmR8g6Ytv9cSDLDHAngxxtsUrYLMfu6wSNsnUMtYZE8CnkhRxC8l6JmWWJYVnHq4o5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyjw1tmwpT5Pf1kzFODIDGXdLJwV+RU3s8TKgBENjzU=;
 b=HwpSs3O5HWgt/Lgf7ff8ay8UM3i3RV26YMV30+jqN2PGf3caJyjpQ4PDtshq3FQM6HjZ0ax+dvb+HKDHLHuXsiwrIYGH8tRQ6IvAZo4Y6U+GgVh2KWbjEkoRjTZXNtPQZtOuEPSSyf5i0/Pn9C8W38lP7jY5ZSgRTDhQdrDVGgk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <74fcbb90-567a-4a40-819f-4aefe05731d1@amd.com>
Date: Thu, 21 Dec 2023 09:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Huang Rui <ray.huang@amd.com>,
	=?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>, Alyssa Ross
	<hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"Alex Deucher" <alexander.deucher@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>, Pierre-Eric Pelloux-Prayer
	<pierre-eric.pelloux-prayer@amd.com>, Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
	"Antonio Caggiano" <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-8-ray.huang@amd.com>
 <9ee393a7-283c-41b2-a7bb-5e3306c0257e@daynix.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <9ee393a7-283c-41b2-a7bb-5e3306c0257e@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 54722509-b217-4757-4b8c-08dc01f80522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NS9g6Qr+npmbnQgVLRtDRYGzHEKGMvln1ih+Yn2IG8F5YZt06uGf7WlyR8bIk7KLm1mb0N/7C5/1yuiGq5D5yi3XptnsRH5wN6iT6a+byXGz+671BlgboY2S+C0jgxAyemxmuvXE2ksSIwkp4dq8V+Piff6vTGgeUXWPM5qS+yvJ0xmwcd5tm8hIH/vRwi3wxXzT3aQSo8D/Q4MSs4wtC+JOi7SsV3ERt3bosUy3hbBeVc4IbC1omWx1jfnmvehcDU/0S97K3DPj38YME87xm/q0b38zgYjwTLzz2YfXf4I1PwvXMo8uqm3x+Hl4+4cBG95+PM/xzZ1jNtIczOVkilvd72VupoVmO0/03h5yGEv/59QqCBwJrr1ShY6CmHyjUxBRoiy0sHtqn/p7RuxFg+oIBW6v2R56EuU2wHJcBq1LmKdTFU8bRQzacSOfqaVYJOI5zfpGBOCSQx5ECv/eKiHvmPOYrBeYUzmvTfxaQNg3qRhVKI0W45UZZxajART8ph9wrg490fcBQA400jW+/0MeSrEZJeEVAmqzyvgOS/onJ4CUl0vSzfgX/Ypz5JuNAGFAzDIyQUeW7p3v81Nc6e9jeJrP4uG2A0Sc3Cdqfwd8hDc37PF7+neGYlYO7KjOwXBJ3FG5uxVsduy1F3ZS2EPNuqdPxlGHNyu2or4BYfZ1YI8PcayO5lfGwB3fYSxsoiJE6MeTGJcZnRdYBHcwioDkaNp+4Kew7mLFYvZNHHG/YQOpZ98z1qDl8C8LKKfS+kzly67zl00i1SCRxb1tl00hfJa7Fc1dB0FxGRa1Kp7IWnRYCpzFPTAmWE++q/Jcjjd9Wr5UkHvLtBDVuEdOBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(6666004)(478600001)(54906003)(110136005)(16576012)(316002)(8676002)(8936002)(70586007)(70206006)(83380400001)(36860700001)(47076005)(53546011)(26005)(336012)(426003)(16526019)(2616005)(41300700001)(2906002)(7416002)(4326008)(5660300002)(44832011)(40480700001)(86362001)(31696002)(31686004)(921008)(36756003)(82740400003)(81166007)(356005)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 07:39:52.8324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54722509-b217-4757-4b8c-08dc01f80522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603


On 21/12/23 07:57, Akihiko Odaki wrote:
> On 2023/12/19 16:53, Huang Rui wrote:
>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>
>> Support BLOB resources creation, mapping and unmapping by calling the
>> new stable virglrenderer 0.10 interface. Only enabled when available and
>> via the blob config. E.g. -device virtio-vga-gl,blob=true
>>
>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> ---
>>
>> Changes in v6:
>> - Use new struct virgl_gpu_resource.
>> - Unmap, unref and destroy the resource only after the memory region
>>    has been completely removed.
>> - In unref check whether the resource is still mapped.
>> - In unmap_blob check whether the resource has been already unmapped.
>> - Fix coding style
>>
>>   hw/display/virtio-gpu-virgl.c | 274 +++++++++++++++++++++++++++++++++-
>>   hw/display/virtio-gpu.c       |   4 +-
>>   meson.build                   |   4 +
>>   3 files changed, 276 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/display/virtio-gpu-virgl.c 
>> b/hw/display/virtio-gpu-virgl.c
>> index faab374336..5a3a292f79 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -17,6 +17,7 @@
>>   #include "trace.h"
>>   #include "hw/virtio/virtio.h"
>>   #include "hw/virtio/virtio-gpu.h"
>> +#include "hw/virtio/virtio-gpu-bswap.h"
>>   #include "ui/egl-helpers.h"
>> @@ -24,8 +25,62 @@
>>   struct virgl_gpu_resource {
>>       struct virtio_gpu_simple_resource res;
>> +    uint32_t ref;
>> +    VirtIOGPU *g;
>> +
>> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
>> +    /* only blob resource needs this region to be mapped as guest 
>> mmio */
>> +    MemoryRegion *region;
> 
> Why not just embed MemoryRegion into struct virgl_gpu_resource instead 
> of having a pointer?

To decouple memory region from the resource. Since there are different 
commands for creating and mapping maybe there is the intention to map 
the same resource multiple times. If the lifecycle of the resource is 
tightly coupled to the lifecycle of the memory region then the memory 
region could be embedded into the struct. Ray could give more insight.

> 
>> +#endif
>>   };
>> +static void vres_get_ref(struct virgl_gpu_resource *vres)
>> +{
>> +    uint32_t ref;
>> +
>> +    ref = qatomic_fetch_inc(&vres->ref);
>> +    g_assert(ref < INT_MAX);
>> +}
>> +
>> +static void virgl_resource_destroy(struct virgl_gpu_resource *vres)
>> +{
>> +    struct virtio_gpu_simple_resource *res;
>> +    VirtIOGPU *g;
>> +
>> +    if (!vres) {
>> +        return;
>> +    }
>> +
>> +    g = vres->g;
>> +    res = &vres->res;
>> +    QTAILQ_REMOVE(&g->reslist, res, next);
>> +    virtio_gpu_cleanup_mapping(g, res);
>> +    g_free(vres);
>> +}
>> +
>> +static void virgl_resource_unref(struct virgl_gpu_resource *vres)
>> +{
>> +    struct virtio_gpu_simple_resource *res;
>> +
>> +    if (!vres) {
>> +        return;
>> +    }
>> +
>> +    res = &vres->res;
>> +    virgl_renderer_resource_detach_iov(res->resource_id, NULL, NULL);
>> +    virgl_renderer_resource_unref(res->resource_id);
>> +}
>> +
>> +static void vres_put_ref(struct virgl_gpu_resource *vres)
>> +{
>> +    g_assert(vres->ref > 0);
>> +
>> +    if (qatomic_fetch_dec(&vres->ref) == 1) {
>> +        virgl_resource_unref(vres);
>> +        virgl_resource_destroy(vres);
>> +    }
>> +}
>> +
>>   static struct virgl_gpu_resource *
>>   virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
>>   {
>> @@ -59,6 +114,8 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
>>                                          c2d.width, c2d.height);
>>       vres = g_new0(struct virgl_gpu_resource, 1);
>> +    vres_get_ref(vres);
>> +    vres->g = g;
>>       vres->res.width = c2d.width;
>>       vres->res.height = c2d.height;
>>       vres->res.format = c2d.format;
>> @@ -91,6 +148,8 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>>                                          c3d.width, c3d.height, 
>> c3d.depth);
>>       vres = g_new0(struct virgl_gpu_resource, 1);
>> +    vres_get_ref(vres);
>> +    vres->g = g;
>>       vres->res.width = c3d.width;
>>       vres->res.height = c3d.height;
>>       vres->res.format = c3d.format;
>> @@ -126,12 +185,21 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>>           return;
>>       }
>> -    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
>> -    virgl_renderer_resource_unref(unref.resource_id);
>> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
>> +    if (vres->region) {
>> +        VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
>> +        MemoryRegion *mr = vres->region;
>> +
>> +        warn_report("%s: blob resource %d not unmapped",
>> +                    __func__, unref.resource_id);
>> +        vres->region = NULL;
>> +        memory_region_set_enabled(mr, false);
>> +        memory_region_del_subregion(&b->hostmem, mr);
>> +        object_unparent(OBJECT(mr));
>> +    }
>> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
>> -    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
>> -    virtio_gpu_cleanup_mapping(g, &vres->res);
>> -    g_free(vres);
>> +    vres_put_ref(vres);
> 
> What will happen if the guest consecutively requests 
> VIRTIO_GPU_CMD_RESOURCE_UNREF twice for a mapped resource?

You are right. I think the resource needs to be removed from the list 
synchronously on first unref.

