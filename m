Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E964DC27A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 10:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291436.494607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmFz-000704-6I; Thu, 17 Mar 2022 09:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291436.494607; Thu, 17 Mar 2022 09:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmFz-0006yD-2G; Thu, 17 Mar 2022 09:17:19 +0000
Received: by outflank-mailman (input) for mailman id 291436;
 Thu, 17 Mar 2022 09:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TrlV=T4=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1nUmFw-0006y6-PQ
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 09:17:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087a718b-a5d3-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 10:17:14 +0100 (CET)
Received: from AM6P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::23)
 by GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Thu, 17 Mar
 2022 09:17:11 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::4a) by AM6P194CA0010.outlook.office365.com
 (2603:10a6:209:90::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Thu, 17 Mar 2022 09:17:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 09:17:09 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 17 Mar 2022 09:17:09 +0000
Received: from d85763797fb7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DCD3ED34-667F-494B-ACDB-9F7BC90ABDCD.1; 
 Thu, 17 Mar 2022 09:17:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d85763797fb7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Mar 2022 09:17:03 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by VI1PR08MB3229.eurprd08.prod.outlook.com (2603:10a6:803:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 09:17:00 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::c4d3:b586:a5c0:153b]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::c4d3:b586:a5c0:153b%3]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 09:17:00 +0000
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
X-Inumbo-ID: 087a718b-a5d3-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVTayEo9cd7za1xsfn+am72yC0vKL+VYANv8573DfDw=;
 b=xW8i93iZEyIsXPDYTgZOLo4iEAlzSJY02N+nNBJQx6GbVrNy4vbyvX/TacqehVOaxZSbkCTtg5FQ7CIcZ9+tk3G4uDUKFslwPgT/OOuPldEsFb8u0iLFbsjewR8itoP1BWwr4HpMm5loQkRtXIbpxCoGOQPMYuuCQzILNWrlzXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDblQblYkznqnytIj4e//SgD5wrz3XcoS88oatBDbZGSm+6cEBLarawIrEUYHzYhN7PQneMInStiJZOY9NdNGrEx7S82GxrXerxxjKW570CNa4Wc34Q3wjgy7nwIsUC2srYjBzsZxHsGawJNTa1K7nn8OjSzg6ZkLd13IxocSf8MrPlXAdzm8BOLRIp+f5E/FeQyoiSP8GE6XquDun2coNXjzkWQ79RoKm96nyfGHCoYtiUT2zxtqgB3aCg/36naP7yMvJs4bs+3nb/1uSJSnc/PqDtEQj/nXlBOLHHSshOlyWL8mmVDzy7d8nMuu+UQtdqNIInQMFTfN7PPiJS8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVTayEo9cd7za1xsfn+am72yC0vKL+VYANv8573DfDw=;
 b=FIGf6jD98UK0zhxhRlwljOiQoIvXOgNHe81MsawBGRru3mgA8jN2g2uOatVENCJKHlL1yIUDxMSvx4P4mcZxFWxgBGk4rInL2hx91AmjpmWs92w6b0LYGfUBH3RzmilCUBJMFpQ0Ibeu6SJigeQIwwfOYwMOs80Rin5khaikyA3ufghKbCDXsPegbj95HBo6sgraJXo3Bn6mcchWPf7ORm3ukB7Gd/Gw/qEqRsejozfMBHIgzAhAS4j2pWPqBODAo5S+YTHBJJavjRTpiB2aKIqAetQcKd5TnrKCBaK/IMNXY+jTGWiu9m61r6PgCasN2uXgcNnNfz39jjB20IqJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVTayEo9cd7za1xsfn+am72yC0vKL+VYANv8573DfDw=;
 b=xW8i93iZEyIsXPDYTgZOLo4iEAlzSJY02N+nNBJQx6GbVrNy4vbyvX/TacqehVOaxZSbkCTtg5FQ7CIcZ9+tk3G4uDUKFslwPgT/OOuPldEsFb8u0iLFbsjewR8itoP1BWwr4HpMm5loQkRtXIbpxCoGOQPMYuuCQzILNWrlzXQ=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Bjoern Doebel
	<doebel@amazon.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: RE: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Topic: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Index: AQHYM8WNmsy9ALsOG0iEitvyqooH8ay3Sg6AgAwMHmA=
Date: Thu, 17 Mar 2022 09:17:00 +0000
Message-ID:
 <VI1PR08MB3056A7F7E5DC1DD68212A57692129@VI1PR08MB3056.eurprd08.prod.outlook.com>
References:
 <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
 <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
 <PH0PR03MB6382E2AD10AEF1BC48C55093F00A9@PH0PR03MB6382.namprd03.prod.outlook.com>
In-Reply-To:
 <PH0PR03MB6382E2AD10AEF1BC48C55093F00A9@PH0PR03MB6382.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CC3C2EF04C013348B1A67974E9C35952.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3f924c61-5e24-448b-5870-08da07f6ea4e
x-ms-traffictypediagnostic:
	VI1PR08MB3229:EE_|VE1EUR03FT015:EE_|GV1PR08MB7315:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB731550CE1FDC2654E2785C8092129@GV1PR08MB7315.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CC84LiJSQAnuZRnMP25tdQkcO8gKosRVMe3bjjkcTkcERSckUfjmZgFrFeW2JkUwlHTjSA8M4VdTs+nvMnSaj4+tug6tTPHw8ZnlhFiWXLvnrBFsOoXzm/nBmThwozEvlzvsd2nVfcnSb+Zr3+6+udREosNruI4fADDCBoa4bgip1hr8sFFs1MlibuyVaoP0WX6LaszRVbTW3QUME5thWtRjw8ic2e5aVm+XU16XzpHBdj9XEdY5QCZk/tpNGGZwHwNR5Hqj812R1/qf/MpzZqipHPJF3/z4uik5pv9pFXD7s5NcjcfagFuFPO+c0p7/cgkG5Gxh4rfKptxDGkDGi6vNNZuFK8F7dRDDEYpdF4C32meXTzg7engzhLvWS0qvhoCNPuck1knwldjDRAlTE5xfC7eELX9p5XK8gU+3X1woQtlmrLJX5J7r4PCvd+VItgu1SKfqI5QxX5CcWE6UdNutquOf8FoQ6a61vLh9q/NTwnZifQpauzYV9AuqGQvtZ5IX8XcmzwQlmBj8Dm0J0/SB3S5cAXAhyMMCx34YKIVKZolc2ei4DX1zRmYLI3RBfan+MZIoTGf3nG267ugDCaj3+DSW57gIXgQZR+0dmb62qQzDGiLES5Y6/LtDEi0tMHimddztkeDipZ9MzumfikYp9wDa4yA0QXldKJ1m2e7iaAFpCe7BaREPmlmeXshF3fyQfc0OgrP0E+0Jr2KRqA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(38070700005)(55016003)(83380400001)(52536014)(2906002)(33656002)(38100700002)(186003)(26005)(8936002)(122000001)(64756008)(110136005)(66446008)(66476007)(8676002)(316002)(66946007)(76116006)(66556008)(4326008)(71200400001)(53546011)(508600001)(7696005)(6506007)(9686003)(54906003)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3229
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89346977-5d56-43aa-9d2f-08da07f6e4cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	huKJDiZRTAFVUhsb3BTj9iioUbewx000H5eOIzyTIeXeBZpS1LV3xPqJzPCROQIJxG1dHjHvrdD94RhOy7ZYvwV3ku6dLGXX6b3zg3yc6/ahiAJ8rZb9J59ATF+aFiO2q+84/LyTmyna8FrVuy97kiNI+NAQ3DzOFF1TQnE3fojN/WY6afvuhRo7pq7laY9G6CsOUOPQc1h9Uj1JyrNgI3GQ7XQ/S98RLXkN2+/c7ComCCJTP7ORbeihCiGPzPQOSDbcZHaj6dgjfQeMUBhRLpZiPLcwFgPHpZaaTbYJXnK+FAjW8QZFf1WzhNSqb4n0F4EeN8g1rrg6vInV7vzB3NOs8YFfh5jX9+Gg0OilsltfS97gF6afTJ1e4KkEqVJZmT26oSwYLBmE6YlL8LtAMosxmLXcDjDU2Nn83YkS3pGj9XLkVTQ2MGFI8g7kYWG6NmFO+WMJYY9oDneW8Az4T4FUA8VdUH/FsHGooBoyBbMYNvxgsb4A7TVrapemP1pBvRfXObOF+LHm87npPaTaUkeYSWOOjxVmlrDjcbO5TgH69tubHPs4x9x+7b4Z7173M1YjP3nGBGch/fv1d6y7gOerrnL+XUEcBuIQlgy/2YS/QbCrhBhsZw0pNhHNcTCJMduVAcczg/XZVLIE3WyR5HHWnWjZmJHO6/KU0MiinCtvKOSctEce5asDE/A0Nj6l
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(54906003)(4326008)(5660300002)(52536014)(110136005)(336012)(8676002)(8936002)(9686003)(26005)(70206006)(83380400001)(7696005)(186003)(47076005)(82310400004)(33656002)(6506007)(36860700001)(508600001)(53546011)(2906002)(70586007)(86362001)(356005)(107886003)(40460700003)(55016003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:17:09.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f924c61-5e24-448b-5870-08da07f6ea4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7315

Hi  Bjoern,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Ross Lagerwall
> Sent: 2022=1B$BG/=1B(B3=1B$B7n=1B(B10=1B$BF|=1B(B 1:12
> To: Bjoern Doebel <doebel@amazon.de>; xen-devel@lists.xenproject.org
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
> <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
> Andrew Cooper <Andrew.Cooper3@citrix.com>; Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>
> Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
> enhanced functions
>=20
> > From: Bjoern Doebel <doebel@amazon.de>
> > Sent: Wednesday, March 9, 2022 2:53 PM
> > To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> > Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
> <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
> Andrew Cooper <Andrew.Cooper3@citrix.com>; Bjoern Doebel
> <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>;
> Ross Lagerwall <ross.lagerwall@citrix.com>
> > Subject: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
> enhanced functions
> >
> > Xen enabled CET for supporting architectures. The control flow aspect o=
f
> > CET expects functions that can be called indirectly (i.e., via function
> > pointers) to start with an ENDBR64 instruction. Otherwise a control flo=
w
> > exception is raised.
> >
> > This expectation breaks livepatching flows because we patch functions b=
y
> > overwriting their first 5 bytes with a JMP + <offset>, thus breaking th=
e
> > ENDBR64. We fix this by checking the start of a patched function for
> > being ENDBR64. In the positive case we move the livepatch JMP to start
> > behind the ENDBR64 instruction.
> >
> > To avoid having to guess the ENDBR64 offset again on patch reversal
> > (which might race with other mechanisms adding/removing ENDBR
> > dynamically), use the livepatch metadata to store the computed offset
> > along with the saved bytes of the overwritten function.
> >
> > Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> > Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>=20
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Tested-by: Jiamei xie <jiamei.xie@arm.com>

Cheers,=20
Jiamei

