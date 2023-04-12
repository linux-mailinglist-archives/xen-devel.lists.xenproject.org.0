Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5B6DF123
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520114.807465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXAl-0004a1-HY; Wed, 12 Apr 2023 09:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520114.807465; Wed, 12 Apr 2023 09:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXAl-0004Wp-DL; Wed, 12 Apr 2023 09:53:51 +0000
Received: by outflank-mailman (input) for mailman id 520114;
 Wed, 12 Apr 2023 09:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QpzN=AD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmXAj-0004Wj-Td
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 09:53:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf629ff-d917-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 11:53:48 +0200 (CEST)
Received: from AM6PR0502CA0072.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::49) by AS2PR08MB9197.eurprd08.prod.outlook.com
 (2603:10a6:20b:57b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 09:53:45 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::aa) by AM6PR0502CA0072.outlook.office365.com
 (2603:10a6:20b:56::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Wed, 12 Apr 2023 09:53:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Wed, 12 Apr 2023 09:53:44 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Wed, 12 Apr 2023 09:53:44 +0000
Received: from 67a50924a495.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36914FB2-8A4A-4FA4-B5DB-DE8B80D3CC03.1; 
 Wed, 12 Apr 2023 09:53:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 67a50924a495.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Apr 2023 09:53:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9259.eurprd08.prod.outlook.com (2603:10a6:102:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Wed, 12 Apr
 2023 09:53:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6277.034; Wed, 12 Apr 2023
 09:53:31 +0000
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
X-Inumbo-ID: ebf629ff-d917-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO87h/B4tZJozq0ApWzW4uhvl9hVnbZ2lFC/3noO028=;
 b=C/L9risaHhZUG3Dmu3fQ/dmwj6LvlLersWBeU5ksbHuZic/ZT1VeXYvD+pB8c7rkwkfyJw6+HvBnG4bsemmzt+eT0gmGwKziqFrC04GQFgn25DbYoFZiLrgouhqwLFvNwFqZ2Eedae9BSp6BSZR98HLaIHBJRFmNDL53pbL6BYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoNwsXgjmy1EAIdyurOWW6n4leyLPEljdROlzYVGG1fEWlSBd16IbBvYxtQmaf6k65JDU4Dtod+dEkCM+V+Dpb/fIWEOKlEUnYO9uEv59v3CRFempIu+gzIUnMwGRlxID47ql732cMr3mFetdavvMZ2Cr4BjafZLu+abQZIcg1uFM9v/OF5fRdnJqIgq1M1JbzWDiFb66oghgmHxvEylT5DPwhyv7seWdAuyxGQMBuIzS8z4GGR0LAmwXNFBa90fG+ikf70KHCYcfHbOhk1eOgoMQ8VyEc326lnXYVEhbj0n1rYwhpvTfy8Cfmt9Y4c5JhtdaRMG6vxcPS14Jm6YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QO87h/B4tZJozq0ApWzW4uhvl9hVnbZ2lFC/3noO028=;
 b=Jf/TFL+SkzxTP/iP6jeW5IKycRdLzQPmN5A4Omd6FG4Y7m0GVp2xy5dcjcEKfjmEa0JiJI3e5XDoMjqWzP6Lz1Ddij3xnQGpL15mDM3fP8fGPo5ffGLvyzTyEGYebkFPxENGvr4wcx4HxW4xt/SRVHJUPtDFFr0Pzv5YIUBQlPbi8Lw+SMagOfNur2CwYObubQ7qjzM6JQT/Av+EnBLcDAUhdpEmOUSGk52qvEy6eFwFYcaM14JinT9xctbTMV1+UY4xQZ2jHLIt058i4GOczUhYYSojsamBW799f+GdLvl8obdwLxEZh10zgrB+jO0cGOrWvZEzgA9G2R6UGoGXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO87h/B4tZJozq0ApWzW4uhvl9hVnbZ2lFC/3noO028=;
 b=C/L9risaHhZUG3Dmu3fQ/dmwj6LvlLersWBeU5ksbHuZic/ZT1VeXYvD+pB8c7rkwkfyJw6+HvBnG4bsemmzt+eT0gmGwKziqFrC04GQFgn25DbYoFZiLrgouhqwLFvNwFqZ2Eedae9BSp6BSZR98HLaIHBJRFmNDL53pbL6BYo=
From: Henry Wang <Henry.Wang@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: RE: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Thread-Topic: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to
 the changelog for Arm
Thread-Index: AQHZbSQvpEqMQcYfY0uxDJPB32sRQK8nbmLA
Date: Wed, 12 Apr 2023 09:53:30 +0000
Message-ID:
 <AS8PR08MB79917190E2A5730AD295026C929B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-13-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-13-luca.fancellu@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5324AD9204C32D4C878C8D9CCB826009.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9259:EE_|AM7EUR03FT018:EE_|AS2PR08MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 341cf477-8d53-49c5-99c7-08db3b3bcdef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xN8aDDBN3fuygun8SjjIegaQaie0tu5S5wPUnHvxN6plyoeBl8eHGVP3B/lwDCuvIkCOy8GBdBt/HfiJV3m6QXC9bIo8IuaShasVWlPypnNjhMQKdYnAIcqPRXBeXKvkDWz4w+E22qfbdcxE9ATzYQkpHbDGFNgT1M6vyAEbD3vbURKCe/cqRUPUQcujyighDxjhOKqhuelb3mBQd/GhW//oi4pPy4eBvBwwu22LhLMUcPXhkfSKPtxXa1YcXrFUGUVMB+pHFmSg8a4Xbh5rSco0N2p9dn2dvFEGA/9Jvnexfo/UbE0zE+xNIgEaPKZN81fbK18Psh51px+x9FcC7BXD8uG/TNQHfXxN/kQcJeyiKymljThFqS5z2SG3wrqY0+Xa2ZHQU0qOqhsJWFBEeJMGRLVsRwLYIjSeeP+HmmDiUaE4ofamlb/qfqgH6MLlWcdGOOgZP44k6+0J8gGiwLCX3pxKl9uRVKcOqWeuAHZnWinZ9kOGD1M/kzefGl711U7U18xJCmLI+7pkY9UxS+8Y91DyfYJyrZfyW+zT9dCt7GAJKLhqqKdcNYv+BDuItYQdC3dIlbbabdWLRk8nKb1z6aJ/ROPx2ocefBLXiZwDyJmkFbHfKkJlCFaXXzL4EUW3iA/YIt9AnmqKAkKfeiGPzvObC2KWetx21Eea6Wn9lk1cY0BLckbvlFYxdIaeiLj/XmVO5I60SEAx53M88A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(38070700005)(110136005)(38100700002)(54906003)(122000001)(76116006)(66446008)(66476007)(66946007)(316002)(8676002)(64756008)(86362001)(66556008)(83380400001)(33656002)(478600001)(4326008)(186003)(26005)(41300700001)(9686003)(6506007)(71200400001)(2906002)(7696005)(4744005)(8936002)(52536014)(55016003)(5660300002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9259
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78b7cde3-9b4f-4587-f4d6-08db3b3bc5be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pn/9IaGY6XTNLgidpgRzDNPZ29+uVXLwCmAMP+DzzDurhaDEVDZNlHtSIjpQ+il9lTm2+0EwMZPmIgCiYr7nSogQuAd5zbOTl2UwSstk7qfBs5UwqHRuNi55nesZZgyOgSoeJSnVvktlvQTVQZQ1eQVJyGnWeQhiLVQxOtzo+v4bQxwlGxjagOdGNQEBmYeaDmAWIigqbNA5DwMoYjrsELMmRTLnpBZDSxO59aA0w6q4cewmyaNXHAQ1WiPeK2st2f6OSy+2hsJg0YLC+eIjwCeePglMC0eMf1/5dMqj4Ju3jjUdIofHpucF1dPuLGl4oX4ZGdOpVfW6/E6vpDJxM/slnxRBI4GvyjGWXmuCFkxduk4z0c494xVAa6Xv1nnN3dlFV8JacGinmy1vP12k1HjwRv8+ENKvPKtpPAa9zusejdSQGa4UYgr1Gmt6c/djRpMxfurKVNGawzCNeNUaalhmmEzfpiAfA4n0IkLUWo7UC9yDBpscNY40paprsCx1ocKVL25A0JfBGoI19S7rDDR2cke0Ay/HnW5ZJUl5y3ZvHt4vGIx0Vc7z4aqBM4d1DN5ZgfVS+YLLcEshYffyVD5G93p3MCZ+k4kkShzslDh2JUYwJU6OEN10VqXsS8DWTLJVcagAsePQecMBJV09gO/Giz8p5bnBNpsiphXhZebXDO96+shggM3hd7ifCSc1nEP8bEvPwc/2Kx0p+/H67QQGKAFU/ExRFmSMTx5UtaONJx0rxebjy+d+jSgcb7mJDk61wVnM2ZfDwcIAbTbUGWa04bGjUzdWDT8Xgqnrni4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(336012)(47076005)(83380400001)(478600001)(7696005)(54906003)(26005)(186003)(6506007)(110136005)(9686003)(41300700001)(2906002)(52536014)(4744005)(33656002)(82740400003)(40460700003)(5660300002)(70206006)(4326008)(81166007)(356005)(82310400005)(70586007)(8936002)(316002)(55016003)(86362001)(8676002)(40480700001)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 09:53:44.6729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 341cf477-8d53-49c5-99c7-08db3b3bcdef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9197

Hi Luca,

> -----Original Message-----
> Subject: [PATCH v5 12/12] xen/changelog: Add SVE and "dom0" options to th=
e
> changelog for Arm
>=20
> Arm now can use the "dom0=3D" Xen command line option and the support
> for guests running SVE instructions is added, put entries in the
> changelog.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

If Arm maintainers don't have any other comments, you can keep my:
Acked-by: Henry Wang <Henry.Wang@arm.com>

If they do have some comments about the wording, please respect their
comments, thanks!

Kind regards,
Henry

