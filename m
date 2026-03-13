Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HQzCKv4s2nYdgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:44:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81317282686
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 12:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253571.1549742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10wL-00062R-3f; Fri, 13 Mar 2026 11:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253571.1549742; Fri, 13 Mar 2026 11:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w10wL-000609-0T; Fri, 13 Mar 2026 11:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1253571;
 Fri, 13 Mar 2026 11:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q06f=BN=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w10wK-0005zu-4E
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 11:44:24 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f997c11c-1ed1-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 12:44:22 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU5PR03MB10219.eurprd03.prod.outlook.com (2603:10a6:10:51b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:44:17 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:44:17 +0000
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
X-Inumbo-ID: f997c11c-1ed1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArIJI9AR0YpY+YcJY+h/pI0RZvU8qv3/9/neYoTfl2ENb+7V9TDlZplhFKx3p7u8991VqCRqcccv9q0zKu0GasIfOiYAdR82qZaZIPm2plrFxoAo8lG3gYr7fnkXK34yqcFxJjfdMLtaKQVzHCoSQCtJ+ve315wgf80N0P5skvy9+HDhRHt8Lc3whOVK49G+wfn6xnkC0YrGAvamn0qAzitzL3NHSSa8CClNIhB09HSbDV2XWpvbIoeTQeR8uORuBNUZOsAIgFV4qb3/bMXcliRB3DQXvfLUnOogeeM3z8SdiY9FfgJnfzL1NxBUU0m0UuyRN2o6jlmQJ40vebwDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrKVILKrNRmJjdA+LChhKJaM/U+KPX5v9tqb88jBfxw=;
 b=sgO1JI0U9mgT9sAJ66et/CujC3gVVvkh23Bd7jm96yGkavo9z7+L0z/j3J7aTW3M9l6cPbm5NDkPnDzz16Q4kGwfLPcFkIFSXJ4yT5lTXgTcCR3bNAUWtiG1TiyFuhjbeWeQya8UT4TZkd/MhFVTcD8B4AxNQ0Fs+Ft2WW9Dq/pr2kCQo6PZXjDmSAou/9P0q3tLpyABaoQEpphceR5syZqKQkQr2nJta6BLpq5wFrLrg8ixN8wW+vGooIgWOYhEBT/MoE4uCg2MqDaRDfPMWmAJTrzvLzdk8Ej4jZiHgi97zFTxFCPm1YkFBQqlEUko5knOdd85RI/GwyLZNEAGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrKVILKrNRmJjdA+LChhKJaM/U+KPX5v9tqb88jBfxw=;
 b=QRRKCVkOQt7lcKu51eUASAy4H8pv98jzrfTNT7dmQ9mX/Wdg17/neRYYpCaKEQ09PCWrdsmKl5A9tH+AWGSgEMxtpF5GEPPeq9RVQirfHI8RYPYuN55xvS4qN9cdL4q6Y/O6wgoG6wzVDnsjal3geeKmiOG6QPy2z+zYefy8+FpU36WMne9XowXXUXk+Y719CUfhZCWI7BK5zSCkUaEvYiVlZegqPLhYQJN8dwJK72KKGrXwIbgUAPpNNFfdDec2vJimi5dnzTIEbKmtfFh7gz9DomKGzoMCflE6qRuay62xGEblR6HuxYjBORRFIgWFtKZHxe2g4dLYv3Is9h0xaQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] arm/pci: address violations of MISRA C Rule 20.7
Thread-Topic: [PATCH 1/2] arm/pci: address violations of MISRA C Rule 20.7
Thread-Index: AQHcst65V5mePVDA4kuP+Yr3akM65g==
Date: Fri, 13 Mar 2026 11:44:17 +0000
Message-ID:
 <e2ff9382c0427114fb569fd07f8f44f76d8c5d74.1773399567.git.dmytro_prokopchuk1@epam.com>
References: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1773399567.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU5PR03MB10219:EE_
x-ms-office365-filtering-correlation-id: 16d13566-c7dd-479b-7499-08de80f5dbe3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 bZabSIOfRcc2Mhu3XR60msO+xh+0tyJAZ5hEXzoFt1ney3XOtcaU4NGTy4qKyJ92y/RJan8vP6LQ8e7C5x+f89BV2KT6n9FtpunURQB6YoGoolCnsqUqbWMu+3UouQalC1TtTPBYkypNk30EwX2L3VuIr99WR9/VK91yh8vU47gaarbVuRLIJhHyQ+wd+przk9HpT/p5xU7CJE+CGS4ZQjcEqEbfGO5qAoFpFO3MwrRpntlrG2DL1cFbHBn4ejjaLlIfkxG9yMgUBuEGWi/scje7I0YUFsNXWvmJIFF8a4T8EwB8VQCr4kvilSTEVsdRaUyeCSSJEEf63c9Fgbd53MCFxwlFyQB6PPfGzx1gZoGhaSbLFcqnXlwJbFIPOo6xkkzN3YIF09HqpbYlc0X8246RD9JX/m0asydeqriySCGaX7AvHQA1vtQ+ErHWKWpKVAMuP0grX98+mYabtHeDgu/VaqIuSaOX4p2VfqcL0pWyl7yUlJV3OvIy8U7kSsrxsbbcW2iVWYtrbuI9/moHNzXMD1hQoIRWHMRjdRXlfV/LwLDl5djg9jSVSPRQGue8RKaOSawYLM5+vSQ/pUlgONo2cj9CENS5mOCV45si+VXXfvVYfj8axUJXFGiSziHlPcyIjg7JswVWvAoAp7eVEMXpRx4CfgpQyHzBy0+RkRx5GSsR1WIVKqGdG20WMtec3kuMMu9+UzRDm2vU51KbhtwYPnhqrKlHsK0fyTf24R+SqqrvcDkSROUmWWkw5aFNI0GneEVCGGQ+LJW4xVk4JushQzCtVl9Olq2VgrgDVOk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6pw0ocfNqg+ZUngde7xrxqhvO/Byj5W+EjXZYYKi/f3mwaOr5qsiLcKGQf?=
 =?iso-8859-1?Q?BPjJCuYWRwCF2v//dxursoAI88eh2ZDsqP9QuHrwcQCaqzHMhxyQXN3I89?=
 =?iso-8859-1?Q?aVuOVwqb7O+pNNpUJJho+Qcwp+ZCLiN2n0LXXdTTbkgIC3OTutEazfkABK?=
 =?iso-8859-1?Q?ZqLsD3GhcS2mB4MnsKYlujgKRmP355ogw8jtQ9EwbE2qGwykdAv7i6kc3v?=
 =?iso-8859-1?Q?g2E6M89vn4CY6peQodQFOOZCXMe7Anju6nxnMT8Se7x+1kdvXt0fIH3QI9?=
 =?iso-8859-1?Q?BKTgS/PMNX2rvsHYVzXb5+UpYRPOZ5m6ikMWhXoK3EKA5UbtgUEhtiDVVK?=
 =?iso-8859-1?Q?ovdIz+Xa/eBgXAR7IMNlFo2UqQSdf9HUVrYa4338LP0Pnq89APeVoZUXeZ?=
 =?iso-8859-1?Q?qGtEz3eIS0kv7iG0rJ7jIn3FNiAtqi62OmG47/9Es3B2Q5IRIw7MQwCIJg?=
 =?iso-8859-1?Q?VlplcNc8msR5CVfr2PWnVHduq4b7OaPkCoty/PVW448OWtpixwPPK8EKaC?=
 =?iso-8859-1?Q?xl54a6s4NRLOKIBa+GiqlURxBGNh4RDIV76NNvC+M5RhciqYHmYwtHaF7q?=
 =?iso-8859-1?Q?8BgfcXbgGnHWH08OFjJObU3RsaTkJfK3AsYsJ0z3ENGMEvicnClagnwVee?=
 =?iso-8859-1?Q?N/77+7Vf+wVn9KqzXjUDHwUW80x1tLpmF33fU383mh0lwiL0ihS2SawX0f?=
 =?iso-8859-1?Q?GQkRN2Wd71SGt/JsM9XFKIZxSY5eXB/fjEkIYlAfXV61UG4pFBc4Km6mjm?=
 =?iso-8859-1?Q?P/hT5DHigGGc+MsehZmaRGzTrY6W/Nsiy+sFFAwevYZ33drCbb6bOJ+qBd?=
 =?iso-8859-1?Q?B5B7CKffvq0QGe9fEgVAnzerS8CDZ8Sg/ylUG1A+J7HFjn5IrQBC6w1yvQ?=
 =?iso-8859-1?Q?fkI1/wuwBIEqsCD8QxalGA0OF9kip0vHmWCJEV6dumsPYzYGOmTOLe0ymz?=
 =?iso-8859-1?Q?UB8DgcCljcIfhYG0BX0bfxcvneCsM2fjAFE8FM/VRW1QQO3vHPWkzZvKyw?=
 =?iso-8859-1?Q?7G2exNA47EtN+xPuODBUxIZQ9v4c/wP+WXYXZcyNUQtf6nkl0Z5aGJCelp?=
 =?iso-8859-1?Q?9tMAtK0vWfdqRmSNl8KmWKAz9jGnTHKyg2uEpeS9aw8bz0L5TJcmo5kKHk?=
 =?iso-8859-1?Q?qi8P0T4yB4Pyn0Cdg0/VHD+ETnxHeTHrGTzprds4XiaCzMU7t9V8XInrT3?=
 =?iso-8859-1?Q?4qKf/aH6MISNsTPl2l0i/vJQqqFt/WhWCKfNIvvBqheDAaNGS4DUvVTkHk?=
 =?iso-8859-1?Q?XjXJv40AIKh4srh3e14058HpSdl4HyTyCDP+3nrhKjucWYp+t8spHAslaI?=
 =?iso-8859-1?Q?jkYp+VQg6qZMnvz9wHOoojHxE284CHkURGm+7i/kPk2nYIHTqXQaN09DBm?=
 =?iso-8859-1?Q?NyGq2FOkYf7GNhNA4F0lw1vJIu86dAN68oLSK6+66Du+Xf+VsJD97MbKl9?=
 =?iso-8859-1?Q?kVB9ZYM/9iV4bR2BAnac6RL71O5OmsjD4Cl6kQtM19QVKZedDp6ivYCt0k?=
 =?iso-8859-1?Q?Mee6WQ7RdNIJrVxbNLwG9Nqz0dOG0Qyg2GMmqRF0cvOuzkh22hA5MtrelT?=
 =?iso-8859-1?Q?+nA+5AZ/6PaAUlqXrNkCwF5G+HCzgSPJfUFSlSqT5XIBcPn+/uCK4pMmaf?=
 =?iso-8859-1?Q?U3ikNdtMK4EmZncsKp2f5EkwGewRlrqXDY85aztCvpmgNufr89ZI5tyBje?=
 =?iso-8859-1?Q?cZt6nlh9XlhtCZ7GrSUHO9DIbds2oUcNgNX9OcPM6FfwyuVaNT/eDt3CvD?=
 =?iso-8859-1?Q?A/JYSE0nUyTjRrDqmjVzZZMWDnWeds1RFTX2Bz5pYwwWrp88N3zgxsPxo4?=
 =?iso-8859-1?Q?55i2ono+KwQm+2acGDYUHGoFx7F0Jp4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d13566-c7dd-479b-7499-08de80f5dbe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 11:44:17.2987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JePiNyvFOSYqgUGg2yW//K3900VjqjJtmJHtgaD1lFYic/PYDuc2L+zOr4OmmxCjMus6QAzvH2lKLc1mcwRFeWZLMXM9s4ZqieQ9ZGQw6Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10219
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81317282686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses".

In macros PCI_ERR_VALUE(), PCI_OP_WRITE() and PCI_OP_READ() add the
parentheses around the macro's parameter to prevent against unintended
expansions.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/pci/pci-access.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
index 2b23d552bb..7074fd9c09 100644
--- a/xen/arch/arm/pci/pci-access.c
+++ b/xen/arch/arm/pci/pci-access.c
@@ -16,7 +16,7 @@
 #include <asm/io.h>
=20
 #define INVALID_VALUE (~0U)
-#define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
+#define PCI_ERR_VALUE(len) GENMASK(0, (len) * 8)
=20
 static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
                                      pci_sbdf_t sbdf)
@@ -139,14 +139,14 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigne=
d int reg,
     void pci_conf_write##size(pci_sbdf_t sbdf,              \
                               unsigned int reg, type data)  \
 {                                                           \
-    pci_config_write(sbdf, reg, size / 8, data);            \
+    pci_config_write(sbdf, reg, (size) / 8, data);            \
 }
=20
 #define PCI_OP_READ(size, type)                             \
     type pci_conf_read##size(pci_sbdf_t sbdf,               \
                               unsigned int reg)             \
 {                                                           \
-    return pci_config_read(sbdf, reg, size / 8);            \
+    return pci_config_read(sbdf, reg, (size) / 8);            \
 }
=20
 PCI_OP_READ(8, uint8_t)
--=20
2.43.0

