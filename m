Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904089D2C1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 08:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702161.1097024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru5Qd-0000Ij-SL; Tue, 09 Apr 2024 06:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702161.1097024; Tue, 09 Apr 2024 06:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru5Qd-0000GY-Od; Tue, 09 Apr 2024 06:57:59 +0000
Received: by outflank-mailman (input) for mailman id 702161;
 Tue, 09 Apr 2024 06:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnKP=LO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ru5Qc-0000GS-IG
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 06:57:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eb89ed6-f63e-11ee-9150-f14010f3f246;
 Tue, 09 Apr 2024 08:57:57 +0200 (CEST)
Received: from DB9PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:1da::9)
 by VE1PR08MB5790.eurprd08.prod.outlook.com (2603:10a6:800:1a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 06:57:25 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::8b) by DB9PR05CA0004.outlook.office365.com
 (2603:10a6:10:1da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 9 Apr 2024 06:57:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 9 Apr 2024 06:57:21 +0000
Received: ("Tessian outbound e26069fc76b9:v300");
 Tue, 09 Apr 2024 06:57:21 +0000
Received: from bd76fe63aa16.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED983514-2803-4D54-A8F8-52B2D7D5FDE5.1; 
 Tue, 09 Apr 2024 06:57:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd76fe63aa16.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Apr 2024 06:57:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6472.eurprd08.prod.outlook.com (2603:10a6:20b:336::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 06:57:14 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 06:57:14 +0000
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
X-Inumbo-ID: 7eb89ed6-f63e-11ee-9150-f14010f3f246
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I2qsmb/jjH8P+ZSpD64URS71mki9B4FXvPLVMiJePmGQiCllONyYMubwSKX+9RWx1pjD9ybjSxOadTa8eueYcTCEZ5vzKBJ7yAUAxZvBXD2kee3dz/BwKOUIDospRY2YTrsjPNB/Y84+pSOJ3iHGVKqBJhklrbzkuAQ8K90d3VEeQwvgpz8tyuEK9gzy9jDcvwJMBi4E++lKqibItOmrvNucTHjlrMXfqyxpGoFe75iqceLEL4Uy91D1uDvX+Xoh6a6qMWgaJeaofbn3O6g40dvkvpBXxq0GNmSTdIsvW1KM0pFZKIooK1nF/e2IDPxxJJa821r6RMEWSyrRq2qPaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ywumUPEqXGa3FzRxQd1bVCqoma0uwlxI6aAeNPh8GY=;
 b=O4PaIDFBNAe/xMEXw+qkIN70oOIcVqoEX3GOhW/DcxhW3rs4O1LEbD+qsjticrgN6WUSh6/zGtpDSu7TJyFHwikyeJ7YuI3lmbU7okQqN5cSzBdXSEK7VodOClJf5eZoCC8JRTW0lQQlCnpg7QsS0KpIwYKJ3OP7o2tL8oDoRZ7kRY2QSID9b40l2R/aLYNFNLEbrrcGBNnkuucSSoCgz96ysXc5P3nQ0ky8Rd/stbSzI8DocpXMs2buHGSyZRaSESsOMwUqfAmQqYDSrMEwmwY3OO4BanNG/WanbtXWWK8lZ3RaxDqkIMO5UMiKe5ZSvoSao/Zp6udGSmhZXwT77A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ywumUPEqXGa3FzRxQd1bVCqoma0uwlxI6aAeNPh8GY=;
 b=yE1LZuQp1++mmMO+f9Rqu4BjJh8LcaQ6b+9f30ij0/fotK3s9t1Ymrg7aDPkWOznDnUTGTnpRkslv35yWZZLvKqh7x0y37prfsL5u3ATWjwE6Ge+truIgW6pwxumbgzgq5OLTDWBfwUZRVpiV9lEWLi7kJOe0r8e0lCjUQm/zNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41308ac471f644fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4WJRYIxjrYWSUvjV9GoXMwR0vwebQzUEerwX7Zp8Oq5/yMLgulVSvmOGYLCRJX0PG5A8sq1qSs80hkkOcQRQJfDnxZ6zHw4RfIMxx133QS8tVL8skk9SPKwD13LKhpW12b7t0TwBxLg6sEiwxLCTms0xF3y77T5DoWiBEo3CMc3HD3Fiw3qBF+ai0SUbRDCqmGZRZRhWFGbe1AFH/piDdKL1N/l8Rp2zbucqwClf3yFFuHOkZZBTf5pu3J6eDFyPhSmagADHsVzoVmAJrZ/6iB7Zaoav4pVyI9ukxeqwIVBL+984HqChMkTRoITTbR5dKLiyk98k8Sx1wC3ZXjNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ywumUPEqXGa3FzRxQd1bVCqoma0uwlxI6aAeNPh8GY=;
 b=exu1hPzaZ7lYUsKuGWMU0gValfVhURgrMemaizt/6kDi9xG9CX96NUYp2FGTjGleHGZJLcZVPwuNUfYRX8ELgzcIp4a81Da8cS9Ob3HxcvpjwJGnRMG+FLo+nMq55ykWyLVXXSXRbEvMizNO8RSyQxZJpw5wm9bh9MUho9/ivVMSE7yNE91+rvsrUXE3yJlBdPm2XT7020Vc+iu8RqFrHDofebkTeDNT2Bc5aOBBLJdA4v+gN8JSINUTI95QUpnhMpV27hvlx4C4DpzHGzTzPWSBgQI2kZcEuN9M4+wQCNo3Iu75f+kcGoEwUDkQ+HBe/tK0z67oiFLWBoBxJz1Swg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ywumUPEqXGa3FzRxQd1bVCqoma0uwlxI6aAeNPh8GY=;
 b=yE1LZuQp1++mmMO+f9Rqu4BjJh8LcaQ6b+9f30ij0/fotK3s9t1Ymrg7aDPkWOznDnUTGTnpRkslv35yWZZLvKqh7x0y37prfsL5u3ATWjwE6Ge+truIgW6pwxumbgzgq5OLTDWBfwUZRVpiV9lEWLi7kJOe0r8e0lCjUQm/zNw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4] docs/misra: document the expected sizes of integer
 types
Thread-Topic: [PATCH v4] docs/misra: document the expected sizes of integer
 types
Thread-Index: AQHah4lk+w1h9RgyfUmcoVl2Erm4ibFfhy2A
Date: Tue, 9 Apr 2024 06:57:14 +0000
Message-ID: <124F2681-5A59-4ADA-AC06-770782162239@arm.com>
References:
 <alpine.DEB.2.22.394.2404051144020.2245130@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2404051144020.2245130@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6472:EE_|DB1PEPF000509F0:EE_|VE1PR08MB5790:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n6cMZRc55k54qXzbPHMAD+JBl91s431mp0zlbw/Tb/I/UA9jpLVwS7v9HpH08bXzXkR6cqXJCAX5L3ZC/85m60ucS2QLFoJKl5REea3bz9UXrBmgUs1jZn1z1J4nkcCCkm8+6qQhK9XVZ+BxDxvg1IXDKNcair3hEE65/N2DQ3Qg/rVeIHhx9gqRcpSHNE6THypSQSPpjbn4Ga2sIFjzjnWrZhGfEq25LjIeYY8iBVNFQHtj4qWKIUwBxkbILeaexQBQY51xKPw6adgXRlhH7LZ3KfESk4PNepWsyrckFvSYjjcIW1sixjSwZ/RuXmtpAR3FiMFU70fEvTuhuqzgQU9gIXcmuYGQ0qDFUIHf9WO7VN+ccU04JZATbBMi1QBLn5BBkxUPaWiQUPzZXDp9RvvKavnWcNQ3An45P1awfwzQmMknLMkB91w3G0BrkKCVOqv9jIgpe1i2byNXpGqiMHbDSEqeXTshIUXpSURD4GOAQGVWgiRG+7nYMiQvpiMTL1THIq0eQpJXXXbogeU/Rm5+E3kX5Se2f4dpSa34orwSwQhoHL4/WfrEWte95WGUDiahDbVcE60LOKwzQanMu6dGeSL3mcviCY2Q1bRd15nxyMCwzbTiEbaxAKXxRWwDcKLt/qAYojWA3+auM/simGYUvzKnHelEcwJWZ8OxTMQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <59ED85CE799E7C419018B6D0149F6EA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6472
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6632f171-5022-42c4-c305-08dc58624e06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQIoQ0njKjC6QltvR/hiy3C0eUpTC25aTbPiMarTfdCB9AGSXw+t4rW53KlAofBj9C0tvfqqJWxZ6wJsxcr6QMHk/wyHt2BBdRma5wGTzpImngYUibz6du56nWJXjrKaZif3Il2rF1RFjQ3qWtYfx9onGTgHZdR3nUnvxHRhGqTAXtwzURjdH7dN2EoUBdgUgmhHBeNP+mZGAJ8tPmSD5y/81I9GZVtMb0qrwPdH1Az5wnXuzAZdiaqAs8nOcBmcKT05k3Dr8mf7f+1FsZScdnCoTJAVkxBGC6YwaOeuJUW4/gN5jZUIDk3QjphO9iLvZas6BG/Tx1QOu8L1B39mep5UNkYaHGSQZV/Tmf2ZXa+Z7QargbMJ1GyhSpy6Vbbi56w9viP4rJsooB6RDffg3x5J1YIMvh49QCyXxbzSUu4/QXBPe0qg/Mnmgun40yTObJoS3hjYxhYfi/HPTbgeZVZHjEX9p5fOeCrCYACKyaTov/jCqr4Pw1yFv2g8fM0pXjmBTrCkdwU23KWe/jBAvkye4yoQtzVAD0XHyWJekYtgUdsathv65iac0IBoCcSz61jUeY87iDQpNTI9TzX7xv0n/kLHo2J8WIqILKA72r4QVl7GXXhvFEwomTBmz6lGGpW48Qb6465GkZYge61YIvrXJ+KWpbAKNpmW91iB1GWtj9OSk0MXppufSD7THw9TrJkDf9neqtUCc4REuUYc3tvWA3g1B4f8W6AhUDzq9dDmYmvL2SHQslTcguVfv885yF32ozGMdOpwvV5qGw6/8A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 06:57:21.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6632f171-5022-42c4-c305-08dc58624e06
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5790

Hi Stefano,

> On 5 Apr 2024, at 20:44, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> Xen makes assumptions about the size of integer types on the various
> architectures. Document these assumptions.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I think it is a good start and definitely better than having nothing docume=
nted so:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v4:
> - list the architectures explicitly
> - add ARMv7-A
> ---
> docs/misra/C-language-toolchain.rst | 73 +++++++++++++++++++++++++++++
> 1 file changed, 73 insertions(+)
>=20
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-=
toolchain.rst
> index b7c2000992..5ddfe7bdbe 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -480,4 +480,77 @@ The table columns are as follows:
>      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Sect=
ion "11.1 Implementation-defined behavior" of CPP_MANUAL.
>=20
>=20
> +Sizes of Integer types
> +______________________
> +
> +Xen expects System V ABI on x86_64:
> +  https://gitlab.com/x86-psABIs/x86-64-ABI
> +
> +Xen expects AAPCS32 on ARMv8-A AArch32 and ARMv7-A:
> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
> +
> +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
> +
> +A summary table of data types, sizes and alignment is below:
> +
> +.. list-table::
> +   :widths: 10 10 10 45
> +   :header-rows: 1
> +
> +   * - Type
> +     - Size
> +     - Alignment
> +     - Architectures
> +
> +   * - char=20
> +     - 8 bits
> +     - 8 bits
> +     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A, x86_64,
> +       ARMv8-A AArch64, RV64, PPC64
> +
> +   * - short
> +     - 16 bits
> +     - 16 bits
> +     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A, x86_64,
> +       ARMv8-A AArch64, RV64, PPC64
> +
> +   * - int
> +     - 32 bits
> +     - 32 bits
> +     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A, x86_64,
> +       ARMv8-A AArch64, RV64, PPC64
> +
> +   * - long
> +     - 32 bits
> +     - 32 bits=20
> +     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A
> +
> +   * - long
> +     - 64 bits
> +     - 64 bits=20
> +     - x86_64, ARMv8-A AArch64, RV64, PPC64
> +
> +   * - long long
> +     - 64-bit
> +     - 32-bit
> +     - x86_32
> +
> +   * - long long
> +     - 64-bit
> +     - 64-bit
> +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R
> +       AArch32, ARMv7-A
> +
> +   * - pointer
> +     - 32-bit
> +     - 32-bit
> +     - x86_32, ARMv8-A AArch32, ARMv8-R AArch32, ARMv7-A
> +
> +   * - pointer
> +     - 64-bit
> +     - 64-bit
> +     - x86_64, ARMv8-A AArch64, RV64, PPC64
> +
> +
> END OF DOCUMENT.
> --=20
> 2.25.1
>=20


