Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE62ACB9C4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003700.1383307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8ER-0003e8-3X; Mon, 02 Jun 2025 16:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003700.1383307; Mon, 02 Jun 2025 16:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8ER-0003bz-0C; Mon, 02 Jun 2025 16:41:51 +0000
Received: by outflank-mailman (input) for mailman id 1003700;
 Mon, 02 Jun 2025 16:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM8EP-0003bl-Jl
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:41:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77bfa650-3fd0-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 18:41:45 +0200 (CEST)
Received: from BY3PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:217::29)
 by SA1PR12MB8094.namprd12.prod.outlook.com (2603:10b6:806:336::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 2 Jun
 2025 16:41:39 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::94) by BY3PR04CA0024.outlook.office365.com
 (2603:10b6:a03:217::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Mon,
 2 Jun 2025 16:41:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 16:41:38 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 11:41:35 -0500
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
X-Inumbo-ID: 77bfa650-3fd0-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOKaMqneAjJlxfeTUGBrBPPgfUNEGDBMY6upTgx/J2mNY2UTUYRa6dmHV577CcmpKnCcI6JGCFOlwVoMBV5HZ7TJYhkUShbn2MVBSW9hwRP7P7pW7Ddg+9B/OE2FhWULS041H6byV+7OxdusIu1nF8bvnNxMc7ZA4cuI8sKKwvhCP2fVFdAxm56/5Y7MKkPUguyubOW3jsTLKK54VlCnPGkzwMQRfcJV5VFccQkhgKJl59LCJ5/xGFaw3qaXTHiTGCwqJPHdSdUC32FSy4fXITIb4GFx+sV7Y6F4A3T5YiJZTU7BNyQixdytqanr3SDe4lCo54C92hmEp4wJNa1JKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPzhhFORRxrPRrBINMIKY8HmPHg2kNYgIDwDeoItZP0=;
 b=anUPfcsZeZhGbQH+YT5627gAIlK+7kZ6Y2xsKvNpM2XHYUnLxbzGjednGGCQ+Hswyz7uiUJnx3wN8o5AIj+NW6s2qfABjjYE5ZQ84LwLn9yC/UuOQox8SJkWMg6gf+TLPPp6sznkCgHKBp9eqPCKT5hyAh/7V9GMOELDGswpoIjlyAhk8VDKl4FAonDfgOwS4EHHlvaiT8Ut0vSje+ASye0dSl27mT9b1Rh+cBgJOcmLFxy+BAsf5JwkXIuxQCRILwOxl+8PNBA4R9iP1iwXGlvLt56QpoxrmPe+uigGM+WsnPoY2l1UzFJssSm8taW3YFXfJjDV2db8FCsouPaSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPzhhFORRxrPRrBINMIKY8HmPHg2kNYgIDwDeoItZP0=;
 b=UVcuW5pSBPBfDb89xOqBygxSNEZ9UMcWR8SIYORDpvFOEsMFl3H83vN3PLeKJZk9viUTEtuAzflWe1fQDDQmztji9toK3i3EEb/n+J4rcOozfRTK4u6hBGsFKdL23pA+jPbAeRLV1D93inCL5fDRZISyVol+GuWN0iKADG7jU6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 18:41:32 +0200
Message-ID: <DAC73PSZ4FBD.1U1EU3M2SWY3R@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-13-agarciav@amd.com> <aDpO1vpKUqWSyBt1@kraken>
In-Reply-To: <aDpO1vpKUqWSyBt1@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SA1PR12MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bdc5bb-6804-4153-952b-08dda1f45893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHE2T2FCL3JXN0p2Y3ZqRmlTTk03R3d1WUZ0YUZBRUdRUS96SXlPM2FudGRv?=
 =?utf-8?B?TmRpQmR6M1ZqOXFncmMxdzIvbkU5c2dTMDVrUmhCS3F2bHJFTVlnMEFLSHEr?=
 =?utf-8?B?RS8reUtqajBBbXYyOEkycVMxcm1xRzFMUTRNbTd2VlEwOFdGcFgycnBnUU81?=
 =?utf-8?B?U1hsM2g2aDhRT3JMQTgwcDg0S3A5a2dhRHZlTlcvMnRMZlRGZ2QvSFR5NDNu?=
 =?utf-8?B?SHRQMXp5ZWsxeGpuT3J3TXRyZEZQQkNvNjExbm1BT3hOc2hLWC9TNU9JSWdP?=
 =?utf-8?B?RFEwMGxyWGpaOEVQQnFTN00yU0hQL2V3QWUwSmNRR05tV0hmcHJNWkd0QXZ0?=
 =?utf-8?B?ZVhvK05ZNUhlMTBBaFNOUDhlQ0J3ZFlVNlRDdld6RU11ZkM1L08vWnlxNVpM?=
 =?utf-8?B?L2dSeTRnNHlrNSttYTE5MlhhdS9oUFVNSnRScHU2eVV0U0lmWGR0eWpHakE5?=
 =?utf-8?B?Ymx2OUJYUkpoN2hhZW9vQWhyemNDUFh5enhkdmtzV1A2WUdNVEZJdnJZNnZI?=
 =?utf-8?B?UTJmNzZKODdJcjVZbDk3ekxWSEM5U2g0Z3h3dWpsR29ObUc3RVMrNGd6VHgx?=
 =?utf-8?B?Qm1ESjhqK2VJWXFDU3dxWkNjQ0Fkc2tDYWVhZDl0K2VnRDBSbUtQWXhPVjRC?=
 =?utf-8?B?VE5PUWVkOUNnamZrOHM2Z3QxTW9HM2toZ1A1VjRpM1ByVVN6RVQvQWtwT1I1?=
 =?utf-8?B?K21mejF1QmZIN1dXYXBKdThSQjdnQ2xscXoxdXBDWnY0TDZGRlljZlRqYk5N?=
 =?utf-8?B?WGl6SXNqRStBL3JCRmRhK2JQMlZWdmNGdjg3cUF4eXpNSkhjc2dVdVR1OGFj?=
 =?utf-8?B?Q1RJU3REVERZSXJkNXFDekpFNUdLSTcvUmE5d05zSUlWeHF4aEFqRXZvMmlL?=
 =?utf-8?B?RmRVQ1YzZGtWaHRTVlM5cTVqOGxGZnR4a0JEZTdHMHl3R29iSHI5WHRTSTRQ?=
 =?utf-8?B?OThxYitYUGtPUlFtc09TRFQ2eGIxcUJFbXZ1VW43SDNnblVMNDE1dTlJWnov?=
 =?utf-8?B?NFRGYm1nOXdmOUxrL0ljL0RON3B2ZTI3end0V2ZSdDVmc1lFSStXMTE2aFFP?=
 =?utf-8?B?aXh2b1U4VnJRd1REVDFJNXc4RlFGU09zRXdmRmNvS0c1L1U5UWQyLzRKNHFQ?=
 =?utf-8?B?MEJQSkgxWUNRNVBhSHNSczFuOGdYaHRJNGFmVzNkaUxXelBkU0UxMEhiTjVF?=
 =?utf-8?B?cWl5Ulppb2hxOFFWMXRJNVJlR3dUeWx5b3pYdFdSb0VuUzVnREpYWkpTdnRn?=
 =?utf-8?B?K095R0p6d0gyN3FHRmVUeDVwb3dZdmlpSWNxTWo0S2s2MlBhZDJvN2NhNjd0?=
 =?utf-8?B?cTBTZDI0dTR0VXdCVzdpSmp6L0lwN0U5YUsvMjJ2YVlRZHBjMmJIN1AvYlZZ?=
 =?utf-8?B?VGZ4TDJFM0dOdHlrblcwTy9kUHdxc1NUc3FGZVNIa0o1QUNZWUduY2dTNVdJ?=
 =?utf-8?B?SWo2Q2U2UWpmRzk0dnJpTlVLbFkxdGRyRUc5SmpjMGNJNkl6SGpLQXNsYlNT?=
 =?utf-8?B?azBtRjJ3RlJqUytKVjhxSXhMVVc1S01sQW1HWGdKR3V3enRDdkJKMm83cEFL?=
 =?utf-8?B?STRRQXhHVGJNbWhjV2RydmhSd1Fxa3JBSjNoZU5ObXl6VnoreC9FRExzNnUw?=
 =?utf-8?B?TjkzU1RNUHBaNGJDMXRuaFZtMHB2YVJjMVlWZEJ1ZytXL1NDNU5pbUVpTWtu?=
 =?utf-8?B?RVBpQjVvV2FkTW96cXlnbDJOUDc5alBvVjV3RlUvMDd1SEhHTmpYTllCOTgw?=
 =?utf-8?B?Yk1SZ25Tc1ZUQlppK2Z5eFJ2VE1PdVY3UjgyeGdOUTNwUnM2Nm5WNDBMY1ox?=
 =?utf-8?B?QzZseW5uSXVVN0JPM2RwNFpxK1A0T1V5TmlSVElzRWpOMmtPbGhoSDhxK0tv?=
 =?utf-8?B?bUcxUTlGanZtSzE5cFlLL1VUSzlqczJXd053NmphNHR1YmtydjZRNDVPM3d5?=
 =?utf-8?B?OU1iTkpMZ3U1bUtyNG5tYlZETnlNQWZmT0VuSGlWNnQxQUhaQjE2b0N3dVN1?=
 =?utf-8?B?emxuZmc3RzBETU8vbkY1YTVZVGQ4c2NkbjZhNGRqaEMyK0FjMjh6U3FtMk01?=
 =?utf-8?Q?uwias9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:41:38.5175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bdc5bb-6804-4153-952b-08dda1f45893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8094

On Sat May 31, 2025 at 2:35 AM CEST, dmkhn wrote:
> On Fri, May 30, 2025 at 02:02:20PM +0200, Alejandro Vallejo wrote:
>> Part of an unpicking process to extract bootfdt contents independent of =
bootinfo
>> to a separate file for x86 to take.
>>=20
>> Move functions required for early FDT parsing from device_tree.h and arm=
's
>> setup.h onto bootfdt.h
>>=20
>> Declaration motion only. Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/arm/include/asm/setup.h |  6 ----
>>  xen/include/xen/bootfdt.h        | 62 ++++++++++++++++++++++++++++++++
>>  xen/include/xen/device_tree.h    | 34 +-----------------
>>  3 files changed, 63 insertions(+), 39 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm=
/setup.h
>> index 0f9e531a34..32308837a9 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -55,12 +55,6 @@ void setup_mm(void);
>>  extern uint32_t hyp_traps_vector[];
>>  void init_traps(void);
>>=20
>> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>> -                         uint32_t size_cells, paddr_t *start, paddr_t *=
size);
>> -
>> -u32 device_tree_get_u32(const void *fdt, int node,
>> -                        const char *prop_name, u32 dflt);
>> -
>>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_typ=
e_t p2mt,
>>                    struct rangeset *iomem_ranges, struct rangeset *irq_r=
anges);
>>=20
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index fa65e8fcf4..079259c719 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -2,6 +2,7 @@
>>  #ifndef XEN_BOOTFDT_H
>>  #define XEN_BOOTFDT_H
>>=20
>> +#include <xen/byteorder.h>
>>  #include <xen/types.h>
>>  #include <xen/kernel.h>
>>  #include <xen/macros.h>
>> @@ -16,8 +17,53 @@
>>  #define NR_MEM_BANKS 256
>>  #define NR_SHMEM_BANKS 32
>>=20
>> +/* Default #address and #size cells */
>> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>> +
>>  #define MAX_MODULES 32 /* Current maximum useful modules */
>>=20
>> +#define DEVICE_TREE_MAX_DEPTH 16
>> +
>> +/* Helper to read a big number; size is in cells (not bytes) */
>> +static inline u64 dt_read_number(const __be32 *cell, int size)
>> +{
>> +    u64 r =3D 0;
>> +
>> +    while ( size-- )
>> +        r =3D (r << 32) | be32_to_cpu(*(cell++));
>> +    return r;
>> +}
>> +
>> +static inline u64 dt_next_cell(int s, const __be32 **cellp)
>> +{
>> +    const __be32 *p =3D *cellp;
>> +
>> +    *cellp =3D p + s;
>> +    return dt_read_number(p, s);
>> +}
>> +
>> +typedef int (*device_tree_node_func)(const void *fdt,
>> +                                     int node, const char *name, int de=
pth,
>> +                                     u32 address_cells, u32 size_cells,
>> +                                     void *data);
>> +
>> +/**
>> + * device_tree_for_each_node - iterate over all device tree sub-nodes
>> + * @fdt: flat device tree.
>> + * @node: parent node to start the search from
>> + * @func: function to call for each sub-node.
>> + * @data: data to pass to @func.
>> + *
>> + * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
>> + *
>> + * Returns 0 if all nodes were iterated over successfully.  If @func
>> + * returns a value different from 0, that value is returned immediately=
.
>> + */
>> +int device_tree_for_each_node(const void *fdt, int node,
>> +                              device_tree_node_func func,
>> +                              void *data);
>> +
>>  typedef enum {
>>      BOOTMOD_XEN,
>>      BOOTMOD_FDT,
>> @@ -246,4 +292,20 @@ static inline struct membanks *membanks_xzalloc(uns=
igned int nr,
>>      return banks;
>>  }
>>=20
>> +/*
>> + * Interpret the property `prop_name` of `node` as a u32.
>> + *
>> + * Returns the property value on success; otherwise returns `dflt`.
>> + */
>> +uint32_t device_tree_get_u32(const void *fdt, int node,
>> +                             const char *prop_name, uint32_t dflt);
>
> Suggest using `dt_` prefix (or any other good prefix) for all functions
> in this header for consistency: e.g. there's dt_read_number() but also
> device_tree_get_u32().

I'd be quite happy with an fdt_ prefix, to clearly show they relate to FDTs=
.

But I didn't want to do that right away because it would obscure the strict=
 code
motion that's going on.

>
>> +
>> +/*
>> + * Interpret the property `prop_name` of `node` as a "reg".
>> + *
>> + * Returns outputs in `start` and `size`.
>> + */
>> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>> +                         uint32_t size_cells, paddr_t *start, paddr_t *=
size);
>> +
>>  #endif /* XEN_BOOTFDT_H */
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree=
.h
>> index 6dc1fb5159..0a22b1ba1d 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -10,6 +10,7 @@
>>  #ifndef __XEN_DEVICE_TREE_H__
>>  #define __XEN_DEVICE_TREE_H__
>>=20
>> +#include <xen/bootfdt.h>
>>  #include <xen/byteorder.h>
>>=20
>>  #include <asm/device.h>
>> @@ -22,8 +23,6 @@
>>  #include <xen/list.h>
>>  #include <xen/rwlock.h>
>>=20
>> -#define DEVICE_TREE_MAX_DEPTH 16
>> -
>>  /*
>>   * Struct used for matching a device
>>   */
>> @@ -164,17 +163,8 @@ struct dt_raw_irq {
>>      u32 specifier[DT_MAX_IRQ_SPEC];
>>  };
>>=20
>> -typedef int (*device_tree_node_func)(const void *fdt,
>> -                                     int node, const char *name, int de=
pth,
>> -                                     u32 address_cells, u32 size_cells,
>> -                                     void *data);
>> -
>>  extern const void *device_tree_flattened;
>>=20
>> -int device_tree_for_each_node(const void *fdt, int node,
>> -                              device_tree_node_func func,
>> -                              void *data);
>> -
>>  /**
>>   * dt_unflatten_host_device_tree - Unflatten the host device tree
>>   *
>> @@ -245,10 +235,6 @@ void intc_dt_preinit(void);
>>  #define dt_node_cmp(s1, s2) strcasecmp((s1), (s2))
>>  #define dt_compat_cmp(s1, s2) strcasecmp((s1), (s2))
>>=20
>> -/* Default #address and #size cells */
>> -#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>> -#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>> -
>>  #define dt_for_each_property_node(dn, pp)                   \
>>      for ( pp =3D (dn)->properties; (pp) !=3D NULL; pp =3D (pp)->next )
>>=20
>> @@ -258,16 +244,6 @@ void intc_dt_preinit(void);
>>  #define dt_for_each_child_node(dt, dn)                      \
>>      for ( dn =3D (dt)->child; (dn) !=3D NULL; dn =3D (dn)->sibling )
>>=20
>> -/* Helper to read a big number; size is in cells (not bytes) */
>> -static inline u64 dt_read_number(const __be32 *cell, int size)
>> -{
>> -    u64 r =3D 0;
>> -
>> -    while ( size-- )
>> -        r =3D (r << 32) | be32_to_cpu(*(cell++));
>> -    return r;
>> -}
>> -
>>  /* Wrapper for dt_read_number() to return paddr_t (instead of uint64_t)=
 */
>>  static inline paddr_t dt_read_paddr(const __be32 *cell, int size)
>>  {
>> @@ -307,14 +283,6 @@ static inline int dt_size_to_cells(int bytes)
>>      return (bytes / sizeof(u32));
>>  }
>>=20
>> -static inline u64 dt_next_cell(int s, const __be32 **cellp)
>> -{
>> -    const __be32 *p =3D *cellp;
>> -
>> -    *cellp =3D p + s;
>> -    return dt_read_number(p, s);
>> -}
>> -
>>  static inline const char *dt_node_full_name(const struct dt_device_node=
 *np)
>>  {
>>      return (np && np->full_name) ? np->full_name : "<no-node>";
>> --
>> 2.43.0
>>=20
>>=20


