Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8D7918CC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595220.928710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9oJ-0007ls-3y; Mon, 04 Sep 2023 13:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595220.928710; Mon, 04 Sep 2023 13:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9oJ-0007iY-1G; Mon, 04 Sep 2023 13:40:11 +0000
Received: by outflank-mailman (input) for mailman id 595220;
 Mon, 04 Sep 2023 13:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qd9oH-0007iS-TL
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:40:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9020ef04-4b28-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 15:40:08 +0200 (CEST)
Received: from FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::10)
 by GV2PR08MB8390.eurprd08.prod.outlook.com (2603:10a6:150:bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 4 Sep
 2023 13:39:49 +0000
Received: from VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::65) by FR3P281CA0101.outlook.office365.com
 (2603:10a6:d10:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.22 via Frontend
 Transport; Mon, 4 Sep 2023 13:39:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT029.mail.protection.outlook.com (100.127.145.13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 13:39:48 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 04 Sep 2023 13:39:48 +0000
Received: from c064c3e157dc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B87F3D9A-FE3B-49A3-94E3-1A2D874570F6.1; 
 Mon, 04 Sep 2023 13:39:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c064c3e157dc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 13:39:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5462.eurprd08.prod.outlook.com (2603:10a6:20b:10b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Mon, 4 Sep
 2023 13:39:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:39:39 +0000
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
X-Inumbo-ID: 9020ef04-4b28-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh4G701vKNPM5YJc/HMCS0mu9oIEKMaQDLAyDa8JDUE=;
 b=8lkqqBOqB+JGQhAHV4Fpd6TPyC3n7nZQv1wIlFUNI44jPaAK9gkCXjxWoK/uWJgEaMCRzoXfyfyEn2tL3tSTSzTNnjLrs2Hwk7l0MjoMvrcAkqsXOR33SGDaGFzm+fXmspCm1i1I8BvurjZVacuxCux3qR0qTPB/q904D0WcH3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd55241b72d1f1af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsNItzIzZuWTfepQH2oQJqYYjExTZnz366bS1MxJOq4tHCl3OeOXT/S8Cbzhf0A3Ii3TpxbxJBKwR6LzeMID1YAvQvbKd+8NsaMq9y0+trbZLutDARc2WoglnJ46pOzEeDQ7ZZihHf2RCFK/rDljYFdsyCiYf7lqPur6Ddcw/slfx+l2z7CiyhxnR/PR1bTXBQQypbpMKB5Ghi6sK9w1qGGd/HglbPN7lEvfHSzuhIM1V8bI3/JUVbnecG+kJRSuqAOtfjxZwGz3JTtfshFkWSR3cNKHluYYKgy9asK5rkEIxRyMEzUSIBBC5hbbNRVaivyp330UQnxdJmeS3JUnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh4G701vKNPM5YJc/HMCS0mu9oIEKMaQDLAyDa8JDUE=;
 b=DVMKsae7Ujgm1+S7oPOEkL21CbAc0evI6fKJrtEycFMt7ZQ3ZtnOHBj30QgRq/Xffei8nIG8Mv9dGmGuZzufCQgvqqBextWwVmQguVVCvtufSb/HjfU8ULowj3pszCaEHXdLhbscsjQ1YwTGLs7PIXfXutGkJqgn2CzyW3Vcp6WoMUuJqDKbCfdEqU0siqoM3S7PKHKpCBRonVyuDfLDY4X3XASaYytIXNHAXIDZPQGK5csZAyIreydeFFD0x3g1NPoKve9q8Vr3oFxaEDy3KrFRMvD3NL+9K+HGKlMtlAcBPz4RHKnIbf2ER8NVM34u/lrPfjh+Stz2VTJhgMKI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dh4G701vKNPM5YJc/HMCS0mu9oIEKMaQDLAyDa8JDUE=;
 b=8lkqqBOqB+JGQhAHV4Fpd6TPyC3n7nZQv1wIlFUNI44jPaAK9gkCXjxWoK/uWJgEaMCRzoXfyfyEn2tL3tSTSzTNnjLrs2Hwk7l0MjoMvrcAkqsXOR33SGDaGFzm+fXmspCm1i1I8BvurjZVacuxCux3qR0qTPB/q904D0WcH3U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Thread-Topic: [PATCH v4 1/2] xen: asm-generic support
Thread-Index: AQHZ3O2/QR3JeW3CfU20DuxQPAN2rLAKsJgA
Date: Mon, 4 Sep 2023 13:39:39 +0000
Message-ID: <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM7PR08MB5462:EE_|VI1EUR03FT029:EE_|GV2PR08MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d8f41c-ea23-4b72-af95-08dbad4c688c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NeQntxKGBM1txKSAMbA8ceU7bQDtMQCOsPONxRkLJu5caIINzGB/6libtUBOuEZoK/zEDWUiopXhIIz4coXHkpB6Vr4DICUV7MEkxA1Myb9Hws3JaqlPzbOkd1efumf2GYv2Qo5M3Bjq/kyeqJACUK1jIaHPbuHC2S2zMqa9I5pci+whmwPz1AA47OT8H98B/plLtwzNiKnUUe15WCf72/4CQTWLXJYhl/5adUpJsbpNHrsQoAqeMcepiGizw4vmn41H7igIddD1LKCCXKtB5J20x56eB1nUpybx6TRuv+Qwry0oWG+lFjOKU2iDhrf1yIeYEfm2RwsDsZ88enNeR4KiW/ZSiHMRaMrmN4xHaymcauhBufTlH//lpSAuKhGqgDpwdJJrr57F2RPQezbs3nwGow1fVbuMuPQ4cKEB19IkNJfNXv58zFpTyt+sJAN5b7ZCrCOILVSmpFEae/4cRX1ZvCMGjKcR27XuVVc+mYWx97f0P+Awr3B6jzENwT14yBjlU+zD5MC4uqHzbZKudhW57Y2ljE5S0JvaW6PSJsZr/UpAb8UDXmhpjxVGAAo0FXo2cTmMsMvIZUck5ieNiYM+mkDYwSItrEwTSoRF8fKYBJy0yEtVG2uRELCIMJWmzix7cDChEAKUuBatjngCRFwHYcZ3MhjTQBSgFM5noyE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(39850400004)(136003)(451199024)(1800799009)(186009)(38100700002)(122000001)(38070700005)(7416002)(41300700001)(33656002)(5660300002)(36756003)(86362001)(83380400001)(66556008)(76116006)(66446008)(64756008)(66946007)(71200400001)(26005)(66476007)(478600001)(2616005)(91956017)(8676002)(4326008)(8936002)(6916009)(316002)(6512007)(54906003)(6506007)(6486002)(2906002)(53546011)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5339EE7A4EBF254999820F90AD0BB9A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c743d45-bd4a-4a76-f305-08dbad4c6358
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1XTh9VmtV01c4Vu4hSDCZZS3UuS5Tw6/O+895ZcJkhnxpK66Qp0tn7IOf8QABxFJ5rNiCPIlnM/fPPKfSMSPZhtCwYowVKh21PBBREDSLdgRly/alpMIttgJwZVxKl14bZVmnD7tBoKzqOmcN5x8oUccxVf/Icnp+pbfiH4EwelZx7BRRexOdqWuogmNusqmmyKPC5b00Uh3H4fPOXYSDey+IRib+XXCnpBf3VJq7xn9d/eCZeNfbXTEz3moONoI5EyEnovwb2NEFGSoTHA04w7QlHfMWFyYrWPmquCQaPGvFYxnAY7UWtFgXP0ueOAZq/QoPHZ6+ORfRAL8nMp6jGgzONnCo0+DjpqiBIajQd1pXB7Wr2SYNAWxzv4QzG2U7eQ8ea9BnFDxt8apRCctIIFny68rOTH6tRVKLWwEFwLfxOVIg4KpYIY+o5e5NncgFQQhoUpBcAaoVwliLm8KYGLwuFRMu7xPcsrP4VqVWuPIb06qDbkjK49Rsue0P7maOWrNYX7Z96Z8vr5JzAPfoNQOOHJiUQKeLoBW64U7ry6hneMLLVTD2SAO2eLL5+nWU8Zg+H9zVTx566GBdqiU163WPPaO7uE/62FeaS95cS5e20dM59CH1R5isY1pSh6Lx0xTC++Ln6mcq1KuIeIzrhGismfmRr3/gtm6iEI5K8Ueo3FCP3z/AOjtgnqodDINsbCJ8ZGxbc78AEpSmV6JTk+d2+yft8S7FRsA//S5mTaU4MY5PMfPCbaG9MmaBhjutQvJ0y9MXGdfeJAcd3LB0w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(81166007)(356005)(82740400003)(8936002)(70206006)(478600001)(53546011)(6506007)(54906003)(70586007)(6486002)(316002)(6512007)(26005)(41300700001)(86362001)(40460700003)(8676002)(5660300002)(2616005)(2906002)(107886003)(36756003)(83380400001)(36860700001)(40480700001)(33656002)(6862004)(47076005)(336012)(4326008)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:39:48.4196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d8f41c-ea23-4b72-af95-08dbad4c688c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8390

Hi Oleksii,

> On 1 Sep 2023, at 18:02, Oleksii Kurochko <oleksii.kurochko@gmail.com> wr=
ote:
>=20
> Some headers are shared between individual architectures or are empty.
> To avoid duplication of these headers, asm-generic is introduced.
>=20
> With the following patch, an architecture uses generic headers
> mentioned in the file arch/$(ARCH)/include/asm/Kbuild.

Kbuild refers to "Kernel build" I guess.
I am ok to keep that name to keep things simpler when compared to
Linux scripts but it would be good to mention that in the commit
message for future reference.=20

>=20
> To use a generic header is needed to add to
> arch/$(ARCH)/include/asm/Kbuild :
>        generic-y +=3D <name-of-header-file.h>
>=20
> For each mentioned header in arch/$(ARCH)/include/asm/Kbuild,
> kbuild will generate the necessary wrapper in
> arch/$(ARCH)/include/generated/asm.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
> - introduce asm-generic support
> - update commit message
> ---
> Changes in V3:
> - Rename stubs dir to asm-generic
> ---
> Changes in V2:
> - Nothing changed.
> ---
> xen/Makefile                      | 10 +++++++++-
> xen/arch/arm/include/asm/Kbuild   |  1 +
> xen/arch/ppc/include/asm/Kbuild   |  1 +
> xen/arch/riscv/include/asm/Kbuild |  1 +
> xen/arch/x86/include/asm/Kbuild   |  1 +
> xen/scripts/Makefile.asm-generic  | 23 +++++++++++++++++++++++
> 6 files changed, 36 insertions(+), 1 deletion(-)
> create mode 100644 xen/arch/arm/include/asm/Kbuild
> create mode 100644 xen/arch/ppc/include/asm/Kbuild
> create mode 100644 xen/arch/riscv/include/asm/Kbuild
> create mode 100644 xen/arch/x86/include/asm/Kbuild
> create mode 100644 xen/scripts/Makefile.asm-generic
>=20
> diff --git a/xen/Makefile b/xen/Makefile
> index f57e5a596c..698d6ddeb8 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
> endif
> CFLAGS +=3D -I$(srctree)/include
> CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include
> +CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include/generated

Why are we generating files in the source tree ?=20
Shouldn't we keep it unmodified ?

>=20
> # Note that link order matters!
> ALL_OBJS-y                :=3D common/built_in.o
> @@ -580,6 +581,7 @@ _clean:
> rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf $(TARGET).efi.str=
ipped
> rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> rm -f .banner .allconfig.tmp include/xen/compile.h
> + rm -rf arch/*/include/generated
>=20

You must use the same as for CFLAGS here so $(srctree) would be needed.
(or something else depending on the fix for previous comment)

> .PHONY: _distclean
> _distclean: clean
> @@ -589,7 +591,7 @@ $(TARGET).gz: $(TARGET)
> gzip -n -f -9 < $< > $@.new
> mv $@.new $@
>=20
> -$(TARGET): outputmakefile FORCE
> +$(TARGET): outputmakefile asm-generic FORCE
> $(Q)$(MAKE) $(build)=3Dtools
> $(Q)$(MAKE) $(build)=3D. include/xen/compile.h
> $(Q)$(MAKE) $(build)=3Dinclude all
> @@ -667,6 +669,12 @@ endif # need-sub-make
> PHONY +=3D FORCE
> FORCE:
>=20
> +# Support for using generic headers in asm-generic
> +PHONY +=3D asm-generic
> +asm-generic:
> + $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
> +            obj=3Darch/$(SRCARCH)/include/generated/asm
> +
> # Declare the contents of the PHONY variable as phony.  We keep that
> # information in a variable so we can use it in if_changed and friends.
> .PHONY: $(PHONY)
> diff --git a/xen/arch/arm/include/asm/Kbuild b/xen/arch/arm/include/asm/K=
build
> new file mode 100644
> index 0000000000..a4e40e534e
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/xen/arch/ppc/include/asm/Kbuild b/xen/arch/ppc/include/asm/K=
build
> new file mode 100644
> index 0000000000..a4e40e534e
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/xen/arch/riscv/include/asm/Kbuild b/xen/arch/riscv/include/a=
sm/Kbuild
> new file mode 100644
> index 0000000000..a4e40e534e
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/xen/arch/x86/include/asm/Kbuild b/xen/arch/x86/include/asm/K=
build
> new file mode 100644
> index 0000000000..a4e40e534e
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-=
generic
> new file mode 100644
> index 0000000000..0aac3f50b8
> --- /dev/null
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# include/asm-generic contains a lot of files that are used
> +# verbatim by several architectures.
> +#
> +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
> +# and for each file listed in this file with generic-y creates
> +# a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/asm)
> +
> +kbuild-file :=3D $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> +include $(kbuild-file)
> +
> +include scripts/Kbuild.include
> +
> +# Create output directory if not already present
> +_dummy :=3D $(shell [ -d $(obj) ] || mkdir -p $(obj))
> +
> +quiet_cmd_wrap =3D WRAP    $@
> +cmd_wrap =3D echo "\#include <asm-generic/$*.h>" >$@
> +
> +all: $(patsubst %, $(obj)/%, $(generic-y))
> +
> +$(obj)/%.h:
> + $(call cmd,wrap)

In fact i think your files are not generated in the srctree so this
will break if you use out of tree compilation.

Cheers
Bertrand

> --=20
> 2.41.0
>=20


