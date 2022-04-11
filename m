Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23314FB94D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302880.516726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrAK-0006qI-T2; Mon, 11 Apr 2022 10:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302880.516726; Mon, 11 Apr 2022 10:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrAK-0006o4-Q4; Mon, 11 Apr 2022 10:21:00 +0000
Received: by outflank-mailman (input) for mailman id 302880;
 Mon, 11 Apr 2022 10:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfOQ=UV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ndrAJ-0006nS-NT
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:20:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe02::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1434ae47-b981-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 12:20:58 +0200 (CEST)
Received: from AM0PR01CA0173.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::42) by AM6PR08MB4738.eurprd08.prod.outlook.com
 (2603:10a6:20b:cf::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:20:47 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::c5) by AM0PR01CA0173.outlook.office365.com
 (2603:10a6:208:aa::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 10:20:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 10:20:46 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 11 Apr 2022 10:20:46 +0000
Received: from c60e5316a7df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C2275A6-06B0-462F-BA64-AD1447F17FBE.1; 
 Mon, 11 Apr 2022 10:20:39 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c60e5316a7df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 10:20:39 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB4531.eurprd08.prod.outlook.com (2603:10a6:208:13f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:20:38 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:20:38 +0000
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
X-Inumbo-ID: 1434ae47-b981-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR5PaOqzj/Cf7hb3h8Wg8jBz1qeMrTRFTsrD9AD/eJQ=;
 b=aNWrxvar6qvYX6HhiRzwuEf4ezNieTBkuz3rKMZNmj5DMVf/yL+31CqHUt8kI82crNqGjtSdMF1Sa1En1FwJmMRpm3nMbptxPP29mLwDwTdrBHT9uARaN4D1FWX0028fGGDALLT6RiREpMi82+NS77iGqUjltTZomFx8DntIOvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4e9601e69a0dee9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HplSikpbF3BcjxeIqaWt7dZVpleQLtt+4k6Tn7xybURawGNauL1zSnJwB5svz+GQITnqIo3fH/6HZeDux35BjLc475tTj8+r6B6E3V5QRFpnt1vV3u3VJ9nXIBu6+mbuZPxOd81WbiS8hVwhImW3lX/OKRFsXhny3ma/t36n20z4ZHBPugi+srjpg1Geb5TI7FgQ/wxN7or8XZogUv1x0N9Ia4ljDFczCqsj+JIoCd/7A5qLuAmrBkYTdcyYdXMVFtJUyJnwlJg3XSPPKnJkSGYH6EQc0PrdDEBBt2DWGDj3yOwtZc56KB5d/rTjG5wEgmg+TVsBrc7viZQdmAPCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR5PaOqzj/Cf7hb3h8Wg8jBz1qeMrTRFTsrD9AD/eJQ=;
 b=TffWfUYHv1GhcWW3QVLRnm6AB6OcyKcYNKjZtHlz1zQRl2SMx4nHv7HvFVakH66BjL+DwZvRi2CsE1wsoVJODy1BwzcVFxmFM4pfFDg7Wq8mTvf85yrfuweAW00aqBv/BaWCn9rkZD66egwS1xv2uEDHUTxM2jeLeG/CpqRSp6DqgxcEnV0CSRLaShSdEIDxMFuFqABjBKjro9tssgMkauGy86P6TFyNjGwjpp/fggv4AlGfd0cIND/UlrmLwrgYb2ynMwnknNzKI+HBeKxb6VmDwmUiZpDPQysPsARWe/KZ1Ah6/hxS4xsANvpICPBNT66dDhn5b7KgFX5ZwwOB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR5PaOqzj/Cf7hb3h8Wg8jBz1qeMrTRFTsrD9AD/eJQ=;
 b=aNWrxvar6qvYX6HhiRzwuEf4ezNieTBkuz3rKMZNmj5DMVf/yL+31CqHUt8kI82crNqGjtSdMF1Sa1En1FwJmMRpm3nMbptxPP29mLwDwTdrBHT9uARaN4D1FWX0028fGGDALLT6RiREpMi82+NS77iGqUjltTZomFx8DntIOvs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Topic: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Index:
 AQHYSyUS0CLVSvR2nk+ITbzc2Ry0wKzlusgAgAAH7oCAAAy5gIAADjGAgAAPS4CABIA3gIAABA2AgAAUGYA=
Date: Mon, 11 Apr 2022 10:20:38 +0000
Message-ID: <74450613-4B05-4FB7-84F7-A26EAC3CEA20@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
 <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
 <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
 <0a85f239-dbf8-2e06-0158-75a1c1c40a4c@suse.com>
 <DC3522A8-ADA1-4F6A-A3CF-C8095C2F639D@arm.com>
 <e6450fd4-662a-abaa-4b9e-1d8a4ff41962@suse.com>
In-Reply-To: <e6450fd4-662a-abaa-4b9e-1d8a4ff41962@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7c8454cf-d8dd-4d5d-f4c1-08da1ba4f1b2
x-ms-traffictypediagnostic:
	AM0PR08MB4531:EE_|VE1EUR03FT050:EE_|AM6PR08MB4738:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB47384EDBC8DA80DDBB00BC2FE4EA9@AM6PR08MB4738.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6ZHTw8qW6wiXam7uEl638zFVkGfIstDGZ/0FjiGbgKKwCMkqf6/ZPSji/NU8d+AzguPNe5A68Z+eZ263eyAWvgFEj/d5fLM3CkEnvVWKCLVATHgljDljj+kqnduCohv/jIhVrm8zCmbmlt5eZ5raGY7IqLBhiTdGeARWnii/17PtZ067cOsjq160V7tW2HAaWeTmVAeTFRVRYkU1TSTxSyS1uQk6M314tdenjoUTu6H54she716yVSVXzHJd9K/EZOHSCU4w3LfRM8ui99GaV/WQR8LiiqrOILGcpDYBpwDlWrPu6Xz4LdT9uinpGwpsZ+H89n4dmQpewkKH2WHCFcjMh5KktJ/ZxeWk8r0RDNDTNEIkeBhrn5jJuBFuBBWgYPCictqiM/TvQa4wGAp7sG1sFVT43XG80HpuMPJJyII2JDJCyozxK5TQ3w7Vxt6wU2fhJu81ZGcs+tqoZ0yAJYDi6ctbTiu5Ot4HppU57QGYTcLMDXBKZOSw3DHcFIoegurAZoeB+6o4XTXtIV13gMenYKMxEOelaoey1Xwk5h7ETB6t5WL2CEORLx0qo0Z9V3TPPD6IbYTRD8Eiw3H7K9D5K8yRX+OfrD/QenqdR6+vS5WIRE7g/1xKiGlQHhZdqUSwe7E8f+82tbdlXLmAeNDLbAsMkNNVyQMk4nM8xxj2ZAxFmEgnD5rnK3QNqtSpG6ISC+Yhzl4C1si86WH0Dh1WjCajEXpFkvRHnXN6tHmreqCkgXTIPcB0gZVDjzvJW2FsETjvdn3rlF8hYrTjVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(5660300002)(66946007)(6916009)(66574015)(76116006)(66556008)(8676002)(6506007)(53546011)(4326008)(186003)(122000001)(66476007)(64756008)(6512007)(66446008)(86362001)(71200400001)(2906002)(508600001)(36756003)(2616005)(8936002)(55236004)(26005)(83380400001)(6486002)(38100700002)(91956017)(33656002)(316002)(38070700005)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6270428FC0A4114A96C0BD60E1B456F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4531
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f65b708c-a387-480f-7faf-08da1ba4ec89
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZEmyudcQKacyaevtg0bmme8e3O38ZIv8Hom8vK3pyzUQxR0Y+WNjIhB7Y5fB36h6SU6FOk2nqXsWvuGY49aca2GOmOeeC2ZRDWRuPvuctirQhuosaKuC93m5g8rqN2+8OoAVijhnhYhjT/kFGo60aeVFbNLlNI7bOHwmW9kKmU35RCUh5sQog/lJ3tM4r/gsR1rmvjK3sOsqL/NDCKEoDiF9b0prZ07kGx+L66RnxrlwmPbnz3X/Ggk94goVd7/K4X1EBOAh2togY25sFq/p4skYrFVWKZ3A4gfI3yLRfwDPFxTz73WSynfnUW9RIOhlJjv8ef/KUxC9q5Bf2bcVa/pCm0KorHivLWPDtYU+O0RvbouwvnqAqXc+GxhaNh9FZhxVxVwZxB+Yr38vOBOcCuiCN8O5HtdZRnlOs985eEcyJmG9C85eU3U92f2p3UWjKWnoZKaFONZ7UFtgmRF+geTLh68plbdBDrUun5uqdGa9eqjP8Waso2pkuDmR8/eA07L/+deXCqkK5z8JA7Mq4XiYZ8FvWONmjtdgTpG+77x8z8XZfU+K5uEQr6ufSmLy459uCLqm4UkMChxodoaXJpMhUpkysGeRM5W8EoSmN6CKDAcuYfrUt4t94N0ISYyS+wjubt8tNYJujXabwPGD5aL+JoD0rgb4EDFUScV2ZhHy2g13t6gRqVORFUoiqdbBG4BboQDTx/62HlPybIrRTQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(54906003)(36756003)(508600001)(82310400005)(40460700003)(47076005)(2616005)(356005)(81166007)(316002)(6486002)(70206006)(70586007)(8676002)(4326008)(6862004)(8936002)(53546011)(5660300002)(6506007)(2906002)(186003)(66574015)(6512007)(36860700001)(26005)(336012)(83380400001)(33656002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:20:46.8876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8454cf-d8dd-4d5d-f4c1-08da1ba4f1b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4738

DQoNCj4gT24gMTEgQXByIDIwMjIsIGF0IDEwOjA4LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEuMDQuMjAyMiAxMDo1NCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiA4IEFwciAyMDIyLCBhdCAxMzoxMCwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+PiBPbiAwOC4wNC4yMDIyIDEzOjE1LCBMdWNhIEZhbmNlbGx1
IHdyb3RlOg0KPj4+Pj4gT24gOCBBcHIgMjAyMiwgYXQgMTE6MjQsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAwOC4wNC4yMDIyIDExOjM5LCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4+Pj4+PiBPbiA4IEFwciAyMDIyLCBhdCAxMDoxMCwgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4gT24gMDguMDQuMjAyMiAxMDo0
NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+IEBAIC0xMDYsNiArMTA2LDggQEAgc3Ry
dWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsNCj4+Pj4+Pj4+IC8qIFBlci12Q1BVIGJ1ZmZl
ciBzaXplIGluIGJ5dGVzLiAwIHRvIGRpc2FibGUuICovDQo+Pj4+Pj4+PiB1aW50MzJfdCB2bXRy
YWNlX3NpemU7DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+ICsgdWludDMyX3QgY3B1cG9vbF9pZDsNCj4+
Pj4+Pj4gDQo+Pj4+Pj4+IFRoaXMgY291bGQgZG8gd2l0aCBhIGNvbW1lbnQgZXhwbGFpbmluZyBk
ZWZhdWx0IGJlaGF2aW9yLiBJbiBwYXJ0aWN1bGFyDQo+Pj4+Pj4+IEkgd29uZGVyIHdoYXQgMCBt
ZWFuczogTG9va2luZyBhdCBjcHVwb29sX2Rlc3Ryb3koKSBJIGNhbid0IHNlZSB0aGF0IGl0DQo+
Pj4+Pj4+IHdvdWxkIGJlIGltcG9zc2libGUgdG8gZGVsZXRlIHBvb2wgMCAoYnV0IHRoZXJlIG1h
eSBvZiBjb3Vyc2UgYmUNCj4+Pj4+Pj4gcmVhc29ucyBlbHNld2hlcmUsIGUuZy4gcHJldmVudGlu
ZyBwb29sIDAgdG8gZXZlciBnbyBlbXB0eSkgLSBKw7xyZ2VuPw0KPj4+Pj4+PiBZZXQgaWYgcG9v
bCAwIGNhbiBiZSByZW1vdmVkLCB6ZXJvIGJlaW5nIHBhc3NlZCBpbiBoZXJlIHNob3VsZCBpbW8g
bm90DQo+Pj4+Pj4+IGxlYWQgdG8gZmFpbHVyZSBvZiBWTSBjcmVhdGlvbi4gT3RvaCBJIHVuZGVy
c3RhbmQgdGhhdCB0aGlzIHdvdWxkDQo+Pj4+Pj4+IGFscmVhZHkgaGFwcGVuIGFoZWFkIG9mIHlv
dXIgY2hhbmdlLCBwcmV2ZW50aW5nIG9mIHdoaWNoIHdvdWxkDQo+Pj4+Pj4+IGFwcGFyZW50bHkg
cG9zc2libGUgb25seSB2aWEgcGFzc2luZyBDUFVQT09MSURfTk9ORSBoZXJlLg0KPj4+Pj4+IA0K
Pj4+Pj4+IFBvb2wtMCBjYW7igJl0IGJlIGVtcHRpZWQgYmVjYXVzZSBEb20wIGlzIHNpdHRpbmcg
dGhlcmUgKHRoZSBwYXRjaCBpcyBtb2RpZnlpbmcNCj4+Pj4+PiBjcHVwb29sX2lkIG9ubHkgZm9y
IERvbVVzKS4NCj4+Pj4+IA0KPj4+Pj4gQnV0IHdlJ3JlIHRhbGtpbmcgYWJvdXQgZG9tMGxlc3Mg
YXMgcGVyIHRoZSBzdWJqZWN0IG9mIHRoZSBwYXRjaCBoZXJlLg0KPj4+PiANCj4+Pj4gRG9tYWlu
cyBzdGFydGVkIHVzaW5nIGRvbTBsZXNzIGZlYXR1cmUgYXJlIG5vdCBwcml2aWxlZ2VkIGFuZCBj
YW7igJl0IGRvIGFueSBvcGVyYXRpb24NCj4+Pj4gb24gY3B1IHBvb2xzLCB0aGF04oCZcyB3aHkg
SSB0aG91Z2h0IGFib3V0IERvbTAuDQo+Pj4gDQo+Pj4gSXQncyBhbGwgYSBtYXR0ZXIgb2YgWFNN
IHBvbGljeSB3aGF0IGEgZG9tYWluIG1heSBvciBtYXkgbm90IGJlIGFibGUNCj4+PiB0byBjYXJy
eSBvdXQuDQo+PiANCj4+IFllcyB5b3UgYXJlIHJpZ2h0LCBob3dldmVyIEkgZGlkbuKAmXQgc2Vl
IHNvIGZhciB0aGlzIHVzZSBjYXNlIHdpdGggYSBkb21VIGFuZCB0aGUgdG9vbCBzdGFjaywNCj4+
IHByb2JhYmx5IGJlY2F1c2UgaXQgd291bGQgbmVlZCBhbHNvIHhlbnN0b3JlIGV0Y+KApiBJ4oCZ
bSBhd2FyZSB0aGF0IHRoZXJlIGlzIHNvbWUgd29yayBnb2luZw0KPj4gb24gdG8gZW5hYmxlIGl0
IGFsc28gZm9yIGRvbTBsZXNzIGRvbVVzLCBzbyBteSBxdWVzdGlvbiBpczoNCj4+IA0KPj4gRG8g
eW91IHNlZSB0aGlzIGFzIGEgYmxvY2tlciBmb3IgdGhpcyBwYXRjaD8gQXJlIHlvdSBvayBpZiBJ
IHNlbmQgdGhpcyBwYXRjaCB3aXRoIGp1c3QgdGhlIGNvbW1lbnQNCj4+IGJlbG93IG9yIGluIHlv
dXIgb3BpbmlvbiB0aGlzIHBhdGNoIHJlcXVpcmVzIHNvbWUgb3RoZXIgd29yaz8NCj4gDQo+IEFn
cmVlbWVudCBsb29rcyB0byBiZSB0aGF0IHRoZXJlIHNob3VsZCBiZSBwcmVjYXV0aW9uYXJ5IGNv
ZGUgYWRkZWQNCj4gdG8gcHJldmVudCB0aGUgZGVsZXRpbmcgb2YgcG9vbCAwLiBUaGlzIGltbyB3
YW50cyB0byBiZSBhIHByZXJlcQ0KPiBjaGFuZ2UgdG8gdGhlIG9uZSBoZXJlLg0KDQpTaW5jZSB3
ZSBoYXZlIHRoZSByZXF1aXJlbWVudCBvZiBoYXZpbmcgY3B1MCBpbiBwb29sLTAsIEnigJltIHRo
aW5raW5nIGFib3V0IGEgY2hlY2sgdG8gZG9u4oCZdCBhbGxvdw0KQ3B1MCB0byBiZSByZW1vdmVk
IGZyb20gcG9vbC0wLCB0aGF0IHdpbGwgY292ZXIgYWxzbyB0aGUgZGVzdHJveSBjYXNlIGJlY2F1
c2Ugd2UgY2Fu4oCZdCBkZXN0cm95DQphIGNwdXBvb2wgdGhhdCBpcyBub3QgZW1wdHkuDQoNCklu
IHlvdXIgb3BpbmlvbiBpcyBpdCBvayB0byBwcm9jZWVkIHdpdGggYSBzZXBhcmF0ZSBwYXRjaCBh
cyBwcmVyZXEgd29yayBoYXZpbmcgdGhpcyBjaGFuZ2U/DQoNCj4gDQo+IEphbg0KDQo=

