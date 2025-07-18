Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FCB0A832
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 18:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048994.1419198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnht-0006gJ-Nn; Fri, 18 Jul 2025 16:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048994.1419198; Fri, 18 Jul 2025 16:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnht-0006dz-KK; Fri, 18 Jul 2025 16:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1048994;
 Fri, 18 Jul 2025 16:13:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us2c=Z7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucnhs-0006dt-Nj
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 16:13:08 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2407::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15eaa08d-63f2-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 18:13:05 +0200 (CEST)
Received: from SJ0PR03CA0154.namprd03.prod.outlook.com (2603:10b6:a03:338::9)
 by SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 16:12:59 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::ba) by SJ0PR03CA0154.outlook.office365.com
 (2603:10b6:a03:338::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Fri,
 18 Jul 2025 16:12:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 16:12:59 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 11:12:56 -0500
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
X-Inumbo-ID: 15eaa08d-63f2-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noEokQ9JVaX2Kb/cYlB9Nh1cHgT8LK6GatPUcBogiCM+Bxh8JquK7NHwF7egVW3f4FA/Gh1AUkTiXnd52kXakOWGWeyRgckqkT9uVTXj9GWF38a+liQe5ijoIfBPVEFD7GWafCi4VDMM4KPyKtuZ3AzI8UapCPMtSA8Js4OHAC1WMCJTPvRzryJ7MWBS2GQxfGkffAV3YDABqPPiseIxQaHQ88KM+DLYO0f5Uwbwa6RtfdV7pevxw6U9mMCqNYwS8hu9Tn5l/xfGqtXEUQ+c21rrGxPnEf/bH34VjUl1+oE2H7RJ+GOAPjDd3l2cYn5C8hPd4gBNkuxvL6nIHDDD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrvjKRv4T0g0fU/sGoHvJfgh2za7p88k7obZYahpJt0=;
 b=XIZ1yySJoAUQtqx4+6VBEs9K9MlZUUg7C3YtjM0vO2ZJztQHUeYhXA5r9gnd1ybI/hc68FVkYGpFS+Swfwx15hmVeq47H87OxIBwWvFXmdwOKg6J7cU2vlWZUHRRwovibZOaop6vKqAAvuXyLywGzgQ+XFPZQezZkbsgpT8o2S4nCgbifS0sqdJTwMzgUA24CVvMlVt51x/wllPcCCjdQGx+zT4BKcD7TUC/MIURT26LIHHxqU32mIYX7d1zAZw282stiRYDqnatU9ngEidC/HHL/nYBei7WKDonanrlQL27zNFX6va6Swe+s/Ai6QQmB0bvCCn9jX0yiZ/x2g3l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrvjKRv4T0g0fU/sGoHvJfgh2za7p88k7obZYahpJt0=;
 b=EmAoYDuLrLfjbzZqvTsXNFVdjqr4YCnEEZV5AGQgbCHz0tG1omslJsVUr7o71vFmpaGaM2EQg8pJHqwa9Q7iN5+vOU/68RlXVvk1r3zS7GOAF5hh57jMJLwUL+tOIFpdvZj2VEQQdGPtAL1sa/ChJcShworxjoYNeS+ykM8ftgc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jul 2025 18:12:54 +0200
Message-ID: <DBFBAURYB2J6.LTV7SKMB1PQQ@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86: Don't allow HVM alongside PV_SHIM_EXCLUSIVE
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250718151214.24835-1-alejandro.garciavallejo@amd.com>
 <47704e30-0f8f-483e-b22e-5cdb767699d5@citrix.com>
In-Reply-To: <47704e30-0f8f-483e-b22e-5cdb767699d5@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 9468ef6e-2ba1-433a-718e-08ddc615f70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlBlMzEzUDdsN0lSdy9IZFR5V0FyMVZZSTdWZ3dLS2pObXk2Y1UwcTJjNU9F?=
 =?utf-8?B?RUxRdE42WnZGVFZ0Q2NSNWExUmJFWHBvTWFhaVE3NEY0Ym9LeHMrOG9vM0pa?=
 =?utf-8?B?cEFjNUdnbStES1I5OEc0Q2kvckJIZy8zNE5sdzB6bnJjYlZESEFEaE1OQ0NG?=
 =?utf-8?B?cVkra2cvOHMreTUzVFRRa0d2R3VwZ2l5cHpmaFN1d3JsUCtEOVZ2eHJSV05D?=
 =?utf-8?B?dDNCZWZlQzBoNGRaejhRcC92dHk2TG9oZXNrTGxid05ZTk5FOU4rU0RibVRO?=
 =?utf-8?B?UVIxcXZUVW0yV3Z2ak9jOWRTa2JJMkIxdjYwT3pJY0RGdVNvSUUwdUJTQ1VU?=
 =?utf-8?B?SlJDK2o5azB5SnRDOU9vTzJOTm01QmRWbGpNSkZDbmJWemZjUm4xcjduWUFE?=
 =?utf-8?B?a1R4cHFOSXhMWHUzNzduaFJ0Vm0wSkZBdnEwZi9zdWhLL2EzdTl2bXQvYmdB?=
 =?utf-8?B?bVY4dHE4SUhBU01ya05GMEV1Yi9PY2J3OHk0dGtZTDMvelN1WjhpT2JvNU8x?=
 =?utf-8?B?ZE1tN3pNQlZ4ZDlxYnVjQk40NHBBSmJrMTRJKzhMdlN2NS96d3p6NnB1ZkZM?=
 =?utf-8?B?eklZRmNkb0JFVXVONldDMXpPZGY2Y1VBeWl4R3hpNEFtVjhhSmxRMHk3UnB4?=
 =?utf-8?B?R0doOC9UbVJmOEs5TThZV2MzMmR6b3JtcTJHYzZ2dmJVUll5TGkvZnU5UG1z?=
 =?utf-8?B?RWNDSTlQa2NEOVpQbGRrRnZ6K3ZGT1E5TkhKN3RTT0tjcXVuL3kzTnNnTGRa?=
 =?utf-8?B?OFFPTzJ5dXZIVEM3d1FsL28rQUdvVzBPSzdOcTU4cUtmVnliZG11RE96MFY3?=
 =?utf-8?B?UVZKQkJnZ0kyQzlhTTZjVzZiNlFya3BLcHgxSitacGp3MEtmY2hhc3MyZ01Z?=
 =?utf-8?B?QnlZK281K1BOMXU1b28yVDNGSWZvOW9ZMmJucTB2YnBmUUlpdU9GZURWTnI1?=
 =?utf-8?B?bDZwM2c5Y04zSzhiTkJZYWdDMHZaQ29uQmdaWU5abjNTT1JnclQ1QmJvN2t3?=
 =?utf-8?B?Y0VxTjNmTGZ4Z0VwS3RRaDBGT1B4aVdPTVVUbC95cVEvUElNd2ZoRTBEYXJG?=
 =?utf-8?B?Snl0QkJyd2ltUTdiaXlua2YveUlyVUtqSlVKcmRQMDN6YTlkMVd2YnByZHRM?=
 =?utf-8?B?RUdVcE51eVh1amJCNXV6VlIwVnVweklMdUs5dS9yWi9GWnc0RXJ4WmdoMVF0?=
 =?utf-8?B?UmVYUFdTTW9LNUF4Y2xPVHc3SzFUMlZEY3ByUkVVRjh5R29BS0dCbkNydVhJ?=
 =?utf-8?B?S2U4OEw3NFVkSlFJeThRRjJmM3pEMDVJemhkeVF1N2V6MHBLTTlvUUxmajJ0?=
 =?utf-8?B?RGovWkxCWlRwOUhEYlZ6aWhoMXlLS2ZhZ2RpMnRPaDgyWndiclJycll3Skgv?=
 =?utf-8?B?M2xvSUpNQStQSkpHeU5LTFB2Y0ZNQ09kbFB3Q3c3aDhwNHF0Uk42OHRoRUdi?=
 =?utf-8?B?TzNVMFlBbm5QdU1aOGNSeHZBclVGajM0K1d1SFNmTXlNQ1E5VGNNaUNPTzRW?=
 =?utf-8?B?aXM5VmpwMms4dXR3Wkh2eWJvaE45ZmFFN3RpYUNKL3ZlZndFaWJLSnlvNTd5?=
 =?utf-8?B?STBvWGFybmh1eDFWaHBScTVGVEZUcWRVNnhXTDdVclBob0ZZcmFaTng5Z3Uy?=
 =?utf-8?B?clNwWlM1THJYQ05Jd3ZDTnFDVEF4RWVHL2I2K3hXY1BZZXNhN3NLcldMZHBl?=
 =?utf-8?B?ZTdIaHhjelVFN0tpRlNaSiswdWE0ZTFrYnNHZTVKai9ZOEFRZkxBb05BYm1B?=
 =?utf-8?B?bk5oVGI0UnB5NzJGc1ordUxnQUJpdEdpbjJ2dTY3bHNhYWNHQndGaGlxT0xZ?=
 =?utf-8?B?VkdqbHd2QkUybTdtMlE0bUN0TnVuY0k5Yk5iRi92ZWJCZjAya3E3VUEydHJx?=
 =?utf-8?B?eUk5T3ovRUFJd2dPdldGcjR1S0dscitBd0RqcHpQU2c2cUtkN1lJUTNScmVW?=
 =?utf-8?B?dVRFYUs0dGRSaGoxTlpBM2NFcTNRRDF3RnhUQUhJa3dlK0drRU1WUk5RWGVt?=
 =?utf-8?B?QUc0MGgyeWxQM3VZQWRtTjQ1dFkxbEVRTVN4czhrZWEvTUpPUVVGWTV3L1E0?=
 =?utf-8?Q?ufheU3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 16:12:59.6590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9468ef6e-2ba1-433a-718e-08ddc615f70d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291

On Fri Jul 18, 2025 at 5:41 PM CEST, Andrew Cooper wrote:
> On 18/07/2025 4:12 pm, Alejandro Vallejo wrote:
>> Otherwise compile-time errors ensue. It's a nonsensical configuration,
>> but it's supriously triggered in randconfig jobs.
>>
>> Fixes: 8b5b49ceb3d9("x86: don't include domctl and alike in shim-excl...=
")
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/hvm/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
>> index b903764bda..f57a87bca3 100644
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -1,6 +1,7 @@
>>  menuconfig HVM
>>  	bool "HVM support"
>>  	default !PV_SHIM
>> +	depends on !PV_SHIM_EXCLUSIVE
>>  	select COMPAT
>>  	select IOREQ_SERVER
>>  	select MEM_ACCESS_ALWAYS_ON
>
> I deeply regret not nacking this originally and blocking the patch you
> listed as fixed.
>
> This depends was explicitly reverted in 568f806cba4c because it breaks a
> lot of things, notably `make allyesconfig`.
>
> We're going to need to find a different way to fix RANDCONFIG.
>
> ~Andrew

It can be done the other way around. PV_SHIM_EXCLUSIVE depending on !CONFIG=
_HVM,
but that won't help with allyesconfig.

PV_SHIM_EXCLUSIVE could be replaced by a PVSHIM_BOOT Kconfig. Combined with
DOM0LESS_BOOT and DOM0_BOOT this gives the full freedom of booting in shim =
mode,
in dom0 mode, or in dom0less/hlaunch mode; and is compatible with allyescon=
fig.

PV_SHIM_EXCLUSIVE would be unsetting DOM0_BOOT and DOM0LESS_BOOT.

Not that I want to do it right now. But it sounds like a nicer solution tha=
n the
current mess.

Cheers,
Alejandro

