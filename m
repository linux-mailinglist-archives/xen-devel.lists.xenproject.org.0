Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125DC500E4F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304744.519474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez89-00087D-5E; Thu, 14 Apr 2022 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304744.519474; Thu, 14 Apr 2022 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez89-00084Q-1A; Thu, 14 Apr 2022 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 304744;
 Thu, 14 Apr 2022 13:03:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNLD=UY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nez87-000842-Vo
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 13:03:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca04d92-bbf3-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 15:03:04 +0200 (CEST)
Received: from AM5PR0402CA0011.eurprd04.prod.outlook.com
 (2603:10a6:203:90::21) by AM4PR0802MB2276.eurprd08.prod.outlook.com
 (2603:10a6:200:5f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19; Thu, 14 Apr
 2022 13:02:28 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::e3) by AM5PR0402CA0011.outlook.office365.com
 (2603:10a6:203:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Thu, 14 Apr 2022 13:02:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 13:02:28 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Thu, 14 Apr 2022 13:02:28 +0000
Received: from e2d7c7bf6e5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5CC4D4B-BB13-4F8E-B953-ABB8AC4C64C8.1; 
 Thu, 14 Apr 2022 13:02:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2d7c7bf6e5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Apr 2022 13:02:17 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DB7PR08MB3609.eurprd08.prod.outlook.com (2603:10a6:10:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 13:02:15 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:02:15 +0000
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
X-Inumbo-ID: 2ca04d92-bbf3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+17n+2DS4HN45Azv+xQsFHcLoxJ4XLMAWMN2uxsW3iA=;
 b=pl4gAa9AsFuAH1nl0zB5+TSx7ixD+PlxaJvF3Rm+oNRZxd8u/6m9b6qTuJQD3zsBvh8am1KYXMiY0C5xaNKyBhYNu7F50WvJ3s0mQL2+AV4MqNrmniQR12rsWfQcs97pcPRm+/bj8XrUUZZmFQMZFzrDQvjGSn47TlBHVJO4dWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e11f845ce3eb985c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwt83TvDnPjJZJERlS9bbdBYlC5IRGsAbGPupsIzUwpvMEx/gs1NCccHIJjymMuQfh4Y8AiV5fZY4A4m0zcjRyWl7NPSWLv5lX/RN8IJpXpvQ0vhPNRFL9OAzXedpSDlhLpKUEewEXazkFVILnwaijP8ItTHPie9VUueSp9xLmpiRHgvzNDpECxwwyfFSYJYix4KbYcykdm7mV3szfg/C/LW4SLo3OqQhL8Q94SFlIVO2QVimmSvABN4DH/i6up8IQ7b2z2ALb3l42U83s1a+TzPxvtG4MHiieh2ch6XqJ5gfe0V/GKVPJWtHEpfzJcUo1x6Opnbli+PhAXbd8cBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+17n+2DS4HN45Azv+xQsFHcLoxJ4XLMAWMN2uxsW3iA=;
 b=C++29OdeFJecGDcxb3Hj+J0SPw5/5FTFHq3DJYFpP55CjPA4YJrO39qSUvILUMMybrYMrKXjFx1lV6EIo4ksY5nQ9CCv+5KkzJO3xIw+qmhm2AcTQg5HDD8zsfxcKgm+mkI1sU0v4M7RO+f/C+o5Anb7l1tt4dGsS37bN3bBCYQ8IMGD1OLZdTf0PFBRdcJHa1HpMyhhN6weAipdO0awySjStlqw08tKpWfsFXHmX6NkyyzrIhgykRQB0NXjSAfdBv2zhMjLTUcwJyzG0sNuZCTFHwaWhiT4ASuij594MV3vO15Gltf3MQeg5vzO1LOCPCqNDeKJH81Igq1K7dlTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+17n+2DS4HN45Azv+xQsFHcLoxJ4XLMAWMN2uxsW3iA=;
 b=pl4gAa9AsFuAH1nl0zB5+TSx7ixD+PlxaJvF3Rm+oNRZxd8u/6m9b6qTuJQD3zsBvh8am1KYXMiY0C5xaNKyBhYNu7F50WvJ3s0mQL2+AV4MqNrmniQR12rsWfQcs97pcPRm+/bj8XrUUZZmFQMZFzrDQvjGSn47TlBHVJO4dWs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>, Michal Orzel
	<Michal.Orzel@arm.com>, Peng Fan <peng.fan@nxp.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
Thread-Topic: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
Thread-Index: AQHYT83OVuHlhz8E70qIHrv4OCbfQKzvYB0A
Date: Thu, 14 Apr 2022 13:02:14 +0000
Message-ID: <CB41A35C-2117-4142-BBFC-3B2415F15927@arm.com>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com>
 <20220414074452.14419-2-peng.fan@oss.nxp.com>
In-Reply-To: <20220414074452.14419-2-peng.fan@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c19f92b3-b4f4-4b86-00ca-08da1e17076e
x-ms-traffictypediagnostic:
	DB7PR08MB3609:EE_|AM5EUR03FT027:EE_|AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB22766C3B06F25C92B700F4DF9DEF9@AM4PR0802MB2276.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XEoxWdtCvtGH/HPkohvqDaRpy15F/sxl86DN7EjbijNXASUqRfzFMxGhfJ9ZpE960x4lQ/Cow0WhmoKqfNGR+VwZtMgU06DZz1QULIkAyngsmXRQF+OXqME+whY65CtdEbkt7V6uYuDJC9rGfMuVlraRC8Qgyq80dIDMkAUBfflOCwYmH1dNG+IilVveF0sa1lq4OQetT3RtnNNgjgmK/wJjhv3gcZxoRuV8dkzKZ21l5X6lMrz9kSc3MjVJ0gmq+fBQQAc/4XVadL833mZqcWpuv716uzmj0I1hNiVei9ub5xSD3LY+60jeojxarotjrJMhzqYH8Atm2AngDgAACx2/GphVmAvxBhhkIXUaSsT+3fNwnti72k4eYBBTZRtIGBHNFksro7etO/3Iy3iGw4ZPsDkWi5cnSeeyOYdk7EWikrprDgQAfwIfp9ah1nQbSGGrkJ97t1ErA8hMkRBl+T/wH4F7BbsTXMdr2SQ0tuV0bvHv9k7ahpbqRfyYcWc4d8o37DFKVcLVKYUqM0g1+dlU4c/owkbyTWndy3eC9E5A4YiKusvKDjJmREu5QZAwClTBWqbFtCiPQ6N3hGha094GCbB0Yy2Uv2pJqdNVteLn9gjIbziF0JlO79x957PYGZe2Ph5HdNG8WSF69bxru6hIRDHtCqxT+qu+HlsCKtvScgq36IPhZeXkQUtoKOtjyFs2RuT/Aeg6Jc534GEPTgMrCq13PKM4MUnTgwlC8NkKiNkSrYKQjlthKWlQ/gEuTQo0LgFaeOc0PJzqcrFI7pz7RbWV1jtrPw8aw2IzSsr+O/zQkByzpmWZ+WZmfuCqQ8ODQwA0Ud9Hx5fKC1d+/bbkeDSyQJlcso+5QeQB3sg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(26005)(186003)(5660300002)(38070700005)(122000001)(38100700002)(71200400001)(53546011)(6512007)(6506007)(316002)(6486002)(83380400001)(2616005)(6916009)(508600001)(30864003)(2906002)(8936002)(7416002)(76116006)(8676002)(86362001)(66946007)(64756008)(4326008)(91956017)(66556008)(66446008)(66476007)(33656002)(36756003)(54906003)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F337A23EFB4D2E4F92F3C31FECB016FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3609
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7dacd508-9a1e-4d4d-5992-08da1e16ff7d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lcf/JpfZ6BbBJfSSJLOL18Ycsv7v2gaqrNG1EEgEmJhOUjnL5A6XroVu/1Fhj5KRdLtR6YRQIfLkz5nghlQPHOobBH3zJCjCjByiQ+NMN5eJG/2dGXoZmtiTkWRRtb+sryDssTjCoURd9LSZllLrKj5O+Yv+OKMcXY0fACFjB2s4LUWU3aJ378f0Srjhcoc0cVJ0uKbk6b5QVwkoAxueYiXzWE+uwgAYCkNjy3hbmZQVG4LQQoMEOMMsVBB72Or1rvCB8qbS0hN12T6ox14iMlZmb3gozm6/RYLyEkyHcHeE07it1ZM8vrhRMIjDopkV+1Z/zzuUmulhhi/wtr4Bg7rf74+9EZ+RKCEdGUZLw7duHj0ecyVi/uGZCP7b2Mb++G96sswFxicQ3gEvIvyuA1tQ5pQ8c8BG7VMFXYk53DociozBtxS0mBvJPLJZZ7+/ou1BT8ky366RKxe5MNd021FrPxDOym+JZh+UKsKK0waWSl2wrIhBXOhIFqBEJGfAwkZsFcfHe204s1JnHEnOLxEP9qv79JPd4Y06ORpEqnx78C+cnjHgvf2GkFYrSlHU4/5k878eMWYxeQ5e/EgKYb9WGxOD8pJbwyJCQlxRy/UGhqkg5ISldzJRGCaVackcv6oGWFmDQKjGPXiQ+Jd5nSkj2xLwYxhB0k17CZfu9ISqmRV03+mw9ko6MaCKwQsLQd++WHkO0rX9BLTJakMYEleMA5HhwgCMSV3lT/qwyd8FxPImqWkmGkfy7t2TiQm/SFqsbihcfeN8xvmanjGHb05QwFuDcg7uuD+xlOdoPeg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(36756003)(40460700003)(36860700001)(316002)(8936002)(508600001)(86362001)(70206006)(70586007)(81166007)(2616005)(6486002)(966005)(26005)(33656002)(8676002)(4326008)(82310400005)(6862004)(6512007)(83380400001)(336012)(2906002)(47076005)(356005)(186003)(53546011)(6506007)(30864003)(5660300002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:02:28.3373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c19f92b3-b4f4-4b86-00ca-08da1e17076e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276

Hi Peng,

> On 14 Apr 2022, at 08:44, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The i.MX LPUART Documentation:
> https://www.nxp.com/webapp/Download?colCode=3DIMX8QMIEC
> Chatper 13.6 Low Power Universal Asynchronous Receiver/
> Transmitter (LPUART)
>=20
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
Asked-by: Bertrand Marquis <bertrand.marquis@arm.com>

I did not check the code but enough people went through this so I think it =
can be merged.

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
> xen/drivers/char/Kconfig              |   7 +
> xen/drivers/char/Makefile             |   1 +
> xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
> 4 files changed, 348 insertions(+)
> create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
> create mode 100644 xen/drivers/char/imx-lpuart.c
>=20
> diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include=
/asm/imx-lpuart.h
> new file mode 100644
> index 0000000000..fe859045dc
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/imx-lpuart.h
> @@ -0,0 +1,64 @@
> +/*
> + * xen/arch/arm/include/asm/imx-lpuart.h
> + *
> + * Common constant definition between early printk and the LPUART driver
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __ASM_ARM_IMX_LPUART_H__
> +#define __ASM_ARM_IMX_LPUART_H__
> +
> +/* 32-bit register definition */
> +#define UARTBAUD          (0x10)
> +#define UARTSTAT          (0x14)
> +#define UARTCTRL          (0x18)
> +#define UARTDATA          (0x1C)
> +#define UARTMATCH         (0x20)
> +#define UARTMODIR         (0x24)
> +#define UARTFIFO          (0x28)
> +#define UARTWATER         (0x2c)
> +
> +#define UARTSTAT_TDRE     BIT(23, UL)
> +#define UARTSTAT_TC       BIT(22, UL)
> +#define UARTSTAT_RDRF     BIT(21, UL)
> +#define UARTSTAT_OR       BIT(19, UL)
> +
> +#define UARTBAUD_OSR_SHIFT    (24)
> +#define UARTBAUD_OSR_MASK     (0x1f)
> +#define UARTBAUD_SBR_MASK     (0x1fff)
> +#define UARTBAUD_BOTHEDGE     (0x00020000)
> +#define UARTBAUD_TDMAE        (0x00800000)
> +#define UARTBAUD_RDMAE        (0x00200000)
> +
> +#define UARTCTRL_TIE      BIT(23, UL)
> +#define UARTCTRL_TCIE     BIT(22, UL)
> +#define UARTCTRL_RIE      BIT(21, UL)
> +#define UARTCTRL_ILIE     BIT(20, UL)
> +#define UARTCTRL_TE       BIT(19, UL)
> +#define UARTCTRL_RE       BIT(18, UL)
> +#define UARTCTRL_M        BIT(4, UL)
> +
> +#define UARTWATER_RXCNT_OFF     24
> +
> +#endif /* __ASM_ARM_IMX_LPUART_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 2ff5b288e2..e5f7b1d8eb 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -13,6 +13,13 @@ config HAS_CADENCE_UART
> 	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
> 	  based board, say Y.
>=20
> +config HAS_IMX_LPUART
> +	bool "i.MX LPUART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
> +
> config HAS_MVEBU
> 	bool "Marvell MVEBU UART driver"
> 	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index 7c646d771c..14e67cf072 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) +=3D mvebu-uart.o
> obj-$(CONFIG_HAS_OMAP) +=3D omap-uart.o
> obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
> obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
> +obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
> obj-$(CONFIG_ARM) +=3D arm-uart.o
> obj-y +=3D serial.o
> obj-$(CONFIG_XEN_GUEST) +=3D xen_pv_console.o
> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.=
c
> new file mode 100644
> index 0000000000..df44f91e5d
> --- /dev/null
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -0,0 +1,276 @@
> +/*
> + * xen/drivers/char/imx-lpuart.c
> + *
> + * Driver for i.MX LPUART.
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/serial.h>
> +#include <asm/device.h>
> +#include <asm/imx-lpuart.h>
> +#include <asm/io.h>
> +
> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + of=
f)
> +
> +static struct imx_lpuart {
> +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
> +    uint32_t irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx8_com;
> +
> +static void imx_lpuart_interrupt(int irq, void *data,
> +                                 struct cpu_user_regs *regs)
> +{
> +    struct serial_port *port =3D data;
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t sts, rxcnt;
> +
> +    sts =3D imx_lpuart_read(uart, UARTSTAT);
> +    rxcnt =3D imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
> +
> +    if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
> +	    serial_rx_interrupt(port, regs);
> +
> +    if ( sts & UARTSTAT_TDRE )
> +	    serial_tx_interrupt(port, regs);
> +
> +    imx_lpuart_write(uart, UARTSTAT, sts);
> +}
> +
> +static void __init imx_lpuart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t ctrl, old_ctrl, bd;
> +
> +    old_ctrl =3D imx_lpuart_read(uart, UARTCTRL);
> +    ctrl =3D (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
> +    bd =3D imx_lpuart_read(uart, UARTBAUD);
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) )
> +	    cpu_relax();
> +
> +    /* Disable transmit and receive */
> +    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE | UARTCTRL=
_RE));
> +
> +    /* Reuse firmware baudrate settings, only disable DMA here */
> +    bd &=3D ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);
> +
> +    imx_lpuart_write(uart, UARTMODIR, 0);
> +    imx_lpuart_write(uart, UARTBAUD, bd);
> +    imx_lpuart_write(uart, UARTCTRL, ctrl);
> +}
> +
> +static void __init imx_lpuart_init_postirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t temp;
> +
> +    uart->irqaction.handler =3D imx_lpuart_interrupt;
> +    uart->irqaction.name =3D "imx_lpuart";
> +    uart->irqaction.dev_id =3D port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) !=3D 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate imx_lpuart IRQ %d\n",
> +                uart->irq);
> +        return;
> +    }
> +
> +    /* Enable interrupts */
> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> +    temp |=3D (UARTCTRL_RIE | UARTCTRL_TIE);
> +    temp |=3D UARTCTRL_ILIE;
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +}
> +
> +static void imx_lpuart_suspend(struct serial_port *port)
> +{
> +    BUG();
> +}
> +
> +static void imx_lpuart_resume(struct serial_port *port)
> +{
> +    BUG();
> +}
> +
> +static int imx_lpuart_tx_ready(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC;
> +}
> +
> +static void imx_lpuart_putc(struct serial_port *port, char c)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
> +        cpu_relax();
> +
> +    imx_lpuart_write(uart, UARTDATA, c);
> +}
> +
> +static int imx_lpuart_getc(struct serial_port *port, char *pc)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    int ch;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF) )
> +	    return 0;
> +
> +    ch =3D imx_lpuart_read(uart, UARTDATA);
> +    *pc =3D ch & 0xff;
> +
> +    if ( imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR )
> +        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
> +
> +    return 1;
> +}
> +
> +static int __init imx_lpuart_irq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    return ((uart->irq > 0) ? uart->irq : -1);
> +}
> +
> +static const struct vuart_info *imx_lpuart_vuart_info(struct serial_port=
 *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +
> +    return &uart->vuart;
> +}
> +
> +static void imx_lpuart_start_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t temp;
> +
> +    temp =3D imx_lpuart_read(uart, UARTSTAT);
> +    /* Wait until empty */
> +    while ( !(temp & UARTSTAT_TDRE) )
> +	    cpu_relax();
> +
> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> +    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
> +}
> +
> +static void imx_lpuart_stop_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart =3D port->uart;
> +    uint32_t temp;
> +
> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
> +    temp &=3D ~(UARTCTRL_TIE | UARTCTRL_TCIE);
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +}
> +
> +static struct uart_driver __read_mostly imx_lpuart_driver =3D {
> +    .init_preirq =3D imx_lpuart_init_preirq,
> +    .init_postirq =3D imx_lpuart_init_postirq,
> +    .endboot =3D NULL,
> +    .suspend =3D imx_lpuart_suspend,
> +    .resume =3D imx_lpuart_resume,
> +    .tx_ready =3D imx_lpuart_tx_ready,
> +    .putc =3D imx_lpuart_putc,
> +    .getc =3D imx_lpuart_getc,
> +    .irq =3D imx_lpuart_irq,
> +    .start_tx =3D imx_lpuart_start_tx,
> +    .stop_tx =3D imx_lpuart_stop_tx,
> +    .vuart_info =3D imx_lpuart_vuart_info,
> +};
> +
> +static int __init imx_lpuart_init(struct dt_device_node *dev,
> +                                  const void *data)
> +{
> +    const char *config =3D data;
> +    struct imx_lpuart *uart;
> +    int res;
> +    u64 addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart =3D &imx8_com;
> +
> +    uart->baud =3D 115200;
> +    uart->data_bits =3D 8;
> +    uart->parity =3D 0;
> +    uart->stop_bits =3D 1;
> +
> +    res =3D dt_device_get_address(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("imx8-lpuart: Unable to retrieve the base"
> +               " address of the UART\n");
> +        return res;
> +    }
> +
> +    res =3D platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("imx8-lpuart: Unable to retrieve the IRQ\n");
> +        return -EINVAL;
> +    }
> +    uart->irq =3D res;
> +
> +    uart->regs =3D ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("imx8-lpuart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    uart->vuart.base_addr =3D addr;
> +    uart->vuart.size =3D size;
> +    uart->vuart.data_off =3D UARTDATA;
> +    /* tmp from uboot */
> +    uart->vuart.status_off =3D UARTSTAT;
> +    uart->vuart.status =3D UARTSTAT_TDRE;
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &imx_lpuart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
=3D
> +{
> +    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> +    .dt_match =3D imx_lpuart_dt_compat,
> +    .init =3D imx_lpuart_init,
> +DT_DEVICE_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --=20
> 2.35.1
>=20


