Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762D4E2D09
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 16:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293068.497800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKR1-0000RS-E7; Mon, 21 Mar 2022 15:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293068.497800; Mon, 21 Mar 2022 15:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKR1-0000Os-B7; Mon, 21 Mar 2022 15:59:07 +0000
Received: by outflank-mailman (input) for mailman id 293068;
 Mon, 21 Mar 2022 15:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7HK=UA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWKQz-0000Om-T7
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 15:59:06 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d425dc41-a92f-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 16:59:03 +0100 (CET)
Received: from AS9PR06CA0341.eurprd06.prod.outlook.com (2603:10a6:20b:466::14)
 by VI1PR08MB4415.eurprd08.prod.outlook.com (2603:10a6:803:fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 15:59:00 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::2) by AS9PR06CA0341.outlook.office365.com
 (2603:10a6:20b:466::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Mon, 21 Mar 2022 15:58:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 15:58:59 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Mon, 21 Mar 2022 15:58:58 +0000
Received: from 9aefd9f9a34a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE590025-02B6-46FB-8A71-A5D2D1B87C5E.1; 
 Mon, 21 Mar 2022 15:58:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9aefd9f9a34a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Mar 2022 15:58:48 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB3506.eurprd08.prod.outlook.com (2603:10a6:208:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 15:58:42 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 15:58:42 +0000
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
X-Inumbo-ID: d425dc41-a92f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/xnS8kNoPMOayS0aIq//hLNtA7sNNktxCNdejPkBpM=;
 b=r4xA4/xqf+kg3EwJIEfNUQ/YyT7wSnd9ctGA+5Xph1Vr9zazgK/Yd6O81PbnKKkyfSfgSS/ArWIRySSN8AKO6zomW5H8PYl+YWiYvjY8ccDE66VwkuHduLq3ZgVpVQ2nQ7fAGklGfMk2f7eol21ih8rVDu2leU6Pve2TJBZzFTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d007cce75cb9669
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFVfCXrJ3dNdPH8U9Sxmd8QJVoPpW/HLmU95vnxPqgOlN1yP0r01Qr7hL+N1dGQpHUPdNjdRaJZ82R/yQStCNkGUFojD6gnRdu/oEkTwMv/nEZm8DQFWISP4Qkj0sA/R26NC2qBc6J4ELofaMoA5Yi9oWexctvog9AnVfKr1QgERy6Kyzk15wWTXjBcdDbxORAb72gRe6cmkiqL0+VU39P3WoQ9AsnqWiKu54/ALSU++uT2EghbIWTF2GmD0OjGxs5uSv4ZX1cLjcjo+bYGZpL2TlAnMr0jvLf2aKsMoRgqkxUNCMTK4dwDvUb+cMULi2qizxZ10EO2Wz4hMveNADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/xnS8kNoPMOayS0aIq//hLNtA7sNNktxCNdejPkBpM=;
 b=ntv5Bvsvxnh6rI26i8dOIK1p8S8i3bV+IXN6ZFqpGMY3V8snbnox0buufwPxvuB+8CGnOaZsOcteGP8dNOuvDaYj1xRUtBzdAwHkVKtCIQGyygJQWfuSulowg/pxgX/2mZ1QE4zDjHqnTvK4S5sPXTmdcyKggANXuABrL9X08VPrR6q7CQE3+8TG8Ii5++r3IFyb4AooknM7/rwlbN3lRuVH+xbo+a+uvthlVjDh9gPnFfab1IrONZsyK129qUtEiZmMD7RXlTiHqrNpb5EII2XsDVrmkeP/vCGWDRTH/yO3b9FKhzJ4B+hlGlh5WiJaugi72J5xTLfe1Ss0ELo0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/xnS8kNoPMOayS0aIq//hLNtA7sNNktxCNdejPkBpM=;
 b=r4xA4/xqf+kg3EwJIEfNUQ/YyT7wSnd9ctGA+5Xph1Vr9zazgK/Yd6O81PbnKKkyfSfgSS/ArWIRySSN8AKO6zomW5H8PYl+YWiYvjY8ccDE66VwkuHduLq3ZgVpVQ2nQ7fAGklGfMk2f7eol21ih8rVDu2leU6Pve2TJBZzFTE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYOtySiWfuTiIQkkqv44WbBvDftKzFUCoAgASzLoA=
Date: Mon, 21 Mar 2022 15:58:42 +0000
Message-ID: <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
In-Reply-To: <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f4fd7039-83ff-4477-b3da-08da0b53b640
x-ms-traffictypediagnostic:
	AM0PR08MB3506:EE_|VE1EUR03FT034:EE_|VI1PR08MB4415:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4415B343ABB864105873934BE4169@VI1PR08MB4415.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0LzDITCmlK6AScapFd0XIupI4SXncfD6vqbaotDTFX5Bx0c2B0Qy796TZVkKYotMyYpkZKfLoMshwnnwyMuAw2ETTcjKI/pw2HKGX8Ao18Ly98ZgwocUkzBmN8ewt5aVBflnRl3We5fbN4ojAGIEtn6VFs4YDq31Z8aJ5O6Kf79MIzGOmLE/Hps0p/TSrq5LEw4rBeAMZrGtXKGqN2ezec957LXXu9sjpuU0MZNWYrSAScP7dbznbYMmbzymZtvnKxL8O0csvJ2ZevL66ADsFSMO+X06xeT/kmyOW+EmrIjiAmDZ1NyeolVtI2RLkklJTZFTKcso5gurlItEzM+bs6BE12NwUH9Soy3hOg21rwVyWxjHocZCFjuY1JHE2VlaIEhApumIqo+zjYuazyCn4J00VfSuPpyX50QbyfR2LZG4wM01dwqjWM+5j7c37YTWnwNZ0MAPAo7zOe4o9js3nrivMoK5itlXzxX3kRELRHGh58bP2vG5mX+WWaGjBKyEOH6pB7V6DzczEi6R1NUzXP/wjllgud7SKSkMWKDqeZ6Q58hT8Dz3Q7c7t835INyIWnzMcjtotHjMtpPN5A9S6v9zwKCxuHAI9T9eqk5iZBEcSt6chmojkUgEYOoBpZ2/qyMFaCc4iQV/363MsgVfPtaJu2yOCpe2fchkNdQHyOMZ5MSDYwFhbKi4Z1HoVETDOugG9kUm+E4uYf8Ovj4u7OrPMNv5cXq7okmFl+QuozH5qtiYAyTqrklMi23zpwLHi4v/jHvgG+fnK+EFmWPiqDK9qA/SptIbL/ZjLWOXcSZz1QUKHL5nTEdT1swwbbutrrW21kNhD80CQNWaVYDTFQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(66946007)(66556008)(26005)(64756008)(36756003)(76116006)(2906002)(508600001)(122000001)(66476007)(966005)(6486002)(66446008)(2616005)(186003)(7416002)(53546011)(5660300002)(71200400001)(6512007)(8936002)(54906003)(33656002)(6916009)(316002)(38100700002)(83380400001)(86362001)(38070700005)(4326008)(6506007)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7870A952BB73B742A99FECEE87B99B79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3506
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	072f1a04-267f-4fd2-2b2a-08da0b53ac0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7AJvEPbwKeMuUbS+/3M+IhepLdsqEx7O2CSXygJ+kVleI+rGQVz9AWk5fzBeWTC7ZfHzhqo6IqHYmFbH7nevoQL53s9Qf76xacXiWzk4W70gosPs5N7V7+9/9AIpUeUeAREPvjdI4sbULZDjaqSaCEtvtDAvHeW8ogEwrVNZShhZi0OSTGjJSmIdZWz4NeDXDSaXEuyXFfe/83xcIzrwJkOGMqzNltuywG136ptJKu6lUc3J/ycqZ629v8nxxANwSQ/h4FyLAgCfgtHK9gBzq0I8fK/yRGbYD29rC84OhxpmX9Z/5wsc93M4WhjUsqC3PjSxhhuqlbFLxfTNOcER3oiQslTtR4CffWbJFk8NR0Akchss5xf3pqiglaxTTydCxKWCeH7DrlePz2E28/XbECWD1ll7jhqgWm3lv1x7hIc3Uf/9Nk3HdUhho5qb/APtAcDrsghZm778JXQS1fQKRg7pHhheo62EVH2izU2KQ9Tu+Kk4d9FZLVJ1FOrmuxChBUEu+x31mZYPOjz9j46zt7EvWOA/mhikolpT+zay7J8pPaGzwgFLbb6tYJWDyQdI02LTxWpcWF3bIwHBsZ/OSaVO1rPaVDHtRwJblTQ6Jqm+GidzvZweCtMrKmHFtQzyDc4N1L/RELGg7t79ThhWqBsbvtmDNVVduRuOnUIBdvCIuvebnmPnGPtzho+Po1f863otA/LfhSnSjp49ejh+1Sm70IYCCUjra7DRmSU1x3ZJ9nGIgSWEA7UlAP/hZj1akaWmwMiQOEI94HrZLJB6jQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(2906002)(107886003)(2616005)(36756003)(6862004)(8676002)(4326008)(70586007)(70206006)(26005)(53546011)(336012)(186003)(508600001)(6506007)(8936002)(36860700001)(47076005)(6512007)(33656002)(316002)(40460700003)(81166007)(86362001)(356005)(966005)(6486002)(54906003)(5660300002)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:58:59.3137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fd7039-83ff-4477-b3da-08da0b53b640
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4415

DQoNCj4gT24gMTggTWFyIDIwMjIsIGF0IDE2OjEyLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBJIG9ubHkgc2tpbW1lZCB0aHJvdWdo
IHRoZSBzZXJpZXMuIEkgaGF2ZSBvbmUgcXVlc3Rpb24gYmVsb3c6DQo+IA0KPiBPbiAxOC8wMy8y
MDIyIDE1OjI1LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gK3ZvaWQgX19pbml0IGJ0Y3B1cG9v
bHNfYWxsb2NhdGVfcG9vbHModm9pZCkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0K
Pj4gKyAgICBib29sIGFkZF9leHRyYV9jcHVwb29sID0gZmFsc2U7DQo+PiArDQo+PiArICAgIC8q
DQo+PiArICAgICAqIElmIHRoZXJlIGFyZSBubyBjcHVwb29scywgdGhlIHZhbHVlIG9mIG5leHRf
cG9vbF9pZCBpcyB6ZXJvLCBzbyB0aGUgY29kZQ0KPj4gKyAgICAgKiBiZWxvdyB3aWxsIGFzc2ln
biBldmVyeSBjcHUgdG8gY3B1cG9vbDAgYXMgdGhlIGRlZmF1bHQgYmVoYXZpb3IuDQo+PiArICAg
ICAqIFdoZW4gdGhlcmUgYXJlIGNwdXBvb2xzLCB0aGUgY29kZSBiZWxvdyBpcyBhc3NpZ25pbmcg
YWxsIHRoZSBub3QNCj4+ICsgICAgICogYXNzaWduZWQgY3B1IHRvIGEgbmV3IHBvb2wgKG5leHRf
cG9vbF9pZCB2YWx1ZSBpcyB0aGUgbGFzdCBpZCArIDEpLg0KPj4gKyAgICAgKiBJbiB0aGUgc2Ft
ZSBsb29wIHdlIGNoZWNrIGlmIHRoZXJlIGlzIGFueSBhc3NpZ25lZCBjcHUgdGhhdCBpcyBub3QN
Cj4+ICsgICAgICogb25saW5lLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgZm9yICggaSA9IDA7IGkg
PCBucl9jcHVfaWRzOyBpKysgKQ0KPj4gKyAgICAgICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGks
ICZjcHVfb25saW5lX21hcCkgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIC8qIFVu
YXNzaWduZWQgY3B1IGdldHMgbmV4dF9wb29sX2lkIHBvb2wgaWQgdmFsdWUgKi8NCj4+ICsgICAg
ICAgICAgICBpZiAoIHBvb2xfY3B1X21hcFtpXSA8IDAgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+
ICsgICAgICAgICAgICAgICAgcG9vbF9jcHVfbWFwW2ldID0gbmV4dF9wb29sX2lkOw0KPj4gKyAg
ICAgICAgICAgICAgICBhZGRfZXh0cmFfY3B1cG9vbCA9IHRydWU7DQo+PiArICAgICAgICAgICAg
fQ0KPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTG9naWNhbCBDUFUgJXUgaW4g
UG9vbC0ldS5cbiIsIGksDQo+PiArICAgICAgICAgICAgICAgICAgIHBvb2xfY3B1X21hcFtpXSk7
DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICB7DQo+PiArICAg
ICAgICAgICAgaWYgKCBwb29sX2NwdV9tYXBbaV0gPj0gMCApDQo+PiArICAgICAgICAgICAgICAg
IHBhbmljKCJQb29sLSVkIGNvbnRhaW5zIGNwdSV1IHRoYXQgaXMgbm90IG9ubGluZSFcbiIsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgIHBvb2xfY3B1X21hcFtpXSwgaSk7DQo+PiArICAgICAg
ICB9DQo+PiArDQo+PiArICAgIGlmICggYWRkX2V4dHJhX2NwdXBvb2wgKQ0KPj4gKyAgICAgICAg
bmV4dF9wb29sX2lkKys7DQo+PiArDQo+PiArICAgIC8qIENyZWF0ZSBjcHVwb29scyB3aXRoIHNl
bGVjdGVkIHNjaGVkdWxlcnMgKi8NCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBuZXh0X3Bvb2xf
aWQ7IGkrKyApDQo+PiArICAgICAgICBjcHVwb29sX2NyZWF0ZV9wb29sKGksIHBvb2xfc2NoZWRf
bWFwW2ldKTsNCj4+ICsNCj4+ICsjaWZkZWYgQ09ORklHX1g4Ng0KPj4gKyAgICAvKiBDcHUwIG11
c3QgYmUgaW4gY3B1cG9vbDAgZm9yIHg4NiAqLw0KPj4gKyAgICBpZiAoIHBvb2xfY3B1X21hcFsw
XSAhPSAwICkNCj4+ICsgICAgICAgIHBhbmljKCJDcHUwIG11c3QgYmUgaW4gUG9vbC0wXG4iKTsN
Cj4+ICsjZW5kaWYNCj4gDQo+IENhbiB5b3UgZG9jdW1lbnQgd2h5IHRoaXMgaXMgbmVjZXNzYXJ5
IG9uIHg4NiBidXQgbm90IG9uIG90aGVyIGFyY2hpdGVjdHVyZXM/DQoNCkhpIEp1bGllbiwNCg0K
SSByZWNlaXZlZCB0aGUgd2FybmluZyBieSBKdWVyZ2VuIGhlcmU6IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvY29tbWVudC8yNDc0MDc2Mi8gdGhhdCBhdCBsZWFzdCBvbiB4ODYgdGhlcmUg
Y291bGQgYmUNCnNvbWUgcHJvYmxlbXMgaWYgY3B1MCBpcyBub3QgaW4gY3B1cG9vbDAsIEkgdGVz
dGVkIGl0IG9uIGFybSBhbmQgaXQgd2FzIHdvcmtpbmcgZmluZSBhbmQgSSBkaWRu4oCZdCBmaW5k
IGFueSByZXN0cmljdGlvbi4NCg0KU28gSSBkb27igJl0IGtub3cgd2h5IG9uIHg4NiB3ZSBtdXN0
IGhhdmUgY3B1MCBpbiBjcHVwb29sMCwgbWF5YmUgeDg2IG1haW50YWluZXIgaGF2ZSBtb3JlIGtu
b3dsZWRnZSBhYm91dCB0aGF0IGFuZA0KSSBjYW4gcHV0IGEgY29tbWVudCBoZXJlLg0KDQpDaGVl
cnMsDQpMdWNhDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

