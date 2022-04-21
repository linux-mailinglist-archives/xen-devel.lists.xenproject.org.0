Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF2509819
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 09:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309800.526270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQoH-0007Q3-CB; Thu, 21 Apr 2022 07:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309800.526270; Thu, 21 Apr 2022 07:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhQoH-0007NF-8P; Thu, 21 Apr 2022 07:01:01 +0000
Received: by outflank-mailman (input) for mailman id 309800;
 Thu, 21 Apr 2022 07:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dwl+=U7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nhQoF-0007N9-7M
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 07:00:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf2ac45-c140-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 09:00:57 +0200 (CEST)
Received: from DB6PR0202CA0001.eurprd02.prod.outlook.com (2603:10a6:4:29::11)
 by VI1PR08MB4333.eurprd08.prod.outlook.com (2603:10a6:803:101::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 07:00:53 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::bc) by DB6PR0202CA0001.outlook.office365.com
 (2603:10a6:4:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 07:00:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 07:00:53 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Thu, 21 Apr 2022 07:00:53 +0000
Received: from 91b6710f0ab5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E85C9981-ECFE-4F70-89E5-059EED353AF1.1; 
 Thu, 21 Apr 2022 07:00:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91b6710f0ab5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 07:00:42 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM0PR08MB5075.eurprd08.prod.outlook.com (2603:10a6:208:15b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 07:00:39 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%9]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 07:00:38 +0000
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
X-Inumbo-ID: caf2ac45-c140-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Znk8eN52uG/uV4s7QJ837O3y9WTc5AsZ1ioifoeZcH0=;
 b=TgdCWYP05guoYyu0gOQpT/X4CJhexfmrNF/90XVHV+IW+Rr+ISEOJCJ2rfkFWjsKqsfbH1ZTK9SUPRDLpxKnYcMIAntAFmOH95wGUjY5ll6Eluwa90xvOTu6mh5cmBu6SHKgjK+2zO/jBz+B7AGmnDGGPa3ONKzMXQtQy6bQaas=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDERpl5q7zIgWDDS3HAkm+RgQ0n0rs9leAb7vp14ja+SVSfkX394efwH2VA1Cd9osVtE5Qe84OmpnvlhcCiz1Mo/5GCPPAA2H5KStEug4KnI81N1se3sbhdq+wEhliEN428gQdkr3gVEHbvzRDI28pLvc3D3ACHM1Jw9ROzmUhKeKJ8WR73WeY5dHbjZZahDmt1cp+y5etqHeO1Ho/sJ61DD58QUcmSEJyG6VzwGHGPfTBE+md9vVNU2v5G055Wff1SlMfTBV9yUmVp1pmzYvmOPYz5U5xhk3o/JTGjNWsrakzgdJz8S5xo0HXa2tA0UlGMKGYt6C0T9zIUsFV9ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Znk8eN52uG/uV4s7QJ837O3y9WTc5AsZ1ioifoeZcH0=;
 b=XgC8hviRkBXYQySrBg9h36jmwW4/ic3ewkeNY8SJlz7ckvPZo4jw4eqWj6XNSF/i0zs5ygwTYrIKN4/fATWLZIW1O4Ld1uC8Z6+S4R4Bq+GGCxi/wIUJm/bwoZaW7sklfp4rOLIeIRx2+bpdkeh7769AMOlqcj3uttQ44xGN5u/E1H1W4pyzCGuB9pEqMkutTBt1BZzWLYJYCtsjZSnMyaoPSHb+Rba4xx1q2/4boDysqA3FCmjsItXnS4iFnPwepLSfKZiCdjHS0oTX2K25xdgMgACrS9gwPQlBQuRpzAsR8cliku/nFQu0PX9juthZ/4zFC6KsvRO18cOYJzfTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Znk8eN52uG/uV4s7QJ837O3y9WTc5AsZ1ioifoeZcH0=;
 b=TgdCWYP05guoYyu0gOQpT/X4CJhexfmrNF/90XVHV+IW+Rr+ISEOJCJ2rfkFWjsKqsfbH1ZTK9SUPRDLpxKnYcMIAntAFmOH95wGUjY5ll6Eluwa90xvOTu6mh5cmBu6SHKgjK+2zO/jBz+B7AGmnDGGPa3ONKzMXQtQy6bQaas=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 08/13] xen/arm: destroy static shared memory when
 de-construct domain
Thread-Topic: [PATCH v1 08/13] xen/arm: destroy static shared memory when
 de-construct domain
Thread-Index: AQHYNQ8XP5NnJaO3/U2NKPTcSWC8l6znfYSAgBKyp0A=
Date: Thu, 21 Apr 2022 07:00:37 +0000
Message-ID:
 <DU2PR08MB7325D83D85E9D543A400D677F7F49@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-9-Penny.Zheng@arm.com>
 <7c6a3af7-6052-aab8-829c-bc2c2a5db341@xen.org>
In-Reply-To: <7c6a3af7-6052-aab8-829c-bc2c2a5db341@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0A5C5D048BF6BF4CA0E73135AD3E967A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dd4a4786-2206-4830-f48d-08da2364ad1a
x-ms-traffictypediagnostic:
	AM0PR08MB5075:EE_|DB5EUR03FT030:EE_|VI1PR08MB4333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43330F9174CDB2ACF54772BBF7F49@VI1PR08MB4333.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DAxr2N03WS6UpJoFb4CMe3Ie5N7JCIIamRhbC9BRXa8uHuDY0Y57stI2RGaZ7Zl7C4n6sLVzHR0JPY+IWppmdHlQS+TozVL+orBeTxZk0Ui2IYwWghz9InR+5o1cldOB2LR0fAEgbnZ5rQeP1aemRDExKlAS+rZ08bMt7EkzVhZdJI8uJk3TM4mYFlYpb028dkqDOChQ1U5DmK47BiwrrRvOoR03DOSndO5ifP/H4+rteg6xWY5+1FudrO0ySJKEq6MHcixs9RFzZouzeseQTgMlESmBO2e2K1/+7pygFtzRf4Id9DJWRTLrwse14hmluPCPmlUnMsDMXfM8LI/sfLB5ABlmafkmtgTO+WRMDL4NToUHT8RScu6ahlR/9O8YBzzWtor9XaDKgH0lpnKWlBPDDkygtv5fiPuu5t71Etv1o3LPWlyE6b8fRo9G/kB4Uf7UmwIr0ZKd+6TYHFoQl7c7S11ruR1LeVyHwpdz6kVtlKuiHqWY08c0sg6acJUPff0110q/GkKrn/3sFqZi5ZWMcLCFI2erC5oMFqgCQek1qQTPK7yHR3OWjySSvAajO2HTn/7zZec2DlmJwkeves8QWoE+O1yBQSFz+bBiTNGxb97k2i6MPkkDJ91KYosCtR481H+uNpxJTYJ855xqgxwaLq6Kw64iD0oUzRT60jS8Wzis7dqE1E28Zz9g1soLuGdQKw86Gr1KIxIIQFSUWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(64756008)(76116006)(53546011)(66556008)(26005)(33656002)(4326008)(186003)(7696005)(66946007)(71200400001)(66476007)(8676002)(66446008)(9686003)(6506007)(2906002)(5660300002)(52536014)(508600001)(55016003)(38070700005)(38100700002)(8936002)(316002)(54906003)(110136005)(122000001)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5075
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f53e29ea-a09d-42d1-afb1-08da2364a3f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bDHCP+YIIgCSU/jXAc1ZKwn2+6+ru1BkG0HeVamP6S8GjOq8SRrngOa8K7d1aBJDwYYreNJAnMBnJqwNOvGHWma17BNjhOKbeAuLPJoq1zMWJgs73Wzn7zlKDeOjj6DR7msa4Pz8WUW3EEQrmU8QByct5VVpQeDZuchN56n9+1E7aeRXMBCq4ICbICTs/Ys5OSSAxiY0vwpdtTzrzyENmm8OnRCOaoWMV6U3WODeJ9sLW2a4nJn4OJfNGgHUlE8EA3j4a/JPREvHVwmViXYiOwr6vFjl+oNkSed1ys820Gqk4fiR+RwPqmUcJ9GUKqDFeFmfkYMxOSImBVEAPppVTVbdeFXwjJcuKe0RCG1gWCfyEF/Xf13Rf9Zv11xBlxieJ7SPR+ncMkFB3JNOfZH5sQ+1a+U+AM9UsxOtxTp/JqxQYEcffUEgRFJ272SSWPJ1qYTFpFCXP/GaQYPIDtke5b7LN1JuFIcUHvNZsFSN45WhMgOf4a4i7eOcPkfntcReFoy+Tlr7QD4RTT8rxvvNRSmwNKFKJDdEeNAdERoauWhpos0A8nMBdupLcSXpFo+GMdnRXWTjkFoaSIxXkCuaHOFDB7ZeJonUuAkDgCXGiCmZ14eyYsOpFQK7pTiN2wElQxXYmdG+FZmrPqaX6ry1jrCLXH9eAx/GsBGwRFA4sJMdJjVj/d9AJPNKX3KM246h
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(33656002)(186003)(336012)(36860700001)(7696005)(47076005)(2906002)(9686003)(26005)(40460700003)(55016003)(83380400001)(82310400005)(107886003)(52536014)(5660300002)(356005)(86362001)(8936002)(70586007)(70206006)(8676002)(4326008)(81166007)(110136005)(508600001)(53546011)(316002)(54906003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 07:00:53.4273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4a4786-2206-4830-f48d-08da2364ad1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4333

SGksIGp1bGllbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBBcHJpbCA5LCAyMDIy
IDU6MjYgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwOC8xM10geGVu
L2FybTogZGVzdHJveSBzdGF0aWMgc2hhcmVkIG1lbW9yeSB3aGVuDQo+IGRlLWNvbnN0cnVjdCBk
b21haW4NCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMTEvMDMvMjAyMiAwNjoxMSwgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4gRnJvbTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+
DQo+ID4NCj4gPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgbmV3IGhlbHBlciBkZXN0cm95X2Rv
bWFpbl9zaG0gdG8gZGVzdHJveQ0KPiA+IHN0YXRpYyBzaGFyZWQgbWVtb3J5IGF0IGRvbWFpbiBk
ZS1jb25zdHJ1Y3Rpb24uDQo+ID4NCj4gPiBUaGlzIHBhdGNoIG9ubHkgY29uc2lkZXJzIHRoZSBz
Y2VuYXJpbyB3aGVyZSB0aGUgb3duZXIgZG9tYWluIGlzIHRoZQ0KPiA+IGRlZmF1bHQgZG9tX3No
YXJlZCwgZm9yIHVzZXItZGVmaW5lZCBvd25lciBkb21haW4sIGl0IHdpbGwgYmUgY292ZXJlZA0K
PiA+IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcy4NCj4gPg0KPiA+IFNpbmNlIGFsbCBkb21haW5z
IGFyZSBib3Jyb3dlciBkb21haW5zLCB3ZSBjb3VsZCBzaW1wbHkgcmVtb3ZlIGd1ZXN0DQo+ID4g
UDJNIGZvcmVpZ24gbWFwcGluZyBvZiBzdGF0aWNhbGx5IHNoYXJlZCBtZW1vcnkgcmVnaW9uIGFu
ZCBkcm9wIHRoZQ0KPiA+IHJlZmVyZW5jZSBhZGRlZCBhdCBndWVzdF9waHlzbWFwX2FkZF9zaG0u
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9kb21haW4uYyB8IDQ4DQo+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0OCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGluZGV4DQo+ID4gMWZmMWRmNWQzZi4uZjBi
ZmQ2N2ZlNSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gPiBAQCAtMzQsNiArMzQsNyBAQA0KPiA+ICAgI2lu
Y2x1ZGUgPGFzbS9wbGF0Zm9ybS5oPg0KPiA+ICAgI2luY2x1ZGUgPGFzbS9wcm9jaW5mby5oPg0K
PiA+ICAgI2luY2x1ZGUgPGFzbS9yZWdzLmg+DQo+ID4gKyNpbmNsdWRlIDxhc20vc2V0dXAuaD4N
Cj4gPiAgICNpbmNsdWRlIDxhc20vdGVlL3RlZS5oPg0KPiA+ICAgI2luY2x1ZGUgPGFzbS92ZnAu
aD4NCj4gPiAgICNpbmNsdWRlIDxhc20vdmdpYy5oPg0KPiA+IEBAIC05OTMsNiArOTk0LDQ4IEBA
IHN0YXRpYyBpbnQgcmVsaW5xdWlzaF9tZW1vcnkoc3RydWN0IGRvbWFpbiAqZCwNCj4gc3RydWN0
IHBhZ2VfbGlzdF9oZWFkICpsaXN0KQ0KPiA+ICAgICAgIHJldHVybiByZXQ7DQo+ID4gICB9DQo+
ID4NCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNfU0hNDQo+ID4gK3N0YXRpYyBpbnQgZG9tYWlu
X2Rlc3Ryb3lfc2htKHN0cnVjdCBkb21haW4gKmQpIHsNCj4gPiArICAgIGludCByZXQgPSAwOw0K
PiA+ICsgICAgdW5zaWduZWQgbG9uZyBpID0gMFVMLCBqOw0KPiA+ICsNCj4gPiArICAgIGlmICgg
ZC0+YXJjaC5zaG1fbWVtID09IE5VTEwgKQ0KPiA+ICsgICAgICAgIHJldHVybiByZXQ7DQo+IA0K
PiBZb3UgYWxyZWFkeSByZXR1cm4gdGhlIHZhbHVlIGhlcmUuIFNvLi4uDQo+IA0KPiA+ICsgICAg
ZWxzZQ0KPiANCj4gLi4uIHRoZSBlbHNlIGlzIHBvaW50bGVzcy4NCj4gDQo+ID4gKyAgICB7DQo+
ID4gKyAgICAgICAgZm9yICggOyBpIDwgZC0+YXJjaC5zaG1fbWVtLT5ucl9iYW5rczsgaSsrICkN
Cj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfZ2ZucyA9
IFBGTl9ET1dOKGQtPmFyY2guc2htX21lbS0NCj4gPmJhbmtbaV0uc2l6ZSk7DQo+ID4gKyAgICAg
ICAgICAgIGdmbl90IGdmbiA9IGdhZGRyX3RvX2dmbihkLT5hcmNoLnNobV9tZW0tPmJhbmtbaV0u
c3RhcnQpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgZm9yICggaiA9IDA7IGogPCBucl9nZm5z
OyBqKysgKQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICBtZm5fdCBt
Zm47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgbWZuID0gZ2ZuX3RvX21mbihkLCBnZm5f
YWRkKGdmbiwgaikpOw0KPiANCj4gQSBkb21haW4gaXMgYWxsb3dlZCB0byBtb2RpZnkgaXRzIFAy
TS4gU28gdGhlcmUgYXJlIG5vIGd1YXJhbnRlZSB0aGF0IHRoZQ0KPiBHRk4gd2lsbCBzdGlsbCBw
b2ludCB0byB0aGUgc2hhcmVkIG1lbW9yeS4gVGhpcyB3aWxsIGFsbG93IHRoZSBndWVzdC4uLg0K
PiANCj4gPiArICAgICAgICAgICAgICAgIGlmICggIW1mbl92YWxpZChtZm4pICkNCj4gPiArICAg
ICAgICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19F
UlIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRG9tYWluICVwZCBwYWdlIG51
bWJlciAlbHggaW52YWxpZC5cbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
LCBnZm5feChnZm4pICsgaSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+IA0KPiAuLi4gdG8gYWN0aXZlbHkgcHJldmVudCBkZXN0cnVjdGlvbi4NCj4gDQo+ID4g
KyAgICAgICAgICAgICAgICB9DQo+IA0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBy
ZXQgPSBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlKGQsIGdmbl9hZGQoZ2ZuLCBqKSwgbWZuLCAw
KTsNCj4gPiArICAgICAgICAgICAgICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgIC8qIERyb3AgdGhl
IHJlZmVyZW5jZS4gKi8NCj4gPiArICAgICAgICAgICAgICAgIHB1dF9wYWdlKG1mbl90b19wYWdl
KG1mbikpOw0KPiANCj4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZSgpIHdpbGwgYWxyZWFkeSBk
cm9wIHRoZSByZWZlcmVuY2UgdGFrZW4gZm9yIHRoZQ0KPiBmb3JlaWduIG1hcHBpbmcuIEkgY291
bGRuJ3QgZmluZCBhbnkgb3RoZXIgcmVmZXJlbmNlIHRha2VuLCB3aGF0IGlzIHRoZQ0KPiBwdXRf
cGFnZSgpIGZvcj8NCj4gDQo+IEFsc28sIGFzIHBlciBhYm92ZSB3ZSBkb24ndCBrbm93IHdoZXRo
ZXIgdGhpcyBpcyBhIHBhZ2UgZnJvbSB0aGUgc2hhcmVkIHBhZ2UuDQo+IFNvIHdlIGNhbid0IGJs
aW5kbHkgY2FsbCBwdXRfcGFnZSgpLg0KPiANCj4gSG93ZXZlciwgSSBkb24ndCB0aGluayB3ZSBu
ZWVkIGFueSBzcGVjaWZpYyBjb2RlIGhlcmUuIFdlIGNhbiByZWx5IG9uDQo+IHJlbGlucXVpc2hf
cDJtX21hcHBpbmdzKCkgdG8gZHJvcCBhbnkgcmVmZXJlbmNlLiBJZiB0aGVyZSBpcyBhbiBleHRy
YSBvbmUgZm9yDQo+IHNoYXJlZCBtYXBwaW5ncywgdGhlbiB3ZSBzaG91bGQgdXBkYXRlIHAybV9w
dXRfbDNfcGFnZSgpLg0KPiANCg0KVHJ1ZSwgdHJ1ZS4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlz
IG91dCENCkluIHAybV9wdXRfbDNfcGFnZSwgaXQgaGFzIGFscmVhZHkgY2FsbGVkIHB1dF9wYWdl
KCkgZm9yIGZvcmVpZ24gbWFwcGluZywNCmRlZmluaXRlbHkgbm8gZXh0cmEgb25lIGhlcmUhDQoN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

