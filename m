Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397754F9226
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 11:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301278.514124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncl5Z-0005Yh-Ol; Fri, 08 Apr 2022 09:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301278.514124; Fri, 08 Apr 2022 09:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncl5Z-0005Vv-LS; Fri, 08 Apr 2022 09:39:33 +0000
Received: by outflank-mailman (input) for mailman id 301278;
 Fri, 08 Apr 2022 09:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zQ4=US=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ncl5Y-0005Vp-05
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 09:39:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca2e1d38-b71f-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 11:39:30 +0200 (CEST)
Received: from DB6PR0301CA0060.eurprd03.prod.outlook.com (2603:10a6:4:54::28)
 by AM6PR08MB5254.eurprd08.prod.outlook.com (2603:10a6:20b:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 09:39:28 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::92) by DB6PR0301CA0060.outlook.office365.com
 (2603:10a6:4:54::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25 via Frontend
 Transport; Fri, 8 Apr 2022 09:39:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 09:39:27 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Fri, 08 Apr 2022 09:39:27 +0000
Received: from 1bae8742b400.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87678929-4FF7-4053-8AC6-6740EA48CC3F.1; 
 Fri, 08 Apr 2022 09:39:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1bae8742b400.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Apr 2022 09:39:16 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by VE1PR08MB5647.eurprd08.prod.outlook.com (2603:10a6:800:1b2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 09:39:13 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 09:39:13 +0000
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
X-Inumbo-ID: ca2e1d38-b71f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hpk+DkCtsLrRIBk7beMxpcNnE8UXtlXQ+7cDI+RfkFc=;
 b=NaP6x9dlbIP4AK6qmuwAnAoLX2bIZpzXUTckLDjj8lYiaJqwfDa1BWTMl9zXRWAT/ANCe9qX4Pd9ksn6KDVUfWE7glTc5gZuXNOe+UzPNEQ3/MS2s8bNTtoXhXt7RJ4rHs4vqOK9XDQZY4Au67liraKPO80ovSM7CP4sTW/BXdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d51174eacacd499
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4+7l25TNujyxCK7SC5oJPnNqfyFsfiatt/DDT3o1WKc8tl2cmG5eMfuYcF4xNtTm9IfC+aDjEGCbhSeyerNivBifisu+fzlahyvf97lZHxrrbIwdVDNI0Z2Tiyrq+fxCNBxlgmrwdrVNutO60iYuHMjIZ+l2/70URmH/PkiLlPsO34ot1p7L9SKHYwGLH+4YgiKhGnOF1cIlmNA/RJMkvY5EYB3/dj5ZH6SbV3dIK5iVsu3cJj37dQE7cOaibMJQ2SBRedPOq9YUmFAQvvDcdrOJf9/4Bn76sWU53BW7PB5Cd832Gk2tFIlqLMn6Hwo+1klbJBULnYTMNjB+AJ5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hpk+DkCtsLrRIBk7beMxpcNnE8UXtlXQ+7cDI+RfkFc=;
 b=gO2tGKJtoh5rOZ23im49wsLNkgZFy6szTG3NzWupoch6QssUArRO94lefg6NwfaEW9LVRiuyp2/y5CKIzxGVSLkyqfAqLropXHZyqL+eRxE+oMNS4v/oi7xZCrrjxfXmPIAMGMA+0pDPL7JeprIcIcDTp4t+ycvtT+2uEzXbJNLha+hBunyQD4e0X+/bb5ZSlX/XkHo+wXU/jdfPOO4n5pdkcpZxXxfkKCVkIW474fCNQYKwX9OFqN5LH64WUceCW/pbQcgP5OO3ffaJeoX2chgCc9khfBd36fIKqvpYRDVEz8PjZFsXsHTVOC7sXM++aPEU333QnegTe7G3xCUYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hpk+DkCtsLrRIBk7beMxpcNnE8UXtlXQ+7cDI+RfkFc=;
 b=NaP6x9dlbIP4AK6qmuwAnAoLX2bIZpzXUTckLDjj8lYiaJqwfDa1BWTMl9zXRWAT/ANCe9qX4Pd9ksn6KDVUfWE7glTc5gZuXNOe+UzPNEQ3/MS2s8bNTtoXhXt7RJ4rHs4vqOK9XDQZY4Au67liraKPO80ovSM7CP4sTW/BXdw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Topic: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Index: AQHYSyUS0CLVSvR2nk+ITbzc2Ry0wKzlusgAgAAH7oA=
Date: Fri, 8 Apr 2022 09:39:12 +0000
Message-ID: <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
In-Reply-To: <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bfafded5-d114-47f9-0911-08da1943ac6b
x-ms-traffictypediagnostic:
	VE1PR08MB5647:EE_|DB5EUR03FT037:EE_|AM6PR08MB5254:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB525465933BF5D70BC2B26E64E4E99@AM6PR08MB5254.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VrnJQYF3sjvbwaFR87h7uQ3jfv/lUKhOP7W6mT4uKvqK+ygZeBGB+2Od7N9q8/4+lo3PV5IQYEocyJflpWAhj7NvQa2XpsLIDynwpborMIHDA8rQjO2wp3UC5gPLbA0aM7D0X3CsOrUXg09cHCttG6PxxPsgB45eE998q0gpPEl7UWcr8cbYH12K33+efYo8JyJTfiFL4FSNnETkKok4t1e5VmkOvYx7QvJKRzDRzOoq7rSkafOYsYfOq7zB1HO5dQ/EfSq39BF10lym1cRbQqxllvM3Uyhhe4ReP9ao7j4RoMwPGir4bcfIQPh+0nc2P4nILXObNeyofVrbY7otZihF83/4/nDq/d4CPb+Ex7Z4v8bqk3O/KFiYP8bmM6ILiXz5msPUhEAPcpQL8xOvqfZnmzGDGUPW8TTfdL05szxvLiL/tNycSTwnrAcu19GK6JFMHX3gs6IGFlB+6kugFz2SMICbxJ4sy1ohDdkrBinyK2sDbCNNanIILZClLwrwGQKV8SAJZ1pn1kOICCTvFEpI8eX7IrYX15ZlpyMW0DxaFd8ueqdgv73ntIU4uoGYpY6i49wDPpSXP8eScKRMCqSe0T6ZP3WywrldEyAgQj/vpTIb6HOtr5F6WGLlcwAgmcSkgXo5UcKJ6DzekzORfuukyck+c+lve9RJBk3DlfqA18iHc849elQw4UD1Lgm1s9kwFI2Jvn8UYVrYwzjV1jyPoH6Vo38W0JGKFGe3lzjjZ9KVck21H6lYs7ZiJxXxTqTPXF9m/2pwtKmBZ1uGMw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(8676002)(4326008)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(508600001)(26005)(38100700002)(186003)(83380400001)(71200400001)(122000001)(6486002)(36756003)(6512007)(53546011)(33656002)(6506007)(6916009)(2906002)(54906003)(5660300002)(86362001)(66574015)(2616005)(8936002)(316002)(38070700005)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4427A46D02FB844BA11CB48FD78DACB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5647
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f618ba79-b340-4426-d68a-08da1943a409
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BJ3yzEKu1dF//BnfZNqcGa0v1LaxzVu02XlTlhG6z+ZpmTQeK6h46B6EUPb/gVyI8Gs8p27RiGw3GBzA/Ir8yLjrzshGTC6NXN9ocB0f/fcg8OIkzG2aGMw3Ynfia1XUmuODL6XObUxhPtdiv8o4+i7msgkuziq4Q3rqDG8xi6DZ3mMcIu1H0cRZspYNC9WSNtkGZOUYS7VG/P7wfsHV79a39isLsBYuH9eANFhzOyMAbFmpXg7P/MdU+fq4DVBk+mOzYWpH5m8mBQsFnzH++arER7Xttk1VsN3j0OhNB8UKLL1nWlxS1Wil3dP12d6Z0AK/+16kvzT6BsjlrzNh6m4ek1gZTSn8ZmxN3pHg4a7LMnr6V062xwFqgrzDXOl8o9PJ+zvcK8D7Dcj08o495Af2vqEQzas9Sg+Ji7VQWvYI8zMifFaWC/uVfN7eaA7eKnY9j2wAg0eeWFOo+niLe7ZzqmIpOR9QELsUFwh0Z6876Ss0p/c24hesmEbdUJWKK6WROtPLU881qD0IDgdt6BD/sRxl5gRkMw0wutU/V6CMTx5Fy1LdvNm9omSo3dKspaI5m2fkfYE1/Sw5tG73FfvedBFeFS1hxC8odyDdMc8W/hrcAadu0Vxn66STcqqf51T5PqZPlaYQUJ8hewVNNQ2oAr3FPZugeEkvSPdV5AeIj8/nzO8XD3PeT10uapRi3KYDF3SohrwBNhRRqIHLVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(316002)(36860700001)(5660300002)(336012)(6506007)(53546011)(2906002)(40460700003)(186003)(33656002)(26005)(2616005)(8676002)(6862004)(508600001)(36756003)(8936002)(4326008)(70586007)(70206006)(82310400005)(54906003)(66574015)(6486002)(47076005)(86362001)(81166007)(356005)(6512007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:39:27.2460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfafded5-d114-47f9-0911-08da1943ac6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5254

DQoNCj4gT24gOCBBcHIgMjAyMiwgYXQgMTA6MTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4wNC4yMDIyIDEwOjQ1LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gQEAgLTEwNiw2ICsxMDYsOCBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21h
aW4gew0KPj4gICAgIC8qIFBlci12Q1BVIGJ1ZmZlciBzaXplIGluIGJ5dGVzLiAgMCB0byBkaXNh
YmxlLiAqLw0KPj4gICAgIHVpbnQzMl90IHZtdHJhY2Vfc2l6ZTsNCj4+IA0KPj4gKyAgICB1aW50
MzJfdCBjcHVwb29sX2lkOw0KPiANCj4gVGhpcyBjb3VsZCBkbyB3aXRoIGEgY29tbWVudCBleHBs
YWluaW5nIGRlZmF1bHQgYmVoYXZpb3IuIEluIHBhcnRpY3VsYXINCj4gSSB3b25kZXIgd2hhdCAw
IG1lYW5zOiBMb29raW5nIGF0IGNwdXBvb2xfZGVzdHJveSgpIEkgY2FuJ3Qgc2VlIHRoYXQgaXQN
Cj4gd291bGQgYmUgaW1wb3NzaWJsZSB0byBkZWxldGUgcG9vbCAwIChidXQgdGhlcmUgbWF5IG9m
IGNvdXJzZSBiZQ0KPiByZWFzb25zIGVsc2V3aGVyZSwgZS5nLiBwcmV2ZW50aW5nIHBvb2wgMCB0
byBldmVyIGdvIGVtcHR5KSAtIErDvHJnZW4/DQo+IFlldCBpZiBwb29sIDAgY2FuIGJlIHJlbW92
ZWQsIHplcm8gYmVpbmcgcGFzc2VkIGluIGhlcmUgc2hvdWxkIGltbyBub3QNCj4gbGVhZCB0byBm
YWlsdXJlIG9mIFZNIGNyZWF0aW9uLiBPdG9oIEkgdW5kZXJzdGFuZCB0aGF0IHRoaXMgd291bGQN
Cj4gYWxyZWFkeSBoYXBwZW4gYWhlYWQgb2YgeW91ciBjaGFuZ2UsIHByZXZlbnRpbmcgb2Ygd2hp
Y2ggd291bGQNCj4gYXBwYXJlbnRseSBwb3NzaWJsZSBvbmx5IHZpYSBwYXNzaW5nIENQVVBPT0xJ
RF9OT05FIGhlcmUuDQoNCkhpIEphbiwNCg0KUG9vbC0wIGNhbuKAmXQgYmUgZW1wdGllZCBiZWNh
dXNlIERvbTAgaXMgc2l0dGluZyB0aGVyZSAodGhlIHBhdGNoIGlzIG1vZGlmeWluZw0KY3B1cG9v
bF9pZCBvbmx5IGZvciBEb21VcykuDQoNCkkgdGhvdWdodCB0aGUgbmFtZSB3YXMgc2VsZiBleHBs
YW5hdG9yeSwgYnV0IGlmIEkgaGF2ZSB0byBwdXQgYSBjb21tZW50LCB3b3VsZA0KSXQgd29yayBz
b21ldGhpbmcgbGlrZSB0aGF0Og0KDQovKiBDcHVwb29sIGlkIHdoZXJlIHRoZSBkb21haW4gd2ls
bCBiZSBhc3NpZ25lZCBvbiBjcmVhdGlvbiAqLw0KDQoNCj4gDQo+IEphbg0KPiANCg0K

