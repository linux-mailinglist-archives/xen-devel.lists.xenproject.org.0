Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K57Bia/12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:00:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91613CC508
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277673.1562810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqrx-00072m-RI; Thu, 09 Apr 2026 15:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277673.1562810; Thu, 09 Apr 2026 15:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqrx-00070f-Nn; Thu, 09 Apr 2026 15:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1277673;
 Thu, 09 Apr 2026 15:00:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAqrw-00070R-09
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:00:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqrv-005v4z-9b
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:00:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7bf0d-5cb7-0a2a0a5109dd-0a2a45069132-18
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:00:31 +0200
Received: from [52.101.84.25]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d7bf0e-0df0-0a2a45060019-34655419586b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:00:30 +0200
Received: from DB3PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:8::17) by
 AM0PR08MB5380.eurprd08.prod.outlook.com (2603:10a6:208:183::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 9 Apr 2026 15:00:28 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::e8) by DB3PR08CA0004.outlook.office365.com
 (2603:10a6:8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 15:00:28 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 15:00:28 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PAXPR08MB6493.eurprd08.prod.outlook.com (2603:10a6:102:15a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 14:59:24 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 14:59:24 +0000
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
 b=NdQK9lxF2d7wzYnlAT5bf/Wb/LzELNjID+p+AvDAuPVqtuLfXlqLHy1epdO8ut4hDdatXXr8/4zlA+sU+0rJyLRJ8VXO6g/9QtVphmhpLbz0R4ECP1LdYbCMQmEV2D9h3jkz9W0XPIWhurRspTp21VFttkKiBKvk6VO4comwoh1mzK5eWnuhOKF7KnCtr8IJgnp9iu3lv7C2CD1jeDOCE8dt5Z1+/j8IRO47v46OebKJMkOXsCzY1CLMz7BitjeXjIZfP8e3EQ9AA74gm2ruqmaiDUiJOZQ9mP1MU25rXv9ev75cuOyHDWmQy8AObUGeURvspPURFcGsVKnTH1kCLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWhPDkH8+Dfkt9b7BQQm2O9WTlUGqEoHkOJc8L0mYtA=;
 b=orFGUD7zBFBCzHyWT+3kK0aqqic7+L/EoN9oX8eZC3KwYVFlW3gOzk7rDguVn6skL8NrH2/eJ0W6NKNXxcYg5ik5hUmB3Dv4rw5rje7F1/v4abH8Ot5Pp1FZRSu3x9G5arVk73uVBIUjUetHl5N/3bmKA7idxV1h7iDCRDWiVYSsUZpAod4uahzz38joCAap5k4koTP+x/SQeIewujAF39lQkXPx7oZKrriOp2hEm+/McnTNWa9ramUmCGk8WKWaDPB137Lm+MWrwgAUJex+Zt4HQRDnBhNY7xraHgkt3Ys7TTWUy4GyqkdOVgo1lfWjNMIi9EsCavwC6AO/hdgYnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWhPDkH8+Dfkt9b7BQQm2O9WTlUGqEoHkOJc8L0mYtA=;
 b=MO+Th7W9581/mKJAi3hxOkaw6L4mNcuH6xGiVHZgdBxZlEJdCuvh2QpH8HxBfiUMNnFuO5hlWa9Up3FuNqsNp5ZDzGv34fnIx3mpyGyRWlSz86FJTbKsc7WFQvfqslQxqF5Pdaz/Q7dPayKEuluWgZLC90aZG0jcTBEaT5vnzJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLZdhlZx2vtssKRZlN3HlXjOh63vcARApFb4MVJQaX52YuibjNZ/NQSLTPJskDkQfUafoKuu7SbWNKPvp+odJlznljxEjZrb/3zeVf+gq3t4QL0FyGTPmClluXC2j7y5q05NU/57C4oEQi/dlsfX3x1mwvShhvv2pKTGUUASvTHcjvrMMuFVxNDAI3c6ujijgrKnq+AeZOartOZ90vwep5YVi2/550uMiykASXlvqsSWMWtn8mqC+kfocqiU5imvpV1huhv+JZ+OvwQRLecFLT/cYSfmyrJD5vzdQc50VcRDK9sCx1trG8SZD+emvyFYkpquSKUZJ41t5p6xl0Ib7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWhPDkH8+Dfkt9b7BQQm2O9WTlUGqEoHkOJc8L0mYtA=;
 b=R0ZhCueBbLeUp53WDfvatEFaAMdOOyh1HTw3U+HBvvs5jm4MDEaH3mD2YCdEQFiFKsKqU4/2axc8o5zFt+udWuEOf1QCaZFQT6gMp1cFpfXrF3Q8KQKGFgJFpCaEC5Eta/REWRE1+vviZ72Eq5EyfZz3PScbdZcyQ9jKQLcRhypT9J7ySDI9lqeSejAUgL3mYcPHH9mR053uudY7zHQyt+JmpPz14P/QANXDPU+IjANeJ6pf61iFrldT0XiW0M9zkcnrHpBwfniJO6uJxI6SR6W6wkk3h3K1wE9TsyXl5FcPXjLUgVTG2fwod7PFuF9qt+eZr+z5XJA3SJytAb+UhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWhPDkH8+Dfkt9b7BQQm2O9WTlUGqEoHkOJc8L0mYtA=;
 b=MO+Th7W9581/mKJAi3hxOkaw6L4mNcuH6xGiVHZgdBxZlEJdCuvh2QpH8HxBfiUMNnFuO5hlWa9Up3FuNqsNp5ZDzGv34fnIx3mpyGyRWlSz86FJTbKsc7WFQvfqslQxqF5Pdaz/Q7dPayKEuluWgZLC90aZG0jcTBEaT5vnzJI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Eric Auger
	<eric.auger@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>, Will Deacon
	<will@kernel.org>, Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 01/23] xen/arm: smmuv3: Maintain a SID->device
 structure
Thread-Topic: [PATCH v3 01/23] xen/arm: smmuv3: Maintain a SID->device
 structure
Thread-Index: AQHcyDF0sX1+ul28x0aGM9udNvQpDw==
Date: Thu, 9 Apr 2026 14:59:24 +0000
Message-ID: <54FF0879-2DDE-4BE1-9BFB-363AFEBBB294@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <4fd154cc1d76972d85df6c426320555d6894adfb.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <4fd154cc1d76972d85df6c426320555d6894adfb.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PAXPR08MB6493:EE_|DB5PEPF00014B9A:EE_|AM0PR08MB5380:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b07bcd-2c5e-444e-1501-08de9648bcbd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 ZgrkpU4lbB1BXqVAf2xUfrA9WRoYu4/gPD+mkGHlPJRQeLgboSNvDb1eP2tlbQetC6YcIyARTqii4fDTVB2guNRSFFOgMvrPOlV4MUqRvuaJ+JYDtvycRlsvIlrehPcsNjS9KH57oryPHkRAvtc1Lp1eP0AkwU7W2pqAV+4RcIn1BKsEJ4MDxDwvruH1cdkwyOJOBM7ZZSL0lAnbgi4LJU5kFhc5q2N+BzH+gr9wa+5HMwa1F9ggt/JlARDxTka+WNQ7hTnoR+AVZnOBqplVEH9Q6bHZui+Hfs3DI48rBCtj3wOHFCDAgYu6m4wKvN6TfMwKF4XbcWhUp+OxVSqi9rs79NGzJJbPCmHaCkaIePxtkPE4oFWMUzG+wZLJPwUNkhlmDOGxdCNpfwAlMQYaxqUQ/zpvorHlhemdDyBWvNNChOCa6xBiLs2xCUL4AyexusB9WFm2OW9cwarqhJhhs/tSaQW+esefn6KzSQo5y0C0g8Ef5NC7DQWDvfn9gbbsd41q9PX7Tv6YFLD/xKBuKuRglfMO/gSAnZ4yGZYLWqkw7nZ6jq6fzFZNJvvRFom7Qyh0XrUHvjllYC/kHN78FL4jAU2OSVt0T4+HVwwE0xNQX+fhpPOQKyALibfiu9n7WAERy0bpElHzpgnbcpy8L0Vi5WYV+Lg0ci65I0r+WeqaRxbtF5dohCkwWUpzlyIECe/x2Nid1RF3CFWnO+7SvoE1k3Hp5FqnZawRX1wQAqpG9kcAir/aMuK7cCbYY5lyVXUHMeXyq+ZSpnMkpHyUYAfv8qJcDus2xIpzgy2tfmo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <158A836962561441BA4625205FBA0800@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sedmtIixWqYGKiIjXhZt0TcDdjHGr5P0BM/QcGiTtsGHE9VbBWWRUu0OMEA5RaW6kWSZ9hRm+kSlsGYVM5VY2CzI4XIjcf74B6yYHUhrV/8XOEx9yxLAOEgoSAwILkGbNnuOxxaa1/zYMr7l0+DtlS7ssXAFP/0VA/mECqnHZibysZJlikDKnb4wAhkE8rTPzEl4OuDftbTM1wIG6TlpmAYU1RuhuzhBPYHdsT+xjrosSJastulBvwgwP7P/E0N99yL26/agRTsoZPxA++y9TCgo+bH3OzMUJFEs/o96Kf77lX9KGm8V6FwA/hzG8juhKL1RPtSOaPsWZYipwLcPYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6493
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d5687e2-9821-4243-5313-08de9648968c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|376014|36860700016|7416014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	o0lfb4k+ZQFE1M25tRWpz6ep1CA2WDpe/4P6VcDMzHI2HLYmQIbiAzBSUHD/SNT2iQUycXtnA628RCjz+oqU05W8jWs8EiMo+fvMlRZCr4ylJCLS1B4n9TkqxBvoQiYdG0OqUKYZEO21F2+gQ3L9Pl76x4/ynZSZUyqkY9whmRW78sZP1n+S9/H8RT8pCBoNGNiL2lpSb4dE6dkrXzseX34JUW+bkTcUW7s8HVWFD21l0vm5UGtDBltb9Ye38APjlHwUfcgrKhgp+bB3C62RrOZTk/2s5AHIzQ7DjoQNW7J1Yu5op0undQ60tfhBhpXOSS6mKb0aySdW644ZtJut9EW6uiUqHrFLoDdd5pDVc8qLdbKJVj6R85Z/O1X0DTFYRKeRaiWqavBIe4loEKPIYSiq1XgwvDEOalrjBD3D07Q9mLZ5P31/Bdwr6jELvzHTCpIH91/YKAfR/RyDAy6PmHvK6KM7xubS07Dq8MZi91maeD9/5Kg9XO/tyJyLes35iNhg2r2pXEJF1oRfn8+FNviLhe481lJOAmtfrIJKnus3gip3CcrrQTpSuqPAHJfgFCniZTG26HmXyKNfB0187xDiy6dZ+Li96ph68aeogENCYNs9lDv+qV7S3QkdKBhK2hRKkKb3EU0bGEiX/RRr1ib6WENkNgPqXhXo0LFCWtDoAEztUJ4AAgxXWBgDk42t7tSOHAya0gRMN5MRFY52Rfb5ISTGS3l5Lfu7/wd6riSjjwwXOntY2IyCma4r28hNCuOxfOcV7z87lMWGNCVkTQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(36860700016)(7416014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R8jZLIA4uQBEspWA4SPU+INH1Gt+b4KM3YxyU+GCbakrgz/WSA0vWsefYs4oe53bVfd+47OuLbEr09vFeyxmy1dnWidRRtByhBVykE9O4lzkp/yugHACEno7E15BDL7OPTTzxSIEeNzs4a88SIdjU+KKmFwWsjamSZ5WlQGNzYZKLdXwKPF9rstONjFTbK26b7SA1Drcnua94qEetjQ2x7rInf15my8QhQWRFyBKddEckXtY58G92Gurrl/SC0kKQgPWSMj9gjH1Pj2CNlTpWkrpqxHS0ZmGdeT76ULsAuylJo2jczrrD5QL79EZdiAcpGDOwpsnI4Y0iU6jyy6/umm4nBwRMGHYt46OBIb3xAT5xVdnYMqnnI8QpG0DvImoRVHzbQLi2EFORSDUIBW8DBskCJHXOvPkCbFACEd1JntPKNsgmD+s/IAKKd6WdkVV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 15:00:28.0492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b07bcd-2c5e-444e-1501-08de9648bcbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5380
X-purgate-ID: tlsNG-16d1c6/1775746830-5E7313D8-5923EBF9/0/0
X-purgate-type: clean
X-purgate-size: 2004
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:jean-philippe@linaro.org,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Jonathan.Cameron@huawei.com,m:eric.auger@redhat.com,m:zhukeqian1@huawei.com,m:will@kernel.org,m:jroedel@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.de:email,huawei.com:email,epam.com:email,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: E91613CC508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUxLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKZWFuLVBoaWxpcHBlIEJy
dWNrZXIgPGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZz4NCj4gDQo+IEJhY2twb3J0IExpbnV4IGNv
bW1pdCBjZGYzMTVmOTA3ZDQuIFRoaXMgaXMgdGhlIGNsZWFuIGJhY2twb3J0IHdpdGhvdXQNCj4g
YW55IGNoYW5nZXMuDQo+IA0KPiBXaGVuIGhhbmRsaW5nIGZhdWx0cyBmcm9tIHRoZSBldmVudCBv
ciBQUkkgcXVldWUsIHdlIG5lZWQgdG8gZmluZCB0aGUNCj4gc3RydWN0IGRldmljZSBhc3NvY2lh
dGVkIHdpdGggYSBTSUQuIEFkZCBhIHJiX3RyZWUgdG8ga2VlcCB0cmFjayBvZg0KPiBTSURzLg0K
PiANCj4gQWNrZWQtYnk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2Vp
LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4N
Cj4gUmV2aWV3ZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFAaHVhd2VpLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogSmVhbi1QaGlsaXBwZSBCcnVja2VyIDxqZWFuLXBoaWxpcHBlQGxpbmFyby5v
cmc+DQo+IEFja2VkLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPg0KPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwNDAxMTU0NzE4LjMwNzUxOS04LWplYW4tcGhp
bGlwcGVAbGluYXJvLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBKb2VyZyBSb2VkZWwgPGpyb2VkZWxA
c3VzZS5kZT4NCj4gT3JpZ2luOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IGNkZjMxNWY5MDdkNA0KPiBTaWduZWQtb2ZmLWJ5
OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWls
YW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQo+IC0tLQ0KDQpJIHRoaW5rIHRoYXQg
Ynkgb25seSBiYWNrcG9ydGluZyB0aGlzIG9uZSB3ZSBhcmUgaW50cm9kdWNpbmcgYSByZWdyZXNz
aW9uIGZvciB3aGljaA0Kd2UgZG9u4oCZdCBhbGxvdyBhbnltb3JlIGR1cGxpY2F0ZWQgc3RyZWFt
IGlkLCBoYXZlIGEgbG9vayBvbiB0aGlzIGxpbnV4IGNvbW1pdA0KdGhhdCBpcyBmaXhpbmcgaXQ6
IGIwMGQyNDk5N2ExMWMxMGQzZTQyMDYxNGYwODczYjgzY2UzNThhMzQuDQoNClAucy4gSSB3YXMg
YWJsZSB0byBhcHBseSBvbmx5IHVudGlsIHBhdGNoIDMsIEkgdGhpbmsgdGhpcyBzZXJpZSBuZWVk
cyBhIHJlYmFzZSwgZG8geW91IGhhdmUNCmFuIHVwZGF0ZWQgYnJhbmNoIG9yIGNhbiB5b3UgcG9p
bnQgbWUgdG8gdGhlIHN0YWdpbmcgU0hBIHRvIGJ1aWxkIGl0PyAoaG9wZSBpdOKAmXMgbm90IHRv
byBmYXINCmZyb20gbm93KQ0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

