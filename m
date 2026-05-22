Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCBYFQcuEGrIUgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:20:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76F5B1F31
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316557.1585931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQMzJ-0002aI-T5; Fri, 22 May 2026 10:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316557.1585931; Fri, 22 May 2026 10:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQMzJ-0002YG-QN; Fri, 22 May 2026 10:20:17 +0000
Received: by outflank-mailman (input) for mailman id 1316557;
 Fri, 22 May 2026 10:20:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQMzI-0002YA-DM
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:20:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQMzH-0061aW-KM
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:20:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a102dd4-2eae-0a2a0a5409dd-0a2a4506d84a-40
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:20:15 +0200
Received: from [52.101.62.13]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a102ddb-7371-0a2a45060019-34653e0de39b-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:20:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6614.namprd03.prod.outlook.com (2603:10b6:a03:38a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:20:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:20:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRvZuymOzuizy3NKMJTmhNsG/XXIOW4vxOjfVVBdeLYAacUgWjEsdVMbFQJBCeB/zQLpXsrzC7tq3lU7TLpKNRAKJ1GtaJA8eTAD201Hrj6176KXtOS+hENGsUPRZvuOxqEsMNokCNe5A3qIPbDWruIACGZrOH8UjAlFug9hajth+bkUqAbDZAUZz/qjOJjXrLt7G6o9evB1E/tHDDAYr5ujPXN0ykPiAsL6TKJOB0P8eTW4TvYhEm8syqR4XO4T/eDnRBQiLRj8NQXABpsvQm8tGnTkCLkuFaglgtwQ2fY3tn51R5sVYrF7rUQSVU8fptzbY63VVR6aTUnDyH3uJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4Z5ZTTDJlRsvZDCAMq4Vzo1JTnNk3MS3KO2phOkyiw=;
 b=EaxzAHeyX5SrgJT9MhbGULeua+dgjqaLbOI3QnsVxBBZQL568kZpVDc0fQX/SLiHFKlTZGjw5FRSz4je0PbmANGQ/SdmL48fOQBQuUAOUpB3FEZ7dCFKWvOaGusG2KRcKlykyyLV4kcR//VFe+tfRr4wDNUrVwihLbUNrSmpYzHjdE+ey6VWgsQw65MhRh9X4CqSCO97xSGSsmyusXA3xyyLi8vpUFALjNvWxvF2owa//aomhMXO33sNSqVe7JlMJ8FEkliqoFH+3s5wF0mGjkyA+FzhsVjAYOVIzBZDPA5RDVZ/BTn8SA/RpNAprmWQas6kcn9yiAAL9w3Ek4CCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4Z5ZTTDJlRsvZDCAMq4Vzo1JTnNk3MS3KO2phOkyiw=;
 b=zmbrR4ubE3Fqc87nK+sS/gsq6dlwTRS6EK/04lDIWKZgl3K6qs43Hfvadx9LZd1fcsLPETd6D79ii6bI/dkUUT2m736l56EIig2V0Yg6bAAK/H4msXE45XqgbOBkCNNdIQfuEJLKZmMW5TWRGuXZZKffsIXp+OLu3Ybfc65jXUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <00d987d3-6a9c-440e-beb8-6587a3fd1d9b@citrix.com>
Date: Fri, 22 May 2026 11:20:02 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] automation: edit rules for analyze jobs
To: Victor Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org
References: <20260520225820.31550-1-victorm.lira@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20260520225820.31550-1-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0433.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ef9f1a-42d5-42e0-d6cf-08deb7ebb16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	12rZNECHG/NRedEb5KR+dzJLakVlTjzC8DY1vcN4Ur6PySSXcYMNXj4s6bDcjny7PVfbmErPmarb59EKRRtTT/4Fp3cEBS5fX7cSM3PAb0b3avlt64J/5yr4ufno9oaFF2wXostZ2OhZgebw1hzP8L2kle623NoIgkmSJixQEXCa04OoqRtfEM7zE/31dL3OlK60KHzoGGpbbceBkdBv0CTY49KtbjDJ1oDdj1FHwyZqc3jcIMhNI1bJL7ufx/DH7oEGwW7rpUYRe08WX/6BzBSh+D82C/10FaYJ8JT/7SjCYwM2C1teyFhPKlm9pVUYTbjegLCKPUQe+dhwWlkfjZYhJxfaVbsrY8DtKUn5x5l6i1rqCYYtbYi6Tr7ZGXwrfUe3TWa6OPM6D/5AshUzGUaLRFh4g0L4V9Z4Qrkkz5p7Tb7Ir+kwemm8i/hmLmOr98zfL5HNxprGhynp4ELcng1UX/Y6620Ohggwl+P34RbcVpn6EoGxkd4c01mioPrgCDeTIubwSLxe4FEFc/yJ82++2e/IeD9+oCV4xtx7T7dWquFxnhEqqfLbayDHFvru0Yp72GtCe5D7YIqe/iagBI10k/xaYmt80xE8JTWtmjPoNa6Y+j9l2XWPSXkAuH/pud5e0V97+qPCJugciS4bbjBlUHgAesBpBexeK0IW1erFRDMaLdqQFWzliJLP6RqAYYPn0r744pRszRDXVIWHDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHN5SEh2WUl6OW1YK01iZVFYZ25TV002NTRtNXF5VWlveFRkeDMyL3dCT2VU?=
 =?utf-8?B?WVZrUlo2MVNrNldoWS8rOWxaV1EydUV3QVRMaFhpeERmRSs4cXZmcjlaL1lW?=
 =?utf-8?B?aGs2Q2srTGVjWklkcllYSTlqUUUrYzZpUkFBNU5zS01kUUo1QXF4Vkp3VVdh?=
 =?utf-8?B?Vmd5VDNlbzQwQlUyK1EyeFNxUjdRajdmdzR5UzRUL1IvM0pOelVUK1V3dDk4?=
 =?utf-8?B?dlUyV2srWURRM3lyNUx6RVhCUGM4R3FmUUxURGNJenRndW5mbEM1bFFLcDV2?=
 =?utf-8?B?ekg3dWJpYWcrMG0rVnozdVRoVXNUcTcxdlhRZWw5THdtWWRkNnV1a0M0dkNk?=
 =?utf-8?B?REY1bGU5MzE4cElqY2VUdlg3Ny9UUW4vV1FPN0lQU2Z2aFZvRStTSXRBVzRp?=
 =?utf-8?B?dVFYZjQvWlpucUNqVW5raEplUCtOMk9jcHQ0QWRnNHR3YVRCeTlGN2plUVhS?=
 =?utf-8?B?dDZLRWFRUGpKNTF5UTdaSEVWTkoza2VReUZEL2RCVHo3NzRJQzdkNU5lTGVP?=
 =?utf-8?B?U2h5RGthYnNCSnpVSFFtT1VBaDM3ZEFyL0tLeklMcU1HZE5oWEdqZ0hxSkFX?=
 =?utf-8?B?U0UyWXNTM3N6b3BjMkVWYjhXTVNXYXJ0ZkFUbW1yVVowL0MvVjVEanJ4aHZ3?=
 =?utf-8?B?NTdaRkc3R2prajNsYy9zeXpUWFgxQ0ord3YzWGlQMWgyZDdGREphaGlxb2pr?=
 =?utf-8?B?a2ZlOTJuT0JkT2ttUFNuLytPNTBScFdZMlFWSkhrc1dBcjNEWmFLUkVvMVFU?=
 =?utf-8?B?aDNxL2doYnVyS2xnZks5bVVHNkViQXNHdVFieHJIZ0dPL1B1L3lpUjMxQXBB?=
 =?utf-8?B?TkRxN3VjZlJSWU8wMWx5dU1aQlVRN0hXWmVlKzVtczkyaWI5Qy95d0Y4Z3M4?=
 =?utf-8?B?T1lFSE4vWFRORnNKVTgydlJFWWJrNDl2amR0LzlCemFZalFSaHNibUlSaGhO?=
 =?utf-8?B?V0RTQ1BTS1dqeUVuQzB5dytMR3dIdlgyZ2R1Z2hPWGUzU1lUTlRMMHhXRHdQ?=
 =?utf-8?B?eGRpOVdnTUtCaGxaeW5teTNsTnpJNnZzMTFMeXpMVURmbW5lR0N4K2l3MDhQ?=
 =?utf-8?B?SXBtckMxaDV5UTRpM1d3SzdvbEc3SDNaN2dCL2p2bmhJVUpYSC9IOXowVk1H?=
 =?utf-8?B?MUdrQlZwaGpSS2xWWGExRFRkYmVOTkpLbWd5SmNsTndMaEVOZ2RxR25MMWJn?=
 =?utf-8?B?YysyVkJzQmdCb1V4SUNmamVNanRBQTQrSE0xMVNoOVc0aWFSMU9FUnAzOEIz?=
 =?utf-8?B?cGF4TG5YZk5MOHFCSVRsdkxQZTVkNDJyYjdHMGlVR1pBWEVpVGEvZGx3dHYr?=
 =?utf-8?B?WVJPYXh1MW1qMHQxS3R6K3ZlNGRoaFRMTnJ1ZGhUK3pEN3VaRFRRS0I3N0gz?=
 =?utf-8?B?VXRxbGptRVZKcnZ0OUhReFJrMTZjeHJWSEIreGpqeVdOT21jVmhzOVVhUFln?=
 =?utf-8?B?aDNoQWhmOVcvd2N3NkVubTJwR1hQUjdKajRIUG9DV29hZTZhRDAwWEFoWDd1?=
 =?utf-8?B?VVRDNExvWVRLUlFIR3lwTXlUNmRHL3FjREVhb2lmb1llRllBdWxEOVdRa1F5?=
 =?utf-8?B?NlZNVTg3cmpObWRkbkU3QTg2WElrVUdQUjJ2WGVyT1ZxdUtudVVXY3RIVVd0?=
 =?utf-8?B?V0VjRHdOTTNGcThiWnBmSjBvR21mMUQ4VDRRNm4yNFZjTlpiTkJaekJuemJG?=
 =?utf-8?B?Tm5kanYzS2V3NGVhOTZVYVNnTnNONjB1OEhrZkJ3cllhOElNT1ZtdUczWnBw?=
 =?utf-8?B?ZDgxSDFTTG5qRVBPUTgyT1IzdmIrb2FjVmdDRGcrQUxBOGVCVk1PL1BtVjR3?=
 =?utf-8?B?bmVxY3VJVnlRUnBWakJzcVB6aDJZWXZGYW9PRzdTV2FBTnpteFpYUzQ0WmJW?=
 =?utf-8?B?bWlwdVphVEdRblF6azRCRnFWdW1MekRMKytIQ0g3ZkQ0bEdWTUtqWnJXOWM4?=
 =?utf-8?B?bDVSY2xPWjM3Q1pKcGhWZ21LeSszWTNnUVMrOHV4azFtQ1NXcFNMckNSNEwz?=
 =?utf-8?B?d1FLQUlNRnZjZjRVcHk2aGQ2WVBJNVRWZ3dsWmJaVEw5UGE4UG5ZVXQya3BL?=
 =?utf-8?B?d0FRZkZObUpUZVNQdktiVmYvQXMvRjBTb2xYNkFocCs3eXZweVZ0OTRnRmJH?=
 =?utf-8?B?SFBQMTJCY0VVcFNFVWVEeFZkUUN5ZmZPdHl0OTNMck1JaXA1Vkt0NGhyL0Qx?=
 =?utf-8?B?TnlPU2RjZys1czhNUzI5T21sNUluR1ptK3QxNjROVWRJekxBY0FDdHlBYkx2?=
 =?utf-8?B?UWl0TlNzRTNJSCtKdTZlS2xsbXp3TWQxamkwNFhIUm5wUHozU3hFbWNqM1lz?=
 =?utf-8?B?UkgycU9vaE1uNVJxL2dJRzNxMllLWmxrNEY0bGJXR1JYQUJIdDVFMnFPTTFM?=
 =?utf-8?Q?//VMHVDKiGcLNaGU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ef9f1a-42d5-42e0-d6cf-08deb7ebb16c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:20:05.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8hEYU8klWBTV6x0e6GJXmuhWwVHrbtlNiu2J58WYW1W8t4T+7VxpxMK5y8uhbE0DcLJqEdrLjJAjyjLq0DCvdm35tTKTXlhVuuqWoBjB0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6614
X-purgate-ID: tlsNG-16d1c6/1779445213-8DF81D75-6F34DDF9/0/0
X-purgate-type: clean
X-purgate-size: 1835
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[amd.com:server fail,lists.xenproject.org:server fail,gitlab.com:server fail,citrix.com:server fail];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:victorm.lira@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AA76F5B1F31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 11:58 pm, Victor Lira wrote:
> rewrite analyze jobs rules to simplify the conditions under which the
> jobs appear and run
>
> after these changes:
>  - to appear, all jobs must be selected (SELECTED_JOBS_ONLY), have token
>    (WTOKEN), and be in an allowed path (CI_PROJECT_PATH), this is specified in
>    .eclair-analysis
>  - the subcategories have their own exceptions, keeping current behavior:
>    - ECLAIR_SAFETY/ECLAIR_TESTING can force enable some
>    - eclair-testing jobs will not appear outside xen-project/people
>
> This assumes we don't use pipeline sources other than push/api/schedule.
>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> this preseves the current behavior of the -testing jobs running anywhere on
> xen-project/people but maybe we want to limit it to whoever is doing the
> testing, or in some other way
>
> tested on my own repo xen-project/people/victormlira/xen
>
> push https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541858231
> push /eclair-x86_64-amd$|alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541859057
> push /alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541859605
> schedule https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541871689
> schedule /eclair-x86_64-amd$|alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541875599
> schudule /alpine-3.18-gcc$/ https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2541876512

I'm afraid this still doesn't work.

I pushed with ci.variable=SELECTED_JOBS_ONLY="/eclair-x86_64-allcode/"
and still got the eclair-*-amd jobs started.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2545988798

~Andrew

