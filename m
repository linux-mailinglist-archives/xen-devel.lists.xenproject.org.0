Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE246805F3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 07:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486572.753940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMNbE-0001CL-6F; Mon, 30 Jan 2023 06:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486572.753940; Mon, 30 Jan 2023 06:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMNbE-00019s-2S; Mon, 30 Jan 2023 06:25:04 +0000
Received: by outflank-mailman (input) for mailman id 486572;
 Mon, 30 Jan 2023 06:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jcy=53=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pMNbD-00019m-9a
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 06:25:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d32463c1-a066-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 07:25:01 +0100 (CET)
Received: from DU2PR04CA0239.eurprd04.prod.outlook.com (2603:10a6:10:2b1::34)
 by PAWPR08MB9994.eurprd08.prod.outlook.com (2603:10a6:102:35f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Mon, 30 Jan
 2023 06:24:58 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::78) by DU2PR04CA0239.outlook.office365.com
 (2603:10a6:10:2b1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 06:24:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Mon, 30 Jan 2023 06:24:58 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Mon, 30 Jan 2023 06:24:58 +0000
Received: from 111d9c8eb965.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5972BF2-E1C1-4352-9F40-1231715CE2D3.1; 
 Mon, 30 Jan 2023 06:24:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 111d9c8eb965.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Jan 2023 06:24:51 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DB9PR08MB8388.eurprd08.prod.outlook.com (2603:10a6:10:3d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Mon, 30 Jan
 2023 06:24:49 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 06:24:48 +0000
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
X-Inumbo-ID: d32463c1-a066-11ed-9ec0-891035b88211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owjUSjlT5aFyqV0noqTlySyN9fiC201po4t+nWU/EMA=;
 b=D0sFZsBL3K3EAl3in5iCLXLsMxlJYd4SJgFIynu3626se4d8supQAyl64f2FGgMNmMCU4w2lIJCAHup1amr5o6d7O68CjuKXsNfRPjF2Ol8ndK/a+waCgR3LwYHzspj1xZDLL6x5NPTfn4kft3VGCstBAlkWhE9TTDM+zqki604=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQTKUbBn9wV6jlfZ1pMjJtQlwKhrJip7uLirqPPt2t4fzLli0K33GXfnswdt/fSDj2hGNX1J+xl3809YCEUF7DXpDhkha64IZCBOBLhtLlKCPbwJC5zKR3H+H/p6bFe4VeSesqpHrekBlspcYyLrOllLk0/KAULiIEN90xnsCAoUkGgZU9ocrB61AXAXvDOA6pVF5ZWKT836A7oWfMurbymi7zfh7LQQ2hquOqCBBJ8URSSi7t5HUmk64/XdomVV4S58itktoaoip+oJ4lFIx0S0qiE2Q9frkx0J6yDcKIo3eaZe2+RQyBGiXQllJA1ywEcimNjW+fd2DFegTJPmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owjUSjlT5aFyqV0noqTlySyN9fiC201po4t+nWU/EMA=;
 b=b1nxX4+hJ6gYc65K7yda4acvfAFuuOlB3KOKx4AGTopZ8SL6uSr3qs6nG30BOPGbpv2yPuxCuGaLSK8n0FlvRSguKWSha2RFE+HzEMBXzllU5dnsfniqmnamYe4gEHUutlfgKKg6GJOk8invAxL4w+BRLyavAVlbJcqdlyClrb3gg1FUY+voQdH3Jpk5WhhMzN831M5oeEAJgpRcOwdwaaPEQ37Td2GKaeryX/SWzNX3G41DabTDmblzyWK/LIArXK95v5jRddgk0s+cpB5MCFm7adqHHUTB326pQh64xfDpe/rYXOZZ6TWRoZPzWY1ykuq9OrgEOY1yfLkaIa1thw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owjUSjlT5aFyqV0noqTlySyN9fiC201po4t+nWU/EMA=;
 b=D0sFZsBL3K3EAl3in5iCLXLsMxlJYd4SJgFIynu3626se4d8supQAyl64f2FGgMNmMCU4w2lIJCAHup1amr5o6d7O68CjuKXsNfRPjF2Ol8ndK/a+waCgR3LwYHzspj1xZDLL6x5NPTfn4kft3VGCstBAlkWhE9TTDM+zqki604=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Thread-Topic: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Thread-Index: AQHZJxAoM+nWeUC5lUC+09eIkdu2V66uAIMAgAb9FDCAAB73gIABdWjw
Date: Mon, 30 Jan 2023 06:24:48 +0000
Message-ID:
 <AM0PR08MB453026B268BA9FBEEE970090F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
 <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
 <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <33bddc11-ae1e-b467-32d7-647748d1c627@xen.org>
In-Reply-To: <33bddc11-ae1e-b467-32d7-647748d1c627@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0719802EBC829F4D8F55FEAA89EA02F0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DB9PR08MB8388:EE_|DBAEUR03FT044:EE_|PAWPR08MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: be21ce6c-2ce8-4d87-422f-08db028ab5dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5+XVcmx2yl4ET3f3DMsVnAWHv4fWA9qs5YOl5vFKekhnZK8+oUqYL/+7KAPdXWxaEefwTb3ozG63mXA2dcO5yu3bhWmj4Gti+UmHnpZE513j/B4vJs9ZQ0rMMtbF1lTdLU7vT0tWVVaqz+5LAwMqqJAXrYQRayV6SIdGTZzxfPC8YkmNNTQlE/bxtlbboq5DNIDMUdxdf+83oYqXt9jZwJSlDqKGZIb3Cla3tBVXEg0+ATNh9dZMA02kl3OhWj9j8o8P79RrEAwXhbxvR5xlQAqkvVfGRf8UkKD8S9kZ2wU7748Thqm5yPMM382WfBpNDVw5SV4mquefzbEdsge4sOVKZl4hm0IufMrIxgNH9BqHaC2u4y6KZtasaFD5ujLvvwO0v9EACgJf5xKVthNmUm1/yQv2Sftjh35idHnITvk3nfzU5GvOCOUN7VywL0KqwdkadcyMQ86XrBbrCZsKrXmVezzYfPOS3BXlE/UHQA03bQes2KsiVSu1bj6nUD7IkDVYIqLA8A8/CUXvzR9e8KB9JWDo4h90TTYkNAOLmBPtoBY5GjaRDcp+w78eDNjeNu5PTxzmDIxs1Ssoj1DZxpldmPosPD1FmcNGW2wga/eDuk5kiG9QkrTg/ReIA6joq0gfu06cU12ur9XfaIOOndVPArCEcH+9cNWGG+rD6cGbNv0D4DTH6d0NOBLiQrIhy2wDEOtoItHFod3xiSoWb9UrMqEtSpk7O08Qeq2LZc4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199018)(76116006)(66946007)(8676002)(4326008)(52536014)(8936002)(38100700002)(316002)(38070700005)(53546011)(6506007)(5660300002)(110136005)(55016003)(26005)(54906003)(33656002)(186003)(9686003)(66476007)(64756008)(41300700001)(66556008)(66446008)(122000001)(71200400001)(7696005)(83380400001)(478600001)(86362001)(2906002)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8388
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3288efca-7028-48a6-a82d-08db028aaff3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AWJ9h6ve7SxYM/0wZgSQca8oe0pT0e9wBoQMgxhEfe8yiTRu0Qtfydw03jDhjqDNbhqUqVIR8/AF23wrVQX44Cz5h/ICCLl8ZAQ43XrFT/m824pPmYlaQoGmWKa18cqGTFDrjv8HBTCz7oYr99fcxLFPW8y8rEhsC75x+hx9lOBDTJOoiD9cTjJotge9jylNnxv4Qptj+dPhq6ww098hO5BkPaByaBA3jD5Teihi2Nruj1Xnt+dKNQBIGFOPYomAQWOHUd9hPeguuQ7UP2Ftbx1wFknMS/mPCW3nnI9kTOkNhwEcRJX518DKdMYyyv+kaBaqEX/Mu3iEJ+10xtKd0R8S2A0w83t3RilweAxsFVvUOiBnoPiNx62+34drB/Z8+RhZqo+UBQT7ghP9/L23RTp/lB8AMcIELeKxh5rOU5ft0CJslVl7ZUagV0VTkhoEas2t836om2gWUakDssr3SoZ57L7RSYOgVq11q9xpdCVObUA+ayRlGGr6T0+CVjfCdgC1RgyOaXtnmkWwnFR3RWvcrgns59WaaH/J0RQ4cEgvn+PkhOU6Nk0oAfEsfJdUvxjqA+234CCHcOgNBtyFWuNd7hMK8/v+bgXxa0FxANxlcDpijXdgA7NycB1jwHHdio/vcXxXbb/ziQiZWCfMZdQpPYN7u6HCbRsOLF3tamLDLow2hPFYtE784VECbiLSBMXZbQU2tss6xnDBPaj6fhcNYc04KWjnVHvJbnVmeVI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(82310400005)(8936002)(40460700003)(82740400003)(52536014)(6506007)(53546011)(54906003)(81166007)(33656002)(40480700001)(356005)(107886003)(9686003)(55016003)(26005)(86362001)(478600001)(2906002)(7696005)(186003)(316002)(110136005)(5660300002)(83380400001)(41300700001)(70586007)(8676002)(4326008)(70206006)(336012)(36860700001)(47076005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 06:24:58.2754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be21ce6c-2ce8-4d87-422f-08db028ab5dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9994

SGksIEp1bGllbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgSmFudWFyeSAyOSwgMjAy
MyAzOjQzIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMTMvNDBdIHhlbi9tcHU6IGludHJvZHVjZSB1bmlmaWVkIGZ1bmN0aW9uDQo+IHNldHVwX2Vh
cmx5X3VhcnQgdG8gbWFwIGVhcmx5IFVBUlQNCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMjkv
MDEvMjAyMyAwNjoxNywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+
IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNSwgMjAyMyAzOjA5IEFNDQo+ID4+IFRvOiBQZW5u
eSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gPj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pDQo+ID4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cw0KPiA+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4g
Pj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDEzLzQwXSB4ZW4vbXB1OiBpbnRyb2R1Y2UgdW5pZmllZCBmdW5jdGlvbg0KPiA+PiBzZXR1
cF9lYXJseV91YXJ0IHRvIG1hcCBlYXJseSBVQVJUDQo+ID4+DQo+ID4+IEhpIFBlbnksDQo+ID4N
Cj4gPiBIaSBKdWxpZW4sDQo+ID4NCj4gPj4NCj4gPj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBJbiBNTVUgc3lzdGVtLCB3ZSBtYXAgdGhlIFVBUlQgaW4g
dGhlIGZpeG1hcCAod2hlbiBlYXJseXByaW50ayBpcw0KPiB1c2VkKS4NCj4gPj4+IEhvd2V2ZXIg
aW4gTVBVIHN5c3RlbSwgd2UgbWFwIHRoZSBVQVJUIHdpdGggYSB0cmFuc2llbnQgTVBVDQo+IG1l
bW9yeQ0KPiA+Pj4gcmVnaW9uLg0KPiA+Pj4NCj4gPj4+IFNvIHdlIGludHJvZHVjZSBhIG5ldyB1
bmlmaWVkIGZ1bmN0aW9uIHNldHVwX2Vhcmx5X3VhcnQgdG8gcmVwbGFjZQ0KPiA+Pj4gdGhlIHBy
ZXZpb3VzIHNldHVwX2ZpeG1hcC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVu
IDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICB4ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TICAgICAgICAgICAgICAgfCAgMiArLQ0KPiA+Pj4gICAgeGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWRfbW11LlMgICAgICAgICAgIHwgIDQgKy0NCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9h
cm02NC9oZWFkX21wdS5TICAgICAgICAgICB8IDUyDQo+ID4+ICsrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9lYXJseV9wcmludGsuaCB8
ICAxICsNCj4gPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4gPj4+IGluZGV4IDdmM2Y5NzM0Njgu
LmE5Mjg4MzMxOWQgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
DQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4+PiBAQCAtMjcyLDcg
KzI3Miw3IEBAIHByaW1hcnlfc3dpdGNoZWQ6DQo+ID4+PiAgICAgICAgICAgICAqIGFmdGVyd2Fy
ZHMuDQo+ID4+PiAgICAgICAgICAgICAqLw0KPiA+Pj4gICAgICAgICAgICBibCAgICByZW1vdmVf
aWRlbnRpdHlfbWFwcGluZw0KPiA+Pj4gLSAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwDQo+ID4+
PiArICAgICAgICBibCAgICBzZXR1cF9lYXJseV91YXJ0DQo+ID4+PiAgICAjaWZkZWYgQ09ORklH
X0VBUkxZX1BSSU5USw0KPiA+Pj4gICAgICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3Mg
dG8gYWNjZXNzIHRoZSBVQVJULiAqLw0KPiA+Pj4gICAgICAgICAgICBsZHIgICB4MjMsID1FQVJM
WV9VQVJUX1ZJUlRVQUxfQUREUkVTUw0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkX21tdS5TDQo+ID4+PiBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21tdS5TIGlu
ZGV4IGI1OWM0MDQ5NWYuLmExOWI3Yzg3M2QNCj4gPj4gMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZF9tbXUuUw0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWRfbW11LlMNCj4gPj4+IEBAIC0zMTIsNyArMzEyLDcgQEAgRU5EUFJPQyhyZW1vdmVfaWRl
bnRpdHlfbWFwcGluZykNCj4gPj4+ICAgICAqDQo+ID4+PiAgICAgKiBDbG9iYmVycyB4MCAtIHgz
DQo+ID4+PiAgICAgKi8NCj4gPj4+IC1FTlRSWShzZXR1cF9maXhtYXApDQo+ID4+PiArRU5UUlko
c2V0dXBfZWFybHlfdWFydCkNCj4gPj4NCj4gPj4gVGhpcyBmdW5jdGlvbiBpcyBkb2luZyBtb3Jl
IHRoYW4gZW5hYmxlIHRoZSBlYXJseSBVQVJULiBJdCBhbHNvDQo+ID4+IHNldHVwcyB0aGUgZml4
bWFwIGV2ZW4gZWFybHlwcmludGsgaXMgbm90IGNvbmZpZ3VyZWQuDQo+ID4NCj4gPiBUcnVlLCB0
cnVlLg0KPiA+IEkndmUgdGhvcm91Z2hseSByZWFkIHRoZSBNTVUgaW1wbGVtZW50YXRpb24gb2Yg
c2V0dXBfZml4bWFwLCBhbmQgSSdsbA0KPiA+IHRyeSB0byBzcGxpdCBpdCB1cC4NCj4gPg0KPiA+
Pg0KPiA+PiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgY291bGQgYmUgdGhlIG5hbWUuIE1h
eWJlIHRoaXMgbmVlZHMgdG8gYmUNCj4gPj4gc3BsaXQgZnVydGhlci4NCj4gPj4NCj4gPj4+ICAg
ICNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLDQo+ID4+PiAgICAgICAgICAgIC8qIEFkZCBVQVJU
IHRvIHRoZSBmaXhtYXAgdGFibGUgKi8NCj4gPj4+ICAgICAgICAgICAgbGRyICAgeDAsID1FQVJM
WV9VQVJUX1ZJUlRVQUxfQUREUkVTUw0KPiA+Pj4gQEAgLTMyNSw3ICszMjUsNyBAQCBFTlRSWShz
ZXR1cF9maXhtYXApDQo+ID4+PiAgICAgICAgICAgIGRzYiAgIG5zaHN0DQo+ID4+Pg0KPiA+Pj4g
ICAgICAgICAgICByZXQNCj4gPj4+IC1FTkRQUk9DKHNldHVwX2ZpeG1hcCkNCj4gPj4+ICtFTkRQ
Uk9DKHNldHVwX2Vhcmx5X3VhcnQpDQo+ID4+Pg0KPiA+Pj4gICAgLyogRmFpbC1zdG9wICovDQo+
ID4+PiAgICBmYWlsOiAgIFBSSU5UKCItIEJvb3QgZmFpbGVkIC1cclxuIikNCj4gPj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUw0KPiA+Pj4gYi94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZF9tcHUuUyBpbmRleCBlMmFjNjliMGNjLi43MmQxZTA4NjNkDQo+ID4+IDEw
MDY0NA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbXB1LlMNCj4gPj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21wdS5TDQo+ID4+PiBAQCAtMTgsOCArMTgsMTAg
QEANCj4gPj4+ICAgICNkZWZpbmUgUkVHSU9OX1RFWFRfUFJCQVIgICAgICAgMHgzOCAgICAvKiBT
SD0xMSBBUD0xMCBYTj0wMCAqLw0KPiA+Pj4gICAgI2RlZmluZSBSRUdJT05fUk9fUFJCQVIgICAg
ICAgICAweDNBICAgIC8qIFNIPTExIEFQPTEwIFhOPTEwICovDQo+ID4+PiAgICAjZGVmaW5lIFJF
R0lPTl9EQVRBX1BSQkFSICAgICAgIDB4MzIgICAgLyogU0g9MTEgQVA9MDAgWE49MTAgKi8NCj4g
Pj4+ICsjZGVmaW5lIFJFR0lPTl9ERVZJQ0VfUFJCQVIgICAgIDB4MjIgICAgLyogU0g9MTAgQVA9
MDAgWE49MTAgKi8NCj4gPj4+DQo+ID4+PiAgICAjZGVmaW5lIFJFR0lPTl9OT1JNQUxfUFJMQVIg
ICAgIDB4MGYgICAgLyogTlM9MCBBVFRSPTExMSBFTj0xICovDQo+ID4+PiArI2RlZmluZSBSRUdJ
T05fREVWSUNFX1BSTEFSICAgICAweDA5ICAgIC8qIE5TPTAgQVRUUj0xMDAgRU49MSAqLw0KPiA+
Pj4NCj4gPj4+ICAgIC8qDQo+ID4+PiAgICAgKiBNYWNybyB0byByb3VuZCB1cCB0aGUgc2VjdGlv
biBhZGRyZXNzIHRvIGJlIFBBR0VfU0laRSBhbGlnbmVkDQo+ID4+PiBAQA0KPiA+Pj4gLTMzNCw2
ICszMzYsNTYgQEAgRU5UUlkoZW5hYmxlX21tKQ0KPiA+Pj4gICAgICAgIHJldA0KPiA+Pj4gICAg
RU5EUFJPQyhlbmFibGVfbW0pDQo+ID4+Pg0KPiA+Pj4gKy8qDQo+ID4+PiArICogTWFwIHRoZSBl
YXJseSBVQVJUIHdpdGggYSBuZXcgdHJhbnNpZW50IE1QVSBtZW1vcnkgcmVnaW9uLg0KPiA+Pj4g
KyAqDQo+ID4+DQo+ID4+IE1pc3NpbmcgIklucHV0czogIg0KPiA+Pg0KPiA+Pj4gKyAqIHgyNzog
cmVnaW9uIHNlbGVjdG9yDQo+ID4+PiArICogeDI4OiBwcmJhcg0KPiA+Pj4gKyAqIHgyOTogcHJs
YXINCj4gPj4+ICsgKg0KPiA+Pj4gKyAqIENsb2JiZXJzIHgwIC0geDQNCj4gPj4+ICsgKg0KPiA+
Pj4gKyAqLw0KPiA+Pj4gK0VOVFJZKHNldHVwX2Vhcmx5X3VhcnQpDQo+ID4+PiArI2lmZGVmIENP
TkZJR19FQVJMWV9QUklOVEsNCj4gPj4+ICsgICAgLyogc3RhY2sgTFIgYXMgd3JpdGVfcHIgd2ls
bCBiZSBjYWxsZWQgbGF0ZXIgbGlrZSBuZXN0ZWQgZnVuY3Rpb24gKi8NCj4gPj4+ICsgICAgbW92
ICAgeDMsIGxyDQo+ID4+PiArDQo+ID4+PiArICAgIC8qDQo+ID4+PiArICAgICAqIE1QVSByZWdp
b24gZm9yIGVhcmx5IFVBUlQgaXMgYSB0cmFuc2llbnQgcmVnaW9uLCBzaW5jZSBpdCB3aWxsIGJl
DQo+ID4+PiArICAgICAqIHJlcGxhY2VkIGJ5IHNwZWNpZmljIGRldmljZSBtZW1vcnkgbGF5b3V0
IHdoZW4gRkRUIGdldHMgcGFyc2VkLg0KPiA+Pg0KPiA+PiBJIHdvdWxkIHJhdGhlciBub3QgbWVu
dGlvbiAiRkRUIiBoZXJlIGJlY2F1c2UgdGhpcyBjb2RlIGlzDQo+ID4+IGluZGVwZW5kZW50IHRv
IHRoZSBmaXJtd2FyZSB0YWJsZSB1c2VkLg0KPiA+Pg0KPiA+PiBIb3dldmVyLCBhbnkgcmVhc29u
IHRvIHVzZSBhIHRyYW5zaWVudCByZWdpb24gcmF0aGVyIHRoYW4gdGhlIG9uZQ0KPiA+PiB0aGF0
IHdpbGwgYmUgdXNlZCBmb3IgdGhlIFVBUlQgZHJpdmVyPw0KPiA+Pg0KPiA+DQo+ID4gV2UgZG9u
4oCZdCB3YW50IHRvIGRlZmluZSBhIE1QVSByZWdpb24gZm9yIGVhY2ggZGV2aWNlIGRyaXZlci4g
SXQgd2lsbA0KPiA+IGV4aGF1c3QgTVBVIHJlZ2lvbnMgdmVyeSBxdWlja2x5Lg0KPiBXaGF0IHRo
ZSB1c3VhbCBzaXplIG9mIGFuIE1QVT8NCj4gDQo+IEhvd2V2ZXIsIGV2ZW4gaWYgeW91IGRvbid0
IHdhbnQgdG8gZGVmaW5lIG9uZSBmb3IgZXZlcnkgZGV2aWNlLCBpdCBzdGlsbCBzZWVtDQo+IHRv
IGJlIHNlbnNpYmxlIHRvIGRlZmluZSBhIGZpeGVkIHRlbXBvcmFyeSBvbmUgZm9yIHRoZSBlYXJs
eSBVQVJUIGFzIHRoaXMNCj4gd291bGQgc2ltcGxpZnkgdGhlIGFzc2VtYmx5IGNvZGUuDQo+IA0K
DQpXZSB3aWxsIGFkZCBmaXhlZCBNUFUgcmVnaW9ucyBmb3IgWGVuIHN0YXRpYyBoZWFwIGluIGZ1
bmN0aW9uIHNldHVwX21tLg0KSWYgd2UgcHV0IGVhcmx5IHVhcnQgcmVnaW9uIGluIGZyb250KGZp
eGVkIHJlZ2lvbiBwbGFjZSksIGl0IHdpbGwgbGVhdmUgaG9sZXMNCmxhdGVyIGFmdGVyIHJlbW92
aW5nIGl0Lg0KDQo+IA0KPiA+IEluIGNvbW1pdCAiIFtQQVRDSCB2MiAyOC80MF0geGVuL21wdTog
bWFwIGJvb3QgbW9kdWxlIHNlY3Rpb24gaW4gTVBVDQo+ID4gc3lzdGVtIiwNCj4gDQo+IERpZCB5
b3UgbWVhbiBwYXRjaCAjMjc/DQo+IA0KPiA+IEEgbmV3IEZEVCBwcm9wZXJ0eSBgbXB1LGRldmlj
ZS1tZW1vcnktc2VjdGlvbmAgd2lsbCBiZSBpbnRyb2R1Y2VkIGZvcg0KPiA+IHVzZXJzIHRvIHN0
YXRpY2FsbHkgY29uZmlndXJlIHRoZSB3aG9sZSBzeXN0ZW0gZGV2aWNlIG1lbW9yeSB3aXRoIHRo
ZQ0KPiBsZWFzdCBudW1iZXIgb2YgbWVtb3J5IHJlZ2lvbnMgaW4gRGV2aWNlIFRyZWUuDQo+ID4g
VGhpcyBzZWN0aW9uIHNoYWxsIGNvdmVyIGFsbCBkZXZpY2VzIHRoYXQgd2lsbCBiZSB1c2VkIGlu
IFhlbiwgbGlrZSBgVUFSVGAsDQo+IGBHSUNgLCBldGMuDQo+ID4gRm9yIEZWUF9CYXNlUl9BRU12
OFIsIHdlIGhhdmUgdGhlIGZvbGxvd2luZyBkZWZpbml0aW9uOg0KPiA+IGBgYA0KPiA+IG1wdSxk
ZXZpY2UtbWVtb3J5LXNlY3Rpb24gPSA8MHgwIDB4ODAwMDAwMDAgMHgwIDB4N2ZmZmYwMDA+OyBg
YGANCj4gDQo+IEkgYW0gYSBiaXQgd29ycnkgdGhpcyB3aWxsIGJlIGEgcmVjaXBlIGZvciBtaXN0
YWtlLiBEbyB5b3UgaGF2ZSBhbiBleGFtcGxlDQo+IHdoZXJlIHRoZSBNUFUgd2lsbCBiZSBleGhh
dXN0ZWQgaWYgd2UgcmVzZXJ2ZSBzb21lIGVudHJpZXMgZm9yIGVhY2ggZGV2aWNlDQo+IChvciBz
b21lKT8NCj4gDQoNClllcywgd2UgaGF2ZSBpbnRlcm5hbCBwbGF0Zm9ybSB3aGVyZSBNUFUgcmVn
aW9ucyBhcmUgb25seSAxNi4gSXQgd2lsbCBhbG1vc3QgZWF0IHVwDQphbGwgTVBVIHJlZ2lvbnMg
YmFzZWQgb24gY3VycmVudCBpbXBsZW1lbnRhdGlvbiwgd2hlbiBsYXVuY2hpbmcgdHdvIGd1ZXN0
cyBpbiBwbGF0Zm9ybS4NCg0KTGV0J3MgY2FsY3VsYXRlIHRoZSBtb3N0IHNpbXBsZSBzY2VuYXJp
bzoNClRoZSBmb2xsb3dpbmcgaXMgTVBVLXJlbGF0ZWQgc3RhdGljIGNvbmZpZ3VyYXRpb24gaW4g
ZGV2aWNlIHRyZWU6DQpgYGANCiAgICAgICAgbXB1LGJvb3QtbW9kdWxlLXNlY3Rpb24gPSA8MHgw
IDB4MTAwMDAwMDAgMHgwIDB4MTAwMDAwMDA+Ow0KICAgICAgICBtcHUsZ3Vlc3QtbWVtb3J5LXNl
Y3Rpb24gPSA8MHgwIDB4MjAwMDAwMDAgMHgwIDB4NDAwMDAwMDA+Ow0KICAgICAgICBtcHUsZGV2
aWNlLW1lbW9yeS1zZWN0aW9uID0gPDB4MCAweDgwMDAwMDAwIDB4MCAweDdmZmZmMDAwPjsNCiAg
ICAgICAgbXB1LHNoYXJlZC1tZW1vcnktc2VjdGlvbiA9IDwweDAgMHg3YTAwMDAwMCAweDAgMHgw
MjAwMDAwMD47DQoNCiAgICAgICAgeGVuLHN0YXRpYy1oZWFwID0gPDB4MCAweDYwMDAwMDAwIDB4
MCAweDFhMDAwMDAwPjsNCmBgYA0KQXQgdGhlIGVuZCBvZiB0aGUgYm9vdCwgYmVmb3JlIHJlc2h1
ZmZsaW5nLCB0aGUgTVBVIHJlZ2lvbiB1c2FnZSB3aWxsIGJlIGFzIGZvbGxvd3M6DQo3IChkZWZp
bmVkIGluIGFzc2VtYmx5KSArIEZEVChlYXJseV9mZHRfbWFwKSArIDUgKGF0IGxlYXN0IG9uZSBy
ZWdpb24gZm9yIGVhY2ggIm1wdSx4eHgtbWVtb3J5LXNlY3Rpb24iKS4NCg0KVGhhdCB3aWxsIGJl
IGFscmVhZHkgYXQgbGVhc3QgMTMgTVBVIHJlZ2lvbnMgO1wuDQoNCj4gQ2hlZXJzLA0KPiANCj4g
LS0NCj4gSnVsaWVuIEdyYWxsDQoNCkNoZWVycywNCg0KLS0NClBlbm55IFpoZW5nDQo=

