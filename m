Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9AB53995
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 18:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120661.1465493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwkSC-0007GX-8J; Thu, 11 Sep 2025 16:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120661.1465493; Thu, 11 Sep 2025 16:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwkSC-0007Ew-5L; Thu, 11 Sep 2025 16:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1120661;
 Thu, 11 Sep 2025 16:47:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwkSB-0007El-2W
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 16:47:23 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8ad360-8f2e-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 18:47:19 +0200 (CEST)
Received: from BN9P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::34)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 16:47:15 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::ef) by BN9P222CA0029.outlook.office365.com
 (2603:10b6:408:10c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 16:47:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 16:47:15 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 09:47:13 -0700
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
X-Inumbo-ID: fa8ad360-8f2e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMwudRTYnfywoBL63X50/xGeCCpnZv//tzghqtzZ9zlSQXU0ZySKwTd0O5lG8PKIETuAqyYgdG+Fk8UVB2+PV2jJqe5L0fCM9QQSbLC+qwKdLYP2+EXmomnmXecM2A9zGXp63KlpxB38AKictGF0W+v/84REieCcXXD+LZOkHCQ32q9mstOpz9qEdJSkPm3F4tACGqBE51Nc0kvYoB94wyR0z/LfIVG0glEQwyNJf9QrkYfGpc2dcx1ws0E46/irqZlMAfd29R0H6YFd2F/b2v/sTHvDMy5Ddagjz/3GgFNFFTflzzQwr1XLEFvhQbXYWlmaapj9h4xPTRzKx7S3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyl0XrpajtGk8BJ+o2kIi42BC4riVLLVKAl8oupkkRM=;
 b=cKXy0T8Wbj1R3DSJqCVaEndJqCooGsdVfJ8QagdC25w2fm35R+MTE6x0yiYzlz6dNIhfTUspuxc9l9LTwMaruOLWcFsh8GEhEQ8tNNupVHQ+7frhvZflmgLDcv1ydDH11Lcw/5xrd3jlG/EErkxyf+cCAsc1lH+nUuH8LM+kKWMijukhYeBNZn0sLQKka4b+6CgpPNcfXN2mgdAm7B3KsvRPzpFZI6zobXKUgxD/xe6ITnmN4m4yPlAMlx4z/iTjgEUN3dBShjsphzmotcWbRVw6PWo3mHaQ5tff3kdmJmTnibECtqCe8hEvRiVZ8ikElxCsginZp/SNHnt/NNdosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyl0XrpajtGk8BJ+o2kIi42BC4riVLLVKAl8oupkkRM=;
 b=TRTdOwrN3j9loHgsEzMMXFrciQotJAeHJbxoySFlb+EnaEiqp4UqWnGXVlnWRuvmIZfRMXCcAUXhOZF/trk8/6gkuMarKPseFL7Th/czf2gmYQQFQbchD8NHpF5eH+LnqIYCHjr51aI6z4pBbgvrqa4ia2cmjPEmu1vSZU2bq08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 18:47:12 +0200
Message-ID: <DCQ4H2JRCH73.1C3AUOOJKQ02C@amd.com>
CC: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 1/3] efi: Fix line length in init_secure_boot_mode
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <e891b84f4814c1feff7a6bca51c89dc9c8971b02.1757519202.git.gerald.elder-vass@cloud.com>
In-Reply-To: <e891b84f4814c1feff7a6bca51c89dc9c8971b02.1757519202.git.gerald.elder-vass@cloud.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 533fc907-07ba-4cd1-e831-08ddf152dd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1JlN1MvWWoyNVBaa2hZc3MxZ2kyRGplQkRpekp0SFVzbkF2T2tCaDZMNFpj?=
 =?utf-8?B?TzB5eDRqNk5qaDUrR3JUMStIZXkySEN4bDVHdFdMVE03dXRGaUI0S3Z6SXRm?=
 =?utf-8?B?ZU1vTmJ5VXdzTzJjazMxMGZhWjNlNWx5dmZicExUWG5STjk1V1AyOVplQVlG?=
 =?utf-8?B?OVd0SFVFVkN1cW1oUkV4S1NiZ05PYkpHbDV1UDYwYkRITmk4cW40bDR0cTBt?=
 =?utf-8?B?TXoyRTVNeHllcTBibU5EU3VNSUdKUWtyMzVtMHN2dnc1Y3pZdlE5aEU5QzVK?=
 =?utf-8?B?Y2dnaGp4WTJDNXdwUy9JQkQrMTFNUU9RRER5MjF0VkNIOG92Qzl2aUsrYy9h?=
 =?utf-8?B?UkhzWEljUm53dTJrQmpETXk5cnI3UG1tMy84cVQ2QUlodHhLU1BVVFNpTVBo?=
 =?utf-8?B?T1ZFVWZQUkg1NWlIRDlhd0dSbit5bFNuRzV3NFloY2puTTdpanZ6M1JySTFl?=
 =?utf-8?B?N2sxZWJnVEwvWkFOVm9hQU9qSXAyVGJCbGR3NnlBMC9jemNZLyt6NFlaOFNp?=
 =?utf-8?B?Nk5vMFZrT3BzZWc1cjJXVUMyTXlyZHhsMk9lTHlpZFIzM1orL1R2akF2UW5x?=
 =?utf-8?B?cFQxTjg2UmpwWVh2OEsySit0clBwNm1hZDVUVlMxZ3c1Tzc2S29IRGVtbHZN?=
 =?utf-8?B?OFdNSWIxRE1WZnZvUmgwQUVZdDYwRTRaTUk5eFFPZWxEdFpmTEh1OWZhbktt?=
 =?utf-8?B?cGxJd2V1Qytsbm9XeVpWanQwWWprclhsMzdoL0JDWlNwWDMwR01kRjJOZytP?=
 =?utf-8?B?VGVBR1dpZXBlaytpelhNYjB1c3poL2pSOThCTHp4Rzdla3ZiaU8rdk9HUDVI?=
 =?utf-8?B?cW5Da2NFTm5DWXpPYStZbTRUdWV2enVWQ2FLTzJhNVkxYUVxdENYUE55NDZM?=
 =?utf-8?B?b2RYeU9KaXFqK0xQUnZENHpTSjlLRXluTFRxWjN2R1NwTU5odzFCRDRJR01l?=
 =?utf-8?B?UWcvZlIrTlYxUkI5MExDdFhFcU15bW9meU13YUJMVkhWWWlqakJTWHpkQ0oy?=
 =?utf-8?B?Z3VzTDhjRnJ1ejM4dys0NVpFZE9GK3lOVHRoOFBEeUpNa0NBWGFjdHR2Tzgv?=
 =?utf-8?B?dmdjcXhVVFpKZHFxRThrcHJkcWl1M3RYMlc5TklOcko1QlUyVWdMa3lyV1NT?=
 =?utf-8?B?OVl0TUdPbnplbTBqTW9WTzg3L1FiYjFHVFZqY3hBNkxKWWxwTHFIWlNVdWp1?=
 =?utf-8?B?Z2lnN0NhTXkxcHdDUlhtWlBPS0F6dnhGak84enBFTXlNZXZYNXRka3l2NXZN?=
 =?utf-8?B?aVFkd2VrUXVnSldKbzNCZE94amNyOGdKME1UUFMwTTZySHMyM3l0S2Q4WHMr?=
 =?utf-8?B?dFpaN3VFUlRvUGZQTlU1cm53cnVkeVIya2dHS0k4MVJGb3B0TjBmdkIxRkJD?=
 =?utf-8?B?bWRxekR6blZDUUpyVHB3a2RxaVM5ak8wWkhJLzFaY0VOVEV0bWVvR2pWYWR6?=
 =?utf-8?B?akZMSTdtOG5Hd2lTU05Najg1L0VzRWlxdjNkUklsK29md21IYy9iRGpaZy9E?=
 =?utf-8?B?THNVZXBtVXl3WnYxSG9oenFyWDRoTThNSnJkeVZiSnFxdm5pY2ZFMGs1N2M4?=
 =?utf-8?B?ekFKTys2ZDBCbmhSbkx1Ym93S1BhaHNuVG1HV0ZYUWZhWkEyTE5MMWorNlJJ?=
 =?utf-8?B?c2VkcVlWdnpEcDZXckVrK1dNeVM0VmdXdHpyc3ZIdk90MWduTDZUWTdCREFp?=
 =?utf-8?B?NHVEcVZsNkt3NXQwSEhTSytMcEhWRVorNFpETUJRMGh2Qmtqd2FzTjdtSEkz?=
 =?utf-8?B?REJjVWFjanFGT0hsb0VVRWlRRThCWUl6dVVIZGFPSXlmYjhxYWRRNUZHZDBT?=
 =?utf-8?B?SjZOT1d6dURJUkFJNUhPVHNPWlN1dEsxREZ1UVZxeGJ4WVFvSExTZ1VjMGVa?=
 =?utf-8?B?ancwM1J4SmpING5WbHZ4SnAxOWNrYklmanR0eXNDU0dXUzBRRzVyOVNwVmZw?=
 =?utf-8?B?c2lzaTBHTFNwUGRlSlg3eWU5cGdOVnhLRWRFTjdNcW9zNFNvSlNXRWNTaVVY?=
 =?utf-8?B?cjU4T3ZYWE41UDdDZ2RRNnlTS2hMaEc5aFNTaURKb0pacjhDbFdadkJaKzNp?=
 =?utf-8?Q?/pWpvM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 16:47:15.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 533fc907-07ba-4cd1-e831-08ddf152dd2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203

On Thu Sep 11, 2025 at 10:24 AM CEST, Gerald Elder-Vass wrote:
> Commit cb41b4ce14a9 introduced init_secure_boot_mode but one line was
> not wrapped appropriately.
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
>  xen/common/efi/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index b86c83d3348c..69fc022c18ab 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -923,7 +923,8 @@ static void __init init_secure_boot_mode(void)
> =20
>      if ( status =3D=3D EFI_NOT_FOUND ||
>           (status =3D=3D EFI_SUCCESS &&
> -          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_RU=
NTIME_ACCESS) &&
> +          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS |
> +                   EFI_VARIABLE_RUNTIME_ACCESS) &&
>            size =3D=3D 1 && data =3D=3D 0) )
>          /* Platform does not support Secure Boot or it's disabled. */
>          efi_secure_boot =3D false;

You're not wrong, but it feels a bit excessive having a patch just for this=
.

Oh, well.

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

