Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D0A6AA39
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922734.1326580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvI7L-0007ZD-3n; Thu, 20 Mar 2025 15:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922734.1326580; Thu, 20 Mar 2025 15:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvI7L-0007X8-00; Thu, 20 Mar 2025 15:47:35 +0000
Received: by outflank-mailman (input) for mailman id 922734;
 Thu, 20 Mar 2025 15:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tvI7J-0007X2-9G
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:47:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f403:2612::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a13f90bc-05a2-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:47:30 +0100 (CET)
Received: from DB7PR05CA0071.eurprd05.prod.outlook.com (2603:10a6:10:2e::48)
 by AS1PR08MB7635.eurprd08.prod.outlook.com (2603:10a6:20b:477::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 15:47:26 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::55) by DB7PR05CA0071.outlook.office365.com
 (2603:10a6:10:2e::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Thu,
 20 Mar 2025 15:47:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 15:47:25 +0000
Received: ("Tessian outbound 5b84e532c19a:v597");
 Thu, 20 Mar 2025 15:47:25 +0000
Received: from La2fba197511d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4A70B77-7245-479D-8761-D291F6056291.1; 
 Thu, 20 Mar 2025 15:47:19 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La2fba197511d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 15:47:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB8981.eurprd08.prod.outlook.com (2603:10a6:102:33e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 15:47:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 15:47:18 +0000
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
X-Inumbo-ID: a13f90bc-05a2-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pyJkBdQqQpYaivBVt/JWrDFY+PafNfOa8qsvAp5/rSrLo0hdoPlIdzZLJ2krRu/llts7nuxnNgTqOmS8Qk7jJNkPUyHpxmXHAieKJpbz30USkc9yUAGpuJh7GTgIEQYYqOIHmdycYG78Im2Z9kMCqhFJxEvlf1xBQvwxANcfSIuZJPHc3t4yAGoxthC4bi+n25Jn7/wPUw54i7Rg0wVmvYtYTGliNpmJP4GqDE7t4w1QqQRLpIy3ntsGE23Z4AWY4JdHCiU8FmtdZP6d3IKWLeQI31J9O8sB35ZLBEHBJaNz8qp6Hw5wVF8Dky/ZD68gv8nCf3Tbi4k46q+yjitjzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0asp5HKtCqIjHYXnZNGCsfkASyhMNVziDhYSD0OCn0=;
 b=ihRtKHxPEEqbo+qIm9jTWGJ2Zf6rsCiUITNHuz3eE01FIZ8cDnct4hDPMx24z23zlAtoyYXkD+4UO07iJ6ZcYV3elGNTk+1gM5nJ/nGApFC9p+izuZUUf3owuGMA4faDgERiO3HTMktax94zKRFqDiFW84PjhD1wu8JpBMUs0Ma4omcmsvCh2k2IREs1SLYnbseyJ2AG7454cDVPA6gACvn6NLTn+DQC4NfBAijsY63a9JswB730voG+Sp6tJROJxB5dbT7RO+ABG4pxMlwTIYRAipYON+CWYqkXFcjt1+Cm9mpY+FatPfLoPTAjHQh4Lj3JSkgRhj+7NK3mKAHL6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0asp5HKtCqIjHYXnZNGCsfkASyhMNVziDhYSD0OCn0=;
 b=S237NBkCZQvmr4/JoA624oetUUm45mvXmTYBzJSBte98qzrxvyrNLvyK3VXtxugvj+SVc9rW/f1YqotaNqXoOVKqN+sET87AljERfGNt8MkmKc6p6GTKirK4kv0EaNoReAtqVPZ9yKYPwE5a7kTFC264l1B7gnzH0c+LTUvR/DQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7f0593a868d38071
X-TessianGatewayMetadata: D/aJ975gpQkVHcV7OK4Ngp2wxGI7Ap+p31pmkPXWBzDuUTNl2AcZTxf/O6yOAxbmFUvrdg/lE0bZhenZqlFMJ8SMgTOYScpjkkz9x4ywd6PahjtBrhkKIR3SVLOIz7kdUmQN2dSEvXp+LG7mNQC6BDuQc3qz86deZNZwFP8I9O8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJ6n9+9t7en5zsLgjBSDAp3XSNUycucMCQ6vT/uSHLtV7e/XE9rgwCdTxpunOjV4CouY2urA2pJWTIJl5vRpkx0cwoXIkvnxNW0VV1jOOEO+dYfeP3uu4UO02f5LULkL32ssW8IXtlYRWBhHBisRVFl5dKejeJei18o2OojGuMVwnQL8L/YIeNAFymG4hQ6fo25KZB2mj4yezMTOJBMx/Zk5mcJzTSue+0NhqLegPzvxZx+fFTnSX9SX6Pgr38ZfxWz9BBO6pZCCWVaOT6YHIuGP+fWV7Qc2cgTvNcy2n2NwX/s63HJVjPwDthM5oH0PFYy6RyBBjdBAYNh2lM0F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0asp5HKtCqIjHYXnZNGCsfkASyhMNVziDhYSD0OCn0=;
 b=aCqxfvMAUpWBr30KgSzJC+G8weMVR2hZhaMJ5yDGnKxLNCOgBZ3h1B4MLkqnk06BWEjXaUOLAncxkvFOryYE6u9aMN9JbTq9tuxX+c/lPX65R3VK2lPZ6WBOgnYB1XE6oEm/SYy0Zxn3EgdNW6iPwobAUM+cTULDJJ3dGFicTHcn3mdjtlQgLT++LpBOka3krGwsQH6LwKV+Ecm5Wm+zZHQaZ+rAlpyW8fF6KlzuBCNRIZkPFiB4DNni+bxhmqepzyQOUqHYu1Z3D1bIqBsF0NaPrsuA4/cftgLtq6dkjNIFak6QqBWUSbp4mS8Ne5FfEStwKy+gIKr3Co6c13cZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0asp5HKtCqIjHYXnZNGCsfkASyhMNVziDhYSD0OCn0=;
 b=S237NBkCZQvmr4/JoA624oetUUm45mvXmTYBzJSBte98qzrxvyrNLvyK3VXtxugvj+SVc9rW/f1YqotaNqXoOVKqN+sET87AljERfGNt8MkmKc6p6GTKirK4kv0EaNoReAtqVPZ9yKYPwE5a7kTFC264l1B7gnzH0c+LTUvR/DQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v2 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbkcvnxcOyM/RSC0GESnnv40poW7N8IsKAgAAYUYA=
Date: Thu, 20 Mar 2025 15:47:17 +0000
Message-ID: <794A37F9-9F8A-45D3-9D27-D2C536BADC4F@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <75ffd7378e75fb1a07584c1b178600bbfb348425.1741617888.git.bertrand.marquis@arm.com>
 <CAHUa44FhHz25oHB6bv+NJrf+21N-8HFvMW7JR04NM9JkpKLabg@mail.gmail.com>
In-Reply-To:
 <CAHUa44FhHz25oHB6bv+NJrf+21N-8HFvMW7JR04NM9JkpKLabg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB8981:EE_|DB1PEPF00039233:EE_|AS1PR08MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e17f1b-e668-4e66-4b96-08dd67c6833a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NkFCVXUrS3VCZkpyaGhpZTlUSmRsOGpWd29TVVM5a2JmcmIvVGxsUzBYbWVH?=
 =?utf-8?B?R29NdlEzbkhOWVVjdzdLYytORjFrK0JUYU9jWDA3SktwcmNYY0M1SE5BTm4y?=
 =?utf-8?B?WDMrZHh1dDkxTkswMzdidXNTclFnQ2h0clRXbUFmUVJFU3pBazhPc1BzREpR?=
 =?utf-8?B?b05JdkNOaENNWTk3SDR1czU0MjBhVm1PeEd1ak00TFJOeXlmaXhxRlVJd05H?=
 =?utf-8?B?UktnVWM5NlVjWHRoRlVrK2cveW0yRGxva1FwOXl4UlhoUWhFSWhpS2dpWEZS?=
 =?utf-8?B?aDU2aHJoZzVjZEVvZHBMdWtwS0dXV0ozbWYrY0VjeiswWjZqL0Y5MHNoczBE?=
 =?utf-8?B?eVFjbFErTXg5N0ZteVFyZXBXMHFraVpHblc4cUNRSFUwQnc0MVFHalAzTnNT?=
 =?utf-8?B?bEI5MjlVR2xEcmw5SHQzVHl2OTNmZUNFc2lad2hneGJoMFNhQVE1bzAzenA5?=
 =?utf-8?B?NENPR0F1Nmk2WXdqNlA3MW1IZWxySEVKbFkyWHd3ZVpxMFg5R1BRUm9vSFRi?=
 =?utf-8?B?cG1uZE5JdlZtdEJIT3B6WllxQ0h6UjZsanFKZDNJaE4wZTFEemtIM1dzWG5N?=
 =?utf-8?B?VUdXUk9ZSHRSNFdqMUFjLzdkSnUyNUJia3FnWmh3RUFGUUd2Tjh5cm90WEti?=
 =?utf-8?B?VzEvMGVWSEJ6NXRPUUM1ZU5KY1hQLzN0YXVKYUlWenpRa3NyRE1VSXROdy8w?=
 =?utf-8?B?bVlYbk1WZ3pMZmlYTC94MndOQlBWdXdQS2Fmd3lnMXRJTDlvc2g1T0FiV1cx?=
 =?utf-8?B?b29zb1JiVTNHUlFSVURuWVZ3STZqVUVJYjJFRllvVSsxZ1pVZXdSbUk5Y3c2?=
 =?utf-8?B?bllTRUpmOFk3RWFtdisyb0dEZ0tXWXJIVHBGdlNjYTFpa2g2bW1pNnB3amg3?=
 =?utf-8?B?Y21QakFkenZoUlpBTUlqWVB1cE52OHZtK3l3VUZqeS82dVl6MWtXWEIxRjY0?=
 =?utf-8?B?d1ZneDFyb0pYWEpnM2pIcjhLSkhJcG15SHUvdW10emNUQUFscmkvYmNyZ1pl?=
 =?utf-8?B?WXNvQkRUTHNJcCtEU1RsOHRDZnd2YWQrY1VrUm9xOWNRWUpIQzU1K2Zla084?=
 =?utf-8?B?RmttU2JTT1JjVDUwenA0eVRKcnJZdzgzYjJKY1g3aGk4TTNTWVhtMUQ3Mjlq?=
 =?utf-8?B?RkpHZ29sVFU4Q1BVOEgxMVRvOXpnTXVpTFhGd0hLNDlTQkV6S0RMSTIvWFUy?=
 =?utf-8?B?RkYxV054SjFIRWprRVJROGtKR29WMDFJZThwRVF1VUhkRUhnamxZUHJBOTJ4?=
 =?utf-8?B?Sk40aWdKbFp6YXE1bm1ETXNFczZ2a29rR0t1VFNlMFVBMUExVUtxNE41VG15?=
 =?utf-8?B?U3ZoVTY5WGx3ZWlvVkNwS2VTS1laa1o0b0dBMUVDSlRoYnRjNTQzTEZ0UndS?=
 =?utf-8?B?VVJjZmo4ZFpqK1EwR1JnNXh4eTV4ZEVMZXJhdnRCdjY2SGFrSUxaT2hIUGdW?=
 =?utf-8?B?dmtiTjE4a25GSGNhcFhtc25iWXlDenlNV0xNV0Y5TjBRWlBlRFNNeUs1bmt1?=
 =?utf-8?B?TGFkaU00Qm5lYTRweW1rVWVFMDNTbGprSjdsWjFHZkVJRkh2ajY4bStPelB3?=
 =?utf-8?B?cWlCZUlBNi9RUVlFYWpsQUtyNi9zWEVXdFpZUFBIdjV2a3ovUVRuOGpRbFkx?=
 =?utf-8?B?SEo4cTJOajBvQ2szcU5LdnROblR6TTl6UEJjMFRiWmRHLzJlY3JmN3Qvd1FB?=
 =?utf-8?B?ckw4QkZlaC9SL3hZaXJHaTV4dWdtUExOV21WVHNRRURuRWlEL2o1dnJxdGpF?=
 =?utf-8?B?ZU5xMzdVYXEvWXozd0JlM3hyRHBDWTdtUFFadmpHK2hscU9oSm5iZjJUazJ5?=
 =?utf-8?B?OUdUOUdiMXN3cjRzWVk5QkdRYWZqRExiT2RWMjNTeEZjVjltREhOeGFIMFhR?=
 =?utf-8?B?K0RWbUxscUkyYjJIR3Z3Wlp0dmkvYTZZNjNKZWpvNUtHaktTVjJVQk5iZVB1?=
 =?utf-8?Q?Ree02iPtvU+CemM3LnoWsC1yIwdwjN9i?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA4EBE32A6233F41AA327631B8C8B54C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5644bf90-f2a0-4516-0cb6-08dd67c67e7c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTFtbjdDWEVXYmtJK1czTVVVb3Y4d1JFVURyRnJCVTltS1hXZWhUd1lrSllk?=
 =?utf-8?B?ZFJiTGNHaUo5bEdHekI1dnF4d0h0a01XdDVKb0JGZ0VZVUdGVW56aVYxNHBa?=
 =?utf-8?B?VFZWaVVrOEgzczI5ajBuWCt3Q0t2V1dOM1hlZDJ3bW53Y2htT3lUUThsRkNk?=
 =?utf-8?B?T3R4cEdnVXBEUi9GcEI2OTZlV1FkaWZrYnB2RUNpbi8zMTVSRW1GWnlXOEtM?=
 =?utf-8?B?Y1lwYnREbEYxU1R0Ym95dzNsR2RhNUpPVldiOUVlbzdmd1lBRjVkeUVkSzRT?=
 =?utf-8?B?MjdsQ1FsdFVPWGpEK0s5TlNudEJETkVXOHNkOXdMNzM4Y2x6cjZSdVMyYy9k?=
 =?utf-8?B?dFhYTWR2YTFaNzN5ZU9uS0hOMkFIZGtpN3p2VSttK0djL3RHNldiT3VwN0FH?=
 =?utf-8?B?YTFuaUdYS3RNc2gzSTMxRTdpVHlCUXZoVEJqTVZFemt1Z2hTelByWmNFRFFo?=
 =?utf-8?B?TGxBNmNmYnNmOGlMWDlaK1c4b3RCZktCK05HODVSNk5tUTZXOUtsQUFDaU8r?=
 =?utf-8?B?RzZPL0ZGYjZQYkg1NjJDREExVStFbS9GTWJuMk04U201QzZoUktMVE1uM2p4?=
 =?utf-8?B?RzlOVmxwMWc0anNqZ2JXdUk2SWRZNUFNa2ZuMTYvMVFITmlTQ2hUZHMrc1Vy?=
 =?utf-8?B?Z0pDbTNOdWROY2VjRFJ5dzcyVHhteFljWUpvNHZvcHRTYk50N0QzTldsQjdI?=
 =?utf-8?B?bWNJcTVveWp6VCswSVNFS0E2VkZ3VlRzUDh1b2xsNnVxNGpvNmNYN3hWYzVo?=
 =?utf-8?B?SXl2M2Q3ak1qMDFQTXpyeDFyWFo1SitlT1BXV3I0NXBDQkQxM0g4dzlUMTZy?=
 =?utf-8?B?L25QYldVdWNlR1F2UW9ldERVSnk4aHVyTVBTUHJsT3BLcmRJVVlPZDl1VEJx?=
 =?utf-8?B?RGZMRG9qMEZ2aTFiSXQ3V2FGRURuc1FiWTdNTm9zZXVXMzc2UnF1MUN5K0hv?=
 =?utf-8?B?RlpDZlg1RGdXa2h5YnB5akFXbEtsSTdBSEFTSnpKWFhZVW5xYWx4T3JTUk5L?=
 =?utf-8?B?UmpDYjFDRWF0ZS9uWkhoVkN3Qk1wSHNsVk5iQnd3M296eFg1d1oxRW9sK3Z3?=
 =?utf-8?B?UElpMEhFOTR1NlJ2SHh4WFJMcXRYcU9Jd1Z3VVphVTlrUFkzTDV2VG1DdVc3?=
 =?utf-8?B?RDFNV0pSQ0ZlNmcydjdYejFSQVg4bW96ZFo1YUd3UnFYWEpCOWdmSCthUnpx?=
 =?utf-8?B?Z0FCK3pxL3RyODFIOGdFN2pGSlZoL28xTHZ5b2pBMjREa3J5RTA5dWJ4LzN5?=
 =?utf-8?B?cXdHZ0V4UW5ybnk3b3pIUVVwLzB3WFppRzU2RjluY0VMQmp5Q3d1NTN3V3RN?=
 =?utf-8?B?R0RNeExxT29PRUZWZFJEQXA0TkVjM081MkEyWThXdjdLbjJRdmNuUlRlMkRh?=
 =?utf-8?B?VTFWcDJoYWtBa1d0Z1l1bzBQdmo3bjZ1OElQeXEyZ25FempXS3ZYaXZrU25W?=
 =?utf-8?B?eEllcGo0VnREaEJEaVo2Ykc1Ti9sZE5WQ3ZyWTloaWpmcVNTam9LWE42QVQy?=
 =?utf-8?B?Q3I0UHd5YkN3ZFFiaUtycXUxblNZSWV1c25vZmlwc1ZpVE9Pd1laZWpNVjY1?=
 =?utf-8?B?UEdTVnB1SGtaVHhNNlJKR2kvcGhxRTYwOFVERjdFT3p2cm05bFpJdjgrWjdy?=
 =?utf-8?B?RUNqWk1lUElEZzNaeXpmUFc3WndLRkJSczJBR0JST0diUzJPRGVxOGd0aytI?=
 =?utf-8?B?Yk44VFpqc2N1V1FkVm8xRC9Sb2gvR1ZvcU9nR2xkOEo0U1RvNXN4a0c3OVRz?=
 =?utf-8?B?MVpETWNXY25VNXNPbkdrZTB0SWZHNFcwcjF0Uld5OWp0ZTRXVXlpQkh3eUhv?=
 =?utf-8?B?TzZ6bHRHNXJWeVl6MlNVR2tTZlZDalhSdXFETldwZWtyU1JSeTMwVTF0dXNU?=
 =?utf-8?B?VmZzSTdmeDlGcjlBcXhsOS9lS25iMSs1U3lDY25oR1ZISlNRbnIrdktRSzdr?=
 =?utf-8?B?d1FOM3JWZlZRbklBbngxbVM0OGIzRW43MDQ4ak83TWNsRzhGaVE4Mm9DbzJq?=
 =?utf-8?Q?QP0bgpJtGg2fd1o1puMytaicTFCHGs=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 15:47:25.8830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e17f1b-e668-4e66-4b96-08dd67c6833a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7635

SGkgSmVucywNCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KDQo+IE9uIDIwIE1hciAy
MDI1LCBhdCAxNToyMCwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+
IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0KPiBPbiBNb24sIE1hciAxMCwgMjAyNSBh
dCAzOjUx4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29t
PiB3cm90ZToNCj4+IA0KPj4gQ3JlYXRlIGEgQ09ORklHX0ZGQV9WTV9UT19WTSBwYXJhbWV0ZXIg
dG8gYWN0aXZhdGUgRkZBIGNvbW11bmljYXRpb24NCj4+IGJldHdlZW4gVk1zLg0KPj4gV2hlbiBh
Y3RpdmF0ZWQgbGlzdCBWTXMgaW4gdGhlIHN5c3RlbSB3aXRoIEZGLUEgc3VwcG9ydCBpbiBwYXJ0
X2luZm9fZ2V0Lg0KPj4gDQo+PiBXQVJOSU5HOiBUaGVyZSBpcyBubyBmaWx0ZXJpbmcgZm9yIG5v
dyBhbmQgYWxsIFZNcyBhcmUgbGlzdGVkICEhDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRy
YW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdl
cyBpbiB2MjoNCj4+IC0gU3dpdGNoIGlmZGVmIHRvIElTX0VOQUJMRUQNCj4+IC0gZG9tIHdhcyBu
b3Qgc3dpdGNoZWQgdG8gZCBhcyByZXF1ZXN0ZWQgYnkgSmFuIGJlY2F1c2UgdGhlcmUgaXMgYWxy
ZWFkeQ0KPj4gIGEgdmFyaWFibGUgZCBwb2ludGluZyB0byB0aGUgY3VycmVudCBkb21haW4gYW5k
IGl0IG11c3Qgbm90IGJlDQo+PiAgc2hhZG93ZWQuDQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90
ZWUvS2NvbmZpZyAgICAgICAgfCAgMTEgKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wYXJ0
aW5mby5jIHwgMTQ0ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+PiB4ZW4vYXJj
aC9hcm0vdGVlL2ZmYV9wcml2YXRlLmggIHwgIDEyICsrKw0KPj4gMyBmaWxlcyBjaGFuZ2VkLCAx
MzcgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcNCj4+IGlu
ZGV4IGM1YjBmODhkNzUyMi4uODhhNGM0Yzk5MTU0IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gv
YXJtL3RlZS9LY29uZmlnDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL0tjb25maWcNCj4+IEBA
IC0yOCw1ICsyOCwxNiBAQCBjb25maWcgRkZBDQo+PiANCj4+ICAgICAgICAgIFsxXSBodHRwczov
L2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGVuMDA3Ny9sYXRlc3QNCj4+IA0KPj4g
K2NvbmZpZyBGRkFfVk1fVE9fVk0NCj4+ICsgICAgYm9vbCAiRW5hYmxlIEZGLUEgYmV0d2VlbiBW
TXMgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4+ICsgICAgZGVmYXVsdCBuDQo+PiAr
ICAgIGRlcGVuZHMgb24gRkZBDQo+PiArICAgIGhlbHANCj4+ICsgICAgICBUaGlzIG9wdGlvbiBl
bmFibGVzIHRvIHVzZSBGRi1BIGJldHdlZW4gVk1zLg0KPj4gKyAgICAgIFRoaXMgaXMgZXhwZXJp
bWVudGFsIGFuZCB0aGVyZSBpcyBubyBhY2Nlc3MgY29udHJvbCBzbyBhbnkNCj4+ICsgICAgICBn
dWVzdCBjYW4gY29tbXVuaWNhdGUgd2l0aCBhbnkgb3RoZXIgZ3Vlc3QuDQo+PiArDQo+PiArICAg
ICAgSWYgdW5zdXJlLCBzYXkgTi4NCj4+ICsNCj4+IGVuZG1lbnUNCj4+IA0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9wYXJ0aW5mby5jDQo+PiBpbmRleCBjMDUxMGNlYjgzMzguLjdhZjFlY2EyZDBjNCAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMNCj4+IEBAIC03Nyw3ICs3NywyMyBAQCB2b2lkIGZm
YV9oYW5kbGVfcGFydGl0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0K
Pj4gICAgIH07DQo+PiAgICAgdWludDMyX3Qgc3JjX3NpemUsIGRzdF9zaXplOw0KPj4gICAgIHZv
aWQgKmRzdF9idWY7DQo+PiAtICAgIHVpbnQzMl90IGZmYV9zcF9jb3VudCA9IDA7DQo+PiArICAg
IHVpbnQzMl90IGZmYV92bV9jb3VudCA9IDAsIGZmYV9zcF9jb3VudCA9IDA7DQo+PiArDQo+IA0K
PiBUaGlzIGZ1bmN0aW9uIGlzIGdldHRpbmcgcXVpdGUgbGFyZ2UgYW5kIGl0J3MgaGFyZCB0byBm
b2xsb3cgdGhlDQo+IGRpZmZlcmVudCBsb2NrIHN0YXRlcy4gSG93IGFib3V0IHNwbGl0dGluZyBp
dCBpbnRvIHZhcmlvdXMgaGVscGVyDQo+IGZ1bmN0aW9ucz8NCg0KWWVzIEkgYWdyZWUuDQpJIHdp
bGwgdHJ5IHRvIGZpbmQgYSBnb29kIHdheSB0byBzcGxpdCB0aGlzIGluIHNtYWxsZXIgY2h1bmtz
Lg0KDQo+IA0KPj4gKyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkb207DQo+PiArDQo+PiArICAg
ICAgICAvKiBDb3VudCB0aGUgbnVtYmVyIG9mIFZNIHdpdGggRkYtQSBzdXBwb3J0ICovDQo+IA0K
PiBXaHkgZG8gd2UgbmVlZCB0aGlzIG5vdz8gSXNuJ3QgaXQgZW5vdWdoIHRvIGNvdW50IHRoZW0g
YmVsb3cgd2hlbiB3ZQ0KPiBmaWxsIGluIGRzdF9idWY/DQoNCldlIG5lZWQgaXQgaW4gMyBwbGFj
ZXMgaW4gdGhlIGNvZGUgYWZ0ZXI6DQotIHRvIHJldHVybiB0aGUgbnVtYmVyIG9mIGVuZHBvaW50
IGluIGNhc2UgdGhlIGZsYWcgaXMgc2V0IChzZWUgZmluYWwgcmV0dXJuKQ0KLSB0byBjaGVjayB0
aGF0IHRoZXJlIGlzIGVub3VnaCBzcGFjZSBpbiB0aGUgUlggYnVmZmVyDQotIHRvIHByZXZlbnQg
Z29pbmcgdGhyb3VnaCB0aGUgbGlzdCBvZiBkb21haW5zIGlmIG5vbmUgaXMgdG8gYmUgbGlzdGVk
IGFueXdheQ0KDQo+IA0KPj4gKyAgICAgICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xv
Y2spOw0KPj4gKyAgICAgICAgZm9yX2VhY2hfZG9tYWluKCBkb20gKQ0KPj4gKyAgICAgICAgew0K
Pj4gKyAgICAgICAgICAgIHN0cnVjdCBmZmFfY3R4ICp2bSA9IGRvbS0+YXJjaC50ZWU7DQo+PiAr
DQo+PiArICAgICAgICAgICAgaWYgKGRvbSAhPSBkICYmIHZtICE9IE5VTEwgJiYgdm0tPmd1ZXN0
X3ZlcnMgIT0gMCkNCj4+ICsgICAgICAgICAgICAgICAgZmZhX3ZtX2NvdW50Kys7DQo+PiArICAg
ICAgICB9DQo+PiArICAgICAgICByY3VfcmVhZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsN
Cj4+ICsgICAgfQ0KPj4gDQo+PiAgICAgLyoNCj4+ICAgICAgKiBJZiB0aGUgZ3Vlc3QgaXMgdjEu
MCwgaGUgZG9lcyBub3QgZ2V0IGJhY2sgdGhlIGVudHJ5IHNpemUgc28gd2UgbXVzdA0KPj4gQEAg
LTEyNywzMyArMTQzLDM4IEBAIHZvaWQgZmZhX2hhbmRsZV9wYXJ0aXRpb25faW5mb19nZXQoc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiANCj4+ICAgICBkc3RfYnVmID0gY3R4LT5yeDsN
Cj4+IA0KPj4gLSAgICBpZiAoICFmZmFfcnggKQ0KPj4gKyAgICAvKiBJZiBub3Qgc3VwcG9ydGVk
LCB3ZSBoYXZlIGZmYV9zcF9jb3VudD0wICovDQo+PiArICAgIGlmICggZmZhX2Z3X3N1cHBvcnRz
X2ZpZChGRkFfUEFSVElUSU9OX0lORk9fR0VUKSApDQo+PiAgICAgew0KPj4gLSAgICAgICAgcmV0
ID0gRkZBX1JFVF9ERU5JRUQ7DQo+PiAtICAgICAgICBnb3RvIG91dF9yeF9yZWxlYXNlOw0KPj4g
LSAgICB9DQo+PiArICAgICAgICBpZiAoICFmZmFfcnggKQ0KPj4gKyAgICAgICAgew0KPj4gKyAg
ICAgICAgICAgIHJldCA9IEZGQV9SRVRfREVOSUVEOw0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0
X3J4X3JlbGVhc2U7DQo+PiArICAgICAgICB9DQo+PiANCj4+IC0gICAgc3Bpbl9sb2NrKCZmZmFf
cnhfYnVmZmVyX2xvY2spOw0KPj4gKyAgICAgICAgc3Bpbl9sb2NrKCZmZmFfcnhfYnVmZmVyX2xv
Y2spOw0KPj4gDQo+PiAtICAgIHJldCA9IGZmYV9wYXJ0aXRpb25faW5mb19nZXQodXVpZCwgMCwg
JmZmYV9zcF9jb3VudCwgJnNyY19zaXplKTsNCj4+ICsgICAgICAgIHJldCA9IGZmYV9wYXJ0aXRp
b25faW5mb19nZXQodXVpZCwgMCwgJmZmYV9zcF9jb3VudCwgJnNyY19zaXplKTsNCj4+IA0KPj4g
LSAgICBpZiAoIHJldCApDQo+PiAtICAgICAgICBnb3RvIG91dF9yeF9oeXBfdW5sb2NrOw0KPj4g
KyAgICAgICAgaWYgKCByZXQgKQ0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0X3J4X2h5cF91bmxv
Y2s7DQo+PiANCj4+IC0gICAgLyoNCj4+IC0gICAgICogZmZhX3BhcnRpdGlvbl9pbmZvX2dldCgp
IHN1Y2NlZWRlZCBzbyB3ZSBub3cgb3duIHRoZSBSWCBidWZmZXIgd2UNCj4+IC0gICAgICogc2hh
cmUgd2l0aCB0aGUgU1BNQy4gV2UgbXVzdCBnaXZlIGl0IGJhY2sgdXNpbmcgZmZhX2h5cF9yeF9y
ZWxlYXNlKCkNCj4+IC0gICAgICogb25jZSB3ZSd2ZSBjb3BpZWQgdGhlIGNvbnRlbnQuDQo+PiAt
ICAgICAqLw0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIGZmYV9wYXJ0aXRpb25faW5m
b19nZXQoKSBzdWNjZWVkZWQgc28gd2Ugbm93IG93biB0aGUgUlggYnVmZmVyIHdlDQo+PiArICAg
ICAgICAgKiBzaGFyZSB3aXRoIHRoZSBTUE1DLiBXZSBtdXN0IGdpdmUgaXQgYmFjayB1c2luZyBm
ZmFfaHlwX3J4X3JlbGVhc2UoKQ0KPj4gKyAgICAgICAgICogb25jZSB3ZSd2ZSBjb3BpZWQgdGhl
IGNvbnRlbnQuDQo+PiArICAgICAgICAgKi8NCj4+IA0KPj4gLSAgICAvKiB3ZSBjYW5ub3QgaGF2
ZSBhIHNpemUgc21hbGxlciB0aGFuIDEuMCBzdHJ1Y3R1cmUgKi8NCj4+IC0gICAgaWYgKCBzcmNf
c2l6ZSA8IHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRpdGlvbl9pbmZvXzFfMCkgKQ0KPj4gLSAgICB7
DQo+PiAtICAgICAgICByZXQgPSBGRkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+PiAtICAgICAgICBn
b3RvIG91dF9yeF9oeXBfcmVsZWFzZTsNCj4+ICsgICAgICAgIC8qIHdlIGNhbm5vdCBoYXZlIGEg
c2l6ZSBzbWFsbGVyIHRoYW4gMS4wIHN0cnVjdHVyZSAqLw0KPj4gKyAgICAgICAgaWYgKCBzcmNf
c2l6ZSA8IHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRpdGlvbl9pbmZvXzFfMCkgKQ0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IEZGQV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+ICsg
ICAgICAgICAgICBnb3RvIG91dF9yeF9oeXBfcmVsZWFzZTsNCj4+ICsgICAgICAgIH0NCj4+ICAg
ICB9DQo+PiANCj4+IC0gICAgaWYgKCBjdHgtPnBhZ2VfY291bnQgKiBGRkFfUEFHRV9TSVpFIDwg
ZmZhX3NwX2NvdW50ICogZHN0X3NpemUgKQ0KPj4gKyAgICBpZiAoIGN0eC0+cGFnZV9jb3VudCAq
IEZGQV9QQUdFX1NJWkUgPA0KPj4gKyAgICAgICAgIChmZmFfc3BfY291bnQgKyBmZmFfdm1fY291
bnQpICogZHN0X3NpemUgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgcmV0ID0gRkZBX1JFVF9OT19N
RU1PUlk7DQo+PiAgICAgICAgIGdvdG8gb3V0X3J4X2h5cF9yZWxlYXNlOw0KPj4gQEAgLTE4Miwy
NSArMjAzLDg4IEBAIHZvaWQgZmZhX2hhbmRsZV9wYXJ0aXRpb25faW5mb19nZXQoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIH0NCj4+ICAgICB9DQo+PiANCj4+ICsgICAg
aWYgKCBmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9QQVJUSVRJT05fSU5GT19HRVQpICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgZmZhX2h5cF9yeF9yZWxlYXNlKCk7DQo+PiArICAgICAgICBzcGlu
X3VubG9jaygmZmZhX3J4X2J1ZmZlcl9sb2NrKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBp
ZiAoIElTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYgZmZhX3ZtX2NvdW50ICkNCj4+
ICsgICAgew0KPj4gKyAgICAgICAgc3RydWN0IGRvbWFpbiAqZG9tOw0KPj4gKyAgICAgICAgdWlu
dDMyX3QgY3VyciA9IDA7DQo+PiArDQo+PiArICAgICAgICAvKiBhZGQgdGhlIFZNIGluZm9ybWF0
aW9ucyBpZiBhbnkgKi8NCj4+ICsgICAgICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9s
b2NrKTsNCj4+ICsgICAgICAgIGZvcl9lYWNoX2RvbWFpbiggZG9tICkNCj4+ICsgICAgICAgIHsN
Cj4+ICsgICAgICAgICAgICBzdHJ1Y3QgZmZhX2N0eCAqdm0gPSBkb20tPmFyY2gudGVlOw0KPj4g
Kw0KPj4gKyAgICAgICAgICAgIC8qDQo+PiArICAgICAgICAgICAgICogd2UgZG8gbm90IGFkZCB0
aGUgVk0gY2FsbGluZyB0byB0aGUgbGlzdCBhbmQgb25seSBWTXMgd2l0aA0KPj4gKyAgICAgICAg
ICAgICAqIEZGLUEgc3VwcG9ydA0KPj4gKyAgICAgICAgICAgICAqLw0KPj4gKyAgICAgICAgICAg
IGlmIChkb20gIT0gZCAmJiB2bSAhPSBOVUxMICYmIHZtLT5ndWVzdF92ZXJzICE9IDApDQo+PiAr
ICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAg
ICAgKiBXZSBkbyBub3QgaGF2ZSBVVUlEIGluZm8gZm9yIFZNcyBzbyB1c2UNCj4+ICsgICAgICAg
ICAgICAgICAgICogdGhlIDEuMCBzdHJ1Y3R1cmUgc28gdGhhdCB3ZSBzZXQgVVVJRHMgdG8NCj4+
ICsgICAgICAgICAgICAgICAgICogemVybyB1c2luZyBtZW1zZXQNCj4+ICsgICAgICAgICAgICAg
ICAgICovDQo+PiArICAgICAgICAgICAgICAgIHN0cnVjdCBmZmFfcGFydGl0aW9uX2luZm9fMV8w
IHNyY3ZtOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgICBpZiAoIGN1cnIgPT0gZmZhX3ZtX2Nv
dW50ICkNCj4+ICsgICAgICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgLyoN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAqIFRoZSBudW1iZXIgb2YgZG9tYWlucyBjaGFuZ2Vk
IHNpbmNlIHdlIGNvdW50ZWQgdGhlbSwgd2UNCj4+ICsgICAgICAgICAgICAgICAgICAgICAqIGNh
biBhZGQgbmV3IG9uZXMgaWYgdGhlcmUgaXMgZW5vdWdoIHNwYWNlIGluIHRoZQ0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICogZGVzdGluYXRpb24gYnVmZmVyIHNvIGNoZWNrIGl0IG9yIGdvIG91
dCB3aXRoIGFuIGVycm9yLg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICovDQo+IA0KPiBXaHkg
ZG8gd2UgY2FyZSBpZiB0aGUgbnVtYmVyIGhhcyBjaGFuZ2VkPyBJZiBpdCBmaXRzLCBhbGwgaXMg
Z29vZA0KPiBhbnl3YXkgYW5kIHdlJ3JlIGFsc28gdXBkYXRpbmcgZmZhX3ZtX2NvdW50IHdpdGgg
Y3VyciBhZnRlciB0aGUgbG9vcC4NCg0KV2VsbCB0aGlzIGlzIGV4YWN0bHkgdGhlIHBvaW50IGhl
cmUsIHdlIGNoZWNrIGlmIHdlIGhhdmUgZW5vdWdoIHNwYWNlIHRvDQpyZXR1cm4gdGhlIGRhdGEg
d2l0aCB0aGUgbmV3IGRvbWFpbnMgYW5kIGlmIG5vdCB3ZSByZXR1cm4gYW4gZXJyb3IuDQoNClRo
ZSBwb2ludCBoZXJlIGlzIHRvIG1ha2Ugc3VyZSB0aGF0IGlmIHRoZXJlIGFyZSBtb3JlIGRvbWFp
bnMgdGhhbiB3aGVuDQp3ZSBjb3VudGVkIGZpcnN0IHdlIGNoZWNrIHRoYXQgd2UgaGF2ZSBlbm91
Z2ggc2l6ZSBhbmQgdGhlIHVwZGF0ZSBhdCB0aGUNCmVuZCBpcyB0byBoYW5kbGUgdGhlIGNhc2Ug
d2hlcmUgd2UgaGF2ZSBhY3R1YWxseSBsZXNzIGRvbWFpbnMgdGhhbiB3aGVuDQp3ZSBjb3VudGVk
IGZpcnN0Lg0KDQpJZiB0aGUgbnVtYmVyIGhhcyBjaGFuZ2VkIHdlIG9ubHkgY2FyZSBiZWNhdXNl
IHdlIG5lZWQgdG8gbWFrZSBzdXJlDQp3ZSBoYXZlIGVub3VnaCBzcGFjZSBhbmQgYmVjYXVzZSB3
ZSBuZWVkIHRvIHJldHVybiB0aGUgcmlnaHQgbnVtYmVyDQp0byB0aGUgY2FsbGVyLg0KDQpQbGVh
c2UgdGVsbCBtZSBob3cgeW91IHdvdWxkIGxpa2UgbWUgdG8gY2hhbmdlIHRoaXMgYmVjYXVzZSBJ
IGRvIG5vdA0KdW5kZXJzdGFuZCB3aGF0IEkgc2hvdWxkIG1vZGlmeSBoZXJlLg0KDQpDaGVlcnMN
CkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+ICsgICAgICAgICAgICAg
ICAgICAgIGZmYV92bV9jb3VudCsrOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgaWYgKCBjdHgt
PnBhZ2VfY291bnQgKiBGRkFfUEFHRV9TSVpFIDwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgKGZmYV9zcF9jb3VudCArIGZmYV92bV9jb3VudCkgKiBkc3Rfc2l6ZSApDQo+PiArICAgICAg
ICAgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gRkZBX1JF
VF9OT19NRU1PUlk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgcmN1X3JlYWRfdW5sb2Nr
KCZkb21saXN0X3JlYWRfbG9jayk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXRfcnhfcmVsZWFzZTsNCj4+ICsgICAgICAgICAgICAgICAgICAgIH0NCj4+ICsgICAgICAgICAg
ICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgICBzcmN2bS5pZCA9IGZmYV9nZXRfdm1f
aWQoZG9tKTsNCj4+ICsgICAgICAgICAgICAgICAgc3Jjdm0uZXhlY3V0aW9uX2NvbnRleHQgPSBk
b20tPm1heF92Y3B1czsNCj4+ICsgICAgICAgICAgICAgICAgc3Jjdm0ucGFydGl0aW9uX3Byb3Bl
cnRpZXMgPSBGRkFfUEFSVF9WTV9QUk9QOw0KPj4gKyAgICAgICAgICAgICAgICBpZiAoIGlzXzY0
Yml0X2RvbWFpbihkb20pICkNCj4+ICsgICAgICAgICAgICAgICAgICAgIHNyY3ZtLnBhcnRpdGlv
bl9wcm9wZXJ0aWVzIHw9IEZGQV9QQVJUX1BST1BfQUFSQ0g2NF9TVEFURTsNCj4+ICsNCj4+ICsg
ICAgICAgICAgICAgICAgbWVtY3B5KGRzdF9idWYsICZzcmN2bSwgTUlOKHNpemVvZihzcmN2bSks
IGRzdF9zaXplKSk7DQo+PiArDQo+PiArICAgICAgICAgICAgICAgIGlmICggZHN0X3NpemUgPiBz
aXplb2Yoc3Jjdm0pICkNCj4+ICsgICAgICAgICAgICAgICAgICAgIG1lbXNldChkc3RfYnVmICsg
c2l6ZW9mKHNyY3ZtKSwgMCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBkc3Rfc2l6
ZSAtIHNpemVvZihzcmN2bSkpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgICBkc3RfYnVmICs9
IGRzdF9zaXplOw0KPj4gKyAgICAgICAgICAgICAgICBjdXJyKys7DQo+PiArICAgICAgICAgICAg
fQ0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCZkb21saXN0X3Jl
YWRfbG9jayk7DQo+PiArDQo+PiArICAgICAgICAvKiB0aGUgbnVtYmVyIG9mIGRvbWFpbnMgY291
bGQgaGF2ZSByZWR1Y2Ugc2luY2UgdGhlIGluaXRpYWwgY291bnQgKi8NCj4+ICsgICAgICAgIGZm
YV92bV9jb3VudCA9IGN1cnI7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgZ290byBvdXQ7DQo+
PiArDQo+PiBvdXRfcnhfaHlwX3JlbGVhc2U6DQo+PiAgICAgZmZhX2h5cF9yeF9yZWxlYXNlKCk7
DQo+PiBvdXRfcnhfaHlwX3VubG9jazoNCj4+ICAgICBzcGluX3VubG9jaygmZmZhX3J4X2J1ZmZl
cl9sb2NrKTsNCj4+IG91dF9yeF9yZWxlYXNlOg0KPj4gLSAgICAvKg0KPj4gLSAgICAgKiBUaGUg
Y2FsbGluZyBWTSBSWCBidWZmZXIgb25seSBjb250YWlucyBkYXRhIHRvIGJlIHVzZWQgYnkgdGhl
IFZNIGlmIHRoZQ0KPj4gLSAgICAgKiBjYWxsIHdhcyBzdWNjZXNzZnVsLCBpbiB3aGljaCBjYXNl
IHRoZSBWTSBoYXMgdG8gcmVsZWFzZSB0aGUgYnVmZmVyDQo+PiAtICAgICAqIG9uY2UgaXQgaGFz
IHVzZWQgdGhlIGRhdGEuDQo+PiAtICAgICAqIElmIHNvbWV0aGluZyB3ZW50IHdyb25nIGR1cmlu
ZyB0aGUgY2FsbCwgd2UgaGF2ZSB0byByZWxlYXNlIHRoZSBSWA0KPj4gLSAgICAgKiBidWZmZXIg
YmFjayB0byB0aGUgU1BNQyBhcyB0aGUgVk0gd2lsbCBub3QgZG8gaXQuDQo+PiAtICAgICAqLw0K
Pj4gLSAgICBpZiAoIHJldCAhPSBGRkFfUkVUX09LICkNCj4+IC0gICAgICAgIGZmYV9yeF9yZWxl
YXNlKGQpOw0KPj4gKyAgICBmZmFfcnhfcmVsZWFzZShkKTsNCj4+IG91dDoNCj4+ICAgICBpZiAo
IHJldCApDQo+PiAgICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCByZXQpOw0KPj4gICAg
IGVsc2UNCj4+IC0gICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIGZmYV9zcF9jb3Vu
dCwgZHN0X3NpemUpOw0KPj4gKyAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywgZmZh
X3NwX2NvdW50ICsgZmZhX3ZtX2NvdW50LCBkc3Rfc2l6ZSk7DQo+PiB9DQo+PiANCj4+IHN0YXRp
YyBpbnQzMl90IGZmYV9kaXJlY3RfcmVxX3NlbmRfdm0odWludDE2X3Qgc3BfaWQsIHVpbnQxNl90
IHZtX2lkLA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCBi
L3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gaW5kZXggYzRjZDY1NTM4OTA4Li5i
ZDY4NzdkOGM2MzIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRl
LmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gQEAgLTE4Nyw2
ICsxODcsMTggQEANCj4+ICAqLw0KPj4gI2RlZmluZSBGRkFfUEFSVElUSU9OX0lORk9fR0VUX0NP
VU5UX0ZMQUcgQklUKDAsIFUpDQo+PiANCj4+ICsvKg0KPj4gKyAqIFBhcnRpdGlvbiBwcm9wZXJ0
aWVzIHdlIGdpdmUgZm9yIGEgbm9ybWFsIHdvcmxkIFZNOg0KPj4gKyAqIC0gY2FuIHNlbmQgZGly
ZWN0IG1lc3NhZ2UgYnV0IG5vdCByZWNlaXZlIHRoZW0NCj4+ICsgKiAtIGNhbiBoYW5kbGUgaW5k
aXJlY3QgbWVzc2FnZXMNCj4+ICsgKiAtIGNhbiByZWNlaXZlIG5vdGlmaWNhdGlvbnMNCj4+ICsg
KiAzMi82NCBiaXQgZmxhZyBpcyBzZXQgZGVwZW5kaW5nIG9uIHRoZSBWTQ0KPj4gKyAqLw0KPj4g
KyNkZWZpbmUgRkZBX1BBUlRfVk1fUFJPUCAgICAoRkZBX1BBUlRfUFJPUF9ESVJFQ1RfUkVRX1NF
TkQgfCBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGRkFfUEFSVF9QUk9QX0lO
RElSRUNUX01TR1MgfCBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGRkFfUEFS
VF9QUk9QX1JFQ1ZfTk9USUYgfCBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBG
RkFfUEFSVF9QUk9QX0lTX1BFX0lEKQ0KPj4gKw0KPj4gLyogRmxhZ3MgdXNlZCBpbiBjYWxscyB0
byBGRkFfTk9USUZJQ0FUSU9OX0dFVCBpbnRlcmZhY2UgICovDQo+PiAjZGVmaW5lIEZGQV9OT1RJ
Rl9GTEFHX0JJVE1BUF9TUCAgICAgICAgQklUKDAsIFUpDQo+PiAjZGVmaW5lIEZGQV9OT1RJRl9G
TEFHX0JJVE1BUF9WTSAgICAgICAgQklUKDEsIFUpDQo+PiAtLQ0KPj4gMi40Ny4xDQoNCg0K

