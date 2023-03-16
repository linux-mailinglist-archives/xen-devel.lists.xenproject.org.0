Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D46BD062
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510580.788484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnG3-0000FE-J3; Thu, 16 Mar 2023 13:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510580.788484; Thu, 16 Mar 2023 13:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnG3-0000CT-F3; Thu, 16 Mar 2023 13:03:03 +0000
Received: by outflank-mailman (input) for mailman id 510580;
 Thu, 16 Mar 2023 13:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wP9M=7I=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pcnG1-0000CN-Mw
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:03:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e05b95e3-c3fa-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:02:59 +0100 (CET)
Received: from DU2PR04CA0240.eurprd04.prod.outlook.com (2603:10a6:10:2b1::35)
 by DB5PR08MB10213.eurprd08.prod.outlook.com (2603:10a6:10:4a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 13:02:54 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::9b) by DU2PR04CA0240.outlook.office365.com
 (2603:10a6:10:2b1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Thu, 16 Mar 2023 13:02:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Thu, 16 Mar 2023 13:02:53 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Thu, 16 Mar 2023 13:02:53 +0000
Received: from 06a9cf22bbab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AF817E4-6112-4881-8C7F-504CFFE2420C.1; 
 Thu, 16 Mar 2023 13:02:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06a9cf22bbab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Mar 2023 13:02:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7346.eurprd08.prod.outlook.com (2603:10a6:150:21::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:02:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 13:02:45 +0000
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
X-Inumbo-ID: e05b95e3-c3fa-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH7vOoVdySHDcMngfOJjdeuoWeScfB4wJ/fxTdcnfkE=;
 b=jzNFJ1VoCVjxvtWbAZ3TDNwTmt7Y2+UkR/K7Ap8rwS1yxIWUdCk4cwhV/nKNGc96M6936KpqwYUjnTBj8ZG8NXLzfCjZZ8WWoOh5f+sVqhY8Rsi0TmTjV9aN/P4ShTbmu3hLPLqxPC7VdHTwkDkJDSRt65qtskRsUr4nGSbzXeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e1ec8f8e1e43487
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYm8Bi7om/4x0zcti+y1jRY8cKkDWnJXNoP2OlC2JVl2H9Y/bR2wClHJ0yp3mOQGmYjU2g8wkY+ElvGHNWJQbYQp/BsMhcF94SracsU/Jbv/0vne6GCEMQs0OImO1/HUdrGGkx1mi4yGjNVi+96PBmlntyZ9qxFjUyJrEfWhCPOpja33Mlx5aKmLDWrHsjxffGYPH2e8HxK9aRfzORY0MoFXTLHtwqM81KHSHH52nUyo0+KZWEFu1O7uNj/iz3yU2+SXPPHrJOVaJhAwaWxC26Y7NZGazrqxW14mUOHwpvRUZxf3UORbKGBd8zh6quW85Xl0VreW5qKt08LG2EBsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH7vOoVdySHDcMngfOJjdeuoWeScfB4wJ/fxTdcnfkE=;
 b=bDRs2MMFWPowEcjR86sDVTXtJo8w4tGvva0VXGTEjIo70nXXr5LY9FO44dVxJnAdQ0tRmjHj+nTyOXTcg98Q7ukXlRdED6/t0WxZczHtu8kzIMhD5rh9RMQdYj6XE1Gb7dBlCZwkN4rvEzwB7wQlaIxQjtFV9uRprhOB71OmYGXu45oi59dZqnUs4+0FaSoNeOZoKpa5zKdC9+F88Z7u/TcgxC02CeFeH+vc/EScm0v94c5K3mBTrBR0ztYnwIBHzyZIk2x74db5MlC07k1cn03/bw9Lf24Ju6gKcQwZrsSkRFAhsuhoHkgIwRdMHm5xjvXRAtotmjVSwE4LuewIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH7vOoVdySHDcMngfOJjdeuoWeScfB4wJ/fxTdcnfkE=;
 b=jzNFJ1VoCVjxvtWbAZ3TDNwTmt7Y2+UkR/K7Ap8rwS1yxIWUdCk4cwhV/nKNGc96M6936KpqwYUjnTBj8ZG8NXLzfCjZZ8WWoOh5f+sVqhY8Rsi0TmTjV9aN/P4ShTbmu3hLPLqxPC7VdHTwkDkJDSRt65qtskRsUr4nGSbzXeI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jason Andryuk <jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>
Subject: RE: [PATCH] CHANGELOG: Mention xl/libxl SMBIOS support
Thread-Topic: [PATCH] CHANGELOG: Mention xl/libxl SMBIOS support
Thread-Index: AQHZWAQMdRIKvzrNp0K8V9SRH4AMRK79XYFQ
Date: Thu, 16 Mar 2023 13:02:45 +0000
Message-ID:
 <AS8PR08MB799185F5A935A3D2A4A7C79C92BC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230316123649.8682-1-jandryuk@gmail.com>
In-Reply-To: <20230316123649.8682-1-jandryuk@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CE9809BD26B1BA42B33CC2455D484051.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7346:EE_|DBAEUR03FT060:EE_|DB5PR08MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ee5515-6a55-488c-6205-08db261ec154
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dvVPlRAJB5mWuZOJ1QOJE8T5pyMYvFyu3ADTK/Y7gJFaOnLlkuQTyNac4ATMBGYhlAlx90DnGWl7ktd2sqAevCNlrYFjwa/mDnMv/4Mg9pSmJ0kKyEN4hSKPeAoRu/IygHkJvtbZHHJUvo0k1jSasXcIFoJbWhYx4x3pZdhhhJ6QaWsxmLj0fuAC815Y18vJhFkLvHWZxgDXmgqJp1rtnUbMl7iWKaQ8i4sp+qoLrAmafYyi0GGG40viy3ucpqDOivIAH7gAIc3wmqGjysyoj4zwi1YRbKBYl3zRy8sgNl6rfiy5Z6kl0TZgfS/XEuYfO8/dR0hgcILEdBSENuSKXKcgNrC/FDN++u35FImioF2LsaJSG+alD3co92P6zZFjh6I/pZuXTVAqS2aJpcrZoECsPMbDA5UksAl7DSJgH3dFqcHNTCvvN5exmBL3MVI1oQP7DbKWRiioJ2bg0eRXaUiSz5zzldQuY3JneGhKzO7GWWznKDlT9bqRo96iTw2+K9SrHk1E7x9kxpRkZZY9H/EOYtjm4n32+yltfMs1iSNrk3csnXKqlxXhfbf1xWT47tHQ/gPnQc+w4ffeWyCixeHMqegHfCEyTfBzIntbQPAA7hHtKrMF5wV0QP3bNWUdbQLz/aEPmnUEAq7mjZAvAorQTdmEtVmvd69qpl4RqNxQbgOeEGnCVG8g51b2BzvItEA6S4NXmeqOkS5spDW1Jlx53mMAdrCDeSXjiBrxvtRiLJYvaXn9IS97g+iV4LglY8jWxH8G/OrEvdiUPCzJ9mj4P5kvb5rxIibbJOaEUaM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199018)(33656002)(4326008)(558084003)(8936002)(41300700001)(52536014)(2906002)(38100700002)(86362001)(38070700005)(5660300002)(122000001)(7696005)(66946007)(76116006)(478600001)(8676002)(66556008)(66476007)(64756008)(71200400001)(66446008)(55016003)(110136005)(316002)(6506007)(26005)(9686003)(83380400001)(186003)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d93afedc-7f5e-4f59-1934-08db261ebc57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bt49AWXhpXX4smuptRQ67XTR+qjtF9yHhduf/SPlyYbQNU8tXvW0HYRBT5v+yDmSoD7YFdesQ3zZT0xfA5grzVlKvyAWhfh1JpmhT7l0lYa7rHFJJ5Te+UhpXX/wgk9eoA1yDUYxGkzis7YAyFMl47I77XNMRH/o6YNiWwgLyogDXPGn4cCOAtYEJfDOYRLtugVuGsiodIMt1Sjer+0hUOUTDHb9fKSHKwWqe5M1XFnUMBre4hwwtwVuy/jy3OOIBJ/memiNtUWUNXE6w7I0BI6EiIhusF2LAiJICX9RTJFdBk3sol8cC2y1VSEddKA8DSnl4zTYVdy63vVpX9ga0+HhQzYm9I96EUiQ5zQxN0lgWjixuEa1Uz7Ubhx7s5LZpxHSD4JtyOx1MGfTkz1FVbmDQX4o3PxqgJvg/Ow6z8CBOzNtT0aiGvr6BQ3PFF02R9pUlxekQB93jAAana3YXesrGfijfp2sOq8dX9QKstzSbXmFO5lVO3/7jxxiPcXOL7UQFTORpEyU/Npfm7qy4RqpXzDs7aF395AKndqeZsnNrt0szbIdEwO2hEaFb0ndGPV65TDFQ7zQGf3Y848gs1Pm7I+BIsmWG9M3DUmCEVot2zkEl455sAu3PbQCixPHYjm7NnHI1mKWxs7EhASkmRV1yyrL/1MNKjBiEmeky1dKuQRs7QPU+0cLEVQgG/k9R1k7BReEOTkG6Rq93ErEL5JY6FE0PN95R00UvVuV6mHKFSoz7MWZFD6VFOR38ySHA069xS1zLFjah8XcHuVJHloYDzDRjf2lpJQnj8KcEr4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199018)(46966006)(36840700001)(40470700004)(33656002)(83380400001)(82310400005)(110136005)(40480700001)(336012)(47076005)(40460700003)(316002)(55016003)(26005)(7696005)(8936002)(186003)(478600001)(5660300002)(9686003)(52536014)(356005)(41300700001)(86362001)(4744005)(2906002)(36860700001)(4326008)(81166007)(8676002)(82740400003)(70206006)(6506007)(70586007)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:02:53.7464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ee5515-6a55-488c-6205-08db261ec154
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10213

Hi Jason,

> -----Original Message-----
> From: Jason Andryuk <jandryuk@gmail.com>
> Subject: [PATCH] CHANGELOG: Mention xl/libxl SMBIOS support
>=20
> Add an entry for the new xl/libxl SMBIOS support.
>=20
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

