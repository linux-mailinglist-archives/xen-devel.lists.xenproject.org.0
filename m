Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7A63532C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 09:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447442.703657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlSh-0002Fc-6M; Wed, 23 Nov 2022 08:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447442.703657; Wed, 23 Nov 2022 08:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlSh-0002CJ-2b; Wed, 23 Nov 2022 08:50:31 +0000
Received: by outflank-mailman (input) for mailman id 447442;
 Wed, 23 Nov 2022 08:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYU+=3X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxlSf-0002CC-43
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 08:50:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deebd033-6b0b-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 09:50:26 +0100 (CET)
Received: from AM6P192CA0085.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::26)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 08:50:19 +0000
Received: from VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::1) by AM6P192CA0085.outlook.office365.com
 (2603:10a6:209:8d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 08:50:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT065.mail.protection.outlook.com (100.127.144.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 08:50:19 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Wed, 23 Nov 2022 08:50:19 +0000
Received: from 15284aba1efa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C364947-8C31-4E3B-99DC-306DFC6F4E44.1; 
 Wed, 23 Nov 2022 08:50:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15284aba1efa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Nov 2022 08:50:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 08:50:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 08:50:06 +0000
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
X-Inumbo-ID: deebd033-6b0b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRmn/UkpYIsukzB+yoqI/GQN81Fgen5DU4CCDhrHLm0=;
 b=50U61TKhKqw+QaNRZ7n9k+uSizi9/sN5KB6sMhRM3/5laykpzlH7CBIXxp2vMYQznx38aJRtfymFNoBWsw1h6vEfS+FNlo2NeVQ891K7VhHACWVIcUmRs80qbwP4/+ENGzVK6syvvTDTcI4c/yln9SQygS81qh86wpekitKfUgE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGcZ/AA4KDjgrf9ob6n92HpH9LQs4ZpI9MOxpKbvOG336Mw3RoAqSFaH2tqe66WtEoJ1+nuRCIL1+R6xxMFUnYawFIE13illxuxPOg8ZfhSA53I1Mu4CZoQYGhYCMtJYF7N+vN/wAxStvxHP6Y+bQENT4Bx7Rv8YaWk1rh/GAlZGVn+aqnJKtq9mx0MKUY8GoxV+60E3RnBc76+uy7gjyFplneYrfJEKxOUtq6G8NQ8E6067dSo7V/JCHgz6bHk7fLQeWzVb3hpQynof3CxGQHWdiW3Or3WQVTZPVk4+MbrKm7d17Ym1jcVn1u2IX688T0EEzIsXgmGlwlnB1ECmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRmn/UkpYIsukzB+yoqI/GQN81Fgen5DU4CCDhrHLm0=;
 b=YHdLNmKDj4qgOkPISPTuJHuomissF53zZVKRSlD1lRrRiT0hdbBpSIavyZGPWqVR8Ufx8Uy+xsDfwaLdLbz6Dux3KN3PkvHLLBqVWtGRJ4YeHIOSlcoHhN4zwjs+obrfS3IGsUbB32w4GrBPdbmmXJS+nTJDOXugaXmq+Kq52dteJIu1rX9dqlOAFVRmEKCuT0tr7lHFoHQHds5jyKbuVy7wEj+s92B0IfUuZ7oGI1jSiu3kVq3K7eblWm4FfGmn43ERAXJmBhaOYeNe6NzqCH6ZNz+LXMdbUqBZe5fsSvIwXdu263+hhLyKCmJuDlibXEfhOCt2nMCupvI5KIC4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRmn/UkpYIsukzB+yoqI/GQN81Fgen5DU4CCDhrHLm0=;
 b=50U61TKhKqw+QaNRZ7n9k+uSizi9/sN5KB6sMhRM3/5laykpzlH7CBIXxp2vMYQznx38aJRtfymFNoBWsw1h6vEfS+FNlo2NeVQ891K7VhHACWVIcUmRs80qbwP4/+ENGzVK6syvvTDTcI4c/yln9SQygS81qh86wpekitKfUgE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during
 the 4.17 release
Thread-Index: AQHY/mWeJ7PIIiwbMEi0iLnxeCbJiq5K2wSAgAAHBWCAAVDtgIAAAEvA
Date: Wed, 23 Nov 2022 08:50:06 +0000
Message-ID:
 <AS8PR08MB79915BA6B8753CC897D58E78920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-2-Henry.Wang@arm.com>
 <cab642b3-3928-7bd2-a874-0c0edf48fbc1@xen.org>
 <AS8PR08MB7991D017719BCDA177D377D6920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <7b43c459-55db-58d4-840b-e13f11204211@xen.org>
In-Reply-To: <7b43c459-55db-58d4-840b-e13f11204211@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FC8F253033153544A7C19989848B2C41.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5950:EE_|VI1EUR03FT065:EE_|AS2PR08MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: f236fa26-25e2-438f-e260-08dacd2fc00a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kFMOLVcp58v7ANaF3to6WW9e+w+oVt9vuLAU0mGcsd2eCPf6YnRzy2iEiABIEGYv2uOa06qD28aFubAMLJOSLWQOq7YRhqvEf5vHd69UqkNpl+foP9r99SDeBtS/bDDT4rS0NjN0ZeIFYfGhz9WU7oujGvt8QqsD2L+uFAjR5rJfg6HHuKUAv7fBCJaGzdivUUvnUWCwAxckzhvPE9GOurnqYUj6bqat2ntSweVdm6BQ2b8mpCBWcDZXsPydhG/ngD0ppsHRWubqKJn0wP/6UEmPBQu0GTXsIp5yA8m3yLkBzUk0ehgmQLPzNC8CY9gE0KXjBnudT54fdXHjydvrB0Jjph9+5eMr7qeKjcG6UUy5psl0v7xs/gUrpC8lzyRrjZE7mJ5SYvZwKJetn4dI/mj64DN7Tb0IihEkz311Qq0TwblHZ7hRFA031N3dbrx3YwzLj9qxriDEZiO1GIJWipmdU5IOvbKjryKQ3C9vK2q1WLP9GCKwXuNV0jH/Prts8uGR6eR8TtTLDkIiGaWARDsDLEYPbHtbNIw+fUNMAzFtEzPVGj9XrgzFgn/2xYMjgy1DT9mCGoEEai8tVSQvna2t02QHhV6Ss+x6pVTnVWrtQlgaPpyI6GLDwwZL2uMAbS0cgl8GivWBGdTc+rzFBZdckXHAJSYnqH2i9sgAUSQKgqah5EaCAvJRfryJgZTI3/i6TMmMhZaB5xUh5daPGcTHRRxnZl8zBQuzlORMD3Ydez0tugdK6Ori7DaSples6+k6hiQ5nd7JmYuaAM2Mf40ZV/mOq9BgsYJiCz5FpM0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(41300700001)(52536014)(316002)(8936002)(64756008)(4326008)(5660300002)(66446008)(8676002)(66556008)(66946007)(54906003)(66476007)(55016003)(83380400001)(86362001)(76116006)(478600001)(26005)(110136005)(6506007)(71200400001)(2906002)(38070700005)(7696005)(9686003)(186003)(4744005)(33656002)(38100700002)(122000001)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f7a472a-c43c-4ad1-bb71-08dacd2fb835
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnuuv4CEgjwWXsPXRLpPngkvc9ztn1zuVjD5Ge2TDQm1A4ooQbDBSFU7GUGe7bXlqglUI+hGhxQP/xeuOhftBt1QbZOH/q6k7epx3D146UbC79hbQU3cOYkEJWgzJ3vXF7kTKIgAc0t719jyX7xZDqs7NG/1UR2kXvFZjpR8Gl5wXP//PAxt2d/k7WEwUC/xQUEpywO7OsoijUujF/dmrah/zmYzx3osqif14LM57uLQFjgL1tJmRRq5Lj+TSKMnvy/DIPBehh5+j0HQb/tPVDKuPtnoUczRvJGRfBrOJu5jKSJSACSIN+mOIN8d0aldewr+Y2CS0E/vRmznp4G0XrRhHNgQU5K7ZZAV1Udk6+8jn84r4o9tf3Z8RdARpYANSCXi0/fgmR4fnfqkpLSd7tIfWiJI6aM9pQSD4KscKYGcHtcJvx9x6H0GzBFljHmfCYxaeCr6+vCzdWfKcDwrIoXbC2ADGRtWCmYCjbRE37lmjtCK3k/pcbNm4H0eN5rTzyIFuHMhofsIWeaietxOCxhLU3brnDaIMZhdkIGYOAkwiOA3PL0cmYuSUZpPa0dC5Y10ZJy7Q2bzp77nEFjNhknvLpOubZLOSFN40gEHq/4YEm9d/Q8z2/DZ6XqphQwO/u6dgBmSGB3dE+oP4W5R8FUwfuJt9HuLXlthHHMKxSSQvnCQWgNzXsAX8MzA6Yp5uDEO+zWxR13G68SAHVB3s5AcSKfCyPrqeznQgmy+36F6qtlrYNvLX2arC8Pyf70wA5spSluJjsmHNguCcDvyoCQ4BCyqtRuOWm1hYT4lrho=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(36860700001)(110136005)(8936002)(316002)(82740400003)(4326008)(86362001)(83380400001)(4744005)(2906002)(356005)(70586007)(5660300002)(54906003)(40480700001)(26005)(40460700003)(9686003)(82310400005)(6506007)(55016003)(7696005)(107886003)(41300700001)(52536014)(47076005)(336012)(70206006)(8676002)(478600001)(186003)(33656002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 08:50:19.4348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f236fa26-25e2-438f-e260-08dacd2fc00a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8zXSBD
SEFOR0VMT0c6IEFkZCBtaXNzaW5nIGVudHJpZXMgZm9yIHdvcmsgZHVyaW5nDQo+IHRoZSA0LjE3
IHJlbGVhc2UNCj4gPj4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgY29kZSB0
aGF0IHdhcyBtZXJnZWQgaXMgZW5vdWdoIHRvDQo+ID4+IHN1cHBvcnQgdGhlIHBsYXRmb3JtLiBE
byB5b3UgaGF2ZSBhbnkgcG9pbnRlciB3aGVyZSBpdCBzYXlzIGl0IGlzIG5vdA0KPiA+PiBzdWZm
aWNpZW50Pw0KPiA+DQo+ID4gQWggdGhpcyBpcyBhbHNvIGRpcmVjdGx5IGZyb20gdGhlIHRpdGxl
IG9mIFsyXSwgd2hlcmUgaXQgaXMgb25seSBhDQo+ID4gInhlbi9hcm06IGFkZCBpLk1YIGxwdWFy
dCBhbmQgaS5NWDhRTSBpbml0aWFsIHN1cHBvcnQiDQo+ID4NCj4gPiBJIHdvdWxkIGJlIG1vcmUg
dGhhbiBoYXBweSB0byByZW1vdmUgdGhlICJpbml0aWFsIiBpZiB5b3UgdGhpbmsgaXQgaXMNCj4g
PiBhcHByb3ByaWF0ZS4NCj4gDQo+IEkgc2F3IHlvdSBhbHJlYWR5IHJlbW92ZSAiaW5pdGlhbCIg
aW4gdjQgYnV0IEkgd2lsbCBzdGlsbCByZXBseS4gT24gYW4NCj4gZWFybGllciByZXZpc2lvbiBv
ZiB0aGUgc2VyaWVzIEkgYXNrZWQgUGVuZyBpZiB0aGlzIHdhcyBlbm91Z2ggdG8gYm9vdA0KPiBY
ZW4gdXBzdHJlYW0gb24gdGhlIHBsYXRmb3JtIGFuZCB0aGUgYW5zd2VyIHdhcyB5ZXMgWzNdLg0K
DQpHcmVhdCwgdGhlbiByZW1vdmluZyB0aGUgImluaXRpYWwiIGRlZmluaXRlbHkgbWFrZXMgZ29v
ZCBzZW5zZS4gVGhhbmtzDQpmb3IgY29uZmlybWluZyB0aGlzLg0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0K

