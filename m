Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHz7Gnx4mGlrJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:06:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616F168B11
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237233.1539612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtS56-00033B-9J; Fri, 20 Feb 2026 15:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237233.1539612; Fri, 20 Feb 2026 15:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtS56-00031R-63; Fri, 20 Feb 2026 15:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1237233;
 Fri, 20 Feb 2026 15:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtS54-00030g-Ux
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:06:10 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afed36f4-0e6d-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 16:06:10 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by LV3PR03MB7501.namprd03.prod.outlook.com (2603:10b6:408:19f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 15:06:05 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:06:05 +0000
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
X-Inumbo-ID: afed36f4-0e6d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH7S/q2i/lLZNaDjPYywjY4FSiugjfq0YxZ8MkxJ1je7U3KuEwurIBCfpxZl7QELP2grud7VhzSbHw79wOmlDClm087P7SSwFIc8PGJtiX27+g+VGqA2f9cJmAbuHn7JqXQTN/9Ncg85tZoJDv5gch4r0wQJ0KVTRJaXD8EuVlfZwfpAXifYYwn4oYMAT5IHU6pyZ/0Nk5Txn5y2m+spdRKahW1M+dKbrOtTvDqU/is+MqGZctTb4SgTIzEXpzlFUr3hC+BCbN1jceeAMr275p1f7+ep5HMw16042MnYBbW+0gEvkeN03Ey1aoH1obg6YuXOxwwfq2GLbzM4MLuK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auf12nDW0j9b06N6A3UqnFkazB6eYRZxm2r0QIcHvo8=;
 b=WhxAm8wILSnHff9cfQGC52636Ln+aJyrxMXOxMeVLNeBktCzATvyCOh4dXthpQavbFPe1Mv8Xtj7zvkDnzSwwE1E7ii2uwOjX9UCldXqB1PIffTxksb5OVIW+E0KDjOVy8H7tR2juXeelgP6djHUIqDNtz2+Dxuh0TFqexj+LUvxTj+rT6Q86rUH/YqTd+3FYlhC7ZRXaYyLBpim9FTSk7E/gsP0YC2gbUkRyh2P3cCz0qxb4TuNcM/XibllH+Sk7dRnVZ/uhsies1MsZJEWgGctugc3rSMp8OGn54oLUsusqUevXPahfMEtee9QVwR6GVu4HgdQxIznwlRsAzr2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auf12nDW0j9b06N6A3UqnFkazB6eYRZxm2r0QIcHvo8=;
 b=WK3ESNV3O3YQjcDPsbewXzA/f3e7aVR8ceD4J9mK8iOpusOGbcipMi4uUupROigGvU3YJmVoRdicQnzWxd7StTpjn9saN3frOXjXuxJgTyrw43s9ZuueW+ng7DHIBNdotj+Of95/IiUoTWe+g8L8Dmf855AxTV+/zZq2ObS/lx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <abae3741-d866-4816-8744-6721183f35e6@citrix.com>
Date: Fri, 20 Feb 2026 15:06:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 06/12] x86/shadow: restrict OOS allocation to when it's
 really needed
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <3c05fb6c-f71e-1b86-6146-96f2b3f3c9ae@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3c05fb6c-f71e-1b86-6146-96f2b3f3c9ae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::25) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|LV3PR03MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f59e020-e387-4ad9-129c-08de709191d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVpNTWdnOUlWc1kwdTVCbmQxOUduNHREOWh1YjhlUy9lSnI1dmNjSGlKU1BC?=
 =?utf-8?B?SzVlSU52V2cxbEIrTHBvc3BzRERNcVN1MkY1ekVGQVdyei94TUJsdmdxRGJK?=
 =?utf-8?B?dnRJT2VuVXRVNkFNcGxrSmtjekgxQlRtRnM0WlVKSzdHVGp3dnFpVnNKMSs2?=
 =?utf-8?B?dStFWTJrWGtIaENLTm5xa2tyTEZlZHlFUWZTZ2NpZ1RRdGpESWtmVWdIN3Vl?=
 =?utf-8?B?WDlTeW9kWkZTVmtZd0ZlSU9hNHMvR3hJaFRzVHZPaWRoTm1MUDJFcitZQ1Zh?=
 =?utf-8?B?Y0NDSzBoU09Rck1kVkl1WUUzZ3M2SHkxUlROd1Y1elJmbVFqRkR1dXRya0Ez?=
 =?utf-8?B?OUdNTUllOXBBaDdmNDZiNDBKaDdEbEt3cC9Dd3QzQ3l0M25BTFJLZ3VyY3Qv?=
 =?utf-8?B?eEgxVVNTamEvYkJzejVUeWFNSG1mc2YwWUgzMU5UYVpyYm4ybUlIellDMFdK?=
 =?utf-8?B?ZmlVVmtoUmZobDYrdXh6UHphNWVMbnNVR29VVTJMZzZtUUJRb0V5SlEzalZR?=
 =?utf-8?B?RDM4WTRRdjR4SmZQenF6WlhocHdEQlhlMVhVVGZjbEJ1OTNKQjFKNjZOcUZO?=
 =?utf-8?B?NURENkl0eGdxMFBDOGhJNFJqRU9rbkFoT2hvZHpWNzAvZzYzbXBPUktXbXJF?=
 =?utf-8?B?RFp5aWVNemdNbkFhYkhuN1AxMVpkZnBiallCZWlBaUtramwrTGpIZ0pQNWwr?=
 =?utf-8?B?N2FMVEdlYk1Nb2tvaDBudm5vS0NJTkJEVnBZQkNsMWs5TGdLV3dPclAybzFs?=
 =?utf-8?B?NGFpdGw5SXN6SldnY0h2enZJcHdjQk9Za2d1ZzhaZGJIV3dmMDRLTWtBYWN5?=
 =?utf-8?B?SU9kby9kZWd1dHRqNjNsWk9pTnFnc2xQTEw5UUVkUWNrZzM4T0pDc1UvazJo?=
 =?utf-8?B?a1pPSUdNQlBDVUNNMXhHRit4d3FQUG9pTWJBMmRaZ0hUeEZTdGJYRldYanhM?=
 =?utf-8?B?UjFyVmZMRExXRitsMWZsVmZycit5c1lJcm9tTzF6M1hUN0huZnJQS0lYTXVG?=
 =?utf-8?B?NllObU1UQWVFbGxtZlYvK0pCYmlOWUF2UHhLRGNUaFRVeXhia1ROQTM3Ykdl?=
 =?utf-8?B?SzBHUmRUYitkT3dQNG1obTZGdFF4ajhJMUdVbmFSUmFobjUzU0MxODB1ZFFD?=
 =?utf-8?B?ZFRkcUhhOVJUalJOQlBsWWJhczJRQlRLVysxTFhwcHk3bmVUZFNZdjU0NDhv?=
 =?utf-8?B?SUtlcktpZkliWStKR3JOY3ZWdm92S0VjM2cxUEhpSzBSQ054UUVqSHFHQW1E?=
 =?utf-8?B?RndYMW43SzdpMGNnbUorYzB4c0Z2NFVuazIxY2JHb2hYeDBoa1lLS0JhdFdh?=
 =?utf-8?B?SzlNL01iQTVXczRBS2kyYkZiUHhwc1Q2elZoZUo4RGFIQ1pmcGNGRnVydGs5?=
 =?utf-8?B?Zi96ZWZiSEM1S2E5SnR0dWd3MUc1MmhjUGtxTFlWcDBWWHN3YnYvOVVnRk4y?=
 =?utf-8?B?dXZiMHRmbjFCOFlrTWlOMStiQjMxV2dtSHlORVFrdDF6cG52YXNtREthdSto?=
 =?utf-8?B?eVU2OW55NEtYU2VmUUdoYjl3eXUvM1hJR2w4RmJrSWlxWFhweUdJWXVrV0JV?=
 =?utf-8?B?VEVUMHVHMit6UCtJYlFkWUo1OFpnMHp1UDEvTE1DQmdpRnhyTGUvajA0K293?=
 =?utf-8?B?cFp0a2dRNTdodDRCd1JIN3FYcEUya1d4N21saXhId1JVK015RnpzYldheTh1?=
 =?utf-8?B?RVNIRVhYNVBOcXJJc0RFK3VpSmp5bjhKZEZsQjQ1NlNHMVgyVG0vV2YrbkYv?=
 =?utf-8?B?V1V2K1MxQlh1djR1clhGZFF0NWhvZW9rVHBVaklFQnlQcXAyRjdOUHZxdWVU?=
 =?utf-8?B?QnBnNHdDV2E1MWZiajlNdUkzTzd3b2hiQzJBMllEZ0lDZ24wbjBGd3AyV3Uv?=
 =?utf-8?B?MFFneXhuaTRpRlc1dzBqNmt2YUhqVEYyTFZLVEFveEo5Snc5UmtIWkRJVkZT?=
 =?utf-8?B?Ykh1ZEpJVmVzS3hoOE5FRG4rMlhhc2k0MVhhSEJVYTdqSWNRVHloWFdoeS84?=
 =?utf-8?B?N0hySk1aVDg2L21Sb3daK1pCVms1RUY2K0laN0lOcUgyNXZObDMrWTl0c0U3?=
 =?utf-8?B?eWI5ZG9ETzFocko3dXlJblZiM2JuR0ZMcHdzWmJyTTRMN1RYRWFKR1BoY2JH?=
 =?utf-8?Q?hRuw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWdDem51OVNxd0NFdEZtK1Z4MSt3bktVdGFxZ1dRcWlMdzdnZ1UxN2ZTWjVx?=
 =?utf-8?B?aDB4L1JhRGFsOGlQNmRJcm9yWXJBZEt0RFlHTWppZVZCWXdxQWlDVjJKZEtx?=
 =?utf-8?B?bWZ2UVE1cmJUaUFxUStKUzBFSW1NUE0zeTV2ODV0ZXdYdVV0ZWVXWXNDQVZq?=
 =?utf-8?B?SEJlN0dxSkg1THMyczBYRmpBaGtXTFBlZHZWZlVIR1RNSExmWEhKSWVndW42?=
 =?utf-8?B?V25YQ3htZWdwS05kVElUbU9iSnR2dHBFcHQ1ZHJFQW9qSDRYNFVEUTFhZ1p0?=
 =?utf-8?B?cjVqNkJTVTNROGl1TUNQc2JTNm5ScXg4QjRTbXQ2MFR3c01xNEcyM05DczJm?=
 =?utf-8?B?dkpFVjJac21zcmFHY1IrT0NHTUs2UHJGazVsaFRvall4aEFZOEJUOW9NNVp1?=
 =?utf-8?B?R1R3OTRxcEx0c3hVVWJaWWM2YVd1Uy92MEhpaUdIZ0R4eitwUC9PMVQyelJ5?=
 =?utf-8?B?dkNsemdIbVBYSW9wVk1WSE5JZmUyai9vUGlXWHNWYUJjUjFFRll1aldqUy9Z?=
 =?utf-8?B?Q0k1bkIxNWk1Vjd6cW5EMmNFV0d2amVKc29wUlVFajVvT1RLMGt2amZ1SWI5?=
 =?utf-8?B?d2FnVDRVNk1XWlErQnFhQTU1dkUvNklIMFNucGROSG9GYW54b3NSMnF1ZEdj?=
 =?utf-8?B?d1Y3RERybkJxY0R5VUZkam9qWVh0blEyMUdVajliZnB1dVlCczRkUjdBc0Jv?=
 =?utf-8?B?Y2pCVkJvWE1YcXBpM2NsNXptTjZpMjV5SHk0U2VUNUV4YVhiM29JK1FwYVF0?=
 =?utf-8?B?c2czMHU3MmkzOFNpRytyVm1WcWRva09ETWRQa0hkV1RGSzhXT2t0MjFqeDUw?=
 =?utf-8?B?YWpOMm0xdlJqc0FTeFUzeXdTOHYxNVlPQjRoMUVoMDIxL25NK29KZTR5WmRx?=
 =?utf-8?B?MjJqSHNqQmVYWkxEYlljL1doSTNJSkhMSlRMMloyYjVqVzN2aTBOWndhMENO?=
 =?utf-8?B?RnFKSmZ5M1lyZ0MxbmZtUHIxRTdQRE8vTFVMcVV0TTMrR3lwUTByMk1RaldS?=
 =?utf-8?B?a1lZams0U0k2WGlmZ1puS21seDBTY2R3VEcyVURsT3R6dUZlaU4yVC9MVzJv?=
 =?utf-8?B?TzcrOXMyTEdSZ0VDamJaTHdWVVc5dXNYaG9Db1g0SWdpd0tka1hoV2tMU2dq?=
 =?utf-8?B?MW0vT096d3dDQ0FaaVg5dVJ2UDFDajNnUGtJQ21Cdno1STZCNlVsTkRTR2k3?=
 =?utf-8?B?RmMrVHZpUm11L0VqMkVXM2lETjBjaTRKWXUvaVJkdGhiQno5cnBnNDBlUVZz?=
 =?utf-8?B?RmN5ckhtTE4wT2FNbzRwa3JKMFBFR3RraEY3bWIyS2ZwNkhzSU9KMitxVDR0?=
 =?utf-8?B?bmVvM0dTN0dpWHVGbTNlQm1aVUQ5OFo3Z0d2NmYvSlRSTWNwaGhrNDNMa1g0?=
 =?utf-8?B?NjBXS2RZYWpnczhjRGtJc0xoemtIRElrc0lQdGZTdjNwQWtMWW5Tc0hIOURp?=
 =?utf-8?B?RTRkWFhzTzZqU3Vad3VjTHB0T0VsNWJNRmphMkxiV3kzNVVhQkZya3d6dzh5?=
 =?utf-8?B?VGpONEFkRnRRNW04WFl2V3FZTCt4dlkrMGZicFhhRUY5MXNId24rZndPRjhj?=
 =?utf-8?B?eGhCZEkrY1RQeWY4UXN6SURVdHc3RFk2MWV5WHFFWWpNM0gzQUJqa0puUlRU?=
 =?utf-8?B?R1p5LzByenlwM2NnY09YaFJOVmRxK2FsdVlmY0FPbENlREtaRHhmZ0lKYnQ0?=
 =?utf-8?B?NVNLemFJd1hVeVhpbGxQZlZWMVpWTkhsbzRkOFVxMDlHWXV0QTlic3NTK21K?=
 =?utf-8?B?MWhDaFc4TXFZMStldDQ4L1J4WHJ2S1oxbmIrdGZBRlJZNTcxQkk1UXFMR0pj?=
 =?utf-8?B?VW1tbTArWW10NkJJajlvMzZxeG1UUVdIdlNZS0kwN0ZVcXNMdzJzMEJHdnVv?=
 =?utf-8?B?bWxtaFQ3SGUrUGVGdXdabzFpYjM2YkQySHhYZjZCRGZMc3U1QXZKanBBOWlh?=
 =?utf-8?B?a2VmSVNTdnJ2dG1JcnREY3o3TTZRdEthcTJnUlM2aUkwQWt6MTZEbmFRV1I5?=
 =?utf-8?B?bDNSZ1dLVC81dGtCSnlLVWtzVjVwRmxMdFRiZDJ6bCsyOHE0OXN4RTFSSTNT?=
 =?utf-8?B?UmFYcWpkQmZMTkpDSzZCT3pCMTVUdEFOVnY0YVlwbGdzMWJIRXJWcjY1NXlv?=
 =?utf-8?B?VkdXMkJXWEhTNVprSnErV01hUy91UUNUUjNKKzN5VE8vVEVxbDVndm9mU3lS?=
 =?utf-8?B?enYyWjVnYTJ3bnlMTERJemNIVUhKQSt0YXFwUzdQc1dySmhyY0RDU3Y4MGxE?=
 =?utf-8?B?aXQxRHBDSG9Rc0I2ZysyVXZEbjN2VzRHVUo0S3VueFFLWTJKZDhnZFBXSjJX?=
 =?utf-8?B?OW9YYUU2S2IvYWxSSEJCeDVSTjFScmZrcnd4UzlpNzRjYXRvejN2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f59e020-e387-4ad9-129c-08de709191d5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:06:05.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rFD1qyFpLow+fYqoGUHtEdj5fmDogbImREXKyX80vhNOGi1PqfBKVqO+FY+37++QJ8TKPCJCz9jXUeZd7h0K8v2QIV+qR6hv58S6jhG8HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7501
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5616F168B11
X-Rspamd-Action: no action

On 16/05/2023 8:40 am, Jan Beulich wrote:
> PV domains won't use it, and even HVM ones won't when OOS is turned off
> for them. There's therefore no point in putting extra pressure on the
> (limited) pool of memory.
>
> While there also zap the sh_type_to_size[] entry when OOS is disabled
> altogether.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: New.
>
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -61,7 +61,9 @@ const uint8_t sh_type_to_size[] = {
>      [SH_type_l4_64_shadow]   = 1,
>      [SH_type_p2m_table]      = 1,
>      [SH_type_monitor_table]  = 1,
> +#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
>      [SH_type_oos_snapshot]   = 1,
> +#endif
>  };
>  #endif /* CONFIG_HVM */
>  
> @@ -1771,7 +1773,8 @@ static void sh_update_paging_modes(struc
>  #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_VIRTUAL_TLB) */
>  
>  #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
> -    if ( mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
> +    if ( !(d->options & XEN_DOMCTL_CDF_oos_off) &&
> +         mfn_eq(v->arch.paging.shadow.oos_snapshot[0], INVALID_MFN) )
>      {
>          int i;
>  
>

I've never seen XEN_DOMCTL_CDF_oos_off used.  Xapi has no plumbing for
this, and xl only inherited it from xend.

At this point, OOS is the tested path and OOS_OFF is the untested path. 
I think we should remove the flag and let OOS be unconditional like all
the other shadow optimisations.

~Andrew

