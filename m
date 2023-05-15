Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7787702734
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534618.831788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTcb-0003qm-9Z; Mon, 15 May 2023 08:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534618.831788; Mon, 15 May 2023 08:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTcb-0003nr-5s; Mon, 15 May 2023 08:31:57 +0000
Received: by outflank-mailman (input) for mailman id 534618;
 Mon, 15 May 2023 08:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SknV=BE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1pyTca-0003nl-G9
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:31:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0b9ec2e-f2fa-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 10:31:51 +0200 (CEST)
Received: from AM5PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:203:68::29) by AS2PR08MB9523.eurprd08.prod.outlook.com
 (2603:10a6:20b:60d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:31:44 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::ef) by AM5PR0601CA0043.outlook.office365.com
 (2603:10a6:203:68::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 08:31:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 08:31:43 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Mon, 15 May 2023 08:31:43 +0000
Received: from 601bc94e0a85.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7620B939-C8D5-4088-BD93-99BB05170463.1; 
 Mon, 15 May 2023 08:31:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 601bc94e0a85.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 May 2023 08:31:33 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB9696.eurprd08.prod.outlook.com (2603:10a6:20b:614::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:31:29 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 08:31:29 +0000
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
X-Inumbo-ID: f0b9ec2e-f2fa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQtJC4hjArQPkI0YrSMQ6T1z7MzxtJjXJZwbRfdp108=;
 b=HNgSyHZG7xdhwiNxn34VEnzSGvDO4X78BLdz/uEu5DbC4iQoRWRnLbgJsPnHgQ4Kht7rt2+lK7fMTYRlikQFB1WHksKXDPRvhcE1Wb2gPxaUPpICPo6GOh+OBsMN8Uj5XtUwdOTvm+dFb+4YAQba/0oF9toox5seWpy4SQXpeYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95073a80a5afebf1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFpti8nXVybzuoQbdgHu68yiOX6TzUCAMrMfIx049kgF84+Y8wTpZLN7sPMwJxeLxsTQOiQP/qnSXkwg0190M6HKT85UwUvoWpzPPjBRzjMT+Dh2jGPTBrJ5zVRgRGQ3nfqWUrxbW2z4KMNU4gu1jPHs+HxN9hyPog4D3g7hE/EdIz8nLP45Jmd04KaWnpqT+cmEZQfsfNQlyjFpooeeqNsFv5R/WRZgKpqSQIrgnw1kOS9R7hni2c+/43A8+ZvioIi+fA1FLkIeRNIdWZkkLtSdAWA0toVm4MB3siGEuS+rNiLmJovIeUIgp+YI9EeQM16Qk9W9PZOtgOGuUP/1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQtJC4hjArQPkI0YrSMQ6T1z7MzxtJjXJZwbRfdp108=;
 b=eHMoEG9fevQHMo6j90nR2CGMSMLYcrgoIA0tJUc/6l7b7lebpyCDu5Z2XTehekwF+yQUFky89bRMIup6RQpDaiS7lTXlbljriKc1felYi4vbZDN+lU0oZ4lc+1RlrAix2wXY9jkIRPKapAo+trBwyaa9t1N1AtPUiQW7wDIW8JJmsdIWcGJ5867jL/Sky2+7IDhblMWW/niYNZMpeRQTg69Vt9G/2us/FLDkpRHOuPbmCa+qCUg8tBmaoIPFyqoYD9xzUwKu/2fBKKUeETlU3xH+fBIA1nG1jRueyJfFGZBM4RnSEkA4LnZUJoV50wMlAmrhERAquHokWWmPxZLNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQtJC4hjArQPkI0YrSMQ6T1z7MzxtJjXJZwbRfdp108=;
 b=HNgSyHZG7xdhwiNxn34VEnzSGvDO4X78BLdz/uEu5DbC4iQoRWRnLbgJsPnHgQ4Kht7rt2+lK7fMTYRlikQFB1WHksKXDPRvhcE1Wb2gPxaUPpICPo6GOh+OBsMN8Uj5XtUwdOTvm+dFb+4YAQba/0oF9toox5seWpy4SQXpeYo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Thread-Topic: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Thread-Index: AQHZhN8Uzg8I+HOn4k6B42UqpaPyEa9bBX8A
Date: Mon, 15 May 2023 08:31:28 +0000
Message-ID: <CB2DA69D-2360-40A8-99F9-849A15392411@arm.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
In-Reply-To: <20230512143535.29679-3-michal.orzel@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS8PR08MB9696:EE_|AM7EUR03FT018:EE_|AS2PR08MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: d337cc9c-1157-4563-babb-08db551ed08d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dIsUhmVF0aYj4oXNR/jMLNvORQQUdzK/AeA+u1zn3VaLFtCTuHgKjC6TgM5z8vNgGFpKnewgSGLhlHjkb8dWclAexD200c3gErhzk/WoinrDpTU9m65xvqDnqRjGrg5rE0qZ0gc8gomH3ivIWisKd/3qOLeu2bkSE8Y1H2xY2S1y9+soGCQkyjOUFi3rvZxKuHAudJnmDxYRoRvYuk9DzOlCHNTjXEsEzW2qw7bsdMx2FSKMF8yMN1l32iInRViidWBK77m9lIj33uLtjIpwi/cn1DmG64ZUCslQnOfc/jpelqEbo/u64qjrEOKgjUfdzVwuIYLxXo6Y7murY+a50ScofBrTP5pUim53edH9YHqNhnvVRq+leYwO48JZSWUrSncA0QyomQFLcLixr/6LkhU5RVQV7ybuQVEJXpoqHm/HKA2Iynb7J4tLuafo8H3ks/0JzYtvxiBeRdpToM9x922rbFiWuVYaYkk/RrUO6xOI20QWTmk0+xQw/45fYsWbcWpEjK05V0gIkAC0bZmGPC41mpCHc9L2JtdPb2e1Ve/8eC8jXaprReoGxiLUBh2V6iVJoZ9AoMKjMUfRWDK1p1ckI7VimnbN8F3ycRP2Yec1iaGJHFAu7K6eO0Ig46hgc66i3/PIQIgc6ewDepMvEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(83380400001)(64756008)(66476007)(66556008)(66946007)(66446008)(91956017)(76116006)(2616005)(6486002)(6512007)(26005)(6506007)(53546011)(478600001)(54906003)(71200400001)(186003)(5660300002)(86362001)(8676002)(8936002)(2906002)(33656002)(36756003)(41300700001)(38070700005)(4326008)(6916009)(316002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA52AFA571B29A46AAE878C084408EA7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9696
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b751bd3-4325-4168-b5a6-08db551ec7a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sn0CZhRcQyBzPIx+f382VnHypSlK1oHbUBkTJYYk5hgVr7vqg+X+LUY76mzjNHPbhF+ddyRGNTM34ynfNr8JzXtowbtz0Hn5kXuSAukobTcl33VfwpH3OmTpAsz6949SsjDuEbk+W/y6XRHxZwO4kQSbJKsUga11Mkg1Ma+xexZrg5wnhpGT5cK5kxbMt8+pvTFWT6odKw2pO7pWQUunNuuxWtxm2Ms0dCR+2w2slbA/JkGTGERZKXjWKIbxKkcMmH9pIKLxcWUHcLTgpXIfPSpZzn/OGfdFa164skxvTQgpdeqzMbByJFUEpsvCIV3t51vBnaQAk73t9WnAqsd21C5HKAAk1KbbLcb3G38Lzm3FOWY6dyeFVlsfQQbitNqE+ddMnD9D3HtJlRBKJmwXENrhakKRJmvYoXRFDurrxbs2Eh+AdQ8FSbu+smTHGXLgWDIKlRiTVwf9A7VDU9PjDA8N611QatVJL8TmUlFcKbs8PW9rvoMDbKCJMoj3GthxnVYH6FBV6IViyxIgzO8W74qQeWHIGfFTZZ95n8p1W7gM5FDXOtyTk35sDgmRuaOgWpUBUs84sc3HIhOkMP6IcoMx0rsAPKELgdtWSrjoZz5VCk7c9nV2luMVCvWgWQnakkQY93ZttPFS42yhbN+571yoy89qg4z4h7mZNpsjDk9skRlCjfr8ipZvMMnU6zbZCwbSwUpxLErulqG/OBGz4mMR8DhH0vudR28j8+BpIEU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(33656002)(36756003)(86362001)(54906003)(316002)(4326008)(70206006)(70586007)(6486002)(478600001)(82310400005)(40480700001)(8936002)(8676002)(5660300002)(6862004)(2906002)(81166007)(356005)(82740400003)(41300700001)(6512007)(2616005)(26005)(107886003)(186003)(53546011)(6506007)(36860700001)(83380400001)(336012)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 08:31:43.8761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d337cc9c-1157-4563-babb-08db551ed08d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9523

Hi Michal,

> On 12 May 2023, at 3:35 pm, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, even in case of a SMMU being I/O coherent, we clean the
> updated PT as a result of not advertising the coherency feature. SMMUv3
> coherency feature means that page table walks, accesses to memory
> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>=20
> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>=20
> The same restrictions apply, meaning that in order to advertise coherent
> table walk platform feature, all the SMMU devices need to report coherenc=
y
> feature. This is because the page tables (we are sharing them with CPU)
> are populated before any device assignment and in case of a device being
> behind non-coherent SMMU, we would have to scan the tables and clean
> the cache.
>=20
> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
> requires that all SMMUv3 devices support I/O coherency.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> There are very few platforms out there with SMMUv3 but I have never seen
> a SMMUv3 that is not I/O coherent.
> ---
> xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
> 1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index bf053cdb6d5c..2adaad0fa038 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_ma=
tch[] =3D {
> };
>=20
> /* Start of Xen specific code. */
> +
> +/*
> + * Platform features. It indicates the list of features supported by all
> + * SMMUs. Actually we only care about coherent table walk, which in case=
 of
> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 007=
0 E.A,
> + * section 3.15 and SMMU_IDR0.COHACC bit description).
> + */
> +static uint32_t platform_features =3D ARM_SMMU_FEAT_COHERENCY;
> +
> static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
> {
> 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> @@ -2708,8 +2717,12 @@ static int arm_smmu_iommu_xen_domain_init(struct d=
omain *d)
> 	INIT_LIST_HEAD(&xen_domain->contexts);
>=20
> 	dom_iommu(d)->arch.priv =3D xen_domain;
> -	return 0;
>=20
> +	/* Coherent walk can be enabled only when all SMMUs support it. */
> +	if (platform_features & ARM_SMMU_FEAT_COHERENCY)
> +		iommu_set_feature(d, IOMMU_FEAT_COHERENT_WALK);
> +
> +	return 0;
> }
>=20
> static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
> @@ -2738,6 +2751,7 @@ static __init int arm_smmu_dt_init(struct dt_device=
_node *dev,
> 				const void *data)
> {
> 	int rc;
> +	const struct arm_smmu_device *smmu;
>=20
> 	/*
> 	 * Even if the device can't be initialized, we don't want to
> @@ -2751,6 +2765,14 @@ static __init int arm_smmu_dt_init(struct dt_devic=
e_node *dev,
>=20
> 	iommu_set_ops(&arm_smmu_iommu_ops);
>=20
> +	/* Find the just added SMMU and retrieve its features. */
> +	smmu =3D arm_smmu_get_by_dev(dt_to_dev(dev));
> +
> +	/* It would be a bug not to find the SMMU we just added. */
> +	BUG_ON(!smmu);
> +
> +	platform_features &=3D smmu->features;
> +
> 	return 0;
> }
>=20
> --=20
> 2.25.1
>=20


