Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5041DC64
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 16:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200005.354377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVx9D-0000jU-2G; Thu, 30 Sep 2021 14:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200005.354377; Thu, 30 Sep 2021 14:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVx9C-0000h8-U9; Thu, 30 Sep 2021 14:34:54 +0000
Received: by outflank-mailman (input) for mailman id 200005;
 Thu, 30 Sep 2021 14:34:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YInd=OU=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVx9C-0000e5-96
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 14:34:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9297bc4b-21fb-11ec-bd4e-12813bfff9fa;
 Thu, 30 Sep 2021 14:34:53 +0000 (UTC)
Received: from AS9PR06CA0213.eurprd06.prod.outlook.com (2603:10a6:20b:45e::12)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 30 Sep
 2021 14:34:51 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::2d) by AS9PR06CA0213.outlook.office365.com
 (2603:10a6:20b:45e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 14:34:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 14:34:50 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Thu, 30 Sep 2021 14:33:46 +0000
Received: from 7c533c432ce7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 813328F4-B15B-4199-8845-86E9136F7F88.1; 
 Thu, 30 Sep 2021 14:33:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c533c432ce7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 14:33:33 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 14:33:30 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 14:33:30 +0000
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
X-Inumbo-ID: 9297bc4b-21fb-11ec-bd4e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19xI88ys4R3Ukt/N9WTN1BTeGYle4keyVGvSxbzotoQ=;
 b=jgYDGAC+1s0Q9PxnlZ0/PVMFZzM3gA2FxvfVwgbK2wLRPdoxy07UPgHYa9+ciqPnoT4NVK7fTtoteTJXjEN0a7TZOhnz3cNcE20AgIGsAaaoMVYGTiCdOlC9aPlTtzZcyBOQIglVaFPQYuwD2tl22QiXtT8qPCpKItP8j4RgfYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e92ac0beda1af1e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuXUygolcnfHsGvUGqvBBhXFHiZ5OCFVPbSfHEekKiSg4PtI5PDSEbwTM7so4F8aZCFUZopOiAau1FN+fGxlMesU5w56Inb/IFnMHt+hsTmCebmn/sz9i7Jm2Pq2HAEbOC+6y3wl7w7mLSo75dpCzgtzQ5kLYTsPXcRvK2Bm7FI5XHNT1RDSj8m1NANVT/KQQh3gDoMOuEOz20pugN8vvggU3Z0E9gGQd0I8j1lFVMwAaJLzrOTpgTx0HIvJczwzsiCgUnjxOROYn6oDiUxSIvIcA04xkykXOsxaeB6DhIK60Wru5Kdgm/zhKkT7kF6JdhVqSiE6HFK7H+92KQXasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=19xI88ys4R3Ukt/N9WTN1BTeGYle4keyVGvSxbzotoQ=;
 b=WVcWXJ9stWvVbt/Rnt/PVKoStVU40XOxWQPfkICYvuBu+IyFJnZeuuQSLYNXEWL2HwWUmkpdzVL9v/i1qhGxlU5HBhOS8Hk390lTPdIwSsceia19M+RD7TwknfSdht3pH/AbQpE8OaBwRsChpuMoeiAjwh5b/J5tx8DL2IdynmQWcIv1XseoPKtNe2Eikgqgie+FoQPxiKloVRvnJXb0/7iLzTUcxMPmGYQXrUqw0XNZTwBWthOogQt8UAmU70mjLQfnvtapKlQ2xEriD8Myk0KHYQN2tL0O3ucLv/IK9KnQi+Aibww3P02pYFi4B4SE9Xo1Mf5KUphc1BNiu/wNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19xI88ys4R3Ukt/N9WTN1BTeGYle4keyVGvSxbzotoQ=;
 b=jgYDGAC+1s0Q9PxnlZ0/PVMFZzM3gA2FxvfVwgbK2wLRPdoxy07UPgHYa9+ciqPnoT4NVK7fTtoteTJXjEN0a7TZOhnz3cNcE20AgIGsAaaoMVYGTiCdOlC9aPlTtzZcyBOQIglVaFPQYuwD2tl22QiXtT8qPCpKItP8j4RgfYo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 1/3] arm/efi: Introduce xen,uefi-cfg-load DT property
Thread-Topic: [PATCH v4 1/3] arm/efi: Introduce xen,uefi-cfg-load DT property
Thread-Index: AQHXtgeKm5+W6XbeOUevr2j0oD4u3qu8pDcA
Date: Thu, 30 Sep 2021 14:33:30 +0000
Message-ID: <0A3942A2-C668-4BDD-A1A0-D6EFD2738560@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-2-luca.fancellu@arm.com>
In-Reply-To: <20210930142846.13348-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bcb5bbce-548d-4c1e-9794-08d9841f75c7
x-ms-traffictypediagnostic: PAXPR08MB6365:|PA4PR08MB6032:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6032EDE507FB49BE2BC9BC4B9DAA9@PA4PR08MB6032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rj0dKr6twHPE9X6cOtOaMOz3qo2WFQTb655aha2g2rQGX/I/WUa+gtZJ9rMRpnLrgEPTfGNJnJb7FylvjJTZqYulJWI7NKnw5vAW90RiYF7m9mFxWayH3hXFR9NuLafFqQapHUe7UG5OeIm2tMUYRoNXkjnhFZR5e1Zzwj7QonVaI/akGHjdBYPn0pwXAkFKugsiaLORxoHFOfvS+VFtRoFtw5Ggvb0tso9qt7WNKpdYbAzTLauHZ4Ke663Z9a6udFPYY5M1vv49IP6yzBUDXrS7uI1UWWbsuy/xlr811PnW3foqPOlYBi6JNAr1PmKrXaTANYeZHKZxfiixi9m2/QsE0f/LOQ4vm+DIxeXJ1vEe+oczJFr/+HzUP5OPNHQii2fNNwuFJ5dZzuEbv4MG0QPzKdmWwMxFOKid3VuplyhRJfQFHdrtKjg99N84p4OZGIinm8SiRBoecA60vBEgBbdELHx72X7wyPClfofGcYLo9F/lrar4kR1SgggYeDkCCuQzfUg6XSI868MiB80QXcWJMMHomi48wR/7ipzgvVoe2rnwJObqMlKYDnRcZ6llbt+X3owGMcrA2V6yWCtv/2XM0ujFHJS1uWsu03WkLNipCrbaBhXJG7WmSVwCSY2bcuGKgSARWh8R/ZXGKmPHV305UEa/hWt2jZiw8cTjccqLPADMZNPSMbnO7zfyU24izZsuNSDG7oKD4xV/lZAb5eZxXlTeP9XjlqQvQ7ADwGhEICBSFwK5mjCnqJMA9FLO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6862004)(6486002)(6512007)(508600001)(71200400001)(53546011)(37006003)(54906003)(2906002)(186003)(316002)(4326008)(26005)(2616005)(6636002)(6506007)(8936002)(83380400001)(76116006)(91956017)(64756008)(66946007)(66556008)(66476007)(66446008)(86362001)(33656002)(38070700005)(38100700002)(122000001)(5660300002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D0F0FB8D4138F4CB582D24B708E264D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c39bdc37-e2f2-4613-3b50-08d9841f4658
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wYnGC8x5tBlRHWd8p+kijtSm5CpwKbFvQoovqCXE0j6p8GeY2+Ym32pMH+CssBOL9C6pFIek7gI61/Lew+tACTkevXpMOSiFmh+DG2L4wi0wOKowNN4watN/5DpdC++YRFn9AshJWJ/MSf4uPlpQkp5vNLlAPrLXJp4yFjVfjwVgVtNKoOWMQbxyo2+ql2eR2uZagJT8ac0u1MuFu1ZeykfYq0E+oScPSK0GTL+W489Vn/f1IBtFINDqU5RjKvhbgbDVPRdRWIeKNRTKkkdKkD/edaLCRPL/PLl9HvHGqqpq4+NcF5fEdyyQQds3ntW1BPJAdfrGK+cptl+YKSohj9bYJTPOFg6vPukxl4HRodE1hYR3qu1QNsaHRNoL5AH3YIVbgFCQqXdrmfONpi5VlEmD7SnCsFd7CsbY6IxXTfcS/21oQsXVI9V0WBeJud6K4qAwlVTrrreNJnBEekNraRovAcFHEc5u0n5xlY15hsJEtHk8HuoMQa2+XEPGiQx6IwAj1v5tQAHqpEdt154CYPSVjQX5Oc+W0xfqiKeGVgyF/7ugYeTM3Gb9gF9vMkFA8TgCQHpAcu7vbCDzagg872zKVEM6nKSnhYAX+Mc3cziMYWjvS3KS9bSGrdKB7u6iyfRlBOxVYX7RPGTokCoKtlmyDhnpo6RtLllBTKqTkGLAhScsiEN9ZMxoS3eQ4jumYeL2vjSY/AKnpv2csIhqdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(26005)(70586007)(36860700001)(6862004)(316002)(86362001)(81166007)(336012)(37006003)(508600001)(54906003)(2906002)(33656002)(2616005)(6512007)(8676002)(82310400003)(4326008)(186003)(53546011)(8936002)(6506007)(47076005)(83380400001)(5660300002)(36756003)(356005)(6636002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 14:34:50.3943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb5bbce-548d-4c1e-9794-08d9841f75c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032

Hi Luca,

> On 30 Sep 2021, at 15:28, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Introduce the xen,uefi-cfg-load DT property of /chosen
> node for ARM whose presence decide whether to force
> the load of the UEFI Xen configuration file.
>=20
> The logic is that if any multiboot,module is found in
> the DT, then the xen,uefi-cfg-load property is used to see
> if the UEFI Xen configuration file is needed.
>=20
> Modify a comment in efi_arch_use_config_file, removing
> the part that states "dom0 required" because it's not
> true anymore with this commit.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v4 changes:
> - modify property name to xen,uefi-cfg-load
> v3 changes:
> - add documentation to misc/arm/device-tree/booting.txt
> - Modified variable name and logic from skip_cfg_file to
> load_cfg_file
> - Add in the commit message that I'm modifying a comment.
> v2 changes:
> - Introduced uefi,cfg-load property
> - Add documentation about the property
> ---
> docs/misc/arm/device-tree/booting.txt |  8 ++++++++
> docs/misc/efi.pandoc                  |  2 ++
> xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
> 3 files changed, 33 insertions(+), 5 deletions(-)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 44cd9e1a9a..352b0ec43a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs fo=
r Xen, xen,dom0-bootargs
> for Dom0 and bootargs for native Linux.
>=20
>=20
> +UEFI boot and DT
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +When Xen is booted using UEFI, it doesn't read the configuration file if=
 any
> +multiboot module is specified. To force Xen to load the configuration fi=
le, the
> +boolean property xen,uefi-cfg-load must be declared in the /chosen node.
> +
> +
> Creating Multiple Domains directly from Xen
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index ac3cd58cae..ed85351541 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tre=
e provided to Xen.  If a
> bootloader provides a device tree containing modules then any configurati=
on
> files are ignored, and the bootloader is responsible for populating all
> relevant device tree nodes.
> +The property "xen,uefi-cfg-load" can be specified in the /chosen node to=
 force
> +Xen to load the configuration file even if multiboot modules are found.
>=20
> Once built, `make install-xen` will place the resulting binary directly i=
nto
> the EFI boot partition, provided `EFI_VENDOR` is set in the environment (=
and
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..a3e46453d4 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOA=
DED_IMAGE *loaded_image)
>=20
> static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable=
)
> {
> +    bool load_cfg_file =3D true;
>     /*
>      * For arm, we may get a device tree from GRUB (or other bootloader)
>      * that contains modules that have already been loaded into memory.  =
In
> -     * this case, we do not use a configuration file, and rely on the
> -     * bootloader to have loaded all required modules and appropriate
> -     * options.
> +     * this case, we search for the property xen,uefi-cfg-load in the /c=
hosen
> +     * node to decide whether to skip the UEFI Xen configuration file or=
 not.
>      */
>=20
>     fdt =3D lookup_fdt_config_table(SystemTable);
>     dtbfile.ptr =3D fdt;
>     dtbfile.need_to_free =3D false; /* Config table memory can't be freed=
. */
> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module=
") < 0 )
> +
> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
> +    {
> +        /* Locate chosen node */
> +        int node =3D fdt_subnode_offset(fdt, 0, "chosen");
> +        const void *cfg_load_prop;
> +        int cfg_load_len;
> +
> +        if ( node > 0 )
> +        {
> +            /* Check if xen,uefi-cfg-load property exists */
> +            cfg_load_prop =3D fdt_getprop(fdt, node, "xen,uefi-cfg-load"=
,
> +                                        &cfg_load_len);
> +            if ( !cfg_load_prop )
> +                load_cfg_file =3D false;
> +        }
> +    }
> +
> +    if ( !fdt || load_cfg_file )
>     {
>         /*
>          * We either have no FDT, or one without modules, so we must have=
 a
> -         * Xen EFI configuration file to specify modules.  (dom0 require=
d)
> +         * Xen EFI configuration file to specify modules.
>          */
>         return true;
>     }
> --=20
> 2.17.1
>=20


