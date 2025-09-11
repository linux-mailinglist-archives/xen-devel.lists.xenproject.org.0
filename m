Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00659B537D0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120450.1465383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjHR-0006eL-8F; Thu, 11 Sep 2025 15:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120450.1465383; Thu, 11 Sep 2025 15:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjHR-0006bw-5a; Thu, 11 Sep 2025 15:32:13 +0000
Received: by outflank-mailman (input) for mailman id 1120450;
 Thu, 11 Sep 2025 15:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwjHO-0006aJ-T7
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:32:10 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2417::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a6dd684-8f24-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 17:32:09 +0200 (CEST)
Received: from DS7P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::8) by
 SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:32:05 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:1ca:cafe::b4) by DS7P220CA0010.outlook.office365.com
 (2603:10b6:8:1ca::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 15:32:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.0 via Frontend Transport; Thu, 11 Sep 2025 15:32:03 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 08:32:01 -0700
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
X-Inumbo-ID: 7a6dd684-8f24-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfio6a7V2FBazFxUOkTs0mLztMOftOc8jYcdwmPPR3+O1cffTgArYTADqCRej2wIhXyXbIGGbW26G44e9BWD52RVJngpqi56jydfi59LykHIWChkPFXWT8abaDuCs4n4eu5RE6Pbp9kMYXwqgv3PZimr2EGZycFcHu8KtSAcRl5Ict7kM4HxEtskwyrTNG5UW/+UxJ1j1Bn5Q6WXL+QVf9M0qcEncTSmw2SnV/o6XYk4EBH/pHDgjzMsMp3EkzrAeWxPXX/BGfRBShepWJQzInGbymq1oao8FQhSR+E+ILwBTpk33Mv0maOwXIkEY9luMkY2UaKijmhWDhH8v8A3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzoORT5Alnot4yZ8c1Uh06435a7QtoSb4OjfRU3o+QY=;
 b=vAIxN/NDzHuLLhZNKg0q26lSZQnOAhhmcew5WfjpaYD2h1KaP2ecxl0yKSBcJbx0WXy5Lp/KdufCZfKgPkKuEOCWMny8DFJc5B2dAdWS1ylcqXbkry6XYg6x1KwssuatfbCRmbnRlvmODx1CxiLxaSJWc5jxlzfSH5VGwHsmej7EKraqWW6QLuBWAiKhwufcBFjQsYjzQX4XH1rLHLqJhyDQqwWWNoC6jk9w8PeXh1KWklMfPu5N6ZqDH9kn2FFWFbLlwY3QquqcKAO1RM1UvTQBuHmaxavYgFdTAu98EztqS/rSUX3Xr8QPOaAWv64M/3vUeJG+w79ZYwzG7AgSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzoORT5Alnot4yZ8c1Uh06435a7QtoSb4OjfRU3o+QY=;
 b=jYZ0jYZr60rKlxwmthia7rKNB8reUVbS46lsiIhVff5+4rcUOGPH6hq6xPXG47tQttz61ZJvyyriv5yK3YhMbtBH/lRGn42Z8cjKJwlrt/0lZiNRFI92ApWKCRfD40CAKOeqUZaLshZ6omWr7VifPkNGJdszFNIizXyEYlhu0No=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 17:32:00 +0200
Message-ID: <DCQ2VHRX64BT.OC19LF2SJXFV@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
 <a62ce5aa-6f2e-457b-bf4b-49e6b7f6eb7a@suse.com>
In-Reply-To: <a62ce5aa-6f2e-457b-bf4b-49e6b7f6eb7a@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SJ0PR12MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: dd043868-72df-4e58-ac27-08ddf1485ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlNzM3pjYUxoVm5RYlQ0cVlIZHhCNjZvV2hGeUV6SUI5NUJINUlldlNDbG9x?=
 =?utf-8?B?cXVEbURQL1ByVHBGdU5RNDIxSGRzemIzNTFEby9DK0JESUVPL2ozY0FBU1dC?=
 =?utf-8?B?N1BUREpqS0xyKzdsRjdOOHpPUzV2dnEzZFBRYndHZU9DYStSWjVGVjdJM2E0?=
 =?utf-8?B?MTkvSHMvdlg1cVAwM2RKRWl4SWJVSysxb3dBczU5Nm9XcVBnSHB4Z1A1R2xI?=
 =?utf-8?B?VFo0RjZLQVl5djBYNHdBM1V5cVhUMld4L09QRENvV05Kc2J6b0FqNzJkaHVS?=
 =?utf-8?B?US9MZWJ3Y01jZ0FrNjU2dktBT1ZJTndiWjdra3pVQ0hRV1VISWpETkZySGxU?=
 =?utf-8?B?aUpyY3dUclphcXE4UUNtbnF0VnRHMW8yV0VReTJsMmhueVhPZzBsVVprYmRC?=
 =?utf-8?B?VDByZkZVWUVZV2haUXhrb2hUSUd5OW1uVjgzd2NjaSt6Nis0T2o2dnVJem16?=
 =?utf-8?B?dWErSXhoaG5LSHVVZFdyWGdWSkxGOG11WnI5aWJRVTV1dmorbEpCWHZNeUtN?=
 =?utf-8?B?aHZZYW9JaE9YRUIvTkhWTGc3dldFUnVuZm4vTmZ5WFgzb01QYzQzODN2N2Fn?=
 =?utf-8?B?bE1KVStwSUFNMEZWbXIrOVYyTkJHWmVlRG83RmZwYjJUUlFUWFh3MWFOalA0?=
 =?utf-8?B?dmNENFpncXZXdFR5bmc4Y09XZW9ZWXlMQ0VYbXJsWm04NyttVjRtQ21MZ2R2?=
 =?utf-8?B?QWtxcVl5cWlGRi9iWXNMVW5mV3BNYmpaRVlxMERLOWJxUVhJNCt4eTFOOUFy?=
 =?utf-8?B?RC9qcmluQ2c2SVhrQlBnSWtsbWZac1ZINW1YZHhZV2taQmQxUExqd3djdzY4?=
 =?utf-8?B?WnZNalVaMnoxcGJ5ZGZ6TWE5Y2owUlY2R3AycnRNR2RtWU1rM1J1S2xuVVhU?=
 =?utf-8?B?bW93OVBiUmhTa2VKWHFXTFA4NHBsUnZSeG5tMlFFVU9BamhFcTBkVlVpSWhF?=
 =?utf-8?B?Zy9tSjhUTVkxUHJ6K05ucTF0UHRkQUZBZE53WkNWc2phejRjUGZrdDRsSmx3?=
 =?utf-8?B?dzFvb1loaGUyR0d6ZXdGaHdZc1JoSUgvUFF2YzlGQnVwVlhpbytIU2JBVTNi?=
 =?utf-8?B?WU5QNUxnK2RCM2d5SnpNM2lUTDlBVDQ2bDNCN005UmlBeG94K0hGUzBTYzY2?=
 =?utf-8?B?dGpacVN1eGdpeThLZnhzejZLOHlWYmhIMTVHMm1xMHV3QkJOSVEwbW41RG9B?=
 =?utf-8?B?bUp4ODB0NnBQWS9yaTAraDhncmNRYmVieXBzK2Q1SVZzL05va05CMkNRRFd5?=
 =?utf-8?B?VTR2Qnh4NWlwWjNnTW9xUkpuU0llZElFZmZ0U3pxV1pOS3FVRCt3YTNXVEhR?=
 =?utf-8?B?cG1NYlNEZXRPL2ZIdEtTekIwcVhOQ3J3dHUwcGMyd2VPaE16aUhSQU9jRXR0?=
 =?utf-8?B?cjg2b0tuanlNYUJqUEY4SEhMK3ZyVklSSlltSmd6d29aYjBMdkFSWmszRmV1?=
 =?utf-8?B?TDJWaFlTRXYrOFg3cHpBSjdPN0hyc0VLeDFlbTl5R2x4aHpyd2ZQYmNHc3dp?=
 =?utf-8?B?cDNPMDFhWEFRWjBEZ3NqQXFoYkpXZWR6dzlVbDc1bUxIZ25xTHg1dm1oTVM4?=
 =?utf-8?B?UVZWeW5OTWdiM2NORVRCOFpEU3JxUDczczlQR0VyV093a0NqZGNWeG9KS2Fn?=
 =?utf-8?B?U3ZPRzlwVmVGWmQrcklpaDNGZS9nVEdZaHJjOHl0aW4xUHdFMEVlbnlPWEtL?=
 =?utf-8?B?LzB3d1cxYlZqdnU5OUJWSFVyaTg5bXhZTE5tYmxDY3pGMzZOa2F4TVlsTDRz?=
 =?utf-8?B?a0xRY0E3dkNDNmg0V3dWdW1PdWd2eGV1d2dZcjdycks0ZHlBMVRmUzlGV1VE?=
 =?utf-8?B?U1c2b2VOTkNWY0F5MGhzanFsS3JuQ0xzNGVpb0FSUU1laExwVm1aZWl0eWdZ?=
 =?utf-8?B?UGJraUFzaytHM2FVWXlTc2pCK0lheGdVQWJWMkgxWm9TUEt1QWp5Qm9Uam1C?=
 =?utf-8?B?SWlVZCtzc3RGd3FkZXExMHBRUWRjVkZaTkFpbFNEOWdySmY1Y3hZQXMzRUd5?=
 =?utf-8?B?Smdrei8zNGdsU213MFZ1ZE5SSHdCV1ArcUc1d0VpWXQ4QjBZV044dHlDSUVE?=
 =?utf-8?Q?gl16l9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:32:03.3718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd043868-72df-4e58-ac27-08ddf1485ba9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5673

On Thu Sep 11, 2025 at 4:52 PM CEST, Jan Beulich wrote:
> On 11.09.2025 13:53, Alejandro Vallejo wrote:
>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
>> by the device model. The GPE handler checks this and compares it against
>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>> related bit in the bitmap and adjusting the table's checksum.
>>=20
>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until i=
t
>> reaches 128, even if that overflows the MADT into some other (hopefully
>> mapped) memory. The reading isn't as problematic as the writing though.
>>=20
>> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
>> then the bit where the "online" flag would be is flipped, thus
>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>> that happened outside its range. It's all terrible.
>>=20
>> Note that this corruption happens regardless of the device-model being
>> present or not, because even if the bitmap holds 0s, the overflowed
>> memory might not at the bits corresponding to the "online" flag.
>>=20
>> This patch adjusts the DSDT so entries >=3DNCPUS are skipped.
>>=20
>> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
>
> The code in question originates from e5dc62c4d4f1 ("hvmloader: Fix CPU
> hotplug notify handler in ACPI DSDT"), though. Before that there was a
> different issue (as mentioned in the description).

As you mentioned elsewhere, it probably is 087543338924("hvmloader: limit C=
PUs
exposed to guests") that matters. Until then the DSDT was correct.

>
>> --- a/tools/libacpi/mk_dsdt.c
>> +++ b/tools/libacpi/mk_dsdt.c
>> @@ -239,7 +239,8 @@ int main(int argc, char **argv)
>>          /* Extract current CPU's status: 0=3Doffline; 1=3Donline. */
>>          stmt("And", "Local1, 1, Local2");
>>          /* Check if status is up-to-date in the relevant MADT LAPIC ent=
ry... */
>> -        push_block("If", "LNotEqual(Local2, \\_SB.PR%02X.FLG)", cpu);
>> +        push_block("If", "And(LLess(%d, NCPU), LNotEqual(Local2, \\_SB.=
PR%02X.FLG))",
>> +                   cpu, cpu);
>
> Don't we need to use \\_SB.NCPU here? From the other two uses it's not
> quite clear; it might also be that the one using this form is actually
> needlessly doing so. Yet here it may be better if only for consistency's
> sake, as the LNotEqual() also operates on an absolute reference.

\SB.PMAT method does the same thing. I'll just change that too while at it.

> The other thing is that I'm not fluent in AML operand evaluation rules.
> We want to avoid even the read access to FLG, and I'm unconvinced And()
> will avoid evaluating its 2nd argument when the first one is 0. IOW this
> may need to become a 2nd "If".

I don't think there are any rules, it's unspecified. While in practice it
wouldn't matter a lot, it's indeed better not to rely on it not blowing up.

After sending this, I wondered about having a separate if with an early ret=
urn.

>
> I further think that strictly speaking you mean LAnd() here, not And()
> (but the above concern remains; all the ASL spec says is "Source1 and
> Source2 are evaluated as integers" for both And() and LAnd()).

I very definitely did mean LAnd! Nice catch. As for=20

>
> Jan

TL;DR: Will s/And/LAnd/ and move it to a separate If

Cheers,
Alejandro

