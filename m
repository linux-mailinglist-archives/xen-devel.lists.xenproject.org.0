Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMWfLyT0D2qXRwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:13:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A125AF6AE
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 08:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316301.1585691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJ8l-0006NB-7F; Fri, 22 May 2026 06:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316301.1585691; Fri, 22 May 2026 06:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQJ8l-0006Ky-33; Fri, 22 May 2026 06:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1316301;
 Fri, 22 May 2026 06:13:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wQJ8j-0006Ks-Qs
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 06:13:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQJ8j-009h4Z-6l
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 08:13:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0ff403-2eae-0a2a0a5409dd-0a2a45029930-38
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:13:45 +0200
Received: from [40.107.130.76]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0ff418-af86-0a2a45020019-286b824cb247-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:13:45 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9232.eurprd03.prod.outlook.com (2603:10a6:102:32f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 06:13:39 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 06:13:39 +0000
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
 b=Px2lZzmUJiAX5+wLOWezHi+88VpkZ1YpsXZZcmv9BlakVqh/NbGipaSe1zlaZy9xv3cTY9CNDRPRQp64zAqlLkaNSLvK9G19aKX1x0KWMh5kg8qlLRW1e0AUCo7kzxuWZEFMjBgwr7YObzbKKrlDRMsNTwLbZMP9d/NIf1ux8GABJ/gOJHvZh9jZvuLfznGE8mZEn9OHd7ioy3yMT5m2YCsFHgrw8Xiqtl3rsGWf01iYqiZ4QA051yTMX5pZco8SjHKSiMBf09BYzDzhDcNdUUWQzPWaiQTrqfiaeUGm8ANypQSSbtUBeJ9gZIdjzsbw1ucvXsis15rxRsgYLy3a6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSzIkcZnBN1lM7Zv/8++NndRVXnA68TaGTwQobbZpQ4=;
 b=GimbDMOIDurDmlFc4AQopGnhj3YjxLiTFSPtNqyuHbFKQHixHZP2hCyv1/An2LCmLDRoe+RBwKChyibtj50bNdB70HcRVoBbXB93/BRBufFCBuvPIfZX+HTmEXfZdw7DNNvhDJUbK3U+VDdrILEovDdqZQc5xuuyiIGP5WUmpu9xNG4IZTtj4D+zwtTQBGee3NEa7ykrUZDSPS+d2bKbHhVaqpno3g1YJJC6M/dUtXKQGN6fjcN426NWxqD6bsMQYNfaV+PU3/0j+TM/6AFVtQPYZHNvse7SQsjC7pGgFAMB5ScD9WyxA8xle5jbdNLostoO9YXbwmwifmOCrAO/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSzIkcZnBN1lM7Zv/8++NndRVXnA68TaGTwQobbZpQ4=;
 b=cXND0Eu6jiqMyFK1anwtMhOcaWhHDo2zJp825M9F6rUezJMzhW4Wo7vi3Ih5anvziU5JU7EwrfvJRwEnjXWjbJOqws6DxVYludgiMRCheT/jqduKe6Uf2jAqwyfsyTpNAelVHqdxDc0xNK2qbFb7QiJC2UStDwUQUMfZLSMGavfdzKsKgIx0o51UQxVRRhPmjOFW7oVBw8i6pJzNZGfKsubZdowpkn+pbnw2TQzVcLx4ZyMo6d7aqwddUH7FM/Sf243Zk4tMvSxMvJfXONl/cLBCA3QH8w+rfI+Pi0Po/grgL6Dtp9MB3AxMW9Ra//j5pAkbCS+g5HjFlM7c9FEV4g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type violation
Thread-Topic: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
Thread-Index: AQHc6bIh2sSAML9OckiCBnGq/+88iw==
Date: Fri, 22 May 2026 06:13:39 +0000
Message-ID:
 <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9232:EE_
x-ms-office365-filtering-correlation-id: c6dac1fe-26b8-4090-1168-08deb7c94447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021|56012099003|18002099003|11063799006;
x-microsoft-antispam-message-info:
 DROTYvEnvoldsNKobNNziH8CdnblQjPcoiy/475aTlr4sIt2zoLndIOLjIuQQQC16GJdotCL2A9ww6b3vnOebHcdoYmxMtMlm66zoJMeTb21kjgBd0bWKxmxCBcqtUikqsMEpWuPjSXJUXmoT681YRm83ldlZ6Akg0Taz8v+j+OGKufllYxT9gDSCPqEj3AVqxgqtPxtYIy0we3pKEBnIf/1B/+laGp2ggo7AHDyZCjmrmVVcd6icUvcoR4tEhTj/rzE4miYhZ4z1QgiUHkRuZWJnu+qVoA9wrKYudtSQ4NAZJaEv1JXEgBAtXiYBx6UYbNsJ0WMaHHIwGStfn21f7K6o5A61Y4GIYSKXV0mt3eiEJINcsx5XVFEQzKMESeruHXoSBEfQOulzM48doxJJSGwW8kWBC/Sbkqpla5vLY7TBaB71+KMy7hzxRym/awWvKhEAxHj/5GTB7OtQ2fKFjV8SREdL2ekbN6ck62P5SsIXGW7ve8iYg7BcMz3NvscwW11v4jVc1c1nMBdbLwPI4+qBBSIcqM2IEMk5v4rgmOY2wV+/6oyGp+963p6L3XKzXK1nLK3pE2kuKCH2ZsZUxOaLxEtYb+PmgclESBO7MaIhFRqyjEUmYF32yWYKX7qDC38twmq5ey6nUaEsgYqblNZ+iVilPs5/F7IEHeuZhNt8uIIcYY/zh4txWMz4KHoeyn5j1jyUzrmRl2fPf7KOise6oWkKooZZC9UmJNJyJkgdX9PNOG36vGBmoo94IU6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OZpSmYu4mwPGRygdwdyC7/ovEB/FnVzqKmhjniy9+g/w2tugokJzgQqK33?=
 =?iso-8859-1?Q?xJXSyCwVN0bN831FNlXARLHavWIu/2x2UYgOe62bmPFPj16+CZ/MJYt48O?=
 =?iso-8859-1?Q?vpNvMOkOljVZH6mljpVelt++l0ClvPEu/9co9J1mXY59DuJdxSiuP0OViR?=
 =?iso-8859-1?Q?RewoqUHe+H0urpZZCfbiQMmR3dSv74xwTN2uspMbWvtRjnxoqkz3GBsQDf?=
 =?iso-8859-1?Q?rT9Ce/emMzl6EPDMVpWMGdTKUphYKcajM3KLshduYhj6y4Npa/x4Q5c1yz?=
 =?iso-8859-1?Q?gdyt6Mp+uiZrJkyslFljMUV8Mq15Wb7ek0k9k88RLhEfo2iJKztmZGAgae?=
 =?iso-8859-1?Q?WtGIZxksebwAXyEFv3CB9ZNnZGSJmDTZClL5N15dGv11CTAEegFjAQXHNi?=
 =?iso-8859-1?Q?gdbJEeQxd5BJXAVqDG0miXHeLBcVoXNMjKkUdN1eAkKPp+xoLuEQO/Fw+G?=
 =?iso-8859-1?Q?ck1qc3xa/V5MB5a1OgHNUVIOg7KN7n1aUwpZpFdsLOUkIe8F95nUY6EAB3?=
 =?iso-8859-1?Q?lAazcMDxhvRPpHs85XdGqihO6LzxEybB6kEDcgerP49+76BSaBPAvBgTew?=
 =?iso-8859-1?Q?D8WNca7A1Z82wMWng824SsWGndoYXP0Tq9U996xfapTbbrGL08QT+jg/1B?=
 =?iso-8859-1?Q?1wlP8yQ/dzZQyhbIA69yF8Dg2wu2ax1hs+20SVRSLl2BDYNgXoWWlq07UH?=
 =?iso-8859-1?Q?FWrCp9NIUM79DGeg3mFnjY5W3k3T1dyt/DYzbGDi5GjutdyKMSC9oWUSt/?=
 =?iso-8859-1?Q?CUM19SfJ7eht61AlsMDsV+BhI0sDckdC3kjgGhRM4dv7QFUZAaxoOp+7z6?=
 =?iso-8859-1?Q?qYOSK0t7YJx1gceWUPHrznaFAU74/Bn4b00lzdaqY9pXWq4bXnBGXQolEg?=
 =?iso-8859-1?Q?gQVjCHVE574RzbT5JDOD8mFSuE83/dkZiGEYhufVDnnFQ5YsskzzX3wFZH?=
 =?iso-8859-1?Q?xZ4VJEMDJSKqZ/5gYz/+rz3PL5Rk6DpqGXa/gAKntloxaYcNfyzVbm1AKr?=
 =?iso-8859-1?Q?NSb8KRIsQDG0r2FT2jiVvlG67uVLJ89iwpEWpaX6xrFf7U6xrgwhf2aeuJ?=
 =?iso-8859-1?Q?dOS4GbHxBxciITca98wiH1LThTR3V6gxndyYBUu/XEKnGaouN/B01UTXJO?=
 =?iso-8859-1?Q?G6ZWtyjmheVjCv12cRd7+bZ2yNS6YoFgHiayhtsT9zHeV+S3kMiIm9P9Yr?=
 =?iso-8859-1?Q?WHlK6N3hI2eZ51EUG2+odJko0NBbSyQCL+7byR96mVRsn0IaTjFe9EAeYB?=
 =?iso-8859-1?Q?glGWg9mvBLDnTpZfmQn7wrKhtCylBMXy/u1HcDCzcQRcY6B/VrF7h6H8F6?=
 =?iso-8859-1?Q?A8Ek6LJrmtn+r7P/0nFtqFVMDl0Khe9/vr1zpTejQBz74MzMQ2OJL3zZz7?=
 =?iso-8859-1?Q?ilBlrSG3Dme5YCGPvn8CpzAYlSPMt8THW0rb5rHm/n55i7pF5cLx3jMdZi?=
 =?iso-8859-1?Q?U/rosxrVZqBIu6J83dbVfX6Ys1vEeE/aXWAj6ISzD2QSuIVxKZVrsun6Qd?=
 =?iso-8859-1?Q?UqpjL9a0HyESfRorr7O/XthJuqVVIi+3VcNMoxicTwBCzvubp5RcdgF/9E?=
 =?iso-8859-1?Q?LNDmRIaZLqzQ1JxH0CWz+lm2FwYA+h+iotQdxU+tC21ms49Xgj0jfRaXb6?=
 =?iso-8859-1?Q?50LjQVpYsW5+loqe18Oqvr+bUtG4mUaPL6GJkLqYnNh6zfwsbf5poeKArU?=
 =?iso-8859-1?Q?qHaiMWg5w6+OrPzB+wx1oNVqhIFKLYGUkf/QaRRZkxCF6MbmBTjnpGLm/0?=
 =?iso-8859-1?Q?uuJiSUBBe+SHN9gGinhMGf3niVXuybCkw7/FXlzB7kF1IybfB9v8Up2C+H?=
 =?iso-8859-1?Q?VOEnEbAuMUsF+sS3QG++UK081WNrcxs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dac1fe-26b8-4090-1168-08deb7c94447
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 06:13:39.4629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: un+vYQZIqXktoHKVAEih5IcRB0EKJSOujd1weP+pNVDBUogiUxQIaA1HFHwnXGzqQAPhSzlvWtd7sKRzbExWVvARXO88+xsvYiwMJ9gv/bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9232
X-purgate-ID: tlsNG-720697/1779430425-80979161-9C4D3E7E/0/0
X-purgate-type: clean
X-purgate-size: 1645
X-Spamd-Result: default: False [0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url,epam.com:email,epam.com:mid,epam.com:dkim];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 36A125AF6AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C Rule 10.1 states: "Operands shall not be of an
inappropriate essential type".

Boolean values cannot be directly used in arithmetic operations.
Convert boolean to integer in vPCI header bar index calculation
using the ternary operator to satisfy strict type checking rule.

No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2545399814
---
 xen/drivers/vpci/header.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a760d8c32f..2b7f78728d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -586,7 +586,7 @@ static void cf_check bar_write(
         if ( val !=3D (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
                     "%pp: ignored BAR %zu write while mapped\n",
-                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 :=
 0));
         return;
     }
=20
@@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct p=
ci_dev *pdev,
         if ( guest_addr !=3D bar->guest_addr )
             gprintk(XENLOG_WARNING,
                     "%pp: ignored guest BAR %zu write while mapped\n",
-                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 :=
 0));
         return;
     }
     bar->guest_addr =3D guest_addr;
--=20
2.43.0

