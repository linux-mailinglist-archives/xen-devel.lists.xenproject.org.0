Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA44A988C0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964473.1355258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YSy-00043v-3G; Wed, 23 Apr 2025 11:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964473.1355258; Wed, 23 Apr 2025 11:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YSy-00041m-0Q; Wed, 23 Apr 2025 11:40:36 +0000
Received: by outflank-mailman (input) for mailman id 964473;
 Wed, 23 Apr 2025 11:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7YSw-00041a-Gm
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:40:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2418::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2c9c588-2037-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 13:40:32 +0200 (CEST)
Received: from MN2PR18CA0012.namprd18.prod.outlook.com (2603:10b6:208:23c::17)
 by DS7PR12MB8273.namprd12.prod.outlook.com (2603:10b6:8:ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 11:40:27 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::7c) by MN2PR18CA0012.outlook.office365.com
 (2603:10b6:208:23c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 11:40:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 11:40:27 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 06:40:25 -0500
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
X-Inumbo-ID: c2c9c588-2037-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqnXd6V3bQGDHrytlwZOcxflcNAZHiSIeJc6R07k3kAmegxzev//xSaWr6z6rzgcRr6zg5CrU1ygyWl3Y6ECPhcs3PnWPtUHzbWrxYHrd4ToeZRxoETu4rEdfgcS5Z03LVeh30/unaDSPLWp3foyd03POMF06tACavLSdzgtEYAuzu+syDON4niLgYHhgKXbQWSZ+l6gj9dde1cQoXlg8zhgsOg6mPxnS0aIlQD2/9c6A9nFNXenmcW7cgtiyKM7WHjBtzbQ+/hrO+32wlZzN/7UudlordqtGQALcUotu+YjkX0LWg+8b5rpHSCBe9Q/92ynWdh2G6JZqduN73yfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/Nmv1nQx0UDMCQNZUSCLEtvJfNgk7XbZB9PEI3gZns=;
 b=y8hyrEwj54rVuUfK7N7KP1aTbTCVECfvMxVQDWj+HeXMCgwLAm4cP/8XBOyzY9ThAMALmdVNDJXQMf+a7Kf1obcVpgoXN0uloneneTOUo3uSAqAL96DkOIhJ/ZDfUznTJ++7vVRvxNPGbtzdSD7IDUSy3avCGaH93kOyU9ldp4B/O7GA3hmLxpYzsUKdeLsmpUo9TK92k9S3j5W4acUBSgEY5nGZ5CKA1K0Gf6NevgMTDY5VOeK5/YB+SDtzl402quhVJAGEuiA2c9J2FT0IMsoJboPkpADyempZF6rplA08rQTKJi0hwlxQ/p3s4TJq1rb6AILq7+4/lgLLCJIAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/Nmv1nQx0UDMCQNZUSCLEtvJfNgk7XbZB9PEI3gZns=;
 b=mit9zLSzgcYR4FfSgSvOQZBLFLa/pUOV5f4MuOPN8wS9I5tEKdDLcBfbjwwug99yPaUCR28IGAWk3D5ExOq1O3RoHIhJ2E81tKXcqm7T32o12fpEhKWLnLgv1b6yXBoGOVMSLvSU2Gd2ErT591OS9vNMkEEh/7JsADWfI/4oZfU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 12:40:24 +0100
Message-ID: <D9DZNCOVUV9S.2D1CTX5OPB7YY@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 01/13] x86/boot: add cmdline to struct boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-2-agarciav@amd.com> <aALBJ/8YUwu4vl4k@kraken>
In-Reply-To: <aALBJ/8YUwu4vl4k@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DS7PR12MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 617a6cd2-7693-4860-4223-08dd825ba492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHdRcEdtV3ZjL2ZZbWIvL3BqSi9RNHluWDNqcFVpNUdJZWd1cmxhYTRML3ho?=
 =?utf-8?B?QmNQT2x2U01TTDZYYWF3cDczdjcxa29sUzFMd1RyTkxtTFlZUEtBRE5yemZq?=
 =?utf-8?B?MDArVStEN1NScEFtZnh5c0VSdHppY1JrbFZsYmVHSGJKYm9wU0lFT0hkMEZx?=
 =?utf-8?B?RDVhM2FtbGRxaCtsTkhPcFJXVE9XVm13NXBUamRaR3dQakhWWGtnUHJHK2Rh?=
 =?utf-8?B?ZnFCSmNQRUZPaGlBZGxsblBlVUlhSnhtN1E0aFNFZHZUcDdhSUFFMWJCKzJC?=
 =?utf-8?B?ZXFEVHFHNVJ5QkFMMFFiVk0xSFdjR0o2K0RWd01mMmpLVU9aNXhIWllzazBa?=
 =?utf-8?B?QkhodUNRd2JUaTVoNlNOUWVZNm1WejJ3SnRUZ2JQdzhIOHoxRSthVkpDQ1Jn?=
 =?utf-8?B?TTF3a3laSnJRWC9pV2ZDcDdPMW9aeGZkUER2RDFxcFJuSEEyYk1HUU5iYmxN?=
 =?utf-8?B?dFNWYW9XWHdXQkliR1R1UngrblplTVFMZElUbTBSOWU5TTd6RDMySnNDQncy?=
 =?utf-8?B?SHE1VXAvbUJhS1ByY3NIN3ArUEJFamNnR3ZjbW56UCsxNGxrV0VtRGZiM3Rr?=
 =?utf-8?B?VnI3ZklETk1jZUh2UEVnaTV3em5QTmlrdDF2WUdUcWJCZHM3SkZUMHVLdjZa?=
 =?utf-8?B?cGhSSDJEN01LbXZ6a2I5MzdFWThSZGQvTy82RjdHWUV5dE5waWdxYWs4S2hF?=
 =?utf-8?B?K09sYk54VUg0Nmk0V3ZZVHlpc0t3em8rZWVvYVRVUFd4T0NEZlhqTHpFc2hE?=
 =?utf-8?B?Ym84cXNnT0JiR2ZHMDU5bXY2a2NqcDNOVklibEd5Sk1TVG9Fc2N3WElsVXlJ?=
 =?utf-8?B?b29MWXhCQ2tpbHpaMGlYTFp6VitYeGVkZUVqdEEwaGRTVlpEVFVIN3crc25X?=
 =?utf-8?B?SWRObU9zVjFucExCbFIrQlpBNy9pZmwvOFBpYjhpU3JDbktTK09kZHA4eUdH?=
 =?utf-8?B?UEp6dXZ4WXIrVVpXR3ZDWmQvbEI5RUhLT3JyM1ZpdUwzN0FUUVRSdFNnQ0VM?=
 =?utf-8?B?dUtXTDZmdDB5dm5GMy9lTXhIUXE1ZXVNTC9FdloyOTBSN3l5V1hyN1JMaEl0?=
 =?utf-8?B?NnBkdHFnWW1LanpIVDQ0OFp0Z29KRndRampsOEd3aHdjRXpYbjB6K3kvT0dJ?=
 =?utf-8?B?Z0tVYk9QeHcrTnhiSVJLTEk5QkFjRE5DZlZ4ekx3RElkNGRqTlMzYkdKVXRj?=
 =?utf-8?B?Z0RVZzE4TCtNVlpsWXZ2ZExPdWZBa3VKU3hISldhRGhyUitWODVEMFNOUGxx?=
 =?utf-8?B?cG00MmdYK0U2WTMweHBOS0RkenUrL1UxbHQ4SjNhYlVnUVZjeWJNSVdneWtu?=
 =?utf-8?B?dHd4OFhFaGc1eWt1dmQ2Mm15Mnp5amZFRWQweGw2Rk1wYWRkOW90RE1JekQ2?=
 =?utf-8?B?NHRrTUg1UGZaVEk3eXExUWpSUzJFWXJDcUl1SGkwSWdFWUtTUkkwWEJpUEVV?=
 =?utf-8?B?ZjhMZUJrbXMza2dxYVBoREUxZXZWYXI5VkVJNjNkVUZzc2J0UTl4NWxDTUVV?=
 =?utf-8?B?TVN4Z1dUTU5tdmtsQ2RKVUhTb1BzbVJPVUJZcVlvVlFVcDg2dmI4eDdnbUNy?=
 =?utf-8?B?ZzcwaXB2SnRISDVyWTgrK01tdnAybUlxckdVOGxsRnRWbC9pRHN0VU5LYmVK?=
 =?utf-8?B?NTdZeFhNL21LWVNVdElQZ1BjU0VkVzlhMlE1cHdkbXk5aEphTVM0OGMwOGtQ?=
 =?utf-8?B?N1lTUjkyNGRlQlVDVEErSUlseGxPU2hxWkZwNDBvVUJYdWNGRVFyVTR6Ymps?=
 =?utf-8?B?UERMMHhwL3Y4MnN3dDNBNXB6RDNWQ0hZckFtcTFJdG9TTldRcW12V3lRT2cv?=
 =?utf-8?B?OG11WldzRkc5Z3NsNTNpMDl2RHRUNlVla1BhQ3RHdHl4Ylh2L2VlbjdFWTdu?=
 =?utf-8?B?TWdkWXJ0c1gvd05Ra2UydzVDZlhhSzJiK3hKc0FoamFvZjNHb0VEMGhpRnFO?=
 =?utf-8?B?dmsyeW1oMWdWZlBRcHBqN1ZLSlIrWVdWM1Z4V0djaHo3aFhKa2lsRkx4VzF4?=
 =?utf-8?B?NVM0Q1FPc0o5TWlGb0g5TUUrNy9tNkNxcGxJaTQrRFphaHFNb2Y4Z2VGb1FD?=
 =?utf-8?Q?d4Dcqe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 11:40:27.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 617a6cd2-7693-4860-4223-08dd825ba492
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8273

On Fri Apr 18, 2025 at 10:16 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:23PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add a container for the "cooked" command line for a domain. This
>> provides for the backing memory to be directly associated with the
>> domain being constructed.  This is done in anticipation that the domain
>> construction path may need to be invoked multiple times, thus ensuring
>> each instance had a distinct memory allocation.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Thanks

>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build=
.c
>> index 2a094b3145..49832f921c 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -778,21 +777,21 @@ static int __init pvh_load_kernel(
>>      /* Free temporary buffers. */
>>      free_boot_modules();
>>=20
>> -    if ( cmdline !=3D NULL )
>> +    rc =3D hvm_copy_to_guest_phys(last_addr, bd->cmdline, cmdline_len, =
v);
>> +    if ( rc )
>>      {
>> -        rc =3D hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdlin=
e) + 1, v);
>> -        if ( rc )
>> -        {
>> -            printk("Unable to copy guest command line\n");
>> -            return rc;
>> -        }
>> -        start_info.cmdline_paddr =3D last_addr;
>> -        /*
>> -         * Round up to 32/64 bits (depending on the guest kernel bitnes=
s) so
>> -         * the modlist/start_info is aligned.
>> -         */
>> -        last_addr +=3D elf_round_up(&elf, strlen(cmdline) + 1);
>> +        printk("Unable to copy guest command line\n");
>
> Side note: I think it makes sense to add domain ID to all printouts in
> pvh_load_kernel(). E.g. block under elf_xen_parse() logs domain ID.

Sounds sensible and easy enough. Sure.

Cheers,
Alejandro

