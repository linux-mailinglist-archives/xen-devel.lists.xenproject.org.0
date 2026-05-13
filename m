Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJbVOY48BGqsGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:55:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6553005B
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307706.1579290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5NI-0000n1-Fu; Wed, 13 May 2026 08:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307706.1579290; Wed, 13 May 2026 08:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5NI-0000k5-Cd; Wed, 13 May 2026 08:55:28 +0000
Received: by outflank-mailman (input) for mailman id 1307706;
 Wed, 13 May 2026 08:55:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wN5NG-0000jv-TN
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:55:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN5NF-003v5A-Vk
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:55:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a043c79-e002-0a2a0a5209dd-0a2a450bbf08-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:55:25 +0200
Received: from [40.107.162.35]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a043c7d-212f-0a2a450b0019-286ba2230fe2-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:55:25 +0200
Received: from AS4PR10CA0010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::7)
 by AS8PR08MB9600.eurprd08.prod.outlook.com (2603:10a6:20b:618::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:55:20 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::1d) by AS4PR10CA0010.outlook.office365.com
 (2603:10a6:20b:5dc::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 08:55:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Wed, 13 May 2026 08:55:19 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6389.eurprd08.prod.outlook.com (2603:10a6:20b:33e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:54:17 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:54:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v+78jAezfQLD74UQ+QHwyEY5qUUZ+IKF07GzwvKpb/xxmcu4MMFbeWRowkVH9camtzRig2RiwACILA7iIQNZ8YvRfIj83t3kXkriskvYHlJsg/OoCAEji+K1ir2VZR9Y0uQ8FK1HDfdfthLya0wYG77HsEaabiubSJ3cbQ6k401M5I21Jpdy+MFQolz5tiUvhviq8fxe0Z20jDSeGPEmQtKPa3WTGE9LzV6t1uvkJxBvLb4R4g2vA/AsQSm9u7ILtsuEJmN5wsCAITWTfYPyPa17t44+unxYeyNeInXAHsfWueXskvKPWst4RWgmHCPkcmMvD0NwG3LSz2TDSgRATg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcXmkXA27Cys9Y9PmY4NkZ7gwXBuk62oSprMZNpmrCA=;
 b=bOX/+mDZWxLQzQw02n+dUBE46w+NbniejqyP5klOttWzxhPC1w9GNj1MRIHbMYVjtHdxIXkC9ET22DnCQffyAJos2I7Hj0/foco/lnqZF7mFufxqk5NqTqwH8Vxj1RSRaT8bzMzHLdNyGri4vJvhMGg/cBnZnJuN155M2PZeYe6kMBuQYRRUoP7Pu095XGVztQqcDV9YgM4kYG/uxwz8NlCtEwCtFI+PnNKeSwIKbGORuMKmlJInLLYb6XyUBbTMinHOhX+S+7CmgsMulPuJxAKlvdYgZvofevaif8J7zf+/A8ScVnUoVCQOdhmZbSydmv+B1EUmCxXxfYLZbRT16w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcXmkXA27Cys9Y9PmY4NkZ7gwXBuk62oSprMZNpmrCA=;
 b=TvwAEk7jFU8/HAPYgx7a0VRcATWSsRMZs28fmkdHPv0IyH+hRde0vOsdEaFYK9pW80NWGd1SacMk9MzB4fKlllIQxS7M97mJIBMCBgLRS8y7XHVzvLcOTzV0WYzig6IxT5/KzsoopY+elS4mopUCvXXv0I5qETVLa4QUjAkB910=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdqSaIkuJ4BYdVMYWAxPA/cZNbVDA6Zw70oTHIZ+H52U6Gcq0sm4kcbZ3D3Iuv8P0+uv6mqErI6m0/Yh8B70L3g4Px67Q0AXK+zXlZkCKNHb+zfWY8ZNZ2wZJ7p80zFocxDgQdlZBP2EUvtP+W1OmnJVUB5EVhddwzN5U4WcomC04so/M3QnNeaoGdBGPps2i3kcy6L8S+qx2buYxYFlz7cpcWzcVS9ZjNfzMSOK5myqhWSebabLgGQXw9moEFev+gbj1suuZ8R+NC+S17QRRYNjnu8d+/o3m9QxW53TLMYc1u3rDWeRBkCE4mTbVwgiiGZKc4HNKZk3pPIvr5Etxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcXmkXA27Cys9Y9PmY4NkZ7gwXBuk62oSprMZNpmrCA=;
 b=E8gfyHFAVgo2IvZtpOaQEQVKUroKdj63yzceDgrgV2l80QMT8ShsaCDnqz18pzmQDiFiNseilfMP9QVfrtmGJctdr6dhMraooySQOL35N8FnFmMbOZ/Npfk9GhCTytbs78yrYVXHqrzW6gCGYbB8RQ84BVB5DSZT+XvkLYE+ipMVIFHCgf0+cPSeip4aap5Q+cA9MPAcsnRf0GI0rSTyMcm/ddVgKoYZC5DgSQSuOZ/yRbT8m6jR1X9f+rPjUJ8USiv4g5luio7vnSqR5GvGpN8EyNV2Rl4HaZgly3b+/0tRW9hZP5yYB1PtW4YcvSKlSW3PcOrcpxq76Pjyrv3+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcXmkXA27Cys9Y9PmY4NkZ7gwXBuk62oSprMZNpmrCA=;
 b=TvwAEk7jFU8/HAPYgx7a0VRcATWSsRMZs28fmkdHPv0IyH+hRde0vOsdEaFYK9pW80NWGd1SacMk9MzB4fKlllIQxS7M97mJIBMCBgLRS8y7XHVzvLcOTzV0WYzig6IxT5/KzsoopY+elS4mopUCvXXv0I5qETVLa4QUjAkB910=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v6 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v6 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index: AQHc4jjk+ii595NFpkWdCINvGnB407YLkW2AgAAWJQA=
Date: Wed, 13 May 2026 08:54:17 +0000
Message-ID: <CBA96303-70FF-4356-A4A4-EC0059F8FD94@arm.com>
References: <20260512175729.1915120-1-luca.fancellu@arm.com>
 <20260512175729.1915120-3-luca.fancellu@arm.com>
 <12115791-513e-4d1b-956c-6b0c00bebe3b@amd.com>
In-Reply-To: <12115791-513e-4d1b-956c-6b0c00bebe3b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6389:EE_|AM4PEPF00025F9C:EE_|AS8PR08MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ff61c5-e292-4ca9-f08f-08deb0cd5c5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 1VP6O5ULENXzw2clruVUYAkt7PO0TWQcAR279oR+LaTO1/wZmpxd2Uq7hBcair88xNNrPMlVG9cCs97kJ6ZLMangCwmUfGN5zeCP6BGl6molwlXhR1QKSACTJFqemb+g/EhIyt9SGtrEJDi1nxJwept8A7UmNOJqeVPgXy6YzcdR34lGQvA2eccp1CeKfEQrne0ZT9SiniRbWif0TGvGte+TG2r4/HM/6D2YGliwtoj0W8PTqUzkpJVa8p4CKdl4TnLwcRUVHHCj0pL7V5q2QPgUub9L9sn9liqFrmacIdDGTzxQNtBNZM6E5qcQZ0LEdclqnPSvKTrw/darHq5J8xycj+l1Ag3RRhNTGGI5k0mqcwJ0Ia1drs89aFW98MtiampHwidlqvxlRt0reTy0G53vOSUeWs5Gmynm3iHJvSpdFxeKhlKjqJ/Q3ylnM+JxQc1+PHMmnWk1WHHSUFxqdIiP7DrPO0dHwCSRQVRhUDbYEvzI7VLRvHiT0m7Zg0Cuck25cbxaQBzsr3R86J6b3zmJplPFlFGzxmQ0SiJuQrdTAZ3FDsBgUr8SMsw1crbrUNNsfR4x4KGvZgFY/YNqr5s8tgU/x2v7hWRCtm1FMhcZdT2XgFu3NQgFNHQlnBeMy1wOh3e4QyQF887tGzowm11p+6zTuy3pt205mHIOvvhJ1Es3XsIs2kfxVlP5ZZKBkHI7or6Moik7U7HYLirjXXUBO+hrRGkEh/RoBxLfmh6PR7fLrVDLAhPrVD4x+RX/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6DC4DC59A09F2248A7A03F1B1CF2FB53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 hXQSg8LFPaxnTh8THCJirtQXmlSkR1vyRZJ3jqHzVgc9ej6wTesQo19v/H/9EFxEyR8P9IGZyi/CXiepj48yzqDUwP2dzJvPsh/STV5xzUUVINHKdvM0eSfGt1eBJ4owFEfkO7WtLGbR5q12CSqGkGzOsSMARESPcrkF611oYcxFDlz99n6Xve353YxplhdqtiuiS0ZtZ3vjDQPxxvb/CWFy8Tse8l/z8Xo2QgsqSeep3s1QA4hvbTtpzxlD6mBZp+CNoUDmD8oQp26LOMVRKK/HNip11rOYL2ywWzSPIpq//aktMBs5zdONdJo4j8ktxI3+f2VFXpWS1es3Ubfipw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6389
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d1a16ab-642f-4221-5aa2-08deb0cd370e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|14060799003|36860700016|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fHUXgzJC2KG/Iqy4i+7gtDEX2YTaXgQfJ8w8i1Itqc/czTfPufc7LN8O3W5n6fp67XjSSj5I/Eed2Jh+TAEYomeWYfVjPCZe4dkwnc5x3yJdRadtBRt4KzatZn3hPVUjyH3xAJdZDs7ku/aZX9gvpa0O2RprBYX1rza90NmOjGT+DqyFfs2gT2gkQbSJXPa4dwXuhrSxOQlDOSsjANdbr4M4eT5TIa1xqbFKkWlan3MBLclVnZC2qUijwTbXiUMiV1pTx8fSrCqIhFx8CMq31OFILjEu3aH7MhOya71ACXVMfXSizFmx8yfw3FkSkhNF03fd9HsVgMSs1PobOnc6m/i8vOD7FKYD1cw48a/EZk/MKB++B/UBsnPcR+WX6jPkE67AxhPsQcN3lGdTgGGW2q7WB23WhN09x0qIhgi8FyspLVoBbnxh8G0Srok9o5YzWPPzpJokr3+gS4BhG3QtJoAuCaSbwr+2GcFb4SYNZnqzE8TwzJdmQR8l1ii/UI7gfEHsuDSU/UBQyy3TS55F9JqDVwR8n9lhOX0tQIsBjmIYXiwLjeznFfxyC8grMscAmzhAMUMjygxhBkV7WFxE7K491Fx0fblk/l22xDarBWfeClLYQHFxNjEaA7VnWBi7lGePcAWQ/OzIkDwClWTJc5eaMobby+2tdVN/MKibB7TPgtjNl4fZEMlY8ByuCbLTopFFjZfrackqSrxTqG0ynlme7Fxtarh9CrKJzGuuk7o=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(14060799003)(36860700016)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sJoBEvfd1PswxSWM2AnxBoi6MoAxzKTaZNZf0EVyeQHzLsU/qwWtf9rxoA8qfl+al4gfYc0GiWXmEzXu+DNFYVp365IWV+LqzpreBVyHEty4jf91OYXLOL8PBiYEVjtNNhjfv86+Ek/MTdxiBufhWYSCWDe2nnlbg5SoqHVu2JMdL6Ec1HoeHKuQ1//iXzBpHICVebGDu0rDcFcw1S/NsdRQSIdrCAuxgDxtihIBX+fXPntIOLiCWopHtjcdHzxUHCJigl+HmzDTyzIOWSs1Jaq1DkQJAjUQo+l5wHBtYaE84RX5EOZTFjTUueq84IzbksHUspUSp3SUWftF5P7iV5wrYj8Z1MTNZvZoO/ftG/UxPRyKSro0amjN/ENrO3buKGLwO85enS7VwBmJcAWO7mvlNro6qyjqsZ7RHrsST60zBAcMn8FSulevfmkpJ9/e
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:55:19.6721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ff61c5-e292-4ca9-f08f-08deb0cd5c5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9600
X-purgate-ID: tlsNG-42698a/1778662525-19B68F3B-9C1380B4/0/0
X-purgate-type: clean
X-purgate-size: 9664
X-Rspamd-Queue-Id: 38B6553005B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

Hi Michal,

thanks for your review

>>=20
>> +static int __init
>> +domu_dt_v8r_el1_msa_parse(const struct dt_device_node *node,
>> +                          struct xen_domctl_createdomain *d_cfg,
>> +                          unsigned int flags)
>> +{
>> +    bool property_present =3D dt_property_read_bool(node, "v8r_el1_msa"=
);
> I know it's present in the code for SCI, but it's not really necessary to=
 do the
> DT parsing twice (once for boot, second for string given that
> dt_property_read_string returns -EINVAL if no property found).
>=20
> You could move this bool check ...
>=20
>> +
>> +    if ( !IS_ENABLED(CONFIG_MPU) )
>> +    {
>> +        d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_N=
ONE;
>> +
>> +        if ( !property_present )
> ... here.
>=20
>> +            return 0;
>> +
>> +        printk(XENLOG_ERR
>> +               "Not supported 'v8r_el1_msa' DT property found for domai=
n %s\n",
>> +               dt_node_full_name(node));
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( !property_present )
>> +        d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_P=
MSA;
>> +    else
>> +    {
>> +        const char *v8r_el1_msa;
>> +        int ret =3D dt_property_read_string(node, "v8r_el1_msa", &v8r_e=
l1_msa);
>> +
>> +        if ( ret )
>> +            return ret;
>> +
>> +        if ( !strcmp(v8r_el1_msa, "mpu") )
>> +            d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_M=
SA_PMSA;
>> +        else if ( !strcmp(v8r_el1_msa, "mmu") )
>> +            d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_M=
SA_VMSA;
>> +        else
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "v8r_el1_msa value (%s) not valid for domain %s\n",
>> +                   v8r_el1_msa, dt_node_full_name(node));
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    switch ( d_cfg->arch.v8r_el1_msa )
>> +    {
>> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
>> +        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "PMSA is not valid for domain (%s) without static al=
location and direct map (v8r_el1_msa)\n",
>> +                   dt_node_full_name(node));
>> +            return -EINVAL;
>> +        }
>> +        break;
>> +
>> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
>> +        if ( !has_v8r_vmsa_support() )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "Platform doesn't support VMSA at EL1 (v8r_el1_msa)\=
n");
>> +            return -EINVAL;
>> +        }
>> +        break;
>> +
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
> This does not look very clean. How about:
>=20
> static int __init
> domu_dt_v8r_el1_msa_parse(const struct dt_device_node *node,
>                          struct xen_domctl_createdomain *d_cfg,
>                          unsigned int flags)
> {
>    const char *value;
>    int ret;
>=20
>    if ( !IS_ENABLED(CONFIG_MPU) )
>    {
>        d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE=
;
>=20
>        if ( !dt_property_read_bool(node, "v8r_el1_msa") )
>            return 0;
>=20
>        printk(XENLOG_ERR
>               "v8r_el1_msa not supported on this build for domain %s\n",
>               dt_node_full_name(node));
>        return -EINVAL;
>    }
>=20
>    ret =3D dt_property_read_string(node, "v8r_el1_msa", &value);
>    /* property absent: PMSA is the default */
>    if ( ret =3D=3D -EINVAL )
>        value =3D "mpu";
>    else if ( ret )
>        return ret;
>=20
>    if ( !strcmp(value, "mpu") )
>    {
>        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
>        {
>            printk(XENLOG_ERR
>                   "v8r_el1_msa=3Dmpu requires static-mem and direct-map f=
or
> domain %s\n",
>                   dt_node_full_name(node));
>            return -EINVAL;
>        }
>        d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA=
;
>        return 0;
>    }
>=20
>    if ( !strcmp(value, "mmu") )
>    {
>        if ( !has_v8r_vmsa_support() )
>        {
>            printk(XENLOG_ERR
>                   "v8r_el1_msa=3Dmmu unsupported by platform for domain %=
s\n",
>                   dt_node_full_name(node));
>            return -EINVAL;
>        }
>        d_cfg->arch.v8r_el1_msa =3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA=
;
>        return 0;
>    }
>=20
>    printk(XENLOG_ERR "v8r_el1_msa value '%s' not valid for domain %s\n",
>           value, dt_node_full_name(node));
>    return -EINVAL;
> }

ack

>=20
>=20
>> +}
>> +
>> int __init arch_parse_dom0less_node(struct dt_device_node *node,
>>                                     struct boot_domain *bd)
>> {
>> @@ -315,6 +386,9 @@ int __init arch_parse_dom0less_node(struct dt_device=
_node *node,
>>     if ( domu_dt_sci_parse(node, d_cfg) )
>>         panic("Error getting SCI configuration\n");
>>=20
>> +    if ( domu_dt_v8r_el1_msa_parse(node, d_cfg, flags) )
>> +        panic("Error getting v8r_el1_msa configuration\n");
>> +
>>     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>>     {
>>         int vpl011_virq =3D GUEST_VPL011_SPI;
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 26380a807cad..e579c3b1bb3c 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -18,6 +18,7 @@
>> #include <asm/cpuerrata.h>
>> #include <asm/cpufeature.h>
>> #include <asm/current.h>
>> +#include <asm/domain_build.h>
> You don't seem to use anything from this header.

Yep my bad, leftover

>=20
>> #include <asm/event.h>
>> #include <asm/gic.h>
>> #include <asm/guest_atomics.h>
>> @@ -538,6 +539,24 @@ void vcpu_switch_to_aarch64_mode(struct vcpu *v)
>>     v->arch.hcr_el2 |=3D HCR_RW;
>> }
>>=20
>> +static bool v8r_el1_msa_domain_sanitise_config(
>> +    const struct xen_domctl_createdomain *config)
>> +{
>> +    uint8_t v8r_el1_msa =3D config->arch.v8r_el1_msa;
> That is not a useful assignment.

yeah it was only to shorten the line

>=20
>> +
>> +    if ( !IS_ENABLED(CONFIG_MPU) )
>> +        return v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NON=
E;
>> +
>> +    if ( IS_ENABLED(CONFIG_ARM_32) )
>> +        return v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMS=
A;
>> +
>> +    if ( IS_ENABLED(CONFIG_ARM_64) )
>> +        return (v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PM=
SA) ||
>> +               (v8r_el1_msa =3D=3D XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VM=
SA);
>> +
>> +    return false;
> Arm32 and Arm64 are mutually exclusive, so this line is unreachable.
> How about:
>  static bool v8r_el1_msa_domain_sanitise_config(
>      const struct xen_domctl_createdomain *config)
>  {
>      switch ( config->arch.v8r_el1_msa )
>      {
>      case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
>          return !IS_ENABLED(CONFIG_MPU);
>=20
>      case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
>          return IS_ENABLED(CONFIG_MPU);
>=20
>      case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
>          return IS_ENABLED(CONFIG_MPU) && IS_ENABLED(CONFIG_ARM_64);
>=20
>      default:
>          return false;
>      }
>  }

ack

>>=20
>> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/incl=
ude/asm/domain_build.h
>> index 6674dac5e2f8..13e88fc0891b 100644
>> --- a/xen/arch/arm/include/asm/domain_build.h
>> +++ b/xen/arch/arm/include/asm/domain_build.h
>> @@ -19,6 +19,16 @@ int prepare_acpi(struct domain *d, struct kernel_info=
 *kinfo);
>>=20
>> int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data=
);
>>=20
>> +#ifdef CONFIG_MPU
> You could do: && CONFIG_ARM64 and then ...
>=20
>> +/* Utility function to determine if an Armv8-R processor supports VMSA.=
 */
>> +bool has_v8r_vmsa_support(void);
>> +#else
>> +static inline bool has_v8r_vmsa_support(void)
>> +{
>> +    return false;
>> +}
>> +#endif /* CONFIG_MPU */
>> +
>> #endif
>>=20
>> /*
>> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
>> index a4673c351141..702bea804acd 100644
>> --- a/xen/arch/arm/mpu/arm32/mm.c
>> +++ b/xen/arch/arm/mpu/arm32/mm.c
>> @@ -5,6 +5,8 @@
>> #include <asm/mpu.h>
>> #include <asm/sysregs.h>
>> #include <asm/system.h>
>> +#include <public/arch-arm.h>
>> +#include <public/domctl.h>
> You don't seem to add anything from these headers.

Yep, leftover

>=20
>>=20
>> #define GENERATE_WRITE_PR_REG_CASE(num, pr)               \
>>     case num:                                             \
>> @@ -38,6 +40,11 @@
>>         break;                                            \
>>     }
>>=20
>> +bool has_v8r_vmsa_support(void)
>> +{
>> +    return false;
>> +}
> ... and then you could get rid of this stub

ack

>> +
>> /*
>>  * Armv8-R supports direct access and indirect access to the MPU regions=
 through
>>  * registers:
>> diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
>> index ed643cad4073..b8abcc6f7bc6 100644
>> --- a/xen/arch/arm/mpu/arm64/mm.c
>> +++ b/xen/arch/arm/mpu/arm64/mm.c
>> @@ -5,6 +5,8 @@
>> #include <asm/mpu.h>
>> #include <asm/sysregs.h>
>> #include <asm/system.h>
>> +#include <public/arch-arm.h>
>> +#include <public/domctl.h>
> You don't seem to add anything from these headers.

Yep, leftover

Will respin with the fixes soon.

Cheers,
Luca


