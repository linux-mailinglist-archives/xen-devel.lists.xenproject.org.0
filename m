Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP51DyyU12mGPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:57:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D513C9F15
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277177.1562435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAo0Y-00079C-Gy; Thu, 09 Apr 2026 11:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277177.1562435; Thu, 09 Apr 2026 11:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAo0Y-00076U-Ci; Thu, 09 Apr 2026 11:57:14 +0000
Received: by outflank-mailman (input) for mailman id 1277177;
 Thu, 09 Apr 2026 11:57:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wAo0W-000764-Jz
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:57:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAo0V-001WaA-W5
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:57:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69d79413-e002-0a2a0a5209dd-0a2a45058c5a-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:57:11 +0200
Received: from [40.93.196.30]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69d79415-3760-0a2a45050019-285dc41e0efd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:57:11 +0200
Received: from MN2PR02CA0021.namprd02.prod.outlook.com (2603:10b6:208:fc::34)
 by DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:57:05 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:fc:cafe::a9) by MN2PR02CA0021.outlook.office365.com
 (2603:10b6:208:fc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 11:57:01 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 11:57:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 9 Apr
 2026 06:57:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Apr
 2026 06:57:03 -0500
Received: from [10.71.193.38] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 06:57:02 -0500
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
 b=Ao8VUwdyLmKqzzbopv6Sdi8QfGdlabxeDXx2ZsnXoBGJcpwmHG8ehuVs5BaDpmO88wkHjVpRAr6sDIOoIbl8LZO8PWQxSTmA4Up62lKI8s14f9M47o/ePu0lxxHwuzKlLlkQsOOZlr5V4OwZRqlVjcsXRBNgO6VLEs9DA4VOe0itry8Y8B07yU3LD95KlPxT7QoSktbiQcjqyHJD+lzzpqfTDdOQyQ1x2U7x8/56wD6eIhOktvhPFBvIj21y5EaJvaXKNj7W+WvT2ReAbwGEfrsyQmiuH5JtgQZ9d0gRsLJ1RnR+cCKPPlEe6Ja7cu9UF1HDZBU6Xe74gUbXdTZehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXExszMZ67RnxxH0ygAn7t7lzcVur9vBZUkHNJOVmnE=;
 b=xSJ9hfATKtEfokBJOXy0crMm8cWKQ8Mv8KszP9K51pzX/0wRyCm0bzYiJ6gkMcQv66WcwelI9OAjEbk4V7v1huuUuVjp6km388QUNCgOhQ0jnl3vxnkgRfwgjIKjhuuWW0eUk9SKHKXQGHjS/Yta92bHKMAI+/6m9ebSwqaHAwfaV4W0pUDHZdB1r2yNF6w6jdPBWQAG/t7bfj1WRXaqTFkh7Lven8Oa8ltflU+V5J9Bd9/hBLV9lUKaXWhjtVl90c+o6b6KJ0/7NAbNqQ6PWE7sIMtHTBK6clyYe2e1mz0sqzOw1pjk7F1MXczHNt1+BoGnNAMHZ+u+7frN05WrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXExszMZ67RnxxH0ygAn7t7lzcVur9vBZUkHNJOVmnE=;
 b=kz44BtJivWzCz1nA30j4iD8tq32oEkJp9qzaOmEnNWQTDWPTEb5wJsxs8AkkDp/9bZcFWClPSerwXAGKKrJBBiVKl7Z9t8h1CbHf7nDjt3vnr06qsw4UbDkXArKscDHt9UOwNpHb7ZgQlPivTwv666ZiJmoP5ceRFBVvNRWNxK4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <83152d2d-aa85-4a06-a73d-25c1d2b06fa8@amd.com>
Date: Thu, 9 Apr 2026 12:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260409113934.197619-3-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 6865b28f-f85a-490a-08ca-08de962f1ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZRE1aMOef2OKaRV+a8IHpQBN8stUcVCj8MrkgJwmcHhOGCzxXrXI/ehroqs1eRUupwxcDUaNaro5YMN0vau1VsrGUx1EFeHMcPn73CRq9+ELWC/JW2gYb8ZkDXnDc0WxvMs2jqAENSQG/5fr6pjmnCR/ltc5+Dar/M8JcmxqV7bTrdeEA0ahw1g4a+Zvq6lC35S3tGF0Qxr/Wry53tsYGmw3o5ca3//gcl9SBYYrooRD8cF2kPwIdnnG5hlUQFPMt+TIxr7lFZXL9KZAwvqG4Pam0jUtQqvZT5B8oCohonDJqOTeeghIp4ZuTR2vTIXDYVhJ95/RLF0BlOo9s9w03KShobqk0gvNeUXSeeDnXibNky3jmStpNFZoKosB7duNdX0rlKPk0REq7UIyR6XsstL2aht7OFnU8LZo5Cn6x1dAo4tKF/HjUFaN1JP5a/wN2PPr25WgSLWmV+VUOwEKke+dWYd07uXwwq1tuQUTU8WeNEwE6jJB2M5ERHOrP0N5haV7vndNi9tiVj2OGFFuXk4MvAqjC50V5VUi6rmDQV70+Pxtd3ZXusxr10vsaaOaqH+A0LcMWAZznPwHF9Sn+8LpjoPqwrSgSBKdhAkSPt9uroK14aR2/H12QMoYOYIO7kuQJUQnFoTdzoCVahwYyHMQhLdEJ1AzNRNdDMxO+HaiZEbpwIpoG8klrARVFDfTfG0ffyKIze6w11S7RGnGYznxbcnLnI93dHYxBPQj2uqCI2CwkCeyvI306TGShCv6iueOMn+GqE9BMPxyYt5ylw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/JllEm92xPiNdKyPBBP4w3yj+vkfScHjVj9e85sonM/Vpc+Bsth34UHn/amlJPBN3GnNsRtBYfdX2iWpTiMcYY3th4nhX74dP6ik5bgqNcP1Nfx80Di+30BXvaQmDlakEPgF0dY1kRhVt51S4IX6lXq1iprjf53vJRcKPZmDtr71Sx6bhfuSAPxS2XZU9irb5yC7U/5AFWiqu2AjhMwGcfIU0pfBcNEcbPcBL+I10wnezisNwUPSVeRq75aXJfjCblDycsxFtZKyp+yYjKq3OEcNbKy8/LAql1CorCBeqWjjmNx3S0ZhSTWZwk9mDiRvC8i9FxvOf/FAQ3LIpNJ9AF35PQgY8tnKwHKOzcxf2WrF+81ajsM9D5uFvF50GAyKr0mQzh8i5LUd7X7Pa4/Ze2EurD+mbC1SpkwS2+AGhRpkkGMNtFrp6TrHAt4hAJT3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:57:05.4617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6865b28f-f85a-490a-08ca-08de962f1ea6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629
X-purgate-ID: tlsNG-c201ff/1775735831-2312596F-C0C8FA93/0/0
X-purgate-type: clean
X-purgate-size: 462
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A3D513C9F15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 09/04/2026 12:39, Michal Orzel wrote:
> The check uses >= to compare the total number of colors against
> max_num_colors (which is ARRAY_SIZE of the colors array).  This
> incorrectly rejects input that would exactly fill the array.
This seems related to BVA as well.
>
> For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
> for dom0 would fail.

Why does it fail ? Is it because the max number of colors can be 15.

- Ayan


