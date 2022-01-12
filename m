Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1E48C458
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 14:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256623.440547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7dHX-0000Jm-RT; Wed, 12 Jan 2022 13:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256623.440547; Wed, 12 Jan 2022 13:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7dHX-0000HU-O7; Wed, 12 Jan 2022 13:03:15 +0000
Received: by outflank-mailman (input) for mailman id 256623;
 Wed, 12 Jan 2022 13:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4a/=R4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n7dHW-0000HO-TM
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 13:03:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff45c5bb-73a7-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 14:03:12 +0100 (CET)
Received: from AM7PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:110::22)
 by VE1PR08MB4799.eurprd08.prod.outlook.com (2603:10a6:802:ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 13:03:02 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::fc) by AM7PR04CA0012.outlook.office365.com
 (2603:10a6:20b:110::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 12 Jan 2022 13:03:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 13:03:01 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Wed, 12 Jan 2022 13:03:01 +0000
Received: from ae1af0c725a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66236E55-6AAA-48CD-AC74-EEF3EE844AF8.1; 
 Wed, 12 Jan 2022 13:02:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae1af0c725a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jan 2022 13:02:55 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR08MB4446.eurprd08.prod.outlook.com
 (2603:10a6:803:fa::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 13:02:46 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::cf1:97d5:63ff:e9b0]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::cf1:97d5:63ff:e9b0%12]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 13:02:46 +0000
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
X-Inumbo-ID: ff45c5bb-73a7-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiD12yVF33hhP7D1rCSvvT0DjxYWVb7mbS/tTEXBKhI=;
 b=ZsaYDGflsv+MXXOOXnLvha6amkPwIn5zc2mMyb17R1Ll49UCwT5cTwuGwRQkxf+JNJQ0VAWJp1KI1I9L8KNgqxYHrO+V11DACjchUlSZxIJd2SEBW1DAzphXEtnC18s3FKRZyQ6s3i5egGrQr6cPDZL5y46Gj77D39t5doUeBLU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d682ceb7db7a3bd2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+dVneeoXZC0nQkHW5SDJ3pXJS1At+VwQqda4JV/5M7NNTeKr0RO0vXI88owkwIDxVAl1Y0oPtYq1Pw/BY3GyMvMewgbX0fN1VzQIBeAaZ1uaFm5im9U39kQu9ieSL3ZdozZUfch4EbCl7zNQDkegND8/scDBV708vclgaGnETb1YyyTuXvIqK5tR61wTVAHBGesIPU4G1Af+NK/V+kFtBq/iYFAuIfrysfeU4GVk+638rQZlPgY/gdLsouqDq5oztHviFx1myEFqHA5aHMwTS8jyCyQJZNA7lZNQ3fDH8bt+bf6BrpsVFc6Hy559HpUJkim2l4YCGKiBj/E2kP1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiD12yVF33hhP7D1rCSvvT0DjxYWVb7mbS/tTEXBKhI=;
 b=aBqryKQoTZT1hAbYqlXv/YnvQUM9nst3MoXmFbxyzCh8ecZLHXiSIbMsHt5fVWQXGCPCUNPOfeD85F0dzFCNruQtnEnoJ/5JeWRT3YCY6bfs44UgapF6l/28gDYrDkAXJA4y/EWTD8y/ma+TULtUoHubiqxMn3T0RcPmKsT8GifCa+gHooAxvDLSaZLFTWnM9VVA9AGZ063xVK+mowL3HY7lmasnsrCSzogfVLxZcmm9ZvCiwK9u/yL23+NAMPjrfIA+EE9mNaF2RwwZAdElLdb5rXAuKmdqKeAcYdc96l9wUycJ9tOEst98kXev9ciLHsU/tv9lukBDfnyjJl3/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiD12yVF33hhP7D1rCSvvT0DjxYWVb7mbS/tTEXBKhI=;
 b=ZsaYDGflsv+MXXOOXnLvha6amkPwIn5zc2mMyb17R1Ll49UCwT5cTwuGwRQkxf+JNJQ0VAWJp1KI1I9L8KNgqxYHrO+V11DACjchUlSZxIJd2SEBW1DAzphXEtnC18s3FKRZyQ6s3i5egGrQr6cPDZL5y46Gj77D39t5doUeBLU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4] EFI: always map EfiRuntimeServices{Code,Data}
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
Date: Wed, 12 Jan 2022 13:02:43 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A458D77D-BA41-41A4-9A75-1F2C54BC807F@arm.com>
References: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0130.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::9) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9597625a-3475-4f38-94e3-08d9d5cbdd50
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB4446:EE_|AM5EUR03FT047:EE_|VE1PR08MB4799:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB47994DDD8033D53FBDA23AEAE4529@VE1PR08MB4799.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:431;OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 25n0uWIPEsdvAr+E6J6bs55FB/0oKf517zIhueXS0kEbZbbW2YVfM6hbmYzdoq5wrDS2wWzDuwRSki3PinjmZ8etlPrkF2wKkW1xbVC48I5+BSBEWzw/lW+rtn1swPS0ezCb25XCqtD51d+evV+GMN5X00GcS6wQlmB9q62XgSofKKw5oMhAa/JRcZCAnysFRzB1GlHB9ak4IF65LbIzhCrQt+kGCfTin2VQalAMtlY0hav4ulvJ57vF+7qGmk4XCFJ8LBNYZuV+yVahTYOAFDJfCEgPB7TcB1VO6bbXxCc5/1jVeJCyLMgDNw1qvVYLiDWr8IGMX5we82351NkhXlOcMK/eT1jJpK92j8jhDZZF808NRjaRjs2fu1IZmm5Ha9w/v6TnGj3HzB4Ic5ny4CQ1muAyzgl2okg8NVnwtEJqcrl/3v4kpVQ/NHI9HppW93FUgtsb+cbk1HmyaP3UYnChsMVfUVadv/5WjgFlPBBzIvmH5u77y71fjzCnmIUjSOEz9bNAo/fYCWrqJyRWzFntMGHOSbcANj7bvsUjp0TR1vL0IRaZ49juhb4ILTginP0NJvIcx+iiUDRti2wdWqmu/BvttSwpsgyIl1MJAYbSTisUNc159IdvJadBPlPv8RxTEeSHrZGsHn/05pf7VshaW1Vs8Mncbq30vIFPu6g6YF2HlActNu9K79f9OHcO0an6vfYCUjmD5RCONs8ZsuDR5MAc7XZWGGtDfzhKeqA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(6666004)(38100700002)(66556008)(316002)(36756003)(6506007)(66946007)(2616005)(52116002)(8676002)(53546011)(86362001)(83380400001)(4326008)(33656002)(26005)(5660300002)(110136005)(6486002)(38350700002)(508600001)(44832011)(2906002)(6512007)(186003)(8936002)(54906003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4446
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73838ef0-5b8a-4746-1b80-08d9d5cbd3cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5AakMvRDGeJSox2Im9Hr6ieOxfdWPNeWHjc7dHm+923QPGhdlvddkBSESCtop8wOG8/2iTyXvWywQ963l1n5xaqP4Aast+JG4SGubORTxL7lWR6AiSLuz5qvM4Mh9dHDkKuVB16XWxHe21vytJtIuO4tW7sjkorNI6xI/wbalkmz6nw7wcu3ZSWkUyn5qT1TLI27UUvYapFBHn0LUp1Zj8pOT5kHdAGaQmpA1RDdEchRkkk0aFjRG5t+YuJC9ltjUym2BcIt0+osxsgHzE82Wj1S55A/FJo/786n89ysm12OOik/BHEzVMkcKRPErIJu32LSa0ZRMLGIClKG3Z8DeEuBmsB/sWGJeBO+O3l0jAZ6zTvKotQv7+kHxMGLvd+BTWHthfr4p1RRrQgbCkIm4pEjJavYn5+uSjyJJ+o3cOrkgeYlDt9B8QnEMbr+Wm+zqhZiLPZzshHOgTpJwqMwPmqCZxyfw4cBUkxgq59m25a4An1TV41LatpSa7Nmj5B0sw720HILQKlh8fZG9x6Ny8F/ScWAd1MI9AScBeT2uOv9wysann5duBTSSJXZdKdnX4FTV0T8+9cnopDXjaX4THtwX9H+Zr7tzfgckfvJe6l/YtlmI1odyVf5Y1hT1YOoJCu/AC2tsSR50LZwQO4DQ0BOhZBRlCJlSfAeaFAYsxQzY/36HEzikSTixbtwmwvgsCGcAaZNuBtybXXuOuh0w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6512007)(33656002)(6666004)(53546011)(36860700001)(8936002)(8676002)(83380400001)(508600001)(47076005)(36756003)(336012)(110136005)(86362001)(4326008)(6506007)(2906002)(316002)(356005)(81166007)(2616005)(6486002)(5660300002)(70206006)(82310400004)(44832011)(186003)(26005)(70586007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 13:03:01.7133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9597625a-3475-4f38-94e3-08d9d5cbdd50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799



> On 12 Jan 2022, at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
>=20
> This helps overcome problems observed with some UEFI implementations
> which don't set the Attributes field in memery descriptors properly.
>=20
> Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Hi,

I=E2=80=99ve tested this patch on an arm machine with UEFI boot and it work=
s fine.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

> ---
> v4: Drop EFI_MEMORY_CACHEABILITY_MASK. Fold with pre-existing if() (into
>    switch()). Style.
> ---
> I guess "map_bs" would also want honoring in efi_exit_boot(), but that's
> yet another patch then I suppose.
>=20
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1094,7 +1094,13 @@ static void __init efi_exit_boot(EFI_HAN
>     {
>         EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
>=20
> -        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
> +        /*
> +         * Runtime services regions are always mapped here.
> +         * Attributes may be adjusted in efi_init_memory().
> +         */
> +        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
> +             desc->Type =3D=3D EfiRuntimeServicesCode ||
> +             desc->Type =3D=3D EfiRuntimeServicesData )
>             desc->VirtualStart =3D desc->PhysicalStart;
>         else
>             desc->VirtualStart =3D INVALID_VIRTUAL_ADDRESS;
> @@ -1545,13 +1551,36 @@ void __init efi_init_memory(void)
>                     ROUNDUP(desc->PhysicalStart + len, PAGE_SIZE));
>         }
>=20
> -        if ( !efi_enabled(EFI_RS) ||
> -             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> -              (!map_bs ||
> -               (desc->Type !=3D EfiBootServicesCode &&
> -                desc->Type !=3D EfiBootServicesData))) )
> +        if ( !efi_enabled(EFI_RS) )
>             continue;
>=20
> +        if ( !(desc->Attribute & EFI_MEMORY_RUNTIME) )
> +        {
> +            switch ( desc->Type )
> +            {
> +            default:
> +                continue;
> +
> +            /*
> +             * Adjust runtime services regions. Keep in sync with
> +             * efi_exit_boot().
> +             */
> +            case EfiRuntimeServicesCode:
> +            case EfiRuntimeServicesData:
> +                printk(XENLOG_WARNING
> +                       "Setting RUNTIME attribute for %013" PRIx64 "-%01=
3" PRIx64 "\n",
> +                       desc->PhysicalStart, desc->PhysicalStart + len - =
1);
> +                desc->Attribute |=3D EFI_MEMORY_RUNTIME;
> +                break;
> +
> +            case EfiBootServicesCode:
> +            case EfiBootServicesData:
> +                if ( !map_bs )
> +                    continue;
> +                break;
> +            }
> +        }
> +
>         desc->VirtualStart =3D INVALID_VIRTUAL_ADDRESS;
>=20
>         smfn =3D PFN_DOWN(desc->PhysicalStart);
>=20
>=20


