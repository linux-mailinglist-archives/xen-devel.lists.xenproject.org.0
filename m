Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00840D972
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 14:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188422.337574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQq7l-00059S-EV; Thu, 16 Sep 2021 12:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188422.337574; Thu, 16 Sep 2021 12:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQq7l-000562-Am; Thu, 16 Sep 2021 12:04:17 +0000
Received: by outflank-mailman (input) for mailman id 188422;
 Thu, 16 Sep 2021 12:04:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6Su=OG=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mQq7j-00055w-Gp
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 12:04:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::618])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae710410-0234-4481-8798-071c1c2d2332;
 Thu, 16 Sep 2021 12:04:12 +0000 (UTC)
Received: from AM6P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::19)
 by AM0PR08MB5138.eurprd08.prod.outlook.com (2603:10a6:208:15a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 12:04:10 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::2a) by AM6P191CA0042.outlook.office365.com
 (2603:10a6:209:7f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 12:04:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 12:04:10 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Thu, 16 Sep 2021 12:04:10 +0000
Received: from 1cbd12f9a1ba.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B65E5BB-3C85-4397-B9CD-47A2958626D4.1; 
 Thu, 16 Sep 2021 12:04:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1cbd12f9a1ba.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 12:04:03 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 12:04:00 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 12:04:00 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 12:03:59 +0000
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
X-Inumbo-ID: ae710410-0234-4481-8798-071c1c2d2332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDoawRWnyDQaw9PR09u3yHVtj17NII4KBcSYmjun2sA=;
 b=Ucqhr9frztnK6yJnY1h82XikomkLeVnRfe1UtawUAUxXiYrPth1pyTpF/B5hNBJUfYh8bPD4VQUwwrpCWi4IVRGCEg7D+R1Dzwnganb/vZyiozvk3nEg1mLE6xqyblG/xuH8q1+igbPZGrK9Hcim+TfDd/G0LRFsJ/VZY8giRmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e240d2895d0d87ee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRobXTIn7yD6XEHX2b7O2zqfQeGOgsDGNEdL+TqBACALwQ6GEJpP4ptzenDoWETPGD+V/rdN6zgVN8rzMYz5TQ96lZrmMoCYTZM/u+UiUV9dsKe5LjeQJdvOvEQKRXt6aGvahUnvbZRrz+Cwu9I5HquX2wSoalvwWGD/rDW6UdJ1slN7aXt7TvgrSqkokCTvDeal2DTAyC+DroJdxSl+sL05obhwk3INdmHsCB8v8lY3vSSwfynpsQW9XkwZLcjs2jwLuBJ0B/Nm8HOTF2Ed+cKLRrDVGUoF3GBWNKyxKjrboT3fVDr7LmzNbckbsYZu5h1r88akEnnY8N8BL43CyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SDoawRWnyDQaw9PR09u3yHVtj17NII4KBcSYmjun2sA=;
 b=d6shWSm9PFoDg1bZIrLLdFj1TnClaPGWsZG5GO0VnTzpLCvQyfdbtxAKRZnhF8Szw5XQnP65Fm4C47qHjVlI19J13rNb7t+YGWJw5G2iLZQMeDVOiixaM6gKvLe6wUR3ZGPMlzNPUGnpli7UL1OO7atSNvsmxEj09kj1m9QCj0kgcQO74po+1vFgO/1BfM83QTo8pb6am6bM10MLpCx+mKtQkvOPBuswrGFDZwloYH4ewB+Abx8BsTWSlN8/vEmF2ycK/TxxEQZ7R0npghad++DK/bEwx/ojNF3X9t0+/OnfQWLWpwE4ehQ/++tg0yhe6hmGomCx3wBngt7KH1VW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDoawRWnyDQaw9PR09u3yHVtj17NII4KBcSYmjun2sA=;
 b=Ucqhr9frztnK6yJnY1h82XikomkLeVnRfe1UtawUAUxXiYrPth1pyTpF/B5hNBJUfYh8bPD4VQUwwrpCWi4IVRGCEg7D+R1Dzwnganb/vZyiozvk3nEg1mLE6xqyblG/xuH8q1+igbPZGrK9Hcim+TfDd/G0LRFsJ/VZY8giRmY=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109151721210.21985@sstabellini-ThinkPad-T480s>
Date: Thu, 16 Sep 2021 13:03:53 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDC5AD61-D71B-46BC-952B-DE592879F9F3@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109151721210.21985@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5ab037-2cf0-4103-5cd9-08d9790a17d5
X-MS-TrafficTypeDiagnostic: PR3PR08MB5836:|AM0PR08MB5138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5138A9FAF311DC8F5AE76D42E4DC9@AM0PR08MB5138.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 b5w8VrAkzwkOUa0B5Mx9FF9qVsQxPxhqZZgO+E2Jyc7K/vn7FojpcwCcVNR9z8NvH1RjF2o/7T0rm4I7OLq9PDC8UY7FN57zFNGGqXSmdZMWLiFB6OBKiWRY9BdSxz1TGVbXa6kIfCiThGGngIUEYPAG8AulWIiUPS/MQ9iKmTmIJf7k0wKwEUNxRkXDvJNqefAcggsTTh8eTfoLD9VPt56CyP4wfcpcGmP95BmYoYmgPYNE6eH+AEewkGjZxqJkK+E20/Ah1SGtpzuT56CfoQEUP1TGFDyhpfnPj1GhN1uqAj2EuTEq+haErJ5/bqv1D+ttfWm4voNwdkiUq/gGEWZ164s3ycFUssOTwchLeNg6pAiFk7n6sPRcHhjp4Sva5RfiZl2L0gtbPO7gZTpRT1nI2ikT8RY71wLWBVJjKNZMvjPYbyb3ZLmAaUjVq1lSxSj9iT6lWBaH9IO2zjv/pjpqrOWhsnlJpehTwigTzjpnupTvwhVBtbG7uzK5qrvvdZnApHQHnl9s7dxq9vNWwVUhVe/iPQ3PXL0SbNPdsQ+rS5xX9goMMXUH9LoVcAJ4dn5OZBrTe5gCj+zhrBKdFgLQDMt36tMKp8APjbRcQpi9I8LT5oHhwcYeF+Gj5eJpYSFxkjnPUlwcufq6nJt0HPaJZ4uilBgS0Vgs+0nXAPY8S1mEPvvyXJbIVF23iy7NraVdYBNf+qY9mMHhWzpSrO3V4KZI3N0+0qiYu4bEBiq+scxtVJ1Apg8PygfQz6bMr06h6aWpLdJlAU406mAnEw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(66556008)(66946007)(66476007)(53546011)(6506007)(86362001)(508600001)(44832011)(316002)(54906003)(52116002)(5660300002)(26005)(30864003)(2616005)(83380400001)(956004)(186003)(2906002)(36756003)(6486002)(8676002)(8936002)(33656002)(4326008)(6512007)(38350700002)(38100700002)(6666004)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b062559-fb6f-46c6-4375-08d9790a1156
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B2HMWyi1B9pyqP8Adp5IDho4WKG4e5LenDkmccerFG57oJ+akWKotLy8OVzU3u7DI7ZtJ8j7V3a88XCwTkoA1Ioh147nWmZD8F0kLKXUH8mT/SfUbqK8Hfn1lJubvH1zUrwR4ckPEVUibE8Y887lrtXw9J7BZht8GhAoanD+ij3l6mj2uw80NNQmDZI2KJDf0RFJ68l83CFtNBQH6W9Cz9lNtgLWaABQxv4SR2TTRTDMctvfA6tDCbNrRc4R8UifOKEmo25CtrROawYUb92vSKzup3KAFex6vw+xkCQkXe3QK0FMfZX90POnVycaxnPy1d+Yn06/VDopB1y9kjTWj3heJ1LlbXJ1eyGZ579flynBsZMhl+Xq5Tc/x5GGKenDZoE04alTT6Zk0WjSRkNQhKlyTRta+FSdv+e7/v4zmuQsCo6B8QWEUoaUhAelFC7cLnvW8YrDD2RUL0Z9miLgMs0sGlmAC2xOw8wVs9yCLp8slF3u/Kl3GbDrsQcz2QadoRFDA4ReqIOaTA0WS6w7CeJcVM7SQrzrTejACh8j/ARMyRlfyzmb0/XGf948+9ahbNQ9EQVgjB2AsPXOOCDh93EHvJNAc/m9mAolo72LQGk43x1NHdone5T/rlOVk2XvMmVw3gGV9zWyPLnkbtzosG4/mqPZBo91tm6mueLKne6ko3H5Gw1UMastZO5KbkGnHFO3ykleBU9dDKtCKVvszCY7HNDoGfpISIFluLZ3+/o=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(4326008)(8936002)(82740400003)(26005)(6512007)(6666004)(70206006)(33656002)(70586007)(6862004)(36756003)(47076005)(30864003)(82310400003)(81166007)(356005)(5660300002)(316002)(44832011)(83380400001)(86362001)(6506007)(8676002)(478600001)(54906003)(2906002)(53546011)(6486002)(336012)(186003)(36860700001)(2616005)(107886003)(956004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 12:04:10.4639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5ab037-2cf0-4103-5cd9-08d9790a17d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5138



> On 16 Sep 2021, at 02:16, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 15 Sep 2021, Luca Fancellu wrote:
>> This patch introduces the support for dom0less configuration
>> when using UEFI boot on ARM, it permits the EFI boot to
>> continue if no dom0 kernel is specified but at least one domU
>> is found.
>>=20
>> Introduce the new property "uefi,binary" for device tree boot
>> module nodes that are subnode of "xen,domain" compatible nodes.
>> The property holds a string containing the file name of the
>> binary that shall be loaded by the uefi loader from the filesystem.
>>=20
>> Update efi documentation about how to start a dom0less
>> setup using UEFI
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> docs/misc/efi.pandoc        |  37 ++++++
>> xen/arch/arm/efi/efi-boot.h | 244 +++++++++++++++++++++++++++++++++++-
>> xen/common/efi/boot.c       |  20 ++-
>> 3 files changed, 294 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index ac3cd58cae..db9b3273f8 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -165,3 +165,40 @@ sbsign \
>> 	--output xen.signed.efi \
>> 	xen.unified.efi
>> ```
>> +
>> +## UEFI boot and dom0less on ARM
>> +
>> +Dom0less feature is supported by ARM and it is possible to use it when =
Xen is
>> +started as an EFI application.
>> +The way to specify the domU domains is by Device Tree as specified in t=
he
>> +[dom0less](dom0less.html) documentation page under the "Device Tree
>> +configuration" section, but instead of declaring the reg property in th=
e boot
>> +module, the user must specify the "uefi,binary" property containing the=
 name
>> +of the binary file that has to be loaded in memory.
>> +The UEFI stub will load the binary in memory and it will add the reg pr=
operty
>> +accordingly.
>> +
>> +An example here:
>> +
>> +    domU1 {
>> +        #address-cells =3D <1>;
>> +        #size-cells =3D <1>;
>> +        compatible =3D "xen,domain";
>> +        memory =3D <0 0x20000>;
>> +        cpus =3D <1>;
>> +        vpl011;
>> +
>> +        module@1 {
>> +            compatible =3D "multiboot,kernel", "multiboot,module";
>> +            uefi,binary =3D "vmlinuz-3.0.31-0.4-xen";
>> +            bootargs =3D "console=3DttyAMA0";
>> +        };
>> +        module@2 {
>> +            compatible =3D "multiboot,ramdisk", "multiboot,module";
>> +            uefi,binary =3D "initrd-3.0.31-0.4-xen";
>> +        };
>> +        module@3 {
>> +            compatible =3D "multiboot,ramdisk", "multiboot,module";
>> +            uefi,binary =3D "passthrough.dtb";
>> +        };
>> +    };
>=20
> Can you please also update docs/misc/arm/device-tree/booting.txt ?
> Either a link to docs/misc/efi.pandoc or a definition of the uefi,binary
> property (mentioning that it is EFI-only.)

Yes I will update it.

>=20
>=20
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index 5ff626c6a0..8d7ced70f2 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -8,9 +8,39 @@
>> #include <asm/setup.h>
>> #include <asm/smp.h>
>>=20
>> +typedef struct {
>> +    char* name;
>> +    int name_len;
>> +} dom0less_module_name;
>> +
>> +/*
>> + * Binaries will be translated into bootmodules, the maximum number for=
 them is
>> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DT=
B
>> + */
>> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
>> +static struct file __initdata dom0less_files[MAX_DOM0LESS_MODULES];
>> +static dom0less_module_name __initdata dom0less_bin_names[MAX_DOM0LESS_=
MODULES];
>=20
> I suggest a slightly different model where we don't call AllocatePool to
> allocate dom0less_module_name.name and instead we just set the pointer
> directly to the fdt string. There is no risk of the fdt going away at
> this point so it should be safe to use.

Yes I thought about this approach but since I was not sure how the DTB beha=
ves when we modify
It to add the reg property or to modify the module name, then I used this o=
ther approach.
Are you sure that the pointed memory will stay the same after we modify the=
 DTB? My main concern
was that the DTB structure was going to be modified and the string I was po=
inting in the DTB memory
can be relocated elsewhere.=20

>=20
> Also, I don't think we need a global array of struct file, we only
> really need 1 struct file which would be freed immediately after loading
> to memory. We do need to remember the address and size in memory though.
> So I would do something like:
>=20
> typedef struct {
>    const char* name;
>    int name_len;
>    EFI_PHYSICAL_ADDRESS addr;
>    UINTN size;
> } dom0less_module_name;
>=20
> /*
> * Binaries will be translated into bootmodules, the maximum number for th=
em is
> * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
> */
> #define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
> static dom0less_module_name __initdata dom0less_bin_names[MAX_DOM0LESS_MO=
DULES];
>=20
>=20
> The purpose is to reduce memory allocations and memory consumption.

Yes I can do that.

>=20
>=20
>> +static uint32_t __initdata dom0less_modules_available =3D MAX_DOM0LESS_=
MODULES;
>> +static uint32_t __initdata dom0less_modules_idx =3D 0;
>> +
>> +#define ERROR_DOM0LESS_FILE_NOT_FOUND -1
>> +
>> void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>> void __flush_dcache_area(const void *vaddr, unsigned long size);
>>=20
>> +static int __init get_dom0less_file_index(const char* name, int name_le=
n);
>> +static uint32_t __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handl=
e,
>> +                                              const char* name, int nam=
e_len);
>> +static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_hand=
le,
>> +                                               int module_node_offset,
>> +                                               int reg_addr_cells,
>> +                                               int reg_size_cells);
>> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_hand=
le,
>> +                                               int domain_node,
>> +                                               int addr_cells,
>> +                                               int size_cells);
>> +static bool __init check_dom0less_efi_boot(EFI_FILE_HANDLE dir_handle);
>> +
>> #define DEVICE_TREE_GUID \
>> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, =
0xe0}}
>>=20
>> @@ -552,8 +582,209 @@ static void __init efi_arch_handle_module(const st=
ruct file *file,
>>                          kernel.size) < 0 )
>>             blexit(L"Unable to set reg property.");
>>     }
>> -    else
>> +    else if ( !((file >=3D &dom0less_files[0]) &&
>> +               (file <=3D &dom0less_files[MAX_DOM0LESS_MODULES-1])) )
>> +        /*
>> +         * If file is not a dom0 module file and it's not any domU modu=
les,
>> +         * stop here.
>> +         */
>>         blexit(L"Unknown module type");
>=20
> Without &dom0less_files we would have to do without this sanity check.

Sure, it will simplify to=20
+ else if ( file !=3D &dom0less_file )        =20

>=20
>=20
>> +    /*
>> +     * dom0less_modules_available is decremented here because for each =
dom0
>> +     * file added, there will be an additional bootmodule, so the numbe=
r
>> +     * of dom0less module files will be decremented because there is
>> +     * a maximum amount of bootmodules that can be loaded.
>> +     */
>> +    dom0less_modules_available--;
>> +}
>> +
>> +/*
>> + * This function checks for a binary previously loaded with a give name=
, it
>> + * returns the index of the file in the dom0less_files array or a negat=
ive
>> + * number if no file with that name is found.
>> + */
>> +static int __init get_dom0less_file_index(const char* name, int name_le=
n)
>> +{
>> +    int ret =3D ERROR_DOM0LESS_FILE_NOT_FOUND;
>> +
>> +    for (uint32_t i =3D 0; i < dom0less_modules_idx; i++)
>=20
> uint32_t i;
>=20
> for ( i =3D 0; i < dom0less_modules_idx; i++ )

Will fix that.

>=20
>=20
>> +    {
>> +        dom0less_module_name* mod =3D &dom0less_bin_names[i];
>> +        if ( (mod->name_len =3D=3D name_len) &&
>> +             (strncmp(mod->name, name, name_len) =3D=3D 0) )
>> +        {
>> +            ret =3D i;
>> +            break;
>> +        }
>> +    }
>> +    return ret;
>> +}
>> +
>> +/*
>> + * This function allocates a binary and keeps track of its name, it
>> + * returns the index of the file in the dom0less_files array.
>> + */
>> +static uint32_t __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handl=
e,
>> +                                              const char* name, int nam=
e_len)
>> +{
>> +    dom0less_module_name* file_name;
>> +    union string module_name;
>> +    struct file* file;
>> +    uint32_t ret_idx;
>> +
>> +    /*
>> +     * Check if there is any space left for a domU module, the variable
>> +     * dom0less_modules_available is updated each time we use read_file=
(...)
>> +     * successfully.
>> +     */
>> +    if ( !dom0less_modules_available )
>> +        blexit(L"No space left for domU modules");
>> +    module_name.s =3D (char*) name;
>> +    ret_idx =3D dom0less_modules_idx;
>> +    file =3D &dom0less_files[ret_idx];
>> +
>> +    /* Save at this index the name of this binary */
>> +    file_name =3D &dom0less_bin_names[ret_idx];
>> +
>> +    if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(ch=
ar),
>> +                              (void**)&file_name->name) !=3D EFI_SUCCES=
S )
>> +        blexit(L"Error allocating memory for dom0less binary name");
>=20
> As far as I can tell we could just set file_name =3D name;

If you are sure I will modify that, I will wait your confirmation.

>=20
>=20
>> +    /* Save name and length of the binary in the data structure */
>> +    strlcpy(file_name->name, name, name_len);
>> +    file_name->name_len =3D name_len;
>> +
>> +    /* Load the binary in memory */
>> +    read_file(dir_handle, s2w(&module_name), file, NULL);
>> +
>> +    /* s2w(...) allocates some memory, free it */
>> +    efi_bs->FreePool(module_name.w);
>> +
>> +    dom0less_modules_idx++;
>> +
>> +    return ret_idx;
>> +}
>> +
>> +/*
>> + * This function checks for the presence of the uefi,binary property in=
 the
>> + * module, if found it loads the binary as dom0less module and sets the=
 right
>> + * address for the reg property into the module DT node.
>> + */
>> +static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_hand=
le,
>> +                                          int module_node_offset,
>> +                                          int reg_addr_cells,
>> +                                          int reg_size_cells)
>> +{
>> +    const void* uefi_name_prop;
>> +    char mod_string[24]; /* Placeholder for module@ + a 64-bit number +=
 \0 */
>> +    int uefi_name_len, file_idx;
>> +    struct file* file;
>> +
>> +    /* Read uefi,binary property to get the file name. */
>> +    uefi_name_prop =3D fdt_getprop(fdt, module_node_offset, "uefi,binar=
y",
>> +                                 &uefi_name_len);
>> +
>> +    if ( NULL =3D=3D uefi_name_prop )
>> +        /* Property not found */
>> +        return;
>> +
>> +    file_idx =3D get_dom0less_file_index(uefi_name_prop, uefi_name_len)=
;
>> +    if (file_idx < 0)
>> +        file_idx =3D allocate_dom0less_file(dir_handle, uefi_name_prop,
>> +                                          uefi_name_len);
>> +
>> +    file =3D &dom0less_files[file_idx];
>> +
>> +    snprintf(mod_string, sizeof(mod_string), "module@%"PRIx64, file->ad=
dr);
>> +
>> +    /* Rename the module to be module@{address} */
>> +    if ( fdt_set_name(fdt, module_node_offset, mod_string) < 0 )
>> +        blexit(L"Unable to add domU ramdisk FDT node.");
>> +
>> +    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_=
cells,
>> +                     file->addr, file->size) < 0 )
>> +        blexit(L"Unable to set reg property.");
>> +}
>> +
>> +/*
>> + * This function checks for boot modules under the domU guest domain no=
de
>> + * in the DT.
>> + */
>> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_hand=
le,
>> +                                               int domain_node,
>> +                                               int addr_cells,
>> +                                               int size_cells)
>> +{
>> +    /*
>> +     * Check for nodes compatible with multiboot,{kernel,ramdisk,device=
-tree}
>> +     * inside this node
>> +     */
>> +    for ( int module_node =3D fdt_first_subnode(fdt, domain_node);
>=20
> int module_node;
>=20
> for ( module_node =3D fdt_first_subnode(fdt, domain_node);
>=20

Will fix that.

>=20
>> +          module_node > 0;
>> +          module_node =3D fdt_next_subnode(fdt, module_node) )
>> +    {
>> +        if ( (fdt_node_check_compatible(fdt, module_node,
>> +                                        "multiboot,kernel") =3D=3D 0) |=
|
>> +             (fdt_node_check_compatible(fdt, module_node,
>> +                                        "multiboot,ramdisk") =3D=3D 0) =
||
>> +             (fdt_node_check_compatible(fdt, module_node,
>> +                                        "multiboot,device-tree") =3D=3D=
 0) )
>> +        {
>> +            /* The compatible is one of the strings above, check the mo=
dule */
>> +            handle_dom0less_module_node(dir_handle, module_node, addr_c=
ells,
>> +                                        size_cells);
>> +        }
>> +    }
>> +}
>> +
>> +/*
>> + * This function checks for xen domain nodes under the /chosen node for=
 possible
>> + * domU guests to be loaded.
>> + */
>> +static bool __init check_dom0less_efi_boot(EFI_FILE_HANDLE dir_handle)
>> +{
>> +    int chosen;
>> +    int addr_len, size_len;
>> +
>> +    /* Check for the chosen node in the current DTB */
>> +    chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
>> +    if ( chosen < 0 )
>> +        blexit(L"Unable to setup chosen node");
>> +
>> +    /* Check for nodes compatible with xen,domain under the chosen node=
 */
>> +    for ( int node =3D fdt_first_subnode(fdt, chosen);
>> +          node > 0;
>> +          node =3D fdt_next_subnode(fdt, node) )
>> +    {
>> +        int addr_cells, size_cells, len;
>> +        const struct fdt_property *prop;
>> +
>> +        if ( fdt_node_check_compatible(fdt, node, "xen,domain") !=3D 0 =
)
>> +            continue;
>> +
>> +        /* Get or set #address-cells and #size-cells */
>> +        prop =3D fdt_get_property(fdt, node, "#address-cells", &len);
>> +        if ( !prop )
>> +            blexit(L"#address-cells not found in domain node.");
>> +
>> +        addr_cells =3D fdt32_to_cpu(*((uint32_t *)prop->data));
>> +
>> +        prop =3D fdt_get_property(fdt, node, "#size-cells", &len);
>> +        if ( !prop )
>> +            blexit(L"#size-cells not found in domain node.");
>> +
>> +        size_cells =3D fdt32_to_cpu(*((uint32_t *)prop->data));
>> +
>> +        /* Found a node with compatible xen,domain; handle this node. *=
/
>> +        handle_dom0less_domain_node(dir_handle, node, addr_cells, size_=
cells);
>> +    }
>> +
>> +    if ( dom0less_modules_idx > 0 )
>> +        return true;
>> +
>> +    return false;
>> }
>>=20
>> static void __init efi_arch_cpu(void)
>> @@ -562,8 +793,19 @@ static void __init efi_arch_cpu(void)
>>=20
>> static void __init efi_arch_blexit(void)
>> {
>> +    uint32_t i =3D 0;
>>     if ( dtbfile.need_to_free )
>>         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
>> +    /* Free dom0less files if any */
>> +    for ( ; i < dom0less_modules_idx; i++ )
>> +    {
>> +        /* Free dom0less binary names */
>> +        efi_bs->FreePool(dom0less_bin_names[i].name);
>> +        /* Free dom0less binaries */
>> +        if ( dom0less_files[i].need_to_free )
>> +            efi_bs->FreePages(dom0less_files[i].addr,
>> +                              PFN_UP(dom0less_files[i].size));
>> +    }
>>     if ( memmap )
>>         efi_bs->FreePool(memmap);
>> }
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index 758f9d74d2..65493c4b46 100644
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1134,8 +1134,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
>>     union string section =3D { NULL }, name;
>>     bool base_video =3D false;
>> -    const char *option_str;
>> +    const char *option_str =3D NULL;
>>     bool use_cfg_file;
>> +    bool dom0less_found =3D false;
>>=20
>>     __set_bit(EFI_BOOT, &efi_flags);
>>     __set_bit(EFI_LOADER, &efi_flags);
>> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>             efi_bs->FreePool(name.w);
>>         }
>>=20
>> -        if ( !name.s )
>> -            blexit(L"No Dom0 kernel image specified.");
>> -
>>         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>>=20
>> -        option_str =3D split_string(name.s);
>> +#ifdef CONFIG_ARM
>> +        /* dom0less feature is supported only on ARM */
>> +        dom0less_found =3D check_dom0less_efi_boot(dir_handle);
>> +#endif
>=20
> Rather than an #ifdef here you can simply implement
> check_dom0less_efi_boot on x86 as a static inline returning always
> false.

Sure I will create that on x86 code and I will update the code here.

>=20
> Also, we are under the if ( use_cfg_file ) code path. So maybe it is
> reasonable that dom0 is required if we are booting with use_cfg_file
> =3D true. After all, it is specified as a required property today of
> xen.cfg.
>=20
> If you follow my suggestion with an explicit enabled/disabled of xen.cfg
> from device tree, a true dom0less configuration could be fully specified
> without xen.cfg.
>=20
> If we do that, then here probable we don't need to change this code path.
>=20

Please check my reply on the previous patch.

Cheers,

Luca

>=20
>=20
>> +        if ( !name.s && !dom0less_found )
>> +            blexit(L"No Dom0 kernel image specified.");
>> +
>> +        if ( name.s !=3D NULL )
>> +            option_str =3D split_string(name.s);
>>=20
>> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_str=
) )
>> +        if ( (!read_section(loaded_image, L"kernel", &kernel, option_st=
r)) &&
>> +             (name.s !=3D NULL) )
>>         {
>>             read_file(dir_handle, s2w(&name), &kernel, option_str);
>>             efi_bs->FreePool(name.w);


