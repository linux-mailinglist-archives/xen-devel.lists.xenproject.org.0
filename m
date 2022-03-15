Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E24DA192
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 18:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290919.493563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBJp-0000Sl-1c; Tue, 15 Mar 2022 17:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290919.493563; Tue, 15 Mar 2022 17:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBJo-0000PI-Ui; Tue, 15 Mar 2022 17:50:48 +0000
Received: by outflank-mailman (input) for mailman id 290919;
 Tue, 15 Mar 2022 17:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nUBJm-0000PC-Ke
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 17:50:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a2beda-a488-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 18:50:45 +0100 (CET)
Received: from DB6PR07CA0097.eurprd07.prod.outlook.com (2603:10a6:6:2c::11) by
 PAXPR08MB7122.eurprd08.prod.outlook.com (2603:10a6:102:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Tue, 15 Mar
 2022 17:50:42 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::32) by DB6PR07CA0097.outlook.office365.com
 (2603:10a6:6:2c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.7 via Frontend
 Transport; Tue, 15 Mar 2022 17:50:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 17:50:42 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 15 Mar 2022 17:50:42 +0000
Received: from 19ec52f9c2e4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2DE541E-06CC-45CF-A944-8346B06C8AFF.1; 
 Tue, 15 Mar 2022 17:50:31 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19ec52f9c2e4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 17:50:31 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB7PR08MB3644.eurprd08.prod.outlook.com (2603:10a6:10:4d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 17:50:20 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 17:50:20 +0000
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
X-Inumbo-ID: 70a2beda-a488-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7y2d/oRAkaL4YdWMZFQJAxitro2bMzVLalVsVklBPI=;
 b=jm+g3efCLeLm+8Jm70LDnhvb6wA5PEwaI/kCIr+mTmXxXDfENO8YqS9u/F8aHmqrCrXqwROnvism2a+0poyAvH+WfwnnLc0v3I+P6L+SP/OsrTG12PxxZg6jQpp/l6g3rGcpF8MGnmEGGBnBvmkkh8HLfl/AVlsKaTlXXwtR+Yw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 74f5ca99f93d8e75
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQSUmry2iREd0uQL66JaU1uTfp28BHBl5D3o6ivfgt22JZAsneRauZaSVztHLPMk66bP5WT0yqUSYRCLUCbf0l/wMfHKQdeHtD5K6WdcbZz6jfdBDEUWJ0WneTfHSMZ6ic58elwnKCITbcs6koZguA6dC+Jr1pEYhB6tlCg1cTCyiweJKs6v7DQKr4BI1mx16k2VMRIzcy32z9tWIBGGmIZmOA8aUpofEBlsMEM1dorjibM42kq/3JWUS2dB2UTNM6JbZsPuVozipVHeaVqY3s5qoH9I4ekrpSRlt2OPPFIlQJwW6fCUuHG6XE3N4i/iUYtr2XaDKSlAwPGkWCt8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7y2d/oRAkaL4YdWMZFQJAxitro2bMzVLalVsVklBPI=;
 b=Ptg01z9d0GRPtpeb/0J+yirH4S5nFpHejNLueT+BARK2zSy1MXNgjLytUIxmnTl1Xf/iKTWFYewq26hV1icfhv6W7NiQyayJNL3BtmvQUU7PLNInf3lO4fGz6SwT7FH7hXYYs0V0AzlyhWSuwr/CbQcoBL1Dv0dELUmSNq4ITJu6NzJiB79g43Ghf0tec6SwijxtFS0ZRTvZz2RElmN2kYC2n5rPd4WE00lSV8rdBE1wHMuUNFEBJM8sete4YgdTgGMqQtWNFvkXoNzLAfNP/jx9nq/GNIoRKBq34wDlapIaHRFkvWcMXJYc01QtNvXgGjJBDUvIAV7kBj0B645Szw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7y2d/oRAkaL4YdWMZFQJAxitro2bMzVLalVsVklBPI=;
 b=jm+g3efCLeLm+8Jm70LDnhvb6wA5PEwaI/kCIr+mTmXxXDfENO8YqS9u/F8aHmqrCrXqwROnvism2a+0poyAvH+WfwnnLc0v3I+P6L+SP/OsrTG12PxxZg6jQpp/l6g3rGcpF8MGnmEGGBnBvmkkh8HLfl/AVlsKaTlXXwtR+Yw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/6] xen/sched: create public function for cpupools
 creation
Thread-Topic: [PATCH v2 2/6] xen/sched: create public function for cpupools
 creation
Thread-Index: AQHYNKHPindJgoRlsE6X+ucflL5fkqzAv7cAgAABSoA=
Date: Tue, 15 Mar 2022 17:50:20 +0000
Message-ID: <776C4F32-A01C-48F5-9A43-C8F94633E2F3@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-3-luca.fancellu@arm.com>
 <ab2df199-ea89-d965-f0cf-ef7fb48a949e@citrix.com>
In-Reply-To: <ab2df199-ea89-d965-f0cf-ef7fb48a949e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 81f0ab96-538d-4ea6-d110-08da06ac531d
x-ms-traffictypediagnostic:
	DB7PR08MB3644:EE_|DB5EUR03FT034:EE_|PAXPR08MB7122:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7122E00562AA10D950A4D6DAE4109@PAXPR08MB7122.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eD4cZaABiDa0X37EDf7QAxFpwtnJuYaoznwYS6sIyXT5KwXwWmFiRpQd9UWhy62SSDbR6skphmBiXg8hfDQn0bWHJ3YRmlNfAJgPudd74VrwVcE885+lOl4904ZUj5PE5yiVTRtPXal7ZVzmkikAqhLDs2ayc3b/XcRhMFEJMrQLrfyGtbt1U/uLxjdnZ2r/6t3r9vDDRlTgjUXPd/fnn8hsiT53/dBsNCPtr/njS5azx3NGQgX+PslYw6QcpZ1sb+UKQv5h1znOcfBgQikdt49JZTC41sMiyd0fZMrvFlXPrQMaWUNhnwyMazJc/g/P0rkSYWisgY4OqAInvF8yM+O3LVOv8iR6jAyh3Qiuj7VfqU2g3ppYCAEH9McdsdlA7zEzo0yRo+/JnE5IWjhMwOoYbs65gHqQobLytfNHspPpVg8tlqUMXiOE8xsNjOl0qngAHVnvhQmeia5sxyN92hrPZB5wqK61+j8xvf4SCaZ7JAqNWOo9YnMafk/ueSwHG9YZswreBs0Qv26eMVaJsicbfrtO6MJrvtXl4seeslidnsHd5puGlC2xTWcvL05biE5OqGaBm55Z2ja2DDZZppPexTYLykzUaATxiCtO+urfC2LOkdckQ/hDrue6fcFrGg0+6EZvxk6z728IzT/3lfLOMZC+wfHaWMS8zIiPHwep+UOGg68IC6bSRGSB9Q5hPFUhMSTSlxBv2BnFPW3ARVFfs5ficvQAdnU99eC4MeWeBgpiuCHnRtVKu6czvZQ6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(2906002)(66946007)(64756008)(66446008)(76116006)(66556008)(91956017)(4326008)(8676002)(33656002)(8936002)(5660300002)(36756003)(54906003)(6916009)(316002)(26005)(508600001)(71200400001)(2616005)(186003)(38070700005)(38100700002)(122000001)(86362001)(6486002)(53546011)(6506007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <534C7C39CBD5EC43801B01096D9A7A3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3644
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c6e06a6-75ae-49eb-1650-08da06ac460a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UUVpZIt4RVwaimf2vRAnEFohMkFN5EhCi2KbFc435e/K5Iwa/YKf35lbUg0VvhtLFkAwtl6odVVL1pZGqvZwBtBphM9LaHNz9PZfA5roNY0dw2SPdGtdKfJEBOtg6OPPzYfBBNUt0KHScJB0mdu0k98uX3ryPtH+VxZv01GjWYyilJlUip9afQ2qmEBymC+RGKF2bu+40hASWQLuZujkPLtHhWspyQQcBsB5TE/bkO7Out7zvTiLbXCRTzURq6ySnyk1H0lfpeBNNn2KTQFborxUkeSO4Uk3mJ+CI298j34RHr/rCflCUxVOM+BFVBlzbBuJrkvWNfd6xlizrkLpOo4HXKDO/75rgNW/oSg3ECLVycz4P+5xpOFXApuPQrexVj0F3vQ+9y5I+n4QJabORgaA6i7jGL5PRXZZw9ml3U0ejEKYqYYpU0TwhuxKMT325fW2X9gHfglBxFw3zlQSBsbl7SYT/cj0Pmp8GTFmTvvSBvPyOL8dl5uipYnwhwAD0HXDQLqCUsyXN9vGNdIDeNBm4HV26p71pzG4ihw4b+7MF3SwJYLoRlWqVYHr5+0dVoziOml9kEXNVhMfBsa5HosNKJEy9P1sd3w8Fz0rDEclkG3Qp1CtWgi8IYN9aAaCJ2ldGd8JYhhFV0fue7v8BvBZZfdHzRhHsxxp1RRSmYjcrQVgh/t27f7aMicgOZhK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8676002)(70206006)(2616005)(70586007)(6862004)(40460700003)(4326008)(33656002)(36860700001)(336012)(5660300002)(26005)(186003)(82310400004)(86362001)(6512007)(508600001)(6506007)(53546011)(2906002)(6486002)(356005)(8936002)(81166007)(54906003)(316002)(47076005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 17:50:42.4794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f0ab96-538d-4ea6-d110-08da06ac531d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7122

DQoNCj4gT24gMTUgTWFyIDIwMjIsIGF0IDE3OjQ1LCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDEwLzAzLzIwMjIgMTc6MTAsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gaW5kZXggMTBlYTk2OWM3YWY5Li40N2ZjODU2
ZTBmZTAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4+IEBAIC0xMTQ1LDYgKzExNDUsMjIgQEAgaW50IGNw
dXBvb2xfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpOw0K
Pj4gaW50IGNwdXBvb2xfZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3RsX2NwdXBvb2xfb3AgKm9w
KTsNCj4+IHVuc2lnbmVkIGludCBjcHVwb29sX2dldF9pZChjb25zdCBzdHJ1Y3QgZG9tYWluICpk
KTsNCj4+IGNvbnN0IGNwdW1hc2tfdCAqY3B1cG9vbF92YWxpZF9jcHVzKGNvbnN0IHN0cnVjdCBj
cHVwb29sICpwb29sKTsNCj4+ICsNCj4+ICsvKg0KPj4gKyAqIGNwdXBvb2xfY3JlYXRlX3Bvb2wg
LSBDcmVhdGVzIGEgY3B1cG9vbA0KPj4gKyAqIEBwb29sX2lkOiBpZCBvZiB0aGUgcG9vbCB0byBi
ZSBjcmVhdGVkDQo+PiArICogQHNjaGVkX2lkOiBpZCBvZiB0aGUgc2NoZWR1bGVyIHRvIGJlIHVz
ZWQgZm9yIHRoZSBwb29sDQo+PiArICoNCj4+ICsgKiBDcmVhdGVzIGEgY3B1cG9vbCB3aXRoIHBv
b2xfaWQgaWQuDQo+PiArICogVGhlIHNjaGVkX2lkIHBhcmFtZXRlciBpZGVudGlmaWVzIHRoZSBz
Y2hlZHVsZXIgdG8gYmUgdXNlZCwgaWYgaXQgaXMNCj4+ICsgKiBuZWdhdGl2ZSwgdGhlIGRlZmF1
bHQgc2NoZWR1bGVyIG9mIFhlbiB3aWxsIGJlIHVzZWQuDQo+PiArICoNCj4+ICsgKiByZXR1cm5z
Og0KPj4gKyAqICAgICBwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgY3B1cG9vbCBqdXN0IGNyZWF0ZWQs
IG9uIHN1Y2Nlc3MNCj4+ICsgKiAgICAgTlVMTCwgb24gY3B1cG9vbCBjcmVhdGlvbiBlcnJvcg0K
PiANCj4gV2hhdCBtYWtlcyB5b3Ugc2F5IHRoaXM/ICBZb3VyIG5ldyBmdW5jdGlvbiB3aWxsIGZh
bGwgb3ZlciBhIE5VTEwNCj4gcG9pbnRlciBiZWZvcmUgaXQgcmV0dXJucyBvbmUuLi4NCg0KWW91
IGFyZSByaWdodCwgaXTigJlzIGEgbGVmdG92ZXIgZnJvbSB0aGUgdjEsIEkgd2lsbCBjaGFuZ2Ug
aXQgYW5kIHJldmlldyB0aGUgY29kZSB0aGF0IHVzZXMgaXQuDQoNCkNoZWVycywNCkx1Y2ENCg0K
PiANCj4gfkFuZHJldw0KDQo=

