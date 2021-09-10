Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AD406B1F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 14:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184330.332938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOfDt-0000mq-0c; Fri, 10 Sep 2021 12:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184330.332938; Fri, 10 Sep 2021 12:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOfDs-0000jp-TO; Fri, 10 Sep 2021 12:01:36 +0000
Received: by outflank-mailman (input) for mailman id 184330;
 Fri, 10 Sep 2021 12:01:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wql=OA=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mOfDr-0000jQ-A2
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 12:01:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a57629ad-f595-4edc-83b0-232d0aa08d54;
 Fri, 10 Sep 2021 12:01:30 +0000 (UTC)
Received: from AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29)
 by DB6PR0802MB2583.eurprd08.prod.outlook.com (2603:10a6:4:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 10 Sep
 2021 12:01:28 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::1d) by AS8PR05CA0024.outlook.office365.com
 (2603:10a6:20b:311::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 12:01:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 12:01:28 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 10 Sep 2021 12:01:27 +0000
Received: from 919b81e88633.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BCC445D-E2B8-4F57-A990-944E7845D385.1; 
 Fri, 10 Sep 2021 12:01:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 919b81e88633.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 12:01:19 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4293.eurprd08.prod.outlook.com (2603:10a6:20b:be::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 12:01:18 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 12:01:18 +0000
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
X-Inumbo-ID: a57629ad-f595-4edc-83b0-232d0aa08d54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0gq4qr2jI+1FpXsAkUAnAZEh9Ot1CYUtuKyLj+j4u8=;
 b=MCL8WBjil32UQ3VJ+j1Uwe0R2MF7okoeWBYQapgyz99Q7hkTJjGRBUamNW5+IRzsq72ZSD0ePSdkRsYvRhEo7uPOw2oaIjD6GBAOkC0ntTQsa+1j5IZwkC9h1LKkO2CAYl+gKCHfUooj4SFT10q4a988KPcfYYARBeUNxq+UEek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec71279265c49a80
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgxgOiQ+YDPy6Cf+sGmOkF7brdtvKnHa1OPW1h0PJzSWROWLm9E1GMYA7hijyxI4n+AjDQPRG5wPm4frB0/HUh9L06LOy7Z+M+DgkvAUTSPutWB7vpaYGcDktfdKz0KYX0hJ/0VrVciK8TuYU1fGsZVlHWXpz9H64KM8mkuye1ga7AbjjbeWII3V/ZNLRaJRz5GA6gSNgTNpqe5mNIh/oOKjbv4uQb+gtBvdm4lobdiQQUHwYHnh3YsF3cKMTDb8pmdmY6YaV5qwzSovitbzzGGR09YSmS0iED0/ylj9H7kokGMpg1ey8yHPzGJrKSx+mp53oFXirQjhhvhqQMJiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=u0gq4qr2jI+1FpXsAkUAnAZEh9Ot1CYUtuKyLj+j4u8=;
 b=bJF5M3KFAIGRVJqN4kZ4WHFmddwNKE3+5DkywR1my7xpAiKFgMmfOdexAnR/Sk1RwcPxMCdYGnRG8Ukojzv0wQ7DIPKfWuGQ73xrASDp+Z6OG6y7qII5B89mXZp4Iad+TdRPhI1wBGaYJjBjLzYXVQ3BEpJ8EgWtU4OLYZrtmsCoZZ0Ury/4cVTg29uiSAlj8xzibWB/m8qPVZtOPp16wcqR8Jxh9hMwI5b/upJVwQIu8nDQu+JQ84gDmaa2dbtb0m3PQMkMPt2SLu2EoDnPiEt5Bv1AhyFDzE8T0hww7IOwHuBspnvuD8R6BvK7TmmtPX3FYUYvQwBTsRuFDuv4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0gq4qr2jI+1FpXsAkUAnAZEh9Ot1CYUtuKyLj+j4u8=;
 b=MCL8WBjil32UQ3VJ+j1Uwe0R2MF7okoeWBYQapgyz99Q7hkTJjGRBUamNW5+IRzsq72ZSD0ePSdkRsYvRhEo7uPOw2oaIjD6GBAOkC0ntTQsa+1j5IZwkC9h1LKkO2CAYl+gKCHfUooj4SFT10q4a988KPcfYYARBeUNxq+UEek=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v1 07/14] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXlPLBYGJaUEBt502oB439VJRFraucfJAAgADQqYA=
Date: Fri, 10 Sep 2021 12:01:18 +0000
Message-ID: <1DB601D4-C446-4102-811C-63EDDE3D2BC5@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <a3318d9459ace64224a14e4424eef657e2ed5b69.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109091629020.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 38b0a54c-37a2-4a84-19a6-08d97452b8b3
x-ms-traffictypediagnostic: AM6PR08MB4293:|DB6PR0802MB2583:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2583534F019010A970126565FCD69@DB6PR0802MB2583.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KFIR6CsBZXL+psT0Bfn3M+Efa6dCbuOznZi1PcQsFXbDjGF/7ifiL4Ayr0meZhc7qI19aTX+qeRodMcrG3zs+DnfRhtdoVu9JVZB1A6fMT56lhnj+qm3LwLQbJAtSEC2/SDAq0GWoUdmtD845UXJTy/T2Dsvn50GeTsmbuLh1E4/mw60q05PPh2EQx35YZ8U9nQJjR1IKU6lU6wIEiILmwo6waIh58QmXBzmX2M+TKlVN44N+1hHWhwfXK9LtcrohOtWHMtFQ7fFknfYLCQmV3b+flLwS4YFbAjosuKQb1q3A7P+5cf5oVF45sGlkg60l/b0Adh8s1tw6JgIJHfvL85YHUOjWv7R8tNhqw8KVi2TttUHVOixzzwcUnSLxItZ6c2sKO75vBqF7Aq3ZexMD8wGBHYAhZNbgVwkqLgobk40fR6pIya5QneUK0KW+DvWNWCcD6ruugy/3y71KRT791+HzCnjf9uQ/JjfD8c4759mKM25CarN5zePLLdO1K5APrZBRKmlMGRe8I+p1B2SbFJLHNgM6YcI/JZf1xy+OttR/fd/DEcXs1/oTpLfBLrDiw8N7CRjBlDLOR1D+4b3zSAG/DccJr61eVVRN5x/5KYFeWzYMYWAGS4UHLsCVjQaF8U+dujhS2odhXfrOTdlVxRakrdajy0SPg9Dq03NHu+mcfjfXQbr/R/sAcO94pZNiKgnAD1ZG+uoIjbSIokkVYB/hcq+XsrBvhYsu1KGkYX/wIlH/PAQO6kqJO1Rb9r3cEwghmkbn0WVuu6vxmLzDTAQNFjcYR9/WItzas0ZPsIOvHmaGNP8ATdn6N+itrLnWTBTWkBZelIUoq5w9R9fEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(122000001)(38100700002)(2616005)(83380400001)(4326008)(33656002)(71200400001)(478600001)(86362001)(36756003)(6512007)(66946007)(38070700005)(2906002)(91956017)(6916009)(8676002)(76116006)(64756008)(5660300002)(66556008)(66476007)(66446008)(6486002)(186003)(8936002)(316002)(26005)(53546011)(6506007)(54906003)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ED938E709D3A0248B235C02DE48A7EBD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4293
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6168449-58b8-4766-3164-08d97452b2a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rr7qdu9/44md0NpPq7qpjqj5SRlyStvSNzGYnvg9dyF9NJznp6fIjqNHgxMYB+ZNLCjxrL406MTjpn0kIcJa6UN4hwbIejn2wtzTc+gJu32HTicSxxAFdRu5WbzDYQLZdV0pXuH3EfQcZzOpkgl8zSS++V82bqYtkPoXwwsoY0mty/DpW9NxSJGMD/VRK2tgvaU8Ver7ju6bsvIr7ofC6a7GX0n19GtvK7LNXN46AfWiZu8H1vl2MlBQ7qQM6lLfqM8plhZ/BsWXF9w3g0N+P4o4NxltqkPzeD9SN3yD5mFiH/e6JnhuMGDEk0ywZ6uvqj4wIyC0RDgQp7/gQd+em4Vul+xZNgkpwbQyLuxd2s/Q2y86a9ex/51QjyV+CZlyiDBWvsP0A0d9l/Z04hhx1xUXMyxXBL+a4VWmhTDzuEJy4bAP/Zz5a+12/ALp0MMfqJrL696whNHzw0ukDNABhn4OQvb6Ke3CzDIUd51MQ6BJe+8lQAp2F3UQ3lbxFEHERVMP8wyaYZ+FWjmcIqAgUAcjG8WGBv2QHupFWyeRbdfZrJYI58ziHjYLrk2ibk1q8suAp5vaLOrQAaKFJwBsevuwFHEvGxVNQgLR0Ed22jUw2zjJhNiHQ2mZ4tKhQqGFNYwkTWIcGPu3udkjfkfGwDibWnev+3IT8Bl9xk8hV6IktMWEX7d2XhObEKSQ3BfT0uq8U5C8QnWb2T/yFQsYkbgbwi0HV30gTa43rV0877r/Yxb6MzS6BlfQqsan1YDtT7U35oSpfjEsw62L1VnyT0Bi0NLans2IeDi+ryOPeAuoigAm2mMk7I+GZZHIN1AB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6486002)(6512007)(2616005)(107886003)(8676002)(54906003)(316002)(33656002)(81166007)(5660300002)(26005)(70586007)(53546011)(6506007)(83380400001)(70206006)(508600001)(36756003)(2906002)(336012)(186003)(4326008)(82310400003)(36860700001)(47076005)(86362001)(6862004)(356005)(8936002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 12:01:28.3431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b0a54c-37a2-4a84-19a6-08d97452b8b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2583

Hi Stefano,

> On 10 Sep 2021, at 12:34 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Thu, 19 Aug 2021, Rahul Singh wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>=20
>> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
>> space to the XEN memory.
>>=20
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com=
>
>> ---
>> xen/arch/arm/pci/Makefile          |  1 +
>> xen/arch/arm/pci/pci-host-zynqmp.c | 59 ++++++++++++++++++++++++++++++
>> 2 files changed, 60 insertions(+)
>> create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
>>=20
>> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
>> index 6f32fbbe67..1d045ade01 100644
>> --- a/xen/arch/arm/pci/Makefile
>> +++ b/xen/arch/arm/pci/Makefile
>> @@ -3,3 +3,4 @@ obj-y +=3D pci-access.o
>> obj-y +=3D pci-host-generic.o
>> obj-y +=3D pci-host-common.o
>> obj-y +=3D ecam.o
>> +obj-y +=3D pci-host-zynqmp.o
>> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-h=
ost-zynqmp.c
>> new file mode 100644
>> index 0000000000..fe103e3855
>> --- /dev/null
>> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
>> @@ -0,0 +1,59 @@
>> +/*
>> + * Copyright (C) 2020-2021 EPAM Systems
>> + *
>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>> + * Based on xen/arch/arm/pci/pci-host-generic.c
>> + * Copyright (C) 2014 ARM Limited Will Deacon <will.deacon@arm.com>
>=20
> Only one Copyright line per file is enough :-)
>=20
> But actually all the Copyright lines with a name or a company name are
> not really required or useful, as the copyright is noted in full details
> in the commit messages (author and signed-off-by lines). I would remove
> them all from the new files added by this series.

Ok. Let me remove in next version.
>=20
>=20
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + */
>> +
>> +#include <asm/device.h>
>> +#include <xen/pci.h>
>> +#include <asm/pci.h>
>> +
>> +static const struct dt_device_match gen_pci_dt_match[] =3D {
>> +    { .compatible =3D "xlnx,nwl-pcie-2.11",
>> +      .data =3D       &pci_generic_ecam_ops },
>> +    { },
>> +};
>> +
>> +static int gen_pci_dt_init(struct dt_device_node *dev, const void *data=
)
>> +{
>> +    const struct dt_device_match *of_id;
>> +    const struct pci_ecam_ops *ops;
>> +
>> +    of_id =3D dt_match_node(gen_pci_dt_match, dev->dev.of_node);
>=20
> This should be superfluous

Ack. I will remove the dt_match_node(..) in next version.

Regards,
Rahul


