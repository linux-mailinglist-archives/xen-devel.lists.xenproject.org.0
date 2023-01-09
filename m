Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD0661F75
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 08:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473345.733890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmva-00074O-MZ; Mon, 09 Jan 2023 07:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473345.733890; Mon, 09 Jan 2023 07:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmva-00071A-Iw; Mon, 09 Jan 2023 07:50:42 +0000
Received: by outflank-mailman (input) for mailman id 473345;
 Mon, 09 Jan 2023 07:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LgaK=5G=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pEmvY-00070q-Rl
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 07:50:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f417093-8ff2-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 08:50:39 +0100 (CET)
Received: from AS8PR04CA0032.eurprd04.prod.outlook.com (2603:10a6:20b:312::7)
 by AS8PR08MB5926.eurprd08.prod.outlook.com (2603:10a6:20b:29d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 07:50:27 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::7c) by AS8PR04CA0032.outlook.office365.com
 (2603:10a6:20b:312::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Mon, 9 Jan 2023 07:50:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 07:50:27 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Mon, 09 Jan 2023 07:50:26 +0000
Received: from 632d197bea05.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F94A596-AE24-47C1-B5F4-662D93B1B2E7.1; 
 Mon, 09 Jan 2023 07:50:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 632d197bea05.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Jan 2023 07:50:16 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DBBPR08MB6297.eurprd08.prod.outlook.com (2603:10a6:10:20b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 07:50:14 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 07:50:14 +0000
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
X-Inumbo-ID: 4f417093-8ff2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVK191TWGVu50zjP5zcg/o8vjQpCfDN8S9btledwHMg=;
 b=BiylJFlZ+NjNKj1x8vyNZ/29pzHx7mNpuvfoO/O8L3xlZuCHrLqwmBaNmbLmoxpPMCp91TfQOUHJT97Nv4bXbOZL/7fX1P/2AKoaMOPwuDXgyUZXym6iN4fnzBdiRPsYtbkAC7wFtwCQWbaJ7Z1hZJl7onvfnYRXH2vXuizhspM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du20DoeOPqi3kaT8UzsB5UDfZShHAz45elGu1XQAsZ6Kzpglsz5Nik+R+Bjet5S0VwDl2g4bI5wkm7c5sa0fD3AqdYpY/Wm2VMLaXpP2hjOS/Jy+b0Dasvo8/3E3BjZlnVGxat3tlZvxDwVlVO0St2yxWIeNWC4pDNvwwYGGsNCnFjWKZOBDkk67NozqFdNX/VQMpofQY5r7QqKEhRAog9HBN41pznbrCJyDj3wYiL/zpRS2mKno9iRZIz23LFA5ntZlAp9w4iplRhu6xDEQGWEgYSJ62Q9u3Da/rQPjg3+cn7mXQn/z25stEVgVRNjvh+BS8E64oTwIVQa4AgJxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVK191TWGVu50zjP5zcg/o8vjQpCfDN8S9btledwHMg=;
 b=Wn7LtknKvssJbJq8ZQbTYoEN12GqDEU+KHVyQQaJQcrExW9sJp77wo49fvRR6AOKqLG1Q7jP5xUuwGg4Za5o6sRXDoJrQpd8ziAqd6ahStzDmyPPxS0Z1ymb/Ii6Yh5r/wdCQtaJ1YIFYoSUBoBiXrQEBiDWQH1KQwW1q2y5rfDLQYe8hZZayNOlvbI4J1vonyGz5GHYCCVuiw+e2CdnWAnyPNkh4MLlpIBRmXMQCi77P5nMw6uYx1GieVpJIToVFoVAu0vFhsxqbctncb2SpYGSTJx8Vq1heTArSpf++n8SqHP4hnM4iMVZD2NDN62eIersm8SG1VDSFGuipmzYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVK191TWGVu50zjP5zcg/o8vjQpCfDN8S9btledwHMg=;
 b=BiylJFlZ+NjNKj1x8vyNZ/29pzHx7mNpuvfoO/O8L3xlZuCHrLqwmBaNmbLmoxpPMCp91TfQOUHJT97Nv4bXbOZL/7fX1P/2AKoaMOPwuDXgyUZXym6iN4fnzBdiRPsYtbkAC7wFtwCQWbaJ7Z1hZJl7onvfnYRXH2vXuizhspM=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 05/13] xen/arm: allocate shared memory from heap when
 host address not provided
Thread-Topic: [PATCH v1 05/13] xen/arm: allocate shared memory from heap when
 host address not provided
Thread-Index: AQHY+J1p2kGDrijhokmn3Ycm+ECYcK6UxoyAgAE5/KA=
Date: Mon, 9 Jan 2023 07:50:13 +0000
Message-ID:
 <AM0PR08MB4530EC5FBFD2625E521AC067F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-6-Penny.Zheng@arm.com>
 <ff0870ab-d1b1-e029-26aa-c690063d348b@xen.org>
In-Reply-To: <ff0870ab-d1b1-e029-26aa-c690063d348b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3B605AC35546304E89DBEC85BA01DC7D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DBBPR08MB6297:EE_|AM7EUR03FT022:EE_|AS8PR08MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc0a4c0-92e4-4b1c-33ad-08daf2162c52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FRs+PTnF8EBW0OjHJ0bE6z+6fHSZ85EimSgMRSRX5gj6UNmL0mcUct9AAmoM9zqHcm11FsR6+nPsFlEb5ZaWXnbYHWPgmkzS/oBBHkXxxpFsQ9R9Btd6yPJOZG0hdxSPGa3NUULp2sW5BP+9Ms1u3rLjUHc0RAdBU+iyj0B4eZoeqySnRE1eei45ohqU4yq0KbJUsJde/m3U+sMBWHPkKKzbLkPVnnj/+SBQdM0L6Rk4XiHfWXHTGIgoFk3oxF9+FVaDqBFU8ebkst3t9II4cCOsve3aau+XDSkL83GN9cVNDjklYN0U2Hk2u1V7XscaT1ZGI7FldPFI41wDLgZRDDIgYf7H+o9VycqHLveB8SNKuy4vmnnPu4pJMURQbLG1u23ZhGdiT4Q9YB5FDAb/uUz076I2eQClCVNJc5zG69k3iCKV6dBxGmTkjq00HjJ16TLcFU0AHdbVvuZcHyPlk1cjSEd2O3G+I/e6NZXaMIy16OCKbClwV/vrUtjqLg/Ms+eK7YKMnlO15ogm7SiQfRsHT7Ja6bQYurPOmfKe01qAv4UtyIr935/f1iyv0QGZJfMvcLyrL1QBEPi76B5a58Seoa575no6gFtXfo3Ev/jjsPyG0wzmJEBYPmHOLE3JUeUVoLvVnFvR9yA0/1Lmke1brq7Pg0GOf6yUEeGg9U9Mb7slcCnW2AviUC9bOa6foJXdlWGfyLM61+QiA9vgxg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(33656002)(52536014)(41300700001)(83380400001)(64756008)(4326008)(76116006)(66946007)(66476007)(8676002)(38100700002)(66556008)(5660300002)(8936002)(66446008)(54906003)(110136005)(55016003)(9686003)(186003)(26005)(122000001)(7696005)(478600001)(38070700005)(53546011)(71200400001)(6506007)(86362001)(316002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3fe3cac-3ef9-4e33-30c2-08daf216245e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KOFN0Qw2vGg7DUQBBjJurtTgPq5lUpo0qleKV/4MU+2UG+hHVvqNDWG5Q8U2SCNZ4qyeFaiMxMVJ6bDucctzFRn74MmSQp3mC2H8+YAShgz2e8GMr0OazNJ+oyOl44dX0tAcCFVHOPc2YUkOL+AtkDi1aBbLAcQ0EAITcDWjn2hriTaj/Jx1PKYMvyta31q+KmYHfddHugdHKQO5HXZ6f5CSNHbDcEdftAKsE8TF1pTIvhV/9NSiQIUxyRYpGLVo2h1F3Cux4/6vAPQWxqo+Vr0lBh8QfIejHxgXjrCADpHmL12iGjc49vn8EMBGb718HEUOSqd0vX71caJucB7PpKOrTRYXWa00kTjIaOFf/uJeI3rPh+N1rXX0v2LdIXQgnBsqKL2AtiXmGiwI56P3UBy29E23pshGQLSbNqgtlVlU5euRec5JhSxNBm2PHV9BQMy8jzqTJGGJuI/M0GNXtyK6TYKhq/v5m1Myr5GJydArEg4UI+zX08Cg6e6d/0Ct1Yc/9/LsMuh3dQSwHAqkLkUld2mC/b9IUdIDDuNjLBkNOw8fEOSmQhxLbk1jLz/AfRvdeYQge5y1cZ2ekRJLYfFVcajZHMeb+TT6OL+RhAYQGNQoomp7mvOSkMz/60LVfPscU6xbVFlGOLvXXOCm5ahtUQxYOCtMIpLU5F0DYNFfcSXltk2DMkcdlTg9rzo/X8b+8pxCedHI4K7yffZBMg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(33656002)(7696005)(2906002)(54906003)(110136005)(8676002)(70206006)(4326008)(316002)(70586007)(83380400001)(81166007)(82740400003)(47076005)(356005)(36860700001)(82310400005)(40460700003)(478600001)(9686003)(26005)(186003)(86362001)(40480700001)(55016003)(107886003)(6506007)(336012)(53546011)(8936002)(52536014)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 07:50:27.2508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc0a4c0-92e4-4b1c-33ad-08daf2162c52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5926

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBTdW5kYXksIEphbnVhcnkgOCwgMjAyMyA4OjIzIFBNDQo+IFRv
OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0
YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDUvMTNdIHhlbi9h
cm06IGFsbG9jYXRlIHNoYXJlZCBtZW1vcnkgZnJvbSBoZWFwDQo+IHdoZW4gaG9zdCBhZGRyZXNz
IG5vdCBwcm92aWRlZA0KPiANCj4gSGkgUGVubnksDQo+IA0KDQpIaSBKdWxpZW4sDQoNCj4gT24g
MTUvMTEvMjAyMiAwMjo1MiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gd2hlbiBob3N0IGFkZHJl
c3MgaXMgbm90IHByb3ZpZGVkIGluICJ4ZW4sc2hhcmVkLW1lbSIsIHdlIGxldCBYZW4NCj4gPiBh
bGxvY2F0ZSByZXF1ZXN0ZWQgc2hhcmVkIG1lbW9yeSBmcm9tIGhlYXAsIGFuZCBvbmNlIHRoZSBz
aGFyZWQNCj4gbWVtb3J5DQo+ID4gaXMgYWxsb2NhdGVkLCBpdCB3aWxsIGJlIG1hcmtlZCBhcyBz
dGF0aWMoUEdDX3N0YXRpYyksIHdoaWNoIG1lYW5zDQo+ID4gdGhhdCBpdCB3aWxsIGJlIHJlc2Vy
dmVkIGFzIHN0YXRpYyBtZW1vcnksIGFuZCB3aWxsIG5vdCBnbyBiYWNrIHRvIGhlYXAgZXZlbg0K
PiBvbiBmcmVlaW5nLg0KPiANCj4gUGxlYXNlIGRvbid0IG1vdmUgcGFnZXMgZnJvbSB0aGUge3hl
bixkb219aGVhcCB0byB0aGUgc3RhdGljIGhlYXAuIElmIHlvdQ0KPiBuZWVkIHRvIGtlZXAgdGhl
IHBhZ2VzIGZvciBsb25nZXIsIHRoZW4gZ2V0IGFuIGV4dHJhIHJlZmVyZW5jZSBzbyB0aGV5IHdp
bGwNCj4gbm90IGJlIHJlbGVhc2VkLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55
IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIHwgODMNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhbGxvY2F0ZV9zaGFyZWRfbWVtb3J5KHN0
cnVjdCBzaG1fbWVtYmFuaw0KPiAqc2htX21lbWJhbmssDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBwc2l6ZSkgew0KPiA+ICsgICAgc3RydWN0
IG1lbWluZm8gKmJhbmtzOw0KPiA+ICsgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICBCVUdf
T04oc2htX21lbWJhbmstPm1lbS5iYW5rcy5tZW1pbmZvICE9IE5VTEwpOw0KPiA+ICsNCj4gPiAr
ICAgIGJhbmtzID0geG1hbGxvY19ieXRlcyhzaXplb2Yoc3RydWN0IG1lbWluZm8pKTsNCj4gDQo+
IFdoZXJlIGlzIHRoaXMgZnJlZWQ/DQo+IA0KDQpUaGVzZSBraW5kcyBvZiBpbmZvIHdpbGwgYmUg
b25seSB1c2VkIGluIGJvb3QtdGltZSwgc28gbWF5YmUgSSBzaGFsbCANCmZyZWUgdGhlbSBpbiBp
bml0X2RvbmUoKT8NCk9yIGp1c3QgYWZ0ZXIgcHJvY2Vzc19zaG0oKSA/DQoNCj4gPiArICAgIGlm
ICggYmFua3MgPT0gTlVMTCApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKyAg
ICBzaG1fbWVtYmFuay0+bWVtLmJhbmtzLm1lbWluZm8gPSBiYW5rczsNCj4gPiArICAgIG1lbXNl
dChzaG1fbWVtYmFuay0+bWVtLmJhbmtzLm1lbWluZm8sIDAsIHNpemVvZihzdHJ1Y3QNCj4gPiAr
IG1lbWluZm8pKTsNCj4gPiArDQo+ID4gKyAgICBpZiAoICFhbGxvY2F0ZV9kb21oZWFwX21lbW9y
eShOVUxMLCBwc2l6ZSwgc2htX21lbWJhbmstDQo+ID5tZW0uYmFua3MubWVtaW5mbykgKQ0KPiA+
ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgIHJldCA9IG1hcmtfc2hh
cmVkX21lbW9yeV9zdGF0aWMoc2htX21lbWJhbmspOw0KPiA+ICsgICAgaWYgKCByZXQgKQ0KPiA+
ICsgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiArDQo+ID4gICBzdGF0aWMgbWZuX3QgX19pbml0IGFjcXVpcmVfc2hhcmVkX21lbW9yeV9i
YW5rKHN0cnVjdCBkb21haW4gKmQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgcGJhc2UsIHBhZGRyX3QgcHNpemUpDQo+ID4gICB7
DQo+ID4gQEAgLTk3NSw3ICsxMDQxLDcgQEAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19zaG0o
c3RydWN0IGRvbWFpbiAqZCwNCj4gc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4gPiAgICAg
ICAgICAgdW5zaWduZWQgaW50IGk7DQo+ID4gICAgICAgICAgIGNvbnN0IGNoYXIgKnJvbGVfc3Ry
Ow0KPiA+ICAgICAgICAgICBjb25zdCBjaGFyICpzaG1faWQ7DQo+ID4gLSAgICAgICAgYm9vbCBv
d25lcl9kb21faW8gPSB0cnVlOw0KPiA+ICsgICAgICAgIGJvb2wgb3duZXJfZG9tX2lvID0gdHJ1
ZSwgcGFkZHJfYXNzaWduZWQgPSB0cnVlOw0KPiA+ICAgICAgICAgICBzdHJ1Y3Qgc2htX21lbWJh
bmsgKnNobV9tZW1iYW5rOw0KPiA+DQo+ID4gICAgICAgICAgIGlmICggIWR0X2RldmljZV9pc19j
b21wYXRpYmxlKHNobV9ub2RlLA0KPiA+ICJ4ZW4sZG9tYWluLXNoYXJlZC1tZW1vcnktdjEiKSAp
IEBAIC0xMDM1LDYgKzExMDEsMjEgQEAgc3RhdGljIGludA0KPiBfX2luaXQgcHJvY2Vzc19zaG0o
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PRU5UOw0KPiA+ICAgICAgICAgICB9DQo+ID4NCj4gPiArICAgICAg
ICAvKg0KPiA+ICsgICAgICAgICAqIFdoZW4gaG9zdCBhZGRyZXNzIGlzIG5vdCBwcm92aWRlZCBp
biAieGVuLHNoYXJlZC1tZW0iLA0KPiA+ICsgICAgICAgICAqIHdlIGxldCBYZW4gYWxsb2NhdGUg
cmVxdWVzdGVkIG1lbW9yeSBmcm9tIGhlYXAgYXQgZmlyc3QgZG9tYWluLg0KPiA+ICsgICAgICAg
ICAqLw0KPiA+ICsgICAgICAgIGlmICggIXBhZGRyX2Fzc2lnbmVkICYmICFzaG1fbWVtYmFuay0+
bWVtLmJhbmtzLm1lbWluZm8gKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcmV0
ID0gYWxsb2NhdGVfc2hhcmVkX21lbW9yeShzaG1fbWVtYmFuaywgcHNpemUpOw0KPiA+ICsgICAg
ICAgICAgICBpZiAoIHJldCApDQo+ID4gKyAgICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAg
ICAgIHByaW50aygiJXBkOiBmYWlsZWQgdG8gYWxsb2NhdGUgc2hhcmVkIG1lbW9yeQ0KPiBiYW5r
KCUiUFJJcGFkZHIiTUIpIGZyb20gaGVhcDogJWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZCwgcHNpemUgPj4gMjAsIHJldCk7DQo+ID4gKyAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+ICsgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiAgICAg
ICAgICAgLyoNCj4gPiAgICAgICAgICAgICogRE9NSURfSU8gaXMgYSBmYWtlIGRvbWFpbiBhbmQg
aXMgbm90IGRlc2NyaWJlZCBpbiB0aGUgRGV2aWNlLVRyZWUuDQo+ID4gICAgICAgICAgICAqIFRo
ZXJlZm9yZSB3aGVuIHRoZSBvd25lciBvZiB0aGUgc2hhcmVkIHJlZ2lvbiBpcw0KPiA+IERPTUlE
X0lPLCB3ZSB3aWxsDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0K
Q2hlZXJzLA0KDQotLQ0KUGVubnkgWmhlbmcNCg==

