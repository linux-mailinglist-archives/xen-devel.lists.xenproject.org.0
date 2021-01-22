Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B02FFFF4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 11:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72662.130885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tTM-0000tj-ED; Fri, 22 Jan 2021 10:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72662.130885; Fri, 22 Jan 2021 10:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tTM-0000tK-Ac; Fri, 22 Jan 2021 10:15:20 +0000
Received: by outflank-mailman (input) for mailman id 72662;
 Fri, 22 Jan 2021 10:15:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0IRn=GZ=epam.com=prvs=16567376ec=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l2tTK-0000tE-Rn
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 10:15:19 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id debe68e2-a8a5-4052-9ad0-e95827c19b49;
 Fri, 22 Jan 2021 10:15:17 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MAEluB016995; Fri, 22 Jan 2021 10:15:12 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com with ESMTP id 3668rwg7rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 10:15:11 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM9PR03MB7250.eurprd03.prod.outlook.com (2603:10a6:20b:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 22 Jan
 2021 10:15:09 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.014; Fri, 22 Jan 2021
 10:15:09 +0000
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
X-Inumbo-ID: debe68e2-a8a5-4052-9ad0-e95827c19b49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQZN2D8cNF+USVWYAyVfKTXTwGoFCgqZTs7w2Mt8+8w/RIaUFgOlGZ2WpUU7H51d8eYgsmexUAeFrJHhXuKENr1Q1C6rgEg37OyB5Q2CfcbH0/9xlsKOdQdvNBLQn8GtHyCwSJoc7Yfn6PVQow5inws6BDFJcAJIP9E/l9CMxZaBWpyTUhWIhh3JH45l1zkRlo/o6Q325cqX6P3jC7N9zqWGM0BBfrJZ+pLy900vXAg2Qa6lCJVK1HNNFOyKmBpBBs2s7n8Pp7jU5GiZGxhSWPBddsHMYNaB5TCeVO/AN0axlIVH7gPiAZl4epKK03S9qKYa54yYbmEhXlKnCJuIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghsbB059gqoJr2EJGr9y8U+7rOyvqEb3oAmRtxL4Uho=;
 b=S0yuIor3JPYqfwIqSumd6ji2NZlLEKxrlGBblB1eI9zcHN0IzQ7IC7p9h353rvziN/9ePmZriM/3fVq6JXIQBssU85AWnYrg1xNoUoP8P9zrJtQ+pvIPdKnDUK+HSP/Rbobl+e3JAQUdaNdct0jMMMeM5EIuKlV6DeAwdr6uSOztTSf58uAmxM/VtZHbQjfQWXl5slOTgDVnW1yqTYZ0E2mAMDTdaMFYSAEHyY0NuHLBRUI3Orpfe+5wCrysXYDHcGSTuQAPaob0prnKgIk1NACjauTCXi0zspnu0tHTZoZXKE4ePku4h/iXnXB1+pOsBH+Xbev6ht3q/NSRpNxqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghsbB059gqoJr2EJGr9y8U+7rOyvqEb3oAmRtxL4Uho=;
 b=AHUgkJRq1DCcFCS5oHDzUCFHEAXwSaZH+DaH9aXbPLBJnylC/SpZOWZxKxP9Rf7Ytbs55IQ+v97jtcHQpE6Gxh8H3QYxbY9SXlpQiaB390hL07PzFeMUKd/nYWk51euSadGjPnD/C0nRYvlmtgvOT4JlVU6Wrjk1p6hpmEeVNW2ZC/wd3V1KhB2UKQJBiZfAcv3P+4Y0bme7/z6eBLwkly8jewLMIgAd343qQgZU1L8XEbMVc+J2+p8ORMF7m4UVNY2CnBf8IxNQLGyohwj1FWHh+eWZ42ak5LTuKTAM2hyNgAororeDHVfmlHJNak2coWYJAFZcVXotx8wiwG+HCQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Julien Grall
	<julien.grall@arm.com>
Subject: Re: [PATCH V4 20/24] xen/arm: io: Harden sign extension check
Thread-Topic: [PATCH V4 20/24] xen/arm: io: Harden sign extension check
Thread-Index: AQHW6S1XhqmL2XksL0G2IwXoD8Dgg6ozfI+A
Date: Fri, 22 Jan 2021 10:15:08 +0000
Message-ID: <87lfcl1dn8.fsf@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-21-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-21-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f5def45-8723-4c10-52aa-08d8bebe98e3
x-ms-traffictypediagnostic: AM9PR03MB7250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR03MB72508703948EC7B5A9B8AECAE6A00@AM9PR03MB7250.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g9jNN+FD9lZxV5rt+pATgYQ0MqIgkfUPO74V2BCCp8GdjrQ6JAeGG24WElbdnFJ3ZITgLE9Pqf5eGbBGt7H6a4Z8lSkoCwXi2Nb7tIjUnP4AsIFZDHFFe8Z0qIo3poeuhKnV/R352HQ0Uuei8IbLo1qKaioDqNuYSbSuXaP03mX3SFszEzrArbMRU+SjLWBlNXQcNqG6n46ThyF54QdZ2B7vIprmHY00BBv0FJyHco+RnyBqeEaZKtClfdFmh7wHlHj8CV2y8w0XQraGweweWKHncTSazxvdZBwqNhlnmPYZMvcm71W+uUSnls+1HmpAh2CpkQ0zkB+3dibk4yBka7wG/AHfHWjKDKUgCQ1H1eQ12MiOc1gWJTRAOTj8NQ+3fm3fpBwSFzVbjIgGtUaxcQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(83380400001)(54906003)(8936002)(6486002)(66446008)(186003)(64756008)(66556008)(66946007)(76116006)(4326008)(6506007)(55236004)(26005)(316002)(8676002)(2616005)(86362001)(66476007)(71200400001)(2906002)(5660300002)(36756003)(478600001)(6512007)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?QJk5Da7gn9RYkTDIa1URJvd6MwILhqQKPq6iiJFQlgKq/siH1ENTOaTCep?=
 =?iso-8859-1?Q?Zuk/S5zENkL48tztVcuFP9HIrq0f+QAHB6W1MnnJ/k7lFpiDX9t56APh/P?=
 =?iso-8859-1?Q?abF6QmZSd6Uqqgd7yCuMYDtrnKt+yRibDq6LZqteOLuoYiS70WvrfEGGDt?=
 =?iso-8859-1?Q?8kCBKrxJpOCZ2u58k0AUf2ztg82lOVYHyCtMLhZuLuN6dAMc1KPFjqVDNu?=
 =?iso-8859-1?Q?XAWNgWSbiFw8ftp9Is3iBVBMvbyuiA1lzM/SDyeKKt3j/7YLpDJv7zj6ux?=
 =?iso-8859-1?Q?ThmNEOxUccrEpXT0pm3hYV+zVQJvS+lML86H2W509w8d9VKB6gioMxJ9u6?=
 =?iso-8859-1?Q?DcKVltHBA931f6CdOEHdcLPbMJIgKhqW6QSMbT9L7lsU4vkjVcZqw9usTh?=
 =?iso-8859-1?Q?XahtCjPpDleGpKyr8AvVWUSHqjcSFleexjR7cSReHRTm0HrJuzx1022PB+?=
 =?iso-8859-1?Q?gGvOiB2uCL+t362fT6LCWxujDaCthLmWlQjXUw6jx/slbHFKrb5WzABEbB?=
 =?iso-8859-1?Q?OJP6Ge3zo8hsV+TqafH69tNnI7qHmzhSDDpYcZGb/8CPv2qjgaVk5NlBzz?=
 =?iso-8859-1?Q?WpACoRyaAbPNjitY8MfwImf8BAriYo/dlGmw9X2aT0AgaRpwDojRGxP8jv?=
 =?iso-8859-1?Q?LQLNznCge/5tlTOiIXFsFrtxYu5JxQIa7CJp53nGzvUreB7A1Lu3j8HvJ3?=
 =?iso-8859-1?Q?nJO2MVWtqiy53M6wtCD7ZnMuMiGPv17hBtrnVaRYa9wF1w4Myhi+akApQv?=
 =?iso-8859-1?Q?KzOoHahjO+jdLkGMpoYSczPex6QVb5JNhQEpqqAkPTPqXoSYI8NLtrpjbg?=
 =?iso-8859-1?Q?R+0N16bUzbE6aLr5gWoYXYjnqIUWFtUaJLvVhX+wP1T9emze4q71SubRTj?=
 =?iso-8859-1?Q?mQWqxoRi7j34hnBAUGx/MXJm6+JJeeigdsDptYVChXhuvIy076vlsvVx2a?=
 =?iso-8859-1?Q?s8QRAdJHDH5sPZS7uQMRyY1ClzDWxb9hqtjlO7Jt7H5JEytfzgaxHmj3WB?=
 =?iso-8859-1?Q?n+oML7VPgHaAnGkJyz0295RRx/R+kFRNWns+pt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5def45-8723-4c10-52aa-08d8bebe98e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 10:15:08.9904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gugs0Pf5ff0Nl8Af/OaIQ/1cL7Cgw7BcmdlakI98kWBrcVkudP0j8nmVyaE+wZlNd47cbA8eeH5dv+QKp5n11mhx+Ss2oAKUYJwL7DxYoIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7250
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=953 lowpriorityscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220054


Hi Oleksandr,

Oleksandr Tyshchenko writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> In the ideal world we would never get an undefined behavior when
> propagating the sign bit since that bit can only be set for access
> size smaller than the register size (i.e byte/half-word for aarch32,
> byte/half-word/word for aarch64).
>
> In the real world we need to care for *possible* hardware bug such as
> advertising a sign extension for either 64-bit (or 32-bit) on Arm64
> (resp. Arm32).
>
> So harden a bit more the code to prevent undefined behavior when
> propagating the sign bit in case of buggy hardware.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>
> Changes V3 -> V4:
>    - new patch
> ---
>  xen/include/asm-arm/traps.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index e301c44..992d537 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -93,7 +93,8 @@ static inline register_t sign_extend(const struct hsr_d=
abt dabt, register_t r)
>       * Note that we expect the read handler to have zeroed the bits
>       * outside the requested access size.
>       */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    if ( dabt.sign && (size < sizeof(register_t) * 8) &&
> +         (r & (1UL << (size - 1))) )
>      {
>          /*
>           * We are relying on register_t using the same as


--=20
Volodymyr Babchuk at EPAM=

