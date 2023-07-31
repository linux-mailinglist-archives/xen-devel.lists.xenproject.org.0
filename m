Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EDE769BD9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 18:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573186.897671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVQC-0006SK-B0; Mon, 31 Jul 2023 16:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573186.897671; Mon, 31 Jul 2023 16:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVQC-0006QI-77; Mon, 31 Jul 2023 16:07:00 +0000
Received: by outflank-mailman (input) for mailman id 573186;
 Mon, 31 Jul 2023 16:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3vB=DR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qQVQB-0005wy-3N
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 16:06:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 461a479e-2fbc-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 18:06:57 +0200 (CEST)
Received: from DU2P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::22)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:06:27 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::ab) by DU2P251CA0009.outlook.office365.com
 (2603:10a6:10:230::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43 via Frontend
 Transport; Mon, 31 Jul 2023 16:06:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.43 via Frontend Transport; Mon, 31 Jul 2023 16:06:27 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Mon, 31 Jul 2023 16:06:26 +0000
Received: from 2ffec257ab8c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D3ED97A-F1B6-4CE4-99A2-350D8C08602B.1; 
 Mon, 31 Jul 2023 16:05:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ffec257ab8c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 31 Jul 2023 16:05:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10282.eurprd08.prod.outlook.com (2603:10a6:102:35c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:05:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 16:05:49 +0000
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
X-Inumbo-ID: 461a479e-2fbc-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhiZfmuZN2Uh2vTgT7CdSDeJOhrDDBKo2iB2Z/zXyiY=;
 b=NOzQKgMcJXAQQ3v4Q1QlJWFr8niG6TBBQ8zkfaZcf5KG1mkle7N7LrW6zlDTZ66TSqm2B+ADw3XWvEHjXOtwA09tRPMOen/yYQm0p5e9s1SvhG/hiCQtAhoAj1FkHEpQ7TBjPNi/wt5tZ7ivNCumdpcy1LPBFlBGgqmReACr3XU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff119f0e35063ceb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlRZPhJV2vLue+pD+JSEsrHYxAMXab4oWlAw1n9SJiLNcEkX+ryPDgG0kcqxLBlMDMYd1+jsbAeKLJ4iauUTsYq5KCXYHI8u9dtOtEKGYID2fa104IaoCuDwzWUT2eW5Z3dJPnszH4w6SbaEMqPMJhxVunm30nvfA/cNAaSg4qReKK0n2s0GYfTEXRp9cSBp7OqvkLqz5ZroBK0w7faOyXRP0foctVHpBdeYli6wqUcq/Sq3976LCSRaFY35s6J90nf5w4vvPS7hsS5gkt6cVUKJnkV2ONPNajFw7Z1A2HrKdszEpCz/eVTs2B8wW9+SjqIKyYUi/lDvC46q1R0mRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhiZfmuZN2Uh2vTgT7CdSDeJOhrDDBKo2iB2Z/zXyiY=;
 b=Ie2H8FVg+jcuDVZ4qrkxGwId9c8UqVkUg+EXvOJ5PeaZJdFJTLKIBdMmcZVwMdTGyVM8JqC6vuLuHp3rBoTPp1MiRMgHSk5aNW9fdSq9cH6SYkczwyKJpao4ucCY+yjkQrQ+SIwBC8GOkHPVPQ3RacH4bfk5Z2QMJIuSo1LaU3v0CRDuVpMVLUYuUYP7lbK2U7GImur/31qHE2VDthofhunDqTRVkt4hxujugOE0YHIR4DLgoT6fNfewo90SS4coZ9emZan1zeInWmSu7NSUQsRjtxFBihltHu0xs5aIp8LCF9sd7zzk2fZALb9a4XaGXhgfQGLePscYD95QtYkatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhiZfmuZN2Uh2vTgT7CdSDeJOhrDDBKo2iB2Z/zXyiY=;
 b=NOzQKgMcJXAQQ3v4Q1QlJWFr8niG6TBBQ8zkfaZcf5KG1mkle7N7LrW6zlDTZ66TSqm2B+ADw3XWvEHjXOtwA09tRPMOen/yYQm0p5e9s1SvhG/hiCQtAhoAj1FkHEpQ7TBjPNi/wt5tZ7ivNCumdpcy1LPBFlBGgqmReACr3XU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Thread-Topic: [RFC PATCH 1/5] [WIP]misra: add entries to the excluded list
Thread-Index: AQHZwSs9042EQJWI+kCE6wP5BUPzKq/T/JsAgAADsACAAAJogIAADKcA
Date: Mon, 31 Jul 2023 16:05:49 +0000
Message-ID: <17788E9C-3F21-4817-A28B-1822AFE42E01@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-2-luca.fancellu@arm.com>
 <876c7fa3-6759-ce5a-9e6d-9737eb4eb9ad@suse.com>
 <2C6F7309-B7EA-4FAA-8C72-E95D253F79FC@arm.com>
 <6356ab5d-1ecd-da3c-4738-fb33ee2b187b@suse.com>
In-Reply-To: <6356ab5d-1ecd-da3c-4738-fb33ee2b187b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10282:EE_|DBAEUR03FT045:EE_|AM7PR08MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: d27b31e8-cae3-457c-64c8-08db91e0187b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WZDGqt7gAxQeaNORCYphBwSVm1T2yxckzMEkti7AsyZyKFXrgeTpmIYrLk6WTM4nPKBryJz5kuZVrDI56pqF6+zChIb9qKqAt/yPLHx+arO/N5U++x8R4hviHTAYbj2u4dJZ5JaMBiacZWrBHLVc4Bj5sE/b9rKPV19Dx823K+ovo6+qUL0fcJz4Te8CS2057DfY8OCfmacjsAVF3LM8bgbj4nQn+7aG1/Ii94byhdvabyePHnyofCFBu4eTBtCRixl6GvFwTZQMrIyyZ7EklN+r/SBg9X56jdjY5j1oJA7F/Zj1F1JZYFMpJUTjdSY7VDsWJFBkWctxGAeIEOrnzgryiE6ZnlNCGAYiwp4trNBLpEsQ4XPnctBD2oq6XnNrv19CCdXABzhGjB7nDWn39KkCHTJNLpGWO9UIREi/JDKtLzR/ENmNU33BWdclamx5Dkyd+zaIjFthw6/X1FAioxbw/jT/vtFv1ZTf+t0bGMGsGvsxhS0B0NkPbK3qmeeRetTk106qDYdJhJjaYwkKHjtrGjmEz0HbX4WDaxgBqdDM79Py5bV028BPJpoyC1fqT8FqzKQcxTVLK2OmsanhGpgLxIc4NmrdRULa0G9e7Brgb4D8987R2FeNu42GWYutCUD3wZiodL9Eb+LB4llP4w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(186003)(33656002)(76116006)(91956017)(66946007)(66556008)(54906003)(41300700001)(122000001)(38070700005)(66476007)(86362001)(316002)(4326008)(5660300002)(66446008)(6916009)(64756008)(8676002)(8936002)(2906002)(71200400001)(478600001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <60879C7B86E37D45B9C60665FE0E23EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10282
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c043e38a-14bd-4379-154a-08db91e00229
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PMArc8zVb3W92H1aL3hwH0iX6gQEJlXm6rlvTPxBV7qMA7JlGUNEQliXHEBea8x6D4aoPxLLlUAAPfwkDCSBoURGjAByYUiR8XEhGOHgxFBwLdb2h84BDhZHzMYj+KsTAud3d/+DZGTWFKwjJEhkJKggAW8S8p3ngvbSytCX2JpLmeoy7RNIFs2Ebde9s4LICsoWwWof4UpwYmBi+B4/Gv+nH4s/SwUeTPtcDW9B7Y8AMVfBKMSFTmuUfMlb96XdduQLdhs0hliNgbGodccFGf6S0n5E7I27+CLeiL22CJJuzF9xq0KeJnU2j95MikfUFv56vFw6YSrJmZ/8CGmrmp5ZR1uxSlZJ83SL7BJISkj1kfQGBTd8vR29KFDYCF2EZlX+KpUEtioTrYnC5FTRBp2r3anKn/FBKU1gT0YtBSo121lQfxvgwhU+1AT8OW8jVOBPwC+xZgT9NZ+Y33PFCOMFTPrReYh97L7jUIMEhx7kxT1x6xI9Lzplhy5bum7swOVywEEupvkQ9h0QCw3qMsbrznkV5QToA7Z8eWbhUtvWXmPyDavXI7vzgmorbA+U4GwXLDnKyWJQMTD6PiervsZjv5J1JW2LBsinkd1zxfP0qZrDyWOphHEheJ6ySRhtROc87E+Nu370G4Zna6gaBLcSd/ESiJNXw3TtpTukyHYbgphDAHdCYckvfKINTLbP3L1nrBTnSqTk/ZH3jAAJLzv0ZeUlMGH0pp7CQyElPJA4fvX9CL8t84b316V+o7pR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(478600001)(356005)(81166007)(82740400003)(40480700001)(86362001)(36756003)(33656002)(6512007)(40460700003)(6486002)(2616005)(53546011)(336012)(186003)(26005)(8676002)(8936002)(6506007)(6862004)(5660300002)(70586007)(4326008)(2906002)(70206006)(54906003)(41300700001)(316002)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 16:06:27.2342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27b31e8-cae3-457c-64c8-08db91e0187b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496

DQoNCj4gT24gMzEgSnVsIDIwMjMsIGF0IDE2OjIwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzEuMDcuMjAyMyAxNzoxMSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgInJlbF9wYXRoIjogImFy
Y2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oIiwNCj4+Pj4gKyAgICAgICAgICAgICJjb21tZW50Ijog
IkluY2x1ZGVzIG1vc3RseSBhc3NlbWJseSBtYWNybyINCj4+Pj4gKyAgICAgICAgfSwNCj4+PiAN
Cj4+PiBNaW5kIG1lIGFza2luZyB3aHkgYXNzZW1ibHkgbWFjcm9zIHdvdWxkbid0IHdhbnQgbWFp
bnRhaW5pbmcgaW4gcHJvcGVyDQo+Pj4gc3R5bGU/DQo+PiANCj4+IEZyb20gd2hhdCBJIGtub3cg
KGV4cGVydHMgb24gQ0YgY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nKSBjbGFuZy1mb3JtYXQgaXMg
bWVhbnQgdG8gZm9ybWF0IG9ubHkgc29tZSBsYW5ndWFnZXMNCj4+IChDL0MrKy8uLi4pIGFuZCBh
c3NlbWJseSBpcyBub3Qgb25lIG9mIHRoZW0sIHNvIHdoYXQgaXMgaGFwcGVuaW5nIGlzIHRoYXQg
bW9zdCBvZiB0aGUgdGltZSBjbGFuZy1mb3JtYXQgYnJlYWtzDQo+PiBpdCwgaW4gZmFjdCB3ZSBh
cmUgZm9ybWF0dGluZyBvbmx5IC5jIGFuZCAuaCwgYnV0IHNpbmNlIHdlIGhhdmUgc29tZSBoZWFk
ZXJzIHdpdGggYXNzZW1ibHkgbWFjcm9zLCBJ4oCZdmUgc2VlbiBzb21lIGlzc3Vlcw0KPj4gdGhh
dCByYW5nZXMgZnJvbSByZWFsbHkgdWdseSBmb3JtYXR0aW5nIHRvIGJ1aWxkIGJyZWFrLg0KPj4g
DQo+PiBPbmUgdGhpbmcgd2UgY291bGQgZG8sIGlzIHRvIGV4cG9ydCB0aGUgaGVhZGVycyB0aGF0
IGNvbnRhaW4gb25seSBhc3NlbWJseSBzdHVmZnMgaW4gZGVkaWNhdGUgaGVhZGVycyAoPGhlYWRl
cj5fYXNtLmggPykNCj4+IHNvIHRoYXQgd2UgY291bGQgZWFzaWx5IHVzZSBhIG5hbWUgcmVnZXgg
dG8gZXhjbHVkZSAiKl9hc20uaOKAnSBmcm9tIGNsYW5nLWZvcm1hdD8gQW5kIGFsc28gdGhlc2Ug
aGVhZGVycyBjb3VsZCAjZXJyb3IgaWYNCj4+IGluY2x1ZGVkIHdoZW4gX19BU1NFTUJMWV9fIGlz
IG5vdCBkZWZpbmVkPw0KPiANCj4gSW4gcHJpbmNpcGxlIHRoaXMgbWF5IGJlIGEgcm91dGUgdG8g
Z28gKG5hbWluZyBhc2lkZSksIGJ1dCBmaXJzdCBvZiBhbGwNCj4gSSB3b25kZXIgd2hhdCAiYXNz
ZW1ibGVyIG1hY3JvcyIgYXJlIHRvIHlvdTogV2UgdXNlIGJvdGggQyBtYWNyb3MgYW5kDQo+IHRy
dWUgYXNzZW1ibGVyIG1hY3JvcyBpbiBhc3NlbWJseSBjb2RlLiBUaGUgZm9ybWVyIEkgd291bGQg
aG9wZSBmb3JtYXR0aW5nDQo+IHRvb2xzIGRvbid0IGhhdmUgYW4gaXNzdWUgd2l0aC4NCg0KWWVz
LCBDIG1hY3JvcyBhcmUgY2xlYXJseSBub3QgYW4gaXNzdWUsIHRydWUgYXNzZW1ibGVyIG1hY3Jv
cyBhcmUsIGxpa2UgdGhlIGV4YW1wbGUgYmVsb3c6DQoNCiAgICAubWFjcm8gQlVHX0ZSQU1FIHR5
cGUsIGxpbmUsIGZpbGVfc3RyLCBzZWNvbmRfZnJhbWUsIG1zZw0KDQogICAgLmlmIFx0eXBlID49
IEJVR0ZSQU1FX05SDQogICAgICAgIC5lcnJvciAiSW52YWxpZCBCVUdGUkFNRSBpbmRleCINCiAg
ICAuZW5kaWYNCg0KICAgIC5MXEB1ZDogdWQyYQ0KDQogICAgLnB1c2hzZWN0aW9uIC5yb2RhdGEu
c3RyMSwgImFNUyIsIEBwcm9nYml0cywgMQ0KICAgICAgICAgLkxcQHMxOiAuYXNjaXogIlxmaWxl
X3N0ciINCiAgICAucG9wc2VjdGlvbg0KDQogICAgLnB1c2hzZWN0aW9uIC5idWdfZnJhbWVzLlx0
eXBlLCAiYSIsIEBwcm9nYml0cw0KICAgICAgICAucDJhbGlnbiAyDQogICAgICAgIC5MXEBiZjoN
CiAgICAgICAgLmxvbmcgKC5MXEB1ZCAtIC5MXEBiZikgKyBcDQogICAgICAgICAgICAgICAoKFxs
aW5lID4+IEJVR19MSU5FX0xPX1dJRFRIKSA8PCBCVUdfRElTUF9XSURUSCkNCiAgICAgICAgLmxv
bmcgKC5MXEBzMSAtIC5MXEBiZikgKyBcDQogICAgICAgICAgICAgICAoKFxsaW5lICYgKCgxIDw8
IEJVR19MSU5FX0xPX1dJRFRIKSAtIDEpKSA8PCBCVUdfRElTUF9XSURUSCkNCg0KICAgICAgICAu
aWYgXHNlY29uZF9mcmFtZQ0KICAgICAgICAgICAgLnB1c2hzZWN0aW9uIC5yb2RhdGEuc3RyMSwg
ImFNUyIsIEBwcm9nYml0cywgMQ0KICAgICAgICAgICAgICAgIC5MXEBzMjogLmFzY2l6ICJcbXNn
Ig0KICAgICAgICAgICAgLnBvcHNlY3Rpb24NCiAgICAgICAgICAgIC5sb25nIDAsICguTFxAczIg
LSAuTFxAYmYpDQogICAgICAgIC5lbmRpZg0KICAgIC5wb3BzZWN0aW9uDQogICAgLmVuZG0NCg0K
SSBkb27igJl0IHRoaW5rIENGIGhhcyBrbm93bGVkZ2Ugb2YgdGhlIHRva2VuIC5tYWNyby8uZW5k
bS8uaWYvWy4uLl0gYW5kIHNvIGl0IGZvcm1hdHMgdGhlbQ0KaW4gd2VpcmQgd2F5cw0KDQo+IA0K
PiBKYW4NCg0K

