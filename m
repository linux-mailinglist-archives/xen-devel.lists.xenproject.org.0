Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A60ACB09D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003449.1383006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5pv-00052p-G8; Mon, 02 Jun 2025 14:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003449.1383006; Mon, 02 Jun 2025 14:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5pv-00051R-DF; Mon, 02 Jun 2025 14:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1003449;
 Mon, 02 Jun 2025 14:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM5pu-00051L-Cm
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:08:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2414::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b77f43-3fbb-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:08:21 +0200 (CEST)
Received: from PH0PR07CA0104.namprd07.prod.outlook.com (2603:10b6:510:4::19)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:08:16 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::59) by PH0PR07CA0104.outlook.office365.com
 (2603:10b6:510:4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 2 Jun 2025 14:08:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 14:08:03 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 09:07:46 -0500
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
X-Inumbo-ID: 09b77f43-3fbb-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7d5grMKwYOQfwC9YS4Wqr+19iwlgYbkjPypw0o6TQFnFWmunL5GHCSqrz2VnJEf9k4fE8exmQGle32Dk52m5K0eO64HXxPMamcRsRPSdUV2cLi5bPivv2X7EDwiA1wn4aZqEM3Pb+430ZLYu/fWnEGOn9ABBIRLy2h2VaPZ8+zHU/OpXFmHsiFNWpCXL3elZ1I7lYAgMWAsp60YJg/KR+Nf4efxZkcBYnFkNkIWOCBml8yQxyOUf4YfjoGpSwOccbv82OY/5ztZ+2P/uhFcRc+drbCmAoJ95msyPojGNLDGdqquaTPnRnKi7c1hctnds2Z2xCV/xRXTpLJ0rVvZ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRduVKyxGWOIw04J5RNaOAAl08qw4iMH6VZDnrnwcVg=;
 b=d6ODP1Fs1npgbd3yAUFgezsnDD0KrY6aQlbXpH9a40bx110sfSdVtDoOyyHYSAXkN6jXnaQ7L/JfmjCZU+1ClR9WqJMNHVcDWiJ+x6vDy1OTeIC6xnl0/JCrT3fchBdtXLMc9w5rC1CiWBCyH/C/8ICD7uYh+RCxBXEHtDCUAKw9hyu3alj8oyVC2X24zB8XLVtwyrQxPAcWK8pry66vMIf/TjSOaljMz5afHAmFkKtQlxnNhioIkiIag7R0TS8vJCgYggjmElczrR0HvYOhzkVCPfjViooTCsxiyvWsXqs8tkA3a9zKztw+BFFL4GTO1MCL2mI1SkIiWODSRRsBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRduVKyxGWOIw04J5RNaOAAl08qw4iMH6VZDnrnwcVg=;
 b=gmIdtig5aDMHoDMr3HhxDVbwACWLba+pttKY9zGFOO3OQ40qpv2yuNIdZvGlxtaGi/F03wMDevX7DAvi1RDG0Fhj0et2oVk2jM1tAxhvXk0FZ9ZvR6QM1/GGj+cm+Pgm6u+TBnHGtcDpxHh31hZU//GBMrOdNyWYGg44o+zl9Qs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 16:07:45 +0200
Message-ID: <DAC3TYQK2M5S.2PVB4MBQ8O1SC@amd.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 05/19] arm: Remove dependencies with membank(s)
 definitions from setup.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-6-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301748170.1147082@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505301748170.1147082@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|SJ1PR12MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 4777a4fe-5bd6-481e-6b37-08dda1deeafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXNuWXp5b1pEc1pDMUVPTEVXa3YvY3JzaWpacGM2RHRYTlg5V0VaWE5hSHpB?=
 =?utf-8?B?QVFYWWZVbUZmeGRucXEwMEJkY2tldDZRb0RHWUZDdC9ld3NBL2g5TktOTU9H?=
 =?utf-8?B?WDhLZDVGbTFobUE5bWRyVHp1aTVidkRGamYxenlPTU1NV0w2TlQ5L3NTaXI4?=
 =?utf-8?B?a01KVWhuWDMwZXZGd0lTOTBNbzdUVnBWb0tuWkdJd2RuRm5yMFdjbVFTSVhm?=
 =?utf-8?B?aEY0R3U3Q01BVnNYc0thM0JwSmhKVFJUZzFxV3lpVTRJRk8rYzZDS2RHdTEr?=
 =?utf-8?B?WVNzYUZjWXRkZ05RQlI2ZGJleGo2Yk9sdzVoOFNmbHVMQzNjeGNvNUJuVGhV?=
 =?utf-8?B?cHIxOHJzUFRvLzB1d09ndWlsN1hTSXBpd0tFWWJXUDlGdE5OZFpkOHRZUVp1?=
 =?utf-8?B?TFJGaTJod2JadldrTDBwV2IyZmVIcHdwQTFpRDQzdVZrbjl2UG90dnpjSmxC?=
 =?utf-8?B?RkRBOU9NM09od01ESnlxNkJJOTNudzM2T3RnZ2F2aHhTZ0FvUk9LM1dYdUl4?=
 =?utf-8?B?RHVPYiszWEZrOVVJTlhEdEZrTmI0dXZORi9CSjRrbWdienZJU1BJWWZQL2FW?=
 =?utf-8?B?bXlHdVNNK21NYkFydTlBdW1PcWFtb0VyTU1OaEY1T2ZDb1ZqYjZaNHBlUU10?=
 =?utf-8?B?dEJOVG9hc2FEN0R1c3QrVjlrcmZ4cTRIY3duMVBVUVE1L1pocG9WVmZ1cnFR?=
 =?utf-8?B?Sm5GSVdhVkRBTXh0TGVRa0dvbis3aGVVejZJbXJaM0grY2pEajYrejY5Y2ZB?=
 =?utf-8?B?QTBsMTFSZy9RQXMzdi9hbkhJTm4wVjZMWTIzc1h4L1ZYNklMcnJyd0F5czlx?=
 =?utf-8?B?MWlUS1J1ZXlEV1JVTVVwUUlOYUxPRTRHZ0x3OXYrOGpMN0VZdUJxZDhjaFR6?=
 =?utf-8?B?cGpPSzFaZUdLS0tvNG5uTnNwT3NHUTRxMTVTTEdOSWIyUnRHQ2VoZFBUbk9F?=
 =?utf-8?B?SlpodE1MNjhBUlVHaDRrYStUN2RveXlyaUllUlpVdmdtU2JRL29kR0ZZcTE1?=
 =?utf-8?B?V3dhZ2lvKzhZSzJ4cmtDaytZWlVCQ2Z2cVZCV2d3bmhQN0VVdGlvUUsxRlh1?=
 =?utf-8?B?QUw1Qnp2eGdtNnBlZU5OM2NCUS9YNjBndXppcGZRTUVFTFMrZFd3amdMcmNU?=
 =?utf-8?B?Wnk3ak9oeHBzYkNRcDU3dFIwc205TFhpUUZNREZHbnBlRTFzUUhFSjhPMTZa?=
 =?utf-8?B?K0l4K1lZblVha0lqSnRGb3RWcFlSOE1uNWRJTzM3a05QNkVyMXV3Z0xqbDdJ?=
 =?utf-8?B?UHhEZktndU9Dc1NFc002QVJPNGVLTER2QjRHY1hGQ0IxNXVOdkJLdFBTNFB2?=
 =?utf-8?B?cW9HUlQ3UlIwQUIvd1BTL2VmSlpqQXcyMUw4U0FsRzVZdE5UcGo1SlUwT01M?=
 =?utf-8?B?NmtyWDJhMmpmc0hVekpWa1AvUjZPQkRTOHI4alNLWTF6SVJoWHRuVlVvZlZK?=
 =?utf-8?B?RU9ZOVVjNmhWSlZldTN1T0EwYmpnNkhTTWtmQUJzYkJ5ZzlSaTJDVFo0OFdu?=
 =?utf-8?B?Vlhjak0yeGkzOUloZE93RzM0ZlFOZ2xkcmpoOHdzajNnNjRaVjFwSXlpQ1A2?=
 =?utf-8?B?OTcvcnc4K1NtT3Y2dUdnS0JUblkyMHQrY0MvbU9kSUUrWnMzaytoa0phUGYz?=
 =?utf-8?B?azFFcVVxSSs0QW1aZUViMmxBTk0vWjVJdHNPU0pLS2thRHBjeVIyT1Qyc2FF?=
 =?utf-8?B?UThFT1BRR3hqWGlxSmVGdFREbkdacHNyc2RZMXJBbVRDMHBIQ0tYVG12WTBv?=
 =?utf-8?B?RnJxQlhyUUlIcmplbkdmdTRmaUJzVmxNOFN4dGlXOGZibEZXTjFDMHY0blZm?=
 =?utf-8?B?QXY0UU05OEFtbTByWlpxc3hBelB3aEZ3K1d2WDF2by9NcnZrT1p3V20zUU5P?=
 =?utf-8?B?bkNUS3ZIVWw0RUxUS09LeXFWU1E4anVWVWd1eThlZ0MvRklWQlVOdFVDcGZ0?=
 =?utf-8?B?U29jRExnTS9MbWtHbU1XOFZiNG5waEtTdTdiTytxT1JkSEhRVFZiSmkzNldm?=
 =?utf-8?B?bkpSbEE5aXdDRXJPdkIrcWR0clEzV04xWHEzZW1aR3phTCtYa0kzQmdCNXRC?=
 =?utf-8?Q?aU3/Kd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:08:03.9011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4777a4fe-5bd6-481e-6b37-08dda1deeafa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266

On Sat May 31, 2025 at 2:51 AM CEST, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> ... as they can be forward-declared changing arrays for pointers in the =
function
>> declarations.
>>=20
>> No functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/arm/include/asm/setup.h | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm=
/setup.h
>> index 6cf272c160..0f9e531a34 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -3,7 +3,6 @@
>> =20
>>  #include <public/version.h>
>>  #include <asm/p2m.h>
>> -#include <xen/bootfdt.h>
>>  #include <xen/device_tree.h>
>
> This change breaks the build on ARM:
>
>   CC      xsm/xsm_policy.o
> xsm/xsm_policy.c: In function =E2=80=98xsm_dt_policy_init=E2=80=99:
> xsm/xsm_policy.c:71:30: error: implicit declaration of function =E2=80=98=
boot_module_find_by_kind=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>    71 |     struct bootmodule *mod =3D boot_module_find_by_kind(BOOTMOD_X=
SM);
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~
> xsm/xsm_policy.c:71:30: error: nested extern declaration of =E2=80=98boot=
_module_find_by_kind=E2=80=99 [-Werror=3Dnested-externs]
> xsm/xsm_policy.c:71:55: error: =E2=80=98BOOTMOD_XSM=E2=80=99 undeclared (=
first use in this function)
>    71 |     struct bootmodule *mod =3D boot_module_find_by_kind(BOOTMOD_X=
SM);
>       |                                                       ^~~~~~~~~~~
> xsm/xsm_policy.c:71:55: note: each undeclared identifier is reported only=
 once for each function it appears in
> xsm/xsm_policy.c:74:22: error: dereferencing pointer to incomplete type =
=E2=80=98struct bootmodule=E2=80=99
>    74 |     if ( !mod || !mod->size )
>       |                      ^~
> cc1: all warnings being treated as errors
> make[2]: *** [Rules.mk:249: xsm/xsm_policy.o] Error 1
> make[1]: *** [build.mk:72: xsm] Error 2
> make: *** [Makefile:619: xen] Error 2
>
> The rest looks OK

Ugh. The series passed regular CI, but it must not have had XSM compiled-in=
. I'll
sort that out and re-send.

Cheers,
Alejandro

