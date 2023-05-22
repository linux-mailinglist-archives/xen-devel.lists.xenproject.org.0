Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BD70BE9D
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537910.837545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14tY-0007PS-Pk; Mon, 22 May 2023 12:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537910.837545; Mon, 22 May 2023 12:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14tY-0007ME-MP; Mon, 22 May 2023 12:44:12 +0000
Received: by outflank-mailman (input) for mailman id 537910;
 Mon, 22 May 2023 12:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvIk=BL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q14tW-0007Ls-P3
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:44:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5825364c-f89e-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 14:44:08 +0200 (CEST)
Received: from DUZPR01CA0347.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::20) by AS4PR08MB8023.eurprd08.prod.outlook.com
 (2603:10a6:20b:586::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:43:35 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::60) by DUZPR01CA0347.outlook.office365.com
 (2603:10a6:10:4b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 12:43:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.13 via Frontend Transport; Mon, 22 May 2023 12:43:34 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Mon, 22 May 2023 12:43:34 +0000
Received: from d3257aa310d4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89DC387D-2243-4147-A16E-158F1FA094E0.1; 
 Mon, 22 May 2023 12:43:23 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3257aa310d4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 May 2023 12:43:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9520.eurprd08.prod.outlook.com (2603:10a6:102:2f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:43:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 12:43:21 +0000
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
X-Inumbo-ID: 5825364c-f89e-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pppqCx3b5ghZhsVDbkSYebN87OX1KJ+kKUlMjO1a4xc=;
 b=1vvOTMKUUOC9ch0QEEyX0J7w5e2h87vX++tXzKJz0Zf8KXLC85BnlWynjjN8yU1BPBeXSnVcfD+OYnjwkK8A262x8xCuNqDNreQrcQJlpkXjxvP2Q6u75f/Z3gt/yucw2c05Yrm8EGaADurP9KJztcNfv2cigZpLcN6PRmzumN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd15c8988769b56f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHcf/q5mm/Z5QyIyiHD4FxoZFa/QKT3v+xPt8fHhezc9P+F64EeGrhvRmbtw+4Uu/svqT4UJOW7oxUYdoOpWUGCNNXmWXtyX7P7TBI3ykRPeEZHrsZs4c4TUvO/yTAPl2SYv/GeD7S8ScYRPHcRsSR1sE5QacxqXh9/lIzlu69e1P6PWOQExz3Kz9o7tYo4EaJmfawBNamNymKW4bGYjgegX4tjT+s3S4GZdCKRi2MGmug/PVvBc/zRWo1i6Y5OGAS6Ba6HPDbxs7e55Eap9iU++EOWkY5sJ0EArMQDFEDbNzZceoG5PazFVFEEdnkh0nugEnGW5nTGQBq//dVqPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pppqCx3b5ghZhsVDbkSYebN87OX1KJ+kKUlMjO1a4xc=;
 b=czZBtvZM5Id6a+uuXtYbKO+0YgWYqZtbecJwwqIxpPAzyZF7J1oEGWgF4fw8HxRhuIexanTIDO7V7wOrvxpnc6YjaTvmIltjkxAoZRBGRDV8jlhY1N2IUftYOY02dcjRVCV2Inlk0HjTWzWFzqz00QWvViQ2yLe+0u6uKNyPRZTj5EAaMRow6I+6THLQFZ5b86luK9UPrAfkNyqkpu9w0Ll8Tu4uqpEjEnm3YeN+GSPHbmoTdXaPCXMMf3gBiD3mgeMYnqtuKlNNfu4wqxgIaZzDv7yBOqtdVvurWf7MVSoz5ZCAWN+1EepNdeo3lrt0JqR5NY3hofKHdh6MUB59Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pppqCx3b5ghZhsVDbkSYebN87OX1KJ+kKUlMjO1a4xc=;
 b=1vvOTMKUUOC9ch0QEEyX0J7w5e2h87vX++tXzKJz0Zf8KXLC85BnlWynjjN8yU1BPBeXSnVcfD+OYnjwkK8A262x8xCuNqDNreQrcQJlpkXjxvP2Q6u75f/Z3gt/yucw2c05Yrm8EGaADurP9KJztcNfv2cigZpLcN6PRmzumN0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZdnJ92qfFeC693kK/O74mILlnGa9ggLQAgAXAhACAACdzAIAAAF0A
Date: Mon, 22 May 2023 12:43:21 +0000
Message-ID: <F88CF36C-0A10-41E3-8273-8ACCCC1836BD@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
 <779e46a5-a3d0-187a-6d15-e1a12f71278f@xen.org>
 <288F275C-D76F-4E89-B8C6-C8D9AD54D1D9@arm.com>
 <a2e282a6-8443-2650-dc63-e64b5fb72266@suse.com>
In-Reply-To: <a2e282a6-8443-2650-dc63-e64b5fb72266@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9520:EE_|DBAEUR03FT028:EE_|AS4PR08MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9f9014-6aeb-4baf-fce0-08db5ac22846
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3KIFAiPzY2CuSlLTi9wKRO0G5p29Q8lqC9CtJHdrAni/aeMb0m0V5FuKyS7xH+JmfB/G780VCAo/gBzw1UZcZXIYY3TjeGCBW+Qe6/YiBNdWY7gy2CMr+IvvXlHkmY1toqhOh+BdV7BrOdXiejX255uY6mmLwvL5J+qWuNQ11xTwdlzPBYwSACCdNBH+aGpH17gBu0FFDyzF6v60q/5s7x/gGYN5ak584+5k67tYQjQvFZ3cXS4P58wemlgxARHt0x+9dan3HtNNnEJ1wG5BMqxjgPU8IKvH2I6pfPstUCfrhDg4K2LO4vaxoKoif6wi4bSGidRDe0KJVtggaSHLelqs1ORjgEB6NXWUnyP7SIQb2IPkwFpb8pWblL5KhjsqX1NzdljJt8cWLZZMGq9SSRtW1pastLeSFkc8af2Qp6mJTw9NZeiT61a7wSe0FcXwRnjvP0kf7jxQZC01C56TWcWSHsd6U7C2rIi3f/qQXEZjftCvOMauoqoS4SyqkpX01nVX5MCRTwbwV4EWYmaJr+QJRexytIghXryLohSUPa6VJCw/CI6oHxDuM0q7qfciGKfYOuqtapizclD5qw9L5bWXy1j9O/5QNcP3ai5LA/i0T4vXfx1RdUsB6KentXL+4CSpY723DzslSBES0FDN9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(2906002)(5660300002)(8676002)(8936002)(41300700001)(66946007)(76116006)(66476007)(4326008)(91956017)(66556008)(6916009)(64756008)(66446008)(54906003)(316002)(36756003)(33656002)(71200400001)(6486002)(478600001)(2616005)(6512007)(6506007)(26005)(122000001)(86362001)(186003)(53546011)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E85DE17FD3F7A747B2391C3736780A0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3edf340-cb76-4e95-5570-08db5ac2200a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6DqRvRmzk7KEr3EX7hKYNbR/0e+urhYvIwzwj+SHspUv4EqARKoinYF371ot8DFvG+TWBldORLS26BxehKqGp5Gkpg2y/V7F3d6+QP4S3WyRNq4cTjUDWHirHYAilCmiLd5etnfdnH6mJoq4bg3LxsqAh9EkGUxeHSV+XcPN0EcrZkreeNsvrslxKCCi2sMvgeJBGvmHv4adchm5omwxsNflTwPovROCmIdl2kCQDkufb96DXbB9sEX1GK/ZT01suk7Kh42ptWMmFi6Flc1+v5qAUXYR2McD9zcz7FPTGJhskaX4i1A4FQHfalzUgtTrExotCHQRw7FgjMjIVDj/B5zaByZQB9sOUt1J6VjamAqeUOkBDNDW8dfshmNThkdJWhhzXt2qY1EWfWeIpQT3DziOlJeAlz/kVTa8aAZ6g0DhqDXKjEd07ZLxIcA8Zp6c5orFEBtQrw1XCf7Lrg3CzcDNZxGrHFOCWWJmXt5EVHd06S/9YcFJd3fHD+zA7KEdLRuQdVsP/92KC+uQ2ihqscoYwcwTVZZzIVvpIZJwncxCVeMrzYjT2LatK0lN5V5UQ/0b7baoFMrHjkjgRdZOEhQ7uNwDSXoFw9iRfNwLeEcGWybTwCTvcw6JMEriDwp4yiCVnhe1lqA3WnaasOmG/wTI0V9MQEan6e/sjaoMHi33S+D5BYHLHAZqI/0SmBEVkYR/MMovLjpvN//nlFQa9BXjdaysNZ1dVv+SJyuEVqbpLOdFbkMvAXzKo3y0C2Y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(36860700001)(33656002)(316002)(54906003)(478600001)(41300700001)(6486002)(70206006)(4326008)(70586007)(8676002)(8936002)(6862004)(81166007)(356005)(5660300002)(82740400003)(40460700003)(336012)(2616005)(36756003)(82310400005)(53546011)(47076005)(26005)(2906002)(186003)(40480700001)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:43:34.8953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9f9014-6aeb-4baf-fce0-08db5ac22846
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8023

DQoNCj4gT24gMjIgTWF5IDIwMjMsIGF0IDEzOjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjIuMDUuMjAyMyAxMjoyMCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMTggTWF5IDIwMjMsIGF0IDE5OjMwLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBMdWNhLA0KPj4+IA0KPj4+
IE9uZSBtb3JlIHJlbWFyay4NCj4+PiANCj4+PiBPbiAyNC8wNC8yMDIzIDA3OjAyLCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4+PiAjZWxzZSAvKiAhQ09ORklHX0FSTTY0X1NWRSAqLw0KPj4+PiBA
QCAtNDYsNiArNTAsMTUgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZ2V0X3N5c192bF9s
ZW4odm9pZCkNCj4+Pj4gICAgIHJldHVybiAwOw0KPj4+PiB9DQo+Pj4+ICtzdGF0aWMgaW5saW5l
IGludCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2Y3B1ICp2KQ0KPj4+PiArew0KPj4+PiArICAg
IHJldHVybiAwOw0KPj4+IA0KPj4+IFRoZSBjYWxsIGlzIHByb3RlY3RlZCBieSBpc19kb21haW5f
c3ZlKCkuIFNvIEkgdGhpbmsgd2Ugd2FudCB0byByZXR1cm4gYW4gZXJyb3IganVzdCBpbiBjYXNl
IHNvbWVvbmUgaXMgY2FsbGluZyBpdCBvdXRzaWRlIG9mIGl0cyBpbnRlbmRlZCB1c2UuDQo+PiAN
Cj4+IFJlZ2FyZGluZyB0aGlzIG9uZSwgc2luY2UgaXQgc2hvdWxkIG5vdCBiZSBjYWxsZWQgd2hl
biBTVkUgaXMgbm90IGVuYWJsZWQsIGFyZSB5b3Ugb2sgaWYgSeKAmWxsIGRvIHRoaXM6DQo+PiAN
Cj4+IHN0YXRpYyBpbmxpbmUgaW50IHN2ZV9jb250ZXh0X2luaXQoc3RydWN0IHZjcHUgKnYpDQo+
PiB7DQo+PiBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4+IHJldHVybiAwOw0KPj4gfQ0KPiANCj4g
RG8geW91IG5lZWQgc3VjaCBhIHN0dWIgaW4gdGhlIGZpcnN0IHBsYWNlPyBJLmUuIGNhbid0IHlv
dSBhcnJhbmdlIGZvcg0KPiBEQ0UgdG8gdGFrZSBjYXJlIG9mIHVucmVhY2hhYmxlIGZ1bmN0aW9u
IGNhbGxzLCB0aHVzIGxldHRpbmcgeW91IGdldA0KPiBhd2F5IHdpdGgganVzdCBhbiBhbHdheXMt
dmlzaWJsZSBkZWNsYXJhdGlvbiAoYW5kIG5vIGRlZmluaXRpb24gd2hlbg0KPiAhQVJNNjRfU1ZF
KT8NCj4gDQoNClJpZ2h0LCBJIGFsd2F5cyBmb3Jnb3QgYWJvdXQgdGhpcyBhcHByb2FjaCwgSeKA
mWxsIHRyeSB0aGF0DQoNCj4gSmFuDQoNCg0K

