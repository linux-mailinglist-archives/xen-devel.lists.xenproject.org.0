Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB2B4815C3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 18:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252388.433425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2ccc-0004jN-Gl; Wed, 29 Dec 2021 17:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252388.433425; Wed, 29 Dec 2021 17:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2ccc-0004hA-CG; Wed, 29 Dec 2021 17:20:18 +0000
Received: by outflank-mailman (input) for mailman id 252388;
 Wed, 29 Dec 2021 17:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsxB=RO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n2cca-0004gZ-LE
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 17:20:16 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960ea7d8-68cb-11ec-9e60-abaf8a552007;
 Wed, 29 Dec 2021 18:20:15 +0100 (CET)
Received: from DB7PR05CA0040.eurprd05.prod.outlook.com (2603:10a6:10:2e::17)
 by DBBPR08MB6313.eurprd08.prod.outlook.com (2603:10a6:10:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 17:20:12 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::37) by DB7PR05CA0040.outlook.office365.com
 (2603:10a6:10:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Wed, 29 Dec 2021 17:20:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Wed, 29 Dec 2021 17:20:12 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Wed, 29 Dec 2021 17:20:05 +0000
Received: from 3b816ccb0ff0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA84F7A4-C548-41A4-836C-9DE5AEFCDBE1.1; 
 Wed, 29 Dec 2021 17:19:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b816ccb0ff0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 17:19:58 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR0802MB2336.eurprd08.prod.outlook.com
 (2603:10a6:800:9c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 17:19:56 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::30c8:65b:f59:58b4%3]) with mapi id 15.20.4823.024; Wed, 29 Dec 2021
 17:19:56 +0000
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
X-Inumbo-ID: 960ea7d8-68cb-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyG5Cjx1EThHy0twJv9yfg4+Rrkze1DsoTUJTKUGGCo=;
 b=HmOnJ1UEiAV4XhelGDwePParKi956bcikWJ0MvkYEkv+cWBN0KndxpTN1UL3TvnfdGBj5VYQnpL5M1d/uYnGC2c52zDyoXFEUYLM65JhRO7+2e4VzCbMmtMppDz+vq1n5eWTVKbL0PGsRvwJzbzL/OXO/yI+IuluZxeOW81rMY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: df4c314359e48d42
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4+Gu605KYQWl6M6KtZzp4Q+eqc+qjRjcZuKBMdeGvky/hWWqlbKknCtCEC1yIBtT+XfXhTrsOd+MGEm6rUpf70POEcYD4cIOBWIKd3Glv4Em0KlJrXPrhxHHiHUAHgY6bcB0T9ocbsdtFSiRh054HuKsAPWYYIq02BVooK+E3YNW2m/+utvxkltpqWZ76AlNIJwB3+Lcxaedccq0dgPk1EuFhCCmPpYFk8YcALeX2D+b64VctNC8RAMHEplwzER7MiC+uSHYUux3pqpXRRef5oUUgNIfJNcBo7t9F5/CiOdQjxUYrFPeptPEP5UI+MewjzSsguGHXeealNbsY9PDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyG5Cjx1EThHy0twJv9yfg4+Rrkze1DsoTUJTKUGGCo=;
 b=IJE3pBmJji0iVAFBQnw3JQW8MYSTCacZpm5Ccf0MZeX6yPllnLEca8+z86HgdCTYI2hmb1K4LlgLt1cuqHqb0m2HX8iR2JJHcK/g5BkNgNDGN9+8vuhXQgWlceV+5d5fGn+71tVrvcrIDuXyddGdT4Jnwxgfk7avU/oHHWXe/G1xYHjmnRp6VMu7pGVmbOSp4cNwRC5iKjqRn0d5rlPjGjrJczaOS4jGZXr2Mxh02Bpd949pARcQ+LPdsHxB1n+/bHPzRBgD9+nBPXtv0aj0pQ1JGgZ1/Gp8w1lK4FjnsB6VW3+lr7jZAWrMkwB3S4CH7Zs5BRtojV/FSC+4gY65mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyG5Cjx1EThHy0twJv9yfg4+Rrkze1DsoTUJTKUGGCo=;
 b=HmOnJ1UEiAV4XhelGDwePParKi956bcikWJ0MvkYEkv+cWBN0KndxpTN1UL3TvnfdGBj5VYQnpL5M1d/uYnGC2c52zDyoXFEUYLM65JhRO7+2e4VzCbMmtMppDz+vq1n5eWTVKbL0PGsRvwJzbzL/OXO/yI+IuluZxeOW81rMY0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 4/5] tools/xl: Merge down debug/dry-run section of
 create_domain()
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <8f95e4a6664a24fd990cbb8162a1855c95cb6b66.1640590794.git.ehem+xen@m5p.com>
Date: Wed, 29 Dec 2021 17:19:49 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3266E44-16C1-49EB-BE71-2C9332FA5B75@arm.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <8f95e4a6664a24fd990cbb8162a1855c95cb6b66.1640590794.git.ehem+xen@m5p.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a3e20a39-1f0a-4459-18cb-08d9caef78d1
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2336:EE_|DB5EUR03FT003:EE_|DBBPR08MB6313:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6313CCBB558AF7478282D7BAE4449@DBBPR08MB6313.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9LAEDbwM75dQorCofynrlyUyucvkUCVrUR3YalVsInu/HlqHiumV5F4+LkbgltKNZMxIj5ssW26gp/H1lBoJboWIO/g3QJ7qo1p5I9VbT1f8CDinOoeaKu/s/6dGVjwd/4g8Umfs6gC+960R7/ScLYZ+4+63jIdwJQkx3QXSsgwJkwwTN1I2CLxGBIoPdIs7ySdjmVgt98lrpuW3+7l9TxcY/v7606JpxYaeukFIYhFfD7J3UNjhzDv+AKhMC+ROBeMBXDPCe9EJQRASGlcJmEZZR8hPK48kGfx6uUx5FOLHDXeNBdh9jBoaRYkvOYVCaEn2TYoZ/FeZ/V6rWUcOs/7DBp10rWxcWW2Nbjk7jvQSFiA1q/mItE0v/AxlKsyst272Rj/24qBOeDAsv0XsuQws8U6t8AnDlKq/eUcHj64mJmvHc/sVOaxxOevuwS5bQmLX8Myt+yZt+IWeYolOs5Syf53aZvFx4nin09iYA9DGIJn1l1ce0JHTY2gU8Tgqp6KRvi6EeAYJZweDukg5rt06aIAIbxIAdt0PCqQH1FgOhyrqpWuzhgO0gIk2W3FLtI2IkIlYID9dwrYb7xiMV+X7i7fJ7zo8udlF4hjWPwtYllky9hqs7zVik/zSf2G9bPNNbNwW2+5M5ifStgqUlo+Zp6A2OQQQJH8JgSKjxpPI5E7+wbIVxpTsL281vtz2axSLYl+bMtZl+vjQdB0ZU/ZVgAztLk4mJmBkBx0J+aY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(36756003)(6506007)(53546011)(66476007)(54906003)(5660300002)(186003)(66946007)(44832011)(66556008)(26005)(2616005)(33656002)(38350700002)(38100700002)(86362001)(316002)(8676002)(6512007)(83380400001)(52116002)(8936002)(6666004)(2906002)(4326008)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8aa2a32-8a2e-4a59-6027-08d9caef6f37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gKnXTy7s5bLIVTLBC0448Bizi3X04u4LVWbgxICBV2syR3us7XaUoz4+VnAxozkZd59z/H1JvK4o1rOWi2ANJ/e01ZhsVWdyfGd1REhp6ZMfjiMDbQkTCOB/BpTsfCDei+fkh2cwSEgRFsyM9WlRUFABwbm1U/IKOvtcbCjma77HhwVkZxNb3G5KQYZ88FdSrRg6S80R+HGoZfXB0cpLSJEYL+dqYSID2HUL+PriJD/jxW3GbMXD/Apqua0fZgrr0mFXDglTWh0kh+oIscNAHfo8AmWPIJIxU1F1kXskNh6icaRIWKoUppmhGPjIplaJgvFCaLWzHQLSGQ2yZ8tHkyTfmz97qwJyMRreCxr58sCRrfyQkvBwndXXE51fZhVNlR4hPOLilFqeq/KdCXGvHszS9qCmXwHpbRjCKQt2qMUFgYMgKfudAsP0YGDKHiv1SVtP4bQDvwpakhC0jsTtopa2L3USVr5xg+mnJ3EWGA+9NHHUNtys6UFaN4zbOOIkbZssqxugZUph+AToT/bsUYYJcmVedgimAqzd0kjDYloFduZap3ABEqxP40bp4jC6TJCSwIPu5OaQrSC4JSB3WtIJ2/Hkzmdwe5kUgIQlnyfOiClTl1AS0CaKqF8u3yjzst89MWBoCD6v8/+s9EkysqvapWM9a3amW2eatBvu5Xbak3cAYG4SPI2pAJDhiu2ZkT1NiUVTTcRdFOPYxW3FPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(36860700001)(54906003)(6486002)(53546011)(8936002)(316002)(2906002)(6506007)(83380400001)(356005)(6666004)(47076005)(5660300002)(336012)(186003)(4326008)(26005)(36756003)(44832011)(508600001)(107886003)(86362001)(81166007)(82310400004)(6512007)(70586007)(33656002)(70206006)(6862004)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 17:20:12.2443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e20a39-1f0a-4459-18cb-08d9caef78d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313



> On 18 Dec 2020, at 01:42, Elliott Mitchell <ehem+xen@m5p.com> wrote:
>=20
> create_domain()'s use of printf_info_sexp() could be merged down to a
> single dump_by_config(), do so.  This results in an extra JSON dictionary
> in output, but I doubt that is an issue for dry-run or debugging output.
>=20

Don=E2=80=99t know if the extra output is a problem, but for me looks ok
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> ---
> tools/xl/xl_vmcontrol.c | 14 +-------------
> 1 file changed, 1 insertion(+), 13 deletions(-)
>=20
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 435155a033..4b95e7e463 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -856,19 +856,7 @@ int create_domain(struct domain_create *dom_info)
>=20
>     if (debug || dom_info->dryrun) {
>         FILE *cfg_print_fh =3D (debug && !dom_info->dryrun) ? stderr : st=
dout;
> -        if (default_output_format =3D=3D OUTPUT_FORMAT_SXP) {
> -            printf_info_sexp(-1, &d_config, cfg_print_fh);
> -        } else {
> -            char *json =3D libxl_domain_config_to_json(ctx, &d_config);
> -            if (!json) {
> -                fprintf(stderr,
> -                        "Failed to convert domain configuration to JSON\=
n");
> -                exit(1);
> -            }
> -            fputs(json, cfg_print_fh);
> -            free(json);
> -            flush_stream(cfg_print_fh);
> -        }
> +        dump_by_config(default_output_format, cfg_print_fh, &d_config, -=
1);
>     }
>=20
>=20
> --=20
> 2.30.2
>=20
>=20


