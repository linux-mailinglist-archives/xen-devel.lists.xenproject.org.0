Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A1402270
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 05:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180341.326949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNRdV-0002y9-4D; Tue, 07 Sep 2021 03:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180341.326949; Tue, 07 Sep 2021 03:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNRdV-0002ul-15; Tue, 07 Sep 2021 03:19:01 +0000
Received: by outflank-mailman (input) for mailman id 180341;
 Tue, 07 Sep 2021 03:18:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNGS=N5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNRdT-0002uf-1v
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 03:18:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fd35b04-a34b-4e54-a5a4-7a4df8557624;
 Tue, 07 Sep 2021 03:18:56 +0000 (UTC)
Received: from AM6P192CA0105.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::46)
 by VI1PR0802MB2445.eurprd08.prod.outlook.com (2603:10a6:800:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 03:18:49 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::bf) by AM6P192CA0105.outlook.office365.com
 (2603:10a6:209:8d::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 03:18:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 03:18:49 +0000
Received: ("Tessian outbound cc1d52552731:v105");
 Tue, 07 Sep 2021 03:18:48 +0000
Received: from 3016fb1a370b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AEB6A185-06C1-4A94-A51E-75245AE3AD0B.1; 
 Tue, 07 Sep 2021 03:18:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3016fb1a370b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 03:18:38 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4173.eurprd08.prod.outlook.com (2603:10a6:803:e8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 03:18:29 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 03:18:29 +0000
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
X-Inumbo-ID: 0fd35b04-a34b-4e54-a5a4-7a4df8557624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAutKulNSqbSaQcjB/rY66Exbgv3sh5ur6/FakAOZtA=;
 b=b7wZ/vhM196EVRBtO4mY2nJLhxrmiYdDZalLfeItQXXrd/ZQVnCd18Iyz3BhkU+FwG5VRHtF7t5i3u8E1RrajnxoR/0QmnnT8JWk0vlyf2VfxCFL/eFkhWDl/FnpsUsvECT0OijLAorXfvhdSm7WTUIHvuPt/diptz4WrMnEMQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flJU45vtVZWsrH3V/GSEaDRg8d2nZ8E0Fz4+b45WeddQQccdg7RBGaD3v0JLizRhN4d7E8TeHqFoehEdZ2vaySpqNX8WX6kyFsR4hW7k9i1IZPy3gbdByeD7BSuHpkG+oq3Cr3YKeN51S5mM6b8kas8rmFq+kauESOHH87kHCV07VqRqiGCKIYQo5TFHmzuWW7DryQEc0x1a+TnR3/SgU5JHefiCyQ3uDTdgtcgD/+VCt/oVcCkyVYkZdX2KksPYR5yvezxitJWI8skh9mwhoTvFSvM2qSKtH58SAiXam9Ip0lclqKiLx83m0p8SBBEB/bIp91yaxXlA99YCVCDEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eAutKulNSqbSaQcjB/rY66Exbgv3sh5ur6/FakAOZtA=;
 b=C4YRXHg8qCsbFdjkyOmaU7IcLDX7lEeAV7zgYEooU7xnpRhbOqnNNqWQb2FquARAHBzyjt5/5otDjOCFBl2wufEiT86K4pOGp3sCT6QupPFMiGGFuMlzckxIAwLIDo5YbUiyx8tsXRnwqzOKIvEQJ2KhVxo01eWMtgRjhatgvx74NWDYR3ZMzGbqxkAU4iYtUebvtBujcp3XyBz6GOUFavbRimHNoBO2N6WXMZiLrssqC+koqN6+xMOD0d6A8FwzhuzNh0FzZLjHp+cjeMo0Iv/3tOAlQE44QDw1eQC139+uCsrHc5qBquskqiIEM7hOgDyxVxwaK5OWUcMhZFqadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAutKulNSqbSaQcjB/rY66Exbgv3sh5ur6/FakAOZtA=;
 b=b7wZ/vhM196EVRBtO4mY2nJLhxrmiYdDZalLfeItQXXrd/ZQVnCd18Iyz3BhkU+FwG5VRHtF7t5i3u8E1RrajnxoR/0QmnnT8JWk0vlyf2VfxCFL/eFkhWDl/FnpsUsvECT0OijLAorXfvhdSm7WTUIHvuPt/diptz4WrMnEMQk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v5 2/7] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH v5 2/7] xen/arm: introduce domain on Static Allocation
Thread-Index: AQHXmM2YqjVc2LVowEyczFIN0YMASquRUfwAgAapJVA=
Date: Tue, 7 Sep 2021 03:18:29 +0000
Message-ID:
 <VE1PR08MB52153131D62829CBB8152B93F7D39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-3-penny.zheng@arm.com>
 <alpine.DEB.2.21.2109021312051.26072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109021312051.26072@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EEA958F302EBDA4CB8D1B1C352665A34.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3798125a-0c09-4557-c977-08d971ae360e
x-ms-traffictypediagnostic: VI1PR08MB4173:|VI1PR0802MB2445:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB244519C516DA266F52C08A29F7D39@VI1PR0802MB2445.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1148;OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 joSyrx2GucuBrj2gtO+eOEiQMgSlcJ9mBxLGV3ZsYNNlDPBvz8AG1CNKBxvPfBR/7QJyJaAPdqJvwR/gsVnfYLqTiC0ZgZV3Bx6ibABQQQFFhLndgWXEBFBRzXepUGbsxOn8i8fGZF0tS+wORcgc17fun6CirM0+7dcGJhYOVgoHkhsGRfMM69fYZvJfTl+tq0cCSWlDaL3YCM79wXPAaqqkVOkYry00oUH/yjUXN7e7LdT0FpocHWkdq5ZuOQmSutiZs97NGK1SdTqkkHnUhAqCTyi4JzFdX0tZMAaUyWeNGbGuC7mVzRWk0bic73oCY57CbxA9OaHyzIIsS3eRw2zI+2zHiTL7D11AA9b2/i1WFlPnEM6I1/ih04Zbv3fOoGMOwo9w3K5YhHCqjY2sjO87rPAKG6jHWvLMnf1DNwSPWB8uL6kP0EKPytoBTILieT0duntDsKIYtClrdw0a+o5R+rRwBHAODNYWJ+xww//1uVR8LUrTMkZu6YADFTZxLIOW3f4kXdnJbFfe2O9HXF0hQedzjmFljdkxSKMXon0buJVoHNnMy8nkg6RrX1opJhWDEyFIEZwydTRsEyKQxButbMvrRBcnyisyJQjh1QlwpElT3Fs/RfLZfokUlxG555Pz64hxdosdyGB+74gFSJOQ1WU/5/7vl1uF1gtIZ/y5SOB3KRxfGhrEPYOaowf+ApeDsq3NW4fqgcy6lruedw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(186003)(54906003)(2906002)(53546011)(55016002)(26005)(6506007)(7696005)(86362001)(38070700005)(52536014)(6916009)(8936002)(9686003)(83380400001)(8676002)(33656002)(316002)(64756008)(66476007)(122000001)(66446008)(66556008)(71200400001)(66946007)(76116006)(4326008)(5660300002)(38100700002)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4173
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ce8522d-29ea-41e6-9b9a-08d971ae2a3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vzfy021VVqWWyaWOHxJV67yFO3GIUiLdTICAqZYoy8KaMjFkdlPm+xk18vuilTpOXwNR3F2Lmgc2vZS0rOvXskxYF+lNgNtDokJNBg+VJUAFryBejTtfOX0KQ7tRtnyCsZhWk7zxj9XdwI6MIgNDpZvaPkHV7/uYjfowiy4v081dpTDT1B5Nep/6Nh3PqvYrKgnBXQvdoMNjRTsA7zwd4Xu/rAJlhhvbX7LBbYX48Gn0cwZMFc+uD8r9UujJVuaSfhrxPviWNNN76qjot1Movk7zz8KxmPECpCmiyIWb5Az+VSE9xP92BhcNXHjbzogFpPrkuWLzBe5NsWkI3WmGUBfw/XlYNf1hGXVMu/KOn7T+4fXD2RFAU0ME+q3K0xYxe2klZ+6zonTclxs6zyjvtZWBYrm9tksP1l+JjlQdV2HOwOz13bJUkSsYPyjVKjhstXi1/KEQiEmL+ozGz/hnWPScggJofW5Fl7XuBvipjP7mUo28xKJDLQlTujAQubP6n94670dfyJ3IlgRslzYbF8e02Y4INiCHrdQ9F5EzHKHT6HdORDiDrUYcRrfy87xazw+i0shnx8zWtqmbgsqDbqefiVDxxt4iolpJ7uGVNHOsNibC8i2NwdUNu4wldQ2bLBFvrp8adqccMnRq4P0iqRoBUNqJsq738BsFR2/vtoas0RoIG5TONGl5DO3L4Nv54+BlgHC8awyvxqH1C9Z1GA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(316002)(26005)(36860700001)(8676002)(5660300002)(6862004)(8936002)(186003)(86362001)(4326008)(83380400001)(55016002)(54906003)(52536014)(70206006)(33656002)(9686003)(47076005)(7696005)(70586007)(478600001)(53546011)(6506007)(82310400003)(82740400003)(356005)(336012)(2906002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 03:18:49.4073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3798125a-0c09-4557-c977-08d971ae360e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2445

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, September 3, 2021 5:31 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.or=
g;
> Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
> <Wei.Chen@arm.com>; nd <nd@arm.com>
> Subject: Re: [PATCH v5 2/7] xen/arm: introduce domain on Static Allocatio=
n
>=20
> On Tue, 24 Aug 2021, Penny Zheng wrote:
> > Static Allocation refers to system or sub-system(domains) for which
> > memory areas are pre-defined by configuration using physical address
> ranges.
> > Those pre-defined memory, -- Static Memory, as parts of RAM reserved
> > in the beginning, shall never go to heap allocator or boot allocator fo=
r any
> use.
> >
> > Memory can be statically allocated to a domain using the property
> > "xen,static- mem" defined in the domain configuration. The number of
> > cells for the address and the size must be defined using respectively
> > the properties "#xen,static-mem-address-cells" and "#xen,static-mem-siz=
e-
> cells".
> >
> > This patch introduces this new `xen,static-mem` feature, and also
> > documents and parses this new attribute at boot time.
> >
> > This patch also introduces a new field "bool xen_domain" in "struct
> membank"
> > to tell the difference of one memory bank is reserved as the whole
> > hardware resource, or bind to one specific xen domain node, through
> > "xen,static-mem"
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> > v5 changes:
> > - check the node using the Xen domain binding whether contains the
> > property "xen,static-mem", not the property itself
> > - add "rc =3D ..." to get the error propagated
> > - introduce new field "bool xen_domain", then static memory shall be
> > also stored as reserved memory(bootinfo.reserved_mem), but being bind
> > to one specific Xen domain node.
> > - doc refinement
> > ---
> >  docs/misc/arm/device-tree/booting.txt | 33 ++++++++++++++++++++++++
> >  xen/arch/arm/bootfdt.c                | 36 +++++++++++++++++++++++++--
> >  xen/include/asm-arm/setup.h           |  1 +
> >  3 files changed, 68 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/misc/arm/device-tree/booting.txt
> > b/docs/misc/arm/device-tree/booting.txt
> > index 5243bc7fd3..95b20ddc3a 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -268,3 +268,36 @@ The DTB fragment is loaded at 0xc000000 in the
> > example above. It should  follow the convention explained in
> > docs/misc/arm/passthrough.txt. The  DTB fragment will be added to the
> > guest device tree, so that the guest  kernel will be able to discover t=
he device.
> > +
> > +
> > +Static Allocation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Static Allocation refers to system or sub-system(domains) for which
> > +memory areas are pre-defined by configuration using physical address
> ranges.
> > +
> > +Memory can be statically allocated to a domain using the property
> > +"xen,static- mem" defined in the domain configuration. The number of
> > +cells for the address and the size must be defined using respectively
> > +the properties "#xen,static-mem-address-cells" and "#xen,static-mem-si=
ze-
> cells".
> > +
> > +Below is an example on how to specify the static memory region in the
> > +device-tree:
> > +
> > +    / {
> > +        chosen {
> > +            domU1 {
> > +                compatible =3D "xen,domain";
> > +                #address-cells =3D <0x2>;
> > +                #size-cells =3D <0x2>;
> > +                cpus =3D <2>;
> > +                #xen,static-mem-address-cells =3D <0x1>;
> > +                #xen,static-mem-size-cells =3D <0x1>;
> > +                xen,static-mem =3D <0x30000000 0x20000000>;
> > +                ...
> > +            };
> > +        };
> > +    };
> > +
> > +This will reserve a 512MB region starting at the host physical
> > +address
> > +0x30000000 to be exclusively used by DomU1
>=20
> This binding is OK.  We might want to clarify what is the purpose of the
> "memory" property when "xen,static-mem" is present. I would suggest to wr=
ite
> that when "xen,static-mem" is present, the "memory" property becomes
> optional. Or even better:
>=20
> """
> When present, the xen,static-mem property supersedes the memory property.
> """
>=20

oh, "supersede" learned! ;)

>=20
> In the future when Xen will support direct mapping, I assume that we'll a=
lso
> add a direct-map property to enable it.  Something like:
>=20
>     domU1 {
>         compatible =3D "xen,domain";
>         #address-cells =3D <0x2>;
>         #size-cells =3D <0x2>;
>         cpus =3D <2>;
>         #xen,static-mem-address-cells =3D <0x1>;
>         #xen,static-mem-size-cells =3D <0x1>;
>         xen,static-mem =3D <0x30000000 0x20000000>;
>         direct-map;
>         ...
>     };
>=20
> Maybe I would add a statement to clarify it that xen,static-mem doesn't
> automatically imply direct mapping. Something like:
>=20
> """
> The static memory will be mapped in the guest at the usual guest memory
> addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> xen/include/public/arch-arm.h.
> """
>=20

Thanks for the detailed suggestion. I'll just take it.

> The rest of the patch looks OK. One minor NIT below.
>=20
>=20
>=20
> > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c index
> > 8c81be3379..00f34eec58 100644
> > --- a/xen/arch/arm/bootfdt.c
> > +++ b/xen/arch/arm/bootfdt.c
> > @@ -66,7 +66,7 @@ void __init device_tree_get_reg(const __be32 **cell,
> > u32 address_cells,  static int __init device_tree_get_meminfo(const voi=
d *fdt,
> int node,
> >                                            const char *prop_name,
> >                                            u32 address_cells, u32 size_=
cells,
> > -                                          void *data)
> > +                                          void *data, bool
> > + xen_domain)
> >  {
> >      const struct fdt_property *prop;
> >      unsigned int i, banks;
> > @@ -90,6 +90,7 @@ static int __init device_tree_get_meminfo(const void
> *fdt, int node,
> >              continue;
> >          mem->bank[mem->nr_banks].start =3D start;
> >          mem->bank[mem->nr_banks].size =3D size;
> > +        mem->bank[mem->nr_banks].xen_domain =3D xen_domain;
> >          mem->nr_banks++;
> >      }
> >
> > @@ -184,7 +185,8 @@ static int __init process_memory_node(const void
> *fdt, int node,
> >          return -EINVAL;
> >      }
> >
> > -    return device_tree_get_meminfo(fdt, node, "reg", address_cells,
> size_cells, data);
> > +    return device_tree_get_meminfo(fdt, node, "reg", address_cells,
> size_cells,
> > +                                   data, false);
> >  }
> >
> >  static int __init process_reserved_memory_node(const void *fdt, int
> > node, @@ -338,6 +340,34 @@ static void __init process_chosen_node(const
> void *fdt, int node,
> >      add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);  }
> >
> > +static int __init process_domain_node(const void *fdt, int node,
> > +                                       const char *name,
> > +                                       u32 address_cells, u32
> > +size_cells) {
> > +    const struct fdt_property *prop;
> > +
> > +    printk("Checking for \"xen,static-mem\" in domain node\n");
> > +
> > +    prop =3D fdt_get_property(fdt, node, "xen,static-mem", NULL);
> > +    if ( !prop )
> > +        /* No "xen,static-mem" present. */
> > +        return 0;
> > +
> > +    address_cells =3D device_tree_get_u32(fdt, node,
> > +                                        "#xen,static-mem-address-cells=
", 0);
> > +    size_cells =3D device_tree_get_u32(fdt, node,
> > +                                     "#xen,static-mem-size-cells", 0);
> > +    if ( address_cells < 1 || size_cells < 1 )
> > +    {
> > +        printk("fdt: node `%s': invalid #xen,static-mem-address-cells =
or
> #xen,static-mem-size-cells",
> > +               name);
> > +        return -EINVAL;
> > +    }
> > +
> > +    return device_tree_get_meminfo(fdt, node, "xen,static-mem",
> address_cells,
> > +                                   size_cells,
> > +&bootinfo.reserved_mem, true); }
> > +
> >  static int __init early_scan_node(const void *fdt,
> >                                    int node, const char *name, int dept=
h,
> >                                    u32 address_cells, u32 size_cells,
> > @@ -356,6 +386,8 @@ static int __init early_scan_node(const void *fdt,
> >          process_multiboot_node(fdt, node, name, address_cells, size_ce=
lls);
> >      else if ( depth =3D=3D 1 && device_tree_node_matches(fdt, node, "c=
hosen") )
> >          process_chosen_node(fdt, node, name, address_cells,
> > size_cells);
> > +    else if ( depth =3D=3D 2 && device_tree_node_compatible(fdt, node,
> "xen,domain") )
> > +        rc =3D process_domain_node(fdt, node, name, address_cells,
> > + size_cells);
> >
> >      if ( rc < 0 )
> >          printk("fdt: node `%s': parsing failed\n", name); diff --git
> > a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h index
> > c4b6af6029..6c3c16294b 100644
> > --- a/xen/include/asm-arm/setup.h
> > +++ b/xen/include/asm-arm/setup.h
> > @@ -24,6 +24,7 @@ typedef enum {
> >  struct membank {
> >      paddr_t start;
> >      paddr_t size;
> > +    bool xen_domain; /* whether memory bank is bind to Xen domain. */
>                                   ^ a or the      ^ bound to a
>=20

Sure. Will fix it.

>=20
> >  };
> >
> >  struct meminfo {
> > --
> > 2.25.1
> >

