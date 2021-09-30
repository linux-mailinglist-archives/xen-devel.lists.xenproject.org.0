Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B941D7FC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199769.354025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtWo-0008Rg-30; Thu, 30 Sep 2021 10:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199769.354025; Thu, 30 Sep 2021 10:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtWn-0008Oj-VJ; Thu, 30 Sep 2021 10:43:01 +0000
Received: by outflank-mailman (input) for mailman id 199769;
 Thu, 30 Sep 2021 10:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CD8Y=OU=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mVtWm-0008Od-J0
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:43:00 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d482dc2-21db-11ec-bd44-12813bfff9fa;
 Thu, 30 Sep 2021 10:42:58 +0000 (UTC)
Received: from AS8PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:20b:127::26)
 by AM6PR08MB4040.eurprd08.prod.outlook.com (2603:10a6:20b:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 10:42:56 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::11) by AS8PR04CA0141.outlook.office365.com
 (2603:10a6:20b:127::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 10:42:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 10:42:55 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 30 Sep 2021 10:42:55 +0000
Received: from 3f9faf28cd54.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E5D68E5-3E72-4A50-AF12-679A41BE5498.1; 
 Thu, 30 Sep 2021 10:42:44 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f9faf28cd54.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 10:42:44 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0802MB2561.eurprd08.prod.outlook.com (2603:10a6:203:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 10:42:42 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 10:42:41 +0000
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
X-Inumbo-ID: 2d482dc2-21db-11ec-bd44-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSXoGgx7NxmWUe6x2sgiMmzI+SJ40pEEFvsUCgRO5vw=;
 b=ryvTkHXvWK6DI1DN5WyUn3E8YdkRC349R0X+2MMwnfO5Z3VC9b+EKZewnMMkscDDniGtDtpGynNcNucJEf2inxdGmUztTKYqBaq0kZtn4PJeRdCTNi6SP5CvLxUNUZUHFoB4P+CvUdeAhBXuCsOUPFjrnexlgTthNBiN2s4Etoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef73f219c3c0a208
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hotV08bMnUlwzIsbgCYuLunbxAvnQ8xE76gIYMMERFUZiDXP8cBC4dHLNQ/IQ5JUj+elnSCOhPOc91hJvxt7ho6Otzl8rxmOaMSk7mjV1p5++zPE6nh+FFZO6NgA0kaK5lKDjaDpuKBjxz8X768bCsc/eVUauxg5coUrPc9pAbBEU1xMwsRtzVN8+I8elSAbo9YGOy/RajqYbstTXNEwJmAPX3Dh27WQW2LMWD127VmOe+zqCGpoTjQCsykhHdgTD4MmXqmPfU5RdU2fDaXBlHZ4lWCbbg2pmZlC2AxV8hRK9xkX3U5sxn1oOYp9iulufXIjG+hMgiZbK3TrIgE39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nSXoGgx7NxmWUe6x2sgiMmzI+SJ40pEEFvsUCgRO5vw=;
 b=ezQAYB38W9eSEHTUvVfY/gJFp6yB6r0fzinm7p3b1hXgfgYYgg3NgLCLRrxiPEnPDfDx5mqmeLKfXEYQOC/jW0kgguY25/1k87j0B5uq7gKGUoD7eKKMchW4k8wJ/PGLxTgs98KHl0JNQ1iU3IoJMTYR7M2c48xUsSxFuJiFIzCfV1WAjM3cmFK+FO3GSJwesSHv4MT59vq9TZk8wmgZIZEQGHGP8tPE7aP9z78mmJ3jWb0piodw2GOWcUb5U3BqhWhph2t+F+noKBl77c+FT7y4NZDGjFd18AC63Wj2/RGMxxfUguLr7d+njxdRPgekqPQDsVGrrXA9T0LNpY151Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSXoGgx7NxmWUe6x2sgiMmzI+SJ40pEEFvsUCgRO5vw=;
 b=ryvTkHXvWK6DI1DN5WyUn3E8YdkRC349R0X+2MMwnfO5Z3VC9b+EKZewnMMkscDDniGtDtpGynNcNucJEf2inxdGmUztTKYqBaq0kZtn4PJeRdCTNi6SP5CvLxUNUZUHFoB4P+CvUdeAhBXuCsOUPFjrnexlgTthNBiN2s4Etoo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXtJXoF+vDzFdmiEeINAyFVRQ836u7OKUAgAD9OYCAADC+AA==
Date: Thu, 30 Sep 2021 10:42:41 +0000
Message-ID: <ACBA6FD3-DC58-4531-91BD-DB39E262325E@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109281638210.5022@sstabellini-ThinkPad-T480s>
 <3478d1b9-7043-3505-a125-700eb3761ed4@suse.com>
In-Reply-To: <3478d1b9-7043-3505-a125-700eb3761ed4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51177321-be65-4a13-306f-08d983ff1017
x-ms-traffictypediagnostic: AM5PR0802MB2561:|AM6PR08MB4040:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB404012847F15E82459015993FCAA9@AM6PR08MB4040.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xHQIz/739fAMPlCR9iTUsb6MEybXPAVknXmGvvXFLLiMjqBIPQryKf0/1l+LorfOU4gkuSnSrZY9t0sHWlQdu9P8ATd7yIlXRUtU1vPunZuhRkx8uMqUX2o8YK6b0aXfzdeAVw5x8+cZ9KW7yb5B11R3w/aQQc7p4Ju2MyHJ2rV4kdokTl13JQ0eWhQZ4OYL8WIyK8Gi+XaihO/oleA5q+QJ/PBxmRZg3gTd4WsgpzzCTmwXt7vCL/3SEGY7wT5eRaMgJYSZwY06mg/+yiNO3LNPSDgsGmj6NsMnor84j5JW6v4nSCFYoyqxrhd6Y+0QxgWXHpzofgVn31tZiod29qXN9T2e/drMDb3mQu5GAxKSjT+IGafllA8tuMp/ohXFZYCDMZd3gCiFiX09qYVb9/8qewQWhToKXFy+2Xc7+Spbl6CDO0VObY3FrfJUEZbYHkr+DGpyMhPcqlCxlcW/lJ1r3L6dPfmf/Qc3aw2EmquyYigeFSegnodSYjk5gpAIjqqfLBoAmzginYgEfQEK/4Pt7cVbqXdzxQ90R/4eiC623zPHoWKTusnHLWh5kEbDOhRywN39/VPCI6VG38/LlWcS3XrQmAhhw23pSOp4adx4z4WsJRKOsSuTv2w/oiICH4U7h3KSyzza3JO89e/+Ypxtuc+RIq1Hq/STr4WQ4KEa29Yvw8aZDHb7Njntpp+FPzlbM4JKsJqLJfA+rP21V2XgfVYs91bJMQemHEvy2sN1McY0MWihNyOa1l3Uxl6SlRl1XRZDBfT507ylENb9dxM1dsCw2ygUDSH2biv+EI8ly1EO7SVCIt/6Ml1dBjQpLnLMx+CQCX6n238CEMOC8vpWNEttwxxflUS9dK4R3jw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(91956017)(316002)(53546011)(5660300002)(66446008)(6506007)(4326008)(122000001)(38100700002)(2906002)(86362001)(66476007)(66946007)(64756008)(6916009)(66556008)(71200400001)(54906003)(186003)(6512007)(8676002)(26005)(33656002)(38070700005)(508600001)(2616005)(8936002)(36756003)(6486002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A11552D1688F549B27DDD47D78810D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2561
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aecfa92a-92c7-43a0-5d84-08d983ff077f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZ/o9B1sZAioS/tEC5Wb5LrCiAvIc2Nqun3dp9/3u+vJVImE3dUtsW3ljTDE150F9GmFmieCi18ABYLtvfPVZttVuNVVAAgGm8QnjpqiflcSypNKthbqvfDie51MAaJo9N1TReLCYT5TKe+1T40SNMTI9xNEljfp1B+w0nKFjDy26tScM+MlIFp9Xnki6Mt0jrG6U0r15pb6vSXmfZCd8iqqFg4JXqjugFrcUiP8slCD7ZM610IM1m/LvWIdlJZSY3Y6Q+N0LezM5pZhrG2bD7VGsaZAKXUB9Kd3xEaC4NeXraExETxbmOhIQern5dXqmf649mwjtA34bvCensb3O1gWN+OmKRFlrIY49hdrjCPAiEAu+Fd8Y3bSYLQgrU97Y2kqzmUhkGPiNLiiRw3xsKk6PJyaYXSyl6FmNiVtBvnufyu9b8tZhaPZQVK/FUL+9vEzXmZHzhWoKPYeOcpZuL5QJEpa1F/v/RLDNJ71MjZW9ODuV7FcLBfyiAw4XvfsAH19g90Rnk412fm3uPdEXwixZZQouonF0sLfUhnEdEV0U0XJ5zkja1ZZ61ZT2iugiZfuBztK6duqAymCQNy1YZq+Y3GwN8XeBhX8yIrYuIq/8JMoUBwAg5PwmylSj6wkvCxvu7AzvWFkACAhZHAchXw44ALs3dvW1jbnED0+HppKTzU7uv0TT4V9rSP+ssSTVCdngKAQmD8hMTsNel1t7bVmjHdWioJ2zFqpp4XQQwskWaDcJK6lKnoRiDGDgFNXz2X3vmPnLDXCaw+BvnDfr6Eo07VMcLTCQu69vTP8DQLsb1iGIZIHmJ8FMfz6Baop
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(6862004)(336012)(4326008)(6486002)(6512007)(2616005)(508600001)(70206006)(107886003)(53546011)(82310400003)(36860700001)(54906003)(36756003)(81166007)(47076005)(5660300002)(356005)(6506007)(316002)(33656002)(186003)(2906002)(26005)(8936002)(86362001)(8676002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:42:55.7501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51177321-be65-4a13-306f-08d983ff1017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4040

Hi Jan

> On 30 Sep 2021, at 8:48 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 29.09.2021 18:41, Stefano Stabellini wrote:
>> On Tue, 28 Sep 2021, Rahul Singh wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
>>> @@ -0,0 +1,63 @@
>>> +/*
>>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>>> + * Based on xen/arch/arm/pci/pci-host-generic.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program.  If not, see <http://www.gnu.org/licenses/=
>.
>>> + */
>>> +
>>> +#include <asm/device.h>
>>> +#include <xen/pci.h>
>>> +#include <asm/pci.h>
>>> +
>>> +static int nwl_cfg_reg_index(struct dt_device_node *np)
>>> +{
>>> +    return dt_property_match_string(np, "reg-names", "cfg");
>>> +}
>>=20
>> Can this be __init?
>>=20
>>=20
>>> +/* ECAM ops */
>>> +const struct pci_ecam_ops nwl_pcie_ops =3D {
>>> +    .bus_shift  =3D 20,
>>> +    .cfg_reg_index =3D nwl_cfg_reg_index,
>>> +    .pci_ops    =3D {
>>> +        .map_bus                =3D pci_ecam_map_bus,
>>> +        .read                   =3D pci_generic_config_read,
>>> +        .write                  =3D pci_generic_config_write,
>>> +    }
>>> +};
>>> +
>>> +static const struct dt_device_match nwl_pcie_dt_match[] =3D {
>>=20
>> This should probably be __initconst
>=20
> __initconstrel again as it seems.

Ack. I will use __initconstrel in next version.

Regards,
Rahul
>=20
> Jan
>=20


