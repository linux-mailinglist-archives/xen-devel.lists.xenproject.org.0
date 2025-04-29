Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A773AA0D61
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972617.1360913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kvD-00034M-0u; Tue, 29 Apr 2025 13:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972617.1360913; Tue, 29 Apr 2025 13:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kvC-00031k-UH; Tue, 29 Apr 2025 13:22:50 +0000
Received: by outflank-mailman (input) for mailman id 972617;
 Tue, 29 Apr 2025 13:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kvB-00031O-8m
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:22:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:200a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0946a494-24fd-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 15:22:46 +0200 (CEST)
Received: from SA0PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:d3::7)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 13:22:41 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:d3:cafe::b1) by SA0PR11CA0002.outlook.office365.com
 (2603:10b6:806:d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 13:22:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 13:22:40 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 08:22:38 -0500
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
X-Inumbo-ID: 0946a494-24fd-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUvF3g9ufGJvtq0Eq2OFDZbCLSTJ05arwrkcGK4TzGuALbFbM/LebEgn28UNpPkdCoZXzlbGP8R3md2MPlCNdqw1uUHbG8GxOU9HQ7dMOYtUjFVeXJbI8xltrjbk88C6Pg3kjL6QkQYEz4X0kwuW+U5rc+rwsqlPy+OsKtWlFRsMdbYafstBw3M5EU1ti5VGl8zEmKO+0cX4q3tPjN+YQg7FqY1tUYixHZATamuRdZGE0v1R1xDze92xGu4gLQJlPN5Gs6prWZY+c6pERAXSxdXozcMiA8HLGTLCIRsoWSvB8Nh/KRX/zmhtldxlpYWNz4hKwNXtxsz+435YivimWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22cy0VuEYcw2o2Xd4cE1+/VmDi/cFSwnnE+oCMshkzM=;
 b=E/lIF3i+5SCS8zMvcshF1DkXcQP2GDdnWVfRn+VF169Tb0VKvcDcx7Tl7OiCHZTY3iXnWWS9NGxIwEl4SNuTKxhd/cJDI824i5WJk5SrNeksL819oN0CCpOV5l4sDxJJQ6SC/jFLLDRyyRqUEV+XW23c/oWF2fwtqDCucsVcnCuDHFcw8Zy7Fa6fqCFYVIJy3w0Uf5bzhBGj881qR5/kQj7mBwuCODEguIwFIJTzu1FZsddh9hEICAmvrxcX2evO9FQKemtVHdr1UghV01I3lDza7ydE4HN8pjHE257um5Ozpecd9d0GJThoaSBxFwB5/iZ32U7kNPglfUrp7d8mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22cy0VuEYcw2o2Xd4cE1+/VmDi/cFSwnnE+oCMshkzM=;
 b=DyJN27KnxV7oOQKHFpCkX8lbrzfNzRyCtdbwxjFCZMQRc0eiPxVMgWH1ToGyxyuu/d7y6TYQwmDqZpHaIzGa8jmtgaHRqUuhb3itNY14s9dUbgJbK4JukOh/fLy4QohMpkJbCvn9W2S7/+u9kR+NLnAv8reTNYMCTQE6afs6RPo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Apr 2025 14:22:35 +0100
Message-ID: <D9J5KV0WON7T.2J35KI3WGYRFQ@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 00/12] Hyperlaunch device tree for dom0
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250429123629.20839-1-agarciav@amd.com>
 <418c4232-dfed-4aef-8b9c-7bfad2b30de0@suse.com>
In-Reply-To: <418c4232-dfed-4aef-8b9c-7bfad2b30de0@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 95986f0e-adc2-40d5-cde1-08dd8720eb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFIxVmRFWXJrQzRaaWJWcWQzNGtJTjNpVTdhU1Vxclh3TVBzdC9RWHlNV0Ns?=
 =?utf-8?B?QTREcTdiY3FxYVZjRjRtemtVNTNYMW1ZUUtUZzlTVGJoNTAzVmVOdXF4MGtl?=
 =?utf-8?B?Uk1oR0xkakx2UkpsTUlwbXFqdFJsUWJwaHNBem5zRlB3NFRYMTlDNVpTcTIw?=
 =?utf-8?B?Qm53UWNINWlNeHBkK3hiRG1HRENZUGlkZlJKWVN3RkxON2xodE90eFdWZWhu?=
 =?utf-8?B?N0xsNlZuK2FlVXhJMkM0L05aTzR0NXFSWnppQmpKNkhMYWQrYzNvOFdxQ280?=
 =?utf-8?B?WEhWTjQ1RmR1cWNFS245aGtZdG5KdXhOOS95enhkMjlDM0NKT0JGdjBlR1Jr?=
 =?utf-8?B?eGt4d0VmUDBscjdJU0FDS0VtWXd5YUlkeGxYdHN0d1FrUVNnR3J0YjFzWlNC?=
 =?utf-8?B?UUhWZ0EyM2JDblJoVm5Pc01ha3Uyd090WEJHbENxT01lVU1xaHpPR1QwT2px?=
 =?utf-8?B?VnorNk9sTy9vODVWUldES2pJNXhNVXgrSkNjbXdRaXlSTDcrOTBrNXFycTZL?=
 =?utf-8?B?UmJ4YWVpV0F4UURsK242L1dXZEt0LzgyYW80Nk9ob1BTUjNsUStuVjBiUUtV?=
 =?utf-8?B?b3kyY1NoZXFQRHY4ZWFMaEVTTTBadEhxR0daYk5zZDBPK0hNSVYzQ0xNMGpZ?=
 =?utf-8?B?RVZWMHp0Z2gwSVpOVFFhVGxtNHl6RXJ4OU9FbWV3WURTcFlMMk4zN3o0eStI?=
 =?utf-8?B?RzRUK2tEYUNhRzFCYzJlM1RuMXowcXdlOWdUUTg1c1FESGc5MzNBMTB2Y1Uy?=
 =?utf-8?B?RkJxQ2h2R05IQld5anhveTZCT2gxVmJybis1MHlvQTJoQ3dxWG1iSFlrcmRK?=
 =?utf-8?B?ZXk0SXBldTN0WlMxWjJWK0FqS0pTdExNNDFUMHUwWE1LZUF3VUV3b2NyUllH?=
 =?utf-8?B?QldDU3F3SHU4dXB2em9rWTdQZkppcDRwbkVodUhHUE82VnJjMXJGVzRLRzhS?=
 =?utf-8?B?Zm9QSDRBdkJqT0liMXNzdWUwVG5WcjIzaUFieUlJdjdnN1JGNXQ1UWV6Rk9K?=
 =?utf-8?B?aHZlZkxUL1RFckU0aE5zM1d3WVVvUzE1eHBFSzVmNkFKUjY4UVJDNUxQU29J?=
 =?utf-8?B?UU9IOUU1blJHOHZNNFYvc21NNXpEL0tjRitOUDZYbktqdnFVR2cxM2IvSUpm?=
 =?utf-8?B?b0JLZHFtRThqUFBFWGFLUUlLcGRxWTI2RXN5bW9mYmt0VDhQZzdMWWFDcmJH?=
 =?utf-8?B?N3JkQXhpSTB0aFhwRnFzNXFrOGZxQWZhaXgxNEw1azhhMGhGbGFXSlBrQ2N3?=
 =?utf-8?B?T284QXJ2Sm5OVzhJaEFMalVoaVloRWE4NEU4R2Y0ZFpXK2phRVRwSlVCY0lS?=
 =?utf-8?B?cDdxaHhxQ25xakhoZ2NzWjBWanZ3K3NNT3p0Z241YXp3QzlteXBYQmJsc2Vr?=
 =?utf-8?B?ckI1VnJNQTZDNXNET0srNlVkSzVyQXA0REJDTWczTWZOcDJjSno4K0FSdXZC?=
 =?utf-8?B?dUZOT25lRlFuOVErOXFxeVdxR1RxY3kvTzYyMHZEbE5zS2IzTEZvbUNlbmxQ?=
 =?utf-8?B?NjdsWVRIRXRFVWdnWWxOTjlDRHBiWlU0anRKYWN6ZnFhemQxMjE4VWs0eWpY?=
 =?utf-8?B?ek9lMnFRTGM3ajlndXoxT3JGY1ppODVGaHFjVDRHeFJYeC8zZmVqWVRINXZ3?=
 =?utf-8?B?SzlKY1Fmc0lQSSt3U0N3RWozV2VHMHZiaUkxVmlCeURDamRlUVBzQyttUURr?=
 =?utf-8?B?ekNGaHhEV0E0YVdCaVJIVlViNUdXTW9LMVVYR2RSU2hxTFdVMUF6ZlpzcTh5?=
 =?utf-8?B?NW1VMFVYUk9uYWdpUy9XcWZQNysrYmlGRnJPeVh2cVpqOFR3cTJoQWl6MnJ0?=
 =?utf-8?B?aWNKOTlaMHNWVmIxVytQTUozTXdZd0VDTU9aSzF1K2tEa0JUSm1tb3VTQTdR?=
 =?utf-8?B?R3U5Z3lEb2tJWVlZQzg0bEk1S21LRVcyY1lvMHJ3ckQ2YUhZcFZWbXYxMEFy?=
 =?utf-8?B?L2MzbnhRUFBQbUpNYUpXUis4YVkxcUd2bGVhK1Z4djhKdFZ0RE1iL05HR3NM?=
 =?utf-8?B?VFFQSUhFdkxucUJJNmpKcFVQTWY1dCtUZTBWRFBhcjN1TmNoZEg1NGV1KzdI?=
 =?utf-8?Q?6RZh78?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:22:40.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95986f0e-adc2-40d5-cde1-08dd8720eb0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

On Tue Apr 29, 2025 at 2:00 PM BST, Jan Beulich wrote:
> On 29.04.2025 14:36, Alejandro Vallejo wrote:
>> Not very many changes here. Just:
>>=20
>> v5->v6:
>>   * Denis' suggestion to rename a few helpers to fdt_*
>>   * Change to last patch to only pass CDF_iommu to domains with
>>     DOMAIN_CAPS_HARDWARE.
>>=20
>> I _think_ this addresses all feedback I got so far and I don't expect
>> anything major remaining before commit.
>
> That's optimistic. I for one didn't even get around looking at v5.

What can I say? I refill my glass often enough for it never to be half
empty :)

Jokes aside, I did cover most of your large-scope concerns by v5 and v6
isn't a dramatica change. I'm hopeful the bigger thorns ought to be gone
by now.

Cheers,
Alejandro

