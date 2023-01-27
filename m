Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33967E357
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485479.752733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMwq-00006Y-B7; Fri, 27 Jan 2023 11:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485479.752733; Fri, 27 Jan 2023 11:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMwq-0008Vg-8S; Fri, 27 Jan 2023 11:31:12 +0000
Received: by outflank-mailman (input) for mailman id 485479;
 Fri, 27 Jan 2023 11:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLMwp-0008Va-5S
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:31:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16fa9ea8-9e36-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:31:07 +0100 (CET)
Received: from AM9P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::20)
 by GV2PR08MB8415.eurprd08.prod.outlook.com (2603:10a6:150:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:31:04 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21f:cafe::dd) by AM9P195CA0015.outlook.office365.com
 (2603:10a6:20b:21f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.34 via Frontend
 Transport; Fri, 27 Jan 2023 11:31:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 11:31:03 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Fri, 27 Jan 2023 11:31:03 +0000
Received: from 70e776e21b2d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3F33F0F-204F-44A3-A24C-7C7C8E0E47A1.1; 
 Fri, 27 Jan 2023 11:30:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70e776e21b2d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:30:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6617.eurprd08.prod.outlook.com (2603:10a6:10:261::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 11:30:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:30:50 +0000
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
X-Inumbo-ID: 16fa9ea8-9e36-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvrLCKSqW/H2c7Qr2QEItyxX61XTnTMZ1d6vVkbNZgQ=;
 b=35NL6ftIIdjmXUgHlQIRBRYzcZhfAU+CJYETpy7W059GoAv4KS7BMTm/IYxESSL+ysztr0mBNt39AkhjureyNKH8XG8nqiIZbP1N59qO0MxgOPueowdU6uSREJRGgv4Eg4mqSC2HUloSxfQalG8Wc0PevTdWRPyHSI8ze/Wz3BA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+Qehr9IvC84WC2mxQbjg2izbf8m4t3f8M74iycxILtrIUpIotLOx3ri7G/wGBYkWDqj9ReTAXEuKPQLGLfcMnEFU+ZrNkW/i17roicMj9OfEVhx1lpfFHOty05FPTE0d3xWFg0LqOIoMlL/PEPG8kNtVANma7iNp1muCPVHTE+t7wLpQcQpRKpms/QtQZLJTDwMgOLTJOvvJcqpCiIv6X90dFiDC7+gcJHPsb96nJXL/YANPXPaP7Jg8iwT4TjHSpisOQ6Bo+jEHbqtTc2hrt3bnVNonR1ZOTWyC5uwmvm2f69IRQu0pMP/peq0lTQsClqwqrYJLL2+B/WYWjoR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvrLCKSqW/H2c7Qr2QEItyxX61XTnTMZ1d6vVkbNZgQ=;
 b=EMPFRIeCl/57HYjJiXNByxAx/MLcHHYiyG+UT6qJYHjCT1BUcQF8kFqvsozTVVUARya52LG9vLmGKuUzmWXKtDBKXs3hu6MPCnb5z0Sli++n9fwAgi6gsviksqnMLk0GhdCgDqjZ+hhpC95JCrWaTbx+OJBOIZMimjh/IHW3d6q71yjwLjJRZgc+APR3P7BzAVHrh6NeMwA30Z/jzIk2Vyyxd/jC2E/O9KuPiRvXh08dv4+9D/BNMndNc1N5gRdPs5/x7mXShra0bxVub3roqS8idWGmJVP9VZ6rPvUmg7G7fMznNu9chuzn9yZnUTIhGquno/6l2E8pmPrLaInUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvrLCKSqW/H2c7Qr2QEItyxX61XTnTMZ1d6vVkbNZgQ=;
 b=35NL6ftIIdjmXUgHlQIRBRYzcZhfAU+CJYETpy7W059GoAv4KS7BMTm/IYxESSL+ysztr0mBNt39AkhjureyNKH8XG8nqiIZbP1N59qO0MxgOPueowdU6uSREJRGgv4Eg4mqSC2HUloSxfQalG8Wc0PevTdWRPyHSI8ze/Wz3BA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Thread-Topic: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Thread-Index: AQHZKU4eIUricNo750ej72nDJ2giuq6nF8cAgAsT2vCAAASHgIAAAULQ
Date: Fri, 27 Jan 2023 11:30:50 +0000
Message-ID:
 <AS8PR08MB799127D46D09BCFEF9A0392192CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-3-Henry.Wang@arm.com>
 <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
 <AS8PR08MB79913487DBC6F434758EAE5A92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a729bf36-8c67-ccd4-c787-d62aaf7e24b2@xen.org>
In-Reply-To: <a729bf36-8c67-ccd4-c787-d62aaf7e24b2@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 42F48898BF258D41B62FCA0355764BCB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6617:EE_|AM7EUR03FT025:EE_|GV2PR08MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 110071a6-f6a6-4376-b788-08db0059f946
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OL7kGssYL6dkQpJdbLvUK4Xr52njQYPvzGxCCZqGqZK1QPuQu4DZFaqv0cVauMUaetCyQ2m3Lm9CQtyOD1SReUrBPRAuOo/S3bUR4D20/iYqjJxYlu/Ypsp36bdHzJnZCBcwa0RAa3z2Q8aJlf/eKRkQ6VTzRyz58531jY60+t0MHtqTNPdEvSSVgj8KvNSUiYZT0aMAmCUC3xSKDU3ZfJ4RgGeSEBd067ylLUsisNyqJbWE6VwRcC7mGBwsPXD6N2vxYadjtKyjmT1N6A2UmJpue5051c6CCSkCmnvvZF+zuQ4jeQKTczvWBEp4GwtaSnCBW5iUDryu8TOwMfKFgKsCHh2fDsw2iVG60xefCUnW59zBBJ7hdxWG+nmTfCMMAE+3HcYkrVND3ZQ+HnihakBLMTjsBprOnquPC0v+m2bhwLVdBqJzkX99Zlx49btAwxCCD2GqbdjOQ0zzPzp96ajeNsj3GkKVXOmnkgP3REgBPN3LMARXr9jOOx/rxTzbqlvaWKPw78iSZ8eOp88XjsWghJkfvnmYwfl1wun5XRBqyV6jT10poTxuvz7vRR+u9/D6q2nhEwE1lyyVTtiLlyJo23gdd2XpeWqmIaoFGVuL4D3Kzz12Ny28/7Z1KvJg9mNZFkTmgPzD7v4NpRrJ7Wy5ypOnZFfcQP8rJTz7pJxnZ13wZv6syOWXmklzYyTfobm7SeJ97XAb2H3Opqsr/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199018)(54906003)(6506007)(26005)(9686003)(478600001)(71200400001)(186003)(8676002)(66556008)(66446008)(4326008)(316002)(76116006)(110136005)(66946007)(64756008)(66476007)(83380400001)(7696005)(41300700001)(38100700002)(8936002)(52536014)(5660300002)(2906002)(122000001)(38070700005)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6617
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f417748-75dc-4b1b-7077-08db0059f136
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SNMpz2/HOspYOn8P1RkaID8o5GIUn7xnm8osh85GYiHydsJycVeFQz35AouuWnIh70Gye9WbdQdMK6Ln2ykCeyRiMF37pMeMWqqAg3M06P9//sRK19tDbaZdTOzRCYsrm9LtVs0ytG30u0rI87CNT+bIu+Lk/FmgKJmbrOnB76/HrzodTQs0W2XxW602YDvzxasgaAceuo3Wuzxd9Di9t4yi8nAozTyNPsI4aSEPCxOyImfdY8qHH+GorJxbLjNd5xeK43zxSZrYHq73k/kCBgC0AUHhu2ETvF0AKmUDp+P0A8Wt6sj2DTwS9enD3fAOGSEdaFMc3wXsne1fOl3BD5oQBJfJECjzXTdMsmne0UcEdsQLMNQtB6MkUEBUkMRhGnBEf+5Vyxtzs0on7n38fllxgHNN89mLECPVfCLq0WM9p80Owyz3m+oF6al29EWGdXyBVFenvp5laLno686xhcy1TJUOru5iH/2/VQx5MhT/cQmj4EtADZT5YoihRf1kkJ1t7+EoNT69wcOy4UbFQon8tQ9UAAz8AUAZ0Gz0/0GzN9VRp6Fz7bBN48vlsivVIz8fG2cZq2TSxi6NlRQ95bxwH0Lt5VTwM5qnujT6Tp4qEZyUP3iY0Fj6tiaV+bFEmnTU0XzYLDSTKu3npGRoLayzg0J6VmHkjocZYPf3Mo0ZggKNg5kO0GM4SvRBHMS3M/7HbwaKhM1BwLzSKYuhQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(36840700001)(40470700004)(46966006)(7696005)(55016003)(8676002)(40480700001)(316002)(54906003)(110136005)(83380400001)(47076005)(107886003)(478600001)(336012)(40460700003)(26005)(6506007)(186003)(9686003)(82310400005)(5660300002)(4326008)(70586007)(70206006)(41300700001)(8936002)(2906002)(52536014)(86362001)(81166007)(356005)(36860700001)(33656002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:31:03.6682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110071a6-f6a6-4376-b788-08db0059f946
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8415

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSB4ZW4v
YXJtOiBEZWZlciBHSUN2MiBDUFUgaW50ZXJmYWNlIG1hcHBpbmcgdW50aWwNCj4gdGhlIGZpcnN0
IGFjY2Vzcw0KPiANCj4gSGksDQo+IA0KPiA+Pj4gQEAgLTE1Myw2ICsxNTMsOCBAQCBzdHJ1Y3Qg
dmdpY19kaXN0IHsNCj4gPj4+ICAgICAgIC8qIEJhc2UgYWRkcmVzcyBmb3IgZ3Vlc3QgR0lDICov
DQo+ID4+PiAgICAgICBwYWRkcl90IGRiYXNlOyAvKiBEaXN0cmlidXRvciBiYXNlIGFkZHJlc3Mg
Ki8NCj4gPj4+ICAgICAgIHBhZGRyX3QgY2Jhc2U7IC8qIENQVSBpbnRlcmZhY2UgYmFzZSBhZGRy
ZXNzICovDQo+ID4+PiArICAgIHBhZGRyX3QgY3NpemU7IC8qIENQVSBpbnRlcmZhY2Ugc2l6ZSAq
Lw0KPiA+Pj4gKyAgICBwYWRkcl90IHZiYXNlOyAvKiB2aXJ0dWFsIENQVSBpbnRlcmZhY2UgYmFz
ZSBhZGRyZXNzICovDQo+ID4+IENvdWxkIHlvdSBzd2FwIHRoZW0gc28gdGhhdCBiYXNlIGFkZHJl
c3MgdmFyaWFibGVzIGFyZSBncm91cGVkPw0KPiA+DQo+ID4gU3VyZSwgbXkgb3JpZ2luYWwgdGhv
dWdodCB3YXMgZ3JvdXBpbmcgdGhlIENQVSBpbnRlcmZhY2UgcmVsYXRlZCBmaWVsZHMgYnV0DQo+
ID4gc2luY2UgeW91IHByZWZlciBncm91cGluZyB0aGUgYmFzZSBhZGRyZXNzLCBJIHdpbGwgZm9s
bG93IHlvdXIgc3VnZ2VzdGlvbi4NCj4gDQo+IEkgd291bGQgYWN0dWFsbHkgcHJlZmVyIHlvdXIg
YXBwcm9hY2ggYmVjYXVzZSBpdCBpcyBlYXNpZXIgdG8gYXNzb2NpYXRlDQo+IHRoZSBzaXplIHdp
dGggdGhlIGJhc2UuDQo+IA0KPiBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byB1c2UgYSBzdHJ1
Y3R1cmUgdG8gY29tYmluZSB0aGUgYmFzZS9zaXplLiBTbw0KPiBpdCBpcyBldmVuIGNsZWFyZXIg
dGhlIGFzc29jaWF0aW9uLg0KPiANCj4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24g
ZWl0aGVyIG9mIHRoZSB0d28gYXBwcm9hY2ggSSBzdWdnZXN0ZWQuDQoNCk1heWJlIHdlIGNhbiBk
byBzb21ldGhpbmcgbGlrZSB0aGlzOg0KYGBgDQpwYWRkcl90IGRiYXNlOyAvKiBEaXN0cmlidXRv
ciBiYXNlIGFkZHJlc3MgKi8NCnBhZGRyX3QgdmJhc2U7IC8qIHZpcnR1YWwgQ1BVIGludGVyZmFj
ZSBiYXNlIGFkZHJlc3MgKi8NCnBhZGRyX3QgY2Jhc2U7IC8qIENQVSBpbnRlcmZhY2UgYmFzZSBh
ZGRyZXNzICovDQpwYWRkcl90IGNzaXplOyAvKiBDUFUgaW50ZXJmYWNlIHNpemUgKi8gICAgDQpg
YGANCg0KU28gd2UgY2FuIGVuc3VyZSBib3RoICJiYXNlIGFkZHJlc3MgdmFyaWFibGVzIGFyZSBn
cm91cGVkIiBhbmQNCiJDUFUgaW50ZXJmYWNlIHZhcmlhYmxlcyBhcmUgZ3JvdXBlZCIuDQoNCklm
IHlvdSBkb24ndCBsaWtlIHRoaXMsIEkgd291bGQgcHJlZmVyIHRoZSB3YXkgSSBhbSBjdXJyZW50
bHkgZG9pbmcsIGFzDQpwZXJzb25hbGx5IEkgdGhpbmsgYW4gZXh0cmEgc3RydWN0dXJlIHdvdWxk
IHNsaWdodGx5IGJlIGFuIG92ZXJraWxsIDopDQoNClRoYW5rcy4NCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

