Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L6MOAq7AWocjAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:18:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDED50C99C
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 13:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306074.1578166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOe4-00038E-BE; Mon, 11 May 2026 11:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306074.1578166; Mon, 11 May 2026 11:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOe4-00035E-7w; Mon, 11 May 2026 11:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1306074;
 Mon, 11 May 2026 11:17:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMOe1-000358-Sp
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:17:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOe1-00HYdV-6A
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:17:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01bad7-e002-0a2a0a5209dd-0a2a45079918-26
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:17:52 +0200
Received: from [52.101.57.27]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01badf-229c-0a2a45070019-3465391b96d5-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 13:17:52 +0200
Received: from DM6PR03CA0070.namprd03.prod.outlook.com (2603:10b6:5:100::47)
 by SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 11:17:44 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::e3) by DM6PR03CA0070.outlook.office365.com
 (2603:10b6:5:100::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 11:17:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 11:17:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 06:17:43 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 06:17:41 -0500
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
 b=EQIioPTVrIdw9CROqzdvXUaUroyEm/q+Fzv6PkMMeQLhhJsndLVcHUo5EBnqr8EcIDNfRLVESHMuIm9uTUn8GmgzAEQzhBZguUWAZM005Nnd7IwjhhUtU9x7N1w6UbsNTVg6lYbBJHD7oM/iA+ZdogkjALKCd4WJ088m9SjnCVYUE5jhsX016aZN2Gsg0ZczsgqpPoIb2pu9j5dPpSpWIoEtH5k0/OUYUnkOZTmtL/IndPpXKuHM0DH8zTTc1DC26gQGkuks/OguebxxZeklqmd7WL/j5zpn/wTeQpctI6YR/lKGkohqoNF1YDUR9B9Nj57zWDCIsX+nMykqT0t92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29pvWVDMjHINi8k+yed9tHwgmlIcnunz/kvSVVpKoYA=;
 b=TODtB48ttjFCY8uzbxjHqlKhysHHdKIl69/acUeIQNMANnuOaEeFXrW2jUsKaK3T7Y01CkSglBQETdQqbVyp4pG+OAUN75FETAl8IeUZHZ0NkGibKfYa0CVAYyM80ASWdY09lknd7+A42NPfBDnhLvGNvPt+TEia+I+aGRV9/aiJHEsUL88nHn/f3+Fi9XhFv1P+4gDCKuftPf/fj8czf9zYOCKPRmn7PP6XT4IymJ2xDE5YJ4OVV25OsWTM+InDydtWUpDHul+EGXPdgUqc3YeU/pPCmUvkuTjVzq9LxBRu3RY39IF+fBKaxPnxV1jR2y9xfxMB8/pnbsgBNArRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29pvWVDMjHINi8k+yed9tHwgmlIcnunz/kvSVVpKoYA=;
 b=hVDPY3DhjChePNxcLGgfR5/WDh5Y6wVY7Fnn/rDqMuvNzQZVVZaj+thSkhMN+7UDlWOj2OJLQAIc9te8VrEx8UlZiInZw8dtQQC87141J18MJekTmzNGPGAe5KEPg2DV3eYQsVPLflPrkTBO+GeRccqsfrVNB98qcoPS5lwcT18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c429d2d8-d655-4c39-a703-f9e29ec37135@amd.com>
Date: Mon, 11 May 2026 13:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <63c08741-42dd-41c2-9f27-b14f350544c7@amd.com>
 <4372B93E-1AC7-4BF5-93A7-D1AD8FCE42FE@arm.com>
 <ce38f845-42ac-491b-98c2-eb2bd90f00c1@amd.com>
 <A3D4B900-2A5B-4398-A914-C1635E34C8C3@arm.com>
 <74ffed08-caae-4d70-959b-12daf5d67cb1@amd.com>
 <4E3CC074-A194-4B55-9B69-12204047D1E4@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4E3CC074-A194-4B55-9B69-12204047D1E4@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|SA3PR12MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: f042fea1-ab06-461f-a36f-08deaf4eec48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|56012099003|22082099003|18002099003|11063799002;
X-Microsoft-Antispam-Message-Info:
	07nznslFPCF1PV6+kIHLyQEqnrgbxIZ4cTF1fm6V7QE3C1aBIfB8Bn1rgan5Ws1qBs20hTUaVeYcgl8QpX2RlBzWlmMU6D9tjqCy3e2+c1Y/uk4PK6aM6Ld0wf1GHkhOKGMShOCKMjFIdh6wSy5J0/kbAI1OvSGwFyH56zBewxaOtOduIz7ENB56m68GSshlw7MITCQ4hBgnw0N2pL1xPPVb0qMvw8DQ74dN0UnxMWDq9PvlBFtltgV7IxL94cY3UA/4RdDS2CNfieYvb0rp85aoagfNLP8enlimrmSzeOFK/JmwFW48e3hpg5KC05E/KizXt94zLfwqC328YForE20CwmFfLe5Zbzh9rDoi4nS0Fpq347YknqwBgqorRbQBWqTSwhFi2Emgt/Rh3pSUSo3Q1sGIZHErgupbcmhXZ2SQjO+isdz2fZAPMbgfGXTDGGqz2BgAhy+fBdXd6Bq0s5ohPHl6RRN5sjpW4yKtd7KLU1vYzfgOJM4Dmf0eOsZhFWG1m8SdcitaHDy5KRDDxFkYkdRoObtrzkVhVlkhYD1yhI6/49eHb14kI9hGN83RBkF/yUnM9ZEvn7McOGMfqWT0awHePTi1xq1wasYK8+Dp3ToNtIgWPcaY9VYq5ZbYpdZGu+Xh3wzsxPnSqj9DD2q/eJRmnvLRApTQ7ZITaTNvOjqPATsg2JDuOKS4HeuaJ56iL3nJweR+bL06KpIxZf7j7Zl4SHDBMF+ooeoemTY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003)(11063799002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cOGXfhaPsIlq6Vbr45rpKoBVLDh+Ug8bcVvdossImhp0tzvpEhZfQEmZGjkR3IKEmxRhYdH7Fb8AthbLeGvODpt7WdCSyDKFHsFtf8KCZSpLG9gQ40jtPEe/kHls1CvgBMbm2tmvehg2GpO9uT8HTtMPE0/7Mbvtzjt0OmKSK3PGs8RZZUwnZJOtTEeZaIyxLooNwa8tFBfZL2WCp3WIPdEXAKi5nBbvACMyDA5hZKgBl8vf5JP03oRyUKv2UZX7t89m8m5fJ8bVrLilhbibphWuu2/EJ1DW02qGUC5TnBi2qgr1a6/n+SavT1BOczu+C4LJbVusi3Jzj4LsneHM3rPAyOqP0GuWhfz6zjhpfXASIlJSamYMTshPjffDUVKBSDyO8yzXImxv7yNfUWp+p+K/NdfqXDBqt0+UnUhUrSrsrPf29dy5W8o59m/AIk1X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:17:43.8846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f042fea1-ab06-461f-a36f-08deaf4eec48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021
X-purgate-ID: tlsNG-ef75cf/1778498272-0AF76C48-5BFDBE7F/0/0
X-purgate-type: clean
X-purgate-size: 2005
X-Rspamd-Queue-Id: 4BDED50C99C
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
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 11-May-26 13:07, Luca Fancellu wrote:
> Hi Michal,
> 
>>>
>>>>>>> +
>>>>>>> +static inline bool v8r_el1_msa_domain_sanitise_config(
>>>>>>> +    const struct xen_domctl_createdomain *config)
>>>>>> Why can't this function be common? I can see 3 definitions (Arm64 MPU, Arm32
>>>>>> MPU, MMU) but they do not have anything that would prevent from generalizing
>>>>>> them in a single function.
>>>>>
>>>>> I can do a common one I think, just to be aligned, should the common one behaves as the current implementation?
>>>>>
>>>>> Arm64/32 MMU: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE allowed
>>>>> Arm64: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,PMSA,VMSA}  allowed
>>>>> Arm32: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,PMSA}  allowed
>>>> What's the reason for allowing NONE for MPU here? None denotes property not
>>>> specified but at this point it should be set to a default.
>>>
>>> We treat NONE as PMSA on Armv8-R, so either NONE and PMSA are valid and lead to PMSA at EL1
>> NONE denotes property not set i.e. set a default. IMO at the place where we set
>> a default, NONE should be switched to PMSA. This is a cleaner solution than
>> giving two options the same meaning. Sanitization could then verify that indeed
>> the default setting took place.
> 
> Ok so this is a bit different from how all other *_NONE are handled currently (TEE and SCI).
> 
> So on MPU Arm32/64 now we will stop the domain creation if NONE is passed, is that the behaviour
> you are expecting for DOMCTL v8r_el1_msa? (Ideally we should not get this because we will switch
> during DT parse)
I think the confusion is that you are mixing the meaning of none (i.e. I don't
want it) with not set. In case of TEE and SCI, none means you I don't want TEE
or SCI, please disable them. Now, how would this look like for MPU. I don't want
PMSA or VMSA? This does not make any sense because it's something impossible.

~Michal


