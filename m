Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746274FB139
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 03:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302607.516276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndiPV-000639-JB; Mon, 11 Apr 2022 01:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302607.516276; Mon, 11 Apr 2022 01:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndiPV-0005za-Fb; Mon, 11 Apr 2022 01:00:05 +0000
Received: by outflank-mailman (input) for mailman id 302607;
 Mon, 11 Apr 2022 01:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/O6=UV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ndiPT-0004Y3-V3
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 01:00:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b64f893a-b932-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 03:00:00 +0200 (CEST)
Received: from AS8PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:20b:311::16)
 by DB9PR08MB6618.eurprd08.prod.outlook.com (2603:10a6:10:263::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 00:59:53 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::4f) by AS8PR05CA0011.outlook.office365.com
 (2603:10a6:20b:311::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 00:59:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 00:59:52 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Mon, 11 Apr 2022 00:59:52 +0000
Received: from 62d5414d6b6d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 522EF18C-8B96-40A9-B15E-09D26E4A4C3E.1; 
 Mon, 11 Apr 2022 00:59:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62d5414d6b6d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 00:59:45 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by DB8PR08MB4026.eurprd08.prod.outlook.com (2603:10a6:10:aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 00:59:43 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 00:59:43 +0000
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
X-Inumbo-ID: b64f893a-b932-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8kfpq6onMB9lqcbPBsinR+/NfAdKMM2NGVnDoowT5I=;
 b=w6cuHV53I22qva6wQuVmogMXL5l2Xcwe9fpUEWOLcqIJXQ6BpZFkToqW3WpLgYN6pgfY2Ai/ooIfJUjfzQn6uP8gNacndEh8RNnCT8Gys0b+EMyDI0Z/DSPsV8bXDW8G52pEwLZm7ORv413+mwAJrTgwImZdpj+vpK9Z6+2nJgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4gzpbYdFoVMMPdKdffXjslb+mOswSX7YAEuN+wVUSsGrBWN1bft/igMzaCVJjM9hOckahKK89emshj1xlZ46SeBBpxXVveP2mA5cMmXcjIFQ6cD6pf/cDn3kZwZ1EQwup0QVIIdul+INX1cAIsZSvzgn4UI1Te1wpMvGP3iHED2Pw26nwtMLzUso+BrZ28XdHbW4YMFZuoFqy7Gy25j/2CLbMqxjRxZU5b4uN46P/Ui63jLQP1gzfx3hu2K3RMRe/CrvMxiZ1MCzudStPt0bzM+Fq2EtcLqfXnAaozUWXY3x2qSREh5IbVJ82+wmDnjpZN6xSDyb08N3kP7ZV2mIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8kfpq6onMB9lqcbPBsinR+/NfAdKMM2NGVnDoowT5I=;
 b=QfK/7j0tVM9Xo7HhH/q/Wo072kNGO8b2xiaAvhovSDokttjdSy71Tix0se3TELT1sWrxGXDkCK3juFI5Toy/yhSGZl7iwDvRhdt8P81Pki8LKCzV36ysQAc9ye1qv1nSDYPXRTv5i5t3E39ScreKcEp9WGOcHPW8A+l7b1KRLOAw/7H6qeqWMwP9tjHBd+/yF17FmCPxEN2mhrNhgedmOQDY7gBBKnQSkqFGHj0dP4BtsEuqvQeACSdukYhtYNwuf/mnyfMrwe2avEJFDOr+2Gv1gsuhoR6alrZoZfb5FCU4/lsJ0Li2S3Y9c9ZFBdDj2qjsFqh8F72HRlG6s67lRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8kfpq6onMB9lqcbPBsinR+/NfAdKMM2NGVnDoowT5I=;
 b=w6cuHV53I22qva6wQuVmogMXL5l2Xcwe9fpUEWOLcqIJXQ6BpZFkToqW3WpLgYN6pgfY2Ai/ooIfJUjfzQn6uP8gNacndEh8RNnCT8Gys0b+EMyDI0Z/DSPsV8bXDW8G52pEwLZm7ORv413+mwAJrTgwImZdpj+vpK9Z6+2nJgg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH v3] SUPPORT.md: add Dom0less as Supported
Thread-Topic: [PATCH v3] SUPPORT.md: add Dom0less as Supported
Thread-Index: AQHYSt1CmA0pSQ994kax2RW1hM7xyKzlLkpggAEVkwCAA6T7IA==
Date: Mon, 11 Apr 2022 00:59:43 +0000
Message-ID:
 <PA4PR08MB62537A47CA97F799DD8D1E0492EA9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
 <PA4PR08MB6253660FF724000CFCD7A8C192E99@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <b8b62b5f-a643-2624-fa57-ad42d315b39e@xen.org>
In-Reply-To: <b8b62b5f-a643-2624-fa57-ad42d315b39e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3357F2201DCD424795B859B0716F8CF2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7b2348bc-68e5-435d-2299-08da1b569614
x-ms-traffictypediagnostic:
	DB8PR08MB4026:EE_|VE1EUR03FT004:EE_|DB9PR08MB6618:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB661851FCC7095E978E9A8ADC92EA9@DB9PR08MB6618.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CwfE5ajXBkn8xuxCgTamgYYtjQuBaMa2twBzN8Z5wL9TUfmBjDLwSmMAvbpZwL5YNE2HauMC0gRmVf4PSkoXilE/TIJO62+o4a/zYXFSzq4Do3ltPC7Aqb8liFdRZ6Yzb3zjTHuw62dUTyR7cBJs/M1m+Kf/C3qnvC29AGbxWgV6ok5OwRtEVoYHY/jrXtQ648ScGWTTKLw8tFHXOIABpwEODWGpOjo+zXl6jQ6GM1Zqrc4e5HpuKWiB1Q+3f+IQpsVFG3fG5MIhqDS/Z+SB1YpUd8mWF8Cn2RCPQxN6+qnV41uRmZRq56NpAWKSUvXsFkINq6+9KzVg8rZxfane5f3+gjgN6yN0jW5HcjzHhA0eIYd0Roj4++JIOj6+9wcYpw3+uzTz1oim6cyzF/jyU8jTY4Ql8ObweP50qQpcOVb+8fbbVS1XMbhMCAOLzTlHh/EcPU/YT7x46wvKOklwXXJ1jP6LT1V3Id1CofxKyiQ0t/Zym6PgYdQMaCFkV5yvjyqaB26vfWUqgWAYDYbs4HiJhmTFkoe8A73JK4xZ8Uoz4lIrUfUuSvYNDgzi7swe6gBEmgpyHo+IuMSC1y4CLkjFRGor7gaAyrq0BstcGDy8mvpK9vKyx4Nk3jc7vGG821WTQ76MUy8LkoJz/6BsWOyWTNbpvpGz4YOtk399lFOaLR+vSoym61z4Zl7IetaAApt6BPdI6g6+RXr1ChEmcPPE0LPZW4rQT1lxJPXLyOk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(5660300002)(8936002)(52536014)(508600001)(71200400001)(86362001)(55016003)(38070700005)(38100700002)(316002)(186003)(122000001)(110136005)(54906003)(26005)(9686003)(83380400001)(2906002)(4326008)(33656002)(66476007)(66446008)(8676002)(64756008)(66556008)(76116006)(66946007)(6506007)(7696005)(32563001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fdeb32cf-4eee-464f-b67b-08da1b569089
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YOq5NlRYahHfYGognQJXHOtM+W8CtkXx/GO6icXibalOv7vlmbKYCpxoJWuTxaeaL6e2j5Bip8pv7GS7VcF/c5JuCSwpsmrEv7vW3Kf4c3KEmPJ99OzKFfsf28/tGu1OSvIeGIl/TeFy9usLOViUNzBZs69tGNtcimCX+Ua+KZaFcIAdkB4B9sHCirtqVFTLemMYKXwTAsMQr8PSqv/QmfIH9YfBTDT2UePlj7/0rooSAL9DNxnmjoGqGMVZlgOo4NTgTXfrHgAoqxSPzp0vS1QVjiGRySmCg+mAkvoTsgFnDOJZWccGLUhNrozew2SW9BuTpJT/Q35t46DYUh2m3lBDK/+YbNxBsy5p7EFq3dEXzxkDdEqHZaM7zjPki5fJdtHyBT9Hhvt0IkWUAXGHXFaRNeB8VFlm+PvumSTg++8xP2FlgTJX7MsIlr+Q8VF8/LnFqEJlWwtTE3LaC1ZJNxWStMhTEhxvsJtH84HrvMjpUgj5MPD9KlKBmHWPnOKvsrgmMnUgMSHEmsKEXFbzYZ+MnmK7x1eqr6615/Nx/IdLJlHJRfLi6QpeHIAVYzGYpSjogZXreBadYJ16d6GKOy9q5IebY9LR5b5R+DnWKFDZNQ6jrrFqFSL17xNbvU3J/ynjiuM/j/bC/86erUvhDuEzRgoLzw4GqAlKJGLCZL4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(5660300002)(356005)(4744005)(110136005)(54906003)(2906002)(508600001)(9686003)(33656002)(316002)(6506007)(7696005)(26005)(186003)(82310400005)(336012)(70206006)(70586007)(47076005)(8676002)(4326008)(86362001)(8936002)(52536014)(81166007)(83380400001)(36860700001)(55016003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 00:59:52.4292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2348bc-68e5-435d-2299-08da1b569614
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6618

SGkgSnVsaWVuIGFuZCBTdGVmYW5vLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4NCj4gPiBGb3IgdGhlIHBh
dGNoIEkgZG9uJ3QgaGF2ZSBhbnkgY29tbWVudHMsIGJ1dCBJIHRoaW5rIGhlcmUgd2UndmUgZ290
DQo+ID4gYSB0eXBvOiBzL21lc3NhaGUvbWVzc2FnZS4gSSB0aGluayBpdCBpcyBvayB0byBmaXgg
d2hpbGUgY29tbWl0dGluZyB0aGlzDQo+ID4gcGF0Y2ggc28gdGhpcyBpcyBqdXN0IGEga2luZCBy
ZW1pbmRlciA6KSkNCj4gDQo+IEFueXRoaW5nIGFmdGVyIC0tLSB3aWxsIGJlIHN0cmlwcGVkIGJ5
IGdpdCBhbS4gU28gdGhlcmUgaXMgbm90aGluZyB0bw0KPiBmaXggaXQgb24gY29tbWl0Lg0KDQpB
Y2ssIHRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBTb3JyeSB0byBTdGVmYW5vLg0KDQpLaW5kIHJl
Z2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

