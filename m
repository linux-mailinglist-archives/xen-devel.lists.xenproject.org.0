Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7082C56907
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160792.1488848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTYk-0001ER-Sp; Thu, 13 Nov 2025 09:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160792.1488848; Thu, 13 Nov 2025 09:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTYk-0001C2-Q6; Thu, 13 Nov 2025 09:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1160792;
 Thu, 13 Nov 2025 09:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIX7=5V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJTYj-0001Bw-8H
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:24:05 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c65d8ee-c072-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 10:23:59 +0100 (CET)
Received: from MN2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:208:23c::19)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Thu, 13 Nov
 2025 09:23:55 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:23c:cafe::a4) by MN2PR18CA0014.outlook.office365.com
 (2603:10b6:208:23c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 09:23:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 09:23:55 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 01:23:53 -0800
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
X-Inumbo-ID: 7c65d8ee-c072-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuE9ocLXD2Z2wRH3FEW18SIZmGgNzSzhMbXSR+wm3soXzRjrLf2jG6d8qHMSQi7kSlIxYQtTiFVETEmIGDQiWgT/sAGqnyi+ib0Q5hzwGsOTWfkxINKPrUeRqlr2OnPm1ucLK+couNQYj6M6A09+JHGejF6nz5PJkDi4ra9J6UeL5AbvgBqLk9A+zaPJu9Zz0TpMzQS6YhJjdnyS4+jhTnyIToknoZmP2f0FOKtMzEm/QXQ/Ra2gXpga7X/dpSlxzjKgliM5k+cCxj5IqJGIbCa5nIMuNtcR3AvDA3brdtll8mvF4fd59OWtF1bxGuhSKCuziisqueQa8/9J94loQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToD+1QSJ4j8cbbrFdFnbxzS0fOebb+EAuHIMn53ZfSI=;
 b=I8PO59YysAFwLN851MpIxFy6rLgvtO5HpR8TUjWNKunka7We0PkpEFUFYDJdwDRKV9Dv1vvoZsc1PW2OSbUO9LugutQllqmau6N+4f55sCGMWmf46cCT/2gjqwVmeRxV5O3OrjAVcQngDDVkQzsmQ6CLJjDmungIOgORlk3bNqob+L1rl3MuAa9RONdb5Ho8qBbh2iiT+qOIKT3KR/vlP46MjkfQimDhczDUC1TG+aEVvUEmfgR+VgKgouq3hdLSsvfym7rvAXq931WtRcCy5Y1HTZrC3yFT2TvxoUuDJMnYMxbDDVfUp5yB8Of7z/D2tttLQg0WcFqcwU8QnEZtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToD+1QSJ4j8cbbrFdFnbxzS0fOebb+EAuHIMn53ZfSI=;
 b=muO1gEZ+lEI40n0h7dbnMSyZVQolDmYEFjLI4vzVgiqFR2djXf5vHRRq0zNIAlK+5day4a4sANSPTrEbgBXqtiOwGWU9A7RtOqJPXa51fc86tKyughla47FPgK2wkP5VFhTQ8k11nXISMlpU2NcQqG0mrhHP98pngYqQ+/LNJbA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Nov 2025 10:23:50 +0100
Message-ID: <DE7GHXHQPEVH.3BHEZR1Z99J4O@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH v2 0/2] Remove Xen as a hard requirement to run XTF
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
In-Reply-To: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: c18f9b81-8034-40d4-23b5-08de22965e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3BEaGxQY2dQMk5BUXkrWHRuYklCVXR0YXFUUnhvTFhVcUhQY3UwN0lGRFMz?=
 =?utf-8?B?Ym5pRmN0cUpOMHFkc0U1K0tOQzVLZXQ5YmNPUldBNXFsaERnWUJwdmJWam1N?=
 =?utf-8?B?aWxrWnhUeHc2TFk5TXYxZTh5Wmd0eTdhcXFwWkJhWlE2S0dZMGtocldWSVFa?=
 =?utf-8?B?UVdvZXhsRU83RmNrRVNlQ2NOR09BaEZRdUphTjhZMlY1MTJRanpaOXlBemY4?=
 =?utf-8?B?b0I3OTFCb21tYzdUOFB3am12QXJLeUZHcUhGZWNWOFNKd2FHZ2FXRjV5Vzgw?=
 =?utf-8?B?ZUdNemE4MmpQRWdVeGJxaEdEbFI2Qk5ZbUx6WTkwTkVKMlc3ZkVyQTg0OUlI?=
 =?utf-8?B?cVdIcGhmWHZPT2lhT0U3ZGpMK01SQ2dIbENyVDR1dkI0Sm1USVhBYTlVakh0?=
 =?utf-8?B?ZmdQQXNnUDZHZXNiOVNibk5kRzFBMXMxQzdEV1hzMDdoc0FGTGx2NUJBYU9s?=
 =?utf-8?B?eWZvam50WUNENi9zSlVqUkpUcWNNN3NCSk9XVmcxNldLbXV3bHdrRlkzNG9W?=
 =?utf-8?B?cDdGQmEyc01rN2FuR0pqUGxoKzc1NVMrdm9NV2Zjc2pBUVd1TlQ4dEEweW50?=
 =?utf-8?B?Ymt0d1F1VkdjMFVCZnVVUURnK1JTM0ZDcHBMZWs2ODVXT2RHaEp4V1B3UWNT?=
 =?utf-8?B?TVBrV2RpQXphcHVsaU11eWo0TnVtTUhFKzhqT1BxODg5R3diRzNSZExFWm05?=
 =?utf-8?B?THdoZ2RGYUozaHpmMGpUMzhKaEQrS3hUTERSb0tKV2RVQ3pKYXEweGlJTDlj?=
 =?utf-8?B?NVBDQk1IWU1qQm5ERFR4b2hISFMrK0p0STZ6U0JUbElMRVhLSzBQZDZzYU1s?=
 =?utf-8?B?NU5FRXJNTDFONFcwQ1dpK3VYVjFweG5JWFVxb0N4bmVFdHFyaW8zRDdoNkZs?=
 =?utf-8?B?NUxyQWtUQWZlaWtwTHhFRjg4RjNMRVVtRkdrN3VWaTlsdWtRWFphSEVBZnVw?=
 =?utf-8?B?cUJhcEMyRVBjenJUTXBqRVljL3dwUzVFKzM4WUplRzFPL3dvZkVzek5aSUxn?=
 =?utf-8?B?dzZtUHdMK0U3OVZYbnBEd3JUSjZUcjB4Njk5dmhGdlZCc2xlUStsckt0QjJm?=
 =?utf-8?B?SWY1TXFaM0FoMlV1eUNNR1VQanpvekdBbWhRamFlRng3aWlHMTAzUGhLU1ZJ?=
 =?utf-8?B?dzJDZkRVTEErdnJQN3BUaStXeC9EVzZ0RTNWNjhDb0tlc1h2MXZPWWREeDQ0?=
 =?utf-8?B?cFhVZFNtRHZQYnBSZzdFZlJ5SDRGazVvWmc5Z3BHZXR3UEFYRG0vK1AzaG1Y?=
 =?utf-8?B?VDlhRHpQYllYa2RONGRTRWwvc2xQc3NPODkxYzgvRy9mbW12c2dLb093bzkr?=
 =?utf-8?B?c0hBZnZLUlFXTkMxUXR1V05UdnVLTG1YQ3JTUTU1TkdtbzVZVHk3Szh2UFZs?=
 =?utf-8?B?Rm9KekNpdnJWVGIwZGNheGlzUmhrS0NQckc0RDhzNE8yeVZZbHVwQVM2dDFN?=
 =?utf-8?B?RCtuUVBQOHdEd2F3YnphM3hPNm1Qbm82NmNYWUQwYnp0dnFHcGY3L05jaHUr?=
 =?utf-8?B?YjNERVFGOXQrbHNnQ2ZZSFBJSHRlNWYyZUlYUW82bklIYjl3VmgrbDZhdFgv?=
 =?utf-8?B?WjZNRkVyVkRpdHBuT0tEK0R2dzRFNWYzT2UyY2ZvemNMR3FndHpWbDVOb0hl?=
 =?utf-8?B?aEIvMmpJWEo4TGhUNkQ5S1k5c2F3aEdsS3JaTnpUZW8zbktGc3dKazhwUW0x?=
 =?utf-8?B?d1UzNHVwQWN4V2IwZUIzSHpsQlMrWWhSbnA1M25HdEwzTTR4SUMvbDJKYmxH?=
 =?utf-8?B?RDdDNkgvSlEvNEVUSmw3RUxIOFlVQWsvQXZYUWVmMnJtdmRHRWR4Q1gycVYv?=
 =?utf-8?B?NmJXU2FXUkUySGRIU0dVV3pGU2prRytVa3BsNEhnbW9HY1Z4OXZqdHcxakh3?=
 =?utf-8?B?RkI3aTBobDFXRDhERTdLaTBlM1pEZ3FZd2hkdUZ1bzJ3Vm4ydHRtZDhvN3RV?=
 =?utf-8?B?c2VidXZlTkg2ZmRUZWdXM085QXZONzZVVk0rc0dVem0yMlh1ZWtCV2NnS1g3?=
 =?utf-8?B?R2NtZlpUcmpZdW5aOEdlZnhlMFNVTzg5aGgwSWxhWTFueXoybkVKd2Z4TWZ5?=
 =?utf-8?B?a0JsN3NUQ0l2WTkvRUk3VlFRUVdqcGMxZ1J4S0VQd3ZrYVkyNytRdGxRWlhz?=
 =?utf-8?Q?Lku0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:23:55.3747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18f9b81-8034-40d4-23b5-08de22965e35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344

On Thu Oct 2, 2025 at 3:55 PM CEST, Alejandro Vallejo wrote:
> Hi,
>
> I've included logic to exit QEMU using the ISA debug exit device. See pat=
ch 2.
>
> Cheers,
> Alejandro
>
> Alejandro Vallejo (2):
>   x86: Remove Xen as a hard requirement to run XTF.
>   x86: Allow exiting QEMU in TCG/QEMU
>
>  arch/x86/hvm/traps.c    | 16 ++++++++++++-
>  arch/x86/pv/traps.c     |  5 ++++
>  arch/x86/setup.c        | 53 +++++++++++++++++++++++++++++------------
>  common/lib.c            |  2 +-
>  common/report.c         |  8 ++++---
>  include/xtf/framework.h |  3 +++
>  6 files changed, 67 insertions(+), 20 deletions(-)
>
>
> base-commit: 11b552a416d1164c63be4da670f16cf8a5a9044d

Ping

