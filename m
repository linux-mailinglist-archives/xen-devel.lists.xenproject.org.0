Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F8A87FDF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949985.1346426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IRj-00016u-F2; Mon, 14 Apr 2025 11:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949985.1346426; Mon, 14 Apr 2025 11:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IRj-000150-At; Mon, 14 Apr 2025 11:57:51 +0000
Received: by outflank-mailman (input) for mailman id 949985;
 Mon, 14 Apr 2025 11:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4IRi-000145-1U
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:57:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2413::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6b2d06-1927-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:57:48 +0200 (CEST)
Received: from DM6PR07CA0125.namprd07.prod.outlook.com (2603:10b6:5:330::7) by
 IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Mon, 14 Apr 2025 11:57:40 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::e0) by DM6PR07CA0125.outlook.office365.com
 (2603:10b6:5:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 11:57:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 11:57:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 06:57:38 -0500
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
X-Inumbo-ID: ae6b2d06-1927-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCa6tgDkOKqHgbv9AHbwrZn4jFrrYeuoCApdR9i8lpYJlbh05QMorDRysq8kL1rlTyybeL/VVF83ws/DsUa7O/PYIGsbuVSPb+79VvlAVkOUd5h+ejraszhx+A3WpwQ5y7XhVjYZUfGOQfn7N7D3piqNc+m6DT/IhLj4ZaKB9euugS+a/fjFjz1227NrIQpXUdKRgmIR7Jrj4+hKdzuviN13isjQUJPPXkgHBv+6vkc5T/UhHDRqLb7LiBTSqJzJ6Q+cx4/vpy6iTSNbQvdLZg7KECWc653OHCo81wGKs/2vL9d95noA/qlLNSbxLFz8cwW3RS8rKOdyDcR/exLXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlS8vG82HDJzm97BmOHzZQ4g7l4H7Ov7PT9dnb4Rn6k=;
 b=VBQ6tvCha6jaXy/k66vhAke3Gk6Ofm75cqfU7bka0GugAzHR2V23TbzJl6b+B21XRomOD7rs3zXuYZJA72g0UPXmAUqtxOQpdeBkZsmAM11TVe+3krccXGST2V/dsmyFWifyqZztry1f+S4LYZYhKf+CkNhqJfcp5NTrvQKqga5IxvxisDy4ahwxkd67km3XlywE6hdZbum3cd3185LphvBjPfu50k47rNT4gBYZ0xUKlUAZQDbD9C6vNIMqwxuEp+2lh6IbbY7Ev7/7nJGFDANM56a7C5Rm5sZnady/6PsbgnquiTJBBkG6lHDR7X60xp88Kj3joyzZHO7BifibJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlS8vG82HDJzm97BmOHzZQ4g7l4H7Ov7PT9dnb4Rn6k=;
 b=boIyNP9RT3UpVD/COSOepxgmuQBAKtNwxqgH92fSVvehCEotIQphSYF+4BDEu4rHeUY7r/g7z97E61rUoF18Na9SK1fP9F7GgW0WEIE7BX40xEpzG1O8vgoRVE6RMqZuX0I4h4B28Joc9xliwnhv4EOiRauUiDT/YOaLfuauh6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 12:57:37 +0100
Message-ID: <D96CDMX3B877.3MD1OKAJ6JJ3E@amd.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [ImageBuilder] uboot-script-gen: add xen xsm policy loading
 support
From: Alejandro Vallejo <agarciav@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250414081449.1763962-1-grygorii_strashko@epam.com>
In-Reply-To: <20250414081449.1763962-1-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: af10f1b1-ccfb-48f9-6ea3-08dd7b4b8e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmhIcnNRbmVLSGFseXhLaVBYNTV6TncvOEJLNXR1TnlzQjhtVFFscnpCSjVU?=
 =?utf-8?B?d09MNVd5cldtSnN6Slc0bzE4c2FjOHY4WEMyY2dCTjNGZnRlQ01EYzlDbm1i?=
 =?utf-8?B?UVZpdnJwR09qMVlpa243d2xxS1IzSGRxVGk1TUtxWE9mREtEOHVSa2dhTitI?=
 =?utf-8?B?ZlJQZS9UYXQxQ2wvWHNBZmhRbFJWaUFlUU1JR0xVRndldnA5ME5wNlFYVVRT?=
 =?utf-8?B?VjJOdmdPRUdHUkVDUjR2bE5HZy9FNncxYUpBMVgxV09tWDdiMDQrQ1Z3MFk3?=
 =?utf-8?B?bzhwV0wzdFBIVDc0SmUraVR2OFJxWElSdHRrV0hrR09LV0M1dVh3czN6Q1VK?=
 =?utf-8?B?K2lUSUkzSHVpYXZpM0g5aEI3Y01mc1N1ejRGejRzcCtXNDJWZVB4cGxRNGZQ?=
 =?utf-8?B?V3Y3TkJmd0ZtL1h4SUVadlNUWFYyYW5sakNEQ0M1V2NkVE5BTXRhRVpzYXJU?=
 =?utf-8?B?bi9jTVlNMHh2RVMxdmhCWnRtWXFmaEt3SDFVVnUxdXJwQmc1TktMLzY4encv?=
 =?utf-8?B?eTRJMlB0VnpQOTFYb09Cc3dBd3lUN25ydzNjbzFoZm5KSFpaNjFwWmp6WWI0?=
 =?utf-8?B?V2tlQ0FQM3U1VUgzTFBIVFRuSEs1WkZsWEpNYWwrTG4rZTJPZjdBSEwydytP?=
 =?utf-8?B?elVKTTcvZUFVRUZHVzcrdDl1dDlVRW43R1NsbUhmSTRmT3BCdW5XRGxPQ2xX?=
 =?utf-8?B?S1h2b0VuZWJSRmQrcHdPQTZ3dFlXYTZtVXN0aWUzbCt2V2g2YlZ1ZXBxTmY5?=
 =?utf-8?B?TzB0ZEdEbHJteElaNm9OSUJmQzR0b3lGcXRrTjlRYXQ2TGVyRzROWng4UWE5?=
 =?utf-8?B?aWJwY2dNamdLRTFKejZGcWFYWkkvMGNxb2VNRVlLL01SMWRveUVqSm1hWmVS?=
 =?utf-8?B?MGFYK2ZCOTJ0bXF2eTFEM0t3ZUVBNEF2K0JVR21zOGRHdWR2TU9nNFBwWEF3?=
 =?utf-8?B?TVR4RUFRaW0vT0lHSlRlTFJ2UElqTGJoUFV6YXNtZEZNdzJFVWdDcTY4OTlq?=
 =?utf-8?B?aWo0VTQ1UHNwR2RlenVMRzY4VnZiU0hYc1R4di9uZnZBZTdlNFNBUlVCZTU5?=
 =?utf-8?B?OHllS1JBLzd5V0Z1V2MrQnpkTGxHLy9GbjZ3YUpSV0htZjdrVDErdXFLL1hy?=
 =?utf-8?B?Skc4WXZMV2FGRC9QVEt2VXJMWXlRZzlFUlR6ZGYwVnY4L0MzVThKRTN0azBE?=
 =?utf-8?B?UEV6aGpleFFKTDNjdlpoMzVqZlJhd1I0UWNLN3BwVW5IdGl0eDdrMGE4UFFH?=
 =?utf-8?B?Y3lTazlFRUlyQ0N5L1AvS01lVGZVK2pwd1plS2JhWHdUMWJwRDh3YnpNY0hk?=
 =?utf-8?B?SkVyNFp5QXFUSjRrdVFNS3d1MUpVcHNidVBrN1VIc3Bra1k2MTlKcEJlYmxV?=
 =?utf-8?B?UUN1VjFHWElza2ZBd2N2QzRSRTFidjU2amNxdU54TDdlRlZMNW02U3o5TlRP?=
 =?utf-8?B?SFppcGFBckxlUTVPVFhpL2pnc1JENWNCd3YySm5ZbzAyc1h6N3BJREdYa2Ni?=
 =?utf-8?B?ajZCV2VMT0c5cDZLOTQzVUVZNU9XbkpMWUJTMVk1SG94MHVMb212QmUzd0Y5?=
 =?utf-8?B?ZzZoQ1ZCdWVRV29qYktyTHVZaEhnTWQ2MnEzVGpmWmdQR0xvY2REZVVGNGZC?=
 =?utf-8?B?WHJzaEhoQjQyc05lWlYwd29JalhBMExZV2MrOU05K3dwN1VtRjRJVWQ2N3Bt?=
 =?utf-8?B?SjBtUzJBc2hPUDZUV3J5eHR4MElrdDZGKzF3RW9MSUZ6QmdmSUVPaFhrMUFF?=
 =?utf-8?B?c1htdEViQ01TbSttbDRVZDR6S2kyZVBUV1VZQldrakVjSllBZU9QaE1ZQjAr?=
 =?utf-8?B?Yno1WlQyS1VSUS9BU3hMWHB5QzdFVGNPdzljMUxWak9lcmFqQ3JxT3J3SDZo?=
 =?utf-8?B?dWVPTnlkK3VOOEtzR3ZqbjR4Y1hsUkYxdU1QcGNKS09QMWdxODNnZUxsZThQ?=
 =?utf-8?B?OTJ2NW1JUkNrQ1M5ZUpVSVVrOURiTkU3ZWd0Nlo5NnlEYk1pK01IV01XWEpU?=
 =?utf-8?B?dWk5YncrSkZWTEZaNHZLV1Z4emZRTU5KSFd5NFhVa1YvbGVHeHh3WXlJd2hz?=
 =?utf-8?Q?WnViSV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:57:39.9217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af10f1b1-ccfb-48f9-6ea3-08dd7b4b8e82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580

As a general question, why using "test" so much, rather than

   if [ -n "$FOO" -a "FOO" =3D=3D ABC ]

Using test seems far harder to read than it needs to be, and single
brackets are perfectly valid POSIX shell.

On Mon Apr 14, 2025 at 9:14 AM BST, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> This patch adds Xen XSM policy loading support.
>
> The configuration file XEN_POLICY specifies Xen hypervisor
> XSM policy binary to load.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  README.md                |  2 ++
>  scripts/uboot-script-gen | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/README.md b/README.md
> index 137abef153ce..9106d2a07302 100644
> --- a/README.md
> +++ b/README.md
> @@ -91,6 +91,8 @@ Where:
>  - XEN specifies the Xen hypervisor binary to load. Note that it has to
>    be a regular Xen binary, not a u-boot binary.
> =20
> +- XEN_POLICY specifies the Xen hypervisor XSM policy binary to load.
> +
>  - XEN_COLORS specifies the colors (cache coloring) to be used for Xen
>    and is in the format startcolor-endcolor
> =20
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index c4d26caf5e0e..343eba20e4d9 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -315,6 +315,15 @@ function xen_device_tree_editing()
>      dt_set "/chosen" "#size-cells" "hex" "0x2"
>      dt_set "/chosen" "xen,xen-bootargs" "str" "$XEN_CMD"
> =20
> +    if test "$XEN_POLICY" && test $xen_policy_addr !=3D "-"

If XEN_POLICY is a binary, shouldn't it be "test -f" ? Same later on.

Also, missing quotes around $xen_policy_addr

> +    then
> +        local node_name=3D"xen-policy@${xen_policy_addr#0x}"
> +
> +        dt_mknode "/chosen" "$node_name"
> +        dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy=
 xen,multiboot-module multiboot,module"
> +        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_=
policy_addr $xen_policy_size)"
> +    fi
> +
>      if test "$DOM0_KERNEL"

test -f?
g
>      then
>          local node_name=3D"dom0@${dom0_kernel_addr#0x}"
> @@ -900,6 +909,14 @@ xen_file_loading()
>      kernel_addr=3D$memaddr
>      kernel_path=3D$XEN
>      load_file "$XEN" "host_kernel"
> +
> +    xen_policy_addr=3D=3D"-"

Do you mean =3D ?

> +    if test "$XEN_POLICY"
> +    then
> +        xen_policy_addr=3D$memaddr
> +        load_file "$XEN_POLICY" "xen_policy"
> +        xen_policy_size=3D$filesize
> +    fi
>  }
> =20
>  linux_file_loading()
> @@ -939,6 +956,22 @@ bitstream_load_and_config()
> =20
>  create_its_file_xen()
>  {
> +    if test "$XEN_POLICY" && test $xen_policy_addr !=3D "-"
> +    then
> +        cat >> "$its_file" <<- EOF
> +        xen_policy {
> +            description =3D "Xen XSM policy binary";
> +            data =3D /incbin/("$XEN_POLICY");
> +            type =3D "kernel";
> +            arch =3D "arm64";
> +            os =3D "linux";
> +            compression =3D "none";
> +            load =3D <$xen_policy_addr>;
> +            $fit_algo
> +        };
> +	EOF
> +    fi
> +
>      if test "$DOM0_KERNEL"
>      then
>          if test "$ramdisk_addr" !=3D "-"

Cheers,
Alejandro

