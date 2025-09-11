Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81768B53A43
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 19:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120693.1465503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwkyV-00041o-O8; Thu, 11 Sep 2025 17:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120693.1465503; Thu, 11 Sep 2025 17:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwkyV-00040T-KT; Thu, 11 Sep 2025 17:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1120693;
 Thu, 11 Sep 2025 17:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwkyU-00040I-Ao
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 17:20:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2415::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a584a0a7-8f33-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 19:20:44 +0200 (CEST)
Received: from MW4PR04CA0135.namprd04.prod.outlook.com (2603:10b6:303:84::20)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 17:20:39 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::4) by MW4PR04CA0135.outlook.office365.com
 (2603:10b6:303:84::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 17:20:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 17:20:38 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 10:20:35 -0700
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
X-Inumbo-ID: a584a0a7-8f33-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgjlpbR0y9F406TNN3Xslshdwpeso0jAIfY08Pj8F+1NYs6179iLFdUoI6FhfE4CHszaW5WRxWH79WhY/ZuOe33utbVdXBguiY2KX+AhivOi1VZvbQsNsG2Dk6CBesiH+m71j6H3YwIuucqMQbrRniNFFl3025TDjv81x87uxjn/95453vXFBUymCdcVG3Ew62XHdMEIbYoaurwSTaTjnq23WCQxWJQZxO5LmtqgRmn8z1DHL42s1+sXms1QwDeeg7bt4LNrY3g5WxeBxEGqbRisNL6oBGZl/0ZhPySHO3Q3tyR0dI/4FCXYRryAPkjeuaMxvBxFi6N5+9foYNviCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtD0HXiA6kfML2R5w42sJk/0LJZtoVkpc5kiCLJuFaI=;
 b=lHManHIRfza+6Dda0wOx62y6liPuxYLFDEvZcDsnq4ffZX0u8eurPQZmEQ9RRNriSGfbm5LZ9bkVydTVKXsZSdHDnkS0jZtEik+l4FTCRU4EPqseITHtVzYydgpT0K63DX7J0OkRVjv9ecQi0UZGFp3e5w0TYO7/akFdPfDH+H/iZ1r5LqHHZoWe8v+oKZXiVRY9VIT6OZiE/tQVDNVyfk87mqmzdymaH9RF297LtEAGcn4ZnfluOduUE/gGN+NPOC3HUO/9f7+hKdb2KyAc0a1jWJh3V5SyNTHNp9dJvb/X/nwHgHRkROdUK9qqBC61i0C19YukuDz51y80ojF0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtD0HXiA6kfML2R5w42sJk/0LJZtoVkpc5kiCLJuFaI=;
 b=ihnlEoCvaMdaTLVSOWH/HEvwZSAZAr3wyhTI5ay6g0/cjYI6wTjb2Giq6YH5kOpeUogq2bwRhFIPs9HLtIiywqFHgYb0o0YlNqKfHdkYhe5yQUIkVLE7KmBf0vhBEIfewXT7zYp2S1WrFNyKXM/Te3lDL5j1vHY8aymM0y85p9o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 19:20:33 +0200
Message-ID: <DCQ56M1S1EH6.ASTCL1OINQWY@amd.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 2/3] efi: Protect against unnecessary image unloading
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
In-Reply-To: <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 26778f01-fc76-4b88-6b37-08ddf15786f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2QzckJ6OU04N3J3M1FyTFJpblRoQzJJWmU3RjcyWlIvdFBoVDFvTExoZncr?=
 =?utf-8?B?RUpMY3dVODVzR0FwLzZWVXkrK2RldHI0SnVHejJqRnA4SGVqWWVnY2FsN3E5?=
 =?utf-8?B?Yi9uNTFRS3NITTZweXNsTVpyNFhpdDRwNkFOdnArZkNlVVZKZW12aFBYY2NK?=
 =?utf-8?B?VWk3OFEzdVZ6Z0kwVjdJaWsvclRPRUxjdkJYTWhlbEdOM2lIK2RxUE1zYVp1?=
 =?utf-8?B?WXcvQUdnL0MvTE4vQ1VGVWdKZUx2OGdPblpBMGZMVmF1QkRJZjRtQ09VeDBM?=
 =?utf-8?B?eThQMDJvMjdhbGI5QW9hTkF5USt2c0xDWVVEYVg5UmtiTkZHL3hwWFdnZmVD?=
 =?utf-8?B?MFYrNm1nSmdPcVNGMlpYV1dkYSszL2pHYjBVQ0N3cU9SMU9MN2hMcW1kSGVu?=
 =?utf-8?B?elhicHl2VXZoc1Rkb0Z2MWloNURlb09STTRHQ1Uwb2x3K0o0MG5pR3NhWEo4?=
 =?utf-8?B?LzhjVlUzRDJuQTlhbXZ1Ymc1R2E0ak12dTJRQTdSdGNvUU52OWpnYkFuTWVT?=
 =?utf-8?B?dVU5b0kycHhJa1M5VlpOcysxbm5qdkkrckp3Y05hRWs1bkZzN05nSkxMWko0?=
 =?utf-8?B?U1AySERZQVA0bUp6MGFFTk1mVzVhV0RBeXFaOGpENmZ5SHloU0VTLzlPYlZ3?=
 =?utf-8?B?Q0J1amYwZ1JKSlZjRlNFK0twL3VjSSszaWZKSVJxbkpib0xPNS9QVCsrbVVp?=
 =?utf-8?B?TmFUNXA0VWwxdUQzNTNZdnpMMlNrMlFxdHBPdnhNcDF2aDJvdEJuZ296aDJv?=
 =?utf-8?B?Um1HMHhzT3cyZEtCNjJBSXI3MDJUVHN4cWErbzA4UGgvN0xtZXRRQ3NpcGdr?=
 =?utf-8?B?ZS9PUDR3bnE5YmNIazJXQmxUVU5YS3NsdTdhZDJicW4xL0ZJenVTVmpVckxz?=
 =?utf-8?B?V3h4Q1dPbHBlajdUYjFhY29jQVJlaDAweTZwUEQwOWxKc3F2dnpieHBGM01x?=
 =?utf-8?B?OG9CVEhaRmlNUlF2M3ZPV1kwWGQwQm9BTjUzRjluZnFtaGpGQ2V0eWphYm9N?=
 =?utf-8?B?dXpMM3hULytmeEFDLzQrR2d6ZzRxWWEyTFBVZHRVVWpkYXNLQVVtS2tvRTRo?=
 =?utf-8?B?RWNJeVBRdzhyd3BPUWJSbnhZaks2TW5BUmJxdC9vNEtXNmhxT2lCTmdLT3Fq?=
 =?utf-8?B?Q3lhTHVFaDZ6UlEwWFpPaEdaTGs4L0c2WWdSTG1seW9vZW9wamJMdUtqV3Iy?=
 =?utf-8?B?aUdUeEhGS2FDTktaS09zOHJoUzVCNFRBeFpCZDRjYzl1MGt4RzdiMlBGMEZz?=
 =?utf-8?B?cFlDbUVXUVV2ekREQ1c2SkpjK3lrc2NKMHU1U0doc2gydkI5bTA2MkRhOEZL?=
 =?utf-8?B?d24wL21XSEFpRlYyM1JwajFSUjJxaFdFaXZxNyttTmpROTM5RnVYZDJ0d0Rh?=
 =?utf-8?B?MG1BcXhrcnhnV0pucEd1OWUvTGFjaTdwSjFsYXBhV1pOZlhIQ1JQQ3ZEaVBo?=
 =?utf-8?B?T0h5RTUra3ZXTitWbW9rUUtodlltLzdjSUNDL2lOTTBUQndGUGFSemd0cFl0?=
 =?utf-8?B?N1ZDT2FITStwV050N2o3RHhsNFh2dVF6QWVBeVZmMjJVVWYvaEkreTRJVi95?=
 =?utf-8?B?OHV0TU00Znh6R3BxZFR5ZlV4d216bUVWbGEyVXRuT0Z5WHIxZnpCTnpZM1Ay?=
 =?utf-8?B?ck12Nlk0MmIwYXJybXdMMjRrcGc1OTM5c21hNFBnK0VZUVJlZVc4cStEelU1?=
 =?utf-8?B?cHlnSkJsNG9CaGlOaTBLYlJPNElpbUorUUZxb0pTL3h6Tk11VUJLUllPdTBE?=
 =?utf-8?B?d3NFbk9zMnNXMFhlT3F5dWRwUG5OeTBwbWtiUkR2RWJTWFQxdnptanJxVERi?=
 =?utf-8?B?VHFqMFBQSDNPSk1zZHo5NkRoM2QwUjEvRlVNblBQK0wvcGRsdDY1dlowc2lM?=
 =?utf-8?B?bmlRUGtXMWozbzVsdDBMV1FrV2FJT3dHWmYvbzVhM0NUZGVXa0kvNEZ2WmFo?=
 =?utf-8?B?Q1NLV3lUbkJTNG9JTmpadWN0UzE3MzIrUEdWQXQ3T1hjak1DeEtjZ1pMTW0v?=
 =?utf-8?B?YkNXZ0pGT2dBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 17:20:38.4026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26778f01-fc76-4b88-6b37-08ddf15786f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

On Thu Sep 11, 2025 at 10:24 AM CEST, Gerald Elder-Vass wrote:
> Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
> image after loading it (for verification purposes) regardless of the
> returned status. The protocol API implies this is the correct behaviour
> but we should add a check to protect against the unlikely case this
> frees any memory in use.

Any what memory in use? The function loads an image, it's not a consumer.

It can't free anything because it doesn't know where it came from. It might=
've
been embedded in your own binary, and it can't compromise its integrity lik=
e
that.

>
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> ---
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/common/efi/boot.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 69fc022c18ab..ca162db0d8d3 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE Ima=
geHandle)
>      static EFI_GUID __initdata shim_image_guid =3D SHIM_IMAGE_LOADER_GUI=
D;
>      static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>      SHIM_IMAGE_LOADER *shim_loader;
> -    EFI_HANDLE loaded_kernel;
> +    EFI_HANDLE loaded_kernel =3D NULL;

This isn't required if unloading checks for the success case or the only er=
ror case
that has a successful load. See below.

Furthermore, you don't really know if the callee clobbered it.

>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_STATUS status;
>      bool verified =3D false;
> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE I=
mageHandle)
>              verified =3D true;
> =20
>          /*
> -         * Always unload the image.  We only needed LoadImage() to perfo=
rm
> -         * verification anyway, and in the case of a failure there may s=
till
> -         * be cleanup needing to be performed.
> +         * If the kernel was loaded, unload it. We only needed LoadImage=
() to
> +         * perform verification anyway, and in the case of a failure the=
re may
> +         * still be cleanup needing to be performed.
>           */
> -        shim_loader->UnloadImage(loaded_kernel);
> +        if ( loaded_kernel )

Not sure this is what you want. The image needs unloading only when there's=
 no
error OR the error is EFI_SECURITY_VIOLATION. See section 7.4.1:

https://uefi.org/specs/UEFI/2.11/07_Services_Boot_Services.html#efi-boot-se=
rvices-loadimage

... and shim being a drop-in replacement, it's meant to be spec-compliant.

Trying to unload based on the assumption that loaded_image will remain undi=
sturbed is
an assumption waiting to be broken.

IMO, this wants to be instead:

  if ( !EFI_ERROR(status) || (status =3D=3D EFI_SECURITY_VIOLATION) )
      // unload

Cheers,
Alejandro

