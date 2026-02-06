Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIUINunshWlvIQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:30:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092FEFE224
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 14:30:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223246.1530824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLuA-0003qK-7S; Fri, 06 Feb 2026 13:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223246.1530824; Fri, 06 Feb 2026 13:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voLuA-0003on-4h; Fri, 06 Feb 2026 13:29:50 +0000
Received: by outflank-mailman (input) for mailman id 1223246;
 Fri, 06 Feb 2026 13:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1voLu9-0003oZ-Ak
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 13:29:49 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e64f9022-035f-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 14:29:44 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 13:29:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 13:29:37 +0000
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
X-Inumbo-ID: e64f9022-035f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndBHM8TWfTj1cOujvpfY6WF/FbuvGgRIJ5hokIT321EOGt0BhnnwEGETYSPDxc4BhhzwYw/fupTjRQ4eLoK2P+QG924lex/7nZtBtH+NcBKbCFSlpulg8VSP6hKzZAi/+5NBOZ7FfilaQ3NuFk6ODq+7GRFUgRseBffzo40QoULoHeNAnBvC0e+uYco/4ZjUUuw1pSUmXLWcx+JeLQ0F8bSs+zM2QfYOJOvax//4qpxBRTDBvHvoi+kfk18Di62E+BS1IBtiszJ6TnyuUnSwsn3UrW/t9zxeYvwWel+H6t5tueR8nrR/oOoi7W7RIAMuQcSMzejLIhV+imQNfhIjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hY5FyuDZP6NwuBFEmcCkb7AwE3kWtgyY4vZVqMZG4k=;
 b=oxQzjCsqp8Kr7hL4tGzFyczL1oQygVTE1uhbgAWZB4kmgiONOXz773fmOUnhrHN3fqI+oti3xYXh+lCNXgJHIoBxYcxJ1ruDwdKI27uTIkvevfMRR3KQlCMHV/ACc7fwX9OQ2OwYBLrXOFV6gEY876vmgcGGzrXmItNwhHXu3imIdZG/zd9a+kEmdgrzGs4w1bxfgv09dgP031nlXVpnnfFaC9GZ09o+LfqirGKxVsRdsT8WI6PwoNbSsd60Dz44cBso6EG4d5sSYXdbAtBYKV9zq+hJwEiOGwqzu0J0IUk8oaPAGPnZnDAaZlgUTvhwCNVGRvx8+VcLfrQz+TfX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hY5FyuDZP6NwuBFEmcCkb7AwE3kWtgyY4vZVqMZG4k=;
 b=DdpDLXOQ8pIwe6kRa3WGFR53hzqFnvuGKfYQ4cmHgDKVxeXeKgYXwhflVa3Isu0tPbLygh8oV79n7aA8vIdr2Rqr/8w/4norsL4BI5kWgPm0N2VqQIfA7CUwweC9wG4SnP0I2TzcT4gVdmAVp+flz1/Er6r4dk7ceXrjtsmf7yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Feb 2026 14:29:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
Message-ID: <aYXsvu3HlPuCUuY8@Mac.lan>
References: <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
 <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com>
X-ClientProxiedBy: MR1P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3a549a-7abb-47d8-647f-08de6583c64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck1KNWdqTTB2SXFLVFpqQkdLVkJrSFNBYlZadUxIc1pzR3FBSHVwb3pVYjZi?=
 =?utf-8?B?Y2txRVcwazJlNW1UNnFnYmh2NU5QYWVnMU5PNG1acjNxLzhoYnRIZUV0YzBM?=
 =?utf-8?B?bmdhWFJraHVXTVZaRnhlQXBaUG5NbXJmbTJ0L09ZeVZyVVYrY3VhT2dFMlRZ?=
 =?utf-8?B?eWJPVENWeFVSeDRuK0ZoOGhvaG5KU0FqaG9pa2Vybk04VU9Td0xwS21SS1lm?=
 =?utf-8?B?cm9uN1dmNTdEeEl2SFQ5Umt6ZWRhbGNRWUdZOVdRV2c2VFlwcTgwTi8vSm9m?=
 =?utf-8?B?TGFPQnBJUjcyOVFCSW44WkhUbHFYSktjMUEwSzA1Mng1MzdwTlRJVFMvN0Iz?=
 =?utf-8?B?b0RhdUNid1VKclluUVhRanJtY1JtRWdvSkEyTm12UU5GTlNhMWtiUkZjVCtq?=
 =?utf-8?B?RDRZWWJncHpzNmhoWVdTZlhUaW5VY0xLdWUvNmE4OWxNUnRPbW1TOUVKNnI4?=
 =?utf-8?B?MHVyc01adXdBYVh4TjY4Q1o0NVB1UEdZdnhyaFJzUm5nM0NrZUUxTVg5aGFB?=
 =?utf-8?B?Wk4vZTRjaXJwbUpwdjl6dlE0bmUvdjBtalZ3bmJ5OWQ2VmFrVWZGamVkL0RK?=
 =?utf-8?B?NkJmenNXSDFtQTdBWEM4aTFuV09EQXBRSFAwSVI3MDNmNFExVjRUOFhlNEg3?=
 =?utf-8?B?N0d2Y295YWhmQnhwYWFEWDJldHA1MklYeWVYR2J1OFBTYklwdTFmVmUrK1lq?=
 =?utf-8?B?SkZqeklKMXR6WFc5Y0MxaGdLNTdoUkE2TkFOOWIrSGdRYUJMRytPWUxiU0dZ?=
 =?utf-8?B?MDhwdElLZXhEQzExV25NMjJOM3NnakVFV0V4T01pK28wSVZwWVZiLy9iS0x4?=
 =?utf-8?B?YVE0SFpBSkt4Rjk3SEJCMDkxNFl3T3hUS0JaeTBGUnVxM2tjcnYxMVVUbnpX?=
 =?utf-8?B?MkNpeENmYmlmU2EyWmRsUFhxays5MlhsTTJ4WXNSVjU3Rm5UMktubkRhekRJ?=
 =?utf-8?B?KzFZRlp0Zk9qSEpuZFRtVWcrWDAzRVRqVnhHNU9pN1ZyeUxxdnpsdTlDa0FQ?=
 =?utf-8?B?WEZ2MHVjMFBZQTVhWGI1cEhQN3FRcWltMmh6MEUxbk95V1o3SCt5RHEwdUZ1?=
 =?utf-8?B?KzJ2YU0zYmd4Zm52cmNqNDh0THdPdUQwQjdRWWIrSWdTS29UNGtycC9jNGU0?=
 =?utf-8?B?ZHNiSE9ZTzN3ZzlDYkhIMEhidFV6SktheXZ1Q0wxMFROZ0gvcmd4SUhkZ0tr?=
 =?utf-8?B?T0JyMExham1RVWFuYnBwZDhTbWpPY1YxRTFwVFJUaXEydGFTY05FL2ljT0Zp?=
 =?utf-8?B?Y2kxREpiOHlSVlk2cXg1MHJqczN5TmFEVXhBaytpTGIydWpCVWZrT1BvNFZq?=
 =?utf-8?B?aTA2VTU4S3JYQUlCQkx5ckNlanhJclJMaGlYZC9DVlFTNmZrMFdIOGdzZ1Qr?=
 =?utf-8?B?YW5ncVZKb3FGNkxGUE9uZVNTMlFSekVYeWQwQU01NFVoRVZrMUtWMmFmOFFl?=
 =?utf-8?B?L2xPWUhxRitpTUxvOTh6N1IzQmwybkY3ZTFCL2Rxd05UQ1ZMWnBvdlRvZElU?=
 =?utf-8?B?WUpqMVM2eTQwZHVVaU5wSUJtb1g3K3NzQ2MrV1VuT1NyN0txUTZ0ZFpFNk1j?=
 =?utf-8?B?R2cvWFZmZFptM1pSVjFFZ01KTnJPaks2VXdOUkUrRE1VS1g3Qm5aN2M4YTRE?=
 =?utf-8?B?czJxdGpxV3NhNjgrNWNOOUVKSDhlc3QxakNWQnREQm1OdXJET3IyL2FLR04z?=
 =?utf-8?B?REZ0aUd2QWI4UUgwNHowSWdsZWprSVUvSVg1bTdWTVBmRER3VnZ6ZGJqVXRk?=
 =?utf-8?B?bzBNZzk4OUlaVUt6dHMrcjJ0eVFDMEZjbDBGSkdUTndqSjhlY0hrakZzRkQ5?=
 =?utf-8?B?QUN2UEJ3alViNm40V0pUT054MnlLS2ZhY3FsdHlyQkZWRFRwNDU5LzVFSEx6?=
 =?utf-8?B?RXJMRjZ4Y0pSQ0FTVFN2ZW1UMXpUbUx3bGRoQk1HOUtkZ1liMmxLZmxOcHhR?=
 =?utf-8?B?OEZ4UzdOeUdDMjdRSjdvZnBqU1BCS09mL2FQNjFpb005NWF3UGw4RVI1Y0Vw?=
 =?utf-8?B?OU5zOURkdmorYVY0VGlLN1N3WXB5aXFWM1RjQTVxN09NZS8vbWxzUDdTd1NV?=
 =?utf-8?B?N1AreGtjeHhxaUJkMHloQ3BjeWdJaU9iM3hhQWFIaGswTEJtZnRGa1VZc25F?=
 =?utf-8?Q?KYPk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm5DR2djaE55bFRBVjE0TzM1bmFveGlQdXlmR2VVdHFYemxLdmVXQXRaWExQ?=
 =?utf-8?B?OXBLOGR0MUJBbEh1S3pKMG45emJrTkg3YmR6eUJBY25Qem1ES0lFYUhFMUNQ?=
 =?utf-8?B?Q0ttbXh0TTZzeENMS0wyNC90cGtlck1GdnVzTnVObnRqdkVkZHZJRnhJY0Rq?=
 =?utf-8?B?eXBlc2YyMnFBZnBZOXUvTXVjTEtHdmhoWEJvd0hZVDZ5RmVNTlgwRnUrY3Jx?=
 =?utf-8?B?SjJIYkVYYWhIY2N5eUFZVE1wT2hJejkyMWJCT2pFY1Z0KzFxQ2hWOU13MDBK?=
 =?utf-8?B?YURWanhJNTA5NDRwQkRsc01WU0xQczhaYjZ0bmp6VWlHUk5YWTkvdjJ6eHNJ?=
 =?utf-8?B?VkQxOHBkeGhMM0R2Z1lTYzVqS3FNUHRicnZ0MGRDMUwxd01zdVBHL1lKZ1Yv?=
 =?utf-8?B?dncxVmxvSVg0K3BSQXJDWmdFM2swWVc3Qzd5d0ozMG1lM0pmK1hYWTBNMlVv?=
 =?utf-8?B?UWN1SHhyTytXQnVVemoyVm5QWFJ0YlByUGtvWE05VUQwYXF5SlJuckVFU3Iv?=
 =?utf-8?B?dUMzY1RrVGNtcU9VRmhBTEM2RkdhL0V4Sk55emtuUllaTGVBSHB3RmRvUEg5?=
 =?utf-8?B?SWFITVZjazUwK0ltWUs5TXI4aFRQZ3huTzRjMk5NWVg0UUJyZXhzdHlzN2Z5?=
 =?utf-8?B?UzNnTzlsNXZSQ1JlSkptUi8wRERPbTNwTkFQN1pLZEo2YlBGQi9BQ0JDb1Bh?=
 =?utf-8?B?b2p1YlNaUnc4VTV3VGxPVVg5M3laYXBGWGtieG42bzdSZHBnZEY3dVhGdmFM?=
 =?utf-8?B?bWJScTY1OTJoRm1NWTEyYUIramJZRVJDSkpTdExBSndQbjQ2SlUxYUVwbmRi?=
 =?utf-8?B?Tk1tMXB6eUFZR1B4azI5YVRTakQxUTkwWlFMNndoL3Y5QlE1MjVsaUNvbk9S?=
 =?utf-8?B?N2k1bE5peW02MHZFMEFjcWlWQVNqWE91NXRHUExaZEJuUTNFeDRVb0JER0tZ?=
 =?utf-8?B?RlNTeEw0L2Y4ZFl6R1VaRTZPZDFTMnRVNUJybWNiMnRUM2dNWG1ldGJNMHIw?=
 =?utf-8?B?YklPajExVnRIR2hkSnBvYVVNYno0eHptbXpZZlg0N0k5ZjREMjE5Z0dsMWdo?=
 =?utf-8?B?cjlmdUQ3ZVRFWko3aUhaSGp6b3lhNk5LVHVwRk4zZmo1V28vWWR3S0w5cW9h?=
 =?utf-8?B?TTA1NXl1bGcweklxUDFiS0NNQXJEQWNYc1ZSNXlud0NIVXFXOERHeWRwUmxB?=
 =?utf-8?B?RjlCQmNOaXNaV0dEanpwK0xSMWU0b2k2NVNwNFgxVjNBWXpCcFhMZGNsYjln?=
 =?utf-8?B?QnArKy83b0JHemNpUVI1Z0xoNlZGSWpWYUxBbjRZeWpDeTZhUGVDQTdKWG03?=
 =?utf-8?B?RGlad3NVUjZ3bThKZEUzenFYaVVSNnpDRXd0cVFqNFlJS2VMNk5pODFrSVFY?=
 =?utf-8?B?NjZkVkUwamJWbXpXVW1IL3lMYmFBdW8xQjlLNmd0elErd1UvbXpKa2diSk9S?=
 =?utf-8?B?eng3TllYYkRwNXdMZVBwbHFCVW5Qa0IvY1h3b0pVSkhFTmxwaGt0UXV5ZTRS?=
 =?utf-8?B?bzk3T1NDQnBUcUR1TGY3cFZaS3I0NjYrZDRRdHhjVXQyajJodU40WTF3MHBI?=
 =?utf-8?B?ZlZOQXVTMlFFNi91ckNXQVlnOFlDK2NDa1ZoYitEZ2FVdFBwcGc1UGhuRWNL?=
 =?utf-8?B?VDZ6TlM1aXhWMTluUTJPU000clBxYW0yT2t2VkJOSzdUa0Z6ekhneW5WYzVy?=
 =?utf-8?B?Wm1WNnVIL25DS1ZFYmpZTlB1ei9tb3FxMXdyKzQ0aUtrZGJvM3diZ3QwT0pz?=
 =?utf-8?B?eGhTS0QrdDY0bnMzVzU3R1pyaWVHa0NhWUhoRTNlejlVK2dRVVpTMEEybE5M?=
 =?utf-8?B?Y0wra1FCWXdiY3A5QWtZamJmYnR1dDNFTHY1RUtVNFoyRjltbDd2Z3Z2bmhh?=
 =?utf-8?B?Q3ppTVlLTklSUDlSV1QzQjVYSW00RmFpOElEVVY1N3hNNlVjMU1JZEFubVJw?=
 =?utf-8?B?em9FWjdPVFA4ZFIveXhOSHJrekUwV1A2T3E0OVI5Z29RaHdRVzc4NWkzNXlj?=
 =?utf-8?B?aTIreHVpWTdzMlNGNGIraDdFSXFwaktQTDFjZVNSVExmSkJLQ1YrT2ZNYWIy?=
 =?utf-8?B?Z3I0b04yNXlRelBoR3NjeDNROVZST1hIdEVKNUFoeEQzOTR6WTNjaUVRbjdN?=
 =?utf-8?B?TFViaUg1djVQdll6ZkQ1NHh3eWdXQlFRTE4rdWRuS0ZEL3ZLNjBwMVg2OGN1?=
 =?utf-8?B?L0ZJVGhzSDV5cXZoV0RIUnZZeFZvUDFiS0FDY3ZhSU16MlI5SUUzcktLTVVK?=
 =?utf-8?B?SEFucmd5QmErai9WSnhVMDVUV0lXRHUzQXJoU1NMQVhDQWxGeHB3TDhLdlZ0?=
 =?utf-8?B?UWltaVJ5MGF6eDdtRmZaTHg3NDlRT0wyYjlyR00ybGxRZjFXR0tmZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3a549a-7abb-47d8-647f-08de6583c64d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 13:29:37.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yt/te4zX7TzZ7yoHQIHsAcwoo73EErHClhwt7oT3SBEn3xqMj38LF4Ayh0mq9q6SLaqgDKMck/aGNyN+0L7kQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6423
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,darwin.mk:url,stdgnu.mk:url,config.mk:url,Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 092FEFE224
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 11:38:02AM +0100, Jan Beulich wrote:
> On 06.02.2026 09:17, Bertrand Marquis wrote:
> > Xen does not provide a Darwin build configuration for selecting
> > GNU tool definitions. On macOS, the tools we use are either GNU
> > compatible or we only rely on features supported by Mac OS, so
> > using the GNU tool definitions is appropriate.
> > 
> > Add config/Darwin.mk to include StdGNU.mk and force
> > XEN_COMPILE_ARCH=Darwin, ensuring Darwin builds always follow
> > the cross-compile path as we depend on the Linux ABI so compiling
> > on Mac OS is always a cross compilation case.
> > 
> > An example of how to build the hypervisor for arm64 on Mac OS
> > (tools cannot be build for now) using a compiler from brew:
> > - brew install aarch64-elf-gcc
> > - cd xen
> > - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc
> > 
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes since v2:
> > - Subject was "xen: Add macOS hypervisor build configuration"
> > - Update Darwin.mk comments to more accurate versions (Jan)
> > - Remove the build-on-macos help as we have no dependency on anything
> >   coming from brew anymore and the toolchain can be retrieved by lots of
> >   other solutions than brew on mac os. Switch to a simple doc in the
> >   commit message instead
> 
> Did you see Roger's notice on Matrix about objcopy?

I think Bertrand considers objcopy to be part of the toolchain, hence
"retrieving a toolchain" is meant to include objcopy (either the GNU,
LLVM or elftoolchain one)

> > --- /dev/null
> > +++ b/config/Darwin.mk
> > @@ -0,0 +1,7 @@
> > +# Use GNU tool definitions as the tools we are using are either GNU compatible
> > +# or we only use features which are supported on Mac OS.
> > +include $(XEN_ROOT)/config/StdGNU.mk
> > +
> > +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
> > +# Force COMPILE_ARCH to a fake value to make sure it is always the case.
> > +XEN_COMPILE_ARCH = Darwin
> 
> I first wondered why you say "fake", seeing the file is named Darwin.mk. But
> in Config.mk's cross-compile check the build host OS doesn't even matter. So
> yes, it needs faking here for the time being.

Hm, setting it to "Darwin" seems weird to me.  I understand the
purpose of this is to force the user to set XEN_TARGET_ARCH
explicitly.  I however wouldn't see it as fully uncorrect to not set
this.  It will then execute `uname -m` and get `arm64` back for Apple
silicon macs (which is kind of OK?).  Other I suggest we use a non-OSX
specific value here, so that if required we could distinguish this
case where the user is expected to provide XEN_COMPILE_ARCH.

Maybe XEN_COMPILE_ARCH = { unknown | undefined }?

Thanks, Roger.

