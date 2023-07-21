Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA175C1E1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567410.886409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMliI-0005gd-JD; Fri, 21 Jul 2023 08:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567410.886409; Fri, 21 Jul 2023 08:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMliI-0005di-Fl; Fri, 21 Jul 2023 08:42:14 +0000
Received: by outflank-mailman (input) for mailman id 567410;
 Fri, 21 Jul 2023 08:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBn1=DH=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qMliH-0005dc-CZ
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 08:42:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae5984e-27a2-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 10:42:10 +0200 (CEST)
Received: from DUZPR01CA0248.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::21) by AS8PR08MB6519.eurprd08.prod.outlook.com
 (2603:10a6:20b:31c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 08:42:07 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5::4) by DUZPR01CA0248.outlook.office365.com
 (2603:10a6:10:4b5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Fri, 21 Jul 2023 08:42:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 08:42:06 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Fri, 21 Jul 2023 08:42:06 +0000
Received: from 814f76e212f1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D3E57C1-88BE-486F-BAEC-F2FF1C1E8EA6.1; 
 Fri, 21 Jul 2023 08:41:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 814f76e212f1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 08:41:59 +0000
Received: from PAXPR08MB7154.eurprd08.prod.outlook.com (2603:10a6:102:207::17)
 by PAVPR08MB9037.eurprd08.prod.outlook.com (2603:10a6:102:325::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 08:41:55 +0000
Received: from PAXPR08MB7154.eurprd08.prod.outlook.com
 ([fe80::a407:eeba:ce4c:92fd]) by PAXPR08MB7154.eurprd08.prod.outlook.com
 ([fe80::a407:eeba:ce4c:92fd%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 08:41:55 +0000
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
X-Inumbo-ID: 7ae5984e-27a2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFLNDGK6ZdG9qBMPg3KqiLFzH1UEEDw3w59IG3wE7vg=;
 b=+SABfGtQ3fWblFZqWRNOe3N5Tcr/JVBYE64Fdw04vpRFXMtbwAOfihJm08MCAyajL7M4QC5YGfYHJJ13z4vg4s3fjxpE2Wd4sv9pRuVO7j+kTOeNDYVoml+ZoM22tlDvMIpqaDNxYzTrQvbiHtJ8iWSDDFV2UzdONZ2gWIp8gaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e65a338c6165768
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhIjJIENMnEIQKo0FPCLVpyUbX6IUKPYlqzo21oxHkvq/8aHd6ZecRCRv0BUdQ9R3Mxw5f+hCvTQJE2f3b0h7OEJoy26ESWaIMq6vlSI4PZ1ASgaYWiSQ5MOTaX0nLQLScWJR/RSpMSBzNPIiciSsMg3+u++VZgfQ0anZd6AJO4Q7N+jOE7wk7zDSkYtGK0yMGkZuVQ126sG6zTn9hRjNZvbdkwmIWdNq0weCQEVr7Um9rRKaH1j3Wsaq/2dw8I7dAlv7rFzOMB+CaZVtMuwLGj+kAogHTe8ekAbPG+r2sxH0zDUMwnex2DvQCwquxGrlKt4AZCuAGU+6d0DnvOSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFLNDGK6ZdG9qBMPg3KqiLFzH1UEEDw3w59IG3wE7vg=;
 b=fiqEbBrsy+//7TPLNt26tdhGakzR6nKYW1uS8CLMMHkXbx7LIaYPlLMy42AiIdKwrdEqbGD45+nGb1c3PpbykEiUseLhxGcSvI+j6zJuteYzgWUr4BaHMeqg6SswbniOwh+cHPpass3MPJGDPkmAhZrc5lCnvH4hIfUZ0XlWYbU/5GFKuGnLhu+I+MszJxOZR5cmZu4+LJWE+76JWqmNf4qT+rfvmafCgguotvOdBdIKMfUTTSBdLsLrz8S156bsQxxbGR2aJYQx3Z65ExCUDRiAShrTkJxsXDuvVR5FYe+k15fqfZkgkN4p/J7Td6UL2L7MzwxQ5hr/ZafHh/5CAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFLNDGK6ZdG9qBMPg3KqiLFzH1UEEDw3w59IG3wE7vg=;
 b=+SABfGtQ3fWblFZqWRNOe3N5Tcr/JVBYE64Fdw04vpRFXMtbwAOfihJm08MCAyajL7M4QC5YGfYHJJ13z4vg4s3fjxpE2Wd4sv9pRuVO7j+kTOeNDYVoml+ZoM22tlDvMIpqaDNxYzTrQvbiHtJ8iWSDDFV2UzdONZ2gWIp8gaQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Thread-Topic: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Thread-Index: AQHZsHVYKpTUBSn+mE6nlUwGgqsPJ6+uJKeAgBWZSQCAAD9oAA==
Date: Fri, 21 Jul 2023 08:41:54 +0000
Message-ID: <EE71E2CE-0CDE-4A18-B5F5-DF62DC0602AB@arm.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <9A14CA15-2706-4907-A3D3-9A670CF9BAED@arm.com>
 <38cdc3b4-76de-d657-7fc7-f098ebea9d32@amd.com>
In-Reply-To: <38cdc3b4-76de-d657-7fc7-f098ebea9d32@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7154:EE_|PAVPR08MB9037:EE_|DBAEUR03FT037:EE_|AS8PR08MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebb0f54-ce30-4f3d-1b3d-08db89c65d48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m6XiYHiDHqGq0yEn0Q2Bq6AsQqxhR+Sy3QW607t6fsGubQMQ9vhEb0/ieqQ6Hwd0g2kCWpxZ8lO2nq/Tppq8WKZQWDO0ss6kj+xOnS5juvmxKcyfB0HUXjkp6dCykyHyrmeZDiSvTha4LCODgJUgJDO0wgLyqdxVPa6NVNmHovrV/wUNNLevU/Fdm6KMF51KdoVzFQ02bvn6pbEmzxcBhtPhXCvMnIvU1XCzTwDQ7akoacwa+5Zn3S3tMSx0XozZsjwsGwTZNqUAhe4Qj0+/vmGmfyl5xO6BbTX6/MX9Xf3ZdQF2iBSfiCJyhs306aJpzaKiufA3rqq6/u/qlsa7u3VkKNjGh9HYoqskA/nJTbktJI/PuCfYuBqX2BcXmQoA2AQs0c6vWLB8Mpe7HZSm5qt9UCpOGdDSw9PF+J89abWT2IiimjnNlk4whbkwJm2JHINEg06Q/ZE4GbWzTt2Tb+wJoWCpQEP3bpnXDbK6xNeVWv6fAqfgQTmk56lXdtmHQernhQ0Ps2B6n/v83/UbSIgBhbDELwNoGZv3ev34yDUv8uhV6VBGcOMRM6ThcppYMLb1NO9UPMw5dvzexHAQePUl1TC+iFd/cqizdRYkl94r7UiwbODtveSYCCwnmC33
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7154.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199021)(38100700002)(38070700005)(66899021)(2616005)(36756003)(83380400001)(91956017)(76116006)(66446008)(66556008)(66476007)(4326008)(2906002)(478600001)(316002)(66946007)(6916009)(64756008)(71200400001)(6512007)(6486002)(966005)(54906003)(26005)(186003)(41300700001)(8936002)(8676002)(6506007)(53546011)(5660300002)(122000001)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <320E83BC6FD9CE4BAC6A308CB4ED91FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9037
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d78557a3-702e-4bd0-3724-08db89c65666
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKMU6SIRTI5s8wU0Z2nY9wtMBCa2zobVQtc72i85TFkI0+C4F9PH7wxNrmw2B48hf2g5poSkDTKfr+eM5yTQiWb4eB1nY8QGHW7tKdEzHPQQoxcwatqO1Q/VoHFk4tjATPeHH0fxNHhPqJAHv8A7ryRjvXe2V4S4cTNlTvT5crT+rQoxZclQRjsboYIdFgeyEbO63G8CmJBtcDSkNA2is/KZCHhxgA8H5Sb9cN4jS37PaLGsBz5J1sy4mbAYC0pvkNliIp5MQQ9wY633h3g9YA8gNXtQNreQGm19voJfN97x8D/+92qLPZNIeD5ecPjH2rGRJN9/vv2DJ4gJOCb9SQapm1k/NLh0JTyg1zffK/tFYxfj++o3RbMC3uxRnkL1Iv1QlfCPIHbiN7YePB0kB36Nf1vqfwmwXbGHFpKZb/q4UocacO4tm4ZcFlcKgyneKt2Z6gS+zH1vBk5uO5EVMM5yhc3kzXiKtRn63KflBe/+k2N1j4xXcRESzUibpUiZ3BgksR2wbHio1utCpbeLJLTEd87zYKoBUwN/6L2ehpV2F9knDTfrqUOEuOZSdGNqWTQYgJHXiR2iFE7vT81VHZzPeHvNJoAGLHEGxfpyOHOhTmP5hdo8i4dFbCC9T5aweBQ7ExjJ5ClEYP/mHVW3TBLHMBV0DrgujfzL9MbaFNbbib6yFf80ke2jorrczZqdOSw4Q2BVuMjpWaW8ujb4QDK4abFaK/4KchdAxIU0cQE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(6506007)(40480700001)(53546011)(26005)(186003)(336012)(107886003)(66899021)(40460700003)(6862004)(41300700001)(5660300002)(36756003)(316002)(4326008)(54906003)(70586007)(70206006)(33656002)(478600001)(8936002)(8676002)(966005)(6486002)(6512007)(82740400003)(86362001)(83380400001)(47076005)(2906002)(2616005)(81166007)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 08:42:06.4437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebb0f54-ce30-4f3d-1b3d-08db89c65d48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6519

SGkgU3Rld2FydCwNCg0KPiBPbiAyMSBKdWwgMjAyMywgYXQgNTo1NCBhbSwgU3Rld2FydCBIaWxk
ZWJyYW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiA3Lzcv
MjMgMDc6MDQsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGkgU3Rld2FydCwNCj4+IA0KPj4+IE9u
IDcgSnVsIDIwMjMsIGF0IDI6NDcgYW0sIFN0ZXdhcnQgSGlsZGVicmFuZCA8U3Rld2FydC5IaWxk
ZWJyYW5kQGFtZC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IFJlbW92ZSBpc19oYXJkd2FyZV9kb21h
aW4gY2hlY2sgaW4gaGFzX3ZwY2ksIGFuZCBzZWxlY3QgSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0K
Pj4+IGluIEtjb25maWcuDQo+Pj4gDQo+Pj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0wNi9tc2cwMDg2My5odG1sDQo+Pj4gDQo+
Pj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRA
YW1kLmNvbT4NCj4+PiAtLS0NCj4+PiBBcyB0aGUgdGFnIGltcGxpZXMsIHRoaXMgcGF0Y2ggaXMg
bm90IGludGVuZGVkIHRvIGJlIG1lcmdlZCAoeWV0KS4NCj4+PiANCj4+PiBOb3RlIHRoYXQgQ09O
RklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQgaXMgbm90IGN1cnJlbnRseSB1c2VkIGluIHRoZSB1
cHN0cmVhbQ0KPj4+IGNvZGUgYmFzZS4gSXQgd2lsbCBiZSB1c2VkIGJ5IHRoZSB2UENJIHNlcmll
cyBbMV0uIFRoaXMgcGF0Y2ggaXMgaW50ZW5kZWQgdG8gYmUNCj4+PiBtZXJnZWQgYXMgcGFydCBv
ZiB0aGUgdlBDSSBzZXJpZXMuDQo+Pj4gDQo+Pj4gdjEtPnYyOg0KPj4+ICogbmV3IHBhdGNoDQo+
Pj4gLS0tDQo+Pj4geGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgIHwgMSArDQo+Pj4g
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oIHwgMiArLQ0KPj4+IDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+PiBpbmRl
eCA0ZTBjYzQyMWFkNDguLjc1ZGZhMmY1YTgyZCAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZw0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+Pj4gQEAgLTE5NSw2
ICsxOTUsNyBAQCBjb25maWcgUENJX1BBU1NUSFJPVUdIDQo+Pj4gZGVwZW5kcyBvbiBBUk1fNjQN
Cj4+PiBzZWxlY3QgSEFTX1BDSQ0KPj4+IHNlbGVjdCBIQVNfVlBDSQ0KPj4+ICsgc2VsZWN0IEhB
U19WUENJX0dVRVNUX1NVUFBPUlQNCj4+IA0KPj4gSSB0ZXN0ZWQgdGhpcyBzZXJpZXMgb24gdG9w
IG9mICJTTU1VIGhhbmRsaW5nIGZvciBQQ0llIFBhc3N0aHJvdWdoIG9uIEFSTeKAnSBzZXJpZXMg
b24gdGhlIE4xU0RQIGJvYXJkDQo+PiBhbmQgb2JzZXJ2ZSB0aGUgU01NVXYzIGZhdWx0Lg0KPiAN
Cj4gVGhhbmtzIGZvciB0ZXN0aW5nIHRoaXMuIEFmdGVyIGEgZ3JlYXQgZGVhbCBvZiB0aW5rZXJp
bmcsIEkgY2FuIHJlcHJvZHVjZSB0aGUgU01NVSBmYXVsdC4NCj4gDQo+IChYRU4pIHNtbXU6IC9h
eGkvc21tdUBmZDgwMDAwMDogVW5oYW5kbGVkIGNvbnRleHQgZmF1bHQ6IGZzcj0weDQwMiwgaW92
YT0weGY5MDMwMDQwLCBmc3lucj0weDEyLCBjYj0wDQo+IA0KPj4gRW5hYmxlIHRoZSBLY29uZmln
IG9wdGlvbiBQQ0lfUEFTU1RIUk9VR0gsIEFSTV9TTU1VX1YzLEhBU19JVFMgYW5kICJpb21tdT1v
buKAnSwNCj4+ICJwY2lfcGFzc3Rocm91Z2hfZW5hYmxlZD1vbiIgY21kIGxpbmUgcGFyYW1ldGVy
IGFuZCBhZnRlciB0aGF0LCB0aGVyZSBpcyBhbiBTTU1VIGZhdWx0DQo+PiBmb3IgdGhlIElUUyBk
b29yYmVsbCByZWdpc3RlciBhY2Nlc3MgZnJvbSB0aGUgUENJIGRldmljZXMuDQo+PiANCj4+IEFz
IHRoZXJlIGlzIG5vIHVwc3RyZWFtIHN1cHBvcnQgZm9yIEFSTSBmb3IgdlBDSSBNU0kvTVNJLVgg
aGFuZGxpbmcgYmVjYXVzZSBvZiB0aGF0IFNNTVUgZmF1bHQgaXMgb2JzZXJ2ZWQuDQo+PiANCj4+
IExpbnV4IEtlcm5lbCB3aWxsIHNldCB0aGUgSVRTIGRvb3JiZWxsIHJlZ2lzdGVyKCBwaHlzaWNh
bCBhZGRyZXNzIG9mIGRvb3JiZWxsIHJlZ2lzdGVyIGFzIElPTU1VIGlzIG5vdCBlbmFibGVkIGlu
IEtlcm5lbCkNCj4+IGluIFBDSSBjb25maWcgc3BhY2UgdG8gc2V0IHVwIHRoZSBNU0ktWCBpbnRl
cnJ1cHRzLCBidXQgdGhlcmUgaXMgbm8gbWFwcGluZyBpbiBTTU1VIHBhZ2UgdGFibGVzIGJlY2F1
c2Ugb2YgdGhhdCBTTU1VDQo+PiBmYXVsdCBpcyBvYnNlcnZlZC4gVG8gZml4IHRoaXMgd2UgbmVl
ZCB0byBtYXAgdGhlIElUUyBkb29yYmVsbCByZWdpc3RlciB0byBTTU1VIHBhZ2UgdGFibGVzIHRv
IGF2b2lkIHRoZSBmYXVsdC4NCj4+IA0KPj4gV2UgY2FuIGZpeCB0aGlzIGFmdGVyIHNldHRpbmcg
dGhlIG1hcHBpbmcgZm9yIHRoZSBJVFMgZG9vcmJlbGwgb2Zmc2V0IGluIHRoZSBJVFMgY29kZS4N
Cj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jIGIveGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMtaXRzLmMNCj4+IGluZGV4IDI5OWIzODQyNTAuLjgyMjdhN2E3NGIgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy12My1pdHMuYw0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3ZnaWMtdjMtaXRzLmMNCj4+IEBAIC02ODIsNiArNjgyLDE4IEBAIHN0YXRpYyBpbnQg
aXRzX2hhbmRsZV9tYXBkKHN0cnVjdCB2aXJ0X2l0cyAqaXRzLCB1aW50NjRfdCAqY21kcHRyKQ0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoc2l6ZSwgVUwp
LCB2YWxpZCk7DQo+PiAgICAgICAgIGlmICggcmV0ICYmIHZhbGlkICkNCj4+ICAgICAgICAgICAg
IHJldHVybiByZXQ7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGlzX2lvbW11X2VuYWJsZWQoaXRz
LT5kKSApIHsNCj4+ICsgICAgICAgICAgICByZXQgPSBtYXBfbW1pb19yZWdpb25zKGl0cy0+ZCwg
Z2FkZHJfdG9fZ2ZuKGl0cy0+ZG9vcmJlbGxfYWRkcmVzcyksDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUEZOX1VQKElUU19ET09SQkVMTF9PRkZTRVQpLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1hZGRyX3RvX21mbihpdHMtPmRvb3JiZWxsX2FkZHJlc3MpKTsNCj4+
ICsgICAgICAgICAgICBpZiAoIHJldCA8IDAgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAg
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkdJQ3YzOiBNYXAgSVRTIHRyYW5zbGF0aW9u
IHJlZ2lzdGVyIGQlZCBmYWlsZWQuXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGl0
cy0+ZC0+ZG9tYWluX2lkKTsNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsg
ICAgICAgICAgICB9DQo+PiArICAgICAgICB9DQo+PiAgICAgfQ0KPiANCj4gVGhhbmsgeW91LCB0
aGlzIHJlc29sdmVzIHRoZSBTTU1VIGZhdWx0LiBJZiBpdCdzIG9rYXksIEkgd2lsbCBpbmNsdWRl
IHRoaXMgcGF0Y2ggaW4gdGhlIG5leHQgcmV2aXNpb24gb2YgdGhlIFNNTVUgc2VyaWVzIChJIHNl
ZSB5b3VyIFNpZ25lZC1vZmYtYnkgaXMgYWxyZWFkeSBpbiB0aGUgYXR0YWNobWVudCkuDQoNClll
cywgeW91IGNhbiBpbmNsdWRlIHRoaXMgcGF0Y2ggaW4geW91ciBuZXh0IHZlcnNpb24uDQo+IA0K
Pj4gQWxzbyBhcyBwZXIgSnVsaWVuJ3MgcmVxdWVzdCwgSSB0cmllZCB0byBzZXQgdXAgdGhlIElP
TU1VIGZvciB0aGUgUENJIGRldmljZSB3aXRob3V0DQo+PiAicGNpX3Bhc3N0aHJvaWdoX2VuYWJs
ZT1vbiIgYW5kIHdpdGhvdXQgSEFTX1ZQQ0kgZXZlcnl0aGluZyB3b3JrcyBhcyBleHBlY3RlZA0K
Pj4gYWZ0ZXIgYXBwbHlpbmcgYmVsb3cgcGF0Y2hlcy4NCj4+IA0KPj4gVG8gdGVzdCBlbmFibGUg
a2NvbmZpZyBvcHRpb25zIEhBU19QQ0ksIEFSTV9TTU1VX1YzIGFuZCBIQVNfSVRTIGFuZCBhZGQg
YmVsb3cNCj4+IHBhdGNoZXMgdG8gbWFrZSBpdCB3b3JrLg0KPj4gDQo+PiAgICDigKIgU2V0IHRo
ZSBtYXBwaW5nIGZvciB0aGUgSVRTIGRvb3JiZWxsIG9mZnNldCBpbiB0aGUgSVRTIGNvZGUgd2hl
biBpb21tdSBpcyBlbmFibGVkLg0KDQpBbHNvLCBJZiB3ZSB3YW50IHRvIHN1cHBvcnQgZm9yIGFk
ZGluZyBQQ0kgZGV2aWNlcyB0byBJT01NVSB3aXRob3V0IFBDSSBwYXNzdGhyb3VnaA0Kc3VwcG9y
dCAod2l0aG91dCBIQVNfVlBDSSBhbmQgY21kIGxpbmUgb3B0aW9ucyDigJxwY2ktcGFzc3Rocm91
Z2gtZW5hYmxlZD1vbuKAnSkNCmFzIHN1Z2dlc3RlZCBieSBKdWxpZW4sIHdlIGFsc28gbmVlZCBi
ZWxvdyAyIHBhdGNoZXMgYWxzby4NCg0KPj4gICAg4oCiIFJldmVydGVkIHRoZSBwYXRjaCB0aGF0
IGFkZGVkIHRoZSBzdXBwb3J0IGZvciBwY2lfcGFzc3Rocm91Z2hfb24uDQo+PiAgICDigKIgQWxs
b3cgTU1JTyBtYXBwaW5nIG9mIEVDQU0gc3BhY2UgdG8gZG9tMCB3aGVuIHZQQ0kgaXMgbm90IGVu
YWJsZWQsIGFzIG9mIG5vdyBNTUlPDQo+PiAgICAgIG1hcHBpbmcgZm9yIEVDQU0gaXMgYmFzZWQg
b24gcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQuIFdlIG5lZWQgdGhpcyBwYXRjaCBpZiB3ZSB3YW50
IHRvIGF2b2lkDQo+PiAgICAgZW5hYmxpbmcgSEFTX1ZQQ0kNCj4+IA0KPj4gUGxlYXNlIGZpbmQg
dGhlIGF0dGFjaGVkIHBhdGNoZXMgaW4gY2FzZSB5b3Ugd2FudCB0byB0ZXN0IGF0IHlvdXIgZW5k
Lg0KPj4gDQoNCiANClJlZ2FyZHMsDQpSYWh1bA==

