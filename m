Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE3xCc0gcmmPdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:06:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7667072
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210986.1522552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuNv-0006Ym-2d; Thu, 22 Jan 2026 13:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210986.1522552; Thu, 22 Jan 2026 13:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuNu-0006Vf-VG; Thu, 22 Jan 2026 13:06:02 +0000
Received: by outflank-mailman (input) for mailman id 1210986;
 Thu, 22 Jan 2026 13:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viuNt-0006VZ-VR
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:06:01 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1911a418-f793-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 14:06:01 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7153.namprd03.prod.outlook.com (2603:10b6:806:353::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 13:05:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:05:57 +0000
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
X-Inumbo-ID: 1911a418-f793-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1yjiRSuntZluOvc7P/qmBiZ+81oueGiPtprw7Klxj6hd2u8wqjEPmQZFS/5V5CslMHul8DsNciCsg9M7bn4Yhg9dOvmq322v/Yz5BuFQPXep/PdYq/qV0k+1oV9oo77+RfNZtecfWQGIadn2drGlqBdBr8xiK/5o7X5yv+aPamg8Q7CK/qXYMlTco/5dFiqr7Ey0aH7kbvxMUbZhexEGNFPlUv4p2H0GEZ2ShsNURl7CvFunlZGcPjXens3UV4HHkdsprFcuXOzd/Y7DrHoYEmFwEDtUfilp8XYXZlaf3LEFO5VRJcVdhvCxFk5+GSjFl9+309SpG91+gUwnyWkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFD/qT4OVfg9dr7c4d4vbfsAInr6LCgB7utzTN1z3rc=;
 b=j8dPL6WDDxOUyC3qBx31qTQEplk4paKwxSHyMuULiMJupviFNDwpslqdw/alFKXbmZzN8aqnitTV41S7p2bMklU0zl3n5DeIrUTu+sJlKNc+Gxm4sz/SPuIDlIDLbcmnIPIMXRIuXFXNzD23ocCEJu7C0Z5r2V8bYiGl9EFqKpYPhYvcql4bdLmfapDKeI9RI91qNI3hP2PnKIDJPftOi7y3odYCkr5MZKM9exgCaDI2QdIGKagACknF4wdWqTUCHZauRi+PnB96h4ggFiRIhnsq/P9LoG0AakHehznhkn9lhDBS2thws5tAd0FEFbhZ5H01OmzGZllhxwoS3FhQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFD/qT4OVfg9dr7c4d4vbfsAInr6LCgB7utzTN1z3rc=;
 b=0TuNunIeeRMJl3tJW5PTa1xNW+DO1xRuGGHcAjCXlfPV+JMC5as8gjuLJ5bS63SYnIxOlBjIe619WXOrH8m8WFFUz5WUVb3SoKHnp35p9LxUUIMXlW8tJkxAN9LWqAtucCiLjUzrFlJ+BYtmCEm6x90XF5L2hw6Lh9DYdhq+xcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 14:05:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
Message-ID: <aXIgscqjXmCUqsQn@Mac.lan>
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-4-roger.pau@citrix.com>
 <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
 <97127b23-4e4c-4b06-a8bb-b1dad31bf0b0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97127b23-4e4c-4b06-a8bb-b1dad31bf0b0@suse.com>
X-ClientProxiedBy: MR1P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: b64d5b5b-28d0-4475-137a-08de59b6fb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SU5nWXhyRkNPKzhTYzFwNkRwQjg5L2RMYWc4STRpV2QrejFNMXJ4VUd1bktN?=
 =?utf-8?B?Q0l2Q241WUl0RnZ2bTBiN2RQM1h4T1d4NEpWcFBOZnpKTFRKNmgwN1EzMndx?=
 =?utf-8?B?WU1tMjd5d0tpb0NraVVpbzRPUzJUS1YwejFNK0N0bGpSQ1pXdDV5TmZ2elBU?=
 =?utf-8?B?Sno1eUluakpMWmI5U0I3SGZGdFg5VmhpeVRJeWlaS0FtTmgrOHQ5NURlOHhk?=
 =?utf-8?B?Yld5MkdlM2I4c2lsTU5HMVRJaUkyaHJZUGNVdkhwTUVmL3dUUVRCU0VUVllF?=
 =?utf-8?B?ZVk4OUJYbDhHcG9qR0I3NDlVM2ZjZEFnNkpjNFdldk9xYWxaajIwYlZrMlVB?=
 =?utf-8?B?d01hSGVjNytYekpDRE1aVXhaYWtHMVJUM2JIelU2bVg2WHlrcW45S0xmNCt6?=
 =?utf-8?B?UXF2RUxKdVJpVkNDdzB4YWc4YktWajlBY2owTlN6UHFlZmNENUU3Y0NTMnZK?=
 =?utf-8?B?Q0NYUGlObkNaaDJnWnhwdUZFVVlQenVSRXdJOVZ2VnZFWm1udGZkVlhuSk93?=
 =?utf-8?B?OXR5OFdrRitTRTFNWFB3QjlmcFRnd21XZmRCUHh4U0NPQjhRVWE5Qk1tRzEz?=
 =?utf-8?B?ek5TSHpidnBMQzJFc1NLdjVwOE4xdXQ5T2pYdUQ5NVdUbm42bUp2S1ZFTjZ6?=
 =?utf-8?B?dms4RmFjMnBncERsd3M4WVNnWG9QMjVWekhyc1ltaHNhWmN0N3JMVFR4YXl6?=
 =?utf-8?B?WTlUQ2kxUXJmc0F5OEJOZUk4a00xcWZ2b3h4RnA1L3R6bllXb3E1ZFd4ckRs?=
 =?utf-8?B?ODhSMWdCdkdIRUEzb0xFdHowQVY4MjdvWlZSNjJaaU4zRlNTbHNpMCtiR0JK?=
 =?utf-8?B?VCtZRjBDSzg5VlpSUUFLdld1QWphSDdoQ1NrMjQvbVZGT2pVazBpdUhVLzM1?=
 =?utf-8?B?OVV1cnJTSzlLT0hTNE9JVktHZTJwNlhyUGpQZm1VTEpPZGM5MzBzWTRVMmRi?=
 =?utf-8?B?KytnL0ZtQmI5M0VhSEtRWkxXVXBFd0t2b3NndUI2bWZZdjVsOEcvSW42azJV?=
 =?utf-8?B?T0NyUloyT2VxWlNubmo1dEV3WU9BUnlUL2R3djU0ZVlBNFA0ZDZpQkhVa2Uy?=
 =?utf-8?B?UzVIVmNydjJWeGF2NUErYlNITm5rK2MwQXJmbHZkdWMzbVdaWFMwUTF2VjVF?=
 =?utf-8?B?Ymw3d1cvMWIvL2xaUUhGTVlwSDN2SlJQUFQ4VE8zc1M2ekUrSUo3VXBvQXRP?=
 =?utf-8?B?ZEthMWtlZnd6bmUxRjdVNy95bDZiRkJPbDRQb0x5amlSWmFyYWZOaTJWOG55?=
 =?utf-8?B?Q3JZY1pCR3BqSHZWaTVDeW53c3JNZXhuVk4yVzRodSs5UzFZV2FaOUgvWnNF?=
 =?utf-8?B?aVFsWmFEWWJmMnlUZllwWWNabGU5bDlQbkJEQ3JnSHVwOEMrQVVtTTNLbVA2?=
 =?utf-8?B?Q0k5R1hWc1VKazJmWWZKZ29ZUGtzSDhyamt6SUpkdnl5b21naGtXbE1GL1g5?=
 =?utf-8?B?aEZZUFkvK2pBTVRsWEgyNjNSMlJubzUxSGFrdkNtdGEvTVRRSDdGbjFIbU9C?=
 =?utf-8?B?Umg5M3pjNW9BSDJNUE16N1dUWnFzeUEvRms4QzVySExBbjdoRFdZVU9IbFQ4?=
 =?utf-8?B?YXR1Vy9wRExTanBGTms0UzlpZGlra2dHL1hXV1VXZ1ZtVlkxaFBrZ3NQckRN?=
 =?utf-8?B?NlQreXBXdCtobVFWbk0wWDBUa2JkcGtDSjRNd0I4RlA5QlQzQnhBUkYydk9G?=
 =?utf-8?B?emxYczVPaTJvNDFZNm9mNzlwbHlYV0hMVUR0c3NFV3VTcnhQd2JJQi9WcWox?=
 =?utf-8?B?NEtFYWJreTBPM1RPS09VYzdUYUltRjF0Q29NbU0ydnkyUnVoMzM4aEFKLzVN?=
 =?utf-8?B?NjVjd3VHRHlQZEhpRVFTYXdNUWZ4MW5xcWowM3JLMWtlTTNrVjRNMzN3Q0l6?=
 =?utf-8?B?cmEyVnZxcVdZRnZQSXRZOFB1a2lsNGZOOW5obFNSeEppNFpqTFVLT2tWVTBO?=
 =?utf-8?B?Ym8vb1NOT25zUzFPeTlLKy9ORzBPbS9hT0FqUnhBZ3lUdTdHZml6TWJFaFdE?=
 =?utf-8?B?b3Z3YTIvRFBmQkM4UERFbUZ1Szl5dTJ2Z2NPUkQvZjV0MUNXVHFWOWlFeWxS?=
 =?utf-8?B?dVdnUmFUY1JZTHF4V0xjWEx3RU1aNldJbWtmdFlKdlFaN2VMdEJTcUNzcXJh?=
 =?utf-8?Q?1KjE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBMU2xORysycHc3cys1bmlObWRUc1JFYWM1RzNmTmczVVJ3NS9XNzBIRWw1?=
 =?utf-8?B?WERZNHEvWk83RFZveHMyODZRRFhXUDI2MHRybmFsTUgwWnNMc0pSNVY4Qy8r?=
 =?utf-8?B?RHpPTVhHam5udVgyRG5OZ0JhMG5IY3BFRDRvNjNqSGpqVU14bCtBRm1jZGJx?=
 =?utf-8?B?cEVEdExZVWswdVhQMi9GMC9yaWd6Mk5SaHFxQmlXMFVsQ1dNdXVOUlhSUjRL?=
 =?utf-8?B?bmV3QkFuREZrTUJPdFpETGlDVlpqdG94cXVkakNkUDJYTXdmK0puTUlkdFpX?=
 =?utf-8?B?MFRpWkx0VEdINFBPME1jeHdwV09ud0pONWZqRmg2U2RRSk4rc2JDRnJkZmxH?=
 =?utf-8?B?V1cxYkhBMXFaQjU1RTBxeThqVk9xWmxMR0J5UXFRK2FROE5heW1GYXlaMlJP?=
 =?utf-8?B?TnhMcWw2MWdPVExmYXZTSmFMdjRHSm1ySHplaG1KRGFYOW5kOU15Mm9JOTEz?=
 =?utf-8?B?cStYVVVCZWFSMTJ1RDRYM0lraFU0WmhnMmlqRFdMMU5xWTB6UHNzRlVOWDJH?=
 =?utf-8?B?VDc5WGhTWDc4d1FpMUFBWUJwMUkzdFJ3bUlQVlZhUFBKN3BndDdSOEtvTWVt?=
 =?utf-8?B?SGVuM1k3QkxXaGlqYURiTFBpSjhBYldaTkNyQWtlVG1SYmJXa05YNzM3YjZI?=
 =?utf-8?B?ZjM4eDFjMDJrNDFSZmZCZS9OZ0RXRExzTG1YYVE5cWxlTUN1Rzc0ei91SWxG?=
 =?utf-8?B?clBrWmlSNlgxVUc4MDBLblU3YkhWVFpvQVlmYm8xZDdVWFVEZXBBak1obWdr?=
 =?utf-8?B?UjMwcm9RMkF2UThhOEg4ZDBPZ1ZMNW1TQ0lNNlRieVVQZXdJU0pLTWpOc0RI?=
 =?utf-8?B?b0JCUGdkUExFdUhNSGtWbDF4T2F2TFdFcGhFN2tPcnFVNFFwSngxN0lUS1A4?=
 =?utf-8?B?RkxQRVdMQ2lVc0s0emh1OGVYbEwxanpka3BrNVVaQ01zVUVnNWpJTG85Y2dw?=
 =?utf-8?B?YVFsb1ljVGk1a0dPOU12YlJZRGpxMjgrZm1UTllPN3BLSVVoUHg2b0l4SzZn?=
 =?utf-8?B?amRKbmg1azB6Tmc5TEQxYnlkUDFtSndKQTBRSHQyQ25qVGt0bTBUWjA4UURO?=
 =?utf-8?B?bnVudkxNSnlPOElZZW1iK0Y1YVB5UHZBNnQvWWxJVkg1ZDdJY1owalBFK0tP?=
 =?utf-8?B?a2Q0TWxFR3A1L0xBU0ZFMXFsUW9BbXJVb2MydXZDZVUxQUJzTlQySVRYMGxR?=
 =?utf-8?B?dHVNSExvT29GWHR5OUU0UmExdEZUcWRKOWc0NmxqbUNKQmJ0cURzV2RwZkFE?=
 =?utf-8?B?TVJxbStqMC9ZK3htNk12U2owdDB4QWlzeVl3cTNKemYybU5MYjhUNkpnUTlx?=
 =?utf-8?B?Y1I0L1hwTnFMWEl2MnRIMHpIaWpBUkJrYzhkY0RkSkJqcWlaQkFZMXdlNWlD?=
 =?utf-8?B?ZGFENjYrc3FEMXdFUVlOZlV6emxwdzdNOWl4QzZDMGZPRXAyZnlNRlhwQ2dK?=
 =?utf-8?B?Q3NBemlaRkVBbTJJaVlGRHlFSUNSMy9SNUJINFg4Wm1USndDd2dSMUxqM1h5?=
 =?utf-8?B?Kzc1V3lWelJlMHQxNTJBMzI0MGVDR1l1SytKVnRWNTlCMkpkcXliSWZoRUUy?=
 =?utf-8?B?eGhXZlVadkd3dG5LcGhDS2JRVjc3TjRRV3JwQmt0alUzWXc2U3k0L2VCZTVM?=
 =?utf-8?B?QVBzWkJ2dCtSd3N4aVpaMHFGaWZOOHJydFd5Q1FRRytDaFpnbnYxUmk1anNi?=
 =?utf-8?B?OUNobkZNTksweGFCQmtDOThrOWllem9aQzhlM3hBd0plWXE0RkFXL09zTm5P?=
 =?utf-8?B?NFdsNjlKTjlEa3RjZEVSUjhTdURMTVdyeTJFZDh2M3JxZk5zcmVPOTB5Tytl?=
 =?utf-8?B?ZUswei9vK1k2Y0drZ0t5emliYVdGL2FpTEI4Y3lGLzRwRjhxSVpNd0xGajhB?=
 =?utf-8?B?YWxZd2FnVXRPdlB0Y0x5TVdaV0dLVlZxOCtIUXorQzJ2UXJZQ1VXMmw0eit2?=
 =?utf-8?B?dzR2V3ZVZGxSOURBeHN3M3FiTjArbnBtSWNFOEppclE5bDhFVDdHQ0dkaEZ4?=
 =?utf-8?B?VjF3Z0FpVGlmaHlOQnNFanpOdVJ0LytQSXhKK1BRdGlWL0JGK25STDQ3NWNz?=
 =?utf-8?B?eEpuMURncDJ2Z1pua2oxWXJKc2J3dklpUFlhQUx1NCs5RDgvTWJnTzV0dE9L?=
 =?utf-8?B?YXNnRUhGMjQxbHlnYVpPcXBZR0QyZGxVUUh3a0p1MVRxbnpFSkxMOTZxOEZM?=
 =?utf-8?B?bTF6dEVtRzFtNk5WSjFMMTRqdm8rNFI2QzduV3JGNzdMZDllaUN4aU5iekYx?=
 =?utf-8?B?REVkWndpeE45R1h4THMwYi8xYTl4Yy9rOWhtTXA2eGlpOXRLTnBmSjBOTGNM?=
 =?utf-8?B?Tkl5UG8vRENMeWh4aG15SkRQbzUxRXo3Rm5qQ0Rwc0h3M2I2cEg2Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64d5b5b-28d0-4475-137a-08de59b6fb7c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:05:57.3291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WKqmwZTpG07j2wqTCOs6MsU9+XYdCEhZJaqfFcWi+pNCEGm2H3P15/nDNb2Umb01kYgUA6lTkEqY7vCLbM3fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 86E7667072
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 08:25:49AM +0100, Jan Beulich wrote:
> On 19.01.2026 17:13, Jan Beulich wrote:
> > On 15.01.2026 12:18, Roger Pau Monne wrote:
> >> The current logic allows for up to 1G pages to be scrubbed in place, which
> >> can cause the watchdog to trigger in practice.  Reduce the limit for
> >> in-place scrubbed allocations to a newly introduced define:
> >> CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_DOMU_MAX_ORDER
> >> on all architectures.  Also introduce a command line option to set the
> >> value.
> >>
> >> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> Changes since v1:
> >>  - Split from previous patch.
> >>  - Introduce a command line option to set the limit.
> >> ---
> >>  docs/misc/xen-command-line.pandoc |  9 +++++++++
> >>  xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
> >>  2 files changed, 31 insertions(+), 1 deletion(-)
> > 
> > If you confine the change to page_alloc.c, won't this mean that patch 2's
> > passing of MEMF_no_scrub will then also be bounded (in which case the need
> > for patch 2 would largely disappear)?
> 
> This was rubbish, sorry. Besides my being thick-headed I can only attribute
> this to the double negation in !(memflags & MEMF_no_scrub).
> 
> I have another concern, though: You effectively undermine ptdom_max_order,
> which is even more of a problem as that would also affect Dom0's ability to
> obtain larger contiguous I/O buffers. Perhaps DIRTY_MAX_ORDER ought to
> default to PTDOM_MAX_ORDER (if HAS_PASSTHROUGH)?

OK, yes, I can default to PTDOM_MAX_ORDER instead of DOMU_MAX_ORDER.

> Yet then command line
> options may also need tying together, such that people using
> "memop-max-order=" to alter (increase) ptdom_max_order won't need to
> additionally use "max-order-dirty="? At which point maybe the new option
> shouldn't be a standalone one, but be added to "memop-max-order=" (despite
> it being effected in alloc_heap_pages())?

I had concerns about adding it to "memop-max-order=" because it's effect
is not limited to "issued by the various kinds of domain", this is an
option that affects all allocations.  I could try expanding the option
description to reflect that, but I wasn't sure whether it would lead
to confusion (as all options there are per-domain currently).

Also if added to "memop-max-order=" the parsing function needs to be
adjust a bit to consume an extra parameter in the !HAS_PASSTHROUGH
case (which is not much of an issue).

Thanks, Roger.

