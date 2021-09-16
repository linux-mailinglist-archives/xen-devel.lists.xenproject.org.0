Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61E40E01F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 18:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188616.337842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQu4h-0003R0-6j; Thu, 16 Sep 2021 16:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188616.337842; Thu, 16 Sep 2021 16:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQu4h-0003O3-2w; Thu, 16 Sep 2021 16:17:23 +0000
Received: by outflank-mailman (input) for mailman id 188616;
 Thu, 16 Sep 2021 16:17:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lm3Y=OG=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQu4f-0003Nx-7H
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 16:17:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9016ee02-1709-11ec-b619-12813bfff9fa;
 Thu, 16 Sep 2021 16:17:18 +0000 (UTC)
Received: from AM6P192CA0093.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::34)
 by AM6PR08MB4199.eurprd08.prod.outlook.com (2603:10a6:20b:b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 16:17:16 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::e2) by AM6P192CA0093.outlook.office365.com
 (2603:10a6:209:8d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 16:17:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 16:17:15 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Thu, 16 Sep 2021 16:17:15 +0000
Received: from 6226cb8cd231.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 006E3BBB-F8E3-4918-874A-2B011E902145.1; 
 Thu, 16 Sep 2021 16:17:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6226cb8cd231.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 16:17:08 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6711.eurprd08.prod.outlook.com (2603:10a6:20b:351::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 16 Sep
 2021 16:16:56 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 16:16:56 +0000
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
X-Inumbo-ID: 9016ee02-1709-11ec-b619-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q0yQQlbylH6/PLL1la6FC82QDE2edNdgXeRP5R4iVM=;
 b=DXM5MDf1PnJRcKdmeRHNT4naO2tPtoV96MpqydNktPIxS/Jn45OoVFPq3xxmiJcRq7uFNsfBm/yRpRvsyWucK1ooWwx+sBI/P5ArvAlgiycuPppaiamP8uz0J0ZALebNd1PBeLPUaUimCVwTa4Mr794OIxFz6obEt2KwrAtt1M0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6dffc4d5269c652f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYNDIlEHF4HKjUz2ggv9EY25bP9UfFuiibj0N996F88ayS+IF+0iO14JV34HLb7Em9r/zj6KSYhTpZRTo1AUR2oKDtfdRJOnaEQKOtJIhahihAyuDTlUgt/VuqkJb10JZrA4idp6Mxz+SzX3uf1e6QS0W6gmOOD2//E5wxMmZtz3H5ynnwcOertW13TXbv9KuI0hd/J/bVfN4rMKakaPzACSLP8VtYsV+Gysbv0+NR13QZyDOdAwFNM2xaoneZogkZ7nnDutuqzEBy3kwPuevjbIsVbvRcA4l/uxJVYg5UVhPi16DltoQj0/QhxS1BYpHCDqb5lVSvmXJknuTGKdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4q0yQQlbylH6/PLL1la6FC82QDE2edNdgXeRP5R4iVM=;
 b=jQ7FICMLkdygPI2KTJG66dHFvnIUo40cv7MT3g9J0jQxGIii2SmDGrEDOrBqtLs6EaMqxPTyw+dOUcH6kfwel8BA0Y1v6UxXc1tqnJqvgmRtllQbVRdHp45305oiM8TU0quonZhJ7yy/M0F6dpV1WjUkmhqxch+ckJsn22SaKuahXOM1H/c2NLWBgHEt+oxi+JKH8sHzEbdW6VtgPrQFUpdO3XYkVMch/YEtLEq6waaDfk3rCiWwiPlx8rbwEXk+hdVceMklrYbf2A5/FQKZJj3i6uFfbfXMWIdpst0O22sNjjbAkRXvZtYCCftvjTMpr29n424/lKsfNbJbcuDTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4q0yQQlbylH6/PLL1la6FC82QDE2edNdgXeRP5R4iVM=;
 b=DXM5MDf1PnJRcKdmeRHNT4naO2tPtoV96MpqydNktPIxS/Jn45OoVFPq3xxmiJcRq7uFNsfBm/yRpRvsyWucK1ooWwx+sBI/P5ArvAlgiycuPppaiamP8uz0J0ZALebNd1PBeLPUaUimCVwTa4Mr794OIxFz6obEt2KwrAtt1M0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXlPL+C+mRsI0CR06NagiBtFP5pat6ypyAgAHFXICAH0vvgIALJruA
Date: Thu, 16 Sep 2021 16:16:56 +0000
Message-ID: <BAD51906-B4EB-42E4-AC8E-DCABA6220861@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
 <c0ea2f05-bf0a-a8b0-a811-d899516c26ba@xen.org>
 <664B0578-B440-4229-8D6B-7B98857E75BF@arm.com>
 <3e192581-4167-c9aa-2c32-ff0338e9b800@xen.org>
In-Reply-To: <3e192581-4167-c9aa-2c32-ff0338e9b800@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2afb5802-2d4a-4541-bcd2-08d9792d72ed
x-ms-traffictypediagnostic: AS8PR08MB6711:|AM6PR08MB4199:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4199611D857210969A12F1CAFCDC9@AM6PR08MB4199.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oFz2LxSbB1lrXH9nMBh/VVv8oXQqarw983LnKUOlxEPyYGh9cweyMtE6OFK6Yh58ePoUXh4mYO3jx80y/NF7pritR2xcTphuw57HyljarBGUUyEBikgFhR3y5mHs3zwKDXsszy1legRDqITar23iIpGzc7cjb/Kp/6CHcEX7RPMFP5qEkvSNH++hLE6qNhWBxDnAH23ONjjMY9oMDMVhuwiwV1KIn8579FYRA/PFEG2DUTgu+Vz8harldsPSwcuUuJ8tsAlyEXNy3XxLDCIBeDpzVAfTVmhp/nlRbLUX88rrhbPs6LRX0JLQymO1h8FkU6MJV6u6WRKsFzPDqwag5Q+xjXF7F2HwdBEL97gJIb1BUtQAdCigrSeqqzh6PeyzshstufOAHHqtVBOMuKxDr8+0G+ozbMscMlLZeNZwbpZNF9QbKrtk9LAjue7M7AyPLBzdkkr+QZadMxwzdcGc255Lpg80tIDU95OyTwd1sqKrnNTpcDR8O7yOTVX2+9+8RVeu7soZqUVkXMY6MuPF4dnNJnbHO08YgWzT+vjj2dJ2srnkXskbMIwejmZ/gh/RJyK3ZaLJkbaNwmHHIMivSeerjwhSbaDN/8ONa4o+e5CtF8D9gIp3h2tMC1vZs/PAp3QYTKrml/RvrsBr33HVOd4VqSrd1CCTkKA+KYT3S7r1YwodnMEQ+gC9UI9SapIApWpqTn9f3gT9zI3lz96VrQtiJDxp9fOq5/0HY7jljl40B3P90C9BSYm/7nSSWkmPlwHvFemndmAu3lnh5gUZUiuIe0QQGZcag1/IuzzKdv6LncuC4NoYofBklUlFpdd4n+sRZO2+DtcPn82uEYLr1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(66476007)(66556008)(7416002)(36756003)(66446008)(76116006)(6512007)(66946007)(64756008)(8676002)(316002)(71200400001)(2906002)(2616005)(8936002)(186003)(86362001)(26005)(6486002)(53546011)(33656002)(38100700002)(6506007)(478600001)(5660300002)(38070700005)(6916009)(91956017)(4326008)(83380400001)(122000001)(966005)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABC34A4BF96D1846AFC721267DB7B68E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6711
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7744177e-38ff-4ad2-3fd3-08d9792d6789
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QzFIvmffbsGWAokPXazTW040VTtZ1cCTJ2QJBkydyh0YV46YXmIA26MVfhT++sCG4yQEsLvnSapwDgNwD08eBHx4662vWBwQJUt4tP/T1B97iYoq8660ZuZIXChBYHsiU4tmwx/LuBwQSzsD06PJvWJsYZKYI+6C52TmdnSNuw8oXyNcM8dXVMq4yk4Jx9LjUfAJj+oUdUWe8rEoNCVzTP8/vzELU8YfMDuGrXGAxia1duNygdppilJv0uPqG2kvusqOhgxiWyXLBrtyWu06LxYKaCXGxFMo+yFaYOZMkaqSEqP+yl3rZ4aBxc5OUOg9hwQKjp2pY5huiamuS8tHaKkVsxCJ4cJlaKWBAfR8UbibYsODNLXoEDR5ghr9A2Jt4B666KfIMa0x4eZC+AbpJuEnNvEhu1lKZPYeyFyo+6PhUtOggp7LFdv5pc25/KDXgENNyeZodDpRHf4W1lLhqQdRGRAxGIXmKOyL8HNxUdq86N8WzCdqwF3E5aIVDp6sAPUL6iSMJc9hFeRt5xKqB9lBtOKBQQekwtCxBeMDZbVfmoCH17xZ/Omq0yWrvBYiDaMvyZC85Vfa2Ue13kr2jdukxM5Z+Qd5esSn0lYDr+3Qn/VI8o1BfZafuUSGtRO2cp83y5838tfI7Halwm3d6gzcr3V1TVKFVKGsa4X/J13Bf5xF6oDpzWcCvHW0qo6ypue5HrzPJNaX2UXtZl231BxN2DLqUd49/IEajRpDXnmV9V8bDEM5yTjixtOlHFgGe6yqZXqASiFEmiUoYLGmAFCPw33vewZ3VNukx8LyIW8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(26005)(966005)(36756003)(6506007)(47076005)(53546011)(508600001)(336012)(2906002)(107886003)(33656002)(82310400003)(54906003)(2616005)(316002)(70586007)(186003)(6512007)(83380400001)(5660300002)(356005)(81166007)(8676002)(6486002)(70206006)(4326008)(8936002)(6862004)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 16:17:15.6838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afb5802-2d4a-4541-bcd2-08d9792d72ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4199

Hi Julien,

> On 9 Sep 2021, at 2:59 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 20/08/2021 17:03, Rahul Singh wrote:
>> Hi Julien,
>=20
> Hi Rahul,
>=20
>>> On 19 Aug 2021, at 2:00 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Rahul,
>>>=20
>>> On 19/08/2021 13:02, Rahul Singh wrote:
>>>> libxl will create an emulated PCI device tree node in the device tree =
to
>>>> enable the guest OS to discover the virtual PCI during guest boot.
>>>> Emulated PCI device tree node will only be created when there is any
>>>> device assigned to guest.
>>>> A new area has been reserved in the arm guest physical map at
>>>> which the VPCI bus is declared in the device tree (reg and ranges
>>>> parameters of the node).
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> ---
>>>>  tools/libs/light/libxl_arm.c          | 109 +++++++++++++++++++++++++=
+
>>>>  tools/libs/light/libxl_types.idl      |   1 +
>>>>  tools/xl/xl_parse.c                   |   2 +
>>>>  xen/include/public/arch-arm.h         |  11 +++
>>>>  xen/include/public/device_tree_defs.h |   1 +
>>>>  5 files changed, 124 insertions(+)
>>>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm=
.c
>>>> index e3140a6e00..a091e97e76 100644
>>>> --- a/tools/libs/light/libxl_arm.c
>>>> +++ b/tools/libs/light/libxl_arm.c
>>>> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void =
*fdt,
>>>>      return fdt_property(fdt, "reg", regs, sizeof(regs));
>>>>  }
>>>>  +static int fdt_property_values(libxl__gc *gc, void *fdt,
>>>> +        const char *name, unsigned num_cells, ...)
>>>> +{
>>>> +    uint32_t prop[num_cells];
>>>> +    be32 *cells =3D &prop[0];
>>>> +    int i;
>>>> +    va_list ap;
>>>> +    uint32_t arg;
>>>> +
>>>> +    va_start(ap, num_cells);
>>>> +    for (i =3D 0 ; i < num_cells; i++) {
>>>> +        arg =3D va_arg(ap, uint32_t);
>>>> +        set_cell(&cells, 1, arg);
>>>> +    }
>>>> +    va_end(ap);
>>>> +
>>>> +    return fdt_property(fdt, name, prop, sizeof(prop));
>>>> +}
>>>> +
>>>> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
>>>> +                                    unsigned addr_cells,
>>>> +                                    unsigned size_cells,
>>>> +                                    unsigned num_regs, ...)
>>>> +{
>>>> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
>>>> +    be32 *cells =3D &regs[0];
>>>> +    int i;
>>>> +    va_list ap;
>>>> +    uint64_t arg;
>>>> +
>>>> +    va_start(ap, num_regs);
>>>> +    for (i =3D 0 ; i < num_regs; i++) {
>>>> +        /* Set the memory bit field */
>>>> +        arg =3D va_arg(ap, uint64_t);
>>>> +        set_cell(&cells, 1, arg);
>>>> +
>>>> +        /* Set the vpci bus address */
>>>> +        arg =3D addr_cells ? va_arg(ap, uint64_t) : 0;
>>>> +        set_cell(&cells, addr_cells , arg);
>>>> +
>>>> +        /* Set the cpu bus address where vpci address is mapped */
>>>> +        set_cell(&cells, addr_cells, arg);
>>>> +
>>>> +        /* Set the vpci size requested */
>>>> +        arg =3D size_cells ? va_arg(ap, uint64_t) : 0;
>>>> +        set_cell(&cells, size_cells,arg);
>>>> +    }
>>>> +    va_end(ap);
>>>> +
>>>> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
>>>> +}
>>>> +
>>>>  static int make_root_properties(libxl__gc *gc,
>>>>                                  const libxl_version_info *vers,
>>>>                                  void *fdt)
>>>> @@ -668,6 +720,57 @@ static int make_vpl011_uart_node(libxl__gc *gc, v=
oid *fdt,
>>>>      return 0;
>>>>  }
>>>>  +static int make_vpci_node(libxl__gc *gc, void *fdt,
>>>> +        const struct arch_info *ainfo,
>>>> +        struct xc_dom_image *dom)
>>>> +{
>>>> +    int res;
>>>> +    const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
>>>> +    const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
>>>> +    const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
>>>> +
>>>> +    res =3D fdt_begin_node(fdt, name);
>>>> +    if (res) return res;
>>>> +
>>>> +    res =3D fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
>>>> +    if (res) return res;
>>>> +
>>>> +    res =3D fdt_property_string(fdt, "device_type", "pci");
>>>> +    if (res) return res;
>>>> +
>>>> +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>>>> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size)=
;
>>>> +    if (res) return res;
>>>> +
>>>> +    res =3D fdt_property_values(gc, fdt, "bus-range", 2, 0,17);
>>>=20
>>> AFAICT, the "bus-range" is optional. Can you explain why we need it?
>> We need it to implement the function pci_ecam_map_bus().
>=20
> Ok. Then why next question is what does the 17 mean? Is it tie to how we
> implement the vPCI in Xen or the region we reserved?
>=20

Ah. I forgot to change it to 0xff. It should be 0xff.=20

> [...]
>=20
>>>=20
>>>> +
>>>>      if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
>>>>          return;
>>>>  diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libx=
l_types.idl
>>>> index 3f9fff653a..78b1ddf0b8 100644
>>>> --- a/tools/libs/light/libxl_types.idl
>>>> +++ b/tools/libs/light/libxl_types.idl
>>>> @@ -644,6 +644,7 @@ libxl_domain_build_info =3D Struct("domain_build_i=
nfo",[
>>>>        ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>>>                                 ("vuart", libxl_vuart_type),
>>>> +                               ("vpci", libxl_defbool),
>>>=20
>>> Any new addition in the structure should be accompanied with a LIBXL_HA=
VE_* in the libxl.h header.
>> OK.
>>>=20
>>>>                                ])),
>>>>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>>>                                ])),
>>>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>>>> index 17dddb4cd5..ffafbeffb4 100644
>>>> --- a/tools/xl/xl_parse.c
>>>> +++ b/tools/xl/xl_parse.c
>>>> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source=
,
>>>>          }
>>>>          if (d_config->num_pcidevs && c_info->type =3D=3D LIBXL_DOMAIN=
_TYPE_PV)
>>>>              libxl_defbool_set(&b_info->u.pv.e820_host, true);
>>>> +        if (d_config->num_pcidevs)
>>>> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>>>>      }
>>>>        if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
>>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-a=
rm.h
>>>> index 0a9749e768..01d13e669e 100644
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -426,6 +426,17 @@ typedef uint64_t xen_callback_t;
>>>>  #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>>>>  #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>>>>  +/* PCI-PCIe memory space types */
>>>> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
>>>> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
>>>=20
>>> What the size of those regions?
>> Non Prefetch Memory: Size 64 MB start at 512 MB
>> Prefetch Memory: Size 128 GB start at 36 GB
>>>=20
>>>> +
>>>> +/* Guest PCI-PCIe memory space where config space and BAR will be ava=
ilable.*/
>>>> +#define GUEST_VPCI_PREFETCH_MEM_ADDR  xen_mk_ullong(0x900000000)
>>>> +#define GUEST_VPCI_MEM_ADDR           xen_mk_ullong(0x20000000)
>>> So far the memory layout defines the address in ascending order. So ple=
ase add that after GUEST_RAM_BANK_BASES_*.
>> Ok.
>>>=20
>>> However, if I am not mistaken that base address you provide will clash =
with RAM bank 1. It also seem to be pretty high which means that this will =
not work for 32-bit domain or on CPUs that don't allow offer large IPA bits=
.
>> Yes I also checked that now that it is having clash with RAM bank 1.
>> There is unused space is guest memory that we can use for Non Prefetch M=
emory as per below guest memory map.
>> https://gitlab.com/xen-project/fusa/fusa-docs/-/blob/master/high-level/g=
uest-memory-layout-arm.rst
>> Proposed value:
>> Non Prefetch Memory: Size 64 MB start at 0x22001000
>> Prefetch Memory: Size 4 GB start at 4 GB.
>=20
> The base address looks fine to me. However, the sizes are much smaller to=
 what you initially suggested. Would you be able to clarify why the smaller=
 sizes are fine?

As per current design we can have 32 device in guest therefore I thought 64=
 MB is sufficient ( 2 MB per device ).
>=20
>>>=20
>>> I think we need to start making the guest layout more dynamic. The VPCI=
 memory space would have to go right after the end of the RAM allocated for=
 a given guest.
>>>=20
>>>> +
>>>> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x2000000000)
>>>> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x04000000)
>>>=20
>>> It would be better if the size for each region is defined right after e=
ach base.
>> OK.
>>>=20
>>> Also, how did you decide the size of each region?
>> I thought 64 MB will be sufficient. I think it should be based on number=
 of devices we can assign to the guest.
>=20
> We don't have to get the size right now. What I am more interested is to =
have a trace about how those values were decided (even if it just saying ra=
ndom). This will help to make any decision if in the future we need to resi=
ze (in particular downsize) the regions.

As per Stefano suggestion in another mail he suggested 256 MB. I also think=
 256 MB will be sufficient ( 8 MB per device) . I will comment this in code=
.

Regards,
Rahul
>=20
> Cheers,
>=20
> --=20
> Julien Grall


