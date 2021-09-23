Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D541A4161B1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194391.346292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQHf-0007gp-P6; Thu, 23 Sep 2021 15:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194391.346292; Thu, 23 Sep 2021 15:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQHf-0007du-Lh; Thu, 23 Sep 2021 15:05:11 +0000
Received: by outflank-mailman (input) for mailman id 194391;
 Thu, 23 Sep 2021 15:05:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQHd-0007cJ-VT
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:05:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab828809-2483-4b72-842d-51463d976851;
 Thu, 23 Sep 2021 15:05:07 +0000 (UTC)
Received: from AM6P193CA0051.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::28)
 by AM5PR0801MB1699.eurprd08.prod.outlook.com (2603:10a6:203:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 15:05:04 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::dd) by AM6P193CA0051.outlook.office365.com
 (2603:10a6:209:8e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 15:05:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:05:04 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Thu, 23 Sep 2021 15:04:06 +0000
Received: from f55a7396d942.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E245724-0687-488F-BDB8-42B1E2FC0054.1; 
 Thu, 23 Sep 2021 15:03:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f55a7396d942.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 15:03:57 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1620.eurprd08.prod.outlook.com (2603:10a6:203:3a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 15:03:55 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 15:03:55 +0000
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
X-Inumbo-ID: ab828809-2483-4b72-842d-51463d976851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSxdhoMMbF/mqnw131qdf2hO7pXPwEWkw6Pj7c3lmLQ=;
 b=vXvlvjFn7eEqX1twUL21XLYCCHsOnYn1Hil7g5C17fWxGbcpU/ZSbd0tKRtmv0tlWWxGEUsdwE5XG0FpkGlmCCZ7unVE7VkbbIWictjzvVtK9BmT3K8eSuVy1FiKI0KNwLNFct16cU4knoKyKmgD1p8Yq+QrKy9JS+2677tAl+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 257b36c61aa6ca08
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAoQRy6S79UqOVqGo3BIg9eOm633gw6FY3RqT9f1WjQoEbTBHvBLl3K0X+FPQlbD/mmPBWjGK2dPZMbZL73oHxfy0a2RMuEvmzxKGJjxViVFNWKEn9DY1Z3a4IFkdlbIMSrvx2Vnt+LwL+8dorkHfsXbmY/9yN4BrTup2GtDhU0oX4vMjzLqtsm2hTJbWpY/tooSn7PUxYruojaEIKz6kvEIWpqCgVP6j4ngP8z4CrYgQO75FnQpcFqhqYzqtuFuc7jZhqseDTwQtbRmfpgQPLQ+J+EFWici1jl+7cMyC77kKKuuC7nYS5izyY4aY4LZNd6VujQTNSidpx5zbfPLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zSxdhoMMbF/mqnw131qdf2hO7pXPwEWkw6Pj7c3lmLQ=;
 b=fuieuE9r6pyen4oAC7+gvaOhHQy6M9BzKkIuWEAt3J4n207JYK8gHl1whBsXtjgb0Ebydhoqi74gp7Lfsb7+mijn2bi6i752LkLiU8yyEqSa8xNR5AG7eXFHhAMxD8HWRKeeHNJ+S3192gj+7aFv9AIMn5LJytP7120HlcIFt5hY44yP6DrRslgC7SDi3BREoOlCWfQ0dSsKT1ExY6mJVU2WuLOwR7C9VjI9SIRiQTXrR6n4O05YW2lzNX8KzlZKEI0cjbSh2z/gmXUk/UHzMsSgHoNHtDHP4lfEABG6/+o9cauvXL8R533PoWObMV+87+b/nHf09szwPyw1WpqNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSxdhoMMbF/mqnw131qdf2hO7pXPwEWkw6Pj7c3lmLQ=;
 b=vXvlvjFn7eEqX1twUL21XLYCCHsOnYn1Hil7g5C17fWxGbcpU/ZSbd0tKRtmv0tlWWxGEUsdwE5XG0FpkGlmCCZ7unVE7VkbbIWictjzvVtK9BmT3K8eSuVy1FiKI0KNwLNFct16cU4knoKyKmgD1p8Yq+QrKy9JS+2677tAl+s=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Topic: [PATCH v2 10/17] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Index: AQHXr6aLQPm07B/B+UG8SHm5ElV1K6uwwKwAgAD4egA=
Date: Thu, 23 Sep 2021 15:03:55 +0000
Message-ID: <F6A0717A-C188-4E15-9DD6-196BA58DADA7@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <9dcb9b3b6b6923db00d6e56da26a8503d5a4855a.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221708500.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221708500.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6e10b345-a6bd-4a32-3b67-08d97ea385ec
x-ms-traffictypediagnostic: AM5PR0801MB1620:|AM5PR0801MB1699:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1699A52DDF8927453CA7907DFCA39@AM5PR0801MB1699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hf/6on+0XXqsdVxHTN2HrsKvQLdjo8kzWfaoNG9UZOh8GBRisNhv9d7RGWc8kmIloMz5Eix1LsZm5jjn+mC5vIGb/Gmm6pOed3w8Z5wYwAf5/CkoUdz6Pmv5M4SevYSZ+LV4SpjiBW8KnrutCry/T6hJY8ONITWn0rcC60TlwQA5EN8721aMMMUnlgsFpS/KmbNAQcrMhQFwe59zKi148fgwamDuZrlvNtrSA8IZjyYGV/qMCBRds9LZkN3Z0/gc83B6ybCiPPoX2VJ8xCy/ggqPKmYg9VOanwQq8osoQKH6AiQZQoT1zoQ62g/mnWtKLoeRoa6egMAW2OkYyUtWgElrv8l6Ut51J6HCzXRWbQscNC5jTDCggBkBWpL6Sw+Nck9OjD39kKI1beq15W4NK09m47DxDGFkYh40vruTFHD2ncmuU3IGEuNKsMAQqoLZqD89KiovVZto5EcwLzKZmISG0T8mnxfcvJdqdpHXYMnPgiOYVIEOQl408R/e4JpwRo5ByqHOwpsdYbPTwDE2up0ZadSIh9zZ/skNzAabYuvzDFh3nEnxNQ69XrDggQlyXGSnoEa/c1nYUqM4RxaN/HjbFWXBQSLA7oj7WqtcYZydj9IiLMCilFl5S77UxiqHKcA93LejoZJ782Uo6w/GVqDx8e16qwatLSnaPNIcqdD3fq/nhSkxF3gPGtg0oSReVP0CaSbB8rJEJ4Wenz+7K+yT5gDZ4/Mj5Wof9mW8Gfr7IZd39FC0qug8MDCAWSBm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(83380400001)(66446008)(76116006)(316002)(5660300002)(66946007)(38070700005)(6916009)(8676002)(91956017)(66556008)(8936002)(36756003)(6486002)(86362001)(2906002)(7416002)(6506007)(53546011)(2616005)(4326008)(6512007)(38100700002)(122000001)(71200400001)(66476007)(186003)(26005)(54906003)(33656002)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <77DF9E54E6B45344B8237F370BAEE72D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1620
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72324085-558c-492a-1c02-08d97ea35cf2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pk1stN4VxxxIZPTXTpOo4eC0lvfEC5ZQAJtNqclIfu8SOnw3hfBeOBNafj3GKKy+G7B3ZMNTLVbwO3SkhlVdAmf9y7eS8JNmXnkXRbqHQf8isgjjNFGpJ/z5GYwXdX6OnVTaZ2UyXCafUqtNsTr7/nzMvTU1ULR8+MDL8O8XpZIWjUlW0/EVDpg9Vec45/reOfAkKSWwCPNejuEGSNaKAH82hai7cu0iVqGeCjI+0htp456Y/w355bUUA0jNeY2wKIiFOn5OysZdbTWYJwW3v/F9n7GSfU8nbqI4cwx3SKXmbZgmHU5FtUqe33jdo9jrCudI271ixqxmrvQSsutUwVrc0MlE8+ErBVLBBgM3TwnE4WloTKWJOSRe6FI/QW9NeHW2SGpmtAn9bCunE0KNmliCN/hOOZMokGkWHfQ+p5EQ5xgqWegk2lYW89aBdBfCpLuK6VkfydjCF5KBSb3FMvbrdmp0TsrglrpwO3n7hYhPPaT2k/IO+5XO+IojG0334RXewRVFap3shHX7+iV/OtQhTf67sOTJtL79JAB+kiYQkPi3+w9R9UkRlfsxPs8Kqsrt4MX3k4ji24IF36Ki653lBRtdeAmg9Q62x4PacziSprs91clgVMNv5KzQNwpi7Zf9AhSZ8opROVh0MK7gQ3OUuKVolWPaCImqZVlvhVnRWF2QGxG0XaMgyqKVJPVmF1Jv+deZ5Zkxf+PX3eorIw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(83380400001)(26005)(356005)(186003)(4326008)(107886003)(70206006)(70586007)(6862004)(8936002)(86362001)(82310400003)(54906003)(508600001)(336012)(47076005)(316002)(81166007)(36860700001)(5660300002)(33656002)(2906002)(8676002)(6512007)(6486002)(2616005)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:05:04.0720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e10b345-a6bd-4a32-3b67-08d97ea385ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1699

Hi Stefano,

> On 23 Sep 2021, at 1:14 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> Add cmdline boot option "pci-passthrough =3D =3D <boolean>" to enable
>> disable the PCI passthrough support on ARM.
> ^ or disable
Ack.
>=20
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2:
>> - Add option in xen-command-line.pandoc
>> - Change pci option to pci-passthrough
>> - modify option from custom_param to boolean param
>> ---
>> docs/misc/xen-command-line.pandoc |  7 +++++++
>> xen/arch/arm/pci/pci.c            | 14 ++++++++++++++
>> xen/common/physdev.c              |  6 ++++++
>> xen/include/asm-arm/pci.h         | 13 +++++++++++++
>> xen/include/asm-x86/pci.h         |  8 ++++++++
>> 5 files changed, 48 insertions(+)
>>=20
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-l=
ine.pandoc
>> index b175645fde..c867f1cf58 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1783,6 +1783,13 @@ All numbers specified must be hexadecimal ones.
>>=20
>> This option can be specified more than once (up to 8 times at present).
>>=20
>> +### pci-passthrough (arm)
>> +> `=3D <boolean>`
>> +
>> +> Default: `false`
>> +
>> +Flag to enable or disable support for PCI passthrough
>> +
>> ### pcid (x86)
>>> `=3D <boolean> | xpti=3D<bool>`
>>=20
>> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
>> index 71fa532842..fe96a9b135 100644
>> --- a/xen/arch/arm/pci/pci.c
>> +++ b/xen/arch/arm/pci/pci.c
>> @@ -16,6 +16,7 @@
>> #include <xen/device_tree.h>
>> #include <xen/errno.h>
>> #include <xen/init.h>
>> +#include <xen/param.h>
>> #include <xen/pci.h>
>>=20
>> /*
>> @@ -65,8 +66,21 @@ static inline int __init acpi_pci_init(void)
>> }
>> #endif
>>=20
>> +/*
>> + * By default pci passthrough is disabled
>> + */
>> +bool_t __read_mostly pci_passthrough_enabled =3D 0;
>=20
> I think we are using bool rather than bool_t nowadays. Also could do =3D
> false.

Yes I missed that I will use bool.
>=20
>=20
>> +boolean_param("pci-passthrough", pci_passthrough_enabled);
>> +
>> static int __init pci_init(void)
>> {
>> +    /*
>> +     * Enable PCI passthrough when has been enabled explicitly
>> +     * (pci-passthrough=3Don)
>> +     */
>> +    if ( !pci_passthrough_enabled)
>=20
> missing space

Ack.=20
>=20
>=20
>> +        return 0;
>> +
>>     pci_segments_init();
>>=20
>>     if ( acpi_disabled )
>> diff --git a/xen/common/physdev.c b/xen/common/physdev.c
>> index 8d44b20db8..7390d5d584 100644
>> --- a/xen/common/physdev.c
>> +++ b/xen/common/physdev.c
>> @@ -19,6 +19,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
>>         struct pci_dev_info pdev_info;
>>         nodeid_t node;
>>=20
>> +        if ( !is_pci_passthrough_enabled() )
>> +            return -ENOSYS;
>> +
>>         ret =3D -EFAULT;
>>         if ( copy_from_guest(&add, arg, 1) !=3D 0 )
>>             break;
>> @@ -54,6 +57,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(vo=
id) arg)
>>     case PHYSDEVOP_pci_device_remove: {
>>         struct physdev_pci_device dev;
>>=20
>> +        if ( !is_pci_passthrough_enabled() )
>> +            return -ENOSYS;
>> +
>>         ret =3D -EFAULT;
>>         if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>>             break;
>> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
>> index 7dd9eb3dba..f2f86be9bc 100644
>> --- a/xen/include/asm-arm/pci.h
>> +++ b/xen/include/asm-arm/pci.h
>> @@ -19,14 +19,27 @@
>>=20
>> #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>>=20
>> +extern bool_t pci_passthrough_enabled;
>> +
>> /* Arch pci dev struct */
>> struct arch_pci_dev {
>>     struct device dev;
>> };
>>=20
>> +static always_inline bool is_pci_passthrough_enabled(void)
>> +{
>> +    return pci_passthrough_enabled;
>> +}
>> #else   /*!CONFIG_HAS_PCI*/
>>=20
>> +#define pci_passthrough_enabled (false)
>=20
> We don't need to define it, do we?

No need to define I will remove.
>=20
>> struct arch_pci_dev { };
>>=20
>> +static always_inline bool is_pci_passthrough_enabled(void)
>> +{
>> +    return false;
>> +}
>> +
>> #endif  /*!CONFIG_HAS_PCI*/
>> #endif /* __ARM_PCI_H__ */
>> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
>> index cc05045e9c..0e160c6d01 100644
>> --- a/xen/include/asm-x86/pci.h
>> +++ b/xen/include/asm-x86/pci.h
>> @@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigne=
d int *seg,
>> extern int pci_mmcfg_config_num;
>> extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>>=20
>> +/*
>> + * Unlike ARM, PCI passthrough always enabled for x86.
>                                 ^ is

Ack.

Regards,
Rahul
>=20
>=20
>> + */
>> +static always_inline bool is_pci_passthrough_enabled(void)
>> +{
>> +    return true;
>> +}
>> +
>> #endif /* __X86_PCI_H__ */
>> --=20
>> 2.17.1


