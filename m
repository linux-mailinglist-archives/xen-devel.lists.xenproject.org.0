Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBFUEPCJsmneNQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:40:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D126FBCE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251868.1548705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW0-0002eq-Fs; Thu, 12 Mar 2026 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251868.1548705; Thu, 12 Mar 2026 09:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW0-0002bl-Cl; Thu, 12 Mar 2026 09:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1251868;
 Thu, 12 Mar 2026 09:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOdu=BM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1w0cVy-0002bV-9E
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:39:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f96c4e9-1df7-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:39:32 +0100 (CET)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI0PR03MB11417.eurprd03.prod.outlook.com
 (2603:10a6:800:33f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Thu, 12 Mar
 2026 09:39:29 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 09:39:29 +0000
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
X-Inumbo-ID: 5f96c4e9-1df7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbkA9KjVziARf69ofAqkwQiX3ZbRjhzNi67pgsBQJrjkq8TS4bjqyCcO47/GefOYv0pncXHK/W+Gi438OodLA+i3d5lQlzB6lbTZ5drGaa0grPCY7cv10d9ar05lCy05Z6rFls23B+JuKkVbLyglKFsjbZnErd5bdu1i15PBp3hKz61vykdhcYVzoxMEu6jJThoD9+8h8s2m1CBBkIXt24vR51Gqsxo/Y4qQGtxTP9HL/ofWvSrDBtzS7rri8tD+ToixJYLhKk1hpKTtzFJaHfo6f/FKRL+NYCzCOpvn7hxbno2DsW/9D3W2lrWnbP9SrxaTAc63EtALEYQrZ+1XGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h1bJ1/tUn7joR6dHEgZAHXjj+b/8RL4Td4YS9QK0Eg=;
 b=NV2xCkIqILWbjr2ivSLTwC7mf6AZxsU1KPk+3/0foci24hniPfrmKwK8797SXmq23o+lYh+H4SY9zO5X46qA903MjPnYeJ4M8PDRH+GiimYaYGnr3Sl/8tEw2mK4CYGX8BXnkdDnALw/tmypgdbI22H7PcLlODi9XOCdxRg2zNLLXXgnGIVuzXVN45peesS5i7Ye9FW2HM2NxZ69qOAedwcEhD0lt02FN8Pc4H1aaOjjnaWal5eBeCru/4fWjelMpnYli8ib+A2B/5wCN3dZyw7lV6JXE9Aiuf4fLICHDZZKWN+7AybfqOjLll1mgk42sOEbvLnGBgrKvf0f8EskIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h1bJ1/tUn7joR6dHEgZAHXjj+b/8RL4Td4YS9QK0Eg=;
 b=NGL0LPiL4jjW7SIqtuYEAfWGf02GPkDBd9APSvBFTMNtF/QiTjcJqcNIC2HwZCy0kQvmtOh96yYi2NuUyaEhZKPwZWEzqdZoGXZ/aSqM/Lfo9X5Jy/9UEiNl2FwP7krwM9jkFuXeKxG2sj3CgyuNqgqCiMfXK+iN8b5wshBSrbPlNZgsYg1aNE3bVtV+4+WAXZpCzoCJPV9+4wIhwGF3/J9wqcwle1Q9rDlBG4ZdYECy864VYtJSmiTISws7+5bH0uxPZOmb3gyDBO3QPNalYkNv+rYR4NM7vJk++aVkzks8o4J3m3pfkgHgF9ySlg73FQSaottxk3Ay5Kbpe/zC+A==
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
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v6 0/5] Implement CPU hotplug on Arm 
Thread-Topic: [PATCH v6 0/5] Implement CPU hotplug on Arm 
Thread-Index: AQHcsgQf1/22PGqzSUaxhkScWwfAyw==
Date: Thu, 12 Mar 2026 09:39:29 +0000
Message-ID: <cover.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI0PR03MB11417:EE_
x-ms-office365-filtering-correlation-id: d6c1536e-738b-49ac-a853-08de801b41f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 VK7j1nq10PonOFXwy81wZhiJBf37hOaXWIYicX+Sji8Cep8AKVdwM1Gu1Xo75XtaG7ZLcZtAF0R1NU6PoP435YVMX0LDXvBV1mpq/+ur0Xrytzg651RT5+51KTXyYEZ1vdoX0CszN7DbEP1Uz1tQF44U1UpCvYYC1v2JzIbxfRUC/F18b2qM2NgNF+B0XYWWpjM2HmaPo0z/znrPid1qW1BfiW4e4WxpRl818cZ+fHU4Jkm2yuWmZUASA8M+7xGSaSUYIRVOrj2MhUsFceAKT228dDDBLAdqFgNE8ynLWOLlHcmZtJE0x8L68Eo/1fzZrRy+TeM1l6FUudkLILITT4jbFoALBQJNnuhSShjvgbHfBDMM3OtFf/645FAyTcIDIugiYOkG0QSeOUBBWhs5aaH7d/ryBYRjnvqxNq8AETs2Vg8TEqFNYNkdyMTYIwHlxQKiNqGQrxwR3bcaQ0f2eUeGyRGDZl0n1d4JebGc2IemFitpxDzrDqjSfaJkQlm04h1X+PNlorayovsi8JPjDHzQpUp+GA6MQFIhewKREYnj2snfRNW/7SNOwE2lEL+5mU3/agXJwjnA9hZVHDttP6j+YFHvC3x+VveRlyDg6nqIRUBTclStqTxkycQcetHcJHu0JSV+Tedsrq9QEIiOBJXdOA9vgjxebPsqZUHCMXjJ6uZ1G9fis7puC7Y4KJxr2ze1alPZu5NMntZ3s99lRHMX35xjytzE9YhAyozYHuRtMuM2ywbR42V8NOm8bI4FQb8rrvOufLTcH4Y1rMQn0OKToCeFB3m+zReDQIG097c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5oa7z1DZpUYtoPf2GcsI4aUfPROHr8uTjNkH7mrlms7ED56mQV92eDai/Z?=
 =?iso-8859-1?Q?BkdwDTHuIUBVK6m6bwfJi182Jbfmuzgn0P7WzuJglG+FjN4e7nsUT0GFLe?=
 =?iso-8859-1?Q?hVqlFAEc+aDtzzKVQsT549Sc3RcMa55JqxyY1fqIsc4OwlCkFQoGaAwCqR?=
 =?iso-8859-1?Q?0D6Ix76vsgL05pqvOF7sSMtrVaM4q5bzDzQX/vSLwbSwbtCO25J1cdWOBm?=
 =?iso-8859-1?Q?9Xm5UroY4IqS/WCAfB6m4L/8xqQ8hjKeVq9766Pftu10blI1wUp2g1i4cK?=
 =?iso-8859-1?Q?EhZGbKhbBE7TGYKEZPNY9PhizLrB1SjAxJXtNiyu/ryrYTohCC1G/gaZCK?=
 =?iso-8859-1?Q?OMZubm5rbf9LpHxnQrUb4/GBFQFQY+ZfF+s8uQkl5LaJ9btmJeXFS9rmqY?=
 =?iso-8859-1?Q?9Avmp5mRFk083w3IbDJjSyOYXsFST2M2dy2DIORhvZyrCFT5R2s6NlBJWU?=
 =?iso-8859-1?Q?JEZC3JEMgvFtc2VHjCkfK9AM6hbtH6g8H2VbOF1/CNubkq6hfx8D/k30Yr?=
 =?iso-8859-1?Q?hSu7grgpFqSTJvoA4CSXOzUvhYlL2RSXNAIw/XNuHdXUXOn+F+h0o7BAAi?=
 =?iso-8859-1?Q?7KL5fmMTZV+otUWBtW4VCfB1y7/m7vVltY0z2Dd2/vicVkVsqcOvM7LSbr?=
 =?iso-8859-1?Q?f+E3AqCdxzWwu/sQoHSg3tslX6OqbhGOPTUHWuJQebsn2RNTZNct43g5i/?=
 =?iso-8859-1?Q?p+3ThCbwNf/iVlS5ft47dCX8m//ijExu8ij6oHnd/UNoN8S/bc5ypQtMBR?=
 =?iso-8859-1?Q?K0IvNbQO3XBDD1Aq101oyFRmMbSBAv+7PyO0LaJ2ILc0PNDO5Cop0x4i2p?=
 =?iso-8859-1?Q?y0W1Z//aMRPNJjxth4kbPiCdkUC7XhV92tiIfw5XIKILWMt5q0RkWGp96I?=
 =?iso-8859-1?Q?aw94dtVTuJFG34ofFXmRZTJl6cQlI2BsAPLfdd4efQ5j/9kgBGiOUZWXou?=
 =?iso-8859-1?Q?NSI58Cl1/hoH5NDAfYizp3G4MaDb13xRFD5G+s5Emyde/kmaikS0o4RIzA?=
 =?iso-8859-1?Q?nOgFu3I+UUxcy3pbbObqh9b7vmnzni8z9/h4m11JMV/ZaSBVp0EPhDj3/K?=
 =?iso-8859-1?Q?Q4Z3wM0J2F+cGyuLfo0O5E3IBuuDKyiz9IpqoAu3Y1YsV20k41ls7janDa?=
 =?iso-8859-1?Q?49XCT1grqdC8xLiJZlMRRDGQw1E3bmofFGmWDDyNgbFsmjx9E+jGXOrzD5?=
 =?iso-8859-1?Q?s+c2/p2JfiexiblDO2q+oIn+eaoDNIGek4rZs33CbtlLHuh0/+HLCx1+h/?=
 =?iso-8859-1?Q?lGBSXcCS0N0vY1T7cMvTcFay4O9LVwu7AB1+rIISwOTnVwWUhsigm0eg8E?=
 =?iso-8859-1?Q?0EIoXcl4s0c4UFGP0ChPByM4IWGK8P1lXkV7jOv0VUeGwAFor4IkYfFxTM?=
 =?iso-8859-1?Q?1JF8i36/OGvFKGPAFKUDL5vZWKx+FqSoaOi2YiBwxvh+eFg+D/ceOG1DOu?=
 =?iso-8859-1?Q?/L1p8agwXLgmJrQEmAhW/pJ7rPwRD14NMh7fpEEFoGGw3hyNH2ZlqWu/WP?=
 =?iso-8859-1?Q?6CnXCI4mQClK1QLYBLlffCYEQzlCQS8uKBaQ752MkYvS9zQ8/WaWnMTaWK?=
 =?iso-8859-1?Q?4yHDtnTZ1PLKZydqxttiAIbtNER+E5Tu66ZXK3yFmFAGV9fCJI0h3ko3fq?=
 =?iso-8859-1?Q?h/if12WyuvQ5pnwZNM7FZ116DCOgQrobb0rFMpcXbxv5tWrOj6whWPjoo2?=
 =?iso-8859-1?Q?uzJBarbqgvrg3rIxOF4XVE8DCHmucivNxLGUkOF4cBF6A36cDEVaXKI4GQ?=
 =?iso-8859-1?Q?r016eTQA8cqzOXhTxG9agsKYR1wIuS2Fi2yB9aZE9WvPx+rSrPvrloRSnt?=
 =?iso-8859-1?Q?WNSAxgVcfdRh/+BaNY85aYJDKKnWgto=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c1536e-738b-49ac-a853-08de801b41f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:39:29.2000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bypMesatOo5iUQxHPzeat9R+xoP3+7zEzqdUanOLZhGBY8wI5De3VoUOjWH0vaO6zLd7ia0jj2xlOwyB14dACA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11417
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E85D126FBCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented on Arm64.
2. Enabled building of xen-hptool.
3. Migration of irqs from dying CPUs implemented.

Tested on QEMU.

v5->v6:
* see individual patches

v4->v5:
* drop merged patches
* combine "smp: Move cpu_up/down helpers to common code" with=20
  "arm/sysctl: Implement cpu hotplug ops"
* see individual patches

v3->v4:
* add irq migration patches
* see individual patches

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (5):
  arm/irq: Keep track of irq affinities
  arm/irq: Migrate IRQs during CPU up/down operations
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 SUPPORT.md                        |  1 +
 docs/misc/cpu-hotplug.txt         | 50 ++++++++++++++++++++++
 tools/libs/guest/Makefile.common  |  2 +-
 tools/misc/Makefile               |  2 +-
 xen/arch/arm/gic-vgic.c           |  2 +
 xen/arch/arm/include/asm/irq.h    |  4 ++
 xen/arch/arm/irq.c                | 69 ++++++++++++++++++++++++++++++-
 xen/arch/arm/smp.c                |  9 ++++
 xen/arch/arm/smpboot.c            |  8 ++++
 xen/arch/arm/vgic.c               | 14 ++++++-
 xen/arch/arm/vgic/vgic-mmio-v2.c  | 11 +++--
 xen/arch/arm/vgic/vgic.c          | 15 +++----
 xen/arch/ppc/stubs.c              |  4 ++
 xen/arch/riscv/stubs.c            |  5 +++
 xen/arch/x86/include/asm/smp.h    |  3 --
 xen/arch/x86/platform_hypercall.c | 12 ++++++
 xen/arch/x86/smp.c                | 33 ++-------------
 xen/arch/x86/sysctl.c             | 21 ++++++----
 xen/common/Kconfig                |  6 +++
 xen/common/smp.c                  | 35 ++++++++++++++++
 xen/common/sysctl.c               | 46 +++++++++++++++++++++
 xen/include/xen/smp.h             |  4 ++
 xen/xsm/flask/hooks.c             |  2 +-
 23 files changed, 296 insertions(+), 62 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt

--=20
2.51.2

