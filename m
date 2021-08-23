Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F03F46DE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 10:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170245.310985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5cV-0004uy-2t; Mon, 23 Aug 2021 08:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170245.310985; Mon, 23 Aug 2021 08:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI5cU-0004sO-US; Mon, 23 Aug 2021 08:47:50 +0000
Received: by outflank-mailman (input) for mailman id 170245;
 Mon, 23 Aug 2021 08:47:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HaWV=NO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mI5cT-0004sI-30
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 08:47:49 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8d5ac5c-03ee-11ec-a869-12813bfff9fa;
 Mon, 23 Aug 2021 08:47:45 +0000 (UTC)
Received: from DB8PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:10:100::38)
 by PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 08:47:43 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::15) by DB8PR06CA0025.outlook.office365.com
 (2603:10a6:10:100::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Mon, 23 Aug 2021 08:47:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 08:47:43 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Mon, 23 Aug 2021 08:47:43 +0000
Received: from 3a0835581fc0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD29BEC3-8ACA-4CE4-8697-38D03D518858.1; 
 Mon, 23 Aug 2021 08:47:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3a0835581fc0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Aug 2021 08:47:37 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5736.eurprd08.prod.outlook.com (2603:10a6:10:1a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Mon, 23 Aug
 2021 08:47:36 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 08:47:36 +0000
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
X-Inumbo-ID: c8d5ac5c-03ee-11ec-a869-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo/zjycK8UgiXNY+K+niGF/tmvjW1iywlGXgjhHlpas=;
 b=V9/jYFfLZvv0cExnw2Bk8HYpC8RGTv3fbI4z00aTvEqngbhHRqVlwAPCclsFlbEoYxVCS8shk/22F4qa1P2MvDVECkQu60mR9QC5DzE+ovtbyGPqTiFWJMWAGu5AQh/p+EXfgLxKsVaQSvynatyhRtE6uKKQK0WrcP1wRpDQnWE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5vM6eVQojxtg6LshR+5uMQj6QTk9M/PLEmgiMYt2hNPhxv+0ZH2BZJjZW1+J0KeqCAzqOzOMJc2/TCmafd7fnkJXtSsiGiPGSmLUEI/jduxX/uw6ZhRDhT0QmqTNUQQydOIAaFIP63Pd3+CjNBeha2wcvem31Y79xoKen50g5LK+L8vQRi/U3vNNkdTCQfcAdj9N3fv2YxN2rG0UjbuzN8Vwju2fFkp+H3ufT45jvVOTDiJlwe0GfMPmovrNbZLopX1dmIxBShJUGcaY8SKLTux07v6zTY/EAnq/ZXxFXmxwtDpIgkgGE/Gk93ZOEKbOmteeujIDKQNbZYW1K6KLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo/zjycK8UgiXNY+K+niGF/tmvjW1iywlGXgjhHlpas=;
 b=Z2C+g44wN5+8PQs2JRirktXZ8dcwV2BDa2dg6XfxviQgo9KZwFvGIOubJ+Ebk7buw6kmThAW9FUpf2y93dk0I78ybMbUXw3T1K7psWq7jKmg3aZXMhIj9UZsoDuatRxbq02an7sw17mWotfLf0tEZ60LnfxXUlAuuQsNZtMUggnyjnTFoJfLLX44lBZPLLCxION/5WoCZGIUHiGB3Jr9y3FowbStnLnouA/6gzzgeaqYpQaVUYjSNNdnp3UCm9Apy9sVGKgtB7BrJGDL3OYimScHSi9wb3Y3uyNSg3VfzMNOXmeT0Nwse/UJxD/TfXPIwZa5hB8DQR1xByeQ5GyIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo/zjycK8UgiXNY+K+niGF/tmvjW1iywlGXgjhHlpas=;
 b=V9/jYFfLZvv0cExnw2Bk8HYpC8RGTv3fbI4z00aTvEqngbhHRqVlwAPCclsFlbEoYxVCS8shk/22F4qa1P2MvDVECkQu60mR9QC5DzE+ovtbyGPqTiFWJMWAGu5AQh/p+EXfgLxKsVaQSvynatyhRtE6uKKQK0WrcP1wRpDQnWE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Topic: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
 device tree processor node
Thread-Index: AQHXjps9W9pBfq916EKAfG5ObJRyjat7LeMAgAWqo3A=
Date: Mon, 23 Aug 2021 08:47:35 +0000
Message-ID:
 <DB9PR08MB6857D1E22305A7878103EBC99EC49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <167bbcea-e797-c924-81d9-20e626e320cb@xen.org>
In-Reply-To: <167bbcea-e797-c924-81d9-20e626e320cb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 49F2D1EF5E8E6240AF262F4D3876E239.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 64b84b11-a22d-40e0-5caa-08d96612ac48
x-ms-traffictypediagnostic: DBAPR08MB5736:|PR3PR08MB5852:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB58520BC8BBB8D61D91A16AB59EC49@PR3PR08MB5852.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ppVfolWnhAF9My/rOIqTD+L7cyc6awZ8s/BPieb864+1Z1W81ggRl4qqNP3QYtdiesl8grllnEBDs15ASXYKeWYdJa6+z9lf8E2SSLgWV1mIrI+CUgiBHYHMY+QoF5D5oGDIP4tV4aQcNnS975zf6jEgrb3bJAJgmCT1378Q20C/mQywRdhbz0mPA7Ul+pHNSk/v9gKyqiO5wNZZWzBaQQ7gFoqNKh1oP0J4JO1MswfweScbdkWjRrJeXqQ1a/nt/syms2TNvcBMeM4i3RFj2lF27BPhI8mRO7PIGcPgNKoDtjUZjzRmKorjzdyJwbrw+YZIe49+HEcPeUpJkUmPKjYbD8cSDeXM+3KlEK5W4i45FgdsxqigznvDHWY0wc9SChSv98cX8fqAUl7s4jo2DnpiyjlNO9TobA3PqTfxN7ZfBvB5sMXVF01TLT114YxJf/73T7H7ul8l715VE9C5wmDbWujXsy+5bjXvU15CjzqABf7RCoWctJE6Soog9RsMAGAMaa0wUYpEggEoRqMVpPZrQ/L5l2quuT4MDuEFx/rs3F9J/28S4vOD8mo/IITRfcvYx5sq5Y8KANeLC6LkvLhW/U0Ae22ZI6YW9uJW+g6Sah42DmoLT8Cn0QUu+ryNJyWC/1SuulnqIw6dTLXNCUlWko6yL25QRHQ9yBpPy4LfQJaaAZJ+L0b+sesyyLK+1I83gmCgF12tBbKZd6RYVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(186003)(8936002)(38100700002)(122000001)(6506007)(26005)(478600001)(53546011)(66556008)(8676002)(64756008)(66476007)(66446008)(71200400001)(9686003)(66946007)(55016002)(76116006)(52536014)(316002)(38070700005)(4326008)(110136005)(5660300002)(7696005)(86362001)(2906002)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWkzbVphNlZ6R3E5TS9pajdpU05nc005SVIyeUFWUGVqeGhlblozYkcyeksw?=
 =?utf-8?B?T0RNMGw3WGttendZeHBwK05jMHRTSjgzclJGR3R1aHVtRW1DNmtwTGd2MmNJ?=
 =?utf-8?B?eTZNYlFxeExaRlZRT3Qva1R1M0hLSUpJNmRGUkVvaFpoNVRpWS94OFJmV1h2?=
 =?utf-8?B?cHNhQVJ2MzFpNUtpblNETW90MGhEd3JyRG1LUU5ycVhqVEE1eGg4ZndrdlpS?=
 =?utf-8?B?MnJwNHVmOEFPTVh6S0dFbUJrZ29LeURGVFE4NWhSZjdOTUY4TVVBQmdscmpJ?=
 =?utf-8?B?L21WS2FjZWllb1VGOUQvclFYMUJ6NGRGWFVETkdCOWYwUVpvL0p0ckFMcnJT?=
 =?utf-8?B?SHlwTnZLczhGRUw4OWM2M24xQk9sZGtLZHBjVkRSVCs4eHc2Um9vNmcvN0Uv?=
 =?utf-8?B?UXl4TnBZc2pITEx3QVdyYWFLenRLRldJbG14N3oyRFovU2dwNmtobUg3S0ZV?=
 =?utf-8?B?aDZvN2JHYmtjcHM2UFRhM1BmakFTcGh6MzY1d3gzekZXUU02TWprNndzLy9i?=
 =?utf-8?B?cStFK1NuOUNNL094dVFtZUYxbnFUYUQ3am43dTFzQUtMT2JQVFpqNXZHUTFO?=
 =?utf-8?B?SEFWYlRvY09mYS9IWXN3TndiZnRaaENBNXFVWCs0YjM0S21XOTFEYUFOT3dS?=
 =?utf-8?B?L2ZqcGFSZFIzVTB4VW1xdkw0cDBGMWdVMHhMSmM2NGRScmNBcFRTVytjdTMx?=
 =?utf-8?B?dnpYSlJNaGkxOXExQUk1Y1NvOUV0ZGxjTnArbzFxeU0xc3NoVjB2N2hlRUx1?=
 =?utf-8?B?MU9PYTRCckNGZmdJRllwVXBCTVNYZ3ljait5TUUyMkNiTWs4M0J4blZkdzMz?=
 =?utf-8?B?OFJSbG03V1M5Q1ZIQU5FVHkwSlRRYllRSUpvY2k1WkJ6Y0QzbS9rSHVHL3ZK?=
 =?utf-8?B?blBsZlJBS2tiZ1hCOU9MMXFlOFcwcmZNazc4dmJKUm9iTWxabzRwWHdxZ0Ro?=
 =?utf-8?B?T2JEMVp2blZQelhUUmROWjhPalNZSEpoREpaODBmMGFXZmhIUk9BL2w4RUFF?=
 =?utf-8?B?WUtnMU5hWThWb3N1WjBEQU1Zd1pGdFVCc2dDenA3U0k1Rmd6K3dTR0JQT3pV?=
 =?utf-8?B?VnYrcHZOekMvU0FLMktod0dUZHB0UjFLYmdHYnJXVjFlVmRWeWkrN0JER25X?=
 =?utf-8?B?Ri9uTU1yQ0JURUl0ajhGOG4wZzlmSmNDSStLUTRoV1kwRktWTnVTQXZPOEV0?=
 =?utf-8?B?c1RlVmZ4bVl5dysxMDhENVlJNTRIM2JUbkcwVGJSUCtjZGIzRkRkV3oyVGMz?=
 =?utf-8?B?VC9zVGpQMjFFTlBieDY5bUkrNXRmcUFobXRxc3BTRURRNmtDK3ZVcXpjNkdi?=
 =?utf-8?B?ZDIxQ1FqSVpFMUwzalJzWlV4OTVLL2xRZGpTdjFIcGdqOXAyV0JBNVRNRjh2?=
 =?utf-8?B?dE5mSHpYU29uUnlYZ09PeFFzbXhHcUZiWWtGQklUZFBwbEw2SGZYZnBzU0Zo?=
 =?utf-8?B?RmNRbHdtekNwOVBMaURLeU1nODBNVEpVVFc4dHZBa3Ird3RJSHhSVms1eWcv?=
 =?utf-8?B?THNhcTZRL0Fqb0QvcmNsUDU2WUtHY1ZRY1IwOFZRTUFLTGRkQ0FMMXhkeVpH?=
 =?utf-8?B?YS9xOW1ZNGJ0MzVXR3QxazlDMFlVNjZRUUpIWEdQNkhlWW5OOVUwYUVoRmli?=
 =?utf-8?B?TWlKT2oyZXVVWHI0NzN6MzBwa1o1c3dxbVUxeTNLTXNZb2xlMnFCWHppNjNh?=
 =?utf-8?B?VE16d2pnT2dYUVVpNVl3RGJqYm11Q2U0aWY0cEh5RmJDYXNNNW54OHk0WXhM?=
 =?utf-8?Q?VVVpxdCDkpYthrRPzuPwhSCXYIRGw7RdIBCrh5J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5736
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80021382-5711-4f69-42a2-08d96612a7e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dhnOsyhIMjgrwfzbyo82xTeouDdNierwIhnKIF7CigoDCTgV4aSaaKSqG/4fuV/lPklu3YWRyyBd5kH7BDQw4VSagQ2JXDVp5YUHYOC44zZKm8JYVWU5J1LEt0GRxweK8rwVOUpdGRWZnZBlAZTGjmqlF4Mi6GzqPEJ22kJQvbMEKSPFainhdWyX9l22Vo9QOFjVBhTY8ekMA2zqU75KU2KqBZ70IqUVki34YHu8i6Af8FbsyE6jhlkfDKd9PHUCXtZVI01LxMF62xJIG1MQrwWlDtjnjJHwLCJq7gcikkLOltgcDA19ZVPe8k88Hq3x8qs3pSCAsGp8hJVShTDdh1OO/N1NmDAhUTxzUohV4Zzew/h86Q7zlhFEF4VWuyqOIpSSOpaeHs3EkOht4b8kEuh8rECL8ZHB4VMUSvv22hEsA5iUO39Lz9aatyxiRzRLJT+xYxY86iA+eEsAlwkbnq6bA+0ZWm0Ol+ZVoexfSaS+8O+4CP/O119lmfZrNr/ZyYK1fyvHW0pH1BUL/JavQZadERC9ztHdChPLvqnMP6y86dCAUed2nDSBPS6BgOUPJPSha427khyE3SQ62PUjGKNC9y/AG8ZRxlP7jvloM6kPFeFDO3R00+9ApAA0nkEBmRjlhKd+qWotOcJq/69tjzRXgnDfraPeywxw7VTAMlfxhXmR4cNIPQ/jESM6o+SgjZZ3jh/dRjPxouWdl1bbRQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(36840700001)(46966006)(83380400001)(81166007)(70206006)(8676002)(70586007)(33656002)(82310400003)(110136005)(8936002)(6506007)(53546011)(26005)(2906002)(4326008)(316002)(47076005)(7696005)(86362001)(356005)(336012)(55016002)(5660300002)(478600001)(9686003)(52536014)(36860700001)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 08:47:43.5443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b84b11-a22d-40e0-5caa-08d96612ac48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5852

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMjoxMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyMi80MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVy
IHRvIHBhcnNlDQo+IGRldmljZSB0cmVlIHByb2Nlc3NvciBub2RlDQo+IA0KPiBPbiAxMS8wOC8y
MDIxIDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBQcm9jZXNzb3IgTlVNQSBJRCBpbmZvcm1h
dGlvbiBpcyBzdG9yZWQgaW4gZGV2aWNlIHRyZWUncyBwcm9jZXNzb3INCj4gPiBub2RlIGFzICJu
dW1hLW5vZGUtaWQiLiBXZSBuZWVkIGEgbmV3IGhlbHBlciB0byBwYXJzZSB0aGlzIElEIGZyb20N
Cj4gPiBwcm9jZXNzb3Igbm9kZS4gSWYgd2UgZ2V0IHRoaXMgSUQgZnJvbSBwcm9jZXNzb3Igbm9k
ZSwgdGhpcyBJRCdzDQo+ID4gdmFsaWRpdHkgc3RpbGwgbmVlZCB0byBiZSBjaGVja2VkLiBPbmNl
IHdlIGdvdCBhIGludmFsaWQgTlVNQSBJRA0KPiA+IGZyb20gYW55IHByb2Nlc3NvciBub2RlLCB0
aGUgZGV2aWNlIHRyZWUgd2lsbCBiZSBtYXJrZWQgYXMgTlVNQQ0KPiA+IGluZm9ybWF0aW9uIGlu
dmFsaWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMgfCA0MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZp
Y2VfdHJlZS5jDQo+ID4gaW5kZXggMWM3NGFkMTM1ZC4uMzdjYzU2YWNmMyAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gKysrIGIveGVuL2FyY2gv
YXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+IEBAIC0yMCwxNiArMjAsNTMgQEANCj4gPiAgICNp
bmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9ub2RlbWFzay5oPg0KPiA+
ICAgI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUu
aD4NCj4gPiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+DQo+ID4gICBzOCBkZXZpY2VfdHJl
ZV9udW1hID0gMDsNCj4gPiArc3RhdGljIG5vZGVtYXNrX3QgcHJvY2Vzc29yX25vZGVzX3BhcnNl
ZCBfX2luaXRkYXRhOw0KPiA+DQo+ID4gLWludCBzcmF0X2Rpc2FibGVkKHZvaWQpDQo+ID4gK3N0
YXRpYyBpbnQgc3JhdF9kaXNhYmxlZCh2b2lkKQ0KPiA+ICAgew0KPiA+ICAgICAgIHJldHVybiBu
dW1hX29mZiB8fCBkZXZpY2VfdHJlZV9udW1hIDwgMDsNCj4gPiAgIH0NCj4gPg0KPiA+IC12b2lk
IF9faW5pdCBiYWRfc3JhdCh2b2lkKQ0KPiA+ICtzdGF0aWMgX19pbml0IHZvaWQgYmFkX3NyYXQo
dm9pZCkNCj4gPiAgIHsNCj4gPiAgICAgICBwcmludGsoS0VSTl9FUlIgIkRUOiBOVU1BIGluZm9y
bWF0aW9uIGlzIG5vdCB1c2VkLlxuIik7DQo+ID4gICAgICAgZGV2aWNlX3RyZWVfbnVtYSA9IC0x
Ow0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArLyogQ2FsbGJhY2sgZm9yIGRldmljZSB0cmVlIHByb2Nl
c3NvciBhZmZpbml0eSAqLw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBkdGJfbnVtYV9wcm9jZXNz
b3JfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2RlKQ0KPiANCj4gSSBmb3Jnb3QgdG8gYW5zd2Vy
LiBJdCBzZWVtcyBvZGQgdGhhdCBzb21lIG9mIHRoZSBmdW5jdGlvbiBuYW1lcyBzdGFydA0KPiB3
aXRoIGR0Yl8qIHdoaWxlIG90aGVyIHN0YXJ0cyBkZXZpY2VfdHJlZV8qLiBBbnkgcGFydGljdWxh
ciByZWFzb24gZm9yDQo+IHRoYXQgZGlmZmVyZW5jZSBvZiBuYW1pbmc/DQo+IA0KDQp5ZXMsIGlu
IHRoZSB2ZXJ5IGJlZ2lubmluZywgSSB3YW50IHRvIGtlZXAgZGV2aWNlX3RyZWVfIHByZWZpeCBm
b3INCmZ1bmN0aW9ucyB0aGF0IHdpbGwgaGFuZGxlIGR0YiBmaWxlLiBBbmQgdXNlIGR0Yl8gcHJl
Zml4IHRvIHJlcGxhY2UNCmFjcGksIHRvIGluZGljYXRlLCB0aGlzIGZ1bmN0aW9uIGlzIGRldmlj
ZSB0cmVlIHZlcnNpb24gbnVtYSBpbXBsZW1lbnRhdGlvbi4NCg0KSWYgdGhhdCdzIG5vdCB0aGUg
cmlnaHQgcmVhc29uLCBJIHdpbGwgdW5pZnkgYWxsIHByZWZpeCB0byBkZXZpY2VfdHJlZV8NCmlu
IG5leHQgdmVyc2lvbi4gSG93IGRvIHlvdSB0aGluayBhYm91dCBpdD8NCg0KPiA+ICt7DQo+ID4g
KyAgICBpZiAoIHNyYXRfZGlzYWJsZWQoKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKyAgICBlbHNlIGlmICggbm9kZSA9PSBOVU1BX05PX05PREUgfHwgbm9kZSA+PSBNQVhf
TlVNTk9ERVMgKSB7DQo+ID4gKwkJYmFkX3NyYXQoKTsNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gKyAgICBub2RlX3NldChub2RlLCBwcm9jZXNzb3Jfbm9kZXNf
cGFyc2VkKTsNCj4gPiArDQo+ID4gKyAgICBkZXZpY2VfdHJlZV9udW1hID0gMTsNCj4gPiArICAg
IHByaW50ayhLRVJOX0lORk8gIkRUOiBOVU1BIG5vZGUgJXUgcHJvY2Vzc29yIHBhcnNlZFxuIiwg
bm9kZSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8q
IFBhcnNlIENQVSBOVU1BIG5vZGUgaW5mbyAqLw0KPiA+ICtpbnQgX19pbml0IGRldmljZV90cmVl
X3BhcnNlX251bWFfY3B1X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSkNCj4gPiArew0K
PiA+ICsgICAgdWludDMyX3QgbmlkOw0KPiA+ICsNCj4gPiArICAgIG5pZCA9IGRldmljZV90cmVl
X2dldF91MzIoZmR0LCBub2RlLCAibnVtYS1ub2RlLWlkIiwgTUFYX05VTU5PREVTKTsNCj4gPiAr
ICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiQ1BVIG9uIE5VTUEgbm9kZToldVxuIiwgbmlkKTsN
Cj4gPiArICAgIGlmICggbmlkID49IE1BWF9OVU1OT0RFUyApDQo+ID4gKyAgICB7DQo+ID4gKyAg
ICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJOb2RlIGlkICV1IGV4Y2VlZHMgbWF4aW11bSB2
YWx1ZVxuIiwNCj4gbmlkKTsNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAg
IH0NCj4gPiArDQo+ID4gKyAgICByZXR1cm4gZHRiX251bWFfcHJvY2Vzc29yX2FmZmluaXR5X2lu
aXQobmlkKTsNCj4gPiArfQ0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg==

