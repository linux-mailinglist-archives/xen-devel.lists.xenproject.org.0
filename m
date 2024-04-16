Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2608A63BD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706611.1103865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcIl-0002BA-8x; Tue, 16 Apr 2024 06:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706611.1103865; Tue, 16 Apr 2024 06:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcIl-00028k-5I; Tue, 16 Apr 2024 06:28:19 +0000
Received: by outflank-mailman (input) for mailman id 706611;
 Tue, 16 Apr 2024 06:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g64T=LV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rwcIj-00028a-NA
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:28:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81d39ac3-fbba-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 08:28:15 +0200 (CEST)
Received: from AS9PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:20b:530::21)
 by DB9PR08MB9778.eurprd08.prod.outlook.com (2603:10a6:10:45d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 06:28:11 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::c3) by AS9PR04CA0179.outlook.office365.com
 (2603:10a6:20b:530::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 16 Apr 2024 06:28:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 06:28:10 +0000
Received: ("Tessian outbound f1e9a43166b5:v313");
 Tue, 16 Apr 2024 06:28:10 +0000
Received: from 0df08102d410.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3EAE37D-9F81-4BB4-A7A4-65ABA7ECBEC0.1; 
 Tue, 16 Apr 2024 06:28:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0df08102d410.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Apr 2024 06:28:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 06:27:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 06:27:52 +0000
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
X-Inumbo-ID: 81d39ac3-fbba-11ee-b909-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N+LtYI4vjpSiEUtZQGK3gI75iFndOrjXzKM7+QM6f7WDpuH1YWShrzGtWAHDqcEsVh+eeWpgi3FR1HOl8LeLN+P1JU9cOAwcX1u0QxoneFZF7sN0VU+FG/19pCvfMLdpGsbvebyvHKGv027wPxsfhFwU+tw8eld3d87R3/SEAUnDwl6cfGtBbSAMMsU/XnPjfj/t4bxPZYkCgDPnf+iE7xiEmewe3qDNe3wwKQD0XYSjIM/KuJ+Qfxd51zGIwyCNODcvWZ03s3xQljdG4DtOH1vdlx1i+XyCSxdX4Ksg/mGpI7UASOep5j/kFKrG/M+2lmLBrNZ67uKXFx9EBenjMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt7/UPxgS8tEojDfuGPnhAl3QrzKoUPyTsXBWYSJEbQ=;
 b=DPpL3XLpxO4643+/yHenobQ7sZA5kKZdkPHpqo9EKEOmIR0/o+aIR2EnIG3OhCBqmfYz9/Wc7stL+27HSqbIC0XmgZi8Lol8UZUEH4lO4ZVYQ9ydvSToqYiiuwmuN3bXFvNa+ae906zR8nYlz4kieBLgypf5CM7wIPSsHpt4sdfW2E287T5HU+9b/LRF1o7V3Mz89bhvz6hUPX8d1CfrwWITHalTEnW69/NUKC67nCII23dnMWjl5Lfa1WJCwfIsZDjan7eopRHwpDzPE0CeQcDEhOKx4Rt2Y+yo5O/bb0cLVpED0HsSOZmOWew/DR6fb1omUpGsepLKFqnJhDLxnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt7/UPxgS8tEojDfuGPnhAl3QrzKoUPyTsXBWYSJEbQ=;
 b=4KtAsTaqyBV87/zxuxHT/zQB9BsHw9B72i9yJ7sjd8ky6PHSpMmuA7n/F6ZKmtum5Fismx+xslgy2QMvJ8fVwOL0TwVAxYSd/VeM/vNKLjAlYMyAfPXB9OTjs1ONAkYc7F/0JhEDF7D/dsa9fQBMe1ypQEmEhduZBnzjNFdIbVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3767240fa811e385
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoZPNqdfpsM00JMSrllF94uJT88P43kwoNmuVLJLqKo1n8Vwxrq7buyxqMaXDFRC7pmzoQXilR/QPqtRxCtW98qkW1loDz2rK7z3g4DPsq53kfJdjrdDfDBKVvE20EXr0rzFhaKTsqxt4lCNMANni/B5vofvo5zI9hNLoQwIvwjMb9wHWedG+chUmB0FCxSQ5OPa59bemI7YXt/7pV42r4L6zD+POcxEn6C36vRb8qAGrzhKaM8Uu5FiQw9J/U6q9hZxFVUjRbABzak5VUzhOU9oEiGctVXmiQrkh0PtkuUj9Ukzut0Q6tzLd/dbAbD3oSOzqY1+J/bh1eyHm8bC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bt7/UPxgS8tEojDfuGPnhAl3QrzKoUPyTsXBWYSJEbQ=;
 b=jM54nnVFwsCUIHbFXe/3oA+d+OVeyfMXxFrkR0KHwsZGy4KPMCqqqPhYi9Ir2TcMDen6/PO69KmB5otHJ+FfIGWkslOOx0DWi+RKVAe7PZZmapCAaidNOke+2BxLnW19m3Spd3gwlxF6huYolMWkCSyk0O70gE0kyTiTmjGHC5w0cePeh8cLUun0Lz3vzVZbEig4275dJ6p+F1Wxwdb4TnCVSzVrrnaCcfoQZf2Yf3pePc5LPWsYgpGnnuYEtN12/p5L1aoUJWMMwcnLZhqV+O3P9Bj1bAHf3Gdm0C28+y49mLSli+5MRyiiV5Qo+u5qJy9Wx5/zylL1GL2ABeBWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bt7/UPxgS8tEojDfuGPnhAl3QrzKoUPyTsXBWYSJEbQ=;
 b=4KtAsTaqyBV87/zxuxHT/zQB9BsHw9B72i9yJ7sjd8ky6PHSpMmuA7n/F6ZKmtum5Fismx+xslgy2QMvJ8fVwOL0TwVAxYSd/VeM/vNKLjAlYMyAfPXB9OTjs1ONAkYc7F/0JhEDF7D/dsa9fQBMe1ypQEmEhduZBnzjNFdIbVs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index: AQHainSZ45I8T1wdtkSTioIgDqTSKbFptBmAgADFXAA=
Date: Tue, 16 Apr 2024 06:27:52 +0000
Message-ID: <39165767-26EA-4849-9C02-12393933139E@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-14-luca.fancellu@arm.com>
 <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
In-Reply-To: <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBAPR08MB5832:EE_|AMS0EPF000001A1:EE_|DB9PR08MB9778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5504c23b-16f6-42a8-743b-08dc5dde6318
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J074pL0zbHaYkP3kEhpWcgnPI1E5jDsbIL7saBvJDJA2QIskpBeiRUhhMq38SVY2Y6oN3CEWGhKbEbiuY1uVgpFeBlAe5IlT9MwqQCA8HS5l8CefbKLXHISCeR1WY3x6xrLxuMYkQvD9Zbl6sUEPHruKxj6zLwTdY3Oo58katwue+mACmC8ewX6DHOMiEmeHsga4IXzKyjDvdwVI5UpAZlJCUbISYYAuBSKsf5p9g/Pmukm7e+fv1TvWa7JgEYllp7t7QHGSm23JjgyC5FIlpqBkJzRQuCNMbIRHpILlonV/Wi9Emavwx/rs30LVm5zS/+RuWEWz7swT0LmVQTyaLpcD+iZeyukHNSEkkBdDl9n8cDJ8/0lPj4fcN5I9NOEwhUDh5/Y6s3eKi3ROGSHu6QZMgum7Vf50EPbpjrvouxMODV94e4Y7OSAnhXrDj9FJK8vVr7EznlFoLp24wGDmdp5ku9LZt2FxCobVgx0NEVTCLChog6ibYX66/xWnY5os/ouPpTQYMgVPnM9LV52xxYcfIiFIiz/XOPYblXmXcO3xbifLfoFEs+g9zSEwLSvllJvkiTDOcBijwD2oESigkyE++N9W4ErWGlIKyT5pk89xX/mvHfABB+SVDSVPMbmReUIYIuwLFwoOHoKoONQBsRX1+ZDdZyJ8TM7S8gnCqDQAN6cv0OkKKSS6Z3J45J62PlCTwfIQ/TGWAsZ4vJaoBw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE92B40B3F44B441BB5DC5C912BE55A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b65a64b2-5476-44d4-fa8b-08dc5dde587f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V2RUePz5KuNsxpURECf0c8KTm2rNTNCZFZ/DBGglr0sYBmq05qfeFK7HTchLw8nt5ZNRE0goWlI6pUWEJaylCbNIQBPf/1uANHsBMsrsuQPQtAw2Vqp1D3dHNeHxZ0WeafiC4knKybXol1AESvz5yhOGpmD/VXJhqyCB/IVqUWBLR780nC7Kt/Aa6tivKPhD4Z8m1UvMkpn2Pw6QLL/la/+K/t7rTCr13nFsg6+6aXOtW8Mtp677exm6guRY3Z2usp4RQB/OwosP6EBkEiNB5QvNF+vidNk2wRNFLvd0UykvcNmIjNyuYL1SaiQ15oBY7PFr/ZVv6kAm9cpGpjNls4ptUuqXvaaBgo/h3e0KhR64ekGtBtjdaE7j7euXN3RtZR6+AJQyAS2AKeKO408WvecJOjT4XRIspsqAnxADUlFOcxRB3Q831QQR/DNyYayRuKsQqoxVXWXdLpvDFb2TzqoNg9DE25oCPobD1hx7kOE0cRIwaYw7gVvA+r1TUmxbWJYAiOQE9OrjYnL5kFCfYlpiZHEBzSisMPaWfjMqOwS4VyN3YSlb50GamdM979WpeDOsyY5r66CFjljKrWlqAwf1Pt8M6If9a+nUmKLpd+FGiJdJBfh0O8iR3vFBnZ61NNzM9GBU2eLRRDAhtqxBzlMt49C6wMpFKI0uWGrvzNOqgiyeCYRP3Z7cjpMS8HUj5McBfXU3022rWCf4jVVfI9sRoWN8Bjy0Idw1B+nBhgiBAB9smZcXrFYyAd1w/j+6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 06:28:10.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5504c23b-16f6-42a8-743b-08dc5dde6318
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9778

SGkgSnVsaWVuLA0KDQo+IE9uIDE1IEFwciAyMDI0LCBhdCAxOTo0MSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMDkvMDQvMjAy
NCAxMjo0NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEN1cnJlbnRseSBYZW4gaXMgbm90IGV4
cG9ydGluZyB0aGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgcmVnaW9ucw0KPj4gdG8gdGhlIGRldmlj
ZSB0cmVlIGFzIC9tZW1vcnkgbm9kZSwgdGhpcyBjb21taXQgaXMgZml4aW5nIHRoaXMNCj4+IGlz
c3VlLg0KPj4gVGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGJhbmtzIGNhbiBiZSBwYXJ0IG9mIHRo
ZSBtZW1vcnkgcmFuZ2UNCj4+IGF2YWlsYWJsZSBmb3IgdGhlIGRvbWFpbiwgc28gaWYgdGhleSBh
cmUgb3ZlcmxhcHBpbmcgd2l0aCB0aGUNCj4+IG5vcm1hbCBtZW1vcnkgYmFua3MsIHRoZXkgbmVl
ZCB0byBiZSBtZXJnZWQgdG9nZXRoZXIgaW4gb3JkZXINCj4+IHRvIHByb2R1Y2UgYSAvbWVtb3J5
IG5vZGUgd2l0aCBub24gb3ZlcmxhcHBpbmcgcmFuZ2VzIGluICdyZWcnLg0KPiANCj4gQmVmb3Jl
IHJldmlld2luZyB0aGUgY29kZSBpbiBtb3JlIGRldGFpbHMsIEkgd291bGQgbGlrZSB0byB1bmRl
cnN0YW5kIGEgYml0IG1vcmUgdGhlIHVzZSBjYXNlIGFuZCB3aGV0aGVyIGl0IHNob3VsZCBiZSB2
YWxpZC4NCj4gDQo+IEZyb20gbXkgdW5kZXJzdGFuZGluZywgdGhlIGNhc2UgeW91IGFyZSB0cnlp
bmcgdG8gcHJldmVudCBpcyB0aGUgZm9sbG93aW5nIHNldHVwOg0KPiAgMS4gVGhlIEd1ZXN0IFBo
eXNpY2FsIHJlZ2lvbiAweDAwMDAgdG8gMHg4MDAwIGlzIHVzZWQgZm9yIFJBTQ0KPiAgMi4gVGhl
IEd1ZXN0IFBoeXNpY2FsIHJlZ2lvbiAweDAwMDAgdG8gMHg0MDAwIGlzIHVzZWQgZm9yIHN0YXRp
YyBtZW1vcnkNCg0KU28gZmFyLCBpdCB3YXMgcG9zc2libGUgdG8gbWFwIGd1ZXN0IHBoeXNpY2Fs
IHJlZ2lvbnMgaW5zaWRlIHRoZSBtZW1vcnkgcmFuZ2UgZ2l2ZW4gdG8gdGhlIGd1ZXN0LA0Kc28g
dGhlIGFib3ZlIGNvbmZpZ3VyYXRpb24gd2FzIGFsbG93ZWQgYW5kIHRoZSB1bmRlcmx5aW5nIGhv
c3QgcGh5c2ljYWwgcmVnaW9ucyB3ZXJlIG9mIGNvdXJzZQ0KZGlmZmVyZW50IGFuZCBlbmZvcmNl
ZCB3aXRoIGNoZWNrcy4gU28gSeKAmW0gbm90IHRyeWluZyB0byBwcmV2ZW50IHRoaXMgYmVoYXZp
b3VyLCBob3dldmVyIC4uLg0KDQo+IA0KPiBUaGUgdW5kZXJseWluZyBIb3N0IFBoeXNpY2FsIHJl
Z2lvbnMgbWF5IGJlIGRpZmZlcmVudC4gWGVuIGRvZXNuJ3QgZ3VhcmFudGVlIGluIHdoaWNoIG9y
ZGVyIHRoZSByZWdpb25zIHdpbGwgYmUgbWFwcGVkLCBTbyB3aGV0aGVyIHRoZSBvdmVybGFwcGVk
IHJlZ2lvbiB3aWxsIHBvaW50IHRvIHRoZSBtZW1vcnkgb3IgdGhlIHNoYXJlZCByZWdpb24gaXMg
dW5rbm93biAod2UgZG9uJ3QgZ3VhcmFudGVlIHRoZSBvcmRlciBvZiB0aGUgbWFwcGluZykuIFNv
IG5vdGhpbmcgZ29vZCB3aWxsIGhhcHBlbiB0byB0aGUgZ3Vlc3QuDQoNCi4uLiBub3cgaGVyZSBJ
IGRvbuKAmXQgdW5kZXJzdGFuZCBpZiB0aGlzIHdhcyB3cm9uZyBmcm9tIHRoZSBiZWdpbm5pbmcg
b3Igbm90LCBzaGFsbCB3ZSBlbmZvcmNlIGFsc28gdGhhdA0KZ3Vlc3QgcGh5c2ljYWwgcmVnaW9u
cyBmb3Igc3RhdGljIHNoYXJlZCBtZW1vcnkgYXJlIG91dHNpZGUgdGhlIG1lbW9yeSBnaXZlbiB0
byB0aGUgZ3Vlc3Q/DQoNCj4gDQo+IERpZCBJIHVuZGVyc3RhbmQgY29ycmVjdGx5PyBJZiBzbywg
c2hvdWxkbid0IHRoaXMgYmUgYSBjb25maWd1cmF0aW9uIHdlIHNob3VsZCBmb3JiaWQ/DQo+IA0K
PiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCkNoZWVycywNCkx1Y2ENCg0K

