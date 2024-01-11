Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94882A8B8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 09:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665992.1036366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNq3l-000403-11; Thu, 11 Jan 2024 08:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665992.1036366; Thu, 11 Jan 2024 08:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNq3k-0003xH-U3; Thu, 11 Jan 2024 08:05:04 +0000
Received: by outflank-mailman (input) for mailman id 665992;
 Thu, 11 Jan 2024 08:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETxW=IV=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1rNq3j-0003xB-5a
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 08:05:03 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1db1f82c-b058-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 09:05:00 +0100 (CET)
Received: from PR0P264CA0095.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::35)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 08:04:57 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10a6:100:18:cafe::fc) by PR0P264CA0095.outlook.office365.com
 (2603:10a6:100:18::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Thu, 11 Jan 2024 08:04:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Thu, 11 Jan 2024 08:04:55 +0000
Received: from [10.0.2.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 11 Jan
 2024 02:04:50 -0600
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
X-Inumbo-ID: 1db1f82c-b058-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFUGJIQ623iRtxmnyu2dgn8OmaLL0SmjnP4AFIBVqPXiVBlfUqKczuA4uGVDtLFHSj/eBaQQ3j1jlRJk/W4VbXLZ5KPisBcwr/L93ZFyz9FexXTQkCbTKyQcCigJh61W6IJ0ferRiCWFl5ImqDB1Zlh/hRSgAQ47OzgTWQnGaUpUBtvTP3hr/WNNHc1B94CZXg953ia+fv5IxQ/RZ7cNe2ukq8L5tJ8oeppY0lVLZ/GoR7wOdFmd5JQKGpXSrHUgla/kxbAPVgQaFoQCiMqjdoV0ZPlg1mP9ZXKeJvM/ZckEdSxOxH4zRMaoFrwCDM6DBXK6ovz3ACQucMG8BnM7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63dLLcSSXFG5ZIukg18Lpb8wdCW0FZwbt04IsoI/PC8=;
 b=EKivEebmxPuIuJdsqsFiJYK0DBv93WRhRmAuI8LJ2b6/AgTJI4GbFoovf6ZeCQeyK+tVjdNSTRNLFZ3o1auq1udQwb8tGPpBdxjm7XREECrMdPjCipUWED1B2AgGt1sZ5LpbN4j51JbFcDbCMY92EWi2Gu3XMQFNdlDq3m8EZ82NsUpprR9hKazYdu1WxbPe6s5JSD4ZAtv3BbfHAohPmUhodtbVpXvmEuDGO0SwQkRtzcfgnQJpBL4999v2panO8BS8AkRYq9SD3JWBlbfZoHn0IGH2ibKcYJbKgd8DTOnNqB9+KP9oSyjCnez21KzoVA/OEgoh4+fI27rw6aYPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63dLLcSSXFG5ZIukg18Lpb8wdCW0FZwbt04IsoI/PC8=;
 b=1rXua/8CMsJNlo3d4aT2G6ggpNYgCF6r9WAvrJsVGCXWa8bqvHVv3z1df3l46iR2rt0D43jAiJ4fTOg+yFMawbgogBY63sZqKMjYoa9c+t738BMurV4ewmciiAFvKC2m5SMrYCx5mvhLitvvHyB5VTiSIjo7gajXp5CePjuebJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6fe776cd-3fa6-421f-9d02-9350e85d5612@amd.com>
Date: Thu, 11 Jan 2024 10:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20240110095311.61809-1-roger.pau@citrix.com>
 <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
 <ef67e4b1-3b1e-4cca-b431-cc46464700ca@amd.com> <ZZ61-SNkrKo12cwb@macbook>
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
In-Reply-To: <ZZ61-SNkrKo12cwb@macbook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: a3935e00-38b8-4c01-0aa0-08dc127bffbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	amFsIQtLlYJqmmM8FNRibTl+j830SdAPDtIf/EVDugRUe1PTGhiFezHkYZKxdtwFJXTcJccx0sjtaAwQgSwSLmlWWr4HC0cw9yLYPwmmoSHIP30ofcUmUuauXDixKxqyeCGJPOW3/7SbNh7TKoWNc3hi8S+qAEEbqn3tfhNDh0u16hCflC7Fcn+YovO6ZKBE2C9HGc3JyFwLp2/xlF8B3DxUxfLBFvZryXoxI1sB1DokXIIQFuOScmHfEMwKwNTvUOgXrYnYFHmtETSEX1aCDz0ehCUav9DsYtIaZ5W+SBO8DI9AkJX3g2PYiE6VLbsy//bZF06D0YGt61QKWYiE7VyX9z5JfExzNk4s4tDcdagQH8LPHMTvUFffnXC9ba7ZE+YhHCokV4XtHfB873XOgTdiqlWF0eDms4QAWM4pCUWuRR26XH1CLekl49PJOnxZWYpHYZ+IclDvStbex78lr7tOd9331BnKLDsTRm/9raBAiHXuixPoB8fc5AsCgzoQ/ffTBaj6g0MfjD4k0sHku47g2BycVNhXFKVSRt1ZWfCSGcndde1lbPqiEQBAu34qT3JlH4Hy7C4Cs+5vvJW2GRYjRPEQ9fP9qQuoYX3OXpU3B9yNKYbTGOYINvxMaANjyftL/vrf+KboToqpwjpGsw6es9N6BoNeEk+P8Qe05AmVR2aHS1FYcIk272xvNwW/+4EPOfL0JbTa9bTT/HO8NQ4dB8A/aZfo/83c5nlhKQzosrwCmcgeiOfZOTI9kH+19ZkHwbLs9IxdXuCtuejxZaiMn5L0UZery2haq3QsL2ZsBtAj08oMSG5/Bs+FQa1A
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(16526019)(336012)(426003)(26005)(2616005)(83380400001)(6666004)(36860700001)(53546011)(4326008)(82740400003)(41300700001)(47076005)(6916009)(5660300002)(44832011)(8936002)(2906002)(478600001)(316002)(16576012)(8676002)(70206006)(54906003)(70586007)(31696002)(86362001)(36756003)(356005)(81166007)(31686004)(40480700001)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 08:04:55.9908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3935e00-38b8-4c01-0aa0-08dc127bffbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998

Hi Roger,

On 10/1/24 17:21, Roger Pau Monné wrote:
> On Wed, Jan 10, 2024 at 03:47:12PM +0200, Xenia Ragiadakou wrote:
>>
>>
>> On 10/1/24 12:26, Jan Beulich wrote:
>>> On 10.01.2024 10:53, Roger Pau Monne wrote:
>>>> The HVM pirq feature allows routing interrupts from both physical and emulated
>>>> devices over event channels, this was done a performance improvement.  However
>>>> its usage is fully undocumented, and the only reference implementation is in
>>>> Linux.  It defeats the purpose of local APIC hardware virtualization, because
>>>> when using it interrupts avoid the usage of the local APIC altogether.
>>>
>>> So without sufficient APIC acceleration, isn't this arranging for degraded
>>> performance then? IOW should the new default perhaps be dependent on the
>>> degree of APIC acceleration?
>>>
>>>> It has also been reported to not work properly with certain devices, at least
>>>> when using some AMD GPUs Linux attempts to route interrupts over event
>>>> channels, but Xen doesn't correctly detect such routing, which leads to the
>>>> hypervisor complaining with:
>>>>
>>>> (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
>>>>
>>>> When MSIs are attempted to be routed over event channels the entry delivery
>>>> mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
>>>> inject the interrupt following the native MSI path, and the ExtINT delivery
>>>> mode is not supported.
>>>
>>> Shouldn't this be properly addressed nevertheless? The way it's described
>>> it sounds as if MSI wouldn't work at all this way; I can't spot why the
>>> issue would only be "with certain devices". Yet that in turn doesn't look
>>> to be very likely - pass-through use cases, in particular SR-IOV ones,
>>> would certainly have noticed.
>>
>> The issue gets triggered when the guest performs save/restore of MSIs,
>> because PHYSDEVOP_map_pirq is not implemented for MSIs, and thus, QEMU
>> cannot remap the MSI to the event channel once unmapped.
> 
> I'm kind of confused by this sentence, PHYSDEVOP_map_pirq does support
> MSIs, see xc_physdev_map_pirq_msi() helper in Xen code base.
> 

Sorry I had to explain it better. For an HVM guest with 
XENFEAT_hvm_pirqs set, physdev_hvm_map_pirq() will be called, that has 
not support for MSI.

>> So, to fix this issue either would be needed to change QEMU to not unmap
>> pirq-emulated MSIs or to implement PHYSDEVOP_map_pirq for MSIs.
>>
>> But still, even when no device has been passed-through, scheduling latencies
>> (of hundreds of ms), were observed in the guest even when running a simple
>> loop application, that disappear once the flag is disabled. We did not have
>> the chance to root cause it further.
> 
> So XENFEAT_hvm_pirqs is causing such latency issues?  That I certainly
> didn't notice.

We 've seen that in a setup with an HVM guest using emulated MSIs. We 
were running an application, like the one below, pinned on an isolated 
and pinned vcpu.

int main()
{
     struct timeval cur_time = {0}, prev_time = {0};
     int diff;

     gettimeofday(&prev_time, NULL);
     do {
         gettimeofday(&cur_time, NULL);

         diff = (((cur_time.tv_sec - prev_time.tv_sec)*1000) + ((cur_time
.tv_usec - prev_time.tv_usec)/1000));
         if (diff>10)
            printf("app scheduled after: %d msec\n",diff);

         gettimeofday(&prev_time, NULL);
     } while(1);
}

And we 're getting values of hundreds of ms like:
app scheduled after: 985 msec

> 
> Regards, Roger.

