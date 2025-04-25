Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D957A9C860
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 13:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967818.1357548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Hh7-0003lr-I7; Fri, 25 Apr 2025 11:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967818.1357548; Fri, 25 Apr 2025 11:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Hh7-0003jS-Ec; Fri, 25 Apr 2025 11:58:13 +0000
Received: by outflank-mailman (input) for mailman id 967818;
 Fri, 25 Apr 2025 11:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8Hh6-0003jM-Aj
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 11:58:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d02f663-21cc-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 13:58:08 +0200 (CEST)
Received: from BN6PR17CA0046.namprd17.prod.outlook.com (2603:10b6:405:75::35)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 11:58:04 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::88) by BN6PR17CA0046.outlook.office365.com
 (2603:10b6:405:75::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 11:58:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 11:58:04 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 06:58:03 -0500
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
X-Inumbo-ID: 8d02f663-21cc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgttrMIyk4rQX77V/i4jOaFmIHVC5r9ugw043Hkie2W1b6+aVCDMiaohWCiIFVYruFhk8NdDCdkySmX3JXyrp2ipJ3r+CrRap4AQVjiCGHkEC/+i2EuxkMPQ2GdDfC2I5hXx9JmRdYF27+JWIeWL91onmzUlcV/CF8Jtk69D1B7oC+N6ToyhWTgEi0RR6Hh1vYoR9Zq/u0V08pZDU53eomgfFF+0Op+XvhW3YvBJGvXtD6LKkr2QOu4uEZCc5dOU2ppe66N9SH693j7EPOG1InMAmeRbSZKWMHlkVzGt7BWuwam48HDicxq9Kzvzz2JPDs86M10jgVM3QUKnzoSvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKOD5KjaEapNHz+btHLAnTl7OoP46BCObWtszpMDcDI=;
 b=J16JRk2c5fIiLdAZENGfQJ89Xd+niZ6iXhjcpKKhKDvMDWBwNYZ4U4bUFEykX3J9xvK9mhmb8CAShq+/KKiQWPF2FE8Fh3gIQ9UZ8GUhpe11ak4Hak3TVR0iprEQ52rChp7qDQp0Dr6OBGQTWUk/fa8jx3u69aa91bJMmGB7OeYI00KGTR7KP73gR9wLdGl7IzFd5e+FfBxp0ors+OYF9ogOrmefF1kWhBChNRIY9eD1n2neRbGgcilpXH6H+gFzymZJSQciFaNJJ44nMrdTF33XXiU0UNp3a147glV6phivtYe9kOXFm63967vR5KPM+XeAHcxNtfefpDyJk0jZvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKOD5KjaEapNHz+btHLAnTl7OoP46BCObWtszpMDcDI=;
 b=NmzbuE/G285ZUmBQ8h8ifTT2oaH9RH962rMi1IRxQt34DfDgtYHbRCtWtF0YiTn9FygnHbLh3wnaTQPmCirjuXpUIZQl/kht50glD6/2/WdCPLZV4uUxGPf84XtOr0hrNABzuoIJpC+xyRzm6Lr31nyhBNOwghMgKnIOXWo/1so=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 12:58:01 +0100
Message-ID: <D9FP9XTIH5FT.2SYZUNG1UO138@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: Re: [PATCH v5 00/12] Hyperlaunch device tree for dom0
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250424161027.92942-1-agarciav@amd.com>
 <aAq41+qsbuJP2JOj@kraken>
In-Reply-To: <aAq41+qsbuJP2JOj@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 330fc57a-f17a-4485-2e85-08dd83f06fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHhZZ0JQcGZvWHRIYk85QXM2ZElXUjBYd25pUzl3UGlYOFo2aks1eTV5aE5C?=
 =?utf-8?B?TDE4OUlRaXZVTnVuMDVGcFZTUmpoWE5Ed1ZoL0xxOEM3MGFDN2MzdkQyUTBw?=
 =?utf-8?B?aDdjU0g3YzZlSHB1aGxkRStZV2dNN0oxazNUUDFKVXF5K1VjS3h5SUpVMnA1?=
 =?utf-8?B?NnBnMXpRR203M3Y3Um9pcFloV3JRU3A1UHJoVmd2RGNLUUlyUmlEcVh6U2Vn?=
 =?utf-8?B?RkhBRG5kakFMcU9hUE1UWU9pMlJsamdkdENXTHNMcUMrSVNCelZpVmt6bVZ3?=
 =?utf-8?B?YUNPaWFObXdRTjZnNGlBTG1QNWtielI1YUthOVV3eGNiODZqeTJRZWVwdkRL?=
 =?utf-8?B?VFNlZ2xKWkhwSFp5Y1NrMFd2cGp5akUyWEpueVlXYTBhZTkrSm80U1VyS2hl?=
 =?utf-8?B?YitWVGJhUkpNbE52aTB4YU5hVW0vWE1DUExpQi9jRHNxZHdSWUpqWG1ld09t?=
 =?utf-8?B?amdYc2x4M0xQTkZjMmluU1FYMW13QWxnMWcwczliMFNjUGNUVVZReDBzRkhi?=
 =?utf-8?B?M1AxUEFZYzdma2xodjU0UnFaSDAyVy9xdnlLWXZpYXBNZ3pJYXFUVmFLOFVW?=
 =?utf-8?B?WlpRQkNoN2RPRmY2WTFpU1FQZXpENi9QWW9BSlhrNVBuanNxMWR3dUVmZXU5?=
 =?utf-8?B?RXVsSlNkeWlJSXpzZ05ESTRQeDNaRUI3MHBwOEZwaWp0MXdGVzUwSVFReGM0?=
 =?utf-8?B?NFlxemMrZ2dSbUJ3Ky9WTzdIZm1EUHFkS2ZrMUtibStTODB1QmgveUQyR1NB?=
 =?utf-8?B?cERlZlZJR216WFEyc2tVQzIreC9iSUpXZzdSd3RRR0hudWZrQkRlYm1hNmlD?=
 =?utf-8?B?OW1HTFVnZW5OTGxiWGJ2V1JRaEd0MkZ1TmtraXdBVTVFRG5LRExpbGRZMEFM?=
 =?utf-8?B?WkloTVlKR0xvSTVwT1NsU0RDL0x3Vm15TFpaeHNmSjJmV3JtcTFJVFdTL2kv?=
 =?utf-8?B?T01QVm1tV2NsajNCaTQ0azZNTFd3bSt2eWxpMGViNlZMTDlTSHBSUXVocURL?=
 =?utf-8?B?dE1zS0N1a2hobjdFZzJhbFZPM2dmZ1dUNnpxcER0cjhENWpDcWg5Zmp4aDhx?=
 =?utf-8?B?QjNpa2FWRU1nRjUvVzVHakdHWjFzMHBtUTRWRFdjUDNBY3ZTaUhpenR6dUxs?=
 =?utf-8?B?MmRva3BiQmZ4dVdUcjNFaGNFUnpMMlZPVnc0K1kydFBhUTZhWnhjVkdONWxT?=
 =?utf-8?B?TDlvbjZPNjZyWWVwMkt3Z2lGMURFR1ZKU1JrWEVVT2xQVjZuVGNadWxxNjls?=
 =?utf-8?B?RnFOM2k5ZzN4Nmpnb0c5bUpldHMweG4vUHJFeVdnTXN1YlQ1MDAxeUpPZ3V1?=
 =?utf-8?B?S090dGl5R0pMd1BUb0thcm9sVUZwN0ZqSHowcW41bGR2N1ZOT3FsRVMyWWlF?=
 =?utf-8?B?SEErc01YQzA2cFhaT1Z3QUxpQzEwckZRTU11OTh0dTI5RVY5MjdpVnZqVXNY?=
 =?utf-8?B?cmZzMzZwZWpySno2RGRwM3dKeks2MXlIZW9IbCtzWEVkMS9kb0xGb3dzMHFm?=
 =?utf-8?B?SVQxUmNXWnMrMUVMbEdiemU0V2xMTCt2ZXB5TytZWEM0YjRFRk9rZlV6aTd6?=
 =?utf-8?B?U0Rtd1JLK2k3NzJBRXB3cU1hN2dlbzBhTm1vTUU0dEJGZC9aT3VjWnBDOW9L?=
 =?utf-8?B?WWtBMStueHBsUXBwbGVxRUNvSXpjenZFeVhLVm9JbG9tampNczF3RklVOEV4?=
 =?utf-8?B?d0Q1Rnc5cHYyRXJYeXdjMTZVL1B1Y2w4TVlYMEJmeDNRdTUya1E2Uk8vWTM4?=
 =?utf-8?B?LzBjV21vMm9teUYzbmhyN3N6VEhjRDFIN3J0TUIvU1BIOHFDTkhPZ2NXWDdO?=
 =?utf-8?B?bGx0VXRFZzZnQWZZRjFDcTN5b0RTM2ZCMEVNWWhVdmlYd0U4ZW9GS0hIZzBF?=
 =?utf-8?B?VkNYWnNwYUl1azJyM2Z4a3NoVGtqdTBhVjhQZHIxOG9IUW4rcFE1QUJFN3dD?=
 =?utf-8?B?SHNHT2FGenczRDZmcURRK1hERmhiV0FqZjZJUnFBYU9kc2M1R0NMeUE4RGtx?=
 =?utf-8?B?aGU0Z0tRdzdYQ3F6djVpRzZMYVc4Um1DZmh3Sy94UXVITUZFR2NnT2VrbEFV?=
 =?utf-8?B?ZEtNVFNrbUdYTkpSSm5KSnBIaWNqSTlHaTNPZz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 11:58:04.5372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330fc57a-f17a-4485-2e85-08dd83f06fb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136

On Thu Apr 24, 2025 at 11:19 PM BST, dmkhn wrote:
> On Thu, Apr 24, 2025 at 05:10:10PM +0100, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> v4: https://lore.kernel.org/xen-devel/20250417124844.11143-1-agarciav@am=
d.com/
>> v3: https://lore.kernel.org/xen-devel/20250408160802.49870-1-agarciav@am=
d.com/
>> v2: https://lore.kernel.org/xen-devel/20241226165740.29812-1-dpsmith@ape=
rtussolutions.com/
>> v1: https://lore.kernel.org/xen-devel/20241123182044.30687-1-dpsmith@ape=
rtussolutions.com/
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D Original cover letter:
>>=20
>> The Hyperlaunch device tree for dom0 series is the second split out for =
the
>> introduction of the Hyperlaunch domain builder logic. These changes focu=
s on
>> introducing the ability to express a domain configuration that is then u=
sed to
>> populate the struct boot_domain structure for dom0. This ability to expr=
ess a
>> domain configuration provides the next step towards a general domain bui=
lder.
>>=20
>> The splitting of Hyperlaunch into a set of series are twofold, to reduce=
 the
>> effort in reviewing a much larger series, and to reduce the effort in ha=
ndling
>> the knock-on effects to the construction logic from requested review cha=
nges.
>>=20
>>=20
>>=20
>> Alejandro Vallejo (1):
>>   x86/hyperlaunch: Add helpers to locate multiboot modules
>>=20
>> Daniel P. Smith (11):
>>   kconfig: introduce domain builder config options
>>   common/hyperlaunch: introduce the domain builder
>>   x86/hyperlaunch: initial support for hyperlaunch device tree
>>   x86/hyperlaunch: locate dom0 kernel with hyperlaunch
>>   x86/hyperlaunch: obtain cmdline from device tree
>>   x86/hyperlaunch: locate dom0 initrd with hyperlaunch
>>   x86/hyperlaunch: add domain id parsing to domain config
>>   x86/hyperlaunch: specify dom0 mode with device tree
>>   x86/hyperlaunch: add memory parsing to domain config
>>   x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
>>   x86/hyperlaunch: add capabilities to boot domain
>
> One general comment w.r.t. naming notation in:
>
>     xen/common/domain-builder/fdt.c
>     xen/common/domain-builder/fdt.h
>
> Sorry, overlooked that earlier.
>
> What do you think about using fdt_<something> notation for all functions =
in
> fdt.{c,h}?
>
> For example:
>
>     s/detect_fdt_kind/fdt_detect_hyperlauch_node/
                                         ^      =20
					 kind?
>
>     s/find_hyperlaunch_node/fdt_find_hyperlauch_node/
>
>     s/walk_hyperlaunch_fdt/fdt_walk_hyperlauch_node/
>
>     s/process_domain_node/fdt_process_hyperlauch_node/
                                         ^
					 domain?

Assuming the two nits above are mistakes on copy-paste, it sounds
reasonable. I'll wait for some acks on the rest and resend with those
adjustments if needed.

>
> Other than that:
>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>
> for the series.

Thanks a lot!

Cheers,
Alejandro

