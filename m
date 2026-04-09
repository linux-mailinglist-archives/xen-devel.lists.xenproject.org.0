Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJNcN2+h12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:54:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDCB3CAA43
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277285.1562507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAotN-0003gb-Es; Thu, 09 Apr 2026 12:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277285.1562507; Thu, 09 Apr 2026 12:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAotN-0003eS-Ac; Thu, 09 Apr 2026 12:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1277285;
 Thu, 09 Apr 2026 12:53:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAotK-0003dV-PV
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:53:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAotJ-005WOX-Ul
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:53:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7a143-2eae-0a2a0a5409dd-0a2a450aaaf4-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:53:49 +0200
Received: from [52.101.83.18]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7a15c-ee98-0a2a450a0019-34655312ed73-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:53:48 +0200
Received: from DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) by AS2PR08MB10228.eurprd08.prod.outlook.com
 (2603:10a6:20b:648::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 12:53:42 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::4d) by DU7PR01CA0038.outlook.office365.com
 (2603:10a6:10:50e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 12:53:42 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 12:53:42 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB9267.eurprd08.prod.outlook.com (2603:10a6:20b:5a3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:52:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 12:52:37 +0000
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
 b=a1uqdUafxy0TuFXHMMbfTyxdX4NE/S1aQPBdoOpFwLvUkEqUWCvZxBchfn+k+bSGYVrrvNNabbkP9sh39TYou5ZQwwxSURXo4or92Y6bjDn+40Ygd1unfvh4KvE5FjEdl4tXu+3CCMRe4BWUE7TRMz85VbmSYqcHIhjz4IO2NN1yzfBNfY1O3uMqDAdx4udNLbz+AJMpU1i+D3RS8ZJfGb22uMaqnXzlQHI/jsp+mPmExrUs0vqavR0YS+DQIrS3AUK1KuUH/j0ytI9IC0sT37roCOKn7ue+2clWy4anUerNslUIz9VD9uevRDx2d3Irx7953rWFODey30oshpFq7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ry1nLhn8aE/3+ejlD8Hkoinjt5LouqGIiM6a9TdlKA=;
 b=kowDhH/7nBq4sGiXlHD1ySiyHOnrVqRmH+26FcRsArXOB7EL2L7OlcgZUj9k3AV3tqu8RVTaS2JrtY+YV1dr1EIRrUKyUobuMmUqot5MzHfqQ6z0iEoc4rce3WFy0ouPJNOOH/FF6Dz452c32GBIijbZt0cMcQW3cLrsZJDeeD39nVJjGYJNeB+16WJBRBLxE0VrY+bSQqXWYFQVGr8Pdk+vyubA4EmNgYzuQspoOk0Y3Hhyq5HV7eoZXWV0b5Z3yKteY7y/EjABdsV8eOZd+8fAHnB5DOBqewdFztN7rPDIzkJ1B2AFM29xzSEQQXZQu5c9QTpuhhuVe5pTeJYBtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ry1nLhn8aE/3+ejlD8Hkoinjt5LouqGIiM6a9TdlKA=;
 b=Wy5Tvgl6zHFh1dIMab7uETI2L0wdF+87Vm9J471nWFsMZ3BqlU/ZJGJMLR3pEYAqVkt2pr9q6BDEHBwahhtM3CohWw+U3OmrwtHLzDOBWAFOf4lrXLCSEfZkdnVE0q0H61ec+dcU3Gg/34XYrXrou3wXPV5pw78CwfIZF2myTjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocYVy7SmYmL9y8hqiCNq4XWvVlA5nX5zc9+z3I2z4BJa01flNWgrIWFe47/92wZ5hRjKN2PxwMY6P86chHx+qFbbk0rw0Hg8QNsoDRiRFj601cTce12OW3gqZawKA0ef0RSJ9EI15bwT/3H+XLV3O6i0GtD0ur/npAp9y/yp/c4eEgYwt+sa95jIjD3YhMcNvjeEtWdToa6dWagWkIUqE0A5ue2sQkrAOc7zAtEX1Z/+nbbcz+Iio1cwg4YBBSW68KMOtb1z5b980uvrR5UZpNg18B9j7wxesJb5ttXNXRSQxUn8uZW+LA61t0KXSU0d/DGLDNj32n2cL/EYsK730A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ry1nLhn8aE/3+ejlD8Hkoinjt5LouqGIiM6a9TdlKA=;
 b=sSeqUYiqxPt0PI0KoOEJe9F1wYHkuUkKJfSK8IZ4zid6KXcjO1tpoX+od0rP7RR74s76AiMtMw+GGc8619rDJrJrWxeLUlmQP00wqg6TeXrJASNF5epEazSai5zYdBqpU7jqndR1wAEsjOJ1Nytw4qijiOkMA4ibh4zWStkNKaPNPQ0Gxk6HH/N798vEKJ0j4QKUs+k6tXucLg1E2jZ45f6RJ/M7NaVaQFsx7rs4SV4Km1kwDur9nzBFy/AQV7Zq0QVYAHJrxHlYm+Ars+qiaMcGnqdhJz8O4C8KEi/xUPwapPaphYnR33xOPwUnce6w13SMJb5pLUQIPgYnoHlqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ry1nLhn8aE/3+ejlD8Hkoinjt5LouqGIiM6a9TdlKA=;
 b=Wy5Tvgl6zHFh1dIMab7uETI2L0wdF+87Vm9J471nWFsMZ3BqlU/ZJGJMLR3pEYAqVkt2pr9q6BDEHBwahhtM3CohWw+U3OmrwtHLzDOBWAFOf4lrXLCSEfZkdnVE0q0H61ec+dcU3Gg/34XYrXrou3wXPV5pw78CwfIZF2myTjE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Topic: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
Thread-Index: AQHcyBWdW2bjkWPifku6XWocvaXOWrXWpuWAgAAHZ4CAAADggA==
Date: Thu, 9 Apr 2026 12:52:37 +0000
Message-ID: <9A42538E-AB13-488E-9AEF-39CD7E8D3131@arm.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
 <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
In-Reply-To: <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB9267:EE_|DU2PEPF00028D00:EE_|AS2PR08MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: d93056ef-874d-42d4-6441-08de9637073b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 IxLvFiDJgOxpzbVcnTNfxPo9UMV8ZlREX/DaI1lSbhNIsxh2XqcV36YmfXn6QYmurNjs08Tk6N3LZv2JscT5aktwlE/FtBoKWUwMaLsc6bg+FV0O4swEOpxxFChYqnXNM7psVThXogoQ0lkLCzsEiYYT1hpIAPt4UTrLcWeDbW2hrcFJ4dzLlSVF3mADrLZLn4/X39UXHBsM44PaZcmCG2zWMZjPBsWwXXZ9O5UTlawlujJK0dPfvYcqaYeu+voUiQYuMj0/YvhAb31074aNpoRAUBOTeoMx3ri1m4JrPcJzCx0syQI/PwUrsVbLCDPqviZmDgtYucdcl3YVMPNPr8TtEKfI8p9aQ/G7nkHpea1oNQ9RHkibUdegvBbhn2HWPcJE4c3cMkiVm5+2QyB9NSzXTh4REqI+AbqtLCU8n/HzD1dc/l1KVsoLkxhBz1XikDoLvroY0ijIednvF+YsEkKfg6oZiEZ2YF7wnQ6XbqK6RfP6RUR1laGBtHSQoBIoGM3WNv/bYeMK/tB8jf+G/eISZN0p5RdbDCP3VTwV3lbwD7jQu5fhgPnzLSopZMhS8xsXFlMjMd6w8pm+p1ZAoqwj8zbfy90XTvP8U71VmlqFBNTY2YMkgg/NYvf8dvOEEFGGqnvNxKZnWjtgBJx1BV2EVKn8AvZBlsUJcsalkc5Ks0L1/unw3YIcy8SMDO8zPnxR2+PL/honLmQbvoJyGOYtOjlqCINOrckZO5ZwRKJl5ttOfcw16I7NoaQDkWnHvugwZarvjGL6sk3iRDR2otGWkki0XdLi12PEuv5VG5Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAC1836DF622894292AA325AEA5FE7A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 g85VCcH35LzrFCvlW7EUnhzZUlH5PAOVbO3PTOj7WQvyc1MuzzEuVzUkpS/Qz0BoecqvVj9zy+x/hNp75AnOXlVOkGbmeLFBIQoosuP+TxXWXraH17iqUFsyAhiKoKBFjri8e3iblHwR28oRNzu3lprPDg7D1Jiu2kLfAo3uhiJ2824ZYyZ2r5mOfkE7fv0wFkCOrZJfYZfWYni53zXbpbEnK7D4Mk0Fx1plWNXjFrhKfgE24HSHXI70hO/S8548bi9iqONChVOWYTOFVl/I5bAI/2y38y/xfVEqwmYq8t+64p+awAwK/gbUmUHt2WjM6wz1IGFqEUK52bsrlwVm0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9267
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79d4e6e1-c5e9-459f-e2f5-08de9636e0e3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|35042699022|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GkTf6PyuMmjSI4IYuEuI8k5p0d7vtZDJ3P0esVkUahHDlbr4ywSArBniGX8nhVdbFdAiBNxDK7yFWhPOZ8fhF4ZbIfcwZcsq0VycwbZJyaUIW4YJ+zJMSCcRTM5p3TYQEYc4s/UwNthZXtaMV765XZl2zNZ7X+oVDJdBzlttT2r4gM4jQB0kMNIZe4xCD7XtfZn6AT/uqnMlm+L7x/Y41oiBpsupZzNtNM2erKixYWLTrC1lNMUr+bFgx/H9m+H0W9ovXp/gyZ7PTSBry3t5C8LLwmCBYmnK5Kb4dnkC0dhr3owS1O6pujbx9AzNkV23NAdSMTthproDE1+QCZr1wTVy69ZnqO2SC4ttvyuv2pU+CUNVjT/WXzpZlK+JUTH37U3pMZtcHhj6x1apqxRE6v8H75c7IwF78Vlwthm/1BZ73NlJsWICJNSzR3972jtW5C+4zvwtmrXrmbI7576DfKhNqWoxtvzTChpZLhoHl47GScVEzEMOBpS4Ef+IiKM3Xyit/l9VggulvEA7YzGXjJG70Gn4JxRu+/VzFjFZp9t+zm6PFDhVKgX25r+jzF/gILqkC51OiUKwYYNclyrxyKeujz38RK5ZvaJvnOc1/EVCNq+8DmKsyekPSmzcjKT4xQDH26nFt77w2inzZJhOqK8zqs8HAVlwl+XfeevFX8fWLF+Y60QFUw2mluQf463Y3L32f9IO4BbrUTQIMmdF65CdudzzwqlntDKoWEyDIMND3F4cUdL1sB7t0nU1q3/vOJbjisP0Ytv9k5YWzvmcew==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0yJdCZ1UKcmvtvHxpLt0n/Uvl0ulBibsuzOt5tMqCoy5o7a+BxkyVvp6tzt5erDfT3ZjUdHKfV55saNgZMO/6LT32Lz9LRe2tXk3hVSOxElAEV3RrTNjohhQof9zNOQcfIGtXiA2kAAeDlAQnwYmN7mhZ1AVKgqzhl+e9aBCJlaezlGh5od9Ot3hh5PiFFA7rrJwfXrpE9DHQijh2AEwkKMzB/bNR7EAPI4tbOKvMukMim7pHwCepzquyZCTC4tP5crFvN5Iu7pRVWwm8szTG97Ywp7ILSVrohRgHdReJ432Scn9IMZM1032c4qld6tIm19yWByLFsC0kL1/gn575m9yhZyF7waWkH76kcGOSwfnUynZVNLnqcAq2RfU/kYwA5ft1WAWXbNRuWHKd9wKXaJbwwIrGtYJT6qrfNM6RwkaIDwbJDo5SIJsw4vxeCk/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:53:42.0791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d93056ef-874d-42d4-6441-08de9637073b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10228
X-purgate-ID: tlsNG-4011c0/1775739229-0DB550B1-935C9E31/0/0
X-purgate-type: clean
X-purgate-size: 1726
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1FDCB3CAA43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gOSBBcHIgMjAyNiwgYXQgMTM6NDgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOS4wNC4yMDI2IDE0OjIyLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+IE9uIDkgQXByIDIwMjYsIGF0IDEyOjM5LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5v
cnplbEBhbWQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBUaGUgY2hlY2sgdXNlcyA+PSB0byBjb21w
YXJlIHRoZSB0b3RhbCBudW1iZXIgb2YgY29sb3JzIGFnYWluc3QNCj4+PiBtYXhfbnVtX2NvbG9y
cyAod2hpY2ggaXMgQVJSQVlfU0laRSBvZiB0aGUgY29sb3JzIGFycmF5KS4gIFRoaXMNCj4+PiBp
bmNvcnJlY3RseSByZWplY3RzIGlucHV0IHRoYXQgd291bGQgZXhhY3RseSBmaWxsIHRoZSBhcnJh
eS4NCj4+PiANCj4+PiBGb3IgZXhhbXBsZSwgd2l0aCBOUl9MTENfQ09MT1JTPTE2LCBzcGVjaWZ5
aW5nIDEgY29sb3IgZm9yIFhlbiBhbmQgMTUNCj4+PiBmb3IgZG9tMCB3b3VsZCBmYWlsLg0KPj4+
IA0KPj4+IENoYW5nZSA+PSB0byA+IHNvIHRoYXQgZXhhY3RseSBmaWxsaW5nIHRoZSBhcnJheSBp
cyBwZXJtaXR0ZWQuDQo+Pj4gDQo+Pj4gRml4ZXM6IDk1ZWY1ZGRmOGEgKCJ4ZW4vYXJtOiBhZGQg
RG9tMCBjYWNoZSBjb2xvcmluZyBzdXBwb3J0IikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
T3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPj4+IC0tLQ0KPj4gDQo+PiBSZXZpZXdlZC1i
eTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiANCj4gRGlkIHlvdSBz
ZWUgQW5kcmV3J3MgcmVwbHk/IElmIHRoYXQgZWFybGllciAocmVjZW50KSBjb21taXQgd2FzIHdy
b25nLCBJDQo+IHRoaW5rIGEgMm5kIEZpeGVzOiB0YWcgbWF5IGJlIG5lZWRlZCBoZXJlLiBGb3Ig
bm93IEkgY2FuJ3QgaGVscCB0aGUNCj4gaW1wcmVzc2lvbiB0aG91Z2ggdGhhdCB0aGVyZSBtaWdo
dCBoYXZlIGJlZW4gYSByZS1iYXNpbmcgbWlzdGFrZSwgd2hlcmUNCj4gdGhhdCByZS1iYXNlIG1h
eSBoYXZlIHdhbnRlZCB0byByZXN1bHQgaW4gdGhpcyBwYXRjaCBkaXNzb2x2aW5nIGludG8NCj4g
bm90aGluZy4gWWV0IG9mIGNvdXJzZSBJJ20gYWxsIGVhcnMgdG8gbGVhcm4gb3RoZXJ3aXNlLg0K
PiANCj4gSmFuDQoNCk9oLCBubyBJIGRpZG7igJl0IHNlZSB0aGF0ISBUaGFua3MgZm9yIHBvaW50
aW5nIHRoYXQgb3V0LCBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLg0KDQpDaGVlcnMsDQpMdWNh
DQoNCg0K

