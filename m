Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78657AEA0F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 12:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608396.946862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql52K-0008Vs-E7; Tue, 26 Sep 2023 10:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608396.946862; Tue, 26 Sep 2023 10:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql52K-0008UC-B5; Tue, 26 Sep 2023 10:11:24 +0000
Received: by outflank-mailman (input) for mailman id 608396;
 Tue, 26 Sep 2023 10:11:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hi6D=FK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ql52I-0008U6-N8
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 10:11:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e6defd-5c55-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 12:11:20 +0200 (CEST)
Received: from DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) by AS8PR08MB10026.eurprd08.prod.outlook.com
 (2603:10a6:20b:632::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 10:11:16 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::16) by DUZPR01CA0219.outlook.office365.com
 (2603:10a6:10:4b4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 10:11:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 10:11:15 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Tue, 26 Sep 2023 10:11:15 +0000
Received: from de3bab3c35e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81059378-0BC0-4131-8BD3-D155108FBCA3.1; 
 Tue, 26 Sep 2023 10:11:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de3bab3c35e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 10:11:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB8239.eurprd08.prod.outlook.com (2603:10a6:150:5f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 10:10:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 10:10:57 +0000
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
X-Inumbo-ID: 09e6defd-5c55-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2b9+yGDfHE3sm9F3YWdNFtMqdATr1Ow/7EUVdL+ELg=;
 b=cptOBDtKKYJMd0OgS36eOzSry6MekltflfDHZH5cG8pON2pW25+1FfHbomCjVS9iRG1jt0gb7RnyvkpWG/11PT7CojEUJNsUmkrG+O31Ek7a8J1DNAZYf2f+boaz9ZEsRbOC1ZPULBTkCJKRsMdzmJm/39H6KcSxe55bwOBweiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 955973c94c22eee1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME2QolRVyhO3YrCe5n1U0qUOTJXfeuBeMCAqknYplpDYCrHrkd1WswCU1HiWmwNcyE4IzR7di56QqrSFnEFPvUzLgq7qlKfJMFxvfLeyOThO5sHPLyC6rbs0XvIZEDwdhhdvZw+V/kzT/ftnran4o/ODlMV0HpcpH2SP2LWfskfhG3rGMOjUkXrWt2NFplOSMoyKCEUawI9a1bIoxWjBk+k616fnjeTYYGBZpQAs7WJ63/rN9nOrmyxB+mLljHPfG/xEezZU/H3s3SYvrpHohysoZDHCRMVJf/uqfOYBoaqAhco+IcutYqunPAFJ2DL79ixnYUtEURAGtU0No28PuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2b9+yGDfHE3sm9F3YWdNFtMqdATr1Ow/7EUVdL+ELg=;
 b=dTOxpsZNRBl+JuRNviLl1TqPzGKvRoIuyRW9uKUf77RMInrpPoQkoRYTJ+8XuBRYdtOxgzzHSyuE66nOX2xSywdMTdrz2K0R8Z52e8ZuQsYHbicFRQkw4zxRB/c7r0bQ6gjVNeK3s6UX2c1lMltyipIDuoBBgz62U4XFR7ZJMEJuUMPSBiVmd3t1r7LOktrAvMMXzXcgaXy4gxLjNa4jSwa+dITUL6dI11A67ifIGXlHVpIGesOqfoeJU+ALrG+MXA5J8WrW6hiGunU/n/ft0wl2EM9+PuDdRxgnxl9+lFAFLqlZXoxzj56DGyL6Y1gzgnlN2i4hz4GU1RoiUDb2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2b9+yGDfHE3sm9F3YWdNFtMqdATr1Ow/7EUVdL+ELg=;
 b=cptOBDtKKYJMd0OgS36eOzSry6MekltflfDHZH5cG8pON2pW25+1FfHbomCjVS9iRG1jt0gb7RnyvkpWG/11PT7CojEUJNsUmkrG+O31Ek7a8J1DNAZYf2f+boaz9ZEsRbOC1ZPULBTkCJKRsMdzmJm/39H6KcSxe55bwOBweiI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Thread-Topic: [PATCH] xen/arm: Skip memory nodes if not enabled
Thread-Index: AQHZ8DsUAeh4H14sIUq1QR77iDXfDrAs3c8AgAADhQCAAAGkAA==
Date: Tue, 26 Sep 2023 10:10:57 +0000
Message-ID: <5BF208F8-3676-49C2-8E42-7BA10ACE6190@arm.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <BDC53ABB-AC26-45AF-A8FC-E12C83209400@arm.com>
 <10c01fc1-8140-c81d-8e9a-4fdce2adcaa0@amd.com>
In-Reply-To: <10c01fc1-8140-c81d-8e9a-4fdce2adcaa0@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB8239:EE_|DBAEUR03FT046:EE_|AS8PR08MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d95f391-01c2-4da5-b957-08dbbe78eb77
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oa+kOje7Am7GdoMymYKdSOVyBCcLXuE6h0EjoXSwjisv6vzo6KzY+F7IESrQkZDAqEGuzp8shnQ+PWD0Bjaaj+sXbnvCHJsNw3G8XDMsRTUUfazuLaETjuIJoEoI48DQ5cAQkjdyfPNzQjvfd1PjrR+wuriCu3vXmnKLN0pF7NSi6GYDSyC1bateLZL6656a6hkFxqEfqjiUuLb7mvCs9ucLqGMcI+inGHqXypqkd8+6NiE5SzYi3yXzEPNgJgMWVYOCj6absiKaGbxsw5Ip3EACNremU8GRmfRVTR927L/fNpnLqWvPFRriRyrK/74WSCgu50Qdn7SkWk+0Wu3FVDdN4sLuHltqfmwo6VeVH53oqB6RSJ/kfPQydoEvIcz58ZaWcx3zA0E4eq85hcczlLVKmoOcMGNKUK6Nfb6fJ2nm/LZeqvUF5VlIlwmm+KWn9GCPAIp27z2Lg3LkxbHfcAAS1pwfvGPu9VEMWaOtjSnNAWVo4BHvDVBb3E4BeKkOMNkHELNzGJ8zkxqr722xO2l9avIH6c18Gzv7OsOllFTT+oL7J15/SMscU6/q7OauDdqN0m7wqvCjdL45HDFboTCtYh90QrkM9rR26GY/ql9ETc5i+erxik3scM6KgsSIAW475XeDiye/fIDu/TjFCQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(316002)(4326008)(53546011)(8676002)(6506007)(8936002)(5660300002)(71200400001)(6916009)(54906003)(478600001)(64756008)(2906002)(66476007)(66946007)(91956017)(2616005)(66446008)(76116006)(6486002)(6512007)(66556008)(26005)(41300700001)(83380400001)(38070700005)(38100700002)(122000001)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <888A4685B97AF8459C33B392EC302F3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8239
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f2e6308-e6e0-47c9-bc75-08dbbe78e051
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+js5RqEoH3OUtrXVZYQyPYhNtF5xGf3YPh6h3pn62RJiuItahY8H5zkYWqStg9Y8x2OzJkFcJzKH8UTkAtZ7ZbpOhlhUbQ7bd0fw+uqryPwmMT78Sd0HUutdru7AVxKiz1TxjfV9biOUuu9tjp1f50MXctvj4lD5kpGcaDiE3rTAl7Sc0ujinrq2Sg5qceTK4R4HpcPBy+wHnV9p6wpekhCu2ewNhscv/ApFgLODlcAL9QzZ6UvMPyCOF38WdWAGxt8OYAwpAVE9dsYPuTVw6NJEwOdRo/G49LE9mwKtcIO8K8LsydnXNEowQxXgfKnsqnaojYFuFFhHdkfTc5oZ4wgxfDCBzicgME//CitxZX2d73j8/TqC0959WyDQPHkR1kzPeNfNhreM3sfiotayPaGFljPauDObvXsUwT52Qt+ZkRL6bERmO4M53GnbLhB/26qmkNFDXXU2L/GtFseFWS430UQ/EihizLDFtkcHuyEZjRfXHhiqu1IsuJRuw+jNtbIb42A8LW/MKzgfQ2n63KjF6qpLIq18a2BUvL33+hTKVOQlR3/wwuQs5S+EAzmgplp44vWdFqkyf7G1gHJfyvoScT8syNNLL27peJI1cmVJdCtW0eBzh9NhkV5TNdXfluf0YX4m1If8K2cD75bE8FpWMw+21lRu5JyOPqCVGWj3RqO1P6cVePC0zFZIPDoTpZXEvFMZ9xRH3a3UQOE0BjSoMKe6rK/WRfp80P0t0jbO9+jZv2jS6s2KewHQ6Tw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(26005)(40480700001)(5660300002)(83380400001)(54906003)(2906002)(70206006)(356005)(316002)(41300700001)(36756003)(8676002)(8936002)(4326008)(6862004)(33656002)(86362001)(336012)(6512007)(6506007)(70586007)(6486002)(53546011)(107886003)(82740400003)(2616005)(81166007)(478600001)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 10:11:15.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d95f391-01c2-4da5-b957-08dbbe78eb77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10026

DQoNCj4gT24gMjYgU2VwIDIwMjMsIGF0IDExOjA0LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyNi8wOS8yMDIzIDEx
OjUyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAyNiBTZXAgMjAyMywg
YXQgMDY6MzMsIExlbyBZYW4gPGxlby55YW5AbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g
RHVyaW5nIHRoZSBMaW51eCBrZXJuZWwgYm9vdGluZywgYW4gZXJyb3IgaXMgcmVwb3J0ZWQgYnkg
dGhlIFhlbg0KPj4+IGh5cGVydmlzb3I6DQo+Pj4gDQo+Pj4gKFhFTikgYXJjaC9hcm0vcDJtLmM6
MjIwMjogZDB2MDogRmFpbGluZyB0byBhY3F1aXJlIHRoZSBNRk4gMHgxYTAyZGMNCj4+PiANCj4+
PiBUaGUga2VybmVsIGF0dGVtcHRzIHRvIHVzZSBhbiBpbnZhbGlkIG1lbW9yeSBmcmFtZSBudW1i
ZXIsIHdoaWNoIGNhbiBiZQ0KPj4+IGNvbnZlcnRlZCB0bzogMHgxYTAyZGMgPDwgUEFHRV9TSElG
VCwgcmVzdWx0aW5nIGluIDB4MV9hMDJkX2MwMDAuDQo+Pj4gDQo+Pj4gVGhlIGludmFsaWQgbWVt
b3J5IGZyYW1lIGZhbGxzIGludG8gYSByZXNlcnZlZCBtZW1vcnkgbm9kZSwgd2hpY2ggaXMNCj4+
PiBkZWZpbmVkIGluIHRoZSBkZXZpY2UgdHJlZSBhcyBiZWxvdzoNCj4+PiANCj4+PiByZXNlcnZl
ZC1tZW1vcnkgew0KPj4+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMj47DQo+Pj4gICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwweDAyPjsNCj4+PiAgICAgICAgIHJhbmdlczsNCj4+PiANCj4+
PiAuLi4NCj4+PiANCj4+PiAgICAgICAgIGV0aG9zbl9yZXNlcnZlZCB7DQo+Pj4gICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsNCj4+PiAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MDEgMHhhMDAwMDAwMCAweDAwIDB4MjAwMDAwMDA+Ow0KPj4+ICAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPj4+ICAgICAgICAgICAgICAgICBuby1tYXA7
DQo+Pj4gICAgICAgICB9Ow0KPj4+IA0KPj4+IC4uLg0KPj4+IH07DQo+Pj4gDQo+Pj4gWGVuIGV4
Y2x1ZGVzIGFsbCByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBmcm9tIHRoZSBmcmFtZSBtYW5hZ2Vt
ZW50DQo+Pj4gdGhyb3VnaCB0aGUgZHRfdW5yZXNlcnZlZF9yZWdpb25zKCkgZnVuY3Rpb24uIE9u
IHRoZSBvdGhlciBoYW5kLCB0aGUNCj4+PiByZXNlcnZlZCBtZW1vcnkgbm9kZXMgYXJlIHBhc3Nl
ZCB0byB0aGUgTGludXgga2VybmVsLiBIb3dldmVyLCB0aGUgTGludXgNCj4+PiBrZXJuZWwgaWdu
b3JlcyB0aGUgJ2V0aG9zbl9yZXNlcnZlZCcgbm9kZSBzaW5jZSBpdHMgc3RhdHVzIGlzDQo+Pj4g
ImRpc2FibGVkIi4gVGhpcyBsZWFkcyB0byB0aGUgTGludXgga2VybmVsIHRvIGFsbG9jYXRlIHBh
Z2VzIGZyb20gdGhlDQo+Pj4gcmVzZXJ2ZWQgbWVtb3J5IHJhbmdlLg0KPj4gDQo+PiBJIG1pZ2h0
IGJlIHdyb25nLCBidXQgcmVhZGluZyB0aGUgc3BlY2lmaWNhdGlvbnMgc2VlbXMgdGhhdCDigJxz
dGF0dXPigJ0gaXMgbm90IGEgcHJvcGVydHkNCj4+IG9mIHRoZSBjaGlsZCBub2RlcyBvZiAvcmVz
ZXJ2ZWQtbWVtb3J5LCBzbyBJ4oCZbSBub3Qgc3VyZSBYZW4gc2hvdWxkIGRvIHNvbWV0aGluZyBh
Ym91dCBpdC4NCj4gUGxlYXNlIHRha2UgYSBsb29rIGF0IGR0IGRvY3VtZW50YXRpb24gKHYwLjQp
IGZvciAvbWVtb3J5IGFuZCAvcmVzZXJ2ZWQtbWVtb3J5Lg0KPiBVbmRlciB0aGUgdGFibGVzIGxp
c3RpbmcgcG9zc2libGUgcHJvcGVydGllcywgdGhlcmUgaXMgYSBzdGF0ZW1lbnQ6DQo+IE5vdGU6
IEFsbCBvdGhlciBzdGFuZGFyZCBwcm9wZXJ0aWVzIChTZWN0aW9uIDIuMykgYXJlIGFsbG93ZWQg
YnV0IGFyZSBvcHRpb25hbC4NCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dCwgSSBtaXNz
ZWQgdGhhdCBiaXQuDQoNCj4gDQo+ICJzdGF0dXMiIGlzIHBhcnQgb2Ygc3RhbmRhcmQgcHJvcGVy
dGllcyBzbyBpdCBpcyBwZXJmZWN0bHkgZmluZSBmb3IgL21lbW9yeSBvciAvcmVzZXJ2ZWQtbWVt
b3J5DQo+IG5vZGVzIHRvIGhhdmUgaXQgZGVmaW5lZC4NCj4gDQo+IH5NaWNoYWwNCg0K

