Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLdhF0p6AWqMagEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:42:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71843508A81
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305801.1577950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMKKv-0005fl-H8; Mon, 11 May 2026 06:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305801.1577950; Mon, 11 May 2026 06:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMKKv-0005dI-Dy; Mon, 11 May 2026 06:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1305801;
 Mon, 11 May 2026 06:41:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMKKu-0005dC-0z
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 06:41:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMKKs-001sx9-Uv
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 08:41:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a017a1f-5cb7-0a2a0a5109dd-0a2a450cd110-46
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:41:50 +0200
Received: from [52.101.65.61]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a017a2d-62f1-0a2a450c0019-3465413d967d-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:41:49 +0200
Received: from CWLP265CA0402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::12)
 by DU2PR08MB10229.eurprd08.prod.outlook.com (2603:10a6:10:496::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 06:41:43 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::eb) by CWLP265CA0402.outlook.office365.com
 (2603:10a6:400:1d6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 06:41:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 06:41:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6408.eurprd08.prod.outlook.com (2603:10a6:20b:33a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:40:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 06:40:37 +0000
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
 b=UxffaIdkxn80s02BuJHF3zKIDjs9L7CN8J2R0vwgT/aGZZ7CRO5kZa0LpWeV+9ggrWac/sQ2QKty8kHOUk+aMjYVpjw74yGdY+f48INlaOejjbTF7JDTAvbDWQLmkY7Rcbpz0a902eNA/64FSZSmv7dDRRMx5fpdDWfa2l1oTrJ5sRl/e1UhF+4Y1AACUfWCVnx6VojYlV+BexnSDg8VRJ7Vmhpszb6x804mxrDlr8JFn9obRIfB6gnG8o2Ya4CayXaGYZCdmGlGVKh+Tg9Ltz5nsWPLYRnIPMi7k8KA7iFnhduTj7pOsPqHBVz6j0kVjQ8LzIL5gyu+oeB33SuAEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46TNZ7N5CLRKXK/jnAyrxUQ6YHSrZE5xfoFM9EUcVCk=;
 b=yvkPanJ7U8nKVYfaK3UDo560uqbsZ3D2/9GKiQCzafHxOsWIS2UE7zosROqUyLLmUGw2eNSn3PKHz7zWjYVsagIrNKa8sx9UkLIMcy9VNL5ca2hQhL/UYmIktVn+ikBTgBQ6P6smF8Z2bFZ1Rk8BCZXHXMzsJjARubJHAcAXD2BmqMWTXTUykwEIFfZ3Kr2sOSpB6BU2FgNACLKZhCIfxo7Mx7EpxKu2ReYwCXUMqjXZZiCMnXVS0BcgMhfKjO3FHjhh9sLaZtU11jzVYookpXiU5qYsx4RRlDEEJA7aRTy06afMIu/WcQ4QorRHftxmFK52PTC6UqrGeoV9QELMRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46TNZ7N5CLRKXK/jnAyrxUQ6YHSrZE5xfoFM9EUcVCk=;
 b=qsZnhCVN6TxcV0JgfiqzmJhJOYQ29g4K5WIt291LY2GEttU0xNqdsZNH+J4bqNMAhMTy7HMCq3XyLn6JL52sxr39WT0gfIGVdlgiE5F4P6CAcPBgXjdf4Z3J9eBa1hbIBT0KonuxD0ZF1NIRPCUKYZC1mZePAf+6UaSn6uPbS/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yY8IBotlf5pIgwTc+ZeTJxtIeZunLYsdPl4GHjVPtX0zQBCcGN8mduIFT3aMuhK/h89TlyyAjBxz8U8d91cNKsG2l1nSEoNFO5Kt+sqHE0E3MB0uTvvbEN6xXU8eciHU9aRS6kxH20FXi3Vz7lzSZyt0ii+1/WMQIpJrLvvg78plzPII4T+NoPFhOOWn/JzUPiU1k9SX2nS4Hztp7fshnKbUwZZ8ZszGK/Z7kumHkeaOjl3gcH8HUyTlUARwPFfvlamloV4fRwL5d9oDUg0aeds2LrVvT3Hlgkn5A2ELDkyzvcpPp5kww0RPVoYQlLl+l5b/q9ymtTxl2wlTdusfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46TNZ7N5CLRKXK/jnAyrxUQ6YHSrZE5xfoFM9EUcVCk=;
 b=QTtzC9adly+anNVY08ckIot0mgU/lyx258cCj5s9WJP5hLU/9bxXsjOEB+8093JTwncdlWQY+x5HWUZvTZU5eVMCZp1HFTqKgTWbB9RxFqZiiWdAzpFdijyFl/GFjtMC5EWn9hfdwvj4/FJFXx4tEOpMKXSgNMKSnOOTWd95KVAbf5Q5E0CS4BUF/rpVVQ8kaPsWZjo7aVDAVPMLGZf3yYyn8cwEjXGxvoP7hcVHfk6ulkv9MwinHlEw4nf7UvqAZ4OUtjM6i20IBv5AKiyheQH1Bkp2zbkha5nG0ksBEUSaF4AxAoH0eQlqatWUtwxKUNhAIiiV/1LZGXHgaCeMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46TNZ7N5CLRKXK/jnAyrxUQ6YHSrZE5xfoFM9EUcVCk=;
 b=qsZnhCVN6TxcV0JgfiqzmJhJOYQ29g4K5WIt291LY2GEttU0xNqdsZNH+J4bqNMAhMTy7HMCq3XyLn6JL52sxr39WT0gfIGVdlgiE5F4P6CAcPBgXjdf4Z3J9eBa1hbIBT0KonuxD0ZF1NIRPCUKYZC1mZePAf+6UaSn6uPbS/0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHc0ZIp4iA20ItBV0OKtUp08vt6QrYCSMAAgAHGpwCAAtKuAIABnMgA
Date: Mon, 11 May 2026 06:40:37 +0000
Message-ID: <81FE9BB6-2C8D-49B8-86E4-BD1B19B3F76E@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
 <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com>
 <CAGeoDV80QHdesYQF-J4fg7wYQ6RLNg6u27aQhj4F+JoM4hU3uQ@mail.gmail.com>
 <CF8E0EB2-3048-4B04-B763-AE5EF1909416@arm.com>
 <CAGeoDV_SqVtcAZemSx1Ap0R6JqnbAxoLYCctPEU3DkcuQC-A1g@mail.gmail.com>
In-Reply-To:
 <CAGeoDV_SqVtcAZemSx1Ap0R6JqnbAxoLYCctPEU3DkcuQC-A1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6408:EE_|AM3PEPF0000A79C:EE_|DU2PR08MB10229:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4673cc-b867-4d64-5570-08deaf285c6b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 W89TE0tMQxk2vOhuMD5W4d69mxKpainjO75UTd4oKBMRbP4syr5+OTMlRyGUe2IeQZqmKh1wdEPAT0bBjEYKnmdjLT3NnZiR6iKL18FzJS/6KRdiCb2sheG0VVDYvVHuMP3J7L4lQul6o7KqarRCuxVN1t3H/EFGwBUs4gMLJ9bYWMVoNjnnYrZjPUNI1ydQth2TqGFathJNdXOnSZfqx5LWVwWrY1HzFoTfh9TpSahuhTfu/ieCE2nuWJjNp+hAz//PJo1CHSIzzr+3IJCBiZdoZX00NVt3efL4ElnALlvSzlH3RPEVgULZzo/C+lsyIQvk40lxVeoJc+5ie7EJX6zAvhL5CB6A28Yu6sT+OQ/ArCXZlwsXSgRUoBeQh/M2SDLgL6pf/JnN6KauAjFUmWo3gZR5HAwCrkhXLaGD0pQZpvLOxelIU4EPlQkp2AUwIrqcsztT3rvV+LAD++OWg71NmY654w0mZa8EWgeVDr7LyWIlXK/PAZk3igZ8fz+SXv3t1XcKQp4GXpC54b5TQivqnY4/UJhgvyE9Kw6XtWLR4p6ON4SsKJlusq51rKZNRXbJ2Lq8pT2cKK+Xlf6bNo/lrxa0/ysUJTu4258sNFN4Eo7wGQ8XmTDukcG1XHRfKx2ZtnOyWIJCUqVj4N9AAwwcHdElScm51MNtSc4bSHFYqH+tymLaKEYDNvl/1/XwNBnyXFnmGPd0wTv5OQNSbXoY+wEM2HoMLFjZ7C60Jdis+RPO7lnombDi4KRhUQJw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <404C35CF1BF87548A5C2A0E05036BB8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 myrFUaAjOJNYwNuRa3dLGR+tUe5QL9WgSvFmg8s0NKX2ZwkMeAlK2/MyvI2xvHaPs5lNp1sJ1jcOxl3peoAYiHcRkrAVQaX4NWl8/FTS2zsHWaNvWeElxctRlCwizp68N/UV9sfNW1zP6OnW653u57rEjkPQKgB/H8F+0ij9iYtV3TH5vgKcRRrMXSH+PGeBcWgZv5xe+WcJHWow+BhqvuAvafaH4mKaSDAR3jLiB5u36syjx84nYAt2zLlb6M7Mf+YlvLldFDhJyaKO9XXtMMRRkg/Ha09UM4TYnJbKw13D+DWq6IciYRmBYKhbt+CWOHtVPlUxkJZpv/CfpOxC5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6408
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fa8ac1b-e6af-481e-bcef-08deaf2835e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|35042699022|82310400026|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	pyPqQIMgos5oUkvSzmva9rSBKAmLpJlavCSINxbKiIae+5QZyoXKxiQBNKpDOUxLa/3t+fqkOmA3f9CHxPwNiGao4CZ71rpGi2vTeWxwZOCNdk9K/xRsg9nOzt5T6kTyd/OGFbbXB1c/ZuecoLs8b47DN2ddSp+PHfdf4wh8ndUYJXo/sONIjHp4nPSYoSbu5ODor2Nzb1ems/11jyK2UozZsYwt5snQA7ZOsbMgh7/EH24Ox/bGcLKRMwlahcxcdhqOhd1C1k5/e25zxjNdwWNjbRJcL22/EmEVgH/v0SDYQUlMG+y1giDd5r5LWi1n3RnTsL31D1XEJIZ54TtCTYnmv/kR8Nf/27KmjcjHO/qsGfyKqEbhTPvzW73LiruyhETPAisanJb6L5Zhak1O5WQPxCm5HxnBddGBvj/sXkne2+78d4oCf6CX8dY8ugaPs6MXKw9NLzcQl4RueFUExpUBCkRrZcMRg2zwttGuuBWQlDkEhvlZUpLcE8b1sWp8/RpMoJ9FPUf1Zh8p0VLSktUs2Rf9dWEa6omQFPyD5wTLt1F70ckRkM6TmQxHZ/WB8O/Z7fBzBxa1mjMr4Nie81Xx0wkHqpADzPjRfdQ1RLmoPYbf3R66Lw4npwfPDSFxte363DIP84PHm79MsnL70QgxUSrkgvb2aUxChRBus811xoehn0lb17d9ydDBtzBoe3829Fan54Ps9e0TCGaGWxDG1HzfarXl7HRRrJNK8oCNPJezkQ2sX1trfU4MseeC
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(82310400026)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	irGcDPKU+e4klToLzfqi63zZktukbeRXToTUlfY/cZMamzSAYNuBtqKHurXawcQFKWbvsvwFGtMHZITgnmP3hIycU9saiGzJloeFewmOyE4cLmMd9uzNt2IxfBkiZo8GF/rH8FfhU/yGTDUNTSMTITlbhdU3E1pk5QDUKQGPXtzaCuzOIB0EBXJeUXP/DhArtwF4jknJZM/sSD2w7/e3xnNAAmJGPFvyyKMMQAJyroziYjxJkiZedo5bsye5l7naorQB8p/IXO1rRdmwoiA2ibi/YGmd/iypykcEp7LPJREkhb2EjLFqVcUWz+JePVaXjjt4/S4HbH8UmDkabCFbw1ZeegDOdFGu5g0pZOC0xli9m7WddzbMq0U8aEQhrat0aasXbf1k8moO3FfwxMUqfNThUfbZF3ZhNVYpNj3LKO2kmUG8giITA2tONOPBL22M
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:41:41.6321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4673cc-b867-4d64-5570-08deaf285c6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10229
X-purgate-ID: tlsNG-d25034/1778481710-DAB74CF5-4F3714C2/0/0
X-purgate-type: clean
X-purgate-size: 5732
X-Rspamd-Queue-Id: 71843508A81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IA0KPj4gDQo+Pj4gDQo+Pj4gRm9yIEdJQ0NfQVBSbi9HSUNDX05TQVBS
biwgdGhvc2UgcmVnaXN0ZXJzIGRlc2NyaWJlIGFjdGl2ZSBwcmlvcml0eSBzdGF0ZSBmb3INCj4+
PiBpbnRlcnJ1cHRzIGFscmVhZHkgYWNrbm93bGVkZ2VkIGJ5IHRoZSBDUFUgaW50ZXJmYWNlLiBU
aGUgZmluYWwgc3VzcGVuZCBwYXRoIGlzDQo+Pj4gbm90IGV4cGVjdGVkIHRvIHJ1biB3aXRoIGFu
IGFjdGl2ZSBwaHlzaWNhbCBpbnRlcnJ1cHQgY29udGV4dC4gSWYgdGhvc2UNCj4+PiByZWdpc3Rl
cnMgd2VyZSBub24temVybyB0aGVyZSwgcmVzdG9yaW5nIG9ubHkgQVBSL05TQVBSIHdvdWxkIG5v
dCBtYWtlIHRoZQ0KPj4+IGNvcnJlc3BvbmRpbmcgaW50ZXJydXB0IGhhbmRsaW5nIGNvbnRleHQg
dmFsaWQgYWZ0ZXIgcmVzdW1lLCBhbmQgY291bGQgaW5zdGVhZA0KPj4+IGxlYXZlIHRoZSBDUFUg
aW50ZXJmYWNlIHdpdGggc3RhbGUgYWN0aXZlIHByaW9yaXR5IHN0YXRlLg0KPj4gDQo+PiBPayBJ
IHVuZGVyc3RhbmQgbm93LCBidXQgaWYgd2UgYXJlIGV4cGVjdGluZyBoZXJlIEdJQ0RfSVNBQ1RJ
VkVSbiB6ZXJvZWQsIHdoeSBhcmUNCj4+IHdlIHNhdmluZy9yZXN0b3JpbmcgaXQ/IFNob3VsZG7i
gJl0IHdlIGluc3RlYWQgaGF2ZSBhIHJ1bnRpbWUgY2hlY2sgdGhhdCBpdOKAmXMgemVybyBhbmQg
aW4gY2FzZQ0KPj4gaXTigJlzIG5vdCBiYWlsIG91dD8gQW5kIGluIHRoZSByZXN1bWUgcGF0aCB3
ZSB3b3VsZCBvbmx5IHplcm8gaXQuDQo+PiANCj4+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+
IA0KPiBHb29kIHF1ZXN0aW9ucy4NCj4gDQo+IFllcywgdGhlIGRpc3RpbmN0aW9uIEkgc2hvdWxk
IGhhdmUgbWFkZSBjbGVhcmVyIGlzIGJldHdlZW4gQ1BVLWludGVyZmFjZQ0KPiBhY3RpdmUtcHJp
b3JpdHkgc3RhdGUgYW5kIGRpc3RyaWJ1dG9yIGFjdGl2ZSBzdGF0ZS4NCj4gDQo+IEZvciBHSUND
X0FQUm4vR0lDQ19OU0FQUm4sIEkgZXhwZWN0IHRoZSBzdGF0ZSB0byBiZSBxdWllc2NlZCBhdCB0
aGlzIHBvaW50Lg0KPiBUaG9zZSByZWdpc3RlcnMgdHJhY2sgYWN0aXZlIHByaW9yaXRpZXMgaW4g
dGhlIENQVSBpbnRlcmZhY2UuIFhlbiByZWFjaGVzDQo+IGdpY19zdXNwZW5kKCkgd2l0aCBsb2Nh
bCBpbnRlcnJ1cHRzIGRpc2FibGVkLCBhbmQgZm9yIHRoZSBndWVzdC1yb3V0ZWQNCj4gaW50ZXJy
dXB0IGNhc2UgdGhhdCBjYW4gbGVhdmUgYSBkaXN0cmlidXRvciBhY3RpdmUgYml0IGJlaGluZCwg
WGVuIGhhcw0KPiBhbHJlYWR5IHBlcmZvcm1lZCB0aGUgcGh5c2ljYWwgRU9JLCBzbyB0aGUgQ1BV
LWludGVyZmFjZSBwcmlvcml0eSBoYXMgYmVlbg0KPiBkcm9wcGVkLg0KPiBUaGVyZSBpcyBubyBD
UFUtaW50ZXJmYWNlIGFjdGl2ZS1wcmlvcml0eSBjb250ZXh0IHRoYXQgd2UgY2FuIG1lYW5pbmdm
dWxseQ0KPiByZXBsYXkgYWZ0ZXIgcmVzdW1lLg0KPiANCj4gVGhhdCBpcyBkaWZmZXJlbnQgZnJv
bSBHSUNEX0lTQUNUSVZFUm4uIEluIEVPSW1vZGU9PTEsIEVPSVIgb25seSBkcm9wcyB0aGUNCj4g
cHJpb3JpdHkuIFRoZSBpbnRlcnJ1cHQgcmVtYWlucyBhY3RpdmUgaW4gdGhlIGRpc3RyaWJ1dG9y
IHVudGlsIHRoZSBzZXBhcmF0ZQ0KPiBkZWFjdGl2YXRpb24gc3RlcC4gRm9yIGEgZ3Vlc3Qtcm91
dGVkIGludGVycnVwdCBYZW4ncyBHSUN2MiBndWVzdCBlbmQgcGF0aCBkb2VzDQo+IG9ubHkgdGhl
IHBoeXNpY2FsIEVPSTsgZGVhY3RpdmF0aW9uIGlzIGNvbXBsZXRlZCBsYXRlciBieSB0aGUgdmly
dHVhbCBHSUMvR0lDVg0KPiBwYXRoIHdoZW4gdGhlIGd1ZXN0IGNvbXBsZXRlcyB0aGUgaW50ZXJy
dXB0Lg0KPiANCj4gVGhpcyBpcyB3aHkgQVBSL05TQVBSIGFuZCBJU0FDVElWRVJuIGFyZSB0cmVh
dGVkIGRpZmZlcmVudGx5LiBGb3IgZXhhbXBsZToNCj4gDQo+ICAxLiBBIHBoeXNpY2FsIElSUSBy
b3V0ZWQgdG8gYSBndWVzdCBpcyBhY2tub3dsZWRnZWQgYnkgWGVuLg0KPiAgMi4gVGhlIEdJQyBt
YXJrcyB0aGUgaW50ZXJydXB0IGFjdGl2ZSBpbiB0aGUgZGlzdHJpYnV0b3IuDQo+ICAzLiBYZW4g
RU9JcyBpdCwgd2hpY2ggZHJvcHMgdGhlIHBoeXNpY2FsIHByaW9yaXR5Lg0KPiAgNC4gWGVuIHF1
ZXVlcy9pbmplY3RzIHRoZSBpbnRlcnJ1cHQgdG8gdGhlIHZHSUMuDQo+ICA1LiBUaGUgZ3Vlc3Qg
aGFzIG5vdCB5ZXQgcnVuLCBvciB0aGUgdmlydHVhbCBpbnRlcnJ1cHQgaXMgbm90IHlldCBkZWxp
dmVyYWJsZQ0KPiAgICAgYmVjYXVzZSBvZiBndWVzdCBQTVIvcHJpb3JpdHkvbG9jYWwgSVJRIG1h
c2tpbmcvdkdJQyBzdGF0ZS4NCj4gIDYuIFRoZXJlZm9yZSB0aGUgZ3Vlc3Qtc2lkZSBkZWFjdGl2
YXRlIGhhcyBub3QgaGFwcGVuZWQgeWV0LCBhbmQgdGhlIHBoeXNpY2FsDQo+ICAgICBkaXN0cmli
dXRvciBhY3RpdmUgYml0IHJlbWFpbnMgc2V0Lg0KPiANCj4gVGhlcmUgaXMgYWxzbyBhIGxhdGUg
c3VzcGVuZCB3aW5kb3cgaW4gdGhlIGN1cnJlbnQgWGVuIHBhdGg6IGRvbWFpbnMgYXJlDQo+IHN1
c3BlbmRlZCBhbmQgdGhlIHNjaGVkdWxlciBpcyBkaXNhYmxlZCBiZWZvcmUgbG9jYWwgSVJRcyBh
cmUgZGlzYWJsZWQuDQo+IEEgZ3Vlc3Qtcm91dGVkIElSUSBjYW4gdGhlcmVmb3JlIGJlIHRha2Vu
IGJ5IFhlbiBhZnRlciB0aGUgZ3Vlc3QgaXMgYWxyZWFkeQ0KPiBzdXNwZW5kZWQsIGJ1dCBiZWZv
cmUgZ2ljX3N1c3BlbmQoKS4gWGVuIGNhbiBFT0kvcHJpb3JpdHktZHJvcCBpdCBhbmQgcXVldWUN
Cj4gaXQgZm9yIHRoZSBndWVzdCwgd2hpbGUgdGhlIGd1ZXN0IGNhbm5vdCBydW4gYW5kIGRlYWN0
aXZhdGUgaXQgYmVmb3JlIHRoZQ0KPiBHSUMgc3RhdGUgaXMgc2F2ZWQuDQo+IA0KPiBUaGlzIGlz
IHRoZSBzYW1lIGNsYXNzIG9mIGlzc3VlIGhhbmRsZWQgYnkgTGludXggZm9yIEdJQyBFT0ltb2Rl
PT0xLiBMaW51eA0KPiBzYXZlcy9yZXN0b3JlcyB0aGUgYWN0aXZlIHN0YXRlIGJlY2F1c2UgZm9y
d2FyZGVkIGludGVycnVwdHMgY2FuIHJlbWFpbiBhY3RpdmUNCj4gd2hpbGUgcGFzc2VkIHRvIGEg
Vk0gWzFdLg0KPiANCj4gU28gSSBkb24ndCB0aGluayBHSUNEX0lTQUNUSVZFUm4gc2hvdWxkIGJl
IHRyZWF0ZWQgYXMgIm11c3QgYmUgemVybyIgdW5sZXNzIHdlDQo+IGFsc28gYWRkIGFuIGV4cGxp
Y2l0IHN1c3BlbmQtYWJvcnQvcXVpZXNjZSBwb2xpY3kgZm9yIGluLWZsaWdodCBndWVzdA0KPiBp
bnRlcnJ1cHRzLiBUaGF0IHdvdWxkIGJlIGEgZGlmZmVyZW50IGRlc2lnbjogZGV0ZWN0IG5vbi16
ZXJvIGFjdGl2ZS9pbi1mbGlnaHQNCj4gc3RhdGUsIHVud2luZCBzdXNwZW5kLCB0aGF3IGRvbWFp
bnMsIGxldCB0aGUgZ3Vlc3QgZHJhaW4vZGVhY3RpdmF0ZSB0aGUNCj4gaW50ZXJydXB0cywgYW5k
IHJldHJ5IGxhdGVyLiBUaGlzIHNlcmllcyBkb2VzIG5vdCBpbXBsZW1lbnQgdGhhdCBwb2xpY3ku
IEdpdmVuDQo+IHRoZSBjdXJyZW50IGZsb3csIHByZXNlcnZpbmcgR0lDRF9JU0FDVElWRVJuIGF2
b2lkcyBsb3NpbmcgYXJjaGl0ZWN0dXJhbA0KPiBpbnRlcnJ1cHQtY29udHJvbGxlciBzdGF0ZSBh
Y3Jvc3Mgc3VzcGVuZC9yZXN1bWUuDQo+IA0KPiBJIGFtIG5vdCBvcHBvc2VkIHRvIHN1Y2ggYSBw
b2xpY3kgYXMgYSBmb2xsb3ctdXAgaWYgd2Ugd2FudCBzdHJpY3RlciBzdXNwZW5kDQo+IHF1aWVz
Y2VuY2UgcnVsZXMsIGJ1dCBJIHRoaW5rIGl0IHNob3VsZCBiZSBkZXNpZ25lZCBleHBsaWNpdGx5
IHJhdGhlciB0aGFuDQo+IGluZmVycmVkIGZyb20gdGhlIEdJQyBzYXZlL3Jlc3RvcmUgY29kZS4N
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gTXlrb2xhDQo+IA0KPiBbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvcGF0Y2gvMTQ0NzcwMTIwOC0x
ODE1MC01LWdpdC1zZW5kLWVtYWlsLW1hcmMuenluZ2llckBhcm0uY29tLw0KDQpSaWdodCwgeWVz
IEkgYWdyZWUhIEkgaGF2ZSBhbm90aGVyIHF1ZXN0aW9uIHRob3VnaCwgc2luY2UgR0lDQ19BUFJu
IHN0YXRlIHNob3VsZCBiZQ0KcXVpZXNjZWQgaW4gdGhlIHN1c3BlbmQgcGF0aCAoYWxsaW1wbGVt
ZW50ZWQgYWN0aXZlLXByaW9yaXR5IGJpdHMgc2hvdWxkIHJlYWQgYXMgemVybyksDQpzaG91bGQg
d2UgaGF2ZSBhIHJ1bnRpbWUgY2hlY2sganVzdCBhZnRlciBkaXNhYmxpbmcgdGhlIENQVSBpbnRl
cmZhY2U/DQoNCkNoZWVycywNCkx1Y2ENCg0K

