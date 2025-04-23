Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65067A98A3F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964612.1355358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zjg-0005Qp-1t; Wed, 23 Apr 2025 13:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964612.1355358; Wed, 23 Apr 2025 13:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zjf-0005PG-V6; Wed, 23 Apr 2025 13:01:55 +0000
Received: by outflank-mailman (input) for mailman id 964612;
 Wed, 23 Apr 2025 13:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7Zje-0005PA-7w
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:01:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2009::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e7a5226-2043-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 15:01:50 +0200 (CEST)
Received: from SJ0PR03CA0213.namprd03.prod.outlook.com (2603:10b6:a03:39f::8)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 23 Apr
 2025 13:01:41 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::70) by SJ0PR03CA0213.outlook.office365.com
 (2603:10b6:a03:39f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 13:01:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:01:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 08:01:37 -0500
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
X-Inumbo-ID: 1e7a5226-2043-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMTeBiCtOPCHZIbghmQiS/Lc0aQpZ1YTDnAsg8pJvcuNBR1wVG0IH4SPkGAuumfLFDdb4NE7xc5/XvHL5bI7W8zpiwRoIZUda7/1b7RgW2DxLcOhVHeasBFnHY1MK/5+/fJIafPdgvKj5NfRRsQxA9t478yEtqTLnd02H/BtauTvVEFraCWriODpfE3FJbzRrxCrW6GzRX372vrfYqxDj9qzu9mTFHE41uxeZ6ZD52CVI8XROpU/weqMwn7BVZllu3Q+hEh/mHzbuQo4O8MS3CBavg+AAp/+o0ccbWo8p9LcCjNF9aRpw9upORIy2cqUYzC8wWhyz3bvcwIHzLaJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0pJqJMJT2ZRzhPgEzyWJnUQWKsdLgzwZYyXZ7DKUkg=;
 b=OOBD+kwyvO6HwHzUdVnQXt7pIAdu3BMuCVgJRp0iFlCb2GS0E5jZSRdD90ZOouf0+iHuZbrqKtQqpOmrmKi/CV6lvPNXU+zKh0tFGuQohM3oI3o5cSEl1di76JQyvenWA4pzCJbpWAhfFaRurCnitzvQd5un5pH3hrSDpT47x3HGeEnRTXh81bGztcuBVi9jCkjzodRFUbAueMV3Xu4VtJA3ucl3g6EjIT756a03XdBbpsyHxt1f5Tx9kGwwHEM75zFSqYiNKKHW9GW0zR2KM9V0QBqoJp1tq3I6vktTTtXGru4PWKgqWMB5eVqPEorD4G/for0Eo4V4Odo4NYEeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0pJqJMJT2ZRzhPgEzyWJnUQWKsdLgzwZYyXZ7DKUkg=;
 b=bEXQ9clA+nryMypmV4NKQ6zQ4ugCyY0aVzXCzzK6UJ6NxnSeHBF/eBALq09Eed/ftTenbhw2JiT33nWJ9WT4hW40+dlb/UIW/AkVbQwXgm/njAsL3TWLjPZ+/MSaMCqP2046L6a+pt7y/HkpWNrtRk6CgQZEqGk4BI1BvTvV5f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 14:01:35 +0100
Message-ID: <D9E1DIGCGP1O.QQ1KK0P3NX0K@amd.com>
Subject: Re: [PATCH v4 07/13] x86/hyperlaunch: obtain cmdline from device
 tree
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-8-agarciav@amd.com> <aALX/NgsSi5sTyz3@kraken>
In-Reply-To: <aALX/NgsSi5sTyz3@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db645e3-8412-4a4f-e9c2-08dd8266fde1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3N6c1ZCenRnSUt0U0R4dkpDWS8wWWRraDVLQys0WENXUTAzZ1dkbVFZaE5E?=
 =?utf-8?B?VWdkbXh1UTBsUjdxU0pYWWU1SW5JZUlkTmpkR3ZZdkJMSG1BemNwMnZEQnRy?=
 =?utf-8?B?dDNublJlRDdEbkRaMGl2WDIyVkcvNXAyV2lGcWduenJLTDBMYmVwRkFBbHVB?=
 =?utf-8?B?c2pqN0Jjc2pEY3lZMDJVdmI1MVZSUkdTb0tHVUMxajIvNzh4QlNmTysvNGJF?=
 =?utf-8?B?VnBiOXBYejVzbVovcmlNZDltVEpFdWhuNW1OTTFJVTBFdXlWd0lFckZaejlz?=
 =?utf-8?B?a0tZN05VUDYxd0M4UW1CdzRTeEhRT2YvOVBvQmlBeElNald4bWlOL0tjNTls?=
 =?utf-8?B?M0ltZURmMjVqQ001R1ZiRC9qcmZoYkdBWlBYNUNBUVR3Um5VVlZQclJBd0pN?=
 =?utf-8?B?YVBmV3Z3Uk02V3h5RnVhRi9XbndvWHAwaUdvcDVtZkJSanphWUQ0bEFVbjk4?=
 =?utf-8?B?M0paZTJhVDVESnREWktHRFlkc2UxVFJOb0VGNXFOclkyUEp0MzNFQUsvZ3Vy?=
 =?utf-8?B?VzMwWFF1Ni9pSXlkazFNWmsyZFkvQmN3RkRnMTRSMmh1U2M0MnRzWmdPc1I1?=
 =?utf-8?B?OFpybjY4Ymk5WUp0MlZrQXZvQmduNDQ2MWxTdjgvdGVXYW1mU1QvbnAwYWZi?=
 =?utf-8?B?eStDaFVxN0pXVXo5MXFTbE10Zy9lQjV3ZTVqVGkzVXZCdzU0cldZOG5ha1V0?=
 =?utf-8?B?Yi9reCt0N2pNZXdLcUp3LzZRcWpxanBiL2twVGhXQ080Wm5CMEorOXdQci9F?=
 =?utf-8?B?WXIwVUQ2eXhCTVpQb1JWVjlWeGgrVkZMc3kwNzNUWGJRMVYvWjVSdXNuTG4r?=
 =?utf-8?B?TnRlWm81TDRXcWthU0NlelcyUVB5WmtEQ3QvM0FBRHEreWNmYzd1Mng3dy9L?=
 =?utf-8?B?U1VWUUd1STlHZjFhRXRlNHZ2WE5pL1pZMGNkeFRYUWpEMmJQRkJFNWxLc1g4?=
 =?utf-8?B?WExNaURUY0M2b2FGeGp3b2xGYmFYZVpxVjAvSzhra0ZIbk9OSjMxdnpmdm05?=
 =?utf-8?B?SkdlRnhUczI5cDNiUHM4NjB4SnR4UExlVTgvVTRMc1BPUFJodDVUdUU4bmJn?=
 =?utf-8?B?VzFKT0ZiOGsrSFhCcjRYRzg2WmJ2cTROZUpKWXI3cGdySFkrK0hPNDdEYUNo?=
 =?utf-8?B?V09ZclV4eWdxeUl3ci9wTkJxT0JHNjVMK0tIK21WY0d4YlBTdU5xYTRNcWU0?=
 =?utf-8?B?bUx6clRJSlV4elZNUlN5eGx2V0JKVHhLSHVIM1AyME0zcFJYZDdSV3ZGOHgw?=
 =?utf-8?B?alRSSEtXUGRYdWhMa1Z2VnBPUXd2SmlKWTRLSnBqVEgvTXhlcnErRUFkTnZ1?=
 =?utf-8?B?YldHL3lBWDFzRDB6TE9tQ0xzWS9hbzY2WG41TVR5dG91L0VldEdZek5mUUkv?=
 =?utf-8?B?d0R0VE5NZjNCMTFSSVYwNUV6MDhxYlZJMXdvOU53ZUF3eUFhcytaQjVlTzJR?=
 =?utf-8?B?OU5MNVYvandLaDlNR1hRbDFqZ0ZJYXJxeExqcm5OMDFvaUFCQ3owK1loTXlC?=
 =?utf-8?B?NURvRk8vNVZBbHN0NWlOMnUySTZYeDhkczRZVGUvdzNkMlpWeUNkSk9Oanl2?=
 =?utf-8?B?ZWxOSEtmT0hSQmdCS3Q2blJ5bnltalBvVENZcm5maUxYb2dnNjdVVXRpTWxa?=
 =?utf-8?B?SGc3dkdta0VHaG9QUGJvRlJjQVl0c05NbytUb01nTlpTNGxKemJxV0doeTU3?=
 =?utf-8?B?N0EzQ29KNzVERFJTZWJXNnh1VXc3bzc1a1Fldk1tMWtyUHloTkVkRDhCYkNx?=
 =?utf-8?B?VjlBdUxPU1p0ZzNtN2FOeTNiL3E1QWRHZmNBOFNTUkpJWktNZFRNbVN3VkpC?=
 =?utf-8?B?T2dRWktva1hQN1JrMExQbTdvTjNBRHpIOU9KdFVtY3EyNmllbWNVUTMrbmFW?=
 =?utf-8?B?ZkV4SDdtOGEyU01OejlCTzU3d2tVWFVFZ2R4d0JQQUtDZlZ6MFBEa1Y4WnM2?=
 =?utf-8?B?WGhGVVJMV1NQNW9HVDExTGRZUUZzYW9qR3JqYy9PZU5scVQrcTYza2NZUE5k?=
 =?utf-8?B?MzVMVlovdXNkOWJIaTE2aDhVb001TXhjRmxURXh5VlQrbXRkRVl5ME1jYjhn?=
 =?utf-8?Q?rmBcJn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:01:41.2788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db645e3-8412-4a4f-e9c2-08dd8266fde1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587

On Fri Apr 18, 2025 at 11:53 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:29PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add support to read the command line from the hyperlauunch device tree.
>> The device tree command line is located in the "bootargs" property of th=
e
>> "multiboot,kernel" node.
>>=20
>> A boot loader command line, e.g. a grub module string field, takes
>> precendence ove the device tree one since it is easier to modify.
>
>               ^^ over

Oops. yes.

>
> Also, I would explain the command line parsing rules in the code commenta=
ry for
> domain_cmdline_size() below.

As in, also state the contents of the commit message in the function
header?

>
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * Removed __init from header declarations.
>>   * Removed ifdef guards, as DCE ensures the missing definitions don't
>>     matter.
>>   * Removed ifdef guards from new helpers in domain-builder/fdt.c
>>     * Rely on DCE instead.
>>   * Restored checks for cmdline_pa being zero.
>>   * swapped offset and poffset varnames in libfdt-xen.h helper.
>>   * swapped name and pname varnames in libfdt-xen.h helper.
>>   * Turned foo =3D=3D 0  into !foo in libfdt-xen.h helper.
>> ---
>>  xen/arch/x86/include/asm/bootinfo.h |  6 ++++--
>>  xen/arch/x86/setup.c                | 10 +++++++--
>>  xen/common/domain-builder/core.c    | 32 +++++++++++++++++++++++++++++
>>  xen/common/domain-builder/fdt.c     |  6 ++++++
>>  xen/common/domain-builder/fdt.h     | 24 ++++++++++++++++++++++
>>  xen/include/xen/domain-builder.h    |  4 ++++
>>  xen/include/xen/libfdt/libfdt-xen.h | 23 +++++++++++++++++++++
>>  7 files changed, 101 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/=
asm/bootinfo.h
>> index 1e3d582e45..5b2c93b1ef 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -35,11 +35,13 @@ struct boot_module {
>>=20
>>      /*
>>       * Module State Flags:
>> -     *   relocated: indicates module has been relocated in memory.
>> -     *   released:  indicates module's pages have been freed.
>> +     *   relocated:   indicates module has been relocated in memory.
>> +     *   released:    indicates module's pages have been freed.
>> +     *   fdt_cmdline: indicates module's cmdline is in the FDT.
>>       */
>>      bool relocated:1;
>>      bool released:1;
>> +    bool fdt_cmdline:1;
>>=20
>>      /*
>>       * A boot module may need decompressing by Xen.  Headroom is an est=
imate of
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 4f669f3c60..4cae13163b 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -984,7 +984,10 @@ static size_t __init domain_cmdline_size(const stru=
ct boot_info *bi,
>>  {
>>      size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>>=20
>> -    s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)=
) : 0;
>> +    if ( bd->kernel->fdt_cmdline )
>> +        s +=3D builder_get_cmdline_size(bi, bd->kernel->cmdline_pa);
>> +    else if ( bd->kernel->cmdline_pa )
>> +        s +=3D strlen(__va(bd->kernel->cmdline_pa));
>>=20
>>      if ( s =3D=3D 0 )
>>          return s;
>> @@ -1047,7 +1050,10 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>>          if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
>>              panic("Error allocating cmdline buffer for %pd\n", d);
>>=20
>> -        if ( bd->kernel->cmdline_pa )
>> +        if ( bd->kernel->fdt_cmdline )
>> +            builder_get_cmdline(
>> +                bi, bd->kernel->cmdline_pa, cmdline, cmdline_size);
>> +        else if ( bd->kernel->cmdline_pa )
>>              strlcpy(cmdline,
>>                      cmdline_cook(__va(bd->kernel->cmdline_pa), bi->load=
er),
>>                      cmdline_size);
>> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builde=
r/core.c
>> index 924cb495a3..4b4230f2ff 100644
>> --- a/xen/common/domain-builder/core.c
>> +++ b/xen/common/domain-builder/core.c
>> @@ -8,9 +8,41 @@
>>  #include <xen/lib.h>
>>=20
>>  #include <asm/bootinfo.h>
>> +#include <asm/setup.h>
>>=20
>>  #include "fdt.h"
>>=20
>> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset=
)
>> +{
>> +    const void *fdt;
>> +    int size;
>> +
>> +    if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>> +        return 0;
>> +
>> +    fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>> +    size =3D fdt_cmdline_prop_size(fdt, offset);
>> +    bootstrap_unmap();
>> +
>> +    return max(0, size);
>> +}
>> +
>> +int __init builder_get_cmdline(
>> +    struct boot_info *bi, int offset, char *cmdline, size_t size)
>> +{
>> +    const void *fdt;
>> +    int ret;
>> +
>> +    if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>> +        return 0;
>> +
>> +    fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
>> +    ret =3D fdt_cmdline_prop_copy(fdt, offset, cmdline, size);
>> +    bootstrap_unmap();
>> +
>> +    return ret;
>> +}
>> +
>>  void __init builder_init(struct boot_info *bi)
>>  {
>>      bi->hyperlaunch_enabled =3D false;
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index 1fae6add3b..50fde2d007 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -209,6 +209,12 @@ static int __init process_domain_node(
>>              printk(XENLOG_INFO "  kernel: multiboot-index=3D%d\n", idx)=
;
>>              bi->mods[idx].type =3D BOOTMOD_KERNEL;
>>              bd->kernel =3D &bi->mods[idx];
>> +
>> +            /* If bootloader didn't set cmdline, see if FDT provides on=
e. */
>> +            if ( bd->kernel->cmdline_pa &&
>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>> +                bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>>          }
>>      }
>>=20
>> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder=
/fdt.h
>> index 8c98a256eb..d2ae7d5c36 100644
>> --- a/xen/common/domain-builder/fdt.h
>> +++ b/xen/common/domain-builder/fdt.h
>> @@ -9,6 +9,30 @@ struct boot_info;
>>  /* hyperlaunch fdt is required to be module 0 */
>>  #define HYPERLAUNCH_MODULE_IDX 0
>>=20
>> +static inline int __init fdt_cmdline_prop_size(const void *fdt, int off=
set)
>> +{
>> +    int ret;
>> +
>> +    fdt_get_property_by_offset(fdt, offset, &ret);
>
> Perhaps something like
>
>        (void)fdt_get_property_by_offset...
>
> since there's no need to check the return value?

I vaguely seem to remember doing something like that a few years ago
(because it does show intent and many linters require it) and being told
not to. But maybe I misremember. I'm definitely happy to use that
convention here and later unless someone pushes back for some reason.

Cheers,
Alejandro

