Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EF49F6E9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 11:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261923.453803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOES-0000xD-Qp; Fri, 28 Jan 2022 10:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261923.453803; Fri, 28 Jan 2022 10:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDOES-0000tg-Mr; Fri, 28 Jan 2022 10:11:52 +0000
Received: by outflank-mailman (input) for mailman id 261923;
 Fri, 28 Jan 2022 10:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4Sn=SM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nDOEQ-0000s3-BV
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 10:11:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af0a6179-8022-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 11:11:46 +0100 (CET)
Received: from DB6PR0202CA0034.eurprd02.prod.outlook.com (2603:10a6:4:a5::20)
 by AS8PR08MB7125.eurprd08.prod.outlook.com (2603:10a6:20b:400::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 10:11:30 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::4a) by DB6PR0202CA0034.outlook.office365.com
 (2603:10a6:4:a5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 10:11:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 10:11:30 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 28 Jan 2022 10:11:30 +0000
Received: from c5a7acb58fdd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF419B7E-F674-479A-8B7B-ED30EFADF423.1; 
 Fri, 28 Jan 2022 10:11:23 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5a7acb58fdd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Jan 2022 10:11:23 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by DBBPR08MB5961.eurprd08.prod.outlook.com
 (2603:10a6:10:203::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 10:11:22 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7de6:3b44:c82d:a94f]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::7de6:3b44:c82d:a94f%3]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 10:11:22 +0000
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
X-Inumbo-ID: af0a6179-8022-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuG/PccR1TLXTUgY3vQA/s5khnbwFBufd/AeSVguk7Y=;
 b=5PRvUz1QjzHmMMzADs758qJ3qtAw65ephlzopbw7bMt8aaCjsdVtMNYy3d3W4F5mF8A1taNi1bWABX2Kl5bN8uwE15wkidZ5Yikk9zUjjZ4Qdactjh6FLcr8/pv4qvTo9FsS9kt9Z3KVOkNRV6PDei7vfrpf7JRVy7wiF9DW8PI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35d38b24fbccdea4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/jTVvhz3Eyw3kIzXZ6OmjYlOtE02bXufzAAb86WNPChiLvwS88sAl4QSUgY/Ni7ZEssFzuOuFP9D59mVHGkOzfJijU840+k8HsiHp0hDUUpxWd706LSmMKJabgH9SzcM4umsdWt/X5yrtfSVDeFlVyorU+ZtFU6VFla5L/mA4koKdu/wUGIHi5z65L0A7D7k+s1wpNRJFn8425JukpYsNqWRL+1qDCN/lYMug4u74UCx58tRhxZEETF9In9X4paCISPsToLGba+vAj2hegIlmbYCPtF+7zm2/2tb0HK5rR92PUy02EIdDnY7q9LDtsR+T5Mk0kGIt79Epl7/n/Pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuG/PccR1TLXTUgY3vQA/s5khnbwFBufd/AeSVguk7Y=;
 b=jmB3AzJc5MrDYdT3GCqDMbn033AJxEQS35BFh1E4SmZVCaIE25ilyw5wKiRkivUX3i8phtnvRyujNzjeFVNX+SUWdBns+DPtiXzsjgScVbxfOYz7oyk47Z5QDLDlNtPbUUpTiPSgXaaH+UyZHlxpvmgtdPQ5M+39b5u0DzjfsK1XsbxBXvq8UGyR+S5cmOl16OzOMV2I6C88SUohLDxlJEM+Q6EuiRg9kTzvM3a6GMDoWEBMp5avHboQPv43QvCGRDJw1CiIZZ6e5HtOsZ62zGFhCQ7pyYK3nd5pH5pmz5yrlXkrtRUg/vI70Z6AWzrTvy6tv3sulI0pkVBH4iXU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuG/PccR1TLXTUgY3vQA/s5khnbwFBufd/AeSVguk7Y=;
 b=5PRvUz1QjzHmMMzADs758qJ3qtAw65ephlzopbw7bMt8aaCjsdVtMNYy3d3W4F5mF8A1taNi1bWABX2Kl5bN8uwE15wkidZ5Yikk9zUjjZ4Qdactjh6FLcr8/pv4qvTo9FsS9kt9Z3KVOkNRV6PDei7vfrpf7JRVy7wiF9DW8PI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Topic: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Index: AQHYE7gPNcv17HiKsEavKTW33N9/cqx4N1uA
Date: Fri, 28 Jan 2022 10:11:22 +0000
Message-ID: <D2AF70F5-594B-42AE-82DB-CA10F3B1501B@arm.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
 <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b45807e0-e050-4e73-43b1-08d9e2468dd6
x-ms-traffictypediagnostic:
	DBBPR08MB5961:EE_|DB5EUR03FT003:EE_|AS8PR08MB7125:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7125AE395D845CB00A746839FC229@AS8PR08MB7125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0d0XKPsN6CHzVH455vtJYnr7+kvdYbL60SjR5iuk3Lb9h9pyvIRP3PemjqKB2eG/zjuOJmKCd/eXSgowJXRHUdrx7ydn6RVsiA89t3ohiAqrHV3+GGXoSFIFyFIPDf6Dhta9gBogUgpORsn1vvrArBiLAHqS4lGLAu9jBknfyfeY0xoyCxODoVWwi8o70drdtmGNiJY0NyhE7IlRpc744t8eTnrvF0XbK6m05b7uO+enzPRuuhxnaGHmEqLHWAPYpOhu8nZHIUBGKbTPzP7MFeohV8WrgKF/lhulRayaT8Gk87+fcGzFoeIuYAqUMahpvUOfe/9QMBaQJBJiGat8qq4N5hkyV0JjD3+0Y73bUWfS0Lkln57OLj4qfVTwdmHYt0N+KDXPmsNCyvu4QoTlPDlYmosVjL0C7qmdbQOp7MCa8M3RqEahFMIDfm2QpCD6SAqGEbu2p3+Ohy2XwBRoB9ybn1lxhnjCS646jF5YsmvBq30gYo5ngsI1n+YRuOF0fWIaFtNJhN9Y/pxItWCGZRVwalNBrWTCrzSpJGoFTKwTuTWSDjqEhsalx25WZ2riNeL8oPqOwnuUHH8Op4y7u9MzN8D98K8mTD6JH+0b87NRkaTN3ThMR2QkP/LJelmnRvKB56AkPsQ7CC9oEadSyWMs9u1Ya2kU0aNjq8BM3pZcIiCofKuiJ8XZ+kvhecJTQUFvzSFzE8613UmAIOI3K37OilDrMPpmElYibkmQ7CPiHx3eiM5wpfNJbOK5EloW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(2906002)(38100700002)(186003)(53546011)(26005)(6506007)(2616005)(5660300002)(6512007)(71200400001)(36756003)(4326008)(6916009)(508600001)(6486002)(91956017)(66476007)(33656002)(8676002)(66446008)(8936002)(76116006)(64756008)(54906003)(38070700005)(66946007)(66556008)(316002)(83380400001)(86362001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A6DC8C8E2BABBE4AA6AF0AFBB40B1F6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13b72d42-2110-41e8-4f18-08d9e24688f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CiVIVEoKwtAcU61OTs9rV1QuIPk1tUqLmakpBsXzatnenzuPMOGvmyn9ndnoZ/y1mWgxslhu0gCk0cNS0xEnZ6BPuC3/8bWJVNiy8KSW1skgsf4hV2it672LFLrf3qPZQzh0EraKD6++DtBR2wNuTFBd0FljOA2OzfM2iCp1mKIcKeanESE5fdv+G9oe36ztokmtWcmG1q8dDEPgAN6vgaVFDQZMSNOojq0/PdNS93NdaR8K7p622YdaCiSanNgaSwHMow9o7WC8c1PI662vmL1mouAtYz4wcviBD2ozvQ40kSX5S2LNQZ4SsanjhIU0gjv+SB0RBkMCyPLJZI0Kci8MSryCTTE5btRn6vGEyLFi2TTCtdW34q6YhbQDKLtk2WcfLvx2Fe3EEEFRQGcFgMUfXDqWGzARmVuLYTqBzjC7yJsfpVRMiq8wKwpTzIhWoyru5RE+lnTnhLLODa5OicRpAwOm52IE5mQEy15xC64rO1DSfCk7M3yhqm6M5mc4zc9TA9sq+cLGwwix0QvaOQA5tL+vB9XrzalD2Fh8dgh6YNEXmcIsf42hAHzQ9AzO3WPrON1VGlY0nVHqB3RM6e3LdS2mqQGIpOuFAc7eBIHy+lpg7vMTh7tWG84y/OXVl1p5s1kesOGFrpJ7D5XsLPlIGpmwvEBIJMCD51zQM6ws2SiIBFilsWmlMeX+/Zi5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(2906002)(86362001)(316002)(6486002)(2616005)(81166007)(36860700001)(356005)(6506007)(508600001)(54906003)(33656002)(186003)(26005)(82310400004)(40460700003)(70206006)(4326008)(5660300002)(83380400001)(107886003)(70586007)(336012)(36756003)(6512007)(8936002)(6862004)(53546011)(8676002)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 10:11:30.4697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45807e0-e050-4e73-43b1-08d9e2468dd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7125

Hi Oleksandr,

> On 27 Jan 2022, at 7:55 pm, Oleksandr Tyshchenko <olekstysh@gmail.com> wr=
ote:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> All IOMMU drivers on Arm perform almost the same generic actions in
> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
> in order to get rid of code duplication.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by:: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Changes V1 -> V2:
>   - add R-b
>=20
> Changes V2 -> V3:
>   - drop platform specific *_iommu_hwdom_init(), make .hwdom_init
>     to directly point to the common arch_iommu_hwdom_init()
> ---
> xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
> xen/drivers/passthrough/arm/ipmmu-vmsa.c | 15 +--------------
> xen/drivers/passthrough/arm/smmu-v3.c    | 17 +----------------
> xen/drivers/passthrough/arm/smmu.c       | 17 +----------------
> 4 files changed, 10 insertions(+), 46 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthroug=
h/arm/iommu.c
> index ee653a9..fc45318 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -134,6 +134,13 @@ void arch_iommu_domain_destroy(struct domain *d)
>=20
> void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> {
> +    /* Set to false options not supported on ARM. */
> +    if ( iommu_hwdom_inclusive )
> +        printk(XENLOG_WARNING "map-inclusive dom0-iommu option is not su=
pported on ARM\n");
> +    iommu_hwdom_inclusive =3D false;
> +    if ( iommu_hwdom_reserved =3D=3D 1 )
> +        printk(XENLOG_WARNING "map-reserved dom0-iommu option is not sup=
ported on ARM\n");
> +    iommu_hwdom_reserved =3D 0;
> }
>=20
> /*
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index c912120..d2572bc 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1329,19 +1329,6 @@ static int ipmmu_iommu_domain_init(struct domain *=
d)
>     return 0;
> }
>=20
> -static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
> -{
> -    /* Set to false options not supported on ARM. */
> -    if ( iommu_hwdom_inclusive )
> -        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu option is=
 not supported on ARM\n");
> -    iommu_hwdom_inclusive =3D false;
> -    if ( iommu_hwdom_reserved =3D=3D 1 )
> -        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option is =
not supported on ARM\n");
> -    iommu_hwdom_reserved =3D 0;
> -
> -    arch_iommu_hwdom_init(d);
> -}
> -
> static void ipmmu_iommu_domain_teardown(struct domain *d)
> {
>     struct ipmmu_vmsa_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> @@ -1369,7 +1356,7 @@ static void ipmmu_iommu_domain_teardown(struct doma=
in *d)
> static const struct iommu_ops ipmmu_iommu_ops =3D
> {
>     .init            =3D ipmmu_iommu_domain_init,
> -    .hwdom_init      =3D ipmmu_iommu_hwdom_init,
> +    .hwdom_init      =3D arch_iommu_hwdom_init,
>     .teardown        =3D ipmmu_iommu_domain_teardown,
>     .iotlb_flush     =3D ipmmu_iotlb_flush,
>     .iotlb_flush_all =3D ipmmu_iotlb_flush_all,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index d115df7..71b022f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3402,21 +3402,6 @@ static int arm_smmu_iommu_xen_domain_init(struct d=
omain *d)
>=20
> }
>=20
> -static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> -{
> -	/* Set to false options not supported on ARM. */
> -	if (iommu_hwdom_inclusive)
> -		printk(XENLOG_WARNING
> -		"map-inclusive dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_inclusive =3D false;
> -	if (iommu_hwdom_reserved =3D=3D 1)
> -		printk(XENLOG_WARNING
> -		"map-reserved dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_reserved =3D 0;
> -
> -	arch_iommu_hwdom_init(d);
> -}
> -
> static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
> {
> 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> @@ -3427,7 +3412,7 @@ static void arm_smmu_iommu_xen_domain_teardown(stru=
ct domain *d)
>=20
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
> 	.init		=3D arm_smmu_iommu_xen_domain_init,
> -	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
> +	.hwdom_init		=3D arch_iommu_hwdom_init,
> 	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
> 	.iotlb_flush		=3D arm_smmu_iotlb_flush,
> 	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index c9dfc4c..b186c28 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2849,21 +2849,6 @@ static int arm_smmu_iommu_domain_init(struct domai=
n *d)
> 	return 0;
> }
>=20
> -static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> -{
> -	/* Set to false options not supported on ARM. */
> -	if ( iommu_hwdom_inclusive )
> -		printk(XENLOG_WARNING
> -		"map-inclusive dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_inclusive =3D false;
> -	if ( iommu_hwdom_reserved =3D=3D 1 )
> -		printk(XENLOG_WARNING
> -		"map-reserved dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_reserved =3D 0;
> -
> -	arch_iommu_hwdom_init(d);
> -}
> -
> static void arm_smmu_iommu_domain_teardown(struct domain *d)
> {
> 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> @@ -2874,7 +2859,7 @@ static void arm_smmu_iommu_domain_teardown(struct d=
omain *d)
>=20
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
>     .init =3D arm_smmu_iommu_domain_init,
> -    .hwdom_init =3D arm_smmu_iommu_hwdom_init,
> +    .hwdom_init =3D arch_iommu_hwdom_init,
>     .add_device =3D arm_smmu_dt_add_device_generic,
>     .teardown =3D arm_smmu_iommu_domain_teardown,
>     .iotlb_flush =3D arm_smmu_iotlb_flush,
> --=20
> 2.7.4
>=20
>=20


