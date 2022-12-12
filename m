Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D06649D8C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 12:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459504.717253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4gyH-0004De-I4; Mon, 12 Dec 2022 11:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459504.717253; Mon, 12 Dec 2022 11:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4gyH-0004Am-Ev; Mon, 12 Dec 2022 11:27:45 +0000
Received: by outflank-mailman (input) for mailman id 459504;
 Mon, 12 Dec 2022 11:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tmz+=4K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p4gyG-0004Ag-4i
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 11:27:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdab5256-7a0f-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 12:27:41 +0100 (CET)
Received: from ZR0P278CA0168.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:45::23)
 by AS8PR08MB8250.eurprd08.prod.outlook.com (2603:10a6:20b:53e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.8; Mon, 12 Dec
 2022 11:27:40 +0000
Received: from VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:45:cafe::60) by ZR0P278CA0168.outlook.office365.com
 (2603:10a6:910:45::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 11:27:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT065.mail.protection.outlook.com (100.127.144.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.17 via Frontend Transport; Mon, 12 Dec 2022 11:27:39 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 12 Dec 2022 11:27:39 +0000
Received: from 10fa38885af9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C29C9A5-6650-47C3-8B32-DE022C34FF11.1; 
 Mon, 12 Dec 2022 11:27:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10fa38885af9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Dec 2022 11:27:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.8; Mon, 12 Dec
 2022 11:27:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5924.009; Mon, 12 Dec 2022
 11:27:26 +0000
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
X-Inumbo-ID: fdab5256-7a0f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9B2gp5tmonAmPjqlto2evnFWC14CLjDcuB7zjt6QKU=;
 b=sY8s3FQ+NoyEWhz57LW28mKYrvWi017ECgaSMyGQ7sj0t6o68JVWvNvHSPn0S9+9TweXzXwtM3Q0m5ceVe7HCH7jzbmByIgXMUAvrJPVr1GM4Ml9tRyg/Uye9x98C0moCt/pue6iZp8pexDnWGeveDxm+Yue9TRHIsLVPLg+nRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYhrT1C6zWoCFB9Xe/Br4anbdqxyXg4Ot64oUmTiYVOvUTs56tIHLjoovaD9tHjm8F+MZTjwHLxSydc1m1ULZF2cWoq+U6S7b/VWFn5VolKtSF+Zub9xlhcHRLM7IG6jXzroYtU3pzHZ33dmjVywbkysp8tLeMiZwuDJikYnL/poNbwKhO1696MFOaLKEId68KkcaWWvU446bz/nVluoIy8IAGQZ/iU0J3kFhkWBJuP/0GIbdl3gOEo377lT1MTLnBziKNgqDQUzmrLZTJGurKoJMxqaHHs/OZ7lzH0JEh3ZQSV87szHLzMOcgErmYZK2peLsAjEFdEev0zF4V2WFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9B2gp5tmonAmPjqlto2evnFWC14CLjDcuB7zjt6QKU=;
 b=lqts4GGBqKgRCrYqyp6MYPKbDqYU9iDB476ak9itA6kQPd8GTuuoChHn6+ExxL6Ss04a/2W8m+Bn1PprrJwNuldHP1wmDbqbxrttJl1FMqyD3TXxh8mTnidmFvcAMDiTcQEw7kN2xofdrjOfFk3/yyxuSUK7g0wzR7dn3q+CyMX85YyvLwvhffdnWJ0irwdrMeCpmFl8P+YmBgQ+/CFQU5q7aumNWI7oIN929bD20M7WG8lz5nK6LlcdmK0LpOc98vvkTWyfiHIrcmzTrvz/zs6S7ZpE83MT5C5dP6eVB6YEL3j6eSuFcLCLgy7RCGjCeDRtbINutegttorD8H/zHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9B2gp5tmonAmPjqlto2evnFWC14CLjDcuB7zjt6QKU=;
 b=sY8s3FQ+NoyEWhz57LW28mKYrvWi017ECgaSMyGQ7sj0t6o68JVWvNvHSPn0S9+9TweXzXwtM3Q0m5ceVe7HCH7jzbmByIgXMUAvrJPVr1GM4Ml9tRyg/Uye9x98C0moCt/pue6iZp8pexDnWGeveDxm+Yue9TRHIsLVPLg+nRo=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Reduce redundant clear root pages when teardown
 p2m
Thread-Topic: [PATCH] xen/arm: Reduce redundant clear root pages when teardown
 p2m
Thread-Index: AQHZDfTM8ZVdBcwf4EKHce09rjobqq5qHDOAgAAAaXA=
Date: Mon, 12 Dec 2022 11:27:26 +0000
Message-ID:
 <AS8PR08MB799154878CCA46EE1A1B998D92E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221212064119.2632626-1-Henry.Wang@arm.com>
 <65819ff9-1a1a-dfc3-f700-289dd8c340dc@xen.org>
In-Reply-To: <65819ff9-1a1a-dfc3-f700-289dd8c340dc@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F05306E52B775148A5C000567FF68E7B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5411:EE_|VI1EUR03FT065:EE_|AS8PR08MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a2e3d3-3d2c-44f5-b4d2-08dadc33e0df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RXhNzCBjR4+m+3sEuRlYZS23RePm79APMTNRLpGpYUGuYMQEW2/fVgHZuDnOjh1Gkq+S+VfkbHRY6msaZzP2vVHgoXltyoLeBDYZzPMTex+hSsYIVwYrEV5x1jSpfUn9sh+FAyFKcAkyMArrWnKHvOE8JppvOmsn+v9qOJrNsScMpPdSNHzTDUQZsfKdp83fyVNt21HSTkegN1sIEj0gNsOcyp94/5/20V1mMOYYR7lfNpuqp/xCl8J7Z90HuLXBBbtu0mfpY8fgNtVO92gZ6G3JolAGOqqJ5thuP26rgkPTOrdQ/KvwKSOD2nwrji1neGwwsnkIcO+YtKcbf63OgzvUhKIVc5+0HXRvNWos0/MGlFvNPSI0mZUgBHKZ2Lqp5fsKD3YLF/yixL7LSZpSE73DLVJ+LOckwpN75tZA9jrqiOMqpWgegIF/huFl28YbUAJtpDXc7gYreb9bBHT1M76x0GLszIZZOoC1wRLdE1+HPxEt16V2q79AIFXPcPvHE+ex6XhLhqHMj8bsQ9fUYFWjY+2cWoJfYwG0dqRpNww1zh2teu69i7x97AJ1Ndlvf/Aht95fcEuQ2VFFKOPrsEhXsavJ7rSTV/NAYk+3X15Q2W2PVUFPO3yRpCIbAFno33EeSjbrngHMobZUClYmI7+LHIyCIqocxB6xexjxVWBMuSe7nj3nFY0nl4EAbcBSlvtFxHftkAoBgOhOK5Ar1Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(2906002)(5660300002)(8936002)(52536014)(41300700001)(4326008)(66476007)(8676002)(66556008)(66946007)(55016003)(64756008)(66446008)(38070700005)(110136005)(54906003)(83380400001)(86362001)(71200400001)(9686003)(316002)(76116006)(7696005)(6506007)(26005)(122000001)(38100700002)(33656002)(186003)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88a29e5e-c5fe-4acd-f4f8-08dadc33d89f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BfcHSywdliUq/58GQ3QVFBxSHTDGoKrg69RF118D5Aey60b41LDhZarf6cRHgHZC1iKJ+VmAVt3Z+b9rn/vX2nxVX0D/+e1cry3gOZ14MH1Ut/WiI4ygJuyGMo4d29figBBUjjbRTRECcCLfp6TF2KvKKrJZXIpa0gPIFKrfLmF+NvfrfKsu6OdyQm+e3UbUWUHUJc3JXp8Diuq57jvuJpRbl9BiYqeXnK4weTo8L17f19H7vvYN+AFDcsnDks3Lnf7yMxT5TP+WMXahTEvke3XYUJSl0ifq8l+T0f6v/PmZ+EDif1vddlPM45B0OJXR/8j188VyIdfCbUkb22leW5Hd4ur9SLJ4pt0zPKjYJRdFR1ousEYyoWqtP+8XoC459J1+9Ny97yX/N5LqM8VLbwOt5hbtW9PkZJXouVlW3BeeqYvjAUOQUJXgQyJGD4lrLmRXahZZusinTu8cYgirVESbw/Uy3Cuf8ufyVzQ+/Zlxao9xaXO6DkBHOWb7l2/d50JJ02rSjCbFfjgR3Z5EU5h9+bZzPlKmpNhVmp7IzkTlLwzobRL0nYcUovObI37TNwag5lXkdu6RUBYfxwzz7kexqoQy+lPE143kLz7xvUtuaY9Fv3SMXLuLjtssUcpU0tbmJPz61SXH9tIJtxSyJ+PktQla5fGCzNfPbqnmzxRKWvbsRoVk0bQlyMyjb1sbAK5LHjfh3wKZUf1S5m8rA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(40480700001)(8936002)(52536014)(41300700001)(4326008)(8676002)(55016003)(356005)(110136005)(54906003)(336012)(83380400001)(86362001)(47076005)(70206006)(9686003)(81166007)(82740400003)(316002)(70586007)(7696005)(6506007)(26005)(107886003)(33656002)(186003)(40460700003)(478600001)(82310400005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 11:27:39.9452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a2e3d3-3d2c-44f5-b4d2-08dadc33e0df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8250

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06
IFJlZHVjZSByZWR1bmRhbnQgY2xlYXIgcm9vdCBwYWdlcyB3aGVuDQo+IHRlYXJkb3duIHAybQ0K
PiANCj4gSGkgSGVucnksDQo+IA0KPiA+ICAgICAgIFBST0dSRVNTKHAybSk6DQo+ID4gKyAgICAg
ICAgLyoNCj4gPiArICAgICAgICAgKiBXZSBhcmUgYWJvdXQgdG8gZnJlZSB0aGUgaW50ZXJtZWRp
YXRlIHBhZ2UtdGFibGVzLCBzbyBjbGVhciB0aGUNCj4gPiArICAgICAgICAgKiByb290IHRvIHBy
ZXZlbnQgYW55IHdhbGsgdG8gdXNlIHRoZW0uDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAg
ICAgcDJtX2NsZWFyX3Jvb3RfcGFnZXMoJmQtPmFyY2gucDJtKTsNCj4gDQo+IFRoZSBjb21taXQg
bWVzc2FnZSBzdWdnZXN0cyB0aGlzIHNob3VsZCBvbmx5IGJlIGNhbGxlZCBvbmNlLiBIb3dldmVy
LA0KPiB5b3Ugd2lsbCBzdGlsbCBlbmQgdXAgdG8gY2FsbCBwMm1fY2xlYXJfcm9vdF9wYWdlcygp
IG11bHRpcGxlIHRpbWUgaWYNCj4gcDJtX3RlYXJkb3duKCkgaXMgcHJlZW1wdGVkLg0KDQpUaGFu
a3MgZm9yIGNvbmZpcm1pbmcgdGhpcywgd291bGQgYWRkaW5nIGFub3RoZXIgUFJPR1JFU1Mgc3Rh
Z2UNCnN1Y2ggYXMgUFJPR1JFU1MocDJtX2NsZWFuKSBiZWZvcmUgUFJPR1JFU1MocDJtKSBzZWVt
IG9rIHRvIHlvdT8NCg0KPiANCj4gPiAgICAgICAgICAgcmV0ID0gcDJtX3RlYXJkb3duKGQsIHRy
dWUpOw0KPiA+ICAgICAgICAgICBpZiAoIHJldCApDQo+ID4gICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcDJtLmgNCj4g
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcDJtLmgNCj4gPiBpbmRleCA5MWRmOTIyZTFjLi5i
ZjUxODNlNTNhIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wMm0u
aA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wMm0uaA0KPiA+IEBAIC0yODEs
NiArMjgxLDcgQEAgaW50IHAybV9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwNCj4g
Pg0KPiA+ICAgYm9vbCBwMm1fcmVzb2x2ZV90cmFuc2xhdGlvbl9mYXVsdChzdHJ1Y3QgZG9tYWlu
ICpkLCBnZm5fdCBnZm4pOw0KPiA+DQo+ID4gK3ZvaWQgcDJtX2NsZWFyX3Jvb3RfcGFnZXMoc3Ry
dWN0IHAybV9kb21haW4gKnAybSk7DQo+ID4gICB2b2lkIHAybV9pbnZhbGlkYXRlX3Jvb3Qoc3Ry
dWN0IHAybV9kb21haW4gKnAybSk7DQo+ID4NCj4gPiAgIC8qDQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPiA+IGluZGV4IDk0OGYxOTlk
ODQuLjBjOTQyYzU5MjMgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jDQo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL3AybS5jDQo+ID4gQEAgLTEzMTQsNiArMTMxNCwxOCBAQCBzdGF0
aWMgdm9pZCBwMm1faW52YWxpZGF0ZV90YWJsZShzdHJ1Y3QNCj4gcDJtX2RvbWFpbiAqcDJtLCBt
Zm5fdCBtZm4pDQo+ID4gICAgICAgcDJtLT5uZWVkX2ZsdXNoID0gdHJ1ZTsNCj4gPiAgIH0NCj4g
Pg0KPiA+ICAgICAgIC8qDQo+ID4gICAgICAgICogVGhlIGRvbWFpbiB3aWxsIG5vdCBiZSBzY2hl
ZHVsZWQgYW55bW9yZSwgc28gaW4gdGhlb3J5IHdlIHNob3VsZA0KPiA+ICAgICAgICAqIG5vdCBu
ZWVkIHRvIGZsdXNoIHRoZSBUTEJzLiBEbyBpdCBmb3Igc2FmZXR5IHB1cnBvc2UuDQo+IA0KPiBU
aGlzIGZsdXNoIG5lZWRzIHRvIGJlIG1vdmVkIGluIHAybV9jbGVhcl9yb290X3BhZ2VzKCkuDQoN
ClN1cmUsIHdpbGwgbW92ZSB0aGlzIGluIHYyLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

