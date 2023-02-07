Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FAE68CEB4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 06:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490860.759743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPGDj-00073t-6B; Tue, 07 Feb 2023 05:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490860.759743; Tue, 07 Feb 2023 05:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPGDj-00071u-3J; Tue, 07 Feb 2023 05:08:43 +0000
Received: by outflank-mailman (input) for mailman id 490860;
 Tue, 07 Feb 2023 05:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+Lq=6D=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pPGDi-00071o-3b
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 05:08:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad3d900-a6a5-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 06:08:38 +0100 (CET)
Received: from DB6PR07CA0170.eurprd07.prod.outlook.com (2603:10a6:6:43::24) by
 DB4PR08MB9333.eurprd08.prod.outlook.com (2603:10a6:10:3f6::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.31; Tue, 7 Feb 2023 05:08:07 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::ac) by DB6PR07CA0170.outlook.office365.com
 (2603:10a6:6:43::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.16 via Frontend
 Transport; Tue, 7 Feb 2023 05:08:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Tue, 7 Feb 2023 05:08:07 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 07 Feb 2023 05:08:07 +0000
Received: from 804c477540a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8ECE839-2908-4121-ACCC-A34975724923.1; 
 Tue, 07 Feb 2023 05:07:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 804c477540a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Feb 2023 05:07:57 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS4PR08MB7603.eurprd08.prod.outlook.com (2603:10a6:20b:4cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 05:07:54 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6064.025; Tue, 7 Feb 2023
 05:07:48 +0000
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
X-Inumbo-ID: 7ad3d900-a6a5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El5gqzAjs0tLTnk4nu8rNjqFlBTKVoahck+qKfhqyUY=;
 b=deL8sRkO8BR4o8M8jPkzvL/WJKQy8uo3x5xM1EOjeqTavztKZa0w0UB/yDFbOfNqgAeB+4Tjm0kr8MSQ0e60Y6/2AuLh/AGvDvI8FTxonVL7EPXPfxOUdOsd5dmUrh6G0Jz3yL98GNodqxLgw1ZlJOxNtCNfPxyEZPwNAdzYZ3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNHyt9X1JtK43DMUZ/ZDJzKozPNlPR+hKeCM3cyrqJml7w+RmeiAmZNsNV1ME8YsnW8vqaB34JigSuzCmc4p9P/f72eof7YwrVhBiPWy+9zj2fbmmW/sWXYEF1+W0zVV09Tauws7qPoHcJFc0ZTBagW/eFQSF+WTjzn4497FGWDmhtfruYO67FyKWa4LxLy6PKs7Er2Q6dX13Lt3B5PQoXTooCbUFu5ZF0bnhQCR6CmqoGHKJwX3LhEU/fd0r2E56d7nWeRcCEAZoH3U/QNih32K6WDlqgMCccICNWMBr138QZVrzS0RInFiuOlqecwQVDsEuqas0ib3zrzevaCjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El5gqzAjs0tLTnk4nu8rNjqFlBTKVoahck+qKfhqyUY=;
 b=ZLChP5Jfa91BCWxhbaIazhyAG8oH9VCsDikN2Z/7gSuWPWpJAAuehE1eHnwlng5OCsBOnsUJwPu6YbKDhr/Uua5qHpCWUbFDiuqqx34qjwZjtGyGTNaU+s7Ebte5XcQ9RAuIaRfBe+a2+Jz2jenk7BV4BdcXKClj7N2xGCOkpHpvUigu1gMnM1YNDK1x1ymfPzqPez+aLyP27WD5pKdwnW7PyO7jW//AB7aq1tvan/NTvZJ/T/Tt9Hgk5cz/ZdmVcxp6ka054TLTaZ7MVQI5qOlZZEPwtQLfJMy8nRsT8xRuTKmnYtHtXNz7fr5Pyk5eh3KvCSB8V0bNyKlfMa94ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El5gqzAjs0tLTnk4nu8rNjqFlBTKVoahck+qKfhqyUY=;
 b=deL8sRkO8BR4o8M8jPkzvL/WJKQy8uo3x5xM1EOjeqTavztKZa0w0UB/yDFbOfNqgAeB+4Tjm0kr8MSQ0e60Y6/2AuLh/AGvDvI8FTxonVL7EPXPfxOUdOsd5dmUrh6G0Jz3yL98GNodqxLgw1ZlJOxNtCNfPxyEZPwNAdzYZ3k=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 19/40] xen/mpu: populate a new region in Xen MPU
 mapping table
Thread-Topic: [PATCH v2 19/40] xen/mpu: populate a new region in Xen MPU
 mapping table
Thread-Index: AQHZJxAyhm/BFklSvUiEwXIvodABZq7BCEGAgAIHbzA=
Date: Tue, 7 Feb 2023 05:07:46 +0000
Message-ID:
 <AM0PR08MB4530A110F1C3565AE8339D5FF7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-20-Penny.Zheng@arm.com>
 <a8c4577f-9eb2-cee2-5f6d-acba41f9c274@xen.org>
In-Reply-To: <a8c4577f-9eb2-cee2-5f6d-acba41f9c274@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9019E052A7CA394DA6C71419DE71E7A9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS4PR08MB7603:EE_|DBAEUR03FT060:EE_|DB4PR08MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: bace2081-5419-4e6b-d60f-08db08c94cdb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zB7FM2uqv87m3EJKD4tL5RW98Gn5W5y70ls0Gc9mOHFcH3g/w54qaILG4ibt4x0doB14xLvZaNzcZn+kI2Z/bHDysXNTNZaU09D9ILp9kPAA4pcmiTgnGkMMV1jI2H0mMw6DyTOU19IlMY3z5ZjwK+2scWZNM+XhXCkCxnkdr5SXi3/UJhXtdxHAJG1b/eeLDcwGg8s0FX+0vqiaRB/TwW7XyapHHIYIzYPLXeEpqwUb+o/t7xP8VoN2LSj+wzZqx+ZeMryBiCV1v89lUphIIfv4qYAnpFZV7LEEIMz1Gm6vrOe9Gm+PACHNct8mWZU12Aq9ujdmo9O40XC6oahbCdxgs3BnU1T50564qViDpMtfeAf8yBwzzD32kBNIZMf1BGJ+4ZJP5lpSjAugb4mDGFJQQwziExOYmGio7YcrsZdyDILndRcm7uBZ7ZEBucGQ3kicgHVv7SIz5T59PaqZQ+lgoc0g3fdEUzlJfv9DbpiugtvYn5CX7obxI4hCrHpvVIGCXLMoNieJseSYI7G9xttBYki+ILZfwZfZGkdWvLeUd00F9bZsOr29vTRYCENlxmpWHuxEZQblm0Tev3eBbAqtLr6gw2wUX9ntr46OXY7juTx9KXlJjywXNCYouNmtAdHYpU5ydONTRPJyawpcmUi0geNsM64cqcLzi1MnX9XXPHFlN+ehuOTQ05tJEAUdr0kd4FGt7Kk74rkAMEUORg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199018)(186003)(6506007)(26005)(9686003)(7696005)(53546011)(86362001)(38070700005)(33656002)(83380400001)(71200400001)(478600001)(2906002)(110136005)(8676002)(316002)(54906003)(4326008)(76116006)(122000001)(38100700002)(66446008)(66476007)(64756008)(66556008)(41300700001)(8936002)(5660300002)(52536014)(66946007)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7603
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b1392be-6370-49f7-2c38-08db08c94038
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3RWU5uZb1jcDbqgiBCAFGbSZORZjbnnXncIUdiPoimfWYjfo18Y6ztcCkVYEH+zun7iBsfVzSF49reNdozvIkkoJ1SMWyZuty1QmnCD9ZBCsxD9RgJp2k8yzeeKZTuxxdkFu0QNJIzp2Y3Yasnqe/0lD6K1T1LBsKtkQAnlxbkmzIWjbx3lyzvEAA/noDkaNe6x4gFIl/JAMDkKmGfyJhE1EJ1VocPqr5AdkeqCLhNl9SHQ2QesOX4GXjRocZPIVaVl7rgpvZNULpgu7BQQeVr36bKZh8JaVsqLT63oXXe4LKb9zf//lPgZ+dZNroztd0TekN1k6a+n09pDLNYVSr2qtjgYu5Auukrnv8+i0faK3/UNKapoDRRAas3ZJj59l2GtZgy7KGz0swfzK4Lh7Fy5UEq31uqRR4SshWbytwjIIz86jRZnGdAxD5IazCGYgILWpU47n8cUVLFGzolgwTvIk0RLfRdLy20YFFdFgfu2asv+KJ0X+Kf4lppTIklo6vC6v3dJv+MaDxgdYmfLFpU4uVGppqVOWrKQogafTnyYksHmoD2+At29BS3+kIb290AnoQF2bE/ZxDTtX54QhjZAGMZyTvXWDbikTvSwbG8DpsOKe4RWj1fbOrVeT8AxtXmF7Scukj6r4w0L93EWtsqBbC2YZnRZ0UDskaaLiR4BvQj7gbsRkv2kZlEquUqLpqgdQbE9RMcqsAk8A5M1zyg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(110136005)(36860700001)(33656002)(7696005)(356005)(40480700001)(55016003)(82310400005)(81166007)(82740400003)(86362001)(2906002)(70586007)(316002)(4326008)(70206006)(8676002)(40460700003)(8936002)(52536014)(5660300002)(47076005)(336012)(54906003)(83380400001)(26005)(9686003)(6506007)(41300700001)(186003)(53546011)(478600001)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 05:08:07.3981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bace2081-5419-4e6b-d60f-08db08c94cdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9333

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSA2LCAyMDIz
IDU6NDYgQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAxOS80MF0geGVuL21wdTogcG9wdWxhdGUgYSBuZXcgcmVnaW9uIGluIFhlbiBNUFUNCj4gbWFw
cGluZyB0YWJsZQ0KPiANCj4gSGksDQo+IA0KPiBPbiAxMy8wMS8yMDIzIDA1OjI4LCBQZW5ueSBa
aGVuZyB3cm90ZToNCj4gPiBUaGUgbmV3IGhlbHBlciB4ZW5fbXB1bWFwX3VwZGF0ZSgpIGlzIHJl
c3BvbnNpYmxlIGZvciB1cGRhdGluZyBhbg0KPiA+IGVudHJ5IGluIFhlbiBNUFUgbWVtb3J5IG1h
cHBpbmcgdGFibGUsIGluY2x1ZGluZyBjcmVhdGluZyBhIG5ldyBlbnRyeSwNCj4gPiB1cGRhdGlu
ZyBvciBkZXN0cm95aW5nIGFuIGV4aXN0aW5nIG9uZS4NCj4gPg0KPiA+IFRoaXMgY29tbWl0IG9u
bHkgdGFsa3MgYWJvdXQgcG9wdWxhdGluZyBhIG5ldyBlbnRyeSBpbiBYZW4gTVBVIG1hcHBpbmcN
Cj4gPiB0YWJsZSggeGVuX21wdW1hcCkuIE90aGVycyB3aWxsIGJlIGludHJvZHVjZWQgaW4gdGhl
IGZvbGxvd2luZyBjb21taXRzLg0KPiA+DQo+ID4gSW4geGVuX21wdW1hcF91cGRhdGVfZW50cnko
KSwgZmlyc3RseSwgd2Ugc2hhbGwgY2hlY2sgaWYgcmVxdWVzdGVkDQo+ID4gYWRkcmVzcyByYW5n
ZSBbYmFzZSwgbGltaXQpIGlzIG5vdCBtYXBwZWQuIFRoZW4gd2UgdXNlIHByX29mX3hlbmFkZHIo
KQ0KPiA+IHRvIGJ1aWxkIHVwIHRoZSBzdHJ1Y3R1cmUgb2YgTVBVIG1lbW9yeSByZWdpb24ocHJf
dCkuDQo+ID4gSW4gdGhlIGxhc3QsIHdlIHNldCBtZW1vcnkgYXR0cmlidXRlIGFuZCBwZXJtaXNz
aW9uIGJhc2VkIG9uIHZhcmlhYmxlDQo+IEBmbGFncy4NCj4gPg0KPiA+IFRvIHN1bW1hcml6ZSBh
bGwgcmVnaW9uIGF0dHJpYnV0ZXMgaW4gb25lIHZhcmlhYmxlIEBmbGFncywgbGF5b3V0IG9mDQo+
ID4gdGhlIGZsYWdzIGlzIGVsYWJvcmF0ZWQgYXMgZm9sbG93czoNCj4gPiBbMDoyXSBNZW1vcnkg
YXR0cmlidXRlIEluZGV4DQo+ID4gWzM6NF0gRXhlY3V0ZSBOZXZlcg0KPiA+IFs1OjZdIEFjY2Vz
cyBQZXJtaXNzaW9uDQo+ID4gWzddICAgUmVnaW9uIFByZXNlbnQNCj4gPiBBbHNvLCB3ZSBwcm92
aWRlIGEgc2V0IG9mIGRlZmluaXRpb25zKFJFR0lPTl9IWVBFUlZJU09SX1JXLCBldGMpIHRoYXQN
Cj4gPiBjb21iaW5lIHRoZSBtZW1vcnkgYXR0cmlidXRlIGFuZCBwZXJtaXNzaW9uIGZvciBjb21t
b24gY29tYmluYXRpb25zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBl
bm55LnpoZW5nQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVu
QGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQv
bXB1LmggfCAgNzIgKysrKysrKw0KPiA+ICAgeGVuL2FyY2gvYXJtL21tX21wdS5jICAgICAgICAg
ICAgICAgIHwgMjc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAzNDAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPg0KWy4uLl0NCj4g
PiArDQo+ID4gKyNkZWZpbmUgTVBVTUFQX1JFR0lPTl9GQUlMRUQgICAgMA0KPiA+ICsjZGVmaW5l
IE1QVU1BUF9SRUdJT05fRk9VTkQgICAgIDENCj4gPiArI2RlZmluZSBNUFVNQVBfUkVHSU9OX0lO
Q0xVU0lWRSAyDQo+ID4gKyNkZWZpbmUgTVBVTUFQX1JFR0lPTl9PVkVSTEFQICAgMw0KPiA+ICsN
Cj4gPiArLyoNCj4gPiArICogQ2hlY2sgd2hldGhlciBtZW1vcnkgcmFuZ2UgW2Jhc2UsIGxpbWl0
XSBpcyBtYXBwZWQgaW4gTVBVIG1lbW9yeQ0KPiA+ICsgKiByZWdpb24gdGFibGUgXG1wdS4gT25s
eSBhZGRyZXNzIHJhbmdlIGlzIGNvbnNpZGVyZWQsIG1lbW9yeQ0KPiA+ICthdHRyaWJ1dGVzDQo+
ID4gKyAqIGFuZCBwZXJtaXNzaW9uIGFyZSBub3QgY29uc2lkZXJlZCBoZXJlLg0KPiA+ICsgKiBJ
ZiB3ZSBmaW5kIHRoZSBtYXRjaCwgdGhlIGFzc29jaWF0ZWQgaW5kZXggd2lsbCBiZSBmaWxsZWQg
dXAuDQo+ID4gKyAqIElmIHRoZSBlbnRyeSBpcyBub3QgcHJlc2VudCwgSU5WQUxJRF9SRUdJT04g
d2lsbCBiZSBzZXQgaW4gXGluZGV4DQo+ID4gKyAqDQo+ID4gKyAqIE1ha2Ugc3VyZSB0aGF0IHBh
cmFtZXRlciBcYmFzZSBhbmQgXGxpbWl0IGFyZSBib3RoIHJlZmVycmluZw0KPiA+ICsgKiBpbmNs
dXNpdmUgYWRkcmVzc3MNCj4gPiArICoNCj4gPiArICogUmV0dXJuIHZhbHVlczoNCj4gPiArICog
IE1QVU1BUF9SRUdJT05fRkFJTEVEOiBubyBtYXBwaW5nIGFuZCBubyBvdmVybWFwcGluZw0KPiA+
ICsgKiAgTVBVTUFQX1JFR0lPTl9GT1VORDogZmluZCBhbiBleGFjdCBtYXRjaCBpbiBhZGRyZXNz
DQo+ID4gKyAqICBNUFVNQVBfUkVHSU9OX0lOQ0xVU0lWRTogZmluZCBhbiBpbmNsdXNpdmUgbWF0
Y2ggaW4gYWRkcmVzcw0KPiA+ICsgKiAgTVBVTUFQX1JFR0lPTl9PVkVSTEFQOiBvdmVybGFwIHdp
dGggdGhlIGV4aXN0aW5nIG1hcHBpbmcgICovDQo+ID4gK3N0YXRpYyBpbnQgbXB1bWFwX2NvbnRh
aW5fcmVnaW9uKHByX3QgKm1wdSwgdWludDY0X3QgbnJfcmVnaW9ucywNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBiYXNlLCBwYWRkcl90IGxpbWl0LA0KPiA+
ICt1aW50NjRfdCAqaW5kZXgpDQo+IA0KPiBJcyBpdCByZWFsbHkgcG9zc2libGUgdG8gc3VwcG9y
dCAyXjY0IC0gMSByZWdpb24/IElmIHNvLCBpcyB0aGF0IHRoZSBjYXNlIG9uIGFybTMyDQo+IGFz
IHdlbGw/DQo+IA0KDQpObywgdGhlIGFsbG93YWJsZSBiaXR3aWR0aCBpcyA4IGJpdC4gSSdsbCBj
aGFuZ2UgaXQgdWludDhfdCBpbnN0ZWFkDQoNCj4gPiArew0KPiA+ICsgICAgdWludDY0X3QgaSA9
IDA7DQo+ID4gKyAgICB1aW50NjRfdCBfaW5kZXggPSBJTlZBTElEX1JFR0lPTjsNCj4gPiArDQo+
ID4gKyAgICAvKiBBbGxvdyBpbmRleCB0byBiZSBOVUxMICovDQo+ID4gKyAgICBpbmRleCA9IGlu
ZGV4ID86ICZfaW5kZXg7DQo+ID4gKw0KPiA+ICsgICAgZm9yICggOyBpIDwgbnJfcmVnaW9uczsg
aSsrICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwYWRkcl90IGl0ZXJfYmFzZSA9IHByX2dl
dF9iYXNlKCZtcHVbaV0pOw0KPiA+ICsgICAgICAgIHBhZGRyX3QgaXRlcl9saW1pdCA9IHByX2dl
dF9saW1pdCgmbXB1W2ldKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyogRm91bmQgYW4gZXhhY3Qg
dmFsaWQgbWF0Y2ggKi8NCj4gPiArICAgICAgICBpZiAoIChpdGVyX2Jhc2UgPT0gYmFzZSkgJiYg
KGl0ZXJfbGltaXQgPT0gbGltaXQpICYmDQo+ID4gKyAgICAgICAgICAgICByZWdpb25faXNfdmFs
aWQoJm1wdVtpXSkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgKmluZGV4ID0g
aTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIE1QVU1BUF9SRUdJT05fRk9VTkQ7DQo+ID4gKyAg
ICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAvKiBObyBvdmVybGFwcGluZyAqLw0KPiA+ICsg
ICAgICAgIGlmICggKGl0ZXJfbGltaXQgPCBiYXNlKSB8fCAoaXRlcl9iYXNlID4gbGltaXQpICkN
Cj4gPiArICAgICAgICAgICAgY29udGludWU7DQo+ID4gKyAgICAgICAgLyogSW5jbHVzaXZlIGFu
ZCB2YWxpZCAqLw0KPiA+ICsgICAgICAgIGVsc2UgaWYgKCAoYmFzZSA+PSBpdGVyX2Jhc2UpICYm
IChsaW1pdCA8PSBpdGVyX2xpbWl0KSAmJg0KPiA+ICsgICAgICAgICAgICAgICAgICByZWdpb25f
aXNfdmFsaWQoJm1wdVtpXSkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgKmlu
ZGV4ID0gaTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIE1QVU1BUF9SRUdJT05fSU5DTFVTSVZF
Ow0KPiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgew0KPiA+
ICsgICAgICAgICAgICByZWdpb25fcHJpbnRrKCJSYW5nZSAweCUiUFJJcGFkZHIiIC0gMHglIlBS
SXBhZGRyIiBvdmVybGFwcw0KPiB3aXRoIHRoZSBleGlzdGluZyByZWdpb24gMHglIlBSSXBhZGRy
IiAtIDB4JSJQUklwYWRkciJcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgYmFz
ZSwgbGltaXQsIGl0ZXJfYmFzZSwgaXRlcl9saW1pdCk7DQo+ID4gKyAgICAgICAgICAgIHJldHVy
biBNUFVNQVBfUkVHSU9OX09WRVJMQVA7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgfQ0KPiA+
ICsNCj4gPiArICAgIHJldHVybiBNUFVNQVBfUkVHSU9OX0ZBSUxFRDsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiArLyoNCj4gPiArICogVXBkYXRlIGFuIGVudHJ5IGF0IHRoZSBpbmRleCBAaWR4Lg0KPiA+
ICsgKiBAYmFzZTogIGJhc2UgYWRkcmVzcw0KPiA+ICsgKiBAbGltaXQ6IGxpbWl0IGFkZHJlc3Mo
ZXhjbHVzaXZlKQ0KPiA+ICsgKiBAZmxhZ3M6IHJlZ2lvbiBhdHRyaWJ1dGVzLCBzaG91bGQgYmUg
dGhlIGNvbWJpbmF0aW9uIG9mDQo+ID4gK1JFR0lPTl9IWVBFUlZJU09SX3h4ICAqLyBzdGF0aWMg
aW50DQo+IHhlbl9tcHVtYXBfdXBkYXRlX2VudHJ5KHBhZGRyX3QNCj4gPiArYmFzZSwgcGFkZHJf
dCBsaW1pdCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgZmxhZ3MpIHsNCj4gPiArICAgIHVpbnQ2NF90IGlkeDsNCj4gPiArICAgIGludCByYzsN
Cj4gPiArDQo+ID4gKyAgICByYyA9IG1wdW1hcF9jb250YWluX3JlZ2lvbih4ZW5fbXB1bWFwLCBt
YXhfeGVuX21wdW1hcCwgYmFzZSwNCj4gbGltaXQgLSAxLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmlkeCk7DQo+ID4gKyAgICBpZiAoIHJjID09IE1QVU1BUF9SRUdJT05f
T1ZFUkxBUCApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAg
LyogV2UgYXJlIGluc2VydGluZyBhIG1hcHBpbmcgPT4gQ3JlYXRlIG5ldyByZWdpb24uICovDQo+
ID4gKyAgICBpZiAoIGZsYWdzICYgX1JFR0lPTl9QUkVTRU5UICkNCj4gPiArICAgIHsNCj4gPiAr
ICAgICAgICBpZiAoIHJjICE9IE1QVU1BUF9SRUdJT05fRkFJTEVEICkNCj4gPiArICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICggeGVuX2Jvb3RfbXB1
X3JlZ2lvbnNfaXNfZnVsbCgpICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHJl
Z2lvbl9wcmludGsoIlRoZXJlIGlzIG5vIHJvb20gbGVmdCBpbiBFTDIgTVBVIG1lbW9yeSByZWdp
b24NCj4gbWFwcGluZ1xuIik7DQo+ID4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+
ICsgICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICAgLyogRHVyaW5nIGJvb3QgdGltZSwgdGhl
IGRlZmF1bHQgaW5kZXggaXMgbmV4dF9maXhlZF9yZWdpb25faWR4LiAqLw0KPiA+ICsgICAgICAg
IGlmICggc3lzdGVtX3N0YXRlIDw9IFNZU19TVEFURV9hY3RpdmUgKQ0KPiA+ICsgICAgICAgICAg
ICBpZHggPSBuZXh0X2ZpeGVkX3JlZ2lvbl9pZHg7DQo+ID4gKw0KPiA+ICsgICAgICAgIHhlbl9t
cHVtYXBbaWR4XSA9IHByX29mX3hlbmFkZHIoYmFzZSwgbGltaXQgLSAxLA0KPiBSRUdJT05fQUlf
TUFTSyhmbGFncykpOw0KPiA+ICsgICAgICAgIC8qIFNldCBwZXJtaXNzaW9uICovDQo+ID4gKyAg
ICAgICAgeGVuX21wdW1hcFtpZHhdLnByYmFyLnJlZy5hcCA9IFJFR0lPTl9BUF9NQVNLKGZsYWdz
KTsNCj4gPiArICAgICAgICB4ZW5fbXB1bWFwW2lkeF0ucHJiYXIucmVnLnhuID0gUkVHSU9OX1hO
X01BU0soZmxhZ3MpOw0KPiA+ICsNCj4gPiArICAgICAgICAvKiBVcGRhdGUgYW5kIGVuYWJsZSB0
aGUgcmVnaW9uICovDQo+ID4gKyAgICAgICAgYWNjZXNzX3Byb3RlY3Rpb25fcmVnaW9uKGZhbHNl
LCBOVUxMLCAoY29uc3QNCj4gcHJfdCopKCZ4ZW5fbXB1bWFwW2lkeF0pLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpZHgpOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAo
IHN5c3RlbV9zdGF0ZSA8PSBTWVNfU1RBVEVfYWN0aXZlICkNCj4gPiArICAgICAgICAgICAgdXBk
YXRlX2Jvb3RfeGVuX21wdW1hcF9pZHgoaWR4KTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAg
ICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCB4ZW5fbXB1bWFwX3Vw
ZGF0ZShwYWRkcl90IGJhc2UsIHBhZGRyX3QgbGltaXQsIHVuc2lnbmVkDQo+ID4gK2ludCBmbGFn
cykgew0KPiA+ICsgICAgaW50IHJjOw0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBU
aGUgaGFyZHdhcmUgd2FzIGNvbmZpZ3VyZWQgdG8gZm9yYmlkIG1hcHBpbmcgYm90aCB3cml0ZWFi
bGUgYW5kDQo+ID4gKyAgICAgKiBleGVjdXRhYmxlLg0KPiA+ICsgICAgICogV2hlbiBtb2RpZnlp
bmcvY3JlYXRpbmcgbWFwcGluZyAoaS5lIF9SRUdJT05fUFJFU0VOVCBpcyBzZXQpLA0KPiA+ICsg
ICAgICogcHJldmVudCBhbnkgdXBkYXRlIGlmIHRoaXMgaGFwcGVuLg0KPiA+ICsgICAgICovDQo+
ID4gKyAgICBpZiAoIChmbGFncyAmIF9SRUdJT05fUFJFU0VOVCkgJiYgIVJFR0lPTl9ST19NQVNL
KGZsYWdzKSAmJg0KPiA+ICsgICAgICAgICAhUkVHSU9OX1hOX01BU0soZmxhZ3MpICkNCj4gPiAr
ICAgIHsNCj4gPiArICAgICAgICByZWdpb25fcHJpbnRrKCJNYXBwaW5ncyBzaG91bGQgbm90IGJl
IGJvdGggV3JpdGVhYmxlIGFuZA0KPiBFeGVjdXRhYmxlLlxuIik7DQo+ID4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgaWYgKCAhSVNfQUxJR05F
RChiYXNlLCBQQUdFX1NJWkUpIHx8ICFJU19BTElHTkVEKGxpbWl0LCBQQUdFX1NJWkUpICkNCj4g
PiArICAgIHsNCj4gPiArICAgICAgICByZWdpb25fcHJpbnRrKCJiYXNlIGFkZHJlc3MgMHglIlBS
SXBhZGRyIiwgb3IgbGltaXQgYWRkcmVzcw0KPiAweCUiUFJJcGFkZHIiIGlzIG5vdCBwYWdlIGFs
aWduZWQuXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgYmFzZSwgbGltaXQpOw0KPiA+
ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHNw
aW5fbG9jaygmeGVuX21wdW1hcF9sb2NrKTsNCj4gPiArDQo+ID4gKyAgICByYyA9IHhlbl9tcHVt
YXBfdXBkYXRlX2VudHJ5KGJhc2UsIGxpbWl0LCBmbGFncyk7DQo+ID4gKw0KPiA+ICsgICAgc3Bp
bl91bmxvY2soJnhlbl9tcHVtYXBfbG9jayk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHJjOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQgbWFwX3BhZ2VzX3RvX3hlbih1bnNpZ25lZCBsb25nIHZp
cnQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBucl9tZm5zLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpIHsNCj4gPiArICAgIEFTU0VSVCh2aXJ0ID09IG1mbl90
b19tYWRkcihtZm4pKTsNCj4gPiArDQo+ID4gKyAgICByZXR1cm4geGVuX21wdW1hcF91cGRhdGUo
bWZuX3RvX21hZGRyKG1mbiksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZu
X3RvX21hZGRyKG1mbl9hZGQobWZuLCBucl9tZm5zKSksDQo+ID4gK2ZsYWdzKTsgfQ0KPiA+ICsN
Cj4gPiAgIC8qIFRPRE86IEltcGxlbWVudGF0aW9uIG9uIHRoZSBmaXJzdCB1c2FnZSAqLw0KPiA+
ICAgdm9pZCBkdW1wX2h5cF93YWxrKHZhZGRyX3QgYWRkcikNCj4gPiAgIHsNCj4gPiBAQCAtMjMw
LDE0ICs0OTgsNiBAQCB2b2lkICppb3JlbWFwKHBhZGRyX3QgcGEsIHNpemVfdCBsZW4pDQo+ID4g
ICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gICB9DQo+ID4NCj4gPiAtaW50IG1hcF9wYWdlc190b194
ZW4odW5zaWduZWQgbG9uZyB2aXJ0LA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICBtZm5fdCBt
Zm4sDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiA+IC17DQo+ID4g
LSAgICByZXR1cm4gLUVOT1NZUzsNCj4gPiAtfQ0KPiA+IC0NCj4gDQo+IFdoeSBkbyB5b3UgaW1w
bGVtZW50IG1hcF9wYWdlc190b194ZW4oKSBhdCBhIGRpZmZlcmVudCBwbGFjZT8NCj4gDQo+IA0K
PiA+ICAgaW50IGRlc3Ryb3lfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQg
bG9uZyBlKQ0KPiA+ICAgew0KPiA+ICAgICAgIHJldHVybiAtRU5PU1lTOw0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

