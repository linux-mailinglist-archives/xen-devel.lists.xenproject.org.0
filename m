Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFpxFNe+8WkbkQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:18:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05C491179
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297091.1573229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI07Z-00020Q-SY; Wed, 29 Apr 2026 08:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297091.1573229; Wed, 29 Apr 2026 08:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI07Z-0001xT-Pe; Wed, 29 Apr 2026 08:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1297091;
 Wed, 29 Apr 2026 08:18:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wI07Y-0001xN-OM
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 08:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI07X-00EpWX-MQ
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:18:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1beae-bab6-0a2a0a5309dd-0a2a4505e0ce-38
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:18:11 +0200
Received: from [52.101.72.3]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f1bec2-aaa8-0a2a45050019-346548039758-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:18:10 +0200
Received: from DU2PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:10:232::25)
 by VI0PR08MB10619.eurprd08.prod.outlook.com (2603:10a6:800:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 08:18:00 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::9e) by DU2PR04CA0080.outlook.office365.com
 (2603:10a6:10:232::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 08:18:00 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 08:17:59 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 08:16:56 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 08:16:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W4FzV6CZfQ6W0AwnQmb0UFWlFy5He4JTWIwjtLx+e2ZmTuPZxKq/Sh+ZktzOyqYR094QNj5M0G5vmHgLd2e1ld8ZG3jrl2SwEW1//wY20ByHi/+cJxM8IKPXr3Cfo3Ok5T1+5oObBPIpNcJvgAsy9jFnqjT2uGAOdGOJ+9Ww18LAa129PyJVvkw8PAEhEGU4LcCnJMuZTvubi1a2CQH5mj0xnvRW92EbzyhvmwAKISrSzb28LRhPIPkWOBDN4OrDkMXM/gka7POCDfw3IESHpV5hHJfDvYh6+t0OBoXJWdXUG+1xYzQUFiNYpI3Dq9Gl/O5yQxq6Coh/Q6jlZy9vWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HZBB6EnPd5pc4XeW/Q3vmNk1mQZ25Qm7DUmW0DhGBQ=;
 b=dkzulG+6k5VddVlI0adCtVdGZspVBTSq/cxhFOSVYCzEr3A8X4VxWmPWUcRHJv0v1jzk6YJUSahKJKznn3eWgdDqsK1SnAkkz4xjchNdriJYgU5HOVrKJY085hzu3w3zlvp9FaYfRH9xRRnMAf2+FaPxMzBdEaVicIoHPTiscPqjAt1ssrDgy9avfwYe+nI4l8CuG3qvQsvv+e3TilQblayF9yf/06ZVoi5cmeXhmyGFinkFxy/9lAyfA1jg9gOjBp4nK94D0nmIpGvhpIG6RstzjLINPnz1UwXk166eQDk6b2mJ5A+RhR7z+n/Ih140CM0D2uhnEWTVP79kBWlC3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HZBB6EnPd5pc4XeW/Q3vmNk1mQZ25Qm7DUmW0DhGBQ=;
 b=pRgc8wdAc7WLaK4V8DTwWLKaswuZI6WdSuNlflMBK/dWGFzmtkH5w45Q9dxyDz4a6/m23Q18/pqDxEtIvBkZlagTvkKVE1+7yRwWGtTzh0OTKrMdWw9B5nHTGwf+3hP7pz2w7Jle6j/VXEbJideoqJP60uGSbpwZS9gxgma9WDo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ej4KRtJlkvbHAxDfUpVFrIvX0eJC8lcMQDsf6uildSkNe79ttgFaiXiHzntrjLm0CsUGKY50Bjfl5ZPyQtAdXEo73W8Z0SJtk4m7VpRC7eSJugitvOZ1HbPFmZQo3YgwsPYlm8IPIKKB3wcowBgFkU8bY3qfMSVv9mj2EigiON71Rqi6DBZSM3oxsYnxsPXqcUzcelEd/DJqdzfD36ubicO4DQOTf9y3KXaV66IBnW9CLLX1JL+HiUEtA52+rkhGEBAfGJ724GbeLafg3dSZZO/9TwkydY4NDhYwq/el80C1ibrgxOtylc0AKQJngYOG9wcf3NVggFezj44NuIdunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HZBB6EnPd5pc4XeW/Q3vmNk1mQZ25Qm7DUmW0DhGBQ=;
 b=LxRgOeoxtQAPL/AgRu1lv+0/pa573qO1XEF9cMaQjf0tp6x7c8QMUwaCuR+po7T3g7YsktqR0IxC7dOOS7X6khWmB81aq6qsCmAbdeJOXpm7kSS/PV5dEStJSn91EgnqIfz/3LbK16eyJtY/Q4DKbzu/gKJJINQ3ipsjQnjTXM4uEV887OiIcnnkxrZ6eXnIEFFR8DLcGtcf3nk+PfELz9Osflr/Rz1ZY2Qa1Rtaz8IAGNBGqCwGdIMb8SkfV2DEo08kkf87jZRNnbIxaWBuH7CbQ7sMLGFh5k6L7ZJ9BruywrnxmhxNW3TK9SGYnMODDq60w0gpigRfJj9AYn3WcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HZBB6EnPd5pc4XeW/Q3vmNk1mQZ25Qm7DUmW0DhGBQ=;
 b=pRgc8wdAc7WLaK4V8DTwWLKaswuZI6WdSuNlflMBK/dWGFzmtkH5w45Q9dxyDz4a6/m23Q18/pqDxEtIvBkZlagTvkKVE1+7yRwWGtTzh0OTKrMdWw9B5nHTGwf+3hP7pz2w7Jle6j/VXEbJideoqJP60uGSbpwZS9gxgma9WDo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU
 shutdown
Thread-Topic: [PATCH v2] xen/arm: gic-v2: disable interrupt bypass on CPU
 shutdown
Thread-Index: AQHc1waiSgYhXcA/H0GAotA2SwKRHbX1suQA
Date: Wed, 29 Apr 2026 08:16:56 +0000
Message-ID: <5B5A7650-DEB3-47CE-819C-85F25FB58509@arm.com>
References:
 <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
In-Reply-To:
 <18c5532816d852fca073d0552dcb6d497730a6c2.1777377278.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6631:EE_|DB5PEPF00014B8B:EE_|VI0PR08MB10619:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f66c06e-5f88-4ad5-084c-08dea5c7d3a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 zFuf4yB/kInE4lv8TuCpIvAFyz9GV6BxUn5Fc28JT99FKN39DcEeQ4AQfWzdtaK9Do3ECxtJ1R5PPppGgikqowMAMct1fziogFRXRzs8XGp54MqZMU8yvP2PQpYAK2rvd/sMCrsaBZ6UvN2ytr2SguG8YWuhcaa1PhX3V76ngw+R36cOpfq3uktXu9t2Rl72u5QJ/4x4xV6I3JjCzlZqt3jkbJMfTwSqEJlzTITujaC5oAHoqiDxzclTAoZl1DchCccbr7UAJaePh3JdcCOvvNRHV+NaWwutq1MbfzvMcBIGFoj5O1TDFpgtwDxFOjed1MIEsPMmqN4r/rvvLqROo4Lqy9+VzzfrFC4uMJT9NlZVGsDmOBVegvFAhuC69jhyTMl7CzvxrA8gThi74fP3NR0Z6lHhWQV8d7Xf2YlyM8lfcl1GUC5Yu8CAADhCNgdwIbbNvT3NO/H0Qnp18twxpPCS3hRLnaYQff8ic0MI596zjphY3mpqk0pyMbBrf/upM5HdjnEvOMBrB16HIAfvNrJ6k+/TzBDUbutNAFKv9Bkn5FQn0xQq2k3RB7PLgcGBMuaDaAlPsHz2kbzG+OH5JIn63+kEEYidj6NrRF17DKbLxfeKerwgEDUsG6858mhbSO2Kyp5fTigbqSYzxira8RhKhWX+U9Hda0I6qRQIWY8T+V7Vpe21q0XMufSom/RCImxlcmRIw5l4mhvzzUhkQV6G5dljQ0sVqBQbzTZtLWcHj+PY9h3iTBy8WfKcVQx9yUEBfbty9M7q4iPw2OUpumj6jNZdlwdeUaK4KsQ6oHQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C7D561827A7204A90F3D9076FD8F4C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 p68h0XAubft1/03HxrsNVGKY9FkAD98ZW3W8ssiWC2p8aeCSqXqL5j+vTwjjziTDopvi1Ow1FQ7I4GN+1E1XpOtIFrjKgfsorC7NtvBXEDQ7U81kdiE3EF5/HqGZmzNFULcI4nkYnwFrcRWyVJ33HsB/ah00pWFWcIV4b3Q+20glPb99qpkjBb3/o3hLWKejUJmROvE6mVFrvBvQDiG5iWAlGYbukzF38bBqU/6hdEbocwe08YqvkGbTz3FRFSJ9O3rEXrfALdIjlekBqUjd3ptqsqIu6+qiPEor8HUvO9bOKo81KyWJQpJi5yD0JBQrVtqbFu+PqQZVIFTUljzztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a81dd144-3fec-4c88-fce0-08dea5c7ade0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|14060799003|35042699022|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0wgxNlvDw7mGz8SUbdL6WteAgwmk+Ws5a+svuN99cO2dPs4uYedqh9M/CrWZURdQoq+0VX5PNoCuW5j/OB/FxCkLPkyolTxsF+3SmrALcUVMMltS6fcsxRvQ+xdv5QaNjth7bXJvu2HKtre9Yc3NNeY8B+2u0I6aCNfGgeVfQrthwwwkwwdBgdxoRUZrZgxNNgvsMTXbylkcvKu2/Gc1V/4vbICKPjOHNrPXts1Mfu45s0uyEnUIms8EEqWXUgedvH8ho3wyGGISvjI8ROIdMgS4w8bG3F5XVZU9PBYzOkjHnfANK2h958QEBV68tfGXwLHs5tcL4dNC92OK/7LQtTmBV6LYqJFIM0ZFtOOLcN++9EI5MUgeZG5i+JEvS2owFh5X80IQK7qUmX+eCGm+ppwQ2HFq9zsB6jGpZIjN2j/EXKEtRhjS8SgzgaG8CRYSyL3Me029qbMhT4yQXxKPsgrkIaydicmQGQQK90OL3Fhr3eh58hsBRCc8wWqt971dS515VeMcS5EhohVkipdTgRU+XsB9enJ9Vw8RP6F9Hna2uiuonSxLhx6+7u5lIkMRgz3kfIbRROtmuK4LW27d+t4kSJgr1wprbvVcCmLI1K8dV6c9oPhx2iJgI91kuU9saYe1nSQCK2ILq9a7gV6M77UUX2JQ8TNjCrU4JOwI9t1Dr/r933o526R/Y9O1ZXMoT00KXFVHqE0CC234W9hscGTxQyikbiz4tWH5nRw9BXS4avw+Qb/GgYj8cvs995Wx/AIUoIA3QcNl/ZXlXJ6s3g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(14060799003)(35042699022)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a8Uy9OsZTEx2Qi4qVfE2s/fpkAjKWwg9K9hX7HqIGUXz7zeuvCjh1WvH10aTRsyBL72WOEwJIyDCnZu1ikCSrfO4peXW/1DpDdVgfAaw3d5bkvt4HPRlF52S4akPCw2aT0U8Id4+6WPZ8e/+tPmDlq+q+i+4O33ajDZOOjZiOHzcCwQ4IvBXsBOA+HmVt7nR1iJqQLdT2oPx3zTwQBCwECQypFemEdVVXrf10AyRqxGFFexJ8nKAr5YTKbD2n940eIFnLOae3mRS7xs60db/miVeMPGWLYSJqNFx76mmXwTQUt66037Pf5NCm8PRN9qN2hUwYKPDnIuU9JO+YeqsfFSrGJKYLEZ6DffYG8hDvpqKpyAZus+ZUCxkbT58Y4xyoMouvC/ILGXDmvSgn5QCL4DA4GP2jpizYeietiBYTG6jabEWY6gibQPa+nO9HM6b
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 08:17:59.9778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f66c06e-5f88-4ad5-084c-08dea5c7d3a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10619
X-purgate-ID: tlsNG-c201ff/1777450691-E17A6443-3003D9B7/0/0
X-purgate-type: clean
X-purgate-size: 1760
X-Rspamd-Queue-Id: AD05C491179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.973];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Hi Mykola,

> On 28 Apr 2026, at 12:57, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
>=20
> Per IHI0048B.b section 2.3.1, clearing the architected bypass-disable
> bits selects bypass rather than deasserted interrupt outputs when the
> CPU interface stops driving them. Tables 2-2 and 2-3 show that a zeroed
> GICC_CTLR can fall back to the legacy IRQ/FIQ inputs instead of fully
> disabling the interface.
>=20
> Fix this by reading GICC_CTLR, then setting the bypass-disable bits and
> clearing the group-enable bits that are architecturally defined for the
> current GICC_CTLR view before writing the value back. When Security
> Extensions are implemented Xen accesses the Non-secure copy of
> GICC_CTLR, where IRQBypDisGrp1 and FIQBypDisGrp1 are at bits [6:5] and
> bits [8:7] are reserved.
>=20
> Without Security Extensions there is no separate Secure/Non-secure CPU
> interface view, so disabling both group-enable bits affects the shared
> interface state. This is still appropriate for the CPU shutdown path,
> which is expected to stop normal interrupt delivery through the interface
> and rely only on the architecturally separate wakeup event signaling.
>=20
> Section 2.3.2 also states that wakeup event signals remain available
> even when both GIC interrupt signaling and interrupt bypass are
> disabled, so disabling bypass does not break the power-management use
> case, i.e. suspend modes.
>=20
> Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


