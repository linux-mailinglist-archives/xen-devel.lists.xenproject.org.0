Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BC783824
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 04:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588045.919481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYHME-00059g-Hq; Tue, 22 Aug 2023 02:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588045.919481; Tue, 22 Aug 2023 02:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYHME-00056W-DG; Tue, 22 Aug 2023 02:43:02 +0000
Received: by outflank-mailman (input) for mailman id 588045;
 Tue, 22 Aug 2023 02:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hUC=EH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYHMC-00056Q-Ha
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 02:43:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a257923-4095-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 04:42:58 +0200 (CEST)
Received: from AM0PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:208:1::14)
 by DB9PR08MB9705.eurprd08.prod.outlook.com (2603:10a6:10:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 02:42:55 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:1:cafe::cc) by AM0PR04CA0037.outlook.office365.com
 (2603:10a6:208:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 02:42:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Tue, 22 Aug 2023 02:42:53 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Tue, 22 Aug 2023 02:42:53 +0000
Received: from 2de5b0799983.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E290881E-C97D-4FDE-9BEE-95E1364DC09B.1; 
 Tue, 22 Aug 2023 02:42:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2de5b0799983.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 02:42:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10097.eurprd08.prod.outlook.com (2603:10a6:20b:63f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 02:42:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 02:42:37 +0000
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
X-Inumbo-ID: 9a257923-4095-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXrd6Ho9PBYykrx0+H6PFqj7CsmYZlUgMmxn7dsK4ww=;
 b=YFDGT2/3wkpMOAdt5hz4Zsji8bP1ruYQbAbjsmfQHGhu+wbi30YPWEbYWKGKX7K65vxxLk2nPX0fe/aq7LVLXcwfJubUs4KO/LcjyJCNP61gTAepOS+rguo9zfDqU9g/5JsAAciYqD+Kw+8BSw8mtlohQAJvqgQwWfgBeQpfdlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 052639f825cab308
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7O0wCvrPuZzLGfYSCQO4hHYEjoQMCxWT2G/TB4ejlr7bOIPr6XZWll/KI9vfGhfO70u93E5EmhZSMC11IV488UWE9CM9DQAUsGcdT47+jjZ4ZDKdPiXlBwNsieNFBw2pY4ViG0dTFZOjjJdZdI+2OFv2JG1by4g+t/sHqtGcah7oZYzmHd3pMB7ADUeQoDoK8n9SOINqekvcgZSAd6x4hgKIkUBWADVXGph15g0r2dq+LWu06y1A4QgYZKJD0e+OMrXYRCIvse81l4n4meeF6LsgGjOuK8nu0R+dgIgsWG7WHzJRc7M7+dV6YzIujJRONsfMsccnp7lXqVEZ+3Hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXrd6Ho9PBYykrx0+H6PFqj7CsmYZlUgMmxn7dsK4ww=;
 b=gN2Ih+pDZcwxPGauyh4rMiAQns4K7/e7zPAyN6qDoiV72hJLs36xi+kk2XDV9coKnhxKZH/ewcHdTU6FhNaYIjxZwWJUIDUID49jICTgSyTsiYyJy4S0SFTTGAHDyfHtKC8NiUYEIrIjNIVHkdFW6JmveugV/iQmdAL0wTAw86dRN3XMw8yndSlK5cpwYidbRraAUUbQ9O1hflfgNr480O/k/It92mgEvXUoMlyIox5h7Rl1iHTEg9+JJmc6j/gIl1zmDCuQer2w8ytKg2I8Jy3NomZbRUji4KS3HE+32IP/NNntNpj4AOi5NrqKxm/a1V5JvI1o6woRLbKgYNOLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXrd6Ho9PBYykrx0+H6PFqj7CsmYZlUgMmxn7dsK4ww=;
 b=YFDGT2/3wkpMOAdt5hz4Zsji8bP1ruYQbAbjsmfQHGhu+wbi30YPWEbYWKGKX7K65vxxLk2nPX0fe/aq7LVLXcwfJubUs4KO/LcjyJCNP61gTAepOS+rguo9zfDqU9g/5JsAAciYqD+Kw+8BSw8mtlohQAJvqgQwWfgBeQpfdlU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Thread-Topic: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Thread-Index: AQHZzmeE4KXhY3mNtkSLYSr+mWg0ta/1GdYAgACN7QA=
Date: Tue, 22 Aug 2023 02:42:37 +0000
Message-ID: <65B3F435-4086-4DDE-A050-A7B741D67973@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-9-Henry.Wang@arm.com>
 <7503cbad-a0b9-4683-880f-1099ad62f2f7@xen.org>
In-Reply-To: <7503cbad-a0b9-4683-880f-1099ad62f2f7@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10097:EE_|AM7EUR03FT018:EE_|DB9PR08MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: 611a58dc-6293-497c-ac5a-08dba2b97c20
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EG7RB9j5XFBXXiFmJUT367uec2+/Z6jm2sxy7C7OK1aUc4gHNjSRRn2S74uH8vFo0VBtHETj1aFSkOZe1SB/TTzpBX1CtM0Uvo4YfIcjXqN9eyM0k7og84ZenoMwwpFNNc1JgLY/6RyvzWVexK1ODb3KhRjyTdpgbvfHzKj4cXvW+kBFrs49cQHJnvEUopsGjKIrU5lHHMW5dttG/lnz2TtwKJ60ung4U7Bm9wM06JYhNs1dogLs3WhOAmiLVVOGGF7o0667AZ00Vaaru9xpA4z2TSqeep6XAbVVk7fD6nCHyY98zA5aGAyxphe4Zh41H4Umym2rN73PsVGTqyY03tka1BKSBW4QdSeOMut+5jvyvX6YGTrrR8OG273xyEsTKIf2bUyGlrbTaM2PW7p452rAVBwr+LhFqNsmNjI6Fj91oQem8g82Tdaxrz2kn36yY6p+f1uyMOdxtKWxeDcOj/fmPi3Jej5sh1mwvbDEjIc2/nBlxEYuDy9nTEaeLeMFCG/6BY9s/CIv1/w8uNFpqknhTuMAnm3CTsvNELPqAlJ/+gdaA29vjmtr2XWJgwrB1f+ZCWjqiGPI/Nvo9Rd7eRqrE53etI9eBG2gR2D+nF7kmUfwYWsrgwjwwU1ZMhST/a1dF/zIDhMZlf+iff8nKw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(6916009)(66446008)(76116006)(66476007)(66556008)(64756008)(316002)(66946007)(6512007)(91956017)(8676002)(8936002)(2616005)(4326008)(41300700001)(36756003)(122000001)(478600001)(71200400001)(38100700002)(38070700005)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(33656002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <264F5B5A660F224F96B177A2260E7DAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10097
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b020050-8b25-4f9b-ca06-08dba2b9725f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u6GZ8O9oE2hjArkHx487gAyNP7uY+slQUdg6WitHxagHgK0yIUKzVYGCLLEotdD+M8sBNkhuzIriZkJUoa42D0XxhmluA325sEWVQDrmyZY1Jmj0gkopS2Rekmjha/eMWmStGHfDylNO26w3YJxtsHiqaaOd/Z07Ax1dM8VVAFFDuODDnAU4ZAdgw//0R9a1HuIFgl5hg+pAghHvAMs69Fmw3nrDeBRtxf+DjNEYQjlJgBZ7mTh76HkPXBEhMWGoNKCKJR8iKf3PZxZnri7w95b42/ZCW9PHUEFhSkjq1jS3M29TmHRQtVDGiaLDTwv6lYXSbEEbJdZAYXbrchp32NEZzSWfoycwpY6PUwU/zvCV9+dC5vXmUQcZN9ULpCjqJiPJd1qrsUc9kbnXCl286YmgTEO2zEg64CUn2zkmyZpA3yHnEgmMVTZxgStdP5U+i0/uZT7RvsQDVgaAywIa7Pf6KmFYz7Pvdr4RrnGNft3WkkTFt4BMGNyxoNawXYsAe5rQmYxDR7JsjpokjAojny3IEm+6dkRO/+77Pj4nkZgj6WiWg2LB84Mv4PuRo/Q5Q9I99hAHyB6zj/d6s1yPBKZ2O86GdG7DAPtvsrTcfntiQEVsgvjFuxCou3als0PiWWiy6BTaFiGm2sMiQtm6qBl6OljppoXtrnj8yGcN8C8cTOvFlVegEEy2XqNrm8NZ2otfNu+YdjWkNthLvmqzDEist9aK/Qe3DkCtKMkGomM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(54906003)(70586007)(70206006)(316002)(6512007)(8676002)(8936002)(2616005)(6862004)(107886003)(4326008)(41300700001)(40460700003)(36756003)(82740400003)(356005)(81166007)(478600001)(53546011)(6506007)(40480700001)(6486002)(83380400001)(2906002)(86362001)(47076005)(36860700001)(336012)(5660300002)(33656002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 02:42:53.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 611a58dc-6293-497c-ac5a-08dba2b97c20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9705

Hi Julien,

> On Aug 22, 2023, at 02:14, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 14/08/2023 05:25, Henry Wang wrote:
>> From: Penny Zheng <penny.zheng@arm.com>
>>=20
>>  diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/a=
sm/fixmap.h
>> index 734eb9b1d4..5d5de6995a 100644
>> --- a/xen/arch/arm/include/asm/fixmap.h
>> +++ b/xen/arch/arm/include/asm/fixmap.h
>> @@ -36,12 +36,7 @@ extern void clear_fixmap(unsigned int map);
>>    #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
>>  -static inline unsigned int virt_to_fix(vaddr_t vaddr)
>> -{
>> -    BUG_ON(vaddr >=3D FIXADDR_TOP || vaddr < FIXADDR_START);
>> -
>> -    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
>> -}
>> +extern unsigned int virt_to_fix(vaddr_t vaddr);
>=20
> AFAICT, virt_to_fix() is not going to be implemented for the MPU code. Th=
is implies that no-one should call it.
>=20
> Also, none of the definitions in fixmap.h actually makes sense for the MP=
U. I would prefer if we instead try to lmit the include of fixmap to when t=
his is strictly necessary. Looking for the inclusion in staging I could fin=
d:
>=20
> 42sh> ack "\#include" | ack "fixmap" | ack -v x86
> arch/arm/acpi/lib.c:28:#include <asm/fixmap.h>
> arch/arm/kernel.c:19:#include <asm/fixmap.h>
> arch/arm/mm.c:27:#include <asm/fixmap.h>
> arch/arm/include/asm/fixmap.h:7:#include <xen/acpi.h>
> arch/arm/include/asm/fixmap.h:8:#include <xen/pmap.h>
> arch/arm/include/asm/pmap.h:6:#include <asm/fixmap.h>
> arch/arm/include/asm/early_printk.h:14:#include <asm/fixmap.h>
> common/efi/boot.c:30:#include <asm/fixmap.h>
> common/pmap.c:7:#include <asm/fixmap.h>
> drivers/acpi/apei/erst.c:36:#include <asm/fixmap.h>
> drivers/acpi/apei/apei-io.c:32:#include <asm/fixmap.h>
> drivers/char/xhci-dbc.c:30:#include <asm/fixmap.h>
> drivers/char/ehci-dbgp.c:16:#include <asm/fixmap.h>
> drivers/char/ns16550.c:40:#include <asm/fixmap.h>
> drivers/char/xen_pv_console.c:28:#include <asm/fixmap.h>
>=20
> Some of them are gone after your rework. The only remaining that we care =
are in kernel.h (but I think it can be removed after your series).

I think you are correct, so I reverted the virt_to_fix() change from this p=
atch,
deleted the include of asm/fixmap.h in kernel.c and put this patch as the (=
last - 1)th
patch of the series. The building of Xen works fine.

Does below updated patch look good to you?
```
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index eb0413336b..8a7b79b4b5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,7 +15,6 @@ config ARM
        select HAS_DEVICE_TREE
        select HAS_PASSTHROUGH
        select HAS_PDX
-       select HAS_PMAP
        select HAS_UBSAN
        select IOMMU_FORCE_PT_SHARE

@@ -61,6 +60,7 @@ config PADDR_BITS

 config MMU
        def_bool y
+       select HAS_PMAP

 source "arch/Kconfig"

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 0d433a32e7..bc3e5bd6f9 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -16,7 +16,6 @@
 #include <xen/vmap.h>

 #include <asm/byteorder.h>
-#include <asm/fixmap.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
```

I will update the commit message accordingly.

Kind regards,
Henry

>=20
> So I think it would be feasible to not touch fixmap.h at all.
>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


