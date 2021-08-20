Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F43F2C06
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 14:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169524.309676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3aG-0007Hm-5v; Fri, 20 Aug 2021 12:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169524.309676; Fri, 20 Aug 2021 12:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH3aG-0007Fh-2g; Fri, 20 Aug 2021 12:25:16 +0000
Received: by outflank-mailman (input) for mailman id 169524;
 Fri, 20 Aug 2021 12:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH3aF-0007FY-3I
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 12:25:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7a28e29-1ed3-4c16-8205-b9f792f4b974;
 Fri, 20 Aug 2021 12:25:12 +0000 (UTC)
Received: from AM7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:100::16)
 by VI1PR0801MB1968.eurprd08.prod.outlook.com (2603:10a6:800:88::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 12:25:08 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::46) by AM7PR02CA0006.outlook.office365.com
 (2603:10a6:20b:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 12:25:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 12:25:08 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Fri, 20 Aug 2021 12:25:07 +0000
Received: from 0c2e9eec198c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 726A0094-FA5C-4DBC-A7BF-A69A80608920.1; 
 Fri, 20 Aug 2021 12:25:02 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c2e9eec198c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 12:25:02 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6958.eurprd08.prod.outlook.com (2603:10a6:10:2be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 20 Aug
 2021 12:25:01 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 12:25:01 +0000
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
X-Inumbo-ID: b7a28e29-1ed3-4c16-8205-b9f792f4b974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSDGBMqDzpWRZnorRAQN2MCd1THkrhLKXb/+uQJm7CI=;
 b=SBKBbJ9xP2IOIvQ7rN+2AGRo9cDfLI4Ebi+2VV8LrzbJAkDpdn8vevUJSqEAhhYnP4NLwzmtVKI046HetYW/5VIYwAiY2SoLB4dy/Li1F+mKLZP/YRoUgjpccGLxRUnoB1ba1ER1qzXR8ga7A7OPkpaA9Pz8+c3wg1zGRhp8VCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INhsP5DoZI9g5PPbceKVW/Oc+Dh4wcUsaGwP1DNVpOFKXlXfYrYz4hk9n+WvO34M/GwMG2GxTPcXmw7tL6RsiZBTsOMZFX+pCAh06j8F1RNM4njQ3ztQDe1VhFoktDPHepha/Zly6RZa7u8MHlHEB1tagW3IFK4Quxood0C90gr7jU+3/n3CuFUGICrTgVHo2jQosTiM2Aijz1kIkDnAbAq0GyQ2+fKEO9qrOvBucekIphGt8OYXAh7sHR1AsI2Re+icOtMwy6+oHPsIO+2XLg39+mikWCYgf8QV+ff2lDpG80+xCjMLFnjkaGdS5c1DH+7kNpfMV7d+H8XTFaHAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSDGBMqDzpWRZnorRAQN2MCd1THkrhLKXb/+uQJm7CI=;
 b=HHBnaXfC80UksbfDrHtEcrgUf9XIl9zsVnZ11bH6eyM6nSmJexLzeIMN3DQGBjT23AW7Q3ixgRObFNVnl1ynAcdHPDO9ASXZATLAsCKVd/xGLdD946HqYKvxoESJoMe35ll0MvCcrgMJBA/ncoaKrjUyDbCAcg0/Rd0XzFGpShbY+wzD/8cJWL5f6/yNKGxxoUwO4I3QfmIn5m1WkHd2bx1i9+MSU4bw7J3acQKAYvFoLtobKgkqpCvwIoHQDMvWZTM2koC+HNkwV65MabbIE8Xjfp84xVGRqWZqe4idR4iOouUeaRTwPb4G0SfSLa5pm8X7ouwY+C2evNinyNCjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSDGBMqDzpWRZnorRAQN2MCd1THkrhLKXb/+uQJm7CI=;
 b=SBKBbJ9xP2IOIvQ7rN+2AGRo9cDfLI4Ebi+2VV8LrzbJAkDpdn8vevUJSqEAhhYnP4NLwzmtVKI046HetYW/5VIYwAiY2SoLB4dy/Li1F+mKLZP/YRoUgjpccGLxRUnoB1ba1ER1qzXR8ga7A7OPkpaA9Pz8+c3wg1zGRhp8VCc=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA Kconfig
 for arm64
Thread-Topic: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA
 Kconfig for arm64
Thread-Index:
 AQHXjps53Qsrm+WTv06/kg1OUu3sHKt64bkAgADV/ZCAAGlegIAAHTUQgAARmQCAAA9VEA==
Date: Fri, 20 Aug 2021 12:25:00 +0000
Message-ID:
 <DB9PR08MB6857875F92E743A20F7C77BD9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-18-wei.chen@arm.com>
 <1fbcb8a6-67b6-e2d6-6524-cfce7a8a6557@xen.org>
 <DB9PR08MB68571FFA0E971E3A60C588EA9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <fe477382-c078-9647-49f8-ef40a9e20b50@xen.org>
 <DB9PR08MB6857E4371D0E31C65E952C0E9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <00d536c1-311c-3f66-c0d2-6bdcc5f1d794@xen.org>
In-Reply-To: <00d536c1-311c-3f66-c0d2-6bdcc5f1d794@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 454D75666E594646A147D14745133E18.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ab4acf56-c1d6-4e45-6163-08d963d58c5b
x-ms-traffictypediagnostic: DB9PR08MB6958:|VI1PR0801MB1968:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB19682A23201B554CC92593079EC19@VI1PR0801MB1968.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7weJGjP2splesast3g/KavMl3viad+vkGL9tZmE/fIdYmsLCITaoRfwscLXwu0okamNBbePx+UmfDuu5f9QeFMjSKQWDuPLvg2NZVHL2LvwqZpn15u60+UYPrLx2t/qccni83etg2jYjjfgv4DARo1lhAwj4r9ofb4zy7IiMZPOil40xQikuoOb+kH6H/K9/icLqubqc3M7HGrG/7kTN1QcOA+pE8+ZokAzIl1m5f5wnrp79tZaMPnsJKou2KkQ+68Is7aLfWz6heMQUUS1gWxrX/EQrATmbfmL9G7nHdOpB0QPpPR8ayqU6GH367ZAfhlEZvJUEUuugO4v+UQpRmSae7O8zFE1WxozpbyndRXqDn2HaqsKVD/Q3Gt8nWM/ayIjRdhqTeMwKtqwayjbrce/+vPXLhWRjcNk4p1gqxLXuVB/6Xi1DRLikx19sc7bP7o2g7HsDkQaAjDeB67Ws2WykYI+FaQbh8vvKp/NEE3c7Zsb63HRy2d7tXk3WLNvXnt6D7/uGkiUx6FZVCzOtuFIRrUum+Bw0FEzlvaOS9nUvTC7QcthJVXoTxrCPhzeOrzPnHuKFo/9eL+yuIL5YeC8ENqQHd+a96NFFqaO+6y02zJ5rj6Kmev6d3YJX+Msg31UuHqMBC2WouMmmilv6X+9t6BTNyu+H6BbcaAefwt1en41iMt7xInrwpPpcHuzWikr1r7oyqr9oFjgNF5fDmQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(2906002)(8936002)(186003)(38070700005)(38100700002)(33656002)(122000001)(52536014)(7696005)(6506007)(66946007)(53546011)(66446008)(66476007)(64756008)(9686003)(26005)(76116006)(8676002)(55016002)(478600001)(66556008)(86362001)(4326008)(110136005)(316002)(71200400001)(5660300002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3JnTnF2dVk1WnhBc1RmRUJZSkFwS3BMbFlsSlJERXQ3QWhBSCtrdVI5NVVV?=
 =?utf-8?B?d0NLNCtkR21HVkQ4WkxFckVPb1poZXJZMDVsZHY0NWRrRXcvbnNKOFVkNHZH?=
 =?utf-8?B?bWcxTktWcldlbHVlUDRMK0dza09Wc2V2MitJN2p4UmtvNmYrZVRFSlEwU1Zs?=
 =?utf-8?B?dzM3RGszNHhvbG45czBMR1Z1bzUvQnQzUTNBa2xnT2dsZFlQeFEzS2YrRE43?=
 =?utf-8?B?aEl3dWJleE9vVHQxZjBneHY5RHZGM1IreURMTklIMjlKYUVSMzhkcEtGT3RZ?=
 =?utf-8?B?bEFkSWpBSURVaGZ6dW15MElDbG1HQ0dNblMvOXNveXk2MDQrWTBGMDc3VmMv?=
 =?utf-8?B?ZWpFVENQR2Y3cGc2N3NGeUhNUVBLdmpPNFB4SFJ2U0p3S01ib1VlMjhUVFNN?=
 =?utf-8?B?WnlRWnBGSExQYUlZTTRuQmU5djFjNFBMcnhrVVdKc290T1ZmSGdPU1hXSjgr?=
 =?utf-8?B?c2dLcHJ1SVZsM29ncWRJMXc4Q0x1U3dQcFd2a1pNNHFJQXhCczNtNWVwSjNN?=
 =?utf-8?B?T3RlN0Vic2hLbE1LcFpCaEhQZzhHYmtCM1F3OXM0UndkOTNYNyt4VEtGK1Ev?=
 =?utf-8?B?ZWVtLzYwdDNMdllmRzJmd242UWpidzVtVEh2NHUyczNBZGQ2UmNKcHRpY0Uw?=
 =?utf-8?B?aGhMNEs3QlNWdzhVZDAxcWpOOVlHSFhEOHdoWGUxSHhaTWhxbmR3bEZWcHNj?=
 =?utf-8?B?TEJpOUVoMGJJYkNnMnpKV0ZrMFNDN0VJTkRmTG9Bb1FlU2pQdlIzUVdCNUV6?=
 =?utf-8?B?cExkYWRsWDQvTFFPNjVYK1MvVkJVdU9uZi96T00vNU5nWE5QSkEvcXBvYlJj?=
 =?utf-8?B?NGF6c1NqdGtBbUFSejFTb1hEa2d4VTVhbXNJUElyYVNFcE16NVdZdmVhUXhE?=
 =?utf-8?B?UWhJNDQrblRBQnVJVHVhRFJSVU5pUXc2RFp1SmkvRVlHQWxXb3pFMlF2T01r?=
 =?utf-8?B?SVVCU0dRL0NUdFhGS0w5a1M0SEMvRFpsSVlqWTY3dnVxRFcyMEtOWHVtSGtF?=
 =?utf-8?B?ZHA5cldjYmR4dmcwaWIrUUVHSWVqc2NjZVc0Yk5QYTNiUGpNTG14RVJwclB0?=
 =?utf-8?B?SG81WGZXTkxlbExjZnM4dWtVMjhsZ1VTeHNzbjl3RDJ0K0NHSWtvTzlUdkJV?=
 =?utf-8?B?anVRR3VVcTE4dWJmVmpjTzI5Q3p2RWpSa3QwVnlTK01WRUdBM2hBNUt3N3RN?=
 =?utf-8?B?bjZEd2xpUWE2R3EzelBoV1lhUi90Uk5EeFIxVzZCM2wvdmZqSW10VC9QZmJE?=
 =?utf-8?B?d21VcjBnSElacENkbVY4U3dxYitUclRSNnBqKzFQcFdYN3BQc2VRSHVHdnRm?=
 =?utf-8?B?elVpNm5neWIyWFZST3FTOWtjclAvVzMwMWplRDkwdCtVVEpIc3JtQ09aZWtn?=
 =?utf-8?B?akJBVmtYNGNpVmxZUnlDcUU4L2M3NFpIV2g3Vk85WmV6UEFVTnROSHhWNHpZ?=
 =?utf-8?B?UDhZS2syKzRJaGpvL3JwalUvQzh2OXQ2M3owc2pnZml6RFk4c1VzVmg4UEV3?=
 =?utf-8?B?WFpURTVjUW9xbGZsV3NLRng3TWFuVS94OEJiU0swVStlTWF1aXNaZlNKOTAw?=
 =?utf-8?B?dVlqcHl0R1M1K3VndXU1dnBTT3hYUWZzU0FQalRyQ1RXWGpLLzNaUlV5eEl3?=
 =?utf-8?B?Y1VoN0hETXgxQjllcGYxVGtDaXlYdDZ2Zm1JbXBzZkRGQkJ4MjM3RGdwR2Zr?=
 =?utf-8?B?dlFYR1dvYWJoVTVmWnJqZnlJaHlrQzhFYlZwaEhJY3VERGxaZVNYajhxOWF1?=
 =?utf-8?Q?EpG+p3x4H0m2t5CgcMMXC/DL71i/9ro9nbTIQ8b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6958
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d036174-186e-406f-20d1-08d963d58800
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6oHgTOSEHOVF2MieY/k0mVb75t0qzjkwU1hJk893gRBzJsEzERdqG5SJ7t7BLf6MGxs+14ys6pST28xNOcVTlATmDsU0XZWk8m6FuPS/eyqRTtQskKE+uAKOucdyGRe35bkukuwOkPD8k42rxZiXMNcXLZWcXWXFQGtA2O1Y8o6dgoicIRojaz1AlXeZhuEIiD/CJzzcmnGHWsBVdvLeujnzMSr5aJoYU/F0K0QYryJ/Fl7IK/uLpw8nnYzXZOVfm7lVarDAX3uDL7yT3HbpTNfoWzpAULvPUtyootD310cSf4CFfX6ehkXfOktzLBGGliKjuKSKeBgtpZCWf6epc0wfsmBZsSc94wku157XMCCS2JStuuEWrCJuQRwkkeonuQ4GgfDHCI89HKZLXoUoar6rL0qrnjY2XDPMDHuIhnMGYYyjF61KR55MjBDaELhs7l5SXfEzDOxNsg3g5FhXhhHvkqua5bUJE56W6xi670HErZDGs5HECpmmzjX0kCk/e7nDZRcT8yuTTb3ITyZSeMNVFzWNOsZX1Zwpx9rYWh7kjrfnrb/CZojvXq69B3ZQQBWDEqIqvtfbL0YsTlkfqUNkSWlUkBe8CFzOAnKTpn7RCjKYiyisYoxUT+6TWJI1eh6DddkR5XTsZ2RYO1X3Ai7bIr6Y61aBGm2RyvIkj7elMXqFQznHXQeJ2v2PDkCY6UeJ7CAcX58LQ/jWjB990Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(5660300002)(4326008)(7696005)(478600001)(8676002)(81166007)(336012)(55016002)(82310400003)(110136005)(6506007)(36860700001)(33656002)(52536014)(47076005)(2906002)(316002)(356005)(26005)(86362001)(82740400003)(70586007)(83380400001)(70206006)(9686003)(186003)(53546011)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 12:25:08.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4acf56-c1d6-4e45-6163-08d963d58c5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1968

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTk6MjkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQ
QVRDSCAxNy80MF0geGVuL2FybTogSW50cm9kdWNlIERFVklDRV9UUkVFX05VTUENCj4gS2NvbmZp
ZyBmb3IgYXJtNjQNCj4gDQo+IA0KPiANCj4gT24gMjAvMDgvMjAyMSAxMTo0OSwgV2VpIENoZW4g
d3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGkgV2VpLA0KPiANCj4gPg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPg0KPiA+PiBTZW50OiAyMDIx5bm0OOaciDIw5pelIDE2OjQxDQo+ID4+IFRvOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsN
Cj4gPj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4gPj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPj4gU3ViamVj
dDogUmU6IFtYRU4gUkZDIFBBVENIIDE3LzQwXSB4ZW4vYXJtOiBJbnRyb2R1Y2UgREVWSUNFX1RS
RUVfTlVNQQ0KPiA+PiBLY29uZmlnIGZvciBhcm02NA0KPiA+Pg0KPiA+PiBPbiAyMC8wOC8yMDIx
IDAzOjMwLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IEhpIEp1bGllbiwNCj4gPj4NCj4gPj4gSGkg
V2VpLA0KPiA+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4+PiBTZW50OiAyMDIx5bm0OOac
iDE55pelIDIxOjM4DQo+ID4+Pj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+Pj4+IHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+ID4+Pj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0gg
MTcvNDBdIHhlbi9hcm06IEludHJvZHVjZQ0KPiBERVZJQ0VfVFJFRV9OVU1BDQo+ID4+Pj4gS2Nv
bmZpZyBmb3IgYXJtNjQNCj4gPj4+Pg0KPiA+Pj4+IEhpLA0KPiA+Pj4+DQo+ID4+Pj4gT24gMTEv
MDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4+IFdlIG5lZWQgYSBLY29uZmln
IG9wdGlvbiB0byBkaXN0aW5ndWlzaCB3aXRoIEFDUEkgYmFzZWQNCj4gPj4+Pj4gTlVNQS4gU28g
d2UgaW50cm9kdWNlIHRoZSBuZXcgS2NvbmZpZyBvcHRpb246DQo+ID4+Pj4+IERFVklDRV9UUkVF
X05VTUEgaW4gdGhpcyBwYXRjaCBmb3IgQXJtNjQuDQo+ID4+Pj4+DQo+ID4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4g
ICAgIHhlbi9hcmNoL2FybS9LY29uZmlnIHwgMTAgKysrKysrKysrKw0KPiA+Pj4+PiAgICAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPj4+Pj4g
aW5kZXggZWNmYTY4MjJlNC4uNjc4Y2M5OGVhMyAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL0tjb25maWcNCj4gPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPj4+
Pj4gQEAgLTMzLDYgKzMzLDE2IEBAIGNvbmZpZyBBQ1BJDQo+ID4+Pj4+ICAgICAJICBBZHZhbmNl
ZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRlcmZhY2UgKEFDUEkpIHN1cHBvcnQNCj4gPj4g
Zm9yIFhlbg0KPiA+Pj4+IGlzDQo+ID4+Pj4+ICAgICAJICBhbiBhbHRlcm5hdGl2ZSB0byBkZXZp
Y2UgdHJlZSBvbiBBUk02NC4NCj4gPj4+Pj4NCj4gPj4+Pj4gK2NvbmZpZyBERVZJQ0VfVFJFRV9O
VU1BDQo+ID4+Pj4NCj4gPj4+PiBUaGUgbmFtZSBzdWdnZXN0cyB0aGF0IE5VTUEgc2hvdWxkIG9u
bHkgYmUgZW5hYmxlZCBmb3IgRGV2aWNlLVRyZWUuLi4NCj4gPj4+PiBCdXQgdGhlIGRlc2NyaXB0
aW9uIGxvb2tzIGdlbmVyaWMuDQo+ID4+Pj4NCj4gPj4+PiBIb3dldmVyLCBJIHRoaW5rIHRoZSB1
c2VyIHNob3VsZCBvbmx5IGhhdmUgdGhlIGNob2ljZSB0byBzYXkgd2hldGhlcg0KPiA+Pj4+IHRo
ZXkgd2FudCBOVU1BIHRvIGJlIGVuYWJsZWQgb3Igbm90LiBXZSBzaG91bGQgbm90IGdpdmUgdGhl
bSB0aGUNCj4gY2hvaWNlDQo+ID4+Pj4gdG8gZW5hYmxlL2Rpc2FibGUgdGhlIHBhcnNpbmcgZm9y
IERUL0FDUEkuDQo+ID4+Pj4NCj4gPj4+PiBTbyB3ZSBzaG91bGQgaGF2ZSBhIGdlbmVyaWMgY29u
ZmlnIHRoYXQgd2lsbCB0aGVuIHNlbGVjdCBEVCAoYW5kIEFDUEkNCj4gPj4gaW4NCj4gPj4+PiB0
aGUgZnV0dXJlKS4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEhvdyBhYm91dCB3ZSBzZWxlY3QgRFRf
TlVNQSBkZWZhdWx0IG9uIEFybTY0LiBBbmQgRFRfTlVNQSBzZWxlY3QgTlVNQQ0KPiA+Pj4gbGlr
ZSB3aGF0IHdlIGhhdmUgZG9uZSBpbiBwYXRjaCM2IGluIHg4Nj8gQW5kIHJlbW92ZSB0aGUgZGVz
Y3JpcHRpb24/DQo+ID4+IEkgd291bGQgcmF0aGVyIG5vdCBtYWtlIE5VTUEgc3VwcG9ydGVkIGJ5
IGRlZmF1bHQgb24gQXJtNjQuIEluc3RlYWQsIHdlDQo+ID4+IHNob3VsZCBnbyB0aHJvdWdodCB0
aGUgc2FtZSBwcm9jZXNzIGFzIG90aGVyIG5ldyBmZWF0dXJlcyBhbmQgZ2F0ZSBpdA0KPiA+PiBi
ZWhpbmQgVU5TVVBQT1JURUQgdW50aWwgaXQgaXMgbWF0dXJlIGVub3VnaC4NCj4gPj4NCj4gPg0K
PiA+IE9rLiBJIGFncmVlIHdpdGggdGhpcy4NCj4gPg0KPiA+Pj4NCj4gPj4+IElmIHdlIG1ha2Ug
Z2VuZXJpYyBOVU1BIGFzIGEgc2VsZWN0YWJsZSBvcHRpb24sIGFuZCBkZXBlbmRzIG9uDQo+ID4+
PiBOVU1BIHRvIHNlbGVjdCBEVCBvciBBQ1BJIE5VTUEuIEl0IHNlZW1zIHRvIGJlIHF1aXRlIGRp
ZmZlcmVudCBmcm9tDQo+ID4+PiB0aGUgZXhpc3RpbmcgbG9naWM/DQo+ID4+DQo+ID4+IEkgYW0g
YSBiaXQgY29uZnVzZWQuIFlvdSBhZGRlZCBqdXN0IGxvZ2ljIHRvIHNlbGVjdCBOVU1BIGZyb20g
QUNQSSwNCj4gPj4gcmlnaHQ/IFNvIGFyZSB5b3UgdGFsa2luZyBhYm91dCBhIGRpZmZlcmVudCBs
b2dpYz8NCj4gPj4NCj4gPg0KPiA+IE5vLCBJIGRpZG4ndCB3YW50IGEgZGlmZmVyZW50IG9uZS4g
SSB0aG91Z2h0IHlvdSB3YW50ZWQgaXQgdGhhdCB3YXkuDQo+ID4gT2J2aW91c2x5LCBJIG1pcy11
bmRlcnN0YW5kZWQgeW91ciBjb21tZW50cy4NCj4gPg0KPiA+IENhbiBJIHVuZGVyc3RhbmQgeW91
ciBwcmV2aW91cyBjb21tZW50cyBsaWtlIGZvbGxvd2luZzoNCj4gPiAxLiBXZSBzaG91bGQgaGF2
ZSBhIGdlbmVyaWMgY29uZmlnIHRoYXQgd2lsbCB0aGVuIHNlbGVjdCBEVCBhbmQgQUNQSToNCj4g
PiAgICAgQmVjYXVzZSB3ZSBhbHJlYWR5IGhhdmUgQ09ORklHX05VTUEgaW4gY29tbW9uIGxheWVy
LiBTbyB3ZSBuZWVkIHRvDQo+ID4gICAgIGFkZCBhbm90aGVyIG9uZSBmb3IgQXJtIGxpa2UgQ09O
RklHX0FSTV9OVU1BPw0KPiANCj4gSSB0aGluayBzby4NCj4gDQo+ID4gICAgIEFuZCBpbiB0aGlz
IG9wdGlvbiwgd2UgY2FuIHNlbGVjdCBDT05GSUdfREVWSUNFX1RSRUVfTlVNQQ0KPiA+ICAgICBh
dXRvbWF0aWNhbGx5IGlmIGRldmljZSB0cmVlIGlzIGVuYWJsZWQuIElmIENPTkZJR19BQ1BJDQo+
ID4gICAgIGlzIGVuYWJsZWQsIHdlIHdpbGwgc2VsZWN0IENPTkZJR19BQ1BJX05VTUEgdG9vIChp
biB0aGUNCj4gPiAgICAgZnV0dXJlKQ0KPiA+ICAgICBJbiBYZW4gY29kZSwgRFRfTlVNQSBhbmQg
QUNQSV9OVU1BIGNvZGUgY2FuIGNvLWV4aXN0LCBYZW4NCj4gDQo+IERpc3RyaWJ1dGlvbnMgc2hv
dWxkIG5vdCBoYXZlIHRvIGJ1aWxkIGEgZGlmZmVyZW50IFhlbiBmb3IgRFQgYW5kIEFDUEkuDQo+
IFNvIGl0IGlzIG1vcmUgdGhleSAqbXVzdCogY28tZXhpc3QuDQo+IA0KPiA+ICAgICB3aWxsIGNo
ZWNrIHRoZSBzeXN0ZW0gQUNQSSBzdXBwb3J0IHN0YXR1cyB0byBkZWNpZGUgdG8gdXNlDQo+ID4g
ICAgIERUX05VTUEgb3IgQUNQSV9OVU1BPw0KPiANCj4gWWVzLiBBIHVzZXIgc2hvdWxkIG9ubHkg
aGF2ZSB0byBzYXkgIkkgd2FudCB0byB1c2UgTlVNQSIuIFRoaXMgaXMgWGVuIHRvDQo+IGZpZ3Vy
ZSBvdXQgd2hldGhlciB3ZSBuZWVkIHRvIGNvbXBpbGUgdGhlIHN1cHBvcnQgZm9yIERUIGFuZC9v
ciBBQ1BJLg0KPiANCj4gT25jZSB3ZSBoYXZlIHN1cHBvcnQgZm9yIEFQQ0ksIGl0IGRvZXNuJ3Qg
bWFrZSBhIGxvdCBvZiBzZW5zZSBmb3IgdGhlDQo+IHVzZXJzIHRvIHNheSAiSSB3YW50IHRvIGNv
bXBpbGUgd2l0aCBEVCBhbmQgQUNQSSBidXQgSSBvbmx5IHdhbnQgTlVNQQ0KPiB3aGVuIHVzaW5n
IERUIi4NCj4gDQoNCkkgYW0gZ2xhZCB3ZSBhcmUgbm93IGluIHRoZSBzYW1lIHBhZ2UuIE9rLCBJ
IHdpbGwgY2hhbmdlIHRoZSBLY29uZmlnDQpsaWtlIHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

