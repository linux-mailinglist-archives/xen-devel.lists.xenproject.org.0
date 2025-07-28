Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51046B140F4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061791.1427372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugRLM-0004He-2j; Mon, 28 Jul 2025 17:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061791.1427372; Mon, 28 Jul 2025 17:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugRLL-0004FJ-VO; Mon, 28 Jul 2025 17:08:55 +0000
Received: by outflank-mailman (input) for mailman id 1061791;
 Mon, 28 Jul 2025 17:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JaNA=2J=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ugRLK-0004EZ-CX
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:08:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 892802bd-6bd5-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 19:08:53 +0200 (CEST)
Received: from DM6PR02CA0059.namprd02.prod.outlook.com (2603:10b6:5:177::36)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 17:08:50 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::fd) by DM6PR02CA0059.outlook.office365.com
 (2603:10b6:5:177::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 17:08:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 17:08:49 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 12:08:48 -0500
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
X-Inumbo-ID: 892802bd-6bd5-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VChfLeFsq+BuzwvRBx5SQvS5OHEP1bWdCH0a9zj9xwI9QeIdl5/jH8Vp32qXrkLDFLjXcGDftnnr2JXiKUuc8xduPbYGKmQFOopyqUa+51j9ZSGukmxmFeQH6aUZoWK568mtB6jiN7KwX37xCFtFBn5D0yAdwfEf2FhNTL4Eg6AWfDbiGApQpAIwzzv1m7v6n1Sneg+BvEfNd6fz2IzrHce6TxmHR+gztyOssWicx71gJ0VHGy5C97AS7G2S69kDq2StDuJlHj30enZ2SnEVOjfcRR8y7Y3H2uET0jreDQLRb7qEOTaZ99qiFgbMWwQjnzOep/BJwJf9uJgLvo9pYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gefHANxxVieKdHAu5lbbcO80Zxn6z7e5gI0jN68l0dc=;
 b=RRoaNL8kVx5qbLhoxLE4NjxN1yn8GWv8IhRBB0F6V6XX9ONv3P00mNZxMgCFxhVAvhtgJ62bgck/XCKWsPELTa0vmOMAXz2C5V2vv9Lg8R325QEFJhFzQ2zXFclK4RgFKm7dqI2QMmdnftt0lPRbSVjid1Xzy2UK6GcnNbmPhpEFXdvvQzXjiIy04saofMkK4C1PNMyfAGM+sV5EPZaY0YI+UDwKYwmI5v64qgAMK5VNeubgThG+cWQ6+Uw2ft2xoy8zxJeu1CjczdZPXE77g7ugcKfcuyI0LZ2bIPbIXdyBUkZC/g94bAWl4GpGhnz/eGr2DtDI8aV8Iw0CWaVphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gefHANxxVieKdHAu5lbbcO80Zxn6z7e5gI0jN68l0dc=;
 b=Ynro/5cbGAiaSpElxi7+MkqKpYxlCshcqJxkKbfPwgfvcRXleNEPx5GMXnK3SBtqoNSRUcmBrfcv3H1+fG04x+py+rS+ZsrvOLDqvsISBe5i8OAx6Ic5Jub32vmEh266vYHR3cwFfdVVvuoUo+7n0D9LAY81vRpDVGXnxRc3HVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Jul 2025 19:08:46 +0200
Message-ID: <DBNUR2PNKJKP.677MC6QFT97J@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] xenalyze: correct symbol name length fscanf() specifier
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <72218fb5-92f2-481d-9754-e6069f945c8e@suse.com>
In-Reply-To: <72218fb5-92f2-481d-9754-e6069f945c8e@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 1536167c-c7e9-4939-af1c-08ddcdf96bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0VvdVk2ZXVhcThBMTFIcTNIU2hPNW4zYzNrQzlZKzE3WHIvVDREUnBrb240?=
 =?utf-8?B?QTlYeVV5OEc3MUloNGRmNk94ekhicTdJSkJvSk1sRTduVXZyS0tzQWlzOWZP?=
 =?utf-8?B?M3Y1bzBPUnpGVm8vdjYxVUFTdU5LdnZuay8wcHpDaXhGNTBRNHJqcnNMeHdS?=
 =?utf-8?B?bmVYMWh6MTFWKzRkWXRmSjNZeXEwRW4xSXhZT1FLd05zd3hqUG56R2JnQmpQ?=
 =?utf-8?B?b2w0QU03T1QwQUt1YkxKVlcxaUVsU1VpOEp2RnJIMXZTV0RNMU5EWERQd1FS?=
 =?utf-8?B?UnQ1YmJ5QklPbUQyZzJCUE1sUjVWcnBOc0t4bkdOM0dNbkZDMXp5M3Q0N3Bv?=
 =?utf-8?B?clZ3Skd3eisxVFN0VG1PWWZuYzBzYjNhRWR6eDRmdzJTdjRhbWoyYU9pV0Ni?=
 =?utf-8?B?K0NIVFhUb1dMWVJsdS9YZkhEaC9UbEtwOGNLK2NHRDcwVVE5bDlBQTYrR3J5?=
 =?utf-8?B?MmFRZDRVL2Z0RVZ6bmczdDA2aUYwbExwS1ZLU3g2TUhSamZiemdqT0o1d2Zo?=
 =?utf-8?B?c2VEdWhxcHo3RFlYRnhFdTYwQmVrSlVqZHNWSWljOFBpVTlGZ1orUjB5SU9T?=
 =?utf-8?B?NUlxcDU1bk5VYjF3dVM2UU0xUndObmdvWDlGS0dhYmFnczNzRUxtM1JyN2RT?=
 =?utf-8?B?OUJOUG5PZ00yT3BnNVFxQ0VidjNtQ05CSnRBNi9PbmJqUDVNaWlQYjVZOENP?=
 =?utf-8?B?VmJPTHlIWVgwSGRoOVVRY1F6QXExU2xTcWQ5NllZQ2RpUEF5SDJFSzZVMXBT?=
 =?utf-8?B?dFMzV3l1WEZUYmNJLzZkQWRUUVhUWERvYVVueEwyNXhtbEJWRVVlMXlvNjk1?=
 =?utf-8?B?NTZ6ZnVsVHFqRXRmM2ZqaW1lL091eFVwTGdOaUxSbEQvdWQ4WnFoME9vb0NY?=
 =?utf-8?B?bUE3a1N6TkVGQ0NSY3VQcDNqUlZmZ0ZDbTB3M0FIMDhtME1XNTJkc2Fwc2o3?=
 =?utf-8?B?VHl2eFIrMjZJY1VSM1VCclVmM0drbU1DSFNSVEVEYlJZVDV3NGNxZmQvYUVG?=
 =?utf-8?B?WG94U1lQV1BTeWlNaUdMcS9oTUhmN0RNazhCbTJzQlVqQURYUHY4dGh2UmhQ?=
 =?utf-8?B?NGdDUGhDUW9ndWpiR3Eza1VXcXJ6cC9EdmlxN0hSbXUzUm5KVzhpN2RyclhS?=
 =?utf-8?B?RmlBSmwyY2dhY2ZMQlp0QTRuc3lMS3grSFhkVmVUQ1RZcUJZbC9tMWtZVjIz?=
 =?utf-8?B?YXpjTWY0VURpK0FtS203MTB5Z3JBNm9Gc0N4TVVyZ09kR1p2UDhxRkgwMFVS?=
 =?utf-8?B?STExMnZXaFVrdUtPOFFmTVNycWtSeFZ0cnltVkpERlVDak9takgrZlJKVGoy?=
 =?utf-8?B?U1lLZkdWSmxLZFZQUFAxR1hrcjQzekVRVU1LRTBvbVlzbzI0YXhHWEFLQnNN?=
 =?utf-8?B?YUlscHovRENnTW80QW9qM3dZUTl1T2FKWmswMzAxbmJFQ1o3R1VONnMrRTNR?=
 =?utf-8?B?UGFjMFJXZDdKcmtNbHpKQTFVUE9aMTkyY1dOcmtOUTlSb1lBdUFKU21LY2lV?=
 =?utf-8?B?UkcwV3NLT3FQazhUWjBVY3pwUUl3NXVveUtYSm1ZOUdVdkVTMmNLQjM2K0FK?=
 =?utf-8?B?VzZWVFlYTzNuNmN5WUlMNExrdDhFcGlDdEpLTm5ZbjEweWZ2R2pkYkdqS1Zw?=
 =?utf-8?B?N0RQMHZabEx1SnF2TlhLeVB0K3grd2NVMjdad3lBUVRuM0FaUmRWUmdyOWls?=
 =?utf-8?B?TkhrZ0xyRmtPSE5JY2VER2Zid0ZGMThZeHo2cCtJV3NQODAxbk9NNU1Jb05M?=
 =?utf-8?B?bHRuR0w1SWdBRVBPOUxUSXVOUkV6RTZ5KzJYQi9vdGdaSU4xRGd6ZlpKQnoz?=
 =?utf-8?B?c054SVM0YlQwZU81dXdXT2d1RWtZYVdOdVVyOFVoQ1FqU2RYVVhaalQzU0V4?=
 =?utf-8?B?L1loOHB0Vjlzc3IyWUprZzQ0a1V2Wkpkb3B2WlQvbUJoMEZUVlNWMDFTWHJX?=
 =?utf-8?B?QWhmbDNiSlRPVHY1MGRFcTFJNGlwT0RwNUtpdFJERHZxeDFsTnNZcDlNNDR2?=
 =?utf-8?B?azhGWEdHS2FaQzZoNXYySzFRbVFMQVFZRE9XYkFSWjdZMjFqSFlrV21xUUhY?=
 =?utf-8?Q?1YQQf5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 17:08:49.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1536167c-c7e9-4939-af1c-08ddcdf96bef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341

On Mon Jul 28, 2025 at 5:52 PM CEST, Jan Beulich wrote:
> SYMBOL_NAME_SIZE is 124, not 128. Use the symbolic name there as well,
> to avoid any disconnect.
>
> While there correct indentation on the following line as well.
>
> Coverity ID: 1659391
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There's no useful Fixes: tag; the code was imported from HG this way
> about 10 years ago.
>
> --- a/tools/xentrace/xenalyze.c
> +++ b/tools/xentrace/xenalyze.c
> @@ -321,11 +321,10 @@ void parse_symbol_file(char *fn) {
>              (*p)->next=3DNULL;
>          }
> =20
> -        /* FIXME -- use SYMBOL_NAME_SIZE */
>          /* FIXME -- use regexp.  This won't work for symbols with spaces=
 (yes they exist) */
>          (*p)->symbols[(*p)->count].addr =3D 0xDEADBEEF;
> -        if ( fscanf(symbol_file, "%llx %128s",
> -               &(*p)->symbols[(*p)->count].addr,
> +        if ( fscanf(symbol_file, "%llx %" STR(SYMBOL_NAME_SIZE) "s",

nit: A comment at the #define stating it's used this way would prevent futu=
re
"oops" situations when/if someone tries to do (e.g) "#define SYMBOL_NAME_SI=
ZE (1
<< 4)"

Though arguably that would cause a compile-time error anyway (except perhap=
s
an octal literal?), so meh. With or without the adjustment:

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

> +                    &(*p)->symbols[(*p)->count].addr,
>                      (*p)->symbols[(*p)->count].name) =3D=3D 0 )
>              break;
> =20


