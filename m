Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IABOCprcBmoxogIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:43:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3854B991
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 10:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309737.1580789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNo88-0006dJ-EN; Fri, 15 May 2026 08:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309737.1580789; Fri, 15 May 2026 08:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNo88-0006bn-Bi; Fri, 15 May 2026 08:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1309737;
 Fri, 15 May 2026 08:42:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wNo87-0006bf-9M
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:42:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNo86-00CYOa-Gy
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 10:42:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a06dc86-5cb7-0a2a0a5109dd-0a2a4502edfe-0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:42:46 +0200
Received: from [52.101.48.65]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a06dc84-af86-0a2a45020019-34653041f8d8-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 10:42:46 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7584.namprd03.prod.outlook.com (2603:10b6:8:204::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:42:42 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 08:42:42 +0000
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
 b=iMd/0yQLB/Ccq+Yz1CzdP2bY80Kp9fJJ4auiRd8ZbjPhk5oEL/WLSAoPUaXN4IQlNPfvE7hyu6XB45zAi1utEojOrFk90rgpl4P/pZAlUWIDnFs6h5PPpnaIER/b+NONBI773n139/Ug8h94XpVavaLXLqhwNy7y3yIN4PKIz0gFL54SjZhkNXZzL+l5wMYECG8QkpLkx6wgAMmtj/clnKxBLtNXvtTbd7JZW1xDFtXK93DAMC/Pp6uRW/JbtbghHKMQwqhdxVwm44O+ojiwG78LAQvRFnXQGSg5yaTwRFEdLGQq+9HUA963FjNiPXAqEJz24NjoAwFd5LJPuMknmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE+sBv0E4K0Fx/gpv5zy0k/b/MMzyXvI87ZlKR8nbz0=;
 b=aLPCQcwDPpvvq5ynwRUlupp8NTkEBKVZgcUcBtDlB7dZX7DZJ/s78LD/Q9RTH9iR6+EiD9MUVJERh14074YOMI/yBEIcFXVzZ469O1cED7/Q4SehV6hBNMp0w7hiqrUnJJJIKHRmf2eJBkNRBVNPK48gp6G7KbAmWeSCfbLQxE3+USZqZ83POV1g76N7S9/NVi6C10NABOObkftnQnsnuNgJh14+2RO4ApL1KtwplzYnHHYm5hWcxTPBsZWWpIaDljr2ULs3PPgYhECrlQIuVlcYUAPvr6DE8IP1Bpxvaf5OEtoPd1gkRixi2zBoKDGof1G3NImzOPQH6k1Sms0aEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE+sBv0E4K0Fx/gpv5zy0k/b/MMzyXvI87ZlKR8nbz0=;
 b=OW6ieNAf5bcViquC1qbDjlwGsFYsL+Qc371VoXXppckw7cm52xk5/aE63jCbooLSUapO2aNCebIoak7fKdzxhWJEh+4jm70CYOGgF9dZ9iMh/YDEHEK/yVtmJhEqadQ1tWsSZEfpow1BUj9noDQJ2duvfFJ5wOjyQkoemye+Np8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 15 May 2026 10:42:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 3/5] x86/vRTC: support century field
Message-ID: <agbcfy3TSg7dpkkx@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
 <agSJlh8KQ9orL6wC@macbook.local>
 <17a25f0e-91e3-4e09-92ad-21e7dc0ebe62@suse.com>
 <agSVa3uPHSZrszjz@macbook.local>
 <439d03f4-4ebb-4bbf-a1ea-324156bff9f0@suse.com>
 <agTTtrSm1tBnBGK9@macbook.local>
 <242237a9-6b9e-4580-8936-aa61be6b0636@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <242237a9-6b9e-4580-8936-aa61be6b0636@suse.com>
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a965d4f-2752-44eb-63fc-08deb25ded96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|11063799003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	5Bvl4t+YI8JNSc+xWDPGgVKMeSofg++R1vrcuHdAHMZRLQfd63z3fY3yhG5XeECd4iwKCpTWrOROoPzaMj6WS3G9YvxD2B38ygRcIVv2eMdpOI1iKhPHkzmTR9mqyjGLz8rq5/Yi+sQvrsmTV5Wik8WGs4RUIK75KwqVlNeQ03n11/l6sKkx2Am9ppjX+IflFh6RLbRIejqFwA9+f3Gwspek7mM7dguqUgzOMft35TbuW71AmolyJm3lb310tPmXdX2irK8q/4BUU7gUhzKeRPFeeT//Xo8nDIaiCxKBNLrADGUeZzuoNK+w/MUGXeOIfSMst1yXhzXKDrf67vG7e5mWR03cUx6zq10JAJ48MoME/8MVUazg+YewiY8Zp9bRRgabKbK+dYncw/kRFy72aCp0KI0pYRgqW+ZH8DhDo2tFn1rSTVmdSGTtm6LL9/4gZsgjOTZol+oibOrQwtfl/CnOQraL8xWxM3HsIAeNo6b7wuoeEOTkKt2pSdDZleCvlLdqpHmDOQBY8/IDRvaK1R7kdVlRHNSakZtWwr01sufi3XuBP08qIJ+oNR7tp6HkeM2qweaYHsusLbZQlIZW8hpuAlmHWqwfQI8b67F5u+cvXMS9RCMp2DF98u1V42Hjzptb9jesITNgEk1E9tSjKc1J0ifddEKxya2eOD2rYDyRmKw1QKt0dymZpG2WodJj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2MxdlVxek1zZnJiWkdZRTIzVFdkMlZCOWZmcUpxWkpMT3AwMzg2WHVBTnlv?=
 =?utf-8?B?NjdaTU10bVdaUmFVdFUzNGpFSFMxNzQxMXVocmlicTBGME9PZmdMSzZ5aW84?=
 =?utf-8?B?WUZwNll4SUZWcHZ5aGNoVlJaSTRzYU5XT2Fvc3BhRHpWYzcraEZQTE9ibS9S?=
 =?utf-8?B?R2Z6eElUenNHa2hSQy9kU3BHU0hEYzNvbTlJUUczZVJtQ3BtUUhCY2h3eFNm?=
 =?utf-8?B?RnFZVEVNZ1A2aW1sdmpVWEhmcnVVNUV5eUlVdWZrNWIxNzc3L09KNUNEZlBS?=
 =?utf-8?B?eWFwMDR6NklWdzBMQnpaenBZamNxNmdNVWEwOEhFQmo2NXV4bTJOQml0QUFq?=
 =?utf-8?B?Tm9iRXhnRjVkSS9yVjl2dUhCQjhMbXJZOFhlQXhhaTJ1MVJTTzRqYXRUZmh1?=
 =?utf-8?B?RHNRS3lVUGZCNVpYbG1tR2NiT2pZamRucHJBSEowcVMxRlV0VFpYb2R0TjJ4?=
 =?utf-8?B?L2k2bkszVytybGg4ejcwZlUvRDRBSTBTQ3c1UDVlSVV5YmJnNXlqc2JXTTk4?=
 =?utf-8?B?K0MvbjExY0p0anVxK3cwLytTNjlVOWFXeFJORVlsY25ONzk5dGFZTlRrRUxH?=
 =?utf-8?B?NnNicDRoZVFzYWlFTkszeXovRUNUaEZhZkErSG5VU3NMUE9ac3VUTXdjblNv?=
 =?utf-8?B?SGxXL1hwS1hNMmY0RjVVcnVkL1pMSXF1eEtrQmlGMVJsTVd5Y3o1ZnhWcnh3?=
 =?utf-8?B?aGNYWVYrVk1zNWR0Sk9CeHQrTzJBRmdFM2E3ZzJ1MFZmbzR1bXZ4SGtWaXQx?=
 =?utf-8?B?YWhucngwZUJuUjB5YWVYWnlRQ0NWNVp2VUtZbFpCVGUvNFRDUmpaL0I0L1kr?=
 =?utf-8?B?d0c3bmdtalV6MDUvbWdocTJhTGF6SDh2anZJZUJSK3JhUWNDdERLT1l6dng5?=
 =?utf-8?B?dWFURk9OOUZIYTF3YjFTNTM3dnpxcWg1d1h2bW1yNlhYdUl0ZUpRM2pnVTE5?=
 =?utf-8?B?US9sTlQwKzkwTFdDTjcyQ0JDRHEza01aYTRsYnRVSll6SkJhREEwcHdHQWpH?=
 =?utf-8?B?bzRlZlJLcmpjeGNqRW9wVXlzSU83ZkdGNXpiS1h1WUY1RTRXK3RvN1JrRk1M?=
 =?utf-8?B?NnVWN080QzNyakRIZmVNZFM2Wlh0cVFtMU43U0FMeUhLNmpGdzlmMjFCK1d6?=
 =?utf-8?B?emZIcDAwUWFhbkpFOUtWV01TTGErMVdOZStqVkRvVTVhcU11TGdERGZHN2lB?=
 =?utf-8?B?cXcxZEtFeEtyQWJCcjQ2QmlqU1c1VmxjZDdhbU51N1ZnYk1Tdis4SEtPZFZD?=
 =?utf-8?B?Mjd3dlZPalhwbXV5QThqS1huU0pHN1lMN2lCSTdkTUQ4ejZoUlNQRjkxU3Br?=
 =?utf-8?B?MlFSTTA4UU1OTC95ejlRNy9VMWpHNUVzT3FtTWZxQ3k0R3VQVGd6bWhyejRH?=
 =?utf-8?B?U0R2NUFBbkV1bEI1NW1GZjBWaUdxdUJCL2ZRYUFJSVlUc3FYakQvcTJGUG44?=
 =?utf-8?B?MERZZEFqa0htRGZiUlJlOTRkcVc4TTNPdENsWm5nZWFXWmc0WktBcXdMWTIw?=
 =?utf-8?B?VmM1d1g4R0luR240QzRMU1YrUnlVTTFUMi9kWnIvZFpnMEx6TUpldURIaGsx?=
 =?utf-8?B?aGxzV2dlV3AxR2VianpsSVJvVHRKaUhTdjQzYjBwSmk0ZzhOZjAxOGpkZmhx?=
 =?utf-8?B?SzNlWE9nR0JYUnNPSXlpNzFUVWdOY3g2TVBubDNFQ2Z4YzhGakZSNFRjbWdJ?=
 =?utf-8?B?NkFPa3ppcng0NU9YT1lXUUpsOW4vK055SXFoMU0zUXlDQXFPSlpURnI3WmE1?=
 =?utf-8?B?cy82dFVuemRzR3RaYkl6MWk4akowd0hTaElHc1JBQmNQTWtsRUczb05CMHF4?=
 =?utf-8?B?MGJMdkxsamFLK2drMGxsMFk0ZTFzTWQwNS82MVJTbXEwbHVVVFEzazRRcGhJ?=
 =?utf-8?B?emlYcXlWRG5jU3ZaYUR5ZmgwRVhQbGhIVGVlaEpwTyt3bTZyZktOZDZVTEF4?=
 =?utf-8?B?ZTZPTlF6YTI1YmZRcllxeThwaUxaYUM5RFRCZXEwYk5Bdk5RS0NGV25zYUdW?=
 =?utf-8?B?dW8yTHh5RDhGR0Fia3JKaGV3SVdqdjlYYkN0RHhmTkpsQVY0Uzc2eGRYZEpi?=
 =?utf-8?B?SFQwak5oUFh2VmJZMXJXVkk3cXV4MjdqQUhzTm1tYXRuWE82eFZ0S1RRNHgz?=
 =?utf-8?B?OHFxZitRVUNHSVoxaHl2NGZmMGg4L0ROaDJrc2pDWEpqV25UeVFGM1B1bjRj?=
 =?utf-8?B?ZWhHbFFSSlB4YWpwNnBXbkhOaFJuUXJXUmRiMldqenJQeStRS3ZGdnA5eEpH?=
 =?utf-8?B?OHMwQ2tHRXNPQi9RMCtjb0Q2c0VUWTRmSWpIcVVReHB5enh5ejBqejFGVVBT?=
 =?utf-8?B?a3BLZ0lEa1ROVnNlVU5sZXBWbENOTnkrOVhyNGx4S1NtYU5MMm5jUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a965d4f-2752-44eb-63fc-08deb25ded96
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:42:42.2575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlAtsmZBn2oezy0GUF7QrkS+IBR0HrRvxOO406BZlDy/CEZWwIfCN5qxsx8fH7sq/c/In5oIEz3Wwat29+Ud6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7584
X-purgate-ID: tlsNG-720697/1778834566-82969161-74CDD9F2/0/0
X-purgate-type: clean
X-purgate-size: 3564
X-Rspamd-Queue-Id: 70F3854B991
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:52:03AM +0200, Jan Beulich wrote:
> On 13.05.2026 21:40, Roger Pau Monné wrote:
> > On Wed, May 13, 2026 at 05:24:13PM +0200, Jan Beulich wrote:
> >> On 13.05.2026 17:14, Roger Pau Monné wrote:
> >>> On Wed, May 13, 2026 at 04:58:57PM +0200, Jan Beulich wrote:
> >>>> On 13.05.2026 16:24, Roger Pau Monné wrote:
> >>>>> On Tue, May 12, 2026 at 04:59:35PM +0200, Jan Beulich wrote:
> >>>>>> @@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
> >>>>>>              /* Fetch the current time and update just this field. */
> >>>>>>              s->current_tm = gmtime(get_localtime(d));
> >>>>>>              rtc_copy_date(s);
> >>>>>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
> >>>>>> +            if ( s->hw.cmos_index != RTC_CENTURY )
> >>>>>> +                s->hw.cmos_data[s->hw.cmos_index] = data;
> >>>>>> +            else
> >>>>>> +                s->hw.century = data;
> >>>>>>              rtc_set_time(s);
> >>>>>>          }
> >>>>>>          alarm_timer_update(s);
> >>>>>
> >>>>> Don't you need to adjust the tail return of rtc_ioport_write() (below
> >>>>> the context here) to return 0 when s->hw.cmos_index == RTC_CENTURY, so
> >>>>> the set value is also propagated to the DM, and not only the index?
> >>>>
> >>>> I don't think so. The case of us not handling RTC_CENTURY is dealt with
> >>>> earlier in the function. Whereas when we handle the field, we don't want
> >>>> to forward (like for all the other RTC fields).
> >>>
> >>> Right, so then you also want to adjust the top part of
> >>> rtc_ioport_write() to not propagate the write to the 0x70 IO port when
> >>> data is RTC_CENTURY?  Otherwise you propagate the write to port 0x70,
> >>> but not the read/write to port 0x71?
> >>
> >> I can't, as whether to forward depends on the data subsequently written.
> >> Propagating the index "just in case" is the only workable model that I
> >> can think of. And as guests can do any number of successive port 70
> >> writes, the DM needs to cope with this anyway.
> > 
> > Hm, I see, the newly written value to port 0x71 is taken into account
> > to decide whether to forward to the DM or not.
> > 
> > I wonder: would it be simpler to extend the size of the hvm_hw_rtc
> > structure so that Xen can detect whether the incoming VM has support
> > for the century field, and then avoid having to play heuristics
> > with the value itself?
> 
> It would surely be possible (and we may need to do so anyway for the alarm
> date/month fields), but I wanted to get away without doing so here. And it
> seemed pretty reasonable to leverage the padding field for this.
> 
> >  We would know ahead of starting the guest
> > whether RTC_CENTURY is supposed to be handled by Xen or forwarded to
> > the DM, and we won't be limited to use 0 as the sentinel value for not
> > exposing RTC_CENTURY.
> 
> These are the positive aspects. The negative one is that "backwards"
> migration would break with the larger record size. Whereas with the padding
> field used, it won't: The guest likely won't notice that the value at 0x32
> isn't updated anymore, i.e. stays at value 20.

Sorry, maybe I'm confused, but when migrating backwards the access
won't be handled by Xen anymore, and hence we don't know what it would
return, it's up to the catch-all device model.  I don't think it's
safe to migrate backwards, as the century value won't be preserved
correctly.  IOW: we might want to actively prevent such scenario?

Thanks, Roger.

