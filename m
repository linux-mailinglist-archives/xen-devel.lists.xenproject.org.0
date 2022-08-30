Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B425A5E0E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 10:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394887.634467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSwbW-0006Y7-Nz; Tue, 30 Aug 2022 08:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394887.634467; Tue, 30 Aug 2022 08:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSwbW-0006Vg-Ky; Tue, 30 Aug 2022 08:28:14 +0000
Received: by outflank-mailman (input) for mailman id 394887;
 Tue, 30 Aug 2022 08:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSwbV-0006Va-8r
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 08:28:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae577a05-283d-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 10:28:10 +0200 (CEST)
Received: from DU2PR04CA0264.eurprd04.prod.outlook.com (2603:10a6:10:28e::29)
 by AS2PR08MB8480.eurprd08.prod.outlook.com (2603:10a6:20b:55e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Tue, 30 Aug
 2022 08:28:06 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::fc) by DU2PR04CA0264.outlook.office365.com
 (2603:10a6:10:28e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Tue, 30 Aug 2022 08:28:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 08:28:06 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 30 Aug 2022 08:28:06 +0000
Received: from 89154155f9ad.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2CFDDBCD-609C-4A81-8F3B-3970111120F1.1; 
 Tue, 30 Aug 2022 08:28:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89154155f9ad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 08:28:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8502.eurprd08.prod.outlook.com (2603:10a6:20b:55d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 30 Aug
 2022 08:27:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 08:27:59 +0000
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
X-Inumbo-ID: ae577a05-283d-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=g5RFiuMSrwm0hfamfO0QskLE6uqnan2cyLNFjqzwNnmKN9IkvpsPmt5x/GDxaIspS+Cc/uQqqRS1I2NdeVtVyoZPTKiU7qDcXPc82Y6qYoQcqUrLIqMAHC+nGwR6fmPTcILUNcPbLD/OSFAK6SnzFC4LhixWcRSycHmlbyLA1KZpAbRh3wc+5JIrGdwquQvE4S3qmZryS3NwAEdi4U1crYF1IbWdNZwcPxh91TsqJqZZNsQ3TjEFIvHqN150gVLKVMXUXkGem1w9dqh7oK1EJMoB0fITnLttPk9mkZE57xTTu6YACPaBqJxKPONNy7p3UhdYm9Ep+SPDvlki7XU+nQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Gz9VEna7IoeZh6CVLVdPDf7X3QUEZFtyTORqhU2O2M=;
 b=EhCiwQt8uD7Z4CoOxomkd6jk7N6I/8O7Ag/PSssePSw4U0CZNzXA1sxqWBkX1+pFHctMSTZ6xkKgS28P9edmUYgO2/uvU9vsx+VXwtrtFDSXFrebBjNwz/m7UluPOW1xRoNYb6C+T8n8B0nCpGuxZn/jvKgO6M1LhS+se7/XRasJPKmomD7qc/HrWny8rdyeYplOo6ygNSGAYMmZRGbmuhTdobcbNikGRyTQ5UzHGDyWaQD067xOvd3yRjN2IxtVZxJRmjGnyAHhWW5nWLxei21IA3DcVd5GXke4chYSWVzbRtftw9vYdh77AqeCN00AI6YAKSVTD25v7UN2eoizsg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Gz9VEna7IoeZh6CVLVdPDf7X3QUEZFtyTORqhU2O2M=;
 b=448briGjgl9ywKCc1rTECoL+NMiazyj4qjycskiekzh6Ki+Cy4BasCrgYb2YsQDXyDyuEi7VsvR/BYlq6okjAiLwkHptS67ew1s+3f/xu5wqFNeBTd4r1iEfPaaOyb3wiPu50LcIhmv6uLVevODWOLLlVEgCa3f+l9OQCtDxj0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIufgylHKZ9J1lCEfdRSAyp3sMETr93cSAQQShg0z8HejDjYixamSBg4g+2sgCBmz9O2yOGFFoscDMBswmqa+U5GgPayOUpHRFYGFDre1EljvpPdvRm2wEC8Fuv4PlRTL0+DG4jwNmIr316mrrU7AIe1MXYO2s9WAardTEnVbnrEYrEEbqsBUta/q2WzPL4i0EasvxGQ6LolXxic/eUsIdQ2sDuX4SN6RF/uJmG/X97AzOmF+jy0Dp7NJDA2OvQa+7xFnAIZEcbIOFN29q1o/c6Y5Fqzyd4Mgnj44GSj/ylaSODOGpPPIvcqV6Ta7WeVWW3gufiqmH1S1tHswjP/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Gz9VEna7IoeZh6CVLVdPDf7X3QUEZFtyTORqhU2O2M=;
 b=D4/d46Z3TnHpj+opGAm5dkMYqffGDkArf5jCzIMeoYvZboJwWJldcqEprickfzwtgtp7t/AZsEIQxHqIoJm9nHbLgFt4q6yQCOTEkgpbYFIl1B6J9+lHY/MI4lcuA7ncA1B0g4kg8UmTvVI+XE7yFOFNJvMAUm4plB5LoKfAet7m1M1qbPiXNQKyQ/ge1sgJFcWR3K1a8lwvii0KEjClzt3gbKsiPoEIQ4PKagCjHanDf1td6LsJsnou9UQD0wNuWPuelOnhzvE6GIAh/NwtrodcWZQ950w/378VTyL/nXEFgQ+XuTAY2Ob3Qbx004ZdlHLFgxnO/glf4vz3ls5I+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Gz9VEna7IoeZh6CVLVdPDf7X3QUEZFtyTORqhU2O2M=;
 b=448briGjgl9ywKCc1rTECoL+NMiazyj4qjycskiekzh6Ki+Cy4BasCrgYb2YsQDXyDyuEi7VsvR/BYlq6okjAiLwkHptS67ew1s+3f/xu5wqFNeBTd4r1iEfPaaOyb3wiPu50LcIhmv6uLVevODWOLLlVEgCa3f+l9OQCtDxj0U=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q3GqcQAgABmBoA=
Date: Tue, 30 Aug 2022 08:27:58 +0000
Message-ID:
 <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AFB3D0CE0BAA914094EEFB05C0D14CEB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f3cacc60-4b5c-483e-ee22-08da8a619022
x-ms-traffictypediagnostic:
	AS2PR08MB8502:EE_|DBAEUR03FT030:EE_|AS2PR08MB8480:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /C0dsJ2HfwImk80b1dsLwYnd7iA2VzYoEGl7Lp/trMEjB96M+K8LeHXDEP5ubuiYVB1c9sWhUBkYpvCdq+R7tgHRADs5oYtKNJ3UIWaclX+22KwehMnaoj6wxclXw8Au4A8T0eGc5q3ghQZsVYuScWldtr6NzW6rtDUOqW+18050tlnH7TM8rueV3G/xPPvQC1/O/29CRGKOGKbQzFVK+rTp10kykI2RMxZB5ilrleOTS5nU1wKbE6I75DbRF3PzLXml5MqbASDNtcXVyjExskb/i0hXaNX1i49WcvAwf0wI70ZgnGVrkhSPzWCt3lc+jLM4oREIIXSdfmLX5Mp3y8hdT/2MI/JJWAhEGTt7HH+lumPKNHYH8JE4UssdA7rS+fGbMIOWzu6fAEGHKSS5a5rcNSAhlMTjrlX28qAHjxYMVYyXD1KVVDn3oRU5fE5wkk4KrEnc7K/d1tqrUPCy94TF+mO7oYVnoVWJzdKC64qwm3hBlnWvf1AAIUEa+Lx9Rr3fzWObVOHttvD01jKOUbxsnIM6a72jpuzCFhpAqtQ4OmX7ffrCwlw1OxPSxuCrNi7OiJaXSU8zFwSyQ5KV2gSocuc9gyzELxkji8gFxR7eA+hZTJDe8mx6eUjrR3L9hJN0705PS4HhUE1yQEP8JgiMGigC0uOAoUV7XGAB/UjrITq6LwDI3qWrAaGuzrbKcf4Crnb8toZMs4mXzzE5bRhjtfyAx7JSncciPif+lqQK8MIYNTqRkHqbiaByNURe7MUA+Hp0Dly2Ql6DViuPJw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(186003)(83380400001)(6506007)(41300700001)(26005)(33656002)(7696005)(2906002)(478600001)(122000001)(38100700002)(55016003)(66446008)(9686003)(4326008)(64756008)(8676002)(71200400001)(66556008)(66946007)(76116006)(5660300002)(66476007)(8936002)(38070700005)(52536014)(316002)(86362001)(6916009)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ff60193-728c-46d4-6c7a-08da8a618be6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUJX6RZOQ8okwCFmz9xEJMQ3RJen99P0Y1+uxs+QmrB12N0bnj5O4A6Hcr3dSEPpKs+c5pcBUpCW1gf0eE3bFoNCdV/FzLSC70UMNDMcsnTwzlOdj5PXWlrIt+ETGgqmlgn/tJGnHeOH/B8NqVcGWcqIMiGvc6mfK7/apync3/RBOk5Ez/UA6O3qkSghy3t5w5XbJPKEchRPoFqZYL+1fZAhtig7HqSpi5JTBmwhyKc9ye2jmN6hCl0ZJxPRoRK3z4qcep+jGP2A3r/MpRmet6brjdcl3h+fmWlKJKFKsJK8CBfPIEkKmdwwFQBfW93wRn9IRatInyGg1td2L128x8iOdBFRTM5TgcCrWL186vbR3sGDSrhBUJFqXQexG0FkwtkeWcvpOSLRssR0+O6KBCbdY4yqv4AVb7DVoMdSbysDsE0TStS2gyYs3S3pRBo1NFo9TY3wNTztxrZhsoR+VfRmIkC9VWMahT6cU9m0hHxPEuz6rRJK3b4OD2LSZ+OhcwgR3zg1NT7dG8/89iRzyX3DslJOYsSam3vZHbG9dFZkgVdn3m24PO+1Ej1/XuWSSGAtPaLOMiI1yPtrnBc4az+N46gaz9A6sik530sYEQYsnLTcaiuxc16zvu3UWt9gPprYch8tf/dwXPUwDnIb7ja2sFvLUTv5WGNPBnl38SOTzv3Yyn9s5zHpCWSE3daD++rEihNQ3v4ih0jPjCcmqbEK9ubLsmHfcf72xL0saWQZoITghVZTwinsfiufrd+gLAXudAXyNExVsnpA83EY6Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(40470700004)(46966006)(36840700001)(7696005)(356005)(33656002)(81166007)(82310400005)(82740400003)(70586007)(26005)(9686003)(107886003)(6506007)(70206006)(40480700001)(36860700001)(55016003)(86362001)(40460700003)(41300700001)(336012)(83380400001)(6862004)(8936002)(186003)(316002)(2906002)(5660300002)(47076005)(54906003)(8676002)(4326008)(478600001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 08:28:06.1015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cacc60-4b5c-483e-ee22-08da8a619022
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8480

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> > +    paddr_t reserved_heap_start =3D ~0, reserved_heap_end =3D 0,
>=20
> INVALID_PADDR or ~0ULL

Ack.

>=20
> >      /*
> >       * If the user has not requested otherwise via the command line
> >       * then locate the xenheap using these constraints:
> > @@ -743,7 +766,8 @@ static void __init setup_mm(void)
> >       * We try to allocate the largest xenheap possible within these
> >       * constraints.
> >       */
> > -    heap_pages =3D ram_pages;
> > +    heap_pages =3D !reserved_heap ? ram_pages : reserved_heap_pages;
> > +
> >      if ( opt_xenheap_megabytes )
> >          xenheap_pages =3D opt_xenheap_megabytes << (20-PAGE_SHIFT);
> >      else
> > @@ -755,17 +779,21 @@ static void __init setup_mm(void)
> >
> >      do
> >      {
> > -        e =3D consider_modules(ram_start, ram_end,
> > +        e =3D !reserved_heap ?
> > +            consider_modules(ram_start, ram_end,
> >                               pfn_to_paddr(xenheap_pages),
> > -                             32<<20, 0);
> > +                             32<<20, 0) :
> > +            reserved_heap_end;
> > +
> >          if ( e )
> >              break;
> >
> >          xenheap_pages >>=3D 1;
> >      } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
> PAGE_SHIFT) );
> >
> > -    if ( ! e )
> > -        panic("Not not enough space for xenheap\n");
> > +    if ( ! e ||
> > +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) =
) )
> > +        panic("Not enough space for xenheap\n");
>=20
>=20
> I would skip the do/while loop completely if reserved_heap. We don't
> need it anyway

I agree with this.

> and we can automatically calculate xenheap_pages in a single line.

Here I am a little bit confused. Sorry to ask but could you please explain
a little bit more about why we can calculate the xenheap_pages in a single
line? Below is the code snippet in my mind, is this correct?

if (reserved_heap)
    e =3D reserved_heap_end;
else
{
    do
    {
        e =3D consider_modules(ram_start, ram_end,
                             pfn_to_paddr(xenheap_pages),
                             32<<20, 0);
        if ( e )
            break;

        xenheap_pages >>=3D 1;
    } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT)=
 );
}

>=20
> >      domheap_pages =3D heap_pages - xenheap_pages;
> >
> > @@ -810,9 +838,9 @@ static void __init setup_mm(void)
> >  static void __init setup_mm(void)
> >  {
> >      const struct meminfo *banks =3D &bootinfo.mem;
> > -    paddr_t ram_start =3D ~0;
> > -    paddr_t ram_end =3D 0;
> > -    paddr_t ram_size =3D 0;
> > +    paddr_t ram_start =3D ~0, bank_start =3D ~0;
> > +    paddr_t ram_end =3D 0, bank_end =3D 0;
> > +    paddr_t ram_size =3D 0, bank_size =3D 0;
> >      unsigned int i;
>=20
> Please use INVALID_PADDR or ~0ULL

Ack.

Kind regards,
Henry

>=20
>=20
> >
> >      init_pdx();
> > @@ -821,17 +849,36 @@ static void __init setup_mm(void)
> >       * We need some memory to allocate the page-tables used for the
> xenheap
> >       * mappings. But some regions may contain memory already allocated
> >       * for other uses (e.g. modules, reserved-memory...).
> > -     *
> > +     * If reserved heap regions are properly defined, (only) add these
> regions
> > +     * in the boot allocator.
> > +     */
> > +    if ( reserved_heap )
> > +    {
> > +        for ( i =3D 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> > +        {
> > +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
> > +            {
> > +                bank_start =3D bootinfo.reserved_mem.bank[i].start;
> > +                bank_size =3D bootinfo.reserved_mem.bank[i].size;
> > +                bank_end =3D bank_start + bank_size;
> > +
> > +                init_boot_pages(bank_start, bank_end);
> > +            }
> > +        }
> > +    }
> > +    /*
> > +     * No reserved heap regions:
> >       * For simplicity, add all the free regions in the boot allocator.
> >       */
> > -    populate_boot_allocator();
> > +    else
> > +        populate_boot_allocator();
> >
> >      total_pages =3D 0;
> >
> >      for ( i =3D 0; i < banks->nr_banks; i++ )
> >      {
> >          const struct membank *bank =3D &banks->bank[i];
> > -        paddr_t bank_end =3D bank->start + bank->size;
> > +        bank_end =3D bank->start + bank->size;
> >
> >          ram_size =3D ram_size + bank->size;
> >          ram_start =3D min(ram_start, bank->start);
> > --
> > 2.17.1
> >

