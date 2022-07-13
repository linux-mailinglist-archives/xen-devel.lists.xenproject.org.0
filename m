Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54525736C7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 15:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366581.597502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBbyf-0006mY-8s; Wed, 13 Jul 2022 13:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366581.597502; Wed, 13 Jul 2022 13:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBbyf-0006jQ-60; Wed, 13 Jul 2022 13:00:29 +0000
Received: by outflank-mailman (input) for mailman id 366581;
 Wed, 13 Jul 2022 13:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Gea=XS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBbyd-0006jJ-72
 for xen-devel@lists.xen.org; Wed, 13 Jul 2022 13:00:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130082.outbound.protection.outlook.com [40.107.13.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2fe97c5-02ab-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 15:00:25 +0200 (CEST)
Received: from DB6PR0201CA0039.eurprd02.prod.outlook.com (2603:10a6:4:3f::49)
 by HE1PR0801MB1756.eurprd08.prod.outlook.com (2603:10a6:3:7e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 13:00:23 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::7a) by DB6PR0201CA0039.outlook.office365.com
 (2603:10a6:4:3f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Wed, 13 Jul 2022 13:00:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 13:00:22 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Wed, 13 Jul 2022 13:00:22 +0000
Received: from cd6b0393f183.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BEEA80C-C37C-4A1D-B12E-1DDA9B7B5001.1; 
 Wed, 13 Jul 2022 13:00:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd6b0393f183.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 13:00:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB7275.eurprd08.prod.outlook.com (2603:10a6:20b:436::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 13:00:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 13:00:14 +0000
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
X-Inumbo-ID: c2fe97c5-02ab-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OB8/Acq8vsuh5VfuN0GwC9UkCUFWV8f1hDrAQ6NrNFpG9/gQrAbdDeIpLRnncskC467yICEhe0V5EKrzc4EFgeGMnx+gUfZAzTiJzIK+kFUum9op1gvdGZOnwIg39iilIwb5DHj7KsjjlRXD5X1JLMRMKf66H9T4QI43H8Itm+N1CnR59FR652BMf3Zc4oaLkCu11kGoLjckFgEphtyTUBAd+VdlmWpK2NClaTFjlm0wgTvOdJTUVFhkAIGgcgooZbECubzfPE0F/mtOBMVBjtlNZvJtMgNi6+tvBhvkNEA9m3niCZfPYUhRDdWkez7mvWqtlKdnznxG7WAvNGqjWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDYo4wOvY6Lrho9y2FyyQCuhgx04M/UiivuhrzPZcVk=;
 b=QWPNNoxHJ8euIi8BLFJS8lE+ftmNGvCaFDkXgqOxPaFdIAfhK636eLIeZLkcrwOH/NSEUhDLnx9p1h3JuTBRbWAO1kHmlb2pMnWp7fBgyPUJ6ovrLY8xCE76IQybr4FHj3UwR+n4EvE4uck5H+RjqDeUxtCLKW8I7/UZXYY8/HQommutD2YECCPPjF+/ow4Lr9QgAwAJgnWloSIMsGDaYyNZsiV3ptemGxFCRAHYAmNKASjk12ElAWZpkcY2Av0m0GSF0piCaMKI01rUsUW+5OhtweYjSjer1vaKkhUB4ajOztFq9i3uN5tOPu/8t2XWahNhQ1UHz3VeYVUYN7Ktyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xen.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDYo4wOvY6Lrho9y2FyyQCuhgx04M/UiivuhrzPZcVk=;
 b=vCN3O/QuVRN0klOBMY0XhNC565Ioqu/oRnqOtr7nlQBsG12SROvoYqEK1w07e7CjJd+Qhpo7LAnbXs3sjtDPE1/QQkXr1X+07ioo22f2hip/PH0z3NdHvRJCZbF5I3GOk03ZB2jjgwbqkE71oRJk71Mp5X4uM4P9KGHM/nLmVWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f23934f19affa843
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXbildlevOMwwp70cankMXDctG7lV6ClByBTbRLf9H5JNvvM0bDAEdIamERQXUoIgbydzUlCE47Ebso0jodQ0o7i4J4Sqj2Wq70D1zfhVouOlXbJAmlquocENuG/pJ497lyANydt9fbqkyzZ/lmpwOAZFlVfTy0l6jKo4weBDJj/DEFgA6quXVdc/nB6uSuYKIcAb8TrnnJm+fBu1XwQhxCyF06vXKmycdkdbVNWFNxtGQjKQ8m47coP+3Z2iF1W80OXQ9vEwEY1QSAbD7Q1+UA9yZMrEkAhflDC/xgEwOhKPrptlFQp5URMz/6OPPkztXU7iKhXj2kjF55PPtEbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDYo4wOvY6Lrho9y2FyyQCuhgx04M/UiivuhrzPZcVk=;
 b=UMvtPS7Hs9LbRzKeetAxQW8SlTc9tm6td090xLI+czQNdBd/TixkV6dMJP53suM81A2Htt4o6NFOtaUd/zF7Cc0r0NUkd5DAqW4NM/tV0IIYYeTOAIzmm2DOIvHDPz5sa1q8c9Fk241IuXz7rXZNyQlF+CP9SLeLUgsxB/pJlanjDO6vbUkNrOU6w9TnWzwc3CLG1yBET61VDmVgM2LnjLl0UnnNuAuzPYiADpIDgg5vDSsVy6hz2CQRKiCL41glOkhwnRe70+aJ4kIpKntIkGdnh1bJ/DdQNwrgSTHzd5RgBry3Oqqz9HMmNnNnA/6/kkM0liJJx8HxAyDqUjJgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDYo4wOvY6Lrho9y2FyyQCuhgx04M/UiivuhrzPZcVk=;
 b=vCN3O/QuVRN0klOBMY0XhNC565Ioqu/oRnqOtr7nlQBsG12SROvoYqEK1w07e7CjJd+Qhpo7LAnbXs3sjtDPE1/QQkXr1X+07ioo22f2hip/PH0z3NdHvRJCZbF5I3GOk03ZB2jjgwbqkE71oRJk71Mp5X4uM4P9KGHM/nLmVWs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Brad Churchwell <brad@cachengo.com>
CC: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: Xen on rk3399
Thread-Topic: Xen on rk3399
Thread-Index: AQHYlaRzw0VI/DSwq0Ot3R+564rcea161i+AgAAPUoCAAANZAIAAA34AgAFZWwA=
Date: Wed, 13 Jul 2022 13:00:14 +0000
Message-ID: <81265FD0-2D00-48D7-ACBA-0F7A4FF3DCAA@arm.com>
References:
 <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com>
 <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
 <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com>
 <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
In-Reply-To:
 <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 11ccdcab-46dd-449d-6d90-08da64cfa592
x-ms-traffictypediagnostic:
	AM9PR08MB7275:EE_|DBAEUR03FT019:EE_|HE1PR0801MB1756:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fLxH4rpQffoGFQOwJlTig6vXJ62KGRSqSOqHSn7VnM60ISXoabDJKE/zj1hFzEToU/c1sIWWeOEAPXdtP+lpIpAp5+yiPoQsiy66/F1NHuBsMgignjAY5RfQNm6p4eQ7Dj0+l+zGSdEZdajwNHbp8dNKvjBz3Djd70ClUoFMNCqJtKzJRnZXM7oMGLpbHl78826+ykje0YoyVG7bOp37MUAd5U4PQJFPsAt2yuVd3vomi6iPKXd1kjVyzkuECwKrjKh4pDKFbO1vP/6r7DF1Fz9ToY1snjwYPU9/XO0gaA9eBBeX0960OL8fYVTpnI6bRCEcFqfAYmasltGDF0IM5vzATwG0bT9ODA1piQK0YBx7AtFh/DSb1gaT9TzSw9cBoJL5mAdyaPpseLfhTKL0KWfbuabost+eodhZpXHJshPyxE3Dzf/+LAfH14k2mYbugw/7PiNx/bW47yJUJWkvcj6PC1BoUVn7tQ8N/gw+UjFRs6qbjMWmXqcriyYCgAPY5s8FKKNNaZjZqq2GXOvw/zqmwKs++hq3pOJTaWpDVRnbVNfWUptLsgqPFYTIECUs4dN47GSmBXkSh2QylUAe/Bp44fG0URmVRjOCXXBer9Tla96hUi3KJhmpQjkJy2qusyXYKAmoOHb0LYukkzmlLTOb1n9r4qarMPL12hgu9ecEi5QPQYG6k9LzWeFbj5iIFr7YbBUB9rg+bkcMOQM9lzJ5slpp2B9SuWFMziZ76ctHTuObcg7MajMMExQxYdNlsbi8DJr2Il2BQ9d71i1Qpfo+PIoMxR1xlfVhOMVXKtgPI4h91xvsEN8awif1r13uhTp/ZdudK/ptLQC9CbfKvTZwkeQx3oVnUb2TDVnwif8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(6916009)(186003)(64756008)(2906002)(83380400001)(66946007)(6486002)(66476007)(76116006)(8676002)(4326008)(66556008)(66446008)(316002)(33656002)(86362001)(36756003)(7116003)(2616005)(53546011)(38070700005)(5660300002)(8936002)(478600001)(26005)(6506007)(122000001)(6512007)(41300700001)(91956017)(38100700002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1B05A348159B4D44863D8185ECA0D89B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7275
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54c9c883-f476-4bde-19ac-08da64cfa0c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dKBbAeYLPE/SkGPOUysbk+rgt+unS9ecy0CFAZhy6ZLtpUKg0JQBFQHO6K+8vCGWvFoA5U/AaSth/ir9gPJkf7PFWHzMS0BXJNptFBI4dFy3NeaqGrhlbC5JYOimf6xOZ3pbmCZjRMF8AT0lVRxDPsYG9A3S7SZ2CEvcFITIljTh17IyDA9jBzksRcJLldJtiQ7cgFq1RBnKnvcYLdHdQ8b1T3l3WQGgZffbBOTmwVwjGSuWw4SEYPJJ/xmCQDDO9VO/CjVH1W78xw5N6i4B0V+fY7MhbBaXIczSuuxAR98vjSDdwPX0kyXqtbTPs8HDxz/ND0ZMzrx9s+JTLnyoyAlZ8+5Ys41iL6R2OMi9R3N2R1zb/iAyNBes0CwusAKZ2yeEoFwyedHNFAAbdpXtfbIQYOuLZyFRmyL6mFtEySCIfb4BODS0a1WEeUs4bGvjY3ZVltCsXPjP55j/CMtMjXbzD1AGb+Ty8xw2jmtNfRV6ilvyl0eYnwpKRWhtx5x3wWtgcmNC234pH3EvQVnRj4W31EJiGZlx/pSDBNoFvWw1NKYWIe72wmeEHh/CUZ1gxQbv7MQvC/xnr2Th5TvAC+bEYWwEEdfpihWz93TnEgu0AIv7ruNv9Z7/MYPmlFWSCnygXs80o1fc28KuI9fe+6eKXZinw1jj4EGleTTgm8NAbUMoS5PgIGvaqcldKLHEX/+VwMBv6sGIUX5+HZdPRpaDR2Q87YeR08vvg2pxtlIym09bP27oi84Sg7UFrUuPA94Hd0cs5AuxfoyyRZp251lGbcMyg/OytYUaS4ia4QMrDAwVoXH8fIhDViiYUmWQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(5660300002)(40460700003)(53546011)(2906002)(6486002)(6506007)(33656002)(316002)(478600001)(81166007)(26005)(36756003)(41300700001)(82310400005)(6512007)(70206006)(336012)(36860700001)(4326008)(47076005)(8676002)(40480700001)(83380400001)(70586007)(6862004)(86362001)(8936002)(82740400003)(7116003)(356005)(186003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 13:00:22.5191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ccdcab-46dd-449d-6d90-08da64cfa592
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1756

Hi Brad

> On 12 Jul 2022, at 17:24, Brad Churchwell <brad@cachengo.com> wrote:
>
> Hi Bertrand,
>
> I believe I understand, but just to clarify, should I leave the ppi-parti=
tions block in rk3399.dtsi as is and disable the little cores, or should I =
also modify that block?

Disable the little cores and remove the partitions.

Cheers
Bertrand

>
> Brad
>
> On Tue, Jul 12, 2022 at 11:11 AM Bertrand Marquis <Bertrand.Marquis@arm.c=
om> wrote:
> Hi Brad,
>
> > On 12 Jul 2022, at 16:59, Brad Churchwell <brad@cachengo.com> wrote:
> >
> > Hi Bertrand,
> >
> > Thanks so much for the quick response!
> >
> > I should have mentioned previously that this device tree and kernel Ima=
ge (5.15.16) does boot properly with the rootfs without XEN. The interrupt =
errors are only present when booting with XEN.
> >
> > These are custom boards and they do have usb c, however we are unable t=
o boot from usb as it doesn't receive power.  We currently only use the usb=
 to flash u-boot to spi which requires us to use a separate power adapter. =
These boards get power and networking through a custom backplane and interf=
ace with the backplane via a sata style justice (I'm not sure what the prop=
er terminology would be here).
> >
> > Since I cannot boot to rootfs with XEN, I'm unable to show the device t=
ree there. The only bit that I added to accommodate XEN is this bit here:
> >
> > chosen {
> >     stdout-path =3D "serial2:1500000n8";
> >     bootargs =3D "hmp-unsafe=3Dtrue";
> >     xen,dom0-bootargs =3D "console=3Dhvc0 earlyprintk=3Dxen clk_ignore_=
unused root=3D/dev/nvme0n1p2 rw init=3D/sbin/init rootwait rootfstype=3Dext=
4 ignore_loglevel";
> >     modules {
> >         #address-cells =3D <2>;
> >         #size-cells =3D <2>;
> >
> >         module@1 {
> >             compatible =3D "xen,linux-zimage", "xen,multiboot-module";
> >             reg =3D <0x0 0x03F80000 0x0 0x01aa8008>;
> >         };
> >         module@2 {
> >             compatible =3D "xen,linux-initrd", "xen,multiboot-module";
> >             reg =3D <0x0 0x06000000 0x0 0x02000000>;
> >         };
> >     };
> >
> > };
> >
> > The gic declaration is in the vanilla rk3399.dtsi file and hasn't been =
modified:
> >
> >         gic: interrupt-controller@fee00000 {
> >                 compatible =3D "arm,gic-v3";
> >                 #interrupt-cells =3D <4>;
> >                 #address-cells =3D <2>;
> >                 #size-cells =3D <2>;
> >                 ranges;
> >                 interrupt-controller;
> >
> >                 reg =3D <0x0 0xfee00000 0 0x10000>, /* GICD */
> >                       <0x0 0xfef00000 0 0xc0000>, /* GICR */
> >                       <0x0 0xfff00000 0 0x10000>, /* GICC */
> >                       <0x0 0xfff10000 0 0x10000>, /* GICH */
> >                       <0x0 0xfff20000 0 0x10000>; /* GICV */
> >                 interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> >                 its: interrupt-controller@fee20000 {
> >                         compatible =3D "arm,gic-v3-its";
> >                         msi-controller;
> >                         #msi-cells =3D <1>;
> >                         reg =3D <0x0 0xfee20000 0x0 0x20000>;
> >                 };
> >
> >                 ppi-partitions {
> >                         ppi_cluster0: interrupt-partition-0 {
> >                                 affinity =3D <&cpu_l0 &cpu_l1 &cpu_l2 &=
cpu_l3>;
> >                         };
> >
> >                         ppi_cluster1: interrupt-partition-1 {
> >                                 affinity =3D <&cpu_b0 &cpu_b1>;
> >                         };
> >                 };
>
> Xen is not supporting PPI partitions.
> I also saw that your booting using SMP unsafe so all core are enabled by =
Xen.
>
> Right now big/little is not supported by Xen and here you might have some=
 interrupts in your system which can only occur on some specific cores.
> I would suggest to try the following:
> - only boot enable in your dtb the cores with the same type than the boot=
 core
> - check in your device tree which devices are assign to the ppi_cluster n=
ot available and disable them
>
> This kind of configuration will be tricky to handle so it will depend on =
which devices have interrupts that can only be fired on one cluster type.
>
> Sorry but I cannot right now check in the device tree and do those checks=
 myself but if you do get the idea send back a mail :-)
>
> Cheers
> Bertrand
>
> >         };
> >
> > I've attached the device tree and include files just in case you'd like=
 to take a look at those.
> >
> > Thanks so much for your help! I've been at this for weeks with very lit=
tle progress.
> >
> > Cheers,
> > Brad
> >
> >
> > On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis <Bertrand.Marquis@arm=
.com> wrote:
> > Hi Brad,
> >
> > > On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
> > >
> > > Hello,
> > >
> > > I've been trying to get Xen to boot dom0 with my kernel for weeks on =
an rk3399 based board and thought I'd reach out for help. It looks like eit=
her Xen is not properly recreating the device tree or the interrupt control=
ler is just failing. The hypervisor boots but falls to initramfs because it=
 cannot find the root device (nvme on pcie). Any help would be greatly appr=
eciated. Here is the complete boot log
> >
> > From the logs you have an issue with the interrupt controller and the f=
act that your NVME is behind PCIE and as such depends on ITS is probably no=
t helping.
> >
> > I would suggest to try to boot on usb as root fs for a try.
> >
> > Also it could be useful to compare the device tree on xen and without x=
en to understand what is going on (using /proc/device-tree).
> >
> > Xen seems to be ok but Linux is not happy with interrupts and is showin=
g several issues around this area on your logs.
> > Could you show us an extract of your device tree around the gic declara=
tion ?
> >
> > Cheers
> > Bertrand
> >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
> > <rk3399-zaku.dts><rk3399-zaku.dtsi><rk3399.dtsi>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

