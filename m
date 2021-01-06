Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4942EC20B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 18:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62610.110968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxCYA-0008E6-0R; Wed, 06 Jan 2021 17:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62610.110968; Wed, 06 Jan 2021 17:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxCY9-0008Dh-TO; Wed, 06 Jan 2021 17:24:45 +0000
Received: by outflank-mailman (input) for mailman id 62610;
 Wed, 06 Jan 2021 17:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymaU=GJ=epam.com=prvs=1640561998=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kxCY7-0008DU-Og
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 17:24:43 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65737200-f86d-4b68-96bf-c206153cb716;
 Wed, 06 Jan 2021 17:24:42 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106H5IjF010816; Wed, 6 Jan 2021 17:24:41 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0b-0039f301.pphosted.com with ESMTP id 35vfkt4fqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 17:24:41 +0000
Received: from DB7PR03MB3515.eurprd03.prod.outlook.com (2603:10a6:5:7::13) by
 DB6PR03MB2967.eurprd03.prod.outlook.com (2603:10a6:6:36::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.23; Wed, 6 Jan 2021 17:24:36 +0000
Received: from DB7PR03MB3515.eurprd03.prod.outlook.com
 ([fe80::867:fb8:1a47:49f7]) by DB7PR03MB3515.eurprd03.prod.outlook.com
 ([fe80::867:fb8:1a47:49f7%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 17:24:36 +0000
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
X-Inumbo-ID: 65737200-f86d-4b68-96bf-c206153cb716
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCstC1awSraoah69oZUFmE80xPpMNS8oj5lrbq39fy5LIO8wCStQfwcFaQqHBmJKwm8/8XAR5mb0GWes+KqH61rm6F8R/7kedY6sJlfFgVBrcigpXk4NHO1YHum5h583kfx/wqA6us4Eo5swekBmVJQ6ku0uGhdP6ZpOZyXLXYjMQLOiFcq1X8edv+hZnp5Qaj1y4OGyBlYxhQx9bn7waqDD92WXIRIjdfOZAwuFa75XRZqER8SNWqgVitjFiRawsJ/WoxYt9gEdUJ0wYJ8y2IQSbrg3jpLYgMZx1woaqzKnN0fFKbM6bswEB0O3WM3fHTzGo924cWUZGcTk7DvNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glfKJyUaI5sXDPm8SMW+lj4F6N+DcQ0VCS0ea/5vKgw=;
 b=B/pxOzQx1HD+6OfcVEH6jvIhGEr136d5wOilwBgcJzha+e904qUq2wPxWQoOs/UFMPulNWR115yNA9omQWgJVc11EcFvo5ECDs0F4QJNMifE9UDXdk3XNlK6KGYvT1MUF+Ad1ahZpXNiBMudHZQto7bHgx08l/ahWhO/JDOfxRrDJsXlO3RfsYWRd34NFCaxKUZmeYug7FCxvNhBMn23qOGhYx9GRF4zqxds4Lop+Adfg4X+9MgctdPwWPGhiS7ZnneidCvAYCHdF6SMcB8+JS9HTYWqnImaG9EhKu2PIqpJlQphhJ5ZrgjIIFocSM7QwiuM7q/fYRLPsBC2NOe+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glfKJyUaI5sXDPm8SMW+lj4F6N+DcQ0VCS0ea/5vKgw=;
 b=xxeEQwVigOf9zwZOth5k7bJwMJKsWEXj8nMcTE5fUdW1yyMsWhJ+xRxrbopGLVJ67Bd1kT4QzsQbNv8U5Z+BlP6uNmrtzaocIXl4CUx4eTrqvNHV/r4NPequ6pYRwZ+Fs9qqAgAxZhvuUw6a7Duvvfu865/3kqqm8X830iHu8B37mXBU5ZQHMM97tHiolNpVKSdDsXo8zEWrv81kSxyDVxocZ/5YA0x7krbW+lkz8ILl7u0taEyBtNNkaPdbSuKV12Av14MhCzQzYuaa6o2IeDH0z2k5mSBoTuL06TFoG7Gr1Z4lLvOp24Y+BT1tjDkNJo5KT6/8zYmFWmsJ1cXdQQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Roman Skakun <Roman_Skakun@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg
 according to SMCCC
Thread-Topic: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg
 according to SMCCC
Thread-Index: AQHW5FDO/0Cfv0AE4UK/bVkTy4DtrQ==
Date: Wed, 6 Jan 2021 17:24:36 +0000
Message-ID: <871rey567g.fsf@epam.com>
References: 
 <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
In-Reply-To: 
 <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83a70f47-fc1d-46fa-bf7f-08d8b267f103
x-ms-traffictypediagnostic: DB6PR03MB2967:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DB6PR03MB296734E90CD4889BB157C4ABE6D00@DB6PR03MB2967.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2Y1r84E1fY8pTacWBzyk5CmGoH3EYhsZB5GACc/V1sLgXnXSn4jkQ86OCYivEsBkrJtkpwtqE8UEXnYQHMx95o55jVN0I3GeFvWtcYhzAQ6cF5m41/wHUWf05wNDWKDWrC3EB4I6Kshozt7eECzHbBDPI9autQ6JXfM4e48d5biinEnjpI8nlUEvMpMCeifaHqMs+6jUbrSLdogV0ajMGMIWDCRWgDBmVQJWAEzb41kZ6fzejWhJv6e5uT/4zJxb1lXDIEZT1qvtnN70dYKcPutWD2gxotiJE9ZYL4tijnujhCD8FqTv5Vzb0zqgyxe4d6K9eD//lDzHS99xEaLsGH+8S765fug2RF9xWLsE6K4Agk/12ZWUeW06E0PTyU7zuJ2rZM7k/OUoMIeP+70G4g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3515.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(6512007)(86362001)(5660300002)(55236004)(8676002)(91956017)(6506007)(478600001)(37006003)(71200400001)(83380400001)(6486002)(2906002)(54906003)(26005)(36756003)(66946007)(2616005)(4744005)(4326008)(76116006)(66476007)(66556008)(186003)(6636002)(66446008)(8936002)(64756008)(6862004)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?uJSnpYhh+FZSS8HrbKiExbHBN61qo68N72JRabreH3unA+Id4ZgPwDu69+?=
 =?iso-8859-1?Q?FmTvOGeAQx8FMBF3amucHcVIm3V/lLxLCXkradDvT3N/VyKYs6FcZ5jNTc?=
 =?iso-8859-1?Q?r0i5dUrWKvr4xy0PRKNh/m03KAdh+8SUzw6yeZ9ZhkOCuoLs2oV7k9L8kf?=
 =?iso-8859-1?Q?JQrV4orXRhI0OnfTBq/nN8SKTS9fPloJt07DJhZ+XFiwJjnaCcMyUImsil?=
 =?iso-8859-1?Q?niHNbYKlxz4Q3BfUElGwxN316eWTcEUKyK2zSpVp78DHK/ftK7k9JeZ3rw?=
 =?iso-8859-1?Q?fdmur5i25k04H4tdouG2jHqYck15o2RSdGNlRSEV1gdVmAVwEJh64K+cBq?=
 =?iso-8859-1?Q?mFiJHyALpm5I+gItdTJljMwWmob6wsfn1M0twfvRzpFFydgJ7eTzHjLTv8?=
 =?iso-8859-1?Q?+e3yxBiNRQausQpgvg5sJcz7ou2O8sj2vSZULj/ViQM5KPnCSluiFl0Rvm?=
 =?iso-8859-1?Q?aP4nKq3s7Glz8mZlxutEIpihU1SLYR7TH/HFuDSkJlYtznp6PDr2ByhtAw?=
 =?iso-8859-1?Q?FJf3YcsT1Xd92seCx9w7PhNEpZYGgh5gxwnhkeSd132xi/6cIhNKvLl8np?=
 =?iso-8859-1?Q?akKf8n+c8m/QLSczJ298yqboHaz/aBWDT6cvLCY4vYxBQPx+6HRIC05ryW?=
 =?iso-8859-1?Q?QN/6LUUA+z/SMhHnt9T+imNB6+ATjM9NCU5zFpBIWY9a3W3LSHi9UiYBiK?=
 =?iso-8859-1?Q?z77cz9pZzWZnvJoh304xbTArczvuoqgqE1kxkHQ7yu69yyrQpY6sVbjAK0?=
 =?iso-8859-1?Q?9kYfKdaMExPpLr0Neoyy6faCe/0DEqNB1kQr6jZJ3fgOp3XEWiP5Ds38MO?=
 =?iso-8859-1?Q?uRy1QkBCiRUAOKf35tVU4BtmluB2qK9n3HIa1Igz2EEWqi5PwH+jFsx2aA?=
 =?iso-8859-1?Q?18QsEFdxDMQ/696hoiU38yK3npp5LCyCjVhWkYujtYlmgbZDJhDpc2ZtT+?=
 =?iso-8859-1?Q?2Nn1Fj161RAEtnRAQGHHK65IgOQ8qqUMRwOEIRXUly6GMlRAITxy8IzP6u?=
 =?iso-8859-1?Q?zl5lpR9HJRtw/l5GeUKKJFB+gPTdPwgXV8jPOr?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3515.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a70f47-fc1d-46fa-bf7f-08d8b267f103
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 17:24:36.6526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ENgAMv9MjqnWW4LSZFi4FfU0x1HH8tb1erIFCpEPg5V1sI2tlBEfa5PYcV5qhxvL9Qf9GCwUcQ40DHFgdVz91x9HcO9ZolRm6Zo4hZcSrD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB2967
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 mlxscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=909 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060101


Hi Roman,

Thank you for the contribution.

Roman Skakun writes:

> This patch added additional sanity and increases an understanding for
> getting proper value from the first argument for SMC call on aarch64
> according to SMCC Convention.
>
> [0] ARM DEN0028B, page 12
>
> Signed-off-by: Roman Skakun <roman_skakun@epam.com>

Acked-by: Volodymyr Babchyk <volodymyr_babchuk@epam.com>

> ---
>  xen/arch/arm/tee/optee.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index ee85359742..87060b52b8 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1643,7 +1643,8 @@ static bool optee_handle_call(struct cpu_user_regs =
*regs)
>      if ( !ctx )
>          return false;
> =20
> -    switch ( get_user_reg(regs, 0) )
> +    /* Only least 32 bits are significant (see ARM DEN 0028B, page 12) *=
/
> +    switch ( (uint32_t)get_user_reg(regs, 0) )
>      {
>      case OPTEE_SMC_CALLS_COUNT:
>          set_user_reg(regs, 0, OPTEE_MEDIATOR_SMC_COUNT);


--=20
Volodymyr Babchuk at EPAM=

