Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9526828DF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:31:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487475.755113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmyW-0008Hi-H9; Tue, 31 Jan 2023 09:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487475.755113; Tue, 31 Jan 2023 09:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmyW-0008F7-EP; Tue, 31 Jan 2023 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 487475;
 Tue, 31 Jan 2023 09:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzvD=54=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMmyV-0008Ey-Dg
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:30:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef5a4890-a149-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 10:30:44 +0100 (CET)
Received: from DB6PR07CA0074.eurprd07.prod.outlook.com (2603:10a6:6:2b::12) by
 AM0PR08MB5297.eurprd08.prod.outlook.com (2603:10a6:208:18a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:30:42 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::6f) by DB6PR07CA0074.outlook.office365.com
 (2603:10a6:6:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.20 via Frontend
 Transport; Tue, 31 Jan 2023 09:30:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36 via Frontend Transport; Tue, 31 Jan 2023 09:30:41 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 31 Jan 2023 09:30:41 +0000
Received: from 814e91673b6e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9696D683-772A-4C99-A1CF-1E3E841C3F72.1; 
 Tue, 31 Jan 2023 09:30:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 814e91673b6e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Jan 2023 09:30:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8393.eurprd08.prod.outlook.com (2603:10a6:20b:569::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:30:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.033; Tue, 31 Jan 2023
 09:30:33 +0000
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
X-Inumbo-ID: ef5a4890-a149-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLhtKl+Utw5UAEC1Dx7Msd4JVJQ8kROlz7KpHGW8NHU=;
 b=tk55W9OzcV6NCFRq/d8ZfdX5+/O+XAk4DZtSNVEHX3euyZ832WPrmBq9v1Nn3roLBn8js9xpkFQrbJslEATqIUoaKBYEBGsL7IWVFxcmBUKZJMKRbibDrbJbU2d522uit2fgPegivxKGFnRDni3gV5lY8VbAu2d88DlcIpaD4eQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpqidlYKOr94impxdC+xv8f2j6lrpLjOBXDRPEN64D/aj9gcjItti4PgnpJ5GSLj3R9rGuIP4+1qflYUYG42uQTpWnW/8MRRQUXea20k2pFu4+YkEPwtvOhS2hZlmqVsThu7GZzLlXd15OOZI6YROf7YZBZG+eJy+GAx7cm6zHkk6ReU344Agwyt78bYAllWmoVpoW/bJCnqyizoqPRfaskzkc6nQeGMTlvuuYGH0yejpCmC5YJuNbHkfrwQr+T7rUEuVakxCTcS3km+Z8ytumMa/7Lywv0vOX5BKw8pW89MGKaCgWUSzzrbXAiSMgp2Cvc27Gkocea4r5Dw6GVjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLhtKl+Utw5UAEC1Dx7Msd4JVJQ8kROlz7KpHGW8NHU=;
 b=cZsl6eZC05gcEkaJDx1+C4Bmvgz9CLGIdzJl0OU/lrYaPiFgXNa1DiIBLn0th8HJcAQLufTe+O74t7+9aHtJzWv/dYseH/4vx9zCTSDHV29ehOESm53pm5BSeQwoLCxfO/Rwu5RJaDWcqdcc3muD5PuRtOzqSvV5U7YD0FVExEA2ZQtNrOsidnxJPWFKbV0fWUP6F9cp7eQd9hm2MNFzGD87wWGE+S0cWXr9dSCfkgiIkAKSAB/1N158IqooMUEn/EkWYMHgXL6xMyIEom/8/1Fo0iT2S5R4K9synPEiOw/uTsf92x59ts9yAXVksoC39sTXFclPyUOPIRUwndTIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLhtKl+Utw5UAEC1Dx7Msd4JVJQ8kROlz7KpHGW8NHU=;
 b=tk55W9OzcV6NCFRq/d8ZfdX5+/O+XAk4DZtSNVEHX3euyZ832WPrmBq9v1Nn3roLBn8js9xpkFQrbJslEATqIUoaKBYEBGsL7IWVFxcmBUKZJMKRbibDrbJbU2d522uit2fgPegivxKGFnRDni3gV5lY8VbAu2d88DlcIpaD4eQ=
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
Thread-Index: AQHZNGA1IwnnIsRmjEGECQ4jTGRpG663gnMAgAA6SvCAAISzAIAAAKDw
Date: Tue, 31 Jan 2023 09:30:33 +0000
Message-ID:
 <AS8PR08MB799131C4BA5A3C5A33A0CD8D92D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
 <20230130040535.188236-2-Henry.Wang@arm.com>
 <fca91d3c-5d8a-3f7e-419a-a4c5208273dc@xen.org>
 <AS8PR08MB79910D7E3C7F32D8CDCB851092D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ffa2c5e3-9dcb-eca1-fe3f-6ad4c7c83bae@xen.org>
In-Reply-To: <ffa2c5e3-9dcb-eca1-fe3f-6ad4c7c83bae@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C16B78551AD1024BA44A40369D0BE28F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8393:EE_|DBAEUR03FT038:EE_|AM0PR08MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: a877b8b0-af61-4e7c-4689-08db036dd257
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EZ7jkKDBPbzDiTNyUEKBBkpTC4pUTCxC0a8uEU4d/vfYyubm+uYnKIpabhQoqpp72gRCvAngmGkFHnk0664RANUbeqPedHvAYk9/3Y3bNwKoqOjuqunXYyonCr7O37aBnziZNNFPAZFa8rzMsi/aTCaECCV1tD7ZvinLTe7grEU8dBz2mhbfNbcS7gI29u1oc567CmAgeIrnjUmWiIj4ORD3IzyLg1Uw9E4ywJ5+4IP7Q1Jw7wWf8TXIOt4ChvRL5NKAQmDcBqsYB1KKyIRR6S62ZxIaeXNiWQ7BEdWIWf/ql7/yeTwAI/Tb43tPrmBL3JcMRa7vq9XiexlcybnScYqLRy0VvRXNuiRWFxfBXnlMDQED0z7kg0zUWYcAfb6z96qAAxpG0pP3OYDKCoACNEv8/gEXAfxhk2dmGk9LLi0RTYJ9VysHDxunkSuWVAy7crWQnc7UqNl4IENoAqiwQRo8LuadEehjKOOXbGzlUs7/H2xKJqNJLSqeyD4+WPsuxem6yrm3pSH8boeDE38GD0ar3xpoAylPSCQTTzRsDSRJZHUuu0enrkO16pwfuypHSxKKDcEyzKpARxr4IUi8mEvelFSwDCNnMpKemluw3/70Ia5uqgKJNckYAz7uXhI7g96nnZJCGGkbld1NwHZldOUVJv1lQFzWsNvNvbrsPOvzVusk2bpi3e4WD+keZKFMjofRKvUtWg7HH0jH7rt73w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199018)(83380400001)(54906003)(110136005)(316002)(52536014)(8936002)(41300700001)(66946007)(66476007)(66446008)(64756008)(4326008)(8676002)(66556008)(76116006)(6506007)(26005)(186003)(478600001)(7696005)(9686003)(71200400001)(86362001)(38070700005)(33656002)(55016003)(5660300002)(4744005)(2906002)(122000001)(38100700002)(66899018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3991fe2-9ebe-40c8-4833-08db036dcd86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/xk+xMtXfWqlqETttEEgktXBE4F3FIZKG33g2Zj92VNReS81/+icfldt8i9bJQyib2cAXrIdOhMpgr75IqUBYLTaaToz7WOSnzdMuT2rBAdXgret8NfKMDPO27iNsmDag9NaC/KnG6YOD7FCld6mvG9GSytxylLXxDO/z6HXhlHZqU8QUtpztylk1XR2xlY0czWkhS/W5HpPYWsVZvPEXYS5/K8I+C124zYBG8n5/xOx/3xAzuzSCRea2ENi+Ld3QwHFn9Hhcz1hbrJx4s90QuLkcqJFljYWjqjJJ+z6iHsOz/den8zOcO687z1sFl0ZZXDiiWmkRqxHWbg1bllGNPiRgXBpes9HWpXK5DVdP7NeeE1lTXV4qgxO3bOxCvFkoZVw8dluqDLRH9qve+3tpBEqREQ3pXkVaS1H7aiZjvi7c/MdQyzd5JymylkmU5BLieOSMBv4E6FJ13mDglZhNC6OZga4vb45NyQ2Hgh5Dh9904/9SHSmxnAjOLZuF5W75deASuYfnp3ZXUnhyyuGyZ1vrZ76jYStpiVlgT4gYnsFBQaXNOE24x/FPId36tZba0Npme6nzsQv8Yf4ZVd31/bmjIkAyDsqL0zy/i8OcEyElAtwxnLqTIOpjKQBEAYzPl19OvTmuwTURweiQOX5bmrTx1629lI2EXzjtF/aDtZVpVEhw8FbbOTQ4NTmwtlnMtCXwZmO9wkupqzrX47Qg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199018)(46966006)(36840700001)(40470700004)(7696005)(26005)(41300700001)(66899018)(478600001)(186003)(336012)(9686003)(107886003)(6506007)(54906003)(110136005)(316002)(47076005)(70586007)(70206006)(4326008)(40460700003)(83380400001)(8676002)(2906002)(82740400003)(55016003)(5660300002)(8936002)(36860700001)(81166007)(82310400005)(86362001)(52536014)(33656002)(4744005)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:30:41.8310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a877b8b0-af61-4e7c-4689-08db036dd257
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5297

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8zXSB4
ZW4vYXJtOiBBZGQgbWVtb3J5IG92ZXJsYXAgY2hlY2sgZm9yDQo+IGJvb3RpbmZvLnJlc2VydmVk
X21lbQ0KPiA+IEkgd2lsbCBmaXggdGhpcyBwYXRjaCBhbmQgIzIgaW4gdjQuDQo+IA0KPiBJIGFt
IGhhcHB5IHRvIGRlYWwgd2l0aCBpdCBvbiBjb21taXQgaWYgeW91IHdhbnQuDQoNCkluY2x1ZGlu
ZyBhZGRpbmcgdGhlIGNvbW1lbnQgZm9yIGJvdGggcGF0Y2hlcz8gVGhpcyB3b3VsZCBiZSB3b25k
ZXJmdWwNCmFuZCB2ZXJ5IG5pY2Ugb2YgeW91IHRvIGRvIHRoYXQuIEJ1dCBpZiB5b3VyIHRpbWUg
aXMgbGltaXRlZCBJIGFtIGFsc28gbW9yZQ0KdGhhbiBoYXBweSB0byByZXNwaW4gdGhlIHBhdGNo
IChwcm9iYWJseSBldmVuIHdpdGggU3RlZmFubydzIFJldmlld2VkLWJ5DQp0YWcgaWYgaGUgaXMg
b2sgd2l0aCBpdCkgdG8gcmVkdWNlIHlvdXIgYnVyZGVuLiBUaGF0IHNhaWQsIGlmIEkgbmVlZCB0
byByZXNwaW4gdGhlDQpwYXRjaCwgaXQgd291bGQgYmUgZ29vZCB0byBnZXQgc29tZSBoaW50cyBh
Ym91dCB0aGUgd29yZGluZyBvZiB0aGUgY29tbWVudHMNCnRvIGF2b2lkIGFub3RoZXIgdisxIGp1
c3QgYmVjYXVzZSBvZiBteSBpbmFjY3VyYXRlIHdvcmRpbmcgOikgVGhhbmtzIHZlcnkNCm11Y2gh
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1
bGllbiBHcmFsbA0K

