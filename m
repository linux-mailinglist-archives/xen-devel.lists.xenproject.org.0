Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89753A91C1B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957494.1350604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ON2-0000r5-Pr; Thu, 17 Apr 2025 12:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957494.1350604; Thu, 17 Apr 2025 12:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ON2-0000oI-Ma; Thu, 17 Apr 2025 12:29:32 +0000
Received: by outflank-mailman (input) for mailman id 957494;
 Thu, 17 Apr 2025 12:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5ON1-0000o5-7M
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:29:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f403:2406::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99477748-1b87-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:29:26 +0200 (CEST)
Received: from CH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:610:32::12)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 12:29:18 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::2a) by CH0PR07CA0007.outlook.office365.com
 (2603:10b6:610:32::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 12:29:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:29:17 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:29:16 -0500
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
X-Inumbo-ID: 99477748-1b87-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5SJLVQhI1JpDrneDsWEHspqwQNQcYfi+c0aBlt6W4cTxiMlL2KWGe8T1cWYW9NUWKM44qsE4Z9nr7Tf45CXIsMkXlvaoyHayu6t2UOEzTxdVtdjpAavWRhFEgz/LrC4c16eWIjRJadcmoDI9KjR7XhqZB9KLTmvODXvsDbYeWiAKgcckpVD+9joegmFRm5P/sWr67WXRU6v9nw3R+IiKWU98NAFP7jWvzKpudmKQrht9aj1bGwjbTkAbs5xrgaFSx3yATXI4hdpqQFz5a1T2BrN5zU9NehD8vYw3OiaytkIkHyDk8Sc6PCaQKOm943wjrtKLC5fOsvGVS23WOdsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8cSOcA6tZh3QpLyLSZ7HnTeCUHBldxUsp+r0svp+B8=;
 b=NWyHCWWS7QqGfFs4z64IhUd1bOqwAegvGpuZbsBbVWhkij+3HtCgIpelUn7mOthyjTkPNek2FaojScRdvh4eMQr+NkDhgsHAka5VxYUOC39PIUxLh+4/nuNCB+dzD0SL3MvxW4JXUkGLWTCs9pbliWlFuQDDdsXmQtM8dmLy5YHV8f5hf296KfvEwcJ/idQvOvWE5Pwm2B1SB6uZj02HxkC3hBvY1C38GSwLa6ubnUxClxt7BU9zOu5B+ZdZqAXh4DkTfYEZzzRvOhIh+W9JXfdRTnbVT9HrddhhYmZhtJTHL4D6MoBERQIP+roMOWfXO3Timf1SBMQl+BKF4nUClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8cSOcA6tZh3QpLyLSZ7HnTeCUHBldxUsp+r0svp+B8=;
 b=2cPVpQTSEumkLQMZMtRoL9NsJcYQOIFrBJlGNWNEAbvJm4HZh/x2Du3zXKU1DFL1k3jtNDDFMN8sUPff1m7Bjf2052YKXg+anAJctpsNbRWaBL3AYOwYaNpH0VpPsIueib0JQAGzDwbIHI1rhmybzqt8pynIV6WNVBXlqQEb5Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 13:29:15 +0100
Message-ID: <D98WXHMMKSC8.2GVDVGQMC6XTT@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [ImageBuilder] uboot-script-gen: fix arm64 xen u-boot image
 generation
From: Alejandro Vallejo <agarciav@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250414081223.1763630-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2504151758170.8008@ubuntu-linux-20-04-desktop>
 <c0a5ca22-fc42-47fc-b1b0-358992014454@epam.com>
 <D984SS1H2QX3.3G4ZR015V2U3P@amd.com>
 <b874731f-55c5-4783-995e-4da916e305a9@epam.com>
In-Reply-To: <b874731f-55c5-4783-995e-4da916e305a9@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 380a55c7-fe23-43cf-d6a1-08dd7dab78e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWNVR2FqNGNUTTVuSTRIakFlV0tlZG1wNVFSWmJJVkw3cXQ0VGVkNnBtaW5n?=
 =?utf-8?B?VEFIY3dsVmFiVllYTmVHbTQva3ZiVWNmb2JuZzZWcFNjM1RqVkZ4em9LOXdD?=
 =?utf-8?B?WTkxSVZFL0N6Q2Zld0p5SVRtL2NsUVNVdmtLSTBTV2ZEZ0J4RXIwS0VsNCtL?=
 =?utf-8?B?V2tsM3NOSGVybWtZdWk1L3lUVEhzd1lIbU1NOTlhWkRXYml3NTVhZUZuY09x?=
 =?utf-8?B?TUZRNy84NUVNWmJ6djhCbHRUcnYwNzRHb0pScEZKWStlZW1lZlBoYTA4VXBn?=
 =?utf-8?B?UHF6ZGhQY2w5Q1ZHT2ZhMnZzK2JScDNLWFQwNE1tRXV6Mi9ySlRoLy9rclNR?=
 =?utf-8?B?KzVsTDNFNzJ4cGRzWDZaZTgyMVlRbC9rUjNVL0l5a0JWa2xFb3VhZGdXTlFn?=
 =?utf-8?B?L2xOTjV3OEtyL254QzZrTEc2TkJycFpxNnUzTDdTdEh5ZmNaS2ZjWHNHbDZJ?=
 =?utf-8?B?MWF6cG0vaU9hVXlGRHlFYnArUnRjS2RQZlNUNGp2MGNSMkZPTEo4NGVZZis2?=
 =?utf-8?B?bStib2N3elR1YmdvOWw0SGt1TVF2WHdBOE5CYmRHOWtOcnczcEd5cEtOL1d2?=
 =?utf-8?B?elh0TytaWHUyeU1LV1VrVUp5RmJVcGxoUDY4L0RhMWNsYm91Zis5QWJ2b1VQ?=
 =?utf-8?B?cXlhNU1hYk8vYUNIbU03MDRDNWI4TG5sMjE3UlVqemo0VlZLaUdGUnJ0SVZD?=
 =?utf-8?B?d21DekdWU2dvZ2Uzb1ozaEZvRm1mazNNenROeW9BeUVRekM2WER5R1BCTFFU?=
 =?utf-8?B?ekxxN2lRUlkrQU5lNUFKV3hlNTJaR080eGlBMktXZVBza1dWOGhva3VQZ1ph?=
 =?utf-8?B?WC9YS3NRSCs4UU81VWlQS2JVREsrRldPdEt5MHdWaVZNamRpTjNSRkNodDZI?=
 =?utf-8?B?SVVKNzNUeXA5a0w5MEJpSThhSm9FdjhsVzZRM1VoSnoxSW1NM0N2SEpyMyt6?=
 =?utf-8?B?OVVNTVNhS0xnTFZ1cnh0cW9DcEEyWXpCMlNmY3htNU1UQ3ZTQU9DMzdKZitp?=
 =?utf-8?B?czNVeGJGamhIczZ3NzRURkplM2s2aXAyTU4xcWJ5VGRmNjhHRFBsRGhPSE5h?=
 =?utf-8?B?YW9TaGVvOFVtdWk1OU9tQ3JNU2FTeXh3RHZMNWdBMHdjMnc0RmZNZXZ5UDJX?=
 =?utf-8?B?QTEyaTMycU92eFoyQzRFaWNkb3pmNGJONmhPQXg2K3lSRENJMkZCVDladjEz?=
 =?utf-8?B?dWNoTXJwSVBzN2liNzEwdmoyeENsL2VYbFpuVWEwVlh1RG1zZVhob1dDMVV4?=
 =?utf-8?B?VXozYjIvNVBJYkx5QW5FYzBheUdqdXB3ZXpCcnkvUmU0aWxoLytvWElrSHVO?=
 =?utf-8?B?amVxdUl1bUNGb2NIT3NMU2dqSUpsNkxPUXNxU0dpNDZuZ0dIdTJwSENGQTd1?=
 =?utf-8?B?ek1FaHB2ZmtKSUFQeE8wT3F2RHBWcmRTbVZJaWpzRGt0WFRIdFZKbzIrWjN2?=
 =?utf-8?B?NzVtVmFlMk9zVG5mZjdIdEpJbEtZQ3RDQWVHenNxUUlMYXhWVy9LdHlKNnY5?=
 =?utf-8?B?OHl1dlRab1BMOEc3OHVIZWI4cVE4N3RpVEhzYkMwc2hlTnVJSUNHMStXWklt?=
 =?utf-8?B?UUtKWGJodTZWb2NmMzFrTTVpSTJvM3J6bmJQKy9NYXZGdEFMU3lmbkFEcXMy?=
 =?utf-8?B?RGl4c3Zqa3BYR1R4ekZZMUVJYk1zQUVWeXlseXBlOFNsVnNVSlQvSEVHd3A5?=
 =?utf-8?B?Z2IvQTVHUTQ1NE1WV090RUpweStDaGd5QnlHYnlkNVVwMjdURjNWanBsUzQ1?=
 =?utf-8?B?d2tKWW9VaWFOVnN2YVEzcFlFQkUvanprbHNYZTJDNytiYkdpUzI3WWVkbnUr?=
 =?utf-8?B?dFV3S3RHc0xyQXZiSDhrLyt5U0EyK0ZGTG9UVnJ2YXN1cFV2ZGZGTHJDYUwr?=
 =?utf-8?B?RHhMM3lYSjF2cFFUakpKRVBxYUN0YngyZHU3YlptN25adzhSM0ZwQ0ZCeXFx?=
 =?utf-8?B?V0NKVG9EaUgxNVlxak5jSlVUMjRwK2t0aXF0cWRBSjhTRmQ3L1Uyb0h0bXla?=
 =?utf-8?B?dTlGK2lmQUVqMEZSQ28xdkllK1hHZmEwc0N4NmlRdkVabTl3T3NKR3ArWmF5?=
 =?utf-8?Q?HBHqAv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:29:17.7061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380a55c7-fe23-43cf-d6a1-08dd7dab78e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357

On Wed Apr 16, 2025 at 5:10 PM BST, Grygorii Strashko wrote:
>
>
> On 16.04.25 17:26, Alejandro Vallejo wrote:
>> On Wed Apr 16, 2025 at 11:44 AM BST, Grygorii Strashko wrote:
>>>
>>>
>>> On 16.04.25 04:03, Stefano Stabellini wrote:
>>>> On Mon, 14 Apr 2025, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> The current code in generate_uboot_images() does not detect arm64 pro=
perly
>>>>> and always generates ARM u-boot image. This causes Xen boot issues.
>>>>>
>>>>> Fix it by searching for "ARM64" for AArch64 binary detection.
>>>>>
>>>>> - mkimage -l xen.ub
>>>>> Before:
>>>>> Image Type:   ARM Linux Kernel Image (uncompressed)
>>>>>
>>>>> After:
>>>>> Image Type:   AArch64 Linux Kernel Image (uncompressed)
>>>>>
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>>    scripts/uboot-script-gen | 6 +++---
>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>>>> index a9f698f00fd1..c4d26caf5e0e 100755
>>>>> --- a/scripts/uboot-script-gen
>>>>> +++ b/scripts/uboot-script-gen
>>>>> @@ -815,13 +815,13 @@ function linux_config()
>>>>>   =20
>>>>>    generate_uboot_images()
>>>>>    {
>>>>> -    local arch=3D$(file -L $XEN | grep "ARM")
>>>>> +    local arch=3D$(file -L $XEN | grep -o "ARM64")
>>>>
>>>> My file -L gives:
>>>>
>>>> for arm32: ARM OpenFirmware [...]
>>>> for arm64: Aarch64
>>>>
>>>> So the ARM64 grep wouldn't work as intended. Is the version of `file'
>>>> that you are using really printing ARM64?
>>>
>>> Hm, yes.
>>>
>>> 	file -L xen
>>> 	xen: Linux kernel ARM64 boot executable Image, little-endian, 4K pages
>>>
>>> 	file -v
>>> 	file-5.41
>>>
>>> u-boot boot command:
>>> 	 bootm 0x4EA00000 - 0x4EE00000
>>>
>>>
>>>    If so, we can do:
>>>>
>>>>     file -L $XEN | grep -E 'ARM64|Aarch64'
>>>
>>> sure. I'll update.
>>=20
>> Missing escape? I think it's needed even with single quotes.
>>=20
>>    file -L $XEN | grep -E 'ARM64\|Aarch64'
>
> No. It's extended regular expressions ("-E") no need for escape.
> Also it works with both '' and "".

Ah, fair enough. My brain escaped the -E :)

Cheers,
Alejandro

