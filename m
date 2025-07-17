Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF623B090D0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 17:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047045.1417444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQll-0002jv-Mg; Thu, 17 Jul 2025 15:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047045.1417444; Thu, 17 Jul 2025 15:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucQll-0002hO-Jp; Thu, 17 Jul 2025 15:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1047045;
 Thu, 17 Jul 2025 15:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucQlk-0002Pa-TA
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 15:43:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cad8d4e0-6324-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 17:43:33 +0200 (CEST)
Received: from MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::6) by
 SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 17 Jul
 2025 15:43:28 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:80:cafe::d6) by MW4P223CA0001.outlook.office365.com
 (2603:10b6:303:80::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 15:43:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 15:43:27 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 10:43:24 -0500
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
X-Inumbo-ID: cad8d4e0-6324-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcFWhLyoDiywxy7eCr86egfxaiOblYB/wkgE8xB/wMpbYJL70CGvjzm9sWPaSfzrJykZSIeqzp+0kefHjCl6aPI5Uy7cFHk6yqT24dKFi57okWFfOlGxITmGhBdaPtzFNQZ8C7qcQHaDfvcP69IgIcQvsBE6YpdSwYsXD3jyw5MWKrP694GYfzu08S0iyYqFl8ue48TvXWOQCXXuX3dgDHhTJdTDTCrGzX1KBCLOApxpr4Ov3NONzzO7O4SS07wQDvRUvn9lK9l52bBCs7p6rPPe6yqX8dRgXggU4GwcJ3TqW+Rw4ioMV6gtGfjJvW3Xn+eo1Phlc333fbQ8I2iY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc2kCiDgncNRc4ziQIBHYWA2aU2frSebKj+SyjZpmOc=;
 b=qpiKP5S1EMtexVeeob0BuHhwhij36JlJdXYmjYfaxhBgp41IMTMrF7jWGZFtnHE9Fmj6nxdtseIOzIBZI0kedEZqEzpEd04IXAUxEnZoy/kDxyYbwtpVYGKgje47aMskscd88Ymf935iaLHHiSDP8uW60QCy8GbPxTPhL1BwTOYROHG7gFlDmOXLzSmMuvA/Uda0Vkq+jQJisFza+t49EL3n9JM1qhYO3GzSYvqdz211NasXi6B5yeizPtxQolg6bBcdquGvQmdbtSB8I6B2eJlYG6tBp/kCjadthE48kvpYJDwQAc3f3rPS9jQMdm0SB+4/1A2GhPf0AqjjGK63PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rc2kCiDgncNRc4ziQIBHYWA2aU2frSebKj+SyjZpmOc=;
 b=nVMXqpxQUzJfwIrGq0aLeSXZvn8TRbOhP5uQ0JjgrAgFh3Bhzf1fBW3my0fjR3c0VgiDh9dab5/1KvFdNZQItsf2D3Fa2K9y5Lumk1CLPeEs3DrTPUUlT3H/Ey1zecsHmHarRtlXjKlV+ybqWLf8x+PC0TbfL4FroOtGRqk2rd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Jul 2025 17:43:22 +0200
Message-ID: <DBEG1ORR4MYS.3JV34VYUK2T6G@amd.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>,
	<oleksii.kurochko@gmail.com>, <roger.pau@citrix.com>,
	<sstabellini@kernel.org>, <dmukhin@ford.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v1 01/16] arm/vpl011: rename virtual PL011 Kconfig
 option
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, "Orzel, Michal" <michal.orzel@amd.com>
X-Mailer: aerc 0.20.1
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-2-dmukhin@ford.com>
 <da16500d-f589-4396-8ad6-78cdb443da60@amd.com> <aFpSvMzxrNrgQEVB@kraken>
In-Reply-To: <aFpSvMzxrNrgQEVB@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d95fc7e-2ddb-4853-3043-08ddc548ac71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1ZsRDd6ajF4cUtybzdSa2NYZ0FVN3VNcDlNWVdrbjNhRnFRSmNYMzFPWVIz?=
 =?utf-8?B?RDFVcXZMY202QVJyZzBCdTRDdzEzRkszdWVad09mdDlPc1FRQXM2eWk4Kzd4?=
 =?utf-8?B?K3llZXo2dXVLZ3hIR2g4ajBhaFNsSUgxdDdpa1FRdjV6U29vWVduUWFxdXpM?=
 =?utf-8?B?M1JucEM1ME5mRFdlT2RqUVJ0elV5K3RISlE5VENSYkkza1dJNThKWnJvQ1N3?=
 =?utf-8?B?K3UyQW9LTWRaNGwyODNEb3Z3RTNmZm9UUGhJRkROci93Tm8rcDVUNERLMHpV?=
 =?utf-8?B?T2phTmNXNGp1eFlob0QzM3lMd0FUUGpzOHorL1BqV3B2d0dYQUFGVEtsUFh5?=
 =?utf-8?B?K1orUzd1NHJLNUxVN0FVUlp4SUUyUW9wTVV0QmtnR014ZzdsSkVSMmEvVHJS?=
 =?utf-8?B?Q2dUT1NmNzQwUml0bWFMVEFTOWt6ZTZVSi9SRkJzUXQ2b1ZYQmFuVWRJUC9l?=
 =?utf-8?B?TGhTRGRTMzMvQ0Z1UTUrd0crRm1CYW4yNnZydEpMeVo3Rk51ME1rTmhXWElw?=
 =?utf-8?B?OXZKM0lFK1psbDBoOW5teHpUOVFOaTA4OTYwa0RIN2J2VC9yM2Fram5mMkVq?=
 =?utf-8?B?b3hONFZ2Q3V5ZWNoWXc5Qjc4QjJwNzBjdUI1UjM1eUhKY1JjWWlNQkQzYU9Z?=
 =?utf-8?B?emp3aDBkb2hnZXViMGhiWmJiSXRxMVJzZDNVajJCM0R6cFpmWG5XN1dtaitL?=
 =?utf-8?B?QlNybkk5UEJBMHdRM3VLakFJMTFKVlJ1T1hRdE5sakxMcWlWaS9URUtJREpO?=
 =?utf-8?B?Sy9zMzIvbjQ0dldsbDVKTVFITzFuRUFpRUl3WHhQY2FiMWxxekoyTW5vT2x4?=
 =?utf-8?B?Vng1TjNpMk5TbUpNcURXQWMxY2VHa2E2ZkpCVUxxSUdTNlIybjhseXNDNG1G?=
 =?utf-8?B?RDdmUDZCR0lmUy9Mems1VkFaSzFmSzhyMG9qa1pjRVl1WHpYRk5hWml1Y25q?=
 =?utf-8?B?a2RYRXJYZmxuT0p1ZU1EMHFVNC9IbHhHU0o1WEo2TkFUNUFNUlZURzVzRTdv?=
 =?utf-8?B?VUdERGpqcDI1YU5KOHRNTUVqQ2tUVi9MUVJ1c1J0UWRERklzWE5LZlg5ODBF?=
 =?utf-8?B?SS9TZGlwQzBCMm9ZMWU1RjJEamZZOEp1ZjRYUE1uK1RuRW1CaFlzYng3Wnkr?=
 =?utf-8?B?WWx4RHp6RmpJNHo2WnJBYkFLZDJMTDVuMDBpRkZ2OEx2U3ZwUkY1SVJTUDdS?=
 =?utf-8?B?VHhjOTZQUzY3anpyTkZzcFFKYkpVWWh4Ym56YUkvT2dZM3gyTjJ1MVVDWDN6?=
 =?utf-8?B?SklPdzl4dUVSOGJxOVFEdGFlNmNzN2dGdWZjc29rTDVtbjR1by9EMFNFTVZE?=
 =?utf-8?B?eFQ4VmZrZzBRZEpWanpkandJMDBMWWFlUngxeTBtNXNZU0x4bjVXSnpjQmFv?=
 =?utf-8?B?QXB4MHk5aXpLTy9lUVdWRFFiVklTclM0dWJmT2hwQ0JrYmRXVGt2TXlVeTUy?=
 =?utf-8?B?V1ovTmJDU2RJbGt5K0dpWFV0VVhSa1RIeGRxRDFJd3VET25TMG9nZkpVQTFO?=
 =?utf-8?B?QllqcHNUM2VqK2VmSFIvM1JYMDZsT3RGTm5NNzNhcXA0VWd0OVFTdVRKWUZh?=
 =?utf-8?B?bTI0czB3aUJIU213eUZOZWptbC9jRXVQem9HL29qekRudlRWWGg1Z3pnM2tn?=
 =?utf-8?B?R1hoV0hXaXNqZUZPa3poU0NNVENNQnhQOFZINHBLKzE1MnZ5YUlpOWRESUd3?=
 =?utf-8?B?WHUyVEdmUkFSTnBPbmc2YjhlTXNqMllYRXZqdlNaSytSQkdFSUJPVW5GTGN1?=
 =?utf-8?B?TzhQaHc4R0Rac1JneFNyRlVBbGx3dzQ0a0dlVmY2aHZnSUFqbG9GVUZjcUpK?=
 =?utf-8?B?NFJIZmhtaXFUUzRYZVZIWXd3VnIyWWhXVFQxQWZBZGFxWTU2b1RWS09LUUh6?=
 =?utf-8?B?dW5WbmFORms4cGEya3hjdExsSGZSaTY5UndKaTIvWTlhLzVoaUhVTmhtNnhF?=
 =?utf-8?B?TmV1U242blY4S3Jyckx3WUxjS2xNc1AyMjdJSmFCck9hR2FFdEl4TWFlZTBa?=
 =?utf-8?B?dkRVbG82UkQzTXRIMG1oNEt5TzRzbms4MXAxQVpMYmlFbGdtQmZ6a29DNUsr?=
 =?utf-8?Q?lOKTX+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 15:43:27.6552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d95fc7e-2ddb-4853-3043-08ddc548ac71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370

On Tue Jun 24, 2025 at 9:24 AM CEST, dmkhn wrote:
> On Tue, Jun 24, 2025 at 08:13:08AM +0200, Orzel, Michal wrote:
>>=20
>>=20
>> On 24/06/2025 05:55, dmkhn@proton.me wrote:
>> > From: Denis Mukhin <dmukhin@ford.com>
>> >
>> > Rename CONFIG_SBSA_VUART_CONSOLE to CONFIG_HAS_VUART_PL011.
>> Why? We emulate SBSA UART and not PL011. Despite the similarities (the f=
ormer is
>> a subset of the latter) they are not the same. I find it confusing and d=
rivers
>> for PL011 might not work with SBSA UART. Also, in the future we may want=
 to
>> emulate full PL011 in which case it will be even more confusing.
>
> That's because the emulator is called vpl011, but yes, it is SBSA UART.
> I will adjust to SBSA, thanks!
>
>>=20
>> Also, why HAS_?
>
> My understanding is that HAS_ is the desired naming convention throughout=
 the
> code (not documented, though), e.g. all Arm UART drivers are gated by HAS=
_XXX
> (e.g. arch/arm/platforms/Kconfig).

HAS_ is a non-selectable property dependent on the arch. Think HAS_PCI, or
HAS_EHCI, etc. IOW: HAS_X means "you may implement feature X on this arch",
which is why some options have X and HAS_X variants, where X is selectable
while HAS_X is not.

Cheers,
Alejandro

