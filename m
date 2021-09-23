Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BFE4161C0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194400.346303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQL1-0000Od-Ci; Thu, 23 Sep 2021 15:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194400.346303; Thu, 23 Sep 2021 15:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQL1-0000Mi-92; Thu, 23 Sep 2021 15:08:39 +0000
Received: by outflank-mailman (input) for mailman id 194400;
 Thu, 23 Sep 2021 15:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQL0-0000Mc-HD
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:08:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2022d2b0-1c80-11ec-ba51-12813bfff9fa;
 Thu, 23 Sep 2021 15:08:36 +0000 (UTC)
Received: from PR3P189CA0047.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::22)
 by GV1PR08MB7332.eurprd08.prod.outlook.com (2603:10a6:150:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:08:33 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:53:cafe::6c) by PR3P189CA0047.outlook.office365.com
 (2603:10a6:102:53::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 15:08:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:08:32 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Thu, 23 Sep 2021 15:08:31 +0000
Received: from 784eda64e86b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B056137-0EFC-417C-9CAC-CDB6804BF0BB.1; 
 Thu, 23 Sep 2021 15:08:19 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 784eda64e86b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 15:08:19 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6680.eurprd08.prod.outlook.com (2603:10a6:20b:397::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 15:08:18 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 15:08:18 +0000
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
X-Inumbo-ID: 2022d2b0-1c80-11ec-ba51-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmEKL5FOlIqrwgL6aclc6rgeZDwEPx8m8trK9+m/LyA=;
 b=4OKqnAPai/f95/zUJPb096hXkqa9RqDh9qHgIqSiMHHI+70oYvjFoj0Gnhtj7OYSq+fRNARFEf9JcH54xyqwP6LCZTrRUfZynMElILMPREC9YnytNgcxZAoNjWqiwQC4aBTdJnFj5LekkTQnRtuwTRkpEo4k7zrU5y75YNYOZxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cb50aff5fec0c07
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0LTEFx2SEMdDS5Q8+0jxjaGEPD/I5cV3Zrfh+j0jl64zgH4eH27M4MdhqNCm02r0EJdlSpgTNrL0poAgOm52L5ls/dqyRkpROU8+bHhmNHX5ZJmnG4HI9uVr3j1xh3yIMRuIZYHQHGHboAzGy6BNBU/52ivBLMWp+nQYDnsg2YQDjxoBFBtFdnmk3PabXOrez20Nf7weblnWn6n0El7B44hy/9kxbvvHknciE8M0OHhPbklPsy/RjSZreoq+AoIsjjc/+VEvFvEOoqHrqFTeaWa7yBZnWIOtgC++sD2eRbikFQ/b+RawLtrF9tWX+1LTjTPXk0PAYdl1u0/O7PTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tmEKL5FOlIqrwgL6aclc6rgeZDwEPx8m8trK9+m/LyA=;
 b=Dvp2H9cjuSwhfycRWG4cgqynjXckdJi8kTtpxAJ5Fv+EmhvJF13ksAprCJjh0/TjuX9WKdc5fsvrAF9o11zRE2lP0cg0y0/WUo5Pt8nhx5Yw0Lf6Xdyb1mqlI50dQo9YGA99rRUAF3qu0SiQgYZ/ffCyC6jNrOHckjrozIKcYKPjsg38IDutOpcCcEFnguojUU1dhe/JCfqHyIPYDkNDJQoNfO2HYKbqVJWNAEL4nUzHe4B04BEN+0QB5GfxGQjA7wYNmI3cCQqlgXd0KNuzBN9DZhRxbJzKNUOKG4g6MMzgMf7D16CmGrSxg4Ygwx9iFsnZU9l1OhBRis8sr6LRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmEKL5FOlIqrwgL6aclc6rgeZDwEPx8m8trK9+m/LyA=;
 b=4OKqnAPai/f95/zUJPb096hXkqa9RqDh9qHgIqSiMHHI+70oYvjFoj0Gnhtj7OYSq+fRNARFEf9JcH54xyqwP6LCZTrRUfZynMElILMPREC9YnytNgcxZAoNjWqiwQC4aBTdJnFj5LekkTQnRtuwTRkpEo4k7zrU5y75YNYOZxw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v2 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXr6abGeE+lk7OX02wltbxtcd8MKuw4W8AgADY8IA=
Date: Thu, 23 Sep 2021 15:08:18 +0000
Message-ID: <5BB27951-3083-47AE-A6C8-910741171741@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <4b2b04ab1dbc1a5c52bf54c399cdb6cf454183ea.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221911020.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221911020.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e04ed871-b62d-47d4-6601-08d97ea40270
x-ms-traffictypediagnostic: AS8PR08MB6680:|GV1PR08MB7332:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB7332EC9BD18C51871B7CD8FDFCA39@GV1PR08MB7332.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +B517C0AaJqRfExs+7MGyoqzn7p5wqSGbTj2iVdBto3Y/i4HUF9Ezka92BuY8Tkr7nurKMX5axf89GBXXUe5mdrQIXX9sknwani+qIdXJbKIrM9pYsxek9NS1HKUD8lQsF55Rh4UfkAVr7yzbcOhuKUcIj3F/FeHe/HKjJLVi4/uBQgaVx0dOuJJvhkKlIyBVVjo+ctqYG+WOYXKWDqlv7p5ch4p1voS8AXJ/JBuFjA7DdBrkQfiyse/7u2jPk8beZVGmcXr1VMwtMXjJL/OsR+kTCCwSeNq2Cev7liV+k6wVDu+aBu0N99JlTL2MDUMryk3EDKkafXWI2xqDT9KYDeQ9U7LwKf/c3B2EQww4r6Kvja3G4EMleeOcF3xvmjFAwNWlygIvlfHdjQpLLCOSOlFgNULS/Yd3OI0Ra92992BqaC5HX4GpHSQCUkK5N6xFE6Jkl8/VcssWdrHwL5vILTx+KbOoBOAeVc6Ktwb/ALDliU3DhorDWr0HZJg9ezfS+Ak+KUeIBsS5skskrO4oo6OXmO6m2q3ZODMhDtE05moVW906OL1lKW1NJrok7BIT1c7sg57V05GrU9XHkN4gg/vME6y1RQgG6rhbl40vNXMxvgufCp5+Xx5efEC/YTVJy5TNtgmoB90ouwZqKmULh2p9hD1oURZ0WFdKlcGKtimQEIdecL9JI/JEvDc/l4hUrFg0aB78WmgTDIOKM0vps6CfQ6oz3f2q4eQrnnKIa2mquLRgTL4wTknxJEgGLynhcTYvTPVAFATyFfq4TqNKaOst1XbkCLmQWPcsbSsfwmYLzcnmif+LRxE5nZsOsfT4hHTd7mz+ObILXivW3wv+9IgwLesLBRSyt4qBJf2jsM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(2616005)(53546011)(38100700002)(26005)(91956017)(76116006)(86362001)(4326008)(66946007)(122000001)(6506007)(8676002)(66556008)(508600001)(66476007)(54906003)(38070700005)(36756003)(8936002)(6916009)(71200400001)(33656002)(186003)(316002)(5660300002)(66446008)(2906002)(64756008)(6512007)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D675A0CC20CE0D4FB469154FB27A1442@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6680
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b87f70c-08f7-4d77-d2ae-08d97ea3f9b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OUoT46ZGFGs7+aH4d4jzr06g77oaxYx5s0WQwSGV8uwCYbC+7PkwWfhKiPsqWqcJiWIxRrheZwMk8VAokBKhb+l9fcG+P6y953bCWJ7e6iiD0sLcOR0A0GsEhNqk1mcK0VPOwzfWk5o45HUZngI3umR2QS3AViiuo7wZx2dQYBxj2ImPz+XAFcutsa4fwcOJK2UlfCDI7pmphARqN/GRsbDy0yLAVzyMRNvhFqruRe0z4ltW2wnrosUrl6/xx1YdLlUWhxN2labhHoJVSSYXYc+m6f1KR1j9DzNx+ifO9vxCbAkev5If659NiYz5CP+mpGMpIkB04Bx17RFFuMWMW5gv8+Qqterxoa+6gwM9n14PYOnEy3adivcFmD0vI3uwhwcPdacs23gw/TeXkhxbJi0o4rMFnifavLxCC4ZTuSYCXPttgIvyL0wnZtGqbXSeNcsjRYpao9Z2QEkrilGuNbznAOnlyzv6vX3op+tzmv9PIv51NqsoWpwBCPJIlIJ1Wdo5PsBvCVy5Z1+UOAcHN5w1ngCTRRv66jnnLJSrSj1Hc7ffnSMUXYF3I93JdEjMpgWhtHZjjmB+Dq1S+QXl5VuJoCEG3XQV2668U5M1SjiWmCoZbuDG3CNWiFusn3zHPZBvVNjhGYPbf2giSHJs92IogQo3HbPxILI2gFfAEId9RobpTcogfL654nsq/stB6hT/6sIfjeuQPhOB8OGQifmudJYrHJeDgi05z2QjXw6JmKhlFP6O7leRGagfK8u5DofMKrzvFFFDujijonc6jV9KYFFod1X45io521TMRI691lugFstMRv5FSZhJ6CGb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(186003)(6862004)(81166007)(6486002)(70586007)(47076005)(26005)(2906002)(33656002)(6512007)(107886003)(86362001)(36756003)(82310400003)(70206006)(2616005)(53546011)(356005)(8676002)(508600001)(316002)(336012)(6506007)(36860700001)(4326008)(54906003)(8936002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:08:32.9213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e04ed871-b62d-47d4-6601-08d97ea40270
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7332

Hi Stefano,

> On 23 Sep 2021, at 3:11 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>=20
>> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
>> space to the XEN memory.
>>=20
>> Patch helps to understand how the generic infrastructure for PCI
>> host-bridge discovery will be used for future references.
>>=20
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com=
>
>> ---
>> Change on v2:
>> - Add more info in commit msg
>> ---
>> xen/arch/arm/pci/Makefile          |  1 +
>> xen/arch/arm/pci/pci-host-zynqmp.c | 58 ++++++++++++++++++++++++++++++
>> 2 files changed, 59 insertions(+)
>> create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
>>=20
>> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
>> index e86f2b46fd..0572c68bba 100644
>> --- a/xen/arch/arm/pci/Makefile
>> +++ b/xen/arch/arm/pci/Makefile
>> @@ -4,3 +4,4 @@ obj-y +=3D pci.o
>> obj-y +=3D pci-host-generic.o
>> obj-y +=3D pci-host-common.o
>> obj-y +=3D ecam.o
>> +obj-y +=3D pci-host-zynqmp.o
>> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-h=
ost-zynqmp.c
>> new file mode 100644
>> index 0000000000..c27b4ea9f0
>> --- /dev/null
>> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
>> @@ -0,0 +1,58 @@
>> +/*
>> + * Based on Linux drivers/pci/controller/pci-host-common.c
>> + * Based on Linux drivers/pci/controller/pci-host-generic.c
>> + * Based on xen/arch/arm/pci/pci-host-generic.c
>> + *
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
>> +int nwl_cfg_reg_index(struct dt_device_node *np)
>=20
> static
>=20

Ack.

Regards,
Rahul


