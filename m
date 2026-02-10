Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPy9JbJKi2mjTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:11:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649E11C52E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226495.1533012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppOo-0005aB-ML; Tue, 10 Feb 2026 15:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226495.1533012; Tue, 10 Feb 2026 15:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppOo-0005XW-Il; Tue, 10 Feb 2026 15:11:34 +0000
Received: by outflank-mailman (input) for mailman id 1226495;
 Tue, 10 Feb 2026 15:11:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vppOm-0004ns-WF
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:11:33 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c555da55-0692-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 16:11:28 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH7PR03MB7955.namprd03.prod.outlook.com (2603:10b6:610:24e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:11:23 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:11:23 +0000
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
X-Inumbo-ID: c555da55-0692-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmQLan/T42OyynObYDzX/IL55HyKfEnHGU1OAij7CDjaESjTJQ6WWl0AbJdpAlFNFk4EfkbKwo4iTGJjbDVTViGxnurwLhzzbpFGPSfEPJ7wEotrNQh6yb8UFAF0VCBMXNjoj3rWrYDWGdfNyOH50cEBLZVLGAkB8gezYPCNU68qfcwHSSIRLJURZpFkCPp531kzq6EcpQn+E50XfGQo0lQuv4hIPt+c52TTHdqjCQc6Cpr95uvkfK4zjiDsrkuNleC7H5pMFWyU7WfOVNADtJHcX2zxe5qKQCHwYZfvo+YGzCsNO9bfBYyvt0aaSDNNkMRVEmhKs6nY9MhVLAtbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsE9FTz/cjt2Wqol+CkTbLxLLvXw0H9d+61lnykmx0Y=;
 b=RRXGVmdiQeK5VVKltNHJuF/dX1igbEbIPgHrJWk8rZhqFAITzMwZ8O6ynGa4Z/1uviuUm0WvG9q4uenDWKElN2nLNDvTiDVLW5HwxUs9vaj+izKFoyFVDXOASZ5425bO94cr4nvEnDoJrsiVJrTYDGDGQ74x0GZohMCqFXRR7imrBbPVPt2C4gERLnst+El/zW4Xk+sWu3wJEWe0ee4V2bbtijrikWoxKSj+4LKXydI17AWPPbfHaSeWqU311/hGCxo3pxJ0ZpUw5ZjUs4W50v36tv9kTaebdkFnMDHXThRilovCt1cUBpM+bY7tSD3DpehsPvyj4TUBcsRznXosrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsE9FTz/cjt2Wqol+CkTbLxLLvXw0H9d+61lnykmx0Y=;
 b=jKnS4jqrePaerH9At5mY2RyC+RlA9xPeGfkiRM2x4qrO5e9i2b10XycgOU7vzi+JqXmDKelIKAiqAf3ezkHIYhXTc5/v92VZRk+y4O/nQipJONr+Dig1Is+CpFuL4jdDg6YSHWRC288l6AjV/j5cealXboRY60BG0Y/v9rFSspQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: always consider '/' as a division in assembly
Date: Tue, 10 Feb 2026 16:11:10 +0100
Message-ID: <20260210151110.26770-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH7PR03MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 693dee01-a3f2-400c-1640-08de68b6a730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3FXQkVTMy9wRUs2MkVvazkxcUtKUEtuT2ZPNDBqRW1IellRaWFseWtHbU9T?=
 =?utf-8?B?WFRFS2NwWW9mbWh1eWxrZzlZWVNnVERKSCtXVUpWK1JEYUhqS0hMNGtkUTlO?=
 =?utf-8?B?anFEWklHeFRxc01oT1F6TVBiMXVRM0hoU2FVSWRoNWpLYUJOSFVnM0M0bEpq?=
 =?utf-8?B?dVcwczVhMGFxQTNSbEk1NGs1eUlPZjk0V1dsbEpETHU4MEhjakZJUFd3RHVI?=
 =?utf-8?B?eklFWjVBNjZvdmQzcEg0cUJLaHQza0RmQW5zWTh4bG94czhaZkFRS3FrODhN?=
 =?utf-8?B?RlFSeStrRE5DbU9wZmVKZFZMOUZsZmh1L25BS0xXTkpBamhWcWhQMzdBMnhV?=
 =?utf-8?B?bkFSYUYxLzRuK1kwcG1EQ0grMUVYU0orZGsvN1hHRmEranlWbzJoUlRab3hK?=
 =?utf-8?B?Q3pyUzZBUlJoQ3ZFVTFyZ1dScWNjRlh0TktIOTlvV2R6bjU3VnlNOGRodkJC?=
 =?utf-8?B?bkVGQ3JFWCt5U090ME1XWjNJdlRTMW5NU250RTJtb3B2YXkzYWdZOGRpRnBw?=
 =?utf-8?B?d1N3TUoyeWpzak1NdjR4U1E5NEpmVW53amk0bkVXNGJDZ1NSYXJlbkxxNzhK?=
 =?utf-8?B?bm9wUHFxandqbGJJSHp0OHB2L0lDSHE5dVArbjlpMkVlWTdYUW45aUlBQ1B3?=
 =?utf-8?B?R1c1UEJBL1Q0NE11Y2RBWDAyOTdocytlcWM3ajNwYnNmQkRpNElDay8vWWIv?=
 =?utf-8?B?bTBBVll4U0NMMnNVVWVUVWtSRHBjME1ZVTJOY2JJWDhhUzNVa3ZidHNsc2Js?=
 =?utf-8?B?UEo3a1NjRUVwb1M1L2VOQ09GaVYzWTZkNDI3cWJOYVJxWHJqQXJQRW1EaEtS?=
 =?utf-8?B?RXhxNGhkMkkramVSdkJRSGxPamtHenVHdUx4TXNFeCsxU2hjbnljLzg3V3Er?=
 =?utf-8?B?a1UyZTRKOEJkZUVNaHpLcmtuREgxTVltK2QyYzlTWStpSlpLN0NJeC8rOTBP?=
 =?utf-8?B?WEpmVSthaHBnMnRhQUtRa3RYdWs5ckJPaklISklMZ0xrLzBOZlEyVVY5c0p5?=
 =?utf-8?B?NFBsTVFZQUtFVVVDT2ZIQ0NMOC9UdWtpMDJsQy9SbTBZY0RlampiTzJ3VGd6?=
 =?utf-8?B?WWhqUW1mdUk4ZWxOdCswZVhkV1BxTW9jSWJLQ0JxWVFPUmdEeU9yZXdjRVow?=
 =?utf-8?B?UStqR1lBeFNmd2ZkRHJnUjlrK2xDc3A1YVBLV05zZHBzWU0xY3F6NE0zYkZT?=
 =?utf-8?B?QlhWdERjVDFvVlRRbHQ4bDdLdyt4TndDb3p6WjBIQ29CdVVsc1J1eE1LZE1m?=
 =?utf-8?B?NEJ0cXNWYXdJKzdXbG9EZGl5dWg5em5ocmRFK1k0OEhoTFFJVGp2ci9xbzJR?=
 =?utf-8?B?d0V3OHNhV2xHUkkrVGJiV3p1RmhOdjZodHJSVjA2RnVlSFg4TXZ1Y3RaWmVE?=
 =?utf-8?B?TTBjdVB1YWVBcTJLS2djdmtrYUhYMFd1bUM3d3lISnVGd1JOeFBjV1FPQURx?=
 =?utf-8?B?dkRpM1FoVWRVMHNJUkhnTGZwRmNCNzNqdHFoWTJSQVk2ZU51S2ZFU1Z4Tk4r?=
 =?utf-8?B?SnFKSTJEcHA5blIyQ0FFR2Naa0dSSlBrL2tWSnQ0YWJwSGp1bHRYMnVYTEQw?=
 =?utf-8?B?VU4yOWM2M1ZxbjZPc24ybmFYUjE4d2cwVGUrUUtuUyttbEgrM0VvRDR2MXNZ?=
 =?utf-8?B?N3Nhb3BHZTU0bi9mRS90YTQzWUwrdE8wVDdtYUY1NmZwZEU3QTdnZGhtcng1?=
 =?utf-8?B?MGgwWVlXZ1JEM0VvWlFYcWFNaC96ZW9DSndFVmxESlVRMlJvRmRBTmtZbHc0?=
 =?utf-8?B?S3IvZnpFQXZDZ3JPeFBiOG1sdW1DZHRhcDVGMThnMzVxMlBzQk16MW1YWG83?=
 =?utf-8?B?aW1HdGIvUXNSazFYN2pKbjB3SW1US2YyTlBtbXVhUTVnTzhCaHoxU1ZhQldU?=
 =?utf-8?B?ZkJxaldmTHR6TTVCUEp5TWcrWTRWYmdXeEpIdUdvK3hRTXZUQmlRaHBmeTV4?=
 =?utf-8?B?aFpNd3J2SHlmUDJHR1RONUZsK0VSUkRiVnNJNVdHcTY5SEtJemVRMkd5bHdR?=
 =?utf-8?B?TG1Db0s0SXpMRUZJNFRwS21Cdk5nYys2K2ZJRTdxUEE5VzdJcFhSVnMvcVJC?=
 =?utf-8?B?a3UxWEFVejlmYmx6VlRrWEhsdStDSm1xRnlGcFBUSW1QZW5XbVpWSEVxNnF5?=
 =?utf-8?Q?kjRQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVN1cU1yZmwySHVBOGJ2QzBZWFVDOVppM0hXV1hQNUVoMEd0OHllWlRET1lt?=
 =?utf-8?B?angzbHBySTMvUWFKSlFKVnJkQ0dUNTg5ZjVWK0gybU9DTkRqdCs2K1VFaFhI?=
 =?utf-8?B?RDJ6K3RLN0ExYlUyTGswVTU1VTRzczArempHekxoQ2xGTGZ4eVl3bEgzaUFW?=
 =?utf-8?B?K2NLOHNDNTZSSUw4VmxZakVrM3JNK1BJQW5FRlBQZ0pKNkI3M1dTeUZwRVRS?=
 =?utf-8?B?VGRqcUhaTmdFZ1hVUnRjUHBmU3BBRG9FbWZsa3JTYU1OQjNZNHdwR0VvMkxK?=
 =?utf-8?B?YkNEUm9vRHZxRFZKL2pOYkhjY25IL0VTcFUvdGZnandXYVhMeUkyZm9GSWZl?=
 =?utf-8?B?bFBMc0NoWS82L0NQTnU0NDcrdG44VFR3cjZLNnhMY3NyWkZmK3E0amNGbTZT?=
 =?utf-8?B?RzR5K1ZyUVVjcWRXZzVLVWkrMmFtVmFKbGRqSVlwbklXRmFXM2FrL083R2pa?=
 =?utf-8?B?a2Vwd2lqRDhKNis2L0FYTi9IRkFlR3JOZDhHOG5uODdBbzZjVHV5cDgwNFBa?=
 =?utf-8?B?b3BwZ0gyOGRIVUdNWW9XZyt6OWpTSWpCcGh0R3VJNElURjJ0aVY1RlYxeGd5?=
 =?utf-8?B?SUMwUVpkQk03dy9DOVcvTzI4S0hXSnFWV0tHbHZMYmVNSFpYMjNmcGFScW9Y?=
 =?utf-8?B?bkc0OURnWDJMbkYzbVNlSFA1Tjh0R1M4RjRyazNFbjYzQ2lvUEhpa3Z5RXZj?=
 =?utf-8?B?UnBZbXhpNEJXMDAzL0JRdyt6Yi9rU0pVMlNuRW9KWDBJRDR4dkUwWTFJV2JI?=
 =?utf-8?B?Q2twL3FRTGtOV1AvQWZwNFl0Vi95cWMrOGVsQ3lkR2JQcU8vMXV1b2g5Szc1?=
 =?utf-8?B?eDQrRFhPMnlZdkN2SEhaK0FBS0o4Z1lqOXVXemVvdE9oZDN4VlliUG5TVDJj?=
 =?utf-8?B?MkdnNnovclhTQ0tHWjREOVcvOGh2TjNMN0xTWXpWOSt6MDNJMjFmYmVrNDRQ?=
 =?utf-8?B?UlZCRVJPR2lXNE5jY0puT1V0eXBuQXlFVlg4Wlh3WTErYXhNNms3L3puWGRJ?=
 =?utf-8?B?M0lHaHovSFB0dCtrcm9UR3cwaGk0RmlxcmJNQjh6bm9ZYjZtQklvT3Z1WUo4?=
 =?utf-8?B?YzdDZ0JrNll3cDVYUG9qYlRQUGVYTFJyeTVEdWJiNUV2cmdiTUpjcTA2MURB?=
 =?utf-8?B?ZTRMbE5jRTRsK3ZTMUNvUnhWVzNkQ2liY1pUYUhwakNKTmhLN3M2NStIL1lM?=
 =?utf-8?B?ZGpNUi81SzRUMnh3eVBjbFBpUU10Ry9Qd015N0h6U1hwVUFtRWF5cnhWUXh1?=
 =?utf-8?B?VVZYTXp6K2VzQUF4ZzFjNVRVSXd4MEs1NVV3RGorVlhPc2lKQWl1WlE2YjhE?=
 =?utf-8?B?aytxcFE2blh3ZWRTc05wOHA4UlpsdzJZSEFya3A4M2l3Z29XYUJweXBDSVpq?=
 =?utf-8?B?SG54UC8zOFRka09PUm0ra29DQmc3THlFQk1oUW43b2JidVEweVByMHZGOFJU?=
 =?utf-8?B?WHJ0V2FreVBoTnQ3SCtLVnY5cXZ5TGpRL2x5TVZYZlhjNGplTXIrYzY1SFZx?=
 =?utf-8?B?WGpKQjVTejFMcW1IeXdOODVkSjhPMmVBWU5GaEZRcHB3WnF1SjFqck0rQkNV?=
 =?utf-8?B?WFRaWDhaRWttc0U1TEV0blZ1V3Nqd2llUWVEZHVCR2ZsUmU4aEdLY2lKQzZT?=
 =?utf-8?B?QTVwS0p3R2hlZG56aW1HZ280UXY2a2xQeTNTNHJvTXJqOXdJWXFyeEh1dWhl?=
 =?utf-8?B?Wkp5RnN6dmhpbnNiNG5uSmQxRmFvTEVxcDBaY0VZSEtFRjBud2JBNm9mVGtj?=
 =?utf-8?B?VEpzYk4wNysxZ3A4L011NmU1UmROWXRUNnUvSzAyWjdpNHpXdTJ0dXZBMFBQ?=
 =?utf-8?B?K2ZlMitLSlAyUnlRMTJGT0x6RGtXakdHZjI1cXZZbHNQaitkVDBxTHpGWkl2?=
 =?utf-8?B?WlUwcUR1SEhmdVFDZkN2UC9IMGpYOTVEK2U4R0JrWFN4ZkttbXVLSDJuRDAz?=
 =?utf-8?B?NTVVV1F0aVkxU293RzF5THQzYUorcDdVTGNZRVIvbDNUWUo0ZVM5V2hxN0xp?=
 =?utf-8?B?L2Z2V3lRY2FPZ2RucG8zRHFtQzc2MzA3bzk4S2VVZEhHb3liT2FvazZXNldx?=
 =?utf-8?B?V3p0c3ZJRzVuTmErL2RHRGszWUZTaVVyZWZpYnp2akE1ditNRkhBelVuNXhT?=
 =?utf-8?B?V1BmbVVrdHdaUUQ4VFQ3YTZRS2VvUVlXblFUZFpJN1I2WExhVTBGNFNZRi9i?=
 =?utf-8?B?UkRtLy9iMVhoZkI3UzZwYVJKa1ZqMnYxTTBObTdmMTJMYVV4Q1VkdkZ3di9j?=
 =?utf-8?B?dGVua1pQb2Q0MHZRRVdQWStIQkVZOS9PTGJlT1ZCUnhQV3d0QmJPczZKWEZZ?=
 =?utf-8?B?NUdLUHAySVdoN1Via2ZxNGVaMkhSN1NWT1FhWUkzMXdZUkM0cVhvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693dee01-a3f2-400c-1640-08de68b6a730
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:11:23.3934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42AxuKpvNXNJPMc96JFGVtLifNySImIWQVyp0L/PElslkbhBJllSYo0avbazhuGeDTuORVfVcPgTRfjo2ojSvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7955
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Bertrand.Marquis@arm.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0649E11C52E
X-Rspamd-Action: no action

GNU assembler will consider '/' as the start of comment marker on some
platforms.  This is incorrect with Xen's usage, which does use '/' in
assembly files as a mathematical operator.

The behavior of the assembler can be altered by passing the --divide
option; unconditionally pass this option when available to force the
expected behavior.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/Makefile b/xen/Makefile
index 31352d4cd260..eee0262933a7 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -405,6 +405,11 @@ $(call cc-option-add,CFLAGS,CC,-Winit-self)
 CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 
+# The GNU assembler will interpret '/' as a comment start marker instead of a
+# divide on some platforms.  Pass --divide when when available to signal '/' is
+# always used as an operator in assembly.
+$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
+
 ifneq ($(CONFIG_CC_IS_CLANG),y)
 # Clang doesn't understand this command line argument, and doesn't appear to
 # have a suitable alternative.  The resulting compiled binary does function,
-- 
2.51.0


