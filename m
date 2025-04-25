Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B87A9C922
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967912.1357636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IPZ-00078P-DV; Fri, 25 Apr 2025 12:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967912.1357636; Fri, 25 Apr 2025 12:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IPZ-00075k-9a; Fri, 25 Apr 2025 12:44:09 +0000
Received: by outflank-mailman (input) for mailman id 967912;
 Fri, 25 Apr 2025 12:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8IPY-00075e-2H
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:44:08 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f85849c4-21d2-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:44:05 +0200 (CEST)
Received: from SJ0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:a03:2c0::32)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Fri, 25 Apr
 2025 12:43:59 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::9e) by SJ0PR13CA0027.outlook.office365.com
 (2603:10b6:a03:2c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Fri,
 25 Apr 2025 12:43:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 12:43:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:43:56 -0500
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
X-Inumbo-ID: f85849c4-21d2-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z20d6EkBUDoNWTvRJY1cTxP0n/5MbquVCJhvLW4xdyYNbNSylVB6B9ER708rJCM7CZNJZJQowGcLPTtUistwUBS+G9DetGq2xG8/aj5ulVvPNIcCn29eno52ELexGfJh6VjgiakP7BwESylvUQQ9VhPKoLXPsSmxXKGXxoa2WO1rxE9vQFfDPp6MfgDyGQHB3MF92NS4atKTL39KTx9dCdmq4b8xMO2skwwDSckxArb53eJdszsyALA8huPt0j4DF4YRIjmt2iJLvROYxc3/+rmC+WZYQrhqQhRc4CR1h3Bay1QRYcw/t/H7KtCzJgBsZ0kJEsSgwz0G4HLk4m6VaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcYmEprzaZs/Q6kbtd2FxUIRyxvkasqXfYSFz94h1RQ=;
 b=U6Tnx6LG6VuhnLngVtX6GPYIZQnsxLOEjvdxUzhMLtCE7S/fEiIZhjMwC8dhcgzY254JQB4v5pVAKHHVwrtFaM5ASiaSfhrZQf1TBLuu64YVd/w8Y+cRYTv+Na0FEeCRnSxvELqbhVOZcAw7RxruthObrGFUZBBtkThAOdLUhwOEVEIDKT7pRWi0ceReDcxb87xIefyUQ+YqIqatQwgbb+ixcgjTFefrdtKWyt2GurJOzq7C5TR4LM3FCJ7YolN30RQs6xQZZ4TmGT7IdEZV9QdjX8yXe4u8wUvUAWSx9ErK0w1xhPFOy5vwXX8/jFhuVZp8/s91EKWN1tyiumtz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcYmEprzaZs/Q6kbtd2FxUIRyxvkasqXfYSFz94h1RQ=;
 b=nFOJff7oFy0ZcJa/IC8DOGWafgcpxv7jTgOMSFyM7rLzjEmCMKzBYkeU9r9pobtbwmbo5GyWO/sIiM6NLhi6K3GbjVLIcii0TuBhKCKP71gy/Ot/A64iUwO8f44VXhY5t/9GxzIYr5zvg+PPgBbt+D7fc3oAqR6O8f305KpYYHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 13:43:55 +0100
Message-ID: <D9FQ92LKFYB8.1S6OJT81HUCXZ@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 08/12] x86/hyperlaunch: add domain id parsing to
 domain config
X-Mailer: aerc 0.20.1
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-9-agarciav@amd.com>
 <6a37c1ac-8f5d-4c06-bd74-10d35e0dc1a6@amd.com>
In-Reply-To: <6a37c1ac-8f5d-4c06-bd74-10d35e0dc1a6@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: d7674bd9-5ac9-4825-e1c7-08dd83f6d907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW1hY0NubXpwZG1JUGZtNk9Ic3VZVjVIUzZweGxJM09yc0c3dFNWMmdLTWlG?=
 =?utf-8?B?eUdySHY2cjRRd0RBcjgyTDk3enJQMXB4bVBqU2g0bEVkSFkxcFJzVU9XZVF5?=
 =?utf-8?B?ZWxDTytLNEFkMlQ3dWRnR1IxOXMyZjNOUWROQzJxUStVdURxN3FpYXRpV0RK?=
 =?utf-8?B?TVd6dXFRZm50b25Gd2k5b0NIa2FsamlTQUhFZ0pWcTd4ZjlscnlEOTk3ejhT?=
 =?utf-8?B?enFmYWtYNHJZc3Q0UENMcXBwMDRqdGVDNDk0bXBmUWpUcmdNaklscjRDQVFy?=
 =?utf-8?B?eExWU2lKdDdTdmF2VkhhVVJzcm1yS2ZvWERkaXhRbTM0QlFqdjRyeDNLb0tX?=
 =?utf-8?B?eVR0b3NrdWFGSmU0RGNnY2hYRFhQY2xvTUZSMFl3c0N6MHVvRHNNL204Q3Q0?=
 =?utf-8?B?aHZVc2dPdXExbGllYzFMZFQyd3hlK2lpNy91Zml3akE5ekNkKzdpWEJFcCs3?=
 =?utf-8?B?SWlVVE10VkFMQTg3em8yS1U4YnlVN0VmUWhuSWd3cytQN2E2M2RrcW5CUnpm?=
 =?utf-8?B?UW95eGp0ajZ0cUJYTjQramlHVzd1NWJmWk5vRU0xeno2aEwxbDlZY05PRWJS?=
 =?utf-8?B?NkZBbGxoWlBJOWlFNHRlY1VYNk43NlFEbk1QRk1lYkdDOGNDSldnV2JKWmxK?=
 =?utf-8?B?MkFwdk1vb0RXaEo3a0d0RUhsZlV5ekM3YzFCcTNpRkFrTXh6WHNzdU8wQjRG?=
 =?utf-8?B?NlVPK2FhQjdEV2djZmk1RzdtU0FreG45WGNmcEFQN1pHcGJZQ2tGOVdPL3Fm?=
 =?utf-8?B?TXh5TUdtM2RuV25XNGR2U2gwd0JXcXRMMGUweVNEaCt5Y21ITnY0YnFGdDFw?=
 =?utf-8?B?ei95N1V2TVVnV0NoTTZCOFY4THJVVDRiUFcyUWtZMlhnNnozMkhTMFFMUXdE?=
 =?utf-8?B?TERzekg2TDV1ajhjM2JKV1hoZmVrYzUxdEY1cWFwWGtTTFZpazVGU0FyNzZC?=
 =?utf-8?B?TkI5UUI0R1BLVzZzeUJjNVhwL081dWtSb2FwUkpDRkZRUzNPMjQ4T1dqcm1I?=
 =?utf-8?B?Q3ZTT1l1c241ZE44czZpSFR0OHBhQlJyek9XejY4d1B2KzBpTVV6UFd3RXBW?=
 =?utf-8?B?eHJTbTFTMTdZU0llZDQwMS94RnNXVCsrcmkwUmN0eXpmdkcyTDZLbjgvWUdy?=
 =?utf-8?B?QmFpWkJCUkRpZWtEeTYzdGpjRFYrMTJ5bVNHdXFvRFJTaE10NDEzRDJvWGV3?=
 =?utf-8?B?TWtHeExqZWdxSGtJTjJrTmdzdjFJbGc5VndtdWZpelVEKzRvazRNVm9oaWYy?=
 =?utf-8?B?ZFNudFprTUFFSk84S0RLQW1EMEtaSTBPeURQcG1PVXZiZGJyMkFQTFJxNGtJ?=
 =?utf-8?B?cDJsUmZ5ZFQ2UkhsUjIrUUE3S2xBTmNNUFVwbjc0RllqSXhqVDhsNUk1Y2Q0?=
 =?utf-8?B?Uk1ickt0NFdFTXRHVHd5bDQrckJHWnVHWDBCTGpYRWZiZW91Y0RMTWR6eWpr?=
 =?utf-8?B?bllSZjJOM3NsUUx1TldUVmJudHV0Y0FrK1FMVTVlRjNBZ2loZjRHK2UyZENm?=
 =?utf-8?B?VzdkSGdNODRtd05Lclk0eFE2Y3BwTTRyN0pOZHF5S2VjR1VsMGswaDVRN3ZO?=
 =?utf-8?B?bGNKZjFQRS9KNjV1U0l2eWM1OENUUlVSZzViRmorNEQ1TjIvL2M5dzhXeHMz?=
 =?utf-8?B?emYzbUdKeGxkTCtRWjFEVjdpczFPUnJjaXRNK3ZZTElkLzgyaDZsamJEdnY3?=
 =?utf-8?B?RjAwTDdyRnVDRkt3QTdUbWgzWXJpN0ZUd3VIUzVLdnZjbmtoZjlIVWw2eHl6?=
 =?utf-8?B?UVJXNTJyS0dmZGFnMmwyWjZOSnJoZ3BvSXkrNDYvQWRmQ3l5Wlk4WW1VN21j?=
 =?utf-8?B?Zll3S252Q2RJdjZPUUlUZUhZMkJJRzNOTFFJM1M4MWRVN2NuaHZQWi9jd2lz?=
 =?utf-8?B?bFFibzZWVDdLaG1EU1FjUHM4UUlNbXhTWVJ6cSsxUFNrd0FYdHorTnhTYUpG?=
 =?utf-8?B?cFUrRlYrZ2xXSGhWOEwvSzBEN1c3d0t1N2pZbXBiWHN5NkYvNzhrZUh2aDZB?=
 =?utf-8?B?ZFJlNmFURGJIQS84M0pQdWNWRDNHUnhxK0VmOHZQU0wvajQyN3Z0c1BNVE1t?=
 =?utf-8?Q?aZVT5v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:43:58.1438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7674bd9-5ac9-4825-e1c7-08dd83f6d907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195

On Thu Apr 24, 2025 at 6:41 PM BST, Jason Andryuk wrote:
> On 2025-04-24 12:10, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the ability to specify the desired domain id for the domain
>> definition. The domain id will be populated in the domid property of the
>> domain node in the device tree configuration.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index 144fcc75b5..5a5b3c8806 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>
>> @@ -188,12 +189,54 @@ static int __init fdt_read_multiboot_module(const =
void *fdt, int node,
>>   static int __init process_domain_node(
>>       struct boot_info *bi, const void *fdt, int dom_node)
>>   {
>> -    int node;
>> +    int node, property;
>>       struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>>       const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown=
";
>>       int address_cells =3D fdt_address_cells(fdt, dom_node);
>>       int size_cells =3D fdt_size_cells(fdt, dom_node);
>>  =20
>> +    fdt_for_each_property_offset(property, fdt, dom_node)
>> +    {
>> +        const struct fdt_property *prop;
>> +        const char *prop_name;
>> +        int name_len, rc;
>> +
>> +        prop =3D fdt_get_property_by_offset(fdt, property, NULL);
>> +        if ( !prop )
>> +            continue; /* silently skip */
>> +
>> +        prop_name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), =
&name_len);
>> +
>
> Stray blank line.
>
>> +        if ( !strncmp(prop_name, "domid", name_len) )
>> +        {
>> +            uint32_t val =3D DOMID_INVALID;
>> +
>> +            if ( (rc =3D fdt_prop_as_u32(prop, &val)) )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "  failed processing domain id for domain %s\n",=
 name);
>> +                return rc;
>> +            }
>
> Maybe add a blank line here?
>
>> +            if ( val >=3D DOMID_FIRST_RESERVED )
>> +            {
>> +                printk(XENLOG_ERR "  invalid domain id for domain %s\n"=
, name);
>> +                return -EINVAL;
>> +            }
>> +
>
>> @@ -258,6 +301,13 @@ static int __init process_domain_node(
>>           return -ENODATA;
>>       }
>>  =20
>> +    if ( bd->domid =3D=3D DOMID_INVALID )
>> +        bd->domid =3D get_initial_domain_id();
>> +    else if ( bd->domid !=3D get_initial_domain_id() )
>> +        printk(XENLOG_WARNING
>> +               "warning: unsupported boot. d%d is not the initial domai=
n.\n",
>
> Maybe:
> "warning: d%u is not the expected initial domid (%u)\n" ?
>
> It's a strange message.  The domid property is added, but it's not=20
> expected to actually be used?

It's just a transient message until multidomain boot is added in a later
series. It's merely informative that you're booting something you
probably didn't mean to. Or didn't mean to on this hypervisor.

>
> With the newlines addressed (and optionally the message change):

I'm happy to make those adjustments.

>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks

>
> Thanks,
> Jason

Cheers,
Alejandro

