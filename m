Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B241C234
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 12:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198993.352787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVWRb-0000MS-6l; Wed, 29 Sep 2021 10:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198993.352787; Wed, 29 Sep 2021 10:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVWRb-0000JD-2x; Wed, 29 Sep 2021 10:04:07 +0000
Received: by outflank-mailman (input) for mailman id 198993;
 Wed, 29 Sep 2021 10:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzIg=OT=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVWRZ-0000J2-2O
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 10:04:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 711fef06-2b91-4447-9ed1-fec14ef88117;
 Wed, 29 Sep 2021 10:04:02 +0000 (UTC)
Received: from AS9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:20b:462::6)
 by AM5PR0802MB2515.eurprd08.prod.outlook.com (2603:10a6:203:9f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 10:03:58 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::98) by AS9PR06CA0015.outlook.office365.com
 (2603:10a6:20b:462::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 10:03:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 10:03:56 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Wed, 29 Sep 2021 10:03:53 +0000
Received: from 2f8a9b4fb81e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A120EDD4-E026-46F4-B277-AE70494909B4.1; 
 Wed, 29 Sep 2021 10:03:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2f8a9b4fb81e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 10:03:39 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6927.eurprd08.prod.outlook.com (2603:10a6:102:133::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 10:03:36 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 10:03:36 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Wed, 29 Sep 2021 10:03:36 +0000
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
X-Inumbo-ID: 711fef06-2b91-4447-9ed1-fec14ef88117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWT9PM0Vv9G5RAU1SZ2ct5762l6Ys9Hi/rjB47VZijs=;
 b=6AY+kZlL0PI6GT18cosx2SEHkzsSZogzc3gUj0ZAagtSvuR58lETiMld0eSBu8VMPwrT1IrMF0MS/l3J7ldotj/s8BgH5VLoZUxyEVItQANlNxwaq7zxQGiGGwwYM26YXaQjFYYY3iDeke90buvCRglbsLgClrOaqXGdMIqtFGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4418426482f44a76
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtlKQlt9z5bqGCMbLiv6hy/nMRo7KrdQtdjits4GjsMIlV6uO3ksie17shH8gOmXZu5yqoIemeVhGmXeirnI7XWnsxJFrUGjcoXDFTvBgflkP7+gemX01zc8PcE4CRQvzerg28WqaV5ABguIQ6CrEHf/B8AWGvVip35a/EbPBwtuM7MEGQlK2yrliRktA8FqtM02QK7DyQBQ1WoAJTRG0LDNnu3Z9cCWZRkTY3DvZQQ8iELpeGqdzR5VXwliYpY83YJoqttqx0/vdDKx1Au0EE0BoYO96Tl4Qw+EmTL9B/sQOmtHNnrCMnbdiJjQ0xhrvpGr+QYOv16DeP8vHOwolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wWT9PM0Vv9G5RAU1SZ2ct5762l6Ys9Hi/rjB47VZijs=;
 b=ALebTyhRa8fS6uSegiFmbUVsXeUvzTXpRlEVQY3eJCUMiHR9gkFl1vHRfPrMklpoyg16Itr9rDrz/67XfK4hivTs2rG8dJRP+nd/idz3gshMZFldAKBXynEI5ykgxMqOKAi6hgzgvUMlRdQkNYG0JB4o2EKhAQJqDctx1s1mLYIzz2VPSe6E037J19SE5YdoOrijAZh/j1noT2KdSWUF1HmdG6j4r6SNbCEYlx+5oA4PXKQOd2REcQwWaWo1aJARK8h4KPbcLTowy213Ua30zpjTb16lRg+sOqQ740oxX92LYH9VaKSb2Xrx0kDXUot33Nu6fThE25pwZ5y+/6vgqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWT9PM0Vv9G5RAU1SZ2ct5762l6Ys9Hi/rjB47VZijs=;
 b=6AY+kZlL0PI6GT18cosx2SEHkzsSZogzc3gUj0ZAagtSvuR58lETiMld0eSBu8VMPwrT1IrMF0MS/l3J7ldotj/s8BgH5VLoZUxyEVItQANlNxwaq7zxQGiGGwwYM26YXaQjFYYY3iDeke90buvCRglbsLgClrOaqXGdMIqtFGo=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v3 3/3] arm/efi: load dom0 modules from DT using UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1E500DE6-1680-41F6-BE8E-5B7ECBAD24BA@arm.com>
Date: Wed, 29 Sep 2021 11:03:30 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <69B0AE5A-D327-4224-B7CA-79844C25FD2C@arm.com>
References: <alpine.DEB.2.21.2109281534480.5022@sstabellini-ThinkPad-T480s>
 <1E500DE6-1680-41F6-BE8E-5B7ECBAD24BA@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7427ae72-bddb-4824-beb7-08d983307392
X-MS-TrafficTypeDiagnostic: PAXPR08MB6927:|AM5PR0802MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB25155BF8FC95B1CE7BCE0BF4E4A99@AM5PR0802MB2515.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 41Q+3PFo0Ojk7vQ8s8jw9rpx/uqr0pMRAh0NkP4aPUN+BsUiipYmfmDrg16B9Gma+KSeiRGmfIUhIBWLihbQ64/D4+QyOj2L3JTn/vPMkGKnwUJg1zvwFnhdPCavOCc59vCLKsE30dpc6BgTKLFo258v8Ftxg/jJGbmSnbfW4iGU+GHxjYfl9JEsB/EZl3QQiDhW9kM2BLAb46F2THEgwY3n4SGUH50cK3X8o8BGoDl/iP/V2CLRr1zJhH6WtddXNaEUC0u7QwO3nx6tXCH5V6XiBEtgCVGdxzM/YxWuQuLeqK+ecEhhoFqXWHk0qmhpfqrjjsDhpVk74EvD9GtYOg3ObpkmJP2m3ltVgc4CeOhdWTcQbrB8EkIKMaA+zMZGjlGO1qvDW/X1WR10C11B5kwADjqmhqGJixEScD+dWmMUC7liQjE9cCbBs35FHKXJlViXXmkMnMtalfc3rhUw7nm3RgGrfBEMPZ/OuukxPCX0IoYWkI+LuiJTXgpJPAy5IzkrJHIGjvbjwCl7h/aIdXAPUNNBSqBiKqUHNmxE0YjlYTL/JXOi8/cNaaoNZAj9/uNHykix2t6ceeEuoTQ9QcwwtKAEOM3trQUyXVbPpFhyAy7DEQ0mGQ5FPUzZSUqtk031ETwM2qOudtNvljnptaxuYTnUFKDjpi7VBW4K0pZL/EYHWuPlnkKOFym2eqApDJG+JRZs9WNZRH0zhflApPg5Xh0J1MX9L7jbjsicjCyxBWMPbqqw9wF8Rp79U+eZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(33656002)(316002)(54906003)(186003)(52116002)(6916009)(8676002)(38350700002)(6506007)(38100700002)(26005)(8936002)(6486002)(4326008)(5660300002)(2616005)(956004)(86362001)(66556008)(66476007)(6666004)(44832011)(83380400001)(66946007)(2906002)(6512007)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6927
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75a3333b-bd63-4ee2-24f9-08d983306766
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nw/yT0XrvTv/q/TVt3S01mf5ZxG3yTtgSCA4vSB/yZyeK+YOrJG+TFquONxGvLdj2+3fKyBlE4vR/ARxoNnrOlfKqfE6lYFnkJ/o8p4Vf+Znwv9VwDEPY+jz1mAXQ2S8A9TJ5GdLbbr8p5QMuqVgq1ZUnZNMmOlp9HNyGsNAy7y68DwF8b4k4TS1PnZ3mo2zoK2m6UsHQpp+Q3mdkDpENmOOVMNw5GoOe0W1aX0el9+zzXQOidz+V58np+I5XLIvX8vcAYGvHYK5hFrmpUiVGvrU/VI+7jGNWy5TK7dZuEgvja7il8B3bhGYeJu2ADgH4so6EXhemaRZWCmz2doy27Ebfiap8/AiYQ45yWJJYxa6ZD6jY7g42Oiab8pdVd9cTdQK9uuBMN3Z6jvmwYtfp67WhYiT5yoDxONKZNzvMTG0+5SRzDqpZ7O1zQE0dyA8HA2/euKaSpnIhAVV5O2wzMjnMWQ099xQy7UUMZQCxHA81c/5aoP1VkXaVLqYZb5FHF5e1rOt3l0AEN9eSBkkI+52e6o1YyY4IMQaNu9qULI4kh/LAMV+Fni6W451RzJ8CDJyhHgCzg8muPtK57ktf6L0cTQtEcI8MESegzLK7G4rdMIDL9NUUmafUVHxh7GUMJ3HIi/lzmm4naiULuQxbPK3TDMGI2R7427TxfjwaHY4v4Fz/sNt/mvCbR8dlJZ5+IMGhA9dEKIvX/6zBFOHww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(83380400001)(336012)(2616005)(6512007)(81166007)(5660300002)(54906003)(8676002)(6666004)(47076005)(6506007)(956004)(8936002)(44832011)(70586007)(186003)(33656002)(26005)(82310400003)(316002)(86362001)(36860700001)(4326008)(2906002)(6862004)(36756003)(70206006)(508600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 10:03:56.8852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7427ae72-bddb-4824-beb7-08d983307392
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2515

> On Tue, 28 Sep 2021, Luca Fancellu wrote:
>> Add support to load Dom0 boot modules from
>> the device tree using the uefi,binary property.
>>=20
>> Update documentation about that.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> It is great how simple this patch is!
>=20
> The patch looks all correct. Only one question: do we need a check to
> make sure the dom0 ramdisk is not loaded twice? Once via uefi,binary and
> another time via the config file? In other words...

Yes I will add a check for it

>=20
>> ---
>> Changes in v3:
>> - new patch
>> ---
>> docs/misc/arm/device-tree/booting.txt |  8 ++++
>> docs/misc/efi.pandoc                  | 64 +++++++++++++++++++++++++--
>> xen/arch/arm/efi/efi-boot.h           | 36 +++++++++++++--
>> xen/common/efi/boot.c                 | 12 ++---
>> 4 files changed, 108 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 354bb43fe1..e73f6476d4 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -70,6 +70,14 @@ Each node contains the following properties:
>> priority of this field vs. other mechanisms of specifying the
>> bootargs for the kernel.
>>=20
>> +- uefi,binary (UEFI boot only)
>> +
>> + String property that specifies the file name to be loaded by the UEFI
>> + boot for this module. If this is specified, there is no need to specif=
y
>> + the reg property because it will be created by the UEFI stub on boot.
>> + This option is needed only when UEFI boot is used, the node needs to b=
e
>> + compatible with multiboot,kernel or multiboot,ramdisk.
>> +
>> Examples
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index 800e67a233..4cebc47a18 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -167,6 +167,28 @@ sbsign \
>> --output xen.signed.efi \
>> xen.unified.efi
>> ```
>> +## UEFI boot and Dom0 modules on ARM
>> +
>> +When booting using UEFI on ARM, it is possible to specify the Dom0 modu=
les
>> +directly from the device tree without using the Xen configuration file,=
 here an
>> +example:
>> +
>> +chosen {
>> + #size-cells =3D <0x1>;
>> + #address-cells =3D <0x1>;
>> + xen,xen-bootargs =3D "[Xen boot arguments]"
>> +
>> + module@1 {
>> + compatible =3D "multiboot,kernel", "multiboot,module";
>> + uefi,binary =3D "vmlinuz-3.0.31-0.4-xen";
>> + bootargs =3D "[domain 0 command line options]";
>> + };
>> +
>> + module@2 {
>> + compatible =3D "multiboot,ramdisk", "multiboot,module";
>> + uefi,binary =3D "initrd-3.0.31-0.4-xen";
>> + };
>> +}
>>=20
>> ## UEFI boot and dom0less on ARM
>>=20
>> @@ -326,10 +348,10 @@ chosen {
>> ### Boot Xen, Dom0 and DomU(s)
>>=20
>> This configuration is a mix of the two configuration above, to boot this=
 one
>> -the configuration file must be processed so the /chosen node must have =
the
>> -"uefi,cfg-load" property.
>> +the configuration file can be processed or the Dom0 modules can be read=
 from
>> +the device tree.
>>=20
>> -Here an example:
>> +Here the first example:
>>=20
>> Xen configuration file:
>>=20
>> @@ -369,4 +391,40 @@ chosen {
>> };
>> ```
>>=20
>> +Here the second example:
>> +
>> +Device tree:
>> +
>> +```
>> +chosen {
>> + #size-cells =3D <0x1>;
>> + #address-cells =3D <0x1>;
>> + xen,xen-bootargs =3D "[Xen boot arguments]"
>> +
>> + module@1 {
>> + compatible =3D "multiboot,kernel", "multiboot,module";
>> + uefi,binary =3D "vmlinuz-3.0.31-0.4-xen";
>> + bootargs =3D "[domain 0 command line options]";
>> + };
>> +
>> + module@2 {
>> + compatible =3D "multiboot,ramdisk", "multiboot,module";
>> + uefi,binary =3D "initrd-3.0.31-0.4-xen";
>> + };
>> +
>> + domU1 {
>> + #size-cells =3D <0x1>;
>> + #address-cells =3D <0x1>;
>> + compatible =3D "xen,domain";
>> + cpus =3D <0x1>;
>> + memory =3D <0x0 0xc0000>;
>> + vpl011;
>>=20
>> + module@1 {
>> + compatible =3D "multiboot,kernel", "multiboot,module";
>> + uefi,binary =3D "Image-domu1.bin";
>> + bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
>> + };
>> + };
>> +};
>> +```
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index 4f7c913f86..df63387136 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -31,8 +31,10 @@ static unsigned int __initdata modules_idx;
>> #define ERROR_MISSING_DT_PROPERTY   (-3)
>> #define ERROR_RENAME_MODULE_NAME    (-4)
>> #define ERROR_SET_REG_PROPERTY      (-5)
>> +#define ERROR_DOM0_ALREADY_FOUND    (-6)
>> #define ERROR_DT_MODULE_DOMU        (-1)
>> #define ERROR_DT_CHOSEN_NODE        (-2)
>> +#define ERROR_DT_MODULE_DOM0        (-3)
>>=20
>> void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>> void __flush_dcache_area(const void *vaddr, unsigned long size);
>> @@ -45,7 +47,8 @@ static int allocate_module_file(EFI_FILE_HANDLE dir_ha=
ndle,
>> static int handle_module_node(EFI_FILE_HANDLE dir_handle,
>>                               int module_node_offset,
>>                               int reg_addr_cells,
>> -                              int reg_size_cells);
>> +                              int reg_size_cells,
>> +                              bool is_domu_module);
>> static bool is_boot_module(int dt_module_offset);
>> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>>                                        int domain_node);
>> @@ -701,7 +704,8 @@ static int __init allocate_module_file(EFI_FILE_HAND=
LE dir_handle,
>> static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
>>                                      int module_node_offset,
>>                                      int reg_addr_cells,
>> -                                     int reg_size_cells)
>> +                                     int reg_size_cells,
>> +                                     bool is_domu_module)
>> {
>>     const void *uefi_name_prop;
>>     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + =
\0 */
>> @@ -743,6 +747,24 @@ static int __init handle_module_node(EFI_FILE_HANDL=
E dir_handle,
>>         return ERROR_SET_REG_PROPERTY;
>>     }
>>=20
>> +    if ( !is_domu_module &&
>> +         (fdt_node_check_compatible(fdt, module_node_offset,
>> +                                    "multiboot,kernel") =3D=3D 0) )
>> +    {
>> +        /*
>> +         * This is the Dom0 kernel, wire it to the kernel variable beca=
use it
>> +         * will be verified by the shim lock protocol later in the comm=
on code.
>> +         */
>> +        if ( kernel.addr )
>> +        {
>> +            PrintMessage(L"Dom0 kernel already found in cfg file.");
>> +            return ERROR_DOM0_ALREADY_FOUND;
>> +        }
>> +        kernel.need_to_free =3D false; /* Freed using the module array =
*/
>> +        kernel.addr =3D file->addr;
>> +        kernel.size =3D file->size;
>> +    }
>=20
> ... is it necessary to update ramdisk as well or check if it is already
> set? As far as I can tell it is the only other potential conflict that
> we could have.

ramdisk variable can be left unset, we are setting the kernel variable only=
 to
reuse the code that verifies the kernel image, however if the user specify =
the
ramdisk in both cfg and device tree we will end up in two multiboot,ramdisk
modules being added to the device tree.
I will add a check to return an error if ramdisk was declared previously.

>=20
>=20
>>     return 0;
>> }
>>=20
>> @@ -799,7 +821,7 @@ static int __init handle_dom0less_domain_node(EFI_FI=
LE_HANDLE dir_handle,
>>         if ( is_boot_module(module_node) )
>>         {
>>             int ret =3D handle_module_node(dir_handle, module_node, addr=
_cells,
>> -                                         size_cells);
>> +                                         size_cells, true);
>>             if ( ret < 0 )
>>                 return ret;
>>         }
>> @@ -809,7 +831,7 @@ static int __init handle_dom0less_domain_node(EFI_FI=
LE_HANDLE dir_handle,
>>=20
>> /*
>>  * This function checks for xen domain nodes under the /chosen node for =
possible
>> - * domU guests to be loaded.
>> + * dom0 and domU guests to be loaded.
>>  * Returns the number of modules loaded or a negative number for error.
>>  */
>> static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>> @@ -836,6 +858,12 @@ static int __init efi_arch_check_dt_boot(EFI_FILE_H=
ANDLE dir_handle)
>>             if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
>>                 return ERROR_DT_MODULE_DOMU;
>>         }
>> +        else if ( is_boot_module(node) )
>> +        {
>> +            if ( handle_module_node(dir_handle, node, addr_len, size_le=
n,
>> +                                    false) < 0 )
>> +                return ERROR_DT_MODULE_DOM0;
>> +        }
>>     }
>>=20
>>     /* Free dom0less file names if any */
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index c8c57fbb54..b221494a06 100644
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1296,11 +1296,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>         {
>>             read_file(dir_handle, s2w(&name), &kernel, option_str);
>>             efi_bs->FreePool(name.w);
>> -
>> -            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NUL=
L,
>> -                            (void **)&shim_lock)) &&
>> -                 (status =3D shim_lock->Verify(kernel.ptr, kernel.size)=
) !=3D EFI_SUCCESS )
>> -                PrintErrMesg(L"Dom0 kernel image could not be verified"=
, status);
>>         }
>>=20
>>         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
>> @@ -1372,6 +1367,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>     if (dt_module_found < 0)
>>         /* efi_arch_check_dt_boot throws some error */
>>         blexit(L"Error processing boot modules on DT.");
>> +
>> +    /* If Dom0 is specified, verify it */
>> +    if ( kernel.ptr &&
>> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
>> +                                           (void **)&shim_lock)) &&
>> +        (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EF=
I_SUCCESS )
>> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status=
);
>>     /*
>>      * Check if a proper configuration is provided to start Xen:
>>      *  - Dom0 specified (minimum required)
>> --=20
>> 2.17.1



