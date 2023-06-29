Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC3741DA6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 03:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556638.869329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEgaM-00025f-By; Thu, 29 Jun 2023 01:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556638.869329; Thu, 29 Jun 2023 01:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEgaM-00023y-6j; Thu, 29 Jun 2023 01:36:38 +0000
Received: by outflank-mailman (input) for mailman id 556638;
 Thu, 29 Jun 2023 01:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8DWp=CR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qEgaK-00023s-C4
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 01:36:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61b9be6c-161d-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 03:36:35 +0200 (CEST)
Received: from AS4P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::10)
 by DU0PR08MB8709.eurprd08.prod.outlook.com (2603:10a6:10:403::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 01:36:29 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5db:cafe::7) by AS4P189CA0019.outlook.office365.com
 (2603:10a6:20b:5db::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.39 via Frontend
 Transport; Thu, 29 Jun 2023 01:36:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.20 via Frontend Transport; Thu, 29 Jun 2023 01:36:28 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Thu, 29 Jun 2023 01:36:28 +0000
Received: from 8800993d7808.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0959975A-F94C-40C9-A5B0-C8AD33D3CE20.1; 
 Thu, 29 Jun 2023 01:36:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8800993d7808.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Jun 2023 01:36:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7628.eurprd08.prod.outlook.com (2603:10a6:10:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 01:36:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 01:36:15 +0000
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
X-Inumbo-ID: 61b9be6c-161d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gML+nZhSG5f4qvfAwSeQSpHK5dq849Is9ioXCMo4AxY=;
 b=iD99IzbRo76ecYv/zZYlhVSPov/dqruHA/lqBroaCI8MgdI5NarnXNZHymLmgVA7NaUlPyiQINqE038I7SzchbRzp8XQlOYjhMIf7rLg5Kg5Z+lbO/oSi4272+/6ZvZYoUC34jR2vHq76+6hiaz8CP1NfllqP6U3mJrKo5/TlEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEB4AXeL4ji5E/fNS0v6hyIVCgCLNOFwYiNTmhNEajJuYC5Maczi0RdaDsqMfW1KI1X5hwdVTjluuq0g+lAg7HnG25ZmR8IKfuE+A81SgA/vYMSb13NoKt3eqW33osMwlL7GMm8iBpTjUpXOGkcB+bQhDhR23rx+g6DABcXRLO4ez7lLcHbXLyhgWTsVdiZeqysmQU9IDw25J7k5ir1zRCR4KvNcrJvr5ZbW35J6FaKXIQRnrxlHw/6kaobl0cXkFmAbCMg+O9447nB1AGgB6Z+Vca9QkwHR3OPu+9Ke/IY3Fsmzi0UThFuTMCFg0sgmaiGNKvMgaccNwDbXh//jCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gML+nZhSG5f4qvfAwSeQSpHK5dq849Is9ioXCMo4AxY=;
 b=AScJShIyntSLigHQDFcdb0/+rd1ddvO6fMK3turmI7jvozAAH47jh2xbyJLZHUU77Yj2SJsDOOskOmOw7joT10DRZ9S2+crk273n+lgkHzH458mZwaaNyaMIJ9pkzOj5/ZDZlytcSEaMkY1Lc0n3hwYBPJ5bsQin0HZseq3JS/20pbZlKcP/PoTxn/6NPFNLQ4VJM/kRk9FPK5/bFoeBV0iGWzAOf4Us1uLoJBAZf6fHEPVDkXbpSw22jpVnv9YSIeXHSsWBk1qzbFLxhH3Ef6OQt98+nhYOyTFqTm4zh6pu/wEJSwtheSFdrO9DazpIoc7mCzm7UGa+fFMcCU4n4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gML+nZhSG5f4qvfAwSeQSpHK5dq849Is9ioXCMo4AxY=;
 b=iD99IzbRo76ecYv/zZYlhVSPov/dqruHA/lqBroaCI8MgdI5NarnXNZHymLmgVA7NaUlPyiQINqE038I7SzchbRzp8XQlOYjhMIf7rLg5Kg5Z+lbO/oSi4272+/6ZvZYoUC34jR2vHq76+6hiaz8CP1NfllqP6U3mJrKo5/TlEA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Thread-Topic: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Thread-Index: AQHZp6aSsRUjsp5X0kuhcvqBjbjyw6+crs2wgAQCCQCAAFHGkA==
Date: Thu, 29 Jun 2023 01:36:15 +0000
Message-ID:
 <AS8PR08MB7991CE92396A70CBAEDFF0039225A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3caaf967-b7ba-0915-56aa-aeff5450a456@xen.org>
In-Reply-To: <3caaf967-b7ba-0915-56aa-aeff5450a456@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2310FF061AFF8F4F93E80248C0184DF9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7628:EE_|AM7EUR03FT063:EE_|DU0PR08MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: d88db992-2811-4ea7-aa72-08db784142ad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Smt2T/KaemsaS4M18vIbAj50qAeR5QmUvx1Z7kMbAKsdHvldDhCJcqEPoy99FJeRM2KeY5giRu9B+Ker+0pIuyhdv/G0J9MWbpyJwfOIbhJRDTYqvwu5bGC06AAOKLNcMveunbhWfLvayL+3MUc0Bvrp8r1r7X7rWHspHOdAhFIIlWZ7bYOiUy/t+ClsfnE2UXcgq0wCMhJmUZaAZVOv6i+gJglnASktE0J8IFgKBPtjIBV/CkjC/n+mwZE+7D/K8DzTarLi9RouWy30JTn3uGCWBUnad9DitzFiVhFruvBl8Xp/lqlfQ7aI1sV3sLppXcPMWLIle5abLNcep01DtQwEoeasZUatRVE3P7GBMjY+uMUKEbllpqMTcu+hGi0ckwm6fcSMy1yqW78nytslge1/KpXaMUig4EBFWFZpusiOCDpOvrdsD5RXPP6B3cp0L3PWobDga14NHdVlpyE4obOiVULj8PJGnPK0UQxtVNiUzKj+bDsh9cyduI2JXAYj1htx+bUxkJmThhvf5mGfcqAe9QkPH4S8H4bZ2uGloUpPHCzKnz61qherzPrd751vOSEH2R/ah/WVWGWso0lMa70d7N5eJlDFyV6WJe4Afk0SpwunJYUmoenlleyBUcNL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(7696005)(71200400001)(478600001)(76116006)(110136005)(54906003)(83380400001)(33656002)(86362001)(38070700005)(55016003)(2906002)(66946007)(186003)(53546011)(9686003)(6506007)(26005)(122000001)(38100700002)(66476007)(66446008)(64756008)(4326008)(66556008)(316002)(41300700001)(8936002)(8676002)(5660300002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7628
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94d95642-0ec1-459e-c47f-08db78413abc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FLj93aUFmbBalC9T/SqjsYMyCK2Fev6pEyoWwoprFr3QrmMHCoMWn3Y7XwkDWlx/RjzvDVXGXjTKGRJgwIKlwXI8V3XCbRqppYrbfJmWd0Z2SvbTBsX5mORecD1o5gT0Oj1DrM8+1WRir0w72K4Es9Z2ViEaW/LRlQqPcMsWDwnYd2HH3YlwBv3LlI5bTfJIsfW1M8oO35fnhWBfBjGWvHM/phIncZT5n4w5SG9CdimrQDjAd1n55uDZfOgVdKxH+oL9mXMKAL5MyKQabZEwoW6Aaya1/i90fwiKRLMMv5MaMdkTwgqSDuOsREact8OfHj5CUGlEbd7SFQz/ufRLp6U2GTnWuIZVHtKo0gWuq1+3GZQqdh9gl2F5k8+hZjkXCMOOO6tBUVNycgN1hT2NfE5v9HnzhXbh4TJi0h8yxd7mI6XJak6/rL7R025z+yk20ieFTNNdQ219pCRjW5CymwiXiUZd+HZg7HNzXlY4M3X/ag9ngM6u74cx5coUMD8DeWV2TuixV1O7Q/P7ZI1G9Nhhet7Wa2gy8jxcJorc0GDC5BuRpMmqpOknENCV/yQv4PB0NN/525dcIfe4JEINoZX02Dyxn7C3Mr6x7knqELcs10cSWQQ60OhHgeJNHMdD5YwGInZh3ASkKVDCPsI2NPsXvmSV+s9Ough+hDebUrm/CebvhSCHwDYNzLZ4uI0jhhLA3tL68t+RtqeTHrHvE/G3GZvy2Jr52bVBwUpIy0LNLWE0Ts92O+3FQ/adoHKA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(47076005)(110136005)(478600001)(107886003)(52536014)(54906003)(186003)(336012)(7696005)(26005)(83380400001)(53546011)(2906002)(6506007)(9686003)(86362001)(41300700001)(70206006)(33656002)(356005)(5660300002)(4326008)(316002)(82740400003)(81166007)(55016003)(70586007)(40460700003)(8936002)(8676002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 01:36:28.9473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88db992-2811-4ea7-aa72-08db784142ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8709

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggOC85XSB4ZW4vYXJtOiBBbGxvdyB0aGUgdXNlciB0byBidWlsZCBYZW4gd2l0aCBV
U0JBTg0KPiANCj4gT24gMjYvMDYvMjAyMyAwODoyOSwgSGVucnkgV2FuZyB3cm90ZToNCj4gPiBI
aSBKdWxpZW4sDQo+IEhpIEhlbnJ5LA0KPiANCj4gPiBSZXZpZXdlZC1ieTogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiANCj4gVGhhbmtzLCBJIHdpbGwgZml4IGJvdGggdHlwb3Mu
DQoNCkdyZWF0LCB0aGFua3MhDQoNCj4gDQo+ID4NCj4gPiBKdXN0IHdhbnQgdG8gbWFrZSBzdXJl
IHlvdSBhbHNvIG5vdGljZWQgdGhpcywgb3RoZXJ3aXNlIG1heWJlIHlvdQ0KPiA+IGNhbiBpbmNs
dWRlIGFub3RoZXIgcGF0Y2ggaW4gdGhlIHNlcmllcyB0byBmaXggdGhpcz8NCj4gDQo+IEkgaGF2
ZW4ndCBzZWVuIHRoaXMgb25lLiBQcm9iYWJseSBiZWNhdXNlIHlvdSB3b3VsZCBuZWVkIGEgc2V0
dXAgd2hlcmUNCj4gaW50ZXJydXB0cyBhcmUgYXJvdW5kIElEIDEwMjIuDQoNCkkgdG9vayBhIGNs
b3NlciBsb29rIHRvZGF5LCBJIHRoaW5rIHRoZSByZWFzb24gaXMgZnJvbSB0aGlzIGRldmljZSB0
cmVlIG5vZGUNCmZvciB0aGUgRlZQOg0KDQpldGhlcm5ldEAyMDIwMDAwMDAgew0KICAgIGNvbXBh
dGlibGUgPSAic21zYyxsYW45MWMxMTEiOw0KICAgIHJlZyA9IDwweDIgMHgyMDAwMDAwIDB4MTAw
MDA+Ow0KICAgIGludGVycnVwdHMgPSA8MHhmPjsNCn07DQoNClRoZSB2YWx1ZSAweGYgaXMgIHBh
c3NlZCB0byB2Z2ljX2dldF92aXJxX3R5cGUoKSBhcyAiaW5kZXgiIHRoZW4gImludHIiIGluDQpW
R0lDX0lDRkdfTUFTSy4gSGVuY2UgdGhlIDMxIGluDQoiKFhFTikgbGVmdCBzaGlmdCBvZiAxIGJ5
IDMxIHBsYWNlcyBjYW5ub3QgYmUgcmVwcmVzZW50ZWQgaW4gdHlwZSAnaW50JyIuDQoNCj4gDQo+
IE9yIEkgY2FuIGRvIHRoYXQNCj4gPiBpbiBjYXNlIHlvdSBkb24ndCBoYXZlIGVub3VnaCBiYW5k
d2lkdGguDQo+IA0KPiBZb3UgaGF2ZSB0aGUgc2V0dXAgdG8gZXhlcmNpc2UgdGhlIHByb2JsZW0u
IFNvIGl0IHdvdWxkIGJlIGJlc3QgaWYgeW91DQo+IGRvIGl0Lg0KDQpJJ3ZlIHByZXBhcmVkIGJl
bG93IG9uIHRvcCBvZiB5b3VyIHNlcmllczoNCi0jZGVmaW5lIFZHSUNfSUNGR19NQVNLKGludHIp
ICgxIDw8ICgoMiAqICgoaW50cikgJSAxNikpICsgMSkpDQorI2RlZmluZSBWR0lDX0lDRkdfTUFT
SyhpbnRyKSAoMVUgPDwgKCgyICogKChpbnRyKSAlIDE2KSkgKyAxKSkNCg0KSWYgeW91IHRoaW5r
IGl0IGlzIG9rLCBJIHdpbGwgc2VuZCBpdCBvdXQgdG8gdGhlIGxpc3QgYWZ0ZXIgSSBkb3VibGUg
Y2hlY2sgb3VyDQpDSSB3aWxsIG5vdCBjb21wbGFpbiBhYm91dCBpdC4gVGhhbmtzIQ0KDQpLaW5k
IHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3Jh
bGwNCg==

