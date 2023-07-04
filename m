Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539D7473B5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558383.872426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgiY-0006KJ-2B; Tue, 04 Jul 2023 14:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558383.872426; Tue, 04 Jul 2023 14:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgiX-0006Hb-VC; Tue, 04 Jul 2023 14:09:21 +0000
Received: by outflank-mailman (input) for mailman id 558383;
 Tue, 04 Jul 2023 14:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGgiW-0006HV-Fr
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:09:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d62fe3a-1a74-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:09:18 +0200 (CEST)
Received: from DB7PR03CA0086.eurprd03.prod.outlook.com (2603:10a6:10:72::27)
 by PAXPR08MB6541.eurprd08.prod.outlook.com (2603:10a6:102:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:09:15 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::17) by DB7PR03CA0086.outlook.office365.com
 (2603:10a6:10:72::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 14:09:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:09:15 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Tue, 04 Jul 2023 14:09:15 +0000
Received: from 441c65287bbb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94BABC68-05E5-4F02-AD7E-E6870F9783E5.1; 
 Tue, 04 Jul 2023 14:09:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 441c65287bbb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:09:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:09:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:09:06 +0000
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
X-Inumbo-ID: 5d62fe3a-1a74-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EogklM6MvVYcQsFwT0exf4GD0ezono7El60mI0r+JDE=;
 b=CVo3SoaHAnHVwho4wobM24lursZHaYC+k/9lzCbg9UZBwCnQnsCxDjK1WVjzOJlhxSshxSPamk3Z/MWBNnE0Gf7etBwU0upMFgTz+/T6yX7vJahb91oVHn8OYhD8bmxndgDSYrJxIfUQqiS22LFSelcw9q8pG3mbyDv9dnIn3bE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 887afb4d922a0d88
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T12WbI7oLNSnLx176fcj1mfQyoGBFMgxKus+GNwhyarZ7TYm/6Qc+WOEDwQeTXri9W173dpMvHT98l1GudmDg6JhHXak2Cdfd/rM9xvS62D//MLJZ5Z0HW5CEk7F3gqmAYWJ5j6Vh9w87nWlYCvl4HPjxuxHFu+7x/COK9bvbRWyAnxVzTjKH4Cg1ocBErrkqXL1xJFxqq4UNWP9CqHy+vP3rxO9IQpHimhbc5TAOFG5/4g9VXxLmTULexQ43qBaeldGbIgLeBaQbF2aEVc9dEORr6qnnUgZLk19hfk+pEBXdu8pQTpZVQIG+dJ8PMmasoLPTx9TgqD5ZfpvT+mbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EogklM6MvVYcQsFwT0exf4GD0ezono7El60mI0r+JDE=;
 b=MJ+eNXG0BfuR3zGgPcq2z1Y9BfrzT6fWT3Q11HMo5udYRGAi0sCBfXPlW1+TFvNu30bg/YHSarv2PMwlt0ypdfsC1H56kpQlWr9x1FZoHTFJQd+knIq4rTiOoLJfmS6OPggbT6y+CsVCxzqcBt9TIU60gmY+1pkkhqKtOyXM0UQgN0SityBYn0DI5YeN7bz5yDaVMbGD90U3UKQM0aqTTTueF3pa5eWaPPHzpqMvD/mr0OeFJlfy6/NE3tN1N+L6C//yjPTiA8SvrARN0jSa9fkHp+ach+teJS4aydPFrtV9Lgd0mVipmDNxG8ABtjosIaUGZgCGPVgkwDsveR+s8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EogklM6MvVYcQsFwT0exf4GD0ezono7El60mI0r+JDE=;
 b=CVo3SoaHAnHVwho4wobM24lursZHaYC+k/9lzCbg9UZBwCnQnsCxDjK1WVjzOJlhxSshxSPamk3Z/MWBNnE0Gf7etBwU0upMFgTz+/T6yX7vJahb91oVHn8OYhD8bmxndgDSYrJxIfUQqiS22LFSelcw9q8pG3mbyDv9dnIn3bE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
Thread-Topic: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
Thread-Index: AQHZqsX4yAVem92w702jqx8j/I6WWK+prJaA
Date: Tue, 4 Jul 2023 14:09:06 +0000
Message-ID: <DDEAF460-9AEF-4321-876E-A63A0A78F255@arm.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-2-julien@xen.org>
In-Reply-To: <20230629201129.12934-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10055:EE_|DBAEUR03FT014:EE_|PAXPR08MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ac2673-8720-43e6-572f-08db7c983ff4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XhK7c/2GakBFAns5fb7LagEOvZE+EAGuUqkbc3pCbUAWbdMEIV1WdhbKN0wGitoqAyjiTC/F5klQzUTfPUJa4I6LNwnSYhg/F+bydka+TvAO0jf+F9YUXOQj4Q6hQFrA6/NqzIcZEMThrGQKgQS5YaeERszTUSJSgFVIRBs8C3iVLJD4wORe69u+mj/nFYXiiATIAH01Ql+4i/anDs78/dY4xQ0+YgRvfxf7Jlv1YgsodomsJa0gYA7wj+p14+dT8zeIz6TFE9BUkUYBfngvUo8Z8jeMF2eJ8rW4Zx4ImuWyjAawJpjdsBxsJDaCdS3QcoHPsijxx9TAkhR061k7YKafSjFJhR76sFNYWyvQTlr+534Zz7lNgCYAC3HU2y7Y1XoCkfYyyvC2A3W8w8Ia/eirFf1Vsqn1SSBTZ6TWjq2aU4YFbvlCej2zg7dmk1zQ7Swynu+0tfD2OhTSSt2zVGNVNtUniB5oQ3TtvzE4IhJAuFRPUyey0D706xP9Xhf4/CJO/F45ryUZVd3evxMwJ7ic79QjUZsPVyB+oRy/ddMIwVjGdqPHIRqo7t+1I6RzCN6uomts2z/tbDyBs6v7URqEq6D7jIe0lAAX41SXTKv6mGYrrcelAdkWNKyp0mV+c+HvMvKs10DoaoDXpNrCBQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(38100700002)(71200400001)(33656002)(2906002)(6486002)(8936002)(38070700005)(8676002)(54906003)(36756003)(41300700001)(5660300002)(478600001)(76116006)(6916009)(66946007)(66556008)(66476007)(64756008)(53546011)(91956017)(66446008)(6512007)(186003)(6506007)(86362001)(4326008)(316002)(2616005)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F6D1ADFA272554C9156A2EE915821AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc52b7bf-81d5-46b6-b984-08db7c983a7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1bTwQCYWdD2iIFL37zCpbHFn0r/Pj1HGv98PgwX2TV09S/AtwgQi+MVTg0Bbp9JfZLp9/R13KVLv997IfQ8Jx2/zQZIl4Fb+5q1yMIOV3nEhzm7KyCtJqIvfI3hsNHDQTV8xd6b0ieDJA9astB04cusRPcrqxPbl0NDUNAjvV6dN7P/BD/ppTKZ+4vJcSm/l5ou010Owh2kLk/KOFIzmvgpfS9soHhZrpTz4IbdtnYbaW2i5zfooIY5svFOGkw3EaaRN6QeWxBx1n2CpkL/X1NtRDmLewlQy5ibNXUIuF8pubWt6GiIxb2bz2c0zERTLaAxebC2dd9oQOd8RSyN83PMU0k77Ov4x3TU2AxTmrzaRr44Kf7HWCnx0Jr5IO4NrEWOeDKKDUzm04vSH1NfldLu6JCoB9T1Eb9wGAjRVQXM8swpPmz6IWJn6vXxXaSape2lRL/4D+kcbQ3ZhXkQVsKw7/EAJ9Gho83P54/zXQN+QF4yus0VF7kFKAqsnSPJhQT8QS2iupT8Wl4GEdWitPlnEqxHNCO87e6CzRBQPk70WZLeEmz7KgJdBja4HI0qKV9P5PaNdFN1PoTxDshZvoDuK/hZXmNIvVW6S6dg33XIkFrcqrF4YeCuJ4iDYuSxABocDoiFkJclgnIkBgIduQFTzC7mBYp5tU7uaJ7zUr03t0QIlwMy8oQ38gH0zN3Okkelb75ENj22NiZBfAzbz4qktoxFTlNpwsSnfJADW4ryEUMJ6AewjrNXHWFGMU69r
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(107886003)(26005)(478600001)(6506007)(82740400003)(6512007)(86362001)(2616005)(186003)(53546011)(81166007)(54906003)(4326008)(70586007)(36860700001)(83380400001)(356005)(336012)(6486002)(316002)(70206006)(47076005)(8676002)(8936002)(6862004)(40460700003)(41300700001)(2906002)(40480700001)(5660300002)(33656002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:09:15.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ac2673-8720-43e6-572f-08db7c983ff4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6541

Hi Julien,

> On 29 Jun 2023, at 22:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>    * We would need to use break-before-make if the extra PTE needs to
>      be updated to point to another region
>    * The extra area mapped may be mapped again by Xen with different
>      memory attribute. This would result to attribute mismatch.
>=20
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.
>=20
> Lastly, take the opportunity to confirm that _start is equal to
> XEN_VIRT_START as the assembly is using both interchangeably.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
>    Changes in v2:
>        - Fix typo and coding style
>        - Check _start =3D=3D XEN_VIRT_START
> ---
> xen/arch/arm/arm64/head.S | 15 ++++++++++++++-
> xen/arch/arm/xen.lds.S    |  9 +++++++++
> 2 files changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index c0e03755bb10..5e9562a22240 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -572,6 +572,19 @@ create_page_tables:
>         create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
>         create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
>=20
> +        /*
> +         * Find the size of Xen in pages and multiply by the size of a
> +         * PTE. This will then be compared in the mapping loop below.
> +         *
> +         * Note the multiplication is just to avoid using an extra
> +         * register/instruction per iteration.
> +         */
> +        ldr   x0, =3D_start            /* x0 :=3D vaddr(_start) */
> +        ldr   x1, =3D_end              /* x1 :=3D vaddr(_end) */
> +        sub   x0, x1, x0             /* x0 :=3D effective size of Xen */
> +        lsr   x0, x0, #PAGE_SHIFT    /* x0 :=3D Number of pages for Xen =
*/
> +        lsl   x0, x0, #3             /* x0 :=3D Number of pages * PTE si=
ze */
> +
>         /* Map Xen */
>         adr_l x4, boot_third
>=20
> @@ -585,7 +598,7 @@ create_page_tables:
> 1:      str   x2, [x4, x1]           /* Map vaddr(start) */
>         add   x2, x2, #PAGE_SIZE     /* Next page */
>         add   x1, x1, #8             /* Next slot */
> -        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
> +        cmp   x1, x0                 /* Loop until we map all of Xen */
>         b.lt  1b
>=20
>         /*
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index d36b67708ab1..a3c90ca82316 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -212,6 +212,7 @@ SECTIONS
>        . =3D ALIGN(POINTER_ALIGN);
>        __bss_end =3D .;
>   } :text
> +  . =3D ALIGN(PAGE_SIZE);
>   _end =3D . ;
>=20
>   /* Section for the device tree blob (if any). */
> @@ -226,6 +227,12 @@ SECTIONS
>   ELF_DETAILS_SECTIONS
> }
>=20
> +/*
> + * The assembly code use _start and XEN_VIRT_START interchangeably to
> + * match the context.
> + */
> +ASSERT(_start =3D=3D XEN_VIRT_START, "_start !=3D XEN_VIRT_START")
> +
> /*
>  * We require that Xen is loaded at a page boundary, so this ensures that=
 any
>  * code running on the identity map cannot cross a section boundary.
> @@ -241,4 +248,6 @@ ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin=
 is misaligned")
> ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
> ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misal=
igned")
> ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misalig=
ned")
> +/* To simplify the logic in head.S, we want to _end to be page aligned *=
/
> +ASSERT(IS_ALIGNED(_end,             PAGE_SIZE), "_end is not page aligne=
d")
> ASSERT((_end - _start) <=3D XEN_VIRT_SIZE, "Xen is too big")
> --=20
> 2.40.1
>=20
>=20


