Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK3kFMvE6WkAjwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:05:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C6644DD16
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291616.1570486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFo7B-0006lR-0o; Thu, 23 Apr 2026 07:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291616.1570486; Thu, 23 Apr 2026 07:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFo7A-0006iO-SH; Thu, 23 Apr 2026 07:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1291616;
 Thu, 23 Apr 2026 07:04:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wFo78-0006ht-Vv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:04:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFo76-00HZdx-NL
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:04:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e9c482-5cb7-0a2a0a5109dd-0a2a4503dd0e-32
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:04:41 +0200
Received: from [52.101.85.66]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e9c488-672d-0a2a45030019-34655542f719-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:04:41 +0200
Received: from PH8P220CA0053.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::26)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 07:04:34 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:510:2d9:cafe::2f) by PH8P220CA0053.outlook.office365.com
 (2603:10b6:510:2d9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 07:04:34 +0000
Received: from satlexmb08.amd.com (165.204.55.251) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 07:04:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 23 Apr
 2026 02:04:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 Apr
 2026 02:04:33 -0500
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 23 Apr 2026 02:04:31 -0500
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
 b=vK8LMdjbdx3p1m0cbEZhMPlKMrjPU9zMSri5y8Oeip2oqckDVm+MlBMnPpiPv8q+yS+19d+vluKqaEZwH5ymO7nV6uY7+Z71NnXE7w6ZF5aMvfS6gNaCRr30XT/V2BL6fgjV3VhWbWxyQuthYRXu6O+xiT2NSLizS9sw/6DoP76r39Ag8GZ0+FmkoEKRpW68KRndmQGvJBswu8cDX7zPEB5ECCupLE4DXy+lJWupo1+rDPWFPFGtrq1PSkIDZCACmajjQmyW/LGBpL+mh8P1ptQ4y/xLGLPAOp5+I4XqsynecJ33QGzeoViw1ayiOkQA9AHURBigU07+HeXxwYt3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z6V0vxoVpbh7739XmUgT+IFt6qAMu1fDUIzhMI2wsY=;
 b=g+r/9IZZ4TJGJ4QOFtJnMTc7ERDwVgBvKbuB5lK+HaoSM7D0dO5NrCErHz0cMD6fJl4zuM7HOrUmdsM6ia4JV5MA5GAdDA+d/HNQjTmqJkOa2sAjoyw/gOElIfm+mhO8kcILy6kvSqbj2zbTGcFX7dVQjDkE2HGaf5mE4pmLj8rDJtTTZGcoVtT74vhK1zKaWbcmI8NZok8tyzKYODYE5EsAgFrsY/sGnEJ29IQ5JVRl0nC+QyCiNeHa92OnJABbWNUt9vUgrPzRal9JBM6+966512PwFq96X9JfIpnFHTpGsKrxmsER6w5pn2V4+/loiASKbnzbGsBUZY7bBE3mYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.55.251) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z6V0vxoVpbh7739XmUgT+IFt6qAMu1fDUIzhMI2wsY=;
 b=397Ddub/TkC5Fz4hGTXX7E9PG2l7aNqrmQBKw+b+N4TNKqJYXOgyxUO7t2StQw1eL8veDnjWRY7qT/8uidiucxSqaf/vGVEKXuNPYRL0v7FdgVEHmx2UIjXlnQ+rdJ9MPVHBXHZ9EWFi0hhCm/1X2ofWu6ejwEmY5Flya8T0n8g=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.55.251) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.55.251 as permitted sender)
Message-ID: <9bfbd603-57a2-4a9b-a4be-5594c15ec8a3@amd.com>
Date: Thu, 23 Apr 2026 09:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: device.c is init-only when OVERLAY_DTB=n
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <c50219c1-5a23-46d0-bbe3-ab4a871a935b@suse.com>
 <53b251a1-948d-4c9c-ba0c-6f4fd99b1d6a@citrix.com>
 <a4345272-872c-4967-92e1-bbf74bf65ac1@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a4345272-872c-4967-92e1-bbf74bf65ac1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 50547a52-443b-4721-1c35-08dea10692ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8IhQ3FaTvIpRd+HE0e2aFI48xjS7UsaF9AUFHr73Z0w7A/i8j3Hu8HQSyRT11lRkCACRW6cdlRxGGH4VRE/FJJqegOLNHsHyCqhO1FsSYRwmzxLDXmD//BN3PJVyGLJmdALrYVkEiOs8WLuPGb8eqpUdRyuLK2rl4NQ0Bj06uSRtVZMxtubV2GVo6in4KpPhNFQs9/9ACT+RHlXO/Jubh1+KXlNgxCkUBynIi5lSAQB5m6F/DC3rQB1fM5OyIqS42pQ2ZfgS8btCnxdTxDnybnVfuR1YxfUsFgJEdbtzpw8kf27vWZf6BcbXZwpdq7MQq76eh8oijVtKplPXpW19VmLbUt5xD/hSycPqd41Sc+ICkCSwJi/mss3lZdgeVA8X8YbboaNujr5hlciCXaIuJJ2zeehDDVESzO/SDjLzPVcn3yhCqLljssawsQrcU33Obf8zfVLcUkAW7/vQL1e6yOxuQaA94izrwAoEsWgaW+jVc8TRnFzsqu3yqGxv0q2onoIHIhe+zADudokQkJ7qJvCbMaKxb8Mxe+Yd7kFKQS1BEaod3maiDYjTTxXI1w3PS3hkN/5c6/H9YDPFcdzIfMlISiEyJkcAoyRljVmGJuTnp6t6YqYp2RBiGBlj3fMkkV1ltB6Yvdnvo4iSJjdsPgYlOVLA6Y8Qd8QfwmCweOx4KxIOnnczXVGGNL2CaZMTGlM/DX9gUydeTj29NLde/2dbW+vq6ll2hJAhhj8L1/82lHpydfdl8787REXrB9N10RlVgzt6cDl2eAzyjhUZoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.55.251;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+rtKFzmECy7qsGsOapfbHuQyq5I2Kc3g/WnSADp5rIGQLsx0Z0RjJsrluwi+v0PjL6HnInO6CsBmyAhe8zyOAaJtF9VCKqkhnoNb0QTmBo4YS1zw2mg9cPyOFGIpnrzGLwzUeZDUfOfD9P5SVnQFfYotqCZf0GWUmfYoCRCcsoNqC1FHBIx4g+lM89VqHcRc2SpGUi1cwJcZ2qE14mifYgekZOFDfrgL21NCPpfR5zB9hFQrA3fzbzgH6oqMox/o+4fXMzG6qCOmkFSsbmRUmA9na3ZwXICogiCJ0OBeGzMdj/ZC2VeQwxp7RUnzu2lFI4PjjBhR6FsmdrDsue/GpIDrz/ScR++bhViKyzjJqensAS6JQtPyceyQljXHCVVJn5d77vyUQmgBjLpPeE3NSFlFNt7m3z6uuu5v8MY3YljsWKOh0zbsR9Ky5LFVtYAI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:04:33.7731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50547a52-443b-4721-1c35-08dea10692ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.55.251];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
X-purgate-ID: tlsNG-33051d/1776927881-2A766938-17B3421E/0/0
X-purgate-type: clean
X-purgate-size: 1374
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: E9C6644DD16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27/02/2026 07:50, Jan Beulich wrote:
> On 26.02.2026 18:14, Andrew Cooper wrote:
>> On 26/02/2026 4:28 pm, Jan Beulich wrote:
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -15,7 +15,9 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alterna
>>>  obj-y += cpuerrata.o
>>>  obj-y += cpufeature.o
>>>  obj-y += decode.o
>>> -obj-y += device.o
>>> +device-y := device.init.o
>>> +device-$(CONFIG_OVERLAY_DTB) := device.o
>>> +obj-y += $(device-y)
>>
>> I know we've argued over this before and not come to a conclusion, but I
>> still firmly believe this to be an anti-pattern we should expunge.
>>
>> obj-y += $(if $(CONFIG_OVERLAY_DTB),device.o,device.init.o)
> 
> Whereas I think this one (in its adjusted form to really only accept 'y')
> is, firmly believing that the "lists everywhere" approach is the more
> readable and, more importantly, more scalable one. The form you suggest
> quickly gets to its limits when multiple CONFIG_* need dealing with.
I must admit that I prefer Andrew approach. It took me less time to understand
what the line does compared to your solution. I don't want to get involved in a
discussion about consistency here (for me we can use both depending on number of
CONFIG_ options), but with the line changed to what Andrew suggests:

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


