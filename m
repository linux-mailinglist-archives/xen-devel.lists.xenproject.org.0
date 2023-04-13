Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E36E101A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 16:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520821.808849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmy3W-00053y-JM; Thu, 13 Apr 2023 14:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520821.808849; Thu, 13 Apr 2023 14:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmy3W-00050c-GN; Thu, 13 Apr 2023 14:36:10 +0000
Received: by outflank-mailman (input) for mailman id 520821;
 Thu, 13 Apr 2023 14:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HU9H=AE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pmy3V-00050R-5D
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 14:36:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839e0870-da08-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 16:36:02 +0200 (CEST)
Received: from AS9PR0301CA0012.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::25) by VE1PR08MB5743.eurprd08.prod.outlook.com
 (2603:10a6:800:1b2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 14:35:57 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::a) by AS9PR0301CA0012.outlook.office365.com
 (2603:10a6:20b:468::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 14:35:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 14:35:57 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 13 Apr 2023 14:35:57 +0000
Received: from 9618f815e1ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84741A9D-6DB9-48FF-9220-4C008AABF99B.1; 
 Thu, 13 Apr 2023 14:35:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9618f815e1ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 14:35:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8237.eurprd08.prod.outlook.com (2603:10a6:150:5d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 14:35:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 14:35:45 +0000
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
X-Inumbo-ID: 839e0870-da08-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXArFAPv3OLfJYe5yu5owMpv8nCKDOluVtSJurcjWrs=;
 b=y3qhKWMnPspyoGW07gH6EpH1dn5b7QxSL0MQTXJy3S3GXuFYRsXfAbRUJ/tS/3wFqJVs2Sf/taRq25/h/97ipV7CACX9lHu9OV9diIYCPvLp66tb1YQufu4z8uW724B6snhO7gY0G5hm4ZGSKhJu7C5MQuRujtAKyv9Rf6G+t2A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4a1fb7c697ffd9b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNX86LFJq/Y116OYwhQ4i3eeZCPtd1ERpd12kq3u7VTytPexCK7mlfPabjTxFwCB3sO10EQT/FJKoGWQ9+xK7GDcMzh6KUiXZ6OXnV+kvdB3H0a5PP0C1+9YtswwqgDA3A1oDN0sZBj2Su9pnursseFm19Mvf5GAO4uFxbpy9TyMYQblEJOubcJHt51AGE/DyRUHPKO56YAC0OuuzSybds09YssTI8yXvytKBjpMLYhL65rjyOr8U6ZPL1Z8WHgcjxGHRDXjXrbYn/NW0lDj1LruWWX7uBG//BIa9Q1+maodmFtT4z4XXWVymk6DB5ny/dgtOrUMya3wDBauDaDHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXArFAPv3OLfJYe5yu5owMpv8nCKDOluVtSJurcjWrs=;
 b=IPgl0oMCmOrux1K8jv6or0ejTQ3v9mAs7o1aymsxttX487SEvHrzfM0Q4NzlQ24n8OTwsCc/b48S0hYvvM3HZVlsfc42usYfdZtRBlYnzCw1gQ6eCirca4iUIVN/MK6oykv+d0GXlszuA9NQ2XeWih4IyuddrqlceN3g/EaohU7wVz0X9zeNjHS8OIIly9IhjDx4v6MuV3ESafFS8A4yUYt0PebPBjOkxKILX74TyAysMzbkEItwRLAmO7Acj6Q4zd3K7rId2I/D4pnsLcYcQAhe+LreQLJ0teZsn5lenq9Uywa9kC/3R6ItyKJ5o65SmjKDVxhI9flR0XK7KxqLsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXArFAPv3OLfJYe5yu5owMpv8nCKDOluVtSJurcjWrs=;
 b=y3qhKWMnPspyoGW07gH6EpH1dn5b7QxSL0MQTXJy3S3GXuFYRsXfAbRUJ/tS/3wFqJVs2Sf/taRq25/h/97ipV7CACX9lHu9OV9diIYCPvLp66tb1YQufu4z8uW724B6snhO7gY0G5hm4ZGSKhJu7C5MQuRujtAKyv9Rf6G+t2A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZbSQ26+FC1T02dEGoq+zimN/6Ra8pOLQAgAAXa4A=
Date: Thu, 13 Apr 2023 14:35:44 +0000
Message-ID: <6DDCEF6B-F07B-44EA-83D0-33BED5EAC506@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <b1c77bdf-6979-83b6-f5e4-ac5b3e751a3d@xen.org>
In-Reply-To: <b1c77bdf-6979-83b6-f5e4-ac5b3e751a3d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8237:EE_|AM7EUR03FT016:EE_|VE1PR08MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bf5996-285a-43e7-dff4-08db3c2c6515
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fJyx/6sD+R+yHyMCsV1Hqojs0hfZyFtmoVLVyWnEOeytS9OdHCwPye1rbWvcj1b+JFEQldrdqcKmQlFXv+1wWxNhZXlcoyRCJ7w8byCdi6DBbQgByZO9OokHIDURkcvf4QOeDvrWnVzsG/XV+FXA4pCHiQRzEjNnKP5OYhNr4sp2FpO0jbcsEUeqsuQUmSfDuWiWpC/7Z1wyf2eluo6Im4ysLs54Xed3psKlc5kY1DcNmBQ2DZCPzdJq16NDsXLJX06OBATlxy9IQ5b0G8p/JnFHYS2Kpppv/zmAQH5EdIPUUGS7njXSxmx7e9rks1NsTK98wtr3wTeXZ6wWL0EZpTGXsdMbUrR/PVdx+Yj1RfPph4vUfUpmU96R/CeKCye0+EyZGV9gkF8gcKGZqCHlOyWo2dGUtOJJALyDEwEfvTCNXiklHmUt+GgnIN7tMifcrzlPIWDzxG15T3bb7/Lj/a2Itlu3a9M3LTyeJ7nCQM6kDzgG39F0LUgqCJK8iz0YLOXNK5y/yLw3TCl3j0wsSO52TT3QNzbYLPWZ1ZX4pnKBn2At57Uv4nXu4hYdu0+vi0l3lCZrIPWzQ8eWmFiPd28LstlqDJ3+mE7DvIzW1cV+NB03qRVwkt8i/F2KNlXtsbh7vUB4YDAoV5rdyMl6uQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(316002)(8676002)(66446008)(4326008)(66556008)(66476007)(66946007)(71200400001)(54906003)(64756008)(6916009)(478600001)(76116006)(41300700001)(91956017)(33656002)(36756003)(86362001)(2616005)(6512007)(6506007)(26005)(6486002)(53546011)(83380400001)(2906002)(5660300002)(8936002)(38070700005)(38100700002)(122000001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D531D9FBF1F8D246BEF791C4ECBF3269@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8237
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9dc1d2e4-e8c7-4075-7d0b-08db3c2c5d4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wkVTt8HInfGx0dQQH5b6DlYJ9pPxtwD9wboMeCFLs5T9vSQeBFrz4iyGf5kh4pIt7jXgt5xrn7g0WWL35SDu1LZesZI88Zv84kmJMq/Tj7W4jx/kmqCrAndsoMCbo7INvbbiyQSOr9vQaGeX8nn1wFfpeB/Im0H7rdYxTCMfyzB/DX2HQZ2VGdvEc83pqAN5YZu0ttU6hCm/bPjqc46iMiXoaQxBzw0Ye4HLxj0OpWPOqki+NQkkebCc2D9UVPjLHzSNuK3LgrGGNw6QWJTK0dFx8SkwWQKX1vOYsI8b/w3S3eiLy9JR9lapb8mTya/lxNt2Agxil+/qdJxngkSf9vBA5f92SpQRoe97RrsAwIFgs2tvPsoGrt4sfFiPPGdX0rl0CTKlyUyl92Z3oe6dGKeVnEj29eAbODOnP7IGQrXeWlYBIIcPGOXDOZZFPNdISvuXlY5GkPXGU7m/gP/JpHTw/30NKZIRDOMnI0d8t19gqyz5vffgDqBeD8IldRyTikqH5F8nJo5RDkEfUfx35C/e7Dd/wHXMjtsAQmsls8HcMAi9UNT+ZWLGyrMmPkzazcIkw/aXGdK/o6ggSB+qDmMx5KFF/moL4AUI18OIh5qPA8jfOFZ9L+iZkzMkgZ2MC5anFATLJvPpWBo9sR9lcfJpni30Dg0SfBvUlGSuCXoIe3dRDiDt7WtB87ewZ9tReRbVg36IGIIipxch5g2kEg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39850400004)(451199021)(36840700001)(46966006)(40470700004)(2906002)(6862004)(8676002)(70586007)(70206006)(8936002)(5660300002)(478600001)(41300700001)(33656002)(40460700003)(316002)(40480700001)(83380400001)(82740400003)(336012)(36756003)(54906003)(4326008)(186003)(86362001)(6486002)(6506007)(26005)(81166007)(53546011)(6512007)(2616005)(36860700001)(82310400005)(356005)(107886003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 14:35:57.4435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bf5996-285a-43e7-dff4-08db3c2c6515
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5743

DQoNCj4gT24gMTMgQXByIDIwMjMsIGF0IDE0OjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTIvMDQvMjAyMyAxMDo0OSwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+IFNhdmUvcmVzdG9yZSBjb250ZXh0IHN3aXRjaCBmb3IgU1ZFLCBhbGxv
Y2F0ZSBtZW1vcnkgdG8gY29udGFpbg0KPj4gdGhlIFowLTMxIHJlZ2lzdGVycyB3aG9zZSBsZW5n
dGggaXMgbWF4aW11bSAyMDQ4IGJpdHMgZWFjaCBhbmQNCj4+IEZGUiB3aG8gY2FuIGJlIG1heGlt
dW0gMjU2IGJpdHMsIHRoZSBhbGxvY2F0ZWQgbWVtb3J5IGRlcGVuZHMgb24NCj4+IGhvdyBtYW55
IGJpdHMgaXMgdGhlIHZlY3RvciBsZW5ndGggZm9yIHRoZSBkb21haW4gYW5kIGhvdyBtYW55IGJp
dHMNCj4+IGFyZSBzdXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtLg0KPj4gU2F2ZSBQMC0xNSB3aG9z
ZSBsZW5ndGggaXMgbWF4aW11bSAyNTYgYml0cyBlYWNoLCBpbiB0aGlzIGNhc2UgdGhlDQo+PiBt
ZW1vcnkgdXNlZCBpcyBmcm9tIHRoZSBmcHJlZ3MgZmllbGQgaW4gc3RydWN0IHZmcF9zdGF0ZSwN
Cj4+IGJlY2F1c2UgVjAtMzEgYXJlIHBhcnQgb2YgWjAtMzEgYW5kIHRoaXMgc3BhY2Ugd291bGQg
aGF2ZSBiZWVuDQo+PiB1bnVzZWQgZm9yIFNWRSBkb21haW4gb3RoZXJ3aXNlLg0KPj4gQ3JlYXRl
IHpjcl9lbHsxLDJ9IGZpZWxkcyBpbiBhcmNoX3ZjcHUsIGluaXRpYWxpc2UgemNyX2VsMiBvbiB2
Y3B1DQo+PiBjcmVhdGlvbiBnaXZlbiB0aGUgcmVxdWVzdGVkIHZlY3RvciBsZW5ndGggYW5kIHJl
c3RvcmUgaXQgb24NCj4+IGNvbnRleHQgc3dpdGNoLCBzYXZlL3Jlc3RvcmUgWkNSX0VMMSB2YWx1
ZSBhcyB3ZWxsLg0KPj4gUmVtb3ZlIGhlYWRlcnMgZnJvbSBzdmUuYyB0aGF0IGFyZSBhbHJlYWR5
IGluY2x1ZGVkIHVzaW5nDQo+PiB4ZW4vc2NoZWQuaC4NCj4gSSBkaXNsaWtlIHRoaXMgYmVjYXVz
ZSAuLi4NCj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jIGIveGVu
L2FyY2gvYXJtL2FybTY0L3N2ZS5jDQo+PiBpbmRleCA3OGY3NDgyNjE5ZGEuLjU0ODU2NDg4NTBh
MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL2FybTY0L3N2ZS5jDQo+PiBAQCAtNSwxNCArNSwyOSBAQA0KPj4gICAqIENvcHly
aWdodCAoQykgMjAyMiBBUk0gTHRkLg0KPj4gICAqLw0KPj4gIC0jaW5jbHVkZSA8eGVuL3R5cGVz
Lmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+DQo+IA0KPiAuLi4gaXQgaXMgbm90
IGVudGlyZWx5IG9idmlvdXMgdGhhdCBzY2hlZC5oIHdpbGwgaW1wb3J0IGFzbS9jcHVmZWF0dXJl
cy5oLiBUaGlzIGNvdWxkIGVhc2lseSBjaGFuZ2UgaW4gdGhlIGZ1dHVyZSBhbmQgd291bGQgb25s
eSByZXF1aXJlIHVzIHRvIHJlLWFkZCB0aG9zZSBpbmNsdWRlcy4NCg0KT2sgSSB3aWxsIHJlaW50
cm9kdWNlICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPiwgZG8gSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSB0aGF0IGlzIHRoZSBvbmx5IGhlYWRlciB5b3Ugd291bGQgbGlrZSBtZSB0byByZXRhaW4/
DQoNCj4gDQo+PiArI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vc2l6
ZXMuaD4gPiAgICNpbmNsdWRlIDxhc20vYXJtNjQvc3ZlLmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9h
cm02NC9zeXNyZWdzLmg+DQo+PiAtI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4NCj4+IC0jaW5j
bHVkZSA8YXNtL3N5c3RlbS5oPg0KPj4gICAgZXh0ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3
X3ZsKHZvaWQpOw0KPj4gK2V4dGVybiB2b2lkIHN2ZV9zYXZlX2N0eCh1aW50NjRfdCAqc3ZlX2N0
eCwgdWludDY0X3QgKnByZWdzLCBpbnQgc2F2ZV9mZnIpOw0KPj4gK2V4dGVybiB2b2lkIHN2ZV9s
b2FkX2N0eCh1aW50NjRfdCBjb25zdCAqc3ZlX2N0eCwgdWludDY0X3QgY29uc3QgKnByZWdzLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmVzdG9yZV9mZnIpOw0KPj4gKw0KPj4g
K3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHN2ZV96cmVnX2N0eF9zaXplKHVuc2lnbmVkIGlu
dCB2bCkNCj4+ICt7DQo+PiArICAgIC8qDQo+PiArICAgICAqIFowLTMxIHJlZ2lzdGVycyBzaXpl
IGluIGJ5dGVzIGlzIGNvbXB1dGVkIGZyb20gVkwgdGhhdCBpcyBpbiBiaXRzLCBzbyBWTA0KPj4g
KyAgICAgKiBpbiBieXRlcyBpcyBWTC84Lg0KPj4gKyAgICAgKi8NCj4+ICsgICAgcmV0dXJuICh2
bCAvIDhVKSAqIDMyVTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBp
bnQgc3ZlX2ZmcnJlZ19jdHhfc2l6ZSh1bnNpZ25lZCBpbnQgdmwpDQo+PiArew0KPj4gKyAgICAv
KiBGRlIgcmVnaXN0ZXIgc2l6ZSBpcyBWTC84LCB3aGljaCBpcyBpbiBieXRlcyAoVkwvOCkvOCAq
Lw0KPj4gKyAgICByZXR1cm4gKHZsIC8gNjRVKTsNCj4+ICt9DQo+PiAgICByZWdpc3Rlcl90IGNv
bXB1dGVfbWF4X3pjcih2b2lkKQ0KPj4gIHsNCj4+IEBAIC02MCwzICs3NSw0NiBAQCB1bnNpZ25l
ZCBpbnQgZ2V0X3N5c192bF9sZW4odm9pZCkNCj4+ICAgICAgcmV0dXJuICgoc3lzdGVtX2NwdWlu
Zm8uemNyNjQuYml0c1swXSAmIFpDUl9FTHhfTEVOX01BU0spICsgMVUpICoNCj4+ICAgICAgICAg
ICAgICBTVkVfVkxfTVVMVElQTEVfVkFMOw0KPj4gIH0NCj4+ICsNCj4+ICtpbnQgc3ZlX2NvbnRl
eHRfaW5pdChzdHJ1Y3QgdmNwdSAqdikNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBzdmVf
dmxfYml0cyA9IHN2ZV9kZWNvZGVfdmwodi0+ZG9tYWluLT5hcmNoLnN2ZV92bCk7DQo+PiArICAg
IHVpbnQ2NF90ICpjdHggPSBfeHphbGxvYyhzdmVfenJlZ19jdHhfc2l6ZShzdmVfdmxfYml0cykg
Kw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3ZlX2ZmcnJlZ19jdHhfc2l6ZShz
dmVfdmxfYml0cyksDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBMMV9DQUNIRV9C
WVRFUyk7DQo+PiArDQo+PiArICAgIGlmICggIWN0eCApDQo+PiArICAgICAgICByZXR1cm4gLUVO
T01FTTsNCj4+ICsNCj4+ICsgICAgdi0+YXJjaC52ZnAuc3ZlX2NvbnRleHQgPSBjdHg7DQo+PiAr
DQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICt2b2lkIHN2ZV9jb250ZXh0X2Zy
ZWUoc3RydWN0IHZjcHUgKnYpDQo+PiArew0KPj4gKyAgICB4ZnJlZSh2LT5hcmNoLnZmcC5zdmVf
Y29udGV4dCk7DQo+PiArfQ0KPiANCj4gUGxlYXNlIHVzZSBYRlJFRSgpLg0KDQpTdXJlIEnigJls
bCBkbw0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

