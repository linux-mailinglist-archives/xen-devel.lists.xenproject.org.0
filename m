Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6E740E4E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 12:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556405.868911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qES8B-0007z0-JZ; Wed, 28 Jun 2023 10:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556405.868911; Wed, 28 Jun 2023 10:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qES8B-0007vi-GD; Wed, 28 Jun 2023 10:10:35 +0000
Received: by outflank-mailman (input) for mailman id 556405;
 Wed, 28 Jun 2023 10:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2wO=CQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qES8A-0007vc-Hg
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 10:10:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0311a0fd-159c-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 12:10:30 +0200 (CEST)
Received: from AS9PR06CA0676.eurprd06.prod.outlook.com (2603:10a6:20b:49c::25)
 by AM7PR08MB5317.eurprd08.prod.outlook.com (2603:10a6:20b:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 10:10:25 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::29) by AS9PR06CA0676.outlook.office365.com
 (2603:10a6:20b:49c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Wed, 28 Jun 2023 10:10:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.18 via Frontend Transport; Wed, 28 Jun 2023 10:10:25 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Wed, 28 Jun 2023 10:10:24 +0000
Received: from 923b1fa9e7e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 855A7908-601B-410A-B980-01C568B6AD92.1; 
 Wed, 28 Jun 2023 10:10:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 923b1fa9e7e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 10:10:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5856.eurprd08.prod.outlook.com (2603:10a6:800:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 10:10:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 10:10:15 +0000
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
X-Inumbo-ID: 0311a0fd-159c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKR03phD3dRP3Urwh39UQB0Hts893vl94mkAPhjn9X0=;
 b=mX9JYD7NdDuSqnYcxuUUfPAy5UZwYiF3xuakEFVHxPDuE5hFofcrAdxG/LcFrWp47vhHHooEKC/yrz+xBEdP5imHgqZtKJTU1j/UBK9vho7t1cEml96YR5dDrDrXtI+/rLziOrsxeS47HZMtEsDPs+VpF7ZjMdUTkndAbYWE7yk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb7a620feb4ad48a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln/9IsQHYu1kIPvLL0Tx3td2VdcTsUh2s2RUffuaCx0LzRepmdCsKKgrkvbynGzaxElYPvL9/YtZl++woH3MQfzEwrcuQHpHsDJV9EpahKb8waAxURz/Nmim3L0U+9dK1YqAslF99SxZywDkHMG92RvvIN8SoYIA0VTk4d70TDszUXQY4KACbm2SZHJeKI2uDlwMfT6dEmMF2Ii9oL+Akm8KrZCPtjNVoAyFNyuBbYb/I+7qssGlWPV0CaCTkDlNdXzFFqjqnLIWSUDXvL65ooplxyM9SQETVnFBZCqQ37HgyKqEbqzI9xZOhdexQThN21S6BRZVtuqgYSWoIAjR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKR03phD3dRP3Urwh39UQB0Hts893vl94mkAPhjn9X0=;
 b=VULsxpwG6luZnlvm1P7oJ1qSAskTWSI8jjF76hXnsxv5F4U/cnhIcpzEua35wKAd4y6ZFXauaeLG8kSJyYstSK8QREvWviPD+KLMOSwmtKqgS00zhRxUHC4WR6lF0Os2ByIuRy5ljxhTUhYv8Vp3CnHLfudLVElqzFccnBGDBVUMmmhv6RC8OL1OOBM/yydhibSPpNGPB8S11CBZupcRCCMlJdBQBAewUhM2buCovP/LVTr0qAIVqhZLGe/1cufGhjWcSXn/feUl3NT7dM+7mQHbVM+3kVNXG+2wCRlz+PLyjPDiRWdjWt4zlQ7PHIIG5eIKlP88S4wySmZeN37gMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKR03phD3dRP3Urwh39UQB0Hts893vl94mkAPhjn9X0=;
 b=mX9JYD7NdDuSqnYcxuUUfPAy5UZwYiF3xuakEFVHxPDuE5hFofcrAdxG/LcFrWp47vhHHooEKC/yrz+xBEdP5imHgqZtKJTU1j/UBK9vho7t1cEml96YR5dDrDrXtI+/rLziOrsxeS47HZMtEsDPs+VpF7ZjMdUTkndAbYWE7yk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 9/9] xen/arm32: vfp: Add missing U for shifted constant
Thread-Topic: [PATCH 9/9] xen/arm32: vfp: Add missing U for shifted constant
Thread-Index: AQHZp6aOLBykvD4LPk6JYGpa4zjTC6+gAgAA
Date: Wed, 28 Jun 2023 10:09:50 +0000
Message-ID: <5B295B9C-5DC9-4024-A89F-5B41F998F7C4@arm.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-10-julien@xen.org>
In-Reply-To: <20230625204907.57291-10-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5856:EE_|AM7EUR03FT006:EE_|AM7PR08MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ced4e9-445e-4630-72e7-08db77bfe41d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WTcIbeFifLv+9+H56946830khmJINvXuBZ4xG08CD+2ss47Y89HEWOdcZGR25cebpnkpDhn5zMAdfgzZx1EvfL4pBX8Dg4D+8XO0oKA5a3YUlv7wAIISJEg3sSb3VHWmBQXwSLuWNC1PH07GciWUqTdDsil5YLwNFVJP7K/mAFW+/ClhbZzZ1uJtJO2Q4njJBvJlYkr+FT1H4JqrUSq7dCfoIym/j7c8tjciiusD0Qm4qLSr8HXnTFZZs72Pft+1oeRiVYpFX4+5k6deekx6VJOvNm1R21w6sqXF2EaY7BQCJ9y5RAyAp8WMN9RlPu9LP4doMQktTqM3zhbv+m3WPXpbEEkTy6wtG1Evlrk6xbWTnmNL9TZbHTTAeY6jOHralhujL0F5VdOYv4A2dk8XpZTJOxzpRqL9+qi3TU2OlYNYZ4uerVTf4fN3k0gd8DSSmPzi2RfjmG2oVsVUvJQqik4vWQQCs+7zz3M9KPV59DzWuMcofBhjy9NNmDVa7YsjKTWKsEEdk+exQJzsNIkk5fJgU33Vlri/JsxOU5vqrivm8CPJEjPvkgCydFu6sLjDhBsYjXOKgNpCzRdvb/W7uOsRd+JIfvRtIaFilpTNveOuON0qxZAFNVanY8Q90MnbsjhZJFfQshFA3+lOhiGlpA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(64756008)(66946007)(6666004)(66556008)(71200400001)(91956017)(478600001)(54906003)(4326008)(66476007)(76116006)(6916009)(36756003)(86362001)(33656002)(66446008)(186003)(83380400001)(53546011)(2616005)(41300700001)(5660300002)(2906002)(316002)(122000001)(6486002)(6506007)(38070700005)(8676002)(8936002)(38100700002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E4EC20AE70C8648BD52AC67683CDFF3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5856
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef48ed30-0a36-406e-f58b-08db77bfcf9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8RCqcFH+o4ce3pshpqUFbLd8IQQzaiJRfcdP4cVp11g37K3kUJkihhJxphAVLkcs8VnjOx/6zdFiScpQKRy0X8kzGOB5RziDI8UdJHBscOPwkU+jsOzQmZJtY4Vma7UFHB4iCQf6BUk9RMU5wgHX3S3E/IDZlve2HAZZKxeXbNc3mBWqM8U16NsIDXVn/qApLozFjgBQGw9qdyKqFTbQoqjGCesjfIF68+j7GUXuEY/olXEUu9/vfzC5NRHv4dCMGqk7wds0o12fN/weTZLUmOQifN8IpreAOs1rABanC5xL+j/XGagQQoVUBC6YsyBsE0tE7Qwbhd5JwGKYlDGI7pdkru5IMtIMWRXSeezIkcq8rZLQr7YQVtHQ2aXy5EtxhoNiLA3vqWUwWCWUe/kHQjcomZYLs2s+4/vXNz8+Q2gVNaPRmL6LhAdF33SM39gVjFTvgKdlzoEcofTJ7XHcZ9TMkJIssTmLjjwQ6gTS4YFBCiHkffaN7jEfGb+fr48jP7wJo3brc5z0pAOmU+qD/v2jNulV+OF7WeniuRTuG+OZC7+53dUdLZoFKudhL0PCHXWfZaOz2M1pTxm0f1L9DBlYiBCMZEiRYwZngK4L9ZcgaunRH2Jewss19FREiSSUNK1zihUagSF/xk7700le3k4FraFui9gSPKAN5kbp1JpNjz4IGLD/r4c7r5Tv8IEzCYZ9e3m4ZQaB2H9IjX2sD8C9lpYSf46bxOQuKJZlHOwKE7+tiuTZzVgSAzJjiDfH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(70206006)(47076005)(107886003)(6486002)(2616005)(83380400001)(336012)(6666004)(54906003)(53546011)(6512007)(6506007)(26005)(2906002)(186003)(478600001)(6862004)(356005)(5660300002)(36756003)(40460700003)(81166007)(40480700001)(4326008)(316002)(8936002)(70586007)(41300700001)(82740400003)(33656002)(8676002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 10:10:25.2026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ced4e9-445e-4630-72e7-08db77bfe41d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5317

Hi Julien,

> On 25 Jun 2023, at 22:49, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> When enabling UBSAN on arm32, the following splat will be printed:
>=20
> (XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) UBSAN: Undefined behaviour in arch/arm/arm32/vfp.c:75:22
> (XEN) left shift of 255 by 24 places cannot be represented in type 'int'
>=20
> This is referring to the shift in FPSID_IMPLEMENTER_MASK. While we could
> only add the U to the value shift there, it would be better to be
> consistent and also add it for every value shifted.
>=20
> This should also addressing MISRA Rule 7.2:
>=20
>    A "u" or "U" suffix shall be applied to all integer constants that
>    are represented in an unsigned type
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/arm32/vfp.h | 18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/arm32/vfp.h b/xen/arch/arm/include/=
asm/arm32/vfp.h
> index bade3bc66e1f..2f2e4b24bb40 100644
> --- a/xen/arch/arm/include/asm/arm32/vfp.h
> +++ b/xen/arch/arm/include/asm/arm32/vfp.h
> @@ -1,23 +1,23 @@
> #ifndef _ARM_ARM32_VFP_H
> #define _ARM_ARM32_VFP_H
>=20
> -#define FPEXC_EX                (1u << 31)
> -#define FPEXC_EN                (1u << 30)
> -#define FPEXC_FP2V              (1u << 28)
> +#define FPEXC_EX                (1U << 31)
> +#define FPEXC_EN                (1U << 30)
> +#define FPEXC_FP2V              (1U << 28)
>=20
> -#define MVFR0_A_SIMD_MASK       (0xf << 0)
> +#define MVFR0_A_SIMD_MASK       (0xfU << 0)
>=20
>=20
> #define FPSID_IMPLEMENTER_BIT   (24)
> -#define FPSID_IMPLEMENTER_MASK  (0xff << FPSID_IMPLEMENTER_BIT)
> +#define FPSID_IMPLEMENTER_MASK  (0xffU << FPSID_IMPLEMENTER_BIT)
> #define FPSID_ARCH_BIT          (16)
> -#define FPSID_ARCH_MASK         (0xf << FPSID_ARCH_BIT)
> +#define FPSID_ARCH_MASK         (0xfU << FPSID_ARCH_BIT)
> #define FPSID_PART_BIT          (8)
> -#define FPSID_PART_MASK         (0xff << FPSID_PART_BIT)
> +#define FPSID_PART_MASK         (0xffU << FPSID_PART_BIT)
> #define FPSID_VARIANT_BIT       (4)
> -#define FPSID_VARIANT_MASK      (0xf << FPSID_VARIANT_BIT)
> +#define FPSID_VARIANT_MASK      (0xfU << FPSID_VARIANT_BIT)
> #define FPSID_REV_BIT           (0)
> -#define FPSID_REV_MASK          (0xf << FPSID_REV_BIT)
> +#define FPSID_REV_MASK          (0xfU << FPSID_REV_BIT)
>=20
> struct vfp_state
> {
> --=20
> 2.40.1
>=20


