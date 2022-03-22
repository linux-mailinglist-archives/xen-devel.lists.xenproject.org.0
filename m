Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E981F4E44EB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 18:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293609.498811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiBw-00075T-SJ; Tue, 22 Mar 2022 17:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293609.498811; Tue, 22 Mar 2022 17:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiBw-00072r-Oz; Tue, 22 Mar 2022 17:21:08 +0000
Received: by outflank-mailman (input) for mailman id 293609;
 Tue, 22 Mar 2022 17:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDwX=UB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWiBv-00072l-3P
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 17:21:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e6011b-aa04-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 18:21:01 +0100 (CET)
Received: from DB6PR0601CA0011.eurprd06.prod.outlook.com (2603:10a6:4:7b::21)
 by AM9PR08MB7216.eurprd08.prod.outlook.com (2603:10a6:20b:3df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 17:20:59 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::83) by DB6PR0601CA0011.outlook.office365.com
 (2603:10a6:4:7b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Tue, 22 Mar 2022 17:20:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 17:20:59 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 22 Mar 2022 17:20:59 +0000
Received: from d0547223b42a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4A06B4F-176C-4AA9-8F72-E29937C8257C.1; 
 Tue, 22 Mar 2022 17:19:27 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0547223b42a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Mar 2022 17:19:27 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB4610.eurprd08.prod.outlook.com (2603:10a6:208:104::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 17:19:24 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 17:19:23 +0000
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
X-Inumbo-ID: 71e6011b-aa04-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAJkZwTjj9YY4vcqO0WasdWajY3sxqk6ZpbYBwQutb8=;
 b=DExC5VheYSIpC8yNIgriirj6RIvOVQRiNHiWwn/q/t8Vadknn3XYj0MAh55Kx7gUoFoaIGh7spWSF5Axt+w48PrJKenyRmsU+cHt4amHIih7b7oxxXmoTqb2NWrVNU1HRbvqWRhbM5rTK8oKQ9Didd9Ez3z9t+Pe3buOnqxr1q8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81b3aa542b6bac5c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnSCuSaFccvcBeTYO/GotWyDvx755OkiokaN0qWCXKEub4f76sZBYqv5P85EL9HXEMX0h5s5vz3KBV6Ox8vP5AWbjbDl2Q20yFpUZWGMqrwR5pScW6hTSi3e55etfWkqSBgpja4+Ls5lxLb86gE0leFh7Ds8h2/S2FQKRQuGExNk3S1An3s3K1OMglwnoRJKGLl9gUHg0toqpA1ayfoZK4Rvj4Zns4xlATpuXaLkLhlGO6g1IY7MYupYudSWqIaAxgzSbkzLxrWH41JBFQn6itFmLxReUCJbJQ7gs9bkwByDONHpJi1x+0VMmcgxI+odybR6IKlwz9rCMZLWoGRQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAJkZwTjj9YY4vcqO0WasdWajY3sxqk6ZpbYBwQutb8=;
 b=kJim9hzJQV3jOohglcFE98UtjsS4bcDrhnsdnl4JsSakvpw940o4GU42J7IKmYz798OT275Ataj4DQdEJn0XflUIFUC2GxJorbk9keLheL8rkQs9Uq8ULjT5rc+0No1CqtCawLyWp5wVrhjHbTHm8jDZIXd0fW5gthUx4Bt+CmlGyWV0sFPFSqshhXwdL/eI2mZLjM9AQMjxnApkngAtXBU4c9JmPMgbJOikPZSIqDu5vqaBPltOYIo7UVmXzT+EoQNJunoeuP8p1UijTfa2CutwcD7sz7b+IYhGe2VjbAUzWVDqacGnv0bBfz54uaxpEopg5OhiuAR7Bei1HsKblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAJkZwTjj9YY4vcqO0WasdWajY3sxqk6ZpbYBwQutb8=;
 b=DExC5VheYSIpC8yNIgriirj6RIvOVQRiNHiWwn/q/t8Vadknn3XYj0MAh55Kx7gUoFoaIGh7spWSF5Axt+w48PrJKenyRmsU+cHt4amHIih7b7oxxXmoTqb2NWrVNU1HRbvqWRhbM5rTK8oKQ9Didd9Ez3z9t+Pe3buOnqxr1q8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, "rosbrookn@gmail.com" <rosbrookn@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, "christian.lindig@citrix.com"
	<christian.lindig@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Topic: [PATCH v3 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Index: AQHYOtyJQj5Quyvq80eQ8wyveo4cTKzFUeSAgAZaVAA=
Date: Tue, 22 Mar 2022 17:19:23 +0000
Message-ID: <79F0E21A-BD8D-4C31-9398-46893FED4733@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-6-luca.fancellu@arm.com>
 <cff3d9a6-fc72-ae05-663c-4f0197525455@xen.org>
In-Reply-To: <cff3d9a6-fc72-ae05-663c-4f0197525455@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4824cf68-d84e-4db4-852f-08da0c285535
x-ms-traffictypediagnostic:
	AM0PR08MB4610:EE_|DB5EUR03FT027:EE_|AM9PR08MB7216:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7216D76F0139BBB6166F519EE4179@AM9PR08MB7216.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 npXdgMtnQo35jfaF2sCHmlkOXTJ66e0yIcjTv7e4pTeNyp5eZUkhxGSz8ZPNnfWWe7ULv/SOHRUyGiAR4m6kdWSKnQlMAl7R8DMDSkPH5aYSXX+0kjxgUFf93tiMSIuBm+UWRfScjeuQxoM7IGd5EJKAIooFIeGOlW/fJE3qUL2gShBV0ki85VY6WVxjgUJhupi3P34kShdwuwJr8e7x2lH1aUAnv8OLi0/Nudt5Gh7FcUXr4Cnw7wmbGuok/OC0qgOHlDEQrYg/mF4pq7fkvbusY53BFUOxP4wTPQ7R28uEOMj/0+bf7WWQroDGDtoTkdtpE3Sq169h3KmWGdLBu/MOm3ndn68DW1J2gMrqp8+cvI9BdaDPKICBT3i3IxJGT35xs05ZTnqPtviliHrCPB8xm8e9VjHKcmrtcqREVsfv+5VFSbHhD/TH49At3ZUdZzrImt3pPKWckDLp+uTNKO7/KOppoDR1sYpXNZkAHlbeANodzg74aDz3BWaVhX6bQ9nMA6Zca6mSLCO7gfQjNEzA/kiyzHcgu5ixkt+4CICzJ3YYJSTWCFwk2m1o9af9+Zl4HKWqCSyvCmXGo5nkUMFnvsS7cXaYLDAVfmYv07/qsag/MwstIH2HUQXta8MVb6u+bH+Esn2EveUBgndFcOSM1h1jv4Unubwrv+yhIfOspV+rfMMdxHq1su35cz/ut/wz3HiJI34RCbkYJ0U4Xe+8WrxrOEayOMBWiUTZBuv+fat0srsScROxOiXThomJdwYKcWBmTynauTqFDydgog==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(66556008)(91956017)(76116006)(66946007)(66476007)(64756008)(86362001)(6486002)(316002)(83380400001)(36756003)(186003)(2906002)(8676002)(6916009)(54906003)(2616005)(26005)(38100700002)(33656002)(4326008)(53546011)(6506007)(71200400001)(508600001)(7416002)(38070700005)(8936002)(6512007)(122000001)(5660300002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2C07E394C4E96459DBF249744C008E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4610
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31da92dc-584f-433f-bde5-08da0c281c54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ETs1NzlS0dfvep/MdlvaCoGXsjgV1SMRlK2AIFHYXQxVCNgB2jmAX0i6GG6iHs9qIPd108wgjCGXepH8I4ZQaqtZMxtszaVlwORaQh3dFZI0CjTU7eF7I41kExbMzyI/dkbcJpbJjT615sYPIjFjW8tWfCDz2+gxILW4m25jl076zZ4WeTXLoH5TFOopmArtuxsTrL/LJY/e+g3S3bMZcN2qbO7rgvuORikja03ynXUrUVu1S9zwVQ9m6gLNnp9L6FXdTlbA2LxtsW+gSN6Us8kmRYS+3pXiPQ7VtjCBZlwzxIgUXuucra13jk6R1Zeh/5JRajmw9VtF/JIo3SRC+/P+0QzvORT9DCxBu3S0NxRsTIMorx6jILooOmgZoBlGFFHKA5bQ2MLUjRDNsKuk6YbQBbK6WwFXZWG6TzBzwCtScaJWDiYG14TJMF5YYWzPj1N0ZdjFBYFe+BE+Z1Q85mGYVAtxFwTyftOMyWxiSP6aWmJVd3sAdl+13kiq09VoYCqloWtq76JKmbOpJ1GLpY0JkQa9Gx5lee8mdRcZ9SrpujwtUmcqxG3ywA2cz7lp4eoqYvE5YOj7Js6+jWkxOudwVtCf25BO/aNULWgEZjjK23eJP8UCvUPhI7SS4E9AdtNKiLrhqxprnYk9TOEbhRk/SbRP4PQYGKrGZc703aXugyYU5krAMTTMAv7MWa5w4vNVrw9lKDar7sy8f3CfCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(6512007)(54906003)(2906002)(6506007)(336012)(53546011)(47076005)(70586007)(70206006)(36756003)(316002)(6862004)(4326008)(8676002)(508600001)(6486002)(33656002)(81166007)(356005)(82310400004)(8936002)(5660300002)(40460700003)(2616005)(186003)(83380400001)(107886003)(36860700001)(26005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 17:20:59.4142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4824cf68-d84e-4db4-852f-08da0c285535
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7216

DQorIG1haW50YWluZXIgZ29sYW5nLCBsaWJzLCBvY2FtbCwgcHl0aG9uIGJpbmRpbmdzDQoNCj4g
T24gMTggTWFyIDIwMjIsIGF0IDE2OjE4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3
cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTgvMDMvMjAyMiAxNToyNSwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+IEludHJvZHVjZSBkb21haW4tY3B1cG9vbCBwcm9wZXJ0eSBvZiBhIHhlbixk
b21haW4gZGV2aWNlIHRyZWUgbm9kZSwNCj4+IHRoYXQgc3BlY2lmaWVzIHRoZSBjcHVwb29sIGRl
dmljZSB0cmVlIGhhbmRsZSBvZiBhIHhlbixjcHVwb29sIG5vZGUNCj4+IHRoYXQgaWRlbnRpZmll
cyBhIGNwdXBvb2wgY3JlYXRlZCBhdCBib290IHRpbWUgd2hlcmUgdGhlIGd1ZXN0IHdpbGwNCj4+
IGJlIGFzc2lnbmVkIG9uIGNyZWF0aW9uLg0KPj4gQWRkIG1lbWJlciB0byB0aGUgeGVuX2RvbWN0
bF9jcmVhdGVkb21haW4gcHVibGljIGludGVyZmFjZSBzbyB0aGUNCj4+IFhFTl9ET01DVExfSU5U
RVJGQUNFX1ZFUlNJT04gdmVyc2lvbiBpcyBidW1wZWQuDQo+PiBBZGQgcHVibGljIGZ1bmN0aW9u
IHRvIHJldHJpZXZlIGEgcG9vbCBpZCBmcm9tIHRoZSBkZXZpY2UgdHJlZQ0KPj4gY3B1cG9vbCBu
b2RlLg0KPj4gVXBkYXRlIGRvY3VtZW50YXRpb24gYWJvdXQgdGhlIHByb3BlcnR5Lg0KPj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gLS0t
DQo+PiBDaGFuZ2VzIGluIHYzOg0KPj4gLSBVc2UgZXhwbGljaXRlbHkgc2l6ZWQgaW50ZWdlciBm
b3Igc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluDQo+PiAgIGNwdXBvb2xfaWQgbWVtYmVy
LiAoU3RlZmFubykNCj4+IC0gQ2hhbmdlZCBjb2RlIGR1ZSB0byBwcmV2aW91cyBjb21taXQgY29k
ZSBjaGFuZ2VzDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBNb3ZlZCBjcHVwb29sX2lkIGZyb20g
YXJjaCBzcGVjaWZpYyB0byBjb21tb24gcGFydCAoSnVlcmdlbikNCj4+IC0gSW1wbGVtZW50ZWQg
ZnVuY3Rpb25zIHRvIHJldHJpZXZlIHRoZSBjcHVwb29sIGlkIGZyb20gdGhlDQo+PiAgIGNwdXBv
b2wgZHRiIG5vZGUuDQo+PiAtLS0NCj4+ICBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rp
bmcudHh0IHwgIDUgKysrKysNCj4+ICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAg
ICAgIHwgMTQgKysrKysrKysrKysrKy0NCj4+ICB4ZW4vY29tbW9uL2Jvb3RfY3B1cG9vbHMuYyAg
ICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgeGVuL2NvbW1vbi9k
b21haW4uYyAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgeGVuL2luY2x1ZGUvcHVibGlj
L2RvbWN0bC5oICAgICAgICAgICB8ICA0ICsrKy0NCj4+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrDQo+IA0KPiBUaGlzIHBhdGNoIGRvZXNuJ3Qg
c2VlbSB0byBjb250YWluIGFueSBjaGFuZ2UgaW4gdG9vbHMuIFNvLi4uDQo+IA0KPj4gICAgICAg
ICAgaWYgKCAoZXJyID0gbGF0ZV9od2RvbV9pbml0KGQpKSAhPSAwICkNCj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmgNCj4+IGluZGV4IGI4NWU2MTcwYjBhYS4uMmY0Y2Y1NmY0MzhkIDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
ZG9tY3RsLmgNCj4+IEBAIC0zOCw3ICszOCw3IEBADQo+PiAgI2luY2x1ZGUgImh2bS9zYXZlLmgi
DQo+PiAgI2luY2x1ZGUgIm1lbW9yeS5oIg0KPj4gIC0jZGVmaW5lIFhFTl9ET01DVExfSU5URVJG
QUNFX1ZFUlNJT04gMHgwMDAwMDAxNA0KPj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0Vf
VkVSU0lPTiAweDAwMDAwMDE1DQo+PiAgICAvKg0KPj4gICAqIE5CLiB4ZW5fZG9tY3RsLmRvbWFp
biBpcyBhbiBJTi9PVVQgcGFyYW1ldGVyIGZvciB0aGlzIG9wZXJhdGlvbi4NCj4+IEBAIC0xMDYs
NiArMTA2LDggQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsNCj4+ICAgICAgLyog
UGVyLXZDUFUgYnVmZmVyIHNpemUgaW4gYnl0ZXMuICAwIHRvIGRpc2FibGUuICovDQo+PiAgICAg
IHVpbnQzMl90IHZtdHJhY2Vfc2l6ZTsNCj4+ICArICAgIHVpbnQzMl90IGNwdXBvb2xfaWQ7DQo+
IA0KPiAuLi4gd2lsbCB0aGUgdG9vbHMgKGUuZy4gZ29sYW5nIGJpbmRpbmdzLCBsaWJ4bCwuLikg
YWx3YXlzIHplcm8geGVuX2RvbWN0bF9jcmVhdGVkb21haW4/DQo+IA0KPiBJIGFsc28gdGhpbmsg
d2UgbWF5IG5lZWQgdG8gcmVnZW5lcmF0ZSB0aGUgZ29sYW5nIGJpbmRpbmdzLg0KDQpJ4oCZdmUg
Y2hlY2tlZCB0aGUgb2NjdXJyZW5jZXMgb2Ygc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWlu
IGluIHRvb2xzLyBhbmQgSSBzZWUgaXQgaXMNCmFsd2F5cyBpbml0aWFsaXNlZCB1c2luZyBkZXNp
Z25hdGVkIGluaXRpYWxpemVycyBzbyAoY29ycmVjdCBtZSBpZiBJ4oCZbSB3cm9uZykgYW55IG5v
biBzcGVjaWZpZWQNCmZpZWxkIHNob3VsZCBiZSB6ZXJvLg0KDQpJIHRyaWVkIHRvIGNoZWNrIGlm
IEkgbmVlZCBhbmQgaG93IHRvIHJlZ2VuZXJhdGUgdGhlIGdvbGFuZyBiaW5kaW5ncywgSSBkaWRu
4oCZdCBmaW5kIGRvY3VtZW50YXRpb24NCnRvIGRvIHRoYXQsIEnigJl2ZSBhZGRlZCBzb21lIG1h
aW50YWluZXIgdG8gdGhpcyByZXBseSB0aGF0IGhvcGVmdWxseSBjYW4gaGVscCBtZSB0byB1bmRl
cnN0YW5kDQpJZiBJ4oCZdmUgbWlzc2VkIHNvbWV0aGluZyBpbiB0aGlzIHBhdGNoIG1vZGlmeWlu
ZyBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4uDQoNCkNoZWVycywNCkx1Y2ENCg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

