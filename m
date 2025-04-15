Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E9A89DCD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953774.1348199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fIw-0007qp-7O; Tue, 15 Apr 2025 12:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953774.1348199; Tue, 15 Apr 2025 12:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fIw-0007nz-3O; Tue, 15 Apr 2025 12:22:18 +0000
Received: by outflank-mailman (input) for mailman id 953774;
 Tue, 15 Apr 2025 12:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=moIN=XB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4fIu-0007nt-0q
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:22:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42552151-19f4-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 14:22:13 +0200 (CEST)
Received: from MN0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:208:530::32)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 12:22:08 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::d7) by MN0PR02CA0029.outlook.office365.com
 (2603:10b6:208:530::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Tue,
 15 Apr 2025 12:22:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 12:22:08 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 07:22:06 -0500
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
X-Inumbo-ID: 42552151-19f4-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uC0KxWtJiZEhWogMkVaKS3ZpkvjzR0Ycb+GZWayi61zHWKAT+HFyIttaZFz5/0x5oYyQawmMb3mVj3AB7VEvH4zVsisYhIHNMh/3iUMgatlPa1hSmXQuC4HShqMqL0hZne8YPf9grus4uP8CMA7njGJ3aGYNn58UsmPL3AStAy1ajrKZah3AaN/qHDLTwLO1WqrOY1F/TUXqR3iEOqc9/QJQ+zukjD8ViAqPxrwxvXkCBIS7LL/eSx/q3iZDf3Eelgb4dJ0zARvVCpL9F+/zY309b9KpAGotfyGAnBF01zeQUWe8OA71/XQkleALfF3FcpSLXvtxV0tYotgNN1kylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4oLhbG+2YnehDsmZwj+uRcPVWI8k8GPJD2dGDiForo=;
 b=tIhL6JrtHlFZp9BQ3STboDjZXSYA7PCAAYm2P7k1CvU3qlBRfVXQ3WSozRBGyQ8jfu7R8tMlzg/EPB0XHRvakdL+Kjzi1kIr93ZdSPHomCqte1KFfEW5/vqV2k4SfdreKM2bacZS6viUbxIS5zt7ZI8B/dN+gMiZqi8YO1/EkbGBm2Vbl+eoQ4HwKYUF2Cbddthnwfsct7chav5WkHmqKMldqJtKOC8F4ic70XSYS1InJdXf/HP4ZlCLqoyxlBv4ZB0+eFOOdqQuQoJXudD2v4rGcQgkELaMeYL7rVktkA0Id9gnncn1v8HpDw04772fAyXmwCtqdSpx3SOLztRVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4oLhbG+2YnehDsmZwj+uRcPVWI8k8GPJD2dGDiForo=;
 b=utO+L1HAnSHjwHjK8cK1DmAULVtxeTgDnct3RMboHlmTWrArNXaJDftFqPRyqTTWjh0iO1L2HdbYO7E1NGTMSBIjlrcZjTUv2iyePYOpzP6FlICAXhdIpm5bvzVb6g3tBkVvrnObb7ZDqI/7GsKn/wYdbwePm5osfKVakga0NY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Apr 2025 13:22:05 +0100
Message-ID: <D977IWWCSWMK.2JV329ZHXLA2J@amd.com>
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot
 domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>, Jason Andryuk
	<jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-17-agarciav@amd.com>
 <93bad6aa-57a8-427d-a0f6-924f03f0db34@suse.com>
 <D96M14WZ37ZW.D7AAHJ3RMV9D@amd.com>
 <2b269381-d002-4aa5-bad4-8c677b8a4b0d@suse.com>
In-Reply-To: <2b269381-d002-4aa5-bad4-8c677b8a4b0d@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8366e7-f3a3-4e72-f3f5-08dd7c1823fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzN0YTBjOEV6MGJINHRKS0oyTUd4RFdYRUQ5M092R3NTUTlOUHRUZnlwVzRO?=
 =?utf-8?B?MThqd1o5eVlQUmJjaEl1Vk0wSkROYVNXaVRuRnpKNmptOUlQTG1KdlVWNUxE?=
 =?utf-8?B?Qzl6Yk04Y3VteS9zMzhXMGpZTEZpcmt1Y0pobGlMd0s5RGpOTG9HTVNGOHJk?=
 =?utf-8?B?UlhERkFUYXQ2UDJwdXhaT050S2pMeVdIZVpic2FHaVFIbSt6UWN0Q1NjTmVB?=
 =?utf-8?B?dU5KMXlmSnhkbFhTQ1NmRlcyQVJVclMwWkpQTXNMMkEzZktaZjZzM2xoUXpE?=
 =?utf-8?B?T3dYbUc0RWFJclh1eUFXbU5COFJqYTFCWHo3SFI1OFpNbDNXTnRRM1NOb1Zm?=
 =?utf-8?B?QnNGQkRMNFp2WkJhMEdjZzBycmRQU0o5bTQ3TkpCMU9qNjkzemcwVldrYzVp?=
 =?utf-8?B?emg4b3pYbHMxeVlxU1NpRlBWeGZPN3JsK3pjd3JWOGl2dWVpK3BKTnlkQ1F6?=
 =?utf-8?B?VDNsMHZzaktXb0t6K2JpWUZCZ2J2WVVXSTZZODFDUFJXNnZvZFExZHBlWnNV?=
 =?utf-8?B?bytjVWE5bVhUNkErUmhCKzFtNGtrUmpKOXZBQ1p6NEJ6SVBrcVlWRW1CZ0R1?=
 =?utf-8?B?M1FtY3dLRFNaOXpRUFdYaWJlNzJTc1hyVVlrRWJMYnNmNWtVOUdwVUZnVm5v?=
 =?utf-8?B?OTV5Wi9uTGJIelpDZGV4bzlER3VrNHJ3c24wMTJhdjJJV1VQSHR5Zlp2UUhC?=
 =?utf-8?B?Q01Ubi9WOWxVb3oxRGN6N1VwUGsvZFdBY0MvWXIwSENYNUxUS1Vhd0RQaFpR?=
 =?utf-8?B?bkRGb1BDNVErL3JaenVpWnU0NnhJTzA2ZlhKZ2E4OXplYkdCN0ZGeTN1dDlJ?=
 =?utf-8?B?OFJZYmRVbE5ybHlnaXBlTVJJN0daRjhTRVhEWEVLU2I0OWVTdEpQdTVMQVd4?=
 =?utf-8?B?LzYwYi9JMHI2ejExN2QzTENiL0NsS0dtUlg3VHc2U3RTcjBVLy9kckRqMnlu?=
 =?utf-8?B?SjhZNWliT2xvQUNROEMxcjQwclZjejdnNmx2NVF6UFZkTGcyeHFzWUJrQ1BS?=
 =?utf-8?B?ZzhEc0tTS3E3eFlITFplUjE2anJ0d0RQdThpRWVTc1U4Wk5TQ2N4Q0xEY0Yr?=
 =?utf-8?B?enZUaVdJQmtTcmpPWjNwNE9wUnBCb0pST3cyYXNMM3huZ05KRnNDOWpyQkhV?=
 =?utf-8?B?TDZrSE9xaUdSUmc0azh3cFJsd09lQS9oc1g1U1l5UXhpTWo3WEwxMmltamtR?=
 =?utf-8?B?bWttVXpDQitOQ3Jycnl5SGE0TGgzSXd2ZktIU2p1QUwxdUJVMWV5L05ZTzRE?=
 =?utf-8?B?WkU0SnRETUFKRWpydzZ6ZnRRbzlxRjVxOEpUYVdtZE0zZ3dFcHZxajhNOHJz?=
 =?utf-8?B?OHkxazg3cnZoWHJFNmcxWUg5ZHpYbFc1OXVkUWU4eHY3ZWxtTlcxNHdiYmtm?=
 =?utf-8?B?djZ2T0plZFp1SWlpWnZTRCt4dVprcEY1VFVWQ09Bc2dNVTFndlE2UEFjaHZy?=
 =?utf-8?B?UWhGUHB4YkxrQVprWlhySTFqSlN5SEhNNkNMYlVQZ09la3F5RXIxUWJ3U1N4?=
 =?utf-8?B?WFNkd3pwUTRyRm03bExHS0pKTTVLVEFuY2xRK29LVnhCMSs4dXMxbGpZSHEv?=
 =?utf-8?B?SUo4S1ZGaVA5WnIvc0lydktzY3FHWmp1aDdrTXNmdjRDMjRwbC90bEhGR0x5?=
 =?utf-8?B?clMxYVZEZzZVTGtlUmhCRCtzQ0dieWFqeTZ0RFhhSmxtOVZRcEZNbzFBNUw4?=
 =?utf-8?B?VU02UnBtQzRzOVg2YzhBWFh2U0hNVVcyWEd5ZUg1eHhhaTFLRVBjWTg1T0pj?=
 =?utf-8?B?QnkrQjZ4RUZUWjlPcXBNN0pQQTh2YkhsK3dxT3FpM1o0c01OSjlCRVhjTVRN?=
 =?utf-8?B?RFV3cmV3Wk1PNCtGN3EzNjZ6TDRSVmd6bUJtQnRwenlIaUhoNkNIbktYODZP?=
 =?utf-8?B?UCtaVCt5ZXAvZmsyU3JwQnc2SzFxd0h3UXY1VnQrMEJWeXB6YWkydjBZV2No?=
 =?utf-8?B?QWVYUTBKWExmOEJWYi81MmMvQXI2djVDZ1ZSN0ZLZGRaZUJUOFM3YUpTZ1Jt?=
 =?utf-8?B?dlJud3lxbUcxMDZMWGlDdTBKMStIakFkYWwyWVMyOGYyYmZJbXdIU0pobmdC?=
 =?utf-8?Q?8rp1wE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:22:08.0783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8366e7-f3a3-4e72-f3f5-08dd7c1823fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

On Tue Apr 15, 2025 at 7:38 AM BST, Jan Beulich wrote:
> On 14.04.2025 21:31, Alejandro Vallejo wrote:
>> On Thu Apr 10, 2025 at 1:18 PM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>>> @@ -257,6 +257,18 @@ static int __init process_domain_node(
>>>>              bd->max_vcpus =3D val;
>>>>              printk("  max vcpus: %d\n", bd->max_vcpus);
>>>>          }
>>>> +        else if ( strncmp(prop_name, "capabilities", name_len) =3D=3D=
 0 )
>>>> +        {
>>>> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) !=3D 0 )
>>>> +            {
>>>> +                printk("  failed processing domain id for domain %s\n=
", name);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +            printk("  caps: ");
>>>> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>>> +                printk("c");
>>>> +            printk("\n");
>>>> +        }
>>>
>>> Like for the other patch: What about other bits being set in the value =
read?
>>=20
>> I take it that the non-worded suggestion is to have a mask of reserved
>> bits for each case and check they are not set (giving a warning if they =
are)?
>
> Whether a warning is sufficient I can't tell. I would have expected such =
to be
> outright rejected.
>
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
>>>>  {
>>>>      char *cmdline =3D NULL;
>>>>      size_t cmdline_size;
>>>> +    unsigned int create_flags =3D 0;
>>>>      struct xen_domctl_createdomain dom0_cfg =3D {
>>>>          .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integ=
rity : 0,
>>>>          .max_evtchn_port =3D -1,
>>>> @@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct=
 boot_info *bi)
>>>>      if ( bd->domid =3D=3D DOMID_INVALID )
>>>>          /* Create initial domain.  Not d0 for pvshim. */
>>>>          bd->domid =3D get_initial_domain_id();
>>>> -    d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privi=
leged);
>>>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>>> +        create_flags |=3D CDF_privileged;
>>>
>>> Seeing that builder_init() in the non-DT case sets the new bit uncondit=
ionally,
>>> isn't the shim's only domain suddenly getting CDF_privileged set this w=
ay? Oh,
>>> no, you then ...
>>>
>>>> +    d =3D domain_create(bd->domid, &dom0_cfg,
>>>> +                      pv_shim ? 0 : create_flags);
>>>
>>> ... hide the flag here. Any reason to have the intermediate variable in=
 the
>>> first place
>>=20
>> Well, the logic would end up fairly convoluted otherwise. As things
>> stand this can be encoded in an if-else fashion with 2 calls, but
>> there's 2 capability flags coming that need integrating together.
>>=20
>> This is just avoiding further code motion down the line.
>
> Is it?
>
> -    d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileg=
ed);
> +    d =3D domain_create(bd->domid, &dom0_cfg,
> +                      ((bd->capabilities & BUILD_CAPS_CONTROL) && !pv_sh=
im
> +                       ? CDF_privileged : 0));
>
> isn't really worse (imo),

Not sure I agree. Long conditions on ternary operators makes the
control flow harder to follow.

A nicer alternative that also removes the auxiliary variable is to have
a helper to convert from bootcaps to whatever createdomainflags are
required. That'd extend naturally for more bits.

> but is highlighting the problem more clearly: Why
> would the shim have BUILD_CAPS_CONTROL set in the first place? Without th=
at
> the statement would remain pretty similar to what it was before.

If the commandline is parsed early enough (I see the early parse path in
head.S?) it would be better to add this logic to builder_init() and
prevent the capability from reaching the boot_domain in the first place.

Then there's no exception for the pv shim.

Cheers,
Alejandro

