Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E955089F1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309267.525347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAsk-0006fE-5w; Wed, 20 Apr 2022 14:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309267.525347; Wed, 20 Apr 2022 14:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAsk-0006cp-27; Wed, 20 Apr 2022 14:00:34 +0000
Received: by outflank-mailman (input) for mailman id 309267;
 Wed, 20 Apr 2022 14:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8Fu=U6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nhAsj-0006cj-6h
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:00:33 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d79fa98-c0b2-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 16:00:31 +0200 (CEST)
Received: from AS8P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::15)
 by AM0PR08MB4353.eurprd08.prod.outlook.com (2603:10a6:208:144::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 14:00:28 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::ba) by AS8P250CA0010.outlook.office365.com
 (2603:10a6:20b:330::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25 via Frontend
 Transport; Wed, 20 Apr 2022 14:00:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 14:00:27 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 20 Apr 2022 14:00:26 +0000
Received: from 07f2d32a5601.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37B311BA-52FC-415D-AA0A-994B9C7F54F3.1; 
 Wed, 20 Apr 2022 14:00:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07f2d32a5601.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Apr 2022 14:00:15 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by GV1PR08MB8082.eurprd08.prod.outlook.com (2603:10a6:150:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29; Wed, 20 Apr
 2022 14:00:12 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 14:00:12 +0000
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
X-Inumbo-ID: 3d79fa98-c0b2-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/v1WE61xkur4osDmCIiuy0rcZqs2HZfVCItorOm5zQ=;
 b=d3c77tb860jZwtX6GztA5BKyqTXSv7ZTBDyfcTWN/cMrSBYlY3+MaoMSKYvRyRG32QVjdwmHxeB1ZMkFbqsV0stdzThGGT4+MgzKZ+KytDj78ocefXoExBPs5sDNH52PGgMegY/FTCcPUkqektqEbaINxpklc1HUp32sb7eL1Cg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4a1645a57bb5590
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK57qlGm2vsUBFaCW58Y75RqpKG5YfENijiafO43wWg3vcoiuSB+68GE5JxQaM4Na0HC8boJpXmcURkM8xJDwFTNAtF3RjAy6Xw1OFXwbf/kR5Tq8565GAMtbPVQADSMYgkiApn8ma2pKyXyZrGvlEeqHtYm/vJWV1IkJM3oSb+DlWSxV0DW2m0aZe88J5qt4bzzuzcv9F4ciJsXUJ185SUd5IX5SMJTnlhnOg+P1KJfPN6GMSfCQLpwd7/B3mZGF/o1OmUFOcyAXzdGCbUEYNogBDFqDfLAnYrcpmSiEb1I21mKAZEkvf6ED4+atMYvLP8Jc6yJ+dAVMbeKeIJdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/v1WE61xkur4osDmCIiuy0rcZqs2HZfVCItorOm5zQ=;
 b=TgK+7s2yrx/Iw6J4IklehKaOP1ly8yxHh4ct6tPO0mNdcULaakmVwXpdwlHbV4t5C687qT26I3lk9NgI3ymtdpyfU7Mp3Da2YeNw0z+fXs/eAmQg8T0tCQ0B8OeaRBJigMYUxSfz30hWEJMJIQqCEfd73LKJZHF40oQkxyRRJrTERBmjbwmaluIAkOl2wL+6fp3aEhpzKzVxx1d7BKoyZFGL6yCb9NKuwWFhYuOM0ECjvXbUo9kFAPqZCW81Lbyu8PXfatJeNNVbHOBHvsd8hDT3CmgV1ZIAG0QH6yWQTDAG3kNiACPrF5o0gJN2fRgXMP0eIpwnVN1chdnQQd8EjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/v1WE61xkur4osDmCIiuy0rcZqs2HZfVCItorOm5zQ=;
 b=d3c77tb860jZwtX6GztA5BKyqTXSv7ZTBDyfcTWN/cMrSBYlY3+MaoMSKYvRyRG32QVjdwmHxeB1ZMkFbqsV0stdzThGGT4+MgzKZ+KytDj78ocefXoExBPs5sDNH52PGgMegY/FTCcPUkqektqEbaINxpklc1HUp32sb7eL1Cg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYTbfiNTg+IXy/G0GwaoqGDOL0yazq2Y4AgAEwcQCAAAivgIAA2MwAgACFroCAAAHtgIALb2GA
Date: Wed, 20 Apr 2022 14:00:11 +0000
Message-ID: <AB17024F-15BF-4F43-802B-9F54B76F6348@arm.com>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
 <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
 <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
 <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
 <39D59E80-A4B5-4587-9A2A-1D5F06C8C33E@arm.com>
 <13f077b9-6b61-5737-1c94-b17da0fd6ecc@suse.com>
In-Reply-To: <13f077b9-6b61-5737-1c94-b17da0fd6ecc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 031a66f9-db3d-4fea-27c7-08da22d61fa1
x-ms-traffictypediagnostic:
	GV1PR08MB8082:EE_|VE1EUR03FT042:EE_|AM0PR08MB4353:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB435378A7445354152DF7857DE4F59@AM0PR08MB4353.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4PmQQlvT2FCcyRaXwFNrEundhYhqy/xn5v1BrZYsr47XgckS+C7SCocRB9HHxnLpvWt0qZy+J/CK99Wujr7a5+9okoKF4Di9X9KIJ6oUgTd0H5tbc+0K1QDWdTgYyNy0Lssl7u1lypSSKo1y02K/QCp9DkzKeHZRws0j/c5/CPdGeioJkntcCCR7C4yXvZYYw8Atbx8ioCH6Cvcsb0PYo4EixDOzPlOJu6/eZrQUaIjO+UdOqzGfCBM+Kqju+SrH59sDgr6/tRI0bK71tpmT63stUuWB1kkETjZcYijCPEqA1QdMHJquZ+nwYn2zcFF7w1/Qd+HA1n1bcxAFzSic4NX8A2GWU0dYiWURR3CN5fDWohZuMb140lsZbti8sRo2ASlTaWMS766eU2XPk+HWDf2K4onE6WFEg8Ylw42FtCzdTyHnUbw9gIUD7mrCHrKEmt4TuDQB1/+Jw48imf/+BH/6wBFqvQehFtLNo0mserKeim+4Zjb2HHgXeUen4Y9kgAgKL81le5Od0/oz1MD1xm/66KF7zvx4jmI+n79DzByNJm79+gRZnkLPzj7Gldw4QnivKwMHFCpOUWGzsTDw90Julm4/xGaWD5mhfoZBRZxhFZCVwACDYpCzRe1fXJhcutqhPqE0HeWEv2JF/NgA22UlMtu7hCBwt67xqQa83uTbMDNHdUnMLhCA+9/vAZVxpBmLTFOyTByxO3qX5RmZkhOvFsgq6uYjEq3Y+e1AHA/DQpwR5H0k+dUkJVHopQBL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(71200400001)(122000001)(8676002)(64756008)(6506007)(66556008)(2906002)(2616005)(86362001)(83380400001)(6512007)(8936002)(53546011)(186003)(26005)(54906003)(508600001)(7416002)(4326008)(33656002)(5660300002)(6486002)(36756003)(91956017)(38100700002)(110136005)(38070700005)(66446008)(316002)(66476007)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5716A86F7144654FA9CF75016E686B47@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8082
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c25deb4f-4878-4119-e3d4-08da22d6165e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	141Jn2K9HvU+PJSBQ/aKlq97/vPDzLCxnhDzMMPED2BESR5Li0FGUpd/+2a1wmYpPgG37a/msYXbMY4e9psLnKyJx9FB3wjG+ILu436S7HMPYkUJNSVR8YvU83aboBmw6thQaj7LudkiDX45YgJEDB+DErKXo2sKLgE8yPVKHh7nLq7RlWKisJOiHSE4yVxfLD5auvftaldvU7IcL9a/UmRtk/C91qLrs8ftB1s0fXFNuQWGj1GMsQJkxOu7NOr8v+ODSk2J8zVQHbeVSh0U2lw5db55n+NSdrnTpeW+vG4UaAYCkzZx9+4s5DtvPv/jLISvLjS984fEgGN0PaF/1hnUK7kZ5fQmDoHLh+sv1qVQViULXMKw42T7eg7LLO86kHnYXRglUqYKmme3AAFBCcGpsLNM/cHDZkOoIqy61QHfVjJnGqbn6fcO+kxZDplMOQ4zlRyOpHYtjFURvAOseF7QiDNHVyNPwPYdQoI86YXZjk4SnVrqMEcgWKZ083RISYhVGGxQux4/6bMq6u9OhdtxVuOdhnMA4YRTW/QiTHxPeDmBkeJKZa3X0VaZcbkBlgOs243FvO1PuKVvumA6kvvPZ7LH8NjXZd4OgDDukvhEtdgNUa2r5l+8pJwIJknzL/yaO12f9qwb11k9+OkPj+Yl3//4z3sXxSqGB3CiBx7IBcjNHYxg0jpuig34VQT/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(53546011)(26005)(33656002)(70586007)(81166007)(47076005)(336012)(36756003)(83380400001)(2616005)(8676002)(82310400005)(70206006)(6512007)(2906002)(6506007)(5660300002)(186003)(107886003)(4326008)(508600001)(8936002)(36860700001)(6486002)(316002)(54906003)(110136005)(356005)(40460700003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 14:00:27.4409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 031a66f9-db3d-4fea-27c7-08da22d61fa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4353

DQoNCj4gT24gMTMgQXByIDIwMjIsIGF0IDA4OjIyLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMDQuMjAyMiAwOToxNSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IA0KPj4+PiANCj4+Pj4gTm8sIEknbSBub3Qgc3VnZ2VzdGluZyBhIG5ldyBtZW51
LiBJIHdhcyBtZXJlbHkgd29uZGVyaW5nIHdoZXRoZXIgdGhlDQo+Pj4+IEtjb25maWcgY29udGVu
dHMgd291bGRuJ3QgbG9jYXRpb24td2lzZSBiZXR0ZXIgbWF0Y2ggd2hlcmUgdGhlDQo+Pj4+IHJl
c3BlY3RpdmUgc291cmNlIGZpbGUgbGl2ZXMuDQo+Pj4gDQo+Pj4gSXQgY291bGQgYmUgaW4geGVu
L2NvbW1vbi9zY2hlZC9LY29uZmlnIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGZpbGUNCj4+PiBi
ZWZvcmUgY3JlYXRpbmcgdGhlIG5ldyAiU2NoZWR1bGVycyIgbWVudSwgZS5nLjoNCj4+PiANCj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnIGIveGVuL2NvbW1vbi9zY2hl
ZC9LY29uZmlnDQo+Pj4gaW5kZXggM2Q5ZjkyMTRiOC4uZjY1NDVmNGU5YiAxMDA2NDQNCj4+PiAt
LS0gYS94ZW4vY29tbW9uL3NjaGVkL0tjb25maWcNCj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVk
L0tjb25maWcNCj4+PiBAQCAtMSwzICsxLDEwIEBADQo+Pj4gK2NvbmZpZyBCT09UX1RJTUVfQ1BV
UE9PTFMNCj4+PiArIGJvb2wgIkNyZWF0ZSBjcHVwb29scyBhdCBib290IHRpbWUiDQo+Pj4gKyBk
ZXBlbmRzIG9uIEhBU19ERVZJQ0VfVFJFRQ0KPj4+ICsgaGVscA0KPj4+ICsgQ3JlYXRlcyBjcHVw
b29scyBkdXJpbmcgYm9vdCB0aW1lIGFuZCBhc3NpZ25zIGNwdXMgdG8gdGhlbS4gQ3B1cG9vbHMN
Cj4+PiArIG9wdGlvbnMgY2FuIGJlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUuDQo+Pj4g
Kw0KPj4+IG1lbnUgIlNjaGVkdWxlcnMiDQo+Pj4gCXZpc2libGUgaWYgRVhQRVJUDQo+Pj4gDQo+
Pj4gDQo+Pj4gSSB0aGluayBpdCBpcyBmaW5lIGVpdGhlciB3YXksIHNvOg0KPj4+IA0KPj4+IFJl
dmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+
PiANCj4+IFRoYW5rIHlvdSBTdGVmYW5vLA0KPj4gDQo+PiBKYW4gZm9yIHlvdSBpcyBpdCBvayBh
dCB0aGUgYmVnaW5uaW5nIGxpa2UgU3RlZmFubyBzYWlkPw0KPiANCj4gUGVyc29uYWxseSBJJ2Qg
cHJlZmVyIGl0IGF0IHRoZSBlbmQgKHN0aWxsIG91dHNpZGUgdGhlIG1lbnUpLCBidXQNCj4gcmVh
bGx5IHRoZSBzY2hlZHVsZXIgbWFpbnRhaW5lcnMgYXJlIGdvaW5nIHRvIGhhdmUgdGhlIGZpbmFs
IHNheS4NCg0KSGkgY3B1cG9vbHMgbWFpbnRhaW5lciwNCg0KSeKAmW0gZ29pbmcgdG8gYWRkcmVz
cyB0aGlzIGZpbmFsIGNvbW1lbnQgYW5kIHJlLXB1c2ggdGhlIHNlcmllLCBpbiBvcmRlcg0KdG8g
YXZvaWQgZnVydGhlciBub2lzZSwgd291bGQgeW91IG1pbmQgdG8gZ2l2ZSBtZSBhIGZlZWRiYWNr
IG9uIHRoYXQ/DQoNCldoYXQgaXMgeW91ciBwcmVmZXJlbmNlIGZvciB0aGUgS2NvbmZpZyBwYXJh
bWV0ZXIgcGxhY2VtZW50LCBiZWdpbm5pbmcNCm9mIHRoZSBmaWxlIG9yIGVuZD8NCg0KVGhhbmsg
eW91Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IEphbg0KDQo=

