Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN1KNqe2AWr2igEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:59:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F07A50C66C
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306045.1578138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOMK-0007JH-Cr; Mon, 11 May 2026 10:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306045.1578138; Mon, 11 May 2026 10:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMOMK-0007Gs-9w; Mon, 11 May 2026 10:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1306045;
 Mon, 11 May 2026 10:59:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMOMI-0007Gm-Sr
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:59:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMOMI-006h5M-9a
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:59:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b695-5cb7-0a2a0a5109dd-0a2a450aa472-0
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:59:33 +0200
Received: from [40.93.195.62]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01b694-56b3-0a2a450a0019-285dc33e08d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:59:33 +0200
Received: from PH0P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::30)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:59:27 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::53) by PH0P220CA0030.outlook.office365.com
 (2603:10b6:510:d3::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:59:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 10:59:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 05:59:25 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 05:59:24 -0500
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
 b=FYW2gu6S/fhkiKQrSPHp4XzQB6iwUv+tjdVYofClcYGZmMvnWWRYcrScJAgQaR+v/4OPE/Eh5ZezYKnzeprC/H5U8GiUoEU7yfeGPOLPU5VTxa//T1P0Y8xx9+U+mi2qR4Vt+asVGSy0G3eEYunEugBTgWbkonZUYN9HydZBjuvhqBTAxf+1VTNkfeq5v7ReXH2jqGJT8iS9efmRvdXyqrWSWOOvKTHyGwcazLn/it/vvEgetFHFRQYYFrOD/4DYcRw/5dsRurEhnJjC6QvPJ0IO1jbjWCAT1C3CBgjj9PuZ+GWViCvyPgCPCvkV817auVRFFcdG0dKWhX3ehYA/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl5j1KA24WKyWFg5Cml4YccFJsGQDTn/KT7vL1qPicE=;
 b=TtHdBCZnG65nZn59TgIBtF8J+MLfJLg2pMXmdoGbGgLUkeBxfWkbbgaXX1uYdW/gFxJ1KJRqxB6LtUi5S/+AZ/5JnC7bTicb742OaP/IanBxqWRd17v8ADoX3HbcEwVv4WwsqHXVYmzhRLsPItG0PnFHgu11sdPkCoE8ch7PVC8ZE6WjfQmj96nHkLy2c+IT7RvxvQm+W7dm3P0m7hU7YBuuzCWPCF121nRXYbUeO5Zl8rpBu4abYdeFBxTbW++AIC5obhbjR1R/0+sJ3WNgNfLhqbCOjtu1NBMH8bmRkjlFPgnYSMUWkrEFmd+LKWHtbbTam9RAFb2/d/Vj9GH2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl5j1KA24WKyWFg5Cml4YccFJsGQDTn/KT7vL1qPicE=;
 b=4M6TvFavvcnhc2nwTp+N4igo8O8KCSrK5rLgEWAw9BHbXZDBido4fevVqCmPPJUJC4M8aUUd2G4uLoK8IwaxCjoZ6SFua1vuQSXyjizJZLbHGKSL+KneQdmOUqPqN7ATV3pk0LUzcGSYfBrAw8I87cg5tYFWSXlRfjxNWlVQSHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <74ffed08-caae-4d70-959b-12daf5d67cb1@amd.com>
Date: Mon, 11 May 2026 12:59:23 +0200
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
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <A3D4B900-2A5B-4398-A914-C1635E34C8C3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: c48abdf5-4178-4237-eccc-08deaf4c5e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7UZ112WghX6lSL45s+iLp+UvfCqIAXAOAl0VaOPuyaNaueSo3+ln91wn1xEQT9DjyJLPj07Ua4XeV8K+Xmc63acYytLgXtHpV6FBJV3YmiwJNg5ZvilyyAi3ynJuf9P7UnfxnvRgiPWq+FIM/n0INpVp1xaaLSrvmihpGsFDfe15JZpQ6+fmMMNQmo1+fydwfIf96x9vfTa9I7snhVPaGMmT2SDAYLKmH95QU81LairbfjcN2aiJwqQ8tLLFN8H45/zERZN9tdq2GWVBWMEFjEbcOu69AFkTmsKk7+deffxk+GtmrEdUtmgbmNKQ934dffA/V4xd97FQvIhv8CWL9mg+SlaHYlpVtCCDaskll0sJTvkcqS3B7aQS5AkaBjyhNtUhGuXN14IM/x8LEfKL4A7ZqM/kK4UngHjN1OkMLH5IBdG3knfuxb/3Q3mQvmxl352ozL9AYY89ks0aanR82PAgYg9XzXbkhzdmHrHzsPvhKLJ4Uvy/WvTd9f0EQaxVu8BthNYXbBO01Bf5XiaSURqw50wvRLf/Akv4WDqYMdWRdBayNGt3nDNyl2V4bsTA6HC8/qp3LwH4SEHuFMgg//n2t4tFRWmQeZsBfZR+AYlZHfF5XosDunxMvAgP4LD1P2JfZfWzLua6vcyp1ucyEP7Rl9wJdNXSZpMTQpDk/NmN1uDlFissNekR4Ye8/5IeSE7oqphD1GvyxlSZst+b8b8hgKpd+7mfz8TADXCLcaM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DTBfqOwGsrvLvQs0eC4eWxRbcsoJPdp/e9BFHLMuXZF6ZDurn+Fw9S6qDU8i9lkoLEw3xZnujJySA8vM8XVGoHRJRchMu78mbBWIQYFnsmXj99ORyCzDtdpTqlQCwYpZ0XlVcQ7OFen/AMmcSw1y0BKlIBs54z3FYGfH3IBW2hHrogShDYQwETy/+/W4UP04J5eGSc4XSLraCAataqESRmYVwmOlTGkTj8+HreluPXtJe4ojKYJ7UfYwtEWx3w0yWKrxi9E3Ye/6p+wLNJMLwjZd9t09KQaImiwXr3Zpp58lhw9TC4IPBY7tR1lB1KZPtaJFMdFPuMwBGXnEIxObD7YCGiGgAosw1lKUgV0ij9eEq5chpAf9GnBN+jTeT+PrQzPgkX8S0GX/1HAXjuWQ5CyFQ5fie3T2mpkNjfsLAIOfgmDIrzIdLLch2buVLq7j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:59:26.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c48abdf5-4178-4237-eccc-08deaf4c5e1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951
X-purgate-ID: tlsNG-4011c0/1778497173-7E58E8B7-009DECE8/0/0
X-purgate-type: clean
X-purgate-size: 1312
X-Rspamd-Queue-Id: 4F07A50C66C
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 11-May-26 12:53, Luca Fancellu wrote:
> Hi Michal,
> 
>>>>> +
>>>>> +static inline bool v8r_el1_msa_domain_sanitise_config(
>>>>> +    const struct xen_domctl_createdomain *config)
>>>> Why can't this function be common? I can see 3 definitions (Arm64 MPU, Arm32
>>>> MPU, MMU) but they do not have anything that would prevent from generalizing
>>>> them in a single function.
>>>
>>> I can do a common one I think, just to be aligned, should the common one behaves as the current implementation?
>>>
>>> Arm64/32 MMU: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE allowed
>>> Arm64: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,PMSA,VMSA}  allowed
>>> Arm32: Only v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_{NONE,PMSA}  allowed
>> What's the reason for allowing NONE for MPU here? None denotes property not
>> specified but at this point it should be set to a default.
> 
> We treat NONE as PMSA on Armv8-R, so either NONE and PMSA are valid and lead to PMSA at EL1
NONE denotes property not set i.e. set a default. IMO at the place where we set
a default, NONE should be switched to PMSA. This is a cleaner solution than
giving two options the same meaning. Sanitization could then verify that indeed
the default setting took place.

~Michal


