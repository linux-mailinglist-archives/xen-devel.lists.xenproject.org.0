Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4F4191D1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196616.349532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnHw-0008HR-UK; Mon, 27 Sep 2021 09:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196616.349532; Mon, 27 Sep 2021 09:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUnHw-0008El-R7; Mon, 27 Sep 2021 09:51:08 +0000
Received: by outflank-mailman (input) for mailman id 196616;
 Mon, 27 Sep 2021 09:51:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xxNw=OR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUnHv-0008Ef-PK
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:51:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.87]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e5ef4cc-1f78-11ec-bc43-12813bfff9fa;
 Mon, 27 Sep 2021 09:51:05 +0000 (UTC)
Received: from AM6P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::21)
 by DBBPR08MB4394.eurprd08.prod.outlook.com (2603:10a6:10:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 09:51:02 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::72) by AM6P192CA0008.outlook.office365.com
 (2603:10a6:209:83::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 09:51:02 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 09:51:01 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Mon, 27 Sep 2021 09:50:59 +0000
Received: from cea30a26d627.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC1E8423-5779-4D69-8598-F669072250BE.1; 
 Mon, 27 Sep 2021 09:50:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cea30a26d627.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 09:50:50 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6715.eurprd08.prod.outlook.com (2603:10a6:10:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 09:50:46 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:50:46 +0000
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
X-Inumbo-ID: 6e5ef4cc-1f78-11ec-bc43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3/x3sqtUyU2wimZJo1Jllq4DKTHS4GZHQksye07BUI=;
 b=U+J7RQTl6sDfNf5JtGVRD5KvrXVxqMSHT41P9nsm2cINcTWtWgveAEfuiivPsqFSVVRnN3nnFx6UiL8e7bk49I3X9zxhhe7io0yIpB6JSTb9xLZ1rOe5zj8i4BgKeuLLRGYFVjQnEWE7jKfwByrClhpD1aQyOg1JHqvZoY7fLl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxM5z7AoHmJKR+wmQQsQKOkimZh51P1onYPjXCswEvC+6JWRG4pziIxFl+RIbXLJtJlVJgMGWrDk/DDnqUXaQ/0HGbz0Zr79XjIoKoqkXdcAtyaafeyhartaSiFlMh/p07IzTJSCD3UbyM8a6sP3280EgFhluWneND/yGs7K1iJuNFZOEr2bdiaodDkyXNQ5bawHZouM6LMukvzH1s6Jcxz717yNupTflJsQ9jb8theeY46tRN1ko43/T5ewDRfELYAAX5a+7InnyU5NF8NfohhwGPH006YU2vP3mWRr9p+Yg1W/MjSm9/jAsuaNOQmZDat3fzy3OJ16jYb7rEGNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=R3/x3sqtUyU2wimZJo1Jllq4DKTHS4GZHQksye07BUI=;
 b=UjRy6gz0W24j38w8ixQtt4rbPP3yvYLaF25an2emgE6vcMV9gIC65NGvCtbx27gV7PMpPuhMA/AhAxk5QCJcCTUK3QRwBwoXItow95OT5EneIVuAfwBZJuJ6jdMteGg+BH4gVy+M7z6NXNK6r5bIiLhKPL9i3JHcj+/yEzpYaz8/4mvW7WFHTgw89CURQqmT45H9rBPwHASn+zBJfIx6cx+64qMpPhReemlaUgafN8j7LAZaghb8cET1R0kfbW/N7j2MP+rLdXvG3RVh/0oH2EfdKMu9MdiI94z/c0mtYNV6BIAz5f1dghD4SWdstpNVBu+fzMwGSWPiM2xHfRmYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3/x3sqtUyU2wimZJo1Jllq4DKTHS4GZHQksye07BUI=;
 b=U+J7RQTl6sDfNf5JtGVRD5KvrXVxqMSHT41P9nsm2cINcTWtWgveAEfuiivPsqFSVVRnN3nnFx6UiL8e7bk49I3X9zxhhe7io0yIpB6JSTb9xLZ1rOe5zj8i4BgKeuLLRGYFVjQnEWE7jKfwByrClhpD1aQyOg1JHqvZoY7fLl4=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Topic: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Index:
 AQHXsHMRZjZ8eZQrbkW8SEq2x0f00KuyVH0AgABDnECAAQJ+AIACfOAggAEi1ICAAB9HAIAAIXKw
Date: Mon, 27 Sep 2021 09:50:46 +0000
Message-ID:
 <DB9PR08MB685772C5CDE9DF885A063F479EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109241244070.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857A3176752B3E08EAE4D739EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262002390.5022@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109262159500.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109262159500.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7EBDD917EFE3414E9FEF5E7E02B172ED.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 82c771b3-ee02-4ddf-ae9f-08d9819c50cc
x-ms-traffictypediagnostic: DB9PR08MB6715:|DBBPR08MB4394:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB439452EE87290D0028B182A79EA79@DBBPR08MB4394.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 woavUwxf7hH6DukD/o/9RT1d7kNf1z4rR6Fi+yeSsD/mBpyWAl2+jexHZY01bKyM36GNVVPbmD5O0jLwY8pzPzWAmGwF5qNcFyNWBE6/GJtiC9/FsEqW0i4TL3FBETuVMedQt8rHXrRIHky4f8y8o7i73TOzfnFqU/LG0fWqF8eBI3y12j3o1CY0kyRyzwUS8z0kXZCkLbRX9GO1Bfl1lryWZotYBGnzSIepiO9+E/HFp8W40dxx+aYJwZl4KTGVVyjCkDL+kIyg4inj9vZbLzDcLRBmprrRCVVuBggn2TJ7DKEqOpav4oMslOw3T5j2C2jBzC6kgT9mj5IsDIb+Aqr4XKKpZYDjz3ag1Tg/W3fPTtL2cSLG2We3uYjsIov1CfV9E4GLDwnyXfaG39MoP/+IBzh/qwbtuib6eK6L9H8ofM02q6R7MZCue44L5kWi4jOmV/k/DEJxlDe5AuPc4EyocK3yNQ0bPM58Ii6RDtJKGljHytagc5Kh2wv7IZ0L6L+NbIr74RJf/0AQ1dTE943ROaEPvlJrWa+jeYqM4QfAiKF3c6cjtyt/ph9i8DL+hjW5mOSjHKzzDoDXaSp8dcqtI+DRNRKAX0oP8blWrvMUXfX7JrSD6JceyrChOLe5JY3Ymgj8BBCmq0aB1xC4xOxUtlc6uSHMfZaX17AvmaO0GBbo8pRsMSG8bTy80rmwGvDdr7fSIF3vgJVd5V1UEQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(83380400001)(86362001)(66946007)(76116006)(52536014)(71200400001)(5660300002)(26005)(316002)(186003)(508600001)(55016002)(8936002)(54906003)(8676002)(38100700002)(66476007)(7696005)(66556008)(6506007)(4326008)(64756008)(53546011)(66446008)(122000001)(38070700005)(33656002)(2906002)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45fd03b3-464a-4652-08c1-08d9819c4766
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eRNBIt2LTkqvYahjaJoaHJwofz+uOQ2sBi6/ybbyK07UeOhteaWEPNy7orcABNT+HWuvF9DvuOA5l833alyra0MvBNGYbyPPPvUSxaRdOoSRPpU/O5dt+N+SETfRRE2oFjo/QnBSlPHfhjgHn9EH49VD6IaDXof+XUlALDrHwysjrBYvqBO0D/dCr2DTYct0T9XYz3EoJOrnHERJZeRHMdVwptkUa50PgksAQo2lCfFm000REd9cF/7kjeBQfmJ9ZL5wRxQofHvtWs8810oq+NssL57/aLG6OEfZmHJoEW2dcTC2NFXaL2kA6p8rsdOOAiGHhywnnJMGJszqxtRzwtHxQuaVfs/zoG1J+DL1cT53Mo1rJXCkpwesIGH9U3FEwwiWUEoOrOg56QUe87PPn/P/2eVtO5ZvxZF8O6WFD1ci8IZmkGgO22dvWeaUBd6mNotbLRz2Gk1H+1o7HUp0a0ZcBASGbps4vXMlJ51QJRNVw1vMAcKQTQL07nUAPfKRU1RCkycWeRLJ0biiKYZO117obuzqFG/pzNGqUiRjs5CGWqHvJQUX3d6XYaufqEdGHtl+K3/TTpxHxVmFZ+HpI3RvDWG2/auM9G/mFMhXo7o1uVhb/Q4tfD7UEmeByAI3WlWVpBUdR6qfqq3t1Ep+07qxlT9UDJbS5QxsPYMds+LiRvJu6fmxaems4uf7hzjBz1Ni2p3x7GsTUOWpggpQtA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(6862004)(83380400001)(70206006)(70586007)(4326008)(82310400003)(6506007)(81166007)(86362001)(53546011)(7696005)(8676002)(9686003)(36860700001)(186003)(47076005)(356005)(33656002)(316002)(55016002)(52536014)(8936002)(2906002)(54906003)(26005)(5660300002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:51:01.8710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c771b3-ee02-4ddf-ae9f-08d9819c50cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4394

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ5
5pyIMjfml6UgMTM6MDUNCj4gVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4NCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOw0KPiBqdWxpZW5AeGVuLm9yZzsgQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gamJldWxpY2hAc3VzZS5jb207IGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb207IHJvZ2VyLnBhdUBjaXRyaXguY29tOw0KPiB3bEB4ZW4ub3JnDQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMDgvMzddIHhlbi94ODY6IGFkZCBkZXRlY3Rpb24gb2YgZGlz
Y29udGlub3VzIG5vZGUNCj4gbWVtb3J5IHJhbmdlDQo+IA0KPiBPbiBTdW4sIDI2IFNlcCAyMDIx
LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24gU3VuLCAyNiBTZXAgMjAyMSwgV2Vp
IENoZW4gd3JvdGU6DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+
IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiA+
ID4gU2VudDogMjAyMeW5tDnmnIgyNeaXpSAzOjUzDQo+ID4gPiA+IFRvOiBXZWkgQ2hlbiA8V2Vp
LkNoZW5AYXJtLmNvbT4NCj4gPiA+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz47IHhlbi0NCj4gPiA+ID4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4gPiA+IDxCZXJ0cmFuZC5NYXJx
dWlzQGFybS5jb20+OyBqYmV1bGljaEBzdXNlLmNvbTsNCj4gYW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbTsNCj4gPiA+ID4gcm9nZXIucGF1QGNpdHJpeC5jb207IHdsQHhlbi5vcmcNCj4gPiA+ID4g
U3ViamVjdDogUkU6IFtQQVRDSCAwOC8zN10geGVuL3g4NjogYWRkIGRldGVjdGlvbiBvZiBkaXNj
b250aW5vdXMNCj4gbm9kZQ0KPiA+ID4gPiBtZW1vcnkgcmFuZ2UNCj4gPiA+ID4NCj4gPiA+ID4g
T24gRnJpLCAyNCBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gPiA+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+ID4gPiA+ID4gU2VudDogMjAyMeW5tDnmnIgy
NOaXpSA4OjI2DQo+ID4gPiA+ID4gPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+
ID4gPiA+ID4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnOw0KPiA+ID4gPiBqdWxpZW5AeGVuLm9yZzsNCj4gPiA+ID4gPiA+IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IGpiZXVsaWNoQHN1c2UuY29t
Ow0KPiA+ID4gPiA+ID4gYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbTsgcm9nZXIucGF1QGNpdHJp
eC5jb207IHdsQHhlbi5vcmcNCj4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgvMzdd
IHhlbi94ODY6IGFkZCBkZXRlY3Rpb24gb2YNCj4gZGlzY29udGlub3VzIG5vZGUNCj4gPiA+ID4g
PiA+IG1lbW9yeSByYW5nZQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IENDJ2luZyB4ODYgbWFp
bnRhaW5lcnMNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBX
ZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT25lIE5VTUEgbm9kZSBtYXkgY29udGFpbiBz
ZXZlcmFsIG1lbW9yeSBibG9ja3MuIEluIGN1cnJlbnQNCj4gWGVuDQo+ID4gPiA+ID4gPiA+IGNv
ZGUsIFhlbiB3aWxsIG1haW50YWluIGEgbm9kZSBtZW1vcnkgcmFuZ2UgZm9yIGVhY2ggbm9kZSB0
bw0KPiBjb3Zlcg0KPiA+ID4gPiA+ID4gPiBhbGwgaXRzIG1lbW9yeSBibG9ja3MuIEJ1dCBoZXJl
IGNvbWVzIHRoZSBwcm9ibGVtLCBpbiB0aGUgZ2FwDQo+IG9mDQo+ID4gPiA+ID4gPiA+IG9uZSBu
b2RlJ3MgdHdvIG1lbW9yeSBibG9ja3MsIGlmIHRoZXJlIGFyZSBzb21lIG1lbW9yeSBibG9ja3MN
Cj4gZG9uJ3QNCj4gPiA+ID4gPiA+ID4gYmVsb25nIHRvIHRoaXMgbm9kZSAocmVtb3RlIG1lbW9y
eSBibG9ja3MpLiBUaGlzIG5vZGUncyBtZW1vcnkNCj4gcmFuZ2UNCj4gPiA+ID4gPiA+ID4gd2ls
bCBiZSBleHBhbmRlZCB0byBjb3ZlciB0aGVzZSByZW1vdGUgbWVtb3J5IGJsb2Nrcy4NCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gT25lIG5vZGUncyBtZW1vcnkgcmFuZ2UgY29udGFpbnMg
b3RoZSBub2RlcycgbWVtb3J5LCB0aGlzIGlzDQo+ID4gPiA+IG9idmlvdXNseQ0KPiA+ID4gPiA+
ID4gPiBub3QgdmVyeSByZWFzb25hYmxlLiBUaGlzIG1lYW5zIGN1cnJlbnQgTlVNQSBjb2RlIG9u
bHkgY2FuDQo+IHN1cHBvcnQNCj4gPiA+ID4gPiA+ID4gbm9kZSBoYXMgY29udGlub3VzIG1lbW9y
eSBibG9ja3MuIEhvd2V2ZXIsIG9uIGEgcGh5c2ljYWwNCj4gbWFjaGluZSwNCj4gPiA+ID4gdGhl
DQo+ID4gPiA+ID4gPiA+IGFkZHJlc3NlcyBvZiBtdWx0aXBsZSBub2RlcyBjYW4gYmUgaW50ZXJs
ZWF2ZWQuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNvIGluIHRoaXMgcGF0Y2gsIHdl
IGFkZCBjb2RlIHRvIGRldGVjdCBkaXNjb250aW5vdXMgbWVtb3J5DQo+IGJsb2Nrcw0KPiA+ID4g
PiA+ID4gPiBmb3Igb25lIG5vZGUuIE5VTUEgaW5pdGlhbGl6dGlvbiB3aWxsIGJlIGZhaWxlZCBh
bmQgZXJyb3INCj4gbWVzc2FnZXMNCj4gPiA+ID4gPiA+ID4gd2lsbCBiZSBwcmludGVkIHdoZW4g
WGVuIGRldGVjdCBzdWNoIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uDQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gQXQgbGVhc3Qgb24gQVJNLCBpdCBpcyBub3QganVzdCBtZW1vcnkgdGhhdCBjYW4g
YmUgaW50ZXJsZWF2ZWQsDQo+IGJ1dA0KPiA+ID4gPiBhbHNvDQo+ID4gPiA+ID4gPiBNTUlPIHJl
Z2lvbnMuIEZvciBpbnN0YW5jZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBub2RlMCBiYW5r
MCAwLTB4MTAwMDAwMA0KPiA+ID4gPiA+ID4gTU1JTyAweDEwMDAwMDAtMHgxMDAyMDAwDQo+ID4g
PiA+ID4gPiBIb2xlIDB4MTAwMjAwMC0weDIwMDAwMDANCj4gPiA+ID4gPiA+IG5vZGUwIGJhbmsx
IDB4MjAwMDAwMC0weDMwMDAwMDANCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTbyBJIGFtIG5v
dCBmYW1pbGlhciB3aXRoIHRoZSBTUkFUIGZvcm1hdCwgYnV0IEkgdGhpbmsgb24gQVJNDQo+IHRo
ZQ0KPiA+ID4gPiBjaGVjaw0KPiA+ID4gPiA+ID4gd291bGQgbG9vayBkaWZmZXJlbnQ6IHdlIHdv
dWxkIGp1c3QgbG9vayBmb3IgbXVsdGlwbGUgbWVtb3J5DQo+IHJhbmdlcw0KPiA+ID4gPiA+ID4g
dW5kZXIgYSBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiIG5vZGUgb2YgYSBOVU1BIG5vZGUgaW4gZGV2
aWNlDQo+IHRyZWUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFNob3VsZCBJIG5lZWQgdG8gaW5jbHVkZS9yZWZpbmUgYWJvdmUgbWVzc2FnZSB0byBjb21t
aXQgbG9nPw0KPiA+ID4gPg0KPiA+ID4gPiBMZXQgbWUgYXNrIHlvdSBhIHF1ZXN0aW9uIGZpcnN0
Lg0KPiA+ID4gPg0KPiA+ID4gPiBXaXRoIHRoZSBOVU1BIGltcGxlbWVudGF0aW9uIG9mIHRoaXMg
cGF0Y2ggc2VyaWVzLCBjYW4gd2UgZGVhbCB3aXRoDQo+ID4gPiA+IGNhc2VzIHdoZXJlIGVhY2gg
bm9kZSBoYXMgbXVsdGlwbGUgbWVtb3J5IGJhbmtzLCBub3QgaW50ZXJsZWF2ZWQ/DQo+ID4gPg0K
PiA+ID4gWWVzLg0KPiA+ID4NCj4gPiA+ID4gQW4gYW4gZXhhbXBsZToNCj4gPiA+ID4NCj4gPiA+
ID4gbm9kZTA6IDB4MCAgICAgICAgLSAweDEwMDAwMDAwDQo+ID4gPiA+IE1NSU8gOiAweDEwMDAw
MDAwIC0gMHgyMDAwMDAwMA0KPiA+ID4gPiBub2RlMDogMHgyMDAwMDAwMCAtIDB4MzAwMDAwMDAN
Cj4gPiA+ID4gTU1JTyA6IDB4MzAwMDAwMDAgLSAweDUwMDAwMDAwDQo+ID4gPiA+IG5vZGUxOiAw
eDUwMDAwMDAwIC0gMHg2MDAwMDAwMA0KPiA+ID4gPiBNTUlPIDogMHg2MDAwMDAwMCAtIDB4ODAw
MDAwMDANCj4gPiA+ID4gbm9kZTI6IDB4ODAwMDAwMDAgLSAweDkwMDAwMDAwDQo+ID4gPiA+DQo+
ID4gPiA+DQo+ID4gPiA+IEkgYXNzdW1lIHdlIGNhbiBkZWFsIHdpdGggdGhpcyBjYXNlIHNpbXBs
eSBieSBzZXR0aW5nIG5vZGUwIG1lbW9yeQ0KPiB0bw0KPiA+ID4gPiAweDAtMHgzMDAwMDAwMCBl
dmVuIGlmIHRoZXJlIGlzIGFjdHVhbGx5IHNvbWV0aGluZyBlbHNlLCBhIGRldmljZSwNCj4gdGhh
dA0KPiA+ID4gPiBkb2Vzbid0IGJlbG9uZyB0byBub2RlMCBpbiBiZXR3ZWVuIHRoZSB0d28gbm9k
ZTAgYmFua3M/DQo+ID4gPg0KPiA+ID4gV2hpbGUgdGhpcyBjb25maWd1cmF0aW9uIGlzIHJhcmUg
aW4gU29DIGRlc2lnbiwgYnV0IGl0IGlzIG5vdA0KPiBpbXBvc3NpYmxlLg0KPiA+DQo+ID4gRGVm
aW5pdGVseSwgSSBoYXZlIHNlZW4gaXQgYmVmb3JlLg0KPiA+DQo+ID4NCj4gPiA+ID4gSXMgaXQg
b25seSBvdGhlciBub2RlcycgbWVtb3J5IGludGVybGVhdmVkIHRoYXQgY2F1c2UgaXNzdWVzPyBJ
bg0KPiBvdGhlcg0KPiA+ID4gPiB3b3Jkcywgb25seSB0aGUgZm9sbG93aW5nIGlzIGEgcHJvYmxl
bWF0aWMgc2NlbmFyaW8/DQo+ID4gPiA+DQo+ID4gPiA+IG5vZGUwOiAweDAgICAgICAgIC0gMHgx
MDAwMDAwMA0KPiA+ID4gPiBNTUlPIDogMHgxMDAwMDAwMCAtIDB4MjAwMDAwMDANCj4gPiA+ID4g
bm9kZTE6IDB4MjAwMDAwMDAgLSAweDMwMDAwMDAwDQo+ID4gPiA+IE1NSU8gOiAweDMwMDAwMDAw
IC0gMHg1MDAwMDAwMA0KPiA+ID4gPiBub2RlMDogMHg1MDAwMDAwMCAtIDB4NjAwMDAwMDANCj4g
PiA+ID4NCj4gPiA+ID4gQmVjYXVzZSBub2RlMSBpcyBpbiBiZXR3ZWVuIHRoZSB0d28gcmFuZ2Vz
IG9mIG5vZGUwPw0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEJ1dCBvbmx5IGRldmljZV90eXBlPSJt
ZW1vcnkiIGNhbiBiZSBhZGRlZCB0byBhbGxvY2F0aW9uLg0KPiA+ID4gRm9yIG1taW8gdGhlcmUg
YXJlIHR3byBjYXNlczoNCj4gPiA+IDEuIG1taW8gZG9lc24ndCBoYXZlIE5VTUEgaWQgcHJvcGVy
dHkuDQo+ID4gPiAyLiBtbWlvIGhhcyBOVU1BIGlkIHByb3BlcnR5LCBqdXN0IGxpa2Ugc29tZSBQ
Q0llIGNvbnRyb2xsZXJzLg0KPiA+ID4gICAgQnV0IHdlIGRvbuKAmXQgbmVlZCB0byBoYW5kbGUg
dGhlc2Uga2luZHMgb2YgTU1JTyBkZXZpY2VzDQo+ID4gPiAgICBpbiBtZW1vcnkgYmxvY2sgcGFy
c2luZy4gQmVjYXVzZSB3ZSBkb24ndCBuZWVkIHRvIGFsbG9jYXRlDQo+ID4gPiAgICBtZW1vcnkg
ZnJvbSB0aGVzZSBtbWlvIHJhbmdlcy4gQW5kIGZvciBhY2Nlc3NpbmcsIHdlIG5lZWQNCj4gPiA+
ICAgIGEgTlVNQS1hd2FyZSBQQ0llIGNvbnRyb2xsZXIgZHJpdmVyIG9yIGEgZ2VuZXJpYyBOVU1B
LWF3YXJlDQo+ID4gPiAgICBNTUlPIGFjY2Vzc2luZyBBUElzLg0KPiA+DQo+ID4gWWVzLCBJIGFt
IG5vdCB0b28gd29ycmllZCBhYm91dCBkZXZpY2VzIHdpdGggYSBOVU1BIGlkIHByb3BlcnR5IGJl
Y2F1c2UNCj4gPiB0aGV5IGFyZSBsZXNzIGNvbW1vbiBhbmQgdGhpcyBzZXJpZXMgZG9lc24ndCBo
YW5kbGUgdGhlbSBhdCBhbGwsIHJpZ2h0Pw0KPiA+IEkgaW1hZ2luZSB0aGV5IHdvdWxkIGJlIHRy
ZWF0ZWQgbGlrZSBhbnkgb3RoZXIgZGV2aWNlIHdpdGhvdXQgTlVNQQ0KPiA+IGF3YXJlbmVzcy4N
Cj4gPg0KPiA+IEkgYW0gdGhpbmtpbmcgYWJvdXQgdGhlIGNhc2Ugd2hlcmUgdGhlIG1lbW9yeSBv
ZiBlYWNoIE5VTUEgbm9kZSBpcyBtYWRlDQo+ID4gb2YgbXVsdGlwbGUgYmFua3MuIEkgdW5kZXJz
dGFuZCB0aGF0IHRoaXMgcGF0Y2ggYWRkcyBhbiBleHBsaWNpdCBjaGVjaw0KPiA+IGZvciBjYXNl
cyB3aGVyZSB0aGVzZSBiYW5rcyBhcmUgaW50ZXJsZWF2aW5nLCBob3dldmVyIHRoZXJlIGFyZSBt
YW55DQo+ID4gb3RoZXIgY2FzZXMgd2hlcmUgTlVNQSBtZW1vcnkgbm9kZXMgYXJlICpub3QqIGlu
dGVybGVhdmluZyBidXQgdGhleSBhcmUNCj4gPiBzdGlsbCBtYWRlIG9mIG11bHRpcGxlIGRpc2Nv
bnRpbnVvdXMgYmFua3MsIGxpa2UgaW4gdGhlIHR3byBleGFtcGxlDQo+ID4gYWJvdmUuDQo+ID4N
Cj4gPiBNeSBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoaXMgcGF0Y2ggc2VyaWVzIGluIGl0cyBjdXJy
ZW50IGZvcm0gY2FuIGhhbmRsZQ0KPiA+IHRoZSB0d28gY2FzZXMgYWJvdmUgY29ycmVjdGx5LiBJ
ZiBzbywgSSBhbSB3b25kZXJpbmcgaG93IGl0IHdvcmtzIGdpdmVuDQo+ID4gdGhhdCB3ZSBvbmx5
IGhhdmUgYSBzaW5nbGUgInN0YXJ0IiBhbmQgInNpemUiIHBhcmFtZXRlciBwZXIgbm9kZS4NCj4g
Pg0KPiA+IE9uIHRoZSBvdGhlciBoYW5kIGlmIHRoaXMgc2VyaWVzIGNhbm5vdCBoYW5kbGUgdGhl
IHR3byBjYXNlcyBhYm92ZSwgbXkNCj4gPiBxdWVzdGlvbiBpcyB3aGV0aGVyIGl0IHdvdWxkIGZh
aWwgZXhwbGljaXRseSBvciBub3QuIFRoZSBuZXcNCj4gPiBjaGVjayBpc19ub2RlX21lbW9yeV9j
b250aW51b3VzIGRvZXNuJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIGNhdGNoIHRoZW0uDQo+IA0KPiAN
Cj4gTG9va2luZyBhdCBudW1hX3VwZGF0ZV9ub2RlX21lbWJsa3MsIGl0IGlzIGNsZWFyIHRoYXQg
dGhlIGNvZGUgaXMgbWVhbnQNCj4gdG8gaW5jcmVhc2UgdGhlIHJhbmdlIG9mIGVhY2ggbnVtYSBu
b2RlIHRvIGNvdmVyIGV2ZW4gTU1JTyByZWdpb25zIGluDQo+IGJldHdlZW4gbWVtb3J5IGJhbmtz
LiBBbHNvIHNlZSB0aGUgY29tbWVudCBhdCB0aGUgdG9wIG9mIHRoZSBmaWxlOg0KPiANCj4gICog
QXNzdW1lcyBhbGwgbWVtb3J5IHJlZ2lvbnMgYmVsb25naW5nIHRvIGEgc2luZ2xlIHByb3hpbWl0
eSBkb21haW4NCj4gICogYXJlIGluIG9uZSBjaHVuay4gSG9sZXMgYmV0d2VlbiB0aGVtIHdpbGwg
YmUgaW5jbHVkZWQgaW4gdGhlIG5vZGUuDQo+IA0KPiBTbyBpZiB0aGVyZSBhcmUgbXVsdGlwbGUg
YmFua3MgZm9yIGVhY2ggbm9kZSwgc3RhcnQgYW5kIGVuZCBhcmUNCj4gc3RyZXRjaGVkIHRvIGNv
dmVyIHRoZSBob2xlcyBiZXR3ZWVuIHRoZW0sIGFuZCBpdCB3b3JrcyBhcyBsb25nIGFzDQo+IG1l
bW9yeSBiYW5rcyBvZiBkaWZmZXJlbnQgTlVNQSBub2RlcyBkb24ndCBpbnRlcmxlYXZlLg0KPiAN
Cj4gSSB3b3VsZCBhcHByZWNpYXRlIGlmIHlvdSBjb3VsZCBhZGQgYW4gaW4tY29kZSBjb21tZW50
IHRvIGV4cGxhaW4gdGhpcw0KPiBvbiB0b3Agb2YgbnVtYV91cGRhdGVfbm9kZV9tZW1ibGsuDQoN
ClllcywgSSB3aWxsIGRvIGl0Lg0KDQo+IA0KPiBIYXZlIHlvdSBoYWQgYSBjaGFuY2UgdG8gdGVz
dCB0aGlzPyBJZiBub3QgaXQgd291bGQgYmUgZmFudGFzdGljIGlmIHlvdQ0KPiBjb3VsZCBnaXZl
IGl0IGEgcXVpY2sgdGVzdCB0byBtYWtlIHN1cmUgaXQgd29ya3MgYXMgaW50ZW5kZWQ6IGZvcg0K
PiBpbnN0YW5jZSBieSBjcmVhdGluZyBtdWx0aXBsZSBtZW1vcnkgYmFua3MgZm9yIGVhY2ggTlVN
QSBub2RlIGJ5DQo+IHNwbGl0dGluZyBhbiByZWFsIGJhbmsgaW50byB0d28gc21hbGxlciBiYW5r
cyB3aXRoIGEgaG9sZSBpbiBiZXR3ZWVuIGluDQo+IGRldmljZSB0cmVlLCBqdXN0IGZvciB0aGUg
c2FrZSBvZiB0ZXN0aW5nLg0KDQpZZXMsIEkgaGF2ZSBjcmVhdGVkIHNvbWUgZmFrZSBOVU1BIG5v
ZGVzIGluIEZWUCBkZXZpY2UgdHJlZSB0byB0ZXN0IGl0Lg0KVGhlIGludGVydHdpbmUgb2Ygbm9k
ZXMnIGFkZHJlc3MgY2FuIGJlIGRldGVjdGVkLg0KDQooWEVOKSBTUkFUOiBOb2RlIDAgMDAwMDAw
MDA4MDAwMDAwMC0wMDAwMDAwMGZmMDAwMDAwDQooWEVOKSBTUkFUOiBOb2RlIDEgMDAwMDAwMDg4
MDAwMDAwMC0wMDAwMDAwOGMwMDAwMDAwDQooWEVOKSBOT0RFIDA6ICgwMDAwMDAwMDgwMDAwMDAw
LTAwMDAwMDA4ZDAwMDAwMDApIGludGVydHdpbmUgd2l0aCBOT0RFIDEgKDAwMDAwMDA4ODAwMDAw
MDAtMDAwMDAwMDhjMDAwMDAwMCkNCg0K

