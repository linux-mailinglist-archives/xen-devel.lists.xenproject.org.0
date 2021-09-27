Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F64198CF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 18:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197098.350043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUtNf-0001jJ-W3; Mon, 27 Sep 2021 16:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197098.350043; Mon, 27 Sep 2021 16:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUtNf-0001gn-Rk; Mon, 27 Sep 2021 16:21:27 +0000
Received: by outflank-mailman (input) for mailman id 197098;
 Mon, 27 Sep 2021 16:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhJ=OR=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mUtNe-0001gh-He
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 16:21:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4e32f3c-1fae-11ec-bc53-12813bfff9fa;
 Mon, 27 Sep 2021 16:21:24 +0000 (UTC)
Received: from DB6PR07CA0161.eurprd07.prod.outlook.com (2603:10a6:6:43::15) by
 AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Mon, 27 Sep 2021 16:21:12 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::b1) by DB6PR07CA0161.outlook.office365.com
 (2603:10a6:6:43::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Mon, 27 Sep 2021 16:21:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 16:21:12 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Mon, 27 Sep 2021 16:21:11 +0000
Received: from 788ae38cee15.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27B243E0-372B-49F7-9233-4ABC01622023.1; 
 Mon, 27 Sep 2021 16:20:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 788ae38cee15.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 16:20:57 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1745.eurprd08.prod.outlook.com (2603:10a6:203:3a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 16:20:54 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 16:20:53 +0000
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
X-Inumbo-ID: f4e32f3c-1fae-11ec-bc53-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaMylyagjMBBWy5Z3AyOT51E7F76IMhGQYfHVy7jJIo=;
 b=IziVwc9wMlmIPUOPpRWyNq3S6kDIIlo1gqMAmPR4O+r+oEqguF3twLFz31ffwJ/jU8ic7X6piPyLVOAGquvJWCPcOb51sLxgFB/zQeZfg6VwFUoxA3e0yzXm/n9YCjP1am63NqKMFFStAmpghZRY2/vz8a8+KJNxLuPh66SVGUU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11cc5260630cd775
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWBS64EJvKlfS61dc7HsfQB8KFqVFo9AD+3u3f88uLj3WYlwKX1Lu1gFFPch/nxryREnl2ALvGYuHMUS/UKTrgT3pM4FKlAgiuonWX4vCFxOGzEYXOiUCf4TWLCddfqYAzhPfey1yLAbjS3794oA5PW6netw+TySEHoW7AIVhBC+CYJni3Cju6udNHIrerlDI31LGQzWC7+qHUps9M3ZOBmYtLDDR6HzEKF14EEJ/oh5pNNvUxDfPISjI4KWA6J7U6I0okLGorcYVEBg058L31TujAG2P53He6GaDQ9y4CbfIAEGMLyvP1qanNycr2zDi3HCuk1LO92UXvvxyy6oFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FaMylyagjMBBWy5Z3AyOT51E7F76IMhGQYfHVy7jJIo=;
 b=U3cwxv1s9rLoZV1XhvslQcMe2sqxF7y8Fks4v5Hga36j7YO71747NMf0F6F6/EV7ou5f4kmVQpBDUuH5u2bqVXjo4bLKqetUZgBApvuPrlOQ3PpV+2mPD9lO5HtmgWNA4vb8RCZPq+9NSYkB/Fd4Wj02sBQEdTbRxeHumpJBKQYLUUVA9B3TdkCkYh+ts88+vtxYzqIwzdnUERBDSAX3hFfRGwnQA00ESjUnvTgCEs4PhfskiDDyvx5VWob92d1TDX+IJ/HA49ba3laOTK1vTUW/49gbSy8qiZDI3VEGtXqm2KrumDuExLdFc49irYvP+EBZ3Vc1qFPYyKBDoE6YSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaMylyagjMBBWy5Z3AyOT51E7F76IMhGQYfHVy7jJIo=;
 b=IziVwc9wMlmIPUOPpRWyNq3S6kDIIlo1gqMAmPR4O+r+oEqguF3twLFz31ffwJ/jU8ic7X6piPyLVOAGquvJWCPcOb51sLxgFB/zQeZfg6VwFUoxA3e0yzXm/n9YCjP1am63NqKMFFStAmpghZRY2/vz8a8+KJNxLuPh66SVGUU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index:
 AQHXr6aPsmXcRwLbA0y2fuTM/iBxWauw4OaAgAD7DQCAACKOAIABKMWAgACTbwCAAB1PAIAEP/YA
Date: Mon, 27 Sep 2021 16:20:53 +0000
Message-ID: <AEC72EBB-90D9-41F8-A67E-661F229F356C@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s>
 <F87F4A4E-D6CC-4341-88CF-2DD52A1FD503@arm.com>
 <alpine.DEB.2.21.2109231206120.17979@sstabellini-ThinkPad-T480s>
 <1E52C080-6913-4009-997D-A9C0988B5A09@arm.com>
 <alpine.DEB.2.21.2109241422170.17979@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109241619270.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241619270.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb030c7-c90f-46d0-a82d-08d981d2d262
x-ms-traffictypediagnostic: AM5PR0801MB1745:|AS8PR08MB6168:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6168E2F5AFD780EFE9FFA2C9FCA79@AS8PR08MB6168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JlGdSPeROV9ty6kREBP/v3cJvubdyT6/t7cXlkYRaflUAfbc03eZ1sRHGcYSFZwxlV6GU6yoo88XmIvGgF0pIjbHcLnR48ndR3Yp3XXGPSGrvYc+okZAzBtfOGE+AnWHCmjui22AffGWacWbZ3W6QxWpKMPYAORgmQy9gF+uVd5tsE1Q3DGG39yQNP3nGT5HtAycOZ3N2RRzBxNOluLipfhadnRuIFRzsG2OqTPDkkfaV8prf+q8bfaUf6i5vNjXzE/tWV9Zq7sspWM6ssuL2a1MVPoL/0i0DLJu0iuboZQnbogO5u0XLGHwmIBh7f82V1IcZWWgcz1++JWJaI1s8yjDCsAuY9hJgnPVxRKKrxK++X+xEdBd5Z+6v9LdQClt0CDLXNtAc2i3vY6Ys6tUMxBnLo/2koJBI8Mad5259XXxc2OKJkwAtCApEaAVAycyZxjOR/hnp+QVDTbMvxBSrt3huZaydgb3jZohJZW0FlAq3+t0Nxity+s4l0iUo2xhb5ezaOF+8GDSU3VM/+0Z8DfRMKLys7f75YX4q8hP1NSFt9ocqvk+GLo+pgEm2TRB2R27y/a4ZmhHGAWVUIzO8W2V9AKGKYOmb5jcb3bXe7/wnPzmjo+CPmgFAiMhdSRQDmb++2Zc0YWFRkvO56ICWyGbKdCG0pvv966XWBNg4TweRCLbUBHeoQOBC7LD6Z0hYezwqMRZPY3bzFJG9lyGH3p6GSnB4BkPv8z9O1yWfpeEEADh99xwVXJ/58Fx4VesKz7a276qcfFepSWylB8HCqeh+zUq4a65KsMuRuOQghtz5jVSP+CNiIgf2SLZdqQb6ur1TjPa7x4eGaDg8xO5Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(2906002)(6486002)(66556008)(5660300002)(66446008)(66476007)(508600001)(86362001)(71200400001)(76116006)(316002)(6506007)(186003)(64756008)(66946007)(38070700005)(4326008)(6512007)(38100700002)(122000001)(6916009)(36756003)(54906003)(26005)(53546011)(8936002)(966005)(33656002)(8676002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <567123CCE58923469B71580E4F538D86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1745
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd12ada9-523a-4cfd-3d4e-08d981d2c774
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UlS9NdyIN1dWAG9v2GZ1q3qbBkW+VOdM+WqPBvz5wnMNxAdRj31Y1TAGCP5e1s6U8nCiR08x2Zks0HqsZHKsVfUWqmwPUgYksa8gS4bg3wPfv74QhPQy//tbXDajQYep76LT3Nf6YTS26xr4RqQKdEsnasaZueBIgMfVkRS08c29m/3lgL+xnoV7H+mqEZDzj3bl6SvSXtNTVQDne+xE+Y2tfCmltMVNZPKqdkkFGtEY/erD4udaldry6BSqmqpeqOuTRzvmwU/8MQUksXUJimpb+bx9YkLV0LGCKbCDW/OxFmoKsg3rYPsztrHvaK/+su6z7qJswsG9H5wShXWArlf8CNoctNrwVcugjrhM2+BmoZfIJQjhHt7dhQWEQFN6+TsfnnnQR6LmNvWGxMa4GWhfrKsJP2Y9cfaaDkqZNwKLK9j7Rlbd//eQvYwXax10YwsjFxiMBS2o2LxZIH7oX8AapvQ0j/4UqbgMBvjdzTilmIpnUMtglBsq5kGZghwSPiN1Ebk5sNKjSElI6PRPo6RaF3FGePZizl4zlA34BAAkuy3Yw9Vxsf4hMAkmk5Z49OcnF7gIhNwaG2vERmdPIXts0SGznet+ZhII6HuBrSAHMChrjGQ53VZNsRISXhAMjohf1OkvVKxh3Zwc1bD2m4dLxLCBBJ84ZWH6dtG8HetTDh/jUnKESp1NSs9ONjTGvsWPhYemxEn9rsvUmFIJ7u8Amraju6BNA0mkpWubq2G0VL0YKDlNnCxkk+UYT2ngHjuPC0CEfQpHrzgx4uRu66TyRGbEzdyGzx9AcRUXECE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(6486002)(2616005)(53546011)(6862004)(26005)(5660300002)(70586007)(186003)(316002)(70206006)(36860700001)(8676002)(33656002)(6506007)(8936002)(336012)(36756003)(966005)(4326008)(107886003)(86362001)(6512007)(54906003)(82310400003)(2906002)(81166007)(356005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 16:21:12.2352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb030c7-c90f-46d0-a82d-08d981d2d262
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168

Hi Stefano,

> On 25 Sep 2021, at 12:26 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Fri, 24 Sep 2021, Stefano Stabellini wrote:
>> On Fri, 24 Sep 2021, Rahul Singh wrote:
>>> Hi Stefano,
>>>=20
>>>> On 23 Sep 2021, at 8:12 pm, Stefano Stabellini <sstabellini@kernel.org=
> wrote:
>>>>=20
>>>> On Thu, 23 Sep 2021, Rahul Singh wrote:
>>>>>>> +            goto err_exit;
>>>>>>> +    }
>>>>>>=20
>>>>>> This is unnecessary at the moment, right? Can we get rid of ops->ini=
t ?
>>>>>=20
>>>>> No this is required for N1SDP board. Please check below patch.
>>>>> https://gitlab.com/rahsingh/xen-integration/-/commit/6379ba5764df33d5=
7547087cff4ffc078dc515d5
>>>>=20
>>>> OK
>>>>=20
>>>>=20
>>>>>>> +int pci_host_common_probe(struct dt_device_node *dev, const void *=
data)
>>>>>>> +{
>>>>>>> +    struct pci_host_bridge *bridge;
>>>>>>> +    struct pci_config_window *cfg;
>>>>>>> +    struct pci_ecam_ops *ops;
>>>>>>> +    const struct dt_device_match *of_id;
>>>>>>> +    int err;
>>>>>>> +
>>>>>>> +    if ( dt_device_for_passthrough(dev) )
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    of_id =3D dt_match_node(dev->dev.of_match_table, dev->dev.of_n=
ode);
>>>>>>> +    ops =3D (struct pci_ecam_ops *) of_id->data;
>>>>>>=20
>>>>>> Do we really need dt_match_node and dev->dev.of_match_table to get
>>>>>> dt_device_match.data?
>>>>>>=20
>>>>>=20
>>>>>> data is passed as a parameter to pci_host_common_probe, isn't it eno=
ugh
>>>>>> to do:
>>>>>>=20
>>>>>> ops =3D (struct pci_ecam_ops *) data;
>>>>>=20
>>>>> As of now not required but in future we might need it if we implement=
 other ecam supported bridge
>>>>>=20
>>>>> static const struct dt_device_match gen_pci_dt_match[] =3D {         =
            =20
>>>>>   { .compatible =3D "pci-host-ecam-generic",                         =
          =20
>>>>>     .data =3D       &pci_generic_ecam_ops },
>>>>>=20
>>>>>   { .compatible =3D "pci-host-cam-generic",
>>>>>     .data =3D &gen_pci_cfg_cam_bus_ops },                            =
    =20
>>>>>=20
>>>>>   { },                                                               =
        =20
>>>>> };
>>>>=20
>>>> Even if we add another ECAM-supported bridge, the following:
>>>>=20
>>>> ops =3D (struct pci_ecam_ops *) data;
>>>>=20
>>>> could still work, right? The probe function will directly receive as
>>>> parameter the .data pointer. You shouldn't need the indirection via
>>>> dt_match_node?
>>>=20
>>> As per my understanding probe function will not get .data pointer.Probe=
 data argument is NULL in most of the cases in XEN
>>> Please have a look once dt_pci_init() -> device_init(..) call flow impl=
ementation.
>>=20
>> You are right. Looking at the code, nobody is currently using
>> dt_device_match.data and it is clear why: it is not passed to the
>> device_desc.init function at all. As it is today, it is basically
>> useless.
>>=20
>> And there is only one case where device_init has a non-NULL data
>> parameter and it is in xen/drivers/char/arm-uart.c. All the others are
>> not even using the data parameter of device_init.
>>=20
>> I think we need to change device_init so that dt_device_match.data can
>> be useful. Sorry for the scope-creep but I think we should do the
>> following:
>>=20
>> - do not add of_match_table to struct device
>>=20
>> - add one more parameter to device_desc.init:
>>  int (*init)(struct dt_device_node *dev, struct device_desc *desc, const=
 void *data);
>>=20
>> - change device_init to call desc->init with the right parameters:
>>  desc->init(dev, desc, data);
>>=20
>> This way pci_host_common_probe is just going to get a desc directly as
>> parameter. I think it would make a lot more sense from an interface
>> perspective. It does require a change in all the DT_DEVICE_START.init
>> functions adding a struct device_desc *desc parameter, but it should be
>> a mechanical change.
>>=20
>> Alternatively we could just change device_init to pass
>> device_desc.dt_match.data when the data parameter is NULL but it feels
>> like a hack.
>>=20
>>=20
>> What do you think?
>=20
>=20
> Another idea that doesn't require a device_desc.init change and also
> doesn't require a change to struct device is the following:
>=20
>=20
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index a88f20175e..1aa0ef4c1e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -205,8 +205,7 @@ int pci_host_common_probe(struct dt_device_node *dev,=
 const void *data)
>     if ( dt_device_for_passthrough(dev) )
>         return 0;
>=20
> -    of_id =3D dt_match_node(dev->dev.of_match_table, dev->dev.of_node);
> -    ops =3D (struct pci_ecam_ops *) of_id->data;
> +    ops =3D (struct pci_ecam_ops *) data;
>=20
>     bridge =3D pci_alloc_host_bridge();
>     if ( !bridge )
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-h=
ost-generic.c
> index 6b3288d6f3..66fb843f49 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -20,15 +20,19 @@
> #include <asm/pci.h>
>=20
> static const struct dt_device_match gen_pci_dt_match[] =3D {
> -    { .compatible =3D "pci-host-ecam-generic",
> -      .data =3D       &pci_generic_ecam_ops },
> -
> +    { .compatible =3D "pci-host-ecam-generic" },
>     { },
> };
>=20
> +static int pci_host_generic_probe(struct dt_device_node *dev,
> +                                         const void *data)
> +{
> +    return pci_host_common_probe(dev, &pci_generic_ecam_ops);
> +}
> +
> DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
> .dt_match =3D gen_pci_dt_match,
> -.init =3D pci_host_common_probe,
> +.init =3D pci_host_generic_probe,
> DT_DEVICE_END
>=20
> /*

I also think this is good idea to avoid modification for device_init(.) and=
 struct device{} .
I will use this patch in next version.

Regards,
Rahul


