Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3454CB0A19B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048526.1418748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciz4-00055o-DU; Fri, 18 Jul 2025 11:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048526.1418748; Fri, 18 Jul 2025 11:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uciz4-00053t-8m; Fri, 18 Jul 2025 11:10:34 +0000
Received: by outflank-mailman (input) for mailman id 1048526;
 Fri, 18 Jul 2025 11:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us2c=Z7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uciz2-00053S-OZ
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:10:32 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2417::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfb224d8-63c7-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 13:10:29 +0200 (CEST)
Received: from CH0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:610:75::7)
 by BN5PR12MB9463.namprd12.prod.outlook.com (2603:10b6:408:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 18 Jul
 2025 11:10:25 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::b9) by CH0PR04CA0092.outlook.office365.com
 (2603:10b6:610:75::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 11:10:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:10:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 06:10:21 -0500
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
X-Inumbo-ID: cfb224d8-63c7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdDWz08//BXrD1v4gGWkX5WYdLZ4Me8pk67IkQ4oXvF4iq8GmQfPBAIJYg4hc1gaYMuV4oTwYAHJrk76sJlnLldZxsEq5ktIy14HkVn/7XxM2gRc8bHZgLz0GZ0Xj9SSCfRA1FI/iD96OsTFF4xP8l3S+sA2PQqUtj/u4EwVAERCkZpZPWTQixuEGN1zRbR94Yb5fhVq8Zudr/66irs5+zECHSiTky3hc+SEIfW1QeZXPsb+WRD23KxMLzSDtxpjDtUr3BWS9AOdLNuIhtog3MJqWaKylIZdwgbpidueHZAg0gmb54D/rj4dQCnSIFNXnzDNkRYC0WIoLeF5zKMEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJTBfWEaGiX3y0rhqEGGFJVXoA7WL02sQF8h+W9b5o4=;
 b=VnI1JT3T/AtlDFq0F/vKbSeV04zikbFZLxh6fkxvCubsD+DF4Hq9nsI3zebTfgDeNDQ6DZNawgZ+vBBz17A5M9Mu8kLmnAPvFVYznK7Mo46OTj27tt906jymKWPXuVEy1kFKXuyNHA1eW8whFpV4RIx+72C1WTaH9Hjdq0iZRxMyzECttN+UXRTUl/wRos3uErCz5tmr2ghkZZ94X3CLsVrhkS6+rrbDDIPRU4vqJmQ4gdjSw/px118A4syMsdwqVyn1cgTBUayUVr57+t4V1paoJiBSazaxLbGcGhm3QnrsyV+hl/y8RukwdTqsy30qi2pAB3ramRq0V7cN8OCQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJTBfWEaGiX3y0rhqEGGFJVXoA7WL02sQF8h+W9b5o4=;
 b=meTzUSbcPKFqu2iAPa3CAi6KcMx2y1nUNn979SH5FOhpV1NFiiKaT6d9ZwO5X4tQsoEziO9Eu8fHVxBmbx8NP9b7sVMct5OSrrc0hdTNOJQ52rBD8a/OMigZWgiOnxapfiuc0TDiTETYLlyQpwp2Dl/tTQltpxWsb7p4jb8lHf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jul 2025 13:10:20 +0200
Message-ID: <DBF4V6KQQNHV.UHH9OI7BR3QZ@amd.com>
Subject: Re: [PATCH v1 01/16] arm/vpl011: rename virtual PL011 Kconfig
 option
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>
CC: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	<andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <oleksii.kurochko@gmail.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-2-dmukhin@ford.com>
 <da16500d-f589-4396-8ad6-78cdb443da60@amd.com> <aFpSvMzxrNrgQEVB@kraken>
 <DBEG1ORR4MYS.3JV34VYUK2T6G@amd.com> <aHlV7fSjTS6SMlKh@kraken>
In-Reply-To: <aHlV7fSjTS6SMlKh@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|BN5PR12MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 1130ee23-7b02-49c5-5d86-08ddc5ebb22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzlZR2g4ZXRoemxTbzhyZkVqVzBTOFdtQnhISVJDRE04bkgyZVM4cTZlTU5p?=
 =?utf-8?B?enhDN2VsUmxhMjEvTVJCeFZWYUFzU2NpUTBwZmY2ZUJDVDV4YzkxNHp4REZr?=
 =?utf-8?B?dXlQSWNPeUQ5dUIyUXhyT2pLblp2b0lEQVdyQ3I4NEdzekRNVWhqSnE5OTJF?=
 =?utf-8?B?NzBCbE1sVFFMRFkzZFdoMWVHT01sVk05MXEzLzhaTExBbURtT05tNmpjU1BY?=
 =?utf-8?B?LzcybERibnRLMXk0L1VGeHIyUDBqS0V2YS9tdk1RcWltaDRsR2I4SkM4SDJN?=
 =?utf-8?B?a21iTW1hMnNqVm9jUmhxbEQ3UVVZdkVkOVNSRUljSVJaTDQ3QVpyMWZ0NEt6?=
 =?utf-8?B?eC8yOXlrRkJ6RlNPMklJaytjZkxMczN2TG9lZW9PWTJieVd6U1RtR0hmemxO?=
 =?utf-8?B?ZjVOK3JwRzdtSFgzZU1FL0RvTTF4TkU5REEvcC9SdEFRUHY2cTVGSWtQd0tx?=
 =?utf-8?B?a1pNbFZNR0tlMlhNWm55bDc5UC9QKzNBcFQ5elZSNkhMaUxKWEE4d3ZFc2k0?=
 =?utf-8?B?bmp1NHlQN3FoWWFEa3dORWJMbFhkU0s2YzAza3craGVZSHJVTjdpR3dqaG1j?=
 =?utf-8?B?WENKY0VaVVZLdjZRaTRLT1c3V3VGdmpUQ0QrOUNzRXc2d1ZJYWp4bm53YTBW?=
 =?utf-8?B?OU8zRzJJbzJSMVJWSzJUbTNwb3VmcG5IREYzM0dsanBzdU1nalVjZ2JnRlVi?=
 =?utf-8?B?WG9ZdXh6eTZGRDNuckhFeXRaZllIMEkxUXQ1NUFVdlZEOERjbVl6RW43MWdi?=
 =?utf-8?B?b2xndTdQa1ByK0VpdHVPbUdtRkRZWWFPZU9mcExYUS9pK3RzMDFoeGVic3Jh?=
 =?utf-8?B?bmJVWFJTQks1QTdZWGtoSTlqa09zVjBoeGJiREdqWHFzaGxPeGR5SExGeU11?=
 =?utf-8?B?eUJWQ2hIQ1FYOWVtWndIUkRMNVBZN09kWlVsMys1SGFnWEVVbmMzUFBlUDdq?=
 =?utf-8?B?NlR2NlBhcDBKWHQxZ0tQZ2kyMHU4SGNKVU0vdEd2N0JpWHNDdVVzemtDaGlE?=
 =?utf-8?B?aXdMNE9mR1hCVGJ2amFYaCtuZkpRVVUyZEd2K1JwVGl2VHkycjk2SkIvV21V?=
 =?utf-8?B?dTRMa2tXYy9CRk0zN0lxM1YrT281UzFHbFhuZmdXYXM5WnZDNFo4aDZtT3k2?=
 =?utf-8?B?UHhLZFNPWkUrZTJLNHZKTzlNaHRuN0RVL1hUNEltR1JNTllaQUdpcC9OMzFz?=
 =?utf-8?B?N2tSVHUzZ0RqekJhUUpPWUtkbEV4ck1YWVgwbHBrT3A3WHluU3U1RUpnM0Z5?=
 =?utf-8?B?MURCYkdZUVowOXBYWlg4Q1dCNGxDZG1CdDNWVGd5SFh0REx2YmtVbUVDWERK?=
 =?utf-8?B?d2hLeFI1enBUMHFzaUVqVXhLN0UrZjlza3Y1UGlxZ3Z1U0F0dnpobUd6cStE?=
 =?utf-8?B?Zm85aGpSZ0NJUnBtTFgxS1ZKeXI3K0Z1YkdxUmpNRFQra2x2ZlZsK3FDUkJt?=
 =?utf-8?B?dWNwY2NGMEtXWWhKTzNLUE56bnR6azIvMEFVSWhVbUFuN2ZjK3pkYWZpYW51?=
 =?utf-8?B?YU1XWWl1M2xOaEU3MUlCQjNudklyOU9NT2ZTMVdaOTRmWS9IOWJSaThNN3Z1?=
 =?utf-8?B?dWVqWWFtYzFodFA5QWVFVVpCWFVJQ2RtOEpqQVlmWFdUVCtPYkltQnUxZG9v?=
 =?utf-8?B?ODRrbyswVURqdWZPaDQvUzIyejIzUHhHTVpjZktJVHJqWklFTDRBckdoMHdC?=
 =?utf-8?B?ellxaGhVYnBiakxEeFZXcWhuQ0loWkZscVkzYkVyUG55cDRVZlBJR3psSmFE?=
 =?utf-8?B?VE41Zm1xemJDUFRSMEJtQitUT1Q3czZVVEYxU015TUV1STV1bW9neEpsdnIx?=
 =?utf-8?B?UVFuK2NONEhENjRZSVdGUlBLanpsYk54TDFxdXV6L2hBaHlwMWRKa0pWbjIz?=
 =?utf-8?B?UFNZVXcwZXh2emhQYnpkWC95Z2FiWmJyS2FVN2tHeElZSkF6K1l3eTFVSXEv?=
 =?utf-8?B?bThXMS9mYXBzMmRSSW9kRTVzcGowMXJxU0tKbkplK1ZmK2c1alFVbSs0eEhx?=
 =?utf-8?B?OWRtL0RLWHlBNVdHbDEyL0VMaGlqZHVHZEprOG9WZEJIeHF4allzVk1pcmtu?=
 =?utf-8?B?WmtHTGhld3ZMZUgwOVhNaHk2bElZRnl4bnZWdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:10:25.2920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1130ee23-7b02-49c5-5d86-08ddc5ebb22c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9463

On Thu Jul 17, 2025 at 9:58 PM CEST, dmkhn wrote:
> On Thu, Jul 17, 2025 at 05:43:22PM +0200, Alejandro Vallejo wrote:
>> On Tue Jun 24, 2025 at 9:24 AM CEST, dmkhn wrote:
>> > On Tue, Jun 24, 2025 at 08:13:08AM +0200, Orzel, Michal wrote:
>> >>
>> >>
>> >> On 24/06/2025 05:55, dmkhn@proton.me wrote:
>> >> > From: Denis Mukhin <dmukhin@ford.com>
>> >> >
>> >> > Rename CONFIG_SBSA_VUART_CONSOLE to CONFIG_HAS_VUART_PL011.
>> >> Why? We emulate SBSA UART and not PL011. Despite the similarities (th=
e former is
>> >> a subset of the latter) they are not the same. I find it confusing an=
d drivers
>> >> for PL011 might not work with SBSA UART. Also, in the future we may w=
ant to
>> >> emulate full PL011 in which case it will be even more confusing.
>> >
>> > That's because the emulator is called vpl011, but yes, it is SBSA UART=
.
>> > I will adjust to SBSA, thanks!
>> >
>> >>
>> >> Also, why HAS_?
>> >
>> > My understanding is that HAS_ is the desired naming convention through=
out the
>> > code (not documented, though), e.g. all Arm UART drivers are gated by =
HAS_XXX
>> > (e.g. arch/arm/platforms/Kconfig).
>>=20
>> HAS_ is a non-selectable property dependent on the arch. Think HAS_PCI, =
or
>> HAS_EHCI, etc. IOW: HAS_X means "you may implement feature X on this arc=
h",
>> which is why some options have X and HAS_X variants, where X is selectab=
le
>> while HAS_X is not.
>
> Thanks; I will fix that.
>
> Jan explained the difference here [1] and [2]:
> [1] https://lore.kernel.org/xen-devel/6d33355c-477f-4ef3-8f17-b7f1dd1164c=
e@suse.com/
> [2] https://lore.kernel.org/xen-devel/a63ac9d5-152e-47b0-8169-bf470611c05=
9@suse.com/
>
> It's just there's a lot of drivers (UARTs) which are selectable by the us=
er via
> HAS_ symbols (drivers/char/Kconfig)

IMO, HAS_IMX_LPUART should be selected by ARM_64, then IMX_LPUART would dep=
end
on HAS_IMX_LPUART. I don't know how those (and you're right, there's lots) =
got
there. Same with NS16550, etc.

That allows to decouple the device from the architectures where it might be
found.

Cheers,
Alejandro

