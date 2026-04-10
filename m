Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOvQGEgX2Wm7lwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:29:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAACA3D94B3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279341.1563808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDmm-0001R7-36; Fri, 10 Apr 2026 15:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279341.1563808; Fri, 10 Apr 2026 15:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDmm-0001Or-0M; Fri, 10 Apr 2026 15:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1279341;
 Fri, 10 Apr 2026 15:28:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wBDmk-0001Ol-HJ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDmj-00Ez2f-NE
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:28:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d916fe-5cb7-0a2a0a5109dd-0a2a4502b418-48
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:28:41 +0200
Received: from [52.101.69.3]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d91728-42fa-0a2a45020019-346545034157-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:28:40 +0200
Received: from DUZPR01CA0275.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::6) by MI3PR08MB11908.eurprd08.prod.outlook.com
 (2603:10a6:290:74::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 15:28:38 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::bc) by DUZPR01CA0275.outlook.office365.com
 (2603:10a6:10:4b9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 15:28:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via
 Frontend Transport; Fri, 10 Apr 2026 15:28:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB8711.eurprd08.prod.outlook.com (2603:10a6:10:401::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 15:27:34 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 15:27:34 +0000
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
 b=Fuo1MWaYax9rthGSic3geME2MRYyhjby3nJSDKKSrkvlM4ueprZcVESF3CC6dDfR0e/5mAqjHotDYJVDOtjwJtUtDOefrRWzQaDqwNuzP0tjf8TMQPY0T91Ebfe5KdSwFV47yyAaZyUSVDhPlZsqdHGVgOgj4MxRJD9nL3Y4pqMmbQ4PhimpjlbyKy2Z2nccXbOCW3nPEBiBGQlFXwhCXHYI6oK45mC36DQYWA612z97ENVYHsothPKj57JzUBJ4oXu12v7F3m7rnTJMBmqsMSMyMn1iMI4L1kkbN0XFKXp/Jdjni74/7RunfU6xSFi47apS1xSnIieoL00pSSn7cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCzjePY665vJpJdboo78/mB7n80P6oKKVx0+9c96syo=;
 b=drljHgzOivVDRn56S2EjLMOU5zrBkwEWPa1qPCwZRziZTTIg5LsJX8GD69F7iwVRM1Q9EX/Fl+ZoJJH0XC8cALvrODi8GipFzkygTKCwiMxpMUPFtYo7Vnwtb1+odsohYoXITzk73nd5FSZEBxhd/+9sAAjNoDEO201g79gC9JVlJJUJD+Hi25gZxwUipw1QJ3nZDdRoZG+Ur1yXAGjCQx9svszrEaXzgucgLl14C9pnWT1sJvmh+co9hdxXCHuQL7eTmbMm1PoBckH+85gAKoRHkR7Sah2s5bhBjhRXvdQcob9dKvvW4GdifDn3yK8r8SthRRtUylGYF9LV3lXdZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCzjePY665vJpJdboo78/mB7n80P6oKKVx0+9c96syo=;
 b=FgiH3513OJvbm3eAC03QI5IF18oYSOXaWSsyqX2Wj3h4maVnc1iKxmPSrCRXtuhlsZnID6ZgKgcdts3TPJSKRnrwNhc67lwxZlZNWZKefK7NbC/Gh63Dh0CKL5ku7DNp1qoHffbEHe59zZVU3cO6Mok+/NiF6kRq79oOKIucXHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWoC71R4xsYUGc67aTq5fiSqK/R0yhM7ZE9uUD9hXTNLqDUALwzNXvACVU9TMwjQCbRNup0eeLIcia5RqmUhd3z9N22CFTAShK2rgTuH/EDzd+WUSfcXBX4FoJ041zGNHLbdJnNQBzbyyPjY5zaQE/jx/91iUepkSzjXE7yPcUk6D/ufFd2HuwENl1KJ/ypy7OkFO/ovSiOy4Ru+eozJe1uK+rAcau20jezGFE/MId1vyxS6h+3B/LbJuz6G1D8zq0O8hqvIi4ShZnsEcTT357WGlkOYH08ipjOi5CK9teOfTxqUzmo0HTB21wBlKOr3Ux/zIcyydN/0TGNvhAOeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCzjePY665vJpJdboo78/mB7n80P6oKKVx0+9c96syo=;
 b=rTK+0yzjbKeE9vn2xeXphHUG/8rck9btUclzwrY3CPD4mlbMmEP+FEphlGov0yVN/VK3EEvymePMdzp9f3in+Zg9XNeyLEGZ8f2U8lqz+vRz2sENKSqrC+vEwWB66mnKvEFlVCaWVIrL1tDwSBMkgCW66Ir0KZvcyEoN8bn/8/f2NSqVZkaKqsFMR/yA/m2nHGJySkfxRHVDMX3JJ32NXqZW1noaXCDlD4oF6WXij3oIykzCrDzcZhQ6YfthNVS1b7TvOlj+m1RZBVCY1/nY4rpjFVDBSBNrl52bBf5wSDxEknriSTrM+oJvxvUqc7f8wmscMeJ2yXhnV2FD/GhgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCzjePY665vJpJdboo78/mB7n80P6oKKVx0+9c96syo=;
 b=FgiH3513OJvbm3eAC03QI5IF18oYSOXaWSsyqX2Wj3h4maVnc1iKxmPSrCRXtuhlsZnID6ZgKgcdts3TPJSKRnrwNhc67lwxZlZNWZKefK7NbC/Gh63Dh0CKL5ku7DNp1qoHffbEHe59zZVU3cO6Mok+/NiF6kRq79oOKIucXHk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Topic: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
Thread-Index: AQHcyP6NKmaLb7Af3Um2I3EGy28uyQ==
Date: Fri, 10 Apr 2026 15:27:34 +0000
Message-ID: <C6057E0E-ED2E-4C9A-B768-5EE8E23BF346@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB8711:EE_|DU2PEPF0001E9C5:EE_|MI3PR08MB11908:EE_
X-MS-Office365-Filtering-Correlation-Id: aef32ddc-ac5f-452b-4375-08de9715d664
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Gg4dG6Im/oyDeF07lxA3vytbcElqNET20yiDgvHyj7r+OMYfMCmnsGgD5fOyROLe2hRoByRJcwRM21aib6vwUJTpm4Aeow0FNJH8BI8KfX+kOjfJcbBhcgQB7utE3wdT1eYJtT7L/swapiMesBkfLcGMVT0+EJPVFlc6bED5c3ryizH5CWHeNguHlLUTF2tiYVk1QLfJIER4tm33dBl7lbZeeXGOimVnJsaqCOCklvxMMwgUmUO+GHR/iosqIFHhIGFcFLsiL/Vz2GaaBoD7EOUrqqvVPTZ5kzllnepi5yqc9Xbxu1eg4YuJuUCHAYv5ec2Cnx4i6jx2a4KM0bRRe6dY2zvcL8gSY4XNlgXy9lyUGjE8Xpk3NTn7kybCZ9N/sgy4YAOBX+SSTwJiVhSXut3YKFaUKZSwlvrrjqIC1cX2W1LU1QQR4QHfR79kFwkKHMUpYWOFwdWS8mVXTOPialJBsmxXyDbYTcxE0PHad1otzlcthUWex8HIQ+F8ZAU5Rf8H2Um8BtU6iNBuumruYRWCUmtsRZvHRYrL8stGd3veFQ9kbwObFS3XVRveC4I+fdohiDU78NEsTEso9f0xHqum2cTRUZv4x2uwvQzev8xxReZsmVgWho4oFBsOQ75JmnsgjNkEURNYerWDHJVU+vAE6U7748FRVS8ELlCDYdMpFKtrAsWN+EHXhSQwfkrUhPnH6lNjIP2B+xg8woHjaIq7RtdPAgHJGM33N/4mWzx8A83YzJCYeJSjHsKZB4HTlkgUs2+xNHQC/cxEFkqnNw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F4A13EE8F792494DBAF8BE98EB8EC6FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 HEcSWVV8ptOI1q1mWSAyMQBT0//sQ/IEihUUFAf0sSK0F8aObvKf5+mwpluKt54VYpxPlGhCy8KomzR7uysHCZszsvAlckkxE8XxzrzJjL2bQznVt3aKE5453Ac3v3Oxzh6Gj1KvvVlvKtWlGqiCOxN/QR41nWd1JPnODhTS3VU/4gN94zoZbtgjZ6aZoOZQn6Je8fVxBKBXEu9gUnEI/9jrdQjw8qS3LE395L3VV0IpNyangj5CLwS4TUOeRdlXuA8CusANLUNwTrkD9307dOR8I2wzPzi1LVpwHG9nn/pMBewLkttXuRsGTwEfSnbdIMV0kvqIIQO0tTlQqU+qSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8711
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23693514-0227-4f05-3166-08de9715b05d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|36860700016|35042699022|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nOggFd0/EVtf/4dHWwL33XKJG0igKbTrO3EFV80ki58tKNtQJY994oGGnZNUDPIQWHCOAPrcEjFA7CwWzys96a7J/rpQQj0TXTRSiRq6wamy1tsnwCSWlWJTNHg91FJF05jfVfYTBb4gzRQn3KBB1JtyPM/HMhGI6he6xQHHoVjXIbluQ6jJceZNFEf3DP7yVwyRrOtk52w4+moE5CHrpzWM8T6V7a7+XNPgEBBt4u3W5HuZ29NmIbm9qsluZS4y9PM/Px/I7nozYwQgfAKatAakz9pUlRrLFU42AaVFPSorj1lBEejDlvBPjZppAcuO5jPF+uoxbA3BC2jBoUECVvGhefxeFNYMoa0hkq/7ztKzj8wRwMN84L/1wVQaLOHFgoz4/a37k88YVVarbZRJl3ZksL6OcUcxNXACxKefEk2fCbTEqN43X/v78nZZRpwTiJjdKO3mWXiCtSyIWnKuOXXyLYN99lzKjHDbpuPBMdwG377a4emNTNCFjwNZkg+79AhCtwTk5Ych2v3aK5SfNO3uZ/DWAwvvY7nBaKKS/jcdVxl33Str/w+XUvJJdKaQiPjmuYbbR81IgeCoCl/BJxJKelox3Iv+b0QKLC3rTSMenPLPy0xxrq4AmhpGVuieoLBVkhF7uxHCJZ8ujs3q9NkkfO0juYIcHbeDGVQrFx74uItEgBPz+X03IwyuvWxzP66uKl4pCBxWFAihTQY6IA9bXj+KnNcCHrebx1aSUgl2JZd/R4z3LCRCtNIanlt/
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(36860700016)(35042699022)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bJ7kk23aeFiZdra/mzV33Dx5W3Hu/9Z61hdRQKnwuva3+dVVFXghtqeEktwlLbhsSHbL89svdCT+JTMzT7e8qcXBHko8ebQEwZeLHJyR1rZm/NKbmm4NXhk2nbSYstFHhQPXIL4Q2NJO+OC21IdbhjRIKT00TV0QuShgfHDkQ8zppjEtQ5H/exTfwaF9Ja3axX/xSkcQcUDY1+Asn04vB24sv2pyFx0dwYkzojiLM19eUEIjJQhzjyxIsPU5RqXx8K/eoOqEbendubJ0ME+2c/FvV/KgijVBJ+rs9FhxZxViMhGkhVbKin0vSHMiGX1rPTI+InxIIa0U8XiXnrn7HNAsMT/iMEPsEfLbCrQtdRM6x3M/s+f7TSeeviDmxD7gjX2RGoBom0I7MPV0fpI/ljjo9BKtmcelQule+ht98tIPntUhP3wXODruEaaTUoQ8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 15:28:37.9069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aef32ddc-ac5f-452b-4375-08de9715d664
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR08MB11908
X-purgate-ID: tlsNG-720697/1775834921-47323CD1-D5034290/0/0
X-purgate-type: clean
X-purgate-size: 9194
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: AAACA3D94B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthr=
ough/arm/vsmmu-v3.c
> index e36f200ba5..3ae1e62a50 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>=20
[...]
> static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>                               register_t r, void *priv)
> {
> +    struct virt_smmu *smmu =3D priv;
> +    uint64_t reg;
> +    uint32_t reg32;
> +
> +    switch ( info->gpa & 0xffff )
> +    {
> +    case VREG32(ARM_SMMU_CR0):
> +        reg32 =3D smmu->cr[0];
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cr[0] =3D reg32;
> +        smmu->cr0ack =3D reg32 & ~CR0_RESERVED;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR1):
> +        reg32 =3D smmu->cr[1];
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cr[1] =3D reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR2):
> +        reg32 =3D smmu->cr[2];
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cr[2] =3D reg32;
> +        break;
> +
> +    case VREG64(ARM_SMMU_STRTAB_BASE):
> +        reg =3D smmu->strtab_base;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->strtab_base =3D reg;
> +        break;
> +
> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
> +        reg32 =3D smmu->strtab_base_cfg;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->strtab_base_cfg =3D reg32;
> +
> +        smmu->sid_split =3D FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);
> +        smmu->features |=3D STRTAB_BASE_CFG_FMT_2LVL;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_BASE):

I think this needs to be VREG64

> +        reg =3D smmu->cmdq.q_base;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->cmdq.q_base =3D reg;
> +        smmu->cmdq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq=
.q_base);
> +        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
> +            smmu->cmdq.max_n_shift =3D SMMU_CMDQS;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_PROD):
> +        reg32 =3D smmu->cmdq.prod;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cmdq.prod =3D reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_CONS):
> +        reg32 =3D smmu->cmdq.cons;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cmdq.cons =3D reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_BASE):

And also this one VREG64

> +        reg =3D smmu->evtq.q_base;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->evtq.q_base =3D reg;
> +        smmu->evtq.max_n_shift =3D FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq=
.q_base);
> +        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
> +            smmu->cmdq.max_n_shift =3D SMMU_EVTQS;

This seems a typo, I think here we want to modify the evtq, not the cmdq?
So in case both condition and assignment needs to change.

> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_PROD):
> +        reg32 =3D smmu->evtq.prod;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->evtq.prod =3D reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_CONS):
> +        reg32 =3D smmu->evtq.cons;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->evtq.cons =3D reg32;
> +        break;
> +
> +    case VREG32(ARM_SMMU_IRQ_CTRL):
> +        reg32 =3D smmu->irq_ctrl;
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->irq_ctrl =3D reg32;
> +        break;
> +
> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
> +        reg =3D smmu->gerror_irq_cfg0;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->gerror_irq_cfg0 =3D reg;
> +        break;
> +
> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
> +        reg =3D smmu->evtq_irq_cfg0;
> +        vreg_reg64_update(&reg, r, info);
> +        smmu->evtq_irq_cfg0 =3D reg;
> +        break;
> +
> +    case VREG32(ARM_SMMU_GERRORN):
> +        reg =3D smmu->gerrorn;
> +        vreg_reg64_update(&reg, r, info);

this should be vreg_reg32_update

> +        smmu->gerrorn =3D reg;
> +        break;
> +
> +    default:
> +        printk(XENLOG_G_ERR
> +               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
> +        return IO_ABORT;
> +    }
> +
>     return IO_HANDLED;
> }
>=20
> static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>                              register_t *r, void *priv)
> {
> +    struct virt_smmu *smmu =3D priv;
> +    uint64_t reg;
> +
> +    switch ( info->gpa & 0xffff )
> +    {
> +    case VREG32(ARM_SMMU_IDR0):
> +        reg  =3D FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
> +            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |
> +            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, =
1) |
> +            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);
> +        *r =3D vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IDR1):
> +        reg  =3D FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
> +            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
> +            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
> +        *r =3D vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IDR2):
> +        goto read_reserved;
> +
> +    case VREG32(ARM_SMMU_IDR3):
> +        reg  =3D FIELD_PREP(IDR3_RIL, 0);
> +        *r =3D vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IDR4):
> +        goto read_impl_defined;
> +
> +    case VREG32(ARM_SMMU_IDR5):
> +        reg  =3D FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1=
) |
> +            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_=
48_BIT);
> +        *r =3D vreg_reg32_extract(reg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IIDR):
> +        *r =3D vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR0):
> +        *r =3D vreg_reg32_extract(smmu->cr[0], info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR0ACK):
> +        *r =3D vreg_reg32_extract(smmu->cr0ack, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR1):
> +        *r =3D vreg_reg32_extract(smmu->cr[1], info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CR2):
> +        *r =3D vreg_reg32_extract(smmu->cr[2], info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_STRTAB_BASE):

this needs to be VREG64 I think

> +        *r =3D vreg_reg64_extract(smmu->strtab_base, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
> +        *r =3D vreg_reg32_extract(smmu->strtab_base_cfg, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_BASE):

VREG64

> +        *r =3D vreg_reg64_extract(smmu->cmdq.q_base, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_PROD):
> +        *r =3D vreg_reg32_extract(smmu->cmdq.prod, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_CMDQ_CONS):
> +        *r =3D vreg_reg32_extract(smmu->cmdq.cons, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_BASE):

VREG64

> +        *r =3D vreg_reg64_extract(smmu->evtq.q_base, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_PROD):
> +        *r =3D vreg_reg32_extract(smmu->evtq.prod, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_EVTQ_CONS):
> +        *r =3D vreg_reg32_extract(smmu->evtq.cons, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_IRQ_CTRL):
> +    case VREG32(ARM_SMMU_IRQ_CTRLACK):
> +        *r =3D vreg_reg32_extract(smmu->irq_ctrl, info);
> +        break;
> +
> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
> +        *r =3D vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
> +        break;
> +
> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
> +        *r =3D vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
> +        break;
> +
> +    case VREG32(ARM_SMMU_GERROR):
> +        *r =3D vreg_reg64_extract(smmu->gerror, info);

vreg_reg32_extract

> +        break;
> +
> +    case VREG32(ARM_SMMU_GERRORN):
> +        *r =3D vreg_reg64_extract(smmu->gerrorn, info);

vreg_reg32_extract

> +        break;
> +
> +    default:
> +        printk(XENLOG_G_ERR
> +               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
> +        return IO_ABORT;
> +    }
> +
> +    return IO_HANDLED;
> +
> + read_impl_defined:
> +    printk(XENLOG_G_DEBUG
> +           "%pv: vSMMUv3: RAZ on implementation defined register offset =
%"PRIpaddr"\n",
> +           v, info->gpa & 0xffff);
> +    *r =3D 0;
> +    return IO_HANDLED;
> +
> + read_reserved:
> +    printk(XENLOG_G_DEBUG
> +           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n"=
,
> +           v, info->gpa & 0xffff);
> +    *r =3D 0;
>     return IO_HANDLED;
> }

Cheers,
Luca


