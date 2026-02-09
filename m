Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO2lCKYDimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:56:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C11123A6
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225641.1532189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTcK-0006lZ-OI; Mon, 09 Feb 2026 15:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225641.1532189; Mon, 09 Feb 2026 15:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTcK-0006iS-LA; Mon, 09 Feb 2026 15:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1225641;
 Mon, 09 Feb 2026 15:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpTcJ-0006iM-Gl
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:56:03 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d26b1d8e-05cf-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 16:55:58 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH8PR03MB8299.namprd03.prod.outlook.com (2603:10b6:610:2b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 9 Feb
 2026 15:55:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 15:55:55 +0000
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
X-Inumbo-ID: d26b1d8e-05cf-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBznJWuB3bZr3MC8jsZtGvwAmvXIsFcyYYYEIIqlLxgiHoXdN79Tf0BV8nJPh4TvPGLk0KD8MHB9SZcePfTpu9sFV3qCfoaFE36LysLCygwPICzrhnEFenEN5e2FC/vrGL/TDp2BL1Q6VQDEYS/cWZls9vJlvYDi94q+VBH5Kd8L77bQ+bzaeVuKLh5K2KwPaiBZyT5XKntNCOfgZVbUglVrhXcYvrQvMRg3XnCy6crAuL5o2mKIrHnynVtSRkQ4/wO2BX6uv34G93y+h318kUQ06hG7h4A+9WFzmuEYfRKtSNM4cFrItPWLV5ibCNZQBNnANJBTEM/CR0zDJVegOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUmUtqrFJl+6Lblsrb1Y7o/JDSK7vz8OWMK0YmbnBGo=;
 b=DXR1Rk3loJPjsqvBHUbBdeX/w+iKtnzLzAkmZpdTSR56hYS1Nbpr1YZEegr2dW5THAX5iu+IQYwdi82tY8LMI5qP6cocUFvYUe7QMOGbwFHdNFDp4VdYg6H781jj9PjbegCQbiezBtnVhGZDZdLzQRNTIEGduAasPBUDovX/KFxbq/nuuPDrGxeE6xmwY3b2GrYZmMGsk2AXtcAhYuDsTm5LIzNx45S/LejgjJXa1jRpwxGSh913wHG9W33qg1oqly1cR4wbYIRN2cl9/Qpx2nf+UEKc1U5EwLIISF7zRUULgZxIz0FY+ZfS4ZdWUJw8lu7B3BfmbC44ZQHALOf2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUmUtqrFJl+6Lblsrb1Y7o/JDSK7vz8OWMK0YmbnBGo=;
 b=pVmPFg5JynuJkHyZNp8FWo7DNjEI8OhLJglfo5uSU0rhUZI4RnYpeMnNymyhepyOseeHMBt6mI5AXg9tLm/ujmKWAAtk70kXeU+1Y0FfjaAS7vCAxgYdlhQeJCUcp2OCzSGq/30K1wpYIPRfDYY3RBgT0HSPFaTG1QNanvRoJSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 16:55:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
Message-ID: <aYoDiDiJ4rRLxhmw@Mac.lan>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan>
 <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
X-ClientProxiedBy: MA2P292CA0016.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::14)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH8PR03MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c644381-f4e0-41d2-7205-08de67f3b548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clAzdTNqLy9QN2dvNEY5ZEc5ZlFTZFZmSmJGZFhOQmo2OCtwM3pkMXkrdUw5?=
 =?utf-8?B?NnRGQzBvbTlkaXQ4anVCQStDTm1yejVPZEZXdHpjdnpzSGt6UWxPS3ptY0Rz?=
 =?utf-8?B?UTR5MGd1MkdQQVh2SUVVeE1ibXNTVjR0ck1yUFVObzBVS2RvbUJsb1gxZVRp?=
 =?utf-8?B?UHVCbWg5bmxIT01UQnA4dGY0dmwzVVdkZ2RsRk9sMFNNRHBEOTUrU0xqODdn?=
 =?utf-8?B?TEdGeWRjQjkrRUpUdGlpci9zS3VJS0xKSkg0cjJEOXVqNTZLalF2cXZUWEEz?=
 =?utf-8?B?Y3U4NmZzdC9pbEtJWnBNMmhYMnhxdzZxM053OU0yUEtoVmxsMERSTXd6eWhh?=
 =?utf-8?B?a25veDh2ekZpejlQMnBnYzBXSFlMTVVZcyt2NCtTUjI3Q3ZRcGZnTmJXUjEz?=
 =?utf-8?B?bDRqQzJtclpkTHkvbnV5WnU0dEVCajRXejkzdHBMOEY3d0pmeTRPKy9oaFNw?=
 =?utf-8?B?RmVjUmJjRDhjaDJJcTFtR3F3Z2ZQSVIwOTJkYUkvdSsxTml2NTVIUHZmOFNB?=
 =?utf-8?B?dzZtSVYxNmFKUGQ4RnlZaG9xTDNmTWo0NFhuUFI4S1hhcVUzRjBGaXNTZnFZ?=
 =?utf-8?B?bFVkWHRRK1ZmYkQrOURUaFdQTGc1UHc1SmVwQVpnUE5MOUE5TDZOR2xzMStv?=
 =?utf-8?B?SXNYamxKODZmOExrRVU4SWJhQWNmdmRtRlNRZFY2TGVNdmxXbTVUS0dTTTNB?=
 =?utf-8?B?ekRZOCt6aDJtWnhNRkpWUzNyaXJwUDdQNjIrOEdQcVJPdTdrb1NUbXNaVFNH?=
 =?utf-8?B?d2dLeEJVZC9BeWNYNTlGZCsxZXF6RVViU1ZLbytyNWJBbVJtTE9WKyt6Zk0w?=
 =?utf-8?B?MlV3SnpUMHJ4OUtaZDlZMnZndjRycHBuelZrcHdZcmswNGRaMVNxelNGSmQ1?=
 =?utf-8?B?c25ZNHU3NFliOXVjcTc2anBvcXNLVDdUd3E2NkN6SUFvQ3lOUnM3QmZhQXUv?=
 =?utf-8?B?SW1jaWRNWlZxZVZBK3k5K2pPWnd2YmJYL1N5azdhVzg0aGw5cjEzd2loN05Y?=
 =?utf-8?B?ejJ1ajM1ajZCejNESW8wTmZ3VGRpTFJzdUVUOVc1Rmhxek5BeDg1ckttRFVE?=
 =?utf-8?B?amtuRnJaOHNWR2dtVVZoR2tHTWhCanBsMWVya1BvQzlMZUN0dTVyT3NhbTd6?=
 =?utf-8?B?S28zZXhzUEtxaG5rdFJ2b0tMMUhWM2FmSzZrckE1SDVkb2cxTFVlQ3A2bStj?=
 =?utf-8?B?bDY5UFFCWTBneUZLbE04S09YQVYzRmRCNE43ZGdib0lNTHAvdWY2VGRyMDBB?=
 =?utf-8?B?cS8yWWZaQzdBU0grRFRYVUJSK3h4Nkx4ajZUbDNHR1AzbEY0NGlKOEs1cHJD?=
 =?utf-8?B?RGx2Uk5kWGdNT3NEOTVkcnhMNWNqRnUwYXNPRURBdnZoZVBrRFFOWmhBV3po?=
 =?utf-8?B?bjVIellUNms3eDBvM0VycWd1UDZIOWxvWkxkcm5oaFN2VFhLd2p6RkZyOTNm?=
 =?utf-8?B?aUlEeVhxOVIrWmoveWs0ZHlJTTVOcm1tNkRhVVh3akcwWUxRckxKTEk5azRp?=
 =?utf-8?B?c2pSRXlUc1ZaYnJIeE9USnNDR05sYzRoRCswRHF5bUdvQ0JRMUhGMnVEeDVK?=
 =?utf-8?B?ajZEZDRIdlkzaW1ENklPRGZxVjBzc0JRd0tFWEdza0tqWjZLcGNyaUxPN3pF?=
 =?utf-8?B?NEdtU0NUK3NxL3g2VDEwYWxwY1ZRR0tXUXhYUjZWMmt0R3VjNFFzRnJhTmpY?=
 =?utf-8?B?WGJRcW5GdWlCUVhYZ2FMMmFHU3JDMHNVWGdZL3hyNk14ZVFqMGpIcHRNMDBN?=
 =?utf-8?B?OGFaRzJFdWJNWE5yTHRmYlBUZTNHY3RReU5PVTB1RllPZVdvTnd3WkJ0Znpk?=
 =?utf-8?B?MjVoYVN2c1Y0NzhVcUloRldTRmlQKzA1a2JOVDFPYTduVEk5bHlCLzlTMDFL?=
 =?utf-8?B?Qk9kRGoyVzhBR2FiNnRTV3QrdWlvYVc0OUNqL0ROOEk0czJoN0VZUSs4c2Zs?=
 =?utf-8?B?UFRzTU5RclBWNXMwY2pkNlJ4dy9VZURSa0JIWlkrcVVrcXFXakRvak9CRnBa?=
 =?utf-8?B?TGJhY3d0ckN3MDZRbHZNaEdkNDZjVmFoODZtTzJsUFJTc0hUcVNvQnpuNHhq?=
 =?utf-8?B?U1ltZTJpMjY2V1lqcGVrNlR4YVY1dWlrNHJEb2tDWmlwT3hzNEk0STBIN0FM?=
 =?utf-8?Q?DlGs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTVmNmtEQjh2b1BiQXJFc1BxUk1ySHoxeHZuTHFZN1pEeFh6Q2ZBK2lLL0pN?=
 =?utf-8?B?YUR2R3BPRXpvNjYxbGZBVFhjditHQTMvbDdWQmpoNTVxbGh5aWV2U00zK3BK?=
 =?utf-8?B?cTJZL3RjdVBBT0orRjBNSFJ6dkNidnhJaDBleDg1OWkxMXlRZXhQNzM3REZD?=
 =?utf-8?B?aXd2TC9XRFI2SGwrQUx6czB6ekx2SG1BT3QxaEdHcFJsbXlmdGFOblFBWGxG?=
 =?utf-8?B?dVc5aFpQK1ovMUhtUWRaaUMralJ5ZmpIR1JVZm9hQVFVaHZkTWxhaDE0VEpL?=
 =?utf-8?B?bHRyaENwOUdrRkpDV1RSZVRVaVZSaWJVOTlNUllVUXdoZjV0WXN3OEtwNGFw?=
 =?utf-8?B?WFF3VGZEcm5mSG9iOTNzM3JackplK0NSazlBbXVJNGhpWXB0ZmdEcDlJTEpM?=
 =?utf-8?B?bnltaS82YXJETytDa2xQOVNmemp2VFVSdnlQbG83NkJoQ3VrT3hqY29jcWo4?=
 =?utf-8?B?aktMajFjY3VKaCthemlteHNQYU1YdkxsRjFocFNzM01XQUFXd2t3VjQ3RWpF?=
 =?utf-8?B?UTNrangyb1VqendrRkJNOVlKVGpGNWZBNWJ0M2lLOWI2bjhoMTE3VGczRk1i?=
 =?utf-8?B?TW5pZy93d2FlL3NncU9zMkUxcHdubVRzT1RJMWw5WTZIR1BxTVVWYUpRRGdj?=
 =?utf-8?B?NWhaYVJheEZvZFFrTTZ1cnlaOVJsVFhzMzB1UHRLY2VPandhVXJmbHFqQTky?=
 =?utf-8?B?Ukp4K2VuR1FEOW1VRllKRnA4Qm5BMHBnUnFYbFplTzRKUHRQcFZWeHNRZGVs?=
 =?utf-8?B?RkxPRWw5Z2ZxS3VOR3piSFRzdDBoZk9KRWNFMHhhYzJ0a1JYUlRjTUlMZitH?=
 =?utf-8?B?ZHdXUEtmcHd5NnJWc1dmeDdYMjdMTUVWN0RpTm8zREVONjZyM1ZOcVgyQjQ1?=
 =?utf-8?B?ZWh2VW1BUnZISXdycnVNKzVndlREYk9MeHdNZ1pVTzdocnlDODN5TnNwSC9U?=
 =?utf-8?B?a0FZMmlydXNjcTlzTDVLalViZDQrN21DNzJndGgzZCs0R2lRTDVDMzZYR0hZ?=
 =?utf-8?B?NzFXKzZ3S3ZJTnhrMjVSRUxWUXgxZlpiaS83T0Y3TDFKVzkxV0Q0ZHovUG1l?=
 =?utf-8?B?YmtjWXpXVCtyRElhdThmWnNBWTg5a0Zzb21iMXFjL1ZiOTlGUHlta25uaEw4?=
 =?utf-8?B?cnYrMHM4ajUvUTYrRHBQMWVlb2hqUVBhVkYweTJ1UCtKajgrelhVcVJtVC8z?=
 =?utf-8?B?U3ZGd0t1VFpyZTdVb2hzRGt6Q3B4OWxQOVg4U2VGSjJGSm9JWFNFT3Z6N0l2?=
 =?utf-8?B?em1Za1JxZmdzZkJ1U1hxb09KZ1FMNkNCL1ZvTHRGZTJrL0pEaldGSkhURXVT?=
 =?utf-8?B?YjN1MGZjeE1lcWZMdmhIUS90WHhFQTdXUGo0U25NTm9zZzJYV0RMQmhBVXVu?=
 =?utf-8?B?eFF1cWZENlpTTklWa091aiswRXhkd291UXVqdDBjU2dSbEllNEpPaHBEV0tC?=
 =?utf-8?B?VDJacVdNRHNYRFNETGFkNEpxRnllMWYvS1JFWUxjQ0svTURvamc4TFJYOFlz?=
 =?utf-8?B?ait3TkFjWVZScXZvSmd3ZWMrZks0V25zbzVrMHRURGNET2dxeUIvdnMvS3pE?=
 =?utf-8?B?b3pCTFE2RDJ4TUVRQjZXQ2pJL0hPTlJqYlRGb1FodHpIYVMxT0c1Nm9OeUtV?=
 =?utf-8?B?azNHOWxwbmNjTnlDTHlrS0FmcmwxUDRSTGE0NUp2eHQ3U2RWOWN3ZUQ5V2tM?=
 =?utf-8?B?Tm9Nb0V4WXBzQTkrZG9HMWdxaW5yNEFhN1RtUlN2QXVidmE3RHQ2d3I3VTNS?=
 =?utf-8?B?b0t1bGVxZWVIVDkxZ3lJbEhpZ1lYVWt4RS9KUlF1K1UwbXlrUW9WWTRCUGVF?=
 =?utf-8?B?ZTRubVJKcGdTRTAxcUdlayswTVd4d2EweXhtNW5YRVZMWEsraUtCcjQ5VzFt?=
 =?utf-8?B?VkRJUTdBTXMzYzhkRkZldFhrMWZXSEF0SHZwQUxMZDNYbTBFWjlwTlB3K3pa?=
 =?utf-8?B?eEF6YmJSK0xjK1Zhbkk4QUt3UkJhVjVldTVsTlRPdzc5SzRDOVhKc2RSZlVV?=
 =?utf-8?B?eXdNejh0a3NzbzM4S2JZS29BSFJzM3Z1NURqaEkwTE0wNjlBblhqQU5hWmM0?=
 =?utf-8?B?amU3SXljRk43RDRlTnJ2RE85VFJYcFBLY05pRmlJSDhZTE9QM0Jha09NSG5v?=
 =?utf-8?B?ZzNCUnJwRmlYekdaTGVFWGJvTC9yV3FCMDZDWnZWTzNkSUZxWW9Fb0ZOOGxP?=
 =?utf-8?B?NkhlTlJIeWpjM0dndi91Mm16U2VkZlUweElsZGNOQ0ZkbDNXK1FsQ29KR3hv?=
 =?utf-8?B?ZjI4THVpUUlaWnpPN09PV2JNTU5GY3pYWTlTY2VubEZqTzRVaHFldDBDM2dP?=
 =?utf-8?B?aDBtUG81UXdzS1FGWWhlOGFNUVR3YnkxNW1IOUYxcmxSYWlvVVhvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c644381-f4e0-41d2-7205-08de67f3b548
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:55:55.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iX12jkt2lcL90StL+iLRgjHcGjRQKGelXaE1b7YWJlDDBtGswurO3+g7ywO+FCF6w3FtErgnW7ONL4aEHNH1wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:tim@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 859C11123A6
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monné wrote:
> > On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
> >> It only has 2 callers, both of which can be conditionally removed.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >> I'd be ok conditionalising the else branch on...
> >> 
> >>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
> >> 
> >> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
> >> 
> >> ... to avoid the danger of stale pointers, with required changes elsewhere so
> >> none.c is only compiled out in that case.
> >> 
> >> I'm not sure how much it matters seeing how they are all unreachable.
> >> ---
> >>  xen/arch/x86/mm/Makefile        |  2 +-
> >>  xen/arch/x86/mm/paging.c        |  4 +-
> >>  xen/arch/x86/mm/shadow/Makefile |  4 --
> >>  xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
> >>  4 files changed, 3 insertions(+), 84 deletions(-)
> >>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
> >> 
> >> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> >> index 960f6e8409..066c4caff3 100644
> >> --- a/xen/arch/x86/mm/Makefile
> >> +++ b/xen/arch/x86/mm/Makefile
> >> @@ -1,4 +1,4 @@
> >> -obj-y += shadow/
> >> +obj-$(CONFIG_SHADOW_PAGING) += shadow/
> >>  obj-$(CONFIG_HVM) += hap/
> >>  
> >>  obj-$(CONFIG_ALTP2M) += altp2m.o
> >> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> >> index 2396f81ad5..5f70254cec 100644
> >> --- a/xen/arch/x86/mm/paging.c
> >> +++ b/xen/arch/x86/mm/paging.c
> >> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
> >>       */
> >>      if ( hap_enabled(d) )
> >>          hap_domain_init(d);
> >> -    else
> >> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >>          rc = shadow_domain_init(d);
> >
> > If you want to go this route you will need to set rc = -EOPNOTSUPP;
> > prior to the `if ... else if` on the HVM case.
> 
> Maybe this instead
> 
>     else
>         rc = IS_ENABLED(PV) ? shadow_domain_init(d) : -EOPNOTSUPP;

But even for the PV case we cannot call shadow_domain_init() if shadow
is compiled out?  I think you want:

    if ( hap_enabled(d) )
        hap_domain_init(d);
    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
        rc = shadow_domain_init(d);
    else
        rc = is_hvm_domain(d) ? -EOPNOTSUPP : 0;

> And gate none.c on PV && !SHADOW_PAGING, which seems to be the only use.
> 
> It's a lot easier to see the safety on the HVM-only case, particularly with...
> 
> > is compiled out, and the toolstack has not specified the HAP flag at
> > domain creation you will end up with a domain that doesn't have the
> > paging operations initialized as paging_domain_init() would return 0
> > with neither HAP nor shadow having been setup.  That's likely to
> > trigger NULL pointer dereferences inside of Xen.
> >
> > Also, seeing the code in arch_sanitise_domain_config() we possibly
> > want to return an error at that point if toolstack attempts to create
> > an HVM guest without HAP enabled, and shadow is build time disabled.
> > I've sent a patch to that end.
> 
> ... this patch you meantion. Thanks.
> 
> I'm guessing it's still a hot potato in for non-shadow PV, which strongly hints
> at our being better off leaving it in that case. On HVM-only configurations it
> seems rather silly.

I'm not sure I follow exactly what you mean.  Some rants below which
might or might not be along the lines of what you suggest.

PV needs shadow for migration.  HVM can use shadow or HAP, and our
default is HAP.  For HVM only builds it could be possible to not
recommend enabling shadow.  Even for deployments where only dom0 is
using PV mode, it does still make sense to possible recommend not
enabling shadow for attack surface reduction.

Thanks, Roger.

