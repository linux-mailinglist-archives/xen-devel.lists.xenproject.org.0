Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374974637E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 21:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558133.871968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGPTU-0007LK-7Y; Mon, 03 Jul 2023 19:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558133.871968; Mon, 03 Jul 2023 19:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGPTU-0007IE-37; Mon, 03 Jul 2023 19:44:40 +0000
Received: by outflank-mailman (input) for mailman id 558133;
 Mon, 03 Jul 2023 19:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H7X=CV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qGPTS-0007I4-5Q
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 19:44:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f01297-19da-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 21:44:36 +0200 (CEST)
Received: from DUZPR01CA0261.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::19) by DB4PR08MB9312.eurprd08.prod.outlook.com
 (2603:10a6:10:3f4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 19:44:24 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::16) by DUZPR01CA0261.outlook.office365.com
 (2603:10a6:10:4b9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 19:44:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Mon, 3 Jul 2023 19:44:23 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Mon, 03 Jul 2023 19:44:23 +0000
Received: from f4023ad8879f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA4C7E9A-C4CC-45B9-97E9-5F68945FFD08.1; 
 Mon, 03 Jul 2023 19:44:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4023ad8879f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 03 Jul 2023 19:44:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB7535.eurprd08.prod.outlook.com (2603:10a6:10:303::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 19:44:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 19:44:08 +0000
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
X-Inumbo-ID: 09f01297-19da-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kN++LO+K4u/TdNZ2jhD0vy7Ly0CMWt4p0+Myzk0pQ0=;
 b=GvzXsqooMjVW+qvWPQGAMCmwKgjHme2NJdavyM4fpU/sNXYotqfoVBeGFjyKvBcIhFXQUm6jPptFdGEDQbl+aFEOzpTS8hwVYdP7lNkBFHbdRXh1sednJB93n9LNXwDNHLAux6N0OSZJoERShK0JifTcSkL7S7LISY8yoAll+r0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e63f5242fc9ae38b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gy0ZlVONJIOefrpCJOMyeUhvuDIsGz94s5vYj4DoC4wcAkkJgNURulcMYWQNE0AWCcTLYMjV/ukKpNNXWjhMifnCadNvcadDx7gbvNP2aP1joXzOY6rvnrs4v02ioMQSDn+V27x7uedn4jeK3BvtVHmJWf/D0YN0yD3NkZn1VXocD92VbHK92+90WATudHaY7dXZRjxavY+WuoiNZ7ta3mstkNjSzo/I0V05qVoQ2FvgJrizaxzUyUytADYLX6jzjIXg75vXY2VIyXJDUF8jjS0mGQojR2adqZK0He1s18cyJsGOeIiENMj0bpEF8tvTZhxzNow4WVNWg49sPFX45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kN++LO+K4u/TdNZ2jhD0vy7Ly0CMWt4p0+Myzk0pQ0=;
 b=Nz1z/giKFIRF8NyIeURwPy0NQpxXi/36QuptBuo3oLNF4afhAWalg5Tp+ykQV08gjGEBsVKkPrs/G+bJU8YUHgJhbdeuAMewt6uXGUqSvl700TqaNmV1ESdsaEm1boyGM6R851nIN7SorCVcETIovIORR5sltKASTECzI4m6FIX0iy4CPooizoCR+YFC3do/W/JHIeYNNvFrFB6/+EfzooS1PJN+7x55EBeSiXXXtdUGuhEIYULsEIsIQBoACmIlvj6ws8PXiNtk99GAf1yiv0PW4ma12JN6Q/tpL1EI82Ex0ft+v/6PVH7v6gvZNK4UBI/CNqwhxqnZBM4P7PPsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kN++LO+K4u/TdNZ2jhD0vy7Ly0CMWt4p0+Myzk0pQ0=;
 b=GvzXsqooMjVW+qvWPQGAMCmwKgjHme2NJdavyM4fpU/sNXYotqfoVBeGFjyKvBcIhFXQUm6jPptFdGEDQbl+aFEOzpTS8hwVYdP7lNkBFHbdRXh1sednJB93n9LNXwDNHLAux6N0OSZJoERShK0JifTcSkL7S7LISY8yoAll+r0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Topic: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Index: AQHZqzMUKP6yBnvUfEC1egkdxmuozK+ki8cAgAB66ACAAukxgIAAZuEAgAAgQQA=
Date: Mon, 3 Jul 2023 19:44:08 +0000
Message-ID: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
 <6060dd00-5d9c-3804-4b9d-154b9b9dca49@citrix.com>
 <31FE51E0-0336-4756-8B30-6FE77DE10932@arm.com>
 <0c113f33-4410-aa75-84b7-c3ca860688f9@apertussolutions.com>
 <alpine.DEB.2.22.394.2307031048220.246273@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2307031048220.246273@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB7535:EE_|DBAEUR03FT040:EE_|DB4PR08MB9312:EE_
X-MS-Office365-Filtering-Correlation-Id: 776d9609-8886-4fd0-0ea5-08db7bfde736
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cG3RHMLqcfso/ZE1G/WIk+a+xRYleGvi+FChHiUJ9KNHa79A1PNcvPM/sAEzYiUKgKsiZJ9u8NZDrz1u99PTtQGWY9/Ufl3B4PQFeoB9vlUadUJLvdbCVmgIr6rOZ5tObM1U5PntOrwtJYXgvIwBkqEI3s5i0+FV3/ImNYpX9o2YPfrr6NFz1d9Xva+Mr19R1w+Lf0e2PunWHOVkAwuYZnkg4O1LKM9p8JlgRa5ojPN87pk31IWHF9QzP65ncmURE+LmE/RlWKIn5s7YBes0GH2J1rGPBXlxfBsnRWPpSOecEuC6zjdHML8bUb1+S/gl0fX8OSr7abxb0gNyord4n/+oaqjWO1+HIkpG4MBphpaYqfEeLwGYevGAEb4olpeUbX8ixnd9h89Q3Jlzkf7MtcMhlyYuODKQNgvxgpEE3dZoNqeSf1kXzu606ARwwf+trPmesv1/mO6j9Wyx5KH1qGJreUrJOA95ylVpcQLXy84r6iaBuaQ1A653WNIB1i9h7BT0wAMG3lu2nME/lpl2JNKInZF/Qlbvv/gphYyU94bsR1Pnqxsw0wvxxicEXmqwPwxnMljzN2UDEaF/haWJDSIl/jeo6Z3kuIC+KZxUav8pBv7bKk6A1RGmx2QrJiuGrMG3WCkAHkX8IHLWG0s7NhyMeIaHzklJULUUDfk4+KI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(26005)(478600001)(71200400001)(6506007)(6512007)(86362001)(2616005)(186003)(38100700002)(54906003)(4326008)(66946007)(66446008)(66556008)(66476007)(64756008)(83380400001)(110136005)(6486002)(53546011)(91956017)(76116006)(316002)(122000001)(5660300002)(8936002)(8676002)(7416002)(38070700005)(41300700001)(2906002)(33656002)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F61E11C4E7B85846958F339B76AC8BAE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7535
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f7da99a-2d8d-4180-3fb2-08db7bfdde2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i2030VVVvPvD8neoq6Ef6HaLwIzKlQ2SWJWeSwoYxMZ1mXvvLeorO1HRk1zptthMpP7HeJWo+fSTD1H3xonxWY4Kpn9lMLhh3St01y3GEJICgedyWzGCtGRWsBVDZIUsiNw24fYRWjHEmfLS1D0Vz8vs9usx/VgXLYujumlSdWuiloszKYXV/Mge10cvwuVYkvBJUCX+2Pe7/Dik53X8FxTrmFBtQbnUzz/m9SudGGAz/18Dtwbpr8tmyRupvct4a3XGMMrS/UmhUAAaRVDqSMk9DTk2H6hAiuge3JrbWpgVASyn2JhqCnIQEME5Kcz2RJAJYwkusx9Zi4DhU+iUgH/v6xGl9PDF/O9GM5p14yvxruDTJ9CLGnPUhySzaOJOJDqY6zefaG3V4R06IRDPOdp9aYtbvV7d86wRXCIjo49mp7dUZlmwjo6C66NfXjcJvD2mhJ3g+/Oi7xSpz76oCFsax5F06aSm0wVciK6G+mPkRytXR89HE1ih7td9km1wG6nt+A7QiDBco6KDrTyyJtv3NWvKk1IvXfPhmFZDR+VKtG53UX7akfQSBcjAFZR3xVZSxXZIifFbc7ID1pljkTbzLnk/6IjMRGiH5vLd3LiSNdW1TleoBskFAbwRO6CqvwMEDiJpoxYNy/N0CD3XVBWtK/gNStZUx2/ETpOtvhV/hhSKhNeL2xihZONWgMT7DP5oUMyIOIlrKFFB4rN8E9KZWWDiAccTw8jTmOiNwlVGAeU9mjoaOnVEbVizd7Ee50rDzA9naGn08ey5ipCgcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(26005)(6512007)(186003)(53546011)(33656002)(86362001)(8676002)(36756003)(2906002)(110136005)(8936002)(6486002)(5660300002)(40460700003)(41300700001)(478600001)(107886003)(6506007)(81166007)(40480700001)(4326008)(70586007)(356005)(70206006)(82740400003)(47076005)(2616005)(83380400001)(336012)(82310400005)(316002)(36860700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 19:44:23.8922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 776d9609-8886-4fd0-0ea5-08db7bfde736
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9312

DQoNCj4gT24gMyBKdWwgMjAyMywgYXQgMTg6NDgsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDMgSnVsIDIwMjMsIERhbmll
bCBQLiBTbWl0aCB3cm90ZToNCj4+IE9uIDcvMS8yMyAxMToxMywgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+Pj4gT24gMSBKdWwgMjAyMywgYXQgMDg6NTMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gT24gMzAvMDYvMjAyMyAxMDox
MiBhbSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+IFRoZSAiZG9tMGxlc3MiIGZlYXR1cmUg
d2FzIGludGVuZGVkIHRvIGJlIHRoZSBmZWF0dXJlIHdoZXJlIGEgZG9tVQ0KPj4+Pj4gZG9tYWlu
IGNvdWxkIGJlIGxhdW5jaGVkIHdpdGhvdXQgdGhlIGNvbnRyb2wgZG9tYWluIChEb20wKQ0KPj4+
Pj4gaW50ZXJ2ZW50aW9uLCBob3dldmVyIHRoZSBuYW1lIHNlZW1zIHRvIHN1Z2dlc3QgdGhhdCBE
b20wIGNhbm5vdA0KPj4+Pj4gYmUgcGFydCBvZiB0aGUgY29uZmlndXJhdGlvbiwgd2hpbGUgaW5z
dGVhZCBpdCdzIGEgcG9zc2libGUgdXNlIGNhc2UuDQo+Pj4+PiANCj4+Pj4+IFRvIGF2b2lkIHRo
YXQsIHJlbmFtZSB0aGUgImRvbTBsZXNzIiBjb25maWd1cmF0aW9uIHdpdGggdGhlIG5hbWUNCj4+
Pj4+ICJoeXBlcmxhdW5jaCIsIHRoYXQgaXMgbGVzcyBtaXNsZWFkaW5nLg0KPj4+Pj4gDQo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+
Pj4+PiAtLS0NCj4+Pj4+IFRoaXMgaXMgYW4gUkZDIHRvIGdldCB0aGUgZmVlbGluZyBvZiB0aGUg
Y29tbXVuaXR5IGFib3V0IHRoZSBuYW1lDQo+Pj4+PiBjaGFuZ2UsIGZvciBub3cgaXQncyBldmVy
eXRoaW5nIGluIG9uZSBwYXRjaCBqdXN0IHRvIHNlZSBob3cgaXQNCj4+Pj4+IHdpbGwgbG9vayBs
aWtlLCBpZiB0aGVyZSBpcyBpbnRlcmVzdCBvbiBwcm9jZWVkaW5nIGludG8gaXQsIEkgY2FuDQo+
Pj4+PiBzcGxpdCBpbiBtb3JlIGNvbW1pdC4NCj4+Pj4gDQo+Pj4+IEhhdmUgeW91IGRpc2N1c3Nl
ZCB0aGlzIHdpdGggRGFuIGFuZCBDaHJpcyBhdCBhbGw/ICBZb3UgaGF2ZW4ndCBldmVuDQo+Pj4+
IENDJ2QgdGhlbS4NCj4+PiANCj4+PiBObywgdGhpcyByZW5hbWUgaWRlYSBzdGFydGVkIGZyb20g
YSBjaGF0IGR1cmluZyB0aGUgc3VtbWl0LCBhbnl3YXkgSnVsaWVuDQo+Pj4gcHJvbXB0bHkgYWRk
IHRoZW0gdG8gdGhlIENDLCBiZWNhdXNlIEkgZm9yZ290Lg0KPj4gDQo+PiBObyB3b3JyaWVzIGFu
ZCB0aGFuayB5b3UgZm9yIGNvbnNpZGVyaW5nIGFuZCB0YWtpbmcgdGhlIHRpbWUgdG8gZG8gdGhp
cyBSRkMuDQo+PiBJdCBpcyBncmVhdGx5IGFwcHJlY2lhdGVkIHRoYXQgdGhlcmUgaXMgYSBzdHJv
bmcgd2lsbGluZ25lc3MgdG8gaGF2ZSBkb20wbGVzcw0KPj4gYW5kIGh5cGVybGF1bmNoIG1lcmdl
ZC4NCj4+IA0KPj4+PiANCj4+Pj4gV2hpbGUgdGhlcmUgaXMgYSBsb3Qgb2YgZW5kLWdvYWwgaW4g
Y29tbW9uIGJldHdlZW4gdGhlIGRvbTBsZXNzIGFuZA0KPj4+PiBoeXBlcmxhdW5jaCwgYW5kIHRo
YXQgdGhlIG5hbWUgZG9tMGxlc3MgaXMgZGVlcGx5IG1pc2xlYWRpbmcsDQo+Pj4+IGh5cGVybGF1
bmNoIGlzIHNwZWNpZmljYWxseSBub3QgdGhpcy4NCj4+PiANCj4+PiBZZXMgSHlwZXJsYXVuY2gg
aXMgbW9yZSB0aGFuIHRoaXMsIGhvd2V2ZXIgYXMgSSBzYWlkLCB3aXRoIHRoaXMgUkZDIEkgd291
bGQNCj4+PiBsaWtlDQo+Pj4gdG8gZWFyIG9waW5pb25zLCBARGFuaWVsIEBDaHJpc3RvcGhlciBj
b3VsZCBpdCBiZSBhIHByb3BlciBuYW1lIGZvciB0aGUNCj4+PiBkb20wbGVzcw0KPj4+IGZlYXR1
cmU/DQo+PiANCj4+IEFzIEFuZHkgaGFzIGFsbHVkZWQsIGh5cGVybGF1bmNoIGlzIG1lYW50IHRv
IHByb3ZpZGUgYSBmbGV4aWJsZSBtZWFucyB0bw0KPj4gaGFuZGxlIGRvbWFpbiBjb25zdHJ1Y3Rp
b24gYXQgYm9vdCB0byBtZWV0IGEgd2lkZSByYW5nZSBvZiBwb3NzaWJsZSB1c2UgY2FzZXMuDQo+
PiBPbmUgb2YgdGhvc2UgdXNlIGNhc2VzIGlzIGRvbTBsZXNzLCBzbyB5ZXMsIHVsdGltYXRlbHkg
d2hhdCBkb20wbGVzcyBkb2VzDQo+PiB0b2RheSB3aWxsIGJlIGFjaGlldmFibGUgdW5kZXIgaHlw
ZXJsYXVuY2guIE91ciBpbnRlbmRlZCBhcHByb2FjaCB0byBhbGlnbiB0aGUNCj4+IHR3byBpbXBs
ZW1lbnRhdGlvbnMgaXMgb25lIHRoYXQgaXMgbWVhbnQgdG8gYmUgbWluaW1hbGx5IGRpc3J1cHRp
dmUsIHNpbmNlDQo+PiBkb20wbGVzcyBpcyBjb25zaWRlcmVkIGEgc3VwcG9ydGVkIChTVVBQT1JU
Lm1kKSBjYXBhYmlsaXR5LiBBcyBtZW50aW9uZWQsIHdlDQo+PiBhcmUgZ3JlYXRseSBhcHByZWNp
YXRpdmUgdG8gdGhlIG9wZW5uZXNzIHRvIGFkb3B0IHRoZSBuYW1lLA0KPiANCj4gVGhhbmtzIERh
bmllbCENCj4gDQo+IA0KPj4gYnV0IGEgYmlnIGNvbmNlcm4NCj4+IEkgcGVyc29uYWxseSBoYXZl
IGlzIHRoZSBjb25mdXNpb24gaXQgY291bGQgY2F1c2UgYSBnZW5lcmFsIHVzZXIuIEEgYmxhbmtl
dA0KPj4gcmVuYW1lIHdvdWxkIGVuZCB1cCB3aXRoIHR3byBkb2N1bWVudHMgaW4gdGhlIGRvY3Mg
dHJlZSB0aGF0IHByb3ZpZGUgdHdvDQo+PiBkaWZmZXJlbnQgZXhwbGFuYXRpb25zIG9mIGh5cGVy
bGF1bmNoIGFuZCB0d28gZGlmZmVyZW50IGRldmljZSB0cmVlDQo+PiBkZWZpbml0aW9ucy4gU28g
SSB0aGluayBhIG1vcmUgbWVhc3VyZWQgYXBwcm9hY2ggc2hvdWxkIGJlIGNvbnNpZGVyZWQgaGVy
ZS4NCj4+IA0KPj4+IElmIHRoaXMgcGF0Y2ggbWFrZXMgdGhpbmdzIG1vcmUgZGlmZmljdWx0IGZv
ciB0aGUgSHlwZXJsdW5jaCBzZXJpZSwgSeKAmW0gb2sNCj4+PiB0byBkcm9wIGl0LA0KPj4+IG15
IG9ubHkgYWltIHdhcyBqdXN0IHRvIGZpbmQgYSBsZXNzIG1pc2xlYWRpbmcgbmFtZSBmb3IgdGhl
IGZlYXR1cmUuDQo+PiANCj4+IFdoYXQgSSB3b3VsZCBsaWtlIHRvIHN1Z2dlc3QgYXMgYSBnb29k
IGZpcnN0IHN0ZXAgd291bGQgYmUgYW4gdXBkYXRlIHRvIHRoZQ0KPj4gZG9tMGxlc3MgZG9jdW1l
bnQuIFByb3ZpZGUgYSBub3RlIGF0IHRoZSBiZWdpbm5pbmcgdGhhdCBwb2ludHMgdG8gdGhlDQo+
PiBoeXBlcmxhdW5jaCBkZXNpZ24gZG9jIGFzIGEgbW9yZSBnZW5lcmFsIGFwcHJvYWNoIHRoYXQg
d2lsbCBldmVudHVhbGx5IHN1YnN1bWUNCj4+IGRvbTBsZXNzLiBUaGlzIHdvdWxkIHByb3ZpZGUg
YSBnZW50bGVyIHRyYW5zaXRpb24gZm9yIGV4aXN0IHVzZXJzIG9mIGRvbTBsZXNzLg0KPj4gDQo+
PiBJZiBpdCBpcyBub3QgdG9vIG11Y2gsIEkgd291bGQgYWxzbyBhc2ssIHBsZWFzZSBoYXZlIGEg
bG9vayBhdCB0aGUgZGVzaWduIGZvcg0KPj4gYm9vdCBtb2R1bGVzIGluIHRoZSBzZXJpZXMgQ2hy
aXN0b3BoZXIganVzdCBwb3N0ZWQuIFRoZSBkZXNpZ24gcHVsbHMgZnJvbSB0aGUNCj4+IHdvcmsg
ZG9uZSBieSBkb20wbGVzcyBhbmQgZXhwYW5kZWQgdXBvbiBpdC4gSSBtYWpvciBzdGVwIGludG8g
bWVyZ2luZyB0aGUgdHdvDQo+PiBjYXBhYmlsaXRpZXMgd2lsbCBiZSB0byBoYXZlIGEgY29tbW9u
IHNldCBvZiBzdHJ1Y3R1cmVzLiBPbmNlIHRob3NlIGFyZSBpbg0KPj4gcGxhY2UsIHdlIGNhbiBt
b3ZlIHRvIGEgY29tbW9uIGRldmljZSB0cmVlIHJlcHJlc2VudGF0aW9uLCBhbmQgYXQgdGhhdCBw
b2ludA0KPj4gd2Ugd291bGQgYmUgZmFpcmx5IGNsb3NlLCBpZiBub3QgYXQgdGhlIHBvaW50IG9m
IGEgZm9ybWFsIG1lcmdlciBvZiBiZXR3ZWVuDQo+PiB0aGUgdHdvLg0KPiANCj4gQXQgdGhlIG1v
bWVudCB3ZSBoYXZlIGEgY29uY3JldGUgcHJvYmxlbSB3aXRoIGV4cGxhaW5pbmcgZG9tMGxlc3Mg
YW5kDQo+IGh5cGVybGF1bmNoIHRvIHBvdGVudGlhbCBuZXcgdXNlcnMuIFVzaW5nIHR3byBkaWZm
ZXJlbnQgbmFtZXMgZm9yIGENCj4gc2ltaWxhciBmZWF0dXJlIG9uIGFybSBhbmQgeDg2IGNhdXNl
cyBjb25mdXNpb24uIEl0IGlzIGh1cnRpbmcgWGVuIGFzIGENCj4gc29sdXRpb24uIFBlcnNvbmFs
bHkgSSBhbHJlYWR5IGhhZCB0byBzd2l0Y2ggdG8gdXNlIHRoZSB3b3JkDQo+ICJoeXBlcmxhdW5j
aCIgZm9yIGV2ZXJ5dGhpbmcgaW4gbXkgdXNlcnMtZmFjaW5nIHByZXNlbnRhdGlvbnMuDQo+IA0K
PiBBdCB0aGUgc3VtbWl0LCB3ZSBkaXNjdXNzZWQgdGhhdCBpdCB3b3VsZCBiZSBhIGdvb2QgaWRl
YSB0byB1c2UgYSBzaW5nbGUNCj4gbmFtZSB0byByZWZlciB0byBib3RoIGZlYXR1cmVzIG9uIGFy
bSBhbmQgeDg2LiBHaXZlbiB0aGF0ICJkb20wbGVzcyINCj4gY2F1c2VzIGFkZGl0aW9uYWwgaXNz
dWVzIGJlY2F1c2UgaXQgbWFrZXMgcGVvcGxlIHRoaW5rIHRoYXQgdGhlcmUgaXMgbm8NCj4gRG9t
MCwgdGhlIHN1Z2dlc3Rpb24gd2FzIHRvIHVzZSAiaHlwZXJsYXVuY2giIHRvIHJlZmVyIHRvIGJv
dGggZmVhdHVyZXMuDQo+IA0KPiBXZSBkb24ndCBuZWVkIHRvIDEwMCUgYWxpZ24gdGhlIHR3byBp
bXBsZW1lbnRhdGlvbnMgYW5kIGRhdGEgc3RydWN0dXJlcy4NCj4gVGhpcyBpcyBub3QgZm9yIGVu
Z2luZWVycyB0aGF0IGFyZSBnb2luZyB0byBsb29rIGF0IHRoZSBzcGVjaWZpY2F0aW9ucw0KPiBh
bmQgaW1wcm92ZSB0aGVtLiBUaGlzIGlzIGZvciB1c2Vycy9jdXN0b21lcnMgb2YgWGVuIHRoYXQg
YXJlIHRyeWluZyB0bw0KPiB1bmRlcnN0YW5kIHdoYXQgdGhlIGh5cGVydmlzb3IgZW5hYmxlcyB0
aGVtIHRvIGRvLiBXZSBuZWVkIHRvIGJlIGFibGUgdG8NCj4gc2hvdyB1c2VycyBhcmNoaXRlY3R1
cmUgc2xpZGVzIHdpdGggdGhlIHNhbWUgbmFtZSBhbmQgZXhwbGFuYXRpb24gb24NCj4gYm90aCBB
Uk0gYW5kIHg4Ni4NCj4gDQo+IEkgYW0gc3VyZSB0aGF0IERhbmllbCBhbmQgQ2hyaXN0b3BoZXIg
cmVtZW1iZXIsIGJ1dCBmb3IgdGhlIG90aGVycyBvbg0KPiB0aGlzIGVtYWlsIHRocmVhZCwgdGhl
IG5hbWUgImh5cGVybGF1bmNoIiB3YXMgYm9ybiBleGFjdGx5IHRvIGJlIHRoYXQ6DQo+IHRoZSBv
bmUgbmFtZSB0byBjb3ZlciBib3RoIGZlYXR1cmVzIG9uIEFSTSBhbmQgeDg2IGV2ZW4gaWYgdGhl
eSBoYXZlIGENCj4gZGlmZmVyZW50IGltcGxlbWVudGF0aW9uLiBBcHBlbmRlZCBhbiBvbGQgZW1h
aWwgZm9yIHJlZmVyZW5jZS4NCj4gDQo+IEFsc28gSSBhZ3JlZSB3aXRoIERhbmllbCB0aGF0IHdl
IG5lZWQgdG8gYmUgY2FyZWZ1bCBhYm91dCB0aGUgdHdvIGRvY3MNCj4gdW5kZXIgZG9jcy8uIEkg
dGhpbmsgaGUgaXMgcmlnaHQgd2UgbmVlZCB0byBhZGQgYSBwYXJhZ3JhcGggZXhwbGFpbmluZw0K
PiB0aGUgaGlzdG9yeSBhbmQgYSBwb2ludGVyIHRvIHRoZSBvdGhlciBkb2N1bWVudC4gU29tZXRo
aW5nIGxpa2U6DQo+IA0KPiAiRG9tMGxlc3MgaXMgdGhlIG5hbWUgdGhhdCB3YXMgdXNlZCB3aGVu
IGluaXRpYWxseSBpbnRyb2R1Y2luZyB0aGUNCj4gZmVhdHVyZSBvbiBBUk0uIFRoZW4sIHRoZSAi
ZG9tMGxlc3MiIG5hbWUgd2FzIHJldGlyZWQgaW4gZmF2b3Igb2YNCj4gImh5cGVybGF1bmNoIiB0
byBhdm9pZCBjb25mdXNpb24gKGEgRG9tMCBtaWdodCBzdGlsbCBiZSBwcmVzZW50KSBhbmQgdG8N
Cj4gYWxpZ24gd2l0aCB4ODYgKHdoZXJlIGEgc2ltaWxhciBmZWF0dXJlIHdhcyBjYWxsZWQgaHlw
ZXJsYXVuY2ggZnJvbSB0aGUNCj4gc3RhcnQpLiINCg0KSeKAmW0gZnVsbHkgb2sgdG8gYWRkIGEg
c2VjdGlvbiBsaWtlIHRoaXMgcG9pbnRpbmcgdG8gdGhlIEh5cGVybGF1bmNoIGRlc2lnbi4NCg0K
QERhbmllbCBhbmQgQENocmlzdG9waGVyIHdvdWxkIGl0IGJlIG9rIGZvciB5b3Ugb3IgdGhlIGNo
YW5nZXMgaW4gdGhlIHNlcmllDQphcmUgZ29pbmcgdG8gYmUgcHJvYmxlbWF0aWMgZm9yIHlvdXIg
ZnV0dXJlIHdvcms/IEluIHRoZSBlbmQgaXTigJlzIGp1c3QgYSBtZWNoYW5pY2FsDQpyZW5hbWUs
IHNvIEkgZ3Vlc3Mgd2UganVzdCBuZWVkIHRvIGFncmVlIG9uIG5hbWluZyBjb252ZW50aW9ucy4N
Cg0KQ2hlZXJzLA0KTHVjYQ0KDQo+IA0KPiANCj4gLS0tDQo+IA0KPiBTdWJqZWN0OiBbUkZQXSBP
dmVyYXJjaGluZyBuYW1lIGZvciBkb20wbGVzcyBhbmQgRG9tQg0KPiANCj4gR3JlZXRpbmdzLA0K
PiANCj4gQXQgdGhlIERldmljZVRyZWUvRG9tQiBtZWV0aW5nIGl0IHdhcyBwcm9wb3NlZCB0aGF0
IGEgbmV3LCBsYXJnZXINCj4gb3ZlcmFyY2hpbmcgbmFtZSB1bmRlciB3aGljaCBEb21CIGFuZCBk
b20wbGVzcyB3b3VsZCBiZSBjb3ZlcmVkLiBUaGVyZQ0KPiB3YXMgYSBnZW5lcmFsIG9wZW5uZXNz
IHRvIHRoZSBpZGVhLiBBcyBzdWNoLCBzaW5jZSBDaHJpc3RvcGhlciBhbmQNCj4gbXlzZWxmIGFy
ZSBpbiB0aGUgbWlkc3Qgb2YgZmluYWxpemluZyB0aGUgZGVzaWduIGRvY3VtZW50IGZvciBEb21C
IHdlDQo+IGZlbHQgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIHNlZSBpZiBhIG5hbWUgY291bGQgYmUg
c2VsZWN0ZWQgd2hpY2ggd2UNCj4gY291bGQgdXNlIGluIHRoZSBkZXNpZ24gZG9jIGluIGxpZXUg
b2YgRG9tQi4gQXMgYWx3YXlzIG5hbWluZyB0aGluZ3MgaXMNCj4gaGFyZCwgYnV0IGFmdGVyIHNv
bWUgYnJhaW5zdG9ybWluZyB3ZSBiZWxpZXZlIHdlIGhhdmUgYXJyaXZlZCBhdCBhDQo+IGRlY2Vu
dCBuYW1lLCDOvExhdW5jaCAobWljcm8tTGF1bmNoIG9yIHVMYXVuY2gpLg0KPiANCj4gLS0tDQo+
IA0KPiDOvExhdW5jaCBiZWNhbWUgaHlwZXJsYXVuY2ggZmV3IGRheXMgYWZ0ZXIsIGFuZCB0aGUg
cmVzdCB3YXMgaGlzdG9yeSA6LSkNCg0KDQo=

