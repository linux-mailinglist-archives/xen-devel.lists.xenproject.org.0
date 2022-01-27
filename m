Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278449DCF5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261329.452354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0Vi-0006yo-4j; Thu, 27 Jan 2022 08:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261329.452354; Thu, 27 Jan 2022 08:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0Vi-0006vc-0O; Thu, 27 Jan 2022 08:52:06 +0000
Received: by outflank-mailman (input) for mailman id 261329;
 Thu, 27 Jan 2022 08:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0Vg-0006vU-OW
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:52:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64b37dac-7f4e-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:52:02 +0100 (CET)
Received: from DB6PR0402CA0009.eurprd04.prod.outlook.com (2603:10a6:4:91::19)
 by DB9PR08MB7423.eurprd08.prod.outlook.com (2603:10a6:10:370::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:51:59 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::bd) by DB6PR0402CA0009.outlook.office365.com
 (2603:10a6:4:91::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 08:51:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:51:59 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 27 Jan 2022 08:51:59 +0000
Received: from 43e38c799519.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00184D30-73C0-4A4A-8BB0-6A33B3D3AF82.1; 
 Thu, 27 Jan 2022 08:51:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43e38c799519.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:51:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB4026.eurprd08.prod.outlook.com (2603:10a6:10:aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 08:51:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:51:45 +0000
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
X-Inumbo-ID: 64b37dac-7f4e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA1W6QfRvGuvF7DLE8iuPwmvhcbmT/Fw7fS38X7hYrQ=;
 b=5F1egX9A/r0+4vXDqIdiT8K5bW0LMqDO+7npNLk0rJ/P0LYQTqf7OWB6k2/FR5bKEgYVg5vsm6UuZ3D7KV3BDdO8soYQCOTi12IlQAmxvagBLwgJGns2i018CqRHhqR60d2g0uhbaRgJtqggB1JwJJnk5muazUHvWa2HkRSrWfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhjymsWY0yxWX9k9l7CSzPU4C1bCS5caBQ8jaY34ffzIef7fcjBEIWGfnRxrYCKjrAHptQA4d/d40kVj7XJk/lFylTvFadYB9koQp8ozYKfVb+k8TxmyRfCoGJbku2rWJxoplaEDKeSkFeRdgSUAJlwHHDykeob7RtNn3icvo1zFJ1dPAwT5CCzt58x4KqEYOZxTabyMibfM7Cc2j5/VHUEqiNmDBqRFm1a0yPNOO5N9bYzCXOthzrMOTklXSt0tS3go+VvTHG4jHXYYL5Wvwmq22g5SR5UG6cUDE98mqgilZ7JT5KO0YOaKuT/aVzohrzhegNXiZNOka+4wdtEObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA1W6QfRvGuvF7DLE8iuPwmvhcbmT/Fw7fS38X7hYrQ=;
 b=AxVyUkEq1jQWnPXaqa8kjN/4eyxDP6Sc6nbqjscLEd0rVo37vub6lciMBEYlSUhufCl/hYAGt/kjzbB8npUv2MyXeKs2bzUrqONrWsv5G7/g/DoC5ccCjNo5SLb6yB/ueaZyMb4rb2wECBIFFKkvVnGQ0AnaRSL18dg2ZCWludAauCAPjLq94D+IXXVe1+veeG2wlpLZKZAH/SCRyC20CIRNdO/OlN01DoGWZNTaNslXBMVq9m9q9LW+t5o83LYElG9tSDKzeDLstnfHqh9wfM0JuDYpiqlj+SV/n/COysfwQrFNFOHsEF0cT1w5G0aCns01C7Vk8CH+sP1WIYJlRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA1W6QfRvGuvF7DLE8iuPwmvhcbmT/Fw7fS38X7hYrQ=;
 b=5F1egX9A/r0+4vXDqIdiT8K5bW0LMqDO+7npNLk0rJ/P0LYQTqf7OWB6k2/FR5bKEgYVg5vsm6UuZ3D7KV3BDdO8soYQCOTi12IlQAmxvagBLwgJGns2i018CqRHhqR60d2g0uhbaRgJtqggB1JwJJnk5muazUHvWa2HkRSrWfg=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index: AQHXsHMtR+l18+MmpE6rl/RjSXTBgqx0TXyAgAME0ECAAAH2oA==
Date: Thu, 27 Jan 2022 08:51:45 +0000
Message-ID:
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1F6490EA8501FB4FBA3962A8603890F6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4b2ef3c3-cfbc-425f-1632-08d9e17247a3
x-ms-traffictypediagnostic:
	DB8PR08MB4026:EE_|DB5EUR03FT031:EE_|DB9PR08MB7423:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7423F5A65275343B38B914C49E219@DB9PR08MB7423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cEHNlTBw8YinjIm0BL6fk1eVamRYylgm58jKanBb2OQ8ZVi89jeu1lUuWpn+XhXRRLpA1Pzchpu1JmTSrk0+DFBLsk/luk0LYymoGwxUZIOHrKYqh0aWpG03n/VeF1Q+BlkVewp7fBznCC4b6ymkTjPfi33kiZUe834EJ6Klg7GMH2bMgY73SL1dZQ7o833l0VLLjc+Hwxhj1eP3Epi8Dm5FZog7nTqZ6nl8mUbIek9kzogndtKle05j3kMZaeJSqYx1fpdFmKeCU8Vhg2XTGNzN7czki/XMrZWQs1lxvz2fa8BdJNRLJa4Fy1eqw1SBlb+4Jp+ddxY6czGUVD14uc64mEVzuUTeoUE9Pb/0XYHXwW6oUH5ekMcWvm5ky//pKrDTg8fHX44O1FIxhOs4T8oh8YgBguBJlr0Cv59J2GQrIUQ6ftG845Jwg0hDpOWvCHeyeMolrmGkz8VJUkGrxRgznT2IKi9GsQs1qq+7H8rddk9FEsbftpzRFOtg0Ke2aUCYYQaDdE4TtAfczRPkgcduZ+VjuHyOqRv/01VRwe86gdyH0EeE3w7oZohZz5SuzORIJ6iQUiE2L4JmXrYPfSlFA+N34t7HmnEbHejsIVQROKcBlybE7UXTfkCRZ0D17lXcvUCkUZdjxti6Ao+ts7NgF678p3O6i8R/TYJBJBKDP5Cpdrm4m2nnPYNQkHx5d7lLX4/zTntDBrUftQqSpg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(52536014)(33656002)(9686003)(2906002)(83380400001)(66946007)(66556008)(66476007)(316002)(122000001)(38100700002)(66446008)(54906003)(64756008)(508600001)(86362001)(55016003)(2940100002)(110136005)(4326008)(38070700005)(7696005)(8676002)(26005)(8936002)(6506007)(53546011)(5660300002)(71200400001)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d39f645b-fe50-4adc-00e3-08d9e1723f60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hDrtrEBbCr3HoX2+ncFnObyNVJXfZCcd1fDIXSQBIZqEZM7gSl3ItGGDh81ELqlF8oFF0jKJwfL6Y/z3ctVyiTDZOI77X5cgaR7h1biS3E9tQC59wtE2R3GJSExOoTOEoze280FreIci7Rr1kkd3CQQ3ZtBhB5996Cifb0ZGRkRcoL6WZXlwmzeltjXCIgVDnWptSvxFPF36lKusQRvPn2IfuoDGkteASfFjn0YAtsssiy/PHphrr7jl5G32SsEDam2AkogMLsjHwlKp67ex6lXG84vZxrKC9aw0TUaljkbdArygtQ2qcWNqBuZgjyWml2nPQRvTO2sSzsWSoKOiYknZyK2UeQwx+nQ+qW8RkKtiIwEBHUllSGQXHwak0JcKjGDOcc+qOxS1vUr5hQHl7GVkrb0ThvjhMzfFJ0ayZr1wHlsRzVcpR5IsdiKL9SSSot0lmIrMof7IQB6IJMeXXZ2+iBNxx60BMQPeeAVmF3jK/oKaiRZg5S8wcfTQL1B1/4NJCgs0GOgCxnCUnWiAj9Q7uiRoCUNDp4yiUauJTEyblo62A2GZpaDRl6pVTPV12JHKYsgi38ekRkxAua3qpYph+P3tPtNRgGhPapyRi2NvAJiMrK+1m9fg8EPIlC3gwc5a/0pU52vvofAKg4nk0s1QTPTJKf3ovXNruukdsSctXOnd1GfYc7Rk+Kh/SHaT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(356005)(2940100002)(81166007)(2906002)(33656002)(26005)(47076005)(186003)(82310400004)(55016003)(36860700001)(9686003)(336012)(5660300002)(8676002)(4326008)(8936002)(70586007)(70206006)(86362001)(316002)(40460700003)(54906003)(508600001)(53546011)(52536014)(7696005)(110136005)(6506007)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:51:59.3871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2ef3c3-cfbc-425f-1632-08d9e17247a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7423

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1kZXZl
bCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBX
ZWkNCj4gQ2hlbg0KPiBTZW50OiAyMDIy5bm0MeaciDI35pelIDE2OjQ1DQo+IFRvOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBz
c3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BB
VENIIDIwLzM3XSB4ZW46IGludHJvZHVjZSBDT05GSUdfRUZJIHRvIHN0dWIgQVBJIGZvciBub24t
DQo+IEVGSSBhcmNoaXRlY3R1cmUNCj4gDQo+IEhpIEphbiwNCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxODozNQ0KPiA+IFRvOiBXZWkgQ2hlbiA8V2Vp
LkNoZW5AYXJtLmNvbT4NCj4gPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgeGVuLQ0KPiA+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVs
bGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MjAvMzddIHhlbjogaW50cm9kdWNlIENPTkZJR19FRkkgdG8gc3R1YiBBUEkgZm9yDQo+IG5vbi0N
Cj4gPiBFRkkgYXJjaGl0ZWN0dXJlDQo+ID4NCj4gPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkg
Q2hlbiB3cm90ZToNCj4gPiA+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+ID4gKysrIGIv
eGVuL2NvbW1vbi9LY29uZmlnDQo+ID4gPiBAQCAtMTEsNiArMTEsMTYgQEAgY29uZmlnIENPTVBB
VA0KPiA+ID4gIGNvbmZpZyBDT1JFX1BBUktJTkcNCj4gPiA+ICAJYm9vbA0KPiA+ID4NCj4gPiA+
ICtjb25maWcgRUZJDQo+ID4gPiArCWJvb2wNCj4gPiA+ICsJLS0taGVscC0tLQ0KPiA+ID4gKyAg
ICAgIFRoaXMgb3B0aW9uIHByb3ZpZGVzIHN1cHBvcnQgZm9yIHJ1bnRpbWUgc2VydmljZXMgcHJv
dmlkZWQNCj4gPiA+ICsgICAgICBieSBVRUZJIGZpcm13YXJlIChzdWNoIGFzIG5vbi12b2xhdGls
ZSB2YXJpYWJsZXMsIHJlYWx0aW1lDQo+ID4gPiArICAgICAgY2xvY2ssIGFuZCBwbGF0Zm9ybSBy
ZXNldCkuIEEgVUVGSSBzdHViIGlzIGFsc28gcHJvdmlkZWQgdG8NCj4gPiA+ICsgICAgICBhbGxv
dyB0aGUga2VybmVsIHRvIGJlIGJvb3RlZCBhcyBhbiBFRkkgYXBwbGljYXRpb24uIFRoaXMNCj4g
PiA+ICsgICAgICBpcyBvbmx5IHVzZWZ1bCBmb3Iga2VybmVscyB0aGF0IG1heSBydW4gb24gc3lz
dGVtcyB0aGF0IGhhdmUNCj4gPiA+ICsgICAgICBVRUZJIGZpcm13YXJlLg0KPiA+DQo+ID4gVGhl
IHdheSBlbmFibGluZyBvZiAoZnVsbCkgRUZJIHN1cHBvcnQgd29ya3Mgb24geDg2LCBJIGNvbnNp
ZGVyIGl0DQo+ID4gd3JvbmcgLyBtaXNsZWFkaW5nIHRvIHB1dCB0aGUgb3B0aW9uIGluIGNvbW1v
biBjb2RlLiBBdCB0aGUgdmVyeSBsZWFzdA0KPiA+IHRoZSBoZWxwIHRleHQgd291bGQgbmVlZCB0
byBjYWxsIG91dCB0aGUgZXh0cmEgZGVwZW5kZW5jaWVzLiBQbHVzIHRoZQ0KPiA+IGhlbHAgdGV4
dCBvZiBjb3Vyc2UgdGhlbiBuZWVkcyB0byBiZSBnZW5lcmljIChpLmUuIGFwcGxpY2FibGUgdG8g
Ym90aA0KPiA+IEFybSBhbmQgeDg2KS4gVGhhdCdzIG5vdHdpdGhzdGFuZGluZyB0aGUgZmFjdCB0
aGF0IHdpdGhvdXQgYSBwcm9tcHQNCj4gPiB0aGUgaGVscCB0ZXh0IHdvbid0IGV2ZXIgYmUgc2Vl
biB3aGlsZSBjb25maWd1cmluZyBYZW4uDQo+ID4NCj4gPiBBbHNvIChuaXQpOiBJbmRlbnRhdGlv
bi4gQW5kIHBsZWFzZSBkb24ndCB1c2UgLS0taGVscC0tLSBhbnltb3JlIGluDQo+ID4gbmV3IGNv
ZGUuDQo+ID4NCj4gDQo+IEkgaGF2ZSB1c2VkIENPTkZJR19BUk1fRUZJIHRvIHJlcGxhY2UgdGhp
cyBjb21tb24gRUZJIGNvbmZpZyBpbiBteQ0KPiBsYXRlc3QgdmVyc2lvbi4gVGhpcyBLY29uZmln
IG9wdGlvbiBoYXMgYmVlbiByZW1vdmVkLg0KPiBBbmQgdGhhbmtzLCBJIHdpbGwgbm90IHVzZSAt
LWhlbHAtLSBhbnltb3JlLg0KPiANCj4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9lZmkuaA0K
PiA+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL2VmaS5oDQo+ID4gPiBAQCAtMjUsNiArMjUsOCBA
QCBleHRlcm4gc3RydWN0IGVmaSBlZmk7DQo+ID4gPg0KPiA+ID4gICNpZm5kZWYgX19BU1NFTUJM
WV9fDQo+ID4gPg0KPiA+ID4gKyNpZmRlZiBDT05GSUdfRUZJDQo+ID4gPiArDQo+ID4gPiAgdW5p
b24geGVucGZfZWZpX2luZm87DQo+ID4gPiAgdW5pb24gY29tcGF0X3BmX2VmaV9pbmZvOw0KPiA+
ID4NCj4gPiA+IEBAIC00NSw2ICs0Nyw4IEBAIGludCBlZmlfcnVudGltZV9jYWxsKHN0cnVjdCB4
ZW5wZl9lZmlfcnVudGltZV9jYWxsDQo+ICopOw0KPiA+ID4gIGludCBlZmlfY29tcGF0X2dldF9p
bmZvKHVpbnQzMl90IGlkeCwgdW5pb24gY29tcGF0X3BmX2VmaV9pbmZvICopOw0KPiA+ID4gIGlu
dCBlZmlfY29tcGF0X3J1bnRpbWVfY2FsbChzdHJ1Y3QgY29tcGF0X3BmX2VmaV9ydW50aW1lX2Nh
bGwgKik7DQo+ID4gPg0KPiA+ID4gKyNlbmRpZiAvKiBDT05GSUdfRUZJKi8NCj4gPg0KPiA+IEkg
Y2FuIHNlZSB0aGF0IGluIHRoZSBsYXRlciBwYXRjaCwgd2hlbiBpbnRyb2R1Y2luZyBpbmxpbmUg
c3R1YnMsDQo+ID4geW91IHdvdWxkIG5lZWQgY29uZGl0aW9uYWxzIGhlcmUsIGJ1dCBJIGRvbid0
IHRoaW5rIHlvdSBuZWVkIHRoZW0NCj4gPiByaWdodCBoZXJlIChvciB5b3UgbWF5IHdhbnQgdG8g
aW50cm9kdWNlIHRoZSBzdHVicyByaWdodCBhd2F5KS4NCj4gPg0KPiA+IEFsc28gKG5pdCk6IE1p
c3NpbmcgYmxhbmsgaW4gdGhlIGNvbW1lbnQuDQo+ID4NCg0KSSBhbSBzb3JyeSwgSSBoYWQgbWlz
c2VkIHRoaXMgY29tbWVudC4gSW4gbXkgbGF0ZXN0IGNoYW5nZXMsDQpJIGhhdmUgaW50cm9kdWNl
ZCBhIHN0dWIgZmlsZSBmb3Igbm9uLUVGSSBhcmNoaXRlY3R1cmVzLg0KVGhlIHJlYXNvbiB3aHkg
d2UgZG9uJ3QgdXNlIGEgbWFjcm8gdG8gc3R1YiB0aGUgaGVscGVycw0KaW4gZWZpLmggaXMgdGhh
dCwgc29tZSBhcmNoaXRlY3R1cmVzIGhhdmUgaW1wbGVtZW50ZWQgc3R1Yg0KaGVscGVycyBpbiB0
aGVpciBzdHViLmMuIElmIHdlIGRlZmluZSBzdHViIGhlbHBlcnMgaW4NCmVmaS5oLCB0aGlzIHdp
bGwgY2F1c2UgZnVuY3Rpb24gcmVkZWZpbml0aW9uIGVycm9yLiBXZSBuZWVkDQp0byBmaXggdGhp
cyBlcnJvciBmb3IgYWxsIGFyY2hpdGVjdHVyZXMuIEFuZCBzb21lIGhlbHBlcnMNCmlzIG5vdCBl
YXN5IHRvIGltcGxlbWVudCBhcyBhIGlubGluZSBmdW5jdGlvbiBpbiBlZmkuaC4NClNvIHdlIHVz
ZSBzdHViIGZpbGUgaW5zdGVhZCBvZiBzdHViaW5nIGluIGVmaS5oDQoNCj4gPiBKYW4NCg0K

