Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7687825AF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:41:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587376.918733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0Sf-0003ld-D7; Mon, 21 Aug 2023 08:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587376.918733; Mon, 21 Aug 2023 08:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0Sf-0003jx-AE; Mon, 21 Aug 2023 08:40:33 +0000
Received: by outflank-mailman (input) for mailman id 587376;
 Mon, 21 Aug 2023 08:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xF=EG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qY0Sd-0003jr-Qy
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:40:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 603d5161-3ffe-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 10:40:26 +0200 (CEST)
Received: from DUZPR01CA0128.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::21) by VI1PR08MB5440.eurprd08.prod.outlook.com
 (2603:10a6:803:134::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 08:40:23 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::6a) by DUZPR01CA0128.outlook.office365.com
 (2603:10a6:10:4bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 08:40:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Mon, 21 Aug 2023 08:40:23 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Mon, 21 Aug 2023 08:40:23 +0000
Received: from 6a013e1d8ac7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97C96652-ECA4-4261-8E03-BB35DFD96407.1; 
 Mon, 21 Aug 2023 08:40:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a013e1d8ac7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Aug 2023 08:40:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB10281.eurprd08.prod.outlook.com (2603:10a6:102:367::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 08:40:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 08:40:12 +0000
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
X-Inumbo-ID: 603d5161-3ffe-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRC81CpMIE1TvVzlsHMDBP1nBBT/Osj6kGEa1HN1P1U=;
 b=ozEmP4RHdxsunwpdwb2h88Hj2dNCw9jnh4cxF1+r1uqLx+TWEWqrx3mzqmg7gCArdASfZZs/bbpsmWrSfjjD04soUOFxjgCdOQBWTGzlajVASbekXEFITXA+iJfChGqa5e/eW5gqdrN5IN+XPvjnZ0C819v3poJjvpzTwy3GMi4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d6e0e32a4b90250
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAIt82mXNr/Phw3//JeX+XDM/70BZqUnNxdpqdz5GOncxL6UyFOVx6u0/bzOmKrWell4VH0r2H5v8dTEyJuTviEkjEVBRIhyahGpbQeQPvouXxrSsIT7CLbz4SF1TDSPDMwA6lUMwxsGKOO0kZXj2fsW7hk5vBYudbQzS/9uprPyhuzzUblrQzhbXUJ60VTRbJkJWkoYe1fle22E8/cIEdFKRcpSK9IwnFVQ6N+Ly8HMjH7gf/sB5k6vVj1NQN28zxwFUzUtnIPJI51gQNt+XYiUhbiLVnniwZ7YYZ9exok2JI8P6GqQASu+rOqzHoHBgb5oP86VmwJnj3JRUjSpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRC81CpMIE1TvVzlsHMDBP1nBBT/Osj6kGEa1HN1P1U=;
 b=VD9IuTu/L+t3h9Z4KClsHf/CGasvaoVMy+IS5M4F9/n4vw2sSNaUQysGLa19Gb6ZTwg5uoAHFCL8cEBzVo8svxyPB7DWZRERGy+Ey7om/qofw5zO+AbyfLsGdh0JYAGYMaV7eVwcoLQumxG4YviyrhxFIBTNOiD8glYcVyZaU26ZD5sJTI0GzXC8htBlD3tJwTODH7kwv79W2dh8B/XDYK4I1A54nY4f4PvbiHzEAJKFUUgPU/9/Fw6zm9V4Rt5g/YBsxwtu8xAeXDO+MQIxz4+/sy6tqUpOAICzoXFDxEw2o058rkjWWmGTBDroX155cKPl2IOIFIPp/0j8DLppWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRC81CpMIE1TvVzlsHMDBP1nBBT/Osj6kGEa1HN1P1U=;
 b=ozEmP4RHdxsunwpdwb2h88Hj2dNCw9jnh4cxF1+r1uqLx+TWEWqrx3mzqmg7gCArdASfZZs/bbpsmWrSfjjD04soUOFxjgCdOQBWTGzlajVASbekXEFITXA+iJfChGqa5e/eW5gqdrN5IN+XPvjnZ0C819v3poJjvpzTwy3GMi4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Penny Zheng <Penny.Zheng@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
Thread-Topic: [PATCH v5 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
Thread-Index: AQHZzmdxxxwrdopbQkqcgqyAjPNzjq/0d5oAgAABuwA=
Date: Mon, 21 Aug 2023 08:40:12 +0000
Message-ID: <91647ABA-1123-45E0-B160-74BD6BE3696C@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-2-Henry.Wang@arm.com>
 <8795a659-38ef-45cb-a4f6-21cc24403af9@xen.org>
In-Reply-To: <8795a659-38ef-45cb-a4f6-21cc24403af9@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB10281:EE_|DBAEUR03FT010:EE_|VI1PR08MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3b8029-dd99-450b-554f-08dba22242a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d0vekTz0FYC+4ZMfkE04yOEUOhBfz5EOkiU7oLELkf7Kv8EOxdPF4Dg7qPnpyD6MOCjWNyfgznoPAXEtX6oNbhdvhMaVweS+Y0NiGsCSPQ/Ul4BcVoLQUqWPFV7CFrlJrpjstpbEPfrvGXwiBzPtKnCg2YC4DBCW/BhitNDQgBq0m0BOl/rTdzhLWOnXRb858VqJMMj8wpfvAYfDM0BEKUITasK/do9xtTIcm8Nu762rhUNGyXoHWj4Mr5FtkBahyeUPgA31Mw83w/We4A50Ir6ZVX8w4TqrsTfBJDMM2JbcEar5BWlp1RAjPmUAM89WEd+F0H7j7ykEO98TM+3MzCLFb6V0INQxZdYqzgr9h7rxS+qwLuYSwayz6/kawnGUdOTMHTky7IUkzGs/8QOEI3S7eZycrldQRTUQVjESWT51n/MtJ3wOuOo1KaPFR8jCeDlxH5fTyzeActGNTip27nVyujEYspsO0WegzpVdJOZ3zEZ6MWx8eSj7lhrkHT3aK0VmwI2DjQ+nvOoNzCsBXJOLPWgotjKtrlyLT/lJo6nZ3030zaUX/CWeeCLWg3fGigoYQdj+AvTpqZFO3wOFP9GZNSB7i9dvSY3WI0CQbUSC/3nnnTzM0/axjS70li38qZ31EtYZswLKvPBbnTsK4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(1800799009)(186009)(451199024)(6486002)(71200400001)(38100700002)(6506007)(6512007)(122000001)(38070700005)(53546011)(83380400001)(36756003)(26005)(2616005)(33656002)(41300700001)(66556008)(2906002)(6916009)(66946007)(316002)(54906003)(66446008)(66476007)(91956017)(86362001)(76116006)(5660300002)(64756008)(8676002)(478600001)(4326008)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B0FA67159E35843871DD11CD8AF5E0C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10281
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9b9ec3b-2d15-4048-d4ea-08dba2223c50
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A8Df1wLctTOlKPBQGiiraQtQLwP6Hu7fc4OHol+2kw4e5HRtz/D6WvLyBSLURqwQPmEgF/BYhoRelp/yvBHYyDBN6RFoSqTwm5Wrv7kQGI6dAM7kzR5njZdrhBias9jQM+KqvvSRuQWdRC0IcjDag3+FpUre1vWh+LXSIoQ+RlPEowt72ql3/qFUmllDcnqY+Ht+iihEyjFHfisgpIF67LE2nEbjPuZMxspmmS1aDcHR/q4NgFzBKluXy3IcrYGX/T66v6RAJxTT2C0421wSjj33rw4SbKH7vJ4gSBid72ZHBxdBzZ8p9y043V29SctLo54aU5ZxgKSmSVCRqDNI1NF8wQziwbKhO+wu0hHPhp+ryjFf3rCghCcINVT52NigzUIlea3M0vr7N3493O067Pnt/ZELwVYFvwWrDc1ckgCxSmXHHu4GbRwDLJ0BXZv3QaeGhaQnMcSVNCJTK/vx6V3piL6gM07SP9lOI4Tvc6ZmFQ2VqdwGagSt0dcVpCRIgNOCVSLzwbCku+2E9ryNqjJVj+mmGuG4xRKHyBnzPycggru1F0a3LRJasr6RlxORXQI4l1nbJaSPahvz7CUb1zjLJrDVgDHBosa2o+5sEcWOQ4BA2OrmZkpSAcTDT11SFtZvORUfXiqkocNwbL80l4BDQl645uLchLOrvPJYHNfJCWGexal0IZ9UPRS+GYaDM1A35En6BeQM+7cAJtUZIA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39850400004)(136003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(46966006)(2906002)(83380400001)(53546011)(40480700001)(6506007)(6486002)(5660300002)(336012)(33656002)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(6862004)(107886003)(4326008)(70206006)(316002)(6512007)(54906003)(70586007)(478600001)(82740400003)(356005)(81166007)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 08:40:23.3685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3b8029-dd99-450b-554f-08dba22242a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5440

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMSwgMjAyMywgYXQgMTY6MzMsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAxNC8wOC8y
MDIzIDA1OjI1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gRnJvbTogV2VpIENoZW4gPHdlaS5jaGVu
QGFybS5jb20+DQo+PiBBdCB0aGUgbW9tZW50LCBvbiBNTVUgc3lzdGVtLCBlbmFibGVfbW11KCkg
d2lsbCByZXR1cm4gdG8gYW4NCj4+IGFkZHJlc3MgaW4gdGhlIDE6MSBtYXBwaW5nLCB0aGVuIGVh
Y2ggcGF0aCBpcyByZXNwb25zaWJsZSB0bw0KPj4gc3dpdGNoIHRvIHZpcnR1YWwgcnVudGltZSBt
YXBwaW5nLiBUaGVuIHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKCkNCj4+IGlzIGNhbGxlZCBvbiB0
aGUgYm9vdCBDUFUgdG8gcmVtb3ZlIGFsbCAxOjEgbWFwcGluZy4NCj4+IFNpbmNlIHJlbW92ZV9p
ZGVudGl0eV9tYXBwaW5nKCkgaXMgbm90IG5lY2Vzc2FyeSBvbiBOb24tTU1VIHN5c3RlbSwNCj4+
IGFuZCB3ZSBhbHNvIGF2b2lkIGNyZWF0aW5nIGVtcHR5IGZ1bmN0aW9uIGZvciBOb24tTU1VIHN5
c3RlbSwgdHJ5aW5nDQo+PiB0byBrZWVwIG9ubHkgb25lIGNvZGVmbG93IGluIGFybTY0L2hlYWQu
Uywgd2UgbW92ZSBwYXRoIHN3aXRjaCBhbmQNCj4+IHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKCkg
aW4gZW5hYmxlX21tdSgpIG9uIE1NVSBzeXN0ZW0uDQo+PiBBcyB0aGUgcmVtb3ZlX2lkZW50aXR5
X21hcHBpbmcgc2hvdWxkIG9ubHkgYmUgY2FsbGVkIGZvciB0aGUgYm9vdA0KPj4gQ1BVIG9ubHks
IHNvIHdlIGludHJvZHVjZSBlbmFibGVfYm9vdF9jcHVfbW0oKSBmb3IgYm9vdCBDUFUgYW5kDQo+
PiBlbmFibGVfc2Vjb25kYXJ5X2NwdV9tbSgpIGZvciBzZWNvbmRhcnkgQ1BVcyBpbiB0aGlzIHBh
dGNoLg0KPj4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4gPiBTaWduZWQt
b2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBPbmUgcmVtYXJr
IGJlbG93LiBXaXRoIG9yIHdpdGhvdXQgaXQgYWRkcmVzc2VkOg0KPiANCj4gUmV2aWV3ZWQtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQoNClRoYW5rcywgSSB3aWxsIHRha2Ug
dGhpcyB0YWcgd2l0aCAuLi4NCg0KPiANCj4gWy4uLl0NCj4gDQo+PiArLyoNCj4+ICsgKiBFbmFi
bGUgbW0gKHR1cm4gb24gdGhlIGRhdGEgY2FjaGUgYW5kIHRoZSBNTVUpIGZvciBzZWNvbmRhcnkg
Q1BVcy4NCj4+ICsgKiBUaGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gdG8gdGhlIHZpcnR1YWwgYWRk
cmVzcyBwcm92aWRlZCBpbiBMUiAoZS5nLiB0aGUNCj4+ICsgKiBydW50aW1lIG1hcHBpbmcpLg0K
Pj4gKyAqDQo+PiArICogSW5wdXRzOg0KPj4gKyAqICAgbHIgOiBWaXJ0dWFsIGFkZHJlc3MgdG8g
cmV0dXJuIHRvLg0KPj4gKyAqDQo+PiArICogQ2xvYmJlcnMgeDAgLSB4NQ0KPj4gKyAqLw0KPj4g
K2VuYWJsZV9zZWNvbmRhcnlfY3B1X21tOg0KPj4gKyAgICAgICAgbW92ICAgeDUsIGxyDQo+PiAr
DQo+PiArICAgICAgICBsb2FkX3BhZGRyIHgwLCBpbml0X3R0YnINCj4+ICsgICAgICAgIGxkciAg
IHgwLCBbeDBdDQo+PiArDQo+PiArICAgICAgICBibCAgICBlbmFibGVfbW11DQo+PiArICAgICAg
ICBtb3YgICBsciwgeDUNCj4+ICsNCj4+ICsgICAgICAgIC8qIFJldHVybiB0byB0aGUgdmlydHVh
bCBhZGRyZXNzIHJlcXVlc3RlZCBieSB0aGUgY2FsbGVyLiAqLw0KPj4gKyAgICAgICAgcmV0DQo+
PiArRU5EUFJPQyhlbmFibGVfc2Vjb25kYXJ5X2NwdV9tbSkNCj4gDQo+IE5JVDogZW5hYmxlX21t
dSgpIGNvdWxkIGRpcmVjdGx5IHJldHVybiB0byB0aGUgdmlydHVhbCBhZGRyZXNzLiBUaGlzIHdv
dWxkIHJlZHVjZSB0aGUgZnVuY3Rpb24gdG86DQo+IA0KPiBsb2FkX3BhZGRyIHgwLCBpbml0X3R0
YnINCj4gbGRyICAgeDAsIFt4MF0NCj4gDQo+IC8qIFJldHVybiB0byB0aGUgdmlydHVhbCBhZGRy
ZXNzIHJlcXVlc3RlZCBieSB0aGUgY2FsbGVyLg0KPiBiIGVuYWJsZV9tbXUNCg0K4oCmdGhpcyBm
aXhlZCBpbiB2NiBzaW5jZSBJIHRoaW5rIHRoZXJlIGlzIGxpa2VseSB0byBiZSBhIHY2LCBhbmQg
SSB0aGluayBJIGFsc28gbmVlZA0KdG8gYWRkcmVzcyB0aGUgY29tbWl0IG1lc3NhZ2Ugbml0IHBv
aW50ZWQgb3V0IGJ5IEphbiBpbiB0aGUgbGFzdCBwYXRjaC4NCg0KS2luZCByZWdhcmRzLA0KSGVu
cnkNCg0K

