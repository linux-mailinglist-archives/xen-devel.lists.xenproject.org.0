Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEtdDfNTu2lMigIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 02:40:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96F2C4937
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 02:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256621.1551157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w32MV-0007EZ-C9; Thu, 19 Mar 2026 01:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256621.1551157; Thu, 19 Mar 2026 01:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w32MV-0007D3-94; Thu, 19 Mar 2026 01:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1256621;
 Thu, 19 Mar 2026 01:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tHx=BT=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1w32MT-0007Cx-V7
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 01:39:45 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e326875-2334-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 02:39:39 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB9653.eurprd03.prod.outlook.com
 (2603:10a6:102:319::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 01:39:36 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9700.020; Thu, 19 Mar 2026
 01:39:36 +0000
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
X-Inumbo-ID: 7e326875-2334-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLBD3td9Qt7ILUN6Dm4Vm6PzEZJ+NOwcjQzYjIOSKi8XB1sJ2hwP8wnG/eJK2SqVmtk8ha12ZNFPzGkrP0OpjMF6GBk4oobdly/DC1qCys/58CzLOJ2WPpQyJUL8+gLrgTForLRO6ubOiCB89ZIC6H9zTL2VJRQI8GBq041ZUKW3bMu6JRBKqxOFxMH55uaosbmekDcdRbODkdgzjEKdh55y6md5au45mEc+T6a5FdCf0GR8LvdC9PonsROGgRXLM8nuvV35/oVRb8Mb9uz9b+AMNc7MoSAZW7CF0riOyjkdY2KQ5Cya0L7S76BtCco4Gi/v15ptUxLMIKZkkTdrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Qo/yFQTGxop5FACzR0QNg0zqFUMkZwrSIz5rqfIUiw=;
 b=W6PoGb+Uqd7MCb9jsJsIXaFpN/OS6c+7Myr4xsogF/PTJWEPqV7VsS36MJxcuJ59juUuzVMT5G3uUhgVkWfnXjyAYExd4P2W0ADS9YY+r4MD9MSoTsAzwCU9PqjOPmdxHkhRGEozW5TPcYJN+ZpUIcVBPkspfvKn12EbCmrQlNrXIMsGsUK5mvMXdu3VuQ0T1nz85LFiWGiNA5/4vSAZ/NZW1guv6Ik7prz82ydLgtU3Ohsxc0d8o4X8u8qMcDI7FKuxcsrYP0EMSoIeEP+bWKzYlhvq44Pd1tCLxXiZPBDUhR1/XbWjeRCTfha2iykr48UxGxgEVIOmM3Oxls1gNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Qo/yFQTGxop5FACzR0QNg0zqFUMkZwrSIz5rqfIUiw=;
 b=BByiGSTEktI5FOksDfQ5y6lAq+xABotwW7r2fhkn9kjQ2V+r7egXvCw/1WMW5QT2kNCoEEgnyA5hRIjkkIIlKEOjwAYG8mRr52xksa1gu8XxUckYBNlkuvopt2eLcBwIuZnoQzf5FTIbvd9aL/lfRCqgwEutBDpG/M0UjN5ElonpEz0HiZ15gHgTxke1Qlva2TFQBxrilKQQX4VSZk6BixI7w+Szvd+Feg3rs0rhmqyDgXl/bDRxEVdU0Y1Sl1mdRfHtQSuSvv3rhhbgmQa+a71fbM3lWQ6j6lyCrhCSVMbUOBwZur/TXUDg0LJWBNXRvzp4tycz4ONGfS11zYXxuQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Topic: [PATCH v6 1/5] arm/irq: Keep track of irq affinities
Thread-Index: AQHcsgQfYo2+uc7QB0+uZY6Wrq2Bgg==
Date: Thu, 19 Mar 2026 01:39:36 +0000
Message-ID: <871phgk36w.fsf@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
	<733d58a26766a1d15e47447ed4f3cd299dc28cf7.1773307749.git.mykyta_poturai@epam.com>
	<877br8k3fy.fsf@epam.com>
In-Reply-To: <877br8k3fy.fsf@epam.com> (Volodymyr Babchuk's message of "Thu,
	19 Mar 2026 03:34:09 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB9653:EE_
x-ms-office365-filtering-correlation-id: 57ddff04-c766-4741-34b8-08de85586103
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 IHig6ao+VuRfFfZfGwb/mRUF8lcVKgXoqv6H+z9w7jEpojVd4r7/fV82NxM+VsnrED87g5dq0xVQLr4dZ7llzRI8+twxdm9jQXJnBFR0CiyqfxJ0JZbG/HYw1VKRz1VG0mE6Bk3zN+igI4ymlFBO5WpivClS/LsKKP05kVW9c7qQLvuJxsmw1+5PjWS2bZLamt6FgwyCQGhk3Zz8V7YJliEiKucV8JxYhviNNcAfnbtpHvFm1Hw7tFTefLnDFl2Ul1PBufqJEcTxdAYlosNQ65FW+Sb+D0Wgy44KkyC5ugOs/QSQ0v48wKNczCdZsyuT0aU0d4onRw9cklf9zPD+XQxs4BFFKMhUR52Y/O2nZAnglKxYL8+Y2ecVoigw6ASZ248yzHG6FrwAImec1Q51H5JshDDkpbJxEVi9/HocWyB4Oqso+8mbw9S3B5VO3tQToegt3ghu5h5XN7TP29N/5mTX1z/awfY9tUJswC3ZTHEhAEiAxXlBQmoMgb2nN25OPcDFkt7onsL+Z+XjbWjID8s+Hltfrx4iMbAVZFC1KA3FGPAsit0m6kMpilAZwEKy0o+4laC8Qg0lt4jVvAQIwlGfO5XdNC8209/YBcWrNKndt861h+v0DNhcsHZiS3Tr7hq6QQzgPmV/wgtdotsWxgSpuQTEzG9qoKKYNc0VYWERfL5vb+IKvQ4o6AdpIRc5VVc813NQ7KlnUI5cVm6jyK07Ph8E/pihgXOGTeXUPToJl+UYXPu4UzQjcvICAIyePaxsnOj8D1RpfNLn1+XRz3CbvJOmBxBQ0w/efRgw/Ug=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xAVv5mxPEXRiC199kkWGnX8G1Yq+F7u2MJgjcpQL0xNP0GS/Z5iOYxsEUI?=
 =?iso-8859-1?Q?7Pq3UCnj/wGYFBBTtkDbIeQ/bGsDAIsdWCdZ4rNVfWjCViqUbFE5Sj7pt0?=
 =?iso-8859-1?Q?HI4uk0MHXbMImtI7cr6QLPe05bTUreVwX1+phjO+C1VMamwjcVsaFHbl30?=
 =?iso-8859-1?Q?28caVoi/qRSf0DC5jFypWt2l7p2Ox1PG1kS8Eh/3NJ3t7nbO/Slt8NYzKz?=
 =?iso-8859-1?Q?JRBMdJC1bsHfOZObAQMr5ZMQOXfoNruFtHqRnvuXASRTx90R25Ot9MwnRT?=
 =?iso-8859-1?Q?DIjanMM+db2G5qnU3YIlE/BnmXN+Wguu7xc92VSjz+f1EqQ4VEY5f1foIr?=
 =?iso-8859-1?Q?OKrIVcT5stomDpr8papVrtr/WAK+pGujClb3reH6ePVp+vth5D7Ex6uD7D?=
 =?iso-8859-1?Q?YyblYiCnzEwry1YydSvZXEzT9PnhqYyUPLnKBRnaGr2QlfAL8jrgPbUzUr?=
 =?iso-8859-1?Q?qgdas8Cnmr1mGIrsNSKuaYhshcCLxaCcKJcTEpsTwF7x/uCf7DfE2NQzPI?=
 =?iso-8859-1?Q?P5YSg+W85+mpwc9esEJ5OOmN2QcckxVWCUqoWEVDZIaNaOmeuoUf8GT6LP?=
 =?iso-8859-1?Q?i/UAsg4Gw68LY6ow63t1U+p2yBA2dgtP65gFiVxLY1v71BWfUw2ERO/b+h?=
 =?iso-8859-1?Q?fd+nYSh5tKXH4BBuZiO6azFz2LprIt4+KFKZTCftb5pRZAL6CDaFXkYHBZ?=
 =?iso-8859-1?Q?OjlX/VaVHHkWpuM14G5YutjaEnVQLIcAFD+WqTS1hu7spb3W+CKPM+8EU7?=
 =?iso-8859-1?Q?sdCWMadCOuoYeE3FxhpFRHcsYiCsKoWdRU5GB3U7D3IlrfaezPkgNx4RL9?=
 =?iso-8859-1?Q?BcxazZaLVCMDfRBd+/cjBG/LFuYnAhAFfBFgPHa7t34eCPGTs30aqUd8N4?=
 =?iso-8859-1?Q?csDEh9w+QZQ8KTHmL3g41zX1k0kYGefCsoUosO3Lr1BaPSKiJruzx7cfsZ?=
 =?iso-8859-1?Q?y1VJ1hLcB8c4gG4gl6+Pfyb5kVzbfdfG9tDr/ke7iKVe2YUvKBXBGM4kKx?=
 =?iso-8859-1?Q?XORW4EPnGOCurMhjdfrECOmdDNUpHtOvNQYz6VwDthKTdt2vixg2IC3rb3?=
 =?iso-8859-1?Q?ori0jEIprYAtrRPbXSmFHJJfPntDHoQ80/vPst/aEEbP8SlMqPXsxoVXIe?=
 =?iso-8859-1?Q?SpD+RlcpZiUi8zkZp54koX1qhvCasH8VnQpvtGadiT+47yISmiDaTfTFvM?=
 =?iso-8859-1?Q?bj4oQWIIdmbzAu/aUuZj3Fwr4sTKmZlkQbTGktrjK8XwSIUyFzj/Gi6E/P?=
 =?iso-8859-1?Q?cnvdBOBnVbPlO1Y+n7aHU6PTXZj9wCNs+5DV4ejGzJRemqZzavBiFklHIM?=
 =?iso-8859-1?Q?o1SMxopMHrqEr6ZftEzC8ReJLyUqlGjafAX7F0jzkxvSFSjsleBnFPK3Mm?=
 =?iso-8859-1?Q?tFC7Oglvq/oGlxOTGMzxtAb3SUdxbgO0E68UKyXrfso72PO9Zx7Zba22Jp?=
 =?iso-8859-1?Q?xnrTcWaDfyY3DePjS9Hhc7ASnUzQ9ARBdAEy9PwazjgNWSVZ0yYeqz6Rz7?=
 =?iso-8859-1?Q?4V1mKlyeRtJEJyMPltDmxRS6cONCVgKwvUW5P2SJEY/IjxJd7G03Zqapow?=
 =?iso-8859-1?Q?Mvp4DWtrm4ZbUuVcsyJ4kvEpvu/URNBBRW7k6eoQ3WzNfYsmIY7rDvpUM+?=
 =?iso-8859-1?Q?p4LHAAPBJP0+GeqKopg+3ewEo2wvu2wTmXLJzULPEv01pFh8e5WK5rXSeE?=
 =?iso-8859-1?Q?PR8bW9uqFa4qW+JtxzocOjtCIpq9sEsK4pz3apseeN4zgJf3NTfHRKhSjv?=
 =?iso-8859-1?Q?lwlRs/88tYBbXmxIeunui8FQyP/M2YClAiF0g6Q0VYv079yO6oNZasCcVj?=
 =?iso-8859-1?Q?lhHSDvUGaS0p19diDX1JqooVtUfOlx0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ddff04-c766-4741-34b8-08de85586103
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 01:39:36.3810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMTAZCWmGd3nt/eoqSWTLMTp2iyc4rRVMKOoWkmrS850wAFxXCLOeSU6iLF4LjBZHZFJguMRF7MpLssUErT1G7xc/0aFSeI5fvAoJTifOhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9653
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7B96F2C4937
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:

> Hi Mykyta,
>
> Mykyta Poturai <Mykyta_Poturai@epam.com> writes:
>
>> Currently on Arm the desc->affinity mask of an irq is never updated,
>> which makes it hard to know the actual affinity of an interrupt.
>
> With this change you'll track affinity of hardware interrupts, but pure
> virtual interrupts still will not be tracked. Is it intended behaviour?
> I believe it should be mentioned in the commit message.

Well, that was blunder :( please disregard this.

--=20
WBR, Volodymyr=

