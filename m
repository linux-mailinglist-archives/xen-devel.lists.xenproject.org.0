Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMkRJwvEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785F2FE936
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259670.1553120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7e-0003n9-P0; Mon, 23 Mar 2026 22:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259670.1553120; Mon, 23 Mar 2026 22:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7d-0003Sf-BQ; Mon, 23 Mar 2026 22:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1259670;
 Mon, 23 Mar 2026 22:51:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7X-0002eA-Ux
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7X-00As5i-AI
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:39 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3f6-e002-0a2a0a5209dd-0a2a4503d58c-4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:39 +0100
Received: from [52.101.84.77]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3fa-1947-0a2a45030019-3465544d7449-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:39 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:37 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:37 +0000
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
 b=AXE3LeuQiNk8MUz/2cfyLnw/Xqg/riiBdMwu7qKVDH+IzVlR9637MRlxLJkS+SKGHa+JTGyrw/S+pWlQH8hsXpvoFJtco4CWZNMvSi4cRq4uFHl16jrugMBH+iPLmmN8TT5aQmAgLaUHRUJluTiEv6z4IdI1iMCNHLnp3TRjd5Z+WiwDj8F5GHNMtc3eFtzucyJSsGkBP0oRTYIeyh0DmCGtpxYVB5Jh538qFSjRc8vRNvcXPEfntTc1AZq9IXh9sPHmHKfGPextwgyxMSK9y0u83hPSdv+mCKkc5Rs95C6mXv+VP4lBqaoWzHwJE6gTkT2HI5d1+oZKEXai0xq3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O46ZCtqqAtKuVVyR61YNPzdDBAuzXaUE5Bb7qosufwc=;
 b=WaoNT+S4l8pxDlTNg6pdSMtJIyCty+JaT2by4f7OhmjSrrZy3M9VM8TJtx0iD2SfPdIayWtt+9siOh4jkHBMqHKKb9pZ4LVJTNTLJ9ZvdJqww6Wy5f/0+1bP9CCToYclUY59hdqvEaY4rHLm3vGPJaxYylKkZe0ZnCh5LBh9rkc+0FypOQj/sgbs7Ja6e84RNWCx1KWUWUjs/81hsInpn22inbsB9qwptPA/u/J54E625GRJCAvy85lvuAMlmxWnDeEBX/CFIzfBBK7ayo9WN3xFHwE/fxT77+bGOrOFwUUKW/0OPvGf9HFVupQY007u4iZvvrx9VQRlh0VHiZ4yng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O46ZCtqqAtKuVVyR61YNPzdDBAuzXaUE5Bb7qosufwc=;
 b=kAT+Y9F0S9xKYw61nE37wm6WvxWmzq4Ck9aYTutHU4I7cvVMRE0SO8GC6aLLEcLmXzggkIZ4ja5yFvacUrrrii2inCx0g58au+BTtfoKKbKSewX5fuCq1/pp+IdSZ2DAYROv9baubWL4F9XFcplxw2PolW1fotX5qTpgJAe5lk0maEIG1TxJoJ7dvfs7/a5mnXXsK1WHcQmfjMagm/OdvvNbptl+neFlqx+O35ZXyBKipX14eY/wBDJiiRNWddvwBNWdodq9RekRpdq5/lmciFn3F31RwY1ek9Q/n2H7Dm6PuJIofRfb3xc1yd7LhfcnsU8JGWRdxde0qCGp4by56w==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 19/23] libxl/arm: vIOMMU: Modify the partial device tree
 for iommus
Thread-Topic: [PATCH v2 19/23] libxl/arm: vIOMMU: Modify the partial device
 tree for iommus
Thread-Index: AQHcuxeaWYek8XrVDUW5at3G4vpkiQ==
Date: Mon, 23 Mar 2026 22:51:37 +0000
Message-ID:
 <ba4a05e53f784fd338d0501085ac0e3d289ffbc4.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB9699:EE_
x-ms-office365-filtering-correlation-id: a7a7262c-52df-484a-19ee-08de892ebd72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 77gQYYTKVng/u5pJirqzY0vNDu+6bChvZ0SGXdfKqBkbNzf6SPBrOYHtUrjOAUydT84vQbd3MScdGThy7Usj6GKwIJtffMxxbIVePgXgqakdtuDSw7VvU467Nf6ziPrV5IKhdQiJofi8LZmq0CYtP3GI44bj8xe03RoQUSkIOhSrXp3BFSKzFp6sKjdPZIRTOcdnQLCqxfcoOIBTptwDiqDsAj5/GPkK+K1PYG7D7fiSbIETuO0yfOfD5s7eO+HRPhZkKzzhXiv6pZOWzW6tqnVaQqt9PXpYEVly0lUPsKZNJ9ylkFZtHj5eVQakWFvOaClXT2Uj0dpYYlg/xk4GKoTrptnbce0VkmlkWBnusJPfZjLOLWqANXl5coHcHiOs2O80me30H+Y8ktVfv4qJp5hNbR6048acwoCdeAwZ9z6S4zJ4qy0ukV+LK8Uwe+ISQ5fzD8QvzUBBP3CBSz9+udjmo6IsnpBQVXd87UtX0iDcmFSI63v5YBfnwhy4kB2Esam4yUi1WABiOqOX9FnwIoEa/U4Iz8OTVwcugZEBCvQqhL8SzHwMjxxuXYgMHp+QIgA96mjZ0udSK2eftMTVEJdFb1hMN+F38NttGlysV40k6QQoaoX27XcYMD7cT1JSZtHfz2nlZZ2wBzwRXFYn1bCcGBnVibO6/b5VivSEOfAKRiJqwBfatS5Gk7/gjOecILT3nr50QhXhcgAMH7S4STcv8F6Dzft6rONExmRBrXgLD3CoYZfOoFDkY7Gln/gf+BBq7yDy99rWIZNMJPcnpwj49oN3xTBbhdIEY4ZD6VM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4yOSibhF44rpXoT8GACk+KowMe++TUEgO4z5q9Z0SKcb13ctmX/clrwNeT?=
 =?iso-8859-1?Q?rRdRCRh1JOVreyTS+qtcZPf3qXP/qYd5HDPYEyIxh1tMJUtiDnj3EIYE/f?=
 =?iso-8859-1?Q?C9PoTCAi+yPsD21a5q6foYhBHXsISawLiEYwj5TN+DVwWDx55UPNB6CCi7?=
 =?iso-8859-1?Q?3wLewtiFDzf5OSFwFiMug6rpvHqHt2jS3ABA+hOVW1cBdapNkIkLreOknC?=
 =?iso-8859-1?Q?1pYhjKe8K2vNmDf9EOu2Alebrm24UtobUS/BuC2jOcPjsOhRZelsZD1pIL?=
 =?iso-8859-1?Q?wZUSaxBQi1NAwpZuTxg7Jmkw851BoIujtwn7Jhq/ilu+jh7k/SQg4AuX8T?=
 =?iso-8859-1?Q?ykug0H4cM9L2FC+G9o7RdW+EE9hDw3D4SM5i/EBJ4wDQ+n6aNgwmtqyFNP?=
 =?iso-8859-1?Q?l9F+a2P7TIblamv3+H5ba58lR6Axnd3QjIC3Cpetz9BWQK/IaaqednuOeo?=
 =?iso-8859-1?Q?bDMqeU4MZq50JXTAu2ERimSYP8O2WN+ENGYIdpPOIip+bWfxtz6hzcCCjC?=
 =?iso-8859-1?Q?9YTNBP+lXu9lVDSB+6KCThxn5eeEf8s5TK4A4taahm29XP6xCymDTiA2ou?=
 =?iso-8859-1?Q?sb2hQFnwiQUVpl/LTAS2IvW4z4jTcgk3WLKExgwYCn8YnB15lHIr90tMtZ?=
 =?iso-8859-1?Q?k46WOA5BDyLegNSAhl34t8Bw8rhk4Z4FD9W9TYyP/742HrV9OOG9cgHsed?=
 =?iso-8859-1?Q?2eQ0nsLE86wdDKN5aNPMbwKAEB+1dZt2mxTdy+W2Hte0U1AQVMQ7qB3ZC9?=
 =?iso-8859-1?Q?KDwaGhd8QwT/IUTSPwOsMCF5M5hyXTT9OCE3hynPjjTffmGozIv0A8ELfk?=
 =?iso-8859-1?Q?iGySY0UDyp6guiMmLSSe9IxZmFs2imSaVYQBy8G3mKCl4gse80Nj7n1yvk?=
 =?iso-8859-1?Q?sFhbT7l2UdoO51BBeZMPv4AEbiZaMNNYcdombhuqcsrT1AawXr05NR46Xq?=
 =?iso-8859-1?Q?waC9xSUBAc2wwezNisyx/1RuttmEsRbfBbBPFqDocp7RiV6XA5rOPKHKTb?=
 =?iso-8859-1?Q?0TXa5Vrjv8qeHn6SRJdRl2E3Fole92mJ+Q+U6X5ltBpjI+9JeZyeVsyTHP?=
 =?iso-8859-1?Q?0PNOUI1ZaNoDMmHskDm0NI6Fv/eyGzFzC0M/i3C6+b1bcy1PSnXAfeRQ+L?=
 =?iso-8859-1?Q?QetfY83drmgA6BKDF/trVVEJ0cZ+gLtNj83AP3MyigM+lx3GM6YascojpM?=
 =?iso-8859-1?Q?eUgjC+5L4OVKRFxVzuUwE7wanFWBJfC5Q4FeiXyxPLuf6MtZt0s8or+JwM?=
 =?iso-8859-1?Q?o15QgfxzEPBmQOcyKxkKJINHUw/pP2ATu0WhNy7FRm3yeWmRQGJPw8QSk7?=
 =?iso-8859-1?Q?xTeTOTXqxkOgkbFwqubxo6cfy99MtrQTYw03vMLw6mDGroVtmTo3OWDf34?=
 =?iso-8859-1?Q?3tNyz2gJr0Z1mNzIedbRB7aqBBgaBNWr8FN5kd3ssKv4F4lWsm1QtY9U6W?=
 =?iso-8859-1?Q?nCy0AeyyjrSxnV+nYJZ0z4bhevG3wkuq89mdXLFpv8lY/gJTQLBdweM9HB?=
 =?iso-8859-1?Q?PQ2bp3sh0E+OtGMOfZpuJx8a3xjoxPvs0FADQ0hKn2hiZ5CpNxRHqVXSgS?=
 =?iso-8859-1?Q?1Wj6PaRf+dqbaiuGmbVX9hpSvrSA1KQh8KjqARcDjtTUo0aHG6VubXxfZ0?=
 =?iso-8859-1?Q?roz3lFnWwlnj/zHtNLsSwyItCbaMuoqiofYHakp+mMaDRSYPn2J6FoEUKv?=
 =?iso-8859-1?Q?WmL3Y/rSX3APa33lE7oONP1SrKTGmpzUL1BiB43phK9gKLYB+GOa++Kqis?=
 =?iso-8859-1?Q?nXB37pYESduPPcbRDLIz65lJX/daHex1ie11OkAEcYO0snBQ2EPZkc+5Rz?=
 =?iso-8859-1?Q?i8VF0bLCqX+F34WsWHWN+3t+UDQdVcA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a7262c-52df-484a-19ee-08de892ebd72
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:37.2424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixSWt/zyTw+R6/v5vng+O/cWIJWHLySD62/bQNzKbc/YlhY9ltk8bke0tC69eQTa0SUCcD/iatjvuQA3Spl+sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-purgate-ID: tlsNG-33051d/1774306299-EAE8572C-7324E835/0/0
X-purgate-type: clean
X-purgate-size: 2920
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4785F2FE936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Singed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 47 +++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 803c3b39b7..7b887898bb 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1326,6 +1326,41 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return 0;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    int nodeoff, proplen, i, r;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    nodeoff =3D fdt_path_offset(pfdt, "/passthrough");
+    if (nodeoff < 0)
+        return nodeoff;
+
+    for (nodeoff =3D fdt_first_subnode(pfdt, nodeoff);
+         nodeoff >=3D 0;
+         nodeoff =3D fdt_next_subnode(pfdt, nodeoff)) {
+
+        prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+        if (!prop)
+            continue;
+
+        prop_c =3D libxl__zalloc(gc, proplen);
+
+        for (i =3D 0; i < proplen / 8; ++i) {
+            prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+            prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
+        }
+
+        r =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+        if (r) {
+            LOG(ERROR, "Can't set the iommus property in partial FDT");
+            return r;
+        }
+    }
+
+    return 0;
+}
+
 #else
=20
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1344,6 +1379,13 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt=
, void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
=20
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    LOG(ERROR, "partial device tree not supported");
+
+    return ERROR_FAIL;
+}
+
 #endif /* ENABLE_PARTIAL_DEVICE_TREE */
=20
 #define FDT_MAX_SIZE (1<<20)
@@ -1466,8 +1508,11 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
-        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+            if (pfdt)
+                FDT( modify_partial_fdt(gc, pfdt) );
+        }
=20
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
--=20
2.43.0

