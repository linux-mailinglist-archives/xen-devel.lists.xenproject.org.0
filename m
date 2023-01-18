Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94669671ADD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480525.744994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6oD-0005Ar-LK; Wed, 18 Jan 2023 11:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480525.744994; Wed, 18 Jan 2023 11:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6oD-00058J-I2; Wed, 18 Jan 2023 11:40:49 +0000
Received: by outflank-mailman (input) for mailman id 480525;
 Wed, 18 Jan 2023 11:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pI6oC-00058A-65
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:40:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f296fb4d-9724-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 12:40:46 +0100 (CET)
Received: from FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::15)
 by PR3PR08MB5579.eurprd08.prod.outlook.com (2603:10a6:102:82::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 11:40:36 +0000
Received: from VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::f6) by FR0P281CA0104.outlook.office365.com
 (2603:10a6:d10:a9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Wed, 18 Jan 2023 11:40:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT060.mail.protection.outlook.com (100.127.144.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24 via Frontend Transport; Wed, 18 Jan 2023 11:40:35 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Wed, 18 Jan 2023 11:40:34 +0000
Received: from eb0c4ce55697.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 950E2FF8-548A-4B55-AA88-F7C35CD25286.1; 
 Wed, 18 Jan 2023 11:40:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb0c4ce55697.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 11:40:28 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8904.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Wed, 18 Jan
 2023 11:40:26 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 11:40:26 +0000
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
X-Inumbo-ID: f296fb4d-9724-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ey8Su89gFdov4CFRiSw7lZFecMSHkeLpHbQMhmfj8ek=;
 b=GY4t80OB66Xadp1ZQAlDhCRYmMK9RoT5HoSrA6eelIYK3loYHOsjKtotb/GfgrG15spowR8PlPJcxkVznGAmy8w2K8yNyKT+KM1UPdv3WW2lRAeAprALLySeokatYlcZ5+9I22pXWFEdLuBR/BenMkcc5zgtQl5Cu/WNV2fS7sQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFj3OQWu0riQuYO/CxZcvC1pw8HjF1u86FnB4xN4QdZBsnWIXFvQy9b9Qnbi58gHnZ12bgy4nV6+X0hhAxj5BYaFMwAawcsw/cFaHsVZ8W46hK+p2i/knmISmWCdCqDcZFqCZZ3VLOUQ4Nz28Fd9HdPaHzjR3Jk1aFRj3FddhDvv/nS6SnWOo3iSiSp+vTNKFgzupULuY/4CSzgZ+422liRocf8ViwXytf11JSbVc841Jw8Bku1C2tDlPSk3puPkygCqY2X6XRTRxsS/+HE5kqV9i1fOaOGYa7ifbtx2leROcWrFtKFsdXoinB9Yb0fM0qDHEWnBJejBDLC8cYiglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ey8Su89gFdov4CFRiSw7lZFecMSHkeLpHbQMhmfj8ek=;
 b=Ee79sJFJMaixVbjFipOvca/B51FnQtjdKGuqnLFotai+HwYV29YtqA3e3ZEf2ya5pC8NRoJd4B02aHNCmUMgpmqxPHZQyimTD1SUKXSsOB/8zanhszO84EEP33YdhtpWskPmYeAQgDkAdirWyfoqVlRMwwu7ADAH2s76WtqLi9CtEQv+By8YhL4FYHHLe2339aCBfFvacAX+xLwPxcXBYg4pcYrjg5WaRGN09D8gSiPtEWfC14lGmWJV8r3H5FwSj54vBiIkHJvKpJzBhm3CaYAiZgK05Xfj5qiRlPDQameBjUjagOUgFCN7zA4goiA19a4Ln0ptcOGWvpZmaNOvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ey8Su89gFdov4CFRiSw7lZFecMSHkeLpHbQMhmfj8ek=;
 b=GY4t80OB66Xadp1ZQAlDhCRYmMK9RoT5HoSrA6eelIYK3loYHOsjKtotb/GfgrG15spowR8PlPJcxkVznGAmy8w2K8yNyKT+KM1UPdv3WW2lRAeAprALLySeokatYlcZ5+9I22pXWFEdLuBR/BenMkcc5zgtQl5Cu/WNV2fS7sQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map
 sections
Thread-Topic: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map
 sections
Thread-Index: AQHZJxAY2FhaLGF+HUqxg8o4//gxhq6jTaOAgAAkT4CAAJbRAIAAC0qw
Date: Wed, 18 Jan 2023 11:40:26 +0000
Message-ID:
 <PAXPR08MB7420B12707A7D82675BCFC419EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-8-Penny.Zheng@arm.com>
 <4b817b65-f558-b4df-c7fd-242a04e59a59@xen.org>
 <PAXPR08MB742061C5E8ED73BD43FEF9599EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a5560a16-60d8-dc75-994e-c8719721bf74@xen.org>
In-Reply-To: <a5560a16-60d8-dc75-994e-c8719721bf74@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 69B0EDDB05189244B2A6B0CB0A92293F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8904:EE_|VI1EUR03FT060:EE_|PR3PR08MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d4e6d2-2329-4dbc-e168-08daf948d04a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5fJxhUxIZQ0JIGC0C6U6W2wBvZyhTFg+R13Fh/QqYd0EcQ95sSwAaxljZyQrm6YAzRW8lyLvaGKNwYwFKXclLgdFI448amZ0A1KFp0HyiXGuK4dn7IilGyQg4SUHeZqcJD2akVyUFaiDDMiBFbWNRHxVpMM8ydFU5FaLdmR8tugYV3M+xjucv9dodW5x0WwJknLTEprsM+MdkZOjrc6jXJuJcGUuMaA5Vxf80uZts3rbSdz7vtDEw1KB2Wy6nsPrx2jziGr5tkUgloAhAZIoHNZPMCFil6J1MepHs7WHRZD7NlStmt+1sPUBLBEmrh/vClCwaC1zfwGrP0Nrb5E82FhqBYC6w6vosmTUbE+FAATDznSEmw2RlJ9hPv6Yu0sIGmeROk7V1ir0n0HGC7avnEx++mBzIZ0gQYQcJTGkH9D8FcwJxBPWGgdAvIWQA6hkVsaX8UXM1t+hXX+vgXqRl/FdkM2eghcN7iY+a+m1hBydkcKHG/a6enqoxptEDV/lu7D9qY8ieaQOHjXj7ONuH8+S8N5S0nt+pc/WeXCc6sNs0z7xnWOZbfy0L7aRxcoz8m0m6y+IQhtHASiwt0dpZt9mGGDBOtF3IwzZUnqaF27VkFJV+CZGQJCSGj6xVRI2IQnQmv6HAw/tGlcwPTmE346RoH/8bQknL238tH6VFvVywORqmZIvBRY2fH88KB4H9BFqdQ1LgomDyjOjcOtJ0bwcpVMNqs9o9ovPoZFz5pw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(33656002)(55016003)(54906003)(83380400001)(66446008)(41300700001)(64756008)(5660300002)(4326008)(66946007)(8936002)(52536014)(478600001)(8676002)(186003)(9686003)(66476007)(26005)(66556008)(110136005)(316002)(7696005)(86362001)(71200400001)(76116006)(38100700002)(38070700005)(122000001)(6506007)(2906002)(142923001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd824507-9de7-4617-796c-08daf948cac9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GifZulgwS0srZlB6kcxgaJPkiZQFxKPB9f0r7yhl8UFK5wZ21bEWxcmBzl0RJGM+0y/jpKSJ1xr7E6BWp+PAlSAG1FhmvZggVFmSKVMh//s74cvKfiAdo6FMESWS8uwuGHMazc8LsKPUu/hCqnc6fzjftuJwoWkKTOQ8Xh9xd7qbHDdVyvT75t1EbKREMgE4E7b719fxdlqVPPBgIi8mfZPOvHzIPRwS+FzReH1sMOK0aS0V4eo2iH3Bwh9QbHSVbR1SQoRGVBVbTbM30Rxl3iGDspp3qFS3rPrv4dT44UhEiJKTdGbPuMUNaIGDCE5jh5Wj1p3z7M0uYdF+0UHasMk5XeqEVPgpXEXDZgO1ASPrVEzI1O+o+G10Iud6EUBTuH2PMm10UvOboEx6fS2/0uVaTLsUlMkFjMovm0QeJCo4DUzVoEZnDRJBho5DhOtHxKDQZ3gEhVMTROdOSTmcDk05huRa9PLCPzQ+h1S5l/VbIkFXqmgujpPgN78fJvwebb6fZaxWxxnu9QapNfIeUkLoHYUsU0UO7DAwILUnEXulKj0r8E7LSRCYAnszpAkXQ6i6UsVm6HEnbJarx7DQJrDwWR8kfuipq9kqdDKpqWi1iyBGk8+I/vaXJjSs/MD1Vnw2uft7ho83MTNGKY5IZZkYRS0cirUUAjz4Mr2PrVY+n3lbWvqY4o5b9aWDc/UgvQi5vD7vVgTL7m71yaqzDGrCQzVdxZcZS75BFkXB8Qg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(52536014)(4326008)(41300700001)(107886003)(8676002)(70586007)(8936002)(70206006)(40460700003)(36860700001)(336012)(2906002)(82310400005)(33656002)(5660300002)(316002)(54906003)(110136005)(40480700001)(55016003)(7696005)(86362001)(9686003)(478600001)(186003)(81166007)(26005)(6506007)(356005)(82740400003)(83380400001)(47076005)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:40:35.2470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d4e6d2-2329-4dbc-e168-08daf948d04a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5579

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pg0KPiA+Pj4g
SW4gdGhpcyBwYXRjaCB3ZSBpbnRyb2R1Y2UgLnRleHQuaWRtYXAgdG8gaGVhZF9tbXUuUywgYW5k
DQo+ID4+PiBhZGQgdGhpcyBzZWN0aW9uIGFmdGVyIC50ZXh0LmhlYWRlci4gdG8gZW5zdXJlIGNv
ZGUgb2YNCj4gPj4+IGhlYWRfbW11LlMgYWZ0ZXIgdGhlIGNvZGUgb2YgaGVhZGVyLlMuDQo+ID4+
Pg0KPiA+Pj4gQWZ0ZXIgdGhpcywgd2Ugd2lsbCBzdGlsbCBpbmNsdWRlIHNvbWUgY29kZSB0aGF0
IGRvZXMgbm90DQo+ID4+PiBiZWxvbmcgdG8gaWRlbnRpdHkgbWFwIGJlZm9yZSBfZW5kX2Jvb3Qu
IEJlY2F1c2Ugd2UgaGF2ZQ0KPiA+Pj4gbW92ZWQgX2VuZF9ib290IHRvIGhlYWRfbW11LlMuDQo+
ID4+DQo+ID4+IEkgZGlzbGlrZSB0aGlzIGFwcHJvYWNoIGJlY2F1c2UgeW91IGFyZSBleHBlY3Rp
bmcgdGhhdCBvbmx5IGhlYWRfbW11LlMNCj4gPj4gd2lsbCBiZSBwYXJ0IG9mIC50ZXh0LmlkbWFw
LiBJZiBpdCBpcyBub3QsIGV2ZXJ5dGhpbmcgY291bGQgYmxvdyB1cA0KPiBhZ2Fpbi4NCj4gPj4N
Cj4gPg0KPiA+IEkgYWdyZWUuDQo+ID4NCj4gPj4gVGhhdCBzYWlkLCBpZiB5b3UgbG9vayBhdCBz
dGFnaW5nLCB5b3Ugd2lsbCBub3RpY2UgdGhhdCBub3cgX2VuZF9ib290DQo+IGlzDQo+ID4+IGRl
ZmluZWQgaW4gdGhlIGxpbmtlciBzY3JpcHQgdG8gYXZvaWQgYW55IGlzc3VlLg0KPiA+Pg0KPiA+
DQo+ID4gU29ycnksIEkgYW0gbm90IHF1aXRlIGNsZWFyIGFib3V0IHRoaXMgY29tbWVudC4gVGhl
IF9lbmRfYm9vdCBvZg0KPiBvcmlnaW5hbA0KPiA+IHN0YWdpbmcgYnJhbmNoIGlzIGRlZmluZWQg
aW4gaGVhZC5TLiBBbmQgSSBhbSBub3QgcXVpdGUgc3VyZSBob3cgdGhpcw0KPiA+IF9lbmRfYm9v
dCBzb2x2ZSBtdWx0aXBsZSBmaWxlcyBjb250YWluIGlkbWFwIGNvZGUuDQo+IA0KPiBJZiB5b3Ug
bG9vayBhdCB0aGUgbGF0ZXN0IHN0YWdpbmcsIHRoZXJlIGlzIGEgY29tbWl0ICgyMjllYmQ1MTdi
OWQpIHRoYXQNCj4gbm93IGRlZmluZSBfZW5kX2Jvb3QgaW4gdGhlIGxpbmtlciBzY3JpcHQuDQo+
IA0KPiBUaGUgLnRleHQuaWRtYXAgc2VjdGlvbiBjYW4gYmUgYWRkZWQgYmVmb3JlIHRoZSBkZWZp
bml0aW9uIG9mIF9lbmRfYm9vdC4NCj4gDQoNCk9oLCBteSBicmFuY2ggd2FzIGEgbGl0dGxlIG9s
ZCwgSSBoYXZlIHNlZW4gdGhpcyBuZXcgZGVmaW5pdGlvbiBpbiB4ZW4ubGQuUw0KYWZ0ZXIgSSB1
cGRhdGUgdGhlIGJyYW5jaC4gSSB1bmRlcnN0YW5kIG5vdy4NCg0KPiA+DQo+ID4gQ2hlZXJzLA0K
PiA+IFdlaSBDaGVuDQo+ID4NCj4gPj4+IFRoYXQgbWVhbnMgYWxsIGNvZGUgaW4gaGVhZC5TDQo+
ID4+PiB3aWxsIGJlIGluY2x1ZGVkIGJlZm9yZSBfZW5kX2Jvb3QuIEluIHRoaXMgcGF0Y2gsIHdl
IGFsc28NCj4gPj4+IGFkZGVkIC50ZXh0IGZsYWcgaW4gdGhlIHBsYWNlIG9mIG9yaWdpbmFsIF9l
bmRfYm9vdCBpbiBoZWFkLlMuDQo+ID4+PiBBbGwgdGhlIGNvZGUgYWZ0ZXIgLnRleHQgaW4gaGVh
ZC5TIHdpbGwgbm90IGJlIGluY2x1ZGVkIGluDQo+ID4+PiBpZGVudGl0eSBtYXAgc2VjdGlvbi4N
Cj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4N
Cj4gPj4+IC0tLQ0KPiA+Pj4gdjEgLT4gdjI6DQo+ID4+PiAxLiBOZXcgcGF0Y2guDQo+ID4+PiAt
LS0NCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgICAgIHwgNiArKysrKysNCj4g
Pj4+ICAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkX21tdS5TIHwgMiArLQ0KPiA+Pj4gICAgeGVu
L2FyY2gvYXJtL3hlbi5sZHMuUyAgICAgICAgfCAxICsNCj4gPj4+ICAgIDMgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
DQo+ID4+PiBpbmRleCA1Y2ZhNDcyNzliLi43ODJiZDFmOTRjIDEwMDY0NA0KPiA+Pj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUw0KPiA+Pj4gQEAgLTQ2Niw2ICs0NjYsMTIgQEAgZmFpbDogICBQUklOVCgiLSBCb290
IGZhaWxlZCAtXHJcbiIpDQo+ID4+PiAgICAgICAgICAgIGIgICAgIDFiDQo+ID4+PiAgICBFTkRQ
Uk9DKGZhaWwpDQo+ID4+Pg0KPiA+Pj4gKy8qDQo+ID4+PiArICogRm9yIHRoZSBjb2RlIHRoYXQg
ZG8gbm90IG5lZWQgaW4gaW5kZW50aXR5IG1hcCBzZWN0aW9uLA0KPiA+Pj4gKyAqIHdlIHB1dCB0
aGVtIGJhY2sgdG8gbm9ybWFsIC50ZXh0IHNlY3Rpb24NCj4gPj4+ICsgKi8NCj4gPj4+ICsuc2Vj
dGlvbiAudGV4dCwgImF4IiwgJXByb2diaXRzDQo+ID4+PiArDQo+ID4+DQo+ID4+IEkgd291bGQg
YXJndWUgdGhhdCBwdXRzIHdhbnRzIHRvIGJlIHBhcnQgb2YgdGhlIGlkbWFwLg0KPiA+Pg0KPiA+
DQo+ID4gSSBhbSBvayB0byBtb3ZlIHB1dHMgdG8gaWRtYXAuIEJ1dCBmcm9tIHRoZSBvcmlnaW5h
bCBoZWFkLlMsIHB1dHMgaXMNCj4gPiBwbGFjZWQgYWZ0ZXIgX2VuZF9ib290LCBhbmQgZnJvbSB0
aGUgeGVuLmxkLlMsIHdlIGNhbiBzZWUgaWRtYXAgaXMNCj4gPiBhcmVhIGlzIHRoZSBzZWN0aW9u
IG9mICJfZW5kX2Jvb3QgLSBzdGFydCIuDQo+IA0KPiBUaGUgb3JpZ2luYWwgcG9zaXRpb24gb2Yg
X2VuZF9ib290IGlzIHdyb25nLiBJdCBkaWRuJ3QgdGFrZSBpbnRvIGFjY291bnQNCj4gdGhlIGxp
dGVyYWwgcG9vbCAodGhlcmUgYXJlIGF0IHRoZSBlbmQgb2YgdGhlIHVuaXQpLiBTbyB0aGV5IHdv
dWxkIGJlDQo+IHBhc3QgX2VuZF9ib290Lg0KPiANCg0KT2suDQoNCj4gPiBUaGUgcmVhc29uIG9m
IG1vdmluZyBwdXRzDQo+ID4gdG8gaWRtYXAgaXMgYmVjYXVzZSB3ZSdyZSB1c2luZyBpdCBpbiBp
ZG1hcD8NCj4gDQo+IEkgZ3Vlc3MgaXQgZGVwZW5kcyBvZiB3aGF0IGlkbWFwIHJlYWxseSBtZWFu
IGhlcmUuIElmIHlvdSBvbmx5IGludGVycHJldA0KPiBhcyB0aGUgTU1VIGlzIG9uIGFuZCBWQSA9
PSBQQS4gVGhlbiBub3QgeWV0IChJIHdhcyB0aGlua2luZyB0byBpbnRyb2R1Y2UNCj4gYSBmZXcg
Y2FsbHMpLg0KPiANCj4gSWYgeW91IGFsc28gaW5jbHVkZSB0aGUgTU1VIG9mZi4gVGhlbiB5ZXMu
DQo+IA0KPiBBbHNvLCBpbiB0aGUgY29udGV4dCBvZiBjYWNoZSBjb2xvcmluZywgd2Ugd2lsbCBu
ZWVkIHRvIGhhdmUgYQ0KPiB0cmFtcG9saW5lIGZvciBjYWNoZSBjb2xvcmluZy4gU28gaXQgd291
bGQgYmUgYmV0dGVyIHRvIGtlZXAgZXZlcnl0aGluZw0KPiBjbG9zZSB0b2dldGhlciBhcyBpdCBp
cyBlYXNpZXIgdG8gY29weS4NCj4gDQoNClVuZGVyc3RhbmQsIHRoYW5rcyENCg0KQ2hlZXJzLA0K
V2VpIENoZW4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

