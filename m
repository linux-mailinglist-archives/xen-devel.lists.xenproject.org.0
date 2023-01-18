Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF759671188
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 04:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480108.744319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHypg-0004MN-MS; Wed, 18 Jan 2023 03:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480108.744319; Wed, 18 Jan 2023 03:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHypg-0004JR-IL; Wed, 18 Jan 2023 03:09:48 +0000
Received: by outflank-mailman (input) for mailman id 480108;
 Wed, 18 Jan 2023 03:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHype-0004JL-PT
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 03:09:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef94687-96dd-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 04:09:45 +0100 (CET)
Received: from AS9PR06CA0739.eurprd06.prod.outlook.com (2603:10a6:20b:487::21)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 03:09:42 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::dd) by AS9PR06CA0739.outlook.office365.com
 (2603:10a6:20b:487::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 03:09:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 03:09:41 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Wed, 18 Jan 2023 03:09:41 +0000
Received: from 1ec4d9837329.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B951260B-0413-4127-84DD-B47C47A9C24A.1; 
 Wed, 18 Jan 2023 03:09:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ec4d9837329.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 03:09:35 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB6349.eurprd08.prod.outlook.com (2603:10a6:102:15b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 03:09:34 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 03:09:34 +0000
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
X-Inumbo-ID: 8ef94687-96dd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0HlQEg5nJRXk2o3xk6UWlabotBPaHScVkZ79IHQf4A=;
 b=sohOLjtjnFv/85Gx35WfMe08LelabOFqIh65RSmXNykWt3r9nKvNHiSGsWuefkX3w6G/t8yJWi85ZyFPHFAj+xEklbE4hiM6CTdv4yVc+bB4ECruKe/KOjNyrb57ZnX+iDyLYjQ/qWqsIle1wBvUN7LFHkVPCFsMgQlFDIjIBaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muyUrUyfAR3RL9JjDNJ1NZRKJNCt8nt7xDZS4p5FMxVqatmKV1oagwRz4QZoxT+jqvxjB8qlpEVYG2N7LqsKHHK+9QfvtkyDSoq8AeyYaiWROA2ZRwt1rcSiybERGl32ifE88dbvcf+FplNvmzGXegF50EN4tQYg+PhnRMWaeIFU+npUlqkGFdsQbIFEmSP9p01Km8HjurJfjM3y9f55Kk0TKTRbgH0Uhlf/BL+AO8kB/9iw/sL9eTm7gFlXYumEe7/iASwMXLP0s87LgRwb6Z36eK49/KWJfnfvb2xzEt3VCHezU7u9upMWJ1q6nEbFS+gq7MsMCoC9xnEtywg9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0HlQEg5nJRXk2o3xk6UWlabotBPaHScVkZ79IHQf4A=;
 b=UhqsXuUu8PEIzv7aYGCoO+v9gEUSZP7v6/4AzwjouzGdNCZu4Gl9m/ESFwK8d0b2D+pFoWCTVO00os0x27/HRqkBoIOLfx4IJfQVuNj8QTTwaEmv+qJe/zmLdV3nvsNf5sMhi7S6ze7lmGUdiO1pFSVEwTQZRexwTY7fbREOpdJgRcLiceJTCru/isaO1gsLr4qGPD6Jk3ttcwTotMDPwpgoE7wtX4AYUu8xS4CbG9nT19j7tBqqhXq9va8xP3IUYxmvmu5VzXQGLTIctidJBcQvMm81e3PMSUf5SrZmQBmveJ1NKUsfoEBizGy1j2i5nuaAIm6jMCg4n83r36klkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0HlQEg5nJRXk2o3xk6UWlabotBPaHScVkZ79IHQf4A=;
 b=sohOLjtjnFv/85Gx35WfMe08LelabOFqIh65RSmXNykWt3r9nKvNHiSGsWuefkX3w6G/t8yJWi85ZyFPHFAj+xEklbE4hiM6CTdv4yVc+bB4ECruKe/KOjNyrb57ZnX+iDyLYjQ/qWqsIle1wBvUN7LFHkVPCFsMgQlFDIjIBaI=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Topic: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Index: AQHZJxAYj73pNk7diEiR8Njo5KbmJ66jSxAAgAA5lAA=
Date: Wed, 18 Jan 2023 03:09:33 +0000
Message-ID:
 <PAXPR08MB742006643CF50E239EBC12139EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-6-Penny.Zheng@arm.com>
 <f78755d8-0b43-ebe4-4b2c-c88875347796@xen.org>
In-Reply-To: <f78755d8-0b43-ebe4-4b2c-c88875347796@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EE3738CC17AADA46A62E8B076CC6F2BD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PAXPR08MB6349:EE_|AM7EUR03FT036:EE_|PAXPR08MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 50af6e30-4e7a-4a96-1c31-08daf901713b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 l1aFFTHrKU8LHMbQ/UlZSHIFfYM9TDTqp+SGu3QulKNpylwIZmgQQHpwJ1/YyfxqG/o67VHBFzWmMZoNNNKi0w5naF+hBoboIZhZ5r6ks43dRoKnxQ3jNnj+B2448liBill88nDpVnZ4AprHbagLf02bz6smdyaHE9SzCqYLauX0xXZeObsHCh6cddjx7QmhO/maY9UKNp266MupyPutC2jnDsRn+0hLR0+gvQnN6GCmjWSgWrXA0M0DQ4rk0QwgEXBSB73a8AkD1FTPlBV/8y1Q0O/6N+nXRgfQbKlIQaY8G5rV8S4syGVtgClTrovqovQ8vuDm2npFbPhXhaJqxKWwrl+Uzf5Ra12CVkNDcia8Qx+0TtrTdi5qB3JC/1RnQjdlJoDoaWWr9XrTbMbCg0a84OMZVAkwiZ6fRrPDVwYrtnSmo3aLUUt/75/SVH5wl44aRf4v3x+30QSU6Y1WuttmdsC7m7ALrfQTrVMcoCo4pQycp6o/n84MWqQCO5sHfLzAxThu2aOzsmCJRfa4A7adAjGSaO/vhJqM9Gf325YWT9fFdkFgaONdV9ahvtBJJfmFYmwt+q7mLcXCb6ibc5d3qJlWPB64kOAA8s+FAGRizPlANfcWFtKZ35BHnr/gBsRjwQCO5F+aJXT11V2Dw/UeF32Q6snna99xT77JHZeGb5GocD0l8+oFDtdGeweVAaQpeONg7Xz1jpnze3P19KzVXMnOLfSa9zoxXEu8H8E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199015)(26005)(8676002)(76116006)(83380400001)(8936002)(66446008)(41300700001)(66556008)(66476007)(66946007)(64756008)(52536014)(38070700005)(4326008)(6506007)(316002)(5660300002)(33656002)(54906003)(2906002)(71200400001)(55016003)(86362001)(478600001)(966005)(7696005)(186003)(9686003)(110136005)(53546011)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7894406e-0d85-4902-21be-08daf9016cb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dxuPiZzOABEfSPY+AbRj82pNP1sKllPM4+KXtanW/oGiEpoT/8xFGcKH8HnI2+YDxha/o8xFDKKu3KWxD86Up7C6FfIZob4ofGfsEuoTHijpO1Hg4aZf3zXof+NcutwryhBO8tseO633whZFHMSXEa17/Nknzhnx3HxVpHkjFdzt/kIUNGEdmfgzO9rfliSRl4YqAanKUSpQSptEzCzicWag88AXNHCB67yI+QfwznCs4G6/jVLdaoju0RRDYMfanjEwb6wqU/jBBG+lIqeh/HiuGxHn2pMt/A/lxUo19rRPWvVqyvO1jV5KuqerRaO2+HgunR4Q/KsM1+563ZS8gufZiyZ4d4vMBoUwhKk+G/SBtCpKk/bW5OYCrccaN4W0Kxmo1CpVwSTSUCUdYkKoDasgQBGjFImYqpI9a0lgviDFT6dHrvzWVTUEMSe+QBNsfjsl1Qsx/Egqg4ix8kMdSRatO4cGJ4W/cqQB3qFppVdN+dKGr+DSLtfwg4Aqx3TI9Q+3T0/Absyanh+nJM+9gSFWpWvmdzVbYng/ABSmMmwOladEiV0ognlaSTpLZaLM9ncJvgzQecidK1y7DGGD+cN4Vj3AwMHqiHc7mIfYnt+wlJRSiovXd/hX0x3QWODSozghu6fd3lzRpRpiW91e4KJMrM4fICrvyOwVImxvDpfavlCIw2iEHQX6PdtLqGM+onWOsb+XJSx7v9Q8H5B17uscKBnXlnKWaqRbdihspbg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(186003)(9686003)(478600001)(86362001)(40460700003)(41300700001)(33656002)(336012)(55016003)(316002)(7696005)(110136005)(40480700001)(47076005)(70586007)(70206006)(26005)(54906003)(4326008)(966005)(8676002)(36860700001)(6506007)(2906002)(81166007)(356005)(53546011)(82740400003)(82310400005)(8936002)(5660300002)(52536014)(107886003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 03:09:41.5548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50af6e30-4e7a-4a96-1c31-08daf901713b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgNzozNw0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA1LzQwXSB4
ZW4vYXJtNjQ6IHByZXBhcmUgZm9yIG1vdmluZyBNTVUgcmVsYXRlZA0KPiBjb2RlIGZyb20gaGVh
ZC5TDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+IE9uIDEzLzAxLzIwMjMgMDU6MjgsIFBlbm55IFpo
ZW5nIHdyb3RlOg0KPiA+IEZyb206IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+DQo+
ID4gV2Ugd2FudCB0byByZXVzZSBoZWFkLlMgZm9yIE1QVSBzeXN0ZW1zLCBidXQgdGhlcmUgYXJl
IHNvbWUNCj4gPiBjb2RlIGltcGxlbWVudGVkIGZvciBNTVUgc3lzdGVtcyBvbmx5LiBXZSB3aWxs
IG1vdmUgc3VjaA0KPiA+IGNvZGUgdG8gYW5vdGhlciBNTVUgc3BlY2lmaWMgZmlsZS4gQnV0IGJl
Zm9yZSB0aGF0LCB3ZSB3aWxsDQo+ID4gZG8gc29tZSBwcmVwYXJhdGlvbnMgaW4gdGhpcyBwYXRj
aCB0byBtYWtlIHRoZW0gZWFzaWVyDQo+ID4gZm9yIHJldmlld2luZzoNCj4gDQo+IFdlbGwsIEkg
YWdyZWUgdGhhdC4uLg0KPiANCj4gPiAxLiBGaXggdGhlIGluZGVudGF0aW9ucyBvZiBjb2RlIGNv
bW1lbnRzLg0KPiANCj4gLi4uIGNoYW5naW5nIHRoZSBpbmRlbnRhdGlvbiBpcyBiZXR0ZXIgaGVy
ZS4gQnV0Li4uDQo+IA0KPiA+IDIuIEV4cG9ydCBzb21lIHN5bWJvbHMgdGhhdCB3aWxsIGJlIGFj
Y2Vzc2VkIG91dCBvZiBmaWxlDQo+ID4gICAgIHNjb3BlLg0KPiANCj4gLi4uIEkgaGF2ZSBubyBp
ZGVhIHdoaWNoIGZ1bmN0aW9ucyBhcmUgZ29pbmcgdG8gYmUgdXNlZCBpbiBhIHNlcGFyYXRlDQo+
IGZpbGUuIFNvIEkgdGhpbmsgdGhleSBzaG91bGQgYmVsb25nIHRvIHRoZSBwYXRjaCBtb3Zpbmcg
dGhlIGNvZGUuDQo+IA0KDQpPaywgSSB3aWxsIG1vdmUgdGhlc2UgY2hhbmdlcyB0byB0aGUgbW92
aW5nIGNvZGUgcGF0Y2hlcy4NCg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdl
aS5jaGVuQGFybS5jb20+DQo+IA0KPiBZb3VyIHNpZ25lZC1vZmYtYnkgaXMgbWlzc2luZy4NCj4g
DQo+ID4gLS0tDQo+ID4gdjEgLT4gdjI6DQo+ID4gMS4gTmV3IHBhdGNoLg0KPiA+IC0tLQ0KPiA+
ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDQwICsrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4gaW5kZXggOTNmOWIwYjlk
NS4uYjIyMTRiYzVlMyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
DQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiA+IEBAIC0xMzYsMjIgKzEz
NiwyMiBAQA0KPiA+ICAgICAgICAgICBhZGQgXHhiLCBceGIsIHgyMA0KPiA+ICAgLmVuZG0NCj4g
Pg0KPiA+IC0gICAgICAgIC5zZWN0aW9uIC50ZXh0LmhlYWRlciwgImF4IiwgJXByb2diaXRzDQo+
ID4gLSAgICAgICAgLyouYWFyY2g2NCovDQo+ID4gKy5zZWN0aW9uIC50ZXh0LmhlYWRlciwgImF4
IiwgJXByb2diaXRzDQo+ID4gKy8qLmFhcmNoNjQqLw0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgbm90
IG1lbnRpb25lZC4NCj4gDQoNCkkgd2lsbCBhZGQgdGhlIGRlc2NyaXB0aW9uIGluIGNvbW1pdCBt
ZXNzYWdlLg0KDQo+ID4NCj4gPiAtICAgICAgICAvKg0KPiA+IC0gICAgICAgICAqIEtlcm5lbCBz
dGFydHVwIGVudHJ5IHBvaW50Lg0KPiA+IC0gICAgICAgICAqIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiA+IC0gICAgICAgICAqDQo+ID4gLSAgICAgICAgICogVGhlIHJlcXVpcmVtZW50
cyBhcmU6DQo+ID4gLSAgICAgICAgICogICBNTVUgPSBvZmYsIEQtY2FjaGUgPSBvZmYsIEktY2Fj
aGUgPSBvbiBvciBvZmYsDQo+ID4gLSAgICAgICAgICogICB4MCA9IHBoeXNpY2FsIGFkZHJlc3Mg
dG8gdGhlIEZEVCBibG9iLg0KPiA+IC0gICAgICAgICAqDQo+ID4gLSAgICAgICAgICogVGhpcyBt
dXN0IGJlIHRoZSB2ZXJ5IGZpcnN0IGFkZHJlc3MgaW4gdGhlIGxvYWRlZCBpbWFnZS4NCj4gPiAt
ICAgICAgICAgKiBJdCBzaG91bGQgYmUgbGlua2VkIGF0IFhFTl9WSVJUX1NUQVJULCBhbmQgbG9h
ZGVkIGF0IGFueQ0KPiA+IC0gICAgICAgICAqIDRLLWFsaWduZWQgYWRkcmVzcy4gIEFsbCBvZiB0
ZXh0K2RhdGErYnNzIG11c3QgZml0IGluIDJNQiwNCj4gPiAtICAgICAgICAgKiBvciB0aGUgaW5p
dGlhbCBwYWdldGFibGUgY29kZSBiZWxvdyB3aWxsIG5lZWQgYWRqdXN0bWVudC4NCj4gPiAtICAg
ICAgICAgKi8NCj4gPiArLyoNCj4gPiArICogS2VybmVsIHN0YXJ0dXAgZW50cnkgcG9pbnQuDQo+
ID4gKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsgKg0KPiA+ICsgKiBUaGUg
cmVxdWlyZW1lbnRzIGFyZToNCj4gPiArICogICBNTVUgPSBvZmYsIEQtY2FjaGUgPSBvZmYsIEkt
Y2FjaGUgPSBvbiBvciBvZmYsDQo+ID4gKyAqICAgeDAgPSBwaHlzaWNhbCBhZGRyZXNzIHRvIHRo
ZSBGRFQgYmxvYi4NCj4gPiArICoNCj4gPiArICogVGhpcyBtdXN0IGJlIHRoZSB2ZXJ5IGZpcnN0
IGFkZHJlc3MgaW4gdGhlIGxvYWRlZCBpbWFnZS4NCj4gPiArICogSXQgc2hvdWxkIGJlIGxpbmtl
ZCBhdCBYRU5fVklSVF9TVEFSVCwgYW5kIGxvYWRlZCBhdCBhbnkNCj4gPiArICogNEstYWxpZ25l
ZCBhZGRyZXNzLiAgQWxsIG9mIHRleHQrZGF0YStic3MgbXVzdCBmaXQgaW4gMk1CLA0KPiA+ICsg
KiBvciB0aGUgaW5pdGlhbCBwYWdldGFibGUgY29kZSBiZWxvdyB3aWxsIG5lZWQgYWRqdXN0bWVu
dC4NCj4gPiArICovDQo+ID4NCj4gPiAgIEdMT0JBTChzdGFydCkNCj4gPiAgICAgICAgICAgLyoN
Cj4gPiBAQCAtNTg2LDcgKzU4Niw3IEBAIEVORFBST0MoY3B1X2luaXQpDQo+ID4gICAgKg0KPiA+
ICAgICogQ2xvYmJlcnMgeDAgLSB4NA0KPiA+ICAgICovDQo+ID4gLWNyZWF0ZV9wYWdlX3RhYmxl
czoNCj4gPiArRU5UUlkoY3JlYXRlX3BhZ2VfdGFibGVzKQ0KPiANCj4gSSBhbSBub3Qgc3VyZSBh
Ym91dCBrZWVwaW5nIHRoaXMgbmFtZS4gTm93IHdlIGhhdmUgY3JlYXRlX3BhZ2VfdGFibGVzKCkN
Cj4gYW5kIGFyY2hfc2V0dXBfcGFnZV90YWJsZXMoKS4NCj4gDQo+IEkgd291bGQgY29uc2lkZSB0
byBuYW1lIGl0IGNyZWF0ZV9ib290X3BhZ2VfdGFibGVzKCkuDQo+IA0KDQpEbyB5b3UgbmVlZCBt
ZSB0byByZW5hbWUgaXQgaW4gdGhpcyBwYXRjaD8NCg0KPiA+ICAgICAgICAgICAvKiBQcmVwYXJl
IHRoZSBwYWdlLXRhYmxlcyBmb3IgbWFwcGluZyBYZW4gKi8NCj4gPiAgICAgICAgICAgbGRyICAg
eDAsID1YRU5fVklSVF9TVEFSVA0KPiA+ICAgICAgICAgICBjcmVhdGVfdGFibGVfZW50cnkgYm9v
dF9wZ3RhYmxlLCBib290X2ZpcnN0LCB4MCwgMCwgeDEsIHgyLCB4Mw0KPiA+IEBAIC02ODAsNyAr
NjgwLDcgQEAgRU5EUFJPQyhjcmVhdGVfcGFnZV90YWJsZXMpDQo+ID4gICAgKg0KPiA+ICAgICog
Q2xvYmJlcnMgeDAgLSB4Mw0KPiA+ICAgICovDQo+ID4gLWVuYWJsZV9tbXU6DQo+ID4gK0VOVFJZ
KGVuYWJsZV9tbXUpDQo+ID4gICAgICAgICAgIFBSSU5UKCItIFR1cm5pbmcgb24gcGFnaW5nIC1c
clxuIikNCj4gPg0KPiA+ICAgICAgICAgICAvKg0KPiA+IEBAIC03MTQsNyArNzE0LDcgQEAgRU5E
UFJPQyhlbmFibGVfbW11KQ0KPiA+ICAgICoNCj4gPiAgICAqIENsb2JiZXJzIHgwIC0geDENCj4g
PiAgICAqLw0KPiA+IC1yZW1vdmVfaWRlbnRpdHlfbWFwcGluZzoNCj4gPiArRU5UUlkocmVtb3Zl
X2lkZW50aXR5X21hcHBpbmcpDQo+IA0KPiBQYXRjaCAjMTQgc2hvdWxkIGJlIGJlZm9yZSB0aGlz
IHBhdGNoLiBTbyB5b3UgZG9uJ3QgaGF2ZSB0byBleHBvcnQNCj4gcmVtb3ZlX2lkZW50aXR5X21h
cHBpbmcgdGVtcG9yYXJpbHkuDQo+IA0KPiBUaGlzIHdpbGwgYWxzbyBhdm9pZCAodHJhbnNpZW50
KSBuYW1pbmcgY29uZnVzaW5nIHdpdGggbXkgd29yayAoc2VlIFsxXSkuDQo+IA0KDQpPaywgd2Ug
d2lsbCBkbyBpdC4NCg0KPiA+ICAgICAgICAgICAvKg0KPiA+ICAgICAgICAgICAgKiBGaW5kIHRo
ZSB6ZXJvZXRoIHNsb3QgdXNlZC4gUmVtb3ZlIHRoZSBlbnRyeSBmcm9tIHplcm9ldGgNCj4gPiAg
ICAgICAgICAgICogdGFibGUgaWYgdGhlIHNsb3QgaXMgbm90IFhFTl9aRVJPRVRIX1NMT1QuDQo+
ID4gQEAgLTc3NSw3ICs3NzUsNyBAQCBFTkRQUk9DKHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKQ0K
PiA+ICAgICoNCj4gPiAgICAqIENsb2JiZXJzIHgwIC0geDMNCj4gPiAgICAqLw0KPiA+IC1zZXR1
cF9maXhtYXA6DQo+ID4gK0VOVFJZKHNldHVwX2ZpeG1hcCkNCj4gPiAgICNpZmRlZiBDT05GSUdf
RUFSTFlfUFJJTlRLDQo+ID4gICAgICAgICAgIC8qIEFkZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFi
bGUgKi8NCj4gPiAgICAgICAgICAgbGRyICAgeDAsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVT
Uw0KPiA+IEBAIC04NzEsNyArODcxLDcgQEAgRU5EUFJPQyhpbml0X3VhcnQpDQo+ID4gICAgKiB4
MDogTnVsLXRlcm1pbmF0ZWQgc3RyaW5nIHRvIHByaW50Lg0KPiA+ICAgICogeDIzOiBFYXJseSBV
QVJUIGJhc2UgYWRkcmVzcw0KPiA+ICAgICogQ2xvYmJlcnMgeDAteDEgKi8NCj4gPiAtcHV0czoN
Cj4gPiArRU5UUlkocHV0cykNCj4gDQo+IFRoaXMgbmFtZSBpcyBhIGJpdCB0b28gZ2VuZXJpYyB0
byBiZSBnbG9iYWxseSBleHBvcnRlZC4gSXQgaXMgYWxzbyBub3cNCj4gcXVpdGUgY29uZnVzaW5n
IGJlY2F1c2Ugd2UgaGF2ZSAiZWFybHlfcHV0cyIgYW5kICJwdXRzIi4NCj4gDQo+IEkgd291bGQg
Y29uc2lkZXIgdG8gbmFtZSBpdCBhc21fcHV0cygpLiBJdCBpcyBzdGlsbCBub3QgZ3JlYXQgYnV0
DQo+IGhvcGVmdWxseSBpdCB3b3VsZCBnaXZlIGEgaGludCB0aGF0IHNob3VsZCBiZSBjYWxsIGZy
b20gYXNzZW1ibHkgY29kZS4NCj4gDQoNClllcywgSSBoYWQgdGhlIHNhbWUgY29uY2Vybi4gSSB3
aWxsIHJlbmFtZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4g
PiAgICAgICAgICAgZWFybHlfdWFydF9yZWFkeSB4MjMsIDENCj4gPiAgICAgICAgICAgbGRyYiAg
dzEsIFt4MF0sICMxICAgICAgICAgICAvKiBMb2FkIG5leHQgY2hhciAqLw0KPiA+ICAgICAgICAg
ICBjYnogICB3MSwgMWYgICAgICAgICAgICAgICAgIC8qIEV4aXQgb24gbnVsICovDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMTEzMTAx
MTM2LjQ3OS0xMy1qdWxpZW5AeGVuLm9yZy8NCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

