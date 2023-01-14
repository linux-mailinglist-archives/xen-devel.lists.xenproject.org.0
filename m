Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A166A859
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 02:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477599.740370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGVQm-0006Wb-J0; Sat, 14 Jan 2023 01:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477599.740370; Sat, 14 Jan 2023 01:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGVQm-0006Uu-DM; Sat, 14 Jan 2023 01:34:00 +0000
Received: by outflank-mailman (input) for mailman id 477599;
 Sat, 14 Jan 2023 01:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OqO=5L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGVQk-0006Um-Tq
 for xen-devel@lists.xenproject.org; Sat, 14 Jan 2023 01:33:58 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2041.outbound.protection.outlook.com [40.107.103.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82ccbd6c-93ab-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 02:33:56 +0100 (CET)
Received: from DU2PR04CA0264.eurprd04.prod.outlook.com (2603:10a6:10:28e::29)
 by DB3PR08MB8985.eurprd08.prod.outlook.com (2603:10a6:10:43f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sat, 14 Jan
 2023 01:33:54 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::76) by DU2PR04CA0264.outlook.office365.com
 (2603:10a6:10:28e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Sat, 14 Jan 2023 01:33:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sat, 14 Jan 2023 01:33:53 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Sat, 14 Jan 2023 01:33:53 +0000
Received: from c959b49a63f9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A63AFBE1-0F15-4DAD-9901-489AF8756DE1.1; 
 Sat, 14 Jan 2023 01:33:43 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c959b49a63f9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Jan 2023 01:33:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8318.eurprd08.prod.outlook.com (2603:10a6:150:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sat, 14 Jan
 2023 01:33:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Sat, 14 Jan 2023
 01:33:39 +0000
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
X-Inumbo-ID: 82ccbd6c-93ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTjK6UGNM9axJgPFI4jB7B6Gis3T+zUgCHh8Qdg4OWY=;
 b=aF+0wynU70tejRijfxW0GVPVudNU4T3nUxQnWSVLYxOiv6BVKFJjEDS+gLevrkoa5pZHls2QBhaxW2zii8fd0tnwAV4k6b1O1jnD5iOdhi9iLvOlzTtFgGPmsHBzAoQDekYH5Lc/QotZu5+FnurQpc53aux4OtIuhxAi6/YCBzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOY+Glw9p4udld8+47Si4bUzm0ckqOswZZUp7YRHUG5Gh47foMJ7xWRb7xk1JG5zy/afUdlXpXF7+TBwLQ2YWtGg/q7o1n8/b99/a4mu/7cJfsL9L2Rpo//G3PNNDOipSetuT2rjC8VwCjaC5NdhfQ97WPVgJHVd/s+of8hAPmG8O9AHcWs7oMeCMOhI0fQ+UuP1gCbdGXQqosqdVJZ36CADSuD2+g2hBWP675NhvHJ413qnN5xMiOfyvRc6FaSYYP3qODSDwaqR1yhsRnJ+4m5zSebLefCF4yfrNv1VEnHt67O/0iCyxFunG0S+bNiAEMskvx+VINi3dLBjZX+TbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTjK6UGNM9axJgPFI4jB7B6Gis3T+zUgCHh8Qdg4OWY=;
 b=LOO/zDiKXOzIeoJoS3DEzl3sR1mO8q3bkpUFsOTG6MeywZIkHagpFonrGZelWj/yE1ibSPZQRi7k0e9xgCsug6GFo7qsNVSzLLko6cGdiBnM8ww6ZFE21RHGBZ7kTFBsUUyi6WvICSnGU7FNYHZOnoPgaWAVjOprgJ6Y5htDYDT5BFDHmswkXISxK3z9NMgniV64QaUFx012ilUgGxyfulpZJj3cm69LgO76xRGfjra1ijYoUjaOVf+TmAgR0FxL2rSHXFEDRSvw5fuoQTARGBoCytGW9aqumNYCpK16+YpTSX/NCD/AGGsKRYz7h4dhnk+2Eq1+mkE6dTf91tr1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTjK6UGNM9axJgPFI4jB7B6Gis3T+zUgCHh8Qdg4OWY=;
 b=aF+0wynU70tejRijfxW0GVPVudNU4T3nUxQnWSVLYxOiv6BVKFJjEDS+gLevrkoa5pZHls2QBhaxW2zii8fd0tnwAV4k6b1O1jnD5iOdhi9iLvOlzTtFgGPmsHBzAoQDekYH5Lc/QotZu5+FnurQpc53aux4OtIuhxAi6/YCBzk=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v4 07/14] xen/arm32: head: Jump to the runtime mapping in
 enable_mmu()
Thread-Topic: [PATCH v4 07/14] xen/arm32: head: Jump to the runtime mapping in
 enable_mmu()
Thread-Index: AQHZJzd9G8hkGu/MR0eHbN40F8df366dDCsw
Date: Sat, 14 Jan 2023 01:33:39 +0000
Message-ID:
 <AS8PR08MB79916F35468472BC5D27050092C39@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-8-julien@xen.org>
In-Reply-To: <20230113101136.479-8-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9079C52B9CDB554C8FCDE8B4F0079B2E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8318:EE_|DBAEUR03FT047:EE_|DB3PR08MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: df4af43a-019d-4ccb-1ae2-08daf5cf655f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vLe7XCrhDi1P5vFkexryqyx/I4hM6A8Kupt42BqLFhhMsOWG/JC6auAzi7vl60X6kDEVll6hOhaeI/c4EQJbxciuQJJOwoZQqZxtkAEpQyWgPho4xOoyPd+8YxDnyRP9Z/pFrgViNMDORnGU3eYdBtfqbV02oA5r50MI05vV2C5rFH/yw4Tp0BmHXmmG5GG+lWEJWik7/bUWWuGttWgUTGLDSv9umcxjGZYkHl9Yno5tutIfBKZ97BW/5Ny/+3Em4SfDSoN34f3ZcAXBFC/75j7wqGCiFWbgSrJr85pTBhjtejzLhW+VIeIj2gTkqDiR3DMNnT4UYLlOCqg1SCWL8LbWINxR/esku5dIqrNKmTT86xfpSM3I9GSI9vHdpzU5uGDMgBCgHdzh6a9EHQR/JogQHqPUlQ6GrynpFaIYKEof5tpZZQnLvAfL84RnBFAA7gArFSX1ooM4O6gCjeBPwJ7zgyghua0VX2iXurTekw2E3uQlyIPKi/FtWvapkuUjwDJUn51OwmRM49GzdOCR3xFLIvzjrgVvPkcaKkhCC7pECc1nEez5IO+jgPNqgdleQyEjvg+ehXhL12awX+lvB9aCU+G95uwRsZ69KuUjOEtZpkMvCAJCv8xaV2EbF5BaCNwtWIKv0w1ApIkPELhX2Cbi6DZeBJdbDOHhQnT4Iixm/394ccOjjrlcrFKcbngqTT/b7xkZOWHBZxx4eiFNlQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(83380400001)(9686003)(54906003)(71200400001)(86362001)(110136005)(33656002)(55016003)(7696005)(6506007)(38070700005)(5660300002)(4744005)(122000001)(38100700002)(26005)(186003)(316002)(76116006)(2906002)(66446008)(478600001)(41300700001)(8936002)(66556008)(64756008)(52536014)(66476007)(8676002)(66946007)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8318
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd20ada4-669d-4fe0-2223-08daf5cf5d07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Khe4ktwGrLQmeHkr61pneaYz2H3vS9wOEs/QC1n+S48qXfVF0ikvyZkabvgUedPGHS4YcAHKqQSNJfEndGI8DYlkrlgHmgdSEa8vE1p+nU8mduoyFxn1wFa1z02FtuHhMyYoxVAAL0h0oZFdSkal6I75D1CIWpeX3RKBxDuQRDU4z6AIdZ58wSK3gsUyvZZt5cOgU93u6x3WBQXbzZ5pzv6uPW88AlaLcMIg8Kaz7565fGDqMNWRScwFNv+uYBD5Cor072MJpOGJV++a2pkLh7WXbm+UMBuwKeBNWl3LBssbJbPsX/dXWD7vUv8w0Z5GH5hhC8R83r2FWRLYTdypyKT5NuZQuAFp14FLIjPdI9WonN91smpj7sbg3CiSfgFrYWMptPP4Zws5/WUCSlxoVUHcs/YYmCfJXXLqMbWwfHiZmDfLAw5II1xF2zm6e1AUSTFbMPW0R+DUGWcDm/LiAPXCRG3hSQhhsEi+BfGdNfm3tsmp/sJSnv7o03CnNGWI5CWaDMvv41oB7B92Gyug8gPOvGH5YWYbc91mVjDPYPCOcqp30w2AoylL8jDHDLL/+uAaiEfdFycB/iR6Ou6auad4nCINAZ2cPm7C0DD8aJztseC8CaMEK2UWsy6rbOjWhxDINg6BVUxZlqus84G0AaRL7d7EDsVI8gQh4R9VFcpoi3Q4lbdihm15DQdRbAtcwzLJx9yG4V3rYHvtz1QCKw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(7696005)(33656002)(26005)(478600001)(4744005)(356005)(2906002)(9686003)(186003)(41300700001)(336012)(86362001)(316002)(4326008)(8676002)(70586007)(70206006)(47076005)(40460700003)(81166007)(5660300002)(55016003)(83380400001)(40480700001)(8936002)(82310400005)(52536014)(110136005)(82740400003)(6506007)(54906003)(107886003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 01:33:53.4113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df4af43a-019d-4ccb-1ae2-08daf5cf655f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8985

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 07/14] xen/arm32: head: Jump to the runtime mapping in
> enable_mmu()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, enable_mmu() will return to an address in the 1:1 mapping
> and each path is responsible to switch to the runtime mapping.
>=20
> In a follow-up patch, the behavior to switch to the runtime mapping
> will become more complex. So to avoid more code/comment duplication,
> move the switch in enable_mmu().
>=20
> Lastly, take the opportunity to replace load from literal pool with
> mov_w.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I've tested this patch on FVP in arm32 execution mode, and
this patch is good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

