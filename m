Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBhNJy0AB2qVqgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:14:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D965854E362
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309855.1580879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNqUx-00073V-63; Fri, 15 May 2026 11:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309855.1580879; Fri, 15 May 2026 11:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNqUx-00071V-20; Fri, 15 May 2026 11:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1309855;
 Fri, 15 May 2026 11:14:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNqUu-00071P-Tl
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:14:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNqUs-00AUwO-GV
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:14:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a07000d-5cb7-0a2a0a5109dd-0a2a4502bcca-22
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:14:25 +0200
Received: from [52.101.69.33]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a070010-af86-0a2a45020019-34654521c911-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:14:24 +0200
Received: from DB9PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:10:1d9::13)
 by AS8PR08MB6021.eurprd08.prod.outlook.com (2603:10a6:20b:23c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:14:21 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::45) by DB9PR02CA0008.outlook.office365.com
 (2603:10a6:10:1d9::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Fri,
 15 May 2026 11:14:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8 via
 Frontend Transport; Fri, 15 May 2026 11:14:20 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB8463.eurprd08.prod.outlook.com (2603:10a6:150:b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 11:13:16 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:13:16 +0000
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
 b=cmUSP3h6+dd74/rAc7rCBnht2adiyQeJ64D8r9pot4LXmBMvyv7kO3/zgUhh4yIczgArWozULM8rK4+idSNxLAQo3dCe6igsD8zUU4+g08J0R3J9cfp09Uc3l5nifPscbqi34+3JwA8bqWqjVZ24+ES4InyYnO77Gug0Q4j3ztDXHys1Fl/z1CmukKQezgYaP/CPZ8tFtnJuTEe7C0e27IYhwh4P8vOGE2GKYu1m40wNDHY56OIyVFrCyP5A42rZlwaL5ocXVVoPEKxTjNWQya6pTUpGg/6NDU6gLrwYezC1K1Yss1dT9IqjnsR49CbnQnYocFpE61BfIDpxSW0Gjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7PJffTOgqQIFOKPubSQLE/mHwWXQWXZu3khvgd8GZg=;
 b=dV9te4UKNplnd9Y9+LMh6hDBdAc5CP4EXn/ITdcTc8nCI5d6PVyiEgcStGGIftuykI448ZARW2T8DvGhJiqELgXdb86oZq5BS1fm3KyWJhPivwi4fi4zOt9K8J8ujiJQsm1MXJRSJp53v/Y1EgTl94wvHkdvocNluKwDXgufpnGgWwq4B9FFGpW+NzR+nsQ37zZfJ/IRrDheHwrFoTcyO1lu0yGKwip8rgbKz7Vbbmtgs1VNjajQMK6Tg9+6UET2Kyo89/QLGcmEsiL3ZKA81Okc10OZn1nxan87dmKmCK1WNzAs+PG4PGYSubYeOtT/t6zLp90KFzATMtGumd/rvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7PJffTOgqQIFOKPubSQLE/mHwWXQWXZu3khvgd8GZg=;
 b=P83TvLQmCgwg9OryIDYJ5c5cN9zeyN1fwPOol8u79BqxEj38LoYbcX0XMz61tfmZXZvEhzcIUcXW0s+zzQ3gXMZtw5DxkcYcWvuLJX2RUTVYyWMuaMbDTOtd+/Lf8Vz8MSAcB3Ammy0B12gOsX2ISE4EGodq/FDLu7okLJN07XI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgE7fcGzaAbYnlucpIy7zCia+DpRZwOYwSNhQS4eeJyRhdwxiDq3ccvw1CzudOaEjFZ03h4lXG+ggq9Y15G2LKbAtO9CsC/z9TfUHfpxIhmITyMoLpiSfxlZTUhaPEU19le/1V5BUhrABWjaADyqfWEHq6jz/hW2XnPz5dwadR0MPaJ4FXr9V8Cn3L+nt0k7XlZqJ2Uzfv4c2eqxmF96XlkHL0glZktc1tTtjGXFfnBeQ2WjnOFe5NzTPeiKe9ZA3imdfibDUz/nXZ3pe9b/NuC7DAVMONiAXGm44H3V0+4AVptdJutVMscdZc0milm/JTfRtJ/+hwxII9nVDtoQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7PJffTOgqQIFOKPubSQLE/mHwWXQWXZu3khvgd8GZg=;
 b=bcD7rDNwcwbQnVuYdYduEJoPUaDUKXaCzKCkjX7ANItBWOXx2rVia3zmf0MEzywhBPF4cWgJT3N46ZkmVYWePkPCCzSARmNjHGvyZNaGfc53n2YWDiqjpc2q5Ub3K0RuQi9Zs5jV8FlyJ9cIOXC5b1rnb0DLaJLAvSB3udhdFaKXl0eNzKTj+8L1AqL/UkftqHFpFYVXltBrCYjQYgLVj2aRM5+pr+SOINW20zT91i+AoG/JMi/R7zYuaBpGSa21jfrpcurKRv82NklRx7O25VQrts7JaPRiMsiKr5RekTdeRo/pUaFuj8NeRn+TSCTqjXBSc27btYfQ2xZu9KVokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7PJffTOgqQIFOKPubSQLE/mHwWXQWXZu3khvgd8GZg=;
 b=P83TvLQmCgwg9OryIDYJ5c5cN9zeyN1fwPOol8u79BqxEj38LoYbcX0XMz61tfmZXZvEhzcIUcXW0s+zzQ3gXMZtw5DxkcYcWvuLJX2RUTVYyWMuaMbDTOtd+/Lf8Vz8MSAcB3Ammy0B12gOsX2ISE4EGodq/FDLu7okLJN07XI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: gic-v3: Wait for redistributor RWP using the
 right bit
Thread-Topic: [PATCH] xen/arm: gic-v3: Wait for redistributor RWP using the
 right bit
Thread-Index: AQHc44GJZeccdOCpo0e0+3i9mNDOBrYO8H+A
Date: Fri, 15 May 2026 11:13:16 +0000
Message-ID: <EDF5B3D9-F532-4D8E-B156-172649433AE9@arm.com>
References:
 <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com>
In-Reply-To:
 <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB8463:EE_|DU2PEPF0001E9C1:EE_|AS8PR08MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 8012e0c0-adfc-497a-e94d-08deb2731d03
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 kA5+xD80PBrqQULwImDbxp5LxeRg9twqvzrDd6VSQ2ExgHlgQiOMWjvnJtZQEe2pEVyq4cmr9d0IsWnyTDFhHAqlYVvGP82wwoj4JYm65JYj+a1Qx9Qix5myMYdp0KAUskmYxOZiwTBQc5Swf2LlTI/w/vioWqqWvvMOlC3zARdeQ8n4hyqToQTED22761AzLfJknKsCpDIjcKIuliVPQOcTQBJwl8WaJ6ZpPXCLF5mkcfg+hSc033X/eEQ4Ehx0WbPcgfwEKNOSr8VNBdd7MYUN+k5EldhUC/To5wCQFebrQgUZ4219vS3ej/aK30ezlUOLACja2wUeTQmpp1x7vu5i21+D7hPRljR9wVsmqQLfbCgHiAdnrk2nxK9GP2nh8Q4gbc+nxDYMD/2iMQCvMD7WGPa3szmcdEP6qFsv4NEaWx7LAQnDZyWLVw4IIFlSeqtIrTnRQ9GTijIGRhpPuCdNo4Ece/V82tQ0vxFtUCE5KiLvvnW9es8hk9RkDx9bhsuNJo2EgktRCtxhyHcRpCPiiqRF1M/g10jyG5dWnqq/l7JrleL7vUgqy8xTK99NKJxYvHRZATiGcR4qBl2es5xqYOGew1G/QMnl8p3F/gv2TiD1mkKKLBopPRuWe4BW8+3m2DUwZ2B40KEuYUptczw2nA5xCvAN66NFtcswuAUH09TLGDQP+brBWNTVt3H+zfQaBtg2kiyOIDYTSEdNLepOVHBgmlwOmdHqC6CWHB592XVm2v6ZD6aX28lxBPTV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62020C563A0AB344AC90AAD4037F1253@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 aeOMeZo6XilHIpGU37aJNaGX2IEszhgElvdGPYep1hd+Udc+mRG9e7xuo3Ag3ipAdITRq425pw8gr2/5Kl1UK7mVBXzjKUI5oM7HNQN1G71+9qnYnGCfx//qp9bjXT4qk0TznnUTzwYPn7kJYjsxjxcwmWe4m8cG+VvMcREviWLalfDXL9X9ZpsatV/4ZsWFXGqvalnsw0tHE807OwhBnFns7XV6AOH2BvUKXYxvqqifVZhrQ2sCXjbhPSrjwsRrq3YobrAjrugrpjUq+Hpn1+sUdB8RcL41f2TLOXtSmMd6gG6yQSCi7xbVvUY5QFEuSA4dnXBKzrhEAfSR1+/RPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8463
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09e19d9b-4c93-4d6b-6d14-08deb272f655
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|14060799003|376014|1800799024|82310400026|56012099003|18002099003|11063799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dpiWIgRClqjXxmMEtV016FSTwC36GWxmC/ECYD+Cv+N6FmaTLoigR7gOehpLyuF91xYGJDFgx1mQP4INoAvx/GVjQNQtEyLrpiMAkBl+qWgth7OXJjRgdOSjG9Mb+xv/JPdsYvr38ANamAFk6toH5QOmbu4HIPDrYLA+642FNzP9tSRpLj3k8Z/VF8RnW1PtSnKlgLjU1b9z2f7tUKUv1k5zlcUuzzbD7tKIdLrl4rVN/Zn5W69l2Zad8eTRACVdURHqn06hfx8uixGhm9sq6LfmOjwS/DR6LkdaK3YVxsPiXLc9ZR4xk3wclkXhM+CuHTZe62diQCqliOwyI7jLgMbT80XaRUM8D/kfL7xKfitjKDd8vxHQHuBt78DIZMbpUve50nZPXEAs769wzu83MDcS+6tPJoCkjbZsCNO+9nZtobmhPcz+ehHGPEAOBtziALu/umk84YantVQPYHajsAa0jf63JpB4C8ofRlwykREocmRz/sBdbKpxSReSVZoDexMs05092X+BRd5KTn0peFU1+nc5K4Kd0EIhD/nh8h9/rWR74L1W9dxfGtntDY7nQkifLdgsBpgdUme1xYvFnmGvm8+Bxsqjkqb1sGURLlX9+vwRVO409Y2aYi5fJhSHbE/q3c2sBKeLg6ledK8U1oOWQxlhXllQcWQsFLzP6nCE0g+R6eRESb0MoIIieC3bvZpj5K8atbB8bZMp/BY/C8Q18TdGOxxC/ThDmmpbzKo=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(11063799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fUaehOpfVv6TlMKDQ+zmywKJ+xkWKo6gcQq03DDmmmFktyf1S9klSnj5YPZyUhLZA+m7LoMH995u/v/gnerNmyZgqUfdLAlfnvF738TGWxNhR/s9+0QH3SddT/hlrzBe3K0WXCe2qYi5BHdn6RHcJdw6gF0VbKmLvQdJFdyOMG6VQ8eco+J37aWPIFi2IzP8dWOZbxmrDCrqhrWPeJNTCuhwWEjKplwjtsI7ucPWeSHpwazXHSlp18Bv97Xv3Rc+8YtNwLK9C6aDuLs40vdzc7185ABG7Ywj15mAlFKZpvQuNzcOa9/cYeDlIVoV6cdy6np1fr0YyBM5HvcxtMZPgLV4P1msKcZJ4zJb/Cj9Nm7eH+5oQCkzUtJiFzgFoM8nd+S7fEiiIiMSzLO2P5H61dpuC/gG5wiWIH44cdQdFkrZpQtmtR6mEQbaaRNUKxSv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:14:20.9993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8012e0c0-adfc-497a-e94d-08deb2731d03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6021
X-purgate-ID: tlsNG-720697/1778843665-80979161-8E87BF86/0/0
X-purgate-type: clean
X-purgate-size: 1127
X-Rspamd-Queue-Id: D965854E362
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Mykola,

> On 14 May 2026, at 10:08, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> gicv3_do_wait_for_rwp() is used for both distributor and
> redistributor writes. The CTLR register is at offset 0 for both,
> but the RWP bit is not in the same position.
>=20
> For GICD_CTLR, RWP is bit 31. For GICR_CTLR, bit 31 is UWP,
> while RWP is bit 3. The redistributor wait path was therefore
> polling UWP instead of RWP.
>=20
> UWP covers upstream writes, including Generate SGI packets, and is
> not a substitute for redistributor register write completion. The
> existing redistributor callers need RWP semantics for redistributor
> register writes such as GICR_ICENABLER0 and GICR_CTLR updates.
>=20
> Add GICR_CTLR_RWP and pass the expected RWP bit to the shared
> helper.
>=20
> Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---

This looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


