Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C193D4E7448
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294706.501236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXk55-0005TU-Kg; Fri, 25 Mar 2022 13:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294706.501236; Fri, 25 Mar 2022 13:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXk55-0005OY-Gl; Fri, 25 Mar 2022 13:34:19 +0000
Received: by outflank-mailman (input) for mailman id 294706;
 Fri, 25 Mar 2022 13:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXk53-0005Lx-Gs
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:34:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 438e5c04-ac40-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 14:34:15 +0100 (CET)
Received: from AM6PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::43)
 by AM9PR08MB6770.eurprd08.prod.outlook.com (2603:10a6:20b:300::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 13:32:10 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::78) by AM6PR10CA0030.outlook.office365.com
 (2603:10a6:209:89::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 13:32:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 13:32:10 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Fri, 25 Mar 2022 13:32:09 +0000
Received: from ca3723011d37.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5262C9C-3157-44C7-8DE5-EC5F6F578C2E.1; 
 Fri, 25 Mar 2022 13:32:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca3723011d37.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 13:32:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5056.eurprd08.prod.outlook.com (2603:10a6:803:116::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 25 Mar
 2022 13:32:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 13:32:00 +0000
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
X-Inumbo-ID: 438e5c04-ac40-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq5LMC4vYw5dd6bDd9dse2Lz56fxYoToWQq4YNqoXKM=;
 b=LeYqZDzeN+mNr95xSa46dyIDLtdJ28cI9DxrhG+dEKoL9AaxDiUvoI9SBeCTxJUlzTmWWWo0ybPqdoKbKSd4FvSIdubCtlWEOFpjm6bL8TEtP7sH/Cd0Q/b7EINwSMl2H3Oa7wcz9afFWSI/294geoQW485rg9bsl/heABkLULI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8dc5ca994dce2fb2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSXfNU2OsYzJ/R+aWsANkfnCawVEjmn5ynPIKeljUuHy8gQrsZVuH79iwWh99O3dlR/SLp8ayUk0JJ/+S/3mbX9eULMwiaXi5UtrSndzEbBFyLIUMy/6rH9HpKKixU3hyXGRs+UOPGgAnMp+1oOrInyGR4VDwspbhB5tor2XkYpp271vs4bQ08OMYu0uEjPYTd0NhzTqwa7/TppM/zjVj2SAK82OknHZmKPx50oKvb6diIPyNve//82yWKzbzHc67OiQmaZZ34dh0LS93UZwwmzwkzR0WkImCoLNRo64j9uFowuLJAswGnc2vUs+YPksaYgvyd9CK+QISMGg73lhgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq5LMC4vYw5dd6bDd9dse2Lz56fxYoToWQq4YNqoXKM=;
 b=E0GefJKQ+94iJTFDPM3tvBu3NXDT7hP9DfXJlcoWeE5SKJYqCYXIrELOz14Iw2gx4+B+UHzsAFOWLdSBvKqps9+sP8mApJV4JNmVtgDA0IRStF4uKhB8fjLoNaiBN6KU3r38FbvRb9qqeym7N8hqfto4IdHZlzm09GbXSv8DtJr87X/4Tv4MFZlo5g/q415Glzqqp06oKQV3TU4MOyu/bKmM9ICrHQoDFxm/aBJcoy7/lSqiDsbWK6BizPn/myyZLZo7lJU+4Hn9AJ/zC2iNQM8QeR0LYrZyX/QhdDsJ9CC8rxo5rvaT77/p/HKw3P2C+sjC4/TjMM8gT6aM0bDQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq5LMC4vYw5dd6bDd9dse2Lz56fxYoToWQq4YNqoXKM=;
 b=LeYqZDzeN+mNr95xSa46dyIDLtdJ28cI9DxrhG+dEKoL9AaxDiUvoI9SBeCTxJUlzTmWWWo0ybPqdoKbKSd4FvSIdubCtlWEOFpjm6bL8TEtP7sH/Cd0Q/b7EINwSMl2H3Oa7wcz9afFWSI/294geoQW485rg9bsl/heABkLULI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien GralL
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 3/5] xen/arm: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH early-RFC 3/5] xen/arm: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHYM6fbg4sguhQUtUmDN0Bua8GsbazQMhkA
Date: Fri, 25 Mar 2022 13:32:00 +0000
Message-ID: <7A115ECF-66CD-4B9A-AD98-53A92F91269E@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-4-julien@xen.org>
In-Reply-To: <20220309112048.17377-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f8cda681-965b-428a-dd84-08da0e63dd3e
x-ms-traffictypediagnostic:
	VE1PR08MB5056:EE_|VE1EUR03FT037:EE_|AM9PR08MB6770:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB67704C7F723AAE5DFD61C85C9D1A9@AM9PR08MB6770.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MAN2x7QsK4IEnzQLJ4OweYzVG97hqZjBB/VjAJjVz99AUJNgdM9Sea+RwTxZMdzX/ky6RSu9aWaQvCy5QAknwlemE2e8rgHx3f1OMYyhv1Ty/0BJtp/1CpIl8Bi6w4RgcNm+4Tj/xq8cAE2f/znRh0/FFsdJlKc5X0npQBgBs0F9368NbkRdqlXJFgXAfrxlATww44S6vJND/ypQTs1p+W2moyqpaQdZfp00dWrHh+H9NZwuc5ZuqOwr+aAXJtz+ZQNrRGpEOHZ7g2uZxiPaBHcG7Iifp8ZFJBQvGuCa3jWWde6gF92X0FuakFwt2EOz/S0X2wjNjX72MG490t22JBeSHmx+Mjij92luyBj6dz+El8oqObwXXirnGbpzj3/MqSoRD+siKNtfx7A/dODrX7sLPSeGVREmPMbhg5sk/fJc5LBYc4AOSvbaiykwcgemZeoo0ABfOs1dhOs29yBSt+ui/Bwx5FTy/N1ffe8j9rlt8YK1kvJ9sUw1hrAni5D8V1q5DrE4SbmQUgHk1jnn5bqVeWQIX934nrMZbBLN+BLz0IOwrJK/1FsrNW+OEnaK1CFLG3kGMY6N9c57gLg6j4xwCx2238DltJ3Tf43kcWY/OQ8h1zWXeXkWTqvwrfOMoFuo+BwzXmqncBYouPkH4lGtJY44RlHb2UVa5NXocsycKriPPr4USNGhE0wP8j8jJodbfX4qSqPTRI9W1Tf7tMtwf3qmlim3PvMa2hpC8RJsGjxgT2MnBtDj702ZGBC++YqGKta9emlWwixQCj25mA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(5660300002)(66946007)(508600001)(316002)(122000001)(86362001)(6916009)(38100700002)(6486002)(2906002)(38070700005)(6506007)(2616005)(4326008)(91956017)(66556008)(54906003)(71200400001)(53546011)(186003)(36756003)(8676002)(76116006)(26005)(66446008)(8936002)(64756008)(83380400001)(66476007)(6512007)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5227C022C2359147AE9F18A41D65456A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5056
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af81a4a7-9bad-4a3f-d13d-08da0e63d7a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUHOzTug4VLVwsxTfF52xR54ARoZ6l+J5JHIvYMOaXV95nqsi2hK226HyQ9/2Z7l123pGL49wDxoOm4yGLgjQ79bfDXcoy11mtdjZ7jH+cd0MNCGfQlk7mX6SkYZefzBIftAevtL9G1kuS9iwZsQsQHCyAMhir/R/Bs5xHseSXQCiCjb7o8ELtN2VWhsAQ0O9+vGlE1X89+9vXAGQIUsoul3LDB6QTT5nhuLszxFTsOsrgdxh1mSTZXlym4YL8Zcbj8vkJBEa5NzUQhMHF6oMLprGE0IMLm7p5yqZXxUgjTJFCf1ztJ8weVHHEIOfOutUpg9ekKsAYJVRekrXvC6Llkxm+Mt5Ff8Q+71dUS/tMgDXgRSoSZTZ2+corf+MWyYqnEfzVdGkog6ja4rcN6pL1bl3Nk9rP/o4CRh/m8VRwnPV63pTtWj7PxvA83CCSxQtaMJpAZVc7uVJ7vplZxXd8IfqohlOI20M5LqjAi1k0PEHwo61Q9v0bHi2kKmQQ1Fc5dmSjlqGCBWqG7PcUOgcF1cYKYuU55xc31krKAqV0wjr/+qIqpyizgfm6nCbPfoYtkjCOPdFdEcZS2uVwwtbflXQxRWj4NzLHOo2yTzbdxS2oXGgIgHU5RXcBTuwyrD2/QIodJjCojweYMOnXZLuJ7Sk+PwdIXfXTXMEKf4shxASAgPZb0mbeRuuxhIvLzk9Nl3oNOchDjMYdXauRlIOQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6506007)(6512007)(107886003)(33656002)(53546011)(186003)(8936002)(82310400004)(6862004)(70586007)(4326008)(26005)(6486002)(86362001)(54906003)(70206006)(8676002)(36756003)(508600001)(316002)(2616005)(5660300002)(40460700003)(36860700001)(2906002)(47076005)(336012)(81166007)(83380400001)(356005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 13:32:10.1694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cda681-965b-428a-dd84-08da0e63dd3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6770

Hi Julien,

> On 9 Mar 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien GralL <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer ference would lead to acces=
s
> to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new helpers are introduced:
>    - prepare_identity_mapping() will setup the page-tables so it is
>      easy to create the mapping afterwards.
>    - update_identity_mapping() will create/remove the identity mapping

Nit: Would be better to first say what the patch is doing and then explaini=
ng
the NULL pointer possible issue.

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> xen/arch/arm/include/asm/mm.h |  2 +
> xen/arch/arm/mm.c             | 73 +++++++++++++++++++++++++++++++++++
> 2 files changed, 75 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index 045a8ba4bb63..76973ea9a0ff 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -177,6 +177,8 @@ extern unsigned long total_pages;
>=20
> /* Boot-time pagetable setup */
> extern void setup_pagetables(unsigned long boot_phys_offset);
> +/* Enable/disable the identity mapping */
> +extern void update_identity_mapping(bool enable);
> /* Map FDT in boot pagetable */
> extern void *early_fdt_map(paddr_t fdt_paddr);
> /* Remove early mappings */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 75ed9a3ce249..5c4dece16f7f 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -138,6 +138,12 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
> static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
> #endif
>=20
> +#ifdef CONFIG_ARM_64
> +static DEFINE_PAGE_TABLE(xen_first_id);
> +static DEFINE_PAGE_TABLE(xen_second_id);
> +static DEFINE_PAGE_TABLE(xen_third_id);
> +#endif
> +
> /* Common pagetable leaves */
> /* Second level page tables.
>  *
> @@ -573,6 +579,70 @@ void __init remove_early_mappings(void)
>     BUG_ON(rc);
> }
>=20
> +/*
> + * The identity mapping may start at physical address 0. So don't want
> + * to keep it mapped longer than necessary.
> + *
> + * When this is called, we are still using the boot_pgtable.
> + *
> + * XXX: Handle Arm32 properly.
> + */
> +static void prepare_identity_mapping(void)
> +{
> +    paddr_t id_addr =3D virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    printk("id_addr 0x%lx\n", id_addr);

Debug print that should be removed.

> +#ifdef CONFIG_ARM_64
> +    if ( id_offsets[0] !=3D 0 )
> +        panic("Cannot handled ID mapping above 512GB\n");

The error message here might not be really helpful for the user.
How about saying that Xen cannot be loaded in memory with
a physical address above 512GB ?

> +#endif
> +
> +    /* Link first ID table */
> +    pte =3D pte_of_xenaddr((vaddr_t)xen_first_id);
> +    pte.pt.table =3D 1;
> +    pte.pt.xn =3D 0;
> +
> +    write_pte(&boot_pgtable[id_offsets[0]], pte);
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
> +
> +    /*
> +     * Link the identity mapping in the runtime Xen page tables. No need=
 to
> +     * use write_pte here as they are not live yet.
> +     */
> +    xen_pgtable[id_offsets[0]] =3D boot_pgtable[id_offsets[0]];
> +}
> +
> +void update_identity_mapping(bool enable)

You probably want an __init attribute here.

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
> /*
>  * After boot, Xen page-tables should not contain mapping that are both
>  * Writable and eXecutables.
> @@ -609,6 +679,9 @@ void __init setup_pagetables(unsigned long boot_phys_=
offset)
>=20
>     phys_offset =3D boot_phys_offset;
>=20
> +    /* XXX: Find a better place to call it */

Why do you think this place is not right ?

> +    prepare_identity_mapping();
> +
> #ifdef CONFIG_ARM_64
>     pte =3D pte_of_xenaddr((uintptr_t)xen_first);
>     pte.pt.table =3D 1;
> --=20
> 2.32.0

Cheers
Bertrand


