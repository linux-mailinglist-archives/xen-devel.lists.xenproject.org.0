Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7943F41C004
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198716.352360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU9G-0003ti-EP; Wed, 29 Sep 2021 07:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198716.352360; Wed, 29 Sep 2021 07:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU9G-0003r5-A4; Wed, 29 Sep 2021 07:37:02 +0000
Received: by outflank-mailman (input) for mailman id 198716;
 Wed, 29 Sep 2021 07:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU8o-00025H-Lm
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:36:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e32ab1ce-fd50-43ee-86df-dacafeefb7d6;
 Wed, 29 Sep 2021 07:36:29 +0000 (UTC)
Received: from AS9PR06CA0355.eurprd06.prod.outlook.com (2603:10a6:20b:466::22)
 by PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:36:26 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::36) by AS9PR06CA0355.outlook.office365.com
 (2603:10a6:20b:466::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 29 Sep 2021 07:36:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 29 Sep 2021 07:36:26 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Wed, 29 Sep 2021 07:36:21 +0000
Received: from 48f8ed936d97.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21236CCF-406B-4EB4-9E1F-1BE12C480568.1; 
 Wed, 29 Sep 2021 07:36:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 48f8ed936d97.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:36:10 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5804.eurprd08.prod.outlook.com (2603:10a6:102:83::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 07:36:07 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:36:07 +0000
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
X-Inumbo-ID: e32ab1ce-fd50-43ee-86df-dacafeefb7d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMKp31vnIj/RtCFImjfzeDtmcIxvXYsVsVjToRnQjT8=;
 b=AyonFObRZXTRge3B2A+s3kyR5802c4qRBfL1NjIE8Vsqbba5zO6joLD36sl7McfgDtUwv6b/SBrWL57XpaXV+MoyGedXsMksI4xzYdKPPFL/UjJ0OztNl4Omz3UIutVdTjgRC76b7+SUhYZfcKwdw3ztzEWbXMg24YA6wmEoKCI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 340cb0bfd07c6147
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9D6yoUY5Ur1OnsmVcxOmIPDxih79rElC5g0NfjI7F5D26zdRehcmqYs2kaAQvkJR9wJOa/cPyyywMH9FTqJskBughR0yl9QLAqnhorLgyxSNqzFdGgZ5tTunjqMn7+lulijy591lSoffJTyMJFVSfXk3K8gmHmJ4g4BDk7sKaKspbH3U1eunvVbbIBhA3EegB2Ohb9VDKA4Y20Pd8aGVodFg0CP5zrU/bOsehIXMMx+Wq48SPoqFJa+A9LWBFkmMg0IHLD22CB6u9gw4s3DcVe8EDFgXxbtb1w6irSAvAtSqkJOeVmJNrNVAesrwmn+l9AR2dLT/a+dqdA5lymgpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pMKp31vnIj/RtCFImjfzeDtmcIxvXYsVsVjToRnQjT8=;
 b=EYfrjK0iONFljEf5SWoJrJZYGxUEHkddKFpwzAWxduocyugKGSdOQ6eQptrG4W+rVxuWIt4cnqEICGatTigc6EYkXF2Bhis/cAdDXZVIeefYDdWKRUy+23abO+s9LjE67A2SSoPoSX9sNAGGn2+rRpMy4VH71UASO7wawk9PnLGB1r6uj6SnM85AZ2LLt5nLBSa4qg4e9bkQsJHCG7wlDszwATzyazXMqg1AadHNTUehGmKgFOkZE0Lma/pmcGNraErnygRM0H6339nTevFmuUWaKNhY3um9weayvMsn0zAMRCaiz9BZmttNUBxNczZT8WWi4PILDI4VU2GEQDiptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMKp31vnIj/RtCFImjfzeDtmcIxvXYsVsVjToRnQjT8=;
 b=AyonFObRZXTRge3B2A+s3kyR5802c4qRBfL1NjIE8Vsqbba5zO6joLD36sl7McfgDtUwv6b/SBrWL57XpaXV+MoyGedXsMksI4xzYdKPPFL/UjJ0OztNl4Omz3UIutVdTjgRC76b7+SUhYZfcKwdw3ztzEWbXMg24YA6wmEoKCI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Topic: [PATCH v3 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Index: AQHXtJXG05lNP2fKPECPSZT9mpQWvau6oCcA
Date: Wed, 29 Sep 2021 07:36:07 +0000
Message-ID: <F5D5D147-432A-47B4-B251-BE0786345671@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4e058d69-a9a7-4a9c-896e-08d9831bd825
x-ms-traffictypediagnostic: PR3PR08MB5804:|PAXPR08MB6766:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB67668B190B2D427E3EAFAD809DA99@PAXPR08MB6766.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +7zB/5AGzBjBNDaOCB4BD4pxedI7WOlc/PUQEVygRR6eQAAq9L8oyGa2Amj/XVZtguChVV83I0jJvQyRm61O4NuJ3OLr3F+L4HjAMf314cBY2T6E2Qsx7rYLnVCsO0/XcBRQf/FebciDAlypvHswhEqY+uwDyWqmDACQcW+sEXl0MAYiVt9I6443+6L+msBo9UQsj+O4tzieS8LS3rLRFJ3uStp+UPJriQY+gqqYDOd1cveq56W82aOxQkPzrS4cED2K6KKM0qTzBXsopFHLkb4zY5bHw1vZ9QQHheiFgf/wKrSdXdGUZ/4Jg7NwdvAsx3czTtPDH0EpRWhDp0rmDMzl1qn3htjZLL1CSz5XsMEfVe/0eZ6PQXlvOqpo1x15IfRnAlitR5kDIoTXHemlxJy8ys85pICZS74A0v6ltQHUWfVr/8wLKgirU/Cmhi9lbNZNHD6nevuNrbfhrau+2PvgXlHPZ/HNWATLidJVpGvh7S28QcZx992JRL7oGorpx4AHvFHGosPXa7pOEitd9kLclqYk8kVmAvL3Le8luu+7Tu3Hf1Nb9VWr06wuMJ1+lMZFE6p7aMaqR5hx8/MF9EdLDqDh/ZMX/5X6gwpME3zQlluyr0xjoYjnWvo1NC9ZhsrvrC0DcbgYGR5J1RgMozCnZk+xqORCvc5eR9lu5aUhHInaAqDKYeNiWO8Vc+xsKtFZIcfxpVlYfZvjsPnqhDvR9fKuwhAab49rnCs+vrbj0xFs7FpUZGhx6kKB5zsc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(2616005)(316002)(6512007)(37006003)(2906002)(4326008)(38100700002)(122000001)(36756003)(33656002)(5660300002)(6486002)(71200400001)(7416002)(6636002)(54906003)(83380400001)(186003)(76116006)(91956017)(66476007)(66946007)(26005)(86362001)(6506007)(53546011)(8676002)(66556008)(508600001)(6862004)(8936002)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D1ABB6CB3146E04B9D86AD68BDEE1797@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5804
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6eed6070-aa0f-46e1-5430-08d9831bccde
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F2wbOTFPk94EaPQbjk4JluIyxjRMLREBQDH7Z10i3KJuJmjEYq34Y92nT1v/BkDTX851053IYPehuyyWBei3YlPlc6hsMpjRVoUdCecw2ctvkeat/yt+FmnWW7VcSE0OXiw3frKrki7mH2JJ6ClwNSwwWE3tHFJerTLNDdv9BtMaDmtD7lLo5rhnMC2Brt+Trkc1c5CEzB11//MhSpjGMBeYJrgQPCJ1rAgLd1HeAbidbYrnLrpJYwxDyh3KImrAaLqALCWCbdiPn4nIgH9yhRUx0YDhuxQS7a3cXiUl1BVWugY7Hsxelojieq6qFrEQ9/vRB7bMyrNC3fjTDDm5MoiyC+iY0Re1K/ONmrAXK+gofQci1WIVwqhGp1jR6A3ouqfpERBiaDBofgwL7B+dOuKdYkfbRr7GPcifKvxcAVuLVqCirLa1LYkaXRPkst4xcN99pf7fF5lJV1KyQmrsQpKC1YDwh0yjGVFo0cUojQ/DTQL9xODPPHL/1iST/l6elx9owhwSnMopguhJg2ii7wI6xBRGkhq6rxLvv1zmwCYV90sVdFBbawxN5HNGxEbAU8KOnpZzQgOS1ZKQCWyTFyIA9YIp5kPme1X371Oujp2h84Bg1r91Mkywx3F7fgrJmWi7Jj2sOBp/EIhB9gTrP9tS670EhFGS6FIj4ZpwTtWg5xAMHamklacYUT8PG5yfq6cPp8GsoAH/dVVblhUB2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6486002)(508600001)(6512007)(37006003)(86362001)(2906002)(8676002)(33656002)(107886003)(2616005)(5660300002)(54906003)(4326008)(6862004)(53546011)(26005)(356005)(81166007)(336012)(316002)(36756003)(186003)(83380400001)(47076005)(6636002)(70586007)(70206006)(82310400003)(6506007)(8936002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:36:26.2780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e058d69-a9a7-4a9c-896e-08d9831bd825
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6766

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> Add cmdline boot option "pci-passthrough =3D =3D <boolean>" to enable or
> disable the PCI passthrough support on ARM.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Remove "define pci_passthrough_enabled (false)"
> - Fixed coding style and minor comment
> Change in v2:
> - Add option in xen-command-line.pandoc
> - Change pci option to pci-passthrough
> - modify option from custom_param to boolean param
> ---
> docs/misc/xen-command-line.pandoc |  7 +++++++
> xen/arch/arm/pci/pci.c            | 14 ++++++++++++++
> xen/common/physdev.c              |  6 ++++++
> xen/include/asm-arm/pci.h         | 11 +++++++++++
> xen/include/asm-x86/pci.h         |  8 ++++++++
> 5 files changed, 46 insertions(+)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 177e656f12..c8bf96ccf8 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1808,6 +1808,13 @@ All numbers specified must be hexadecimal ones.
>=20
> This option can be specified more than once (up to 8 times at present).
>=20
> +### pci-passthrough (arm)
> +> `=3D <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable support for PCI passthrough
> +
> ### pcid (x86)
>> `=3D <boolean> | xpti=3D<bool>`
>=20
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index e359bab9ea..84d8f0d634 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -16,6 +16,7 @@
> #include <xen/device_tree.h>
> #include <xen/errno.h>
> #include <xen/init.h>
> +#include <xen/param.h>
> #include <xen/pci.h>
>=20
> /*
> @@ -62,8 +63,21 @@ static int __init acpi_pci_init(void)
> }
> #endif
>=20
> +/*
> + * By default pci passthrough is disabled
> + */
> +bool __read_mostly pci_passthrough_enabled =3D false;
> +boolean_param("pci-passthrough", pci_passthrough_enabled);
> +
> static int __init pci_init(void)
> {
> +    /*
> +     * Enable PCI passthrough when has been enabled explicitly
> +     * (pci-passthrough=3Don)
> +     */
> +    if ( !pci_passthrough_enabled )
> +        return 0;
> +
>     pci_segments_init();
>=20
>     if ( acpi_disabled )
> diff --git a/xen/common/physdev.c b/xen/common/physdev.c
> index 20a5530269..2d5fc886fc 100644
> --- a/xen/common/physdev.c
> +++ b/xen/common/physdev.c
> @@ -19,6 +19,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
>         struct pci_dev_info pdev_info;
>         nodeid_t node;
>=20
> +        if ( !is_pci_passthrough_enabled() )
> +            return -ENOSYS;
> +
>         ret =3D -EFAULT;
>         if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>             break;
> @@ -54,6 +57,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
>     case PHYSDEVOP_pci_device_remove: {
>         struct physdev_pci_device dev;
>=20
> +        if ( !is_pci_passthrough_enabled() )
> +            return -ENOSYS;
> +
>         ret =3D -EFAULT;
>         if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>             break;
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 7dd9eb3dba..0cf849e26f 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -19,14 +19,25 @@
>=20
> #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>=20
> +extern bool_t pci_passthrough_enabled;
> +
> /* Arch pci dev struct */
> struct arch_pci_dev {
>     struct device dev;
> };
>=20
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +    return pci_passthrough_enabled;
> +}
> #else   /*!CONFIG_HAS_PCI*/
>=20
> struct arch_pci_dev { };
>=20
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +    return false;
> +}
> +
> #endif  /*!CONFIG_HAS_PCI*/
> #endif /* __ARM_PCI_H__ */
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index cc05045e9c..3f806ce7a8 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned=
 int *seg,
> extern int pci_mmcfg_config_num;
> extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>=20
> +/*
> + * Unlike ARM, PCI passthrough is always enabled for x86.
> + */
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +    return true;
> +}
> +
> #endif /* __X86_PCI_H__ */
> --=20
> 2.17.1
>=20


