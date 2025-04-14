Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD0A88C10
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951266.1347359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PJC-0006Av-68; Mon, 14 Apr 2025 19:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951266.1347359; Mon, 14 Apr 2025 19:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PJC-00068t-35; Mon, 14 Apr 2025 19:17:30 +0000
Received: by outflank-mailman (input) for mailman id 951266;
 Mon, 14 Apr 2025 19:17:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4PJA-00068m-CY
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:17:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e89a62-1965-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 21:17:26 +0200 (CEST)
Received: from DS7PR03CA0347.namprd03.prod.outlook.com (2603:10b6:8:55::6) by
 DS0PR12MB7828.namprd12.prod.outlook.com (2603:10b6:8:14b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Mon, 14 Apr 2025 19:17:22 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::16) by DS7PR03CA0347.outlook.office365.com
 (2603:10b6:8:55::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 19:17:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 19:17:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 14:17:18 -0500
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
X-Inumbo-ID: 18e89a62-1965-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENM5zhwn3Nm/XAtdab2F1nRAzuY2CuEnAm50+B2unETrB6t/AbocmAGPF6We3MY3nuIsFY+p95I45keyMpjv8a55MWr6lD+2JLoAdbL8fthWkLI5OKDP3o8DzcHSWPvoMiN10AJnUqiGC9ku5SpozaWOfgpAtX199bScJZBQm8pii0KRmdXgEbDZpIgT79KTWUBcfiPx0ponymQ/+w8TPaxxQor5E8W55ZoZxjAFjKc4r5Rg9JtA+28XFw70VvRu9IxpWVWA/COmnfBVlOGb3LtH36ubHnROiRYaFVQ8MQkFICxwVe98MwelfhUSAR2n6hA2OTGyWEv8ACYSh/BlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjAOBhNyX5YRiLgxwAXCZ7r6HCtqpl8OfSZMeL+z7lA=;
 b=eJRb7tuaX+51j4odFRp9UeY8uvBLGMYjfovUoiTKrsgYQ4x+WM4QAmKh+7/qsgieN+8osaEYFCVOsDoZpelVwu6XaZx7uATvzVh7mZpROuyjgg2xGjpaOsmxgiw+DW6lCGaOd/0V0d4vQmRbcc6nYUcp1ea6A85hYIvLPXJD3JVpsOfMFBUNBU+BkWAAO/l9vArDqg06X3F2ZnyE9t5hvtgr8Kzk2BOoni9OfI/3LqIMAtyS0Cz1Mca6y/z7HVIx+DZl6iXZyA6Fy+tQQ2reIzBmDa3jZSRgcKw3/2pi6sZetLmwAq75eDfUKO/KWCaS7I5FqkXBdxa34a70uc4I4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjAOBhNyX5YRiLgxwAXCZ7r6HCtqpl8OfSZMeL+z7lA=;
 b=sU/IdT8jdxLesZFNLovNWWX3SUDMpOGJXMVY4FKH6RG04E6wEt35Q1ePtPfek3K0PbvjbpUtm6kn6Rhs98yU55sxSx5w5Lbp7311GnRtieHqgqzYCUnpEF753y2KLw0lYOiJ7A6HHVD3WMe5oAQ0chF4ivELb16DbncACYmTODU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 20:17:17 +0100
Message-ID: <D96LQ9OQ467M.1ATID4WAG2COB@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot
 domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-17-agarciav@amd.com>
 <qMw3Q37efKWp7_jJqwDD6Y3Pt0d0qdCxZDIWzgsMg1LehShPFTIOeJnqBq74lOcTERdwsLTcTazRd2zR0k-_S9TeE-ymcU3S2PH6_o9QRCU=@proton.me>
In-Reply-To: <qMw3Q37efKWp7_jJqwDD6Y3Pt0d0qdCxZDIWzgsMg1LehShPFTIOeJnqBq74lOcTERdwsLTcTazRd2zR0k-_S9TeE-ymcU3S2PH6_o9QRCU=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DS0PR12MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ad30cd-f318-4118-0861-08dd7b88fba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bURraitXamJsUFFvU0hyWVZQc1ppcHJhMXRyZm9STEU1MUxTb0VvdVBDTlJE?=
 =?utf-8?B?dzl2SVdUTXFDRlI5Sjh1UC9lWHFHb1ZpMlJLbVY0bExJa0xaV0F4U09hVmpx?=
 =?utf-8?B?RjlSVUk2OXRSZFR3Q3JaVlZFaTRxamJPQmNzMWRYQXYrQ0FrTXlHR1Nrc0d5?=
 =?utf-8?B?TnIxWkkxVE9ldno3NGJjd0RURnA0NHpPNVBNQWNFSlZhN2g2UFBra3VCclhl?=
 =?utf-8?B?R3UyT1JSSm8vZ3kzaW5UMHlKa3B5c0pwYXg2SUd1Z2s2d09vYkVscFFWMUhr?=
 =?utf-8?B?NXBQTzVOeXhmM29NNzVCNk9xUU5aWU9qbWVWWkFtaGdicjZGNnhRT2p6M3Vj?=
 =?utf-8?B?Q09yZVZzaUltZXpvTDRGZ2N1NGt3enI4MS96WWZ3MHFpQ29JRzRXUCt4VWpO?=
 =?utf-8?B?bjJqQlhnMkhmSGtPVkZPSThJZmloVmF1eStYcGYwZ0U0TkI5dytYcjZDOXgy?=
 =?utf-8?B?RTR6eXIzaFI3dlUxZ2ljNXVtSUQ5aUZnU1Y4VkdYL2V0OThuVnpwczNSSDVF?=
 =?utf-8?B?cnhWa2d6K2RubmIrbSt3T2Zpc21BUEQxc1lWaTFGNzVNQlBhb0tHVkRtQ0xK?=
 =?utf-8?B?bGNYdUVzaVQwRXFtd25aVURaNmN1UXpLUXBnK1NTR0NkS2ZudC8xRlY2d1Fr?=
 =?utf-8?B?MlNsaTJBNGQvV3V0bVB0dk9HSkowVkExYWlPeTd1c29kTGRtS2ljb20rQW1w?=
 =?utf-8?B?VXVKRXMza0NFV3ZlT1plaGF0K051NStmMGhNdjFnU2IrOURyenBBWVV6ME4z?=
 =?utf-8?B?V1J6THRuMlR2SHlVdy8wUkRyRXdUZGErMzZrNWNibkNGNjVIN05jWCtYc0Qv?=
 =?utf-8?B?RHlyUFpJcWxuNXBUMGMxd1dnZVZhS2ZsNFRqRUN4bGliV2pzK3lqTlZBRStI?=
 =?utf-8?B?K0pVT1ZXY2JLRnp3MW5GVjdsU2NKcWxoKzF3QytzdEdKNENDMlF3VCswOXBY?=
 =?utf-8?B?RkltRmhKQTc4ZFYrZU92NUF6di9ibmxML25qa3NsNzBKSlYvV09SbU83cWlS?=
 =?utf-8?B?dkNycGNVMnV1WnQ4Q0dMenhDNkJsVTk1SDF4N0Y4VmhUU3hRZS9hRjBGMlFq?=
 =?utf-8?B?YTdwRFBzV1Q0SE1jd29HZjJOTDl2cWt3bmcxQUNEWnVDVnhpeVlIN0JDQVBM?=
 =?utf-8?B?Y0h1ODVtRjF4MTdWVjNBaFlNb2cxUWpRM3NYM0I3ck5zd0JRaHJzTVpOOHhm?=
 =?utf-8?B?R25TVDltVUgxK3JYdU9UWk9XdGloOEJYTW1kak04ZmVFYjNaR1UzYndCSUFW?=
 =?utf-8?B?c1VNVzU4RVNVdnRvRGtTc3JScXpXUGY1OVd4MUVlTWQwQS9YcG84M3lWd0hI?=
 =?utf-8?B?ODdmb0tLYVE5ZVFEVjdvR2lqNXpsVWF4N0twWUoyR2FLSjhEeCt0b1JXbEpO?=
 =?utf-8?B?bStxN2RZSkZBUkdvRktFaC9aOWxLZmoxNG5MbVZWaUxEMnppYjhRdnFhbEFj?=
 =?utf-8?B?akNCQ1hmT0NTYlY3bnRhOThkRC9PQzloQ1BOWGhWZk5GakF5Z09sRUVVWW1P?=
 =?utf-8?B?UDF2ZUVQSG84NkpTV1grRTVuZEhUYkhXU0dtSmlvQyttZWthb2JEdHBXV2Nw?=
 =?utf-8?B?bllSZXNwTDJnc0RCTmVFR2xsRHpnNTV6dU1GbDFkeDJDNmFkbm5pVTltcXFD?=
 =?utf-8?B?cmh1WGtUbXh5NUljOUxIbUlDbHpWRE92M0xhMENWcnFJbDVOY0RkVHk0ckc3?=
 =?utf-8?B?YzQzOHZ5ZDhWbGJLL0FhWEpvSC9rSTkwb1hjQW85QTByazlRWlB5eU5zNmVX?=
 =?utf-8?B?czhzTG9tVjYzc2NIanBnVkRpdGNRc2RZdU9qRlFJZHV3emp6aG5DbFIrcStv?=
 =?utf-8?B?TE04cVJDQm1LSFZvZldzNUU0WHJqZXQ0WUJ6L3RjcmNKeStJVEY3RHdBK2xl?=
 =?utf-8?B?WHllZTdhV3hYNmFDeW5Hcm1yMStUTjdJNkN2bng5VVQ1a1pkS0dERGhYbkhK?=
 =?utf-8?B?VG9JKzA1OGdtR1F3c0FaR1RyWkQ4WmN2WDNhb2M3VWxzSGU3K2F5VUhqV1Ru?=
 =?utf-8?B?d0dGRVdNcTJqYVFuQ0dhT3ZVbTF0VXJLQ0wwTWRLY0x0Q3NaUHBOM09ZWWtX?=
 =?utf-8?Q?8Hliih?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:17:22.3009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ad30cd-f318-4118-0861-08dd7b88fba2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7828

On Wed Apr 9, 2025 at 11:39 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Introduce the ability to assign capabilities to a domain via its definit=
ion in
>> device tree. The first capability enabled to select is the control domai=
n
>> capability. The capability property is a bitfield in both the device tre=
e and
>> `struct boot_domain`.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Reviewed-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> ---
>> xen/arch/x86/domain-builder/core.c | 1 +
>> xen/arch/x86/domain-builder/fdt.c | 12 ++++++++++++
>> xen/arch/x86/include/asm/boot-domain.h | 4 ++++
>> xen/arch/x86/setup.c | 6 +++++-
>> 4 files changed, 22 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bu=
ilder/core.c
>> index 510a74a675..6ab4e6fe53 100644
>> --- a/xen/arch/x86/domain-builder/core.c
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -96,6 +96,7 @@ void __init builder_init(struct boot_info *bi)
>> i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> bi->mods[i].type =3D BOOTMOD_KERNEL;
>>=20
>> bi->domains[0].kernel =3D &bi->mods[i];
>>=20
>> + bi->domains[0].capabilities |=3D BUILD_CAPS_CONTROL;
>>=20
>> bi->nr_domains =3D 1;
>>=20
>> }
>> }
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index 5fcb767bdd..dbfbcffb0a 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -257,6 +257,18 @@ static int __init process_domain_node(
>> bd->max_vcpus =3D val;
>>=20
>> printk(" max vcpus: %d\n", bd->max_vcpus);
>>=20
>> }
>> + else if ( strncmp(prop_name, "capabilities", name_len) =3D=3D 0 )
>> + {
>> + if ( fdt_prop_as_u32(prop, &bd->capabilities) !=3D 0 )
>>=20
>> + {
>> + printk(" failed processing domain id for domain %s\n", name);
>
> Suggest adding XENLOG_ERR to the error message.

Yes, and the message itself seems bogus. The dangers of copy-paste...

Will fix both.

>
>> + return -EINVAL;
>> + }
>> + printk(" caps: ");
>> + if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>=20
>> + printk("c");
>
> Perhaps wrap string generation into a separate function?
>
> That will help if the number of capabilities will grow over time
> and if there will be a need to use string representation somewhere else
> in the code.
>
> Thoughts?

If/when such other code appears I'm happy to unify them, but until then
I'd rather reduce indirection if possible and keep it inlined.

Cheers,
Alejandro

