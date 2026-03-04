Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uISPC903qGkTqgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 14:47:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9091B200AA3
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 14:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245383.1544719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxmYx-0007YQ-Vt; Wed, 04 Mar 2026 13:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245383.1544719; Wed, 04 Mar 2026 13:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxmYx-0007Vg-Sf; Wed, 04 Mar 2026 13:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1245383;
 Wed, 04 Mar 2026 13:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxmYw-0007Ur-AI
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 13:46:54 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97140d81-17d0-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 14:46:49 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5101.namprd03.prod.outlook.com (2603:10b6:208:1b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 13:46:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 13:46:44 +0000
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
X-Inumbo-ID: 97140d81-17d0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTwTDRf7O1aULMmJhJwLYyQiSK5dLU07N7Fd1VrXe82iw71RGsn/Z0U5ZYTzXcCHKIFf4JZ4gdS90GTOZBAKwVHapd0H5MG078resBQLiA3LbEAvRebHNX0oA1+qeOYAVELxT/h02rr4PIejZTI7xFoA3DIjWe9inRfKMNNY9neVGL9WOZJwTvhOY+edpbDAiU4KyihGXuuetcqETJ9B9sQlPMSnsYJ/XXu5e9boX3K/mfcRA6Fjo9Y7E4kbR8FRWfbvud3MfwIbN79RBUxG5Yoj54qxW4N4BdWYOGmTkNWJk1uzctnQgyR57s6a3hkPzqAoAaaX3K3mSfQ+Tr0C4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxei7N0ZENe5GUPjpfgHtnam0kPoo4xnJveyz9Th7AI=;
 b=hlF+GGh5ZIlBlP+/Q4QUVwhjSgNQVjp/IWM5A+vT2V90SvyPhXasYe688PQojwiSk1FMnHJKy/fTnBXw7fewXbTGHaVCDq6oGcmrdJy500xwbr6JscRNp8kyMXkx6rV6ZP5pq7mIJtbsNUcDyTmbj53x3Ij+0BhgEZnEyxu6XGmjnOm967SDi3t+UZNBOWvOa1pVrs4Xx4UkIWb1u+Bp7pRY0X6Ve5jMjOJ1zPJQR5k8hhwTZA40S4mfKZFtKGLMEa/+GPtKf8cIV4qT674/5FIbl0IsWSVv3O8H1R8UrNp6ehXGSa0ABd1P4Bp66bE1MgrVk58VT0Xs97A2+ZV8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxei7N0ZENe5GUPjpfgHtnam0kPoo4xnJveyz9Th7AI=;
 b=TaZBl+7OthGxbZtDGYYbGaKnNBl6pTF5KRiHeqprhf56Id/7h8QKUcVdcg1npMGrvC0HkyO+GS7cHpR/Kg/hMWZ2I2UGSEPOChLKTb9GxtIt7R1sBFHLbCVdprtZVQ2tknfDuKLA/1KMVUYeLECVBTrIiDNgFaQb+eXha7aQ44w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 14:46:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v5 4/5] vPCI/ReBAR: improve cleanup
Message-ID: <aag3wflbZ6k9oEvx@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <252e527e-dcb2-4710-8a43-070c49512e00@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <252e527e-dcb2-4710-8a43-070c49512e00@suse.com>
X-ClientProxiedBy: MA3P292CA0070.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e62419-3e62-46fb-a17e-08de79f47946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	i/c60Crv33QwZevC5zmRLM9uaOFQ3UlccD6dtg74LANfuH8Qqa/eYCGRrLtI7zt7fFjFShJXhsw1tdKfm1zoyEcSZNhBwNrwf7T9mxKIZTrWoNZlqvPhHPn1Ggg8gjydD+mvfvaMiaiRtLYKk8WsGc99yFve6iB5dbeymVETxLhOhTk+qyRrMqcwj8ktwz/ZDjkh7MCN8BNtZVJldUH7Tp7Kb+YiwL/0sz85IDPDAWdg0cZCZkFLb5JE2fbzRRRFupYyCpDMn/0tZPKTXdVjGL3IvtbctZkKEzabs9K0zBZMX7JmqCIy6j601PGygNFN+jHWGBICZ2E76JSDGXIh4dG86fGQoaR2ufhNSGBJPBK9ZtKoAKV0WyQf2tG3xCurIZomxPPPrYxJ7+8TVeopfkqDyWV5HnqC3XB9iGy99Z2CbyPTgPO9Nb/fh+6rC0nCsNwBpXp22E1WoR0+65oSYfhK6hkhCJP8heWPJA8g9mveNU8tp7GfEE4ZF4WIz4I68DSWyX/cDax5hthbcAEv4Prr7hdOyLY4oTQ0uvBOdqABBHXCMLM/MVtWipYuWv9YKC2Q8ce921gF4K/deoXwW/pJR6Sqy4fybAPnL38WopsLQp/oh7yEQbShlUSvk3SId4hRZyyfeXB9Y61T+5dH1cLklOJA4/gR0pU3HyiwVnvQxML0Cer3ojkbBHqVvs310yuYP9M0X2bq3ynnof/R8khUd7FL6sWrnsBiwBxwC/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXZQYk04T0hiMFdxcWNHNlQ3a3dhRGFwL3luSU52bXJWRWk0NHBOaEJ5Wmt1?=
 =?utf-8?B?NkpLOWxuQVFuc1dibXFCaWVocENoZjBERkFFOWRDclUrVFB4cEZ4aThmRkVx?=
 =?utf-8?B?Z0tlYjA1M3gyU25YaDJjUitqYjNaZ3pSRnJTU2hDMDRmMkZENmkzVjVId3Ez?=
 =?utf-8?B?Yk1iQU5hTFAwd3pPbGRiL0ZyKy85VUlDZ0pKbklQYVFXUmZlVGxTTFFDbVds?=
 =?utf-8?B?Y0V2eGtyOGNUVnFWSVhUc1RBbGgyVkpkRVZnOFhEVkNoQUxOSEpaVGQrdnVJ?=
 =?utf-8?B?SmJKcTFUT2ZvVFJlRUNGZkhIZlYvUjdTeFlnUE5kVUxDcXBLNDhFWktiM0Vk?=
 =?utf-8?B?Q0NYS1JkQmNXR3lmNnZDMVRyR0dJdHI0Z0c5MElSNkdidlNXWFluallwZ0Ez?=
 =?utf-8?B?OEhvWWNzbzVIM0ZPSlRtbHZRUUh6cTVwTGY3YXQ2REJ2VWMzeXNGby9mSkJD?=
 =?utf-8?B?S2I5OEdmbUVoTVNWeE5HUld3bFRDL2VhTXNZY3dDZzlEUjRRNFRnNG9wQ0pT?=
 =?utf-8?B?Ykl4UW5tV2RpaFJGMVM3bXcyek12QTh2MlQyTEo5S3ErdW5IZFJRMVFhKzgr?=
 =?utf-8?B?UW93QlgrdHJJR1lxMVV5UDJBM1hwYzJzNEFjeVpsYUVQbjNaQzN6WTByNERH?=
 =?utf-8?B?ZW1qaFpUcTUwRVgvdXBQOVhiZ1ZRNGdzR0tyTUlHc256b1hkMGdsSW5NRDVO?=
 =?utf-8?B?V1hmbjd2V2Z4OGFiQzFqM3pQeFZYaS80b2JOYVhvUVJxeldhZFM3Qi9kb211?=
 =?utf-8?B?VVE2czJsMHIwZzFqSW9qclE1ZFNSZnBKYjR5VXpYa0IxdHp1YlRpdFhHaWxm?=
 =?utf-8?B?WVZaVEI4Y1Racy9ZZ3ZySC83OWZLZ2szVXBydHRDK0E1UTVuWHZnbVNIcW9H?=
 =?utf-8?B?R3BoTEFBS1JPU1ZjdEpYdGpLQ1ZPRC9RVm8rWkk3VlgrN2Q4TG8raEtDbE5Y?=
 =?utf-8?B?SDFabUtMdWdUdi85UGg0V3hxVGdNbG1jUFhUYjZLOUNvakNucE1DaGhHTUEr?=
 =?utf-8?B?WWVpUWdreEdNNXFkWGczZVJVQmUwNWFpNXg1VmtvQjRkQ0xISUhvOGp0eWNJ?=
 =?utf-8?B?TFJCODVDd24yOFJ2RU41MXIvVm5RTWdTQlV6QmVwRlErOFBqVjd2R1VndmVo?=
 =?utf-8?B?c0daR3FHYWxrdWJ1aWNKSnFlTnNQRDluWThhK2tHVWErUjZRQU9MK3hHQ3o0?=
 =?utf-8?B?a1QxYSs5QWZLak1PeW5TNGpFdjFqM3ZVRUlnbzlpU00yaHBOQmI3d2llR2tO?=
 =?utf-8?B?V3ZYVjFKVGpTUnFVRmM3cEhGb1RvcTJTbEw3MlMraEM1a1VYWTM4b21EQUNQ?=
 =?utf-8?B?VlV1MXRpam9NYXhZSDRxblprckVQcWxSeCtsY2lHbURJWjMyczZrZ1RLMG1l?=
 =?utf-8?B?aHFOUEpCVGhnKzlORy8zOFZpZkxOc0dLRUVsekQraFN6Z3ZMZnRRNElJemt4?=
 =?utf-8?B?WVI4SjRlbEdySnZ4WklEQkRlQ1BxektuNEpmMVJ2UmlPWCtiZjhjRXE0MTIv?=
 =?utf-8?B?R09hbzN3aDc2ZVRwdGZnZXBJMVAzakV6MzJ0UVc4Vml1R0czWEhVVHhiLzJ0?=
 =?utf-8?B?KzRVSDBPN2RoQzdya3hEZnZXQUJxdWZaUlRnUzdIY2NCUjhtbnFyeWg0bElj?=
 =?utf-8?B?VGJhZHBtYVdkQlVhZE9IczlmQzljZnJwZ0M0QlZvT1M3Y0cxNkhGbEdoWm1l?=
 =?utf-8?B?T1BXL21JTWQ4blpTUVpwUkI1NkE3QXhsL3Vtci9wNlRlejhyUHlGRkJ2a3M2?=
 =?utf-8?B?QjhMV2JRaDB2QldjdWU0aC9BOTZxSFI0N09OSVpaM3VrOGt0WlFEQnlwZngx?=
 =?utf-8?B?eURkdGM2aTJJUjlhQXl1dUMxaDRGNXBrTVBHa3U1bWRkWCtoa0VKa3F0eHNY?=
 =?utf-8?B?czdVeFVMbHhVMTJxRkdqR25RdE9vWlU4UlpSL2pkTW5lTTBuRlZFUFEvbWQw?=
 =?utf-8?B?ejJkZi9LNU1jMzM4bWhreVZ2bTVybGlIaUIrSTdsdnNTb1VOOWRPMldGaE5B?=
 =?utf-8?B?UUU0MzRTQU01cUV1MGVEMzlXVU9lZ1llZzVnTG85T25Ya0NVVkVRaXRJUndn?=
 =?utf-8?B?Wk14QUxYbCsrS3B0ZUhLZzE0RUNnUWtydFRLNnRiMG4xOTczVlpma2JCeW95?=
 =?utf-8?B?ckJOSTdsZ2tDSlVsLy9IZkcvVXlmQnVOUm9JYTgrWU1uYWJOdlRDWVE5N1ZP?=
 =?utf-8?B?UFozMFpYQ3NvZUxrZHBxWEQ2U1diMS9aUVpPMmVvYUZyMmhrRDhGV1AxdWky?=
 =?utf-8?B?NERrWHVLNkRYQlNvSGp3L1pBdmVzOVNRc28zbUJsbFZLa0J5cVovWEJvWUJu?=
 =?utf-8?B?VmE4ajkzYk5oelFBR0VNdktONklCRW0zZ1NENFdObEMvYXNXQmhJUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e62419-3e62-46fb-a17e-08de79f47946
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:46:44.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RXcfnpwwdHmp+/0L1kutZ5Q2tCOCtjH943xffEq2uI/VrGRYC47yt85AVKuLfm+wYdTQF0dOLIrGnBVcH4XTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5101
X-Rspamd-Queue-Id: 9091B200AA3
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim,citrix.com:email,macbook.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:44:22PM +0100, Jan Beulich wrote:
> We cannot assume extended config space to (still) be accessible when
> cleaning up. Necessary value need caching instead. In fact, as the caller
> also cannot look up extended capabilities, the cleanup function needs to
> cope with being called when there's no ReBAR capability at all.

I see that you adjust the code in vpci_cleanup_capabilities() in the
next patch, so that it also doesn't check for extended capability
presence as part of cleanup.

> As kind of a side effect nbars being 0 (which init_rebar() doesn't
> explicitly reject) no longer results in a bogus call to
> vpci_remove_registers().
> 
> Fixes: ee459aeac096 ("vpci/rebar: Implement cleanup function for Rebar")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

