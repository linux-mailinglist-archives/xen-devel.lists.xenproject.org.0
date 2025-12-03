Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C058ACA0030
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 17:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176942.1501381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQprU-0000Tw-DW; Wed, 03 Dec 2025 16:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176942.1501381; Wed, 03 Dec 2025 16:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQprU-0000Rn-AR; Wed, 03 Dec 2025 16:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1176942;
 Wed, 03 Dec 2025 16:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1HU=6J=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vQprS-0000Rc-FO
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 16:37:50 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65fac94e-d066-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 17:37:48 +0100 (CET)
Received: from SJ0PR05CA0087.namprd05.prod.outlook.com (2603:10b6:a03:332::32)
 by CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 16:37:41 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::29) by SJ0PR05CA0087.outlook.office365.com
 (2603:10b6:a03:332::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 16:37:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 16:37:40 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 10:37:38 -0600
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
X-Inumbo-ID: 65fac94e-d066-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmttSTy9SQIFjGIu3kgZomxdaaZ5B3TRwZ9zBgbxLGWH72ihqT0Ip9v0QDXKKZxFWFTMwPK2VTV24uMv+W6nabzhZXhtpAaH17ncmlOPN/WH9sGDw//mxSDL5at120ftWekDiijufG3Wyd2VGPSy85uzQBJJb8E8Jv+O53P61wiwarlkYBTYrU8bLNgQ/vsNif1X3ZS724bI+qh/Q2LII9SVLnmBwW7ufWcxpiaQeCXZE32mlEx2eeq/BK7DnM4geCq1KK5w9uDYMgE6wGa99WaE6uEP0rclDR+Fuv1k4j7axbN7BgPxMwjDFsqG9BBVEysbhlwNWFTcbUyzqQgWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMZBcldQUrL03VFy1A47Q+fGCKyzBVL9OV8G9PDcI28=;
 b=B94bApXAmihSEa/Lac7AVobkWTx69Gz2rfQvFt8+f3zTsMmxoSmdu3NqXnWT0NMO7qwgndts905U87xlGPThrHj8464IRLWUn35Y0/dlrVkW6DsvuceOANtKDIL20dBkbUAeJaqoEscVJW4RSx/knsOUPbCqlg2XPyNAau1VqKjzz3g0hqpUtVtONDaJrDWDEetNqwpEz/KxdOqd/uyQFqa4iSGZ2u6kaL6eGCwIhHH0ghFu/H6pxh5EsaE5AjKGpCuLFw/pmmBnx9anowDIORAQaacGvYBTseAAVrrxEcqMFa2U16Jbm1ffiyIPwyoQKpfJcslXJwAlWmhmWcuKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMZBcldQUrL03VFy1A47Q+fGCKyzBVL9OV8G9PDcI28=;
 b=NtWpIi+2pg1Hgi+3BIhMqeUQdju2VaB4+r+wFjihlUZmBTlCULDsLAdmbPSPtciRYVeSuDOOxjl38hyozzSDzNWBGWLjlKKzYnPaZX/1VX9HS2Iy+lzNxA6h7H7kjaeNJd+RF5nk/ZjLdGn28ck7RFJZTzyxAIFyj/PR6lBbQPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 3 Dec 2025 17:37:36 +0100
Message-ID: <DEOQ8Y07PC6V.1VOZ92WKKGDQN@amd.com>
Subject: Re: [PATCH] xen/treewide: Use __ASSEMBLER__ instead of __ASSEMBLY__
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251203133258.1624223-1-andrew.cooper3@citrix.com>
In-Reply-To: <20251203133258.1624223-1-andrew.cooper3@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e46e86b-c62e-4a90-06e7-08de328a46c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkVMWThHeWVQTnBHSThOTW9uUGVMMldmbmdleHNJWTdsZWJGV3A4VkUvckt4?=
 =?utf-8?B?RmpYUWl0VEZaZXZSOTVINENCZzZ4UjlCdHA0cTlIYXFEMjNUMEorSVl0NEg4?=
 =?utf-8?B?RlMvTVQxc2lwRTc4N3FxbXpTOElWVlorczQ0RVBzc3JPajMxeENuMXFvNmFB?=
 =?utf-8?B?OGV0cEtkZVJKZytZZ1NxRUlyY0ROamN2ZkYvT09ya1pteDRMMnRJQmVhTDgx?=
 =?utf-8?B?dUVBQktVSmxCTTk1bTg4TXBWVzRMK1owcEQ5YUd0NHU3UFB1V1lPMVJCcm10?=
 =?utf-8?B?ajRWTGVsUEdobThUSHVKd3pkamVFT3grQU5PaTY4UUtpcGJxbUg2TUJuRjZR?=
 =?utf-8?B?Yi9ZSTE1UGlidjEyTFE3Vm13QWdYeUIyWTI4aXE1dVlEZ25MWFR0Ky9KemJO?=
 =?utf-8?B?WVRsZGJXanZjL2hGS1JacFBBZjdjSkNPZkIzeUlRT1V1bDZMRFFvMHpBM3lK?=
 =?utf-8?B?QVpRWVNUaE4wV0YyU0Rjb3JIZm9qSnNNMEM4TEhjWFRHeStiQU5aNWZYdVFP?=
 =?utf-8?B?ZXFRRVBSNWdITHViOEV2VHYyM1JOazZodHNOd29lZFJkWHJJREFPd2M5dlVw?=
 =?utf-8?B?ZlFtZW1XVVlENE4vUFpvNnFCME1rTmw1MkhtTWZXbHUrcVlDTkg2V3NJK2JC?=
 =?utf-8?B?cHN0RjlFSmdjeWsvekY4djJIM0lZOXBZcklRWDRyYjBqZjQrN3dnekgrdGM5?=
 =?utf-8?B?SmhxYjRhRmpPc3B5b2xQYzBjeXRiUDFGY0N1a1kyQitTRnBWU1pWWXFLOGpi?=
 =?utf-8?B?Ukk0MDBwL3hzZW11THFVb2tZbkhSWHd3N0owUXpFeGNyOEhtK3FIUzl1REZr?=
 =?utf-8?B?M3QwUVVtN0NueS80T0FtejRCVG5nUjZMdW1aQnp1MjkvV3hCNHNQd094TkJQ?=
 =?utf-8?B?QUt6d21CK1RPdEs1N25zZUh2TjI4NXhhUlNta0tldVB0b0dMTCtDNFRtb2xt?=
 =?utf-8?B?VDV6NlJGNWdPMEpJb05HSlp6M0lRU0gxSEt2K0lOV0dKNFArY2tnU3p6MzZX?=
 =?utf-8?B?WFhaWXZNMnR4UktobWl1SGJVU24rN1A3RExBelZ4dmhrQkxtblRqMmt2TldS?=
 =?utf-8?B?QVNCMm1zRThjR3NERURhMEx4WGZ6aUxCMXNOY3JlekxvWWxabUg0eTRQbVJG?=
 =?utf-8?B?bEVaUVFreGlmSXF6aG1ZRldKWGVyVWFnS01BaU1LOFN4TXhmeGpPUjhDQkhB?=
 =?utf-8?B?MVJUbzl2MGxlcjFhaEloK3BTMzRYQkcydWZjcnFmN3FUUjh4a3MvQ2VrdzJx?=
 =?utf-8?B?eE9IbjdGL2VnOWtmSkx2K2k2T1lGNE05b0IzUWprTFhnR05WMFJ0bVhWUWJl?=
 =?utf-8?B?U0ZOR0J5cU9GcmNxS3VPazJQUTRCN3NvWUF2R0xYbFlQZXZyOUJObVcwbE9S?=
 =?utf-8?B?ZjBDcGNzN0RVV3QwdXNqY0I2bXVVSURpM2xoUzVEUlFaL2czdXFpTnBQWDRP?=
 =?utf-8?B?dS9sVjNCVDlYUzhxL0lTTUhxN0x4R0lDNnh1OUdnTERRWmRScGxIcENDZzVx?=
 =?utf-8?B?eS8vaXQvbzVicjFRVUFPUWpHVkI4ckhucjdaYnNYZ0FXUCs4N3BNTXNSZ2Ro?=
 =?utf-8?B?WGFad0NXMEQyNU4rc2dSOWlyVGhZQ290ZnFzOFlnendaZXZSQUtkSmNWdzVx?=
 =?utf-8?B?YmtkeXpnSE92UHZNaGFaRHVYVWg2Qmd0emI4QWNkNVp1ZXJHMWljV05mUUda?=
 =?utf-8?B?RmlRbE9lZ3oyaURINWhKbXNuTW96SDhpbHN4ME9wd2tDMU5wNXRKamgrZCtW?=
 =?utf-8?B?S2N5ekJzSkVJY24ycktqRkRoQlpSRTkzVWZHemo2SDZ4cmNvUHA1b202Q2pF?=
 =?utf-8?B?Zm1uMnJTeTNMb0Z4ZXpyOVhyVHUycWFTK2xvdXFOb1EzSHFUQy9WUndIaytY?=
 =?utf-8?B?Z2ZWa3JSRUdzdllqdVMvS0lTYXBMaUJtWXVUMzVXbWFxS2FlV0t1SGYrWXIx?=
 =?utf-8?B?cUNyYkFmZHZVNWpvK09oY2FMaVg5c0lJMkVFSnZ2cWFWc1JYTWVEbmQyallH?=
 =?utf-8?B?eUZPQ0d3WmN0SmNmNXdMV2pwdTBIcG9DT3k0NGxVZWFDZkc2RkFERThQbGRB?=
 =?utf-8?B?YkFLaTE2aWZrUHVrelliNGpIZFlGa1dubVJxOXJrZVBPZVRtcEdxY0JqL0Ju?=
 =?utf-8?Q?OK94=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 16:37:40.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e46e86b-c62e-4a90-06e7-08de328a46c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187

Hi,

On Wed Dec 3, 2025 at 2:32 PM CET, Andrew Cooper wrote:
> __ASSEMBLER__ is how GCC and Clang spell this, removing the need to set i=
t up
> manually in AFLAGS.

Documented in GCC since GCC 3.4.6 and inherited by the very first public
versions of LLVM. I might just be marginally older than this macro.

I've checked the replacements and they all appear to be consistent.

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

