Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17C5EBDCE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 10:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412335.655597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od6KL-0006rF-6d; Tue, 27 Sep 2022 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412335.655597; Tue, 27 Sep 2022 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od6KL-0006pQ-3x; Tue, 27 Sep 2022 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 412335;
 Tue, 27 Sep 2022 08:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/4/=Z6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1od6KK-0006pK-0X
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 08:52:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5943e49-3e41-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 10:52:26 +0200 (CEST)
Received: from DB8P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::19)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 08:52:23 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::50) by DB8P191CA0009.outlook.office365.com
 (2603:10a6:10:130::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 08:52:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 08:52:23 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124");
 Tue, 27 Sep 2022 08:52:22 +0000
Received: from c7669fac352e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD7783BE-F834-411E-9CC4-FACCAD1271C7.1; 
 Tue, 27 Sep 2022 08:52:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7669fac352e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 08:52:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB8236.eurprd08.prod.outlook.com (2603:10a6:150::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.23; Tue, 27 Sep 2022 08:52:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 08:52:09 +0000
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
X-Inumbo-ID: b5943e49-3e41-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GAh3nrUQPRvLFIgdF/GjEdzamB/gzm3LfPKRSQjabysbK7+edGrhhxOZC7Nf2JKPN40HRld2LRnWTI42lw5aKJ7Wf1Wu6/IcPfWV9bd84dgVHNowlgjl3xfLwEzBNBZtzlPA/l6B9GzfphzGA4zrkvrimOouy8bCy2yJWjZxlP3//m1gZrGVHhBd0AzAWVOVBs82JFxF9ApKe9K0MgoU+JOFXt4e1DIDW4J7hG3XeS5IU4szZE18FuWv/QaNbuSdWN75J/y2tA5Jy8CAxuQZlvbO75/ZcpfDaZT7SKmAbu6EgxwF8sVdX8Esl0SFLlvKXmnnYAahYYRT5RKprMln5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr5ei3TBMtd3oBXoxDlUTfqMslleIbEDMj91zGmSkQQ=;
 b=oNtpuQ97yE0hgAA0j/GwRoeFgh1W+e5P6YQeLxvoTQlGXUztTSHhTG6q1k8EgII3XKITN7qsT3yMGJWnHwbyWX3o0egQ3jwHDhL65NGSixg3u4wNj4Qxe7zQyChCV3hawmaCSsvsSvBJbE0lkbTEslZ5LEt4dsrCzlcsRy2aBXZGjLSdblooGfKXrQV9PJbfeAugp0CIXVCd6rIXF7rRfYSna4DP3uu4SLG1kl+Aji/hQieRcmG9pqxSqzPXOjPDRxuNzoG39JaV8V1ftNF6pgdyrxeoxreJ++Oj4iq9QFSx//y9fK5xaZB5QlNqM9AyP9pcdt4LQtx2pUCz2KFT2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr5ei3TBMtd3oBXoxDlUTfqMslleIbEDMj91zGmSkQQ=;
 b=m0Wfk9VMaaAnY9res6N0JibacR4bvqDYCLmtsgUgDghZELDjzzEMeYEidJQxXXUeumpBYC2P3HJjQbe02TDMzDRhP0AfFWlGGcbl8y8w+/t4qkdddC5PaMMXOUq6/gur6RdzW9b68jIQapBqKkJzDiopK6Iz3arc7roOTRoWNkc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAbdnKrkTaVFODg8iTEcpgr+xjmh2PU7NzLNd1szympFTbElQV6od2ont5lCBIhy9njFJ3HN52Scc11E/xBdlY/bQOD7ZkrYlvNkMSvgOZA1zrppp/bGPd8+bo9fG20Y4VxisKeEh0XuayEfjZojhIyQwKBlNj80JPfuCv5GnmvoivzzNmKMyn7wj9fXiwMxnGN3dN27nPfjZl4nzSAkY+ctV+b4/LY2gpWB70LLPw6+sqWe5wWRfAxh5S8fxkJMscD00NJeExqI3XW42OXvI7TGdvH1svb47Fv2tvkEosTezoGLgH0e9VJA5l5dv1uj7wZXquODX8rx+7HNYd2fhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr5ei3TBMtd3oBXoxDlUTfqMslleIbEDMj91zGmSkQQ=;
 b=aKBy7Jp8ocyC3ohBHbKGiYdS2JoNPfEm4TdbRGlUEYF2Hulod7jFljDcHpQEMCclRbTVbNKcbN1M02w3b5j9rdEltZwYpqf56p3tc+Zm0CVO2cBOrhTOSyayGj8aqMiVrdFTMzuOeDtsPG2Hv5dq04O0qHJTfRzrZteT1yVKjLuP36qwEZvEWJXZEv1paBJEqbjjO5AFfz2agwyOG70u1ZmfkZRlP6yr6F+agbdtDj7IuZ6zv3pJkKfBRqaWIi4gGGsMxRj21N742PnDa9Xjv2Z2jkiFB/8XkfOXemp2+sLOeP+zcj6kYmDnTuowGwhmvwlfLbJfcdGUXXBRV/WDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr5ei3TBMtd3oBXoxDlUTfqMslleIbEDMj91zGmSkQQ=;
 b=m0Wfk9VMaaAnY9res6N0JibacR4bvqDYCLmtsgUgDghZELDjzzEMeYEidJQxXXUeumpBYC2P3HJjQbe02TDMzDRhP0AfFWlGGcbl8y8w+/t4qkdddC5PaMMXOUq6/gur6RdzW9b68jIQapBqKkJzDiopK6Iz3arc7roOTRoWNkc=
From: Henry Wang <Henry.Wang@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 0/2] xen/arm: static event channel
Thread-Topic: [PATCH 0/2] xen/arm: static event channel
Thread-Index: AQHYzzwI4ibs40y+fkGVR4ez/jLiha3xpAUAgAFXRYCAAABYwA==
Date: Tue, 27 Sep 2022 08:52:09 +0000
Message-ID:
 <AS8PR08MB799149752EB316ED61D8FFE792559@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <D0DBE432-5636-47AD-B6B6-CCC1D636CD19@arm.com>
 <F4D3022A-EE47-4178-98DB-9E221BED49C6@arm.com>
In-Reply-To: <F4D3022A-EE47-4178-98DB-9E221BED49C6@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 65B197C43C20FE4C88E63AD5EDB67589.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB8236:EE_|DBAEUR03FT010:EE_|AS8PR08MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e31594e-f762-4f8a-2442-08daa065983a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mhbnBYikFPv37DJeyO/IfGJYLzUeZ75dJ5G3axVxGsBtl504KHtvUZoqUp5MVefIy2VO801hHJ/CFrFivQMKIZYc9BrKY43L4EIEyR0ojWV3cAH5x3f6iQ0mJWoJxQn9S+dBGn1oUfBYUyrM6hHLxSLS5ejsiIh0pfeU43GRF6dRGl8/v6uQefVNmyfQYlL+RmU34SQ8vQ2WdpT+fpMX+FADdR8ti2UlwYI0lT/H6yvMWC/Zh8LvjOI04qhhBfKlygJ7ANMsMtNOhTLRoyIGba8G7BTes0kdHO7OVMF4ZD7VxrfP5g7rl8ixk1lLcDXGEz0AseEXqv/PcE/gxsj13SqXN8CZZXzdtnCb/Cm9NYxFk8CrAUvcvtW3ERw4HntPklUp9hajAGtbnUlMHedGdUp4NEXJ47t89tEvf2qCrtpC+zxnv9zWd11z9Kvf9Bk1is2xrcRAjdIMdr0fbyNg5CNyW2nRPG32PNAJwcXwZxRAFc5XkM4+lvgtiULyG2eMdBbyDFJWwFuzTAfR7xGgyMI01qgSP/jKWTlG+6BgfbQfpvKkVQ51/dknVOJgynDNOuXNCBrwIYOL2zjVkEEbXxEIkKBY5b/xVpO7OxJEloWNCZQvaN63AcH+ohoihbVaJHcYJDU6gUQKzfc7cLQhIAr+wH4llv101SexwZGBLpZ199RGifl8haz07zGD3CeRnPlqtWWR8j3TTccNFPyzjWnpsmjQ/dXmMh1lWMqJLyB+32axcga90yhTPgHR1CREpGwSN67fDUNQtesrW/RgrA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(5660300002)(38070700005)(52536014)(316002)(33656002)(76116006)(41300700001)(8936002)(66556008)(2906002)(4326008)(64756008)(86362001)(66446008)(6506007)(7696005)(53546011)(83380400001)(66946007)(66476007)(8676002)(54906003)(9686003)(26005)(122000001)(186003)(110136005)(6636002)(38100700002)(71200400001)(478600001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8236
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2ecfb23-eb26-4470-ab3e-08daa0659044
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i/S4Ioz/7UVFe34/NLXXh4LiCW9c6jfwBw+8a+rG7duoTQqJ4Dx94b/INqiNHrxiriNlshmee1XXZQ70lRRLYB4o/RX4OnMx0nFrUnzvGguqj3p3nfWc5x7VhX/+OAxGzOBn/qT6BIfS20+r0KgoCdv6bQjx65pt1GWLd1My+p/DgDw+h/micw6Yfhvk2oaBioLRPSJ9GUal3uRuTPx0F/mmTCF05fjOkjuMfqdV/1hmUvpia2GV1B+My4jkfH8CTLYxc3D0aPIKtIdhuEOatSSXOQ7QPraCTJLpEMPpYde2Y8Ny1FmHgI5jQDDrzMUt44hKEo4N/u7ixaj4aRJ2dQHCnynTnsbZYyQQEWNGpZ/oU337rw3DOsEYiqJTfWHA4Ux/CYJRU67zINjoKdVQ2YO9hin90zsCfNgQ8t7e4XNNzsVSSBpPwqDV7Dsr9ykA2Pps+2WQDJ1rj+wp1h4mlbnq/YDIOlpdTDXDqZbEPZPplW9udaURgOrJDgjH5/kECVlFY0/qddgdQumGBM1nHVxSeFPgxdqOCbVRBuqcSW2TTwmffUF6ZeNBL1PBGlmNd6LVC9jZ5EZ8OReICGRYTymWXSV8nzy2tzsha2hUe28867pU2vkZKIqEp4oUYa8bHVZIKtqH/aY/wSJ2HqUb1hEfu5adnUCUe399u2orfZh0yjgDioSWi1QBqnWH68hnJtZ7pb/DfdDSq2DeWyw+7WeQP0D0HcEPSXcVJim8i6VvDfSPCC8PF6856ZYROaFIMTTr9gWTZPQVArlW8RjtLA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(107886003)(53546011)(6506007)(7696005)(478600001)(9686003)(26005)(2906002)(5660300002)(8936002)(52536014)(55016003)(33656002)(40460700003)(82310400005)(40480700001)(54906003)(86362001)(110136005)(316002)(6636002)(70586007)(41300700001)(4326008)(70206006)(8676002)(83380400001)(81166007)(36860700001)(82740400003)(356005)(47076005)(186003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 08:52:23.2434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e31594e-f762-4f8a-2442-08daa065983a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071

Hi Rahul and all,

> -----Original Message-----
> From: Rahul Singh <Rahul.Singh@arm.com>
> Subject: Re: [PATCH 0/2] xen/arm: static event channel
>=20
> Hi All,
> > On 26 Sep 2022, at 1:12 pm, Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> > Hi Rahul,
> >
> > Please give the necessary justification for inclusion in 4.17:
> > - severity of the bug fixed
> The severity of the bug is high as without this fixed system with ACPI su=
pport
> will fail to boot.

I agree on that, dom0 boot from ACPI on Arm is what we currently supported.
So I think we need to fix the current issue for 4.17.

Besides the bugfix patch, the other patch in this series is a pure doc chan=
ge
so it should be safe.

I think we still need Arm maintainers' R-b or ack for this series, and as l=
ong as
This series is properly reviewed:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

>=20
> > - probability and impact of potential issues that the patch could add.
>=20
> As we are not supporting the static event channel for ACPI, it is okay to=
 move
> alloc_static_evtchn() under acpi_disabled check.

Agreed.

Kind regards,
Henry

>=20
> Regards,
> Rahul
>=20


