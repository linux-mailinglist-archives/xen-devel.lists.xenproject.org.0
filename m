Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FF87AE997
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 11:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608380.946832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4kH-0003W7-D9; Tue, 26 Sep 2023 09:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608380.946832; Tue, 26 Sep 2023 09:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4kH-0003Tz-9q; Tue, 26 Sep 2023 09:52:45 +0000
Received: by outflank-mailman (input) for mailman id 608380;
 Tue, 26 Sep 2023 09:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hi6D=FK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ql4kG-0003Tq-Ey
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 09:52:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed4df70-5c52-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 11:52:41 +0200 (CEST)
Received: from AS8P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::19)
 by PAWPR08MB9782.eurprd08.prod.outlook.com (2603:10a6:102:2e2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Tue, 26 Sep
 2023 09:52:38 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::ed) by AS8P250CA0014.outlook.office365.com
 (2603:10a6:20b:330::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 09:52:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 09:52:38 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 26 Sep 2023 09:52:38 +0000
Received: from e355761c3863.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D0ACDA4-253A-4A67-8424-34A6CC3BD68E.1; 
 Tue, 26 Sep 2023 09:52:31 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e355761c3863.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 09:52:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9861.eurprd08.prod.outlook.com (2603:10a6:10:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 09:52:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 09:52:28 +0000
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
X-Inumbo-ID: 6ed4df70-5c52-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDJmPYkWBxLI7LMIuGpUjNKZoPx2gSXZLKZHtMWoivo=;
 b=nvxFTN5oWXm2rJo+v5CiDcCrJUAc+ick9cEIAYwEQP/N2/w3z3n2RqFBqNVn1N8RAXygVCW6bdyZMghBavpKwvDT9w2hmBUGLOO36Nlgv3RajFAVShXDq5uBt3AozvEiqVT/k0BcdITt2LfxcIMMqss6ZeNC3u2lLrgUYpl1iXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57d88e91e58ad98d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJk9QTi0NNZVZGgr8a9LITcm+BaD3KYllGr90YhdIoPLTIB14QRiu6n1+lGaDaJMlpaRi73YbQ2Ree9S29h6uWs3A9MojunWJPnehP1TRnp88sMO034eYrAJ47njTE2LLsLUNshR/xuwV1rKkdc2kSXw47hjbu46oq2n5CBW9iudGi681uBkYD8HBjiJz53Ajq7bwk+rThVBldFdRB0Nbd2VzAUWxFkrFkUFuTSQ5Jv420iXvFw3jYoMt5BH6WNEHwCcPScg1lIWS37VdmH17BrPtEGPSLmkfhx8AV4s530Aza6tld3ETILD5KUhMqmteN33fxhbctmpfYSMMlwV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDJmPYkWBxLI7LMIuGpUjNKZoPx2gSXZLKZHtMWoivo=;
 b=HQj0wYDpAhris1FJuw+Z8hTZB1eklyZlEEsFgQG3NHlIxYj+h2X4e8fybUAyMQgEKc0XQqqKkZUYsjQRvaiQc6nNF19AYtOqs8KDQP95YzF4nDd0RQV+ccCSR7SGFVjtLiRRLZ6d+eTq2yHzhYHUGzFoR8bsxDgWlfIIuu5JF446n3dvx4qTXEOk2Iziq+ROusR6SLyjJ7G32hZ1wqJ00+ckAt1aL5hrYsUi86neOTsOTo1wsIc6ig9y66E+y8cMFQXAEjbYingxUNNp+MMMtRupzYwxK9Up6C1AKkYBCOsojb1pDqaP5928WHGR5CCIZGAQM1KeOTiWlxStD53F2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDJmPYkWBxLI7LMIuGpUjNKZoPx2gSXZLKZHtMWoivo=;
 b=nvxFTN5oWXm2rJo+v5CiDcCrJUAc+ick9cEIAYwEQP/N2/w3z3n2RqFBqNVn1N8RAXygVCW6bdyZMghBavpKwvDT9w2hmBUGLOO36Nlgv3RajFAVShXDq5uBt3AozvEiqVT/k0BcdITt2LfxcIMMqss6ZeNC3u2lLrgUYpl1iXg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Thread-Topic: [PATCH] xen/arm: Skip memory nodes if not enabled
Thread-Index: AQHZ8DsUAeh4H14sIUq1QR77iDXfDrAs3c8A
Date: Tue, 26 Sep 2023 09:52:28 +0000
Message-ID: <BDC53ABB-AC26-45AF-A8FC-E12C83209400@arm.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
In-Reply-To: <20230926053333.180811-1-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9861:EE_|AM7EUR03FT059:EE_|PAWPR08MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: 1435b5db-c7e2-4ca9-9e1e-08dbbe765160
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vVJobgF80hVkr0N9sGaa+l3JeX99gMKQbrP7onUZwrZG5ayoVr6WoEiicl52qHZ9p2NK2d2RNgQ/oMJTrXdqpSQgefeMtjloGyBZBBgjiG+YhMYawes7AVSuzzWCYyYTeSw6V1sRhpRhHftXdBo2eDj4PwiLk7hfEjjyWT3bZ8NU1LaONmAexO/uRLfBsvgQkXWrw0P7C/uviLM+D1rsTPxHwT0HLkeevG//fY4e1Uz+TsF4afWTdyd5TwCniSL6DIj/UOIDj4YuOoUl3UdBYWt/AxvWcxzl8BlYz8FGYYwJkCwYS/sNeJOtYnIGjBercmmdbPIaH2QHBzQq7iweI+TKygtsuw8ZrssLmwEI67g7/+ME3ZcRp/UkEJd/BviEJruOjdnVLhV1U9+hOhlWdCw7sR2iOLFAgQivUp8cDC17iO31OvL0prjqKp+p30Q4Ya+WrnzCyFLJTWzfgLESuFVKuGsnf7ZD+nWJs3h66n5QLF95IyZWtL8omg+j6Nirmy6rrPG2JNcENjmO7c5glJE8J9k3HIpi9dU9z/afaFNGSq+LX/mF7efkxqiDwKAsa/fJAzPjfgd6R7PyLB/xF6U9Je7u9+E2rEnyJbIbemOslhCp3dE0S2ghB/ObtIi33AVHikNy5H5qZFTUfm4jGA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(122000001)(38100700002)(38070700005)(33656002)(36756003)(86362001)(66446008)(6506007)(6512007)(6486002)(478600001)(53546011)(2906002)(5660300002)(8936002)(41300700001)(91956017)(8676002)(4326008)(71200400001)(83380400001)(76116006)(2616005)(64756008)(66556008)(66476007)(66946007)(316002)(6916009)(54906003)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADB85B13961C0F4C82B97FAC72CC8422@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9861
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2b666fe-6c6f-4e4a-3057-08dbbe764ba4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4T6MIBQRpR3QJPJEqstbY6YqdBC+qs5vVfug55j9VH3Hl1ReoV+Lo/QDywsKP1KEbcXv/1ha361niU+txsicM0l9FzVL0wLf8icSf3y/v23lVQSmVJOJmmlijEZ0eJbFPxS0EAKlMKHGi6JWumhGmbFEGr8Pp8VFwFNuDThdAZZ8K8k4Rz9C4ACrbK15UsSuTYX8IriyCBCOWpnbLFpHiNS0XIiC244HKRDpO5KXoI3h8is6rSkUWKTFyWvXnBpizG1nTfFSBoXVr2Hgj8HvhX+OH743V+SZ/osie4f7+wBUn7Lsv551jQzak4BzXiXygcYC+GmbojHzYESbDVi/GJV2PRvkFCWHjU+kYVQLesMT2pnxpPbh+1VghYmeatwJwF6CICiQZTI90FpVFh6AHnJExi0SRMXe3oIpzRGEFa/gMBTVpmOVWeTX9OWzn8UCeQTxDHbxTxbYeYzROHCrGBlU7DlDFBcbG712sEtDEWNok1nN4Y8pcYLQwmFVnXbFgQP2aW8lF0ysweRvcfxJys2oBm5oquFanBh3t6uSZc65cnNk5wPB/tjBF2AUYU778wSmnDlqejRAROh80cdHXkrYp6ohfAwlKOTUqjnVXHN2lAVf9XHN7FWncctNTk6vnRDBLaXY90R0/z/FrVSoBMQwLrYeDERRQVxGEL/1rJ9tfMQLC+CGWAsq4cNPgjyQ9vpqVv4kDJJOtfY5Wyl0WvNOCombbWIPNPYir8kNPUhPpk+M1H05//EnM9L+umO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(46966006)(36840700001)(53546011)(4326008)(6862004)(8676002)(83380400001)(316002)(8936002)(5660300002)(54906003)(2906002)(6486002)(6506007)(2616005)(70586007)(70206006)(6512007)(478600001)(336012)(41300700001)(26005)(47076005)(107886003)(36860700001)(36756003)(40460700003)(82740400003)(81166007)(356005)(33656002)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 09:52:38.3137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1435b5db-c7e2-4ca9-9e1e-08dbbe765160
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9782

DQoNCj4gT24gMjYgU2VwIDIwMjMsIGF0IDA2OjMzLCBMZW8gWWFuIDxsZW8ueWFuQGxpbmFyby5v
cmc+IHdyb3RlOg0KPiANCj4gRHVyaW5nIHRoZSBMaW51eCBrZXJuZWwgYm9vdGluZywgYW4gZXJy
b3IgaXMgcmVwb3J0ZWQgYnkgdGhlIFhlbg0KPiBoeXBlcnZpc29yOg0KPiANCj4gIChYRU4pIGFy
Y2gvYXJtL3AybS5jOjIyMDI6IGQwdjA6IEZhaWxpbmcgdG8gYWNxdWlyZSB0aGUgTUZOIDB4MWEw
MmRjDQo+IA0KPiBUaGUga2VybmVsIGF0dGVtcHRzIHRvIHVzZSBhbiBpbnZhbGlkIG1lbW9yeSBm
cmFtZSBudW1iZXIsIHdoaWNoIGNhbiBiZQ0KPiBjb252ZXJ0ZWQgdG86IDB4MWEwMmRjIDw8IFBB
R0VfU0hJRlQsIHJlc3VsdGluZyBpbiAweDFfYTAyZF9jMDAwLg0KPiANCj4gVGhlIGludmFsaWQg
bWVtb3J5IGZyYW1lIGZhbGxzIGludG8gYSByZXNlcnZlZCBtZW1vcnkgbm9kZSwgd2hpY2ggaXMN
Cj4gZGVmaW5lZCBpbiB0aGUgZGV2aWNlIHRyZWUgYXMgYmVsb3c6DQo+IA0KPiAgcmVzZXJ2ZWQt
bWVtb3J5IHsNCj4gICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMj47DQo+ICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDB4MDI+Ow0KPiAgICAgICAgICByYW5nZXM7DQo+IA0KPiAgLi4uDQo+
IA0KPiAgICAgICAgICBldGhvc25fcmVzZXJ2ZWQgew0KPiAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsNCj4gICAgICAgICAgICAgICAgICByZWcgPSA8MHgw
MSAweGEwMDAwMDAwIDB4MDAgMHgyMDAwMDAwMD47DQo+ICAgICAgICAgICAgICAgICAgc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gICAgICAgICAgICAgICAgICBuby1tYXA7DQo+ICAgICAgICAgIH07
DQo+IA0KPiAgLi4uDQo+ICB9Ow0KPiANCj4gWGVuIGV4Y2x1ZGVzIGFsbCByZXNlcnZlZCBtZW1v
cnkgcmVnaW9ucyBmcm9tIHRoZSBmcmFtZSBtYW5hZ2VtZW50DQo+IHRocm91Z2ggdGhlIGR0X3Vu
cmVzZXJ2ZWRfcmVnaW9ucygpIGZ1bmN0aW9uLiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhlDQo+IHJl
c2VydmVkIG1lbW9yeSBub2RlcyBhcmUgcGFzc2VkIHRvIHRoZSBMaW51eCBrZXJuZWwuIEhvd2V2
ZXIsIHRoZSBMaW51eA0KPiBrZXJuZWwgaWdub3JlcyB0aGUgJ2V0aG9zbl9yZXNlcnZlZCcgbm9k
ZSBzaW5jZSBpdHMgc3RhdHVzIGlzDQo+ICJkaXNhYmxlZCIuIFRoaXMgbGVhZHMgdG8gdGhlIExp
bnV4IGtlcm5lbCB0byBhbGxvY2F0ZSBwYWdlcyBmcm9tIHRoZQ0KPiByZXNlcnZlZCBtZW1vcnkg
cmFuZ2UuDQoNCkkgbWlnaHQgYmUgd3JvbmcsIGJ1dCByZWFkaW5nIHRoZSBzcGVjaWZpY2F0aW9u
cyBzZWVtcyB0aGF0IOKAnHN0YXR1c+KAnSBpcyBub3QgYSBwcm9wZXJ0eQ0Kb2YgdGhlIGNoaWxk
IG5vZGVzIG9mIC9yZXNlcnZlZC1tZW1vcnksIHNvIEnigJltIG5vdCBzdXJlIFhlbiBzaG91bGQg
ZG8gc29tZXRoaW5nIGFib3V0IGl0Lg0KDQpJZiBpdCBpcyB0aGUgY2FzZSwgaXTigJlzIHBvc3Np
YmxlIHRoYXQgdGhlIGRldmljZSB0cmVlIGlzIHdyb25nIGluIHRoaXMgY2FzZS4NCg0KDQo=

