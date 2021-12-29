Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE04815B1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 18:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252379.433414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2cbC-0003Ep-0J; Wed, 29 Dec 2021 17:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252379.433414; Wed, 29 Dec 2021 17:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2cbB-0003C8-Rw; Wed, 29 Dec 2021 17:18:49 +0000
Received: by outflank-mailman (input) for mailman id 252379;
 Wed, 29 Dec 2021 17:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsxB=RO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n2cbA-0002hZ-Dz
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 17:18:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c07710-68cb-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 18:18:47 +0100 (CET)
Received: from DU2PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:10:3b::25)
 by DBBPR08MB4380.eurprd08.prod.outlook.com (2603:10a6:10:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 17:18:41 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::19) by DU2PR04CA0020.outlook.office365.com
 (2603:10a6:10:3b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Wed, 29 Dec 2021 17:18:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Wed, 29 Dec 2021 17:18:41 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Wed, 29 Dec 2021 17:18:41 +0000
Received: from 22efb1b431a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9D1E859-D527-4EE4-AAC5-FB2F15E64967.1; 
 Wed, 29 Dec 2021 17:18:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22efb1b431a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 17:18:34 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR0802MB2336.eurprd08.prod.outlook.com
 (2603:10a6:800:9c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 17:18:32 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4%3]) with mapi id 15.20.4823.024; Wed, 29 Dec 2021
 17:18:32 +0000
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
X-Inumbo-ID: 61c07710-68cb-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jSEOyL5652lFSHhvWwXP0CpTXkSu+qrdExon1Hw8kA=;
 b=3qUGpSYkaXOZnZ+CaSb4EoTpHC6POEy0rOgv+DRUjac0RRJ07w8kmmpasu3lPJjHE+EAGkv40iboCyhHouLmQdZqb4ULbGz+jvdroMpiz0qGmqVRzQla57UecXeikpKKd9J8XK8oB1mZO6K08jTx8mxmRsoFuHnoF/eEuqHyUAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4e60c3a9b4568bd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9Qwf6RDMOfk31URMjSXAmeIJaKqRPL+CA7gS6bYnFRxJ3vpepRUODWnKs4b+PCJNaUuhgcjMkG4nfnrmvo/hD3aFgF2WARS7jdmxCqgVBZtrRar3w+ka+K5Fjh1ZIUXE/DMlyTK94LOZluJuvA8TmnUUhZNGafZ4+yYe9q/90WKNcVewcBLaU6n10Tdv/pZl49BklL2XBX4pDrufGWmDxa7Ou8UJtkXCEIO1Z0zf5lorJgVgALB9d/ArhwtTpv8NH7MWftE1Zb5Kc0k1hMFqX60ygHXGtjRwNyb/2ZR+5nWAK5ViR6IhqhioXOmv6VmwcWONeMp+GHyduxxAnigSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jSEOyL5652lFSHhvWwXP0CpTXkSu+qrdExon1Hw8kA=;
 b=DV28P0VS1KFwLMkZzyJwMftRisltEU44iOimiVetzjtuxmitbqmCIAe4S37tvmgPUSIDZQ9vj/D3GUnvzmFNLXdK9i1y2wb5LcCo+Ofsuh5VnZLMVrDn8akkf1mlSna8b0cq0Xwa/yj2F8hFwnA25QHXYTsiysJIttaxggF85cMt5wn1SK5B1OEWnmzVAcPzFyqnMAAR+HQMIrrStV1huBZDNmDHa9CirpPHZ5wNcpTXExus3lynsc05nCc/ryw64BOzOLFzF4EhBHDguHyi/YNZcC79Z82/kuZnMjFxxjbjjW+n9qeUr+yMmddIm4zlthdwMF7052m0PGT8IGregQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jSEOyL5652lFSHhvWwXP0CpTXkSu+qrdExon1Hw8kA=;
 b=3qUGpSYkaXOZnZ+CaSb4EoTpHC6POEy0rOgv+DRUjac0RRJ07w8kmmpasu3lPJjHE+EAGkv40iboCyhHouLmQdZqb4ULbGz+jvdroMpiz0qGmqVRzQla57UecXeikpKKd9J8XK8oB1mZO6K08jTx8mxmRsoFuHnoF/eEuqHyUAc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 3/5] tools/xl: Rename printf_info()/list_domains_details()
 to dump_by_...()
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <fdf4e903a675e3a9ec8794b92f164f6c571371e5.1640590794.git.ehem+xen@m5p.com>
Date: Wed, 29 Dec 2021 17:18:31 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4EA1A86F-D176-46C8-8670-BB42B9B856C1@arm.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <fdf4e903a675e3a9ec8794b92f164f6c571371e5.1640590794.git.ehem+xen@m5p.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 6a073829-e314-4cc7-71d3-08d9caef429b
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2336:EE_|DB5EUR03FT041:EE_|DBBPR08MB4380:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB43804E227097AC2E2914E1E0E4449@DBBPR08MB4380.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:49;OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Uxb6gU7lSrsi5Oz22iekzTpQo8PjbvCBJ1vcIK5qbPVFFzUof6P+B+a/Q4W6mvZ9o3ijoYbee91sPArjtgQvEjsdX2wdtOa2fn/XYZkLQlnPlwLf4S9eST8Cr7MvBaZIfaDjbGZKGGSYr0cOZ4lP3C6UQHzc/wmDVLgb+N0ibxcVUYBx5214v5M0A/ftHWQ0PaJiIvBx3bc/p3/w3rvMy3K3UKkHR2DHNr8jrah2TycTVR1DxaV6WZLWzdvnmdM+iIPHzm9ZaZVJXB2ubOyl8lul+wbXMSKvWqpRQs+cvMfNtJzpLwbF8GbAmN84BA5RHQmXGKVq2s/NhU6oE3CAuf9qFLSMjzDgLsBLK/I8r1YVlLr79ytfW7gD5jdcH6XaMhJR4WB0TzIksMpdxq2+vWaacPy0BwO2npQfEVOFuvKM7z2coCZH+0FQBNHy2dDlTdKyqTyeaMLTa4v4ypnZqoQotQOp1nPYHocacRnnCYzs4SofsC0XmtezoB4Mx30n8ZFeOgr2gEH9F4kwatXZ4MVx93JIaSpmIAz0QBeafkxvP1xMG+T3ngyw1yl+nuxzvk7VBKKShpk3AeR9VIVVG2C8F8AqEfJgPXJ1RpOfme0lsZjVrvKpcr5LHNUmnAbWHqgIErqTrKFRUNsh1XmWhgq0PCdAmQrQKGAflMZ2keDUp9FJBQJglW5UwzpGUoA6/59xbbJkx772D2DcVx6a7dLIhe4QliifM0yYpoYX3Gg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(36756003)(6506007)(53546011)(66476007)(54906003)(5660300002)(186003)(66946007)(44832011)(66556008)(26005)(2616005)(33656002)(38350700002)(38100700002)(86362001)(316002)(8676002)(6512007)(83380400001)(52116002)(8936002)(2906002)(4326008)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	312b2b90-3d7a-4caa-31d8-08d9caef3d1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZeIzTbTL+1/pTgbEpe2QN7eYsxH2RpkOB0rvqYAuV0xm76wiSZRAOhugeVoLA0vbc8KCutkALJixqvATmq3NBOoSgNK7j6MRCz0yLg9H2CsO+Cs99+gIsVJklNphM4CYWgMkqsoX6b8QrI721VQyQ4qUecb8vWI0LdirJpc+Eu5cdc4qK5brdyIlkCnk/dd7bIiuR15MZkX+ytyen+yUOXSW1B5QyEtwqq6xRTGWU1zkF9UyeftIAj6/4aqvqet/2Zyx5WhJ9FDOqqA9N/v0CrIXdCdJtC8J7JytdzQoeGyUGG+D7bajSd0fsnXAnWIHALsMTQq9Ho0cQEXX6fRf4XXiLioK+YAlDIezRGiVcr5bL0iVOZPBkrUlfLhamzCML1g7m6ww6FrP1cNkeynC2GwPaH4rIJ59qdg8SJk7JiUe18ZeDoNTjYzXbQQ9qJ81jtzCuyKA3BcL2qge94iyTmgKwOstMjXY9N6u1r/P5zvk/ID80EzwbXkwsrbRqxu6XOXn//pKU9r9hHgZ6qH/gAAcMvtsvTsdfbVKaQNMoWRZIpAeiAQRPsD5vpZxBMIR2rtgQQrcMtlnOf9EslPmxrfq3WUn2a/SL2bHJHNlcbYc7eV7B4oYlS79Dh1sa/s7dZsKYn+/BRqiTk+gbpH7hunksdYG3SSk47nBdpdIpZzpx2+TlN6hu4TAIuepx5XGws9kzKg5KQ21/x7oqpT8qQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(2616005)(8676002)(33656002)(6486002)(2906002)(53546011)(82310400004)(6506007)(86362001)(4326008)(36860700001)(356005)(36756003)(316002)(54906003)(83380400001)(81166007)(8936002)(186003)(6862004)(107886003)(336012)(6512007)(70206006)(70586007)(5660300002)(26005)(47076005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 17:18:41.2957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a073829-e314-4cc7-71d3-08d9caef429b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4380



> On 18 Dec 2020, at 01:42, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> printf_info()/list_domains_details() had been serving fairly similar
> purposes.  Increase their consistency (add file-handle and output_format
> arguments to list_domains_details(), reorder arguments) and then rename
> to better reflect their functionality.
>=20
> Both were simply outputting full domain information.  As this is more of
> a dump operation, "dump" is a better name.
>=20

Looks ok to me
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> tools/xl/xl.h      |  8 ++++++++
> tools/xl/xl_info.c | 30 ++++++++++++++++--------------
> tools/xl/xl_misc.c |  5 +----
> 3 files changed, 25 insertions(+), 18 deletions(-)
>=20
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index 720adb0048..be5f4e11fe 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -300,6 +300,14 @@ typedef enum {
>     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
> } domain_restart_type;
>=20
> +extern void dump_by_config(enum output_format output_format,
> +                           FILE *fh,
> +                           const libxl_domain_config *d_config,
> +                           int domid);
> +extern void dump_by_dominfo_list(enum output_format output_format,
> +                                 FILE *fh,
> +                                 const libxl_dominfo info[],
> +                                 int nb_domain);
> extern void printf_info_sexp(int domid, const libxl_domain_config *d_conf=
ig, FILE *fh);
> extern void apply_global_affinity_masks(libxl_domain_type type,
>                                         libxl_bitmap *vcpu_affinity_array=
,
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 23d82ce2a2..3647468420 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -94,12 +94,10 @@ out:
>     return s;
> }
>=20
> -void printf_info(enum output_format output_format,
> -                 int domid,
> -                 libxl_domain_config *d_config, FILE *fh);
> -void printf_info(enum output_format output_format,
> -                 int domid,
> -                 libxl_domain_config *d_config, FILE *fh)
> +void dump_by_config(enum output_format output_format,
> +                    FILE *fh,
> +                    const libxl_domain_config *const d_config,
> +                    int domid)
> {
>     if (output_format =3D=3D OUTPUT_FORMAT_SXP)
>         return printf_info_sexp(domid, d_config, fh);
> @@ -442,7 +440,10 @@ static void list_domains(bool verbose, bool context,=
 bool claim, bool numa,
>     libxl_physinfo_dispose(&physinfo);
> }
>=20
> -static void list_domains_details(const libxl_dominfo *info, int nb_domai=
n)
> +void dump_by_dominfo_list(enum output_format output_format,
> +                          FILE *fh,
> +                          const libxl_dominfo info[],
> +                          int nb_domain)
> {
>     libxl_domain_config d_config;
>=20
> @@ -453,7 +454,7 @@ static void list_domains_details(const libxl_dominfo =
*info, int nb_domain)
>     const char *buf;
>     libxl_yajl_length yajl_len =3D 0;
>=20
> -    if (default_output_format =3D=3D OUTPUT_FORMAT_JSON) {
> +    if (output_format =3D=3D OUTPUT_FORMAT_JSON) {
>         hand =3D libxl_yajl_gen_alloc(NULL);
>         if (!hand) {
>             fprintf(stderr, "unable to allocate JSON generator\n");
> @@ -472,16 +473,16 @@ static void list_domains_details(const libxl_dominf=
o *info, int nb_domain)
>                                                  &d_config, NULL);
>         if (rc)
>             continue;
> -        if (default_output_format =3D=3D OUTPUT_FORMAT_JSON)
> +        if (output_format =3D=3D OUTPUT_FORMAT_JSON)
>             s =3D printf_info_one_json(hand, info[i].domid, &d_config);
>         else
> -            printf_info_sexp(info[i].domid, &d_config, stdout);
> +            printf_info_sexp(info[i].domid, &d_config, fh);
>         libxl_domain_config_dispose(&d_config);
>         if (s !=3D yajl_gen_status_ok)
>             goto out;
>     }
>=20
> -    if (default_output_format =3D=3D OUTPUT_FORMAT_JSON) {
> +    if (output_format =3D=3D OUTPUT_FORMAT_JSON) {
>         s =3D yajl_gen_array_close(hand);
>         if (s !=3D yajl_gen_status_ok)
>             goto out;
> @@ -490,11 +491,12 @@ static void list_domains_details(const libxl_dominf=
o *info, int nb_domain)
>         if (s !=3D yajl_gen_status_ok)
>             goto out;
>=20
> -        puts(buf);
> +        fputs(buf, fh);
> +        fputc('\n', fh);
>     }
>=20
> out:
> -    if (default_output_format =3D=3D OUTPUT_FORMAT_JSON) {
> +    if (output_format =3D=3D OUTPUT_FORMAT_JSON) {
>         yajl_gen_free(hand);
>         if (s !=3D yajl_gen_status_ok)
>             fprintf(stderr,
> @@ -571,7 +573,7 @@ int main_list(int argc, char **argv)
>     }
>=20
>     if (details)
> -        list_domains_details(info, nb_domain);
> +        dump_by_dominfo_list(default_output_format, stdout, info, nb_dom=
ain);
>     else
>         list_domains(verbose, context, false /* claim */, numa, cpupool,
>                      info, nb_domain);
> diff --git a/tools/xl/xl_misc.c b/tools/xl/xl_misc.c
> index 08f0fb6dc9..bcf178762b 100644
> --- a/tools/xl/xl_misc.c
> +++ b/tools/xl/xl_misc.c
> @@ -256,9 +256,6 @@ int main_dump_core(int argc, char **argv)
>     return EXIT_SUCCESS;
> }
>=20
> -extern void printf_info(enum output_format output_format,
> -                        int domid,
> -                        libxl_domain_config *d_config, FILE *fh);
> int main_config_update(int argc, char **argv)
> {
>     uint32_t domid;
> @@ -344,7 +341,7 @@ int main_config_update(int argc, char **argv)
>     parse_config_data(filename, config_data, config_len, &d_config);
>=20
>     if (debug || dryrun_only)
> -        printf_info(default_output_format, -1, &d_config, stdout);
> +        dump_by_config(default_output_format, stdout, &d_config, -1);
>=20
>     if (!dryrun_only) {
>         fprintf(stderr, "setting dom%u configuration\n", domid);
> --=20
> 2.30.2
>=20
>=20


