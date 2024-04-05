Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C7899662
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 09:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701121.1095270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdoS-0003B4-SK; Fri, 05 Apr 2024 07:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701121.1095270; Fri, 05 Apr 2024 07:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdoS-00039Z-Oh; Fri, 05 Apr 2024 07:16:36 +0000
Received: by outflank-mailman (input) for mailman id 701121;
 Fri, 05 Apr 2024 07:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StTK=LK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rsdoR-00039T-7M
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 07:16:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb7d2f6-f31c-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 09:16:34 +0200 (CEST)
Received: from DU2P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::27)
 by PAXPR08MB6672.eurprd08.prod.outlook.com (2603:10a6:102:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.42; Fri, 5 Apr
 2024 07:16:26 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::9e) by DU2P250CA0022.outlook.office365.com
 (2603:10a6:10:231::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.29 via Frontend
 Transport; Fri, 5 Apr 2024 07:16:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Fri, 5 Apr 2024 07:16:24 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Fri, 05 Apr 2024 07:16:23 +0000
Received: from b4f0c1d7bf79.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90A945BB-83E1-4B88-BC86-9D8CD3E6EBF3.1; 
 Fri, 05 Apr 2024 07:16:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4f0c1d7bf79.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Apr 2024 07:16:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9127.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 07:16:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 07:16:15 +0000
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
X-Inumbo-ID: 6eb7d2f6-f31c-11ee-afe6-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nv3XKTZzJUmrZICEz0DTDpL5iAxftPq/vHt1Qdv4vG4fU+xfwLT9BSQfdDs7jMU2LjN13iMzrUoyJ5AGduU0Hk1c7cCmARy5estAKibISoiWFFiFS3w/3mjOTomKvBCO2kRnFRnJ75azxqvsrcjRmjL/enaimFhXgPTgPGnyhTQZsToCkG0xh04KNlEaGj38LsgHXbLXgAqB8mA+A79bKv0BM2kD0x/CwRpXKesm6hmQhUxWPyq/rVlw6pgXVn6XGOVZYDD/JCBWOAglKeUzzwGTWFhjjctqF7Nz+8fxeLnoQhVlhLzu9OUbSzyl3W9UzJHhrj8KgSP9ID+bm9A3Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZAU5yR8ZYahL5Vh0LA3txYm1L6AvkKW/u83o15OKgo=;
 b=NJvTrYDj5o7hv6rwIUZDHYN8j7Tqo1A0TqNnP+kCAVKl0vFLvHqemULQhPRZhCFw4wqtk2Uw6/ENuQpg0Ox3PX4fjk5DWKi6MKJnCn3AsC3nuDMXFEOwymAYIm1CE+OTHwdc0B/p9GX3bRQU//52mXAs15BVCcKI3oFySFtkWHcRg1DwelR2rpWtbdmplJbhruY7nelKfkySOrpbD2EaPpmSx/3rTVJBDhuwCfmifSG2N/Q/hrSeIOXc8muisMoTtK2EuagQeWq79abCIi6llaXIjAyGXqxxn5iVyNr1U8wPW61tuzuphrkfZHFZQCle7KmzA/Nx6p+WAD4Fq4mE2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZAU5yR8ZYahL5Vh0LA3txYm1L6AvkKW/u83o15OKgo=;
 b=iTaFM0ZirIlGndiog4puNC+9iO9589Z7pKAcDCGU2GCuA2RhwCxuvmzdbsDl2ZkgmswteN0wtS8z+bKG9WNvA+1cM9LGmn4g92ire9r7TG2f7fWQ6YT5a481uXYw02A6PxtcVVgoGZGdvtUhXT/XRgMXGdSDv9s3+B5c9gbbFFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0829d9090f26284
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRusB5MPoo5ZOi/nU+nPHYp677jQD+JP+A3/oK8oy4DChgl1NgciICrpygZi1OcT8SrRtvdOELNrHqADjWLSn3pGEXCpoL4aY+Y8j0T2ik/oWyaSFs7NKgKAQ/ZM1nQmF0KaP2qtUm745ARFWWWRIik/fTwW9AT1UWBLR+wLhsETq5ALqOcp3R1Tb0Umtg1fM7Xcjg68/D8oWI4yWpqFT5UwTBYtWptvXTRu+KBaI8SPPDJuUicU6nRDCllnQT4ID0z/mklkWAblE91gGU+/YLKjKlrjxV/3eU2AK/m707bP6XN++A1Gb8FAom5T06PIYIBP0QmmxAHerSZehcTCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZAU5yR8ZYahL5Vh0LA3txYm1L6AvkKW/u83o15OKgo=;
 b=bDYxpSWbPBeuEil2D1JGVOSzoYMH0Fi4XdPxlGPsOwTZAD2BkcVwe37F/ISb0ycHDu2VvESaG5KEG2M7NIhMkvJFQS5MdtBVO226SmdvDn1SWaM3TR+bT7mCy+dqXek/ywRpFomBmol6Y6K/hL4TYJP8oFjOgZtOitd9dkJFV4Hp0OkiUos6wsojYKKIetyOdm3SpJyeNqwbz3oP1lOPbkftiE9nQtO6j9mypF+tGTdDgL9hUoa3ikisdtLn7AdRMcM/20rEp9zAn0JR5eCDI4eC9nVY+Al/4lzfo+D6OIkwf+abjkSgDrL8YfCZsuCPlp5isliBbHgFOdop/n3Auw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZAU5yR8ZYahL5Vh0LA3txYm1L6AvkKW/u83o15OKgo=;
 b=iTaFM0ZirIlGndiog4puNC+9iO9589Z7pKAcDCGU2GCuA2RhwCxuvmzdbsDl2ZkgmswteN0wtS8z+bKG9WNvA+1cM9LGmn4g92ire9r7TG2f7fWQ6YT5a481uXYw02A6PxtcVVgoGZGdvtUhXT/XRgMXGdSDv9s3+B5c9gbbFFE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Thread-Topic: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Thread-Index: AQHahi02L7CmbuGs70iGCAZey/rjT7FXyCAAgAEDLACAAHqXAA==
Date: Fri, 5 Apr 2024 07:16:15 +0000
Message-ID: <FA2C1568-6BEC-4C4D-B206-66F795F1D6AE@arm.com>
References:
 <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
 <703E19A2-FED2-4DA1-B9AA-1AF55BBE85B4@arm.com>
 <alpine.DEB.2.22.394.2404041656390.2245130@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2404041656390.2245130@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9127:EE_|DU2PEPF00028D03:EE_|PAXPR08MB6672:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F6+v2zpGQffb2T5da675C8Tv91qaneLE5H47nsYHaK06pD6Nw/LWhKz5wIRAtg3fqhBW5Hyn2BB2nZRMIzdKCf3JEV7pMHpCK2f6CUiH45RwR+8XyvaLYN4pGSpPyZpH7x8slRX6qCNDmKlR+CA52gYHQZlpgClhI8+zvGEQrxROxyYa203va00pHMD67srHTLfJEJAmwUZDnXsGhF5y5lLtPIS5JPp08qkyrUAYLilPF5kAD5Vxa37taAecQPLP6pw92wzfThSLeL5zwY1BhZs8TUXyo0mpSPnxXD5xYs2KFx4mYmZcMKCuWHuwnpOPfzjKKFcOlq+C/t/BinJ5vw16VVAWyvFKtP8h7J11+LbEz6VDXjfNElIIVScTy8kPK02J2B/fh+fYmF9ntHdQHTXWZj3vqYO290i1i5BJPKvZWKs7lYb8/84yekAdFR35W/PCeUeD4anTkO7WfpYBj8j61bD6hF+3V1ilFOXfudWg0m63aBf5ZPy46mVJhj8bHx9LeKjgyPokk+h8K5TGPf4ru3UkWajeo1JVHf/JvWaJDQ2ie2JAsEdDr2OTdAobs9kiIlcxOFh8OhfBk6BiI2gqNcrI/N2VbPuCBafY1jm7WDxCaMir9yOil7cL1BOuA9DJKwG+7gJB+zf7V0CzHsgDT/THrQ11QuQD6a2K6vo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43B6EAA53CDB924190582104761036D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9127
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a50a29e6-e5a6-44e8-d264-08dc55404d26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lfZ33m+2K/MVAwxl3H2NmXT3FjGZaGowSun01X+WwVEdvvWXA9ceKPO+jBVBqkm5Tbvgvp+Uq45PBwDDJWuItGimvwm7rIFXxzjVMZk/ZzKgKt72k2MsbYe0MAJt6LwufHol8A3mZYb799C6Zzwvb8sCyu8mZ0SGcP7zQYukC6lNxuvK0tsr3Wmc9wngOjNNkR4zmFRL0WmANy5nDaJ0v6CHV8exyvYlLUElFCtu9Nfbs7D2z3BwR3ce0Rv8TmQfY4gvnhpXO1Z+CmxTe8LGOq6IO1Di2PqfLwStJLxwTrbW7ETukrq8/3RGEnX27HrabXSPhDC2dKjvr0CxeYqnBl/wvMUQPFMTSFPxE+BsR98EfPIPfJlYxid9FAlO6WMHLE5HyyEdi4Nm67mbfMoY0gQOI8Xdnhvv0XBRpb17SQKrbwsmtCse5yNclixplQUn8zWXcPYSn92z1O55CuAqC6kV0Aw4rw6jiLqRLVxUmZdQKhfHNgPECQ6Q7rK5aOr45t/yv6lFGeFfLh67LTixILUr6JenFw9S4svYSqPV27CTlP5ULfI50vBMgb+l7ifF+IviuuxpITeFS5JavGJOrQnn74Nkt+dpfV5c1byn0DpYZbK4bbPsrBWiTBTfPKbAsi0mBy4KtjGVpA3yKRNn/cg8VvsNmWjVwQKrL/cTccXFqaVE8bX0159WofoS/Z++j+xVUZL0bRLW6YHeh5urDqak5ZWV0E255FmywuwpfXsBjkzXR1rwby/H0enJ/iYbvTs46bqUyTuydy/f8JkScQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 07:16:24.0425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a50a29e6-e5a6-44e8-d264-08dc55404d26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6672

Hi Stefano,

> On 5 Apr 2024, at 01:57, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 4 Apr 2024, Bertrand Marquis wrote:
>> Hi Stefano,
>>=20
>>> On 4 Apr 2024, at 03:12, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> Xen makes assumptions about the size of integer types on the various
>>> architectures. Document these assumptions.
>>>=20
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>> Changes in v3:
>>> - add links to System V, AAPCS32 and AAPCS64
>>>=20
>>> ---
>>> docs/misra/C-language-toolchain.rst | 69 +++++++++++++++++++++++++++++
>>> 1 file changed, 69 insertions(+)
>>>=20
>>> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-languag=
e-toolchain.rst
>>> index b7c2000992..84b21992bc 100644
>>> --- a/docs/misra/C-language-toolchain.rst
>>> +++ b/docs/misra/C-language-toolchain.rst
>>> @@ -480,4 +480,73 @@ The table columns are as follows:
>>>     - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Sec=
tion "11.1 Implementation-defined behavior" of CPP_MANUAL.
>>>=20
>>>=20
>>> +Sizes of Integer types
>>> +______________________
>>> +
>>> +Xen expects System V ABI on x86_64:
>>> +  https://gitlab.com/x86-psABIs/x86-64-ABI
>>> +
>>> +Xen expects AAPCS32 on ARMv8-A AArch32:
>>> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
>>> +
>>> +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
>>> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
>>=20
>> We still support armv7 somehow so we should add something for it here.
>>=20
>>> +
>>> +A summary table of data types, sizes and alignment is below:
>>> +
>>> +.. list-table::
>>> +   :widths: 10 10 10 45
>>> +   :header-rows: 1
>>> +
>>> +   * - Type
>>> +     - Size
>>> +     - Alignment
>>> +     - Architectures
>>> +
>>> +   * - char=20
>>> +     - 8 bits
>>> +     - 8 bits
>>> +     - all architectures
>>> +
>>> +   * - short
>>> +     - 16 bits
>>> +     - 16 bits
>>> +     - all architectures
>>> +
>>> +   * - int
>>> +     - 32 bits
>>> +     - 32 bits
>>> +     - all architectures
>>> +
>>> +   * - long
>>> +     - 32 bits
>>> +     - 32 bits=20
>>> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
>>=20
>> Same here armv7 should be mentioned.
>>=20
>>> +
>>> +   * - long
>>> +     - 64 bits
>>> +     - 64 bits=20
>>> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
>>> +
>>> +   * - long long
>>> +     - 64-bit
>>> +     - 32-bit
>>> +     - x86_32
>>> +
>>> +   * - long long
>>> +     - 64-bit
>>> +     - 64-bit
>>> +     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32
>>=20
>> Should this be all architecture except x86_32 ?
>=20
> yes
>=20
>>> +
>>> +   * - pointer
>>> +     - 32-bit
>>> +     - 32-bit
>>> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
>>=20
>> Armv7 missing here.
>=20
> What is the formal name I should use for it here? ARMv7 AArch32 ?

Armv7-A (no need to specify anything more as it was 32bit only).

Cheers
Bertrand




