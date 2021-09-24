Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6677417355
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 14:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195365.348037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTkiw-0002Ra-2G; Fri, 24 Sep 2021 12:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195365.348037; Fri, 24 Sep 2021 12:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTkiv-0002Pm-Th; Fri, 24 Sep 2021 12:54:41 +0000
Received: by outflank-mailman (input) for mailman id 195365;
 Fri, 24 Sep 2021 12:54:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wplY=OO=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTkiu-0002Pg-89
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 12:54:40 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93729e38-1d36-11ec-bace-12813bfff9fa;
 Fri, 24 Sep 2021 12:54:38 +0000 (UTC)
Received: from AM5PR0101CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::48) by AM6PR08MB4456.eurprd08.prod.outlook.com
 (2603:10a6:20b:b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 12:54:36 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::e6) by AM5PR0101CA0035.outlook.office365.com
 (2603:10a6:206:16::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 12:54:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 12:54:36 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Fri, 24 Sep 2021 12:54:34 +0000
Received: from 9550938d897d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7CDF5944-6C1B-41B4-A4F6-F38CC7166581.1; 
 Fri, 24 Sep 2021 12:54:22 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9550938d897d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 12:54:22 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4658.eurprd08.prod.outlook.com (2603:10a6:20b:c4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 12:54:21 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 12:54:21 +0000
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
X-Inumbo-ID: 93729e38-1d36-11ec-bace-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GtB33dIgD5zIx9S6HYS1ULvpV3qdRk8yqcQyYGnGnE=;
 b=FMPQeA0ywoIXjBbQWBMwum0M7PySWK32WRKkJvEvrlOhmUTCU0Pvsumpu1jYMYj+4T7+Tl4RZBghz4HNE1vjC0fhAfkWHO5taqFkGSSFCqB8PjzksqLuk2oXyUNvgdpdfbgDAHxIz1t5r8txBkv62vd28q4/WmYi7iDw/8qcjaQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e0f3c23e4870163
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy7eFj6SLavyhKy202AVtE5bMnrwmil8CcKdECzEuFrIjDUfECk+ivKuu/YiRuE4KOzHScJ4mIG5yopNlZ7Lb+R6dXrOgaQuXCQOCbK98UvFg5bfE7N/9LZS08dP5bsIHqw9nQjeRsGBzy61+mBsBKRZZ/g++c8lJpLXiKYLkC/qxE6vwNSjCKQzTYToI9ONfx3DKhwWQKY4lPdK1BB2BD89MFA2d2wqAksp0ORUisStgF+MdVYg7NqKLBxwyYAxvSl0l8fa4CWPorrxllheJIRpFyjVaYSnl3awsrPXODD5x/6iYl99ofjwdPyFDsrpTy2Qgiq4l3KLMuZ+PZcwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9GtB33dIgD5zIx9S6HYS1ULvpV3qdRk8yqcQyYGnGnE=;
 b=UfNf/Zetqy4qo0Hd5W/NScP78uZyAtuW4IEoyXivJNtwHosFjThTigNUMHeT+w/0YEdrS2NLwr60mxjdXEWTtHSfwvUwbbHwCQKQJk+X7xqwb3CX1m8Bn5rQUzAe/nG6YBeFZMyy0prLkM5Ht7Iv5Dn1lVOtY1Gm73TVNxtTth6Ba5esqJAtDF+KpgDPkQRvtsk7Ynovb37rcBM2bWVHjD0c1gxLGPDqqT7EQ3O7nbr4JxGWUXv2wD+F+NfWD6TytB78ZLl8YP4CsGUMNqcAxtW/C9ml7nYL2whHIcRTQAZhuVSNxgG4HmpR8o2NMOI8j5y303IlYiuWDvVZD7u9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GtB33dIgD5zIx9S6HYS1ULvpV3qdRk8yqcQyYGnGnE=;
 b=FMPQeA0ywoIXjBbQWBMwum0M7PySWK32WRKkJvEvrlOhmUTCU0Pvsumpu1jYMYj+4T7+Tl4RZBghz4HNE1vjC0fhAfkWHO5taqFkGSSFCqB8PjzksqLuk2oXyUNvgdpdfbgDAHxIz1t5r8txBkv62vd28q4/WmYi7iDw/8qcjaQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXr6aPsmXcRwLbA0y2fuTM/iBxWauw4OaAgAD7DQCAACKOAIABKMWA
Date: Fri, 24 Sep 2021 12:54:20 +0000
Message-ID: <1E52C080-6913-4009-997D-A9C0988B5A09@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s>
 <F87F4A4E-D6CC-4341-88CF-2DD52A1FD503@arm.com>
 <alpine.DEB.2.21.2109231206120.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231206120.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 122b33e6-29f5-48a0-9335-08d97f5a7678
x-ms-traffictypediagnostic: AM6PR08MB4658:|AM6PR08MB4456:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB44566D84E1FE6E19A453413CFCA49@AM6PR08MB4456.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GVz+ea4oIy4WyeldOF0X1DypdYt6NCpfec4FSCqG3t4q/odvqF8nW8mvt9UFBb9YHkRRaytxHBDUdknTNvBeW0atkOt51fYS+96CyYHqhQuLbil3sJUG5SlGDbNYNwhjjSJsRmB2wvnekkQFf2U+/D7O4HbXtyRx5AUCEMxEAkqZk+vpMtFGTZce8pEeg3G6PiT9qmdNj1meqwmHnIxSu1qQM+Y3HAvRJsxreSKKB/JTnMZpLeErIpFK4vdAeUEC3Jd1yOJBixHf4ZAfoGAuMryG9b0gLcr6c1n2GXbYHDqWB5VcSVxOaadkk9PslCYnBT9Td0eELzK9+3R75/2AcLmRCliY4nITDsrQ+RhM9QqUyrf6hXI3hfE23rLDZ809+n5fwW1eFsreo3ddF8fiGAOczjpjXnfKrbHkgUdQxT5FG+s35WXpoBg/8fRMiw2bBq9qwvTq5lQD9adZx9gkv3aONlVz2k7icMJp6TsGOH2CH4VV5nL1mrSwoOYWYC4ddIbfgn7xfcgf+a72zatKstQQYPvHEiExfyfesWP2qzIlLxee0/zTGGSJlvT0kPCFwjRuzoDbvdcq7+u2KSXv3QsXyMTppyGkWqxIdtWQIlLNo/j5i0mzN78k4rvnd7xQLG9aP3KmU8Bld+Vmd3QcNMC70xpA/NTEo6G56+Y80mqv9Z4gEOg+8aaPPgy6LYyT9UZcgUeYQ3RRDIyOMAI6MNx3Niz5AVJdr6a2ynCNVvdA3b7QP005nbL0z+ID5hnUuL0eQPuNhq4/lbEM2Rxf5eUhDBIzrYMQoI4m13cBdgRJHrR8f75PedXbWVB8O13vYG++qTIbZCYlSIPhMVaw6A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8936002)(33656002)(86362001)(54906003)(6506007)(91956017)(66946007)(36756003)(66476007)(64756008)(66446008)(53546011)(5660300002)(6486002)(6512007)(2616005)(8676002)(26005)(66556008)(966005)(76116006)(122000001)(508600001)(4326008)(38070700005)(38100700002)(71200400001)(6916009)(2906002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E0741153CA8824BA9561541E2F0371A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4658
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59b4fb72-af19-4e36-d539-08d97f5a6d7b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fBmx3ZnKk3qkAfkhNRycpCRHKeM4NIuKxkGPejgyC6D4Y2KR3583l/g0WuY4/4boGdDrJQWwNLV4pLicmfVVnN8wDOXfiPhsFT4LBpNvM4GGdgdvSPAfiLLNyqHZ81r6s2K4zJGRhN3u6ivOr18IXsMl5vI614nIakqWb2gbKLOPOd6idh8ESMHoRfTifQFhmCX/t6BViVLQ2MzO357Hj3bC65VpOVUT4kGKm7wC9za/xaANtQgf12LH9dycpOtEeUSOz+olAjz383UNbWSRgIZUc9YclDHHRwPq6rjhAikOkwknNmYJozqpBc6W+81D9KbdLqzTmfip1lqUP1mP+u9or6gJBeM+NzG6NadV3dLj5CVCFCC6DHy0Q+f8NZBbpc5Fd2csLdDQPty8Wa/Hie03GclZ5By/Na3gJib+7D4iykoeUUszEoyzrPJL9i3/s5wq362LAekE6vLukvpX/A9BDuGkN3r7ClOvpn4h3fmoYoE0Vcy3/OzVojHdrPfATKKWAp1/h+o21xPxPQ/m3QSDpnO6f/lfYDLY8xsr37DH0COyjzCZGFUtILv1if1r8o+wpbexHVqnExljlmRhWYEwLAB8gAuAY31lJ4LjQ2dAF+BnLB3trycD8uln5/VKvruFT+jytZEMbaOsoDdaoIIeDDpaV76eKuVrqtav3sUOjU4aCbRdStquwkGH68vdeiIQPWXhYqy/uH8StKhnLfTOcVhfdBD/FWqnOdW+MOvkJru+vmIrH4nNXLnhNpb5tL8oUJQ/rsgT7keueb7b1wJhQI/X3FXWd9Kv8ylc+lo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(8936002)(47076005)(4326008)(81166007)(36756003)(336012)(6486002)(53546011)(186003)(316002)(356005)(5660300002)(8676002)(26005)(508600001)(70586007)(2906002)(86362001)(54906003)(6512007)(70206006)(33656002)(36860700001)(6862004)(966005)(82310400003)(107886003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 12:54:36.0383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122b33e6-29f5-48a0-9335-08d97f5a7678
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4456

Hi Stefano,

> On 23 Sep 2021, at 8:12 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 23 Sep 2021, Rahul Singh wrote:
>>>> +            goto err_exit;
>>>> +    }
>>>=20
>>> This is unnecessary at the moment, right? Can we get rid of ops->init ?
>>=20
>> No this is required for N1SDP board. Please check below patch.
>> https://gitlab.com/rahsingh/xen-integration/-/commit/6379ba5764df33d5754=
7087cff4ffc078dc515d5
>=20
> OK
>=20
>=20
>>>> +int pci_host_common_probe(struct dt_device_node *dev, const void *dat=
a)
>>>> +{
>>>> +    struct pci_host_bridge *bridge;
>>>> +    struct pci_config_window *cfg;
>>>> +    struct pci_ecam_ops *ops;
>>>> +    const struct dt_device_match *of_id;
>>>> +    int err;
>>>> +
>>>> +    if ( dt_device_for_passthrough(dev) )
>>>> +        return 0;
>>>> +
>>>> +    of_id =3D dt_match_node(dev->dev.of_match_table, dev->dev.of_node=
);
>>>> +    ops =3D (struct pci_ecam_ops *) of_id->data;
>>>=20
>>> Do we really need dt_match_node and dev->dev.of_match_table to get
>>> dt_device_match.data?
>>>=20
>>=20
>>> data is passed as a parameter to pci_host_common_probe, isn't it enough
>>> to do:
>>>=20
>>> ops =3D (struct pci_ecam_ops *) data;
>>=20
>> As of now not required but in future we might need it if we implement ot=
her ecam supported bridge
>>=20
>> static const struct dt_device_match gen_pci_dt_match[] =3D {            =
         =20
>>    { .compatible =3D "pci-host-ecam-generic",                           =
        =20
>>      .data =3D       &pci_generic_ecam_ops },
>>=20
>>    { .compatible =3D "pci-host-cam-generic",
>>      .data =3D &gen_pci_cfg_cam_bus_ops },                              =
  =20
>>=20
>>    { },                                                                 =
      =20
>> };
>=20
> Even if we add another ECAM-supported bridge, the following:
>=20
> ops =3D (struct pci_ecam_ops *) data;
>=20
> could still work, right? The probe function will directly receive as
> parameter the .data pointer. You shouldn't need the indirection via
> dt_match_node?

As per my understanding probe function will not get .data pointer.Probe dat=
a argument is NULL in most of the cases in XEN
Please have a look once dt_pci_init() -> device_init(..) call flow implemen=
tation.

Regards,
Rahul
=20
>=20
> If you are worried about gen_pci_cfg_cam_bus_ops not being a struct
> pci_ecam_ops: that problem can also be solved by making
> gen_pci_cfg_cam_bus_ops a struct containinig a struct pci_ecam_ops.


