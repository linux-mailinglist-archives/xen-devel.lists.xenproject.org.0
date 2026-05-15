Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCcQAqEJB2oLrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9283654EDD8
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309892.1580935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr8C-0005p2-6j; Fri, 15 May 2026 11:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309892.1580935; Fri, 15 May 2026 11:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr8B-0005mP-UB; Fri, 15 May 2026 11:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1309892;
 Fri, 15 May 2026 11:55:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr88-0004sR-7a
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr87-006N3i-Jt
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:54:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a07098e-bab6-0a2a0a5309dd-0a2a450ce7ce-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:59 +0200
Received: from [52.101.66.95]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070993-62f1-0a2a450c0019-3465425fdad9-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:59 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB10041.eurprd03.prod.outlook.com
 (2603:10a6:102:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:54:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:54:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enfz1r+A15bXfyLnYX15d67jorGSZMCqDatlkUGoae+RivOvcA3P1ZND+By+XXgeqvEigM+vnR52HdjljAbX3Xgiz7zAHHQh+Vv2izLMXy7rOPBqXkVCLEm1WbB/cTtoOwU3GrQVVw4MqDOBZ6mEX4whozoGNL58YrLWRncdoPmzcsniKC5Ae0na7anFf3d3L+62Uanej/SeNf9WpVwesXFQW4TaPjfdR8p84NUZO85kZhvdOJ/hijnMoCX31Z3zUPXxxK0Qrwo4EGkdAHGLWjeDJlSxTkKyg+VXokG/3Uh6tGRKtaXakoZHiXKnMcBkp9vkzDdgzs7Kp21gHrvk2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvITBzfviWpLjYTwWhEQQ0njuortD3PdC0Fl/d0a490=;
 b=YtKMgkEiOWyzu5dJarAXEmZYMC/djMGcFy2KgP5R6Ud8gnkO7qhBRvAfzsiZj8EPwkKJnVprq7JC/IJBVAsVlAjlVsu+k2MYM98pN62Z0CV96exNNtuDwun6Do30fXI/GGdg0xVr9hjJ1BjDLKURYifLm/NJQWBTxSTrLRhIUz2qNX0UJFPPBD5wDxyAD+m7V7pE62PvaCoKMBcuT6165fwJqfKlSUBW4kOduVBxT4sAiWkLFBLBFvj8Y2cDZ+vF65TpFQOSkAqqfipe/L05P9o7czFIVFhmDgYcdqx7bP/OfaYSDWGDzCpAGusX/inkbZuLx4KOlKSnI2lI/8QovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvITBzfviWpLjYTwWhEQQ0njuortD3PdC0Fl/d0a490=;
 b=T6wymfmj3/BSMTExzjdLyHiKtcGy5xwL61KZDe+YR3UJxBdKSA/tYAcxRrgLxYKylme9C/Frn2taNCewLRBbVvfuNI6GcPiIipNhUN3dkuzpYW+ad+yoUNAJW6kw1oPX6w6JAGBikJPx0JfrkgEkDaFGu2Mb1vvX5IWkzMSnIU7xuUvTwSsOBRVG1A0F1bB6Zp61F378B5gG9MbScWKC4ztHLOEF71ZKsc1Cchw40xrCKFWaWo9cptRj+UXPpzJh8smxioaiyKcuvWHbSuiSxD1NyKY8hU4jazcm6ojJWvwdTOxp8RYPQKfZ7qiFhK270ArZgHl9B2SaGMXnkNxcgg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Teddy
 Astie <teddy.astie@vates.tech>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v8 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v8 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHc5GGmioWDIjxH0EO+SnTISTH6hg==
Date: Fri, 15 May 2026 11:54:56 +0000
Message-ID:
 <8d0d4f74ef5730edf59ff21fe8ab2aead6a7f1c6.1778845596.git.mykyta_poturai@epam.com>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1778845596.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB10041:EE_
x-ms-office365-filtering-correlation-id: 95452295-8d7c-4470-96ea-08deb278c8ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|11063799003|22082099003|10063799003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Lupc9STKhuPRbxWgLN7IsyCUlwR3n1tjmDWUoFq6/QUNtn16XoXX14w7+htw4SvMD0Ij0lvqXci0yPgW3v+v6JYzfc9dyd7ym9Eqyxmmm4x0VnkZrTekdJ9dWcyAESplO7HlsuPm4ERLL4YaXxFNKunUV1O5k4ven7wbYj2vAxuZJaEtXDowK9p5CH/kHKnQX53Ez+9AAfYLJLTqe3zugXD2uBtZ6mc1U1ff6I441g6qxivFTeBOyGV0MYiG1X4GMRTyHRIJx7DkkKeraRxcCeLV5iHF4XEAlEee+UocBbL6+r5xkKViqjFauLAX1f4jNSa0VlVox7BgGzzO2jQ4ooprMPuzAG8hLUenzkS7u1seU5owtrfqtKzhSGcNcC7HHlHWPpn8EzVGNudZJ2ZJS7UvN267uucJx0WDRVmMWlMYKnNd1rS9iWGqsAkM504hF81pXpy6Xr7+0a6C/SOIGxU2g8sEfFBGgAkW/RS7dOWIMmVSl91Wc/TzEtmOjx+p89a4RxbXvA5Tb63jRljfYrg6gMq/7ii/zyH4vCyLlzNO+lxYmNqSooqG4xfxXUpI2gTYodbpFFjxIsWKJSyexEv1x8QKQd5pBvSgEbJwsSzSmbQG6BP1JtWyV0D6gvwRw/37UxNLM+WBtvPEKED+9FIGdTbtAmtou0akIoJ3Zkc7viiF1SfqGcq7JGil/v3dOxk0CiWSEuzYH4oa1SIKvkWjuRXlKYA60ThjjBWufTCEIs9Osbf6LUzvHg89jQLo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(11063799003)(22082099003)(10063799003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/9S40tnKn7OYnpJwzuGJSEHNeRysBDFjuIJKW6Egl4YK0FzherhqQ6sUkP?=
 =?iso-8859-1?Q?WaJi1OEa1FyddR4UhKbVYA9giskzis3fa1K6pbmFuU9on9r39EA08L7eRZ?=
 =?iso-8859-1?Q?YyftXd9NfSLRHm2HrXK91haDMjAiQehU38zPJhhbbZFOxm3HHihhaV2piJ?=
 =?iso-8859-1?Q?6SyYALnE3tSBU9fXPMf+0uVuTKbLCKWICvX3Gjdh0AJIFp4s6iPNP1BQ76?=
 =?iso-8859-1?Q?XsEctU2cO8xSTUoN5vv2PvClyVY8V68fsA/FPSZjJAo4SbdHMH7/2VOT0q?=
 =?iso-8859-1?Q?4Ligml1uI6OG2PDLj6nEDMQFFlwdcEJM5ktI+Xf6fK35aJbgVnh9OEOVyQ?=
 =?iso-8859-1?Q?2SJaOvfYJZzfjnP8jukKy5JN18v3X4Cuv6p/I5mDxzxQzRHwHiqA/dYQ50?=
 =?iso-8859-1?Q?N6hJrhcHnfWu/qnuX42NvjGhxwUiR9UMUpXRmPaqsIJbaFexjXO3bOy9Yg?=
 =?iso-8859-1?Q?w7nlLLy+FqqsPaSW2qXNg7Dt9p13Gka84k4bR88ulCKSKFrU6gBzV8pOXH?=
 =?iso-8859-1?Q?iTzTJHZq10esvICqeNOAatKNjuBdl78Gj3ZBuk8N270YQiKQog5YOXiNi0?=
 =?iso-8859-1?Q?RcPm7iIJnrtIsrz0QRyvY9uO9oGh+E1tfR4mU9TyPJ4HN9jQPuU0byqSKB?=
 =?iso-8859-1?Q?nR2I+9iIc3QkxOZ4Vc5nJTBCDWLcFIio4rcfvZZX+OIhZjd5kqXFfLGWxD?=
 =?iso-8859-1?Q?EKQi5cU8NdipM+cJe7y9zquKXwS9vBuQp20e3zQv2MtFxNQecY5bg9d5Ai?=
 =?iso-8859-1?Q?GKT/SGaUDfG6YsuOylWuJImLw/rOyRgRZzRdbt+GVkBoVgi8+xL80/lZGC?=
 =?iso-8859-1?Q?c9ShEP2PLNgLN0D1vpsyqmc3KynMdAw4HustdsZeBrMAP4vYADscZbzJ5s?=
 =?iso-8859-1?Q?lZVlG6dRz2ji0UC8f71u0Q7iwNdsL6sDNlzg/eXEuaPYpQRCv6qqfMwXTt?=
 =?iso-8859-1?Q?acw/TQQ7fgs8tcZjg2P9F2PL2+rAXPr7bJmnbKxpvdSrn71QCvuDaaqLB5?=
 =?iso-8859-1?Q?0vgk7xB5MSr82JlsGR5h3PZkzlgloSFWSALskSNVZKvNURq3CaKLgnTpLP?=
 =?iso-8859-1?Q?Zi/pLCp/ZGpTmURqyMYW47DGnhrFkwbAkZfiEPfmxSoTeoZbTdYm80veZY?=
 =?iso-8859-1?Q?tGdkXEn/RdwvZGeQy5fReTnMMQ07i9NjHfWmVpf3XTBRntju0VGjQbisPI?=
 =?iso-8859-1?Q?JCotWmLEYnWCfRF2+0mB1mW1FqKJQInlsSHjCAMhodhKL2YnKWHh6pjXcF?=
 =?iso-8859-1?Q?p9GZVzdUTaP9ooK53IaFZ4tu18ojIog8mSgEk06mT1yBAsh0FDIzXshhga?=
 =?iso-8859-1?Q?ASx3srrW0wnRnd3BRNJyP1VmvkyUyoXx4byWIojoERAOeoy5Io+IH7YlzI?=
 =?iso-8859-1?Q?/Sui9vXJTMiViCKln1RZXfsqOV885Poc7zbMZugSoMhOuIjEXEYQxK3vke?=
 =?iso-8859-1?Q?OwT/e9CNA183Fv4N3BexA4HyBef8SmwzIXzzD8yRJIhHFEI/GRGTg23JCj?=
 =?iso-8859-1?Q?mPBgEjv8VMGiEwIf1wmxk3yo5IjvdYR1pRbJhhgR5DIARJoLIkSkkMxO6G?=
 =?iso-8859-1?Q?4GJYzmrC7ai/66AZPNDKI5PFAGpi3tiKZFjRR1Tr6LTAmvGPYOqB1GLyTI?=
 =?iso-8859-1?Q?xNjN+5ZWkqrjfgLsr6e5FxgY2qyZUnzD4Vt+LAA5jq372XiVJZZ6rYVqFX?=
 =?iso-8859-1?Q?uMHTlwz7FWb80JxWVCOTWPV8kfwDOTPuzKkHCD5t3uhNddHNuidw39T0Ho?=
 =?iso-8859-1?Q?viEqDZ+TsGih4dUo6tKWEKz4R6+rOVH32n48vjyuSrOKmjXU2pAME37hki?=
 =?iso-8859-1?Q?6JZapj7c5yAzDejz6uc5et5UtVjAkr4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95452295-8d7c-4470-96ea-08deb278c8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:54:56.9040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAC9miL50YGTAZN4wHdnLXlqmrrnhjmL+RvzJYvjw50oe4HI0Vrk3tEminoZp80aTH/XCnGR+6T6tVE+CxLFrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10041
X-purgate-ID: tlsNG-d25034/1778846099-F5784CF5-F899FB53/0/0
X-purgate-type: clean
X-purgate-size: 10700
X-Rspamd-Queue-Id: 9283654EDD8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
and partially supported FFA, or TEE is enabled, as they use non-static
IRQ actions.

Remove ifdef guards for x86 in flask, as cpu hotplug is now
supported on more architectures.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

---
v7->v8:
* simplify dependencies of config CPU_ONLINE_OFFLINE

v6->v7:
* use IS_ENABLED istead of ifdef in more places
* remove unneded variables
* more explicit fallthrough in do_sysctl

v5->v6:
* fix style issues
* rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
logic
* use IS_ENABLED istead of ifdef
* remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
from the common handler
* fix flask issue

v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/smp.c             |  9 ++++++++
 xen/arch/ppc/stubs.c           |  4 ++++
 xen/arch/riscv/stubs.c         |  5 ++++
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 34 +++------------------------
 xen/arch/x86/sysctl.c          | 13 ++++-------
 xen/common/Kconfig             |  6 ++---
 xen/common/smp.c               | 35 ++++++++++++++++++++++++++++
 xen/common/sysctl.c            | 42 ++++++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  4 ++++
 xen/xsm/flask/hooks.c          |  2 --
 11 files changed, 109 insertions(+), 48 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..0ea64d2ee1 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+inline bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index a333f06119..8f280ba080 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,10 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index acbb5b9123..e051f0fb3f 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -65,6 +65,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 3f16e62696..cb3e0fed19 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 9046c826f8..caf4411705 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -419,37 +419,9 @@ void cf_check call_function_interrupt(void)
 }
=20
 #ifdef CONFIG_CPU_ONLINE_OFFLINE
-long cf_check cpu_up_helper(void *data)
+bool arch_cpu_can_stay_online(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
 }
 #endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1d0857b502..7a88ec7d7b 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -121,7 +121,6 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         bool plug;
         long (*fn)(void *data);
@@ -129,6 +128,7 @@ long arch_do_sysctl(
=20
         if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
         {
+            ASSERT_UNREACHABLE();
             ret =3D -EOPNOTSUPP;
             break;
         }
@@ -136,15 +136,10 @@ long arch_do_sysctl(
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            plug =3D true;
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
-            break;
-
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            plug =3D false;
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 9fc53fde48..d0b8aa8d1c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -637,9 +637,9 @@ config SYSTEM_SUSPEND
 	  If unsure, say N.
=20
 config CPU_ONLINE_OFFLINE
-	bool "CPU online/offline support"
-	depends on X86
-	default y
+	bool "CPU online/offline support" if EXPERT
+	depends on X86 || (ARM_64 && !HAS_ITS)
+	default X86
 	help
 	  Enable support for bringing CPUs online and offline at runtime. On
 	  X86 this is required for disabling SMT.
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..16f4ed2d4e 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_ONLINE_OFFLINE
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && !arch_cpu_can_stay_online(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_ONLINE_OFFLINE */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..f06aecb6f6 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -483,6 +483,48 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        unsigned int hp_op =3D op->u.cpu_hotplug.op;
+        bool plug;
+        long (*fn)(void *data);
+        void *hcpu =3D _p(op->u.cpu_hotplug.cpu);
+
+        ret =3D -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_CPU_ONLINE_OFFLINE) )
+            break;
+
+        switch ( hp_op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            plug =3D true;
+            fn =3D cpu_up_helper;
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            plug =3D false;
+            fn =3D cpu_down_helper;
+            break;
+
+        default:
+            fn =3D NULL;
+            break;
+        }
+
+        if ( fn )
+        {
+            ret =3D plug ? xsm_resource_plug_core(XSM_HOOK)
+                       : xsm_resource_unplug_core(XSM_HOOK);
+
+            if ( !ret )
+                ret =3D continue_hypercall_on_cpu(0, fn, hcpu);
+
+            break;
+        }
+    }
+
+        /* Use the arch handler for cases not handled here */
+        fallthrough;
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..04530738c9 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_cpu_can_stay_online(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 28522dcbd2..4ee68231ce 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -835,9 +835,7 @@ static int cf_check flask_sysctl(int cmd)
     case XEN_SYSCTL_getdomaininfolist:
     case XEN_SYSCTL_page_offline_op:
     case XEN_SYSCTL_scheduler_op:
-#ifdef CONFIG_X86
     case XEN_SYSCTL_cpu_hotplug:
-#endif
         return 0;
=20
     case XEN_SYSCTL_tbuf_op:
--=20
2.51.2

