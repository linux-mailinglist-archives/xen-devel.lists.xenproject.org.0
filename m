Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937005068AE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307991.523451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngl3c-00018v-AI; Tue, 19 Apr 2022 10:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307991.523451; Tue, 19 Apr 2022 10:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngl3c-00015p-6b; Tue, 19 Apr 2022 10:26:04 +0000
Received: by outflank-mailman (input) for mailman id 307991;
 Tue, 19 Apr 2022 10:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnw2=U5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngl3a-00015h-DF
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:26:02 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b3fd899-bfcb-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 12:26:00 +0200 (CEST)
Received: from DB6PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:6:2d::12) by
 DB7PR08MB2969.eurprd08.prod.outlook.com (2603:10a6:5:20::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Tue, 19 Apr 2022 10:25:42 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::73) by DB6PR07CA0002.outlook.office365.com
 (2603:10a6:6:2d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 19 Apr 2022 10:25:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 10:25:42 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 19 Apr 2022 10:25:42 +0000
Received: from 3a8d0aa3c415.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93EADB2D-8C2B-432D-A399-BC55FC0B3E35.1; 
 Tue, 19 Apr 2022 10:25:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3a8d0aa3c415.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Apr 2022 10:25:33 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB6228.eurprd08.prod.outlook.com (2603:10a6:20b:281::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 10:25:28 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 10:25:28 +0000
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
X-Inumbo-ID: 1b3fd899-bfcb-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPi+q1CWGCQhQUPBbqMq308QQMXez93yaYQSelWo0RA=;
 b=KQ38EmdY6Nc+lPSkumyKelbxsqrnZtkwtC8B9X6SvQGmmctZca6MFqKzrmFgUsr2xZOVWRF9AV3qEjuK3MaTP27x55pLChCPXT6T0iiGnQH61IG4LAqPFiR6lwbbFC7bUrSnFPN0OBB8DrnlneST9XxPZaRYfhI96uylRIR7eWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKbFJLhideQu+Y9LBmYGxILC98h/IKzOZncLf58icfTa80W+KYc/+fQ+0/lZ1xM4z4ILZ0XjayOv2EkDu77kTxVKgRT/Wn7KBYyCZZvzV6Avky+HNhVmaEfcYMX2s+6XxvBi37EA8ob7TvdKD3js1E+rlFz3rrVcXi1896ChvEt8Q9gLkB9SsGeFSKw4JTa7z9sGN9hH6pRKVNp/hd03cXnkamNLSv2wulA0xkhQmO7B3JaKxDUY28+oVaq9MVyx1uqRH1akHFH5biVEOhMdma5KONLNniH6yZO5iHHN1uiMuU3WvusD7WhX0PGPFkVwsMukcDewAFeDQ8vj63fofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPi+q1CWGCQhQUPBbqMq308QQMXez93yaYQSelWo0RA=;
 b=ExidRzMK93GLpD2fspkWmhylUdWcoAbBJ3Fqq575ilnrXBf4m6SH6rcoNDv+TIX6x9/Ox/xaOKNKgFemgwdT372T3A4kJ9gGEopHayqfLN+DHDRhEhfSNJLfVgxdkcYDa+IXFoTE6nr++lrL4Zxz91uYxpnCfKNxUZwkyjI5MDOE7txcdujRUjzmzOprg1z53MK+ACGhd83eFqm/o945n7XjGsm9uIJ5Noluzn0/wNDRv9LH6/Qc2IiDoXSeROEgZj11wkqBFDtihsR+IEe+rO/qhdA2GjFwSpU8TDBpSj6xZnanxJ1cOnGCfCYtzm2mafnkMg+9B7DPtcNT418BlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPi+q1CWGCQhQUPBbqMq308QQMXez93yaYQSelWo0RA=;
 b=KQ38EmdY6Nc+lPSkumyKelbxsqrnZtkwtC8B9X6SvQGmmctZca6MFqKzrmFgUsr2xZOVWRF9AV3qEjuK3MaTP27x55pLChCPXT6T0iiGnQH61IG4LAqPFiR6lwbbFC7bUrSnFPN0OBB8DrnlneST9XxPZaRYfhI96uylRIR7eWA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 1/6] xen/arm: do not free reserved memory into heap
Thread-Topic: [PATCH v2 1/6] xen/arm: do not free reserved memory into heap
Thread-Index: AQHYUx8YNmarGsMpyEa7fYOjD7Fukaz28UOAgAAN1cA=
Date: Tue, 19 Apr 2022 10:25:28 +0000
Message-ID:
 <DU2PR08MB73258D4ABDB8F866480933E0F7F29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-2-Penny.Zheng@arm.com>
 <328723bb-1e24-7d3a-8fe0-ef433a96b360@suse.com>
In-Reply-To: <328723bb-1e24-7d3a-8fe0-ef433a96b360@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C0BB0F677766344AB9A50BD7AF373D45.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0c92fa29-a40a-4094-6b2a-08da21eef4ef
x-ms-traffictypediagnostic:
	AM9PR08MB6228:EE_|DB5EUR03FT054:EE_|DB7PR08MB2969:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB2969D3D1E2449FB90C9A1641F7F29@DB7PR08MB2969.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eYOgR7xYAETnkB34BsUcrCD6rU/i6Pt20DRgvtZn0k3l+7/1DRIiB6OBDXm35HkBte3Gj0RvU1Tdz9JrCwOjqOgXCKUU/lFysUivtkWGx9MY2axOZcna0xmDenBEfzClYSTewzXTNhLbyNUZzUvn8iwWrF0bD19HM95YLZ6R9x8sv9LyMxdyi4LgJo8KBL7SnGExRwa1gtAV1vu9pKnoOMpD0qOi+ud6zZ/2ou6MsWEowSQ8IYTqOehORJF1I/A1hIOge/EuhYIwHiD+kuoC/hzkKnzZWuMQGpYXlE7/Xa1yKb6SDRial/NvvFkQnmR/+tycwVtJo2CEbq33NqpXYXo0EmhdPqcvjYaH904Lv/h0tCHd7BzLWVBfpYkQia+oijw0bj8KYTtmQRAAbRQ85b/BP1L8Cj//ixCD559GxKm3m9Kn5pGVcdZ26osHTimmlNygihgnHDmtOWrOtYIRZE905a0OInGHO+ZV40LxakhL2CsWX4+zQqaiX5Ak5ZYhwkHlAAt5DAOxw/r8aCyd1rOHt8lNNf20XtugadHZOXgBBYPIDN0OUStQuT+d2OUIW7vPQlDbz6w79/yhEjghsnP9XZnFfESPKFMMcnzIB4KUQoANUDOUSwMrNi9JPgxd/dCUpivVMndxVOpqKRi9BeKY8O927p4Duyv06re0uHMxnMGvTApPQQ3A649Jv2ynbVd5QPdKvBgEwGrO3zaC8g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(38100700002)(5660300002)(508600001)(38070700005)(122000001)(52536014)(33656002)(8936002)(83380400001)(71200400001)(186003)(7696005)(2906002)(6506007)(26005)(86362001)(53546011)(9686003)(316002)(66556008)(66476007)(66446008)(66946007)(76116006)(64756008)(8676002)(54906003)(6916009)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6228
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2eb8e6a3-afda-47fc-89a5-08da21eeecee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGT+oxZtzjJ1jXtHBcHHUVXgBSP8z4FGBuqrUEiE/Fhv3jwqVFfZPOOYz0QzBiOr/ZXaR05Lcr1K7auT1NwrmcHamqdNNc2yWCdFLmxDozX+BSxzFCPeCJLm7A+j8ari8mV/bUbEluQSHHNrgbwzQxaEY71CmW0o65DnLPOtyvYPPOn+kn1iOOswjOe225kNXyCm12RCvG6tX74wfY35BADe/oZs0F9nsxbpw6ONbwx8plcOh07+NFJBsKB8CtymuZGEbHKHczwGNrWNyKt+G/AOhaqQa6YCfvX+R2iAqTqZO4a5yYTyu3epGuzYHCPqVSj53GlnR5oIdH3aex2+oGWn6JkXZNopnAiDZ5vQhm6VRzNQqYjJZGnj/ZJKEOEH7FIYuf8aKiXByTAs8hPw4khnwJQpe/jgl9o0vMLZdu6jKX9gAYtHSEcalmlFNhxtP/FSTqbICgH47eAGvXnJiMlJv+8uPVEbShiMdft+o4kbkn4TS9JKfIGq6873sjRTATbj2n7TtW5B6QQmlbQYGe2NznHsknH1cofJ9fMKHCEOyA8+wCuuYI6iwyAJJ91/l5wO1PuJpWQSDqYYoA04W9NfnOkpOneQaZlZoJwj7VROKL/9K0HVEQqyBUfsu6pqRcWOScIVerRok0mgIlzKzbxXfj9W3B4cHnHMp0oaDXmU35GGYpryRnCqy+/+1kpl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(6862004)(52536014)(36860700001)(70206006)(54906003)(70586007)(8676002)(7696005)(316002)(82310400005)(8936002)(5660300002)(40460700003)(83380400001)(356005)(2906002)(186003)(86362001)(81166007)(47076005)(336012)(26005)(9686003)(55016003)(33656002)(6506007)(53546011)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 10:25:42.1505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c92fa29-a40a-4094-6b2a-08da21eef4ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2969

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxOSwgMjAyMiA0
OjU5IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47
DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS82XSB4ZW4v
YXJtOiBkbyBub3QgZnJlZSByZXNlcnZlZCBtZW1vcnkgaW50byBoZWFwDQo+IA0KPiBPbiAxOC4w
NC4yMDIyIDE0OjIyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBQYWdlcyBhcyBndWVzdCBSQU0g
Zm9yIHN0YXRpYyBkb21haW4sIHNoYWxsIGJlIHJlc2VydmVkIHRvIHRoaXMgZG9tYWluIG9ubHku
DQo+IA0KPiBJcyB0aGVyZSAidXNlZCIgbWlzc2luZyBhcyB0aGUgMm5kIHdvcmQgb2YgdGhlIHNl
bnRlbmNlPw0KPiANCj4gPiBTbyBpbiBjYXNlIHJlc2VydmVkIHBhZ2VzIGJlaW5nIHVzZWQgZm9y
IG90aGVyIHB1cnBvc2UsIHVzZXJzIHNoYWxsDQo+ID4gbm90IGZyZWUgdGhlbSBiYWNrIHRvIGhl
YXAsIGV2ZW4gd2hlbiBsYXN0IHJlZiBnZXRzIGRyb3BwZWQuDQo+ID4NCj4gPiBmcmVlX3N0YXRp
Y21lbV9wYWdlcyB3aWxsIGJlIGNhbGxlZCBieSBmcmVlX2RvbWhlYXBfcGFnZXMgaW4gcnVudGlt
ZQ0KPiA+IGZvciBzdGF0aWMgZG9tYWluIGZyZWVpbmcgbWVtb3J5IHJlc291cmNlLCBzbyBsZXQn
cyBkcm9wIHRoZSBfX2luaXQNCj4gPiBmbGFnLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVu
bnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gdjIgY2hhbmdlczoN
Cj4gPiAtIG5ldyBjb21taXQNCj4gPiAtLS0NCj4gPiAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMg
fCAxMCArKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBXaXRoIHRoaXMgZGlmZnN0YXQgdGhlIHBhdGNoIHN1YmplY3Qg
cHJlZml4IGlzIHNvbWV3aGF0IG1pc2xlYWRpbmc7IEkgZmlyc3QNCj4gdGhvdWdodCBJIGNvdWxk
IHNraXAgdGhpcyBwYXRjaC4NCj4gDQoNCk9oLCBzb3JyeS4gV2lsbCBjaGFuZ2UgdGhlICd4ZW4v
YXJtJyB0byAneGVuJw0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiAr
KysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0yNDg4LDcgKzI0ODgsMTMgQEAg
dm9pZCBmcmVlX2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+IHVuc2lnbmVk
IGludCBvcmRlcikNCj4gPiAgICAgICAgICAgICAgc2NydWIgPSAxOw0KPiA+ICAgICAgICAgIH0N
Cj4gPg0KPiA+IC0gICAgICAgIGZyZWVfaGVhcF9wYWdlcyhwZywgb3JkZXIsIHNjcnViKTsNCj4g
PiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gKyAgICAgICAgaWYgKCBwZy0+Y291
bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCApDQo+ID4gKyAgICAgICAgICAgIC8qIFJlc2VydmVkIHBh
Z2Ugc2hhbGwgbm90IGdvIGJhY2sgdG8gdGhlIGhlYXAuICovDQo+ID4gKyAgICAgICAgICAgIGZy
ZWVfc3RhdGljbWVtX3BhZ2VzKHBnLCAxIDw8IG9yZGVyLCBzY3J1Yik7DQo+IA0KPiAxVUwgd2l0
aCwgaW4gcGFydGljdWxhciwgdGhlIGZ1bmN0aW9uIHBhcmFtZXRlciBieSAidW5zaWduZWQgbG9u
ZyIuDQo+IA0KPiBCeSBjYWxsaW5nIGZyZWVfc3RhdGljbWVtX3BhZ2VzKCkgYXQgcnVudGltZSwg
eW91IG1ha2UgdGhlIHByZXZpb3VzIHJhY2UgZnJlZQ0KPiAoYmVjYXVzZSBvZiBpbml0LXRpbWUg
b25seSkgdXBkYXRlIG9mIC5jb3VudF9pbmZvIHRoZXJlIHJhY3kuIE1ha2luZyBhIGNsb25lIG9m
DQo+IHRoYXQgZnVuY3Rpb24ganVzdCBmb3IgdGhpcyBkaWZmZXJlbmNlIHdvdWxkIGxpa2VseSBi
ZSBleGNlc3NpdmUsIHNvIEknZCBzdWdnZXN0IHRvDQo+IGNoYW5nZSB0aGUgY29kZSB0aGVyZSB0
bw0KPiANCj4gICAgICAgICAvKiBJbiBjYXNlIGluaXRpYWxpemluZyBwYWdlIG9mIHN0YXRpYyBt
ZW1vcnksIG1hcmsgaXQgUEdDX3Jlc2VydmVkLiAqLw0KPiAgICAgICAgIGlmICggIShwZ1tpXS5j
b3VudF9pbmZvICYgUEdDX3Jlc2VydmVkKSApDQo+ICAgICAgICAgICAgIHBnW2ldLmNvdW50X2lu
Zm8gfD0gUEdDX3Jlc2VydmVkOw0KPiANCg0KTGVhcm5lZCENCg0KPiA+ICsgICAgICAgIGVsc2UN
Cj4gPiArI2VuZGlmDQo+ID4gKyAgICAgICAgICAgIGZyZWVfaGVhcF9wYWdlcyhwZywgb3JkZXIs
IHNjcnViKTsNCj4gDQo+IE9mIGNvdXJzZSBpdCB3b3VsZCBiZSBuaWNlIHRvIGF2b2lkIHRoZSAj
aWZkZWYtYXJ5IGhlcmUuIE1heSBJIGFzayB0aGF0IHlvdQ0KPiBpbnRyb2R1Y2UgYSBzdHViIGZy
ZWVfc3RhdGljbWVtX3BhZ2VzKCkgZm9yIHRoZSAhQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gY2Fz
ZSwgc3VjaCB0aGF0IHRoZSBjb25zdHJ1Y3QgY2FuIGJlY29tZQ0KPiANCg0KU3VyZSwgd2lsbCBk
by4NCg0KPiAgICAgICAgIGlmICggIShwZy0+Y291bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCkgKQ0K
PiAgICAgICAgICAgICBmcmVlX2hlYXBfcGFnZXMocGcsIG9yZGVyLCBzY3J1Yik7DQo+ICAgICAg
ICAgZWxzZQ0KPiAgICAgICAgICAgICAvKiBSZXNlcnZlZCBwYWdlIHNoYWxsIG5vdCBnbyBiYWNr
IHRvIHRoZSBoZWFwLiAqLw0KPiAgICAgICAgICAgICBmcmVlX3N0YXRpY21lbV9wYWdlcyhwZywg
MSA8PCBvcmRlciwgc2NydWIpOw0KPiANCj4gQW5vdGhlciBxdWVzdGlvbiBpcyB3aGV0aGVyIHRo
ZSBkaXN0aW5jdGlvbiBzaG91bGQgYmUgbWFkZSBoZXJlIGluIHRoZSBmaXJzdA0KPiBwbGFjZS4g
V291bGQgaXQgcGVyaGFwcyBiZXR0ZXIgYmVsb25nIGluIGZyZWVfaGVhcF9wYWdlcygpIGl0c2Vs
ZiwgdGh1cyBhbHNvDQo+IGNvdmVyaW5nIG90aGVyIHBvdGVudGlhbCBjYWxsIHNpdGVzPyBPZiBj
b3Vyc2UgdGhpcyBkZXBlbmRzIG9uIHdoZXJlLCBsb25nIHRlcm0sDQo+IHJlc2VydmVkIHBhZ2Vz
IGNhbiAvIHdpbGwgYmUgdXNlZC4NCj4gRm9yIGRvbWFpbnMgdG8gYmUgdHJ1bHkgc3RhdGljLCBY
ZW4ncyBvd24gYWxsb2NhdGlvbnMgdG8gbWFuYWdlIHRoZSBkb21haW4NCj4gbWF5IGFsc28gd2Fu
dCB0byBjb21lIGZyb20gdGhlIHJlc2VydmVkIHNldCAuLi4NCj4gDQoNClllcywgeW91J3JlIHJp
Z2h0LiBJJ2xsIGRlZmVyIHRoZSBkaXN0aW5jdGlvbiB0byBmcmVlX2hlYXBfcGFnZXMuIEFuZCBy
ZWZpbmUgdGhlDQppbi1jb2RlIGNvbW1lbnQgYWJvdmUgZnJlZV9zdGF0aWNtZW1fcGFnZXMsIGlu
IHRoZSBmaXJzdCBwbGFjZSwgSSB3YXMgaW50ZW5kaW5nDQp0byBtYWtlIGl0IGVxdWl2YWxlbnQg
b2YgZnJlZV9oZWFwX3BhZ2VzIHRvIGZyZWUgc3RhdGljIG1lbW9yeS4NCg0KSG93ZXZlciBhcyB5
b3Ugc2FpZCwgaWYgbGV0dGluZyBmcmVlX2hlYXBfcGFnZXMgY2FsbCBmcmVlX3N0YXRpY21lbV9w
YWdlcywgaXQgd2lsbCANCmNvdmVyIG90aGVyIHBvdGVudGlhbCBjYWxsIHNpdGUuIFdlJ3ZlIGFs
cmVhZHkgYmVlbiB0cnlpbmcgdG8gZW5hYmxlIHAybSBwb29sIG9uIGFybSwNCmFuZCBpbiB0aGUg
ZnV0dXJlLCBtYXliZSB0aGUgcGFnZXMgY29uc3RpdHV0aW5nIHRoZSBwb29sIHNoYWxsIG5vdCBj
b21lIGZyb20gaGVhcCwgYnV0DQpmcm9tIHJlc2VydmVkIHNldCwgaWYgdGhlIGRvbWFpbiBpcyBm
dWxseSBzdGF0aWMNCg0KPiA+IEBAIC0yNjM2LDcgKzI2NDIsNyBAQCBzdHJ1Y3QgZG9tYWluICpn
ZXRfcGdfb3duZXIoZG9taWRfdCBkb21pZCkNCj4gPg0KPiA+ICAjaWZkZWYgQ09ORklHX1NUQVRJ
Q19NRU1PUlkNCj4gPiAgLyogRXF1aXZhbGVudCBvZiBmcmVlX2hlYXBfcGFnZXMgdG8gZnJlZSBu
cl9tZm5zIHBhZ2VzIG9mIHN0YXRpYw0KPiA+IG1lbW9yeS4gKi8gLXZvaWQgX19pbml0IGZyZWVf
c3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLA0KPiA+IHVuc2lnbmVkIGxvbmcg
bnJfbWZucywNCj4gPiArdm9pZCBmcmVlX3N0YXRpY21lbV9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZv
ICpwZywgdW5zaWduZWQgbG9uZw0KPiA+ICtucl9tZm5zLA0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpDQo+IA0KPiBUaGlzIGxpbmUgbm93IHdh
bnRzIGl0cyBpbmRlbnRhdGlvbiBhZGp1c3RlZC4NCj4gDQo+IEphbg0KDQo=

