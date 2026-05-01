Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cc6Hzy29GmvDwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 16:18:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDCD4AD2B3
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 16:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298717.1573810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIogH-0006ZP-Bu; Fri, 01 May 2026 14:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298717.1573810; Fri, 01 May 2026 14:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIogH-0006WP-8T; Fri, 01 May 2026 14:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1298717;
 Fri, 01 May 2026 14:17:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wIogG-0006WJ-4f
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 14:17:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIogD-009dAi-4j
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 16:17:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f4b5c9-2eae-0a2a0a5409dd-0a2a4505b5f2-40
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 16:17:22 +0200
Received: from [52.101.84.119]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f4b5f2-aaa8-0a2a45050019-34655477325b-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 16:17:22 +0200
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com (2603:10a6:102:1da::11)
 by DU0PR03MB9126.eurprd03.prod.outlook.com (2603:10a6:10:465::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 14:17:20 +0000
Received: from PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e]) by PAXPR03MB7531.eurprd03.prod.outlook.com
 ([fe80::77bc:127a:5664:10e%4]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 14:17:20 +0000
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
 b=ii+pq10ayKs8KB6Fg6kqkclOn3jPk+nqrby1wd2HMXLOficVZge7TiJy+rWLM2De6YspOcQavQt7QHSAnT4zD4m8ofo8GBeleaA7wJD/z61tiKRiDkGrwMWQO6aBb41YvPt4OEdEcrO6DzA/osAGBX1314j+zX+GSmVO9lduVgWfHgrXbUpA3pX43S5YF0L8M47YjhkitZ+5JV1eyDHnm3IVUY7eHGRBPGW0SEnzXSyBHumbG/nT9mb44AgXJj16SV1dz5L+D+qhPLAHQXmnYUsvYIjPIkBKUjRMulAo5vOPZO0vo3qp278xN8uNhKyyUc6nArappsGPXNOR8jeu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFS4Uoz58OBCQEa7Qjp2XgT59HlgHljPSPD0uXJkA3s=;
 b=LhkPUWINUZemKpjvkUIuVYPvjCDSmr9K9Nvaf42RJnXy2IAwiOWw1CPzQf6moiFToJaVpHrPSi6vUODo/42XpJWEHm91ADwg3lQobrqh2CJ3vXOZq863sf6/eFSetipV+kDntT1VFbEXQXZpTGgP3oqzYDkW0mMum+uAQ7aTjsZGN6fzlhfJcrRNDq4cS8VSWSSsxNmaUoXePVTlK/TGlfdcAYXmHojFK4WPjgFWRCQP9qWw21kP6hjqQh7vVz3DqOLC7iUSUDb9G1OyOd0Y/JphX2kDPdKIn5PUl8FrqnqzzjKp831S4Qgt1IS0ZVJQsmq87O4drgvPG/HPnvldKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFS4Uoz58OBCQEa7Qjp2XgT59HlgHljPSPD0uXJkA3s=;
 b=P3CREPevDJL3I5Uja/DZxCdq38QHuHr0oDxvZh4ZGWisstxTIpBhUlW0sDgj8H7mQvT8wajdquaFJMefi0Y2pSaC+T4useSPtYgO2bhXMajhhXeZ18gMGVH4Xu3X0Cd2avcDHKGnCSVE/+XOvLWT3s5mjsVGyKFvXU4MznZ+G6tUW2qzcfJNkafRjVRAtcVK/Va429CFvCfwjHlFXsAeWhW1l0y15L7pHxrQRFSg3FTmknX6xzp7YbFUC+UvOACiekPW1TcQjW0dub4IhFvScnByfgHjd2nzD4HGysSql+ui8ukgw+3zlep0xLkGJhuVi6J8JjFkfCV5R9F8LLC/jg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH] xsm/flask: Fix undefined behaviour in avc_dump_av()
Thread-Topic: [PATCH] xsm/flask: Fix undefined behaviour in avc_dump_av()
Thread-Index: AQHc2XU4ZcEAsUoy1EuhfVMBY8DBFw==
Date: Fri, 1 May 2026 14:17:19 +0000
Message-ID:
 <43fc4b4ed45858b2cebbc37bbbf3b70e664a0661.1777642449.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR03MB7531:EE_|DU0PR03MB9126:EE_
x-ms-office365-filtering-correlation-id: c57c9c8c-345b-4109-c13d-08dea78c5b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 pkdQAbRYZyvQBloAaA5o0gRNQTEPg4eozlmOVb4aSuNzD/+/uLDfYoqoIv0vKQCJ1hAGJOAnoGpQTKX6AkrSbRPSWYoktbJEXbhFoY7VnYGMJKZ93sP8CjWr0xDTbeQ1CmpcDprEzSpyvb94XhN1XLBUrnuWKovxCc+b8eSv/64A1PhYz094LoUX8luAcGPitGKGmZJULrhoEyDcDUzNDhfJSNmtm/gCE3J9SA67fjvUzyIVWQ102MCs51tw4jss9z1uSZqSiXbshq9rN03ApxC2/+oln7YuFXG6dubwxoqWx+d1DcsY4xRZavyZ5kp4nLm27iNcSuPVPk9XgnB9i7SjmP5eQGDv77DlS5wemUaEsqdHfUxgJaDqOesO1BAZWv68RZuPzA/pFouXqQ2yvOvFEIcmj3W32AJYOBokSS+Gkt1/JWEmwlBUyd/8YkLt6NlsbC0wOLGj0JvXaYon56eqDz33n85etHSs9f71BTZxFeTMdS7/auQNoL7aStWewmmSBbBEe0+UKbSd3JE0+x/HhJa7VxljgaJ9oam1OXDxc0nJ+r3R6xxajGKP2F4kDcaPoYQjhrcltMk0yCN9N9sJMvzkDV8cFQlHG4JaWlyXDX6uy2WIl6TBGvS2f1EIA/bOZktdTEkDUXvCkxGdZPmwgmDwyo9/3BPfYaGkH+qzRBdT+xdi/HcI/1+IlCtzI3cb4HCRAJc5QKFj+PTtzp+G4uueKIGw81Fg7GSeV42CdwPuMgmPaiHUtyh0EG/r
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BVb7YGOib+Hkno32zbf/hbInhAJXBcmg1L0luA+v/TY+udfMAQxwQfyqV2?=
 =?iso-8859-1?Q?zSwox2MSa11bwBWi+A5b48vxgKWBtteqm1xEoN7VaWX04WHbHO0Rrs6OYK?=
 =?iso-8859-1?Q?CHbM0ReiNbRxRUfCHo1MvTXOd958mjNPuZbpmQ8Hink326KdJR6RaYxupg?=
 =?iso-8859-1?Q?pvbfj7nAd0+uUQX73R9/2qcUgaw2wRe69GhlwiorPT8gRcgp0mtdDPYtWC?=
 =?iso-8859-1?Q?EqLAaZWs+dAUnNMNu6z9NhOcWnZ4xSAhS+jdekASRpIonSYOMlHJM4PsKC?=
 =?iso-8859-1?Q?VAH5l2Zf37A7cyyiSVxnOA/oFzeIAwHIg602upYtgnbFkwb6Ns6x64PNrn?=
 =?iso-8859-1?Q?D1bSXwdf+Z47MQGoYhQ6gOIl4psRgtgHPH8ppOuJ7XGx0xmgDyqaKzbXka?=
 =?iso-8859-1?Q?FU6RMEIQSiV/sJhMEOrfimJyMtGPqi+iIug1hWFxcnvjkN6Z/qfZ1bvENm?=
 =?iso-8859-1?Q?gyS5kMCaX1hQzFVTlW5aQbn6W4mDoQqompeI8zL94Ul7NLqYHXytxpsblM?=
 =?iso-8859-1?Q?IopBsAw2c/CF//9xGHYr2nnIfNL+AQyjkR7mlpuArlvohfUjt0Mvb1W4nT?=
 =?iso-8859-1?Q?0AXtNQmsvqrsfiDMbR5zA0bDM5f164dUF27w28n19P8Tv5wAsRfrQDqLVo?=
 =?iso-8859-1?Q?0ir6rDbdiYKk/adSjOrLSKCgGIWgW/wboiP8sLE84P1jrnBg2k4HyhoQnZ?=
 =?iso-8859-1?Q?Jrein5/hn7jhQSc0ZhAT/mZUfKMDGgpW7Am2jR9P70B4MzooHp9f6/v0R5?=
 =?iso-8859-1?Q?4gqOnCdRi9aUOVRbg2DxJAHbhtDs2fI/BMRNAWREcPELc+z+dguepxcXkZ?=
 =?iso-8859-1?Q?N6F4lz4Jc92JZR/QjSe/a1oDqBw0CnBQT+5O6Y2RxDEaBHyrfk2YlxUiE+?=
 =?iso-8859-1?Q?2eZp0AnquPrwXGA1pwQB61sTb+nfMKbpKg6WmtNsENuAVr1YfeC9MyDo13?=
 =?iso-8859-1?Q?pusGK2N/0XRjiPT0ggJsXg8XRLrOOeRZwKK1s6iL+lDpA+kcymhdFNyb7k?=
 =?iso-8859-1?Q?noBE4CGLTdgikYmMYbCWEtstHcijEJkM720n2BRHAaNdXt16PAv6Z6u974?=
 =?iso-8859-1?Q?r0Y327tHdFo+fC+Qe9ZFRk1+jf1YIL58yy/Pzt9RfZRR7KPB+CLP92zgVG?=
 =?iso-8859-1?Q?v22p2UM3ZmKsvO2Ih7m/2SDYJ/3ViFm/UjK6RPGGVeiQgnoa44gunqW739?=
 =?iso-8859-1?Q?yVviO4sfI0/VUrcxlfAnEqGh83ooPFYgaFBLLJqaKrkjJHVxCFtDoIMQoP?=
 =?iso-8859-1?Q?ad3pfd4VvWr30tj+Dwh4J5Nj+MR5+zBEwHSCHa9wA+7XEu1xwlCfL7es8o?=
 =?iso-8859-1?Q?2NVYvI6aksNqkCgzljrHN2sEMj81+7D8bEkDrXdY/nZg9cZPAyfvwcgMHu?=
 =?iso-8859-1?Q?pQayeQB95mXlOBFkc5r1Vxul14wOMrxmsMhc2RyD9scIgJ4FZ+Y/AD8ZjJ?=
 =?iso-8859-1?Q?V+NRYe1vAZ1gYL6s4Oyb5mW/i1KoIJd8CagDizNYx5lSfoVvg7TqBE6T5q?=
 =?iso-8859-1?Q?JcH86DYwe/5H8z9SvQB/He2/PYZCsdVw33FaLp3Dpp9nh6HCTh99ivp0cE?=
 =?iso-8859-1?Q?uIKa6j4Hpy9WT0PCNP2qQgyMWYbBY7yRsiMzZOSe5bmCFMNsqUNn4/KEqM?=
 =?iso-8859-1?Q?m6y6hCrG6AfIBzpV7jd7daGWKqKXy/0HBVA6ZaHBFkLEFMPnuo0e8z5azm?=
 =?iso-8859-1?Q?q7bIK55WaQGf12XaulvAShYeiPfuXP2uTfvCaVVD69y0WmSL0V4cvNqyOm?=
 =?iso-8859-1?Q?IeowPCDiPekfutcXHb2E+DfIHD++pOv6CTZ9PraigBwH4crC+AqndL3Ee8?=
 =?iso-8859-1?Q?uK4uzEk3wPR5LvIhpRnisenIW+PRUEA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57c9c8c-345b-4109-c13d-08dea78c5b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2026 14:17:20.2157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76zOn3VIGr115XF5xSu33mBdTalXwEsgU4QVZfUS2ROiMXzhB64Nxs8v+txsQLCVRYjeLRKu+tc/M82jw+hPy0zqKBlx5K3FiRmhr6cng9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9126
X-purgate-ID: tlsNG-c201ff/1777645042-2BD67443-91B88523/0/0
X-purgate-type: clean
X-purgate-size: 2127
X-Rspamd-Queue-Id: CFDCD4AD2B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

When booting Xen with CONFIG_USBAN=3Dy and CONFIG_XSM_FLASK=3Dy,
UBSAN reports undefined behaviour in avc_dump_av() due to a left
shift on a signed int:

(XEN) [    1.104348] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
(XEN) [    1.105096] UBSAN: Undefined behaviour in xsm/flask/avc.c:184:14
(XEN) [    1.106052] left shift of 1073741824 by 1 places cannot be represe=
nted in type 'int'
(XEN) [    1.107546] Xen WARN at common/ubsan/ubsan.c:176
(XEN) [    1.108295] ----[ Xen-4.21.1  arm64  debug=3Dy ubsan=3Dy  Not tain=
ted ]----
(XEN) [    1.108848] CPU:    0
(XEN) [    1.109147] PC:     00000a00002f64fc ubsan.c#ubsan_epilogue+0x10/0=
xd4
[...]
(XEN) [    1.146320] Xen call trace:
(XEN) [    1.146663]    [<00000a00002f64fc>] ubsan.c#ubsan_epilogue+0x10/0x=
d4 (PC)
(XEN) [    1.147227]    [<00000a00002f7bc4>] __ubsan_handle_shift_out_of_bo=
unds+0x1a0/0x290 (LR)
(XEN) [    1.147868]
(XEN) [    1.148177] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This can be solved by making 'perm' an unsigned 32-bit type (u32).

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2493649109
---
 xen/xsm/flask/avc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index 3d39e55cae..9c3ffdc070 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -152,7 +152,8 @@ static void __attribute__ ((format (printf, 2, 3)))
  */
 static void avc_dump_av(struct avc_dump_buf *buf, u16 tclass, u32 av)
 {
-    int i, i2, perm;
+    int i, i2;
+    u32 perm;
=20
     if ( av =3D=3D 0 )
     {
--=20
2.43.0

