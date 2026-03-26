Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO9HAyosxWnb7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:52:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73733583E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263995.1555746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kCT-0008Od-Fo; Thu, 26 Mar 2026 12:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263995.1555746; Thu, 26 Mar 2026 12:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kCT-0008Lp-CY; Thu, 26 Mar 2026 12:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1263995;
 Thu, 26 Mar 2026 12:52:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w5kCS-0008Lj-Cu
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:52:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kCR-008nby-Oo
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:52:35 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c52c09-5cb7-0a2a0a5109dd-0a2a450785b4-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:52:35 +0100
Received: from [52.101.84.96]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c52c13-fd74-0a2a45070019-346554605367-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:52:35 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AM7PR03MB6231.eurprd03.prod.outlook.com (2603:10a6:20b:142::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 12:52:32 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Thu, 26 Mar 2026
 12:52:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BL+uEnbNmZTW5vkimSuXlbL6gIoR20d0eWdWyo6d9XOxVB+SCOYYdUkPsK/72gmS6JaYLCRSLZXkqq1hoPYMC1lGw0S+2Syg98RYe1CcmCHwOQzZOrJ3fIYtOwt9iLPCVdJumMb7A3a2OIXDKugeoVbuhbfUSkhsX4oZ8K5BwWBzF5DjcfS01tmjFOCwAqmmZD5zlGHuKRDgAOzdjhY/wmczMfEQxUB9F17MG5bu7ljd/nrqKqT9RwMC+RQNK4e8MtKFc888WsV0fFkGI7ZEZxqA/uYmXSdXCvf8r6et7Ij2DPLPldpJt16ka7Fo014FzQXx3iK3gngiiCJVr9IxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aS3sAu/k4Lc1ehYXV1vzfqBBW+7QOEyxPsyXQPrnr/4=;
 b=yLXhf4r2KqO/aeeU+dL4i/DgdXKWOeP1LqCSSufKizAO3tYUUPGrYO3zz+T+RbBeIIeGKIeXSJ/+rAUifRoNQsQK2f9MRJCDqVeWRl+WN8bFZJFB9bVI4RoOeynk2hnNqhzuHDvh9haW6/UYs/nGkU51kbhNijKzHomfh5+bdmGRMqzOQyxPBPSCgAlrV5cgVdb2DGSAiu5fiFNsxHieXvXklzteZDxFNA5BbD8dbdDedR+3O90N5Gbc3/OpeSjODKLXchM/CkrhKelFe1S8fvShH6PpgTfqm7v1Mn2jRmnSjJUe2evLpEB7l9F7khrPH97eiFQ+hI+GC5w6Yfe1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aS3sAu/k4Lc1ehYXV1vzfqBBW+7QOEyxPsyXQPrnr/4=;
 b=jCRL/55r7WfwaVfoaSRU0Qb7kFElGMPq7rZYpq7wtttW49MhedYfvhiI5JCnrfCS3N6hBDnF34W2xO1mQrWKZ0aIFXFlefK6Eamxe3qVlhsOhn7zJNCtjXQ5CUQlWhvlNfdzr/rzbBLPYrwNi4TQR09c7+7wFkFIKSW/2RHN1SKcXctOO16DwOymMsX24xg3/bIvpQ+7FUWz+miahSEZEiedyFAFQMd2AawsA2VqjkBkNnm1hirs5gNp+f46ieVbAgZHxLC7LJYYzqMtlh02TgpKSsGUUFRuHiv5sq7+vKoivKwe14lx76O3JDtoK4dIgVc+RyL25Z6qCzRdg/KBRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d2256ee2-c7a1-4e76-aa82-9f2766209a5a@epam.com>
Date: Thu, 26 Mar 2026 13:52:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
To: Jan Beulich <jbeulich@suse.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <f20ce7b6b230ee234c9a278a6d69330f1abb03c1.1774305918.git.milan_djokic@epam.com>
 <fefe8733-e997-4eb8-a2b4-66975ff46b47@suse.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <fefe8733-e997-4eb8-a2b4-66975ff46b47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::34) To VI1PR03MB5088.eurprd03.prod.outlook.com
 (2603:10a6:803:c2::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB5088:EE_|AM7PR03MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 262fef56-28ac-4415-42bc-08de8b368bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IgvrD+dz2yolYBnBNw6iH4JUV1eYkJBZf24rhxKfQS94V7YPAasmGUvCCFv5qZZ/83Y2Xt7/zFjeU1DALIB2NWZysQo2JUj1Jx6t8ANC1z6OLz8w7pN+oytlOlOKEcHPu/WOD4fOh4G9fQVH/KlySU/2TlfG1dmuqukoPpGShVvMkqqKL51GZu7XxvdmFIrWMXxSOd5dLSDTL23bNfRlFIyTAGh7i73uNVrAikI5NbV0/lkMOC7nyR5OAJAEtqS5Fhrn70g5dz9imQ3/bUTS2C6WqFRN8qv8yF2MV/U6uK/V23IUUx9qRCESAuaBh5DAHmCA5vT5D7UE6fJyyVa7x895uLN83Madu4BUEoZ23PNvGjC1811OcT068GGMVlu//X58dNHjWWxtz8hAnWebiRT2L42EqF8E3rncXsYQTAA4PLh0kWB8Pf/9u5o90hmtu2nZQjOXh31FIL5Y897MfkNn4qpxSYvr9XZ8IXRRBwPZJABhtRRRsahVqfEGk8e0r5+Wn3ZV+eznT6CFhmq0+uM0ZOKQkfREG/UAgIrX/sogYwT60YwB8yl94HZYm4t1IrmwjCgz2yVPgyRL9M84BxpIchyJCYgNvcpigqemiVvceM6OhM+MR57uVG56XbW0lH4ZQz8baGdkhvqonAz/dUjxSgCs2gsFdUZeMTx+SRM3JJD3zzpmaIVCwuzGQoyjdRo9nZuUMKaEyEg8nQrLNgqXY53WbB0kgYq2BQq3JO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkNIY0xpTU85K0U3aWNEOW5WZHd4a29XSEI5ZjdzY1dOMTFhSkFmVDNwRTQr?=
 =?utf-8?B?QUhCUWM4TVhBZHFDb1NFT2NlR0lvaktzQnhmNlBTMGpwaUxxQXViMUVhMjBw?=
 =?utf-8?B?Y2NKZ2NxeUlHRGppRmpSUTRzZnJYVEtGZzk3SC9ZS1M1bnVMWG5aT2Z6SHFk?=
 =?utf-8?B?OUNBa0xIcWQ4cEwvTTRZUHdXM1J5NkpZL1dIL2lEZnRsbDlPMjhOQ3JMZTZh?=
 =?utf-8?B?NmpNYWtnU0dwZU5sR2pQTHVtWjZRQzRnbHgwVE05dWlXYTQ5N3NFMkFzS0lR?=
 =?utf-8?B?cHVmMVRsS2JYREdUTlhVTkl6eUZiUWUyR3VDVXFtaHFtcHNsNGtNa0ZxbVlV?=
 =?utf-8?B?SWhuMC9iNWRpRGRNMngrWjJpYUVOUmsxSXVxNWN5akhTenNza3R3WVNDaU01?=
 =?utf-8?B?N3NnRU5uVVpnVEFxTzhpS1owZHVHV3pIS1BDWUhWbDI1aWk3c2NNV016NSsy?=
 =?utf-8?B?MnhESjZGdTZQQ3UxcHVNc0N0SUU0dFc1YzdjWE5XenFIVForWDNjUGphTHRJ?=
 =?utf-8?B?eEczMHdGQnlhVE9PeHZoQVBVUHp0NU54a2p6Y1g5b1psdy9GSGNlRzhWYUZn?=
 =?utf-8?B?WVR0Tm5ZMEM4ZHNqRWpIUFNqNktJc2txcndtWTFwQ0IwbGlMUjdteklRVU14?=
 =?utf-8?B?Y0RRaUI0enYvQjY5ckJvYXRjYXlkVzZmVjhCUUQ3ZWxickRFblpyLzZwZXZy?=
 =?utf-8?B?cnlJUno5R3FNK0t2YWhXNXRWR0g2ek1rSG9YOUFuWU9qVHFId2gyRHRJQlpk?=
 =?utf-8?B?b0RZNU9jNTNtK2pBNUMvc2RoMGpIMC9EQkVGdkhVdU9FbUl0SU9Vd3pzd0xq?=
 =?utf-8?B?ckIvUExhKzZSbUZFSTloTmhIVXc1ZmlZaWNyanlrSVpybDlKV2prZ0RTc1Np?=
 =?utf-8?B?SWFTNmxadW8wQzF0SHkxK3o4eC9mZjVycEZFbXAxc3ljYzR4aS81NDNvbmNL?=
 =?utf-8?B?VTVaMFZXUVFUY1pRbE1Mei9Rd3BEbG96RXBZbUZTSGJ0RnRrY3JUQ1d3ZTNo?=
 =?utf-8?B?ck8yVnllcHcvV1o5WGU3cW1ERHZRQ2Fma2Nnbk5xNFJ1YzF0UmlmeUJvamNZ?=
 =?utf-8?B?L1d4cDZVOG13Y29iL0IwVmUzMmtwM0xHMUp5cFJETzNIRHBiQnRrS1l4aFh4?=
 =?utf-8?B?VVNreE1INm1ORzNJdWZ3VFRpV2I1QnZzczhQQWFZZ05obmdFNGZSZkE4T1Vi?=
 =?utf-8?B?TnNQS3I4bm5ZRkdKeUZCQlBJaGxEeGJMMlhFa0hBcy9IVk9kK29UZDFLbUNu?=
 =?utf-8?B?NUlabXNlVC8zYmVyejUzVkJqWUp0aEJYQ2Foa2crTW1yOXVoYUtRRkJvUENS?=
 =?utf-8?B?RVRmT29EVmg3M1FHdzNaaFhEeTdOWG5Tc2VaMk9WMVd3UjcremR0OUVGa0RD?=
 =?utf-8?B?TWZWaFc3QndtU1EzVjJVR2N2TC95NTkrc3pyVWJlMUUwUDRHZ3dmWXg3cU52?=
 =?utf-8?B?OUdQdHVZWEJPRFcrNWlua1ZTalVNVUtheWttblhNbFRQVU1iNDFJeGNRaFd2?=
 =?utf-8?B?WEdNZUN3VzE4ZFpacGZ3MmdiVEk5OFVHMUcxUGw4SFc0UjdvTWxyTWxDTHZT?=
 =?utf-8?B?cEVWWDRpNllxaU1LcXFsUGJ2elh2cTNEcXZFSU9SZGY0ck5LUUZ6dWNQdHVn?=
 =?utf-8?B?M28zVkt5T3FJaUpjSjkvVW1KNGdLTHdWcENwNWJvRHBiOTMvNm1GdVVBb0lD?=
 =?utf-8?B?dTNmeVMxNWZCb1FrbndNK3c0UGVEYzUwSlFQYzBpN3pkUDVHdGRKeDh0VTJy?=
 =?utf-8?B?ckVOb0htcXR5QkhVV2doZEM3dWFPanE0Z0c1SWlqTjBEazg1SHFQRFduMGNi?=
 =?utf-8?B?aytES3pQdFVJZEx1RXZNalEvVFYwdWNvYWZiK1VMK01CRVNrMVdQL1N2cGRE?=
 =?utf-8?B?YkgyaUszdEI3N1l2V21TYUpQZlQ0WnF3Z1NYS1p5eEw4TUZHS0cxWW02cU9q?=
 =?utf-8?B?ZHpVck53akFVZUxVQUdKY1pKOVQ0bUZlbFVHcjh4SmNNeTNuOFU3dyt6eWlK?=
 =?utf-8?B?THE4UXdyUldULzB2VGFqOERHNXpuSTdjbUlBcm00bERtNnU2a3lNVGQvN1Yy?=
 =?utf-8?B?S2MwN1NSNVhxNXlVMkZUd0VPWEllMElmVGZFajl1VDgxME1MUmNmc2ZQbGVL?=
 =?utf-8?B?T2xEaVhuTm9nVXlrQmx4MUdkTUJmMUhzYWlrOXoxZEpqdUZWQndYSFVkYXFO?=
 =?utf-8?B?Rmx0OS9hSWlvSU9sQjNpa3BGMWRMc1RQMjQyRERlOURtZDA0TWJVZVp6c1RP?=
 =?utf-8?B?TUpyYTZHQndPMlVUSWM0MHRJaGFzRWRoSm40OVZTSTF0dTNNcnkrWk0yMngr?=
 =?utf-8?B?Z0Vsdk9ROW1FeTNhTk1UcklBRmxOUGYzRk5IWHM1aFJFMTNlVGVjdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262fef56-28ac-4415-42bc-08de8b368bd6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:52:32.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HUYhe0TZkFYd/Zy3jUcdcftEFtFXRaU9UyWHi3w6KmXrRh2MUeuISPJiKfccqngRi2XbAt26VXfZ+lc4829Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6231
X-purgate-ID: tlsNG-ef75cf/1774529555-554B6303-7939AE10/0/0
X-purgate-type: clean
X-purgate-size: 1270
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6C73733583E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jan,

On 3/24/26 09:27, Jan Beulich wrote:
> On 23.03.2026 23:51, Milan Djokic wrote:
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>>   	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>>   	  translation table format and is able to use CPU's P2M table as is.
>>   
>> +config VIRTUAL_IOMMU
>> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
>> +	help
>> +	 Support virtual IOMMU infrastructure to implement vIOMMU.
>> +
>>   endif
> 
> This is being added to an Arm-only section, without it having an Arm-only
> name. Judging from the diffstat in the cover letter, there's hardly any
> abstraction in common code, so likely adding an ARM_ prefix to the name
> would be the way to go (for now, i.e. if doing proper abstraction is
> specifically not a goal).
> 
> Jan

The idea is to reuse (if possible) the generic framework covered by this 
configuration option for RISC-V in the future. At the moment, most of 
the implementation resides under the ARM section, since only SMMUv3 
hardware is supported. I will add the ARM prefix for now and update the 
other patches according to the review comments.

BR,
Milan

