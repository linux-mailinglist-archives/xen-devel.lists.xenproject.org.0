Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317CEA9EE70
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 12:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970470.1359153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9M9G-0004lX-Vk; Mon, 28 Apr 2025 10:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970470.1359153; Mon, 28 Apr 2025 10:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9M9G-0004jp-Sz; Mon, 28 Apr 2025 10:55:42 +0000
Received: by outflank-mailman (input) for mailman id 970470;
 Mon, 28 Apr 2025 10:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9M9G-0004jj-Az
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 10:55:42 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20630.outbound.protection.outlook.com
 [2a01:111:f403:2409::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 523f6d34-241f-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 12:55:40 +0200 (CEST)
Received: from CH2PR05CA0057.namprd05.prod.outlook.com (2603:10b6:610:38::34)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 10:55:35 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::ff) by CH2PR05CA0057.outlook.office365.com
 (2603:10b6:610:38::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 28 Apr 2025 10:55:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 10:55:35 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 05:55:32 -0500
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
X-Inumbo-ID: 523f6d34-241f-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeRqPJeYdHXYfj0C73rB1bko4bZcFmo9ZVNa5SjSsmjQE9M7KQGy2umvbKMSwbvcPEBrSCZVdVWgbb7WI6uuQA8Wh7Q1xbgcdlhej+JZ5YvIFo75YCjmZXS8tFCKTud2HFTJuaR4TMhhPnFY5dABprXnPeZDiWcGr5wyBZn2PDpyAS7oNOQioODRudhZo37/PqK27ghVYzf1rr/Y5LB1LHC+xO9F1fapDKxx8RDmQjkH9R62J0NE4yLcCxVfwGeQ0U879dDAdNhZDh4M2ByBmn3YY7bttPvQNRbgFWYaepqt2lzvTO5cPvdQwZod+4KO6CP8LaiKnpiGTQZHO5mGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeVSj8Toeugrd8LwPFHvqKGuQ6AYaqOfbxEjmhlPk9A=;
 b=V8dt5OeZv1ZAcs/SjPpA9cwtwcaHcCBL8wnX+UkygIgKQGiI4C+qkWNsSj8F3sqSIixCO/rMuq7OiWnEUi2VRvbnFxQ5QI7hTwjewG2e8cU/Te6B4kCG81jA5utbb6jrr7pzkcI12Dja+ri0qYYN0CWBYIfTUai35D9BT5Hn1yT72S7nwq05pn4dy7IbGfRfBwPGcDT+ji0y0T9Hxjap+HQ+7YEcWvYGNXsuBwD1S2HUvF89VwlQS5PiXKRdjBSgB5hZPM4uuA4mW3B2MLTdZHLfBmQsA5kObjbuimxDlBhNtsnRWlpl1quvhVF0+4TUqIWfgwEZtFozC9cFIH1xIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeVSj8Toeugrd8LwPFHvqKGuQ6AYaqOfbxEjmhlPk9A=;
 b=pYDm1C8P1pyamBGUsUboE/AhRRGqjyBNbxx5tCnz4IEwrTFmaqS7499fvR5kUhoSkqcC9498gSJb5tIqU5DPzkjR6R/R2iLr8txVwD0NOGHtcSv7oPBi7EU0N3jmEz9jU83e2DVN4v7rxMEWki66D1dPuL6NASskWZzh9tQ4Xbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 11:55:31 +0100
Message-ID: <D9I7TPLT0EJD.3F5P95H69CT5K@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Ariadne Conill"
	<ariadne@ariadne.space>
CC: <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250425234331.65875-1-ariadne@ariadne.space>
 <aA9NMJVbyXeMOOY-@macbook.lan>
In-Reply-To: <aA9NMJVbyXeMOOY-@macbook.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 24765bab-92dc-408e-0008-08dd86433414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnY5N1hycEZyN0lYS0F4M2xCWDJwYjU2SnpTWW9zTkoxbkpBc1UyVGlHZkJS?=
 =?utf-8?B?T1ZXNWNDWWR5VnpROHg0YmdxNDRaai9KWU5mamljcURINExJcXF2Y1VDdllN?=
 =?utf-8?B?OVB5RnJ1bjI0bWljWjlzdDNxOWdqQ3BjY2JxY1ZkT0Z4ZFZ0SlQwMzY0S0Nl?=
 =?utf-8?B?SFNmWVA5MEh0UmIxM2F0OVRFbVg2ZGRoZi90dGNrd0JHNXNmVlUyMDVNNmhN?=
 =?utf-8?B?VVFLSEowZHFVVGFieWxKdXdwaU13ZjRNL1VUZmU3WjFIOXhueTRIU25TU3Z4?=
 =?utf-8?B?eDNmMElvR0pvUHRITXhLQlJ6a1hhMUZZb2REMEtyOTRzWHYxTVc1R3g2ZHBJ?=
 =?utf-8?B?TjRCdXVCZmdKbEZkT0xxZVN3N0xtb1Z3U3AwbXlkMUpUWkxHMFE3MkVwSUJ6?=
 =?utf-8?B?M1cycGJ4c3ZZZ2RZRGtRRjcyU1hXTXNWK2ZESGk5R1BLWk14OVEyMVBGdnlX?=
 =?utf-8?B?ZTRiS2pSTmRURWdVN0F3TU11WURoM09KQldSVUMxYlVIWnc3N1dNaWVvcms1?=
 =?utf-8?B?WlYwUmpoR21QT0V4blI4bVJ4MHpxR2sxTnA0NHZ1VjFFaFZjOFJ2VEdBRTdt?=
 =?utf-8?B?cUoycmpISTlHOUkwYURkcmVCQWtwd0ZSdnMvSmxySHV6elNnQU44TDBtWFJn?=
 =?utf-8?B?Rm5wdjd2VERXS1IxcnpXYmlGZmNGcDJvb0RPclFKSW9KVUNYbkw4cG9VY1dR?=
 =?utf-8?B?YmZkbVRyNGNwUllUN3hxOW94UTIwRHFhSEVXRHhzQWlUYThxTVlBMGFndFM1?=
 =?utf-8?B?NWRsV3ZkUUE2RmxIVm9OMDJjVXhFR0c3VVZYMEUzMmFQOTRIeUpRcHJCZm5n?=
 =?utf-8?B?VmFrbUdxMlZtbW0zdzUrMk5QMkZpM0pKQVV3NXNhQ0FSR2tBODUwdHpObUlN?=
 =?utf-8?B?WkNKWk5OVXA1OGwwbVJXOVBnNUhqMDBkTXJNeE50NlQ1NzdwMFlxSHVkajE0?=
 =?utf-8?B?Y3k0d2ZpVGNTRk9DZkFBNXNHOStwK2J2ZWV4Q2cybGlicWdIUEFXSHQ4TG5l?=
 =?utf-8?B?U2pqMzgwZnZVRnNIeFgyWWdJTEtnRVd2YWRXU0wwV3dKNWJLTVZtSzkrMVJU?=
 =?utf-8?B?N3BOVk5tY1NzVnJFQnh3eWNVOHU4eWFxajkvOGVUdlJlVXcrc0pmam4rMDBh?=
 =?utf-8?B?UytGSEZLN0Jhd1BVaDNYbzlqL1EyQWxTV2lURTNQUHA3RDJUZnBQTWc4TE1K?=
 =?utf-8?B?R1F2eUgrMko4WExUMW05UVVWNVlZam55S1pZelpvLzZiL0lxaEt2Nlo4WGw1?=
 =?utf-8?B?NVJrcitYZWl1a0JMSDFYdEpCWlpmZFpudWZRcFd5SWJJbWhqeEVYa1NtcWJV?=
 =?utf-8?B?dGw2c1pubkljN09FeWthYzRidTAvdzBZZDJzZE80TmQ4VmEvZDdwWW1ab3M0?=
 =?utf-8?B?ZG95VytXL0RiR2JMaEZIZ2htamMzYmlZZHRZQzRFUHF4dmpoSGxsU25rUlVT?=
 =?utf-8?B?SEVUamd6dUNSVDZpTFFkbXlkVnoybEVIYXd6TUh3R1NieVRhOElTMHpHOHhp?=
 =?utf-8?B?RjRkVmFrSEt5YlJpK2EwQ1ZZZGVZV1pVR1E4RTR2Z0FkZEF0RlkwNndNSEZG?=
 =?utf-8?B?Y241S1V1RnNDZ3Roa3lUeVpWT0lmNWNNMDliTUdqc0xjbFJNTkNjNFBLMmZR?=
 =?utf-8?B?OHhYZFNqTkwzZDRITUhsRVlkMmVjZGlCTnBSb3FzV3pQV2Rlb25nY1hBQkZ4?=
 =?utf-8?B?YTViYy9iT1VibnRSL1V6UXcvMDZYL1BtcldvWWxPYVZiNE9IWE5nNFdHK2Ew?=
 =?utf-8?B?YkJ0Z3k4Y1RZdFlDdUFISlExRG5ickZOdjF5ZDJMNVIrczFKT2FpVWtuSUNo?=
 =?utf-8?B?eXRIcDhsZnVXcDlUbzh6eDlDb25WaVpDSTNrOFUwOU83UXpmUlNCT04rTlFI?=
 =?utf-8?B?Zys4NDhnQ3ZQcGFNWUhjYXNqRmlpeDJpYVVpSktneG5QWlJzUmhUTnRHQWRl?=
 =?utf-8?B?S0pTQzIrTTlwQ3JWZFV4UktablpYZHhpRm1PbVJTTDQrTHVxamNsNjA0b0Rz?=
 =?utf-8?B?cHlFMkdwdlFnUm10SE1Obm91RHVmLzVVRHNHRzFFL01FNkI1T1VhNXU4WnFW?=
 =?utf-8?Q?0eiUYf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:55:35.0496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24765bab-92dc-408e-0008-08dd86433414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776

On Mon Apr 28, 2025 at 10:41 AM BST, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 25, 2025 at 04:43:31PM -0700, Ariadne Conill wrote:
>> Previously Xen placed the hypercall page at the highest possible MFN,
>> but this caused problems on systems where there is more than 36 bits
>> of physical address space.
>>=20
>> In general, it also seems unreliable to assume that the highest possible
>> MFN is not already reserved for some other purpose.
>>=20
>> Changes from v1:
>> - Continue to use fixmap infrastructure
>> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
>>   on hypercall page allocation failure
>>=20
>> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
>> Cc: Alejandro Vallejo <agarciav@amd.com>
>> Cc: Alexander M. Merritt <alexander@edera.dev>
>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>> ---
>>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
>>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>>  2 files changed, 7 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyp=
erv/hyperv.c
>> index 6989af38f1..0305374a06 100644
>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
>> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>>      if ( !hypercall_msr.enable )
>>      {
>> -        mfn =3D HV_HCALL_MFN;
>> +        void *hcall_page =3D alloc_xenheap_page();
>> +        if ( !hcall_page )
>> +            panic("Hyper-V: Failed to allocate hypercall trampoline pag=
e");
>> +
>> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_page)=
;
>
> This likely wants to be a dprintk, and possibly also print the
> physical address of the used page?  And no period at the end of the
> sentence IMO.
>
> I think Xen might have used the last page in the physical address
> range to prevent HyperV from possibly shattering a superpage in the
> second stage translation page-tables if normal RAM was used?
>
> However I don't know whether HyperV will shatter super-pages if a
> sub-page of it is used to contain the hypercall page (I don't think it
> should?)

I think it's quite unlikely. Seeing how Linux simply vmalloc()s and
Microsoft seems to genuinely care about Linux in this day and age. It
seems fair to assume Hyper-V might just copy the old memory out and
rewrite it with the trampoline contents when enabling the MSR, thereby
keeping superpages together in their p2m.

>
> Thanks, Roger.

Cheers,
Alejandro

