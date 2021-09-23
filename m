Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B44160A8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:08:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194297.346120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPOz-0000Nw-CT; Thu, 23 Sep 2021 14:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194297.346120; Thu, 23 Sep 2021 14:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPOz-0000LH-8f; Thu, 23 Sep 2021 14:08:41 +0000
Received: by outflank-mailman (input) for mailman id 194297;
 Thu, 23 Sep 2021 14:08:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBZb=ON=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mTPOx-0000L9-KI
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:08:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.57]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be6794b4-1c77-11ec-ba46-12813bfff9fa;
 Thu, 23 Sep 2021 14:08:36 +0000 (UTC)
Received: from AS9PR06CA0156.eurprd06.prod.outlook.com (2603:10a6:20b:45c::13)
 by AS8PR08MB6710.eurprd08.prod.outlook.com (2603:10a6:20b:397::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 14:08:35 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::d5) by AS9PR06CA0156.outlook.office365.com
 (2603:10a6:20b:45c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 14:08:35 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:08:34 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 14:08:31 +0000
Received: from 60fb0bf4bc0b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D7A6BD6-6ABE-4E3D-9CDD-0ADA6DF368DF.1; 
 Thu, 23 Sep 2021 14:08:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60fb0bf4bc0b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 14:08:19 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6192.eurprd08.prod.outlook.com (2603:10a6:102:ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 14:08:15 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 14:08:15 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:08:14 +0000
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
X-Inumbo-ID: be6794b4-1c77-11ec-ba46-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jPowXSl5B39OM7PYXe287zKbMR+e5YkjxwJkceWc+Y=;
 b=SXDJFQlmvFNfHG2tiq2C1xb/OmR9JVSBkyBkv0Hh2l+o0k2a+BAjOWJ0v9xyu6auSKmdSREC0+FiRFmfOhC0czCwc02sa+gx6mQ60bWLfI+l8dUQDRMTtRdv7V9a9tTI04uXz8gd1HZun8oRe7cPOlW05fXR1eyQkuibzHNjJLw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7beca78cade72a9e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jogt1WvOs3vaYrTYeGNAmPpUP1Jnb4hNMkcjyghSay6RHB6oXD/DqBARngYND8YHsVTDtpYc8ExtQLzY2sEvov026fDYtHNo8aBUPRIBuQRNrWLwMVTrsrC0YAdBlwznLbOM8cXZZNN1hKZdf+souF5baGzlQiguHy4ppfd2SUNEq/Mb7Gv9L9Ga3dAQU4wpaS/oCFSTEPToE/KfAl5+Sae/U+Cvp/YsocXDbSkxDepb/ajJzz7vRTicL9js5yhgJ5dDzWrtyxOJS24V4+xgMPQpSG7yH4UnZiB+UVngGKszmPylpfHvOfJKs3k3mmD4u9xidq4Hp2hdr+m1gGe3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/jPowXSl5B39OM7PYXe287zKbMR+e5YkjxwJkceWc+Y=;
 b=PTUkOYRldiGqvBqKQ5qUv/J6dI4BX0U9VgaPNxawTqyHrqQs1O5txXLQfx6xyrUqKwbavrykZahtXszv/6P+0HGqA9NNBGEzp89gy9LOEUpSyacYsQjnpqBHtd7C2ktjRDv+5+p7C6ziId89qt93a3lyxpuqgkRW9/UC6vS2dOpUUSEpnzv2KtkONm51qDUIpgRX0Vs31BV2YHiH8gijb9UXX3qFt4D2BX1TF6VjtGR209AQGF6x0lSeH6p29S0/DLbdR2vNNFs6xjh3t0NCNHqkw5W9sX91w8xLJPD5xQ3ZW+c/FSn18rezPJ/Vlg562KyxHEQtXo1DNcCZBhZQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jPowXSl5B39OM7PYXe287zKbMR+e5YkjxwJkceWc+Y=;
 b=SXDJFQlmvFNfHG2tiq2C1xb/OmR9JVSBkyBkv0Hh2l+o0k2a+BAjOWJ0v9xyu6auSKmdSREC0+FiRFmfOhC0czCwc02sa+gx6mQ60bWLfI+l8dUQDRMTtRdv7V9a9tTI04uXz8gd1HZun8oRe7cPOlW05fXR1eyQkuibzHNjJLw=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109221430210.17979@sstabellini-ThinkPad-T480s>
Date: Thu, 23 Sep 2021 15:08:07 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C0E480C-DF1C-4AAD-89F5-99D52B016970@arm.com>
References: <20210922141341.42288-1-luca.fancellu@arm.com>
 <20210922141341.42288-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109221430210.17979@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::17) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 040c4946-d3d2-4c4b-5f85-08d97e9ba185
X-MS-TrafficTypeDiagnostic: PA4PR08MB6192:|AS8PR08MB6710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB671025A943F36BF7DE3A7CEBE4A39@AS8PR08MB6710.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dY8mXK09zyKIJD4Gvf/aXj0g7cP+ct9w7HXFs5xfTkO78gDgVPkAdsn53d253kjClmpYVJzovgev/VhqkInQqzFM6H8UEAPFIT/6ocaN5ejEpMFRjCl55mCC62adaO1UeznmXFKKozaNp7zfRzrYH+7WYUHGjZendrQxrJzELQ5op5ZZj0KUG1F8UpY7UFgdXF0aaQR+62bkk8/aDlgiVDfJ7z5qB3sAXGqs9CCfla3DQPD7Xkb+BKiak0TJGUA2RwCiLn+lbx1GQZys2muLHONsDyKBD18uUz3N6jGFLhHZR+fD53EYG/JOT1vJFDzYBI95jBvK+C6SJP68uU9J1HcRLZ7dT4TXAPA8T6gIOwEQwNAzLlm0Q2nbmphGy5mYMYhWLUXUmCpKZNQVLnrLbGqbV3LmVMvTJigAdNgI2VURWlz0HQ+6kgCHuzipS6HifQpK+0rfkm+6t9XrT9A9AdQXwOId6mNJ410UdYLD1IFuVpdaGQG9Q0Fb3W1Sxoz1FYsd6G/8DQBztpPPNr0kuIQDRseusaISmSgRcSxNloC1Wy/Bw9yfAT+XMfv4qkGVyCzF12wWNaQTox1IjDnTjS3EtS4C/t1Cig5HJrU9vFiXANEsBnJX+FFtUSV9BkR+Dv0G1tXbk1RFCrfr0FyNE+kfOwecf1DM4emHDh3oNC3blAhwbIVPAJ+6u5CW3k5t3Aof3horJxbqtxjiwu4nHqOmKDVqd3ekVQDKPZMS2C0nZGu0hwGplFQgpB9yDDiYeCd7vjDmHNlzu3hlrCm78ArClTyQVKgWMjnI53Uy23A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(38100700002)(38350700002)(6486002)(30864003)(6512007)(33656002)(508600001)(66556008)(66476007)(66946007)(956004)(54906003)(316002)(5660300002)(86362001)(6506007)(53546011)(4326008)(8936002)(6666004)(2616005)(2906002)(44832011)(26005)(186003)(8676002)(83380400001)(36756003)(6916009)(7416002)(32563001)(21314003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6192
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ee6e49e-944a-4a3f-d606-08d97e9b95af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0CCArW9ftsiz6mwKr8LjjD/v+R70PJrvL40KZogo56PQgVGv1Z6DxFMbKM49mURIVCSP46Ffw/45jgvDonjUY7/ZxnINVDeykp4D4z0qzCFk/4dGJbd+SFguBM1gTGxmUbPR9Ts/6YNq9kheVFQBYqGNDJHG5UPeovn3c6Fx1JCb5cyiTKlsFNC1jUuSOwzmgBzqfklXD3xHG8d9rSaIUZUBIC0xFZ9Na3sgwntCF7NgMBhLslHMX87HWUy9PGn4cYm/xvY4mnriAl3p/xO+3dSDL1D3nJOVWJyF9tpcJqS4e7bcMuCyizuIxP7XYC9ltM0IrhZTpgFDfuBwBkw9yhVDaE0i/6ol9ywdvIJq5DCj7qV8dpZrdj+GVPi6vWZeEz52doVpOyU+flJcwv7NHdVDQr3/dq1K+j89y4JWQgjYxMiN3/YLsaChuZHREXwwHqXlk/gmAeuYi2oYYWPRd2t2xqcDyqblJ/ot9tndyHaFytRRFqn1lxb7wFUZmDLq1hCFeM1r8avOcaC/AyGqeqqc3lDsBdLPN0tVWB9/Ds1xHX5yKEGRPC1qogoyGAUE+qTPSUk7LXzUPLG1bPXTitlrTsLM4I6v1HR7XA6F7tsmLJn233XO0eYzzctv48tf9XK/UPXQtsWPm/itBQl6lBuO7Ye0Okokyqkz9psfHKoJAQ3rTLZwJKhqreRtu3txV/q19Kb2RXMj0QjSgcdDMNAy24FjTm0BFmKqiCqtjfA0NfmOmOso+1gyLA6p5HoF
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(6506007)(316002)(6486002)(356005)(186003)(2616005)(33656002)(956004)(86362001)(6862004)(508600001)(81166007)(44832011)(6512007)(2906002)(26005)(53546011)(4326008)(70586007)(107886003)(8676002)(36756003)(36860700001)(336012)(30864003)(8936002)(82310400003)(6666004)(47076005)(5660300002)(70206006)(83380400001)(32563001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:08:34.3749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040c4946-d3d2-4c4b-5f85-08d97e9ba185
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6710



> On 22 Sep 2021, at 22:51, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 22 Sep 2021, Luca Fancellu wrote:
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
>=20
> Overall the patch is pretty good. I don't have any major concerns (only
> one about the documentation). Some minor comments below.
>=20
>=20
>> ---
>> Changes in v2:
>> - remove array of struct file
>> - fixed some int types
>> - Made the code use filesystem even when configuration
>> file is skipped.
>> - add documentation of uefi,binary in booting.txt
>> - add documentation on how to boot all configuration
>> for Xen using UEFI in efi.pandoc
>> ---
>> docs/misc/arm/device-tree/booting.txt |  21 +++
>> docs/misc/efi.pandoc                  | 203 ++++++++++++++++++++
>> xen/arch/arm/efi/efi-boot.h           | 257 +++++++++++++++++++++++++-
>> xen/arch/x86/efi/efi-boot.h           |   6 +
>> xen/common/efi/boot.c                 |  36 ++--
>> 5 files changed, 508 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 44cd9e1a9a..bc0f8913db 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -182,6 +182,13 @@ The kernel sub-node has the following properties:
>>=20
>>     Command line parameters for the guest kernel.
>>=20
>> +- efi,binary (UEFI boot only)
>=20
> Below it is actually uefi,binary, not efi,binary. I would use
> uefi,binary consistently.

Yes that was a mistake, thanks for catching it

>=20
>=20
>> +    Specifies the file name to be loaded by the UEFI boot for this modu=
le. If
>> +    this is specified, there is no need to specify the reg property bec=
ause it
>> +    will be created by the UEFI stub on boot.
>> +    This option is needed only when UEFI boot is used.
>=20
> We need to specify that this parameter is a string.

ok

>=20
>=20
>> The ramdisk sub-node has the following properties:
>>=20
>> - compatible
>> @@ -193,6 +200,13 @@ The ramdisk sub-node has the following properties:
>>     Specifies the physical address of the ramdisk in RAM and its
>>     length.
>>=20
>> +- efi,binary (UEFI boot only)
>> +
>> +    Specifies the file name to be loaded by the UEFI boot for this modu=
le. If
>> +    this is specified, there is no need to specify the reg property bec=
ause it
>> +    will be created by the UEFI stub on boot.
>> +    This option is needed only when UEFI boot is used.
>=20
> same here

Ok

>=20
>>=20
>> Example
>> =3D=3D=3D=3D=3D=3D=3D
>> @@ -257,6 +271,13 @@ The dtb sub-node should have the following properti=
es:
>>     Specifies the physical address of the device tree binary fragment
>>     RAM and its length.
>>=20
>> +- efi,binary (UEFI boot only)
>> +
>> +    Specifies the file name to be loaded by the UEFI boot for this modu=
le. If
>> +    this is specified, there is no need to specify the reg property bec=
ause it
>> +    will be created by the UEFI stub on boot.
>> +    This option is needed only when UEFI boot is used.
>=20
> same here

Ok

>=20
>=20
>> As an example:
>>=20
>>         module@0xc000000 {
>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index e289c5e7ba..698196e129 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -167,3 +167,206 @@ sbsign \
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
>> +domU1 {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +	compatible =3D "xen,domain";
>> +	memory =3D <0 0x20000>;
>> +	cpus =3D <1>;
>> +	vpl011;
>> +
>> +	module@1 {
>> +		compatible =3D "multiboot,kernel", "multiboot,module";
>> +		uefi,binary =3D "vmlinuz-3.0.31-0.4-xen";
>> +		bootargs =3D "console=3DttyAMA0";
>> +	};
>> +	module@2 {
>> +		compatible =3D "multiboot,ramdisk", "multiboot,module";
>> +		uefi,binary =3D "initrd-3.0.31-0.4-xen";
>> +	};
>> +	module@3 {
>> +		compatible =3D "multiboot,ramdisk", "multiboot,module";
>> +		uefi,binary =3D "passthrough.dtb";
>> +	};
>> +};
>> +
>> +## How to boot different Xen setup using UEFI
>> +
>> +Here the supported user cases for Xen when UEFI boot is used:
>=20
> "Supported" means different things to different people, so I would say
> instead:
>=20
> These are the different ways to boot a Xen system from UEFI:

Ok

>=20
>=20
>> +
>> + - Boot Xen and Dom0 (minimum required)
>> + - Boot Xen and DomU(s) (true dom0less, only on ARM)
>> + - Boot Xen, Dom0 and DomU(s) (only on ARM)
>> +
>> +### Boot Xen and Dom0
>> +
>> +This configuration can be started using the Xen configuration file in t=
he
>> +example above.
>> +
>> +### Boot Xen and DomU(s)
>> +
>> +This configuration needs the domU domain(s) specified in the /chosen no=
de,
>> +examples of how to do that are provided by the documentation about dom0=
less
>> +and the example above shows how to use the "uefi,binary" property to us=
e the
>> +UEFI stub for module loading.
>> +Providing the multiboot modules in the device tree, make Xen skip its U=
EFI
>> +configuration file, if it is needed for some reason, specify the "uefi,=
cfg-load"
>> +property in the /chosen node.
>=20
> This last sentence is not very clear and it looks like one needs to
> specify "uefi,cfg-load" to skip the Xen config file when actually it is
> the opposite. I would suggest instead:
>=20
> When adding DomU modules to device tree, also add the property
> uefi,cfg-load under chosen to have Xen load the Xen config file.
> Otherwise, Xen will skip the config file and rely on device tree alone.

Ok

>=20
>=20
>> +Example 1 of how to boot a true dom0less configuration:
>> +
>> +Xen configuration file: skipped.
>> +
>> +Device tree:
>> +
>> +```
>> +chosen {
>> +	#size-cells =3D <0x1>;
>> +	#address-cells =3D <0x1>;
>> +	xen,xen-bootargs =3D "<Xen command line>"
>> +
>> +	domU1 {
>> +		#size-cells =3D <0x1>;
>> +		#address-cells =3D <0x1>;
>> +		compatible =3D "xen,domain";
>> +		cpus =3D <0x1>;
>> +		memory =3D <0x0 0xc0000>;
>> +		vpl011;
>> +
>> +		module@1 {
>> +			compatible =3D "multiboot,kernel", "multiboot,module";
>> +			uefi,binary =3D "Image-domu1.bin";
>> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
>> +		};
>> +	};
>> +	domU2 {
>> +		#size-cells =3D <0x1>;
>> +		#address-cells =3D <0x1>;
>> +		compatible =3D "xen,domain";
>> +		cpus =3D <0x1>;
>> +		memory =3D <0x0 0x100000>;
>> +		vpl011;
>> +
>> +		module@2 {
>> +			compatible =3D "multiboot,kernel", "multiboot,module";
>> +			uefi,binary =3D "Image-domu2.bin";
>> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
>> +		};
>> +	};
>> +};
>> +```
>> +
>> +Example 2 of how to boot a true dom0less configuration:
>> +
>> +Xen configuration file:
>> +
>> +```
>> +[global]
>> +default=3Dxen
>> +
>> +[xen]
>> +options=3D<Xen command line>
>> +dtb=3D<optional DTB>
>> +```
>> +
>> +Device tree:
>> +
>> +```
>> +chosen {
>> +	#size-cells =3D <0x1>;
>> +	#address-cells =3D <0x1>;
>> +	uefi,cfg-load;
>> +
>> +	domU1 {
>> +		#size-cells =3D <0x1>;
>> +		#address-cells =3D <0x1>;
>> +		compatible =3D "xen,domain";
>> +		cpus =3D <0x1>;
>> +		memory =3D <0x0 0xc0000>;
>> +		vpl011;
>> +
>> +		module@1 {
>> +			compatible =3D "multiboot,kernel", "multiboot,module";
>> +			uefi,binary =3D "Image-domu1.bin";
>> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
>> +		};
>> +	};
>> +	domU2 {
>> +		#size-cells =3D <0x1>;
>> +		#address-cells =3D <0x1>;
>> +		compatible =3D "xen,domain";
>> +		cpus =3D <0x1>;
>> +		memory =3D <0x0 0x100000>;
>> +		vpl011;
>> +
>> +		module@2 {
>> +			compatible =3D "multiboot,kernel", "multiboot,module";
>> +			uefi,binary =3D "Image-domu2.bin";
>> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
>> +		};
>> +	};
>> +};
>> +```
>> +
>> +### Boot Xen, Dom0 and DomU(s)
>> +
>> +This configuration is a mix of the two configuration above, to boot thi=
s one
>> +the configuration file must be processed so the /chosen node must have =
the
>> +"uefi,cfg-load" property.
>> +
>> +Here an example:
>> +
>> +Xen configuration file:
>> +
>> +```
>> +[global]
>> +default=3Dxen
>> +
>> +[xen]
>> +options=3D<Xen command line>
>> +kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>> +ramdisk=3Dinitrd-3.0.31-0.4-xen
>> +dtb=3D<optional DTB>
>> +```
>> +
>> +Device tree:
>> +
>> +```
>> +chosen {
>> +	#size-cells =3D <0x1>;
>> +	#address-cells =3D <0x1>;
>> +	uefi,cfg-load;
>> +
>> +	domU1 {
>> +		#size-cells =3D <0x1>;
>> +		#address-cells =3D <0x1>;
>> +		compatible =3D "xen,domain";
>> +		cpus =3D <0x1>;
>> +		memory =3D <0x0 0xc0000>;
>> +		vpl011;
>> +
>> +		module@1 {
>> +			compatible =3D "multiboot,kernel", "multiboot,module";
>> +			uefi,binary =3D "Image-domu1.bin";
>> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
>> +		};
>> +	};
>> +};
>> +```
>> +
>> +
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index 8ceeba4ad1..e2b007ece0 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -8,9 +8,43 @@
>> #include <asm/setup.h>
>> #include <asm/smp.h>
>>=20
>> +typedef struct {
>> +    char *name;
>> +    unsigned int name_len;
>> +    EFI_PHYSICAL_ADDRESS addr;
>> +    UINTN size;
>> +} dom0less_module_name;
>> +
>> +/*
>> + * Binaries will be translated into bootmodules, the maximum number for=
 them is
>> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DT=
B
>> + */
>> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
>> +static struct file __initdata dom0less_file;
>> +static dom0less_module_name __initdata dom0less_modules[MAX_DOM0LESS_MO=
DULES];
>> +static unsigned int __initdata dom0less_modules_available =3D
>> +                               MAX_DOM0LESS_MODULES;
>> +static unsigned int __initdata dom0less_modules_idx;
>=20
> This is a lot better!
>=20
> We don't need both dom0less_modules_idx and dom0less_modules_available.
> You can just do:
>=20
> #define dom0less_modules_available (MAX_DOM0LESS_MODULES - dom0less_modul=
es_idx)
> static unsigned int __initdata dom0less_modules_idx;
>=20
> But maybe we can even get rid of dom0less_modules_available entirely?
>=20
> We can change the check at the beginning of allocate_dom0less_file to:
>=20
> if ( dom0less_modules_idx =3D=3D dom0less_modules_available )
>    blexit
>=20
> Would that work?

I thought about it but I think they need to stay, because dom0less_modules_=
available is the
upper bound for the additional dom0less modules (it is decremented each tim=
e a dom0 module
Is added), instead dom0less_modules_idx is the typical index for the array =
of dom0less modules.

>=20
>=20
>> +#define ERROR_DOM0LESS_FILE_NOT_FOUND (-1)
>> +
>> void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>> void __flush_dcache_area(const void *vaddr, unsigned long size);
>>=20
>> +static int get_dom0less_file_index(const char *name, unsigned int name_=
len);
>> +static unsigned int allocate_dom0less_file(EFI_FILE_HANDLE dir_handle,
>> +                                           const char *name,
>> +                                           unsigned int name_len);
>> +static void handle_dom0less_module_node(EFI_FILE_HANDLE dir_handle,
>> +                                        int module_node_offset,
>> +                                        int reg_addr_cells,
>> +                                        int reg_size_cells);
>> +static void handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>> +                                        int domain_node,
>> +                                        int addr_cells,
>> +                                        int size_cells);
>> +static bool efi_arch_check_dom0less_boot(EFI_FILE_HANDLE dir_handle);
>>=20
>> #define DEVICE_TREE_GUID \
>> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, =
0xe0}}
>>=20
>> @@ -552,8 +586,218 @@ static void __init efi_arch_handle_module(const st=
ruct file *file,
>>                          kernel.size) < 0 )
>>             blexit(L"Unable to set reg property.");
>>     }
>> -    else
>> +    else if ( file !=3D &dom0less_file )
>> +        /*
>> +         * If file is not a dom0 module file and it's not a domU module=
,
>> +         * stop here.
>> +         */
>>         blexit(L"Unknown module type");
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
>> +static int __init get_dom0less_file_index(const char *name,
>> +                                          unsigned int name_len)
>> +{
>> +    unsigned int i;
>> +    int ret =3D ERROR_DOM0LESS_FILE_NOT_FOUND;
>> +
>> +    for (i =3D 0; i < dom0less_modules_idx; i++)
>> +    {
>> +        dom0less_module_name *mod =3D &dom0less_modules[i];
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
>> +static unsigned int __init allocate_dom0less_file(EFI_FILE_HANDLE dir_h=
andle,
>> +                                                  const char *name,
>> +                                                  unsigned int name_len=
)
>> +{
>> +    dom0less_module_name* file_name;
>> +    union string module_name;
>> +    unsigned int ret_idx;
>> +
>> +    /*
>> +     * Check if there is any space left for a domU module, the variable
>> +     * dom0less_modules_available is updated each time we use read_file=
(...)
>> +     * successfully.
>> +     */
>> +    if ( !dom0less_modules_available )
>> +        blexit(L"No space left for domU modules");
>=20
> This is the check that could be based on dom0less_modules_idx
>=20

The only way I see to have it based on dom0less_modules_idx will be to comp=
are it
to the amount of modules still available, that is not constant because it i=
s dependent
on how many dom0 modules are loaded, so still two variables needed.
Don=E2=80=99t know if I=E2=80=99m missing something.

>=20
>> +    module_name.s =3D (char*) name;
>> +    ret_idx =3D dom0less_modules_idx;
>> +
>> +    /* Save at this index the name of this binary */
>> +    file_name =3D &dom0less_modules[ret_idx];
>> +
>> +    if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(ch=
ar),
>> +                              (void**)&file_name->name) !=3D EFI_SUCCES=
S )
>> +        blexit(L"Error allocating memory for dom0less binary name");
>> +
>> +    /* Save name and length of the binary in the data structure */
>> +    strlcpy(file_name->name, name, name_len);
>> +    file_name->name_len =3D name_len;
>=20
> Sorry for the silly question but do we need to set the '\0' at the end
> of the string or can we assumed the memory returned by AllocatePool is
> already zeroed? Or should we call strlcpy with name_len+1 ?

Not silly at all, I will call strlcpy with name_len+1 and strlcpy will put =
the
termination.

>=20
>=20
>> +
>> +    /* Load the binary in memory */
>> +    read_file(dir_handle, s2w(&module_name), &dom0less_file, NULL);
>> +
>> +    /* Save address and size */
>> +    file_name->addr =3D dom0less_file.addr;
>> +    file_name->size =3D dom0less_file.size;
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
>> +    const void *uefi_name_prop;
>> +    char mod_string[24]; /* Placeholder for module@ + a 64-bit number +=
 \0 */
>> +    int uefi_name_len, file_idx;
>> +    dom0less_module_name *file;
>> +
>> +    /* Read uefi,binary property to get the file name. */
>> +    uefi_name_prop =3D fdt_getprop(fdt, module_node_offset, "uefi,binar=
y",
>> +                                 &uefi_name_len);
>> +
>> +    if ( !uefi_name_prop )
>> +        /* Property not found */
>> +        return;
>> +
>> +    file_idx =3D get_dom0less_file_index(uefi_name_prop, uefi_name_len)=
;
>> +    if (file_idx < 0)
>> +        file_idx =3D allocate_dom0less_file(dir_handle, uefi_name_prop,
>> +                                          uefi_name_len);
>> +
>> +    file =3D &dom0less_modules[file_idx];
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
>> +    int module_node;
>> +    /*
>> +     * Check for nodes compatible with multiboot,{kernel,ramdisk,device=
-tree}
>> +     * inside this node
>> +     */
>> +    for ( module_node =3D fdt_first_subnode(fdt, domain_node);
>> +          module_node > 0;
>> +          module_node =3D fdt_next_subnode(fdt, module_node) )
>> +        if ( (fdt_node_check_compatible(fdt, module_node,
>> +                                        "multiboot,kernel") =3D=3D 0) |=
|
>> +             (fdt_node_check_compatible(fdt, module_node,
>> +                                        "multiboot,ramdisk") =3D=3D 0) =
||
>> +             (fdt_node_check_compatible(fdt, module_node,
>> +                                        "multiboot,device-tree") =3D=3D=
 0) )
>> +            /* The compatible is one of the strings above, check the mo=
dule */
>> +            handle_dom0less_module_node(dir_handle, module_node, addr_c=
ells,
>> +                                        size_cells);
>> +}
>> +
>> +/*
>> + * This function checks for xen domain nodes under the /chosen node for=
 possible
>> + * domU guests to be loaded.
>> + */
>> +static bool __init efi_arch_check_dom0less_boot(EFI_FILE_HANDLE dir_han=
dle)
>> +{
>> +    int chosen;
>> +    int addr_len, size_len;
>> +    unsigned int i =3D 0;
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
>> +    /* Free dom0less file names if any */
>> +    for ( ; i < dom0less_modules_idx; i++ )
>> +    {
>> +        /* Free dom0less binary names */
>> +        efi_bs->FreePool(dom0less_modules[i].name);
>> +    }
>> +
>> +    if ( dom0less_modules_idx > 0 )
>> +        return true;
>> +
>> +    return false;
>> }
>>=20
>> static void __init efi_arch_cpu(void)
>> @@ -562,8 +806,19 @@ static void __init efi_arch_cpu(void)
>>=20
>> static void __init efi_arch_blexit(void)
>> {
>> +    unsigned int i =3D 0;
>> +
>>     if ( dtbfile.need_to_free )
>>         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
>> +    /* Free dom0less files if any */
>> +    for ( ; i < dom0less_modules_idx; i++ )
>> +    {
>> +        /* Free dom0less binary names */
>> +        efi_bs->FreePool(dom0less_modules[i].name);
>> +        /* Free dom0less binaries */
>> +        efi_bs->FreePages(dom0less_modules[i].addr,
>> +                          PFN_UP(dom0less_modules[i].size));
>> +    }
>>     if ( memmap )
>>         efi_bs->FreePool(memmap);
>> }
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 9b0cc29aae..950fdf16b7 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -678,6 +678,12 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
>>     efi_bs->FreePool(ptr);
>> }
>>=20
>> +static bool __init efi_arch_check_dom0less_boot(EFI_FILE_HANDLE dir_han=
dle)
>> +{
>> +    /* x86 doesn't support dom0less */
>> +    return false;
>> +}
>> +
>> static void __init efi_arch_cpu(void)
>> {
>>     uint32_t eax =3D cpuid_eax(0x80000000);
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index 758f9d74d2..7d8734199e 100644
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1127,15 +1127,16 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>>     EFI_LOADED_IMAGE *loaded_image;
>>     EFI_STATUS status;
>> -    unsigned int i, argc;
>> -    CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NU=
LL;
>> +    unsigned int i, argc =3D 0;
>> +    CHAR16 **argv, *file_name =3D NULL, *cfg_file_name =3D NULL, *optio=
ns =3D NULL;
>>     UINTN gop_mode =3D ~0;
>>     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>>     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
>>     union string section =3D { NULL }, name;
>>     bool base_video =3D false;
>> -    const char *option_str;
>> +    const char *option_str =3D NULL;
>>     bool use_cfg_file;
>> +    EFI_FILE_HANDLE dir_handle;
>>=20
>>     __set_bit(EFI_BOOT, &efi_flags);
>>     __set_bit(EFI_LOADER, &efi_flags);
>> @@ -1216,9 +1217,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>=20
>>     efi_arch_relocate_image(0);
>>=20
>> +    /* Get the file system interface. */
>> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>> +
>>     if ( use_cfg_file )
>>     {
>> -        EFI_FILE_HANDLE dir_handle;
>>         UINTN depth, cols, rows, size;
>>=20
>>         size =3D cols =3D rows =3D depth =3D 0;
>> @@ -1229,9 +1232,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>=20
>>         gop =3D efi_get_gop();
>>=20
>> -        /* Get the file system interface. */
>> -        dir_handle =3D get_parent_handle(loaded_image, &file_name);
>> -
>>         /* Read and parse the config file. */
>>         if ( read_section(loaded_image, L"config", &cfg, NULL) )
>>             PrintStr(L"Using builtin config file\r\n");
>> @@ -1285,14 +1285,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
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
>> +        if ( name.s )
>> +            option_str =3D split_string(name.s);
>>=20
>> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_str=
) )
>> +        if ( !read_section(loaded_image, L"kernel", &kernel, option_str=
) &&
>> +             name.s )
>=20
> I'd probably indent this and put it under the previous if, instead of
> adding "&& name.s". But I'll leave it up to you.

If name.s is not specified we might want to check if the kernel is in the i=
mage section anyway.
When read_section is executed, it it returns true, then the kernel is loade=
d even if the name.s
Is NULL (it is NULL because we didn=E2=80=99t specify kernel=3D<image> <arg=
s>)
The code there is a little bit tricky I can tell.

>=20
>=20
>>         {
>>             read_file(dir_handle, s2w(&name), &kernel, option_str);
>>             efi_bs->FreePool(name.w);
>> @@ -1361,12 +1360,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>         cfg.addr =3D 0;
>>=20
>> -        dir_handle->Close(dir_handle);
>> -
>>         if ( gop && !base_video )
>>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>     }
>>=20
>> +    /*
>> +     * Check if a proper configuration is provided to start Xen:
>> +     *  - Dom0 specified (minimum required)
>> +     *  - Dom0 and DomU(s) specified
>> +     *  - DomU(s) specified
>> +     */
>> +    if ( !efi_arch_check_dom0less_boot(dir_handle) && !kernel.addr )
>> +        blexit(L"No Dom0 kernel image specified.");
>> +
>> +    dir_handle->Close(dir_handle);
>> +
>>     efi_arch_edd();
>>=20
>>     /* XXX Collect EDID info. */
>> --=20
>> 2.17.1


