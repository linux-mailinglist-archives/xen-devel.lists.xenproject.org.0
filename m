Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21565A843EF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 15:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945679.1343833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rXn-0001Rb-38; Thu, 10 Apr 2025 13:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945679.1343833; Thu, 10 Apr 2025 13:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rXm-0001PV-Ve; Thu, 10 Apr 2025 13:02:10 +0000
Received: by outflank-mailman (input) for mailman id 945679;
 Thu, 10 Apr 2025 13:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2rXl-00016o-Rj
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 13:02:09 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2406::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ea8bc6-160c-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 15:02:08 +0200 (CEST)
Received: from MN2PR15CA0047.namprd15.prod.outlook.com (2603:10b6:208:237::16)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 13:02:01 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::f9) by MN2PR15CA0047.outlook.office365.com
 (2603:10b6:208:237::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.24 via Frontend Transport; Thu,
 10 Apr 2025 13:02:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 13:02:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 08:01:57 -0500
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
X-Inumbo-ID: 00ea8bc6-160c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttb1e2N6CtlB9XawppFJqpqUe+BUjXYUCapB6c0bEmDZ4WTdg5lLQgEXMOJLBJkzVz8dQOiz4kbG0lKPin0r/6mSdnlCQeoOdoQNlVvfJqOOtHWsImGG2I2yONAFzkQ3iCZgi1LRzlUnygRdbXhSAPdjq3vLcerF9ZgBitCJa1ELnXLEeLMtagJpg4tbP/rxTkB/dcUYB0GV/CnXuNPidnlBWyo1w5QpdeUgRzbxMA+qQxSoTeyjYCPKB4KkWMGHdAjkB4QsK/PDwq6ogH6UoLY2ZSK7jHiJfEH+RjGHOZeVDp0dHoDf8Ssiylnk7p1v5Gybds+95PfBAyYlkMuZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkL8bTZqRSzEGJBealhttelx2wo1+uKrhCu0Gd44Rz8=;
 b=rbDkce9a6PYLqtQKIUgazBm6bIYbQu+vavb2FoCE7TU5b4fRaHOC5jD4Bkux65K1FIbvCkrLkKHd1Cl6ZauNMqE2wnl7suy8p5tPHrr/TaJc5ASYBKveFeCGZN3Yu2mvwwW0IAk8XLCzVj+t1dxtX420L8rofAOrjfmkuA078EemR0+pwHAPT4B7J8zzfWi+1txwFR9iVdV1ChHGiSvUfd4A57tVpFJclcbJVmQzm2bKBJx3LwHgB5wEsVhv/GVBXz0Ij31Fd3L/bJh1BPXbknYlEPJKLOOsIkb1jXQ3MiCoyVHa2woGNQ6BZW2Srfh49+BJLP5tfgU0xPvL18nbvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkL8bTZqRSzEGJBealhttelx2wo1+uKrhCu0Gd44Rz8=;
 b=QyMwTWC+GHWKwx7pycfLthKCWyi3/kb3l5zrZ2Z11f091fG7+50DmdWZZjcDAsl0ARb0BFgIerbfqWhDM2p5+5BvL4XejeN8sKR9iuoujRcbumQ6eTnKhvqOv32QPEnQyQxgY6ZYoTG3ik3FmLGRbETbub4iLvlJ9KlMyF9AuSA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 14:01:51 +0100
Message-ID: <D92Z8N1RKSXP.U9UMCBJ6LZ9D@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 06/16] x86/hyperlaunch: introduce the domain builder
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-7-agarciav@amd.com>
 <FxuO_b3q9bY4mPUG3KmuO_YTqqsPhI1sMXykQ5UkxaLzhMlAoAZtQKzl9puHPW29hxCx_Fm1y_YfmBquI1Cm0QA0Y3TKYTy4waHKKaODj9c=@proton.me>
In-Reply-To: <FxuO_b3q9bY4mPUG3KmuO_YTqqsPhI1sMXykQ5UkxaLzhMlAoAZtQKzl9puHPW29hxCx_Fm1y_YfmBquI1Cm0QA0Y3TKYTy4waHKKaODj9c=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ae784e-1f9d-4b59-8ceb-08dd782fe271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlBNZjlGdG0wK1F2UmlzaVFZUldRb0U0NzA3UUpIZzV1Rk1pN2ZWNFVxOVNI?=
 =?utf-8?B?cGlCd0JpUDFyM2t0Q25sR1BSYXhuRHJ1VTlxZnI5V0daT0Z3NmpRU0YvUTFo?=
 =?utf-8?B?dUp1NVJCOWsvN1A5MUJwU3hmeUdFOS9IOFB6c2Z3ZnZER0xqQy9tTEFxOXNB?=
 =?utf-8?B?N1ZjeGdXOW9Pd3J2RXpoYnVmUjk4QWJYeXRLZnlBRHNWV1dGQTZwQVp3ODhQ?=
 =?utf-8?B?M0NKd0xmbFJpdkNaZ2FDbHMzU2NLWEQ4clEyVk1yajEyM1c3UDdaY1lZTy9n?=
 =?utf-8?B?NXcyVk9Ranl4SGFRdURPQURHK3pXNFB3RWxCd29iSk5rNjRRcHVQTjNQcGJr?=
 =?utf-8?B?dzM4cThjazI5UlZnQmhsT25Qd0xhVTJoVmpqNG9HUndVam5Xb0Nud1hUMW9X?=
 =?utf-8?B?eWM0MFhqQjYzS0EyQVVQa3JrYXRaM0tUQXBOYkNZWWxCZW9EVjdsRC9nU015?=
 =?utf-8?B?RzhhSnZvTVZWd0hhT2VBcVhwZWxiYy80TVBIZDR4ZndQMmlOdXd4S1ZNZ0xY?=
 =?utf-8?B?U3pJaW53NzlIUXg2c1RndUNCZ3QzSWRweE5Tci95ejRXSVZIMktiSEVQMVNo?=
 =?utf-8?B?RFpQT3FkY0xBTUFvZmJmOHZSbVNENWhvUTN1VnFjeE0ybzZueXRPbXUyYy9s?=
 =?utf-8?B?cFNmamFkb3B0ZWFrdk1OMllSRGw0UVNsQThoZ2t1YVN5WEpzeVZhV1JuMmFG?=
 =?utf-8?B?SVpoTnJ0eXRFZ0xMMDBRbU9mTTlDUXJYSi91SWNLUjRHa3ZuZG0zeTQvNmt0?=
 =?utf-8?B?TzVla3BzRURvSElKbmRFT25kOUs2akhUUDZsck5VTGQyaExkU29ucUlNNUUx?=
 =?utf-8?B?a21pamRZd0xUZTl3TFU2WGRpNjRGT0N3MDVYbnhEOXd6VVZWL1VLbmVOT29V?=
 =?utf-8?B?M3ZoUlU1V2dCUmhvNkNtenN5amtzSUhIZUt4UWxFMGROcHB3Yk9sT2plT3NW?=
 =?utf-8?B?TEZ2ckQrd3NGT2dkVHFPRHRObGlEWjUvMzhPUDBEek9qVURjTG84eEUveE9G?=
 =?utf-8?B?UFhxRWhsdkNJWUdZUmN3ZDVDRkNHemVnakhVaWZ3RjA5RE5xMC95cWlnU0ha?=
 =?utf-8?B?bFJFK0F0S0xqNXNobERveTB4SDJ0QW9hUnBzcWpLU2ovWllyUE1rU0pWaUFE?=
 =?utf-8?B?U1hhQzU0WUt4UkxDS29odVVjSFRVejZBUVM0eGgzdHRyZWlxT2JZM24xL0hJ?=
 =?utf-8?B?VXVXd1ZFU0I0WlhIODhMRWswWTdCc0Jrak1LWnpHUXB5V2x3dUQzVDlENkM1?=
 =?utf-8?B?YmFQQjRRKytDZENHSFkwNEl1bGJVWHIxelNHcklpZWxTWUNvRXJ5dG45cHhQ?=
 =?utf-8?B?L0pHc1Y4ZjJwQlRQWUlhR2hjWStkdEtiRkZRTjRaRjJuMWdhMzJkcVFWMzgr?=
 =?utf-8?B?SWxXVTBxemdzY2ZKMGIrL3VZZkh3TDFLS29nRGJJbC9RM2Z0KytYbHQ5WDdF?=
 =?utf-8?B?cTB0czNEQ3ErUjJ3V1BWcVBzTy9GK2hDd0xQNitwRjJBcHFRdTdOWkJRYWFQ?=
 =?utf-8?B?SnJWWWdmbkpiWU14WW1YZUh0b0ltMnl5OGNSdnJhU0p3a1QwT2gyVDFzU1F4?=
 =?utf-8?B?aXpGYnUzM09mV1N3YjdtQVZxNDZxWFB3b2VCY2Z6RUl4cnVDYzRXVEY2N1Ri?=
 =?utf-8?B?RGFWSmNSQUF6cFBwM3lNYjUxOVpROVNRNHV5N0wyVFZ5ektyOHdXNDMwOUlD?=
 =?utf-8?B?clRsTWFlZEMvMmxibjQ0bGcrV01NL2QrWG02QTZWNHZZa1pGWVRYemxlOUlR?=
 =?utf-8?B?ejZPRVZYWHZ3cFgzajdqTVlqZStjSXpjWHlHeEVUUVFkbEVHSVdJVUhGd05x?=
 =?utf-8?B?SFFmYXFkOW1yNGZwRXBuajNnSkVhVWU2Z3M2cXptY1RkK0x3VXFlRlM2QmYz?=
 =?utf-8?B?UnZPcTBkY3gvUzl2UGZZYjM4SUpGZjRNNVpOcTU0TVU3b2RlV3RyR3hNN0xl?=
 =?utf-8?B?amp0KzZLNnpNWXFrQm9neHloZExSUnVZanFvdWZHemx3Q0dKQjZRdG5LWE0w?=
 =?utf-8?Q?8bytxwZ5Jvg5W1o+ElIHEoh1rJOnik=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:02:01.3741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ae784e-1f9d-4b59-8ceb-08dd782fe271
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

On Wed Apr 9, 2025 at 7:53 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Introduce the domain builder which is capable of consuming a device tree=
 as the
>> first boot module. If it finds a device tree as the first boot module, i=
t will
>> set its type to BOOTMOD_FDT. This change only detects the boot module an=
d
>> continues to boot with slight change to the boot convention that the dom=
0
>> kernel is no longer first boot module but is the second.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> ---
>> v3:
>> * Move obj-y +=3D domain-builder/
>> * Remove blank line in Makefile
>> * const in has_hyperlaunch_fdt()
>> * CONFIG_LIBFDT rename
>> * Use boot_info forward declaration
>> * Rename domainbuilder.h to domain-builder.h
>> * Add fdt NULL check
>> ---
>> xen/arch/x86/Makefile | 1 +
>> xen/arch/x86/domain-builder/Kconfig | 2 +-
>> xen/arch/x86/domain-builder/Makefile | 2 +
>> xen/arch/x86/domain-builder/core.c | 57 +++++++++++++++++++++++
>> xen/arch/x86/domain-builder/fdt.c | 37 +++++++++++++++
>> xen/arch/x86/domain-builder/fdt.h | 21 +++++++++
>
> I have a general question.
>
> Wouldn't that make sense to use arch-independent placeholder for domain b=
uilder
> code right from the starting point?
>
> For example something like xen/common/domain-builder ?
>
> My understanding is that there's a lot of code in the domain builder whic=
h
> can be potentially shared/re-used with non-x86 architectures.
>
> Also, that seems to align with the intention to have common arch-independ=
ent
> subsystems in the code base:
>
>    https://docs.google.com/presentation/d/1q9cjJZLUxUo1YzMpCxVHuL-ZOGoFaO=
9haHfRBK4i4Uc/edit?slide=3Did.g32afc87aef4_0_18#slide=3Did.g32afc87aef4_0_1=
8

  https://lore.kernel.org/xen-devel/D92Z1LECR2VA.3FW5H7ZIRVXU7@amd.com/

In principle, yes. I'll try to move it, but I suspect making it coexist
with dom0less will prove tricky.

>> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bu=
ilder/core.c
>> new file mode 100644
>> index 0000000000..d6ae94f45c
>> --- /dev/null
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only /
>> +/
>> + * Copyright (C) 2024, Apertus Solutions, LLC
>> + */
>> +#include <xen/err.h>
>>=20
>> +#include <xen/init.h>
>>=20
>> +#include <xen/kconfig.h>
>>=20
>> +#include <xen/lib.h>
>>=20
>> +
>> +#include <asm/bootinfo.h>
>>=20
>> +
>> +#include "fdt.h"
>> +
>> +void __init builder_init(struct boot_info *bi)
>> +{
>> + if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>> + {
>> + int ret;
>> +
>> + switch ( ret =3D has_hyperlaunch_fdt(bi) )
>> + {
>> + case 0:
>> + printk("Hyperlaunch device tree detected\n");
>> + bi->hyperlaunch_enabled =3D true;

FYI, your email client seems to be collapsing the indentation of the
quoted patches. Is that intentional?

Cheers,
Alejandro

