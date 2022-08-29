Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1795A4316
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 08:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394453.633854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSY92-0008Bn-Fa; Mon, 29 Aug 2022 06:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394453.633854; Mon, 29 Aug 2022 06:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSY92-00088T-Cg; Mon, 29 Aug 2022 06:21:12 +0000
Received: by outflank-mailman (input) for mailman id 394453;
 Mon, 29 Aug 2022 06:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=td9j=ZB=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oSY90-00088N-FD
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 06:21:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2051.outbound.protection.outlook.com [40.107.104.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c442fc1e-2762-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 08:21:07 +0200 (CEST)
Received: from DB6PR0202CA0037.eurprd02.prod.outlook.com (2603:10a6:4:a5::23)
 by DB7PR08MB3641.eurprd08.prod.outlook.com (2603:10a6:10:4e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 06:21:04 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::5f) by DB6PR0202CA0037.outlook.office365.com
 (2603:10a6:4:a5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Mon, 29 Aug 2022 06:21:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 06:21:04 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 29 Aug 2022 06:21:04 +0000
Received: from b856f702d096.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A24BEA3-CB06-4358-801C-571C75D360B9.1; 
 Mon, 29 Aug 2022 06:20:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b856f702d096.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Aug 2022 06:20:58 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 06:20:51 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20%7]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 06:20:50 +0000
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
X-Inumbo-ID: c442fc1e-2762-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HZ81ctjVR8BVrlFGAhHIUz6W2kWe8Kh3WYGHiZpdrWW8M7ySiKcoV9wOOygEjp6PA1T8winN1izDQZce53Ycd+WnbP/KcSafpKxtMHQu0dGZzBTA8lN2ni56UYqN9Tdcz3nwOPqQ0P8SRokSYiWo6H+q4/hoh9iBAqdeFrzQ8WVQo+tijNolR+i8tzvCJzgBU+QCK8bGqtQGSBi/Nofx6jRKi2S01djBl2H/NCGKw6xwbSIwF/Txg0K5qQjnlKvYUEZ9fN6pKDC4dH+hu6ALJfUDiBiJwrwYyeSZvmD2jnzUKKNt/4IuiFRfjqm2iUxzSq7RBBEOwal0iblK0Pr+8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NoSNSyabnYmGnn9hJdJt80vXD6eQ50/e9JydvBdyEs=;
 b=BxCYOcSQZaWPgkfaJxMhSTVpF2bTWBHCT2DCg1CjTeshVZ3AMNrft3gwn3LujcDcTE0l5z+qwGkLZNIhzfp7BMCT33XY0oeZiTxTGoCYfUEA0TbajXXkssmS6VO503JWaUKuZr3QrENHCdBieL5FPk+na0rhyoyc5pMn09GevUHdsEo/IeqROtBYjbNalh+0/91qhLSa26NXd707S0D7l2KPxyXqL8vaAmwlFWFdYwlEjcPGmtu/fyzX2L3e4Ic49w2j8a7XQZG+5P6j/StjIzBbwy22e4l5HWV3AOUXEbAsfIx9Zdh9eeqAbmz0DUP0nN3j4rVXsPcx5GWKrfih6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NoSNSyabnYmGnn9hJdJt80vXD6eQ50/e9JydvBdyEs=;
 b=POOznO53eGKK8vPBe728c1rEtFYsfRkiRHN98pB9X+Ka4dyZdZRLwWpl54tjZbUhOUPypxqi8E3j3Kk1h9q7QdDnYQr+MqGVTNCk+DPS81nNAcBY69VowdLEmy7c35UjfIrau/aNFgAmbmc4XgwdSc9eWFhOtwXMp298z/feAaA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWU4Mvf5Svcln41YoqYyDzQMTuyG/M9eHt4ooykmxuOx5M+cbKwWb2lH9Mz1nQyPWE5gorwjd5cO4UdalSaFbEjxwAIrruL+hvC3GFc2eZT2mKmdR2hv2pd3SCSUx3xtzckLvnWj/8X5ISGSGsi2b3PIbSXYNkZjFMVuJuSgIVFKuqwxxf4ov5puydKFXetK0hQRrZ3pF/TLju40KupGFaHgYZMKFinQl3KerZ0bjQi6iwer4q5jaqKko/8GF4ynPvK1Ez3AG+LVRS4g1lBj9rGNydI9GnsZj1Xn1GSW8A4X0aJNlHYiHpzWdhRKHZCoylPb2cVWM7qUfztcZQ/amQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NoSNSyabnYmGnn9hJdJt80vXD6eQ50/e9JydvBdyEs=;
 b=VcCR0JQuDZBTlzsUDQtAU9xxQvc1QTR5mbToB5yQt3/0dsDfWh2scwYTa9V+VhnJPv6Kbh+ISGRYMGBdnyVCAPKUwk5svUi4cZiTatRuS2wxERZm+DIaUw6LedDIzG1dPeRS2j+2HS9PGHXEyBpSr1Fu50Fh+mJZrd925zIESN2lFrxyDy8ZwxPWtbki531ub7MejUdBJBobDPoVheuU7bP8uJ3glGfS8OyPAVu5VsUm1iHI9tSm0traG6AZUU8o3HZQ5mSbZrmbx/G69n9yJrz6yj4cFVh2ecZh4aU1zpMrKZXGLxs06cyzfPhEOcv4559g2+1QOQqgfzIRWaMnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NoSNSyabnYmGnn9hJdJt80vXD6eQ50/e9JydvBdyEs=;
 b=POOznO53eGKK8vPBe728c1rEtFYsfRkiRHN98pB9X+Ka4dyZdZRLwWpl54tjZbUhOUPypxqi8E3j3Kk1h9q7QdDnYQr+MqGVTNCk+DPS81nNAcBY69VowdLEmy7c35UjfIrau/aNFgAmbmc4XgwdSc9eWFhOtwXMp298z/feAaA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v6 9/9] xen: Add static memory sharing in SUPPORT.md
Thread-Topic: [PATCH v6 9/9] xen: Add static memory sharing in SUPPORT.md
Thread-Index: AQHYnQThdUNeT0fz20C/9TMXLH5gbK3A/r+AgASeO3A=
Date: Mon, 29 Aug 2022 06:20:50 +0000
Message-ID:
 <AM0PR08MB453097022B9D9791A6BC829EF7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-10-Penny.Zheng@arm.com>
 <aeaa3649-33f6-e934-822a-47a982978a37@amd.com>
In-Reply-To: <aeaa3649-33f6-e934-822a-47a982978a37@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C0BF9594F351204D8E2BF9733923E610.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8fdae5d3-8e72-4efd-a8f6-08da8986a6a9
x-ms-traffictypediagnostic:
	DBBPR08MB6075:EE_|DBAEUR03FT005:EE_|DB7PR08MB3641:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IE2MH+eobTqqsQn0JamCBbdY3mY4kB0iV8ubt9vhyifOiAJlF3xx3/CQ+hIgqMVjNNbo23Mp5o8Zm6Ro9Y7vGMXo0yeh18MkyZDyyiLCZJNdnbFMQYh0NUt9by4A/pjvJuzocVuJuHBycPFkPCSHB8LU1RGvyyyVYDEyu0onNYWIG/q1I++hin4TA+wYUywbPx4skpES1xlXOzsZ9RdCea0gds7xmL27paik38MSTLS1ZpCkdQrVpZ40ZxLQFp02RSOYU0IcahycIKzB1ukKNLDJy5p8c4WBzU27uY0ZuSTfaR8/OiTEEkeZMi0UL1+HiF6KQLR5315dOjmnO9NffJ7F1ryYmsoZYbD7fYpRN9smnSwhQCZsM5PbLII8tKnItW8MIXPZYJ7boO4/Iq+CAftDmZZrdRF610TTlt4NLx8CskWG6tAQF7Ok8dmnug3Fcut3I1eQ5kZ153KMFxqnUOwW1+CmSXvaK3qqHHTThN5MclWQeNqk5UgMwxJ6Qn8UNAzZX+6bvoEzPU4OA21Zm/j4G+USIpRZ0QzaxPDRFutXsrArtfF2AfUXD46rCHDCOlyktq4qELFscdhhHONr925q0hCz0qQV/zzJwv42qov5VQI0YY0Edh/gMTRqxWqiAnj70ORfozN527jE6vYtSDO1pWyHgROKy+L7szZmokkxGacJfTA3/0X9cCwHzDNgXbuBOCsucTm511MpLgJhkFewbNQmAiVkm7fRShasIsOt2dBKCLhM7sHBr8zTAxkb7yxB6/P6QZewI5KPVnfixQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(38070700005)(110136005)(316002)(71200400001)(186003)(38100700002)(86362001)(122000001)(54906003)(64756008)(83380400001)(53546011)(2906002)(55016003)(478600001)(41300700001)(76116006)(66946007)(66556008)(8676002)(4326008)(66446008)(66476007)(52536014)(33656002)(9686003)(7696005)(6506007)(8936002)(5660300002)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5097daf-35de-4d96-29c0-08da89869ece
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k1bKDmEjCWZge0rIvmKcBfYOnLpkoP8FkCgc0Ob+w/rITQekeBRkpBv0yRl017LdEcS13eMFmKnxIxQpyrx0Uc5enQc2H7jF+fB4SH17THhy90Lu/evRNXDzBIL4OZ9yg2TNwwxnxMHXcFEfSCkFOUyalMQFMP0yxAvQHBFELaWq4u65UqWWGPUHEPbylOkcMRFDyi8yVDZsc1nQVnPhoAry/hdELmGBafKqxMeXPY/37dKWUK2QkEf1qrp5YpMVAKEgfwJDU4Qj4yn2AUhYXMj8FE8jpIF+Xu5f0fqBt6PI6qB5pbnjheOeOpZZfAU6//IZnonhzi6k554Q/lhR2F+BKqPUOLvzSGJnJv6Z7hkXsdtZLXjuSHTSHxGR+rgehkUcUKGdvyn5xdORSDhI5BiFRlcQ0zW/gteP8HcGhO/CT7GFST+LpuOCYBAv6TurqI6lL48cW95bDIEj0RBOiuoXC40CLIgz7ky1JjaMQOwCq9bm9dMOptqr1fpJ171bCQqCADlJHN5bBrLJFwso5mHOWPbVcWhSy/ALElSYGmh2UGuk2SDZ47LTV/LQEptI+zo//KpURalC24alnVf1yCeu4+Tu7zf5bE8BpBzdsuy2h5UwHdir7H0/2z4TlmehE7OOeCkuTJNx2RMyW/NGty31/faysb+djwUkyOjJUZ5PBdOO9rgYS/q5APAuuVmvZotFruz595qLvvmaaUZAjKbEG/pxrfoJBzHJL39HjwGC5vfADVY1LGHFk+xRnX1o
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(396003)(376002)(346002)(46966006)(36840700001)(6506007)(7696005)(36860700001)(2906002)(8936002)(52536014)(82740400003)(55016003)(40480700001)(33656002)(5660300002)(83380400001)(81166007)(47076005)(478600001)(4326008)(316002)(70586007)(336012)(186003)(8676002)(70206006)(82310400005)(54906003)(110136005)(86362001)(41300700001)(26005)(9686003)(356005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 06:21:04.0949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdae5d3-8e72-4efd-a8f6-08da8986a6a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3641

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWwgT3J6ZWwgPG1pY2hh
bC5vcnplbEBhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyNiwgMjAyMiAzOjIxIFBN
DQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhl
bi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkg
TGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDkvOV0geGVuOiBB
ZGQgc3RhdGljIG1lbW9yeSBzaGFyaW5nIGluIFNVUFBPUlQubWQNCj4gDQo+IEhpIFBlbm55LA0K
Pg0KDQpIaSBNaWNoYWwNCg0KV29XLCwgc3VwZXIgZXhjaXRlZCB0byBzZWUgeW91IGJhY2sgaGVy
ZTspKSkpKSkpKQ0KIA0KPiBPbiAyMS8wNy8yMDIyIDE1OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPiBvbiBBUk0sIHN0YXRpYyBtZW1vcnkgc2hhcmluZyBpcyB0ZWNoIHByZXZpZXcsIHdoaWNo
IHNoYWxsIGJlIGRvY3VtZW50ZWQNCj4gTklUOiBtaXNzaW5nICdhJyBiZWZvcmUgJ3RlY2ggcHJl
dmlldycuDQo+IA0KPiA+IGluIFNVUFBPUlQubWQNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBl
bm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+IHY2IGNoYW5nZToN
Cj4gPiAtIG5ldyBjb21taXQNCj4gPiAtLS0NCj4gPiAgU1VQUE9SVC5tZCB8IDYgKysrKysrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZA0KPiA+IGluZGV4IDhlMDQwZDFjMWUuLjNkZmU2ZDJm
YmUgMTAwNjQ0DQo+ID4gLS0tIGEvU1VQUE9SVC5tZA0KPiA+ICsrKyBiL1NVUFBPUlQubWQNCj4g
PiBAQCAtMjk5LDYgKzI5OSwxMiBAQCBBbGxvdyBzaGFyaW5nIG9mIGlkZW50aWNhbCBwYWdlcyBi
ZXR3ZWVuIGd1ZXN0cw0KPiA+DQo+ID4gICAgICBTdGF0dXMsIHg4NiBIVk06IEV4cGVyaW1lbnRh
bA0KPiA+DQo+ID4gKyMjIyBTdGF0aWMgTWVtb3J5IFNoYXJpbmcNCj4gPiArDQo+ID4gK0FsbG93
IG1lbW9yeSBwcmUtc2hhcmVkIGFtb25nIG11bHRpcGxlIGRvbWFpbnMgYXQgYm9vdCB0aW1lIHRo
cm91Z2gNCj4gZGV2aWNlIHRyZWUgY29uZmlndXJhdGlvbg0KPiBUaGlzIGRvZXMgbm90IGV4cGxp
Y2l0bHkgc3RhdGUgdGhhdCB0aGlzIGZlYXR1cmUgaXMgZm9yIGRvbTBsZXNzIG9ubHkuDQo+IEhv
dyBhYm91dCB0YWtpbmcgd2hhdCB5b3Ugd3JvdGUgaW4gYm9vdGluZy50eHQ6DQo+ICJBbGxvdyB0
byBzdGF0aWNhbGx5IHNldCB1cCBzaGFyZWQgbWVtb3J5IG9uIGRvbTBsZXNzIHN5c3RlbSwgZW5h
YmxpbmcNCj4gZG9tYWlucyB0byBkbyBzaG0tYmFzZWQgY29tbXVuaWNhdGlvbiIuDQo+IA0KDQpP
aywgd2lsbCBkbw0KDQo+ID4gKw0KPiA+ICsgICAgU3RhdHVzLCBBUk06IFRlY2ggUHJldmlldw0K
PiA+ICsNCj4gPiAgIyMjIE1lbW9yeSBQYWdpbmcNCj4gPg0KPiA+ICBBbGxvdyBwYWdlcyBiZWxv
bmdpbmcgdG8gZ3Vlc3RzIHRvIGJlIHBhZ2VkIHRvIGRpc2sNCj4gDQo+IH5NaWNoYWwNCg0KQSB0
aG91c2FuZCB0aGFua3MNClBlbm55DQo=

