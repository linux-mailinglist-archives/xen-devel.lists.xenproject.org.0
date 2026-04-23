Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHSKBv/K6WnSkQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:32:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A2644DFEF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291641.1570504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFoXX-00044i-9m; Thu, 23 Apr 2026 07:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291641.1570504; Thu, 23 Apr 2026 07:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFoXX-00043F-6K; Thu, 23 Apr 2026 07:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1291641;
 Thu, 23 Apr 2026 07:31:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFoXV-0003pr-N0
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:31:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFoXT-0005ga-Hm
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:31:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9cae0-e002-0a2a0a5209dd-0a2a4505e782-32
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:31:57 +0200
Received: from [52.101.69.71]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9caec-aaa8-0a2a45050019-346545478779-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:31:56 +0200
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by AS2PR08MB9271.eurprd08.prod.outlook.com (2603:10a6:20b:59c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 07:31:53 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::d1) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 07:31:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Thu, 23 Apr 2026 07:31:52 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV1PR08MB11167.eurprd08.prod.outlook.com (2603:10a6:150:1ed::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 07:30:49 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Thu, 23 Apr 2026
 07:30:47 +0000
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
 b=bvVSD+/uLeLtrrbLvRGkRX63CWL+5Ryd6OinsWdbC7s3+UOD5joisztdwAJCgD4hPOknjlTPxWLFmRsNWcTRye2CxXknCQl1g3GDrXGYHlGpH3z58tLkydEbXOzC9BYu3b1GbhU12lcjfTW9g2bWcKGhM9A+5zfksTaAIB/vB6v6mPKooHysoVEamkoVMO8pnKgGhW3XBWmkScnkGw2NrQhkHNB6WQD7QYQ7cD6IJDLEUzrCutoZkCWQETGcmvD/XQvmUghXRPQRAGDW1azckTIDQqNYW2kL3hw3yWjx3RYfR2uqLveQekVVA0GyWMpGauUK+qw/65tEskbZqm/cng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+U4ZTCNpG/zKUfH/DZUWbWWykBY0TObICukbdViixg=;
 b=ABfPSj9dzYQ5EAqXiaBJY2QxtiVy7wVhV+HcHwtW6NScPPlgv0igQ0EZcYu382jzZBvPsg5A/+TfTLwlIjDTe36gvGm2cXvY0bIJeeiyiDefN2EnQ5974JFZPD2HDQchWMMszbMjMYSZKV2mNn1niuv253PEd1ispo4lFJ4K1dAzm943Vwd0AJgJTSkUtRIbKLYTsp7m2ODi30/yicWUhoNpJbZQ3BeQhvnRO5nzyMQZb4PmU/8dlgANwDAjdi6KBLQIvWaNSk/xtror37Ar+1m3Tq1IFePcYsy9z5tL5VKIaa2mgYp4g1Kx6oxmbMnBJOBqRuoxfk5RsRJoK1hzKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+U4ZTCNpG/zKUfH/DZUWbWWykBY0TObICukbdViixg=;
 b=VR9b+MmPfWMVvEQM/dXx+IIDR8eRAZWCIXIirSxJWcgQeYotLdMAAaYQVJGz5mRS9wheUcKz9DxfGC75nmOweYwQRrpRnhO81VqBCPjpULv1IfVBw6EDrx4jGZCmwuzpdk00OX+emkom9XZFuT9x/X32N4BbNXU65uLSTH6EyG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7I+ZJj6J+Np1rrPrRw4ko8AviMPV/OWD5nruY1nsNnTqGv7BeCOp7sQh3mQbp8p1xVmfXtvVZkIZGiA+buNDN/sdyZPBmOI0v0mkurw6ns9zQtyCUiwv+fL4bBOWjP439zsm9Dcaya1oMKr6OjKOq4qc17lA/2BRZrL4V1kEStA0Gp35SQvurrbsmR4UyopXhuqec0FhabWA8H7Y9jFi0bKwnRNPj3x39SqXbhCe0VmOKJw3J8jQSCFVEQr2mvP48AtMeqGjkOlbLjinUirMCngSen+kdEWh254mf9Xs3ZGG/GASVCdQnwwKCvOhbwJrn0jlfbzQqvVEzKAc+TUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+U4ZTCNpG/zKUfH/DZUWbWWykBY0TObICukbdViixg=;
 b=Bwiap8u9WX/PKNQQyxYiP2Awbd0AgDaJkTnEMW/mlmh+XzTazFOPzftUdHwUADkvpDBJ566gzF5M5mpr8zUV+C9MHyAYoY7UiyKixmCqpClUwW37QLti8Eh6u+kLdADlifZgffl6Orn8ng1CXj5pB0B0ZgvH97VHw+RNdN1DXcYRWEVhXWxmJpzQoxHNs8lZEkmeoGlpexxYtLnygmEc8A3BBi/8Kgjei5NOv6xR/y8KShu+5VkqxgwuDTTl2RjGZHKiWyNcUuFHcPTGc1S+5bnWuLdFooAulhOz6i5x0qpi3i9HTdsA3n/Naz3qBpOf6QAHjCW9lAYOYl0LrJNE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+U4ZTCNpG/zKUfH/DZUWbWWykBY0TObICukbdViixg=;
 b=VR9b+MmPfWMVvEQM/dXx+IIDR8eRAZWCIXIirSxJWcgQeYotLdMAAaYQVJGz5mRS9wheUcKz9DxfGC75nmOweYwQRrpRnhO81VqBCPjpULv1IfVBw6EDrx4jGZCmwuzpdk00OX+emkom9XZFuT9x/X32N4BbNXU65uLSTH6EyG4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 3/6] xen/arm: ffa: Tighten notification parameter
 validation
Thread-Topic: [PATCH 3/6] xen/arm: ffa: Tighten notification parameter
 validation
Thread-Index: AQHcznAJmFfrrKKQhkqwUOWc2qiMrLXq+6oAgAFNnoA=
Date: Thu, 23 Apr 2026 07:30:47 +0000
Message-ID: <6269430C-DD6C-49AE-8F20-C7FB73280E3E@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <1036add9199c6304eb649854024c74dd0f0192cc.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44FdbLqNRVzjy6Y3qMp5ez9PS-3tY_VjMJMXHRs+=AKVKg@mail.gmail.com>
In-Reply-To:
 <CAHUa44FdbLqNRVzjy6Y3qMp5ez9PS-3tY_VjMJMXHRs+=AKVKg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV1PR08MB11167:EE_|DB1PEPF000509ED:EE_|AS2PR08MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 229da350-7b86-4ce3-ba4d-08dea10a63dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|38070700021|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 e4Si/TS0hHB/JnuvK6qr2yHgSQ0C4iPyTR788xsxG9xaQUuvss3+YMOMsrT3FCJ4s9mjKlvNKXeeEBYiN4cH8IXlVeEtim702uF2IiLdxo+c0xyGq+VqjTTSOxlcvRuKTqLxCxFBM7ECH/sTLjpdX0XaqhKKXlMLuCUz5NWO5TOklA2IuDLQvvppPKWEPwEMMvV9IqgkDhYzyVA6633JyYYPLzJL0lXZBLOG/z67S7iwj4VEzusY4cKOer7OgkvYMDj2A4/8tiiGtr3kM09QbC0DAtVtzStMTvZInUrAoqqxqWhH70EMM+0tAZazsyS6y1YT0J95OV4CbszEi9oNYKeazghA5ljzrlI8IK7SumYXuDPDpajiQJL/nnh9rYvmfeMR5G5Er62qf8/T68rs00FSUg/eck9znzhP1G+h6ZvlfMRL6U5LwNvHLuwtcy1HptmchV0jxrnEJ3kcOKxYFIMYyUysQCZCcNQpp2Bq89n/IQtyU+I+IHU/098saUaMnMO5dNUpFuHkawjvFoLlvtRD0Z3/MtS7lCL7MR9Nasum2NRst/g0SNuSK/mWKMZdhnUuf0lAjuPYUJL99ckF7TyoO1aAPbH4JXYpFS1lg8dy0eP0KT3NSMZ3vrFRn6nxjFKVgiPmCw+7Bt9Q+B23TIebqs11QmiOhgl4NL1bPKGe9xATrJ84CcZiqgXMBNvDE6k0rqpmbfcNKPpO+Zav7D504VPrRZwl0VnRp2Td0Cy4Vb8OFEqPvBEvO8bKRbDPC1vo8ieT1yXsgZvuKBMW1PXVNe2fpuOzQf/QX/Q3spE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <03DE80EF664CE949B62939200B67877A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 s9ANxr5zgwU9XTG6zW6GtnKHYhzs63Ftp6MuxF77EbzgUhf2jkotb00GE9tc4X7LS6IwfTcmqk/rv/h3Qv7xfM5xMfHJus1HahXoc47ARoFEDRlpwcequOtwdFNxKNZCRnvO/mcZahGZRMFeGjoTcHoV0gQPsOIX7d04ugmL0Yb4mGZdFLukTMybTQ1D7nu3EpRNjjaqcfL/ozsn4Fz1QIto8XNyDJqg9Ha7EIaC8FnktZXVZsIRsoS3zKFKTvMCPNL9Nw2j82S58Rj7RNp1L2Eog0hnEwzufHyoIPJVovSfk93B9n8KJV+SZWze12dnId0ce+qZ7UXLvyodqDti/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11167
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	999e0d0d-9837-469e-c0a1-08dea10a3cda
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|14060799003|35042699022|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ppf3k/67CjnXVTpjqX510yoEdPS7/VYZ9QPICAtkLOWHkC1ZWYoz2f6ynfD7bxczu+hu32T9BiFGP9aLtnHGBFDVhulWBv1m95SZGiHbjlbMiKKuNLDse99EPLn/IHRr/f2t1zV8bRFmsURIRsjl0gSsh47+NIcONOUZT+wEQ6PfhYHSP77pP/clbVUwf6A5EONtIaude12tjxiLZBL7QV8zivIizW/oQHAhziXQ2JTdYW5g+eQieIteFdW6XBTjri4Hscw7p/8rzsWX2qaeCOuFNC/GlHTsz495T6VpMDuOPHl/D4+pp5jcLOjATd1Xy+P3vv5PJ2h1fpSTdLt2L0wEzcFdVKc7IDsX7RAg0i2bw+2T3iOEGnt+zCxjXfnjNChZXy0HbpeoturNmJwcf5t4dVyb6/oXFsUohrpVIGPVjzljqxjAnGOfrsIxPov+TbKCfqVbN+BiLnjVVjFr83b0H7zRCTViW3XcHRHF57B1OrnwftNnwMXKKrWzsdeBaVIHgbshVjyIqsOqdcpdCpFPnxomk0gq5h834I28Ofp9YKzrRNNiBq6vyQuEBdN5bq2Tkas5wKmMq9r5EdtA9MnkV61a3DFWbUR2GH9kDJtMKxqKhxzI4B8AzuRRakYi8o5w/2vBWTR5JNgc6ErRPNpUd4stcXSVfbGokYDZNotY+zYdUDVNcIQZf55Q6sefBGdhxntMbY2/EzM1DH6OkMFHI1whXsc9aqgw6/mQEOhYzXu8/DP0/WQmFEGPeHWbfq4vAVeEluJs3YdgHuT0zA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(14060799003)(35042699022)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x8sgPsVFHxp+xXV5/+AEP1ixhJQy7fCVEr24zpEuq6Yti422lHq1ze/WYgikbafh66Rvy66L5IGLHtFl6R0KypB5u/urH3s9UErDpe/OKIn3BNXMPoylDvTbFDd/+R++1s/ffbUAreQ+vapxjG8Xy+622fhk7moLkBUSu/AtFN0wjuBcuDy5+oLJ1SJbZPPUEVLea8mnYt37IiKUNLcoM+SMdKAjZFzvdgHGADtuBWFjyEGmCpZ5WjDkNBsZg4Rqjjq8dIK2+yRxCJ/IsYPTGYbLbU5YjfoWN6Wux0zW/bbItASgub5lDoaQy++oZPLFAbPdsmC6Gfkbmc1SJxjeNINA95y/7137YLXBbzELk+As1lKrzeDwhZ8l+Z1oe5vTFvxA/+2JXTx/oEaRZtY5nefnbyX8jp3rQh7LdvhcrTGTTUAEVsIuNKuU0bIG9mSs
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:31:52.9343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 229da350-7b86-4ce3-ba4d-08dea10a63dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9271
X-purgate-ID: tlsNG-c201ff/1776929516-E93A0443-2C6D5A5A/0/0
X-purgate-type: clean
X-purgate-size: 3474
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,arm.com:server fail,linaro.org:server fail];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: C1A2644DFEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmVucywNCg0KPiBPbiAyMiBBcHIgMjAyNiwgYXQgMTM6MzYsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRhbmQsDQo+IA0K
PiBPbiBGcmksIEFwciAxNywgMjAyNiBhdCAzOjQx4oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPiA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gVGhlIG5vdGlmaWNhdGlv
biBoYW5kbGVycyBzdGlsbCB2YWxpZGF0ZSBvdmVybGFwcGluZyBzdWJzZXRzIG9mIHRoZWlyDQo+
PiBpbnB1dHMuIEJJTkQsIFVOQklORCwgYW5kIFNFVCBlYWNoIGRlY29kZSBjYWxsZXIgYW5kIGRl
c3RpbmF0aW9uIElEcw0KPj4gbG9jYWxseSwgR0VUIHN0aWxsIGFjY2VwdHMgYSBub24temVybyBy
ZWNlaXZlciB2Q1BVIElEIGFuZCByZXNlcnZlZCBmbGFnDQo+PiBiaXRzLCBhbmQgU0VUIHN0aWxs
IGFjY2VwdHMgbm9uLXplcm8gTlMtdmlydHVhbCBmbGFncy4gQklORCBhbHNvIHRyZWF0cw0KPj4g
dW5zdXBwb3J0ZWQgbm9uLXplcm8gZmxhZyBlbmNvZGluZ3MgYXMgYSBzdXBwb3J0ZWQtZmVhdHVy
ZSBmYWlsdXJlDQo+PiBpbnN0ZWFkIG9mIGFzIG1hbGZvcm1lZCBpbnB1dC4NCj4+IA0KPj4gQWRk
IGZmYV9ub3RpZl9wYXJzZV9wYXJhbXMoKSBhbmQgdXNlIGl0IHRvIGNlbnRyYWxpemUgdGhlIGNv
bW1vbg0KPj4gY2FsbGVyL2Rlc3RpbmF0aW9uIGFuZCBub24temVybyBiaXRtYXAgY2hlY2tzIGZv
ciBCSU5ELCBVTkJJTkQsIGFuZCBTRVQuDQo+PiBBbHNvIHJlamVjdCBtYWxmb3JtZWQgR0VUIGFu
ZCBTRVQgcmVxdWVzdHMgbG9jYWxseSBiZWZvcmUgdG91Y2hpbmcNCj4+IGNhY2hlZCBzdGF0ZSBv
ciBmb3J3YXJkaW5nIGFueXRoaW5nIHRvIHRoZSBTUE1DLiBLZWVwIEJJTkQgbGltaXRlZCB0bw0K
Pj4gZ2xvYmFsIG5vdGlmaWNhdGlvbnMgYW5kIHJlamVjdCB1bnN1cHBvcnRlZCBub24temVybyBm
bGFnIGVuY29kaW5ncyB3aXRoDQo+PiBJTlZBTElEX1BBUkFNRVRFUlMuDQo+PiANCj4+IC0gYWRk
IGEgc2hhcmVkIHBhcmFtZXRlciBwYXJzZXIgZm9yIG5vdGlmaWNhdGlvbiBjYWxsZXIvZGVzdGlu
YXRpb24NCj4+ICB2YWxpZGF0aW9uDQo+PiAtIHdpcmUgQklORCBhbmQgVU5CSU5EIHRocm91Z2gg
dGhlIHNoYXJlZCBwYXJzZXIgYW5kIHJlamVjdCB1bnN1cHBvcnRlZA0KPj4gIGJpbmQgZmxhZyBl
bmNvZGluZ3Mgd2l0aCBJTlZBTElEX1BBUkFNRVRFUlMNCj4+IC0gcmVqZWN0IG5vbi16ZXJvIHJl
Y2VpdmVyIHZDUFUgYW5kIHJlc2VydmVkIGZsYWcgYml0cyBpbg0KPj4gIEZGQV9OT1RJRklDQVRJ
T05fR0VUDQo+PiAtIHJlamVjdCBub24temVybyBmbGFncyBpbiB0aGUgTlMtdmlydHVhbCBGRkFf
Tk9USUZJQ0FUSU9OX1NFVCBwYXRoDQo+PiANCj4+IEZ1bmN0aW9uYWwgaW1wYWN0OiBtYWxmb3Jt
ZWQgbm90aWZpY2F0aW9uIHJlcXVlc3RzIGFyZSByZWplY3RlZA0KPj4gY29uc2lzdGVudGx5IGVh
cmxpZXIgaW4gdGhlIG1lZGlhdG9yLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBN
YXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9hcmNoL2Fy
bS90ZWUvZmZhX25vdGlmLmMgfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkN
Cj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMgYi94ZW4v
YXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBpbmRleCBkMTUxMTk0MDlhMjUuLjQ5MWRiM2Iw
NGRmNSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+IEBAIC00MiwyMSArNDIsNDAgQEAg
c3RhdGljIHZvaWQgaW5qZWN0X25vdGlmX3BlbmRpbmcoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAg
ICAgICAgICAgICAgIGQpOw0KPj4gfQ0KPj4gDQo+PiArc3RhdGljIGludDMyX3QgZmZhX25vdGlm
X3BhcnNlX3BhcmFtcyh1aW50MTZfdCBkb21faWQsIHVpbnQxNl90IGNhbGxlcl9pZCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGRlc3RfaWQsIHVp
bnQzMl90IGJpdG1hcF9sbywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGJpdG1hcF9oaSkNCj4gDQo+IE5pdDogSSB3b3VsZCBoYXZlIHBpY2tlZCBm
ZmFfbm90aWZfdmFsaWRhdGVfcGFyYW1zKCkgb3INCj4gZmZhX25vdGlmX2NoZWNrX3BhcmFtcygp
LCBidXQgdGhhdCBtaWdodCBiZSBtb3JlIGEgbWF0dGVyIG9mIHRhc3RlLg0KDQpBZ3JlZSwgSSB3
aWxsIHJlbmFtZSBpdCB0byB2YWxpZGF0ZV9wYXJhbXMuDQoNCg0KPiBBbnl3YXksIGxvb2tzIGdv
b2Q6DQo+IFJldmlld2VkLWJ5OiBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJv
Lm9yZz4NCg0KVGhhbmtzDQpCZXJ0cmFuZA0KDQo=

