Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WUbjB5PHfGn5OgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB49BBD60
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217651.1527049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyk-0008EM-Mp; Fri, 30 Jan 2026 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217651.1527049; Fri, 30 Jan 2026 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyk-0008C3-JB; Fri, 30 Jan 2026 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 1217651;
 Fri, 30 Jan 2026 15:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlpyi-0007Ra-L0
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 15:00:08 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d520cf2-fdec-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 16:00:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5329.namprd03.prod.outlook.com (2603:10b6:a03:22a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 14:59:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:59:43 +0000
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
X-Inumbo-ID: 5d520cf2-fdec-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NF/3fEv+aVjvTJoXckOAxyfGjJkjZX2ITJYKcBrxjgAr1O3NRMBNzE328vUjN5LpNur3IS68a4wgBgnm12YUkUyv3z6GigQ9xBbYkxLjBiklS8rympkdHI+00YY0mgZGfFtKxlFL4WQh0nEi1MMSRuI4rtxa7PiqrGP7qd95mB5yKZhXIhvf9cBZdcYItSx5a4BeriB/NmxpXplCDCoCaK0gt+80+BK6YRXadjXwA4ONoAFiNlCc38aWIKBnJ1L9o8+cfugpkC+WYKv/ypC28pXAT/LGlx4GIqV1+OJR9TuhPytfR+aA3MgVBpfF66a1z89qXJ/ozGb654FaKOq8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLyvniffw+rJL9gj6KU+iB92xXBhLAscEsULPJ7TSQ4=;
 b=xbI4kFUaggKllKIyXWG6SwFAJrtSJGTuxehiRde3dAj7n8du6ELBsxrYOKGTsZPkXO9Svh1BJZbUbxSvNLTRfQ3rWhU4o8Cqk36CZvlnyCv6RsALxP1odixXYxcbIwaIv7DJitG+4v/pqR0PUgz57tO9x+NxcqggwUKKnhJwfDZ16Kxmcqb5L0Qew0bFoVwt2M6okLbH9S6F1c0zq/PxL6xfu7NYe+fb2Mng32DiKd3B178qauUqadFvoSz1uzudq376Mbuu9HdjiIEh2m/987dfGNpXXIB0PnaX1kli4AjalAAtYOYY5lxddI59CDkwyW0oUqQa3ghb+tzGdqAlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLyvniffw+rJL9gj6KU+iB92xXBhLAscEsULPJ7TSQ4=;
 b=Z2YyCx8y7mT3baAizvouWWwx3bCJXEqW58w0DuvW4juo9rGc3HxOR8YqlKcl2UplFkVD/cVJgNF9mt9Qxx2KM2HOjbYOaD2IN2v4kEMzUAz5mlI6TFlHREBMnzD7pWJwk7x9IejE9Kr4ZtzP2Fu6eDSbu0+t9mgPQq7qXZDZGAI=
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
Subject: [PATCH v5 2/4] xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
Date: Fri, 30 Jan 2026 15:57:24 +0100
Message-ID: <20260130145726.85907-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130145726.85907-1-roger.pau@citrix.com>
References: <20260130145726.85907-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: a14699a6-f19e-439f-a615-08de60103338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVN3dXNDcm56WmRTOFZlSDZ0QjNkc3JzaVBqYVN3M01RMTN2SDVSZUIwcFJC?=
 =?utf-8?B?bk5tb3RBZDVLTHlIYTRNS2I5bVBmc2FnTC9jbDZITDZ4RlFqWklmS2RpbkIr?=
 =?utf-8?B?UkFBTEFsdHh4VVRtaTJhWnNacHpVSEwxbGhPVE9hUXc1aEJNSERoVkdnUWU0?=
 =?utf-8?B?NkoxQzBlM2p3TjR3UEpOMEhVRG1uNDJnSHgwdXUzRGpFMVE5eVR3aU5KbU5v?=
 =?utf-8?B?eWNzTlBDOHAxMmRUdTdzT1dGUWZIam9yQjJRSStUa2U2b2VRKzhLa0MraUpG?=
 =?utf-8?B?dVhiaXlVMW8wZTBSMTlnTkxzcmJzb081Z002YzlMZ0FoaUNza0ZVc080Z0JV?=
 =?utf-8?B?L3ozeGs5OFdSVGxCU3p4cTJzVnNsQlo0RHJFTFVSbHpWR1RZeit5VWJteGZO?=
 =?utf-8?B?bXdpTTE2OEh5SWlqa2t1ZzlrUkR6Skt1R25WUVczWVFnM3RKc2k2ZVlpNkY1?=
 =?utf-8?B?QWVCNWlvb1lSVUg4cE1FNzFpSDNrbmdzQmtYY0NNVTNNcU14RU1YbGhhNW9B?=
 =?utf-8?B?Sk5QV1NyL1NkdmJaU3FvMm1ucVV2Z2krTWdobEhSVituLzRuNndKdC8wL1RG?=
 =?utf-8?B?TklXQVpweUVEckZaZHZZODVYMmJRY2pnK2ZUMTRWc2Y3d3BJeHJjU1hMODcw?=
 =?utf-8?B?NlFoOFhpYXZXU09RQVZwQ0FUTkRWRTJkK2Era1h1eVppcVNEVDhVYzFOcFMz?=
 =?utf-8?B?Z2hLTHBvT0ZlTVZYdjlSTk9Ub3BNMk9sWUNDSjdFUmw4aEx4SFc0dGprTE54?=
 =?utf-8?B?MU0vQmpPS3QzZXFlcjhIa2dJaWZ4UUhJTkd6RThIQWp1Nmxla2g4M096aWZR?=
 =?utf-8?B?RFJTdGNGQVJqNi9aMmIyRDRUQVRuVllHR0hudndrWlV5bVpYTzFhaW9MdmxO?=
 =?utf-8?B?R2t4MVduREdQSFhUNTlGREIva2xrNkNock9OZU1XZi9zN0hDREp3S29IL1dl?=
 =?utf-8?B?a3UvTXhXNkZScnkvOU5JeUU1c0NUa01KVnhmZVNDMVBoMWxBUTNXUTd1ajdq?=
 =?utf-8?B?Nm1JM2QxUVJYVjhlZnpoYWkrSmRDZ0ZvdTJGWEdya2FQMWhMajAvOGxnNml1?=
 =?utf-8?B?cU4vQ3V5dC9KdGVaMmV4RWt0WDFhbkpUNDMrVUc1Qkx6Rm9pSmdXdTBKUWxB?=
 =?utf-8?B?ei9TVEhYOURab3hTc3NSVGJJSXgxUjJYcW9hY0hlMUFYRE0zSFRUWGU1ZG9l?=
 =?utf-8?B?VU93bzRzblFVb29nT2tNUnA4NmltMk9BWVpjSjBqSjA2aUpZMEpiRXVsWHBr?=
 =?utf-8?B?cTFub1QvY0EvSDdKVG1Td0ZOTkxSeWNHR0IzZ2t6dm0zTUJFRXN0MGpaek1Q?=
 =?utf-8?B?VHF0Y1dEVGlYbzJsUlFUdGpieGZhUGsvL3RHK0IxTms5Y0lOWlVUeDI5ZVBY?=
 =?utf-8?B?azlqL1pyKzJjcXRteGxkWmdBMnpMNGZKM0ZzVk4vOS94dW12Q000Q2hoSkpY?=
 =?utf-8?B?c0Z6dzNtVXZoa2paZWNpMTZkSEoyTHp0R3F4MGtqdnMyYUxjSXNubGdUL1Ay?=
 =?utf-8?B?U3J2aUJHeFZuUEljM1d2S2pUQzhiWURxaCt1aXE1UVIxNGVLTlRnS3BiYVdo?=
 =?utf-8?B?ODMwVnRXWFE4aUlxbHBvU0EvUk5jVDZQYy9pNVJ5OVFmZU53emNRNmhXdG9K?=
 =?utf-8?B?TmZ2MWtKYml0Rlo2UTN0Um0va2ZPckdpeUFYZWR1VDNUSVBoU2tzNTA3T0Fp?=
 =?utf-8?B?ZGNvNjFSS2YxVzIvd2IxRFRGZVl0Y2xkK3BGNytmSWVJcTdMM3Z5Vmx2ZmNX?=
 =?utf-8?B?M2M4YjY1dnJvcGNoaCtKOWFkM3J5Z0xqR2M1cTJVMjRqQ3RxZUJjTUp3UjFY?=
 =?utf-8?B?SHRCaXVoS1NLMWNJOStHQjRDQi9ESThIM2xMeUJwM2NsaU5TN3NoYS9takZ6?=
 =?utf-8?B?QXRVb2tjUUhyaXI2MTN2VU5ITlhDMDFjZDlHOVhTRjBlVEZ5Z0ltUlkybzRE?=
 =?utf-8?B?YzZzeEZkOS9nMjd0WFdlMmh2SkxQTnhVWTFMb21KUnZLaWs3dUg3TzZyV1RZ?=
 =?utf-8?B?dE5XeVh3S2VtaCt6a2Z1TEpSa09IUXR5ZThmY3FWK0RSVkhFKy9lRTVaYU0y?=
 =?utf-8?B?ZG83cFlMS3RmMEZxdnhrR3k1blJlWmZtTVhXaG9DOVJkOWZpL0ptdGVxUXZ3?=
 =?utf-8?Q?ZP44=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2l5R1JyK3g2RzNlL1dqOEIxQ053RzU1MmZTa21MMDdEUzNvS1I4aXF2dFUr?=
 =?utf-8?B?VXFWSDB6RmpRR0Vrc1Q3K3NiWld5NVVQZEsxZGhZZXRHcmdNcGtpRmxWT0Zo?=
 =?utf-8?B?TzRRa1VQZlpQTWI2eEh4b2hHY0xmOWF2UGdZK2JkaTI2ekFmWUVjQlBEcTRB?=
 =?utf-8?B?Ym02WEZ3VUtFQm1YUDd0d2xFRTFCZUM0R2g3S3VLL25TdTdaczA1ekZXMEk5?=
 =?utf-8?B?UU05OEU1WEtGR1JCd1hkNU9ZZTZNVy9KWWJ0Q094WmZYVHNmNnVBR3JrRjhL?=
 =?utf-8?B?OHFsQUZxUGlhcWFQRVEreWltcndEODFFYXpMNERuam5rYWFrN3kvdW0yaGg3?=
 =?utf-8?B?UWhaclNwK3NhYmRldExLNUczamFDa2owYzEwbGQxbTVBbmlURitRY2M2d24w?=
 =?utf-8?B?TjZhR0hxNVV5cDQ5cGcrNndjbG8xRzF1RDdEZTVyQkFnNjF6VmVzTUlmWE1S?=
 =?utf-8?B?aG1kSmo4dU13bFlTbzZLTWI5b3djVG83cmhsUGJaaThVRkt2Ti81SWZkSTlq?=
 =?utf-8?B?RE51K0ZtU2g0c0dCK2xya0ZpWTd0UEdUZGx3SmxiNGticXh2N2JkZmhTMGQx?=
 =?utf-8?B?QzhhZmd5YWtmTHMxb0lpVnJTVGxNM1FCb3IzS0pKb25PZXFjcnJxVE5zb0Nt?=
 =?utf-8?B?UEt3REU2UWlHWE02SGlIdDRSc2F5emRENTBZNjI4YXhIMUovTjZkNmdaK2lX?=
 =?utf-8?B?ZkpoeWlSRFM2QnQrb1U5S0xiSzAwWmk2Q0NkY3VtRnA5QlFtQWZhTGJTU3Vr?=
 =?utf-8?B?QllGZUJyVUFjVkJDcC9CV1VVaVhoTXVDeWpPRlAyUTk1ZlVySDlUSWF3Q09Y?=
 =?utf-8?B?d0wzbHQ0L2VSRDdVTHhEajF0eC9WU0lzRzZsaG9UbHlLcWloTVdMMjErWG0x?=
 =?utf-8?B?T2Z2aDIzU1Q4QVNPRFlna0dsNDlvWFNob3NXN3pGQk1aYVFkOTRWaURlQVUx?=
 =?utf-8?B?aVNUYkJzS0luOXJURitKTDZvNTc2dEh6d2FSeFg4c0swODN6UzMyc2xXQy9Q?=
 =?utf-8?B?NTZGelhDeHoyV3ZFY21TWitYY2kvTnJCTVM5TWd1TUxSUWYvdVBKL2hybVg0?=
 =?utf-8?B?ZDBBck15UWdBbnlNTWFMcGxRRnZVS1VVb1BoSzJWWElscjBaU0ZhU1BRYktZ?=
 =?utf-8?B?YmtoQlJKd3lOTUlZeEJsS0dBeG56TUxzOTduOU90Mkl0WitGelVWMTZxQU9i?=
 =?utf-8?B?dEFxc3VmWDJJckZPeFo4SW5DSktuekNnS1dyRlVpOFZ3d3c1c2Uwbm12dEg4?=
 =?utf-8?B?MXNDSTZLQW1ITzhNS1JYOUR4UVZoQXoxT0lTQkpzNXBQMWpTeUtZQmtzSXJp?=
 =?utf-8?B?cVUwMDZHVTcxWUl6SjhRM2xBV3VVT2k1aWFLcEpvaUtlNGFMaVc0Tm9oZTNj?=
 =?utf-8?B?OTJEeWlSUUxHVndGMDlheFdRb3pLWTJhM2RpQUJRc05KL1B0Y0RESlVxYVdv?=
 =?utf-8?B?dTdNSlM1MXNLWEFweWovcS9KbVJ3WitmQUhIR1l5ZW12NXhVUTBVODBpbEhs?=
 =?utf-8?B?OENHV1pZVHl0Vk5ncU55UHB5VVpRZ21TdWIyUWZPOXFvWXlOdjZUZlNjVG1r?=
 =?utf-8?B?bHpiT2JrNFJMS2FoMUM5a2pSQVQzQllRTENURDYva1dDL1FrZWtpUEEramN3?=
 =?utf-8?B?OS9wR0xvRTcvcG84N1pmemRndGNBcEJ4b1B0aUJYM1RRSnd4Y2pSU1gzbVVq?=
 =?utf-8?B?cHNXQzlUTjhlQW5iZGVBRDUrVStKZG9KZVBIWFJOY2ZBNUVJblEraUQrWXky?=
 =?utf-8?B?bXhXZVpFZ3JzZG56SktFNWFoZDB0MWJWNW1nN2g5a3hIUkNreC9aZGd2bTU0?=
 =?utf-8?B?TnYvT21WOEJTUmdzVkpnd0tacUtFTHBVbnlncWV4NnhrUmVuNHIrZFE3VXl3?=
 =?utf-8?B?Wkgvem5IM0ROOFlvelZ6bTlURGNmdmtNWDN3Z0FOM0E4a0VVR2dibUVVRXo3?=
 =?utf-8?B?UHVGcUZVOXgyODg3cXAwT0c4K0VjRjZyak0ySEFtRlMrVEg2MkZzU3lZNUdF?=
 =?utf-8?B?Yi9BMHN0QjZMclZSSUxtNnRESDBsVDFNZkFZV0Vzdk5DNW1IMkpPNmcxak9B?=
 =?utf-8?B?bTNycVBNNVZWTDVVTHRQUFp1U0F3cFJZV0JBekF0cUpGMzBkTzkyM1hQdERE?=
 =?utf-8?B?eFJmbzI0dk1pT1F4eUdoODU5SWRHODRUck1vNG00ckZjdU8rbjRERk8xcWwx?=
 =?utf-8?B?dzY5NGtZQUh4ZnVIaE45Unh5RVd4ZSt5d1AwelJDRVMrK2VIMkRlYVBncVY0?=
 =?utf-8?B?ZWRIMjNtWm03dGNrRjJOam9mUXVIajZYQitQY0IyWEZTUkpjYnhDRzU5VWRY?=
 =?utf-8?B?UVNoUE9NMlNDRTVOU3VRM1pXQ0VkN0FBVmpCUkJLYXBQc1lJRjFSUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14699a6-f19e-439f-a615-08de60103338
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:59:43.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD8p0251a03R4tFduPIC4nW53BmvAy/bB0GoV7R8ANc+qXpOKr7RYCKvPPJLa7HXFCmzIPrDSQzF7bx7296rQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5329
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.18 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: EFB49BBD60
X-Rspamd-Action: no action

The logic in alloc_heap_pages() only checks for scrubbing pattern
correctness when the caller doesn't pass MEMF_no_scrub in memflags.
However already scrubbed pages can be checked for correctness, regardless
of the caller having requested MEMF_no_scrub.

Relax the checking around the check_one_page() call, to allow for calls
with MEMF_no_scrub to also check the correctness of pages marked as already
scrubbed when allocated.  This widens the checking of scrubbing
correctness, so it would also check the scrubbing correctness of
MEMF_no_scrub allocations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
After discussing with Jan I've deliberately omitted the tag:

Fixes: 0c5f2f9cefac ("mm: Make sure pages are scrubbed")

The intended approach might have been to ensure the caller of
alloc_heap_pages() gets properly scrubbed pages, rather than asserting the
internal state of free pages is as expected.
---
 xen/common/page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2ee249ac365a..dcb95309b12a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1105,8 +1105,7 @@ static struct page_info *alloc_heap_pages(
 
     spin_unlock(&heap_lock);
 
-    if ( first_dirty != INVALID_DIRTY_IDX ||
-         (scrub_debug && !(memflags & MEMF_no_scrub)) )
+    if ( first_dirty != INVALID_DIRTY_IDX || scrub_debug )
     {
         bool cold = d && d != current->domain;
 
@@ -1119,7 +1118,7 @@ static struct page_info *alloc_heap_pages(
 
                 dirty_cnt++;
             }
-            else if ( !(memflags & MEMF_no_scrub) )
+            else
                 check_one_page(&pg[i]);
         }
 
-- 
2.51.0


