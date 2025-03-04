Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB1A4DE0F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901074.1309048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRUI-0003I9-SL; Tue, 04 Mar 2025 12:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901074.1309048; Tue, 04 Mar 2025 12:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRUI-0003G0-P0; Tue, 04 Mar 2025 12:35:06 +0000
Received: by outflank-mailman (input) for mailman id 901074;
 Tue, 04 Mar 2025 12:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpRUH-0003Fu-A3
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:35:05 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f403:260c::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f1331b-f8f5-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 13:35:04 +0100 (CET)
Received: from DUZPR01CA0138.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::14) by PA4PR08MB5917.eurprd08.prod.outlook.com
 (2603:10a6:102:f1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 12:35:00 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::88) by DUZPR01CA0138.outlook.office365.com
 (2603:10a6:10:4bc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Tue,
 4 Mar 2025 12:35:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 12:34:59 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Tue, 04 Mar 2025 12:34:59 +0000
Received: from L120940c9ce24.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D99C0E0-6828-44E8-9AB9-BF52CC7A99E2.1; 
 Tue, 04 Mar 2025 12:34:47 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L120940c9ce24.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 12:34:47 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6674.eurprd08.prod.outlook.com (2603:10a6:20b:302::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 12:34:46 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 12:34:46 +0000
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
X-Inumbo-ID: 18f1331b-f8f5-11ef-9ab4-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DSoLizXazBM7Si5ol2ork/YWA/LhtTieEPSeOVcKmRwmSi8yIDyezswHbtcZcaD6a94VjY1nziSaskF3/OM+5fh7ncEs8wHFG5xMAYqlDgmxb2MSW2PoNi0mVatVnFaY0SoPtTe6Xa7xd1DCHQ72o/f2zpWtw3dmeRV6exTApya446k6FZxpecjIMdt6d8FmuwDfGz8amYUcjDrw4/y4Kc2/zWrs+KB3aE7cMIG0EOJHr2u/azST2cS3dvvgDu3Swl4TTfba0SeN0BSQt/JQyUm7n1GBPeAodvmF9tghBsynapZUgU8HWRnVfzk46FqxJ1hXtm8AszeDND1/tN6qPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=renp6NUFPwLDQcAZam3SHySFZV7cJ0HGwG3/Ce30Vvo=;
 b=lyPe6OStATLPuKe6te26/wWziwBrEO2esTKQk2Uipej+//YbYJ2b8sxpnB2d2vnfGqTjzW/PzOGzYf9SCb6BhZC7cfla2xIzoImcJ/ChESOUEVCW7Wch81zZx5r7ASPmVEnBXSiwILYlav1LnazSxa/x4T9WRtoOV3oI8L74M/A1WWEPSavmuqdd4RhQKi9b9kYSUd0XBzNgMVVe63RP46EmH6uaebP6s69B7JilSptenzO7L5VK98J0Ha8NFtsobdVaPb5JLMDBcyJki1T5covHWaw5F6vgGNw24h/MMoGF6LdJknO+gDM5CfgkNUk8Y3XXDbXgvsXBvTfdlWQVog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=renp6NUFPwLDQcAZam3SHySFZV7cJ0HGwG3/Ce30Vvo=;
 b=SladmEgqW/EO2gotxaar+kNsuGjXMzLcXx6R/vbx8FbV5HqwrmPx42pbsdI2OfwJj58ieI8x72mN3KWNdwXD0pgmb9QH6m7zrC1GkNfhbBLX4S+umNQwH2ajO+lXA3iXK5JSUb8W+nQbxsj0X/WpGqs/8Blwe4uRSbugsZRBKXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61a0da63a8b6dc34
X-TessianGatewayMetadata: z0Cv8v1PsNsmT0l4VIvP5w0fm4QsffDAO7JVammxcAJVriUxaF2A9r5Vhk+BnAX3KRkasrNmbESBIVrbtaBMyV6gTQXOmINkVrlDg1fCJ3uxW8Nqgo9Bb3bx/dZVMT2bs0n6QifWrGara44789go+hhsSDDfGgCzpbD/iWxV9tU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9w/fTRQxXBEw+kxEYQfcDYytT7/+L6mxZBq8zdhIKsJPB1pdeaZl56uoqKe1JitdwecGPnkw2xxhqnbi6OdeABmPDYemnxMZsgP0+gkf9Df6rJ4AUICkD2Wn3o5gbrlVieygtxqnXeA7TjD+FAsZ6unK+pdqb4TyJG7qpHdNLWDdRp0z6XqBKUNmOz3gP06rlPOxyYvVpKJJOaQF9zNL2RsJgRfFsQXS0A1pgX7ug4CRqGRhtflr4kceKhzVxEFn1QAOEI+F3fMIN+tugD7wdnp3fSx0Z1ucR3kwlT0DUUNpwKeHRHDRm0OHB6rXndDrZvTCOgI6fo4h2icvnRYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=renp6NUFPwLDQcAZam3SHySFZV7cJ0HGwG3/Ce30Vvo=;
 b=qb+ZkGD6MzwqOyQ4+eN7AZ0IH3EsYiEsnYg2Js7LXxMuVaUI6H2H4wfTUuUZK4fpnaKTQeImklrZfF4ea0KJ00HHAduD0smxMSRsLiIXhFqPCGjawNcvCMTeN3xR0byTFXF8B5Cgg33mMCJsFURi3rwq9YVeDjp+Mkvk0PgG7lANc3p8KfI5Da4yu6hBFX2+dRq8d/2uKeCSo8UVPhspaJyRM6pr1tWCt/kDqDFEYcYe8Dqnz3caEXDFtJ6GweoRPAEaspJIAC1yWqKRCkZoHbkwnFAXY+75MlonJ9kb0BY8y9NRb9xMyIskl/+lUhhLPfehjZhKl0AvzrBhT3Tv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=renp6NUFPwLDQcAZam3SHySFZV7cJ0HGwG3/Ce30Vvo=;
 b=SladmEgqW/EO2gotxaar+kNsuGjXMzLcXx6R/vbx8FbV5HqwrmPx42pbsdI2OfwJj58ieI8x72mN3KWNdwXD0pgmb9QH6m7zrC1GkNfhbBLX4S+umNQwH2ajO+lXA3iXK5JSUb8W+nQbxsj0X/WpGqs/8Blwe4uRSbugsZRBKXY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 7/9] arm/mpu: Introduce MPU memory mapping flags
Thread-Topic: [PATCH 7/9] arm/mpu: Introduce MPU memory mapping flags
Thread-Index: AQHbifxxstWZu1+izkm98KZaptgcyrNi5MCAgAAKwYA=
Date: Tue, 4 Mar 2025 12:34:46 +0000
Message-ID: <A5C7FC4C-370D-4B95-99EA-92D45071C65C@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-8-luca.fancellu@arm.com>
 <5c564bd2-dc19-4f3b-b4da-751a50a3ea14@amd.com>
In-Reply-To: <5c564bd2-dc19-4f3b-b4da-751a50a3ea14@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB6674:EE_|DB5PEPF00014B88:EE_|PA4PR08MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3a182b-194f-4777-4ee2-08dd5b18fa4b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?K1BVd2M2THcwMk14VCtaY2lESGN3dEQyUkZ0YWM5T1JlZVk0NWU3dk5ETE84?=
 =?utf-8?B?RFl3Q2h2eTRrZ0ZLZnIzQk5TRDM2QWhiTUdieTNSdHpFOUVGNy9zTzMxejhq?=
 =?utf-8?B?SnIyWHpCQ1BIU2hyS2s2MkVZZms0UEdPZ0lsV0NPaTZGYWdxb0VYd0pMamJq?=
 =?utf-8?B?aThSYXBWbXlFWUFERmlnaWRRUXJ1TExSMzBGMVNMdldGOGpJOEhaMkNreTJH?=
 =?utf-8?B?RmRnQnZWcDMzY012cWdoRCtvSHprYVd2R0gzRisvV3hSa1g4eTFFcEltazBR?=
 =?utf-8?B?WWlTK1lGNW9yT2RXZ2F1N24yUlQ1czE3Qms1b2xJSExJSUNXOTNFTTc4Mlc3?=
 =?utf-8?B?OG55TGkrbTZXVGJoVzNEUzk3OGwyay9nbENFM1g0SkRUNlB5MENnRFBKV3lo?=
 =?utf-8?B?WDF3TnlrQXpOelhNWlpmTjRNaWh0bVJ0TEtMSWltZkk4UEZVcTZGRWNmMWYw?=
 =?utf-8?B?WkozNnFGanNCZnNFOFc1dmpwRFY1dkxXdXhJa3BFbXBwKzkrdEp5cFVnQWVZ?=
 =?utf-8?B?VkcwQmFQejFmZFJVMGJZT1VFVXdiOGNQdUZGaXU1VjBTTUhFTGhZOEVScHF4?=
 =?utf-8?B?UzVUSFM0UHQwdjBUT0hsbWhNWGVKNk1CNHNDdkh4dXFTZk1XbDc5TDM4SFF5?=
 =?utf-8?B?Tk1wczVVRlBEVWNnQkxsTTdyREhTOVhpNDFwU3ZhbHFITG9OeS9VZzlpY0NN?=
 =?utf-8?B?Mis4RUk4ZGhaclFQdGU1ZlpSWUpVaFI4cjQzNndGRVc1eGRMNFFPbGtvWVVH?=
 =?utf-8?B?b1A4QnNpQktQVmc1aVVDS0JWQ2FIeU1JeWh5T1Z3M1ZNaXlRMEtSakVwYkJG?=
 =?utf-8?B?Wkg2bzl5M3czcHFRODJWT1JhUGRWeGJiSGI3ZGplclFCdXdGNjZrMXhDYW56?=
 =?utf-8?B?aXdaalV2RUgyalNBOWpzVWZFNVpwNEt0WXBsOGhDVGVxNk4ra1NBODhEcEZF?=
 =?utf-8?B?dmt3dGMzWVhNc0ZtYkVvNTV1T3FYbkdaaXBrcFJiZWZIUDh6RXBWVjI4S3ov?=
 =?utf-8?B?UjNhazFXa29Wbm9NS3lOZCtwczltSW1BYUppenplUnJrODRuQjZKeU1yUE00?=
 =?utf-8?B?a3daWCsrTUo1QVhxOWFYNG40T3NFN3ZUMTkybmJuWmxoVXg3cHkxK2l0WDI3?=
 =?utf-8?B?SXFmSVpKVGdjMXFJUWlvVnhsRGRDbXNPT2FnTUpWT1BHbDNOb3piR1JkL25P?=
 =?utf-8?B?M1Z0Z2g2YUIwdXplYlUxM1d5aEFwY2VEQzN1RndBV0YxSmtKaVNsTk42K2VL?=
 =?utf-8?B?UFdFTUkzY09iUkc0MXV3bnpLR1hQb1h0Q1ZDYzBVRStHdmVTeERHZUlqb3ZJ?=
 =?utf-8?B?cHdCR1hjTUo0VU5LNUh6VStiU2JYZ2tPRmxTZVJMalBlT3gzdnpXVDlLdWFY?=
 =?utf-8?B?YlRhM1EyQnE5S0lEejlDb053a3M3NitjTjNySm80ZERHeUZaT3FiL214WGlN?=
 =?utf-8?B?cjRQSzNMQWRyNVNoSHl1WTBJb3huRjZzblF1b3gzLzhnbElLaXpaY3FmTWU0?=
 =?utf-8?B?K1NBWnZtMG0wR2h3NXhQK0JyeGkvU3JtTHMvcnptaGlIdmpQNTVoS1lVTUt1?=
 =?utf-8?B?WmJWNFBNUWNSZG0ySWFVM0tXRHF4VHEyNzl4dmdUSTlyVG9kWVNEck5TL2Rm?=
 =?utf-8?B?amxhZHM0NndFVEZOcEpIL1psc1ZjVVMvOStDWE5MY3pPNnEzT2UyUVVOK0Vu?=
 =?utf-8?B?T05ja0hZTlNiTTFlRHE0dktyQVpJWkZqZFIyaDFWeGlnZS84K05KcWV1VTd3?=
 =?utf-8?B?QS93Q1dvR3JMamNhaTc2WlZkandSengwa1hzazhRdGFFMFpqMW9wRXQ4bXEz?=
 =?utf-8?B?djA3bHJWRDNSYVpkbEVVR2VlWklDZ0d0M3M3THl5dGZtR2l3VmFRUHVUb2Nq?=
 =?utf-8?B?RHZuTVJSc21IZ0FMc1p0MGhKYUFBYk1CYitydm5tdGlKTEVqYjdycGxXVGNS?=
 =?utf-8?Q?3wr94Chpjz5uv2SzKyJiPBmurbBxrFVc?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F7339C3BE8BEE4084E558156931A832@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6674
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba3e93bb-9897-4a43-4d49-08dd5b18f27c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDhrQjd4ditTWjVWYXdacGowMThYRTkvdjErRlU3d1JnanNEbnkyNXkxSEkw?=
 =?utf-8?B?SElrd2N3VkRWa1dURWF2RHBQWC9UbWgzUFZwQXRhSllTTjJqZmxJSjBDYmlX?=
 =?utf-8?B?T0NmNXdQTDFDdzlobEgxLzhJbW50TXhQQWV4eGZubU9iZlM5NlBtRFZzb09q?=
 =?utf-8?B?c0ZZWG5UdWc1c2UyQUVwMW5oeHJLUFIvRWhMQTYrcGg1eXhoMVIvOExyRDZ2?=
 =?utf-8?B?R1ZPM0VVSUEvdkdhK2YwcjJIV1V3d21aYnJHMXJvc3diTnMrRlV5cDlnYlMr?=
 =?utf-8?B?THRLa0JTSnRNOGszbldzV3ZrQzgrWk8zSENwcFo5OFJVd2J1eDlZWHhJdm9N?=
 =?utf-8?B?MHlPeFN3cU01dHQ0clVrZElKK2ExQlF0TGpZVzNTTFNleFdEc3l3V1RTUEhJ?=
 =?utf-8?B?Nk1ybjg4VFZmcXFYWEdhL1E3K2ZncGVMVmJxTklsTHlyVHJrdmVSenYyUEo5?=
 =?utf-8?B?VDdHVnY3WmtMVVJLUHhvTjdQU1ZtTzdBQ2lQU2JtTk9lQkttYkpSMU5raGpq?=
 =?utf-8?B?TTd5OXQya3RjN2FqeFBRdnRNSlR0NVR2K0FaVzhDZk1Ga1IzYlRpTzRJNHVm?=
 =?utf-8?B?QjZPeDdEWHAwYy9nVDg3eGxCamxwTFduQmFxTmRFNklnVE16TDh1cDNuK1V6?=
 =?utf-8?B?TmZpTzJ5YzhQQ1RyeUUranJyKys2VXMvVlBTRy9VRmt5TWlGaFMxTFl2R3hN?=
 =?utf-8?B?VVVZaHhuT1hMN3E2WDJ6VDFpU09tNGU2QWxEVnVUaVp5RUx5VnFKaUZHMWtp?=
 =?utf-8?B?c2ZTYmFQeW9qOXE0UkZJcTlXd0cxaGdkRHFRSGRFZDNtUU1kUUdZbVJGZGlK?=
 =?utf-8?B?R2VyemY0Nktaa1ZkWm54R2E4dWp3eDJQd0RBVjk1cTZkYlNGWUpodXdBMCtL?=
 =?utf-8?B?VTB5SkdoWTQ3MWt1QnlscFZwb0s5RzNHbll4aEdHSTlFNWtLZVJHSzJzaHVm?=
 =?utf-8?B?SVNOR05IaEEvZEZvbFRFdGZEZmZCdzhaNzhhVVQyZk5Mc3ZiTiszTUtjRHdn?=
 =?utf-8?B?aE9hZTJhbUlyTnBLSTF3N2E4S2tVVlZEcFhGSG9uS3FvNXZ0cUxXemRXMzgx?=
 =?utf-8?B?enVsZG91OTlFV2VMM0RmQlk2dittNXo1Y1ZDakRjUTgxMU14bU14TUJTdlY3?=
 =?utf-8?B?dlZiZ1BDUC9UdGp0VXVYQ1lTY0hOWTllRDgrZ2g1Mm1KVHIxV3lWWWpwNXMr?=
 =?utf-8?B?bGJHU1VjcGJnN0Q4UW5UZW5HaDY4TGtoVWNSaG8zdytmZU1FQXQvTVdYNENs?=
 =?utf-8?B?NUE5T0h4R3dGaDlRclVlRmI4UW93ZHM5VHE1R1M2VUkwNWNuZnMxRE5Mbzda?=
 =?utf-8?B?VzgyY0dEQlNjc0hzWXhGVUNKcy9sVTBZK0hGRzl6ZVJGaWFvWVBROUg1WDhk?=
 =?utf-8?B?NkxJUnB2WWp1ZkJxZ2RlcHlhb3RYcU5MbjMyYXpSc3g1ZHJXd0J1NGovWENh?=
 =?utf-8?B?UG96MThBMVhFZmRRNGQ0ZFBNTE1CR3E4MlpXSmxPM2trZ0dxUVpTWS84dTZv?=
 =?utf-8?B?QTY5UGQvb1RiSkJTV1kwZ1hmeGw1RkUwU2NtOVZORnN4bVJPaWdwR25va1c2?=
 =?utf-8?B?Y0p3Qm5Vc0RtczczNjNjTlh4MXltSjNqNHhXaCthbjFqRGJJQncvRDF4cjNy?=
 =?utf-8?B?Slh5U011dWQ1QWhKempGRjZCbHE2U0FPZWlPSlpGSnVTeGZYUTZmSFF0a1R3?=
 =?utf-8?B?UWQybHNkZ0diQ1VUemlFT1FKUTF0bU8yblQ1blhmMDdNV0FkdWJTRVdueW9w?=
 =?utf-8?B?V2VDQjdscTErcHpWMkJwdnd1VzZZcnFDQTVXOVpHNlpPS3pKd2FEUjJOM01p?=
 =?utf-8?B?V1k5NTJTZHpaWHFJRm95T1R2aFZYM0ZzRTlFOEJyc0wxMUJLci9SYzZFZ09G?=
 =?utf-8?B?YkFoeHdLeFhUb3QvcjhkQlAxNGdFMk1rTmV1SUQ4TDRnR24zbUVWaFpBVFls?=
 =?utf-8?B?UFZIVTExS0NVRTIrQ2EyMkh6Y2kyZGJlVkJjazZOaVhxWE1adWtnN0MzZkt2?=
 =?utf-8?Q?2qfcNfKRw7fHDH1uRDnsAW28Q8rIiY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 12:34:59.2904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3a182b-194f-4777-4ee2-08dd5b18fa4b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5917

SGkgQXlhbiwNCg0KDQo+IE9uIDQgTWFyIDIwMjUsIGF0IDExOjU1LCBBeWFuIEt1bWFyIEhhbGRl
ciA8YXlhbmt1bWFAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMjgv
MDIvMjAyNSAxNjoxOCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IENBVVRJT046IFRoaXMgbWVz
c2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVzZSBw
cm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlj
a2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPj4gDQo+PiANCj4+IElu
dHJvZHVjZSB0aGUgTVBVIG1lbW9yeSBtYXBwaW5nIGZsYWdzIGluIGFzbS9wYWdlLmguDQo+PiAN
Cj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4N
Cj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wYWdlLmggfCAyNSArKysrKysr
KysrKysrKysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykN
Cj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wYWdlLmggYi94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcGFnZS5oDQo+PiBpbmRleCA2OWY4MTdkMWU2OGEuLjIy
ZjdkMmM2Y2IzMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wYWdl
LmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wYWdlLmgNCj4+IEBAIC02Miw2
ICs2Miw3IEBADQo+PiANCj4+ICAjZGVmaW5lIE1BSVJWQUwgKE1BSVIxVkFMIDw8IDMyIHwgTUFJ
UjBWQUwpDQo+PiANCj4+ICsjaWZkZWYgQ09ORklHX01NVQ0KPj4gIC8qDQo+PiAgICogTGF5b3V0
IG9mIHRoZSBmbGFncyB1c2VkIGZvciB1cGRhdGluZyB0aGUgaHlwZXJ2aXNvciBwYWdlIHRhYmxl
cw0KPj4gICAqDQo+PiBAQCAtOTAsNiArOTEsMzAgQEANCj4+ICAjZGVmaW5lIF9QQUdFX0NPTlRJ
R19CSVQgICAgOA0KPj4gICNkZWZpbmUgX1BBR0VfQ09OVElHICAgICAgICAoMVUgPDwgX1BBR0Vf
Q09OVElHX0JJVCkNCj4+IA0KPj4gKyNlbHNlIC8qICFDT05GSUdfTU1VICovDQo+PiArDQo+PiAr
LyoNCj4+ICsgKiBMYXlvdXQgb2YgdGhlIGZsYWdzIHVzZWQgZm9yIHVwZGF0aW5nIE1QVSBtZW1v
cnkgcmVnaW9uIGF0dHJpYnV0ZXMNCj4+ICsgKiBbMDoyXSBNZW1vcnkgYXR0cmlidXRlIEluZGV4
DQo+PiArICogWzM6NF0gRXhlY3V0ZSBOZXZlcg0KPj4gKyAqIFs1OjZdIEFjY2VzcyBQZXJtaXNz
aW9uDQo+PiArICogWzddICAgUmVnaW9uIFByZXNlbnQNCj4+ICsgKi8NCj4+ICsjZGVmaW5lIF9Q
QUdFX0FJX0JJVCAgICAgICAgICAgIDANCj4+ICsjZGVmaW5lIF9QQUdFX1hOX0JJVCAgICAgICAg
ICAgIDMNCj4+ICsjZGVmaW5lIF9QQUdFX0FQX0JJVCAgICAgICAgICAgIDUNCj4+ICsjZGVmaW5l
IF9QQUdFX1BSRVNFTlRfQklUICAgICAgIDcNCj4+ICsjZGVmaW5lIF9QQUdFX0FJICAgICAgICAg
ICAgICAgICg3VSA8PCBfUEFHRV9BSV9CSVQpDQo+PiArI2RlZmluZSBfUEFHRV9YTiAgICAgICAg
ICAgICAgICAoMlUgPDwgX1BBR0VfWE5fQklUKQ0KPj4gKyNkZWZpbmUgX1BBR0VfUk8gICAgICAg
ICAgICAgICAgKDJVIDw8IF9QQUdFX0FQX0JJVCkNCj4+ICsjZGVmaW5lIF9QQUdFX1BSRVNFTlQg
ICAgICAgICAgICgxVSA8PCBfUEFHRV9QUkVTRU5UX0JJVCkNCj4+ICsjZGVmaW5lIFBBR0VfQUlf
TUFTSyh4KSAgICAgICAgICgoKHgpID4+IF9QQUdFX0FJX0JJVCkgJiAweDdVKQ0KPj4gKyNkZWZp
bmUgUEFHRV9YTl9NQVNLKHgpICAgICAgICAgKCgoeCkgPj4gX1BBR0VfWE5fQklUKSAmIDB4M1Up
DQo+PiArI2RlZmluZSBQQUdFX0FQX01BU0soeCkgICAgICAgICAoKCh4KSA+PiBfUEFHRV9BUF9C
SVQpICYgMHgzVSkNCj4+ICsjZGVmaW5lIFBBR0VfUk9fTUFTSyh4KSAgICAgICAgICgoKHgpID4+
IF9QQUdFX0FQX0JJVCkgJiAweDJVKQ0KPiANCj4gQ2FuIHlvdSBwb2ludCBvdXQgdG8gdGhlIHJl
ZmVyZW5jZXMgKGluIHNvbWUgQXJtIGRvYyBvciBzb21ld2hlcmUpIGZyb20gd2hlcmUgeW91IGhh
dmUgcGlja2VkIHRoZXNlIHZhbHVlcyA/DQo+IA0KPiBBbHNvLCBBRkFJQ1MgeW91IGFyZSBub3Qg
dXNpbmcgdGhlc2UgbWFjcm9zIGluIHlvdXIgY3VycmVudCBwYXRjaCBzZXJpZS4gU28gY2FuIHlv
dSBzZW5kIHRoaXMgcGF0Y2ggbGF0ZXIgKGFsb25nIHdpdGggYW5vdGhlciBwYXRjaCBzaG93aW5n
IHRoZSB1c2FnZSkuDQoNCknigJl2ZSB1c2VkIGFsbCBvZiB0aGVtIGluIHRoZSBmb2xsb3dpbmcg
cGF0Y2hlcywgdGhlIG9ubHkgb25lIG5vdCB1c2VkIGlzIF9QQUdFX1BSRVNFTlQsDQpidXQgaWYg
cG9zc2libGUgSSB3b3VsZCBsaWtlIHRvIGtlZXAgaXQgdGhlcmUgYXMgaXQgd2lsbCBiZSB1c2Vk
IG9uIHRoZSBNUFUgc3Vic3lzdGVtIG1hbmFnZW1lbnQNCmluIG9yZGVyIHRvIHNpZ25hbCB0byB0
aGUgc3Vic3lzdGVtIGlmIHRoZSBtYXBwaW5nIGlzIHRvIGJlIGNyZWF0ZWQgZXRjLCBzbyBoZXJl
IHdlIGFyZSB0cnlpbmcgdG8NCnVzZSB0aGUgc2FtZSBpbnRlcmZhY2VzIG9mIE1NVSBpbiBvcmRl
ciB0byByZXVzZSB0aGUgbW9zdCBvZiB0aGUgY29tbW9uIGNvZGUuDQoNCkNoZWVycywNCkx1Y2E=

