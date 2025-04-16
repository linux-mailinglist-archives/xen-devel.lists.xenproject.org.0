Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1317A90650
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956348.1349794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53j0-0003jn-45; Wed, 16 Apr 2025 14:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956348.1349794; Wed, 16 Apr 2025 14:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53j0-0003hE-0W; Wed, 16 Apr 2025 14:26:50 +0000
Received: by outflank-mailman (input) for mailman id 956348;
 Wed, 16 Apr 2025 14:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6+O=XC=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u53iy-0003h3-Kk
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:26:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2416::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13484e5-1ace-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 16:26:44 +0200 (CEST)
Received: from CH5P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::21)
 by DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 14:26:38 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::ce) by CH5P220CA0003.outlook.office365.com
 (2603:10b6:610:1ef::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 14:26:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 14:26:37 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 09:26:36 -0500
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
X-Inumbo-ID: d13484e5-1ace-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAGWASf5U1xHouIFnBvEm10Xcr1CbDeNxR3NtZAA4Lw1MOkzjUBz5VtsCBkhBngdIDxSTjDBxcfw2DUYfivZJbx6G7hBcwkxBOD0jaONt+DVe2O8WN9EsdKATnSBog6L/R4mNgzlsoXACn9zgYx5hJ7QpdIysNhKbFrkCDUGQnGNoasB4evMqoQ467s9piEYOzScdzkhu1r9jDZ7ufCbAVYFhO/Dv5I/N6Ke2NOCqY6ilmTCFfQ2ijnA+jYv6G3DBx90J4lt75UIQLd7u57EyK/ap0VrhLy3wi2w0v4RblOiw82qEhGFhpag2W0o/303tpa/8+kuGVCp6JN360OJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/npcCU6vRmNv/FKvdAfl1CibiRM/xxjPj5aztOW8sw=;
 b=VvfUt3i1cmzNpj1rkFoXSWMl9W9jItd65IawY1LTiUtuKXZojX8X/wnyuCGQFh2CgevhaxX4Y5IIm0mJLRVR5f3lBBt36rDvgZAEw1FqlBFP4ZPniw/Qhn45ed2xB9zZgP7QVRaYjiATorPYWJ8yJrzClVASA/cPEFRxGwn9zznKtDOuykSqLlpRfycRyUrsjUpF8/9JxT+I3ZNvHOH6pEdBHYUIcVvzST2LpdNBK+b0wlMSRz0ZldU8fWCnZPLRR9aXlBANnY5+SV41MfItcVHajQdIiw0d/rnL4ufnMyF/REPqVeksMiUjS3sU71T3t9UpbOWmU683MSughm1Bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/npcCU6vRmNv/FKvdAfl1CibiRM/xxjPj5aztOW8sw=;
 b=hLzexOXzKpg01wtqnquu+k0pBw75nnAMQA02USmUmaOFUTk6syzJdyBM7a8VT/plxGY3HbZ9UDqQyDDl70i3aO5YLBzSGPEMe0tu1RZwCcZnRwjqfMDgOGOpN8Dgr5LXIo7ZBR7cysU0kRi3ugHKMpRypr66ScCZ30nNKmLmLe8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Apr 2025 15:26:35 +0100
Message-ID: <D984SS1H2QX3.3G4ZR015V2U3P@amd.com>
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
In-Reply-To: <c0a5ca22-fc42-47fc-b1b0-358992014454@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DM6PR12MB4281:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e09b5c-f892-44c0-48e8-08dd7cf2b2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0dLeEJzKzNRaWIwVGtueS80cElsclI0V3FuZW1aUEQrQ3lxL0pxMDdIRWpX?=
 =?utf-8?B?R2l1dGtXZjNXTFZ3TnJkTnVza0pna1RTb1JZcUFIbmtLdGx3NzhrYUphZmky?=
 =?utf-8?B?U0lWRE92dkFscTJ5MFJvZ0Jldi9wWGp0OHlGSGVycWhRKytTcG1UVTh5bmho?=
 =?utf-8?B?MnVZRC8wcm1QR2hIL1ZwdmJLUTJOdXZVd2NrRjhrV2xlaGt0NVpRUU1KVVdp?=
 =?utf-8?B?WStLbFJBVk9TTnd3MGdrTnZxTnROYU9hTkZiQ25lVjVYc1JxVzMzOExkZDUw?=
 =?utf-8?B?QzNjN2hMQ1kzL00zelhHWk5YRERtWFRVNm1yN0h1bjBkdkFDMHRtNU9LN0ht?=
 =?utf-8?B?a2hqckYyN09OVEVPMzJQMTg1alloK1JqOUdzNkN4ZDJPSnViVGZ2T0dMZWFk?=
 =?utf-8?B?YUt1L3V2ZUpMaitKQVdJNU9uUmUvdmdGMEpSekJsUkgyQUhNenBNUDJUSG5h?=
 =?utf-8?B?R2ZHTWcyRmFPK29CNVAwSkQ1QlVKK0V5Nno4NWJTM1RGUk1hN1M5VXZCaWpH?=
 =?utf-8?B?V0w4SDJldnpMUXoyaTlVN2RmNzBBR2Y3SDkxKy9lUXZLb2Y2bEdZbjZhb0ZV?=
 =?utf-8?B?Ym4vWEFWdE92Q25GU0JqeG5xT2hpOE5KSjFtR09Td0xhY1E3M242Yy9xRXRN?=
 =?utf-8?B?VzZ3Lzk1WUtNeTNscVhMN0Y5V0F2c2g4clZ6WUwyUGRIaTRLOEhTbi9vMGho?=
 =?utf-8?B?c0w4cURpM3FUaXJHU0dWTXpMSTV1RXNtbnlsWDJKU245YTBBQ2tUb082SUM1?=
 =?utf-8?B?MEZMZDc5THNTY1NYN2lhMitwSzNmcnE2cUdFZnkxSEdITUlKS051MHVpT21I?=
 =?utf-8?B?VWk2VlF3dG5CZ0cxbE5sNHFaNVowZFhkQjBOL2JqcldKWmUrM3VQOC9ydE1Y?=
 =?utf-8?B?ZllZTEJXeU1IMDRhaXozYlZ2QVZ6RnIxcFlNd2twMU56US9mTzNUSmJQU0cw?=
 =?utf-8?B?ZFVLRnFPN1VGU0tMN08xcFlrbXYvTUFzUTJ3NUFORHpwSk5qS0xMNHYxdG9W?=
 =?utf-8?B?NDBFbzFvY2pvL2k0NVh5UG1JVGRzekU3RHluQkdTbHh1SlBBNldvLzdNZU9B?=
 =?utf-8?B?WU1GcmVIZnN1WGhQLzhqTWxTOW5hTXF5d1RudUlqOWI0WWhmT2czRlQ1S04v?=
 =?utf-8?B?bXl5YXdIVEZDbUpkUGMrbDQ1WGZ0S00xVXpwalB4UzJKUnI1U3lYZ1NkeGs5?=
 =?utf-8?B?eGdJOHgvRlZQRkZIMXFad1FoNDNXbTNRTFlZY1FJVnc4VmJoelZhWGVIaGg5?=
 =?utf-8?B?d0xjQWlzYjdIMzFBckhibVBvb1h6REM4R0ZRcEQ2dDY1SGR0aFdkQ0RTOGZW?=
 =?utf-8?B?Y1Q0MHRFZmZ4YXR1MWhYZm5YR2xWSnpXQnMxVjliS0Fhd21QRHFMdzJtS0ps?=
 =?utf-8?B?WEpXUFdoc3V5UGpicWVKSFQ4UTdyRjMyVlN0KzJVSThLdHYyQVdtRVJoYXlN?=
 =?utf-8?B?aWwyWmN2UGo1d1lEV21SR3VEays1dmRKdlEya29OaUE0NnlobXBkTE0vSkkz?=
 =?utf-8?B?aTRsVE5IUDdyMXlVdVREc2pjWHE1U0c4NWN4cWRZKzRjUWdNbCs3QVpONWZG?=
 =?utf-8?B?UGRkN0M1dENZaUlEYURIblFyZ2VrVWtIVFJWUTZSM1VjaGx3d0lybXIvZENa?=
 =?utf-8?B?ajdGRlh3b2pLUTBvdWNWTlJhcTQyOU12WnVsWXJHaFR4di9SYnZ5ZUxJeHRR?=
 =?utf-8?B?cmtkU2JHamRBSWw3Si92K2NwOEdYTE5ya1JEZHZEQ1h6WmFoTVJqaWQ1cmla?=
 =?utf-8?B?aXBqdUNmNVBsWEs2S1B3TUgzb2ZkQ0VaMDJ3U1BXSEJteHY5bCtkSGRBNk5W?=
 =?utf-8?B?WXJFNnZveWowTFEwQ0ozNGR6b24wVG1OSm1IcVdtZzRvTHhFRlNGRWp1clVK?=
 =?utf-8?B?VUlucHltSkdrYnhoamNxcDA4T1pMZnExaGtsMk41VzJrRTU1RkpiRWQ3Ky9E?=
 =?utf-8?B?ZmN2ZkRONXhYa0dUam1FNVhuUCtiN0loSnlYdUt0dXJLT0s1dUFFaVA5bEtv?=
 =?utf-8?B?ZG9IQlI5T0pMWjhvc3NFcE1iWE1XK2xIMnNHbXhadVRWYjc3SFB1dkZJOWY0?=
 =?utf-8?Q?Ue9jh4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:26:37.9883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e09b5c-f892-44c0-48e8-08dd7cf2b2d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281

On Wed Apr 16, 2025 at 11:44 AM BST, Grygorii Strashko wrote:
>
>
> On 16.04.25 04:03, Stefano Stabellini wrote:
>> On Mon, 14 Apr 2025, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> The current code in generate_uboot_images() does not detect arm64 prope=
rly
>>> and always generates ARM u-boot image. This causes Xen boot issues.
>>>
>>> Fix it by searching for "ARM64" for AArch64 binary detection.
>>>
>>> - mkimage -l xen.ub
>>> Before:
>>> Image Type:   ARM Linux Kernel Image (uncompressed)
>>>
>>> After:
>>> Image Type:   AArch64 Linux Kernel Image (uncompressed)
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>>   scripts/uboot-script-gen | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>> index a9f698f00fd1..c4d26caf5e0e 100755
>>> --- a/scripts/uboot-script-gen
>>> +++ b/scripts/uboot-script-gen
>>> @@ -815,13 +815,13 @@ function linux_config()
>>>  =20
>>>   generate_uboot_images()
>>>   {
>>> -    local arch=3D$(file -L $XEN | grep "ARM")
>>> +    local arch=3D$(file -L $XEN | grep -o "ARM64")
>>=20
>> My file -L gives:
>>=20
>> for arm32: ARM OpenFirmware [...]
>> for arm64: Aarch64
>>=20
>> So the ARM64 grep wouldn't work as intended. Is the version of `file'
>> that you are using really printing ARM64?
>
> Hm, yes.
>
> 	file -L xen
> 	xen: Linux kernel ARM64 boot executable Image, little-endian, 4K pages
>
> 	file -v
> 	file-5.41
>
> u-boot boot command:
> 	 bootm 0x4EA00000 - 0x4EE00000
>
>
>   If so, we can do:
>>=20
>>    file -L $XEN | grep -E 'ARM64|Aarch64'
>
> sure. I'll update.

Missing escape? I think it's needed even with single quotes.

  file -L $XEN | grep -E 'ARM64\|Aarch64'

Cheers,
Alejandro

