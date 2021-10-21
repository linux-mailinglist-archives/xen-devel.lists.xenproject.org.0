Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE6436293
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 15:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214389.372914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdXv8-0000Bj-BP; Thu, 21 Oct 2021 13:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214389.372914; Thu, 21 Oct 2021 13:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdXv8-00008e-8R; Thu, 21 Oct 2021 13:15:46 +0000
Received: by outflank-mailman (input) for mailman id 214389;
 Thu, 21 Oct 2021 13:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wrrh=PJ=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mdXv7-00008Y-1a
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 13:15:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32d5f673-5a69-472f-93df-f8c78dac1184;
 Thu, 21 Oct 2021 13:15:43 +0000 (UTC)
Received: from AS8PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:20b:31e::8)
 by PA4PR08MB6125.eurprd08.prod.outlook.com (2603:10a6:102:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 13:15:40 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::1a) by AS8PR04CA0093.outlook.office365.com
 (2603:10a6:20b:31e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 21 Oct 2021 13:15:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 13:15:40 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Thu, 21 Oct 2021 13:15:40 +0000
Received: from ac887a8fc512.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E261F624-C81A-426D-812F-A0F21421F60D.1; 
 Thu, 21 Oct 2021 13:15:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac887a8fc512.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Oct 2021 13:15:26 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6825.eurprd08.prod.outlook.com (2603:10a6:10:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 13:15:24 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 13:15:23 +0000
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
X-Inumbo-ID: 32d5f673-5a69-472f-93df-f8c78dac1184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbAihz/x6+FQaM93I6Lv4PIswepqt8mIpMxvUa2xX7o=;
 b=mKoV5ir1T3mQ6+hKm2pYUJWb/rKNUWDaXhCm32l5XjMVkwCPKVQtdqETzc2fqXf/c6e6qUv1dMofTUrjV4SSmeK3i7J53IdzpmubIUk6pTq1b4UXqGfz0VEiaD9+9u7W11+jdHiqLnI+R258QJsXjeqLBl+OfsWwSc2zHSgb3EM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a93e5592abe25937
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3pUvR67IBvRTo9fRDwgnRj2VcmCu5LSGp+PwqiWOmRJOxDN9IJNaFCrFn7aOfokXYZ2ZPpbS5OQeAePHVMWAN5OspFeHXkJTZti2qjsnIihT65zcZ8SztcL5908V3Ne32dprFBQ/o/0S+7oe5bjArBrBP4dl+zbPqbD1wDNcAt+Fr2pLDDMUzE7yIno48hIn/ozudDJrZMUAU1TPnGNFvTHpvoRRUtlYP87hS5gh1BPN+ztT1OID4zrmRyiSl8D2gwJUWzyI2opdGrR8zV84MJ5gkKFFYEI5i8Ha+R+SSIPfdnfpEOZ92QLOfgJLaYrE5BFfEQxr5X3RL+nbswYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbAihz/x6+FQaM93I6Lv4PIswepqt8mIpMxvUa2xX7o=;
 b=ggqBCoUIgAyZRVue6p19AWgks4lJQnc1304JP4AbUYGZSA+XDU+mIOItuAod6jJzJ/oYbmC/AQ3OzIemxhgL4S1m4OBRVczuQGZnD82qdxfn4LyFcpNSxqRN0tCGZ8zrF+c3KF8Po4oVD/6wsGiLO1YB4sVs+F/BrInjLKuZ/Sl8tG/HD1bl23nzeRprDzQPEbmozOwUtEyT9Ecwj9z/batsEe8rCGi0St+kcxfR8Pj4R1/GvktlJVzd3jUGAUvh2v6v37mz+2i8EVw3SOFDqMTaFOHhwzVuWvxfAjVZk/hMr2cL5pTBwBCYDSxTXO+ZnZpTeqSKG33zivO6CFWlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbAihz/x6+FQaM93I6Lv4PIswepqt8mIpMxvUa2xX7o=;
 b=mKoV5ir1T3mQ6+hKm2pYUJWb/rKNUWDaXhCm32l5XjMVkwCPKVQtdqETzc2fqXf/c6e6qUv1dMofTUrjV4SSmeK3i7J53IdzpmubIUk6pTq1b4UXqGfz0VEiaD9+9u7W11+jdHiqLnI+R258QJsXjeqLBl+OfsWwSc2zHSgb3EM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: xen/arm: Missing appropriate locking for the IOMMU (WAS Re:
 [PATCH v5 02/11] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for
 ARM)
Thread-Topic: xen/arm: Missing appropriate locking for the IOMMU (WAS Re:
 [PATCH v5 02/11] xen/arm: Add PHYSDEVOP_pci_device_(*add/remove) support for
 ARM)
Thread-Index: AQHXxl4YkvgVlFH7LEi1mWK2psfiI6vdbqqA
Date: Thu, 21 Oct 2021 13:15:21 +0000
Message-ID: <75784F90-198E-400D-877B-CF62ED69F409@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <0dc4423b2e20c1eb40c961b211b18ed041f707b7.1633540842.git.rahul.singh@arm.com>
 <99f6d6c4-bcc6-03a9-ef9b-0d01be0fd7f1@xen.org>
In-Reply-To: <99f6d6c4-bcc6-03a9-ef9b-0d01be0fd7f1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fb3e3727-ec4c-4dd7-8c9f-08d99494e15b
x-ms-traffictypediagnostic: DB9PR08MB6825:|PA4PR08MB6125:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB612507F95EA756B697EA066C9DBF9@PA4PR08MB6125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ok0ehB27jp+A/25hOLXlfBjJhxSNdTrLn6MBkqi/3LeIcOhWrHqDluyOuAC888zhqEzr1eNF/9g1QMwo6nJijBnz7Dtk1M3FTADrTEFaE2Jsd93eaiwtFtSbWqklyKb2BCipRVKqHncdBMdBnb/c/y4xQqPjmZMRJppngeM7okgPTCAbi21hep94ZhReTTyxMvImeDFYwzJYz1eS2FyBzMN4W+PrSuua10wn9DXVOQ5uRz+YooQpr52EdXzf5EppY2K8pZs3Bv7oJgiwSgxj+sOc7eEdOLDK6+lw7isgCGo1ftZ7d2WRKfyKcCHdzZrYj/FuP0wjKrLaNVDRuqCIHG6GsdCyJXMN8I56Xh9Pav34/DZK7vJtRUp+wW3D8rFGGnGLERk17YHXF5vFmbxvkFet4AgycGAfH60m4td3bTkEkvtOTQO85qZxpMXMsZB9WOQQkWsPlJhdRH2VW6Gj7zVFBYzykSmypWXVWHcxLQVn5ytHIGQ8fc0r7vxXLZY1vle1Q87no3M4nJ3mErA0zFDJqaUMpxWRszJeZXECpDWJTM8fOiS7/jxa1cvxVgJW9txVoFnWhRXqRPwUeSdooeW++gaDujTCATWTi0A8qSgSE9+g4g+DO4jsSZ0q4K+60ZJmVvkrYmgaZoqic8gXp2u2JYcYqfiqlf6HzlJziVCgC01VYPUkZQ7CDha5raGl5XhHX0gXoqJq5modrRoWQ1c35ftR8oXWQf24ctPTl3WxTRs1r22uBdHT+RfgZ4sb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66476007)(64756008)(6506007)(66446008)(122000001)(66556008)(66946007)(508600001)(36756003)(6512007)(6916009)(91956017)(2616005)(33656002)(186003)(26005)(53546011)(76116006)(8936002)(8676002)(316002)(71200400001)(86362001)(7416002)(2906002)(6486002)(4326008)(38070700005)(83380400001)(5660300002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <005F5841DC1A4C4DB5D17B2C4191E22D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fb7b4d6-ffb9-4b9a-771a-08d99494d724
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRg8pPjamfO/YlfPo4FlYMOwfJVcHG0NlIyudg2lzck1jU9GSNqAGRaD5FXejL8ys9DryMGhokkyACQRAQ3Gbyk8UMVQY6Ku92rNqNsTEtGbfKNWcUczFGTYf/qr3yogIUlZrxsjWTUA/7x0shYs3BXN7zapMIR+aPisveEq0li7uR5KJGw014I1SIFOc2KDhaTk86S4oP4uUbp4gW8nL9+V/QODyvppzeT58Sb2TJjeDrgvxcMub5qaMOSMGQDtTmbE2fd+KyWSN2QDA1Z0Dz3N8520vdzKun+3/bHDBsagJew62S8S2Lk4W/q5EWMJBQNE6Mf5RBV6MMqwl4q8qjduTaBU4ObwE7JOx1cAC0sY3ERP8+xTbF5qBWIm9+/ET5YYovSwo5Fx1vEncXU0zcXNx3LNhVfXFr+J/diVD/2ULbrEl8X3mMhfEzXUvK2wfHqdrlZ3Wv+6fwUkAhqaPiczW1HrnYdfWnKcQG4htpdyiF4B1aAUoXqXDfVnyIcVKsSNNd8vxjzjAV4ZoiqxaMr2IUMuuXiY0vihBtemEG+ogErd2jHEnKh9Yod3u9kEaybp/6a4EFSLRs92Ig8DKG1xw2YoQ03fm9E2qTcNpcm2y2+bMR4e/qJDQ/uWA8l2u1Gdw5pJU6SmcYi0auMtpFd5mTofc+x9b/U28khs95BVZwG0UeVqhKXpbha+9vqz83TjpOCeDYvl8lJNhEd6Dg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(356005)(6862004)(4326008)(53546011)(6506007)(36756003)(6486002)(47076005)(2906002)(2616005)(33656002)(82310400003)(70586007)(316002)(70206006)(107886003)(54906003)(5660300002)(86362001)(81166007)(36860700001)(336012)(508600001)(26005)(8936002)(8676002)(6512007)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 13:15:40.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3e3727-ec4c-4dd7-8c9f-08d99494e15b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6125

Hi Julien,

> On 21 Oct 2021, at 10:28, Julien Grall <julien@xen.org> wrote:
>=20
> Hi all,
>=20
> While going through the passthrough code. I noticed that we don't have a =
common lock for the IOMMU between the PCI and DT code.
>=20
> This is going to be an issue given it would technically be possible to ad=
d a PCI device while assigning a DT.
>=20
> Rahul, Bertrand, Oleksandr, can you have a look at the issue?

Yes we can have a look at this.

Right now pci device add is done by dom0 so I do not think we have an issue=
 in practice unless I wrongly understood something.
But for sure in theory yes we need to look at this.

Cheers
Bertrand=20

>=20
> Cheers,
>=20
> On 06/10/2021 18:40, Rahul Singh wrote:
>> Hardware domain is in charge of doing the PCI enumeration and will
>> discover the PCI devices and then will communicate to XEN via hyper
>> call PHYSDEVOP_pci_device_add(..) to add the PCI devices in XEN.
>> Also implement PHYSDEVOP_pci_device_remove(..) to remove the PCI device.
>> As most of the code for PHYSDEVOP_pci_device_* is the same between x86
>> and ARM, move the code to a common file to avoid duplication.
>> There are other PHYSDEVOP_pci_device_* operations to add PCI devices.
>> Currently implemented PHYSDEVOP_pci_device_remove(..) and
>> PHYSDEVOP_pci_device_add(..) only as those are minimum required to
>> support PCI passthrough on ARM.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v5:
>> - Move the pci_physdev_op() stub to xen/arch/arm/physdev.c.
>> Change in v4:
>> - Move file commom/physdev.c to drivers/pci/physdev.c
>> - minor comments.
>> Change in v3: Fixed minor comment.
>> Change in v2:
>> - Add support for PHYSDEVOP_pci_device_remove()
>> - Move code to common code
>> ---
>> ---
>>  xen/arch/arm/physdev.c        |  6 ++-
>>  xen/arch/x86/physdev.c        | 52 +----------------------
>>  xen/arch/x86/x86_64/physdev.c |  2 +-
>>  xen/drivers/pci/Makefile      |  1 +
>>  xen/drivers/pci/physdev.c     | 80 +++++++++++++++++++++++++++++++++++
>>  xen/include/public/arch-arm.h |  4 +-
>>  xen/include/xen/hypercall.h   |  4 ++
>>  7 files changed, 96 insertions(+), 53 deletions(-)
>>  create mode 100644 xen/drivers/pci/physdev.c
>> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
>> index e91355fe22..f9aa274dda 100644
>> --- a/xen/arch/arm/physdev.c
>> +++ b/xen/arch/arm/physdev.c
>> @@ -8,13 +8,17 @@
>>  #include <xen/lib.h>
>>  #include <xen/errno.h>
>>  #include <xen/sched.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>      int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  {
>> +#ifdef CONFIG_HAS_PCI
>> +    return pci_physdev_op(cmd, arg);
>> +#else
>>      gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=3D%d: not implemented\n", cmd=
);
>>      return -ENOSYS;
>> +#endif
>>  }
>>    /*
>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>> index 23465bcd00..ea38be8b79 100644
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -12,7 +12,7 @@
>>  #include <asm/io_apic.h>
>>  #include <asm/msi.h>
>>  #include <asm/hvm/irq.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>  #include <public/xen.h>
>>  #include <public/physdev.h>
>>  #include <xsm/xsm.h>
>> @@ -480,54 +480,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM=
(void) arg)
>>          break;
>>      }
>>  -    case PHYSDEVOP_pci_device_add: {
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
>>      case PHYSDEVOP_prepare_msix:
>>      case PHYSDEVOP_release_msix: {
>>          struct physdev_pci_device dev;
>> @@ -663,7 +615,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>>      }
>>        default:
>> -        ret =3D -ENOSYS;
>> +        ret =3D pci_physdev_op(cmd, arg);
>>          break;
>>      }
>>  diff --git a/xen/arch/x86/x86_64/physdev.c b/xen/arch/x86/x86_64/physde=
v.c
>> index 0a50cbd4d8..e3cbd5ebcb 100644
>> --- a/xen/arch/x86/x86_64/physdev.c
>> +++ b/xen/arch/x86/x86_64/physdev.c
>> @@ -9,7 +9,7 @@ EMIT_FILE;
>>  #include <compat/xen.h>
>>  #include <compat/event_channel.h>
>>  #include <compat/physdev.h>
>> -#include <asm/hypercall.h>
>> +#include <xen/hypercall.h>
>>    #define do_physdev_op compat_physdev_op
>>  diff --git a/xen/drivers/pci/Makefile b/xen/drivers/pci/Makefile
>> index a98035df4c..972c923db0 100644
>> --- a/xen/drivers/pci/Makefile
>> +++ b/xen/drivers/pci/Makefile
>> @@ -1 +1,2 @@
>>  obj-y +=3D pci.o
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
>>   *   All generic sub-operations
>>   *
>>   *  HYPERVISOR_physdev_op
>> - *   No sub-operations are currenty supported
>> + *   Exactly these sub-operations are supported:
>> + *   PHYSDEVOP_pci_device_add
>> + *   PHYSDEVOP_pci_device_remove
>>   *
>>   *  HYPERVISOR_sysctl
>>   *   All generic sub-operations, with the exception of:
>> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
>> index 3771487a30..07b10ec230 100644
>> --- a/xen/include/xen/hypercall.h
>> +++ b/xen/include/xen/hypercall.h
>> @@ -45,6 +45,10 @@ extern long
>>  do_platform_op(
>>      XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
>>  +extern long
>> +pci_physdev_op(
>> +    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
>> +
>>  /*
>>   * To allow safe resume of do_memory_op() after preemption, we need to =
know
>>   * at what point in the page list to resume. For this purpose I steal t=
he
>=20
> --=20
> Julien Grall


