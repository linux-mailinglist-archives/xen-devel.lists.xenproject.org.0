Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E1476E66
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247823.427387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnW5-0001Bi-Sl; Thu, 16 Dec 2021 09:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247823.427387; Thu, 16 Dec 2021 09:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnW5-00018y-Pd; Thu, 16 Dec 2021 09:57:37 +0000
Received: by outflank-mailman (input) for mailman id 247823;
 Thu, 16 Dec 2021 09:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HYuw=RB=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mxnW3-00018s-Bn
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:57:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a586dd-5e56-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:57:33 +0100 (CET)
Received: from DU2P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::25)
 by AS8PR08MB6040.eurprd08.prod.outlook.com (2603:10a6:20b:296::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 09:57:31 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::e0) by DU2P251CA0010.outlook.office365.com
 (2603:10a6:10:230::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Thu, 16 Dec 2021 09:57:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 16 Dec 2021 09:57:31 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Thu, 16 Dec 2021 09:57:31 +0000
Received: from 399ba925db51.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41B3BAEC-D6B9-4A09-A416-64FF89A5630F.1; 
 Thu, 16 Dec 2021 09:57:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 399ba925db51.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Dec 2021 09:57:17 +0000
Received: from AM9PR08MB6914.eurprd08.prod.outlook.com (2603:10a6:20b:307::13)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 09:57:14 +0000
Received: from AM9PR08MB6914.eurprd08.prod.outlook.com
 ([fe80::b1d3:4778:2574:bc13]) by AM9PR08MB6914.eurprd08.prod.outlook.com
 ([fe80::b1d3:4778:2574:bc13%6]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 09:57:13 +0000
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
X-Inumbo-ID: 96a586dd-5e56-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTr32IhtOpI0DMpewFFRmpDZYkBAEYJFzNkVsLqr4Vo=;
 b=b4wccVPn8RbiyyqvGmw3OQeeaaVuDiQH4/R7X3L4lCseop5Q5N/SoCtIGhIe4QGjeCGgRcEl2xTJShlqAxDQB+xWguh53IJfkvzCU/fqQnZQXlfsv8yOIj65VpSStqp0GAdRqITy6csZaP2gi7QMm/bWck8Ic3s1PDk4KB+DkMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d427460f0eb312dc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHgyW0b2kYbl9iU1N/378vCB2F5KIKh6LMd4fbVpau8HZNY4+7/W7RZoqZ7I1Qr2R4Q8WipzhFKxJ0sUvjT+kRQfbsJ2/ofmM7QLWsaeQWPKuNLq34eA4C3wbqBmIGOwVYfiryJ+m0pmznXgBUgtzVHqNqFX0qmOdWKojwRaU+5Ub1liyJv2Ez1Ex+Rd79saxOVCTKiJti3AF+WStrW57cgRtjLxUGLTVs+iRqhRDx0mfhn94pl6TJ5KaeoiCNknV6s1e6Bw/8w+4QW0+k98Ayij2f7kj/0ggRQss1wOrIYFBnbGrmAzp0mpmouqAWnvrDzxkZuOIjuv3zdGNpCaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTr32IhtOpI0DMpewFFRmpDZYkBAEYJFzNkVsLqr4Vo=;
 b=ZthYkBKGwRtTCOVKOI8banh++mjs5dqjuqL/J/ck9Aow5RCA08n1j/SYNKWmF/DuCDwjgL/Sn7tRZQ30emqHTaiCOBdntfMjKXYsH/gpg88JwGgMjR6QJUrFiBf9q9jNZItqiKC9VehkSQxLjDkoIS/1lWE6BBW/caZupuzY/oZw9ee5VN+PaOE4l2tO6/njdxjUGMozoKvph+GUcEu/ixJn+zOWC5VoqjhBC+QUeQi9Wteu088ziVwxK3Rcy6Kld+8gPREos8sge2wxbB5ZNOC3PBsJPYqqCKZ7w8MRXSbwOHadLVFewCswxs03abJBMG8WK7WST4hs+f+RqAUwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTr32IhtOpI0DMpewFFRmpDZYkBAEYJFzNkVsLqr4Vo=;
 b=b4wccVPn8RbiyyqvGmw3OQeeaaVuDiQH4/R7X3L4lCseop5Q5N/SoCtIGhIe4QGjeCGgRcEl2xTJShlqAxDQB+xWguh53IJfkvzCU/fqQnZQXlfsv8yOIj65VpSStqp0GAdRqITy6csZaP2gi7QMm/bWck8Ic3s1PDk4KB+DkMM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
Thread-Topic: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
Thread-Index: AQHX8NfE0k+LAAwoDUiQfCEULp9EE6w0aQgAgAB74AA=
Date: Thu, 16 Dec 2021 09:57:13 +0000
Message-ID: <AA684EED-5631-4036-ABF1-596AD61787CC@arm.com>
References:
 <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2112151817190.3376@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2112151817190.3376@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4a7ddaba-a9ee-48bf-4506-08d9c07a79df
x-ms-traffictypediagnostic:
	AM8PR08MB5732:EE_|DB5EUR03FT038:EE_|AS8PR08MB6040:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB60405880A0F3F20171AA5DA1FC779@AS8PR08MB6040.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RoJO0tnm6ixlukKfu8dopoHPi0mvk8AoRblBvr7DvRvfASpOe3z6ZV28pt2nuvC3nhlwMy2d7iTX276DuH3qZWQWRN1vb+bouuW8NtAOp7mDqm35PvMcQMBRf41zcEGkrzXsJAEKy7W8JioqeXfAOyI3mHqKWF7bCOmPWTO6G3gz1z6ZojPPnhhydkprYTPq4EVsQ1n672Y3jCMZy9FABcVV9PdhNCuBqVhdgTeMJVLL1pzeuoqnAJRK/dkITVjaR4CH9j1ED5Ik7iHdm7DFv04JRF9oU4C6kX4qOshUYH5TjEJBgBkfrjKZ8maAX5pANBh5Ef1aNK0NIvUYSRqUgDW6usj9bFOPFbZR0P8u3wqvSX029hdROp6Ejp6kta90iZ8FrBWekT76JWyIQil7AdGNM+BpC0a+9sO8HQVy/H2y7yRnKvWAacyj+wr19q8CSMinDu5iyaGL0eDswAhLV0LVUWYVxxyLPwqyov2jlrnq8Mj3Nj9pfzdaGXWiCWXqSAuITeSFjWIvfz4w9qByCWT8aDBa+yypQqrysdYbQNU1Ac/jB67tukD+Ii9v97scP9ATsfEIq3tdICrweT5/aAKdiHKCmujpDpLEfJ5rhrg3LLjtqdWU+CJKQdDhfBiUlslFqJRVktY24vOIw0+XLQzGiOiaNeJaDsifWdIpNwf/SlujtDzn9wZok7QkWGO17C+egZXM6N63eN1eNh2KoP5u6zrFKZol4Yv5U5p9KnXHZaqMAjjmBSE1QjsAbtJN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6914.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(2906002)(316002)(6916009)(186003)(36756003)(122000001)(2616005)(6486002)(6506007)(53546011)(4326008)(91956017)(26005)(76116006)(66946007)(508600001)(66476007)(66556008)(6512007)(8936002)(66446008)(54906003)(64756008)(83380400001)(86362001)(71200400001)(5660300002)(38070700005)(33656002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <401A4A3CA823174081EF4121D7ADE7AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a0c412b-6ec8-4bde-d7b5-08d9c07a6f34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7YPQ+pErUDPmgYMw1x9Qaj5jM2gKiaJggUXmKuEpkjcFZlRhsgEZJlfLAQ+kO0JiwAurDGrkhBC3ulxnv1/GdMIOqc0p//9/zzLjgtAj5+zDkEVBZMYDnVfW7RTyAdYCO+lrFoWS3KqaIfjH5qeoGCB5nZljUAuo6kSWcdXyX6m05Qz96pBadM5tfGE5GG1cpROg3/Gw3K1ABAzsOC7E1FFNiU5/Fe9tiIzxifNNKSFyKahsxLEj/crSl2DzL/WIVnxQgwuV9pxGSUhVRwFrIOvoxZQUX3lMRyLVnh6qsUsconLFA7n2k28QxJL1FuUDyz36ssapdb8tCEJiiGUCvlanDuvQi31aVbtCBgz2cmstOZAIGUpUTl9LziiTVRVAv2ZM2Ab9DON/uLBqVLZXuJTtDUM3PYityvkRobRd0dh12LkKM1c+rCqLoGM/8zi25ffj+Z08NfSGqh/sBjDJC38S7hiFCSEBLM5CV2ah420AlrUFc2CPYyM8UiRIOMTvqFaWJOxk3w4RDRDA9njssoB2zCLoPz0PcSzv/4IOnfsGWDLOHaWFvDdpILQncEBTIqfIl5AFaY7PKcyqutseptmySFi7CzYHbdCsoHtn53UdsZX/JDPTD+RyJ0uEnlQVgbVbLxooddU3lWvxjSTi1Wh3YBF77/rpCF5hNocL02885IgwOMoSO1WNPltEb+ELewkdE/r1NbUMAqGbO56TOyI5UdxpMHYfz4xSFIBUuX9ro3aUiturSo+EjT7Z/9XUKyh01CwotXov5peFHZDhEw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(54906003)(36756003)(356005)(2616005)(5660300002)(33656002)(36860700001)(86362001)(4326008)(82310400004)(6862004)(107886003)(186003)(40460700001)(336012)(2906002)(83380400001)(47076005)(6506007)(26005)(53546011)(81166007)(8676002)(8936002)(508600001)(6512007)(316002)(6486002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 09:57:31.2759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7ddaba-a9ee-48bf-4506-08d9c07a79df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6040

SGkgU3RlZmFubywNCg0KPiBPbiAxNiBEZWMgMjAyMSwgYXQgMjozMyBhbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMTQg
RGVjIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSU8gcG9ydHMgb24gQVJNIGRvbid0IGV4
aXN0IHNvIGFsbCBJTyBwb3J0cyByZWxhdGVkIGh5cGVyY2FsbHMgYXJlIGdvaW5nDQo+PiB0byBm
YWlsIG9uIEFSTSB3aGVuIHdlIHBhc3N0aHJvdWdoIGEgUENJIGRldmljZS4NCj4+IEZhaWx1cmUg
b2YgeGNfZG9tYWluX2lvcG9ydF9wZXJtaXNzaW9uKC4uKSB3b3VsZCB0dXJuIGludG8gYSBjcml0
aWNhbA0KPj4gZmFpbHVyZSBhdCBkb21haW4gY3JlYXRpb24uIFdlIG5lZWQgdG8gYXZvaWQgdGhp
cyBvdXRjb21lLCBpbnN0ZWFkIHdlDQo+PiB3YW50IHRvIGNvbnRpbnVlIHdpdGggZG9tYWluIGNy
ZWF0aW9uIGFzIG5vcm1hbCBldmVuIGlmDQo+PiB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24o
Li4pIGZhaWxzLiBYRU5fRE9NQ1RMX2lvcG9ydF9wZXJtaXNzaW9uDQo+PiBpcyBub3QgaW1wbGVt
ZW50ZWQgb24gQVJNIHNvIGl0IHdvdWxkIHJldHVybiAtRU5PU1lTLg0KPj4gDQo+PiBUbyBzb2x2
ZSBhYm92ZSBpc3N1ZSByZW1vdmUgUENJIEkvTyByYW5nZXMgcHJvcGVydHkgdmFsdWUgZnJvbSBk
b20wDQo+PiBkZXZpY2UgdHJlZSBub2RlIHNvIHRoYXQgZG9tMCBsaW51eCB3aWxsIG5vdCBhbGxv
Y2F0ZSBJL08gc3BhY2UgZm9yIFBDSQ0KPj4gZGV2aWNlcyBpZiBwY2ktcGFzc3Rocm91Z2ggaXMg
ZW5hYmxlZC4NCj4+IA0KPj4gQW5vdGhlciB2YWxpZCByZWFzb24gdG8gcmVtb3ZlIEkvTyByYW5n
ZXMgaXMgdGhhdCBQQ0kgSS9PIHNwYWNlIGFyZSBub3QNCj4+IG1hcHBlZCB0byBkb20wIHdoZW4g
UENJIHBhc3N0aHJvdWdoIGlzIGVuYWJsZWQsIGFsc28gdGhlcmUgaXMgbm8gdnBjaQ0KPj4gdHJh
cCBoYW5kbGVyIHJlZ2lzdGVyIGZvciBJTyBiYXIuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJh
aHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgICB8IDE0ICsrKysrKysNCj4+IHhlbi9jb21tb24vZGV2aWNlX3RyZWUu
YyAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IHhlbi9p
bmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgMTAgKysrKysNCj4+IDMgZmlsZXMgY2hhbmdlZCwg
OTYgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCBkMDJiYWNi
Y2QxLi42MGY2YjJjNzNiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IEBAIC03NDksNiAr
NzQ5LDExIEBAIHN0YXRpYyBpbnQgX19pbml0IHdyaXRlX3Byb3BlcnRpZXMoc3RydWN0IGRvbWFp
biAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4+ICAgICAgICAgICAgICAgICBjb250
aW51ZTsNCj4+ICAgICAgICAgfQ0KPj4gDQo+PiArICAgICAgICBpZiAoIGlzX3BjaV9wYXNzdGhy
b3VnaF9lbmFibGVkKCkgJiYNCj4+ICsgICAgICAgICAgICAgICAgZHRfZGV2aWNlX3R5cGVfaXNf
ZXF1YWwobm9kZSwgInBjaSIpICkNCj4+ICsgICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X25h
bWVfaXNfZXF1YWwocHJvcCwgInJhbmdlcyIpICkNCj4+ICsgICAgICAgICAgICAgICAgY29udGlu
dWU7DQo+IA0KPiBJdCBsb29rcyBsaWtlIHdlIGFyZSBza2lwcGluZyB0aGUgInJhbmdlcyIgcHJv
cGVydHkgZW50aXJlbHkgZm9yIHRoZSBQQ0kNCj4gbm9kZSwgaXMgdGhhdCByaWdodD8gV291bGRu
J3QgdGhhdCBhbHNvIHJlbW92ZSB0aGUgb3RoZXIgKG5vdCBpb3BvcnRzKQ0KPiBhZGRyZXNzIHJh
bmdlcz8NCg0KV2UgYXJlIHNraXBwaW5nIHRoZSDigJxyYW5nZXPigJ0gcHJvcGVydHkgaGVyZSB0
byBhdm9pZCBzZXR0aW5nIHRoZSDigJxyYW5nZXPigJ0gcHJvcGVydHkgd2hlbg0KcGNpX3Bhc3N0
aHJvdWdoIGlzIGVuYWJsZWQuIFdlIHdpbGwgcmVtb3ZlIG9ubHkgcmVtb3ZlIElPIHBvcnQgYW5k
IHNldCB0aGUgb3RoZXIg4oCYcmFuZ2Vz4oCdIHByb3BlcnR5IA0KdmFsdWUgaW4gZHRfcGNpX3Jl
bW92ZV9pb19yYW5nZXMoKSBpbiBuZXh0IGlmKCkgY29uZGl0aW9uLg0KIA0KDQo+PiAgICAgICAg
IHJlcyA9IGZkdF9wcm9wZXJ0eShraW5mby0+ZmR0LCBwcm9wLT5uYW1lLCBwcm9wX2RhdGEsIHBy
b3BfbGVuKTsNCj4+IA0KPj4gICAgICAgICBpZiAoIHJlcyApDQo+PiBAQCAtNzY5LDYgKzc3NCwx
NSBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiAgICAgICAgICAgICBpZiAoIHJlcyApDQo+
PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJlczsNCj4+ICAgICAgICAgfQ0KPj4gKw0KPj4gKyAg
ICAgICAgLyoNCj4+ICsgICAgICAgICAqIFBDSSBJTyBiYXIgYXJlIG5vdCBtYXBwZWQgdG8gZG9t
MCB3aGVuIFBDSSBwYXNzdGhyb3VnaCBpcyBlbmFibGVkLA0KPj4gKyAgICAgICAgICogYWxzbyB0
aGVyZSBpcyBubyB0cmFwIGhhbmRsZXIgcmVnaXN0ZXJlZCBmb3IgSU8gYmFyIHRoZXJlZm9yIHJl
bW92ZQ0KPj4gKyAgICAgICAgICogdGhlIElPIHJhbmdlIHByb3BlcnR5IGZyb20gdGhlIGRldmlj
ZSB0cmVlIG5vZGUgZm9yIGRvbTAuDQo+PiArICAgICAgICAgKi8NCj4+ICsgICAgICAgIHJlcyA9
IGR0X3BjaV9yZW1vdmVfaW9fcmFuZ2VzKGtpbmZvLT5mZHQsIG5vZGUpOw0KPj4gKyAgICAgICAg
aWYgKCByZXMgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByZXM7DQo+IA0KPiBJIHRyaWVkIHRv
IGFwcGx5IHRoaXMgcGF0Y2ggdG8gc3RhZ2luZyB0byBtYWtlIGl0IGVhc2llciB0byByZXZpZXcg
YnV0IEkNCj4gdGhpbmsgdGhpcyBjaHVjayBnb3QgYXBwbGllZCB3cm9uZ2x5OiBJIGNhbiBzZWUN
Cj4gZHRfcGNpX3JlbW92ZV9pb19yYW5nZXMoKSBhZGRlZCB0byB0aGUgZnVuY3Rpb24gImhhbmRs
ZV9wcm9wX3BmZHQiIHdoaWNoDQo+IGlzIGZvciBndWVzdCBwYXJ0aWFsIERUQnMgYW5kIG5vdCBm
b3IgZG9tMC4NCg0KT2xla3NhbmRy4oCZcyBwYXRjaCBzZXJpZXMgd2FzIG1lcmdlZCB5ZXN0ZXJk
YXkgYmVjYXVzZSBvZiB0aGF0IHRoZXJlIGlzIGNvbmZsaWN0IGluIGFwcGx5aW5nIA0KdGhpcyBw
YXRjaC4gSSB3aWxsIHJlYmFzZSB0aGUgcGF0Y2ggYW5kIHdpbGwgc2VuZCBpdCBhZ2FpbiBmb3Ig
cmV2aWV3Lg0KDQo+IA0KPiBJcyBkdF9wY2lfcmVtb3ZlX2lvX3JhbmdlcygpIG1lYW50IHRvIGJl
IGNhbGxlZCBmcm9tIHdyaXRlX3Byb3BlcnRpZXMNCj4gaW5zdGVhZD8gSXQgbG9va3MgbGlrZSBp
dCB3b3VsZCBiZSBiZXN0IHRvIGNhbGwgaXQgZnJvbQ0KPiB3cml0ZV9wcm9wZXJ0aWVzLCBtYXli
ZSBpdCBjb3VsZCBiZSBjb21iaW5lZCB3aXRoIHRoZSBvdGhlciBuZXcgY2hlY2sNCj4ganVzdCBh
Ym92ZSBpbiB0aGlzIHBhdGNoPw0KDQpZZXMgZHRfcGNpX3JlbW92ZV9pb19yYW5nZXMoKSBpcyB0
byBiZSBjYWxsZWQgZnJvbSB3cml0ZV9wcm9wZXJ0aWVzKCkuDQoNClJlZ2FyZHMsDQpSYWh1bA0K
PiANCj4gDQo+PiAgICAgLyoNCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZV90cmVl
LmMgYi94ZW4vY29tbW9uL2RldmljZV90cmVlLmMNCj4+IGluZGV4IDRhYWUyODFlODkuLjlmYTI1
ZjY3MjMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL2RldmljZV90cmVlLmMNCj4+ICsrKyBi
L3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KPj4gQEAgLTIxOTUsNiArMjE5NSw3OCBAQCBpbnQg
ZHRfZ2V0X3BjaV9kb21haW5fbnIoc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlKQ0KPj4gICAg
IHJldHVybiAodTE2KWRvbWFpbjsNCj4+IH0NCj4+IA0KPj4gK2ludCBkdF9wY2lfcmVtb3ZlX2lv
X3Jhbmdlcyh2b2lkICpmZHQsIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPj4g
K3sNCj4+ICsgICAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpwYXJlbnQgPSBOVUxMOw0K
Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZHRfYnVzICpidXMsICpwYnVzOw0KPj4gKyAgICB1bnNpZ25l
ZCBpbnQgcmxlbjsNCj4+ICsgICAgaW50IG5hLCBucywgcG5hLCBwbnMsIHJvbmUsIHJldDsNCj4+
ICsgICAgY29uc3QgX19iZTMyICpyYW5nZXM7DQo+PiArICAgIF9fYmUzMiByZWdzWygoR1VFU1Rf
Uk9PVF9BRERSRVNTX0NFTExTICogMikgKyBHVUVTVF9ST09UX1NJWkVfQ0VMTFMgKyAxKQ0KPj4g
KyAgICAgICAgICAgICAgICogMl07DQo+PiArICAgIF9fYmUzMiAqYWRkciA9ICZyZWdzWzBdOw0K
Pj4gKw0KPj4gKyAgICBidXMgPSBkdF9tYXRjaF9idXMoZGV2KTsNCj4+ICsgICAgaWYgKCAhYnVz
ICkNCj4+ICsgICAgICAgIHJldHVybiAwOyAvKiBkZXZpY2UgaXMgbm90IGEgYnVzICovDQo+PiAr
DQo+PiArICAgIHBhcmVudCA9IGR0X2dldF9wYXJlbnQoZGV2KTsNCj4+ICsgICAgaWYgKCBwYXJl
bnQgPT0gTlVMTCApDQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsNCj4+ICsgICAg
cmFuZ2VzID0gZHRfZ2V0X3Byb3BlcnR5KGRldiwgInJhbmdlcyIsICZybGVuKTsNCj4+ICsgICAg
aWYgKCByYW5nZXMgPT0gTlVMTCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICJEVDogbm8gcmFuZ2VzOyBjYW5ub3QgZW51bWVyYXRlICVzXG4iLA0KPj4gKyAgICAg
ICAgICAgICAgIGRldi0+ZnVsbF9uYW1lKTsNCj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
Pj4gKyAgICB9DQo+PiArICAgIGlmICggcmxlbiA9PSAwICkgLyogTm90aGluZyB0byBkbyAqLw0K
Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIGJ1cy0+Y291bnRfY2VsbHMoZGV2
LCAmbmEsICZucyk7DQo+PiArICAgIGlmICggIURUX0NIRUNLX0NPVU5UUyhuYSwgbnMpICkNCj4+
ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgImR0X3BhcnNlOiBCYWQgY2Vs
bCBjb3VudCBmb3IgZGV2aWNlICVzXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgIGRldi0+ZnVs
bF9uYW1lKTsNCj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICB9DQo+PiArICAg
IHBidXMgPSBkdF9tYXRjaF9idXMocGFyZW50KTsNCj4+ICsgICAgaWYgKCBwYnVzID09IE5VTEwg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwcmludGsoIkRUOiAlcyBpcyBub3QgYSB2YWxpZCBi
dXNcbiIsIHBhcmVudC0+ZnVsbF9uYW1lKTsNCj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIHBidXMtPmNvdW50X2NlbGxzKGRldiwgJnBuYSwgJnBu
cyk7DQo+PiArICAgIGlmICggIURUX0NIRUNLX0NPVU5UUyhwbmEsIHBucykgKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZHRfcGFyc2U6IEJhZCBjZWxsIGNvdW50
IGZvciBwYXJlbnQgJXNcbiIsDQo+PiArICAgICAgICAgICAgICAgZGV2LT5mdWxsX25hbWUpOw0K
Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4+ICsgICAgLyogTm93IHdh
bGsgdGhyb3VnaCB0aGUgcmFuZ2VzICovDQo+PiArICAgIHJsZW4gLz0gNDsNCj4+ICsgICAgcm9u
ZSA9IG5hICsgcG5hICsgbnM7DQo+PiArDQo+PiArICAgIGZvciAoIDsgcmxlbiA+PSByb25lOyBy
bGVuIC09IHJvbmUsIHJhbmdlcyArPSByb25lICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdW5z
aWduZWQgaW50IGZsYWdzID0gYnVzLT5nZXRfZmxhZ3MocmFuZ2VzKTsNCj4+ICsgICAgICAgIGlm
ICggZmxhZ3MgJiBJT1JFU09VUkNFX0lPICkNCj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+
ICsNCj4+ICsgICAgICAgIG1lbWNweShhZGRyLCByYW5nZXMsIDQgKiByb25lKTsNCj4+ICsNCj4+
ICsgICAgICAgIGFkZHIgKz0gcm9uZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXQgPSBm
ZHRfcHJvcGVydHkoZmR0LCAicmFuZ2VzIiwgcmVncywgc2l6ZW9mKHJlZ3MpKTsNCj4+ICsgICAg
aWYgKCByZXQgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsNCj4+ICsgICAgcmV0dXJu
IDA7DQo+PiArfQ0KPj4gKw0KPj4gLyoNCj4+ICAqIExvY2FsIHZhcmlhYmxlczoNCj4+ICAqIG1v
ZGU6IEMNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCBiL3hl
bi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+PiBpbmRleCBmZDZjZDAwYjQzLi5hZDJlOTA1
NTk1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgNCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+PiBAQCAtODQ5LDYgKzg0OSwxNiBA
QCBpbnQgZHRfY291bnRfcGhhbmRsZV93aXRoX2FyZ3MoY29uc3Qgc3RydWN0IGR0X2RldmljZV9u
b2RlICpucCwNCj4+ICAqLw0KPj4gaW50IGR0X2dldF9wY2lfZG9tYWluX25yKHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqbm9kZSk7DQo+PiANCj4+ICsvKioNCj4+ICsgKiBkdF9nZXRfcmVtb3ZlX2lv
X3JhbmdlIC0gUmVtb3ZlIHRoZSBQQ0kgSS9PIHJhbmdlIHByb3BlcnR5IHZhbHVlLg0KPj4gKyAq
IEBmZHQ6IFBvaW50ZXIgdG8gdGhlIGZpbGUgZGVzY3JpcHRvciB0cmVlLg0KPj4gKyAqIEBub2Rl
OiBEZXZpY2UgdHJlZSBub2RlLg0KPj4gKyAqDQo+PiArICogVGhpcyBmdW5jdGlvbiB3aWxsIHJl
bW92ZSB0aGUgUENJIElPIHJhbmdlIHByb3BlcnR5IGZyb20gdGhlIFBDSSBkZXZpY2UgdHJlZQ0K
Pj4gKyAqIG5vZGUuDQo+PiArICovDQo+PiAraW50IGR0X3BjaV9yZW1vdmVfaW9fcmFuZ2VzKHZv
aWQgKmZkdCwgY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlKTsNCj4+ICsNCj4+IHN0
cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZHRfZmluZF9ub2RlX2J5X3BoYW5kbGUoZHRfcGhhbmRsZSBo
YW5kbGUpOw0KPj4gDQo+PiAjaWZkZWYgQ09ORklHX0RFVklDRV9UUkVFX0RFQlVHDQo+PiAtLSAN
Cj4+IDIuMjUuMQ0KDQo=

