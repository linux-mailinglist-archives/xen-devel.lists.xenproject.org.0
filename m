Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EE55FAC9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357626.586299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TFB-0004ls-Ji; Wed, 29 Jun 2022 08:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357626.586299; Wed, 29 Jun 2022 08:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TFB-0004j3-FL; Wed, 29 Jun 2022 08:40:17 +0000
Received: by outflank-mailman (input) for mailman id 357626;
 Wed, 29 Jun 2022 08:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlzK=XE=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o6TFA-0003bb-02
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:40:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c421d4-f787-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 10:40:15 +0200 (CEST)
Received: from DB6PR0802CA0030.eurprd08.prod.outlook.com (2603:10a6:4:a3::16)
 by AM6PR08MB4627.eurprd08.prod.outlook.com (2603:10a6:20b:d1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 08:40:11 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::27) by DB6PR0802CA0030.outlook.office365.com
 (2603:10a6:4:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Wed, 29 Jun 2022 08:40:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 08:40:10 +0000
Received: ("Tessian outbound 514db98d9a19:v121");
 Wed, 29 Jun 2022 08:40:10 +0000
Received: from ec086d193c11.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BF37E11-EEAD-4975-9EE4-A73768C28182.1; 
 Wed, 29 Jun 2022 08:40:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec086d193c11.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 08:40:04 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM5PR0802MB2514.eurprd08.prod.outlook.com (2603:10a6:203:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 08:40:01 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 08:40:01 +0000
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
X-Inumbo-ID: 18c421d4-f787-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Pz9QoPfoyV4CCZXSI0BQcuFEvKfJyWvzNbTqPJB/agWHkDXSWMZ7FgbPLfKKDhmCusZCY24mMIdJa8zm9mEfWR6Cw2fdEDv5kKUEK31KeNegZA0PmFPQMCWOksx148yKOqerUR7BLoxO7CtyKdoEe9GE9fxAQDqWTDgpWQO9Jz0rAPFIZRGvF3A2lmYBmOZ3GNQYMgLIy0lfT8welUGQqxq52mSKoGsvJfr/uth7QrtstEOzneFWy1KqxVHEP92aO8utlnzHUUs6tWMao+iq6nEsfBzRj8fqIMdtjb2Oc/xwvx6LPHSFhcDa5S+WGKP1dgaLO6P+VelPvTtSWWbcAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxhQYcrZizVHH6I3rhCROrcdC4H2VRPMprJbwCxCTC4=;
 b=QItI+iiBTqspEj710fjo8/YInw2jFGTZI67vz21+y9K+U4/w5RtbUDyk67eG206QJrdkakW7HDAcy20E452cUz79QIUVw9rEiKgFpGYMc51bIOGTHRyZKAzN6nEEn0qrKjQpMlxyrfPHf1o5pYN6CMb7l+TMUb1QI3puMkUU3kxunQS6fHKnMQOd9dW6+4XB6NFtGpp2HSoHUQBvVRbBBibXEY01QfY2tsb2flyQSWUcagJQr9TqWPgmsIrwLTNXYor7mqp6j9aLz4dp3JBE3ctIGX4inOFqhmcdjxNoR7z3/Pizba4lm8Ga+JR3Bk1J16cDabs+coLawlIWv3YzNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxhQYcrZizVHH6I3rhCROrcdC4H2VRPMprJbwCxCTC4=;
 b=QKqLvhmlV40vZ06FhaM4/zeF9gWmDsuVk2t4L9FIuGggH/HcFkUFdzStnPv6UzPXYsIGrlLhBNsEy9ioj2PpNj3TUHzovCgFQ3o/4oPbK+mUCVra4XvXAS9FH6RF7HwFOhwFnFYqkzxaew+YIHsRFqX1g/pf4Cs1Vb4KZ8jmqcQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGyAw55OPgQOTnwmvupatIy0KqB9hVUX9WODrQT059YnKNIXnF4Yzg/zhspaFYsfOivts6XGNLn+mLSfP0E0Bccd7kIUfjeoZh/m/oaDEC1RqLc6fnzD3A2Vp7ymzpxdlE1bk9zKbdK/vTGnFVUT+hX4wFM9gNfmdBFkTf54hNHtpakaAdnyt0Gu42tzk5qliQh5/poE2S+EiqJPPTWwKLa+FTKOwHoZaGw6tLueOULp5F4CqGiAbyOzm/5Rvrcv31wKqz60dh1wSd3zPimdSDB4LIjgUsuc6sURxGU3bo7tRIjABWZEJzzci27ezlPvR9ldZvTY0XGYVQAz5qJhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxhQYcrZizVHH6I3rhCROrcdC4H2VRPMprJbwCxCTC4=;
 b=Uaz2dFiqxen0dFT6gLK/O/eGRVPUusCabhLzAVblXhHZHYBWfYYflgj7+6TV6bdVmJs2c62fnCFcT1hJmgfkco/Ic+MmRypc8WqL1BDyBiNjLG30P6jJD4m+pAu8BgzDzvZIrLaukcitOafbDIhI1CFeuPtVaIvj61s7CxbMBWXic+vyF0icszy0/baGxttUU6KkAnJPE+PUwV/xHAy000qZTGIjLDRd7D9pF6O/aAROP7Olh2DcFSWDjq2zSAmZntiVLFsnuG5oVvE/u44ZnPFH79/y2UOhK+MHAZaH3cRU55Oiyn9GUWwHkrowe8cqGeyf9RyXe8L+BfRcmR3EKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxhQYcrZizVHH6I3rhCROrcdC4H2VRPMprJbwCxCTC4=;
 b=QKqLvhmlV40vZ06FhaM4/zeF9gWmDsuVk2t4L9FIuGggH/HcFkUFdzStnPv6UzPXYsIGrlLhBNsEy9ioj2PpNj3TUHzovCgFQ3o/4oPbK+mUCVra4XvXAS9FH6RF7HwFOhwFnFYqkzxaew+YIHsRFqX1g/pf4Cs1Vb4KZ8jmqcQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 1/8] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v5 1/8] xen/arm: introduce static shared memory
Thread-Index: AQHYhGRAIMWAAZoglEyYz3pT8Ubq/a1e94+AgAcdS3A=
Date: Wed, 29 Jun 2022 08:40:01 +0000
Message-ID:
 <DU2PR08MB7325D305AC5EC1881A57EFCCF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
 <f87c00c5-8253-0c51-4f05-e137d98fc149@xen.org>
In-Reply-To: <f87c00c5-8253-0c51-4f05-e137d98fc149@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1EBCD29F70FF0C4B8DC73D829A8A8C4A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cfe55523-3850-4f76-7065-08da59aafa60
x-ms-traffictypediagnostic:
	AM5PR0802MB2514:EE_|DBAEUR03FT007:EE_|AM6PR08MB4627:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 okhtmaoqFOs+iZiopfjsLaGYpPiO2WaJsMo3cUdjWSfModibNZidBvdsLai0pIjxIE/6b2VdepUbP99nCzvlR0ExgzuzsEWJaYYDXPzWX2QVBdT/DKhxkO9He/IJa+uEkoem0l1iFAQsMF1qXu1kusWb9Zbyl6K+AzOGgByKDIQJ1qdDHQps4ZOVpcb3RxKCNAshfROJWln7Z3AoIAF1TlBJMeune9it4g6T9OtTyguv8EHYxjf6rXPabl7dNkMt/IAncjb674dnkFVnqoZv79e2ytL83TTEcnt3Il2ujhkrTdw+vGI3WbPSqUmh1Yf6msrk0LMdXVJkWev9H5yOI+VAcd5/ai/HbYZ/6DiXw2+2CA8UCIYMPSjX6mI/Ut/t0bXLx5k9eiEPfQdUGmmfnGtXkIn/ZByfTKguXbLmjatLoyEL2ZryvQ7o68CS8qrap1gRd413Qlvtl3ozPJ6xC1NwcFH2lds4ULBCA2gETc26lCmLKRmF9/RvRtUmwACRlVr+zWtCgL4y3q/edo4aB7ZpjzdevmDmYXo7hEoIaBY70edH4DF/Swt+NMfdpFvYITMlSQfUcAIDuAy7pv7YN4z2+crWFq7Xh3fwLeYY9HdTBys+mkVayRhShITPZC9PhyGZlmLNfIs+iPOCq23tIB88tmd7RU3dJ0A3wwsY0I50RTZvxqYvHsgwEKoZe9zdJbj+gWdjPz0lyl3GT/em5aApPgf0C/30oq6xSPz2yNfoh/+4ccG3QoxtyRSTZeSmmm4S1rvggBbh3/hFxLzm8tB7HNxh9t2JkHhO3MjJAhM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(186003)(122000001)(33656002)(7696005)(6506007)(53546011)(110136005)(41300700001)(38100700002)(2906002)(38070700005)(54906003)(86362001)(55016003)(52536014)(64756008)(8676002)(9686003)(478600001)(316002)(26005)(71200400001)(76116006)(66446008)(66556008)(83380400001)(66476007)(66946007)(4326008)(5660300002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2514
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48dadc2d-58f8-417c-d87c-08da59aaf506
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h9RLiK37UDkDOG9vvLx+CIPjyfKCe2NbI+1y4tSXqzmGDBeqY5nt7ABCglYs/OAjDiLVulAng2CS9VYa3lC3Rmdpd4UgheMgFbNyYPGPsj2ZgoYsblDbrwfaJwb+wEDIrRdUpKAWtRC/3hc3UYXf0SpRYSHKDeaLi5qeAj25A57wSBfUAq/hsjEm7JAYH8YHdK7cNTMK1PBrD3+ToXtRLTaPkhYD8UERfNikkSkWwL0Aoa7WxLZMBOMxPqzKL0bHsNFRd5IhLDnoxH5ikCoLLFBouMDT9/RyLAXFzP6ngQ6aPSFgP3cktSQAyVthJP2igELzS4HOdxU9aXQ1X39bu+8qNlb5RmQnHvqFJ33q+ZJlEJuCPB/PQEO1RDVTKv19LB+8b6FipD+VT8X2DTXodi/S+8HAoz8XZLoV8+zU6tJuOc7ETZw4YC46OzDpO62MWZJqtCb9phBJyAXmm3Jfsf9niB8rvhdrF1M5oAB0Pc4Vr3CH04c8aX6Sy1HeNXYFq5RqPjYk7aBr7X+epcaNRMA2hN3xXOD7AggECh1yuQ5YFrZ+bSmVi+Ydal1xwechbOPuyyjAobuBtBtkp/9bIX5mG+l2i3DkpqB7vwqBv+U1WdN75loKGJD/ZUulNHL1/Wu4GBZeAQHL0vQFov0NRbH+ctL6F2J61bcYbYIGprUdW6TUxlWr0Qlz/lq+nzwQNsGWtdD4xppQrCzR9vaur6P8TCsktS6RfCOJ3nQr3f33h4VMDRg9uQv48abn1VP4PI3TXcX5DQU7dLW08FXjVAqp9yw7WvCRAA5bgQ/s1SA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(356005)(82310400005)(107886003)(8936002)(47076005)(186003)(33656002)(81166007)(55016003)(2906002)(5660300002)(83380400001)(316002)(110136005)(54906003)(336012)(86362001)(9686003)(36860700001)(70586007)(70206006)(52536014)(8676002)(4326008)(6506007)(40480700001)(82740400003)(40460700003)(7696005)(26005)(53546011)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 08:40:10.6126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe55523-3850-4f76-7065-08da59aafa60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4627

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMjUsIDIwMjIg
MzoyNiBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1
IDEvOF0geGVuL2FybTogaW50cm9kdWNlIHN0YXRpYyBzaGFyZWQgbWVtb3J5DQo+IA0KPiBIaSBQ
ZW5ueSwNCj4gDQo+IEkgaGF2ZSBsb29rZWQgYXQgdGhlIGNvZGUgYW5kIEkgaGF2ZSBmdXJ0aGVy
IHF1ZXN0aW9ucyBhYm91dCB0aGUgYmluZGluZy4NCj4gDQo+IE9uIDIwLzA2LzIwMjIgMDY6MTEs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLQ0KPiA+ICAgZG9jcy9taXNjL2FybS9kZXZpY2Ut
dHJlZS9ib290aW5nLnR4dCB8IDEyMA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgNiArKw0KPiA+ICAg
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgICAgICAgICAgICB8ICA2OCArKysrKysrKysrKysr
KysNCj4gPiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgfCAgIDMgKw0K
PiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxOTcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCj4gPiBiL2RvY3Mv
bWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCj4gPiBpbmRleCA5ODI1MzQxNGI4Li42
NDY3YmM1YTI4IDEwMDY0NA0KPiA+IC0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9v
dGluZy50eHQNCj4gPiArKysgYi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0
DQo+ID4gQEAgLTM3OCwzICszNzgsMTIzIEBAIGRldmljZS10cmVlOg0KPiA+DQo+ID4gICBUaGlz
IHdpbGwgcmVzZXJ2ZSBhIDUxMk1CIHJlZ2lvbiBzdGFydGluZyBhdCB0aGUgaG9zdCBwaHlzaWNh
bCBhZGRyZXNzDQo+ID4gICAweDMwMDAwMDAwIHRvIGJlIGV4Y2x1c2l2ZWx5IHVzZWQgYnkgRG9t
VTEuDQo+ID4gKw0KPiA+ICtTdGF0aWMgU2hhcmVkIE1lbW9yeQ0KPiA+ICs9PT09PT09PT09PT09
PT09PT09PQ0KPiA+ICsNCj4gPiArVGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGRldmljZSB0cmVl
IG5vZGVzIGFsbG93IHVzZXJzIHRvIHN0YXRpY2FsbHkNCj4gPiArc2V0IHVwIHNoYXJlZCBtZW1v
cnkgb24gZG9tMGxlc3Mgc3lzdGVtLCBlbmFibGluZyBkb21haW5zIHRvIGRvDQo+ID4gK3NobS1i
YXNlZCBjb21tdW5pY2F0aW9uLg0KPiA+ICsNCj4gPiArLSBjb21wYXRpYmxlDQo+ID4gKw0KPiA+
ICsgICAgInhlbixkb21haW4tc2hhcmVkLW1lbW9yeS12MSINCj4gPiArDQo+ID4gKy0geGVuLHNo
bS1pZA0KPiA+ICsNCj4gPiArICAgIEFuIDgtYml0IGludGVnZXIgdGhhdCByZXByZXNlbnRzIHRo
ZSB1bmlxdWUgaWRlbnRpZmllciBvZiB0aGUgc2hhcmVkDQo+IG1lbW9yeQ0KPiA+ICsgICAgcmVn
aW9uLiBUaGUgbWF4aW11bSBpZGVudGlmaWVyIHNoYWxsIGJlICJ4ZW4sc2htLWlkID0gPDB4ZmY+
Ii4NCj4gDQo+IFRoZXJlIGlzIG5vdGhpbmcgaW4gWGVuIHRoYXQgd2lsbCBlbnN1cmUgdGhhdCB4
ZW4sc2htLWlkIHdpbGwgbWF0Y2ggZm9yIGFsbCB0aGUNCj4gbm9kZXMgdXNpbmcgdGhlIHNhbWUg
cmVnaW9uLg0KPiANCg0KVHJ1ZSwgd2UgYWN0dWFsbHkgZG8gbm90IHVzZSB0aGlzIGZpZWxkLCBh
ZGRpbmcgaXQgaGVyZSB0byBqdXN0IGJlIGFsaWduZWQgd2l0aCBMaW51eC4NCkkgY291bGQgYWRk
IGEgY2hlY2sgaW4gdGhlIHZlcnkgYmVnaW5uaW5nIHdoZW4gd2UgcGFyc2UgdGhlIGRldmljZSB0
cmVlLg0KSSdsbCBnaXZlIG1vcmUgZGV0YWlscyB0byBleHBsYWluIGluIHdoaWNoIGNvZGUgbG9j
YXRlcy4NCg0KPiBJIHNlZSB5b3Ugd3JpdGUgaXQgdG8gdGhlIGd1ZXN0IGRldmljZS10cmVlLiBI
b3dldmVyIHRoZXJlIGlzIGEgbWlzbWF0Y2ggb2YgdGhlDQo+IHR5cGU6IGhlcmUgeW91IHVzZSBh
biBpbnRlZ2VyIHdoZXJlYXMgdGhlIGd1ZXN0IGJpbmRpbmcgaXMgdXNpbmcgYSBzdHJpbmcuDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

