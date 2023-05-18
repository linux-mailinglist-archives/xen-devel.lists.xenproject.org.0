Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F058C707FA1
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 13:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536289.834481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzbwF-0004H4-6b; Thu, 18 May 2023 11:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536289.834481; Thu, 18 May 2023 11:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzbwF-0004ER-3h; Thu, 18 May 2023 11:36:55 +0000
Received: by outflank-mailman (input) for mailman id 536289;
 Thu, 18 May 2023 11:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqpr=BH=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1pzbwD-0004EL-GQ
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 11:36:53 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46c447c2-f570-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 13:36:50 +0200 (CEST)
Received: from DM6PR13CA0051.namprd13.prod.outlook.com (2603:10b6:5:134::28)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 11:36:46 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::cb) by DM6PR13CA0051.outlook.office365.com
 (2603:10b6:5:134::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.16 via Frontend
 Transport; Thu, 18 May 2023 11:36:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.16 via Frontend Transport; Thu, 18 May 2023 11:36:46 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 06:36:44 -0500
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
X-Inumbo-ID: 46c447c2-f570-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDNh6cbtw3btgDQOg2ydtkySWW2aMq/MYxAt6mNGluPJLyVXAaH2xgcyVWxTL17tcnqKsmO+aZlFikr1ntEVttqsVFw/Od5ajIvtvmAAyeuz4tklj5jv2Olk7AKDlFZnzbCLPQvFYr024RHv+42dWtp8ek4v+w8bMKsO/A08mKWJ+jD3ixz3GVB0Pw1mwaaHTfqln8dPF09/xO5laddZHMFg+tIBG0R8M5zALVqeBLSSXMPbB2SUwrc+DeBW1t8CbR4vtcvuc0wUsKXYgw8yLJ52DncVr1mu6u46AAN82qusVNTXUgGU0HV0l0lOJWa5kHMrbBiWqg7R4GzaqcmIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wux/elGwQsFDhg9Q17YSCIXdkzZxCuqyVT8b3mYU6Y=;
 b=TYZNHu24YRdsn2gi9NkJgC8ob1p1UC6tn53lDhs+jjyuOAEjiRrOYhUpsgAjVrcidAH0ngMKTpNFA4NoGKo0+gZjwjHkN0+kGhtEmQkAOOzh7jqYL+6X25+eN6U9s+N5D4kUK4hchDIgGXUVTyKmvy5mTQ46Y3ptMBdMXPE8mdBJdXOvUrAGW1nPiLrpx5qgirvnuo+hBDH7jHVA0Xdu8te9YDSiPJMGJs2kRQgN1XBttRXXAWFDLMijvkaEoiqBdMpsu70PAWcu1kEj0haULBBh188PiJ0U/EQRHDTkvUA7w3PpMS0W+sMu1U4EP+D4kABe1zbzubaH55pk/u9J1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wux/elGwQsFDhg9Q17YSCIXdkzZxCuqyVT8b3mYU6Y=;
 b=iA571Hy4+jDHKxJBTMJZAgyoX76ICVVVHdE+W1RtQYu0Yuj3n6wikgYZMUro8Na+TmIwwX7qaXZPqizXi8c9F0+mCD5n6S6hmA+s06zlYnsiBr3wI1dnGi5pmjg/bdKikpqi4GsHm4S+TLyrbIrqcMy2Z0PSs/uYt2sl4yK14i0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <001b153d-1148-e9d1-e69f-da689a9f395b@amd.com>
Date: Thu, 18 May 2023 14:36:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, <andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
 <6f3f4e12-ae5b-c58c-891c-fbce08283206@amd.com>
 <ZGXwYsOX44/EBI3x@Air-de-Roger>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <ZGXwYsOX44/EBI3x@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT009:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: a42085cc-01e6-44ba-a7bb-08db5794296b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RXjkqC8PgA4pRObJbWuKgH1gjNPvLvc0TQdzX9GEeNRGqUQ7/07ANRsZhc0L+uSdFsnXzmt7zuY76UdcAf4DNUAPOE4NNHSrTdxtu7otz8r/Tn0PbLMC88bJEoVRamR5eGpNYP3s/jeOwG4wN+2LjhlaSnh38uALJwwu/aK9n7uV9MEuMfipXeFxq0w93K0YJTW+9l5tMG4vyMbD2V47lnjBB5RtGaPLiTZ0whCKkqsI4cJAjKz58oFkL40k6GFmjQKvCtCPpFnhgrgJIrHYYAJhOWIulVuuaJjQo7+EsgOOSoqoP4r7zViCccSwJjUH93dznwpgqdIoblQtrxCZtI9/X+L2vt5lOOcDPrQ3Az8lK0BDjcffytTlD4U7n0s9K1ZsZRMKPx6PSRpBK9zZvpz5RYZRBro6yro41YuJGWhgLKPP/v0z795tL/tX3N6sj30BRFrbF6QGzvz9SR+MlnC+N+u/wOf9+/mZONSlrMzAQIyW0LdeXu1yQNhSMRWrTf0VjH6wqX3u4t1E5QpL28ZeFXO8chwAT+ok0XVSLhPfRCvzInHgIZ6lm2Z8fYnmYsbXnEQleSuG36oZKcZXoS7114hBlI5sHSTrA66Oqt2iRn/WxEbBjozd4YrVKc6gurk8X6ob3GIvrVgX+yQ4uy0Oy9Dg0K3VV/br0MTZ/X/KeCbs3pwDCsEXzaxrSVRl7lYtmdOz8r0yvouRz4LRg4EDvuB9yZFPtuPhgTvj5W0PbcmyiBIHVuILothtrsZiDN3Jj5BYDgtipnKp5UX/alE4T1JWyf98j/CU/8wzbVpr9tMjZdvJkM8PzKevgY3b
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(31696002)(36756003)(16576012)(6916009)(70206006)(478600001)(4326008)(316002)(70586007)(54906003)(336012)(6666004)(40480700001)(82310400005)(8936002)(8676002)(44832011)(5660300002)(2906002)(81166007)(356005)(82740400003)(41300700001)(186003)(26005)(36860700001)(53546011)(16526019)(426003)(2616005)(47076005)(83380400001)(86362001)(31686004)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 11:36:46.3817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a42085cc-01e6-44ba-a7bb-08db5794296b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650


On 18/5/23 12:31, Roger Pau Monné wrote:
> On Thu, May 18, 2023 at 10:24:10AM +0300, Xenia Ragiadakou wrote:
>> On 15/5/23 17:17, Jan Beulich wrote:
>>> On 13.05.2023 03:17, Stefano Stabellini wrote:
>>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>
>>>> Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
>>>> the tables in the guest. Instead, copy the tables to Dom0.
>>> Do you really mean "in the guest" (i.e. from Xen's perspective, i.e.
>>> ignoring that when running on qemu it is kind of a guest itself)?
>>>
>>> I also consider the statement too broad anyway: Various people have
>>> run PVH Dom0 without running into such an issue, so it's clearly not
>>> just "leads to".
>> In my opinion the issue is broader.
>>
>> In pvh_setup_acpi(), the code adding the ACPI tables to dom0 memory map does
>> not check the return value of pvh_add_mem_range(). If there is an overlap
>> and the overlapping region is marked as E820_ACPI, it maps not just the
>> allowed tables but the entire overlapping range ,
> But that's the indented behavior: all ACPI regions will be mapped into
> the dom0 physmap, the filtering of the tables exposed to dom0 is done
> in the XSDT, but not in by filtering the mapped regions.  Note this
> won't be effective anyway, as the minimal granularity of physmap
> entries is 4k, so multiple tables could live in the same 4K region.
> Also Xen cannot parse dynamic tables (SSDT) or execute methods, and
> hence doesn't know exactly which memory will be used.
Thanks a lot for the explanation. I checked more carefully the code and 
it's true that xen does not aim to restrict dom0 access to ACPI tables. 
I got confused by the name of the function pvh_acpi_table_allowed.
>
> Xen relies on the firmware to have the ACPI tables in ACPI, NVS or
> RESERVED regions in order for them to be mapped into the gust physmap.
> The call to pvh_add_mem_range() in pvh_setup_acpi() is just an attempt
> to workaround broken systems that have tables placed in memory map
> holes, and hence ignoring the return value is fine.
In pvh_setup_acpi(), xen identity maps E820_ACPI and E820_NVS ranges to 
dom0. Why it does not do the same for E820_RESERVED, since ACPI tables 
may also lie there and since it does not know which memory will be used?
>> while if the overlapping
>> range is marked as E820_RESERVED, it does not map the tables at all (the
>> issue that Stefano saw with qemu). Since dom0 memory map is initialized
>> based on the native one, the code adding the ACPI table memory ranges will
>> naturally fall into one of the two cases above.
> Xen does map them, but that's done in arch_iommu_hwdom_init() which get
> short-circuited by the usage of dom0-iommu=none in your example.  See
> my reply to Stefano about moving such mappings into pvh_populate_p2m().
Indeed, if dom0-iommu=none is removed from the xen cmdline and qemu is 
configured with an iommu, the issue is not triggered. Because 
arch_iommu_hwdom_init() identity maps to dom0 at least the first 4G, right?
>> So even when not running into this issue, pvh_add_mem_range() still fails
>> and the memory range mapped is wider than the allowed one.
> The intention of that call to pvh_add_mem_range() is not to limit what
> gets mapped into dom0 physmap, but rather to workaround bugs in the
> firmware if ACPI tables are placed in memory map holes.
>
> Thanks, Roger.

