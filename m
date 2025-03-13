Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE0A5F357
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 12:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911975.1318346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsh6k-0008AU-7n; Thu, 13 Mar 2025 11:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911975.1318346; Thu, 13 Mar 2025 11:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsh6k-00087p-3u; Thu, 13 Mar 2025 11:52:14 +0000
Received: by outflank-mailman (input) for mailman id 911975;
 Thu, 13 Mar 2025 11:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkET=WA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tsh6j-00087j-2f
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 11:52:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2613::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 991aa855-0001-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 12:52:11 +0100 (CET)
Received: from DU2PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:10:2b0::8)
 by AS8PR08MB9624.eurprd08.prod.outlook.com (2603:10a6:20b:617::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 11:52:06 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::7) by DU2PR04CA0153.outlook.office365.com
 (2603:10a6:10:2b0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 11:52:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 13 Mar 2025 11:52:05 +0000
Received: ("Tessian outbound a5818d08f071:v585");
 Thu, 13 Mar 2025 11:52:05 +0000
Received: from Lff9f9f7e1e16.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A674F86C-FC0E-43B8-99F4-B9646F4F9072.1; 
 Thu, 13 Mar 2025 11:51:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lff9f9f7e1e16.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Mar 2025 11:51:53 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com (2603:10a6:803:4d::31)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 11:51:50 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8]) by VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 11:51:50 +0000
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
X-Inumbo-ID: 991aa855-0001-11f0-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NpPTGAvwjMDaPZBGFm+RaIymSB9CuIILbirbHYV+M1+/ysdmBs8TAJmV94VnC8gYq2AVWdixJFBu4yVf6uonwAotbYwv1Pd+s9qOEASpMGsxFq5b9LEOkKgTJ5lAaniu0a8ELL28DQ2cLgKfAvhT0xHLaThKXGNAUXKBw8lFtOhA5pSqHwIhkr4PoioJz3QgCCu6JdplV4mIeBZFLmQiYnN1z9TW2v3p3lYi9KX+DLtkLnZQOazYzRUYGl/zrbgcLxeraz7K6vVS+9WOa1ctBLyKjNEo4b19Y/bRAb+SnzRrHVfyA9/mRf45DCktquxUL5KqA+OUF6S/Yk3WIq4FWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IbuvHDi3IEbxpb97HACbzLYj7M9FxHnZIeq0kBOD9o=;
 b=qw+Z86qQJ9L5doTQ4NTqkU5qCWRODo0CuzYj53ZSNJ+KRUlnaj9g8IYjN9MI9OVQ2JRcVaNVxAkKuU5tRTVAh7cNC8EBaSwCcxmyFGqOqmrfdigLE5KswX43vjIS3zcT2dtwLHg1Tpplrk4y3y4X1WfsXDuJYpvpJvhh3brDdt9xopFyNvjqHnxcuY/DdO2oBcJV9Qr66t3R470Nwp9FOlUoFS+OEG33ytXpTXO81HNGaPHSikXTuQ8ZAsPUzhnb7bmkChuqB58n2pbz9YG2/Iz+d+ae+PSE5FOBrvzHuch7DTD2Jh6ppWbem664gUeEuwD/C/ElLewgUVnkTkeEXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IbuvHDi3IEbxpb97HACbzLYj7M9FxHnZIeq0kBOD9o=;
 b=hpqLS0WAeEA5wwdjdHu1jb35kHY0I1tA6tCbPfMPVF+NQBxXcam6wMiuk6LYBk/3ZTrzYilrgMayOgORrLWidXrc2t8JDhFkBTBSpYaS7W3+VFDAOpgjGMhxUOCu5SgQY2fdqPsKEXegr54F5TBD6LIEhH8o0go8zzxpX3Zwf6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cb57d533550b6c7
X-TessianGatewayMetadata: CqB/lGb0557cRMg72uWvKL+liCjXI7qo8CA0g1EZrkmFaaC2LQB9NO3dsznt/TOvjVweOIR/3aoOGw5xiynyqfU9/e8FaZCnHqt4pLEbgdayumB+pmdJVrHhhG7zPr1i5BeS1hwmpxKbfOqFG9Sdgu2Vfya23Ik3aOSJoqbp5IE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2tX2+qSjmS4HlTBxBGf9kvpRPAousH8D6tkMdm9Hc0HI1MyNRhN/+UcjJF2JlFInCMsGqWM83qEfyTfSMTFqWf6LzTDAwDMk25h+IdmopZUAqef0VCQoIqfckf/i+9xv4nrzJyFTaBYys/sEcBqZXgERme8piuDfK7J6Boc78RmnxDnQMv6Gfp2nuR2sH3Ud7cBDl6NgbXxXGVw+kHQzd/C+Rip0bMSjWCV+TemC/NdtBL2XhNqIhpswaZPMj5teV2KC2TZGoRLIgP1rVFahPYN4xpP3qzy14qHtKEn7n1sOp5vNsnOp3VLWdMlGYtPccY+8n98l90pkcBJMpMhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IbuvHDi3IEbxpb97HACbzLYj7M9FxHnZIeq0kBOD9o=;
 b=QGc7DOnyCv/uc2LmpezlSjCs+1XGOqydO//tcgOJwc6ecPEL3J+l0sTy5mAgnYwUaLtkXZGc4YFCEoTP0d02R08EavlDX5pdIjAprM6AhGhLkSW4U2l4sePjvyzIzztDacBVn5ZQ3gHuCQ+f5GXr5H4CD3t3zNZtqKbqxNZY+G8Iy8O2sUGbYVel4bM5R+r7Nsg/xtxXcHuQE2tKedY54yyAd8m9n7+4YgqJSTD8hQWJrIy1XSxJsWBrzaENLwejzOPzsjLW5J8aSq41Lv5JYNc4BwjcCh38BdzhUAnchDAScHGQJlVttdvBUsIw7O3rS+XSav03hXsLQeofxcol3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IbuvHDi3IEbxpb97HACbzLYj7M9FxHnZIeq0kBOD9o=;
 b=hpqLS0WAeEA5wwdjdHu1jb35kHY0I1tA6tCbPfMPVF+NQBxXcam6wMiuk6LYBk/3ZTrzYilrgMayOgORrLWidXrc2t8JDhFkBTBSpYaS7W3+VFDAOpgjGMhxUOCu5SgQY2fdqPsKEXegr54F5TBD6LIEhH8o0go8zzxpX3Zwf6w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 05/10] arm/mpu: Introduce frame_table, virt_to_page,
 maddr_to_virt
Thread-Topic: [PATCH 05/10] arm/mpu: Introduce frame_table, virt_to_page,
 maddr_to_virt
Thread-Index: AQHbk1YkGSTpa6yk5EqClFNNJd/JMbNwzCYAgAAppYA=
Date: Thu, 13 Mar 2025 11:51:50 +0000
Message-ID: <2294EEC2-A0AC-4FD9-864C-182801CDD734@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-6-luca.fancellu@arm.com>
 <df0ad31e-1842-41fa-9112-9e3892bfdf65@xen.org>
In-Reply-To: <df0ad31e-1842-41fa-9112-9e3892bfdf65@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB2989:EE_|DU0PR08MB8279:EE_|DU6PEPF0000B61D:EE_|AS8PR08MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d22370-ace1-40a9-2626-08dd622579ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bnhBaUg3ajEvNHJ5N3BXd3ZqaGVSa0FIcEJpdnIzSVNBT3pTRTlMV2JvQ2VK?=
 =?utf-8?B?ZGRqVmVaREFuQ050cllDNlNFbWRyYXJEenNtZmJ6K1l6bnlRcmdMUExnRVdp?=
 =?utf-8?B?eWJPU2dQUzAxZGEwQ1cwZ2xEcmZMa095VTJXeXgzcERYMHlQMFB0eHJSbnZy?=
 =?utf-8?B?eisvK0FBbTMwclNhaFhLUFVVMnZDMGxwLytQVkYveG1jRUVPaGxvR3h6WW9y?=
 =?utf-8?B?S0xHZHlQcW1BK1BZS2lUbE1lcDFSSE5PRVZqY28yNlk2VXZySFQxejgwNk9F?=
 =?utf-8?B?WlIzWisvRUdFSTVZOENaV09ISU5wNzUrUTM3NFF3aGc2NU5vd2xCSm9zSFZO?=
 =?utf-8?B?c0g2bkl0M2xlbTUwUVRmMW9wcmZxUWhsNHR1QlgvTW5tbGtKTkU2aEZvVVJP?=
 =?utf-8?B?ZGIwMWV5Um9HdHJqSlpYbmd1aXAvcVpPekVxamVpblZWem5OY1NRTXU1Q3px?=
 =?utf-8?B?M2tGNjZNQTM2VFlSRGt1TGJocWVOeGF1cmoxY3VqdDdGekVkL0pPd0IwcWdF?=
 =?utf-8?B?dGdEdXRsUi9HMXNCYmo0ZzZtRG03OVJpbHFHSHZlaXIrRmZUL1JhYWtkczRL?=
 =?utf-8?B?ejg2K3gzWWJrSHBXVHdiS015WUsyUFFxemttM3JvVkRHSFQvWlBkMXdUSUxm?=
 =?utf-8?B?OHFTZFhPWGhVdnVnZ2JOSS9DZ1RvNjVxbHJEc0Q0TG4rTE1VZTcrLy9iTWda?=
 =?utf-8?B?aUR1Si8zUFU0andxS1dHV040Y1R2SzM3Ull1eWtua2ZhRUJtM3VIMUR5ek9T?=
 =?utf-8?B?WGpCdmZFNGhTeTBqRmRRVC83ZVRQWXczR1Y5M1ZvaDZGMVhmcEk3OTFnakZO?=
 =?utf-8?B?WFRJWjZraFl0Uy9BM1MybDVCWTFuN3BiM2dISGIyOUVnajNvSU5IUnYyVFFE?=
 =?utf-8?B?emVaOGhBOS9pN1NRYSs5SjlJQkhSNkdtUnJHK3IzWXVIcDMxdjM5MHRlU0ow?=
 =?utf-8?B?K2t6Wjh4V2NFNHVUbG41dEwzYVlwSS8xZlNLclB5VnRYeFYrSGgvNGI4eWsy?=
 =?utf-8?B?Ly95UVo1U084UEF5SjV5cUpROXExTjRNUUZ5RWNqRE95NUZ5VG5pY1pxNDhj?=
 =?utf-8?B?YzNNelpUSXdLdE13Q2FrVmUvQVRTdlZ3OFJwbk44TVF1OGRwcGdDODRBTEQv?=
 =?utf-8?B?Z3kzLytWZHkzcEJQNmlDRVVFMncvWDZ5ZmI2cUlleWg0M2Z3TGk5enQxZk0y?=
 =?utf-8?B?WlRtbVJhZVg5SnJ2ZVlTa080WmR0UHlRczV2QXIvRTZ1S0VpenBRQWR6dXdz?=
 =?utf-8?B?SlZCeGtvdGV4MDRYTFd1MUxOeCsyczdXb1BvUlJPeDNwQ05KVEpSRmpETDhJ?=
 =?utf-8?B?V01DNHRaenZVbWdnZjEva2dLVU9sWTY0Q2ppN1kxdEY0dUxiQTZ4Z2F4RW1N?=
 =?utf-8?B?TlJ4bFNXamk1eDg3bDNhMDhLV3Rva2lQL0NSWlFwYVh4alU5ajBRaDNQUTFx?=
 =?utf-8?B?N2Q2Sm9ENzlmNlpoZEgvRVN2bjA3RGxEaDlkNjNsWDUydDZSZThjK2U3Y012?=
 =?utf-8?B?MnhKeHpxV0YyWkk5U3RiaDFYbmZWM3R0cDc2bXp5clBzSFFocHk2ckRQTlFz?=
 =?utf-8?B?ZmFjMG9QdU1ubTlaM1RmTlBFa2owVVNvajJFS2JHakUrVVpHVytMcDJjUHhz?=
 =?utf-8?B?a1IycmRtNjBjNUdQMHVmZ3ZEc0V0M0R6bUlXa0NwWEtzWW4yWGYwRUQ5NENZ?=
 =?utf-8?B?UCtWNEhwYXcvenNHd1kyTVhIbDdpZHBqVDZWU0N0ZloyZzF1U2RlTlROMjRJ?=
 =?utf-8?B?N2dFc2ZzdnJVeFg1T3UvenUrTzk1WDBEK1lTVkFpbXorZzFPaDhvZkJ3bEl4?=
 =?utf-8?B?ajNwZm5wSzBBQ3J6UzV1aTRvKzdQeW9hUFUwdnJuNk1IdXFhcWozRjR6aysy?=
 =?utf-8?B?OXBqMENUb3RQT1NoSGRJUFhwNkowaG13cmd2YlhJRWFjYjMvMXZOWmMxK1lZ?=
 =?utf-8?Q?mBV1+VorNtfII5ZbGcRL5bfCWGiClavq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2989.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBF36C24F93772499EC54C0CE875A4AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:803:4d::31];domain=VI1PR08MB2989.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81206bf8-12d8-4b3e-2b1e-08dd622570ba
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlJaZUZxd2dLTXNMNG1aTDhDZ1pGcVlDeWxqRXAvU2dJandRejlzeHdJVGlz?=
 =?utf-8?B?dzZlemhiN01OTzVNN25Kb2JiUzVRdnVIbkkxTXl2c3RTWU45cEg3eVNYNGk0?=
 =?utf-8?B?aE9ucWYxallnWko1eXNxZ3pLeFpVWjZJREVMeVZtSWdWeGg4THM0TURNellN?=
 =?utf-8?B?clNFY2NvLzRJeGlzdE95b09uZVNueDJWa2dYb0c0NnZiQXArem1LZEl3ZDZU?=
 =?utf-8?B?Wkk4OUFIeFNjTUxwMUY0VXRRL3ZnQ0FuZ2dDdFN5QitSN0djK2p3ZGFzdWFB?=
 =?utf-8?B?QzdoOFRjem9EbVZBeVJRRS9WaXpGRUMrcER3RVFTR3FjVDd5MVNxNTFsNlo3?=
 =?utf-8?B?K2xKOTB3S2FWTU5jQWRsd3dCMGM1TFRIOTl6ZHJ0RlFBNXo5NUdJVjVwWVhL?=
 =?utf-8?B?Q0xqaWZGVVVHRTBPWmtxcWdxQmlkY1NVMFo3NXlhZ2g2VVdlNW1NbHBIU2JK?=
 =?utf-8?B?SzZQcG9vUytOTGhaUUhvOXNhekJQcWhTVWtNU2lOb2syZDNkenJCdXVZOGZz?=
 =?utf-8?B?L0FBWVNtTVVWMHY5NUY1SUJCaWs2RkVrMS9oOG9YemNuVEkrK25DTW5nRzNQ?=
 =?utf-8?B?T0J3N29ZUDFCYlpMQ1N5Y2Z1WHQ0ME1nc0RhSDJva0pyKzdMQWt4S0FpZHJj?=
 =?utf-8?B?dENxWkQrWUxiaDVtUk5WQWJSaWIyK3ZEV2dMVXZjRjNOMFE5VXRUNEx5RGs3?=
 =?utf-8?B?dm5vOVlYbG03NVBFdjl2ODhrSGRpdFF3QlhhUHFGaCtYUmZJV0xLUmIxeUVo?=
 =?utf-8?B?VVZSbDM1VUw0MTNZT29kQnhFRS9td1Y4YVUrN1BnUEx6T0RDd2ZRcFJnRUNz?=
 =?utf-8?B?d0VSeEZUVmRNUzh5VWFyQzUwcUo4VmhQalZ6RWwzYktiZGozTDNxNUlCcmor?=
 =?utf-8?B?YVV6LzllTytUQVV3NmRHbmo0K05QSUpGZ0pyZWFNMUsxWjMzUGZIUXBwU1VR?=
 =?utf-8?B?MFdhM3d5em9Ya0d3dzRUVmlueTRNOGQ3ZzVtVzRYQ1Y3ZGVJYi84Z3VhcDB0?=
 =?utf-8?B?cmg3eFVyQzA3Ylo5RWpPeUdlZEJ1anI3Y1lrYW9zYTd1T0k0aFdBRC9HelRK?=
 =?utf-8?B?dlkrRy9ac3FRV0FHMjRzMnNWZHhEeVhTR3JZL3lrSGdvTkhPS2JnTTJZTkph?=
 =?utf-8?B?RmptUDFxN1M2ZVRkK0JFZE5aQmpPcU96eXVvbmZqdkp3bWFIbG5jeVl1SnFz?=
 =?utf-8?B?bmd3c3RQb3pHSkhsN2RYdC94aUZjOUlpVkRwdTB3NE9YVXp0NG9GcXpuaW4v?=
 =?utf-8?B?TVVDL082ZHhoc2MzbWVORU84UkY3Ky9SZ3pwblNVeE52K1VRbkptZ1FwUGpN?=
 =?utf-8?B?bk1CNzdzWWhPV2FyTUVrbkluclNsV0hERnA3bUZtVjYzanpUaDZRaWtnRW5i?=
 =?utf-8?B?Yy9udDYzbmd1T29xckdUSmc1emNuVHZEcnZURm9mU01WQ1QxOU9uYzVNN2dR?=
 =?utf-8?B?VHJGUldJQzcwSGRlaHluVUx5eE0vS2s4WVJ6VGxRTkZRRGM1UGZoVUVIVytS?=
 =?utf-8?B?eFJKSVcva1BKRlNRcDFVUzNyQnhtYVpvcHZuY3Bhc2tJQituZXVNTVg3c0tn?=
 =?utf-8?B?Q2htVGZPQk9NSFZ3REprZldrak8zd0VkT1cyWTZ5aE9RbDdvV3JYRnNEVzUw?=
 =?utf-8?B?M1Zsclh5Y2tSUzJZY1NDY3NSY0hCbk5wdmo5RVA4eDB0ejIzRCs2cy9zcXNC?=
 =?utf-8?B?OEVtY2ZtUkJxZ1U5NEkvM3NMNXYwTGRLSWdFMktpN3JPS2Z0cHN5RzFBZ3Ja?=
 =?utf-8?B?QkVKc2k2VGlnUnRaUm42MUIvY3EvWDExY1FHWFFmSHI1Ry8xWmRzOXJtaFlF?=
 =?utf-8?B?ei9TMXVOSnNpYTh1dVJQaE0vSWlEeDdHeUhlTjJaSjkzVXNQbThuRUlEK3Qv?=
 =?utf-8?B?akFzbXMxWFZsVWowQlpsQTAyK2tkVGNwODBzY1NCMllJdVhXUjdUSThFdldI?=
 =?utf-8?B?eEh6UHB5aS82dTFGSG03a3VwWFFSTzVqL00xRElMVFZSajhlcVpmY25kY2Rq?=
 =?utf-8?B?eWFQNTZxY3VnPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:52:05.5153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d22370-ace1-40a9-2626-08dd622579ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9624

SGkgSnVsaWVuLA0KDQo+IE9uIDEzIE1hciAyMDI1LCBhdCAwOToyMiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDEyLzAzLzIwMjUgMTM6
NTIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBJbnRyb2R1Y2UgdmFyaWFibGVzIGFuZCBmdW5j
dGlvbnMgdXNlZCBpbiB0aGUgY29tbW9uIEFybSBjb2RlIGJ5DQo+PiBNUFUgbWVtb3J5IG1hbmFn
ZW1lbnQgc3Vic3lzdGVtLCBwcm92aWRlIHN0cnVjdCBwYWdlX2luZm8gYW5kDQo+PiB0aGUgTVBV
IGltcGxlbWVudGF0aW9uIGZvciBoZWxwZXJzIGFuZCBtYWNyb3MgdXNlZCBpbiB0aGUgY29tbW9u
DQo+PiBhcm0gY29kZS4NCj4+IE1vdmluZyB2aXJ0X3RvX3BhZ2UgaGVscGVyIHRvIG1tdS9tcHUg
cGFydCBpcyBub3QgZWFzeSBhcyBpdCBuZWVkcw0KPj4gdmlzaWJpbGl0eSBvZiAnc3RydWN0IHBh
Z2VfaW5mbycsIHNvIHByb3RlY3QgaXQgd2l0aCBDT05GSUdfTU1VDQo+PiBhbmQgcHJvdmlkZSB0
aGUgTVBVIHZhcmlhbnQgaW4gdGhlICNlbHNlIGJyYW5jaC4NCj4gDQo+IEhhdmUgeW91IGNvbnNp
ZGVyZWQgaW5jbHVkaW5nICJhc20ve21tdSxtcHV9L21tLmgiICoqYWZ0ZXIqKiBzdHJ1Y3QgcGFn
ZV9pbmZvIGlzIGRlY2xhcmVkPw0KDQpJIGRpZG7igJl0IHRyaWVkIHRoYXQsIGJ1dCBpZiB3ZSBk
byB0aGF0IHdlIHNvbHZlIGFsbCB0aGUgaXNzdWVzIChJIGRvbuKAmXQgbGlrZSAjaW5jbHVkZXMg
aW4gdGhlIG1pZGRsZSBvZiBoZWFkZXJzLA0KYmVjYXVzZSBvZiB0aGF0IEkgZGlkbuKAmXQgdHJ5
KS4NCg0KVGhpcyBpcyB3aGF0IGl0IGxvb2tzIGxpa2U6DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vbW0uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQpp
bmRleCA5YmY1Yzg0NmM4NmMuLmI0OWVjOWMzZGQxYSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9tbS5oDQorKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0K
QEAgLTE0LDE0ICsxNCw2IEBADQogIyBlcnJvciAidW5rbm93biBBUk0gdmFyaWFudCINCiAjZW5k
aWYNCiANCi0jaWYgZGVmaW5lZChDT05GSUdfTU1VKQ0KLSMgaW5jbHVkZSA8YXNtL21tdS9tbS5o
Pg0KLSNlbGlmIGRlZmluZWQoQ09ORklHX01QVSkNCi0jIGluY2x1ZGUgPGFzbS9tcHUvbW0uaD4N
Ci0jZWxzZQ0KLSNlcnJvciAiVW5rbm93biBtZW1vcnkgbWFuYWdlbWVudCBsYXlvdXQiDQotI2Vu
ZGlmDQotDQogLyogQWxpZ24gWGVuIHRvIGEgMiBNaUIgYm91bmRhcnkuICovDQogI2RlZmluZSBY
RU5fUEFERFJfQUxJR04gKDEgPDwgMjEpDQogDQpAQCAtMjY0LDUzICsyNTYsMTMgQEAgc3RhdGlj
IGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfd2MocGFkZHJfdCBzdGFydCwgc2l6ZV90IGxl
bikNCiAjZGVmaW5lIHBhZGRyX3RvX3Bmbl9hbGlnbmVkKHBhZGRyKSAgICBwYWRkcl90b19wZm4o
UEFHRV9BTElHTihwYWRkcikpDQogDQogI2lmIGRlZmluZWQoQ09ORklHX01NVSkNCi0NCi0jaWZk
ZWYgQ09ORklHX0FSTV8zMg0KLS8qKg0KLSAqIEZpbmQgdGhlIHZpcnR1YWwgYWRkcmVzcyBjb3Jy
ZXNwb25kaW5nIHRvIGEgbWFjaGluZSBhZGRyZXNzDQotICoNCi0gKiBPbmx5IG1lbW9yeSBiYWNr
aW5nIHRoZSBYRU5IRUFQIGhhcyBhIGNvcnJlc3BvbmRpbmcgdmlydHVhbCBhZGRyZXNzIHRvDQot
ICogYmUgZm91bmQuIFRoaXMgaXMgc28gd2UgY2FuIHNhdmUgcHJlY2lvdXMgdmlydHVhbCBzcGFj
ZSwgYXMgaXQncyBpbg0KLSAqIHNob3J0IHN1cHBseSBvbiBhcm0zMi4gVGhpcyBtYXBwaW5nIGlz
IG5vdCBzdWJqZWN0IHRvIFBEWCBjb21wcmVzc2lvbg0KLSAqIGJlY2F1c2UgWEVOSEVBUCBpcyBr
bm93biB0byBiZSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMgYW5kIGNhbid0IGhlbmNlDQotICoganVt
cCBvdmVyIHRoZSBQRFggaG9sZS4gVGhpcyBtZWFucyB3ZSBjYW4gYXZvaWQgdGhlIHJvdW5kdHJp
cHMNCi0gKiBjb252ZXJ0aW5nIHRvL2Zyb20gcGR4Lg0KLSAqDQotICogQHBhcmFtIG1hIE1hY2hp
bmUgYWRkcmVzcw0KLSAqIEByZXR1cm4gVmlydHVhbCBhZGRyZXNzIG1hcHBlZCB0byBgbWFgDQot
ICovDQotc3RhdGljIGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpDQotew0K
LSAgICBBU1NFUlQoaXNfeGVuX2hlYXBfbWZuKG1hZGRyX3RvX21mbihtYSkpKTsNCi0gICAgbWEg
LT0gbWZuX3RvX21hZGRyKGRpcmVjdG1hcF9tZm5fc3RhcnQpOw0KLSAgICByZXR1cm4gKHZvaWQg
KikodW5zaWduZWQgbG9uZykgbWEgKyBYRU5IRUFQX1ZJUlRfU1RBUlQ7DQotfQ0KKyMgaW5jbHVk
ZSA8YXNtL21tdS9tbS5oPg0KKyNlbGlmIGRlZmluZWQoQ09ORklHX01QVSkNCisjIGluY2x1ZGUg
PGFzbS9tcHUvbW0uaD4NCiAjZWxzZQ0KLS8qKg0KLSAqIEZpbmQgdGhlIHZpcnR1YWwgYWRkcmVz
cyBjb3JyZXNwb25kaW5nIHRvIGEgbWFjaGluZSBhZGRyZXNzDQotICoNCi0gKiBUaGUgZGlyZWN0
bWFwIGNvdmVycyBhbGwgY29udmVudGlvbmFsIG1lbW9yeSBhY2Nlc2libGUgYnkgdGhlDQotICog
aHlwZXJ2aXNvci4gVGhpcyBtZWFucyBpdCdzIHN1YmplY3QgdG8gUERYIGNvbXByZXNzaW9uLg0K
LSAqDQotICogTm90ZSB0aGVyZSdzIGFuIGV4dHJhIG9mZnNldCBhcHBsaWVkIChkaXJlY3RtYXBf
YmFzZV9wZHgpIG9uIHRvcCBvZiB0aGUNCi0gKiByZWd1bGFyIFBEWCBjb21wcmVzc2lvbiBsb2dp
Yy4gSXRzIHB1cnBvc2UgaXMgdG8gc2tpcCBvdmVyIHRoZSBpbml0aWFsDQotICogcmFuZ2Ugb2Yg
bm9uLWV4aXN0aW5nIG1lbW9yeSwgc2hvdWxkIHRoZXJlIGJlIG9uZS4NCi0gKg0KLSAqIEBwYXJh
bSBtYSBNYWNoaW5lIGFkZHJlc3MNCi0gKiBAcmV0dXJuIFZpcnR1YWwgYWRkcmVzcyBtYXBwZWQg
dG8gYG1hYA0KLSAqLw0KLXN0YXRpYyBpbmxpbmUgdm9pZCAqbWFkZHJfdG9fdmlydChwYWRkcl90
IG1hKQ0KLXsNCi0gICAgQVNTRVJUKChtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihtYSkpIC0gZGly
ZWN0bWFwX2Jhc2VfcGR4KSA8DQotICAgICAgICAgICAoRElSRUNUTUFQX1NJWkUgPj4gUEFHRV9T
SElGVCkpOw0KLSAgICByZXR1cm4gKHZvaWQgKikoWEVOSEVBUF9WSVJUX1NUQVJUIC0NCi0gICAg
ICAgICAgICAgICAgICAgIChkaXJlY3RtYXBfYmFzZV9wZHggPDwgUEFHRV9TSElGVCkgKw0KLSAg
ICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fZGlyZWN0bWFwb2ZmKG1hKSk7DQotfQ0KKyNlcnJv
ciAiVW5rbm93biBtZW1vcnkgbWFuYWdlbWVudCBsYXlvdXQiDQogI2VuZGlmDQogDQotI2VuZGlm
IC8qIENPTkZJR19NTVUgKi8NCi0NCiAvKg0KICAqIFRyYW5zbGF0ZSBhIGd1ZXN0IHZpcnR1YWwg
YWRkcmVzcyB0byBhIG1hY2hpbmUgYWRkcmVzcy4NCiAgKiBSZXR1cm4gdGhlIGZhdWx0IGluZm9y
bWF0aW9uIGlmIHRoZSB0cmFuc2xhdGlvbiBoYXMgZmFpbGVkIGVsc2UgMC4NCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW11L21tLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vbW11L21tLmgNCmluZGV4IDVmZjIwNzExMzNlZS4uOTU1N2Y2MzJkOGU2IDEwMDY0NA0K
LS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tdS9tbS5oDQorKysgYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vbW11L21tLmgNCkBAIC0yMSw2ICsyMSw1MCBAQCBleHRlcm4gdW5zaWdu
ZWQgbG9uZyBkaXJlY3RtYXBfYmFzZV9wZHg7DQogICAgIChwYWRkcl90KSgodmFfdG9fcGFyKHZh
XykgJiBQQUREUl9NQVNLICYgUEFHRV9NQVNLKSB8ICh2YV8gJiB+UEFHRV9NQVNLKSk7IFwNCiB9
KQ0KIA0KKyNpZmRlZiBDT05GSUdfQVJNXzMyDQorLyoqDQorICogRmluZCB0aGUgdmlydHVhbCBh
ZGRyZXNzIGNvcnJlc3BvbmRpbmcgdG8gYSBtYWNoaW5lIGFkZHJlc3MNCisgKg0KKyAqIE9ubHkg
bWVtb3J5IGJhY2tpbmcgdGhlIFhFTkhFQVAgaGFzIGEgY29ycmVzcG9uZGluZyB2aXJ0dWFsIGFk
ZHJlc3MgdG8NCisgKiBiZSBmb3VuZC4gVGhpcyBpcyBzbyB3ZSBjYW4gc2F2ZSBwcmVjaW91cyB2
aXJ0dWFsIHNwYWNlLCBhcyBpdCdzIGluDQorICogc2hvcnQgc3VwcGx5IG9uIGFybTMyLiBUaGlz
IG1hcHBpbmcgaXMgbm90IHN1YmplY3QgdG8gUERYIGNvbXByZXNzaW9uDQorICogYmVjYXVzZSBY
RU5IRUFQIGlzIGtub3duIHRvIGJlIHBoeXNpY2FsbHkgY29udGlndW91cyBhbmQgY2FuJ3QgaGVu
Y2UNCisgKiBqdW1wIG92ZXIgdGhlIFBEWCBob2xlLiBUaGlzIG1lYW5zIHdlIGNhbiBhdm9pZCB0
aGUgcm91bmR0cmlwcw0KKyAqIGNvbnZlcnRpbmcgdG8vZnJvbSBwZHguDQorICoNCisgKiBAcGFy
YW0gbWEgTWFjaGluZSBhZGRyZXNzDQorICogQHJldHVybiBWaXJ0dWFsIGFkZHJlc3MgbWFwcGVk
IHRvIGBtYWANCisgKi8NCitzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJf
dCBtYSkNCit7DQorICAgIEFTU0VSVChpc194ZW5faGVhcF9tZm4obWFkZHJfdG9fbWZuKG1hKSkp
Ow0KKyAgICBtYSAtPSBtZm5fdG9fbWFkZHIoZGlyZWN0bWFwX21mbl9zdGFydCk7DQorICAgIHJl
dHVybiAodm9pZCAqKSh1bnNpZ25lZCBsb25nKSBtYSArIFhFTkhFQVBfVklSVF9TVEFSVDsNCit9
DQorI2Vsc2UNCisvKioNCisgKiBGaW5kIHRoZSB2aXJ0dWFsIGFkZHJlc3MgY29ycmVzcG9uZGlu
ZyB0byBhIG1hY2hpbmUgYWRkcmVzcw0KKyAqDQorICogVGhlIGRpcmVjdG1hcCBjb3ZlcnMgYWxs
IGNvbnZlbnRpb25hbCBtZW1vcnkgYWNjZXNpYmxlIGJ5IHRoZQ0KKyAqIGh5cGVydmlzb3IuIFRo
aXMgbWVhbnMgaXQncyBzdWJqZWN0IHRvIFBEWCBjb21wcmVzc2lvbi4NCisgKg0KKyAqIE5vdGUg
dGhlcmUncyBhbiBleHRyYSBvZmZzZXQgYXBwbGllZCAoZGlyZWN0bWFwX2Jhc2VfcGR4KSBvbiB0
b3Agb2YgdGhlDQorICogcmVndWxhciBQRFggY29tcHJlc3Npb24gbG9naWMuIEl0cyBwdXJwb3Nl
IGlzIHRvIHNraXAgb3ZlciB0aGUgaW5pdGlhbA0KKyAqIHJhbmdlIG9mIG5vbi1leGlzdGluZyBt
ZW1vcnksIHNob3VsZCB0aGVyZSBiZSBvbmUuDQorICoNCisgKiBAcGFyYW0gbWEgTWFjaGluZSBh
ZGRyZXNzDQorICogQHJldHVybiBWaXJ0dWFsIGFkZHJlc3MgbWFwcGVkIHRvIGBtYWANCisgKi8N
CitzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkNCit7DQorICAg
IEFTU0VSVCgobWZuX3RvX3BkeChtYWRkcl90b19tZm4obWEpKSAtIGRpcmVjdG1hcF9iYXNlX3Bk
eCkgPA0KKyAgICAgICAgICAgKERJUkVDVE1BUF9TSVpFID4+IFBBR0VfU0hJRlQpKTsNCisgICAg
cmV0dXJuICh2b2lkICopKFhFTkhFQVBfVklSVF9TVEFSVCAtDQorICAgICAgICAgICAgICAgICAg
ICAoZGlyZWN0bWFwX2Jhc2VfcGR4IDw8IFBBR0VfU0hJRlQpICsNCisgICAgICAgICAgICAgICAg
ICAgIG1hZGRyX3RvX2RpcmVjdG1hcG9mZihtYSkpOw0KK30NCisjZW5kaWYNCisNCiAvKg0KICAq
IFByaW50IGEgd2FsayBvZiBhIHBhZ2UgdGFibGUgb3IgcDJtDQogICoNCg0KDQoNCj4+IEludHJv
ZHVjZSBGUkFNRVRBQkxFX05SIHRoYXQgaXMgcmVxdWlyZWQgZm9yICdwZHhfZ3JvdXBfdmFsaWQn
IGluDQo+PiBwZHguYy4NCj4gDQo+IA0KPiBNYXliZSBjbGFyaWZ5IGluIHRoZSBjb21taXQgbWVz
c2FnZSB0aGF0IHRoZSBmcmFtZXRhYmxlIHdpbGwgYmUgc2V0dXAgYXQgYSBsYXRlciBzdGFnZT8N
Cg0KU3VyZQ0KDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+PiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgg
ICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9tcHUvbGF5b3V0LmggfCAgMyArKysNCj4+ICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bXB1L21tLmggICAgIHwgIDMgKysrDQo+PiAgeGVuL2FyY2gvYXJtL21wdS9tbS5jICAgICAgICAg
ICAgICAgICB8ICA0ICsrKysNCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaCBiL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+PiBpbmRleCBlNzc2N2NkYWI0OTMuLmM5NmQzM2FjZWFm
MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KPj4gQEAgLTM0MSw2ICszNDEsOCBAQCBz
dGF0aWMgaW5saW5lIHVpbnQ2NF90IGd2aXJ0X3RvX21hZGRyKHZhZGRyX3QgdmEsIHBhZGRyX3Qg
KnBhLA0KPj4gICNkZWZpbmUgdmlydF90b19tZm4odmEpICAgICBfX3ZpcnRfdG9fbWZuKHZhKQ0K
Pj4gICNkZWZpbmUgbWZuX3RvX3ZpcnQobWZuKSAgICBfX21mbl90b192aXJ0KG1mbikNCj4+ICAr
I2lmZGVmIENPTkZJR19NTVUNCj4+ICsNCj4+ICAvKiBDb252ZXJ0IGJldHdlZW4gWGVuLWhlYXAg
dmlydHVhbCBhZGRyZXNzZXMgYW5kIHBhZ2UtaW5mbyBzdHJ1Y3R1cmVzLiAqLw0KPj4gIHN0YXRp
YyBpbmxpbmUgc3RydWN0IHBhZ2VfaW5mbyAqdmlydF90b19wYWdlKGNvbnN0IHZvaWQgKnYpDQo+
PiAgew0KPj4gQEAgLTM1NSw2ICszNTcsMjIgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZV9p
bmZvICp2aXJ0X3RvX3BhZ2UoY29uc3Qgdm9pZCAqdikNCj4+ICAgICAgcmV0dXJuIGZyYW1lX3Rh
YmxlICsgcGR4IC0gZnJhbWV0YWJsZV9iYXNlX3BkeDsNCj4+ICB9DQo+PiAgKyNlbHNlIC8qICFD
T05GSUdfTU1VICovDQo+PiArDQo+PiArLyogQ29udmVydCBiZXR3ZWVuIHZpcnR1YWwgYWRkcmVz
cyB0byBwYWdlLWluZm8gc3RydWN0dXJlLiAqLw0KPj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHBh
Z2VfaW5mbyAqdmlydF90b19wYWdlKGNvbnN0IHZvaWQgKnYpDQo+PiArew0KPj4gKyAgICB1bnNp
Z25lZCBsb25nIHBkeDsNCj4+ICsNCj4+ICsgICAgcGR4ID0gcGFkZHJfdG9fcGR4KHZpcnRfdG9f
bWFkZHIodikpOw0KPj4gKyAgICBBU1NFUlQocGR4ID49IGZyYW1ldGFibGVfYmFzZV9wZHgpOw0K
Pj4gKyAgICBBU1NFUlQocGR4IDwgZnJhbWV0YWJsZV9wZHhfZW5kKTsNCj4+ICsNCj4+ICsgICAg
cmV0dXJuIGZyYW1lX3RhYmxlICsgcGR4IC0gZnJhbWV0YWJsZV9iYXNlX3BkeDsNCj4+ICt9DQo+
PiArDQo+PiArI2VuZGlmIC8qIENPTkZJR19NTVUgKi8NCj4+ICsNCj4+ICBzdGF0aWMgaW5saW5l
IHZvaWQgKnBhZ2VfdG9fdmlydChjb25zdCBzdHJ1Y3QgcGFnZV9pbmZvICpwZykNCj4+ICB7DQo+
PiAgICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feChwYWdlX3RvX21mbihwZykpKTsNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2xheW91dC5oIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL21wdS9sYXlvdXQuaA0KPj4gaW5kZXggMjQ4ZTU1Zjg4ODJkLi5j
NDZiNjM0YzljMTUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1
L2xheW91dC5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L2xheW91dC5o
DQo+PiBAQCAtMyw2ICszLDkgQEANCj4+ICAjaWZuZGVmIF9fQVJNX01QVV9MQVlPVVRfSF9fDQo+
PiAgI2RlZmluZSBfX0FSTV9NUFVfTEFZT1VUX0hfXw0KPj4gICsjZGVmaW5lIEZSQU1FVEFCTEVf
U0laRSAgIEdCKDMyKQ0KPiANCj4gSSBndWVzcyB5b3UgY29waWVkIHRoZSB2YWx1ZSBmb3IgdGhl
IE1NVSBjb2RlIGZvciBhcm02NC4gQnV0IGlzIHRoaXMgdmFsdWUgc3RpbGwgc2Vuc2libGUgZm9y
IE1QVT8gV2hhdCBhYm91dCBhcm0zMj8NCj4gDQo+IEluIGFueSBjYXNlLCBzb21lIGRvY3VtZW50
YXRpb24gd291bGQgYmUgdXNlZnVsLg0KDQpZZXMgSSB0b29rIHRoZSBvbmUgZnJvbSBhcm02NCwg
aGVyZSBJIHByb2JhYmx5IG5lZWQgc29tZSBoZWxwIGFzIHRoZXJlIGFyZSBub3QgdG9vIG1hbnkN
CmluZm9ybWF0aW9ucyBhYm91dCBob3cgdG8gc2l6ZSB0aGlzLg0KDQoNCg==

