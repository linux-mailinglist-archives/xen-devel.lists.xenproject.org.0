Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKl6K97+Cmp8/AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:58:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91ED56C158
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 13:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311811.1581950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwbb-0005SA-1y; Mon, 18 May 2026 11:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311811.1581950; Mon, 18 May 2026 11:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOwba-0005PG-VW; Mon, 18 May 2026 11:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1311811;
 Mon, 18 May 2026 11:57:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wOwbY-0005NN-Vk
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 11:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOwbY-005m8j-BP
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:57:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0afead-bab6-0a2a0a5309dd-0a2a450a8152-36
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:57:51 +0200
Received: from [52.101.69.56]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0afebd-56b3-0a2a450a0019-34654538442f-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 13:57:51 +0200
Received: from DU2PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:10:28d::28)
 by AMVPR08MB11973.eurprd08.prod.outlook.com (2603:10a6:20b:774::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:57:46 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::2c) by DU2PR04CA0203.outlook.office365.com
 (2603:10a6:10:28d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Mon,
 18 May 2026 11:57:46 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 11:57:45 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GVXPR08MB10668.eurprd08.prod.outlook.com (2603:10a6:150:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 11:56:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 11:56:40 +0000
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
 b=QxetJcdytp65tn25ZzeXcKrAB1GbAN3PXhyPIV+X0LD7F+4qqu36iPBTKYtdvDv35Yyt1M3bbRtuitFUg60IxxOlT7bY2P/ax/s/Ps0g93JHuNIe6QbSqfWc7B01ErvhIZOCNmQIjIO42iRU2jdfDCVgsyFQkMLerDF6oIYX7uOlonrMbBAA6ctRJJaMkEBv05myBYKa1RSvdkEFQMBLEoXbaBGAI66oK34i/Fpr30FIkUQPuzlw0pDI5+zPdiBDF1jhtJIjOcS7SixrKpFM/fhpuqMDcKx9vPzHXhuui9dHrRApRGOm06zuJ6CWfJgiJwX2J6xxSWhMJpWvUZJwjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/1HiXZGd5kMDQbez5oI4Sz4hF6yTx2Ci0hHCedUqSs=;
 b=x+THQZ8EB6uallYa7gBNH2t7x9dHHd0snQCcUigKJKS4Q5BDduWOjdzheZKkH1VIbr/Bn0WI7SzfN3lo4t7k6zTjEHVZXLcqMbR2XlknbycfGilk1m3MywbZodnVbUXNuGJvcHsOf4DwdgiVcaMkQx0uoxJq9B8HzgoR3TwOGLvEQzqo/AcNXBEXxwGhNW/mgF6V/aqw1RUJ9VEBTVpOhUCyTarySP1On0LFntkMclp3LHoaWxWc83bsygFODlVk9+8ClGLqv5v+CMoUVUuw6Kf4tCkdycG8ftUSYEA67QHUfQftLVJI2owLpqtNV7wV2H++HEVDNtrmaCjfFf6kIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/1HiXZGd5kMDQbez5oI4Sz4hF6yTx2Ci0hHCedUqSs=;
 b=HdKwipQilmlZ5hJ+z+yK6Qgcwznse/gBYBglL3uy5mQBb9iAJSBcBx2Q0jMBo3Pse96Gz83ISbSyhuLg+YqYyolX8Y+lSJDYxy0XbmCS6Plfdp3T7ziOWZTmad0xpzgpQhE2EwA8ZvQz0/+sJ/mIQ5OKWmo5yFKrKlBvqVXF23s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCKE8mHPXrmP6QuSPbQmwAt+YLCYdyg8oGEVdlzt1GkRFWWf2ng4bpFiaULH+pfgzX3RP7ykY6IfTX/8Eai/y65go/mo91t4aT1F2PxGRqlp9566+wva3jDxjnqOfLTMwpYsizjv3+lHVB0RI0lvcLHPT/37T+65PXdKnwxrRhkh2d0P16TylVBX6j+MMK6D6n/7j58KijiV/R3rCAjBJE/92He2gguWxZRAQRfiX74evAZwSMOLEWbVgUJWWXkul3+pW2yp4VJH4xlobkmyAkE+ZkAqw3kg17pML5CUyuq0K90NJEeFwRtSrMd4GQwoDVScRd5f7bzgdBWFOpvXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/1HiXZGd5kMDQbez5oI4Sz4hF6yTx2Ci0hHCedUqSs=;
 b=KSPTs6DZ4Dlon6UbhW5jUMywJzacD3sKHB0csDNLbBcPYWfuvc5998k7gfZ2vD8JDqqWuACXLG0mXVX7sCj9EaGg25MqCqt69wkyO9m3xm3liqAxiC0TJ/CGYh/Uzt4haf1HfhvKPZMqQgirVpdrp35PcIhWPt0ph0vwzhGiKGsEc4zh8mwUJNsaIG6ALPs2DxHG2zp//Mb2w8l0TzipxztiToFlzoUHJsvkwdEY0e4bZaUsNQkz5cIEo7HtAHWpaql1KrJa1rZjaw5PWbuj/NqrsbrZgpZqbw2aYtt8mcIJiYV7D8gdiNISOmu4amFOr6aQcFNYDGxUNstm+980uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/1HiXZGd5kMDQbez5oI4Sz4hF6yTx2Ci0hHCedUqSs=;
 b=HdKwipQilmlZ5hJ+z+yK6Qgcwznse/gBYBglL3uy5mQBb9iAJSBcBx2Q0jMBo3Pse96Gz83ISbSyhuLg+YqYyolX8Y+lSJDYxy0XbmCS6Plfdp3T7ziOWZTmad0xpzgpQhE2EwA8ZvQz0/+sJ/mIQ5OKWmo5yFKrKlBvqVXF23s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Mykola Kvach <xakep.amatop@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Topic: [PATCH v9 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
Thread-Index: AQHc4jI0ue/pVmX78UiKnsCn9gvTibYNsCmAgASqsACAAVtlAA==
Date: Mon, 18 May 2026 11:56:40 +0000
Message-ID: <476B6448-B115-40B5-8C30-8105FBD2D203@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <4162aa58c351677a4a267fe85989c6d4e07487d8.1778605274.git.mykola_kvach@epam.com>
 <28587F96-D8A1-46FA-91B0-D9A30E55EFC9@arm.com>
 <636cda11-bc98-44e9-a333-5a61cc86e0dd@gmail.com>
In-Reply-To: <636cda11-bc98-44e9-a333-5a61cc86e0dd@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GVXPR08MB10668:EE_|DU2PEPF00028D11:EE_|AMVPR08MB11973:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ec6209-8ba4-4220-d48e-08deb4d4aced
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 Q09i2R2LmNqggGBwZQPUFs8gk0EhGYh4k+NmQQ6QdyDea5uYEEWzrs52njNfsUYXRxNdQVqUFB2etG14mg4Zh92sLPysvTXyXz8L+l4qtBqoTaQbiQfae+9yBwdrkov1htQE8ul/4UceQQvdCaFYymHQxx3N9c9phW1i/R5S6ie/rciDWMUDrUgToHL5PVSngw1epZduH4e/jNVlrkhyHIwIjAOgA9gUJhtBofRDUlOq51s/wKagm2dEm2dDt3okr1XgYXmy7zF/3BBQzKCCYBzZ+2Xd3K1XxKtxwm55S2NEw89MAjpXgYC/acyi34pEo4O310mKqk58SgaQbzgRdNAqLtk72ALhwds6oRL9BNkmFg+uT8VLR0KuSsUYAHEnUEKGDet0ZYnbn0mhWzuen+9T9e9wYqoz5h33jYJcd7JeCrIifEBvUTbq3LBt8yjKkKLZn2hMJFINExVsCw1lAKA8ziC9bqEac2gniFiizbGvRjU2wTRSJR1TobpoY+lBuplyBcnUu2CBbnc27K9Fyo+Wsevxkcm03gjSDyo/tqTVj0MoEObW6/MxqyQO2KRdmRLrgdeZ196KZyybMe98ovIVUmhEYab0tX3VePnb3fRDATqzOYx5Y01SrbPE7SA+VdXHZy0DRH2X/rYEQz2DeRjJbLeblvnWQci4xct1xerjUDnWzh18083FL2Q2G7csno6rIxJDvh2aCVgQ04tP426XkOjrW+dediZTxm3woMSspkzk37yI+K0Buu3W6fdN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE9B5C27E2ABB14E99E0EA721ABE0594@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 URCP/qQA9xvcwyFiOU/5KBtOJb7mYvyNZLf8NoA571/T4/5paQZCeKn7bF08F+pY6T16YcOO8jJb3FO2N8tSh2tbc6tO0oWWllHmlDHoDiZUoOAFXmMxxVfLURR4016NinbqcRTL61njhneNOBs3xm7iHO2IFF46gCNEAz8V6u1oJyBMIH5v3ps6+LdHVuHwa35Vt6K87ktpvqwhw5UzBqiPUxFGj3aHkvnb1wVmShuH8R90/CAy/WVxIVpT7qdM7jWxXVF4BcDOp5ExVqJ1uzuFl9iaMT1EF55HUA7SS77d1iH/72smVHpGPqCtcTaSTveiqNpljSysX1Lcl6OoYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10668
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	783f02dd-4753-4c78-b5cf-08deb4d485f4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|376014|36860700016|13003099007|22082099003|18002099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	CxfeIpYNUvGI2eiI+wZjPq3+ouIyUpPc/YJfpBMOrW2Tn9WiEgMATr7H2hJmm2IQOyKyGrxwb32R0fqZUeFY6Md4xUTVf126c45sf2hV1OXOmiZzmm1XO6aWSapuuqaWlfYLTwBPoD1Okfy2kpuRDSQZ8beeCw7h48Jg+ex2l8HQaZLWZwh55/q988aCuGvRUBec9zZoV+QAZzhvNWqJfcn6CLrSq2pRRYUL5Od1ZgMrWOPMHe7jzX+SA1CMkGft07xz114rS93hvbXxfIOvFu9MTEORrbKzYxOg66IUSPMZXE+lw6V0M3xlO5vAeHSmPR+uJxDwnt/Cp5+cR7qUX9zzTaT64hI22RWuhSKL67XRlmciLk3lK/HjEo7d65vAR5AbjOSG1veaZUbW/3hk/y9T108jNn3qbVshsHkRjZsJVpHr1S4AsPW79th4dPGW9gYSFqi/f4ICvm8qChaGKpVyhJrujgEWccyORVXTvrfyaQSS6FDn0okA+bi3Iu31FPwsXL7HZ5zUvtvVepkbuuH8vH+yoD3ZqLBvdPqvPC9fpDF6/lcByPqvFTeQvl/6AOGG+OjFgRE8V+bEd5wVe4EwVY8BOsWb+HvRg6LWx6+KsL3xGr055ASMFh6qyrxInGJSR6a3vGn87NxZxe1uikHnH4OS2ms9ZDBjzl8P7xynWKh1LsRMSvX6zrW1WQI3ppsYoRmcTuRY1L9kn54VMhgFAVlRdHTqPx0FvgTUlxc=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(376014)(36860700016)(13003099007)(22082099003)(18002099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6udE9ZL+BuVo4FOUlsycohFY7tqGJLCdXXsxFGqe1jy7VHJm6wUZdrt5RQ/BeVW06M86hVC0hCPzsR1RLJON4/GdK/IKWtMQTerMZCNvPGydfH0y90b78BqBl2M6ZsINJcxOKyF45vLf/TiFNGPKaOIb3qBhB1VaBYwrWETJDt5hDqr/4XMESzEVEwcfZXBuFTmxWvBiLp1oOZqoNmXCvMjhZSUVPQKqTG5YLumglKpI48LlOkNp5HGSJJ344SbZa8e/Zj9D1IA2UFXZV2qS/+kKjemHuPrEJiJQCyueK1CHAA2iX+uQ03rNA0HpQV4Mlsf8tXCGI+a1IaW1jqqFF52RwXkO+5w20BYn93ReBRTIrudhnYunCOszxV3mLNJDXKPpvoJN3SDzCYYfQea4L1g4HSCGpo98suNdwteV1YYscE08WNYjO97wtAoSHnkW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:57:45.9524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ec6209-8ba4-4220-d48e-08deb4d4aced
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR08MB11973
X-purgate-ID: tlsNG-4011c0/1779105471-71F698B7-9391AAF3/0/0
X-purgate-type: clean
X-purgate-size: 3532
X-Rspamd-Queue-Id: E91ED56C158
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:olekstysh@gmail.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgT2xla3NhbmRyLA0KDQo+Pj4gKw0KPj4+ICtzdGF0aWMgdm9pZCBpcG1tdV9kb21haW5fYmFj
a3VwX2NvbnRleHQoc3RydWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4pDQo+Pj4gK3sNCj4+
PiArICAgIHN0cnVjdCBpcG1tdV92bXNhX2RldmljZSAqbW11ID0gZG9tYWluLT5tbXUtPnJvb3Q7
DQo+Pj4gKyAgICBzdHJ1Y3QgaXBtbXVfcmVnX2N0eCAqcmVncyA9IG1tdS0+cmVnX2JhY2t1cFtk
b21haW4tPmNvbnRleHRfaWRdOw0KPj4+ICsNCj4+PiArICAgIGRldl9kYmcobW11LT5kZXYsICJI
YW5kbGUgZG9tYWluIGNvbnRleHQgJXUgYmFja3VwXG4iLCBkb21haW4tPmNvbnRleHRfaWQpOw0K
Pj4+ICsNCj4+PiArICAgIHJlZ3MtPmltdHRsYnIwID0gaXBtbXVfY3R4X3JlYWRfcm9vdChkb21h
aW4sIElNVFRMQlIwKTsNCj4+PiArICAgIHJlZ3MtPmltdHR1YnIwID0gaXBtbXVfY3R4X3JlYWRf
cm9vdChkb21haW4sIElNVFRVQlIwKTsNCj4+PiArICAgIHJlZ3MtPmltdHRiY3IgID0gaXBtbXVf
Y3R4X3JlYWRfcm9vdChkb21haW4sIElNVFRCQ1IpOw0KPj4+ICsgICAgcmVncy0+aW1jdHIgICAg
PSBpcG1tdV9jdHhfcmVhZF9yb290KGRvbWFpbiwgSU1DVFIpOw0KPj4+ICt9DQo+Pj4gKw0KPj4+
ICtzdGF0aWMgdm9pZCBpcG1tdV9kb21haW5fcmVzdG9yZV9jb250ZXh0KHN0cnVjdCBpcG1tdV92
bXNhX2RvbWFpbiAqZG9tYWluKQ0KPj4+ICt7DQo+Pj4gKyAgICBzdHJ1Y3QgaXBtbXVfdm1zYV9k
ZXZpY2UgKm1tdSA9IGRvbWFpbi0+bW11LT5yb290Ow0KPj4+ICsgICAgc3RydWN0IGlwbW11X3Jl
Z19jdHggKnJlZ3MgID0gbW11LT5yZWdfYmFja3VwW2RvbWFpbi0+Y29udGV4dF9pZF07DQo+PiBO
SVQ6IFRoZXJlIGlzIGEgZG91YmxlIHNwYWNlIGJlZm9yZSB0aGUgYD1gDQo+Pj4gKw0KPj4+ICsg
ICAgZGV2X2RiZyhtbXUtPmRldiwgIkhhbmRsZSBkb21haW4gY29udGV4dCAldSByZXN0b3JlXG4i
LCBkb21haW4tPmNvbnRleHRfaWQpOw0KPj4+ICsNCj4+PiArICAgIGlwbW11X2N0eF93cml0ZV9y
b290KGRvbWFpbiwgSU1UVExCUjAsIHJlZ3MtPmltdHRsYnIwKTsNCj4+PiArICAgIGlwbW11X2N0
eF93cml0ZV9yb290KGRvbWFpbiwgSU1UVFVCUjAsIHJlZ3MtPmltdHR1YnIwKTsNCj4+PiArICAg
IGlwbW11X2N0eF93cml0ZV9yb290KGRvbWFpbiwgSU1UVEJDUiwgIHJlZ3MtPmltdHRiY3IpOw0K
Pj4+ICsgICAgaXBtbXVfY3R4X3dyaXRlX2FsbChkb21haW4sICBJTUNUUiwgICAgcmVncy0+aW1j
dHIgfCBJTUNUUl9GTFVTSCk7DQo+PiBJIHNlZSBpbiBpcG1tdV90bGJfaW52YWxpZGF0ZSgpIHdl
IGRvOg0KPj4gZHNiKHN5KTsNCj4+IGlwbW11X3RsYl9zeW5jKGRvbWFpbik7DQo+PiBJcyBpdCBz
YWZlIHRvIG9taXQgdGhlbSBoZXJlPw0KPiANCj4gTHVjYSwgZ29vZCBxdWVzdGlvbiwgdGhhbmtz
LiBCZWxvdyBteSB1bmRlcnN0YW5kaW5nICh3aGljaCBtaWdodCBiZSB3cm9uZyk6DQo+IA0KPiBU
aGUgSU1DVFJfRkxVU0ggYml0IGhlcmUgaXMgbm90IGFuIGV4cGxpY2l0IFRMQiBpbnZhbGlkYXRp
b24gcmVxdWVzdCDigJQgaXQgaXMgcmVxdWlyZWQgYnkgdGhlIEhXIHdoZW5ldmVyIGNvbnRleHQg
cmVnaXN0ZXJzIGFyZSBtb2RpZmllZCAocmVnYXJkbGVzcyBvZiB3aGV0aGVyIGFuIGFjdHVhbCBU
TEIgZmx1c2ggaXMgdGhlIGludGVudCkuIEZvciBleGFtcGxlLCBpcG1tdV9kb21haW5faW5pdF9j
b250ZXh0KCkgc2ltaWxhcmx5IHdyaXRlczoNCj4gDQo+IGlwbW11X2N0eF93cml0ZV9yb290KGRv
bWFpbiwgSU1DVFIsDQo+ICAgICAgICAgICAgICAgICAgICAgSU1DVFJfVkE2NCB8IElNQ1RSX0lO
VEVOIHwgSU1DVFJfRkxVU0ggfCBJTUNUUl9NTVVFTik7DQo+IA0KPiBhbmQgZG9lcyBub3QgZm9s
bG93IGl0IHdpdGggZHNiKHN5KSAvIGlwbW11X3RsYl9zeW5jKCkuDQo+IA0KPiBJbiBjb250cmFz
dCwgaXBtbXVfdGxiX2ludmFsaWRhdGUoKSBkb2VzIGluY2x1ZGUgdGhlIHN5bmMgYmVjYXVzZSBp
dCBpcyBhbiBleHBsaWNpdCBmbHVzaCByZXF1ZXN0IGZyb20gdGhlIFAyTSBmcmFtZXdvcmssIGFu
ZCB3ZSBuZWVkIGEgZ3VhcmFudGVlIHRoYXQgdGhlIGludmFsaWRhdGlvbiBoYXMgY29tcGxldGVk
IGJlZm9yZSBwcm9jZWVkaW5nLg0KPiANCj4gSGVyZSwgd2UgYXJlIHNpbXBseSByZXN0b3Jpbmcg
Y29udGV4dCByZWdpc3RlcnMgYWZ0ZXIgcmVzdW1lLCB0aGVyZSBpcyBubyBjYWxsZXIgd2FpdGlu
ZyBvbiBmbHVzaCBjb21wbGV0aW9uLCBzbyB0aGUgYWRkaXRpb25hbCBzeW5jaHJvbml6YXRpb24g
aXMgbm90IG5lY2Vzc2FyeSBmcm9tIG15IFBvVi4NCj4gDQoNCnllcyBJIGhhZCBhIGNsb3NlciBs
b29rIGludG8gTGludXggYW5kIGZvciByZXN0b3JlIG9ubHkgdGhlcmUgaXMgbm8gZHNiL3RsYl9z
eW5jOg0KDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYz9oPXY3LjEt
cmM0I24xMTE5DQoNClNvIEkgdGhpbmsgd2UgYXJlIHNhZmUgdG8gb21pdCB0aGVtIGhlcmUNCg0K
Q2hlZXJzLA0KTHVjYQ==

