Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1141C4220E6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 10:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202101.356778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfu6-0006hn-PP; Tue, 05 Oct 2021 08:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202101.356778; Tue, 05 Oct 2021 08:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXfu6-0006fr-Lk; Tue, 05 Oct 2021 08:34:26 +0000
Received: by outflank-mailman (input) for mailman id 202101;
 Tue, 05 Oct 2021 08:34:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4De=OZ=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mXfu5-0006fl-Rz
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 08:34:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a35f3e6-220c-48e6-aba7-5e9abdaa5fa2;
 Tue, 05 Oct 2021 08:34:23 +0000 (UTC)
Received: from DB6PR07CA0082.eurprd07.prod.outlook.com (2603:10a6:6:2b::20) by
 VE1PR08MB5853.eurprd08.prod.outlook.com (2603:10a6:800:1a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 08:34:20 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::6d) by DB6PR07CA0082.outlook.office365.com
 (2603:10a6:6:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.7 via Frontend
 Transport; Tue, 5 Oct 2021 08:34:19 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 08:34:19 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Tue, 05 Oct 2021 08:34:15 +0000
Received: from aec08f629fda.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA7FC38F-A968-4019-BC18-D810418B83E9.1; 
 Tue, 05 Oct 2021 08:05:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aec08f629fda.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Oct 2021 08:05:12 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4357.eurprd08.prod.outlook.com (2603:10a6:20b:74::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 08:05:07 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 08:05:07 +0000
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
X-Inumbo-ID: 5a35f3e6-220c-48e6-aba7-5e9abdaa5fa2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGa1dcADGp7coLjs3vFe1jr5FArixMPZhhHt2PpB+gY=;
 b=gnm1kRyYjSJxZiEPF/M4d8Mp5UHUBGfngnU079dI18P4eI7lRwYDESCSHf8tTCYS8Ch3kESZoTjSwc168jdRbTZNwXLBfEh1cvQCEPOv6Apg2ZDGOIRBMzK577OYd0UFzk8LGtOS/WMb12ghHytjMQHvp6doZE6Fpxt2eUAtu54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7afa33c84bd8eb72
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV4y6gPm9UT2LzTvHniv3xAl1kcVVhUXBigQLnrFbSdiga3gAbQBa8BdGFDi98gyFmPqm9xkhlE5nI6/gMRcvW2G4y6RB8Gq+mkDAZE+k6WcV+dHH4DOXBws+0Hdrwy4YSjNBaVzZeePOBtO0MhVwJG1yCsc4zgv75Z7v4vYh4NwYaxZvC8X0XXk3AxHR/5X5rupGkIb2bskHInEo0b9fUVv3DZ8iPS74kAiBXcsRB3o4z6sjm2oScJymTzcUvXRf2FjJs8i5/Ycyua+/bC4C/FVXzl89p1Kia2kp59QSkkZ+Oa+jaXcTg3FKhDfRffBSnFdnTvjq26wTsX4Q8mRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGa1dcADGp7coLjs3vFe1jr5FArixMPZhhHt2PpB+gY=;
 b=WOLd/hFIz6eVx6yRQsXaIWzi6uDfcsyBNc/NjabK+zrCw1rAVUfCMUd/G21yM726h46mOQPrmuiGcQm71lIAdwb+7wYHN1bbP8dA4o8Km6Li98H+E05KsjrGwENcXFaavSr2RcI8uKO4Zed7YR6Uo8H7ocR+V9gH2gENUsCIjHbpAwe9lZOZ+HemCkgJ6Lt2y4Z3iMOLJMZZYrlqq4ZEWHPbZEdGk8Vsyn0yci9i+vMBvyAR66QQunaem1RxM7Iim3yD2ym4Fz2Lxy4l1AhUZR/DzgV5zOZctt/ippX8d8TE9vT8n/d+ePhGrLLzx2MkS2VgziL2Ai6EH/idgNmElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGa1dcADGp7coLjs3vFe1jr5FArixMPZhhHt2PpB+gY=;
 b=gnm1kRyYjSJxZiEPF/M4d8Mp5UHUBGfngnU079dI18P4eI7lRwYDESCSHf8tTCYS8Ch3kESZoTjSwc168jdRbTZNwXLBfEh1cvQCEPOv6Apg2ZDGOIRBMzK577OYd0UFzk8LGtOS/WMb12ghHytjMQHvp6doZE6Fpxt2eUAtu54=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 03/14] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove)
 support for ARM
Thread-Topic: [PATCH v4 03/14] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove)
 support for ARM
Thread-Index: AQHXuRZ6OQMJi407TUqV/v+mB83zX6vDgdCAgACLbIA=
Date: Tue, 5 Oct 2021 08:05:07 +0000
Message-ID: <50158C0B-C660-4960-8600-A73A28CD149B@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <99ee039a6cdd9ac7d54f1f01649d1dd3eeea3763.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041639560.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110041639560.3209@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d7ba3079-aa7c-44ca-2880-08d987daecf8
x-ms-traffictypediagnostic: AM6PR08MB4357:|VE1PR08MB5853:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB58532E302D081585B4D1AAFDFCAF9@VE1PR08MB5853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5hiGsAjygpAR/+pdiYFnor1ZxDe1Vr1wOr1wlrfcASbcD4I2OpXmVKp6ZzR7NrpQOSL/YHOVqLZAMudHOZgThu6f6xH9OVqnFI0XZ43E+Kc//0tvR9DMhyhcTCU+CsbJyKL7vzSUU9kjwbayIozOtlsYAG1pctUv+1dNyVt93/jbLfc3lVPObParwjm5rrCbHFYPCa0xO4DbQJSNOG62HwBfWWAjOyhzXXw3oQRS/kRcQbbiEGMLw1FY3BwmzC6ksNzgyi0YaVSTUM71O8CV1THEDHoxH8AnTrendoRjD2Q7KSxI+Z+hXJ/njL55UuyFcwx9DDNjpke4thnwr9yZ40GrVi2rMGAkLOBSLku3ZHiIedkb1YUDpEwJPWCGWPq8g1rXksF1D8nClTMxF7MefSq3R7Ywf6J/wiVoT1JlWdQdfFvaLyJgQKgcDzcvVXBsDp1BS4IzLWlpJuAQblhjeXexJ/9ZtJgCcMTyT+LAJAl0rDYb4NXzkgt2/S/63jJlyYgccM5uXBKCEddTaLm8l+JKnHikrXnvFWB3KAaGkDhhZ6diIQ3omUnrHRUgcIpZd4oKV5t8pOH+odzaJAx4k8JS95MWn1VMYEc+F9kbgi/QfaJgWVSLpzdpHJk1ZjoWh2kPkcYqmmStRkLXvKF5TjIaQsgbmFmVIqhA02TGtMXBtp8YnHGJqMoZxeQDMrFrt2SQrgGZopN/id2If8qfHhl66L7/WJFG4cplq02R1fTST+Uv7TYN+92BY9qEeqmK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(26005)(5660300002)(38070700005)(4326008)(83380400001)(2616005)(186003)(508600001)(8676002)(316002)(7416002)(38100700002)(2906002)(122000001)(8936002)(86362001)(76116006)(91956017)(71200400001)(33656002)(53546011)(66476007)(66556008)(66946007)(6512007)(6506007)(66446008)(64756008)(54906003)(36756003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <14492B373725984DB977E0BEE0A9F448@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4357
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ddf35a63-db3e-4aa6-cba8-08d987d6d862
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SEeD12OWNew6XqCAM2hIaIErotUab2ejtKxVBxlENnoDl9k33tQ7mhZZ8HmrlBKi1/jhc8T5ShtKEvNr6zN8fR0d/Li/AQ8Vjkj+1jvfFwpVt2SbD1O80g9KNL7KIAVHTvZlWwr0N6AIgTWxlGVVa2UUDjeXDTeJt/qKsPzIhUJE/R7vgFmhzYqTh07vdIdWjCdNvxTphiV7zddwMzbdOVktqd6dOZLqSYFs+VY2gc3SrPgJno/pSvAPyHDQIDQnk4SxZRX7BU6snWXj6MsivKcA2R5RDOARocIaWc2zXOMJXF45O4jRbARRzWdRNk0hm4AeCSpknDAeTwyjCJiWzHaY4BPN0M2pWdMH2dNMUEL7eRvEAHX90Lt07UiYaJt1Ra5+ZE75UrwJ4b2JDrE2aThTWU4cIqSxRaEKOHGKbqHMvty3TH5EWX82/RGI/lWvaPZeFijJ9bt98V2CGsF7xZQz2ZtsXtCeNEccAgsvXDue3VT7vIqvI8xrKgUOxWdQzuhKb/Yw9WuPFM9TMtBXsQoCCa65eF00zSnkI6Q/7PRisppIA759a9BGRCpgqTWuW6aaMpcM/dnGSeVw/CAFKGixljBoBC6qMZfYxavkR3Wm5YbIU6BNFqEM1/bYTGPzWWbMDmbG28kzu4K6aECD15ux1p9LZetaKbdv9x1uETrT8+PkqgRQfBfrXH31oMVkzyq9EWa46xhCxmXTbLUfNw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(5660300002)(86362001)(508600001)(83380400001)(33656002)(81166007)(82310400003)(6862004)(36756003)(8936002)(26005)(6512007)(70206006)(316002)(2616005)(70586007)(6486002)(2906002)(6506007)(53546011)(36860700001)(356005)(186003)(336012)(8676002)(54906003)(47076005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 08:34:19.7852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ba3079-aa7c-44ca-2880-08d987daecf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5853

Hi Stefano,

> On 5 Oct 2021, at 12:46 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Mon, 4 Oct 2021, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
>>=20
>> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
>>=20
>> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
>> and ARM, move the code to a common file to avoid duplication.
>>=20
>> There are other PHYSDEVOP_pci_device_* operations to add PCI devices.
>> Currently implemented PHYSDEVOP_pci_device_remove(..) and
>> PHYSDEVOP_pci_device_add(..) only as those are minimum required to
>> support PCI passthrough on ARM.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v4:
>> - Move file commom/physdev.c to drivers/pci/physdev.c
>> - minor comments.
>> Change in v3: Fixed minor comment.
>> Change in v2:
>> - Add support for PHYSDEVOP_pci_device_remove()
>> - Move code to common code
>> ---
>> ---
>> xen/arch/arm/physdev.c        |  5 +--
>> xen/arch/x86/physdev.c        | 52 +----------------------
>> xen/arch/x86/x86_64/physdev.c |  2 +-
>> xen/drivers/pci/Makefile      |  1 +
>> xen/drivers/pci/physdev.c     | 80 +++++++++++++++++++++++++++++++++++
>> xen/include/public/arch-arm.h |  4 +-
>> xen/include/xen/hypercall.h   | 11 +++++
>> 7 files changed, 100 insertions(+), 55 deletions(-)
>> create mode 100644 xen/drivers/pci/physdev.c
>>=20
>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>> index e91355fe22..d766978629 100644
>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -8,13 +8,12 @@
>> #include <xen/lib.h>
>> #include <xen/errno.h>
>> #include <xen/sched.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>=20
>>=20
>> int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> {
>> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd=
);
>> -    return -ENOSYS;
>> +    return pci_physdev_op(cmd, arg);
>> }
>>=20
>> /*
>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>> index 23465bcd00..ea38be8b79 100644
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -12,7 +12,7 @@
>> #include <asm/io_apic.h>
>> #include <asm/msi.h>
>> #include <asm/hvm/irq.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>> #include <public/xen.h>
>> #include <public/physdev.h>
>> #include <xsm/xsm.h>
>> @@ -480,54 +480,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM=
(void) arg)
>>         break;
>>     }
>>=20
>> -    case PHYSDEVOP_pci_device_add: {
>> -        struct physdev_pci_device_add add;
>> -        struct pci_dev_info pdev_info;
>> -        nodeid_t node;
>> -
>> -        ret =3D -EFAULT;
>> -        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>> -            break;
>> -
>> -        pdev_info.is_extfn =3D !!(add.flags & XEN_PCI_DEV_EXTFN);
>> -        if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> -        {
>> -            pdev_info.is_virtfn =3D 1;
>> -            pdev_info.physfn.bus =3D add.physfn.bus;
>> -            pdev_info.physfn.devfn =3D add.physfn.devfn;
>> -        }
>> -        else
>> -            pdev_info.is_virtfn =3D 0;
>> -
>> -        if ( add.flags & XEN_PCI_DEV_PXM )
>> -        {
>> -            uint32_t pxm;
>> -            size_t optarr_off =3D offsetof(struct physdev_pci_device_ad=
d, optarr) /
>> -                                sizeof(add.optarr[0]);
>> -
>> -            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
>> -                break;
>> -
>> -            node =3D pxm_to_node(pxm);
>> -        }
>> -        else
>> -            node =3D NUMA_NO_NODE;
>> -
>> -        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info,=
 node);
>> -        break;
>> -    }
>> -
>> -    case PHYSDEVOP_pci_device_remove: {
>> -        struct physdev_pci_device dev;
>> -
>> -        ret =3D -EFAULT;
>> -        if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>> -            break;
>> -
>> -        ret =3D pci_remove_device(dev.seg, dev.bus, dev.devfn);
>> -        break;
>> -    }
>> -
>>     case PHYSDEVOP_prepare_msix:
>>     case PHYSDEVOP_release_msix: {
>>         struct physdev_pci_device dev;
>> @@ -663,7 +615,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>>     }
>>=20
>>     default:
>> -        ret =3D -ENOSYS;
>> +        ret =3D pci_physdev_op(cmd, arg);
>>         break;
>>     }
>>=20
>> diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physdev=
.c
>> index 0a50cbd4d8..e3cbd5ebcb 100644
>> --- a/xen/arch/x86/x86_64/physdev.c
>> +++ b/xen/arch/x86/x86_64/physdev.c
>> @@ -9,7 +9,7 @@ EMIT_FILE;
>> #include <compat/xen.h>
>> #include <compat/event_channel.h>
>> #include <compat/physdev.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>=20
>> #define do_physdev_op compat_physdev_op
>>=20
>> diff --git a/xen/drivers/pci/Makefile b/xen/drivers/pci/Makefile
>> index a98035df4c..972c923db0 100644
>> --- a/xen/drivers/pci/Makefile
>> +++ b/xen/drivers/pci/Makefile
>> @@ -1 +1,2 @@
>> obj-y +=3D pci.o
>> +obj-y +=3D physdev.o
>> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
>> new file mode 100644
>> index 0000000000..4f3e1a96c0
>> --- /dev/null
>> +++ b/xen/drivers/pci/physdev.c
>> @@ -0,0 +1,80 @@
>> +
>> +#include <xen/guest_access.h>
>> +#include <xen/hypercall.h>
>> +#include <xen/init.h>
>> +
>> +#ifndef COMPAT
>> +typedef long ret_t;
>> +#endif
>> +
>> +ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>> +{
>> +    ret_t ret;
>> +
>> +    switch ( cmd )
>> +    {
>> +    case PHYSDEVOP_pci_device_add: {
>> +        struct physdev_pci_device_add add;
>> +        struct pci_dev_info pdev_info;
>> +        nodeid_t node =3D NUMA_NO_NODE;
>> +
>> +        ret =3D -EFAULT;
>> +        if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>> +            break;
>> +
>> +        pdev_info.is_extfn =3D (add.flags & XEN_PCI_DEV_EXTFN);
>> +        if ( add.flags & XEN_PCI_DEV_VIRTFN )
>> +        {
>> +            pdev_info.is_virtfn =3D true;
>> +            pdev_info.physfn.bus =3D add.physfn.bus;
>> +            pdev_info.physfn.devfn =3D add.physfn.devfn;
>> +        }
>> +        else
>> +            pdev_info.is_virtfn =3D false;
>> +
>> +#ifdef CONFIG_NUMA
>> +        if ( add.flags & XEN_PCI_DEV_PXM )
>> +        {
>> +            uint32_t pxm;
>> +            size_t optarr_off =3D offsetof(struct physdev_pci_device_ad=
d, optarr) /
>> +                                sizeof(add.optarr[0]);
>> +
>> +            if ( copy_from_guest_offset(&pxm, arg, optarr_off, 1) )
>> +                break;
>> +
>> +            node =3D pxm_to_node(pxm);
>> +        }
>> +#endif
>> +
>> +        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info,=
 node);
>> +        break;
>> +    }
>> +
>> +    case PHYSDEVOP_pci_device_remove: {
>> +        struct physdev_pci_device dev;
>> +
>> +        ret =3D -EFAULT;
>> +        if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>> +            break;
>> +
>> +        ret =3D pci_remove_device(dev.seg, dev.bus, dev.devfn);
>> +        break;
>> +    }
>> +
>> +    default:
>> +        ret =3D -ENOSYS;
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
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
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm=
.h
>> index 6b5a5f818a..d46c61fca9 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -107,7 +107,9 @@
>>  *   All generic sub-operations
>>  *
>>  *  HYPERVISOR_physdev_op
>> - *   No sub-operations are currenty supported
>> + *   Exactly these sub-operations are supported:
>> + *   PHYSDEVOP_pci_device_add
>> + *   PHYSDEVOP_pci_device_remove
>>  *
>>  *  HYPERVISOR_sysctl
>>  *   All generic sub-operations, with the exception of:
>> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
>> index 3771487a30..7096cc4fe4 100644
>> --- a/xen/include/xen/hypercall.h
>> +++ b/xen/include/xen/hypercall.h
>> @@ -45,6 +45,17 @@ extern long
>> do_platform_op(
>>     XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
>>=20
>> +#ifdef CONFIG_HAS_PCI
>> +extern long
>> +pci_physdev_op(
>> +    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
>> +#else
>> +static inline long pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void)=
 arg)
>> +{
>> +    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd=
);
>> +    return -ENOSYS;
>> +}
>> +#endif
>=20
> Everything looks good up until here and you seemed to have addressed
> Jan's comments well.
>=20
> However, for this last change to hypercall.h: hypercall.h doesn't seem
> to be the right place to add the static inline stub for the
> !CONFIG_HAS_PCI case.=20
>=20
> Given that only ARM needs the !CONFIG_HAS_PCI stub, I would add it
> directly to xen/arch/arm/physdev.c. Or just add an #ifdef directly
> within do_physdev_op in xen/arch/arm/physdev.c.

Ack . I will modify the code based on your suggestion.

Regards,
Rahul


