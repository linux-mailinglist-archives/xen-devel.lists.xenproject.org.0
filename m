Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BFBB4392
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136006.1472901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Kjr-0005Rh-UV; Thu, 02 Oct 2025 14:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136006.1472901; Thu, 02 Oct 2025 14:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Kjr-0005PS-RC; Thu, 02 Oct 2025 14:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1136006;
 Thu, 02 Oct 2025 14:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oua8=4L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4Kjq-0005PH-P8
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:56:58 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab3e502-9fa0-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 16:56:57 +0200 (CEST)
Received: from CH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::12)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 14:56:51 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::a9) by CH5P220CA0008.outlook.office365.com
 (2603:10b6:610:1ef::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Thu,
 2 Oct 2025 14:56:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 14:56:50 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Oct
 2025 07:56:49 -0700
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
X-Inumbo-ID: 0ab3e502-9fa0-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKDtirGCou1K4SfySqNzMhn5ShmYUXg2OoTh32SxJVbyh1jvCYkgOQGruMk0P6NwgHJ4WJvOvJs1JKN/1aPd9EXsn1h0fzUf0HSnvuyM+NdC1PzArhoRnr4e41CbJOFogfHofJzs48ZXgFsuswI4Q3ZXZA9GRh8LWZj1HGB45wCGwDhNfcvvcYroZEQcXmMCUgghosr05/J1Qk1jtJA4LxBd1L/v/OSbnO4C3M8vwBtnriGxPQdPhuqVqjGwKLNHi+Fpq8JKasJ4pqqSSA+5ZhMvN5U7wwGBrrZdboFqWArcagejGw7P228KN6M3GqYYxRK9sFQCsrHGKUWFfSuYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvZ6zqLoJOowut0+PsPB4drCdbO1HTwHruPXRivz1WU=;
 b=aZzYntMiXd/bLn+5s9vvFADB1vQPfHsjfxzUlVh01HhAdBqct8tO/obH9eXvh5tzu0KDyPiGQ3pwjxy+qY2iYhq8l8/nDs+3SiO8gC1QN8WPcBsWKcKKovyiKhX5oaQL68Ub034ihG0pAbvbTBqVNyXngMfvh0vHttv1ILFhfTvbn86xk6HcfBk0VPTsEV9ot8Cr11sN7yF0OzYVNTwMQREXp5LetthvIsGQ49mmq5FBSmd3BIL50uEECrvV3ZOAcxq41AGcvIiYFdNb4pR17clRs3PJF7iIyQ3yTg/0pxK2wsTfx9VAHR8n7QSFD5w4UrzH6js+WkJphwiGQfP79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvZ6zqLoJOowut0+PsPB4drCdbO1HTwHruPXRivz1WU=;
 b=vBwUs8zBAttbBSGOmy2850RUX7zFHXpumS92jJ1QrpQp7maYLciGpGsZSTYU4hU3axEm4+wUBOaWv6CrLHvJ1mcKKd9ZjNkd7Dj+ZdEkIDSb4haIBjiEp3rSSrJPsxMUBNpbxle2BLqMeex+Vznzp5qaYMFDlkfWwL6NjHUkiWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 2 Oct 2025 16:56:48 +0200
Message-ID: <DD7X9ZDWAJT9.2J6EHGRUMQCVL@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] x86/hvm: fix reading from 0xe9 IO port if port
 E9 hack is active
X-Mailer: aerc 0.20.1
References: <20251002102200.15548-1-roger.pau@citrix.com>
 <1b4bcb40-d62b-47b5-847f-b6e16906f52e@citrix.com>
 <aN6APR-CUc9xRjfM@Mac.lan> <DD7W410Y9LYL.GD6FXC9Q6H37@amd.com>
 <aN6JZTlumMF2B0ym@Mac.lan>
In-Reply-To: <aN6JZTlumMF2B0ym@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca4af9f-d9e5-4973-c341-08de01c3eb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WW1HczJCWWVqNm1wWXgrUmJaTEo0dVVJWWYvQjhNL2N5MEpObXVGV21EYWxh?=
 =?utf-8?B?WEh0Tmd5L0lZM1VvdHRTSjluWmNmOWpMNEpKeEhmaDRQZlM3RUV1cnp6WWM3?=
 =?utf-8?B?T1NGSDFiaUpjUXhKYm9Obmh3b1dCN0VlbWpVMDQxRzBzbGNQckdjcVR5MmE3?=
 =?utf-8?B?d1NCamVFQXdpK3NFNURvem5BMy95bGxsNjNoYWVGS3I0bGV3SmtNemVBSThw?=
 =?utf-8?B?ZDJvciswQTd3Y0ZWRFpxZ2NCMWtBdjJqNk43Nlk0Z2hKbzEyRzlYaUlxbUpM?=
 =?utf-8?B?VndJcE1rS0hBL3p5Y2hkd1lzRVRhNTRWL2ZkRlZvVE80WkxPM21uSkhydlQ0?=
 =?utf-8?B?N0xiTXNWRDFXWkkrVVpWZVZTYllzZE9Ld0ZwRjVtOEo3VElwR2NPMUd0TXVn?=
 =?utf-8?B?THZzWkIzVFh3amgxSlVNc3ZGSEZIcjV0ZFIzVDFhbkxiaDVpcGMwVFI3N0Fl?=
 =?utf-8?B?TEtQd0VpWGZuYlkySXVtQ3FwQUpmOTdaRmVaM2hBRDBQRTRKektPdUVXbjlo?=
 =?utf-8?B?UkY3YXk0ZUh1VW9IYUhOeDJXcDRodG14NDN1NUppUHpUbFc4amRCREU5bXJL?=
 =?utf-8?B?b3E0NEpla1E4aGlqcGl2YWNtc3d3cDJua2pWSUdHUFdLYTV0WGovdzlBWTFC?=
 =?utf-8?B?MDQyYXkrVEN6MVdYeXd4d09FUVN5TERObDZNaElMUEVQZkpDOUY5cThsYzd4?=
 =?utf-8?B?SUp3d0xlQWp3VGk4aDhjNlFmbDIvY0U1d3NtM09mUlV2aHZ3SXNrV2l1OFFw?=
 =?utf-8?B?VUNFajFhME05RGlLZG5oSlY3VEJMc3oza3UvL0pIVkxDOUNNbVRxQTdCZG1T?=
 =?utf-8?B?QUZMUHB0V250Q2VkSFFMbFNscmJzMjlhSjhnOWg2cDBya2RZTkhYSUd4KzNP?=
 =?utf-8?B?MXdIbTY0N1VOL09Fb3VqMlpNcVVOZ2U4YzlmbUtjNEJaZUZ1WGVoUmZHemt2?=
 =?utf-8?B?a3B1REMwd3poeWdDQmphTGFHbVZTbEJic1k5b2VnTGVhS3hlOHJ5bFJtUDVw?=
 =?utf-8?B?RytGQ2YwWjJHU3cxelNxcnBZREZPSHJMSGZVQ1V6Q0FwUWZSRDJuWUJvQ1JH?=
 =?utf-8?B?SVNKeWY3K0FoZTJQclZMTEJjVjNhcTRkL0pWT1ZzTlViTjh4L3JqN3A3b2pu?=
 =?utf-8?B?a3k4SHh4Nnl4aElFblYra244S3daMW8yOEx3cHhnZjgxYkNFMk4yL3pwQ1Vq?=
 =?utf-8?B?YkYvRWZjMzlPZGpDNzJSc1E5SDdWaDVpYkM1V0FRTmVBVUNOMU9DVC9wVFhU?=
 =?utf-8?B?MWVlRjgxa3FVdFpmL004Nk9TaUFsWno4ejdzRTlqbDIzdHhHbnVhbmhoeHhx?=
 =?utf-8?B?bHY2cHJ5UGhibnhwS3drUkhGN1NiaC9HT2o5ZGxSZ3plejc5UU5rQlVlNnk1?=
 =?utf-8?B?T1MvS3BHelByTGNWeW03TDREWDhvWHoyc2NyT1NBRWMyVStnMW43ekgzYVNu?=
 =?utf-8?B?WFQ4Qnk2NE91MFZyOGtMRXFmTUZCeW4zNGk0cmVPcllZRm9uRm43OUlNczFx?=
 =?utf-8?B?V1BOSmJZM1phWGNpSGJMcDdmdnpvcGQxYlpXVVlHb1pBT1Nkc3V4NFVkMUhR?=
 =?utf-8?B?K0VTOVh0NDA0U3FXQnVib2luWG03d3RSYXZkTHVzaC9xVS9oQ2Nva3FGVGRD?=
 =?utf-8?B?YWE1VTVkdEFzdmtlZDhUOG5hRTZnK3NhVFF4SDJ2bW9xSGZOU1FIWGppS1Iz?=
 =?utf-8?B?UDRaSjZnWWdhOUJ1YlFoSENkNVFNNzNEaVFRc2oyQkYvd1ZldjNTakxkRllS?=
 =?utf-8?B?OHVQRTg1aGQwVmx5d09XOWNNdmRVZUIybU94czBidjh3MittV0JjaHRkaURz?=
 =?utf-8?B?Mkh0SXM4YmZtRHZJeUFqRWhxRUpnSEFaWVYrZDJRR3FSUVJBYW1VSXA1bStV?=
 =?utf-8?B?Tlg4ekZlUlBGS0hEeWRXdDFlVTdVWjNWenhUSTUyRE80VVFzck56Uy8vMjdS?=
 =?utf-8?B?UGF1ZnByYUlMQUZLb0hZWUFQZS9ERVp4V2UxNHdiejB3cXBaditEUWR0SFhj?=
 =?utf-8?B?SVN3QTNjRDNzck1aZFlYOWhHRmFGWnhIcVJCWUNZK0FwRmtJcklJR3lrRmMv?=
 =?utf-8?Q?MSI6i4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:56:50.9779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca4af9f-d9e5-4973-c341-08de01c3eb40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600

On Thu Oct 2, 2025 at 4:17 PM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 02, 2025 at 04:02:00PM +0200, Alejandro Vallejo wrote:
>> On Thu Oct 2, 2025 at 3:38 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> > On Thu, Oct 02, 2025 at 11:37:36AM +0100, Andrew Cooper wrote:
>> >> On 02/10/2025 11:22 am, Roger Pau Monne wrote:
>> >> > Reading from the E9 port if the emergency console is active should =
return
>> >> > 0xe9 according to the documentation from Bochs:
>> >> >
>> >> > https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html
>> >> >
>> >> > See `port_e9_hack` section description.
>> >> >
>> >> > Fix Xen so it also returns the port address.  OSes can use it to de=
tect
>> >> > whether the emergency console is available or not.
>> >> >
>> >> > Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstrac=
tions.")
>> >> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> >>=20
>> >> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> >>=20
>> >> That's been wrong for rather a long time.=C2=A0 How did you find it?
>> >
>> > I came across the documentation above and I didn't remember Xen
>> > returning any value for reads, which sadly was indeed true.
>> >
>> > This was because I had the intention to suggest Alejandro to (also?) u=
se
>> > the port 0xe9 hack for printing from XTF, which should work for both
>> > Xen and QEMU.
>>=20
>> QEMU doesn't support 0xE9 though?
>
> AFAICT it does:
>
> https://wiki.osdev.org/QEMU#The_debug_console
>
> However when running QEMU on Xen as a device model writes to 0xe9 are
> handled in the hypervisor, and never forwarded to any device model.
>
> Regards, Roger.

The more you know. I searched for it once upon a time and couldn't find it.
Thanks for the pointer.

Regardless, "-debugcon stdio" is functionally equivalent to "-serial stdio"
and the latter can be adapted to work on real hardware too.

Cheers,
Alejandro

