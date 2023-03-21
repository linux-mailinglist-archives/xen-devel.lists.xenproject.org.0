Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4376D6C28EF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 04:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512182.791953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peT8T-0005Vz-VO; Tue, 21 Mar 2023 03:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512182.791953; Tue, 21 Mar 2023 03:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peT8T-0005TI-RG; Tue, 21 Mar 2023 03:58:09 +0000
Received: by outflank-mailman (input) for mailman id 512182;
 Tue, 21 Mar 2023 03:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8nM=7N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1peT8S-0005Sp-86
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 03:58:08 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d8dbf7-c79c-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 04:58:04 +0100 (CET)
Received: from AM6P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::33)
 by DB3PR08MB9036.eurprd08.prod.outlook.com (2603:10a6:10:430::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 03:58:02 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::27) by AM6P192CA0020.outlook.office365.com
 (2603:10a6:209:83::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 21 Mar 2023 03:58:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 03:58:01 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Tue, 21 Mar 2023 03:58:01 +0000
Received: from 4ad288051037.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90D56DBD-1904-4DCC-B713-C303927511FB.1; 
 Tue, 21 Mar 2023 03:57:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ad288051037.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Mar 2023 03:57:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8682.eurprd08.prod.outlook.com (2603:10a6:20b:564::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 03:57:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 03:57:48 +0000
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
X-Inumbo-ID: 94d8dbf7-c79c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb3UNfuZqvbXOKhi0QGLZ8JbSSwquB9K/9g1hl4rZDw=;
 b=hP41igmrkQplxdBeHMTqjnmOnR+ur7rw1YsxS/iabT8c7/ZEQdIXm7fH2/C6dU+XYO6R0yXGNBG1u7Lw5g9DBEjmuSKHLdti1FMPWS677tE2EZjtO3x+zuolhFcPZjsuobPyWrDiAo4kcPYTpNCY+Vqy5mXNL3Ey2lTyemzn6HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt/7O6u//XEWBDnQWsQRJn5ewBRNHXCrKUQ3V+UHU1L2V2yM+0/yMH7cqqu5cMdWN6VKLafFXVO6Lka0hnV/PQZy/91TqARMS83C8NYyjiiftLQ7dFEgQaQFnBvwoVqYTeXmXGEIlCSUdXjN1DFI3b0dWbjLBjopNR5YgTWNPH7hwuky7Scmto9KbEmHUwRJU7o2NCA7JA8K/vW0KkcHLT8tuwz0JJxl3arGXYUERhHBFEA5Hl3sZNNUK15k1yorX98BJ60G3zcAE7xb4RK5HhC+VOjDv+x1BSOy7LsrG4SBifwBI3p4sSRLgLfxt+Q0fz4V2n/26pBlvD6UzHbkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xb3UNfuZqvbXOKhi0QGLZ8JbSSwquB9K/9g1hl4rZDw=;
 b=JbqBUE6TJVWC1DEliBsWrgJmyzpYCN9j0tWbwF16+eZggPpYcPzyJyvfrz+LL9u4oA2yrCTu2COGEgQ7IkgmKWYSxoRvkuwnRI/G5sLx3UFcuNHJZD7FfHsIfd+eMCTgff+3TYgMA8qJloGSNqaVpM1abiEjh+0xIs+EXMQM8X4Lw7oJshI6FrU0KpHLUzZ45YGJT5JTTUPTaV0F4kcxrB+eZ5j1oxeohTBpdKmfyzGQgVw4IygpZ9MUGHryI6CY0PBJbiRmkon1BNuNhAG0Vp8oeMIk7xtUy1QBLMsTqzxGtxGKlUzaF9LObRvlRo0XR/XIUnGQEE5TWXmytY07tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb3UNfuZqvbXOKhi0QGLZ8JbSSwquB9K/9g1hl4rZDw=;
 b=hP41igmrkQplxdBeHMTqjnmOnR+ur7rw1YsxS/iabT8c7/ZEQdIXm7fH2/C6dU+XYO6R0yXGNBG1u7Lw5g9DBEjmuSKHLdti1FMPWS677tE2EZjtO3x+zuolhFcPZjsuobPyWrDiAo4kcPYTpNCY+Vqy5mXNL3Ey2lTyemzn6HY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Thread-Topic: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Thread-Index: AQHZNGBES9GND13bPU+mzqer9SysH68EWvQAgACL1MA=
Date: Tue, 21 Mar 2023 03:57:47 +0000
Message-ID:
 <AS8PR08MB799142447DF4749065ABAF5992819@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-4-Henry.Wang@arm.com>
 <e2421c2d-6ae1-bf70-530d-0683d943f519@xen.org>
In-Reply-To: <e2421c2d-6ae1-bf70-530d-0683d943f519@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 91B2D2A6E269794BA938972B9CDB6295.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8682:EE_|AM7EUR03FT032:EE_|DB3PR08MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2279c0-480f-4b07-54c2-08db29c07778
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9/FcN4j3XWb5WXqAmXk4jaiSpdzsObtQCgrTS6dvlHs98MMyh46iPZvYBy3ugH7dA38nWU06QwSkjNHFgwDe0ss2FBMsPFOgKwsB9QXeVZHSqLQ2hHSZsSQnDuEWIMkUwVsoR5dKUQIpko1Cj1doW0MhN8gOrtj7Y31RxeHVZqA9gu88e7JFc/t6zb79dH73AJCeSVjVx+XkXwLfueV/YmoiDyUpeakPsAbacD8eg7KhyCWtQTJdfHbsWWIGPV4yNUCE6DTTx/oqEjC5nt4RgJ/h2nnfGPdyLXoohxWb1uRVzW6cmE3MEjQTQea6EfkYvjDfTeZbmkVEPRK4LGKNRE52rHTW3vlotKXZCLxSNWrGjI2J4woj2A/lOd5KAG+a27VC2AOx0UFIfAEQE5cr91itrahw+mDlGMyUugsImjIklpz+aDptKJ0lmO8ddHnlXwaM4ZO0Rq+iz/4Xl3Jr9cVnFFwRW7lkLhMrZkDIANncDg4mUd/9Kr5RQ2z/ufmEiJt7QPbZXxLzLrI11jodzQjqb6oo6uETY1wVXXCsyI0BXbp6qpm8BK6jWYS0eZ/Sa3wMcqncNSugAlKSk8UCdOl0jaZG2HeHtLGsQHGtgvTNu0I5VzQ5fc4nNRj1WeR0OoUwGKRs4HI40myu3ufEOHLHEwVby/02HyhTP3lj3dMrS9mCq7QScPdrWyp6kvcP1PYtwnXLq757XcVzgDqW4w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(8936002)(5660300002)(41300700001)(52536014)(55016003)(86362001)(38070700005)(33656002)(38100700002)(2906002)(122000001)(4326008)(478600001)(83380400001)(71200400001)(7696005)(186003)(53546011)(6506007)(26005)(9686003)(54906003)(110136005)(66476007)(316002)(8676002)(66556008)(66946007)(64756008)(76116006)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8682
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf73b8ee-f043-4b50-c621-08db29c06f15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Dj85RXBYgvCq/6nBzfBz8hG66hv/c98/a8x8AaG6SleJGq3t0S9yYvsyLhz3emH+7psOnOVE1/7Ypp1fDqyc7r8tRThm7ZNcXf9PZY+vKea1as/OihIh7SB2/gIX2TcMRkTpPdaawxXJwFuHAN6T9erShQQpvL25FOjjiOY3576hsHk9p6jY/3q3zBAjhZoDnzn5ocOChLhIceDoBggukMvqIRnXdQm0no2YksSMjV4EOWv0wy224tPNAWQ7l1Y+t08LiKW7l1JnXnrHScIlu6512WZ0tnbap/bu0E3j7eZG7B/4E7RUMLLjBWwt/2JjZwDQtza66S7icY0CutS7jSyzs4Kz3F/M5WqcwusS4R8nx2rSQBCQ+q3C6D+iqeUstF/Q3SIjDQnhxPsYqpdWptiYfeFsuNAp5QsAJtOK7zN0m/pXfcrmz4qStf5mM2XKGN5EV4jUtY/M7RXbzTZ9WXNRmaGvTOixcR2mQ4Deb8Pr5DEK8NzNTKXCHpNiRZs3EMpNOuK91Fscgk7RfWC57ehu1mttMtCZRUgKpGgwm5ur/VhgG5P8WC+/uJ0nse+LQk5+7BDmCmzf+nKYPmddjSb1jK3StZi2tpFWKI3t/es1fH4BreR9ii2Cr+9N3JTX6f4tH2cvj0MZndbkVA5D8c0S04ZrN5cHyqRPRHLe3ZjByhft3OI2Erv5xrkiHdNZDe18i3eqrGl0TanOYBmKg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(47076005)(86362001)(7696005)(83380400001)(33656002)(54906003)(110136005)(316002)(40480700001)(8936002)(55016003)(8676002)(5660300002)(70586007)(70206006)(4326008)(52536014)(41300700001)(36860700001)(478600001)(40460700003)(81166007)(2906002)(82310400005)(82740400003)(356005)(107886003)(336012)(186003)(53546011)(6506007)(26005)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 03:58:01.7266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2279c0-480f-4b07-54c2-08db29c07778
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9036

SGkgSnVsaWVuLA0KDQpUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIHRpbWUgYW5kIHJldmlldyA6
KQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy80XSB4ZW4vYXJtOiBE
ZWZlciBHSUN2MiBDUFUgaW50ZXJmYWNlIG1hcHBpbmcgdW50aWwNCj4gdGhlIGZpcnN0IGFjY2Vz
cw0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAzMC8wMS8yMDIzIDA0OjA2LCBIZW5yeSBXYW5n
IHdyb3RlOg0KPiA+IFNpbmNlIHRoZSBoYXJkd2FyZSBkb21haW4gKERvbTApIGhhcyBhbiB1bmxp
bWl0ZWQgc2l6ZSBQMk0gcG9vbCwgdGhlDQo+ID4gZ2ljdjJfbWFwX2h3ZG9tX2V4dHJhX21hcHBp
bmdzKCkgaXMgYWxzbyBub3QgdG91Y2hlZCBieSB0aGlzIHBhdGNoLg0KPiANCj4gSSBkaWRuJ3Qg
bm90aWNlIHRoaXMgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24uIFRoZSBmYWN0IHRoYXQgZG9tMCBo
YXMNCj4gdW5saW1pdGVkIHNpemUgUDJNIHBvb2wgZG9lc24ndCBtYXR0ZXIgaGVyZSAodGhpcyBj
b3VsZCBhbHNvIGNoYW5nZSBpbg0KPiB0aGUgZnV0dXJlKS4gRXZlbiBpZiB0aGUgUDJNIHBvb2wg
d2FzIGxpbWl0ZWQsIHRoZW4gaXQgd291bGQgYmUgZmluZQ0KPiBiZWNhdXNlIHRoZSBleHRyYSBt
YXBwaW5ncyBoYXBwZW4gYWZ0ZXIgZG9tYWluX2NyZWF0ZSgpLiBTbyB0aGVyZSBpcyBubw0KPiBu
ZWVkIHRvIG1hcCB0aGVtIG9uLWRlbWFuZCBhcyB0aGUgY29kZSBjb3VsZCBiZSBvcmRlciB0aGUg
d2F5IHdlIHdhbnQuDQo+IA0KPiBTbyB0aGlzIHBhcmFncmFwaCBuZWVkcyB0byBiZSByZXdvcmRl
ZC4NCg0KU3VyZSwgSSd2ZSByZXdvcmRlZCB0aGlzIHBhcmFncmFwaCB0byBiZWxvdzoNCiJTaW5j
ZSBnaWN2Ml9tYXBfaHdkb21fZXh0cmFfbWFwcGluZ3MoKSBoYXBwZW5zIGFmdGVyIGRvbWFpbl9j
cmVhdGUoKSwNCnNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gbWFwIHRoZSBleHRyYSBtYXBwaW5ncyBv
bi1kZW1hbmQsIGFuZCB0aGVyZWZvcmUNCmtlZXAgdGhlIGh3ZG9tIGV4dHJhIG1hcHBpbmdzIGFz
IHVudG91Y2hlZC4iDQoNCj4gDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogTWFwIHRoZSBHSUN2
MiB2aXJ0dWFsIENQVSBpbnRlcmZhY2UgaW4gdGhlIEdJQyBDUFUgaW50ZXJmYWNlDQo+ID4gKyAg
ICAgKiByZWdpb24gb2YgdGhlIGd1ZXN0IG9uIHRoZSBmaXJzdCBhY2Nlc3Mgb2YgdGhlIE1NSU8g
cmVnaW9uLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIGQtPmFyY2gudmdpYy52ZXJzaW9u
ID09IEdJQ19WMiAmJg0KPiA+ICsgICAgICAgICBnZm5fZXEoZ2ZuLCBnYWRkcl90b19nZm4oZC0+
YXJjaC52Z2ljLmNiYXNlKSkgKQ0KPiANCj4gVGhlIENQVSBpbnRlcmZhY2Ugc2l6ZSBpcyA4S0Ig
KGJpZ2dlciBpbiBzb21lIGNhc2VzKSBidXQgaGVyZSB5b3Ugb25seQ0KPiBjaGVjayBmb3IgdGhl
IGFjY2VzcyB0byBiZSBpbiB0aGUgZmlyc3QgNEtCLg0KDQpZZWFoIGluZGVlZCwgZ2ZuIG1pZ2h0
IGZhbGwgaW50byB0aGUgcmFuZ2UgYmV0d2VlbiA0S0IgYW5kIDhLQiwgc29ycnkNCmFib3V0IHRo
YXQuDQoNCkNvbnNpZGVyaW5nIHRoYXQgdGhlIENQVSBpbnRlcmZhY2UgaXMgY29udGludW91cyAo
SSBzdXBwb3NlKSwgSSBoYXZlIHR3bw0Kd2F5cyBvZiByZXdyaXRpbmcgdGhlIGdmbiBjaGVjaywg
d2UgY2FuIGRvIGVpdGhlcjoNCg0KZ2ZuX2VxKGdmbiwgZ2FkZHJfdG9fZ2ZuKGQtPmFyY2gudmdp
Yy5jYmFzZSkpIHx8DQpnZm5fZXEoZ2ZuLCBnZm5fYWRkKGdhZGRyX3RvX2dmbihkLT5hcmNoLnZn
aWMuY2Jhc2UpLCAxKSkNCg0Kb3INCg0KZ2ZuX3RvX2dhZGRyKGdmbikgPj0gZC0+YXJjaC52Z2lj
LmNiYXNlIHx8DQpnZm5fdG9fZ2FkZHIoZ2ZuKSA8IGQtPmFyY2gudmdpYy5jYmFzZSArIGQtPmFy
Y2gudmdpYy5jc2l6ZQ0KDQpNYXkgSSBhc2sgd2hpY2ggb25lIHdvdWxkIHlvdSB0aGluayBpcyBi
ZXR0ZXI/IFRoYW5rcyENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0K
PiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

