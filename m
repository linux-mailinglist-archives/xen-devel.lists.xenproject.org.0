Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPMlCWM9mGkWDwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:54:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEE61670E5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237018.1539497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtO97-000718-T8; Fri, 20 Feb 2026 10:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237018.1539497; Fri, 20 Feb 2026 10:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtO97-0006yg-QL; Fri, 20 Feb 2026 10:54:05 +0000
Received: by outflank-mailman (input) for mailman id 1237018;
 Fri, 20 Feb 2026 10:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtO96-0006ya-7M
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:54:04 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 745ca245-0e4a-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 11:54:00 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SN7PR03MB7087.namprd03.prod.outlook.com (2603:10b6:806:357::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 10:53:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:53:53 +0000
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
X-Inumbo-ID: 745ca245-0e4a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2j0hKBMLC9cnMFwrAoE+voi5ZKYtAlV3uIm2wFtNDvQGz8IToW9X1T6azOQfIfJXqbPfSnD07HI7JrcUq/YX+wx5SDR1npIuRgVbmHwpX5QYPbbUoC6tRwWtpV7FR7FR+wJUjozyGh3vEKfZILrX8D3dR1z6B1Uu/VXWelDGB3u59o8NlTdiqGnNk+yuofu6B6iyUbIgWNZoQ95L+ZiVUI7vZD4oFk6LCr5p54SAgqk+0GHQpUA9DVXtKk/WWQ1DwdsR8UZSKKjpdBAHSDQH1mddO1tpdisTGQUp9nVO/No9z2hMXOF3ax1QRw2Q+s4wdlYhc2pLVj9YY2qlW3xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGA3EU2YoP/OZu+W+XIeDBThP+Vgstloo7C80aGydhA=;
 b=WGTQiDimc5ZqDVa6IvBsni5dInwo3+LBPxBnijfXgnFuZuNPifLQeCU3lXIrWOua7LISyP0nZoOoItUbKec2vWNqe/V31EaixP0oMPd2oUf9p7Lq4uhOvnlEpEtkD5gTtCuWb6uwqTkBciuzjbhao6v8fZZmY605lOQCQdLwuvGmpknYtJlf2E6AwaPe+le5mgTE4nfHJTUxZ28kZkTjz1jn2WsbB7ZwO3ndcBzTIxZbOer8iHGJPVhs8XDEDjjmPYiC9BdgUAorRI3IhLgYM32nr8yvrhQ54nk4OFxJN2UDyQYUD+/fpgTHAPyHLTfmw/oUNJ2cyGQRFEXGNwUB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGA3EU2YoP/OZu+W+XIeDBThP+Vgstloo7C80aGydhA=;
 b=kz1dyVaUsF9IIVkLiHFhV4epeKipV5DolwBSpo3JEdJa1zApeH0x/m/VlswayQRMLs7QYQNCrAE9kw8jsWsZcDeR4jGJVqySdhY5kWlnzaxdgFDLaMla5f1GjCx940XL1jX+rF6tIhd+X9mV2GyKec09VOJeI0PbWbIHNqPokIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Feb 2026 11:53:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aZg9PRxR2uxdLj_n@macbook.local>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
 <aZgpRAXefanISluT@macbook.local>
 <b82a2dee-aa37-4b05-b368-60af8c54edf2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b82a2dee-aa37-4b05-b368-60af8c54edf2@suse.com>
X-ClientProxiedBy: MA3P292CA0006.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SN7PR03MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 6194d918-f60e-4b82-7573-08de706e5630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFlVZ0hsSm9ES1F1cE43Q0s1dW92OVlXaUYzWUVVYlJtbVpZdnlZREYvdEJ5?=
 =?utf-8?B?eUc5cXlFUi9WM3dFc3lZRnEwR29zRytZc3VzNm93STRiNFBzVmJUUlB0VFFo?=
 =?utf-8?B?SGl4OUx6cS9WOU85QUJRUXY0SE13WXgzZVZUQVVRY2NnemN5czluODZrWFZT?=
 =?utf-8?B?bTdtek43NzI0ajI2N0Q4aTFUMmJTUXh1NFJpQmJrRUNqNi9YdGhScjJjcmFJ?=
 =?utf-8?B?Z2orZWlwbzlZa0ZmSk9MTWdTNklDbFpvdXpPZi8wdlhEb0V5V0kyQXpyV09P?=
 =?utf-8?B?Y3kxKzMwR1FZbHpRMFI0WEdQMERoM3dJK09xUmF1THBtazlkQ3owd1Zrbkkr?=
 =?utf-8?B?dXJVZmd5QWFmeVdBU3ZyM3hlUms5cnIwUXl5bXVyMHFCbnAyQmRkS0ZIcURZ?=
 =?utf-8?B?Q1d4c1NkZnhuL2dTcUEwZVY4VWt4L09BVklwMWt4cFZScGQ0UTY1SlNublJU?=
 =?utf-8?B?aWxSYXVxMGVRQXZmdEFuNFhiMDhyRkZIdUdEQ2I3blFtNHdxNVM2bkJLTXYw?=
 =?utf-8?B?aFpLWStKa2pQb1N5Sk1acElhSThIY0pHYjhYY25IZm8vK1FjdkN5ZFRVU2Zv?=
 =?utf-8?B?WG1WTW1sZER0N3FZVmV2QjRFbE0zVGNnZHZ4U3JXUktvY2p5L0lpQjAyUWNa?=
 =?utf-8?B?UEc0ZzJjNlNjT00xd2t1T3V0Q1h3ay9OejJpZVg5WkhlS1VPYm5UeERtRmd6?=
 =?utf-8?B?SE4vNnN5SFplWENFQm9zWDZkRVdsQUhlUXAxcGQ1NlIzUDJkUCtsalRuR2dQ?=
 =?utf-8?B?cUdsVkJjd29heU1JeHM3c21xREh0M0Nma0NCTUxBY1VHanRnTmNSV1B3Yis3?=
 =?utf-8?B?L002UFhXclI0anRzbmtxR3BjQnZhUithbHFCYm5qdkpVQkZpNjlsVGZtbXFx?=
 =?utf-8?B?TkZpSnkzUkhRZXZXWlZEck1FSFA0czk1K0NUbTRGRkJ3NElJby9LZjdoazdw?=
 =?utf-8?B?cWdkMDRtL0p0dDZwanlQNm84ZkdzNmYycUExdFVnNFZrNTlJWUhTY1hJRnBz?=
 =?utf-8?B?QVhUNE1hanMrVlkvRTJqc1FlMTRmOWQvb1dicSsxSWlqc0s5aHh3aWJ4bi9p?=
 =?utf-8?B?VTZIUXJWRXlSV2ZSQ2xxcXhROE9oQ2tvTjVsY25IcC90TERwOFpkaS8yNkw4?=
 =?utf-8?B?d0duZ1ROMXlDcXhxVkYyOFpzZ0Z4eDFrSkk0TVVhSmlQeUFqMFRHcldOdUpM?=
 =?utf-8?B?TkNpS0Y5aFNnMVBnWnJKTzNLZElHb1JZSHpJRmt3Y0JEdzE0ZFpUbGdwdGR2?=
 =?utf-8?B?VDNjNVZKellwSFVVMWg4THg0S0lRMVRiRkszNzRGUktxNmxUUXVDL013U1Yr?=
 =?utf-8?B?U3B1aVZFcXFHVnljYTdMeGw0ZkVWTXVCS0k3c3VKWkVqN2xQRHFKYk9nZ2xX?=
 =?utf-8?B?azRLU05zN255OVhKclBPcnV1WUF1MHlacGhKLzhYRDhQR2ozUWovSWdjZXJQ?=
 =?utf-8?B?Zzc2Z1hYbWxNTklLOUtKczMvUEprelNoaml1N0h2MEhORDFGT3hwUTJQdnZy?=
 =?utf-8?B?UkFZdGJLemo1eGlBbWdPOTZTUmxiV0tJMENHVHZwVFFaYVVORzdaeklpaWZ3?=
 =?utf-8?B?bVhjVFQ4Y0xrckRnNDJLalBPUEQ5NHVqZkQwTnJrNEJCVis1Tnd1VG1tUyta?=
 =?utf-8?B?YlVlTGJKREh5VWc1YXdMS0RkRTdzN3JTSWFDd25heUhxcVZtY2t2MUtWeEth?=
 =?utf-8?B?QWlmMjJ5d3I4TlBBYzBockhnbU5BbmdEKzBqU3dQNHRMbytVYy9GSGZleXpF?=
 =?utf-8?B?UDU3MkJKdWdIQkVQN2JVMGxSV0FtS2RTSUlialpnQ2NxbVo5cG5rLzgwUXJV?=
 =?utf-8?B?YTFQWUc5cklyaFdTR1dSaXlnTG44NTNGWllLWjBQakNoeGEzNkw4a3kvVENa?=
 =?utf-8?B?TkIzMmp3UTNmWHUydWpHZFAwVTJjUUJHOUM2UVlYQy96T0FDUzVtdFYra3Az?=
 =?utf-8?B?ZU5FNy9NWFNxN3Bsb3NKaThQdEtzSURSN0RBV3BoVzMxTkRCOEhZVGMybm5B?=
 =?utf-8?B?d2ZramVLandkeS80aUZIRS9VZnN0czVpUEp6Ri9OdVNhZzJOZ3dMeHJUVUo4?=
 =?utf-8?B?akNKMDNBaFlhSC90VmNNRlZiS1p5RlRPRDl6b01VelgzNzJTNkQxa2k3eVd4?=
 =?utf-8?Q?0iLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0FRbHp6Mml4OGRUNUZNMDd1STgybDZQKy9lcWhwbE5lMUNvZmx5QVVpUDRS?=
 =?utf-8?B?QXVCK2FKQ1ZVTzhrSHF2ZE5LRXY4QythQSs5QVlRZmVUMldQRTZWWkRXdDdT?=
 =?utf-8?B?MUlRdHpMMlE0QU5tanhWNjJEWHBzak1nTlk2MmpyM0RYVjZUc09IOUdFTHRZ?=
 =?utf-8?B?bzBhSDMrRHd6NmtnLzg3MEdFZXY4QmhWbXNjUDJsQXVmdHRSUE5hVXF6b3Nz?=
 =?utf-8?B?c3NJeHdLdDEycjFneCtaZHk1YTV1UkdEcFB6Y0dwUU84UmFJemlOWTI5RitG?=
 =?utf-8?B?dHNMR3k2VzRoM3d6Tm5sTHZlQUtwZEtJYnRLb2plZG1SR1JSRmlpNzlrWk1Y?=
 =?utf-8?B?bWNDNi9vTU5MSDB2RnkwQWk3eE84ZWYxTXMyaHN5SkdhRnBxOWdEdWFLUHdo?=
 =?utf-8?B?K1JDalIvWmhzTFZlSEtYVHl5ZUoxbWhTRGlHNk1ESE9qS3Rocm9wbnl3NEI1?=
 =?utf-8?B?YTRIeUcrMjZ6aHhtUkRMeDIrYWVOcjBUVnVSTUNEQW45ZVFuMTRZdjBHaWEy?=
 =?utf-8?B?SmJzUm1EVVlkckVqdUFtSVFLRmdCUHJRajQ3dldQZGdSSFRYS3RoS1VoYjQr?=
 =?utf-8?B?UURFN0ttQXpRa1hoenFKN0txd1dwWm5rTm9QQTlmOU91NkoyVDQrUmk4cXU4?=
 =?utf-8?B?bmp6MWk0UUQra1NSS0hsZUVFMjRuVWhsYXowRnBLemFBQU1BQnRWVCtJWGtQ?=
 =?utf-8?B?ZGVKaG1xYlpSTkt5MjVUMEdSUEpHU3dXbC9taXU2YUdMamZhZUpQMDZLNW16?=
 =?utf-8?B?OCtzVnJ0U1JKclZKVUxLSGRLbWFSNHZhbkNYRUV3bEJIdWJodEhQU0R6SE85?=
 =?utf-8?B?b3kyTjRXRzJVekI2M2t5cUEvblUwdzRSV2grOVdNZUpGRmk4UlgvRzZsSEVz?=
 =?utf-8?B?aUZRYURpZCtCK1Jnb0E1M1B3YkJPdXdEYmU4ZXp6TlAvUjVtZHlBNGk5d2hi?=
 =?utf-8?B?bnZhZzRGbWc5ejF5Z0xwUktaZ3R4UDVwejFPcEpFcTFRR1g0M0x3UGF1cCt1?=
 =?utf-8?B?WWJheGs2QzJFaUZIazlXUDRoQTExZ1IyS2k4RXlEZFp0ZUVYRlBDcjJnZTly?=
 =?utf-8?B?QmU2Wk1IMHJ1YkRybmhjckFQQ3l3Mi9FNjdpY2cyb1ZDU21NalVNMmlQNzJJ?=
 =?utf-8?B?Q2U2Z25Za0h1MjQ4VTVHMit2NlpIVDZKWUJWa3lUTEZreXJoRkFyMkY1Umcy?=
 =?utf-8?B?Y1hBYXhKdkNJU202WmZ1a3pucFBKTjAwb2JhaVBzN2p3cFJ3QXc5K0MzeXIy?=
 =?utf-8?B?T292ZHIyWTVwZ0ZNazdHSFIwd3poWFlRU0xpd09OZ0tXeWxvdDVmYWQyTlYr?=
 =?utf-8?B?NmtURUwwTVJyVXlpYWsweFRtaGxnNitaS0J5Mkw0UjZwYmNubiticjBHSDhl?=
 =?utf-8?B?QkFIY0NzLzBIZ3B4S0o3Q3N6alJiWHdUNzBJT2Y2T1VwdUhPcXZ5bGUyTG5q?=
 =?utf-8?B?THpaaDNkSjcwV2tVQ1ZwVytRVVQ2WmVOanlreEk3SXp1bjQweWFscGt4RW1o?=
 =?utf-8?B?MVg3bXNVRWFqN3pvRTJobkZFUFpwSzllYUEyWUJkbnowL0pjSGRMWFNsV1d1?=
 =?utf-8?B?cUIwaGZUQlNqTkJFaFR5elExRnkzOTFJeWFGS2o3Q3hjMEJOOVZNQmVoYnBa?=
 =?utf-8?B?Njlqc3JHRzlKdU9IMTdFN2dzV3V4SnkyVlRtOHBxOHBtdHpwOTZZKzFiVVA1?=
 =?utf-8?B?RzUwL0NodzdvYnJrUG1sTzJ3RER1VFlqRlluM3EyWGp2NjBEVThQVVhIQWo0?=
 =?utf-8?B?QUlxWXkzNTFyUVhpZi9PKzJRbTE5U1Nma3NPK0svdnNNZS92bUgzOHg3SW9E?=
 =?utf-8?B?Nk4wbC9ncWdEYzYvRFA2SHovSjdlbnZKNW5Mb2txak42ZnJ1aWVXbGl3SUs1?=
 =?utf-8?B?d09yNmlxN1Z6SjgwOFRNZjg0V2U3UnVRTU9PNTQzZVRXcWFJVTZqYkt1bE9p?=
 =?utf-8?B?ZU1jUjN3eU91WHM0QlJ5MUJhTHF5WmNqeHJ4MU44M1lwSGJxbXhKb0VMRWYz?=
 =?utf-8?B?cmpmbnRHRDhjb0RleCtpRUNJRHcrbmErQmxlcmV2ZmxiTTVTZlpoenlWR2V2?=
 =?utf-8?B?ak9vWmEzRWszKzNQd0llRzhZS0k4RUd1SkNhUVB2RlRiRm16TzVQUGErSWdJ?=
 =?utf-8?B?Z1hkR2c5NTR0bU9RVFlZM2VvNThtbUpwckJWKzZQSElYWjRoVjR3L0h5elFz?=
 =?utf-8?B?NGphMGo4cFRsbFBzL2lxWXNKS3pEdkxITENlS0lHTzJjVUh3UHlLcTNPSEV1?=
 =?utf-8?B?ZS9PeVZZS1FxbnNBTVVRbmgyeTRSNS9FMmFEOExWRHZsRlZqV0F6SFA2ZUdz?=
 =?utf-8?B?QkpoeTRRYmFkR3p1TkRCTkRkWXJEdnJhTVZJTi9WRWp5bjlXN2JHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6194d918-f60e-4b82-7573-08de706e5630
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:53:53.1023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imcStf0YJsfjMiI7MGu9Q6hD83MKTHTxDOWUglywP1fQgFV4b7bo2OTY1ipLsSnnqP7tUXbccjg1jCoUJJEfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5DEE61670E5
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 11:20:52AM +0100, Jan Beulich wrote:
> On 20.02.2026 10:28, Roger Pau Monné wrote:
> > On Tue, Feb 10, 2026 at 11:55:34AM +0100, Jan Beulich wrote:
> >> When Dom0 informs us about MMCFG usability, this may change whether
> >> extended capabilities are available (accessible) for devices. Zap what
> >> might be on record, and re-initialize things.
> >>
> >> No synchronization is added for the case where devices may already be in
> >> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> >> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> vpci_reinit_ext_capabilities()'es return value isn't checked, as it
> >> doesn't feel quite right to fail the hypercall because of this. At the
> >> same time it also doesn't feel quite right to have the function return
> >> "void". Thoughts?
> > 
> > For the non hardwware domain case we could deassign the device from
> > the domain?
> 
> Will need to check. De-assigning is generally done only from domctl context,
> I think. I'm also uncertain what other things may break (in Xen or the
> toolstacks) if we take away a device in such a pretty much uncontrolled way.
> 
> > And print a warning message for both cases.
> 
> Can do, albeit I'm unsure what "both" refers to - I see only ...

Oh, I mean print a warning message for both the hardware domain and
the domU case.

> >> --- a/xen/arch/x86/physdev.c
> >> +++ b/xen/arch/x86/physdev.c
> >> @@ -8,6 +8,8 @@
> >>  #include <xen/guest_access.h>
> >>  #include <xen/iocap.h>
> >>  #include <xen/serial.h>
> >> +#include <xen/vpci.h>
> >> +
> >>  #include <asm/current.h>
> >>  #include <asm/io_apic.h>
> >>  #include <asm/msi.h>
> >> @@ -169,7 +171,10 @@ int cf_check physdev_check_pci_extcfg(st
> >>  
> >>      ASSERT(pdev->seg == info->segment);
> >>      if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
> >> +    {
> >>          pci_check_extcfg(pdev);
> >> +        vpci_reinit_ext_capabilities(pdev);
> >> +    }
> 
> ... this.
> 
> >> @@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
> >>      }
> >>  }
> >>  
> >> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
> >> +{
> >> +    if ( !pdev->vpci )
> >> +        return 0;
> >> +
> >> +    vpci_cleanup_capabilities(pdev, true);
> >> +
> >> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> >> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> >> +        ASSERT_UNREACHABLE();
> >> +
> >> +    return vpci_init_capabilities(pdev, true);
> > 
> > I wonder here, in the context here, where the device is already
> > assigned to a domain you likely need to take the vPCI lock to safely
> > perform (parts of?) the cleanup and reinit.  Otherwise you could free
> > capability data while it's being accessed by the handlers.
> 
> The lock isn't recursive, so I fear we'd deadlock if it was taken here.

Yeah, that's why I've put the "parts of" remark above, some of those
functions already take the lock themselves.

> Furthermore this falls into "DomU support needs dealing with"; right
> now we assume Dom0 tells us about its final MCFG verdict ahead of
> putting devices in use. Once we need to consider devices already in
> use, I think we would further need to pause the owning domain. Also ...

Agreed.  So that this is clear, you might add an ASSERT() that the
device is not assigned to a non-hardware domain when this reinit
happens?

> > The only current extended capability (reBAR) doesn't have any internal
> > state to free on cleanup, so it's all safe.  But a cleanup like the
> > MSI(-X) ones would be racy, as they free the structure without holding
> > the vPCI lock.  I think we need to be careful, and possibly adjust the
> > cleanup functions so they can tolerate cleanup with possible
> > concurrent accesses.
> 
> ... to cover such. (For something like MSI(-X) it might then further be
> necessary to mask/disable interrupts, but hopefully we'll never have to
> deal with extended capabilities that would require this.)

Indeed.  Something like MSI-X would be extra fun to deal with, but
sooner or later we will need to handle it if we ever plan to support
hot-unplug from domUs.

In fact, the current cleanup_msi{,x}() helpers should already remove any
interrupt bindings and free any mapped pIRQs, otherwise we rely on
the PVH hardware domain having cleaned up the device properly before it
being assigned to another domain?  (Not that you need to do it here,
just realized from your comment)

Thanks, Roger

