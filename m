Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED667AD6A5A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012508.1390979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdBS-0008K4-UH; Thu, 12 Jun 2025 08:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012508.1390979; Thu, 12 Jun 2025 08:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdBS-0008Hd-Qm; Thu, 12 Jun 2025 08:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1012508;
 Thu, 12 Jun 2025 08:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NPvq=Y3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uPdBR-0008GK-DY
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:21:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2416::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c79d626-4766-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 10:21:02 +0200 (CEST)
Received: from BN9PR03CA0488.namprd03.prod.outlook.com (2603:10b6:408:130::13)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 08:20:56 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::2d) by BN9PR03CA0488.outlook.office365.com
 (2603:10b6:408:130::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 08:20:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 08:20:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 03:20:53 -0500
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
X-Inumbo-ID: 2c79d626-4766-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JG9kry2B2NJCcuz1n+CeetTfRr26abpoK80IscCi/b8ehPGCvWCzx+GlDN+/jkSVmbIhSuggb/jGVv+3j3PpGn4dv8PjB+6xbDVj5+lbG0o/Q7VDcvZxXiZOWuLFmG3YM3+Jd4W6gb5gAXAGtY/H2C4nRv5FOBdBd9y7Fda5qIy7FrljSXNaM7M0MaPOf8TAU22w4v7GZTGVa+NijS7rZe77E3yq/O04wmGMla1o8+AXM+hbHWqfwOiwqrq3wOweDN+hIahEoTgJQzuTFk9O8YmMyB9sKEOMvsq+/XemSUUA80okwgMOmTgCPQM3ulFvmbNDw9258AEFt53cyhYXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jewQKCz7Z4tAbpLWHCuGD1C9deOuDBXm7aNlPx1tB8U=;
 b=yQNpF2B3ir/WkiY5al1fzxU4HwB6Q8HWYlDIK+i6cMHEUasmO58mLWTSpnROgbhZU96OCni7XkANGRmrS5AuXA2RVtnhNQD3m8MuAtQ4QeHvw3m7JzoNuSgRNEelz8HIKZ+LGK2SAoSi9pMyv7OhX+eaOsqwxXBw0bMbV+kIl0FFeFtbqcoCZH1/Ru3C+DuuzfCAYb5SnIqAQowkMMIY1n0TB4i3e6DppLVVkrBUpyaoVcpAaQg3GEjHLVEXbIkThhYt57S+XQPcmn/qYAXoRH3yfEZoWm2GosregItlI5fkd0dAk7WXoFcbKe4/4ibGB4LYQJxF26JvL3dMIIFFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jewQKCz7Z4tAbpLWHCuGD1C9deOuDBXm7aNlPx1tB8U=;
 b=nQIEQkoj9uCWA3AAFcM0C4bNnRB5sXzr/isEqqwyfndHKIAr9s7eSfV+vUNXIJC4IND71LK2v3Bl+VxjjPf43WLNtleJ9sDuDanPJNkzDtiE2ZYq67KvUVGtC9D4eYNjdxrYEJ2jXwhsodWX3QuBZSIejWtfPd7gWmjCRn6GDzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Jun 2025 10:20:51 +0200
Message-ID: <DAKEPTAU5XB4.3NA0LU38UFH6L@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Denis Mukhin <dmukhin@ford.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device
 tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-7-agarciav@amd.com>
 <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
 <02ffa9cf-b5cd-431a-834a-a11bbf310196@suse.com>
 <03be429c-063d-4467-91e7-7ef2e148a2fb@amd.com>
 <ef46b3ec-af0e-480f-b206-5191c79e62f9@suse.com>
In-Reply-To: <ef46b3ec-af0e-480f-b206-5191c79e62f9@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 64193f2f-c25d-4ffa-8dfd-08dda98a0ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVJFcjIxbWZXNmUwWm80T3Z2bCtqN2Jnb29JTktkaVVWSE1mYnQzUWlKK1Ni?=
 =?utf-8?B?MDRDK1FSaWcrNGVOTDJ0ZEZsZFhudnE4MjBtMkZjSWRWOUZtYU4raVZrNGxI?=
 =?utf-8?B?QkpTY0Y3ejQreG1pd0ppWTdiYktCU2xGbUNzZEViNFdvMHIrZ2pWTE9NcEdF?=
 =?utf-8?B?ekt3Vk1sM2wxYXd5QmdyemUyUHhsY0ZsUVgxcC9OZnJiQXVoSVd2WDFzVU5T?=
 =?utf-8?B?bkF5RGhCN1ZFV3FzZW0wcUQxQXc3YjdaRFBRNUtVMUlRNUVnWk9jYWowRFBO?=
 =?utf-8?B?VWtnb2Qydys1bHVTeWhyN2Vjd0s1cWViRkNteDNuZjkzb2JrOTFOUW9TQ0Ux?=
 =?utf-8?B?emVna2Z3b1hHODdqZWsrWkVjVkVSdWY5TGUwK1ZVNDdjSFFBOTRaeGtiZ3lk?=
 =?utf-8?B?SHhNT3J0UGZjd04wQk9ta0dKQk5jN1B2WFdEd2pFM2JJbmdPRmxxTXVGOTA4?=
 =?utf-8?B?WmU2d1VROEVlalBxTGxFQ3pPeTJ2c1lVV2craWxrMllvdUtnWklkVlNvSDJ6?=
 =?utf-8?B?aVBXRnZYRFVBUWQxdXZCMTE5N29sK1M2aHZjRktMb0NGbG9IenNHbVoxRWFX?=
 =?utf-8?B?ZWpFWk1lbVJRQ095eVkyL000dW55ZlFjVnlMczZiYTR2cmJ4TngwTzBPM05E?=
 =?utf-8?B?Vjc4OTVHQlhHNk0zcEYxRVlWSE1nTE5heXVCb1RVOTRGUjdMY1E1SHh5VWR5?=
 =?utf-8?B?bXhTcVVzcEVQOWRDM1hOY3ZRRlZ5U1B1ZHVSRi9rK3pYU2FzVmhYTWdPU3RX?=
 =?utf-8?B?SUxmVDVYUTlVenVjaTl0WDN1bHllSVphQ0dINTdqTGI3bmpjTUpRTkxNbmpU?=
 =?utf-8?B?TVJoV05OSzFHTlBnSzQwL2Q0M0JMVnhDV253eW1WalE5emxibWNUU04zUVdN?=
 =?utf-8?B?Z2JNYk01NnpMN29FMDJ5UUQ4ekltak5ZOXk3Ny9waTdTb3A5ZVpwZkF3RTY1?=
 =?utf-8?B?UXBsUXhidTN1dkE2R05HVXFmWHRzOVVKNnpnL2cyc0piTFJDWWt4MjV5SGFY?=
 =?utf-8?B?MVFFUk9tZjkyZUFJS3FSWithNStmWXNSY041d0tyS09Yb0M1MExrWExqQTVs?=
 =?utf-8?B?U3VqWXlHaCtoTUx0UmQyYXh2Slc3VHg5bnhBM0sweFgrNW9pQ2I0NFBCQkFY?=
 =?utf-8?B?UFRhdkRzWXJHRnRlZDNRdWh3a2IvWDd6ZjJ1NkZJbkRHSzFwdVNXeHR3TitN?=
 =?utf-8?B?R1dqamtTSHN0UFNWVUhEYVMvQkFzOEFkUHdXZlBQZGhkc25RbG92TU5nYTEy?=
 =?utf-8?B?ajBWWURHYTROenhFRHFrcmJsQmVpOVA2VDZxR2kzZk9rL0dxeW82MVFUWjd2?=
 =?utf-8?B?clhQaVRsZldLSDJTZHRvWjl4YjNlV2xkSWRMNklQTmF1bjZSemc5VS9lQ2lC?=
 =?utf-8?B?ODVZRUFvU2ZOTkliVkxqMXQ5UnhZNTV4YlF3eDdzS2hSNWhncEdwMW82SmtG?=
 =?utf-8?B?Vko1ZXgyaW53Q3VQUmw1QXhjSlgvTHk4a25XZldHZnVrMllUUXNrNVF4bVUz?=
 =?utf-8?B?MGtWbSs4ZEtEMnk3WTliTDdQUS8rNjFwSm5lTzZoVTZwOEZjR1ExSTIraGYv?=
 =?utf-8?B?eW9ORDdhZjZsaHZNU1FYQ0hsNlcxem5xa0lvVGNZY0pVT040YUFwdGFnWmY0?=
 =?utf-8?B?RTAwVGJqSHh5UnBTekJjeUJXaks1NWxoOXJibzBQd0VyczdhdjY5alloeVVC?=
 =?utf-8?B?YXZTL1gzYlF0R3pTalM5L3gwa1NHWG9zQmlPSGhwcHpVNTU1SExiY1hSUTh4?=
 =?utf-8?B?UGoyY2FJYVg3OXo5VS9WN2hnRVo1SWVmd3A5T0VwSzhwaUIrQTJWNndZMTdi?=
 =?utf-8?B?S0V2bzlydC9qNTU2dDdRQU9tT1BobGJ3cFBqT1ExNVJpVTFYN0RoaGVHODVy?=
 =?utf-8?B?WkIzKzU5dXdKSGVOZmMxUnUvVm9SR0pnOWIxTzFEOUttaW9laHlRZGFsY1JZ?=
 =?utf-8?B?WE1uRUtVUjRtMjhjd2tBN1c5cU1WTzBIS0RzNW9LZmJ0UUxtQ0JlMTBkOEJu?=
 =?utf-8?B?eDFCM2VxT2EyR2JHTXU4SkMyT3N0dldTV2M0SDloa1hDUld6ZElnTzJMZVdl?=
 =?utf-8?Q?I4fAg6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 08:20:55.9379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64193f2f-c25d-4ffa-8dfd-08dda98a0ddf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591

On Wed Jun 11, 2025 at 7:35 AM CEST, Jan Beulich wrote:
> On 10.06.2025 19:39, Jason Andryuk wrote:
>>=20
>>=20
>> On 2025-06-10 02:56, Jan Beulich wrote:
>>> On 09.06.2025 19:07, Jason Andryuk wrote:
>>>> On 2025-04-29 08:36, Alejandro Vallejo wrote:
>>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>>
>>>>> Add support to read the command line from the hyperlaunch device tree=
.
>>>>> The device tree command line is located in the "bootargs" property of=
 the
>>>>> "multiboot,kernel" node.
>>>>>
>>>>> A boot loader command line, e.g. a grub module string field, takes
>>>>> precendence over the device tree one since it is easier to modify.
>>>>>
>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>>>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>>>>> ---
>>>>
>>>>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-buil=
der/fdt.c
>>>>> index cbb0ed30a2..dabe201b04 100644
>>>>> --- a/xen/common/domain-builder/fdt.c
>>>>> +++ b/xen/common/domain-builder/fdt.c
>>>>> @@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 printk(XENLOG_INFO "=C2=A0 kernel: multiboot-index=3D%d\n",=
 idx);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bi->mods[idx].type =3D BOOTMOD_KERNEL;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bd->kernel =3D &bi->mods[idx];
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
* If bootloader didn't set cmdline, see if FDT provides one. */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f ( bd->kernel->cmdline_pa &&
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>>>
>>>> The logic is incorrect - it should be:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( !bd->kernel->cmdline_pa ||
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !((char *)__va(bd->kernel->cmdline_pa))[0=
] )
>>>>
>>>> If there is no cmdline_pa (which happens with the "reg" property) or t=
he if there is a 0-length string, then check the DT for bootargs.
>>>
>>> Even that sounds bogus to me: There's a difference between "no command =
line"
>>> and "empty command line".
>>=20
>> Yes, you have a point.=C2=A0 The difficulty is grub always provides a NU=
L terminated string, so Xen can't differentiate the two.
>
> Which may call for either special-casing GrUB, or at least calling out th=
at
> behavior in the comment. (Ideally we'd still have a way to distinguish
> between both cases, but likely we'll need to resort to documenting that s=
ome
> dummy option will need adding to tell "none" from [intended to be] empty.=
)
>
> Jan

We can add suitable comments where required, sure.

About the dummy option, note that even if we have an option for Xen, that d=
oes
nothing for the kernel cmdlines. If there's such dummy option there I don't=
 know
of it.

Cheers,
Alejandro

