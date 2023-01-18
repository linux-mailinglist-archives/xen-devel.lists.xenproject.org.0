Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B6671109
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 03:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480074.744264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHy27-0005EJ-LB; Wed, 18 Jan 2023 02:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480074.744264; Wed, 18 Jan 2023 02:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHy27-0005C8-Hz; Wed, 18 Jan 2023 02:18:35 +0000
Received: by outflank-mailman (input) for mailman id 480074;
 Wed, 18 Jan 2023 02:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHy25-0005C2-O7
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 02:18:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65c193c2-96d6-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 03:18:29 +0100 (CET)
Received: from FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::9) by
 AS8PR08MB6295.eurprd08.prod.outlook.com (2603:10a6:20b:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 02:18:27 +0000
Received: from VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::c7) by FR3P281CA0191.outlook.office365.com
 (2603:10a6:d10:a4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Wed, 18 Jan 2023 02:18:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT030.mail.protection.outlook.com (100.127.144.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 02:18:26 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Wed, 18 Jan 2023 02:18:25 +0000
Received: from 1e2f6dd1ce74.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E2153ED-1E4C-461B-97BC-A18B3A4F3E84.1; 
 Wed, 18 Jan 2023 02:18:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1e2f6dd1ce74.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 02:18:16 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 02:18:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 02:18:11 +0000
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
X-Inumbo-ID: 65c193c2-96d6-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkiXdli/CeyeinAOvKeLAevU+PKvIz1V/X6MF4mKLF4=;
 b=aERw2DaNKS/XAX63NehtSXDusJmAFP+Zg4SrnY0KeTmETh8vpIWImaMA8rry1t1TVXIDcsoLv8JXrxifeT8lZD6ThpQBfXskHBQ8uupQdCAQikQypBlb6r2QAoNrhZ8kMYx/qXgaTIPEmwFjl80i//05AjokxHl/oLqpndBB+hU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwKYB3tj/uCLeFwfQKCaOJ6TFgB3eiFT+ZjaHRREoCw3sWvg9B+t02rjfEAPcgAJ3Z8LEgaBpWciSvkkzLCNi5RVrRPHWY9P1X1dheh3zmfYzRnOsK46HHYtMkfE3AEUDnU09tiIcvPxP/x4dgJU+DzVV7BwRCDjpSqJe+dHOkh68s3R6waEKxr1iI0nT32RiMTb+rBMbxig5RKJ8Z4jB5prCZaSuU7/CItc8wPeY8eKRVFBfbmyYq18RnZhIrh8VlZeHZ36RWmek5caI/oiLbzaRAaYG+kEyMx5g+h19c4ckQkgjFVBz/GhBwZ1seHezdO+zEFwlV+LbnV7rjYMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkiXdli/CeyeinAOvKeLAevU+PKvIz1V/X6MF4mKLF4=;
 b=mYTv1V3XhBxmQ064xpevUJmE5960uFrP0/4Huv5vPxYLAlU6IE0xY4U5d5d6FRs190ADzSOfuB8wbQg4xPImBuiCvxfRr6HJUhaVVxQt6BZ5fBSOfSTviNj2WoyGeRvG1XPSDNEmhL9+3O2WTEpCnGvck2OYkLC6JZ+j6KbRoQyEQohkFTt8aDPM2NwrPdJrIS62Yjn3jemCrNo9nOk1sbUpGpXoENlXHHnHxIQQ53kA5payMg+Ya1lNxbHOlCI8GvpqDXvMm/1Xg5ykd8szPZVhxQYjjrAN8xsK+VGFWA3o72ftZqRBv5yehqGgWKcX//4kyrYdfY6GToXBVBqC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkiXdli/CeyeinAOvKeLAevU+PKvIz1V/X6MF4mKLF4=;
 b=aERw2DaNKS/XAX63NehtSXDusJmAFP+Zg4SrnY0KeTmETh8vpIWImaMA8rry1t1TVXIDcsoLv8JXrxifeT8lZD6ThpQBfXskHBQ8uupQdCAQikQypBlb6r2QAoNrhZ8kMYx/qXgaTIPEmwFjl80i//05AjokxHl/oLqpndBB+hU=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map
 sections
Thread-Topic: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map
 sections
Thread-Index: AQHZJxAY2FhaLGF+HUqxg8o4//gxhq6jTaOAgAAkT4A=
Date: Wed, 18 Jan 2023 02:18:11 +0000
Message-ID:
 <PAXPR08MB742061C5E8ED73BD43FEF9599EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-8-Penny.Zheng@arm.com>
 <4b817b65-f558-b4df-c7fd-242a04e59a59@xen.org>
In-Reply-To: <4b817b65-f558-b4df-c7fd-242a04e59a59@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A6EDD32842840546B15F42A534342384.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|GV1PR08MB7732:EE_|VI1EUR03FT030:EE_|AS8PR08MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: cf638c48-eb71-4185-28e0-08daf8fa483b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mm9e+zW0ES8SMzYhy2e6cRMYh7kC5y8XDyfsp2RZEl1BEquJOktPZCCPDnJF2UjbntJhgvgGyjnWawkdIl8hfOnMQOXSTK5VctakkVuAtQTdNHpfVaikI3QAtBNrd0gklTArZtlTTKtuzHLWo16HETnQPtcXcLLVhwONrc5VRr4WtkJHBQfB2Ex/jwNOKoEmk/HMmjeVj20S6ZWrkgBIZXb5m4F8GvJKa6fDdbBK7xNAptomWG1NngFSZ/dym+N0IK00vQBvnZFDoGCKcye8Iq2UO1Mq2yhgOEci43dKQFrrfypmHIaIRWVm3qxS3IC77y7EWQkZHfAWvnbtlc4gk2nPP+K0NFaPxMJ3qS86+9CUMAohXO5FvZp9eN0iN3jwqnug97FP/r/6/Vp8D6gu0di7On1hYea039bt4n9ed8e+OyNEfdLGSVhr0srzSZ32B0YANkNYHNM9BtrdVOnJPvlYM94ozFAnpZOATYelQ7v8mllkyaqc0XtsVt2LNGCJG/xKQ59M2z2S92GIzuP3r2Z7nnAyC13TrSUrhC7Y9NajPYK+DPPeKL4GBsBKDC2HUu8S981p74Xjvnma10bHlhTdDEY7X4syYxwKjBgE7bt7I1JJ7tcBYQyGaHJTQM5aP0p1t/SwdVHO1pywlY3+odN0XGXA6Ve8FaEDr/L/ntMLMwxfL9YG8DN2oO4VtWNf8+PMK8k/oQlqFsPqiwutmN92EFJ9SUjvx/AHst1d+TA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(86362001)(55016003)(66446008)(33656002)(9686003)(64756008)(4326008)(53546011)(186003)(8676002)(26005)(76116006)(66946007)(66556008)(41300700001)(66476007)(316002)(71200400001)(38100700002)(478600001)(54906003)(110136005)(6506007)(122000001)(38070700005)(2906002)(5660300002)(52536014)(83380400001)(7696005)(8936002)(142923001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7b4399f-552e-4762-7b2d-08daf8fa3f85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ziw/06lFngp6E6R3EThYpH9xYzDAA0Ausf9hg+O2FhUz9dcLF/s9PphO3O1DqM9LBkUceo+ZcDdDv19nxhTD0aiem8hP+FP/oxxGDasuHOF9KWEn2QTJ1HPayIaYCIFHB/HPvkL6S4Ys4vMIEkfyhuCGRNcYGyZPCD8Xqu5XDE6vNgTyfmYkVcQqCd+/PIZyJ5+Ai8c51F+M3aFTFmKDT2e1ZEiMXoBQRop48N2zO8rKCb3qOTOaQgI624r5NQy/trm8k4ubbIJNgOwPcV/OExrMCx+jdxll7I8pLC4MJ+GOv4Ijc8UI4oJu4nbJ1Ow7KNSvraoDgfJHYE1EMDTeWIZBDi4/7/rNm4v3J1KcEHRJlGwAAtkmgdigMoJvMFk/3PY0xdHPt3gfK9cWnb+yseAV3ksskNh2wHczOjeKgve/WCXhmp4j0oMRUDcPcBnal2+/tUQTCGa31S/s7r8sFanvy66E/e2f4mucUza62e8rs9obDn5OSQ3UsNcnlM9v8S9zxZGajNRZcHq9l0WmL6j1aIAjDar7g3Gcxe2Z/sS5+QIPwM1m6RTLXfaYLK0IcznjA13s5+KGV/CeoJP7bBvt4+G6ZAdAeByutdNIVQmGuJ7SjNMfVSkB0qC73SK1izerTrjgqGBnOKTLpLN8NMHvSgv6wTR+YZynDVjVY9EK3lMQAiAPbCz9+iFsICkOL4fBvZ/HhSPKcwC9CdQpJzySb+TnbSRn+5bTDIb56ss=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(316002)(82310400005)(2906002)(54906003)(110136005)(336012)(186003)(9686003)(26005)(86362001)(81166007)(53546011)(356005)(47076005)(83380400001)(7696005)(36860700001)(40460700003)(478600001)(33656002)(55016003)(107886003)(40480700001)(6506007)(5660300002)(82740400003)(8936002)(4326008)(70586007)(8676002)(70206006)(52536014)(41300700001)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 02:18:26.2289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf638c48-eb71-4185-28e0-08daf8fa483b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6295

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgNzo0Ng0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzQwXSB4
ZW4vYXJtNjQ6IGFkZCAudGV4dC5pZG1hcCBmb3IgWGVuIGlkZW50aXR5DQo+IG1hcCBzZWN0aW9u
cw0KPiANCj4gSGksDQo+IA0KPiBPbiAxMy8wMS8yMDIzIDA1OjI4LCBQZW5ueSBaaGVuZyB3cm90
ZToNCj4gPiBGcm9tOiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPg0KPiA+IE9ubHkg
dGhlIGZpcnN0IDRLQiBvZiBYZW4gaW1hZ2Ugd2lsbCBiZSBtYXBwZWQgYXMgaWRlbnRpdHkNCj4g
PiAoUEEgPT0gVkEpLiBBdCB0aGUgbW9tZW50LCBYZW4gZ3VhcmFudGVlcyB0aGlzIGJ5IGhhdmlu
Zw0KPiA+IGV2ZXJ5dGhpbmcgdGhhdCBuZWVkcyB0byBiZSB1c2VkIGluIHRoZSBpZGVudGl0eSBt
YXBwaW5nDQo+ID4gaW4gaGVhZC5TIGJlZm9yZSBfZW5kX2Jvb3QgYW5kIGNoZWNraW5nIGF0IGxp
bmsgdGltZSBpZiB0aGlzDQo+ID4gZml0cyBpbiA0S0IuDQo+ID4NCj4gPiBJbiBwcmV2aW91cyBw
YXRjaCwgd2UgaGF2ZSBtb3ZlZCB0aGUgTU1VIGNvZGUgb3V0c2lkZSBvZg0KPiA+IGhlYWQuUy4g
QWx0aG91Z2ggd2UgaGF2ZSBhZGRlZCAudGV4dC5oZWFkZXIgdG8gdGhlIG5ldyBmaWxlDQo+ID4g
dG8gZ3VhcmFudGVlIGFsbCBpZGVudGl0eSBtYXAgY29kZSBzdGlsbCBpbiB0aGUgZmlyc3QgNEtC
Lg0KPiA+IEhvd2V2ZXIsIHRoZSBvcmRlciBvZiB0aGVzZSB0d28gZmlsZXMgb24gdGhpcyA0S0Ig
ZGVwZW5kcw0KPiA+IG9uIHRoZSBidWlsZCB0b29scy4gQ3VycmVudGx5LCB3ZSB1c2UgdGhlIGJ1
aWxkIHRvb2xzIHRvDQo+ID4gcHJvY2VzcyB0aGUgb3JkZXIgb2Ygb2JqcyBpbiB0aGUgTWFrZWZp
bGUgdG8gZW5zdXJlIHRoYXQNCj4gPiBoZWFkLlMgbXVzdCBiZSBhdCB0aGUgdG9wLiBCdXQgaWYg
eW91IGNoYW5nZSB0byBhbm90aGVyIGJ1aWxkDQo+ID4gdG9vbHMsIGl0IG1heSBub3QgYmUgdGhl
IHNhbWUgcmVzdWx0Lg0KPiANCj4gUmlnaHQsIHNvIHRoaXMgaXMgZml4aW5nIGEgYnVnIHlvdSBp
bnRyb2R1Y2VkIGluIHRoZSBwcmV2aW91cyBwYXRjaC4gV2UNCj4gc2hvdWxkIHJlYWxseSBhdm9p
ZCBpbnRyb2R1Y2luZyAobGF0ZW50KSByZWdyZXNzaW9uIGluIGEgc2VyaWVzLiBTbw0KPiBwbGVh
c2UgcmUtb3JkZXIgdGhlIHBhdGNoZXMuDQo+IA0KDQpPay4NCg0KPiA+DQo+ID4gSW4gdGhpcyBw
YXRjaCB3ZSBpbnRyb2R1Y2UgLnRleHQuaWRtYXAgdG8gaGVhZF9tbXUuUywgYW5kDQo+ID4gYWRk
IHRoaXMgc2VjdGlvbiBhZnRlciAudGV4dC5oZWFkZXIuIHRvIGVuc3VyZSBjb2RlIG9mDQo+ID4g
aGVhZF9tbXUuUyBhZnRlciB0aGUgY29kZSBvZiBoZWFkZXIuUy4NCj4gPg0KPiA+IEFmdGVyIHRo
aXMsIHdlIHdpbGwgc3RpbGwgaW5jbHVkZSBzb21lIGNvZGUgdGhhdCBkb2VzIG5vdA0KPiA+IGJl
bG9uZyB0byBpZGVudGl0eSBtYXAgYmVmb3JlIF9lbmRfYm9vdC4gQmVjYXVzZSB3ZSBoYXZlDQo+
ID4gbW92ZWQgX2VuZF9ib290IHRvIGhlYWRfbW11LlMuDQo+IA0KPiBJIGRpc2xpa2UgdGhpcyBh
cHByb2FjaCBiZWNhdXNlIHlvdSBhcmUgZXhwZWN0aW5nIHRoYXQgb25seSBoZWFkX21tdS5TDQo+
IHdpbGwgYmUgcGFydCBvZiAudGV4dC5pZG1hcC4gSWYgaXQgaXMgbm90LCBldmVyeXRoaW5nIGNv
dWxkIGJsb3cgdXAgYWdhaW4uDQo+IA0KDQpJIGFncmVlLg0KDQo+IFRoYXQgc2FpZCwgaWYgeW91
IGxvb2sgYXQgc3RhZ2luZywgeW91IHdpbGwgbm90aWNlIHRoYXQgbm93IF9lbmRfYm9vdCBpcw0K
PiBkZWZpbmVkIGluIHRoZSBsaW5rZXIgc2NyaXB0IHRvIGF2b2lkIGFueSBpc3N1ZS4NCj4gDQoN
ClNvcnJ5LCBJIGFtIG5vdCBxdWl0ZSBjbGVhciBhYm91dCB0aGlzIGNvbW1lbnQuIFRoZSBfZW5k
X2Jvb3Qgb2Ygb3JpZ2luYWwNCnN0YWdpbmcgYnJhbmNoIGlzIGRlZmluZWQgaW4gaGVhZC5TLiBB
bmQgSSBhbSBub3QgcXVpdGUgc3VyZSBob3cgdGhpcw0KX2VuZF9ib290IHNvbHZlIG11bHRpcGxl
IGZpbGVzIGNvbnRhaW4gaWRtYXAgY29kZS4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiA+IFRo
YXQgbWVhbnMgYWxsIGNvZGUgaW4gaGVhZC5TDQo+ID4gd2lsbCBiZSBpbmNsdWRlZCBiZWZvcmUg
X2VuZF9ib290LiBJbiB0aGlzIHBhdGNoLCB3ZSBhbHNvDQo+ID4gYWRkZWQgLnRleHQgZmxhZyBp
biB0aGUgcGxhY2Ugb2Ygb3JpZ2luYWwgX2VuZF9ib290IGluIGhlYWQuUy4NCj4gPiBBbGwgdGhl
IGNvZGUgYWZ0ZXIgLnRleHQgaW4gaGVhZC5TIHdpbGwgbm90IGJlIGluY2x1ZGVkIGluDQo+ID4g
aWRlbnRpdHkgbWFwIHNlY3Rpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8
d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiB2MSAtPiB2MjoNCj4gPiAxLiBOZXcgcGF0
Y2guDQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICB8IDYgKysr
KysrDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tbXUuUyB8IDIgKy0NCj4gPiAgIHhl
bi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICAgIHwgMSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4g
aW5kZXggNWNmYTQ3Mjc5Yi4uNzgyYmQxZjk0YyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiA+
IEBAIC00NjYsNiArNDY2LDEyIEBAIGZhaWw6ICAgUFJJTlQoIi0gQm9vdCBmYWlsZWQgLVxyXG4i
KQ0KPiA+ICAgICAgICAgICBiICAgICAxYg0KPiA+ICAgRU5EUFJPQyhmYWlsKQ0KPiA+DQo+ID4g
Ky8qDQo+ID4gKyAqIEZvciB0aGUgY29kZSB0aGF0IGRvIG5vdCBuZWVkIGluIGluZGVudGl0eSBt
YXAgc2VjdGlvbiwNCj4gPiArICogd2UgcHV0IHRoZW0gYmFjayB0byBub3JtYWwgLnRleHQgc2Vj
dGlvbg0KPiA+ICsgKi8NCj4gPiArLnNlY3Rpb24gLnRleHQsICJheCIsICVwcm9nYml0cw0KPiA+
ICsNCj4gDQo+IEkgd291bGQgYXJndWUgdGhhdCBwdXRzIHdhbnRzIHRvIGJlIHBhcnQgb2YgdGhl
IGlkbWFwLg0KPiANCg0KSSBhbSBvayB0byBtb3ZlIHB1dHMgdG8gaWRtYXAuIEJ1dCBmcm9tIHRo
ZSBvcmlnaW5hbCBoZWFkLlMsIHB1dHMgaXMNCnBsYWNlZCBhZnRlciBfZW5kX2Jvb3QsIGFuZCBm
cm9tIHRoZSB4ZW4ubGQuUywgd2UgY2FuIHNlZSBpZG1hcCBpcw0KYXJlYSBpcyB0aGUgc2VjdGlv
biBvZiAiX2VuZF9ib290IC0gc3RhcnQiLiBUaGUgcmVhc29uIG9mIG1vdmluZyBwdXRzDQp0byBp
ZG1hcCBpcyBiZWNhdXNlIHdlJ3JlIHVzaW5nIGl0IGluIGlkbWFwPw0KDQpDaGVlcnMsDQpXZWkg
Q2hlbg0KDQo+ID4gICAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USw0KPiA+ICAgLyoNCj4gPiAg
ICAqIEluaXRpYWxpemUgdGhlIFVBUlQuIFNob3VsZCBvbmx5IGJlIGNhbGxlZCBvbiB0aGUgYm9v
dCBDUFUuDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21tdS5TDQo+
IGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbW11LlMNCj4gPiBpbmRleCBlMmM4ZjA3MTQwLi42
ZmYxM2M3NTFjIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21tdS5T
DQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbW11LlMNCj4gPiBAQCAtMTA1LDcg
KzEwNSw3IEBADQo+ID4gICAgICAgICAgIHN0ciAgIFx0bXAyLCBbXHRtcDMsIFx0bXAxLCBsc2wg
IzNdDQo+ID4gICAuZW5kbQ0KPiA+DQo+ID4gLS5zZWN0aW9uIC50ZXh0LmhlYWRlciwgImF4Iiwg
JXByb2diaXRzDQo+ID4gKy5zZWN0aW9uIC50ZXh0LmlkbWFwLCAiYXgiLCAlcHJvZ2JpdHMNCj4g
PiAgIC8qLmFhcmNoNjQqLw0KPiA+DQo+ID4gICAvKg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPiA+IGluZGV4IDkyYzI5
ODQwNTIuLmJjNDVlYTJjNjUgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5sZHMu
Uw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gPiBAQCAtMzMsNiArMzMsNyBA
QCBTRUNUSU9OUw0KPiA+ICAgICAudGV4dCA6IHsNCj4gPiAgICAgICAgICAgX3N0ZXh0ID0gLjsg
ICAgICAgICAgICAvKiBUZXh0IHNlY3Rpb24gKi8NCj4gPiAgICAgICAgICAqKC50ZXh0LmhlYWRl
cikNCj4gPiArICAgICAgICooLnRleHQuaWRtYXApDQo+ID4NCj4gPiAgICAgICAgICAqKC50ZXh0
LmNvbGQpDQo+ID4gICAgICAgICAgKigudGV4dC51bmxpa2VseSAudGV4dC4qX3VubGlrZWx5IC50
ZXh0LnVubGlrZWx5LiopDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

