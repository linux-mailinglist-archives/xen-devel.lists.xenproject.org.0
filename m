Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0827753D1C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563665.881028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJeu-0004mc-IJ; Fri, 14 Jul 2023 14:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563665.881028; Fri, 14 Jul 2023 14:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJeu-0004jm-FK; Fri, 14 Jul 2023 14:20:36 +0000
Received: by outflank-mailman (input) for mailman id 563665;
 Fri, 14 Jul 2023 14:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3usO=DA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qKJes-0004jg-AH
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:20:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 978fffc6-2251-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:20:33 +0200 (CEST)
Received: from DU2PR04CA0325.eurprd04.prod.outlook.com (2603:10a6:10:2b5::30)
 by DB9PR08MB6572.eurprd08.prod.outlook.com (2603:10a6:10:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:20:27 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::23) by DU2PR04CA0325.outlook.office365.com
 (2603:10a6:10:2b5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Fri, 14 Jul 2023 14:20:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 14:20:27 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Fri, 14 Jul 2023 14:20:26 +0000
Received: from acde2031ac13.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C4A2378-AC17-4B26-96DB-C2B4303722B3.1; 
 Fri, 14 Jul 2023 14:20:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acde2031ac13.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Jul 2023 14:20:16 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS4PR08MB8241.eurprd08.prod.outlook.com (2603:10a6:20b:51d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:20:12 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d85f:f23f:ef0a:d163]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d85f:f23f:ef0a:d163%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:20:12 +0000
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
X-Inumbo-ID: 978fffc6-2251-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6OT61ln+bj06Za8RV8SyTwZ/59XXWqkNmJcsNMugnY=;
 b=0TSgK6T7xocUd8aFfKMP9TQFQTgMwbMMlfDi9ijVD0vp9t7q/Os29PBhaCHq+YciN/Olwzf1lFlHM7qoapbqLASADyE4fjnZt8rNh3lwPzSPGsFi0DoNXkgt0Zeh/uuFhAaI2M/yLS/TTYYCp7Qno85Pc6pjNRA1mVJl7F3Xx3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79594215c7f9b808
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0EOaxoXQUzzXegbEpx7UBGp7BjGnqvPYpdS0TNNbvNxwE+bSIaCr1CRu/omLq3Ag7TVDcfxLluO0SjTKcFWS4CNZCLApdE4s8v0eZbRGjGLwf7P1FB7jaI3cTkFR8IMF5PudnUmE9Ls4JF/qkdoAOozeVBRR/N1B/7mpqdUWksxz/VP0yHI4JVFFrHMSIEaE6k13670rtj13/f4cxeat9QtP6lNF+uMBhiXFhMKoICZ/RkwdjYkWHVewqiERRez9+zg3iIkNJTV/pYq4VyBReX34wPJ79/JjfHv2iEah4cO6qzosn0Dcc2vASldJvnQOnwoWFVa+9NcKz8p6yq4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6OT61ln+bj06Za8RV8SyTwZ/59XXWqkNmJcsNMugnY=;
 b=CcY0frh2yAjpBa2ED32V7lyr/a1OBF+kUxUwkbzNCY9AOXAd2O95a9Cu/f9Lwdvo8Fv6aeO7cJRvf54QaH6p4fAAcN/lEz47NFNOyKLOBi2Xav+Dt0sPzzJ608mpTXJhQo5jaE0+DN4gCMa881WpOdFunlJ1K6GF1XwIywH8ZONVEw+ImFX6LJFDqyqDpx3Rw/fjoXbJagbVFnqxEKYRy0lxTBLbRxbeMMjEnKbIpUq35r3J301K5PzvPdtmAm/+kEGEPAOMHtv7c44UR0ovvDjxl2AbPta7P0PlrIOuZqT1Y6xBNDh5I5p/yY8Sm0MSVHWSNsLdNEW1pMq6J8Fgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6OT61ln+bj06Za8RV8SyTwZ/59XXWqkNmJcsNMugnY=;
 b=0TSgK6T7xocUd8aFfKMP9TQFQTgMwbMMlfDi9ijVD0vp9t7q/Os29PBhaCHq+YciN/Olwzf1lFlHM7qoapbqLASADyE4fjnZt8rNh3lwPzSPGsFi0DoNXkgt0Zeh/uuFhAaI2M/yLS/TTYYCp7Qno85Pc6pjNRA1mVJl7F3Xx3o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Thread-Topic: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized
 variable inside a macro
Thread-Index: AQHZtkllBkKUd/6mO0+M9pyVgMwza6+5T/sA
Date: Fri, 14 Jul 2023 14:20:12 +0000
Message-ID: <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS4PR08MB8241:EE_|DBAEUR03FT051:EE_|DB9PR08MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: be954ded-0d5e-4c14-1f55-08db84757886
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K4TGeETsMmP0lmeyAKPJ0zG1qoXWP8seCpV8Z6ZErc0nv4H1l4dXBDLmtNTH6P3vRqCfwBftjFwZEN7W9nhEKyXgXaYzBDlQgBYnglJiOBvJ9LPWn9BmYZEA9+hQWogrRbpTprUtN9rIenhAqVWjzL7f+M1jsfCs8tan1LnI5pIV83TdwsCDUkSXFl/bCJ8cfxVzXzWvXf0eNDDKKQzQYyfMletYQ65ggyuVB/JlFBo1BjOWerIgTx0a0gJ6ZVLn4AlHMIpHQ5HAOqnywAmjq7yXaQNWxPHu934d2vHtVQVcZ7y2cHS9OlR1XmWdxu9+QwdNoRlze8udhqUeDaOk9YKd/rA8+Wn3kaRXNqgPzrCMl6NuEy4/janyf+HMNiJ+dXHQkJwediT1vOlCiX2xbCRuehaUOd1jPiEq+IyGdLtduHw3b8Vcu+vlmURkonbJ7nH0UYxJ2ZxOJLC1VnN88bgtV+23s1Br1ZJ9yBvxARyuciBiCeTU4qq8u0LzR9tKBpOl15P1L8GMgcR3gMV9hI3MkLFmurow4AGhRo8cRNjWdaJkowYll5CnbvHK05dNrSI7SAObxhKp9Qn7K/SBPHE++SlsJUOYNygLiBZzJdFExRej1czAiGuCBNlRSveT0QHcDQRxmBVyLkHsHo6iWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(2906002)(122000001)(2616005)(33656002)(38070700005)(36756003)(86362001)(38100700002)(6916009)(316002)(4326008)(71200400001)(66556008)(66476007)(66446008)(66946007)(76116006)(64756008)(91956017)(41300700001)(53546011)(6506007)(26005)(186003)(54906003)(478600001)(6512007)(6486002)(7416002)(8936002)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DEE87FC4AE6B247B51E949CCD038B17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8241
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e14bf679-63fb-4271-399b-08db84756fe9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nryYK2vha35JrIAEMpQoVAkblKifBotpEHM5eqL4k1xHd8FgsLgDmnqxYHb3/drqhXaK8NjXZdbK+AJzTR+HjHDiZ7Kb2zLZsW0WvReQfHA4c/Rfl02ihSAGDYoyaBWWjXX2Ig4g5gsTjj0gJNnTKKEOWo7Se00TgAEPequjQtWfDdSeILwe0SsA5eka+hAahFg1WVvRITcv768d/0QK411u6HTt39g7E1v7JsTouqu4qBAL94kAwq7fdciIZwsg9ZviUlrkfIJCE8EcaZr6olmv0pBgit846ecy/VZW86flDpJvUYvhglVRBYcKHcrt7Hjyc2KGbVCZxzb0p7jLAYBoCpYly2hH/GShArqgto+3+Ff1TBkno1J0onOp/gzPfbeZ+hIxx86jqB3dq2ByEyKjQGyajOsnpweYD0Md83EPcMLc+lXNIokexijyYHzl0weDf2dfPUheohdqLUn0zFRMhHrAKrT55MLMcFEWNupoKjGxMgOP9vQ83t5XvZpyxMf/ePU58gPzzmnH0yAEz+tatIFi/GMLzUCvxOB4NCWvw2kBBcexG/wYV2LfRw4TDKjzNAGtAX7tPbbWlTzRyP8qqvt/yxOCs6gAT75ccRJ658/kqLxAX5qhO1adegUBRfPzt9sCnPtThOr1h7X5zoxl8TFEK1QKgT11mcenONVIkoK68rDjIHeWL74TIT6L+O0ZhndOqbBYV70CHMbkzyw/hjG9RRu88iFJgL2S8CUzj8/PRLnT1ShXlne/VIAx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(316002)(47076005)(4326008)(2616005)(336012)(41300700001)(54906003)(82310400005)(6512007)(6486002)(478600001)(186003)(70586007)(70206006)(107886003)(26005)(53546011)(6506007)(33656002)(36756003)(2906002)(40480700001)(86362001)(40460700003)(8676002)(6862004)(82740400003)(5660300002)(81166007)(356005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:20:27.1152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be954ded-0d5e-4c14-1f55-08db84757886
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6572

DQoNCj4gT24gMTQgSnVsIDIwMjMsIGF0IDEyOjQ5LCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZl
dHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPiANCj4gVGhlIG1hY3JvICd0ZXN0b3AnIGV4cGFu
ZHMgdG8gYSBmdW5jdGlvbiB0aGF0IGRlY2xhcmVzIHRoZSBsb2NhbA0KPiB2YXJpYWJsZSAnb2xk
Yml0Jywgd2hpY2ggaXMgd3JpdHRlbiBiZWZvcmUgYmVpbmcgc2V0LCBidXQgaXMgc3VjaCBhDQo+
IHdheSB0aGF0IGlzIG5vdCBhbWVuYWJsZSB0byBhdXRvbWF0aWMgY2hlY2tpbmcuDQo+IA0KPiBU
aGVyZWZvcmUsIGEgZGV2aWF0aW9uIGNvbW1lbnQsIGlzIGludHJvZHVjZWQgdG8gZG9jdW1lbnQg
dGhpcyBzaXR1YXRpb24uDQo+IA0KPiBBIHNpbWlsYXIgcmVhc29uaW5nIGFwcGxpZXMgdG8gbWFj
cm8gJ2d1ZXN0X3Rlc3RvcCcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNvbGEgVmV0cmluaSA8
bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQo+IC0tLQ0KPiBkb2NzL21pc3JhL3NhZmUuanNv
biAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KPiB4ZW4vYXJjaC9h
cm0vYXJtNjQvbGliL2JpdG9wcy5jICAgICAgICAgIHwgIDMgKysrDQo+IHhlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9ndWVzdF9hdG9taWNzLmggfCAgMyArKysNCj4gMyBmaWxlcyBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNyYS9zYWZlLmpzb24g
Yi9kb2NzL21pc3JhL3NhZmUuanNvbg0KPiBpbmRleCAyNDQwMDFmNWJlLi40Y2Y3Y2JmNTdiIDEw
MDY0NA0KPiAtLS0gYS9kb2NzL21pc3JhL3NhZmUuanNvbg0KPiArKysgYi9kb2NzL21pc3JhL3Nh
ZmUuanNvbg0KPiBAQCAtMjAsNiArMjAsMjIgQEANCj4gICAgICAgICB9LA0KPiAgICAgICAgIHsN
Cj4gICAgICAgICAgICAgImlkIjogIlNBRi0yLXNhZmUiLA0KPiArICAgICAgICAgICAgImFuYWx5
c2VyIjogew0KPiArICAgICAgICAgICAgICAgICJlY2xhaXIiOiAiTUMzUjEuUjkuMSINCj4gKyAg
ICAgICAgICAgIH0sDQo+ICsgICAgICAgICAgICAibmFtZSI6ICJSdWxlIDkuMTogaW5pdGlhbGl6
ZXIgbm90IG5lZWRlZCIsDQo+ICsgICAgICAgICAgICAidGV4dCI6ICJUaGUgZm9sbG93aW5nIGxv
Y2FsIHZhcmlhYmxlcyBhcmUgcG9zc2libHkgc3ViamVjdCB0byBiZWluZyByZWFkIGJlZm9yZSBi
ZWluZyB3cml0dGVuLCBidXQgY29kZSBpbnNwZWN0aW9uIGVuc3VyZWQgdGhhdCB0aGUgY29udHJv
bCBmbG93IGluIHRoZSBjb25zdHJ1Y3Qgd2hlcmUgdGhleSBhcHBlYXIgZW5zdXJlcyB0aGF0IG5v
IHN1Y2ggZXZlbnQgbWF5IGhhcHBlbi4iDQo+ICsgICAgICAgIH0sDQo+ICsgICAgICAgIHsNCj4g
KyAgICAgICAgICAgICJpZCI6ICJTQUYtMy1zYWZlIiwNCj4gKyAgICAgICAgICAgICJhbmFseXNl
ciI6IHsNCj4gKyAgICAgICAgICAgICAgICAiZWNsYWlyIjogIk1DM1IxLlI5LjEiDQo+ICsgICAg
ICAgICAgICB9LA0KPiArICAgICAgICAgICAgIm5hbWUiOiAiUnVsZSA5LjE6IGluaXRpYWxpemVy
IG5vdCBuZWVkZWQiLA0KPiArICAgICAgICAgICAgInRleHQiOiAiVGhlIGZvbGxvd2luZyBsb2Nh
bCB2YXJpYWJsZXMgYXJlIHBvc3NpYmx5IHN1YmplY3QgdG8gYmVpbmcgcmVhZCBiZWZvcmUgYmVp
bmcgd3JpdHRlbiwgYnV0IGNvZGUgaW5zcGVjdGlvbiBlbnN1cmVkIHRoYXQgdGhlIGNvbnRyb2wg
ZmxvdyBpbiB0aGUgY29uc3RydWN0IHdoZXJlIHRoZXkgYXBwZWFyIGVuc3VyZXMgdGhhdCBubyBz
dWNoIGV2ZW50IG1heSBoYXBwZW4uIg0KPiArICAgICAgICB9LA0KDQpTaW5jZSB0aGUgcnVsZSBh
bmQgdGhlIGp1c3RpZmljYXRpb24gYXJlIHRoZSBzYW1lLCB5b3UgY2FuIGRlY2xhcmUgb25seSBv
bmNlIGFuZCB1c2UgdGhlIHNhbWUgdGFnIG9uIHRvcCBvZiB0aGUgb2ZmZW5kaW5nIGxpbmVzLCBz
byAvKiBTQUYtMi1zYWZlIE1DM1IxLlI5LjEgKi8sDQphbHNvLCBJIHJlbWVtYmVyIHNvbWUgbWFp
bnRhaW5lcnMgbm90IGhhcHB5IGFib3V0IHRoZSBtaXNyYSBydWxlIGJlaW5nIHB1dCBhZnRlciB0
aGUgdGFnLCBub3cgSSBkb27igJl0IHJlY2FsbCB3aG8NCg0KPiArICAgICAgICB7DQo+ICsgICAg
ICAgICAgICAiaWQiOiAiU0FGLTQtc2FmZSIsDQo+ICAgICAgICAgICAgICJhbmFseXNlciI6IHt9
LA0KPiAgICAgICAgICAgICAibmFtZSI6ICJTZW50aW5lbCIsDQo+ICAgICAgICAgICAgICJ0ZXh0
IjogIk5leHQgSUQgdG8gYmUgdXNlZCINCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9saWIvYml0b3BzLmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbGliL2JpdG9wcy5jDQo+IGluZGV4
IDIwZTNmM2Q2Y2UuLmUwNzI4YmIyOWQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02
NC9saWIvYml0b3BzLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2xpYi9iaXRvcHMuYw0K
PiBAQCAtMTE0LDggKzExNCwxMSBAQCBiaXRvcChjaGFuZ2VfYml0LCBlb3IpDQo+IGJpdG9wKGNs
ZWFyX2JpdCwgYmljKQ0KPiBiaXRvcChzZXRfYml0LCBvcnIpDQo+IA0KPiArLyogU0FGLTItc2Fm
ZSBNQzNSMS5SOS4xICovDQo+IHRlc3RvcCh0ZXN0X2FuZF9jaGFuZ2VfYml0LCBlb3IpDQo+ICsv
KiBTQUYtMi1zYWZlIE1DM1IxLlI5LjEgKi8NCj4gdGVzdG9wKHRlc3RfYW5kX2NsZWFyX2JpdCwg
YmljKQ0KPiArLyogU0FGLTItc2FmZSBNQzNSMS5SOS4xICovDQo+IHRlc3RvcCh0ZXN0X2FuZF9z
ZXRfYml0LCBvcnIpDQo+IA0KPiBzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGludF9jbGVhcl9t
YXNrMTYodWludDE2X3QgbWFzaywgdm9sYXRpbGUgdWludDE2X3QgKnAsDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3Vlc3RfYXRvbWljcy5oIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2d1ZXN0X2F0b21pY3MuaA0KPiBpbmRleCBhMTc0NWY4NjEzLi45ZDhmOGVj
M2EzIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3Vlc3RfYXRvbWlj
cy5oDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ndWVzdF9hdG9taWNzLmgNCj4g
QEAgLTY3LDggKzY3LDExIEBAIGd1ZXN0X2JpdG9wKGNoYW5nZV9iaXQpDQo+IC8qIHRlc3RfYml0
IGRvZXMgbm90IHVzZSBsb2FkLXN0b3JlIGF0b21pYyBvcGVyYXRpb25zICovDQo+ICNkZWZpbmUg
Z3Vlc3RfdGVzdF9iaXQoZCwgbnIsIHApICgodm9pZCkoZCksIHRlc3RfYml0KG5yLCBwKSkNCj4g
DQo+ICsvKiBTQUYtMy1zYWZlIE1DM1IxLlI5LjEgKi8NCj4gZ3Vlc3RfdGVzdG9wKHRlc3RfYW5k
X3NldF9iaXQpDQo+ICsvKiBTQUYtMy1zYWZlIE1DM1IxLlI5LjEgKi8NCj4gZ3Vlc3RfdGVzdG9w
KHRlc3RfYW5kX2NsZWFyX2JpdCkNCj4gKy8qIFNBRi0zLXNhZmUgTUMzUjEuUjkuMSAqLw0KPiBn
dWVzdF90ZXN0b3AodGVzdF9hbmRfY2hhbmdlX2JpdCkNCj4gDQo+ICN1bmRlZiBndWVzdF90ZXN0
b3ANCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQoNCg==

