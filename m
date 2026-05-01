Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB59OV7A9GkDEQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 17:01:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1834AD796
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 17:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298752.1573828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIpMf-0005px-LY; Fri, 01 May 2026 15:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298752.1573828; Fri, 01 May 2026 15:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIpMf-0005oQ-IP; Fri, 01 May 2026 15:01:13 +0000
Received: by outflank-mailman (input) for mailman id 1298752;
 Fri, 01 May 2026 15:01:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wIpMd-0005oK-6e
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 15:01:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wIpMc-00BBdS-9Y
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 17:01:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f4c033-5cb7-0a2a0a5109dd-0a2a45078a26-12
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 17:01:09 +0200
Received: from [52.101.83.19]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f4c034-229c-0a2a45070019-34655313756f-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 17:01:08 +0200
Received: from CWLP123CA0012.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::24)
 by AMBPR08MB11618.eurprd08.prod.outlook.com (2603:10a6:20b:735::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Fri, 1 May
 2026 15:01:05 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:401:56:cafe::f7) by CWLP123CA0012.outlook.office365.com
 (2603:10a6:401:56::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Fri,
 1 May 2026 15:01:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 1 May 2026 15:01:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS2PR08MB8288.eurprd08.prod.outlook.com (2603:10a6:20b:557::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Fri, 1 May
 2026 15:00:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.016; Fri, 1 May 2026
 15:00:00 +0000
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
 b=dACI7pCUSe/QBgSqu/vxLR6wAY5Vl7D29BTqpKJA9SQ+8EUXaOywcjhnNLOXRuo+xAblLPJfFOXWfqTwUzvdOsFqrN4DMY6ZYuwPkeNfsH9mgt2fII2If1fb2056sJNop5G4JuUNnrkui91mgCfcjsqmpfx6EoxQmrtPocsQ/xxBsSvMkqx8PAv9JE1GPhZSYCsZb9rFvx16ejTjIpXbQKG1UnfYnZwAcZKUjhvHxN13ETMsN5zP1V+Q/hrX9rWvlyKGy3nRM42Xz6f3H1cz3QmCZNycPgzHxPovJX0PxRSphliNxKiaG7dAzcSimp4355pEUNIPwBF0DewF2/ATeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QeZMlERVZEBLSBXUlnnwQ5D1Zpa7DcRdDVOqv/XFQw=;
 b=psNualF/1reMgDe7+C7OXB6za4ORRQQOz5evT0rAI7Lx3AbNlw/HGtQht9aasHtxEcgiVpa55o//oK2zg1peqBb336sW+WV9wOMXCF5pX7a+mdXOmE2KPtFZ2EezWbV1uVj1TqIdfa45ROh3kXhKI/ZncnGM34g7gWLv55d5pNpeljnHivyek0DQTsrpzFKPThpg4Y5EepFj1rVPkmdpVqtSmqNtx1kCLjd1Ys6rm+FZCTWK+rYebOAnrVQc7Qv2rh0ualmmG2ggZF37NszdS16JGJ4/CA2qnnVL4MIr+Y9AEsSAalDt/cDr35jhS1vieEr2gd/9NLdwKDwKVF3M2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QeZMlERVZEBLSBXUlnnwQ5D1Zpa7DcRdDVOqv/XFQw=;
 b=XiBl8gtBaFUETPR10F17kkTqFyDUj1CidpVq+pmlgiLzhm8CkxLSmHxiggKwf+Ua2kjo0l49zzVi0aQ5YJY9kiBfRx6R5pSo9fpVaqZDl+L7h6hJ3CgAZne5OOHuSkh8VKkWycycCFLbdr40acZ3u2neA/xHviN10lpr+imHLQ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d69OLrlVoc2r5hCkcYmCmVUInZfR60jNF47GbPw22+IK/0CBgIFn8FPyhUnn0Q4Fg30hvQ46qMZhoS8TeeJV0xYuqpS9D1lCv/Kb8R6EPG2kRbG5FY/Q197MeNEzN8x4csVO1w5QfGOqp5tZ+LcFQQnl69/9LTJ0KMYfBgxKqxAzVhTHuG1ju5Z7D1z0ubuPRridNpD9qpoWKc42hQq6W4ix1dbiYmSE/0xwZ6FP+P/juWTcytI1RpCVOa3Ru0Bh7WRJ6RmA1NsYXuAne0gX1VLyCu58pSFCgC7QcUcP85G/rh2Kkw3Ry8Q2wpMPJjaNZWp0ZV1Gvz83ImMfA0xmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QeZMlERVZEBLSBXUlnnwQ5D1Zpa7DcRdDVOqv/XFQw=;
 b=roxTJdWuvIP5LpJ9VaXs7Cpc+EP/F3cSuoZ05rUCAUbuH5TfpU8GN1MxabYPGl8tDxp1qTB6t/4q5urFcf4sRQkhK38UGcJMDSwpOnsuhqvFjp5Q6R0abPxyQX1mYjMIeC7aCM4xPvG9xHfVGcCM1FDq715Lx1v18NQufnaV9WprdeTxvuPbuu/zcM5XtlnirD+4mntjWtl7oPgMWrShSGraJlShnycl9lYKUqkdBhLrBDelZ1P+ITqnxB7SR2oJYGTgSBOPkxk1aUdgnW0e/XyNYj1H16zaLbIZvCZJRCw3w2IbpOO0xA9XykcXh2VTVU4yqnYb0er9fHQgj4n1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QeZMlERVZEBLSBXUlnnwQ5D1Zpa7DcRdDVOqv/XFQw=;
 b=XiBl8gtBaFUETPR10F17kkTqFyDUj1CidpVq+pmlgiLzhm8CkxLSmHxiggKwf+Ua2kjo0l49zzVi0aQ5YJY9kiBfRx6R5pSo9fpVaqZDl+L7h6hJ3CgAZne5OOHuSkh8VKkWycycCFLbdr40acZ3u2neA/xHviN10lpr+imHLQ4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/arm: skip holes in physical address space when
 setting up frametable
Thread-Topic: [PATCH v2 2/2] xen/arm: skip holes in physical address space
 when setting up frametable
Thread-Index: AQHc2KCxQvKgH2FypkCKt5lrj84l4LX5RPgA
Date: Fri, 1 May 2026 15:00:00 +0000
Message-ID: <42E57541-C0A9-4E19-A8F1-825E83A856DB@arm.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-3-michal.orzel@amd.com>
In-Reply-To: <20260430125103.401811-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS2PR08MB8288:EE_|AMS0EPF000001B7:EE_|AMBPR08MB11618:EE_
X-MS-Office365-Filtering-Correlation-Id: e4efed46-2952-4c8b-31f4-08dea7927798
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 fxV0Du0kpCT4MK1Xudfi6XP8FL6PqRnweKaWslQmAcQPxO5BdjTk6asl6EgHnUrAr24dskqs/IR8DtihnOStPBSAS92zSRaDArafSUEJ7Fqb5V4Dszsw+mOA8HWPzvGHJSA0l5qLLgurAVz4uQPOfJT1pHiQtPmvITlqXdJAVebZIxfrLVYOvkgrVhEbvpXC4gm9MzxdugrWaqU7bMvE2gPW6jCzAHJs189gVn+MuBnVYURkgcUjwNaYWMCzoQfyTdWMjDKegt8+Q3hCmwvp9zD5AJdFjKe8yKcQqyAB9+OwBra/rSp9u0dH/GW12j1lRZgl42mwAXlMudzonlqGTmaOimzpiiLzUK9IY7NRBy6U1t6HwlTBdpzgBD5QkqBij6M2Hqoapwa2MdJMdzDQll68rMpYbkm1Hat3hFCbUv3CpMzgLoIgaBVMGyG7qPiibJdbNbv6vMhxFE5z2Jsnl6TppFUrwNOrYCP5dfP245RU9XTe91kZ4oGiKmvc9+NUr0e8TjPk97bjdp7ogtu7dzQHPcy8CNIhnMoV4VYdVisOpN8xNSsLQAWeVTGmQUc0uc2Z44Z5l3Fwc4JI1yxoUnFzenCjP1XlhjJK827ghQRPFlC2FOve231Nh7YWWOr9/JDy7ZZrY5kaS0k2dvvuz3AMEdligrbGfpNlWruUbNtA8qHoKZBAkiA+UKa5CaTxSKs/7nGT3MCCwPNqR1ykaGdXz7EiITvrNp8qC+s4bVgJ8KDJDtFDsv6hNktMoVPR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CD3F7B12DFD9B45A754404F2846A7E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 gayoKDwFq57UB/31FNABWUPG1yC/eRiQqVCrQHNKdpbYnxkqOvfFXIWDRAdndXrQNizKJI4bkBCgLGJ27hek8DL7Z4lfv+mRXypVEzmxnyeMloxfUq0MtVi0i7eSAi90y40Vqs8L6x5SFZu2y9y+4ot+TPNvM/I3wb4nKqkZDWTgxeREyeYqr/N+bt/mLZBzPntXYFNaMv8W7WqPhCdf741CyCMKVmVVy2qpKH2p/9N2WN/VpaxcUorI/RphkzLQWSsgYPeJCcx+l3FsxOvBGnPITDYb/6q0trEzCj+y35M40SfMBCCbFyaGWBVKwPN0s7Xs+dNHTJ4vOFF4+r6kRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8288
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	268f19de-83d3-4c5d-5510-08dea792515e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|1800799024|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Uyc3h5s99JwWvQRKDS571pHe+8/R9GFL6JUXhcUoVj9jt0yfcPXCzqYSXhwVnrFOgKgwIqs7qEoPfJyxLXblKPPUxLOCIe6ZRUZGoVICYr2zbWvnxLLA/HZM/pX6xXRe5ZHkxBBpfoPXGvR6Npd2Hcgbn5ILQuKnsyBpE1/vCA+pIgP3Y59xkoUbfDvMV7V6DJCBggBmUQ9DZOa4gtdAPqzdDFosHMaaY9oor9wCBHIgR/9u19xjGcIV++xjUj84KLN9Q2C3/PrNSWao/lOXDw4j273maXUIgA7WPWSY45hUsmvfQzTGXT6V8d020WRmUn4rgSvlPHNd24kOp4pmZv7hB2huVP0BYZ3qsXab5wQLhicVAQQUVAhuC8PbH1qeIYOs3Mn4rDhB0fWXR3FaceUIvdksZ1OIVnW7tNB5tq6fHBBpYhGL9RHjzOxeKGZp6ivmO+YU1S+wTXaEIsg6Lnk4GWmfkDjSTOOrdKz2mpGXq1cV4Cn5XIxNfAeL+IUyRkLW+xEDmFI+AOI1QGikKEwgS5+RHWAZEZT2MVNTTiICpDfD5U0/QeuvduSuqA3NQ5ZQlvwkfDVFCIkND+F9Y8gOItgsHUuAX2budx4b7bKACEVwnEMKpFZSyDPUtCtTJ/qrsH3V6lDdweVa79XiqwxYD/QwNn5Y1TQdn3/W42s8HbnzcIC1381zNdqUX9IyjZMSFlr0uW4fX2RhRDnV4Ba0rmhMU/SJrzhSoZ1sPPA=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZQY+dv3UQ9LnUtxi/1bedp1s45wl96SpDNcyfuMAdmv5Y2jFh17l547axSK0nZfcOvKHNyK5nBsP7TtMeCrjBUV40lKfcIW27nZgMfLsWm+ELzWZ/4DwBfB8uVJMnuAmIGXIizYyLzSfIiPCLeQoO2hT8s6BZAb9ewl8pnVpf5ykotHtCjJD5jUQEfQsDtHxyeAmbVQ7gJwwe/473QMnI2P44NIrkrwWc7Zku2qn1ehoxqJ0cSap7G/yICr0jxf8E4+PHdFtKXzRF1fA0CoOVWPfS/ZQtjeYJ72M0YdBmpdmH0AElBpYl4vjIRVC4WkYaKizdqVkFwb/KhwUlqlsBqU9zwDCAk7uZz4qVaLMUnXSw8Cx0YQru8fCdGCCdAqDoVy8Xxhvn2sPiqUOjhw0gsX5dyG5U7zIO5pS7KX+eENfckjyCDJfkvmvcqMGz2iA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 15:01:04.5858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4efed46-2952-4c8b-31f4-08dea7927798
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11618
X-purgate-ID: tlsNG-ef75cf/1777647668-ADF6EC48-1D2C6F8F/0/0
X-purgate-type: clean
X-purgate-size: 3720
X-Rspamd-Queue-Id: 2F1834AD796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid]

SGkgTWljaGFsLA0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNo
L2FybS9tbS5jDQo+IGluZGV4IGZhZWYwZWZiMzI3Yy4uNzI5N2NjYTAxNTUxIDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC9hcm0vbW0uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPiBAQCAt
NjMsNyArNjMsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lkKQ0KPiANCj4gICAgIHNldHVw
X21tX2hlbHBlcigpOw0KPiANCj4gLSAgICBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHJhbV9z
dGFydCwgcmFtX2VuZCk7DQo+ICsgICAgaW5pdF9mcmFtZXRhYmxlKHJhbV9zdGFydCk7DQoNCkkg
dGhpbmsgdGhhdCBub3cgcmFtX2VuZCBhbmQgYmFua19lbmQgY2FuIGJlIHJlbW92ZWQNCg0KPiAN
Cj4gICAgIGluaXRfc3RhdGljbWVtX3BhZ2VzKCk7DQo+ICAgICBpbml0X3NoYXJlZG1lbV9wYWdl
cygpOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tdS9tbS5jIGIveGVuL2FyY2gvYXJt
L21tdS9tbS5jDQo+IGluZGV4IDY2MDRmM2JmNGU2YS4uZGZjODg4YzhlZTBlIDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC9hcm0vbW11L21tLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL21tdS9tbS5j
DQo+IEBAIC02LDE4ICs2LDQ1IEBADQo+ICNpbmNsdWRlIDx4ZW4vbW0uaD4NCj4gI2luY2x1ZGUg
PHhlbi9tbS1mcmFtZS5oPg0KPiAjaW5jbHVkZSA8eGVuL3BkeC5oPg0KPiArI2luY2x1ZGUgPHhl
bi9zaXplcy5oPg0KPiAjaW5jbHVkZSA8eGVuL3N0cmluZy5oPg0KPiANCj4gLS8qIE1hcCBhIGZy
YW1lIHRhYmxlIHRvIGNvdmVyIHBoeXNpY2FsIGFkZHJlc3NlcyBwcyB0aHJvdWdoIHBlICovDQo+
IC12b2lkIF9faW5pdCBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBhZGRyX3QgcHMsIHBhZGRy
X3QgcGUpDQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9mcmFtZXRhYmxlX2NodW5rKHVuc2ln
bmVkIGxvbmcgcGR4X3MsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcGR4X2UpDQo+IHsNCj4gLSAgICB1bnNpZ25lZCBsb25nIG5yX3Bk
eHMgPSBtZm5fdG9fcGR4KG1mbl9hZGQobWFkZHJfdG9fbWZuKHBlKSwgLTEpKSAtDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX3BkeChtYWRkcl90b19tZm4ocHMpKSArIDE7
DQo+IC0gICAgdW5zaWduZWQgbG9uZyBmcmFtZXRhYmxlX3NpemUgPSBucl9wZHhzICogc2l6ZW9m
KHN0cnVjdCBwYWdlX2luZm8pOw0KPiAtICAgIG1mbl90IGJhc2VfbWZuOw0KPiAtICAgIGNvbnN0
IHVuc2lnbmVkIGxvbmcgbWFwcGluZ19zaXplID0gZnJhbWV0YWJsZV9zaXplIDwgTUIoMzIpID8g
TUIoMikNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IE1CKDMyKTsNCj4gKyAgICB1bnNpZ25lZCBsb25nIG5yX3BkeHMg
PSBwZHhfZSAtIHBkeF9zOw0KPiArICAgIHVuc2lnbmVkIGxvbmcgY2h1bmtfc2l6ZSA9IG5yX3Bk
eHMgKiBzaXplb2Yoc3RydWN0IHBhZ2VfaW5mbyk7DQo+ICsgICAgdW5zaWduZWQgbG9uZyB2aXJ0
Ow0KPiAgICAgaW50IHJjOw0KPiArICAgIG1mbl90IGJhc2VfbWZuOw0KPiArDQo+ICsgICAgLyoN
Cj4gKyAgICAgKiBJbi1sb29wIGNodW5rcyBzcGFuIHdob2xlIFBEWCBncm91cHMsIHdoaWNoIGFy
ZSBhbHdheXMgcGFnZS1zaXplDQo+ICsgICAgICogYWxpZ25lZC4gVGhlIGxhc3QgY2h1bmsgZW5k
aW5nIGF0IG1heF9wZHggbWF5IG5vdCBiZSwgc28gcm91bmQgdXAuDQo+ICsgICAgICovDQo+ICsg
ICAgY2h1bmtfc2l6ZSA9IFJPVU5EVVAoY2h1bmtfc2l6ZSwgUEFHRV9TSVpFKTsNCj4gKw0KPiAr
ICAgIC8qDQo+ICsgICAgICogQWxpZ24gdGhlIGFsbG9jYXRpb24gdG8gdGhlIGNvbnRpZ3VvdXMg
bWFwcGluZyBzaXplIHNvIHRoYXQNCj4gKyAgICAgKiBtYXBfcGFnZXNfdG9feGVuKCkgY2FuIHVz
ZSB0aGUgY29udGlndW91cyBiaXQuDQo+ICsgICAgICovDQo+ICsgICAgYmFzZV9tZm4gPSBhbGxv
Y19ib290X3BhZ2VzKGNodW5rX3NpemUgPj4gUEFHRV9TSElGVCwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTUIoMzIpID4+IFBBR0VfU0hJRlQpOw0KDQpUaGlzIGZpeGVkIDMy
TWIgYWxpZ25tZW50IGZlZWxzIGEgYml0IG1vcmUgdGhhbiB3ZSBuZWVkLCBJZiBmb3IgZXhhbXBs
ZSB0aGUNCmNodW5rIGlzIGxlc3MgdGhhbiAzMk1iPyBJZiB3ZSBoYWQgc29tZSB2YXJpYWJsZSBh
bGlnbm1lbnQgZm9yIGNodW5rcyBsZXNzDQp0aGFuIDMyTUIgd2Ugd291bGQgbWF5YmUgaGVscCBh
bGxvY19ib290X3BhZ2VzIGpvYiwgaW4gdGhlIGVuZCBpZiB0aGUgY2h1bmsNCmlzIGxlc3MgdGhh
biAzMk1iIGl0IHdvbuKAmXQgZ2V0IHRoZSBjb250aWd1b3VzIGJpdCBhbnl3YXkuDQoNCkJ1dCBJ
4oCZbSBmaW5lIGFsc28gaWYgeW91IGxlYXZlIGl0IGFzIGl0IGlzLg0KDQpXaXRoIHRoZSBhYm92
ZSBmaXhlZDoNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJt
LmNvbT4NClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
DQpJ4oCZdmUgYWxzbyB0ZXN0ZWQgb24gQXJtNjQgTU1VLCBBcm0zMiBNTVUsIEFybTY0IE1QVSB2
aXJ0dWFsIHBsYXRmb3Jtcy4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

