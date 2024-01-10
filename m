Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED6829BA2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 14:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665492.1035685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNYvc-00076C-FS; Wed, 10 Jan 2024 13:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665492.1035685; Wed, 10 Jan 2024 13:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNYvc-00073Y-CL; Wed, 10 Jan 2024 13:47:32 +0000
Received: by outflank-mailman (input) for mailman id 665492;
 Wed, 10 Jan 2024 13:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LBf5=IU=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1rNYva-00073Q-Js
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 13:47:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9b21a8a-afbe-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 14:47:26 +0100 (CET)
Received: from DS7PR03CA0121.namprd03.prod.outlook.com (2603:10b6:5:3b4::6) by
 BN9PR12MB5068.namprd12.prod.outlook.com (2603:10b6:408:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 13:47:23 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::98) by DS7PR03CA0121.outlook.office365.com
 (2603:10b6:5:3b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 13:47:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 13:47:23 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 07:47:21 -0600
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
X-Inumbo-ID: c9b21a8a-afbe-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJu8wxq/yCzRTXYiDkyB9/EeRPsm5MMQvbCSyW6pgutLK1WMzdCsAclkOHaSpAz69JNRlXSGlFxGClcAYS+SwJ5JxtcBLeM1H+2obmcZvgFxO8IkjlNzggEUO3F91unoGZexRrBZDhP36pC3U5USRxh+Td0W3q1xQZxmojdZMqURKQiygaHZCuuAvi9n7FiTvipMRsePTvyNxnqag/07oR8A9AxkkYiV5eLhb6IiH707xAryZkrIh/KkJnP2OZRSJqyqNW7AuQ16SqqLhE8ulVh/Gvm4cezy8ABSAu4oPP6xODdE8J1nqrvp7+MUaVoImL0HOz6h4zz0LjMgksuaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSrHv1lzT0lXCtDazdwIRCT0bn/sObeZkzjPUICe1qE=;
 b=GkARfsK8R9VFAX0532xgZCwXDyCFdUxmxu0hVbOf906DYTsCIOJ4bnpzCX+HwyzldRK2tzZUNruxupK33erAlCyaOU/3x+9wPafsFJQ1wsqTY2d2rU6yNBkEmrXNNcxiphInuWz+rgE4+lhaXgmapThvt/8rNG1ix+1sVzZGjUvRouqFmSQBLqiZqEdzB1zxfGF4UfSVIT+26x3CqLBYDgbZjhL39NOrgr2jcjzXYuJEBNgvhxaB9BN5rg0Y8Z98oY0H8t1AlfV8+awg7pqbv425rTFMibzYXEBJLbli98YuMxR1hBDlNej5+Zr4XpBHl4Sf72BBzHq7IkjxNT1OyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSrHv1lzT0lXCtDazdwIRCT0bn/sObeZkzjPUICe1qE=;
 b=CTequKLlwLguoEzPQ5oh7eCZnRlu76KIXWoWOCmOMOhrEb9JhFtDj0WxCaVMPdEgT9h3MLgx3WadXJeLNw9SEMq5QTEzlgS45fdht64MZ+pdMYeXkaHgiV6VNm56gCauFTm7Nwh2zYniGmPNE1VD57eOwepqgSf3oJxGmt3q85I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ef67e4b1-3b1e-4cca-b431-cc46464700ca@amd.com>
Date: Wed, 10 Jan 2024 15:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20240110095311.61809-1-roger.pau@citrix.com>
 <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BN9PR12MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f04e96-06e4-4c49-fa5f-08dc11e2ac71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/5lQCyHcvhl2yKVw84QGhlOGHJ++j4aXwjEc0hd1weD/RsqfTFJYVXUjJmVsJCROqm9bHlA03BPFkvwAqx9p5z+9IkPV4lhysON62XyKeyfr305Yo5eM7uECWf6RvO1hhf4dCE9K9BS3MldEDcWcsgpvxywpT4Vdw6yTQ3M1Qm/7BQ5fh3LyvkYAUA27to/ziLZ4rAK4slEXIqi11sTjcyd7rA3587qCXfvY7COFPNkf/iXqLz+WEGBkI0iwR36JR6UrxLGbAiDJdSgRo6zDh2G5V6hhvbW+PWhpNrnG0pJsMq+4J4tgR/W2fCzwCLAIc3n9M18jICrpE5pYbHucb4JSQHYrTEO66okStym5RbQKJLSYeRGMXSUuyXtikpQ+nWx0iSLMJvIkTxxdzoBxQoVhzsWOvHUBV+3ZSjKfPwL0K6AyTtdwM8NN03cWEbMUhZMSHpDDYdIrkLgRohsnk61yetNbZnDv8oP4YeO76QC7wyZPzrB/rZaaM33fpz/whHJraaF0/ky0E3fGewT5RrIQbBuO6QLbXG2ZmCcbfqb5+Bwuh23My4dK2+80oj2Qw0krHfQNeoGTRImIX4Bxl0MJRuiBDqqVaGjB0086yohhs6OvNLqofHOk6bTpnNqU+CXjdktPEXHHTgNZVnUcJKjrWT8Cyxzjz2wJ8dYoY9TPu2wqGfM6iDhmtiHi5KniiXhEs9kOmFtivvwCcRB38GWgZii55YVpSR3PSHEjb8uvgl2N4W4DETcAlTEZER+H2mBoo7wQVl4POadDDgHHPC3Ucb9l6pkUK2EjfSqqWTg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(83380400001)(70206006)(336012)(426003)(16526019)(2616005)(26005)(82740400003)(36860700001)(47076005)(4326008)(44832011)(8676002)(53546011)(5660300002)(2906002)(54906003)(6666004)(8936002)(478600001)(16576012)(110136005)(316002)(70586007)(41300700001)(356005)(36756003)(31696002)(86362001)(81166007)(40480700001)(31686004)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 13:47:23.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f04e96-06e4-4c49-fa5f-08dc11e2ac71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5068



On 10/1/24 12:26, Jan Beulich wrote:
> On 10.01.2024 10:53, Roger Pau Monne wrote:
>> The HVM pirq feature allows routing interrupts from both physical and emulated
>> devices over event channels, this was done a performance improvement.  However
>> its usage is fully undocumented, and the only reference implementation is in
>> Linux.  It defeats the purpose of local APIC hardware virtualization, because
>> when using it interrupts avoid the usage of the local APIC altogether.
> 
> So without sufficient APIC acceleration, isn't this arranging for degraded
> performance then? IOW should the new default perhaps be dependent on the
> degree of APIC acceleration?
> 
>> It has also been reported to not work properly with certain devices, at least
>> when using some AMD GPUs Linux attempts to route interrupts over event
>> channels, but Xen doesn't correctly detect such routing, which leads to the
>> hypervisor complaining with:
>>
>> (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
>>
>> When MSIs are attempted to be routed over event channels the entry delivery
>> mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
>> inject the interrupt following the native MSI path, and the ExtINT delivery
>> mode is not supported.
> 
> Shouldn't this be properly addressed nevertheless? The way it's described
> it sounds as if MSI wouldn't work at all this way; I can't spot why the
> issue would only be "with certain devices". Yet that in turn doesn't look
> to be very likely - pass-through use cases, in particular SR-IOV ones,
> would certainly have noticed.

The issue gets triggered when the guest performs save/restore of MSIs, 
because PHYSDEVOP_map_pirq is not implemented for MSIs, and thus, QEMU 
cannot remap the MSI to the event channel once unmapped.
So, to fix this issue either would be needed to change QEMU to not unmap 
pirq-emulated MSIs or to implement PHYSDEVOP_map_pirq for MSIs.

But still, even when no device has been passed-through, scheduling 
latencies (of hundreds of ms), were observed in the guest even when 
running a simple loop application, that disappear once the flag is 
disabled. We did not have the chance to root cause it further.

> 
> Jan
> 

