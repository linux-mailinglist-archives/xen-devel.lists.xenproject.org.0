Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C1A89D21
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 14:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953746.1348179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4f2O-0003Bw-J7; Tue, 15 Apr 2025 12:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953746.1348179; Tue, 15 Apr 2025 12:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4f2O-0003AW-GI; Tue, 15 Apr 2025 12:05:12 +0000
Received: by outflank-mailman (input) for mailman id 953746;
 Tue, 15 Apr 2025 12:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=moIN=XB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4f2N-0003AQ-KM
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 12:05:11 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2405::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0349a31-19f1-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 14:05:10 +0200 (CEST)
Received: from CH2PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:52::25)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 12:05:03 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::8b) by CH2PR04CA0015.outlook.office365.com
 (2603:10b6:610:52::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Tue,
 15 Apr 2025 12:05:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 12:05:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 07:05:01 -0500
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
X-Inumbo-ID: e0349a31-19f1-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUZlHaxhLu6CgDVi7nBluj9xr6WlvE/HjjM1hUd6GuTWp8HmZOHh4sZOvi6IkPIdgVKP/u8OLQ4MMGQhmpePbCQcTlPmp/wqzixIbGNJW/5LFGj8h8ZUy5ACgI4IcmiR+heaJLURHr+zPkhzFWg5C/12UNc5FTA0WEq1btJRlXwujnvQ4oTPHWRbn41DUcziKbBGEYL52Fc8zjIPbyrFViD0MelwZ1lr9O86ewq5TQSRh4dubjy4PO1fGkyHgHXfcK8X1xgE7VOM9Pcn6V4FyUYOvbGMwh+SGRuZME1i2znmx5zUz9jUtAJfLRvrL8HI0G+WcyDJPqbQPQbWqwnulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt8cr6tCOMgT0yokO7uoWMtfj1MPWDXknFgNHtF+tmU=;
 b=trrPXZiYOi9xIHctVjKdXhwDSngJmAh3OrBBGw2hyvfIFGgHplxK8DH8zYjlfzHU31A9CjG7pkySuoI4Z4ULFUzyaeF41aOBvC8gMrOCAChYAYQVmfQizFtf0vOUa0nffFIscjIhmoDN8LIbDfpDY/9Nyh1xyRKmdDS2XmWVDGc96orZyPBgpKUNN3qFqLMDg5ra3kagjDdvareDQarfCkk6Ufn4HEncXG763uIu4ELptdl47DTtIx735IdD0D0sJeaSZkUPknEO7XDvcIOf15SqcpyvM9LneiOofSUU6Zu4g1KG189JacIlcQKS1wzzTlg1f66dFUCHRMDN9x7+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt8cr6tCOMgT0yokO7uoWMtfj1MPWDXknFgNHtF+tmU=;
 b=M2kscHh34BnTzX8S8EMf8y2J5UinizLaCiMJRrg05k/tsK0hRSpnseu7qOuTIkI6Latcj1+GSk/RNIJ/7KEZaNkcTAon1o4QiIG7Xn38KlCGjonOCrpNziRgcAV2zF5CV46mmF/GEI6nIiuYygKN67IG2sWi5Rd2SF6X6rV0bMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Apr 2025 13:05:00 +0100
Message-ID: <D9775TTK4FZG.3E5KDTZHDHVE@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to
 domain config
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <6ce79cc0-1fec-4ad9-834e-680ef1f81549@suse.com>
 <D96KUGJTQO7F.39OKDX33SSKYH@amd.com>
 <1235d73d-ec62-4223-a92f-7a19d802c306@suse.com>
In-Reply-To: <1235d73d-ec62-4223-a92f-7a19d802c306@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd7c304-12dd-4f95-476e-08dd7c15c117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTdlWlFUc2UrSTFucXp2bDIvdUtIc2N1VzBNYkJ6Qk9Yd0g0RHRFbk9Td1JL?=
 =?utf-8?B?OHVnWHlhK1JNMnVhaEhyZWxvS3dMUHhrTzl2N2JoUElIeTJzV2dvQ0VJbURR?=
 =?utf-8?B?d3Z3d2pBbVdOZEhCODBmcG9VdEx5QndCRzh1VW5zMzFIbVVOZTE4cTlzeXQ3?=
 =?utf-8?B?eFo1bENpS1JZb055S2Q3UUtHU0UzT2VhMmFURS9CVmRvYjJHMTZMYm5ScHIv?=
 =?utf-8?B?UDhOOEwrODNObzBBem4rWEFWMlZJMnlqaFN3cXdZMU96a3laUEJmNzQzaURY?=
 =?utf-8?B?aXRmanFQbnQ4ek1HRlE1eTZaam15aHk1aFl4ankrc1JVT3l1MTZkY1dWbllo?=
 =?utf-8?B?YTF2VHN1eUw2MElRMXIvbmJqZVhwYWxpSXBDdElDdHczUlAwVWU5a2g4UUpI?=
 =?utf-8?B?U2hubFNPTHhyazdSK09tbWg5d0F2T2dYS0hERmpNZ2Z6R3FqV0E4MjRLTkVJ?=
 =?utf-8?B?L3pMSlNMK1lyRVhyOTNlVzNhaXZEOVMrUUNTLzBLODkyKzhBNy9sNlRPZ3Fn?=
 =?utf-8?B?c2xZNDFYU2RMWUpkdm54WDBGc3FFUkUyR3ArM1l0elhjeVhYU1VwM0JwY0pX?=
 =?utf-8?B?UkovRnMwajlYdEVISlBqSFFiejhkbXZIVVkycGJRMFRwUVdSbHRJcm9OQ3hy?=
 =?utf-8?B?RC9UUmZNbHB4Snk5T1NBcHVHSEltcGNPVXpyQ21nRkZkOHhiL3Bib1IyRTVG?=
 =?utf-8?B?bERsTFhQUzZVMmZqVXN2dGtaSDNyRnQwTU04UUhaSVJpNzlGOTl5VjZQNEpa?=
 =?utf-8?B?UjBPd3FzT29rS2Y2OC96YTFNYlNFVWhsb29Vc1NBNEt1dFdkU0ZMLzhSY3Zn?=
 =?utf-8?B?LytLZS93SkpLa3QydEtQVnFabkZzKzhqWldGbVRJa3NYcndaV0wwMHZFQjFJ?=
 =?utf-8?B?Z0s4QWF3VEh3ak5DdEhqOVcvd25QQmtndnIzMWRoNzJvU0VjbzdwNTQ5UFhD?=
 =?utf-8?B?NDFQMXIySHZ4dmVud0lReWFoa1VMV3FtWjdxdXY5cTNHUnFZQm4rdUJXb3JJ?=
 =?utf-8?B?cGwyM2JRZXJ5MUxnT2FOZExkY3ZkU0h1Mk5keHhQYkJZNDc4SDJJUS9BZVRw?=
 =?utf-8?B?TnRINzdYS3o1SmVQUlowT1p3ODBGWDBUKzNhTzF5by9Hd0d0WERFSTY5Mzgr?=
 =?utf-8?B?aFErK1AvZVZzZDhHTThFZXVwUjZsTFV6cmQyNWJ5WEo4cGJRNVNYOXJ0YmFB?=
 =?utf-8?B?Z1RubGhZSG0yUzVKNkRyT1ZCa2tJRTNPcXR4dFZ3ZDR5dVRHNkgyRThnQlIv?=
 =?utf-8?B?MXJwY0NxVDZzQzc0dzkyTWFzMDZwU08wZjhKVEdwdmt1K0lBU3N3QkxBajB1?=
 =?utf-8?B?N05oc0owYlNMM1M0dUFtb1FxenNJaDI4dEtlams0clQzRkNFR2QzMzN1V21R?=
 =?utf-8?B?ek94YitLcXpTZzRBQ21adkNJbVpOaHpPb2FpWHpsWGU2QlVLQnRtb3FXbHFH?=
 =?utf-8?B?VGcxaDZhbjdic3B6K0pYUkI5TWRWTWxMQzExai9oc3pJdGU4YzM1NE5sQ2ZM?=
 =?utf-8?B?d1FtVWtackxJSjRxb3I5cjFCSzB6bDNTa2dWZDhndlQvTVJTR3czQUU3c1hi?=
 =?utf-8?B?RnZ0TnptM3lLTVQxNHd1MHA5NTNxRTFUNnVYMmNqYjQzWTZuTXhkeHZlM3lu?=
 =?utf-8?B?R1h2bWtQdlEzMEtwWWp5WVE3dlRWbnJjQzRYQ2JZaUtSL095U1BZUFlidWdY?=
 =?utf-8?B?ZVRJdkF2TWpvTUZ2ekp0c3BFNWxOdWkzUU5NU0NKTVNCWFJWQ0ZRN3VLTGV6?=
 =?utf-8?B?d2NESkF1WHc2MzZCOW4yK1I2clZCTFl0YXpOMjN0a0NsWjZmaThRRHd2SXQx?=
 =?utf-8?B?dDJ4TjhoVWNNSDByb0RDUVQwVmFVTUNibG9WeCsvazY4MHpFcUhFZTloUmNL?=
 =?utf-8?B?NFp0MW9jbERtM0NUcFppbnZiWlZwWWtaR1lMYnEwZ0FmVDhzNG43d2luMk9n?=
 =?utf-8?B?M0J0WFJHUXJOZ0ZtNXBBaTkzOE9OdzVOc0s3ckZ3MmpjdEtYdWhNbUdjODhF?=
 =?utf-8?B?VEh5YUVMRi94MmpSNUZSb1BQb2xTOFd6VTNJNEVQKzFLNlVXb0wzRmhYVy9B?=
 =?utf-8?Q?pEOPOK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:05:03.1539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd7c304-12dd-4f95-476e-08dd7c15c117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022

On Tue Apr 15, 2025 at 7:27 AM BST, Jan Beulich wrote:
> On 14.04.2025 20:35, Alejandro Vallejo wrote:
>> On Thu Apr 10, 2025 at 12:49 PM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void =
*fdt, int node,
>>>>  static int __init process_domain_node(
>>>>      struct boot_info *bi, const void *fdt, int dom_node)
>>>>  {
>>>> -    int node;
>>>> +    int node, property;
>>>>      struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>>>>      const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknow=
n";
>>>>      int address_cells =3D fdt_address_cells(fdt, dom_node);
>>>>      int size_cells =3D fdt_size_cells(fdt, dom_node);
>>>> =20
>>>> +    fdt_for_each_property_offset(property, fdt, dom_node)
>>>> +    {
>>>> +        const struct fdt_property *prop;
>>>> +        const char *prop_name;
>>>> +        int name_len;
>>>> +
>>>> +        prop =3D fdt_get_property_by_offset(fdt, property, NULL);
>>>> +        if ( !prop )
>>>> +            continue; /* silently skip */
>>>> +
>>>> +        prop_name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff)=
, &name_len);
>>>> +
>>>> +        if ( strncmp(prop_name, "domid", name_len) =3D=3D 0 )
>>>> +        {
>>>> +            uint32_t val =3D DOMID_INVALID;
>>>> +            if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
>>>> +            {
>>>> +                printk("  failed processing domain id for domain %s\n=
", name);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +            if ( val >=3D DOMID_FIRST_RESERVED )
>>>> +            {
>>>> +                printk("  invalid domain id for domain %s\n", name);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +            bd->domid =3D (domid_t)val;
>>>
>>> And a conflict with other domains' IDs will not be complained about?
>>=20
>> Hmmm... sure, I can iterate the domlist and check.
>
> Well, just to clarify: The checking doesn't necessarily need to happen he=
re
> and now. It may also happen as domains are actually created. Yet then I
> think a pointer there (in a code comment) would be helpful here.

That'd be fairly unsafe. In the case of parallel boot it'd be
indeterminate which VMs end up running if they happen to have a domid
clash. It's better to detect the error earlier and crash before any get
to start up.

>
>>>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>>>          return -ENODATA;
>>>>      }
>>>> =20
>>>> +    if ( bd->domid =3D=3D DOMID_INVALID )
>>>> +        bd->domid =3D get_initial_domain_id();
>>>> +    else if ( bd->domid !=3D get_initial_domain_id() )
>>>> +        printk(XENLOG_WARNING
>>>> +               "WARN: Booting without initial domid not supported.\n"=
);
>>>
>>> I'm not a native speaker, but (or perhaps because of that) "without" fe=
els
>>> wrong here.
>>=20
>> It's probably the compound effect of without and "not supported". The
>> statement is correct, but it's arguably a bit obtuse.
>>=20
>> I'll replace it with "WARN: Unsupported boot with missing initial domid.=
".
>
> But that still doesn't fit the check, which compares the given ID (i.e.
> there's nothing "missing" here) with the expected one. The "no ID given"
> is handled by the plain if() that's first.

It's not that the domid is missing from the node, but that the domid in
the node doesn't match the initial domid. Maybe s/domid/domain, then?

  "Warning: Unsupported boot with missing initial domain"

Cheers,
Alejandro

