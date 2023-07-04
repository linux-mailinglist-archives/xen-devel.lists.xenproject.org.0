Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309D747407
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:23:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558403.872466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgwI-000249-3p; Tue, 04 Jul 2023 14:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558403.872466; Tue, 04 Jul 2023 14:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgwI-00021n-19; Tue, 04 Jul 2023 14:23:34 +0000
Received: by outflank-mailman (input) for mailman id 558403;
 Tue, 04 Jul 2023 14:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGgwG-00021h-Gh
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:23:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59c65b0a-1a76-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:23:31 +0200 (CEST)
Received: from AS4P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::16)
 by DBBPR08MB5931.eurprd08.prod.outlook.com (2603:10a6:10:1f7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:23:28 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d7:cafe::31) by AS4P189CA0013.outlook.office365.com
 (2603:10a6:20b:5d7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 14:23:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:23:27 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Tue, 04 Jul 2023 14:23:27 +0000
Received: from 6f96fb54ab16.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 713A28D3-DA81-406F-97B6-1709F1932EA7.1; 
 Tue, 04 Jul 2023 14:23:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f96fb54ab16.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:23:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7509.eurprd08.prod.outlook.com (2603:10a6:10:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:23:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:23:18 +0000
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
X-Inumbo-ID: 59c65b0a-1a76-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWnLRr1NKLouYw/5csM4wai4v6vtQWe/sZa1dgMZm8M=;
 b=fLVSye1KFkpmvtcjfradE2pnWT8AzBBKItU/8jeHxx3BuOvf/0O/6PKzJsq67QgrAHMuRjxTRAb79No21t6Ouw9JiUmW9/SjMZrMdFAEEqzEn08NtViJeun/X2IVuNSOqL/Nec1DFe/Mwa3q+Gkl3ekF/p0hKQ1g82bqTDdunT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f1ccdb6a8d3a409
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co5dAPKg0NnlPR7zqHRL8MQSxolO2ECn92y6N2RksEAdxjNB9fRImPj8nkRaZcBjS+jE5cDgq8cwKWcaNOkUBhwvqcph8Q+imczSZ4duzxxqQ+NtyELwJ45TiREb5esq9L1noS285Atr4N3ooSVluPomD96E1nrtAQwJ/M31gW9PiGQy/7LyDRG0jSdr9eHf+eW3SK/wwaeAS6xJnAgHSvm7N9qENey4qJtYKs2M60a6zCBXi/X1OkX9uKWRr56ugvTzBvjlyNJyh5tZZQ2nU4bG/fy6h7yfHJ99sZ1As+645NTSDEyO0ckvNNQuFhGYSpMuYf1u1YC5wLlCtItbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWnLRr1NKLouYw/5csM4wai4v6vtQWe/sZa1dgMZm8M=;
 b=KoFBEuwtceoM9E0hCJkF9PRUW7Iy5kNjKp6oA06Czid9XXlcvvla415KmbtCoibCNdjt30Y1xFqmkToj4fhxAZd6mZ91wFuewhgz27hiKOCBgHMny285yT1x8HNbYJ09S6emMPQS4b3TNUZSdGaZ3zv8+Ls39td65Q0ary9hPooLM450Zr7Jot5urq/hb+I0RHq34nvHVoxqZN8Ec/TVivB8OmqkC1K7H4HNAPJpghyTt51U7L8arW7/MRS4VoGQtWQpx2CLX9fGcY+3fZ/n+Unszc7cohVO2zDoTnAPNe490eLJdVCxkjAYMQy7NIGUshZWEyWmkZUg55OVFi82HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWnLRr1NKLouYw/5csM4wai4v6vtQWe/sZa1dgMZm8M=;
 b=fLVSye1KFkpmvtcjfradE2pnWT8AzBBKItU/8jeHxx3BuOvf/0O/6PKzJsq67QgrAHMuRjxTRAb79No21t6Ouw9JiUmW9/SjMZrMdFAEEqzEn08NtViJeun/X2IVuNSOqL/Nec1DFe/Mwa3q+Gkl3ekF/p0hKQ1g82bqTDdunT8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [v2 3/4] xen/arm: Rework the code mapping Xen to avoid relying on
 the size of Xen
Thread-Topic: [v2 3/4] xen/arm: Rework the code mapping Xen to avoid relying
 on the size of Xen
Thread-Index: AQHZqsX1dQvVUjA1m0mu4FJvosJOiq+psI6A
Date: Tue, 4 Jul 2023 14:23:18 +0000
Message-ID: <7FE33D49-1D61-4F4F-BB29-3621119ACFFE@arm.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-4-julien@xen.org>
In-Reply-To: <20230629201129.12934-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB7509:EE_|AM7EUR03FT062:EE_|DBBPR08MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: ee58045e-8a51-4744-19da-08db7c9a3c17
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LGH8sQh7VXySQCbrj/HUJOWdIbNukCUfrRB5JqiBQhHyYL7fCM5PVYqsp1nRqCjG0L6uNdyiE4jbGJze5j6nt2G7iUEpsO9JQ8clWj815zVyam+eklFpM00MAVsddHfJ3RroUXkXniH/1NHaW7SAxXpkTMAYU6gbzOpexQ8ZOA095jk4oaiFLHo7109SKOyy5P3BZy6CsaT7mslmWkrP6Qpm2H3GEdMz4vhpGXadoaqldNIE95OWMdYLcr97MIj9qSDx9c2IQQAJR7dKY93HUeuIG+AAaXhPyj59DIeY7bSNFsYCGA6rVFnuiNR9XaBYgcwub+RFCdlju6MUFzDfkhwmICw0VOWHn2vIWSxd/OywFzdfEy1SbOy59BXqB8dsK1+JE7gb8yTP0iVHSH9a4p3sOfeLoKoe/2lKEKr7oFWEri+Xvpf7lDCdcJSJ01ACjNcwoTDWxsSCJWhDdqiHWN+xsl10u47D4RVRrkHtjbj7BsqHBeRBWj+pd7hO4P+vCMjqe6OIiXo2uFbXAqCrg4XLihLCGYeevnCUk9+yYTWC7/Nuuh7ffTAIkNt0mk5rZg9TV4xSUVFPPhLISC4ZkOxNPK+cbalYUH1qQ0Vlot1XWBk96HfePjNp8ZLw/UZAEQr0CA8imzJjUTFYeLWhFg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(38100700002)(71200400001)(30864003)(33656002)(2906002)(6486002)(8936002)(8676002)(38070700005)(54906003)(36756003)(41300700001)(478600001)(5660300002)(76116006)(66946007)(66446008)(91956017)(86362001)(64756008)(186003)(6916009)(4326008)(6506007)(6512007)(66476007)(53546011)(66556008)(316002)(122000001)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2984BCA479B90D4BBC07C58329D67766@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7509
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48ad3f5f-5d65-4d19-b58e-08db7c9a366d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RqSH0c2g9Zls+h37TcnP1L8mNWTJNVqreFonv3UdD8gGCpzyCSXkXP7Ro9ng5jzjhyIabc2eEcRfLXazBz+RV9UYJMJWn6L7NDjGTM0+036nfTZCLYlj+7iJ05+r4sRgydpv1qiyB0tL85TxY66ZJ8kuMhYNXRF9QpezYzeP6XsO0yzwqgXojcv8QTruGxesU4ko+Pu7yekvjplaA18kCfbeXt/GZPjqeAOS1c8hAOHy7s2Aeqipzn3arGHYZyksqrLz5wmcIFPPv+fC5bn7iQIOlxwcymqaDYKH2RXJzS5pmsw0l5uufnrTbvxcHgmjd3KJxJjX/u4fZfBBCBZWwnukg+gAnZHItIL2I4Ep2p+zkYFqsTjR6dTj0mPsRIF8rdNxoHPJdmHG7AA1mDOz8Nkc4pP5mUEFENVx3umCZSMSQLwPgUP7Mio0rOl/uVKH9AV+HLh0sFe1e/dfe+Ci2K1qWQkp6GaErNU9Uag4kwh2mPxaguJtEzmAJ/Wdt2X7pSJT9M3faqDFim365AY9Fr0SS5TALVFGOKKolnGaeqM3IKZDjVtYOX+GbyRE5At4sZTKkinwiAQSqKApSYPC7Z3iI9b/pDetr/smoYNsnMaXo+P7qwj2lWt3LrNGakqpaSKm0/Sh0pvUZc7tkQuQOiC5gjppRMeaEgnz/XNmGqrMFMDnFwj3evqLFdQbpSBo8HVssxOhp8LlcLZ0H/TBm3Ofof+xiFkSFmp1bdwlOsfYkdkUB59hG/Wx7nLrApuB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(336012)(40460700003)(41300700001)(6486002)(30864003)(82310400005)(26005)(356005)(82740400003)(83380400001)(107886003)(81166007)(2616005)(53546011)(186003)(6506007)(47076005)(40480700001)(6512007)(36860700001)(54906003)(86362001)(478600001)(36756003)(2906002)(316002)(4326008)(70206006)(70586007)(8936002)(8676002)(33656002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:23:27.7230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee58045e-8a51-4744-19da-08db7c9a3c17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5931



> On 29 Jun 2023, at 22:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the maximum size of Xen binary we can support is 2MB.
> This is what we reserved in the virtual address but also what all
> the code in Xen relies on as we only allocate one L3 page-table.
>=20
> When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
> are enabled, the binary will be way over 2MB.
>=20
> The code is now reworked so it doesn't rely on a specific size but
> will instead look at the reversed size and compute the number of
> page-table to allocate/map.
>=20
> While at it, replace any reference to 4KB mappings with a more
> generic word because the page-size may change in the future.
>=20
> Also fix the typo s/tlb/tbl/ in code move in arm32/head.S
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20

With the commit message fixed as stated by Michal:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Cheers
Bertrand

> ---
>    Changes in v2:
>        - Fix typoes
>        - Remove comments that don't apply
>        - Reword the explanation for DEFINE_BOOT_PAGE_TABLE{,S}
>        - Be more consistent with the way to from the virtual address to
>          map in mm.c
> ---
> xen/arch/arm/arm32/head.S         | 64 +++++++++++++++++++++++--------
> xen/arch/arm/arm64/head.S         | 54 ++++++++++++++++++++------
> xen/arch/arm/include/asm/config.h |  1 +
> xen/arch/arm/include/asm/lpae.h   | 10 +++--
> xen/arch/arm/mm.c                 | 24 +++++++-----
> 5 files changed, 110 insertions(+), 43 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 5e3692eb3abf..cfc542b55973 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -141,8 +141,7 @@
>         /*
>          * This must be the very first address in the loaded image.
>          * It should be linked at XEN_VIRT_START, and loaded at any
> -         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> -         * or the initial pagetable code below will need adjustment.
> +         * 4K-aligned address.
>          */
> GLOBAL(start)
>         /*
> @@ -373,7 +372,35 @@ ENDPROC(cpu_init)
> .endm
>=20
> /*
> - * Macro to create a page table entry in \ptbl to \tbl
> + * Macro to create a page table entry in \ptbl to \tbl (physical
> + * address)
> + *
> + * ptbl:    table symbol where the entry will be created
> + * tbl:     physical address of the table to point to
> + * virt:    virtual address
> + * lvl:     page-table level
> + *
> + * Preserves \virt
> + * Clobbers \tbl, r1 - r3
> + *
> + * Note that \tbl and \virt should be in a register other than r1 - r3
> + */
> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
> +        get_table_slot r1, \virt, \lvl  /* r1 :=3D slot in \tbl */
> +        lsl   r1, r1, #3                /* r1 :=3D slot offset in \tbl *=
/
> +
> +        movw  r2, #PT_PT             /* r2:r3 :=3D right for linear PT *=
/
> +        orr   r2, r2, \tbl           /*           + \tbl paddr */
> +        mov   r3, #0
> +
> +        adr_l \tbl, \ptbl            /* \tbl :=3D (v,p)addr of \ptbl */
> +
> +        strd  r2, r3, [\tbl, r1]
> +.endm
> +
> +
> +/*
> + * Macro to create a page table entry in \ptbl to \tbl (symbol)
>  *
>  * ptbl:    table symbol where the entry will be created
>  * tbl:     table symbol to point to
> @@ -388,19 +415,9 @@ ENDPROC(cpu_init)
>  * Note that \virt should be in a register other than r1 - r4
>  */
> .macro create_table_entry, ptbl, tbl, virt, lvl
> -        get_table_slot r1, \virt, \lvl  /* r1 :=3D slot in \tlb */
> -        lsl   r1, r1, #3                /* r1 :=3D slot offset in \tlb *=
/
> -
>         load_paddr r4, \tbl
> -
> -        movw  r2, #PT_PT             /* r2:r3 :=3D right for linear PT *=
/
> -        orr   r2, r2, r4             /*           + \tlb paddr */
> -        mov   r3, #0
> -
> -        adr_l r4, \ptbl
> -
> -        strd  r2, r3, [r4, r1]
> -.endm
> +        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
> + .endm
>=20
> /*
>  * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
> @@ -451,13 +468,26 @@ ENDPROC(cpu_init)
>  * Output:
>  *   r12: Was a temporary mapping created?
>  *
> - * Clobbers r0 - r4
> + * Clobbers r0 - r5
>  */
> create_page_tables:
>         /* Prepare the page-tables for mapping Xen */
>         mov_w r0, XEN_VIRT_START
>         create_table_entry boot_pgtable, boot_second, r0, 1
> -        create_table_entry boot_second, boot_third, r0, 2
> +
> +        /*
> +         * We need to use a stash register because
> +         * create_table_entry_paddr() will clobber the register storing
> +         * the physical address of the table to point to.
> +         */
> +        load_paddr r5, boot_third
> +        mov_w r4, XEN_VIRT_START
> +.rept XEN_NR_ENTRIES(2)
> +        mov   r0, r5                        /* r0 :=3D paddr(l3 table) *=
/
> +        create_table_entry_from_paddr boot_second, r0, r4, 2
> +        add   r4, r4, #XEN_PT_LEVEL_SIZE(2) /* r4 :=3D Next vaddr */
> +        add   r5, r5, #PAGE_SIZE            /* r5 :=3D Next table */
> +.endr
>=20
>         /*
>          * Find the size of Xen in pages and multiply by the size of a
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5e9562a22240..ad9e0ba87a29 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -146,8 +146,7 @@
>          *
>          * This must be the very first address in the loaded image.
>          * It should be linked at XEN_VIRT_START, and loaded at any
> -         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> -         * or the initial pagetable code below will need adjustment.
> +         * 4K-aligned address.
>          */
>=20
> GLOBAL(start)
> @@ -490,6 +489,31 @@ ENDPROC(cpu_init)
>         ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
> .endm
>=20
> +/*
> + * Macro to create a page table entry in \ptbl to \tbl
> + * ptbl:    table symbol where the entry will be created
> + * tbl:     physical address of the table to point to
> + * virt:    virtual address
> + * lvl:     page-table level
> + * tmp1:    scratch register
> + * tmp2:    scratch register
> + *
> + * Preserves \virt
> + * Clobbers \tbl, \tmp1, \tmp2
> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl, tmp1, tmp2
> +        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 :=3D slot in \tbl *=
/
> +
> +        mov   \tmp2, #PT_PT                 /* \tmp2 :=3D right for line=
ar PT */
> +        orr   \tmp2, \tmp2, \tbl            /*          + \tbl */
> +
> +        adr_l \tbl, \ptbl                   /* \tbl :=3D address(\ptbl) =
*/
> +
> +        str   \tmp2, [\tbl, \tmp1, lsl #3]
> +.endm
> +
> /*
>  * Macro to create a page table entry in \ptbl to \tbl
>  *
> @@ -509,15 +533,8 @@ ENDPROC(cpu_init)
>  * Note that all parameters using registers should be distinct.
>  */
> .macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
> -        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 :=3D slot in \tlb *=
/
> -
> -        load_paddr \tmp2, \tbl
> -        mov   \tmp3, #PT_PT                 /* \tmp3 :=3D right for line=
ar PT */
> -        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
> -
> -        adr_l \tmp2, \ptbl
> -
> -        str   \tmp3, [\tmp2, \tmp1, lsl #3]
> +        load_paddr \tmp1, \tbl
> +        create_table_entry_from_paddr \ptbl, \tmp1, \virt, \lvl, \tmp2, =
\tmp3
> .endm
>=20
> /*
> @@ -570,7 +587,20 @@ create_page_tables:
>         ldr   x0, =3DXEN_VIRT_START
>         create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
>         create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
> -        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
> +
> +        /*
> +         * We need to use a stash register because
> +         * create_table_entry_paddr() will clobber the register storing
> +         * the physical address of the table to point to.
> +         */
> +        load_paddr x4, boot_third
> +        ldr   x1, =3DXEN_VIRT_START
> +.rept XEN_NR_ENTRIES(2)
> +        mov   x0, x4                            /* x0 :=3D paddr(l3 tabl=
e) */
> +        create_table_entry_from_paddr boot_second, x0, x1, 2, x2, x3
> +        add   x1, x1, #XEN_PT_LEVEL_SIZE(2)     /* x1 :=3D Next vaddr */
> +        add   x4, x4, #PAGE_SIZE                /* x4 :=3D Next table */
> +.endr
>=20
>         /*
>          * Find the size of Xen in pages and multiply by the size of a
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index c969e6da589d..6d246ab23c48 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -125,6 +125,7 @@
> #endif
>=20
> #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
> +#define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
>=20
> #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> #define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/l=
pae.h
> index 7d2f6fd1bd5a..4a1679cb3334 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -267,15 +267,17 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int att=
r);
>=20
> /*
>  * Macros to define page-tables:
> - *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
> - *  in assembly code before BSS is zeroed.
> + *  - DEFINE_BOOT_PAGE_TABLE{,S} are used to define one or multiple
> + *  page-table that are used in assembly code before BSS is zeroed.
>  *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
>  *  page-tables to be used after BSS is zeroed (typically they are only u=
sed
>  *  in C).
>  */
> -#define DEFINE_BOOT_PAGE_TABLE(name)                                    =
      \
> +#define DEFINE_BOOT_PAGE_TABLES(name, nr)                               =
      \
> lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")              =
     \
> -    name[XEN_PT_LPAE_ENTRIES]
> +    name[XEN_PT_LPAE_ENTRIES * (nr)]
> +
> +#define DEFINE_BOOT_PAGE_TABLE(name) DEFINE_BOOT_PAGE_TABLES(name, 1)
>=20
> #define DEFINE_PAGE_TABLES(name, nr)                    \
> lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0a3e1f3b64b6..fff6d7a4d37a 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -53,8 +53,8 @@ mm_printk(const char *fmt, ...) {}
>  * to the CPUs own pagetables.
>  *
>  * These pagetables have a very simple structure. They include:
> - *  - 2MB worth of 4K mappings of xen at XEN_VIRT_START, boot_first and
> - *    boot_second are used to populate the tables down to boot_third
> + *  - XEN_VIRT_SIZE worth of L3 mappings of xen at XEN_VIRT_START, boot_=
first
> + *    and boot_second are used to populate the tables down to boot_third
>  *    which contains the actual mapping.
>  *  - a 1:1 mapping of xen at its current physical address. This uses a
>  *    section mapping at whichever of boot_{pgtable,first,second}
> @@ -79,7 +79,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_first_id);
> DEFINE_BOOT_PAGE_TABLE(boot_second_id);
> DEFINE_BOOT_PAGE_TABLE(boot_third_id);
> DEFINE_BOOT_PAGE_TABLE(boot_second);
> -DEFINE_BOOT_PAGE_TABLE(boot_third);
> +DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
>=20
> /* Main runtime page tables */
>=20
> @@ -115,7 +115,7 @@ DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
>  * Third level page table used to map Xen itself with the XN bit set
>  * as appropriate.
>  */
> -static DEFINE_PAGE_TABLE(xen_xenmap);
> +static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
>=20
> /* Non-boot CPUs use this to find the correct pagetables. */
> uint64_t init_ttbr;
> @@ -518,15 +518,15 @@ void __init setup_pagetables(unsigned long boot_phy=
s_offset)
>     p[0].pt.table =3D 1;
>     p[0].pt.xn =3D 0;
>=20
> -    /* Break up the Xen mapping into 4k pages and protect them separatel=
y. */
> -    for ( i =3D 0; i < XEN_PT_LPAE_ENTRIES; i++ )
> +    /* Break up the Xen mapping into pages and protect them separately. =
*/
> +    for ( i =3D 0; i < XEN_NR_ENTRIES(3); i++ )
>     {
>         vaddr_t va =3D XEN_VIRT_START + (i << PAGE_SHIFT);
>=20
>         if ( !is_kernel(va) )
>             break;
>         pte =3D pte_of_xenaddr(va);
> -        pte.pt.table =3D 1; /* 4k mappings always have this bit set */
> +        pte.pt.table =3D 1; /* third level mappings always have this bit=
 set */
>         if ( is_kernel_text(va) || is_kernel_inittext(va) )
>         {
>             pte.pt.xn =3D 0;
> @@ -539,10 +539,14 @@ void __init setup_pagetables(unsigned long boot_phy=
s_offset)
>=20
>     /* Initialise xen second level entries ... */
>     /* ... Xen's text etc */
> +    for ( i =3D 0; i < XEN_NR_ENTRIES(2); i++ )
> +    {
> +        vaddr_t va =3D XEN_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
>=20
> -    pte =3D pte_of_xenaddr((vaddr_t)xen_xenmap);
> -    pte.pt.table =3D 1;
> -    xen_second[second_table_offset(XEN_VIRT_START)] =3D pte;
> +        pte =3D pte_of_xenaddr((vaddr_t)(xen_xenmap + i * XEN_PT_LPAE_EN=
TRIES));
> +        pte.pt.table =3D 1;
> +        xen_second[second_table_offset(va)] =3D pte;
> +    }
>=20
>     /* ... Fixmap */
>     pte =3D pte_of_xenaddr((vaddr_t)xen_fixmap);
> --=20
> 2.40.1
>=20
>=20


