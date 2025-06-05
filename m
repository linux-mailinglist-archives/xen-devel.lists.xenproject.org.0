Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51BACF58D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007326.1386651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEZe-0005OT-Dk; Thu, 05 Jun 2025 17:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007326.1386651; Thu, 05 Jun 2025 17:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEZe-0005Mg-Ab; Thu, 05 Jun 2025 17:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1007326;
 Thu, 05 Jun 2025 17:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNEZd-0005MZ-FU
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:40:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2417::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224736f4-4234-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 19:40:14 +0200 (CEST)
Received: from MW4PR04CA0095.namprd04.prod.outlook.com (2603:10b6:303:83::10)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 17:40:09 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::a3) by MW4PR04CA0095.outlook.office365.com
 (2603:10b6:303:83::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 5 Jun 2025 17:40:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 17:40:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 12:40:05 -0500
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
X-Inumbo-ID: 224736f4-4234-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ3Pv6SgxG19IwwD1YTqrWyRSpU+e2H/ZgVQgv6ydlHH+CDpe1qwKdQhSluc9xCaJ1bcBrcc1OJR9ziOvaQVHtqf7VkkOMFtceyagyxERE8EvIqE6MdLVoiVpghestijsq7OO+U9GtoVzcChjEJV3bEL8RzWByygGqs/gGlhWefz63xJ8/BYOwxHLkGpooG/mY048RBuPqMzKg20hulVLqCkzqRBl5wxJWnVKQVzdEnmDhkf/nszatKwEXcglMrB2qz9hcQjqdYB4doYnGM+CnZjQTVpFAXAjZuSq9Iw64+BBkX6ej9ZEZHNn5oLx+WI6a5cEiO5DTo6+6e/jCHvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vimpMPdHYL+YnBg+U0CubumFa/MHj4vNVUVgGMMZS2M=;
 b=GadJzo62gFhEzZD8z6sfH4Exfg+u0hw50bgr5jqqW7pqgNDdcfcVDaQ/EpPc8TZxjrctY7XjxhOJn3u0ZBOFeF5SbRDOAolLdbCH2+gTc9CsCzj+cs6F0BcI33MBhTI2u2Q8YqUoKgA9afBRSakZZ1XQetqunCB8IaGyi66jeTl3BRX8gnR/ceteL+bPAOl3W81O3RNcvPQ4ztM1+J18wASZl6s4zgsnzsU+k+k1EJ2n4wn1CsfCjDFJS4xdAZRGrlEbEp0wOuFPGsxlCOknnT1RaOhNLzg2s8sxU7sna4EcS0F01pmO52fJG8jTitW16bmvoDCG89G5j7ZGwAomhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vimpMPdHYL+YnBg+U0CubumFa/MHj4vNVUVgGMMZS2M=;
 b=xIsMF4kylfp19o8AZojX43vjmZwoNf2HO+sE3Zgop5c3TWwwjefbsexh+ca2C19vNv8C3ohdu4PO0Vmrat5DSqKpCEA2X0C8AumYY41xRLNY8/t1frk4twtMCWmC/xJhxt/pGJ0qRz9NTBfinCW+UN7Q7SvIGNuYvZIPGxQG10Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 19:40:04 +0200
Message-ID: <DAES85NYFTFG.1VQE6GFHLL4GY@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
From: Alejandro Vallejo <agarciav@amd.com>
To: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-11-agarciav@amd.com>
 <214c8863-5cd4-4be9-948e-e44b67f541bd@citrix.com>
 <DAERYXX8M48M.2X249UHMKARPF@amd.com>
In-Reply-To: <DAERYXX8M48M.2X249UHMKARPF@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1352ad-9aac-402c-fdb1-08dda4580350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEU4VUI4V0hnb2dFVkJtYS9zN2J4dm1zeWlsU25nc3lRVkM5OFFWenlyaGoz?=
 =?utf-8?B?VmhvWTluK0lLY2o5c2pDOXErRUxJVzl3bmg5MmFZdUFXNTRFMmkzTllhekh0?=
 =?utf-8?B?blhCbG5NSnJJYktjb2JzV01ydGdQRjBHeDY5d0dGVUVYT3VNd0VVTWxzMGRY?=
 =?utf-8?B?SjZpeW9KMWZDNFExb0I4VzZ1U3RKQjY3QVIyMEU2czFmcGpNMkRKcUpoMFNU?=
 =?utf-8?B?MzBXNVJYc3FTMXgwUTY0V1ZIRGozNHMxUktwM0orVmJyV1MvT0s3MnRuTW1W?=
 =?utf-8?B?UzJtbExZc0U0RFNaVzcvS1JCR1p1bm43VnlyOVg2d3phU3NBV0l3NEcwVmE3?=
 =?utf-8?B?RWJlRldQdjF1NEtXcnRrMjBxbFlLV2JFOE5udUt4UGwyTmZWRCtyUjA5eWxS?=
 =?utf-8?B?ZGxYWkpnSG5pOHV0OGlXbXQ3NE8zWTh1a2M1VTNodGtNbXFaTmhxbjRSNG1i?=
 =?utf-8?B?OS9IdlVFZFdid2ZuUE1FU1ZwdTZtL2oyV1dSUEoyK3JSZjZ4ZGN6SEhOZDRm?=
 =?utf-8?B?bmlEcTJDWUMzTzFkejVsT3d0UEhaQVJ4TTN1MnlFRkZvckFidHJVWUp3dTBm?=
 =?utf-8?B?dXRXa2tUaWllanJHeFZhN0VVMXFHTW40UnV2anFUOG9LbWk2ZHQ1ZHBVNy81?=
 =?utf-8?B?dGJWSVl0YmJlNDB4dkR6UXFORVgzNXdXN0tWc0RFeDhPUGdSVFJPRlJrUUNG?=
 =?utf-8?B?RDNKOVl1M2JQdlRxblBkU3NtNWlEZHdJRkh3YXg5M3c0VllJN1NNZE1mMUds?=
 =?utf-8?B?bngwaVN6YzhBZk1uQWorVTg1Wis2OWxjV0Z2ZXJFQXFqdlNiUGJTaXhKdFJK?=
 =?utf-8?B?ZXJ4bi9IcHZ4TGh2NUF6S1dSaERmQXNUSXRhZTBaeDB0d2R5eUxldVZndTlL?=
 =?utf-8?B?T3ZpdWJtbEJpcUVUKzZNKzR1cHBZd1Q3TUNLbm9sZE5EQURNUnlIRVVVaHBQ?=
 =?utf-8?B?L1lYTjdTTVkvZDljZTg0UVpXclYvYUdNbUhZcVF1b2dTejlCWm05OURUUnBO?=
 =?utf-8?B?R1h6bDl3WEpiTzNSUmtXT3ZocnJTWXRodzBrWFJSdjh6dGhwamh2TnJSZEp3?=
 =?utf-8?B?cHpVR2tLSmxpODdXSE4rSTlQdHlHZFJ3VitYclpVMytsWm9LaXkwQ0FzSmo1?=
 =?utf-8?B?VEF6K2R4R3dWZGdmV3pkeHY2YTY3TlhVZlpVMTZxNnV3RVpvMEc1bE9mOXlW?=
 =?utf-8?B?eFFCeUpuWG9yOVFwekVWZHd1dGhoZ3UrMFNHc01uNDhGTm8yRGR2WHU3RzJv?=
 =?utf-8?B?a3d4NTh0bXpaYjVkNHg2eHpVQkExbjNGVXMrTlRXS2hDZDIxbDZZMHh6K3NW?=
 =?utf-8?B?MWlEMWltcFZVUnpUUEVpbkFrOVRUTXlNNHN1bUdoYkNnNUFJRzZVWVpybmNy?=
 =?utf-8?B?RlIzbkdGVGtuQUl0VHoxaGFNUk1URlNEdGN4Ym8vRHB0eWVTOHZOSlZJN25T?=
 =?utf-8?B?VjBjMDJMS1BQNHBKZXZOZ0IzSmkvc2RrM2pIcDBnYngyMndHVVZDWXNlNkZ4?=
 =?utf-8?B?bDRMT2lKalM5V3J2VEtpL0dBMktMNVo2SVBGU0xpc05OczZLc2VxNkhxOVpy?=
 =?utf-8?B?SmEwdGZsRDJ4N3kvWWpjVzhvYXRPYmlnZ2tjV09KZjVhTU5IeVordXZQeFR1?=
 =?utf-8?B?bVdpYkd0TXUrYk84SDJwZnRSMERRcmhOcWUxQytzTGtHeDFwOXA2T3ZzRkd0?=
 =?utf-8?B?YUlndjUrUDRUTGVNa1JMQUZ0dVRhVFRFRTA2OVU0cEdEcGltNFoyaE5TQXR0?=
 =?utf-8?B?WlFlNmc0ME5NM1hJWVpXc3dTQVV3cEZwd0hPT0FoMHI5NXd5MkhDdEx4ZGRC?=
 =?utf-8?B?L3p4YUNpVnp4dnFlcSsxTGcwRTJoTEF5T2cySnp6YzJJMVp5RjB6Z1RHMEZJ?=
 =?utf-8?B?TkZqZGxUMHVMSFFXOEw4bzFaNTYxbWZHaUd6LytHRFdUSDRINWJxRjMwU0s1?=
 =?utf-8?B?Tjh6S010dHAzdDVhQnpITlVDcXU3cW9mdDZmOFNwNHlJejJsSENLL1pIazhE?=
 =?utf-8?B?UDMxaFdmYms0eVZHNnpIZXcvUCsxSUZPRC90RXNjeWJnWm9xL3pSL2loODh3?=
 =?utf-8?Q?Guymux?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:40:07.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1352ad-9aac-402c-fdb1-08dda4580350
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560

On Thu Jun 5, 2025 at 7:28 PM CEST, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 7:00 PM CEST, Andrew Cooper wrote:
>> On 30/05/2025 1:02 pm, Alejandro Vallejo wrote:
>>> These types resemble each other very closely in layout and intent, and
>>> with "struct bootmodule" already in common code it makes perfect sense
>>> to merge them. In order to do so, add an arch-specific area for
>>> x86-specific tidbits.
>>>
>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>
>> Yet this is a distinct backwards step in terms of legibility.
>>
>> How about modifying the common code to be more legible, rather than
>> regressing the x86 code.
>>
>> ~Andrew
>
> I meant to ifdef out the fields unused on x86, but after some massaging I
> think I got it lookin much nicer. It's essentially using the common parts=
 of
> kernel_info and boot_domain as a header to kernel_info.
>
> That way, x86 keeps using a substantially smaller (yet common) data struc=
ture
> while the rest of dom0less can keep using the original as-is.
>
> Refactoring kernel_info to rationalise its contents is somewhere in my TO=
DO
> list, but I have much more urgent fish to fry first.
>
> Cheers,
> Alejandro

... I misread the comment and thought it was in the following patch rather =
than this one.

If it was indeed intended here, I'm at a loss as to what you'd rather do.
Common bindings need a common ground. This is such ground. The data structu=
res
are virtually identical and used for identical purposes.

What's the legibility step you're talking about?

If not in this form, then in another, but I do need some data structure
understandable on every architecture for this very use or hooking dom0less
binding support from common in a non-hacky way becomes impossible.

Cheers,
Alejandro

