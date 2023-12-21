Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18381AF79
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 08:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658521.1027708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDap-0000cf-9o; Thu, 21 Dec 2023 07:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658521.1027708; Thu, 21 Dec 2023 07:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDap-0000aB-76; Thu, 21 Dec 2023 07:35:43 +0000
Received: by outflank-mailman (input) for mailman id 658521;
 Thu, 21 Dec 2023 07:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvtX=IA=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1rGDao-0000a5-0Z
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 07:35:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 892025c7-9fd3-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 08:35:40 +0100 (CET)
Received: from CYZPR10CA0019.namprd10.prod.outlook.com (2603:10b6:930:8a::28)
 by PH7PR12MB7796.namprd12.prod.outlook.com (2603:10b6:510:275::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 07:35:34 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::fd) by CYZPR10CA0019.outlook.office365.com
 (2603:10b6:930:8a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.19 via Frontend
 Transport; Thu, 21 Dec 2023 07:35:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 07:35:34 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 01:35:28 -0600
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
X-Inumbo-ID: 892025c7-9fd3-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWcVoAVW8DLaqU8FyaTyLSh6UoAuTzmG/szsqxoYO93JVyhk4qvN/5jG66jZwHIejWU3TsAbj+eu+TgA0ow049i1pS102t7OyxzzHtqdCHrFza9OM9JHPdf04WDMP8+O0hrVsiWLBIOOPCV4TbABxGEBjBsaNcIHfvlL0ZggPrt7s2UOL7/vXG/uBgFenKRq/Wy0JQYqJKqfHLKLpiPpoMW8RumBONwOBOP4t/hn9n8Jx6tbs7crgHK4o097qJGd5cb3hfgVyDswove4opldXQuEuEV5ogPv19bPO2lksEpGOd+0551bNYtUc7L0t58Y/REBa9I9pdz9su4cUIkfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBg1RFKwfCltc2bAsEKH1SzSEPwyga35JcWmW9EZVVw=;
 b=ON3dX1aVTWQu482p++VHBa/nqV3wwMKNC03wFLhkkhUDPfhkBMqRUDeH++mcO021FylWzaVX1ic63GHwRAvmgF7YEwKTQgs1HnGzFEGRW5Fz2j16Q+BVkuXE0mDLBVoGX9PPvrqvZVCjW1ECDc2HdfHrgPFGM7ieA5ZyEROS2PWUa7Z3W9/7Eqz9B8PYXyE+denpu3QaI9NRKlaStdtH172YE/xu9Dof+cbp5twj3Nmd00LYvjd/lJwwcDYa0N73pjYbOs3LMKYM5je2q/GCI6/pQicD3ObKT3OARafkq4CIEE9gG8EKftC+FGhWvMmW1sUycNnAM/ypxI9LMGI9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBg1RFKwfCltc2bAsEKH1SzSEPwyga35JcWmW9EZVVw=;
 b=EERJN2skj91UegvEegAmuYTn7XYJgLD7WYVAQK2kc1XoWOstLSusGdtyrrgAWjv7uDNL/H6hvU6zE2hgHxGWKGJ3Bg5wpfm7NPMorSgbpYZZdppOnYY1ZW3r+1oYau1tXhtFUF2732HB6jANdhrkWwjLI3y/vUo7d5P9GlI8Xo0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5dd37851-0b68-45ae-9843-9c1d6dc078f9@amd.com>
Date: Thu, 21 Dec 2023 09:35:20 +0200
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
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <a88696bc-2ffe-442a-a171-50e6120bbf97@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|PH7PR12MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: dc70750b-89d2-4d28-4840-08dc01f76b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5o0qTgmFvqpSsdy/FoJQMINwFegtSY0KEdezvo8bv5vcCRtp5nQoofRAyoQmIj/Vl2MfxHVig4+ojZ4Tyu1pJTvTKTnu14h3GE0iENPJ//n62+mUOPfMe6OgJ/DUVuHNHnJTB9Uyb0paO3Mszuxl4Mpyqnibya6napdxQN+Mu7j9drtv2XE0P/ZcqFnRNYKRp9pfFGNsXJgwZ4UikfqoSbSDr0GuXUKaS8uUhXpqZnoirEIpJTY6tGMA34V0KHVYRWmfVNj7N3vX2Nys2e8fXJjxKOTJpLwxuygVvXfPeEyqelUb0bU7h49CCtk6zGDpzMvOpUPVXadsB3xzYeQ2FN7CEJRzExh789SwM6vM3H8P+LO2b64LlCJc0u/Fh9s159hHYaogG3W7gfLiAGgQyjjffzYiNixPzVLXyucgJYYB74zA9SwGWDMQ1ctcbXr++dE+X0xderr7FSsnR2AwJoDsTg9Jen+vDXgOR41x1iOV34dbjVxKVmcLiyQnuzzbUuq1FGLA4YNEXs0+BaWGjsYInTBWBcju31Wm6vYjisVOcb0RbSU/aoe2CDGUyCDvTDXM0/qafc4lR9+cbv4lByWdS51BU8d9djNa6l7tIl4AQr+pOJh6e6t7dQK+vSkDY2ZKYsaTBEdX9h4oUtd0liKuNprkKDsFgZq0Lk45mAtNaEMVMpzez+PcbUzKywXVTM5IuPQkgpFtGzPAOV//MMz6DKXe86y/MY5yrp6KmlAsEzqRKuojOoGmedX1i8MmbMzOIvsRxdfrgyFwwsPalXBjw6jhrEJG72bCskh4hw007+A4wvhSi1/MVshNByUO3ahRjhqU4saoDI/TsJKyOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(83380400001)(81166007)(47076005)(16576012)(40480700001)(41300700001)(2616005)(44832011)(54906003)(36860700001)(316002)(478600001)(336012)(40460700003)(426003)(356005)(82740400003)(31686004)(70586007)(70206006)(110136005)(8676002)(8936002)(4326008)(16526019)(26005)(2906002)(31696002)(6666004)(86362001)(66899024)(53546011)(5660300002)(7416002)(36756003)(921008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 07:35:34.3059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc70750b-89d2-4d28-4840-08dc01f76b0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7796


On 21/12/23 07:45, Akihiko Odaki wrote:
> On 2023/12/19 16:53, Huang Rui wrote:
>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>
>> When the memory region has a different life-cycle from that of her 
>> parent,
>> could be automatically released, once has been unparent and once all 
>> of her
>> references have gone away, via the object's free callback.
>>
>> However, currently, the address space subsystem keeps references to the
>> memory region without first incrementing its object's reference count.
>> As a result, the automatic deallocation of the object, not taking into
>> account those references, results in use-after-free memory corruption.
>>
>> More specifically, reference to the memory region is kept in flatview
>> ranges. If the reference count of the memory region is not incremented,
>> flatview_destroy(), that is asynchronous, may be called after memory
>> region's destruction. If the reference count of the memory region is
>> incremented, memory region's destruction will take place after
>> flatview_destroy() has released its references.
>>
>> This patch increases the reference count of an owned memory region object
>> on each memory_region_ref() and decreases it on each 
>> memory_region_unref().
> 
> Why not pass the memory region itself as the owner parameter of 
> memory_region_init_ram_ptr()?

Hmm, in that case, how will it be guaranteed that the VirtIOGPU won't 
disappear while the memory region is still in use?

