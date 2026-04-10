Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C/izMKhS2Gl4bwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 03:30:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D45A3D119F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 03:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278256.1563169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB0gU-0007ZT-5p; Fri, 10 Apr 2026 01:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278256.1563169; Fri, 10 Apr 2026 01:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB0gU-0007Xr-1f; Fri, 10 Apr 2026 01:29:22 +0000
Received: by outflank-mailman (input) for mailman id 1278256;
 Fri, 10 Apr 2026 01:29:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wB0gS-0007XS-F0
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 01:29:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB0gR-0075l4-6B
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 03:29:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d851fc-5cb7-0a2a0a5109dd-0a2a450692dc-28
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:29:18 +0200
Received: from [52.101.62.56]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d8526d-0df0-0a2a45060019-34653e3876c8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:29:18 +0200
Received: from SA0PR11CA0046.namprd11.prod.outlook.com (2603:10b6:806:d0::21)
 by PH7PR12MB6587.namprd12.prod.outlook.com (2603:10b6:510:211::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 01:29:13 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::79) by SA0PR11CA0046.outlook.office365.com
 (2603:10b6:806:d0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 01:29:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 01:29:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 20:29:12 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 20:29:12 -0500
Received: from [172.18.74.250] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 20:29:11 -0500
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
 b=kNdilBASwPDpbrJ3VCwijnbakOUkwxM0DfSgwIr+lLDbyFaZ2uwNGzn20O8u5Qc7YQR1WcWuLvUg9OiNcAhBhRiJiSW0pxGMw/WddfEZQUx8m4nNj+H6NyVHSAaqbqbydven9oaG8pK5SMKqtWxVrb/iMDKXKbfJkbMJtYsmz5bI+VtbTsuTUrNQxYKOJRUSDzcQ7RdmiR2oByZahbHTEvwABMnUwKWFiOnCt/TJ7BzE+ttZu5JfilA2thdEVQazUfJvARWGkjT55C5+EBvPonAFL4ZKC1vqbl0P+gfOfmmEUOGb2atEuRGjy44gBxjrW2T7XoelJLqWPCHBrH+bSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0bsIzui3PGykH5KUbAbBQrHCdLJrm/BZtqbBEc7Y18=;
 b=bROVlgGwh2XqbYHivaHVyuNU6WMmKmQaEvX31EhB9XZOr2+K/B73y77llm1XqOtI9dTBu+UviyBRtQ+kJYhDrVVUY0YDzqXSukmx0iUtlYVjKaFxXLSW56b1QPbxZjqMht9kKx9Ff4LgmMxa4fCiVqALO9TAinj1BqWzx+ZNCTh2+yGcZndPhEeYLS016le3Q9d/1kxCFxIfhl6YMrgF6KTUQA0OsUs8KC6RG1TVuHyyYLGzCVqkiJMefUuUCSRminogzmYhNKnS7Nv5gE2cdj79zH3zl43YCJaZxG/aoa8/OID/w0/BuygynVfHyxkyCPVtidpd7lt+H+M9OzTA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0bsIzui3PGykH5KUbAbBQrHCdLJrm/BZtqbBEc7Y18=;
 b=kN3BL5nksMlTXmHuoO759eFLuBYyWMqZMf8+tV7q5MKQwZFUG1P1PXS/UER9OBLHdD/NpeLW+VHRsYiCIX7ikdiqxHEdvM90/m0G+OUu+LEUlEbaojSkpp5IHrBIOjB9PJPXnfL8OS/0Z6BEiKPjjyl4K5vbtaSyXtlv20x8q0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <5f543029-64bc-42af-8fce-31d911800c67@amd.com>
Date: Thu, 9 Apr 2026 21:29:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: handle overflow in TMICT calculation
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <2fa2fb41-cb62-4a1b-84cf-822b2f97bc2b@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2fa2fb41-cb62-4a1b-84cf-822b2f97bc2b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|PH7PR12MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: aca8fb2e-46fb-40ae-4776-08de96a0926f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xXCET1mCsdlOgF9Yka1B/FuAQKqhtvbaVqM3cE2fX/jb1DCeGsb0Twyen0X6+hGDV/3+vni3o5tGUL0hHHnBa4Z9yWRlh73yt4qde3LjRtJkRexO/x3ejKB0ZQSIAa72SZENhQ+9i6B8nORfkyrA59R0pYbPoma9NmKtahh5s//lLW9DhwlYCulPfTunLSUNmwZM2ZrCUkszBEyHGTZHpSdHW2tj2CFEJ6T/DzgVh/Mt0r/PMC1ESnN6boMb/P7G2OkP6gPLF+P7CUrCETrTGPHbYRbFZe6xVErBHbXzmcU1u39PYD+c3QE+TMmLzqpQLRC6qB8fMBdHsAYosfyxKEJLCWzV4aTzuJWlyYXSPPNdnDvsJDvj1u5xMV7IaaGMBkRI1p2s23EeLSyfB+56ey9kpiEXMrmkGKZJOoboEapKE6CmlalRH/kl63IHdpOH0Yt0KTrz1mEqwluJPyJSToihSXvRUdC54OpYqd7s+g++FpjIKYb4xLMLGmgW1+FFU+KgXrPsKutEg/Kf7+ISwUz6B4TZpWZFhX8NXPY5YmOTDUTdOXrMrR5DtNrA5+7GuU8+9FCAtZxmg7OhlbuU0eU05Dn3y7rg7k4jIUoDGCd+MeGqxV87eMA5Pjy45ULyE6Wui+JVR/GQUt4WmiFGWUfSM9C1M1WL9vMIbItlP+yxHVhZjKuAOWjektd3mnHj+vBJYJF5VE0psrsnnnvjWEp+LWYKdfMzgKYXSVigpGMK7FiguINfFcTSYPx7EL1I4Z0FOhG40YnSIRThdU2isw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b8oZYnfzHGnomhZ0mmgS407KCXgpP+cmayM8tJUcGXUiDJ0uCBldda0JSO56Tty15TEMtXa0t1/jfSYPY8snpmlRYSfUkNW58oxUD6TdA9hbWrt9HjF6zWsVEF9V6QUc0a2Vqh4upgkg7aiDYturzd3mT4atEnGyNwXgfIBeSoqPJqwucrR8ahU98Uc86u0halFqpBPH8+LSk55diYGVtGhAIXtw/SSvF79W5MlulBsij9nQpUo/IU2fNJyH+nRI3epwntAZdlS9R5oXyHr3roo+BK7M3jPQRGj1QeVTMmFGXJ2TeL00yxP6EMVNMLqMgIPcXxu/CN/LT859wm+mHgMqb8qK6XJQ5Q+GqPHsdKfXUjRnea5UHjUaXO7u5oC7AuKGL/fkohufjCeDJ2SXkql6UAZlAMSgg6eCmu1pfk1h80HD881jZV2d5jXXQV2g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 01:29:12.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca8fb2e-46fb-40ae-4776-08de96a0926f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6587
X-purgate-ID: tlsNG-16d1c6/1775784558-5C7213D8-3B2AF377/0/0
X-purgate-type: clean
X-purgate-size: 981
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 1D45A3D119F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 05:21, Jan Beulich wrote:
> With an expiry value on the order of 20 hours, and with a bus scale value

If I did my math correctly, I believe 10 hours is sufficient to trigger signed
multiplication overflow. 20 hours would result in unsigned multiplication
overflow.

> of 256k (as supplied by qemu), the (signed) multiplication will be UB. As
> we've checked that the value is positive, we mean unsigned multiplication
> anyway. Yet let's play safe against even larger expiry and bus scale
> values, leveraging the compiler builtin that there is for this purpose.
> 
> While there also drop the stray cast from the actual TMICT write.
> 
> Fixes: 9062553a0dc1 ("added time and accurate timer support")
> Fixes: b95beb185810 ("x86: Clean up APIC local timer handling")
> Reported-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Tested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Thanks!

