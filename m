Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16956A98954
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 14:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964544.1355308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Yxg-0003k0-HC; Wed, 23 Apr 2025 12:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964544.1355308; Wed, 23 Apr 2025 12:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Yxg-0003hO-EA; Wed, 23 Apr 2025 12:12:20 +0000
Received: by outflank-mailman (input) for mailman id 964544;
 Wed, 23 Apr 2025 12:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7Yxf-0003hI-3g
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 12:12:19 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20627.outbound.protection.outlook.com
 [2a01:111:f403:2406::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 320bd8c3-203c-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 14:12:17 +0200 (CEST)
Received: from SJ0PR03CA0293.namprd03.prod.outlook.com (2603:10b6:a03:39e::28)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 12:12:11 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::9d) by SJ0PR03CA0293.outlook.office365.com
 (2603:10b6:a03:39e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 12:12:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:12:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 07:12:05 -0500
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
X-Inumbo-ID: 320bd8c3-203c-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdippMtPwaszWZ9uvTt0ceU2j4w7vd/ipVfqiSRQSOI/j28CpDBtmaP8NnF3a48zg1S3cbehclgV0LovV+c/+D45hOVOU7ZgDLnYPKr98VTl7hBFdbvEqEhT964Y2oP66W3KNy+npp+G2qZ3sh1Dsr8+3zC/bKiVD2FTuz6UVQgwnP2NRYpaOixeH5EulZUAdL0xBbN/O7V/b3o0JasobzBiBJkECuLr3j+JQcl7KJnCHZdzuQm37V4A0RlIQ4aPpEWs+ktplQG5vphq74G7ZGMlfTcYc+Y3KDTjorClR8j+UaW5XZxqLD1hyhErQzsxFVe8bqOc6QK4r6jvJ2HhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSe4xzZ/l7UZnQ28PKXHhXP1kzT/+jUf+MATFOebIQ4=;
 b=Kuo/7zp99n1JF9aWV8+7+UQ4OP4CiA2mAdy5MUbKAL92otS4GgYVj2/yzOXGO33nPMI05p9Hr/E+X0KlxwcCJkCHGz7LQwKVM5jPPZjwdMMhua7giDTlTwFA6JJAOXbQcvtGe1ehXRAJB7yP/L4nAdV1un3yWCxm5iL7oF3VXqpTSNxYsjusHheMGYy7akCGoITn+WXJeUtiXDscbxta0NPL7E8ux06hz95EZr1WJ35r2rfUGFDy9yZIVSMTRLu1romj0FlZLfuFLaiBMMxNSPpLS/CWSPvqALIxIQ9Om2aeZ73LCrv0fY6KdcNo9eeU1vcPLnoBRuGN6r5c57iiQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSe4xzZ/l7UZnQ28PKXHhXP1kzT/+jUf+MATFOebIQ4=;
 b=BWyO4x2KGx+VIfOVuJTlGk0No2TI4RAiA/+Ns/5vY2VSrAa5VoljdU11E6dCngUcNUd77+9b4G7PtfLMQ9g+SgHbGl69N3J59Wphwx9CbXebNZD4vzUmG8zK1VIs4vYZgrPgUVwkGnfkoghMPIoSjHungLLK0TQFG8gkYtbYglU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 13:12:03 +0100
Message-ID: <D9E0BL26H82L.2DEW4IC6FENYN@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [PATCH v4 05/13] x86/hyperlaunch: Add helpers to locate
 multiboot modules
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-6-agarciav@amd.com> <aALSauQee7Z3O8Bj@kraken>
In-Reply-To: <aALSauQee7Z3O8Bj@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: e293f4ca-2e85-4a39-2e72-08dd826012c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZStpdXZ3TlF2bktaRWd0dzVITVlnalVpd3cyMU8yeTJGdzNUa2toVHpWU0Zx?=
 =?utf-8?B?MDdJdXBWbnJ1dURjVzFGejh3VmczYmpQTGdlZ0hKeGkyUERkWTJvQS9oUVho?=
 =?utf-8?B?LzZ2ZG4rYlpiS2pDWXVHM1dsUmc4dWQwT2RhUXMyMHZ3Y29mZXhzUWRndFJ2?=
 =?utf-8?B?M05HZmptck8vOGZrOVJsRFhFWTZMQWc2ZTJnaHdFdVRPODFpZXBmZjVESm1j?=
 =?utf-8?B?ZU84bGdEVk8rT1RwSkpoanZOVGFySmJpWHZDa25pQ0VaRFU2STNPMWVmTklU?=
 =?utf-8?B?QWZkNnB4djNweitrb1N0NjIrMXNvaTh5YkJxNlU0Z0IyWjN2VTluRGNINGsw?=
 =?utf-8?B?bTJnZm5QWHdYODJNS3hsNGtnanlJU3grTXRKLzFYenpVYStLVTBJWXhwblg3?=
 =?utf-8?B?UWdHNlJnR2Q0ZFBsNUsyaWE0RysydFNXc0hIYm9keFduOHpCRGlreS9yckgv?=
 =?utf-8?B?ektwYzlyNEduUzB2UWlVb2hleEFQcUNHU3RBMTBLS1ZwV3c0cGZyNUdGQW5y?=
 =?utf-8?B?ZzkxeUpFYXBTRUd4MU1zQVk4L1NwVGVsWDhGVFprVDY0VzV3RC90YnVMajVv?=
 =?utf-8?B?S3dvK3BGRmh2NTFKRVU5cWtJVTBCRVRzRCtxWjdKaTA0RTJmSFMzdm5vcE0v?=
 =?utf-8?B?cGlnMGNQSkNsS1NUei9ub2VrcmZCVWxXTUZzM0ZxNnBJbFFBaEp2VFg0UjhY?=
 =?utf-8?B?N3BINit1M0pmc1ZySlRVN0VILzVWS3cwNEg0SkdJU0hHYnhyRk5EY1YzU0E1?=
 =?utf-8?B?TTRmY2NOOEl0OWk3MkI5RG16clRXS2M4MVFtdXUrSGF1UmhkQjFkdGRwNWE2?=
 =?utf-8?B?RklLSnpMNFJ1OGladFh3K1Y4aVBUK3o0UE11YkFYZWZxZEp5eHVGWnJUMWF5?=
 =?utf-8?B?L3E0Y0xDZHZXaXpMSlkvSy8ybVRKMkhTUmd4K3VhT0l6OTY2a2wycTRwNkhT?=
 =?utf-8?B?YmpLaFk4K1EvYzFYMU1uTkJoTEVkMTNtQ1pCUXMwcnpNSlF1MFNjSjQ1emJx?=
 =?utf-8?B?OFczUlY1cVZGbGhPNU5sbm1YeVM3Z1U3Z0ZWUVJkMFVWMi9ZTGdDTk9wdHRD?=
 =?utf-8?B?WFA0RUY5S1pXZjdEZ2NmelQ2dnFNbHFvNmNod1krekVtNWs0ZmNRT05UMHBR?=
 =?utf-8?B?ajJBK3lyL0w1a1JlOFVHbTZtSlZlTDlVQlJ0dDBsTERHT21GdytEa3kzaGN0?=
 =?utf-8?B?MGx3eWVGMmd2c1dxUU9GcVdGYmJwOHozK1NYd1NWdUN2Q0YzeTBmZGZCOGRE?=
 =?utf-8?B?UjJQUHloaURVTzAxMlZyckV2S3NpTFFUcHF1VW9Xd1BjQk53QVZzZ0hjVG1i?=
 =?utf-8?B?RSthdEdCS2ZNNUZ6N3FlWHZENkhOM2MyaWM5cWNVVlRlcExEL2ZSaGFpWU5Z?=
 =?utf-8?B?a3QwK0thalp5dHhIRDhqVXFPbFRqYW83ZmpMNVpTQWxMN1VsK2ZSNGJjYVZG?=
 =?utf-8?B?SE55Ymw3VkVQbUo4SnNUeDZXb2lkdU5NZjA2b1h3SFo1bDY3TVVYRGJNS3N0?=
 =?utf-8?B?bC9xaktUaVN6MXkvVlR4cVNKSHZZdXo4KzF5UU9NQ2lleFNHcFhBMW9RLzF5?=
 =?utf-8?B?Slc5M2s2ajlWS3Q5dFpUNXNSZUdpU1k3QVFvMDdjWURFcnY0QWRFSi9mMWcw?=
 =?utf-8?B?eTB5eGc1VzNUL3pSNlhYVk5QTG9lNUp4UnNLdzJoc0swY0xxdldWVWtHTXl2?=
 =?utf-8?B?R0d4eEQ4UGdBa2hPYnRBaGJ6dndKdkxwbkRGWjh5QlVYc2dIZlhRRTVEb0ho?=
 =?utf-8?B?bDRRQ3pUbUFicnVOa0dpblFERXJqcW44T0NIQWc1bThQbjlhVWsxSlJyZ2tN?=
 =?utf-8?B?NDhUQ2tIc2pTU0JXRlJDcWFnbnM0NVN2YjFJM0c3VHJiVkd2dUhVSHUvNm9M?=
 =?utf-8?B?QW8xOHozWFJXMk94YUp1dDZ3cmpGZVdPSDJBNFRDMHB0RkJWQVd4L2VzSy94?=
 =?utf-8?B?ekpRNXJWbnNpNzRaK3dSeTloeWgxVmtoR0NUWDBnWnJUS1lMaUo3UDNMZ0wr?=
 =?utf-8?B?RTNlTVowaE9aWUtsNjZGRzFaamk4YzJzaWxBM0FpbWhOZEZ0YWxBZ2Q1a3hO?=
 =?utf-8?Q?ysSxBf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:12:09.8389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e293f4ca-2e85-4a39-2e72-08dd826012c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229

On Fri Apr 18, 2025 at 11:30 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:27PM +0100, Alejandro Vallejo wrote:
>> Hyperlaunch mandates either a reg or module-index DT prop on nodes that
>> contain `multiboot,module" under their "compatible" prop. This patch
>> introduces a helper to generically find such index, appending the module
>> to the list of modules if it wasn't already (i.e: because it's given via
>> the "reg" prop).
>>=20
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * Remove stray reg prop parser in libfdt-xen.h.
>>   * Remove fdt32_as_uX accessors.
>>   * Brough fdt_prop_as_u32() accesor from later patches.
>>     * So it can be used in place of a hardcoded fdt32_as_u32().
>>   * Limited MAX_NR_BOOTMODS to INT_MAX.
>>   * Preserved BOOTMOD_XEN on module append logic.
>>   * Add missing bounds check to module-index parsed in multiboot module =
helper.
>>   * Converted idx variable to uint32_t for better bounds checking.
>>   * Braces from switch statement to conform to coding style.
>>   * Added missing XENLOG_X.
>>   * Print address_cells and size_cells on error parsing reg properties.
>>   * Added (transient) missing declaration for extern helper.
>>     * becomes static on the next patch.
>> ---
>>  xen/common/domain-builder/fdt.c     | 162 ++++++++++++++++++++++++++++
>>  xen/common/domain-builder/fdt.h     |   2 +
>>  xen/include/xen/domain-builder.h    |   3 +
>>  xen/include/xen/libfdt/libfdt-xen.h |  11 ++
>>  4 files changed, 178 insertions(+)
>>=20
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index b5ff8220da..d73536fed6 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -13,6 +13,168 @@
>>=20
>>  #include "fdt.h"
>>=20
>> +/*
>> + * Unpacks a "reg" property into its address and size constituents.
>> + *
>> + * @param prop          Pointer to an FDT "reg" property.
>> + * @param address_cells Number of 4-octet cells that make up an "addres=
s".
>> + * @param size_cells    Number of 4-octet cells that make up a "size".
>> + * @param p_addr[out]   Address encoded in the property.
>> + * @param p_size[out]   Size encoded in the property.
>> + * @returns             -EINVAL on malformed property, 0 otherwise.
>> + */
>> +static int __init read_fdt_prop_as_reg(const struct fdt_property *prop,
>
> I would do s/read_fdt_prop_as_reg/fdt_prop_as_reg/ similar to fdt_prop_as=
_u32()
> below.

Yes, that sounds better.

>
>> +                                       int address_cells, int size_cell=
s,
>> +                                       uint64_t *p_addr, uint64_t *p_si=
ze)
>> +{
>> +    const fdt32_t *cell =3D (const fdt32_t *)prop->data;
>> +    uint64_t addr, size;
>> +
>> +    if ( fdt32_to_cpu(prop->len) !=3D
>> +         (address_cells + size_cells) * sizeof(*cell) )
>> +    {
>> +        printk(XENLOG_ERR "  cannot read reg %lu+%lu from prop len %u\n=
",
>> +            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
>> +            fdt32_to_cpu(prop->len));
>> +        return -EINVAL;
>> +    }
>> +
>> +    switch ( address_cells )
>> +    {
>> +    case 1:
>> +        addr =3D fdt32_to_cpu(*cell);
>> +        break;
>> +    case 2:
>> +        addr =3D fdt64_to_cpu(*(const fdt64_t *)cell);
>> +        break;
>> +    default:
>> +        printk(XENLOG_ERR "  unsupported address_cells=3D%d\n", address=
_cells);
>> +        return -EINVAL;
>> +    }
>> +
>> +    cell +=3D address_cells;
>> +    switch ( size_cells )
>> +    {
>> +    case 1:
>> +        size =3D fdt32_to_cpu(*cell);
>> +        break;
>> +    case 2:
>> +        size =3D fdt64_to_cpu(*(const fdt64_t *)cell);
>> +        break;
>> +    default:
>> +        printk(XENLOG_ERR "  unsupported size_cells=3D%d\n", size_cells=
);
>> +        return -EINVAL;
>> +    }
>> +
>> +    *p_addr =3D addr;
>> +    *p_size =3D size;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Locate a multiboot module given its node offset in the FDT.
>> + *
>> + * The module location may be given via either FDT property:
>> + *     * reg =3D <address, size>
>> + *         * Mutates `bi` to append the module.
>> + *     * module-index =3D <idx>
>> + *         * Leaves `bi` unchanged.
>> + *
>> + * @param fdt           Pointer to the full FDT.
>> + * @param node          Offset for the module node.
>> + * @param address_cells Number of 4-octet cells that make up an "addres=
s".
>> + * @param size_cells    Number of 4-octet cells that make up a "size".
>> + * @param bi[inout]     Xen's representation of the boot parameters.
>> + * @return              -EINVAL on malformed nodes, otherwise
>> + *                      index inside `bi->mods`
>> + */
>> +int __init fdt_read_multiboot_module(const void *fdt, int node,
>> +                                     int address_cells, int size_cells,
>> +                                     struct boot_info *bi)
>> +{
>> +    const struct fdt_property *prop;
>> +    uint64_t addr, size;
>> +    int ret;
>> +    uint32_t idx;
>> +
>> +    if ( fdt_node_check_compatible(fdt, node, "multiboot,module") )
>> +    {
>> +        printk(XENLOG_ERR "  bad module. multiboot,module not found");
>> +        return -ENODATA;
>> +    }
>> +
>> +    /* Location given as a `module-index` property. */
>> +    if ( (prop =3D fdt_get_property(fdt, node, "module-index", NULL)) )
>> +    {
>> +        if ( fdt_get_property(fdt, node, "reg", NULL) )
>> +        {
>> +            printk(XENLOG_ERR "  found both reg and module-index for mo=
dule\n");
>> +            return -EINVAL;
>> +        }
>> +        if ( (ret =3D fdt_prop_as_u32(prop, &idx)) )
>> +        {
>> +            printk(XENLOG_ERR "  bad module-index prop\n");
>> +            return ret;
>> +        }
>> +        if ( idx >=3D MAX_NR_BOOTMODS )
>> +        {
>> +            printk(XENLOG_ERR "  module-index overflow. %s=3D%u\n",
>> +                   STR(MAX_NR_BOOTMODS), MAX_NR_BOOTMODS);
>> +            return -EINVAL;
>> +        }
>> +
>> +        return idx;
>> +    }
>> +
>> +    /* Otherwise location given as a `reg` property. */
>> +    if ( !(prop =3D fdt_get_property(fdt, node, "reg", NULL)) )
>> +    {
>> +        printk(XENLOG_ERR "  no location for multiboot,module\n");
>> +        return -EINVAL;
>> +    }
>> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
>> +    {
>> +        printk(XENLOG_ERR "  found both reg and module-index for module=
\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret =3D read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr=
, &size);
>> +    if ( ret < 0 )
>> +    {
>> +        printk(XENLOG_ERR "  failed reading reg for multiboot,module\n"=
);
>> +        return -EINVAL;
>> +    }
>> +
>> +    idx =3D bi->nr_modules;
>> +    if ( idx > MAX_NR_BOOTMODS )
>> +    {
>> +        /*
>> +         * MAX_NR_BOOTMODS must fit in 31 bits so it's representable in=
 the
>> +         * positive side of an int; for the return value.
>> +         */
>> +        BUILD_BUG_ON(MAX_NR_BOOTMODS > (uint64_t)INT_MAX);
>> +        printk(XENLOG_ERR "  idx=3D%u exceeds len=3D%u\n", idx, MAX_NR_=
BOOTMODS);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * Append new module to the existing list
>> +     *
>> +     * Note that bi->nr_modules points to Xen itself, so we must shift =
it first
>> +     */
>> +    bi->nr_modules++;
>> +    bi->mods[bi->nr_modules] =3D bi->mods[idx];
>> +    bi->mods[idx] =3D (struct boot_module){
>> +        .start =3D addr,
>> +        .size =3D size,
>> +    };
>> +
>> +    printk(XENLOG_INFO "  module[%u]: addr %lx size %lx\n", idx, addr, =
size);
>> +
>> +    return idx;
>> +}
>> +
>>  static int __init find_hyperlaunch_node(const void *fdt)
>>  {
>>      int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
>> diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder=
/fdt.h
>> index 955aead497..8c98a256eb 100644
>> --- a/xen/common/domain-builder/fdt.h
>> +++ b/xen/common/domain-builder/fdt.h
>> @@ -2,6 +2,8 @@
>>  #ifndef __XEN_DOMAIN_BUILDER_FDT_H__
>>  #define __XEN_DOMAIN_BUILDER_FDT_H__
>>=20
>> +#include <xen/libfdt/libfdt-xen.h>
>> +
>>  struct boot_info;
>>=20
>>  /* hyperlaunch fdt is required to be module 0 */
>> diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-b=
uilder.h
>> index ac2b84775d..ace6b6875b 100644
>> --- a/xen/include/xen/domain-builder.h
>> +++ b/xen/include/xen/domain-builder.h
>> @@ -5,5 +5,8 @@
>>  struct boot_info;
>>=20
>>  void builder_init(struct boot_info *bi);
>> +int fdt_read_multiboot_module(const void *fdt, int node,
>> +                              int address_cells, int size_cells,
>> +                              struct boot_info *bi)
>>=20
>>  #endif /* __XEN_DOMAIN_BUILDER_H__ */
>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfd=
t/libfdt-xen.h
>> index a5340bc9f4..deafb25d98 100644
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -12,6 +12,17 @@
>>  #define LIBFDT_XEN_H
>>=20
>>  #include <xen/libfdt/libfdt.h>
>> +#include <xen/errno.h>
>> +
>> +static inline int __init fdt_prop_as_u32(
>> +    const struct fdt_property *prop, uint32_t *val)
>> +{
>> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
>> +        return -EINVAL;
>> +
>> +    *val =3D fdt32_to_cpu(*(const fdt32_t *)prop->data);
>> +    return 0;
>> +}
>
> My understanding is domain builder establishes its own shims around libfd=
t so
> libfdt is kept unmodified and it is easier to pick up libfdt updates.
>
> So, IMO, this function should reside in xen/common/domain-builder/fdt.c
>
> Thoughts?

Ugh. Too much code motion is not good for your head. I did mean to move
them all (I mentioned it in an earlier response to Jan, I think). Will
do for good this time.

Cheers,
Alejandro

