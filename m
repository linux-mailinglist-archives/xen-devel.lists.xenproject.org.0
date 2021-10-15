Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499A42F0F1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210465.367344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMKU-0006Sc-VJ; Fri, 15 Oct 2021 12:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210465.367344; Fri, 15 Oct 2021 12:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMKU-0006Q0-Rw; Fri, 15 Oct 2021 12:28:54 +0000
Received: by outflank-mailman (input) for mailman id 210465;
 Fri, 15 Oct 2021 12:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbMKT-0006Ps-I3
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:28:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::605])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a2d4ac7-f6e8-471e-8024-b9edcd07a1e4;
 Fri, 15 Oct 2021 12:28:52 +0000 (UTC)
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by AM0PR08MB3105.eurprd08.prod.outlook.com (2603:10a6:208:5f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 12:28:49 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::1d) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 12:28:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 12:28:49 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 15 Oct 2021 12:28:49 +0000
Received: from 9f45f0317120.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDF6E81D-F640-4A96-ADFA-3EF2B592CD72.1; 
 Fri, 15 Oct 2021 12:28:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f45f0317120.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 12:28:42 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0802MB2453.eurprd08.prod.outlook.com (2603:10a6:4:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 12:28:39 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 12:28:39 +0000
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
X-Inumbo-ID: 0a2d4ac7-f6e8-471e-8024-b9edcd07a1e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyLw0HBGfFyr4eksYhX7tavd7s7xp7G5Nb8Cm3HgPFo=;
 b=ihggpbbTtH5pxSRrnCBl9LKb3140UEjbPj4HQaW8jkC+iTJ4/3Kr7j9KI48kwTjZesQHmM0ROZecd1HiiGFHR4Ge8ecSkYIUt8vgkom513U50UPyH5Vr6f0OfpG7bZNe7wbhBgL8DGd1pOzYhQgC8+aimf5Imfnzb9N4IwtMmTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c8eb75a338cf270
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGfDq1RtsfmUhw9qflsYwRqeMVNDuxgPaJy5crFGRsmKk9Sgqc+uzIopZba40HfUe2MXb9nKfpWhBGRLP24RmJIBqcjxc3+zlpm2u+1sHYsU5Hr+/SGvXkGlghxbxWmG6nuPX9P6fPgXX8hGooaow6ixfdPKm6xL0C825B672/ZXpDkqTKJzPaB5Ax6beFsSkKjNb0CIQTBW53BSXl+1rDrBbevFGn1n4UCFvCxo+Xe3r24GohrtE5Gl3oo8+V/zQTzVnGCiR0Dxwx74jNJOVxKQtPmhxJ8XOfdDoaR86Pjg/PdJzLgd7abGEBAxdMaMCIZERnSu6z1cfivH/x7g6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyLw0HBGfFyr4eksYhX7tavd7s7xp7G5Nb8Cm3HgPFo=;
 b=Ra2rViAIks3Mgs//AV2r+H/fbGmSMPrOnFx+fVYghQRxGzEQkwk8luo0gIQn895kYtuv7HVK8cuQr3OUa6dWnEz7q7cl+sUdW5CnQVDgwFWgt7+g6prk1iNBgsNAYVvuUO1TYU6jpKocr3anG7hL68QRRUeHbvJboYcBhKsgNnwBPFawNhmNG7fySXNSnEbHEWXAQ5f1UBWyE9D6t7+zJBfqbJDFts+A7xS5/iLHBBUHMTR7SOxbmt0cFFe6AijYgFDq8FaJ4NCm9yPN+3/kYIqcSDslD4DLWmGbKTBT3RO233i3oRhFSlkseqbtorHiO8xV6vOZcBlvleCoykKvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyLw0HBGfFyr4eksYhX7tavd7s7xp7G5Nb8Cm3HgPFo=;
 b=ihggpbbTtH5pxSRrnCBl9LKb3140UEjbPj4HQaW8jkC+iTJ4/3Kr7j9KI48kwTjZesQHmM0ROZecd1HiiGFHR4Ge8ecSkYIUt8vgkom513U50UPyH5Vr6f0OfpG7bZNe7wbhBgL8DGd1pOzYhQgC8+aimf5Imfnzb9N4IwtMmTY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTs1WAgAAj+QCAAAF1gIAAAUmAgAAVT4CAAAqRAIAAAYUAgAAC1QA=
Date: Fri, 15 Oct 2021 12:28:38 +0000
Message-ID: <6C183E72-A9E8-4AB0-B6C4-C31E8AAFC4B6@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
 <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
 <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
 <A2AAD333-35A2-4250-891C-E8FB885D5660@arm.com>
 <887d99e8-bcc5-f854-ceed-a38701e1ad1d@suse.com>
In-Reply-To: <887d99e8-bcc5-f854-ceed-a38701e1ad1d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3af33216-ea10-4fd7-6f18-08d98fd7571c
x-ms-traffictypediagnostic: DB6PR0802MB2453:|AM0PR08MB3105:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3105A5D5F9C40BE31EF0BE5A9DB99@AM0PR08MB3105.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RMZO6SYS8YVDy3GexkBXDu5QMeQZvLYd1SN50BAg41Tdhlzfzr/dV+g3SW92lQ958GOejgRdy6xIR9+sqLrE2j9THEomUTN97/mG9OIdB0IkmwIuZCOhbjZJi3UdvHfh9Drhwj5MMbPDTQPdHXDXUOURRRyETVshlnxBUBN+HVJgEDu3APE+JPGxMsp0eShN+78EJQR1etqxZADT771imIlXYxUaraO6LexnmFj5vuvzk3B1hacc83cAs9gA2DCAS/L/CoiNoxjIBkdBFYVCzj0kGZcVhcM05HFjtxAVw7u//rkGCh9kkx1P6Y54MxfyVg/9Z66/DriWCOoehr+CBFjghvJEwedC1zeJBH9vHhFMR8HlpiLMOJHxPV0tFPoGv0qPjdDPYv6APqG/TGieO6OVrSY5jRENfHRSwh/ORr7oq3MGLrco5yWGIvNw8BkAXZ5efs71jf2JkGB/oeVcttHi7ufQ4+btXMvmYXEVddWTezc7yF7cfMDnrz603CnXNhRmrwZAq8BBC1tc9JGR4Ip9OkD6k4fVoL63uy6nFKho6/1ssKPn7E1YOaA5FpaCc/m6WV3TVTBBCHd1OrNVMUrY2tBZtAoNsOjB9dqs9esSYOQK8+gBC86tP/YeKXa6EDricQy0bPoQbWD1hb+GSKjDoKnNHcYfpM2AhE81Oez2Z+ItV4MTcrKc3FLr9pvIUeI2H7hM8AdHnBZV4gz2ssn9cdU/4bDl2vtFtNT01zArQkvoNFR/qjyaP8d6R0+nOYdmFHZcEiTqCkAcKE4Zljy8iuCIMGEQ2iNHIspTww0HkeO5i+17EXIuRQ2eNQ6Ufvc5eP7fpg5gEdn2QfVDpg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6916009)(26005)(66446008)(2906002)(71200400001)(66476007)(186003)(64756008)(66556008)(76116006)(966005)(2616005)(316002)(508600001)(91956017)(5660300002)(86362001)(7416002)(8936002)(6486002)(6512007)(4326008)(54906003)(8676002)(38070700005)(36756003)(53546011)(122000001)(38100700002)(6506007)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <02D619E56C9F1645A6A0D934367A86BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2453
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3d3cc8a-624b-4e40-a9f4-08d98fd75115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3KdL1y/rj99XGL8DrmPgYP7G0k+uPQsWcABUg7jNz+klgLgFuQQ8U5fomCDVybrqy+6XGnj7qJKVRdppvE0CONSkM2j4e/v+Vw5OJ84os3y0r0pJnh6NzntMOCMmtrV208mZ807lIZCt9VF0/u3a5kaRH5ai2V9hcIpg/qp0t//F2yVKyzkSHta66xlcll5zwI+zb9uj+nTofITLGczB7dEagFHNL6efC0kLv6LZqIF5lNFm3SImDJpOzMO4y8wy20PdTuVJ8UGfRZ6VZPnDFwF8az64AbkEVX37f8Lk5fnmnkkeHoGdnahuuggPX9SCu6huJjCOGtffLKJnGtTIS8PKRl6VztuEOHuz1pPEJbZE702Ol9/4G2RQ+OoMrO5jmyBl/g3frrtf7I7IfKVPFIF+6RQ/AdYGjH31S242PKkdSDzE+K1S+Pd6U2vB+R5WbdyzZ4gSWcEkFAERIQbZdw1cPb1nTnwyoParAADeKINXg2IwhbfLjcKWO6PpZ4AyrZR6XGJa58+2+61BoaPU3l8yXsuMj3pr9SlH+E5APDkGFU1E3B5d65vl92XPMMQzOJ48J56XiaWyFiF6pX3n0zBw+82tSIuP5nhY5jdaUJz7XAxvYsCqM/MNIgx4my6hRJbD8fGp4yktM0oDq9hfXgh05MAqnCQSG3GxtjKcv/9EGmiBf4pxwm5DQeZ6SUWaTJ5n3vfMq1dAUNpEnpvu1G3bNaAoBx3ZYpYMD9ksXvB3efAIkv4NuOW7WqFqXZlUTy5t3S6opSb5mgjVdK+lF6EfqzOZgD1hnNZtQaR30Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(70586007)(36756003)(6512007)(336012)(6862004)(70206006)(186003)(82310400003)(26005)(5660300002)(86362001)(2906002)(6486002)(356005)(47076005)(8676002)(53546011)(508600001)(36860700001)(316002)(83380400001)(6506007)(81166007)(966005)(2616005)(4326008)(33656002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 12:28:49.1757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af33216-ea10-4fd7-6f18-08d98fd7571c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3105

SGkgSmFuLA0KDQo+IE9uIDE1IE9jdCAyMDIxLCBhdCAxMzoxOCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LjEwLjIwMjEgMTQ6MTMsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBSb2dlciwNCj4+IA0KPj4+IE9uIDE1IE9jdCAyMDIxLCBh
dCAxMjozNSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0K
Pj4+IA0KPj4+IE9uIEZyaSwgT2N0IDE1LCAyMDIxIGF0IDEyOjE4OjU5UE0gKzAyMDAsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNS4xMC4yMDIxIDEyOjE0LCBJYW4gSmFja3NvbiB3cm90
ZToNCj4+Pj4+IEJlcnRyYW5kIE1hcnF1aXMgd3JpdGVzICgiUmU6IFtQQVRDSCB2NiAyLzNdIHhl
bi9hcm06IEVuYWJsZSB0aGUgZXhpc3RpbmcgeDg2IHZpcnR1YWwgUENJIHN1cHBvcnQgZm9yIEFS
TS4iKToNCj4+Pj4+Pj4gT24gMTUgT2N0IDIwMjEsIGF0IDA5OjAwLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+PiBUaGUgbGF0dGVyIGlzIGZpbmUgdG8gYmUg
cHV0IGhlcmUgKGkuZS4gRlRBT0QgSSdtIGZpbmUgd2l0aCBpdA0KPj4+Pj4+PiBzdGF5aW5nIGhl
cmUpLiBGb3IgdGhlIGZvcm1lciBJIGV2ZW4gcXVlc3Rpb24gaXRzIG9yaWdpbmFsIHBsYWNlbWVu
dA0KPj4+Pj4+PiBpbiBhc20teDg2L3BjaS5oOiBJdCdzIG5vdCBnZW5lcmFsbHkgY29ycmVjdCBh
cyBwZXIgdGhlIFBDSSBzcGVjLCBhcw0KPj4+Pj4+PiB0aGUgYnVzIHBvcnRpb24gb2YgdGhlIGFk
ZHJlc3MgY2FuIGJlIGFueXdoZXJlIGZyb20gMSB0byA4IGJpdHMuIEFuZA0KPj4+Pj4+PiBpbiBm
YWN0IHRoZXJlIGlzIGEgcmVhc29uIHdoeSB0aGlzIG1hY3JvIHdhcy9pcyB1c2VkIGluIG9ubHkg
YQ0KPj4+Pj4+PiBzaW5nbGUgcGxhY2UsIGJ1dCBub3QgZS5nLiBpbiB4ODYnZXMgaGFuZGxpbmcg
b2YgcGh5c2ljYWwgTUNGRy4gSXQNCj4+Pj4+Pj4gaXMgbWVyZWx5IGFuIGltcGxlbWVudGF0aW9u
IGNob2ljZSBpbiB2UENJIHRoYXQgdGhlIGVudGlyZSBzZWdtZW50IDANCj4+Pj4+Pj4gaGFzIGEg
bGluZWFyIGFkZHJlc3MgcmFuZ2UgY292ZXJpbmcgYWxsIDI1NiBidXNlcy4gSGVuY2UgSSB0aGlu
aw0KPj4+Pj4+PiB0aGlzIHdhbnRzIHRvIG1vdmUgdG8geGVuL3ZwY2kuaCBhbmQgdGhlbiBwZXJo
YXBzIGFsc28gYmUgbmFtZWQNCj4+Pj4+Pj4gVlBDSV9FQ0FNX0JERigpLg0KPj4+Pj4+IA0KPj4+
Pj4+IE9uIHByZXZpb3VzIHZlcnNpb24gaXQgd2FzIHJlcXVlc3QgdG8gcmVuYW1lZCB0aGlzIHRv
IEVDQU0gYW5kIGFncmVlZA0KPj4+Pj4+IHRvIHB1dCBpcyBoZXJlLiBOb3cgeW91IHdhbnQgbWUg
dG8gcmVuYW1lIGl0IHRvIFZQQ0kgYW5kIG1vdmUgaXQgYWdhaW4uDQo+Pj4+Pj4gSSB3b3VsZCBs
aWtlIHRvIGhhdmUgYSBjb25maXJtYXRpb24gdGhhdCB0aGlzIGlzIG9rIGFuZCB0aGUgZmluYWwg
bW92ZSBpZiBwb3NzaWJsZS4NCj4+Pj4+PiANCj4+Pj4+PiBAUm9nZXIgY2FuIHlvdSBjb25maXJt
IHRoaXMgaXMgd2hhdCBpcyB3YW50ZWQgPw0KPj4+Pj4gDQo+Pj4+PiBJIHRoaW5rIFJvZ2VyIGlz
IG5vdCBhdmFpbGFibGUgdG9kYXkgSSdtIGFmcmFpZC4NCj4+Pj4+IA0KPj4+Pj4gQmVydHJhbmQs
IGNhbiB5b3UgZ2l2ZSBtZSBhIGxpbmsgdG8gdGhlIGNvbW1lbnQgZnJvbSBSb2dlciA/DQo+Pj4+
PiBBc3N1bWluZyB0aGF0IGl0IHNheXMgd2hhdCBJIHRoaW5rIGl0IHdpbGwgc2F5Og0KPj4+Pj4g
DQo+Pj4+PiBJIHRoaW5rIHRoZSBiZXN0IHRoaW5nIHRvIGRvIHdpbGwgYmUgdG8gbGVhdmUgdGhl
IG5hbWUgYXMgaXQgd2FzIGluDQo+Pj4+PiB0aGUgbW9zdCByZWNlbnQgdmVyc2lvbiBvZiB5b3Vy
IHNlcmllcy4gIEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UNCj4+Pj4+IHRvIGJsb2NrIHRo
aXMgcGF0Y2ggb3ZlciBhIG5hbWluZyBkaXNhZ3JlZW1lbnQuICBBbmQgaXQgd291bGQgYmUgYmVz
dA0KPj4+Pj4gdG8gbWluaW1pc2UgdW5uZWNlc3NhcnkgY2h1cm4uDQo+Pj4+PiANCj4+Pj4+IEkg
d291bGQgYmUgaGFwcHkgdG8gcmVsZWFzZS1hY2sgYSBuYW1lIGNoYW5nZSAocGVyaGFwcyBwcm9w
b3NlZCBibyBKYW4NCj4+Pj4+IG9yIFJvZ2VyKSBzdXBwb3NpbmcgdGhhdCB0aGF0IGlzIHRoZSB1
bHRpbWF0ZSBtYWludGFpbmVyIGNvbnNlbnN1cy4NCj4+Pj4+IA0KPj4+Pj4gSmFuLCB3b3VsZCB0
aGF0IGFwcHJvYWNoIGJlIE9LIHdpdGggeW91ID8NCj4+Pj4gDQo+Pj4+IFdlbGwsIHllcywgaWYg
YSBzdWJzZXF1ZW50IG5hbWUgY2hhbmdlIGlzIG9rYXksIHRoZW4gSSBjb3VsZCBsaXZlIHdpdGgN
Cj4+Pj4gdGhhdC4gSSdkIHN0aWxsIGZpbmQgaXQgb2RkIHRvIHJlbmFtZSBhIGZ1bmN0aW9uIGlt
bWVkaWF0ZWx5IGFmdGVyIGl0DQo+Pj4+IGFscmVhZHkgZ290IHJlbmFtZWQuIEFzIGV4cHJlc3Nl
ZCBlbHNld2hlcmUsIEkgc3VzcGVjdCBpbiBoaXMgcmVxdWVzdA0KPj4+PiBSb2dlciBkaWQgbm90
IHBheSBhdHRlbnRpb24gdG8gYSB1c2Ugb2YgdGhlIGZ1bmN0aW9uIGluIG5vbi1FQ0FNIGNvZGUu
DQo+Pj4gDQo+Pj4gVXNpbmcgTU1DRkdfQkRGIHdhcyBvcmlnaW5hbCByZXF1ZXN0ZWQgYnkgSnVs
aWVuLCBub3QgbXlzZWxmIEkgdGhpbms6DQo+Pj4gDQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcveGVuLWRldmVsL2E4NjhlMWU3LTg0MDAtNDVkZi02ZWFhLTY5ZjFlMmM5OTM4M0B4ZW4ub3Jn
Lw0KPj4+IA0KPj4+IEknbSBzbGlnaHRseSBsb3NzIGluIHNvIG1hbnkgbWVzc2FnZXMuIE9uIHg4
NiB3ZSBzdWJ0cmFjdCB0aGUgTUNGRw0KPj4+IHN0YXJ0IGFkZHJlc3MgZnJvbSB0aGUgcGFzc2Vk
IG9uZSBiZWZvcmUgZ2V0dGluZyB0aGUgQkRGLCBhbmQgdGhlbiB3ZQ0KPj4+IGFkZCB0aGUgc3Rh
cnR0aW5nIGJ1cyBhZGRyZXNzIHBhc3NlZCBpbiB0aGUgQUNQSSB0YWJsZS4gVGhpcyBpcyBzbyBm
YXINCj4+PiBub3QgbmVlZCBvbiBBcm0gQUZBSUNUIGJlY2F1c2Ugb2YgdGhlIGZpeGVkIG5hdHVy
ZSBvZiB0aGUgc2VsZWN0ZWQNCj4+PiB2aXJ0dWFsIEVDQU0gcmVnaW9uLg0KPj4gDQo+PiBBdCB0
aGUgZW5kIG15IHBhdGNoIHdpbGwgYWRkIGluIHhlbi9wY2kuaDoNCj4+ICNkZWZpbmUgRUNBTV9C
REYoYWRkcikgICAgICAgICAoKChhZGRyKSAmIDB4MGZmZmYwMDApID4+IDEyKQ0KPiANCj4gU2lu
Y2UgeW91IHN0aWxsIG1ha2UgdGhpcyBwcm9wb3NhbCwgb25jZSBhZ2FpbjogSSdtIG5vdCBnb2lu
ZyB0bw0KPiBhY2NlcHQgc3VjaCBhIG1hY3JvIGluIHRoaXMgaGVhZGVyLCB3aGF0ZXZlciB0aGUg
bmFtZS4gSXRzIHByaW9yDQo+IHBsYWNlbWVudCB3YXMgd3JvbmcgYXMgd2VsbC4gT25seSAuLi4N
Cj4gDQo+PiAjZGVmaW5lIEVDQU1fUkVHX09GRlNFVChhZGRyKSAgKChhZGRyKSAmIDB4MDAwMDBm
ZmYpDQo+IA0KPiAuLi4gdGhpcyBvbmUgaXMgZmluZSB0byBsaXZlIGhlcmUgKGFuZCBwcmVzdW1h
Ymx5IGl0IGNvdWxkIGdhaW4gdXNlcw0KPiBlbHNld2hlcmUpLg0KDQpTbyB5b3Ugd291bGQgYWdy
ZWUgaWYgdGhleSBhcmUgYm90aCBtb3ZlZCB0byB2cGNpLmggd2l0aCBhIFZQQ0lfIHByZWZpeCA/
DQoNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KPiANCj4+IE5vdyBzZWVpbmcgdGhlIGNvbW1lbnQg
dGhlIHF1ZXN0aW9uIGlzIHNob3VsZCB0aG9zZSBiZSByZW5hbWVkIHdpdGggYSBWUENJDQo+PiBw
cmVmaXggYW5kIGJlIG1vdmVkIHRvIHhlbi92cGNpLmguDQo+PiANCj4+IFNvIGZhciBFQ0FNX0JE
RiBpcyBvbmx5IHVzZWQgaW4gdnBjaV9tbWNmZ19kZWNvZGVfYWRkciB3aGljaCBpcyBvbmx5IGNh
bGxlZA0KPj4gYmVmb3JlIGNhbGxpbmcgdnBjaV9lY2FtX3tyZWFkL3dyaXRlfS4NCj4+IA0KPj4g
RUNBTV9SRUdfT0ZGU0VUIGlzIG9ubHkgdXNlZCBpbiBhcm0gdnBjaSBjb2RlLg0KPj4gDQo+PiBE
byB5b3UgdGhpbmsgdGhlIGN1cnJlbnQgc3RhdGUgaXMgb2sgb2YgdGhlIHJlbmFtaW5nICsgbW92
aW5nIHNob3VsZCBiZSBkb25lID8NCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KDQo=

