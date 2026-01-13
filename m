Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7FD18226
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201419.1517062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbu4-0002fE-J9; Tue, 13 Jan 2026 10:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201419.1517062; Tue, 13 Jan 2026 10:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbu4-0002cC-G7; Tue, 13 Jan 2026 10:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1201419;
 Tue, 13 Jan 2026 10:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfbu2-0002bf-S6
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:45:34 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8695718-f06c-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 11:45:29 +0100 (CET)
Received: from PH0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::20)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 10:45:22 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::9d) by PH0P220CA0010.outlook.office365.com
 (2603:10b6:510:d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 10:45:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 10:45:21 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 04:45:19 -0600
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
X-Inumbo-ID: f8695718-f06c-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJMl787VAtXyazFIFRy/ZRIBBlYH9kTSuwmFlYi4CJhyMx3T6TV+xmUIu88qWOhUIpSQC8eqLoKp9Rc+kV9phGT4UzXmHj12SfpipNzOolpX0RPBEHUO7R1SwAERt1XEEA5BjEZYQ0v/5uqqnnm8kisSzxL1WJ6TCEbL5Oc+Hsk2umTzG/ZWAdFLNd5OX/7sxIBRI2QoxEr+jfmX9nP0zypdWZoYwPeSggl6WMEeXZUwGdFcHsH4GD1JWxVQKEnozedZ5ShvXmM8IlnuJTVg0L+YuOW70ZeRV7cWjSQvX+fdmIdhQNoBWkH9irq9a3+p5dR0W9GMWNwdZ6cRvD+Yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI+OPCVlYQD0pRPpKV4vMAP82C8jdRQjuG7ThRlKxLQ=;
 b=ptCKT64Asrfka69/eITgHXacaxAqWm+PHKxOeE0/030q3lU0cFtiW19XFyLnxKzDG0+pORQsahEPgSw9JJm4sLyY+1WeieXobtQIHbFgPABEkjqTiRPMsdB9ymdJTj4CXzJ+jJfduznl102glTlekrSej4eEZs/20RZGD5ize94H+IZUTTx2sKG58kLlXLNYndGwfYZ4ikmE3FDRQ8/b4x+uFK9gGiE68f4XXp5a3w2WsX5zhZQgYmG9zwMRXjHkGhkASNHO4oOhPOGMkwCZNlU9TweK5L05kAErgOvUaEhT2TfUbY83oH1myz6rL99Q989+TgjAB8Z7+4USYcbHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI+OPCVlYQD0pRPpKV4vMAP82C8jdRQjuG7ThRlKxLQ=;
 b=gpXo9BncdwkhBCmQqhE5qQeQGVKY24XDeNBeiQFsMxzvL8demn9rTWCbpU+rYO6xXIAhlgOROL6K30ZrEOACxUDiko9z9akZnWfZW9wQO/lctb2xryJht8oO/P419VTzsCqwWrCjk4uURU1CsVI5juw2+3sd9xMH+f3pIKKf3yA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2026 11:45:13 +0100
Message-ID: <DFNEFH1XI008.1RFBCEC15UHXU@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove
 microcode loading
X-Mailer: aerc 0.20.1
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
 <5b00ab27-5ad8-46c0-92fa-a1fa4b65bd99@suse.com>
In-Reply-To: <5b00ab27-5ad8-46c0-92fa-a1fa4b65bd99@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3ddd68-aa40-4f9c-aeac-08de5290da0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1ZLVEwySVZCaldIT2RSOFJabWtEUzBuSE5HMkdSUElNSmRoUmxLMytTWGxm?=
 =?utf-8?B?d21WVStjQmZyTnhwRTJqRjdYR1pEc1VTZmcvQk4rNlh1b0YvTmpIVzF3UlZ5?=
 =?utf-8?B?NjlGNDAvaXFGQnhjeHh6YitxaXRIM1dRakZUdzluVTNySUNxNnJ6KzdlUXZa?=
 =?utf-8?B?bFZlcUpTcUo4OFkwWUdIRk5ZNUd5cjlMbHVtalZZVk96ZDlFQ2ZVMWIxYVcr?=
 =?utf-8?B?OUZKbnlidW1pTlJ6RmkwTTVES29wMWZ2eFZVdGJwblYyOHhWM3VVQjhDMExY?=
 =?utf-8?B?Y0x3UDBBNTNjcmovNGhrK2VZRUZkNEpqY3BTTFRQem1TY2gwRktGN2ViZkVz?=
 =?utf-8?B?a1BqYXNWOGx4dE94T0M5TjFzSkVPbWFEbFBvK3ZTZzVad3lFcXorVkpnS01x?=
 =?utf-8?B?cjhGd3pDdENBL3BuOVFWNTJoZkl4V1BRVmh0MHlOR3kxc0NyRGlXRmNlWm11?=
 =?utf-8?B?N3NWWkU0Ym5ZeFlxaEtZTXQwNXQyWWtsNTRoU295WjVvc3FVd0hpUmtUR3Rs?=
 =?utf-8?B?cTZsUGJUa1hHY2FiNVNobCt5MWlwQlRya1FQZ0szRTRwejVPdWFrTE5sK3B2?=
 =?utf-8?B?WHVPcXdNdk5acXpmNFFwaEZWY1BXZk9nc3E1NzBlYWxDbGpyekx2bGl2K0pD?=
 =?utf-8?B?RUlxbnEzOVoyeGR1QXZvQVNITGtVNThmRC9VYzZBUkljdkt4MXlYZ20wR1JV?=
 =?utf-8?B?Z2tmK0RGWHRxS3RXZVhwNXhhRjdZbk5sQjZNWmIxSHJ1NUFnczU2QzdhRGw1?=
 =?utf-8?B?TEc2dE9Zc05WQ3JzSm1uRlBrSWtnZUY1by9lbnVkVWQ3cStITVNlbVoycTFZ?=
 =?utf-8?B?WmtIU3R4Z0tldkMwbGNGVXNHN2RVZDlZMDhjK0J4dDhObzI2SDNFdzcrUmxa?=
 =?utf-8?B?RnRrNG45NXdJNUpnTmQvOGtmeHVLSlo3N3Uzek41VUljUGxyaWNZYUlnOGp5?=
 =?utf-8?B?ZitGSGxtdjF1VHNnQzAzMlhWY0Z1Q0dkZHdXRUI4RU1BSjdFRTE0M1cvK2xJ?=
 =?utf-8?B?SkMzRStseU4vcU5VMG0zeHgwbEhyWWFXN2ZCbHNUUDlzSyt1alQxSGNHYi9k?=
 =?utf-8?B?bGdwa3RLYUxtZDV3cDhoOFIzRmNRR0xxOUpZUkhxSmFnL0FvRk1sS0tZVkdR?=
 =?utf-8?B?R2FjN0pkRzRUY0ZzVFdKYlJScU5LdStLWTduMi94UW5Wb1JLampPYWtGVlZk?=
 =?utf-8?B?UE14Q1NxZHk4NGFBT0VpYVJ5Q2F0VmVRR1ZQamdhSFYvRkRzSEg5N3ZwNXJ1?=
 =?utf-8?B?em5EQ2x0bGZyMWdaWFJ1TWhBMWtGaERSZENpV1NyV0F1Zy9jMENrM1Z1ejV2?=
 =?utf-8?B?YWRZZVdZQkFvK1VUZnhUTVZsdDloWGwzM2RUaGpMZVBLbVVzWlRYc0E0bklO?=
 =?utf-8?B?VmJGV3NXMlVwQ3NjRXYzeTMwdCtWUlVoN3NUSHpSNksxOE1XVzhLR0pPbWxi?=
 =?utf-8?B?UHMzU2xsNklnNHpzNWNJT3ZRQUtjaXdVNUtJZUg0Q290WUlJeDNDTnRvcTNL?=
 =?utf-8?B?RWh5alZXandvRE9NVHJyQjZxTDJwQjNRQWM2Q0VETDZGcTV4YU4rMlhTNVA1?=
 =?utf-8?B?S3d0ai9PWEZybGNmMWk2cWdTZlk3VXh3djVtdHR6ZHZicDA3S204aDJDcGsw?=
 =?utf-8?B?RWpUTGhjSGtoVUV6eDdBN0hhUlZQZXpGOURaclh4cHF5b3hlNzhVdllld2JT?=
 =?utf-8?B?ekxnV1ZDREdQRGZkaitOVHl3NXNTZlZwaVA1NC9ZcFpMaG13eEJWYnNYOXBw?=
 =?utf-8?B?TTU1cWVYYlZwTVdjdThuN3dLZXR6REVVNWZTeGsweDhWTWtmWEI4cjI0RnA4?=
 =?utf-8?B?UHNHeG85S1lVdm5BTmR4SnlBQlRiRDMyQjM2VmhxdG14bVRQT0hKZmVacXhY?=
 =?utf-8?B?K1FjQWkrVno4WkJ2b3NqQnlkV0d5NmlYdzZqNlpaYlRrVDZJV0FPamJDdnVj?=
 =?utf-8?B?ZmxKc3BWRTZHL0dZOVVSV2ZtNGxrZUQ0T2trNVVKeUJRRzZaOXR0elJKVHhU?=
 =?utf-8?B?Ui84RGRvS2E5bEVYS21DbXpyZEF3RTNoWU9ITk1BNWpZZmhScEFycXJUVkRr?=
 =?utf-8?B?anFUcC9EL1ppUFNYc2RHZmRoc0xZUm1tOVNieG8vOWhGS3pMcW84SmNTSW5M?=
 =?utf-8?Q?UZrw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:45:21.9540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3ddd68-aa40-4f9c-aeac-08de5290da0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378

On Tue Jan 13, 2026 at 9:58 AM CET, Jan Beulich wrote:
> On 12.01.2026 18:15, Andrew Cooper wrote:
>> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -331,8 +331,20 @@ config REQUIRE_NX
>>>  	  was unavailable. However, if enabled, Xen will no longer boot on
>>>  	  any CPU which is lacking NX support.
>>> =20
>>> -config UCODE_SCAN_DEFAULT
>>> +config MICROCODE_LOADING
>>> +	bool "Microcode loading"
>>> +	default y
>>> +	help
>>> +	  Support updating the microcode revision of available CPUs with a ne=
wer
>>> +	  vendor-provided microcode blob. Microcode updates address some clas=
ses of
>>> +	  silicon defects. It's a very common delivery mechanism for fixes or
>>> +	  workarounds for speculative execution vulnerabilities.
>>> +
>>> +	  If unsure, say Y.
>>=20
>> Please don't re-iterate the default.=C2=A0 It's a waste.
>
> Well, first of all we should be consistent: Either we always have such a =
brief
> sentence in the help texts of boolean options, or we never have. Who know=
s -
> cleaning this up thoughout the tree may even address some anomalies (wher=
e the
> sentence and the default setting disagree).
>
> Jan

Is that a request to add missing ones while fixing existing mismatches or r=
emove
them? Not as part of this series in any case, but do you have agreement on =
the
course of action?

Cheers,
Alejandro

