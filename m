Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6DD54BAEF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 21:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349430.575546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1CVt-00060E-Tv; Tue, 14 Jun 2022 19:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349430.575546; Tue, 14 Jun 2022 19:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1CVt-0005wm-QB; Tue, 14 Jun 2022 19:47:45 +0000
Received: by outflank-mailman (input) for mailman id 349430;
 Tue, 14 Jun 2022 19:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hGAl=WV=epam.com=prvs=8164eafd99=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1o1CVr-0005wg-4z
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 19:47:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d67cf6e8-ec1a-11ec-a26a-b96bd03d9e80;
 Tue, 14 Jun 2022 21:47:36 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EF8Nvw031235;
 Tue, 14 Jun 2022 19:47:24 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3gpspd1ydt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jun 2022 19:47:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GVXPR03MB8377.eurprd03.prod.outlook.com (2603:10a6:150:69::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 19:47:19 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::28d9:fd20:dee0:74ed]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::28d9:fd20:dee0:74ed%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 19:47:18 +0000
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
X-Inumbo-ID: d67cf6e8-ec1a-11ec-a26a-b96bd03d9e80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBxRDvLFH+eg/KdyDP4wnirhXOtPhfTUuea04yxfi5Sz7KCC9ybCxkCOkvEDt33lTqwlfIO5stwDbHyvcHqVRnLBjepUFEeXDyNumLIu0HtmIWA6C1BuXXmJeQqCv54oNdbTe8p8tcLMS6M5zMvDulmrmV0qUPXowW235vMCv8hVh49HwlfnctrQicgwzWPtptx65WQ+houZ66IrbQUkVUbCx5Wme3K53XYaNXH4C5TFjV5xUF/OAFtJOskwG9N9XHkHgYDByIVns8jJK/vn2fgBfaIex8MXJHMU8vMPQhRb8mVdxC1p8Z+eYKcuct02h7zVvZH5RjUnotSme5PneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/VZeNmCI+t75rH8SSSwgbgIgw40gnJQFwui79ueasc=;
 b=PkQeOA9nGW0cPZp48ns1/JUe026ZF6Z0VzSF3RC2KnAv0jCrrqTQIDcDXX+yEZcC0EPNlXBNEPz43tDSmgS4mn4gNR2dauM4eYDJb46lTmFxJl8/dfuAeuflsndgvvTGnbMT9vgiEP5L4deQ5hoUp6m6ykExHaUduXBwQzY/H3/q9QzCQOdzt5PlhSjgDlKLcZJwxV+Vu/zkDnhFGZz89PippptW5+hMfXa3CyoaOhThTFjmi3V75F1fUoOgeXj338FEZH+ioRKDXLxhlCDYyam/qOt/hXgzO2ScpvLvn4BQl8BmtG9yzkwujsClyNitEAy/PHG6joGdBRKPmatpIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/VZeNmCI+t75rH8SSSwgbgIgw40gnJQFwui79ueasc=;
 b=SHj2xIk0qhgacPd58lJMI6R13VtyzMGjinRXGGDhprqc3kTm8/Xf/Q+3oRZEQcq0EYvUGyAYCVMy+b8tjsr8is8KauaN1U/k5tThzD8xWY4wo8VLPXkZ4aUY6xlBeLd+TV2eGWiX8W3AnysOEs5Iz+/ZiFRBpg0am0CIgMBE5F1eplk8nrYhnIIbEcJeLRbgSHvWWITwjyy6NGRQgo/a7j9x8ASgQk3cPVHDoWEe2h0jubsNDYzDU/9M9N/BrDKxPWA0DT5jEf54OxO56Cxyqpd7pXuLuFR6kqYgyveWK5MMyComV5UzP9Vd4t1lvAMlV0PSUxAn7o6d7pKE/WSZhA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 2/2] xen/arm: add FF-A mediator
Thread-Topic: [PATCH v2 2/2] xen/arm: add FF-A mediator
Thread-Index: AQHYe8i7JOdBXrpIHUqTA6m5YZWy9q1PRQQA
Date: Tue, 14 Jun 2022 19:47:18 +0000
Message-ID: <874k0nhvsq.fsf@epam.com>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-3-jens.wiklander@linaro.org>
In-Reply-To: <20220609061812.422130-3-jens.wiklander@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bcb3e99-c45d-41f5-38b4-08da4e3eb0c9
x-ms-traffictypediagnostic: GVXPR03MB8377:EE_
x-microsoft-antispam-prvs: 
 <GVXPR03MB8377EBAE530224C9023D4059E6AA9@GVXPR03MB8377.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y2JG1K7ar0fw+1CVHtsgb6x4y/kjTVJQe5FtqBCpvUjwMYoWO9NHgl38MbbsTcTeSFWykl1i6Ln3PkXPFW8rI+kSK4JJ8PcKs1QaIvFOmaupka1yzEHt2lVAzmIxuC4bluP68jOQZn6gA7mScUJyxuofkpFn1Cgi1GHA1MJnjBL4avc5yYvEFXCuYJ2oHpIFLmbaSU4BznvlBBGZsuYrDXcxsoX3ubmRdxXowCNuWP305Gs8gbJ+XOg6PJIfGVjc8XHD12KRA75KTpSh3CWYq5R1m2aHxH8VvDanyk8ecZuG89UGZIr9ZphsuQa77eYCIvv+b9uZVlMYMTI+eSVob+wAH7eCdpZhFGNm+vpH5UO1HvRUFNdZoJSqOjvRiWaXruTDiAk6XmcP+eOjuFi7UBA5EP2O3d2IqfQMAAh8oZcoF7ZbqEO/CvF6TvDbwZog5nj5I0rKYL3FKyvrXfoDQsZdkjl3xyrefnCLQ96/EpZWCxCuf8fp3lK0PxjqfuD7FIZToJdQ/tCwHa7atnzXhtToI0UDgOhK7RBTqQvFEU2ftSPNEzPJxJGDD7K9Svzn3UThsi/X9z1c8bBZI+3Wlg8oMI+R5zZaOcQdXJw62NmBwtOsAgLBTo+awTjsfMiOxYlNclXdVfq6Q8B1F5+1CnoVUBmSGVHoGFBz5LjQvK6IcN0MNm8sQICm4FFIbUSzKBPuvF3nuZO5Iy03kfsTJfY1H5QwVTWkpqnCewMGPrFwDbfpGTZQ2xequl19cmUFwbNpoNk5JmtCrENnsQEfi/UCOXdESGPbymYx82xqWK4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6512007)(55236004)(38100700002)(8936002)(26005)(6506007)(316002)(122000001)(86362001)(508600001)(6486002)(2906002)(966005)(30864003)(36756003)(8676002)(186003)(5660300002)(71200400001)(91956017)(66556008)(66476007)(66946007)(4326008)(66446008)(64756008)(83380400001)(6916009)(54906003)(76116006)(38070700005)(2616005)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?QIzfIsaVSBvSV9cyxk8ls7CibWP+ginUr0BUNfJ4xNJtvqyYPkRrbSgFIN?=
 =?iso-8859-1?Q?OzG8kaSjjb/+28P1LIYcGFlXeObrEyx5jvNsP1x9NLE0xCdXELO4fyDoFV?=
 =?iso-8859-1?Q?kabU53DEWmdsyGFqAGV42abCQLu5EWlQyKX13BPE8g5aaCBR86eGF11cPu?=
 =?iso-8859-1?Q?CjVvtPzer9Ny9x4IJwUR37gd28BDEqU13Sfi37DPWs670w8ccuQMTI1Wuz?=
 =?iso-8859-1?Q?CtUvmL/OVXG7tqsC7Ud95JBxEbVsSPuNup9DRlogmYWPKpLYNPqhjm5zlC?=
 =?iso-8859-1?Q?6tCYWk5jkHu+KQUSudcD6NCLik9XEVr7w4zogbI+Vqw00u9xO1MME1BC+b?=
 =?iso-8859-1?Q?Ma2/meEZLkiC014xSb9u5xiqNaOz4102dPVIEmtYVToJF/ZkBg6G86bOdP?=
 =?iso-8859-1?Q?rrKMWj//UOv6U8yAFhQX+idn7dSLshvkyThHsSnYJ42rA+n45I7u9ukR6E?=
 =?iso-8859-1?Q?uRJneIK2SAXzMsTOtkbTyVyn3rP0D/IUJh/J/w+qN4hj1dpCRrMQ45CrGV?=
 =?iso-8859-1?Q?4320meE5/QEgPspPa7gmhR982fSzlHnZr0qLTlMs3zeNaKLiNJqoGwZnuD?=
 =?iso-8859-1?Q?xwOcvNPlmzRrZKx8gqRAKu74P4bDDoQQnd1mGYc2H1IvB6zYNKuZonO4r/?=
 =?iso-8859-1?Q?cPyRRuP4xtMrxvoBWjWgi+4O2asGmPypx+KtuYdWLdM4ccmppUhb4HZCvy?=
 =?iso-8859-1?Q?YtBknVoRGSGnuF00wbdsJrVH/EZMW5Qug7RIyjSlhXWas0pl/Z2BzrZthB?=
 =?iso-8859-1?Q?cj4MsKTSJ4/IqwN1H0rF84Pb3AMEDacGJ1aOZTE+nazF/6qvxPzoFy79Ef?=
 =?iso-8859-1?Q?hb7Sotb+sUeECxu1WXeL8IJ9asAmddTb11qk6VwEwROFFEtr3Zbd75iV3X?=
 =?iso-8859-1?Q?+mstZhhGykGtLp0Cvk2EbmHE3Q2Lo6zocgQ5uSe8SlCiIPh4wcMLmbkfqh?=
 =?iso-8859-1?Q?Q9+ysqKtjxzYeO2G+8fKZp3ZZA/vZRPeM6U/e3YEOCJCqjEp6JR9qpAg9N?=
 =?iso-8859-1?Q?QjO040eAGDgOhLxuJeb6sq+8ZQSVJ5rLt+XKQU0qAIPRVl4NR0yQDp1oIs?=
 =?iso-8859-1?Q?R+NPYdTckumV5nZ5Abo9IOhC3Re9VhczK8PmfeuFRh4XmRBvhnSuDVjhXz?=
 =?iso-8859-1?Q?Thz7UlS2EcPPRdN0nUKOolngLE8WiaYdXn+hogb+FeNxMk3wYCCjetXZjS?=
 =?iso-8859-1?Q?R6AGeOyH2iOPjmhQsi6TxTad+qqISj2O/DzE1YcFD2oV6vRsNjbWWALfyx?=
 =?iso-8859-1?Q?4GtIZCtHM/OYOQauIBVTNn3cc32AHgVoMO12HlFc45ZV6uglKVHOIKkLD2?=
 =?iso-8859-1?Q?oFMp9gez9jb6M7ScKuMSwbPMwentVXTVClbtzzaaQ3dOfCu+7Cbzuuof3K?=
 =?iso-8859-1?Q?Bo5kuQqlwhWJwsljq3wZ9KFCiUkmEnDXJ/zufjpqV/vWc1yb8vS4aIzBhf?=
 =?iso-8859-1?Q?hOPMXEorVTkYe+orzeWuoJIPhqChzdDkOIfGz9kPJdC5S7lQ9XdFKzhtws?=
 =?iso-8859-1?Q?IohiGR5alF1f/foDgPmRSs78Y21SXMsB7uN2GQtB6JuVurA3IZdXDNmwc/?=
 =?iso-8859-1?Q?20ANBQ5sypu2gzQv1/tQmu6lYR+aL/E2Mvn+6GES/+0PhDoQfS4zp2IuQ/?=
 =?iso-8859-1?Q?sSwAU+dz6DCt02CF5bCD4ikgAzPMyFYBdros1nLh8oM8zKE/3yGtaTuLAJ?=
 =?iso-8859-1?Q?4PtTB+JsL1WK8EPiMqho1UYyXFu5/W/rcACn8qy/BHMkDwyc6/l49gl1Ez?=
 =?iso-8859-1?Q?oyy0/604YQ13n3ecOx6F7rEnTVjzvIYSlK2YBro+hZ1HbflrgEtk04MjAj?=
 =?iso-8859-1?Q?i+sqw+WwhOHAwOoLywKkmjSL6aWJu/8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcb3e99-c45d-41f5-38b4-08da4e3eb0c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 19:47:18.7106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hsuzx17NbjAfScscZ0djTejrARLm2K2fxBKK0VFejwq4wl6nE5RZnPoJeTrkmzz3iYlvoosm6luw7BkUK+S/aXceTY1XwJ+GSt1dyApX2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8377
X-Proofpoint-GUID: 1LIum5Rf8Yt9aVOgXIhAFTSSz68Crcac
X-Proofpoint-ORIG-GUID: 1LIum5Rf8Yt9aVOgXIhAFTSSz68Crcac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_08,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140072


Hello Jens,

Sorry for late review, I was busy with internal projects.

This is preliminary review. I gave up at scatter-gather operations. Need
more time to review them properly.

One thing that bothers me is that Xen is non-preemptive and there are
plenty potentially long-running operations.

Jens Wiklander <jens.wiklander@linaro.org> writes:

> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>
> The implementation is the bare minimum to be able to communicate with
> OP-TEE running as an SPMC at S-EL1.
>
> This is loosely based on the TEE mediator framework and the OP-TEE
> mediator.
>
> [1] https://urldefense.com/v3/__https://developer.arm.com/documentation/d=
en0077/latest__;!!GF_29dbcQIUBPA!1rn9xKdmcgMXOyZ_CvNIVq-wAS1ZI_Ews1w-Gqt0YP=
wSXyyTJedeFQgD65WhhOwIf_-cIa4EINzmwM4o62XPcMt1cTLcMZ7d$ [developer[.]arm[.]=
com]
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/Kconfig              |   11 +
>  xen/arch/arm/Makefile             |    1 +
>  xen/arch/arm/domain.c             |   10 +
>  xen/arch/arm/ffa.c                | 1624 +++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h |    4 +
>  xen/arch/arm/include/asm/ffa.h    |   71 ++
>  xen/arch/arm/vsmc.c               |   17 +-
>  7 files changed, 1735 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/ffa.c
>  create mode 100644 xen/arch/arm/include/asm/ffa.h
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4d3..5b75067e2745 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,17 @@ config TEE
> =20
>  source "arch/arm/tee/Kconfig"
> =20
> +config FFA
> +	bool "Enable FF-A mediator support" if EXPERT
> +	default n
> +	depends on ARM_64
> +	help
> +	  This option enables a minamal FF-A mediator. The mediator is
> +	  generic as it follows the FF-A specification [1], but it only
> +	  implements a small substet of the specification.
> +
> +	  [1] https://urldefense.com/v3/__https://developer.arm.com/documentati=
on/den0077/latest__;!!GF_29dbcQIUBPA!1rn9xKdmcgMXOyZ_CvNIVq-wAS1ZI_Ews1w-Gq=
t0YPwSXyyTJedeFQgD65WhhOwIf_-cIa4EINzmwM4o62XPcMt1cTLcMZ7d$ [developer[.]ar=
m[.]com]
> +
>  endmenu
> =20
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 1d862351d111..dbf5e593a069 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -20,6 +20,7 @@ obj-y +=3D domain.o
>  obj-y +=3D domain_build.init.o
>  obj-y +=3D domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> +obj-$(CONFIG_FFA) +=3D ffa.o
>  obj-y +=3D gic.o
>  obj-y +=3D gic-v2.o
>  obj-$(CONFIG_GICV3) +=3D gic-v3.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df8638..a93e6a9c4aef 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -27,6 +27,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/current.h>
>  #include <asm/event.h>
> +#include <asm/ffa.h>
>  #include <asm/gic.h>
>  #include <asm/guest_atomics.h>
>  #include <asm/irq.h>
> @@ -756,6 +757,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc =3D tee_domain_init(d, config->arch.tee_type)) !=3D 0 )
>          goto fail;
> =20
> +    if ( (rc =3D ffa_domain_init(d)) !=3D 0 )

So, FFA support will be enabled for each domain? I think that this is
fine for experimental feature, but I want to hear maintainer's opinion.

> +        goto fail;
> +
>      update_domain_wallclock_time(d);
> =20
>      /*
> @@ -998,6 +1002,7 @@ static int relinquish_memory(struct domain *d, struc=
t page_list_head *list)
>  enum {
>      PROG_pci =3D 1,
>      PROG_tee,
> +    PROG_ffa,
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> @@ -1046,6 +1051,11 @@ int domain_relinquish_resources(struct domain *d)
>          if (ret )
>              return ret;
> =20
> +    PROGRESS(ffa):
> +        ret =3D ffa_relinquish_resources(d);
> +        if (ret )

Coding style: if ( ret )

> +            return ret;
> +
>      PROGRESS(xen):
>          ret =3D relinquish_memory(d, &d->xenpage_list);
>          if ( ret )
> diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
> new file mode 100644
> index 000000000000..9063b7f2b59e
> --- /dev/null
> +++ b/xen/arch/arm/ffa.c
> @@ -0,0 +1,1624 @@
> +/*
> + * xen/arch/arm/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2021  Linaro Limited

It is 2022 already :)

> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without restriction,
> + * including without limitation the rights to use, copy, modify, merge,
> + * publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so,
> + * subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=
.
> + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xen/sizes.h>
> +#include <xen/bitops.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/event.h>
> +#include <asm/ffa.h>
> +#include <asm/regs.h>
> +
> +/* Error codes */
> +#define FFA_RET_OK			0
> +#define FFA_RET_NOT_SUPPORTED		-1
> +#define FFA_RET_INVALID_PARAMETERS	-2
> +#define FFA_RET_NO_MEMORY		-3
> +#define FFA_RET_BUSY			-4
> +#define FFA_RET_INTERRUPTED		-5
> +#define FFA_RET_DENIED			-6
> +#define FFA_RET_RETRY			-7
> +#define FFA_RET_ABORTED			-8
> +
> +/* FFA_VERSION helpers */
> +#define FFA_VERSION_MAJOR		_AC(1,U)
> +#define FFA_VERSION_MAJOR_SHIFT		_AC(16,U)
> +#define FFA_VERSION_MAJOR_MASK		_AC(0x7FFF,U)
> +#define FFA_VERSION_MINOR		_AC(1,U)
> +#define FFA_VERSION_MINOR_SHIFT		_AC(0,U)
> +#define FFA_VERSION_MINOR_MASK		_AC(0xFFFF,U)
> +#define MAKE_FFA_VERSION(major, minor)	\
> +	((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
> +	 ((minor) & FFA_VERSION_MINOR_MASK))
> +
> +#define FFA_MIN_VERSION		MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_0		MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1		MAKE_FFA_VERSION(1, 1)
> +#define FFA_MY_VERSION		MAKE_FFA_VERSION(FFA_VERSION_MAJOR, \
> +						 FFA_VERSION_MINOR)
> +
> +
> +#define FFA_HANDLE_HYP_FLAG             BIT(63,ULL)
> +
> +/* Memory attributes: Normal memory, Write-Back cacheable, Inner shareab=
le */
> +#define FFA_NORMAL_MEM_REG_ATTR		_AC(0x2f,U)
> +
> +/* Memory access permissions: Read-write */
> +#define FFA_MEM_ACC_RW			_AC(0x2,U)
> +
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR		BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE	BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH	BIT(2, U)
> +
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (_AC(1,U) << 3)
> +/* Relayer must choose the alignment boundary */
> +#define FFA_MEMORY_REGION_FLAG_ANY_ALIGNMENT	_AC(0,U)
BIT(0, U)?

> +
> +#define FFA_HANDLE_INVALID		_AC(0xffffffffffffffff,ULL)
> +
> +/* Framework direct request/response */
> +#define FFA_MSG_FLAG_FRAMEWORK		BIT(31, U)
> +#define FFA_MSG_TYPE_MASK		_AC(0xFF,U);
> +#define FFA_MSG_PSCI			_AC(0x0,U)
> +#define FFA_MSG_SEND_VM_CREATED		_AC(0x4,U)
> +#define FFA_MSG_RESP_VM_CREATED		_AC(0x5,U)
> +#define FFA_MSG_SEND_VM_DESTROYED	_AC(0x6,U)
> +#define FFA_MSG_RESP_VM_DESTROYED	_AC(0x7,U)
> +
> +/*
> + * Flags used for the FFA_PARTITION_INFO_GET return message:
> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID
> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0,U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1,U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2,U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3,U)
> +#define FFA_PART_PROP_IS_PE_ID          (_AC(0,U) << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (_AC(1,U) << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (_AC(2,U) << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (_AC(3,U) << 4)
> +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6,U)
> +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7,U)
> +#define FFA_PART_PROP_AARCH64_STATE     BIT(8,U)
> +
> +/* Function IDs */
> +#define FFA_ERROR			_AC(0x84000060,U)
> +#define FFA_SUCCESS_32			_AC(0x84000061,U)
> +#define FFA_SUCCESS_64			_AC(0xC4000061,U)
> +#define FFA_INTERRUPT			_AC(0x84000062,U)
> +#define FFA_VERSION			_AC(0x84000063,U)
> +#define FFA_FEATURES			_AC(0x84000064,U)
> +#define FFA_RX_ACQUIRE			_AC(0x84000084,U)
> +#define FFA_RX_RELEASE			_AC(0x84000065,U)
> +#define FFA_RXTX_MAP_32			_AC(0x84000066,U)
> +#define FFA_RXTX_MAP_64			_AC(0xC4000066,U)
> +#define FFA_RXTX_UNMAP			_AC(0x84000067,U)
> +#define FFA_PARTITION_INFO_GET		_AC(0x84000068,U)
> +#define FFA_ID_GET			_AC(0x84000069,U)
> +#define FFA_SPM_ID_GET			_AC(0x84000085,U)
> +#define FFA_MSG_WAIT			_AC(0x8400006B,U)
> +#define FFA_MSG_YIELD			_AC(0x8400006C,U)
> +#define FFA_MSG_RUN			_AC(0x8400006D,U)
> +#define FFA_MSG_SEND2			_AC(0x84000086,U)
> +#define FFA_MSG_SEND_DIRECT_REQ_32	_AC(0x8400006F,U)
> +#define FFA_MSG_SEND_DIRECT_REQ_64	_AC(0xC400006F,U)
> +#define FFA_MSG_SEND_DIRECT_RESP_32	_AC(0x84000070,U)
> +#define FFA_MSG_SEND_DIRECT_RESP_64	_AC(0xC4000070,U)
> +#define FFA_MEM_DONATE_32		_AC(0x84000071,U)
> +#define FFA_MEM_DONATE_64		_AC(0xC4000071,U)
> +#define FFA_MEM_LEND_32			_AC(0x84000072,U)
> +#define FFA_MEM_LEND_64			_AC(0xC4000072,U)
> +#define FFA_MEM_SHARE_32		_AC(0x84000073,U)
> +#define FFA_MEM_SHARE_64		_AC(0xC4000073,U)
> +#define FFA_MEM_RETRIEVE_REQ_32		_AC(0x84000074,U)
> +#define FFA_MEM_RETRIEVE_REQ_64		_AC(0xC4000074,U)
> +#define FFA_MEM_RETRIEVE_RESP		_AC(0x84000075,U)
> +#define FFA_MEM_RELINQUISH		_AC(0x84000076,U)
> +#define FFA_MEM_RECLAIM			_AC(0x84000077,U)
> +#define FFA_MEM_FRAG_RX			_AC(0x8400007A,U)
> +#define FFA_MEM_FRAG_TX			_AC(0x8400007B,U)
> +#define FFA_MSG_SEND			_AC(0x8400006E,U)
> +#define FFA_MSG_POLL			_AC(0x8400006A,U)
> +
> +/* Partition information descriptor */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
> +struct ffa_partition_info_1_1 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +    uint8_t uuid[16];
> +};
> +
> +/* Constituent memory region descriptor */
> +struct ffa_address_range {
> +    uint64_t address;
> +    uint32_t page_count;
> +    uint32_t reserved;
> +};
> +
> +/* Composite memory region descriptor */
> +struct ffa_mem_region {
> +    uint32_t total_page_count;
> +    uint32_t address_range_count;
> +    uint64_t reserved;
> +    struct ffa_address_range address_range_array[];
> +};
> +
> +/* Memory access permissions descriptor */
> +struct ffa_mem_access_perm {
> +    uint16_t endpoint_id;
> +    uint8_t perm;
> +    uint8_t flags;
> +};
> +
> +/* Endpoint memory access descriptor */
> +struct ffa_mem_access {
> +    struct ffa_mem_access_perm access_perm;
> +    uint32_t region_offs;
> +    uint64_t reserved;
> +};
> +
> +/* Lend, donate or share memory transaction descriptor */
> +struct ffa_mem_transaction_1_0 {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t reserved0;
> +    uint32_t flags;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +    uint32_t reserved1;
> +    uint32_t mem_access_count;
> +    struct ffa_mem_access mem_access_array[];
> +};
> +
> +struct ffa_mem_transaction_1_1 {
> +    uint16_t sender_id;
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_count;
> +    uint32_t mem_access_offs;
> +    uint8_t reserved[12];
> +};
> +
> +/*
> + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> + * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> + * data structures between version 1.0 and 1.1. This is just an internal
> + * interface and can be changed without changing any ABI.
> + */
> +struct ffa_mem_transaction_x {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t flags;
> +    uint8_t mem_access_size;
> +    uint8_t mem_access_count;
> +    uint16_t mem_access_offs;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +};
> +
> +/* Endpoint RX/TX descriptor */
> +struct ffa_endpoint_rxtx_descriptor_1_0 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_range_count;
> +    uint32_t tx_range_count;
> +};
> +
> +struct ffa_endpoint_rxtx_descriptor_1_1 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_region_offs;
> +    uint32_t tx_region_offs;
> +};
> +
> +struct ffa_ctx {
> +    void *rx;
> +    void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    unsigned int page_count;
> +    uint32_t guest_vers;
> +    bool tx_is_mine;
> +    bool interrupted;
> +};
> +
> +struct ffa_shm_mem {
> +    struct list_head list;
> +    uint16_t sender_id;
> +    uint16_t ep_id;     /* endpoint, the one lending */
> +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    unsigned int page_count;
> +    struct page_info *pages[];
> +};
> +
> +struct mem_frag_state {
> +    struct list_head list;
> +    struct ffa_shm_mem *shm;
> +    uint32_t range_count;
> +    unsigned int current_page_idx;
> +    unsigned int frag_offset;
> +    unsigned int range_offset;
> +    uint8_t *buf;
> +    unsigned int buf_size;
> +    struct ffa_address_range range;
> +};
> +
> +/*
> + * Our rx/rx buffer shared with the SPMC
> + */
> +static uint32_t ffa_version;
> +static uint16_t *subsr_vm_created;
> +static unsigned int subsr_vm_created_count;
> +static uint16_t *subsr_vm_destroyed;
> +static unsigned int subsr_vm_destroyed_count;
> +static void *ffa_rx;
> +static void *ffa_tx;
> +static unsigned int ffa_page_count;
> +static spinlock_t ffa_buffer_lock =3D SPIN_LOCK_UNLOCKED;
> +
> +static struct list_head ffa_mem_list =3D LIST_HEAD_INIT(ffa_mem_list);
> +static struct list_head ffa_frag_list =3D LIST_HEAD_INIT(ffa_frag_list);
> +static spinlock_t ffa_mem_list_lock =3D SPIN_LOCK_UNLOCKED;
> +
> +static uint64_t next_handle =3D FFA_HANDLE_HYP_FLAG;
> +
> +static uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
> +{
> +    return (uint64_t)reg0 << 32 | reg1;
> +}
> +
> +static void reg_pair_from_64(uint32_t *reg0, uint32_t *reg1, uint64_t va=
l)
> +{
> +    *reg0 =3D val >> 32;
> +    *reg1 =3D val;
> +}
> +
> +static bool ffa_get_version(uint32_t *vers)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_VERSION, .a1 =3D FFA_MY_VERSION,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
> +    {
> +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");
> +        return false;
> +    }
> +
> +    *vers =3D resp.a0;
> +    return true;
> +}
> +
> +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> +                             uint32_t page_count)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +#ifdef CONFIG_ARM_64
> +        .a0 =3D FFA_RXTX_MAP_64,
> +#endif
> +#ifdef CONFIG_ARM_32
> +        .a0 =3D FFA_RXTX_MAP_32,
> +#endif
> +	.a1 =3D tx_addr, .a2 =3D rx_addr,
> +        .a3 =3D page_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 =3D=3D FFA_ERROR )

What if we get SMCCC_NOT_SUPPORTED there?

> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t ffa_rxtx_unmap(uint16_t vm_id)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_RXTX_UNMAP, .a1 =3D vm_id,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 =3D=3D FFA_ERROR )
> +    {

The same question. I believe it is better to test against FFA_SUCCESS.
Also looks like this code can be extracted into some helper function,
because it repeats again and again.

> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_=
t w3,
> +                                       uint32_t w4, uint32_t w5,
> +                                       uint32_t *count)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_PARTITION_INFO_GET, .a1 =3D w1, .a2 =3D w2, .a3 =3D =
w3, .a4 =3D w4,
> +        .a5 =3D w5,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 =3D=3D FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    *count =3D resp.a2;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t ffa_rx_release(void)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D { .a0 =3D FFA_RX_RELEASE, };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 =3D=3D FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> +                             register_t addr, uint32_t pg_count,
> +                             uint64_t *handle)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_SHARE_32, .a1 =3D tot_len, .a2 =3D frag_len, .a3=
 =3D addr,
> +        .a4 =3D pg_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    /*
> +     * For arm64 we must use 64-bit calling convention if the buffer isn=
't
> +     * passed in our tx buffer.
> +     */
> +    if (sizeof(addr) > 4 && addr)
> +        arg.a0 =3D FFA_MEM_SHARE_64;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 ) {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        *handle =3D reg_pair_to_64(resp.a3, resp.a2);
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        *handle =3D reg_pair_to_64(resp.a2, resp.a1);
> +        return resp.a3;
> +    default:
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> +                               uint16_t sender_id)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_FRAG_TX, .a1 =3D handle & UINT32_MAX, .a2 =3D ha=
ndle >> 32,
> +        .a3 =3D frag_len, .a4 =3D (uint32_t)sender_id << 16,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 ) {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        return resp.a3;
> +    default:
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static uint32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> +                                uint32_t flags)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_RECLAIM, .a1 =3D handle_lo, .a2 =3D handle_hi, .=
a3 =3D flags,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    if ( resp.a0 =3D=3D FFA_ERROR )
> +    {
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    return FFA_RET_OK;
> +}
> +
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)
> +{
> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> +    int32_t res;
> +
> +    if ( msg !=3D FFA_MSG_SEND_VM_CREATED && msg !=3DFFA_MSG_SEND_VM_DES=
TROYED )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> +    else
> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 =3D sp_id,
> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 =3D vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D ex=
p_resp ) {
> +            /*
> +             * This is an invalid response, likely due to some error in =
the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res =3D resp.a3;
> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );

How long this loop can ran? XEN is not preemptive unfortunately. So,
maybe we need some way to restart this call.

> +
> +    return res;
> +}
> +
> +static u16 get_vm_id(struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;
> +}
> +
> +static void set_regs(struct cpu_user_regs *regs, register_t v0, register=
_t v1,
> +                     register_t v2, register_t v3, register_t v4, regist=
er_t v5,
> +                     register_t v6, register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_co=
de)
> +{
> +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +}
> +
> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> +                             uint32_t w3)
> +{
> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +}
> +
> +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle=
_lo,
> +                             uint32_t handle_hi, uint32_t frag_offset,
> +                             uint16_t sender_id)
> +{
> +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> +             (uint32_t)sender_id << 16, 0, 0, 0);
> +}
> +
> +static void handle_version(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t vers =3D get_user_reg(regs, 1);
> +
> +    if ( vers < FFA_VERSION_1_1 )
> +        vers =3D FFA_VERSION_1_0;
> +    else
> +        vers =3D FFA_VERSION_1_1;
> +
> +    ctx->guest_vers =3D vers;
> +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +                                register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret =3D FFA_RET_NOT_SUPPORTED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        tx_addr &=3D UINT32_MAX;
> +        rx_addr &=3D UINT32_MAX;
> +    }
> +
> +    /* For now to keep things simple, only deal with a single page */
> +    if ( page_count !=3D 1 )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg =3D get_page_from_gfn(d, gaddr_to_gfn(tx_addr), &t, P2M_ALLOC)=
;
> +    if ( !tx_pg )
> +        return FFA_RET_NOT_SUPPORTED;
> +    /* Only normal RAM for now */
> +    if (t !=3D p2m_ram_rw)
> +        goto err_put_tx_pg;
> +
> +    rx_pg =3D get_page_from_gfn(d, gaddr_to_gfn(rx_addr), &t, P2M_ALLOC)=
;
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;
> +    /* Only normal RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_rx_pg;
> +
> +    tx =3D __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx =3D __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx =3D rx;
> +    ctx->tx =3D tx;
> +    ctx->rx_pg =3D rx_pg;
> +    ctx->tx_pg =3D tx_pg;
> +    ctx->page_count =3D 1;
> +    ctx->tx_is_mine =3D true;
> +    return FFA_RET_OK;
> +
> +err_unmap_tx:
> +    unmap_domain_page_global(tx);
> +err_put_rx_pg:
> +    put_page(rx_pg);
> +err_put_tx_pg:
> +    put_page(tx_pg);
> +    return ret;
> +}
> +
> +static uint32_t handle_rxtx_unmap(void)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t ret;
> +
> +    if ( !ctx-> rx )

coding style: ctx->rx

> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    ret =3D ffa_rxtx_unmap(get_vm_id(d));
> +    if ( ret )
> +        return ret;
> +
> +    unmap_domain_page_global(ctx->rx);
> +    unmap_domain_page_global(ctx->tx);
> +    put_page(ctx->rx_pg);
> +    put_page(ctx->tx_pg);
> +    ctx->rx =3D NULL;
> +    ctx->tx =3D NULL;
> +    ctx->rx_pg =3D NULL;
> +    ctx->tx_pg =3D NULL;
> +    ctx->page_count =3D 0;
> +    ctx->tx_is_mine =3D false;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint=
32_t w3,
> +                                          uint32_t w4, uint32_t w5,
> +                                          uint32_t *count)
> +{
> +    uint32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +
> +    if ( !ffa_page_count )
> +        return FFA_RET_DENIED;
> +
> +    spin_lock(&ffa_buffer_lock);
> +    if ( !ctx->page_count || !ctx->tx_is_mine )
> +        goto out;
> +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    if ( ret )
> +        goto out;
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 ) {
> +        size_t n;
> +        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> +        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> +
> +        for ( n =3D 0; n < *count; n++ ) {
> +            dst[n].id =3D src[n].id;
> +            dst[n].execution_context =3D src[n].execution_context;
> +            dst[n].partition_properties =3D src[n].partition_properties;
> +        }
> +    } else {

Maybe it is worth to check version in this branch? Or at least
put ASSERT(ctx->guest_vers =3D=3D FFA_VERSION_1_1).

> +        size_t sz =3D *count * sizeof(struct ffa_partition_info_1_1);
> +
> +        memcpy(ctx->rx, ffa_rx, sz);
> +    }
> +    ffa_rx_release();
> +    ctx->tx_is_mine =3D false;
> +out:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    return ret;
> +}
> +
> +static uint32_t handle_rx_release(void)
> +{
> +    uint32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +
> +    spin_lock(&ffa_buffer_lock);
> +    if ( !ctx->page_count || ctx->tx_is_mine )
> +        goto out;
> +    ret =3D FFA_RET_OK;
> +    ctx->tx_is_mine =3D true;
> +out:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    return ret;
> +}
> +
> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint3=
2_t fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    struct arm_smccc_1_2_regs resp =3D { };
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +
> +    if ( smccc_is_conv_64(fid) )
> +        mask =3D 0xffffffffffffffff;
> +    else
> +        mask =3D 0xffffffff;
> +
> +    src_dst =3D get_user_reg(regs, 1);

Should you apply mask there?

> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    arg.a1 =3D src_dst;
... or there?


> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> +
> +    while ( true ) {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +
> +        switch ( resp.a0 )
> +        {
> +        case FFA_INTERRUPT:
> +            ctx->interrupted =3D true;
> +            goto out;
> +        case FFA_ERROR:
> +        case FFA_SUCCESS_32:
> +        case FFA_SUCCESS_64:
> +        case FFA_MSG_SEND_DIRECT_RESP_32:
> +        case FFA_MSG_SEND_DIRECT_RESP_64:
> +            goto out;
> +        default:
> +            /* Bad fid, report back. */
> +            memset(&arg, 0, sizeof(arg));
> +            arg.a0 =3D FFA_ERROR;
> +            arg.a1 =3D src_dst;
> +            arg.a2 =3D FFA_RET_NOT_SUPPORTED;
> +            continue;
> +        }
> +    }
> +
> +out:
> +    set_user_reg(regs, 0, resp.a0);
> +    set_user_reg(regs, 2, resp.a2 & mask);
> +    set_user_reg(regs, 1, resp.a1 & mask);
Looks like you need to swap two lines above.

> +    set_user_reg(regs, 3, resp.a3 & mask);
> +    set_user_reg(regs, 4, resp.a4 & mask);
> +    set_user_reg(regs, 5, resp.a5 & mask);
> +    set_user_reg(regs, 6, resp.a6 & mask);
> +    set_user_reg(regs, 7, resp.a7 & mask);
> +}
> +
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         struct ffa_address_range *range, uint32_t range=
_count,
> +                         unsigned int start_page_idx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx =3D start_page_idx;
> +    unsigned long gfn;
> +    unsigned int n;
> +    unsigned int m;
> +    p2m_type_t t;
> +    uint64_t addr;
> +
> +    for ( n =3D 0; n < range_count; n++ ) {
> +        for ( m =3D 0; m < range[n].page_count; m++ ) {
> +            if ( pg_idx >=3D shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            addr =3D read_atomic(&range[n].address);
> +            gfn =3D gaddr_to_gfn(addr + m * PAGE_SIZE);
> +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn, &t, P2M_ALL=
OC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
> +            /* Only normal RAM for now */
> +            if ( t !=3D p2m_ram_rw )
> +                return FFA_RET_DENIED;
> +        }
> +    }
> +
> +    *last_page_idx =3D pg_idx;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static void put_shm_pages(struct ffa_shm_mem *shm)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> +    {
> +        if ( shm->pages[n] ) {
Looks like this check is redundant, you already checking the same in the
`if` block.

> +            put_page(shm->pages[n]);
> +            shm->pages[n] =3D NULL;
> +        }
> +    }
> +}
> +
> +static void init_range(struct ffa_address_range *addr_range,
> +                       paddr_t pa)
> +{
> +    memset(addr_range, 0, sizeof(*addr_range));
> +    addr_range->address =3D pa;
> +    addr_range->page_count =3D 1;
> +}
> +
> +static int share_shm(struct ffa_shm_mem *shm)
> +{
> +    uint32_t max_frag_len =3D ffa_page_count * PAGE_SIZE;
> +    struct ffa_mem_transaction_1_1 *descr =3D ffa_tx;
> +    struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_region *region_descr;
> +    struct ffa_address_range *addr_range;
> +    paddr_t pa;
> +    paddr_t last_pa;
> +    unsigned int n;
> +    uint32_t frag_len;
> +    uint32_t tot_len;
> +    int ret;
> +    unsigned int range_count;
> +    unsigned int range_base;
> +    bool first;
> +
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id =3D shm->sender_id;
> +    descr->global_handle =3D shm->handle;
> +    descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> +    descr->mem_access_count =3D 1;
> +    descr->mem_access_size =3D sizeof(*mem_access_array);
> +    descr->mem_access_offs =3D sizeof(*descr);
> +    mem_access_array =3D (void *)(descr + 1);
> +    region_descr =3D (void *)(mem_access_array + 1);
> +
> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> +    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> +    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> +    mem_access_array[0].region_offs =3D (vaddr_t)region_descr - (vaddr_t=
)ffa_tx;
> +
> +    memset(region_descr, 0, sizeof(*region_descr));
> +    region_descr->total_page_count =3D shm->page_count;
> +
> +    region_descr->address_range_count =3D 1;
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE =3D=3D pa )
> +        {
> +            continue;
> +        }
> +        region_descr->address_range_count++;
> +    }
> +
> +    tot_len =3D sizeof(*descr) + sizeof(*mem_access_array) +
> +              sizeof(*region_descr) +
> +              region_descr->address_range_count * sizeof(*addr_range);
> +
> +    addr_range =3D region_descr->address_range_array;
> +    frag_len =3D (vaddr_t)(addr_range + 1) - (vaddr_t)ffa_tx;
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    init_range(addr_range, last_pa);
> +    first =3D true;
> +    range_count =3D 1;
> +    range_base =3D 0;
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE =3D=3D pa )
> +        {
> +            addr_range->page_count++;
> +            continue;
> +        }
> +
> +        if (frag_len =3D=3D max_frag_len) {
coding stlyle: if ( ... )
           {

> +            if (first)

coding stlyle if ( ... )

> +            {
> +                ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->han=
dle);
> +                first =3D false;
> +            }
> +            else
> +            {
> +                ret =3D ffa_mem_frag_tx(shm->handle, frag_len, shm->send=
er_id);
> +            }
> +            if (ret <=3D 0)
> +                return ret;
> +            range_base =3D range_count;
> +            range_count =3D 0;
> +            frag_len =3D sizeof(*addr_range);
> +            addr_range =3D ffa_tx;
> +        } else {
> +            frag_len +=3D sizeof(*addr_range);
> +            addr_range++;
> +        }
> +        init_range(addr_range, pa);
> +        range_count++;
> +    }
> +
> +    if (first)
> +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    else
> +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> +}
> +
> +static int read_mem_transaction(uint32_t ffa_vers, void *buf, size_t ble=
n,
> +                                struct ffa_mem_transaction_x *trans)
> +{
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint32_t count;
> +    uint32_t offs;
> +    uint32_t size;
> +
> +    if (ffa_vers >=3D FFA_VERSION_1_1) {
coding style: if ( ... )
          {
> +        struct ffa_mem_transaction_1_1 *descr;
> +
> +        if (blen < sizeof(*descr))
coding style: if ( ... )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D read_atomic(&descr->sender_id);
> +        mem_reg_attr =3D read_atomic(&descr->mem_reg_attr);
> +        flags =3D read_atomic(&descr->flags);
> +        trans->global_handle =3D read_atomic(&descr->global_handle);
> +        trans->tag =3D read_atomic(&descr->tag);
> +
> +        count =3D read_atomic(&descr->mem_access_count);
> +        size =3D read_atomic(&descr->mem_access_size);
> +        offs =3D read_atomic(&descr->mem_access_offs);
> +    } else {
coding style:
 }
 else
 {
> +        struct ffa_mem_transaction_1_0 *descr;
> +
> +        if (blen < sizeof(*descr))
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D read_atomic(&descr->sender_id);
> +        mem_reg_attr =3D read_atomic(&descr->mem_reg_attr);
> +        flags =3D read_atomic(&descr->flags);
> +        trans->global_handle =3D read_atomic(&descr->global_handle);
> +        trans->tag =3D read_atomic(&descr->tag);
> +
> +        count =3D read_atomic(&descr->mem_access_count);
> +        size =3D sizeof(struct ffa_mem_access);
> +        offs =3D offsetof(struct ffa_mem_transaction_1_0, mem_access_arr=
ay);
> +    }
> +
> +    if (mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_MA=
X ||
> +        count > UINT8_MAX || offs > UINT16_MAX)
coding style: if ( ... )

> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Check that the endpoint memory access descriptor array fits */
> +    if (size * count + offs > blen)
the same

> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    trans->mem_reg_attr =3D mem_reg_attr;
> +    trans->flags =3D flags;
> +    trans->mem_access_size =3D size;
> +    trans->mem_access_count =3D count;
> +    trans->mem_access_offs =3D offs;
> +    return 0;
> +}
> +
> +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int off=
s,
> +                              unsigned int frag_len)
> +{
> +    struct domain *d =3D current->domain;
> +    unsigned int o =3D offs;
> +    unsigned int l;
> +    int ret;
> +
> +    if (frag_len < o)
the same

> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Fill up the first struct ffa_address_range */
> +    l =3D min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_=
offset);
> +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> +    s->range_offset +=3D l;
> +    o +=3D l;
> +    if (s->range_offset !=3D sizeof(s->range))
> +        goto out;
> +    s->range_offset =3D 0;
> +
> +    while (true) {
the same

> +        ret =3D get_shm_pages(d, s->shm, &s->range, 1, s->current_page_i=
dx,
> +                            &s->current_page_idx);
> +        if (ret)
> +            return ret;
> +        if (s->range_count =3D=3D 1)
> +            return 0;
> +        s->range_count--;
> +        if (frag_len - o < sizeof(s->range))
> +            break;
> +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> +        o +=3D sizeof(s->range);
> +    }
> +
> +    /* Collect any remaining bytes for the next struct ffa_address_range=
 */
> +    s->range_offset =3D frag_len - o;
> +    memcpy(&s->range, s->buf + o, frag_len - o);
> +out:
> +    s->frag_offset +=3D frag_len;
> +    return s->frag_offset;
> +}
> +
> +static void handle_mem_share(struct cpu_user_regs *regs)
> +{
> +    uint32_t tot_len =3D get_user_reg(regs, 1);
> +    uint32_t frag_len =3D get_user_reg(regs, 2);
> +    uint64_t addr =3D get_user_reg(regs, 3);
> +    uint32_t page_count =3D get_user_reg(regs, 4);
> +    struct ffa_mem_transaction_x trans;
> +    struct ffa_mem_access *mem_access;
> +    struct ffa_mem_region *region_descr;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    struct ffa_shm_mem *shm =3D NULL;
> +    unsigned int last_page_idx =3D 0;
> +    uint32_t range_count;
> +    uint32_t region_offs;
> +    int ret =3D FFA_RET_DENIED;
> +    uint32_t handle_hi =3D 0;
> +    uint32_t handle_lo =3D 0;
> +
> +    /*
> +     * We're only accepting memory transaction descriptors via the rx/tx
> +     * buffer.
> +     */
> +    if ( addr ) {
coding style

> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that fragment legnth doesn't exceed total length */
> +    if (frag_len > tot_len) {
coding style

> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    spin_lock(&ffa_buffer_lock);
> +
> +    if ( frag_len > ctx->page_count * PAGE_SIZE )
> +        goto out_unlock;
> +
> +    if ( !ffa_page_count ) {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +
> +    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &tr=
ans);
> +    if (ret)
coding style

> +        goto out_unlock;
> +
> +    if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    /* Only supports sharing it with one SP for now */
> +    if ( trans.mem_access_count !=3D 1 )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    if ( trans.sender_id !=3D get_vm_id(d) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that it fits in the supplied data */
> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len)
> +        goto out_unlock;
> +
> +    mem_access =3D (void *)((vaddr_t)ctx->tx + trans.mem_access_offs);
> +    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_offs =3D read_atomic(&mem_access->region_offs);
> +    if (sizeof(*region_descr) + region_offs > frag_len) {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_descr =3D (void *)((vaddr_t)ctx->tx + region_offs);
> +    range_count =3D read_atomic(&region_descr->address_range_count);
> +    page_count =3D read_atomic(&region_descr->total_page_count);
> +
> +    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> +    if ( !shm )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out;
> +    }
> +    shm->sender_id =3D trans.sender_id;
> +    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> +    shm->page_count =3D page_count;
> +
> +    if (frag_len !=3D tot_len) {
> +        struct mem_frag_state *s =3D xzalloc(struct mem_frag_state);
> +
> +        if (!s) {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out;
> +        }
> +        s->shm =3D shm;
> +        s->range_count =3D range_count;
> +        s->buf =3D ctx->tx;
> +        s->buf_size =3D ffa_page_count * PAGE_SIZE;
> +        ret =3D add_mem_share_frag(s, sizeof(*region_descr)  + region_of=
fs,
> +                                 frag_len);
> +        if (ret <=3D 0) {
> +            xfree(s);
> +            if (ret < 0)
> +                goto out;
> +        } else {
> +            shm->handle =3D next_handle++;
> +            reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +            spin_lock(&ffa_mem_list_lock);
> +            list_add_tail(&s->list, &ffa_frag_list);
> +            spin_unlock(&ffa_mem_list_lock);
> +        }
> +        goto out_unlock;
> +    }
> +
> +    /*
> +     * Check that the Composite memory region descriptor fits.
> +     */
> +    if ( sizeof(*region_descr) + region_offs +
> +         range_count * sizeof(struct ffa_address_range) > frag_len) {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count,
> +                        0, &last_page_idx);
> +    if ( ret )
> +        goto out;
> +    if (last_page_idx !=3D shm->page_count) {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    ret =3D share_shm(shm);
> +    if ( ret )
> +        goto out;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_add_tail(&shm->list, &ffa_mem_list);
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +
> +out:
> +    if ( ret && shm )
> +    {
> +        put_shm_pages(shm);
> +        xfree(shm);
> +    }
> +out_unlock:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.send=
er_id);
> +    else if ( ret =3D=3D 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static struct mem_frag_state *find_frag_state(uint64_t handle)
> +{
> +    struct mem_frag_state *s;
> +
> +    list_for_each_entry(s, &ffa_frag_list, list)
> +        if ( s->shm->handle =3D=3D handle)
> +            return s;
> +
> +    return NULL;
> +}
> +
> +static void handle_mem_frag_tx(struct cpu_user_regs *regs)
> +{
> +    uint32_t frag_len =3D get_user_reg(regs, 3);
> +    uint32_t handle_lo =3D get_user_reg(regs, 1);
> +    uint32_t handle_hi =3D get_user_reg(regs, 2);
> +    uint64_t handle =3D reg_pair_to_64(handle_hi, handle_lo);
> +    struct mem_frag_state *s;
> +    uint16_t sender_id =3D 0;
> +    int ret;
> +
> +    spin_lock(&ffa_buffer_lock);
> +    s =3D find_frag_state(handle);
> +    if (!s) {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +    sender_id =3D s->shm->sender_id;
> +
> +    if (frag_len > s->buf_size) {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D add_mem_share_frag(s, 0, frag_len);
> +    if (ret =3D=3D 0) {
> +        /* Note that share_shm() uses our tx buffer */
> +        ret =3D share_shm(s->shm);
> +        if (ret =3D=3D 0) {
> +            spin_lock(&ffa_mem_list_lock);
> +            list_add_tail(&s->shm->list, &ffa_mem_list);
> +            spin_unlock(&ffa_mem_list_lock);
> +        } else {
> +            put_shm_pages(s->shm);
> +            xfree(s->shm);
> +        }
> +        spin_lock(&ffa_mem_list_lock);
> +        list_del(&s->list);
> +        spin_unlock(&ffa_mem_list_lock);
> +        xfree(s);
> +    } else if (ret < 0) {
> +        put_shm_pages(s->shm);
> +        xfree(s->shm);
> +        spin_lock(&ffa_mem_list_lock);
> +        list_del(&s->list);
> +        spin_unlock(&ffa_mem_list_lock);
> +        xfree(s);
> +    }
> +out:
> +    spin_unlock(&ffa_buffer_lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id)=
;
> +    else if ( ret =3D=3D 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> +{
> +    struct ffa_shm_mem *shm;
> +    uint32_t handle_hi;
> +    uint32_t handle_lo;
> +    int ret;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_for_each_entry(shm, &ffa_mem_list, list) {
> +        if ( shm->handle =3D=3D handle )
> +            goto found_it;
> +    }
> +    shm =3D NULL;
> +found_it:
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    if ( !shm )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    reg_pair_from_64(&handle_hi, &handle_lo, handle);
> +    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +    if ( ret )
> +        return ret;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_del(&shm->list);
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    put_shm_pages(shm);
> +    xfree(shm);
> +
> +    return ret;
> +}
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t count;
> +    uint32_t e;
> +
> +    if ( !ctx )
> +        return false;
> +
> +    switch ( fid )
> +    {
> +    case FFA_VERSION:
> +        handle_version(regs);
> +        return true;
> +    case FFA_ID_GET:
> +        set_regs_success(regs, get_vm_id(d), 0);
> +        return true;
> +    case FFA_RXTX_MAP_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_RXTX_MAP_64:
> +#endif
> +        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(r=
egs, 2),
> +                            get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_RXTX_UNMAP:
> +        e =3D handle_rxtx_unmap();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_PARTITION_INFO_GET:
> +        e =3D handle_partition_info_get(get_user_reg(regs, 1),
> +                                      get_user_reg(regs, 2),
> +                                      get_user_reg(regs, 3),
> +                                      get_user_reg(regs, 4),
> +                                      get_user_reg(regs, 5), &count);
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, count, 0);
> +        return true;
> +    case FFA_RX_RELEASE:
> +        e =3D handle_rx_release();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +#endif
> +        handle_msg_send_direct_req(regs, fid);
> +        return true;
> +    case FFA_MEM_SHARE_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MEM_SHARE_64:
> +#endif
> +        handle_mem_share(regs);
> +        return true;
> +    case FFA_MEM_RECLAIM:
> +        e =3D handle_mem_reclaim(reg_pair_to_64(get_user_reg(regs, 2),
> +                                              get_user_reg(regs, 1)),
> +                               get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_MEM_FRAG_TX:
> +        handle_mem_frag_tx(regs);
> +        return true;
> +
> +    default:
> +        printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
> +        return false;
> +    }
> +}
> +
> +int ffa_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx;
> +    unsigned int n;
> +    unsigned int m;
> +    unsigned int c_pos;
> +    int32_t res;
> +
> +    if ( !ffa_version )
> +        return 0;
> +
> +    ctx =3D xzalloc(struct ffa_ctx);
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    for ( n =3D 0; n < subsr_vm_created_count; n++ ) {
> +        res =3D ffa_direct_req_send_vm(subsr_vm_created[n], get_vm_id(d)=
,
> +                                     FFA_MSG_SEND_VM_CREATED);
> +        if ( res ) {
> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> +                   get_vm_id(d), subsr_vm_created[n], res);
> +            c_pos =3D n;
> +            goto err;
> +        }
> +    }
> +
> +    d->arch.ffa =3D ctx;
> +
> +    return 0;
> +
> +err:
> +    /* Undo any already sent vm created messaged */
> +    for ( n =3D 0; n < c_pos; n++ )
> +        for ( m =3D 0; m < subsr_vm_destroyed_count; m++ )
> +            if ( subsr_vm_destroyed[m] =3D=3D subsr_vm_created[n] )
> +                ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(=
d),
> +                                       FFA_MSG_SEND_VM_DESTROYED);
> +    return -ENOMEM;
> +}
> +
> +int ffa_relinquish_resources(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    unsigned int n;
> +    int32_t res;
> +
> +    if ( !ctx )
> +        return 0;
> +
> +    for ( n =3D 0; n < subsr_vm_destroyed_count; n++ ) {
> +        res =3D ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(=
d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> +                   get_vm_id(d), subsr_vm_destroyed[n], res);
> +    }
> +
> +    XFREE(d->arch.ffa);
> +
> +    return 0;
> +}
> +
> +static bool __init init_subscribers(void)
> +{
> +    struct ffa_partition_info_1_1 *fpi;
> +    bool ret =3D false;
> +    uint32_t count;
> +    uint32_t e;
> +    uint32_t n;
> +    uint32_t c_pos;
> +    uint32_t d_pos;
> +
> +    if ( ffa_version < FFA_VERSION_1_1 )
> +        return true;
> +
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 1, &count);
> +    ffa_rx_release();
> +    if ( e ) {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", (int)e=
);
> +        goto out;
> +    }
> +
> +    fpi =3D ffa_rx;
> +    subsr_vm_created_count =3D 0;
> +    subsr_vm_destroyed_count =3D 0;
> +    for ( n =3D 0; n < count; n++ ) {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> +            subsr_vm_created_count++;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> +            subsr_vm_destroyed_count++;
> +    }
> +
> +    if ( subsr_vm_created_count )
> +        subsr_vm_created =3D xzalloc_array(uint16_t, subsr_vm_created_co=
unt);
> +    if ( subsr_vm_destroyed_count )
> +        subsr_vm_destroyed =3D xzalloc_array(uint16_t, subsr_vm_destroye=
d_count);
> +    if ( (subsr_vm_created_count && !subsr_vm_created) ||
> +        (subsr_vm_destroyed_count && !subsr_vm_destroyed) ) {
> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> +        subsr_vm_created_count =3D 0;
> +        subsr_vm_destroyed_count =3D 0;
> +        XFREE(subsr_vm_created);
> +        XFREE(subsr_vm_destroyed);
> +        goto out;
> +    }
> +
> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ ) {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> +            subsr_vm_created[c_pos++] =3D fpi[n].id;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> +            subsr_vm_destroyed[d_pos++] =3D fpi[n].id;
> +    }
> +
> +    ret =3D true;
> +out:
> +    ffa_rx_release();
> +    return ret;
> +}
> +
> +static int __init ffa_init(void)
> +{
> +    uint32_t vers;
> +    uint32_t e;
> +    unsigned int major_vers;
> +    unsigned int minor_vers;
> +
> +    /*
> +     * psci_init_smccc() updates this value with what's reported by EL-3
> +     * or secure world.
> +     */
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
> +    {
> +        printk(XENLOG_ERR
> +               "ffa: unsupported SMCCC version %#x (need at least %#x)\n=
",
> +               smccc_ver, ARM_SMCCC_VERSION_1_2);
> +        return 0;
> +    }
> +
> +    if ( !ffa_get_version(&vers) )
> +        return 0;
> +
> +    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
> +    {
> +        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers)=
;
> +        return 0;
> +    }
> +
> +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR=
_MASK;
> +    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> +    printk(XENLOG_ERR "ARM FF-A Mediator version %u.%u\n",
> +           FFA_VERSION_MAJOR, FFA_VERSION_MINOR);
> +    printk(XENLOG_ERR "ARM FF-A Firmware version %u.%u\n",
> +           major_vers, minor_vers);
> +
> +    ffa_rx =3D alloc_xenheap_pages(0, 0);
> +    if ( !ffa_rx )
> +        return 0;
> +
> +    ffa_tx =3D alloc_xenheap_pages(0, 0);
> +    if ( !ffa_tx )
> +        goto err_free_ffa_rx;
> +
> +    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", (int)e)=
;
> +        goto err_free_ffa_tx;
> +    }
> +    ffa_page_count =3D 1;
> +    ffa_version =3D vers;
> +
> +    if ( !init_subscribers() )
> +        goto err_free_ffa_tx;
> +
> +    return 0;
> +
> +err_free_ffa_tx:
> +    free_xenheap_pages(ffa_tx, 0);
> +    ffa_tx =3D NULL;
> +err_free_ffa_rx:
> +    free_xenheap_pages(ffa_rx, 0);
> +    ffa_rx =3D NULL;
> +    ffa_page_count =3D 0;
> +    ffa_version =3D 0;
> +    XFREE(subsr_vm_created);
> +    subsr_vm_created_count =3D 0;
> +    XFREE(subsr_vm_destroyed);
> +    subsr_vm_destroyed_count =3D 0;
> +    return 0;
> +}
> +
> +__initcall(ffa_init);
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index ed63c2b6f91f..b3dee269bced 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -103,6 +103,10 @@ struct arch_domain
>      void *tee;
>  #endif
> =20
> +#ifdef CONFIG_FFA
> +    void *ffa;
> +#endif
> +
>      bool directmap;
>  }  __cacheline_aligned;
> =20
> diff --git a/xen/arch/arm/include/asm/ffa.h b/xen/arch/arm/include/asm/ff=
a.h
> new file mode 100644
> index 000000000000..1c6ce6421294
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/ffa.h
> @@ -0,0 +1,71 @@
> +/*
> + * xen/arch/arm/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2021  Linaro Limited
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without restriction,
> + * including without limitation the rights to use, copy, modify, merge,
> + * publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so,
> + * subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=
.
> + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef __ASM_ARM_FFA_H__
> +#define __ASM_ARM_FFA_H__
> +
> +#include <xen/const.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/types.h>
> +
> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> +
> +static inline bool is_ffa_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D FFA_FNUM_MIN_VALUE && fn <=3D FFA_FNUM_MAX_VALUE;
> +}
> +
> +#ifdef CONFIG_FFA
> +#define FFA_NR_FUNCS    11
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid);
> +int ffa_domain_init(struct domain *d);
> +int ffa_relinquish_resources(struct domain *d);
> +#else
> +#define FFA_NR_FUNCS    0
> +
> +static inline bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t =
fid)
> +{
> +    return false;
> +}
> +
> +static inline int ffa_domain_init(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static inline int ffa_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /*__ASM_ARM_FFA_H__*/
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 6f90c08a6304..34586025eff8 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -20,6 +20,7 @@
>  #include <public/arch-arm/smccc.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> +#include <asm/ffa.h>
>  #include <asm/monitor.h>
>  #include <asm/regs.h>
>  #include <asm/smccc.h>
> @@ -32,7 +33,7 @@
>  #define XEN_SMCCC_FUNCTION_COUNT 3
> =20
>  /* Number of functions currently supported by Standard Service Service C=
alls. */
> -#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
> +#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
> =20
>  static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
>  {
> @@ -196,13 +197,23 @@ static bool handle_existing_apis(struct cpu_user_re=
gs *regs)
>      return do_vpsci_0_1_call(regs, fid);
>  }
> =20
> +static bool is_psci_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D 0 && fn <=3D 0x1fU;
> +}
> +
>  /* PSCI 0.2 interface and other Standard Secure Calls */
>  static bool handle_sssc(struct cpu_user_regs *regs)
>  {
>      uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
> =20
> -    if ( do_vpsci_0_2_call(regs, fid) )
> -        return true;
> +    if ( is_psci_fid(fid) )
> +        return do_vpsci_0_2_call(regs, fid);
> +
> +    if ( is_ffa_fid(fid) )
> +        return ffa_handle_call(regs, fid);
> =20
>      switch ( fid )
>      {


--=20
Volodymyr Babchuk at EPAM=

