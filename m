Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514D452B219
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 08:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331631.555175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrCpd-0005Aq-0i; Wed, 18 May 2022 06:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331631.555175; Wed, 18 May 2022 06:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrCpc-00057V-Tc; Wed, 18 May 2022 06:06:48 +0000
Received: by outflank-mailman (input) for mailman id 331631;
 Wed, 18 May 2022 06:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9Io=V2=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nrCpb-00057P-Ba
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 06:06:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1c43cd2-d670-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 08:06:45 +0200 (CEST)
Received: from AM5PR0701CA0008.eurprd07.prod.outlook.com
 (2603:10a6:203:51::18) by AS8PR08MB6405.eurprd08.prod.outlook.com
 (2603:10a6:20b:332::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 06:06:42 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::b6) by AM5PR0701CA0008.outlook.office365.com
 (2603:10a6:203:51::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 18 May 2022 06:06:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 06:06:42 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Wed, 18 May 2022 06:06:42 +0000
Received: from 97b7c91d07c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E42F4739-0116-4141-9ABC-01EFF7DB4ACC.1; 
 Wed, 18 May 2022 06:06:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 97b7c91d07c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 06:06:31 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM5PR0802MB2515.eurprd08.prod.outlook.com (2603:10a6:203:9f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 06:06:28 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 06:06:28 +0000
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
X-Inumbo-ID: b1c43cd2-d670-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gbHlm5I0XToWNaE/UuOLOMG8dW8eL7p2siNWiJh/XaZWJj5O706hrt2Dyc06kVU0mntf3J5UWDBK8mrdg+h0F6Pu4PvXjRYwOjaYQJOHcnuYInb4C7dur0nDtZnlR66oBpN2ngwxrZwwJMAoAi4VATDnR8v3EqdgtrISUxPTCz7ejifLHtdgCh/mGVxikZwvCbdBdJ5u13E2dD6NSgcw1PzK+OAuKhXjOO1DJnyKh4TNIcTSr+3JjRFDNLenDXlYIt6WfkIxRH8LAtwTHDk+rMGb32/Bn44/as6vSK4xVD+Rprag4rugvxGUon8Dr0pcyNaP6HOx1kfnsykGvpV2EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOwbzjpRJ+EbpJgJypJC8xojlw87UhBhAXL0xI1+Dpg=;
 b=fs2qMuqm4A6fhTarXCBfLnz0JuWUxSc/HAHDt5mT+7aa5GYku3cV9M2l0ws+7VOKYgfQuTuGPPkW37Y/s52meCSI8VibTSksvrEh6luJSd0UlPk/3YPJGMX8BIKW7GNkSQkPvIf6iBBdNe3wQXdiDO1Uy9QyRJ5aX1aQxpvOdZpxYdoh+o37pP/9dsoH/YL3kmOy+ZxGKRSN9rRbP8e6fIt/fEUTAere+9zdMCDNLzkFWkS0x4vGICzIQgpOsUKXS6m9mOHMDVeTb/EhenrlgZYbdAQVUSSjjo9vYK8JRL8ampMogIfak84ZJ3lazgYDofBhQhaPN0XuwcLZqwu1Uw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOwbzjpRJ+EbpJgJypJC8xojlw87UhBhAXL0xI1+Dpg=;
 b=QGBCu4vYxckcYPNgVPOjdIYoD0ydVSQel0KhFLcRCOwJjCUQcdqLrzbPyL6LKf32MhedAqebYWCxKzDHH4pKkmslnhkYCaycwDIvcdj659Byz+2olTJazHI8GA6faVMFVV8Q1/c1bKNh3OeCzCWxQZP+JBH5AnoMffsgy++pccE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbBI9XjxDVEb6OQcY77PuX8mhyr4m53ympX5XPRuZyyr1/3d2yzwqPryWeIj2+ubPYm0bKS+V93WK69GErsGnsUvBVXbzF/KkiRbnfV/q/45BWIsMZrNC0NKwUbNKHxXfnAgAehi9Y/C8fnbkk7/fzsXWLXH2cE5z49wGvwzQAOgbYkmIKfXlvULVjqftnbRt6a5/smQj19JYTqMewqwYXuS+V83J5e4T9j5eSbGyMjPGWDyu1+FxoO1ja92ulR4CkVU/1j+r1/7ukVj5ywMTcOvjl0e3xQJsC6Z+KIMi0q7c/P8H/GHJWCgoFSePg7GXLRNpB7m7Z6BIypLUeeMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOwbzjpRJ+EbpJgJypJC8xojlw87UhBhAXL0xI1+Dpg=;
 b=IhB+mFo3sFG54Tn+rocQT9ekM1s4mSVdgzRTXi2DpKD1s4vgoszC4FUiLMUaMHQWfSvJF5TsiSttTREVyieJrQXl5NWR2qaf7raia36pkUUO4cEkwU9RoMFqHPgNltkd92YIaWAE18mzaq/3w42gCVC/EyiI6ruGVTeEv/lX9XzBCKV1PoHp8HBH8g3z/e+/c0emesJJxtGOK/dqkFvNepC9sAfthckkFnLtARO7S5RIyobD5HBQFDV9KVzzLUwPrY1rdoL+ATZgzu5pYxEkRtjx+noQCqolLKLbyys8Upx3whMuyoaicH/xyAZ5FqL+WhDX+kNtFwx+9YncXbR2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOwbzjpRJ+EbpJgJypJC8xojlw87UhBhAXL0xI1+Dpg=;
 b=QGBCu4vYxckcYPNgVPOjdIYoD0ydVSQel0KhFLcRCOwJjCUQcdqLrzbPyL6LKf32MhedAqebYWCxKzDHH4pKkmslnhkYCaycwDIvcdj659Byz+2olTJazHI8GA6faVMFVV8Q1/c1bKNh3OeCzCWxQZP+JBH5AnoMffsgy++pccE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v4 1/6] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v4 1/6] xen: do not free reserved memory into heap
Thread-Index: AQHYZBWe/uxRZBdW10mDRgQaF95/K60h1bOAgADQseCAADJ5AIABLJMQ
Date: Wed, 18 May 2022 06:06:28 +0000
Message-ID:
 <DU2PR08MB73255EAF241E6B30659A6CBBF7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-2-Penny.Zheng@arm.com>
 <2ebda9bb-8045-56ec-619b-d0178d57ee17@xen.org>
 <DU2PR08MB73255BBF708979822747FF2DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <511fd0cb-348f-b65d-cb7b-effd822c7f20@xen.org>
In-Reply-To: <511fd0cb-348f-b65d-cb7b-effd822c7f20@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 05ECB4BA4377E446928B14A74170E918.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 990d89fa-2336-4888-eefc-08da38949492
x-ms-traffictypediagnostic:
	AM5PR0802MB2515:EE_|AM5EUR03FT049:EE_|AS8PR08MB6405:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB64058DE6BB1CCA347A198C54F7D19@AS8PR08MB6405.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uAmjOYVrt2VguVbQQ2Fvk4nfI7Ecb+iLyqW9Kw78ZBEZ9d9NBcLHGMQFN93qn4erexNKHuyJGp1cedD767+XysY3xFWaNMvKJudwDAO5+p94ZMKfNXegxJ9Y7IoOvN77QTj4E9RHMdhtNX3SPJ9NxFy2GXL++HKg2Ay6FHRyJSFBIOg4PINRuz6/1jnxkpBOAMHxBdlNZOJnYEuK3kA7ou46fxuPq50e4Q5AknXtzyZAxPh8ZouFGyYpdI+mWeXGwKyu5yIaQ0iUaSSAd21BlpvZqeG2f0wE5mVA1Frk/VRqPHjWtH6dz3dhkiG0KKtNSrMd3T2xGimXQl/DHmfFmzY+8xg22xElm4OuDC2h/RDeIkFxM5vpM+8A7eO1ezMYwkh5T2epxuEOcZFem7rb8x3DJJSIMUKXOceJFeZykPOmPta9oK8aqX3UH7yly9i4AylPaLj58QRNg95Kw3c3M9iaeFiAeVqKyy1EB7DB0+0+8O18IW5if79K+N9SaClhJz68gpc0Za1mioTvWqEMqT8+Cdgo0ZaY1KedZ5Vg4x9I5L2485HzajoYQCMZFQnIBxdIZvv+B30rgO3Q1mvN3wAYfJ0IDCdHOB14w4N9nuZXwmgGMeZ3OmFqxOMAr+bjc0qJ991OOU2N6pt7yTWzJA1l5w8a7VAnAGX0TxPFuraZfRHfRP3LolyURSvvMjnniIy5tirm1rgtt31mXzNBFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(66946007)(83380400001)(122000001)(38070700005)(38100700002)(5660300002)(66556008)(66446008)(52536014)(66476007)(8936002)(71200400001)(508600001)(54906003)(76116006)(55016003)(2906002)(8676002)(26005)(6506007)(53546011)(110136005)(316002)(9686003)(4326008)(7696005)(86362001)(33656002)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2515
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52f6014a-0abc-4eb3-1000-08da38948c46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/SIY9J7RhRj8ZT/3Vtd01fFX5kQyLKn9CH6UA3PW0mUxSGtaaDNUm7w/4CMAox4k21G4XAS90fRgs1U76wjepqwecJltoTs9zI3QhcFZgMvH3Cn8FqODhIKUC47j/FFnkKrUp4eWPpIjBOZDZrj6Sp7Dtmjd53eQRMAPVxY0lQiyjr13EGby0ynWXpmWxJrZWgNQlOTbr90cE+IaGE23uzkKRb5/qhaDWYfeeFZp5G88JiJmVISbS776jNA994Wu7agm5JpvjWqeEXE89XqHLY5izqW6hDNDK6hCq8dKIC3PxxErE8O7yONk+ZQunud8B+SCpH1MKBBEV4laxSpmNWBB8lxMHNpQsviGeYTXzlGfBp82YJLdTKXP1k6encYUMn+/uSjCPWD05t8FJptSe1z14OClCE+kbHBzyW6iWfbA+K6nXFmRlmOAvK9pwR18AYkjOwGQr3j3MEIjL45YEGJsXUfc2zv7N+dvy9pSmXDuXAm6xXDgN87u+028tb8hfJZDFSIvo4vea1tDXzeSJx+JvgEcAlWGtsIIKUf6yK5svFgtHD+lL87ZLggpvgc6uKM4kKCDCJyyCdDTtV6RaYhkZ/zw54b+2/6eAa2IgSD5LQwWt9Cs/pcWpbp9g5/ilhWBPGVfQVhM1S5MiXXTupawdeprmV7/qOtjAdJETDe5Bbj0+D2hyPe/kBTaK397
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(9686003)(2906002)(356005)(47076005)(336012)(82310400005)(186003)(83380400001)(86362001)(316002)(36860700001)(110136005)(33656002)(40460700003)(70586007)(8676002)(52536014)(508600001)(5660300002)(8936002)(70206006)(6506007)(53546011)(55016003)(26005)(7696005)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 06:06:42.4693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990d89fa-2336-4888-eefc-08da38949492
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE3LCAyMDIyIDU6
MjkgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47
IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0K
PiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvNl0geGVu
OiBkbyBub3QgZnJlZSByZXNlcnZlZCBtZW1vcnkgaW50byBoZWFwDQo+IA0KPiBIaSwNCj4gDQo+
IE9uIDE3LzA1LzIwMjIgMDk6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFllcywgIEkgcmVt
ZW1iZXJlZCB0aGF0IGFzeW5jaHJvbm91cyBpcyBzdGlsbCBvbiB0aGUgdG8tZG8gbGlzdCBmb3Ig
c3RhdGljDQo+IG1lbW9yeS4NCj4gPg0KPiA+IElmIGl0IGRvZXNuJ3QgYm90aGVyIHRvbyBtdWNo
IHRvIHlvdSwgSSB3b3VsZCBsaWtlIHRvIGFzayBzb21lIGhlbHAgb24gdGhpcw0KPiBpc3N1ZSwg
OykuDQo+ID4gSSBvbmx5IGtuZXcgYmFzaWMga25vd2xlZGdlIG9uIHRoZSBzY3J1YmJpbmcsDQo+
IE15IGt3bm9sZWRnZSBvbiB0aGUgc2NydWJiaW5nIGNvZGUgaXMgbm90IG11Y2ggYmV0dGVyIHRo
YW4geW91cnMgOikuDQo+IA0KPiA+IEkga25ldyB0aGF0IGRpcnR5IHBhZ2VzIGlzIHBsYWNlZCBh
dCB0aGUNCj4gPiBlbmQgb2YgbGlzdCBoZWFwKG5vZGUsIHpvbmUsIG9yZGVyKSBmb3Igc2NydWJi
aW5nIGFuZCAiZmlyc3RfZGlydHkiIGlzIHVzZWQgdG8NCj4gdHJhY2sgZG93bg0KPiA+IHRoZSBk
aXJ0eSBwYWdlcy4gSU1PLCBCb3RoIHR3byBwYXJ0cyBhcmUgcmVzdHJpY3RlZCB0byB0aGUgaGVh
cCB0aGluZ3ksICBub3QNCj4gcmV1c2FibGUgZm9yDQo+ID4gc3RhdGljIG1lbW9yeSwNCj4gDQo+
IFRoYXQncyBjb3JyZWN0Lg0KPiANCj4gPiBzbyBtYXliZSBJIG5lZWQgdG8gcmUtd3JpdGUgc2Ny
dWJfZnJlZV9wYWdlIGZvciBzdGF0aWMgbWVtb3J5LCBhbmQgYWxzbw0KPiA+IGxpbmsgdGhlIG5l
ZWQtdG8tc2NydWIgcmVzZXJ2ZWQgcGFnZXMgdG8gYSBuZXcgZ2xvYmFsIGxpc3QgZS5nLiAgZGly
dHlfcmVzdl9saXN0DQo+IGZvciBheW5jDQo+ID4gc2NydWJiaW5nPw0KPiANCj4gU28gSSBjYW4g
Zm9yZXNlZSB0d28gcHJvYmxlbXMgd2l0aCBzY3J1YmJpbmcgc3RhdGljIG1lbW9yeToNCj4gICAg
MSkgT25jZSB0aGUgcGFnZSBpcyBzY3J1YmJlZCwgd2UgbmVlZCB0byBrbm93IHdoaWNoIGRvbWFp
biBpdCBiZWxvbmdzDQo+IHNvIHdlIGNhbiBsaW5rIHRoZSBwYWdlIGFnYWluDQo+ICAgIDIpIEEg
cGFnZSBtYXkgc3RpbGwgd2FpdCBmb3Igc2NydWJiaW5nIHdoZW4gdGhlIGRvbWFpbiBhbGxvY2F0
ZQ0KPiBtZW1vcnkgKElPVyB0aGUgcmVzZXJ2ZWQgbGlzdCBtYXkgYmUgZW1wdHkpLiBTbyB3ZSBu
ZWVkIHRvIGZpbmQgYSBwYWdlDQo+IGJlbG9uZ2luZyB0byB0aGUgZG9tYWluIGFuZCB0aGVuIHNj
cnViYmVkLg0KPg0KDQpVbmRlcnN0b29kLCB0aGFua3MgZm9yIHRoZSB0by10aGUtcG9pbnQgaW5z
dHJ1Y3Rpb24hIDspDQpGb3Igc2NydWJiaW5nIG9uIHJ1bnRpbWUsIHVuLXBvcHVsYXRpbmcgbWVt
b3J5IHdpbGwgZnJlZSByZXNlcnZlZCBwYWdlcw0KdG8gcmVzZXJ2ZWQgbGlzdCwgdGhlbiBhc3lu
YyBzY3J1YmJpbmcgd2lsbCBtb3ZlIHRoZW0gdG8gYSBwZXItZG9tYWluIGxpc3QuIExhdGVyDQp3
aGVuIHNjcnViYmluZyBpcyBmaW5pc2hlZCwgd2UgbmVlZCB0byBhZ2FpbiBtb3ZlIGl0IGJhY2sg
dG8gdGhlIHJlc2VydmVkDQpsaXN0Lg0KQW5kIGlmIHdlIGZhaWxlZCBvbiBhY3F1aXJpbmcgYSBw
YWdlIGZyb20gcmVzZXJ2ZWQgbGlzdCwgdGhlbiB0cnlpbmcgdG8gZ2V0IGEgcGFnZQ0KZnJvbSB0
aGUgcGVyLWRvbWFpbiBsaXN0IGFuZCBzY3J1YiBpdC4gDQoNCkFuZCB3aXRoIGluaXRpYWwgc2Ny
dWJiaW5nLCBzaW5jZSB0aGUgY29uY2VwdCBvZiBkb21haW4gaXMgbm90IGNvbnN0cnVjdGVkLCBh
DQpnbG9iYWwgbGlzdCBpcyBiZXR0ZXIuDQpSaWdodCBub3csIHdlIGFsd2F5cyBhbGxvY2F0ZSBz
dGF0aWMgbWVtb3J5IGZyb20gc3BlY2lmaWVkIHN0YXJ0aW5nIGFkZHJlc3MsDQpzbyBqdXN0IG1h
a2Ugc3VyZSB0aGF0IHBhZ2UgaXMgc2NydWJiZWQgYmVmb3JlIGFsbG9jYXRpb24uDQoNCj4gVGhl
IHR3byBwcm9ibGVtcyBhYm92ZSB3b3VsZCBpbmRpY2F0ZSB0aGF0IGEgcGVyLWRvbWFpbiBzY3J1
YiBsaXN0IHdvdWxkDQo+IGJlIHRoZSBiZXN0IGhlcmUuIFdlIHdvdWxkIG5lZWQgdG8gZGVhbCB3
aXRoIGluaXRpYWwgc2NydWJiaW5nDQo+IGRpZmZlcmVudGx5IChtYXliZSBhIGdsb2JhbCBsaXN0
IGFzIHlvdSBzdWdnZXN0ZWQpLg0KPiANCj4gSSBleHBlY3QgaXQgd2lsbCB0YWtlIHNvbWUgdGlt
ZXMgdG8gaW1wbGVtZW50IGl0IHByb3Blcmx5LiBXaGlsZSB3cml0aW5nDQo+IHRoaXMsIEkgd2Fz
IHdvbmRlcmluZyBpZiB0aGVyZSBpcyBhY3R1YWxseSBhbnkgcG9pbnQgdG8gc2NydWIgcGFnZXMg
d2hlbg0KPiB0aGUgZG9tYWluIGlzIHJlbGVhc2luZyB0aGVtLiBFdmVuIGlmIHRoZXkgYXJlIGZy
ZWUgdGhleSBhcmUgc3RpbGwNCj4gYmVsb25naW5nIHRvIHRoZSBkb21haW4sIHNvIHNjcnViYmlu
ZyB0aGVtIGlzIHRlY2huaWNhbGx5IG5vdCBuZWNlc3NhcnkuDQo+IA0KDQpUcnVlLCB0cnVlLCBp
ZiBzdGF0aWMgbWVtb3J5IHVzZWQgYXMgZ3Vlc3QgbWVtb3J5LCBldmVuIGlmIHRoZXkgYXJlIGZy
ZWUsIHRoZXkgYXJlIHN0aWxsDQpiZWxvbmdpbmcgdG8gdGhlIGRvbWFpbi4gRXZlbiBhcyBzdGF0
aWMgc2hhcmVkIG1lbW9yeSwgaXQgaXMgcHJlLWNvbmZpZ3VyZWQgaW4gYm9vdC10aW1lDQphbmQg
Y291bGQgbm90IGJlIHVzZWQgZm9yIGFueSBvdGhlciBwdXJwb3NlLg0KSG1tbSwgbWF5IEkgYXNr
IHRoYXQgaWYgd2UgcmVib290IHRoZSBkb21haW4gYW5kIGRpZG4ndCBzY3J1YiB0aGUgcGFnZXMg
YmVmb3JlLCB0aGUNCm9sZCBzdGFsZSBjb250ZW50cyB3aWxsIG5vdCBhZmZlY3QgdGhlIHJlYm9v
dGluZyBtYWNoaW5lPw0KT3IgaXQgc2hvdWxkIGJlIHRoZSBndWVzdCdzIHJlc3BvbnNpYmlsaXR5
IHRvIGRvIHRoZSBjbGVhbmluZyB1cCBiZWZvcmUgdXNpbmcgaXQ/DQoNCklmIGl0IGlzIHRoZSBn
dWVzdCdzIHJlc3BvbnNpYmlsaXR5LCB5ZWFoLCBtYXliZSBzY3J1YmJpbmcgdGhlbSBpcyB0ZWNo
bmljYWxseSBub3QNCm5lY2Vzc2FyeSwgZmx1c2hpbmcgVExCIGFuZCBjbGVhbmluZyBjYWNoZSBp
cyBlbm91Z2h+IFNvIHNob3VsZCBJIHJlbW92ZSB0aGUgc2NydWJiaW5nDQp0b3RhbGx5IGZvciBz
dGF0aWMgbWVtb3J5Pw0KDQo+IEFueSB0aG91Z2h0cz8NCj4gDQo+ID4+PiAgICB7DQo+ID4+PiAg
ICAgICAgbWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGcpOw0KPiA+Pj4gICAgICAgIHVuc2lnbmVk
IGxvbmcgaTsNCj4gPj4+IEBAIC0yNjUzLDcgKzI2NTcsOCBAQCB2b2lkIF9faW5pdCBmcmVlX3N0
YXRpY21lbV9wYWdlcyhzdHJ1Y3QNCj4gcGFnZV9pbmZvDQo+ID4+ICpwZywgdW5zaWduZWQgbG9u
ZyBucl9tZm5zLA0KPiA+Pj4gICAgICAgICAgICB9DQo+ID4+Pg0KPiA+Pj4gICAgICAgICAgICAv
KiBJbiBjYXNlIGluaXRpYWxpemluZyBwYWdlIG9mIHN0YXRpYyBtZW1vcnksIG1hcmsgaXQgUEdD
X3Jlc2VydmVkLiAqLw0KPiA+Pj4gLSAgICAgICAgcGdbaV0uY291bnRfaW5mbyB8PSBQR0NfcmVz
ZXJ2ZWQ7DQo+ID4+PiArICAgICAgICBpZiAoICEocGdbaV0uY291bnRfaW5mbyAmIFBHQ19yZXNl
cnZlZCkgKQ0KPiA+Pg0KPiA+PiBOSVQ6IEkgdW5kZXJzdGFuZCB0aGUgZmxhZyBtYXkgaGF2ZSBh
bHJlYWR5IGJlZW4gc2V0LCBidXQgSSBhbSBub3QNCj4gY29udmluY2VkIGlmDQo+ID4+IGl0IGlz
IHdvcnRoIGNoZWNraW5nIGl0IGFuZCB0aGVuIHNldC4NCj4gPj4NCj4gPg0KPiA+IEphbiBzdWdn
ZXN0ZWQgdGhhdCBzaW5jZSB3ZSByZW1vdmUgdGhlIF9faW5pdCBmcm9tIGZyZWVfc3RhdGljbWVt
X3BhZ2VzLA0KPiBpdCdzIG5vdyBpbiBwcmVlbXB0YWJsZQ0KPiA+IHN0YXRlIGF0IHJ1bnRpbWUs
IHNvIGJldHRlciBiZSBhZGRpbmcgdGhpcyBjaGVjayBoZXJlLg0KPiANCj4gV2VsbCwgY291bnRf
aW5mbyBpcyBhbHJlYWR5IG1vZGlmaWVkIHdpdGhpbiB0aGF0IGxvb3AgKHNlZQ0KPiBtYXJrX3Bh
Z2VfZnJlZSgpKS4gU28gSSB0aGluayB0aGUgaW1wYWN0IG9mIHNldHRpbmcgUEdDX3Jlc2VydmVk
IGlzDQo+IGdvaW5nIHRvIGJlIG1lYW5pbmdsZXNzLg0KPiANCj4gSG93ZXZlci4uLiBtYXJrX3Bh
Z2VfZnJlZSgpIGlzIGdvaW5nIHRvIHNldCBjb3VudF9pbmZvIHRvIFBHQ19zdGF0ZV9mcmVlDQo+
IGFuZCBieSBjb25zZXF1ZW5jZSBjbGVhciBQR0NfcmVzZXJ2ZWQuIFRoZWZlcm9yZSwgaW4gdGhl
IGN1cnJlbnQNCj4gaW1wbGVtZW50YXRpb24gd2UgYWx3YXlzIG5lZWQgdG8gcmUtc2V0IFBHQ19y
ZXNlcnZlZC4NCj4gDQo+IFNvIGVmZmVjdGl2ZWx5LCB0aGUgImlmIiBpcyBwb2ludGxlc3MgaGVy
ZS4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

