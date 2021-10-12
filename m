Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC2429D6C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 08:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206749.362393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maAqD-0005qy-HV; Tue, 12 Oct 2021 06:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206749.362393; Tue, 12 Oct 2021 06:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maAqD-0005nx-Da; Tue, 12 Oct 2021 06:00:45 +0000
Received: by outflank-mailman (input) for mailman id 206749;
 Tue, 12 Oct 2021 06:00:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBHH=PA=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1maAqB-0005nr-Vd
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 06:00:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.65]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bab58cdc-2b21-11ec-8110-12813bfff9fa;
 Tue, 12 Oct 2021 06:00:41 +0000 (UTC)
Received: from DB6PR0501CA0001.eurprd05.prod.outlook.com (2603:10a6:4:8f::11)
 by VI1PR0802MB2558.eurprd08.prod.outlook.com (2603:10a6:800:ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 06:00:30 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::fa) by DB6PR0501CA0001.outlook.office365.com
 (2603:10a6:4:8f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 06:00:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 06:00:30 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Tue, 12 Oct 2021 06:00:30 +0000
Received: from 8228f5b911a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72D84EAE-38E6-49C9-8B88-9680A1291EB8.1; 
 Tue, 12 Oct 2021 06:00:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8228f5b911a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 06:00:24 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 by VI1PR08MB3455.eurprd08.prod.outlook.com (2603:10a6:803:7c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 06:00:21 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06]) by VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06%6]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 06:00:20 +0000
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
X-Inumbo-ID: bab58cdc-2b21-11ec-8110-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ/SOJZMdpXAB64KPTLVoTiUFV4F8QWzRnxN6r2WL9c=;
 b=B9EnXsMtjEVbbFPBOJh7BV6shUAvTOC/yiBYgebkiHmz6W+8BbuamR62EyYYcMq9OVow2p1rllHg19yw/tEMM0PiCQhEhrMGEWe2LBo+Z6J6UoVNgTa3AgGYKAAN8c+nQB+3gm/oILrDhpzyoBrR4GGMHFLKbFCZMw5rt1A4ArU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/+UA1roMqsdVrpzpEfJxNNlZFuQwXxFana6oeIo1Z8GnBv6cvLDUzTrJxsxYb/QVGi+3HtDjScWMBz8Qa8xE09yEbMt/AUTwc4iZXSm1hJxmpeY6qucn+dcnMBo15HYTHwhwNoxL70SR59VZwXLw3y2/Y9EOuhm/0gSm1tinSaFp/whO2LI/a5Cl1l14CORIhIMsE4UR97NpHoKKrBkOGo5HrzeZ78O7PY/4Sg1Ao9lI1SQLKOxa4jIwB77JHil/CZlakpadx2v/h9CXnhCvrlwjPETKy/lZ6JTknDJSGR5I+Wk+CW0S/x25sUZ7/1MS12TIg7Z6VDRTkCZFoZvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ/SOJZMdpXAB64KPTLVoTiUFV4F8QWzRnxN6r2WL9c=;
 b=jMuTXZm9fDorHwkrcd777bcrkFK18/JSAcm64Z9HTp7dg+Lvjkr4lJOaAHnI0XolA7xlOgepG+KlaOBT7qz5z5JHj08GABtxv0XamhHFBO+OWtV2TB/lMcNGg6Gu/jvhrK7OcRaZ6GPQMKlZkhYoZP2EPKJ110xhtFuHj3bZjZCjspTwohnbzvlJyIJPACEGGPKcAcq8BM9E+KeI0SWwgIOCZrpX47sV3iorAg8O+Cz6+dJSwJDobpckEN1wjuP1wh+3NfZ+yw/u/Uoj3wX6u10P8XPx3U57pBPjErMeJZJsj1eLqfF054RMM6b7hxqv5XPTscXw3Jz54fOmW/Iatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ/SOJZMdpXAB64KPTLVoTiUFV4F8QWzRnxN6r2WL9c=;
 b=B9EnXsMtjEVbbFPBOJh7BV6shUAvTOC/yiBYgebkiHmz6W+8BbuamR62EyYYcMq9OVow2p1rllHg19yw/tEMM0PiCQhEhrMGEWe2LBo+Z6J6UoVNgTa3AgGYKAAN8c+nQB+3gm/oILrDhpzyoBrR4GGMHFLKbFCZMw5rt1A4ArU=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH] xen/arm: vgic to ignore GICD ICPENRn registers access
Thread-Topic: [PATCH] xen/arm: vgic to ignore GICD ICPENRn registers access
Thread-Index: AQHXsEJR/bwf5T3s+UClXsOnMpcjEquxXHcAgAC9YACAHOFnsA==
Date: Tue, 12 Oct 2021 06:00:20 +0000
Message-ID:
 <VE1PR08MB56779A21C29E3FE977BF7EE7E6B69@VE1PR08MB5677.eurprd08.prod.outlook.com>
References: <20210923061429.16361-1-Hongda.Deng@arm.com>
 <0b0ede18-b944-8693-dede-616c3386e965@xen.org>
 <alpine.DEB.2.21.2109231348200.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231348200.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 573175DF71BC404DB7EA184F64FE3B78.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 58d3e0e2-8fd2-493e-bbf1-08d98d4598ac
x-ms-traffictypediagnostic: VI1PR08MB3455:|VI1PR0802MB2558:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB25588D252A0133D2C1BFE550E6B69@VI1PR0802MB2558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HnoiPJhWEAlnO/ll/kgEfq14O5MgfEcVfczyI7o05nyIoUg8lKudvan+Mshv5J4jX7vzJ885BRVZjeskN+FofZ/Z2q90rd1vzsnFNFYzU4oKZbC8FZEFn5YDZlSpmgblr5pb6VB26cErvR8ifJsbFEgIqXCvlxVjdOeywLr79q6JkqjUth7+c83xbgzEhCK0vPuzgluZ5Gjgtzj3hNB5pkq7x5hh4A5AoYc5awFKnZfVKvtrYkZGi9WRsV/cBc694zUTOUD7Qg774ND2N8ZusiqHWKHEZMFLW/4L1VQAqCO1kjN61J3CppncYgVcI0yWBZdP0TWSXwNPTaQadlh568x/oCyBu3vXk30Q07aYuQiTmK4+mNkKZ5dhd7tWI2UgVIisz74ZcbrLfDFpddC5m3xcvN4KkB9lyWm0u1hsxxqBiTznqLlg9hjT6GW0m+iCo9CA/73stLIUP15FzBWNRmTlNqW/4MhkPCSE1FZ1h/MSFDNx3aR9+cYo3kgjOFlO7PxdQvh6cw3NYhMiy1ILZJ0NNJ27UyYFnmNBMVI9qRW2tJpyZv/GJe+RXpAyQcZIzg0vq0w0tpp4tD+wMNaclcdPzXPje08I1RwGdueMbSNOQS1W5nAXMVGooxCYZUMbPpU6g0x4cpkGQmb9IxYc2q6+awBG+/Ifmh6sIZUAIRQIte0JlB7U2GMoVxI2a/H4bNWmHepIRI6wLJwEHQ7tt09ZQWXlq+sl1+506PXOBE3+toMgl/LMoEg/A+Y2owFjEoIO1QgEruCzd8AK4hlCByFRRQJTOead7U77OvPz7EA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5677.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(508600001)(8936002)(66556008)(55016002)(66476007)(5660300002)(122000001)(54906003)(6506007)(83380400001)(9686003)(66446008)(76116006)(966005)(66946007)(110136005)(7696005)(64756008)(53546011)(52536014)(33656002)(38070700005)(2906002)(8676002)(316002)(4326008)(86362001)(186003)(26005)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3455
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa1905b1-7a1a-4270-ec5a-08d98d4592d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a5oKBta59CO9nNVwkneJD2taS85wjV769HUIp5mnOeQzxaf6sBkXbQYFKpYSHFS27mWFhcJxhFXwl5X6gZ9h9scqRQSZZX84JsjicIdICP8+2HLuQHeUjf45fQQZjUK2QvazmOFImbx8fK+Lx2AjQzXr0Xp7lL/LUnbGRYPzpVuiedKT1BVgEzUqMhXZPVlMYFtWcgLga/OBHqtClS5RQNRND1SnELuFjdrl3xjSDcTr6AUq3kMyHpc4TQHK6R/hBdAUVS5UMPCkAbAIUVwHYxliO5cApaD+zX82eI/mIQKV8SognedQg6uwoLDje0OKoXbxnZ4q+alKSkMuV143Hgz5JkyHosaQz/RlXcybz2v6pkCLib9Mlq0JMd3nfPCRvjDofjq0muxqpfEUqxVwnEtOSQ72Uqj1ZAtVcgztirwmI2NO8XydR3gZtmHTGoKDR3xx8rW1fRKqyy1CP3Lr5+V1lFvIQxBBrMAJVxmk2bmiqi8pggsXBZbnJxQtUbuXN0aZxk1OMyfQBZQeqeGXvw4rn1NnRS+FotNMNvLrEFO81VpU46DeUu95XhrndemCjtofOPIK2f6srJLdNSbprnsWf+Ogy9fMF/a5BA8bcDds+ExBcaB6EREZWXvG9dQN+evVbfBL8m3f+oqA2Nhr+W4EFziKxZdi6KNiCi56biFPTvUdFfiOweKvDAuFDN+Ym2f6UfZId2Wn/KiqubraE8QSF0MtAhxjfruXqo7FCXeLH9s5Asy6DnOk9/A/oX7ICciS7+t4fpWMzMaJS0omnIHV+7/wcAwCH0TiMNnOWzw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(8936002)(336012)(70586007)(82310400003)(8676002)(186003)(70206006)(2906002)(86362001)(316002)(47076005)(5660300002)(55016002)(81166007)(356005)(966005)(36860700001)(54906003)(508600001)(53546011)(6506007)(4326008)(33656002)(9686003)(26005)(110136005)(52536014)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 06:00:30.3262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d3e0e2-8fd2-493e-bbf1-08d98d4598ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2558

Hi,

Thanks for your great and detailed advice, I did some investigations about =
vgic especially inflight_irqs in the last few days.

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: 2021=1B$BG/=1B(B9=1B$B7n=1B(B24=1B$BF|=1B(B 4:54
> To: Julien Grall <julien@xen.org>
> Cc: Hongda Deng <Hongda.Deng@arm.com>; xen-devel@lists.xenproject.org;
> sstabellini@kernel.org; Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei
> Chen <Wei.Chen@arm.com>
> Subject: Re: [PATCH] xen/arm: vgic to ignore GICD ICPENRn registers acces=
s
>=20
> On Thu, 23 Sep 2021, Julien Grall wrote:
> > Hi,
> >
> > On 23/09/2021 11:14, Hongda Deng wrote:
> > > Currently, Xen will return IO unhandled when guests access GICD ICPEN=
Rn
> > > registers. This will raise a data abort inside guest. For Linux Guest=
,
> > > these virtual registers will not be accessed. But for Zephyr, in its
> > > GIC initilization code, these virtual registers will be accessed. And
> > > zephyr guest will get an IO dataabort in initilization stage and ente=
r
> >
> > s/dataabort/data abort/
> > s/initilization/initialization/
> >

Ack.

> > > fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> > > we currently ignore these virtual registers access and print a messag=
e
> > > about whether they are already pending instead of returning unhandled=
.
> > > More details can be found at [1].
> > >
> > > [1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
> > > msg00744.html
> > >
> > > Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> > > ---
> > >   xen/arch/arm/vgic-v2.c     | 10 +++++++---
> > >   xen/arch/arm/vgic-v3.c     | 29 +++++++++++++++++------------
> > >   xen/arch/arm/vgic.c        | 37 +++++++++++++++++++++++++++++++++++=
++
> > >   xen/include/asm-arm/vgic.h |  2 ++
> > >   4 files changed, 63 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> > > index b2da886adc..644c62757c 100644
> > > --- a/xen/arch/arm/vgic-v2.c
> > > +++ b/xen/arch/arm/vgic-v2.c
> > > @@ -481,10 +481,14 @@ static int vgic_v2_distr_mmio_write(struct vcpu=
 *v,
> > > mmio_info_t *info,
> > >         case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> > >           if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> > > +        rank =3D vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DAB=
T_WORD);
> > > +        if ( rank =3D=3D NULL ) goto write_ignore;
> >
> >
> >
> > > +
> > >           printk(XENLOG_G_ERR
> > > -               "%pv: vGICD: unhandled word write %#"PRIregister" to
> > > ICPENDR%d\n",
> > > -               v, r, gicd_reg - GICD_ICPENDR);
> > > -        return 0;
> > > +               "%pv: vGICD: unhandled word write %#"PRIregister" to
> > > ICPENDR%d, and current pending state is: %s\n",
> > > +               v, r, gicd_reg - GICD_ICPENDR,
> > > +               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "of=
f");
> >
> > Each register contain the information for multiple pending interrupts. =
So it
> > is a bit confusing to say whether the state is on/off. Instead, it woul=
d be
> > better to state which interrupt is pending.
> >
> > Also, I would rather avoid printing a message if there are no interrupt=
s
> > pending because there are no issues if this is happening.

I will fix it in the next version patch.

> >
> > > +        goto write_ignore_32;
> > >         case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> > >           if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> > > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > > index cb5a70c42e..c94e33ff4f 100644
> > > --- a/xen/arch/arm/vgic-v3.c
> > > +++ b/xen/arch/arm/vgic-v3.c
> > > @@ -817,10 +817,14 @@ static int
> __vgic_v3_distr_common_mmio_write(const
> > > char *name, struct vcpu *v,
> > >         case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
> > >           if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> > > +        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WOR=
D);
> > > +        if ( rank =3D=3D NULL ) goto write_ignore;
> > > +
> > >           printk(XENLOG_G_ERR
> > > -               "%pv: %s: unhandled word write %#"PRIregister" to
> > > ICPENDR%d\n",
> > > -               v, name, r, reg - GICD_ICPENDR);
> > > -        return 0;
> > > +               "%pv: %s: unhandled word write %#"PRIregister" to ICP=
ENDR%d,
> > > and current pending state is: %s\n",
> > > +               v, name, r, reg - GICD_ICPENDR,
> > > +               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "of=
f");
> > > +        goto write_ignore_32;
> > >         case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> > >           if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> > > @@ -978,19 +982,20 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct
> vcpu
> > > *v, mmio_info_t *info,
> > >       case VREG32(GICR_ICFGR1):
> > >       case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
> > >       case VREG32(GICR_ISPENDR0):
> > > -         /*
> > > -          * Above registers offset are common with GICD.
> > > -          * So handle common with GICD handling
> > > -          */
> > > +        /*
> > > +         * Above registers offset are common with GICD.
> > > +         * So handle common with GICD handling
> > > +         */
> > >           return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> > >                                                    info, gicr_reg, r)=
;
> > >         case VREG32(GICR_ICPENDR0):
> > > -        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> > > -        printk(XENLOG_G_ERR
> > > -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister=
" to
> > > ICPENDR0\n",
> > > -               v, r);
> > > -        return 0;
> > > +        /*
> > > +         * Above registers offset are common with GICD.
> > > +         * So handle common with GICD handling
> > > +         */
> > > +        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
> > > +                                                 info, gicr_reg, r);
> > >         case VREG32(GICR_IGRPMODR0):
> > >           /* We do not implement security extensions for guests, writ=
e
> > > ignore */
> > > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > > index 8f9400a519..29a1aa5056 100644
> > > --- a/xen/arch/arm/vgic.c
> > > +++ b/xen/arch/arm/vgic.c
> > > @@ -470,6 +470,43 @@ void vgic_set_irqs_pending(struct vcpu *v, uint3=
2_t
> r,
> > > unsigned int rank)
> > >       }
> > >   }
> > >   +bool vgic_get_irqs_pending(struct vcpu *v, uint32_t r, unsigned in=
t rank)
> > > +{
> > > +    const unsigned long mask =3D r;
> > > +    unsigned int i;
> > > +    /* The first rank is always per-vCPU */
> > > +    bool private =3D rank =3D=3D 0;
> > > +    bool is_pending =3D false;
> > > +
> > > +    /* LPIs status will never be retrieved via this function */
> > > +    ASSERT(!is_lpi(32 * rank + 31));
> > > +
> > > +    for_each_set_bit( i, &mask, 32 )
> > > +    {
> > > +        unsigned int irq =3D i + 32 * rank;
> > > +
> > > +        if ( !private )
> >
> > It is not clear to me why you not handling PPIs/SGIs and ...
> >
> > > +        {
> > > +            struct pending_irq *p =3D spi_to_pending(v->domain, irq)=
;
> > > +
> > > +            if ( p->desc !=3D NULL )
> >
> > ... emulated SPIs (e.g. PL011).
> >
> > > +            {
> > > +                unsigned long flags;
> > > +
> > > +                spin_lock_irqsave(&p->desc->lock, flags);
> > > +                is_pending =3D gic_read_pending_state(p->desc);
> > > +                spin_unlock_irqrestore(&p->desc->lock, flags);
> >
> > What you are reading here is the pending state from the HW. This is not=
 the
> > same as the pending state from the VM PoV. In fact, in the most common =
case,
> > the interrupt will be pending from the VM PoV, but simply active from t=
he HW
> > PoV (it is deactivated once the interrupt has been handled by the guest=
).
> >
> > I think what you want to check is whether the flag GIC_IRQ_GUEST_QUEUED
> is set
> > in p->status (Stefano ?).
>=20
> Yeah, that's right. In fact, there is no need for checking the hardware
> registers. You can just go through the inflight_irqs list and print all
> of them (the list is sync on hyp entry on the cpu you are running on,
> not the others of course).
>=20
>=20
> > This is technically still a bit racy as Xen may still think the interru=
pt is
> > pending while the it may be actually active in the guest. AFAIK, the ot=
her way
> > around (i.e. not pending in Xen but pending in the guest) cannot happen=
.
> >
> > Anyway, this is just a message, so it is still better than crashing :).
>=20
> +1

Thanks again for your advice.=20
Based on that, I wrote a new patch to go through vcpu->arch.vgic.inflight_i=
rqs to check the pending
states and print them if there are in the next version patch. I will send i=
t for review later.

Cheers,
Hongda


