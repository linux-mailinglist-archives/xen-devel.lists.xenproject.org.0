Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5F40CAE2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 18:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187824.336820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQXzc-0000eD-5T; Wed, 15 Sep 2021 16:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187824.336820; Wed, 15 Sep 2021 16:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQXzc-0000bl-1n; Wed, 15 Sep 2021 16:42:40 +0000
Received: by outflank-mailman (input) for mailman id 187824;
 Wed, 15 Sep 2021 16:42:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LStB=OF=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQXza-0000bf-HB
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 16:42:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 839667b1-c68d-4c79-971b-80b0844fc646;
 Wed, 15 Sep 2021 16:42:35 +0000 (UTC)
Received: from DB6PR07CA0014.eurprd07.prod.outlook.com (2603:10a6:6:2d::24) by
 VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 16:42:25 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::bc) by DB6PR07CA0014.outlook.office365.com
 (2603:10a6:6:2d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9 via Frontend
 Transport; Wed, 15 Sep 2021 16:42:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 15 Sep 2021 16:42:24 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Wed, 15 Sep 2021 16:42:24 +0000
Received: from 9b4b76d4de04.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75EEBD51-898B-4586-86D4-15F922DD89C2.1; 
 Wed, 15 Sep 2021 16:42:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b4b76d4de04.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Sep 2021 16:42:14 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4181.eurprd08.prod.outlook.com (2603:10a6:20b:ad::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 16:42:03 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 16:42:03 +0000
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
X-Inumbo-ID: 839667b1-c68d-4c79-971b-80b0844fc646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxhRmcR5JJUyjWh/8bUvn6442z4LPKazDKZWSrpxOCc=;
 b=Ice+wrHQEqMEiWn5V5I42GZGi157MsHuKFT2iT3iSDZaZTW/DYKa7F2fHUe6TU/+SY8uEc6+vaxg5MvLJEQwGKiIfn/T0qxmqZJIwCKd5MxxF4SvAPq5d0ohPXvJc6WJTNsYwiz6QMWxWrGUZifFNl0/i2CCWoclAy0KjKIDAY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60c57de651d18c16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XooCQd6H5qSSy987/LRUULqipw7VgDKYiHdoFfnY22R2x6LHegAHYNlKgeWNpHRUa+c3K9mIpRo2qc3Nb1Y6dV/GptgpFL3IAriajTGYSfS1sHGjc5sskwXG7lgDg58IXaMl7kd4rAp35E4hhXdjSmOuSKrnvZ0c/QWq0KBxkRLOfmmsRiGZLGrPWiwuBBnoRXRT2oEyvGTF/uYhneVFcEP+zkMynbEH5pXAo1FKUbA1KKhf4CyiWsKmtmDxUfWbDRNxfZ7goP3VMDXGwZ06+LR/VtByYPYWsomggq9PlDrcpAWUtc6JfmYyh0HvIH8O2EgHwO+d9Tf+Dz0zyMyytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZxhRmcR5JJUyjWh/8bUvn6442z4LPKazDKZWSrpxOCc=;
 b=RjK+RKlV7W2SVJ8Sj/uayJkK3APikfdGSYqtYJhghW7Fp9/kWSdPrezbQI3IuFofUizDIut8y7IhWRfPS1uREm2IOYN0rg3LU9xMg6MqbMgvPQq745RIUCZsHgKfAQIw7jnAtQY09FaRCvQHUAekTB0tJ60ZUDxGQGVvhD7S15UqwTTCTznVDfr9xzK4wfWVmQh5ZxAobbqcniDInrxb5gpb9QlU1/0+MooU+WeywhiVQFBDbv1Auh27QDYYQQQBWcHIwgyyLN0fMNVEKShCtTUtGthTv7u4DyMv3NsWJpDMD242uHMowYIlpO8SgtJcp8/J3/zc6PRuHCP4pYtInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxhRmcR5JJUyjWh/8bUvn6442z4LPKazDKZWSrpxOCc=;
 b=Ice+wrHQEqMEiWn5V5I42GZGi157MsHuKFT2iT3iSDZaZTW/DYKa7F2fHUe6TU/+SY8uEc6+vaxg5MvLJEQwGKiIfn/T0qxmqZJIwCKd5MxxF4SvAPq5d0ohPXvJc6WJTNsYwiz6QMWxWrGUZifFNl0/i2CCWoclAy0KjKIDAY0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien.grall.oss@gmail.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index:
 AQHXoJ53JNtXRAJCBkuwB/fHai0QiKucB06AgAE4wgCAAAtQgIAADDiAgAARZwCAAFsJAIAAFA4AgAO3egCAAc7YgIAA860AgABTwQCAALojgA==
Date: Wed, 15 Sep 2021 16:42:02 +0000
Message-ID: <5AFD57E4-1C4B-4781-ADAC-BA3C4AC2E2D1@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <684b3534-40eb-add7-f46e-c6258904757b@xen.org>
 <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com>
 <3ecfc742-b720-0381-dbd8-7147615494c8@epam.com>
 <1e71ebba-b2d3-1201-05ac-e035f182226f@epam.com>
 <alpine.DEB.2.21.2109141731410.21985@sstabellini-ThinkPad-T480s>
 <ee38bc53-c590-24d2-9061-3d4fd33f58bd@epam.com>
In-Reply-To: <ee38bc53-c590-24d2-9061-3d4fd33f58bd@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 49da10d1-ad6e-46ac-5fdd-08d97867cc03
x-ms-traffictypediagnostic: AM6PR08MB4181:|VE1PR08MB5215:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB521548CF32594DFD71512E68FCDB9@VE1PR08MB5215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NlxyQFf6csXoAqJkProLpb9XxdJqhQikgf7AUja7PmGPp39Hh0qRzAqP+VKR1Qy1XPPSErfmJrdM3R+1ah9tpGtBcAeahSfZfHr4OIbpMTQeSn1raUTn6DkqrjuR4RTjZeX3SUjX5Jwt4O9S7Xot0H+LSgmmt7zeJAZw2nCxzpt93dhroqOO4MWo+BZgC+3AjtVRBvNKYpV3mEQPsnDEWPLnoz1o/fSsm3/CKgXxp4haLbLM3ZrQSmE1/+p8Eg5VqVo/KpYEyUtuqpYAzgiS05j+LkOL8pW9/r6t8vX5Lq5CPmscdG1PMgJreEryidfjudMH1R6zJt1gPwQdH+t7m6HHJLvSy2YAMDj4//52HfeTXS9jpBUoSxAZo1HiJ1fTMk6onaA8aATWtm0YSOrzx8SRMNNYn6n3GkFgT/yt9vY98f7pAKm91bQq7ux2I/WGoMHd0azsX1ENlA+qTV3g7y7+Z8WOF2qMR68v+9FUX8Y0dvBNTFH69Zti7cTa9rx4y3WlPWT47o3k4+/DPsVC7MhuCGqCY4CPsocae+BahQrsbEMKwkX5q821fbgKkh7MrrMiTyo+DPai98HcAvJmAHcxVHNFCBihXAFCvzrqJr7jw7GvHtKJgAWk+aNVGFL5O7WYGFLw9aSLqfRurowNI/lRa8a4rpszURjVdOv/zLPBX/XEyNQ1LncAFAo7wxJYD5pZHDYs5xFhN8PAEYy7AqmHOOPsuT+/14XFqc6Xzg9Mh71llVf2K+1EKwh3GcKo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(64756008)(2616005)(508600001)(71200400001)(66446008)(66946007)(66556008)(66476007)(6916009)(122000001)(316002)(4326008)(2906002)(6486002)(36756003)(54906003)(6512007)(38100700002)(5660300002)(76116006)(33656002)(8936002)(91956017)(8676002)(186003)(26005)(6506007)(53546011)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <08953BF16169FF4CA68C28DC034218C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4181
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c09dd4e8-678a-4ba7-cfaa-08d97867bf02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zICcguju0H4mr4nuZneEzQfv58J95Qc7tI5VrOzryinvKud/ZFkuD6uCyn8uELcvwmHhoh9VHwjPrM1AkxmsOkKBEex+jG8k1Rfjf2EGEfMfMQ0rJ1SogbDsrmRkdR92RkoCQH3HivNq7S+UpeGj0GuLkm86yTkzaa92G7S+8pBHZwQpHvZ4nMv7XSlocpWIrRiy75pXIo+Yzyy7oc3GoJuH9v4hnErIZ5p81EqV465a5Avg2rvJrm/VGM5lKXYXwPDKkTBocJEI/JXjSArrToVrPCPOuKNq6t9a39ZjZUMP34NtpTrOFPqAeBDxNsa19QH964S91YjNz+4Pvi6evuxr7JuWDrxZo14McnDaCSJm68Tvf4PPL/VTeFp2mdouxyVCW3ArOyKzN+NluRV893dg9QGW7mFGrbobi8rVKCuxAGScoLXxj4cm/c9CwbcgbnYdKQ/r4UtBFTa15S/nVhUPIXJJUOf6zej+vzYVUi4OjqI5VxD+wcUzOFl7iqUfKLAVCqfTu0Gnxmz7TDlEblGV3SpMRTlW1G6HCDNvUPhl2lTeOC4+NkiFFuDOwy3g0bcUpcnLtqo7rkI/3TX6LMZ3b8ElAQ7ODHDNELTDGFbowa0Lyg95XKg8qUrzWgH5nbqG3T+6JQmJ8tSsfOgwvmV8J3/sHKIjh6bz9BETV1Z/9qRAGr0zGjMKDuOOnGShiHo6+W8vHL7ckJj5jTsFlg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(53546011)(36860700001)(6506007)(70586007)(2906002)(6862004)(47076005)(86362001)(70206006)(82310400003)(83380400001)(81166007)(336012)(33656002)(2616005)(26005)(5660300002)(316002)(8936002)(54906003)(6512007)(6486002)(8676002)(4326008)(356005)(508600001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 16:42:24.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49da10d1-ad6e-46ac-5fdd-08d97867cc03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5215

Hi Oleksandr,

> On 15 Sep 2021, at 6:35 am, Oleksandr Andrushchenko <Oleksandr_Andrushche=
nko@epam.com> wrote:
>=20
> Hi, Stefano, Rahul!
>=20
> On 15.09.21 03:36, Stefano Stabellini wrote:
>> On Tue, 14 Sep 2021, Oleksandr Andrushchenko wrote:
>>> With the patch above I have the following log in Domain-0:
>>>=20
>>> generic-armv8-xt-dom0 login: root
>>> root@generic-armv8-xt-dom0:~# (XEN) *** Serial input to Xen (type 'CTRL=
-a' three times to switch input)
>>> (XEN) =3D=3D=3D=3D PCI devices =3D=3D=3D=3D
>>> (XEN) =3D=3D=3D=3D segment 0000 =3D=3D=3D=3D
>>> (XEN) 0000:03:00.0 - d0 - node -1
>>> (XEN) 0000:02:02.0 - d0 - node -1
>>> (XEN) 0000:02:01.0 - d0 - node -1
>>> (XEN) 0000:02:00.0 - d0 - node -1
>>> (XEN) 0000:01:00.0 - d0 - node -1
>>> (XEN) 0000:00:00.0 - d0 - node -1
>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch inp=
ut)
>>>=20
>>> root@generic-armv8-xt-dom0:~# modprobe e1000e
>>> [   46.104729] e1000e: Intel(R) PRO/1000 Network Driver
>>> [   46.105479] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>>> [   46.107297] e1000e 0000:03:00.0: enabling device (0000 -> 0002)
>>> (XEN) map [e0000, e001f] -> 0xe0000 for d0
>>> (XEN) map [e0020, e003f] -> 0xe0020 for d0
>>> [   46.178513] e1000e 0000:03:00.0: Interrupt Throttling Rate (ints/sec=
) set to dynamic conservative mode
>>> [   46.189668] pci_msi_setup_msi_irqs
>>> [   46.191016] nwl_compose_msi_msg msg at fe440000
>>> (XEN) traps.c:2014:d0v0 HSR=3D0x00000093810047 pc=3D0xffff8000104b4b00 =
gva=3D0xffff800010fa5000 gpa=3D0x000000e0040000
>>> [   46.200455] Unhandled fault at 0xffff800010fa5000
>>>=20
>>> [snip]
>>>=20
>>> [   46.233079] Call trace:
>>> [   46.233559]  __pci_write_msi_msg+0x70/0x180
>>> [   46.234149]  pci_msi_domain_write_msg+0x28/0x30
>>> [   46.234869]  msi_domain_activate+0x5c/0x88
>>>=20
>>>  From the above you can see that BARs are mapped for Domain-0 now
>>>=20
>>> only when an assigned PCI device gets enabled in Domain-0.
>>>=20
>>> Another thing to note is that we crash on MSI-X access as BARs are mapp=
ed
>>>=20
>>> to the domain while enabling memory decoding in the COMMAND register,
>>>=20
>>> but MSI-X are handled differently, e.g. we have MSI-X holes in the mapp=
ings.
>>>=20
>>> This is because before this change the whole PCI aperture was mapped in=
to
>>>=20
>>> Domain-0 and it is not. Thus, MSI-X holes are left unmapped now and the=
re
>>>=20
>>> was no need to do so, e.g. they were always mapped into Domain-0 and
>>>=20
>>> emulated for guests.
>>>=20
>>> Please note that one cannot use xl pci-attach in this case to attach th=
e PCI device
>>>=20
>>> in question to Domain-0 as (please see the log) that device is already =
attached.
>>>=20
>>> Neither it can be detached and re-attached. So, without mapping MSI-X h=
oles for
>>>=20
>>> Domain-0 the device becomes unusable in Domain-0. At the same time the =
device
>>>=20
>>> can be successfully passed to DomU.
>>>=20
>>>=20
>>> Julien, Stefano! Please let me know how can we proceed with this.
>> What was the plan for MSI-X in Dom0?
> It just worked because we mapped everything
>>=20
>> Given that Dom0 interacts with a virtual-ITS and virtual-GIC rather than
>> a physical-ITS and physical-GIC, I imagine that it wasn't correct for
>> Dom0 to write to the real MSI-X table directly?
>>=20
>> Shouldn't Dom0 get emulated MSI-X tables like any DomU?
>>=20
>> Otherwise, if Dom0 is expected to have the real MSI-X tables mapped, the=
n
>> I would suggest to map them at the same time as the BARs. But I am
>> thinking that Dom0 should get emulated MSI-X tables, not physical MSI-X
>> tables.
>=20
> Yes, it seems more than reasonable to enable emulation for Domain-0
>=20
> as well. Other than that, Stefano, do you think we are good to go with
>=20
> the changes I did in order to unmap everything for Domain-0?
>=20
> Rahul, it seems we will need a change to vPCI/MSI-X so we can also
>=20
> trap Domain-0 for MSI-X tables.

I agree that we need emulated MSI-X tables for Dom0 also. Let me check on t=
his and come back to you.

Regards,
Rahul
>=20
> Thank you,
>=20
> Oleksandr


