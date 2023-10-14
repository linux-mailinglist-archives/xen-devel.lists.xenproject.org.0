Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19117C91B7
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 02:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616978.959419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrSGM-0007EZ-51; Sat, 14 Oct 2023 00:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616978.959419; Sat, 14 Oct 2023 00:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrSGM-0007Cl-2O; Sat, 14 Oct 2023 00:12:14 +0000
Received: by outflank-mailman (input) for mailman id 616978;
 Sat, 14 Oct 2023 00:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUN7=F4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrSGK-00070e-UE
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 00:12:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51737f5e-6a26-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 02:12:11 +0200 (CEST)
Received: from AM6PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:2e::31)
 by VI1PR08MB10101.eurprd08.prod.outlook.com (2603:10a6:800:1ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 00:12:05 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::f0) by AM6PR05CA0018.outlook.office365.com
 (2603:10a6:20b:2e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46 via Frontend
 Transport; Sat, 14 Oct 2023 00:12:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.16 via Frontend Transport; Sat, 14 Oct 2023 00:12:04 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Sat, 14 Oct 2023 00:12:04 +0000
Received: from 95be6c1305f7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 735F6F3B-7F3B-4D57-BBA8-DF923F7F724C.1; 
 Sat, 14 Oct 2023 00:11:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95be6c1305f7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Oct 2023 00:11:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7538.eurprd08.prod.outlook.com (2603:10a6:20b:482::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Sat, 14 Oct
 2023 00:11:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Sat, 14 Oct 2023
 00:11:56 +0000
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
X-Inumbo-ID: 51737f5e-6a26-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DILzAxlvQ1tWonfVC8Tjwv+XhzTYjjJqWANPCygnLDk=;
 b=mAqaflf+tVJg8KZvlRIBWD/DLu5PkK22T5HSNO///c2CVZ5krih/q0zrNSGn5aFp9+KrMS531PJz/EeNUgMSVN5cQ86nVE0vxcqKi7ZrGYDgNWCdSR3bMs+QKn5RLBf5cz1UROZzUuUI2jqw5fsAEe7Dui9LfjTcCkAlpywfYi4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3970dd7d22ca0f74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyJlTNKH2th9JZo7A0hihtIg4pmAxMdCNyxXFc5a1MjhOzM9H5Wu0Lx/aMYnLu+TnK56gxQ9HX06TWG0bKYaTjUW16MCkrE+jFeFQ/S1E5N0X8oa/SE58y9I3uLSiZn8DTciQEq31OpU7o6iKuJkqVcbKemxxYwJ2nqGRN3deeKm5qJzYQnFr7ryrmOa14RiEJsXDB6GpwFwikuLBgNzKTFM/NGLNlOVLaRq14DUrw9A0ykGBgAwNO2e9RnFf5ZYumlKY9ZqPpfiuEnj0DMUazeBg6Tkj5G9OOUWut15NzO3o1ftce0G9H1lpFP+2Ljbd41Ea5FU8j8o+SbVNa+ymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DILzAxlvQ1tWonfVC8Tjwv+XhzTYjjJqWANPCygnLDk=;
 b=T69NjHh7x91hSk4cDcU3GDYuxI1xATC0CDzNx2ANmIOD/DVI6Gisg/8VC3eQ66lC5Uz3L6lqL2cjQIyAva9j0k4OGT2sMiewjxIckhNVNkL/pTPAYFmkYIH/MLMymHQYA+OEyYRVxHNDa3bc/y3AuLYOF93hnz9CmxOz47kpP6R5l9UHoGkAn0KAlmLIUsUoM8mgedMyEoLQ5thYH1IO0wBdDzD/OdWTy9QFR0vH8S9N+6cZXphICG391SzssvPv/QdZUJBrapP8vVrhMcpDQRNyHt3vIvLfqmuZmk7/adJ8oxWPuGpJaCq9Xozygl9SaPVMT2OyGNM+w6v8eItRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DILzAxlvQ1tWonfVC8Tjwv+XhzTYjjJqWANPCygnLDk=;
 b=mAqaflf+tVJg8KZvlRIBWD/DLu5PkK22T5HSNO///c2CVZ5krih/q0zrNSGn5aFp9+KrMS531PJz/EeNUgMSVN5cQ86nVE0vxcqKi7ZrGYDgNWCdSR3bMs+QKn5RLBf5cz1UROZzUuUI2jqw5fsAEe7Dui9LfjTcCkAlpywfYi4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 7/8] xen/arm: Rename init_secondary_pagetables() to
 prepare_secondary_mm()
Thread-Topic: [PATCH v7 7/8] xen/arm: Rename init_secondary_pagetables() to
 prepare_secondary_mm()
Thread-Index: AQHZ+kyDmsm+JuKZJU+E4crrwIz5KbBIBiqAgAAAIYCAAGshgA==
Date: Sat, 14 Oct 2023 00:11:56 +0000
Message-ID: <D6DF80B2-BBEF-41DE-AB1C-7962F9FC6B4E@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-8-Henry.Wang@arm.com>
 <92c939fb-a8a5-4bbb-8d80-844a70f9b3e5@xen.org>
 <b52f8338-ab8d-4eac-b60b-34fd163fb03e@xen.org>
In-Reply-To: <b52f8338-ab8d-4eac-b60b-34fd163fb03e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7538:EE_|AM7EUR03FT059:EE_|VI1PR08MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: 863ed5bc-e4ea-4e44-2e8c-08dbcc4a327a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EKJ+3OC46o9LdpQ9ZcYOJ/Rc+jBZf1mRUcZXaCAWBCU6sHNSV+ovqMaG12X7FUCQ5BJGJtDHsR+FU38F3AODaMuzTEhvvS1tcgNEN5y6qxWQsAB/Dqg/zDsAZcV5jvdZrD/QtSXQU8LdC8GRMZquDl7v8flUBDpOIYysF0SitV+9x5xaltDC4QFCLdXO4NujZOqBETuigKMPqt4qHlb/8tOVE5o1aDrJkBTL2ykRLf8yZ9eZr9yDphwNOHF2b/OUipPu6a/NJjSvFvt45wbTpkUWEXs61GrqhvnwIyGKCOzrfWw7THgfKgT9cvKt3SKTPMzQWQd7Ik1ztGMeAaHvYlsKRmXJnfGlvHRz1mlS90NAws9HVUNN/R1G/ABxVfSfU6NYVGVlBsJrjG8iJ6zfCX20YkpgDf6Uc/F/lR4O8g0OR0gxZULeNblfTg8WTQiO1iaS6teCN+/FwQ+qMYh8Awb+qepSEOKVm65q+nVK694mZ8+MN7i2wESBoCvQsvYnD6gEGXeuTnjNkRO/huFHmMiXzxabaYN/6JOrkTGmgs13yuvaQ3Rrf158o30LrY2EdLtGScEPKTKB5DRmzIvtEpm94mOehc1NHnDQMZnbQ4EjtGOABjhlkeC4WNGwU4OzoH8jwbyp6qI6aEIffQ5pLsL9NJmrMI/qsn7Lhr6YQSA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(8936002)(4326008)(316002)(53546011)(6506007)(41300700001)(5660300002)(64756008)(76116006)(91956017)(66946007)(66446008)(66476007)(54906003)(6916009)(66556008)(478600001)(6486002)(86362001)(38100700002)(83380400001)(71200400001)(6512007)(33656002)(26005)(36756003)(2616005)(122000001)(38070700005)(2906002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <41C276C069858548A39F8CCF743DE3C5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b80fed6-c539-4cbc-d6b5-08dbcc4a2d5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I0XCqYweBoEyPmR9Ynabrw0obr78bqoyDaSdgmqcmEQHIaK9tTaURXnISWbOXEVZap1f31m5tuOTOROlV4XDlt6JGtThvPwSdDqKktn9o2pZCiIGhGaQHsvn37onE7Lx4vLx2rzC0UbBILMDGoezA+AD1RfGGnpNh48a+khIDE42akB9L2XAr4jrfviTAIuzyoR6CMtWLrIbp4OVsjdV7Qmhsj0rXqeLT3yhQ7msRNrCEHWlLmjMA3FcYsfG1C6aAvyMZdbUjflVL4OLXzp7RdxdKt5o4pk+egRT8DI5kHXq80rfaq4Sz51kT/fEGbjstNg0gbrx5pjHHFzSTJMA/JjCQgP8gaNnlyOEU2iHvv4UFZ8JhkNTIvNQRoB6212zkNlAjFqeZVaP/6yiHPzWJxVfTEE7dcGke+7WRNWh1And3QDNI/2cVXgDbJ93a6DNtqb94SQYvyvQIXocQkBcAJfoq36KOWNHvc6VVeLZHxbzvbbyn6oQlRiXgAbAm4+g6Ti2ysd9hGkbgkrSLQXLnJrg5NwlqRDDl8Tw+VHI3MjaMYf7IHwImSei+HIUUU2OjRm+YJXhJAR2otE4Wy3kFsjOHM1kjAqOIDdonaiAS1UzY4xZwxaz7yXcmui042xrR+yvTiWykyWn+vclpyEK1emCQoqoQY4AEBqyuI7LK1SUTH/6AeC8AZROs8p1hsJP+ZjYVLegM0R2fBIWbgmOzCPmj5Rfu6bxa7cgWwDSYppk6o3gDYsehEF8NQXOBi16vfnMvmxMMJx57BC7/7t06A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(83380400001)(47076005)(6506007)(53546011)(478600001)(36860700001)(40460700003)(26005)(2616005)(336012)(40480700001)(82740400003)(6512007)(8936002)(33656002)(86362001)(2906002)(70206006)(41300700001)(8676002)(5660300002)(4326008)(6862004)(81166007)(36756003)(70586007)(316002)(54906003)(356005)(107886003)(6486002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:12:04.9102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 863ed5bc-e4ea-4e44-2e8c-08dbcc4a327a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10101

Hi Julien,

> On Oct 14, 2023, at 01:48, Julien Grall <julien@xen.org> wrote:
>=20
> On 13/10/2023 18:47, Julien Grall wrote:
>> Hi Henry,
>> On 09/10/2023 02:03, Henry Wang wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>=20
>>> init_secondary_pagetables() is a function in the common code path
>>> of both MMU and future MPU support. Since "page table" is a MMU
>>> specific concept, rename init_secondary_pagetables() to a generic
>>> name prepare_secondary_mm() as the preparation for MPU support.
>>>=20
>>> Take the opportunity to fix the incorrect coding style of the in-code
>>> comments.
>>>=20
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>> v7:
>>> - No change.
>>> v6:
>>> - Only rename init_secondary_pagetables() to prepare_secondary_mm().
>>> ---
>>>   xen/arch/arm/arm32/head.S     | 2 +-
>>>   xen/arch/arm/include/asm/mm.h | 8 +++++---
>>>   xen/arch/arm/mmu/smpboot.c    | 4 ++--
>>>   xen/arch/arm/smpboot.c        | 2 +-
>>>   4 files changed, 9 insertions(+), 7 deletions(-)
>>>=20
>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>> index 39218cf15f..c7b2efb8f0 100644
>>> --- a/xen/arch/arm/arm32/head.S
>>> +++ b/xen/arch/arm/arm32/head.S
>>> @@ -257,7 +257,7 @@ GLOBAL(init_secondary)
>>>   secondary_switched:
>>>           /*
>>>            * Non-boot CPUs need to move on to the proper pagetables, wh=
ich were
>>> -         * setup in init_secondary_pagetables.
>>> +         * setup in prepare_secondary_mm.
>>>            *
>>>            * XXX: This is not compliant with the Arm Arm.
>>>            */
>>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/m=
m.h
>>> index d23ebc7df6..db6d889826 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -204,9 +204,11 @@ extern void setup_pagetables(unsigned long boot_ph=
ys_offset);
>>>   extern void *early_fdt_map(paddr_t fdt_paddr);
>>>   /* Remove early mappings */
>>>   extern void remove_early_mappings(void);
>>> -/* Allocate and initialise pagetables for a secondary CPU. Sets init_t=
tbr to the
>>> - * new page table */
>>> -extern int init_secondary_pagetables(int cpu);
>>> +/*
>>> + * Allocate and initialise pagetables for a secondary CPU.
>>> + * Sets init_ttbr to the new page table.
>>> + */
>> AFAIU, with the renaming, you are trying to make the call MMU/MPU agnost=
ic. But the comment is still very tailored to the MPU. I would consider to =
move the comment to mmu/smpboot.c and replace this one with a generic comme=
nt. Something like:
>> /* Prepare the memory subystem to bring-up the given secondary CPU. */

Good suggestion! I will follow this in v8.

>=20
> I forgot to mention. With that:
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


