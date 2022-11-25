Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE36386C5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 10:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448138.705036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyVN3-0002XT-7q; Fri, 25 Nov 2022 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448138.705036; Fri, 25 Nov 2022 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyVN3-0002V2-3Z; Fri, 25 Nov 2022 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 448138;
 Fri, 25 Nov 2022 09:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7Aj=3Z=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oyVN1-0002Uw-TA
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 09:51:43 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe16::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda65b77-6ca6-11ed-8fd2-01056ac49cbb;
 Fri, 25 Nov 2022 10:51:32 +0100 (CET)
Received: from DB7PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:36::22)
 by PAVPR08MB9063.eurprd08.prod.outlook.com (2603:10a6:102:325::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 25 Nov
 2022 09:51:36 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::b1) by DB7PR05CA0009.outlook.office365.com
 (2603:10a6:10:36::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20 via Frontend
 Transport; Fri, 25 Nov 2022 09:51:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19 via Frontend Transport; Fri, 25 Nov 2022 09:51:35 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 25 Nov 2022 09:51:35 +0000
Received: from c54c13d571fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4189312C-DE39-4DBA-A91D-51A838712D66.1; 
 Fri, 25 Nov 2022 09:51:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c54c13d571fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Nov 2022 09:51:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8322.eurprd08.prod.outlook.com (2603:10a6:10:40d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 09:51:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 09:51:21 +0000
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
X-Inumbo-ID: bda65b77-6ca6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gWSvdJ+Y2FaDbPjXGlUOygDlEab3wuQ1RDDPbO0OgE=;
 b=7MN4b2/lRA1jrYHox+ww7S60ftklgwsBURNXdK2wBPHSl+IjAP4MkVKk3QzykqUSqaevTz3Ze+X2oxQ3qZ2ROlqyO/MeNxVzwYbSdQouypepn/Rzl13zDHSqRFsKb6trIvZOz/wQYl+64Py5ZIavSgciDrnw8S42JtbhYgxIpnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81a2d878a372757f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJHstpDgJa1MIHgcqzfHmAdEBEM+nBadNWKCBeM0psNA9hNVh/Xj2gq5aH0e3dIHj6WuLsOQeGIaONnmAqrbpQH0iw85aUxcCoyAvTw0jehQhJgB1sNZKr/8lRkHPkN9esh7dBOk6CdrhKXVMWnNbNHJoBiE4ceD2rtO9JI7gpB0FPYTLcJzaDOo2vJnWN2MUfIy7IKZMMIUKRe2C0hx9fT8f5DmS1jvrPsIuiFQaD5UMChuQsCUtGi9/DUbqKe7A2mMEHs3QvxCXQhvtsTKgosBKd5Nxj3LI2oSjTo35FQxxpf/ZDoMONT0g8suPcxvpjKd+SbCoBBE7GW6m4MbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gWSvdJ+Y2FaDbPjXGlUOygDlEab3wuQ1RDDPbO0OgE=;
 b=SrTgjnvqys5ZLVgvylDezjeXP1GXKMEW//rtm4D6iErVCdXDVpLGyGyXmSNKKWKtCovwRfJ8FLX+XUORnQDEWR0EGjTidv8zRKRL9Tcx63I6ux3sLVQLtdyd4iFfO8sdqD201m31zfzp2QFDHCpWBwCw+n2zgzGTgvkzdvHmIYTL6lpprxZBskw/RWLg/Ey1WuIcbuz5JsNqfw/xQkI8cMFVkLWLWoH1htSCvkc85/7fIYAqzzMIQCzpfbkVEBqMsb+ry2Zlfvs1A1GsQDgokVd3tgTVaXDML/CdousgP/BTeeb2qdIY/SdfMt68OyPUdwdVTfiLXDK5v3B7zpM35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gWSvdJ+Y2FaDbPjXGlUOygDlEab3wuQ1RDDPbO0OgE=;
 b=7MN4b2/lRA1jrYHox+ww7S60ftklgwsBURNXdK2wBPHSl+IjAP4MkVKk3QzykqUSqaevTz3Ze+X2oxQ3qZ2ROlqyO/MeNxVzwYbSdQouypepn/Rzl13zDHSqRFsKb6trIvZOz/wQYl+64Py5ZIavSgciDrnw8S42JtbhYgxIpnA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework
 COPYING for installed Xen public header
Thread-Topic: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework
 COPYING for installed Xen public header
Thread-Index: AQHZACPtPzSDrvGd206XhRT1bHCUjq5PZqgA
Date: Fri, 25 Nov 2022 09:51:21 +0000
Message-ID: <08F48822-0178-41E0-AF12-6F30187FEC6E@arm.com>
References: <20221124164254.33476-1-anthony.perard@citrix.com>
In-Reply-To: <20221124164254.33476-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8322:EE_|DBAEUR03FT004:EE_|PAVPR08MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cdb6e26-1df3-45c6-a57a-08dacecaa3e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bzNJtMXSlbG/7HFvXfEPmCV2Fs8e7Sb50Hvm9zR62DHKBXJ/KGjn9jqVAiUGA4C8sdBGGPlAGT+MYEEpTSoGxkvO75u8XyHFU2fh2Qm7PMcsftzXX749dz/FMHdmVECnCAfSwXsmwkQx+x8rHPWfv3TWYLMFMDsu9Rolq1e70VOVkq6vV3Rq8TePEHV8a/V7d8/vLFBuyFXU9xjTT4vZeonUCd0ZdqnIQeNzWZU4bmFnW6v4Kg/RxkoDbZoZreh2GeWfZBiQ6gLykID36Dlq4i6hWVUilUmyoQ7bBrpUM1eMDPd5idZDyyftanFHlRZctrJnRtq7aGjZqpAcmfyGcPwV5MpvNrmM+yx+EFQ0tFHMqtF5V8tzXSghtkugN0hF3lCEv5sf+Hx4PWjUZppQmI35unDnGa4JDzyIjSadW29y+ubR7Ik4Bq8xqk7lIvT9OVsLXIfXN4xiluMngREqLlIx8GP7z2TT9ZMog2Tjlh+1cAkfixTvzhEbB1r+7zcTkSw0C14m65iB/RMLk4SoDAyOC3ImSTJCQkMceiahH8MbKdAAcvloB2LnW1t+DtYs0BkJD6gP53ME1e6YBEAG3Ascqnq2eVhTmhvcAuhwnKMZl14DfvmT5SvXvA2SDKYDFI61pCJCf6ier2FjMBNH9BwdTw2zpRLNeuY66KTSjsg6cMNN8Hi9+ru9Z3WBHXfZNRPvLUSqdFvY7Y6FCux8SuW4id3KVQvAfV0ANExnhNg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(2616005)(186003)(66446008)(53546011)(36756003)(5660300002)(41300700001)(6506007)(6512007)(26005)(38070700005)(6916009)(33656002)(54906003)(316002)(86362001)(478600001)(66476007)(6486002)(71200400001)(8676002)(66556008)(64756008)(4326008)(66946007)(91956017)(76116006)(38100700002)(8936002)(122000001)(2906002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC9395657DF0FA41A54AE68EC7476D29@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8322
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e14b6ad-1069-4baf-77e4-08daceca9b75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kHUnXvhYF8Wb7gHKHdMFZX5Ww+S5SQkJC+3ZuMpprv+aMiyHtjn+yOlBhqYf8B0yFF5W3Q5yn78MLinA6Ua9IiJDQ8xK6UYIzNriOl+7rvAuz3NMyYH2yfvBDMQZHe7uze2f6fr6XVCvUPnB09toKDUB7qeIcRieMfIVqWGWWdyrtceU/wpEyT03vaXNJzyL7Ioucxif7X9PPeRQfptgDNzkQl9d3TttMDAqFmq2zjibcpd05yhB4SuiS/BEFa79VtX2VIJTwLLZFfqzuyHm8pTqibBKyBu4GOvSEAfrLDJIxJF+Xsf7pKz8vjezs8uZsO2t1J+Vgq1YbqAiXX3JwhlBEOgvXFZFv4oO85LKqreotwtiNSa8oscsBFO1Gf2deGR6sCmt3JpFvNzowRsP5Un0LF+Djc7NRH0p5k+9BMuZM90r4Zpj6XBvIxwKtQ2CSLX6KQqZ8pHqRYN+d1hQKF/nKICU8rJq51FcZjaEX8iiawgkmZfEjKyAem7EH0q9ZCYzc3xEEF12Gfujs25MvPN2pX/sOQrGlYaTCgfJZUlgj/UDDHpLSh6SQcB+22ZkS64ztqEUSYpoCwRtq1X7aTI58aNSrDGI2RYEElTu2UmhQiBFrWPUJQI0KBIjPz43P0E+WD+BniN/Flyc/i2Gk7SlqMvpFY2Vz5Hn7pTkeCOSAHT5vxennBckJr3A9YBYyVT6iQjpu5kdvtDrAPKhVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(70206006)(6512007)(8676002)(82740400003)(186003)(26005)(36756003)(4326008)(53546011)(478600001)(83380400001)(41300700001)(336012)(316002)(5660300002)(33656002)(86362001)(6506007)(2616005)(40480700001)(54906003)(2906002)(40460700003)(6862004)(81166007)(356005)(8936002)(47076005)(82310400005)(6486002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:51:35.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdb6e26-1df3-45c6-a57a-08dacecaa3e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9063

DQoNCj4gT24gMjQgTm92IDIwMjIsIGF0IDE2OjQyLCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBVc2UgYWN0dWFsIGluY2x1ZGUgZGlyZWN0
b3J5IHVzZWQgdG8gaW5zdGFsbCB0aGUgcHVibGljIGhlYWRlciBpbg0KPiBDT1BZSU5HIGZpbGUu
DQo+IA0KPiBBbHNvLCBtb3ZlIHRoZSBpbnB1dCBmaWxlIG91dCBvZiAidG9vbHMvaW5jbHVkZS94
ZW4vIiBiZWNhdXNlIHRoYXQNCj4gZGlyZWN0b3J5IGlzIHJlbW92ZWQgb24gYG1ha2UgY2xlYW5g
Lg0KPiANCj4gV2UgY2FuJ3QgdXNlZCAuL2NvbmZpZ3VyZSBiZWNhdXNlICRpbmNsdWRlZGlyIGNv
bnRhaW4gYW5vdGhlcg0KPiB2YXJpYWJsZSwgc28gdGhlIGNoYW5nZSBpcyBkb25lIGluIE1ha2Vm
aWxlLg0KPiANCj4gRml4ZXM6IDRlYTc1ZTlhOTA1OCAoIlJld29yayBDT1BZSU5HIGluc3RhbGxl
ZCBpbiAvdXNyL2luY2x1ZGUveGVuLywgZHVlIHRvIHNldmVyYWwgbGljZW5jZXMiKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IA0K
PiBOb3RlczoNCj4gICAgRm9yIDQuMTcgaW5jbHVzaW9uOg0KPiANCj4gICAgRG9pbmcgYG1ha2Ug
Y2xlYW4gJiYgbWFrZWAgaW4gdGhlIHJvb3QgZGlyIGlzIGdvaW5nIHRvIGZhaWwgYXMgbWFrZQ0K
PiAgICBpc24ndCBnb2luZyB0byBmaW5kIHRoZSBDT1BZSU5HIGZpbGUgd2hpbGUgdHJ5aW5nIHRv
IGluc3RhbGwgdGhlDQo+ICAgIGluY2x1ZGVzLg0KPiANCj4gICAgSWYgdGhhdCBwYXRjaCBpcyB0
b28gbXVjaCwgd2UgY291bGQgcmVwbGFjZSB0aGUgYHNlZGAgYnkgYGNwYCBhbmQganVzdA0KPiAg
ICBtb3ZlIENPUFlJTkcgaW5zdGVhZCBvZiBjaGFuZ2luZyBpdC4NCj4gDQo+IHRvb2xzL2luY2x1
ZGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiB0b29scy9pbmNsdWRl
L3t4ZW4vQ09QWUlORyA9PiB4ZW4uQ09QWUlORy5pbn0gfCAyICstDQo+IHRvb2xzL2luY2x1ZGUv
LmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiB0b29scy9pbmNsdWRlL3hl
bi8uZ2l0aWdub3JlICAgICAgICAgICAgICAgICAgfCAyIC0tDQo+IDQgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiByZW5hbWUgdG9vbHMvaW5jbHVkZS97
eGVuL0NPUFlJTkcgPT4geGVuLkNPUFlJTkcuaW59ICg5MyUpDQo+IGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy9pbmNsdWRlLy5naXRpZ25vcmUNCj4gZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2lu
Y2x1ZGUveGVuLy5naXRpZ25vcmUNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL01h
a2VmaWxlIGIvdG9vbHMvaW5jbHVkZS9NYWtlZmlsZQ0KPiBpbmRleCBmODM4MTcxZThjLi5kNjlh
ZWI1NGJmIDEwMDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL01ha2VmaWxlDQo+ICsrKyBiL3Rv
b2xzL2luY2x1ZGUvTWFrZWZpbGUNCj4gQEAgLTI0LDYgKzI0LDcgQEAgeGVuLWZvcmVpZ246DQo+
IHhlbi1kaXI6DQo+IAlta2RpciAtcCB4ZW4vbGliZWxmIGFjcGkNCj4gCWZpbmQgeGVuLyBhY3Bp
LyAtdHlwZSBsIC1leGVjIHJtICd7fScgKw0KPiArCXNlZCAtZSAncyNAaW5jbHVkZWRpckAjJChp
bmNsdWRlZGlyKS94ZW4jZycgeGVuLkNPUFlJTkcuaW4gPiB4ZW4vQ09QWUlORw0KDQpJZiBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5LCB0aGUgLWUgY2FuIGJlIGRyb3BwZWQgYXMgdGhpcyBpcyB0aGUg
b25seSBjb21tYW5kIHdlIGFyZSBpc3N1aW5nIHRvIHNlZC4NCg0KVGhlIHBhdGNoIGxvb2tzIGdv
b2QsIEnigJl2ZSB0ZXN0ZWQgaXQgd2l0aCBhbmQgd2l0aG91dCB0aGUgLWUgYW5kIGl0IHdvcmtz
DQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

