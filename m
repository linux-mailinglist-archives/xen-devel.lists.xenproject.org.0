Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981D62EBD0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 03:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445409.700564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovqxz-0006Rf-1a; Fri, 18 Nov 2022 02:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445409.700564; Fri, 18 Nov 2022 02:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovqxy-0006Po-UI; Fri, 18 Nov 2022 02:18:54 +0000
Received: by outflank-mailman (input) for mailman id 445409;
 Fri, 18 Nov 2022 02:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb94=3S=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1ovqxx-0006Pi-Pg
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 02:18:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe02::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5775aed0-66e7-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 03:18:51 +0100 (CET)
Received: from AS9PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:20b:465::32)
 by DB9PR08MB9755.eurprd08.prod.outlook.com (2603:10a6:10:460::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Fri, 18 Nov
 2022 02:18:45 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::23) by AS9PR06CA0117.outlook.office365.com
 (2603:10a6:20b:465::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 02:18:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 02:18:44 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 18 Nov 2022 02:18:44 +0000
Received: from 2ae82c93cf3e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 877ACF9B-A579-45AD-95BC-9E20087563DE.1; 
 Fri, 18 Nov 2022 02:18:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ae82c93cf3e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 02:18:34 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AS2PR08MB8384.eurprd08.prod.outlook.com (2603:10a6:20b:55b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Fri, 18 Nov
 2022 02:18:32 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5834.006; Fri, 18 Nov 2022
 02:18:32 +0000
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
X-Inumbo-ID: 5775aed0-66e7-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKNsZd81dK3Efc+eP7a7vE9dsG/vOzNlEbgxtLeZgU=;
 b=AQlHsj71kz0EB1BHrhwIE9uiW1T1ccfRXKWLYgb/RwQIzo4rMN69sK8giwX4oFAuKcEsWpKsKkdpPcdhZLEt8zAUR+suX7Hxc+bECwYwKcxRWhV08pp1N1OwHl0ELFRA0aptMmiI/8jPG40bseSowwNvi0Tnko3Ynvh4vGWFL+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBAELTvCjT3tWE1UAD7hXF9vlTh44Pd7G7KmYirS5HienXlCmKEfcA1HSxZo6mEvYmCdaHS9zlkPZkcg/wTftygq21tMknMZmnrgwbixCCgXVchfAMu0YLsOIb5W33e0Zkb3AP2MlPQozyPMeg/V7nlKUKgnCaiZXUen83YmQd9XA7WuNuwQDvBH4Zr5ydzOTss6rUgqWayN03PZz/QHK86fNsO8lgCdkbIb+X5MUTUZoeyZyV0CBzUMwGj6PqF4hyte2SNKS5Bbqx0aKaRB3fadrYT0S4miAG8Q8EGXObPq9pZhjKrPfNjNfJv7cyGYmh0TMHMX7S/Y2dBauEk6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeKNsZd81dK3Efc+eP7a7vE9dsG/vOzNlEbgxtLeZgU=;
 b=VtwmfWOiiq26dAy00JpEpb+Do4n47x8OvqEvmfcFgbVvPG8C2q0VtWmuI2wyimoZ939Q1gl0J6YlOxBAX+ppIeGzzjOz4AqjNmnVeqtYf4uNinj0PyP5h1bN3D6LNUOL8p+ICGR6KZ8i/bjGRUYSds7qRkGFRNBJJyfwuS3kX0MnMLWpKtFTD9zcWjyKZG4FSg/DA4o4+D8mif/xYSmaZVbv0JivNm6Xen1pSqD5ljawJKM+zMQ4Hl9eiu4Fby66kcz5N5uqK96olPwxqFIBJkiJ08jQY57IqfSRgMZKmbVvoNSVd2phYpJ/DZGqjtZa5QMZH7NyO6JLGhmVJu2j0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKNsZd81dK3Efc+eP7a7vE9dsG/vOzNlEbgxtLeZgU=;
 b=AQlHsj71kz0EB1BHrhwIE9uiW1T1ccfRXKWLYgb/RwQIzo4rMN69sK8giwX4oFAuKcEsWpKsKkdpPcdhZLEt8zAUR+suX7Hxc+bECwYwKcxRWhV08pp1N1OwHl0ELFRA0aptMmiI/8jPG40bseSowwNvi0Tnko3Ynvh4vGWFL+Q=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Topic: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Index: AQHY+vGVwMcRKiwWvE6rnRakCwDYs65D8jVg
Date: Fri, 18 Nov 2022 02:18:31 +0000
Message-ID:
 <AS8PR08MB76963BD3ED96EE6F5314B70992099@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20221118020013.125987-1-jiamei.xie@arm.com>
In-Reply-To: <20221118020013.125987-1-jiamei.xie@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 31FE5BE7F1144C4DBB2007BD0320A0FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|AS2PR08MB8384:EE_|AM7EUR03FT041:EE_|DB9PR08MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: f41cf04d-dd1f-43f0-10eb-08dac90b381d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DQT1MDDURIvulH3adK18cF6atKsVIku6PCuEDyIQyvSfqAr22MszPhUtiTF67dee49zT7lLSRnv8PlVDmmJGYDQirXoZyRT3pY1XfJ2MCH4cwd+ccSLW5R9zvsb/A8MZsqq+LPY8yxJeFEBLy6+E6wB7ZbTbQnw2+LYAaRTGicUCjbuNXcZ2i22/Zu8njpiFo0ffUxpxR5zbFv43yyauS9RznUCkbrRPamceVL3jXt3ZltMuPOfGBDKi2SFJYVgvyNrelZfn5OuUUxnwilY4skiNUcWUd68ozOtnrO54YfXq2ukHx4eRaqn2kbTySDli0V2tZmn1/LndN214X1b1oOelEsEMSL21ZPCrE8kVBnqIoI5DjU6GrSyfhcrD38M+nSupqtKr2/lhlmJ1983ccf9J0S+6gLfxTh4BWABQM22rz6130o7PiOQDaKARCzD5qUg/tdMBKbdaymFXoTeQgUoLoE6st9BokFwf5V2AhY0Ardy74Y+8pSZC7YFD6mHB6k4PnDyDd39dwCh9EfHcH1DT8vBEMG9dDc64izwatCx0PdhAYuIfD+Hm9/CCvJ0mHu0FTWfVl5l49m+/SRaEAHBWbdNX3AxkgFvX+gJpWELzuwE+2oeCeEqgyxth0agqcuSQkL1+FZ398YdaF7/ZSaBhwzVV2lxHwoHhJQ7x9EzrWvz956HxVPxNaIa/Yaq1SiadCAx/Iu4i1+3Xe3ddSoCEoBNLGkZDSXnPvfHDhbEg3T3Vwcc+DSUZqDZHCrcNeanG1tRRm0aTHuoe7WEfqA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(7696005)(9686003)(478600001)(26005)(53546011)(6506007)(71200400001)(66476007)(66556008)(110136005)(66446008)(186003)(54906003)(41300700001)(76116006)(66946007)(64756008)(4326008)(8676002)(316002)(83380400001)(966005)(33656002)(5660300002)(8936002)(38100700002)(55016003)(52536014)(2906002)(86362001)(122000001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da068da2-9724-45e3-fbdf-08dac90b3068
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j5IAgqr9zmxjj3kN3i8cTuJn9fwvDY/NBj3bP7DPs2CinlteznxM1KxO35ljsfWxnp3ubH06gD4HhXdksZOWaMAxmY1A7d066a7dGqESA0BDa/QNnJpKJTvBzGlvVTcBojZ+bC+uncbKYL4uU2v+LseoeBoWomm2PRfDGSjMahL6OxGtgZVr1h+AeD7D9jPPSAtmbU/K96nHKjS2+gUVmOfTGRLm1DDnYh/C9ZXkjFe0UTTSpmgjp8pMu9wCV+lY8k6JA78rMfvo2sRywxZ+TAA3jwJfoZdAYjrVC0zggs9BK2JjIQXE8nN7ouBc4q3hS82mwdz7tSfjrb6ZuXrZ6CYXjMovspdBPApY0X2qA430IfyFuzBcGhFttgdlBT7P4sr5KdlI9YQPOZ+AXWf417VUgDstAmlX0M60uecxA98qtQ/oFBfJQMkcjsBzTfdmeJr+QhGBw0gS2ya9S2c1PbniXIE9Mrkb5ajWt8Ia0LUhrDMWv8QuLDiEC0H02fcumnJ23RAQeKh09H60rGgw2OWq/USR+EMvFNRd1lHDSapdRN2+HG47fuKXybbY/sMtUDiEM/DgpCM542viy9AzhEAVZba3wMGnNrDdldkrN2KXdTYv7UNidbpujg8ElsbslGimS6WWcRaP6Emeg+d0w9jqcqye0qwUrvSX0XLY1S0zx8zEs/e4sseLqk49SkvDuaRXHtF/06++xhuYPJijEMHgGj1g/9/M7GoCcR0eoQOcB4eYbkluiNNmNDlJxxODz1uD+ylTnUljMXO1NSxXUA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(82310400005)(41300700001)(356005)(4326008)(70586007)(8676002)(52536014)(36860700001)(83380400001)(40480700001)(8936002)(316002)(7696005)(6506007)(478600001)(9686003)(86362001)(33656002)(966005)(26005)(54906003)(47076005)(55016003)(186003)(2906002)(336012)(5660300002)(70206006)(82740400003)(53546011)(40460700003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 02:18:44.8973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41cf04d-dd1f-43f0-10eb-08dac90b381d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9755

Hi=20

Sorry there is no subject in the  last email. So add in this one.

Best wishes
Jiamei Xie

> -----Original Message-----
> From: Jiamei Xie <jiamei.xie@arm.com>
> Sent: Friday, November 18, 2022 10:00 AM
> To: xen-devel@lists.xenproject.org
> Cc: Jiamei Xie <Jiamei.Xie@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Wei Chen <Wei.Chen@arm.com>
> Subject:
>=20
> Date: Thu, 17 Nov 2022 11:07:12 +0800
> Subject: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
>=20
> When the guest kernel enables DMA engine with
> "CONFIG_DMA_ENGINE=3Dy",
> Linux SBSA PL011 driver will access PL011 DMACR register in some
> functions. As chapter "B Generic UART" in "ARM Server Base System
> Architecture"[1] documentation describes, SBSA UART doesn't support
> DMA. In current code, when the kernel tries to access DMACR register,
> Xen will inject a data abort:
> Unhandled fault at 0xffffffc00944d048
> Mem abort info:
>   ESR =3D 0x96000000
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x00: ttbr address size fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000000
>   CM =3D 0, WnR =3D 0
> swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000020e2e000
> [ffffffc00944d048] pgd=3D100000003ffff803, p4d=3D100000003ffff803,
> pud=3D100000003ffff803, pmd=3D100000003fffa803, pte=3D006800009c090f13
> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> ...
> Call trace:
>  pl011_stop_rx+0x70/0x80
>  tty_port_shutdown+0x7c/0xb4
>  tty_port_close+0x60/0xcc
>  uart_close+0x34/0x8c
>  tty_release+0x144/0x4c0
>  __fput+0x78/0x220
>  ____fput+0x1c/0x30
>  task_work_run+0x88/0xc0
>  do_notify_resume+0x8d0/0x123c
>  el0_svc+0xa8/0xc0
>  el0t_64_sync_handler+0xa4/0x130
>  el0t_64_sync+0x1a0/0x1a4
> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
> ---[ end trace 83dd93df15c3216f ]---
> note: bootlogd[132] exited with preempt_count 1
> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
>=20
> As discussed in [2], this commit makes the access to DMACR register
> write-ignore as an improvement.
>=20
> [1] https://developer.arm.com/documentation/den0094/c/?lang=3Den
> [2] https://lore.kernel.org/xen-
> devel/alpine.DEB.2.22.394.2211161552420.4020@ubuntu-linux-20-04-
> desktop/
>=20
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> ---
>  xen/arch/arm/vpl011.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 43522d48fd..80d00b3052 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -463,6 +463,7 @@ static int vpl011_mmio_write(struct vcpu *v,
>      case FR:
>      case RIS:
>      case MIS:
> +    case DMACR:
>          goto write_ignore;
>=20
>      case IMSC:
> --
> 2.25.1


