Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0CC3B8802
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 19:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148227.273927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeKx-0002C6-RX; Wed, 30 Jun 2021 17:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148227.273927; Wed, 30 Jun 2021 17:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeKx-00029E-OP; Wed, 30 Jun 2021 17:49:23 +0000
Received: by outflank-mailman (input) for mailman id 148227;
 Wed, 30 Jun 2021 17:49:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBKC=LY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lyeKw-000298-90
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 17:49:22 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97b9cebb-3209-4aca-942e-586a5d953643;
 Wed, 30 Jun 2021 17:49:19 +0000 (UTC)
Received: from AM6PR10CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::15)
 by DB8PR08MB5404.eurprd08.prod.outlook.com (2603:10a6:10:117::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 17:49:18 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::e6) by AM6PR10CA0038.outlook.office365.com
 (2603:10a6:209:80::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Wed, 30 Jun 2021 17:49:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 17:49:18 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97");
 Wed, 30 Jun 2021 17:49:18 +0000
Received: from 37b0976fe99c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6C2ADA1-02FD-444F-9BC8-0D3C86F39819.1; 
 Wed, 30 Jun 2021 17:49:11 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37b0976fe99c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Jun 2021 17:49:11 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0802MB2561.eurprd08.prod.outlook.com (2603:10a6:203:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Wed, 30 Jun
 2021 17:49:10 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5%9]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 17:49:10 +0000
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
X-Inumbo-ID: 97b9cebb-3209-4aca-942e-586a5d953643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u59L1DPlbkD5PqGrE9Hb//T7Ee7m1KExDJqn8cbCrIU=;
 b=sjVE3C2u0y9OzNB1xLtwtIrVItbwbW6/QWEOESG3m4BuMLwfnO9H/FsgK8v1gOQV6Ur6QPF6JYnc03GXU4u1P2ZkOHZs163RK3MTwfaZJVxRJumhO8lxj4qzJ6f4yC+L0dJZ1ruE6fJ602wnB/9Ym4XuU/ApygkYB2EEYQb8viE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78152e7f9179dbae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cd/jnWlQH9Tic0PPWhGLB7Ae0yTa4XuVxneUx0zf77/cX/vUCg26Rs/zwOlNfFljwwMQQKlt+6q1T7BJGfv6aOltp1x5dW1Zrn2sBwvoQr0hw51Tl+68b1OulGwWOzLR7ObNhxtzQ2ghTNejNxTIpy43Tz7Qob2v2ztpQdc4CP7nwKy7AtAw/aPxl1lzMeIZnUWXflHsM0pxVU3wA8ENdcpYUxho48INVQjAnUoFBaUSZiXDk+oZxRFiy2mh6l0RmM3a5t/5JXyXtHJgjSY0k6e+k61CXU+vZDFAfRacjXjniWjHJQlfAHc4Ou7RwXM+OUB6sxLjEQMtpQ+0m7ypUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u59L1DPlbkD5PqGrE9Hb//T7Ee7m1KExDJqn8cbCrIU=;
 b=JMwEMcEl7Wh7CCGW9Zi0KWmyfKeYUVAWOr5mIZoJCbLu0ju4bsFLaoO7QXJb1SGcNAY0cQbTX74S3CAo5QKudP1sOST36cEDOpKzDtGjeP1+7OB7hEnMkVLQienpinwxv4MYd/vn/sz6aCiFH1dFuxr59R9McmFZO13iYL1Zl9DpXJCTfKvBn+mhorxOXp+U+Zrev3CdEmzIlSvm/1xI4u9b4ZsApSDXPOMMpeXhTKU6eNZ8ZbAsyDvO/SQbjhFBL9PHhD72HLaZlbWmT0hgErj8AZUMiJBLF+NKgqur58Kbd0qJ/0B3CIlwAc8yfr3/UVbVYcTHckrK0iLljUiz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u59L1DPlbkD5PqGrE9Hb//T7Ee7m1KExDJqn8cbCrIU=;
 b=sjVE3C2u0y9OzNB1xLtwtIrVItbwbW6/QWEOESG3m4BuMLwfnO9H/FsgK8v1gOQV6Ur6QPF6JYnc03GXU4u1P2ZkOHZs163RK3MTwfaZJVxRJumhO8lxj4qzJ6f4yC+L0dJZ1ruE6fJ602wnB/9Ym4XuU/ApygkYB2EEYQb8viE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Fixed stream matching register
 allocation
Thread-Topic: [PATCH] xen/arm: smmuv1: Fixed stream matching register
 allocation
Thread-Index: AQHXaeBuO8lC15Rvy0GU2dq6zulC56ssS6GAgACREoA=
Date: Wed, 30 Jun 2021 17:49:10 +0000
Message-ID: <BE2AB42D-A896-4FFE-856C-DA494D8DF1C8@arm.com>
References:
 <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com>
 <11df0a34-724a-63ad-1822-4bd8aa364ab0@xen.org>
In-Reply-To: <11df0a34-724a-63ad-1822-4bd8aa364ab0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 055b2dd2-1659-4772-cf89-08d93bef6251
x-ms-traffictypediagnostic: AM5PR0802MB2561:|DB8PR08MB5404:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB54046E837A3FE483C4ACD40BFC019@DB8PR08MB5404.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K3mxKg2+2TD9qFerILDRjkEZq0jf4yc4h+Ml3k/+SpEVqqmEDlYfdOnIl5w6K/KrLRRnCkrcEeSRKjnw7DgeiRt2B+AXci8mXJ+yerI5h2kYvoEqpCXLWsWH7gWdYnxg4WiuSckOwTlMD0ajXhkDkf2A0GN/wrgjqeyH+HdwxEWHJLxFLmKvaJYXmMj6LQF1cITP1ZQ243VSQN5D1y8meMsOELzTQHsYT36E8mVNy7ULlhH5e178Gnis7wGxfiRHgwh8OwZJzs9Iy3s9VrN+DQLjSLfjXF3c8YeYy0LGNQa1nRoHVHjefV809GVh+C5LL+xBCLzGFxGnthaSuqiLbpCmfKo+3w7Re8exYkkUnVnyR52dL/lrpoijf5BHkXIyol2jxlbTuEmWCGwSvA/CxZW0gLTmc5PUj1feqfD/BBt2XpP3H6O8I/w5fLxfiHNoh4F47vhjZOqnRVx9ZnC+bTv4IYCXBMKVNB9De+iHJZV5S4pngbcPLHlus9OKWTVioVNrjjsQ9hflEktbi3EB2rUPg2nAFss31mBPVzFDX+0RQLqPnFUkvvbK5Rn1xyjk4vhi+JPkiw+tW+sENHolx65hzDk55oTohRLzfM7OwK4/hiIqEgtQsMixP16VlI3847myg455eurcKe5QyQe+1J4xgtdV+cNzdnrLQcPaRgk1OFqsbzPfGwZrGO/clWRApOrLm9aBpG+BvIa4+rY3kw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39850400004)(54906003)(8936002)(6506007)(66946007)(66476007)(86362001)(91956017)(5660300002)(76116006)(316002)(478600001)(53546011)(64756008)(66446008)(66556008)(36756003)(6512007)(8676002)(2906002)(83380400001)(2616005)(122000001)(6486002)(38100700002)(4326008)(6916009)(33656002)(186003)(26005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?asX/9zl1ze0i7kuEsPEirI38tNt0tuTbfHJCLDSdrgZz75GGHBh6BpjVp5mM?=
 =?us-ascii?Q?RpTq6mUSA2qZb3B3xeXDO4dBsUt041KwiiJzWrfIUfZ+yGyX5shr7648vr6z?=
 =?us-ascii?Q?ksA6L4p3naA/gjnLzmP99yunMqSttp77/7DnLgDYI8KjzoRNnRp48EYoAV3N?=
 =?us-ascii?Q?w/ay2/dcpyr2xAwtDODNYJQ6pyOgtOnAr6cRHON6oi/lg6LpiRqYnFU2mBMb?=
 =?us-ascii?Q?I/DlGcs7wjf5VFspCVBkhrtMRJPjqtjESi/egU+CKslOSBOwFFP4Pq+n+Jr6?=
 =?us-ascii?Q?qfxPmA64/vSIfuoGHdxuvzZEexzAgr3ixYUIcYZiGZ6oCm7QeNk2taef+xlj?=
 =?us-ascii?Q?Zl2ep5dF7ezmKfEpPmEzAtqIBOm8GD+B7g4oI5deuy0YPeKyuWvt0g3fiP13?=
 =?us-ascii?Q?ehno4m1+cOMwns6aR9DP8I2GyTdVekEjOGwoI5ZEXV2oUOdWsjxMUlVbbouO?=
 =?us-ascii?Q?eX/7g73XDAbcXrek82WJ2hX2YGTbjLLoviXRilgXm4g1OoGRTUhFNdbaCaUZ?=
 =?us-ascii?Q?1oF+5sYVBEfdODX0F88BHc0LgmmL77q7OEK1Fc7aFmk93Mz5Ge7IbOTTc7HG?=
 =?us-ascii?Q?IEG77LYEdviTx/LnRTR2Gts5SfrbiF9dazM7CjJjhHYwjKhPNRHafhxGlKlh?=
 =?us-ascii?Q?vYWQzqmZuLKPqRgIUZmZEK1NzHHkGthopinXaQj5DcyHBiC5RVOz8TydQWRa?=
 =?us-ascii?Q?CvW7w6aP72apyM2scWxE+W8LB3i+h/OJ5+sAQpUe6mQ0VelwdQoujb9gkLwz?=
 =?us-ascii?Q?8bB2vHXULPH248I2ykkOLnAY7tMT6zNyCtXBul4e4W9jmuOtKIRpsPWm9+AY?=
 =?us-ascii?Q?LlPzrGDtampqlnSjblK2fRsDtO4JH7dDJzKMCGWftTtb2BfokYq4c0bXoJ7I?=
 =?us-ascii?Q?CBx7g0cCDBrL8U1FBAa5UvPJ6ey6R674Lkh9RW+tOTEivLw2vBZXaeICYR2a?=
 =?us-ascii?Q?aBGClsuzheCPs5hU7gUho7GXQx8GPC7UqvYYYzRIm7l38oLkfQqQOZAhNRHT?=
 =?us-ascii?Q?TrfVDZfJspN1DdTRIQF8+gndt1SohhX7TPclCwcoO2TcgjyvIEhs0y7+VoJb?=
 =?us-ascii?Q?tRtl4zqA4eTgNTabX0T3NYlw3EdUtyPidrQjBwpj2iIhMQ9kKq5+axAAQZ4P?=
 =?us-ascii?Q?/fXqEqboS8E8l+qmCUQHyiA25NS0XIPqjA5vR9DpLXXJ14QyKQGmwrCcntss?=
 =?us-ascii?Q?KsAZcSP9ZWggpVPPciCDkJRL+xn4jv56xP4N81dauzJt2fQMJu8f1HLdQ5EW?=
 =?us-ascii?Q?a/attln8cOpKmj2T9qfQQ+4SIss1fo0U6yBLEqu/5ne4CXpa7peHxXdjpe5c?=
 =?us-ascii?Q?zos9GrVEEfwNti4JX4L/sWT/?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7F657223C9F59F41B3F222575A141C42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2561
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e502022a-e639-4220-fc05-08d93bef5dc3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+NCw31jCV/4aJQ4OS4J2e51O/446p/Clpou+8FSNhjVjdaGn+xsrvrZnSlgeBkLN6zMlHViuqprTShXHDQuCWITAat28WM/23jpxr2RI27tVQuNah/drblZtvv+U84kfn9dnvBFyOBTYoWxAA9heC85VWlRabTVD3lbRJ8ldsosWOqIQstFrnePhCep2//WRKGU4S71efPkYj2gVCfptNLEvJfcStBxTwdZ0ylvkr01VdAGZudrUjMOaWjSoIhsvIiWTUowfCRq20K4A7HWLscHUHXK0EYkayYNqKU9jryFCTsmuTpA7DBZjj/JaiezJOKpEZlluiZ3svhJD/AkCrFkcWBlVepgBwXidNpX3uDLGDVQk7DgfP7hbCY9q9cQBhTzP6xUpjG8LkBjeAky8D+Qt4HEekwTKFwhRBPMv+wx4wSC1nrRfZJTMd+Art1hH/5Pf0HrHFdvjUdHZaZaPznwfEWG6mfxwV/reyUw6Qf2+CJnFb8jg7W3HUTYRl7Dce4K9eo6+kKZ0ZNn5pwl2Rgv6LAwiZMIzfDdcIB8fejuQvVLnYSJmW/Cq43UCK8x2yxhLlexnDRqi1cOEs/4XCeImLYoKS8t8+ZyUCnbteL4Fgmk7n4tZxN+ci5NQ1+TYjkj5ZXvJ9j1mnjBChI8n7SC2n5eIPA4o/oBUCTO3Vstcnz+fhO6VXFOTjLdwMJ1khwlSY+t/4GdNkHUnKDE5dA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(376002)(136003)(346002)(396003)(36840700001)(46966006)(6512007)(47076005)(70586007)(5660300002)(36756003)(6862004)(8936002)(54906003)(316002)(4326008)(33656002)(107886003)(2616005)(336012)(8676002)(53546011)(70206006)(83380400001)(36860700001)(478600001)(2906002)(6506007)(86362001)(82310400003)(26005)(186003)(356005)(6486002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 17:49:18.1747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 055b2dd2-1659-4772-cf89-08d93bef6251
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5404

Hi Julien,

> On 30 Jun 2021, at 10:09 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 25/06/2021 17:37, Rahul Singh wrote:
>> SMR allocation should be based on the number of supported stream
>> matching register for each SMMU device.
>> Issue introduced by commit 5e08586afbb90b2e2d56c175c07db77a4afa873c
>> when backported the patches from Linux to XEN to fix the stream match
>> conflict issue when two devices have the same stream-id.
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/drivers/passthrough/arm/smmu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthroug=
h/arm/smmu.c
>> index d9a3a0cbf6..da2cd457d7 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -149,6 +149,7 @@ typedef enum irqreturn irqreturn_t;
>>  #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
>>  #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
>>  #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void =
*), n)
>> +#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(void =
*), n)
>>    static void __iomem *devm_ioremap_resource(struct device *dev,
>>  					   struct resource *res)
>> @@ -2221,7 +2222,7 @@ static int arm_smmu_device_cfg_probe(struct arm_sm=
mu_device *smmu)
>>  		smmu->smr_mask_mask =3D smr >> SMR_MASK_SHIFT;
>>    		/* Zero-initialised to mark as invalid */
>> -		smmu->smrs =3D devm_kzalloc(smmu->dev, sizeof(*smmu->smrs), GFP_KERNE=
L);
>> +		smmu->smrs =3D kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL);
>=20
> I noticed this is already in... However, I am a bit puzzled into why this=
 was switched devm_kzalloc() to kzalloc_array(). This doesn't matter for Xe=
n as they are just wrappers to x*alloc() but a mention in the commit messag=
e would have been useful.

Yes we can use the devm_kzalloc(..) but then we have to pass (sizeof(*smmu-=
>smrs) * size ) as size argument to devm_kzalloc(..)
I thought for better code readability I will use kzalloc_array() as the fun=
ction name suggests we are allocating memory for an array.

>=20
> Also, when sending series, please remember to create a cover letter and n=
umber each patch.
>=20

Ok.

Regards,
Rahul
> Cheers,
>=20
> --=20
> Julien Grall


