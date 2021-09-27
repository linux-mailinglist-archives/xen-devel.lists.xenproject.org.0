Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383F419681
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197007.349933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrko-0001Cs-30; Mon, 27 Sep 2021 14:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197007.349933; Mon, 27 Sep 2021 14:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrkn-0001AE-VD; Mon, 27 Sep 2021 14:37:13 +0000
Received: by outflank-mailman (input) for mailman id 197007;
 Mon, 27 Sep 2021 14:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIHc=OR=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mUrkl-00016J-SJ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:37:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f60ac457-dd18-4d55-a8cb-a4af47d464c2;
 Mon, 27 Sep 2021 14:37:09 +0000 (UTC)
Received: from AM9P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::25)
 by VI1PR08MB4432.eurprd08.prod.outlook.com (2603:10a6:803:102::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 14:37:08 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21f:cafe::6b) by AM9P195CA0020.outlook.office365.com
 (2603:10a6:20b:21f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 14:37:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 14:37:07 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Mon, 27 Sep 2021 14:37:05 +0000
Received: from 33f85b5f2b51.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11438B15-C593-4B76-A341-7111724D4A1A.1; 
 Mon, 27 Sep 2021 14:36:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 33f85b5f2b51.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 14:36:53 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6576.eurprd08.prod.outlook.com (2603:10a6:102:15a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 14:36:52 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Mon, 27 Sep 2021
 14:36:51 +0000
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
X-Inumbo-ID: f60ac457-dd18-4d55-a8cb-a4af47d464c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA0A5XgcHo/DiPOEgEiB18CiJ3SV9SeYjxxmhRrAfbc=;
 b=4bmm3B7R/u3vq+hdW5wDCUJqZ7si4oEr01b8O/w6LOtc8DWrz5LQ90QKvtG0ci+jFpGooNTtWO2qxFQa6Koc5T/ydW+W3r9Lu6yf9P0hbfvCJcl16AtgqyDZHZG/AQGQrlEMkVw5CtSkks2j3U5srmkQxlVq1RWZw0MTDi2JZsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 46ac2b8e162df1da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpgJRqO0P+bcake9HXvn67nVT7/z0B/pwhBxkcM8qRZZisrH++SHEFEIK9+w0zhRP3Y6mwVy7qRW2/6f6uow/0fzm4be6gCdeMJ9+Br62JMgToSCxs1o6ztUyBPpjmVfXsHm3U87hTPw+ZvMawVEAfFHRqR26f2EVkOgztIM68tiC+ZKd5ZJiiiW12TTkAcbrB7C2ElFZ8rBzMT6KlM9vhDK2N/lG7OmNHv+MwRwzRgYA8F036RC/I0wi2nVC0tKcZ2HEwSglC6xdjY1NUxFFNKOAH5B2bCrya+8CgiSvgxJo/ug2geddu0e0k9j1AfDARqCojR0fedQAkzY7NGefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AA0A5XgcHo/DiPOEgEiB18CiJ3SV9SeYjxxmhRrAfbc=;
 b=UgRbUf1AyR+f976UhNqYVPFdyWw+nwlS2Po5AQpc0QRgaLdnWW6nk0BdDfa+ZuAaAHqVe6dVk4Oj1TUMEZ9OAGZmcwOjnphRcetozx1m+3UWy74zfJBIe+qcoYHOE5x+gafuwv4OGJhFjzFOdTbExG1e/mFdNKuz4kf4tB06MbthVhkLB9HChFatHJIHIhuASSSan6tfyUvPc8Wog2PJ2speGJ8lcGLPVEdPMG1JIh/BG93+aWmg7Jxaoi7slJxjMJ/DrVMBcLc/PyudogP0War9wPqTgoZHfVp9EZ5KEFy9vgJwDkN+y7ZbT3cIAC63uc5mluTPwv6tUDmA7SMCMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA0A5XgcHo/DiPOEgEiB18CiJ3SV9SeYjxxmhRrAfbc=;
 b=4bmm3B7R/u3vq+hdW5wDCUJqZ7si4oEr01b8O/w6LOtc8DWrz5LQ90QKvtG0ci+jFpGooNTtWO2qxFQa6Koc5T/ydW+W3r9Lu6yf9P0hbfvCJcl16AtgqyDZHZG/AQGQrlEMkVw5CtSkks2j3U5srmkQxlVq1RWZw0MTDi2JZsQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, "tee-dev@lists.linaro.org"
	<tee-dev@lists.linaro.org>
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
Thread-Topic: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
Thread-Index: AQHXs6dCIyk0ePXwCku0OJ1w+54IXKu38umA
Date: Mon, 27 Sep 2021 14:36:51 +0000
Message-ID: <E0C80373-4139-4426-A9B5-6FBBA2E1AACE@arm.com>
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3dd589a3-5402-42f9-b31e-08d981c44867
x-ms-traffictypediagnostic: PAXPR08MB6576:|VI1PR08MB4432:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4432647500A40B3F70698DEA9DA79@VI1PR08MB4432.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rP2mlVaYUBUllTzSZZsyYtAxXi6yLwaohgvgxBh7JC3QnLRTSMMgXjZxSgbYZeb98r560+T4wPNahhMSkxDfkgHStC2Eu2BdU8fPDDVN5Hm4BJglG931jHAMkO9EehgVTlKp1xrulzLvHxbxMOSlfW+yzeO7ZgQIkG/sM4nuxcJcIUoIVMw5kIEOYXSO/+NHgGWsxyZ0eBxDo36ZsrYO/rVTww6zGHSbfWRI7lb/+BYm/4Yv78R0X05tZFGXpcc5hbHz8WblDK/Etmcp+wQ6zU7vRLtaQ28DBcyT0uiE8GgwjscAflSokUYJgjCB3EQK7l2IZ4RV5C6kuIeFfgYaSNf3ZSjrdirGnnQMcdjiGZf6zPzWDRpStMWhUOEoqyRFo3Bzf9kVkZoSULPTiAGWx5RU57wBxXx50BpWN8JnnIR8l573QXQ8Bqf8+RA9CmhHjupTU/0ycRhNIPllKX1EdoYGiqOAgJIDPEt1pHVB5yKsDSRyEpk6f5XWxzle4+tHgXcgHZeQorqKt6usMkcwpe6Bst8rtzaODhKNA2bGN+V1FIsNEWR58CNnd0z0pdjeIKSm5I2u55eXFcP6VaLo7nmYevE47GC/HJomWxF6XbM0Yz0CRlqt7rY3Yjpwz546tnJUCEsGw/j4vRa5OcyYYmmlIWbyXCSl2MZlGloWS4avcv+ITytC/o3PEwqX31E5KlwmEHMDtxDbGbHOtOIgEa31jGNcyUNIeqQxw10W+bM8AeKFAnMy8+UZL/nhMLGl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(83380400001)(2906002)(6916009)(26005)(8676002)(38100700002)(8936002)(316002)(4326008)(54906003)(53546011)(122000001)(86362001)(76116006)(6506007)(6486002)(2616005)(66556008)(66446008)(5660300002)(36756003)(33656002)(66476007)(38070700005)(186003)(6512007)(508600001)(64756008)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2ED8D24AC678B24787A71C272AD26DC5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6576
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02f9e51e-f392-42d1-84c3-08d981c43ef2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1VCNoTFIl6DHLAeomgYW/zC8HEhDKFxIbPtSu9AEMhofZuoTECUR+5Gq37YrUICTY4semkjrMt/O8xJUxP0prncTXpMcUB1Wt21S3n8649k4699AHrhR7J7ErX2xBt6FhaaBKwTc4XFfs/p1yB8uGEE7IKnldwUoQWd+/+CcpiWpCZar5anSSkJF5Zt2U04tPtRzObTYFXfb101QL9afdc0Yr1zUakQFBj9ZEBltz9P7xSQT3Gt3UIsoOaCGPeNxbujRx3nygcFWGPPqG93/zL9c8ybGvUZs5aN1BfSIsKELfCZ6aUQMXZTu+N16ifRj4brq89nGECVRKw1PsoKx05MGrsRd5aaVBIiX7I5utxHpSnzH+x/h8lSLu47HHkEZ7R3998CI2pukRJuXm+DVGY6IeTK/v8nM9TLmFgRUY9kTj0ro0bZT6Z9wPfsagT3PbpV0LhtzBHCUxp8e6Gx8NQ96UYZeRqNb7VYx+L1Mr2Z0Mfz2rcSEL371Sq1pzotaj0qmPgZm4jOD8ArtXkkH0RJUy+Gd87423B9rxJyOg1Hymy0WS+hAudBRAlNcLvJyzjuQwcsxDy2RGFWXXNFbQWtnjKfAkTyr68vfHaFTNFTfPO1FOljIsUJnx6BpQhAnoDB35jxUKybxTDY5VIaoRmwsfEtPwjp9tzdbr30uvM0hBAPq6lYN4jRkW+2K/mE9UMzRi8iUTzEuZ+MkCLXuLQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(82310400003)(4326008)(107886003)(6862004)(81166007)(70206006)(2616005)(6512007)(36756003)(356005)(6486002)(53546011)(8936002)(70586007)(26005)(8676002)(336012)(6506007)(5660300002)(47076005)(2906002)(54906003)(36860700001)(186003)(86362001)(83380400001)(508600001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:37:07.6935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd589a3-5402-42f9-b31e-08d981c44867
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4432

Hi Oleksandr,

> On 27 Sep 2021, at 14:54, Oleksandr Tyshchenko <olekstysh@gmail.com> wrot=
e:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
> for OPTEE_SMC_DISABLE_SHM_CACHE case.
>=20
> This error causes Linux > v5.14-rc5 (b5c10dd04b7418793517e3286cde5c04759a=
86de
> optee: Clear stale cache entries during initialization) to stuck
> repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
> the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Sound like a reasonable change :-)

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> I wonder whether this patch wants backporting to the old versions
> since OPTEE support went in.
> ---
> xen/arch/arm/tee/optee.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3453615..6df0d44 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1692,7 +1692,7 @@ static bool optee_handle_call(struct cpu_user_regs =
*regs)
>         return true;
>=20
>     case OPTEE_SMC_DISABLE_SHM_CACHE:
> -        arm_smccc_smc(OPTEE_SMC_ENABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
> +        arm_smccc_smc(OPTEE_SMC_DISABLE_SHM_CACHE, 0, 0, 0, 0, 0, 0,
>                       OPTEE_CLIENT_ID(current->domain), &resp);
>         set_user_reg(regs, 0, resp.a0);
>         if ( resp.a0 =3D=3D OPTEE_SMC_RETURN_OK ) {
> --=20
> 2.7.4
>=20
>=20


