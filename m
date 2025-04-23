Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21AEA98A4E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964636.1355378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zl7-0006dU-IL; Wed, 23 Apr 2025 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964636.1355378; Wed, 23 Apr 2025 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zl7-0006c2-FF; Wed, 23 Apr 2025 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 964636;
 Wed, 23 Apr 2025 13:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7Zl6-0006aR-28
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:03:24 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2406::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b2c41a-2043-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 15:03:22 +0200 (CEST)
Received: from MN0P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::28)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 13:03:15 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::39) by MN0P223CA0002.outlook.office365.com
 (2603:10b6:208:52b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 13:03:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:03:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 08:03:02 -0500
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
X-Inumbo-ID: 54b2c41a-2043-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOPSaF/qE7eRNAaJVnxIf8EY4EmhOcgU0B88YGE3Wx/SsOy41tbY14cp6JH2ggUBwCbq4msHfqP6jTiboqMFa2kykFDqrwcxBZNh2HHt6m0PZkSmD60DFs8xO0BzpvtjBQx4+GQWls5FfCH+vP6/Pc0z8nlF49Rv/VaSWGcoM2dCiRrkFuInUupOsIwvuUSJnrrUrE0jjozJw9p1at6kCdQdydLWfUeyHfLmHKgaw4BmGxaYmzOGuVo9qpCJcikjJJSJua4NxlU4j6hrEL+9n5wGqatxlXdfl0Q2CfPcLkxG31cMuXyR9LBGzxSWYnHAmZ8SB/lQqQqmGsDGzj995Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq44tbvnOG+xeNER2CbvLbqeUgJqm3/M+dRCwgHFYzI=;
 b=fIV4b0UthnCEoWC3o0YkdWYnTWr3j9iF+aVnfibb38Qey29hbckt/nPmBJ8a0VipNVDu5bJ9sBDJjg6LqBUcuJ/lTExlQ3rYNJofaM4TClOpaolafslxH047Fth0v9R+e+QyOCQbvdqpQIY9ryZ4kSiHzCP8eL2XUzqx56cWEZOnPUkzsQinzTEQhUMN7Rcv7s4ZPnWkNgxiSX1V/fJtTUQ0UXLWMOHs2WpbPD58NINs0WF1UIRGPRvCWmhWnb6DHBB21PHX9y+tuzOwkJ8NVVn43WwiaxRQvyPGpO5LtT7oTrajd2ADkrwWu1JX5F3fn3ztmSWI5r90dePFaLObCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq44tbvnOG+xeNER2CbvLbqeUgJqm3/M+dRCwgHFYzI=;
 b=I/nU8jQh+EO4wgy3wtSpgh5SeQwsvZf/w9GsF7NXl4Cgdo1vyI4hVZGghPiMkuA7CCOJhOJlpfcqvMTHrMc70ocJZvI3VYsmp3liA5TQ6m8lSokCM06g9fk13UapyenBa6ebjpeDxNCObygV3wX+zp1NsZ8aRI1/5HfxWY5nxe4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 14:03:00 +0100
Message-ID: <D9E1ELO9F35P.ULZVGHT9AKPH@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v4 09/13] x86/hyperlaunch: add domain id parsing to
 domain config
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-10-agarciav@amd.com> <aALbaXZlBeWtCAZt@kraken>
In-Reply-To: <aALbaXZlBeWtCAZt@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a26663-ac91-4545-f299-08dd826735a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmFmZFFiOFU4RnNxbHRNd3BGZkp0WE52L0c2WlRTKytVQ1BwNDdrSnkwM0dr?=
 =?utf-8?B?ZGlQOXRjNUozVXJHTUYwQkh3TVpWa0VwcStvNnl4bTEyN2gybHUyQmhLaXZC?=
 =?utf-8?B?R0g5b3dxWDE1SThmSi94OEtqQXJrbWY4MzhJWHRHNGUvS1JyZ0pkNVo0ZVZW?=
 =?utf-8?B?V2tGMlN6RlNrK3ZZRFBnTzFRZ1lSbzJyRlV1OC9ScmJDcnRCUnFXRHFvZnN5?=
 =?utf-8?B?UEZKUTd4eW5iZTM0bTdmUGtWa2NMMzROMlQvOGRIU2Y5end0eW9NZ3FRTmli?=
 =?utf-8?B?RUNmK0UybCtqbTJ0UjNwVVR4SDRWSEpkTXJPN0dKOXBHL1ZyTFVaamZINVpF?=
 =?utf-8?B?aG1SM3VQaEcvSFZtRHZWSmF5aDArVTRjV2pYRm53ODNpTklFYXVtbWsxcmVN?=
 =?utf-8?B?eUlOZG8wS0ZHQTFNNGRhNmF1UjQyU2ZLMGpjUGxKNkJveW5idXVnOFdMbWtr?=
 =?utf-8?B?STV4TlhDRGc1bzRvR1hETXZXUmNCaThoTjF5bVBXNlVXMTlMMlZtNTFja2hq?=
 =?utf-8?B?Qncya0xBQmI5ZHU1Q3NubHdVR1haWkQ2MnQvcmtaRFdTQy9SOHdSTE5mbWk3?=
 =?utf-8?B?V28yTk9DaGlhdEQ1czNjK2JycjhGL2Jwb0lUZlhKc0tva0FZWVZDN3dWOGQw?=
 =?utf-8?B?b0NNTnROdmtVdVA0TVl6Z2lYNEZXejZWMXBXTnFWczlGYjBOUVlDUENsaHYx?=
 =?utf-8?B?NmZVWDMxY2IrY1FqenNDNTg3TXcvV21jMk1lamQ3dkJJcGw2QVJNbzVnK0xI?=
 =?utf-8?B?WHdaT2dvcEM5Sm44cmNxM2RlRXlaUmVTV2szUDF6cCtaTjRnM2VSQy9KZmNs?=
 =?utf-8?B?UTZqZ2FUZmI3Rko0a1htZzlRajQ3UGpGSDh6WGdIT2FmNm9zWjVQZ2VnUUcv?=
 =?utf-8?B?VmFiZzd0ZTBCemE3TDJzSTM3RkltTzdGVCtlMEJiNW9NYzFETWlIWXpaaGNG?=
 =?utf-8?B?dXhnOHByczF3Y0dKdTBjZTlpZ0FSZ3dYWTljZ1BwV0ZudUxtQ0FWVHRzZ2wv?=
 =?utf-8?B?NzcxTGZrbFJRZWZQaWVzYlR5bjdESS9Mb1UyWURJaUhuTUpKUHR6dkZKc2h3?=
 =?utf-8?B?QnZJaFBtOU5TTmlVR3Brc3pXZ096ZGRvU3B0RnZLV0I4SjB2SkdwdWZzNnpP?=
 =?utf-8?B?UHF4VTJ5L2w4emdma09JR01sVFlGRDl2QldxODZXdDdiNUtLMFVDVXVLdVZz?=
 =?utf-8?B?UGZuRkRWemM4V25OR2ZYYkJMQkF5ai9tcm5aTkhkZkdRQ1NiUTRWR1hGQ3FW?=
 =?utf-8?B?dFVpcVJIaGlxMDYxNXVxUTdlL0dsUEpxam45anlWbE9pSGM4NXM2Nnh5WjZt?=
 =?utf-8?B?YXdyMjUyVitlY1Q1ZlYyWHdFbE05K21LSmNKcmJOMDJBMit5Z1FkWDlicFc1?=
 =?utf-8?B?NDlvN3V3RmpDaTZMbkxUbUFlazlFVkJBeFNPY0RXcWZxMTFjd1puNlNCVkJT?=
 =?utf-8?B?amppMmhmSnVsdGNnalMxU3NMdnlVUUxLOE8xL1VJRjl5MnI0TE16US85MFZS?=
 =?utf-8?B?aWRmbUk5ODZGT1grc1Ezem5mWjJiNGlvMVpOTkc2d1JZVGlPczd0SUhnNURs?=
 =?utf-8?B?d1NPU2pSUGQzS0Z1MmxISDVMWDlHVWR1YzZ0NjdRNEhWMDNqemVWSVFOOGFX?=
 =?utf-8?B?a0RReVZvZ0RBVTMzN2RvazcyV1V2MGFmcmFaNUJtdW5VRXh0V1A1SDhOUjRI?=
 =?utf-8?B?WlJncXpLQ3daSTFLQmVxeXhZT0Z6UXB5dkZrVzJWZ0lyejAvK011TkcxZjdv?=
 =?utf-8?B?VTltLzhFZzZLQndYVmpVWGc3aS94dTFuQnlMa1lxYTdMclZlSmRsdFFTQ1N6?=
 =?utf-8?B?OEF2U3dENy9MUGxaVThkNHpjUXBScElDblJoNUMxcUw0RHVWKzBMdERQcmhJ?=
 =?utf-8?B?cFg2eFRUTWRBdXNsWUpLTW9FMWM1UUpvVlhYcTNkbVVlcWxQbkFTVWR3eXMv?=
 =?utf-8?B?RUZ5K2Q3cS94ZU5NNGtLMVhlVjdIQm5XYk1KNERPbU10Vnp4NUozYW1iWjNo?=
 =?utf-8?B?WkcwZ2lSU2FnelRqQ1F4eVl1cytVZEg1ellCYWgzZS9EUVd2ZzJGME1vTWdJ?=
 =?utf-8?Q?jXboQF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:03:14.9292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a26663-ac91-4545-f299-08dd826735a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Sat Apr 19, 2025 at 12:08 AM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:31PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the ability to specify the desired domain id for the domain
>> definition. The domain id will be populated in the domid property of the
>> domain node in the device tree configuration.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * Add missing newline
>>   * Adjusted printks
>>   * Checked domid node against list of outstanding domids.
>> ---
>>  xen/arch/x86/setup.c            |  5 ++--
>>  xen/common/domain-builder/fdt.c | 51 ++++++++++++++++++++++++++++++++-
>>  2 files changed, 53 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 76ceb5221f..04ad2d0937 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>      if ( iommu_enabled )
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>>=20
>> -    /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid =3D get_initial_domain_id();
>> +    if ( bd->domid =3D=3D DOMID_INVALID )
>> +        /* Create initial domain.  Not d0 for pvshim. */
>> +        bd->domid =3D get_initial_domain_id();
>>      d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privile=
ged);
>>      if ( IS_ERR(d) )
>>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index c0f526a4ce..0d3c713041 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -2,6 +2,7 @@
>>  /*
>>   * Copyright (C) 2024, Apertus Solutions, LLC
>>   */
>> +#include <xen/domain.h>
>>  #include <xen/err.h>
>>  #include <xen/init.h>
>>  #include <xen/lib.h>
>> @@ -178,12 +179,54 @@ static int __init fdt_read_multiboot_module(const =
void *fdt, int node,
>>  static int __init process_domain_node(
>>      struct boot_info *bi, const void *fdt, int dom_node)
>>  {
>> -    int node;
>> +    int node, property;
>>      struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>>      const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown"=
;
>>      int address_cells =3D fdt_address_cells(fdt, dom_node);
>>      int size_cells =3D fdt_size_cells(fdt, dom_node);
>>=20
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
>> +            if ( val >=3D DOMID_FIRST_RESERVED )
>> +            {
>> +                printk(XENLOG_ERR "  invalid domain id for domain %s\n"=
, name);
>> +                return -EINVAL;
>> +            }
>> +
>> +            for ( unsigned int i =3D 0; i < bi->nr_domains; i++ )
>> +            {
>> +                if ( bi->domains[i].domid =3D=3D val )
>> +                {
>> +                    printk(XENLOG_ERR "  duplicate id for domain %s\n",=
 name);
>> +                    return -EINVAL;
>> +                }
>> +            }
>> +
>> +            bd->domid =3D val;
>> +            printk(XENLOG_INFO "  domid: %d\n", bd->domid);
>> +        }
>> +    }
>> +
>>      fdt_for_each_subnode(node, fdt, dom_node)
>>      {
>>          if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") =
)
>> @@ -249,6 +292,12 @@ static int __init process_domain_node(
>>          return -ENODATA;
>>      }
>>=20
>> +    if ( bd->domid =3D=3D DOMID_INVALID )
>> +        bd->domid =3D get_initial_domain_id();
>> +    else if ( bd->domid !=3D get_initial_domain_id() )
>> +        printk(XENLOG_WARNING
>> +               "Warning: Unsuported boot with missing initial domid\n")=
;
>
> s/Unsuported/Unsupported/

Ack

>
> Also, add bd->domid to the printout?

Yes, I'll do a rundown of the error strings and ensure they have
identifying tokens.

Cheers,
Alejandro

