Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJMMMuot52mA5AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:57:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10A437E77
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288516.1568797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5yx-0001y3-Bv; Tue, 21 Apr 2026 07:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288516.1568797; Tue, 21 Apr 2026 07:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5yx-0001vh-87; Tue, 21 Apr 2026 07:57:19 +0000
Received: by outflank-mailman (input) for mailman id 1288516;
 Tue, 21 Apr 2026 07:57:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wF5yw-0001tq-EJ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:57:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5yv-002iV5-Qz
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:57:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e72dd8-5cb7-0a2a0a5109dd-0a2a450ca6fe-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:57:17 +0200
Received: from [52.101.72.122]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e72ddc-62f1-0a2a450c0019-3465487ab259-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:57:16 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11567.eurprd03.prod.outlook.com
 (2603:10a6:20b:724::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 07:57:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 07:57:15 +0000
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
 b=QFmAk0co2D8Ev4JkBp4yE24TvdWu2lreWVF5ykhBNjfhd3He+2K++A3lIfK7jbZ6ARBquK43JhnXIEGcNuCAndx00/KEtdC8X4LDxKTH1EJDjLP4xik3JgS3V/FoL0CGx2INwO/sGTXD0vQxvmSI8arnSpoS9ZeMRy3OJkcEVGcaVWS7RmGvxuVzEXPllk2B2sdFh++6DTzhRSU2ArHF8P8lnnG2/b4xeg0h7XIGvAbai83KOP+HG5Ej+Kd9ljmJuQJ7csnKrWHlpPePpI7C86McIvJsqkjQxuBm1G6UQ3/itr7q72dF0U7OiM7o87/KNxIvNVhpMIipkVYI8r70UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWEjEoDaHyx8D7ETHnBAHXhn2LY10JL0lgsjPN9gVyk=;
 b=tBuM79ja/E11hWANBFpfWdTIK519F9Z7+06pChE54z0WYC6jF22Bf7MAWHzULplcoNsWNA9UeInhmxJBHOPwOzHW2mrWGKrkol5Q815nmjhLI6wo+EpPDDTF0IqkqSWOMAVadnANcIa89y9mclG8eKVrsh//7dvoSIrDAIeQ1jxjqh/MHYIA3FtM1t5IGI6lxxzfeMoQsCoEvi6H7zQwG1DEtYhDZ9aQlBrHTEvf6Wer6k/mN0vnvEkLlMSYsxYf7K+zQxNA0rmm+itrU8+jREe7hQqQ7vfRrj/VZp/jPR4znsHsewIrDzbz0tYOQp7TAEeBmz8b8kp5qCuKacOO5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWEjEoDaHyx8D7ETHnBAHXhn2LY10JL0lgsjPN9gVyk=;
 b=dzHODUDahg1oygMmoJL5EtJHfq49PCzZOkTi7g3PLlF3BCUeURlCeYzAUElP9f4GT5xcnU6QRZ5r7b1SNRmS6xIkMyxr0UnZs8DMnzznHGmJWbWJsD3G0sqw3uudfId0nIIAHDxtDdXEwJgySIdeHCYdx+beTz4JT6uWi8aIJLb3BvoTI1Y0aGxeWAdOkLliXNuMYIqIDrr2nVjIjGJuKAahf09cRRdJ8YLu8iUQYLMbZ7z+Gwg4ZJxWfA8xsKZoplU8I4l6UfMp3X6yTPljRbngTGv3c1tbeFXqHf9xODwDrrGcyUB7jrxpXqLQJKoXK5uXdUykJIG32mQ8xaJuNQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: [RFC PATCH 1/2] pci: Allow platforms to modify BAR adresses
Thread-Topic: [RFC PATCH 1/2] pci: Allow platforms to modify BAR adresses
Thread-Index: AQHc0WR37j+cn2EDhkOwlRb5qqOUDg==
Date: Tue, 21 Apr 2026 07:57:14 +0000
Message-ID:
 <a0f623792497ab92cfb64c50bd17d28138e10b99.1776756291.git.mykyta_poturai@epam.com>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1776756291.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11567:EE_
x-ms-office365-filtering-correlation-id: 1cad9d25-1e34-4a63-ed08-08de9f7b9a67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 06C11im4QuYEoP6kTyOh773VbiRl3fwlWog1JHRwuMP3bUieDs31c/lYM3bu5HFWV1l1FIHmqeAWl7V54JI7Qwm4dGfGAzaCcdfLzwGiyKlVRZeolVn04M6vbJ3gRHnXrXBXRce54xcCXstPQlr1ZSa1VdxNMi2/3lJ/V+xNAEcVeGno+LgPMELX5uC//AN3mVJURCMQrHbd8vf0ATThUL5HFAK2zLWNulDZbNejDDHG7T+4fqMdh7lJof0q2xEs2cw/hO+NPOsghOVtFPbaXcSMa93cw1eglTe61xgwRXaqFWhNWJJW+R6jhuzQJRpqSrF32gdwndYNxdBbJ86CFo9bkdrS+EdcGkUzxi3HNHUQv+vWwsTEGfRWT0yyMgF0dMc/aFf7Uzxo2FN1EPLYGeaj4HrqMFdo+Ia9Cj3Cckv6mwS7vkUE5p0CjlVqvtriOh7B86gXE25AdJHeJONk2udNlK6LhzJbE/8gGKTaCmJy4r8woi2CauWNlABwUh1iko7wXAW6U1JeYspnUdAMTitYq2I/tIdbdLm0AZZ4RoLjAXRqSomh53ehXckpF9RJk6gHGuZXtYmBfMwVrNLuTy0CNH5uqaSZ+Hz04A2k4+6abkquAfVk9FC8VMPzpgUtvRy5BPIYn3CcV29OUWndaQbc3AdFmbNRdPq8e3rQWVLYAb/bfFXF/usMmGox9+Sotn+6VSA8W5hp17KrMydt0qlIVv1WITLpfOmYtmtxK5eKlUdEZrXsm7JdaRiooBEu8zoVyslY0A+28EFh0hfKOcCBkCdowS//JPkoDKRgNQA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CMT7wg5GE/dIHgJnYImdjRKvEgpDs1VXn7t0J9+8dqos260v1504QpzchC?=
 =?iso-8859-1?Q?a9lnmgnL2SSwPQmIH1BqYMajd0Lz4AJvYr4B3aOuvdxQvQMO/MtPWi47aT?=
 =?iso-8859-1?Q?cBoV9qLTvi1Vivlid0AG0E1j4cooOutEiVE1PqxFSTH7zZ3nir9rGszN0N?=
 =?iso-8859-1?Q?6z6x02atMFRQPTRrc5hMw/I+0BNarcQaIyjPwRJTM/h9U1/s0UiqW6oM4E?=
 =?iso-8859-1?Q?zljhhAvxwGNjB3xNrHtFGinvYnEw7Ot94LqYiXVVgbQ3cYijjCSHXTrQrC?=
 =?iso-8859-1?Q?/d41xxtxpCxrmXhLFekdlFinL44Yg+2PYpPt7YrQWoC1gbQtiZgUlsqwyI?=
 =?iso-8859-1?Q?Zd14fF+EXkMGsZPf1o+Xc0rdSlpJnNnRcL7T1XA4oCGLZV07I0XGtwPpTj?=
 =?iso-8859-1?Q?vdlZQaLqZgyc7qQD1Qe1WZkRQIGYSmCeoZIdmxFaAkHNsoIdwRgjsbsICD?=
 =?iso-8859-1?Q?XPQ9cyXFfZTWpoYsbOPNMMK654tyVQ2I7jLCX9TOWxb87SsumKBd7M7Lm8?=
 =?iso-8859-1?Q?tEZP8Co4FSwKMD4kUheer34jwGeI9r83skzp9Q3hyA5qfz31ee0gYv470F?=
 =?iso-8859-1?Q?KvtCMXRAE6ou6YluJyTZbSkL/ArUrm4KQ+7P6rNe0I87SdgBfRqypo33EU?=
 =?iso-8859-1?Q?xW6sGLAmjuvZiditV66SpwWukS8BXLSuDzrwrtaRzXAX6tLhj1uALI7TxN?=
 =?iso-8859-1?Q?yRJ2fR3SVny0Gx7iu7O4Aip/5hp+m6O9AsWDuNUgsPGxCwAY80TUCkfW/I?=
 =?iso-8859-1?Q?oiWF8sJ2/16/+5c3yPtN0XpARq5XENkzSF+Hdc3yZPWdnorpQ3H8s3gtjn?=
 =?iso-8859-1?Q?jg2O3B0Adss9UDNnncI5rLaOFEVUNkHqABt2XsWzDTn2p7/kH3grDZJW0g?=
 =?iso-8859-1?Q?ZIestSYg7ZCOcoX3mRnk5jpW20ldJOYU+ZdWUygfy/A1arZpHGyEr9Dpr/?=
 =?iso-8859-1?Q?ZJL0xtb8vHdRh5CUmaRI/svEega9y+Lb1oVXpQx9hiHmU/vO/V0Oe8a2qz?=
 =?iso-8859-1?Q?jTmAL3H58nmz2INPeyEQoDXN2oBvii9KF7GRtStNQglc6pd95o1SDGA/QK?=
 =?iso-8859-1?Q?LSkt16aMlEU2N0+BVj8rgssZ28gY66wSAwLdREKdqsKEz+MS7OtUuUGUEF?=
 =?iso-8859-1?Q?8Vl6BmGUcQEnPqJQ5P5Kl+6o0DfG+OJX4iozqjjiKsVa1C8c5gV31Jo9yp?=
 =?iso-8859-1?Q?xhQWTPn9pzuflcyDl9RnwohS+axGXI1QdECwOJ9MwlRwHkwQdGt0wLXiD4?=
 =?iso-8859-1?Q?UzgjofCs/FJwncaPWEZj/ywYKZMyokwS96FJYKkLrN8Gw3AFHyITtkDQCL?=
 =?iso-8859-1?Q?B6O5DsY2UBxdgQ2VmVTzjUAYJbetF6KTnm8hsWrPiyjgfUp4GFLVVBbDp5?=
 =?iso-8859-1?Q?8beu5Bv3WwWka41JBnMynrQG1HbOvOQIPnJYmw65fCjdgIZFHDBOpHccrh?=
 =?iso-8859-1?Q?Qt3Yz//dezmRErXZH0mYMrn5ZOnzFShoOC4qPEY5x9PrwQnTzSklM6pKyV?=
 =?iso-8859-1?Q?7g/kt8mud9+H/PfyieBHfy1LlSaJMfQ/Re9iYkr4m8O3rZsUsLP38u1u7Q?=
 =?iso-8859-1?Q?8XVpdMJ/Dlx5Vi59BOSI/XMWVURu/SYMF4YeJxKbwty4yxVEjhsvN/cAs4?=
 =?iso-8859-1?Q?ckLGWp3lqYyokYw4M5OuZv+PjTn7BH1jzePMbGfQl8RCQWCXhgLTRHYSl1?=
 =?iso-8859-1?Q?VzXR25SftO2MkdYVkXCnhwOsh41xx8LsN82em95vO8bk2iqOOWY4MJEdwC?=
 =?iso-8859-1?Q?L9eIoHiC5MUwiRUkQQnLCDmJ6pQzizMG4sDnhptNVh7fQtWsHcGxcPgtqX?=
 =?iso-8859-1?Q?bpscjfMW7rj3nhB6XMfAulroLdcVV5k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cad9d25-1e34-4a63-ed08-08de9f7b9a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 07:57:14.1877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBKfZ12opV29qaJOOiCyjh31nN+wkmWGe9iwgzyiyKPLh6Rq+y20O4ZtujgbhPGtpOMMiAeePSdvp7dQyq1uQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11567
X-purgate-ID: tlsNG-d25034/1776758236-6FD7BCF5-A81FECCC/0/0
X-purgate-type: clean
X-purgate-size: 4165
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7B10A437E77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch is a preparatory work for adding Region ID support on Renesas
R-Car series boards. Add new host bridge op "fixup_bar" that allows
platforms to modify BAR addresses before they are mapped.

Because x86 don't have support for PCI Host Bridge drivers, add another
level of indirection in form of platform_pci_fixup_bar() function, that
will call host bridge op on ARM and do nothing on x86.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/pci.h  |  3 +++
 xen/arch/arm/include/asm/vpci.h |  9 +++++++++
 xen/arch/arm/vpci.c             | 12 ++++++++++++
 xen/arch/x86/include/asm/vpci.h |  6 ++++++
 xen/drivers/vpci/header.c       |  2 ++
 5 files changed, 32 insertions(+)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7c3211823f..398a4eb746 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -80,6 +80,9 @@ struct pci_ops {
     void (*init_bus_range)(struct dt_device_node *dev,
                            struct pci_host_bridge *bridge,
                            struct pci_config_window *cfg);
+    void (*fixup_bar)(struct pci_host_bridge *bridge,
+                      unsigned int bar_num,
+                      paddr_t *addr);
 };
=20
 /*
diff --git a/xen/arch/arm/include/asm/vpci.h b/xen/arch/arm/include/asm/vpc=
i.h
index 0cc6f5a105..f5c817a51c 100644
--- a/xen/arch/arm/include/asm/vpci.h
+++ b/xen/arch/arm/include/asm/vpci.h
@@ -16,6 +16,10 @@ struct vpci_arch_msix_entry {
=20
 int domain_vpci_init(struct domain *d);
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d);
+
+void platform_pci_fixup_bar(const struct pci_dev *pdev, unsigned int bar_n=
um,
+                            paddr_t *addr);
+
 #else
 static inline int domain_vpci_init(struct domain *d)
 {
@@ -26,6 +30,11 @@ static inline unsigned int domain_vpci_get_num_mmio_hand=
lers(struct domain *d)
 {
     return 0;
 }
+
+static inline void platform_pci_fixup_bar(const struct pci_dev *pdev,
+                                          unsigned int bar_num,
+                                          paddr_t *addr)
+{}
 #endif /* CONFIG_HAS_VPCI */
=20
 #endif /* ARM_VPCI_H */
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index d41aa383a8..ec6efec22e 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -189,6 +189,18 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct =
domain *d)
     return 1;
 }
=20
+void platform_pci_fixup_bar(const struct pci_dev *pdev,
+                                          unsigned int bar_num,
+                                          paddr_t *addr)
+{
+    struct pci_host_bridge *bridge =3D pci_find_host_bridge(pdev->sbdf.seg=
, pdev->sbdf.bus);
+
+    if ( bridge->ops->fixup_bar )
+    {
+        bridge->ops->fixup_bar(bridge, bar_num, addr);
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/vpci.h b/xen/arch/x86/include/asm/vpc=
i.h
index c501ff1709..a05b70abbf 100644
--- a/xen/arch/x86/include/asm/vpci.h
+++ b/xen/arch/x86/include/asm/vpci.h
@@ -16,6 +16,12 @@ struct vpci_arch_msix_entry {
     int pirq;
 };
=20
+/* X86 does not require PCI BAR modifications */
+static inline void platform_pci_fixup_bar(const struct pci_dev *pdev,
+                                          unsigned int bar_num,
+                                          paddr_t *addr)
+{}
+
 #endif /* X86_VPCI_H */
=20
 /*
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a760d8c32f..d89e43354c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -882,6 +882,8 @@ int vpci_init_header(struct pci_dev *pdev)
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
+        platform_pci_fixup_bar(pdev, i, &bars[i].addr);
+
         rc =3D vpci_add_register(pdev->vpci,
                                is_hwdom ? vpci_hw_read32 : guest_mem_bar_r=
ead,
                                is_hwdom ? bar_write : guest_mem_bar_write,
--=20
2.51.2

