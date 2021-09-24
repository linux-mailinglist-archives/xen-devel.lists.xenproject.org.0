Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07679417060
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195251.347893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiXT-0002fM-DS; Fri, 24 Sep 2021 10:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195251.347893; Fri, 24 Sep 2021 10:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiXT-0002dB-8p; Fri, 24 Sep 2021 10:34:43 +0000
Received: by outflank-mailman (input) for mailman id 195251;
 Fri, 24 Sep 2021 10:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTiXR-0002cw-Au
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:34:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03a3808c-1d23-11ec-babb-12813bfff9fa;
 Fri, 24 Sep 2021 10:34:37 +0000 (UTC)
Received: from FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::14)
 by DB7PR08MB3884.eurprd08.prod.outlook.com (2603:10a6:10:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 10:34:30 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::9f) by FR3P281CA0027.outlook.office365.com
 (2603:10a6:d10:1c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8 via Frontend
 Transport; Fri, 24 Sep 2021 10:34:30 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:34:30 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Fri, 24 Sep 2021 10:34:29 +0000
Received: from f86800bb0033.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E00E082B-5228-449D-BAE0-0BF837903CA5.1; 
 Fri, 24 Sep 2021 10:34:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f86800bb0033.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:34:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6959.eurprd08.prod.outlook.com (2603:10a6:10:2bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:34:15 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:34:15 +0000
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
X-Inumbo-ID: 03a3808c-1d23-11ec-babb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkc19n3/f09++KXFEYT/F+y3BGSBmy0DKrhefV9sAgE=;
 b=gv35uVTsTArrPo3XZujH4UFkHbO9DVOXS5PnLRMOUcmEM6QsxSzRb28IhNDtgGFZQv2mGJz2koeg/w/B9fOGNFwnbMXJ2c1XoIGt+hvveQYJACcmoYDKxSprqe5Zt6m6kaYQ2+QDRY+u8ezZ2msGKRAfnLRY6MvO0LM8Efq6X+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnqMGs2MOW4FFM04zVLJUJzqrzfBv4hn3fU2/ZeSnLaW/FiJAqRZLBJoTjdHcqp/sJdudkfjo8POFdWl9ZArk6CEjIbnfU7LEzSn2mAYOukI45AZPhaDFqqUrRxkqrIVX9qDxQo8gI8oTIuh8ipV7sYftnDTkqxli+hzPaBbx9AXQBOODAtQRSttf+Tvkg1bpeyOSxX2OfcZM48lkLMBIapMD8sUgvrTasSN6exlTBbHrykB8Bg935YySWpdFSwFaBvtMp5jkbA8noG9JNYcqLruChyvGxkrwrMsqx8TtaYAlMDq2q21kTPuTRVc8hb42eloSqr9HEr37uXMhVN12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fkc19n3/f09++KXFEYT/F+y3BGSBmy0DKrhefV9sAgE=;
 b=W1jsXSV9ETXwzRvYU2GIw8Tt0ciZRPvOWXDMAdFn8YsDJVzW8m//mw1IGYXNllducxoE163xgqhSy+72RFWCMkkLePSBhAZMlWAiYemz9hN7FUs48nFqPk3cEsb0Y7AeDnRMKtA/Q7tfnm33H/bjkX2GsIJ8TA9IOjVZBLuID/wT18qGo7zQiN6G+s+7QDXUpu68CT3aPURmMzDsh11gZyOg7uUuJxV2H9SJh4yaigLXSwnhF054IDdk9lnbNzxZGUZdMWYuDNlBB87Si3ZMyrl1Z+ZEvI1WcS9D1iraaIvX+mJi0S1QWt8RjrvqooIE42dr6kbxy/ciKCpuRmQX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkc19n3/f09++KXFEYT/F+y3BGSBmy0DKrhefV9sAgE=;
 b=gv35uVTsTArrPo3XZujH4UFkHbO9DVOXS5PnLRMOUcmEM6QsxSzRb28IhNDtgGFZQv2mGJz2koeg/w/B9fOGNFwnbMXJ2c1XoIGt+hvveQYJACcmoYDKxSprqe5Zt6m6kaYQ2+QDRY+u8ezZ2msGKRAfnLRY6MvO0LM8Efq6X+M=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 03/37] xen/x86: Initialize memnodemapsize while faking
 NUMA node
Thread-Topic: [PATCH 03/37] xen/x86: Initialize memnodemapsize while faking
 NUMA node
Thread-Index: AQHXsHMIJLEC2+fmVEC3A6RnJgdqV6uy43iAgAAa/qA=
Date: Fri, 24 Sep 2021 10:34:15 +0000
Message-ID:
 <DB9PR08MB685755F25447F054B5EE199F9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-4-wei.chen@arm.com>
 <27150d2e-b269-c1ef-0e73-bdce1975dcb4@suse.com>
In-Reply-To: <27150d2e-b269-c1ef-0e73-bdce1975dcb4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A3DD0F2CA4E6434AA2313A233FFD2C33.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3ade7974-4478-468d-6b6d-08d97f46e489
x-ms-traffictypediagnostic: DB9PR08MB6959:|DB7PR08MB3884:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB38847B1A4862D207B5C8FCD99EA49@DB7PR08MB3884.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c4hTNuzWmQi/vZDAjDw0jHOdxPEETtBfPkH44laDhk4LWNXkFU6/GIAqN9u4+IAFZ9M4hQPM57UP3I7S0OEs16ph2N506+CKeUr4gHU99O7rq9oyS4OplISAR7izVW4WbYigPzErRKtR3edZbZ8o5XJaBrc+TPeSaUhh+63mIAhqtpCv9SBUZl3wOChGHgEd3lAYDmXM8EnPAQEK9XuT3Tq4kL9qHMUf5+sAMIFPi5Fp4oyNw7jJ6pbuAYFNx3ZRHTtZJrN0DtX+zCWpdnc3hswk+Jv8WWTU9kjI4MwQtg1fYEI9PUruyWtBsJARsm2sMJCzFc0h+aLN4aHTBr1i+4DYtJgA3ZjBNm6MbiVAWDV2FNza+s2Thw174nEkXI7Q3sYPGkSAVfVbWEdQc+99ROcJeWMGI4Ds1wO/kGNE1taXUcHir9/E9X8lv0Ns3EEoHqO2o1jVsEllgiSmnqnqgNbsMX8sqwSBfywX4pM9O404bhPTphv40iI6D78hkGVKKUgIAe+U03yGllu0ifWaG1mabiL0CTnkoCw4WxqCB7fIu7GFaV8l8IDzGIcoubME9va88oeELOMsoJpyxMHp8M7mDUzbwlorbL28ET88bE+LJ+zwrxULAKj0hoseaSSUpT+b50+crD1TcxX9a0240dEK7SBvNK7Yj/obuM6gQTKU5U1a9JdeuLZZJsf3FRVqK7V7bKMSdbTaQQYLYSbtnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(4326008)(54906003)(66446008)(71200400001)(66476007)(66556008)(8676002)(186003)(5660300002)(66946007)(9686003)(316002)(33656002)(8936002)(76116006)(55016002)(508600001)(86362001)(6916009)(38070700005)(26005)(122000001)(53546011)(52536014)(83380400001)(6506007)(7696005)(38100700002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6959
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e567fd6b-5f04-41df-b975-08d97f46db7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VAaP51Ffv8gJsrEd5cp+F9dPvUhv5s/PSyV9rfrbBHRP/+RLCHTcIqxyCznyFmZ1polJOaEgrYVbcW4aOY11YljTSjNlTEaV+8bWwkpp9sxz/S77rTQufhkZTr+srKRqE/JmHJPLtKr6dsEbQH7+1+XI49SCz3HAlZOsEY5pTwWcFVljieRkcM2CKX50UHOFjC2CjKEPuTROx/eBonhLVYSwnHcvC+X9qE0ZwCAnBSfwKL8rfYlpMLllUepBU8Z7q79mEchFfpOohnTGkbaD5SlAJVopsrlT4cPom3tRx/bpo6qp29TJpRTY9887U1jKYiv2KzRdoXlmlcWaGLj8B91cZFGG3/p+bwFBU+VuC1YfYT1OdnziCnzKT7b8eXOpZQ84zxmVKaoNlC0YPiu4w89uGs1LDnIUs+phVjRQ7v9WJLybjoVm9H5t+g7UQr6OiY/mHxJ1oYzRGa5awV5zTHP8amjpdJLvswA1ZYF2DxUUOhkLlmj2hdUPOkQjsM9tzUPVTl1giSZIq6mYtLqbgpXwyMF7WmKmz9akxcjC6+eEzJ09gD/A48NNph6ZJ10ExrmMkQyP6qrsJLU/q8UD5nwocvxK9ch1LlPktWCqkLL1jC1MYLwGOQ/fidQYfqDp7d84r15SWd6rA+3u6YknIc/4atqC3KJ4nHh9pkQ9jUHKCwesa5t2SIRa9IaA8EgeZ3qXeXvKM9y8oDShthgbcg==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(5660300002)(47076005)(36860700001)(508600001)(53546011)(316002)(6506007)(2906002)(83380400001)(81166007)(356005)(9686003)(55016002)(33656002)(7696005)(70206006)(52536014)(186003)(4326008)(6862004)(8676002)(54906003)(70586007)(26005)(8936002)(336012)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:34:30.7235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ade7974-4478-468d-6b6d-08d97f46e489
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3884

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyMDIx5bm0OeaciDI05pelIDE2OjU3DQo+IFRvOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMDMvMzddIHhlbi94ODY6IEluaXRpYWxpemUgbWVtbm9kZW1hcHNpemUgd2hpbGUgZmFr
aW5nDQo+IE5VTUEgbm9kZQ0KPiANCj4gT24gMjMuMDkuMjAyMSAxNDowMiwgV2VpIENoZW4gd3Jv
dGU6DQo+ID4gV2hlbiBzeXN0ZW0gdHVybnMgTlVNQSBvZmYgb3Igc3lzdGVtIGxhY2tzIG9mIE5V
TUEgc3VwcG9ydCwNCj4gPiBYZW4gd2lsbCBmYWtlIGEgTlVNQSBub2RlIHRvIG1ha2Ugc3lzdGVt
IHdvcmtzIGFzIGEgc2luZ2xlDQo+ID4gbm9kZSBOVU1BIHN5c3RlbS4NCj4gPg0KPiA+IEluIHRo
aXMgY2FzZSB0aGUgbWVtb3J5IG5vZGUgbWFwIGRvZXNuJ3QgbmVlZCB0byBiZSBhbGxvY2F0ZWQN
Cj4gPiBmcm9tIGJvb3QgcGFnZXMsIGl0IHdpbGwgdXNlIHRoZSBfbWVtbm9kZW1hcCBkaXJlY3Rs
eS4gQnV0DQo+ID4gbWVtbm9kZW1hcHNpemUgaGFzbid0IGJlZW4gc2V0LiBYZW4gc2hvdWxkIGFz
c2VydCBpbiBwaHlzX3RvX25pZC4NCj4gPiBCZWNhdXNlIHg4NiB3YXMgdXNpbmcgYW4gZW1wdHkg
bWFjcm8gIlZJUlRVQUxfQlVHX09OIiB0byByZXBsYWNlDQo+ID4gU1NFUlQsIHRoaXMgYnVnIHdp
bGwgbm90IGJlIHRyaWdnZXJlZCBvbiB4ODYuDQo+IA0KPiBTb21laG93IGFuZCBBIGdvdCBsb3N0
IGhlcmUsIHdoaWNoIEknbGwgYWRkIGJhY2sgd2hpbGUgY29tbWl0dGluZy4NCj4gDQoNClRoYW5r
cyENCg0KPiA+IEFjdHVhbGx5LCBYZW4gd2lsbCBvbmx5IHVzZSAxIHNsb3Qgb2YgbWVtbm9kZW1h
cCBpbiB0aGlzIGNhc2UuDQo+ID4gU28gd2Ugc2V0IG1lbW5vZGVtYXBbMF0gdG8gMCBhbmQgbWVt
bm9kZW1hcHNpemUgdG8gMSBpbiB0aGlzDQo+ID4gcGF0Y2ggdG8gZml4IGl0Lg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+IA0KPiBBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQo=

