Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2C40E19D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 18:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188641.337877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQuM6-0007DL-GH; Thu, 16 Sep 2021 16:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188641.337877; Thu, 16 Sep 2021 16:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQuM6-0007AQ-Cz; Thu, 16 Sep 2021 16:35:22 +0000
Received: by outflank-mailman (input) for mailman id 188641;
 Thu, 16 Sep 2021 16:35:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lm3Y=OG=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQuM4-0007AK-LR
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 16:35:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13d872ae-170c-11ec-b61f-12813bfff9fa;
 Thu, 16 Sep 2021 16:35:18 +0000 (UTC)
Received: from DU2P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::35)
 by DBBPR08MB6012.eurprd08.prod.outlook.com (2603:10a6:10:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 16:35:14 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::9d) by DU2P251CA0023.outlook.office365.com
 (2603:10a6:10:230::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 16 Sep 2021 16:35:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 16:35:14 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 16 Sep 2021 16:35:14 +0000
Received: from 53b85a6a011b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0E24062-5434-4A8C-8C72-F0892A3C3F17.1; 
 Thu, 16 Sep 2021 16:35:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53b85a6a011b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 16:35:07 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1620.eurprd08.prod.outlook.com (2603:10a6:203:3a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 16 Sep
 2021 16:35:05 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 16:35:05 +0000
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
X-Inumbo-ID: 13d872ae-170c-11ec-b61f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA9fprGsLIHwdgvV+o6Ibk9ZfgK3uN7JblgkMGYQA3k=;
 b=aO1d0oZdPc9p0xYglspRz5o5dq1zOFNC5QJCk0tHHlyyPXHd4uAqDGFk08x4UcN937AFJjykUVeMpKObiQv+HTfjo1RqIrqWIDoo3g9UQ5xCKySqtrxOUhT7eCtj+YwFV/MskQwFs1OTTljxHYC5yzhOjqEUPYj/j0Iou7uwPjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e0352f647ed9c7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9p/9gQ5TTQNU+M5YfaGZW4tfY63veH0Bi53TrpsqrYcLxzIuAoGxVTnR6IB9mrdUdiOEUpA0shrnHHXfPRu0sqBniswyrpnz0EW63o3gvNV8dmOfB9o4cQwBDXjInUhqCjHeUrJ1krRwpmN/CHeA5rtVjWD+xYC1471I6LSuWDfSj7YkHVJoQ7KRYx5NTxQaP4HkmUp8LcKHNzVq6qrFqfaKlQdCEsoKeyZ5/V59CoZkm6+EXvlX17diGczGEK3ilb1edSXzCFJ1dDTPHFI7zc0OwYzCZRPXBidRqRNIy9DxnZ4js1zHR45rmDMCa0k6LruitALVEfqlSlNluHB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OA9fprGsLIHwdgvV+o6Ibk9ZfgK3uN7JblgkMGYQA3k=;
 b=YUosHlHMvMgQ+aDEgw9VClGo0gCEBky4YxlP91EgHA5rGag0ZXdaCfnljaVgmrZ0V1BivfnFSDeLQNgiAY2VkQ7Hp2y2mMd/pWtnBF8XjcBv7FjCbfZzknnKW3As5+E0CopbbmA9KtWk+xLgsfW5zXdxNpCmCVZJNYBxEUgU0O4gVsOSo9pR9oMimn/DleMFA0jdOkOt3rQ0vKKjqR1lY5T3TOMw9QW4pDNf7iz1VeAxEYNqNqYMbPLQnK4POa6o5/YSKaWz/w1YvSs8x60Yfw0Yb+IihgsAjqFudgkX2p9s80F7/fWYgs7xGZnFZtIXbKB/7SkhFTeLqrzVYnSwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA9fprGsLIHwdgvV+o6Ibk9ZfgK3uN7JblgkMGYQA3k=;
 b=aO1d0oZdPc9p0xYglspRz5o5dq1zOFNC5QJCk0tHHlyyPXHd4uAqDGFk08x4UcN937AFJjykUVeMpKObiQv+HTfjo1RqIrqWIDoo3g9UQ5xCKySqtrxOUhT7eCtj+YwFV/MskQwFs1OTTljxHYC5yzhOjqEUPYj/j0Iou7uwPjg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXlPL+C+mRsI0CR06NagiBtFP5pauckjcAgAp1fQA=
Date: Thu, 16 Sep 2021 16:35:05 +0000
Message-ID: <38E94844-FB48-4245-9D73-48ED897CAF13@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091742210.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109091742210.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f0075bea-c6f7-4202-4836-08d9792ff5d4
x-ms-traffictypediagnostic: AM5PR0801MB1620:|DBBPR08MB6012:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB60126F8756BC4CC923D66DEDFCDC9@DBBPR08MB6012.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v52AEfNM0gXxOOXrAHbidek0PnGxFN07PNlJX8t7D9XKcPaG7CcLHertD+rISd+6CJxeuRpmcDYKGeSv+JDLdrg1G7F5RZXGjtY5knWyu3ql2PW444WaQ7+8XdGnJ1RA7Y8aNRbkDokfzfOVdRVk20WPZy5RoV8vlZ2xK8c9J11Irfn2QT4krOT5qZZcCHetsy92iUoUsO/trGJ1NpE6mhNPjaqZwGg1ZLCDjF27vtI/TlEaEHmENDs7Nam33M9+91gdOigcuzBLi682TkOAe93xhjBgf64ypzxKUafEHnGzaEUuwI7JihJFX4RSYpItCAu/xaL26ztr4osUuOT9Z5zm/a/+KkMgkXhCldqpBKjjtASY064rpzPqc5SfOpVd25ksR/H7J3lfhd79g2+/JYB3V/mQUK23lpO6iRsWVbgRqJmW8CV5LZ+OSxcMvqcl2THUG0IWJWq5RQ6bO+GzbMIhHefYzvLsrncwO7rXHUdtBcvICuSUE2JwNy8A+9N1nOF+clpwKdI4gJ+D+ZQ7Q0763Vk0TZbQRlor8KGtoqI+o3+DNqou7PPe3dconlXot00zG0UJOswM/p7Hrzsqh1tPgMrNeM85e3UNIYOW/xDDKzyPPvfb97slagbUyAChBNXXQBgGeDuqT3Cz8KcBL+vB4ZLdjQoBdQTL/u4JzRo2LUFFaWUlIfMlzqOo5cjH5tT2tCTSafXtzVjkznbPfjVeKRofKZdOjeF8jBvAfP6m+Un/J9txrN/SI+bocT07
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(86362001)(8936002)(4326008)(6916009)(316002)(83380400001)(26005)(36756003)(33656002)(53546011)(6486002)(122000001)(478600001)(38070700005)(7416002)(91956017)(186003)(66446008)(66556008)(66476007)(66946007)(2906002)(71200400001)(8676002)(38100700002)(76116006)(5660300002)(2616005)(6512007)(64756008)(54906003)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B8CE46B74D305488FD66E50E7424A09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1620
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c32697e2-4f7b-4b05-463d-08d9792ff0a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qux8u5qNmPCAjCoxx3hIuajZDp+hOHgZNSIVUG5NaWh38rQs+O8Uy/EQ4hSpms0W3+63LsOTE1tYGgByOjX5x369z1VnTQWAX0Gl3CoqwNWvoQJLab1B1oeJ9rchq85tC1VkM38y71lXbyTUxBjCkumIGDjD54D4C71Df6xo8sBjquz5WS8bhJdyeMl5la99eoyWSZkiM3tX26BQDLZTpdHfhk3YWPy7B//Lsg6UE8wdDPH0DG5C3y5kutpDxIexJ9yz8CPpR5q1rjwRfsmJfOStflmtvD3L2NSeqGNuR/AnPpqTC2/4IzEQnrQeBl5khEeZwJHRR5q/CS5XdAez5974au2/LkJz272WYAZUXTIJtlnZ4anCRjS7z/yxSeAZ7akMJtpXV9YfvJ1iDHHdRdr1la+4K18VbWxxVnOObJdqwqR+0jy6vpK3Xg6uNOb5HcRZW3SXxmJmHCW5TGDvV7onePE9XWfwPPFDX66pMq4O70zde9IvS/FDlKnNANSso6HwhZOGMjo5s3HUAFdCsK10uKUz3/FZWKG1vkIk4ZDtpwUWUJKMrHDPiWx9Bu74aPDeGlLFwgYDTq8ShkA3wEkhZf+/ZO4v+Qbi+6VSqKnBgM58gZ01THqIEAQMQm/6xwV7g+9Ox+NJO2Q6lk4BUHG/pP19Q3yMUrN8qa8aoQz04zuLc7CycVQfvAyBfjq2AR8DlaCKFXLxg4MtO4ioAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(6862004)(54906003)(316002)(356005)(81166007)(36756003)(70206006)(82310400003)(86362001)(47076005)(36860700001)(508600001)(6486002)(6512007)(107886003)(8936002)(8676002)(26005)(6506007)(5660300002)(53546011)(186003)(83380400001)(4326008)(2906002)(336012)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 16:35:14.4309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0075bea-c6f7-4202-4836-08d9792ff5d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6012

Hi Stefano,

> On 10 Sep 2021, at 1:51 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 19 Aug 2021, Rahul Singh wrote:
>> libxl will create an emulated PCI device tree node in the device tree to
>> enable the guest OS to discover the virtual PCI during guest boot.
>> Emulated PCI device tree node will only be created when there is any
>> device assigned to guest.
>>=20
>> A new area has been reserved in the arm guest physical map at
>> which the VPCI bus is declared in the device tree (reg and ranges
>> parameters of the node).
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> tools/libs/light/libxl_arm.c          | 109 ++++++++++++++++++++++++++
>> tools/libs/light/libxl_types.idl      |   1 +
>> tools/xl/xl_parse.c                   |   2 +
>> xen/include/public/arch-arm.h         |  11 +++
>> xen/include/public/device_tree_defs.h |   1 +
>> 5 files changed, 124 insertions(+)
>>=20
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index e3140a6e00..a091e97e76 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *f=
dt,
>>     return fdt_property(fdt, "reg", regs, sizeof(regs));
>> }
>>=20
>> +static int fdt_property_values(libxl__gc *gc, void *fdt,
>> +        const char *name, unsigned num_cells, ...)
>> +{
>> +    uint32_t prop[num_cells];
>> +    be32 *cells =3D &prop[0];
>> +    int i;
>> +    va_list ap;
>> +    uint32_t arg;
>> +
>> +    va_start(ap, num_cells);
>> +    for (i =3D 0 ; i < num_cells; i++) {
>> +        arg =3D va_arg(ap, uint32_t);
>> +        set_cell(&cells, 1, arg);
>> +    }
>> +    va_end(ap);
>> +
>> +    return fdt_property(fdt, name, prop, sizeof(prop));
>> +}
>> +
>> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
>> +                                    unsigned addr_cells,
>> +                                    unsigned size_cells,
>> +                                    unsigned num_regs, ...)
>> +{
>> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
>> +    be32 *cells =3D &regs[0];
>> +    int i;
>> +    va_list ap;
>> +    uint64_t arg;
>> +
>> +    va_start(ap, num_regs);
>> +    for (i =3D 0 ; i < num_regs; i++) {
>> +        /* Set the memory bit field */
>> +        arg =3D va_arg(ap, uint64_t);
>> +        set_cell(&cells, 1, arg);
>=20
> Shouldn't this be uint32_t given that it is 1 cell exactly?

Yes I will change it to uint32_t.
>=20
>=20
>> +        /* Set the vpci bus address */
>> +        arg =3D addr_cells ? va_arg(ap, uint64_t) : 0;
>> +        set_cell(&cells, addr_cells , arg);
>> +
>> +        /* Set the cpu bus address where vpci address is mapped */
>> +        set_cell(&cells, addr_cells, arg);
>> +
>> +        /* Set the vpci size requested */
>> +        arg =3D size_cells ? va_arg(ap, uint64_t) : 0;
>> +        set_cell(&cells, size_cells,arg);
>                                       ^ space

Ack.
>=20
>=20
>> +    }
>> +    va_end(ap);
>> +
>> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
>> +}
>> +
>> static int make_root_properties(libxl__gc *gc,
>>                                 const libxl_version_info *vers,
>>                                 void *fdt)
>> @@ -668,6 +720,57 @@ static int make_vpl011_uart_node(libxl__gc *gc, voi=
d *fdt,
>>     return 0;
>> }
>>=20
>> +static int make_vpci_node(libxl__gc *gc, void *fdt,
>> +        const struct arch_info *ainfo,
>> +        struct xc_dom_image *dom)
>> +{
>> +    int res;
>> +    const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
>> +    const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
>> +    const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
>> +
>> +    res =3D fdt_begin_node(fdt, name);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_string(fdt, "device_type", "pci");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_values(gc, fdt, "bus-range", 2, 0,17);
>                                                            ^ space
>=20
Ack.=20
>=20
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#address-cells", 3);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#size-cells", 2);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_string(fdt, "status", "okay");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>> +        GUEST_ROOT_SIZE_CELLS, 2,
>> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_S=
IZE,
>> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR=
,
>> +        GUEST_VPCI_PREFETCH_MEM_SIZE);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_values(gc, fdt, "msi-map", 4, 0, GUEST_PHANDLE=
_ITS,
>> +                              0, 0x10000);
>> +    if (res) return res;
>=20
> I agree with Julien that we shouldn't add it now if it is not working.
Ack.
>=20
> One question: what about legacy interrupts? If they are supported,
> shouldn't we have interrupts and interrupt-parent properties?

As per current design legacy interrupt will not be supported.
>=20
>=20
>> +    res =3D fdt_end_node(fdt);
>> +    if (res) return res;
>> +
>> +    return 0;
>> +}
>> +
>> static const struct arch_info *get_arch_info(libxl__gc *gc,
>>                                              const struct xc_dom_image *=
dom)
>> {
>> @@ -971,6 +1074,9 @@ next_resize:
>>         if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
>>             FDT( make_optee_node(gc, fdt) );
>>=20
>> +        if (libxl_defbool_val(info->arch_arm.vpci))
>> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>> +
>>         if (pfdt)
>>             FDT( copy_partial_fdt(gc, fdt, pfdt) );
>>=20
>> @@ -1189,6 +1295,9 @@ void libxl__arch_domain_build_info_setdefault(libx=
l__gc *gc,
>>     /* ACPI is disabled by default */
>>     libxl_defbool_setdefault(&b_info->acpi, false);
>>=20
>> +    /* VPCI is disabled by default */
>> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);
>> +
>>     if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
>>         return;
>>=20
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_t=
ypes.idl
>> index 3f9fff653a..78b1ddf0b8 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -644,6 +644,7 @@ libxl_domain_build_info =3D Struct("domain_build_inf=
o",[
>>=20
>>     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>                                ("vuart", libxl_vuart_type),
>> +                               ("vpci", libxl_defbool),
>>                               ])),
>>     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>                               ])),
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index 17dddb4cd5..ffafbeffb4 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source,
>>         }
>>         if (d_config->num_pcidevs && c_info->type =3D=3D LIBXL_DOMAIN_TY=
PE_PV)
>>             libxl_defbool_set(&b_info->u.pv.e820_host, true);
>> +        if (d_config->num_pcidevs)
>> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>>     }
>>=20
>>     if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm=
.h
>> index 0a9749e768..01d13e669e 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -426,6 +426,17 @@ typedef uint64_t xen_callback_t;
>> #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>> #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>>=20
>> +/* PCI-PCIe memory space types */
>> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
>> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
>> +
>> +/* Guest PCI-PCIe memory space where config space and BAR will be avail=
able.*/
>> +#define GUEST_VPCI_PREFETCH_MEM_ADDR  xen_mk_ullong(0x900000000)
>> +#define GUEST_VPCI_MEM_ADDR           xen_mk_ullong(0x20000000)
>> +
>> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x2000000000)
>> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x04000000)
>=20
> Now I get it: GUEST_VPCI_ECAM_BASE was just for the config space, not
> the aperture. The apertures are starting at 0x20000000 and 0x900000000.
Yes right.
>=20
> Speaking of which, isn't GUEST_VPCI_MEM_SIZE a bit too small? There
> could be PCI devices with a <4GB requirement. Maybe 256MB?

Yes I will allocate the 256 MB.

Regards,
Rahul


