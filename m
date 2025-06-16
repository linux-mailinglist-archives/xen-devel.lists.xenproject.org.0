Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAA6ADB2B4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017283.1394263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRALA-000852-2Q; Mon, 16 Jun 2025 13:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017283.1394263; Mon, 16 Jun 2025 13:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRAL9-00081t-UZ; Mon, 16 Jun 2025 13:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1017283;
 Mon, 16 Jun 2025 13:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRAL9-00081n-5m
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:57:35 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b3cb92-4ab9-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 15:57:29 +0200 (CEST)
Received: from BYAPR02CA0042.namprd02.prod.outlook.com (2603:10b6:a03:54::19)
 by SJ5PPF4C62B9E70.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::991) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Mon, 16 Jun
 2025 13:57:24 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::f5) by BYAPR02CA0042.outlook.office365.com
 (2603:10b6:a03:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 13:57:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 13:57:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 08:57:22 -0500
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
X-Inumbo-ID: d6b3cb92-4ab9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yj/qZXysleKQ/YBOydKCjlx4bpL+BWAp2IZCKclYdcmV8YPvefGv21TeMN5Mwm2nayOTvxHzNpJbnECulVOHjm+9owQ+C/YdT3ENxErB0VfJ9Kl8gxjPAhAS9Mhe9lIDFxKHUO1jkwIsWLi3SmWv/mN9a+xLbuTTn/ywg16jAAqxtY+uGNNAy0+KKKifCpgFltOoY4HJxh94uPD4ip82mgPLWOk0Pu28oVKC9IwDa+9PBrwtLU6vF/kXN+hykVfohsowPQKLeLxPTg1Mg8XgWZyGLEYFVGbu+p2LzkeBmJIzRdpgPPOurU8dBLStcaFj0pPy2XIZzKBGEl2bJ24PAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn5DtUjkdh7OjnMeZqeqJNCf8lcLQwrc/eIHXuMhi28=;
 b=NAbo1UHz66ZLUX1VFaZuw+uJMWxlN0rELvjEuIzEZ/fMSj/GfwfK9HWRpICyledkyx+SwhPTop+jTJMBldwvwX9R/f0L3Kn15D/DEdm/Hj3o3h/vTsegYA4nktPXVbfQjEIhBQtHzZiCs5AEPyNoNn59Grproe2n3Mcy3CPL5JlC559+KlZVjlWFvYFRhzQ8TyihAfaUBgOa5hdxpXPyoOsASTAmpt+n9YPperadBRE5iTi+xhksqpB91egur2Z0JkHv1Jxu8ZfNNyLO7zzSHjw6xh2C20lF37yebNLt/XZotUvZ76+wx+ZKC+HHT5ScLg5IIcdNUO5q/NHOsWdu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn5DtUjkdh7OjnMeZqeqJNCf8lcLQwrc/eIHXuMhi28=;
 b=3WTIIMle0MK0RyKnwdT9/XUkUvNOxk+GiVfrbIRFR7dnL43TtTIaOJ89tPjlldj6g2A4sErvq9/1G9gP8up+cHkgiNMmW37yJPDj83IBUKfJg4ufoaP1tI6alTpB18HaujzgypmtmZiTWmvT7E3ScF3dhW4Y0ah/8KQzWtfTxOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 15:57:21 +0200
Message-ID: <DAO0DMLBGSY7.25MPPJVB6G2KZ@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 08/14] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-9-agarciav@amd.com>
 <alpine.DEB.2.22.394.2506131815200.8480@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506131815200.8480@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SJ5PPF4C62B9E70:EE_
X-MS-Office365-Filtering-Correlation-Id: e47df39e-90f8-4739-236e-08ddacddb906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnhpUXZ0NXVPa0lRQjNtcHppQUR5UVhodUUzVm0zeEFWR25nb0o4K3Jqdk1U?=
 =?utf-8?B?Mjd2U2RzOVFUMFl1Q2hTbVY3d0ZSTGpsK0ord3hZcVBKazVDQkJjNDk4OXVp?=
 =?utf-8?B?Q2hqS2hzYTZJcVZGNU1OUVVtUXZqbk4xdC9rK1hpSmVuMld5YkxwMVE5dmVj?=
 =?utf-8?B?blB1WHRGb3VUWXgvNU9BRVJOK24vNWRwb3IzamFmNUZYeDZCZU9lTk1VL3o4?=
 =?utf-8?B?a3ltbTN4RldSY1dMaG5ZcnJRdXAwOTJTNlVZa1NUeDhIaDJNWXJ6WjRIeHZ3?=
 =?utf-8?B?Y3doN3FQbUJvb0wza2Fzc2VKanBVQWI2Ly9yR2V3VUNpWlNpeS9vVDgrRGpX?=
 =?utf-8?B?NzRSQkdtVVgrald6bXlGQmRZR0RiNURBOXZXbWwzbTBsT1ZjTVlEanUwN1ZM?=
 =?utf-8?B?RTFWQUtBZ1Y2Tmk5NFZxbXpOMm9VSG9kWXI5VzR1YXdoRzk1WG9iRGFsTmtJ?=
 =?utf-8?B?VytjcmY3bERUbW14MFIxYjZrUzNoOU4wTXo5YXZiYzBGdHlrMWRLaERSUkNt?=
 =?utf-8?B?TDZZWU9JVjBRbnRtN3NEQk9weDI5YWRTbWc3Vi92U2xMRFg1ZlVQMUlYcDdy?=
 =?utf-8?B?QktwK2hoUEEvV1lGV0VvR1ZGR2ZDUVRPci9vUkxIQ1ZXWjZPRVRwZS92cTBr?=
 =?utf-8?B?T0pETk9aZDNYeER3RUhWazFoU1A5ZnpTNmF5NlQ0bitkbFhwRGxnSlZlZnpE?=
 =?utf-8?B?TTkwa0tSb1JzcDdIeERhY3k1Q2JpL05xRWRQRTJIZU1FL1RBNEdXSUdYSGs3?=
 =?utf-8?B?cGxDT1BtQjBuamxmQ3MyVVcrcmhKWEg1dktrZHVNYWFnR0crbmFIYkV6ZHlV?=
 =?utf-8?B?QkJRSk11YjhFeVJMUGVDUURKNHpUNkxUMVdmVk5WM042M0QvcmlMTVZSL2w5?=
 =?utf-8?B?cXR5VGRQMEl0WWVZbElEMkUzeEwrWStuSEhTQjJQN3l5ZFYvaWt5NkRHU2Jt?=
 =?utf-8?B?RGk3dS9SeVBQVHFyV0t0MVN0YytzQzNWM2plU1FsTG1xQXZmd25NcDVQZTl5?=
 =?utf-8?B?TzJiVDRmR3V5V1hJdE92azhYT1MvWGJzTnkyTW1JU1lEVWhaMG8rY2c0NXgw?=
 =?utf-8?B?MXV4aWJ2Z1hQek5jdkhtSllidEgxaERUeUJpaVlZcEV2S3I2STVNZkx2aVZM?=
 =?utf-8?B?TmlsR1p6azZsWEYxUjRNcFhzZlpSVnZwV256YjFvWjlqTEtyazZDdy93M2NS?=
 =?utf-8?B?QU1HTXdjK1dxa0xzQVRBNzNVcW5xVFRuN3NFNmxscm5XbllQYTJ1eU9ieWhp?=
 =?utf-8?B?bUxad1puRUtpcnp6MUVoM2VVZ3lVbDNMSEtTbkdaQXUxemZycU1QUXRmK3JN?=
 =?utf-8?B?azFEaXRVaFNCTi9IS3Qrc3VoVXU4MWp1SWFBd3AxSWwycWhHTWJ0aXAwNzFW?=
 =?utf-8?B?N3FiSzNLNXY2YVNxaE8rTEJXU1k0Wm1hdTBnQW9XSDlTNEpVWFRvVVVkT1Vh?=
 =?utf-8?B?TmMwM3lTL1F0SXA5RDYvdTVjL0srUjkxdmlOZGp0TnNuSWJuMlVqcnhCSDh0?=
 =?utf-8?B?bVVIdEdEN0RyTkZHcmpTYS95U0lvbFFIM0drZy9ldGRMNFN3L0JtYUJyUWpJ?=
 =?utf-8?B?QXMrWnlxRmFvRUlUWVIwQmJpSWdjVmZaSXNRQ1BtVE1WTXUwdWFHNW15aUFW?=
 =?utf-8?B?cmpROGliQ3FRL2ZvRko2OThPc292d0YwbTh1RnljVmdLdTJld2dUYXhMWkp5?=
 =?utf-8?B?b0trRHVneC95YTFaQ0YyQ1dkYlZ6OEl5SExFRHRYMlRheUZodDliZnFwd2Nk?=
 =?utf-8?B?UXc5U0J5K0NuMlB0VFl4ajFxRUhpT3oraFpyaWx4WmRGWXlZYURNTk1Ucyto?=
 =?utf-8?B?OGt2WXdBTktSMXVDUUhRejBSeERkZDhqeFBpMXdQZ2w5Y3R4aTRkQk1MeFNN?=
 =?utf-8?B?Wml4SzFvcFBuTzNiaWdYRWFSUzdFMUI3WTN0Sm9LeEdiUjRYaWFyeHVQeFdE?=
 =?utf-8?B?b1E0UW5QYlZOYmhkSmNrUFl0YkZIUndwTlgyMmZDWjlxczJxZ2JncnI5VjNU?=
 =?utf-8?B?d1lNTGtTeitJTHZVWVJKYjhTZ2VkWnBzL1gwNHI3ZVR4QXoxVU1WdmxzT1FL?=
 =?utf-8?Q?zB3SNu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 13:57:24.7147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e47df39e-90f8-4739-236e-08ddacddb906
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4C62B9E70

On Sat Jun 14, 2025 at 3:16 AM CEST, Stefano Stabellini wrote:
> On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
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
>> v3:
>>   * Avoid mutations during code motion
>> ---
>>  xen/include/xen/bootfdt.h     | 62 +++++++++++++++++++++++++++++++++++
>>  xen/include/xen/device_tree.h | 40 +---------------------
>>  2 files changed, 63 insertions(+), 39 deletions(-)
>>=20
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index 8ea52290b7..b6ae7d6aa6 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -2,6 +2,7 @@
>>  #ifndef XEN_BOOTFDT_H
>>  #define XEN_BOOTFDT_H
>> =20
>> +#include <xen/byteorder.h>
>>  #include <xen/types.h>
>>  #include <xen/kernel.h>
>>  #include <xen/macros.h>
>> @@ -16,8 +17,53 @@
>>  #define NR_MEM_BANKS 256
>>  #define NR_SHMEM_BANKS 32
>> =20
>> +/* Default #address and #size cells */
>> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
>> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>> +
>>  #define MAX_MODULES 32 /* Current maximum useful modules */
>> =20
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
>> @@ -260,4 +306,20 @@ static inline struct membanks *membanks_xzalloc(uns=
igned int nr,
>>      return banks;
>>  }
>> =20
>> +/*
>> + * Interpret the property `prop_name` of `node` as a u32.
>> + *
>> + * Returns the property value on success; otherwise returns `dflt`.
>> + */
>> +u32 device_tree_get_u32(const void *fdt, int node,
>> +                        const char *prop_name, u32 dflt);
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
>> index 75017e4266..0a22b1ba1d 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -10,6 +10,7 @@
>>  #ifndef __XEN_DEVICE_TREE_H__
>>  #define __XEN_DEVICE_TREE_H__
>> =20
>> +#include <xen/bootfdt.h>
>>  #include <xen/byteorder.h>
>
> This should not be needed?

I wanted to avoid having to touch include sites. Let me check how many affe=
cted
places there are and fix up accordingly if any needs adjusting.

Cheers,
Alejandro

