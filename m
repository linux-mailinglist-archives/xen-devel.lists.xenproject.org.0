Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E6E41C5C1
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199135.353007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZl6-0008Vo-4y; Wed, 29 Sep 2021 13:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199135.353007; Wed, 29 Sep 2021 13:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZl6-0008TG-1k; Wed, 29 Sep 2021 13:36:28 +0000
Received: by outflank-mailman (input) for mailman id 199135;
 Wed, 29 Sep 2021 13:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVZl4-0008TA-HA
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:36:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::61a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a13a848-2b61-410b-9a02-3ef62f575330;
 Wed, 29 Sep 2021 13:36:24 +0000 (UTC)
Received: from AS9PR06CA0071.eurprd06.prod.outlook.com (2603:10a6:20b:464::22)
 by PAXPR08MB6880.eurprd08.prod.outlook.com (2603:10a6:102:13d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:36:13 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::d9) by AS9PR06CA0071.outlook.office365.com
 (2603:10a6:20b:464::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:36:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:36:13 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Wed, 29 Sep 2021 13:36:12 +0000
Received: from cbfb6b425cef.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C09195E-60A6-4CF4-BBEE-A527731CA7BC.1; 
 Wed, 29 Sep 2021 13:36:02 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbfb6b425cef.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 13:36:01 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6096.eurprd08.prod.outlook.com (2603:10a6:102:eb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 13:36:00 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 13:36:00 +0000
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
X-Inumbo-ID: 5a13a848-2b61-410b-9a02-3ef62f575330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUdQTf4RQFZ+vYRUAEgBYR/Ty0P7fxukhQDG5LwOMZE=;
 b=xzfb0xCZl7FgBQTEkRw6vblaSpGP+9T3yiLIRQxz/5C/V61iarqXWnxV4Digr3rk15CBj8BRcP4GU3zak3pRO99McPT8qelUr888IZXGKx14Xz3pxjjnNgJTw1qWRWkSW9QAe8l79/nw4LlDOOI51XbQY1D+Vnx/4c+Yso4/7Ag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fbcf46bb206553d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8Q74y7Ndje+FrdOzaHaco/aLzTXcU7yoOfgZBIMky71LDMr0z0Fsggza+X14/u5aSFoqU2HDJxhxpb6rDIWBFS+uiixKIPMVAWTvw0lBloVvEYyStJgxnxWn1mEeJGJiKGL6LOl+8lXdhM3WFRAcrRgyOyINFNEj4QIoQn/+2BkqJyK7SPwrKX2hsYLBP0FT4lUru+I/fP97hC+/cd40tcQxuqiN+Ej9sCTx5iZzVazH66DCP4nj1gmDyDghVCLjlZsf3VlA7J+WY1uI7kzaGhvUhOe4ipjAXFuHpwwlnXTBgDaauXn8jqKJxWvHqf7icuF+sFLrah/okTxi7sx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oUdQTf4RQFZ+vYRUAEgBYR/Ty0P7fxukhQDG5LwOMZE=;
 b=HflqfEnTwDMRB5MWMaK59OCB2gfhmFUUpQ5mrcmhOFDiatvoEMOAeW83CfyCo2gqx17YLGOmYYdMz55ZsnKBI9gOriU60O8xPP8PHEwrWWjgEwTuLRXoOiqxmSsaesTECXyjtNR5M0awaxQihw3fkaoit0p23ir7hgpjwDYkZ04urplW+JwRGKYOJHu85UGWu6aKWsam2xnleem36hB2YhV5fsTCRESjyYA/+WY3ZEz0m9uNqAEPhNa3LQIS6GdTAnNsXMrhaGWj54ZLw+BnRcf/Ill9FN4GLrpHyjPIelgAM8wDUktPXToc96B3QAlFf+MroEjk3zI+F74/IfuhOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUdQTf4RQFZ+vYRUAEgBYR/Ty0P7fxukhQDG5LwOMZE=;
 b=xzfb0xCZl7FgBQTEkRw6vblaSpGP+9T3yiLIRQxz/5C/V61iarqXWnxV4Digr3rk15CBj8BRcP4GU3zak3pRO99McPT8qelUr888IZXGKx14Xz3pxjjnNgJTw1qWRWkSW9QAe8l79/nw4LlDOOI51XbQY1D+Vnx/4c+Yso4/7Ag=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 13/17] xen/arm: Implement pci access functions
Thread-Topic: [PATCH v3 13/17] xen/arm: Implement pci access functions
Thread-Index: AQHXtJXigQn0BAihyEq+PFitR4jFoqu7BLSA
Date: Wed, 29 Sep 2021 13:35:59 +0000
Message-ID: <92C54E23-582B-4DA6-87C3-DAC1041ABA7B@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <33cc6b7a133787700ea8ba4e54a03141d3aca1ea.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <33cc6b7a133787700ea8ba4e54a03141d3aca1ea.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4535d10b-64cb-4c26-a34a-08d9834e1b03
x-ms-traffictypediagnostic: PA4PR08MB6096:|PAXPR08MB6880:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6880BE5CB7A1A517773952429DA99@PAXPR08MB6880.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KQPi+Bj3SIx3qbGCyypgqf93GUQAyNha9mjRPJH/E2/jdUF1cBRAeYHbZw1qwfwIKOoLMQlK+aGdpd/tSm34grOeX26nxjh25B9GMohIE3mRYwhxQzDfItugxnYaXHN+Ic0eKhjdMbKHKV6ewV5UZiY4QjXjYt18ArVaAoy6uBmuAd4vz0n7IhgRVa481O8nCWr19Q4srDlE6Tz+Kdnbdr+Yj/OGHhr6rWY+jrP5UFrTnVyDawGjdiya5nyM0tZcUns8jjgvtOuYlCX+6cjDUkM9loBRB5B8AvM4mlOyo0P7eJ/olr0qIJZDZQ8mQwA8yxwzlbi0BUl+PH2lPRre64OFyqwlPXvGtyDoeU+2Mqxx17b7wOjkJuT0ryGxfEAOX4/7+gjbrVqZsOmHjtf9olLA57SaarYc3tqsPhXmR2QeZj9ebxchgfW8smnS0xv5RAXQG/wm/FWSZxleKR1JymcM5hLJKHHiGIM0oayikB0GpnngAjkqmOBhiTH9JEyLpC6ipm62Ru/ov4qhztPLjphw3NHUK7jZKcVkCrVwUFTa8zWk1V2UtKcW2Ex4iWm80fQ+VeiNHBXNx121mHTDQKJRi2v+EqlZpV69los7LVKowpHg1a0lPGAfmUpilbJmsubr86MXAMP1SaoP9X8+7+xqtZAcW5+Q2F4jjQtpVI8vJsRT5cx6xz/amsJ+cMVCmBFUMfGlOQzg1XxNnTY2OyHm8mkaju/M17bmZTOIQS3RLfXIsaxCiR+JzRvlVM74
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6636002)(54906003)(2906002)(66446008)(5660300002)(53546011)(6506007)(91956017)(64756008)(66946007)(66556008)(66476007)(26005)(76116006)(186003)(2616005)(71200400001)(38100700002)(37006003)(36756003)(6512007)(122000001)(316002)(8936002)(33656002)(4326008)(6862004)(86362001)(8676002)(508600001)(38070700005)(6486002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C4A06334DF3044697413927AF293B8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6096
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b6e492d-1476-42e0-12ca-08d9834e1312
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ePTbsTcCR4F/tCftxqXc5f7ue3/VDyJYwVo2+5MOBOmJbvNYk2paQsvFCLOIHXb0vSSA6Ku36bi4rqSHLq5JDxs7xs5EIxrT1q6fQJfJsjlkiCKfut0D1rtS1Lsfsvd2yqQPTBBy+Gdc4AKm5wIM3fBisQ4B6E3ud0qOUcKIZ544ieM2ffhWrAYy9j0B3UER8CPtgiGpRxgMqroukve6XJSrqrB618Vys2IX4dT6eI4q1Cdw4VEOkxpFW8xTHkqZwkBKxq6h6TT3BT8lsfzH+I87f5rZaChNmz40LylOeK1cYOj8ptqR1ItsVBqQFSsHnv+M57v6JNiL2jWo8FU8OJBabp8zC6LZdSFThoKmASmwdWlJx/3cOIGiaU44m6oi4d/bPilwSIzWcVgJtE7ff45ugMctzT1p/npjpr90qs5cdGgf30Lu7Aje8mI9Ba3ZCtIMv7MTxhYMnOXA9wPt2m5SKbQOYj40etgvghXhPYdgC7kPthol3NHA7S9C0gSfGEOGBQZrvD9pjMexcFvbUAkcTilm3Aezc4Nf6R1j7VSGyjfEL0pq12JAHi6oekdOVmDzASvh8N1TBqQUNAZ0YifZ8xmf4dpvOwUg/GQLf9xbbEPmyYFrS+tnh5EaUiO+pJaY9tmWyAxrvTiS9Go0QFMdm1+G1bs8dKjDrUC72LeSKmY9+8qq4rkFa9kyYtpFdUF0jRxDkXrKFcmlwtP0/A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(356005)(107886003)(70586007)(186003)(6862004)(86362001)(33656002)(2906002)(82310400003)(26005)(36860700001)(70206006)(36756003)(6486002)(2616005)(316002)(6506007)(47076005)(81166007)(336012)(508600001)(37006003)(8676002)(53546011)(5660300002)(6636002)(6512007)(83380400001)(54906003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:36:13.2737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4535d10b-64cb-4c26-a34a-08d9834e1b03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6880

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> Implement generic pci access functions to read/write the configuration
> space.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Remove PRI_pci as not used.
> - Replace uint32_t sbdf to pci_sbdf_t sbdf to avoid typecast
> Change in v2: Fixed comments
> ---
> xen/arch/arm/pci/pci-access.c      | 57 ++++++++++++++++++++++++++++++
> xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
> xen/include/asm-arm/pci.h          |  1 +
> 3 files changed, 77 insertions(+)
>=20
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.=
c
> index 3cd14a4b87..9f9aac43d7 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -16,6 +16,7 @@
> #include <asm/io.h>
>=20
> #define INVALID_VALUE (~0U)
> +#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>=20
> int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
>                             uint32_t reg, uint32_t len, uint32_t *value)
> @@ -72,6 +73,62 @@ int pci_generic_config_write(struct pci_host_bridge *b=
ridge, pci_sbdf_t sbdf,
>     return 0;
> }
>=20
> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> +                                unsigned int len)
> +{
> +    uint32_t val =3D PCI_ERR_VALUE(len);
> +    struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sb=
df.bus);
> +
> +    if ( unlikely(!bridge) )
> +        return val;
> +
> +    if ( unlikely(!bridge->ops->read) )
> +        return val;
> +
> +    bridge->ops->read(bridge, sbdf, reg, len, &val);
> +
> +    return val;
> +}
> +
> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
> +                             unsigned int len, uint32_t val)
> +{
> +    struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, sb=
df.bus);
> +
> +    if ( unlikely(!bridge) )
> +        return;
> +
> +    if ( unlikely(!bridge->ops->write) )
> +        return;
> +
> +    bridge->ops->write(bridge, sbdf, reg, len, val);
> +}
> +
> +/*
> + * Wrappers for all PCI configuration access functions.
> + */
> +
> +#define PCI_OP_WRITE(size, type)                            \
> +    void pci_conf_write##size(pci_sbdf_t sbdf,              \
> +                              unsigned int reg, type val)   \
> +{                                                           \
> +    pci_config_write(sbdf, reg, size / 8, val);             \
> +}
> +
> +#define PCI_OP_READ(size, type)                             \
> +    type pci_conf_read##size(pci_sbdf_t sbdf,               \
> +                              unsigned int reg)             \
> +{                                                           \
> +    return pci_config_read(sbdf, reg, size / 8);            \
> +}
> +
> +PCI_OP_READ(8, uint8_t)
> +PCI_OP_READ(16, uint16_t)
> +PCI_OP_READ(32, uint32_t)
> +PCI_OP_WRITE(8, uint8_t)
> +PCI_OP_WRITE(16, uint16_t)
> +PCI_OP_WRITE(32, uint32_t)
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index a08e06cea1..c5941b10e9 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -236,6 +236,25 @@ err_exit:
>     return err;
> }
>=20
> +/*
> + * This function will lookup an hostbridge based on the segment and bus
> + * number.
> + */
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t b=
us)
> +{
> +    struct pci_host_bridge *bridge;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        if ( bridge->segment !=3D segment )
> +            continue;
> +        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn=
_end) )
> +            continue;
> +        return bridge;
> +    }
> +
> +    return NULL;
> +}
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index bb7eda6705..49c9622902 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -81,6 +81,7 @@ int pci_generic_config_write(struct pci_host_bridge *br=
idge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t value);
> void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>                                pci_sbdf_t sbdf, uint32_t where);
> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t b=
us);
>=20
> static always_inline bool is_pci_passthrough_enabled(void)
> {
> --=20
> 2.17.1
>=20


