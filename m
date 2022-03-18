Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2214DD54D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 08:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291897.495750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV7Ak-0008Ea-U5; Fri, 18 Mar 2022 07:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291897.495750; Fri, 18 Mar 2022 07:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV7Ak-0008CJ-Q9; Fri, 18 Mar 2022 07:37:18 +0000
Received: by outflank-mailman (input) for mailman id 291897;
 Fri, 18 Mar 2022 07:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eO1Z=T5=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1nV7Ai-0008CC-Qq
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 07:37:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a00c56f-a68e-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 08:37:15 +0100 (CET)
Received: from DB8PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:10:be::18)
 by VE1PR08MB5664.eurprd08.prod.outlook.com (2603:10a6:800:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 07:37:10 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::34) by DB8PR03CA0005.outlook.office365.com
 (2603:10a6:10:be::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18 via Frontend
 Transport; Fri, 18 Mar 2022 07:37:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 07:37:09 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 18 Mar 2022 07:37:09 +0000
Received: from 4c370bbcb8b4.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C512782A-56B5-43A1-AB53-005E9848DBB2.1; 
 Fri, 18 Mar 2022 07:36:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c370bbcb8b4.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Mar 2022 07:36:59 +0000
Received: from DBAPR08MB5670.eurprd08.prod.outlook.com (2603:10a6:10:1a6::24)
 by VI1PR08MB3870.eurprd08.prod.outlook.com (2603:10a6:803:c2::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 07:36:57 +0000
Received: from DBAPR08MB5670.eurprd08.prod.outlook.com
 ([fe80::5c2f:44a7:10ba:1605]) by DBAPR08MB5670.eurprd08.prod.outlook.com
 ([fe80::5c2f:44a7:10ba:1605%5]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 07:36:57 +0000
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
X-Inumbo-ID: 3a00c56f-a68e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKjv/GxLLhSsolgCKgzke32ylj/R4zZlh+8mrj1bmCw=;
 b=RoqOgazpgY67zNTnlfnvGmcjpvGYCO8dfBVTV0Vedgj32r7OJWBqoKQZHKR3QULv6fSvdTHtaROxo3zTm0zimgZCQ61YR9vyc4CrQfUhMU9/G9YMWyuW7kH5h81/DsyDsFF7RJpCdELaLFk+kQ1AnshSqTR4V7UOmkLLSVfjKCQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BopGo0yC56WpK4inBxuNSy0POqGHYMKrHjIoZ3KkTpu7AdFLuCcVgR1vauNFSoXW7oxFI+CJu4PTIcDxvvFptHqkb+qsErJXJ9Oiem6WX9XhonfaCmhno9PRLLMC/1OMQ9T8PzUyx0qBLDK5zHA0qmgU7wHS/Sfo30ugn6pXLid2O9Vasx5sXZhgXymVTXg2HumxzKH9NazgkYrppwOzdmWc9ukLzYwgaYgtETUUxgxR7HQRYHsJU7M8nz4XGoLSKxOVG0q0QBjznYi0avr8wUXxEryqYOiMXGf+YSBbfkhUwMNMRm/5xj2ho3+8VZ/G/tPksV+79nAir7DOZdsIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKjv/GxLLhSsolgCKgzke32ylj/R4zZlh+8mrj1bmCw=;
 b=FuFSdlHN9l9DDMcu7mY6sP7sPfUU6p/Jl1tm8vwkjJUUHh002JWK+/othBVpI76962NzSTCpeNbntk1Ua/NurXFYmTgXPdMnEmYwz7CTKqLssQfpHUmNgizAEM+HkDCygmE+W4pwQRBU2iYGiq6Yk3zEbvvEvY53nCdTUeJ6zTpJ2u9oUizgLT8vGIjxnYWRVnli4M3DCfHK/bOxs/Lx93YsSCDW+IeGagn5BHclnWbqUVkMdP6Dj73mBxwh6xRlIEr2hZ8FuC5qchIMj0zHvBwsprgNMgHNeDZVq1yOtS+1N5cXMxtMJaZyynklYF+bOsRUVZ+QvU6M8r9O+vebDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKjv/GxLLhSsolgCKgzke32ylj/R4zZlh+8mrj1bmCw=;
 b=RoqOgazpgY67zNTnlfnvGmcjpvGYCO8dfBVTV0Vedgj32r7OJWBqoKQZHKR3QULv6fSvdTHtaROxo3zTm0zimgZCQ61YR9vyc4CrQfUhMU9/G9YMWyuW7kH5h81/DsyDsFF7RJpCdELaLFk+kQ1AnshSqTR4V7UOmkLLSVfjKCQ=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <Julien.Grall@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: RE: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
Thread-Topic: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
Thread-Index: AQHYJw0FDhq6KOFFUUuWdMYiW3+ryqzE5UfQ
Date: Fri, 18 Mar 2022 07:36:57 +0000
Message-ID:
 <DBAPR08MB5670F9858ED3EE701C7F9C8BE6139@DBAPR08MB5670.eurprd08.prod.outlook.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-9-julien@xen.org>
In-Reply-To: <20220221102218.33785-9-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 642BD511C7B79A45AAE4D6E3540B0724.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a8e65186-8b76-479b-25f5-08da08b21c4f
x-ms-traffictypediagnostic:
	VI1PR08MB3870:EE_|DB5EUR03FT039:EE_|VE1PR08MB5664:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5664BC9BAADB1BE1905B60BBE6139@VE1PR08MB5664.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1dJ+/qr5alkty1xqmCzO4Sd8RDQCgMB8CeR7xwvYU6afFdl2p18LnhyCWBfoxE3d2k8eeGF7OhyEwdq4clwpPFLcUtdf68gj0soQjJa1x+UC5A4rzYg3uSeCVVVH4UvJ++Tbz8qFs9VtaGlnsoD7m7NkMXbRabFbhYO8Q4CdISdomqvwTf5ovOeU2ZQOHvIlyBOvsIeiDY7MuLg4S8Ton/tuQbucIkFvFmJHWV/pNZg9CX5eAkC5E6Ff43Z+7MzZXBcKjR3nYKjR+l0xMp+sWIYPREdpEpWk0FGNYju1owTFzThsUMPT0ys4HGgPqnBhQbQCUdBWOcmFPzUDip7cMX6ZWoXwj63z7vHVYdbtGhNhCOdJWxZXvN6vHBsH1jn1qEGbXivPW/trSToXUISew4WQ8Pw+u0pQtSxJjdS7ySwLF4fk38icgqatZIgp+RksikAQ9rh8a0bMCKEwNEb48I/I+BgsH9ulQMgJp+xKVLFrfKDb6eT27T07BhGuAOnu6WTUnGW6P3AL5yXvnZoLRTb/5Y7Vb5Y6iIxHJ30zN3EhZDOijc1p4Zfe7O+lJjIizU9wpw3da+ng6cYVSOhyI0ucYFVT3gDacOR6TQNFhSMz8JY6ILdh51v1eD2SElEyGFxuQgCuASjg58OA6EQGTbjv+e25p8u93nRxTHUXB7u0Txl/Q72o0qBTSQAUhp9YPyO4dIv9KSvc+WBVaAcgOQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5670.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(4326008)(76116006)(8676002)(122000001)(54906003)(316002)(186003)(66476007)(66946007)(66556008)(86362001)(5660300002)(52536014)(110136005)(2906002)(8936002)(64756008)(38070700005)(66446008)(26005)(53546011)(6506007)(7696005)(9686003)(71200400001)(508600001)(83380400001)(55016003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3870
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b29b79dc-c597-446e-0c17-08da08b214ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aAT3TyDdgq9AQI9TybfiOJGjCJzWUEX497E67NVR+rC51EGJPBO48Q6nmVoBphHepfpTa/HfhLhBLXiB3pi5NCNy0z19cvjH3mWIFBcgIvYvfcZ7hKjA9M0cFCtUpsdrwnFBF8jKYO+W4XguSB3m90oV77GzJ8/+3Qsi+gv8Ex/4OKJYDWJs3iO24wNULG5Vbhtf7r/BC7quCs308FD2uloEZxkIoqzYipiLki+Ffsz6gySoPX9ytJ+EPdm5m4alL1DHboHT4mGakQQcOfV5WQyVmWj4oZqh0b0r+6ByueFTw8DPyoGT4cqUwsOsLDhjPVlAxmk/g1Dx13T9dmB3JEEdKFllHpyk21xTSXWwOMZg+nGUeWvhREjpMWjciwhUKVNwqcJ1dxAzXNrkxKqike9zxdqfEjZIZX35wdKigFckC4NTz3fWSbj2jFXIJU+NvZdko+6cG+xn4eyKtGtrrTFs6WsWuxxJKocx1jxYdwVfTrgUAi7Wr4O/fNN3bdWBscQLFwRuqnf0WkEIb2+MWKdY2z1b/rYj1GSxXo620sPOKqasfomKEEot2bLnT323PJN6hbi05heFVvo7CdVURIATrexgfRGat4Exbe8E7Y7Q+zj5OCcyB9up/ke/ENE8igoNxSF1e6TVE4iISkRZLivcckqmqkNjTvdssMstBWvMqiV0J+gd1vhv1MxaBg9l
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(33656002)(52536014)(55016003)(40460700003)(508600001)(2906002)(86362001)(4326008)(5660300002)(8676002)(70206006)(356005)(81166007)(70586007)(186003)(54906003)(26005)(110136005)(36860700001)(316002)(83380400001)(82310400004)(47076005)(6506007)(7696005)(9686003)(53546011)(336012)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 07:37:09.8338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e65186-8b76-479b-25f5-08da08b21c4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5664

Hi Julien,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jul=
ien
> Grall
> Sent: 2022=1B$BG/=1B(B2=1B$B7n=1B(B21=1B$BF|=1B(B 18:22
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <Julien.Grall@arm.com>; Stefano Stabelli=
ni
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Julien Grall
> <jgrall@amazon.com>
> Subject: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
> map_pages_to_xen()
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() calls by map_pages_to_xen() calls.
>=20
> The mapping can also be marked read-only has Xen as no business to

In my opinion I think it may should be:
	... read-only as Xen has no business ...
instead of:
	... read-only has Xen as no business ...

For this and other patches before this:
Reviewed-by: Hongda Deng <Hongda.Heng@arm.com>

> modify the host Device Tree.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ---
>     Changes in v2:
>         - Add my AWS signed-off-by
>         - Fix typo in the commit message
> ---
>  xen/arch/arm/mm.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f088a4b2de96..24de8dcb9042 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -559,6 +559,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      paddr_t offset;
>      void *fdt_virt;
>      uint32_t size;
> +    int rc;
>=20
>      /*
>       * Check whether the physical FDT address is set and meets the minim=
um
> @@ -574,8 +575,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      /* The FDT is mapped using 2MB superpage */
>      BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
>=20
> -    create_mappings(xen_second, BOOT_FDT_VIRT_START,
> paddr_to_pfn(base_paddr),
> -                    SZ_2M >> PAGE_SHIFT, SZ_2M);
> +    rc =3D map_pages_to_xen(BOOT_FDT_VIRT_START,
> maddr_to_mfn(base_paddr),
> +                          SZ_2M >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to map the device-tree.\n");
> +
>=20
>      offset =3D fdt_paddr % SECOND_SIZE;
>      fdt_virt =3D (void *)BOOT_FDT_VIRT_START + offset;
> @@ -589,9 +594,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>=20
>      if ( (offset + size) > SZ_2M )
>      {
> -        create_mappings(xen_second, BOOT_FDT_VIRT_START + SZ_2M,
> -                        paddr_to_pfn(base_paddr + SZ_2M),
> -                        SZ_2M >> PAGE_SHIFT, SZ_2M);
> +        rc =3D map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
> +                              maddr_to_mfn(base_paddr + SZ_2M),
> +                              SZ_2M >> PAGE_SHIFT,
> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +        if ( rc )
> +            panic("Unable to map the device-tree\n");
>      }
>=20
>      return fdt_virt;
> --
> 2.32.0
>=20

Cheers,
---
Hongda

