Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72666635114
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 08:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447405.703584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxkAK-0005mp-2W; Wed, 23 Nov 2022 07:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447405.703584; Wed, 23 Nov 2022 07:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxkAJ-0005ju-VT; Wed, 23 Nov 2022 07:27:27 +0000
Received: by outflank-mailman (input) for mailman id 447405;
 Wed, 23 Nov 2022 07:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+QIV=3X=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1oxkAI-0005jn-AG
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 07:27:26 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe12::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40555093-6b00-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 08:27:15 +0100 (CET)
Received: from DU2P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::30)
 by GV2PR08MB8148.eurprd08.prod.outlook.com (2603:10a6:150:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 07:27:18 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::62) by DU2P250CA0025.outlook.office365.com
 (2603:10a6:10:231::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 07:27:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Wed, 23 Nov 2022 07:27:17 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 23 Nov 2022 07:27:17 +0000
Received: from 6500040f88f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7960AD56-FE10-46B7-A5C1-DA793BF8FC1A.1; 
 Wed, 23 Nov 2022 07:27:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6500040f88f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Nov 2022 07:27:08 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AS8PR08MB10292.eurprd08.prod.outlook.com (2603:10a6:20b:62b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 07:27:04 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 07:27:03 +0000
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
X-Inumbo-ID: 40555093-6b00-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BimJQePf3eVGzfssfB7Y9ChTj0UKbB4iMTBhJnR9dQ=;
 b=i7i6P7/HFpR54HJ7L0/hweV/j0ybLZez9/ZGfrTuwS60yv35SY6aNGVvqrcMIbzYLQp9H/wjnadfjbqLJLFkcZlz2uLxVqMiA/ZqALHfRxC45UWF6V4137mIIJnb8S7atq3zMc/B45n+lbsxhsa+6ToWcj7sZngpZM+LteRggik=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbjEw6FWO6i/vpVyekCNwV4M6F5QZGp99mIR+Xh6wJPuOxB/Np+t1hRYNIwB7rjdR9UrrW6Fb385LRT4keM/+2ZBjTLTrFOTJQzwjEsu6WJyt92RAsGxqgdxBk04ljxYLB86QZnHEXmbfuL6soE1Z8VQlYi1Cl7o2OTK2JIQPpULk0Vutf0zTa/djIlDrZZ2UCFFJxOY0vTrk73Y35slwmUmrdbnPy5wAsoHa7rxhy2WZZ/6qxZ7EbbrmrqQGIS1QbZdIKKsqzakEvaSydxPzI0qBgc8Czhd6shGO94lx4J2Enj14N4khh7IiQ5JgDYsgYF33jmFuDRV7zkEOOGicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BimJQePf3eVGzfssfB7Y9ChTj0UKbB4iMTBhJnR9dQ=;
 b=QBB7TabZg2m/HLtT+7bz4by3CiTAPbZqBozj7Ba4BddlU9mRMNXk5N51b4qJh0MfC0elXkyDCm1nYjHipKpatlb11JzqHerVDZYeirl9jRJLCiPqsoQDUc2kQmtPwjfgyXSEZX7OfNLGm300sraWpEIYAqfGKTIZF3YPbFs3a67wFDb/7Kdp2IlGcA23+0xdf/M7/5Hn9ThCFhE3KUcRks7ZoKA2Sv18LX9BR6CyCtpF1l9lQ9auYnnXsMSom0jLQSMx9IQLz7+eRVVEZjHq4IGoGzuHxthSW1powzsnSHT8Z1J6yH8GOREwxrXvmbaBiUfl28W8UjAW6YuaU2IW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BimJQePf3eVGzfssfB7Y9ChTj0UKbB4iMTBhJnR9dQ=;
 b=i7i6P7/HFpR54HJ7L0/hweV/j0ybLZez9/ZGfrTuwS60yv35SY6aNGVvqrcMIbzYLQp9H/wjnadfjbqLJLFkcZlz2uLxVqMiA/ZqALHfRxC45UWF6V4137mIIJnb8S7atq3zMc/B45n+lbsxhsa+6ToWcj7sZngpZM+LteRggik=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Topic: [PATCH v2] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Index: AQHY/jYHhVkwya4U7kGFhTN8kPwCjK5K3q+AgAE9aTA=
Date: Wed, 23 Nov 2022 07:27:02 +0000
Message-ID:
 <AS8PR08MB7696236C65FF8A9A0C75BA97920C9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20221122054644.1092173-1-jiamei.xie@arm.com>
 <a38b9ebf-c5da-8648-183d-eb5fbb5b22f3@xen.org>
In-Reply-To: <a38b9ebf-c5da-8648-183d-eb5fbb5b22f3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 30B8778578721D48B34605AD68019380.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|AS8PR08MB10292:EE_|DBAEUR03FT014:EE_|GV2PR08MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaf8958-7585-42dd-4e14-08dacd242687
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wSk2xspo2Qdde++EIOClWgGQzEfH77mFSIo4aAgCIl6bEqO655gDqQnp9qSAiqk8jOoO07Q6arJHBuN/P9gOdFqXnIbzuKowCxwXRfsUKXu1HaK++zx/wvcwzRFy8lj6fpgvqN7j7u/D0lz60pSOiiifRMC7osFllWXk4KWn15it1NBcYnCYfNY0c1DIRuz6AWaq/Yx3Luo5U57XtyMuekd/ePuXKEHdtEKUGYAMscRiBKo7UOAriczvykxJRm4r/sxgcy6xo0/HRdy0Z1877U1DupJ447rOFbM0trHa7IIVONQPXKGkqTMoT3FIlCHCTIhkSb+mplDiV520UyiLNJZHfaQqI60HStq/68KypktTp8lWDnmfYbXDjKy+0L7RmMUwrPfKaUC7i4r7rBEO7na9e3mFg4wsS850jB1h5/HWxdmXD0uRF5wEWOn/e7TtsBvpFhJF9egmpHqObtKbD+2g+IrLJzW13WRwlLdNfX60oQG2CVrtg56dcJ9X97JNS/2rSvnthxDE1gYB0XYNoxENJz5A6mml9+3FoWBelyUWSRQsEJUWCb+woaGqg2wj/mqgM9jsxvfnHTbu7fGRDWzwfYbmSWlRF83Vtz9s0yElIyLiWnYhVEeI3pLf7vHGImTT+0+sYINILjx4g8crrOvjIAiBqoktivd83LcVMYPNr13LQ6D/ZOdH0OKVetPUq5ixMvE9ha4gzU+5bYdXvIeLCcK4V85Xj/iKVMuwgIqs3WYtgpeF67eIQfuj8GPF33pLsPRNzMjrgf02Jns0OQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199015)(41300700001)(5660300002)(8936002)(52536014)(33656002)(316002)(54906003)(110136005)(86362001)(66946007)(76116006)(2906002)(64756008)(4326008)(66476007)(66446008)(66556008)(8676002)(55016003)(71200400001)(478600001)(38070700005)(122000001)(38100700002)(6506007)(53546011)(7696005)(26005)(9686003)(83380400001)(966005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10292
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82b554d0-2242-4579-c7b6-08dacd241dd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XTpc1V2p9UJnLRsrnFQxWfPDjVNsdZFh77Tm5nyjEI/x1vC2DHOwASKrtE48GeBY7vOI54tBByvMWwSPIAC/atUH4o0hkoGYdxZd5WylC19/vkaD6p0p9mG/yPyW5IY5VvBAAGwiEyr7Nz4oB18fk0TbTytewe+iMWSoJkv1BodaRdE7tT/93d6xg+j7qm2SczlskJDZZmKisG2tm7vhr07aRN1OlwdtYzY4701KclNklP1BaM8GErSYdGrmkfyPdwa0w19uy5Cm6AXjFE+A81FVyB/ydT76PhHFnqUT6xyPXeDN4OKd2tGAL0LQwT9fPgMihQzbaEiGYNbgmJVVlxBCbaWQ65jYu7dLGDeH5tXoetYoDaMKrvxw/J3bwIuJ2BQCRqX+QPG+UpqXEdOwstnIVYtGoWdsgP4/kegO6GK/gcE/1YUllswWq92jEjhsYJRuRADD5MPONXUR40guJKewzEwq+KI1EpsF/G4InyGZ5wO8ZqHMUYnA3T7jupfXyf1z02x3L0saMx9twO5dqbDo1+qTFaYHtCbBderZrK8rPFrKcVgvTDMaCTplC4zr9VFLd3XUMsRjbhuwcXvUaOfNTcX0bk3D6EKMkeONDf1uBIPjorsaq4xDmRqq88VR+p+wZ5UTi5CWHHYgHydXOonFyJG5WnRZIz7y0MpgZlFxhOEPrflneApIiGrp8kLsKnxZOwmnj7PWTAjmB8t4wUAO1jk+cvCOS6gm7mHM1m+lUqK4Hp7qT6WiJnzzJU37lTbjq7u+2/QaKGE3tbFp+A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(8936002)(4326008)(5660300002)(316002)(54906003)(70206006)(70586007)(8676002)(52536014)(478600001)(336012)(107886003)(53546011)(966005)(7696005)(9686003)(6506007)(110136005)(186003)(26005)(47076005)(36860700001)(82310400005)(2906002)(40460700003)(40480700001)(81166007)(83380400001)(86362001)(82740400003)(33656002)(55016003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 07:27:17.5264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaf8958-7585-42dd-4e14-08dacd242687
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8148

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDIyLCAy
MDIyIDg6MjYgUE0NCj4gVG86IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djJdIHhlbi9hcm06IHZwbDAxMTogTWFrZSBhY2Nlc3MgdG8gRE1BQ1Igd3JpdGUtDQo+IGlnbm9y
ZQ0KPiANCj4gSGksDQo+IA0KPiBPbiAyMi8xMS8yMDIyIDA1OjQ2LCBKaWFtZWkgWGllIHdyb3Rl
Og0KPiA+IFdoZW4gdGhlIGd1ZXN0IGtlcm5lbCBlbmFibGVzIERNQSBlbmdpbmUgd2l0aA0KPiAi
Q09ORklHX0RNQV9FTkdJTkU9eSIsDQo+ID4gTGludXggU0JTQSBQTDAxMSBkcml2ZXIgd2lsbCBh
Y2Nlc3MgUEwwMTEgRE1BQ1IgcmVnaXN0ZXIgaW4gc29tZQ0KPiA+IGZ1bmN0aW9ucy4gQXMgY2hh
cHRlciAiQiBHZW5lcmljIFVBUlQiIGluICJBUk0gU2VydmVyIEJhc2UgU3lzdGVtDQo+ID4gQXJj
aGl0ZWN0dXJlIlsxXSBkb2N1bWVudGF0aW9uIGRlc2NyaWJlcywgU0JTQSBVQVJUIGRvZXNuJ3Qg
c3VwcG9ydA0KPiA+IERNQS4gSW4gY3VycmVudCBjb2RlLCB3aGVuIHRoZSBrZXJuZWwgdHJpZXMg
dG8gYWNjZXNzIERNQUNSIHJlZ2lzdGVyLA0KPiA+IFhlbiB3aWxsIGluamVjdCBhIGRhdGEgYWJv
cnQ6DQo+ID4gVW5oYW5kbGVkIGZhdWx0IGF0IDB4ZmZmZmZmYzAwOTQ0ZDA0OA0KPiA+IE1lbSBh
Ym9ydCBpbmZvOg0KPiA+ICAgIEVTUiA9IDB4OTYwMDAwMDANCj4gPiAgICBFQyA9IDB4MjU6IERB
QlQgKGN1cnJlbnQgRUwpLCBJTCA9IDMyIGJpdHMNCj4gPiAgICBTRVQgPSAwLCBGblYgPSAwDQo+
ID4gICAgRUEgPSAwLCBTMVBUVyA9IDANCj4gPiAgICBGU0MgPSAweDAwOiB0dGJyIGFkZHJlc3Mg
c2l6ZSBmYXVsdA0KPiA+IERhdGEgYWJvcnQgaW5mbzoNCj4gPiAgICBJU1YgPSAwLCBJU1MgPSAw
eDAwMDAwMDAwDQo+ID4gICAgQ00gPSAwLCBXblIgPSAwDQo+ID4gc3dhcHBlciBwZ3RhYmxlOiA0
ayBwYWdlcywgMzktYml0IFZBcywgcGdkcD0wMDAwMDAwMDIwZTJlMDAwDQo+ID4gW2ZmZmZmZmMw
MDk0NGQwNDhdIHBnZD0xMDAwMDAwMDNmZmZmODAzLCBwNGQ9MTAwMDAwMDAzZmZmZjgwMywNCj4g
cHVkPTEwMDAwMDAwM2ZmZmY4MDMsIHBtZD0xMDAwMDAwMDNmZmZhODAzLCBwdGU9MDA2ODAwMDA5
YzA5MGYxMw0KPiA+IEludGVybmFsIGVycm9yOiB0dGJyIGFkZHJlc3Mgc2l6ZSBmYXVsdDogOTYw
MDAwMDAgWyMxXSBQUkVFTVBUIFNNUA0KPiA+IC4uLg0KPiA+IENhbGwgdHJhY2U6DQo+ID4gICBw
bDAxMV9zdG9wX3J4KzB4NzAvMHg4MA0KPiA+ICAgdHR5X3BvcnRfc2h1dGRvd24rMHg3Yy8weGI0
DQo+ID4gICB0dHlfcG9ydF9jbG9zZSsweDYwLzB4Y2MNCj4gPiAgIHVhcnRfY2xvc2UrMHgzNC8w
eDhjDQo+ID4gICB0dHlfcmVsZWFzZSsweDE0NC8weDRjMA0KPiA+ICAgX19mcHV0KzB4NzgvMHgy
MjANCj4gPiAgIF9fX19mcHV0KzB4MWMvMHgzMA0KPiA+ICAgdGFza193b3JrX3J1bisweDg4LzB4
YzANCj4gPiAgIGRvX25vdGlmeV9yZXN1bWUrMHg4ZDAvMHgxMjNjDQo+ID4gICBlbDBfc3ZjKzB4
YTgvMHhjMA0KPiA+ICAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHhhNC8weDEzMA0KPiA+ICAgZWww
dF82NF9zeW5jKzB4MWEwLzB4MWE0DQo+ID4gQ29kZTogYjkwMDAwODMgYjkwMWYwMDEgNzk0MDM4
YTAgOGIwMDAwNDIgKGI5MDAwMDQxKQ0KPiA+IC0tLVsgZW5kIHRyYWNlIDgzZGQ5M2RmMTVjMzIx
NmYgXS0tLQ0KPiA+IG5vdGU6IGJvb3Rsb2dkWzEzMl0gZXhpdGVkIHdpdGggcHJlZW1wdF9jb3Vu
dCAxDQo+ID4gL2V0Yy9yY1MuZC9TMDdib290bG9nZDogbGluZSA0NzogMTMyIFNlZ21lbnRhdGlv
biBmYXVsdCBzdGFydC1zdG9wLQ0KPiBkYWVtb24NCj4gPg0KPiA+IEFzIGRpc2N1c3NlZCBpbiBb
Ml0sIHRoaXMgY29tbWl0IG1ha2VzIHRoZSBhY2Nlc3MgdG8gRE1BQ1IgcmVnaXN0ZXINCj4gPiB3
cml0ZS1pZ25vcmUgYXMgYW4gaW1wcm92ZW1lbnQuDQo+IA0KPiBEaWRuJ3Qgd2UgYWdyZWUgdG8g
ZW11bGF0ZSBhbGwgbm9uLVNCU0EgcmVnaXN0ZXJzIGFzIFdJPyBJT1csIHRoZQ0KPiBkZWZhdWx0
IGNhc2Ugc2hvdWxkIGNvbnRhaW4gYSAnZ290byB3cml0ZV9pZ25vcmUnIHJhdGhlciByZXR1cm4g
MC4NCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4gIEknbGwgIGVtdWxhdGUgYWxsIG5vbi1TQlNB
IHJlZ2lzdGVycyBhcyBXSSBpbiBwYXRjaCB2My4NCg0KPiANCj4gPg0KPiA+IFsxXSBodHRwczov
L2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGVuMDA5NC9jLz9sYW5nPWVuDQo+ID4g
WzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi0NCj4gZGV2ZWwvYWxwaW5lLkRFQi4yLjIy
LjM5NC4yMjExMTYxNTUyNDIwLjQwMjBAdWJ1bnR1LWxpbnV4LTIwLTA0LQ0KPiBkZXNrdG9wLw0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbWVpIFhpZSA8amlhbWVpLnhpZUBhcm0uY29tPg0K
PiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL3ZwbDAxMS5jIHwgNCArKysrDQo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3ZwbDAxMS5jIGIveGVuL2FyY2gvYXJtL3ZwbDAxMS5jDQo+ID4gaW5kZXggNDM1MjJk
NDhmZC4uZTk3ZmUzZWJlNyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMN
Cj4gPiArKysgYi94ZW4vYXJjaC9hcm0vdnBsMDExLmMNCj4gPiBAQCAtNDYzLDYgKzQ2MywxMCBA
QCBzdGF0aWMgaW50IHZwbDAxMV9tbWlvX3dyaXRlKHN0cnVjdCB2Y3B1ICp2LA0KPiA+ICAgICAg
IGNhc2UgRlI6DQo+ID4gICAgICAgY2FzZSBSSVM6DQo+ID4gICAgICAgY2FzZSBNSVM6DQo+ID4g
KyAgICBjYXNlIERNQUNSOg0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfR19ERUJVRw0KPiA+
ICsgICAgICAgICAgICAgICAidnBsMDExOiBXSSBvbiByZWdpc3RlciBvZmZzZXQgJSMwOHhcbiIs
DQo+ID4gKyAgICAgICAgICAgICAgIHZwbDAxMV9yZWcpOw0KPiANCj4gSU1ITywgdGhpcyBtZXNz
YWdlIHNob3VsZCBiZSBwcmludGVkIGp1c3QgYWZ0ZXIgdGhlIHdyaXRlX2lnbm9yZSBsYWJlbC4N
Cg0KSSdsbCBwdXQgaXQgYWZ0ZXIgdGhlIHdyaXRlX2lnbm9yZSBsYWJsZSBpbiBwYXRjaCB2My4N
Cg0KQmVzdCB3aXNoZXMNCkppYW1laSBYaWUNCg0KDQo+IA0KPiA+ICAgICAgICAgICBnb3RvIHdy
aXRlX2lnbm9yZTsNCj4gPg0KPiA+ICAgICAgIGNhc2UgSU1TQzoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

