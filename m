Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E0919EBF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 07:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749263.1157930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMhmO-0005ph-Lu; Thu, 27 Jun 2024 05:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749263.1157930; Thu, 27 Jun 2024 05:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMhmO-0005nP-Ii; Thu, 27 Jun 2024 05:34:44 +0000
Received: by outflank-mailman (input) for mailman id 749263;
 Wed, 26 Jun 2024 16:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NZk=N4=rt-rk.com=Milan.Djokic@srs-se1.protection.inumbo.net>)
 id 1sMVKn-0002m5-8a
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:17:26 +0000
Received: from mx08-0061a602.pphosted.com (mx08-0061a602.pphosted.com
 [205.220.185.213]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90c6ff4e-33d7-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 18:17:21 +0200 (CEST)
Received: from pps.filterd (m0278994.ppops.net [127.0.0.1])
 by mx07-0061a602.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QG07Xa008532;
 Wed, 26 Jun 2024 16:16:54 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx07-0061a602.pphosted.com (PPS) with ESMTPS id 3ywktvva5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 16:16:52 +0000 (GMT)
Received: from DU5PR08MB10397.eurprd08.prod.outlook.com (2603:10a6:10:524::10)
 by PAVPR08MB8990.eurprd08.prod.outlook.com (2603:10a6:102:326::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 16:16:49 +0000
Received: from DU5PR08MB10397.eurprd08.prod.outlook.com
 ([fe80::9791:8914:1ef3:c828]) by DU5PR08MB10397.eurprd08.prod.outlook.com
 ([fe80::9791:8914:1ef3:c828%6]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:16:48 +0000
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
X-Inumbo-ID: 90c6ff4e-33d7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rt-rk.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2021; bh=NXygv6F3wdlxaKwqjrGFQGEMMJu1
	F+YqhWRKx9A062U=; b=ZJLgkzbXPYYTzAXytjmaQMH8pe+4AC58u8g9ltpgOELv
	NfeKLnN6FOAZbwaNn5E5vIaNPFecYWIprOdXuGLR11S78IZbk4EHa6H6QqFMmqpz
	QFBf2eS97NPnpayh5a77Iet/D4A0z5X4S3Eq5Sx3VbJoKTD750txB9dAekEVKF1J
	VZDKIC4lN16UVfi+wLYHVEH5baMOqMnOHTDT9ttTxIosIO+BNKdyuqeFxw4cspdN
	ZjuccIdPDBECWSJurEFj4VNRCb62knEqaCVkv+NUDNOkkmRsPz6ajs3D7hzTISnE
	WlDC8wtKc5ygxFDd1WkHNDd3xIMiRpSbYnsDtm2Z3g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjJ0KZZrFytl9y+pwvUPh0ibbU3Ax/6pIwgSqKL2zh8USw5+aDmpOwrmjMTAV9b5XlDNHjGSMjNCwaV2shpvUhnf3AMHqxcOxLOtcWK8wQdsn3HQfwUyzL3lkK9l9OgZiHE6t4dA/7sJE1n65i0ON2uX05riceVgt4uABHkOUr4aQT+hozSb5Tsjf0ZCW9tPME46a1DwXHOPj6OHP5PxsUXeagewq7vOTBjMgE366AVJGNJX5ce5kuniSsGdDHlc+ql89j+y+hzL/9OvxofrQnClnHf8zkBIs69w/7q+D5SQeQ0PZqbje7IQY/JwUzj7gKAOArHb7hcSYsF0+ePQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL2M1bwGnA85rQIRcaldIAN1N4W3MY2N8Uol4uBWXnw=;
 b=gxrhKqn8/KKJ0pZeNAizfvjddZGXLRlI3pW+7ycKaxrNWg/056095jyFjER/GWmEhQDz0qKdJ1Ez/zv2AlSVv69Tpt3IxzcqFUHBSgzBmimp5JJhgyt5KjduSKsU+NWXHAeYoVG//Dpytbg+gechHXClVHklG7raMpsdTiMMbU+ZmjyB9DJVZaiGdK0PeI3A2RhXNnsDiLr9zrYieN9emI0yetMb/pt2iVOoL2rlgrQ5w6s7+ezBcwHdnGHG8YFJBo5+VmBElH2sV+3vMIMHP6GSBunTQL0z4kDbJnKJPnhZR6weLnhGLz4679yQucf2UrHIEYn31QeQzdg+UG1TZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rt-rk.com; dmarc=pass action=none header.from=rt-rk.com;
 dkim=pass header.d=rt-rk.com; arc=none
From: Milan Djokic <Milan.Djokic@rt-rk.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "milandjokic1995@gmail.com" <milandjokic1995@gmail.com>,
        Nikola Jelic
	<nikola.jelic@rt-rk.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Bob
 Eshleman <bobbyeshleman@gmail.com>,
        Connor Davis <connojdavis@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
Thread-Topic: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
Thread-Index: AQHat2kkFA7Fx2uRgEClS8RhG5ht9LHEFa6AgAGeooCAAAKgVA==
Date: Wed, 26 Jun 2024 16:16:48 +0000
Message-ID: 
 <DU5PR08MB103973ABF5E6F12853F5D24E1CEC12@DU5PR08MB10397.eurprd08.prod.outlook.com>
References: 
 <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
 <0e10ee9c215269b577321ba44f5d038a5eb299a7.1718193326.git.milan.djokic@rt-rk.com>
 <8112bee8-efdc-4db9-b0d4-58b160b4e923@suse.com>
In-Reply-To: <8112bee8-efdc-4db9-b0d4-58b160b4e923@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR08MB10397:EE_|PAVPR08MB8990:EE_
x-ms-office365-filtering-correlation-id: a4344ee2-1eec-4acf-9cf9-08dc95fb61ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230038|7416012|376012|1800799022|366014|38070700016;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?JzvPlB1dMH6UgdMJSqeU7carQb9162t9p/CI4HeRKXV4SGrpl7oImQGrxp?=
 =?iso-8859-1?Q?PyxQkPwg5tn71OaKUGRN/jhuz1QWv00ulVIpDuEyEH2iv/2DDvws6oD+Kv?=
 =?iso-8859-1?Q?QnNaTx1eqdHyAlHQ847kEz+FXb7u+unk+A56W+L+xOe4PmDzgGpBPDOUB2?=
 =?iso-8859-1?Q?w2HWOaR5GUKkQrwKI19JnADbmf/PPGGo2Cr7IWiiMcDsxdb4p6fsMQ71d5?=
 =?iso-8859-1?Q?NMVtGbuOUcqEOgcYHH8DOVHDuvGkC7V2r0wBCRhsjBHOZBY57eHuCS+ekw?=
 =?iso-8859-1?Q?+nkdXDXRV30uHVCjOu4ZVvRJk7DqDtWrJfZoPuGehWC/IVvMskBru64qFg?=
 =?iso-8859-1?Q?xuyufG48wttXZcqN3XjArH3OBr7qECuyxq4Q/Fx1KCtDwSIkCnKCJ0lT8A?=
 =?iso-8859-1?Q?7lKbFVlvywettILdAULnLAJXtef7EQwgnOvHzBV36jvAhf0lNaa0MTaiAM?=
 =?iso-8859-1?Q?+UY65MrfjLmyP+x0D0yBBUxGJxOhEJlAEOzAJJtTAb7po0W8PTMQgd4/RC?=
 =?iso-8859-1?Q?E8nJb8gtuhz3aACo/IlCi6tmyK9of5kPfD2VI7XX+vjFaCuOjxeC9vbMU7?=
 =?iso-8859-1?Q?H3vyRVX3OExg7MeC4Vl4CCqUwS7SO3shwrewfOfM3tBA2XIrvPMvCtbEgE?=
 =?iso-8859-1?Q?kUuT9RioelgWPpHUjBxHKboheNTvJEk2brWrVqp5yJkEHe7zXDRQn4QMeD?=
 =?iso-8859-1?Q?09o6/In3K1lkNKNRsuNTWSbUatRJm3HtJspPD9kah6scKaB4v8TgKwMYky?=
 =?iso-8859-1?Q?NrGUh1zImBTzt2oS2bV4+mfcYsQQXHY/SK9FiZXsAZGcynC0iPRuzIcWDV?=
 =?iso-8859-1?Q?B9smhXMFvkYgCwjZbXfRU1IO3cyaAsOQAyyivHTK/FpL+7YWsk5mEeaB+z?=
 =?iso-8859-1?Q?mTZXlcpKSaS8qujMKexvNk1+p7XWG7Apvfc1se51tU5PzmOQV0R5AcirL1?=
 =?iso-8859-1?Q?KIugkY8KJdx6i3w6+wCb3US1+YovGHUil3TKhdlW0xzu8MqUC0HV1bkHol?=
 =?iso-8859-1?Q?6qUn6MN1p41kzImA5q0ax8FOmAPolW78BFlaXvnsQrQCZEpte0kp2tx8B+?=
 =?iso-8859-1?Q?1PKlMAaDVeFr5eY8BRVTghNf3dFh74vyY7zA8FWtLO8M2WzMA5ZZr0tKfn?=
 =?iso-8859-1?Q?/xtFvJwgAjIjVW30wcGi3XAp1C93GYdniBYix1OchSe90vw5i2H6zd8sON?=
 =?iso-8859-1?Q?9ePBu7FG2pR90425hgv5EUBJbxDcXJ7iogAb2TSaRwAMZMDXgaGoKyGOPH?=
 =?iso-8859-1?Q?8xQa6ClaYFtxnu2ye5bQWdwx7356GyzNABgS66QOtD+t7wQArz+j2aNY9X?=
 =?iso-8859-1?Q?Ehtrd3rH7mzzp/XsijiviLN4+nTvgro+VUh5JY+q/QmVWDyeWSQGQXwu2O?=
 =?iso-8859-1?Q?Iy9Zz28adv?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR08MB10397.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(7416012)(376012)(1800799022)(366014)(38070700016);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?J0ZtILTbXvFvI0VQduauHjfy7RSh0/YXtqsXudaG4hROwSWOcHG0KLpLR1?=
 =?iso-8859-1?Q?DIcZ1Dv13qri1Ji+CGnAZGESNzQii6lbRZgfU/MKH7D5kqOZpDysn11G1m?=
 =?iso-8859-1?Q?NCZXGDrbMuAqWDpg7NxXWu2j2gTb9GE1JQeg8NTDmjIiAf6+z7eDN31Lxg?=
 =?iso-8859-1?Q?SdO/jthet8L5tLU8R9d/7JyjGYjAuk69yv+UN6vZvQSMyMEzC9xpLkX01L?=
 =?iso-8859-1?Q?weKeasyH43fMee4M1yJkP99ZVsjVzdMhFXWxIoqdLHYGP2mEvg5r3tpI5n?=
 =?iso-8859-1?Q?p6K9zaVuHkRGtCrGNGN+jvH+qYnX3PKsfJqvTcMaMlPA98e67SpveTd5NQ?=
 =?iso-8859-1?Q?AAfBzGDwF28XiGiL4JfXRpXgxHFOuFOIUT0kuSLT93FwgZncF50U/8h2iF?=
 =?iso-8859-1?Q?3xYTOkM5fkC+GqLDxBNI17P9FrSFwDU5+Oo3d4CUf3rkofl9IrAQmsDuPN?=
 =?iso-8859-1?Q?IEboPuMfNHXRQa1WRNytr8W9HrBBpoDI+CBYv6AcyZNAZ35stNwUVpgae2?=
 =?iso-8859-1?Q?y7C0Ykcyy5JKATLooQ55M1ow3CTNBIAqNliD9Zr/8qCyquSt486LqcZJSp?=
 =?iso-8859-1?Q?50Vm4OvpcAq8LSHv12vkqiQuJhMWIEBq5dXDzD5ro6JafIZzz+9d29GUep?=
 =?iso-8859-1?Q?F1PIVkly0SfYmr9zJwW7nHue5mTsS0Bde/P4Hsxg9h4QBnuiVYY1w/2/Dh?=
 =?iso-8859-1?Q?olK7rCQsgwKktwPWuCKXwKaErZ7dO5TrN1izHK7ygvTLGulQfNEDssQTIo?=
 =?iso-8859-1?Q?8CyAl7ARMjGfuAu5XC3zYo9vpMBUJxQwK2s1y7ff3EB+gnyF/XAP4jIYwn?=
 =?iso-8859-1?Q?JT1h5jBNviqR9S+MvTOgqJbHtjxtFYlU7wzomB2Gg2XbYp1JeRbAy1FjZz?=
 =?iso-8859-1?Q?9WezVbMSnFfc4nK9JmY5nDVmTVYTRM9yMeJQEKVzVJmGdjU2RHzxtqIrzM?=
 =?iso-8859-1?Q?5frc8/YlgF0LUkdgpoHYFr2ncWSAnpw5fC6WSnjPS8VhSJpj59e3YjOSAj?=
 =?iso-8859-1?Q?vpK0a5V4kcQcPqQ5eM4VY5RcAREHXPHRamJRa99J9v3eOWj1ikMYrFY6y+?=
 =?iso-8859-1?Q?vZKXetM5+rBdMp5KJTRQ4jeEvY2pw/nJmzQp7e8E2P4VWTOQFAw+f/5cLi?=
 =?iso-8859-1?Q?Slbnx8wz9by0Kd4wAfTku+llpd7OSWmTWU0LdLT9ym/dlCkxyCDaaXzUbs?=
 =?iso-8859-1?Q?l96EziGrzedITCi4MWwjO80//YM971odclFnXBl5N6wAqbaifJlmvKU5OH?=
 =?iso-8859-1?Q?2aH4D5dLMgIrDNZWAQob0E8rL0Go0UNiPS8/1wjgzKV4H+3x2Cq4zpJs7u?=
 =?iso-8859-1?Q?Hi9HsFRLlbZu3aH+kB7G4fIUP1wp6BS93HwEpo+Kpt6kmPg+v0jRySOdoE?=
 =?iso-8859-1?Q?XkkAg+/eSSWfGxU3a4ywLEGfjb8zXGpwWVUI6TdvN+S1P2Zg9Y7TOzUDSV?=
 =?iso-8859-1?Q?+8saV7n5lrPJ+ZROj9CGWJkw9Ogbsb6C3yJiYLtHhubff/jRGK43FCZtHr?=
 =?iso-8859-1?Q?FQvrAzqcxQ1ZDlfjmi0wp1QPsicZMMyalITmuYcbIs0qiYpKfVQhhCaGrZ?=
 =?iso-8859-1?Q?f4l3UgFEpQUNh7gGxhII9ieQclync7Ye6XP0XSirKZbv0IeSdN4WdB5UQY?=
 =?iso-8859-1?Q?UW7CJV4u8h549rgziWhiVvG5zsCcN2eeBa?=
Content-Type: multipart/related;
	boundary="_004_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: rt-rk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR08MB10397.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4344ee2-1eec-4acf-9cf9-08dc95fb61ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 16:16:48.7445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9bc3ed46-a3ca-43f0-b84e-9a557209a7df
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAdiAcBhlp9Ctr77DXpiKdMDIUGMc/tDVpyefEijyvJJf3sScYDXAvRbbuMyXHUmBpdNC+wfOHOzCOWfzY//uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8990
X-Proofpoint-ORIG-GUID: MCECvYy5edOCKMHfWpKcYiYHMG2GRWGs
X-Proofpoint-GUID: MCECvYy5edOCKMHfWpKcYiYHMG2GRWGs

--_004_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_
Content-Type: multipart/alternative;
	boundary="_000_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_"

--_000_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>

This isn't you, is it? Your S-o-b is going to be needed, too.

Nikola.jelic@rt-rk.com is the initial author of the patch, I'll add myself =
also if necessary

> +config RISCV_EFI
> +     bool "UEFI boot service support"
> +     depends on RISCV_64
> +     default n

Nit: This line can be omitted (and if I'm not mistaken we generally do omit
such).

If we remove the default value, EFI header shall be included into xen image=
 by default. We want to keep it as optional for now, and generate plain elf=
 as default format (until full EFI support is implemented)

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/pe.h
> @@ -0,0 +1,148 @@
> +#ifndef _ASM_RISCV_PE_H
> +#define _ASM_RISCV_PE_H
> +
> +#define LINUX_EFISTUB_MAJOR_VERSION     0x1
> +#define LINUX_EFISTUB_MINOR_VERSION     0x0
> +
> +#define MZ_MAGIC                    0x5a4d          /* "MZ" */
> +
> +#define PE_MAGIC                    0x00004550      /* "PE\0\0" */
> +#define PE_OPT_MAGIC_PE32           0x010b
> +#define PE_OPT_MAGIC_PE32PLUS       0x020b
> +
> +/* machine type */
> +#define IMAGE_FILE_MACHINE_RISCV32  0x5032
> +#define IMAGE_FILE_MACHINE_RISCV64  0x5064

Apart from this, hardly anything in this header is RISC-V specific.
Please consider moving to xen/include/xen/.

We shall move generic part into xen/include/xen/efi. This is something whic=
h should be considered for use on arm/x86 also. Currently PE/COFF header is=
 directly embedded into
head.S for arm/x86

> +    char     name[8];                /* name or "/12\0" string tbl offse=
t */

Why 12?

Either section name is specified in this field or string table offset if se=
ction name can't fit into 8 bytes, which is the case here. Btw this is take=
n over from linux kernel together with the PE/COFF header structures: https=
://github.com/torvalds/linux/blob/master/include/linux/pe.h

> + * struct riscv_image_header - riscv xen image header

You saying "xen": Is there anything Xen-specific in this struct?

Not really related to xen, this is generic riscv PE image header, comment f=
ixed in new version

> +        .long   0                                       /* LoaderFlags */
> +        .long   (section_table - .) / 8                 /* NumberOfRvaAn=
dSizes */
> +        .quad   0                                       /* ExportTable */
> +        .quad   0                                       /* ImportTable */
> +        .quad   0                                       /* ResourceTable=
 */
> +        .quad   0                                       /* ExceptionTabl=
e */
> +        .quad   0                                       /* Certification=
Table */
> +        .quad   0                                       /* BaseRelocatio=
nTable */

Would you mind clarifying on what basis this set of 6 entries was
chosen?

These fields and their sizes are defined in official PE format, see details=
 from specification bellow

[cid:542690de-3bb0-4708-a447-996a03277578]


> +/* Section table */
> +section_table:
> +        .ascii  ".text\0\0\0"
> +        .long   0
> +        .long   0
> +        .long   0                                       /* SizeOfRawData=
 */
> +        .long   0                                       /* PointerToRawD=
ata */
> +        .long   0                                       /* PointerToRelo=
cations */
> +        .long   0                                       /* PointerToLine=
Numbers */
> +        .short  0                                       /* NumberOfReloc=
ations */
> +        .short  0                                       /* NumberOfLineN=
umbers */
> +        .long   IMAGE_SCN_CNT_CODE | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_EXECUTE                   /* Characteristi=
cs */
> +
> +        .ascii  ".data\0\0\0"
> +        .long   _end - xen_start                        /* VirtualSize */
> +        .long   xen_start - efi_head                    /* VirtualAddres=
s */
> +        .long   __init_end_efi - xen_start              /* SizeOfRawData=
 */
> +        .long   xen_start - efi_head                    /* PointerToRawD=
ata */
> +        .long   0                                       /* PointerToRelo=
cations */
> +        .long   0                                       /* PointerToLine=
Numbers */
> +        .short  0                                       /* NumberOfReloc=
ations */
> +        .short  0                                       /* NumberOfLineN=
umbers */
> +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_WRITE                    /* Characteristic=
s */

IOW no code and the entire image expressed as data. Interesting.
No matter whether that has a reason or is completely arbitrary, I
think it, too, wants commenting on.

This is correct, currently we have extended image with PE/COFF (EFI) header=
 which allows xen boot from EFI loader (or U-boot) environment. And these u=
pdates are pure data. We are actively working on the implementation of Boot=
/Runtime services which shall be in the code section part and enable full U=
EFI compatible xen application for riscv.

Why does the blank line disappear? And why is ...

>      . =3D ALIGN(POINTER_ALIGN);
>      __init_end =3D .;

... __init_end not good enough? (I think I can guess the answer, but
then I further think the name of the symbol is misleading. )

Init_end_efi is used only when EFI sections are included into image. We hav=
e aligned with arm implementation here, you can take a look also there.

Regarding other comments, we've fixed our code structure following kernel E=
FI app implementation for RISC-V. This will be obvious in the updated patch=
 itself, just wanted to address comments which need additional explanation =
here before submitting new patch version.

Best regards,
Milan























________________________________
From: Jan Beulich <jbeulich@suse.com>
Sent: Thursday, June 13, 2024 2:59 PM
To: milandjokic1995@gmail.com <milandjokic1995@gmail.com>
Cc: Milan Djokic <milan.djokic@rt-rk.com>; Nikola Jelic <nikola.jelic@rt-rk=
.com>; Alistair Francis <alistair.francis@wdc.com>; Bob Eshleman <bobbyeshl=
eman@gmail.com>; Connor Davis <connojdavis@gmail.com>; Andrew Cooper <andre=
w.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Julien Gra=
ll <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <=
wl@xen.org>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V target

On 12.06.2024 14:15, milandjokic1995@gmail.com wrote:
> From: Nikola Jelic <nikola.jelic@rt-rk.com>
>
> Extended RISC-V xen image with PE/COFF headers,
> in order to support xen boot from popular bootloaders like U-boot.
> Image header is optionally included (with CONFIG_RISCV_EFI) so
> both plain ELF and image with PE/COFF header can now be generated as buil=
d artifacts.
> Note that this patch also represents initial EFI application format suppo=
rt (image
> contains EFI application header embeded into binary when CONFIG_RISCV_EFI
> is enabled). For full EFI application Xen support, boot/runtime services
> and system table handling are yet to be implemented.
>
> Tested on both QEMU and StarFive VisionFive 2 with OpenSBI->U-Boot->xen->=
dom0 boot chain.
>
> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>

This isn't you, is it? Your S-o-b is going to be needed, too.

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -9,6 +9,15 @@ config ARCH_DEFCONFIG
>        string
>        default "arch/riscv/configs/tiny64_defconfig"
>
> +config RISCV_EFI
> +     bool "UEFI boot service support"
> +     depends on RISCV_64
> +     default n

Nit: This line can be omitted (and if I'm not mistaken we generally do omit
such).

> +     help
> +       This option provides support for boot services through
> +       UEFI firmware. A UEFI stub is provided to allow Xen to
> +       be booted as an EFI application.

I don't think my v1 comment on this was addressed.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/pe.h
> @@ -0,0 +1,148 @@
> +#ifndef _ASM_RISCV_PE_H
> +#define _ASM_RISCV_PE_H
> +
> +#define LINUX_EFISTUB_MAJOR_VERSION     0x1
> +#define LINUX_EFISTUB_MINOR_VERSION     0x0
> +
> +#define MZ_MAGIC                    0x5a4d          /* "MZ" */
> +
> +#define PE_MAGIC                    0x00004550      /* "PE\0\0" */
> +#define PE_OPT_MAGIC_PE32           0x010b
> +#define PE_OPT_MAGIC_PE32PLUS       0x020b
> +
> +/* machine type */
> +#define IMAGE_FILE_MACHINE_RISCV32  0x5032
> +#define IMAGE_FILE_MACHINE_RISCV64  0x5064

Apart from this, hardly anything in this header is RISC-V specific.
Please consider moving to xen/include/xen/.

> +/* flags */
> +#define IMAGE_FILE_EXECUTABLE_IMAGE 0x0002
> +#define IMAGE_FILE_LINE_NUMS_STRIPPED 0x0004
> +#define IMAGE_FILE_DEBUG_STRIPPED   0x0200
> +#define IMAGE_SUBSYSTEM_EFI_APPLICATION 10
> +
> +#define IMAGE_SCN_CNT_CODE          0x00000020      /* .text */
> +#define IMAGE_SCN_CNT_INITIALIZED_DATA 0x00000040   /* .data */
> +#define IMAGE_SCN_MEM_EXECUTE       0x20000000
> +#define IMAGE_SCN_MEM_READ          0x40000000      /* readable */
> +#define IMAGE_SCN_MEM_WRITE         0x80000000      /* writeable */
> +
> +#ifndef __ASSEMBLY__
> +
> +struct mz_hdr {
> +    uint16_t magic;                  /* MZ_MAGIC */
> +    uint16_t lbsize;                 /* size of last used block */
> +    uint16_t blocks;                 /* pages in file, 0x3 */
> +    uint16_t relocs;                 /* relocations */
> +    uint16_t hdrsize;                /* header size in "paragraphs" */
> +    uint16_t min_extra_pps;          /* .bss */
> +    uint16_t max_extra_pps;          /* runtime limit for the arena size=
 */
> +    uint16_t ss;                     /* relative stack segment */
> +    uint16_t sp;                     /* initial %sp register */
> +    uint16_t checksum;               /* word checksum */
> +    uint16_t ip;                     /* initial %ip register */
> +    uint16_t cs;                     /* initial %cs relative to load seg=
ment */
> +    uint16_t reloc_table_offset;     /* offset of the first relocation */
> +    uint16_t overlay_num;
> +    uint16_t reserved0[4];
> +    uint16_t oem_id;
> +    uint16_t oem_info;
> +    uint16_t reserved1[10];
> +    uint32_t peaddr;                 /* address of pe header */
> +    char     message[];              /* message to print */
> +};
> +
> +struct pe_hdr {
> +    uint32_t magic;                  /* PE magic */
> +    uint16_t machine;                /* machine type */
> +    uint16_t sections;               /* number of sections */
> +    uint32_t timestamp;
> +    uint32_t symbol_table;           /* symbol table offset */
> +    uint32_t symbols;                /* number of symbols */
> +    uint16_t opt_hdr_size;           /* size of optional header */
> +    uint16_t flags;                  /* flags */
> +};
> +
> +struct pe32_opt_hdr {
> +    /* "standard" header */
> +    uint16_t magic;                  /* file type */
> +    uint8_t  ld_major;               /* linker major version */
> +    uint8_t  ld_minor;               /* linker minor version */
> +    uint32_t text_size;
> +    uint32_t data_size;
> +    uint32_t bss_size;
> +    uint32_t entry_point;            /* file offset of entry point */
> +    uint32_t code_base;              /* relative code addr in ram */
> +    uint32_t data_base;              /* relative data addr in ram */
> +    /* "extra" header fields */
> +    uint32_t image_base;             /* preferred load address */
> +    uint32_t section_align;          /* alignment in bytes */
> +    uint32_t file_align;             /* file alignment in bytes */
> +    uint16_t os_major;
> +    uint16_t os_minor;
> +    uint16_t image_major;
> +    uint16_t image_minor;
> +    uint16_t subsys_major;
> +    uint16_t subsys_minor;
> +    uint32_t win32_version;          /* reserved, must be 0 */
> +    uint32_t image_size;
> +    uint32_t header_size;
> +    uint32_t csum;
> +    uint16_t subsys;
> +    uint16_t dll_flags;
> +    uint32_t stack_size_req;         /* amt of stack requested */
> +    uint32_t stack_size;             /* amt of stack required */
> +    uint32_t heap_size_req;          /* amt of heap requested */
> +    uint32_t heap_size;              /* amt of heap required */
> +    uint32_t loader_flags;           /* reserved, must be 0 */
> +    uint32_t data_dirs;              /* number of data dir entries */
> +};
> +
> +struct pe32plus_opt_hdr {
> +    uint16_t magic;                  /* file type */
> +    uint8_t  ld_major;               /* linker major version */
> +    uint8_t  ld_minor;               /* linker minor version */
> +    uint32_t text_size;
> +    uint32_t data_size;
> +    uint32_t bss_size;
> +    uint32_t entry_point;            /* file offset of entry point */
> +    uint32_t code_base;              /* relative code addr in ram */
> +    /* "extra" header fields */
> +    uint64_t image_base;             /* preferred load address */
> +    uint32_t section_align;          /* alignment in bytes */
> +    uint32_t file_align;             /* file alignment in bytes */
> +    uint16_t os_major;
> +    uint16_t os_minor;
> +    uint16_t image_major;
> +    uint16_t image_minor;
> +    uint16_t subsys_major;
> +    uint16_t subsys_minor;
> +    uint32_t win32_version;          /* reserved, must be 0 */
> +    uint32_t image_size;
> +    uint32_t header_size;
> +    uint32_t csum;
> +    uint16_t subsys;
> +    uint16_t dll_flags;
> +    uint64_t stack_size_req;         /* amt of stack requested */
> +    uint64_t stack_size;             /* amt of stack required */
> +    uint64_t heap_size_req;          /* amt of heap requested */
> +    uint64_t heap_size;              /* amt of heap required */
> +    uint32_t loader_flags;           /* reserved, must be 0 */
> +    uint32_t data_dirs;              /* number of data dir entries */
> +};
> +
> +struct section_header {
> +    char     name[8];                /* name or "/12\0" string tbl offse=
t */

Why 12?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/riscv_image_header.h

Is this file taken from somewhere else, kind of making it desirable to keep
its name in sync with the original? Otherwise: We prefer dashes over unders=
cores
in new files' names.

> @@ -0,0 +1,54 @@
> +#ifndef _ASM_RISCV_IMAGE_H
> +#define _ASM_RISCV_IMAGE_H
> +
> +#define RISCV_IMAGE_MAGIC "RISCV\0\0\0"
> +#define RISCV_IMAGE_MAGIC2 "RSC\x05"
> +
> +#define RISCV_IMAGE_FLAG_BE_SHIFT 0
> +
> +#define RISCV_IMAGE_FLAG_LE 0
> +#define RISCV_IMAGE_FLAG_BE 1
> +
> +#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE
> +
> +#define __HEAD_FLAG(field) (__HEAD_FLAG_##field << RISCV_IMAGE_FLAG_##fi=
eld##_SHIFT)
> +
> +#define __HEAD_FLAGS (__HEAD_FLAG(BE))
> +
> +#define RISCV_HEADER_VERSION_MAJOR 0
> +#define RISCV_HEADER_VERSION_MINOR 2
> +
> +#define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR << 16 | \
> +                              RISCV_HEADER_VERSION_MINOR)
> +
> +#ifndef __ASSEMBLY__
> +/*
> + * struct riscv_image_header - riscv xen image header

You saying "xen": Is there anything Xen-specific in this struct?

> + * @code0:              Executable code
> + * @code1:              Executable code
> + * @text_offset:        Image load offset
> + * @image_size:         Effective Image size
> + * @reserved:           reserved
> + * @reserved:           reserved
> + * @reserved:           reserved
> + * @magic:              Magic number
> + * @reserved:           reserved
> + * @reserved:           reserved (will be used for PE COFF offset)
> + */
> +
> +struct riscv_image_header
> +{
> +    uint32_t code0;
> +    uint32_t code1;
> +    uint64_t text_offset;
> +    uint64_t image_size;
> +    uint64_t res1;
> +    uint64_t res2;
> +    uint64_t res3;
> +    uint64_t magic;
> +    uint32_t res4;
> +    uint32_t res5;
> +};
> +#endif /* __ASSEMBLY__ */
> +#endif /* _ASM_RISCV_IMAGE_H */
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,14 +1,150 @@
>  #include <asm/asm.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/riscv_image_header.h>
> +#ifdef CONFIG_RISCV_EFI
> +#include <asm/pe.h>
> +#endif
>
>          .section .text.header, "ax", %progbits
>
>          /*
>           * OpenSBI pass to start():
>           *   a0 -> hart_id ( bootcpu_id )
> -         *   a1 -> dtb_base
> +         *   a1 -> dtb_base
>           */
>  FUNC(start)
> +
> +efi_head:

Why is this ...

> +#ifdef CONFIG_RISCV_EFI

... ahead of this?

> +        /*
> +         * This instruction decodes to "MZ" ASCII required by UEFI.
> +         */
> +        c.li s4,-13

IOW RISCV_EFI ought to be (made) dependent upon RISCV_ISA_C?

> +        j xen_start

Doesn't this then need to be c.j, to be sure it fits in 16 bits (and
raise an assembler error if not)?

> +#else
> +        /* jump to start kernel */
> +        j xen_start
> +        /* reserved */
> +        .word 0

What struct field does this correspond to? Or if not a struct field,
why is this needed?

Also I can't help the impression that the resulting layout will be
different depending on whether RISCV_ISA_C is enabled, as the "j"
may translate to a 16-bit or 32-bit insn.

I wonder anyway what use everything from here to ...

> +#endif
> +        .balign 8
> +#ifdef CONFIG_RISCV_64
> +        /* Image load offset(2MB) from start of RAM */
> +        .dword 0x200000
> +#else
> +        /* Image load offset(4MB) from start of RAM */
> +        .dword 0x400000
> +#endif
> +        /* Effective size of xen image */
> +        .dword _end - _start
> +        .dword __HEAD_FLAGS
> +        .word RISCV_HEADER_VERSION
> +        .word 0
> +        .dword 0
> +        .ascii RISCV_IMAGE_MAGIC
> +        .balign 4
> +        .ascii RISCV_IMAGE_MAGIC2
> +#ifndef CONFIG_RISCV_EFI
> +        .word 0

... here is when RISCV_EFI=3Dn. You add data which wasn't needed so far,
and for which it also isn't explained why it would suddenly be needed.

I also can't bring several of the fields above in sync with the
struct riscv_image_header definition in the header. Please can you
annotate each field with a comment naming the corresponding C struct
field (like you do further down, at least in a way)?

> +#else
> +        .word pe_head_start - efi_head
> +pe_head_start:
> +        .long        PE_MAGIC
> +coff_header:
> +#ifdef CONFIG_RISCV_64
> +        .short  IMAGE_FILE_MACHINE_RISCV64              /* Machine */
> +#else
> +        .short  IMAGE_FILE_MACHINE_RISCV32              /* Machine */
> +#endif
> +        .short  section_count                           /* NumberOfSecti=
ons */
> +        .long   0                                       /* TimeDateStamp=
 */
> +        .long   0                                       /* PointerToSymb=
olTable */
> +        .long   0                                       /* NumberOfSymbo=
ls */
> +        .short  section_table - optional_header         /* SizeOfOptiona=
lHeader */
> +        .short  IMAGE_FILE_DEBUG_STRIPPED | \
> +                IMAGE_FILE_EXECUTABLE_IMAGE | \
> +                IMAGE_FILE_LINE_NUMS_STRIPPED           /* Characteristi=
cs */
> +
> +optional_header:
> +#ifdef CONFIG_RISCV_64
> +        .short  PE_OPT_MAGIC_PE32PLUS                   /* PE32+ format =
*/
> +#else
> +        .short  PE_OPT_MAGIC_PE32                       /* PE32 format */
> +#endif
> +        .byte   0x02                                    /* MajorLinkerVe=
rsion */
> +        .byte   0x14                                    /* MinorLinkerVe=
rsion */
> +        .long   _end - xen_start                        /* SizeOfCode */
> +        .long   0                                       /* SizeOfInitial=
izedData */
> +        .long   0                                       /* SizeOfUniniti=
alizedData */
> +        .long   0                                       /* AddressOfEntr=
yPoint */
> +        .long   xen_start - efi_head                    /* BaseOfCode */
> +
> +extra_header_fields:
> +        .quad   0                                       /* ImageBase */

This is quad only for PE32+, iirc. In PE32 it's two separate 32-bit
fields instead. The overall result may be tolerable (a data RVA of 0
can't be quite right, but we may be able to get away with that), but
it will at least want commenting on.

Any anyway - further up in the RISC-V header struct you use .word and
.dword. Why .long and .quad here? That's at least somewhat confusing.

> +        .long   PECOFF_SECTION_ALIGNMENT                /* SectionAlignm=
ent */
> +        .long   PECOFF_FILE_ALIGNMENT                   /* FileAlignment=
 */
> +        .short  0                                       /* MajorOperatin=
gSystemVersion */
> +        .short  0                                       /* MinorOperatin=
gSystemVersion */
> +        .short  LINUX_EFISTUB_MAJOR_VERSION             /* MajorImageVer=
sion */
> +        .short  LINUX_EFISTUB_MINOR_VERSION             /* MinorImageVer=
sion */
> +        .short  0                                       /* MajorSubsyste=
mVersion */
> +        .short  0                                       /* MinorSubsyste=
mVersion */
> +        .long   0                                       /* Win32VersionV=
alue */
> +        .long   _end - efi_head                         /* SizeOfImage */
> +
> +        /* Everything before the xen image is considered part of the hea=
der */
> +        .long   xen_start - efi_head                    /* SizeOfHeaders=
 */
> +        .long   0                                       /* CheckSum */
> +        .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
> +        .short  0                                       /* DllCharacteri=
stics */
> +        .quad   0                                       /* SizeOfStackRe=
serve */
> +        .quad   0                                       /* SizeOfStackCo=
mmit */
> +        .quad   0                                       /* SizeOfHeapRes=
erve */
> +        .quad   0                                       /* SizeOfHeapCom=
mit */

All of these are again 32 bits only in PE32, if I'm not mistaken.

> +        .long   0                                       /* LoaderFlags */
> +        .long   (section_table - .) / 8                 /* NumberOfRvaAn=
dSizes */
> +        .quad   0                                       /* ExportTable */
> +        .quad   0                                       /* ImportTable */
> +        .quad   0                                       /* ResourceTable=
 */
> +        .quad   0                                       /* ExceptionTabl=
e */
> +        .quad   0                                       /* Certification=
Table */
> +        .quad   0                                       /* BaseRelocatio=
nTable */

Would you mind clarifying on what basis this set of 6 entries was
chosen?

> +/* Section table */
> +section_table:
> +        .ascii  ".text\0\0\0"
> +        .long   0
> +        .long   0
> +        .long   0                                       /* SizeOfRawData=
 */
> +        .long   0                                       /* PointerToRawD=
ata */
> +        .long   0                                       /* PointerToRelo=
cations */
> +        .long   0                                       /* PointerToLine=
Numbers */
> +        .short  0                                       /* NumberOfReloc=
ations */
> +        .short  0                                       /* NumberOfLineN=
umbers */
> +        .long   IMAGE_SCN_CNT_CODE | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_EXECUTE                   /* Characteristi=
cs */
> +
> +        .ascii  ".data\0\0\0"
> +        .long   _end - xen_start                        /* VirtualSize */
> +        .long   xen_start - efi_head                    /* VirtualAddres=
s */
> +        .long   __init_end_efi - xen_start              /* SizeOfRawData=
 */
> +        .long   xen_start - efi_head                    /* PointerToRawD=
ata */
> +        .long   0                                       /* PointerToRelo=
cations */
> +        .long   0                                       /* PointerToLine=
Numbers */
> +        .short  0                                       /* NumberOfReloc=
ations */
> +        .short  0                                       /* NumberOfLineN=
umbers */
> +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_WRITE                    /* Characteristic=
s */

IOW no code and the entire image expressed as data. Interesting.
No matter whether that has a reason or is completely arbitrary, I
think it, too, wants commenting on.

> +        .set    section_count, (. - section_table) / 40
> +
> +        .balign  0x1000
> +#endif/* CONFIG_RISCV_EFI */
> +
> +FUNC(xen_start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>
> @@ -60,6 +196,9 @@ FUNC(start)
>          mv      a1, s1
>
>          tail    start_xen
> +
> +END(xen_start)
> +
>  END(start)

I don't think you addressed my function nesting comment here either.

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -12,6 +12,9 @@ PHDRS
>  #endif
>  }
>
> +PECOFF_SECTION_ALIGNMENT =3D 0x1000;
> +PECOFF_FILE_ALIGNMENT =3D 0x200;
> +
>  SECTIONS
>  {
>      . =3D XEN_VIRT_START;
> @@ -144,7 +147,7 @@ SECTIONS
>      .got.plt : {
>          *(.got.plt)
>      } : text
> -
> +    __init_end_efi =3D .;

Why does the blank line disappear? And why is ...

>      . =3D ALIGN(POINTER_ALIGN);
>      __init_end =3D .;

... __init_end not good enough? (I think I can guess the answer, but
then I further think the name of the symbol is misleading. )

> @@ -165,6 +168,7 @@ SECTIONS
>          . =3D ALIGN(POINTER_ALIGN);
>          __bss_end =3D .;
>      } :text
> +
>      _end =3D . ;

Interestingly an unrelated blank line suddenly appears here.

Jan
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else or using it in any unauthorized manner is =
prohibited and may be unlawful. If you receive this e-mail by mistake, plea=
se notify the sender and the systems administrator at straymail@rt-rk.com i=
mmediately.

--_000_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; Signed-off-by: Nikola Jelic &lt;nikola.jelic@rt-rk.com&gt;<br>
<br>
This isn't you, is it? Your S-o-b is going to be needed, too.</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Nikola.jelic@rt-rk.com is the initial author of the patch, I'll add myself =
also if necessary</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; +config RISCV_EFI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;UEFI boot service support&quot;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; depends on RISCV_64<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default n<br>
<br>
Nit: This line can be omitted (and if I'm not mistaken we generally do omit=
<br>
such).</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
If we remove the default value, EFI header shall be included into xen image=
 by default. We want to keep it as optional for now, and generate plain elf=
 as default format (until full EFI support is implemented)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/riscv/include/asm/pe.h<br>
&gt; @@ -0,0 +1,148 @@<br>
&gt; +#ifndef _ASM_RISCV_PE_H<br>
&gt; +#define _ASM_RISCV_PE_H<br>
&gt; +<br>
&gt; +#define LINUX_EFISTUB_MAJOR_VERSION&nbsp;&nbsp;&nbsp;&nbsp; 0x1<br>
&gt; +#define LINUX_EFISTUB_MINOR_VERSION&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&gt; +<br>
&gt; +#define MZ_MAGIC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x5a4d&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;MZ&quot; */<br>
&gt; +<br>
&gt; +#define PE_MAGIC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00004550&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;PE\0\0&quot; */<br>
&gt; +#define PE_OPT_MAGIC_PE32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 0x010b<br>
&gt; +#define PE_OPT_MAGIC_PE32PLUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0=
20b<br>
&gt; +<br>
&gt; +/* machine type */<br>
&gt; +#define IMAGE_FILE_MACHINE_RISCV32&nbsp; 0x5032<br>
&gt; +#define IMAGE_FILE_MACHINE_RISCV64&nbsp; 0x5064<br>
<br>
Apart from this, hardly anything in this header is RISC-V specific.<br>
Please consider moving to xen/include/xen/.</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
We shall move generic part into xen/include/xen/efi. This is something whic=
h should be considered for use on arm/x86 also. Currently PE/COFF header is=
 directly embedded into</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
head.S for arm/x86</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; +&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp; name[8];&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* name or &quot;/12\0&quot; string tbl offset */<br>
<br>
Why 12?</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Either section name is specified in this field or string table offset if se=
ction name can't fit into 8 bytes, which is the case here. Btw this is take=
n over from linux kernel together with the PE/COFF header structures:
<a href=3D"https://github.com/torvalds/linux/blob/master/include/linux/pe.h=
" id=3D"LPlnk643349" class=3D"OWAAutoLink">
https://github.com/torvalds/linux/blob/master/include/linux/pe.h</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; + * struct riscv_image_header - riscv xen image header<br>
<br>
You saying &quot;xen&quot;: Is there anything Xen-specific in this struct?<=
/b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Not really related to xen, this is generic riscv PE image header, comment f=
ixed in new version</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/* LoaderFlags */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; (section=
_table - .) / 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NumberOfRvaAndSizes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ExportTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ImportTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ResourceTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ExceptionTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
CertificationTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
BaseRelocationTable */<br>
<br>
Would you mind clarifying on what basis this set of 6 entries was<br>
chosen?</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
These fields and their sizes are defined in official PE format, see details=
 from specification bellow</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span><img id=3D"image_0" size=3D"84174" contenttype=3D"image/png" style=3D=
"max-width: 1243px;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:542690de-3bb=
0-4708-a447-996a03277578"></span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>&gt; +/* Section table */<br>
&gt; +section_table:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ascii&nbsp; &quot;.text\0=
\0\0&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfRawData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToRawData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; IMAGE_SC=
N_CNT_CODE | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_READ | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_EXECUTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* Characteristics */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ascii&nbsp; &quot;.data\0=
\0\0&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; _end - x=
en_start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
VirtualSize */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; xen_star=
t - efi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* VirtualAddress */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; __init_e=
nd_efi - xen_start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* SizeOfRawData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; xen_star=
t - efi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PointerToRawData */<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; IMAGE_SC=
N_CNT_INITIALIZED_DATA | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_READ | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_WRITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Characteristics */<br>
<br>
IOW no code and the entire image expressed as data. Interesting.<br>
No matter whether that has a reason or is completely arbitrary, I<br>
think it, too, wants commenting on.</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This is correct, currently we have extended image with PE/COFF (EFI) header=
 which allows xen boot from EFI loader (or U-boot) environment. And these u=
pdates are pure data. We are actively working on the implementation of Boot=
/Runtime services which shall be
 in the code section part and enable full UEFI compatible xen application f=
or riscv.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Why does the blank line disappear? And why is ...<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; . =3D ALIGN(POINTER_ALIGN);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __init_end =3D .;<br>
<br>
... __init_end not good enough? (I think I can guess the answer, but<br>
then I further think the name of the symbol is misleading. )</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Init_end_efi is used only when EFI sections are included into image. We hav=
e aligned with arm implementation here, you can take a look also there.</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regarding other comments, we've fixed our code structure following kernel E=
FI app implementation for RISC-V. This will be obvious in the updated patch=
 itself, just wanted to address comments which need additional explanation =
here before submitting new patch
 version.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Milan</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Jan Be=
ulich &lt;jbeulich@suse.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, June 13, 2024 2:59 PM<br>
<b>To:</b>&nbsp;milandjokic1995@gmail.com &lt;milandjokic1995@gmail.com&gt;=
<br>
<b>Cc:</b>&nbsp;Milan Djokic &lt;milan.djokic@rt-rk.com&gt;; Nikola Jelic &=
lt;nikola.jelic@rt-rk.com&gt;; Alistair Francis &lt;alistair.francis@wdc.co=
m&gt;; Bob Eshleman &lt;bobbyeshleman@gmail.com&gt;; Connor Davis &lt;conno=
jdavis@gmail.com&gt;; Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;; Geor=
ge
 Dunlap &lt;george.dunlap@citrix.com&gt;; Julien Grall &lt;julien@xen.org&g=
t;; Stefano Stabellini &lt;sstabellini@kernel.org&gt;; Wei Liu &lt;wl@xen.o=
rg&gt;; xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&g=
t;<br>
<b>Subject:</b>&nbsp;Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V=
 target</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;"><br>
<br>
On 12.06.2024 14:15, milandjokic1995@gmail.com wrote:<br>
&gt; From: Nikola Jelic &lt;nikola.jelic@rt-rk.com&gt;<br>
&gt;<br>
&gt; Extended RISC-V xen image with PE/COFF headers,<br>
&gt; in order to support xen boot from popular bootloaders like U-boot.<br>
&gt; Image header is optionally included (with CONFIG_RISCV_EFI) so<br>
&gt; both plain ELF and image with PE/COFF header can now be generated as b=
uild artifacts.<br>
&gt; Note that this patch also represents initial EFI application format su=
pport (image<br>
&gt; contains EFI application header embeded into binary when CONFIG_RISCV_=
EFI<br>
&gt; is enabled). For full EFI application Xen support, boot/runtime servic=
es<br>
&gt; and system table handling are yet to be implemented.<br>
&gt;<br>
&gt; Tested on both QEMU and StarFive VisionFive 2 with OpenSBI-&gt;U-Boot-=
&gt;xen-&gt;dom0 boot chain.<br>
&gt;<br>
&gt; Signed-off-by: Nikola Jelic &lt;nikola.jelic@rt-rk.com&gt;<br>
<br>
This isn't you, is it? Your S-o-b is going to be needed, too.<br>
<br>
&gt; --- a/xen/arch/riscv/Kconfig<br>
&gt; +++ b/xen/arch/riscv/Kconfig<br>
&gt; @@ -9,6 +9,15 @@ config ARCH_DEFCONFIG<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default &quot;arch/riscv/con=
figs/tiny64_defconfig&quot;<br>
&gt;&nbsp;<br>
&gt; +config RISCV_EFI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;UEFI boot service support&quot;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; depends on RISCV_64<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; default n<br>
<br>
Nit: This line can be omitted (and if I'm not mistaken we generally do omit=
<br>
such).<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; help<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This option provides support for=
 boot services through<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UEFI firmware. A UEFI stub is pr=
ovided to allow Xen to<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; be booted as an EFI application.=
<br>
<br>
I don't think my v1 comment on this was addressed.<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/riscv/include/asm/pe.h<br>
&gt; @@ -0,0 +1,148 @@<br>
&gt; +#ifndef _ASM_RISCV_PE_H<br>
&gt; +#define _ASM_RISCV_PE_H<br>
&gt; +<br>
&gt; +#define LINUX_EFISTUB_MAJOR_VERSION&nbsp;&nbsp;&nbsp;&nbsp; 0x1<br>
&gt; +#define LINUX_EFISTUB_MINOR_VERSION&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&gt; +<br>
&gt; +#define MZ_MAGIC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x5a4d&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;MZ&quot; */<br>
&gt; +<br>
&gt; +#define PE_MAGIC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00004550&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* &quot;PE\0\0&quot; */<br>
&gt; +#define PE_OPT_MAGIC_PE32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 0x010b<br>
&gt; +#define PE_OPT_MAGIC_PE32PLUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0=
20b<br>
&gt; +<br>
&gt; +/* machine type */<br>
&gt; +#define IMAGE_FILE_MACHINE_RISCV32&nbsp; 0x5032<br>
&gt; +#define IMAGE_FILE_MACHINE_RISCV64&nbsp; 0x5064<br>
<br>
Apart from this, hardly anything in this header is RISC-V specific.<br>
Please consider moving to xen/include/xen/.<br>
<br>
&gt; +/* flags */<br>
&gt; +#define IMAGE_FILE_EXECUTABLE_IMAGE 0x0002<br>
&gt; +#define IMAGE_FILE_LINE_NUMS_STRIPPED 0x0004<br>
&gt; +#define IMAGE_FILE_DEBUG_STRIPPED&nbsp;&nbsp; 0x0200<br>
&gt; +#define IMAGE_SUBSYSTEM_EFI_APPLICATION 10<br>
&gt; +<br>
&gt; +#define IMAGE_SCN_CNT_CODE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 0x00000020&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* .text */<br>
&gt; +#define IMAGE_SCN_CNT_INITIALIZED_DATA 0x00000040&nbsp;&nbsp; /* .dat=
a */<br>
&gt; +#define IMAGE_SCN_MEM_EXECUTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x2=
0000000<br>
&gt; +#define IMAGE_SCN_MEM_READ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 0x40000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* readable */<br>
&gt; +#define IMAGE_SCN_MEM_WRITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0x80000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* writeable */<br>
&gt; +<br>
&gt; +#ifndef __ASSEMBLY__<br>
&gt; +<br>
&gt; +struct mz_hdr {<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t magic;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MZ_M=
AGIC */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t lbsize;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* size of l=
ast used block */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t blocks;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* pages in =
file, 0x3 */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t relocs;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* relocatio=
ns */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t hdrsize;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* header size in=
 &quot;paragraphs&quot; */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t min_extra_pps;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* .bss */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t max_extra_pps;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* runtime limit for the arena size */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t ss;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* relative stack segment */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* initial %sp register */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t checksum;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* word checksum */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t ip;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* initial %ip register */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t cs;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* initial %cs relative to load segment */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t reloc_table_offset;&nbsp;&nbsp;&nbsp;&nbs=
p; /* offset of the first relocation */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t overlay_num;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t reserved0[4];<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t oem_id;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t oem_info;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t reserved1[10];<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t peaddr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* address o=
f pe header */<br>
&gt; +&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp; message[];&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mess=
age to print */<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct pe_hdr {<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t magic;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PE m=
agic */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t machine;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* machine type *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t sections;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of sections =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t timestamp;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t symbol_table;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* symbol table offset */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t symbols;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of symb=
ols */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t opt_hdr_size;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* size of optional header */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t flags;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* flag=
s */<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct pe32_opt_hdr {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* &quot;standard&quot; header */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t magic;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* file=
 type */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t&nbsp; ld_major;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* linker major v=
ersion */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t&nbsp; ld_minor;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* linker minor v=
ersion */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t text_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t data_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t bss_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t entry_point;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* file offset of entry point */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t code_base;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* relative code addr in ra=
m */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t data_base;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* relative data addr in ra=
m */<br>
&gt; +&nbsp;&nbsp;&nbsp; /* &quot;extra&quot; header fields */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t image_base;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* preferred load address */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t section_align;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* alignment in bytes */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t file_align;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* file alignment in bytes */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t os_major;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t os_minor;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t image_major;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t image_minor;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t subsys_major;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t subsys_minor;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t win32_version;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* reserved, must be 0 */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t image_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t header_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t csum;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t subsys;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t dll_flags;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t stack_size_req;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* amt of stack requested */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t stack_size;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* amt of stack required */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t heap_size_req;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* amt of heap requested */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t heap_size;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* amt of heap required */<=
br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t loader_flags;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* reserved, must be 0 */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t data_dirs;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of data dir entri=
es */<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct pe32plus_opt_hdr {<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t magic;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* file=
 type */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t&nbsp; ld_major;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* linker major v=
ersion */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t&nbsp; ld_minor;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* linker minor v=
ersion */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t text_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t data_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t bss_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t entry_point;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* file offset of entry point */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t code_base;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* relative code addr in ra=
m */<br>
&gt; +&nbsp;&nbsp;&nbsp; /* &quot;extra&quot; header fields */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t image_base;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* preferred load address */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t section_align;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* alignment in bytes */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t file_align;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* file alignment in bytes */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t os_major;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t os_minor;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t image_major;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t image_minor;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t subsys_major;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t subsys_minor;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t win32_version;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* reserved, must be 0 */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t image_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t header_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t csum;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t subsys;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint16_t dll_flags;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t stack_size_req;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* amt of stack requested */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t stack_size;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* amt of stack required */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t heap_size_req;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /* amt of heap requested */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t heap_size;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* amt of heap required */<=
br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t loader_flags;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* reserved, must be 0 */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t data_dirs;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of data dir entri=
es */<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct section_header {<br>
&gt; +&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp; name[8];&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; /* name or &quot;/12\0&quot; string tbl offset */<br>
<br>
Why 12?<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/riscv/include/asm/riscv_image_header.h<br>
<br>
Is this file taken from somewhere else, kind of making it desirable to keep=
<br>
its name in sync with the original? Otherwise: We prefer dashes over unders=
cores<br>
in new files' names.<br>
<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +#ifndef _ASM_RISCV_IMAGE_H<br>
&gt; +#define _ASM_RISCV_IMAGE_H<br>
&gt; +<br>
&gt; +#define RISCV_IMAGE_MAGIC &quot;RISCV\0\0\0&quot;<br>
&gt; +#define RISCV_IMAGE_MAGIC2 &quot;RSC\x05&quot;<br>
&gt; +<br>
&gt; +#define RISCV_IMAGE_FLAG_BE_SHIFT 0<br>
&gt; +<br>
&gt; +#define RISCV_IMAGE_FLAG_LE 0<br>
&gt; +#define RISCV_IMAGE_FLAG_BE 1<br>
&gt; +<br>
&gt; +#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE<br>
&gt; +<br>
&gt; +#define __HEAD_FLAG(field) (__HEAD_FLAG_##field &lt;&lt; RISCV_IMAGE_=
FLAG_##field##_SHIFT)<br>
&gt; +<br>
&gt; +#define __HEAD_FLAGS (__HEAD_FLAG(BE))<br>
&gt; +<br>
&gt; +#define RISCV_HEADER_VERSION_MAJOR 0<br>
&gt; +#define RISCV_HEADER_VERSION_MINOR 2<br>
&gt; +<br>
&gt; +#define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR &lt;&lt; 16 =
| \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RISCV_HEADER_VERSION_MINOR)<br>
&gt; +<br>
&gt; +#ifndef __ASSEMBLY__<br>
&gt; +/*<br>
&gt; + * struct riscv_image_header - riscv xen image header<br>
<br>
You saying &quot;xen&quot;: Is there anything Xen-specific in this struct?<=
br>
<br>
&gt; + * @code0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Executable code<br>
&gt; + * @code1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Executable code<br>
&gt; + * @text_offset:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Image load=
 offset<br>
&gt; + * @image_size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Effec=
tive Image size<br>
&gt; + * @reserved:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; reserved<br>
&gt; + * @reserved:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; reserved<br>
&gt; + * @reserved:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; reserved<br>
&gt; + * @magic:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; Magic number<br>
&gt; + * @reserved:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; reserved<br>
&gt; + * @reserved:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; reserved (will be used for PE COFF offset)<br>
&gt; + */<br>
&gt; +<br>
&gt; +struct riscv_image_header<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t code0;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t code1;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t text_offset;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t image_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t res1;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t res2;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t res3;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t magic;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t res4;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t res5;<br>
&gt; +};<br>
&gt; +#endif /* __ASSEMBLY__ */<br>
&gt; +#endif /* _ASM_RISCV_IMAGE_H */<br>
&gt; --- a/xen/arch/riscv/riscv64/head.S<br>
&gt; +++ b/xen/arch/riscv/riscv64/head.S<br>
&gt; @@ -1,14 +1,150 @@<br>
&gt;&nbsp; #include &lt;asm/asm.h&gt;<br>
&gt;&nbsp; #include &lt;asm/riscv_encoding.h&gt;<br>
&gt; +#include &lt;asm/riscv_image_header.h&gt;<br>
&gt; +#ifdef CONFIG_RISCV_EFI<br>
&gt; +#include &lt;asm/pe.h&gt;<br>
&gt; +#endif<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .section .text.h=
eader, &quot;ax&quot;, %progbits<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * OpenSBI =
pass to start():<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nb=
sp; a0 -&gt; hart_id ( bootcpu_id )<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; a1 -&g=
t; dtb_base<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp; a1 -&g=
t; dtb_base<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp; FUNC(start)<br>
&gt; +<br>
&gt; +efi_head:<br>
<br>
Why is this ...<br>
<br>
&gt; +#ifdef CONFIG_RISCV_EFI<br>
<br>
... ahead of this?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This instruction d=
ecodes to &quot;MZ&quot; ASCII required by UEFI.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c.li s4,-13<br>
<br>
IOW RISCV_EFI ought to be (made) dependent upon RISCV_ISA_C?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j xen_start<br>
<br>
Doesn't this then need to be c.j, to be sure it fits in 16 bits (and<br>
raise an assembler error if not)?<br>
<br>
&gt; +#else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* jump to start kernel */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j xen_start<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* reserved */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .word 0<br>
<br>
What struct field does this correspond to? Or if not a struct field,<br>
why is this needed?<br>
<br>
Also I can't help the impression that the resulting layout will be<br>
different depending on whether RISCV_ISA_C is enabled, as the &quot;j&quot;=
<br>
may translate to a 16-bit or 32-bit insn.<br>
<br>
I wonder anyway what use everything from here to ...<br>
<br>
&gt; +#endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .balign 8<br>
&gt; +#ifdef CONFIG_RISCV_64<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Image load offset(2MB) =
from start of RAM */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dword 0x200000<br>
&gt; +#else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Image load offset(4MB) =
from start of RAM */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dword 0x400000<br>
&gt; +#endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Effective size of xen i=
mage */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dword _end - _start<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dword __HEAD_FLAGS<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .word RISCV_HEADER_VERSION=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .word 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dword 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ascii RISCV_IMAGE_MAGIC<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .balign 4<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ascii RISCV_IMAGE_MAGIC2<=
br>
&gt; +#ifndef CONFIG_RISCV_EFI<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .word 0<br>
<br>
... here is when RISCV_EFI=3Dn. You add data which wasn't needed so far,<br>
and for which it also isn't explained why it would suddenly be needed.<br>
<br>
I also can't bring several of the fields above in sync with the<br>
struct riscv_image_header definition in the header. Please can you<br>
annotate each field with a comment naming the corresponding C struct<br>
field (like you do further down, at least in a way)?<br>
<br>
&gt; +#else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .word pe_head_start - efi_=
head<br>
&gt; +pe_head_start:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; PE_MAGIC<br>
&gt; +coff_header:<br>
&gt; +#ifdef CONFIG_RISCV_64<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; IMAGE_FILE_MA=
CHINE_RISCV64&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* Machine */<br>
&gt; +#else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; IMAGE_FILE_MA=
CHINE_RISCV32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* Machine */<br>
&gt; +#endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; section_count=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /* NumberOfSections */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
TimeDateStamp */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToSymbolTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
NumberOfSymbols */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; section_table=
 - optional_header&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SizeO=
fOptionalHeader */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; IMAGE_FILE_DE=
BUG_STRIPPED | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_FILE_EXECUTABLE_IMAGE | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_FILE_LINE_NUMS_STRIPPED&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Characteristics */<br>
&gt; +<br>
&gt; +optional_header:<br>
&gt; +#ifdef CONFIG_RISCV_64<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; PE_OPT_MAGIC_=
PE32PLUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PE32+ format */<br>
&gt; +#else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; PE_OPT_MAGIC_=
PE32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PE32 forma=
t */<br>
&gt; +#endif<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .byte&nbsp;&nbsp; 0x02&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MajorLinkerVers=
ion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .byte&nbsp;&nbsp; 0x14&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MinorLinkerVers=
ion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; _end - x=
en_start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfCode */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfInitializedData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfUninitializedData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
AddressOfEntryPoint */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; xen_star=
t - efi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* BaseOfCode */<br>
&gt; +<br>
&gt; +extra_header_fields:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ImageBase */<br>
<br>
This is quad only for PE32+, iirc. In PE32 it's two separate 32-bit<br>
fields instead. The overall result may be tolerable (a data RVA of 0<br>
can't be quite right, but we may be able to get away with that), but<br>
it will at least want commenting on.<br>
<br>
Any anyway - further up in the RISC-V header struct you use .word and<br>
.dword. Why .long and .quad here? That's at least somewhat confusing.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; PECOFF_S=
ECTION_ALIGNMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SectionAlignment */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; PECOFF_F=
ILE_ALIGNMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FileAlignment */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Major=
OperatingSystemVersion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Minor=
OperatingSystemVersion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; LINUX_EFISTUB=
_MAJOR_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* MajorImageVersion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; LINUX_EFISTUB=
_MINOR_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /* MinorImageVersion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Major=
SubsystemVersion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Minor=
SubsystemVersion */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
Win32VersionValue */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; _end - e=
fi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* SizeOfImage */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Everything before the x=
en image is considered part of the header */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; xen_star=
t - efi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* SizeOfHeaders */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
CheckSum */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; IMAGE_SUBSYST=
EM_EFI_APPLICATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Subsy=
stem */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* DllCh=
aracteristics */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfStackReserve */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfStackCommit */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfHeapReserve */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfHeapCommit */<br>
<br>
All of these are again 32 bits only in PE32, if I'm not mistaken.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
LoaderFlags */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; (section=
_table - .) / 8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NumberOfRvaAndSizes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ExportTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ImportTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ResourceTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
ExceptionTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
CertificationTable */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .quad&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
BaseRelocationTable */<br>
<br>
Would you mind clarifying on what basis this set of 6 entries was<br>
chosen?<br>
<br>
&gt; +/* Section table */<br>
&gt; +section_table:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ascii&nbsp; &quot;.text\0=
\0\0&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
SizeOfRawData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToRawData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; IMAGE_SC=
N_CNT_CODE | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_READ | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_EXECUTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /* Characteristics */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ascii&nbsp; &quot;.data\0=
\0\0&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; _end - x=
en_start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
VirtualSize */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; xen_star=
t - efi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* VirtualAddress */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; __init_e=
nd_efi - xen_start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* SizeOfRawData */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; xen_star=
t - efi_head&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PointerToRawData */<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; 0&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
PointerToLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfRelocations */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .short&nbsp; 0&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Numbe=
rOfLineNumbers */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .long&nbsp;&nbsp; IMAGE_SC=
N_CNT_INITIALIZED_DATA | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_READ | \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; IMAGE_SCN_MEM_WRITE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Characteristics */<br>
<br>
IOW no code and the entire image expressed as data. Interesting.<br>
No matter whether that has a reason or is completely arbitrary, I<br>
think it, too, wants commenting on.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set&nbsp;&nbsp;&nbsp; sec=
tion_count, (. - section_table) / 40<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .balign&nbsp; 0x1000<br>
&gt; +#endif/* CONFIG_RISCV_EFI */<br>
&gt; +<br>
&gt; +FUNC(xen_start)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mask all inte=
rrupts */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; csrw&nbsp;&nbsp;=
&nbsp; CSR_SIE, zero<br>
&gt;&nbsp;<br>
&gt; @@ -60,6 +196,9 @@ FUNC(start)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; a1, s1<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tail&nbsp;&nbsp;=
&nbsp; start_xen<br>
&gt; +<br>
&gt; +END(xen_start)<br>
&gt; +<br>
&gt;&nbsp; END(start)<br>
<br>
I don't think you addressed my function nesting comment here either.<br>
<br>
&gt; --- a/xen/arch/riscv/xen.lds.S<br>
&gt; +++ b/xen/arch/riscv/xen.lds.S<br>
&gt; @@ -12,6 +12,9 @@ PHDRS<br>
&gt;&nbsp; #endif<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +PECOFF_SECTION_ALIGNMENT =3D 0x1000;<br>
&gt; +PECOFF_FILE_ALIGNMENT =3D 0x200;<br>
&gt; +<br>
&gt;&nbsp; SECTIONS<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; . =3D XEN_VIRT_START;<br>
&gt; @@ -144,7 +147,7 @@ SECTIONS<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .got.plt : {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(.got.plt)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } : text<br>
&gt; -<br>
&gt; +&nbsp;&nbsp;&nbsp; __init_end_efi =3D .;<br>
<br>
Why does the blank line disappear? And why is ...<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; . =3D ALIGN(POINTER_ALIGN);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __init_end =3D .;<br>
<br>
... __init_end not good enough? (I think I can guess the answer, but<br>
then I further think the name of the symbol is misleading. )<br>
<br>
&gt; @@ -165,6 +168,7 @@ SECTIONS<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; . =3D ALIGN(POIN=
TER_ALIGN);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __bss_end =3D .;=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } :text<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _end =3D . ;<br>
<br>
Interestingly an unrelated blank line suddenly appears here.<br>
<br>
Jan</div>
CONFIDENTIALITY: The contents of this e-mail are confidential and intended =
only for the above addressee(s). If you are not the intended recipient, or =
the person responsible for delivering it to the intended recipient, copying=
 or delivering it to anyone else
 or using it in any unauthorized manner is prohibited and may be unlawful. =
If you receive this e-mail by mistake, please notify the sender and the sys=
tems administrator at straymail@rt-rk.com immediately.
</body>
</html>

--_000_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_--

--_004_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=84174;
	creation-date="Wed, 26 Jun 2024 15:55:47 GMT";
	modification-date="Wed, 26 Jun 2024 15:55:47 GMT"
Content-ID: <542690de-3bb0-4708-a447-996a03277578>
Content-Transfer-Encoding: base64

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
e/z+80zAFdQiWUXNquv06fE7t+1dV6+8dmP/u/dO6ifcTycnR5Zt79Vv3L77wP2sbnOMJNdi2fQa
h71Xv7F/50fVwGx3FTFgTYY6TA58edrbN84mD+7mX2Hde/XGrTv3P2zOB45gWqsr7iC3/pnBdjnW
Adws5B5+7n7yNPyccr6ZBH43bnr26aMj++Hl1+/8SH7XV7EU98lMpwMb1AUNO3NMpB2RzrV6OtUH
pEaj1x/gF3h1Kd39XL9tSjPwLwmQAAlshMCi8nQe53Rmt6cK5inMvCRAAleYwPlkHC40H9j7OLcy
WL3THdawt9LPmU7prwm0A0lzdb5rf6Y9ZiABEiCBtRCgPF0LVholARIYSOAySCJ7yhAfRhwY31Zl
00Aar3eQpyvDVwX3MMBWeU9nSIAEdocA5enutDUjJYHtJPDiRG4O3nO/iLZNnp69nx7CbD/qvk2u
9vty/mxc/nZULpBeDVu+XyVn4BYJkAAJbI4A5enmWLMmEiCBNoHPT+Q5f3jFWDvb+lNP3797592T
x/KTHOHz+fNH7+7rqxv6Xwq2fucWr+H87Ozsxc/Gr4fnBve+/ai8OX86PX8WfunjtfHkd4tXw5Ik
QAIksCoClKerIkk7JEACl56A3SgPD/OFzb0bB3/f8TDf1getT4CFQChAt7696CAJkMB0OqU8ZTcg
ARIggUTg/Iunx4d39vVNIKNRx6sPLhWw5z+Mq6avvnX0qH472qUKhc6SAAnsCoFNyNNdYck4SYAE
SIAESIAESIAEliZAebo0QhogARIgARIgARIgARJYHQHK09WxpCUSIAESIAESIAESIIGlCVCeLo2Q
BkiABEiABEiABEiABFZHgPJ0dSxpiQRIgARIgARIgARIYGkClKdLI6QBEiABEiABEiABEiCB1RGg
PF0dS1oiARIgARIgARIgARJYmgDl6dIIaYAESIAESIAESIAESGB1BChPV8eSlkiABEiABEiABEiA
BJYmQHm6NEIaIAESIAESIAESIAESWB0BytPVsaQlEiABEiABEiABEiCBpQlQni6NkAZIgARIgARI
gARIgARWR4DydHUsaYkESIAESIAESIAESGBpApSnSyOkARIgARIgARIgARIggdURoDxdHUtaIgES
IAESIAESIAESWJoA5enSCGmABEiABEiABEiABEhgdQQoT1fHkpZIgARIgARIgARIgASWJkB5ujRC
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
MJ883fpw2g72ydN2CaaSAAmQAAmQXgXP7QAAIABJREFUAAmQAAlcDIFdkKewfnkxkFkrCZAACZAA
CZAACZDAUAJXUZ5+cbJvt2ZWt5AOBcN8JEACJEACJEACJEACF0HgKspT90uhxVP8F8GYdZIACZAA
CZAACZAACQwmcCXl6eDomZEESIAESIAESIAESGDLCFCeblmD0B0SIAESIAESIAES2G0ClKe73f6M
ngRIgARIgARIgAS2jADl6ZY1CN0hARIgARIgARIggd0mQHm62+3P6EmABEiABEiABEhgywhQnm5Z
g9AdEiABEiABEiABEthtApSnu93+jJ4ESIAESIAESIAEtowA5emWNQjdIQESIAESIAESIIHdJkB5
utvtz+hJgARIgARIgARIYMsIUJ5uWYPQHRIgARIgARIgARLYbQKUp7vd/oyeBEiABEiABEiABLaM
AOXpljUI3SEBEiABEiABEiCB3SZAebrb7c/oSYAESIAESIAESGDLCFCeblmD0B0SIAESIAESIAES
2G0ClKe73f6MngRIgARIgARIgAS2jADl6ZY1CN0hARIgARIgARIggd0mQHm62+3P6EmABEiABEiA
BEhgywhQnm5Zg9AdEiABEiABEiABEthtApSnu93+jJ4ESIAESIAESIAEtozAHPL0N/yQAAmQAAmQ
AAmQAAnsDIGLUq2UpzvTxRgoCZAACZAACZAACcxDgPJ0HlrMSwIkQAIkQAIkQAIksGYClKdrBkzz
JEACJEACJEACJEAC8xCgPJ2HFvOSAAmQAAmQAAmQAAmsmQDl6ZoB0zwJkAAJkAAJkAAJkMA8BChP
56HFvCRAAiRAAiRAAiRAAmsmQHm6ZsA0TwIkQAIkQAIkQAIkMA8BytN5aDEvCZAACZAACZAACZDA
mglQnq4ZMM2TAAmQAAmQAAmQwOYJ/PdP8PPfP9+8B4vXSHm6ODuWJAESIAESIAESIIHtJPD8x9/6
d//+T//0z+K/f//V/3jvv/16Oz1teEV52oDCJBIgARIgARIgARK41ASe//hb3/8gR/DJw7/408uj
UK+yPH3+42+N9POtHz/PTcQtEiABEiABEiABErjSBECe/vfnj//rf/3pf73/3T/9t//x//kvP/1v
nwwO/IPvqZAajVDsDjawYMarKk+f339jNHrjvmnSD77nqEKbleA++N637v+iTOQ+CZAACZAACZAA
CVwiAiB1nt9/43/7Pw8ODw8OD//v//C10ejf/sf7k9mRfPD90Wj0PVuAfX7/e1lWzS69XI6rKU9l
3TQDbRCCNiuPUp6WRLhPAiRAAiRAAiRw2QiA1Hl+/w1dpPvF/W+9cf+DH/+HfzdLoX7wvVHXlWdY
UgWzo+9/EAStLLdGDfbB9/1CYafBGu2VlKeydKrA6pAlBdqszEB5WhLhPgmQAAmQAAmQwGUjAFKn
lKfPf/ObyQyF+sH3R+2LybICaFenP1AB+ov7cj9lWhkUGRakLRr54PszpJnje1XlaZvpb35jwt7u
pVAdG8la8sjdG+CYcYcESIAESIAESIAEtptApzz9X/7DX8iF/u//7/9rz3Jml5pExSnLffffCIpL
RJQKqt8EtRUk7Aff09QPvq/idRC1qypPFUcHBGizMgdXT0si3CcBEiABEiABErhsBEDqwOrpb/Lb
UP/bu9/qunwfBGZzpa+UrUmAFvI03EIgz/+oKs06dRjGKylP5dp9v0iHNis5UZ6WRLhPAiRAAiRA
AiRw2QiA1EF5msN4/uMeefqbjntPB6+e5gv93/9AVCqsrWYXOreupjxNF/Hh6Sg+ud/ZBXiABEiA
BEiABEjgyhHA1/J/9d821GG/PP1NuOkRllfTk/vyXFTHvaeaWW6ktPpEJX/v+3poKOWrKk/j/RD5
TlLDNBQM85EACZAACZAACZDAVSCwyOppiBuf2MnX+vOT+6ZTw8X9+/q+eSdG5VAuOxDnFZanAwkw
GwmQAAmQAAmQAAlcYQILy9PBTIp7T7Gc3YeKibO2KU9nEeJxEiABEiABEiABErjEBJ7/l//8p3/6
Z41//9f/a79ftFx43fJ03oeioh+Up8u1B0uTAAmQAAmQAAmQwI4TaMrTeGsAPAg0HBLl6XBWzEkC
JEACJEACJEACJLB2ApSna0fMCkiABEiABEiABEiABIYToDwdzoo5SYAESIAESIAESIAE1k6A8nTt
iFkBCZAACZAACZAACZDAcAKUp8NZMScJkAAJkAAJkAAJkMDaCVCerh0xKyABEiABEiABEiABEhhO
gPJ0OCvmJAESIAESIAESIAESWDsBytO1I2YFJEACJEACJEACJEACwwlQng5nxZwkQAIkQAIkQAIk
QAJrJ3Bp5OlLfkiABEiABEiABEiABK40gah8KU+vdCMzOBIgARIgARIgARK4PAQoTy9PW9FTEiAB
EiABEiABEtgBApSnO9DIDJEESIAESIAESIAELg8BytPL01b0lARIgARIgARIgAR2gADl6Q40MkMk
ARIgARIgARIggctDgPL08rQVPSUBEiABEiABEiCBHSBAeboDjcwQSYAESIAESIAESODyEKA8vTxt
RU9JgARIgARIgARIYAcIUJ7uQCMzRBIgARIgARIgARK4PAQoTy9PW9FTEiABEiABEiABEtgBApSn
O9DIDJEESIAESIAESIAELg8BytPL01b0lARIgARIgARIgAR2gADl6Q40MkMkARIgARIgARIggctD
gPL08rQVPSUBEiABEiABEiCBHSBAeboDjcwQSYAESIAESIAESODyEKA8vTxtRU9JgARIgARIgARI
YAcIUJ7uQCMzRBIgARIgARIgARK4PAQoTy9PW9FTEiABEiABEiABEtgBApSnK2rkv/vy9258+asB
xn7143/+vd/7l/Dvyw8H5GcWEthWAp8dvzkajUY3H3y2rR7SLxIgARIggUtJYAfk6S+//PPfW78Q
HChPxZl/vv/LZfrK/7h/41/e/rtlLHSXXQGrn7/91jvX4N/bP5fqPrz3zrW33kty/Nc//bO33vmz
h79OfoTda3/100LchyLRlCsIxjW9FdCvHo4h5zvRDcsYjUNi6fa1t6BIh4dmTTe8kRzRr+//lWOi
sbv8mvjyZawuM8Qwc5GYvwhTQrZ6f/6eEbBIff5oObh3L7RTikRqyf5oeMXfzx7cHL15TGVaYOEu
CZAACZDA8gQoT5dnGCwMlKcDs/U5teXyNLou+sYk0cuXv77/V+M/+6vx/aBIf/VQtk39yO7Dn9/X
o6F8EEwms17+/O0onkS3oVbrwyQ6zCwEoQb+/Pztt9778OfvXXOaTKy5Umq+5aEec38x6iKElwFC
ofl+/vZbiUmUpMnDrjCDbAVu70WewQWsOia8l78PSPgZvkUtGj0iEsvqSQcEF2jYeXLAddOaClNI
gARIgARWQOBqy9N/ejtdRo8X0//l99LKpaTDAqTt/o/7N/75/i+tFKy5/t2XekXerX3Clfp/gYv7
oiBT/r/8J2wlyT/sHoCXL8GIrv5++JdqVuP68x//D7GfVj3Vc61CqjMHipXRHNG/BCNaVi0rK3R/
+HahlkSe3n/4XpBWv75/76cfPhyrSBIZ9/bPRRea8HopcqolQ7t0W8uvQmi63Z+/F2RZEKm+rMuW
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
Kpx0hgRIgARIgARIgAQunQDL00uPIO0nARIgARIgARIggasiwPL0qsJJZ0iABEiABEiABEjg0gmw
PL30CNJ+EiABEiABEiABErgqAixPryqcdIYESIAESIAESIAELp0Ay9NLjyDtJwESIAESIAESIIGr
IsDy9KrCSWdIgARIgARIgARI4NIJsDy99AjSfhIgARIgARIgARK4KgIsT68qnHSGBEiABEiABEiA
BC6dAMvTS48g7ScBEiABEiABEiCBqyLA8vSqwklnSIAESIAESIAESODSCbA8vfQI0n4SIAESIAES
IAESuCoCLE+vKpx0hgRIgARIgARIgAQunQDL00uPIO0nARIgARIgARIggasiwPL0qsJJZ0iABEiA
BEiABEjg0gmwPL30CNJ+EiABEiABEiABErgqAixPryqcdIYESIAESIAESIAELp0Ay9NLjyDtJwES
IAESIAESIIGrIsDy9KrCSWdIgARIgARIgARI4NIJsDy99AjSfhIgARIgARIgARK4KgIsT68qnHSG
BEiABEiABEiABC6dAMvTS48g7ScBEiABEiCB50ng//uvf//L//z3v/zP/+2/B///23+Rxr//r6GR
JxdFgOXpRYWLxpIACZAACZAACQiBX73+Nz/7n37nZ9/+/b/6X//9N4jk63//1+/9/s++/Tv/zz/4
N1+zREUyF3TM8vSCgkVTSYAESIAESIAEKoGvP/zgr7/4H30a/+M//fMP/uMX/eu8cs4EWJ6ec3Ro
GwmQAAmQAAmQwCiBrz/cUn1u7YBi18tF+Czv8erTH9+L/scpfbi7WSxuVm+HRhanbtfDC+ffwvL0
/GNEC0mABEiABEiABBKB//LzN387+ex+awcUWCq5f/LxZ59/Vv/35m/x6tMfd8rTb+5//IP/+Qev
RkpPN4nlqbPgEQmQAAmQAAmQAAlcC4FT32jslKf90tPB9/uc2im3cecj3j3dGRkHkAAJkAAJkAAJ
XBeBkUrum//zgxeLF7/3+a/E07/99IMXi+/+8VebTe352Vd/+qPvfmuxePHr7//huv4y61c//3T5
j9/9NXlH4MWv/9bHX/6yEHq7kkfv//bLz26/+2uLxYt/+P7Hf1kEbja/erP60W9K91/7zR99+m9/
b/hwf30L7xu8XD1sNqMqWnn6V19+/Fu//qJIW72pKoJT3/zFj3/wG0Xdb/zAbDjbILI8PdvQ0DAS
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
3V9f5Jc//bFn9erMiwe/i4Xc7P7vu/hv+9lOfvngj70Hf+yJ2b+++OmvL+7/vptf5rHu/777019f
5Mb3nj73d5/uPPhj7/6z3XtPnt9/tpv/bT/dyUE9+H0vl4f1OcwUo/TKBXt5/9nuT3+8QJvWIBf+
8V/+7b/v//vf/vlf//Ff/s3+/e2fXueav/3zv/7D/3ptbXLlf9//93/8l3/72z9JPbaUl//8r9la
1dLsl3dTXxv3l78+f/4PL3f+9j///If/cf/Z7vbTnDIJxwj89McLi86YVFjyVPnpjxe5V7bzd3/9
+wwt12c7Gcv2051qIlXk80BIPjfI424/Kdm5/zRN1N9f3H+6++DZ3k9auP90d/vJzoNne9tPdnJl
rpGOT3excS5b37/74+9zg59+f/Hg2V4u238fPNvL/7BXHsVqbMQ81vaTnVyorOV6q8wOiKmnu/ef
7d1Phe2nu/nfg99fWH0u21vbT3fvPdnJL3PHe092Hvz+wrrce7Jz7zf5t/1k98HvL3Lh7uPn2092
7z/dy2/df7q3/WQ3V24/2d1+spub3X+6l9vkyqr+p9//PjfI72Yj+b+55sGzF2gzvVX4K5MXlpEM
+d5vz43b3cd/ZqoVw3u/Pb//dBdbYrrVsuTO2pid3NdSJh1/27n/ZPfe4+fbv+3ce/z8/hOpyeX8
1oOne7mQ6+8/2c3/cpdc+eDp3v0nuw+e7qGdn569sHfvPX6e7Wz/tpObPXi6Z73sLRs3jyj0sjMp
g5a7u4+f5/K933YePHthObLCvd927j6SFN999NyyfPfR87uPnt97vHPv8c72b7v3n+xZ2V4+ePoi
V95/srf9224u23+3f9vN/7KF3Gv7NxnFamTEZDlX2qCVtVxvlWbK7Nig9x7vZIN5aHPbGpSgHu1s
P97dfrx799fn93/bu//b3r1Uc/fX5/nfvUc793/bu/vr83uPdn58+Ce+u/141yrvPdq592gnNzOD
ubKqf/DkRWnwaOfuo517j3ftv3dTzfZvez88/DOX7/6aGqT/SstU2BZ/pF7+PZJ/Pz58LjWPpMEP
v/x579Hu9mNpkyu3H+/lNlXL3L7ZMnc0Oz8+fG7lPGJukMfN7+bhzJNkVnqZG8XVX57ffbiT/20/
2rv36+72o70ff/nz7sPnP/7y571fd+8/fnH34fO7D5/n+u1He9b4x1+k0nqlt6Rl7psL937dydby
S6zM9fd+3b37cOf+4xfZcnbg7sOdVJ99EAvbj3Zz3x9++fOHX/788eFzC+3HX57/qFHc+3U3e5Ur
s/Fctv9avNjr7sOdH37+02p++Fli//GX57nyh5//tHfNTn73h5//vPtwJ1eq2/Iyj4KNs8FcL+Wf
n+O/H/7yZ35595edu7/s/PCXP+893L33UJrllz/85c/c5t7D3Vz4z//1v+G7d3/Z+fHn57kym8rN
zKANh/Xbv+7lBjZ6tmmN7z3c/U//RQb68S/y7+7PO/m/Vrj3y16q2b378+6P6d9//q/Pf/jLzo8/
7/7wl53Ud/fuL3s//GUnV979Ze//A6Su3s6g5OVrAAAAAElFTkSuQmCC

--_004_DU5PR08MB103973ABF5E6F12853F5D24E1CEC12DU5PR08MB10397eu_--

