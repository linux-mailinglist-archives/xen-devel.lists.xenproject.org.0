Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745E62760B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 07:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443117.697581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouTC2-0005td-M6; Mon, 14 Nov 2022 06:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443117.697581; Mon, 14 Nov 2022 06:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouTC2-0005r1-Hd; Mon, 14 Nov 2022 06:43:42 +0000
Received: by outflank-mailman (input) for mailman id 443117;
 Mon, 14 Nov 2022 06:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eg9/=3O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ouTC0-0005qv-MO
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 06:43:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2059.outbound.protection.outlook.com [40.107.247.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab338eca-63e7-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 07:43:38 +0100 (CET)
Received: from FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::18)
 by VI1PR08MB10146.eurprd08.prod.outlook.com (2603:10a6:800:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 14 Nov
 2022 06:43:35 +0000
Received: from VI1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::ab) by FR3P281CA0164.outlook.office365.com
 (2603:10a6:d10:a2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 06:43:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT059.mail.protection.outlook.com (100.127.144.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 06:43:34 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Mon, 14 Nov 2022 06:43:34 +0000
Received: from 40761ba1d67d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 170F6227-2A96-4751-B2CF-51AE4B00F371.1; 
 Mon, 14 Nov 2022 06:43:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40761ba1d67d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 06:43:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB8982.eurprd08.prod.outlook.com (2603:10a6:102:33f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 06:43:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Mon, 14 Nov 2022
 06:43:25 +0000
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
X-Inumbo-ID: ab338eca-63e7-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YnwnOBOx5/TajPcgXOeSkbPD01vKG+Irih0l7gRicd/aalaniQ4b5JipYHsdgB3YA0iqz8U+DIRUFGDRnmuqsneh2xLIRCZEN4NML3RvDwildhYh/sDHhCLNKJG+RHuzz0n+M1GSsTufTgLy33R9yPyegS5OvBwvqkrD6xTFWK0bMZr82gsdSeESJWckJT0NqX0wVEi/+USayqioGZUrcWZX/ryAZ0pJSSAiER8pVZ85byciW+oggMN+Rd4loVb7vb7k2cEHgtitVGeg5WWXmDqIr3TP0RSeqvWIjJbPN/gXz7UrJYQ308QbJqKVJD64AXcP0RTfkD5nVAQH4UgmAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqcPNPtm1Vh7mIugQy6ZBNavN5MJJ4FG58YXRZuZ4Yo=;
 b=No1pdbbw1ADYp4HWWD0uyVCLv5GrZQsdWz7IeYXuuMYDGn5ZRXhzihtMhcgoF4kjytI984LxgsYvsyWmlsI1sNTSAbrOjNY2rh3dtLgGLZmRERvDiaQWQp43lkrtaowUriXPdnftPtw2OK6ETuHBXEyhSq2GdKrH2C/qAJnJSJ/BVxy0ZfOz9tpGKOZRGxvXiJttkRT0Vd+q8KMqkkVTheMiRPB+1tU7B3dUKnsPORtdQkXjDuS2az9mHMpB4EOL4btBL8S9mAsUXGGB/phWDeHBcLXl13LIdcMHv/PU4Z/3n9dQ1VRBbtphmiyFn6HBUPyYXwqf5sFbOMUdyVNT0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqcPNPtm1Vh7mIugQy6ZBNavN5MJJ4FG58YXRZuZ4Yo=;
 b=IHR76jI7IZ1squ1sv/fv2qfO5LxikZgkGEv5VH08e0LNuTM/P/+tsCKByt074s6JSF4wWwZ7d91G/VQkdzndFoCbVzTWZRmc9MZJkKZ3koMRoDe1SHXc3sahcpnrq+MyfFUpPoQGsk6/9I7WmWzPp7CeXltkYXkIfVstbU9DH5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5IlCu6V8KLDSPm9rxk6vb/IHPU2wZRzOXe/vCWYc5wHFO6G6zj6hENK8l/iVvbzT0WFBUSiBu5D1uqEu4r9qxsuzlrSrtqt0KrWUSmrsin5+k+/miKBpi2p08Kx9lTYnghoL60AeuMiJTIVm1v+uGhVFsmmPMReqzT5XzaI1DJWjfvRvYu2R1QO3/WM8JdwHN1vU0EmgYey7cdd0yf6yoOIc8U0IN+WpW1VLlOJJBsQkURvQnUnPIPnGJu81oOh31sIHzkRejDszuQ9C4NPYEGyamkTF87rlL3C2lGGL6ubOkFd8zQUf2S8yqW1n1c2h/5Mj/F+vLN2d0sNY15h1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqcPNPtm1Vh7mIugQy6ZBNavN5MJJ4FG58YXRZuZ4Yo=;
 b=FWllCglrsGww9JSuPRWSHumPbF+e4zNyLH88mWGJCNh7GZoyxnE0jmlRvkxilYq6bapk0mzMsdULXOao26TNlu15JEJm+Wn/pp6sF/c7tGOFACz3c3pMBdExA3L4/IIW+vcRiUOpZEUrfat5XrrAGP5raDTdWAxk35n6ye0B27zDLqAojMNKi8apadRZTtfytQKO0OZ3Fs0kxM652g7vVtEe6f6yCZfTJx1NIV1wPYCdl2dcywIuhmO1eQpepCvglN+y1FehcADdvxSDU8ydOfTujmk0U2d2j88w6nyL16x2A0XYbZzGBK2KrWUb0pBlEKCLjrDOZ2BGDPDdJBrdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqcPNPtm1Vh7mIugQy6ZBNavN5MJJ4FG58YXRZuZ4Yo=;
 b=IHR76jI7IZ1squ1sv/fv2qfO5LxikZgkGEv5VH08e0LNuTM/P/+tsCKByt074s6JSF4wWwZ7d91G/VQkdzndFoCbVzTWZRmc9MZJkKZ3koMRoDe1SHXc3sahcpnrq+MyfFUpPoQGsk6/9I7WmWzPp7CeXltkYXkIfVstbU9DH5E=
From: Henry Wang <Henry.Wang@arm.com>
To: Jim Fehlig <jfehlig@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@citrix.com>
Subject: RE: vnuma_nodes missing pnode 0
Thread-Topic: vnuma_nodes missing pnode 0
Thread-Index: AQHY9iDYCXvlfuymEU2cRUBeAI3Esq49n+1wgABcSsA=
Date: Mon, 14 Nov 2022 06:43:25 +0000
Message-ID:
 <AS8PR08MB799186D9559BB2A066D3349092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2046b5fb-2533-02fe-69e8-f46174cf825d@suse.com>
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799119CD58863C6D1D309E9092059@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FF34FAFDE635BA4FA546ECD2AD9A762F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB8982:EE_|VI1EUR03FT059:EE_|VI1PR08MB10146:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a1785c-91bc-4966-f16e-08dac60b8d81
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Na69fLpnrE8fQojUi2U2iLSOi30WQ4gdKWAEQTQeRKEOTQrQCyO+/FJvh2qMs4b5Av95vwjwNbJu5hAW6+ucvmTsKaPdEqTAyVqRft1XBwA6Hj96J7ytsMLgjewhrjg8XV2ktGWt3/3u/WU62kceIJd10xZKmlTTOJINiPagFx9T0liOZFcJTaBMtPYiMcR1U7D/K1OOsJA1txSaE1KgZcqOxTZljPdHGYEGHNvrtO/yTlIDYFBzB1JTkIE7Hf+5wq+aqiWjTS/L4kN/h9DNE0EjO8sqQUmQGJ44524SvK2aa5rJ0NwhNV/Y3Cx2ySgLApPXzhOGVpz5TAWPxp8Cs6O2TXs2p+U/jJswdGxvjjMcwXHZTK6VaTYGVSZPPuhulhsKslEFCwZzXF4VUEAvqVPn9jSRUghYHiJZCtiqJWj9DmJIQkidoHDeSJ5sPu37cBY+dGsKhGf1xAj8nMb/mkar7PCtEgNR/F8xuuWlspCuFutXy4qV/IhrCO4uz0JuH5XIz5xJeQpwYaMRVQw1OFCr2iab5f6jFgRL6+70FPk2nkF1bxQ/2Rchz0PxaEQdnCdYGnigG2OeF0q59jPulxsLCV4aXrZmEEOC6eFUzv13RYc/HYKcPkhT+PK510A1rRKv8PN+ondAYTDYVeFNyUPcJJ4sf0dbPTMqsCAVZtJsRY4tpX7rF7wkmdY774eh1UjIKtnPE8yXxCuT7nN21EBH7n/J5S46SdYzJrf877OX90LYQZJW28I5Vue4N8V4P1IrbjZqbnKLkiISCJtkBg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(83380400001)(2940100002)(38070700005)(186003)(38100700002)(122000001)(2906002)(8936002)(52536014)(55016003)(478600001)(26005)(6506007)(5660300002)(9686003)(7696005)(64756008)(4326008)(8676002)(7116003)(66556008)(66476007)(71200400001)(76116006)(66946007)(41300700001)(66446008)(110136005)(316002)(54906003)(33656002)(558084003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8982
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99d0b0ae-0461-4b65-cac8-08dac60b8816
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aBUVdSv+FqxrZ8C8PeV7L8G3VC3RxT3ppvPCdqrE0CDDCheWAw/cuSuvhEpTZqKUIQpfnwTBwRnOednkx1XasCH2uCoYS8vFeCLC8bPxkptOWUDaN8jfBYMhJ7i7j0tA5ZNWaYbrtjaCRiuwTOhUFknPQAxWofFV4csxTHlZfkU7rN5V9rRHYTzTzkzxy50LGqRLtpbG8U2LTZQe6qh5np5DgfKLQuPTPG7HGLRlWaZWcHIT8NmcHs/CHK2X+OOmpiwKmRKxv8GTpqrSzaNgYrLMyJK/pr8KgDKVkty56ZEPXMkXsL3fJwAUADZqM6XkqqLwR8uR6hbEG8gSu2aOSBnP4HgALILf/71U9ad360B9XQMOy1QiDZayr+D2Z1jHm7oLiDRXs5nwa1E4edNwAhyxj2kNmhF7/BGaUE4ppD8ZFQqSQi02uHuTYv7yBoxHALIC+mS/QvnHsKGFoMxBsbUPpgXZ1Il3zl5LK2t2H1RlLnw623K+ighxW8VTFcgWq7TTZyMAuc3ORELG6zY3PNc7VC02VuiwxRgnDAzQCyIXVG+GJRz2JnhjOOOBZWCULV2Uqbq2P354Ss3aVwg8h//Dgd3stAarA1GVhQ1a4yB4ckmLcjUAMeFV7tQnwi0cmkw3mDi5ndMuwqteFrditEU3Uai0nWmW9hv/cTKIC1ApkiAGfoV0+FOQEBsrYo0hj9jiK0p8SIIKbKR/cbK+lxb7mLtsgCGLjOOp6NzVuYz+546CoaDjZmnhbsGOUAQ7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39850400004)(451199015)(36840700001)(46966006)(9686003)(54906003)(41300700001)(70586007)(2906002)(186003)(8936002)(70206006)(356005)(7116003)(52536014)(316002)(82740400003)(36860700001)(107886003)(478600001)(110136005)(2940100002)(26005)(33656002)(336012)(8676002)(40480700001)(47076005)(6506007)(83380400001)(86362001)(4326008)(81166007)(558084003)(55016003)(7696005)(5660300002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:43:34.6296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a1785c-91bc-4966-f16e-08dac60b8d81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10146

U29ycnksIG1pc3NlZCBBbnRob255IChUaGUgdG9vbHN0YWNrIG1haW50YWluZXIpLiBBbHNvIGFk
ZGVkIGhpbQ0KdG8gdGhpcyB0aHJlYWQuDQoNCj4gKEFkZCB4ODYgbWFpbnRhaW5lcnMgZm9yIG1v
cmUgdmlzaWJpbGl0eSkNCj4gDQo+IEhpIHg4NiBtYWludGFpbmVycywNCj4gDQo+IFNpbmNlIHRo
aXMgcmVwb3J0IG1pZ2h0IGJlIHJlbGF0ZWQgd2l0aCB0aGUgcmVsZWFzZSwgaWYgeW91IGhhdmUg
dGltZSwNCj4gcGxlYXNlIGhhdmUgYSBsb29rLiBUaGFuayB5b3UgdmVyeSBtdWNoLg0KPiANCj4g
S2luZCByZWdhcmRzLA0KPiBIZW5yeQ0K

