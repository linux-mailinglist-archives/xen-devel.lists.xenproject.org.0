Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533224D79BD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 04:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289871.491527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbh4-0000w0-BP; Mon, 14 Mar 2022 03:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289871.491527; Mon, 14 Mar 2022 03:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbh4-0000tI-7u; Mon, 14 Mar 2022 03:48:26 +0000
Received: by outflank-mailman (input) for mailman id 289871;
 Mon, 14 Mar 2022 03:48:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QvMz=TZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nTbh2-0000t7-MC
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 03:48:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981a2942-a349-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 04:48:23 +0100 (CET)
Received: from DB3PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:8:1::23) by
 VI1PR08MB5309.eurprd08.prod.outlook.com (2603:10a6:803:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 03:48:05 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::7c) by DB3PR06CA0010.outlook.office365.com
 (2603:10a6:8:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Mon, 14 Mar 2022 03:48:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 03:48:04 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Mon, 14 Mar 2022 03:48:04 +0000
Received: from 05102da35aa8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95D3180B-EA70-49B3-A85F-F550BAD559C8.1; 
 Mon, 14 Mar 2022 03:47:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05102da35aa8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 03:47:58 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by AM8PR08MB6385.eurprd08.prod.outlook.com (2603:10a6:20b:36a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 03:47:51 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa%3]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 03:47:51 +0000
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
X-Inumbo-ID: 981a2942-a349-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKGj6i4PAHGNNAnP+1fMv9k5drENGC6Bq98G+6PhbYU=;
 b=3iXuEXpBlKDXgLbUOpPAUBH+T1HdouXzt4GSsTamFisLoEHgT65H846SknRFdmBwhij+Fe+WOOEeo3JPV9Zw5P2D8MGKh4dTS2eWZENPtT/WiZrTHuRrvdZhDgrDYh0QvzA4OCp4pL9cj3UXHJuBAnQI1Jt5FJm26wjZDV4dfIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqEuCyu+1PE4+X+EzdYc2gVEh7JfqhVdKWhHjQITwr/5YK/Vg/CrsTIZN3oljcnNHhZcu7oKnOErCDzcX2oi+/dG85d6H4JtjbiC1exo7tb04ThFmN1jfMVREfXA0Jp9fTzU+s9Ktrj9lRiv3fZBL1i+VESys782Lj7zaT1FpxRbLtiHzaf1Mxh4g22wHGvGn4JBJSR+IYQk0w0IN001lyBOLe9ulAXNjFLp7o7r/9eXC0JQ6/AioAMEk0S67pLBkqiV0pVaqiURV7DCAXsEdUfGXS2wMRVHdadHs8gwz7Ni+LYNAqCgPNJHF3m134+QuOfNedAqj2TVcMVjmvjPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKGj6i4PAHGNNAnP+1fMv9k5drENGC6Bq98G+6PhbYU=;
 b=C4M43nW1yWIiq6DxmfPI8JaTs/z/T6RPMENlPmNG4GtWB0/riDhtZ5u4z3jHo87zQWoOdJ6FDw75yVCXPn2RmkoLkZWnVUmDF6OHyrvcyA+9tYmtJpCUPcx7Iw8p0txNfkIycoHwYUXIk1XsNe9RZ6eGOHp6yIyOmxn4kkWNWXoo4iknp5U2sDdZDR0iPdoq4u/7xFRwRfIBWw2TZStQGd2w5dp7I6aeP4dYfLL5S7L5kiEOyKiTexa3tzSyYnhb5eGfEYeVL6kM4eVKLKnwkfW3aibKd3A9j3yWfdMfUe+IfJeYBqnER48nHAopbmDmw9l7RVNOGR8HzcOYHNZC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKGj6i4PAHGNNAnP+1fMv9k5drENGC6Bq98G+6PhbYU=;
 b=3iXuEXpBlKDXgLbUOpPAUBH+T1HdouXzt4GSsTamFisLoEHgT65H846SknRFdmBwhij+Fe+WOOEeo3JPV9Zw5P2D8MGKh4dTS2eWZENPtT/WiZrTHuRrvdZhDgrDYh0QvzA4OCp4pL9cj3UXHJuBAnQI1Jt5FJm26wjZDV4dfIY=
From: Henry Wang <Henry.Wang@arm.com>
To: Marco Solieri <marco.solieri@minervasys.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Marco Solieri <marco.solieri@unimore.it>, Andrea Bastoni
	<andrea.bastoni@minervasys.tech>, Luca Miccio <lucmiccio@gmail.com>
Subject: RE: [PATCH 27/36] xen/arch: add coloring support for Xen
Thread-Topic: [PATCH 27/36] xen/arch: add coloring support for Xen
Thread-Index: AQHYL/RHtZV3whmnN0SzL3d8EugMTKy+SvZA
Date: Mon, 14 Mar 2022 03:47:51 +0000
Message-ID:
 <PA4PR08MB6253A16AB5B20A479F923ECD920F9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-28-marco.solieri@minervasys.tech>
In-Reply-To: <20220304174701.1453977-28-marco.solieri@minervasys.tech>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5B3DDAEB4ECC0944B2BE5C4AC4C3F3A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 83d1439e-f977-4ee2-cada-08da056d71d2
x-ms-traffictypediagnostic:
	AM8PR08MB6385:EE_|DB5EUR03FT019:EE_|VI1PR08MB5309:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5309369FE5E5EBBF24B2752D920F9@VI1PR08MB5309.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QtE96Io2WRxBOFoMavKP+R/aNRfOgDu/iO5MA7AJmrVwT5JcbdcLoKFlo3ZG0ne5GVjy74HoSa7sqUdw8A8dtoJfOtz+80lToUNIZtKR96U+deejCkDTNS5GYvcedZN2sT4JpYIYKQz6Gthgs2NH8JnS8thgXLnegwW+yTjatr3Wsri6ravdcvSCuHs3sgUGLesfzVZ4ySV45RqlOMa7GbgqqwD1DJaCSNrl6MUQWZcMpHLEa9OP80rnYJA42ahi3AQO9Gypy6YSyx+MulMkSY/Thq6GJz3dvm953U/q8meV/UP2hfg2fjG9l9Py7Ztf/f4KKXONCREye0HSoXL3vKrIV9AOY/LnIdqexADEhG0NQmsewwHK1Dx7B/Y2cjk6Q6u2Q6h/ZjtLgrs0oZNnYq4xYFjt6DJjavkeTiCj1xpwWSXHQGFfsoZY5M8IQ3hbtASNVkinDfvwps9X58IcOb74ji1XZ3ZqV05FueYppzpfrM/85l213nPqBRmtjRH+pNT9aWmZYLduCGqGTl2J0meu4Nhfuo54Mmp6Dd3rD/cnjubloWwhBC4NQSaSphXGsvY1Nf6INTFDWduaqFRZOLIk0roICHGezFUuqQzoj6VsimaBnOojQS6nTkTHHtO/GJYvTygCLj5S6LL1A97xaPd6+SCBrIsVymOhPvnHsoncmvTE04EKs8q4DmgSm9lwDKYL5rz3ne+ZDaBMSvHTyg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(53546011)(9686003)(6506007)(7696005)(122000001)(38100700002)(508600001)(2906002)(33656002)(83380400001)(71200400001)(52536014)(66446008)(30864003)(110136005)(54906003)(5660300002)(7416002)(38070700005)(8936002)(186003)(76116006)(8676002)(316002)(26005)(86362001)(64756008)(66476007)(4326008)(66556008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6385
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b3da2ff-803e-4087-c7ef-08da056d69f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j9Bz+vqVF3bR97XXj1FbJO7wkKX0h/iiVjx8nnUmEOMiEQHQoLmC7FGDO75KIsDWR+XHBVUlqloopfCfyehu+ugeyTfzBnD8jPotSfybatiHdg4a6SGojcMYvZfCS38wZTry9V9CqvASbzw0LUYxXqP4Wf5mK/sFgQBZ1LQrUSocmHoYwBnKkiyN+LpW/36UQsbya+n41NlDS69dtNDCWYHizvz+S/ylulQcT9KgVTK4OpaAXGLsPzdSKuPN8Ls+3VsmsId9rchu9vlsankzD2QhJPeZl9GtxkCN546+YIVZQwbhfht5p1y+JBe4CmKTBzpxKPJTNSpNkp0gnq51n0YyX1KmWyWbqKVKvQgeyypaap7BSSzUBPSp2m4iXcbMdqMuFU20WqXhu7wujpfanGOehMZinZ5/nWoVWKqlnwKEOQNxa5t/USyStglcAxOHAaB7l68f3br584pJaqWZG4YNY/Yy5mxC0yvbOxhm5PKen5vArtGpU2vu8AcrLJHU+VrauZSqc7VggbQd5cfOO9EAr2EslSr9R9RZZIIm8mvUdai8oct+E3MIg4mwXV0VJZMNBRXFmAqijsGIFnipJ4LkkKB+jsaAx9hWfocVUwkjVeonNW9ul5W2/JOHiYYGt6UHhA8ztgAwzENXfoT2sg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(54906003)(508600001)(110136005)(86362001)(36860700001)(107886003)(47076005)(26005)(186003)(336012)(33656002)(53546011)(83380400001)(9686003)(7696005)(6506007)(4326008)(81166007)(8676002)(70206006)(70586007)(82310400004)(2906002)(356005)(316002)(8936002)(55016003)(5660300002)(52536014)(30864003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 03:48:04.5404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d1439e-f977-4ee2-cada-08da056d71d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5309

Hi,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Marco Solieri
> Sent: Saturday, March 5, 2022 1:47 AM
> To: xen-devel@lists.xenproject.org
> Cc: Marco Solieri <marco.solieri@minervasys.tech>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
> Jan Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Marco Solieri
> <marco.solieri@unimore.it>; Andrea Bastoni
> <andrea.bastoni@minervasys.tech>; Luca Miccio <lucmiccio@gmail.com>
> Subject: [PATCH 27/36] xen/arch: add coloring support for Xen
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Introduce a new implementation of setup_pagetables that uses coloring
> logic in order to isolate Xen code using its color selection.
> Page tables construction is essentially copied, except for the xenmap
> table, where coloring logic is needed.  Given the absence of a contiguous
> physical mapping, pointers to next level tables need to be manually
> calculated.
>=20
> Xen code is relocated in strided mode using the same coloring logic as
> the one in xenmap table by using a temporary colored mapping that will
> be destroyed after switching the TTBR register.
>=20
> Keep Xen text section mapped in the newly created pagetables.
> The boot process relies on computing needed physical addresses of Xen
> code by using a shift, but colored mapping is not linear and not easily
> computable. Therefore, the old Xen code is temporarily kept and used to
> boot secondary CPUs until they switch to the colored mapping, which is
> accessed using the handy macro virt_old.  After the boot process, the old
> Xen code memory is reset and its mapping is destroyed.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>  xen/arch/arm/include/asm/coloring.h |  13 ++
>  xen/arch/arm/include/asm/mm.h       |   7 ++
>  xen/arch/arm/mm.c                   | 186 +++++++++++++++++++++++++++-
>  xen/arch/arm/psci.c                 |   4 +-
>  xen/arch/arm/setup.c                |  21 +++-
>  xen/arch/arm/smpboot.c              |  19 ++-
>  6 files changed, 241 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/coloring.h
> b/xen/arch/arm/include/asm/coloring.h
> index 8c4525677c..424f6c2b04 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -26,6 +26,17 @@
>  #ifdef CONFIG_COLORING
>  #include <xen/sched.h>
>=20
> +/*
> + * Amount of memory that we need to map in order to color Xen.  The valu=
e
> + * depends on the maximum number of available colors of the hardware.
> The
> + * memory size is pessimistically calculated assuming only one color is =
used,
> + * which means that any pages belonging to any other color has to be
> skipped.
> + */
> +#define XEN_COLOR_MAP_SIZE \
> +	((((_end - _start) * get_max_colors())\
> +		+ (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1))
> +#define XEN_COLOR_MAP_SIZE_M (XEN_COLOR_MAP_SIZE >> 20)
> +
>  bool __init coloring_init(void);
>=20
>  /*
> @@ -67,6 +78,8 @@ unsigned long color_from_page(struct page_info *pg);
>  /* Return the maximum available number of colors supported by the
> hardware */
>  uint32_t get_max_colors(void);
>  #else /* !CONFIG_COLORING */
> +#define XEN_COLOR_MAP_SIZE (_end - _start)
> +
>  static inline bool __init coloring_init(void)
>  {
>      return true;
> diff --git a/xen/arch/arm/include/asm/mm.h
> b/xen/arch/arm/include/asm/mm.h
> index 041ec4ee70..1422091436 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -362,6 +362,13 @@ void clear_and_clean_page(struct page_info *page);
>=20
>  unsigned int arch_get_dma_bitsize(void);
>=20
> +#ifdef CONFIG_COLORING
> +#define virt_boot_xen(virt)\
> +    (vaddr_t)((virt - XEN_VIRT_START) + BOOT_RELOC_VIRT_START)

Apart from Julien's comments, one small issue, I am afraid with commit:

0c18fb7632 xen/arm: Remove unused BOOT_RELOC_VIRT_START

merged in staging branch, directly applying the Arm Cache coloring
series on top of the staging branch breaks the build of Xen.

Therefore please take care of this issue when sending the next version,
Thanks :)

Kind regards,

Henry

> +#else
> +#define virt_boot_xen(virt) virt
> +#endif
> +
>  #endif /*  __ARCH_ARM_MM__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index d69f18b5d2..53ea13641b 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -42,6 +42,7 @@
>  #include <xen/libfdt/libfdt.h>
>=20
>  #include <asm/setup.h>
> +#include <asm/coloring.h>
>=20
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
> @@ -110,6 +111,9 @@ DEFINE_BOOT_PAGE_TABLE(boot_second_id);
>  DEFINE_BOOT_PAGE_TABLE(boot_third_id);
>  DEFINE_BOOT_PAGE_TABLE(boot_second);
>  DEFINE_BOOT_PAGE_TABLE(boot_third);
> +#ifdef CONFIG_COLORING
> +DEFINE_BOOT_PAGE_TABLE(boot_colored_xen);
> +#endif
>=20
>  /* Main runtime page tables */
>=20
> @@ -632,6 +636,166 @@ static void clear_table(void *table)
>      clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
>  }
>=20
> +#ifdef CONFIG_COLORING
> +/*
> + * Translate a Xen (.text) virtual address to the colored physical one
> + * depending on the hypervisor configuration.
> + * N.B: this function must be used only when migrating from non colored =
to
> + * colored pagetables since it assumes to have the temporary mappings
> created
> + * during setup_pagetables that starts from BOOT_RELOC_VIRT_START.
> + * After the migration we have to use virt_to_maddr.
> + */
> +static paddr_t virt_to_maddr_colored(vaddr_t virt)
> +{
> +    unsigned int va_offset;
> +
> +    va_offset =3D virt - XEN_VIRT_START;
> +    return __pa(BOOT_RELOC_VIRT_START + va_offset);
> +}
> +
> +static void __init coloring_temp_mappings(paddr_t xen_paddr, vaddr_t
> virt_start)
> +{
> +    int i;
> +    lpae_t pte;
> +    unsigned int xen_text_size =3D (_end - _start);
> +
> +    xen_text_size =3D PAGE_ALIGN(xen_text_size);
> +
> +    pte =3D mfn_to_xen_entry(maddr_to_mfn(__pa(boot_second)),
> MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    boot_first[first_table_offset(virt_start)] =3D pte;
> +
> +    pte =3D mfn_to_xen_entry(maddr_to_mfn(__pa(boot_colored_xen)),
> MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    boot_second[second_table_offset(virt_start)] =3D pte;
> +
> +    for ( i =3D 0; i < (xen_text_size/PAGE_SIZE); i++ )
> +    {
> +        mfn_t mfn;
> +        xen_paddr =3D next_xen_colored(xen_paddr);
> +        mfn =3D maddr_to_mfn(xen_paddr);
> +        pte =3D mfn_to_xen_entry(mfn, MT_NORMAL);
> +        pte.pt.table =3D 1; /* 4k mappings always have this bit set */
> +        boot_colored_xen[i] =3D pte;
> +        xen_paddr +=3D PAGE_SIZE;
> +    }
> +
> +   flush_xen_tlb_local();
> +}
> +
> +/*
> + * Boot-time pagetable setup with coloring support
> + * Changes here may need matching changes in head.S
> + *
> + * The process can be explained as follows:
> + * - Create a temporary colored mapping that conforms to Xen color
> selection.
> + * - Update all the pagetables links that point to the next level table(=
s):
> + * this process is crucial beacause the translation tables are not physi=
cally
> + * contiguous and we cannot calculate the physical addresses by using th=
e
> + * standard method (physical offset). In order to get the correct physic=
al
> + * address we use virt_to_maddr_colored that translates the virtual addr=
ess
> + * into a physical one based on the Xen coloring configuration.
> + * - Copy Xen to the new location.
> + * - Update TTBR0_EL2 with the new root page table address.
> + */
> +void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t
> xen_paddr)
> +{
> +    int i;
> +    lpae_t pte, *p;
> +    paddr_t pt_phys;
> +    mfn_t pt_phys_mfn;
> +    paddr_t _xen_paddr =3D xen_paddr;
> +
> +    phys_offset =3D boot_phys_offset;
> +
> +    ASSERT((_end - _start) < SECOND_SIZE);
> +    /* Create temporary mappings */
> +    coloring_temp_mappings(xen_paddr, BOOT_RELOC_VIRT_START);
> +
> +    /* Build pagetables links */
> +    p =3D (void *)xen_pgtable;
> +    pt_phys =3D virt_to_maddr_colored((vaddr_t)xen_first);
> +    pt_phys_mfn =3D maddr_to_mfn(pt_phys);
> +    p[0] =3D mfn_to_xen_entry(pt_phys_mfn, MT_NORMAL);
> +    p[0].pt.table =3D 1;
> +    p[0].pt.xn =3D 0;
> +    p =3D (void *)xen_first;
> +
> +    for ( i =3D 0; i < 2; i++ )
> +    {
> +        pt_phys =3D virt_to_maddr_colored((vaddr_t)(xen_second + i *
> LPAE_ENTRIES));
> +        pt_phys_mfn =3D maddr_to_mfn(pt_phys);
> +        p[i] =3D mfn_to_xen_entry(pt_phys_mfn, MT_NORMAL);
> +        p[i].pt.table =3D 1;
> +        p[i].pt.xn =3D 0;
> +    }
> +
> +    for ( i =3D 0; i < LPAE_ENTRIES; i++ )
> +    {
> +        mfn_t mfn;
> +        vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
> +        _xen_paddr =3D next_xen_colored(_xen_paddr);
> +        mfn =3D maddr_to_mfn(_xen_paddr);
> +        if ( !is_kernel(va) )
> +            break;
> +        pte =3D mfn_to_xen_entry(mfn, MT_NORMAL);
> +        pte.pt.table =3D 1; /* 4k mappings always have this bit set */
> +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> +        {
> +            pte.pt.xn =3D 0;
> +            pte.pt.ro =3D 1;
> +        }
> +        if ( is_kernel_rodata(va) )
> +            pte.pt.ro =3D 1;
> +        xen_xenmap[i] =3D pte;
> +        _xen_paddr +=3D PAGE_SIZE;
> +    }
> +
> +    /* Initialise xen second level entries ... */
> +    /* ... Xen's text etc */
> +    pt_phys =3D virt_to_maddr_colored((vaddr_t)(xen_xenmap));
> +    pt_phys_mfn =3D maddr_to_mfn(pt_phys);
> +    pte =3D mfn_to_xen_entry(pt_phys_mfn, MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    xen_second[second_table_offset(XEN_VIRT_START)] =3D pte;
> +
> +    /* ... Fixmap */
> +    pt_phys =3D virt_to_maddr_colored((vaddr_t)(xen_fixmap));
> +    pt_phys_mfn =3D maddr_to_mfn(pt_phys);
> +    pte =3D mfn_to_xen_entry(pt_phys_mfn, MT_NORMAL);
> +    pte.pt.table =3D 1;
> +    xen_second[second_table_offset(FIXMAP_ADDR(0))] =3D pte;
> +
> +    /* ... DTB */
> +    pte =3D boot_second[second_table_offset(BOOT_FDT_VIRT_START)];
> +    xen_second[second_table_offset(BOOT_FDT_VIRT_START)] =3D pte;
> +    pte =3D boot_second[second_table_offset(BOOT_FDT_VIRT_START +
> SZ_2M)];
> +    xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] =3D
> pte;
> +
> +    /* Update the value of init_ttbr */
> +    init_ttbr =3D virt_to_maddr_colored((vaddr_t)xen_pgtable);
> +    clean_dcache(init_ttbr);
> +
> +    /* Copy Xen to the new location */
> +    memcpy((void*)BOOT_RELOC_VIRT_START,
> +        (const void*)XEN_VIRT_START, (_end - _start));
> +    clean_dcache_va_range((void*)BOOT_RELOC_VIRT_START, (_end -
> _start));
> +
> +    /* Change ttbr */
> +    switch_ttbr(init_ttbr);
> +
> +    /*
> +     * Keep mapped old Xen memory in a contiguous mapping
> +     * for other cpus to boot. This mapping will also replace the
> +     * one created at the beginning of setup_pagetables.
> +     */
> +    create_mappings(xen_second, BOOT_RELOC_VIRT_START,
> +                paddr_to_pfn(XEN_VIRT_START + phys_offset),
> +                SZ_2M >> PAGE_SHIFT, SZ_2M);
> +
> +    xen_pt_enforce_wnx();
> +}
> +#else
>  /* Boot-time pagetable setup.
>   * Changes here may need matching changes in head.S */
>  void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t
> xen_paddr)
> @@ -721,6 +885,7 @@ void __init setup_pagetables(unsigned long
> boot_phys_offset, paddr_t xen_paddr)
>      per_cpu(xen_dommap, 0) =3D cpu0_dommap;
>  #endif
>  }
> +#endif /* !CONFIG_COLORING */
>=20
>  static void clear_boot_pagetables(void)
>  {
> @@ -735,6 +900,9 @@ static void clear_boot_pagetables(void)
>  #endif
>      clear_table(boot_second);
>      clear_table(boot_third);
> +#ifdef CONFIG_COLORING
> +    clear_table(boot_colored_xen);
> +#endif
>  }
>=20
>  #ifdef CONFIG_ARM_64
> @@ -742,10 +910,16 @@ int init_secondary_pagetables(int cpu)
>  {
>      clear_boot_pagetables();
>=20
> +    /*
> +     * For coloring the value of the ttbr was already set up during
> +     * setup_pagetables.
> +     */
> +#ifndef CONFIG_COLORING
>      /* Set init_ttbr for this CPU coming up. All CPus share a single set=
of
>       * pagetables, but rewrite it each time for consistency with 32 bit.=
 */
>      init_ttbr =3D (uintptr_t) xen_pgtable + phys_offset;
>      clean_dcache(init_ttbr);
> +#endif
>      return 0;
>  }
>  #else
> @@ -859,12 +1033,20 @@ void __init setup_xenheap_mappings(unsigned
> long base_mfn,
>          else if ( xenheap_first_first_slot =3D=3D -1)
>          {
>              /* Use xenheap_first_first to bootstrap the mappings */
> -            first =3D xenheap_first_first;
> +            paddr_t phys_addr;
> +
> +            /*
> +             * At this stage is safe to use virt_to_maddr because Xen ma=
pping
> +             * is already in place. Using virt_to_maddr allows us to uni=
fy
> +             * codepath with and without cache coloring enabled.
> +             */
> +            phys_addr =3D virt_to_maddr((vaddr_t)xenheap_first_first);
> +            pte =3D mfn_to_xen_entry(maddr_to_mfn(phys_addr),MT_NORMAL);
>=20
> -            pte =3D pte_of_xenaddr((vaddr_t)xenheap_first_first);
>              pte.pt.table =3D 1;
>              write_pte(p, pte);
>=20
> +            first =3D xenheap_first_first;
>              xenheap_first_first_slot =3D slot;
>          }
>          else
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 0c90c2305c..d443fac6a2 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -25,6 +25,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/psci.h>
>  #include <asm/acpi.h>
> +#include <asm/coloring.h>
>=20
>  /*
>   * While a 64-bit OS can make calls with SMC32 calling conventions, for
> @@ -49,7 +50,8 @@ int call_psci_cpu_on(int cpu)
>  {
>      struct arm_smccc_res res;
>=20
> -    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> __pa(init_secondary),
> +    arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu),
> +                  __pa(virt_boot_xen((vaddr_t)init_secondary)),
>                    &res);
>=20
>      return PSCI_RET(res);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 13b10515a8..294b806120 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -924,6 +924,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>      struct domain *d;
>      int rc;
>      paddr_t xen_paddr =3D (paddr_t)(_start + boot_phys_offset);
> +    uint32_t xen_size =3D (_end - _start);
>=20
>      dcache_line_bytes =3D read_dcache_line_bytes();
>=20
> @@ -952,13 +953,16 @@ void __init start_xen(unsigned long
> boot_phys_offset,
>      if ( !coloring_init() )
>          panic("Xen Coloring support: setup failed\n");
>=20
> +    xen_size =3D XEN_COLOR_MAP_SIZE;
> +#ifdef CONFIG_COLORING
> +    xen_paddr =3D get_xen_paddr(xen_size);
> +#endif
> +
>      /* Register Xen's load address as a boot module. */
> -    xen_bootmodule =3D add_boot_module(BOOTMOD_XEN, xen_paddr,
> -                             (paddr_t)(uintptr_t)(_end - _start + 1), fa=
lse);
> +    xen_bootmodule =3D add_boot_module(BOOTMOD_XEN, xen_paddr,
> xen_size, false);
>      BUG_ON(!xen_bootmodule);
>=20
>      setup_pagetables(boot_phys_offset, xen_paddr);
> -
>      setup_mm();
>=20
>      /* Parse the ACPI tables for possible boot-time configuration */
> @@ -1072,6 +1076,17 @@ void __init start_xen(unsigned long
> boot_phys_offset,
>=20
>      setup_virt_paging();
>=20
> +    /*
> +     * This removal is useful if cache coloring is enabled but
> +     * it should not affect non coloring configuration.
> +     * The removal is done earlier than discard_initial_modules
> +     * beacuse in do_initcalls there is the livepatch support
> +     * setup which uses the virtual addresses starting from
> +     * BOOT_RELOC_VIRT_START.
> +     * Remove coloring mappings to expose a clear state to the
> +     * livepatch module.
> +     */
> +    remove_early_mappings(BOOT_RELOC_VIRT_START, SZ_2M);
>      do_initcalls();
>=20
>      /*
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7bfd0a73a7..5ef68976c9 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -438,6 +438,7 @@ int __cpu_up(unsigned int cpu)
>  {
>      int rc;
>      s_time_t deadline;
> +    vaddr_t *smp_up_cpu_addr;
>=20
>      printk("Bringing up CPU%d\n", cpu);
>=20
> @@ -453,10 +454,22 @@ int __cpu_up(unsigned int cpu)
>      /* Tell the remote CPU what its logical CPU ID is. */
>      init_data.cpuid =3D cpu;
>=20
> +    /*
> +     * If coloring is enabled, non-Master CPUs boot using the old Xen co=
de.
> +     * During the boot process each cpu is booted one after another usin=
g the
> +     * smp_cpu_cpu variable. This variable is accessed in head.S using i=
ts
> +     * physical address.
> +     * That address is calculated using the physical offset of the old X=
en
> +     * code. With coloring we can not rely anymore on that offset. For t=
his
> +     * reason in order to boot the other cpus we rely on the old xen cod=
e that
> +     * was mapped during tables setup in mm.c so that we can use the old
> physical
> +     * offset and the old head.S code also. In order to modify the old X=
en
> code
> +     * we need to access it using the mapped done in color_xen.
> +     */
> +    smp_up_cpu_addr =3D (vaddr_t *)virt_boot_xen((vaddr_t)&smp_up_cpu);
> +    *smp_up_cpu_addr =3D cpu_logical_map(cpu);
>      /* Open the gate for this CPU */
> -    smp_up_cpu =3D cpu_logical_map(cpu);
> -    clean_dcache(smp_up_cpu);
> -
> +    clean_dcache(*smp_up_cpu_addr);
>      rc =3D arch_cpu_up(cpu);
>=20
>      console_end_sync();
> --
> 2.30.2
>=20


