Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2966B9D9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478470.741688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLSS-0007Iu-66; Mon, 16 Jan 2023 09:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478470.741688; Mon, 16 Jan 2023 09:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLSS-0007H3-35; Mon, 16 Jan 2023 09:07:12 +0000
Received: by outflank-mailman (input) for mailman id 478470;
 Mon, 16 Jan 2023 09:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1ZZ=5N=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pHLSR-0007Gx-3E
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:07:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2085.outbound.protection.outlook.com [40.107.14.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2737d73f-957d-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 10:07:08 +0100 (CET)
Received: from DB6PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:6:2a::20) by
 AS2PR08MB10034.eurprd08.prod.outlook.com (2603:10a6:20b:64b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 09:07:06 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::84) by DB6PR07CA0058.outlook.office365.com
 (2603:10a6:6:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Mon, 16 Jan 2023 09:07:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 09:07:05 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Mon, 16 Jan 2023 09:07:05 +0000
Received: from a35adcd54538.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1C9024E-6031-4696-AC70-00F477C47BC0.1; 
 Mon, 16 Jan 2023 09:06:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a35adcd54538.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Jan 2023 09:06:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 16 Jan
 2023 09:06:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 09:06:52 +0000
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
X-Inumbo-ID: 2737d73f-957d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zog7tXTO/VoC0WmG7Bj7yCLW/uq66futVr1cwAL01Lg=;
 b=7N/TLZk227hAe+Wvwky1KqpUVwk434hjbZanbMFZ0RlkfVWkpU9KZCskCiXM2LLSkc9KFSS6ksme9E8DdUW6zQtmV04Fao7zeDb8cv64e6M6SmC4aWu/PG5+0f7V4L6Gdry4KZOGShrJHYf0zJc70M6wnHdqiumj75AfuU/MEjY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6573d5a856029f0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvKKRcvQRWGLFKh48XsNb4WC1+OQp9KwpTzk/uYl56Ef5lcmH+JW6Nm1D9f4mKLzTDZaut5tsoRYmOEfcFjH7RlZafKxiQvw4QOfOtO1G3obso6M9Oiw+aMSGH7x4Hr9WlyOlFlolGHTr8kAS072QJfwwu7+AN2yKBT21Icet4tEACOzwPmB6jWIGYxotl1islS2ImLS73/rBOX/mEkTjDV68Coi292g6bUC94P0B3QTMTBDEOS/E0uOelzL+ieStr3GF/8yAm4nH5vBphfzkYMa3NJBDYqbJgBEsNT0WXGqZrpYT04t8uxy4JWveYjNZhARm++MVXrzGkszHc/tLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zog7tXTO/VoC0WmG7Bj7yCLW/uq66futVr1cwAL01Lg=;
 b=Fy7UqKQuVbCJilY2kDgHeKKB7x8UYK8hi6+UQHN++QOIQS7RADEqDKU4hBCb6x4QfyJsIWHI0GxLdakd3vsdSZeW74FwMGvEOdXXG688KnHUEaLi1av9BEbfUAWYn2ofyPcmfh5GeEcASftGE7IA4wzp8Xqx4CVS3LLFE2wm8nx1ukLDXQsWEyjD1Y7iLEakO/olNNPYeJF2XAqUHcMcg8mLWXqkOyZ15dRi4w1h2vIWePiupLFg4V4uezbB98nD37modU63jnnO0OVWZ+Ge4WVh49WRQiv/vkgCWZqu4XqMkT7+S+buG5IFx9453shDfMAcviBNcJ8Y3gju5HaO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zog7tXTO/VoC0WmG7Bj7yCLW/uq66futVr1cwAL01Lg=;
 b=7N/TLZk227hAe+Wvwky1KqpUVwk434hjbZanbMFZ0RlkfVWkpU9KZCskCiXM2LLSkc9KFSS6ksme9E8DdUW6zQtmV04Fao7zeDb8cv64e6M6SmC4aWu/PG5+0f7V4L6Gdry4KZOGShrJHYf0zJc70M6wnHdqiumj75AfuU/MEjY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 14/14] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Topic: [PATCH v4 14/14] xen/arm64: smpboot: Directly switch to the
 runtime page-tables
Thread-Index: AQHZJzoPSgWN5vNZ70iPu83PQrLhuK6cnmWAgAQm2IA=
Date: Mon, 16 Jan 2023 09:06:51 +0000
Message-ID: <69C4635C-1C1D-4F00-813B-83DF9E6D825D@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-15-julien@xen.org>
 <8A0AD684-FB21-46B3-A0C9-DE0BF67030D0@arm.com>
In-Reply-To: <8A0AD684-FB21-46B3-A0C9-DE0BF67030D0@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9038:EE_|DBAEUR03FT041:EE_|AS2PR08MB10034:EE_
X-MS-Office365-Filtering-Correlation-Id: ee22c2b7-b26d-4a8b-bb14-08daf7a10a31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9hgNX8IFEgFUQHJqP09qb/9YoRegdHUvCJ9mlPFTpYc1Abe6whIGvLseh5fZmTz3ZUOM9VYAgW5oZbykJ1ZP/wvhGULOG+bQxtIOSYbdOaFuqek7oxoUpZPtjRxDUy+SsGNlVtG2ezD7xMHkpEQJKG9DUJSsn4jmhqciClM8HWgisNjmrVIaYIkR61KnJJ6P9j0UYS9UDsRKhsXC8QeepLxosBwRBu0PY7akQSeoSBt1jwMrcQKN/+xBDved2cIFAQcyuIcMBZYaP6So2Unm27m35z1o6Zgr2ElGcZcoVQ0zC/MjxxBRaeN8+k9pytbGx5OVxsJfAdXiJIXp8FxrkmCfX5KI51OVJJ0dxynDjFSsUfl9y/k2eBpHhDL82j87VhWpSL7kF8NP0OpEXCt0BqmyD4KVQ4C9zfUMi87kCCdzWrHnvM+FgF2an4KT2bRUaBUY4yIVU/qf5Nx7DJ3L3Ek4ueyocTes6PaIIY6dgKbN6OWnpcfseJSwio591VxEENta/SlMb/RVXkbkD2w6lLYELkunM20ucSiWBp5PKauE5uVTVbBXvL9Shi8e8qc8jPAdzEPrHwtqUES/5A4Oe3MHpKzZF5EnIdOIdIoArg7gNhakb8QaHkX2+VUs6r/Hh3+OMgp5cdG1DJFgHZ4LUqbrRhUWqBHbuCzd8PslcK6V/dMy+w5WokLKV1ZNAeqJGkhxd91uwU1euZGW5t8xq6+qY9AyPCjA5NbcX+QaOAg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199015)(38070700005)(122000001)(2616005)(558084003)(38100700002)(86362001)(6916009)(6486002)(316002)(71200400001)(478600001)(33656002)(54906003)(8676002)(8936002)(66946007)(66556008)(5660300002)(41300700001)(66476007)(4326008)(2906002)(66446008)(76116006)(91956017)(186003)(6506007)(64756008)(26005)(6512007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB9A791146A81E42B5C19672046F9CFB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2f7d13a-9729-4ead-fd23-08daf7a101d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eITWi53Wi3jLawltHGGhglIq/0ywB4yeDtdvoBIuChU+Ea4OYjrX+PH/1/VY6xMDp1n+0aAxCarTPw5tqHfgWcW7+KJj0ss+/o0KJel4yF96wZwvNZFsE2EByF3XLKSXX/IlfWgY3E4+ylzvRaUewHqqYkx/P9y9X8VNCeDL25IZOIhpmPx1sw3bHwbaY0R3TaGHatspRZQu8DfOD+XCDeb/3Xfel21SvGdiuLTHTzpzhcXnKYEELlPUdbP2l4AiKH9z0RPwQSuAWM27Gp4+vLSpuCu+taLQ7+naYgbnPxzg0/jcsEeOOxIsOero9vACK0YFO7jcFg74qHoRZf/H5DC17pgWc8sx8ybaJ86vjinkmo5KIe83INYxYU79DrZRlhqBkekCtQoRymn3/uDh5R01g/JZLx1h/BV21QFe+iomlTvmE2M3/uhB5HqEFYbw5XZVFPkl7eSoeVTNVpoVp473rkFJmEpphDF+LzcdL6wKYG5/GtVYW1yEMjyD+pwEqD2dbJx92UvBqRD5APYAXk0e5s/aP+dStUgf6moHvFhGHxIOF/mo4s9Q95cM8fuVe+okh1iYKt0QzB02ZCy96htfNdzms67HUu3rfIGOJtTBXEwJtVJcpp8bUbJVSZz5VsYs+w5Hu5da8cRmq/7eQ17vLqvUwoSGKXSRHOlXHOEUMF872loICE+2PkcayW9YNr6ZjyIN32ic9/MpdHNOQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(33656002)(558084003)(47076005)(82740400003)(5660300002)(41300700001)(2906002)(6862004)(86362001)(8936002)(81166007)(36860700001)(70206006)(82310400005)(336012)(40480700001)(6486002)(54906003)(70586007)(356005)(40460700003)(6506007)(478600001)(8676002)(107886003)(316002)(4326008)(6512007)(26005)(186003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 09:07:05.9016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee22c2b7-b26d-4a8b-bb14-08daf7a10a31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10034

DQpIaSBKdWxpZW4sDQoNCj4gDQo+IEnigJl2ZSBsZWZ0IHRoZSBib2FyZHMgdG8gdGVzdCBhbGwg
bmlnaHQsIHNvIG9uIE1vbmRheSBJIHdpbGwgYmUgMTAwJSBzdXJlIHRoaXMgc2VyaWUNCj4gSXMg
bm90IGludHJvZHVjaW5nIGFueSBpc3N1ZS4NCg0KVGhlIHNlcmllIHBhc3NlZCB0aGUgb3Zlcm5p
Z2h0IHRlc3RzIG9uIG5lb3ZlcnNlIGJvYXJkLCByYXNwYmVycnkgcGkgNCwgSnVubyBib2FyZC4N
Cg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

