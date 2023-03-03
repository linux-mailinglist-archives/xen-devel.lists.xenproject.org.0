Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2C6A9235
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 09:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505622.778484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY0Yb-0006Q4-Va; Fri, 03 Mar 2023 08:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505622.778484; Fri, 03 Mar 2023 08:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY0Yb-0006Ne-SK; Fri, 03 Mar 2023 08:14:25 +0000
Received: by outflank-mailman (input) for mailman id 505622;
 Fri, 03 Mar 2023 08:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY0YZ-0006NW-V8
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 08:14:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66801e5b-b99b-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 09:14:21 +0100 (CET)
Received: from DB8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:10:110::22)
 by AS2PR08MB8950.eurprd08.prod.outlook.com (2603:10a6:20b:5f9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 08:14:19 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::da) by DB8PR04CA0012.outlook.office365.com
 (2603:10a6:10:110::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 08:14:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 08:14:18 +0000
Received: ("Tessian outbound fcd8b5fba459:v135");
 Fri, 03 Mar 2023 08:14:18 +0000
Received: from 3d25fa3af1b9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 815F6A55-45BA-4DCB-839B-8D9BE078BC40.1; 
 Fri, 03 Mar 2023 08:14:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d25fa3af1b9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 08:14:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9477.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.20; Fri, 3 Mar
 2023 08:14:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 08:14:09 +0000
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
X-Inumbo-ID: 66801e5b-b99b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IjNJZrJLmlbrvK+o7KPdBRR8E8Q2HwCwx530626NJs=;
 b=wSaZhOjIRAN+D3va0T+lJ6N3xwICdLFQg5wIh/vX6LhpmJIkWnVTdMsq5wD7YwEgw9m93TJKyVgs7XUfxfw5CdcduhM+oWF2d3DXnJJZ03IEjPNd9n7CWfjpM9Y6gpxUOxcY6Vcy42CDNShuJsW922arYPTYWlGyeMfGkyp0TNQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 394c2bf92a4e3d6c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuRo1oEfwmOh3aJrQvPdrpj9XUSxXbpiUn4SNaRiCrPl3sk8/LUOdr1MA/j+czL8TvhIU+iO+sJKTDxOvoZy0Pt2p7blxBwdw55B5loZaF/poDvv5SC/k/Q0ldyh1ygQCfvgmFc+YRqdUG0UOTzMkyMS24szXEeaaSD+Mx92e0W7iRfSivdxjXPJDUQJLg28KpwgqIhW/J68HAYMfgy6JPVViMF1FO1D4pCuBbXV/QNc016gtkGT0n6RNJ1ncQ7q5mCIvIQEhWGuJmDfFVYjaQswQpE+n68sEPeWTckgcJsdr0yUHweRsd33xlBJSk3FZbddX9ldyNgiCRUHw28EPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IjNJZrJLmlbrvK+o7KPdBRR8E8Q2HwCwx530626NJs=;
 b=gdNVN5//MFbIPxiRL8YToOZfWF4qiD+tJOpKSJ/gpkGXoEt1EjzKcoC3R2uHEWODLEzho5InYanhDBHJtWwLsQWKg0WNxLGNVCEN6w4yN64JVGHHFXWLCKfnXNMP7UFEXJlqyjSIuXZBOjpjBgVSzGZWwL+CI86jiS1ZEEuZwyvigMZQhLLJNSnMKc2wZOQEborVm7MDVVId6GvTS/H/kn360y6/+ahvG8efVzNTfHjuXLrtn8CKSBAR9LYKyszpGK9/kizlEcVWQX3IlxeaJDAaY83wP+afXbrc7f33BTq1BzonBcUmCxzdnJ14g+zmmZzgAhYRx/I4qkktfiOEEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IjNJZrJLmlbrvK+o7KPdBRR8E8Q2HwCwx530626NJs=;
 b=wSaZhOjIRAN+D3va0T+lJ6N3xwICdLFQg5wIh/vX6LhpmJIkWnVTdMsq5wD7YwEgw9m93TJKyVgs7XUfxfw5CdcduhM+oWF2d3DXnJJZ03IEjPNd9n7CWfjpM9Y6gpxUOxcY6Vcy42CDNShuJsW922arYPTYWlGyeMfGkyp0TNQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 07/20] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Topic: [XEN PATCH v7 07/20] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Index: AQHZRtMc9l4FLuQsA0eLhPi3rXVDQK7d2fAAgArUXQCAABRDgA==
Date: Fri, 3 Mar 2023 08:14:09 +0000
Message-ID: <E24D4EB2-D7B2-4E56-A9A4-EB743ECF5E3D@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <904055064f4b4e4514acf1e64751672eca045c05.1677079672.git.jens.wiklander@linaro.org>
 <BD5022BF-C157-4CF2-86D4-07345F64681E@arm.com>
 <CAHUa44Gd92oDP8meH2UcHjsmokQcEpKV0U6whUD_5nEDYpJKxQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44Gd92oDP8meH2UcHjsmokQcEpKV0U6whUD_5nEDYpJKxQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9477:EE_|DBAEUR03FT043:EE_|AS2PR08MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e468eb-9e19-48ad-e14b-08db1bbf496f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e5vo4A6fUotY274PtCgQovNhekwlUYEImkhv7Jnn4NE3hkVILFWU/auL0xzCUhtsTxFQSQJ3SjKJSTgSsBLW0YBhE3K1tyoN4NYozbu1+gg7kgx1COVjrYlkoNv6dcTYba8KGDGIWXFzCzRGG14CLQ2MUdwtBE+hLcxP+Jj6fhnpE9B7IhYPGzna6m5Ja6b4NNaR7rerbrIQkxLgR7m42PnYHz9qNF2sGhzYpaWrWmvgc4t4S6uwAryVA8jgBzfxq1Mjbl70S99iKanBwGW57yovekwdqTjV5+vQtQt0CrLlzntggPO4K+oUaM8Ydjk/oJqT/SY8MuDpXj3x9r+otpDBsI6KqcA/58l/rZ1BG5WJZn6TdquAheFnLSXIYzI8tr1RSWmsyfCdeq0rrpOPynzqH4/cVs2seSRY4/fAsRcMxIPOmguv2i9f9qZgj5cDgeYJ252LcfZA8ABpqtUFj+ziwqXe2xoVx52E4btuYbhUM0NTKQjTimIWhVbVVLbMasrX+xmIDOt+2HA2UqY5Lxl/wZ5pEB8HAty6c1Hj9T9ced644xkwLbgwV7TYHgrEnwLOx2DAaegkG+wAg0sRaPfX6kx9w76HoZyvnDFLSSGLqwVZc5xaxr5ip3LuUbQwGmFYKOdsQOHFB+EElnv/0z7cR1YHRDBoS3fuSjCHIfvrEAbobtbnx/Zk/e20eR81I2X2VcaDiaQK0cyzy4vcqK2IPrL3ObcXjnoaVwmZUiw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199018)(6916009)(36756003)(64756008)(91956017)(66446008)(316002)(76116006)(66476007)(8676002)(66556008)(66946007)(54906003)(2906002)(4326008)(15650500001)(41300700001)(478600001)(26005)(53546011)(6506007)(6512007)(2616005)(186003)(83380400001)(71200400001)(6486002)(86362001)(33656002)(122000001)(38100700002)(38070700005)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <97491AD2A696534F9ABCEEBCA5C3E9C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9477
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13d6c827-ce3b-4cdb-7976-08db1bbf43d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fIvWUVS7iug3n2jaNDwi75HKhB+ZtIp33zbgM1lVK2R2KKO2hKE9wpGY5CTdChKmQZcU+XO7lkjQUvdFpCvWBm/yvSTKGEMNgZ7LseRQm1CQNjnE8R/vRegujG+He9PyubMh2aV2EKk857hHlyfO+WiqSimJ0Tq4zMve8qPYZz7S/0atLvvy702iHaTHY6HwejRyNWbs9FrmBbrsnaewMt5NB2zprEuh1xcGlccTLikxuM7FJac9OgBcs0JMUvZd9EaqD7NI6jlJJ2BPEcc/jpNfU4aUIkCmBpzX9g1p8xRBU0bcbfvv9wQPf58kxR7sektJNnTUii6RHnNJ5sTkeQk60mA2n9FYXJJpYP6T4SQLtBxMEcH9AcA5m3/mHPLCOTrDlJcRgmM21Lq7JYJooIYGC1OSZfNvxoQQNHqhG4bHQl8X3EAyb37v/hrwWDiHR1PbCI2n8+XD4YxGlVhSWpxy+6zqueHviQ5E1KzBdSljnArC/IEkVirj0IcoukbwafyPHTACOYSWKbboRZh8BGFZ5crcjyqHvKwI66c/O9ZzlnrV326CguHfPQ/ej1lCHBU5nTTd1FoJwOXk8d2ZH9QE5eRX96DbH1gHP8RZP3Ixdoan1oaieI7DI36p2UOs4K6eDSBw2ikIvBj+3TurRGKjUgQ5hIcDop8mvl+L+htdLOU9zX5DpfT7R6lTUEGeIi/Nt/nmmZ/DNPb7A0DSnw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(356005)(33656002)(82310400005)(40460700003)(36756003)(40480700001)(86362001)(54906003)(316002)(83380400001)(2616005)(70206006)(70586007)(6506007)(6512007)(4326008)(53546011)(8676002)(6486002)(336012)(478600001)(47076005)(2906002)(82740400003)(15650500001)(81166007)(36860700001)(8936002)(6862004)(41300700001)(5660300002)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 08:14:18.7673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e468eb-9e19-48ad-e14b-08db1bbf496f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8950

SEkgSmVucywNCg0KPiBPbiAzIE1hciAyMDIzLCBhdCAwODowMSwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0K
PiBPbiBGcmksIEZlYiAyNCwgMjAyMyBhdCAxMDozOeKAr0FNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEhpIEplbnMsDQo+PiAN
Cj4+PiBPbiAyMiBGZWIgMjAyMywgYXQgMTY6MzMsIEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xh
bmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBBZGRzIGRlZmluZXMgZm9yIGZyYW1l
d29yayBkaXJlY3QgcmVxdWVzdC9yZXNwb25zZSBtZXNzYWdlcy4NCj4+PiANCj4+PiBTaWduZWQt
b2ZmLWJ5OiBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4NCj4+PiAt
LS0NCj4+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIHwgOSArKysrKysrKysNCj4+PiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+Pj4gaW5kZXggZjQ1NjJl
ZDJkZWZjLi5kMDRiYWM5Y2M0N2YgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9m
ZmEuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+PiBAQCAtNTYsNiArNTYs
MTUgQEANCj4+PiAjZGVmaW5lIEZGQV9NWV9WRVJTSU9OICAgICAgICAgIE1BS0VfRkZBX1ZFUlNJ
T04oRkZBX01ZX1ZFUlNJT05fTUFKT1IsIFwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBGRkFfTVlfVkVSU0lPTl9NSU5PUikNCj4+PiANCj4+PiAr
LyogRnJhbWV3b3JrIGRpcmVjdCByZXF1ZXN0L3Jlc3BvbnNlICovDQo+PiANCj4+IEluIHRoZSBw
cmV2aW91cyBwYXRjaCB5b3Ugd2VyZSBtb3JlIHZlcmJvc2UgaW4gdGhlIGNvbW1lbnQgd2hpY2gg
d2FzIG5pY2UuDQo+PiBJIHdvdWxkIHN1Z2dlc3QgaGVyZSB0byB1c2UgdGhlIHNhbWUgImZvcm1h
dCI6DQo+PiANCj4+IEZsYWdzIHVzZWQgZm9yIHRoZSBNU0dfU0VORF9ESVJFQ1RfUkVRL1JFU1A6
DQo+PiBCSVQoMzEpOiBGcmFtZXdvcmsgb3IgcGFydGl0aW9uIG1lc3NhZ2UNCj4+IEJJVCg3LTAp
OiBNZXNzYWdlIHR5cGUgZm9yIGZyYW1ld29ya3MgbWVzc2FnZXMNCj4gDQo+IE9LLCBJJ2xsIHVw
ZGF0ZS4NCj4gDQo+PiANCj4+PiArI2RlZmluZSBGRkFfTVNHX0ZMQUdfRlJBTUVXT1JLICAgICAg
ICAgIEJJVCgzMSwgVSkNCj4+PiArI2RlZmluZSBGRkFfTVNHX1RZUEVfTUFTSyAgICAgICAgICAg
ICAgIDB4RkZVOw0KPj4gDQo+PiBNYXliZSBtb3JlIGNvaGVyZW50IHRvIG5hbWUgdGhpcyBGRkFf
TVNHX0ZMQUdfVFlQRV9NQVNLID8NCj4gDQo+IFRoaXMgaXMgYSBiYWxhbmNpbmcgYWN0LCBpbiB0
aGlzIGNhc2UsIEkgZG9uJ3QgdGhpbmsgdGhhdCBhZGRpbmcgRkxBR18NCj4gaGVscHMgbXVjaC4N
Cg0KQWdyZWUgeW91IGNhbiByZW1vdmUgZmxhZy4NCg0KPiANCj4+IA0KPj4gSSBhbSBhIGJpdCB1
bnN1cmUgaGVyZSBiZWNhdXNlIHdlIGNvdWxkIGFsc28ga2VlcCBpdCBsaWtlIHRoYXQgYW5kIGp1
c3QNCj4+IGFkZCBfVFlQRSB0byBvdGhlciBkZWZpbml0aW9ucyBhZnRlci4NCj4+IA0KPj4gV2hh
dCBkbyB5b3UgdGhpbmsgPw0KPiANCj4gSSB0aGluayB0aGUgZGVmaW5lcyBhcmUgbG9uZyBlbm91
Z2ggYXMgdGhleSBhcmUuDQoNClJpZ2h0Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENo
ZWVycywNCj4gSmVucw0KPiANCj4+IA0KPj4+ICsjZGVmaW5lIEZGQV9NU0dfUFNDSSAgICAgICAg
ICAgICAgICAgICAgMHgwVQ0KPj4+ICsjZGVmaW5lIEZGQV9NU0dfU0VORF9WTV9DUkVBVEVEICAg
ICAgICAgMHg0VQ0KPj4+ICsjZGVmaW5lIEZGQV9NU0dfUkVTUF9WTV9DUkVBVEVEICAgICAgICAg
MHg1VQ0KPj4+ICsjZGVmaW5lIEZGQV9NU0dfU0VORF9WTV9ERVNUUk9ZRUQgICAgICAgMHg2VQ0K
Pj4+ICsjZGVmaW5lIEZGQV9NU0dfUkVTUF9WTV9ERVNUUk9ZRUQgICAgICAgMHg3VQ0KPj4+ICsN
Cj4+PiAvKg0KPj4+ICogRmxhZ3MgdXNlZCBmb3IgdGhlIEZGQV9QQVJUSVRJT05fSU5GT19HRVQg
cmV0dXJuIG1lc3NhZ2U6DQo+Pj4gKiBCSVQoMCk6IFN1cHBvcnRzIHJlY2VpcHQgb2YgZGlyZWN0
IHJlcXVlc3RzDQo+Pj4gLS0NCj4+PiAyLjM0LjENCj4+PiANCj4+IA0KPj4gQ2hlZXJzDQo+PiBC
ZXJ0cmFuZA0KDQoNCg==

