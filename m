Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02737BF002
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614530.955668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq11Y-0004Qv-BD; Tue, 10 Oct 2023 00:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614530.955668; Tue, 10 Oct 2023 00:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq11Y-0004OG-8C; Tue, 10 Oct 2023 00:55:00 +0000
Received: by outflank-mailman (input) for mailman id 614530;
 Tue, 10 Oct 2023 00:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sc7t=FY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qq11X-0004Mw-FQ
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:54:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a07d63a6-6707-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 02:54:55 +0200 (CEST)
Received: from FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::10)
 by PAVPR08MB9745.eurprd08.prod.outlook.com (2603:10a6:102:31c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 00:54:52 +0000
Received: from VI1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::d8) by FR3P281CA0077.outlook.office365.com
 (2603:10a6:d10:1f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.20 via Frontend
 Transport; Tue, 10 Oct 2023 00:54:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT054.mail.protection.outlook.com (100.127.144.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.20 via Frontend Transport; Tue, 10 Oct 2023 00:54:51 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Tue, 10 Oct 2023 00:54:50 +0000
Received: from 83aab5151d11.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B3407F2-E44E-4350-A196-C7934916A05F.1; 
 Tue, 10 Oct 2023 00:54:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83aab5151d11.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Oct 2023 00:54:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8741.eurprd08.prod.outlook.com (2603:10a6:150:85::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Tue, 10 Oct
 2023 00:54:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 00:54:41 +0000
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
X-Inumbo-ID: a07d63a6-6707-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afe1U9zKnZx4eH+OyQZF6dtUvWtuEHnnsoaliymYUzc=;
 b=4dV9/LMzvAoYs4cinc7pGVJXKeDm2ZGMw5UrrW1poQcvTwtgh5mD61qmYRE4EkAdI0lbT9Zy9vJGGtEeOiXFZecSDipwkSyL85x8xVBbokIvCg8HWLiOjJdEHKtYR1qBq3x9EZS3cRSLFUjVSB2wJPReqEqlScLYe7fQQihl7KY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd8da20320a269b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaPKffTT4k5L3XLQ4xmEqdDnfKdyxB3N7c2SvTYuRKFGPPrf4C0d0nXvHd1hrZ0Y+R6EWaWpLzNpchbaM34OPDZsrd0zknnUHeKJ51OoXOBZmyf47yeTObSSPhQ+w+SOH8a2YtO2a2ztBbGPJrtlrYB1NxcSDNgQItwgVuaH3fWxLN968KCi5mca7dULmOPdraX2BNiine37PdNYhxKv17r0kGJ9+i0D65EdxNN3xcTyN7Fd6hvmI/ywxxn09jR1ogD+WVXXWGsylchN6KGaPTtmmyQ6mY/Hw8H/kpbizz53cqZK1zKF4g4cORJBFEUc9IU0KA304/x/G5r6XTfAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afe1U9zKnZx4eH+OyQZF6dtUvWtuEHnnsoaliymYUzc=;
 b=XsXjB9yTLZItUSHl/7vQjX9DJ8gVdcbbxNNYoNRjuTQ3PGW8omB0R8igTHVZweUre3Kvb1eZ/BGBELn2/c7459sir09ENkQuMJzdRyo64c1+srnpiFOceJd8ZPOe1gSlmMwbmGNXETfthXbBTbox8zil/AV7WPxwEwOiJwlGmnzNDaCKXhM2yvGRRwLIh6cpiApJlW73p7xRv6wf8SjN0Ki9LnTce19o/9TxMOs7BCts2lAtWJhZk2GXgLZa1otHyrpNbhMKpIti6fYbdlQLJuRvw5r3w+wAEVcN/4b2QFr6+AaV5dPQ98C8RtB4uGY8w59EHMJNiHNTabnQJEYD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afe1U9zKnZx4eH+OyQZF6dtUvWtuEHnnsoaliymYUzc=;
 b=4dV9/LMzvAoYs4cinc7pGVJXKeDm2ZGMw5UrrW1poQcvTwtgh5mD61qmYRE4EkAdI0lbT9Zy9vJGGtEeOiXFZecSDipwkSyL85x8xVBbokIvCg8HWLiOjJdEHKtYR1qBq3x9EZS3cRSLFUjVSB2wJPReqEqlScLYe7fQQihl7KY=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH for-4.18 0/5] xenalyze: Miscellaneous fixes
Thread-Topic: [PATCH for-4.18 0/5] xenalyze: Miscellaneous fixes
Thread-Index: AQHZ+q9iHFNjuG2A+U6m1bEthA3FTLBCM0cA
Date: Tue, 10 Oct 2023 00:54:41 +0000
Message-ID: <C50D920D-9B93-4C11-9C66-68193B335074@arm.com>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
In-Reply-To: <20231009125137.1329146-1-george.dunlap@cloud.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8741:EE_|VI1EUR03FT054:EE_|PAVPR08MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5a55d3-c49c-425f-19da-08dbc92b82aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uPNeN0ibNj7exrdK5qX8mASXnLDY7D3POEeuVD8ihtAb2iTk+fSZ707gacELPQ5g2oB4ghM1BULB5BRgyTXtuwbL5pnUHtz+RZl1GigP0FPjN9213A2Kn0v6KWfU5MgXnrpHGwigS213oEvOgXga+bYhBgEDaUuPNxOWF2EoFGfpEMMjW2NUxmCL6Odz0UU1fQFJ8TVX1LnGswfB2Uaamk3UetRY0YsfRKc/csA9CKYEfZn99aedqQK+pRBlksSRSQWcy4dsWSvahkvN4jnQokop8rA24o2fz8stCSZUuNMhfO5mnpF6u+w1XoovhujEbf841vF/YCa+kGbtES8AvPwaUGVxqvK5KMpIN9zOUZc4DILOse6nq4gDjXn5tm1iTDA9EmLvq8qC6Hz7XKDWPt+GDDloSmP9OAN5MvK+aFa3Au/xfQsnkRtBJm7dGdDfQae9oFttpNroQxbp8A3/FDPtgOrwf3ect2QuX1Ik3D76+rkNdsYe+3dCmGuegrC3D5TXthQIiDrsIMPs4S13sfxG4SgoLm3hAGCovTejH2GNQppNy9bKFco2mKRrnebCRKezrW08ovkssrXo4UU18E4jBUtgPPaPL8C4iksSrvwr0or7PTFyWm2Z4KdnyBMUR8glJq6GmTxpFZd9tdYlu80JRYl9bnWEUrH1hMp6wXK2zXi3dRyXW/ig46fr4WX4G1l6mHfrXAG6s7KuqFIWvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(122000001)(38070700005)(38100700002)(36756003)(33656002)(8936002)(6512007)(6486002)(2906002)(478600001)(4744005)(71200400001)(4326008)(8676002)(6506007)(41300700001)(5660300002)(53546011)(2616005)(66556008)(66476007)(316002)(6916009)(54906003)(91956017)(66446008)(76116006)(64756008)(66946007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1418FAD13449F44D9BB783641794AFF9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8741
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b5055b0b-09d5-4cfc-24d7-08dbc92b7ca1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ghLTh8RxZ4OejPzD89OuOtRm0tVo0Wx9OPYUlSzuxeYSTAayREsc/S+2LGSTa/O6dzlX1z+gL+Zb9pfmNKvgLYmuI0n4qlsIQqaeRGnHXRDzjoRpcXGNNrAYejiPZx1mFLeGA1HjuNYFiE5sLn1dotrJTQETfmNww0cycthtF1Tf2nDVi/GAGz4nYMCZNj25egYfdE5oo8xL22oupLCz61odfcANXAZKDniIwT167Q+z4wn+PZkB/dcdkKw9CUDsLqXUwiND13bd3vSgMafUssh0ulnCVYCtMWxn3FgcMAltzSm/Rx7h4pv83mwY37gLIlUy4Tar6rsqSWtBHJH4EVFxAa0CvNXdc9FtpQ3BvmZR2aCPAB4siGzA8Vjw4ptZBfh5gP2CMUjZhVbHxdM6+Y90thDaM15ho9lVQmWOBnBD3JGD6pQy7JOUlzf/T43BS6sG7rcWtwck62Ssm6BDndrKNhsNNlDrovs0g883+ak1OTwXrO23ns5OisRDVQgUrPej8+D3nWTRD4bkZznnx0Wq1RV3EzgAmoCoslr5wQ7uANE/hNbVmPW3TVkkXpIfONu82oaXph1C1J2x4kBQpACty55ieaO3G2+dCmYv1MxtE9wu7W+3qbTM/LNjuJa9MTossfY+TxiU9jHIy7+Atl4ml6JOUr4zruKVlA9wQ0nwYXRcWrf2uOcL59x0JcQr3viZ1m0IeizYx6VHvXBQvXozKS7yNCQNW2h1eWC0cFB3s2F3bN1CbmN9RCVNdIsE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(40480700001)(8936002)(316002)(40460700003)(2616005)(336012)(107886003)(54906003)(47076005)(36860700001)(26005)(70206006)(8676002)(70586007)(5660300002)(6862004)(4326008)(6506007)(41300700001)(53546011)(2906002)(6512007)(478600001)(6486002)(82740400003)(4744005)(33656002)(36756003)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 00:54:51.5082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5a55d3-c49c-425f-19da-08dbc92b82aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9745

Hi George,

> On Oct 9, 2023, at 20:51, George Dunlap <george.dunlap@cloud.com> wrote:
>=20
> None of these are critical; but they're also in a fairly low
> criticality part of the code.  I'd be fine with either putting them in
> now or waiting until 4.19.

I saw most of the patches are bugfix so I am fine with including them in 4.=
18,
so if this series can get proper review before the release, please feel fre=
e to
have:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>=20


