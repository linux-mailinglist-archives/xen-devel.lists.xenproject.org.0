Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87616638DC6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 16:52:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448210.705101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyayN-0005rl-Q4; Fri, 25 Nov 2022 15:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448210.705101; Fri, 25 Nov 2022 15:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyayN-0005ou-N1; Fri, 25 Nov 2022 15:50:39 +0000
Received: by outflank-mailman (input) for mailman id 448210;
 Fri, 25 Nov 2022 15:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7Aj=3Z=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oyayL-0005ol-QA
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 15:50:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e61319b2-6cd8-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 16:50:35 +0100 (CET)
Received: from DB9PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:1d9::29)
 by AS8PR08MB8490.eurprd08.prod.outlook.com (2603:10a6:20b:567::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 15:50:30 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::a2) by DB9PR02CA0024.outlook.office365.com
 (2603:10a6:10:1d9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Fri, 25 Nov 2022 15:50:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20 via Frontend Transport; Fri, 25 Nov 2022 15:50:30 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 25 Nov 2022 15:50:30 +0000
Received: from 48b9f45ef1c5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A7D2E96-80D3-4136-8F27-DE56F6E818A0.1; 
 Fri, 25 Nov 2022 15:50:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 48b9f45ef1c5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Nov 2022 15:50:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB7409.eurprd08.prod.outlook.com (2603:10a6:102:2a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 15:50:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 15:50:09 +0000
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
X-Inumbo-ID: e61319b2-6cd8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MrgEbLZWE8VLGcUb0mBrzk3xTtNJtTmq9OaRn7gMEY=;
 b=i0KIpCD5uwmhZpF0yDPBEZMG686PgnWH2Z6dxWLjkC6N4TX6K987f70FRBuI8HOwONmaopDJpB1e1q4K6WLlYQY3GytPu5bwqANf2jybMeY1FR4kZbIkKABpwDl4dDvd32Bk9VXfl1ZGByq4WaiHQrjrQCnzKxRZsuAEuO9A6j8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 122fa8aac16b0ab8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaMTjXI2rQM7m0eAzpnI1czvE5yjWxTyN0MsM8vS09oAnJxj97c/FoL6l/2RNXwQwYjcTs7ixwXbuKIcLnYn/2Ocx0Nypr6qzS0AJZsm4hkHsWHjvPOwjwicEfYtAP7GGl2qV/YNI+xhYZRpJBqp++qFnok3Jc0mloU1dL28l4XhE+pwQfGXysvPAh9qZKFH7FI/ibDKp6pU4NI1bswRhLEpZ0Ycq17FUH2Fvbj90QlsF/lHmXNFKs31/cmj+2UXM+dPzdKy0YNwd6g3Jm7deBI1vyH6+s9OO5/+/zCg8rukReyFWfH1KYYFgj6oIsjj9VZggy7cJfq+U63KoX2oZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MrgEbLZWE8VLGcUb0mBrzk3xTtNJtTmq9OaRn7gMEY=;
 b=KRXy7/v4oRXxAAfBlUQ1AbrkkqQ0iJbsSiJItbK8teaZeVVc/f+oaWdoQIVoW9kXRmdGDJxgZXLLtIvFLgWkykWIEXhAeETHMqPYwwEYnfJo7yqTWiCBe59Psc6Iuv5e9V9cc8XFICrnh7dr0OAClWVJCL4YD6sFyAII6wGnPRlPlX4VAq7knTWsT104AK9mWLCQRJNdZ5whLpW2CSDyEPXh+8CohlYOVttfoIi54MIj2zSokY1hIVjU7qUSx7ZnS3LuzEotUZm9zNZMZTqFguBRn5leb3hv2oWFz+G7UyZuAKgXzS8PEvxvZ4xYyDPiiwgEidWP41JBLZEeNjcsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MrgEbLZWE8VLGcUb0mBrzk3xTtNJtTmq9OaRn7gMEY=;
 b=i0KIpCD5uwmhZpF0yDPBEZMG686PgnWH2Z6dxWLjkC6N4TX6K987f70FRBuI8HOwONmaopDJpB1e1q4K6WLlYQY3GytPu5bwqANf2jybMeY1FR4kZbIkKABpwDl4dDvd32Bk9VXfl1ZGByq4WaiHQrjrQCnzKxRZsuAEuO9A6j8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, "carlo.nonato@minervasys.tech"
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 04/12] xen/arm32: head: Remove restriction where to load
 Xen
Thread-Topic: [RFC v2 04/12] xen/arm32: head: Remove restriction where to load
 Xen
Thread-Index: AQHY5iekhdeljnYaKUO3Ilpr3vGfIK4fBWIAgCSx6ACADEeWAA==
Date: Fri, 25 Nov 2022 15:50:09 +0000
Message-ID: <62EDCEBA-B8B6-4869-99A3-3A430BF9D637@arm.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-5-julien@xen.org>
 <F7ED0618-C95F-45FE-932C-A27D75DC8206@arm.com>
 <8624949e-6198-1aa3-152f-4294534d6d86@xen.org>
In-Reply-To: <8624949e-6198-1aa3-152f-4294534d6d86@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB7409:EE_|DBAEUR03FT021:EE_|AS8PR08MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: fdcb9c41-eaee-43c4-9692-08dacefcc78c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mc5neD9DftxauksaSD9d5uwkZfBzXkLjyD9CldAW1n6ZPPFGxxnOiUg26ED3CrabUr8PfPfhIUAXt6kc08CXCIMaGc2QwuUqANiZQE7FSKmMUgyh3tisgWvC+LbHcSjthIF/WetVbuer2AkL3086V22PHVQmWTixMuVcwAombaOLAhVSuIvICAIlLb7HD4oi1iEbCT4DRmuQC4TeGBJ6PZ5/N7n0A6pfPDl05hZ+tprCtqF01xOK0Z/SxpmXzR5dzzLUT1vtJCRV3gLQHnYkNf40judY/CnkpeE1Wf+Uc/G/yrVEW/bLoi/LD7CljlzPIwEISwv7r2PDYa1ztNyTYLpyv3mjtM/9OrKKW0khn9Xlpv4Z3bOunK/j7SeKNGSM7lzKoxq8XeWL/6o+57myr3AWu1iT3ZXLjWSkoXpyvpL3Vmjn4rhFVH64TY7HmLtr0M5UIl4uixGL89FXnQTBq4yXbCzaifF5M+k9lP21SAbIXb3fJ5dSQPNmh37d2WTNm+S/Vv0OflPSFGwubkLeD/UuChhguK9L9+Dt21xcAp+ma/sEHtvQL7Bp6WmKyyrmEgmsjS/kNSYph3sCsMMA/SUQC+bxmPqg6p0IAHusrcC2wFlVitBLzxojcisv/apH/ymPizCLC4BB4svTR75l55qKlyXWu64aP4pdNuUv/wJWHLBI4jYbRH9WE8Ekmz/4BWQLkNug09wk3ruuz+rihKtLh4b1uZv4GLZFxcEUxwQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199015)(71200400001)(186003)(8936002)(6512007)(6916009)(54906003)(26005)(316002)(53546011)(478600001)(6486002)(33656002)(6506007)(36756003)(86362001)(2616005)(41300700001)(8676002)(38100700002)(4326008)(5660300002)(66476007)(91956017)(66946007)(66556008)(64756008)(76116006)(66446008)(83380400001)(38070700005)(2906002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9B1068C49CD954F8F4995F0D0D3C0F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7409
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13de8e41-ba10-488f-2404-08dacefcbb1a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DcWL7fpGwd+CbIK2jom1vyXaOvpzx9P1NNRKFWRHt+M+sVhngM8EOX3ZEPqma7lgYcTwXYJ/vphFemmqIcvt+yAnHh8VGPqxTvZ3W0whSqrLyKOqqcCi/m7TBqjE10gjtF90eYOzVm0wRgvWdIAMemzGDmUUqIhxGaxEcUTj5GMdLFjFRprhWjLwONGcLlLqJJuXLBUrkWwtiXvKJggo/PLybYlpolebLhQjhMWu57/7kGShfuwACAq8voOg0Y4v+13vdEVwPWvKme+GHsYzXYUBdN/NThSFpHBXMRHk1Zz691snW3CYqapTYglmMdD8mRcPidSRs7EMnzYychxfz5/Pw75YVnaLZQU5/9H9zaCsPzYRaiQ6Fca1V6JMneXTnpvNI+eQ/F6BIvk/1s8Jr1Qo34cm1MfT0qskVZR4aA4Yq14mZk/2I6QHx1aKGhx8XVqfI1KNgBr3ibu0GAdmHuOXU2rimrEPOB7UhjlG+gGzodw/ZS0/Smh1dKIbhgwnAxwSqTZIhtExIoN2/dyT3xBDBj/5mkiX/VrIFKWMcHYuxMiK7ohTYE6nSG9yrBpfTqTMbwNEA+mxV3r0VKdB0mmdyt5LSMfsW5iiZlyO3o2kEGGNQ6swu8Mf1YW2TnhiMbQg7uUJ8/BAV5oCQSkrH1Y/7zLrTleAA3ovFr95/BM1Dup0EQ3RNdzudmosq0kqiaK8npvpYb28i3BMzlo8Yg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(70206006)(70586007)(36756003)(41300700001)(6862004)(8936002)(33656002)(40460700003)(82740400003)(4326008)(5660300002)(107886003)(86362001)(36860700001)(26005)(316002)(53546011)(6512007)(6506007)(83380400001)(82310400005)(2616005)(186003)(336012)(54906003)(47076005)(81166007)(478600001)(6486002)(40480700001)(356005)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 15:50:30.1150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcb9c41-eaee-43c4-9692-08dacefcc78c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8490

DQoNCj4gT24gMTcgTm92IDIwMjIsIGF0IDIwOjE4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyNS8xMC8yMDIyIDEyOjU2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDIyIE9jdCAyMDIyLCBhdCAxNjowNCwgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gRnJvbTogSnVsaWVuIEdy
YWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+PiANCj4+PiBBdCB0aGUgbW9tZW50LCBib290bG9h
ZGVycyBjYW4gbG9hZCBYZW4gYW55d2hlcmUgaW4gbWVtb3J5IGJ1dCB0aGUNCj4+PiByZWdpb24g
Mk1CIC0gNE1CLiBXaGlsZSBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgaXNzdWUsIHdlIGhhdmUgbm8g
d2F5DQo+Pj4gdG8gdGVsbCB0aGUgYm9vdGxvYWRlciB0byBhdm9pZCB0aGF0IHJlZ2lvbi4NCj4+
PiANCj4+PiBJbiBhZGRpdGlvbiB0byB0aGF0LCBpbiB0aGUgZnV0dXJlLCBYZW4gbWF5IGdyb3cg
b3ZlciAyTUIgaWYgd2UNCj4+PiBlbmFibGUgZmVhdHVyZSBsaWtlIFVCU0FOIG9yIEdDT1YuIFRv
IGF2b2lkIHdpZGVuaW5nIHRoZSByZXN0cmljdGlvbg0KPj4+IG9uIHRoZSBsb2FkIGFkZHJlc3Ms
IGl0IHdvdWxkIGJlIGJldHRlciB0byBnZXQgcmlkIG9mIGl0Lg0KPj4+IA0KPj4+IFdoZW4gdGhl
IGlkZW50aXR5IG1hcHBpbmcgaXMgY2xhc2hpbmcgd2l0aCB0aGUgWGVuIHJ1bnRpbWUgbWFwcGlu
ZywNCj4+PiB3ZSBuZWVkIGFuIGV4dHJhIGluZGlyZWN0aW9uIHRvIGJlIGFibGUgdG8gcmVwbGFj
ZSB0aGUgaWRlbnRpdHkNCj4+PiBtYXBwaW5nIHdpdGggdGhlIFhlbiBydW50aW1lIG1hcHBpbmcu
DQo+Pj4gDQo+Pj4gUmVzZXJ2ZSBhIG5ldyBtZW1vcnkgcmVnaW9uIHRoYXQgd2lsbCBiZSB1c2Vk
IHRvIHRlbXBvcmFyaWx5IG1hcCBYZW4uDQo+Pj4gRm9yIGNvbnZlbmllbmNlLCB0aGUgbmV3IGFy
ZWEgaXMgcmUtdXNpbmcgdGhlIHNhbWUgZmlyc3Qgc2xvdCBhcyB0aGUNCj4+PiBkb21oZWFwIHdo
aWNoIGlzIHVzZWQgZm9yIHBlci1jcHUgdGVtcG9yYXJ5IG1hcHBpbmcgYWZ0ZXIgYSBDUFUgaGFz
DQo+Pj4gYm9vdGVkLg0KPj4+IA0KPj4+IEZ1cnRoZXJtb3JlLCBkaXJlY3RseSBtYXAgYm9vdF9z
ZWNvbmQgKHdoaWNoIGNvdmVyIFhlbiBhbmQgbW9yZSkNCj4+PiB0byB0aGUgdGVtcG9yYXJ5IGFy
ZWEuIFRoaXMgd2lsbCBhdm9pZCB0byBhbGxvY2F0ZSBhbiBleHRyYSBwYWdlLXRhYmxlDQo+Pj4g
Zm9yIHRoZSBzZWNvbmQtbGV2ZWwgYW5kIHdpbGwgaGVscGZ1bCBmb3IgZm9sbG93LXVwIHBhdGNo
ZXMgKHdlIHdpbGwNCj4+PiB3YW50IHRvIHVzZSB0aGUgZml4bWFwIHdoaWxzdCBpbiB0aGUgdGVt
cG9yYXJ5IG1hcHBpbmcpLg0KPj4+IA0KPj4+IExhc3RseSwgc29tZSBwYXJ0IG9mIHRoZSBjb2Rl
IG5vdyBuZWVkcyB0byBrbm93IHdoZXRoZXIgdGhlIHRlbXBvcmFyeQ0KPj4+IG1hcHBpbmcgd2Fz
IGNyZWF0ZWQuIFNvIHJlc2VydmUgcjEyIHRvIHN0b3JlIHRoaXMgaW5mb3JtYXRpb24uDQo+Pj4g
DQo+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+
PiAtLS0tDQo+Pj4gDQo+Pj4gICAgQ2hhbmdlcyBpbiB2MjoNCj4+PiAgICAgICAgLSBQYXRjaCBh
ZGRlZA0KPj4+IC0tLQ0KPj4gSGkgSnVsaWVuLA0KPj4gSeKAmW0gaGl0dGluZyBhbiBhc3NlcnQg
d2l0aCB0aGlzIG9uZSwgdGVzdGVkIG9uIHFlbXUgYW5kIGZ2cDoNCj4gDQo+IFRoYW5rcyBmb3Ig
dGVzdGluZyB0aGUgc2VyaWVzIQ0KPiANCj4+IFhlbiA0LjE3LXJjDQo+PiAoWEVOKSBYZW4gdmVy
c2lvbiA0LjE3LXJjICh1c2VyQGhvc3RuYW1lKSAoYXJtLXBva3ktbGludXgtZ251ZWFiaS1nY2Mg
KEdDQykgMTEuMy4wKSBkZWJ1Zz15IFR1ZSBPY3QgMjUgMTA6NTE6MDYgVVRDIDIwMjINCj4+IChY
RU4pIExhdGVzdCBDaGFuZ2VTZXQ6DQo+PiAoWEVOKSBidWlsZC1pZDogYWIxNDNiMTNmNDM5NGNl
ZDUzMzFkNmZmMWNlZGViZGIyZmZhZGMwNw0KPj4gKFhFTikgUHJvY2Vzc29yOiA0MTJmYzBmMTog
IkFSTSBMaW1pdGVkIiwgdmFyaWFudDogMHgyLCBwYXJ0IDB4YzBmLHJldiAweDENCj4+IChYRU4p
IDMyLWJpdCBFeGVjdXRpb246DQo+PiAoWEVOKSAgIFByb2Nlc3NvciBGZWF0dXJlczogMDAwMDEx
MzE6MDAwMTEwMDENCj4+IChYRU4pICAgICBJbnN0cnVjdGlvbiBTZXRzOiBBQXJjaDMyIEEzMiBU
aHVtYiBUaHVtYi0yIFRodW1iRUUgSmF6ZWxsZQ0KPj4gKFhFTikgICAgIEV4dGVuc2lvbnM6IEdl
bmVyaWNUaW1lcg0KPj4gKFhFTikgICBEZWJ1ZyBGZWF0dXJlczogMDIwMTA1NTUNCj4+IChYRU4p
ICAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMA0KPj4gKFhFTikgICBNZW1vcnkgTW9kZWwg
RmVhdHVyZXM6IDEwMjAxMTA1IDIwMDAwMDAwDQo+PiAoWEVOKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgMDEyNDAwMDAgMDIxMDIyMTENCj4+IChYRU4pICAgSVNBIEZlYXR1cmVzOiAwMjEwMTEx
MCAxMzExMjExMSAyMTIzMjA0MQ0KPj4gKFhFTikgICAgICAgICAgICAgICAgIDExMTEyMTMxIDEw
MDExMTQyIDAwMDAwMDAwDQo+PiAoWEVOKSBVc2luZyBTTUMgQ2FsbGluZyBDb252ZW50aW9uIHYx
LjANCj4+IChYRU4pIFVzaW5nIFBTQ0kgdjAuMg0KPj4gKFhFTikgU01QOiBBbGxvd2luZyA0IENQ
VXMNCj4+IChYRU4pIEdlbmVyaWMgVGltZXIgSVJROiBwaHlzPTMwIGh5cD0yNiB2aXJ0PTI3IEZy
ZXE6IDYyNTAwIEtIeg0KPj4gKFhFTikgR0lDdjJtIGV4dGVuc2lvbiByZWdpc3RlciBmcmFtZToN
Cj4+IChYRU4pICAgICAgICAgZ2ljX3YybV9hZGRyPTAwMDAwMDAwMDgwMjAwMDANCj4+IChYRU4p
ICAgICAgICAgZ2ljX3YybV9zaXplPTAwMDAwMDAwMDAwMDEwMDANCj4+IChYRU4pICAgICAgICAg
Z2ljX3YybV9zcGlfYmFzZT04MA0KPj4gKFhFTikgICAgICAgICBnaWNfdjJtX251bV9zcGlzPTY0
DQo+PiAoWEVOKSBHSUN2MiBpbml0aWFsaXphdGlvbjoNCj4+IChYRU4pICAgICAgICAgZ2ljX2Rp
c3RfYWRkcj0wMDAwMDAwMDA4MDAwMDAwDQo+PiAoWEVOKSAgICAgICAgIGdpY19jcHVfYWRkcj0w
MDAwMDAwMDA4MDEwMDAwDQo+PiAoWEVOKSAgICAgICAgIGdpY19oeXBfYWRkcj0wMDAwMDAwMDA4
MDMwMDAwDQo+PiAoWEVOKSAgICAgICAgIGdpY192Y3B1X2FkZHI9MDAwMDAwMDAwODA0MDAwMA0K
Pj4gKFhFTikgICAgICAgICBnaWNfbWFpbnRlbmFuY2VfaXJxPTI1DQo+PiAoWEVOKSBHSUN2Mjog
Mjg4IGxpbmVzLCA0IGNwdXMgKElJRCAwMDAwMDAwMCkuDQo+PiAoWEVOKSBYU00gRnJhbWV3b3Jr
IHYxLjAuMSBpbml0aWFsaXplZA0KPj4gKFhFTikgSW5pdGlhbGlzaW5nIFhTTSBTSUxPIG1vZGUN
Cj4+IChYRU4pIFVzaW5nIHNjaGVkdWxlcjogU01QIENyZWRpdCBTY2hlZHVsZXIgcmV2MiAoY3Jl
ZGl0MikNCj4+IChYRU4pIEluaXRpYWxpemluZyBDcmVkaXQyIHNjaGVkdWxlcg0KPj4gKFhFTikg
IGxvYWRfcHJlY2lzaW9uX3NoaWZ0OiAxOA0KPj4gKFhFTikgIGxvYWRfd2luZG93X3NoaWZ0OiAz
MA0KPj4gKFhFTikgIHVuZGVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogMA0KPj4gKFhFTikgIG92
ZXJsb2FkX2JhbGFuY2VfdG9sZXJhbmNlOiAtMw0KPj4gKFhFTikgIHJ1bnF1ZXVlcyBhcnJhbmdl
bWVudDogc29ja2V0DQo+PiAoWEVOKSAgY2FwIGVuZm9yY2VtZW50IGdyYW51bGFyaXR5OiAxMG1z
DQo+PiAoWEVOKSBsb2FkIHRyYWNraW5nIHdpbmRvdyBsZW5ndGggMTA3Mzc0MTgyNCBucw0KPj4g
KFhFTikgQWxsb2NhdGVkIGNvbnNvbGUgcmluZyBvZiAzMiBLaUIuDQo+PiAoWEVOKSBWRlAgaW1w
bGVtZW50ZXIgMHg0MSBhcmNoaXRlY3R1cmUgNCBwYXJ0IDB4MzAgdmFyaWFudCAweGYgcmV2IDB4
MA0KPj4gKFhFTikgQ1BVMDogR3Vlc3QgYXRvbWljcyB3aWxsIHRyeSAxIHRpbWVzIGJlZm9yZSBw
YXVzaW5nIHRoZSBkb21haW4NCj4+IChYRU4pIEJyaW5naW5nIHVwIENQVTENCj4+IChYRU4pIEFz
c2VydGlvbiAnIWxwYWVfaXNfdmFsaWQoKmVudHJ5KScgZmFpbGVkIGF0IGFyY2gvYXJtL2RvbWFp
bl9wYWdlLmM6NjkNCj4gDQo+IFNvIHRoaXMgaXMgYXNzZXJ0aW5nIGJlY2F1c2UsIHNvIGZhciwg
Zm9yIHNlY29uZGFyeSBDUFVzLCB3ZSBhcmUgY29weWluZyB0aGUgY29udGVudCBvZiB0aGUgQ1BV
MCByb290IHRhYmxlIHRvIHRoZSBzZWNvbmRhcnkgQ1BVIHJvb3QgdGFibGUgYW5kIHRoZW4gdXBk
YXRlIHRoZSBlbnRyeS4NCj4gDQo+IFNvIHRoZSBlbnRyeSB3b3VsZCBsb2dpY2FsIGJlIHZhbGlk
LiBUaGlzIGlzIGZpbmUgdG8gYmUgdmFsaWQgYmVjYXVzZSB0aGUgcm9vdCBhYmxlIGlzIG5vdCB5
ZXQgbGl2ZS4NCj4gDQo+IEkgaGF2ZSBmb2xsb3ctdXAgcGF0Y2hlcyAobm90IHlldCBzZW50KSB3
aGVyZSB0aGUgcm9vdCB0YWJsZSBmb3Igc2Vjb25kYXJ5IENQVXMgd291bGQgYWxzbyBiZSBsaXZl
LiBJIHByb2JhYmx5IG1pc3Rha2VubHkgdGVzdGVkIHdpdGggdGhvc2UgcGF0Y2hlcy4NCj4gDQo+
IEFueXdheSwgdGhlIEFTU0VSVCgpIGhlcmUgZG9lc24ndCBtYWtlIHNlbnNlIGluIHRoZSBjb250
ZXh0IG9mIHRoaXMgcGF0Y2ggYmVjYXVzZSB3ZSBhcmUgc3RpbGwgc3dpdGNoaW5nIHRoZSBDUFUw
IHJvb3QgdGFibGUuIFNvIEkgd2lsbCBkcm9wIHRoZSBBU1NFUlQoKSBmb3Igbm93Lg0KPiANCj4g
SSB3aWxsIHJlLWludHJvZHVjZSBpdCBpbiBhIGZvbGxvdy11cCBzZXJpZXMuDQo+IA0KPiBCZWZv
cmUgSSBzZW5kIGEgbmV3IHZlcnNpb24sIGRvIHlvdSBoYXZlIGFueSBjb21tZW50cyBmb3IgdGhl
IHJlc3Qgb2YgdGhlIHBhdGNoZXM/DQoNCkhpIEp1bGllbiwNCg0KWWVzIGFzIHlvdSBwb2ludGVk
IG91dCwgdGhlIGFzc2VydCB3YXMgbm90IHJpZ2h0IGluIHRoYXQgY29udGV4dCBhbmQgaXQgY2Fu
IGJlIHJlbW92ZWQgd2l0aG91dCBpc3N1ZXMsIEnigJl2ZSBoYWQgYSBsb29rIG9uIHRoZSBzZXJp
ZSBhbmQgdGhlIGNoYW5nZXMgbG9va3Mgb2sgdG8gbWUsIEnigJl2ZSBhbHNvIHRlc3RlZA0KdGhh
dCBpdCB3b3JrcyBvbiBhcm02NCBhbmQgYXJtMzIgdXNpbmcgRlZQLg0KDQpDaGVlcnMsDQpMdWNh
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

