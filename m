Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7F7474F2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558488.872638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhdA-0007HZ-TZ; Tue, 04 Jul 2023 15:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558488.872638; Tue, 04 Jul 2023 15:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhdA-0007ED-Pl; Tue, 04 Jul 2023 15:07:52 +0000
Received: by outflank-mailman (input) for mailman id 558488;
 Tue, 04 Jul 2023 15:07:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhd9-0007Dw-Bc
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:07:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89633b69-1a7c-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 17:07:48 +0200 (CEST)
Received: from DUZPR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::10) by DU0PR08MB9418.eurprd08.prod.outlook.com
 (2603:10a6:10:421::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:07:44 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::b2) by DUZPR01CA0054.outlook.office365.com
 (2603:10a6:10:469::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 15:07:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 15:07:43 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Tue, 04 Jul 2023 15:07:43 +0000
Received: from c0e9f1f422c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 003ECCB4-2662-4C60-9CE2-388EF62B9B1E.1; 
 Tue, 04 Jul 2023 15:07:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0e9f1f422c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 15:07:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:07:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:07:34 +0000
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
X-Inumbo-ID: 89633b69-1a7c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ9n2SLEFfFbZqCFLUdAAKLUSzQfFzQj04NveNWSbto=;
 b=NvzxOigJrrQr8WLdECho050ezlCmrEk0TpZSikGLaFzIJSGCTItZUOs4EpPAx26ny8/yv5pQ7t186cypenXvfsYvoCqkfn4VEpoHbEqOuaf5BGsliKb8WAOM5YGF/aBU6wLVWo7CDzuNDKBVFlTMnobAuSwyF014yDM/UtOCwN8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3f8b296c4d158d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEn3F3jeMgIoZ8f41tXbsYpr2X0ec2PnnIe+MM2+Q1xg+QTnwN7TppoRL6024d/NeHojfkX78NukNgAf6LsSYMp+2q6Lg1kgmgtD8hc/HdAJoRn3kb0HBrPeUCylwXmCFUxEvAGW49bGq9c+ji/PTHFZrty1gJz9trA7wQkuCMJjfZwvq7gAntUeW2+TZzV40KBI3wxPY5Aubp59UIe+Q7M4yeOSQhkZTUr7y9eoXql2OZba4a996KUI/2KEoant/ibWjG/aOqtNEWcfh3H6cL/M2f92yzqbXEIwltILLpUtNtrSCJIIGXKnhl+OwJ7TGmPySvTajT0y3uB7G0Kv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ9n2SLEFfFbZqCFLUdAAKLUSzQfFzQj04NveNWSbto=;
 b=X/s8aN9GRgLbWQyD1Nh9r51lbHJ2zeLnbImWbl6O9EUFPu+bH0Fnien4LMdO8CCiDsajPUbMhrVSU3tvWmOkl1oujvTHizmayVPouvk0AlEmrh0mBy2EwNEDw7pxeneQjwQmPcPzNBjd5JuOJV8yvjiNqRooS4fyPMqz/K2HsMO2fC9kfQKSQn4UtgO7cjX/ani8cMH3WuYZ9ifG8A64js/k00nqmNhWI1qqFp0vi22B8Ch0K84gkmaey6RUaoCIVgcm8XiIm+ZnLhfZxbheVQxrymRyQvVmcdaYNTp52K2myKP7jCl8H9vvT4GoxBLEN9LmeE7HfepzWWlAFm//Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ9n2SLEFfFbZqCFLUdAAKLUSzQfFzQj04NveNWSbto=;
 b=NvzxOigJrrQr8WLdECho050ezlCmrEk0TpZSikGLaFzIJSGCTItZUOs4EpPAx26ny8/yv5pQ7t186cypenXvfsYvoCqkfn4VEpoHbEqOuaf5BGsliKb8WAOM5YGF/aBU6wLVWo7CDzuNDKBVFlTMnobAuSwyF014yDM/UtOCwN8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 7/7] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH 7/7] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZos+8ihLpFUQE50qML8qllPzK9a+pzNoA
Date: Tue, 4 Jul 2023 15:07:34 +0000
Message-ID: <47AF0004-BA7D-4C7B-B5F5-DBD7E53D3CC0@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-8-julien@xen.org>
In-Reply-To: <20230619170115.81398-8-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBBPR08MB5961:EE_|DBAEUR03FT059:EE_|DU0PR08MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c48eed-a753-45a9-af26-08db7ca06b4c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LT350dYF4wv4BQQq8N77g8LCc2Nk4GuX+yXSyR2ZSpGdiV21XF730MIx7DxuFE24CsC424tAXYpAyuR+v7DyAebd+Cn8Ai3M9oVwegoDQljZ/e+EhyVBx0+ClVRFlhIHyL3HAP2KuVtD+xA31khW8xCZK6RyCZeenHRur6M+mf1BLI+6XAwsM9LQ8pmj0gpmrPUYRblzE7pOT/JSWyXO9RqlwXHWkzV7kMx1fqyxwvSE/3ocR4XQXvuiFQ7JwT1Zy8hdcIm1M7GV8SnFld9TwLqf2G8dlHM0LsR0IfRVA3rZUFmKHY0sKHOXkiI41spm5emNgStmPkKKlYqUSmqtIbQoqg65m9ijRyx4uUZ7SRdrJBGtfJCd7/+Tn6Tc+pCTF5UnfCRw6ILPSScZw1h14bII6FKjg25R/Day4UNZulTyq4hXuQWkPnvqnuuEgzPaiUIyLgOV/z1eaRW6rvAvTnrga9y0R1pCftQX2h04W+ElvZHC/mmIMr9hbvn2nyShjWCNzQXpvRUO8mfdEy2Y/wFR94cjRHV/CLO/RZ+wRm0QFOeL2pUvJCEulFCovwHL3/OCSXzq0UE/+n9qbi8EApTDtrmgXq/9e7K63E9vuCPnqhJuezbggqfgmWxC36jfvGSP2bCrGYT96weBERiwdA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(38100700002)(33656002)(2906002)(71200400001)(6486002)(8936002)(38070700005)(8676002)(54906003)(36756003)(41300700001)(5660300002)(478600001)(76116006)(6916009)(66946007)(66556008)(66476007)(64756008)(53546011)(91956017)(66446008)(6512007)(186003)(6506007)(86362001)(4326008)(316002)(966005)(2616005)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <219EF33B08E60242B906872E177C0963@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	888ac3f6-07cc-44e2-3e58-08db7ca065e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RFqTeaKI9lHQT/9kllU+UquY9rRHERqASyuhI0N6HolC7UsfpzR3xh5aDZ6x9uAPZg1mMV44+/OF9QVPmrhMo8gIKJWJyHZ6L3R2wQstUpSihmTDmNzrGC5YMKbSWbMEc1oQruPAZXqIhU0jloGxPwEiPXZsTEihXVuYX0RL1ub63POyAoL/9j5H12TEjKRKZehH3/9YoPMr991RcYWacFowa3EYUcEw02ooxQaR/FNvFnvLlKui6FUO2UBP1XaYbUjw0Jv6DVSOoH9ZW47q16ow4DJA3B2dI9xB8EtpzSCVSfrySSkia4ZSpAFHrQfBo6xl9cGpN5b0k+ww11QyEwWs3H9tnIuI0g2swGa9z7xz5g1OSBjPcIWJB1E6h2sjG0E+isH1bWtFBS7LyAizLAxiLRWXejsk7LbGkI9yBZGcDURB84i4zcWAbKKbmWMXtQQRSQwrX2PsvC2nmrmS4GU3s1p2vdSsLPX0zbCA96lJxblClFGlIMeCtSLTGtXmqZJ841XKnMI8G+s0RLSU1dVwidTG2DH/2JRd0G+pcATg/N/3WMS+dUTYlo2LjW7tOf7UgXYMuVHCgYqlEEDUu7fUqp4AhpdI2KaGv5HRxKBG9RV3nfSzB0xFw8+vwrLWFmbNKWpEqB0Fkb4T8PRyCeYQ1nDD1zfZIqd4FKDCgkO5WTzCYkqG4WQpvucDB0vreiq69kHb4jSzs/7lM+sMZcPTOeawz5vRrXbfVLgBpAU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(316002)(86362001)(186003)(70206006)(70586007)(26005)(6512007)(47076005)(6506007)(53546011)(107886003)(82740400003)(83380400001)(81166007)(966005)(2616005)(356005)(2906002)(6486002)(33656002)(36860700001)(5660300002)(336012)(478600001)(6862004)(8676002)(54906003)(40480700001)(40460700003)(82310400005)(8936002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:07:43.9700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c48eed-a753-45a9-af26-08db7ca06b4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9418

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
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
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ----
>=20
> This patch was originally part of [1] but it was reverted due to
> Xen not booting on the Arndale. The first patch of this series
> is fixing it (confirmed by booting on the Arndale). So I am including
> this patch. Also all the tags but the tested-by have been kept
> because the code has not changed. Happy to drop any if there are
> any concerns.
>=20
> [1] https://lore.kernel.org/xen-devel/20230416143211.72227-1-julien@xen.o=
rg/
>=20
> Changelog from the previous series:
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
> index b942e7e54d08..d70e856ab7dd 100644
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
> @@ -680,33 +646,13 @@ remove_identity_mapping:
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
> 2.40.1
>=20


