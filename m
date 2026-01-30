Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GwwTAJPHfGn4OgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29106BBD61
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217652.1527060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyn-0008UV-Vx; Fri, 30 Jan 2026 15:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217652.1527060; Fri, 30 Jan 2026 15:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyn-0008Sq-QP; Fri, 30 Jan 2026 15:00:13 +0000
Received: by outflank-mailman (input) for mailman id 1217652;
 Fri, 30 Jan 2026 15:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlpyl-0007Ra-Jw
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 15:00:11 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ee4d43e-fdec-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 16:00:09 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5329.namprd03.prod.outlook.com (2603:10b6:a03:22a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 14:59:46 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:59:46 +0000
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
X-Inumbo-ID: 5ee4d43e-fdec-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvEm3JLwpDDYawbhGhwAk7PDjIPWqL6yMoH+2fY/CWODaOlw8HSHVnVpblB6th7uPo8XpHEAddaypiRg+PhpoyVpQpiy/wX6JnqwU+aEgfqwhcyQVnluA1Kx7ocI9Do78bhAGTfjxVzvIuGWgEDeodynVnC3Wctvufx8UZGLyRmdYEV9L57sOmRH7Czpl/kQsqjkR156vyLtt06st4Q8dPJ3dLq7z4TNWikQqIo5Eyi0+DdQxawMDHbjx//YIZv7Hsf6N9qlOGKDrxhGmUDG0PkE54J/hF2HrYrWzTa3OWP5WFzfJLHiDT/PEJTnIHnz/meqs9I5tN/oBQgBwUCLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4kt3HlIslTe7oWtZiavcZv96YzHLGl9cFCLUCvUUtE=;
 b=R4Qh5CcxLFXBjsoMZk68biKXR/cYqgy34rtYO7CHjgoAGiMgoAl3Q/4hRDjf3JpB5KJzPuo55cNicQfyd7zL+vYlDnbHqnl0f1jiMAoxRcF+00069OeNnEwBE3kohtrtbTZjO0gOtWHWWFdh/4BlujXlI0FogJFWSLw6UepDh9sT21S0vuAd0uBy/Yp4U98UJpoqVOLrlvFZWvkXEjVPIDfjrG7bPPS7nj9gyUzMTKR34mNSqQuuzs5swiHD38U3xPw/gA/fxdj2PSr6nO0CfHvt9i6ZscycNqcb7LDNrBLi4ja+VTVv3IVO5Qc6LdAwwEtpBlZeYLxpjQHgmJGlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4kt3HlIslTe7oWtZiavcZv96YzHLGl9cFCLUCvUUtE=;
 b=DKHi6qvy8uij7AcX4kPjA7Ay2kKXBVG2kdZAfuC9d/r//g+hWZJk3MHorrdSzmcLfgL3DrEtO0iWh1IaGtFU0AevLWKAP9H9YpEQCmvu2E2IKu3D4swJYAVredLu+XJOmO/64M6FNsLXm4kBMTl+kXTHDL3kAC8S3RJkhGqn7k0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 3/4] xen/mm: allow deferred scrub of physmap populate allocated pages
Date: Fri, 30 Jan 2026 15:57:25 +0100
Message-ID: <20260130145726.85907-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130145726.85907-1-roger.pau@citrix.com>
References: <20260130145726.85907-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b8877d-429c-41d6-138a-08de6010353c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0ZqOW5BcTBEWUw5WTRla3NSc3J2eXJBTUdJdHhZaFVXNEM3TWszcFg0UFow?=
 =?utf-8?B?dXNmKzFwRmFGaFBqTmh0aUFIT2Nxblo3MGZFajRKU0lrS2ZTMlRBUnowZ1dh?=
 =?utf-8?B?ekZEWkdOaHpkUjZPL0VsMHhZS09NblZZVTVYT2ZscmJFMWZjZzVlTUNqejNG?=
 =?utf-8?B?NlN6c280WEZmZlVraWFvcGdTdk1xdzdlZXk5VUlZbjd0cStrUW1ZSE5MRkNQ?=
 =?utf-8?B?bFVsV1dTQjFPQzZrY05TR0EzaG42OG9iZjVpOG01Z2xiQitjL1o5N003Y0dT?=
 =?utf-8?B?cTU0VEdaZzEwTU8vaXhaMnY2KzJ1eTVCd3ZUMjFPQk5tRFV5a0dEdnRidTVN?=
 =?utf-8?B?YnJjQmxVa2NJTWFxckhidURoMHpxMkp5aVRmcEhmRmdYM3VGRUttUXFrM2dR?=
 =?utf-8?B?dnl6dHNISEVXUDNkQk1IQm5TUFdLaG1VTGtxRitaR1BPeFIzUjdHTG1iN21j?=
 =?utf-8?B?anZvbEd6NTM5UEVJK3krTUw5TitXWlpzbGoxWU0xSjk4RGhlb0VXN1RyRTFG?=
 =?utf-8?B?c2hUUkYvUVZOczZXdEtTdWlzY1MrdlcrR0RTd0Rlb3ZWdHJzdExzbGZvVDZG?=
 =?utf-8?B?NG4wWXFMR0REc1FRYk5CVjJWMWJYd3Qza0xpV0QrbG40SXQ2L0ZzVXpKTG50?=
 =?utf-8?B?REFLZUE5YXNpb1dZNlVtcElUbzZJdWlGbXhNbUdCM0ZjeFJzRDMvV0dSbTlI?=
 =?utf-8?B?aTZTV0pudjNOczV3U2gwS3N0cE5oaTMvWldMS2VPWkVScXFzS3BvRk9VcU1R?=
 =?utf-8?B?ZnhzMFZCNkV1SGJMYTg3clNYQXhMcTNId1BHZ085bXpYZTNyUldaUzcxcEZB?=
 =?utf-8?B?amgycUJWb25XWGxNdU8rVlN4bDRNUzIwenR6VEtyUlR3a1hNVVJ1Q2Fia0FL?=
 =?utf-8?B?SmJHREYvV2JuYXNLN3pNamZuY2ZTdUhVd3A2VGFtNHYybG8xNkRaRFlDR1pN?=
 =?utf-8?B?RHZScWdUVldlNXpsNmp5Qm5hUEtHR3E4MktTdm9lV0JqL3kwcDZZSTFuTGFp?=
 =?utf-8?B?YWVZUTZJMEViZDdBenVUVWRwcndadWJiWFovSVFqbEFrUVNNb0QraTNlRC9L?=
 =?utf-8?B?UUJ5Qno3dXZYR1NyMzBjcTZuVmFIbnUzemZuUThIQVdDL2VPUktudG9tVDlG?=
 =?utf-8?B?QXZSZmpiR3psbzVHcnZWY0hjQVpOSnQ1UmNxVXZzc3NmMUI0V1B2cm5nNkVE?=
 =?utf-8?B?NVBmSHlHUGplSklBNGVkUzBzMjhUZ3U1ZDlSRWo1NElzdkJyZ3BOQTJSZTJv?=
 =?utf-8?B?RkoraUZzRlJzZEZobmswVUc3YzBGUnMwOS9ualNLRHVaOWw1MDVNNkJtRk5B?=
 =?utf-8?B?Vkd6NlZMNUtFTGtnR3REb0tGQkdXdGdKc0xoMTljUTZUTForWWRnLzlNbDgx?=
 =?utf-8?B?Y051dWZLZjFqSUExRUxhZUFoTkNkQVRmWVNuQTFjTWxhZWxrZXVUM2tEUVlN?=
 =?utf-8?B?M1loUUw1YW9rTWRmUjYybnhYSGdNcmc5V3dPU1FQZC9ibFNxYnBteDI5WGhZ?=
 =?utf-8?B?UVBPMXNEWm9WZnNPWUtkckNHZ2x0SHNSRlFUaEtvMDBHQWdHV09HWXJjVEl2?=
 =?utf-8?B?RTdSWlJCck9LZVRZUlR2ZE5jckt4bHdZODlaQXVOQ01HK1JIYUNZdDFJay94?=
 =?utf-8?B?ZC9tbXdPZkdNWnRDQ0czZlRLdVBVbm40R1RHcU1yeDd6SnJiTXkrTXUvRWJG?=
 =?utf-8?B?cERiWHJOVzBzWk1KMnltMzhtZCs0ZU44MDVSSVF3a0x4VjUwemZjS1grdm5t?=
 =?utf-8?B?MFdWNXdDR0R0bnZsZmJKWGtjNUF1V1Voc3luWExub2hCQ1NzRXg0aUFoWXI0?=
 =?utf-8?B?cGMvQWRXdnJvM0xVbHVaZ3lRdmN2WElMRlZFS3dReSs1UWcyTzF0OHlPdVZ5?=
 =?utf-8?B?MVRVZ21Ba21aTlJndW5saXZodVJnK3JMcWFMQk1tT1pQN0FCZGFnTExWYjJK?=
 =?utf-8?B?QlNKbWcxajQxNmJXVTlieG81UUEyOENLOEhhY0sxYnJDMmpyTW5FZWR6ZGpY?=
 =?utf-8?B?RHBGSTIvQ0crd2NLMGkxY0pramhxYUsram5MK2VIVGg4b0UrYUlLYlB3NHI0?=
 =?utf-8?B?ang3Y1c5MW82M1ZBQ2RIQTJpMjUvVEZBcUtjb3JuY3FaUTVvdm94WU0zQVln?=
 =?utf-8?Q?Lk60=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YytWZEkzRDBudkJEVStMeHJRREt2c05zb2MvQ2hlMkQxQ2xRUmxrODNmRDJ3?=
 =?utf-8?B?alN0S2laUnBadDNnRWlROVkyaGozUnZNRldjTnhiV1RMbktuY1JBTzF2ZHV1?=
 =?utf-8?B?WUxjODNITWw3R0VtNVc0OU54aURNTWM3YTNNRWtpSXZqRUlKamhpb0F2bmdv?=
 =?utf-8?B?Vk9DWDhpRlRkS0ZNWGZFakhlcG5FUFZUSVJETXpreTUwOXk0R2hJc1BQSDJC?=
 =?utf-8?B?TzZjcmxVRFB4dzVUOVJsTW90WlljNURlSVkvWjgvVmZjWjl6V1FsT0wzRVJ3?=
 =?utf-8?B?ZjJuK0ZLZldRT0VDWUhtWjFWK2lrSS96cU5nNmw0UFo5UGZYS1ZkQ2dLeXQx?=
 =?utf-8?B?d25FaFJUeTZaVkpGTVQ0bDQ2YXF4YmV5TnRIZGhWYmlHT05vVGYzQm01Ymdi?=
 =?utf-8?B?K0NpcWdaVjh1UjZBU1phOEI0VHpyQWtrWUY5WHVTQXI4T2gxN1l6eWwwb2RD?=
 =?utf-8?B?SUZ4YkI2d3VmMEJ0T1RzeXV1cnlyNTJZWCtrRENHMXd5MmZEYTdWR1M1M1Q4?=
 =?utf-8?B?U1NpYkVqclBtRUtKV1FOcmduR3Nna3ZVdE80QTF0TWV2bExZZmpPVC95eEFX?=
 =?utf-8?B?eC8zU2dFNDJibGJVM2ltUXhHVUhORXZDRUlVMk00UU4ySVdKZ3NiT0dOKzVI?=
 =?utf-8?B?YXRpdmx1WkNIeHBKTDdkektremhKRkFCbzBsTytYanFBZWJmRUMvMGVxQ0xK?=
 =?utf-8?B?bzFXdnpUaXJVaVpVd0VERmRpci9UM29LMTluSGViVmZMZEFNeU1vNG1tYWJQ?=
 =?utf-8?B?OGdZZUIvdUpudksxVXFTZE9ONGJXNllwYnNCa0JYM0pUSis1OEJKV3Y4OHYx?=
 =?utf-8?B?dGNDSTNFVmlsQ3pYclRneVNha3QxRjg1YTQxN1FkcE10Z3lYN3VmdzYyRGxC?=
 =?utf-8?B?Yk1hemZxMmRKWmJLYXVqNWpTRXR5bGE1bzdOWGdvNHdSbjZGS0oyd2lwN01U?=
 =?utf-8?B?SWptUkJnU2UxT0xyZkg5UVJPZ0FOd3FLeWZDOVVQVm9QNzdDUi9KQWx6ZGV3?=
 =?utf-8?B?UU1QdWhYcHlsV2hvVmo5dXJMd1dPZW1TRFR0SzFMMnZwVHcySFNRM2ZCem8r?=
 =?utf-8?B?WkVqTTltRDErYVZsUFZlZVoyK2pUOEZXS1ZXTTIzMGg4YktFTHV4dUsyeW1V?=
 =?utf-8?B?amVqMGZkbVBkaGJrc1ZJc09WcFZNcU92RXl1QnNrNHY5UFhVUEUrODYya0hH?=
 =?utf-8?B?d1ZJRU1UY1VlQUV1UEdHeTJ2NWN2WW9rejIraWQ0emtMc2MyK2xXVHpDUnVJ?=
 =?utf-8?B?Z2xIUmp4UGVNUk5PdEhwMUJhMk9SSUIyeWJMZzJoTWcyTjlTNzJqek05UkV3?=
 =?utf-8?B?cjFOSHdEaEl3S0dXaDFzZEN6SnFpdysrUlF3cVIrRjhJN2xrRWk5K1NhT0hL?=
 =?utf-8?B?YjhEOW9KODIxOWxjVUFIVFk1MTBER1JJL2ZPZTNCaHl0ZjRzOG1mM2V6eU5T?=
 =?utf-8?B?TlZ6Q2FUQ3lkQXRRb0kxTkc2YWxicFVjcnBZUzR1RGE2ck9POG1ISTM4V2pn?=
 =?utf-8?B?MDR2VU1TT0ZyMWZHSjNTVmtnM0ErTnhyTnR0Q0NwcmxNR0RheCtTYWY3Y0hv?=
 =?utf-8?B?Mkg2d2ZNMzFIN2NNWHE4S0d5Tlo1NXJhZUZnMVN6UFU3RkRPUUpiK3dEUW4z?=
 =?utf-8?B?bVFoMHFOZ05WZFNXeCtBd1c1dDFkSnBrV09NaEFyZFowd3c5TzhrejVrWCsy?=
 =?utf-8?B?d3hlT3FFZ3l4eHFZSzNKZmhpNVNoYmpmcXE5Z3JjSXN6QkFTdXNNZ29EbDdk?=
 =?utf-8?B?aDZNTGFseWQ5ZXF3eFU0NUxkY2pNRW5hYSt0SUpoSVU0UmlLZUIvcVFOQkFl?=
 =?utf-8?B?YktGVWd0VTVxL09tVGJwUlI0WFFZY3FpRzdnVW1ta3ZHT0JqUkZzSE92VTRL?=
 =?utf-8?B?LzN0MXhyMEN6dVF5YTlpTjJIWjBjVkcxaFNEZ2RCYzZlbFdZWnh4NHZ2ZWlr?=
 =?utf-8?B?Z0liSENVWVkvT3RDYjNReGhRREFNMTdQWW9ycFNFTFlTLytjbGJQSTBLaU1Z?=
 =?utf-8?B?Zk9jUjBFdUhjUm5lR3FYSWVvdy9HMzBkWFh6M2hUM3QwWFk5ZUY5MlRUM1U0?=
 =?utf-8?B?YkxFRUNkaDBsWGhFS2tBRDJvQjArcWc3ZTRGdmVWSmFOSlArNFlMckdtNS9o?=
 =?utf-8?B?ZTEyNEU1OFBEa1g2Rnc2S25OSWhJNjdEUGxaMXVwZTgzNWhjdFRzcHRTTWtV?=
 =?utf-8?B?dm1iM0s0RTU4czVLdEJaaWhxQUFNM0d0eDRiWmFhSDFWMWJ6aEVPbElNeWwx?=
 =?utf-8?B?YmViYlhOVEdIUm8xa25NOVNsWEhXdld0MEhPMVBXWXlrK0RGZGtZdnY2c1JG?=
 =?utf-8?B?cURHaUNnSmFTbXNlcUJ0VlBGZTN5NmVpckg2bU9QeGVpWVVPaWQ4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b8877d-429c-41d6-138a-08de6010353c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:59:46.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qewn8ZFA5YbE9kgbFZ1vnef26QGw1SWcDbQCw/+BabJag58lFJPXVrqHcKvZPOvXlDU/Ay8fTBgWCAL8TsX7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5329
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 29106BBD61
X-Rspamd-Action: no action

Physmap population has the need to use pages as big as possible to reduce
p2m shattering.  However that triggers issues when big enough pages are not
yet scrubbed, and so scrubbing must be done at allocation time.  On some
scenarios with added contention the watchdog can trigger:

Watchdog timer detects that CPU55 is stuck!
----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
CPU:    55
RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
[...]
Xen call trace:
   [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
   [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
   [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
   [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
   [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
   [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970

Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
relies on stashing the dirty page in the domain struct temporarily to
preempt to guest context, so the scrubbing can resume when the domain
re-enters the hypercall.  The added deferral mechanism will only be used for
domain construction, and is designed to be used with a single threaded
domain builder.  If the toolstack makes concurrent calls to
XENMEM_populate_physmap for the same target domain it will trash stashed
pages, resulting in slow domain physmap population.

Note a similar issue is present in increase reservation.  However that
hypercall is likely to only be used once the domain is already running and
the known implementations use 4K pages. It will be deal with in a separate
patch using a different approach, that will also take care of the
allocation in populate_physmap() once the domain is running.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - Introduce d->is_dying check in stash_allocation().
 - Move call to domain_pending_scrub_free() to domain_teardown().

Changes since v3:
 - Introduce helper to free stashed pages.
 - Attempt to free stashed pages from domain_unpause_by_systemcontroller()
   also.
 - Free stashed page in get_stashed_allocation() if it doesn't match the
   requested parameters.

Changes since v2:
 - Introduce FREE_DOMHEAP_PAGE{,S}().
 - Remove j local counter.
 - Free page pending scrub in domain_kill() also.
 - Remove BUG_ON().
 - Reorder get_stashed_allocation() flow.
 - s/dirty/unscrubbed/ in a printk message.

Changes since v1:
 - New in this version, different approach than v1.
---
 xen/common/domain.c     |  23 +++++++++
 xen/common/memory.c     | 105 +++++++++++++++++++++++++++++++++++++++-
 xen/common/page_alloc.c |   2 +-
 xen/include/xen/mm.h    |  10 ++++
 xen/include/xen/sched.h |   5 ++
 5 files changed, 143 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 376351b528c9..163f7fc96658 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -615,6 +615,18 @@ static int __init cf_check parse_dom0_param(const char *s)
 }
 custom_param("dom0", parse_dom0_param);
 
+static void domain_pending_scrub_free(struct domain *d)
+{
+    rspin_lock(&d->page_alloc_lock);
+    if ( d->pending_scrub )
+    {
+        FREE_DOMHEAP_PAGES(d->pending_scrub, d->pending_scrub_order);
+        d->pending_scrub_order = 0;
+        d->pending_scrub_index = 0;
+    }
+    rspin_unlock(&d->page_alloc_lock);
+}
+
 /*
  * Release resources held by a domain.  There may or may not be live
  * references to the domain, and it may or may not be fully constructed.
@@ -676,6 +688,7 @@ static int domain_teardown(struct domain *d)
 
         /* Trivial teardown, not long-running enough to need a preemption check. */
         domain_llc_coloring_free(d);
+        domain_pending_scrub_free(d);
 
     PROGRESS(gnttab_mappings):
         rc = gnttab_release_mappings(d);
@@ -719,6 +732,7 @@ static void _domain_destroy(struct domain *d)
 {
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
+    ASSERT(!d->pending_scrub);
 
     XVFREE(d->console);
 
@@ -1678,6 +1692,15 @@ int domain_unpause_by_systemcontroller(struct domain *d)
      */
     if ( new == 0 && !d->creation_finished )
     {
+        if ( d->pending_scrub )
+        {
+            printk(XENLOG_ERR
+                   "%pd: cannot be started with pending unscrubbed pages, destroying\n",
+                   d);
+            domain_crash(d);
+            domain_pending_scrub_free(d);
+            return -EBUSY;
+        }
         d->creation_finished = true;
         arch_domain_creation_finished(d);
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 10becf7c1f4c..285546298ed9 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -159,6 +159,73 @@ static void increase_reservation(struct memop_args *a)
     a->nr_done = i;
 }
 
+/*
+ * Temporary storage for a domain assigned page that's not been fully scrubbed.
+ * Stored pages must be domheap ones.
+ *
+ * The stashed page can be freed at any time by Xen, the caller must pass the
+ * order and NUMA node requirement to the fetch function to ensure the
+ * currently stashed page matches it's requirements.
+ */
+static void stash_allocation(struct domain *d, struct page_info *page,
+                             unsigned int order, unsigned int scrub_index)
+{
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * Drop the passed page in preference for the already stashed one.  This
+     * interface is designed to be used for single-threaded domain creation.
+     */
+    if ( d->pending_scrub || d->is_dying )
+        free_domheap_pages(page, order);
+    else
+    {
+        d->pending_scrub_index = scrub_index;
+        d->pending_scrub_order = order;
+        d->pending_scrub = page;
+    }
+
+    rspin_unlock(&d->page_alloc_lock);
+}
+
+static struct page_info *get_stashed_allocation(struct domain *d,
+                                                unsigned int order,
+                                                nodeid_t node,
+                                                unsigned int *scrub_index)
+{
+    struct page_info *page = NULL;
+
+    rspin_lock(&d->page_alloc_lock);
+
+    /*
+     * If there's a pending page to scrub check if it satisfies the current
+     * request.  If it doesn't free it and return NULL.
+     */
+    if ( d->pending_scrub )
+    {
+        if ( d->pending_scrub_order == order &&
+             (node == NUMA_NO_NODE || node == page_to_nid(d->pending_scrub)) )
+        {
+            page = d->pending_scrub;
+            *scrub_index = d->pending_scrub_index;
+        }
+        else
+            free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
+
+        /*
+         * The caller now owns the page or it has been freed, clear stashed
+         * information.  Prevent concurrent usages of get_stashed_allocation()
+         * from returning the same page to different contexts.
+         */
+        d->pending_scrub_index = 0;
+        d->pending_scrub_order = 0;
+        d->pending_scrub = NULL;
+    }
+
+    rspin_unlock(&d->page_alloc_lock);
+    return page;
+}
+
 static void populate_physmap(struct memop_args *a)
 {
     struct page_info *page;
@@ -275,7 +342,19 @@ static void populate_physmap(struct memop_args *a)
             }
             else
             {
-                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
+                unsigned int scrub_start = 0;
+                unsigned int memflags =
+                    a->memflags | (d->creation_finished ? 0
+                                                        : MEMF_no_scrub);
+                nodeid_t node =
+                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
+                                                    : NUMA_NO_NODE;
+
+                page = get_stashed_allocation(d, a->extent_order, node,
+                                              &scrub_start);
+
+                if ( !page )
+                    page = alloc_domheap_pages(d, a->extent_order, memflags);
 
                 if ( unlikely(!page) )
                 {
@@ -286,6 +365,30 @@ static void populate_physmap(struct memop_args *a)
                     goto out;
                 }
 
+                if ( memflags & MEMF_no_scrub )
+                {
+                    unsigned int dirty_cnt = 0;
+
+                    /* Check if there's anything to scrub. */
+                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
+                    {
+                        if ( !test_and_clear_bit(_PGC_need_scrub,
+                                                 &page[j].count_info) )
+                            continue;
+
+                        scrub_one_page(&page[j], true);
+
+                        if ( (j + 1) != (1U << a->extent_order) &&
+                             !(++dirty_cnt & 0xff) &&
+                             hypercall_preempt_check() )
+                        {
+                            a->preempted = 1;
+                            stash_allocation(d, page, a->extent_order, ++j);
+                            goto out;
+                        }
+                    }
+                }
+
                 if ( unlikely(a->memflags & MEMF_no_tlbflush) )
                 {
                     for ( j = 0; j < (1U << a->extent_order); j++ )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index dcb95309b12a..87ebf5a024dc 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -792,7 +792,7 @@ static void page_list_add_scrub(struct page_info *pg, unsigned int node,
 # define scrub_page_cold clear_page_cold
 #endif
 
-static void scrub_one_page(const struct page_info *pg, bool cold)
+void scrub_one_page(const struct page_info *pg, bool cold)
 {
     void *ptr;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 426362adb2f4..d80bfba6d393 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -145,6 +145,16 @@ unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
 
+/* Free an allocation, and zero the pointer to it. */
+#define FREE_DOMHEAP_PAGES(p, o) do { \
+    void *_ptr_ = (p);                \
+    (p) = NULL;                       \
+    free_domheap_pages(_ptr_, o);     \
+} while ( false )
+#define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
+
+void scrub_one_page(const struct page_info *pg, bool cold);
+
 int online_page(mfn_t mfn, uint32_t *status);
 int offline_page(mfn_t mfn, int broken, uint32_t *status);
 int query_page_offline(mfn_t mfn, uint32_t *status);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 91d6a49daf16..735d5b76b411 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -661,6 +661,11 @@ struct domain
 
     /* Pointer to console settings; NULL for system domains. */
     struct domain_console *console;
+
+    /* Pointer to allocated domheap page that possibly needs scrubbing. */
+    struct page_info *pending_scrub;
+    unsigned int pending_scrub_order;
+    unsigned int pending_scrub_index;
 } __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
-- 
2.51.0


