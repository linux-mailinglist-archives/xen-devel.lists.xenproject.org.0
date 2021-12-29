Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679F4815B0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 18:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252376.433402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2caq-0002jv-M7; Wed, 29 Dec 2021 17:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252376.433402; Wed, 29 Dec 2021 17:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2caq-0002hp-Iz; Wed, 29 Dec 2021 17:18:28 +0000
Received: by outflank-mailman (input) for mailman id 252376;
 Wed, 29 Dec 2021 17:18:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsxB=RO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n2cao-0002hZ-Dd
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 17:18:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54748777-68cb-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 18:18:25 +0100 (CET)
Received: from AS8PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:20b:313::11)
 by AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 17:18:22 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::e2) by AS8PR04CA0066.outlook.office365.com
 (2603:10a6:20b:313::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Wed, 29 Dec 2021 17:18:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Wed, 29 Dec 2021 17:18:22 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Wed, 29 Dec 2021 17:18:22 +0000
Received: from df59f7cf2607.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CDFB7939-374A-4DBE-888A-12505435DDB4.1; 
 Wed, 29 Dec 2021 17:18:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df59f7cf2607.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 17:18:16 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR0802MB2336.eurprd08.prod.outlook.com
 (2603:10a6:800:9c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 17:18:14 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4%3]) with mapi id 15.20.4823.024; Wed, 29 Dec 2021
 17:18:14 +0000
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
X-Inumbo-ID: 54748777-68cb-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywCoWO4Fug+6Xz5pW0NN0Ejy6uWKUkGhUnHNzU/OUVk=;
 b=dJf074YmHaf8AUO0eADGSl3FLgMjceH+uQs4n+UYDCOQKJHNWqDfK9N7VoKTMZdu5g4+HPQ9WxfnFgXhFMdaWDrhbDHf4oi/+qp0+my3/4epmI7etEG5Vwrah7jhu2cI34BSkWvqs4lUvy4+ddZSYmCDXSQYAdB0+ClUoBN2hak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95455e555d568118
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy3PAJ+n/KlInt0sT7mKXX9cgQnMnT/M4/qyZMIdCmfeGDg1zuSerNzmREDIQ/U3/quUPN4xLDqDh7tMXG5vjs2XFId/qFC5BJkzF4Uec66DXRNxBBoM9KB8lfUoqG93X42yTbCRrOFJfZnrsDsrOct+vQ1J4CjEv3aNJ12OW9D5KSLXlkfb+mtA0jH5T57GsEZ2ObZmZw2cX3/ekcJXlXHxq+xg9AlCP6fmJCcvT8EBGVM3h0yiONtP1+GdZadb6+OPSX05NF/4KLTF0aIHQl8MKUYFI3PROHVsA932Tvol3vok5eS3vAmdFxKransDunxSgNl2y2bJ16KSTAQGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywCoWO4Fug+6Xz5pW0NN0Ejy6uWKUkGhUnHNzU/OUVk=;
 b=SHKMErwUxaIE4/EiLCostxctEjAbk3vezc6XeKopUKY1t9QnwHIvW9zCtQ8eYWQwW4hwXK+vDrI3RhetDGulmUhduD57ey+yYkPq/dvHKSVN1vrU6gwFKl4MThx1DqQx0At53Qax0pusGVmJBly7anLPMtoBIdw8ie2HWDJ2ug/yU++dgr0mhMAvU2yI1bNKfsCDzwvyQaFOqxQ2aVVvHVEHPpVLNeeEbOasQG8S5fITCKxEMa4wtvThlVjNPCfjORQQG7SjVvQqkIhRCX179aPvUDeSfzJHbR4xSBVA/88ShJOPKg8X0nArVl7ZNwKGG3UXiMs/RvoxlxqccmIBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywCoWO4Fug+6Xz5pW0NN0Ejy6uWKUkGhUnHNzU/OUVk=;
 b=dJf074YmHaf8AUO0eADGSl3FLgMjceH+uQs4n+UYDCOQKJHNWqDfK9N7VoKTMZdu5g4+HPQ9WxfnFgXhFMdaWDrhbDHf4oi/+qp0+my3/4epmI7etEG5Vwrah7jhu2cI34BSkWvqs4lUvy4+ddZSYmCDXSQYAdB0+ClUoBN2hak=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 2/5] tools/xl: Mark libxl_domain_config * arg of
 printf_info_*() const
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <26c5803fdb59bd0bd06f2509097d5929dd4f67f2.1640590794.git.ehem+xen@m5p.com>
Date: Wed, 29 Dec 2021 17:18:06 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7C4A5E4-5A5A-487D-A27D-4602087D4F1D@arm.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <26c5803fdb59bd0bd06f2509097d5929dd4f67f2.1640590794.git.ehem+xen@m5p.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9a4ee6d6-4c48-4483-09f9-08d9caef3788
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2336:EE_|AM5EUR03FT027:EE_|AS8PR08MB6808:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB680880BE1543B91CE56E6365E4449@AS8PR08MB6808.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Knn7Qmu42iWD2GSuHAG3565Td0v3XrsAtwOAaTPyIUSTrsIAPu0RnfS/XejRJopeSAUfTg6wZJe0G9XhSXH6YIavl+ai6HMpBBo72OFdtRoPyf9SsLFkPsToo4kopKh2xMHr0bti0bH06z1kXL1Hx9jzDWthgCTyS52UNoOFQ+RlqX6MQfTNKfavlideEfdesG7eFgXzC3tiXZTrevy39fjOHEx++kYmV04st+kkPVyZVqw67ARPEdQ8cPq+uFaUvVDkyWIBAYCnTSTG34D9Hf8TItiui4yD7LRPzY8F1znnGkrT1x+2V47Hj4paUDmTJExV37VuKTU0Mkc9PJGSGwKgu/BWk1J0VPzrs4oDC84ZgGNjHnDvXb9zpl3hvISCy+Oasg5A4RNxA76y8vvyoYgVAJ260rDPFD7D7awLq+YfhL4ClX5oLicbwl2fnOkgkhC36ZQLKqmplGRkDtMH4dwyN9QUthvAEXlQZr7oglN761QEuFieG8JuXl8wi5MWVQlsM/OSiuoXnLScI5/jjxW24LPlJf8fcb9mU2gRF4MUOULQe0sLfOgq6FEoslCjyA6DG7cnKI7Iic/KECScBW7Xlj6bi2VSmzbkY821NsxVAcq61NHqHxIKxWQUyvriXs2l2yi3rKk221WbDdOxx+/jlIPywLaFVxSiKVJwwDAXimXBPQuaH/z+ko1UF2OECJIRBdeZhXwifSvpeIumxFo5fU3w75h+e1x2xEbWlhI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(36756003)(6506007)(53546011)(66476007)(54906003)(5660300002)(186003)(66946007)(44832011)(66556008)(26005)(2616005)(33656002)(38350700002)(38100700002)(86362001)(316002)(8676002)(6512007)(83380400001)(52116002)(8936002)(6666004)(2906002)(4326008)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d738521-0859-4b50-bfb7-08d9caef3260
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	86cOkb9MmopDl2E89uY2gKPdr9lKeC0dFTQNvyrKrtQ8NxRTllc9P1NsZBAiEtWPssca/32ZQmW9CsY2coefmkRFKG1zcnNTHtiJppvrRo9YC+tPKuUDRJTYrLypxl2VoFvGLDgWjr9HwezQEs1wKR6pzIFtiyWad0ezf2ako/t+5NRRz7QdYNKLu34t/l3lkrY9yG7B3pCY936Hv0G0oyihUG3ax1ETMVZQ/vG9pyRuJPNR647WCU/J2SsbEupv/5wao0UWaanCoaJ0EYM4ONTasM8QTtH1d8hAuXdEvVeGldyCBaSlEFpt3lw3NaHuTy+bs3/2T5ACUumUwzo1njS9ZiEPkyj5XubvYTB+7A5BQq5i6Hg1Hr+YnTynIVeZt1BsiG9R4PS7pBpLRtwzpPOKXSWoxl2pO/x/QzhxUIlM3buGUqsYGdDpnDfYy5mD24VTPQn8BcmadAlW2VUVoDqyAPyp6T6rchHLlkfMzdlGfOtP0X2EZzU7h/l+l8LmciDK3icaaPxuYDOixy6A1yAmguEmGbVWLx+wLRAg7YwwXxdJw7xbEr4Vaa6FJ0jsqW2WYMBzj3/FXGwlyPa8n88YLnDOgYsGJz89Z0IcItGGjKOhDRR+O/Hje9JFBqjPnSC3Ft2hfI/RZvMTTeGfYkc13JVi57UXf3RmnbKdDAo5e8MWeOfmyTLgomoIRXqQvmy5Jau+F/c/kl+OX/A94g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(4326008)(2616005)(107886003)(6862004)(186003)(508600001)(53546011)(82310400004)(6506007)(336012)(44832011)(6666004)(54906003)(47076005)(316002)(6512007)(8936002)(81166007)(8676002)(6486002)(33656002)(356005)(2906002)(26005)(36860700001)(83380400001)(86362001)(70586007)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 17:18:22.6667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4ee6d6-4c48-4483-09f9-08d9caef3788
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6808



> On 18 Dec 2020, at 21:32, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> With libxl having gotten a lot more constant, now printf_info_sexp() and
> printf_info_one_json() can add consts.  May not be particularly
> important, but it is best to mark things constant when they are known to
> be so.

Looks ok to me
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> tools/xl/xl.h      | 2 +-
> tools/xl/xl_info.c | 2 +-
> tools/xl/xl_sxp.c  | 6 +++---
> 3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..720adb0048 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -300,7 +300,7 @@ typedef enum {
>     DOMAIN_RESTART_SOFT_RESET,   /* Soft reset should be performed */
> } domain_restart_type;
>=20
> -extern void printf_info_sexp(int domid, libxl_domain_config *d_config, F=
ILE *fh);
> +extern void printf_info_sexp(int domid, const libxl_domain_config *d_con=
fig, FILE *fh);
> extern void apply_global_affinity_masks(libxl_domain_type type,
>                                         libxl_bitmap *vcpu_affinity_array=
,
>                                         unsigned int size);
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 712b7638b0..23d82ce2a2 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -59,7 +59,7 @@ static int maybe_printf(const char *fmt, ...)
> }
>=20
> static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
> -                                            libxl_domain_config *d_confi=
g)
> +                                            const libxl_domain_config *d=
_config)
> {
>     yajl_gen_status s;
>=20
> diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
> index 359a001570..d5b9051dfc 100644
> --- a/tools/xl/xl_sxp.c
> +++ b/tools/xl/xl_sxp.c
> @@ -26,13 +26,13 @@
> /* In general you should not add new output to this function since it
>  * is intended only for legacy use.
>  */
> -void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh=
)
> +void printf_info_sexp(int domid, const libxl_domain_config *d_config, FI=
LE *fh)
> {
>     int i;
>     libxl_dominfo info;
>=20
> -    libxl_domain_create_info *c_info =3D &d_config->c_info;
> -    libxl_domain_build_info *b_info =3D &d_config->b_info;
> +    const libxl_domain_create_info *c_info =3D &d_config->c_info;
> +    const libxl_domain_build_info *b_info =3D &d_config->b_info;
>=20
>     fprintf(fh, "(domain\n\t(domid %d)\n", domid);
>     fprintf(fh, "\t(create_info)\n");
> --=20
> 2.30.2
>=20
>=20


