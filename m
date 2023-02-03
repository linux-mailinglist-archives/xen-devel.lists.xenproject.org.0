Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AF6893BC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 10:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489123.757474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsP3-0005WS-Ug; Fri, 03 Feb 2023 09:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489123.757474; Fri, 03 Feb 2023 09:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNsP3-0005UI-Rj; Fri, 03 Feb 2023 09:30:41 +0000
Received: by outflank-mailman (input) for mailman id 489123;
 Fri, 03 Feb 2023 09:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdRq=57=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pNsP2-0005UA-1z
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 09:30:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ea88e3-a3a5-11ed-9254-a70e01b1f5fa;
 Fri, 03 Feb 2023 10:30:36 +0100 (CET)
Received: from DUZPR01CA0143.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::8) by DB9PR08MB9609.eurprd08.prod.outlook.com
 (2603:10a6:10:456::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 09:30:33 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::25) by DUZPR01CA0143.outlook.office365.com
 (2603:10a6:10:4bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29 via Frontend
 Transport; Fri, 3 Feb 2023 09:30:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.28 via Frontend Transport; Fri, 3 Feb 2023 09:30:33 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Fri, 03 Feb 2023 09:30:33 +0000
Received: from 2d13f1f8dc08.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59AA9E84-DD9B-4384-BFB6-EDF221C0024D.1; 
 Fri, 03 Feb 2023 09:30:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d13f1f8dc08.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Feb 2023 09:30:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9534.eurprd08.prod.outlook.com (2603:10a6:10:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 09:30:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:30:23 +0000
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
X-Inumbo-ID: 69ea88e3-a3a5-11ed-9254-a70e01b1f5fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3UXGkM8sEuphNbb6hidIEP8SyILN4ARAxcRLlt4LEo=;
 b=e897JJAsyIQNgdUSCqMCw03DafvCtSLwF2wmROJWCB8ltzr4qzfgySi6IjtmEjxnTXAvGK0TgfQ3n3JlhE0PgnrRBnwH7B3T2QGhIX6hiQU1S54iW9g+NiwbKjLOCkPd7i1soSEH4AXvNC0NbdY/wR6acC60g9nBc00M1RIC0sA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8e37d4e84fe9187
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8apfnEPmlIpAwqqoSI4MQIb/wfP3oosxM+exw2EwfG9CvVzOiemGlrmaD8aody19yxWxtfZakfCziAtoDxrCea6TvGRwt8/EGbRz5Xhz+KO+001IlKHqhsbgJhQrDDwGSrwFK02mVVNebisPHWbvtHs46ZSrx56gQFoSSJKT8+J3c7zVaKjLHAHPW1qlN4skwWGUvzJIgZ3TNYSSXtX69Qj4R7ReJ1FUCpTh+qXsuHC2UeSqOchtuvZyjrLzsbKz1qQ7eQ/c01/VzzuD/Mgt5jWOPdWYF7vXlWK578xZv4YIKavlAxiD9btBiTLkk0w+VnixAcUyL3NApM0NrN/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3UXGkM8sEuphNbb6hidIEP8SyILN4ARAxcRLlt4LEo=;
 b=OYWVsCG8vUgE2jksEchCnQajOh5HDakAaM5f451w9SaDqiJYT0KTapi/vmOWqFjfrgcFOeVOygUPBnaakLI5J8tg728AOb+qC8cleMXHyeDm3OQu5KTrIdKm3ARw3Kvk1KWipuNsPTF66p557G3lixL4b9gSUtOGw09ZpPX23Xoo8+9UG9sgT/fBWsT9m52Q5jKaSpRd62kQpyuikrePNf+pIZG0EGl2Zt2bdwBUr0RUK3+pXuZ06eC3FvJSFHL5JrYaYo9DMQkZv98rm752CqAkDIhoMrtrXd4AtuLDgDVW8bB9lcYLuwFE7DN308GYCpSZRu17tZ3FqycvvL+ySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3UXGkM8sEuphNbb6hidIEP8SyILN4ARAxcRLlt4LEo=;
 b=e897JJAsyIQNgdUSCqMCw03DafvCtSLwF2wmROJWCB8ltzr4qzfgySi6IjtmEjxnTXAvGK0TgfQ3n3JlhE0PgnrRBnwH7B3T2QGhIX6hiQU1S54iW9g+NiwbKjLOCkPd7i1soSEH4AXvNC0NbdY/wR6acC60g9nBc00M1RIC0sA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
Subject: Proposal: List files in Xen originated from external sources
Thread-Topic: Proposal: List files in Xen originated from external sources
Thread-Index: AQHZN7IjdE2jT11hbUWRAoU6FDszqA==
Date: Fri, 3 Feb 2023 09:30:22 +0000
Message-ID: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9534:EE_|DBAEUR03FT035:EE_|DB9PR08MB9609:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6e7b72-a12b-42f7-19ba-08db05c94c9b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C9zD85RqgZKNMbFz/fkbaoJnppy8kLwuzRMykWPhMZjYxRCtauVLvtuj58Ty69EuOZhzYFAY1DDgE4sQ0JOL77doq/8GhXjbn0pqtleQDly8mAIdv3OYydGfLy7UWlOdtrzSGEzh+7qAu1vIzSb8V80eyzk3/v9C9vXglbLgLrkX1qJZ0jm94NJqEPLWndiUBZ0MXzhpjcrJCmGaDFOJTbyHBUl0v0jK3bo0T9Ia/uAWAs1M3W+lCbSq+53uecDiIBaKrVBiFaN39HGPHQH6v3kDczTw6f0ip5LMlT7dfPYUj2LLQfha0tq/eMX53Xp+IB2vD4TlCv0mDCXCpN/T2uytgWV864L9kuAoAOJUNb5iqOTq3NJ5iFBcUJglB6PPq+/uTPPg8VXHNKxIJuSsNnbSr1aJlfcz0wqmLL7W2atTD9IWd1LGJ3aHPjACUapvCh4k68r+FKzjQM3yhDtezmpFevyL7ACUf7+QXb+NsPat9nGdOifPXjy9OQ61ysaX3TcN/4XaMrbfwpdUPyWSPUzdBX1MjiMguAVEio1y0ZRVtjTc9kMo8gn819wEs53shA+zd83TlQ7XdNmCAtlglUs+Y8pm3V1tCCyMC5ESzublKpkOaVqi4I5/qos0NWzVF6oxAzPud5LbukWx5BqABorQ00bCbYl26YgNizSCacFAyQuX4j/vCAoKSQtP+otXw+JFurGML+0wcPvKCzzq59hiLAJSHdtf4yZWA4fxLQPvPs8pQRciVijThgP9ypK4UYJg8ZtWgFFmU13RMvGjew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199018)(26005)(186003)(6512007)(122000001)(5660300002)(8936002)(38100700002)(71200400001)(2906002)(6506007)(33656002)(41300700001)(38070700005)(36756003)(64756008)(2616005)(966005)(86362001)(6486002)(6916009)(4326008)(8676002)(66446008)(66946007)(76116006)(54906003)(66556008)(66476007)(478600001)(316002)(83380400001)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4EB2117C897424791611F0C6F565B79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9534
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a22df167-4223-49a3-a1f8-08db05c94659
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p4Nsw+PUk6Must/p2LWfwEjahtWm7asMrs4N7//rFNh0AuPkGsWpbXSP/ixu0lxV9Wz0a9HU+zg0m4n+xDuy9RXJC8ucBky2vsOaKWs4S1FhaK+TUzXmtQcewn3Jpg4YMnfmQklpyWMx+vL3H2nbw9ae8Qm4dVcO963qrPDOc61qOBJ1g5GooP06XnNB/jAxlUEYei92NgZLVQJMbk2+it7JDj9I47iC8T4rvQUa53b5KeVfvpRiVtamq1Q4UoZ5oIdD9j/o7mU4xbDc9DqX020E9gVBRydFPNbB1JubzcHzAycmXRpiz0P6ojYBufHlAT/b2TmN7Bg5wGxLXSZ68fgG+R9tUF49ZBWRPzsBqSNRc06Ut4Z0TgS/J4luaThdsciHi4i02AAl/R+V8PJFJw2imZOjV1Ee7Zq9JLHmJr2d1tip1UtVcut/SDDIA0a2OQa5jaaj3JSy2hmeA2Z66fWlgHB03tvFfAHZva9ma5pvKCB91JoWgZAiPgxMtlq2IF2YkXRITAcuQ04icfx2jEvOJJHcJu463LnT8b+GyImWnR2oZF2UY0GdPQFfobLsbfRVbyhJ6kdjGFPgy+abPSaxmzBgufjqjrzu3ZsR6C9Rcx2K8VLT+REAtbdZ0ZgjJuEc1MJCPhJ3KHmZ0wY/Ib5zmAir4CQ9OtkP2Il1eHpLQURfhewVh/ph2DFKwMNgbHqyDuMxj8h4Ohpdx23+cgFIyPwLEQTe/9GiLLFyU7c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(186003)(6512007)(4326008)(26005)(2616005)(6506007)(8676002)(6916009)(70206006)(70586007)(82310400005)(54906003)(5660300002)(47076005)(336012)(83380400001)(478600001)(2906002)(36756003)(86362001)(40480700001)(36860700001)(82740400003)(33656002)(40460700003)(8936002)(316002)(966005)(356005)(41300700001)(6486002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:30:33.4699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6e7b72-a12b-42f7-19ba-08db05c94c9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9609

SGkgYWxsLA0KDQpJ4oCZbSBzdGFydGluZyBhIHByb3Bvc2FsIGZvciB0aGUgZXh0ZXJuYWwgZmls
ZXMgdGhhdCBuZWVkcyB0byBiZSByZW1vdmVkIGZyb20gdGhlIE1JU1JBIHNjYW4sDQp0aGUgd29y
ayB3YXMgb3JpZ2luYWxseSBzdGFydGVkIGJ5IE1pY2hhbCBoZXJlOg0KaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRjaC8yMDIyMTExNjA5MjAzMi40NDIz
LTEtbWljaGFsLm9yemVsQGFtZC5jb20vDQpzbyBJIHN0YXJ0ZWQgYnkgdGhhdCB0aHJlYWQsIHRo
ZSBhaW0gb2YgdGhpcyB3b3JrIGlzIHRvIGhhdmUgYW4gaW5pdGlhbCBmb3JtYXQgdG8gc3RhcnQg
YXMgc29vbiBhcyBwb3NzaWJsZSB0bw0KZXhjbHVkZSB0aGUgZXh0ZXJuYWwgZmlsZXMgZnJvbSB0
aGUgTUlTUkEgc2NhbiAoYXQgbGVhc3QgaW5pdGlhbGx5IGZyb20gY3BwY2hlY2spLg0KDQpJIHRo
aW5rIHdlIGNhbiB1c2UgdGhlIEpTT04gZm9ybWF0IGJlY2F1c2UgaXTigJlzIGVhc3kgdG8gaW50
ZWdyYXRlIGl0IHdpdGggcHl0aG9uIGFuZCBpdOKAmXMgZWFzeSB0byBhZGQvcmVtb3ZlDQpmaWVs
ZHMgZnJvbSB0aGUgc3RydWN0dXJlIHdpdGhvdXQgaW50ZXJmZXJpbmcgd2l0aCB0aGUgb3RoZXIg
ZWxlbWVudHMgZHVyaW5nIHRpbWUsIHNvIHdlIGNhbiBkZWZpbmUgYSBzdHJ1Y3R1cmUNCm5vdyBi
dXQgaWYgaW4gdGhlIGZ1dHVyZSB3ZSBzZWUgdGhlIG5lZWRzIGZvciBhZGRpdGlvbmFsIGZpZWxk
LCB3ZSBjYW4ganVzdCBhZGQgdGhlbSB3aXRob3V0IGNoYW5nZXMgdG8gdGhlDQphbmFseXNpcyBz
Y3JpcHQuDQoNCkluIG15IG9waW5pb24gbWFueSBvZiB0aGVzZSBmaWVsZHMgY2FuIGJlIGxlZnQg
ZW1wdHkgaW4gYSBmaXJzdCBwdXNoLCB0byBsZXQgdGhlIHNjcmlwdCBleGNsdWRlIHRoZSBmaWxl
cyBhbmQgZHVyaW5nDQp0aW1lIHdpdGggdGhlIGNvbnRyaWJ1dGlvbnMgb2YgdGhlIGNvbW11bml0
eSB3ZSBjYW4gYWRkIHRoZSBtaXNzaW5nIGluZm9ybWF0aW9ucy4NCkkgdGhpbmsgaXTigJlzIGVh
c2llciBmb3IgdGhlIGNvbW11bml0eSB0byBwaWNrIGFuIGVudHJ5LCBkbyBzb21lIHJlc2VhcmNo
IHRvIGZpbGwgdGhlIGdhcHMgYW5kIHB1c2gsIGluc3RlYWQgdG8gd2FpdA0KdW50aWwgaGF2aW5n
IGFsbCB0aGUgaW5mb3JtYXRpb25zIGJlZm9yZSBhZGRpbmcgdGhlIGVudHJ5Lg0KDQoNClRoaXMg
aXMgbXkgZmlyc3QgdGhvdWdoIGZvciB0aGUgZmllbGRzLCBsZXQgbWUga25vdyB5b3VyczoNCg0K
ZG9jcy9taXNyYS9leHRlcm5hbC1maWxlcy5qc29uOg0Kew0KICJ2ZXJzaW9uIjogIjEuMOKAnSwN
CiAiY29udGVudCI6IFsNCiAgIHsNCiAgICAgInBhdGgiOiAicmVsYXRpdmUvcGF0aC9mcm9tL3hl
bi/igJwsDQogICAgICJiYWNrcG9ydCI6IFRydWUvRmFsc2UsDQogICAgICJvcmlnaW5fcHJvamVj
dCI6ICJVUkwgdG8gb3JpZ2luIHByb2plY3QiLA0KICAgICAib3JpZ2luX3BhdGgiOiAicmVsYXRp
dmUgcGF0aCBpbiB0aGUgb3JpZ2luYWwgcHJvamVjdCIsDQogICAgICJvcmlnaW5fcmV2aXNpb24i
OiAicmV2aXNpb24gaW4gb3JpZ2luYWwgcHJvamVjdOKAnQ0KICAgfQ0KIF0NCn0NCg0KDQpNYXli
ZSwgZG9jdW1lbnRhdGlvbiBmb3IgdGhpcyBmaWxlIGFuZCB0aGUgZmllbGRzIGNhbiByZXNpZGUg
aW4gZG9jcy9taXNyYS9leHRlcm5hbC1maWxlcy5yc3QuDQoNCkhlcmUgZm9sbG93cyB0aGUgZXhw
bGFuYXRpb24gZm9yIHRoZSBmaWVsZHM6DQoNCnBhdGg6IGlzIGEgcmVsYXRpdmUgcGF0aCBmcm9t
IHRoZSB4ZW4gYmFzZSBmb2xkZXIsIGl0IGNhbiByZWZlciB0byBhIGZpbGUgb3IgaXQgY2FuIGJl
IGEgcGF0aCB0byBhbiBlbnRpcmUgZm9sZGVyDQogICAgICAgICAoVGFraW5nIGFzIGV4YW1wbGUg
bGliZmR0KQ0KDQpiYWNrcG9ydDogaXTigJlzIGEgYm9vbGVhbiBmbGFnIHRoYXQgc2F5cyBpZiB0
aGUgZmlsZSBpcyBzdWJqZWN0IHRvIGJhY2twb3J0LCBzbyBldmVyeSBmaWxlIHdoZXJlIHRoaXMg
ZmllbGQgaXMgdHJ1ZQ0KICAgICAgICAgICAgICAgIHdvbuKAmXQgYmUgaW5jbHVkZWQgaW4gdGhl
IGFuYWx5c2lzLiBBIGZpbGUgaXMgc3ViamVjdCB0byBiYWNrcG9ydCB3aGVuIGl04oCZcyBleHRl
cm5hbCBhbmQgaXQgZG9lc27igJl0DQogICAgICAgICAgICAgICAgYWNjZXB0IGRpcmVjdCBjaGFu
Z2VzIChjaGFuZ2VzIG5lZWRzIHRvIGJlIG1hZGUgaW4gdGhlIG9yaWdpbmFsIHByb2plY3QgYW5k
IHRoZW4gYmFja3BvcnRlZA0KICAgICAgICAgICAgICAgIHRvIFhlbikNCg0Kb3JpZ2luX3Byb2pl
Y3Q6IHVybCBvZiB0aGUgcmVwb3NpdG9yeSB3aGVyZSB0aGlzIGZpbGUgd2FzIG9yaWdpbmF0ZWQN
Cg0Kb3JpZ2luX3BhdGg6IHJlbGF0aXZlIHBhdGggaW4gdGhlIG9yaWdpbmFsIHByb2plY3QsIG1v
c3RseSBsaW5rZWQgdG8gdGhlIG9yaWdpbmFsX3JldmlzaW9uIGZpZWxkDQoNCm9yaWdpbl9yZXZp
c2lvbjogcmV2aXNpb24gb2YgdGhlIGNoYW5nZXMgaW4gdGhlIHJlcG9zaXRvcnkgd2hlbiB0aGlz
IGZpbGUgd2FzIHRha2VuLg0KDQoNCk5vdywgSeKAmW0gbm90IGVudGlyZWx5IHN1cmUgYWJvdXQg
dGhlIGZpZWxkIOKAnGJhY2twb3J04oCdLCBiZWNhdXNlIGlmIGEgZmlsZSBpcyBub3Qgc3ViamVj
dCB0byBiYWNrcG9ydCwgdGhlbiB3aHkNCndlIHNob3VsZCBub3QgbWFrZSBkaXJlY3QgY2hhbmdl
cz8gU2hhbGwgd2UgbWF5YmUgY2hhbmdlIGl0cyBjb2Rlc3R5bGUgYW5kIGNvbnZlcnQgaXQgdG8g
WGVuIGNvZGVzdHlsZT8NCkFuZCB0aGVuLCBpZiB0aGUgZmlsZSBpcyBub3Qgc3ViamVjdCB0byBi
YWNrcG9ydCBhbmQgbm93IHdlIOKAnG93buKAnSB0aGUgZmlsZSwgdGhlcmUgaXMgbm8gbW9yZSB0
aGUgbmVlZCB0byBsaXN0IGl0DQppbiB0aGUgZXh0ZXJuYWwgZmlsZSwgYSBjb21taXQgc2VhcmNo
IGNhbiByZXZlYWwgd2hlbiBpdCB3YXMgY29udmVydGVkIHRvIFhlbiBjb2Rlc3R5bGUgYW5kIHJl
bW92ZWQgZnJvbQ0KdGhlIGV4dGVybmFsIGZpbGUgbGlzdCBzbyB3ZSBkb27igJl0IGxvc2UgdGhl
IGhpc3RvcnkuDQpTbyB3ZSB3b3VsZCBlbmQgdXAgZXhjbHVkaW5nIGp1c3QgYWxsIHRoZSBmaWxl
IGxpc3RlZCBpbiBleHRlcm5hbC1maWxlLmpzb24gYnkgdGhlIGFuYWx5c2lzLg0KDQpXaGF0IGFy
ZSB5b3VyIHRob3VnaHRzIGFib3V0IHRoYXQ/IFRoYW5rIHlvdQ0KDQoNCkNoZWVycywNCkx1Y2E=

