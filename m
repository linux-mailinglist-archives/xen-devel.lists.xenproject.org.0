Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE507771B7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 09:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581862.911304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0Iu-0002pk-6d; Thu, 10 Aug 2023 07:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581862.911304; Thu, 10 Aug 2023 07:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0Iu-0002mT-3m; Thu, 10 Aug 2023 07:41:56 +0000
Received: by outflank-mailman (input) for mailman id 581862;
 Thu, 10 Aug 2023 07:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCzd=D3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qU0Iq-0002mN-RZ
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 07:41:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5db7ab9f-3751-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 09:41:50 +0200 (CEST)
Received: from DB3PR08CA0032.eurprd08.prod.outlook.com (2603:10a6:8::45) by
 DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Thu, 10 Aug 2023 07:41:46 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::35) by DB3PR08CA0032.outlook.office365.com
 (2603:10a6:8::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:41:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 07:41:45 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Thu, 10 Aug 2023 07:41:45 +0000
Received: from e508edc3f625.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7030C5B4-3F85-4FDD-A2D2-D617AF6ABE89.1; 
 Thu, 10 Aug 2023 07:41:39 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e508edc3f625.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 07:41:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6354.eurprd08.prod.outlook.com (2603:10a6:20b:367::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:41:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 07:41:37 +0000
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
X-Inumbo-ID: 5db7ab9f-3751-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSmEdoGbXnWJoTpB5+MVGMuOF+COnyl27ANio2UNZn0=;
 b=y9lBCE2oEE/AMdp/axTcVIMjcroY9MG8OsyzJ/ooATxa6vBsVp0YokE3DTzsk5IVYbOuhdbKuf5ZJAYR0wMZeFqViIShlaaVkYA5so4R+9Zq9jQNwrYztHZlG/ywzpUavb9UDSMh1nQbKg8tTx6H1qo2zqV5ZVAbKVNmWc//v/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e61c7618f1ce189a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVWib2Zwdwu/3jC8EzdAw4b5Jdg+kE94A3w0VIPeS2P1x0pFmuUHKzKfHDCx5C8hM8xVB4qj7aqYCaXA6zLqsDGhKi37cZTyPiqKXhbDq0U35t/MeoiMklgRpEsIl1/Hsvn5PVZNBmwxrYoF2kSMjQLeLqpnuPoZmt6oVOXT+NF7ZEU7RAD4EzBKqCQ7tlnXrzwGOShWm+vQU2CDC1IzCsqc1x85TssM/E+rkOpTiiWtOtuhKTiQKyf1a58y/AymvM0vLOLUHxWJx1pPt9Iei1+WHQDB7yiy2BlyV0yqA3cl8l04iQ2ZoDxiKFFp5Hp07JhJ/MX03V7UbYF0aHZh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSmEdoGbXnWJoTpB5+MVGMuOF+COnyl27ANio2UNZn0=;
 b=isEH6kaHxp4fywSBXuONQufM7E5dibgbkylAaldMNx/s6sVDB5e8VJnXTGmqX+t5stJoggkm4tEQbb3hW90j/Kgn9iEhMFqln+1IORneaPw7pkG2DGOAWoRKekbjND6vTQJncVbpUgAeyKEFJb9+GXAiL0phdVUO3rwwo76XcWgFhy1yTSRXD1/3ZhAPNQUicdMbTN8sYTCCRHJnPfP0iBLRNKqbJzXxhARiBY341nMZW8xV66fsYT0MIF7SSKUS002BS2x2JiKJHhQFdaKWRYQJLMVXMyl8yoEvskcybjVsCQvvpnyIj7mhR4T1huYczmA9TEHrFlK0CvNHC+l/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSmEdoGbXnWJoTpB5+MVGMuOF+COnyl27ANio2UNZn0=;
 b=y9lBCE2oEE/AMdp/axTcVIMjcroY9MG8OsyzJ/ooATxa6vBsVp0YokE3DTzsk5IVYbOuhdbKuf5ZJAYR0wMZeFqViIShlaaVkYA5so4R+9Zq9jQNwrYztHZlG/ywzpUavb9UDSMh1nQbKg8tTx6H1qo2zqV5ZVAbKVNmWc//v/c=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v4 05/13] xen/arm: Move MMU related definitions from
 config.h to mmu/layout.h
Thread-Topic: [PATCH v4 05/13] xen/arm: Move MMU related definitions from
 config.h to mmu/layout.h
Thread-Index: AQHZxCqMQIVv2nNAnUKuY4URBAgkmK/h7woAgAFEwoA=
Date: Thu, 10 Aug 2023 07:41:36 +0000
Message-ID: <228AEB4A-273E-404B-94E2-932FD8BD54B5@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-6-Henry.Wang@arm.com>
 <83022ef2-dfd1-438c-b8e8-2f1bf0866918@xen.org>
In-Reply-To: <83022ef2-dfd1-438c-b8e8-2f1bf0866918@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6354:EE_|DBAEUR03FT043:EE_|DB9PR08MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa319ed-bca4-442c-0202-08db99753f94
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HdNuQ5r/ZoDEFmCqgsQ1qjLEs+6m4279TEAxFPBaTdFXZW7fga7VVYioW/UhEPETZtI0oqjbzepFAWEAE/5ycswgDlPd827z520FVryEuYpCR+i1CpSXAx9GvmJ6fU/m3opyaK7Bf8+Ie0fzPT7jsXWBavE0mi4cELVHqPJoy8Iu4pWK+SCJLbNsgDkB0Yylz0NoOZbfjUFUYSaPSEsYUCtGkQasC6tOFxbbmwSz3Mx/oyJgZjorv2gAMRBag6GvNyEfAKNXr2sVRpJvfX8awgB+CXhr+q+sJBHaN01hizp8boh6G7Wk/EPMKAa8zwlFWz0mrR+9EbAaFpWzrdLAOZ0f/xZrogk4dy5n1yv9QEKoqQN/ROFSsCgLS6IWmoQthIetVDOcagS+dod803OcctEF/KE7yJgWzEl9nmdKNhrjJ1L3uZPBuSSeaMneDLzjE00ayfIXpSnWHVQRXgBvMeBdzI4VC4TiByDoRnzJf3GWEI/jYEcZie0Sr1ZwwZNIjULepPLhI7/8KP+9g5A0E3WSwHlHRXCkIb+lNuBGYweiuFG+LKLT8VUKv/wuW7ObdsICzJOxa7Ov9kBVRRLg2L0a91TNSxk467FHtCJeSEJ6aYLmc5pJ5Ax5WyD9GivlskxshNfCFBlf1Q4t6+vwkQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(186006)(1800799006)(451199021)(4326008)(6486002)(86362001)(478600001)(36756003)(83380400001)(33656002)(54906003)(38100700002)(2906002)(76116006)(91956017)(66946007)(6916009)(66556008)(66476007)(2616005)(64756008)(66446008)(6512007)(122000001)(26005)(41300700001)(316002)(6506007)(53546011)(5660300002)(71200400001)(8676002)(38070700005)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <443661EA238D3E46B75F33B89EC8DB98@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6354
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b493baf8-7055-41a5-af60-08db99753a22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GuNHlRx3lFkeKX25/tR6sTPW6IwU/bjIna0OgxEVrBbkfv+UI3BJIAfyv1GEa/3yS12oRNLCxbolDTce4Q29PakXxX9p1SuCmCdkcpOFkO5xhJpZ+3ZaRNcME652OMUviXuc4zvaz1ObT5biIvLQMSsHIp+letggmHXlwgbUWlA6bSr/YoatS/O4Yykd1R08uzTxDiMPe4tDSeLekFI7/lXDzkxQzOCOFoltWx9UsGi5eVT+sy80GNsrlhnBYwTqoEBtYkOCboM7N6A4ytWWkHYqHUqEGZfRCCCbysSB4iZ2YlB/UBz6t92cRuUBaDtLTg+lWRHLMoiSo0u7rdQiLcxSezNc1bKHPFWkbBU1rvlp9qHIUpdAWrd2sJJW/iQ3KnKccwei+7hINctTNwSLYELQGYgrzpMjnDADXxmZy5KU4dM8WKEpw/wdVxeSkk+N6FoeTHk6lYRA3e3sJV7dL3x1DkWex0MOYib9jqrMtPUsCJgWh71A1D7SGlb59ONxBxHhZPm68hs10sUFBerJIJOzpjmpGmgcj3v77sQQwONqEbEvmEyobEfX6HTgiwhFZlnrMKQAZzQ1vFhSO+TEV7pt/0smVBjFwBY5EQfYnORsXCj8RS1CPTCbqtVg7FD953skvAjF5qIec2dT950xV68pzBJCFllFtDKsbRebkQuZzoBJt7xr4MfPVRTfeYk//tGUxCkxEbmP3YgoDU1Eaw0FKQ35eSM2bLRntHqbbRWSdLtflde1ugaNiytY0Qxq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(186006)(82310400008)(1800799006)(451199021)(40470700004)(46966006)(36840700001)(53546011)(6506007)(40460700003)(26005)(82740400003)(83380400001)(2906002)(36756003)(336012)(356005)(81166007)(40480700001)(54906003)(2616005)(36860700001)(6486002)(5660300002)(316002)(6512007)(478600001)(33656002)(6862004)(41300700001)(8676002)(8936002)(86362001)(4326008)(70586007)(70206006)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:41:45.9788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa319ed-bca4-442c-0202-08db99753f94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyA5LCAyMDIzLCBhdCAyMDoxOSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IE9uIDAxLzA4LzIw
MjMgMDQ6NDQsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBGcm9tOiBXZWkgQ2hlbiA8d2VpLmNoZW5A
YXJtLmNvbT4NCj4+IFhlbiBkZWZpbmVzIHNvbWUgZ2xvYmFsIGNvbmZpZ3VyYXRpb24gbWFjcm9z
IGZvciBBcm0gaW4gY29uZmlnLmguDQo+PiBIb3dldmVyIHRoZXJlIGFyZSBzb21lIGFkZHJlc3Mg
bGF5b3V0IHJlbGF0ZWQgZGVmaW5pdGlvbnMgdGhhdCBhcmUNCj4+IGRlZmluZWQgZm9yIE1NVSBz
eXN0ZW1zIG9ubHksIGFuZCB0aGVzZSBkZWZpbml0aW9ucyBjb3VsZCBub3QgYmUNCj4+IHVzZWQg
YnkgTVBVIHN5c3RlbXMuIEFkZGluZyBpZmRlZnMgd2l0aCBDT05GSUdfSEFTX01QVSB0byBnYXRl
IHRoZXNlDQo+IA0KPiBZb3UgaGF2ZW4ndCB5ZXQgaW50cm9kdWNlZCBIQVNfTVBVLiBTbyBJIHdv
dWxkIHN1Z2dlc3QgdG8gd3JpdGU6ICdBZGRpbmcgaWZkZWZzIHRvIGRpZmZlcmVudGlhdGUgdGhl
IE1QVSBmcm9tIE1NVSBsYXlvdXQgd2lsbCByZXN1bHQgaW4gYSAuLi4nLg0KPiANCj4+IGRlZmlu
aXRpb25zIHdpbGwgcmVzdWx0IGluIGEgbWVzc3kgYW5kIGhhcmQtdG8tcmVhZC9tYWludGFpbiBj
b2RlLg0KPj4gU28gbW92ZSBNTVUgcmVsYXRlZCBkZWZpbml0aW9ucyB0byBhIG5ldyBmaWxlLCBp
LmUuIG1tdS9sYXlvdXQuaCB0bw0KPj4gYXZvaWQgc3ByZWFkaW5nICIjaWZkZWYiIGV2ZXJ5d2hl
cmUuDQo+IA0KPiBBRkFJQ1QsIHlvdSBhcmUgbW92aW5nIGFsbCBtZW1vcnkgbGF5b3V0IGRlZmlu
aXRpb24gaW4gYSBzZXBhcmF0ZSBmaWxlLiBTbyBJIHdvdWxkIHNheSBpdCBleHBsaWNpdGVseSBy
YXRoZXIgdGhhbiB1c2luZyAiTU1VIHJlbGF0ZWQgZGVmaW5pdGlvbnMiLg0KPiANCj4+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPj4gU2lnbmVkLW9mZi1ieTog
UGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIZW5y
eSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBXaXRoIHRoZSBjb21tZW50cyBhZGRy
ZXNzZWQ6DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCg0KVGhhbmtzLCBJ4oCZdmUgdGFrZW4gdGhpcyB0YWcgd2l0aCBhYm92ZSB0d28gY29tbWVu
dHMgZml4ZWQuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

