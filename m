Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO+4AMDflWneVgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:50:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D941577D2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 16:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235812.1538666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjoY-0003CO-4T; Wed, 18 Feb 2026 15:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235812.1538666; Wed, 18 Feb 2026 15:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsjoY-00039t-1N; Wed, 18 Feb 2026 15:50:10 +0000
Received: by outflank-mailman (input) for mailman id 1235812;
 Wed, 18 Feb 2026 15:50:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vsjoX-00039n-An
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 15:50:09 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7df48003-0ce1-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 16:50:06 +0100 (CET)
Received: from CH2PR07CA0065.namprd07.prod.outlook.com (2603:10b6:610:5b::39)
 by SA1PR12MB9469.namprd12.prod.outlook.com (2603:10b6:806:45a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 15:50:00 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::1f) by CH2PR07CA0065.outlook.office365.com
 (2603:10b6:610:5b::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 15:50:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 15:50:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 09:49:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 07:49:59 -0800
Received: from [172.17.121.74] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 09:49:58 -0600
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
X-Inumbo-ID: 7df48003-0ce1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HA4+Q9NHKYGncshG83j3/NYPK5U/UmUCnWXPTcCm52yhsED6cWyz7gJWYSl5GPc8SZXEX/CiWd73PhiEkKsaWiXqziryBoQV74+R2pnszRb9z+aR3I0A5KiQsYJo6oYOP3G52ImYIXPCFKSu4JT6xP4OMsFzAd7/ZYW/4fQIqMhaiu58MYu+xtCiZRFHE7DQUB5okm34XJ1/bWyXMmdmAclQh+PyRLCh5Nfqa58IBYBWH/C0P46H7YE/pzIb24LI6nbX+f5zdl6l+kWgcxEJKSlMbfBz+ccBBtz2ygtSYRDKPcSqsUf56zZp9jCS0QyZETf4I1Pyho3mjpmmpGQxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiDC6gGtcvi+Z1M7pdgqZLR9NEQKhSwZ1067MLtFS5I=;
 b=esjr/cXrHZ79Q5Mw0Mo1ifEPcaocboeMO2nsh1kcfWVv4HM2/7kCi5nT8wMqDMe31MS0FQKUox2eDDZvB0L9nDQI8xNONXwtP2AZg/ukqQIDhhhGgaOOlyX9/Pp4OOirzyTVo5OQb4W4NsBYOeGXCDKIrajT0nsum9UEPM5RzpseaySpXiVe7eAwfcGjLjYWkgbqFa67ABuBPGK4fmTct3yWCszEZEBma3znJB0H0iSN95rHA01HdQtNaeSg2DSrHZIRS03uFsba9hYpDPrCFADisRBbF6yYWh0AxsshuO+srUMktTxZaa1TgltKlr9FKxnLEoDkaCyJlwc6Hq5tZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiDC6gGtcvi+Z1M7pdgqZLR9NEQKhSwZ1067MLtFS5I=;
 b=tSS0J3q8CVAjFEdmyHs5Yq+v4RJKqeF5Vr07xAUzLkzeFl2dlneXfReMXMB/KCsUsQZj0jLN62NcKJGl90lpP+N3o+lx06ej0UjrXJMT/IuhxgoUIGOgI3O6lzAEdC4zv+4kcKpHXc8KZYl2UbMZ4XpEHM5cwtRfpyGhRtgFpfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <259b799d-33bb-4180-9816-f9bc316b8d9f@amd.com>
Date: Wed, 18 Feb 2026 10:50:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] vPCI: move vpci_init_capabilities() to a separate
 file
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <c90890f0-2e6a-43d9-84f9-b0ea19a11d3d@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <c90890f0-2e6a-43d9-84f9-b0ea19a11d3d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SA1PR12MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e801c2-8075-4995-9811-08de6f055f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWI2ZzRrYW1XajNSSzI2N091bHR5dEZUVTAvWG43M1QzT1lCY2g1cUpxMC9O?=
 =?utf-8?B?RXl6dWVCYk5GbGZaaEhEbWtJWmpQL3licHByNE5kL2FqYWs5a0M1MVZoQld0?=
 =?utf-8?B?RjUwVytJWkhDZ1NHV3JGWXFZZWhuM25FSXRTSDR5dGJUN0UzODBjVE91NkZO?=
 =?utf-8?B?T3lGNlNiOWdGc3hnMEc1SG1VSGViVGtNRFMybVlOeDFOeGRieUszN2s5QVE0?=
 =?utf-8?B?ekJ5Lyt6aXU4TGFiVHA0eERZWWdqVVVLclZGT1Z2RkhJZGhsVHpyNyt2QVlr?=
 =?utf-8?B?QW9QVEJwdXhiQkN6MTZUVno5VHBvaERPRTVub3ZrVU50RTV5SnNjZnJRVUVa?=
 =?utf-8?B?S3pWYTZOd0Vpa2daRFBNbld3MHdNYTNpWDFHSXhQTzRLSjVqUUQydkZ3VDFJ?=
 =?utf-8?B?cDh5SEYrK3Fqc0VnUEMwd2RDRTN3V05wU2k2MVhwcUNBU3dMNDgzOGtLTUdK?=
 =?utf-8?B?TEZDNDIwL1BtODZ4OVhOZUxGZUtJdXhHZUxsK1N0M2Q2SUNrWHlnejc4dzht?=
 =?utf-8?B?OXE0dXZHNTd4SlRSSmN0ZHVmRnpraGZOUVRONGVGMTNWd2dxb1RqN1lvR1hz?=
 =?utf-8?B?Umo4RmU5WVREbFg2ZGhIMjF0eHpNT1lQZm1JYXd5S3oxZzNEanN0U3BtaVll?=
 =?utf-8?B?N01LTTMwVitxUWJBYldpRFA4YmRZVnU1czEzRDU4V1NqdGM5VzZPYTdDZXVy?=
 =?utf-8?B?MUY4dzE4eHptY095dG9FS2psRk5TQTkrcTZtRFhuWEp4anFGM2NqUkxUWWI1?=
 =?utf-8?B?elJVcExJdTJWdW5YV1Z3TkhDb0t3STVLd2doYVphaFVtYWhTZVhGSElJL0dY?=
 =?utf-8?B?TTF3ekpUVnQxYmRuU2ViMDQ4WFlCemFkbHZkT0NlNXdzSnN1djkzLzU4aDZu?=
 =?utf-8?B?OUZDTFVEZHRMN3IwakJHMzdZZmhGc0JlMElRb3hJeHRzb1pMVmdHQ2VOYWFF?=
 =?utf-8?B?RnpzTmRENWsrNUFOSXdBUW5BMDJ4VXlTQmRBaWRXQllkK281Rlp4VnRvN1Vs?=
 =?utf-8?B?ejY5eTRXZEVxN0I2Q25ES3l5QXBKMDRXOFBWeG9ZVkw5M1BidzJST090ak84?=
 =?utf-8?B?UjJxaFhQNm1SRXVRWXFLSUFOa092UjlCQVBTdXRLMExhS0ZGS05Wd0NvM2tC?=
 =?utf-8?B?c1VqRjIra0o3dElOLzZIV3dLeTVxMmJ3ODM0bERHQWh2R01zWnY3a1EwZDJP?=
 =?utf-8?B?QTZ0cTRUdm5FL1QzYUZITzQrbnV4enh5Nlh2UTVaYU5oME5XeTgxZWMxbDBz?=
 =?utf-8?B?UngyS0dtbnpsSEU2aVB0Z29sTG1ENUd1SFo1dDJBakxFTTZJWUQxR3JBdFpG?=
 =?utf-8?B?d3pIU2doR09sR2dSSEQvZkhqRnk0bjQ5NVFVYWRoemludkllV2pqdzJ2Q2hi?=
 =?utf-8?B?MXo5bmhZMlZXaFBlZGNvMkFGN2JMUkd6dUVXRmQrdUZtRXpldEhVQzhoRXdN?=
 =?utf-8?B?Z0k4MnBlY3RtOEZEeUxIc3ZHc1NZVFNtUy94c2Q0WXVGemR2NVBVU0JmbVlI?=
 =?utf-8?B?RmV4R05hT2kyeHowZTY4ZGpvbG9oNVNZdWpDZ1N5QjJ3WisvZk50RWlVWER0?=
 =?utf-8?B?K1diWDJsZCtNZ3NrY2V1ZWJqaHJ3RnpwMTMvQkFLWERCdjFmQ0kxNG9CQUJ6?=
 =?utf-8?B?dC83VmErb1RreFlySzkwbzJRUmUvVlFOM0lnOVAvTmc5N2U5SmJvR2d4UzRN?=
 =?utf-8?B?UHdmMWtOQ053TEVuMis2OG9UeHZQRzQyTlJhUVd1N1FQcUdvUzFndFU5WXh6?=
 =?utf-8?B?ZlJXTGdZQm1Ycm91ZFk1N3B5ZmlFMTFscXE2aFdEMU80TENLZGR6SXdJMWR0?=
 =?utf-8?B?dFFXWmRuU3oyRER0eURJRElETE4vNktPZTNyWWVWakZBNWE1NHdHOVBhZ1c1?=
 =?utf-8?B?cmljMkZrNWJtMkdMR3BPMCtldjBwanN4Z2ZFTERqMnVJdithR3FpYll4SmVU?=
 =?utf-8?B?NmlHaTV1ODZrZDh4czQySGlLanFKck40ZnRJNmN5d21GQzAyclhMV1JjR2Yz?=
 =?utf-8?B?V2ZzVnp2dWkyY0RHVkNLb3lFaTVnTEVEU21BUGpBYklKNktvRnUvcEtXL2Rr?=
 =?utf-8?B?Q1hydlQ2L0Z2cnJWYnNQNnJ2aW1ySCtJQjlDaTE0cGkwcGpjQnFCc3dLazNk?=
 =?utf-8?B?SU1OTk1OU1NJQnVkOFczd3MvVEJFbXExNSthUmJoTENvaUtLWlNUaEVyVTFY?=
 =?utf-8?B?YnVaS3ByQmFIbUYyZlZkYVJHRUEwd25jNU0raHRwYTJEY2FGSHdwUXJ4aUNW?=
 =?utf-8?B?azdpNTFsMXd0WHlQRi9MS2d3dlVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0g6y1M5VhnkZ1WjYa5NmelttlMXnUN0HE4EkYoItzSLBOO12mZ1dKMYZ9GwjQwDnch1Tfq5zSy5B9zArP2eSCID9NJBYxqgkzmwzLgD1a3yxNdTLNNL7bakfr/c/USyvu2fGYOjlPF73FOaTFq+r1waDcQ0bdzGJOBBxrdqXXEZ4IVbSxOPGF92zwnCw6Td/00GCXKgfxHcvYYIg90ookUGgI1VegreEIurGpY3auNNACVLeqBSOnWPcUOcLxjjRJdcwqw7RLdA5Dl/Zo+J+eRxUruPqIcUGJve47XW1XZp+qqjLhTizOndP5lZpJchyuTMa8SfAMGVG+nq2sh5zlGhI+5wRGG7C9bpZOJ2+rOeSB8ScS2ToRyiYlW+aC1KPaSkvI9mLfhtO583eM2k7D7HQt9vRD9NXkaUvvGYwpFT7iAWj9ZuYP4VguXGgp0F7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 15:50:00.0766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e801c2-8075-4995-9811-08de6f055f85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9469
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,suse.com:email]
X-Rspamd-Queue-Id: 57D941577D2
X-Rspamd-Action: no action

On 2/10/26 05:54, Jan Beulich wrote:
> Let's keep capability handling together. Start with moving
> vpci_init_capabilities() and its helpers, plus splitting out of its
> cleanup counterpart.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> ---
> vpci_get_register(), while now only used by cap.c, didn't look like it
> would want moving there.

OK. It seems potential opportunities for compiler optimizations would be small
anyway, and this is not a hot path.

