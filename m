Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE49416D2E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:55:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194992.347435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTg2W-0008SK-1p; Fri, 24 Sep 2021 07:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194992.347435; Fri, 24 Sep 2021 07:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTg2V-0008P2-Un; Fri, 24 Sep 2021 07:54:35 +0000
Received: by outflank-mailman (input) for mailman id 194992;
 Fri, 24 Sep 2021 07:54:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTg2U-0008Ow-BZ
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:54:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5d1489d-1d0c-11ec-baad-12813bfff9fa;
 Fri, 24 Sep 2021 07:54:32 +0000 (UTC)
Received: from AM7PR03CA0021.eurprd03.prod.outlook.com (2603:10a6:20b:130::31)
 by HE1PR0802MB2219.eurprd08.prod.outlook.com (2603:10a6:3:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.16; Fri, 24 Sep
 2021 07:54:30 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::d7) by AM7PR03CA0021.outlook.office365.com
 (2603:10a6:20b:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 07:54:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 07:54:30 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Fri, 24 Sep 2021 07:54:29 +0000
Received: from d775d31bf7b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C65841A-226C-48D2-BCBF-6C281A901D03.1; 
 Fri, 24 Sep 2021 07:54:18 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d775d31bf7b9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 07:54:18 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5466.eurprd08.prod.outlook.com (2603:10a6:10:114::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.16; Fri, 24 Sep
 2021 07:54:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:54:16 +0000
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
X-Inumbo-ID: a5d1489d-1d0c-11ec-baad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzJBlzNEV/yqoCzrv32maG35E4hu99vpWuR7s7TJBNM=;
 b=YhkgS6AFW2sqcA+obLEjGz88/HoOTwPmfsaUV+0IIINfOsPv9pukcalo4b1ZnzohkzhJqf73SU9HTz32gRz9tvOO1356S51PZlg/3o3eO4OWEnFVe6LcZIKp964eH5L2wwQJ9+l4fCO8e9xTeoynDLyzO3RfB7CmvlAjXkvZ4AA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0PEYmk0Osw6ZHS8oWTHu/XzQ73Bvk/HGDUykCsYvjEo7mfCGDOqxAxe/aAMo60fbPTGy+WvVe9cRR3LTO67LmHDTk48jen6k1Of0ZZ9dKHOZQhupEEUVEVAF/giAWdhXQGP77JBDpIM9st5S6dx1MHlWvKWUP9Gw6E56rHAPQzQinYQruDSKcxxgNv1Kb6dsARG3sbtfe/ou/sbbd/TJAfkkZcv7QLWH//29F2PBIb6YJQaxAqyLLeMd6a3LeTjU1tcKSQndSuQDo+VORFWRurrkMidYlY55HJHckaRUwwzTS+tMCoYAS1GZHkR+tUJj4WDz/Nhv/6fohftpHhjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gzJBlzNEV/yqoCzrv32maG35E4hu99vpWuR7s7TJBNM=;
 b=R7AjvHHazirLh2lqDF0rGYue3bYsf33CBLiXvpGVbECZcze8skGGr4GUpacZaEcz3MhxfG9gVprOiasGcs+3pjLs+ELi6ExW/CydMIZW4sW74yggB4INTmRnsmJ1Oh3Jlb6XHbxXBMOyMF0T4tr9aDSo239HXCD2xIKLhSmYaHAGcwC7EJFFbH0J9Nb+uAewa8hwZhrR5Shy4PjKfgG4IhhZ4uOL17e0n/V8nt7+Tqs/4zSHdTx6M/+8Sy2e3zTj78+16xTFGlYU5/pSdwddZ1Xnjj5GRBlZHOzHGs5X2mKuCUuJ86iHtWrp/8OWz5eDwmZ6bvKR4L2r31tP6RM1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzJBlzNEV/yqoCzrv32maG35E4hu99vpWuR7s7TJBNM=;
 b=YhkgS6AFW2sqcA+obLEjGz88/HoOTwPmfsaUV+0IIINfOsPv9pukcalo4b1ZnzohkzhJqf73SU9HTz32gRz9tvOO1356S51PZlg/3o3eO4OWEnFVe6LcZIKp964eH5L2wwQJ9+l4fCO8e9xTeoynDLyzO3RfB7CmvlAjXkvZ4AA=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 30/37] xen/arm: introduce a helper to parse device tree
 memory node
Thread-Topic: [PATCH 30/37] xen/arm: introduce a helper to parse device tree
 memory node
Thread-Index: AQHXsHMzd7zwv2PLeUu2UelHuD4H8quygRqAgABQWwA=
Date: Fri, 24 Sep 2021 07:54:16 +0000
Message-ID:
 <DB9PR08MB6857CC06CB5190A770EC60079EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-31-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231945190.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231945190.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 03FD5B1AFF8BA44A82D1F6F29BE196B6.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ef23b600-2409-4453-b229-08d97f308a5f
x-ms-traffictypediagnostic: DB8PR08MB5466:|HE1PR0802MB2219:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2219E67EE272839E7879A6F09EA49@HE1PR0802MB2219.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x7u89GBbELKlLdn2K0DudQGdUd4c1HqDkIanbvM/XzWxxKIy0URzlwJC3pc7Zi+RKGMnrsylWYUb19sexi9eLbhxtIX/8bZy8bFBEQpLqBqCPZmCmlqmWwLsKfQ1VIuXrbqssnm8/qy3AFA3s3AnHppIVUGmDQGVn8PhJ9Kzc7/PBgE33im41bKGfTLOTiWA1gzRlpqsvbl3u8XTqj9YfnAmPz2SF55I0NODSUFecW5oMo/lMgMxZbqzWmOvrhWlkMF5CyX0gF6Pi/ssgYG1Rfg/yci8/q+7V3cT2lylh7D5BV8C0oyEgJctXppJ6AhVwVpnfafixGpcLcxW+1gj4CQHnZDr5u2DGn2FOQ0FzGPcwoBIqp2tsqPbPuP8BXerYmU9BR6zgYkfhl9SXlo6qkdly3lvSNlDSBGfZCrzzSwb5V4XS53NI53ceHDnikKyC/HuermHVIDmlZ4PeVLO1IFFNNuu3GNuuU1XeoYjc1qJGCcKT3zfhQZAAwMD1OadICzytrCMgtSoEO2NBt3NPT3buVlXUGCKcXBAV6JafTaTt3ladbXKty5V/nG57yFiA/tZRSisSA3IHskPlZ/wdSLifQ5zlFTNSRe1oNw2ZiqC2/lB3clSQ8MDLqlihXi3/VvdzfIMBr3dR29RNRzVKI1NrPUgZx2NUEuxncSJsgPSsH9LPzChjxtEGSBFQxZp/fQ+tXos0i9wQCNHEeTjnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(7696005)(4326008)(5660300002)(186003)(53546011)(122000001)(71200400001)(83380400001)(26005)(55016002)(54906003)(8936002)(9686003)(64756008)(38100700002)(33656002)(316002)(66476007)(86362001)(66446008)(66556008)(6916009)(2906002)(8676002)(52536014)(76116006)(66946007)(508600001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5466
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e83bdb3a-7da7-4610-2869-08d97f30821f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y0FOVLps+Fps4cnyAOXq5fgncookznOW/BiYHjAU2t5rDoJmBcnKLg1uPteb7vHkD3BnuTFsnbOhkIylS3klD4wS+etTVVX54Y//3PMKvX7sHzIYwUcl8rv+KgOkiMs2Q9EaFi3jsKxVKjQQiBibqcAhyDXsBASeYVeKOs6Sx/EDwNh6RRtZ/gHcjuIGKPZM8AFGct31diaerxoc50CtYYI8n9TIbOLWBoiHXtZG3U4VUURrlLOiy2mZos6Xzhf9XxvUPvEPr1AcUCFmXL5RFd9E/6Qv3eLDK0euoOk8XTHzYBVVlJd9WH0+LHZqNxu5y3ShhdTC940UWR6Vt1Y1m/76ToyaUln7NcmmRKjWJwYYDXgGHirnrIUUj2vC77Y/fhNM9vnXD17Wfe19AKbjvs/7vDLYKtf4Uf6BKfmFRJ66ZRJurZCJqk8QuGFPemCBgdU6dbeQ3wCEuqgoNzBasv//ZIFdSTE7an9PrAA5xHWS8qo9jypj6DJLZpL51cxMrrCgFuEfIbRxlFOd5eYXY+RoLxPpEneI+uwE00qR0kUkRaDXOxWtqLqSOEw2PvOdLkwwjD68QiYVRSF6gxhqmeK98czufCSTcNBoXLJHHzmTtu6bwUn3CMHyaT3MlbhlKwgQ/vKdj5/tzlSCWvhR7T/Mtz1DNqQMrxgeLK1vQfs/66hgtBK1C5rrmSRVj64sAlDIbvKJmWB0nGZJNJfzKQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(7696005)(26005)(2906002)(5660300002)(52536014)(8936002)(53546011)(36860700001)(6506007)(82310400003)(336012)(8676002)(186003)(54906003)(33656002)(356005)(47076005)(55016002)(81166007)(4326008)(70586007)(70206006)(508600001)(316002)(6862004)(9686003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:54:30.5501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef23b600-2409-4453-b229-08d97f308a5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2219

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgMTE6MDUNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxp
ZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMwLzM3XSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBoZWxw
ZXIgdG8gcGFyc2UgZGV2aWNlDQo+IHRyZWUgbWVtb3J5IG5vZGUNCj4gDQo+IE9uIFRodSwgMjMg
U2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IE1lbW9yeSBibG9ja3MnIE5VTUEgSUQgaW5m
b3JtYXRpb24gaXMgc3RvcmVkIGluIGRldmljZSB0cmVlJ3MNCj4gPiBtZW1vcnkgbm9kZXMgYXMg
Im51bWEtbm9kZS1pZCIuIFdlIG5lZWQgYSBuZXcgaGVscGVyIHRvIHBhcnNlDQo+ID4gYW5kIHZl
cmlmeSB0aGlzIElEIGZyb20gbWVtb3J5IG5vZGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
V2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+IA0KPiBUaGVyZSBhcmUgdGFicyBmb3IgaW5k
ZW50YXRpb24gaW4gdGhpcyBwYXRjaCwgd2UgdXNlIHNwYWNlcy4NCj4gDQoNCk9LDQoNCj4gDQo+
ID4gLS0tDQo+ID4gIHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMgfCA4MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDgwIGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2Vf
dHJlZS5jDQo+IGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+IGluZGV4IDI0
MjhmYmFlMGIuLjc5MThhMzk3ZmEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL251bWFf
ZGV2aWNlX3RyZWUuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMN
Cj4gPiBAQCAtNDIsNiArNDIsMzUgQEAgc3RhdGljIGludCBfX2luaXQNCj4gZmR0X251bWFfcHJv
Y2Vzc29yX2FmZmluaXR5X2luaXQobm9kZWlkX3Qgbm9kZSkNCj4gPiAgICAgIHJldHVybiAwOw0K
PiA+ICB9DQo+ID4NCj4gPiArLyogQ2FsbGJhY2sgZm9yIHBhcnNpbmcgb2YgdGhlIG1lbW9yeSBy
ZWdpb25zIGFmZmluaXR5ICovDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGZkdF9udW1hX21lbW9y
eV9hZmZpbml0eV9pbml0KG5vZGVpZF90IG5vZGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFkZHJfdCBzdGFydCwgcGFkZHJfdCBzaXplKQ0KPiANCj4gUGxlYXNlIGFs
aWduIHRoZSBwYXJhbWV0ZXJzDQo+IA0KDQpPSw0KDQo+IA0KPiA+ICt7DQo+ID4gKyAgICBpbnQg
cmV0Ow0KPiA+ICsNCj4gPiArICAgIGlmICggc3JhdF9kaXNhYmxlZCgpICkNCj4gPiArICAgIHsN
Cj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKwlp
ZiAoICFudW1hX21lbWJsa3NfYXZhaWxhYmxlKCkgKQ0KPiA+ICsJew0KPiA+ICsJCWRwcmludGso
WEVOTE9HX1dBUk5JTkcsDQo+ID4gKyAgICAgICAgICAgICAgICAiVG9vIG1hbnkgbnVtYSBlbnRy
eSwgdHJ5IGJpZ2dlciBOUl9OT0RFX01FTUJMS1MgXG4iKTsNCj4gPiArCQliYWRfc3JhdCgpOw0K
PiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldCA9IG51bWFf
dXBkYXRlX25vZGVfbWVtYmxrcyhub2RlLCBzdGFydCwgc2l6ZSwgZmFsc2UpOw0KPiA+ICsJaWYg
KCByZXQgIT0gMCApDQo+ID4gKwl7DQo+ID4gKwkJYmFkX3NyYXQoKTsNCj4gPiArCSAgICByZXR1
cm4gLUVJTlZBTDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKyAgICByZXR1cm4gMDsNCj4gPiArfQ0K
PiANCj4gQXNpZGUgZnJvbSBzcGFjZXMvdGFicywgdGhpcyBpcyBhIGxvdCBiZXR0ZXIhDQo+IA0K
DQpvaw0KDQo+IA0KPiA+ICAvKiBQYXJzZSBDUFUgTlVNQSBub2RlIGluZm8gKi8NCj4gPiAgc3Rh
dGljIGludCBfX2luaXQgZmR0X3BhcnNlX251bWFfY3B1X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBp
bnQgbm9kZSkNCj4gPiAgew0KPiA+IEBAIC01NiwzICs4NSw1NCBAQCBzdGF0aWMgaW50IF9faW5p
dCBmZHRfcGFyc2VfbnVtYV9jcHVfbm9kZShjb25zdCB2b2lkDQo+ICpmZHQsIGludCBub2RlKQ0K
PiA+DQo+ID4gICAgICByZXR1cm4gZmR0X251bWFfcHJvY2Vzc29yX2FmZmluaXR5X2luaXQobmlk
KTsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArLyogUGFyc2UgbWVtb3J5IG5vZGUgTlVNQSBpbmZvICov
DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGZkdF9wYXJzZV9udW1hX21lbW9yeV9ub2RlKGNvbnN0
IHZvaWQgKmZkdCwgaW50IG5vZGUsDQo+ID4gKyAgICBjb25zdCBjaGFyICpuYW1lLCB1aW50MzJf
dCBhZGRyX2NlbGxzLCB1aW50MzJfdCBzaXplX2NlbGxzKQ0KPiANCj4gUGxlYXNlIGFsaWduIHRo
ZSBwYXJhbWV0ZXJzDQo+IA0KDQpvaw0KDQo+IA0KPiA+ICt7DQo+ID4gKyAgICB1aW50MzJfdCBu
aWQ7DQo+ID4gKyAgICBpbnQgcmV0ID0gMCwgbGVuOw0KPiA+ICsgICAgcGFkZHJfdCBhZGRyLCBz
aXplOw0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGZkdF9wcm9wZXJ0eSAqcHJvcDsNCj4gPiArICAg
IHVpbnQzMl90IGlkeCwgcmFuZ2VzOw0KPiA+ICsgICAgY29uc3QgX19iZTMyICphZGRyZXNzZXM7
DQo+ID4gKw0KPiA+ICsgICAgbmlkID0gZGV2aWNlX3RyZWVfZ2V0X3UzMihmZHQsIG5vZGUsICJu
dW1hLW5vZGUtaWQiLCBNQVhfTlVNTk9ERVMpOw0KPiA+ICsgICAgaWYgKCBuaWQgPj0gTUFYX05V
TU5PREVTICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcg
Ik5vZGUgaWQgJXUgZXhjZWVkcyBtYXhpbXVtIHZhbHVlXG4iLA0KPiBuaWQpOw0KPiA+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHByb3AgPSBm
ZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgInJlZyIsICZsZW4pOw0KPiA+ICsgICAgaWYgKCAh
cHJvcCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+
ID4gKyAgICAgICAgICAgICAgICJmZHQ6IG5vZGUgYCVzJzogbWlzc2luZyBgcmVnJyBwcm9wZXJ0
eVxuIiwgbmFtZSk7DQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgYWRkcmVzc2VzID0gKGNvbnN0IF9fYmUzMiAqKXByb3AtPmRhdGE7DQo+
ID4gKyAgICByYW5nZXMgPSBsZW4gLyAoc2l6ZW9mKF9fYmUzMikqIChhZGRyX2NlbGxzICsgc2l6
ZV9jZWxscykpOw0KPiA+ICsgICAgZm9yICggaWR4ID0gMDsgaWR4IDwgcmFuZ2VzOyBpZHgrKyAp
DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgZGV2aWNlX3RyZWVfZ2V0X3JlZygmYWRkcmVzc2Vz
LCBhZGRyX2NlbGxzLCBzaXplX2NlbGxzLCAmYWRkciwNCj4gJnNpemUpOw0KPiA+ICsgICAgICAg
IC8qIFNraXAgemVybyBzaXplIHJhbmdlcyAqLw0KPiA+ICsgICAgICAgIGlmICggIXNpemUgKQ0K
PiA+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgcmV0ID0gZmR0
X251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQobmlkLCBhZGRyLCBzaXplKTsNCj4gPiArICAgICAg
ICBpZiAoIHJldCApIHsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAg
ICAgICAgfQ0KPiA+ICsgICAgfQ0KPiANCj4gSSB0YWtlIGl0IHdvdWxkIGJlIGRpZmZpY3VsdCB0
byBwYXJzZSBudW1hLW5vZGUtaWQgYW5kIGNhbGwNCj4gZmR0X251bWFfbWVtb3J5X2FmZmluaXR5
X2luaXQgZnJvbQ0KPiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jOmRldmljZV90cmVlX2dldF9tZW1p
bmZvLiBJcyBpdCBiZWNhdXNlDQo+IGRldmljZV90cmVlX2dldF9tZW1pbmZvIGlzIGNhbGxlZCB0
b28gZWFybHk/DQo+IA0KDQpXaGVuIEkgd2FzIGNvbXBvc2luZyB0aGlzIHBhdGNoLCBwZW5ueSdz
IHBhdGNoIGhhZG4ndCBiZWVuIG1lcmdlZC4NCkkgd2lsbCBsb29rIGludG8gaXQuDQoNCj4gDQo+
ID4gKyAgICBpZiAoIGlkeCA9PSAwICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGso
WEVOTE9HX0VSUg0KPiA+ICsgICAgICAgICAgICAgICAiYmFkIHByb3BlcnR5IGluIG1lbW9yeSBu
b2RlLCBpZHg9JWQgcmV0PSVkXG4iLCBpZHgsDQo+IHJldCk7DQo+ID4gKyAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

