Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC576BAD58
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 11:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510013.786923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcOB5-0008Mv-Lc; Wed, 15 Mar 2023 10:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510013.786923; Wed, 15 Mar 2023 10:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcOB5-0008L9-IR; Wed, 15 Mar 2023 10:16:15 +0000
Received: by outflank-mailman (input) for mailman id 510013;
 Wed, 15 Mar 2023 10:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pcOB3-0008Kx-HC
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 10:16:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d1d990-c31a-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 11:16:12 +0100 (CET)
Received: from AS9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::19)
 by DB9PR08MB7469.eurprd08.prod.outlook.com (2603:10a6:10:36f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:15:57 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::96) by AS9P250CA0021.outlook.office365.com
 (2603:10a6:20b:532::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29 via Frontend
 Transport; Wed, 15 Mar 2023 10:15:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 10:15:57 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135");
 Wed, 15 Mar 2023 10:15:56 +0000
Received: from 309443b7b54e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A35A6138-3053-43AC-A1A0-DC1CBE2D0015.1; 
 Wed, 15 Mar 2023 10:15:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 309443b7b54e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Mar 2023 10:15:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:15:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 10:15:42 +0000
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
X-Inumbo-ID: 68d1d990-c31a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M44KkEcudMsCmROre+b8V6tDscpGbXAchGDhT8JJA+A=;
 b=c7yOCo4Kh5v/MOCIWLj7jwo4/SUAEkXA+hm35njIxsO69hFqjGOqDtpJdi879dJSptcmIVwAtVxuA9PZFegqs5ZCigkrzjJ5mG/8sMoui/yyMabICesUVBMfBQq16a8tN7HUnkQNMeturEhgStXkJRXFZuT13bol/P0wHPBO7qw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ca5f82133ebf3d9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbL8Qiqy21c78+QfHl0yGegRuVy5GX+9XVFZH+g2fZPEB59Y72wK/q8LRUFt/DYDnrBoLSzRClGf7xb/uLMFiDkWZkf+XA0HqoVfSiFWh4YkoOMyNvjmG2lMDlCYfU2WqBQgOO+sG9BLUi2/yDSRneSVVKfW9IvVPstBCSUDan/vT7YQ2Zjj8KjHU6s6dfAMHCGMuk636qBoEAM4iUdMAujkrViD54aicUWxb5ss+rxswchxdIf+7WVKF7khq5Mcggj0G8h8PPhTp9Tk28fLe9MmPYOT2RsXa+W0vjFR5sK0w/DzXqLlWcRe++Jr3MJQ7ZUtvRXPZB7KLAz3GRxN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M44KkEcudMsCmROre+b8V6tDscpGbXAchGDhT8JJA+A=;
 b=Iyo0ThSvuqgp7ROgu6/pGHsngYGsgavg5Hfq6JOuTDZ2DS6m2p7gZO5dNeZF2yxEUmhpYuYX6RFQc9iftEopssvrPDbRjC1YLgvOcFkGzbu31suQV1thQRIkZCWOa7rGytwx8qxCcNKZIov5ssobVQJLdEdDUsTPu50zuMxXSDKi1GvL/WkwT7VN0XKte4RKhAq2X0Uj7IbfQy0L5mhkPKTLNJ5CYcFr+qjqvzttuvTD+2TcZWppLpba3jMQ9oxexnkriQSa7jNgkFa/iT/0ooglygFfTqhCsaKp304IU/U6C0jCJ/S+vRj2NVq/X9pXfdkETnV3ccB5S1ebhRGjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M44KkEcudMsCmROre+b8V6tDscpGbXAchGDhT8JJA+A=;
 b=c7yOCo4Kh5v/MOCIWLj7jwo4/SUAEkXA+hm35njIxsO69hFqjGOqDtpJdi879dJSptcmIVwAtVxuA9PZFegqs5ZCigkrzjJ5mG/8sMoui/yyMabICesUVBMfBQq16a8tN7HUnkQNMeturEhgStXkJRXFZuT13bol/P0wHPBO7qw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Christian Lindig <christian.lindig@cloud.com>
CC: Edwin Torok <edvin.torok@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 08/10] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v2 08/10] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZVx18izX66CL0tEu/wMOArdtab677mNIAgAAHGIA=
Date: Wed, 15 Mar 2023 10:15:42 +0000
Message-ID: <881F66CF-AE08-4C83-AD68-D6AE89BB5D5F@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-9-luca.fancellu@arm.com>
 <5E2CADF7-E092-46F2-80A6-5EADBDB6817A@cloud.com>
In-Reply-To: <5E2CADF7-E092-46F2-80A6-5EADBDB6817A@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8471:EE_|AM7EUR03FT017:EE_|DB9PR08MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 65eb6e12-f5b4-41c8-b688-08db253e44a8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hmyU86obEBG5rQwb+ySm3IRNwCFuI4DHxFKpYQMm2vgWfG82xZiEiW9P2mBY0lgkfpCX6iGeYoiH0f5y8e2SuA2oIBr+U4NpKhMO3QDqPDg/u5sLoYZKdZWM6olVMxdfCKtmLj3rJyJP+qj6VyGd/A0/pUKO3JQ0c9oPjUjOZ5c+GGYhMLgV0+WR44DsGX5TI/TTnSALt5UYFdJwJU7pK6F82VTVoVC/q9tYCNnpFlRHrov+Lb111lnb03WeCXIDTuC03VBbANMH1ol8GVPw5EX+HTrkB1TwmBOBKymvRPWhq4bKaNocvaScb8vLDzo1bQyg4U2W0Mj391jADzBbavriB2lZc6eP8UEECmDHSkUZxfHm1s4uWA23fKR/FEdX9qqG+L72BWQ8iQ9kdbvVD4InpnSa7MhxZILfgXi+0/Lg+JuCVPHjLaBypMCu+CZYjqLW7UFZfisRNaFMCT+o6M0ugCTMt619yvS9AM9YEJAVDTrbnFVnnY9eU4Rkjoa+egtYnV0uk1RcHRfRM9LwjBniG5DEsA8To4VM24kuIcJG80f23cUS7XEwWWH3wBXuXBvW3c4DnBfw/V0wu1scqHtn+4raLLwaSRyVpQsapECKT/spkOO0tLaTI7YX67+UfCgOQZnulZWmq8/EPjrYBlTl4XT5SoJalSXDRwuKE1Mkv3ClTKu2BpNlcvQ/Tnzo3qaOOBRtIKeAfM0Bya72ItrFAgFlWaSHEcMIOBEQT9w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199018)(6486002)(66946007)(66476007)(66446008)(76116006)(64756008)(66556008)(478600001)(33656002)(71200400001)(26005)(36756003)(6512007)(122000001)(6506007)(8936002)(38070700005)(41300700001)(2616005)(7416002)(316002)(5660300002)(91956017)(8676002)(4326008)(6916009)(53546011)(186003)(86362001)(83380400001)(54906003)(38100700002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8941441413F57F4DA927D264A8561460@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a02392cf-431e-4dac-7fc5-08db253e3bb3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9UEIKW1nhf+NRGuioEaAS4eZhLo5W4QtmsPsINl3KVIJX/WqTFbXJeT5bO3zjVtuKJsZr2Inzop83gPkCAZ1/uio/SByUtsb5+f7eV7esTQOIm0O9g6edgWwqVGpqt79olJBvttmHUp8gvUEQ5C3EI7l2+1FAfaKn6a8fi/1uY43wVNaGKQam7puU5lQ2YK+J16Se5jcz5A2++2vVoa7OpJidv4ahxuLXhbZnmj0TVCW8EnURTHEtYQ2LIYHKZ+u25mhHJuNj2gMFG7DLkHmOEY62jrvXa8mHMUXyvevyHt0J+C5S0Cy9HKZmjpgEY7hWMPxtWVLBOH+0lJBkg3LYPa8xeysIOEv7zp14jeGfadsJifhTHU8bC7RwOt139kMm2JNsAbAPyXgV8gO6ZQC4Y911zE0nxuKEeetFfwSnuAWkUIuXY2N+egcBNZWsS0h/MLkNFre5TwAHNK8kwUQYUsKkwwLERQyihK1s7xycyeJNpRZSJTYYRf3v/BJ8YEGSKr0723aLV96INITXCbhadgDAcbBWiviS/uNigR6BTjRE8H/V3VUZTH7Phc1HL8iBE1a3sS5lE+AlYNcyzcJFzTL92N0hQbfb2/uTkFt6lAlz4aoOke+vECqv6MA0vsk1erBaZ0s8oZEtvdjlueG49spLsXdhU8/W0TWg81oqrKTGZDgvZRiOIsSzsTJcqA9zzL1Sk9bwFvZ1O2yGiwQkA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199018)(36840700001)(40470700004)(46966006)(6486002)(2906002)(36860700001)(2616005)(107886003)(36756003)(26005)(40460700003)(6506007)(6512007)(478600001)(53546011)(8936002)(5660300002)(33656002)(6862004)(82310400005)(54906003)(186003)(316002)(40480700001)(41300700001)(336012)(86362001)(356005)(4326008)(47076005)(70586007)(83380400001)(70206006)(82740400003)(8676002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:15:57.2539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eb6e12-f5b4-41c8-b688-08db253e44a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7469

DQoNCj4gT24gMTUgTWFyIDIwMjMsIGF0IDA5OjUwLCBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNsb3VkLmNvbT4gd3JvdGU6DQo+IA0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIExp
bmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjbG91ZC5jb20+DQoNClRoYW5rIHlvdSwgSSBtaWdodCBu
ZWVkIHRvIGRyb3AgdGhlIGFjayBpbiB0aGUgbmV4dCBzZXJpZSwgYmVjYXVzZSBJIG5lZWQgdG8g
cmVuYW1lDQphcm1fYXJjaF9jYXBhYmlsaXRpZXMuaCB0byBhcm0tYXJjaC1jYXBhYmlsaXRpZXMu
aCwgdW5sZXNzIGZvciB5b3UgaXMgb2sgdG8gcmV0YWluIGl0Lg0KDQo+IA0KPiANCj4+IE9uIDE1
IE1hciAyMDIzLCBhdCAwOTowNSwgTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
PiB3cm90ZToNCj4+IA0KPj4gdHlwZSBhcmNoX3BoeXNpbmZvX2NhcF9mbGFncyA9DQo+PiAtICB8
IEFSTSBvZiBhcm1fcGh5c2luZm9fY2FwX2ZsYWcgbGlzdA0KPj4gKyAgfCBBUk0gb2YgaW50DQo+
PiAgfCBYODYgb2YgeDg2X3BoeXNpbmZvX2NhcF9mbGFnIGxpc3QNCj4+IA0KPiANCj4gSSBub3Rp
Y2UgdGhhdCBvdGhlciBjYXBhYmlsaXRpZXMgYXJlIHNwbGl0IGludG8gYSBsaXN0IGFuZCBub3Qg
a2VwdCBhcyBhIGJpdCBmaWVsZC4gSXMgdGhpcyBub3QgbmVlZGVkIGhlcmUgb3IgYW0gSSBtaXN1
bmRlcnN0YW5kaW5nIHRoZSByZXByZXNlbnRhdGlvbj8NCg0KSGVyZSBJIG1pZ2h0IG5lZWQgc29t
ZW9uZSB3aXRoIG9jYW1sIGtub3dsZWRnZSwgYmVjYXVzZSBvbiBhcm0gbm93IGFyY2hfY2FwYWJp
bGl0aWVzIGlzIG5vdCBhIGJpdGZpZWxkLCBJIGhhdmUgdXNlZCDigJxpbnTigJ0gaW5zdGVhZC4g
TXkgdW5kZXJzdGFuZGluZw0KaXMgdGhhdCB0byBnZW5lcmF0ZSBhIGxpc3QgdGhlcmUgbmVlZHMg
dG8gYmUgYml0cyBzZXQgaW4gdGhlIGZpZWxkIChJIG1pZ2h0IGJlIHdyb25nIHRob3VnaCkuDQoN
Ck1heWJlIEFuZHJldyBvciBBbnRob255IGNhbiBndWlkZSBtZSBiZXR0ZXI/DQpJIHVuZGVyc3Rh
bmQgdGhhdCBBbmRyZXcgaXMgbm90IHJlYWxseSBoYXBweSB3aXRoIHRoaXMgd2F5IHRvIGhhbmRs
ZSwgYnV0IHRoaXMgaXMgb25seSB1bnRpbCB3ZSBoYXZlIGEgcHJvcGVyIGZyYW1ld29yayBmb3Ig
dGhlIGNhcGFiaWxpdGllcy4NCg0KPiANCj4g4oCUIEMNCg0KDQo=

