Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54088A495B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 09:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705885.1102802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwH4n-0003pM-41; Mon, 15 Apr 2024 07:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705885.1102802; Mon, 15 Apr 2024 07:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwH4n-0003mj-0Z; Mon, 15 Apr 2024 07:48:29 +0000
Received: by outflank-mailman (input) for mailman id 705885;
 Mon, 15 Apr 2024 07:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=js9Q=LU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rwH4l-0003mb-Uz
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 07:48:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a754506-fafc-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 09:48:26 +0200 (CEST)
Received: from AS9PR06CA0490.eurprd06.prod.outlook.com (2603:10a6:20b:49b::16)
 by DB4PR08MB8103.eurprd08.prod.outlook.com (2603:10a6:10:385::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 07:48:22 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::f4) by AS9PR06CA0490.outlook.office365.com
 (2603:10a6:20b:49b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 07:48:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Mon, 15 Apr 2024 07:48:20 +0000
Received: ("Tessian outbound e14047529286:v313");
 Mon, 15 Apr 2024 07:48:20 +0000
Received: from b9aa925e00fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 615F40C6-D644-4F2E-A1B0-4869B274332B.1; 
 Mon, 15 Apr 2024 07:48:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9aa925e00fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Apr 2024 07:48:13 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU2PR08MB10160.eurprd08.prod.outlook.com (2603:10a6:10:496::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 07:48:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 07:48:11 +0000
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
X-Inumbo-ID: 8a754506-fafc-11ee-b908-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AeKoqANcHOFlmYiswcjUouVIuJ6hJcq2U+AHnwvZUK/+OCy9/uDZYfNwCgUiu33I6/nxDVWRHRXgpj02GrZoVru+O2ZNyacj3QgvK+jdQp8kBGUuvuTaUIKJayxWywy+/vOVCP3rVBqOWH1ZhDVcDULJoJwGRqTL7eZdu0WMgsEjCxC3YOEEmLrbblBRXfr6CLIUyz7jmvQzGbblqMlzYPwNaTZvLVJwWnTyML2tvfpvMZrl3Kk+1fw+b14/RJiBP8DFI8IRu5zsp1BjUPgK462ga7OJFmsuCwzYUaQ09IiYsbpB7DZZ5qV+9RUTasTAENak5jM9Y1rUsTvb9V5liA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax7pH6n0SRY0NYR75mNBgD/5jZS4gxAl1d3evgc0CL8=;
 b=b6GJamtARCol9F52s0jKht/kfN5iUaw8Up+JpxJLihbeJ4tl4gJyvVYlBJhcGqfsZMmNB2im1TqryKlvv+s/UgOjipNUp7SldA9FAHi+008R5YE8Y1PxWrO5poMTsQtpzklBQhM17aemu956HswZMnHYFvzuIEqygGq+6QfeKrtVkxL8tkawhXBxBCZ0j3BhynVazIDCpgl9viZexwHRAJhROZF5xcGuAICcrn5cuxvw2dd4ZPJQORodpcdCKN4Sc/9essvsd9UOS1+Z77MhduqERW2WrTHtxJFHf8TxQPaOYWX92PiRlwcCKhs/bfmAatLsU86dYS47PqtmaHKtFQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax7pH6n0SRY0NYR75mNBgD/5jZS4gxAl1d3evgc0CL8=;
 b=wU03phdI7/v6mbpZ4YptnVMJwZ1CaBkCyk5AtKJyptC2HgnYED1WpSCp55Lb8mFw1/i0NWnsClMOpY4+6yRr6cKh9XtZC9v+R2a7IlCX2oTjFegmlVNZ4mBxoo2e2Vk8gfxoqnHWKeuU4YRnK8CgnLEPOtvQK6/ZNcwQ9viuDKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb3967e1c73251de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBIFU+qItRJIet0xM2DOuEz630NJu4RJURl+kohXJefkEzCabFVeZOK30t8OFaY4EVZkz0O3rEWR9JPJRCfB1CbDloU1eRwx5gCirTc54W9vmsYGyIhLspOKtYtMj3ccIsI1+4BlqjC18JWRglz+to02UKA4hc7m65POP7QJAYYwRLkqInQHNL6LoCfQgULWcQGFAUNt0oHBf/Pj6WpWHMB8n1EatHkD9i+DC5FSQO1UYsG+ChaWjCc3F44eZguYcOFzhUpm7mwl1DBPjuVDC9dzvB6goMZgjex/QUmbMwRyyLpSQzNjjaWIowUyj0BpwjMLQ7DfT82Poac4YDwAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax7pH6n0SRY0NYR75mNBgD/5jZS4gxAl1d3evgc0CL8=;
 b=H3X+Xsfs8oRGFSNpawO4UmjflpGTCctOhjxCloGLahRLl1Z2LGEBfvc5DVyod8SUjbgwE8WOJ64sgn4HTeiWlxZtQm77uP32uvOfdnnilG4p/Zz9HpCbZVAC4aSxDZhCXA90qb7qCBthz+6R55Yh8eTy4V+vIE448InAHa9iENG1KmCN6sM0ufd5TkNIWZI3b5VKRDAbrxK46sxNUMAmPZ56OUsDlhnhyQQgk0D5pq5NIcVemQAKo12+K1lff8Urmy27skYJuo4Xi4wfsaOvEL3xUTzBTt2skCwZMMFtWTmAh0K/sapyZzfKtWoQZFTWsm5GcyOzyCqwj1CcLoqvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax7pH6n0SRY0NYR75mNBgD/5jZS4gxAl1d3evgc0CL8=;
 b=wU03phdI7/v6mbpZ4YptnVMJwZ1CaBkCyk5AtKJyptC2HgnYED1WpSCp55Lb8mFw1/i0NWnsClMOpY4+6yRr6cKh9XtZC9v+R2a7IlCX2oTjFegmlVNZ4mBxoo2e2Vk8gfxoqnHWKeuU4YRnK8CgnLEPOtvQK6/ZNcwQ9viuDKo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefano
 Stabellini <stefano.stabellini@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Thread-Topic: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Thread-Index:
 AQHai6GBZ8b+Nd1+T0SyR++yfNJA87FiLIoAgAF1zYCAAQgbgIAAGvcAgAAZZ4CABBxngA==
Date: Mon, 15 Apr 2024 07:48:11 +0000
Message-ID: <3C913FB6-0273-476E-908F-9FE95CB3E114@arm.com>
References:
 <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com>
 <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
 <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com>
 <C8D49EE7-B214-41D5-9556-4D3B98629CEA@arm.com>
 <CAJ=z9a2ENW-3vh4N59csoeMHeMPGv9XFUuC6GrMTYMKM=FpwgQ@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a2ENW-3vh4N59csoeMHeMPGv9XFUuC6GrMTYMKM=FpwgQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU2PR08MB10160:EE_|AMS0EPF000001A0:EE_|DB4PR08MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d27e2ea-1d81-43fb-de3f-08dc5d206bc2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FaYZJaYlDjHfSqJD4CY1GbLkPGpusPaYA0ZACYw5cYY98jnireJXqQkNKuUUrH7YD8eYcLKG8D+35I7Hw/RcegA8S30MDIwCn80ooE6D1wd5bG7qmkhMOTG2RpVqDZrhKUvVL5G+G5D3E/dNXmc7s21c/pBVCePFGK9UPZxX30aXl7VT7Uc6bsYWvxTW8nsmF4JzdzokE99QZ2VGl+GeWamcnqp8dqZrgoJojcrPZntZIij4MjzaE5kYMEDywqljiaDiTUicEXXkMAp9N44XHDLC2MWdUEDUIqp145C6vNgUz2DrcRl+e8aHruZl5EsyVCO6z+oXrv0OLlE9g2E8rpOTZcdxbXnPPJ9eqCzTPkO3sl/460bWjLmkF43a1XSRpjDomEKtK2toMVNYDBoZxUYCOGf4+Ff6/Aq4Ukxx3qvOkwUGVbI5lQ6ZudsbNZwt7p+ZU7FnkS96Np2pA94+tDvz7ucTBV4DYmv6swKpGLNezJPsdyjCTeRnIHyAqujyMacbxOQImzNuWu+suk56CVJjvcd3C1C8gYe2sZCesNkMW3tsHhvc/+jlc0rOn3RjePC7UAlxe32QH9fw5RJ9QQv953SfvxPeY0C8g3GdDzsi7iUaM0dnkkC/iHFv6+GfNWMiD4sR9yt2uKikLiPWDJQxKWJGFE4n5ioPrJRiuUgIuWpbkbDWhd3SBezi7YcC5nBorUq3Apeet3QfrFiPkb8C77+3T0d/BXBBtH0C8Pg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D33127DF3EAF34ABEFB85BD98E19929@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10160
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94f1a620-9ca9-4170-8059-08dc5d20662d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ZdSNYiO3ThzBarkwxKJ7JKLxCen3EKb2NKO/71THWLCQ9K26ETJiEBXWw0was9fCJXa1wSQbq7KKV32+CjHBPq5cbywYb07KzKjzO0IXrETB5x/mt/vppiL5jz4KrSlvU9oi1lc2xQM5u4Cd4Ze6aCWkTe0/4sOYYfhw6pu0BvU+vlsQ/pLLFM2SH6BMPxdUGzWqdCyS7HzlmO8BjI2mccuoDMZ5b4hMRWLR+PuBbX+eRVaDBh/meulqFuS86nuwr4tFy5EiV6813yFkYWuzqtRvNS7QqlOkKBL/dKGqUyRSKaIq4gfVJzlSgc06CUhyU51mn/La6lBg6sdFpakaPYwKyDnBqH8lIDJfD8WiHVRnffjho3s8GdmkyBGv/hWbaXeuewHkPovkwtFKrQy3sydyljUiCqHdW9RJvqkL6B33BmYjBn7S3wS3fIt+S/F5W/SnI3BlkRed/x8ccnlV2B/vCO8XcYkvdG2qJ84faQa9D6rab3Vy7/cqTmWJwzULmC0LLgc12bpWBeldYEKX5ZgsY0nwbs2CgcGJihKRa9gvdOmp2fog01jjwaz59gMIKMoypAPqSdRB+LKDEWvZoYwEFXzAtptG8Zcc4ez8l7f1bgK6P1e69o6U7HlD0EPS2aWLL59X7F4i0g9kW9YdyKEyLyy776cMJv9wBhr24Z5/XSr6D4ddMMg2nXLoq22hEjGadZPd5U5PpyOfz7KiwYihqh1SDSEhAvruxL2c7Jd6a5cJ2rM6Q2ibA6RaciY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:48:20.7412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d27e2ea-1d81-43fb-de3f-08dc5d206bc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8103

SGkgSnVsaWVuLA0KDQo+IE9uIDEyIEFwciAyMDI0LCBhdCAxOTowMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIEZyaSwg
MTIgQXByIDIwMjQgYXQgMTE6MzAsIEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbT4gd3JvdGU6DQo+IEhpIEp1bGllbiwNCj4gDQo+ID4gT24gMTIgQXByIDIwMjQsIGF0
IDE1OjUzLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbC5vc3NAZ21haWwuY29tPiB3cm90ZToN
Cj4gPiANCj4gPiANCj4gPiANCj4gPiBPbiBUaHUsIDExIEFwciAyMDI0IGF0IDE4OjA4LCBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiA+IE9uIFdl
ZCwgMTAgQXByIDIwMjQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiA+IE9uIFdlZCwgMTAgQXBy
IDIwMjQgYXQgMTk6NDcsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFt
ZC5jb20+IHdyb3RlOg0KPiA+ID4gICAgICAgeGVuX3Vsb25nX3QgaXMgd2lkZWx5IHVzZWQgaW4g
cHVibGljIGhlYWRlcnMuDQo+ID4gPiANCj4gPiA+ICAgICAgIFNpZ25lZC1vZmYtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+ID4gPiAgICAgICAt
LS0NCj4gPiA+IA0KPiA+ID4gICAgICAgR2l2ZW4gdGhhdCB4ZW5fdWxvbmdfdCBpcyB1c2VkIGlu
IHB1YmxpYyBoZWFkZXJzIHRoZXJlIGNvdWxkIGJlIGEgYmV0dGVyDQo+ID4gPiAgICAgICBwbGFj
ZSBmb3IgZG9jdW1lbnRpbmcgaXQgYnV0IHRoaXMgd2FzIHRoZSBtb3N0IHN0cmFpZ2h0Zm9yd2Fy
ZCB0byBhZGQuDQo+ID4gPiAgICAgICAtLS0NCj4gPiA+ICAgICAgICBkb2NzL21pc3JhL0MtbGFu
Z3VhZ2UtdG9vbGNoYWluLnJzdCB8IDExICsrKysrKysrKysrDQo+ID4gPiAgICAgICAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gICAgICAgZGlmZiAtLWdp
dCBhL2RvY3MvbWlzcmEvQy1sYW5ndWFnZS10b29sY2hhaW4ucnN0IGIvZG9jcy9taXNyYS9DLWxh
bmd1YWdlLXRvb2xjaGFpbi5yc3QNCj4gPiA+ICAgICAgIGluZGV4IDVkZGZlN2JkYmUuLjdhMzM0
MjYwZTYgMTAwNjQ0DQo+ID4gPiAgICAgICAtLS0gYS9kb2NzL21pc3JhL0MtbGFuZ3VhZ2UtdG9v
bGNoYWluLnJzdA0KPiA+ID4gICAgICAgKysrIGIvZG9jcy9taXNyYS9DLWxhbmd1YWdlLXRvb2xj
aGFpbi5yc3QNCj4gPiA+ICAgICAgIEBAIC01MzEsNiArNTMxLDE3IEBAIEEgc3VtbWFyeSB0YWJs
ZSBvZiBkYXRhIHR5cGVzLCBzaXplcyBhbmQgYWxpZ25tZW50IGlzIGJlbG93Og0KPiA+ID4gICAg
ICAgICAgICAgLSA2NCBiaXRzDQo+ID4gPiAgICAgICAgICAgICAtIHg4Nl82NCwgQVJNdjgtQSBB
QXJjaDY0LCBSVjY0LCBQUEM2NA0KPiA+ID4gDQo+ID4gPiAgICAgICArICAgKiAtIHhlbl91bG9u
Z190DQo+ID4gPiAgICAgICArICAgICAtIDMyIGJpdHMNCj4gPiA+ICAgICAgICsgICAgIC0gMzIg
Yml0cw0KPiA+ID4gICAgICAgKyAgICAgLSB4ODZfMzINCj4gPiA+ICAgICAgICsNCj4gPiA+ICAg
ICAgICsgICAqIC0geGVuX3Vsb25nX3QNCj4gPiA+ICAgICAgICsgICAgIC0gNjQgYml0cw0KPiA+
ID4gICAgICAgKyAgICAgLSA2NCBiaXRzDQo+ID4gPiAgICAgICArICAgICAtIHg4Nl82NCwgQVJN
djgtQSBBQXJjaDY0LCBSVjY0LCBQUEM2NCwgQVJNdjgtQSBBQXJjaDMyLCBBUk12OC1SDQo+ID4g
PiAgICAgICArICAgICAgIEFBcmNoMzIsIEFSTXY3LUENCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBX
ZSBzdXBwb3J0IG5laXRoZXIgQVJNdjgtUiBub3IgQVJNdjgtQSBBYXJjaDMyLg0KPiA+ID4gDQo+
ID4gPiBJIGNvdWxkIHBvc3NpYmx5IGFjY2VwdCB0aGUgbGF0dGVyIGJlY2F1c2UgaXQgd29ya3Mg
dG8uIEJ1dCB0aGUgZm9ybWVyIGlzIHNvIGZhciBtaXNsZWFkaW5nLg0KPiA+IA0KPiA+IFllcyBJ
IHRoaW5rIHlvdSBhcmUgcmlnaHQuIE1vcmVvdmVyIHRoaXMgZG9jdW1lbnQNCj4gPiAoQy1sYW5n
dWFnZS10b29sY2hhaW4ucnN0KSBpcyBtZWFudCBmb3IgdGhlIFhlbiBidWlsZC4gV2hpbGUgdGhp
cyBwYXRjaA0KPiA+IGlzIHRyeWluZyB0byBkb2N1bWVudCB0aGUgdHlwZXMgdXNlZCBpbiB0aGUg
cHVibGljIGhlYWRlcnMgZm9yIHRoZQ0KPiA+IGV4dGVybmFsLWZhY2luZyBBQkkuDQo+ID4gDQo+
ID4gSSdsbCBtb3ZlIHRoZSBpbmZvcm1hdGlvbiB0aGlzIHBhdGNoIGlzIGFkZGluZyB0byBhIHNl
cGFyYXRlIGRvY3VtZW50LA0KPiA+IHNwZWNpZmljIHRvIHRoZSBwdWJsaWMgaGVhZGVycy4gSSB3
aWxsIG9ubHkgYWRkIHRoZSBhcmNoaXRlY3R1cmVzDQo+ID4gY3VycmVudGx5IHdvcmtpbmc6IEkn
bGwgYWRkIEFSTXY4LUEgQWFyY2gzMiBiZWNhdXNlIGFsdGhvdWdoIGl0IGlzDQo+ID4gdW5zdXBw
b3J0ZWQgaXQgaXMgaW50ZXJlc3RpbmcgdG8ga25vdyB0aGUgc2l6ZSBvZiB4ZW5fdWxvbmdfdCBm
b3INCj4gPiBhYXJjaDMyIGluIHRoZSBwdWJsaWMgaGVhZGVycy4gSSB3aWxsIHJlbW92ZSBBUk12
OC1SIGFzIGl0IGlzIG5vdA0KPiA+IGF2YWlsYWJsZSB1cHN0cmVhbS4NCj4gPiANCj4gPiBUaGlu
a2luZyBhIGJpdCBtb3JlLiBXaGF0IGFib3V0IEFybXY5PyBSYXRoZXIgdGhhbiBsaXN0aW5nIGVh
Y2ggdmVyc2lvbiwgc2hvdWxkIHdlIGluc3RlYWQgdXNlIEFSTXY3LUEgYWFyY2gzMiBhbmQgbGF0
ZXIsIEFSTXY4LUEgYWFyY2g2NCBhbmQgbGF0ZXI/DQo+IA0KPiBEZWZpbml0ZWx5IHlvdSBhcmUg
cmlnaHQgaGVyZSBidXQgYXMgZm9yIEFybXY4LVIsIEFybXY5IGlzIG5vdCBzb21ldGhpbmcgdGhh
dCB3ZSBleHBsaWNpdGVseSBzdXBwb3J0IHJpZ2h0IG5vdyAoZXZlbiB0aG91Z2ggaXQgc2hvdWxk
IHdvcmspLg0KPiANCj4gSSBhbSBjb25mdXNlZCB3aXRoIHRoZSBjb21wYXJpc29uLiBJIHRob3Vn
aHQgeW91IGNhbuKAmXQgYm9vdCBYZW4gYXQgYWxsIG9uIEFybXY4LVIuIEJ1dCB5b3UgY2FuIG9u
IEFybXY5LUEgYXMgdGhpcyBqdXN0IEFybXY4LUEgKyBmZWF0dXJlcyB0aGUgc29mdHdhcmUgZG9u
4oCZdCBuZWVkIHRvIHVzZS4NCj4gDQo+IERpZCB5b3UgaW50ZW5kIHRvIGRyYXcgdGhlIGNvbXBh
cmlzb24gd2l0aCBBcm12OC1BIEFhcmNoMzI/DQoNClllcyBpbiBteSBtaW5kIGFybXY5IGV2ZW4g
aWYgY3VycmVudGx5IHdvcmtpbmcgaXQgaXMgbm90IHNvbWV0aGluZyBvZmZpY2lhbGx5IHN1cHBv
cnRlZCBzbyBpdCBpcyBpbiB0aGUgc2FtZSBzdGF0ZSBhcyBhcm12OCBhYXJjaDMyLg0KDQpBcm12
OC1SIGN1cnJlbnRseSBjYW5ub3Qgd29yayBhdCBhbGwgc28gaXQgaXMgYSBkaWZmZXJlbnQgc3Rh
dGUuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gDQo+IA0KPiBD
aGVlcnMNCj4gQmVydHJhbmQNCg0KDQo=

