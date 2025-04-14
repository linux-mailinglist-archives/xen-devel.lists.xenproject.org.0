Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2573A88C4F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951338.1347434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PWv-0005rE-Rw; Mon, 14 Apr 2025 19:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951338.1347434; Mon, 14 Apr 2025 19:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PWv-0005pd-PG; Mon, 14 Apr 2025 19:31:41 +0000
Received: by outflank-mailman (input) for mailman id 951338;
 Mon, 14 Apr 2025 19:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4PWt-0005pX-TF
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:31:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b82d72-1967-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 21:31:38 +0200 (CEST)
Received: from BYAPR21CA0005.namprd21.prod.outlook.com (2603:10b6:a03:114::15)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 19:31:33 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:114:cafe::c7) by BYAPR21CA0005.outlook.office365.com
 (2603:10b6:a03:114::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.11 via Frontend Transport; Mon,
 14 Apr 2025 19:31:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 19:31:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 14:31:30 -0500
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
X-Inumbo-ID: 14b82d72-1967-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fie2ck1cfvbltV+ZRWrLc62TOW5j2t6wbuZhKA22W+zRYNPIfyrKiomfYXcLmr15JeNs4oQrktpHCkWSsvd9BCm+9LXcRqmJRwmgvFXczG7FNPgNvw5CjNg8bW8TA1I7YTNO84TZBozv8zscMY1oNxYscKmG8uusA83jV2Czoqz1uGYYALpoErbezW7z6XnQAvKsyzA3nvZ/nfK60/xJEMtjEOD78WGTaWvSLUno4I1ixhjPulIF7riM3k+Dd83gKb1CqkUH6XZ8BtOb9t75/ChrPigXjFi7ODNL6WVWHTcC875VFiqXyVEVq7LII9QPs+p0cj+foTRaJeWKx3sY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NedxB70gyIinom5R3Vejt0xl8WoqeM9u1PaHTk0lkoc=;
 b=QZZViK5RV/ZgU51nYtPVOttAcU9Nzit4TKAHfvnt2vp8jx1ADqpnGr0F9pEKTJB5JRSrstK7GikAOXDgwE2uBDkir+EYycsd2YVbZkSc1e+HknYPoiCDWiinVTeXiappiewC3NXMkerlccbfFDonay6bLl7AHRxMQwHuPJq3tsj/bx7MdWeuaJP71NayuNAFkLZ9sxc+rNtIvDOBJ2dZ/2UqTU7o565dtI9yeOsDOBFK641/rwjmHcIv80oN9MwBDqow3Hcanm+d9eu3z8waSfI28Ch5SJPyZ38NTSjbsq7VPzQ/EvQKV37r7QeHq+KYfsmW6APN+uzsnAr67+Mw/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NedxB70gyIinom5R3Vejt0xl8WoqeM9u1PaHTk0lkoc=;
 b=OBp5wy4Hf0v+7gFVlZEpiUiHVs05sS+f4QQt5xMOURCUhNxMTt9SVVyCG5XaVe4N9pZU/Ywco+sefbY80vB5bbIGgZqtyJYaoTOifIYit8tXhgv2H+v4RbDUh6fJnKrxIMn7v9C1SIleDQ3NPRB/Tq9+5bV1OmcPVCj8vjDpewk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 20:31:29 +0100
Message-ID: <D96M14WZ37ZW.D7AAHJ3RMV9D@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Xenia Ragiadakou
	<xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot
 domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-17-agarciav@amd.com>
 <93bad6aa-57a8-427d-a0f6-924f03f0db34@suse.com>
In-Reply-To: <93bad6aa-57a8-427d-a0f6-924f03f0db34@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fcb2e12-b77a-4ab0-d7df-08dd7b8af62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFF0N1ExbTJ5aVcvZ1kzWTh4TEZwam5uMFVVMGVRZzBmZENYaGk1NDBYWFh4?=
 =?utf-8?B?Ky82MlFqalVPUmRQS3VrcmNYeW9heWszNW9OVFlxSVhyRjlBczN0THozbjNV?=
 =?utf-8?B?aVhYV004Q3lmWUVMSmlXSGhMUmZPMnRnU0NLUXNxQTYxM1VxK05oQTVnOUxD?=
 =?utf-8?B?a2RLVXlrSXpRVWNCa2FqblhmWC93Wk1VWTlQT0hsUFJEVUtaZFgwOEhLK0t0?=
 =?utf-8?B?SFdzV1JHbk0yQ1ZvUEJRQXBEVFBoZ0hoYjNGRHFFMzZ0azdBNEFzSlZ0Nm8r?=
 =?utf-8?B?K3FER0srNXM4THgvTkx1RG1INjBlZ1BvVjVwd1JubFY5RFJBYVJLWjdLVzdP?=
 =?utf-8?B?TVViOWJyQTI2VE9aU1NUY3cxK0MrUFlwMi9FOVZLWFRoT21lcWFoUmZLR25m?=
 =?utf-8?B?dEFLQWJ5Q3NwYXZUNkUrZ3NyNXpuMk80N3lPZzlyTzRrWnNBck1HWHhINlNo?=
 =?utf-8?B?Q2JqVG5xeWZXOVZjckh2TFE0dDVCQ0JvTEhYTmswRVlXRlcvVnpwZEN3RU5w?=
 =?utf-8?B?a0JQTkJLa0EwNSsxcUxGNWVjRXJKRmRSbHVOQkRQaHQxQmo1cTJMVWp2cXdT?=
 =?utf-8?B?SmlNZXI3MjJ1aTMxN2l4a2daMk9SUm5WWlMwalZVQ0cvcEw1VW9QRTlGRm0v?=
 =?utf-8?B?YWh0WmlnZGg5ZlVlT2ZyZXd5Ny84dXREekhpay84SVVEMXRUYzZ1VXJkWFJH?=
 =?utf-8?B?cXE4THBmbjI0Q2VzLzBzbVNUVkY2QlNiR1RDdVhlVDU2WURKNS8yenNZNkRk?=
 =?utf-8?B?dlVsTFVqUUY3a3kwRG9naHMva2hlOUhrM2FaRG9PVUVKd0Uwa2VOd3NsaHgv?=
 =?utf-8?B?TVJrbnE0WWxZc1NjMlluT1lSSHpNY2JvZnhUN1kzQWhkK0JSbURNWDI1Nksr?=
 =?utf-8?B?N0l4VjhnblY4SDBKRStZWHJXczMrSXY1U3pIamtkU3BaSUUzaHZ5QllIUDR1?=
 =?utf-8?B?dnljMWJJNHdKaFYxT3pRbng4VFQzdkZ5VHY0eFhxN0Jybkl3dGZldHBpbmhh?=
 =?utf-8?B?QXlWS00rREFWYnBkcFhHa2RZdVI3ZHg2MkdITmtiQ0Z2ODBJTXpmQzZJR2pN?=
 =?utf-8?B?bEpHaUpwVDNZY1FFSVpGcDVzcXY0Y2NiS29uUk5QV016Umh4UHVxK0VTVWJy?=
 =?utf-8?B?dkhFTWxsdG12NisyWVBkSVQ1OHBEeUFLdUVVM0hCNWh1SEM5LzRCN28vNllG?=
 =?utf-8?B?K3hDMFNkREtNNU9ibjVRa1hvREhEMmhCUGUxcmV6aXlDWHR5Y01QR0hYazli?=
 =?utf-8?B?M1VlUi91Wm5HWFZ1TWNTYjU2QStUYWk2YkVIYUZDQ3g2ak1qTm1ONkNCaVMr?=
 =?utf-8?B?d1JoMDJucWVDeWxnM3Jzd1MzTzJ3WFBLWFphamJZSlJDdEw5bWpqS3I3SzRh?=
 =?utf-8?B?eTVpQUg1b2VBSkNkL1BqelZzVHZMbWFqeWJZdWxRcWE1V1NDV25lNHRLR2dF?=
 =?utf-8?B?bEIrdnVsQ0VOa0hocG5XZy9vZ25Nd3RBK2I2dUhxT2JVOTN1ZXJhSlZ3NzA4?=
 =?utf-8?B?YkJyWkphVzFCb2VPSDNPQUU5czNIV1dNOE1wVWhXWmR2TXc2eWp2ZnBIQ1FG?=
 =?utf-8?B?SDlyVUVkUnljMU1tUGhlMmF3bC80OG9uOGV0ZkRBUVZqRUx2MHRhVEpKbURI?=
 =?utf-8?B?Q2sxNUl0R3RpcXA0N3pCUEo4NTRYc3UvSlV3b1grUjNDdTFIUmFWTUVaSUc3?=
 =?utf-8?B?bk1zb1FGbldCZzZra3VyL2l6c3NRRHhvTHU5bFBXaGxwN1JLMjM5aTEvVHJi?=
 =?utf-8?B?M2Jjb2EwQWsrZU9CSjYxRlkwM1l3cnBNTTZ1UkZnNHVkcThacVE0aVpneDRE?=
 =?utf-8?B?MjZKdDVvYXBnbUJJTHdiQ25hc2krKzIzTzVxbjU4UkFEUERpVW9GVUJMbDB3?=
 =?utf-8?B?SGNKeHlEcWRmclY5R0laQlE4d3NWZU80VTBiRFJyUGRWZ2xmR1pINTV5N1d0?=
 =?utf-8?B?RFFyZXB5OFpBQUxoWCsyMy9hODFrUmFUb0pZb3NFSVZvRlYrSWN5RDg4OUZK?=
 =?utf-8?B?ekxITzV1Tm53UnZGSnRMbnBzM212Tk8zbXR6VDg0N2JLRzI3L2liZmJkaDZK?=
 =?utf-8?Q?HBv+Ei?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:31:32.0777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcb2e12-b77a-4ab0-d7df-08dd7b8af62a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907

On Thu Apr 10, 2025 at 1:18 PM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the ability to assign capabilities to a domain via its definit=
ion in
>> device tree. The first capability enabled to select is the control domai=
n
>> capability. The capability property is a bitfield in both the device tre=
e and
>> `struct boot_domain`.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>
> The R-b feels kind of redundant with the subsequent S-o-b.

I'll drop it.

>
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -257,6 +257,18 @@ static int __init process_domain_node(
>>              bd->max_vcpus =3D val;
>>              printk("  max vcpus: %d\n", bd->max_vcpus);
>>          }
>> +        else if ( strncmp(prop_name, "capabilities", name_len) =3D=3D 0=
 )
>> +        {
>> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) !=3D 0 )
>> +            {
>> +                printk("  failed processing domain id for domain %s\n",=
 name);
>> +                return -EINVAL;
>> +            }
>> +            printk("  caps: ");
>> +            if ( bd->capabilities & BUILD_CAPS_CONTROL )
>> +                printk("c");
>> +            printk("\n");
>> +        }
>
> Like for the other patch: What about other bits being set in the value re=
ad?

I take it that the non-worded suggestion is to have a mask of reserved
bits for each case and check they are not set (giving a warning if they are=
)?

>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>  {
>>      char *cmdline =3D NULL;
>>      size_t cmdline_size;
>> +    unsigned int create_flags =3D 0;
>>      struct xen_domctl_createdomain dom0_cfg =3D {
>>          .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integri=
ty : 0,
>>          .max_evtchn_port =3D -1,
>> @@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>>      if ( bd->domid =3D=3D DOMID_INVALID )
>>          /* Create initial domain.  Not d0 for pvshim. */
>>          bd->domid =3D get_initial_domain_id();
>> -    d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privile=
ged);
>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>> +        create_flags |=3D CDF_privileged;
>
> Seeing that builder_init() in the non-DT case sets the new bit unconditio=
nally,
> isn't the shim's only domain suddenly getting CDF_privileged set this way=
? Oh,
> no, you then ...
>
>> +    d =3D domain_create(bd->domid, &dom0_cfg,
>> +                      pv_shim ? 0 : create_flags);
>
> ... hide the flag here. Any reason to have the intermediate variable in t=
he
> first place

Well, the logic would end up fairly convoluted otherwise. As things
stand this can be encoded in an if-else fashion with 2 calls, but
there's 2 capability flags coming that need integrating together.

This is just avoiding further code motion down the line.

> (can't resist: when there's already a wall of local variables here)?

Heh :). Point taken.

Cheers,
Alejandro

