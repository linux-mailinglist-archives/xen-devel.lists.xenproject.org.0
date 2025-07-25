Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA18B11B80
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 12:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057615.1425444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufFG2-00041E-Bx; Fri, 25 Jul 2025 10:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057615.1425444; Fri, 25 Jul 2025 10:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufFG2-0003zL-99; Fri, 25 Jul 2025 10:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1057615;
 Fri, 25 Jul 2025 10:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOdm=2G=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ufFG0-0003zF-PK
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 10:02:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2415::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76bcdc0e-693e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 12:02:26 +0200 (CEST)
Received: from BN6PR17CA0033.namprd17.prod.outlook.com (2603:10b6:405:75::22)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 10:02:21 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:405:75:cafe::1d) by BN6PR17CA0033.outlook.office365.com
 (2603:10b6:405:75::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 10:02:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 10:02:21 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 05:02:19 -0500
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
X-Inumbo-ID: 76bcdc0e-693e-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXcaHx+v7xe7UZur8yxt+ojdM8fpUikDd0LyT3cehSc6ZH2PMN/iV72/SZ5VcxRatGRQj0OlcQUiTYnHeYm3dzTz/20N0IHP60qOEC9CpmVSEEoiiunnKZ4xTImUqKUGi/a3twypcjoBB5ViVXpEcp+Ty5FPCo1371+VLuFXa/9NsNDJmLGU7/C+JH6YtADOZBfAojNCGVEVFzqIOWoVOFOFTiPcCbbGBzKq56ui8bIvHC8b6hIVEiQ2c3iGg1t+TD9Dff4Mptt3ACrWx3fJa0dIdZWLmsT1lgNEXiTIC1cSBL3rntSSY49+zZHx64unQdtrAzavimIMho1RgStu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLC19927iBqBiiZ2J++ijex9DMu8LOXlT2UYfpvM/Qk=;
 b=SxvF8JEJr85zlAdhx/HgPhGMjg7AAaYlPVRX9nbEwFPgs4abMavqZPltRmfX3ALgCgTWFyDqWw71t04/yu3bVwKfWfrbSqVlMZQzWXM+yWB8+Myjo7r2CNCMzFg4raHe/Fpa5EqdtkHK21uaIG6+DGKoIvwzcHGgGWnCPvEc/FNDih1Pl4hBFFb7TqC8gWmSY7p+w7J+v/yL0Zk3O+KD5gflMCmTYYdHSwOicDpQAC6Zvv9yyFC+8i6/TOoKVnNpT2qKENiG4NyGMrKBFSo5IL+rhorDVPZB9eQS5Zo0xT49wU/RwiE9/bEht1xJ4tifH84HuBH67B+4ZX7DmJ3kAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLC19927iBqBiiZ2J++ijex9DMu8LOXlT2UYfpvM/Qk=;
 b=fVc61o12qUZ8CZUIlSK6oBkvpQrHyq0r/f6gN6NWPGCT9TNkrHb1OUx6DQberMrUMIXFyqRFJZ7EPIcAoO647VPkNcjeuWnrBfHwQ4i9X0xHEM6B8P4Oaoy8lqEI5Qp+xdTlCxZumes0yR93WeecQSvA4SqofOuY2R5tfP6fsZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Jul 2025 12:02:18 +0200
Message-ID: <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local>
In-Reply-To: <aICM2hqQoloEahgD@macbook.local>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: c79a2548-7a36-4f24-20d9-08ddcb6258b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q25RR2QvK2ZJb205aUFXdUhnOW5jLzJuTVF4TXFNOUhMWW10R2M4aHgyUzI2?=
 =?utf-8?B?RVNrQk9kdnkyMDNGdmNFYlEvenJJY2prVTAwaUd0N1NjN3R0aTF6ODYzdVQw?=
 =?utf-8?B?TzU5RUFkQlhuSTYwWHoxaTd2bExiZDYyOFV4L01hd295L3NCalhSd1o3Zjha?=
 =?utf-8?B?TW1PcGt4eEl6cDBaNVc1WmdDdXMrbzJzMkZYdWJSeU14UFhiUk8yU1RVclFK?=
 =?utf-8?B?cFQxSE1UMnFmOWRtdnNXTFhnUFVBaWIvajRucExjZEJrdDVPbkpVcDBJWitX?=
 =?utf-8?B?NmxhUVFGMWVrZnNpelFsWDVKdWVabThkdFJDNUhEN3pmMHMwd0N2YkNibzZm?=
 =?utf-8?B?dnVtbHplTWtMOFYrdDAyem9hTWRNK3ZpUExxSTIyUU5DV3Vjc1ViMU1sWGsy?=
 =?utf-8?B?L0Y3RE9icm0vZDl2d21ldytvNGdHWC9VZUlhT2tzOFJaV3g2MlExM1MyWVlK?=
 =?utf-8?B?MloxS1pwQTZwY29pZXIvdU1LbklmdjdrWVA3LzBrbHRLUVZYQVhBT3ZIQ0Zj?=
 =?utf-8?B?MmFiVE9FR2lRa3F6UWZPS05XT0grdG80a1lSbHgzK3hZd29HWk5GYkptWk9r?=
 =?utf-8?B?OHNheTBocnJHdWd3MUNzLzJ6S09neHhQb0RKeElUOW1IOUV0ZEdqZnM0RFNB?=
 =?utf-8?B?Vzl4dTNDUUwyU2pnVlVFT0lCSjRKUTR4alBMS1pSTHJhcndHTnBuOGpETmVP?=
 =?utf-8?B?VTRBcmk0bHhibGszeW52cmc2a1N2YnlENnNYS0RXOUJnaWNnSjZZRldQNVdZ?=
 =?utf-8?B?MW8xdUxzNVpyL1JvL1VSZmZReUN3SVM1NTlGY2hkZ2pWaVgrMm83L0hLNDZ5?=
 =?utf-8?B?S3dOcXd1ZFh5ZXV4SXlVbFBOVWxKamVNZHo1NUNlR1V3cmhkTnF4V0UxQWx0?=
 =?utf-8?B?SEtXVXVBWU9GSzdTRGtqTitiSG9vTGFqMDBnWjl6QW9kNUFEaGNhOFdScXFX?=
 =?utf-8?B?M3BsT2txTFczUHpFcC9PWEtUaEdsQk1CVGo0aXVGK0hKakZxUGZnSURla3RU?=
 =?utf-8?B?MjQ4RHdDKzFrenBReUUweTRhc3ZtUXVwMW8vVG91bjlWOE1qdHFFVU0zN1pO?=
 =?utf-8?B?UHpIZWNtcTkxeUJGbS95bjBwYnNYREYwaFBQblIyOXFuNlNlZEYzaGp0QlN3?=
 =?utf-8?B?VElvb2xFenhkVEduOUpPL054ZzNCcHI0ZS9mZVF6Zmk2UVkwRE83NW1aMWFx?=
 =?utf-8?B?bHNhaFZSRjJwWUlLVStackQzcDVpU2F1RTYwYU5kL3BIQStZSlBjV1NTek91?=
 =?utf-8?B?WFpEb0hUNTZLSGpiVWFPY2VYN0R4eTdRaWVScHMrMHJuTC9CdzBWKy9YZTJD?=
 =?utf-8?B?aDNQaElDY0s1QndUL3E1TzRmQzZDdUQ1VndMUTJYYTZBT0ZVZlhRQkpRSTIy?=
 =?utf-8?B?ZEpuL05XU2l3NHYyTTBpRkZZQVdkVElPaXRxUU5YekdOdWpkdExGSW5pQ0hM?=
 =?utf-8?B?eVFqcWNrYVNpeHlVaDlnWnpzRG9WaVFMakpPWTJZVHpmV0dQdHMzWE1oRjlp?=
 =?utf-8?B?dU9sSFhyVVgxaUdqdWFZbG9uOC9YYks0MktSd1lhL2NUblZ3N3BmY1VScTJG?=
 =?utf-8?B?QlFQQ1h0SU1sRGhSYTNLc2lLNUIzdFJmYmtNM3NOMmp3WVZnSlBtSFd3NU9D?=
 =?utf-8?B?YlpRS3paNkJjeTZxQXhyTHBkWkQ3SGxrNzlxcFFQSEZNVktTa3hlWCt0MjZN?=
 =?utf-8?B?SzAwS0U4QlBzK0lKTllZNWpPSnhFNEYyRlk3QkhweGFUVGUwb3NmYlJpM2Nl?=
 =?utf-8?B?MkE1N2pZL2MrM1BsR0VHaTlUVVN4VlZRUmYzTFYyUFZ0UHZ5c0ZBaFVwOXNa?=
 =?utf-8?B?cE9SeTZ1SlllREFCeU0wVEdpWVVSMEZxTG1Vdi9zUGQwdzJBNDIzdW1mOHJX?=
 =?utf-8?B?T0h5SE1TbmVaN1ViN0JIU2hoT3Q3NC9sMXVyUTh1TzJRb3dJODh2TmNybCtl?=
 =?utf-8?B?TkhmVGhFY0VaMExvdTJOdHNMNU9MZ2NNWnFrcThZeUlHN2psV2cwT1RLKzN0?=
 =?utf-8?B?Q3FJM2UycEd6Uy9haWlnY3ZpZkh6NElTWDh0bW95WER0aDVlRU42eFV5Skd3?=
 =?utf-8?Q?3Dlsem?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 10:02:21.1418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c79a2548-7a36-4f24-20d9-08ddcb6258b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085

On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
>> Later patches will keep refactoring create_dom0()
>> until it can create arbitrary domains. This is one
>> small step in that direction.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/setup.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index c6890669b9..6943ffba79 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>      if ( IS_ERR(d) )
>>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> =20
>> -    init_dom0_cpuid_policy(d);
>> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
>
> You possibly want this to be:
>
> (d->cdf & (CDF_privileged | CDF_hardware)) =3D=3D (CDF_privileged | CDF_h=
ardware)
>
> To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
> and not to the hardware or control domains.  I assume it should be
> possible to pass a different set of cpuid options for the hardware vs
> the control domains.
>
> Thanks, Roger.

Why only a hwdom+ctldom, surely a single hwdom should get it too. I can see
the argument for a ctldom not getting it. For our use case having dom0
disaggregated is of the essence, so what happens with a hwdom that is not a
ctldom is fairly important.

That said, I'm thinking moving in a different direction and have a generic
init_cpuid_policy() that internally checks for hw or control, or leave the
default policy or something else.

This would remove the conditional and allow much finer selection. e.g: a do=
main
brought up through a "nomigrate" DTB node (TBD: nonexisting binding atm) wo=
uld
get itsc reported, just as dom0 does today.

Cheers,
Alejandro

