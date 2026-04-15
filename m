Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OehIv+p32nQXQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:08:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7D405B11
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282613.1565174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1r5-0003QF-20; Wed, 15 Apr 2026 15:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282613.1565174; Wed, 15 Apr 2026 15:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1r4-0003NC-VP; Wed, 15 Apr 2026 15:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1282613;
 Wed, 15 Apr 2026 15:08:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wD1r2-0003N4-T6
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:08:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1r2-002j77-9Q
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:08:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa9e9-5cb7-0a2a0a5109dd-0a2a4502949a-34
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:08:36 +0200
Received: from [52.101.65.17]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dfa9f3-42fa-0a2a45020019-346541119581-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:08:36 +0200
Received: from DUZPR01CA0337.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::10) by AS8PR08MB9599.eurprd08.prod.outlook.com
 (2603:10a6:20b:619::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:08:32 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::83) by DUZPR01CA0337.outlook.office365.com
 (2603:10a6:10:4b8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 15:08:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 15:08:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB6611.eurprd08.prod.outlook.com (2603:10a6:20b:36b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:07:29 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:07:24 +0000
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
 b=locPtHOB+9iYyEBFRyZqPoCeJliiNLG7ZxaJiZEMce51ppBIlo6KGfk2zzpmGTVE/QmOvzY9p098vYdD4jfuAtRF0bQeXN2SeGwKaEu+f426W2+jTHYKM1x1WAZfBNDrzWYWgVF6+lkj/RhOT5OQawPJHYGuZFPUhI6N1PjTpOEk/T0Mc24a4ezDRCjTcH/KK1X9xojAm6DbcaCUHG1w1l4rP68cz0ZaFdOXQZZNOg4C9Y1dDcazZJ5HKJgM5SHlMRa6qdEOJRhLsOiG0XjNi/fSn/zfmXlU3px+CYQPRbcU8sQmU0r5z3h1Fk20tv907BU4k3STDffXRldkqPTKJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9aOtsz1H8UBDHomtN3Nu4TE7/nAC3uZn18LYU+VbfA=;
 b=UK6GJgINEfFcOyyRz1ESfCiz0bOjshLBAFIBhdD5HOd58dc3u0RYYeZAgQiaCZwHx5b6XiT0F7a59NKYsXOK+nr1a2bUbM9x75O7ry5oTCSg+PQ8pupk/0S3Oq7lG1G9F6tTZ0HMK1Pw0ABH78DYFMCd1jGnwS9i9Zr1sZJ37pm8ae8BapWZXF/fqfTfd/LetcJKVkYAdBV3BUwREWXcgXpP4mdcpdWHSkTEidyFcEzR/+3oM6WVY/mIaKxjZGT86cxzlKFu3h/U5Wu+Dr3VM9B5YnVN7Lo74VpMh0XqqXLUxFUG1AsMZPBHsXKGvONHhEBKhGHbjrS5A6+te7E1FQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9aOtsz1H8UBDHomtN3Nu4TE7/nAC3uZn18LYU+VbfA=;
 b=JQpzil+RVH5xg9S2eLXPcKmUVqedeYp8Vn1M2J52jLeIfmZcMdXaoOMdGqf6w5romMAYCwVtzSgMtoosmHKPc2qrdcV2Ud4YZVysephblV1Wsf5udtsU5zn3AVoBeWuJWbKIbu360nTXGa8yziibRG/BhhFmvQsZfccPD9/IKRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYm7x4DHlgs/g1iFjYo9woIwB7QupL0VXS0SFBrjs+G0H7dPCgvk8MjrcsHRyrhunrVI4Ax0IXQC4WxOMpPrf0VeCzi+19gmPQEIIntS57nko1h4lJYzBNFKzM2YFqWd8D6FSDC638VuxG1MjUp6Nko4xg8SxJ1BcwsBLXGOewElbWLIw/wlxvbwF97TaY/+QbebmaNM/abCUkTpuC4kQe7RTxGprPSkwzlkQ7pkT7iRc2DtlX+/bW8EchdCTecF5yuAL/k/FMV3HLlwUEVTLn1HC3eSSbDQqDdj8ybSiyHALTrVZKnao3+C19h+Ze7pFoxd/hBW+PNwf2xI807xJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9aOtsz1H8UBDHomtN3Nu4TE7/nAC3uZn18LYU+VbfA=;
 b=AOff8n/peNH2ZM+AVn4Th0Jfbwqpwb/dQjIf7Jq+K1nEzDBl9UfMyJBgDN2hMSYmdxtalm3blw6vpzQ/q0PLf74RK7sGKXbV3NVKCQ3qDszqpi5Je3h9gWzKjq1L6xf3AVz4rnahVP3iRU/zK3KqPDyuDWUKegexJ3fDU/34MXkrh/QkrCwWJU04Pa84tMX57lejd9ybLWPjSX/1e2rXkTG5mOaGhy/BM3FRuxZaXof0P22oSAjIg2qzUMQtqlTI/8KvQdyNnRNoWlPVK+3Sacy8uJoN48a3ap2OoNOfe7xfh40+EVh9o/dkTii4LRA+smR4cdLIftZ8JVJtqpKeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9aOtsz1H8UBDHomtN3Nu4TE7/nAC3uZn18LYU+VbfA=;
 b=JQpzil+RVH5xg9S2eLXPcKmUVqedeYp8Vn1M2J52jLeIfmZcMdXaoOMdGqf6w5romMAYCwVtzSgMtoosmHKPc2qrdcV2Ud4YZVysephblV1Wsf5udtsU5zn3AVoBeWuJWbKIbu360nTXGa8yziibRG/BhhFmvQsZfccPD9/IKRk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 3/6] xen/dt-overlay: check overlay size before memcmp in
 tracker lookup
Thread-Topic: [PATCH 3/6] xen/dt-overlay: check overlay size before memcmp in
 tracker lookup
Thread-Index: AQHczMxJg8ELi4EY80SLuelicY+ivrXgOWQA
Date: Wed, 15 Apr 2026 15:07:24 +0000
Message-ID: <BFE6762A-7A1B-484C-B69B-43D9FB13B47E@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-4-michal.orzel@amd.com>
In-Reply-To: <20260415113700.107915-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB6611:EE_|DB1PEPF000509FE:EE_|AS8PR08MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ab5b90-8480-4678-0aa7-08de9b00dc05
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 oMYnB0F/kqzjguHhwSHFC6bLAoh2lbYfdu3Y4d0PC/zq8VmT3TDGPAMfUkBdJybzSDVJJ7uQl3iig8lOPJS4RO4keIHrtyyisj3XoJcW3hrvhVtXRz1tpXxEjj9qoRAegA+7YUFqoiUeudq1a6APO592qDcnC2J7p47C1ka362Diq3F8HX457WpElj6ho8O2LN5JNCbSu6/ebgrY77oyPrdCZ+2IShXdFITrrE1UNeZUvs3/jCBllbovrMQ4Pw15+xvaOJ4Rp3PkTO/3FpMvvZ6d4RH9qpmuk5ULFkj7xzEr4ZvqyTMXHJ8/VEvSx4ADQU8lQrm6xMyB+iWkFmtrIRIuy7mhueFqVrp5Q4oZSN4DOx5oAlRawoMbPDgUoVeh74+ZtoCDD8JMzh9xh3YkRpn4rXOhtuXTAxk9I6W2699mmjLplEjqkf+AmGVvIdfgQ3uGER0yYGw3IXQlv269zDIq07+z6UDTsmgPMFg69oApQlAXVSLwlv0l6aiP/++kTgM6Jnl5Zb0crcvSiygixhOzBaKOGKufse+mpVe+HYRczFb4CSDayH3g9ExGSG17P1Me0SOQoSO58jelPyOSc75mHn66Ucr0VmpePSJvq+4QUOdtecFzryTGdczuKowq5K1lHU3YJHVx41o3enHyFPWGALlO3BV1iGZFgyL/rZWzJ4ypjF6Xto5An8LeVUb9gTRZcy7gpL2h4qCmU+OuYEhBWK9P9McEJIBFAJDKxywpQO63Eq9Yo7JQkdg4C76aA2iUuRZagn10z/YCcgHLTU8OKgzuCc796yAzKtGhywg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <901381CCDE94584895F608565A684268@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 YN5PIn+kKskUFdMzYfB/Q0QCAbfAE+MhDXtGDDtMEweipmdlME/x0qMKcjgpg41LBw61RurHMYzntFMhZBNB1BPutDNRy+fu9lIvL5UPowOvCYqkEYFYM3nM6fKFPRNxb66/4dlme4gwxBhVbKeR8jhH3V2Jhu01d3+1ogu3AbOwR6BFqwN+smPCBgQy6mrILlEXtQV+BAeATDOxSfhiSmH3Uvthi17VmYbJhTbgEha/8n6GyyMvYBM6UmVXRnzwlkUfzLR/Bk4Oqs/L8UvaXxAhKMeC2uBcAtBmWH7xV034mMeqwIbvdwzutXJtHmEn7VQ12UYTRzwpGHnDXBpZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0001f02e-dc0c-4ab2-2a98-08de9b00b358
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|36860700016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dSZFGjJ533Pjzp1bUYX+MawSYvsQuL46AGZ9eALgwocSGhEJWGvaO0+DSRyvPkb38+WAz7+w4W5ecGmwdFf8lQgzS8Ub8hYZm7OAHazF0YsnYNTMviTsQIXEoAZFhl3uEaQox0s78UYkS/ckFYE5WOtdOPskbgZ4asQ9X57yCpU2KQT1aDSLlTjB1pfHVMBRYYQxkZ1C0YzmCGRaLlPafcLPt+YRx2nS7J9aN2sv1kdt3aM7zgyfDJMUMBnFYJ0jJmm7O+KMR8+hUl2P46w4Aj93RV9CR8q9GBSoPkC8BNe+wVFGpkxQ5Hl8eGuBBzdY5dNEo0xizkO77rDVf/ITEAi78EOpODkEppCtWH5izAV1260TslGEyDHV9eQiVa0YQYlu73OYsnfvHE9nCEf87CppJKEQRSkatmievp9TdHjADSaTx0CE6e6JbWpILGpZVSV0KISMdWZPatpGlhIfXg1oE3pLkLXmRzgG4MOsVHVZTF4/pqamkjd2wyimpBEen84jJvI2/WlQ50iTCF2voAKBzE8zHPasNgwXldGT77Vc1lggFwUAgDt6SO8FJSTSPG33RxDlDJfUCDxZQBworhmUG4zWP/hSpg37d2awA0N3pqYKikkNQxA5l4rZEbU0iaE9P2fkc0mhZZOzHXGHwftnXUCvLE+k0hvDMdVnC00ZWMG+DXW0Aqkw208qDgCOif3BjXhSZeDQwBeG1fBeApl9QAzTvhhkDc7Ivv/SnfoADD+JvySLPnxd0sJIlr9pfxEGTYA3Oc7ld6r8wys1vw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(36860700016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KUka7StHsfWCBQzJuEPq63YWbjgnQ+bLSKCRyCc8SkADLKjW1JErYkx2wHQR8V2qXTXozcSFoe4UTMn4b4Zeek5v1G5amOuovg4AGfHx/LS8ph73MFQ4Tn1GWpYIi0qR5o2LiC6/HtAlpVae99BGD8tf3wpFuMW5/FcTCDAv0oBu8WyS7p50g0QYmTxMYlw8sBbKMaTOtxYcOpsxMGS47aFlybqGeeXMH/H4ba2E6YsSeTTZc6i09k9ZAy0rH0O197Q+9TVm80GTYNRm4HNrmTCGrKyfbQ+rwQNBTWEa4z0FHK9TcbzeIZzr8K+kI9vpZZqUSha4vMNtvrAy17RKmzkvrs+V0PA932vhYS0cz1ZPV++CGyHdle0TBtW5EQ/k4eU2SnFRf0FnNuKAEzKDkl7x7XSqY27eHcUixwHgvqmG9Q0dg4gCfjeKWqjpfVOV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:08:32.5815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ab5b90-8480-4678-0aa7-08de9b00dc05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9599
X-purgate-ID: tlsNG-720697/1776265716-4C9F4CD1-EB663FD4/0/0
X-purgate-type: clean
X-purgate-size: 852
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: F1E7D405B11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

> On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> find_track_entry_from_tracker() compares overlay_fdt_size bytes of the
> stored overlay against the input without verifying that the stored
> overlay is at least that large. If the input is larger, memcmp reads
> past the stored allocation. If smaller, a prefix match could falsely
> succeed.
>=20
> Compare fdt_totalsize() of the stored overlay against overlay_fdt_size
> first. Both values are validated by check_overlay_fdt() at their
> respective entry points, so no additional field in overlay_track is
> needed.
>=20
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functio=
nalities")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


