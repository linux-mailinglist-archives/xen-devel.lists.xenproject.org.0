Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2C02D0E1E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46170.81915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDtE-0007im-Jx; Mon, 07 Dec 2020 10:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46170.81915; Mon, 07 Dec 2020 10:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDtE-0007iQ-GQ; Mon, 07 Dec 2020 10:37:08 +0000
Received: by outflank-mailman (input) for mailman id 46170;
 Mon, 07 Dec 2020 10:37:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifa4=FL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kmDtC-0007iK-OZ
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:37:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7233b48a-67d6-4c73-83d4-5b8d925b0108;
 Mon, 07 Dec 2020 10:37:04 +0000 (UTC)
Received: from DB6PR07CA0177.eurprd07.prod.outlook.com (2603:10a6:6:43::31) by
 PR3PR08MB5675.eurprd08.prod.outlook.com (2603:10a6:102:8a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18; Mon, 7 Dec 2020 10:37:02 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::8c) by DB6PR07CA0177.outlook.office365.com
 (2603:10a6:6:43::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Mon, 7 Dec 2020 10:37:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 10:37:02 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Mon, 07 Dec 2020 10:37:02 +0000
Received: from 021e73208d6b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 389BC2F4-B07C-4BEA-A2C3-3FB4D6840A4D.1; 
 Mon, 07 Dec 2020 10:36:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 021e73208d6b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Dec 2020 10:36:46 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBAPR08MB5814.eurprd08.prod.outlook.com (2603:10a6:10:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 10:36:45 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3632.022; Mon, 7 Dec 2020
 10:36:45 +0000
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
X-Inumbo-ID: 7233b48a-67d6-4c73-83d4-5b8d925b0108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCbaSDReFn8EINw+zrjSHAWQGc+nbO0vgMK186U5MyU=;
 b=QJ/jfQyH66g31vxDPgvv9xrqpT+uNHZM9+d1qqlJWKzdjCPYNzMCV8nII6P2Va8s12rJoWRnSWsbp7pLmV70ryiclx8mZDwqXOCT1rMwAvb05bqqZUMEdtTqWOFJKL6p67FSK3QIczhS7XOtmLxxjjP6w38KN9Ap1kmK7lyqPLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51c2f8e88da09d05
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDaR5G8mrhS4B7aYmgSNfN7VQ5YAYwHLylCo8Jh5u2/1OTXuRPTzfGoxJwpWJlwSxNAbRqtuIuOVIQ7Ge0poEZi0L9m39d86wt8Kutu9feCK6lERkK06L3+MPCds+RvaZ7pdZRbNPH1TwSy76HDoXebrPIZ3XIxpt6ta5oX+d29nxjgAbeCK4fyt5uT5QCd03+WY15h+ca7qhgAh/bfMjI4gjp/HAj2lXWaX2M4UsEM6c9MFaloW7cOz8JhnUsvT3pq61hbRTRTCVDkZBvG0AcedVD0B4oE4RK+2LzbBFMzrBwCWZhHSlXDeyLJaoOFOs8QxaDkPK7O4A4GHM0YQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCbaSDReFn8EINw+zrjSHAWQGc+nbO0vgMK186U5MyU=;
 b=VvJJPO1ysGCDs4OMq10A0HzHcmVUymAhY+sTirIP6ai5AOW3bXereOc+RY/veCuE9aYb30wunClEBJSlkpBRv+hDK3Mj/NfCqXZdSW4ZWC5na4mQADufviHhXCS9k34/6ijmztocc2uSKw4v/An41e4MMpNxVZMWIBFWbCky+eadXQFBCc0qyBVrjvrqzvQiLtuXKMLtjLbSwQZd+VUAsV9T4EXQF16PcEXyXW0aU8tpfKlmDHtww1gQX9BIsWm6pENkyNbRsJHZerFSJ7OevoVLKaAIexLeFPycq5Undjp4vOCMLxVS1EJPiUCXdw4gRK1nwsBUmNiMRk8/ysQSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCbaSDReFn8EINw+zrjSHAWQGc+nbO0vgMK186U5MyU=;
 b=QJ/jfQyH66g31vxDPgvv9xrqpT+uNHZM9+d1qqlJWKzdjCPYNzMCV8nII6P2Va8s12rJoWRnSWsbp7pLmV70ryiclx8mZDwqXOCT1rMwAvb05bqqZUMEdtTqWOFJKL6p67FSK3QIczhS7XOtmLxxjjP6w38KN9Ap1kmK7lyqPLg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Topic: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Index: AQHWxBX830xFguE4YkK2klATz/ucYKnj64aAgAGO7QCAATalAIAE0HIA
Date: Mon, 7 Dec 2020 10:36:45 +0000
Message-ID: <0B43914F-93E1-4860-BA45-7E08F817818C@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
 <cd74f2a7-7836-ef90-9cd8-857068adb0f5@xen.org>
 <51C0C24A-3CE6-48A3-85F5-14F010409DC3@arm.com>
 <b87e9293-77bb-2c43-63d0-8d54d5fc9a7e@xen.org>
In-Reply-To: <b87e9293-77bb-2c43-63d0-8d54d5fc9a7e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 32120524-ecb2-44bc-4d98-08d89a9c08ba
x-ms-traffictypediagnostic: DBAPR08MB5814:|PR3PR08MB5675:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB56759148213D8959E62E0217FCCE0@PR3PR08MB5675.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rTPhOin0VuKP54/M72p1meuyx6J+nhxB23PnD8JnueTICPbKhciaXON4kZgYx5qbbpYRCiqQTIfIHJa6pi4qJeJFi58+IT+oi1XgdtHnOH3vH/HIlvUQHH/BYEdOlb/gTabkWBE/LVHNSOfVCGwW0cE+PLDKPP4u2ueyzfUbga4Eb3LNOkw43kZdbHu1BV12rEliSGrFq2V1+6YsD4eqoIFKpqG49Y1Gib5iz3mQIUnmGYiGapoSsTJFSUsbaxX3amdLYVv/bOw3/YCiuUH9M57OtYezrzSV/v5GYx4Lrj1QkiSOZ5qZZsj7RBLva+zdmN7c7BPB2/gRTIUHHerdHvlqh1ZWXSqDUk+3ZJ/1MNlo7IysGNns8oNhVdYYWcPE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(6506007)(53546011)(64756008)(2906002)(26005)(6916009)(8676002)(4326008)(6486002)(8936002)(186003)(54906003)(33656002)(6512007)(316002)(478600001)(2616005)(66946007)(76116006)(91956017)(71200400001)(86362001)(36756003)(5660300002)(83380400001)(66446008)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?eVVzZ1JoVGZ0ZUlmb3lmZ050UUw0SzNlamVzMEd2OGlhMm1BclhqYmFlU3ZI?=
 =?utf-8?B?VVkxdEpZakJXRUxNekF0RXU0SCtMUWxneXkzbjRLNHZLTU9HUFI4WTFjNURU?=
 =?utf-8?B?MlZhczJ1RnN6MHJQTjVEWjRYc1g1b21LVkk5ZkhEWU1wcTQ0QzRVeEtYWDRG?=
 =?utf-8?B?bjBLRzBhTzhQT2xrVmlGTlUvRGRwY2RxNUpuSmViRnZyOE9mN1hpSXpoQ3VL?=
 =?utf-8?B?VFRRY3pWd2oxUms2SkxhaVQvRFFtKzVQa3dheExlTjN0cWZraDVSOVJER1JB?=
 =?utf-8?B?UCtoWkNLdnJNRmh0WFNBMnpqZnE2b085UkNKM2k4c3doN3BJSktsZUdTM2c5?=
 =?utf-8?B?R1dqK1dsYWo4a0VjUlNSdW1aWmVuTWpINEs0YlB5dEhvU3FNcEdWUUR1R1JJ?=
 =?utf-8?B?LzBGRGN4UjJVQzhhb2Q1Ni9Wdll0TVo2T2lNV2UwMXZnS2FkWWtxbldJYUJt?=
 =?utf-8?B?a2hXZm96TnJORnk2eEFmYmVQMnB0aS8rWDFsaW0zUmFYdW5tcCtpdUJBTVFZ?=
 =?utf-8?B?YkNQT3ZqTzlQbmxva0JyQVdadGg1Z3BheTM1bmJBSGNyUTlwWHR6bTZrdzBP?=
 =?utf-8?B?MW82OXBrSHhLeERIdk9zc2dNdzVmZHp2ZmRJZjZubTc0Wi9BREU3NDFSczRr?=
 =?utf-8?B?eFdJZXVIY0pLZ20yVk45MmM3YzI5U2U4QXc3R3dYZ0VXM3JBdlU5aUV3Rk1a?=
 =?utf-8?B?UWdHMmozMGdTTmdmQi9zbG8zRHpEVUpwaE1jWHZKSDFuMmhkWE9NWjNUYzRJ?=
 =?utf-8?B?VFpzdHlXaFE4QUNDSjE4MVNqRXI5ZVVDaU8yNWxJT2tiOVh2TjV6MmE5YzdL?=
 =?utf-8?B?aldOUzg5RzA5ZHdHUDRFSTh1bTgyRmxiUTd1RjlrZlAwZ3ZENWg3N0VUWmly?=
 =?utf-8?B?T0hyWXRyUmwxa2ZVWjQrNkFzeEJWWm14d05PVnd1U0lSem94b0FDT0Y5WGNW?=
 =?utf-8?B?RWJTbElOVXA0ak1sYitGQTBtcEora0xoWEZncStMWG1mVS9NMDFmYlJsdEhz?=
 =?utf-8?B?Y2dqWTZHampMT2tqK2paekVGYWh1UC9jTXN1b1I3NEMzcFMxZ3RiQUFacVRz?=
 =?utf-8?B?TGM1VnNHa2d3RHQ0VlJkWE5pOVRDQkt2c0tDQTFKcTZpTURrT2ZGNnZMQkMx?=
 =?utf-8?B?ZTVjVE1MSklkRVVvc0x1dlRURnlGS3hIZmczU3VLbW9Rb21IMXpySStkemRi?=
 =?utf-8?B?RTdibXFDVVR4WnhsZUVKKzloTEswekRlRkVYRmlGYUpDWXdWNjJhOGdydFhH?=
 =?utf-8?B?MHZWOHpUR0I3aGhkVk1DalFhVEVVRU9Cd3pTUXhkT2UybVU2dTVxdS9EYVJk?=
 =?utf-8?Q?LV1mpbCXyyEy6RZnKnAgyiabVXyHXXder+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FDFCC7C9A9BF2478E80446D9E43E15D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5814
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19419e32-3081-4f35-27bb-08d89a9bfe5c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MmWGE9VDtn1rkFgIj1r77+R3jzk4I6mVpM72L0RfyGblu93rkD1eJSgsUL84PQfkrrFn5h0LZ22EqrIb3J2blAbjhT3aeq8frFlnPrJcl+iAuWkzknV+zlqktbOdeEkk2zHKZ3Amrfrp4yg9t8oOrLy7VCVNL3SYkM74ht2jV70A5qg1Rmi6okD8JlzoIWsgfuA1gfi12cPjN9u48rKfSydNuEuSBASOGNEwTqasR4FsgRwIlKu5v0v+Tqd/wDSEdQp9FhR+JU117LEV8B7A6BU9mqAltZYu4fS4RlYoqKSwNDToct10pEUTLeMnmC0xdTFEzGYF9Lrgf4dc5eyNYuMaGCSZA7uLWwdL9UhlrQFJRPKrUtDkKC8Nnu8vs/luXrhAb8SHMZnRTBT/EfkP2w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(186003)(107886003)(6486002)(81166007)(6512007)(53546011)(356005)(33656002)(6506007)(47076004)(54906003)(86362001)(316002)(5660300002)(26005)(2906002)(8936002)(82740400003)(70586007)(36756003)(8676002)(83380400001)(4326008)(336012)(6862004)(478600001)(82310400003)(70206006)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 10:37:02.4868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32120524-ecb2-44bc-4d98-08d89a9c08ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5675

SGVsbG8gSnVsaWVuLAkNCg0KPiBPbiA0IERlYyAyMDIwLCBhdCA5OjA1IGFtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMDMv
MTIvMjAyMCAxNDozMywgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gMiBEZWMgMjAyMCwgYXQg
Mjo0NSBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+IC0NCj4+
Pj4gLXN0YXRpYyBzdHJ1Y3QgaW9tbXVfZGV2aWNlICphcm1fc21tdV9wcm9iZV9kZXZpY2Uoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPj4+PiAtew0KPj4+IA0KPj4+IE1vc3Qgb2YgdGhlIGNvZGUgaGVy
ZSBsb29rcyB1c2VmdWwgdG8gWGVuLiBJIHRoaW5rIHlvdSB3YW50IHRvIGtlZXAgdGhlIGNvZGUg
YW5kIHJlLXVzZSBpdCBhZnRlcndhcmRzLg0KPj4gT2suIEkgcmVtb3ZlZCB0aGUgY29kZSBoZXJl
IGFuZCBhZGRlZCB0aGUgWEVOIGNvbXBhdGlibGUgY29kZSB0byBhZGQgZGV2aWNlcyBpbiBuZXh0
IHBhdGNoLg0KPj4gSSB3aWxsIGtlZXAgaXQgaW4gdGhpcyBwYXRjaCBhbmQgd2lsbCBtb2RpZnlp
bmcgdGhlIGNvZGUgdG8gbWFrZSBYRU4gY29tcGF0aWJsZS4NCj4gDQo+IEluIGdlbmVyYWwsIGl0
IGlzIHByZWZlciBpZiB0aGUgY29kZSB0aGUgY29kZSByYXRoZXIgdGhhbiBkcm9wcGluZyBpbiBw
YXRjaCBBIGFuZCB0aGVuIGFkZCBpdCBhZ2FpbiBkaWZmZXJlbnRseSBwYXRjaCBCLiBUaGlzIG1h
a2VzIGVhc2llciB0byBjaGVjayB0aGF0IHRoZSBjb2RlIG91dGNvbWUgb2YgdGhlIGZ1bmN0aW9u
IGlzIG1vc3RseSB0aGUgc2FtZS4NCj4gDQoNCk9rLg0KDQo+Pj4+IC1zdGF0aWMgc3RydWN0IGlv
bW11X29wcyBhcm1fc21tdV9vcHMgPSB7DQo+Pj4+IC0JLmNhcGFibGUJCT0gYXJtX3NtbXVfY2Fw
YWJsZSwNCj4+Pj4gLQkuZG9tYWluX2FsbG9jCQk9IGFybV9zbW11X2RvbWFpbl9hbGxvYywNCj4+
Pj4gLQkuZG9tYWluX2ZyZWUJCT0gYXJtX3NtbXVfZG9tYWluX2ZyZWUsDQo+Pj4+IC0JLmF0dGFj
aF9kZXYJCT0gYXJtX3NtbXVfYXR0YWNoX2RldiwNCj4+Pj4gLQkubWFwCQkJPSBhcm1fc21tdV9t
YXAsDQo+Pj4+IC0JLnVubWFwCQkJPSBhcm1fc21tdV91bm1hcCwNCj4+Pj4gLQkuZmx1c2hfaW90
bGJfYWxsCT0gYXJtX3NtbXVfZmx1c2hfaW90bGJfYWxsLA0KPj4+PiAtCS5pb3RsYl9zeW5jCQk9
IGFybV9zbW11X2lvdGxiX3N5bmMsDQo+Pj4+IC0JLmlvdmFfdG9fcGh5cwkJPSBhcm1fc21tdV9p
b3ZhX3RvX3BoeXMsDQo+Pj4+IC0JLnByb2JlX2RldmljZQkJPSBhcm1fc21tdV9wcm9iZV9kZXZp
Y2UsDQo+Pj4+IC0JLnJlbGVhc2VfZGV2aWNlCQk9IGFybV9zbW11X3JlbGVhc2VfZGV2aWNlLA0K
Pj4+PiAtCS5kZXZpY2VfZ3JvdXAJCT0gYXJtX3NtbXVfZGV2aWNlX2dyb3VwLA0KPj4+PiAtCS5k
b21haW5fZ2V0X2F0dHIJPSBhcm1fc21tdV9kb21haW5fZ2V0X2F0dHIsDQo+Pj4+IC0JLmRvbWFp
bl9zZXRfYXR0cgk9IGFybV9zbW11X2RvbWFpbl9zZXRfYXR0ciwNCj4+Pj4gLQkub2ZfeGxhdGUJ
CT0gYXJtX3NtbXVfb2ZfeGxhdGUsDQo+Pj4+IC0JLmdldF9yZXN2X3JlZ2lvbnMJPSBhcm1fc21t
dV9nZXRfcmVzdl9yZWdpb25zLA0KPj4+PiAtCS5wdXRfcmVzdl9yZWdpb25zCT0gZ2VuZXJpY19p
b21tdV9wdXRfcmVzdl9yZWdpb25zLA0KPj4+PiAtCS5wZ3NpemVfYml0bWFwCQk9IC0xVUwsIC8q
IFJlc3RyaWN0ZWQgZHVyaW5nIGRldmljZSBhdHRhY2ggKi8NCj4+Pj4gLX07DQo+Pj4+IC0NCj4+
Pj4gIC8qIFByb2JpbmcgYW5kIGluaXRpYWxpc2F0aW9uIGZ1bmN0aW9ucyAqLw0KPj4+PiAgc3Rh
dGljIGludCBhcm1fc21tdV9pbml0X29uZV9xdWV1ZShzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpz
bW11LA0KPj4+PiAgCQkJCSAgIHN0cnVjdCBhcm1fc21tdV9xdWV1ZSAqcSwNCj4+Pj4gQEAgLTI0
MDYsNyArMjAzMiw2IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfZGV2aWNlX2h3X3Byb2JlKHN0cnVj
dCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+Pj4+ICAJc3dpdGNoIChGSUVMRF9HRVQoSURSMF9T
VEFMTF9NT0RFTCwgcmVnKSkgew0KPj4+PiAgCWNhc2UgSURSMF9TVEFMTF9NT0RFTF9GT1JDRToN
Cj4+Pj4gIAkJc21tdS0+ZmVhdHVyZXMgfD0gQVJNX1NNTVVfRkVBVF9TVEFMTF9GT1JDRTsNCj4+
Pj4gLQkJZmFsbHRocm91Z2g7DQo+Pj4gDQo+Pj4gV2Ugc2hvdWxkIGtlZXAgYWxsIHRoZSBmYWxs
dGhyb3VnaCBkb2N1bWVudGVkLiBTbyBJIHRoaW5rIHdlIHdhbnQgdG8gaW50cm9kdWNlIHRoZSBm
YWxsdGhyb3VnaCBpbiBYZW4gYXMgd2VsbC4NCj4+IE9rIEkgd2lsbCBrZWVwIGZhbGx0aHJvdWdo
IGRvY3VtZW50ZWQgaW4gdGhpcyBwYXRjaC4NCj4+IGZhbGx0aHJvdWdoIGltcGxlbWVudGF0aW9u
IGluIFhFTiBzaG91bGQgYmUgYW5vdGhlciBwYXRjaC4gSSBhbSBub3Qgc3VyZSB3aGVuIHdlIGNh
biBpbXBsZW1lbnQgYnV0IHdlIHdpbGwgdHJ5IHRvIGltcGxlbWVudC4NCj4gDQo+IFllcywgSSBk
aWRuJ3QgYXNrIHRvIGltcGxlbWVudCAiZmFsbHRocm91Z2giIGluIHRoaXMgcGF0Y2gsIGJ1dCBp
bnN0ZWFkIGFzIGEgcHJlLXJlcXVpcmVtZW50IHBhdGNoLg0KPiANCj4gSSB3b3VsZCBpbXBsZW1l
bnQgaXQgaW4gaW5jbHVkZS94ZW4vY29tcGlsZXIuaC4NCg0KT2suIEkgd2lsbCBpbXBsZW1lbnQg
YW5kIHdpbGwgc2hhcmUgdGhlIHBhdGNoIGZvciDigJxfX2F0dHJpYnV0ZV9fKChfX2ZhbGx0aHJv
dWdoX18pKSDigJ0gYnV0IGZvciBTTU1VdjMgaXMgdGhhdCBvayBpZiB3ZSBjYW4gcHJvY2VlZCB3
aXRoIOKAnCAvKiBmYWxsdGhyb3VnaCAqLyAgIi4gDQoNCkFzIOKAnGZhbGx0aG9ydWdo4oCdIGlt
cGxlbWVudGF0aW9uIGlzIGNvbW1vbiBmb3IgYWxsIGFyY2hpdGVjdHVyZSBpdCByZXF1aXJlZCBy
ZXZpZXcgZm9yIGFsbCBzdGFrZWhvbGRlciBhcyBwZXIgbXkgdW5kZXJzdGFuZGluZy4gSSBkb27i
gJl0IHdhbnQgdG8gYmxvY2sgU01NVXYzIGJlY2F1c2Ugb2YgdGhpcy4NCg0KUmVnYXJkcywNClJh
aHVsDQogDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

