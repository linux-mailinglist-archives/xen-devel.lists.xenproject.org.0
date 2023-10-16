Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156237CA9E3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617582.960307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNpv-0000FS-Cn; Mon, 16 Oct 2023 13:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617582.960307; Mon, 16 Oct 2023 13:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNpv-0000Cs-A6; Mon, 16 Oct 2023 13:40:47 +0000
Received: by outflank-mailman (input) for mailman id 617582;
 Mon, 16 Oct 2023 13:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsNpt-0000C1-JO
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:40:45 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aca9afb-6c29-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:40:44 +0200 (CEST)
Received: from AS9PR06CA0683.eurprd06.prod.outlook.com (2603:10a6:20b:49c::28)
 by VE1PR08MB5853.eurprd08.prod.outlook.com (2603:10a6:800:1a5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:40:36 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::fb) by AS9PR06CA0683.outlook.office365.com
 (2603:10a6:20b:49c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 13:40:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.19 via Frontend Transport; Mon, 16 Oct 2023 13:40:36 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Mon, 16 Oct 2023 13:40:36 +0000
Received: from e28c4ee1f8f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF80A867-ED1A-4EE9-AA40-9D16F23EBFFB.1; 
 Mon, 16 Oct 2023 13:40:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e28c4ee1f8f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 13:40:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9792.eurprd08.prod.outlook.com (2603:10a6:20b:613::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:40:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:40:26 +0000
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
X-Inumbo-ID: 9aca9afb-6c29-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztjbguKXdEz7z9rAKiDOM15tBB6Ho2eCZRga0DcrtYU=;
 b=9eO+jO22kbe8wttdvN65YT5Rx5luCdZ3jnmln/TDkUlDiywcZPqpsRXgrMXTC+A7Qa1GQQ/JkpzIhUUl2KW9RpUtewXTuM+x7aeYYaB6PBUr7LD4iQnijUYOqES3ZJv6B13kZPC04ip0UWJw1EdfmVHGa5hFH4Az5ao2hJAzyMY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 887ae82e7928a124
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGFnKEqcfeRNEi9uKvIQElx93Nmf8Wlp62Nl8QPK4vA4x/CyMtWegtuC4GZU+SbcLGGZ01Y92mrCLq9gRaecWojfaC8HH1+a+Cb7nY9bGfW1FOuWgttv/+zfbwiLY3Bh4Xo4d9QqW42s7Z1Ke4aaFd5vmEwmUToOk/lgQKCc5t3TTGd2OMiQxX+Aw1G8yf1WN01psJ0nDJ9n98UmrRAwDoaIvcBTD/HjVwVDT5+cIrF8Sd3kE7kX4AWxt1ps+FnGctC+rONVHKd3zzV0TjO3AokV/9S6tSsV2jDsKKKhkUrT6TclQwSCOb1tjb+7wdNubEs5ihdKPQnYy3HXUeZTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztjbguKXdEz7z9rAKiDOM15tBB6Ho2eCZRga0DcrtYU=;
 b=T1b40x/ZbKsAuSwkenslKteDXR9eZS+4zbEtvlsk0nCfVy9I2kMsWb1Mpgxh5gzKw/4+IsLeP9OUL4Q+eLI2laeA2A18BgfgEXj+X9yn4/cJ8qsp2XRu8ZIAeT8gd7wHghZWQ+jh/+Q3STH/AVkQhA4JF+XWDPV/sTmelQKb9VAhR/DXGXmnWkqs8yEAUwD1CAh5zBAH8sPvauERrglCXyhNXHb/LP/qFWKLMOQmysU/KSwVewoUVcmTLopE0hbEXjn7pzxt/oGg2KhDtMfSKY4qXeG3Deaq230EVUr4W4tw4zU9EXB0wG/WWf7Bo4xdXxoMlNReuciydxBmApSy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztjbguKXdEz7z9rAKiDOM15tBB6Ho2eCZRga0DcrtYU=;
 b=9eO+jO22kbe8wttdvN65YT5Rx5luCdZ3jnmln/TDkUlDiywcZPqpsRXgrMXTC+A7Qa1GQQ/JkpzIhUUl2KW9RpUtewXTuM+x7aeYYaB6PBUr7LD4iQnijUYOqES3ZJv6B13kZPC04ip0UWJw1EdfmVHGa5hFH4Az5ao2hJAzyMY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index: AQHZ/dCeetLGz4GvX0qAhZnpE9HtkrBMcPYA
Date: Mon, 16 Oct 2023 13:40:26 +0000
Message-ID: <83ABBD09-D994-4DA3-8F10-15D87BCC2CF1@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
In-Reply-To: <20231013122658.1270506-3-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9792:EE_|AM7EUR03FT027:EE_|VE1PR08MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 828fd00f-296d-46e9-d671-08dbce4d7a6c
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SumfbolPgblKT0FR9zWknPyMMoPnxgosFDXbHJsk/BSF3hKaVATNUY0ggM1IZ/Aoyu9yCX+Djsb7ByJf6rLMS3gF8fkuY+DyIkNl/JV8VnCFnFVhXlb5psmP/0rhLLCL7192OONSRIuNamE0UVU+JgQZzkHbH5FjTdnPi5iy7/6G/3pMGCC7Zuf3jJIK/ukUBelZk6UrlOntw4ZdpqTHGFQdOe4m9nyUXBvZl/C5F+QjxrEFHzkUpVXkm26M+lBeecuw1BSs1I6u5WN2JZvNzOK2gd97npw029SHquZA3Og9iPWvsJEeX8jZu7roRx9faqnlQZVmUsH37VwiKYtXURmUl59mZ3uGD11a/h+HnSSuEvcJb0zfrJzxbdW04mo0oD3ogyzMyO2w7jnoWIW0+S/rkLGLWOqklrJooIll/el+aytVPuWBZqjewaxjW8sV+lavzXhkzm913gqG7bXpx3mUP1gIymlld7+OiZCdoxMifr0IaWUiSNnYaFi1sJYbZO1B9HWx33x97Kviyw0QxUegneQFLKGxrOoDWYJMqlaTCLnJ6DrH1IpFSXZcPi5OHsdG5dPoiqtoERv/fn10OYomA/JqD/lQ6pC1OK1SC2rdYzctd56Wf2sCVOY36tp/cM2y2FUhpwXbGs/MDFgSQWQNoig/GC+BJqA+JKpZDsLyjZCsKJ8OKI8L893u9yNq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(66446008)(478600001)(76116006)(6916009)(66476007)(66556008)(66946007)(64756008)(91956017)(2616005)(316002)(6506007)(71200400001)(6512007)(26005)(53546011)(54906003)(5660300002)(8676002)(8936002)(4326008)(2906002)(41300700001)(86362001)(33656002)(36756003)(122000001)(38070700005)(38100700002)(83380400001)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A8043DAAA5559C4E9E93293057B185F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9792
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2955942-f407-4e87-551c-08dbce4d7479
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ys1CVJVA+pJ0MkZuSzh9LY2dVYMQyBoxKpUBD1bw3dg7heDm4VADRguKrJecMfFTPMRmXHOHWPr08qyM6LvsUvo1Zd8Hvw3Z7DJSccCrmMMum+ZwCl5J6sdfVg355QUmZ9KXYniIr04O8o8vWvTMX4y5ATDKEhO9FlrRnNyFINsci8U62M/GqKqTWECXZDbt4gKpTEZIuFHVzA0XBcGlxOSb4QkcDhuN3QsAZjLWPXOGPViH5CAGxmq7UoZSyUzfu4+xqAE8ocE49bkZpgcPnT/08lukzQ3yd9wtf5OzZJ9wRb332R/cHmjJ4RO07PiOtVh4EphDWRqY6DWOIcsZDKvWzWsg5VPutE6vdn+ows9u155aSH3i4ZfpemZrBThj7a12ZRkse2tWtOkMKTrx1Aqgo2lUuHLQkQHUhCLhNSluZwxwqfI+qsyr9sZUG2mUrc2sacxKLjFsU+FisIopjB7WOzxLVnFzJcOCrwreTMg3++ALen4QjhCrS6+0Q7w5hSXS20IPiGB23+VGXBcPgeWosXHrfVWWZp6/b9lCOMk6fib+4uvvqepB79QkeV0OTIDhhaTidnfcgRBAR3Uy+AgCFDwB2rNiqAVGEzeGn1+kvXK3DPJsscYuRxpoRksq5yBgzLtdYM9623L4wQFHmcMs+qVHy6Yhz+lJCKEJMggAkfDsbTyZV8mbT+TT3eOCJv+S6+AYQmseA3Cs/bH5WG+AM7aoayxHyxcRlxM8VkA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(376002)(396003)(136003)(230922051799003)(1800799009)(64100799003)(82310400011)(451199024)(186009)(46966006)(36840700001)(6486002)(478600001)(54906003)(70206006)(70586007)(107886003)(26005)(41300700001)(6506007)(53546011)(6512007)(2616005)(336012)(316002)(8676002)(8936002)(4326008)(6862004)(2906002)(5660300002)(36756003)(33656002)(81166007)(86362001)(47076005)(356005)(36860700001)(83380400001)(82740400003)(40480700001)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:40:36.4188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828fd00f-296d-46e9-d671-08dbce4d7a6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5853

Hi,

> On 13 Oct 2023, at 14:26, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
> the physical memory regions are:
>=20
>  DRAM memory regions:
>    Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
>    Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
>    Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
>=20
> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
> and ramdisk images are loaded into the low memory space:
>=20
>  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
>=20
> In this case, the Xen binary is loaded above 8TB, which exceeds the
> maximum supported identity map space of 2TB in Xen. Consequently, the
> system fails to boot.
>=20
> This patch enlarges identity map space to 10TB, allowing module loading
> within the range of [0x0 .. 0x000009ff_ffff_ffff].
>=20
> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/di=
sable")

I agree with Michal here, this is not a fix so this should be removed (can =
be done
on commit).

> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm64/mm.c               | 6 ++++--
> xen/arch/arm/include/asm/mmu/layout.h | 8 ++++----
> 2 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> index 78b7c7eb00..cb69df0661 100644
> --- a/xen/arch/arm/arm64/mm.c
> +++ b/xen/arch/arm/arm64/mm.c
> @@ -41,7 +41,8 @@ static void __init prepare_boot_identity_mapping(void)
>     clear_page(boot_third_id);
>=20
>     if ( id_offsets[0] >=3D IDENTITY_MAPPING_AREA_NR_L0 )
> -        panic("Cannot handle ID mapping above 2TB\n");
> +        panic("Cannot handle ID mapping above %uTB\n",
> +              IDENTITY_MAPPING_AREA_NR_L0 >> 1);
>=20
>     /* Link first ID table */
>     pte =3D mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
> @@ -74,7 +75,8 @@ static void __init prepare_runtime_identity_mapping(voi=
d)
>     DECLARE_OFFSETS(id_offsets, id_addr);
>=20
>     if ( id_offsets[0] >=3D IDENTITY_MAPPING_AREA_NR_L0 )
> -        panic("Cannot handle ID mapping above 2TB\n");
> +        panic("Cannot handle ID mapping above %uTB\n",
> +              IDENTITY_MAPPING_AREA_NR_L0 >> 1);
>=20
>     /* Link first ID table */
>     pte =3D pte_of_xenaddr((vaddr_t)xen_first_id);
> diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include=
/asm/mmu/layout.h
> index 2cb2382fbf..eac7eef885 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -19,11 +19,11 @@
>  *   2G -   4G   Domheap: on-demand-mapped
>  *
>  * ARM64 layout:
> - * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> + * 0x0000000000000000 - 0x000009ffffffffff (10TB, L0 slots [0..19])
>  *
>  *  Reserved to identity map Xen
>  *
> - * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
> + * 0x00000a0000000000 - 0x00000a7fffffffff (512GB, L0 slot [20])
>  *  (Relative offsets)
>  *   0  -   2M   Unmapped
>  *   2M -  10M   Xen text, data, bss
> @@ -35,7 +35,7 @@
>  *
>  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>  *
> - * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
> + * 0x00000a8000000000 - 0x00007fffffffffff (512GB+117TB, L0 slots [21..2=
55])
>  *  Unused
>  *
>  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
> @@ -49,7 +49,7 @@
> #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> #else
>=20
> -#define IDENTITY_MAPPING_AREA_NR_L0     4
> +#define IDENTITY_MAPPING_AREA_NR_L0     20
> #define XEN_VM_MAPPING                  SLOT0(IDENTITY_MAPPING_AREA_NR_L0=
)
>=20
> #define SLOT0_ENTRY_BITS  39
> --=20
> 2.39.2
>=20


