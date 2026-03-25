Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKbJLTdJxGn5xwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 21:44:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168EC32BF65
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 21:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263038.1555260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5V4m-0001Ke-0j; Wed, 25 Mar 2026 20:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263038.1555260; Wed, 25 Mar 2026 20:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5V4l-0001Ib-UJ; Wed, 25 Mar 2026 20:43:39 +0000
Received: by outflank-mailman (input) for mailman id 1263038;
 Wed, 25 Mar 2026 20:43:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w5V4k-0001IT-TH
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 20:43:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5V4j-00B9cg-73
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 21:43:37 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c448ec-e002-0a2a0a5209dd-0a2a450cdf8e-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 21:43:36 +0100
Received: from [52.101.48.46]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c448f6-f93d-0a2a450c0019-3465302e1ce1-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 21:43:36 +0100
Received: from BYAPR03CA0003.namprd03.prod.outlook.com (2603:10b6:a02:a8::16)
 by MN6PR12MB8516.namprd12.prod.outlook.com (2603:10b6:208:46f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 20:43:30 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::9e) by BYAPR03CA0003.outlook.office365.com
 (2603:10b6:a02:a8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 20:43:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 20:43:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Mar
 2026 15:43:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Mar
 2026 13:43:28 -0700
Received: from [172.24.66.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Mar 2026 15:43:27 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLTOlT4gPyVcaleGj+dDp4ygX/3sf2lLDdir1ulZzQY3QV8TA4+nW83fmipu5selO3kd3KRsOPu7Ut4Hc305ZUEJOTeQdn9/PYu9d2w21B6rmZL3FperVRyQcPzLtg65gAXL4XhTCRDxv3Ns2Jq6aB8Dg+UzWjRZPNfHbcaoiNNsAsFkUumUm3JyPJNV1w9JHCAkKXYkIZpKJQke/lcCpP3NfDJBwJnu2zQifCCvRqctBGI9NsUuWEUA3TX8VCOjVOZ2gp959tzl2RsqcWpfdakGaQrUbNcjDgGaq7aIT7w3AjJbQlrfKDLT0bQITEP8hHcPSApoGzEmFaQc/kkEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ3Ia7HHiDIHFDKjoU5aNoyIZsQbWwQfyFhF1mXh0Ek=;
 b=cvrIA/yihVwAHEUim6YYdzMDOyoozyN3i9TQ9x6LnnPoVVMjCXzLlbhpwc8F4XXXYwkdFiqzsbQ2fSCuG7fR7iNOoCFsXy+IMetgy7ciQuvXwaa0Z3MEJM/lSR0J7NuBGPueilIelsgaGJVzth0hyG7jFDzYbiT0P/YFtAaHCFisuBrLM1xR+uNS5u2UqSsGJxC4uvMietWvbK2KX5x8Fbk+AIEkqavhEtOeeOsPOEWlIvH/6ZLgHngh2O7WX3PTh1TOqTxcDAn5R/elrmQRrA9ZuqfPyn63AzIadcS68vZPmU7WAH++fjsAReS4wSDRGSMKK7gfACo2T176KZ0dDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ3Ia7HHiDIHFDKjoU5aNoyIZsQbWwQfyFhF1mXh0Ek=;
 b=VGVe7yJ3Xz0ksXHzT3P663h5PgJlRO3c7ZWJxhZuIeEgJvcVt6sVmPU/INVnFv8Qw048fwTgVaZ+gCUF+JDVuWcqSt9FTXmLOmZldPejLz9t24/lYqqNqyekV7IKAXGZmbmWk6T5rxEvNROSTRot2GYiDKJXONyOZrhQf+2b24M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0fde03b5-949a-4825-87fd-a11463a3c064@amd.com>
Date: Wed, 25 Mar 2026 16:43:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arinc653: avoid array overrun
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
 <362f599f-b195-49da-8c53-1db69add203f@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <362f599f-b195-49da-8c53-1db69add203f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|MN6PR12MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: e683eabb-f41e-41f5-9f64-08de8aaf2c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NAbU+4iJOzj3FUWEvAYnBOonbfr5H/fNfhekVBMBU4xNkcOPnBGwMh0QyNuOEqV2zE2D6gPx2XGdKqCiLF80Ca8vF23ilR06JEWVB4/VLf7fpz3f/HR7QbTLKC2IDJ9pHHgMxqCfzhOskfGp5DiuQTzhYwDoTIiTCB3mCYwgydkYrNSkmAf13BT5inncdGH857Ki7AnDoX7R6QGc+RLGCytJpISBzoGosvtjvrIau7UjEXelTQRnvZrbRSY8YDJiVzI1LF0flvUG4ijixBl/N6PRLYQgGdn5eMzZMwh2twWdBqytgifxlK2Xp2UlJeS48/QPMuU/s26zrLJFySN9vq8TClqb+lPJ0ryMB+kep5WAc9bNEcNA/RxHsaQZ0T4zmQzYU8R80dbbWI5+J8W7z6VG0/ZoKHv5Mqf9wDOAAnmyQqRg0dcutA4K44RoEQaQXBsxOUfYTsU4P+6SpmsnUKunldR8qOsoP3fixUhaahTY7zlAbSz/fROxvPGzgVRXBr8w35OlVGDCFOqPxWCYqQGDSBwpSUKZie8eCKfwR4aSTQ40BuL9q43fXQ+tN85sk5Bug+a3Urslr1dCSR3Ni4m2gd+etFuGZoSSwkMIisam/Uj45HbJI7Mibegc2y/rGwRUSBGeYon0aX8mdwiVDHGApuO32VE5sp9A+gvo5URp7BZGTj/Ajr0Di1Bv10ABc2+y4j6/FqCp2aVj9+ZrJlERHPPpI3TrdMyH3bRYRLCAMNxp+QvQi3Ml0mbgTfSmDZr6KEoz75m/mIthtRTKmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XbMwSxWjyUJS1yh/ih7ayemnIpKU5iIPNrn5+sGWqeWHgR1+H2A4J6zFM8WzY++y8k+1RQwZnVBgnQMcpKJKE/YmZmiebxi9BU2NNuw8lzLvKPuU6dwhm877zjK0Vbe4x4NwlI49x+CVHHqBgKBPjSv46HynVjFixYrqSrhifRv/4dFuiMcIuwr0hLWK9cKeuseCWgo408VCq76xf8NCk3JKqwsXLejW4rJt6mS5fNX4qmS7CPsT6xHBzWlqaNGFnMl1LZHRwzQMwk9wWfIZScd2Zoo2jxpWrMZ4dWNl2icSIYiaoLzcKEenx8SfnYRI1FuETdzwwB/HtSoeG4NlH8RqFW6AhdMJpdar+A2NiNx5CDC4xNj+NButOTNTaJ99J8sEWvuICaZOPH3r/d5A1T76elrZiScl23AhaFrfi7yQWkrhNzhBy//XEgCV0KCu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 20:43:29.5509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e683eabb-f41e-41f5-9f64-08de8aaf2c17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8516
X-purgate-ID: tlsNG-d25034/1774471416-F4EBB734-E8FD0F4C/0/0
X-purgate-type: clean
X-purgate-size: 1900
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,stew.dk:email,cert.pl:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 168EC32BF65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 09:22, Jürgen Groß wrote:
> On 25.03.26 13:55, Jan Beulich wrote:
>> Incrementing ->sched_index between bounds check and array access may
>> result in accessing one past the array when that is fully filled
>> (->num_schedule_entries == ARINC653_MAX_DOMAINS_PER_SCHEDULE).
>>
>> Fixes: 22787f2e107c ("ARINC 653 scheduler")
>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stewart Hildebrand <stewart@stew.dk>

Thanks for this.

> 
> with ...
> 
>> ---
>> Jürgen, provided I understood him correctly, suggests that something like
>>
>>      while ( now >= sched_priv->next_switch_time )
>>      {
>>          sched_priv->sched_index++;
>>          ASSERT(sched_priv->sched_index < sched_priv->num_schedule_entries);
>>          sched_priv->next_switch_time +=
>>              sched_priv->schedule[sched_priv->sched_index].runtime;
>>      }
>>
>> should also be valid to move to, due to constraints applied by
>> arinc653_sched_set().

Not quite, because major_frame is allowed to be larger than the sum of the
runtimes, and in that case the ASSERT would trigger during the idle period.

>> I'm hesitant to make such a change though, not
>> really knowing the scheduler; the change here looks more obviously correct
>> to me. Albeit the Fixes: tag may thus want dropping.
> 
> the Fixes: tag dropped, as the constraints mentioned are IMO really enough
> to avoid an issue.

No, the constraints aren't enough, the out-of-bounds access would occur during
an idle period of a fully filled schedule. I suggest keeping the Fixes: tag.

> 
> I agree that the current code is far from obviously correct, so your patch
> is definitively an improvement.
> 
> 
> Juergen


