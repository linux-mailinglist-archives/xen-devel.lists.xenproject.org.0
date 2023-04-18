Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F66E6664
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:52:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522892.812536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polk3-0005S6-IS; Tue, 18 Apr 2023 13:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522892.812536; Tue, 18 Apr 2023 13:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polk3-0005P7-FR; Tue, 18 Apr 2023 13:51:31 +0000
Received: by outflank-mailman (input) for mailman id 522892;
 Tue, 18 Apr 2023 13:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1polk1-0005P1-6I
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:51:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d4dfdd0-ddf0-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 15:51:27 +0200 (CEST)
Received: from AS9PR06CA0250.eurprd06.prod.outlook.com (2603:10a6:20b:45f::8)
 by DB9PR08MB6746.eurprd08.prod.outlook.com (2603:10a6:10:2a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:51:25 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::2d) by AS9PR06CA0250.outlook.office365.com
 (2603:10a6:20b:45f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 13:51:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.21 via Frontend Transport; Tue, 18 Apr 2023 13:51:24 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Tue, 18 Apr 2023 13:51:24 +0000
Received: from 1b2537ff0838.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 507DFE23-106B-4ED2-9730-14D6C5327966.1; 
 Tue, 18 Apr 2023 13:51:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b2537ff0838.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:51:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GVXPR08MB7749.eurprd08.prod.outlook.com (2603:10a6:150:69::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 13:51:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:51:14 +0000
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
X-Inumbo-ID: 1d4dfdd0-ddf0-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuyqEWRAZsnQzZLqYDtLoGjpSahmTRSrOVECSbWYQq8=;
 b=NrH9WSH9wSd8vzN25QkatWmN9OOmZ6ANYRKuAtnmvdvs4emNHiIkylnMN5bGI83AtObGgeLsArEpfOic+2qBKop9EkmqcRQbYqUphlQU8NTzYO2OWZZLzVveW/JjBahcXAFOQfZPslycvTqaGdEGmTjVgEfFhGhgIH+vE2QAxDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ad9fe6f39e9026b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMKwQnykp1943zmngx4dvliRbnVl6wWY4q+cpfBxxYA4cDHBiQeR7SMfEk6pTFGa46hZ/R/BM2zyaFK3QmyULq5sow5ET1s2Os8ZP11vEaxBxcqAcPEW9SYFnQot2aS2dxGDD6Q4pNRUW5ev6h31T6BF/Vl5fyO363ybElOtE2CNEeDwwNKPOd1vMs6toAZnxHZt1ZfdHuL8sd0b0MeElDbNoa18gB2DCsB9HWEGYR62SHc5DP39kQAQxsUxkMv0rrQ+Q6PdnXdrqjm28oQ/4OUakkRApTA52Wo6Kc32YjLJ4hBYdyxkKR9vKIRORP71YMW3XeW4oqAvpUPZMRYR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuyqEWRAZsnQzZLqYDtLoGjpSahmTRSrOVECSbWYQq8=;
 b=l08STyj5i9kvnUS+aq0xAroiYMRGYna7Rz5/1kqdhbFknq09yZUSS+YoTYac2NW7QUHNQStpQFs0+w59eQS/JmshjAlFmy82Ij32R2W8d3odBwJTkNQ+or63sBkdlhP3qSaK3GrXv/qYKw1oEDpB5RDAlALuk0XhtLd3bTFqK9FKEiNfzMmgdoZzZ6nOBQto0B5nVs7kuhUPcYxk5cv6JXgiUZ+kFjl9zNZ4i3vSGOTd9BJXaPG5YRopJA+1PLGla98IsBmiTd9jBqQIFkB3jm49KvTVL5A3ELgisRCLGy/4HEPfL09GPDeU83FeVmvA/XADT95nEAb2pm+oZIB5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuyqEWRAZsnQzZLqYDtLoGjpSahmTRSrOVECSbWYQq8=;
 b=NrH9WSH9wSd8vzN25QkatWmN9OOmZ6ANYRKuAtnmvdvs4emNHiIkylnMN5bGI83AtObGgeLsArEpfOic+2qBKop9EkmqcRQbYqUphlQU8NTzYO2OWZZLzVveW/JjBahcXAFOQfZPslycvTqaGdEGmTjVgEfFhGhgIH+vE2QAxDg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v7 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH v7 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZcHBN/ascjg9fJEuBeoKcDpUO0a8xGMCA
Date: Tue, 18 Apr 2023 13:51:14 +0000
Message-ID: <358316D9-5665-44C7-8BCE-9FB98A0ADDF8@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-2-julien@xen.org>
In-Reply-To: <20230416143211.72227-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GVXPR08MB7749:EE_|AM7EUR03FT003:EE_|DB9PR08MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9e75d5-982f-419e-a283-08db4013ffcd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ty7/isdfPVVnLHN/Ifqa0FdT+byaRjoBrxghCJP7Rh0IvGjSVtX1WRxqXj2snIqMDxgBV82T8MGn9kioVIkKpGif2mFbzGdBW6qjjcKcXo5Opy6cccbq8lZ9oUOa+1F/gL3TuZ5jVuoC+JuxVo2WnsNG1SZaW7qcnrgr1QubQqlWTKRcpLjU0PMgmHPgowRnub6lVQ5N1HzW69eDTrbimcgOYzPfNzCpcqCRvX9R/SLCX+0BBZxXNtjVhkoqdXDI9T1s9T7eFPw3OROvRixY8/ghs6EU0ff6qkavy9DmZ0Uq7AAxZpUNORGc1U9iSb33Gep29T/nOzNdzshgoYBkpePRCIEWH2EskdwmkbPeiEblOoMtTGT2g8eNylAUJjhi40Yjk+nJfUluDW+kaDRqbsrOxZfaQpr7Ve6V1kEfwA0Dp424ta90lSd+RD42T5N3Jltcn17ObZwGjUcn301bdqnu3jHLLxd7VTRZN02hR13u2e5xz7zz9IaUL3u72zBMMEntrqmshv1BHHqnvHibhwSR8SMk1CXpkpHA8RwWG9KOi3zrlSAdBVXtq/BFULYpq2KocsZzUlIMIAwOVMw3LBINVpUD1iyFiHWrjIXu1mUajM3syRiVSTFJXFqFyg+IY52yfR/Y2GpRMhmGDlHhIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(2906002)(8676002)(76116006)(33656002)(8936002)(5660300002)(478600001)(41300700001)(91956017)(186003)(316002)(64756008)(66946007)(66556008)(66476007)(36756003)(83380400001)(66446008)(54906003)(4326008)(71200400001)(122000001)(86362001)(38100700002)(38070700005)(6506007)(53546011)(6512007)(6486002)(2616005)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6875D22D89EBDB449D4822EA3600B650@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bba3e2f5-2da8-4b96-dc48-08db4013f9e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vw0ANQlxd4QTTQJ0N+014QuQXQ67Iq2p5yEwkJxvWwDbd85HUBO0HJ/hA5NDtOy129Zoyl1P6XblVkHwGIUrjBkcAkcBsMnW+b9/wK1LpvPx/I8HY+wSUZcEjlF2t5V0PGDLMORlT3l80lMdQMR+TlCjOPkxA9MvqPRuHBGn5a1jyerNI9Yhgicokaf5SPj7TmZsxUPLYGxKsNMiu7sXIJT8iLqdA/XSPBNmTMkCqGfWIk6AENUbI0oe2XwYY9SnxkBV5uB0GWlU+UCA0UYsKOAKQ90+nkcBhD3GEC9BpnVmUBDCVOyqufF6HQRR2Rolm6X8rLVz0nR+P+AG2/srw0kPkhN/now/yPrWolRp5d0WB0RS4CVnCGDCB0dLlvwGwjpnONnNHpAYRfuOHqK7BHYQsAOegqEgjZ1IPqqrEN57+HwnKV0MChYSprD5yVZoFZT/nOdIJJx0CZ1vTlF0zIX0u8W78mxv4F/HzbcoI6pvcfK7/WedyHJvvCdi99qpAfGPZ5dvPYhPWykkSK+vspOv5x0vDOFUFlHFjwg/bOWRjWuCSMIvG3q1qHrQizXvCMmCzBmd8eT6QZsLat0Wnhfdg/NLWJY1NR3vg3EBDQOG23oLebAAKzDkyyeKYBKrOPhN8zYCNxoZJDpuC5IriimtnNG1ZBgRpZCT6518z/iZ9AKp7d34fyPCMB9BComDjFHCVdC71WuNuE2xzeKb9w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(336012)(6486002)(478600001)(86362001)(2616005)(47076005)(36756003)(36860700001)(40480700001)(26005)(83380400001)(33656002)(6512007)(6506007)(53546011)(186003)(40460700003)(82740400003)(356005)(70586007)(70206006)(81166007)(316002)(2906002)(4326008)(8936002)(5660300002)(8676002)(6862004)(41300700001)(82310400005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:51:24.2342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9e75d5-982f-419e-a283-08db4013ffcd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6746

Hi Julien,

> On 16 Apr 2023, at 16:32, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
>=20
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
>=20
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
>=20
> This also has the advantage to simplify the logic to identity map
> Xen.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ----
>=20
> Even if this patch is rewriting part of the previous patch, I decided
> to keep them separated to help the review.
>=20
> The "follow-up patches" are still in draft at the moment. I still haven't
> find a way to split them nicely and not require too much more work
> in the coloring side.
>=20
> I have provided some medium-term goal in the cover letter.
>=20
>    Changes in v6:
>        - Add Henry's reviewed-by and tested-by tag
>        - Add Michal's reviewed-by
>        - Add newline in remove_identity_mapping for clarity
>=20
>    Changes in v5:
>        - Fix typo in a comment
>        - No need to link boot_{second, third}_id again if we need to
>          create a temporary area.
>=20
>    Changes in v3:
>        - Resolve conflicts after switching from "ldr rX, <label>" to
>          "mov_w rX, <label>" in a previous patch
>=20
>    Changes in v2:
>        - Patch added
> ---
> xen/arch/arm/arm32/head.S | 86 ++++++++-------------------------------
> 1 file changed, 16 insertions(+), 70 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index df51550baa8a..9befffd85079 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -459,7 +459,6 @@ ENDPROC(cpu_init)
> create_page_tables:
>         /* Prepare the page-tables for mapping Xen */
>         mov_w r0, XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, 1
>         create_table_entry boot_second, boot_third, r0, 2
>=20
>         /* Setup boot_third: */
> @@ -479,70 +478,37 @@ create_page_tables:
>         cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per pag=
e */
>         blo   1b
>=20
> -        /*
> -         * If Xen is loaded at exactly XEN_VIRT_START then we don't
> -         * need an additional 1:1 mapping, the virtual mapping will
> -         * suffice.
> -         */
> -        cmp   r9, #XEN_VIRT_START
> -        moveq pc, lr
> -
>         /*
>          * Setup the 1:1 mapping so we can turn the MMU on. Note that
>          * only the first page of Xen will be part of the 1:1 mapping.
> -         *
> -         * In all the cases, we will link boot_third_id. So create the
> -         * mapping in advance.
>          */
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
> +        create_table_entry boot_second_id, boot_third_id, r9, 2
>         create_mapping_entry boot_third_id, r9, r9
>=20
>         /*
> -         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
> -         * then the 1:1 mapping will use its own set of page-tables from
> -         * the second level.
> +         * Find the first slot used. If the slot is not the same
> +         * as TEMPORARY_AREA_FIRST_SLOT, then we will want to switch
> +         * to the temporary mapping before jumping to the runtime
> +         * virtual mapping.
>          */
>         get_table_slot r1, r9, 1     /* r1 :=3D first slot */
> -        cmp   r1, #XEN_FIRST_SLOT
> -        beq   1f
> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
> -        b     link_from_second_id
> -
> -1:
> -        /*
> -         * Find the second slot used. If the slot is XEN_SECOND_SLOT, th=
en the
> -         * 1:1 mapping will use its own set of page-tables from the
> -         * third level.
> -         */
> -        get_table_slot r1, r9, 2     /* r1 :=3D second slot */
> -        cmp   r1, #XEN_SECOND_SLOT
> -        beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, r9, 2
> -        b     link_from_third_id
> +        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
> +        bne   use_temporary_mapping
>=20
> -link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, r9, 2
> -link_from_third_id:
> -        /* Good news, we are not clashing with Xen virtual mapping */
> +        mov_w r0, XEN_VIRT_START
> +        create_table_entry boot_pgtable, boot_second, r0, 1
>         mov   r12, #0                /* r12 :=3D temporary mapping not cr=
eated */
>         mov   pc, lr
>=20
> -virtphys_clash:
> +use_temporary_mapping:
>         /*
> -         * The identity map clashes with boot_third. Link boot_first_id =
and
> -         * map Xen to a temporary mapping. See switch_to_runtime_mapping
> -         * for more details.
> +         * The identity mapping is not using the first slot
> +         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
> +         * See switch_to_runtime_mapping for more details.
>          */
> -        PRINT("- Virt and Phys addresses clash  -\r\n")
>         PRINT("- Create temporary mapping -\r\n")
>=20
> -        /*
> -         * This will override the link to boot_second in XEN_FIRST_SLOT.
> -         * The page-tables are not live yet. So no need to use
> -         * break-before-make.
> -         */
> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
> -        create_table_entry boot_second_id, boot_third_id, r9, 2
> -
>         /* Map boot_second (cover Xen mappings) to the temporary 1st slot=
 */
>         mov_w r0, TEMPORARY_XEN_VIRT_START
>         create_table_entry boot_pgtable, boot_second, r0, 1
> @@ -675,33 +641,13 @@ remove_identity_mapping:
>         /* r2:r3 :=3D invalid page-table entry */
>         mov   r2, #0x0
>         mov   r3, #0x0
> -        /*
> -         * Find the first slot used. Remove the entry for the first
> -         * table if the slot is not XEN_FIRST_SLOT.
> -         */
> +
> +        /* Find the first slot used and remove it */
>         get_table_slot r1, r9, 1     /* r1 :=3D first slot */
> -        cmp   r1, #XEN_FIRST_SLOT
> -        beq   1f
> -        /* It is not in slot 0, remove the entry */
>         mov_w r0, boot_pgtable       /* r0 :=3D root table */
>         lsl   r1, r1, #3             /* r1 :=3D Slot offset */
>         strd  r2, r3, [r0, r1]
> -        b     identity_mapping_removed
> -
> -1:
> -        /*
> -         * Find the second slot used. Remove the entry for the first
> -         * table if the slot is not XEN_SECOND_SLOT.
> -         */
> -        get_table_slot r1, r9, 2     /* r1 :=3D second slot */
> -        cmp   r1, #XEN_SECOND_SLOT
> -        beq   identity_mapping_removed
> -        /* It is not in slot 1, remove the entry */
> -        mov_w r0, boot_second        /* r0 :=3D second table */
> -        lsl   r1, r1, #3             /* r1 :=3D Slot offset */
> -        strd  r2, r3, [r0, r1]
>=20
> -identity_mapping_removed:
>         flush_xen_tlb_local r0
>         mov   pc, lr
> ENDPROC(remove_identity_mapping)
> --=20
> 2.39.2
>=20


