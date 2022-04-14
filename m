Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DBD500E54
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 15:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304750.519485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez8c-0000KU-EH; Thu, 14 Apr 2022 13:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304750.519485; Thu, 14 Apr 2022 13:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nez8c-0000HM-9n; Thu, 14 Apr 2022 13:03:54 +0000
Received: by outflank-mailman (input) for mailman id 304750;
 Thu, 14 Apr 2022 13:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNLD=UY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nez8a-000842-FD
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 13:03:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 550a9c7c-bbf3-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 15:03:52 +0200 (CEST)
Received: from DU2PR04CA0340.eurprd04.prod.outlook.com (2603:10a6:10:2b4::12)
 by AM4PR0802MB2340.eurprd08.prod.outlook.com (2603:10a6:200:60::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 13:03:47 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::42) by DU2PR04CA0340.outlook.office365.com
 (2603:10a6:10:2b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Thu, 14 Apr 2022 13:03:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 13:03:47 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Thu, 14 Apr 2022 13:03:47 +0000
Received: from 89e0720a6f03.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1DC4620-9B63-4E86-B544-8687E99A6CF0.1; 
 Thu, 14 Apr 2022 13:03:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89e0720a6f03.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Apr 2022 13:03:41 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AM6PR08MB4423.eurprd08.prod.outlook.com (2603:10a6:20b:bf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 13:03:38 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 13:03:38 +0000
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
X-Inumbo-ID: 550a9c7c-bbf3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Io7NRahxf4ET9ge18hVG2feNsJfPZHjJC5RcvqMt0k=;
 b=0S3JcKfr5HhxYeUUY0D2e71aA7ysmavRzJok8lvcQIMwBpu2lLXBGDydOvGrkr9syizLAjAtiM0rQqDfmOIxcYBk3YPBzcHQh4hgL2m2Z6JD2iaBCjQLz4fVgJ35Mbfog3uDrgkYEzOvNROdKRqB0oa4zN9yWSP2Ruyq+afILuw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb7b441c6c4f8238
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQyc18mnm1JV+EN4Wn0BkO0vzdnzZELsCn4XqPt81/aenmsJZRWaSUmYtWSxQfNItiONr1PWhNUuWa0KGgdpnWPLt7FgOpaN/4IBzCKVVm9jITtTW3GQkyFQmtKJaPbh5E6MrqeNkKjd9Rx0vQsC3eAhasLLiNhJJeModgX25yLnkV6NRMuMDva0I93NZ5mWEiL2TWKo82Pp80Doy5RtJyVfJMpGGpnZ69wIysL0pPWKJqApgggAloJUB+j1oO6fkRiyRVgkT6jKILCJ2TXX5UJ6HvLabwzNO6m1NNsB/AAAatq6SPpX55Eh9CXHTsHTcnJ1kFsrZJ8UGaQUu1DLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Io7NRahxf4ET9ge18hVG2feNsJfPZHjJC5RcvqMt0k=;
 b=XzFtzdPu05Tlse6p4VMyUngj9DMIIiJpy2NEwHb5bcjsBDUXJSYlMYA1qnNue2qzXHBIjPJ3YFdY4ZN+Px4ygSZ+47tqd8Zqa7HNCNdLfrKkHoosvReoTynNEluDTJfvmC72ZtB7oE7rUG9wCxp/GEuAzeW7WeICj+ISZWLEySKS9MflomfBKcALsSsUiZ6Z6QJb0cxsjw0Nxms3Taz4s6zYDOBDeoNB4+6KIbmhScFdW3zeq39lp5Lli40ACqPgNzCah6dd6O7nbcqPv+CJEDZ9xss9OTC/VlU9QzSVPdOprYLzi8uYBUyCZstjN45AjtHPGv5Db6i6sRK+Yz7VwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Io7NRahxf4ET9ge18hVG2feNsJfPZHjJC5RcvqMt0k=;
 b=0S3JcKfr5HhxYeUUY0D2e71aA7ysmavRzJok8lvcQIMwBpu2lLXBGDydOvGrkr9syizLAjAtiM0rQqDfmOIxcYBk3YPBzcHQh4hgL2m2Z6JD2iaBCjQLz4fVgJ35Mbfog3uDrgkYEzOvNROdKRqB0oa4zN9yWSP2Ruyq+afILuw=
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
Thread-Index: AQHYT83OVuHlhz8E70qIHrv4OCbfQKzvYB0AgAAAZAA=
Date: Thu, 14 Apr 2022 13:03:38 +0000
Message-ID: <D766CA91-29E8-46DE-B27D-E254DB50CE0C@arm.com>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com>
 <20220414074452.14419-2-peng.fan@oss.nxp.com>
 <CB41A35C-2117-4142-BBFC-3B2415F15927@arm.com>
In-Reply-To: <CB41A35C-2117-4142-BBFC-3B2415F15927@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c3eeb518-8a59-4763-bf0f-08da1e17369e
x-ms-traffictypediagnostic:
	AM6PR08MB4423:EE_|DB5EUR03FT061:EE_|AM4PR0802MB2340:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2340C424FD95BAF7919282619DEF9@AM4PR0802MB2340.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sn2I44l1LfFz8GGzF9CukVSUU85Xl1y522esODQMHkJzHMvgtt6Qtj3kqjlAhEku5jehIQqTYpYcB/6ImMZYqbmVLwm51FTv6vlt3nworiKXwBQ2uAYVxbuYfOYMNBIJaQMm/TXZtIvGOys50PQOj7to/DbhA7yDblXF8kGYxEasa5IpB4fPqdBXGfe1nADLhLBlXRzhSAN8Y6TpH00OYVx7mPrqRNJkZcKFsbJVoiuhYe0V82D4NG6Lz5VfbkAs8nZe7iZdpMvLjFEx50nQinp49mHqimaSeSQ8r6JvGem8uCIiYUEvVQPg+CyO8Jt8cpvAx8Uki0IiZ/KCmluuduknqDNT3Z63RBEoDMvOJOXS/TFbKpEi+JD54f6YuPJBqfX6isMZiNefXbQmHG38OJ9svSTxRJJyzKRh/2PyrociDa2qhsGkHaYmztOu4RK7lF5Ro7+iotLvoko5QxM9abpn/SO6F/BdlHdd3FhUl1WiroCInPU4zL5SwQuImT1E6XjPC9pvXFy97aWAVDSsFv6mgzoQ4kj1iXeJh9QnJBTZ1XCuaSncB2Ybxh0XfSzrzr9ZoGWKih4gXXjOC39yL6HIUPmskJj7O0UUmxy00CNgz5DKnyt6XijWhk6vmwWTENjHNS/yy9ANJrlOcslcW67PElcAHaiHd70x2qBR5Nt9M0sfMI7RFiTVvrkvnrtCcL9fkIxDansvMJ4g+DUwXftM1Wx6gcmC40Vxxsw6ZwKUQaVIpx6/KuVaugicd4Dca7e0GfOtivPyJXNVIOYm7lsEzkYhmB7K/VqoB6aX1N7X7qxdyrjNJTL05824UpiPHQ32I3YDHHBL5SqqkfgwsraI6L6towkyBjNizrpnLmc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(91956017)(966005)(86362001)(30864003)(6486002)(7416002)(36756003)(6506007)(6916009)(508600001)(2906002)(316002)(64756008)(4326008)(66946007)(8676002)(66476007)(66556008)(66446008)(76116006)(6512007)(71200400001)(26005)(186003)(8936002)(122000001)(54906003)(53546011)(2616005)(38070700005)(38100700002)(33656002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F1412F5060024499743C14D7B96707B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4423
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbec0b84-8caa-4e41-6b0b-08da1e173165
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0bXkZxRoxGHVpwPIWzJzV7f/E89UMtoIE3fXsiaLiUqzvI+cOi8VF9Tkk9/QKeO1XkrbTyXN+oxysC8MEyFxhzzq/fBOek19rbOKnHRk7f8km9MlxTld2dwfZK0CWWcOGyfFxB0mWn9nh8geQZC52CJUWBWY4vSn+15hIeTJgUQs71nZaYFlIbHqz+FyErJ6BpNZoCMQSpYXNCirnUVLIByAQIbPUZ83SGy/zXmb8qKPclO0hGsmqiwQ6oUvdMHWl2y0nudtiMtoXYx0/nuT3qPAFWcxAeeff7cDkMl7TDE5yB/mC08z1ny9nbOsVY4S177C4fDX5cJ+pYWArxCEeVyfS1tWePeWm7hc82TiykDcFTNtzDE3Z5a6Dk+XBmwrQLWXVOOkHAvZ9OpNOXvYx2z6GCJ++sHtp+yXDVhCJmkJy++/BKHRPnN7F4nQhvUyVxf9fnCVoXUZ0jEMT2jIGxidXcqct1vsLwIXK6i2pFDu8avI6Tz2Bz1yWsxtjIWx59XWkOe/TIGsySf/HdAKhLR299dFNAc8JV9S8iO5IK1+ZKrz+GMbTo6cp7DYzlrpbhDqVumJ0a4lC0NchWupAbOzi/f/B1OWj3HLo5dhnUOS/ZSsFyDUpWAFYpvcOpJSnwTGYX/T9MTLHyEbrTnb+FJlE7idNLrhaN3BkusbTv7iAk62zVtkvXbYAJ78le1xTG7nIzyFL3DcAKg2i1GbDFl2XLkeppFB4jauHrg8B3MrrwX8R/cCJq+cRNkBwquqKSJOvvL4sTQYnqg1wT8xaXchQE2eceZiuHEtjogtbiE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(966005)(36756003)(40460700003)(36860700001)(6862004)(4326008)(6486002)(6506007)(6512007)(26005)(508600001)(186003)(53546011)(33656002)(54906003)(2616005)(316002)(82310400005)(47076005)(83380400001)(70586007)(8676002)(70206006)(336012)(86362001)(356005)(5660300002)(8936002)(81166007)(30864003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 13:03:47.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3eeb518-8a59-4763-bf0f-08da1e17369e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2340



> On 14 Apr 2022, at 14:02, Bertrand Marquis <bertrand.marquis@arm.com> wro=
te:
>=20
> Hi Peng,
>=20
>> On 14 Apr 2022, at 08:44, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>=20
>> From: Peng Fan <peng.fan@nxp.com>
>>=20
>> The i.MX LPUART Documentation:
>> https://www.nxp.com/webapp/Download?colCode=3DIMX8QMIEC
>> Chatper 13.6 Low Power Universal Asynchronous Receiver/
>> Transmitter (LPUART)
>>=20
>> Tested-by: Henry Wang <Henry.Wang@arm.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Asked-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

(Auto correct, sorry for that)

Bertrand

>=20
> I did not check the code but enough people went through this so I think i=
t can be merged.
>=20
> Cheers
> Bertrand
>=20
>> ---
>> xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
>> xen/drivers/char/Kconfig              |   7 +
>> xen/drivers/char/Makefile             |   1 +
>> xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
>> 4 files changed, 348 insertions(+)
>> create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
>> create mode 100644 xen/drivers/char/imx-lpuart.c
>>=20
>> diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/includ=
e/asm/imx-lpuart.h
>> new file mode 100644
>> index 0000000000..fe859045dc
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/imx-lpuart.h
>> @@ -0,0 +1,64 @@
>> +/*
>> + * xen/arch/arm/include/asm/imx-lpuart.h
>> + *
>> + * Common constant definition between early printk and the LPUART drive=
r
>> + *
>> + * Peng Fan <peng.fan@nxp.com>
>> + * Copyright 2022 NXP
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#ifndef __ASM_ARM_IMX_LPUART_H__
>> +#define __ASM_ARM_IMX_LPUART_H__
>> +
>> +/* 32-bit register definition */
>> +#define UARTBAUD          (0x10)
>> +#define UARTSTAT          (0x14)
>> +#define UARTCTRL          (0x18)
>> +#define UARTDATA          (0x1C)
>> +#define UARTMATCH         (0x20)
>> +#define UARTMODIR         (0x24)
>> +#define UARTFIFO          (0x28)
>> +#define UARTWATER         (0x2c)
>> +
>> +#define UARTSTAT_TDRE     BIT(23, UL)
>> +#define UARTSTAT_TC       BIT(22, UL)
>> +#define UARTSTAT_RDRF     BIT(21, UL)
>> +#define UARTSTAT_OR       BIT(19, UL)
>> +
>> +#define UARTBAUD_OSR_SHIFT    (24)
>> +#define UARTBAUD_OSR_MASK     (0x1f)
>> +#define UARTBAUD_SBR_MASK     (0x1fff)
>> +#define UARTBAUD_BOTHEDGE     (0x00020000)
>> +#define UARTBAUD_TDMAE        (0x00800000)
>> +#define UARTBAUD_RDMAE        (0x00200000)
>> +
>> +#define UARTCTRL_TIE      BIT(23, UL)
>> +#define UARTCTRL_TCIE     BIT(22, UL)
>> +#define UARTCTRL_RIE      BIT(21, UL)
>> +#define UARTCTRL_ILIE     BIT(20, UL)
>> +#define UARTCTRL_TE       BIT(19, UL)
>> +#define UARTCTRL_RE       BIT(18, UL)
>> +#define UARTCTRL_M        BIT(4, UL)
>> +
>> +#define UARTWATER_RXCNT_OFF     24
>> +
>> +#endif /* __ASM_ARM_IMX_LPUART_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
>> index 2ff5b288e2..e5f7b1d8eb 100644
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -13,6 +13,13 @@ config HAS_CADENCE_UART
>> 	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>> 	  based board, say Y.
>>=20
>> +config HAS_IMX_LPUART
>> +	bool "i.MX LPUART driver"
>> +	default y
>> +	depends on ARM_64
>> +	help
>> +	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y=
.
>> +
>> config HAS_MVEBU
>> 	bool "Marvell MVEBU UART driver"
>> 	default y
>> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
>> index 7c646d771c..14e67cf072 100644
>> --- a/xen/drivers/char/Makefile
>> +++ b/xen/drivers/char/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) +=3D mvebu-uart.o
>> obj-$(CONFIG_HAS_OMAP) +=3D omap-uart.o
>> obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
>> obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
>> +obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
>> obj-$(CONFIG_ARM) +=3D arm-uart.o
>> obj-y +=3D serial.o
>> obj-$(CONFIG_XEN_GUEST) +=3D xen_pv_console.o
>> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart=
.c
>> new file mode 100644
>> index 0000000000..df44f91e5d
>> --- /dev/null
>> +++ b/xen/drivers/char/imx-lpuart.c
>> @@ -0,0 +1,276 @@
>> +/*
>> + * xen/drivers/char/imx-lpuart.c
>> + *
>> + * Driver for i.MX LPUART.
>> + *
>> + * Peng Fan <peng.fan@nxp.com>
>> + * Copyright 2022 NXP
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/irq.h>
>> +#include <xen/mm.h>
>> +#include <xen/serial.h>
>> +#include <asm/device.h>
>> +#include <asm/imx-lpuart.h>
>> +#include <asm/io.h>
>> +
>> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
>> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + o=
ff)
>> +
>> +static struct imx_lpuart {
>> +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
>> +    uint32_t irq;
>> +    char __iomem *regs;
>> +    struct irqaction irqaction;
>> +    struct vuart_info vuart;
>> +} imx8_com;
>> +
>> +static void imx_lpuart_interrupt(int irq, void *data,
>> +                                 struct cpu_user_regs *regs)
>> +{
>> +    struct serial_port *port =3D data;
>> +    struct imx_lpuart *uart =3D port->uart;
>> +    uint32_t sts, rxcnt;
>> +
>> +    sts =3D imx_lpuart_read(uart, UARTSTAT);
>> +    rxcnt =3D imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
>> +
>> +    if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
>> +	    serial_rx_interrupt(port, regs);
>> +
>> +    if ( sts & UARTSTAT_TDRE )
>> +	    serial_tx_interrupt(port, regs);
>> +
>> +    imx_lpuart_write(uart, UARTSTAT, sts);
>> +}
>> +
>> +static void __init imx_lpuart_init_preirq(struct serial_port *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +    uint32_t ctrl, old_ctrl, bd;
>> +
>> +    old_ctrl =3D imx_lpuart_read(uart, UARTCTRL);
>> +    ctrl =3D (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
>> +    bd =3D imx_lpuart_read(uart, UARTBAUD);
>> +
>> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) )
>> +	    cpu_relax();
>> +
>> +    /* Disable transmit and receive */
>> +    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE | UARTCTR=
L_RE));
>> +
>> +    /* Reuse firmware baudrate settings, only disable DMA here */
>> +    bd &=3D ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);
>> +
>> +    imx_lpuart_write(uart, UARTMODIR, 0);
>> +    imx_lpuart_write(uart, UARTBAUD, bd);
>> +    imx_lpuart_write(uart, UARTCTRL, ctrl);
>> +}
>> +
>> +static void __init imx_lpuart_init_postirq(struct serial_port *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +    uint32_t temp;
>> +
>> +    uart->irqaction.handler =3D imx_lpuart_interrupt;
>> +    uart->irqaction.name =3D "imx_lpuart";
>> +    uart->irqaction.dev_id =3D port;
>> +
>> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) !=3D 0 )
>> +    {
>> +        dprintk(XENLOG_ERR, "Failed to allocate imx_lpuart IRQ %d\n",
>> +                uart->irq);
>> +        return;
>> +    }
>> +
>> +    /* Enable interrupts */
>> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
>> +    temp |=3D (UARTCTRL_RIE | UARTCTRL_TIE);
>> +    temp |=3D UARTCTRL_ILIE;
>> +    imx_lpuart_write(uart, UARTCTRL, temp);
>> +}
>> +
>> +static void imx_lpuart_suspend(struct serial_port *port)
>> +{
>> +    BUG();
>> +}
>> +
>> +static void imx_lpuart_resume(struct serial_port *port)
>> +{
>> +    BUG();
>> +}
>> +
>> +static int imx_lpuart_tx_ready(struct serial_port *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +
>> +    return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC;
>> +}
>> +
>> +static void imx_lpuart_putc(struct serial_port *port, char c)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +
>> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
>> +        cpu_relax();
>> +
>> +    imx_lpuart_write(uart, UARTDATA, c);
>> +}
>> +
>> +static int imx_lpuart_getc(struct serial_port *port, char *pc)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +    int ch;
>> +
>> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF) )
>> +	    return 0;
>> +
>> +    ch =3D imx_lpuart_read(uart, UARTDATA);
>> +    *pc =3D ch & 0xff;
>> +
>> +    if ( imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR )
>> +        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
>> +
>> +    return 1;
>> +}
>> +
>> +static int __init imx_lpuart_irq(struct serial_port *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +
>> +    return ((uart->irq > 0) ? uart->irq : -1);
>> +}
>> +
>> +static const struct vuart_info *imx_lpuart_vuart_info(struct serial_por=
t *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +
>> +    return &uart->vuart;
>> +}
>> +
>> +static void imx_lpuart_start_tx(struct serial_port *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +    uint32_t temp;
>> +
>> +    temp =3D imx_lpuart_read(uart, UARTSTAT);
>> +    /* Wait until empty */
>> +    while ( !(temp & UARTSTAT_TDRE) )
>> +	    cpu_relax();
>> +
>> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
>> +    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
>> +}
>> +
>> +static void imx_lpuart_stop_tx(struct serial_port *port)
>> +{
>> +    struct imx_lpuart *uart =3D port->uart;
>> +    uint32_t temp;
>> +
>> +    temp =3D imx_lpuart_read(uart, UARTCTRL);
>> +    temp &=3D ~(UARTCTRL_TIE | UARTCTRL_TCIE);
>> +    imx_lpuart_write(uart, UARTCTRL, temp);
>> +}
>> +
>> +static struct uart_driver __read_mostly imx_lpuart_driver =3D {
>> +    .init_preirq =3D imx_lpuart_init_preirq,
>> +    .init_postirq =3D imx_lpuart_init_postirq,
>> +    .endboot =3D NULL,
>> +    .suspend =3D imx_lpuart_suspend,
>> +    .resume =3D imx_lpuart_resume,
>> +    .tx_ready =3D imx_lpuart_tx_ready,
>> +    .putc =3D imx_lpuart_putc,
>> +    .getc =3D imx_lpuart_getc,
>> +    .irq =3D imx_lpuart_irq,
>> +    .start_tx =3D imx_lpuart_start_tx,
>> +    .stop_tx =3D imx_lpuart_stop_tx,
>> +    .vuart_info =3D imx_lpuart_vuart_info,
>> +};
>> +
>> +static int __init imx_lpuart_init(struct dt_device_node *dev,
>> +                                  const void *data)
>> +{
>> +    const char *config =3D data;
>> +    struct imx_lpuart *uart;
>> +    int res;
>> +    u64 addr, size;
>> +
>> +    if ( strcmp(config, "") )
>> +        printk("WARNING: UART configuration is not supported\n");
>> +
>> +    uart =3D &imx8_com;
>> +
>> +    uart->baud =3D 115200;
>> +    uart->data_bits =3D 8;
>> +    uart->parity =3D 0;
>> +    uart->stop_bits =3D 1;
>> +
>> +    res =3D dt_device_get_address(dev, 0, &addr, &size);
>> +    if ( res )
>> +    {
>> +        printk("imx8-lpuart: Unable to retrieve the base"
>> +               " address of the UART\n");
>> +        return res;
>> +    }
>> +
>> +    res =3D platform_get_irq(dev, 0);
>> +    if ( res < 0 )
>> +    {
>> +        printk("imx8-lpuart: Unable to retrieve the IRQ\n");
>> +        return -EINVAL;
>> +    }
>> +    uart->irq =3D res;
>> +
>> +    uart->regs =3D ioremap_nocache(addr, size);
>> +    if ( !uart->regs )
>> +    {
>> +        printk("imx8-lpuart: Unable to map the UART memory\n");
>> +        return -ENOMEM;
>> +    }
>> +
>> +    uart->vuart.base_addr =3D addr;
>> +    uart->vuart.size =3D size;
>> +    uart->vuart.data_off =3D UARTDATA;
>> +    /* tmp from uboot */
>> +    uart->vuart.status_off =3D UARTSTAT;
>> +    uart->vuart.status =3D UARTSTAT_TDRE;
>> +
>> +    /* Register with generic serial driver */
>> +    serial_register_uart(SERHND_DTUART, &imx_lpuart_driver, uart);
>> +
>> +    dt_device_set_used_by(dev, DOMID_XEN);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
=3D
>> +{
>> +    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
>> +    { /* sentinel */ },
>> +};
>> +
>> +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
>> +    .dt_match =3D imx_lpuart_dt_compat,
>> +    .init =3D imx_lpuart_init,
>> +DT_DEVICE_END
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> --=20
>> 2.35.1
>>=20
>=20


