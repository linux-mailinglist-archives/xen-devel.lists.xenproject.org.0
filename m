Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A66389D9D
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 08:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130609.244545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljc2T-0000z1-HZ; Thu, 20 May 2021 06:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130609.244545; Thu, 20 May 2021 06:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljc2T-0000wl-EQ; Thu, 20 May 2021 06:20:09 +0000
Received: by outflank-mailman (input) for mailman id 130609;
 Thu, 20 May 2021 06:20:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP7T=KP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljc2S-0000wf-8Y
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 06:20:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3142bfc-dfc6-4753-ad7c-8dbb38b82be9;
 Thu, 20 May 2021 06:20:07 +0000 (UTC)
Received: from DB6PR0802CA0036.eurprd08.prod.outlook.com (2603:10a6:4:a3::22)
 by AM9PR08MB7133.eurprd08.prod.outlook.com (2603:10a6:20b:41e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 06:20:05 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::26) by DB6PR0802CA0036.outlook.office365.com
 (2603:10a6:4:a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 06:20:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 20 May 2021 06:20:05 +0000
Received: ("Tessian outbound 3050e7a5b95d:v92");
 Thu, 20 May 2021 06:20:04 +0000
Received: from 71b7d577fada.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1592454B-588D-4407-8B66-A17F2E3B96FD.1; 
 Thu, 20 May 2021 06:19:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71b7d577fada.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 May 2021 06:19:59 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3725.eurprd08.prod.outlook.com (2603:10a6:803:b6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 06:19:55 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.035; Thu, 20 May 2021
 06:19:55 +0000
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
X-Inumbo-ID: b3142bfc-dfc6-4753-ad7c-8dbb38b82be9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uD7QjGj3hn/viJ6Ez140KSlsHTGhbOTBCU0UISPcGk=;
 b=+MRlyWzhN9McCRjAspkwmmzx1RV5HKxG0CJzRsycC3pG8hYUo9d29O6/KOolZuyf4tm4ZKJB//7TBepSR8R40S26aIO4OJlKmiyAGw4ZjulOZH4ZcxxrcvAFeFTeFQOcroP6cGiLYqOCw3nz+GFdY/7iEEegMKA326z0dWJRyvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK4MN0uNYcIdSSWF8ducPv4HquTkp0cHLadboJRjwbBClW6jaHM6UcX7mrexCPrxdfeJQJz3IjluDaOb4i+fr1HLzhdRBm8rNPIuHDEoFkoqXgQINo4uKZU8Vy1N6vnxUwSnE8XF6nddte4y1GPO80GBEKTVPhXXAf3bUzEZmJ6NQFdywuczB9l+SDW7TWcP/0XbbIRKi9tUp7Xq8/eKXR/lzBmpwy81RSt/62+9Z8g/kzpv6PjX1F1AAKyJdA10euxL9dBbzZ2f53Jvx5kYdc/KnzrKBKtChlbJE5JzCRPKuhfiUGwDXGSC/KvAqGlyK6u3RaotkGV1eImhSyj1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uD7QjGj3hn/viJ6Ez140KSlsHTGhbOTBCU0UISPcGk=;
 b=ie2GDteDn7pcTGYKPBtRbTLYbUm+Z1RI5wd4UBlDLzwxWLO+teiKvNvs3RjTdBQhN5TJ1xGOcOV0RKZYT+eqfAMquafGMWxntxxf+0P4cieGt5JaR7t1d4IDwwdO8/WWOkir0Xch20WQJiMC5bqEkIUnWZ4GLZWz+VcDzhBZHWKBpE4Xr95WKYvtjcjiYP+swyp7IIzZUzUmm1AZm/agUjM8VKQBy+lmE/DfrMuGTePHDDYBrutfvokiapE508U4y2nGMHOsxf9xibbYdKLnITyaOUHyWwJv0LKl2T7DyJKcnWLL5nfnMy0RWuxUFz2w0PgMoLvmX7n0tSuInY/7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uD7QjGj3hn/viJ6Ez140KSlsHTGhbOTBCU0UISPcGk=;
 b=+MRlyWzhN9McCRjAspkwmmzx1RV5HKxG0CJzRsycC3pG8hYUo9d29O6/KOolZuyf4tm4ZKJB//7TBepSR8R40S26aIO4OJlKmiyAGw4ZjulOZH4ZcxxrcvAFeFTeFQOcroP6cGiLYqOCw3nz+GFdY/7iEEegMKA326z0dWJRyvE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 03/10] xen/arm: introduce PGC_reserved
Thread-Topic: [PATCH 03/10] xen/arm: introduce PGC_reserved
Thread-Index: AQHXS6W8Xfb+Jc0d2U+rpPnqyW8lIKro/c8AgAEW9PCAASMugIAArd6w
Date: Thu, 20 May 2021 06:19:55 +0000
Message-ID:
 <VE1PR08MB52155DD56E548E98AE937CE8F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
In-Reply-To: <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8EBBB523F86A8445B971EEB7ED844952.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b935bd22-a4bf-4285-2767-08d91b574ef4
x-ms-traffictypediagnostic: VI1PR08MB3725:|AM9PR08MB7133:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7133E7163D83DEF4FC25470BF72A9@AM9PR08MB7133.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PkE75mFST7oJBX3mz7IJu/XaStgpzIAa+3fQmgh+avfgvo709abUqriGZfYSsgJ3BDPsTpnW1y8HG8hQkQEye5LLTuUc3Uv3KITWQEcKrkbDRAr+jle2kW9+u7xI5Asl8igf1qbHrLBOHZxu+zp8Aq1msYoS9b8CZBXS6vZKhhjb4WgSdeyoIDL5FClRZK9ecu/Pydvcm+RlRblbdJon4Z9Jt3emlmAvj3o2z/VBGZTsbh3diIUuY7XVP+8JnHUkHNR8R2NqThwggEBMnZit01JWDfxZD5tbyiMt7cXl/THZ8FOKjPukiWW2nr+qpw6fdLdnefy3HMjSkqoS6rRUz4rYzF9idXM3o3JZpSIWV3Zs3yeDaA+bdofYINVk6C7lyeejae4JQvQHDyf+aZa28FeRukAfmKJJmwAyWJ+wpizOsYR6r7VH8fjT1Z5qKSzJVUJEynEkaGS6+9Im9vcmNYfRAfDBDB8VukvJapbnqWPIjR31VjSjhPlvvWRd3M2ciR2vT9zgh4wLLFhsEpsWWZoZuw40lGOeAWsuexIYnMGb7ZN+ea/JnCJtyoBg/XZoHid1UeAS2ojxcNf9uAwgfnaJ31UuWauLBuqVkUcnkkY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(366004)(8936002)(186003)(9686003)(7696005)(33656002)(55016002)(26005)(4326008)(66556008)(83380400001)(6506007)(38100700002)(66446008)(66476007)(5660300002)(66946007)(53546011)(71200400001)(2906002)(86362001)(110136005)(122000001)(54906003)(316002)(8676002)(478600001)(76116006)(52536014)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UmpFN2tkZHAzVkpOR25BMGxjTjhjOTdtaTJiUjBISnV0ajVLTzNTQjU0bkF2?=
 =?utf-8?B?bW5ZQjkzaUtFWm5VQzAvejdHUlhQQlNKWDlZNGEvQ0Q0TUk2eUFXY2M3Wkoy?=
 =?utf-8?B?ZERNeCtLQ3I4SDZla095L2dsMVFabXhJZXkwTnZYU0xXQjlvUHE4Z3Rhd3BY?=
 =?utf-8?B?TTJqZUk3NlFtck8zV0lBNWNzVDZuY2ZiWjRPUWlHNkpucXZ0Z1R6YnlaSGJk?=
 =?utf-8?B?SGJPdHlIeHNrWHVaQmI3VlM4UFR1Y0JXNWZ3L1BFcmxkc3luWldCQ29vc1FZ?=
 =?utf-8?B?bWFoU3BMbzNpcW5BSUVudEtKeGhjUnBEa09FS0xGZ01kUTZZY1ZudEQwYWI2?=
 =?utf-8?B?Znc0M0J2SkpIYzdsTE4zK0JNUWhZV1g3VDdOVGNSNnpYTTRLaWVHUitPNFdr?=
 =?utf-8?B?RmhNY2JFUklvYXRXbWQ1U05rVDR6eFB2d3JPM2FOM21aWlNBT05MWHFNWHor?=
 =?utf-8?B?Z0RmbmxBSUhSeDI3QlpTQlBqN0JwTDFzNi9JYWMxNkVCTUZ6VFFrVWhoWWlT?=
 =?utf-8?B?eEppcGg3NUg5NGVGYW1FWnNScmhmTlo3YytJYWpFTlVPVi9xamxCZ1dWM2gz?=
 =?utf-8?B?bDVzUERZbVUvSXNyaU5hZWIzZ3ptY2dZTjcvWHhUUzZGSHVzMlVnbk1QeDBz?=
 =?utf-8?B?cHdnQXZmdU9IOU1RVTk5YTJEYmFTUUFneHd3UE5hNHFnbDF4SHF4cVZFRTJM?=
 =?utf-8?B?U3JTQ3VsaGQyQmdVSzJueEVpazk1RytTN2p5eW1wcnJuLzBLZU5QRnJuVHd3?=
 =?utf-8?B?S2pDTXlKWldVUXpWZkdrN3RITVdWU2YwbzJsWEVCZGR3ZXhSNnZEaWhrc25a?=
 =?utf-8?B?TDdmR3VGRm9NdkV6TzlDSlQyTnZwMmJ4eXRZdjFLN1lUcldsQWZFcXdMZTRo?=
 =?utf-8?B?bk01S2N0b3RZczV2K0haZFMzd2hIUjJrYVltdFJnZTl5QjQ4OVlIRGoxTnZL?=
 =?utf-8?B?Wk9PNFltYXpMOGVFVW9vejRVTjdjWVhnbTFQUVZzT1BXMjlvOXpNVmVIalNn?=
 =?utf-8?B?cks5Sll1YmNZREhLVWxibmJlTkxHN3p1aHpTbWlOcG1WZmRBcWNPb20xL0sr?=
 =?utf-8?B?SnF1RDZFdThjS1BSd2tUMytwUncxNG5ielN5YmxLNWYvRmxjc09UcjVGdDJw?=
 =?utf-8?B?Y2NEUGtta3EzamlwelhhNnM4ckVhQXllSDA2RGliM0ZKczd5Z2ZrMXBvYWxm?=
 =?utf-8?B?MW9NOGlobXZKeDlITUNIK2JrVHRFbDFlaDlDQXZxUDRqMFdTWkJxSTg3bXQr?=
 =?utf-8?B?UTRSWTkySjh5Yk5PZDVVb2oxZTBicVdjMU9pL0t3VGRqeHpEQ2tXVWtIS3NV?=
 =?utf-8?B?RmVYNEZPUklUaytwWGZaUCtSRXhocCtyT05YM1k5Sm5jMFJwSkRPdkRiUzdu?=
 =?utf-8?B?UndHb3p0R0cvUzFuQXV4M3BVamg4RHd4bFBnSTkzNmhzRTFlZS9YdTNoUnh6?=
 =?utf-8?B?SWdHY2xmcjFuSUR0ekpGdTdZUmlOVlpoV2pLdmFJRUIwS2V0aEZrQWdncEY0?=
 =?utf-8?B?UVR4cXJMeXU0T0R4TVVGcVFhcElCWFMxWGxUbUlsZFV1dGh4WVlFUXZyLzVC?=
 =?utf-8?B?TjlpM0xsbVJmNFRYZTQwc0RCOHg4SlRFOFJKZzV2UXhyU01rV2k0bTZLZFk0?=
 =?utf-8?B?VHdkbDdtT2pVWXBaMW9QZHVUNUlHNnhhUHNWekpoNVBVanhzblJ1Qkp0Kzly?=
 =?utf-8?B?T2NZRnRyajM4dFVvWGlsK09wRWc5c2RjZE9Oc3hFQ3hTdzErczArdTl3dmE2?=
 =?utf-8?Q?y2Ha3YMGhqCicBvJFdBx0KqD561ptvDTgX300TU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3725
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c269a0b8-2789-4615-5cd2-08d91b574987
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q/nruM7aBZQPGaJtdizMp9n01RlfsyAeTVXbAcH2N6Mbc9jxxy6dS81vqV+X7jCf51AgD7aYK9K/bL027qyvMjDgxXi1n/xhXZPfII+u67cKciQ7PSjI2Rs/5yleLcwMY2YtRaK8MrK8fExZuhq8W47B9Hr+j/sN8B5fFDY8n90IXOViNGF268vhJlfnM5GWW9cDOtrpk/tLX3T/mwHc2E1vFG/q4rh36JTG/gq7xJ0xmPUbC0hjnmVzllC4DrhmMjd5231M+9AYEFpNw2A95CSm4oJ+nWPhKD5VJaQR9k7Mgil0pUEavZyp5yS5Ui8iRY7QXlEDB1wRL5Jm27fbD0kE9yUuhM5OVE5L1VBT2vTZMIr8yqZ2tEdGCwLGoVUG/8LYkyfcHaqYZ4QHVkHzp36fm26zQzZTjqlrg9Otx3fdKZPPBMQurMxnmRYjJGcxqjsyFKSNRWHf8FCpxXJiEpwMjkM8704iDll1q0iBP9N3QmV40PHlSQmZ2qrGhrYURb/OSKRU6EKdyTiWxy9j+8YOppHSdpV3F7dG0y+lmyudbp4WQ8fqXkJ7LIv7N7LJ7ltLw4KUD1CxtxccSIppzCkZ7ul7h5tPxvKtjisgGbInWoZwjnqAsjLPAQB360Rt4fhzVOyodVutEXMAnXS2Tz0+J8ntmVCnV0bvL2ymBok=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(36840700001)(46966006)(2906002)(26005)(36860700001)(83380400001)(8936002)(5660300002)(8676002)(47076005)(4326008)(81166007)(336012)(54906003)(82740400003)(186003)(9686003)(110136005)(356005)(52536014)(55016002)(86362001)(33656002)(316002)(53546011)(7696005)(82310400003)(70586007)(6506007)(478600001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 06:20:05.0294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b935bd22-a4bf-4285-2767-08d91b574ef4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7133

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1heSAyMCwgMjAyMSAz
OjQ2IEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBDYzog
QmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4g
PFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAwMy8xMF0geGVuL2FybTogaW50cm9kdWNlIFBHQ19yZXNlcnZlZA0KPiANCj4gDQo+IA0KPiBP
biAxOS8wNS8yMDIxIDA0OjE2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBIaSBKdWxpZW4NCj4g
DQo+IEhpIFBlbm55LA0KPiANCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBUdWVz
ZGF5LCBNYXkgMTgsIDIwMjEgNTo0NiBQTQ0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55Llpo
ZW5nQGFybS5jb20+Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmcNCj4gPj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1h
cnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+ID4+IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5k
QGFybS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDMvMTBdIHhlbi9hcm06IGludHJv
ZHVjZSBQR0NfcmVzZXJ2ZWQNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMTgvMDUvMjAyMSAw
NjoyMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBJbiBvcmRlciB0byBkaWZmZXJlbnRpYXRl
IHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnksIGZyb20gdGhvc2UNCj4gPj4+IGFsbG9jYXRlZCBmcm9t
IGhlYXAsIHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBwYWdlIGZsYWcgUEdDX3Jlc2VydmVk
DQo+IHRvIHRlbGwuDQo+ID4+Pg0KPiA+Pj4gTmV3IHN0cnVjdCByZXNlcnZlZCBpbiBzdHJ1Y3Qg
cGFnZV9pbmZvIGlzIHRvIGRlc2NyaWJlIHJlc2VydmVkIHBhZ2UNCj4gPj4+IGluZm8sIHRoYXQg
aXMsIHdoaWNoIHNwZWNpZmljIGRvbWFpbiB0aGlzIHBhZ2UgaXMgcmVzZXJ2ZWQgdG8uID4NCj4g
Pj4+IEhlbHBlciBwYWdlX2dldF9yZXNlcnZlZF9vd25lciBhbmQgcGFnZV9zZXRfcmVzZXJ2ZWRf
b3duZXIgYXJlDQo+ID4+PiBkZXNpZ25hdGVkIHRvIGdldC9zZXQgcmVzZXJ2ZWQgcGFnZSdzIG93
bmVyLg0KPiA+Pj4NCj4gPj4+IFN0cnVjdCBkb21haW4gaXMgZW5sYXJnZWQgdG8gbW9yZSB0aGFu
IFBBR0VfU0laRSwgZHVlIHRvDQo+ID4+PiBuZXdseS1pbXBvcnRlZCBzdHJ1Y3QgcmVzZXJ2ZWQg
aW4gc3RydWN0IHBhZ2VfaW5mby4NCj4gPj4NCj4gPj4gc3RydWN0IGRvbWFpbiBtYXkgZW1iZWQg
YSBwb2ludGVyIHRvIGEgc3RydWN0IHBhZ2VfaW5mbyBidXQgbmV2ZXINCj4gPj4gZGlyZWN0bHkg
ZW1iZWQgdGhlIHN0cnVjdHVyZS4gU28gY2FuIHlvdSBjbGFyaWZ5IHdoYXQgeW91IG1lYW4/DQo+
ID4+DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5n
QGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCB8
IDE2ICsrKysrKysrKysrKysrKy0NCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPiA+PiBpbmRleA0K
PiA+Pj4gMGI3ZGUzMTAyZS4uZDg5MjJmZDVkYiAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaA0KPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oDQo+
ID4+PiBAQCAtODgsNyArODgsMTUgQEAgc3RydWN0IHBhZ2VfaW5mbw0KPiA+Pj4gICAgICAgICAg
ICAgKi8NCj4gPj4+ICAgICAgICAgICAgdTMyIHRsYmZsdXNoX3RpbWVzdGFtcDsNCj4gPj4+ICAg
ICAgICB9Ow0KPiA+Pj4gLSAgICB1NjQgcGFkOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAvKiBQYWdl
IGlzIHJlc2VydmVkLiAqLw0KPiA+Pj4gKyAgICBzdHJ1Y3Qgew0KPiA+Pj4gKyAgICAgICAgLyoN
Cj4gPj4+ICsgICAgICAgICAqIFJlc2VydmVkIE93bmVyIG9mIHRoaXMgcGFnZSwNCj4gPj4+ICsg
ICAgICAgICAqIGlmIHRoaXMgcGFnZSBpcyByZXNlcnZlZCB0byBhIHNwZWNpZmljIGRvbWFpbi4N
Cj4gPj4+ICsgICAgICAgICAqLw0KPiA+Pj4gKyAgICAgICAgc3RydWN0IGRvbWFpbiAqZG9tYWlu
Ow0KPiA+Pj4gKyAgICB9IHJlc2VydmVkOw0KPiA+Pg0KPiA+PiBUaGUgc3BhY2UgaW4gcGFnZV9p
bmZvIGlzIHF1aXRlIHRpZ2h0LCBzbyBJIHdvdWxkIGxpa2UgdG8gYXZvaWQNCj4gPj4gaW50cm9k
dWNpbmcgbmV3IGZpZWxkcyB1bmxlc3Mgd2UgY2FuJ3QgZ2V0IGF3YXkgZnJvbSBpdC4NCj4gPj4N
Cj4gPj4gSW4gdGhpcyBjYXNlLCBpdCBpcyBub3QgY2xlYXIgd2h5IHdlIG5lZWQgdG8gZGlmZmVy
ZW50aWF0ZSB0aGUgIk93bmVyIg0KPiA+PiB2cyB0aGUgIlJlc2VydmVkIE93bmVyIi4gSXQgbWln
aHQgYmUgY2xlYXJlciBpZiB0aGlzIGNoYW5nZSBpcyBmb2xkZWQNCj4gPj4gaW4gdGhlIGZpcnN0
IHVzZXIgb2YgdGhlIGZpZWxkLg0KPiA+Pg0KPiA+PiBBcyBhbiBhc2lkZSwgZm9yIDMyLWJpdCBB
cm0sIHlvdSBuZWVkIHRvIGFkZCBhIDQtYnl0ZSBwYWRkaW5nLg0KPiA+Pg0KPiA+DQo+ID4gWWVh
aCwgSSBtYXkgZGVsZXRlIHRoaXMgY2hhbmdlLiBJIGltcG9ydGVkIHRoaXMgY2hhbmdlIGFzIGNv
bnNpZGVyaW5nDQo+ID4gdGhlIGZ1bmN0aW9uYWxpdHkgb2YgcmVib290aW5nIGRvbWFpbiBvbiBz
dGF0aWMgYWxsb2NhdGlvbi4NCj4gPg0KPiA+IEEgbGl0dGxlIG1vcmUgZGlzY3Vzc2lvbiBvbiBy
ZWJvb3RpbmcgZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0aW9uLg0KPiA+IENvbnNpZGVyaW5nIHRo
ZSBtYWpvciB1c2VyIGNhc2VzIGZvciBkb21haW4gb24gc3RhdGljIGFsbG9jYXRpb24gYXJlDQo+
ID4gc3lzdGVtIGhhcyBhIHRvdGFsIHByZS1kZWZpbmVkLCBzdGF0aWMgYmVoYXZpb3IgYWxsIHRo
ZSB0aW1lLiBObw0KPiA+IGRvbWFpbiBhbGxvY2F0aW9uIG9uIHJ1bnRpbWUsIHdoaWxlIHRoZXJl
IHN0aWxsIGV4aXN0cyBkb21haW4gcmVib290aW5nLg0KPiANCj4gSG1tbS4uLiBXaXRoIHRoaXMg
c2VyaWVzIGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGFsbG9jYXRlIG1lbW9yeSBhdCBydW50aW1l
DQo+IG91dHNpZGUgb2YgdGhlIHN0YXRpYyBhbGxvY2F0aW9uIChzZWUgbXkgY29tbWVudCBvbiB0
aGUgZGVzaWduIGRvY3VtZW50IFsxXSkuDQo+IFNvIGlzIGl0IG1lYW50IHRvIGJlIGNvbXBsZXRl
Pw0KPiANCg0KSSdtIGd1ZXNzaW5nIHRoYXQgdGhlICJhbGxvY2F0ZSBtZW1vcnkgYXQgcnVudGlt
ZSBvdXRzaWRlIG9mIHRoZSBzdGF0aWMgYWxsb2NhdGlvbiIgaXMNCnJlZmVycmluZyB0byBYRU4g
aGVhcCBvbiBzdGF0aWMgYWxsb2NhdGlvbiwgdGhhdCBpcywgdXNlcnMgcHJlLWRlZmluaW5nIGhl
YXAgaW4gZGV2aWNlIHRyZWUNCmNvbmZpZ3VyYXRpb24gdG8gbGV0IHRoZSB3aG9sZSBzeXN0ZW0g
bW9yZSBzdGF0aWMgYW5kIHByZWRpY3RhYmxlLg0KDQpBbmQgSSd2ZSByZXBsaWVkIHlvdSBpbiB0
aGUgZGVzaWduIHRoZXJlLCBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuIFNhdmUgeW91ciB0aW1l
LCBhbmQNCknigJlsbCBwYXN0ZSBoZXJlOg0KDQoiUmlnaHQgbm93LCBvbiBBQXJjaDY0LCBhbGwg
UkFNLCBleGNlcHQgcmVzZXJ2ZWQgbWVtb3J5LCB3aWxsIGJlIGZpbmFsbHkgZ2l2ZW4gdG8NCmJ1
ZGR5IGFsbG9jYXRvciBhcyBoZWFwLCAgbGlrZSB5b3Ugc2FpZCwgZ3Vlc3QgUkFNIGZvciBub3Jt
YWwgZG9tYWluIHdpbGwgYmUgYWxsb2NhdGVkDQpmcm9tIHRoZXJlLCB4bWFsbG9jIGV2ZW50dWFs
bHkgaXMgZ2V0IG1lbW9yeSBmcm9tIHRoZXJlLCBldGMuIFNvIHdlIHdhbnQgdG8gcmVmaW5lIHRo
ZSBoZWFwDQpoZXJlLCBub3QgaXRlcmF0aW5nIHRocm91Z2ggYGJvb3RpbmZvLm1lbWAgdG8gc2V0
IHVwIFhFTiBoZWFwLCBidXQgbGlrZSBpdGVyYXRpbmcNCmBib290aW5mby4gcmVzZXJ2ZWRfaGVh
cGAgdG8gc2V0IHVwIFhFTiBoZWFwLg0KDQpPbiBBUk0zMiwgeGVuIGhlYXAgYW5kIGRvbWFpbiBo
ZWFwIGFyZSBzZXBhcmF0ZWx5IG1hcHBlZCwgd2hpY2ggaXMgbW9yZSBjb21wbGljYXRlZA0KaGVy
ZS4gVGhhdCdzIHdoeSBJIG9ubHkgdGFsa2luZyBhYm91dCBpbXBsZW1lbnRpbmcgdGhlc2UgZmVh
dHVyZXMgb24gQUFyY2g2NCBhcyBmaXJzdCBzdGVwLiINCg0KIEFib3ZlIGltcGxlbWVudGF0aW9u
IHdpbGwgYmUgZGVsaXZlcmVkIHRocm91Z2ggYW5vdGhlciBwYXRjaCBTZXJpZS4gVGhpcyBwYXRj
aCBTZXJpZQ0KSXMgb25seSBmb2N1c2luZyBvbiBEb21haW4gb24gU3RhdGljIEFsbG9jYXRpb24u
IA0KDQo+ID4NCj4gPiBBbmQgd2hlbiByZWJvb3RpbmcgZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0
aW9uLCBhbGwgdGhlc2UgcmVzZXJ2ZWQNCj4gPiBwYWdlcyBjb3VsZCBub3QgZ28gYmFjayB0byBo
ZWFwIHdoZW4gZnJlZWluZyB0aGVtLiAgU28gSSBhbQ0KPiA+IGNvbnNpZGVyaW5nIHRvIHVzZSBv
bmUgZ2xvYmFsIGBzdHJ1Y3QgcGFnZV9pbmZvKltET01JRF1gIHZhbHVlIHRvIHN0b3JlLg0KPiA+
DQo+ID4gQXMgSmFuIHN1Z2dlc3RlZCwgd2hlbiBkb21haW4gZ2V0IHJlYm9vdGVkLCBzdHJ1Y3Qg
ZG9tYWluIHdpbGwgbm90IGV4aXN0DQo+IGFueW1vcmUuDQo+ID4gQnV0IEkgdGhpbmsgRE9NSUQg
aW5mbyBjb3VsZCBsYXN0Lg0KPiBZb3Ugd291bGQgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGRvbWlk
IHRvIGJlIHJlc2VydmVkLiBCdXQgSSBhbSBub3QgZW50aXJlbHkNCj4gY29udmluY2VkIHRoaXMg
aXMgbmVjZXNzYXJ5IGhlcmUuDQo+IA0KPiBXaGVuIHJlY3JlYXRpbmcgdGhlIGRvbWFpbiwgeW91
IG5lZWQgYSB3YXkgdG8ga25vdyBpdHMgY29uZmlndXJhdGlvbi4NCj4gTW9zdGx5IGxpa2VseSB0
aGlzIHdpbGwgY29tZSBmcm9tIHRoZSBEZXZpY2UtVHJlZS4gQXQgd2hpY2ggcG9pbnQsIHlvdSBj
YW4gYWxzbw0KPiBmaW5kIHRoZSBzdGF0aWMgcmVnaW9uIGZyb20gdGhlcmUuDQo+IA0KDQpUcnVl
LCB0cnVlLiBJJ2xsIGRpZyBtb3JlIGluIHlvdXIgc3VnZ2VzdGlvbiwgdGh4LiDwn5iJDQoNCj4g
Q2hlZXJzLA0KPiANCj4gWzFdIDw3YWI3M2NiMC0zOWQ1LWY4YmYtNjYwZi1iM2Q3N2YzMjQ3YmRA
eGVuLm9yZz4NCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KDQpDaGVlcnMNCg0KUGVubnkNCg0K

