Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ofOUHp8tj2nTLgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:56:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13B136C32
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231036.1536378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtep-0006GK-0p; Fri, 13 Feb 2026 13:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231036.1536378; Fri, 13 Feb 2026 13:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqteo-0006DT-Tk; Fri, 13 Feb 2026 13:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1231036;
 Fri, 13 Feb 2026 13:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqten-0005zi-N1
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:56:29 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caebc967-08e3-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 14:56:28 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6673.namprd03.prod.outlook.com (2603:10b6:a03:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:56:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 13:56:21 +0000
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
X-Inumbo-ID: caebc967-08e3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHIWsDaNeDO6k3LzfU5B2LXndzwwoLs3xhqCFxb9r2NUEm+vqLPfreyKP7aih3ZPLYSC+2wM2pR/JxRXdoBzBC/iO9qIUzcb1NYNg/iRw+bWHSVCe6AMq+QpeUNb2Uxcy+LVqPwElH1n209L5ti9FJkgDGkrGhstqhToMpYLuNAkcN65McgMFKOo0ZEw5OHiLP1daeu9e/iH0VHoGq54rUOw5nZTZSznFyylK2AQYW8f9ZoVWfNCRTlT3wC6czcXTEhVqlCcNLrU6W3/sANpmrri9zGxpNDP4VeyDBp9+Vm3vKHyXnvnQSlpqZyHOLuqbaiENVUTf1WemXRJFYSsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOeq7193SlRPvCKtblBZpMGYEgs2rVdelCsSnZJPcyw=;
 b=C9IVR982FKIRH1l6RXS0PbXMOceuEssFNo1vrwTTTRrYYt31tUHi2CJBV1KUSxlVcCcs8rfPxgMzda6w9P+l+uRAkzcO5UJ9pbasx3HLsyzKiGtQA1X06Np23v44TM6GXiFjc+eQ9Pt4qdMxAYDQnWf+Z2JNFOSFRVuwZmBFVX9qKVkqe6RJm+9nslBh3qY5rBhiRkqg+lwnyS9NJLK3acXO9UKkiFkrtJc1NS2tQJWc4urotNmlKTzbbf9e5crqghUu+7/kEo/FIYmxrViwQ3waGzlAu0kiSbGRgXJp4sR6qRfowVRbHDvK9T9DkqvjDMTRXVxnRMrwwab1ZQAmyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOeq7193SlRPvCKtblBZpMGYEgs2rVdelCsSnZJPcyw=;
 b=cvFslca8FZNsEgramlhfn3DmoEpfTXtYiiifJZWDBkxrwCky0aKYHl0OvnaFcLq81cUPSUm0Lxv+QOvV2LOk6IWtPdqy91DD7SYBTtqP+2aqXh2H7JmGoRpTZCC/KU3B5L033EgfD9oS4PC5xlJ+AY/DO9zAWENIEa/TYDrIWY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] xen/x86: fix usage of [[:blank:]] with BSD grep
Date: Fri, 13 Feb 2026 14:56:13 +0100
Message-ID: <20260213135614.25842-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260213135614.25842-1-roger.pau@citrix.com>
References: <20260213135614.25842-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0073.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5b813f-c012-4057-89b5-08de6b07ab4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkdBOW5mckRSa21vMDdObDMzL245dkFhbUMzM01ESXdRc2I2YUU1QldRN0JQ?=
 =?utf-8?B?TEg2YlBjcm9JK3FJcjRtTnBiNGlZYmhzMGlkN0MzWERoamZTZzZRcTFZc05x?=
 =?utf-8?B?dmxVT2JDdXNiMndxS2FETWtoL0F5c1pBTHBXRERzRVVjUENoakpZc3pPeURK?=
 =?utf-8?B?VTlJZ2Nidy9FQ0JyVDJ1ajJySFplWU5tRVFLcjgwbmhIbkh4bm9tWW9ZdVA3?=
 =?utf-8?B?Zy9Ga2daaEljTThQeDJqRW96cDNpa2VMWXBVbDRVSnJmSjd5cHdqTjZrODB2?=
 =?utf-8?B?RFJ5R0gyOXFpdng0Sm5PWFI0WkN3RmRhWnZjb2JwK1B0Mm1CQnJIVUdxN3JY?=
 =?utf-8?B?eEJRK2VsRU5IU2hmWUdvakZmNVVranl3SitxZlYyRys4WEIyN1VQc05EdTFZ?=
 =?utf-8?B?MjZCNFM0NkhFUk5PdlRmZzM0bFBMOUZ4SWpLV3FMeUMzanVLcFZ2dUxOekZQ?=
 =?utf-8?B?c2Q5TVhJVFJNN0V2bHloQzZISmFFbVBWSE0wTUtwSnQ4YU5QeWRxNDBJVXV5?=
 =?utf-8?B?WXVhZEpKbXFBSVpLMDAvckJzbzQrNWQ5dlNnRXZrWTRkVWtJTWlqVTVlb2hS?=
 =?utf-8?B?REwzYzJmSFhyNzlRcnNQcDh2OFRlVzFmQVF2NngxSXpid25RY2JkckxFMDJY?=
 =?utf-8?B?clM0TWw3VXdTZWt3MlZ6ellBem5uR0wyamhhcERUbXFzanlkenJ5MTJrdkE4?=
 =?utf-8?B?MzVIZWx0ZDdHYTVYN3c5bFJnbDFJUXkybnNNZHpUbW8rS1c5MmlKbFQ5UWRN?=
 =?utf-8?B?ZWo0ZWMvWE51UjdRWlhOOXVTbkpkZWZhYlR4SUNxWHBzQUdsTUdzdUtTNDNz?=
 =?utf-8?B?ZExiL2tlT1NYN1lQdWg3QjFnMTFhK3k5NlgrMFpseUFLVlR1NXdwVmQzNUc4?=
 =?utf-8?B?RHJJc0VBM21qMjNtRDZKSkNsRTJkbGphRWhCQTdUcm1IWTJnN0w1ekRsUENj?=
 =?utf-8?B?WmgrakFNc1RNbTRxV3VYMWVIdnp1aTM1ZDJaU1ltQUVEck1WOVR3NEJ2R0Fi?=
 =?utf-8?B?WHpubER4bGpkT1RBa2srL1d1VE1qOHF5UDk0NmZOZlpDNkk2eThjOERMMGFr?=
 =?utf-8?B?TUxhWG10akYvQ3VHa3pva3QxMkI1ajVWeVlHb0tKZEhDZzFXcnhUZUk4RXdx?=
 =?utf-8?B?bTJNRHFJUHhuWCtRQ3laVnI5ZVE3TFJidGowTGlQRFF0Mk5iM0NwZVFGZnJV?=
 =?utf-8?B?NC93eXg2c0FZdVVlOUVkR1NjY3BRRXFBTUJ0ZWtIM2E5d2dsVnVlNVNwc2Ew?=
 =?utf-8?B?ZXN4WkxsMVE4QkxGTVN5cDNCM0RZTys3TXA2Uzh0SU9PZEpYT3JtK1lNTXh1?=
 =?utf-8?B?NDBkUjdMSTIyajVPaXFsSW55ODdBVFhJZkw5RmlFck5sTm12dG5MK0VKQ2pm?=
 =?utf-8?B?bmIxeDBLeVdoZkNmaE5jVytVcjgvQ04rWE92dzJPZlBHc2N1MERnL2hrdXZG?=
 =?utf-8?B?NTNmQkpJZVFpdDNHdUdZdFYvelZhVlo2a2RUd3l6RVMrUFdmL3BLbHNtQk1U?=
 =?utf-8?B?Y1NRbC8wZkQ1WFBUdUFTOVMrUUxkQ056UGxLN2N0Y2VpcUNMTkRPS0w1MDgv?=
 =?utf-8?B?VnlQZGxnK0R3Uk9HWGVlRGs3ek03Y3c5cUY2eXM3REcxdFZ0ZHFJVUREWkh3?=
 =?utf-8?B?b3UraExXTEg3cnhyUTdrVVZmUmdySWN4MDUvdmQ4NnY3V1pUZFJ2dTdrc2sr?=
 =?utf-8?B?RVBzMjMrSUVzTHF2QWFERFlVNVVxNEFqOWF4SzNucFBzajdMckFsdllhNkVo?=
 =?utf-8?B?VjBQSklXa2RBdnFSc0c0MEJaTm5VZGl0QUdIWjdOaGttVjN6UU13MmprUktR?=
 =?utf-8?B?Mmw5UGxmQk0rOEZHZW92Y04vblhQRk5pR1U5RlVZcFIxSEZ3cXF2MGF1YWRE?=
 =?utf-8?B?WkhPeTJRSnVhSFdBKzQ4M1I4eUd5ZWFTQUJURHV1U0ZTY2F2MW9BNDU0WXJ6?=
 =?utf-8?B?aEEvV1habENzakNiOHQvd0NnUmx0KzhEOXA0Q1NCbVBwcTgyclBEK2dWZ3Fz?=
 =?utf-8?B?NnV5ZGJ2SXphTEtWK0pyOVpQMkNtZ2lGTFJLZ1ZPYkt5Ky9GdmxSc0JvZ0dJ?=
 =?utf-8?B?N0NQUUlDdGZNU042MFkrZG9KSmZpWFpLRldmOHd2VmFwM3BlTWZFRyt6UWU2?=
 =?utf-8?Q?T7M0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJHeDBJSEMyREVMSzBtZVpTbjc3Q1cyYnU2eklWR0FaRU5MZFZMdTNrNjZJ?=
 =?utf-8?B?bVJUSmczTWRTeGtONldtekwwQXA0V050TmJCL2RlSXlveG1xbHNrYytSRjAv?=
 =?utf-8?B?WEthREI4Q0NqVTZWbUpZT2Y3N1l2aHVvMmk3UWRDc0V3YzhXU0N3d2Z0SWFz?=
 =?utf-8?B?QWVjTjkyaHhBMkoxek5Rc2JNMU5iWW5ZbGk4cS82M1hRWDRqT3NnRUNjdmlW?=
 =?utf-8?B?NFg1eHF4RGMydU0zQUlGUUdkd2pwNUt2aUR2Q0plZFdRZkVDNHJDYWlUaDdw?=
 =?utf-8?B?TEEwWTV3czRPa01GVzFtcGg4L2QwREpTTjhHaEViYVAwWUJROUQ4S2dGR1Nv?=
 =?utf-8?B?ZDNJc1hEVjFkcFV4SEhZOVRYNktWc1pjeEpSUFpKRUVUbXRFWE5YYk9zMTNr?=
 =?utf-8?B?aFNUZHlUN2tXSFo1dU0vTm1OUS9zSk02aUpJS3EvMSthalhGaGVOUERaelUy?=
 =?utf-8?B?Y09sQUl5aXhYZ3R3SGtCSUJNd3pvOHZneENUVXlyenVuUzdyUjN2OTdVdk1X?=
 =?utf-8?B?RzBEVHh3c0tuT1N4bitvWEFMSHJSak1admU4bkVpR0tENlFMV3Q1dmI0cWUy?=
 =?utf-8?B?ZEtCYnhHMEd0Nnh5cTFnZVQreVl1cW9Cc0xvdmMyRk5yTXJIS2RvT1FaMHc4?=
 =?utf-8?B?Tnhla3NtdUNqaVRBaVBtUmJuNXVEaXJDQWhQWGpXSnUxTjNzeHJWTzZTU2l1?=
 =?utf-8?B?cEREdnhaanB5Mm1IRVhnSnpqT2x2N01zYmpzL1FmVTQ3RnE4Y2ZPZS85T3Vr?=
 =?utf-8?B?M21NNHU1bzVJUU9JU0FZL1pud00yWDNEZEgzV0FHNXhQeGtPWnkyVGRTWjFV?=
 =?utf-8?B?UzljRVZuQ05qVGdIVHUxRHBkeE45WGNuaVVXTy9UdXZ0L1B1VHF4ajF1TWVn?=
 =?utf-8?B?cU5VVm8zbndDQ2REeXFCN1RPYTJCcHQyVnh0V3Nub1E2Vm13T01qUVhyY012?=
 =?utf-8?B?dW9OVDJwQmRZTlVZZDNrZjc3dFRBSFBMbDlUQ3NiUzE1Mm03K28rSVFEZFJT?=
 =?utf-8?B?WUxOdk1nTGpEemZIYzk1dzRUMlJrcWwxaGNjNDBMTHM1U1J0MlVuZEQ1V1Fr?=
 =?utf-8?B?dHBqdE8zQVo2a1g1NnVNS2NualJaL2UyOEdoYzlZNmI5U3IvdWh6ZUZHS2pX?=
 =?utf-8?B?T1R3ejI4ckpMNlc1NWRCL2hwQ01xWVp3cTFUcDRmaThqT3RIYytoZmUzZWNo?=
 =?utf-8?B?ZkplNVJ1dXZWdXFNTXJuZjFPc24rOHlPVEp1c0h5TlNaNTE1bmlNS0VjdVRq?=
 =?utf-8?B?T2dtYnZjTjVLczBrdHZveFlqeDRZYVp2MEhPbjV5OWIvdmcvYk5XZXRxb0lj?=
 =?utf-8?B?M0VYd2VoTE4rZlREUm42b001T2NMcmRyZVRMTEcyUEZGdmthRnQrT3B6Z2Zo?=
 =?utf-8?B?bU9HNXZQK2Z4MTNhYzF5YzlFdmJXRTUxZUFnZFE1Uk1aVnA1eTU0dHdCYlVv?=
 =?utf-8?B?ZUFwcVZXRzN1K3c1Tk90SUorMC9JTmk0ZkloRXNRL2c3MHk1b1BxTFJmZVJJ?=
 =?utf-8?B?eDZDUjNEVkc4NEFTcWI5OVNQaHcxZDIxV3lrMDVCRGpJbno1QWIySnNaTkp2?=
 =?utf-8?B?SkN6NExpdzRYMGc1TEZUWlJ6Nm43S1lWUkxKaGZFdmEyYXpacjZEcmdPeUFh?=
 =?utf-8?B?NUZuMTNKSldlbDlRQy9MWjE3WmprVWR0UDd0VTVidUJnUEMwQXpWSFN5STRM?=
 =?utf-8?B?Nmw2M3NWUDZWQU5VTkx3UFBuNTdVMHhEOTNiQ0NUSGpOVDFVVTl1R2g4c2Nn?=
 =?utf-8?B?bzN4MkRiRzhuSC9ibEE0ZHRtS2ZvMnB2UFR5Z2x5RXVDKzJJbmxHY3J4ek4x?=
 =?utf-8?B?d3B1M1hzRU9mbFhyVjROUXRBTS9QUkhCM2ZZR1BDcVdselVOYTFKWEk2MVFw?=
 =?utf-8?B?VjJaYTJtNTZuQ3pGMm9lb1hRaElHVSs4Yzl1MGVSUVdtbmovYXpoc21Mek9Q?=
 =?utf-8?B?aERjYWpobW14d1ZmY0ZJckdkWG94Ui9jWjcrOEtibnNURWl3V3c1MG5QTXZ1?=
 =?utf-8?B?cTF5U3hiTTVMZ3hMTDY5V3pPNEpBWkY1QWhHK2RJVi9Gbzd1c3prNk1KaFZr?=
 =?utf-8?B?UVVQR0ZVU2ZyVXBWaktUK1VjeTg0c1pzZkxIZWE1MVJWUUdEMHhuN2x5ZnBZ?=
 =?utf-8?B?MWFtZ2VsMnZFWHd5U0ZMemJUSFlHMk55VkhWQ3NEVFkwc2tISWlpOWRmZUFr?=
 =?utf-8?B?UTRiUitVTTRTZ1ZNQWpOYm1tQldwRUw1bi9OeGpjbWZWM09XTUgzeTRFUWJ2?=
 =?utf-8?B?c1pEcGhtdXNEOFVXSzdzOGx5V2RqTXYxR1FLSURLeE9qWVAzdnRMV1ZCa3ps?=
 =?utf-8?B?aklCeGRpeDNtU1lUT3F3N2JRZVlZMFIrMS9OT2JjWm1BMVlaRjJCUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5b813f-c012-4057-89b5-08de6b07ab4f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:56:21.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oziaya+TFby1CkxRpKbwBQVT7VXgL38+fqNVfl2FCp12yQYz16xAl1buVsKsIm8NqA9xVY6TPkLaoFrwM64Iog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DC13B136C32
X-Rspamd-Action: no action

BSD grep only recognizes [[:blank:]] as a valid expression when using
extended (modern) regular expressions.  Pass -E to the grep call used in
efi-nr-fixups.

Additionally, the return from `wc -l` is space padded on BSD, and hence
the content of efi-nr-fixups is "       2", not plain "2".  Strip the
spaces in the Makefile using $(strip ...).

Fixes: 1be65ec4c8bc ('x86/EFI: avoid use of GNU ld's --disable-reloc-section when possible')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/arch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 2e06ae2582dc..37fe65bc13cb 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -100,7 +100,7 @@ endif
 ifeq ($(XEN_BUILD_PE),y)
 
 # Check if the linker produces fixups in PE by default
-efi-nr-fixups := $(shell LC_ALL=C $(OBJDUMP) -p $(efi-check).efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+efi-nr-fixups := $(strip $(shell LC_ALL=C $(OBJDUMP) -p $(efi-check).efi | grep -E '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l))
 
 ifeq ($(efi-nr-fixups),2)
 MKRELOC := :
-- 
2.51.0


