Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEDE769A88
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573132.897541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUaA-0002Ee-AV; Mon, 31 Jul 2023 15:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573132.897541; Mon, 31 Jul 2023 15:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUaA-0002Cy-79; Mon, 31 Jul 2023 15:13:14 +0000
Received: by outflank-mailman (input) for mailman id 573132;
 Mon, 31 Jul 2023 15:13:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3vB=DR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qQUa7-0002Cs-TG
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:13:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1def3e7-2fb4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 17:13:09 +0200 (CEST)
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by AS8PR08MB6405.eurprd08.prod.outlook.com
 (2603:10a6:20b:332::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:12:39 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::b9) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42 via Frontend
 Transport; Mon, 31 Jul 2023 15:12:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.42 via Frontend Transport; Mon, 31 Jul 2023 15:12:38 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Mon, 31 Jul 2023 15:12:38 +0000
Received: from 40ee7dd352df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21C1571E-2451-4539-A0FC-50B99ECAA134.1; 
 Mon, 31 Jul 2023 15:11:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40ee7dd352df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 31 Jul 2023 15:11:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6559.eurprd08.prod.outlook.com (2603:10a6:102:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 15:11:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 15:11:56 +0000
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
X-Inumbo-ID: c1def3e7-2fb4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyxGJmuhSR0pSU7rr9xzMVldaOtVAHUzhStjevrfrLY=;
 b=J02Vujdo1Acwj9lJruyjCWEqkeMa//pftFIqnhLDt4BHOTaLgVCuEw5GHCCYr+ock6QAl2tNXpbjhmU5Wn37Oip06sN167nv6BowFaBVwzIvbO39BmOAqlF6+p6Dmh8ZtDZNi/2Hp5eGkz7qcm5a3anqV4GhecJaRRs/kZFzs+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85baaee5ce819909
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1PislAWDjzMlxNbbrsbFZDqB1G+nDnE89IyA0sWVlO0gAekhQhdJj/c08KV6zlOZD+K3A+l7z602eYKHNyGi+puroCllxrnc1YqNeR/3LTyUXt/fRQTaqI48krFN7vq3Y/5Q64087jIo3Lz/As9/ubHgFX74cwPt55PDpF6uc3BW0RRNCdzzUPzUJ4CpBgX74V8UTdp67OcB2C0sr6IvoE3VAoB6rPJLMQQ0DddqEX17y3DUDHlRLPw/DXFTG/YrNumxiA6qjur48NsFmIb8W7DgB+XI+X+1i3Fgxp6mOARtDcF0jXmZBcGBla91+JV4e0iwGG+g+Pety6035DERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyxGJmuhSR0pSU7rr9xzMVldaOtVAHUzhStjevrfrLY=;
 b=aKQMKoGUNbuCxf6smlnIjlMWghTzYoIiBu86wSYrikkAqMX1RpwLR1qd9DDonSxPlhraVUkCYvSfnJKrGejohuTd4Vwy6RjfLKNWC2GSSISltp9HW/SOI1q1SV7F7n2r0X9jsbPQI0RRiYOLA7u/Ow4rZZ9X04hyiW6D35R/gvgy5t23tVpU9ky2n2DVXF/74F6oopwXbslNWWvAfSEj6kIYokiRgxZViayBwgNkrE0EwVnJ53W3AiiomX2i1H0ya242kXCjwMkvix8pptJfmPva91iLMuNk/nOKIEdQZT6h4Q2dlWClHKXktG6E8ZJUX/Mj8T0Qiar5JD1cbC7whw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyxGJmuhSR0pSU7rr9xzMVldaOtVAHUzhStjevrfrLY=;
 b=J02Vujdo1Acwj9lJruyjCWEqkeMa//pftFIqnhLDt4BHOTaLgVCuEw5GHCCYr+ock6QAl2tNXpbjhmU5Wn37Oip06sN167nv6BowFaBVwzIvbO39BmOAqlF6+p6Dmh8ZtDZNi/2Hp5eGkz7qcm5a3anqV4GhecJaRRs/kZFzs+E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Thread-Topic: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Thread-Index: AQHZwSs9042EQJWI+kCE6wP5BUPzKq/T/JsAgAADsAA=
Date: Mon, 31 Jul 2023 15:11:56 +0000
Message-ID: <2C6F7309-B7EA-4FAA-8C72-E95D253F79FC@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-2-luca.fancellu@arm.com>
 <876c7fa3-6759-ce5a-9e6d-9737eb4eb9ad@suse.com>
In-Reply-To: <876c7fa3-6759-ce5a-9e6d-9737eb4eb9ad@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6559:EE_|DBAEUR03FT033:EE_|AS8PR08MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 9918ad81-d08f-4e47-6f2a-08db91d89438
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XWydXPoF1yvlIvXbQOvrlKJrTVh4nTI36ZhmU0GrAuBOVuKVb7rJ1wwtELuF+qQThr9YkiFT3jH7Veca6cjpJlDp7iumHnML9SbfdVwAY/qzUFTwQxKBdon0YbZcrAgSmVlqhd27yk+1Se7+w8M0lCweQTSj3c+1qt9lsf5mayBtMnUNbFQ3lmNFCqpIHN8vPak2Sz9+tJBw85cFCJWmj+/f4Jcwc8HJCdR/AwRZwq9/c/mC08Nq1Pn6XmlGyP6MJYRXHY8descYHMg58j/9UqvH0BLuQ3j5SPW572EGUqd02UCAc14UFguobukcjRp3+GthpNASjFIv0GQFaNpp86ow84acPancjR2b/OXi/8MMOpaHb34KM7DZjwMm+6foozBhpSW9l4wSlAqJ0bByY4g1+xoY7QVpTvBvpSFE/+QDWNdvedubQiZTy3E4l8+0l6YJxN9HwOoJyYyEfSQN20ff93pKlh0pHA2Qsqkkjpo7gAhwFEi9KdvT+TcHfxceOg6oOuUsvllAVSTpnp1qiTM5I2hwB0G4r/sAoRX1u28HfEhJgoBVTc8bO72VSIiO0aBptAtDYJKPQdd5eKVKsYPiNS9bnq4SCFgbbirbk3o9iMT5tzjAZ2GFiSBElvm28vSybjN9xvz1VijqkGp6lA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(6512007)(6486002)(36756003)(2616005)(26005)(6506007)(186003)(33656002)(76116006)(91956017)(66946007)(66556008)(54906003)(41300700001)(122000001)(38070700005)(66476007)(86362001)(316002)(4326008)(5660300002)(66446008)(64756008)(6916009)(8676002)(8936002)(2906002)(71200400001)(478600001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D51229572973324A924B19E78CBEC6D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6559
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c388af4b-ce0f-47b9-6253-08db91d87acb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jj0BSvteKf7+3PvoIG3xYNwx2tZZlXmeA6azDIqhslo9LBtmYGGQigxc7QeIGJibiGDleNe4xOQ8/WBjHF48n8al2mdKNcU1fw+2eWEbKKJnoRUTXOGHHwSegKWJMB0LdoSK1shARllhf9NdeZD0rC4YqWYJG04bvVWynOKq0yHidzfP1TnPXkDlaE0hOBusYOvsiNpWllu5dnXgTkMRSmGalcnkPhbZ8ykgMiGMT48N+fjxaBIDZ3RJCvgmAPNDnGsx4OrwbufiyFn3JW4ECkUf0rtqweXKUQnWHkVoIlCvjnlTIM/Gco0Rbfm77gKoljb6PfsVsKEv0/FA/ve/XHn637I49mu29A/DR+sX0XFOF0loqyNeNnUHWCxSNWr2XnRlFE26pDAiL+5tHkojpC1goNqjEBjhRCl6BpJ0CQyUAP2AOkbTLi65Yn0EKVVoLYO2mC7c3QzA+I3Xg4C9uN0nd3uZCSLH20DkT7Dg3hewFtX5yMHj0d+4dzzl33xqCPUA0I4OlowHHMvHwGqJROtlToIuC23swl4cukELCGlas/74PO3W7QO71vA47YmZ4SbX64PqNcs/btEhsy7sTXKtPVsjuvYaVl1JwuUlOrz36D1a37H25cyPaWmJlqaCBcCHseBdL72RQwkIwLTkA7BDauVhZsG2OKrQGcHIikR6uLK1h55MQb6MrKrpbeGHK9kBe9nAwmjTfO0O2/0ToEQNUlda13o9Is8+3TBJUorw7t35e6G+HKGYDYY4oeza
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(6512007)(6486002)(36860700001)(33656002)(336012)(186003)(36756003)(47076005)(2616005)(86362001)(81166007)(356005)(82740400003)(26005)(6506007)(40480700001)(5660300002)(41300700001)(6862004)(8936002)(8676002)(70206006)(70586007)(2906002)(316002)(478600001)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:12:38.8278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9918ad81-d08f-4e47-6f2a-08db91d89438
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405

SGkgSmFuLA0KDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgInJlbF9wYXRoIjogImFy
Y2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oIiwNCj4+ICsgICAgICAgICAgICAiY29tbWVudCI6ICJJ
bmNsdWRlcyBtb3N0bHkgYXNzZW1ibHkgbWFjcm8iDQo+PiArICAgICAgICB9LA0KPiANCj4gTWlu
ZCBtZSBhc2tpbmcgd2h5IGFzc2VtYmx5IG1hY3JvcyB3b3VsZG4ndCB3YW50IG1haW50YWluaW5n
IGluIHByb3Blcg0KPiBzdHlsZT8NCg0KRnJvbSB3aGF0IEkga25vdyAoZXhwZXJ0cyBvbiBDRiBj
b3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcpIGNsYW5nLWZvcm1hdCBpcyBtZWFudCB0byBmb3JtYXQg
b25seSBzb21lIGxhbmd1YWdlcw0KKEMvQysrLy4uLikgYW5kIGFzc2VtYmx5IGlzIG5vdCBvbmUg
b2YgdGhlbSwgc28gd2hhdCBpcyBoYXBwZW5pbmcgaXMgdGhhdCBtb3N0IG9mIHRoZSB0aW1lIGNs
YW5nLWZvcm1hdCBicmVha3MNCml0LCBpbiBmYWN0IHdlIGFyZSBmb3JtYXR0aW5nIG9ubHkgLmMg
YW5kIC5oLCBidXQgc2luY2Ugd2UgaGF2ZSBzb21lIGhlYWRlcnMgd2l0aCBhc3NlbWJseSBtYWNy
b3MsIEnigJl2ZSBzZWVuIHNvbWUgaXNzdWVzDQp0aGF0IHJhbmdlcyBmcm9tIHJlYWxseSB1Z2x5
IGZvcm1hdHRpbmcgdG8gYnVpbGQgYnJlYWsuDQoNCk9uZSB0aGluZyB3ZSBjb3VsZCBkbywgaXMg
dG8gZXhwb3J0IHRoZSBoZWFkZXJzIHRoYXQgY29udGFpbiBvbmx5IGFzc2VtYmx5IHN0dWZmcyBp
biBkZWRpY2F0ZSBoZWFkZXJzICg8aGVhZGVyPl9hc20uaCA/KQ0Kc28gdGhhdCB3ZSBjb3VsZCBl
YXNpbHkgdXNlIGEgbmFtZSByZWdleCB0byBleGNsdWRlICIqX2FzbS5o4oCdIGZyb20gY2xhbmct
Zm9ybWF0PyBBbmQgYWxzbyB0aGVzZSBoZWFkZXJzIGNvdWxkICNlcnJvciBpZg0KaW5jbHVkZWQg
d2hlbiBfX0FTU0VNQkxZX18gaXMgbm90IGRlZmluZWQ/DQoNCkJ1dCB0aGlzIHJlcXVpcmVzIHNv
bWUgYWdyZWVtZW50IG9uIHdoYXQgaXMgdGhlIGJlc3Qgd2F5IEkgZ3Vlc3MsIHlvdSBjYW4ga25v
dyBiZXR0ZXIgaWYgaXTigJlzIGZlYXNpYmxlIG9yIG5vdC4NCg0KPj4gDQo+PiArICAgICAgICB7
DQo+PiArICAgICAgICAgICAgInJlbF9wYXRoIjogImluY2x1ZGUvcHVibGljLyoqLyoqLyouaCIs
DQo+PiArICAgICAgICAgICAgImNvbW1lbnQiOiAiUHVibGljIGhlYWRlcnMgYXJlIHF1aXRlIHNl
bnNpdGl2ZSB0byBmb3JtYXQgdG9vbHMiDQo+PiArICAgICAgICB9LA0KPj4gKyAgICAgICAgew0K
Pj4gKyAgICAgICAgICAgICJyZWxfcGF0aCI6ICJpbmNsdWRlL3B1YmxpYy8qKi8qLmgiLA0KPj4g
KyAgICAgICAgICAgICJjb21tZW50IjogIlB1YmxpYyBoZWFkZXJzIGFyZSBxdWl0ZSBzZW5zaXRp
dmUgdG8gZm9ybWF0IHRvb2xzIg0KPj4gKyAgICAgICAgfSwNCj4gDQo+IFRoZSBjb21tb24gbWVh
bmluZyBvZiAqKiB0aGF0IEkga25vdyBpcyAiYW55IGxldmVsIGRpcmVjdG9yaWVzIiwgYnV0DQo+
IHNpbmNlIHlvdSB1c2UgKiovKiovIGFib3ZlIHRoYXQgY2FuJ3QgYmUgaXQgaGVyZS4gQ291bGQg
eW91IGNsYXJpZnkNCj4gd2hhdCB0aGUgZGlmZmVyZW5jZSBvZiAqLyBhbmQgKiovIGlzIGhlcmUg
KG9yIG1heWJlIGluIEpTT04gaW4gZ2VuZXJhbCk/DQoNClllcyBJ4oCZdmUgZm91bmQgdGhhdCBw
eXRob24gZ2xvYiwgdGhhdCB3ZSB1c2UgdG8gc29sdmUgdGhlIHdpbGRjYXJkLCBzb2x2ZXMgdGhl
ICoqIG9ubHkgZm9yIG9uZSBsZXZlbCwNCm1heWJlIHdlIGNvdWxkIGRvIHNvbWV0aGluZyBiZXR0
ZXIgdG8gc29sdmUgdGhhdCwgYnV0IGZvciBub3cgSSBsZWZ0IGl0IGFzIGl0IGlzIHRvIGZvY3Vz
IG9uIHRoZQ0KY2xhbmctZm9ybWF0IGNvbmZpZ3VyYXRpb24gc2lkZS4NCg0KQ2hlZXJzLA0KTHVj
YQ0KDQo+IA0KPiBKYW4NCg0K

