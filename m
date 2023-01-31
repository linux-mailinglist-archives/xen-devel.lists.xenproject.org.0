Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC80682204
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 03:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487330.754937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMgL1-0006oi-2g; Tue, 31 Jan 2023 02:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487330.754937; Tue, 31 Jan 2023 02:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMgL0-0006lR-Tj; Tue, 31 Jan 2023 02:25:34 +0000
Received: by outflank-mailman (input) for mailman id 487330;
 Tue, 31 Jan 2023 02:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzvD=54=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMgKz-0006lL-Nz
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 02:25:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 882100f9-a10e-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 03:25:31 +0100 (CET)
Received: from DB8PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:10:be::48)
 by AS2PR08MB9810.eurprd08.prod.outlook.com (2603:10a6:20b:605::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 02:25:28 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::9f) by DB8PR03CA0035.outlook.office365.com
 (2603:10a6:10:be::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 02:25:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Tue, 31 Jan 2023 02:25:27 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Tue, 31 Jan 2023 02:25:27 +0000
Received: from 89a828a51190.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0798C50E-9AAF-4664-9588-E96E3F461D0E.1; 
 Tue, 31 Jan 2023 02:25:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89a828a51190.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Jan 2023 02:25:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9363.eurprd08.prod.outlook.com (2603:10a6:20b:5aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.31; Tue, 31 Jan
 2023 02:25:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.033; Tue, 31 Jan 2023
 02:25:08 +0000
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
X-Inumbo-ID: 882100f9-a10e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMDPrCse9C468YL8oipJD7KpwWoj4gt3JDyEH20o2P0=;
 b=zE7csT5RfJZtjgA1QsWR9sPdI28VkXBA9bfGLniZGNodRZ3S9S2amIAk39/j/D2NSWT/Vb8oe3HsBl/t9Lg6gzsibf9NbnMV6vVfyhzd2NzFWSg4IYKgXQJsfRIg+dY7YWODb1gL3DjffsPdzM7BCFzX1UWimjU8sJNXqSe7yPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHk6437HIuCACtTHeQvQ8RVbyANHr/vPILZT9cPKiWNEI9Lr5kYFMowxf8R+wZ9BfFrWaLIBwg/34F/e8oepQoofPL2YQilbyRvQpSfh4/V0F3q2TptmlCeQXrF05v4PHyV+fyTcCyMmO0YhPw3z2vLd58nv637hRV6xQ/h/N/1/WIxWoh0n5onNR8j8/27OBZcGqiuHpzHj34BJ0y20/3QJdEA32yrYScZB/6Yp5c/Z+2L9nulXfY/uAerqtVUbG2x/Ag33grIGl7Wk11QN5wj0pSpE4thGUp9Ms8ZOa59QueWXZ7CC/15DV9vu3jORLEkWzg55puGhcnVwL26hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMDPrCse9C468YL8oipJD7KpwWoj4gt3JDyEH20o2P0=;
 b=dUeQJ6JcKreypcJ386SItCILYCaZa8AoefrdSnCDpdLnesWFiqOdi3MH3jAjmRNi70NlGoCTJCeNvanENO5MzwGe0ZKCYtQ8fmomlRqxif7DzgfdAI7WkPTP2HPu1UQfiEOvhyUyws+2zsx2vhdY5Os19gae2qK5fCEgkCcilGyINoQ9/3yTBAH59w9IoOuEs6IOSSD4HQ6p1yv3LtG6JgB5CwIhpH1/PiybeP7lZX3Oe6p943FiXKaMd41gMKxMuy3RfNkyC9Vmai1pFyEzaCQNVABzyxyL4AF8ZJLKAZHI1a407G9vuSVk0mWmtNoJSH3QV+nLJcF+IPq1SiodGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMDPrCse9C468YL8oipJD7KpwWoj4gt3JDyEH20o2P0=;
 b=zE7csT5RfJZtjgA1QsWR9sPdI28VkXBA9bfGLniZGNodRZ3S9S2amIAk39/j/D2NSWT/Vb8oe3HsBl/t9Lg6gzsibf9NbnMV6vVfyhzd2NzFWSg4IYKgXQJsfRIg+dY7YWODb1gL3DjffsPdzM7BCFzX1UWimjU8sJNXqSe7yPA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Topic: [PATCH v3 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Index: AQHZNGA1IwnnIsRmjEGECQ4jTGRpG663gnMAgAA6SvA=
Date: Tue, 31 Jan 2023 02:25:08 +0000
Message-ID:
 <AS8PR08MB79910D7E3C7F32D8CDCB851092D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
 <20230130040535.188236-2-Henry.Wang@arm.com>
 <fca91d3c-5d8a-3f7e-419a-a4c5208273dc@xen.org>
In-Reply-To: <fca91d3c-5d8a-3f7e-419a-a4c5208273dc@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E7B68B85109E8D44ADD76939F6ABD58C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9363:EE_|DBAEUR03FT019:EE_|AS2PR08MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b943789-3b8a-4ba8-2231-08db03326acb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZmWIt/jHc8FPf3MEimBk3kzdRcbON6nRp+Ayd4/jvTMWAjDmkPyZI+sKUsprjLiAsfhbopcNHXlNOswtMNXSd/pD0dEj+NBBH71R+o5e+cCcG6ulIh5SujiREXCB3rUquxYbgfVgwi8wfOIN0pcXmpZLHX8fvH+MsZurbaW0j0xp4ssDmJlYOUD1ACP2m2VBmpADdGk2c4bnsO3OjPdhx2zlaMLS94ta3Lxs1HNxyEG7kXhzdi97qFcfIYdkjUSNuaZrPHjYV8H4zDRxyTVQ78yReBJo/KIFw7qNRJsZ3FhGyGl6b08YNMSqo3anQCU64jqWncVMIRDcwUF2jf0czGD3LOHp3YnO467l7gxpBiTCScki2JcHe6oxpSKet6KqXFkkTJZb+O0cvMyqprJl9T5PF0us7J9g/PI9lChikKaUUdig44irB373IPM9EHQ+WRm8ggsVnnNRQUd+X8zdhjWQxDeLytjtpWR3Gg4xh5Qv05gDDHW7PWrUgqpY0WFY4bVwzu+o2rs4bz8bfV+l0Cl9SZdZjKDdOxcDJLP8JxHctfhReNkY9CIpVtdizGgq8raQ2/6g8Vh1ZG2f5TYGIN1Q/L2UISLeewTBFDNJyJACJaVmsu7S5tESzMWxBWx/XIQoPu4AJ6YSYaqEE8pZTZxEUQPCLVeCdRIwr1oUBx7ou+osLRfLxdNAL4KUwIsfTmI39b7ykTh+Yiu55dWXItOdW7rhRP22syL94kry9z8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199018)(33656002)(38070700005)(38100700002)(86362001)(122000001)(41300700001)(54906003)(2906002)(110136005)(478600001)(71200400001)(966005)(66556008)(8936002)(55016003)(4326008)(5660300002)(8676002)(66476007)(76116006)(316002)(66946007)(52536014)(83380400001)(26005)(66446008)(9686003)(186003)(6506007)(64756008)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f87cd6a3-a8a8-4406-39ed-08db03325f2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gX6OjByirul196e8wKOhYl2CSOBVnSRt7vm4wrTqPQQERzE7M7gx+Cls7yZo/AA7GiBBUfBGxjeyFk6DvXaRv0+ryRL3Zys/JZ2nGIRu1LI186U2ZZAB/OfuEU7YSp+V2lD3QjPKzcDGqR0vYxChKKFSkNec2qxA6Px+addAdoIHAtXEfo39y70DdshKNzfc9YHCS2NTH50t3M8HoYEeybKSYAqtkEigqAZW3TO4OO7i28lCmQPo6bohuurQLt2jvOPQ+zb2Ud3NPo3XMWoa1LjVmIIzmJJAO6+OZh5leL7JlDuCrLUbKCJS5m1pXgf0wfA5OJjRq1e6YCQIbw7OdgjZUqjT0SNr+5NiYKmey7Rs8CFMFYTOYHhQtjp+flt/QRe7LeFj8LCJKlX1zV/e5dhVbRP3AWY24US22KXyKoL2Tg1q0J6LzVXo0DJRiJmEW4hIdZ9SLRZktli8W1AdkxRsTX6i+7Mw6tf03RbegdrJ8ojXRTVd9UrWY+23x3XTY+tjWXwHSYRNsI0GzlYzLkmTXdNrmsCM8fILmZptHmyXfPR2BGk0GEHRe0x62rgTWtSLF/5ygaEvTH8+2VRnBhpLYxIGrsos/nA7iKSWlAsud1OUSvZqwcZxz4NYnJgOmU3AY4QVsh+YW9uzXJn/EWLAFKeaFOC0GiO1CDknAVOMfhecrgozIQuR5tj4bGSXQpxSWM0q/FTzjDo6BJt1vvSRUnjQdbZ0S06beDq/R6Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(70586007)(33656002)(2906002)(40460700003)(5660300002)(316002)(107886003)(47076005)(40480700001)(356005)(52536014)(81166007)(82740400003)(70206006)(41300700001)(36860700001)(86362001)(8936002)(4326008)(83380400001)(82310400005)(55016003)(26005)(336012)(54906003)(9686003)(8676002)(110136005)(6506007)(7696005)(478600001)(966005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:25:27.8002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b943789-3b8a-4ba8-2231-08db03326acb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9810

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8zXSB4
ZW4vYXJtOiBBZGQgbWVtb3J5IG92ZXJsYXAgY2hlY2sgZm9yDQo+IGJvb3RpbmZvLnJlc2VydmVk
X21lbQ0KPiANCj4gSGkgSGVucnksDQo+IA0KPiA+ICt7DQo+ID4gKyAgICBwYWRkcl90IGJhbmtf
c3RhcnQgPSBJTlZBTElEX1BBRERSLCBiYW5rX2VuZCA9IDA7DQo+ID4gKyAgICBwYWRkcl90IHJl
Z2lvbl9lbmQgPSByZWdpb25fc3RhcnQgKyByZWdpb25fc2l6ZTsNCj4gPiArICAgIHVuc2lnbmVk
IGludCBpLCBiYW5rX251bSA9IG1lbWluZm8tPm5yX2JhbmtzOw0KPiA+ICsNCj4gPiArICAgIGZv
ciAoIGkgPSAwOyBpIDwgYmFua19udW07IGkrKyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAg
YmFua19zdGFydCA9IG1lbWluZm8tPmJhbmtbaV0uc3RhcnQ7DQo+ID4gKyAgICAgICAgYmFua19l
bmQgPSBiYW5rX3N0YXJ0ICsgbWVtaW5mby0+YmFua1tpXS5zaXplOw0KPiA+ICsNCj4gPiArICAg
ICAgICBpZiAoIHJlZ2lvbl9lbmQgPD0gYmFua19zdGFydCB8fCByZWdpb25fc3RhcnQgPj0gYmFu
a19lbmQgKQ0KPiANCj4gLi4uIGl0IGNsZWFybHkgc2hvd3MgaG93IHRoaXMgY2hlY2sgd291bGQg
YmUgd3Jvbmcgd2hlbiBlaXRoZXIgdGhlIGJhbmsNCj4gb3IgdGhlIHJlZ2lvbiBpcyBhdCB0aGUg
ZW5kIG9mIHRoZSBhZGRyZXNzIHNwYWNlLiBZb3UgbWF5IHNheSBpdCBkb2Vzbid0DQo+IG92ZXJs
YXAgd2hlbiBpdCBjb3VsZCAoZS5nLiB3aGVuIHJlZ2lvbl9lbmQgPCByZWdpb25fc3RhcnQpLg0K
DQpIZXJlIGRvIHlvdSBtZWFuIGlmIHRoZSByZWdpb24gaXMgYXQgdGhlIGVuZCBvZiB0aGUgYWRk
ciBzcGFjZSwNCiJyZWdpb25fc3RhcnQgKyByZWdpb25fZW5kIiB3aWxsIG92ZXJmbG93IGFuZCBj
YXVzZQ0KcmVnaW9uX2VuZCA8IHJlZ2lvbl9zdGFydD8gSWYgc28uLi4NCg0KPiANCj4gVGhhdCBz
YWlkLCB1bmxlc3Mgd2UgcmV3b3JrICdiYW5rJywgd2Ugd291bGQgbm90IHByb3Blcmx5IHNvbHZl
IHRoZQ0KPiBwcm9ibGVtLiBCdXQgdGhhdCdzIGxpa2VseSBhIGJpZ2dlciBwaWVjZSBvZiB3b3Jr
IGFuZCBub3Qgc29tZXRoaW5nIEkNCj4gd291bGQgcmVxdWVzdC4NCj4gDQo+IFNvIGZvciBub3cs
IEkgd291bGQgc3VnZ2VzdCB0byBhZGQgYSBjb21tZW50LiBTdGVmYW5vLCB3aGF0IGRvIHlvdSB0
aGluaz8NCg0KLi4uSSBhbSBub3QgcmVhbGx5IHN1cmUgaWYgc2ltcGx5IGFkZGluZyBhIGNvbW1l
bnQgaGVyZSB3b3VsZCBoZWxwLA0KYmVjYXVzZSB3aGVuIHRoZSBvdmVyZmxvdyBoYXBwZW5zLCB3
ZSBhcmUgYWxyZWFkeSBkb29tZWQgYmVjYXVzZQ0Kb2YgdGhlIG1lc3NlZC11cCBkZXZpY2UgdHJl
ZS4NCg0KV291bGQgYWRkaW5nIGEgYEJVR19PTihyZWdpb25fZW5kIDwgcmVnaW9uX3N0YXJ0KWAg
bWFrZSBzZW5zZSB0byB5b3U/DQoNCj4gDQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+
ICsgICAgICAgIGVsc2UNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHByaW50aygi
UmVnaW9uOiBbJSMiUFJJcGFkZHIiLCAlIyJQUklwYWRkciJdIG92ZXJsYXBwaW5nIHdpdGgNCj4g
YmFua1sldV06IFslIyJQUklwYWRkciIsICUjIlBSSXBhZGRyIl1cbiIsDQo+IA0KPiAnXScgdXN1
YWxseSBtZWFuIGluY2x1c2l2ZS4gQnV0IGhlcmUsICdlbmQnIGlzIGV4Y2x1c2l2ZS4gU28geW91
IHdhbnQgJ1snLg0KDQpPaCwgbm93IEkgdW5kZXJzdGFuZCB0aGUgbWlzdW5kZXJzdGFuZGluZyBp
biBvdXIgY29tbXVuaWNhdGlvbiBpbiB2MToNCkkgZGlkbid0IGtub3cgJ1snIG1lYW5zIGV4Y2x1
c2l2ZSBiZWNhdXNlIEkgd2FzIGVkdWNhdGVkIHRvIHVzZSAnKScgWzFdIHNvIEkNCnRob3VnaHQg
eW91IG1lYW50IGluY2x1c2l2ZS4gU29ycnkgZm9yIHRoaXMuDQoNClRvIGtlZXAgY29uc2lzdGVu
Y3ksIG1heSBJIHVzZSAnKScgaGVyZT8gQmVjYXVzZSBJIHRoaW5rIHRoaXMgaXMgdGhlIGN1cnJl
bnQNCndheSBpbiB0aGUgY29kZSBiYXNlLCBmb3IgZXhhbXBsZSBzZWU6DQp4ZW4vaW5jbHVkZS94
ZW4vbnVtYS5oIEw5OTogWypzdGFydCwgKmVuZCkNCnhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9hY3BpLmMgTDE3Nzogb3ZlcmxhcCBbJWx4LCVseCkNCg0KPiANCj4gVGhpcyBjb3Vs
ZCBiZSBmaXhlZCBvbiBjb21taXQuDQo+IA0KPiBCVFcsIHRoZSBzYW1lIGNvbW1lbnRzIGFwcGxp
ZXMgZm9yIHRoZSBzZWNvbmQgcGF0Y2guDQoNCkkgd2lsbCBmaXggdGhpcyBwYXRjaCBhbmQgIzIg
aW4gdjQuDQoNClsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9JbnRlcnZhbF8obWF0
aGVtYXRpY3MpI0luY2x1ZGluZ19vcl9leGNsdWRpbmdfZW5kcG9pbnRzDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

