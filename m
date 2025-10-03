Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968ABB6611
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 11:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136475.1473035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cBZ-00028c-FM; Fri, 03 Oct 2025 09:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136475.1473035; Fri, 03 Oct 2025 09:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cBZ-00026i-Ba; Fri, 03 Oct 2025 09:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1136475;
 Fri, 03 Oct 2025 09:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swgf=4M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4cBX-00026W-9V
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 09:34:43 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f61e72e-a03c-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 11:34:41 +0200 (CEST)
Received: from MN2PR17CA0013.namprd17.prod.outlook.com (2603:10b6:208:15e::26)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 09:34:32 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::c8) by MN2PR17CA0013.outlook.office365.com
 (2603:10b6:208:15e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Fri,
 3 Oct 2025 09:34:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 09:34:32 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Oct
 2025 02:34:30 -0700
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
X-Inumbo-ID: 2f61e72e-a03c-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwRztlJ+tBzUp0Tvh1izpqg8KFu8/tdn64+/512CLjbbNlaBDXcN3aHv0a5CH+M6G9lliKUK4LyObhmew6G3tciU+RE+FgV5gG8YJpkD+0lBBgiysI108wqpFJppqybrjlM+50nxp/Psx1Yzlw9SduTNMYFGLKGQPEcrFb8AODzNyoYJ//22wLxp5QFcCW802POmA9tY59p2ZQPrauvRMDzF3+5BOOu5QFwkdqNbFZUtKgpp+JgS8D1aaoxZFm+BB4/oOFGZeDQbG3hXGRegCuE6cTOlG2yOZCPKbT86mZGR0MaFdxdnhkHvx4f7UwRq//RuE4pBq6OEvMdFB8gTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Osmf/8z0OhDHqkBhgAH3FBUvpEN6KdlADdz5lFfzaFk=;
 b=RHkTRzEqaMY4Z+HN3d20JGzrsKh6qh1ZfiMNb9xkn0Jzf9/VUr0rOhHDBtUzKUQH9vibm9YqGOoXm8H7HSdmT+mHey8zBWBMbSM1uIEnrpMj8rVDHBr2W/BEEQSw7WpiHF9gQP2AX6h9nNAJNBX6gNnDfpAO7F0wYfgAMcAg1MFTTW2NNIyvQR6ONrDK8PfsYFhujxxxXrACa1zWxdQu2huhGQrByIr8AD/aXxngfGErumR0rhgLKq5C9608ZUhixotNh80CLylpoj8MtgKStLcpkwE8xqWdLY86xgcx4Uty8IkGVQbclLW5z7x5u5VbCRX8SvwvNrTw3MAGzvi1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Osmf/8z0OhDHqkBhgAH3FBUvpEN6KdlADdz5lFfzaFk=;
 b=Ir3YToBaSHNyDGd3phdYHs4NIpDInvAbanvWPyO6n/+hZaXMY+8jKVnsAUdneCVdOrlUUd6dLlKynK6WWaapY+yluoXtmL8YeraybW4BWfLO/1BBK20ymNuuG0I0uIT1PbArD99jSmLofnoQoQEokONOsGNmyxTJFCA107H5Wl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 3 Oct 2025 11:34:30 +0200
Message-ID: <DD8L1R7N0V5Y.36TV08D44PTXW@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
 <aN6APR-CUc9xRjfM@Mac.lan> <DD7W410Y9LYL.GD6FXC9Q6H37@amd.com>
 <aN6JZTlumMF2B0ym@Mac.lan> <DD7X9ZDWAJT9.2J6EHGRUMQCVL@amd.com>
 <aN-GwqVZNaAfu8mV@Mac.lan>
In-Reply-To: <aN-GwqVZNaAfu8mV@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc4b405-2a54-4dca-6dbd-08de02600ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlhmeFA0YU9FYUZMKy9ZMFdHUHZla3FEb0Flbm91OHVQTFc4ZzBQTFVJQU9q?=
 =?utf-8?B?VUlRbzdhNU9kaVVRcm82VkNHd1ZsZzlPdmFXZDlYYTlTWUJUL3BiSHN2UGFs?=
 =?utf-8?B?YXZPVXRmQWxSZEUydWdyckJLVm1BdVZmeDdzRXFqV0RyTzA3aU1VMnE3cE9Y?=
 =?utf-8?B?NHh6VFpQY3NMUFRWOHA5dDcyM1BsU3YwZUw4bzlJMW9xeU8wT2xmRTZ5QzZ4?=
 =?utf-8?B?VnpHczM0a25hZys5TVRDV2J5QTVhRk51a1FhTjdqUXJSa2pJYzlvYWY0N21C?=
 =?utf-8?B?Ly9DZEJ6THF5VzY5ZjUyUHBob0pLMnZsSDhodUtaT1JwRlIxZDRuUVo1T0Uz?=
 =?utf-8?B?RG82N1hGdzgycjhiOThmWGFMZ2FTZTk2akgwZzJTaHk1ZUpkaW04cmRnMnNs?=
 =?utf-8?B?eGdLWkFXa1F0MjhteGluN0JYekc2bDlsUXJyMWtCbDVHak5ZNnhXa3ZkZDYy?=
 =?utf-8?B?ZWR0T2diSFpOT2VWWlVFbGlTUVZhQ280d04rNXhlc3hJaEVERmlHRVFoUmdC?=
 =?utf-8?B?cFA0eXM5K2liQUltb3B4SkQ2RTF2U3FiOWlYVjdxVGM5cXVWN09Sank3SHpP?=
 =?utf-8?B?dXNBQjFSaFd0VXVwMVUrNkhPV3cwcHFhdVdQb1V2Qi9UbWNBampMWXhkeDFu?=
 =?utf-8?B?VkJ1bzVRQmVzTVZKSUpFN0JWYmc3dUVBcXVvRGJWbHBxdjdJMTRVVkx2clZ5?=
 =?utf-8?B?K0ZNMzJlc1pUcG9BeVJhd21ZRlJhQm9xSWw1a241c2hpUzJOLzBvbTZ1VDFT?=
 =?utf-8?B?Y3dUaHJMWFhEZmdPSmxXWmsxUzVSVVo1V3BIb2drOFhIUmdxRy9JelF5UlJ1?=
 =?utf-8?B?UXNtQW5hMTJnMXRtcUMzWWpWS3kranFPb0E1U3NFSUFvaE9JVVJ2VGNiNmlB?=
 =?utf-8?B?MzdweVlxNXpwcW1uR3BUNlc0alZxRndmc0g2REY4S2dpWlpiTy9kMnk4bDRC?=
 =?utf-8?B?eE5ZK3ZXS1JCdmxlWUpZTmlLNXVQQ2lpaTVBUk00eEcyUjZxbXBhU3RJTEdS?=
 =?utf-8?B?bS9vWU9hZ2dKYjJ2dFhnbHdPSGhWVjh5RS9QV0RYaXVLZGphRzhmaHdsdjlv?=
 =?utf-8?B?YUdib2pweXZQalRqbzN5UUVYdWxzczJxZU5DVytQNzlmeThKbGEyMGF2RW4w?=
 =?utf-8?B?eWdlTnlOTFpzRDQwSGkvZXBqRDRnSENBRDl0aGZNeHByd2xmRUs1a3ZoTUFT?=
 =?utf-8?B?aEFyOGlUVVlHeml4dTVNaGx4WHhnL0VjVVRldUp6dldGNjB6ZmVidkRIanJO?=
 =?utf-8?B?VFlGLy92WGwxUXRVSjh0dUw0MFlkTUZ4NmFBY0VJLytvVnJybTIrQVJGbjB0?=
 =?utf-8?B?bVFJT05VMWpCMzQzdko0THc3VmF0NGVkenJQWDBDQm5sM3Z2Z1gzbWQ1SjRI?=
 =?utf-8?B?Q3l2b0JlTlduaUZPWmtlVy91MHA1aUZudmFsejZlWksvdzBHbXliR2JiSS9J?=
 =?utf-8?B?SW5OV0tFenVOTm0yQ0RQWmdvcFNBRUtKZzZPNFp5aUtoNGJ1M01QeHNEVFJl?=
 =?utf-8?B?TnVaSERTWnc5Ui9Va1BSUXNmWGVCUVdTOS9tbm80ak5qV2wvOEYxcGJCZHZW?=
 =?utf-8?B?YWlrRmNRbXk5VnA1Smo5cFgyaTF5RGhpOFhLYmZTTXI2UWt5OTNualkxaE1N?=
 =?utf-8?B?TUVNTUR6eWV1MUVkbnNNa2RNaXlwdFB0VG9DUWZkVjh3TUVYVDNTSXJGekta?=
 =?utf-8?B?VVJBZDZrdWFNd3YxRWZyaGJnd3FMMFBZYUlFWHlqRnhXQ1JGVHUwRnV0N2JE?=
 =?utf-8?B?dE5VMGpBMDNrSERVMS91OWxLaUtFSUlvS096MFhBbkNjd2RwK0doNTVhejhs?=
 =?utf-8?B?RXl4YTlsNDBrTFd5cnorZkFTMGhHMTFlMzFCTGlQM1V5SEZZaTcvUkZmeVJz?=
 =?utf-8?B?OFFRWmVVNDlFbVNtaEV2R1p1YWZSa2pCZmc2dzZwcjZCejdibjBsOTBhU1lQ?=
 =?utf-8?B?MytMSmdXMGphVjQrNENjQW12bzZMRVkxbk5hMnZLTlcwOEdCWjJtNTFJdTZ0?=
 =?utf-8?B?M3VlMURUVnc2cUd1QzUzcjBiYmM5TTlMYjZCMmV1Um1pK0srQXl5ZUFrZnFY?=
 =?utf-8?Q?5OKYjV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 09:34:32.0163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc4b405-2a54-4dca-6dbd-08de02600ebd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097

On Fri Oct 3, 2025 at 10:18 AM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 02, 2025 at 04:56:48PM +0200, Alejandro Vallejo wrote:
>> On Thu Oct 2, 2025 at 4:17 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> > On Thu, Oct 02, 2025 at 04:02:00PM +0200, Alejandro Vallejo wrote:
>> >> On Thu Oct 2, 2025 at 3:38 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> >> > On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
>> >> >> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
>> >> >> > Reading from the E9 port if the emergency console is active shou=
ld return
>> >> >> > 0xe9 according to the documentation from Bochs:
>> >> >> >
>> >> >> > https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
>> >> >> >
>> >> >> > See `port_e9_hack` section description.
>> >> >> >
>> >> >> > Fix Xen so it also returns the port address.  OSes can use it to=
 detect
>> >> >> > whether the emergency console is available or not.
>> >> >> >
>> >> >> > Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abst=
ractions.")
>> >> >> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> >> >>=20
>> >> >> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> >> >>=20
>> >> >> That's been wrong for rather a long time.=C2=A0 How did you find i=
t?
>> >> >
>> >> > I came across the documentation above and I didn't remember Xen
>> >> > returning any value for reads, which sadly was indeed true.
>> >> >
>> >> > This was because I had the intention to suggest Alejandro to (also?=
) use
>> >> > the port 0xe9 hack for printing from XTF, which should work for bot=
h
>> >> > Xen and QEMU.
>> >>=20
>> >> QEMU doesn't support 0xE9 though?
>> >
>> > AFAICT it does:
>> >
>> > https://wiki.osdev.org/QEMU#The_debug_console
>> >
>> > However when running QEMU on Xen as a device model writes to 0xe9 are
>> > handled in the hypervisor, and never forwarded to any device model.
>> >
>> > Regards, Roger.
>>=20
>> The more you know. I searched for it once upon a time and couldn't find =
it.
>> Thanks for the pointer.
>>=20
>> Regardless, "-debugcon stdio" is functionally equivalent to "-serial std=
io"
>> and the latter can be adapted to work on real hardware too.
>
> The emulated serial is possibly equivalent to the 0xe9 hack in QEMU,
> as I expect the serial is mostly setup to "just work".  On native you
> likely need to configure the baud rate &c, plus implement flow
> control?

You'd need to boot XTF via GRUB (or similar), which would've pre-configured
the serial port for you.

And baud rate, flow control and the like are ignored when emulated, so that=
's
all fine.

>
> Is there any testing XTF should do to ensure the serial is there,
> before blindly writing at 0x3f8?

Closest would be parsing the FADT for LEGACY_DEVICES being set, but if that=
 was
clear we'd be out of options because there's nothing else to write to. I do=
n't
intend to make XTF rock solid on real hardware, just "workable" on typical
everyday devices/servers with GRUB's help.

FWIW Xen just assumes it's there if com1=3D is given in the cmdline AFAICS.=
 The
most likely case for COM1 not being there is on PV(H), which XTF already us=
es
the PV console for.

Cheers,
Alejandro

