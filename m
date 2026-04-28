Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOV+A31r8GkITAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:10:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C3047FA97
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295448.1572091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdWR-0006AP-W6; Tue, 28 Apr 2026 08:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295448.1572091; Tue, 28 Apr 2026 08:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdWR-00067g-Se; Tue, 28 Apr 2026 08:10:23 +0000
Received: by outflank-mailman (input) for mailman id 1295448;
 Tue, 28 Apr 2026 08:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wHdWQ-00067Z-Rj
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 08:10:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHdWQ-00F6h5-8Z
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:10:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f06b6b-2eae-0a2a0a5409dd-0a2a4504aaf2-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:10:21 +0200
Received: from [40.93.201.56]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f06b6c-1dec-0a2a45040019-285dc93810db-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:10:21 +0200
Received: from PH1PEPF0001330C.namprd07.prod.outlook.com (2603:10b6:518:1::1b)
 by DM4PR12MB7623.namprd12.prod.outlook.com (2603:10b6:8:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 08:10:16 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH1PEPF0001330C.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:10:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Tue, 28 Apr 2026 08:10:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 03:10:16 -0500
Received: from [10.71.195.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 03:10:15 -0500
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
 b=gLw9BaVecvht71CfDT/oYNqqPmHcMDIlDHm+hhxcGFGuPPgNANkHFhW5mrPrMd/uyOTDrItJWslUc6l+fD6+YpFPcU/Ufhj4wJ7nOGEM1j0UVN1h3I56h8QiqlYvO4D/xDkwUj+paXsp7hhvdvLHLOsP3HOVZnh4mUKpyPtiq61hE3iFOii9fuI4S0EcO2FYpg8uWJO5iYSE2L+D+i9oxXeSwu++tsmeP+5h2MFkd3g+svihZ4DaP1jw4hvGHWpL59KCNlHv+/o+BLZHCh/oSu17RBm4sTQTqs3UoGEqtLeYT0ucOydFbagjoGPvuqbQizcJUkKndl4NEno1GdI4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QwKHubh0Rs8eIN0CJH6ipVEHeIXxlKEFaCurDRB/m4=;
 b=wkrnm+Zds/JKbq9hdXrb82itsKXWa6tLhjy8y271gS0zFaMC4R/7VsOTsKItPVF2bKDFgny7eCBb/PFoVXc2FmSMxPxNyq7uBPfxrIAlfxgGzW8VSzx9Au/fVTRwAmrHqx7AmkwoOV3MGBBQwc97m0nEJz/6tJmOCx1AbYPw0MLQrc6tXv/rOZrjzidGJ3TVxB9ejhFyjiGqnD4MT/kdmKF3eBeteEt5nQxuGSPvHSvI6ZoBHESF87jOBik2YiYDIuVQJMXhes7IUDvlqQcaDEeRJrBiU/uYJupPDeqfvxPVx7iwDGizuY+LyzWoPb5++/gmTuPSq7IbBJmwuyjm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QwKHubh0Rs8eIN0CJH6ipVEHeIXxlKEFaCurDRB/m4=;
 b=MmADuBIBSX5PmHYvQcqPvSkstj/EtZAt97QgLurNbB8FE3owbXuFRu5a+WxHTKpomZSSkvEedX2D7yXBjiP+ix7Pu6LgxrU3icRG7GxAcklI2frkTlkbZOtsHNYQESqk2fABqK/LrrXAgNfAcCWK51uhi3U9HLIMcPhUCr/4SmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e3c63f3a-fdb0-4ad9-bd8c-5f6f0786db7c@amd.com>
Date: Tue, 28 Apr 2026 10:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260428080218.19371-1-michal.orzel@amd.com>
 <E8BED2DC-49DB-4A10-B179-25A5880A5593@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <E8BED2DC-49DB-4A10-B179-25A5880A5593@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|DM4PR12MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 765c2d5b-6ee6-4a71-a3ed-08dea4fd94e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cfylZNYMXFDV6zn+eheMibaW/Hy4lU7TOdQTXHUSxsoNjAN7f+N9iWsWjcDQ0xvcYcEulTr5MXDdaNcRMlFyKLIhSQlhk7k+nYR4yJdTi0PmBoHSHPhs9BIXqomzG4UiJS/vKOYIAnyNPh+tr2cocaEcX6EBkuRElqo1Rm6OprnFq77IiU6YUQ47ByktDcVFeDZXuDKJk7aDISSYfLhZ8yyo4PAtHXtFM9CBW6sYLgEr3y87hpRzhEnZcQSjDLmg0Cj/idpUZECyVTNn+CRKVEVtC56m0gaN7wwoJtBjJka5OfzegNLYe+1Ec2JT88p/+V8io/I2agZ/TDB1Yz7YRN9praQSuiAJVVY5MWDXtnh1a/q0+yrAhkHzNCV0hUyQNLpOUNzv4n32sUVtLBnOA08lWGGTApYCPARiT+rM9rOqNSnu651AWvfSkrcNxTqsabQrrgiXleec9JNBevDFV42HWrmAWWfD+7UHmQyA8lOLec5P97+Qf/0M5NI8H3FRDFKmI6/DNsGbW9k5n4jkcuIwkp/pBvCKTmSZHpTi80hDaE8YhjCzqeHOiAmCiUj4+L17J/ENQgnsktXYNi1D1nEx3LMZkbXWNIK3GdqYqUEV7ZhhsvpTpIgKEO2oxJ4Ywcqy8E+nrO22euxzMoWjQYaVqsdpOIujELk0XJEDKTYXTmW0S6vG933KOW9YtZstkAfRyzL8S0ltusUG8Ulol3huEtHwby9HJAutS/KYjdY/WimtHCGnYc89qRwe3eSYY6rQtjj51Qz0jToderbdXA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lXbVpWpgWQWfh0Jt7Fg4SmY+s+w//FrtSSaWOAN+zGudCQl/dXrKjwcIW4q2VXHNQn5osNFH2kOu8FT2G9jiWHLqmVpfg00SvesI/Un7J/7mmB71rFgAOkA5PNBq4yIEIaiyiLByzfZKcytlHX3j31+q1zq7cqJC83fVBncwyA7mZ/0waiPFbgi2EaUx1WTzp8+Va4O84N0sAtGn9GnRL57M1lzzQb4YdK+4EwUeV8yjzmJ13tqHlNbpZNlSCEKTzCcMXGkiSRGYubaK+c/9K85Q7cX0qV8bkViXu3WiloSASFemo2bDHHhH6BLQU1zqwJEWRbTDJQ0/NvciyNI7nBCIi0AK0cNRkGd5B8z46Jpv2ubOc2Cvvu+EMG1ElydAj6f9j4vUgA3qWpAb7tg4HHxbd2FnE0PGOIQr+uFldtgBzMwT7IwpdUMMhWp63swQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:10:16.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765c2d5b-6ee6-4a71-a3ed-08dea4fd94e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7623
X-purgate-ID: tlsNG-ebf023/1777363821-3184D3FF-3BCDF3A3/0/0
X-purgate-type: clean
X-purgate-size: 1580
X-Rspamd-Queue-Id: 46C3047FA97
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]



On 28-Apr-26 10:05, Luca Fancellu wrote:
> 
> 
>> On 28 Apr 2026, at 09:02, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> overlay_get_nodes_info() is called before fdt_overlay_apply() to extract
>> target paths from the overlay. This fails for overlays using phandle-based
>> targeting (target = <&label>) because DTC compiles these as unresolved
>> fixups (target = <0xffffffff>), causing fdt_overlay_target_offset() to
>> return -FDT_ERR_BADPHANDLE. Prior to this change users were forced to
>> manually modify the dtbo (even for hwdom) to switch from target to
>> target-phandle by manually inspecting also the host DTB.
>>
>> Introduce overlay_get_target_path() which directly handles the two
>> targeting cases that occur before fixup resolution:
>> - target-path: the string property is returned directly.
>> - target = <&label>: the label is found in the overlay's __fixups__
>>   node, then resolved to a path via the base DTB's __symbols__ node.
>>
>> Libfdt fdt_for_each_property_offset() violates MISRA R20.7. Despite
>> libfdt being excluded from the analysis, this causes ECLAIR scan to
>> report a regression because the violation introduced by a macro is
>> reported at the call site. Deviate R20.7 for libfdt.h.
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> NIT: shouldn’t these be in chronological order?
Yes, they should. It's b4 that messes things up. Anyway, to be done on commit.

~Michal


