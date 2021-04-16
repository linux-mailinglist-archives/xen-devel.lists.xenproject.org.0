Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115693625E6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 18:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111923.214017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXRXB-0005C0-7I; Fri, 16 Apr 2021 16:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111923.214017; Fri, 16 Apr 2021 16:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXRXB-0005Bb-3d; Fri, 16 Apr 2021 16:41:33 +0000
Received: by outflank-mailman (input) for mailman id 111923;
 Fri, 16 Apr 2021 16:41:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDfs=JN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lXRX9-0005BW-Ly
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 16:41:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2da70aab-cf7b-4d2f-abb0-152d0f141e6a;
 Fri, 16 Apr 2021 16:41:28 +0000 (UTC)
Received: from DB6PR0801CA0063.eurprd08.prod.outlook.com (2603:10a6:4:2b::31)
 by PA4PR08MB5933.eurprd08.prod.outlook.com (2603:10a6:102:f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 16:41:26 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::3c) by DB6PR0801CA0063.outlook.office365.com
 (2603:10a6:4:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 16:41:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 16:41:26 +0000
Received: ("Tessian outbound b610e7b4d771:v90");
 Fri, 16 Apr 2021 16:41:26 +0000
Received: from d8c9c61a2189.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E2AE2F66-0DF3-4F60-B1FF-F3AE462EC591.1; 
 Fri, 16 Apr 2021 16:41:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8c9c61a2189.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Apr 2021 16:41:20 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 16:41:18 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.4020.023; Fri, 16 Apr 2021
 16:41:18 +0000
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
X-Inumbo-ID: 2da70aab-cf7b-4d2f-abb0-152d0f141e6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aXCwxtgSCgRaKJh63xVnLb+qqhcSFbSL4vGT++2Wvc=;
 b=t/yozJs5UzkPXqtwgs/CK38v7oyL+xEG+P7NN7DicQPLfPp6sUUc1zjWdt3R4V8k9S7QQbkmXN6tHc9WaswANMPW2b1LQdWJ2zoyLTRuf/TtCkrrOpWGCuqwbs9AYmvYxPZDsN4ySQwIYbWnL/6m++f0y/0xcFVv8H2tfOs/cpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc74617730c392d7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRQz2HSpvfaOVC7b7NPpuFeBMzZbEiFNdpzD9chW2mUkfq5OfQgP/HyKSA10GlOwGMO4kNACCrXmtkcVFEDASp2XxjH/5vqJ14SBqN4B6BJXjY4UjXsgMrYaNpfRqGzw+lGPecxv/Ez1WHuvKhGGyla08bouW9JSTVMM8H6XARzlu3WNMiO4QbFFnoWfNvQ0cIS+kLtbKaxzXPi/meT25iQRvgOOUbKDbFsBA8VJ+nJPAWfzEu6Vx7Da+6fKvt8o2Bi3RqZiI23OEm0EtNVqSZy3LsUfMEsV3a7KYa12Nc5f+TL/SDKbeg14Exv9kGBbfzG8CMnH5wDfxYlVZStPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aXCwxtgSCgRaKJh63xVnLb+qqhcSFbSL4vGT++2Wvc=;
 b=AzAlo57BVl3cRPZy64CNla2k1tEZSFbgxuQeVC+mA223m2k/YK09E4E9+CtxfIQCoxO8wKKqxtrV0tvS/2zotN/n/KEcXWtlWoT/YUvwW9fC+oDYKn08yAOEVB7Fb9KtXnay2Q3gmxGrMYk8cyFWfSZ6GVSKgmpzdOp4OewGp/ccFJhuEM0A528ci/ToLBx7A1LCHky9uZrpKWuoMhmFc+1bVALO5ExukId8gO1q6EXX7QDRE3iGws6f8gGqNQPnC6JPBUZPB9vKPfQ+gObYgQCsgV3a+vXagI9rxbZi6CKOB/QILsqiWv9EQWjXwfg7sWcTwxHWzse2smORx+tpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aXCwxtgSCgRaKJh63xVnLb+qqhcSFbSL4vGT++2Wvc=;
 b=t/yozJs5UzkPXqtwgs/CK38v7oyL+xEG+P7NN7DicQPLfPp6sUUc1zjWdt3R4V8k9S7QQbkmXN6tHc9WaswANMPW2b1LQdWJ2zoyLTRuf/TtCkrrOpWGCuqwbs9AYmvYxPZDsN4ySQwIYbWnL/6m++f0y/0xcFVv8H2tfOs/cpk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Topic: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Index:
 AQHXMrMxW8Hpcs9A7Ei4/6fuLjr236q3NfuAgAAHXICAAAYsgIAAC7YAgAAA/oCAAAkFAA==
Date: Fri, 16 Apr 2021 16:41:17 +0000
Message-ID: <348C921E-1150-4247-A693-1D81933FC3F7@arm.com>
References:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
 <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
 <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
 <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org>
In-Reply-To: <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cd9387ca-88fd-464d-c2fa-08d900f67a54
x-ms-traffictypediagnostic: DB8PR08MB5484:|PA4PR08MB5933:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB5933F9D34E5B7491DC0D42ABFC4C9@PA4PR08MB5933.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1z4NO8ygQAi8SXot6MtNKPZoY5yosBBb2AP/ubXFPg7KakQg5eyd6wxNpxG0rEZ1LEjNoFwmtUZYkPQRF/GB7FftTL0cWEUQZmBpdcEEKSfbPVYffaoaOu4EL6jxvaOFXGCv58W8zgGT5/0M0EdprdPZdbSAeBp21OjYFRxplErRrZcNOL+Ey0UEi5RZZviiIOb0lNO0cKNHkIRsRU03XWwEPr6YkQEOS2ier4wlAmPqhOCZVsUt9uApy08+4Piy19DuKcENph5vSoHVRhno/atpaWCdB2JjCa4bAjtn/BMAf4ZyXaViVRSm5q9SRE+9VdUK9emPlPq+MIxD7xomWTfZIX44QspoKA8ajfzIcLZTqnbTEZhEvlGKTr1pmcmn8thE38mvKU3ZcoxS6QvQN+DhohIRfudC3G1C+jTUck6lP28vlHvEqLA3ILZXWZqDHzJlSzCePjZY4sp5y0Vp9rZ5h55z0OKT3QdR2+h+5EL7vxiT7ovuXKxEkOrS5F9kn96lLHXGR1YM/8PLTvfNHyKef3OpXHKTrIKvfC/ppMXZ+XCJEpLhlKyD42fawy12nhXRpuiUgwckXM9PUJtPCj6ya1dh+0rnMx5GjooOdng6UKyWnmgJJhxrbz2uqc42TpH7L6+MEN4Q9bPhadm/y8W3eSv2LYCPz+REBtOhYR0uHqAx2oH297/lY+X3C9lnh/uK94qyMvIGknzyk7DYXOXrtpSC6D3+a5RBXmnmZXZ8cIIqsaXVwhVPsroNfMJd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(6512007)(26005)(186003)(71200400001)(4326008)(966005)(54906003)(86362001)(8676002)(316002)(2616005)(6486002)(122000001)(8936002)(38100700002)(53546011)(64756008)(66946007)(36756003)(76116006)(91956017)(66556008)(66446008)(66476007)(478600001)(5660300002)(33656002)(6916009)(6506007)(2906002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SitiVnhLdHJkdWhNRFdHUmtjU28vNGMrMzdabHJMNzVMY05TaG93WCtzRmRO?=
 =?utf-8?B?MXlVK3FaOVE3VVlsZUxBQ1hSOTNtNHpmd201d0xpRWJpcnhIa0FiYUUwZ1Iy?=
 =?utf-8?B?dWJkVS8vcnhPN0U4aVVKOUpCcllYOStaQk55UFV1dkZ0Z3JJRnRNYks5SWU4?=
 =?utf-8?B?bEowMDVtUUMxYmVUNjFWNitnS0RtcmgrUXVDWGJqcWxHYlFMemNhSGFGNUZF?=
 =?utf-8?B?MENRNVNiZDltWkx5cTBSYUx5ZHRIaHN6TVhBekRxUWVqczlwZG8zb2VsMDdz?=
 =?utf-8?B?a09SR2JxS2Ixams0QnBudEp4UmVWemFldTk5V3VrZHRIbGh3T0pwaW55OVhq?=
 =?utf-8?B?SndmNXpBcVpkNDBIUENvNzhML0JieEpTdm0xdkh0NkRWM3ZUamZZbHQ4bWth?=
 =?utf-8?B?UzNMNVI0TmhBSUZiMjB0QzN4OHNFanNQTzVUMDliMkxXcmJWSnVhL2RnbVM1?=
 =?utf-8?B?YVQyWDUvYlc5QnFrQWJLaWVOTmQvem1RU0NxK2YzNmI1WVgra0JvVGc3cCtF?=
 =?utf-8?B?MWl3bEpjL09ETEVRaE1XL09tNmpFcEJESkZ2WDZMdmUyL1I5UlZoaC9qWnVR?=
 =?utf-8?B?VkpwNUIreVE1SXZtYXY2Z3lodGpyNTQ1OWplNUdSTDRWNWVMMm1iaVFERjJC?=
 =?utf-8?B?T1FDKzhWbU81SGc4bDAvUm5MS2NLZEhpRDFaWGw1Y0UzRnk4NVcrYUJXd0g0?=
 =?utf-8?B?WlNxUXFRMGhIMCtleGxNS0ZweXJjOUF2bGE2NWZOWmkySHRReUhvMllVSEV2?=
 =?utf-8?B?VUNoN3doekpOdXlXa1ZQU3JXaE5uWU4vK29nZk56K2UrQjcyWk56MllWWXc5?=
 =?utf-8?B?djQ0K3Z4aFlrTVYwejJTdGY1emlpblpZS2VHcDFQMG11Ulh3dTRndkR1RTYz?=
 =?utf-8?B?YmNWYlpMMXFwU2xvWHJQYlhqU242a0dBK3BsK1JIdEV4UlBEYyt3R3o0SDYv?=
 =?utf-8?B?ZXM2MC9ZeTRENy8wSUVOZEJWbVRZYW1aYzJBYUhGTDFvMGJUNStQdmxIVEdH?=
 =?utf-8?B?RDFYVk9MQUluL0RiN1ptVGdMRVNhYy9QakM0UEtDQmw5dzFXNnp4RHhtUjZU?=
 =?utf-8?B?ZEhDK0JRYyttNUxDM2kzaS9RUTBFc2FwT0NISzgxTzdUb3JIb1cwbXpMU2do?=
 =?utf-8?B?UGZ3Szl5Yjdmamc5bUxQWE55REQ2Uk1mSUtTZW9jUU1KYWhHalR3dGx6OVZa?=
 =?utf-8?B?VVN3eXFaT3p5bjd5SmE2UHVYQXl0ZWpkWjZScHpjbjdMdjhONTlOZHdxZFFG?=
 =?utf-8?B?MFVoMGJHNlR2UFVJY2ZGN1psZDBxeE5jaUJEcDFPNVZDRTdseWdUSy9xKzJk?=
 =?utf-8?B?dmVFVUFZdjExK1pRbXBHRGRlbkFheVR1WjVRdzkxdFg0aTNTZUx3SXNYbnp6?=
 =?utf-8?B?SStzZ3NrTTZGU1BVQ29TY0psWVdwc2Jxck0xWmE3SFZkdEdxci9nalYrbnVJ?=
 =?utf-8?B?dmlRTmJHbTdoYWxteFg0SEJmdVJJOW13TU1uVTdBZTBWMVZLQmg1MXRCYWVs?=
 =?utf-8?B?QXhYYVB6QW1TU1BmYlJkWEhualcrN1N4TmN2QkZteVNqRFdydmFrMVpITUtt?=
 =?utf-8?B?L1l2RWZYamtzbGRDRXFSZDRXTkFlSjY0bW4wZUZBdkM3ZDZWK2tyVzFaSUFi?=
 =?utf-8?B?YkorbjB1Z3JDbk5vT0NkZU0wU205V2FpTnc5Y2FaeDh6OUVoc05WdmV2bStk?=
 =?utf-8?B?Q3ZqNWFSbWczWnQxYk50TElRTnA3V09QZXR2a3JPNDRLK3gwMHFOVHlXaDBD?=
 =?utf-8?Q?0BTbbcOy+gI8Ae6tDbFqFEpflcg9l+tZjuyjcSG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB59BF0244538D428C6AE551E3701963@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3386e85d-1e24-4cdf-a621-08d900f67566
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UgN5u0SwgOkW3NFO2BnD2nud0OygodSvC1aDhMwfL9CDzYYTKASjwlYnAZnuH17HBliAQWjJUzqMZnrXiqwLN9X6H2YH1MAZYp06kQSejxGSGmLLx7JmZSpEZtl6odYk2PUP2tHjEhQOCTpiGyHMiBBS/BU8ymY+cSCFmkV+kOgK3hGEeC23FqCWw5NPLNAsTajXELqewCPmq/N0m98tbglzk+wVhbBKsioDqcUJX2/oYEAsIwGpZWHfUfdJCVygNS0uhGAYokQ0I9wt0hIxlSUfdj9u37yKiy7GmTmZtboQYlqWGv3bea38i0Io1zEmgMFkbPxH1ZkELPIF2NP0vxWrdLGvkxvNDGhAjAF497IHM+KBVLzELBG5hq8PrwWhge5ySOPzNeSyMyD/EOYMPtU/JdAHtKtxxHXpubFJRP7My3tpotKDHVslHbwM0wX4YQO6Yjydzwis1oA/q0UZaNc2CkThTJrJxc5wmCT7HPk7KRIX47N258h6O5bBeRxFhf6UVhRvk8dRi/wY6Jrfl1Sjsxe3l4U0LpM6x/y44QgtQe11jYgF9WMW7aFLuvGzhHQrfRwQ2dJ78aGYur029POdJUQB6YuFkpUh2ll8O0ASyp5EvuHCE/AZZ8JLbCYaRP62yYxkuwszI49hZgDaKMsWDchPcqW6FcZYYPeDNusOMXxuwLHWMXiD1l7UpEJ86S0P8gj0idsL0UHaShG2BOgg3z8hHsJEM98PY/iYHOA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(54906003)(8936002)(86362001)(36756003)(186003)(36860700001)(70586007)(83380400001)(336012)(47076005)(316002)(33656002)(6486002)(8676002)(70206006)(82310400003)(6506007)(6862004)(356005)(2906002)(478600001)(6512007)(5660300002)(107886003)(81166007)(966005)(53546011)(2616005)(4326008)(82740400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 16:41:26.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9387ca-88fd-464d-c2fa-08d900f67a54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5933

SGkgSnVsaWVuDQoNCj4gT24gMTYgQXByIDIwMjEsIGF0IDU6MDggcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxNi8wNC8yMDIxIDE3OjA1
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBPbiAxNiBBcHIgMjAyMSwgYXQgNDoyMyBwbSwgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4g
T24gMTYvMDQvMjAyMSAxNjowMSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+IEhpIEp1bGllbiwN
Cj4+PiANCj4+PiBIaSBSYWh1bCwNCj4+PiANCj4+Pj4+IE9uIDE2IEFwciAyMDIxLCBhdCAzOjM1
IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4g
SGksDQo+Pj4+PiANCj4+Pj4+IE9uIDE2LzA0LzIwMjEgMTI6MjUsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+Pj4+IFJldmVydCB0aGUgY29kZSB0aGF0IGFzc29jaWF0ZXMgdGhlIGdyb3VwIHBvaW50
ZXIgd2l0aCB0aGUgUzJDUiBhcyB0aGlzDQo+Pj4+Pj4gY29kZSBjYXVzaW5nIGFuIGlzc3VlIHdo
ZW4gdGhlIFNNTVUgZGV2aWNlIGhhcyBtb3JlIHRoYW4gb25lIG1hc3Rlcg0KPj4+Pj4+IGRldmlj
ZS4NCj4+Pj4+IA0KPj4+Pj4gSXQgaXMgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGlzIGNoYW5nZSB3
YXMgZmlyc3QgYWRkZWQuIEFyZSB3ZSBtaXNzaW5nIGFueSBmZWF0dXJlIHdoZW4gcmV2ZXJ0aW5n
IGl0Pw0KPj4+PiBUaGlzIGZlYXR1cmUgd2FzIGFkZGVkIHdoZW4gd2UgYmFja3BvcnRlZCB0aGUg
Y29kZSBmcm9tIExpbnV4IHRvIGZpeCB0aGUgc3RyZWFtIG1hdGNoIGNvbmZsaWN0IGlzc3VlDQo+
Pj4+IGFzIHBhcnQgb2YgY29tbWl0ICJ4ZW4vYXJtOiBzbW11djE6IEludGVsbGlnZW50IFNNUiBh
bGxvY2F0aW9u4oCdLg0KPj4+PiBUaGlzIGlzIGFuIGV4dHJhIGZlYXR1cmUgYWRkZWQgdG8gYWxs
b2NhdGUgSU9NTVUgZ3JvdXAgYmFzZWQgb24gc3RyZWFtLWlkLiBJZiB0d28gZGV2aWNlIGhhcyB0
aGUNCj4+Pj4gc2FtZSBzdHJlYW0taWQgdGhlbiB3ZSBhc3NpZ24gdGhvc2UgZGV2aWNlcyB0byB0
aGUgc2FtZSBncm91cC4NCj4+PiANCj4+PiBJZiB3ZSByZXZlcnQgdGhlIHBhdGNoLCB0aGVuIGl0
IHdvdWxkIG5vdCBiZSBwb3NzaWJsZSB0byB1c2UgdGhlIFNNTVUgaWYgdHdvIGRldmljZXMgdXNl
IHRoZSBzYW1lIHN0cmVhbS1pZC4gSXMgdGhhdCBjb3JyZWN0Pw0KPj4gTm8uIElmIHdlIHJldmVy
dCB0aGUgcGF0Y2ggd2UgY2FuIHVzZSB0aGUgU01NVSBpZiB0d28gZGV2aWNlcyB1c2UgdGhlIHNh
bWUgc3RyZWFtLWlkIHdpdGhvdXQgYW55IGlzc3VlIGJ1dCBlYWNoIGRldmljZSB3aWxsIGJlIGlu
IGEgc2VwYXJhdGUgZ3JvdXAuVGhpcyBpcyBzYW1lIGJlaGF2aW91ciBiZWZvcmUgdGhlIGNvZGUg
aXMgbWVyZ2VkLg0KPiANCj4gT2suIFNvIHRoZXJlIGlzIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4g
R29vZC4gQ2FuIHlvdSBwcm9wb3NlIGEgY29tbWl0IG1lc3NhZ2UgY2xhcmlmeWluZyB0aGF0PyAN
Cg0KUGxlYXNlIGhhdmUgYSBsb29rIGlmIGl0IG1ha2Ugc2Vuc2UuDQoNCnhlbi9hcm06IHNtbXV2
MTogUmV2ZXJ0IGFzc29jaWF0aW5nIHRoZSBncm91cCBwb2ludGVyIHdpdGggdGhlIFMyQ1INCg0K
UmV2ZXJ0IHRoZSBjb2RlIHRoYXQgYXNzb2NpYXRlcyB0aGUgZ3JvdXAgcG9pbnRlciB3aXRoIHRo
ZSBTMkNSIGFzIHRoaXMNCmNvZGUgY2F1c2luZyBhbiBpc3N1ZSB3aGVuIHRoZSBTTU1VIGRldmlj
ZSBoYXMgbW9yZSB0aGFuIG9uZSBtYXN0ZXINCmRldmljZSB3aXRoIHNhbWUgc3RyZWFtLWlkLiBU
aGlzIGlzc3VlIGlzIGludHJvZHVjZWQgYnkgdGhlIGJlbG93IGNvbW1pdDoNCg0K4oCcMDQzNTc4
NGNjNzVkY2ZlZjNiNWY1OWMyOWRlYjFkYmI4NDI2NWRkYjp4ZW4vYXJtOiBzbW11djE6IEludGVs
bGlnZW50IFNNUiBhbGxvY2F0aW9u4oCdDQogDQpSZXZlcnRpbmcgdGhlIGNvZGUgd2lsbCBub3Qg
aW1wYWN0IHRvIHVzZSBvZiBTTU1VIGlmIHR3byBkZXZpY2VzIHVzZSB0aGUNCnNhbWUgc3RyZWFt
LWlkIGJ1dCBlYWNoIGRldmljZSB3aWxsIGJlIGluIGEgc2VwYXJhdGUgZ3JvdXAuIFRoaXMgaXMg
dGhlIHNhbWUNCmJlaGF2aW91ciBiZWZvcmUgdGhlIGNvZGUgaXMgbWVyZ2VkLg0KDQo+IA0KPiBP
T0kgd2h5IHdhcyB0aGUgY29kZSBhZGRlZCBpZiBpdCBkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVu
Y2U/DQoNClRoaXMgY29kZSBpcyBwYXJ0IG9mIHRoZSBjb2RlIGluIExpbnV4IGNvbW1pdCB0byBm
aXggc3RyZWFtIG1hdGNoIGNvbmZsaWN0IGlzc3VlIHdoZW4gdHdvIGRldmljZXMgaGF2ZSB0aGUg
c2FtZSBzdHJlYW0taWQuIFNlZSBMaW51eCBjb21taXQgbWVzc2FnZS4NCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0
L2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYz9oPWxpbnV4LTUuOC55JmlkPTU4ODg4OGE3Mzk5ZGIz
NTJkMmIxYTQxYzlkNWIzYmYwZmQ0ODIzOTANCg0KV2hlbiBJIHRlc3RlZCB0aGUgY29kZSBvbiBK
dW5vIGJvYXJkIEkgZGlkbuKAmXQgIG9ic2VydmUgYW55IGlzc3VlIHNvIEkgdGhvdWdodCBpdCBp
cyBvayB0byBtZXJnZSB0aGlzIGNvZGUgdG8gaGF2ZSBjbGVhbiBiYWNrcG9ydC4NCg0KUmVnYXJk
cywNClJhaHVsDQoNCj4gDQo+IEFueXdheSwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24hDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

