Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B213A6A0B83
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500424.771791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCEx-0002Fu-4P; Thu, 23 Feb 2023 14:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500424.771791; Thu, 23 Feb 2023 14:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCEx-0002DN-1T; Thu, 23 Feb 2023 14:06:31 +0000
Received: by outflank-mailman (input) for mailman id 500424;
 Thu, 23 Feb 2023 14:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVCEv-0002D1-Fh
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:06:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 436dcfc9-b383-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 15:06:28 +0100 (CET)
Received: from DB6P18901CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::14)
 by DU2PR08MB9989.eurprd08.prod.outlook.com (2603:10a6:10:497::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 14:06:22 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::b1) by DB6P18901CA0004.outlook.office365.com
 (2603:10a6:4:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21 via Frontend
 Transport; Thu, 23 Feb 2023 14:06:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:06:22 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Thu, 23 Feb 2023 14:06:22 +0000
Received: from fa3c1e6499b0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71092DB8-2E36-43FF-A71F-04F1AC3D749B.1; 
 Thu, 23 Feb 2023 14:06:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa3c1e6499b0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:06:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7880.eurprd08.prod.outlook.com (2603:10a6:20b:51f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 14:06:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:06:13 +0000
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
X-Inumbo-ID: 436dcfc9-b383-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OUK2vul27wIQIKZJtdA+Sqh3cn63wMW71GDVrDFUTA=;
 b=7wzBq/iPpVgEszRj4m52P+L8FcaUfgLQWi89Z0jJ1jfjDbsCfE0/r556XMwRZoDTYzAfkya3p1wv7GrJ5TNA6FS6PaFIZp7AW9aJ/Sp/GFBhKc5Sq7YXG3nZEFGJ4x0M9RuBgQLB5deweVdGQK3E7EN6YrCuclSi6A6NhQrXOPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90e3b17f71edfd5a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNMevd1GMDoL6S3fo+1qKlau4GJLJq282ZE/TVqvVYr6xgqnkokD1Gwdmx60vEbMoP/Cuw1ZZt7epWFtwK7K1vBeq+vM5f1o7ozjgbHDvd6jhbWRmuQ1uBvcwaBLgWW5lnUuLhGzIlKoTMQAC3ipJ3YxTwz9S36MCVOGASaTAq08P2dIVn+bvB9t/HPQ7OQOLuvjBo+ZfBn+EbZzmosnSniPRFICyOSqw/lpHQZ9alvhrwceNWXDGbNxRH3x9StBmBngSySC71D+d1iugcJ+rcMZG5dNrQ1XwD8h0mbxfTnaDcbh8o7K5hfT6E1foMlRKUj3K+FWbhg0YvkxD+LsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OUK2vul27wIQIKZJtdA+Sqh3cn63wMW71GDVrDFUTA=;
 b=jmloUwgaMN9fDgi/sP3SuO86J602CK/e67cmyRCmdhImCwKIwJWiECdcO7T86snKIu/kApB0gjpXsx/Eb64ARCGzrYVMFd4iElVI5uCHxpDuofIBV4GwfFdJDDNLHhGC7/1Abie/m+mKS5PUpSSbxl42/qXn+xO1pYedrfGImjCPqP01k/zl8LGD8J5mDur0AHlQYFFZwTEUhhpC5+4kodeZEOsFguoAZICEQuGPV6xqCpKIVoHrrLown0qdDqa6X2dxd7QPUyA/rKFBy+JKjihrgsLFuo6DQI4qQLGZ4owsi/3NhDd7TWK9O0c8/OuG+PXmGaFqqQHOf1K9VLggbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OUK2vul27wIQIKZJtdA+Sqh3cn63wMW71GDVrDFUTA=;
 b=7wzBq/iPpVgEszRj4m52P+L8FcaUfgLQWi89Z0jJ1jfjDbsCfE0/r556XMwRZoDTYzAfkya3p1wv7GrJ5TNA6FS6PaFIZp7AW9aJ/Sp/GFBhKc5Sq7YXG3nZEFGJ4x0M9RuBgQLB5deweVdGQK3E7EN6YrCuclSi6A6NhQrXOPM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 5/5] xen/arm64: smpboot: Directly switch to the runtime
 page-tables
Thread-Topic: [PATCH v5 5/5] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Index: AQHZMolVWqpcyUlS5UyY9RlLEvMrLa7cutqA
Date: Thu, 23 Feb 2023 14:06:13 +0000
Message-ID: <4B07FF54-33ED-4DF4-94D7-B852C67A286A@arm.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-6-julien@xen.org>
In-Reply-To: <20230127195508.2786-6-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB7880:EE_|DBAEUR03FT046:EE_|DU2PR08MB9989:EE_
X-MS-Office365-Filtering-Correlation-Id: 575c858e-fe8d-4da7-5ec1-08db15a724b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NUH2hwvgivLq/Y4MJAOnb3jZiwD1AnX7tdogcBRcRFRcV0qkcy2rOflLKp1lf1y6cHk5wlSb4a2h1Bo9zxJgSoABopDLqad9ZrO6SC8IVWRSrqtBQ8Yt+MKKfuewAg5Pobrz/AmKYi7HSSBedJMKtpdwwH4anfEuybRZXKl7wdj0ZqUwDoClH5V0AOQHIPpsF1q0cI0G7Z1qIzu0VxiZIII2uPXORj0LE95+5y07qUjCXVPuUN7aBp9y6cs7SwbRXUsXQAKaDy2YhC7qH9wpVZtvyKJkV3lRW2z2FgUJ/KUgrbI7rig7HGEZgGpiibIursvTfCy0u/GO97xLcgC2nDpHJjYjr1EQcxCzxDiRsJ2FE7vOkaNjAuGzXILAUV2TLy59IUHCVv4INMh1/iiEizn3ttWzIOCyJPDQMIIKEJYuwaXFfWDvfX64b35jkGEqJhJ6zTHbut/dEQ0ERxslYo3oPChyALEO2GmO9iPTwzszOSvfyAqX56H5b7S1r4hG+9mXlr47ljdMnkuu2DoD/2HGZfA01ot56WxZ/f3MA/y5thU08Q15OB7t9pSJhdDCBHmEQKzcdzgmcSOiLg2CIQjbvV7FbSzEehZYhb3Kj4gWuz6u3uvErgsLQf+RQTrZT/LINYq/M7J+0doMHVOOzZ7IJUvXfXtbi5TFs1PH+mINH/ivCjzBeWgyE/e9699kFI9mb33VR5y1pfY33U14MFC0XokTQM0e/AQ+gDT2GFVowiDUR3+ZRz5lTjDkuv5A
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199018)(6486002)(36756003)(5660300002)(8936002)(41300700001)(122000001)(83380400001)(2616005)(2906002)(91956017)(66476007)(76116006)(66446008)(64756008)(66556008)(66946007)(8676002)(6512007)(186003)(6916009)(26005)(4326008)(6506007)(478600001)(316002)(71200400001)(54906003)(86362001)(53546011)(38070700005)(38100700002)(33656002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <30D7A720AD834A449B61AD049C3BE093@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7880
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9cb4efac-f1e7-49d5-25fd-08db15a71fbd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kc14TMEef1ukwrNNPKaIYmMqa/EvWoUw9IruCIidDha0rQAK4ns4gOEIfcUh0cvIG8RIwzy6l+ndLg8RxTyZ3Oc6eCvzfE27xkXcLoUM0bH1gr/wu5WTSMfAvCt5QXtUPxLHzxV54dQSpDoAgHWsp/AaNjNyK/pCkUgBPp971yz9DTaytQ4Kj9k787gIzB1AGBYizp2LGdqGnirRhUZWvvgxlYURBpN9iBgR1rJECzfL+bfydOQ0ziKE0ywtGeFYE3XH9kSjEyv52qjsYxMD2GelD63WFMNReRYltF4yYl2K/B9gZLed/45VW4w525dTlooQPACJpKAyLJ557+WNmgs2OYJkNKIHq+i8ABT6A6xWTlcQAtWVVEcXWr78LoumXZlOEBD5I8FKy772Rnj83LIVHxu9xbvlu4a0NGrz727TF3rDBnGqDYWWkNviTy1hZhraO9B8IM5aVt3PUsyBpA06Ll1jEjtOOpmMcLcs1CJS0YceOSbmRsPtb2CD5MafzuEEqaPUcav7o0Xh60cg//kUJjnyKga+43KKg0QzwpSVbwWfd/DzRKu9vwlsHLmLV7TyexKxToucT+cVpVXUZD/Ryxrgk6SIZvPwtU76Y0NFIG5DXxu/y7JfL6sdCBhz7We1mcQV0gYwFVLUosLeeDoljSHUFMNE13L7SKmfeOVxgCN6A+JfXXYrTaD3zlf39T52wiCWep9o+l5yxxlSxpy5iZcqITVyy1MMuGvKo+Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(316002)(83380400001)(54906003)(478600001)(47076005)(81166007)(82740400003)(36756003)(2906002)(86362001)(82310400005)(356005)(40460700003)(70586007)(33656002)(70206006)(4326008)(8676002)(8936002)(40480700001)(6862004)(41300700001)(5660300002)(36860700001)(2616005)(6486002)(186003)(26005)(6506007)(53546011)(6512007)(107886003)(336012)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:06:22.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 575c858e-fe8d-4da7-5ec1-08db15a724b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9989

Hi Julien,

> On 27 Jan 2023, at 20:55, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Switching TTBR while the MMU is on is not safe. Now that the identity
> mapping will not clash with the rest of the memory layout, we can avoid
> creating temporary page-tables every time a CPU is brought up.
>=20
> The arm32 code will use a different approach. So this issue is for now
> only resolved on arm64.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com <mailto:bertrand.ma=
rquis@arm.com>>

Cheers
Bertrand

>=20
> ---
>    Changes in v5:
>        - Add Luca's reviewed-by and tested-by tags.
>=20
>    Changes in v4:
>        - Somehow I forgot to send it in v3. So re-include it.
>=20
>    Changes in v2:
>        - Remove arm32 code
> ---
> xen/arch/arm/arm32/smpboot.c   |  4 ++++
> xen/arch/arm/arm64/head.S      | 29 +++++++++--------------------
> xen/arch/arm/arm64/smpboot.c   | 15 ++++++++++++++-
> xen/arch/arm/include/asm/smp.h |  1 +
> xen/arch/arm/smpboot.c         |  1 +
> 5 files changed, 29 insertions(+), 21 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/smpboot.c b/xen/arch/arm/arm32/smpboot.c
> index e7368665d50d..518e9f9c7e70 100644
> --- a/xen/arch/arm/arm32/smpboot.c
> +++ b/xen/arch/arm/arm32/smpboot.c
> @@ -21,6 +21,10 @@ int arch_cpu_up(int cpu)
>     return platform_cpu_up(cpu);
> }
>=20
> +void arch_cpu_up_finish(void)
> +{
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5efd442b24af..a61b4d3c2738 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -308,6 +308,7 @@ real_start_efi:
>         bl    check_cpu_mode
>         bl    cpu_init
>         bl    create_page_tables
> +        load_paddr x0, boot_pgtable
>         bl    enable_mmu
>=20
>         /* We are still in the 1:1 mapping. Jump to the runtime Virtual A=
ddress. */
> @@ -365,29 +366,14 @@ GLOBAL(init_secondary)
> #endif
>         bl    check_cpu_mode
>         bl    cpu_init
> -        bl    create_page_tables
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
>         bl    enable_mmu
>=20
>         /* We are still in the 1:1 mapping. Jump to the runtime Virtual A=
ddress. */
>         ldr   x0, =3Dsecondary_switched
>         br    x0
> secondary_switched:
> -        /*
> -         * Non-boot CPUs need to move on to the proper pagetables, which=
 were
> -         * setup in init_secondary_pagetables.
> -         *
> -         * XXX: This is not compliant with the Arm Arm.
> -         */
> -        ldr   x4, =3Dinit_ttbr         /* VA of TTBR0_EL2 stashed by CPU=
 0 */
> -        ldr   x4, [x4]               /* Actual value */
> -        dsb   sy
> -        msr   TTBR0_EL2, x4
> -        dsb   sy
> -        isb
> -        tlbi  alle2
> -        dsb   sy                     /* Ensure completion of TLB flush *=
/
> -        isb
> -
> #ifdef CONFIG_EARLY_PRINTK
>         /* Use a virtual address to access the UART. */
>         ldr   x23, =3DEARLY_UART_VIRTUAL_ADDRESS
> @@ -672,9 +658,13 @@ ENDPROC(create_page_tables)
>  * mapping. In other word, the caller is responsible to switch to the run=
time
>  * mapping.
>  *
> - * Clobbers x0 - x3
> + * Inputs:
> + *   x0 : Physical address of the page tables.
> + *
> + * Clobbers x0 - x4
>  */
> enable_mmu:
> +        mov   x4, x0
>         PRINT("- Turning on paging -\r\n")
>=20
>         /*
> @@ -685,8 +675,7 @@ enable_mmu:
>         dsb   nsh
>=20
>         /* Write Xen's PT's paddr into TTBR0_EL2 */
> -        load_paddr x0, boot_pgtable
> -        msr   TTBR0_EL2, x0
> +        msr   TTBR0_EL2, x4
>         isb
>=20
>         mrs   x0, SCTLR_EL2
> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
> index 694fbf67e62a..9637f424699e 100644
> --- a/xen/arch/arm/arm64/smpboot.c
> +++ b/xen/arch/arm/arm64/smpboot.c
> @@ -106,10 +106,23 @@ int __init arch_cpu_init(int cpu, struct dt_device_=
node *dn)
>=20
> int arch_cpu_up(int cpu)
> {
> +    int rc;
> +
>     if ( !smp_enable_ops[cpu].prepare_cpu )
>         return -ENODEV;
>=20
> -    return smp_enable_ops[cpu].prepare_cpu(cpu);
> +    update_identity_mapping(true);
> +
> +    rc =3D smp_enable_ops[cpu].prepare_cpu(cpu);
> +    if ( rc )
> +        update_identity_mapping(false);
> +
> +    return rc;
> +}
> +
> +void arch_cpu_up_finish(void)
> +{
> +    update_identity_mapping(false);
> }
>=20
> /*
> diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/sm=
p.h
> index 8133d5c29572..a37ca55bff2c 100644
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -25,6 +25,7 @@ extern void noreturn stop_cpu(void);
> extern int arch_smp_init(void);
> extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
> extern int arch_cpu_up(int cpu);
> +extern void arch_cpu_up_finish(void);
>=20
> int cpu_up_send_sgi(int cpu);
>=20
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 412ae2286906..4a89b3a8345b 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -500,6 +500,7 @@ int __cpu_up(unsigned int cpu)
>     init_data.cpuid =3D ~0;
>     smp_up_cpu =3D MPIDR_INVALID;
>     clean_dcache(smp_up_cpu);
> +    arch_cpu_up_finish();
>=20
>     if ( !cpu_online(cpu) )
>     {
> --=20
> 2.38.1
>=20
>=20


