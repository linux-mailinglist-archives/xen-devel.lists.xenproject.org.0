Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403B2C52E4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 12:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38445.71196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiFRC-0003MJ-CJ; Thu, 26 Nov 2020 11:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38445.71196; Thu, 26 Nov 2020 11:27:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiFRC-0003Lu-8b; Thu, 26 Nov 2020 11:27:46 +0000
Received: by outflank-mailman (input) for mailman id 38445;
 Thu, 26 Nov 2020 11:27:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/AcN=FA=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kiFRB-0003Lp-Ag
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 11:27:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c8de043-975e-475b-942b-d6f8e7f5e25d;
 Thu, 26 Nov 2020 11:27:41 +0000 (UTC)
Received: from AM5PR0101CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::15) by AM6PR08MB3942.eurprd08.prod.outlook.com
 (2603:10a6:20b:ae::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 11:27:39 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::ff) by AM5PR0101CA0002.outlook.office365.com
 (2603:10a6:206:16::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 11:27:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 11:27:38 +0000
Received: ("Tessian outbound 814be617737e:v71");
 Thu, 26 Nov 2020 11:27:38 +0000
Received: from a8219809ac76.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A75FA5D-B2A4-463E-84E7-55875CC6A2F0.1; 
 Thu, 26 Nov 2020 11:27:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8219809ac76.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Nov 2020 11:27:33 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM9PR08MB6113.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 26 Nov
 2020 11:27:31 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3564.038; Thu, 26 Nov 2020
 11:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/AcN=FA=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1kiFRB-0003Lp-Ag
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 11:27:45 +0000
X-Inumbo-ID: 5c8de043-975e-475b-942b-d6f8e7f5e25d
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [40.107.8.53])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c8de043-975e-475b-942b-d6f8e7f5e25d;
	Thu, 26 Nov 2020 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlRhY5zI3gi19diGyTXD/jtWW9MUoHcXlvRARRmEDus=;
 b=TlwtFpqhkJDzsaeqC5xRSf4ADLPS8M3WD9IC9qJEOiThWfT5lfYl7o86NY8GWA2KtSoSqi0i8Eux4xhhE5Rx+EprHnkrAZad6aWhklAeQLZgLiHf+h74TpbAIeFT2LwiEzEdihjTGQCirpXAM/K8ldlDPpchmFDuzx0EkJJGDxI=
Received: from AM5PR0101CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::15) by AM6PR08MB3942.eurprd08.prod.outlook.com
 (2603:10a6:20b:ae::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 11:27:39 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::ff) by AM5PR0101CA0002.outlook.office365.com
 (2603:10a6:206:16::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 26 Nov 2020 11:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 26 Nov 2020 11:27:38 +0000
Received: ("Tessian outbound 814be617737e:v71"); Thu, 26 Nov 2020 11:27:38 +0000
X-CR-MTA-TID: 64aa7808
Received: from a8219809ac76.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0A75FA5D-B2A4-463E-84E7-55875CC6A2F0.1;
	Thu, 26 Nov 2020 11:27:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8219809ac76.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Nov 2020 11:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoVXJk5nRRb5fbUxMXK4DvXB7jabd+zqeHeiRu9Q29RQq4j8aZ0eBUlHTwaIM9xnbhaQZrU16EnZn/AntdtleDCOlohvc3hvqeT+MKHb3fFaVRCef6QzmRnqLpx0yKpqw0ntb5WnRrXXRgiSYbK8XK5+hwZH2avQpiFnYwLf//sP43BQ2NnakogwK7YhrhWx++jKwkuEDUz/CvZWnGhvgCPnKSTOYwMrhxannwzkvavwVxpbgtO/4fMMliXftgKn4+FT/38ZSWC2pOiN8PsXkiEqZYjXy3Hhoxnz/crQnd7iWg31Q3x7TOQOJ3JAQRZg3T+OG7Ja7zCauCz6qlfgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlRhY5zI3gi19diGyTXD/jtWW9MUoHcXlvRARRmEDus=;
 b=eYWFo5PuBARuRS5S9L44T3cavM5JU+AeqGznAInFUIgh5sSBmdZiqzwxn9UWf2xeU5zcDFYg9Y+/XQtBkawDkUjiPphr70DMMLB4FOP5qgWzcZYBm5RoKt5CT/srBgZWIWodGtekXYhDa3GBp+5S4V4DavVl2q8wo6SZcJ6DN8N61KdN/lMjwyjTIL7FU27QLUo30/U/uQQCFB77qCz7xFqDXB2Qk+U6I/C9mrU55vE5ZmEvf4kb44HVcKCafbT2Js2EWGHXLpS2qgB+DQFIhcYWS8P8sLS4F8bFdLfrQA8kLSIzQzoEZ0CukH0zsUmxcxw3ASp7MVJShNAAD7htkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlRhY5zI3gi19diGyTXD/jtWW9MUoHcXlvRARRmEDus=;
 b=TlwtFpqhkJDzsaeqC5xRSf4ADLPS8M3WD9IC9qJEOiThWfT5lfYl7o86NY8GWA2KtSoSqi0i8Eux4xhhE5Rx+EprHnkrAZad6aWhklAeQLZgLiHf+h74TpbAIeFT2LwiEzEdihjTGQCirpXAM/K8ldlDPpchmFDuzx0EkJJGDxI=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM9PR08MB6113.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 26 Nov
 2020 11:27:31 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3564.038; Thu, 26 Nov 2020
 11:27:31 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, nd
	<nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index:
 AQHWtnF2jWNIb4RgFU+PRE0mwpdPDam/tA6AgAW2ODCAFDcMgIAAINyAgACWHQCAAAX2cA==
Date: Thu, 26 Nov 2020 11:27:30 +0000
Message-ID:
 <AM0PR08MB37478D884057C8720ED1023D9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
 <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
 <AM0PR08MB3747B42FC856B9BDF24646629EE60@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2011251554070.7979@sstabellini-ThinkPad-T480s>
 <AM0PR08MB3747912905438DA6D7FF969C9EF90@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <8f47313a-f47a-520d-3845-3f2198fce5b4@xen.org>
In-Reply-To: <8f47313a-f47a-520d-3845-3f2198fce5b4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2B8AC37D8A6C7C4AA8DFDA5DE1C4B0F3.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [218.82.32.45]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6b17993-8e34-449c-c72c-08d891fe47dd
x-ms-traffictypediagnostic: AM9PR08MB6113:|AM6PR08MB3942:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB39423CB06A327728D0AE91D39EF90@AM6PR08MB3942.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sJTo6Nr86+SxOlexg9H2TY3SMOZa9kpcP9lwQd3qyIIgVCuMVhilGTUKDHJuD+0sM5W3QZ+QlTF7zay1uhVsFc3yQKIPaoSp4nQEb8cq7Q8rqJfL7iwaBcH/w1bcqGC/FFkFuyHE6VzTKSqL5F1dfj3gHCHVAAmdVT1XOIZaIrFEWvTcm1jN2xTs+GLBwjImk84J8+F4+/hVtrnn+YiryMc7D3sj9UnenxyUUX6ZSCUEyGBN2Yk1Rl/CXaRav6T0bLECH2KdLBP642YjEP/eKvgjmyNBIJ4Oxeys7gLPiaTkdabB86n4o5NeT9xwMrulK716aDIA39ITJeYrl3yYJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(66446008)(4326008)(186003)(66476007)(66946007)(2906002)(316002)(110136005)(54906003)(9686003)(7696005)(478600001)(55016002)(53546011)(26005)(6506007)(33656002)(66556008)(76116006)(5660300002)(8936002)(8676002)(64756008)(71200400001)(83380400001)(52536014)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?dFZpVXEvbnJxUTlFemcycVRDZXpYWlluTEVHT0pUdXRtUjVzQTBZdnZScDIw?=
 =?utf-8?B?TGZ5dDFOSWsxMEFDZkt4SHNGREhRU1NoT09ieGlBYjVjR3orSDQxVndkb0lw?=
 =?utf-8?B?OTR4blNOUDUweUo1bjB5Q1lEWEQ1Mk1jM1ViNmxaWExyY05USXJjWHR4YnFY?=
 =?utf-8?B?eEVMZVlYdkRURXlvQXp4MWlQMkR4UWtYUm83VUVwRFp1d29vaTdNbUZEeEdt?=
 =?utf-8?B?dGpqSFFoTlA5Q2M1WnRmVFIxNEtGem40Y1NvZGp3cVR3SDEvWkpOclg3TjB6?=
 =?utf-8?B?WnNvclVOdUxMUTdEN2IwVmVyakl2VXVoMUd4QkU2MjZpcC9oMElVNUVPQjZE?=
 =?utf-8?B?WG9ldTgvaSt5R2hoeko4WFNwNjdZNDJ1RFc1cHA1T3VWQjlFUmhGVHRLSmty?=
 =?utf-8?B?Y0NxZlZmR29GQ1R1QzdEZnQ5Y0FGazh1eEZ0cmxlbUVuZjRvZUxXcUNWK1ZT?=
 =?utf-8?B?eUFtemE5amVmeU1RdTRTMUt3cmdJRzFFZS9SVGZXR0MvZU9NODdpNnR4SHQ2?=
 =?utf-8?B?MktGMCtBNWdBcHM4NTBYMmNBd1Y0a2llOVk1YU50UlU1UTRaTW1DVG10YjAr?=
 =?utf-8?B?UFU2Y1JTa0RiU1ZBamZvaENuRUl1YkdTTXBCS1FmNGtYQ1dUcFU5aVlBNlZt?=
 =?utf-8?B?cFdWbHZna3ovcmRuSWdGQlVkcTNOenF1a2JhRzdiTml4c3VFc0VNRzhuWXZ1?=
 =?utf-8?B?K1Z5S2RBSTFtYkV0UnVybnZselB6OUwvUWlkMFJZNjFwMDZ1bkxNQzVneC9u?=
 =?utf-8?B?SmhmTWExNytiMUtLQmdvR2s0UFYveDUzUjIrazNpK3ZpS1FTUDdZQitKWHJH?=
 =?utf-8?B?ZlRZYlRSZVZMNXBEblZHTlRjekJlTVFibEVEcDQyYldrNVlRSGVBNzVlWVRi?=
 =?utf-8?B?dW9YbDZtY0NQaUNHVUp4Q0pvWkdlM0xkaDFwcHJrRUpDUXlVTzhVbTNNWHQ2?=
 =?utf-8?B?SzA0cWgwRWE5N2JCdlFoUEZFVWU1cmYwSi9VRzNpMXNqTFpFSk13dGlHTERN?=
 =?utf-8?B?RFVtWFNZTWY3UE13dFdKSHVPZE5SdnREZ3NTSHBMNGNsR2FnRWtEYlRkZCtt?=
 =?utf-8?B?WkV1aFQ2VkpYMmsxSU1MRlF2eS9ZU2xRaFR2YTRvc1ZCdXBoZ2ZHS2dMSjNG?=
 =?utf-8?B?cTRJTWFWdHZRbWwvUTd6dXRsdGQ2L1V2RHlGN0owOUY1MkxOL3RZM3o5S2k3?=
 =?utf-8?B?ZEt6akZqTk45NURFSmc2T2dvZ0N2MXlxR0NJTzRUSHNJTkI1Rm5oekZXUlJr?=
 =?utf-8?B?SmtqbVFPeDd5ekFOb0wydG1WYUtuTnFwWDJ2eWVMOEZGWVR1blJDdzdLSk5I?=
 =?utf-8?Q?dyj6s/SV3l37U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6113
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d945a67-cbc7-4464-29da-08d891fe4353
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Iqs6gsCsJZOS3KymXfG/5wh0PWzaKk6QXHlGn0kf2EACnmJzMoRq+82+RoHyHmpdWkmFW2faJ6A1BqOtI2bujw3tasL2ZF9bfNuEhzV4hiwUOTYCtZ9G1Jabn911xjrOs6I4rL3x20IM3hvK/hhD8SaYfz7wq5ZiVDGZuEcNcuVDKq9iiYazZNr0Osg6zAVBCOi/43N8S17UgYLn6cuBWLx+drBcuUnR9kK7CJQMdPhSV9R5nyjR+fdMha4I3yXOZrbSRnn7+PGTYTB1gbbT1j8plvaOwFP860ZYOWW3htM0k3wzb//RRtTmljdsE5u/2egexlZ4++y6hqOQmptC95rARdr116EYaxdmluKOwvk8ej2vCJB7Ts/ObmKLI5tQgWgFvgxa8tWa9oacfHwLA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(478600001)(82310400003)(86362001)(83380400001)(7696005)(26005)(4326008)(82740400003)(81166007)(336012)(356005)(186003)(47076004)(54906003)(9686003)(5660300002)(2906002)(8676002)(6506007)(53546011)(316002)(110136005)(70586007)(8936002)(70206006)(33656002)(52536014)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 11:27:38.4693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b17993-8e34-449c-c72c-08d891fe47dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3942

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjDlubQxMeaciDI25pelIDE4OjU1
DQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bh
cm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBBbmRyZSBQcnp5d2Fy
YSA8QW5kcmUuUHJ6eXdhcmFAYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT47IEthbHkgWGluIDxLYWx5LlhpbkBhcm0uY29tPjsgbmQNCj4gPG5k
QGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06IEFkZCBDb3J0ZXgtQTcz
IGVycmF0dW0gODU4OTIxIHdvcmthcm91bmQNCj4gDQo+IEhpIFdlaSwNCj4gDQo+IFlvdXIgZS1t
YWlsIGZvbnQgc2VlbXMgdG8gYmUgZGlmZmVyZW50IHRvIHRoZSB1c3VhbCBwbGFpbiB0ZXh0IG9u
ZS4gQXJlDQo+IHlvdSBzZW5kaW5nIHRoZSBlLW1haWwgdXNpbmcgSFRNTCBieSBhbnkgY2hhbmNl
Pw0KPiANCg0KSXQncyBzdHJhbmdlLCBJIGFsd2F5cyB1c2UgdGhlIHBsYWluIHRleHQuDQoNCj4g
T24gMjYvMTEvMjAyMCAwMjowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4gSGkgU3RlZmFubywNCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IDIwMjDvv73vv70x
Me+/ve+/vTI277+977+9IDg6MDANCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
Pg0KPiA+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFBlbm55IFpoZW5nIDxQ
ZW5ueS5aaGVuZ0Bhcm0uY29tPjsNCj4geGVuLQ0KPiA+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgQW5kcmUgUHJ6eXdhcmENCj4gPj4gPEFuZHJl
LlByenl3YXJhQGFybS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiA+PiBLYWx5IFhpbiA8S2FseS5YaW5AYXJtLmNvbT47IG5kIDxuZEBhcm0u
Y29tPg0KPiA+PiBTdWJqZWN0OiBSRTogW1BBVENIXSB4ZW4vYXJtOiBBZGQgQ29ydGV4LUE3MyBl
cnJhdHVtIDg1ODkyMSB3b3JrYXJvdW5kDQo+ID4+DQo+ID4+IFJlc3VtaW5nIHRoaXMgb2xkIHRo
cmVhZC4NCj4gPj4NCj4gPj4gT24gRnJpLCAxMyBOb3YgMjAyMCwgV2VpIENoZW4gd3JvdGU6DQo+
ID4+Pj4gSGksDQo+ID4+Pj4NCj4gPj4+PiBPbiAwOS8xMS8yMDIwIDA4OjIxLCBQZW5ueSBaaGVu
ZyB3cm90ZToNCj4gPj4+Pj4gQ05UVkNUX0VMMCBvciBDTlRQQ1RfRUwwIGNvdW50ZXIgcmVhZCBp
biBDb3J0ZXgtQTczIChhbGwgdmVyc2lvbnMpDQo+ID4+Pj4+IG1pZ2h0IHJldHVybiBhIHdyb25n
IHZhbHVlIHdoZW4gdGhlIGNvdW50ZXIgY3Jvc3NlcyBhIDMyYml0IGJvdW5kYXJ5Lg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBVbnRpbCBub3csIHRoZXJlIGlzIG5vIGNhc2UgZm9yIFhlbiBpdHNlbGYgdG8g
YWNjZXNzIENOVFZDVF9FTDAsDQo+ID4+Pj4+IGFuZCBpdCBhbHNvIHNob3VsZCBiZSB0aGUgR3Vl
c3QgT1MncyByZXNwb25zaWJpbGl0eSB0byBkZWFsIHdpdGgNCj4gPj4+Pj4gdGhpcyBwYXJ0Lg0K
PiA+Pj4+Pg0KPiA+Pj4+PiBCdXQgZm9yIENOVFBDVCwgdGhlcmUgZXhpc3RzIHNldmVyYWwgY2Fz
ZXMgaW4gWGVuIGludm9sdmluZyByZWFkaW5nDQo+ID4+Pj4+IENOVFBDVCwgc28gYSBwb3NzaWJs
ZSB3b3JrYXJvdW5kIGlzIHRoYXQgcGVyZm9ybWluZyB0aGUgcmVhZCB0d2ljZSwNCj4gPj4+Pj4g
YW5kIHRvIHJldHVybiBvbmUgb3IgdGhlIG90aGVyIGRlcGVuZGluZyBvbiB3aGV0aGVyIGEgdHJh
bnNpdGlvbiBoYXMNCj4gPj4+Pj4gdGFrZW4gcGxhY2UuDQo+ID4+Pj4+DQo+ID4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+Pj4+DQo+ID4+
Pj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+ID4+Pj4NCj4g
Pj4+PiBPbiBhIHJlbGF0ZWQgdG9waWMsIGRvIHdlIG5lZWQgYSBmaXggc2ltaWxhciB0byBMaW51
eCBjb21taXQNCj4gPj4+PiA3NWExOWEwMjAyZGIgImFybTY0OiBhcmNoX3RpbWVyOiBFbnN1cmUg
Y291bnRlciByZWdpc3RlciByZWFkcyBvY2N1cg0KPiA+Pj4+IHdpdGggc2VxbG9jayBoZWxkIj8N
Cj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEkgdGFrZSBhIGxvb2sgYXQgdGhpcyBMaW51eCBjb21taXQs
IGl0IHNlZW1zIHRvIHByZXZlbnQgdGhlIHNlcS1sb2NrIHRvIGJlDQo+ID4+PiBzcGVjdWxhdGVk
LiAgVXNpbmcgYW4gZW5mb3JjZSBvcmRlcmluZyBpbnN0ZWFkIG9mIElTQiBhZnRlciB0aGUgcmVh
ZCBjb3VudGVyDQo+ID4+PiBvcGVyYXRpb24gc2VlbXMgdG8gYmUgZm9yIHBlcmZvcm1hbmNlIHJl
YXNvbnMuDQo+ID4+Pg0KPiA+Pj4gSSBoYXZlIGZvdW5kIHRoYXQgeW91IGhhZCBwbGFjZWQgYW4g
SVNCIGJlZm9yZSByZWFkIGNvdW50ZXIgaW4gZ2V0X2N5Y2xlcw0KPiA+Pj4gdG8gcHJldmVudCBj
b3VudGVyIHZhbHVlIHRvIGJlIHNwZWN1bGF0ZWQuIEJ1dCB5b3UgaGF2ZW4ndCBwbGFjZWQgdGhl
DQo+IHNlY29uZA0KPiA+Pj4gSVNCIGFmdGVyIHJlYWRpbmcuIElzIGl0IGJlY2F1c2Ugd2UgaGF2
ZW4ndCB1c2VkIHRoZSBnZXRfY3ljbGVzIGluIHNlcSBsb2NrDQo+ID4+PiBjcml0aWNhbCBjb250
ZXh0IChNYXliZSBJIGRpZG4ndCBmaW5kIHRoZSByaWdodCBwbGFjZSk/IFNvIHNob3VsZCB3ZSBu
ZWVkIHRvDQo+IGZpeCBpdA0KPiA+Pj4gbm93LCBvciB5b3UgcHJlZmVyIHRvIGZpeCBpdCBub3cg
Zm9yIGZ1dHVyZSB1c2FnZT8NCj4gPj4NCj4gPj4gTG9va2luZyBhdCB0aGUgY2FsbCBzaXRlcywg
aXQgZG9lc24ndCBsb29rIGxpa2Ugd2UgbmVlZCBhbnkgSVNCIGFmdGVyDQo+ID4+IGdldF9jeWNs
ZXMgYXMgaXQgaXMgbm90IHVzZWQgaW4gYW55IGNyaXRpY2FsIGNvbnRleHQuIFRoZXJlIGlzIGFs
c28gYQ0KPiA+PiBkYXRhIGRlcGVuZGVuY3kgd2l0aCB0aGUgdmFsdWUgcmV0dXJuZWQgYnkgaXQu
DQo+IA0KPiBJIGFtIGFzc3VtaW5nIHlvdSBsb29rZWQgYXQgYWxsIHRoZSB1c2VycyBvZiBOT1co
KS4gSXMgdGhhdCByaWdodD8NCj4gDQo+ID4+DQo+ID4+IFNvIEkgYW0gdGhpbmtpbmcgd2UgZG9u
J3QgbmVlZCBhbnkgZml4LiBBdCBtb3N0IHdlIG5lZWQgYW4gaW4tY29kZSBjb21tZW50Pw0KPiA+
DQo+ID4gSSBhZ3JlZSB3aXRoIHlvdSB0byBhZGQgYW4gaW4tY29kZSBjb21tZW50LiBJdCB3aWxs
IHJlbWluZCB1cyBpbiBmdXR1cmUgd2hlbg0KPiB3ZQ0KPiA+IHVzZSB0aGUgZ2V0X2N5Y2xlcyBp
biBjcml0aWNhbCBjb250ZXh0LiBBZGRpbmcgaXQgbm93IHdpbGwgcHJvYmFibHkgb25seSBsZWFk
IHRvDQo+ID4gbWVhbmluZ2xlc3MgcGVyZm9ybWFuY2UgZGVncmFkYXRpb24uDQo+IA0KPiBJIHJl
YWQgdGhpcyBhcyB0aGVyZSB3b3VsZCBiZSBubyBwZXJmb21hbmNlIGltcGFjdCBpZiB3ZSBhZGQg
dGhlDQo+IG9yZGVyaW5nIGl0IG5vdy4gRGlkIHlvdSBpbnRlbmQgdG8gc2F5Pw0KDQpTb3JyeSBh
Ym91dCBteSBFbmdsaXNoLiBJIGludGVuZGVkIHRvIHNheSAiQWRkaW5nIGl0IG5vdyBtYXkgaW50
cm9kdWNlIHNvbWUNCnBlcmZvcm1hbmNlIGNvc3QuIEFuZCB0aGlzIHBlcmZvcm1hbmNlIGNvc3Qg
bWF5IGJlIG5vdCB3b3J0aC4gQmVjYXVzZSBYZW4NCm1heSBuZXZlciB1c2UgaXQgaW4gYSBzaW1p
bGFyIHNjZW5hcmlvICINCg0KPiANCj4gPiBCZWNhdXNlIFhlbiBtYXkgbmV2ZXIgdXNlIGl0IGlu
IGEgc2ltaWxhcg0KPiA+IHNjZW5hcmlvLg0KPiANCj4gUmlnaHQsIHRoZXJlIGFyZSB0d28gcG90
ZW50aWFscyBhcHByb2FjaCBoZXJlOg0KPiAgICAtIFdhaXQgdW50aWwgdGhlcmUgYXJlIGEgdXNl
cg0KPiAgICAgICAgKiBQcm9zOiBEb2Vzbid0IGltcGFjdCBwZXJmb3JtYW5jZQ0KPiAgICAgICAg
KiBDb25zOiBXZSByZWx5IG9uIHVzZXJzL3Jldmlld2VycyB0byBjYXRjaCBhbnkgbWlzdXNlDQo+
ICAgIC0gSGFyZGVuIHRoZSBjb2RlDQo+ICAgICAgICAqIFByb3M6IExlc3MgcmlzayB0byBpbnRy
b2R1Y2UgYSBidWcgaW5hZHZlcnRlbnRseQ0KPiAgICAgICAgKiBDb25zOiBNYXkgaW1wYWN0IHRo
ZSBwZXJmb3JtYW5jZQ0KPiANCj4gSW4gZ2VuZXJhbCwgSSBwcmVmZXIgdGhhdCB0aGUgY29kZSBp
cyBoYXJkZW5lZCBieSBkZWZhdWx0IGlmIHRoZQ0KPiBwZXJmb3JtYW5jZSBpbXBhY3QgaXMgbGlt
aXRlZC4gVGhpcyBtYXkgc2F2ZSB1cyBob3VycyBvZg0KPiBkZWJ1Z2dpbmcvcmVwcm9kdWNpbmcg
YnVnLg0KPiANCg0KRnJvbSBhIHByZXZlbnRpdmUgcG9pbnQgb2YgdmlldywgeW91J3JlIHJpZ2h0
Lg0KDQo+IEluIGFkZGl0aW9uLCBBRkFJQ1QsIHRoZSB4ODYgdmVyc2lvbiBvZiBnZXRfY3ljbGVz
KCkgaXMgYWxyZWFkeSBhYmxlIHRvDQo+IHByb3ZpZGUgdGhhdCBvcmRlcmluZy4gU28gdGhlcmUg
YXJlIGNoYW5jZXMgdGhhdCBjb2RlIG1heSByZWx5IG9uIGl0Lg0KPiANCj4gV2hpbGUgSSBkb24n
dCBuZWNlc3NhcmlseSBhZ3JlZSB0byBhZGQgYmFycmllcnMgZXZlcnl3aGVyZSBieSBkZWZhdWx0
DQo+ICh0aGlzIG1heSBoYXZlIGJpZyBpbXBhY3Qgb24gdGhlIHBsYXRmb3JtKS4gSSB0aGluayBp
dCBpcyBiZXR0ZXIgdG8gaGF2ZQ0KPiBhbiBhY2N1cmF0ZSBudW1iZXIgb2YgY3ljbGVzLg0KPiAN
Cg0KQXMgeDg2IGhhZCBkb25lIGl0LCBJIHRoaW5rIGl04oCZcyBvayB0byBkbyBpdCBmb3IgQXJt
LiBUaGlzIHdpbGwga2VlcCBhIGZ1bmN0aW9uIA0KYmVoYXZlcyB0aGUgc2FtZSBvbiBkaWZmZXJl
bnQgYXJjaGl0ZWN0dXJlcy4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiBDaGVlcnMsDQo+IA0K
PiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

