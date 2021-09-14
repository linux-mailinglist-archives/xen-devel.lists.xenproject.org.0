Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD340A8FB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 10:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186245.334968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3Zn-0006JS-DA; Tue, 14 Sep 2021 08:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186245.334968; Tue, 14 Sep 2021 08:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3Zn-0006Hb-8u; Tue, 14 Sep 2021 08:13:59 +0000
Received: by outflank-mailman (input) for mailman id 186245;
 Tue, 14 Sep 2021 08:13:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2So=OE=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQ3Zl-0006HV-7J
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 08:13:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06a01939-8216-4ff2-9ec1-584f953997b8;
 Tue, 14 Sep 2021 08:13:54 +0000 (UTC)
Received: from DB8PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:10:be::18)
 by AM9PR08MB6867.eurprd08.prod.outlook.com (2603:10a6:20b:305::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 08:13:51 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::b3) by DB8PR03CA0005.outlook.office365.com
 (2603:10a6:10:be::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 14 Sep 2021 08:13:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 08:13:50 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Tue, 14 Sep 2021 08:13:50 +0000
Received: from 10064435747b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 332A3621-72CE-4AB1-915D-21EA221845BE.1; 
 Tue, 14 Sep 2021 08:13:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10064435747b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Sep 2021 08:13:45 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4657.eurprd08.prod.outlook.com (2603:10a6:20b:cf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 08:13:43 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.014; Tue, 14 Sep 2021
 08:13:42 +0000
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
X-Inumbo-ID: 06a01939-8216-4ff2-9ec1-584f953997b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1eAOtC3pk2epVyElQaImZ6r7HoGTFqWbmPybf/bh2M=;
 b=Fs7gBpms9ovJ/v2CcKLVo4RvZRYXbN0eQsegsvg72LB61HwRpyZcNknL7/cex4ZJubDGEqJ0mT+XjpBpIEzjDthM9KU8hjFZg1g1sRuM0jFoE9GxOWNCXqYPfQCNsQB5DLVqgqpYxe0d4zV8c4BDKZQuDLXgHxTDMu30lPilJbI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 527c5467429b26f3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rvt6BTXOY+B8/YOTsjq2x34GU7l0FMw/uH4BJEAyX2majIedFZZ2XuGk32p9VylnblZKL0NoM4MAvQ4M3NpndMbe5NvPu/yQsR/34ZXhtC1lOAVaVKxFK+hrHe7QsI3ht4BXjQuzNRbGqXVu/B/MhQIxlt5//bpDuoEB741NLfa1vO1dPkSeM9fhEwWWBa0YPv1B8Zx1xBqApRv9lHxUi2Zc9B+TNxFTpTOGAeC6qYRbfwdq2ql17gzJV/IkBJ8c+JeNKxNT5E0CuZdhY2CPRY6EaNiK+JgN5Ptqz3r/1ZHFVIV58dwgnka3BLMr70098NbrczwQjC3E1MEr1nlM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=A1eAOtC3pk2epVyElQaImZ6r7HoGTFqWbmPybf/bh2M=;
 b=hRaMCsgl1CONssp2u+y2Swiz0G6B2sGbT1WDaL54VNS4sock3LJJgsHjsAyS4XjOw/OhTPZGq+F72M8ae6GJX2zh7bycWimGS1DwyB65Ep4KjpHJQmstnHz5cqT+xBx0S4UyEYNTd0LZ3tHVGFPO6jn0+LDIi/+2ZjBkkeGp2Fy9ss1vqdMCqKs4CVSfZV52mxNbZulLQYx76uH3DnkzXaQqlXim4DoD03K+b3IdPR4uK7iiwFEWk3ZG9zuX1yiTzS9CQAS6EISFNWLt4EcZAcJmlYwx1YVzfKIWuREhnJcqCY1eu8RjaO1l9g8b9YzWznyf54PWp6/lXx4hcAoMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1eAOtC3pk2epVyElQaImZ6r7HoGTFqWbmPybf/bh2M=;
 b=Fs7gBpms9ovJ/v2CcKLVo4RvZRYXbN0eQsegsvg72LB61HwRpyZcNknL7/cex4ZJubDGEqJ0mT+XjpBpIEzjDthM9KU8hjFZg1g1sRuM0jFoE9GxOWNCXqYPfQCNsQB5DLVqgqpYxe0d4zV8c4BDKZQuDLXgHxTDMu30lPilJbI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
Thread-Topic: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
Thread-Index: AQHXlPK6hMBa2cV9wU+RB+r01dTauqubssEAgAekNIA=
Date: Tue, 14 Sep 2021 08:13:42 +0000
Message-ID: <9FFB1675-1D02-49E2-A340-AA33A98C50B8@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com>
 <d7da2d5c-fdc0-d72c-789c-c6ba75412f3f@xen.org>
In-Reply-To: <d7da2d5c-fdc0-d72c-789c-c6ba75412f3f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 021fbcd4-6e11-4d1a-e365-08d9775795d1
x-ms-traffictypediagnostic: AM6PR08MB4657:|AM9PR08MB6867:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6867CB56B980DA4A803E93E5FCDA9@AM9PR08MB6867.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w50sxf+uN7q4RKV6X2vuVTq55iVHyiaPEsPBwOZla7O22pT9iBz8CXcteDxMYQYqkmKmronRpFeLYAucCqV3Zn1aUvvNDz4+LX0RFeHqV1RWkEri+rmoP/XIw8Ze2OlKc8G+agOgZgAoXHvoYbyvT/n+aGlMmxuM/5r480dfB28atkMLxVN4yjmHvhmjv8c9ZWGZT6Nnhs1mf5rjn6YboEADT63BACl2i6DFmHpSFUnPPgf+VPDQ5Hsnyb0PwPFSanjrbtO81GMU6dacrH/CO3mS5r04f7L+bP6LDoYj683b5r1Zxd5+SRrnTworL+ciNJgVSGaFEi3LBD4K61089LlHYzHlAo4KfM3FRPbVYh3bjQHA84CSJmKdG/jNhehR+dd9646haRxxvJdnyk0Hfu4uM3BQwzsNdTG+E3vAd6bycsZKQjlVfqxWhPOhd+NiYn7q1hm+4zfKp0EVTocjoSkIJum89T0dWyjOgWWvst/nmI8vYD2GkD/+8046AWKisrrBbwwNFriQs8cYlOuOOtgndP9hGsVOIr4wh7PHour4c6ELpzWA0b078txiKqOtC63yZ9R0/lK2tpoNtlZGOj7aI3eBnccrzn4MkGhBtySjdHHYCkSc54Jat1o8yh7LqKLiTUrKaXT29c2MzbEsZx8VazcTADpXLWufqJaKTS/nT5lHAwwK7W8z07JMai5Qe37qOIir9TBEN1WaIWWeYgdKn4ln0pZduPq0C4yss7SrZLgmMEmKQ6gF1Mg52nP6I4cOfc0I0f51NTnS34jdeuEUkK8EcEyzO4kvTRIwd3VVRxIdmfhDjLWI/dTTme4O7kHGt2qWowDV2CWXkBTeNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(36756003)(33656002)(316002)(86362001)(122000001)(91956017)(38100700002)(64756008)(66556008)(66476007)(4326008)(6916009)(76116006)(66946007)(83380400001)(8676002)(66446008)(38070700005)(6512007)(71200400001)(5660300002)(2906002)(478600001)(6486002)(54906003)(26005)(2616005)(6506007)(53546011)(8936002)(186003)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2A846229AB536429D87080EB32B528E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4657
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f2072a7-9c84-4db0-a98b-08d977579102
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	muhwbhBxZ7n+gnlG0sWyV4WAVN4ujiklXIhN5/qTxXFqxlKYbPG0kLtoYpE2nl4GFnZcCafrKQu5fIbrjohOk9/mxkboe5Eqj1sRQKvfxGckwoGTFSMcxIr/8ros+Frj3nBy7j83u5s8NBeOEXXH3JRTMxFqv6bLi7txeHngpKIu30RuPfNH31w240l5x4iuzFRqFsdrFIMqol4b/f9fPeUWS26LC0NFegWxkiZuE1kCHX6nOFBrQEDIVUBpv+HNkacus20IrV0AIv2tOJLyAf9wsRBOEvQ/egVqmKB/ec6hP1B/pfo8ZDkkmk3zaPvyghOLwC91MvTvp6anVwhbKga78qoB3N5th1w/nRBhzHQfKEUNiJif0IhRZ+Kamf2uYHbme+PHAhkFR7Xr3x+DSOmhCstpmjf3XJJyu2/V8VgCGsZSJJuMYSSLgzQwaMgscgPUdx02kGvXkYoN2xTqiBwrUxBGcOeCupbZLh5EnlKFLrNRyS9hEZk+0V2Hoj5XK3Ipnj1yULQq0G7BeRYeyDzdKvqni14TjvIz5N4pEphg9pSn7nuF1wOpWMRWEqBWcGNTLMdb+0UOEWznsPtvChk/Cm2fsTIQp2yYujPfdzXG4Z+8oOTfQiO1NV/s7uvqV2JUsRSCobJiOXJpjcpcZEeiaBwOVf0c6bv6PWOXq2I+bQ/wjFEWWn/tt9wFXq7ksTm/gleK+lJLic+AUqcS7wv/mK/AroIx7A3rE3Hte+6hIFyJhz1HqiHs11OYkVJch9zaKboAo5nqKpgxKSDYkyREsMo9oJV3Kat7LwLqrrrNn8rz1cH1GWu1xCm+nrco
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(356005)(36756003)(6506007)(82740400003)(5660300002)(81166007)(2906002)(70586007)(2616005)(107886003)(70206006)(6486002)(86362001)(4326008)(47076005)(54906003)(8936002)(316002)(83380400001)(36860700001)(33656002)(26005)(82310400003)(336012)(478600001)(186003)(8676002)(53546011)(6862004)(6512007)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:13:50.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 021fbcd4-6e11-4d1a-e365-08d9775795d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6867

Hi Julien,

> On 9 Sep 2021, at 12:32 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 19/08/2021 13:02, Rahul Singh wrote:
>> Add support for PCI ecam operations to access the PCI
>> configuration space.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/arch/arm/pci/Makefile           |  1 +
>>  xen/arch/arm/pci/ecam.c             | 63 +++++++++++++++++++++++++++++
>>  xen/arch/arm/pci/pci-access.c       | 53 ++++++++++++++++++++++++
>>  xen/arch/arm/pci/pci-host-common.c  | 13 +++++-
>>  xen/arch/arm/pci/pci-host-generic.c |  8 +++-
>>  xen/include/asm-arm/pci.h           | 32 +++++++++++++++
>>  6 files changed, 167 insertions(+), 3 deletions(-)
>>  create mode 100644 xen/arch/arm/pci/ecam.c
>> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
>> index f3d97f859e..6f32fbbe67 100644
>> --- a/xen/arch/arm/pci/Makefile
>> +++ b/xen/arch/arm/pci/Makefile
>> @@ -2,3 +2,4 @@ obj-y +=3D pci.o
>>  obj-y +=3D pci-access.o
>>  obj-y +=3D pci-host-generic.o
>>  obj-y +=3D pci-host-common.o
>> +obj-y +=3D ecam.o
>> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
>> new file mode 100644
>> index 0000000000..91c691b41f
>> --- /dev/null
>> +++ b/xen/arch/arm/pci/ecam.c
>> @@ -0,0 +1,63 @@
>> +/*
>> + * Copyright (C) 2021 Arm Ltd.
>> + *
>> + * Based on Linux drivers/pci/ecam.c
>> + * Copyright 2016 Broadcom
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + */
>> +
>> +#include <xen/pci.h>
>> +#include <xen/sched.h>
>> +
>> +/*
>> + * Function to implement the pci_ops ->map_bus method.
>> + */
>> +void __iomem *pci_ecam_map_bus(struct pci_host_bridge *bridge,
>> +                                      uint32_t sbdf, uint32_t where)
>> +{
>> +    const struct pci_config_window *cfg =3D bridge->sysdata;
>> +    unsigned int devfn_shift =3D cfg->ops->bus_shift - 8;
>> +    void __iomem *base;
>> +
>> +    pci_sbdf_t sbdf_t =3D (pci_sbdf_t) sbdf ;
>=20
> AFAICT, pci_sbdf is an union between a 32-bit and a structure. So please =
don't use the cast and use the 32-bit field to assign the value.
>=20
> Also, there is an extra space before ';'.

Ok. As per your below comment I will remove the sbdf_t completely.
>=20
>=20
>> +    unsigned int busn =3D sbdf_t.bus;
>> +
>> +    if ( busn < cfg->busn_start || busn > cfg->busn_end )
>> +        return NULL;
>> +
>> +    busn -=3D cfg->busn_start;
>> +    base =3D cfg->win + (busn << cfg->ops->bus_shift);
>> +
>> +    return base + (PCI_DEVFN(sbdf_t.dev, sbdf_t.fn) << devfn_shift) + w=
here;
>=20
> How about using PCI_DEVFN2(sbdf)? This would allow you to drop the use of=
 sbdf_t completely (sbdf_t.bus could be replaced with PCI_BUS(sdbf)).
Make sense. I will modify as per your request.
>=20
>> +}
>> +
>> +/* ECAM ops */
>> +const struct pci_ecam_ops pci_generic_ecam_ops =3D {
>> +    .bus_shift  =3D 20,
>> +    .pci_ops    =3D {
>> +        .map_bus                =3D pci_ecam_map_bus,
>> +        .read                   =3D pci_generic_config_read,
>> +        .write                  =3D pci_generic_config_write,
>> +    }
>> +};
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access=
.c
>> index b938047c03..f39f6a3a38 100644
>> --- a/xen/arch/arm/pci/pci-access.c
>> +++ b/xen/arch/arm/pci/pci-access.c
>> @@ -15,6 +15,59 @@
>>   */
>>    #include <xen/pci.h>
>> +#include <asm/io.h>
>> +
>> +int pci_generic_config_read(struct pci_host_bridge *bridge, uint32_t sb=
df,
>> +                            uint32_t reg, uint32_t len, uint32_t *value=
)
>> +{
>> +    void __iomem *addr =3D bridge->ops->map_bus(bridge, sbdf, reg);
>=20
> Please add a newline here.

Ack.=20
>=20
>> +    if (!addr) {
>=20
> You seem to use a mix of Xen and Linux coding style. If the file contains=
 mostly Xen code, then we should use the former.

Ok. I will fix the coding style in next version.
=20
Regards,
Rahul=

