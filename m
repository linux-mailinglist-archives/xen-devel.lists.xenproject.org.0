Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AF4161DE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194411.346336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQRl-0002hy-PS; Thu, 23 Sep 2021 15:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194411.346336; Thu, 23 Sep 2021 15:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQRl-0002fr-M3; Thu, 23 Sep 2021 15:15:37 +0000
Received: by outflank-mailman (input) for mailman id 194411;
 Thu, 23 Sep 2021 15:15:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQRk-0002OA-S8
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:15:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1929f9e2-1c81-11ec-ba51-12813bfff9fa;
 Thu, 23 Sep 2021 15:15:34 +0000 (UTC)
Received: from DB7PR03CA0077.eurprd03.prod.outlook.com (2603:10a6:10:72::18)
 by AM5PR0801MB1732.eurprd08.prod.outlook.com (2603:10a6:203:35::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 15:15:31 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::e6) by DB7PR03CA0077.outlook.office365.com
 (2603:10a6:10:72::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 15:15:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:15:31 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Thu, 23 Sep 2021 15:15:30 +0000
Received: from d15928c17eef.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83D1DC5D-B044-4AE6-98CC-7CA82DE851C6.1; 
 Thu, 23 Sep 2021 15:15:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d15928c17eef.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 15:15:18 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4933.eurprd08.prod.outlook.com (2603:10a6:20b:e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:15:17 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 15:15:17 +0000
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
X-Inumbo-ID: 1929f9e2-1c81-11ec-ba51-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu6yH2OU1L8pGt0OBEYLrX9c4kaLijVOoTSHnKy0jo0=;
 b=rMmyeTC52PALgvE75fyHk0fA7ICOD+FgYNWJeGuUcWSsEVDmYbik3mn7RJ7qhDr615Mdi/W3K6LdCiIQoeQmVcQWAO4MN004m5fqXYgNUxtdpsB2ZRV+Zm1NJTxUyk9YYXsf46wmB4apdCrdOyY2FlvGw/kMbPTml02aJqS11hg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98f3d76b6eb4bfd1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAEHBz2Bq0xGcIAfj9UlQYBAwSOdhoClVC9FSOorz+BE9+Gwp1lTq2NQT0F0lvmK0dB4p8xkWuO/BKGRxYRmejXz+WqT01QL9EmCx0gWoUjPuu1xWp7whtU09oT6veMOAoiE9KDguZDZGeJ1jJaxb6K91bIvZnfVgljHC3FLet/+JZfcOHi/tuB+wbwz8Gn0xtMNoaH9ydC4Zon6FFFYJaFVdAaUkfVr75tlH4LSUhoGvvXiN7N5+2PifxS/QmkIsGBSwimfNlGR7DCCQZ6BG/XxVsGvReFjoK+K9erR3UFJsQyQ9BPP06lQZqQvyAAgt4Gp8PaK9npj8VDwvMH5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Bu6yH2OU1L8pGt0OBEYLrX9c4kaLijVOoTSHnKy0jo0=;
 b=QX6J4XLyW/ShRYF1YNCyz21DKzSlKpQUZ3Q4b0u37dPrpTAs70qztLXjqcqHdFHcxZ5cQ9H5cxBwx7FHehNB0erk6PCtVcVULAEAdqY+oZTBOIbFsrD4dJWe3uFJJh5Hbe9eZ2eaOcDZgEyWaCcMD4n0tvGUhxAmAddJnGjhn7xHUFAT7JxW5UkOUBDd8e6T+JRODqgLRdVkdhZjrpr65NZ2oVhKTib3HLaFq6/tl9RBPqft+F/p9QjFOKnlF7HAWOo6zl6HG5/mQQZdZKmdGlDmZOvp0Je0r7cKeV757DKCOESQfaVjdUwlrSLl8nh1pSFfnbg2SXyLdj2HBxJMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu6yH2OU1L8pGt0OBEYLrX9c4kaLijVOoTSHnKy0jo0=;
 b=rMmyeTC52PALgvE75fyHk0fA7ICOD+FgYNWJeGuUcWSsEVDmYbik3mn7RJ7qhDr615Mdi/W3K6LdCiIQoeQmVcQWAO4MN004m5fqXYgNUxtdpsB2ZRV+Zm1NJTxUyk9YYXsf46wmB4apdCrdOyY2FlvGw/kMbPTml02aJqS11hg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/17] xen:arm: Implement pci access functions
Thread-Topic: [PATCH v2 13/17] xen:arm: Implement pci access functions
Thread-Index: AQHXr6aktO5EpOLLjku5HahQRSHFEauw5LyAgADXlwA=
Date: Thu, 23 Sep 2021 15:15:17 +0000
Message-ID: <96F69005-D39F-4F6B-A684-7A4BCA275860@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 24b323bd-eaa3-4265-9663-08d97ea4fbd5
x-ms-traffictypediagnostic: AM6PR08MB4933:|AM5PR0801MB1732:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB173227F653DD978CD23C83FEFCA39@AM5PR0801MB1732.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HKMEx/iL+arVCwdNvGwpQ07lsSfxTehw6yOdPOz1/srx8t8cazWios7yRQFgu4lqZHxifFdI7GP7UKvU8jZ2vibGu0n9NbQc5lX74SEkhOihntf7C7SdOMqJeTgIi0Nt+E3BiXNW8oo39S2Z1GIYs0Bx6IZDc76bSB3n8+5lKJj02Oc0k4UnoplheJOS/W/sJYFN5p2jYzUWqOC/73zKBJmy+P9ldETfV2xOMl4GLu63iE1AJ3tVqnnkvqdDJO5samBAuQFRFj5NaSPHm4gYoxdpPif2hoY9B+MjbOESl1rmTGZymiSSqE7l4u5UzxlU2eCqBCPHzNULMPkr3SgI7BXYq6RTAX0Of+9XXLg4Gj1O1X7SlT1wTGuXvCAzerR2ooB+5dkHoF6YlOp3Y+WPy9VYmoCSFgfPpWjsLjlL7lCxJDZBEfNfEItGrHVl1SZwWvqIeG49EI6KnY2phDkupXyJXsdSJDym8WNEU8ow+LcesprlA4GBf8rYLSCP2ZMokt+cal7X1rSptaiEBWI7S2jCGjz1mmB9AT+xjCUjwhEg2NoFIUJBJSziPNmgl9qVbMKjTBRwlhMSXbXLlUrluYN2t8/jw+Jlre4f1SFo01LEZ6XJeELwpI4HuGhPOt8Vlc2/mInrGOLNXmyxgdlyVIL8qFfg2syVSAekOENbaCTnKrS0rULKug6eBdPom3EmksYqHptRHh4IB92NRXiQ8jc8iEJmmVS7bF5AlXkQoY4s8dmkpH6X5NToBrLqRLo8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(4326008)(53546011)(26005)(36756003)(86362001)(71200400001)(33656002)(6506007)(38070700005)(6916009)(54906003)(316002)(186003)(66476007)(508600001)(66556008)(83380400001)(38100700002)(2616005)(64756008)(66946007)(6486002)(8676002)(6512007)(66446008)(122000001)(5660300002)(91956017)(8936002)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28394010AEEA9843B2A93847D8DAB758@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4933
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de500561-e58b-4fb7-9e25-08d97ea4f35d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/Oj6aUHNEo1cksKlpd5IjKlPg6a+mmgXk9LKZwKc8JdaXLMLAojlTnSUVPKLGCCitXhucTo/5uAUWdcuEyLN9gQ97lPs4Gdvhs75DXAXMGb+FPIMimOPjDjNLZYPUjWShPNDjvozV07SSkVywLqkqmLLNnmVfZbXBYH729ztoPO06SM9DSm8koDkz/JeTt8VVpayDz5+yzVvFlfkLVal7muIOV1Vznuy/tYRVD4asaKMNvscGM7Eanf02zVFYPdac73GyH/b2wtlm2U/YQ6soUW/6BeHSEHhRT9Vfjp8C27C7rdn9m+aRImlHdxoGROQYJ8k7K5ZbPW9+gugxYHELSHjJY7gRGr9hCEBNxn2Mh27EW6xhD95+aSqiOQeIFVYRS5zSlPuw6T22Xt3XZtxfsFFDHN8Fjo7DR7v2epMrrwlIEkViifZpJXn4qdC5TxKPtOTw3Gsh5YN+3O5c3Xvqfc81eo3jNpnYdhULMh5v40y99n3F0otND/0SDK63XHlImBh9R2dInVYdooUUakfOXXJCO4y1IwKJ/pUr205+f1vbdS+LO+CIPBKkfvrG4l77mZCLLDXxILz8n4Fx8gvJts/1zmPmWPaAJXxMdYox9R4Cn6B/FWyw0QvNYezIJSrqLWEjMel4IClLmQbjyIghGU9UxrSB1UC3WkLSsKNdcbeghFgZst64MkOYH2617iVJKlZxq+vVBZ8D4LmVZhXA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(26005)(86362001)(508600001)(2616005)(83380400001)(82310400003)(70586007)(70206006)(33656002)(47076005)(6486002)(6506007)(36860700001)(6862004)(186003)(356005)(6512007)(5660300002)(8676002)(54906003)(336012)(8936002)(36756003)(2906002)(4326008)(53546011)(316002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:15:31.4381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b323bd-eaa3-4265-9663-08d97ea4fbd5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1732

Hi Stefano,

> On 23 Sep 2021, at 3:23 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> Subject should have xen/arm
>=20
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> Implement generic pci access functions to read/write the configuration
>> space.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2: Fixed comments=20
>> ---
>> xen/arch/arm/pci/pci-access.c      | 58 ++++++++++++++++++++++++++++++
>> xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
>> xen/include/asm-arm/pci.h          |  2 ++
>> 3 files changed, 79 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access=
.c
>> index 04fe9fbf92..45500cec2a 100644
>> --- a/xen/arch/arm/pci/pci-access.c
>> +++ b/xen/arch/arm/pci/pci-access.c
>> @@ -16,6 +16,7 @@
>> #include <asm/io.h>
>>=20
>> #define INVALID_VALUE (~0U)
>> +#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>>=20
>> int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sbd=
f,
>>                             uint32_t reg, uint32_t len, uint32_t *value)
>> @@ -72,6 +73,63 @@ int pci_generic_config_write(struct pci_host_bridge *=
bridge, uint32_t sbdf,
>>     return 0;
>> }
>>=20
>> +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>> +                                unsigned int len)
>> +{
>> +    uint32_t val =3D PCI_ERR_VALUE(len);
>> +
>=20
> No blank line
Ack.
>=20
>=20
>> +    struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, s=
bdf.bus);
>> +
>> +    if ( unlikely(!bridge) )
>> +        return val;
>> +
>> +    if ( unlikely(!bridge->ops->read) )
>> +        return val;
>> +
>> +    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
>=20
> The more I look at these casts the less I like them :-D
>=20
> One idea is to move the definition of pci_sbdf_t somewhere else
> entirely, for instance xen/include/xen/types.h, then we can use
> pci_sbdf_t everywhere
>=20
Ok. Let me try to get rid of this in the next version.
>=20
>> +    return val;
>> +}
>> +
>> +static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
>> +                             unsigned int len, uint32_t val)
>> +{
>> +    struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, s=
bdf.bus);
>> +
>> +    if ( unlikely(!bridge) )
>> +        return;
>> +
>> +    if ( unlikely(!bridge->ops->write) )
>> +        return;
>> +
>> +    bridge->ops->write(bridge, (uint32_t) sbdf.sbdf, reg, len, val);
>> +}
>> +
>> +/*
>> + * Wrappers for all PCI configuration access functions.
>> + */
>> +
>> +#define PCI_OP_WRITE(size, type)                            \
>> +    void pci_conf_write##size(pci_sbdf_t sbdf,              \
>> +                              unsigned int reg, type val)   \
>> +{                                                           \
>> +    pci_config_write(sbdf, reg, size / 8, val);             \
>> +}
>> +
>> +#define PCI_OP_READ(size, type)                             \
>> +    type pci_conf_read##size(pci_sbdf_t sbdf,               \
>> +                              unsigned int reg)             \
>> +{                                                           \
>> +    return pci_config_read(sbdf, reg, size / 8);            \
>> +}
>> +
>> +PCI_OP_READ(8, uint8_t)
>> +PCI_OP_READ(16, uint16_t)
>> +PCI_OP_READ(32, uint32_t)
>> +PCI_OP_WRITE(8, uint8_t)
>> +PCI_OP_WRITE(16, uint16_t)
>> +PCI_OP_WRITE(32, uint32_t)
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-h=
ost-common.c
>> index 4beec14f2f..3bdc336268 100644
>> --- a/xen/arch/arm/pci/pci-host-common.c
>> +++ b/xen/arch/arm/pci/pci-host-common.c
>> @@ -243,6 +243,25 @@ err_exit:
>>     return err;
>> }
>>=20
>> +/*
>> + * This function will lookup an hostbridge based on the segment and bus
>> + * number.
>> + */
>> +struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t =
bus)
>> +{
>> +    struct pci_host_bridge *bridge;
>> +
>> +    list_for_each_entry( bridge, &pci_host_bridges, node )
>> +    {
>> +        if ( bridge->segment !=3D segment )
>> +            continue;
>> +        if ( (bus < bridge->bus_start) || (bus > bridge->bus_end) )
>> +            continue;
>> +        return bridge;
>> +    }
>> +
>> +    return NULL;
>> +}
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
>> index 4b32c7088a..5406daecda 100644
>> --- a/xen/include/asm-arm/pci.h
>> +++ b/xen/include/asm-arm/pci.h
>> @@ -18,6 +18,7 @@
>> #ifdef CONFIG_HAS_PCI
>>=20
>> #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>> +#define PRI_pci "%04x:%02x:%02x.%u"
>=20
> This is added in this patch but it is unused here

Ack. I will remove this and will use %pp to print SBDF.

Regards,
Rahul


