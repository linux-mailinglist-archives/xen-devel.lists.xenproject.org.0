Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA181B054
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658581.1027809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEUS-0002KI-BP; Thu, 21 Dec 2023 08:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658581.1027809; Thu, 21 Dec 2023 08:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEUS-0002HX-7S; Thu, 21 Dec 2023 08:33:12 +0000
Received: by outflank-mailman (input) for mailman id 658581;
 Thu, 21 Dec 2023 08:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvtX=IA=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1rGEUQ-0002HR-7a
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:33:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fc50a40-9fdb-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 09:33:07 +0100 (CET)
Received: from PH8PR05CA0006.namprd05.prod.outlook.com (2603:10b6:510:2cc::6)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 08:33:00 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::e6) by PH8PR05CA0006.outlook.office365.com
 (2603:10b6:510:2cc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Thu, 21 Dec 2023 08:33:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 08:33:00 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 02:32:53 -0600
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
X-Inumbo-ID: 8fc50a40-9fdb-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2kqBsc6/pJrcm6fkSuBiwdht/yZb6O1VCINraGYMZWbPgTs4JkVlfOWx08n53muCCVV8rpOgtpl6A3ID10daAR5B43/YISetwFenBHl3GQgPAvg3b+Ukf3FcAQbU7pipQXKzdpeRiKI+zYj1QGyrogpPhiH6UDynu0IWYP5IWFEL+ErNk8od6Z8ymhoQ2LTbDQmHifEGgZabKNUD5cbDoDFSTIGchLBa4l+3OYyOk1knFRN3HDBlgEGGyKjGjWXZRFJviyiCyxjuMe8R6+LvJpKbtbIulThn97KDvKEvyT2TwRTmb8YDyI46dL0qBYAxN2uL89Zd59G0uVF0oX+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcbzJeiJWqGCnCp0vymg2jp8IhUW6vzoPGdNpIMVjzk=;
 b=ahM8Y25zSWxVfxdtxjvh3szXphDPNhcqk78zAq6Q9aqzZh43DT+Xti+qS88tJpnl6pL4Niu80M5SDJlAHF/gFnxcP6jJsukmUMM2htRQFR58FnyDYKTVF5ZttoG0a58OREhxFvCBox0cFIKxsQW3818n/MaA4+oM5UsGIQn0kQn09ZfgkaSsG3zq7hwrUXP/9DY9qVUAi9xupprnQZR/lAfyoNqoyB3JDJ+gpFuPhZR3upO3RsYMYFeF/vPlKc1WvHlN3bu1nWUmQYh6schTyC0R/QVwm/PXv6U4jIj4gGh9eZ3CrSfF+dJv17t3ulwuaNXg7wwxFRMthmrQyedQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcbzJeiJWqGCnCp0vymg2jp8IhUW6vzoPGdNpIMVjzk=;
 b=K1hIv1/JH+XaZBcvfgIH3X0i+kKhjvpkV2Ijwl2EKeejp7ahUL5Yod0NYVZxoeKN/3oe4wTJyNBm8qS7uW5/macUihPyVvBzmjzTDew/zmrE3FTKQIgdV9qQttAHc4NN9gobWHcMMwTd8hgau1TnVOrBboNsPrFFJZpTqbVSINw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <954fe5c2-d5a0-4d32-b822-ba370bc2d09a@amd.com>
Date: Thu, 21 Dec 2023 10:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] softmmu/memory: enable automatic deallocation of
 memory regions
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
	Julia Zhang <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-7-ray.huang@amd.com>
 <a88696bc-2ffe-442a-a171-50e6120bbf97@daynix.com>
 <5dd37851-0b68-45ae-9843-9c1d6dc078f9@amd.com>
 <9fb98128-eada-4a50-996e-b442ce8035cd@daynix.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <9fb98128-eada-4a50-996e-b442ce8035cd@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f47a52-00f5-4c4e-bcb0-08dc01ff70d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2OUlve4a5z60dhgygc0Lq94UiPVsREJUh7lB+tiAgqV/DDe2OHu30FMpFzWiBHpSb5K3YNaq6b2N+DAOB2zQNAcBnFSVq46jjly3v/7OIF1f+UsvjQXSmioGsNkbGVqDudr9B4NuKL2mH5ErWtdgnH9Zs/EN/d2Te48AP9idkF1RD9kBi70VigOIJZaiPJyJBLIiPDYpVDbQG3CYgJwZD5+ODRzBhdYy41p7q4NUI0C/i+O/Tlv72+TVFupw+abQV/u/6VExu4GWges5i+bbXL6N79Hs6DjP9N5vZ4T+Uvu1c7GrjpkZnt5WR0500yxvjBFkecVz6OmcCUG7cM+0rNhdpwbUby4j84YANAaaGcoLU9LmyKaX0NOFdUSXBnFi/D09RXF2ZR08CG4s1I0rDQwzuURieGsCR3QNIqXCXSJWriBCvWBY1+KcHhnNwCohEfgabD3D0SiDwjYZcRhgwIU+pjpdwOfOdVec/3rBigCgYqB5fIJNLdP2B0Thqv9kSc/Kp+h6vEYdJDJ8iWEhH7JNX7I8jdxSg07Sgla7vPUO2pahdExBnMKqqybwuYem4tvm5aw++/DR6Ov0jDRrN8iEJL0M7hxHZrAsX7ErFqxD75Ol8y8y6eXmVpxBNxzf3g5g2V7CY4wfOksYQVWU+RqbpzAtg3I+YK9Sn4mwiDzlOyVIZ4oO1y1vqrwU4NCvEO+qAlKI+iStPXiF94+4+OUr8yD0X53V/7s/YIYSnv05aBEtGwim3aIibG62lPW2LlP8jzcyKT1i7vHyoFK2+c06dHhA99e/Kd+1YUIIo8/wMdPbg0JCEGj7aiwvov/acCiJMxfnPVBjrThyfpFhONsN3hgdmNJaV7saSh+Fbo+QrvQA2Nd2eZJdygbl+jL8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(46966006)(40470700004)(36840700001)(8936002)(8676002)(4326008)(316002)(16576012)(110136005)(54906003)(53546011)(40480700001)(47076005)(478600001)(2616005)(31686004)(40460700003)(44832011)(921008)(70206006)(70586007)(36756003)(86362001)(26005)(2906002)(83380400001)(66899024)(41300700001)(16526019)(5660300002)(336012)(82740400003)(356005)(7416002)(426003)(31696002)(81166007)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 08:33:00.0552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f47a52-00f5-4c4e-bcb0-08dc01ff70d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652


On 21/12/23 09:50, Akihiko Odaki wrote:
> On 2023/12/21 16:35, Xenia Ragiadakou wrote:
>>
>> On 21/12/23 07:45, Akihiko Odaki wrote:
>>> On 2023/12/19 16:53, Huang Rui wrote:
>>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>>
>>>> When the memory region has a different life-cycle from that of her 
>>>> parent,
>>>> could be automatically released, once has been unparent and once all 
>>>> of her
>>>> references have gone away, via the object's free callback.
>>>>
>>>> However, currently, the address space subsystem keeps references to the
>>>> memory region without first incrementing its object's reference count.
>>>> As a result, the automatic deallocation of the object, not taking into
>>>> account those references, results in use-after-free memory corruption.
>>>>
>>>> More specifically, reference to the memory region is kept in flatview
>>>> ranges. If the reference count of the memory region is not incremented,
>>>> flatview_destroy(), that is asynchronous, may be called after memory
>>>> region's destruction. If the reference count of the memory region is
>>>> incremented, memory region's destruction will take place after
>>>> flatview_destroy() has released its references.
>>>>
>>>> This patch increases the reference count of an owned memory region 
>>>> object
>>>> on each memory_region_ref() and decreases it on each 
>>>> memory_region_unref().
>>>
>>> Why not pass the memory region itself as the owner parameter of 
>>> memory_region_init_ram_ptr()?
>>
>> Hmm, in that case, how will it be guaranteed that the VirtIOGPU won't 
>> disappear while the memory region is still in use?
> 
> You can object_ref() when you do memory_region_init_ram_ptr() and 
> object_unref() when the memory region is being destroyed.

It is not very intuitive but I see your point. This change is quite 
intrusive and has little use. I think it can be worked around in the way 
you suggest.

