Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266ED67110A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 03:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480079.744275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHy3T-0005ja-0B; Wed, 18 Jan 2023 02:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480079.744275; Wed, 18 Jan 2023 02:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHy3S-0005hm-S4; Wed, 18 Jan 2023 02:19:58 +0000
Received: by outflank-mailman (input) for mailman id 480079;
 Wed, 18 Jan 2023 02:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHy3R-0005he-Jz
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 02:19:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98a07c48-96d6-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 03:19:54 +0100 (CET)
Received: from AM6PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:20b:2e::18)
 by PAXPR08MB6512.eurprd08.prod.outlook.com (2603:10a6:102:15a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 02:19:46 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::eb) by AM6PR05CA0005.outlook.office365.com
 (2603:10a6:20b:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 02:19:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 02:19:46 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Wed, 18 Jan 2023 02:19:46 +0000
Received: from 3ea9e91a0495.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 451048EB-9812-49F5-966C-B5290C30650D.1; 
 Wed, 18 Jan 2023 02:19:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ea9e91a0495.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 02:19:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 02:19:37 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 02:19:37 +0000
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
X-Inumbo-ID: 98a07c48-96d6-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oez922NGKhif7LclDvt12UEBh5S2BpR2MihgPORW6d8=;
 b=yRLpUHbV0JS/KAgUGlexfUgmj/4/IvXj+OESrI+Md5yuCZ4M5n59eULtBknLR0UvkFxobeKv6ibCgUzqz7zZ5l52XEmR7XibAIilHjnCUSycagNiSPX2XUQzWOBG3XZv2KUlQ+jeOt4M/IJj9x5CchBnGF4rlBmcKci743xOJWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADwQwErAostf2NbndIlgxS78BBk1xcks5a8UeUQ7/jriOVr0fjGgKGA61pDQPFRINIH18NGy2fO2enZgaFvxrXEN8m6gOUcW/eNIZCJCOBECNuc4RYj+Y5+n6FMdSbCXNgj2FkiCpNmQyKvBFscZ5ZrEkUQaErDzRGsh/eqzRGkYfA4iNqJ7Y0C/4rPI1D7C7r5r30CFNwleHZYUymwT4VCW8a+2TYfzZj8l1cfW7oByDhsSSLSpAvt56ZkTYIGNGdN8yiEaDCbiVJXW6PUQkXqArbg8isFFiH+Ql6RlJ/fu1mYVJOSW3h8yEbmt5m+kPbpQl2wv7zwJFx/NRnAHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oez922NGKhif7LclDvt12UEBh5S2BpR2MihgPORW6d8=;
 b=UXpMMy0Tn9mYddJiY25zKT/ibopeF/lGnyldUas7VAl7TppDYtLZNbEovSsL92o5fG+Y8uCEvpUoHyUoWSc7EjgDy+MysAPEOZuWJlegarR67h90UoZkUWUkrRrT86op8LkjkdQ4gjJE7iOlAiVQs/gtcS31ZLWhD42anmnWfZC5xrrmtQgLqSF5sS4x2TpdqNAM1+CrwrCPPwU306nacqL4tuplWyLP665CtiqYkJM6v+ioBcJCaOuSeBgOylO6aF+99x5gMHiGYGhPL61BdonADPPudSjeGwQznYMFEy/6DQoKRtnjw6emQtOYl+MDeBqulhT5ozg7RWVW5knExQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oez922NGKhif7LclDvt12UEBh5S2BpR2MihgPORW6d8=;
 b=yRLpUHbV0JS/KAgUGlexfUgmj/4/IvXj+OESrI+Md5yuCZ4M5n59eULtBknLR0UvkFxobeKv6ibCgUzqz7zZ5l52XEmR7XibAIilHjnCUSycagNiSPX2XUQzWOBG3XZv2KUlQ+jeOt4M/IJj9x5CchBnGF4rlBmcKci743xOJWQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 02/40] xen/arm: make ARM_EFI selectable for Arm64
Thread-Topic: [PATCH v2 02/40] xen/arm: make ARM_EFI selectable for Arm64
Thread-Index: AQHZJxAWjxT6rj1UKU+x1t/kdJ20K66jQz0AgAA1JWA=
Date: Wed, 18 Jan 2023 02:19:36 +0000
Message-ID:
 <PAXPR08MB7420BFF01464B721A34952DC9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-3-Penny.Zheng@arm.com>
 <32811667-4f9c-12f1-7b8f-2b066bc3dee9@xen.org>
In-Reply-To: <32811667-4f9c-12f1-7b8f-2b066bc3dee9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1AB6178AEF00FB43AD809FD3B019050C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|GV1PR08MB7732:EE_|AM7EUR03FT057:EE_|PAXPR08MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: c2aa8f6c-4c84-4713-870c-08daf8fa780c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /LDY7YWJpv3HQ93NyF5kbb1nms81om7drogdnXSzkMWjL345l8G8eO4z5WQc60QedgMozrPSHXALLpE918+xLxX306T1lKBmerhAWhY1RAI8ULianQuFOPgozkzEuC/TJo+eeICy3kv+LzYquCImjmaT9G+7IxyOuUtNF5WgUrNzHQSg4d8B1LxoRWqVhXzfdbA6DmXkwMlCDZ958kmRGbBTBeT/nV8xHQkKSiu+uN7/j9qM2QkWRYeSUskWAMgH82HPfaCUQR2BtDZ4uYrjGn2sJW0L+kqy+5+34IbO7gI/qyRLTYATCvprUBAt61qfSRYanw09ur/xs2JugNIJToCCFxjarjoKHU7ee8/XgxC6BM3zdIxA64HUXABZkIC6LhCY1JCwzbhViC8JeIzvc/WdW0uBl5o246ReE8jE2A++o6C20nJpbmD4rO5x6lZwVmO9CaOA150Wvrqo831UylF+Ss4hhCxfOnj0s/hn9zkWR671iFI2N1Xi6TBHtuQ1AcZxWiCDNA3+ybAGJZU0eOeKwUJC2rvteE+AT+aeR9wZ4UFbd4MkcJz74PF01nyPSN6wqeKJ4NilbpnepjT+zdH7QQSr82I2AzO9SRjK3SSlNoTjzSmlLbmXuaqNSDRlwEaqo2a6mW+SmyJm4LETfn+T87NGcTaa4KfEymRdYaJY4xUA2tnHyhRFTA0hRf3R1IFm2QWxwpXixAnYpkwWrw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(86362001)(55016003)(66446008)(33656002)(9686003)(64756008)(4326008)(53546011)(186003)(8676002)(26005)(76116006)(66946007)(66556008)(41300700001)(66476007)(316002)(71200400001)(38100700002)(478600001)(54906003)(110136005)(6506007)(122000001)(38070700005)(2906002)(5660300002)(52536014)(83380400001)(7696005)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d063523f-223b-46a0-1134-08daf8fa724d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RYSywizsTmlTulZ06sgoOFvsmsBx5QX4j7qcjkws5SvBf8k2iR8pHVhFOzGJJYwLH6ENbICd1wuY3Ctm732HWcFKq5jKGE1/JsXiFk0NJcB0KbXkuHyeB/v+XFsFcggUT/n5sUlKBxoX9eDmb3c+W7A+JfV37gyn/58EE4isTIU3/IWyTYkpG7qRbPKEZF3MVvgDgZ/Q9EKecAIzW1J6a65CkZT8pwSW3d1yeRiWkbA1PqcfWu5DeaQdL0j45bIHMYblcEaxI6xGR6s7vL4PHtQmkMnBLZZzTBkOSPrdv8lbiZgXEnJyl8AiHFWOywih+JuJSRHqm1rYeWCG9Aj8pEBSN1DfijxF2+4JKrTuCNSdORG+cuzYPtf5mlTs1XWSoPkvw7xCFmmgrjgkbdatScx6EVsMz8YcRhdww4+q8I4nlBBlmTQjCCK4Vn8+iKCD93951jJzafZuAQA3WrvBniWB7VJzpuSmBXwnHdii7Xenf65PNHD8DkrYDygWhKqvA8RFXdU7FCmOSdTL5VuD85aKzLGvvdDyE3xZw9W3MG7CvuPcw7EdeWV97EQTP50VXFR99NnHCO2AVvp3Eiwn+230YdNLTL41XGMUeyynMBQ/VQbk15yWOQ7a/XCGrpE6b4f59F3QGZRFlNApZx4iD9K8f7ECzxiVNnS5k0zxbBbEDEDz32g0ZYaEdI/oy/vn5NQ2Un0k1rSL24McUmFcxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(186003)(9686003)(478600001)(40460700003)(86362001)(41300700001)(33656002)(336012)(55016003)(316002)(54906003)(40480700001)(110136005)(47076005)(7696005)(70586007)(70206006)(26005)(4326008)(8676002)(36860700001)(81166007)(6506007)(2906002)(53546011)(82740400003)(82310400005)(52536014)(8936002)(356005)(5660300002)(83380400001)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 02:19:46.5477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2aa8f6c-4c84-4713-870c-08daf8fa780c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgNzowOQ0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzQwXSB4
ZW4vYXJtOiBtYWtlIEFSTV9FRkkgc2VsZWN0YWJsZSBmb3IgQXJtNjQNCj4gDQo+IEhpIFBlbm55
LA0KPiANCj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gRnJv
bTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4NCj4gPiBDdXJyZW50bHksIEFSTV9F
Rkkgd2lsbCBtYW5kYXRvcmlseSBzZWxlY3RlZCBieSBBcm02NC4NCj4gPiBFdmVuIGlmIHRoZSB1
c2VyIGtub3dzIGZvciBzdXJlIHRoYXQgdGhlaXIgaW1hZ2VzIHdpbGwgbm90DQo+ID4gc3RhcnQg
aW4gdGhlIEVGSSBlbnZpcm9ubWVudCwgdGhleSBjYW4ndCBkaXNhYmxlIHRoZSBFRkkNCj4gPiBz
dXBwb3J0IGZvciBBcm02NC4gVGhpcyBtZWFucyB0aGVyZSB3aWxsIGJlIGFib3V0IDNLIGxpbmVz
DQo+ID4gdW51c2VkIGNvZGUgaW4gdGhlaXIgaW1hZ2VzLg0KPiA+DQo+ID4gU28gaW4gdGhpcyBw
YXRjaCwgd2UgbWFrZSBBUk1fRUZJIHNlbGVjdGFibGUgZm9yIEFybTY0LCBhbmQNCj4gPiBiYXNl
ZCBvbiB0aGF0LCB3ZSBjYW4gdXNlIENPTkZJR19BUk1fRUZJIHRvIGdhdGUgdGhlIEVGSQ0KPiA+
IHNwZWNpZmljIGNvZGUgaW4gaGVhZC5TIGZvciB0aG9zZSBpbWFnZXMgdGhhdCB3aWxsIG5vdCBi
ZQ0KPiA+IGJvb3RlZCBpbiBFRkkgZW52aXJvbm1lbnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gDQo+IFlvdXIgc2lnbmVkLW9mZi1ieSBp
cyBtaXNzaW5nLg0KPiANCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAxLiBOZXcgcGF0Y2gN
Cj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgfCAxMCArKysrKysrKy0t
DQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTUgKysrKysrKysrKysrKy0tDQo+
ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0v
S2NvbmZpZw0KPiA+IGluZGV4IDIzOWQzYWVkM2MuLmFjZTcxNzhjOWEgMTAwNjQ0DQo+ID4gLS0t
IGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0K
PiA+IEBAIC03LDcgKzcsNiBAQCBjb25maWcgQVJNXzY0DQo+ID4gICAJZGVmX2Jvb2wgeQ0KPiA+
ICAgCWRlcGVuZHMgb24gIUFSTV8zMg0KPiA+ICAgCXNlbGVjdCA2NEJJVA0KPiA+IC0Jc2VsZWN0
IEFSTV9FRkkNCj4gPiAgIAlzZWxlY3QgSEFTX0ZBU1RfTVVMVElQTFkNCj4gPg0KPiA+ICAgY29u
ZmlnIEFSTQ0KPiA+IEBAIC0zNyw3ICszNiwxNCBAQCBjb25maWcgQUNQSQ0KPiA+ICAgCSAgYW4g
YWx0ZXJuYXRpdmUgdG8gZGV2aWNlIHRyZWUgb24gQVJNNjQuDQo+ID4NCj4gPiAgIGNvbmZpZyBB
Uk1fRUZJDQo+ID4gLQlib29sDQo+ID4gKwlib29sICJVRUZJIGJvb3Qgc2VydmljZSBzdXBwb3J0
Ig0KPiA+ICsJZGVwZW5kcyBvbiBBUk1fNjQNCj4gPiArCWRlZmF1bHQgeQ0KPiA+ICsJaGVscA0K
PiA+ICsJICBUaGlzIG9wdGlvbiBwcm92aWRlcyBzdXBwb3J0IGZvciBib290IHNlcnZpY2VzIHRo
cm91Z2gNCj4gPiArCSAgVUVGSSBmaXJtd2FyZS4gQSBVRUZJIHN0dWIgaXMgcHJvdmlkZWQgdG8g
YWxsb3cgWGVuIHRvDQo+ID4gKwkgIGJlIGJvb3RlZCBhcyBhbiBFRkkgYXBwbGljYXRpb24uIFRo
aXMgaXMgb25seSB1c2VmdWwgZm9yDQo+ID4gKwkgIFhlbiB0aGF0IG1heSBydW4gb24gc3lzdGVt
cyB0aGF0IGhhdmUgVUVGSSBmaXJtd2FyZS4NCj4gDQo+IEkgd291bGQgZHJvcCB0aGUgbGFzdCBz
ZW50ZW5jZSBhcyB0aGlzIGlzIGltcGxpZWQgd2l0aCB0aGUgcmVzdCBvZiB0aGUNCj4gcGFyYWdy
YXBoLg0KPiANCg0KT2suDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gQ2hlZXJzLA0KPiANCj4g
LS0NCj4gSnVsaWVuIEdyYWxsDQo=

