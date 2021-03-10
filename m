Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B53336EA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 09:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95897.181067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJtr5-0004MJ-KA; Wed, 10 Mar 2021 08:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95897.181067; Wed, 10 Mar 2021 08:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJtr5-0004Lt-G1; Wed, 10 Mar 2021 08:06:07 +0000
Received: by outflank-mailman (input) for mailman id 95897;
 Wed, 10 Mar 2021 08:06:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0VR=II=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lJtr3-0004Lo-7l
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 08:06:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47732e80-9148-48c0-8f40-51c8fe23a730;
 Wed, 10 Mar 2021 08:06:02 +0000 (UTC)
Received: from DU2PR04CA0173.eurprd04.prod.outlook.com (2603:10a6:10:2b0::28)
 by AM0PR08MB4467.eurprd08.prod.outlook.com (2603:10a6:208:138::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 08:05:59 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::b2) by DU2PR04CA0173.outlook.office365.com
 (2603:10a6:10:2b0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 10 Mar 2021 08:05:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 10 Mar 2021 08:05:59 +0000
Received: ("Tessian outbound 24a7072fdae6:v71");
 Wed, 10 Mar 2021 08:05:59 +0000
Received: from 037fb7699184.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D15C0DC0-DAA7-4338-9AC4-039CB81D22F4.1; 
 Wed, 10 Mar 2021 08:05:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 037fb7699184.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Mar 2021 08:05:53 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3791.eurprd08.prod.outlook.com (2603:10a6:803:c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Wed, 10 Mar
 2021 08:05:46 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 08:05:46 +0000
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
X-Inumbo-ID: 47732e80-9148-48c0-8f40-51c8fe23a730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJRcvDglW3nsBhwz9XMyxQjlKduvqxHw916myrBus/4=;
 b=6ZjrZskFSEU7CB+VwTZEdy4zg33+tpBt8LVAiqkabVPetQdkeSxqpoqoL62dP+hSlTE+zCAXRNTVu8FS6TX4gGHD5hTBm/Tk8f80tAzGCSLvfVZR53rSzbi/m2e5oCq6bAeAwXMRtJv+jb9fIuALCnLmJk5MUhn7iG08S3+NFqA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 602cba9698c3d51f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hay59Qmu4Qr7Zw3wh9anufjKcdFtNYnXKRgiRcgYzek21brXMuxq0jLmAaW/P2E36r4YwPaKVukSJEh4VpPSIcXu8OPI5L7YJALvnryAog6AC6mNLKNXPtvNNAqCvP4+NPEe8TO/othh4Nz3HSo/ov3kxROyCulL7R4b/+n8lZEdKanR31oNIxmvYYbteIUWC5RtMggWx7ABL4C6wNKJdhs91oLEwac98qgO49RdUV4vNmZ0kgMA707vNUlmTLe4iZ0F6kXt+MYO+YTAv3BM7IIhusimCbWy8vXJOfPpIauKaOqfN6Dem1ozcDghLxYzAtcia8HpF3Fy+o+CEyYrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJRcvDglW3nsBhwz9XMyxQjlKduvqxHw916myrBus/4=;
 b=D2nGvgrOTWAsfQfaYKEuFVTS/uE5qHRw8iaTJpUvu0wPGZJrmysldnHnAUfm3ai5UUmhezTGg610lUFQJz9U/2vzFIthW3iJqcVFXiflNVImux9qbBUAHkbUXDn3Bq0KsqxyGmbI7ut3sMwXp+X2HKjk5ARVGmRqt3A2v6uGF0zYVG2GuEwpAkwaU+07KJ1TpiFuaa4B4YH/lTACP/o404pvyXJ1vEhCPbHbQo+HSeRAX1nMgHeQlh/T9ae+EWC3apwT8fO7mqpurYd/ZDdJG8JSeJkaUCLyWcGIdrY4UIcB9IxaAwjYfFKNlDIL4TGfx1RMW0aLienvtRfwBEZgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJRcvDglW3nsBhwz9XMyxQjlKduvqxHw916myrBus/4=;
 b=6ZjrZskFSEU7CB+VwTZEdy4zg33+tpBt8LVAiqkabVPetQdkeSxqpoqoL62dP+hSlTE+zCAXRNTVu8FS6TX4gGHD5hTBm/Tk8f80tAzGCSLvfVZR53rSzbi/m2e5oCq6bAeAwXMRtJv+jb9fIuALCnLmJk5MUhn7iG08S3+NFqA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Thread-Topic: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Thread-Index: AQHXFXrOKr1ioWnJ5USYV383dKI5L6p83WMA
Date: Wed, 10 Mar 2021 08:05:46 +0000
Message-ID: <8AAFFE95-AA19-4616-8100-D031FB5731BD@arm.com>
References: <20210310065803.348-1-michal.orzel@arm.com>
In-Reply-To: <20210310065803.348-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.243.24.187]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 740c8d4f-79e8-47c6-ee2a-08d8e39b56f9
x-ms-traffictypediagnostic: VI1PR08MB3791:|AM0PR08MB4467:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB44671E200CCB6C5AFD109AC09D919@AM0PR08MB4467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cweQ3YS0tDA6dbYEYHlPCZNJBdcLptXI+XhGDWw9PmYWGmCHEjmSkQIsrffN1+13iOrpx5JRwBybZma7LhBxw9uR3dEYh9Jws/5xzZsYLqbQa3CPYM5eL35vklPR8+CTJ5yKnadSFrXVslCgeQMJvSsrEg6nzZbEAz4vMvBQj52GU8Rhm92ERKLEdtbizGyNdU0NjhpiIcouY/ohlu2XRXuGMuMmaqsAFTXIDl2K5ymva2PyVelkH8ZDd3sazwZDQlAPD8aF45F9x9bH5bYGTIpZJW9SEESy+cDOoL6UxKQFZcqL9LxinYGJl//fgkcXzVI01XfmxUAODfPUdz6atFfL3vJlVJpo3YuzDPlMPrHyf1JkNEhVDvxO+fmgxTQVY0gmn3Ah5d6TZgCZW9DyrYInZgLGyltIubapiAloIkX5JP5i2MK1EqZUWHTNjDtu8vPo/PRzzdCcIi+ZSliWyEbeU+D++crIXnPbMNmTkHJzR42pBufIgpfzfE/V9T5FFZKle3tKfwHoAZ9UTMTM4znXP3ZanBeXiU4Wo6mcatoiGdgiqN+uwCxcOksDfN4vfwT7fqfuEM3ts5Sjq+H/XA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(4326008)(6506007)(53546011)(5660300002)(316002)(54906003)(64756008)(66446008)(2616005)(66946007)(66556008)(66476007)(76116006)(37006003)(6636002)(91956017)(6512007)(83380400001)(36756003)(6486002)(8936002)(33656002)(2906002)(6862004)(26005)(71200400001)(478600001)(186003)(8676002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?c2Ms4gQFUoE62IoRZ0o3fpwDepbb/P3Xkxq08UmsOMubzMtXUZWavbklGWBd?=
 =?us-ascii?Q?bYzsoAluMAEhdBYUPwTp+0IGziGi4EVtb9fT2bH4yoGN1QbOg66VxmihFhG/?=
 =?us-ascii?Q?qVu47pLv+hPVDuVxeDvCqsNgD9jhHHoObTG5iKoswXj2FHEK5UiE92KYuS15?=
 =?us-ascii?Q?9L6NgqZ5whs15MwiFl/UXcWkPkV7+8Y7UWclgGgJWyG+/0BFQBNNzTN7XL8l?=
 =?us-ascii?Q?F05Fi+GaBdJeLIXVMd9k4xLPPsBLSM7djBNStSM8NjkUx/jawDLojHfHlqdk?=
 =?us-ascii?Q?O1wV9HAnKXZmQ7f8g7FB8cP7p9ii60Mm53m4Ct2MInW9W3yGDkQUF41ygfcS?=
 =?us-ascii?Q?MDdPC66uJDRhrYsHydaRDMQrnLRXvFY8rpgCIwMwP8jBM24DJazvBMnfruiz?=
 =?us-ascii?Q?QdRewkg/sNvbUbFZWlgiEJrXd01B7EtL123Fxd7TQhvn47r+Woq+6bb9M4go?=
 =?us-ascii?Q?J7gyYmyRaXiaHb297K0ju9VbvQOOGKCFUPlR1a07+t+i+bWyBNTD9C82FldP?=
 =?us-ascii?Q?2Y0uUKtp4A3cNJROcYIvzOsnIr3GepIFKyjYCMI6FWGxROdTzOhcttDE58yp?=
 =?us-ascii?Q?7702lzmio19x9FI8AHY3Bxhqnfr6PiDash0AAnX/hrQreGLkxEhBiMN377vM?=
 =?us-ascii?Q?jqV2GC2hGjk0Nk3hrmMEWaYhXRQjHqXy5GSx3aokyaA9TlNDxVLrABRJYtrw?=
 =?us-ascii?Q?UN8WtMlj8/yY+Fsv2dUhWKTEFEIldIa3xnl7ZrBzQWF67qEph1P+Xsr0b+6H?=
 =?us-ascii?Q?6FdsXzAMNiti6oa1ez2fw+0RbNB+CmhjYOcOA/6e7dcF497XrX85d8B0MbNV?=
 =?us-ascii?Q?Buczv8GbXMakJk73BYa+v2BmeFcX0OzE7FIwibvTOgGhHFne3h5JXzObjs8m?=
 =?us-ascii?Q?LsscQ/Iu4jfr6wI1h/sHabtlQBA4YKtzkN68kKBOES2PBQKr9/bAsHvI777j?=
 =?us-ascii?Q?tK+B77dp5c5DTSOQ2rX8+7jNCiSRKvndYmpVjfdJo0bpZcA8LMHm5AGi0OLP?=
 =?us-ascii?Q?I8X/ir6EFhnXdJHXFfhWYpq0CbPmJMWvCSl+Tw48hMFIf49o3djNLyy0yfdy?=
 =?us-ascii?Q?TJR22s5o+OryE0aIG21OQdtVaKABxwmpX7Za/Rf+8nOiOlCYV80v0Pr/KKcX?=
 =?us-ascii?Q?VQC7T0xoqP94gAqFAIHzmZNPWvSPu3OyAL64V6CkfKxSqlLHkTFUSF6q9dj5?=
 =?us-ascii?Q?VLeN/G69gLUhrj+DHvb0uFOkyUn83ftUrrpuwc9Fx+5jGD+WakgRwmKMe7qK?=
 =?us-ascii?Q?lpWQGq7QB3El5o9ikpS+ZyvXWN//I15Of63rgbTzh1g8ghQ9OShJ/6Yajvqg?=
 =?us-ascii?Q?dKDjN33i7YT5mE8nOiDjJElQZRaSrfVWkaUVxo4qBuUDQw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4B9CD19A494B3E438EA085D92F90D261@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3791
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f51fb04-4725-4f90-e121-08d8e39b4f70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G7dtrkOMRsiLI4MdZIPflvQmAsSbAjV3MNmkdgf/VNCT8TUSdXn+L+LAhfQnyb4UsJea5N2eUb2eoc/DVbVeT2K7V3p75gYlvyPe7Q3Hjks0iFuFQlsDDnR7l0ELEgQ21iqstJeBv8/R8AjJngJxwJ8aeh9J0tRA2czfmv50UmC28P0DPfNvddwG1WCkgErIgZZ6PeavqN3+dnNF+IhhSgHz0B589vtupsilyKMMUsYO08kihVSwfcz6wQXJvuejmXwi7R6fuyjwIaFiXFeZhGos+DDczvxVPb2cSis36fb5cCGesjAddTUPVIUBNm85PxOYCzuN9zwQmLcOSQGCz2cZbv4tHy6RTEzXRBpWnCv2CWI9MJX3vMKzKwHJ1zwuwXD1c0FWg17uH53kH+N02Dadw1yODaKKA3sNBA+ZpGCCPUQHsIzFKWm2PuB201tVlSQ/jGu25Q9NQ77rXV2WyYwail3WQYq0kLGh1VsxXS0V+uzIBJgr6MzHxuxCWdJ0eT69JiURQn3T3eX2zWmKE6SDOJDz1Flhlw9umQWxsACoCeBgcAVByeuQgpAPA9KjI6NruOkbXaroz+lf4KXiC46i+46arhO/3jvYeyR7o8ebvKhVWAhKMGpI6at+hWe6E0lUvb6VVcWn7G955XK50HHQGt0qZEiTDHyNFEPMrvo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(36840700001)(53546011)(5660300002)(6506007)(82310400003)(37006003)(36756003)(36860700001)(2616005)(81166007)(70206006)(6636002)(70586007)(8676002)(26005)(4326008)(82740400003)(54906003)(316002)(33656002)(478600001)(6862004)(6486002)(6512007)(47076005)(336012)(356005)(8936002)(186003)(2906002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 08:05:59.1511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740c8d4f-79e8-47c6-ee2a-08d8e39b56f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4467

Hi,

> On 10 Mar 2021, at 07:58, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE to be able to
> provide the path to DTB we want to embed into Xen image.
> If no path provided - the dtb will not be embedded.
>=20
> Remove the line: AFLAGS-y +=3D -DCONFIG_DTB_FILE=3D\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Makefile | 5 ++---
> xen/common/Kconfig    | 8 ++++++++
> 2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 16e6523e2c..46e6a95fec 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,9 +68,8 @@ extra-y +=3D $(TARGET_SUBARCH)/head.o
>=20
> #obj-bin-y +=3D ....o
>=20
> -ifdef CONFIG_DTB_FILE
> +ifneq ($(CONFIG_DTB_FILE),"")
> obj-y +=3D dtb.o
> -AFLAGS-y +=3D -DCONFIG_DTB_FILE=3D\"$(CONFIG_DTB_FILE)\"
> endif
>=20
> ALL_OBJS :=3D $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
> @@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
> xen.lds: xen.lds.S
> 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>=20
> -dtb.o: $(CONFIG_DTB_FILE)
> +dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>=20
> .PHONY: clean
> clean::
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index eb953d171e..a27836bf47 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,14 @@ config DOM0_MEM
>=20
> 	  Leave empty if you are not sure what to specify.
>=20
> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	depends on HAS_DEVICE_TREE
> +	---help---
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.
> +
> config TRACEBUFFER
> 	bool "Enable tracing infrastructure" if EXPERT
> 	default y
> --=20
> 2.29.0
>=20


