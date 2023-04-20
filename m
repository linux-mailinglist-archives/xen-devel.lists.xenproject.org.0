Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFAA6E8D17
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 10:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523964.814429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPwR-0008E2-3d; Thu, 20 Apr 2023 08:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523964.814429; Thu, 20 Apr 2023 08:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppPwQ-0008Ae-W6; Thu, 20 Apr 2023 08:46:58 +0000
Received: by outflank-mailman (input) for mailman id 523964;
 Thu, 20 Apr 2023 08:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VJI=AL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ppPwO-0008AY-Ss
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 08:46:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5666946-df57-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 10:46:52 +0200 (CEST)
Received: from AS4P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::18)
 by DBBPR08MB6171.eurprd08.prod.outlook.com (2603:10a6:10:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 08:46:34 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d3:cafe::48) by AS4P251CA0030.outlook.office365.com
 (2603:10a6:20b:5d3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 08:46:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Thu, 20 Apr 2023 08:46:33 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Thu, 20 Apr 2023 08:46:33 +0000
Received: from 481ba923cfeb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38BEA464-B33A-4533-BA3C-C20D90575DA0.1; 
 Thu, 20 Apr 2023 08:46:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 481ba923cfeb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 08:46:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 08:46:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 08:46:23 +0000
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
X-Inumbo-ID: e5666946-df57-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rz4yL6V/xGbuBke0zDKVD1bLFGce80LP6JNTzJD9jk=;
 b=jp3tzm7IeTZZLSY9sUVpKWe4qGidAcJUBdwgZkD5BGO+WO3mFac6FyvdWtBvDg6/gqAbqq/PbhQfemws5awzeRH59oyziBCSA5T3k8ipjJsN/WZvCpvJEApZAu61tw6MDoTmx2L+7hid54AD1fNOkBIiyfm3Drl5MoudxpBIamQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 922d5b6c40c24139
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMeHuXRM7+R3ZV6ioZCriLwp4ximu3BCwbD59QlYth37L5Psf1tXo+Loimy0wOokSzmzpTnaYutn+Xp/BwyuJbMKp0l7pbthDN68s3w8NOE2HhLl+0ISK5C38mveeLOcy8+ry5F6wwGBD8ao8NXfndUS0JrQsn2v//A+XeVzmlcCFp8YUGvUiqHffqIQuTtcsMCRyZBjZ2upUMQgLNQZ0taOK2wVUAtAwF34RLRTIni+dXu91y+NXcOkA9Oyw5HLekCBQUULAfE34jGyNqG0xyt338Zjoq5nKt3i1UTtINSz8d7D0iLgt0LUYMwhavWbboWeSep9dqbgnhCVMnRJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rz4yL6V/xGbuBke0zDKVD1bLFGce80LP6JNTzJD9jk=;
 b=RjUFaVZHRJfaTcIND6dVXDNhGCWHbVk9Wk3QdXqW7sSFAoKaKl+H1ymhLXJ/ABzIQ3ZZjh00b1xsgSBTEPPJUrqF4qUlmHXKQChiNimpPqo/tetW9mrWxXqVAYIRLAAlWQyRe4csFxFuZ3kLxAZX9FFd3km7hmhRIuFDFfCsyeoKZ8hV9U3iWXkE+kFwcq9mgNhRiVGdesrc6NoUD/56MK8jJf+xyrfoJPJtxjbmNVQD3DCyMUcAPkfo+dNzvqnjy6J5XVcRlU1EbXp1Ax58wEEsq40z4Gp5UrdSpN3b5CBbk0EttgViPgR+s5JRrEiU6WPCphCiK3EtkLk/tjfuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rz4yL6V/xGbuBke0zDKVD1bLFGce80LP6JNTzJD9jk=;
 b=jp3tzm7IeTZZLSY9sUVpKWe4qGidAcJUBdwgZkD5BGO+WO3mFac6FyvdWtBvDg6/gqAbqq/PbhQfemws5awzeRH59oyziBCSA5T3k8ipjJsN/WZvCpvJEApZAu61tw6MDoTmx2L+7hid54AD1fNOkBIiyfm3Drl5MoudxpBIamQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZbSQ+XccnxtxNG0WbEgpX88e2za8xDZ2AgAE1hQCAAAGYAIAABb6AgAGkXIA=
Date: Thu, 20 Apr 2023 08:46:22 +0000
Message-ID: <DE00F3DB-C6D9-4D90-97A8-FD964FD03099@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
 <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
 <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
In-Reply-To: <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6147:EE_|AM7EUR03FT059:EE_|DBBPR08MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf9bbe5-26b4-4410-9e9f-08db417bbe75
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mlMJX3AGTCAUn6P2TdDM5rpLKQcpN1HZDQsckEt+LE7tK0Rr8rUIH51sXXsEDvYR/MyLRgWA37lv61dZFkoKa09uZSLv+ay3CziS2DAXjU+QmzGnynBQCQROn4wjc4Rd7rbAW/+msQ0bC1m+jZlUSnciTGfL/h5fErQbouUSi1YgoE7UPBM3MO9DReLUOFJLiurGNNy+pI5LLe9O6PYQ31uccEPu53kl/Wnbe95UcDQ8ULwkbplpOEJT54719ebFO7cNzcLdWYfVeSp2v/WSsTbAy27iF+bdx/7WY/R3Tas5+XB9qEvMXgUbZI7cREHRAR/qKIkDcPrux+nX3xgXvSG+F48ttx0VF9rrZ7m8GuT4rsDpu4LdWF8OwUeDfM0xtehNZBSjG/+Xk+mghoNjgtWDfNemv8frguHAJsa2ECTV0KwOXpn7eBj4yTK7D1cg/hDzRmzN5S3oRvi35bLDOohCszwlt2v+w1DGca3X8hNQ6OVC3rQZOR7ePwTsNsfYBoFjsWCzbvXk3KJFoPeUrVZooWMR1PASFzUbmiBNSRQ/c+KkBuzb7ty+hdAceLySQmM+hJ2zZQHC+/UCOGqjWHyxECkBaNeI7STAU8Ux71Nq7aoCWlDWdaT5f7nHI0ZnAFZAS+wSxDvgmlKJWo7zMejAesYOPpdHHImFXlDpwr8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(54906003)(6636002)(37006003)(83380400001)(478600001)(2616005)(6486002)(33656002)(6506007)(26005)(6512007)(71200400001)(316002)(41300700001)(66446008)(66946007)(76116006)(64756008)(4326008)(122000001)(91956017)(66556008)(66476007)(186003)(8676002)(38100700002)(8936002)(5660300002)(36756003)(2906002)(38070700005)(86362001)(6862004)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <61FBC4766C87CB45A1EC3A1C6704272C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef546177-5b48-4355-444e-08db417bb812
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NZuXVOil4QJVBt+ESIsW9HaXTbq+GZwpC4MVGY0411XvRm02MDzXspOk9ipxPdGCnZqruHCpQ0KVo+fqEdKKiaJ7ZT30d3D0dkava7WV7i3A6TsuyL4bFJuPrv+KMEhZKqDBSSyHVtCl2bJaNj6lzq04KAYzPjR6JNaaf24R2dBLVaWHCwRjlajFMkR9keMdH3Xk9CHUmD+9RpRhR+3K5VxRpAjMsJTQrrEhJP4w2+XcOqh1ztOWM+LcQEUM08D8tYxEoepazE9Wg/+J3uRgQV1yBgLwcIlB7VgV3gQK/qxothDuq2JYNqjgz+XDFV1Mfh75znx3bZOb5CzT7xzSwvsoS4xlRW7eVw3npMhdlRvojnpoLyNtNgPrk7VtJVFD/YyJ0yDudUIRSsfB5UPNvdQlMQb9p6SzvIaCvmMtM9pPAWBGnYqNxPCcAii7NW2l053iicNRARHu2QDukoJUJxI5+XcCx88B3t4fwDXg8eBx0YO1zBxi4gRg914+Zzk35V2xzfyLlJHmHVc1a8aXI6au+VlEe/zBGVvSX7c3EAOxgdBrpLIKm5P6hfwkR1NTuO7M3xE/BiQVGZP0eDQXT4nz0vNXagFGAm719PxkNsyA6QOCtlyk2U0w8AMdMbdA27Z8JqP6ZqGwct1g40fTqJGu85ZA9XAuZmfKIT874TTGMo9sZW6zKM5BBK87xspPFaaSUNiCKiWhpjiiQdpRpEJJlBleBQfkzVTBK9zfojA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(33656002)(186003)(107886003)(336012)(36756003)(37006003)(478600001)(82310400005)(40460700003)(86362001)(54906003)(356005)(6512007)(2616005)(26005)(6506007)(81166007)(6486002)(4326008)(6636002)(316002)(36860700001)(70586007)(70206006)(82740400003)(41300700001)(8936002)(8676002)(6862004)(83380400001)(5660300002)(47076005)(2906002)(40480700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 08:46:33.4438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf9bbe5-26b4-4410-9e9f-08db417bbe75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6171

DQo+Pj4+PiAraW50IF9faW5pdCBzdmVfc2FuaXRpemVfdmxfcGFyYW0oaW50IHZhbCwgdW5zaWdu
ZWQgaW50ICpvdXQpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICAvKg0KPj4+Pj4gKyAgICAgKiBOZWdh
dGl2ZSBTVkUgcGFyYW1ldGVyIHZhbHVlIG1lYW5zIHRvIHVzZSB0aGUgbWF4aW11bSBzdXBwb3J0
ZWQNCj4+Pj4+ICsgICAgICogdmVjdG9yIGxlbmd0aCwgb3RoZXJ3aXNlIGlmIGEgcG9zaXRpdmUg
dmFsdWUgaXMgcHJvdmlkZWQsIGNoZWNrIGlmIHRoZQ0KPj4+Pj4gKyAgICAgKiB2ZWN0b3IgbGVu
Z3RoIGlzIGEgbXVsdGlwbGUgb2YgMTI4IGFuZCBub3QgYmlnZ2VyIHRoYW4gdGhlIG1heGltdW0g
dmFsdWUNCj4+Pj4+ICsgICAgICogMjA0OA0KPj4+Pj4gKyAgICAgKi8NCj4+Pj4+ICsgICAgaWYg
KCB2YWwgPCAwICkNCj4+Pj4+ICsgICAgICAgICpvdXQgPSBnZXRfc3lzX3ZsX2xlbigpOw0KPj4+
Pj4gKyAgICBlbHNlIGlmICggKCh2YWwgJSBTVkVfVkxfTVVMVElQTEVfVkFMKSA9PSAwKSAmJiAo
dmFsIDw9IFNWRV9WTF9NQVhfQklUUykgKQ0KPj4+Pj4gKyAgICAgICAgKm91dCA9IHZhbDsNCj4+
Pj4gDQo+Pj4+IFNob3VsZG4ndCB5b3UgYWxzbyBjaGVjayBpZiBpdCBpcyBub3QgZ3JlYXRlciB0
aGFuIHRoZSBtYXhpbXVtIHZlY3RvciBsZW5ndGggPw0KPj4+IA0KPj4+IEkgZG9u4oCZdCB1bmRl
cnN0YW5kLCBJIGFtIGNoZWNraW5nIHRoYXQgdGhlIHZhbHVlIGlzIGJlbG93IG9yIGVxdWFsIHRv
IFNWRV9WTF9NQVhfQklUUywNCj4+PiBJZiB5b3UgbWVhbiBpZiBpdCBzaG91bGQgYmUgY2hlY2tl
ZCBhbHNvIGFnYWluc3QgdGhlIG1heGltdW0gc3VwcG9ydGVkIGxlbmd0aCBieSB0aGUgcGxhdGZv
cm0sDQo+Pj4gSSB0aGluayB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgcGxhY2UsIHRoZSBjaGVjayBp
cyBhbHJlYWR5IGluIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpLCBpbnRyb2R1Y2VkDQo+
Pj4gaW4gcGF0Y2ggIzINCj4+IA0KPj4gSWYgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlIHRv
IGNoZWNrIGl0IHRoZW4gd2h5IGNoZWNraW5nIHRoZSByZXN0IGhlcmUgPw0KPj4gDQo+PiBGcm9t
IGEgdXNlciBvciBhIGRldmVsb3BlciBwb2ludCBvZiB2aWV3IEkgd291bGQgZXhwZWN0IHRoZSB2
YWxpZGl0eSBvZiB0aGUgaW5wdXQgdG8gYmUgY2hlY2tlZCBvbmx5DQo+PiBpbiBvbmUgcGxhY2Uu
DQo+PiBJZiBoZXJlIGlzIG5vdCB0aGUgcGxhY2UgZm9yIHRoYXQgaXQgaXMgb2sgYnV0IHRoZW4g
aSB3b3VsZCBjaGVjayBldmVyeXRoaW5nIGluIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZw0K
Pj4gKG11bHRpcGxlLCBtaW4gYW5kIHN1cHBvcnRlZCkgaW5zdGVhZCBvZiBkb2luZyBpdCBwYXJ0
bHkgaW4gMiBwbGFjZXMuDQo+IA0KPiBPaywgZ2l2ZW4gdGhlIHdheSB3ZSBlbmNvZGVkIHRoZSB2
YWx1ZSBpbiB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBzdHJ1Y3R1cmUsIHdlIGhhdmUgdGhhdCB0
aGUgdmFsdWUgdGFrZXMNCj4gdmVyeSBsaXR0bGUgc3BhY2UsIGJ1dCBhIHNtYWxsIGlzc3VlIGlz
IHRoYXQgd2hlbiB3ZSBlbmNvZGUgaXQsIHdlIGFyZSBkaXZpZGluZyBpdCBieSAxMjgsIHdoaWNo
IGlzIGZpbmUgZm9yIHVzZXIgcGFyYW1zDQo+IHRoYXQgYXJlIG11bHRpcGxlIG9mIDEyOCwgYnV0
IGl04oCZcyBsZXNzIGZpbmUgaWYgdGhlIHVzZXIgcGFzc2VzIOKAnDEyOeKAnS4NCj4gDQo+IFRv
IG92ZXJjb21lIHRoaXMgaXNzdWUgd2UgYXJlIGNoZWNraW5nIHRoZSB2YWx1ZSB3aGVuIGl0IGlz
IG5vdCBhbHJlYWR5IGVuY29kZWQuIE5vdywgdGhpbmtpbmcgYWJvdXQgaXQsIHRoZSBjaGVjayAN
Cj4gIiYmICh2YWwgPD0gU1ZFX1ZMX01BWF9CSVRTKeKAnSBpcyBub3QgcmVhbGx5IG5lZWRlZCwg
YmVjYXVzZSBldmVuIGlmIHRoZSB2YWx1ZSBpcyBhYm92ZSwgdGhlbiBpbiBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcNCj4gd2Ugd2lsbCBoaXQgdGhlIHRvcCBsaW1pdCBvZiB0aGUgcGxhdGZv
cm0gbWF4aW11bSBWTC4NCj4gDQo+IGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3Ry
dWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+IHsNCj4gICAgdW5zaWduZWQg
aW50IG1heF92Y3B1czsNCj4gICAgdW5zaWduZWQgaW50IGZsYWdzX3JlcXVpcmVkID0gKFhFTl9E
T01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hhcCk7DQo+ICAgIHVuc2lnbmVkIGludCBm
bGFnc19vcHRpb25hbCA9IChYRU5fRE9NQ1RMX0NERl9pb21tdSB8IFhFTl9ET01DVExfQ0RGX3Zw
bXUpOw0KPiAgICB1bnNpZ25lZCBpbnQgc3ZlX3ZsX2JpdHMgPSBzdmVfZGVjb2RlX3ZsKGNvbmZp
Zy0+YXJjaC5zdmVfdmwpOw0KPiANCj4gICAgaWYgKCAoY29uZmlnLT5mbGFncyAmIH5mbGFnc19v
cHRpb25hbCkgIT0gZmxhZ3NfcmVxdWlyZWQgKQ0KPiAgICB7DQo+ICAgICAgICBkcHJpbnRrKFhF
TkxPR19JTkZPLCAiVW5zdXBwb3J0ZWQgY29uZmlndXJhdGlvbiAlI3hcbiIsDQo+ICAgICAgICAg
ICAgICAgIGNvbmZpZy0+ZmxhZ3MpOw0KPiAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgIH0N
Cj4gDQo+ICAgIC8qIENoZWNrIGZlYXR1cmUgZmxhZ3MgKi8NCj4gICAgaWYgKCBzdmVfdmxfYml0
cyA+IDAgKQ0KPiAgICB7DQo+ICAgICAgICB1bnNpZ25lZCBpbnQgemNyX21heF9iaXRzID0gZ2V0
X3N5c192bF9sZW4oKTsNCj4gDQo+ICAgICAgICBpZiAoICF6Y3JfbWF4X2JpdHMgKQ0KPiAgICAg
ICAgew0KPiAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJTVkUgaXMgdW5zdXBwb3J0
ZWQgb24gdGhpcyBtYWNoaW5lLlxuIik7DQo+ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ICAgICAgICB9DQo+IA0KPiAgICAgICAgaWYgKCBzdmVfdmxfYml0cyA+IHpjcl9tYXhfYml0cyAp
DQo+ICAgICAgICB7DQo+ICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywNCj4gICAgICAg
ICAgICAgICAgICAgICJSZXF1ZXN0ZWQgU1ZFIHZlY3RvciBsZW5ndGggKCV1KSA+IHN1cHBvcnRl
ZCBsZW5ndGggKCV1KVxuIiwNCj4gICAgICAgICAgICAgICAgICAgIHN2ZV92bF9iaXRzLCB6Y3Jf
bWF4X2JpdHMpOw0KPiAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgICAgfQ0KPiAg
ICB9DQo+ICAgWy4uLl0NCj4gDQo+IE5vdywgSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsIHdlIGNv
dWxkIGNoZWNrIGV2ZXJ5dGhpbmcgaW4gc3ZlX3Nhbml0aXplX3ZsX3BhcmFtKCksIGJ1dCBpdCB3
b3VsZCBsZWF2ZSBhIHByb2JsZW0NCj4gZm9yIGRvbWFpbnMgY3JlYXRlZCBieSBoeXBlcmNhbGxz
IGlmIEkgYW0gbm90IHdyb25nLg0KPiANCj4gV2hhdCBkbyB5b3UgdGhpbms/DQoNCkkgdGhvdWdo
dCBhYm91dCB0aGF0IGFuZCBhbm90aGVyIHBvc3NpYmlsaXR5IGlzIHRvIHN0b3JlIOKAnHN2ZV92
bOKAnSBhcyB1aW50MTZfdCBpbnNpZGUgc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNvbmZpZywgYW5k
DQpjaGVjayBpdCBpbnNpZGUgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCkgZm9yIGl0IHRv
IGJlIG1vZCAxMjggYW5kIGxlc3MgdGhhbiB0aGUgbWF4IHN1cHBvcnRlZCBWTCwgdGhpcyB3aWxs
DQphbGxvdyB0byBoYXZlIGFsbCB0aGUgY2hlY2tzIGluIG9uZSBwbGFjZSwgdGFraW5nIGEgYml0
IG1vcmUgc3BhY2UsIGFueXdheSB3ZSB3b3VsZCB0YWtlIHRoZSBzcGFjZSBmcm9tIHRoZSBpbXBs
aWNpdA0KcGFkZGluZyBhcyB0aGlzIGlzIHRoZSBjdXJyZW50IHN0YXR1czoNCg0Kc3RydWN0IGFy
Y2hfZG9tYWluIHsNCmVudW0gZG9tYWluX3R5cGUgICAgICAgICAgIHR5cGU7ICAgICAgICAgICAg
ICAgICAvKiAgICAgMCAgICAgNCAqLw0KdWludDhfdCAgICAgICAgICAgICAgICAgICAgc3ZlX3Zs
OyAgICAgICAgICAgICAgIC8qICAgICA0ICAgICAxICovDQoNCi8qIFhYWCAzIGJ5dGVzIGhvbGUs
IHRyeSB0byBwYWNrICovDQoNCnN0cnVjdCBwMm1fZG9tYWluICAgICAgICAgIHAybTsgICAgICAg
ICAgICAgICAgICAvKiAgICAgOCAgIDMyOCAqLw0KLyogLS0tIGNhY2hlbGluZSA1IGJvdW5kYXJ5
ICgzMjAgYnl0ZXMpIHdhcyAxNiBieXRlcyBhZ28gLS0tICovDQpzdHJ1Y3QgaHZtX2RvbWFpbiAg
ICAgICAgICBodm07ICAgICAgICAgICAgICAgICAgLyogICAzMzYgICAzMTIgKi8NCi8qIC0tLSBj
YWNoZWxpbmUgMTAgYm91bmRhcnkgKDY0MCBieXRlcykgd2FzIDggYnl0ZXMgYWdvIC0tLSAqLw0K
c3RydWN0IHBhZ2luZ19kb21haW4gICAgICAgcGFnaW5nOyAgICAgICAgICAgICAgIC8qICAgNjQ4
ICAgIDMyICovDQpzdHJ1Y3Qgdm1taW8gICAgICAgICAgICAgICB2bW1pbzsgICAgICAgICAgICAg
ICAgLyogICA2ODAgICAgMzIgKi8NCi8qIC0tLSBjYWNoZWxpbmUgMTEgYm91bmRhcnkgKDcwNCBi
eXRlcykgd2FzIDggYnl0ZXMgYWdvIC0tLSAqLw0KdW5zaWduZWQgaW50ICAgICAgICAgICAgICAg
cmVsX3ByaXY7ICAgICAgICAgICAgIC8qICAgNzEyICAgICA0ICovDQoNCi8qIFhYWCA0IGJ5dGVz
IGhvbGUsIHRyeSB0byBwYWNrICovDQoNCnN0cnVjdCB7DQp1aW50NjRfdCAgICAgICAgICAgb2Zm
c2V0OyAgICAgICAgICAgICAgIC8qICAgNzIwICAgICA4ICovDQpzX3RpbWVfdCAgICAgICAgICAg
bmFub3NlY29uZHM7ICAgICAgICAgIC8qICAgNzI4ICAgICA4ICovDQp9IHZpcnRfdGltZXJfYmFz
ZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogICA3MjAgICAgMTYgKi8NCnN0cnVj
dCB2Z2ljX2Rpc3QgICAgICAgICAgIHZnaWM7ICAgICAgICAgICAgICAgICAvKiAgIDczNiAgIDIw
MCAqLw0KDQovKiBYWFggbGFzdCBzdHJ1Y3QgaGFzIDIgYnl0ZXMgb2YgcGFkZGluZyAqLw0KDQov
KiAtLS0gY2FjaGVsaW5lIDE0IGJvdW5kYXJ5ICg4OTYgYnl0ZXMpIHdhcyA0MCBieXRlcyBhZ28g
LS0tICovDQpzdHJ1Y3QgdnVhcnQgICAgICAgICAgICAgICB2dWFydDsgICAgICAgICAgICAgICAg
LyogICA5MzYgICAgMzIgKi8NCi8qIC0tLSBjYWNoZWxpbmUgMTUgYm91bmRhcnkgKDk2MCBieXRl
cykgd2FzIDggYnl0ZXMgYWdvIC0tLSAqLw0KdW5zaWduZWQgaW50ICAgICAgICAgICAgICAgZXZ0
Y2huX2lycTsgICAgICAgICAgIC8qICAgOTY4ICAgICA0ICovDQpzdHJ1Y3Qgew0KdWludDhfdCAg
ICAgICAgICAgIHByaXZpbGVnZWRfY2FsbF9lbmFibGVkOjE7IC8qICAgOTcyOiAwICAxICovDQp9
IG1vbml0b3I7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogICA5NzIg
ICAgIDEgKi8NCg0KLyogWFhYIDMgYnl0ZXMgaG9sZSwgdHJ5IHRvIHBhY2sgKi8NCg0Kc3RydWN0
IHZwbDAxMSAgICAgICAgICAgICAgdnBsMDExOyAgICAgICAgICAgICAgIC8qICAgOTc2ICAgIDcy
ICovDQoNCi8qIHNpemU6IDExNTIsIGNhY2hlbGluZXM6IDE4LCBtZW1iZXJzOiAxMyAqLw0KLyog
c3VtIG1lbWJlcnM6IDEwMzgsIGhvbGVzOiAzLCBzdW0gaG9sZXM6IDEwICovDQovKiBwYWRkaW5n
OiAxMDQgKi8NCi8qIHBhZGRpbmdzOiAxLCBzdW0gcGFkZGluZ3M6IDIgKi8NCn0gX19hdHRyaWJ1
dGVfXygoX19hbGlnbmVkX18oMTI4KSkpOw0KDQoNCg0K

