Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304B70F344
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538933.839328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1l2d-0001Ka-SU; Wed, 24 May 2023 09:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538933.839328; Wed, 24 May 2023 09:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1l2d-0001I9-Pq; Wed, 24 May 2023 09:44:23 +0000
Received: by outflank-mailman (input) for mailman id 538933;
 Wed, 24 May 2023 09:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1l2d-0001I3-65
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:44:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e724e71-fa17-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 11:44:20 +0200 (CEST)
Received: from DUZPR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::9) by DU0PR08MB8255.eurprd08.prod.outlook.com
 (2603:10a6:10:411::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 09:43:51 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::7) by DUZPR01CA0005.outlook.office365.com
 (2603:10a6:10:3c3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 09:43:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:43:50 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Wed, 24 May 2023 09:43:50 +0000
Received: from 5d54565177c3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6345C028-20ED-4D7D-BE35-E984096BFB8C.1; 
 Wed, 24 May 2023 09:43:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d54565177c3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:43:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9102.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 09:43:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:43:42 +0000
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
X-Inumbo-ID: 8e724e71-fa17-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMAP0MJrxj6d0XOTtOQ8XfnC7l/aGKJtyutcJWc2aPY=;
 b=e2Bx6jpskyQI01fNpl4Uq5L+lFjyM9/X0mARk/DjIQWnSRsXwqGKYX2Xi+Zs2U5Tg6qV5HsBU52DxPPlvfi4nrSIf9ocKGHBk1mJaUaeukjqE7gIYteRsdJ/cQgo9Y0forUBg3g8pCMxVkGgFd6fRbBFdilVA/eruiTsKbkHiLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87fc1ccb1f27b1a2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLAkvsOad2KTObRXiny8oXaX5jKRHX3b548j4d35RkrzZl3pQyIyhu7iCqPdkJgG+HLj3f/tuj6JzeC5s9jDCjVwFuAAhVYDxHs+PS3Cljge5ZeA+Rp/ZeuBw6B48mI60iTqEOC5tz25LuLt9fNeDXWcu8UbX5xCxuGSFPvltM7f/iT+X01N/86PmOyzvBbSTVd4v2c2pnvtnmQPmVii/gaTDr4PJ5W0IZwEh0VBCqyFm1Rpl/N3dEX7h5BWuZhZVV2Xfg/6NsXj0nfDcd2STd+8dVQJSkCzGv1Rfr9p4hjPHQqiXAR6RjcePzCIAJJ4VDKDAxljuKw0QAEOJDkeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMAP0MJrxj6d0XOTtOQ8XfnC7l/aGKJtyutcJWc2aPY=;
 b=kkLbpe+OceNiDq+j/IFnEydCFQA9xkbtu4BcXO5/Z9zCN1+9JuAPNACZl5U1WfpgjOzWoW0H9TW87NIOfG1dQdn9vWK8X5Y9AHi0xyhpNMxJ+C7FZmojKYK8IJ+GHeZHYZnAmrpzSqqBtWs8HhL8Wb+IQxLAyclC4CU5FN0BMP8y+uYFREGkPrGUEXjJnWR0MOULGeOtnArOIEKwf0Aa61DIU+glFipWzvRyp1MQCl4KrabwlZ9P08hl3HxhbvUEnrgoFU3slPMv7DQY1rjCxv213xiMWQeNOMa9HSOOURUDAAqOGgyy8T9TSoz/ktBEyvT9OyVATTQQhvxa53D5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMAP0MJrxj6d0XOTtOQ8XfnC7l/aGKJtyutcJWc2aPY=;
 b=e2Bx6jpskyQI01fNpl4Uq5L+lFjyM9/X0mARk/DjIQWnSRsXwqGKYX2Xi+Zs2U5Tg6qV5HsBU52DxPPlvfi4nrSIf9ocKGHBk1mJaUaeukjqE7gIYteRsdJ/cQgo9Y0forUBg3g8pCMxVkGgFd6fRbBFdilVA/eruiTsKbkHiLs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Thread-Topic: [XEN PATCH 13/15] build: fix compile.h compiler version command
 line
Thread-Index: AQHZjZUfS+Hth9ncdEKi1WC1jlJ0EK9pLTuA
Date: Wed, 24 May 2023 09:43:42 +0000
Message-ID: <35D40E55-2D93-431A-8B16-FCFEBBDA25B1@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-14-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-14-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9102:EE_|DBAEUR03FT061:EE_|DU0PR08MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: db3e4346-229d-4dbe-1fd0-08db5c3b6158
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 60w0RS79KfbiNkufT0MjMfM46TI99Gn+JX6t8VLeKCkqoNDYMClKOhiCQKRn+LX18HYbyaZiJcnhAZ+wT0blh1N2wDPovoMeuNctLFZ6umZ3hnvQZFzGf84dBUDILQ8hURS/iA5X/rMZktRymZbQ69VTr+Jp0qV8Ocpb5F9ZPGU1N7yPLxPsIxAipZr6DRiQ+0wEC5K2bnLQ2UKPLOiFghZ+ryi59FFHp8s/8/VCt2WSCYK5Cq539Gj6hSNKztr5DgvBlJNnMpltjV17TCKpYWy6/KDspkBdUQoTcnJluj2yxdZ6qcQwxTedLUo+rq9gnvH8jXSva/gggc2TcPsDM9ry7r+5uY/2KQe9c+6neT9CVjUZ+pYIHm0Osda7xlit649Han3xLbJ6Abkh3lTAfRE7os8Z8k6+KERrbP5XUAMhqnKSKUS1WvntWEGUYUHosQ8ZAhxOiSOPwYb3/+UMqsqLZWos7fREfRk/IIG6/VYc2S+7xvbXpYnxIyYSgfuck/Inl/cvatlPzXHPm1JlAj/rwhZN98s2QAZAgwXipwk83q/C88djeqONLr9yZAIpiwDvP9zbbP6kK4499eB/C7ZwvNUbMkNMMpT4sHg9DWtAcYDbAakBfD/ykWk+fHT+ZHLE02eqDNVWj2wUkFdjbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199021)(66556008)(8936002)(5660300002)(83380400001)(53546011)(6512007)(6506007)(86362001)(26005)(186003)(122000001)(2616005)(38100700002)(38070700005)(8676002)(33656002)(71200400001)(478600001)(6486002)(6916009)(66476007)(316002)(36756003)(4326008)(41300700001)(64756008)(66446008)(54906003)(91956017)(2906002)(66946007)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <76F57324C2EC3E44A4D66AA7FEDB7AA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9102
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69aae2a3-8f46-4e05-1df7-08db5c3b5c59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ofsKaLD95WYavyChD2+VFy+nSZmCgl6Y5D4JRuhwQyuUhfiKa6Zr4tfvCezFNgfNog2vuXrVeeft3KI7cuzVZDwAqoKW0cYKiZXgocxhS7EXP/uFz13y05nLolCoA3hxMZxSIH/d6q1XIL5eSW/utiF1GX1a1Vdsln9hIG4tF/HMKOxkmKKjxXuwOa6a3U1D1HcVUmvzaDDAAAg1/Peu80aUigLUl85npOk3irwv/HCMDxMgQ5IX60XI6A606yptmZL9+69am7mZWLX0fYxp5Pb7mLkfFYpFSbn+NwoGTp7JlURQZOWuxZDavgFjC9NVqnL94rq3OragOaAgknpm0hro6lMOHTgypVn09BHQ7ds5AkYJLUgFvOyjNRCNnxQkQ08ux8H3osnDk3xVQzKrt1SYmZy1a3fQZOjvtf2cP4WNDLOJnRyEXC8Fe3Gby8a69q7QTFVMfzRyIr+PDeCa5y9PL58MEEuXKhl8cB42ZssBiyxh98j1kAPeou7uhS4RV7xcDfrNvc4jn4XSTv1xpD9htrey8LKdWKintiYoHHTX04uhnG0KA1r+g0sLgn+s9cog8aVAvMTgaSi0ppev47SJ+Yu7kZhqvr01Un+2S8miJyXzx85qeJuSpVOWGWlGhDFym3+RKlAZgbGlm1RPRDL+t8B6No8h7t/yjHxtMDqM3XwZao8T2Fs26eoMbyiV+aWI/K6/kjb4WgU8nS71SUBwctrTXRuei4wUBx8CBNn4O58XG0rlXqibXAe9OhMg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(6486002)(41300700001)(40480700001)(47076005)(186003)(36860700001)(83380400001)(5660300002)(8676002)(6862004)(8936002)(70586007)(4326008)(70206006)(316002)(81166007)(356005)(82740400003)(33656002)(336012)(40460700003)(2906002)(54906003)(2616005)(26005)(6506007)(6512007)(86362001)(478600001)(53546011)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:43:50.8735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db3e4346-229d-4dbe-1fd0-08db5c3b6158
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8255

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDE3OjM4LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBDRkxBR1MgaXMganVzdCBmcm9tIENvbmZp
Zy5taywgaW5zdGVhZCB1c2UgdGhlIGZsYWdzIHVzZWQgdG8gYnVpbGQNCj4gWGVuLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
DQo+IC0tLQ0KPiANCj4gTm90ZXM6DQo+ICAgIEkgZG9uJ3Qga25vdyBpZiBDRkxBR1MgaXMgZXZl
biB1c2VmdWwgdGhlcmUsIGp1c3QgLS12ZXJzaW9uIHdpdGhvdXQgdGhlDQo+ICAgIGZsYWdzIG1p
Z2h0IHByb2R1Y2UgdGhlIHNhbWUgcmVzdWx0Lg0KPiANCj4geGVuL2J1aWxkLm1rIHwgMiArLQ0K
PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS94ZW4vYnVpbGQubWsgYi94ZW4vYnVpbGQubWsNCj4gaW5kZXggZTJhNzhhYTgw
Ni4uZDQ2OGJiNmUyNiAxMDA2NDQNCj4gLS0tIGEveGVuL2J1aWxkLm1rDQo+ICsrKyBiL3hlbi9i
dWlsZC5taw0KPiBAQCAtMjMsNyArMjMsNyBAQCBkZWZpbmUgY21kX2NvbXBpbGUuaA0KPiAgICAt
ZSAncy9AQHdob2FtaUBALyQoWEVOX1dIT0FNSSkvZycgXA0KPiAgICAtZSAncy9AQGRvbWFpbkBA
LyQoWEVOX0RPTUFJTikvZycgXA0KPiAgICAtZSAncy9AQGhvc3RuYW1lQEAvJChYRU5fQlVJTERf
SE9TVCkvZycgXA0KPiAtICAgIC1lICdzIUBAY29tcGlsZXJAQCEkKHNoZWxsICQoQ0MpICQoQ0ZM
QUdTKSAtLXZlcnNpb24gMj4mMSB8IGhlYWQgLTEpIWcnIFwNCj4gKyAgICAtZSAncyFAQGNvbXBp
bGVyQEAhJChzaGVsbCAkKENDKSAkKFhFTl9DRkxBR1MpIC0tdmVyc2lvbiAyPiYxIHwgaGVhZCAt
MSkhZycgXA0KPiAgICAtZSAncy9AQHZlcnNpb25AQC8kKFhFTl9WRVJTSU9OKS9nJyBcDQo+ICAg
IC1lICdzL0BAc3VidmVyc2lvbkBALyQoWEVOX1NVQlZFUlNJT04pL2cnIFwNCj4gICAgLWUgJ3Mv
QEBleHRyYXZlcnNpb25AQC8kKFhFTl9FWFRSQVZFUlNJT04pL2cnIFwNCj4gLS0gDQo+IEFudGhv
bnkgUEVSQVJEDQo+IA0KPiANCg0KWWVzIEkgdGhpbmsgQW5kcmV3IGlzIHJpZ2h0LCBzbyBJIGd1
ZXNzICQoWEVOX0NGTEFHUykgY2FuIGJlIGRyb3BwZWQ/DQoNClJldmlld2VkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUg
PGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KSeKAmXZlIHRlc3RlZCB0aGlzIHBhdGNoIHdpdGgg
YW5kIHdpdGhvdXQgdGhlICQoWEVOX0NGTEFHUyksIHNvIGlmIHlvdSBkcm9wIGl0IHlvdSBjYW4N
CnJldGFpbiBteSByLWJ5IGlmIHlvdSB3YW50Lg0KDQo=

