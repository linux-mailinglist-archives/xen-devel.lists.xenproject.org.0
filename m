Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD9B5326C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 14:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120213.1465254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgX8-0003er-Qg; Thu, 11 Sep 2025 12:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120213.1465254; Thu, 11 Sep 2025 12:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwgX8-0003cL-NC; Thu, 11 Sep 2025 12:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1120213;
 Thu, 11 Sep 2025 12:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwgX7-0003b0-LL
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 12:36:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2417::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e10265be-8f0b-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 14:36:03 +0200 (CEST)
Received: from MN0PR02CA0019.namprd02.prod.outlook.com (2603:10b6:208:530::34)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:35:58 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::72) by MN0PR02CA0019.outlook.office365.com
 (2603:10b6:208:530::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 12:35:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 12:35:58 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 05:35:57 -0700
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
X-Inumbo-ID: e10265be-8f0b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng+LSWqDkkqSb30MbdOJEKGuu9m0SkWT+aRXABKpG6CJlURyEVEIpBzISJ//asqLvAc35Vu0Qs5PACZUzmi1T9o9KOMxIOZUfps2R3KH/VwAdTAa3i+RBijP+QLClMvWxFLX8mtILB5gP8JFadx5O7EqyYjw0PLsDpV3SC0UNY3wqki7DcGGNF6XqOXEwREgdTiAV7/C8ex+kMr/62X2rkiWHT2iZZ5awrWhZh1v5/TDrvRSHSvAiTKd6YPUGfpxIAtWeE0HCDnW+AHlo2490rzydOuhlLGc6TTcCnsgTK8wtLwN0XkWiIud0vqPDgOGM5s2Mi6MAPgJe3Ed1erZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYBsyTbeLIqtnkUldpoqCbwHqVEi3abOMhzuF8zI7Ak=;
 b=xpqbu0+ysLPNMlskt3qin3PmeXxAOKq4HmHoGbB6JCfLZircYUe2ksIIDq/wVcaTLdluLMi/jy1eW+okAxTfo+H/nuH2an9ar98//x6dia3FfEIq5PFLvs3uqsuMNTW1sfFyColw/yzCxNGEBcBZCIT0pWuVG+B62JmU037zFDlQAdGfvNZ4fs3BacQzq1YFpuRrOOImubCQ5jWMyNWwM5YQ8Y5JYLU8kk7WgPeadeH5jaGgv7PyNoyHVI3DZdfKsHllmvLlVgh+Ispj6c8N7pcwetNV3VNlZqZicCfzV7cID2ZVEgKYZFBBsa2Pa0jH8mXnM8ULS4oqj36x7+zyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYBsyTbeLIqtnkUldpoqCbwHqVEi3abOMhzuF8zI7Ak=;
 b=1hmhAdPZD6PzfYnR5eb8ZOPflQSs/tlWDbnKlLCAIT8nFoUM8pYJASPAhONznfwNtpkrPn6YTy/m3/CG7nIKq2/aqgPbSGBdQtT6FHhy3UxGeeOa83m6suuZ03PEs5HL5aDsHCUF4y+Qo33+NekrtIoqjAq6ZXQKvnJUoa8Stpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 14:35:55 +0200
Message-ID: <DCPZ4OKQIQDP.2KSJ8IZNXHCXB@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
X-Mailer: aerc 0.20.1
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
 <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
In-Reply-To: <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: d3abc0ab-8073-4918-2c56-08ddf12fc287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bytYalVtWitDa2tpd1g0bVA2REQ5dUpuK3FMNkhCamlsNFlJNk5zTmZYMWty?=
 =?utf-8?B?ZlVIUTA3QUlJZU4wVS9WNnhXbGNJU1VEWStEcllpbnUycTdqRGc3L21uU0V3?=
 =?utf-8?B?T3FCODgrUjd3Y0xPSm1QZmZWUndwUjlZWEhDMG53UkpZcFovWkRJZWlNMjhx?=
 =?utf-8?B?RXNmeUl1R1psSzY2MzJGUEpDK0FVT1I0RXdISTFWZUdoTExqY0tUR3oyNURl?=
 =?utf-8?B?RGIrUk5oZFNacVcyc0lwMm84TVQxTTFIRSs5Qno4VCtJTEF0V0RNRFN0WWNM?=
 =?utf-8?B?dFJaRW80QVJxM1AxelBHSlo1d2w1VHVBVWZXZ0RIQXlYSWlQVkY1a2VmWkxs?=
 =?utf-8?B?UHUwVlBQOTBhWU5ET3gyaDNCR084ZGxxdldzWVczYmt0RzhoSmNTOHVjVnE0?=
 =?utf-8?B?TGl1WlBwZ0xVMG5iZ0UzZG8vQ2NrZnZMb0xBc1J0S0VNTk0yUytmcXVqMlBU?=
 =?utf-8?B?VXo0SDhnM2VGTzRyYzR2WU11ZVl6c2lpbDVmQXFUWFMwZnZ1UEdZUTd5enVs?=
 =?utf-8?B?ZzBWRkR1c2F4RGZiWTNWdUpoTy9nNzJsTVY2MTI3dG10a2hoTWh4VFZXSXlq?=
 =?utf-8?B?c2lOSG1xUEFNb05IMWxEeEw4aTVrTDkrcHY5ZHhMWjJ2eENTTkJyWnVyRVBm?=
 =?utf-8?B?aHdoYkZtei8xWmhXR0FsdW1OOEh5eUcyUENRenVZTTNUYkN3MXpaZDFtNkNF?=
 =?utf-8?B?L3BNY256SkNOODZQTmdhQ3dKak5hSEg5Q3NIUy9QcUgvNzhJRDRUbnhEazl4?=
 =?utf-8?B?V21pTFJzNDJzREFDaUJCTlpZRGQwRFJ6YW8xK0x1bk1lUGs5MzVockJDMW4y?=
 =?utf-8?B?Z0JvVEVpdVdMb3R1NEpXamxHSElkeXBPQnpOOTFlckNsdTFaajJjMWV2NjVK?=
 =?utf-8?B?NHk1QTVpWUlaN2J4azhnNjJiVnllU3B5ZWxJTmNJVWgrM1ovQ29ndTZMSkJN?=
 =?utf-8?B?aHF1UXlWMVY5OG9JZ3BGdnBLc3oyblVkdjVXL1YrZjB4ZWF1dlpBaTMvL0kw?=
 =?utf-8?B?eWZIY2VRaWFjZklub2hMOWxVYlVlQ0RLcUxlUDRiSU8xb0hKUjdSVmdrNVBZ?=
 =?utf-8?B?K0NpeDhpMmdFT1lEMkRHeGZWY2N4dE9CRXJrT1JHS2hkeXBNanJPUk5Nb3p6?=
 =?utf-8?B?SWdUcFFzSnJNMVpPUnZITFVBaTRsRnFiNHlDdzB4a3g0NGRXdkxYOTQ0ZGZJ?=
 =?utf-8?B?aW5kNThnWEEvTy9aNmVGdlphMEplYXJOTW9PclFDenhZUVhralZRVmNiZjFI?=
 =?utf-8?B?Yyt3bXpTVW0zQWh3Mnh3UVFwTUsxZzlsWHZHSXJQdVdidDdkZTRNZFczd3Y0?=
 =?utf-8?B?eUR1Tkk2czlRU0VWMDJMMmorWmJ0cStpL2ROTDk1eTFCTitjdkFDN01QSUk2?=
 =?utf-8?B?aW9tdHRRRFpxNmZRQkRvQW0wSjhLY1pGRXNGM2Q1eDlqYjdHcy92OGpGS0x4?=
 =?utf-8?B?QW5UOVMwampEdWI1ZG16WmcrRFRrUTh1TWdDdGpJbXloU3dmQ0xFZlVMZEd3?=
 =?utf-8?B?ZzJ0OGlkTFFTMUlJd2tXd21pYmI5NUJXNlFhTmNLMFd5TlBMR2xISTF2Z1Fa?=
 =?utf-8?B?R3RNVHVrK1pnY0hOMFY0R3NQaGUvSlpWYVRwcDVsaTllbGhMOEJnL3B3MVZS?=
 =?utf-8?B?dFNGcDU2NVlkb0RuWjdaY2M1ZjhyaXRkYnBVSElSTzIxb0xXaFF6cWpSWkRP?=
 =?utf-8?B?a0FxZXNGTUwwZytaVDFEbzdWbFlnNWx4QjFYQ2lvVUlBcEwwYXNJZitSVk5o?=
 =?utf-8?B?UG5JRjh2bXY2N0p6T0o4RWpzNmU1Yk8yOVd2ZHIyTy83eEs5eGFIVVR5S3Nu?=
 =?utf-8?B?Tk9zalU2Y2IwNFpnVHVsdkY4YVdEN01ORVlCY1pqZVdSVnhXTjY5ZkRzRjht?=
 =?utf-8?B?Y2RDMmlIdkF0WnJmTktuLy91SXpvd09iYlFQUkRxTlYxVmVTTGllRUMxRGpn?=
 =?utf-8?B?ZGs0V2tFdXVBaDNMNDdWdHFVWnhCZUtyM1NVRWtJLzFZRngrOG9hZmEvaG11?=
 =?utf-8?B?U2s4cU5KY3RNNDRhbHh3dndHYXhsSDUxUTduWHZOWkk3UGZDbjRIUFVwVkdn?=
 =?utf-8?Q?a2+k4M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:35:58.5451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3abc0ab-8073-4918-2c56-08ddf12fc287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

On Thu Sep 11, 2025 at 2:03 PM CEST, Andrew Cooper wrote:
> On 11/09/2025 12:53 pm, Alejandro Vallejo wrote:
>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
>> by the device model. The GPE handler checks this and compares it against
>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>> related bit in the bitmap and adjusting the table's checksum.
>>
>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until i=
t
>> reaches 128, even if that overflows the MADT into some other (hopefully
>> mapped) memory. The reading isn't as problematic as the writing though.
>>
>> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
>> then the bit where the "online" flag would be is flipped, thus
>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>> that happened outside its range. It's all terrible.
>>
>> Note that this corruption happens regardless of the device-model being
>> present or not, because even if the bitmap holds 0s, the overflowed
>> memory might not at the bits corresponding to the "online" flag.
>>
>> This patch adjusts the DSDT so entries >=3DNCPUS are skipped.
>>
>> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> Half RFC. Not thoroughly untested. Pipeline is green, but none of this i=
s tested
>> there.
>>
>> v2:
>>   * New patch with the general fix for HVM too. Turns out the correction
>>     logic was buggy after all.
>
> Hmm, this does sound rather more serious.=C2=A0 I have a nagging feeling =
that
> until recently we always wrote 128 MADT entries.

If so, I don't see where. It used to be 16, waaaaaaaaaaaaaaaaaaaaay back wh=
en.
Then it got extended to whatever it needed to be.

I have the nagging feeling that rather opaque "some OSs (cough Windows coug=
h)
don't like more than 16 CPUs was actually this bug in action. Making the DS=
DTs
with exactly 16 CPUs a particular kind of silly.

>
> So, while this looks like a good fix, I think we might want a second
> Fixes tag.

Happy to add it, but I really don't see anything like that in the git log.

Cheers,
Alejandro

