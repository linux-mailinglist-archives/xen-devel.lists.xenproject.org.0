Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F744E1C1
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 06:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224962.388522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlPW7-0003Y7-EO; Fri, 12 Nov 2021 05:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224962.388522; Fri, 12 Nov 2021 05:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlPW7-0003V2-BL; Fri, 12 Nov 2021 05:54:27 +0000
Received: by outflank-mailman (input) for mailman id 224962;
 Fri, 12 Nov 2021 05:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iiyt=P7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1mlPW6-0003Uw-3r
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 05:54:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe06::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb08997-437c-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 06:54:24 +0100 (CET)
Received: from AS9PR06CA0413.eurprd06.prod.outlook.com (2603:10a6:20b:461::22)
 by DB9PR08MB7068.eurprd08.prod.outlook.com (2603:10a6:10:2c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 05:54:18 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::40) by AS9PR06CA0413.outlook.office365.com
 (2603:10a6:20b:461::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Fri, 12 Nov 2021 05:54:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Fri, 12 Nov 2021 05:54:17 +0000
Received: ("Tessian outbound 892d2780d3aa:v109");
 Fri, 12 Nov 2021 05:54:17 +0000
Received: from 68cef39a4f45.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 795035A1-48C8-4DFB-BD9D-8FCD1BFEA668.1; 
 Fri, 12 Nov 2021 05:54:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68cef39a4f45.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Nov 2021 05:54:10 +0000
Received: from AM9PR08MB6242.eurprd08.prod.outlook.com (2603:10a6:20b:283::22)
 by AM9PR08MB6833.eurprd08.prod.outlook.com (2603:10a6:20b:30b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 12 Nov
 2021 05:54:08 +0000
Received: from AM9PR08MB6242.eurprd08.prod.outlook.com
 ([fe80::2c3d:1cd:1979:b7fc]) by AM9PR08MB6242.eurprd08.prod.outlook.com
 ([fe80::2c3d:1cd:1979:b7fc%8]) with mapi id 15.20.4690.019; Fri, 12 Nov 2021
 05:54:08 +0000
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
X-Inumbo-ID: fcb08997-437c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwt3iv7lU5jcqxmBYBRCphVelE9PNlVw5gxmBaw++s4=;
 b=gzA5Sd4KhpsD42Wlz4OWU9i9CR7MD5+VB7vCVRXJLnx2ECDabnTA4rT5Aq36dPwQ9sXhnMR0VZOT3ciMPdfEfn1npD4Kik2H+8dYcGhFr2egZirxgp/vVDKawMpFzbNbAilzOMxomov6scNOb7ISKSV0Uc7pI/EhaTv5hZiA9Y0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KufeeXRlimwPPdGySiCrgmZXhanAEINAe4eHmE9ZnuUe7QbGpKNvuf2pg/08J4rpqT6CT0cm2g1/fG2OHU+cDaRu+hwIq9EVNzSryfTjYqBh1sgoI4LgUIOqdhpCuVQ4pyk7aDPDls3R3C6DsC6iE4375fG1CuJMzAob7BghUFyvxDuOh/kZ3QfGAnEfbOcvuXRgVOUzh0XWpGnW/icjzTrn8hOKZRZnQgbs8s79Mds4pgMvaccYvY4tAp7wVo2tmw8CF8n6ayVKQH+KlC8T0YhSwkkiCBRpvkgokC4KI1ho2eLAxf33KCVRWjyH2mzgAXbH1xb3L/06A5vm/LnMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwt3iv7lU5jcqxmBYBRCphVelE9PNlVw5gxmBaw++s4=;
 b=fPforthQupCiOu1+Tuca8/btDFniwLqQSmw2CrjRcSByBi76qkCr+sqJTIoyAipzZCe83VZDPR17xuFRkoPkA5bS3dk1SLENqxHCXkwsS0UOb4pw53qKsPI8EYWSWatt77bzytQhhNZAXFJEtwwwXRBfWGceId43BvVt+4BmCz++lp1sezWMNM4u/bxY9fYTBN/voSt7atoFYuBDCLOSBI3Srcr0kOYDzZ+7cs41ay9Gk+dzv0tH3CRM4EPxMZGm58ASW/g8I8aehH3MtPjNLAOKHSEds4PtbUobDkrMtAF00v7NBfqj2zGCWLFitU/AARiQynPGBz1maiyJn0MwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwt3iv7lU5jcqxmBYBRCphVelE9PNlVw5gxmBaw++s4=;
 b=gzA5Sd4KhpsD42Wlz4OWU9i9CR7MD5+VB7vCVRXJLnx2ECDabnTA4rT5Aq36dPwQ9sXhnMR0VZOT3ciMPdfEfn1npD4Kik2H+8dYcGhFr2egZirxgp/vVDKawMpFzbNbAilzOMxomov6scNOb7ISKSV0Uc7pI/EhaTv5hZiA9Y0=
From: Henry Wang <Henry.Wang@arm.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: ACPI/UEFI support for Xen/ARM status?
Thread-Topic: ACPI/UEFI support for Xen/ARM status?
Thread-Index: AQHX132/o6cMSLF9z0aAvBIRSP4UG6v/Yn3A
Date: Fri, 12 Nov 2021 05:54:08 +0000
Message-ID:
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
In-Reply-To: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CCB6AF7DF02B324FAFB095D3BA0CF1CB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3799174b-f51e-42ff-9a44-08d9a5a0dd49
x-ms-traffictypediagnostic: AM9PR08MB6833:|DB9PR08MB7068:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7068C7FFBCA7A2572663565792959@DB9PR08MB7068.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B4RiS9tg/x2g1EkALpV4U87+KgB7YeqZfvVRq/j2BMKsKChDmeoHstiUBx18Z2bNWZ8et2nMbaWlSVn5pQWQFwZ+FRu4lLqSZod7kp3ebNi5yzJ8oZIkbMCgrtHLteLoWSLdTIL8E0QL2uFQPcWfHdX+tme/YyEYah60ksHHeTV4hAVo6RLwRTASr3nIjCNvv0z/dApONNJCMEQQwda1cqzuH5oDzzVpr7vzebBXOPrgWc0eBSf2HM+PecxBOuoQMSyChYiJXjSwnDjN5zO1b5/2Tm/sOCp2ORgOEbzSHOQd3yJnD6H+8cbqcuTlo5eK+wqBSk4z2/KSG63xK/3XDQJ41YBEw5yTWbweZL7wTZcpRUjoH04a7CSGlr1VNFXlHbZNX9zQDEkerggG47Unz0pwqMNdCcr+9TAjRMmrVfkdFT5NtLuLMNsYgw1sdct3g9u5zhZaZR1HN3ufhXoD4tXx/6ozbDaK/ZgFvhFZZS+6N/2pi8EQ7oaNc8g587XQct+GshjIh9kuRp0pclGGWOthQP9xXT7EfrKoDhUNPhWhQTGMtQ+cTURxaSL5sC1nXZ9HRobGVrb1X1u9IBOBTvzWn+ROIAnfG2LEM2NOdKbvYg5WhwmQv58MvHSZh0H2x6ZbUhx6XFN6esmZjAbE0tw+VsMB0ixjvPwa993qXuwOE53vRkUTs6a30c3DIV4hoT+l227PNpXndTfeplet9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6242.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38070700005)(110136005)(83380400001)(71200400001)(186003)(122000001)(66946007)(53546011)(8936002)(9686003)(5660300002)(66476007)(7696005)(33656002)(6506007)(55016002)(2906002)(66446008)(86362001)(316002)(66556008)(4326008)(64756008)(26005)(76116006)(8676002)(38100700002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6833
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f7ad802-8dbb-4857-4579-08d9a5a0d7c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tKkhaf8ioKMGxd1y7JcDklBWxIDSm1Yb1f8K2ubKx/FVmg2P27ItMmqZQMva7zJBtuNOjBXLDjRLFJh8rE7Sj9gBCHkrAxeQ6FaytwAcYtuq/Ju256hlZl2qr9hPsYzXBgTEQAvlWnbkF8HzJBfrZbJ2J222aFkORtHqXuolBwWg4u+kSWvzyQWIaMhdYBLpv56b9sXVsQShd8WMjKxpXk2zfd7GAuWVYqA7aprkgCQ0jxj8ipzPbOtG256gAQFb7l8K3G3gT5x6/3074qEdd3lFlmrA5qfA9LhG/PuD/TTdHbt9Y95Nv1uwfK0HRbiioyjjvFQOi1+iW0f4k+5Yue2pCM7ld7Dl2vyO5z4GksYsIo8NU+veCLcRszlLxlnC/jDWGzuHLmVrgurBQ0e/neZX+X0KTIQSNeZkC/79IFfHJMTwdmTyOE7MmQ40AB/ADy6lqF8qm03+BACHQiig1BnJBQoa4jrR8ZqSHwwPW2K//5WNYsBDOpKpdDp+WJGLcBEGcs30tdyXr8whgeuQF/UNo3hAL5njL9nBjh6oTwHRGyhr07iuyHzKEGUaamGHU04DAj+xMl1im15WTjTc9LsxDQoluIePUdGA2aHJGDpMKyxctVzLwGYUcQBQiFSNn1Mzrn7e2HZ58LTSGYsCL4FUdlcdV0BmTZd5pz0QZhBEO8X6II3VsddKnH2dR8v0swQH0qH1g5VBolXoIjbvdA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(52536014)(336012)(5660300002)(186003)(7696005)(55016002)(8676002)(70586007)(6506007)(70206006)(47076005)(82310400003)(8936002)(9686003)(53546011)(81166007)(508600001)(110136005)(83380400001)(4326008)(356005)(2906002)(36860700001)(316002)(86362001)(26005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 05:54:17.4446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3799174b-f51e-42ff-9a44-08d9a5a0dd49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7068

Hi Elliott,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Elliott Mitchell
> Sent: Friday, November 12, 2021 12:28 PM
> To: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen=
.org>
> Cc: xen-devel@lists.xenproject.org
> Subject: ACPI/UEFI support for Xen/ARM status?
>=20
> I've been busy with another part of this project, so I've lost track of
> progress on ACPI/UEFI support on ARM.
>=20
> Last I'd read full support for ACPI/UEFI seemed a ways off.  Using a stub
> domain to constrain ACPI table parsing seemed the favored approach.  I
> was under the impression that would take some time.
>=20
> What is the status?  Do the Xen/ARM leads have any guesses for when full
> ACPI/UEFI support might reach completion?

I am doing some development based on the Xen UEFI/ACPI on AArch64 using
the Arm FVP_Base platform. Using edk2 and master branch of Xen with
`CONFIG_ACPI=3Dy`, it seems everything can work properly.

Here are some of my logs:
Shell> FS2:EFI\XEN\xen.efi
Xen 4.16-rc (c/s Fri Nov 12 02:34:01 2021 +0000 git:323b47ffd9-dirty) EFI l=
oader
...
(XEN) PFN compression on bits 20...22
(XEN) ACPI: RSDP F5E30018, 0024 (r2 LINARO)
(XEN) ACPI: XSDT F5E3FE98, 005C (r1 LINARO RTSMVEV8        2       1000013)
(XEN) ACPI: FACP F5E3FA98, 0114 (r6 LINARO RTSMVEV8        2 LNRO        2)
(XEN) ACPI: DSDT F5E3ED98, 02AB (r2 LINARO RTSMVEV8        4 INTL 20200925)
(XEN) ACPI: GTDT F5E3FC18, 00E0 (r2 LINARO RTSMVEV8        2 LNRO        2)
(XEN) ACPI: APIC F5E3E998, 02D4 (r4 LINARO RTSMVEV8        2 LNRO        2)
(XEN) ACPI: SPCR F5E3FF98, 0050 (r2 LINARO RTSMVEV8        2 LNRO        2)
(XEN) Domain heap initialised
(XEN) Booting using ACPI
...
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd0f0]
[    0.000000] Linux version 5.14.0-rc1+ (henry@xxxx) (gcc (Ubuntu 9.3.0-17=
ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #19 SMP Wed Oc=
t 13 05:18:13 EDT 2021
[    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
[    0.000000] efi: EFI v2.50 by Xen
[    0.000000] efi: ACPI 2.0=3D0xf56f02a0
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000F56F02A0 000024 (v02 LINARO)
[    0.000000] ACPI: XSDT 0x00000000F56F0238 000064 (v01 LINARO RTSMVEV8 00=
000002      01000013)
[    0.000000] ACPI: FACP 0x00000000F56F0000 000114 (v06 LINARO RTSMVEV8 00=
000002 LNRO 00000002)
[    0.000000] ACPI: DSDT 0x00000000F5E3ED98 0002AB (v02 LINARO RTSMVEV8 00=
000004 INTL 20200925)
[    0.000000] ACPI: GTDT 0x00000000F5E3FC18 0000E0 (v02 LINARO RTSMVEV8 00=
000002 LNRO 00000002)
[    0.000000] ACPI: APIC 0x00000000F56F0118 0000F4 (v04 LINARO RTSMVEV8 00=
000002 LNRO 00000002)
[    0.000000] ACPI: SPCR 0x00000000F5E3FF98 000050 (v02 LINARO RTSMVEV8 00=
000002 LNRO 00000002)
[    0.000000] ACPI: SPCR: console: pl011,mmio32,0x1c090000,115200
...

Hopefully this answers your question. :)

>=20
> I noticed Linux made full ACPI/UEFI support mandatory for ARM64 before
> 3.19, so Xen's seems far behind the curve here.
>=20
> While incidents of garbled ACPI tables are notorious, those are notable
> due to being rare.  Whereas I've had terrible luck with device-trees.
> The instances of any given OS *not* breaking device-trees with even
> patch-level changes are rare.
>=20
>=20
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0
> 8714\_|_/___/5445
>=20
>=20

Kind regards,

Henry


