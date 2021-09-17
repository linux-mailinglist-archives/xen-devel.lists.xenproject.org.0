Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93740F36D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 09:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189048.338521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8Tj-0002nB-9m; Fri, 17 Sep 2021 07:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189048.338521; Fri, 17 Sep 2021 07:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8Tj-0002kJ-6V; Fri, 17 Sep 2021 07:40:11 +0000
Received: by outflank-mailman (input) for mailman id 189048;
 Fri, 17 Sep 2021 07:40:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQru=OH=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mR8Th-0002kC-VI
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 07:40:10 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::61a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac878083-cc1e-4427-a44c-b32241627c98;
 Fri, 17 Sep 2021 07:40:07 +0000 (UTC)
Received: from AM6PR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::35) by DB9PR08MB7099.eurprd08.prod.outlook.com
 (2603:10a6:10:2c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Fri, 17 Sep
 2021 07:40:05 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::b4) by AM6PR01CA0058.outlook.office365.com
 (2603:10a6:20b:e0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 07:40:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 07:40:05 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 17 Sep 2021 07:40:04 +0000
Received: from 11b69b236501.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B05E100-9103-4605-88CD-D55B5DF1920F.1; 
 Fri, 17 Sep 2021 07:39:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11b69b236501.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 07:39:58 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6519.eurprd08.prod.outlook.com (2603:10a6:20b:31c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 07:39:55 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 07:39:55 +0000
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
X-Inumbo-ID: ac878083-cc1e-4427-a44c-b32241627c98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv5OmffAvWkQG7PkKxEBmNF/9eeTfmf/uHmr6bM019A=;
 b=oiHo+TW634A13CGCMQAUxH5Erup3Ay1iXAtabMmhjwfB8+ARFjchZwfgW1T//dUfFuB1+ZjmG1SGeno3EU95vH7CDwOei8joVanf+TyxQRhGqbjlDkGIlMrKqPdid56YxanfYOTN83AJmIkzrFBi8nfv3/CMx6tfu9yeFJ9J/zw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ec47c9712987c3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=At9ULBezPCwSTubMekcQgOfeHAqlsuGDLBCYlMSve/GEF7+dhwk1ipQ4lQZd3aKFKdLGHvaXkyH17XWfTU07sUo7X9TzBDfsDKwiXlYzuy5XvaGJ8Xp8uqBQAwhcomnSwmfk9nXg5tWPpEpVJS+5ewmSUhcAjPsQ41sLfhJ5z1F+lI8dRj6+Okr4HdgqrUkt+yC/cncQsG8vLNl72+zvl8JNr2I9q1bvSQBeKtUm3F8R/fVzwcvkzYvN1mkrcjRScGymnxAe3LUPMIDjnnCI5uCkqzRu+Z911Hqwnt8qYzqMPNqKp+EhX+LTNFpclWF6qP78SjhiiuQgWH6ycfBX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zv5OmffAvWkQG7PkKxEBmNF/9eeTfmf/uHmr6bM019A=;
 b=DQGIvuJWGT1VUxzmjuR25iN8C86JO6fHBAgf9STO6bpXhn6uE2buchLlx7iBiVooy9NnaA2OSYFBvM873ADaS/Ifyp9RCdTCDtkuXW/+cWxcn8/VvGKTpJNTwtZAIFU6ksFqZefL+/mdP6n+66yYBiVnyjD1AKV6Qr5A8AXzZSRRYCGsOeXKvubktrSD+SZQ2kExvSgDjccTvB/aZYJ6j7xYHDRSiLh3UHbyAehZUpmLybkzfGtoRF7ZifWMOevttSfGbJS+wstvtAfZry34rYyBzcPP/4LJqkDL2mt4td3rn+lWW0as7sf8tSLsBpx68lCZ7AdNi9gyTyfS5tWl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv5OmffAvWkQG7PkKxEBmNF/9eeTfmf/uHmr6bM019A=;
 b=oiHo+TW634A13CGCMQAUxH5Erup3Ay1iXAtabMmhjwfB8+ARFjchZwfgW1T//dUfFuB1+ZjmG1SGeno3EU95vH7CDwOei8joVanf+TyxQRhGqbjlDkGIlMrKqPdid56YxanfYOTN83AJmIkzrFBi8nfv3/CMx6tfu9yeFJ9J/zw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index:
 AQHXlPLBYGJaUEBt502oB439VJRFraucfJAAgADQqYCABOUXAIAAaPoAgAB9foCABOu6gA==
Date: Fri, 17 Sep 2021 07:39:55 +0000
Message-ID: <C100D81C-16F6-48F3-A069-EEF83D19DEBF@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s>
 <1DB601D4-C446-4102-811C-63EDDE3D2BC5@arm.com>
 <aa251354-3e5f-e1ae-2647-3a112ad5d12e@epam.com>
 <alpine.DEB.2.21.2109131356090.10523@sstabellini-ThinkPad-T480s>
 <f580b6fa-24b4-f50f-7745-a7d4c1420ac0@epam.com>
In-Reply-To: <f580b6fa-24b4-f50f-7745-a7d4c1420ac0@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a1d493f7-c2c4-4706-936a-08d979ae5d9e
x-ms-traffictypediagnostic: AS8PR08MB6519:|DB9PR08MB7099:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB709939741A11109425F606DAFCDD9@DB9PR08MB7099.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dRGbAzRXB3j7/AJ/Jap+wHF9pF5tmd0VPJpEVfv07FDbGjoDlO/NukVB63pz6tXd/KlQ9T6zerlICvwdv7v1o5cjaFewWvGYLuCd7MLjmddCERwrtDg0MOwu8hKXv9Xdo6vwR8EOXmsGdm0m0ebmdQ9UEeeHxm1GQRBkL+IP5EOae5KVCuKRhl/0D83o0uQfQKifcuIWLOT7XPFizBBha1uNWM8kO6gfoYX/QDdH0xkooIL26lOEW6hYVZheOOxR1N0lNhWM4ZCz3sBCn8T9G26FIeeiW5I3ZE79Tlys6YduIPeHaSuyw0swM5KzEeHXqTt8szHH0xFmZphZ2YgIZgR3alssHOVPbsXrZUYgBsbmTUGsPeYgmdMGKxnNgBrBQBSkRWe3YpAdjgBQU/qWnQWzcjONJ+ZIMNmmQeuadAMA3YckZFkl4juc0qQHpbiry9VRiI8cSoybr0j1HJZQsSyyONSQ2U7OaIhnZHSLRusYAXYg/KJApD+K4gBMQHkwU3oouukosbQNifCHvWE0mNcYiuInRXDoc8/clWDR99jVHILibYXMJ8hRVyZOOfN1ZUmGcWQP3UPb4pN+3gqnAPscoy30puNj+7YDro3HNaoMplRM/ExcbKeO1hkpVGZR3cSQd4QcPKI4TmJuYXDB7+Gn86ENLoMD6Jxj5QwtHPi46s8nJxw9n2KdEDjet3pWg16v6xtEIHOe6TpavJ6J4lPI9t0LXHnVieQvfxQ+rm59zk2ww/X/g3DiLYwjR0rD98/eCifC0wZ+zMW2LAEQTVHj9Gjsfh2OhZZO+Xte+JN/fl6pA1G9p9yilRlPQIyEpjV3YESBeLr7liS0Dt8FJsizF72j8YNz2piWPgAE0bFvbXszXAO2DaaWic87hv7T
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(26005)(508600001)(53546011)(6506007)(966005)(36756003)(86362001)(6512007)(122000001)(66556008)(66476007)(64756008)(66946007)(91956017)(76116006)(66446008)(6486002)(2616005)(5660300002)(83380400001)(71200400001)(316002)(38100700002)(6916009)(8936002)(38070700005)(8676002)(4326008)(54906003)(2906002)(33656002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC7928E326470742A77008A2285C5668@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6519
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9dc443a4-36f5-4d66-b841-08d979ae57ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AlWBi7f5VMDfGi1LKK7fq899Vm1XlyLnrgFouPA8lM7/Tcsm3aPFi2pux8Vhj7U2aL0oFmSTWBDubngdWX5A7L3SDcaYhwcdJr0SDi0e+xVsC3YgSlIG8/AlTpuFG76zevc78nljaap6bZ54lMGrP12dbscSBeksv1wcuk3TU+rJtD/A7nbCQxay6ONE6owKZt26oKmIsg0xJLo3ic/4NhFbzZgUh7ffjqOkt/J0H2sClcijC93mrACg2BMACsdaYTyucwAml45G/mBAHFP6a9fF3cMlFfzwBwaZZyC6FAoF2stVh5PvHFocBPKCQ4vH735Ri5XfyBSh6sif/l612Dt1F4BZkBYUlSEe1XfnZRIqhluZOb7f1Puw7dweFU4a0UQfB+sFXM+wcDieQff4u+axETEl1AIFydJn3gC+q7rLx/lfrM1Ut3ehsEF2Sujw3fSRFJ+/UOHUdUnTHQJ7rSRzHFs8iB4r3wC+NJpRB/oUJUUSFz8CbYh+2a+hTTarm0ealBUyle9mNULztMDScvHrBHZ35W6R2koPHPUdXGCDlneN8sIeKodhi6bO6xlQRF+zeTR/DNPtf28lSSEVnWkjrWKSrKFHKSZ7FWX/qgK7bwzuew/tkbu3ywxyea36GS7ySQ3l5ijx6snMr/0ZOGlmJYZ8+3ieqwbJnC0VpjzslZMXAWgvuEAeViOHv9v9FAhh72WGSfhDrBzaY35eFWgG8K2KY3GqwTbugYw4WYPMH3cKDjVfp7toz2OiDNNk3MwgmT4dZ4JjSE/GJrpRI8zsqusTO7OvD7LvPuDW+9hyWfrsGX5BcIee+9YRLDf67BnSs/Bvr5qo8cPAQqqQUUyJ0neeVmwO/h0bPmFdTB4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(6506007)(33656002)(36860700001)(316002)(186003)(6862004)(82310400003)(478600001)(70206006)(36756003)(107886003)(6486002)(82740400003)(4326008)(26005)(70586007)(81166007)(53546011)(86362001)(2616005)(966005)(8936002)(5660300002)(54906003)(2906002)(8676002)(83380400001)(47076005)(336012)(356005)(6512007)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:40:05.0811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d493f7-c2c4-4706-936a-08d979ae5d9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7099

Hi Oleksandr, Stefano,

> On 14 Sep 2021, at 5:31 am, Oleksandr Andrushchenko <Oleksandr_Andrushche=
nko@epam.com> wrote:
>=20
>=20
> On 14.09.21 00:02, Stefano Stabellini wrote:
>> On Mon, 13 Sep 2021, Oleksandr Andrushchenko wrote:
>>> On 10.09.21 15:01, Rahul Singh wrote:
>>>> Hi Stefano,
>>>>=20
>>>>> On 10 Sep 2021, at 12:34 am, Stefano Stabellini <sstabellini@kernel.o=
rg> wrote:
>>>>>=20
>>>>> On Thu, 19 Aug 2021, Rahul Singh wrote:
>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>=20
>>>>>> Add support for Xilinx ZynqMP PCI host controller to map the PCI con=
fig
>>>>>> space to the XEN memory.
>>>>>>=20
>>>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam=
.com>
>>>>>> ---
>>>>>> xen/arch/arm/pci/Makefile          |  1 +
>>>>>> xen/arch/arm/pci/pci-host-zynqmp.c | 59 ++++++++++++++++++++++++++++=
++
>>>>>> 2 files changed, 60 insertions(+)
>>>>>> create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
>>>>>>=20
>>>>>> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
>>>>>> index 6f32fbbe67..1d045ade01 100644
>>>>>> --- a/xen/arch/arm/pci/Makefile
>>>>>> +++ b/xen/arch/arm/pci/Makefile
>>>>>> @@ -3,3 +3,4 @@ obj-y +=3D pci-access.o
>>>>>> obj-y +=3D pci-host-generic.o
>>>>>> obj-y +=3D pci-host-common.o
>>>>>> obj-y +=3D ecam.o
>>>>>> +obj-y +=3D pci-host-zynqmp.o
>>>>>> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/p=
ci-host-zynqmp.c
>>>>>> new file mode 100644
>>>>>> index 0000000000..fe103e3855
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
>>>>>> @@ -0,0 +1,59 @@
>>>>>> +/*
>>>>>> + * Copyright (C) 2020-2021 EPAM Systems
>>>>>> + *
>>>>>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>>>>>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>>>>>> + * Based on xen/arch/arm/pci/pci-host-generic.c
>>>>>> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
>>>>> Only one Copyright line per file is enough :-)
>>>>>=20
>>>>> But actually all the Copyright lines with a name or a company name ar=
e
>>>>> not really required or useful, as the copyright is noted in full deta=
ils
>>>>> in the commit messages (author and signed-off-by lines). I would remo=
ve
>>>>> them all from the new files added by this series.
>>>> Ok. Let me remove in next version.
>>>>>> + * This program is free software; you can redistribute it and/or mo=
dify
>>>>>> + * it under the terms of the GNU General Public License version 2 a=
s
>>>>>> + * published by the Free Software Foundation.
>>>>>> + *
>>>>>> + * This program is distributed in the hope that it will be useful,
>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>>> + * GNU General Public License for more details.
>>>>>> + *
>>>>>> + * You should have received a copy of the GNU General Public Licens=
e
>>>>>> + * along with this program.  If not, see <https://urldefense.com/v3=
/__http://www.gnu.org/licenses/__;!!GF_29dbcQIUBPA!lAdL_CvsuMuuX9ai6cwzm3NY=
iT1vwIIlxGU7nezSqq_nqJk40Zz-kT44LOsemcghJ_3j2CfflQ$ [gnu[.]org]>.
>>>>>> + */
>>>>>> +
>>>>>> +#include <asm/device.h>
>>>>>> +#include <xen/pci.h>
>>>>>> +#include <asm/pci.h>
>>>>>> +
>>>>>> +static const struct dt_device_match gen_pci_dt_match[] =3D {
>>>>>> +    { .compatible =3D "xlnx,nwl-pcie-2.11",
>>>>>> +      .data =3D       &pci_generic_ecam_ops },
>>>>>> +    { },
>>>>>> +};
>>>>>> +
>>>>>> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *=
data)
>>>>>> +{
>>>>>> +    const struct dt_device_match *of_id;
>>>>>> +    const struct pci_ecam_ops *ops;
>>>>>> +
>>>>>> +    of_id =3D dt_match_node(gen_pci_dt_match, dev->dev.of_node);
>>>>> This should be superfluous
>>>> Ack. I will remove the dt_match_node(..) in next version.
>>> I am not entirely sure we need this patch at all as the main reason for=
 its existence
>>>=20
>>> was that we can run Xilinx QEMU for ZCU102. But, the final setup is not=
 going
>>>=20
>>> to be functional as legacy IRQs are not supported and ITS is not a part=
 of ZynqMP.
>>>=20
>>> So, QEMU allows to do a lot with PCI passthrough, but at the end of the=
 day one
>>>=20
>>> won't have it working...
>>>=20
>>> Please consider
>>>=20
>>> If we decide to remove it then
>>>=20
>>> int pci_host_common_probe(struct dt_device_node *dev,
>>>                            const struct pci_ecam_ops *ops,
>>>                            int ecam_reg_idx)
>>>=20
>>> doesn't need the last parameter.
>> With my open source maintainer hat on, I don't see this patch as very
>> important; from that point of view I'd be happy for it to be dropped.
>> However, it would be good to have at least one non-default host bridge
>> (doesn't have to be the Xilinx bridge), otherwise it becomes difficult
>> to understand how the generic infrastructure introduced by this series
>> could be useful.
>>=20
>> Moreover, your recent comment [1] made it even more evident that it
>> would be good to have at least two different drivers to spot
>> compatibility issues between them more easily.
>=20
> Don't take me wrong here ;) I still do use Xilinx QEMU for most of
>=20
> the tests, so it is good for me to have this patch in the tree. But,
>=20
> to be fair, Xilinx QEMU won't give you a possibility to see the fully
>=20
> functional system. This is why I say the patch can be dropped.
>=20
> If we add some words in the commit message about this and have the
>=20
> patch in the tree I'll be more than happy

I will have this patch in my series and I will add more comments about the =
patch.

Regards,
Rahul
>=20
>>=20
>> [1] https://urldefense.com/v3/__https://marc.info/?l=3Dxen-devel&m=3D163=
154474008598__;!!GF_29dbcQIUBPA!lAdL_CvsuMuuX9ai6cwzm3NYiT1vwIIlxGU7nezSqq_=
nqJk40Zz-kT44LOsemcghJ_0bKs6zpA$ [marc[.]info]


