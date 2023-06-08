Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36EB7288CD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 21:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545426.851852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7LSa-0002r3-QF; Thu, 08 Jun 2023 19:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545426.851852; Thu, 08 Jun 2023 19:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7LSa-0002pL-N3; Thu, 08 Jun 2023 19:38:16 +0000
Received: by outflank-mailman (input) for mailman id 545426;
 Thu, 08 Jun 2023 19:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjZV=B4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q7LSY-0002pD-V6
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 19:38:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c9bb4e-0634-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 21:38:12 +0200 (CEST)
Received: from AS9PR06CA0383.eurprd06.prod.outlook.com (2603:10a6:20b:460::30)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 19:38:06 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::e0) by AS9PR06CA0383.outlook.office365.com
 (2603:10a6:20b:460::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Thu, 8 Jun 2023 19:38:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.25 via Frontend Transport; Thu, 8 Jun 2023 19:38:06 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 08 Jun 2023 19:38:06 +0000
Received: from d2a64280a075.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9DC837B-5200-4E02-B373-B1318579EC10.1; 
 Thu, 08 Jun 2023 19:37:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2a64280a075.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Jun 2023 19:37:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB6417.eurprd08.prod.outlook.com (2603:10a6:20b:362::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 19:37:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%4]) with mapi id 15.20.6455.037; Thu, 8 Jun 2023
 19:37:11 +0000
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
X-Inumbo-ID: 00c9bb4e-0634-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n++UqojOSOM73ZUCVkaPazLm1GBQO/VQViA7ZsVp7VE=;
 b=4OmdcSVO8XBL6Qr1zZOGgs+Zos8bmo8pV3yUm3qCOX1DQD6Hh0BZXg+Kae5hkxMJja0MdYJmjBZhqJcfcKQEMFOKaB2Mv7S4EZo997JltJ0jEtDXDpaMkTmmYa1CG4Z8/2GggPxMrKtDcYKmRuf/ckDS1puKICnnJWvT/6eSpCM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdad0697cc15dd54
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev9q1X6Ds5aN0ua0/+qXFCWjeCZnB52rjfh5jlsRvP3UaNBb6JRaQczMegM5IC/KMUX49xj7lksavZwQxxLByL2wu097GK1utaRsi9X8co7SLXGylTuJ2sgZHeR6HPluoVfkiesrE2P1fue26IsUSXWYO1i8osrK2vENyKrq5oC1HX7Oi8dsKyd8Mz3/1M+jX+Qn6qKiIXkUiox6D59QBqIfuM3Cyocme99Mu3ZFaxZsS5G0dH3oXlDSeyiqOdafBqMB+jLg9hjC91IFW6rGfyziZx6w2NZAvFkHSudP3srBMrFl8RWDGRvT1TsKCJX5mhPWOagKWtCCYgNh2emf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n++UqojOSOM73ZUCVkaPazLm1GBQO/VQViA7ZsVp7VE=;
 b=LaZFLYP7b27ZzqP7qjQVKHuBsWEZPjjShhQeq4bdWDkku3CTDOAnN66bdZB0VYtZOJNqdcjy1scnF6Qcpwc1HQG1S+lXNHwT9bFpfBz9zDLCw42SjlHk3ZxQOUYW9L+q1XHZcQopesqndFoqrC+k90qpDquDXTs/Wdy+b12S23RD8IGlFcjACgXsebwaALgV6weiHlqAGTy0nyqRMRF7NnhLsc9rpxrKlXXI/5efDUkfKubGnGNvm7C0WTqZg3wSag29ymoW4vJNGfkbcy4uq+ZI2flitpyLgMxDcg+WPGtzkHli5RQLZpVyhTd5dg9yjePyEtYSw6FwaIhhf90hLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n++UqojOSOM73ZUCVkaPazLm1GBQO/VQViA7ZsVp7VE=;
 b=4OmdcSVO8XBL6Qr1zZOGgs+Zos8bmo8pV3yUm3qCOX1DQD6Hh0BZXg+Kae5hkxMJja0MdYJmjBZhqJcfcKQEMFOKaB2Mv7S4EZo997JltJ0jEtDXDpaMkTmmYa1CG4Z8/2GggPxMrKtDcYKmRuf/ckDS1puKICnnJWvT/6eSpCM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Topic: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Index: AQHZmjBTIpVZOkjuH06O82Z2wJSQ2a+BTMwA
Date: Thu, 8 Jun 2023 19:37:08 +0000
Message-ID: <9BAB3408-676E-4801-BCE1-4DB7BE081ADB@arm.com>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB6417:EE_|AM7EUR03FT041:EE_|GV1PR08MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 0766fca6-010d-4a40-c505-08db6857e1ca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rnS/7pl8KTBs7pRoQ+cf/DSgiXuV6k/+x1OYsGuRiDu2gxJ/f0IziilN7vFapJMOyHrxtykrAXo6iLd1Rx5WhGUJA4Q3e3++dh0Y6KoAgU9v3dhBspvOXoOpIojKz0mOAqFiKgtP5ax9OBWFeOIZ5nFFtIU53O9zI6cYZw1UlXIpDc8/ul1nbOYdqGMecNVDSzgkOb3hY8/BziqTIgAw9TjToAMmALcaq2AkMf7K4gLTog6s4WUyuqG+g1QsfHJFjsxfaCaYT3ER5WIYbky/ay01o9Fh5+tWHxqicPxpm7wpigeD+3gxlVG+KDLfTywvL+edIceWGBuoxMgI5i0gekSHpZa9/8BzxUCXpVkwoPv62QHox/eAzwOySXlRn7gsYXdCZvrNiX3raOT1wds+X0dcK+5xm7Qg/8cHenvzs7bIe77r/auuG3kLzMKZ9ysn67bZq20MV7wDuII7f7hHSdelhmFft5Rgjz7/KhPPXEZ7myJziiB8KkpcH4Uhid+XWhUNeMbsmoBKwxKfIOPQSKpBdtKFqzM15Y2N6nhRJIdBFedlVn/nkI3e1aQo0A5iYRbN3Vg1zJ7bUSUaKw/rwETWna2uknOCGUPQVFQcxrr2wnro4YBbdX3aoR1cJFe4QJOlHQyOeDRYHMdM+BSmSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(6506007)(26005)(6512007)(53546011)(122000001)(83380400001)(86362001)(36756003)(186003)(2906002)(33656002)(38070700005)(2616005)(8676002)(5660300002)(316002)(64756008)(8936002)(41300700001)(6666004)(66946007)(76116006)(38100700002)(66476007)(71200400001)(91956017)(66556008)(54906003)(4326008)(6916009)(478600001)(66446008)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC550712B2DD1B4CAAEC594FC2FFE696@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6417
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fe6ee82-eedc-433f-63ce-08db6857bfa1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0QSkbHkowf2OmiZfP2iu6blAUBa10UjEYxDBrrpYJAMI4Y/Sfqx68RexF7v4tfQYwcn5P/3C7fqBk9CZW2BLi22UYNgXkauJ5u5bfilkyDFa5bNQXBn9G2G1girXl132kVv0MSn0wydnzD0e189JFvcl5AVo1qFfllId+xgeKZCxB2mI0NapmAmt7D6Dcna3bEMgC2Blbc0WL6jFcySsVHy3w2rTjXGfv4+9MMxmmgoul+4SHnf5LuKwpGLWuI81+dqm1Uz1t7OwqF5A1w/XsMDhNuGDbEwvqnxOhdsZbWgxkbroVS4pkMSa7xWsWZCwd73Kxw+y3n3AcpgqsuHmOpu4p4BZ0936tZS4Gj7eMUpzyF6AZ6JrN18iwoRzU6iMeaHTMBsIzSbcvM5m6RHEdrSLsT2hYZpCCbKVQ0NWoBpxlHvetYMarun5N7E2byNnLBKeWpD2ZYxgxwh8hTA1IDwxK7fEbnndgnOSNEyRnq68XRELB8dSGSqEKQUzM3uv9kToBTgpNKPvNPw0qZj6lCZciFN5XnXv+XZ9n17B+fTbLr0sx432ZpqpGMPQaaGNfjRzmyn5dtl9tzQviLE1VWcl0LgwLF8I52XnQx2p486Gk87jHRAI9QuQqMjfxVyUGKlwNFb+rOPVlM2KgXfGXlXeAxjLj3SelJLXnlud9BBPjvfUyc55YZiP0BnFlFbAea83YZ+rCHoccoEXrAl0mWP9Y4i+3t0PE9I0yWrtMww3mlcMFeoGudKR/MFuL24z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(336012)(6862004)(8936002)(8676002)(41300700001)(4326008)(70586007)(70206006)(5660300002)(316002)(40480700001)(54906003)(40460700003)(2906002)(478600001)(81166007)(6512007)(82740400003)(53546011)(86362001)(6506007)(186003)(33656002)(356005)(107886003)(36756003)(26005)(6486002)(47076005)(83380400001)(2616005)(82310400005)(36860700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 19:38:06.2037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0766fca6-010d-4a40-c505-08db6857e1ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732

DQoNCj4gT24gOCBKdW4gMjAyMywgYXQgMTg6NDAsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gTUFTS19FWFRSKCkgYW5kIE1BU0tfSU5TUigp
IGFyZSBhIG1hdGNoaW5nIHBhaXIuICBLZWVwIHRoZW0gdG9nZXRoZXIuDQo+IA0KPiBGaXhlczog
NTZhN2FhYTE2YmZlICgidG9vbHM6IGFkZCBwaHlzaW5mbyBhcmNoX2NhcGFiaWxpdGllcyBoYW5k
bGluZyBmb3IgQXJtIikNCg0KSSBkb27igJl0IHRoaW5rIHRoaXMgcGF0Y2ggaXMgZml4aW5nIGEg
YnVnOg0KDQojIyMgRml4ZXM6DQoNCklmIHlvdXIgcGF0Y2ggZml4ZXMgYSBidWcgaW4gYSBzcGVj
aWZpYyBjb21taXQsIGUuZy4geW91IGZvdW5kIGFuIGlzc3VlIHVzaW5nDQpgYGdpdCBiaXNlY3Rg
YCwgcGxlYXNlIHVzZSB0aGUgYEZpeGVzOmAgdGFnIHdpdGggdGhlIGZpcnN0IDEyIGNoYXJhY3Rl
cnMgb2YNCnRoZSBjb21taXQgaWQsIGFuZCB0aGUgb25lIGxpbmUgc3VtbWFyeS4NCg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpC
dXQgaXQgbWFrZXMgc2Vuc2UsIHNvIA0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVj
YS5mYW5jZWxsdUBhcm0uY29tPg0KDQo+IC0tLQ0KPiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+IENDOiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+IC0tLQ0K
PiB0b29scy9pbmNsdWRlL3hlbi10b29scy9jb21tb24tbWFjcm9zLmggfCAxICsNCj4gdG9vbHMv
bGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oICAgICAgIHwgMiAtLQ0KPiAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2luY2x1ZGUveGVuLXRvb2xzL2NvbW1vbi1tYWNyb3MuaCBiL3Rvb2xzL2luY2x1ZGUveGVu
LXRvb2xzL2NvbW1vbi1tYWNyb3MuaA0KPiBpbmRleCBkNTNiODgxODI1NjAuLjE2ODY5MWJlMGU5
MyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5o
DQo+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVuLXRvb2xzL2NvbW1vbi1tYWNyb3MuaA0KPiBAQCAt
NzMsNiArNzMsNyBAQA0KPiAjZW5kaWYNCj4gDQo+ICNkZWZpbmUgTUFTS19FWFRSKHYsIG0pICgo
KHYpICYgKG0pKSAvICgobSkgJiAtKG0pKSkNCj4gKyNkZWZpbmUgTUFTS19JTlNSKHYsIG0pICgo
KHYpICogKChtKSAmIC0obSkpKSAmIChtKSkNCj4gDQo+ICNpZm5kZWYgX19tdXN0X2NoZWNrDQo+
ICNkZWZpbmUgX19tdXN0X2NoZWNrIF9fYXR0cmlidXRlX18oKF9fd2Fybl91bnVzZWRfcmVzdWx0
X18pKQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oIGIv
dG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oDQo+IGluZGV4IDhhYmEzZTEzODkwOS4u
NjFmNGZlMWRlYzU1IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVy
bmFsLmgNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oDQo+IEBAIC0x
MzIsOCArMTMyLDYgQEANCj4gDQo+ICNkZWZpbmUgRElWX1JPVU5EVVAobiwgZCkgKCgobikgKyAo
ZCkgLSAxKSAvIChkKSkNCj4gDQo+IC0jZGVmaW5lIE1BU0tfSU5TUih2LCBtKSAoKCh2KSAqICgo
bSkgJiAtKG0pKSkgJiAobSkpDQo+IC0NCj4gI2RlZmluZSBMSUJYTF9fTE9HR0lOR19FTkFCTEVE
DQo+IA0KPiAjaWZkZWYgTElCWExfX0xPR0dJTkdfRU5BQkxFRA0KPiAtLSANCj4gMi4zMC4yDQo+
IA0KDQo=

