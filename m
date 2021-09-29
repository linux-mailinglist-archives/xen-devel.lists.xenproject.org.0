Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0787941BFFA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198685.352305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU79-0000fi-Mb; Wed, 29 Sep 2021 07:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198685.352305; Wed, 29 Sep 2021 07:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU79-0000d4-Hb; Wed, 29 Sep 2021 07:34:51 +0000
Received: by outflank-mailman (input) for mailman id 198685;
 Wed, 29 Sep 2021 07:34:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU77-0000cy-DW
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:34:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2047621-2d2a-4e5f-8a61-12f486c15c34;
 Wed, 29 Sep 2021 07:34:47 +0000 (UTC)
Received: from DB6PR0601CA0033.eurprd06.prod.outlook.com (2603:10a6:4:17::19)
 by DBAPR08MB5672.eurprd08.prod.outlook.com (2603:10a6:10:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 07:34:45 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::7a) by DB6PR0601CA0033.outlook.office365.com
 (2603:10a6:4:17::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Wed, 29 Sep 2021 07:34:45 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:34:45 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Wed, 29 Sep 2021 07:34:44 +0000
Received: from 6c7c8b32a4bc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A0F8E00-9347-4ED5-A6D2-67BBD9297996.1; 
 Wed, 29 Sep 2021 07:34:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c7c8b32a4bc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:34:32 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6271.eurprd08.prod.outlook.com (2603:10a6:102:eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 07:34:30 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:34:30 +0000
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
X-Inumbo-ID: d2047621-2d2a-4e5f-8a61-12f486c15c34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhikygCoi2aCzLqr64xAZt0QJL4w6dKkf9BDgcmYptc=;
 b=a+897nCAZeZb3suIxR1fRKbiIi0hFDjZqRCoPM/kSVcCFTSL82gaoDYNnKVqCyNRn6bEVugIWZUlM0axl3mfOf+dvtVBggOKTo+PMOdxUqn28jaGhfovrOZ2+OZlpAJW+VZfnkaLCNJQahzts7f8YIkzKyYIqhb80fcUpFYB/HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86b4a94b74d641dc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkRI3lC3J/LeqvOMeEsWd4QYQokOLAmFnbT89E726vYRQOOppbqYp3K0MDDywP+5AiHpsXkItxxAouaLh/6fa1yyignoSiNlq/MD0QX/rnJZs0Rdy9PnjbYLO2gO3QhqzwfBHr08/Odl19JSTcjPhkwkc+9XCLdGhiosa6OEZPBDtlE637eOiKahzT59/UdKCs871t+cc7A9gdaaBrXJjn2lTROY4Vs2K2Rc4K6yPB5mopbTOblYVJlIDM34jy4z66Zs7pXk/+CAB8R3DMZVlUFcgGAVLxYfcu9m06Dqfh8y989iJJ/lUNtw68JL0jXuWH95omuB63WS1j1DmZIBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AhikygCoi2aCzLqr64xAZt0QJL4w6dKkf9BDgcmYptc=;
 b=dETxNysCvyVcCpwa37bALP/xHIN78hxGIAy24eTGhyVboJjnt99LgbUo3OtFtZFi/Na5+5xmWcAEaQ57+x2txnZUli1Yp/C+9T8XyQGC8RFfcHjB1eYrOGLzTglV3GrmfsxJVeciPkKxMbg3UHc6mzMn6rEiUvoumGiEWvnYzw5nhy0eXo8X25xFiGcGuiDLNiVqUsOV573qUeKpa94q1agD0L9Xx2RoA7Ixfn9g8MyiI8AF9K7jtl705yvgXAJO21hNePI2m5NuBjMbJUw3wW9UG3nV2exXNzPTfcN/+hIleOlpRDPymBBlkBKj19EUP4DmsN+GjRQXef63wujl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhikygCoi2aCzLqr64xAZt0QJL4w6dKkf9BDgcmYptc=;
 b=a+897nCAZeZb3suIxR1fRKbiIi0hFDjZqRCoPM/kSVcCFTSL82gaoDYNnKVqCyNRn6bEVugIWZUlM0axl3mfOf+dvtVBggOKTo+PMOdxUqn28jaGhfovrOZ2+OZlpAJW+VZfnkaLCNJQahzts7f8YIkzKyYIqhb80fcUpFYB/HY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support for
 ARM
Thread-Topic: [PATCH v3 05/17] xen/arm: Add PHYSDEVOP_pci_device_* support for
 ARM
Thread-Index: AQHXtJWO1YfLgI0NjECk5ZqoHOeawKu6n7SA
Date: Wed, 29 Sep 2021 07:34:29 +0000
Message-ID: <605BDD89-17FE-49DE-95EA-8108F7F02213@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <f8ac00f7d52f4853d276b4da24294fbeb3602245.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <f8ac00f7d52f4853d276b4da24294fbeb3602245.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8c62ab83-93eb-4fd6-b8cb-08d9831b9c05
x-ms-traffictypediagnostic: PA4PR08MB6271:|DBAPR08MB5672:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5672701ACDBB92584692740D9DA99@DBAPR08MB5672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +2se+A5+AMjc1FdpNXizoE5f9nkzD2vIXDNWkjicfaBQIkRn7KiHxgpCIseynr7QsK5N2lJGum3Nmkhh7E0QOvlQ4o/3XpVCVveJ6PBP0WD9jL3LO5tef+5uLsNxZenUUzOIKzzQ3YQA59COJIN0QE5t8bGWr7Gmph3IZBIYmD2JLOVOG5/wAn4OEYLir593Ea6hUyOoIFzjRmXGRkFhdz8cNd7PduS/rKbqnmZRs5Vgdwel0DsRLDcBozZHDZhQMiH+NmOcrUlSTW7w1zy7iIl6zsnJ3++oAPFaINxgeYjS56d12R15dGHPkIwwuBY3yh6tgmy55AjtUssqXvo5ptXW3fu1So0i44onnFY8OFT4sBoR6n4uxpUk0pKu4kWVHy5KoQjj1M82DyzMenbCsvN6P4oxIJzglgdaF0+el3Y6j7BzhFeCvNQQcc2XLomeeah5dWWRZes3HwKO9rDB9kXbZYwG6JQQrW+xObJF01zALplpNeRJDxmm7kCjjGLchvcLfjIRcTFZIDJDFaPIvJyleNBZOc64HhdzCkqKVqNyjuheFhpyNhyc3JPqHpV+uWFob2Aay7I3e2ngxpzCsc2NHeJQWfR3AkM6EJkPqQRGPKq9FYs/Y5uthJXW4Evhm+V0Vd9mDALsVkYpKHwty5I4HkBacqE/jtKfJATZddyq2JRXIG2hC+QOw7NNDK4pPW7aJ56TeTbfrU5Q0zuO5SBPPvkW25q4eA/h5XeWRaJyX3/tqWhUfedz8icbP85g
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(33656002)(53546011)(54906003)(2906002)(37006003)(71200400001)(316002)(7416002)(6506007)(38070700005)(86362001)(122000001)(38100700002)(64756008)(66476007)(66556008)(8676002)(66446008)(66946007)(76116006)(91956017)(6486002)(6512007)(8936002)(6862004)(4326008)(36756003)(508600001)(83380400001)(6636002)(2616005)(5660300002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D5D645AD94469843AC027D32EAE43CD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6271
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eff0cf00-84b9-4cf1-69eb-08d9831b92d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ks1Q52LUta+v3KE/zYzlJcoMTIq3EieFz0vTCn9bXb33HI3CtNkKH1wWr5pLtiDbFlGQmD2Lhpkh1l5GCUGIMBkmhUnNFSUeJdDQz/un8p1jYSx18b2l6fnTasXH5irZB12/ON8O/fHkIXw/LpUIc6gfwMbmIORZAdhQH44pws5vDAOWrNpq5OtpoLdn9kl9JK/Y7L1Gg4rY5XOuBpUuef7DsuxuGQ1YOmBY0btmo++WWtjK3+2OxRqU9chb/p7U6wzo7tB1G/rFAe0jNdtig0jxNoFS/DpyKYuX1F40GrJUHGHt/r/Ot1cbHOfSXxtJTI4d0aRKaoIDBaINnkLuM2vVVNAFLfd/vAzRYQzTRwItGS0+xBnijKaqCuw92OmkltidxirZeguv6U084vf5V9/sI21AvNe9WtZ1hxP/NLm0r2HEC3p59BH/V18pXmY3yG3uiaTQixnzHoPwZK32VNdmnqcM2/NMvptEqwdvkOlAL3UflRb/9bKi3z/xzPmUkvA3OT48mjfdrDPw/9svxXAiiq9oSmZntFHVTrhSc6XBASmv2dwBPhetbC0w+IKPqhtzouNr6MUhWumnWamUwJbWFjd4er+IpQPG+utwiLWBG0n9t+UCGP8Fa1c7AONAyZn8jfD70L7d+mjvV5CzTM8MkDf1wOXTuNKgOnZtDtzMS8lADmFHh4d9PX+sUPosRe58zgILXpO0yLqPhroLxw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(107886003)(36756003)(54906003)(186003)(70206006)(6636002)(336012)(508600001)(6486002)(6862004)(26005)(83380400001)(5660300002)(8676002)(70586007)(37006003)(316002)(36860700001)(2906002)(33656002)(2616005)(8936002)(6512007)(81166007)(47076005)(6506007)(53546011)(4326008)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:34:45.4542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c62ab83-93eb-4fd6-b8cb-08d9831b9c05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5672

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> Hardware domain is in charge of doing the PCI enumeration and will
> discover the PCI devices and then will communicate to XEN via hyper
> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
>=20
> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
>=20
> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
> and ARM, move the code to a common file to avoid duplication.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3: Fixed minor comment.
> Change in v2:
> - Add support for PHYSDEVOP_pci_device_remove()
> - Move code to common code
> ---
> xen/arch/arm/physdev.c          |  5 +-
> xen/arch/x86/physdev.c          | 50 +-------------------
> xen/arch/x86/x86_64/physdev.c   |  4 +-
> xen/common/Makefile             |  1 +
> xen/common/physdev.c            | 81 +++++++++++++++++++++++++++++++++
> xen/include/asm-arm/hypercall.h |  2 -
> xen/include/asm-arm/numa.h      |  5 ++
> xen/include/asm-x86/hypercall.h |  9 ++--
> xen/include/xen/hypercall.h     |  8 ++++
> 9 files changed, 106 insertions(+), 59 deletions(-)
> create mode 100644 xen/common/physdev.c
>=20
> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
> index e91355fe22..4e00b03aab 100644
> --- a/xen/arch/arm/physdev.c
> +++ b/xen/arch/arm/physdev.c
> @@ -8,10 +8,9 @@
> #include <xen/lib.h>
> #include <xen/errno.h>
> #include <xen/sched.h>
> -#include <asm/hypercall.h>
> +#include <xen/hypercall.h>
>=20
> -
> -int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +long arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> {
>     gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd);
>     return -ENOSYS;
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 23465bcd00..c00cc99404 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -174,7 +174,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
> }
> #endif /* COMPAT */
>=20
> -ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +ret_t arch_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> {
>     int irq;
>     ret_t ret;
> @@ -480,54 +480,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>         break;
>     }
>=20
> -    case PHYSDEVOP_pci_device_add: {
> -        struct physdev_pci_device_add add;
> -        struct pci_dev_info pdev_info;
> -        nodeid_t node;
> -
> -        ret =3D -EFAULT;
> -        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
> -            break;
> -
> -        pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN);
> -        if ( add.flags & XEN_PCI_DEV_VIRTFN )
> -        {
> -            pdev_info.is_virtfn =3D 1;
> -            pdev_info.physfn.bus =3D add.physfn.bus;
> -            pdev_info.physfn.devfn =3D add.physfn.devfn;
> -        }
> -        else
> -            pdev_info.is_virtfn =3D 0;
> -
> -        if ( add.flags & XEN_PCI_DEV_PXM )
> -        {
> -            uint32_t pxm;
> -            size_t optarr_off =3D offsetof(struct physdev_pci_device_add=
, optarr) /
> -                                sizeof(add.optarr[0]);
> -
> -            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
> -                break;
> -
> -            node =3D pxm_to_node(pxm);
> -        }
> -        else
> -            node =3D NUMA_NO_NODE;
> -
> -        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, =
node);
> -        break;
> -    }
> -
> -    case PHYSDEVOP_pci_device_remove: {
> -        struct physdev_pci_device dev;
> -
> -        ret =3D -EFAULT;
> -        if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
> -            break;
> -
> -        ret =3D pci_remove_device(dev.seg, dev.bus, dev.devfn);
> -        break;
> -    }
> -
>     case PHYSDEVOP_prepare_msix:
>     case PHYSDEVOP_release_msix: {
>         struct physdev_pci_device dev;
> diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physdev.=
c
> index 0a50cbd4d8..5f72652ff7 100644
> --- a/xen/arch/x86/x86_64/physdev.c
> +++ b/xen/arch/x86/x86_64/physdev.c
> @@ -9,9 +9,10 @@ EMIT_FILE;
> #include <compat/xen.h>
> #include <compat/event_channel.h>
> #include <compat/physdev.h>
> -#include <asm/hypercall.h>
> +#include <xen/hypercall.h>
>=20
> #define do_physdev_op compat_physdev_op
> +#define arch_physdev_op arch_compat_physdev_op
>=20
> #define physdev_apic               compat_physdev_apic
> #define physdev_apic_t             physdev_apic_compat_t
> @@ -82,6 +83,7 @@ CHECK_physdev_pci_device
> typedef int ret_t;
>=20
> #include "../physdev.c"
> +#include "../../../common/physdev.c"
>=20
> /*
>  * Local variables:
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 54de70d422..bcb1c8fb03 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -29,6 +29,7 @@ obj-y +=3D notifier.o
> obj-y +=3D page_alloc.o
> obj-$(CONFIG_HAS_PDX) +=3D pdx.o
> obj-$(CONFIG_PERF_COUNTERS) +=3D perfc.o
> +obj-y +=3D physdev.o
> obj-y +=3D preempt.o
> obj-y +=3D random.o
> obj-y +=3D rangeset.o
> diff --git a/xen/common/physdev.c b/xen/common/physdev.c
> new file mode 100644
> index 0000000000..20a5530269
> --- /dev/null
> +++ b/xen/common/physdev.c
> @@ -0,0 +1,81 @@
> +
> +#include <xen/guest_access.h>
> +#include <xen/hypercall.h>
> +#include <xen/init.h>
> +
> +#ifndef COMPAT
> +typedef long ret_t;
> +#endif
> +
> +ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    ret_t ret;
> +
> +    switch ( cmd )
> +    {
> +#ifdef CONFIG_HAS_PCI
> +    case PHYSDEVOP_pci_device_add: {
> +        struct physdev_pci_device_add add;
> +        struct pci_dev_info pdev_info;
> +        nodeid_t node;
> +
> +        ret =3D -EFAULT;
> +        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
> +            break;
> +
> +        pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN);
> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
> +        {
> +            pdev_info.is_virtfn =3D 1;
> +            pdev_info.physfn.bus =3D add.physfn.bus;
> +            pdev_info.physfn.devfn =3D add.physfn.devfn;
> +        }
> +        else
> +            pdev_info.is_virtfn =3D 0;
> +
> +        if ( add.flags & XEN_PCI_DEV_PXM )
> +        {
> +            uint32_t pxm;
> +            size_t optarr_off =3D offsetof(struct physdev_pci_device_add=
, optarr) /
> +                                sizeof(add.optarr[0]);
> +
> +            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
> +                break;
> +
> +            node =3D pxm_to_node(pxm);
> +        }
> +        else
> +            node =3D NUMA_NO_NODE;
> +
> +        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, =
node);
> +        break;
> +    }
> +
> +    case PHYSDEVOP_pci_device_remove: {
> +        struct physdev_pci_device dev;
> +
> +        ret =3D -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
> +            break;
> +
> +        ret =3D pci_remove_device(dev.seg, dev.bus, dev.devfn);
> +        break;
> +    }
> +#endif
> +    default:
> +        ret =3D arch_physdev_op(cmd, arg);
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/asm-arm/hypercall.h b/xen/include/asm-arm/hyperc=
all.h
> index a0c5a31a2f..c6e4a04fd6 100644
> --- a/xen/include/asm-arm/hypercall.h
> +++ b/xen/include/asm-arm/hypercall.h
> @@ -2,8 +2,6 @@
> #define __ASM_ARM_HYPERCALL_H__
>=20
> #include <public/domctl.h> /* for arch_do_domctl */
> -int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> -
> long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(=
void) arg);
>=20
> long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 31a6de4e23..dbd1c2467f 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -25,6 +25,11 @@ extern mfn_t first_valid_mfn;
> #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> #define __node_distance(a, b) (20)
>=20
> +static inline nodeid_t pxm_to_node(unsigned pxm)
> +{
> +    return 0xff;
> +}
> +
> #endif /* __ARCH_ARM_NUMA_H */
> /*
>  * Local variables:
> diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hyperc=
all.h
> index 0ae3b8b043..7afba98186 100644
> --- a/xen/include/asm-x86/hypercall.h
> +++ b/xen/include/asm-x86/hypercall.h
> @@ -105,10 +105,6 @@ do_update_va_mapping(
>     u64 val64,
>     unsigned long flags);
>=20
> -extern long
> -do_physdev_op(
> -    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> -
> extern long
> do_update_va_mapping_otherdomain(
>     unsigned long va,
> @@ -151,6 +147,11 @@ compat_physdev_op(
>     int cmd,
>     XEN_GUEST_HANDLE_PARAM(void) arg);
>=20
> +extern int
> +arch_compat_physdev_op(
> +    int cmd,
> +    XEN_GUEST_HANDLE_PARAM(void) arg);
> +
> extern int
> arch_compat_vcpu_op(
>     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
> index 3771487a30..5cc74f40b7 100644
> --- a/xen/include/xen/hypercall.h
> +++ b/xen/include/xen/hypercall.h
> @@ -45,6 +45,14 @@ extern long
> do_platform_op(
>     XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
>=20
> +extern long
> +do_physdev_op(
> +    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> +
> +extern long
> +arch_physdev_op(
> +    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> +
> /*
>  * To allow safe resume of do_memory_op() after preemption, we need to kn=
ow
>  * at what point in the page list to resume. For this purpose I steal the
> --=20
> 2.17.1
>=20


