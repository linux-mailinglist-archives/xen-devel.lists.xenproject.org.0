Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4936F8726
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530540.826232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puykT-00054t-QU; Fri, 05 May 2023 16:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530540.826232; Fri, 05 May 2023 16:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puykT-00052g-Ni; Fri, 05 May 2023 16:57:37 +0000
Received: by outflank-mailman (input) for mailman id 530540;
 Fri, 05 May 2023 16:57:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5z1=A2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1puykS-00052a-FB
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:57:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eed0fb2b-eb65-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 18:57:35 +0200 (CEST)
Received: from ZR2P278CA0020.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:46::6) by
 GV1PR08MB9913.eurprd08.prod.outlook.com (2603:10a6:150:86::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27; Fri, 5 May 2023 16:57:04 +0000
Received: from VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:46:cafe::1c) by ZR2P278CA0020.outlook.office365.com
 (2603:10a6:910:46::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Fri, 5 May 2023 16:57:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT060.mail.protection.outlook.com (100.127.144.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.12 via Frontend Transport; Fri, 5 May 2023 16:57:02 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 05 May 2023 16:57:02 +0000
Received: from 87bf513720db.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F94D8FE1-D7DD-4F4F-9C8B-2C238BECE399.1; 
 Fri, 05 May 2023 16:56:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 87bf513720db.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 May 2023 16:56:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB10029.eurprd08.prod.outlook.com (2603:10a6:800:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 16:56:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be%6]) with mapi id 15.20.6363.021; Fri, 5 May 2023
 16:56:46 +0000
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
X-Inumbo-ID: eed0fb2b-eb65-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB/0Hk7/nAxsOggP+UuejWY5jFRViXw4KZif78sQ5yI=;
 b=NAmXMzoMzeI9AwWThvqN9C9R8yktIETQ4RQnrNxhh5zEHKhup/B+cKY4sVir+dSfuR/NEwbqyE689br406ZJgNl6iGPn6+//Q5Wm/XkMpdSLrD3q+fM6ZTkogdBuyYMj3b9/gHA0DkG+M17Zzki0SD/i0LMXAXdzgIo+4WiwOtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd9d954d9f968ac8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8p38Tk3nM7Zplfgsp92r0saq6ivKtnz29cXENpOslN41qnvomKrHNwK8rLJyuBAHS5gft8hkui8r06UaqlaGQsTov7s+dpCVu3KS4gEgbibvXNOsHYQfasTdva3cVTKWM43LY591sj1/lSBTLkWIAFZcaWZqdJt8v5IXAUJOR7HLtLBZjEzcPuMEbXBDIZpfR57elfXO0gQcVrDBW904H7N+89YYZAhXLggGK7r9+bAQSd3dkxbGXYN8dOvdvQnjyjTo2N88+1VRYlHbOgnyh9GzIUnfZlLrMvP6T0OazLJmjtQBSkTBIsHpToOXEWMXApORZIwhxu7/YpIcl5FJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jB/0Hk7/nAxsOggP+UuejWY5jFRViXw4KZif78sQ5yI=;
 b=kUsV96PDFHVrz33ERXm5sfeKVfQlq7hFumGUPO+toN7rW37gil8xkBbgm5NdGTZu6HERCyJGD9VnFN7vnzCPiZXwAnehJS285Ni4rhShPj81ObCX0ey71s5dauR4fxabwfPp9gs8YZD+RoWAKd322PQWKWUC7+GYG+QzxdWmJhG2usE6TJbmRtLhh/ULD89uWkJLXJlqpQ7ko+r5nLbmrix8G2iH4yoWSdobW0/cRAn6to9qn5qz4yfH4byutXurJNcemrqD3FKzGJFqF8+INpsi+ICGAj+NjT8H/0yuUpJJZRGiJYqIf3fQkZ9DzEkeEE8ASpi2xDUvpaTXs6izzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB/0Hk7/nAxsOggP+UuejWY5jFRViXw4KZif78sQ5yI=;
 b=NAmXMzoMzeI9AwWThvqN9C9R8yktIETQ4RQnrNxhh5zEHKhup/B+cKY4sVir+dSfuR/NEwbqyE689br406ZJgNl6iGPn6+//Q5Wm/XkMpdSLrD3q+fM6ZTkogdBuyYMj3b9/gHA0DkG+M17Zzki0SD/i0LMXAXdzgIo+4WiwOtc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Christian Lindig
	<christian.lindig@cloud.com>
Subject: Re: [PATCH v6 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v6 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZdnKCeDO91wnv7UqBsQsgLvHj6a9HNTmAgAEfoACAA6ADgIAAA1aA
Date: Fri, 5 May 2023 16:56:44 +0000
Message-ID: <C87FA3E3-007B-423B-A1B9-2B68C12AFA67@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-10-luca.fancellu@arm.com>
 <4e6758c0-dd81-4963-8989-d941eba2b257@perard>
 <34A79CE8-FEE8-426B-810C-1E928E207724@arm.com>
 <9a0398b9-5b59-47aa-af34-a41133dc9e70@perard>
In-Reply-To: <9a0398b9-5b59-47aa-af34-a41133dc9e70@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB10029:EE_|VI1EUR03FT060:EE_|GV1PR08MB9913:EE_
X-MS-Office365-Filtering-Correlation-Id: e8551b1c-db14-43e1-e020-08db4d89c005
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EEeTPM0c3nGwDIQBNpHDDfsG+cGwk3IFvg5f6PDV6+oJbK0Oo2jC3srU3AQzyZdEiZUMI70kXRJlWUJ/ONWBtQhQU7Xjd+X+hnQmI3PUMFyQ5dXho2xOCY1WAuQPhZfwFV19bBO9fB4Ulco9+knfo1/axLrJjTwz6huNjR4ICsxZfxwhL7kKcjiLVvTiea+ij49wwLON6IxqLrZi8yF1iXDEVYBDbIdvXiTtKPhFMR2TlNzGr6pQVir6Ei/uUSOSsgKBTgAbvT+TUbxVbAwpRUEfNVFMaTZViOXowytOnUQ2dTrwY1ku8CL85VLSH3WvhIl6pFGyFb842GL1uiH4i7O4huiGlAYk+BBGkIySgg4hStSHZdbzwbku7gZdzCp2HlX4jbkAjq+sBWzvvnYj/adQweLtnrUBe105YyIrjr3bzM+pxTQmOfP6F2ErE0Tq0Ia2KkaS9bbsXUpL/l06KEW/TKdtnUbxIiol47+3J+0hYc3KqUyE9hAbkNpwkgdT3HxXtgYRE0wzI1uIabvEfKOwYqK24j/OawqW1KGIMmC+b5CUIFIac+O0kCGth3HQs8wo/9NA/W8ZjAZU0fNKjLPzJDJeHUU4BoDAOczGM9LPG9kzgHSdJZXtO7ME9L1S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(451199021)(33656002)(6512007)(53546011)(6506007)(26005)(38070700005)(86362001)(4326008)(6916009)(76116006)(66946007)(66556008)(66476007)(41300700001)(64756008)(66446008)(91956017)(6486002)(36756003)(478600001)(2616005)(71200400001)(5660300002)(7416002)(54906003)(122000001)(38100700002)(2906002)(186003)(316002)(8936002)(966005)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AC788189CF5354B8C5F37045CC57B67@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c38bae8a-dd42-4703-a975-08db4d89b4f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RLWMURlZ4Ffv6Vgq6GKgk4+Gj3UUOd+b/H/sRVeegDUxTCH7WkL8Ta2bpGg3GCStpMLl5+aMoe2Db+mAo7TJgm8Oh4Y3p0/GZT414d0UEL8Ep6z59uYOn3+G7+x2tj69f2uehM8/nF8nJNrbubS1/JYT1wD5hSm7SYB2C+d6iry3q7GSI+EU9MgXhaXgv5y2r1h/FqRMIlEQgR1/l9TK868kl4Aj1IRYjXwZyW3J/SPka23/Q+ubJFD2Prg0EAeh2WURWmYVMRQKsUirpfDOAq3A1OcDghpNTMvfpKsYLShZHfroAYzogoKhMibSVCD7OUOHxHO6w2NRIVZpNoh8CdvIX8gz4Y4qd9T+RFC6JG7ttjKOCjtSJGdwUILSh+cCvs/lJda7J2DbciDndyeWJjRhSq77L7i3L3hJR8xoqhDfbHp9jEmqnkkqGtxWYSpkleHsOnk40fcpUVK3EZySz7YAw3X7jqpX6HzMhtT58ffBe5yi1z9r5/l8a2Hw1CKZju91gu6NIv3YKfYerlS9UAGQpnjZgFGEuupqIfKmv9j3N9Lr7JVnDTuNzwNmpAia5XkwM2DbuE+yXxnMjgaqnfckrXssxKQq8Dqn2bDg+XZvV3aj4FwHbEiBUCRCve8Wywjv2aDy7Th2IHuMDEka7poh6ps71GGKzzobGxYcOIzH+RlIVPEvEDElC9DFaUad
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(2616005)(186003)(336012)(40460700003)(2906002)(40480700001)(36756003)(86362001)(33656002)(82310400005)(82740400003)(356005)(81166007)(36860700001)(5660300002)(41300700001)(8936002)(6862004)(8676002)(966005)(4326008)(70586007)(70206006)(6486002)(316002)(478600001)(54906003)(107886003)(6506007)(6512007)(26005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 16:57:02.9432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8551b1c-db14-43e1-e020-08db4d89c005
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9913

DQoNCj4gT24gNSBNYXkgMjAyMywgYXQgMTc6NDQsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTWF5IDAzLCAyMDIzIGF0IDA5
OjIzOjE5QU0gKzAwMDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIDIg
TWF5IDIwMjMsIGF0IDE3OjEzLCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgMDc6MDI6NDVB
TSArMDEwMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2lu
Y2x1ZGUveGVuLXRvb2xzL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oIGIvdG9vbHMvaW5jbHVkZS94
ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmgNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hYzQ0YzhiMTQzNDQNCj4+Pj4gLS0tIC9kZXYv
bnVsbA0KPj4+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi10b29scy9hcm0tYXJjaC1jYXBhYmls
aXRpZXMuaA0KPj4+PiBAQCAtMCwwICsxLDI4IEBADQo+Pj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCAqLw0KPj4+IA0KPj4+IERvIHlvdSBtZWFuIEdQTC0yLjAtb25seSA/
DQo+Pj4gDQo+Pj4gR1BMLTIuMCBpcyBkZXByZWNhdGVkIGJ5IHRoZSBTUERYIHByb2plY3QuDQo+
Pj4gDQo+Pj4gaHR0cHM6Ly9zcGR4Lm9yZy9saWNlbnNlcy9HUEwtMi4wLmh0bWwNCj4+PiANCj4+
PiANCj4+PiBCZXNpZGVzIHRoYXQsIHBhdGNoIGxvb2tzIGZpbmU6DQo+Pj4gUmV2aWV3ZWQtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4gDQo+PiBUaGFu
a3MsIEnigJlsbCBmaXggaW4gdGhlIG5leHQgcHVzaCBhbmQgSeKAmWxsIGFkZCB5b3VyIFItYnkN
Cj4gDQo+IEFjdHVhbGx5LCBjb3VsZCB5b3UgdXNlIExHUEwtMi4xLW9ubHkgaW5zdGVhZC4gQXMg
dGhpcyBjb2RlIGlzIHRvIGJlDQo+IGluY2x1ZGVkIGluIGxpYnhsLCBhbmQgbGlieGwgaXMgc3Vw
cG9zZWQgdG8gYmUgTEdQTC0yLjEtb25seSwgaXQgbWlnaHQNCj4gYmUgYmV0dGVyIHRvIGJlIG9u
IHRoZSBzYWZlIHNpZGUgYW5kIHVzZSBMR1BMIGZvciB0aGlzIG5ldyBmaWxlLg0KPiANCj4gQXMg
SSB1bmRlcnN0YW5kIChmcm9tIHJlY2VudCBkaXNjdXNzaW9uIGFib3V0IGxpYmFjcGksIGFuZCBh
IHF1aWNrIHNlYXJjaA0KPiBvbmx5KSwgbWl4aW5nIEdQTCBhbmQgTEdQTCBjb2RlIG1pZ2h0IG1l
YW4gdGhlIHJlc3VsdCBpcyBHUEwuIFNvIGp1c3QgdG8NCj4gYmUgb24gdGhlIHNhZmUgc2lkZSwg
aGF2ZSB0aGlzIGZpbGUgYmVlbiBMR1BMIG1pZ2h0IGJlIGJldHRlci4gQW5kIGl0DQo+IHNlZW1z
IHRoYXQgaXQgd291bGQgc3RpbGwgYmUgZmluZSB0byBpbmNsdWRlIHRoYXQgZmlsZSBpbiBHUEwg
cHJvamVjdHMuDQo+IA0KPiBXb3VsZCB0aGF0IGJlIG9rIHdpdGggeW91Pw0KDQpZZXMgc3VyZSwg
SSB3aWxsIHVzZSBMR1BMLTIuMS1vbmx5IGluc3RlYWQsIG5vIHByb2JsZW1zDQoNCj4gDQo+IENo
ZWVycywNCj4gDQo+IC0tIA0KPiBBbnRob255IFBFUkFSRA0KDQoNCg==

