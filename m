Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BD6C44B4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513169.793782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peteJ-0007A4-KQ; Wed, 22 Mar 2023 08:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513169.793782; Wed, 22 Mar 2023 08:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peteJ-00078A-FS; Wed, 22 Mar 2023 08:16:47 +0000
Received: by outflank-mailman (input) for mailman id 513169;
 Wed, 22 Mar 2023 08:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaYW=7O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1peteI-000784-Fb
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:16:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e11194c2-c889-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 09:16:43 +0100 (CET)
Received: from DB7PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:10:36::43)
 by AM8PR08MB5826.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:16:41 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::82) by DB7PR05CA0030.outlook.office365.com
 (2603:10a6:10:36::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 08:16:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 08:16:40 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Wed, 22 Mar 2023 08:16:40 +0000
Received: from ec6708ca4a6e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFA685F7-F430-4B3B-9EBC-80C3D1FEFBF5.1; 
 Wed, 22 Mar 2023 08:16:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec6708ca4a6e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 08:16:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:16:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:16:24 +0000
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
X-Inumbo-ID: e11194c2-c889-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmjL4GQTBS8g/UNMWGpjhLDq161rA8RrBkoWZWp2SfU=;
 b=xxz0WcTRuC9oXdXMdWnOtelExKYbCO6LI2ZlhFBhhhs+qE8jIntKfuFCQ43bpU3gzD4upveH/nObSp88rTkltlPqPoFcqGTPk565p8HZqn30Cv86tXYcETKfDeSBI+uIUHGLddbpUfQTofHBydjJGyQwahACjEGDL4cDhA85Ln0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RglMv6FPvi2D8wYLz0+hz13Tm0RVhC6WSlH3hjs+GDc1pPETGEeVWizlbZOEMF1mqV7ZoejDn3V9pb3z3+3AAr8PioQQbLiwFJXNlGwqhFQVe9HqzcjPm3LUAO9JDkjzJ04z+ktkETrXVj6j69U/PiO/gHftgFvNbSco1BFCqC41+5TGO3mbYObNdp9ZzgoARxqIBgi/gLzLTS72w88pOQZ/Wse2B39Ny3KX6PxhYNshgK1v/DmGb1yNriWtbsQtib5WIBtskijY/39CdKyOA7CwQNuY/3prf8Yq2pqaY7LXO4qlSwbP7Y67HqoqGWbHJorOhzBQRhqHMWf0oPFADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmjL4GQTBS8g/UNMWGpjhLDq161rA8RrBkoWZWp2SfU=;
 b=jf5suM2p6y6C62ysJU8mJGPkz5Zcf1idDbJ8Cd6eTNKpiWPrKkXEU5MEDugMed30akI9rGgq62gKdrpzWNXV2+6jOSA5cdosnU8XxdYGS++CFH8zTCyGYX0TzgQ8TQqJGZN5SEDfSqRtEnAYWuv3mYp6sMz+cnAE0kf635UqmQz50AnPp4lVJmSixaSZvwRtwdcTBFl3KI5GW26AVRK1WveZ1Z50kSfKyzKnbbFUrRdX2vhHtMoS7M4L0P9Yz2vtdDg4Z8U2xAxiMWnR1G7U+Rz4RPI4lgpVxoDmINfB/Tn/SF/lVE3f5XpCH3zYNTLfWFj9kqPKB0uWqo/nPSF+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmjL4GQTBS8g/UNMWGpjhLDq161rA8RrBkoWZWp2SfU=;
 b=xxz0WcTRuC9oXdXMdWnOtelExKYbCO6LI2ZlhFBhhhs+qE8jIntKfuFCQ43bpU3gzD4upveH/nObSp88rTkltlPqPoFcqGTPk565p8HZqn30Cv86tXYcETKfDeSBI+uIUHGLddbpUfQTofHBydjJGyQwahACjEGDL4cDhA85Ln0=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Topic: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Thread-Index: AQHZNGBFU1FB2zU45UWPsIKl0/PSm68FsPqAgACrD/CAAGR+AIAAAJlw
Date: Wed, 22 Mar 2023 08:16:24 +0000
Message-ID:
 <AS8PR08MB799115E41813D9193B96124292869@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-5-Henry.Wang@arm.com>
 <a2287b5b-40b1-aeab-8f07-413853d2484d@xen.org>
 <AS8PR08MB7991321C63BE43F1C54D21E092869@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e3f3bc32-ab6e-cf8b-b3ae-e6922981d839@amd.com>
In-Reply-To: <e3f3bc32-ab6e-cf8b-b3ae-e6922981d839@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 04774857D8AD074993AD1B2B724931BF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6093:EE_|DBAEUR03FT047:EE_|AM8PR08MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f415c6-6274-4d66-48b9-08db2aadc3c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QxG/MLbIitMt1d2RGX0KxdrAsRZb8TLjJseexhsIMgdZvCJTxgRtV+5eBFBNdDmljYJCabukEu9QeRaw28oat2sQw5QBT2guIvjk2xC6ds9FnR/EtgLYTgoU3FBnGghUFJHjbGJ1uKC4Nbkm598X1DpUvxxZ/4Y6dcWaVpHPRGLSkzUZQBZjOaqX5GjsG0CIDa2C6zArU6AhWjB7JksTGVIdKlSxUV/44fvHGn9AJnXUmiWruP3K8kyZlDipMsqnoN/r4YAaxEUTYIDgFMeT0J3LGeQw+/xkwhgTt4S09QnEYz2CO/zL0p2E8CMJF/3C5qQxK02AZb+duloyPRe70EZi/jL9P6zyvp8lEnLcNBdBHH3Lm0va3HfrsFRdEFzWrqrjnb5F32kmFDovyDtU0Y//58csds2DHNC3sGRK/nduaIIW4meJ66Th7oHid6DoxiYggBHWASfbKgCK6j2e/rgJyku6s+wmSlCZs4RSlof468/4ypckZl0hR2eh+WqFoHx7ZGn/23q9JOvcrLHr0YwyCwrXfo5NK8jeD4XTXM+vCcULTXGOBfPuUFJY49bBQbPo2aQSO0tT5e5P6msYPxjom5T0p5biVGZKoB1of8G6dV1rbhJLJKkuAQsRoTRCx+mvLLJqe5NuAi6l7csPyoQjF4ndX/05fp/QUqSmJbZOhiAgOo/Et8aorQjcXwF3fAsawZUJn9QJiRJa6BhcgQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(86362001)(33656002)(55016003)(316002)(66446008)(4326008)(66476007)(64756008)(66946007)(186003)(76116006)(110136005)(8676002)(66556008)(478600001)(9686003)(54906003)(26005)(83380400001)(6506007)(38100700002)(71200400001)(7696005)(38070700005)(5660300002)(4744005)(2906002)(52536014)(8936002)(41300700001)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	902a6748-4706-410b-7f7c-08db2aadba71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u2GCe3b5sMF8nQRhISiW2xi96pBDvCooHKNrh1X9ngpsWDyn27gmm6/9lrBZsc+prWhd7PbjYFeU/MEL41zBIR9Pjnz6HcxKG+oUjr1oGwgTfqmZBs4XbW0AmGlDDlltgzVtOkzenFVk+JnxsDNj2n17kHl049kcvse9ts5lFiouLwn4MEiDOchsLemzWQJ2YAgs0NIZZVeq9a+feIS4yTUBafdTafTsxfxGtVmLcOmppqgVeT2v3rMVhq4MvK6NkhMzKVcp5FUdtEhrascwczQ3SOgUEitQktZqXQ/qk1ruTC8vEE1zkcKaOHroR61sJpRPHeWB007COkOu19vUFQVWT3o+exCT3LXY3ubyiGmAwciBSjhKHoPCq5J+91YW49Ac6ahTdAJwPCRwIDuAP+Eb86Vhs1oDzw3ERUTxwjLt839mSY3iao1m+vUnloc9PQ3Moe5bJCQzrYqG3F/6PllE70N7flpkIOM6xA6VLhbMLrDrN/Z6MW41dUbMYrWABiKVZNrry35EJuo73ooYjEwIbfugm2vVAfZmE5XVG9Rfpj8/uy0jFepFWoPKjEXOV+7fu7ZJzhMbQN5+AU7xFMhSR2iD9e3c8iGz5KKHhPGtaJ+tQ3rL/HhEtg3oAxDQ7+oruobv5S6vYVdnAWlf3yDDFRveBL+lgTudW6ZldwpIBgMdQuR9IGN4Csz985ZjelGcJ5qlJsV0j/+3uO4hiw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(86362001)(40460700003)(33656002)(356005)(4326008)(54906003)(70586007)(41300700001)(70206006)(8676002)(316002)(478600001)(5660300002)(110136005)(8936002)(52536014)(4744005)(9686003)(82310400005)(2906002)(36860700001)(83380400001)(186003)(55016003)(26005)(82740400003)(6506007)(47076005)(40480700001)(107886003)(81166007)(336012)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:16:40.4990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f415c6-6274-4d66-48b9-08db2aadc3c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5826

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
NC80XSB4ZW4vYXJtOiBDbGVhbi11cCBpbiBwMm1faW5pdCgpIGFuZA0KPiBwMm1fZmluYWxfdGVh
cmRvd24oKQ0KPiA+IElmIHlvdSBhcmUgaGFwcHksIEkgd2lsbCB0YWtlIHRoaXMgYWNrZWQtYnku
IFNhbWUgcXVlc3Rpb24gdG8gTWljaGFsIGZvciBoaXMNCj4gPiBSZXZpZXdlZC1ieS4NCj4gVGhl
IGRpZmYgbG9va3MgZ29vZCB0byBtZSBhbmQgc3VyZWx5IHlvdSBjYW4ga2VlcCBteSB0YWcuDQoN
CkdyZWF0LCB0aGFua3MhDQoNCj4gSG93ZXZlciwgd2UgbWlnaHQgd2FudCB0byBtb2RpZnkgdGhl
IGNvbW1lbnQgb24gdG9wIG9mIHAybV90ZWFyZG93bigpDQo+IHByb3RvdHlwZSBhcw0KPiBpdCBh
c3N1bWVzIHByZXNlbmNlIG9mIHByZWVtcHRpdmUvbm9uLXByZWVtcHRpdmUgcDJtX3RlYXJkb3du
KCkgY2FsbCAoYXQNCj4gbGVhc3QgdGhpcw0KPiBpcyBob3cgSSB1bmRlcnN0YW5kIHRoaXMpLg0K
DQpJIHVuZGVyc3RhbmQgeW91ciBwb2ludC4gSSB3aWxsIHJldmVydCBpdCB0byBpdHMgb3JpZ2lu
YWwgZm9ybSB3cml0dGVuIGJ5IEp1bGllbjoNCg0KInAybV90ZWFyZG93bigpIHdpbGwgYmUgY2Fs
bGVkIHdoZW4gcmVsaW5xdWlzaCB0aGUgcmVzb3VyY2VzLiBJdA0Kd2lsbCBmcmVlIGxhcmdlIHJl
c291cmNlcyAoZS5nLiBpbnRlcm1lZGlhdGUgcGFnZS10YWJsZXMpIHRoYXQNCnJlcXVpcmVzIHBy
ZWVtcHRpb24uIg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB+TWljaGFsDQo=

