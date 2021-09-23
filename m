Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77074161EB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194434.346370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQVY-0005H9-Vx; Thu, 23 Sep 2021 15:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194434.346370; Thu, 23 Sep 2021 15:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQVY-0005FM-Sh; Thu, 23 Sep 2021 15:19:32 +0000
Received: by outflank-mailman (input) for mailman id 194434;
 Thu, 23 Sep 2021 15:19:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQVW-0005FA-R8
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:19:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.69]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36a27d2a-66df-4bf4-8863-d8d7e125042a;
 Thu, 23 Sep 2021 15:19:28 +0000 (UTC)
Received: from AM4PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:205::42) by
 AM6PR08MB4935.eurprd08.prod.outlook.com (2603:10a6:20b:d5::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Thu, 23 Sep 2021 15:19:26 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:0:cafe::7b) by AM4PR05CA0029.outlook.office365.com
 (2603:10a6:205::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 15:19:26 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:19:26 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 23 Sep 2021 15:19:24 +0000
Received: from 7f3d68d77daa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB340EBD-CA0A-499D-A8A4-83DA249EB9C2.1; 
 Thu, 23 Sep 2021 15:19:12 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f3d68d77daa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 15:19:12 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6792.eurprd08.prod.outlook.com (2603:10a6:20b:39b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 15:19:11 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 15:19:11 +0000
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
X-Inumbo-ID: 36a27d2a-66df-4bf4-8863-d8d7e125042a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE6xfdgEbdAmnNOTa4mvdWHE85o6Ets6LCElyMVzqmI=;
 b=EvaYEBfTRw/VPr0aj1qumeSPtOHwvoj6iZeLTElmh5LBd79Qqv+PcqVx0ymAzwcwRqvXYkViaxrC8CZht72gm6voEmoYUBM3bja8g5P8ilcvqwJ8iT2PGbrGPZcGxLJlGDdLAsOz3FvCITjA4mlN+fVXXiwXnzH7YMrm8QWEGZo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: beb4aa114580152b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwI/NQJ4EtjRxkkENbLLwO+Ekd8/EkAYBiIFWsG9nr3QdJQVEviupLb0TIMwzMglC+ufMuH0egpmr8QEHdr/fLXD1tbUKTOvENW52K+W56iPrsFNFTPUCLipCSGcNrlGiCMRaZErE7pbRVyKOuurehQPu6NjTahwLBx/ctV/0qMbX9+NnKkA5RX/257yqFDcGaepXIwOB7FMFh+WtB1rdW2Quhw2PxzyJvjf6nRi2p72JvOEttNLfIgs9gDw7QdYcWskYk5EgrPF9Bb1WkHUQxYUa6ROoRwVRr9O8Tb1XpTr2oE7+7RZPkc0V2q989nTq6wvYvE0xF3YibS9+h5B+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CE6xfdgEbdAmnNOTa4mvdWHE85o6Ets6LCElyMVzqmI=;
 b=ixoCFCj4MrdtZCCcLMQ0bk1IIpUh8X3gTGCpYI9U9uS4nPfe5hDkw6YIRA5l6IRLwMrao15xp25hzjzQEAxHGbVSUAynMO7B18kxSeoK0RsByQ+WPnqJNYQ3E45sNDx1M9lAgi6SPP36tx4E5apcu3KNxAeIj/JhlqSSlJsnsEbiuVM+eUqZ4BhAbvLZUnujv11cTLADl7L8r34nflbI8xhF6U8nulbRQIjzIW2EP+S+IOffGXm7AIUQ1CPTmgI90z6J9XKoR2KtbLeStPrrJVFB0ck/7hBTbi7M1oZXBzMSj289EojiOAZZyK7SvmCKX3jTMipRRFRe/pvLx3sXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE6xfdgEbdAmnNOTa4mvdWHE85o6Ets6LCElyMVzqmI=;
 b=EvaYEBfTRw/VPr0aj1qumeSPtOHwvoj6iZeLTElmh5LBd79Qqv+PcqVx0ymAzwcwRqvXYkViaxrC8CZht72gm6voEmoYUBM3bja8g5P8ilcvqwJ8iT2PGbrGPZcGxLJlGDdLAsOz3FvCITjA4mlN+fVXXiwXnzH7YMrm8QWEGZo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 13/17] xen:arm: Implement pci access functions
Thread-Topic: [PATCH v2 13/17] xen:arm: Implement pci access functions
Thread-Index: AQHXr6aktO5EpOLLjku5HahQRSHFEauw5LyAgABvjQCAAGkgAA==
Date: Thu, 23 Sep 2021 15:19:11 +0000
Message-ID: <FE809237-508B-430E-BD96-13AC88BB392B@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
 <bcb7c35b-cad1-8da1-8723-82f1f79d4f74@xen.org>
In-Reply-To: <bcb7c35b-cad1-8da1-8723-82f1f79d4f74@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f21d33b3-fec9-4e01-71f9-08d97ea587e0
x-ms-traffictypediagnostic: AS8PR08MB6792:|AM6PR08MB4935:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB49358738DDB4D67001E26A96FCA39@AM6PR08MB4935.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 copAQoWmCUzwHanAMiTKXi/rq7xtLCNZRT2UYILgYnMTtE/eFPOHfXPonQbwFoJ2h6PW+hA/19sGOfMXrdZxuJkw1hALaDoe/4S9ti2DL29s5JYz3MDW1jU5bg7bS74yDK1+p6pjN6agqUN/Los54B+P0FsZ9UBvUbYzs/vngHj+5i/oMWu0abw9PrBliZ+MARFTgL0xpmzXjPgTQR3Uo/OGz7gJpPUAf7MTTOVararOZQhutDXFv64e4Gqc8HG+iVcCLjPolLBx9jYLOLtmk4+1jtS1l28JOg8sz5A4Lyp8hUL2YF7nVsO8gA58JEKEKDvjwCouusxEV0hSbWnmxfQNh3OzzImK6vq0suZILt89krzAKY6RGAmLwXtWDeDxASMtU+4ZnvblUJ+X2NysyN9OiJruaiZZx53/NKThx7C2idV2LfsEEDcI4sTeEW8Qe8n5MUvmZsM7OI+oLWAL0gQPja6K+v+O2gQKp+OiIwZz7Vh9SUFJ6avR7w+sWWgOLSzMRhq8L5VbN9O90Ld6P15sfKlUU7ARxB440nBMz/lJ6KDGxzS1IvjkpJ45bWGGG9lrzas/4V08izgi4WrX5LrI77ObvZ+gFKeMOrGU4hSeEZ3cTgZnv3AlhjPYqeNddyGut3hdqQ2add1GHtsM6C4OomlSzyjlk/W/Yk2zxVPvo1mlgyL7TfDnbrIYm4QpkubQaJNEvmEar+IeQEPieR0/d6D4LdwVrn/rHHRYt4wMsVrA/Bio9wgzH3PwGPcm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(4326008)(66946007)(66476007)(91956017)(122000001)(186003)(2616005)(38100700002)(8936002)(8676002)(36756003)(54906003)(76116006)(64756008)(66556008)(26005)(2906002)(508600001)(6512007)(83380400001)(66446008)(38070700005)(5660300002)(86362001)(53546011)(316002)(6506007)(71200400001)(6486002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F1C75946B535174BB86B87F7D1FB6FD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6792
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c170cc3a-aa0a-4058-4f14-08d97ea57ef9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vuoLhwseRH4dELh47r+9Au9TbCbTXt+bO7jkUg5aleRVGspjPI00VPOuyNbSx/IkwHcmVn/IxIR1j228tfnC10CTeouk8P3PVu+rDD2n/6JNyuNiQN+UwEL8/ry79V6cYMpHZuXsf3jHg1G3tpw3FMjw4cqxHdufRAg0GnGcXpnkYm0Byp40CpOmTGoHPV+wEsSObSkcI6lM3zIw59fsIwlR0JGlmG5qZn86Nj94aId5Ah+twF+qF58E0KPoLr+XM85AivuUUNtPVaxtav3kAUwObRulXgQNK4r7+wz2/kZ48mgtL3VG3IQSOG7VJbxfXj0ugU9hUrE7RViJ8LULpB6/lFMkY5Qkc74RPeeDT4ZUgzX67DUH/t5/HDMDrJq9+LgZ7STbqdQFxV1IR9+ty5i2Ef0JfQgFsoBfJS5riT+OwW5z89zPGqlSkhrbKyoql7cANad6sa/C9LXF6RcXoRn+eXdAQmmTOHKrPpToZBSt93/PeGIwyXIE79zA3yNeGV8BsyUsDFLLQUrFKrdVS7m3sTHtNpGtJM+l6G+GDnRtIWLMSxS5H0rtRc2NEHVlT6XcBqXM5D6/5a3UwOIqTdPOE5muDHw2vW+eplfWQHN8nOjjmBl9jKYZcQo6cUeC2RJJbwcAT3Rp/7BMt9akkEww9TX+K8u0PDuz6qlsgEauFxJYV7Qx4hbPs19lwROs10iE/cgxE5i2Pj07BAueqA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(6512007)(36756003)(2906002)(186003)(8936002)(508600001)(6506007)(53546011)(83380400001)(54906003)(26005)(6862004)(316002)(336012)(8676002)(81166007)(5660300002)(356005)(4326008)(70586007)(86362001)(70206006)(36860700001)(33656002)(2616005)(47076005)(107886003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:19:26.2923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f21d33b3-fec9-4e01-71f9-08d97ea587e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4935

Hi Julien,

> On 23 Sep 2021, at 10:02 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 23/09/2021 07:23, Stefano Stabellini wrote:
>> Subject should have xen/arm
>> On Wed, 22 Sep 2021, Rahul Singh wrote:
>>> Implement generic pci access functions to read/write the configuration
>>> space.
>>>=20
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Change in v2: Fixed comments
>>> ---
>>>  xen/arch/arm/pci/pci-access.c      | 58 ++++++++++++++++++++++++++++++
>>>  xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++
>>>  xen/include/asm-arm/pci.h          |  2 ++
>>>  3 files changed, 79 insertions(+)
>>>=20
>>> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-acces=
s.c
>>> index 04fe9fbf92..45500cec2a 100644
>>> --- a/xen/arch/arm/pci/pci-access.c
>>> +++ b/xen/arch/arm/pci/pci-access.c
>>> @@ -16,6 +16,7 @@
>>>  #include <asm/io.h>
>>>    #define INVALID_VALUE (~0U)
>>> +#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>>>    int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t=
 sbdf,
>>>                              uint32_t reg, uint32_t len, uint32_t *valu=
e)
>>> @@ -72,6 +73,63 @@ int pci_generic_config_write(struct pci_host_bridge =
*bridge, uint32_t sbdf,
>>>      return 0;
>>>  }
>>>  +static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>>> +                                unsigned int len)
>>> +{
>>> +    uint32_t val =3D PCI_ERR_VALUE(len);
>>> +
>> No blank line
>>> +    struct pci_host_bridge *bridge =3D pci_find_host_bridge(sbdf.seg, =
sbdf.bus);
>>> +
>>> +    if ( unlikely(!bridge) )
>>> +        return val;
>>> +
>>> +    if ( unlikely(!bridge->ops->read) )
>>> +        return val;
>>> +
>>> +    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
>> The more I look at these casts the less I like them :-D
>=20
> I really dislike them. This is kind of defeating the purpose of trying to=
 be more typesafe.
>=20
>> One idea is to move the definition of pci_sbdf_t somewhere else
>> entirely, for instance xen/include/xen/types.h, then we can use
>> pci_sbdf_t everywhere
>=20
> AFAIU, the problem is the prototype helpers are defined in asm/pci.h whic=
h is included by xen/pci.h before defining sbdf_t. Is it correct?
>=20
> If so there are two options:
>  1) define sbdf_t and then include asm/pci.h.
>  2) Name the union and then pre-declare it.
>=20
> Option 1 is probably nicer is we have more types in the future that are u=
sed by arch specific but defined in the common headers. We have a few place=
s that uses this approach.
>=20

Thanks for the pointer I will fix this in next version.

Regards,
Rahul
> Cheers,
>=20
> --=20
> Julien Grall


