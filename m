Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC1uC/rf72kHHQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:15:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8F47B41F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295377.1572046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHUEG-0006XC-Lc; Mon, 27 Apr 2026 22:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295377.1572046; Mon, 27 Apr 2026 22:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHUEG-0006Vl-IZ; Mon, 27 Apr 2026 22:15:00 +0000
Received: by outflank-mailman (input) for mailman id 1295377;
 Mon, 27 Apr 2026 22:15:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wHUEF-0006Vf-T8
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 22:15:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHUEE-00Gz9h-SF
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 00:14:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdfdf-2eae-0a2a0a5409dd-0a2a4503d534-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:14:58 +0200
Received: from [52.101.57.38]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdfe1-672d-0a2a45030019-34653926eadc-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:14:58 +0200
Received: from SA0PR11CA0209.namprd11.prod.outlook.com (2603:10b6:806:1bc::34)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:14:50 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:1bc:cafe::7f) by SA0PR11CA0209.outlook.office365.com
 (2603:10b6:806:1bc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 22:14:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 22:14:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Apr
 2026 17:14:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Apr
 2026 17:14:49 -0500
Received: from [172.27.93.19] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 17:14:48 -0500
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
 b=mRp+73raOMz/5p+FJ0dlp4e30VLCg0y/b7FmM9FWkwZzh3qUIGlixir68ybae18V5cuS/GRb+PnUgQnLhNbEGDiLBHERcqxS9E+jhNeHha92WNO3ETsLsd6bADyszeM/VDh75QHTZJ4UB5wNto4WGshfZMxRD2XdWa9NuPaEoNaiv2j2tsQFMkUDprUo1P4kjUWfv6djSP9pin6pZy+zY5JkQe+5hEWSmkmtNdJDMyE/qcDSdY2UtyzQih4zalxOV0RhGk7ve+0hto13eiBDxAo/+zq0DH0GweYSywAOnOxqLOCffm63BlvXumFVZ3LTSMP2BiJHv90gt3cv8vzaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2xvCKkDcvutXpaTlJO5HLGwjNnfM1xB8iacdMNkKWY=;
 b=i3ppMjupcY7DlQ7QpbHrQszYaboRXWcBMlPqnnHURwVxDjCB+8jCKE0RPFoMwZa112HQ2OdExUesH1GiJeRKB7n8u+IuFaGrDmF2OwVAdokcys2NvCPiOO/CederfBhkFy6Tcr3vMdeDf4Xv37CA2uyPKbMeCLoA94n4K7R8E5YTq44b7mPZ+DnHrVsctxFWq0n96sQsD9vf69IbK4S9eYm6YaG/YO+n7Ho73FUlIBD/aeZEYtdcqwo67SD8qFKBS6l8Ga+Sf60x7D3RholNvmS0Ba6Iwz5QKYxfbB+wmXTT2si0MQ/xggV7ArvDOJLNtza+rJ/u7vUFCMHMsN9rgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2xvCKkDcvutXpaTlJO5HLGwjNnfM1xB8iacdMNkKWY=;
 b=GzvjmJkGYtTlOCEDk4tbsJAuBIHJ8337i0TkAs5YGzJ/glb6Lwb4o7Y989fJKtb6MclwuBZfSQDSu8I4elT56zdLQG7kExgkrO+k0eViCT6KATVM75YC/faaFM311j2gXknGQi7P0xvAUrjmuqpM/p9NfXs6cY625i0O8oNc1nA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <9624178e-7596-4395-adca-7cedc58aafb9@amd.com>
Date: Mon, 27 Apr 2026 18:14:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tools/xenstored: remove permissions related to dead
 domain
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: <dmukhin@ford.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@vates.tech>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260423080840.530547-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a1d0c5-1e52-4117-a059-08dea4aa660f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0IOq6Usltb60LVV7b1pPUVRqyFL/PwgWcF//dvCAHCTopPcjlM/v1zXbWIg73xfg3uf1HPzcuWv1rradFiOrKLCgPDV5N5+5Dih9LWaGuEbdTgnPC+lwL7kZF2+uhmmw+TySZlz472wizIS8kvO6WL6Jjin4/+fYsSQVDLkdBvjWLzcX7P/KXjBVWOnJGaPyqU1jTNXKjL5m0k30mbVk/2wfricnd4VGsahmwMLbPKnahcuA2SeebxSuaOKNjyh8UR/w84Y5JhwCKK1e1LDe7982gQcsJO+COyXw0JMaL4ZwOm0eXu0S+jTFHWh2fARkVO8eelNSJGFwnw2UPqk3qTDumSmLOTTS59ucQgYOGhT0IraAzjR+Fvipjh7aOj5z90jGvOaprLGBrcX13+3UMeCv/SFCtDg319PW3hOnkF1o+x5dLcuqsgaMlXAp6uF0Mf878cqwCFEwQfwA17y4985l/ScIDYODwSpIeMlVPTFwy21lDTdubj+lXn7d7c+HEzrvq8YD54teeQ5SUpPvM8tOqg0eX6yanHIs/cd0Qr0r+c+nQjbh6wk4T7dUuMqzmfw6lzR5bWmpKosNvmTNtVVOQVdljYX5HVt/MjBzLn73Z3n8nP+rJ1eO/AKXdlmnWcqJp3tVTdEj22lb3wJleKxDrLvSstmUQ/dEKJOYOnbwUPS5KvBMKQeGaLavE4Pypiub5cfbNxJTJ3V5TQIHrImCK62DnRCa3OPFzwSe8r5dczj6kbsaw8QQwNA2Is2NupyqxErUQIZlcQJw21Aumw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ir3z/IKUxaaxxgf5l8uBQeKuLyEGqt/bXH2dRT+xEoO7vRN+Fjcmr8eY7R4Cjvi3ITsuHwZTnwBMAsc82S0thFequFgC5YlgLzswGe61sBmlWQRWyN6U1svSWHYproI83I7WtZEDK0iIeB0rwdMm4g0PrWuLU1ZWix1luevt7HXNvRE3/usHfAWQRu/uHPQ3arCOkYPjMsJOnaMbGJ5ZH+gS1F16S+oJMkcx2DOiy4+KBh8fIBvQE4QvMO5O234HZ2e7t4NNV6G3wIJ4fedWgwDDNFzFOYzKYE56MHYwuENk2dYjokofjKpdwcKIm3lhKtC5brqdV+vbepPt8vik2vA7l0VmJF2cB6jGXpt0BsDze/HjBga+381MSlugcVpHNktkLR/mdSeC9YQPy73p41CvdMhI1DE65fkS1PmFM4QWefJXTc2GmVkYmXTE5Pz4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:14:49.6228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a1d0c5-1e52-4117-a059-08dea4aa660f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
X-purgate-ID: tlsNG-33051d/1777328098-A2378938-D5F372B5/0/0
X-purgate-type: clean
X-purgate-size: 908
X-Rspamd-Queue-Id: 93C8F47B41F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email]

On 2026-04-23 04:08, Juergen Gross wrote:
> Wit unprivileged domains now capable to use the @releaseDomain watch,

s/Wit/With/

> there is no reason not to remove any node permissions which relate to
> a domain which has been removed.
> 
> This resolves a complex scenario where a new domain could inherit the
> permissions of an old one with the same domid.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

>   
> -	return domain->acc_val[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
> +	if (node->perms[0].id == domain->domid) {
> +		domain_nbentry_dec(NULL, domain->domid);
> +		node->perms[0].id = priv_domid;
> +		node->acc.memory = 0;
> +		domain_nbentry_inc(NULL, priv_domid);
> +		trace("moving orphaned node %s to dom0\n", node->name);

Since you are touching this, maybe s/dom0/dom%u/ and priv_domid?

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

