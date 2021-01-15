Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96A2F76E7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67918.121423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Man-0000Iv-Q0; Fri, 15 Jan 2021 10:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67918.121423; Fri, 15 Jan 2021 10:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Man-0000IV-M7; Fri, 15 Jan 2021 10:44:33 +0000
Received: by outflank-mailman (input) for mailman id 67918;
 Fri, 15 Jan 2021 10:44:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zlKq=GS=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l0Mal-0000IN-Nx
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:44:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c2b787c-d78a-4f9f-9954-941b9d8bfb39;
 Fri, 15 Jan 2021 10:44:28 +0000 (UTC)
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by VI1PR08MB4463.eurprd08.prod.outlook.com (2603:10a6:803:101::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 10:44:25 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::f8) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Fri, 15 Jan 2021 10:44:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Fri, 15 Jan 2021 10:44:24 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Fri, 15 Jan 2021 10:44:23 +0000
Received: from 15fa0d5b856f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49EBEF46-0FFB-4F6F-8CEF-8773CF5D6F6A.1; 
 Fri, 15 Jan 2021 10:44:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15fa0d5b856f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jan 2021 10:44:18 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1662.eurprd08.prod.outlook.com (2603:10a6:800:52::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 10:43:58 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 10:43:58 +0000
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
X-Inumbo-ID: 2c2b787c-d78a-4f9f-9954-941b9d8bfb39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5De1qY0lwHLnuidj1GWz4kXY7GUHbDjrrmrJivEsFZQ=;
 b=A43MoEIbjxhfzNYq7OiECh2E/OzhHmSkjR23REqRe70bbSiPxfndHjGGr+3UldjvPWPprrqsqwHV4fZD5OF1Ey9hmXyIpvOIqygr3o4KagZvE+ouBd7HPniF16eU3InTSOERhNYjtrl9VJRXDSAkBHlJ+V4iSU+KoTaUOLZhtoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c00bab7ca00b102d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpoquDHt3q/Kx8PQ9Xsa5ClT7BmOMUlZZJc/Xo5/hufDZtnbLkJlSllBYddk4JzyLlk8d/bfrm8eMGdDAJFdaTQhVssW8uhC1Xn+9OM7vvH1Qwehs/J13/dycHuBW/TL1RsIHcKW+0hPz1Bg4TDZV5MS1xbta0vNSK8ByXZGN9JBWt15DlLDDhlqueEDD+hbDXUwZ7/ZDpSHt3OEA3mTlhnFxeZdunyX5QHhlOEtP9AFIN9Gc9trqbRpOdULHQSQWyDGN6aKwAwSBVa0JBQDXuuETQ6yEjZeS6vADtI/KdZSSiqE7I+O3pvtrNdhHvec7OYUCsozPoHPlt6EJO9rzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5De1qY0lwHLnuidj1GWz4kXY7GUHbDjrrmrJivEsFZQ=;
 b=I3sByjpGRvVNb4P1g3NjpadbGZJXsekTOe4o7TpOksIdqdgvOyLLCbue/vK1TETJWtnIJ7ZMzqNzn3uxGNCcCS291VKQbUodD/MyhkMBFWJ+SxuyNUmDE6ea67131g/TR32y724WOAE01DkF9Lb4/GXoxBEdEc9sHSfYKsLdUZ623PZfaNhaxOb64d9kzkMXMP6S93kKsJL4ubRLRLSp8qDcTCHmLLwrSdcGPOi21dilkgVWN6pwE5dDtnKkK/PTc0EpVqBpTAHXNeUTCQEyR2m5ggYU6FqdFknbxLd+rvIruPE2H35LVlvi8APk1eD8DL9D2PnMyYh4tYqHNnKSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5De1qY0lwHLnuidj1GWz4kXY7GUHbDjrrmrJivEsFZQ=;
 b=A43MoEIbjxhfzNYq7OiECh2E/OzhHmSkjR23REqRe70bbSiPxfndHjGGr+3UldjvPWPprrqsqwHV4fZD5OF1Ey9hmXyIpvOIqygr3o4KagZvE+ouBd7HPniF16eU3InTSOERhNYjtrl9VJRXDSAkBHlJ+V4iSU+KoTaUOLZhtoo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "committers@xenproject.org"
	<committers@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	=?utf-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
Thread-Topic: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
Thread-Index: AQHW5QJrM06mM8kmgkKihyk9gkB60aonVGsAgAAxGgCAAQcdgA==
Date: Fri, 15 Jan 2021 10:43:58 +0000
Message-ID: <B89D8E81-4AC7-48D5-8091-8D08DEA3E4EE@arm.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
In-Reply-To: <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 354473c1-8ae8-4e0e-2116-08d8b9428654
x-ms-traffictypediagnostic: VI1PR0801MB1662:|VI1PR08MB4463:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB44630518761D86DB45A19B539DA70@VI1PR08MB4463.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 glhfuW4emNwLJTMXQNbgL+DiQDcfX6KgTVxdoyqfv/0l0xY+JiqRvy/ir30rgDpSuiBAuxb5eSjae1DZlw9Yv+j+jfiABMloVw8BCihv7EF/A0ipDaFt8xgf8ZWmikYyk9I2vvt5FlnDl4QXhvZXArlcB+4zXXwiwGLpg5dO0Lk0maGickaXxBgHajar7SLQEn+BGjIaR9GRiBwL2zzNE9sPDvODXZXIP/RlwZCyZuG03A0cFnGtDkatStm7UKt94inOmYZMmQ1j4wtsta8xUAypx+gNtyJ8rZjxugeZs2dZQHJM58hCnYy7ttSMt1hDTWI3gTf+CJPlgpJIu4oTTeg7vdMcJDaMuWd6yqArYgSfKOnGOmEB76u25idNNVaQWYH7v7VmOcvtsL/efuXV+MUCf35aubJO2fzGTCxo+0DZalAjEbPz2dl8Ls/HaGplOnQHOyg6r8IFIrva1Zaswpp5ihA/yFo69F837nr23eVZRQcIKM4Uy9cPvi7bCV7fBKzDqbHehg8IIXolmiJNtw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(5660300002)(86362001)(6486002)(4326008)(186003)(2616005)(33656002)(53546011)(966005)(71200400001)(8676002)(6506007)(26005)(6512007)(64756008)(478600001)(66946007)(66446008)(36756003)(91956017)(83380400001)(76116006)(316002)(6916009)(8936002)(55236004)(2906002)(66476007)(66556008)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SmlUTW1xL2lUNEZaTG1LSE41TzNybFhVZlFKU2dGVnNjOElwNXJZS2VwSjNs?=
 =?utf-8?B?NUhUeld0YW02Nm1mY3loekJhb3BqVDVHQnB3aitmU3dWZWVKWnVOWjVzS2RY?=
 =?utf-8?B?eGoxS3hlQ25FMTZJcFNFWlR1OFVpWDRLdUNyUi9aOFZrV1BLSEFyNCtuaGhE?=
 =?utf-8?B?RFJVQ1dGNXNUMjRjaHFQOXlTQm1aRjdoTnJBYjhkSVlSYjBodDRRTjNBSmdn?=
 =?utf-8?B?YjdHL2pCRmRSUkxMS3VwdTBlUHU0MUh6SStGNjB5YW9SNEhEK2FwdlBxSmxy?=
 =?utf-8?B?ai82YWtUUklSeVJ1WHR6alJhdXl4ZitvOWVkWURJSHRhWjhOaTZtbzA0blo5?=
 =?utf-8?B?UUNsay82NFBvdW9memlBaGh2OFdlSXNjT2hzYk9PTlFDV1REeWVaRHBDRW5O?=
 =?utf-8?B?NE1EdFR4cFJzU2daS2dYdXB0RUsrcEFpejh4aFIyVlBBRUYxbDduVmljQThv?=
 =?utf-8?B?eUVMcVVyZGFSOVdxcldVdENpbnFCUS9aRkZnekxCZ1F2dTZnbm1kekNleUxS?=
 =?utf-8?B?RFNHQmZxeElnelR6anAvTGl6cFd1aUEyQm13UUVaTFFoYkVOTDZFYXFXbUl6?=
 =?utf-8?B?cUZPaExndTd3ZURRcDBWaG1OVWMzNWxoRUlJbUtnbUlGcHRjM05SK1YxenpN?=
 =?utf-8?B?TERNQktrclAreVI3dklZWHlTSktiUXhPUU1kMXFnemx2OWNMQkZlaGYzYlpz?=
 =?utf-8?B?a0dmOGV1T2FaUkI3MUZWVGt5blVuWVY3RlV2VkxIVll5Wk1RWlpmZlZjK3pH?=
 =?utf-8?B?dlpoTzZlVWVDM1ZiVjhBR0M1ZFNyUHFTM2RSWm1uZjY2R0dicjdpOVgvWjFw?=
 =?utf-8?B?NFNpS2VXQi80SjRMM0FvYmwwbmNHNlhwS0JINW9hK2Frc3JIb2YyZ3VLclhL?=
 =?utf-8?B?RzBYT3l3a09wWHRYbTVEdVdJMnVwS1FMZDVDWmRhb2szcXNNbTRKTFExRklw?=
 =?utf-8?B?aGtvaU1RaDJSRlZaRjhGRU1iWU16eDZweFdVUzhtU0paMHZZL0prNFZoTXYz?=
 =?utf-8?B?VktFT1Y4dm5JdVVWeDNDRkdORFlPSm1SUW85a0J0dWV1OVVtVkQ1Q3BsWlNX?=
 =?utf-8?B?THBYL3Q3M2U4Z3A0RkJGQnhTMzc1cnFxWUJpY1FqYXE0SDZBVU96MjFwc1Vi?=
 =?utf-8?B?ZU50RVloWW0vbnFkMVFSbUQwUUhndUVrQU9pTlNRNmJOakZrUmQyczdDZk1j?=
 =?utf-8?B?OXF1RlFZeWZFcENFQkg2d2gyTkJDYzE2WENIZXJpUGVFS1gxd3lNQ2tvRjM2?=
 =?utf-8?B?aUVBdTloTm10ZzRGdmk4ZDhBaXZYVUdvZ1hDWlNVWEhseEdKbUdWYVBIVDQx?=
 =?utf-8?Q?Ws6v4ZHT3XC73BcxPFzBgw5+8Q4j9X6NXs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <49388D59140B264084153E5EBEE190DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1662
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcf20cf6-021a-4567-09a7-08d8b94276a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tQqkSCJnwAbnpn+U7o+ZuIePXnVcprLJGvJQ4eO+rErNHiC9xFPjlyUiTOctaqyd1bZMYL5zs+ES+WNdwo2nJEblvKkMfMbRT8E2SX26zB2uw9rA8KLwgYIZi7mMkuCHjwnwzI4koSXeJsyJcf0jZrw9gu8usF5XMN4wi4wfrW+n/NDkgQxFOMbH43+UofnViTtuhA/u8yYZGRT0VOHJPOcRKNV3WncwLzs4D4zd95O3UTU3epgQnb4YLFRxbTIs46V9UKnPEnG/f7MPZtFs3nrjkmUIRckq7VdFVumKrLQS5njFLWlaQeQAprvVW3CF13zEJvFUB0GYRr9Q4LyW9jrhcQGXvy7atdDNu2ezaZWIroWGqbx0HZQQJcYsIDIHmTJ7QuNsLdVKuNdvRzgLd+miD3kmE4PXEz7XVS/3sJiD61Si+uIc6gQPIxgE10lfqAul+ZPLUgz6ZITsDeXaLShqOzJ9MaagtuNshbN9U4TQ3ikifeklqo5YHNhs/6nK12FUW76tzUpwGMQh86Dj9hvU8+nYV7YPllIkPU1jCTdb+bi6WedkOVdqLm+Tmg5H
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36756003)(336012)(86362001)(6512007)(81166007)(8936002)(8676002)(5660300002)(82740400003)(2616005)(107886003)(316002)(53546011)(55236004)(6862004)(34020700004)(186003)(4326008)(6506007)(33656002)(356005)(82310400003)(70206006)(83380400001)(70586007)(478600001)(26005)(966005)(2906002)(47076005)(54906003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 10:44:24.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354473c1-8ae8-4e0e-2116-08d8b9428654
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4463

SGksDQoNCj4gT24gMTQgSmFuIDIwMjEsIGF0IDE5OjAyLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDE0LzAxLzIwMjEgMTY6MDYsIElh
biBKYWNrc29uIHdyb3RlOg0KPj4gVGhlIGxhc3QgcG9zdGluZyBkYXRlIGZvciBuZXcgZmVhdHVy
ZSBwYXRjaGVzIGZvciBYZW4gNC4xNSBpcw0KPj4gdG9tb3Jyb3cuIFsxXSAgV2Ugc2VlbSB0byBi
ZSBnZXR0aW5nIGEgcmVhc29uYWJsZSBnb29kIGZsb29kIG9mIHN0dWZmDQo+PiB0cnlpbmcgdG8g
bWVldCB0aGlzIGRlYWRsaW5lIDotKS4NCj4+IA0KPj4gUGF0Y2hlcyBmb3IgbmV3IGZldHVyZXMg
cG9zdGVkIGFmdGVyIHRvbW9ycm93IHdpbGwgYmUgZGVmZXJyZWQgdG8gdGhlDQo+PiBuZXh0IFhl
biByZWxlYXNlIGFmdGVyIDQuMTUuICBOQiB0aGUgcHJpbWFyeSByZXNwb25zaWJpbGl0eSBmb3IN
Cj4+IGRyaXZpbmcgYSBmZWF0dXJlJ3MgcHJvZ3Jlc3MgdG8gbWVldCB0aGUgcmVsZWFzZSBzY2hl
ZHVsZSwgbGllcyB3aXRoDQo+PiB0aGUgZmVhdHVyZSdzIHByb3BvbmVudChzKS4NCj4+IA0KPj4g
DQo+PiAgQXMgYSByZW1pbmRlciwgaGVyZSBpcyB0aGUgcmVsZWFzZSBzY2hlZHVsZToNCj4+ICsg
KHVuY2hhbmdlZCBpbmZvcm1hdGlvbiBpbmRlbnRlZCB3aXRoIHNwYWNlcyk6DQo+PiANCj4+ICAg
RnJpZGF5IDE1dGggSmFudWFyeSAgICBMYXN0IHBvc3RpbmcgZGF0ZQ0KPj4gDQo+PiAgICAgICBQ
YXRjaGVzIGFkZGluZyBuZXcgZmVhdHVyZXMgc2hvdWxkIGJlIHBvc3RlZCB0byB0aGUgbWFpbGlu
ZyBsaXN0DQo+PiAgICAgICBieSB0aGlzIGNhdGUsIGFsdGhvdWdoIHBlcmhhcHMgbm90IGluIHRo
ZWlyIGZpbmFsIHZlcnNpb24uDQo+PiANCj4+ICAgRnJpZGF5IDI5dGggSmFudWFyeSAgICBGZWF0
dXJlIGZyZWV6ZQ0KPj4gDQo+PiAgICAgICBQYXRjaGVzIGFkZGluZyBuZXcgZmVhdHVyZXMgc2hv
dWxkIGJlIGNvbW1pdHRlZCBieSB0aGlzIGRhdGUuDQo+PiAgICAgICBTdHJhaWdodGZvcndhcmQg
YnVnZml4ZXMgbWF5IGNvbnRpbnVlIHRvIGJlIGFjY2VwdGVkIGJ5DQo+PiAgICAgICBtYWludGFp
bmVycy4NCj4+IA0KPj4gICBGcmlkYXkgMTJ0aCBGZWJydWFyeSAqKnRlbnRhdHZlKiogICBDb2Rl
IGZyZWV6ZQ0KPj4gDQo+PiAgICAgICBCdWdmaXhlcyBvbmx5LCBhbGwgY2hhbmdlcyB0byBiZSBh
cHByb3ZlZCBieSB0aGUgUmVsZWFzZSBNYW5hZ2VyLg0KPj4gDQo+PiAgIFdlZWsgb2YgMTJ0aCBN
YXJjaCAqKnRlbnRhdGl2ZSoqICAgIFJlbGVhc2UNCj4+ICAgICAgIChwcm9iYWJseSBUdWVzZGF5
IG9yIFdlZG5lc2RheSkNCj4+IA0KPj4gIEFueSBwYXRjaGVzIGNvbnRhaW5pbmcgc3Vic3RhbnRp
YWwgcmVmYWN0b3JpbmcgYXJlIHRvIHRyZWF0ZWQgYXMNCj4+ICBuZXcgZmVhdHVyZXMsIGV2ZW4g
aWYgdGhleSBpbnRlbnQgaXMgdG8gZml4IGJ1Z3MuDQo+PiANCj4+ICBGcmVlemUgZXhjZXB0aW9u
cyB3aWxsIG5vdCBiZSByb3V0aW5lLCBidXQgbWF5IGJlIGdyYW50ZWQgaW4NCj4+ICBleGNlcHRp
b25hbCBjYXNlcyBmb3Igc21hbGwgY2hhbmdlcyBvbiB0aGUgYmFzaXMgb2YgcmlzayBhc3Nlc3Nt
ZW50Lg0KPj4gIExhcmdlIHNlcmllcyB3aWxsIG5vdCBnZXQgZXhjZXB0aW9ucy4gIENvbnRyaWJ1
dG9ycyAqbXVzdCBub3QqIHJlbHkgb24NCj4+ICBnZXR0aW5nLCBvciBleHBlY3QsIGEgZnJlZXpl
IGV4Y2VwdGlvbi4NCj4+IA0KPj4gKyBOZXcgb3IgaW1wcm92ZWQgdGVzdHMgKHN1cHBvc2luZyB0
aGV5IGRvIG5vdCBpbnZvbHZlIHJlZmFjdG9yaW5nLA0KPj4gKyBldmVuIGJ1aWxkIHN5c3RlbSBy
ZW9yZ2FuaXNhdGlvbiksIGFuZCBkb2N1bWVudGF0aW9uIGltcHJvdmVtZW50cywNCj4+ICsgd2ls
bCBnZW5lcmFsbHkgYmUgdHJlYXRlZCBhcyBidWdmaXhlcy4NCj4+IA0KPj4gIFRoZSBjb2RlZnJl
ZXplIGFuZCByZWxlYXNlIGRhdGVzIGFyZSBwcm92aXNpb25hbCBhbmQgd2lsbCBiZSBhZGp1c3Rl
ZA0KPj4gIGluIHRoZSBsaWdodCBvZiBhcHBhcmVudCBjb2RlIHF1YWxpdHkgZXRjLg0KPj4gDQo+
PiAgSWYgYXMgYSBmZWF0dXJlIHByb3BvbmVudCB5b3UgZmVlbCB5b3VyIGZlYXR1cmUgaXMgYXQg
cmlzayBhbmQgdGhlcmUNCj4+ICBpcyBzb21ldGhpbmcgdGhlIFhlbiBQcm9qZWN0IGNvdWxkIGRv
IHRvIGhlbHAsIHBsZWFzZSBjb25zdWx0IG1lIG9yDQo+PiAgdGhlIENvbW11bml0eSBNYW5hZ2Vy
LiAgSW4gc3VjaCBzaXR1YXRpb25zIHBsZWFzZSByZWFjaCBvdXQgZWFybGllcg0KPj4gIHJhdGhl
ciB0aGFuIGxhdGVyLg0KPj4gDQo+PiANCj4+IEluIG15IGxhc3QgdXBkYXRlIEkgYXNrZWQgdGhp
czoNCj4+IA0KPj4+IElmIHlvdSBhcmUgd29ya2luZyBvbiBhIGZlYXR1cmUgeW91IHdhbnQgaW4g
NC4xNSBwbGVhc2UgbGV0IG1lIGtub3cNCj4+PiBhYm91dCBpdC4gIElkZWFsbHkgSSdkIGxpa2Ug
YSBsaXR0bGUgc3RhbnphIGxpa2UgdGhpczoNCj4+PiANCj4+PiBTOiBmZWF0dXJlIG5hbWUNCj4+
PiBPOiBmZWF0dXJlIG93bmVyIChwcm9wb25lbnQpIG5hbWUNCj4+PiBFOiBmZWF0dXJlIG93bmVy
IChwcm9wb25lbnQpIGVtYWlsIGFkZHJlc3MNCj4+PiBQOiB5b3VyIGN1cnJlbnQgZXN0aW1hdGUg
b2YgdGhlIHByb2JhYmlsaXR5IGl0IG1ha2luZyA0LjE1LCBhcyBhICVhZ2UNCj4+PiANCj4+PiBC
dXQgZnJlZS1mb3JtIHRleHQgaXMgT0sgdG9vLiAgUGxlYXNlIHJlcGx5IHRvIHRoaXMgbWFpbC4N
Cj4+IEkgcmVjZWl2ZWQgb25lIG1haWwuICBUaGFua3MgdG8gT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gZm9yIGhpcyB1cGRhdGUNCj4+IG9uIHRoZSBmb2xsb3dpbmcgZmVlYXR1cmU6DQo+PiANCj4+
ICBJT1JFUSBmZWF0dXJlICgrIHZpcnRpby1tbWlvKSBvbiBBcm0NCj4+ICBodHRwczovL3d3dy5t
YWlsLWFyY2hpdmUuY29tL3hlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZy9tc2c4NzAwMi5o
dG1sDQo+PiANCj4+ICBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4gIE9sZWtzYW5k
ciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IA0KPj4gSSBz
ZWUgdGhhdCBWNCBvZiB0aGlzIHNlcmllcyB3YXMganVzdCBwb3N0ZWQuICBUaGFua3MsIE9sZWtz
YW5kci4NCj4+IEknbGwgbWFrZSBhIHNlcGFyYXRlIGVucXVpcnkgYWJvdXQgeW91ciBzZXJpZXMu
DQo+PiANCj4+IEkgdGhpbmsgaWYgcGVvcGxlIGRvbid0IGZpbmQgdGhlIHRyYWRpdGlvbmFsIGZl
YXR1cmUgdHJhY2tpbmcgdXNlZnVsLA0KPj4gSSB3aWxsIHRyeSB0byBhc3NlbWJsZSBSZWxlYXNl
IE5vdGVzIGluZm9ybWF0aW9uIGxhdGVyLCBkdXJpbmcgdGhlDQo+PiBmcmVlemUsIHdoZW4gZmV3
ZXIgcGVvcGxlIGFyZSBydXNoaW5nIHRvIHRyeSB0byBtZWV0IHRoZSBkZWFkbGluZXMuDQo+IA0K
PiAoTm93IEkgaGF2ZSB3b3JraW5nIGVtYWlsKS4NCj4gDQo+IEZlYXR1cmVzOg0KPiANCj4gMSkg
YWNxdWlyZV9yZXNvdXJjZSBmaXhlcy4NCj4gDQo+IE5vdCByZWFsbHkgYSBuZXcgZmVhdHVyZSAt
IGVudGlyZWx5IGJ1Z2ZpeGluZyBhIHByZWV4aXN0aW5nIG9uZS4NCj4gRGV2ZWxvcGVkIGJ5IG1l
IHRvIGhlbHAgMikuICBSZWFzb25hYmx5IHdlbGwgYWNrZWQsIGJ1dCBhd2FpdGluZw0KPiBmZWVk
YmFjayBvbiB2My4NCj4gDQo+IDIpIEV4dGVybmFsIFByb2Nlc3NvciBUcmFjZSBzdXBwb3J0Lg0K
PiANCj4gRGV2ZWxvcG1lbnQgYnkgTWljaGHFgi4gIERlcGVuZHMgb24gMSksIGFuZCBhd2FpdGlu
ZyBhIG5ldyB2ZXJzaW9uIGJlaW5nDQo+IHBvc3RlZC4NCj4gDQo+IEFzIGZhciBhcyBJJ20gYXdh
cmUsIGJvdGggSW50ZWwgYW5kIENFUlQgaGF2ZSBwcm9kdWN0aW9uIHN5c3RlbXMNCj4gZGVwbG95
ZWQgdXNpbmcgdGhpcyBmdW5jdGlvbmFsaXR5LCBzbyBpdCBpcyB2ZXJ5IGhpZ2hseSBkZXNpcmFi
bGUgdG8gZ2V0DQo+IGludG8gNC4xNS4NCj4gDQo+IDMpIEluaXRpYWwgVHJlbmNoYm9vdCtTS0lO
SVQgc3VwcG9ydC4NCj4gDQo+IEkndmUgZ290IHR3byBwYXRjaGVzIEkgbmVlZCB0byBjbGVhbiB1
cCBhbmQgc3VibWl0IHdoaWNoIGlzIHRoZSBmaXJzdA0KPiBwYXJ0IG9mIHRoZSBUcmVuY2hib290
ICsgRHluYW1pYyBSb290IG9mIFRydXN0IG9uIEFNRCBzdXBwb3J0LiAgVGhpcw0KPiB3aWxsIGdl
dCBYZW4gaW50byBhIHBvc2l0aW9uIHdoZXJlIGl0IGNhbiBiZSBzdGFydGVkIHZpYSB0aGUgbmV3
IGdydWINCj4gInNlY3VyZV9sYXVuY2giIHByb3RvY29sLg0KPiANCj4gTGF0ZXIgcGF0Y2hlcyAo
aS5lLiBwb3N0IDQuMTUpIHdpbGwgZG8gc3VwcG9ydCBmb3IgSW50ZWwgVFhUIChpLmUuDQo+IHdp
dGhvdXQgdGJvb3QpLCBhcyB3ZWxsIGFzIHRoZSBjb21tb24gaW5mcmFzdHJ1Y3R1cmUgZm9yIHRo
ZSBUUE0gZXZlbnQNCj4gbG9nIGFuZCBmdXJ0aGVyIG1lYXN1cmVtZW50cyBkdXJpbmcgdGhlIGJv
b3QgcHJvY2Vzcy4NCj4gDQo+IDQpICJzaW1wbGUiIGF1dG90ZXN0IHN1cHBvcnQuDQoNCg0KNSkg
U01NVS12MyBTdXBwb3J0IGZyb20gUmFodWwgU2luZ2gNCg0KU2VlICJ4ZW4vYXJtOiBBZGQgc3Vw
cG9ydCBmb3IgU01NVXYzIGRyaXZlcuKAnQ0KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIxLTAxL21zZzAwNDI5Lmh0bWwNCg0KQWxtb3N0IGV2
ZXJ5dGhpbmcgaW4gdGhlIHNlcmllIGlzIGFscmVhZHkgYWNrZWQuDQoNCkNoZWVycw0KQmVydHJh
bmQNCg0KPiANCj4gDQo+IEJ1Z3M6DQo+IA0KPiAxKSBIUEVUL1BJVCBpc3N1ZSBvbiBuZXdlciBJ
bnRlbCBzeXN0ZW1zLiAgVGhpcyBoYXMgaGFkIGxpdGVyYWxseSB0ZW5zDQo+IG9mIHJlcG9ydHMg
YWNyb3NzIHRoZSBkZXZlbCBhbmQgdXNlcnMgbWFpbGluZyBsaXN0cywgYW5kIHByZXZlbnRzIFhl
bg0KPiBmcm9tIGJvb3RpbmcgYXQgYWxsIG9uIHRoZSBwYXN0IHR3byBnZW5lcmF0aW9ucyBvZiBJ
bnRlbCBsYXB0b3AuICBJJ3ZlDQo+IGZpbmFsbHkgZ290IGEgcmVwcm8gYW5kIHBvc3RlZCBhIGZp
eCB0byB0aGUgbGlzdCwgYnV0IHN0aWxsIGluIHByb2dyZXNzLg0KPiANCj4gMikgInNjaGVkdWxl
ciBicm9rZW4iIGJ1Z3MuICBXZSd2ZSBoYWQgNCBvciA1IHJlcG9ydHMgb2YgWGVuIG5vdA0KPiB3
b3JraW5nLCBhbmQgdmVyeSBsaXR0bGUgaW52ZXN0aWdhdGlvbiBvbiB3aGF0cyBnb2luZyBvbi4g
IFN1c3BpY2lvbiBpcw0KPiB0aGF0IHRoZXJlIG1pZ2h0IGJlIHR3byBidWdzLCBvbmUgd2l0aCBz
bXQ9MCBvbiByZWNlbnQgQU1EIGhhcmR3YXJlLCBhbmQNCj4gb25lIG1vcmUgZ2VuZXJhbCAic29t
ZSB3b3JrbG9hZHMgY2F1c2UgbmVnYXRpdmUgY3JlZGl0IiBhbmQgbWlnaHQgb3INCj4gbWlnaHQg
bm90IGJlIHNwZWNpZmljIHRvIGNyZWRpdDIgKGRlYnVnZ2luZyBmZWVkYmFjayBkaWZmZXJzIC0g
YWxzbw0KPiBtaWdodCBiZSAzIHVuZGVybHlpbmcgaXNzdWUpLg0KPiANCj4gQWxsIG9mIHRoZXNl
IGhhdmUgaGFkIHJlcGVhdGVkIGJ1ZyByZXBvcnRzLiAgSSdkIGNsYXNzaWZ5IHRoZW0gYXMNCj4g
YmxvY2tlcnMsIGdpdmVuIHRoZSBpbXBhY3QgdGhleSdyZSBoYXZpbmcgb24gcGVvcGxlLg0KPiAN
Cj4gfkFuZHJldw0KDQo=

