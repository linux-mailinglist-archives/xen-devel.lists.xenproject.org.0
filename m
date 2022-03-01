Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1574C80FA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 03:24:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280801.478862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOsAy-0001Gw-NK; Tue, 01 Mar 2022 02:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280801.478862; Tue, 01 Mar 2022 02:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOsAy-0001F6-Ji; Tue, 01 Mar 2022 02:23:44 +0000
Received: by outflank-mailman (input) for mailman id 280801;
 Tue, 01 Mar 2022 02:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQ5=TM=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nOsAw-0001F0-In
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 02:23:42 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe05::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b40ea7b-9906-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 03:23:40 +0100 (CET)
Received: from AM6P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::20)
 by VE1PR08MB4943.eurprd08.prod.outlook.com (2603:10a6:803:115::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 02:23:36 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::64) by AM6P194CA0007.outlook.office365.com
 (2603:10a6:209:90::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Tue, 1 Mar 2022 02:23:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 02:23:35 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 01 Mar 2022 02:23:35 +0000
Received: from 5388833892eb.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F910AAE-1F4F-4469-B130-AC55B6892B8C.1; 
 Tue, 01 Mar 2022 02:23:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5388833892eb.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 02:23:29 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB6792.eurprd08.prod.outlook.com (2603:10a6:20b:39b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 02:23:27 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5017.026; Tue, 1 Mar 2022
 02:23:27 +0000
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
X-Inumbo-ID: 9b40ea7b-9906-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTGQd/P50vO2uv8yJoK90CmmYZ3D80zXhuQbGwfKZBQ=;
 b=5ABs9MtgT0BiQH7piAaXijpw+6AUONrMapZjjPdbaIjWXUtIFmyYy5GVOtE9AiiBevEN7aLd+udzopk6x+CCcYdiNpDC4pqkdtt+Bdbb6WFvJXl9bfzIWPwTFQqLthi410v7ap9ym/lbNkEXYo6oCcxnUijib09FtGpsAr2bkzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzH4vME1n3ww2MMCtHNBK1VRy9mtoTjCekKk/6wVuu0GB9MAPdNiEqFALIVmT4TCPAMZkqsMb7PJjvKspad6jzq6r7U4lN/ZqwRvt+ekZk/Dr+bb9wF7huFWffQMWTnTHa3XjY84k0N9BzUScQ/xOtpuyhkhSXjNLYa7WmShrnhQgpSKAlv1Q1I8LQewbm8Nbp+yfpKziWL2tbkokIZGMX9+4QKqre48sbczWK39Z7GTJstb/l5JogQapWHteIOraT2X+wyKxHasJ0DoFjHfM8lWl9kEDE4VU00IwmXs4uY/XVWkAsxRrO725UxKA6jDo70UT6q9v27aKqQml/2UYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTGQd/P50vO2uv8yJoK90CmmYZ3D80zXhuQbGwfKZBQ=;
 b=fLiUowsOaoBslgoTJNGNfJRNO/H8Ce1pneI6sKjcLPxyFMdz/OQzungzmX+ufdV3KhCZfAMPETYCCIzf+r5lwW3ajcUucE19E2QUCq+4gZd/X/mSIkss2yBMwKuaD4rhSwG/49hbwu8fAzqTU1sXHYJUZPhS81L+bgEY7taTFELV9NctKjjx+uBITO9ySFkbDa8pZIneCfh1XsOsPmm8htvW0CfQAiHwBAglVx6Pq0MrludGE+7oVI28w8eCnyeSjIotTIpVJbf0JyRRjfujDQXyGWzoAtVrBoYG5aF7+WbXAhB3hgGQNu4RgOeoD/umuZOet2h+oeawuREdUnJ9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTGQd/P50vO2uv8yJoK90CmmYZ3D80zXhuQbGwfKZBQ=;
 b=5ABs9MtgT0BiQH7piAaXijpw+6AUONrMapZjjPdbaIjWXUtIFmyYy5GVOtE9AiiBevEN7aLd+udzopk6x+CCcYdiNpDC4pqkdtt+Bdbb6WFvJXl9bfzIWPwTFQqLthi410v7ap9ym/lbNkEXYo6oCcxnUijib09FtGpsAr2bkzY=
From: Wei Chen <Wei.Chen@arm.com>
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>
Subject: RE: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Topic: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Index: AQHYKR4hPwI7Daj3QEOqkq/IPeuzHKyktMKAgAPeNACAAMMegIAAeuAAgAABW5A=
Date: Tue, 1 Mar 2022 02:23:27 +0000
Message-ID:
 <PAXPR08MB742081C99F081F5D4E0A74779E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>
 <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
 <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
 <PA4PR08MB6253D51D60CC4078083D0AAC92029@PA4PR08MB6253.eurprd08.prod.outlook.com>
In-Reply-To:
 <PA4PR08MB6253D51D60CC4078083D0AAC92029@PA4PR08MB6253.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CF11C91518773143A1341BB17D76728D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1e427ce8-6566-417e-5405-08d9fb2a7d0c
x-ms-traffictypediagnostic:
	AS8PR08MB6792:EE_|AM5EUR03FT056:EE_|VE1PR08MB4943:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB494343BA7BC482A2A6B3B4899E029@VE1PR08MB4943.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 et7x8vCIWWOGCbpNbQxcCTCMGVDrFy01rtTMrmUSoZAZCYYybEb5EQJhGaOvyqNgsATN+2JMd1uiwyBhVtoFTW0jGFp81E6N6kzW1fwvlsW+XoLw9kIzCpADNsK2ZnN3Izuz4kZ0U/yS4i13ZJFZtrdXXPeWozZoptIIUHvt6I/Y24D+7cPDZYCnhzt2o+EN/4A62t3+CPhuxhQFd2thqJlecQKuVUD6J7XmT34prGgIr10nFbhuUl80oelub/pY1iMCKsHwqgniHTSxxzK+yk3PZ+uqMfwpcA1FUIbe3Qagb9r4IWSDQeX3UMG8YjphILbNs+KwlwVXjz3Mjl2Lzevxoq9zam3GS+R3aYqCIuI5rtGwf0Y7oOUc3ihV5dIKoGOIt80M7yD+GKAoLgyBHR45NjPuvcnsuQr4hEEO21F5p/y7jOiXdSzxeBi3yqomIqP89fU44+jTezibnpfiFkZimCi1mrL/xGRD+qGWrDk8Ei7IXD0itxUreWqYGCfbzNyxD2xdpr/xY2Bcy+c9/LGpVVX9U6lxp7C8n9pC5z0B+sCbu+sX1Ee9Aj+V36zmzUDutRbm2JTv0FslFlh95muCSUCo6gYxQvNUeQb18yqS0LvmIjSBCo0VqPTif9MwTbKyYvTW7xPC1LruzbyH4Ez3yaaBOq6+ZzMR1LPyryMGxg/3F47S/Bp+pr8tLtR3POQ60JHxSwptAcfZBb8L+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(52536014)(38100700002)(6506007)(53546011)(4326008)(9686003)(508600001)(83380400001)(55016003)(122000001)(54906003)(110136005)(7696005)(316002)(8936002)(86362001)(38070700005)(5660300002)(2906002)(33656002)(186003)(66476007)(66556008)(66946007)(64756008)(76116006)(66446008)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6792
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbe948fe-504e-4953-0b26-08d9fb2a7815
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nkSSU1XXcpLu26OnLYvL8ZhgXEDjnvxwjZxY4Hjno2pMeyQ0Nv1alkJOtPnoWytXiDOopjWzqngO7dTg+zteV4PXIGX1WgikqHEgiguz3GsecFrTyLf1r+4RHBZtu4+P2PGXxY6m5kW+cc3OtXpD5Cze8+rDdKqyP+V00Jinj1I8QkJFzbTFiCxR4yVl6QXA5BOuZ+Ej6gf71LkKtwU/0M9TJh5Naujrr6Y+WnTvAwcDFCDpWK0Q+F4adnfQ52/cwd+B9F30PZBn2GaLZiWii8W0xpnd+8OUhy7UNJipDkFSAavCrtouw2KngpWnxj6jFR5DZWNrlf/g3UB6VgYRUHHhzyNrXYNZkZako02tfT7DTJgMjDs+XhikBsg60HCW3nsfammDJIAHmtbGGSYMz6OHxJ+clqjI0HiWWKYOsRr5EpMXgdsvrZIWbjhth9aM/vaPcvJvEiLEW7+D8AzWI820ya33VYcAFe7bSJh4aUmfhsgwcj9wtTKPqO4xWelSWbmapR6SQQj8RmWPCsQK4kTqMuesjNnW2yiZd2Ma7KRmwqs6CHpXpR4JsCMAF1QFlRHSV7fGJ/4hp+Xt/99sK7Bo7rb8kjcrxMK52APLvUL3OFnhH08hXr8K5v6cjBgB4VXlErfcil8wO0M/2S+AgqvK7BY3mXl4kInrnzSqcDRbbFhRhhliheOc8Yyn4zRu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(86362001)(5660300002)(9686003)(81166007)(53546011)(55016003)(6506007)(336012)(4326008)(7696005)(26005)(8936002)(40460700003)(2906002)(83380400001)(8676002)(110136005)(47076005)(52536014)(54906003)(70586007)(70206006)(316002)(82310400004)(33656002)(186003)(508600001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 02:23:35.4012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e427ce8-6566-417e-5405-08d9fb2a7d0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4943

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhlbnJ5
IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gU2VudDogMjAyMuW5tDPmnIgx5pelIDEwOjEx
DQo+IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBN
YXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2VpLkNoZW5A
YXJtLmNvbT47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBS
RTogW1JGQyBQQVRDSCAwLzJdIEludHJvZHVjZSByZXNlcnZlZCBYZW5oZWFwDQo+IA0KPiBIaSBK
dWxpZW4sDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPiBPbiAyOC8wMi8yMDIyIDA3OjEyLCBIZW5y
eSBXYW5nIHdyb3RlOg0KPiA+ID4gSGkgSnVsaWVuLA0KPiA+DQo+ID4gSGkgSGVucnksDQo+ID4N
Cj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gPj4gSGkgSGVucnksDQo+ID4gPj4NCj4gPiA+PiBP
biAyNC8wMi8yMDIyIDAxOjMwLCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+ID4+PiBUaGUgcmVzZXJ2
ZWQgWGVuaGVhcCwgb3Igc3RhdGljYWxseSBjb25maWd1cmVkIFhlbmhlYXAsIHJlZmVycyB0bw0K
PiBwYXJ0cw0KPiA+ID4+PiBvZiBSQU0gcmVzZXJ2ZWQgaW4gdGhlIGJlZ2lubmluZyBmb3IgWGVu
aGVhcC4gTGlrZSB0aGUgc3RhdGljIG1lbW9yeQ0KPiA+ID4+PiBhbGxvY2F0aW9uLCBzdWNoIHJl
c2VydmVkIFhlbmhlYXAgcmVnaW9ucyBhcmUgcmVzZXJ2ZWQgYnkNCj4gY29uZmlndXJhdGlvbg0K
PiA+ID4+PiBpbiB0aGUgZGV2aWNlIHRyZWUgdXNpbmcgcGh5c2ljYWwgYWRkcmVzcyByYW5nZXMu
DQo+ID4gPj4NCj4gPiA+PiBJbiBYZW4sIHdlIGhhdmUgdGhlIGNvbmNlcHQgb2YgZG9taGVhcCBh
bmQgeGVuaGVhcC4gRm9yIEFybTY0IGFuZA0KPiA+IHg4Ng0KPiA+ID4+IHRoZXkgd291bGQgYmUg
dGhlIHNhbWUuIEJ1dCBmb3IgQXJtMzIsIHRoZXkgd291bGQgYmUgZGlmZmVyZW50Og0KPiB4ZW5o
ZWFwDQo+ID4gPj4gaXMgYWx3YXlzIG1hcHBlZCB3aGVyZWFzIGRvbWhlYXAgaXMgc2VwYXJhdGUu
DQo+ID4gPj4NCj4gPiA+PiBTa2ltbWluZyB0aHJvdWdoIHRoZSBzZXJpZXMsIEkgdGhpbmsgeW91
IHdhbnQgdG8gdXNlIHRoZSByZWdpb24gZm9yDQo+IGJvdGgNCj4gPiA+PiBkb21oZWFwIGFuZCB4
ZW5oZWFwLiBJcyB0aGF0IGNvcnJlY3Q/DQo+ID4gPg0KPiA+ID4gWWVzIEkgdGhpbmsgdGhhdCB3
b3VsZCBiZSBjb3JyZWN0LCBmb3IgQXJtMzIsIGluc3RlYWQgb2YgdXNpbmcgdGhlDQo+IGZ1bGwN
Cj4gPiA+IGByYW1fcGFnZXNgIGFzIHRoZSBpbml0aWFsIHZhbHVlIG9mIGBoZWFwX3BhZ2VzYCwg
d2Ugd2FudCB0byB1c2UgdGhlDQo+ID4gPiByZWdpb24gc3BlY2lmaWVkIGluIHRoZSBkZXZpY2Ug
dHJlZS4gQnV0IHdlIGFyZSBjb25mdXNlZCBpZiB0aGlzIGlzDQo+IHRoZQ0KPiA+ID4gY29ycmVj
dCAob3IgcHJlZmVycmVkKSB3YXkgZm9yIEFybTMyLCBzbyBpbiB0aGlzIHNlcmllcyB3ZSBvbmx5
DQo+ID4gPiBpbXBsZW1lbnRlZCB0aGUgcmVzZXJ2ZWQgaGVhcCBmb3IgQXJtNjQuDQo+ID4NCj4g
PiBUaGF0J3MgYW4gaW50ZXJlc3RpbmcgcG9pbnQuIFdoZW4gSSBza2ltbWVkIHRocm91Z2ggdGhl
IHNlcmllcyBvbg0KPiA+IEZyaWRheSwgbXkgZmlyc3QgdGhvdWdodCB3YXMgdGhhdCBmb3IgYXJt
MzIgaXQgd291bGQgYmUgb25seSB4ZW5oZWFwIChzbw0KPiA+IGFsbCB0aGUgcmVzdCBvZiBtZW1v
cnkgaXMgZG9taGVhcCkuDQo+ID4NCj4gPiBIb3dldmVyLCBYZW4gY2FuIGFsbG9jYXRlIG1lbW9y
eSBmcm9tIGRvbWhlYXAgZm9yIGl0cyBvd24gcHVycG9zZSAoZS5nLg0KPiA+IHdlIGRvbid0IG5l
ZWQgY29udGlndW91cyBtZW1vcnksIG9yIGZvciBwYWdlLXRhYmxlcykuDQo+ID4NCj4gPiBJbiBh
IGZ1bGx5IHN0YXRpYyBlbnZpcm9ubWVudCwgdGhlIGRvbWhlYXAgYW5kIHhlbmhlYXAgYXJlIGJv
dGggZ29pbmcgdG8NCj4gPiBiZSBxdWl0ZSBzbWFsbC4gSXQgd291bGQgYWxzbyBiZSBzb21ld2hh
dCBkaWZmaWN1bHQgZm9yIGEgdXNlciB0byBzaXplDQo+ID4gaXQuIFNvIEkgdGhpbmssIGl0IHdv
dWxkIGJlIGVhc2llciB0byB1c2UgdGhlIHJlZ2lvbiB5b3UgaW50cm9kdWNlIGZvcg0KPiA+IGJv
dGggZG9taGVhcCBhbmQgeGVuaGVhcC4NCj4gPg0KPiA+IFN0ZWZhbm8sIEJlcnRyYW5kLCBhbnkg
b3Bpb25pb25zPw0KPiA+DQo+ID4gT24gYSBzZXBhcmF0ZSB0b3BpYywgSSB0aGluayB3ZSBuZWVk
IHNvbWUgZG9jdW1lbnRhdGlvbiBleHBsYWluaW5nIGhvdyBhDQo+ID4gdXNlciBjYW4gc2l6ZSB0
aGUgeGVuaGVhcC4gSG93IGRpZCB5b3UgZmlndXJlIG91dCBmb3IgeW91ciBzZXR1cD8NCj4gDQo+
IE5vdCBzdXJlIGlmIEkgZnVsbHkgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24uIEkgd2lsbCBleHBs
YWluIGluIHR3byBwYXJ0czoNCj4gSSB0ZXN0ZWQNCj4gdGhpcyBzZXJpZXMgb24gYSBkb20wbGVz
cyAoc3RhdGljIG1lbSkgc3lzdGVtIG9uIEZWUF9CYXNlLg0KPiAoMSkgRm9yIGNvbmZpZ3VyaW5n
IHRoZSBzeXN0ZW0sIEkgZm9sbG93ZWQgdGhlIGRvY3VtZW50YXRpb24gSSBhZGRlZCBpbg0KPiB0
aGUNCj4gZmlyc3QgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgKGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRy
ZWUvYm9vdGluZy50eHQpLiBUaGUNCj4gaWRlYSBpcw0KPiBhZGRpbmcgc29tZSBzdGF0aWMgbWVt
IHJlZ2lvbnMgdW5kZXIgdGhlIGNob3NlbiBub2RlLg0KPiANCj4gICAgICBjaG9zZW4gew0KPiAr
ICAgICAgICAjeGVuLHN0YXRpYy1tZW0tYWRkcmVzcy1jZWxscyA9IDwweDI+Ow0KPiArICAgICAg
ICAjeGVuLHN0YXRpYy1tZW0tc2l6ZS1jZWxscyA9IDwweDI+Ow0KPiArICAgICAgICB4ZW4sc3Rh
dGljLW1lbSA9IDwweDggMHg4MDAwMDAwMCAweDAgMHgwMDEwMDAwMCAweDggMHg5MDAwMDAwMA0K
PiAweDAgMHgwODAwMDAwMD47DQo+ICAgICAgWy4uLl0NCj4gICAgICB9DQo+IA0KPiAoMikgRm9y
IHZlcmlmeWluZyB0aGlzIHNlcmllcywgd2hhdCBJIGRpZCB3YXMgYmFzaWNhbGx5IHBsYXlpbmcg
d2l0aCB0aGUNCj4gcmVnaW9uIHNpemUNCj4gYW5kIG51bWJlciBvZiB0aGUgcmVnaW9ucywgYWRk
aW5nIHByaW50a3MgYW5kIGFsc28gc2VlIGlmIHRoZSBndWVzdHMgY2FuDQo+IGJvb3QNCj4gYXMg
ZXhwZWN0ZWQgd2hlbiBJIGNoYW5nZSB0aGUgeGVuaGVhcCBzaXplLg0KPiANCj4gPg0KPiA+ID4+
DQo+ID4gPj4gRnVydGhlbW9yZSwgbm93IHRoYXQgd2UgYXJlIGludHJvZHVjaW5nIG1vcmUgc3Rh
dGljIHJlZ2lvbiwgaXQgd2lsbA0KPiBnZXQNCj4gPiA+PiBlYXNpZXIgdG8gb3ZlcmxhcCB0aGUg
cmVnaW9ucyBieSBtaXN0YWtlcy4gSSB0aGluayB3ZSB3YW50IHRvIGhhdmUNCj4gc29tZQ0KPiA+
ID4+IGxvZ2ljIGluIFhlbiAob3Igb3V0c2lkZSkgdG8gZW5zdXJlIHRoYXQgbm9uZSBvZiB0aGVt
IG92ZXJsYXBzLiBEbw0KPiB5b3UNCj4gPiA+PiBoYXZlIGFueSBwbGFuIGZvciB0aGF0Pw0KPiA+
ID4NCj4gPiA+IFRvdGFsbHkgYWdyZWUgd2l0aCB0aGlzIGlkZWEsIGJ1dCBiZWZvcmUgd2UgYWN0
dWFsbHkgaW1wbGVtZW50IHRoZQ0KPiBjb2RlLA0KPiA+ID4gd2Ugd291bGQgbGlrZSB0byBmaXJz
dGx5IHNoYXJlIG91ciB0aG91Z2h0cyBvbiB0aGlzOiBPbmUgb3B0aW9uIGNvdWxkDQo+IGJlIHRv
DQo+ID4gPiBhZGQgZGF0YSBzdHJ1Y3R1cmVzIHRvIG5vdGVzIGRvd24gdGhlc2Ugc3RhdGljIG1l
bW9yeSByZWdpb25zIHdoZW4gdGhlDQo+ID4gPiBkZXZpY2UgdHJlZSBpcyBwYXJzZWQsIGFuZCB0
aGVuIHdlIGNhbiBjaGVjayBpZiB0aGV5IGFyZSBvdmVybGFwcGVkLg0KPiA+DQo+ID4gVGhpcyBz
aG91bGQgd29yay4NCj4gDQo+IEFjay4NCj4gDQo+ID4NCj4gPiA+IE92ZXINCj4gPiA+IHRoZSBs
b25nIHRlcm0gKGFuZCB0aGlzIGxvbmcgdGVybSBvcHRpb24gaXMgY3VycmVudGx5IG5vdCBpbiBv
dXIgcGxhbiksDQo+ID4gPiBtYXliZSB3ZSBjYW4gYWRkIHNvbWV0aGluZyBpbiB0aGUgWGVuIHRv
b2xzdGFjayBmb3IgdGhpcyB1c2FnZT8NCj4gPg0KPiA+IFdoZW4gSSByZWFkICJYZW4gdG9vbHN0
YWNrIiwgSSByZWFkIHRoZSB0b29scyB0aGF0IHdpbGwgcnVuIGluIGRvbTAuIElzDQo+ID4gaXQg
d2hhdCB5b3UgbWVhbnQ/DQo+IA0KPiBOb25vbm8sIHNvcnJ5IGZvciB0aGUgbWlzbGVhZGluZy4g
SSBtZWFuIGEgYnVpbGQgdGltZSB0b29sIHRoYXQgY2FuIHJ1bg0KPiBvbiBob3N0IChidWlsZCBt
YWNoaW5lKSB0byBnZW5lcmF0ZS9jb25maWd1cmUgdGhlIFhlbiBEVFMgZm9yIHN0YXRpYw0KPiBh
bGxvY2F0ZWQgbWVtb3J5LiBCdXQgbWF5YmUgdGhpcyB0b29sIGNhbiBiZSBwbGFjZWQgaW4gWGVu
IHRvb2wgb3IgaXQgY2FuDQo+IGJlIGEgc2VwYXJhdGUgdG9vbCB0aGF0IG91dCBvZiBYZW4ncyBz
Y29wZS4NCj4gDQo+IEFueXdheSwgdGhpcyBpcyBqdXN0IGFuIGlkZWEgYXMgd2UgZmluZCBpdCBp
cyBub3QgZWFzeSBmb3IgdXNlcnMgdG8NCj4gY29uZmlndXJlDQo+IHNvIG1hbnkgc3RhdGljIGl0
ZW1zIG1hbnVhbGx5Lg0KDQpOb3Qgb25seSBmb3IgdGhpcyBvbmUuIEFzIHY4UjY0IHN1cHBvcnQg
Y29kZSBhbHNvIGluY2x1ZGVzIGxvdHMgb2Ygc3RhdGljDQphbGxvY2F0ZWQgaXRlbXMsIGl0IHdp
bGwgYWxzbyBlbmNvdW50ZXIgdGhpcyB1c2VyIGNvbmZpZ3VyYXRpb24gaXNzdWUuDQpTbyB0aGlz
IHdvdWxkIGJlIGEgbG9uZyB0ZXJtIGNvbnNpZGVyYXRpb24uIFdlIGNhbiBkaXNjdXNzIHRoaXMg
dG9waWMNCmFmdGVyIFhlbiBWOFI2NCBzdXBwb3J0IGNvZGUgdXBzdHJlYW0gd29yayBiZSBkb25l
Lg0KDQpBbmQgdGhpcyB0b29sIGRvZXMgbm90IG5lY2Vzc2FyaWx5IG5lZWQgdG8gYmUgcHJvdmlk
ZWQgYnkgdGhlIGNvbW11bml0eS4NClZlbmRvcnMgdGhhdCB3YW50IHRvIHVzZSBYZW4gYWxzbyBj
YW4gZG8gaXQuIElNTywgaXQgd291bGQgYmUgYmV0dGVyIGlmDQpjb21tdW5pdHkgY291bGQgcHJv
dmlkZSBpdC4gQW55d2F5IGxldCdzIGRlZmVyIHRoaXMgdG9waWMgOiApIA0KDQpUaGFua3MsDQpX
ZWkgQ2hlbg0KDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4gQWxzbywgSSBhbSB3b25kZXJpbmcgaWYg
dGhlIG92ZXJsYXBwaW5nIGNoZWNrIGxvZ2ljIHNob3VsZCBiZQ0KPiBpbnRyb2R1Y2VkDQo+ID4g
PiBpbiB0aGlzIHNlcmllcy4gV0RZVD8NCj4gPg0KPiA+IEkgd291bGQgZG8gdGhhdCBpbiBhIHNl
cGFyYXRlIHNlcmllcy4NCj4gDQo+IEFjay4NCj4gDQo+IEtpbmQgcmVnYXJkcywNCj4gDQo+IEhl
bnJ5DQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gLS0NCj4gPiBKdWxpZW4gR3JhbGwN
Cg0K

