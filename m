Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E9FA98980
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 14:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964556.1355317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Z2A-0004Je-1U; Wed, 23 Apr 2025 12:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964556.1355317; Wed, 23 Apr 2025 12:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Z29-0004Gu-UW; Wed, 23 Apr 2025 12:16:57 +0000
Received: by outflank-mailman (input) for mailman id 964556;
 Wed, 23 Apr 2025 12:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7Z28-0004Go-6o
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 12:16:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d89395-203c-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 14:16:53 +0200 (CEST)
Received: from SN6PR05CA0036.namprd05.prod.outlook.com (2603:10b6:805:de::49)
 by CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:16:49 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:805:de:cafe::94) by SN6PR05CA0036.outlook.office365.com
 (2603:10b6:805:de::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Wed,
 23 Apr 2025 12:16:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:16:48 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 07:16:45 -0500
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
X-Inumbo-ID: d6d89395-203c-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJizsabb43Zr9y/67Ddx6qgFyOUNqago//0f2VEQuxU8x1vn3oF/hcKNc2DETGbPvDXowoQr0zFMlzdc5MESCM4sOoukfhOcpR4f32yFrpC05N8DvteeaNyS6Mn/0wHgS2CXoiZpX3iCvK72V4ZNbLAF6yBnsLiiMXhbFFxbBQHoCTGNXMRJHbA1HdfXOh3KMzI7kdgA69LnI77RyAItJ7vV/+g382bQMyjOWx8NkWLW+a+dycmut7++83fjU85KOT0DySFsPwRehz1mlQ1zFyOMt8r6kuVCYrm2Hi/nRJvd02IhclxPQJufRLJe+n9QMq+SVcuWtQEQMZKtK8AHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAgPtEtxxKwq8OVij1yS0qQM8r383ewxPB/osIrdb7o=;
 b=saHU/zGpgfJJUkLYDc9KrA6kqtFI/chqmf+CAD5zWwoSxTepB3WbadtEhbLWIhA/muGrgf1epINWQB7iSP9shOIdV+tESABgpJ5xZCzBrWMl9ReTS0H+nW4jOSOBXCSI8/4Kp3gYmFu1XGgyv1vXc1QC1an8hHGzpIZ2K1jIztIc1RkVg+DA3VbuzwbIDFBIsI7ZZayvHpSsXqzZnD7qC44tAgELZLWr9S6cpJj9IIqNBKGhRAo1H2vDipaSoEkXbisMzqWU9E51qAaaiRO+dY/DemL84ULxwqDNkTbnZyC16V5b1Hrm6A4RgJIuUQPBp9ByIDq+JY58hnfjQ6zjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAgPtEtxxKwq8OVij1yS0qQM8r383ewxPB/osIrdb7o=;
 b=a4nT5B+pGgVasDNb3msCfmMoxMBJfgDVViEHYDSZhgUp6ASXg7tUldBnxHvMhONv3JSUv5rcyPbd6r00hMeZSeny9gYdP5kAOdv1F7fF11IdDtcnOVeSkKq64CyjhdrVJ9U2Nc1StVGvvzj2+m5SvQ7Qe49NmE5KmIbvgMRu8Qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 13:16:43 +0100
Message-ID: <D9E0F60G4WKY.IUI5UKTDP7Y@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 06/13] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-7-agarciav@amd.com> <aALUlz6ZgwqSb0tD@kraken>
In-Reply-To: <aALUlz6ZgwqSb0tD@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8b0c7e-3643-4ade-7b62-08dd8260b8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWtEb0JCclFvWUxQa0VMUG1QWE9aK3V6NXAzdVUvN1RIN1hDZ29LakJsYVU1?=
 =?utf-8?B?eUluMGhYR1RvRC9obm9Za2VKWUxOY3B0djdHbW9QclFCdnRRZWdQQkhKaEdI?=
 =?utf-8?B?dW94anJIVXJDck80UkFvQ0R3QzhSSC9rTGxEWERIa1NSQXB0bVhwNkxYUk1h?=
 =?utf-8?B?UFlHWWQvUDRmbWd2NWx3b0tQdmM1NWdPV3B5bjYxL3JSc0V1RTdERFVwNWcz?=
 =?utf-8?B?U3ZmREUwTUxGNVlNaTlrM0MrWU1yNnU4aEgvd0JkTnZqUXc1N2RrbDNxWW5k?=
 =?utf-8?B?cndtQXNad3hLekVhcmxCZ1RVbnhpZ0psdm9JcHVmb1dTYlJBYit4dXBKZ3h5?=
 =?utf-8?B?aWw4N01TWlZVNCtKVmQ0cC9rWFloNk44SjIzWlYzTi9ZZFJOREp0RzJzYmU1?=
 =?utf-8?B?dUtJTmV2c1VRQlVIVUFlb01rY1RWQ3ZzODFiWDE5M3oycXQvejdlajI4UHdX?=
 =?utf-8?B?SG4xNGNCRTc2bEppMHN1K3Y3Tno4L1JXcXVuM3pxS3BPbWV3UTg5VVUwcWgz?=
 =?utf-8?B?L0trU1FKaEpWalVIOVRlWC9POE1EZXN3UFQrblFTL0FxZzZmUmU4V2Jtc2w1?=
 =?utf-8?B?RFFhcVErb3hNWmZnek9LdUxMd3lIUVFXcEpPY00rZ0g4emZIbUN2OUFZQmN2?=
 =?utf-8?B?b2ZDNTBWaDdXZnhhTzZqNW1tcHR0L0ZFN3NITmkxdDY4Y3N4d2w3ZzNraTlP?=
 =?utf-8?B?aFVDMTlwdnp0cVVGRTduS1gyeTQzVTZJTFdzcFdtMW9YTGY1NzRJc2d6aVBI?=
 =?utf-8?B?RC9PUkFWUGRlKzFyRmsvbmROUDBNbFQrQU5TZUhxcTZlWXNmM1dhQzJkVmZt?=
 =?utf-8?B?WHlORlZ6WEo0clltamhScWJ5NjA5amNNanJaejNTbHlhSXRQWU1Wd1c4bms0?=
 =?utf-8?B?czlRL09pWVJxOENleFYvQ3FvM3g5WFJwSGF2ZWtucStBTElDUTRKM2FTMlY5?=
 =?utf-8?B?TmJJRHFiQ29wN0c1NWhtbHdUZFU3NmU3M3Y4WkZwR2ljS3lWYUVhTzVCMTVK?=
 =?utf-8?B?WnZIN0srdDYwKzQwSnVtYnp4ZTlQSUgrWm1URnFpZDdlamR4UlBtaU11NlpH?=
 =?utf-8?B?dW05SGFkeUtsU2dNdmFtQU80S0tIZ29ZcjhMTzlrSnRtbmp6eFZYaW8xZkhW?=
 =?utf-8?B?bFRPSmRTUE5ENzBPaU1QRHFLVE5hSkFCU2lBK21UM05TWkc1RkN0MzJlbWh5?=
 =?utf-8?B?a29LTzlhRTNKSjZ5K2U0R0FRZFBwS2V0RW84azV6T0tUNG1JSXlaUnQ1d0wy?=
 =?utf-8?B?cXhmWXk2enorb0NadlpUcFErd0xaNjgwdWYwZEFqZEgxQkxpczVGNGtucDlU?=
 =?utf-8?B?VlBxUnFaNEpUcTB3Y0pjQlI4YTFRcU5NUGZ2REZWY09uSW1IY1dudit3Y2FM?=
 =?utf-8?B?RCtFbGJhdWpPVStIdmdVa3Z2eVVWeW0vRlMzVFY1MExJb0NUMEFBNXFQdkZB?=
 =?utf-8?B?WG90Qm5vSEJYQkwxOEFLaUR3WGdFZ2FRN2R4R3hqSHdOYUkzRkcrRXB3YkdO?=
 =?utf-8?B?aDgrcEZqNm4xejZhdHdGMnROSTRUcTZKUFZGK3h0NXRtTDhzc0E0WmtWSlFq?=
 =?utf-8?B?Z3dVWTZ5cDRQOTVaYXUvcVk1MEdYUk1JdGJaRmxDWHhrTHlTYWxtelVwS2tV?=
 =?utf-8?B?aGxiaDZMNlNmejdiMnBOWllSeFlGcis0TG05NWlJcW9UQ2lnK3dNRjMrZmNm?=
 =?utf-8?B?YkVMOTVrN1JQSDROS3U0WitnZCt5Uko2N0V1K1EyamFubDJKeE1ZYzN0dVBI?=
 =?utf-8?B?bEkrY0dXRUFKYWtuQmg2UzlxK2E1cmQrYzg1eU5WK0FSNzIxMllHbnk0SU4z?=
 =?utf-8?B?blMxNDNqcUlubDVCQS96aFZ4WTRUelBNMyt0NnY0Nk5UOG9MT0VCQ0piWDVS?=
 =?utf-8?B?aWV3b3NqUFQ4WTlhZlQ3VkNkSlBlMWZiN2p0RVJSM2dSOGF3bE80QmRLaEY0?=
 =?utf-8?B?c2NPRm4yTmZyaFJhQTZJczdMYkNIMjNINFVWSndDU1ZITDdUOGNiYzdyblFD?=
 =?utf-8?B?eUJaTk9kdmdRVGFMUTZlOUFRdEZUbytTZGdGSUZvcDBrUGZWNnV1NWxJYUI5?=
 =?utf-8?Q?4jxi1h?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:16:48.4012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8b0c7e-3643-4ade-7b62-08dd8260b8c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013

On Fri Apr 18, 2025 at 11:39 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:28PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Look for a subnode of type `multiboot,kernel` within a domain node. If
>> found, locate it using the multiboot module helper to generically ensure
>> it lives in the module list. If the bootargs property is present and
>> there was not an MB1 string, then use the command line from the device
>> tree definition.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * Stop printing on the fallback path of builder_init().
>>     It's in fact the most common path and just adds noise.
>>   * Add missing XENLOG_X.
>>   * Simplified check to log error on nr_domains !=3D 1.
>>   * s/XENLOG_ERR/XENLOG_WARNING/ on duplicate kernel.
>>   * Turned foo =3D=3D 0 into !foo in the "multiboot,kernel" check
>> ---
>>  xen/arch/x86/setup.c             |  5 ---
>>  xen/common/domain-builder/core.c |  9 +++++
>>  xen/common/domain-builder/fdt.c  | 64 ++++++++++++++++++++++++++++++--
>>  xen/include/xen/domain-builder.h |  3 --
>>  4 files changed, 70 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index ccc57cc70a..4f669f3c60 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1285,11 +1285,6 @@ void asmlinkage __init noreturn __start_xen(void)
>>=20
>>      builder_init(bi);
>>=20
>> -    /* Find first unknown boot module to use as dom0 kernel */
>> -    i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> -    bi->mods[i].type =3D BOOTMOD_KERNEL;
>> -    bi->domains[0].kernel =3D &bi->mods[i];
>> -
>>      if ( pvh_boot )
>>      {
>>          /* pvh_init() already filled in e820_raw */
>> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builde=
r/core.c
>> index 3b062e85ec..924cb495a3 100644
>> --- a/xen/common/domain-builder/core.c
>> +++ b/xen/common/domain-builder/core.c
>> @@ -54,6 +54,15 @@ void __init builder_init(struct boot_info *bi)
>>=20
>>          printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains)=
;
>>      }
>> +    else
>> +    {
>> +        /* Find first unknown boot module to use as dom0 kernel */
>> +        unsigned int i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN)=
;
>> +
>> +        bi->mods[i].type =3D BOOTMOD_KERNEL;
>> +        bi->domains[0].kernel =3D &bi->mods[i];
>> +        bi->nr_domains =3D 1;
>> +    }
>>  }
>>=20
>>  /*
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index d73536fed6..1fae6add3b 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -89,9 +89,9 @@ static int __init read_fdt_prop_as_reg(const struct fd=
t_property *prop,
>>   * @return              -EINVAL on malformed nodes, otherwise
>>   *                      index inside `bi->mods`
>>   */
>> -int __init fdt_read_multiboot_module(const void *fdt, int node,
>> -                                     int address_cells, int size_cells,
>> -                                     struct boot_info *bi)
>> +static int __init fdt_read_multiboot_module(const void *fdt, int node,
>> +                                            int address_cells, int size=
_cells,
>> +                                            struct boot_info *bi)
>>  {
>>      const struct fdt_property *prop;
>>      uint64_t addr, size;
>> @@ -175,6 +175,52 @@ int __init fdt_read_multiboot_module(const void *fd=
t, int node,
>>      return idx;
>>  }
>>=20
>> +static int __init process_domain_node(
>> +    struct boot_info *bi, const void *fdt, int dom_node)
>> +{
>> +    int node;
>> +    struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>> +    const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown"=
;
>> +    int address_cells =3D fdt_address_cells(fdt, dom_node);
>> +    int size_cells =3D fdt_size_cells(fdt, dom_node);
>> +
>> +    fdt_for_each_subnode(node, fdt, dom_node)
>> +    {
>> +        if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") =
)
>
> Suggest to restructure the code to reduce levels of indentation, e.g.:
>
>            int idx;
>
>            if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") =
)
>                continue;
>
>            if ( bd->kernel )
>               ...
>

This hunk checking for "multiboot,kernel" is part of an if-elseif in a
later patch that also checks for "multiboot,ramdisk", so we can't just
do an early continue here without forcing a bigger diff later on.

>
>> +        {
>> +            int idx;
>> +
>> +            if ( bd->kernel )
>> +            {
>> +                printk(XENLOG_WARNING
>> +                       "  duplicate kernel for domain %s\n", name);
>> +                continue;
>> +            }
>> +
>> +            idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
>> +                                            size_cells, bi);
>> +            if ( idx < 0 )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "  failed processing kernel for domain %s\n", na=
me);
>> +                return idx;
>> +            }
>> +
>> +            printk(XENLOG_INFO "  kernel: multiboot-index=3D%d\n", idx)=
;
>> +            bi->mods[idx].type =3D BOOTMOD_KERNEL;
>> +            bd->kernel =3D &bi->mods[idx];
>> +        }
>> +    }
>> +
>> +    if ( !bd->kernel )
>> +    {
>> +        printk(XENLOG_ERR "error: no kernel assigned to domain\n");
>
> Add domain name printout similar to above logging?

Good point.

Cheers,
Alejandro

