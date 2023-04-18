Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71316E6671
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522917.812576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polpq-0007rI-9x; Tue, 18 Apr 2023 13:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522917.812576; Tue, 18 Apr 2023 13:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polpq-0007oM-6L; Tue, 18 Apr 2023 13:57:30 +0000
Received: by outflank-mailman (input) for mailman id 522917;
 Tue, 18 Apr 2023 13:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1polpo-0007oG-EH
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:57:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f315fdef-ddf0-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 15:57:26 +0200 (CEST)
Received: from DB7PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:36::28)
 by DB5PR08MB10311.eurprd08.prod.outlook.com (2603:10a6:10:4a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:57:17 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::b7) by DB7PR05CA0015.outlook.office365.com
 (2603:10a6:10:36::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 13:57:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 13:57:17 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Tue, 18 Apr 2023 13:57:17 +0000
Received: from bd2105df09d4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D46468E-156E-4919-9B50-7B1680D333DA.1; 
 Tue, 18 Apr 2023 13:57:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd2105df09d4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:57:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8479.eurprd08.prod.outlook.com (2603:10a6:20b:55d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 13:57:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:57:05 +0000
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
X-Inumbo-ID: f315fdef-ddf0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haJ1iiFJBzgzTdkpwwcZ6vF0qjVcYXmKCk0mqHYCvKg=;
 b=yiMNHMoqMAwQHzG5+By3tRidg+zgclxyMQoatjRTG5Q4TX5s/0GcJmk5VaQlcF/OuFlNbZ77MyDmFkbd9dKFYZl7WYbFD7aZNd+ZFmpbrZws6wwLy7tTTtd7DkniLfmQ2kPlP+bfHgNCkhbsaeNmXGwKmQM6HrS8ovjC4UYVjVU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66a6a5f4fa3e655e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5iBNhp9Z9pD15Yw7KzMhFEZ01q4LT22pgQhx3Xs5TzBbfpwzpW6TD495ztmIFJ6rb/F22S3XudoLrvQiekzyrfQr+mnIj0ewHLod94pYK8cIoToWfAHeAc5ShZpNAfOum4nuu3dRGJHRbwNnyShlipPE5TKECTmS83CU1/aNjZf+AMGKqocELo/v59DBQalmK+2y3ycQ86uC0VT9kZ9URPOMqRhweXFD5+/jay8jVb6A5hu4jWpWfGe1SP0txmYkKwpPC/CV33dQoysAS3QFlntHCQAHTuP0NGAltV1dVwpNtyZIVM6RM/Q88HR0T/PZQ9w/5eyznn5mFHwDIXJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haJ1iiFJBzgzTdkpwwcZ6vF0qjVcYXmKCk0mqHYCvKg=;
 b=i8iYyRyjOal+QDeZ0AM3paclkP9Z9GV6acETOKoxwQvED7PNwlrV7U0A+wxsfISj5Q2XadxtgrFRXG/MlYoMX1S18TqL6EVJT+u3g41oUlbzztleR/mxtJoxd6AZekHl1xmGcH7Zt9AMPYWgCm5OCz7TDi7fbAvqPUbyxXMhHRoykPUFyLPhMEwtuIxp5G5F7qj7bVLVtR5CiISuY5fL+h2c/PvM/2xyHV1P4OU4UYXJ0qGs/8JL383Zvt06Jjjdf2ir2sS/90674BwJYhDtpQsArjLZPZILKMzx8UcVlCKDQM9k0Hc5Cl/sY2v9OZH9QGXWCljkzMWRyKes3+zG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haJ1iiFJBzgzTdkpwwcZ6vF0qjVcYXmKCk0mqHYCvKg=;
 b=yiMNHMoqMAwQHzG5+By3tRidg+zgclxyMQoatjRTG5Q4TX5s/0GcJmk5VaQlcF/OuFlNbZ77MyDmFkbd9dKFYZl7WYbFD7aZNd+ZFmpbrZws6wwLy7tTTtd7DkniLfmQ2kPlP+bfHgNCkhbsaeNmXGwKmQM6HrS8ovjC4UYVjVU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZcHBPCfFzIjsHxUmcm0cDknsveK8xGmMA
Date: Tue, 18 Apr 2023 13:57:05 +0000
Message-ID: <28908BA4-19B2-4B77-BF28-9F3F890474B6@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-4-julien@xen.org>
In-Reply-To: <20230416143211.72227-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB8479:EE_|DBAEUR03FT005:EE_|DB5PR08MB10311:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f72a8de-04ac-4124-54b2-08db4014d22d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 96upzNYzTitqOr6x5xctWOVYQdr5CT3bkBZdDTi7Pq6YW1aoSYOTucOZs9NgRh54aQxSqCH1yrAMnWiDqXaDlzDaWpV32ByXSVWGr1yN2/TfaIKCZoDpX8/uuXGr5cl3lnBU/UuC0S/IUgudtIiuGtNBB7kRszR8OooQmni/vjENZTi+QUfA5aj0XARiAB6pScsIU215dkGw6N6PJSEnerH21NvsHz7wEN69MiLR5eTnTk0Rilj3L8h6tVUSdjaa9kCXHtm6uhiIe7ab7GGkECHG3fRyT9vzLSOzVXf/L9Mo17yjq9uwX9CNzkGyEPkaQtXnIz+ZvDAifkFMwMuyTKGrniTwA1pqMPy7XxI26P8xTAAlpFkv1zEufSiYdzIj9Gna4ZpGjmTsm1zjz6K8xXoXPtIUSvxMONuHJaegowud9MLRq9bhKq951SUxML4F60f9z5oH4CxfKqZglGBUV1IfJI6CRGY/IvnHth2LlesrO6qDA1NR/82hAjaShWZdJ59VCCJY6WJlpFJVvsFLSail0LLSX9QBgVsvqdDzW8ETH416e/pUHw5zmSQ4QogN2KkCJF6reBVQ1HoFsdz3mnl4ycTBW4/ND8tznzCorrqxa5AIHvyRUgiqbCQcJjF+KjcUFWU/R7iiceFO8sOrHA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(66946007)(38070700005)(91956017)(66476007)(53546011)(76116006)(4326008)(64756008)(66446008)(66556008)(6506007)(6512007)(36756003)(71200400001)(2906002)(83380400001)(2616005)(6486002)(6916009)(186003)(86362001)(54906003)(5660300002)(8936002)(8676002)(38100700002)(122000001)(33656002)(478600001)(41300700001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CABC70C4202CAB4DB7022A00E89C0095@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8479
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25b54d94-7f07-45a8-d483-08db4014cb1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DCWKt+QgBTyqoqpEiUDjuEECaVi/D+sgQX4FgObCAAqwlHKhAiZelUubIr1X93jW3Vxs5Um4BusfkvZuRgnpbGcmVzSnvhc/4alQS/4H0pJNPTG1DRTKbYdFHhnBSRVoZiTWOiNMBa9BB5Rpom+FuGSyrw3Q3usVC2IRIltKFVwHtGrf+MuMY77ClhsjnYrBzVA4KNph4+2q+sjiUgaOP+8uqVHHmmSG2r4Wth8Yig1bQFKPXlgS5NlCqgZdragkWRxuqpEASFsSDT3q7oqsDfKyOYJSvBVOBd8Sgj/Uc9ohLW4oBcd5XS4REyo2gaex6AEbmd0Xrd/B5koJ257TzBIsfTwPlBmJRbYidXJObMwP51a6OlCJ8I7xG41NTK0QxApt/fFQ0QBOkLCZYI6BzS19dExqvYJ2SmQu77nEGBMe6sFtJG50dxi3mNNppwbtRjk1pLso0bNlD1XDytZEyoatW5kjITSDGzpP6BLZHaCHwSljsRBjNmJYW6AN6fSlGfy8t21hQu2mv5UDJfVlAK5NQnpvaOElBCA3909Q2yZ4yoQbacd9Grv5e3Y5+GgjDxKeIt970NWYPgY0wj7n9vE1HTfwC+Ha2qutlM0iPkQNyR4CNimiDAcpA7b+NqJJkYEU+Q8++P2gk5BqNN8YofKh1gjb1O6nSdBLW/xmcTgHQW4iW/0cXLgxbmI8FCcx8KZvyvnHJ0GWXPN9oEwVfQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39850400004)(451199021)(46966006)(40470700004)(36840700001)(86362001)(33656002)(36756003)(316002)(70586007)(70206006)(8676002)(4326008)(54906003)(6486002)(41300700001)(478600001)(40480700001)(82310400005)(6862004)(5660300002)(8936002)(2906002)(36860700001)(356005)(82740400003)(81166007)(186003)(53546011)(107886003)(6512007)(6506007)(26005)(2616005)(336012)(47076005)(83380400001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:57:17.2610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f72a8de-04ac-4124-54b2-08db4014d22d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10311

Hi Julien,

> On 16 Apr 2023, at 16:32, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new external helpers are introduced:
>    - arch_setup_page_tables() will setup the page-tables so it is
>      easy to create the mapping afterwards.
>    - update_identity_mapping() will create/remove the identity mapping
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


>=20
> ----
>    Changes in v7:
>        - The definition of IDENTITY_MAPPING_AREA_NR_L0 was moved
>          in the previous patch.
>=20
>    Changes in v6:
>        - Correctly check the placement of the identity mapping (take
>          2).
>        - Fix typoes
>=20
>    Changes in v5:
>        - The reserved area for the identity mapping is 2TB (so 4 slots)
>          rather than 512GB.
>=20
>    Changes in v4:
>        - Fix typo in a comment
>        - Clarify which page-tables are updated
>=20
>    Changes in v2:
>        - Remove the arm32 part
>        - Use a different logic for the boot page tables and runtime
>          one because Xen may be running in a different place.
> ---
> xen/arch/arm/arm64/Makefile         |   1 +
> xen/arch/arm/arm64/mm.c             | 130 ++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/arm32/mm.h |   4 +
> xen/arch/arm/include/asm/arm64/mm.h |  13 +++
> xen/arch/arm/include/asm/setup.h    |  11 +++
> xen/arch/arm/mm.c                   |   6 +-
> 6 files changed, 163 insertions(+), 2 deletions(-)
> create mode 100644 xen/arch/arm/arm64/mm.c
>=20
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 6d507da0d44d..28481393e98f 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -10,6 +10,7 @@ obj-y +=3D entry.o
> obj-y +=3D head.o
> obj-y +=3D insn.o
> obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> +obj-y +=3D mm.o
> obj-y +=3D smc.o
> obj-y +=3D smpboot.o
> obj-y +=3D traps.o
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> new file mode 100644
> index 000000000000..56b9e9b8d3ef
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mm.c
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +
> +#include <asm/setup.h>
> +
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
> +static DEFINE_PAGE_TABLE(xen_first_id);
> +static DEFINE_PAGE_TABLE(xen_second_id);
> +static DEFINE_PAGE_TABLE(xen_third_id);
> +
> +/*
> + * The identity mapping may start at physical address 0. So we don't wan=
t
> + * to keep it mapped longer than necessary.
> + *
> + * When this is called, we are still using the boot_pgtable.
> + *
> + * We need to prepare the identity mapping for both the boot page tables
> + * and runtime page tables.
> + *
> + * The logic to create the entry is slightly different because Xen may
> + * be running at a different location at runtime.
> + */
> +static void __init prepare_boot_identity_mapping(void)
> +{
> +    paddr_t id_addr =3D virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    /*
> +     * We will be re-using the boot ID tables. They may not have been
> +     * zeroed but they should be unlinked. So it is fine to use
> +     * clear_page().
> +     */
> +    clear_page(boot_first_id);
> +    clear_page(boot_second_id);
> +    clear_page(boot_third_id);
> +
> +    if ( id_offsets[0] >=3D IDENTITY_MAPPING_AREA_NR_L0 )
> +        panic("Cannot handle ID mapping above 2TB\n");
> +
> +    /* Link first ID table */
> +    pte =3D mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&boot_pgtable[id_offsets[0]], pte);
> +
> +    /* Link second ID table */
> +    pte =3D mfn_to_xen_entry(virt_to_mfn(boot_second_id), MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&boot_first_id[id_offsets[1]], pte);
> +
> +    /* Link third ID table */
> +    pte =3D mfn_to_xen_entry(virt_to_mfn(boot_third_id), MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&boot_second_id[id_offsets[2]], pte);
> +
> +    /* The mapping in the third table will be created at a later stage *=
/
> +}
> +
> +static void __init prepare_runtime_identity_mapping(void)
> +{
> +    paddr_t id_addr =3D virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    if ( id_offsets[0] >=3D IDENTITY_MAPPING_AREA_NR_L0 )
> +        panic("Cannot handle ID mapping above 2TB\n");
> +
> +    /* Link first ID table */
> +    pte =3D pte_of_xenaddr((vaddr_t)xen_first_id);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&xen_pgtable[id_offsets[0]], pte);
> +
> +    /* Link second ID table */
> +    pte =3D pte_of_xenaddr((vaddr_t)xen_second_id);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&xen_first_id[id_offsets[1]], pte);
> +
> +    /* Link third ID table */
> +    pte =3D pte_of_xenaddr((vaddr_t)xen_third_id);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&xen_second_id[id_offsets[2]], pte);
> +
> +    /* The mapping in the third table will be created at a later stage *=
/
> +}
> +
> +void __init arch_setup_page_tables(void)
> +{
> +    prepare_boot_identity_mapping();
> +    prepare_runtime_identity_mapping();
> +}
> +
> +void update_identity_mapping(bool enable)
> +{
> +    paddr_t id_addr =3D virt_to_maddr(_start);
> +    int rc;
> +
> +    if ( enable )
> +        rc =3D map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
> +                              PAGE_HYPERVISOR_RX);
> +    else
> +        rc =3D destroy_xen_mappings(id_addr, id_addr + PAGE_SIZE);
> +
> +    BUG_ON(rc);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/a=
sm/arm32/mm.h
> index 8bfc906e7178..856f2dbec4ad 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -18,6 +18,10 @@ static inline bool arch_mfns_in_directmap(unsigned lon=
g mfn, unsigned long nr)
>=20
> bool init_domheap_mappings(unsigned int cpu);
>=20
> +static inline void arch_setup_page_tables(void)
> +{
> +}
> +
> #endif /* __ARM_ARM32_MM_H__ */
>=20
> /*
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/a=
sm/arm64/mm.h
> index aa2adac63189..e0bd23a6ed0c 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -1,6 +1,8 @@
> #ifndef __ARM_ARM64_MM_H__
> #define __ARM_ARM64_MM_H__
>=20
> +extern DEFINE_PAGE_TABLE(xen_pgtable);
> +
> /*
>  * On ARM64, all the RAM is currently direct mapped in Xen.
>  * Hence return always true.
> @@ -10,6 +12,17 @@ static inline bool arch_mfns_in_directmap(unsigned lon=
g mfn, unsigned long nr)
>     return true;
> }
>=20
> +void arch_setup_page_tables(void);
> +
> +/*
> + * Enable/disable the identity mapping in the live page-tables (i.e.
> + * the one pointed by TTBR_EL2).
> + *
> + * Note that nested call (e.g. enable=3Dtrue, enable=3Dtrue) is not
> + * supported.
> + */
> +void update_identity_mapping(bool enable);
> +
> #endif /* __ARM_ARM64_MM_H__ */
>=20
> /*
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/=
setup.h
> index a926f30a2be4..66b27f2b57c1 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -166,6 +166,17 @@ u32 device_tree_get_u32(const void *fdt, int node,
> int map_range_to_domain(const struct dt_device_node *dev,
>                         u64 addr, u64 len, void *data);
>=20
> +extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
> +
> +#ifdef CONFIG_ARM_64
> +extern DEFINE_BOOT_PAGE_TABLE(boot_first_id);
> +#endif
> +extern DEFINE_BOOT_PAGE_TABLE(boot_second_id);
> +extern DEFINE_BOOT_PAGE_TABLE(boot_third_id);
> +
> +/* Find where Xen will be residing at runtime and return a PT entry */
> +lpae_t pte_of_xenaddr(vaddr_t);
> +
> extern const char __ro_after_init_start[], __ro_after_init_end[];
>=20
> struct init_info
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 1d09d61dd922..b7104d8d33ba 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -93,7 +93,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
>=20
> #ifdef CONFIG_ARM_64
> #define HYP_PT_ROOT_LEVEL 0
> -static DEFINE_PAGE_TABLE(xen_pgtable);
> +DEFINE_PAGE_TABLE(xen_pgtable);
> static DEFINE_PAGE_TABLE(xen_first);
> #define THIS_CPU_PGTABLE xen_pgtable
> #else
> @@ -400,7 +400,7 @@ void flush_page_to_ram(unsigned long mfn, bool sync_i=
cache)
>         invalidate_icache();
> }
>=20
> -static inline lpae_t pte_of_xenaddr(vaddr_t va)
> +lpae_t pte_of_xenaddr(vaddr_t va)
> {
>     paddr_t ma =3D va + phys_offset;
>=20
> @@ -507,6 +507,8 @@ void __init setup_pagetables(unsigned long boot_phys_=
offset)
>=20
>     phys_offset =3D boot_phys_offset;
>=20
> +    arch_setup_page_tables();
> +
> #ifdef CONFIG_ARM_64
>     pte =3D pte_of_xenaddr((uintptr_t)xen_first);
>     pte.pt.table =3D 1;
> --=20
> 2.39.2
>=20


