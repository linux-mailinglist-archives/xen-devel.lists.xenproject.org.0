Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP89ANds72kcBQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 16:04:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39FB473F78
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 16:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294976.1571687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMZ2-0007LK-VL; Mon, 27 Apr 2026 14:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294976.1571687; Mon, 27 Apr 2026 14:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMZ2-0007Ii-SA; Mon, 27 Apr 2026 14:03:56 +0000
Received: by outflank-mailman (input) for mailman id 1294976;
 Mon, 27 Apr 2026 14:03:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHMZ1-0007IT-5F
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 14:03:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMZ0-00Cif5-Hv
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:03:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef6cc2-e002-0a2a0a5209dd-0a2a450cbc66-14
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 16:03:54 +0200
Received: from [52.101.70.54]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef6cc9-62f1-0a2a450c0019-346546364e32-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 16:03:54 +0200
Received: from PA7P264CA0237.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:372::20)
 by MRWPR08MB11826.eurprd08.prod.outlook.com (2603:10a6:501:9a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:03:50 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:372:cafe::8f) by PA7P264CA0237.outlook.office365.com
 (2603:10a6:102:372::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 14:03:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.0
 via Frontend Transport; Mon, 27 Apr 2026 14:03:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AMCPR08MB11993.eurprd08.prod.outlook.com (2603:10a6:20b:770::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:02:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 14:02:47 +0000
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
 b=T9n4w8k1abBPEDf93FDhNmlGR805H2ZbgJOdcEv7yeRIDicFjqNZzL5yTyuIKPGZr7VOE/C0EdDHHGtHuhyfBhF7A4OBRm/AKqUpXVZdAAdm5jRjEFZu5sIwM/8+KYIwmHTWbV53mupWE2EjdW/O59xV5TXK/cywIu9FvKrQhMWEd5bHp4HH4E0KkDYRVHFBYSyyUZ4ZPfdsBPBZ7QA+CrpEYoOAPjFMsYy0BmxiKI55SR1skeUpNj8Dp46aZJBu/47N016q0AtLBllwpJduC9cfDp265Xh5S6UEROWflCyz8nfaOD/senJjeZ1m4b15jdEuZn5kJyk46LRbTEldBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCYR6XQdZ+UWKfkuUQcgAMb8DAMnLPe/FWJmgYaUOcw=;
 b=qVLDrqeErkNJrQ9y7uSwxuRshzdj68K4HFgmU6rJvdoPzSQfcAe8agmpq1O8ANT1wHyM+4v+PCW224pVj3pLLCG5J3Q/nBSvIM+GDu99FOau5UkL99CURYW98jstEw1iiR4i2axXQUiPUQrDX9XlYDXxZEVRIi31p4mrCYQ/X/NXhuVOhXq0EUjyWlia/awAuNBP88cBh/KKKWeDiKRW6YNtYiiNrozrPkAskOCyzHjdB4ZOUUYGtYKqoTUdN53/tThPc1tQYTqnrrp3rhlqd4JH8uJqyV2EClNIQ53nypLljUnkeEgKQPvvaBPcdosmZuA14Omj9pWDOdNnPhqmeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCYR6XQdZ+UWKfkuUQcgAMb8DAMnLPe/FWJmgYaUOcw=;
 b=M+W4bcKHveuJEejxLAOBg59wSdnOw5kf6v252NHbS/7OkkP0YpRjUd0Yjs9fisxUw+lI5q1a1uMSN+i1oKJiPGYgFPyz2x+xAim+C1WDWEllyV6aozIw7BhBhCDnerW3pljn6IteKx1IqarXglwwrNYwxYAIKcE37zJserTmhxA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZmb6oXEpIAJLojyHhWDtIMkno8q8RSs7c5HSWp+P8dNCpUw2j2Waw2oAJzpzxToIPCAa3u6CKLsVb7zVqPerb+iXGFvJHYbuDCpuDY29Uzum9M+Tba2Vh4xmfgsY8YRwbiUatBCPe5ILce8gPy49Rn2nVxX69d8CF+DU4LCWWO/FPJDsoqUsnmd2t6VBHg83KbreYxVOBHfqfyJTAdU7sVIKpfDVvmrPE/a7yYydsFxLXVs3nBrrqIKsArNuIsDfH5AE0vhXSbBEfKcSVh7wLL4KWSc7H69Z+ASN/C3ohTjZj0pcuknnJlSFymrXKa8xtYyykzs4BiPzvA0YdJR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCYR6XQdZ+UWKfkuUQcgAMb8DAMnLPe/FWJmgYaUOcw=;
 b=xXidDk5YXTu4g05ysTSQtKV8OFJyKt57ko+woXaaP7HPpqHvoO35arJXUqL+f52wrxq+W3KPSrLMeOQZF5/r6v9fUUmdXF+6bi+w8XylXQOq5Pv9khtP0viSJ+CwHp+EuvhZib3bqE7qlzwcvyPSPJhVpOZmr6HW9090m+n6tOGRhlWYZjDr8y4WPFU1tP56nyV95DGpFFxs21rcccpTyHNfuooHC4vtixAxupyjjMTTDRN0urh0FAQIQNUK5MDtF59AEXyTmk9EJnOea40yzA3Kcj7+gAZzEEDbj5VT6z+dExpuDo4WdX4QTA3MQk/4S32tUNTlQhO3jOQX9n/c3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCYR6XQdZ+UWKfkuUQcgAMb8DAMnLPe/FWJmgYaUOcw=;
 b=M+W4bcKHveuJEejxLAOBg59wSdnOw5kf6v252NHbS/7OkkP0YpRjUd0Yjs9fisxUw+lI5q1a1uMSN+i1oKJiPGYgFPyz2x+xAim+C1WDWEllyV6aozIw7BhBhCDnerW3pljn6IteKx1IqarXglwwrNYwxYAIKcE37zJserTmhxA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Index: AQHc1k50BMsvUkAtf0yXvEOre8XAaw==
Date: Mon, 27 Apr 2026 14:02:47 +0000
Message-ID: <F5384D51-933E-48E6-AE7E-B54022AEAE11@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AMCPR08MB11993:EE_|AM4PEPF00025F9C:EE_|MRWPR08MB11826:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c838a29-676c-4cd6-02e1-08dea465ce80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18096099003|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 CTQ9qgQJrhyUXm6slEt/Rl1DabKLXxCRpzqI4guf4c6q9ijmC4bUW/6aKHJcFFi60F8xzKImZNyMEXoKBhSJHiNO0a0S2iLVEMuH4dx58Z/2Sv+MPuYJGLFDbkXZHlKqp3QY354PPUw0r5kIbVqYpPEimtKCh3GOY/8pKWrTm++ILPDmcq8Yk/+k1YPBfssctvCuOc4M8a16LYIpQKsZVi2ECD6aYr2aW1IWil0tyRl4NuhNGVVW3ut9ofevHuhSDcU+I/YnLeo2aDx3ihdtlFcAuCwyPvzEMqF9bd7jZauEFHy6A5E5YLGrl2oNvpB7l4Hxei8gfuRhGRYZlehcgMHZfnwd/ycsd8E4fLPTuEXZrOFJxpNJH1nfLWk0TVLr/solbeUUcxOUj3kc2pO1auAjOuHSelSM7BCcAmAAEuhsfAK2hd4ORYGWOUoYHBENA+B97lY3KLSZwZE/pqOY32D31k8t/M0l4JxpuetMHHstSfdNW51I10C8YnX2YgjCxs3JeUhQG0FDwDaveND7A4hhlQfviydY3cSJfETkKxvq++f9tm8OGEOWye3WewNcT2g3mI5pniWpoxu1P9f7mQL6JCoACfshhqrIlsYpYG5P0eyv7mnIwuVoQoTyIFjqF992ZaDcFm9pikxldAMix7UymWmzQaKLtfHOuQK4XJxuRnN0VJpkcxeMqefEK0xkUD+teLv/bduxza6Wtp29QjwL93KxgUq9eg1VfHGNzerPzqC6BJaklUUNyrOj9bvMwXcQbWga4DAhE/Dgf/OXCo9Ui0+P3+iB1uSHDdMq2Qw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18096099003)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD4B42C3190E2F41A68ECECFE614EC96@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 a20+A2/u20CzxbAnaQRlZmV4DaWnZhkVucAkJvK6ESoFLmCMPGb7hwYxUiqGCrd4v8HGlTrsFOL0kJl9aAwbfE7W7PVy6jKglnEhzO6/Hv3N7cxVcKZDMhDNBYpPjYtx/BXggCjyhMoVTIIzhrpKB4pZ4BOYXb9wCjpdZHq0Vrja/uzbAcVyLFizku5xyQuXgmQTyvvneMZvVQ13YoSBKXRw0DudgfwpS7ZR6Th28/SkxYdhtpbi0fYhEPNLoWPLHR9R9ZkPjljrRx+YhmKsO8bsCIEV7H72JIWIH3PyTFiRjYZpjB2R8DnwpMVtn5Qp6BPsvUgocDuDAKIxs0JzWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR08MB11993
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5304a2d-7fa4-48d2-0c1c-08dea465a977
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|82310400026|1800799024|376014|18096099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LUbRNwJLu4gypAvjgLWXOyG6HqEPqKJ3U+6a3M25O4ZKqTDXKWXuyaY7+MkoG1AxVBKXB85EPuQ2F3hcIOp2hkc5/mPNUVBRbZlqMoBE9AphWz7k6KTe/dOARS4djXZU2Pn19bKQQDBTZCqReIcHn5r6URqtAME9JbQ1WFQk5xthG/IT7qOhpUVwLmNrgN976XzhOFDL4Txk5lba+/e+ajXAwUotGAutldJL+c4ZRBtCQLqmtOWE2pwbpHeNUbrX1EpivcthxYclfEKVpi+m7CvgUjSgrwHhMUx2AvHp/9cbLZdfyDV1Z4c4Ddb+ZWrTOJG2vuMnN6/jazMe6wmvbXAuHHyDidF/nt9jG0XqaPVyLyMVCaaMyqkCdTQjIv3dZSaqV8/zpHFuO1RGAfjCEeeArYOeYRUJoB8ha6AYfB8hr7mhCazMyUIaP0e9udeQvc/ckpe0QeKTSaZde/DQtXPN4411hOkjxI+jAxOqlbN4VhPq17+GgGKPqCJUHEVf3x/mQKpNn2Xt8czTmAs9/PCpYlSRKF5Ogz5PpLn8+LW/DPR0Clkn5inl1TgvGQ3/sU4zsao2lYKbN88B0ZoUopeKE8jeEv46/qi6+66RBmfdrttHJ96oJA0eHWPvghuVNc5g52QVjxjYCKzyqH3AJzO2EH+R+0UQoutje2Y0NsN43z9gkCmMfeWOe8AO2LGXqi067d992lGC/JJLaUPk1xsrnqYzm8lVCgiygG3cYvhhb0d6DgKbThq0ZNVinR6IQ2Obh8TJlaM1orpiKPToxg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(82310400026)(1800799024)(376014)(18096099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PH7O5VYsnDV2VK2+JfiYIbo2KprsXu1mSPD5x7mUsAj0747vdLGRbU+jfYOBSMFPmoKGClsGj7YV1c7bV1G8TcoSivEzBjbknc45lQsm1yS0WRlN7HI3xRBc8SU5sypKKb8Gq586JRVjuQiaYj2RIZ+Ri0AtHdWRRKXYsHbfq8HnJ/8nD7hi6X0x5clwFRbWoOzz6Oz+Y1jjS/NKFa/jC74t0vxELqTVe8axpnpudcpHZsG6YeMRvwE9ap/zHpSzYXt4IsNrYOi56IpbcnmAzg1UgSxLGwnpCUBDcLLLq9I9vPDdSVQbg4U5aeoYF7RKQunX1sCwo5KfjcS5vmoZCIruaLk7AS3cLgflg2LxJvV6gonFJyAKTW/FXhWyGx+gBGZUYQvD6YpbQ4ssHkpOQujGwnkEYTPTYw0rhBO1OT/Do5wF06pwKwk3i/k0wIHe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:03:49.5252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c838a29-676c-4cd6-02e1-08dea465ce80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11826
X-purgate-ID: tlsNG-d25034/1777298634-6F370CF5-C38E3942/0/0
X-purgate-type: clean
X-purgate-size: 9846
X-Rspamd-Queue-Id: B39FB473F78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

SGkgTXlrb2xhLA0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3NtbXUtdjMuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4g
aW5kZXggYmYxNTMyMjdkYi4uNzYwN2ZmYzljYSAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vc21tdS12My5jDQo+IEBAIC0xODE0LDggKzE4MTQsNyBAQCBzdGF0aWMgaW50IGFybV9z
bW11X3dyaXRlX3JlZ19zeW5jKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsIHUzMiB2YWws
DQo+IH0NCj4gDQo+IC8qIEdCUEEgaXMgInNwZWNpYWwiICovDQo+IC1zdGF0aWMgaW50IF9faW5p
dCBhcm1fc21tdV91cGRhdGVfZ2JwYShzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LA0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHNldCwgdTMyIGNscikN
Cj4gK3N0YXRpYyBpbnQgYXJtX3NtbXVfdXBkYXRlX2dicGEoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSwgdTMyIHNldCwgdTMyIGNscikNCj4gew0KPiBpbnQgcmV0Ow0KPiB1MzIgcmVnLCBf
X2lvbWVtICpnYnBhID0gc21tdS0+YmFzZSArIEFSTV9TTU1VX0dCUEE7DQo+IEBAIC0xOTk1LDEw
ICsxOTk0LDI5IEBAIGVycl9mcmVlX2V2dHFfaXJxOg0KPiByZXR1cm4gcmV0Ow0KPiB9DQo+IA0K
PiArc3RhdGljIGludCBhcm1fc21tdV9lbmFibGVfaXJxcyhzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNl
ICpzbW11KQ0KPiArew0KPiArIGludCByZXQ7DQo+ICsgdTMyIGlycWVuX2ZsYWdzID0gSVJRX0NU
UkxfRVZUUV9JUlFFTiB8IElSUV9DVFJMX0dFUlJPUl9JUlFFTjsNCj4gKw0KPiArIGlmICggc21t
dS0+ZmVhdHVyZXMgJiBBUk1fU01NVV9GRUFUX1BSSSApDQo+ICsgaXJxZW5fZmxhZ3MgfD0gSVJR
X0NUUkxfUFJJUV9JUlFFTjsNCj4gKw0KPiArIC8qIEVuYWJsZSBpbnRlcnJ1cHQgZ2VuZXJhdGlv
biBvbiB0aGUgU01NVSAqLw0KPiArIHJldCA9IGFybV9zbW11X3dyaXRlX3JlZ19zeW5jKHNtbXUs
IGlycWVuX2ZsYWdzLA0KPiArICAgICAgQVJNX1NNTVVfSVJRX0NUUkwsIEFSTV9TTU1VX0lSUV9D
VFJMQUNLKTsNCj4gKyBpZiAoIHJldCApDQo+ICsgew0KPiArIGRldl93YXJuKHNtbXUtPmRldiwg
ImZhaWxlZCB0byBlbmFibGUgaXJxc1xuIik7DQo+ICsgcmV0dXJuIHJldDsNCj4gKyB9DQo+ICsN
Cj4gKyByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiBzdGF0aWMgaW50IF9faW5pdCBhcm1fc21tdV9z
ZXR1cF9pcnFzKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+IHsNCj4gaW50IHJldCwg
aXJxOw0KPiAtIHUzMiBpcnFlbl9mbGFncyA9IElSUV9DVFJMX0VWVFFfSVJRRU4gfCBJUlFfQ1RS
TF9HRVJST1JfSVJRRU47DQo+IA0KPiAvKiBEaXNhYmxlIElSUXMgZmlyc3QgKi8NCj4gcmV0ID0g
YXJtX3NtbXVfd3JpdGVfcmVnX3N5bmMoc21tdSwgMCwgQVJNX1NNTVVfSVJRX0NUUkwsDQo+IEBA
IC0yMDI4LDIyICsyMDQ2LDcgQEAgc3RhdGljIGludCBfX2luaXQgYXJtX3NtbXVfc2V0dXBfaXJx
cyhzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPiB9DQo+IH0NCj4gDQo+IC0gaWYgKHNt
bXUtPmZlYXR1cmVzICYgQVJNX1NNTVVfRkVBVF9QUkkpDQo+IC0gaXJxZW5fZmxhZ3MgfD0gSVJR
X0NUUkxfUFJJUV9JUlFFTjsNCj4gLQ0KPiAtIC8qIEVuYWJsZSBpbnRlcnJ1cHQgZ2VuZXJhdGlv
biBvbiB0aGUgU01NVSAqLw0KPiAtIHJldCA9IGFybV9zbW11X3dyaXRlX3JlZ19zeW5jKHNtbXUs
IGlycWVuX2ZsYWdzLA0KPiAtICAgICAgQVJNX1NNTVVfSVJRX0NUUkwsIEFSTV9TTU1VX0lSUV9D
VFJMQUNLKTsNCj4gLSBpZiAocmV0KSB7DQo+IC0gZGV2X3dhcm4oc21tdS0+ZGV2LCAiZmFpbGVk
IHRvIGVuYWJsZSBpcnFzXG4iKTsNCj4gLSBnb3RvIGVycl9mcmVlX2lycXM7DQo+IC0gfQ0KPiAt
DQo+IHJldHVybiAwOw0KPiAtDQo+IC1lcnJfZnJlZV9pcnFzOg0KPiAtIGFybV9zbW11X2ZyZWVf
aXJxcyhzbW11KTsNCj4gLSByZXR1cm4gcmV0Ow0KPiB9DQo+IA0KPiBzdGF0aWMgaW50IGFybV9z
bW11X2RldmljZV9kaXNhYmxlKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+IEBAIC0y
MDU3LDcgKzIwNjAsNyBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9kaXNhYmxlKHN0cnVj
dCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+IHJldHVybiByZXQ7DQo+IH0NCj4gDQo+IC1zdGF0
aWMgaW50IF9faW5pdCBhcm1fc21tdV9kZXZpY2VfcmVzZXQoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSkNCj4gK3N0YXRpYyBpbnQgYXJtX3NtbXVfZGV2aWNlX3Jlc2V0KHN0cnVjdCBhcm1f
c21tdV9kZXZpY2UgKnNtbXUpDQo+IHsNCj4gaW50IHJldDsNCj4gdTMyIHJlZywgZW5hYmxlczsN
Cj4gQEAgLTIxNjMsMTcgKzIxNjYsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBhcm1fc21tdV9kZXZp
Y2VfcmVzZXQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkNCj4gfQ0KPiB9DQo+IA0KPiAt
IHJldCA9IGFybV9zbW11X3NldHVwX2lycXMoc21tdSk7DQo+IC0gaWYgKHJldCkgew0KPiAtIGRl
dl9lcnIoc21tdS0+ZGV2LCAiZmFpbGVkIHRvIHNldHVwIGlycXNcbiIpOw0KDQpXZSBhcmUgbW92
aW5nIHRoaXMgb25lIHRvIHRoZSBwcm9iZSBhbmQgLi4gDQoNCj4gKyByZXQgPSBhcm1fc21tdV9l
bmFibGVfaXJxcyhzbW11KTsNCj4gKyBpZiAoIHJldCApDQoNCmNoYW5naW5nIHdpdGggdGhpcyBv
bmUsIGJ1dCBhcm1fc21tdV9zZXR1cF9pcnFzKCkgYWxzbyBjYWxscyBhcm1fc21tdV9zZXR1cF91
bmlxdWVfaXJxcygpIHdoaWNoDQpjYWxscyBhcm1fc21tdV9zZXR1cF9tc2lzKCksIGFyZSB3ZSBz
dXJlIHRoYXQgb24gcmVzdW1lIHdlIHdpbGwgZ2V0IHRoZSBzYW1lIHN0YXRlPw0KDQo+IHJldHVy
biByZXQ7DQo+IC0gfQ0KPiAtDQo+IC0gLyogSW5pdGlhbGl6ZSB0YXNrbGV0cyBmb3IgdGhyZWFk
ZWQgSVJRcyovDQo+IC0gdGFza2xldF9pbml0KCZzbW11LT5ldnRxX2lycV90YXNrbGV0LCBhcm1f
c21tdV9ldnRxX3Rhc2tsZXQsIHNtbXUpOw0KPiAtIHRhc2tsZXRfaW5pdCgmc21tdS0+cHJpcV9p
cnFfdGFza2xldCwgYXJtX3NtbXVfcHJpcV90YXNrbGV0LCBzbW11KTsNCj4gLSB0YXNrbGV0X2lu
aXQoJnNtbXUtPmNvbWJpbmVkX2lycV90YXNrbGV0LCBhcm1fc21tdV9jb21iaW5lZF9pcnFfdGFz
a2xldCwNCj4gLSBzbW11KTsNCj4gDQo+IC8qIEVuYWJsZSB0aGUgU01NVSBpbnRlcmZhY2UsIG9y
IGVuc3VyZSBieXBhc3MgKi8NCj4gaWYgKGRpc2FibGVfYnlwYXNzKSB7DQo+IEBAIC0yMTgxLDIw
ICsyMTc2LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IGFybV9zbW11X2RldmljZV9yZXNldChzdHJ1
Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPiB9IGVsc2Ugew0KPiByZXQgPSBhcm1fc21tdV91
cGRhdGVfZ2JwYShzbW11LCAwLCBHQlBBX0FCT1JUKTsNCj4gaWYgKHJldCkNCj4gLSBnb3RvIGVy
cl9mcmVlX2lycXM7DQo+ICsgcmV0dXJuIHJldDsNCj4gfQ0KPiByZXQgPSBhcm1fc21tdV93cml0
ZV9yZWdfc3luYyhzbW11LCBlbmFibGVzLCBBUk1fU01NVV9DUjAsDQo+ICAgICBBUk1fU01NVV9D
UjBBQ0spOw0KPiBpZiAocmV0KSB7DQo+IGRldl9lcnIoc21tdS0+ZGV2LCAiZmFpbGVkIHRvIGVu
YWJsZSBTTU1VIGludGVyZmFjZVxuIik7DQo+IC0gZ290byBlcnJfZnJlZV9pcnFzOw0KPiArIHJl
dHVybiByZXQ7DQo+IH0NCj4gDQo+IHJldHVybiAwOw0KPiAtDQo+IC1lcnJfZnJlZV9pcnFzOg0K
PiAtIGFybV9zbW11X2ZyZWVfaXJxcyhzbW11KTsNCj4gLSByZXR1cm4gcmV0Ow0KPiB9DQo+IA0K
PiBzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9od19wcm9iZShzdHJ1Y3QgYXJtX3NtbXVfZGV2
aWNlICpzbW11KQ0KPiBAQCAtMjU1OCwxMCArMjU0OSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBh
cm1fc21tdV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gaWYg
KHJldCkNCj4gZ290byBvdXRfZnJlZTsNCj4gDQo+ICsgcmV0ID0gYXJtX3NtbXVfc2V0dXBfaXJx
cyhzbW11KTsNCj4gKyBpZiAoIHJldCApDQo+ICsgew0KPiArIGRldl9lcnIoc21tdS0+ZGV2LCAi
ZmFpbGVkIHRvIHNldHVwIGlycXNcbiIpOw0KPiArIGdvdG8gb3V0X2ZyZWU7DQo+ICsgfQ0KPiAr
DQo+ICsgLyogSW5pdGlhbGl6ZSB0YXNrbGV0cyBmb3IgdGhyZWFkZWQgSVJRcyovDQo+ICsgdGFz
a2xldF9pbml0KCZzbW11LT5ldnRxX2lycV90YXNrbGV0LCBhcm1fc21tdV9ldnRxX3Rhc2tsZXQs
IHNtbXUpOw0KPiArIHRhc2tsZXRfaW5pdCgmc21tdS0+cHJpcV9pcnFfdGFza2xldCwgYXJtX3Nt
bXVfcHJpcV90YXNrbGV0LCBzbW11KTsNCj4gKyB0YXNrbGV0X2luaXQoJnNtbXUtPmNvbWJpbmVk
X2lycV90YXNrbGV0LCBhcm1fc21tdV9jb21iaW5lZF9pcnFfdGFza2xldCwNCj4gKyBzbW11KTsN
Cj4gKw0KPiAvKiBSZXNldCB0aGUgZGV2aWNlICovDQo+IHJldCA9IGFybV9zbW11X2RldmljZV9y
ZXNldChzbW11KTsNCj4gaWYgKHJldCkNCj4gLSBnb3RvIG91dF9mcmVlOw0KPiArIGdvdG8gb3V0
X2ZyZWVfaXJxczsNCj4gDQo+IC8qDQo+ICogS2VlcCBhIGxpc3Qgb2YgYWxsIHByb2JlZCBkZXZp
Y2VzLiBUaGlzIHdpbGwgYmUgdXNlZCB0byBxdWVyeQ0KPiBAQCAtMjU3NSw2ICsyNTc5LDggQEAg
c3RhdGljIGludCBfX2luaXQgYXJtX3NtbXVfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+IA0KPiByZXR1cm4gMDsNCj4gDQo+ICtvdXRfZnJlZV9pcnFzOg0KPiAr
IGFybV9zbW11X2ZyZWVfaXJxcyhzbW11KTsNCj4gDQo+IG91dF9mcmVlOg0KPiBhcm1fc21tdV9m
cmVlX3N0cnVjdHVyZXMoc21tdSk7DQo+IEBAIC0yODU1LDYgKzI4NjEsOTYgQEAgc3RhdGljIHZv
aWQgYXJtX3NtbXVfaW9tbXVfeGVuX2RvbWFpbl90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKQ0K
PiB4ZnJlZSh4ZW5fZG9tYWluKTsNCj4gfQ0KPiANCj4gKyNpZmRlZiBDT05GSUdfU1lTVEVNX1NV
U1BFTkQNCj4gKw0KPiArc3RhdGljIHZvaWQgYXJtX3NtbXVfcmVzZXRfZm9yX3N1c3BlbmRfcm9s
bGJhY2soc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkNCj4gK3sNCj4gKyBpbnQgcmV0ID0g
YXJtX3NtbXVfZGV2aWNlX3Jlc2V0KHNtbXUpOw0KPiArDQo+ICsgaWYgKCByZXQgKQ0KPiArIGRl
dl9lcnIoc21tdS0+ZGV2LCAiRmFpbGVkIHRvIHJlc2V0IGR1cmluZyBzdXNwZW5kIHJvbGxiYWNr
OiAlZFxuIiwNCj4gKyByZXQpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGFybV9zbW11X3N1
c3BlbmQodm9pZCkNCj4gK3sNCj4gKyBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11Ow0KPiAr
IGludCByZXQgPSAwOw0KPiArDQo+ICsgbGlzdF9mb3JfZWFjaF9lbnRyeShzbW11LCAmYXJtX3Nt
bXVfZGV2aWNlcywgZGV2aWNlcykNCj4gKyB7DQo+ICsgYm9vbCB3ZmUgPSAhIShzbW11LT5mZWF0
dXJlcyAmIEFSTV9TTU1VX0ZFQVRfU0VWKTsNCj4gKw0KPiArIC8qIEFib3J0IGFsbCB0cmFuc2Fj
dGlvbnMgYmVmb3JlIGRpc2FibGUgdG8gYXZvaWQgc3B1cmlvdXMgYnlwYXNzICovDQo+ICsgcmV0
ID0gYXJtX3NtbXVfdXBkYXRlX2dicGEoc21tdSwgR0JQQV9BQk9SVCwgMCk7DQo+ICsgaWYgKCBy
ZXQgKQ0KPiArIGdvdG8gZmFpbDsNCj4gKw0KPiArIC8qIERpc2FibGUgdGhlIFNNTVUgdmlhIENS
MC5FTiBhbmQgYWxsIHF1ZXVlcyBleGNlcHQgQ01EUSAqLw0KPiArIHJldCA9IGFybV9zbW11X3dy
aXRlX3JlZ19zeW5jKHNtbXUsIENSMF9DTURRRU4sIEFSTV9TTU1VX0NSMCwNCj4gKyBBUk1fU01N
VV9DUjBBQ0spOw0KPiArIGlmICggcmV0ICkNCj4gKyB7DQo+ICsgZGV2X2VycihzbW11LT5kZXYs
ICJUaW1lZC1vdXQgd2hpbGUgZGlzYWJsaW5nIHNtbXVcbiIpOw0KPiArIGdvdG8gZmFpbDsNCj4g
KyB9DQo+ICsNCj4gKyAvKg0KPiArICogQXQgdGhpcyBwb2ludCB0aGUgU01NVSBpcyBjb21wbGV0
ZWx5IGRpc2FibGVkIGFuZCB3b24ndCBhY2Nlc3MNCj4gKyAqIGFueSB0cmFuc2xhdGlvbi9jb25m
aWcgc3RydWN0dXJlcywgZXZlbiBzcGVjdWxhdGl2ZSBhY2Nlc3Nlcw0KPiArICogYXJlbid0IHBl
cmZvcm1lZCBhcyBwZXIgdGhlIElISTAwNzAgc3BlYyAoc2VjdGlvbiA2LjMuOS42KS4NCj4gKyAq
Lw0KPiArDQo+ICsgLyogV2FpdCBmb3IgdGhlIENNRFFzIHRvIGJlIGRyYWluZWQgdG8gZmx1c2gg
YW55IHBlbmRpbmcgY29tbWFuZHMgKi8NCj4gKyByZXQgPSBxdWV1ZV9wb2xsX2NvbnMoJnNtbXUt
PmNtZHEucSwgdHJ1ZSwgd2ZlKTsNCj4gKyBpZiAoIHJldCApDQo+ICsgew0KPiArIGRldl9lcnIo
c21tdS0+ZGV2LCAiRHJhaW5pbmcgcXVldWVzIHRpbWVkLW91dFxuIik7DQo+ICsgZ290byBmYWls
Ow0KPiArIH0NCg0KcG9sbGluZyB0aGUgcXVldWUgZG9lc27igJl0IGdpdmUgeW91IHRoZSBhc3N1
cmFuY2UgdGhhdCBhbGwgcHJpb3IgY29tbWFuZHMgYXJlIGNvbXBsZXRlLA0KSSB3b3VsZCB1c2Ug
YXJtX3NtbXVfY21kcV9pc3N1ZV9zeW5jIGZvciB0aGF0IGluc3RlYWQgb2YgdGhlIGFib3ZlLg0K
DQpyZXQgPSBhcm1fc21tdV9jbWRxX2lzc3VlX3N5bmMoc21tdSk7DQppZiAoIHJldCApDQogICBn
b3RvIGZhaWw7DQoNCj4gKw0KPiArIC8qIERpc2FibGUgZXZlcnl0aGluZyAqLw0KPiArIHJldCA9
IGFybV9zbW11X2RldmljZV9kaXNhYmxlKHNtbXUpOw0KPiArIGlmICggcmV0ICkNCj4gKyBnb3Rv
IGZhaWw7DQo+ICsNCj4gKyBkZXZfZGJnKHNtbXUtPmRldiwgIlN1c3BlbmRlZCBzbW11XG4iKTsN
Cj4gKyB9DQo+ICsNCj4gKyByZXR1cm4gMDsNCj4gKw0KPiArIGZhaWw6DQo+ICsgLyogUmVzZXQg
dGhlIGRldmljZSB0aGF0IGZhaWxlZCBhcyB3ZWxsIGFzIGFueSBhbHJlYWR5LXN1c3BlbmRlZCBv
bmVzLiAqLw0KPiArIGFybV9zbW11X3Jlc2V0X2Zvcl9zdXNwZW5kX3JvbGxiYWNrKHNtbXUpOw0K
PiArDQo+ICsgbGlzdF9mb3JfZWFjaF9lbnRyeV9jb250aW51ZV9yZXZlcnNlKHNtbXUsICZhcm1f
c21tdV9kZXZpY2VzLCBkZXZpY2VzKQ0KPiArIGFybV9zbW11X3Jlc2V0X2Zvcl9zdXNwZW5kX3Jv
bGxiYWNrKHNtbXUpOw0KPiArDQo+ICsgcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KDQpDaGVlcnMs
DQpMdWNhDQoNCg0K

