Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FKvAJJUGWqYvAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 10:55:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B55FF958
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 10:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321839.1588330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSsyG-0003gA-Ek; Fri, 29 May 2026 08:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321839.1588330; Fri, 29 May 2026 08:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSsyG-0003dq-AV; Fri, 29 May 2026 08:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1321839;
 Fri, 29 May 2026 08:53:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wSsyE-0003dk-5G
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 08:53:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSsyD-00Ejri-EM
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 10:53:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a195408-e002-0a2a0a5209dd-0a2a4501ad68-22
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 10:53:33 +0200
Received: from [52.101.66.142]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a19540c-c1f2-0a2a45010019-3465428e598b-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 10:53:33 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAXPR03MB7611.eurprd03.prod.outlook.com (2603:10a6:102:205::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 08:53:30 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 08:53:30 +0000
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
 b=emWDsxZuco8iSCVwu+3etZnkMVWaVUITz9mYlXqTv6y8cnXL8iYnUtg03J2dURkG1gREpvtE5A2Fp8MnhEdJRMabtQP82SKOrR7uds79/Pq9vnoyq0cTb/TuqLOixP9D49iI/+HKDBT+KxyZd+bXLoWGs3PIU7mivLRv/FiFjqc6iI4OoeUikmWJP3yZ9lyMfj90AwujY/y+KE6fqmArZL3q5chP2nSPLiWcEsuY7HdypkPEqAOzjj1ofJ07tmPs9ZPMgzM/fjCG5vTK5Vav5CNC0w6tNDKdU8RTpXclvZwhNXsRIE3VJgqu8ZUVfEqOtitlKhgG3sL0wcIhqZBYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO+jFzbod4C+pyxXBAyfbVnLWIu9dPiLGItqyGWQf8I=;
 b=OqXu0kHYE5GmGrVYF5JEqqVc86DMQFYjV5nF8bptgXPRgK0BVNW1OmAR+m2gSUG6p4IzIvVwr0ifx/vwNUViu4q/ip7oZaA2AL85Hq3/VBFdzd5ls4qs1kdW9eyBGFcwmdq7hjk3YAabBpNXCWj9nYENfXh36a7ecEK7e7NC6Gruj7GqKjgWqqYRHQfukQooaUy41z6b8s0ER3Mzgzxbiw5dyBbKibxdZ1NF0iE4EhRCjD863RJiCPf6fWdwwcCrpf6rViasIZEkMNZjNdGO6VuFnXiuvgtoFeGnBWEgExX5KMCVlyMTOk4Cs4cGXbdetXcpWlJsEQACkpxkzZKEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO+jFzbod4C+pyxXBAyfbVnLWIu9dPiLGItqyGWQf8I=;
 b=g/1xYcY+ksExziOf/a9JFkbThUQ1rx2UK/vYqmNXqOIb5DjkwAs7gzoKNH5yBnf07m/P2QknK4Xm5Ph2Uj1GB3jmhZestyiuo4fLB8/UPF9aQ5QsLhprBz+QP+VWV7SedG9bY80ZpckHBOl/90JtEKnAVhrE2zj/DVjO8sk56DzpYOP1ntluHBkrarFY2YrWa01HJ1+2U+ZcsJceXxNBByu6vDL62f4xqEX1NJqPUDDLxaaVZAykyotgwP4xh/cRByRZE7P9hzch+8ZKwWBAXhv3+IjSQYBZdPfMaOjKzR0eYGnWRpexf/RIqbWtiIMORUqUXmeGD9BiqsCyrYl7PQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2] coverage: place GCOV-generated .text.startup section in
 init text
Thread-Topic: [PATCH v2] coverage: place GCOV-generated .text.startup section
 in init text
Thread-Index: AQHc70ifTHJ2JaDHW0i9kIm+tvP8Mw==
Date: Fri, 29 May 2026 08:53:30 +0000
Message-ID:
 <fb154ba84ed01a060c6617194080d7cd77f9144d.1780044400.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAXPR03MB7611:EE_
x-ms-office365-filtering-correlation-id: 6af49936-85dc-49a2-e417-08debd5fc1e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|18002099003|38070700021|56012099006|11063799006|6133799003|3023799007;
x-microsoft-antispam-message-info:
 eU1Yr5BoRpmP2oFcdeLoZvFyU6g0hp0MGh1Dc3VpUsYuau4k9KtztegyVmvJ5wYz1hfkVR5r3+EHSDGraRoRGnkK54UKZLfH8dPcjA1zEZtVaUG6XrYALibKz2Y8l3Cj9l/ZnC8/QQONlPn1PKyHkYua7aFMx3/dqnTe905jUUXJKCDLlraxaDBadYr4gHmYwMen/9TesjgixWhxuOdhsorknrIh0quyItx2r+Jz+TPtnOEaYRk8Ta4HywqEkSCRak1nDp0ZhB2LwtGFigxY+NbTCBtaI1RFag6oU5VOcJ1+ekQLcutknjCv+3oTySiMfCFZ6JdkE90VjUZ38hQ/YfOGPMLG4JkEyYOfo6nEAbVgPFWOUV72KkRyGZHE7kRsTPmSBUb2vNUllg4FnG+g0v+zbcd7/QMNUMOLHNcdF1l7hVPtyRkx+vXkfcrB1la0oaQewkofqSAVt1nL6Bo1U6hECtChYYx8elhLkjIwct0Qkkej/AGLPq73uKv40vCniJAglihFcCqCgmLU7IVQaj2xLfSq8Nzb6XG6Mn9pGhI+gyw9iq4zRuVeOQpi0IwM6S5jQ/uRaCrxWz+Zsg37cSKUzKKJ+o4r7ong6l3/NJdcZbmeL1cH3iON9zY5guD9VYVhQ+YkXuX80p6iOqhVlvea1XyN37TSW5v0t+evYeJOzxtp9lemlMwGH5D3YUHsAFJ9MM7vggjahiA1NnZzkQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(18002099003)(38070700021)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?t/TNL0RmqIw3SAIJsPf7UdaeLj9fatzx/76p4OE/4GORQSBUetazLWkiEZ?=
 =?iso-8859-1?Q?OARp8tWJyOG67l/yBWAtYyNmdwVNIRljCxvs1/WgPsO+yUKg73sQw2fR7h?=
 =?iso-8859-1?Q?fQZlPh+UnjDgeQgN9XTon6EmUES4acC8ZeOFX/p5bbslOWq0r891qKm/Xy?=
 =?iso-8859-1?Q?RyLM2yCJ1hCb1JfVfl13zqBOCC/NyW5COy0rdz/DcHeYopgdj1EUERjkr/?=
 =?iso-8859-1?Q?4YF7/l9+CwvCBdimC8N79FYsVF4Novs9flI6qCVK6jE4Zw3l6By8H8WRvT?=
 =?iso-8859-1?Q?w0fv3p/rcmwC/kkCw2vQKu8bGtOITofaO3Ul7ZVq2kyo7ZJugC+6x8RgY4?=
 =?iso-8859-1?Q?DhPndx6EbaPBWNUnLonkBMmFquaE9iqKPkqRVhTxDVgGNXXAukBGEiEcde?=
 =?iso-8859-1?Q?TZXh4L0sboKw6n/dDtquWCIj9L5jdsS9pPX/nnh1NAP/B65dq2rbY8m75f?=
 =?iso-8859-1?Q?mFP9/rMzxpqNyWrqWmEUsv+6ldrwtx4oh8JhJPL5iCZjvOLnpoPgWncRpV?=
 =?iso-8859-1?Q?BJceUCWqFhfM8k8hyqtD6xT5F7K45sBirdAGnVXtaL5yIpw7L5uKTUlIyV?=
 =?iso-8859-1?Q?r02025wQPdu696MNG/KKrjLSevz/ftqENAQKvGsgpTYJ+AEnSKmrXiWPhu?=
 =?iso-8859-1?Q?DPeBsCcHwjrjH1+aHCboEzAD9KqZJ1TvVy0xvvSwZ7PLZjKv99gnakI4BD?=
 =?iso-8859-1?Q?zEmN5iwhwgICUPQUtPyFd9mT4Hmx4uCpIvD4UIJxzfFfBzbUrofFcR1Ll6?=
 =?iso-8859-1?Q?sqVzXeN8Usd8Cp6LrYI/o0MEtEPkcl5TK8dnwTpX9BvUOf3w6rNWg6zL+x?=
 =?iso-8859-1?Q?R5Wh5n4hdEUSce85Pp+DxXrAnwFJX+xRXwOHmlOMcT2M7NP05nwfkvBWKh?=
 =?iso-8859-1?Q?f9uuSkrVFXz5Idrb+8os8nglu3GFYyv50UAT51m734WC1SLgafvk9Lwhfw?=
 =?iso-8859-1?Q?lg1HC0Ix7FAdAD9kQJlOLh+ImK7djXTs3M4pvV9s8kt29JcUGG/B2sSb1E?=
 =?iso-8859-1?Q?YEdf26Ng0g0vt1rQHAY5a7hPZaODfh1/X0bmUrFrNf/wJq0iJMrKVi8qJ9?=
 =?iso-8859-1?Q?Q7u/Pg2TtKec4/an7E+tyGKiglRAONNx+JdlcfZOLMeGlaKvy9uHGTFbAm?=
 =?iso-8859-1?Q?2msrjBGwQ5Ly3/FyBaXGQBPaRoD2en0F14NBifX5Ogco09fRQKPxN2ltwX?=
 =?iso-8859-1?Q?iexCxj/UwM+mL6OHJ7mqcU+KWl+itccz/lC4bZXEMRuj/IaRKMFDbMXdoB?=
 =?iso-8859-1?Q?2DRQkVLiJGkHELVu8sN+bMW5e94ky7XJe4Cj/bYyGsCBPpA4+vsH19T/ic?=
 =?iso-8859-1?Q?ormXgOq05hPtxidrcCqvgPKfjU6Mld6reTbK9hdkLWu+g4uV/w7VsHVg8k?=
 =?iso-8859-1?Q?yNFvT10HGAOSDwg27WAMbruasstWCUPHU57aN8/NaoopHBPyee59OJ60qz?=
 =?iso-8859-1?Q?MV2fvAoQxxOJyoERvJXxfwAl9kCM9PGesF1nASZ/7NvAdsxsMB+3koMtVQ?=
 =?iso-8859-1?Q?EFjPYYssH56w60oLjrgI6J3JpU4OJ+irdnxbuUdgYFv9abXxppwkLvHo9U?=
 =?iso-8859-1?Q?dL7Rlt6OkYgEcdogCESsMS82bqTOuwf6Z7aHckFbZNHF0snxV5zgBEIPBY?=
 =?iso-8859-1?Q?XvZnQT1cuKPZGZ5O7DaF30VibdfNL+nbCUtK49jXJwTdOfNA6ZXQnvHyGU?=
 =?iso-8859-1?Q?8x7opSeBCbJjx3QloRfpG57aWRqPbGY9Xsv5CCy319oGqsBFSyHYxmkEe4?=
 =?iso-8859-1?Q?Ih5SioBPBqZ+xzlk1DMasl+/zEsv/NU/yPGAZfLdqYuN72/d7GAavhogtS?=
 =?iso-8859-1?Q?9UI00nayRAg8x8ml7rShDUQJHFdlcjg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af49936-85dc-49a2-e417-08debd5fc1e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 08:53:30.5554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xR+gqBsb2OHbxHP7OuxkzdUryULqVzx5rAZx+UEw2EQaF66Px1TXO+tgmt9VwJSSGlnZxqXCr6I5er+jpEJzk4rOb28EYOTdYdDJAT/zNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7611
X-purgate-ID: tlsNG-d62444/1780044813-B6F58FF4-3CEDCE8A/0/0
X-purgate-type: clean
X-purgate-size: 5499
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,raptorengineering.com,wdc.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:email,epam.com:mid,epam.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3E7B55FF958
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

GCOV instrumentation can emit executable input sections such as
.text.startup when CONFIG_COVERAGE is enabled.

At present the x86 already places .text.startup in .init.text,
but Arm, RISC-V and PPC do not. With CONFIG_COVERAGE=3Dy .text.startup
can therefore be treated as a linker orphan on those architectures.

Constructors generated by coverage instrumentation can then point
at code outside the normal RX text mapping, leading to early boot
crashes from init_constructors():

    (XEN) [   12.331193] Instruction Abort Trap. Syndrome=3D0xf
    (XEN) [   12.334253] Walking Hypervisor VA 0xa00003ce000 on CPU0 via TT=
BR 0x000000004352d000
    (XEN) [   12.338550] 0TH[0x014] =3D 0x4352cf7f
    (XEN) [   12.341823] 1ST[0x000] =3D 0x4352bf7f
    (XEN) [   12.345124] 2ND[0x001] =3D 0x40000043527f7f
    (XEN) [   12.347329] 3RD[0x1ce] =3D 0x400000433cef7f
    (XEN) [   12.351233] CPU0: Unexpected Trap: Instruction Abort
    (XEN) [   12.357643] ----[ Xen-4.21.1  arm64  debug=3Dn gcov=3Dy  Not t=
ainted ]----
    (XEN) [   12.360243] CPU:    0
    (XEN) [   12.364098] PC:     00000a00003ce000 00000a00003ce000
    (XEN) [   12.375835] LR:     00000a00004802f8
    (XEN) [   12.378273] SP:     00000a00004c7e10
    (XEN) [   12.380492] CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervi=
sor, handler)
    (XEN) [   12.382785]      X0: 00000a00003ce000  X1: 0000000000000000  X=
2: 00000a0000410fa0
    (XEN) [   12.385176]      X3: 0000000000000000  X4: 0000000000000010  X=
5: 0000000000000001
    (XEN) [   12.387555]      X6: 00000a00004e5f40  X7: 00000a00004e5f38  X=
8: 0000000000000000
    (XEN) [   12.390027]      X9: 00000a00004e5f20 X10: 00000a00004e5f30 X1=
1: 00000a00004e5f40
    (XEN) [   12.392510]     X12: 00000a0000439748 X13: 00000a0000406938 X1=
4: 000000000000062e
    (XEN) [   12.394954]     X15: 00000a00004f3918 X16: 00000a00004c7bb5 X1=
7: 00000000004c7bb5
    (XEN) [   12.397293]     X18: 0000000000000030 X19: 000000000000001d X2=
0: 00000000000000a9
    (XEN) [   12.399803]     X21: 00000a00004c8008 X22: 00000a00003fa000 X2=
3: 00000a00004e2000
    (XEN) [   12.402392]     X24: 00000a00003f9390 X25: 00000a00003fa000 X2=
6: 00000a00003f4ca8
    (XEN) [   12.404798]     X27: 0000000000000002 X28: 00000a000057a9c0  F=
P: 00000000bedb6740
    (XEN) [   12.407110]
    (XEN) [   12.409442]   VTCR_EL2: 0000000080023558
    (XEN) [   12.411291]  VTTBR_EL2: 00000000bffc4000
    (XEN) [   12.412895]
    (XEN) [   12.414204]  SCTLR_EL2: 0000000030cd183d
    (XEN) [   12.415928]    HCR_EL2: 0000000000000039
    (XEN) [   12.417642]  TTBR0_EL2: 000000004352d000
    (XEN) [   12.419152]
    (XEN) [   12.420327]    ESR_EL2: 000000008600000f
    (XEN) [   12.422056]  HPFAR_EL2: 0000000000000000
    (XEN) [   12.423809]    FAR_EL2: 00000a00003ce000
    ...
    (XEN) [   12.485355] Xen call trace:
    (XEN) [   12.489080]    [<00000a00003ce000>] 00000a00003ce000 (PC)
    (XEN) [   12.512076]    [<00000a00004802f8>] init_constructors+0x38/0x5=
0 (LR)

Observed failing symbol:
    _sub_I_00100_0
called from:
    init_constructors()
The issue can be diagnosed by enabling linker orphan diagnostics or
generating a linker map:
    LDFLAGS +=3D "--orphan-handling=3Dwarn"
    LDFLAGS +=3D "-Map=3Dxen.map"
and then inspecting orphaned executable sections such as:
    .text.startup

Place .text.startup in .init.text on the non-x86 linker scripts,
matching the existing x86 behavior.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- do not add *(.text.*) when CONFIG_COVERAGE is enables
- copy the existing x86 linker script behavior to the non-x86 linker script=
s
  (put .text.startup into .init.text on Arm, RISC-V and PPC)
- update commit subject and message accordingly

Link to v1:
https://patchew.org/Xen/cb8c1e0862a554f7a28347f549e9cfd0b0d6db2f.1779829545=
.git.dmytro._5Fprokopchuk1@epam.com/

Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2561258404
---
 xen/arch/arm/xen.lds.S   | 1 +
 xen/arch/ppc/xen.lds.S   | 1 +
 xen/arch/riscv/xen.lds.S | 1 +
 3 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..4aab7770c9 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -125,6 +125,7 @@ SECTIONS
   .init.text : {
        _sinittext =3D .;
        *(.init.text)
+       *(.text.startup)
        _einittext =3D .;
        . =3D ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executabl=
e */
        *(.altinstr_replacement)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index d0f2ed43f1..de3aad0aae 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -98,6 +98,7 @@ SECTIONS
     DECL_SECTION(.init.text) {
         _sinittext =3D .;
         *(.init.text)
+        *(.text.startup)
         _einittext =3D .;
         . =3D ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executab=
le */
     } :text
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 65f136dce9..c6f765a1c5 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -103,6 +103,7 @@ SECTIONS
     .init.text : {
         _sinittext =3D .;
         *(.init.text)
+        *(.text.startup)
         _einittext =3D .;
         . =3D ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executab=
le */
     } :text
--=20
2.43.0

