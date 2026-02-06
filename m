Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G/nIzfuhWlvIQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC64FE35A
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223253.1530834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLzk-0005OE-SJ; Fri, 06 Feb 2026 13:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223253.1530834; Fri, 06 Feb 2026 13:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLzk-0005LC-Pd; Fri, 06 Feb 2026 13:35:36 +0000
Received: by outflank-mailman (input) for mailman id 1223253;
 Fri, 06 Feb 2026 13:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voLzi-0005L6-Pv
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 13:35:35 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5ad0523-0360-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 14:35:32 +0100 (CET)
Received: from DUZPR01CA0204.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::25) by GV2PR08MB8462.eurprd08.prod.outlook.com
 (2603:10a6:150:bc::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 13:35:27 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::80) by DUZPR01CA0204.outlook.office365.com
 (2603:10a6:10:4b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 13:35:23 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Fri, 6 Feb 2026 13:35:27 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB8460.eurprd08.prod.outlook.com (2603:10a6:10:3d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 13:34:23 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 13:34:23 +0000
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
X-Inumbo-ID: b5ad0523-0360-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IJQZkIDKDY6AihAnQjAGprUvIqnozLfiRfbdqKce72ncxnQ3e0T/+GtEeILW1MTJpF4wTTduHFNEH8r/Rs47QfUajio9P9eIoI1BQo88qgcaV2upHgcG0NRNQKT3NIM9nsnzSgdPSPrj4O8vwwsjWq/bOB62Q/5YUo/19kR5nUlKDyreIHKskAb0BNQCN3N7reT74Im7oO7hFVeRFXLnOz040itYrHlbyKeNanI1LG7uUhiW1cqp0SbZeOx5Y+eGGN0dUoyYhMOKWn7JGR73DMA14A6WgUS1lDTH6mqjq/TfWJwO1rNE1eZE5dDYhsDgOiG2LQaZoTfRYolw+pyKGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iP7mUcdvII2+7Ig+jjc9vW2Lpo6q0aXzlOhYgh9G3Y=;
 b=qUTeBsTX0XVHE54g5QYDZ6VV+gGiqK4VP5w0qaafJOl1AOBgxNtpMuQIEd7A5My2tcs62ZPiv/GMaUaKUCJdD7bSIZoSR1xuokDcf/brtZLExb5w55seZ2B/Yaqw3DoGc8AAVmjQfWM4W0v4qS+TRPA/AUOYzTg8JtTLHc42neSQxBLF4H5w/iQFWrumn/IhnUeRUp2rp23bvgsulfSP3ILQBcPKcIUI5Xd4gjQRcbBDygsKcwlr8syZFTY6ITLJak3G67iTBFxvscLUyeTIuBR6jdQYzT6R1hq2h5e/P2CkPPLyk89mlKX62GaLuBQMfT0C9RRVlb0eAl/jurkUDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iP7mUcdvII2+7Ig+jjc9vW2Lpo6q0aXzlOhYgh9G3Y=;
 b=XRCIH23Eg8KrfKvc1mfdoAEz9Er0cqX4XvGhOiJZcMFNZzohzcVYDwYWzK+a6bRsRNSaylqoiNijSCJ/1rrjqgeSknEa8jKbhEBA6CgZy1zSB/jXiKJTUcLE390SvXpfqHIwmX+Bh8NG5FORrzMB4wgJbQCdOBa56OKZeX98y2I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgFLMd+2HBguI5YROR6rAoYpCIVz7LHBy/IdBP65RL3DYZrWlco9I0gg5IBu96HKj1KaETkb1BV5yZZ32eLQ8rTiOhWjSEufVgvqph3XXWNGaRIrcTclzh/T/XkS2stZhvNzRfLjc3pVcqV5umclCkje1WiCSHMOd8hZ7A7Nw12cSze6+m+ciL76xoipmz85ntXQmy7WThq7qBOIIvTBmwMJ4oORmBW80a82Wi1rtqh4tKnH7Jx1DHygmLZeZUBgb1SBwVoCuDLLPVO+dnJ5wez7PM99XjDnJvyekW8hzQdYSg5TW1UI0+VQbn6SjOKX4haTa4gb3aawWzhFT9oprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iP7mUcdvII2+7Ig+jjc9vW2Lpo6q0aXzlOhYgh9G3Y=;
 b=ZM7oHbif7MAlSZnTLhJtOH+u7xwh8btqSHjhlfthx+vCXaywBr6I1Xt8TG8dYavP+ogpgrcKXjSYMShjkFBaIouqNTA1wM0hkh3y1cq/A8lWTtSOXe15i8BSZTw8X/SWBjVR88u3iySH9jwhpGbHY9uqEt8cm+k523vmP+IF2E5ibcPnj8tckCjILqbROZ28q5bNYY9QikgT+MGtZvVCYxx/dJVUz0edCFj/U8ho8zX5Pw1JLUUfquX69FolW6h3Mym8Pa6TwjLLRsOkg+cbM9gsd2keX0rEubfILLaCgGSM5/XU9liAnwKP5Yo/E8yNwbtBEQoUfX3Tj5UaEdkixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iP7mUcdvII2+7Ig+jjc9vW2Lpo6q0aXzlOhYgh9G3Y=;
 b=XRCIH23Eg8KrfKvc1mfdoAEz9Er0cqX4XvGhOiJZcMFNZzohzcVYDwYWzK+a6bRsRNSaylqoiNijSCJ/1rrjqgeSknEa8jKbhEBA6CgZy1zSB/jXiKJTUcLE390SvXpfqHIwmX+Bh8NG5FORrzMB4wgJbQCdOBa56OKZeX98y2I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Thread-Topic: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Thread-Index: AQHcl0ETIV6m5wqgrECh60MWgPTuGLV1etQAgAAv7QCAAAFMgA==
Date: Fri, 6 Feb 2026 13:34:23 +0000
Message-ID: <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com>
References:
 <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
 <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com> <aYXsvu3HlPuCUuY8@Mac.lan>
In-Reply-To: <aYXsvu3HlPuCUuY8@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB8460:EE_|DU6PEPF0000A7DF:EE_|GV2PR08MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c17fdb-3f9f-4965-a363-08de658496e0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OXBUQ3hIUmdlQjNkY1pnbzMrbzlORW1MSUJ2dnc5NFJ4Uy9UWkNHeXdhV252?=
 =?utf-8?B?MG5CdTQxcUVCUkNaSlRTRmZ2eWlvQkp1MlBGYm81TWV3L0JrdlhndUFRaXFy?=
 =?utf-8?B?aHBiLzg2aWlwSVN2Sm1VbmpQbUc5R3V3U2UxNllMZ01DTGIwOGkxSjM1MTAy?=
 =?utf-8?B?bnVkU3lXL2xrSW9kdzQ0U3NRM3JKcG9kbDJKTEtvbVo1eHk3cmo3QVl2Q2dB?=
 =?utf-8?B?N1VEdnpnVUc4UmYyZjA0Tlo1Yll6ZWp5MkxZVkFKYzVwV3JKWHR6M3Iralph?=
 =?utf-8?B?VUJoRFVyakpkNTQ2cjJFbDBBYm5zc2lQMFRQUlM0OHAxRzlWcDFXdlhEd2Qv?=
 =?utf-8?B?eVBNVkJZa2RxQmdSdWhhOExlK3gwcFc4NDRrUURyWkFwSWFrWXc5dHJUeWVN?=
 =?utf-8?B?UzI1T1JvMVpROWt1UjBBYUdCUDNhVXlsaERJTEVDSm1ZanE5R0NxSDMxc3l6?=
 =?utf-8?B?OWVYSXd2RHZQTm1sNDNNN0xaTmp5KzFEVFRlM2NuOGRiRHQ4d3NzV1ZmemdE?=
 =?utf-8?B?NDFZQXVWWnF5NFZuT2RRU0d5eFBqWS9FUm1GL2pRK0RudzJ1SlhkYkkyQjAy?=
 =?utf-8?B?d2RJeUxzYWFTMVJNN25scWVBWGJKUlVQS2VUSzNpT09rVkpreDRaUWFUNDRR?=
 =?utf-8?B?NjRrbmtPWktXV3h2VkNPOTVJNGZqYTJ5L2M2OVByRllTVnVidzEybWRHZkVB?=
 =?utf-8?B?NnAwRmpRUUFnbHpScHExMDJQeGVwZk1GMElzWkhFeUpHMENlQXpLVUJOMXc1?=
 =?utf-8?B?M3NSMTRWTXFac1hmZjNES2hIcWxZTTMxZEVtMy9NRmVFVE0wRXhpdEZpaTYy?=
 =?utf-8?B?ZW53Sm1IZUFnUnJGT0ZIa1RUYjhLSDBwSXRpOWMxRXFjRlQ4dzVXQjB0WkZv?=
 =?utf-8?B?UHNCUFBJcGxMdkdROS9Uek1FL29BY21mN0hJdGRLQjNwL1BZeklQeEJRYjFP?=
 =?utf-8?B?YkliNE5LZVA1SUs2TlpYL0VDVXNrMVJhNzY2TzBzN0pQRFI3ZU5xSksyTjNP?=
 =?utf-8?B?NW56eTZTcnIrdWNXNnZGTm9RNm1Zd2RUdnRFaFlENnIrL0MzMzFkUGpmYUNM?=
 =?utf-8?B?Z3NqSHhzZlFiMGNibEVPc2xQdnBYMDFmblYzL0RlMXY3ekk3bDlnNkNzYTBL?=
 =?utf-8?B?RWFLM29hKzJKQUczbGZpeE92OForYVlxajNNRFVYOGtYWU01R1F6THBMTzdy?=
 =?utf-8?B?MlFocU9WdHI2RzlLSURIdW9iZ3pQb0tSdjhrcXRwNG1SVkEySEhmOFBZc05o?=
 =?utf-8?B?L2hlanU4MUpUcU4vTUVFVE9rL0JadE9yb2xGSlU0KzdJRElySUpoUFFRZ3ZK?=
 =?utf-8?B?R2hnSU5iSXc0a1o2ZmJaeVByVFJOMHRRTnFlOTFjRzV6bWlEVXpZYzI2S3Ix?=
 =?utf-8?B?TU5LOStYdWlPR2xyRzFJV0paV21Seml3SU1XU3VIcGxwRE9kbTkzRHhNaWtR?=
 =?utf-8?B?TFZUMTlkNEZ3Vk5xcU5UdHdtWU5FVEp2ekMrN1RiVGt1THAyR1JuOXZtQm9l?=
 =?utf-8?B?Ym5lTFlwdGhaWEdSSXlRekdjLzk4ZUhxNFBUODhyYVlTRjZ5Nk5IeHlYd2hp?=
 =?utf-8?B?emYwMVdNQmZvbDluTmxxeEpJQXpRY3drWFZQeEt1aHhsU1VQa3lIU0hpNHhV?=
 =?utf-8?B?Mkh1MVQ4TVUwNnZFdDhIM0loUG9YUndVbkpEMmY4NEtYWHQvMDJSNWpsNkZ6?=
 =?utf-8?B?bDhOcXgwREpKbExOTmpJZER6bE5IQTNLdTAvbEpEVFdFWnNiWWY3aVVJUmVJ?=
 =?utf-8?B?V0U2WnBGTGZpaWM2WHYxKzN4ZDA4RDZROHlQcmozMXdxZThxMHN3dTJXSHRp?=
 =?utf-8?B?Q1dGejRxMFh4ZldOUFhDYnpHK3RNYVE3R25mZE8wZmJqUXFmVzVBWkNkaUdD?=
 =?utf-8?B?Vkh3U3BmYTZmVU1FYjVjSDQ4MjlIM3h1ekovbkd6SU0zTjVoUkt0a082cUtT?=
 =?utf-8?B?L0VJK2dIT0gwNjNpc1NmMXBzbkR2K3FXTjg1WUNyL1lPNDRhQ092c2x5eTZk?=
 =?utf-8?B?TitsYzVGVm92ZUtkSEZvK1FJdmhDQU83c0M1MEZ3ZFZjeXVaaFRxYWhuQi9t?=
 =?utf-8?B?MVlPb2xVaFNkcy9ZS1ZsT1B6Q2tUQWFqWll6L25UNUE4TUUzVmNEanBZQ2or?=
 =?utf-8?B?QU5yRitxMVRXY1M5Z2x3VW55bGo4N28vdzBQcmhGcTRLaHI4bys3NkVmL0po?=
 =?utf-8?Q?XF90qSXkffhBJyF2lnffOHs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0878CB93CC2BF74F82939F014B606831@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8460
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b58b390b-9626-40f8-e394-08de658470c2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|35042699022|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2lQSE9mZTdlT2t6ditBZVd6WTBsNi84RGMva3J0bFRLZnp3YUJrRGYyZC92?=
 =?utf-8?B?d1NnaVE4alNJWmFUM0NRUnhFZ2xESEgzZUc3Mkx1ODFJY3l6MmRoUEdncVRr?=
 =?utf-8?B?dFFjUVZLVC83b2dzL3BSZXVNY3o5cUdOUDBoS1FRelFGSnBjYjE4ckRUQkRk?=
 =?utf-8?B?cndlUFVvMFVnbEk2QjBQSWRtWE1xZ1NpUjNVNTVGTHpSRDlMLzFZZ0pzcTh2?=
 =?utf-8?B?Y2hpRStzRHFyb0I5cnpZamI5UUNQRUJxcHZTNVlSaVhneU1idVAzZFZ6ZGM3?=
 =?utf-8?B?L3ZlV1lPL09SaDJmUkRGWXArYlFoVTUzbzYvOHdaT1dmNXBEck56R3U3d3ZQ?=
 =?utf-8?B?NXZtQXBpamRQUW1KVFJZQUlWU1JuTjJ4OFZlNjMwR1VaaGNrUDc3SENSd1do?=
 =?utf-8?B?K1lFdFZsRXJjcHBHVCtUVnRWbUpHbWl4TWhzSnlRbmQza1RkeGtMUlduMGVn?=
 =?utf-8?B?M2JSY1F5OU9WTWRWbERHYy9jRExBaEFyOFlNK1FwL2E4Sk5mZVlvVzJmMlM1?=
 =?utf-8?B?YVZOLzdKTEhGdGxjMVJrdi9zeXk1VTlNQ1A1c3pZQzJNa3N0UXdkL0creERY?=
 =?utf-8?B?eERIQWpWZkw4cStvYzFKdXZwOG0rZUI1Q09kVzZCRnZlanJPRnp0T0N1Uk90?=
 =?utf-8?B?YitvRFRySGJnNlZrODRJdnorNFZieWNvMmZsWXo0TzZITGtkazlmZ2RIWnpD?=
 =?utf-8?B?VVlFeTZBYU1xOUpYNmFZV0lXYlp5Wi9kaFdoMHpTNVMxL3NGTzhIRVZLb044?=
 =?utf-8?B?TFhXcUtZOUZFT0tiSnNmKzRZSzBWbTVHV1FIeVNJZWtwd295dncrK3RjWWUx?=
 =?utf-8?B?Tlg5ckZxbTZhMHFsdjdJOHdzb2hnWm8vTlV2Qnd5a1d0T1MreVNoRTE5aWY5?=
 =?utf-8?B?ZHdjY05jZ2dpVnlFWVFhVFVSa1kvd052aVdPdUVmRTVJMUNQT3JlQkVvNTRM?=
 =?utf-8?B?OFMzd0FQUFZJK3RCNnZVUThkN2xaRHRjeHFtNEo4RUZ2YUM3b1pUUzF4MXdk?=
 =?utf-8?B?Zmdsb3hFb1FKQmg2azFxcHVxRGpHY0xVdENBNUdMYS9WQjhKWkM3c0tNTUJZ?=
 =?utf-8?B?WEYzUVh0TVhEaTU4bzhDRE5OSzRtMWxwTk9tS3BtUmhUa1cvYkNMRHFFdGVX?=
 =?utf-8?B?SWo0TktDNXZtNzFNOHJFQ282dXlRWTdVaWxqNU5WL3NHbGx6YktvQm1IM2pO?=
 =?utf-8?B?V1NZMTlXKzJDRmRQdmxPY1dURWRpSStuV1dtOXB2SHRPMDNFYnNZbUw2dThi?=
 =?utf-8?B?OHFCOHdsaUdTMzlYVFRYQzcrNkd3WmxNUVNNaDZnZFMySTE1WHVOS1hEblc3?=
 =?utf-8?B?ZzNqK1Q5ak9vSCsyUTZIOXNZWHR5TTJid2JwM0IwaGlZbFhJdnVSNmVodkEx?=
 =?utf-8?B?OTJHeGJ3TW8xb1h2ZjQ2S2tyVlgxTU04aWpFZ2Y5VDB1NzVHNjBMUmtWT0Fv?=
 =?utf-8?B?eEFYVnpwRkR1VERLM1JKVmhpR0ZVWHAyYlRNNUxhaU5zbWNSeWxNSUZpYVpl?=
 =?utf-8?B?ZitiMHVtNHlMR2xkU205T0x0V3BtRE1IMzhxT3ZBTWFPeVg0aTlRNUg3SVUy?=
 =?utf-8?B?UitRei8vM1lMRjBDRTVkVnRxSlF3LzBUaUZwV3crc241bzg1WVh4MHMzd3ow?=
 =?utf-8?B?Y1l1aXFTQTlWdFptMWlUYmZvbHdkNFBIWERoZFJldWFDNW5SSTFmY2w5anYx?=
 =?utf-8?B?cnQ0ZE02WmpRR3AzY1hxdWQ4cHd5OWVzNTFVNlNBTjBOaEdlc3pkUk9LbmlM?=
 =?utf-8?B?V2IrOVhjMWdGUEtFZVVrYlJmMXRBZmFzN1kxcVBSbDlqVGNOSEIraysyU1pG?=
 =?utf-8?B?a0tsaEU5MkF4V1p4UEsyaWJFd0tIYnJUTG41TXUrVUoxc093RjAweEltL1Fl?=
 =?utf-8?B?YjE4ajN6QXF6aGhSSXBSOFEydHFvc01YOHduQmxnT0h4ZHV2Y2pGblJ1aHh3?=
 =?utf-8?B?c1VyamY2dW8vZlUzT0FaUTJLZFAvZTFvZWFKSGUxd0pZKysrczAxL1ZyWUpU?=
 =?utf-8?B?aGNKSDl1d3dXUmtPUVFQcjVnd0VmS1paTzJoVktwMWRFTlFReW51Yzh5a2wv?=
 =?utf-8?B?UVRNWjg1bFkrZnVWcVpGVUpVa0w0YzU0UmtsZy9jTFJjTGtVSGJDcjk1MHNZ?=
 =?utf-8?B?NGNtTGFRYTYxWkkrL2tJMVlwYzB0M0xTczBsM2x5c1Y1OGVXNjExaXIwRTB3?=
 =?utf-8?B?RGo3UGQzVG9Yd2djelVIWkU3QWJJTTl4Ym80MHZCbGI1SlRtam9TQXJLZ2RG?=
 =?utf-8?B?U0hpb3U4dERoUTZJZWFBc1RDcTJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O7e2FuVPblYh6ZzDOXa1avTY9LtoxeAZgdfxQIUJcu9Z2WsC1XOJtp3vRJUIIOsi3kY30vuya7XMrtuJELBTcRJXUypuEXVlaYgGbOyC/+qmd/qFvqY6IW8D30CvqNHVS9WZgo8GC0ygsjIMQBvDK1dyihtY7YmhrsUN+38OyaJKkLwLvnNVQb9NvLIwsCanBL2dvS5BHenKWN4WNHU5FGdYV54EQeo9OPctotMLJkoXwXaI+ImCQ3LRHmQr1dGDDUU5OGCJ7xtGnRmLkN39x0MT70vU+XdA7k7orEGxprXMUy6533tEftRcB3xjTbQuPpA47rUbP+ZbvUAioYKrw1KrmrLU9nV9qM4jX1UudvC4LlBeADKg2BVgSwRtZLZ0QVbWlVFQLAvbMu+dF7/vNthHU1d3cc+xu5nZuq8EzlgPDiR1DQ7q8j2o+fc7HRJP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 13:35:27.3511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c17fdb-3f9f-4965-a363-08de658496e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8462
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[config.mk:url,citrix.com:email,stdgnu.mk:url,darwin.mk:url,arm.com:email,arm.com:dkim,arm.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9EC64FE35A
X-Rspamd-Action: no action

DQoNCj4gT24gNiBGZWIgMjAyNiwgYXQgMTQ6MjksIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgRmViIDA2LCAyMDI2IGF0IDExOjM4
OjAyQU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDYuMDIuMjAyNiAwOToxNywg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBYZW4gZG9lcyBub3QgcHJvdmlkZSBhIERhcndp
biBidWlsZCBjb25maWd1cmF0aW9uIGZvciBzZWxlY3RpbmcNCj4+PiBHTlUgdG9vbCBkZWZpbml0
aW9ucy4gT24gbWFjT1MsIHRoZSB0b29scyB3ZSB1c2UgYXJlIGVpdGhlciBHTlUNCj4+PiBjb21w
YXRpYmxlIG9yIHdlIG9ubHkgcmVseSBvbiBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgTWFjIE9TLCBz
bw0KPj4+IHVzaW5nIHRoZSBHTlUgdG9vbCBkZWZpbml0aW9ucyBpcyBhcHByb3ByaWF0ZS4NCj4+
PiANCj4+PiBBZGQgY29uZmlnL0Rhcndpbi5tayB0byBpbmNsdWRlIFN0ZEdOVS5tayBhbmQgZm9y
Y2UNCj4+PiBYRU5fQ09NUElMRV9BUkNIPURhcndpbiwgZW5zdXJpbmcgRGFyd2luIGJ1aWxkcyBh
bHdheXMgZm9sbG93DQo+Pj4gdGhlIGNyb3NzLWNvbXBpbGUgcGF0aCBhcyB3ZSBkZXBlbmQgb24g
dGhlIExpbnV4IEFCSSBzbyBjb21waWxpbmcNCj4+PiBvbiBNYWMgT1MgaXMgYWx3YXlzIGEgY3Jv
c3MgY29tcGlsYXRpb24gY2FzZS4NCj4+PiANCj4+PiBBbiBleGFtcGxlIG9mIGhvdyB0byBidWls
ZCB0aGUgaHlwZXJ2aXNvciBmb3IgYXJtNjQgb24gTWFjIE9TDQo+Pj4gKHRvb2xzIGNhbm5vdCBi
ZSBidWlsZCBmb3Igbm93KSB1c2luZyBhIGNvbXBpbGVyIGZyb20gYnJldzoNCj4+PiAtIGJyZXcg
aW5zdGFsbCBhYXJjaDY0LWVsZi1nY2MNCj4+PiAtIGNkIHhlbg0KPj4+IC0gbWFrZSBYRU5fVEFS
R0VUX0FSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRT1hYXJjaDY0LWVsZi0gSE9TVENDPWdjYw0KPj4+
IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNA
YXJtLmNvbT4NCj4+PiAtLS0NCj4+PiBDaGFuZ2VzIHNpbmNlIHYyOg0KPj4+IC0gU3ViamVjdCB3
YXMgInhlbjogQWRkIG1hY09TIGh5cGVydmlzb3IgYnVpbGQgY29uZmlndXJhdGlvbiINCj4+PiAt
IFVwZGF0ZSBEYXJ3aW4ubWsgY29tbWVudHMgdG8gbW9yZSBhY2N1cmF0ZSB2ZXJzaW9ucyAoSmFu
KQ0KPj4+IC0gUmVtb3ZlIHRoZSBidWlsZC1vbi1tYWNvcyBoZWxwIGFzIHdlIGhhdmUgbm8gZGVw
ZW5kZW5jeSBvbiBhbnl0aGluZw0KPj4+ICBjb21pbmcgZnJvbSBicmV3IGFueW1vcmUgYW5kIHRo
ZSB0b29sY2hhaW4gY2FuIGJlIHJldHJpZXZlZCBieSBsb3RzIG9mDQo+Pj4gIG90aGVyIHNvbHV0
aW9ucyB0aGFuIGJyZXcgb24gbWFjIG9zLiBTd2l0Y2ggdG8gYSBzaW1wbGUgZG9jIGluIHRoZQ0K
Pj4+ICBjb21taXQgbWVzc2FnZSBpbnN0ZWFkDQo+PiANCj4+IERpZCB5b3Ugc2VlIFJvZ2VyJ3Mg
bm90aWNlIG9uIE1hdHJpeCBhYm91dCBvYmpjb3B5Pw0KPiANCj4gSSB0aGluayBCZXJ0cmFuZCBj
b25zaWRlcnMgb2JqY29weSB0byBiZSBwYXJ0IG9mIHRoZSB0b29sY2hhaW4sIGhlbmNlDQo+ICJy
ZXRyaWV2aW5nIGEgdG9vbGNoYWluIiBpcyBtZWFudCB0byBpbmNsdWRlIG9iamNvcHkgKGVpdGhl
ciB0aGUgR05VLA0KPiBMTFZNIG9yIGVsZnRvb2xjaGFpbiBvbmUpDQoNClNvcnJ5IGkgb25seSBz
YXcgeW91ciBtZXNzYWdlIGluIG1hdHJpeC4NCg0KSSBjaGVja2VkIGFuZCBpIGluc3RhbGxlZCBi
b3RoIGdjYyBhbmQgYmludXRpbHMgaW4gaG9tZWJyZXcuDQoNClNvIGkgdGhpbmsgdGhlIGNvbW1p
dCBtZXNzYWdlIG5lZWRzIG1vZGlmeWluZyB0byBzdGF5Og0KDQpicmV3IGluc3RhbGwgYWFyY2g2
NC1lbGYtZ2NjIGFhcmNoNjQtZWxmLWJpbnV0aWxzDQoNCnRvIGJlIGZ1bGx5IGNvbXBsZXRlLg0K
DQo+IA0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9jb25maWcvRGFyd2luLm1rDQo+Pj4g
QEAgLTAsMCArMSw3IEBADQo+Pj4gKyMgVXNlIEdOVSB0b29sIGRlZmluaXRpb25zIGFzIHRoZSB0
b29scyB3ZSBhcmUgdXNpbmcgYXJlIGVpdGhlciBHTlUgY29tcGF0aWJsZQ0KPj4+ICsjIG9yIHdl
IG9ubHkgdXNlIGZlYXR1cmVzIHdoaWNoIGFyZSBzdXBwb3J0ZWQgb24gTWFjIE9TLg0KPj4+ICtp
bmNsdWRlICQoWEVOX1JPT1QpL2NvbmZpZy9TdGRHTlUubWsNCj4+PiArDQo+Pj4gKyMgWGVuIHVz
ZXMgTGludXgnZXMgQUJJIHNvIHdlIGFyZSBjcm9zcyBjb21waWxpbmcgb24gTWFjIE9TLg0KPj4+
ICsjIEZvcmNlIENPTVBJTEVfQVJDSCB0byBhIGZha2UgdmFsdWUgdG8gbWFrZSBzdXJlIGl0IGlz
IGFsd2F5cyB0aGUgY2FzZS4NCj4+PiArWEVOX0NPTVBJTEVfQVJDSCA9IERhcndpbg0KPj4gDQo+
PiBJIGZpcnN0IHdvbmRlcmVkIHdoeSB5b3Ugc2F5ICJmYWtlIiwgc2VlaW5nIHRoZSBmaWxlIGlz
IG5hbWVkIERhcndpbi5tay4gQnV0DQo+PiBpbiBDb25maWcubWsncyBjcm9zcy1jb21waWxlIGNo
ZWNrIHRoZSBidWlsZCBob3N0IE9TIGRvZXNuJ3QgZXZlbiBtYXR0ZXIuIFNvDQo+PiB5ZXMsIGl0
IG5lZWRzIGZha2luZyBoZXJlIGZvciB0aGUgdGltZSBiZWluZy4NCj4gDQo+IEhtLCBzZXR0aW5n
IGl0IHRvICJEYXJ3aW4iIHNlZW1zIHdlaXJkIHRvIG1lLiAgSSB1bmRlcnN0YW5kIHRoZQ0KPiBw
dXJwb3NlIG9mIHRoaXMgaXMgdG8gZm9yY2UgdGhlIHVzZXIgdG8gc2V0IFhFTl9UQVJHRVRfQVJD
SA0KPiBleHBsaWNpdGx5LiAgSSBob3dldmVyIHdvdWxkbid0IHNlZSBpdCBhcyBmdWxseSB1bmNv
cnJlY3QgdG8gbm90IHNldA0KPiB0aGlzLiAgSXQgd2lsbCB0aGVuIGV4ZWN1dGUgYHVuYW1lIC1t
YCBhbmQgZ2V0IGBhcm02NGAgYmFjayBmb3IgQXBwbGUNCj4gc2lsaWNvbiBtYWNzICh3aGljaCBp
cyBraW5kIG9mIE9LPykuICBPdGhlciBJIHN1Z2dlc3Qgd2UgdXNlIGEgbm9uLU9TWA0KPiBzcGVj
aWZpYyB2YWx1ZSBoZXJlLCBzbyB0aGF0IGlmIHJlcXVpcmVkIHdlIGNvdWxkIGRpc3Rpbmd1aXNo
IHRoaXMNCj4gY2FzZSB3aGVyZSB0aGUgdXNlciBpcyBleHBlY3RlZCB0byBwcm92aWRlIFhFTl9D
T01QSUxFX0FSQ0guDQo+IA0KPiBNYXliZSBYRU5fQ09NUElMRV9BUkNIID0geyB1bmtub3duIHwg
dW5kZWZpbmVkIH0/DQoNCkkgYW0gb2sgdG8gY2hhbmdlIHRoaXMgd2l0aCBlaXRoZXIgYnV0IG1h
eWJlIHVuc3VwcG9ydGVkIGNvdWxkIGJlDQphIHRoaXJkIGNob2ljZT8NCg0KQ2hlZXJzDQpCZXJ0
cmFuZA0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQoNCg==

