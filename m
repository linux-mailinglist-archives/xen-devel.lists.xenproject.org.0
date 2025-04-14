Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F9A88050
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950074.1346493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IrS-0003q4-Hb; Mon, 14 Apr 2025 12:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950074.1346493; Mon, 14 Apr 2025 12:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IrS-0003nX-Ey; Mon, 14 Apr 2025 12:24:26 +0000
Received: by outflank-mailman (input) for mailman id 950074;
 Mon, 14 Apr 2025 12:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4IrR-0003nM-2X
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:24:25 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2406::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6532a534-192b-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 14:24:23 +0200 (CEST)
Received: from PH2PEPF00003855.namprd17.prod.outlook.com (2603:10b6:518:1::75)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Mon, 14 Apr 2025 12:24:16 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2a01:111:f403:f912::5) by PH2PEPF00003855.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Mon,
 14 Apr 2025 12:24:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 12:24:16 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 07:24:14 -0500
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
X-Inumbo-ID: 6532a534-192b-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ+ZNIwKx6FuSzPj2ijXpqRFWLHv04E52WmMPQ/FIzUB59dHtp4+xoBwFf/O5nxDPx/dbHsHaUz45czKhhtxtMQyoWlqm/6IpgDIegYxX0sZmMFv5P272nkUwRjhgXDfWa2Ur3ZT75r2lGOQICWilUHR2jG30uLNdIM9VnxpL5IRcZKuv5GJyBkCP7CkgGSCZBQqBOg1go8vdyBCQ11+VBKMunRnRVcsKCXVCE86XJvnzsNDVm6ZmnWutw0Vr+h7S9ioxp+hx6B38mOJXqJvD7nN41S8OwEjjwIfWZUzfdLZfxMIhoWCqiMizXNULve7H/dpDe5ETAu7iH4A2Cf7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPBFSCkPwEyt4xEun8kkvsk1OUxcEL0E95EMZNUr4lU=;
 b=ft5NI1YpnBjm8WPJTv0Tbnz8J7i6nidu/9v0Mc5OVp/75CG2t6QvoEgv5O/mN3Pz0zBF4Flok5ntPggjVAyOJNuaDB8DTc936VIMTGMEzqctGnS1RG4FGJ/vkiB5hVdi8ewMlpC66s/qPT+r9XsYQNHF7RaciIb5ngYy+Ygz2aYDEpu5Qb8Uchs0pUslOY7pY5wfd5xm9XuJ3FW7i+9c5FJ3bMkapCKIcld2N3nXLWj71NHzVI6JzL4OV6/1IZt/OPPoeaOB4X5tBHWU3Sf0/9IfDupmTCzlrLh/Bvcg/E55xHNPrUSsx6wM1N7Uyvj6GYF77R2IIwUkIhee8ygqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPBFSCkPwEyt4xEun8kkvsk1OUxcEL0E95EMZNUr4lU=;
 b=hLUUAknIOp3u5ckRt2ijsgEAeVzxmLidvPbLvoA7r4RHsw8/GMoAEB7Ey7wAOdfYyn4XTexIHr8eu44kXGli3t5MVu40FIVnDB0h30b3/gBENvA/OV1HX/YhebmnlWOijwW8gGb3xY8xWGVeldKQyB9mwkMkM2cdotxPhqbgsPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 13:24:13 +0100
Message-ID: <D96CXZZ6WYJE.L6WOZA0T3ABF@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [ImageBuilder] uboot-script-gen: add xen xsm policy loading
 support
X-Mailer: aerc 0.20.1
References: <20250414081449.1763962-1-grygorii_strashko@epam.com>
 <D96CDMX3B877.3MD1OKAJ6JJ3E@amd.com>
In-Reply-To: <D96CDMX3B877.3MD1OKAJ6JJ3E@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 59209f09-7903-4e6a-8cac-08dd7b4f45e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkNhWXRublhLZ284aGF3alVsUmNwY01Pd0R5QS8vdDFIOExCQU83aHF1MFIr?=
 =?utf-8?B?S091ZHZKSms2Yllidy9TbjZKUjhrM2wzSndtbWVETldLc0RyTWtjQTJDWVpI?=
 =?utf-8?B?czdXZFdPTW9hK2xtMklodlZSS3BtNC9TNk5nWXVQTXRVNWNIVVZqOWVSdzVi?=
 =?utf-8?B?Uzlrb2RsWXAvSjBFSFRvOTZMcHVLekFPSVh2MGM1ckkzV0ZhTkVyQ3lydWZ2?=
 =?utf-8?B?dmZDbWhZdEdnZTJLNnRsVXNkQS9zS0svSlFzcngxc1hvbTQzanB0Tkx4RmtE?=
 =?utf-8?B?N3pmZzYraFYrRzViR1QxdVdjSThmV3JFSU1ncExVbWJXdW1BTk5OeVhlTS93?=
 =?utf-8?B?Y21zQ0V5OUpnSGFCRG9yT3Y1SUNSTENCWEJ4bWR1ckplVlRYb201YVYxRmox?=
 =?utf-8?B?RCtFUEdib2Y1a00xcFl6MXZlM3dreEVqWXUranViK3ovYzZwamllMnFFM1p4?=
 =?utf-8?B?Rm5MY3VuQmdJMjkzczkxMW5sc3lZY2NUM0tBRHFSenpuWllSN3d1MWJSNHVE?=
 =?utf-8?B?cXJXUFVya3JTS0FSWjJ2Zm9pWU5QVytXNE0rdm5JYkRQUDJHNXlKNjdJVVZi?=
 =?utf-8?B?TDhNdVJMek84Q1VzbHgwdDZVN0xMOVg4THJXNUdCQjMwSXJQT0FoU2txcWxR?=
 =?utf-8?B?M05aN1NuRVpTTmxZNk5BaGZGaTA4VUZDTDN2U2JoTnhESEQ0OWs0NHRnbkxF?=
 =?utf-8?B?Z0pMZnJac3BNWXBuSVh1QTI5dkcvL3hMZ0VkY0FBOCtEaGI1WVBISzNjODhp?=
 =?utf-8?B?QlJJNzE2cERpODEvSmU1U1pIUWl6VGVuYnF3VmVpN3c3Z1Z4Y2wyKzNTTStJ?=
 =?utf-8?B?Z3dRa1oyZWFCeWtRblcrRlE0Z0dselhreHRJbnozNUM1V0tSSEFPd3hSK1Zu?=
 =?utf-8?B?bGZyYUswQmJlaTh4L1RzUnN2NE0vZ2NoTnpvRWw4d0lhM2pWNTVtb0hLVTNz?=
 =?utf-8?B?TldEMGVXTGIzakFucXRwQ0dzUkx1VEFqU1lJdVc0azZPNkh5bGxrNzNXejV5?=
 =?utf-8?B?cXZDUjUxNWJKMG9Fa0tXbnMwUmo5cnc4STg5Q1RaeC9SNVA3aHFQMVkxWEs2?=
 =?utf-8?B?VjhQWmlSb3lKZ1dXUGdPUitvMDdBTmxZclg1b0IxSUVkUGRDODBacDYzOEFT?=
 =?utf-8?B?d0NMazB0R0wwWUR1cWNMMkI0Q1Q1T0JVakNIU3lEN1NjNzdUZFhkRXp5dVRy?=
 =?utf-8?B?UU05SUtwRmowUzJKUDllc1RHekwxazhYODhqODZXZmE3d1Z5dkg4OHRyTWxN?=
 =?utf-8?B?YU1yaWE4V1FFTWFFektuelZCNGpBcldwVlNoQnRFQ1RDcXNPdGxUWlhkZUxB?=
 =?utf-8?B?cHovRUROTDROU0trSnBNRTVLQTJ5M3hpLzBTR3V4bW9PQ3BwZXh2OU1EVmZ4?=
 =?utf-8?B?WlVVRFdRL2VDM054SDV3ZTVHS2pGS1N0MTlKRXF0RlFMQTZkNi9nTE1lc0la?=
 =?utf-8?B?eElUc0NGeFhxVFYrb3lpOWI3bEgrMytrd1dhUFA0cU4vbERtb0JEVjFUWklC?=
 =?utf-8?B?bWpZSHQ4ZFE4QVovRWQrcFJkZXdRTGFlODVUT2JkNlludVZXNy9wTnZadTRh?=
 =?utf-8?B?QmJVbC84Q29uUXBwdlprYzFsbEMveXJ4NSsxSjBlZTgvMHlYWk8zd0JMWUFD?=
 =?utf-8?B?WS9DVUVSNElCZmNJNGNJSng4RHRNYUVrM3hDd005cEpMWWZxZXJOeEJlcmww?=
 =?utf-8?B?a20xeE1CZStNZlhXWCtmc3RMdWtSMXVZUmRuRDlrKzJlN1J1bndSWk9aaXk0?=
 =?utf-8?B?V1B4ejcxeTJ4ZUFTWlAydmJDeS84VlBaOW5lMmxpdEs5RkFkc3ZCeEZ5SjQx?=
 =?utf-8?B?bk5Kbk9mQ0FzRTh5RlFabTlzNHdIOHErS1diRUxYWFFmdy9HQjRUUzZMc2VE?=
 =?utf-8?B?UzdOeStLUWhKSHNEcWtxRHFZRHlUcDhtUGM0cFZhM0pPTEZlZUNmTmVpNWxo?=
 =?utf-8?B?dmFIU0E1ZkpFNEg3ZlVyQThrekhVd0dyNFN5R0pnTXRGaWQvVCswUGIrTmtj?=
 =?utf-8?B?NFFvd3IzbzMxUTQ3SWZQSURYZWg4TlZwOTBKTm91RFNDbFNTNmNNa0lpaTkw?=
 =?utf-8?Q?2vjs4t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:24:16.0180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59209f09-7903-4e6a-8cac-08dd7b4f45e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

On Mon Apr 14, 2025 at 12:57 PM BST, Alejandro Vallejo wrote:
> As a general question, why using "test" so much, rather than
>
>    if [ -n "$FOO" -a "FOO" =3D=3D ABC ]
>
> Using test seems far harder to read than it needs to be, and single
> brackets are perfectly valid POSIX shell.
>
> On Mon Apr 14, 2025 at 9:14 AM BST, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> This patch adds Xen XSM policy loading support.
>>
>> The configuration file XEN_POLICY specifies Xen hypervisor
>> XSM policy binary to load.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>  README.md                |  2 ++
>>  scripts/uboot-script-gen | 33 +++++++++++++++++++++++++++++++++
>>  2 files changed, 35 insertions(+)
>>
>> diff --git a/README.md b/README.md
>> index 137abef153ce..9106d2a07302 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -91,6 +91,8 @@ Where:
>>  - XEN specifies the Xen hypervisor binary to load. Note that it has to
>>    be a regular Xen binary, not a u-boot binary.
>> =20
>> +- XEN_POLICY specifies the Xen hypervisor XSM policy binary to load.
>> +
>>  - XEN_COLORS specifies the colors (cache coloring) to be used for Xen
>>    and is in the format startcolor-endcolor
>> =20
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index c4d26caf5e0e..343eba20e4d9 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -315,6 +315,15 @@ function xen_device_tree_editing()
>>      dt_set "/chosen" "#size-cells" "hex" "0x2"
>>      dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
>> =20
>> +    if test "$XEN_POLICY" && test $xen_policy_addr !=3D "-"
>
> If XEN_POLICY is a binary, shouldn't it be "test -f" ? Same later on.

On the absent flag:

Nevermind, I see you're using "-n" implicitly instead. I'd rather it be
less opaque, but it does function. I do think most uses of test "$FOO"
would be better off with an explicit -f or -n. But that's a separate
matter.

Cheers,
Alejandro

