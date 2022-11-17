Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE162D75A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 10:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444845.699961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbSB-0004Dn-LA; Thu, 17 Nov 2022 09:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444845.699961; Thu, 17 Nov 2022 09:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbSB-0004AY-H6; Thu, 17 Nov 2022 09:45:03 +0000
Received: by outflank-mailman (input) for mailman id 444845;
 Thu, 17 Nov 2022 09:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sbrt=3R=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ovbS9-00049F-SZ
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 09:45:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812168f2-665c-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 10:45:01 +0100 (CET)
Received: from FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::19)
 by DB9PR08MB8737.eurprd08.prod.outlook.com (2603:10a6:10:3d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Thu, 17 Nov
 2022 09:44:30 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::aa) by FR0P281CA0121.outlook.office365.com
 (2603:10a6:d10:97::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Thu, 17 Nov 2022 09:44:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 09:44:29 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Thu, 17 Nov 2022 09:44:29 +0000
Received: from 68a3a1bcdd7a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E08089F8-4572-4814-A0C6-C2DEE646CF74.1; 
 Thu, 17 Nov 2022 09:44:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68a3a1bcdd7a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Nov 2022 09:44:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7599.eurprd08.prod.outlook.com (2603:10a6:102:23e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Thu, 17 Nov
 2022 09:44:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5834.007; Thu, 17 Nov 2022
 09:44:19 +0000
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
X-Inumbo-ID: 812168f2-665c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvOHN851l9nyTxZHtmYzdovTbpofZYB29vUZJUcFe7I=;
 b=Zg9yfN9pddMcJEAravU0rsPefCV9fIZdaDcFw4rOp7b/InyFwMA3ioxayUJV1GLg/pAmGb4U7lEzsLVzwFvhFcOkxxwDuggESo0vZ1pUGj6AuLZJPfw0dhzTFvp4PS0styUZ5RKUYdAgObxL7d70Z80POgsDhM+rB4P6se3YE+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a07e3cbb7cb1d576
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nhc53RIcR812cpM94RpWtXFx/XAwVXR5MaGwxU6szVsZmceiaOguQ5t6sjdIW+wu3kiKACYLr3RLEBa3dKvYfPF6DCAmUqf1SaHz9pnEUrVYx9/GSrqns2EliRLinPjTPtTiyXX4dRV8RHFwouuzmK878xWKToxzErgvyesGIyc+vMfU2/XGtdJX4Q0tUZM0CxUOJCjVAz5p5WNW1n/b//Dwz3D0241uGyG9iYukhnzGYnvHEqiHgDF4QQJmM3Az6oBrzVcKOUwx9FrRA/VxCb18hawIIZk2RsmI0Xg5CzJ85c8uKws4iyHsIikg0Ollf/TsLuoWGVEcDBkQjd0HVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvOHN851l9nyTxZHtmYzdovTbpofZYB29vUZJUcFe7I=;
 b=MFh5GyRLRelLEj4VUyDe242u2ws8+QvSSZYlSof7xnZQigdQu0PziixdxhQrX5ubuc1+P1ZByuWVbpGptLJd28amvCunAlaVIOupDTj+4rb3YP1HnzuDEYK5401P0myLdnk5lVhri388imbeGo5LzHshdnG2s3vsBb6zI/OgJ8npr11mEQvmuweoVI5tsByTbi9MftPDQX/9GKPs7S6cq/k2qJ7qzG6JL1bKcdVHzEhR7/rOWhFDo2u9ZhtBPSYFUth34OdHXcl4Ylgmc59XbT/gTV/5BKSHLIZoDcTkZNDNTjDnNvO4KZaeJbW2OUpgyJxioN3UwW5Gq0ANRcmUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvOHN851l9nyTxZHtmYzdovTbpofZYB29vUZJUcFe7I=;
 b=Zg9yfN9pddMcJEAravU0rsPefCV9fIZdaDcFw4rOp7b/InyFwMA3ioxayUJV1GLg/pAmGb4U7lEzsLVzwFvhFcOkxxwDuggESo0vZ1pUGj6AuLZJPfw0dhzTFvp4PS0styUZ5RKUYdAgObxL7d70Z80POgsDhM+rB4P6se3YE+Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Thread-Topic: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of
 hardcoded values
Thread-Index:
 AQHY55A0LevsoY2L90OFIBLiUlnr6K5Av9+AgACVYoCAAF4AgIAAEeUAgAATsACAACQMgIAACNUAgADp3YCAAA96gIAABCQA
Date: Thu, 17 Nov 2022 09:44:19 +0000
Message-ID: <EE8A6E92-A77A-4D39-9ADE-2A99EB75860A@arm.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
 <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
 <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
 <60cf8d8e-e4d6-2c8b-50ba-ab6c3fe7d84c@amd.com>
 <0400b2d8-6f2c-6406-d966-64ed5720688c@xen.org>
 <350afafd-821c-1a05-13cb-1704d3a61bfc@amd.com>
 <84710d96-c473-fa41-d847-2b109dfb49c9@xen.org>
 <85f4f42b-b1ee-36bf-5ba9-21b1047351cf@amd.com>
 <7d3f9021-d608-9e8f-9593-1099d7bd2003@xen.org>
In-Reply-To: <7d3f9021-d608-9e8f-9593-1099d7bd2003@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB7599:EE_|VI1EUR03FT017:EE_|DB9PR08MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ed3d3e-b663-48ab-27d9-08dac88052e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bLLunQ9dwWlJvw35HIqkQp1oYbifbmbRILRvlZi7No7r7uAY2UjBS7hXZteugUbSrQ7P93IaTV9uEC5GTE7bL20tiLPMFj55ifLoxd3axdjb3lxR+8qh9ZvT6foSErqSt248clks9lpTWa0MtQMJCD/fo0rPvg+jN61YpGjGzC4lT1SxM+ieCFTKW5gtHNU/no0OA/yLOMnVh6YJSKyhUOAp8bkantc7SVNIynneHH26mU0tzDL4vrxDVKAE5oY4mbYDbv0uac4j9POBN5fSIWiI4CR3F2jJOR3b5lQZHx7T8GcL7j0fQ9xZ7WM0MjD7GC56BzR/0/uc97YHd+2W6PyD4mDPSV97GBV5mobcGSRC4lyHQJ88gDAG0UnVfHt8dHG/GMmYKdjiBsTcgRAtnJgO9OrfDUlEO+WGczSDlM9rwTGrT3p2p05Vl473G8RRjQW5avLvksmK6JokcewHURe5dtmDFOMDaNOwT9JYoaIeUk9+jBombPyPjnoHHL5fiQnwW+NNny9eoSpOdntyiP0CN/XglQGbYOu3nBg1Frl7IWDDURsFLqXFoRmWCFasu/PCgg1zt8e/ndBu6dIFO2SXbE7pweFkT0ay9bq5foqiab9y/IgCDXuNGDjgq2CSP1paSJyWhyvbYefhLalCiojqZOeV9CqvmmvasauVGW5pPfnPI7q0uYTnPb4Cukupbzlv3EeWW4UslAYmKdgyeAbbV8Pk7mdYuXE/c20s2Hs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199015)(33656002)(186003)(5660300002)(316002)(6506007)(54906003)(6916009)(53546011)(26005)(6512007)(91956017)(36756003)(41300700001)(2616005)(8936002)(4326008)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(122000001)(38100700002)(38070700005)(2906002)(83380400001)(86362001)(478600001)(66899015)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE10C797FEE5A847BBCA5A5F951F67FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7599
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87ccd4d6-5645-4090-27f4-08dac8804c91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VE90ksha+qyZQV9B+81NMoQuYbffzU6weXrbJysfB3enIOnCNJP5CNbC00lJ2amNWTDfP4vHB6jJQsoLw3/zOhcIwcMn5Ty3X5hvvFB54f/EKESVna2FPVeIvNo0Hgb6oPQoTU1IcZA7D7KIizLQgU4eHiR3QTzymgFS8vo183byrPFyQfoMw3oY7ww+80gV4AN9rm8R0uPZCk8sQKZJyoJ/el6I/4YjHTm8hXu3AgyT9iUKQH2mB+Pz+Xo62PaiShoM+pxpyT+Yzr2E6jX/rtPh0t2/0b+1wzPKmoTTz+scYJ/BpNWKvSikcNdSvfOXTyW7tx50z6iRjCYdkJuM5docZpLT/I06EEAsZD3czxQwGETanc8HxR52B8Lm/X3hrifCwNfBS9HV/0Ep14QtGaQFToOnenZ4AxUdtGShrxvzDvVtCIGBSh35qQ6ax3cQn63Lz3q7xwA6MPhdQpLw6HuiGQKv9dEzi2Xp30la5qAvk0T7QBGn9r+T1kLuQFwxD88H57dtv4ZOWbb1wDc/L2hD5bR9+B0Ra8js7c7nLvV81rwBQ2UkFyy3XoA6M96rPdQ44HArvvHEOXGKRyfzQ0JhwiVCw86KGxjmAmZp4jA4fimlNxK7/hsnyvAVXxNi2m2ieOiVj8KTTyvZhGuzzw63ONRpo4U2Y8k+fOYp20HEsr7tFXCQPHKBrnVs77WoXGisTCCrby0fnIPf3yoTrQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(83380400001)(2906002)(86362001)(336012)(82310400005)(316002)(40480700001)(186003)(2616005)(47076005)(66899015)(41300700001)(5660300002)(8936002)(6862004)(356005)(8676002)(70206006)(70586007)(81166007)(40460700003)(82740400003)(33656002)(6486002)(478600001)(36860700001)(6506007)(6512007)(53546011)(4326008)(54906003)(107886003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:44:29.6968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ed3d3e-b663-48ab-27d9-08dac88052e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8737

SGksDQoNCj4gT24gMTcgTm92IDIwMjIsIGF0IDA5OjI5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTcvMTEvMjAyMiAwODozNCwgTWljaGFs
IE9yemVsIHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPj4gT24gMTYvMTEvMjAyMiAxOTozNywgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IEhpIE1pY2hhbCwNCj4+PiANCj4+PiBP
biAxNi8xMS8yMDIyIDE4OjA1LCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4+IE9uIDE2LzExLzIw
MjIgMTY6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBPbiAx
Ni8xMS8yMDIyIDE0OjQ1LCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4+Pj4gSGkgSnVsaWVuLA0K
Pj4+Pj4gDQo+Pj4+PiBIaSBNaWNoYWwsDQo+Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBhbmQg
dXNlIGl0IGluIHRoZSBwbDAxMS1kZWJ1ZyBmaWxlcyAoKyB0aGVyZSBpcyBhIHF1ZXN0aW9uIHdo
ZXRoZXIgd2Ugc2hvdWxkIGRlZmluZSBXTEVOXzctNSBmb3IgY29tcGxldGVuZXNzKS4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IEkgd291bGQgbm90IGRlZmluZSBXTEVOXzctNS4gVGhhdCBzYWlkLCBJIHdv
bmRlciBpZiB3ZSByZWFsbHkgbmVlZCB0bw0KPj4+Pj4+PiBzZXQgdGhlIGJhdWQgcmF0ZSAmIGNv
IGhlcmU/DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBBRkFJQ1QgdGhlIHJ1bnRpbWUgZHJpdmVyIG5ldmVy
IHRvdWNoIHRoZW0uIFRoZSByZWFzb25pbmcgaXMgdGhlDQo+Pj4+Pj4+IGZpcm13YXJlIGlzIHJl
c3BvbnNpYmxlIHRvIGNvbmZpZ3VyZSB0aGUgc2VyaWFsLiBUaGVyZWZvcmUsIEkgd291bGQNCj4+
Pj4+Pj4gY29uc2lkZXIgdG8gZHJvcCB0aGUgY29kZSAoc2V0dGluZyBVQVJUQ1IgbWlnaHQgc3Rp
bGwgYmUgbmVjZXNzYXJ5KS4NCj4+Pj4+PiBJIGRvIG5vdCByZWFsbHkgYWdyZWUgYmVjYXVzZSB0
aGUgY3VycmVudCBiZWhhdmlvciB3YXMgZG9uZSBvbiBwdXJwb3NlLg0KPj4+Pj4gDQo+Pj4+PiBF
QVJMWV9VQVJUX1BMMDExX0JBVURfUkFURSBpcyBvbmx5IHVzZWQgZm9yIHZlcnkgZWFybHkgZGVi
dWdnaW5nICh0aGlzDQo+Pj4+PiBpcyBwcm90ZWN0ZWQgYnkgQ09ORklHX0RFQlVHIGFuZCBDT05G
SUdfRVhQRVJUKS4gVGhpcyBpcyBub3QgYQ0KPj4+Pj4gcHJvZHVjdGlvbiByZWFkeSBjb2RlLg0K
Pj4+PiBJIGFtIGZ1bGx5IGF3YXJlIG9mIGl0LiBJIGp1c3QgZm91bmQgaXQgdXNlZnVsIGJ1dCBJ
IHVuZGVyc3RhbmQgdGhlIGdsb2JhbCByZWFzb25pbmcuDQo+Pj4+IA0KPj4+Pj4gDQo+Pj4+Pj4g
QXQgdGhlIG1vbWVudCBlYXJseV91YXJ0X2luaXQgaXMgY2FsbGVkIG9ubHkgaWYgRUFSTFlfVUFS
VF9QTDAxMV9CQVVEX1JBVEUgaXMgc2V0IHRvIGEgdmFsdWUgIT0gMC4NCj4+Pj4+PiBUaGlzIGlz
IGRvbmUgaW4gb3JkZXIgdG8gaGF2ZSBmbGV4aWJpbGl0eSB0byBlaXRoZXIgc3RpY2sgdG8gd2hh
dCBmaXJtd2FyZS9ib290bG9hZGVyIGNvbmZpZ3VyZWQgb3IgdG8gY2hhbmdlIHRoaXMNCj4+Pj4+
PiBjb25maWd1cmF0aW9uIGJ5IHNwZWNpZnlpbmcgdGhlIEVBUkxZX1VBUlRfUEwwMTFfQkFVRF9S
QVRFICh1c2VmdWwgd2hlbiB5b3UgZG8gbm90IGtub3cgd2hhdA0KPj4+Pj4+IHRoZSBmaXJtd2Fy
ZSBjb25maWd1cmVkKS4NCj4+Pj4+IFRoZSBjaGFuY2VzIGFyZSB0aGF0IHlvdSB3YW50IHRvIHVz
ZSB0aGUgYmF1ZCByYXRlIHRoYXQgd2FzIGNvbmZpZ3VyZWQNCj4+Pj4+IGJ5IHRoZSBmaXJtd2Fy
ZS4gT3RoZXJ3aXNlLCB5b3Ugd291bGQgbmVlZCB0byBjaGFuZ2UgdGhlIGNvbmZpZ3VyYXRpb24N
Cj4+Pj4+IG9mIG1pbmljb20gKG9yIHdoYXRldmVyIHlvdSB1c2VkKSB0byBnZXQgcHJvcGVyIG91
dHB1dCBmb3IgdGhlIGZpcm13YXJlDQo+Pj4+PiBhbmQgdGhlbiBYZW4uDQo+Pj4+PiANCj4+Pj4+
IEZ1cnRoZXJtb3JlLCBhcyBJIHdyb3RlIGJlZm9yZSwgdGhlIHJ1bnRpbWUgZHJpdmVyIGRvZXNu
J3QgY29uZmlndXJlIHRoZQ0KPj4+Pj4gYmF1ZCByYXRlLiBUaGlzIHdhcyByZW1vdmVkIGluIFhl
biA0LjcgKHNlZSBjb21taXQgMjA0OGUxN2NhOWRmDQo+Pj4+PiAiZHJpdmVycy9wbDAxMTogRG9u
J3QgY29uZmlndXJlIGJhdWRyYXRlIikgYmVjYXVzZSBpdCB3YXMgYnVnZ3kgYW5kIHRoaXMNCj4+
Pj4+IGNvZGUgaXMgbm90IHNpbXBsZS4NCj4+Pj4+IA0KPj4+Pj4gU28gaXQgbWFrZXMgbm8gc2Vu
c2UgdG8gY29uZmlndXJlIHRoZSBiYXVkIHJhdGUgd2hlbiB1c2luZyBlYXJseSBwcmludGsNCj4+
Pj4+IGJ1dCBub3QgdGhlIHJ1bnRpbWUgZHJpdmVyLg0KPj4+PiBPaywgc28gd2Ugd2lsbCBnZXQg
cmlkIG9mIEVBUkxZX1VBUlRfUEwwMTFfQkFVRF9SQVRFIGNvbmZpZyBhbmQgc2V0dGluZyB0aGUg
YmQNCj4+Pj4gaW4gdGhlIGVhcmx5IHVhcnQgY29kZS4gTm93LCB3aGF0IGFib3V0IHNldHRpbmcg
IjhuMSI/IFRoZSBydW50aW1lIGRyaXZlciBzZXRzIHRoZW0NCj4+Pj4gYXMgd2VsbCBhcyB0aGUg
ZWFybHkgY29kZS4gSXQgY2FuIGFsc28gYmUgc2V0IHRvIGEgZGlmZmVyZW50IHZhbHVlIGZyb20g
dGhlIGZpcm13YXJlDQo+Pj4+ICh1bmxpa2VseSBidXQgaXQgY2FuIGhhcHBlbiBJIHRoaW5rKS4g
SW4gYW55IGNhc2UsIGlmIHdlIGRlY2lkZSB0byBkbyB3aGF0IHRoZSBydW50aW1lIGRyaXZlcg0K
Pj4+PiBkb2VzLCBJIHJlY2tvbiBzZXR0aW5nIExDUl9IIHNob3VsZCBiZSBrZXB0IGluIGVhcmx5
IGNvZGUuDQo+Pj4gDQo+Pj4gR29vZCBxdWVzdGlvbi4gSSB0aGluaywgeW91IHdvdWxkIGVuZCB1
cCB3aXRoIHRoZSBzYW1lIGlzc3VlIEkgbWVudGlvbmVkDQo+Pj4gYWJvdmUgaWYgdGhlIGZpcm13
YXJlIGFuZCBYZW4gaGF2ZSBkaWZmZXJlbnQgbGluZSBjb250cm9sIHJlZ2lzdGVycw0KPj4+ICh0
b29scyBsaWtlIG1pbmljb20vc2NyZWVuIHdvdWxkIGFzayBmb3IgaXQpLg0KPj4+IA0KPj4+IFNv
IEkgYW0gb24gdGhlIGZlbmNlIGhlcmUuIEluIG9uZSB3YXksIGl0IHNlZW1zIHBvaW50bGVzcyBr
ZWVwIGl0LiBCdXQNCj4+PiBvbiB0aGUgb3RoZXIgaGFuZCwgWGVuIGhhcyBhbHdheXMgc2V0IGl0
LiBTbyBJIGhhdmUgbm8gZGF0YSB0byBwcm92ZQ0KPj4+IHRoaXMgd2lsbCBiZSBmaW5lIGV2ZXJ5
d2hlcmUuDQo+PiBJZiB3ZSBhcmUgcmVseWluZyBvbiB0aGUgZmlybXdhcmVbMV0gdG8gY29uZmln
dXJlIHRoZSBiYXVkIHJhdGUsIGl0IGlzIG5vdCB2ZXJ5IHdpc2UNCj4+IG5vdCB0byByZWx5IG9u
IGl0IHRvIGNvbmZpZ3VyZSB0aGUgTENSLiBMb29raW5nIGF0IHRoZSBvdGhlciBzZXJpYWwgZHJp
dmVycyBpbiBYZW4sDQo+PiB3ZSBoYXZlIGEgcmVhbCBtaXNtYXRjaCBpbiB3aGF0IGlzIGJlaW5n
IGNvbmZpZ3VyZWQuIFNvbWUgb2YgdGhlIGRyaXZlcnMgKG9tYXAsIGlteCksDQo+PiBhcGFydCBm
cm9tIHNldHRpbmcgOG4xIGFsc28gc2V0IHRoZSBiYXVkIHJhdGUgZXhwbGljaXRseSB0byAxMTUy
MDAgYW5kIGFsbW9zdCBhbGwgb2YgdGhlbQ0KPj4gZG8gc2V0IDhuMS4gSW4gdGhhdCBjYXNlIHdl
IHdpbGwgbm90IGJlbmVmaXQgdG9vIG11Y2ggZnJvbSBmaXhpbmcganVzdCBwbDAxMS4NCj4gSXQg
aXMgbm90IGdyZWF0IHRoYXQgWGVuIGhhcmRjb2RlIHRoZSBiYXVkIHJhdGUgKEkgY2FuJ3QgcmVt
ZW1iZXIgd2hldGhlciB0aGVyZSB3YXMgYSByZWFzb24pLCBidXQgSSBkb24ndCB0aGluayB0aGUg
Y29uc2lzdGVuY3kgaXMgbmVjZXNzYXJ5IGhlcmUgKHNlZSBtb3JlIGJlbG93KS4NCj4gDQo+PiBP
biB0aGUgb3RoZXIgaGFuZCwgWGVuIGZvbGxvd3MgdGhlIHpJbWFnZS9JbWFnZSBwcm90b2NvbHMg
Zm9yIEFSTSBbMl0gd2hpY2ggZG8gbm90DQo+PiBzdGF0ZSB0aGF0IHNlcmlhbCBwb3J0IGluaXRp
YWxpemluZyBpcyBzb21ldGhpbmcgbWFuZGF0b3J5LiBUaGlzIGNvdWxkIGluZGljYXRlIHRoYXQN
Cj4+IHRoZSBmaXJtd2FyZSBkb2VzIG5vdCByZWFsbHkgbmVlZCB0byBjb25maWd1cmUgdGhlIHNl
cmlhbC4NCj4gDQo+IFRoZSBmaXJtd2FyZSBkb2Vzbid0IG5lZWQgdG8gY29uZmlndXJlIHRoZSBz
ZXJpYWwgYW5kIHllcyBpbiB0aGVvcnkgWGVuIHNob3VsZCBjb25maWd1cmUgdGhlIGJhdWQgcmF0
ZSBhbmQgcGFyaXR5IGJhc2VkIG9uIHRoZSBmaXJtd2FyZSB0YWJsZS4NCj4gDQo+IEhvd2V2ZXIs
IHRoaXMgaXMgYSB0cmFkZSBvZmYgYmV0d2VlbiBjb21wbGV4aXR5IGFuZCBiZW5lZml0cy4gVGhl
IHBhdGNoIEkgbWVudGlvbmVkIGVhcmxpZXIgaGFzIGJlZW4gcmVtb3ZlZCBuZWFybHkgNiB5ZWFy
cyBhZ28gYW5kIEkgaGF2ZW4ndCBzZWVuIGFueW9uZSByZXBvcnRpbmcgYW55IGlzc3Vlcy4NCj4g
DQo+IEhlbmNlIHdoeSBJIHRoaW5rIGZvciB0aGUgUEwwMTEgaXQgaXMgbm90IHdvcnRoIGxvb2tp
bmcgWzNdIGF0IHRoZSBiYXVkIHJhdGUgYW5kIGluc3RlYWQgcmVtb3ZpbmcgaXQgY29tcGxldGVs
eSBpbiB0aGUgZWFybHkgUEwwMTEgY29kZSBhcyB3ZWxsLg0KPiANCj4gVGhhdCBzYWlkLCBpZiB5
b3UgZmVlbCBzdHJvbmdseSBhZGRpbmcgc3VwcG9ydCBmb3IgYmF1ZCByYXRlIHRoZW4gSSB3aWxs
IGJlIGhhcHB5IHRvIHJldmlldyB0aGUgcGF0Y2guDQoNCkp1c3Qgb25lIHJlbWFyayBoZXJlOiBJ
biBzb21lIGNhc2VzIHRoZSBmaXJtd2FyZSBtaWdodCB1c2UgYSBkaWZmZXJlbnQgY29uc29sZSB0
aGFuIHRoZSBzZXJpYWwgb25lIChmb3IgZXhhbXBsZSBhIGdyYXBoaWNhbCBvbmUpIGFuZCBYZW4g
Y291bGQgYmUgdGhlIGZpcnN0IHRvIHVzZSB0aGUgc2VyaWFsIGNvbnNvbGUuDQpTbyB0aGVyZSBt
aWdodCBiZSBjYXNlcyB3aGVyZSBpZiB3ZSBkbyBub3Qgc2V0IGEgZGVmYXVsdCB2YWx1ZSwgdGhl
IGNvbnNvbGUgd2lsbCBub3QgYmUgY29uZmlndXJlZCBhdCBhbGwuDQoNCkkgdGhpbmsgdGhlIGJl
c3Qgc29sdXRpb24gaGVyZSB3b3VsZCBiZSB0byBoYXZlIGEgQ09ORklHIHNldHRpbmcgc28gdGhh
dCBzb21lb25lIGNvbXBpbGluZyBYZW4gY291bGQgY2hvb3NlIGJldHdlZW4g4oCca2VlcGluZyBm
aXJtd2FyZSBjb25maWfigJ0gb3Ig4oCcZm9yY2UgYSBjb25maWfigJ0uDQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0KPiANCj4+IFsxXSBJdCBpcyBub3Qgc3RhdGVkIGFueXdoZXJlIGluIG91ciBkb2Nz
Lg0KPiANCj4gT3VyIGRvY3MgYXJlIG5vdCBwZXJmZWN0LiBQYXRjaGVzIGFyZSB3ZWxjb21lZCBm
b3IgaW1wcm92ZW1lbnQuIEFsdGhvdWdoLCBJIHRoaW5rIHRoZSBzdGF0ZW1lbnQgc2hvdWxkIG9u
bHkgYmUgZm9yIGRyaXZlciB3aGVyZSB3ZSBkb24ndCBzZXQgdGhlIGJhdWQgcmF0ZS4gRm9yIHRo
ZSBvdGhlcnMsIHdlIHNob3VsZCBsZWF2ZSBpdCBhcyBpcyB1bmxlc3MgeW91IGNhbiBwcm92ZSB0
aGlzIGlzIG5vdCBuZWNlc3NhcnkgKHdlIGRvbid0IHdhbnQgdG8gYnJlYWsgZXhpc3Rpbmcgc2V0
dXApLg0KPiANCj4+IFsyXSBCVFc6IG91ciBkb2NzL21pc2MvYXJtL2Jvb3RpbmcgY29udGFpbnMg
aW52YWxpZCBsaW5rcyB0byB0aGUga2VybmVsIGRvY3MuIEkgZ3Vlc3MNCj4+IHRoaXMgd2FudHMg
dG8gYmUgZml4ZWQuDQo+IA0KPiBQYXRjaGVzIGFyZSB3ZWxjb21lZC4NCj4gDQo+IFszXSBJIGRv
IGhhdmUgYSBsYXJnZSBsaXN0IG9mIG1vcmUgY3JpdGljYWwgYnVncyB0aGF0IEkgd2lsbCBiZSBo
YXBweSB0byBzaGFyZSBpZiB5b3UgYXJlIGxvb2tpbmcgZm9yIGltcHJvdmluZyBYZW4uDQo+IA0K
PiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

