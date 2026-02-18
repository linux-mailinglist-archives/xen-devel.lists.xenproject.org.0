Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMW9NEV6lWl8RwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:37:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4791215422F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 09:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235356.1538338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsd3S-0003vs-LI; Wed, 18 Feb 2026 08:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235356.1538338; Wed, 18 Feb 2026 08:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsd3S-0003tD-IL; Wed, 18 Feb 2026 08:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1235356;
 Wed, 18 Feb 2026 08:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4Gf=AW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vsd3Q-0003t7-9f
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 08:37:04 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fac7ef52-0ca4-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 09:36:55 +0100 (CET)
Received: from SA9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::10)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 08:36:50 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::95) by SA9P221CA0005.outlook.office365.com
 (2603:10b6:806:25::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 08:36:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 08:36:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 18 Feb
 2026 02:36:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Feb
 2026 02:36:47 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 02:36:46 -0600
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
X-Inumbo-ID: fac7ef52-0ca4-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikxP/czm00Q+XewO3o/1YNG6mfvGcIxW7MeVdNgKIM1vw2/wTqCuXFqHEG4tHrqyZWea+/Om0D96XOcqqc1D4xjOrfErZnES/U5RUjGINhMsCFuD/DlCxoyikZ/YY5CAZkuoLviI/7AIW/7azFvivdDhjWTDDxjA0h2lFhmRg7SeoPVlDBz1fHYhKSvFnzFQnT1kjtxhYwVcz0lzPonrL/HfUc2+s/gudUQ9Tgq9nvHjXBuuRiAbnsxMWbcLZxkZTqMu/ba3LcBxyMrKmM76V1sQIC28qZUOE43EqXvxBiKK0mkCzCUf+7qrb1MuntmQspAOcp8KhxkFPyja+RhPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDhqwGjgmTtz/7TbZy83bZITtVkDy+KvULq8YDdE1pg=;
 b=KIbIn7/hl98q+8Ybj0r0Y8n4FmuRCRplKvo47UmZDK/haVOrGKYUYPty6pLvRMEFDKecA/EWUuyqY99UgxX2LR0SIMQEUyxOLBr1Jrn5zvL9mqlwV6+BAi5G+a+zXSbQXeguISouwsT4PBfwujlvS2c+2/3GtbfoxJy0bdCRyIVViIY+Kc5lXkV6pn8hpvgAWgBQu0P4/DxtrobmjIbtTcl8bL7ecsatSLW33Re3ykGlXv9rMuYoOJkdCDqA3b8gsxOFImi2vro+o8AfHlONm+N+jXPqPebJavL71+rVKrIJe0BgQA5bj4IHc5hobkhjmc0Yzhl1VWeRqT1R+NV54Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDhqwGjgmTtz/7TbZy83bZITtVkDy+KvULq8YDdE1pg=;
 b=NRS9sJsyfxDmlTK7pMj65P07Xdp1Ht+zVkR7bFULuFe9Z6S1zC9n6DgERyK8BFlHoH3EEVEq82d4DYRr/CFfJy29UYpIEqyfylswlHq3CbdNiLeIxcku/PF1IxbIxH605Ydzu1h4A+d1wAvtj4LbcRbdNFWufA3ejiEfQpZ4+hg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <526d338e-8648-4f90-8006-35c639bfa6bd@amd.com>
Date: Wed, 18 Feb 2026 09:36:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tighten translate_get_page()
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <1d898900-1072-4ea6-ac4c-1262905cab29@suse.com>
 <abd54c11-28fc-4487-a2f8-733007d361ae@amd.com>
 <9163d0b9-f77e-4c13-b986-2d890bdf8ccd@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9163d0b9-f77e-4c13-b986-2d890bdf8ccd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: f35c64d8-ee01-4961-f0eb-08de6ec8db3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzNkdFBvSGRDK1A5NUI5VThmYWxxNXJ2RHMzQmJjL1A0eTFuYUNsSW5OY2Nv?=
 =?utf-8?B?QXdpMHd0eWFpeUlFTmZaYWdneEQ1azgreFNtRFRmMjU1b29zZUZvaVRzc3l3?=
 =?utf-8?B?S1NJWGVhMTRNQnpqL1BXVDF3NktucytlNTF1QlpTNTRVbExGQ1MvdjVFd1hK?=
 =?utf-8?B?R04yaEh6ZWg2YUlmckZxTjJXS1lFU3FzNWFZdDlZRGE2ak91TTRqTE5NeE1m?=
 =?utf-8?B?SGZVOWMrbGdjWEFybXlqVXpvUkZuRDAwenIvVlRMRkhZV2NrcE93NU9oMVlQ?=
 =?utf-8?B?QnB1MUtrUWk2cmpiYmRDU3kyZGR2N3Q4Y3k2TGNEcGNVNWNpcUhVb1c2N2lo?=
 =?utf-8?B?dnlZNEJBSC85S0c4c1cxd004bStIU1ZRb01mZUxTRVBoaEhHTms5dXNnV1Jr?=
 =?utf-8?B?NDN3eXE3WmNCSC9SRnhHSnpMbEFNNnBTYUJ0NFlseDB3Y29idCtQUmxYZ29P?=
 =?utf-8?B?blNwZ0ZHRnQrNlcvRGxGa0ZwSHJWREdpRnB6R25UZUxqMWk2Zk85eXN5ZVVP?=
 =?utf-8?B?Z2sxNWZBenVPQ21ycWxNSCtIMHdBR3RXV0tEZk9SdFpNM0ZDOEJCUTF5ditK?=
 =?utf-8?B?RzVEYmpXcDZKSnlvRE5OL3pzSWpMZTBYYndSOWJkNWdYMTBHMVY4UG1WSEVK?=
 =?utf-8?B?WCt5eTBidDIzeVZWbkJBUGFnNFNaOXZKUjdraDkvalFlc3Z2Q3g3bUs1MldO?=
 =?utf-8?B?cWpnMzd6eDB2YTlXYmVrNVQ2VWQrRXlwUU84NmZ2STloMGRWK0UzN0pWZGtU?=
 =?utf-8?B?anczTWY4dmlmRUxkb2RIRlN2Q2pyeWp2NlFlaDhzd01scWlEWEpXT3kyK0tD?=
 =?utf-8?B?bnNPZmlydnJIR2xrUUNsTFpPdW9SRSsyLzRQaFB5MHRsM05LU05BbFM3aFU4?=
 =?utf-8?B?YUxJT1R5L2lvckZhRGNneEZDa2RqY2lFcDZYOVV3eENwZnp4ZVdSbG5wbDNC?=
 =?utf-8?B?MHNDQjBSNU5BQnJySVk0V01MLzVNTnhvZi9heUZMbUdndWhYMTJHd3EzZDlp?=
 =?utf-8?B?TFpVOWN2Yy9TSzFqdy9oVE9mbmlsUXNIRmVMaFFjN2QrajZ6RGsxeGVXdDhI?=
 =?utf-8?B?NVBWVkFkWE5EMzFycmp6SEo0NFlicDBJVDgzN0hnOXhvQWZNWU5MWmdObTRw?=
 =?utf-8?B?NjdvWlpGZnFhdUIxbEFsanRmN3BWTm5EdW1BOFdGWEZtNXZJeWpmYVAwQlZL?=
 =?utf-8?B?QThUZzFKK3hkbUJ4eFhLaTZYdkV5dEFKK1FCbTcxRW1Zc2NmR283YnNHZ0dT?=
 =?utf-8?B?NzgrTVp2d2hoMlVoVDU4ZTJpMjdmTnVyOWRCbyszYjBZZ0hNY29wMU5qdHBn?=
 =?utf-8?B?cGFsL1JNWnprakpOU1I1dEQ2SnZESGcvYjR0eUV6YTN0UjkzUDlHWXZlNGVl?=
 =?utf-8?B?SGRKY3FYUjdhckJOZmx6bUJDOEo1UnB5MmlNVGJZWDE1eTFmd2x1RXQ0L2lF?=
 =?utf-8?B?bFZPTkg3TC9IYnFhWnZOVE51aENQbHJTU3IrdDRObjV6dEEwTU1FR0ZlajN1?=
 =?utf-8?B?Um1kRkwvZlNuamlOV0xGNlhlYWRodEZzYWowbUkxL1A5S1BBeThVcmpJRVds?=
 =?utf-8?B?UHNCVG5ob0FObmpmWEVYdXY4dWdLY00vcEdVMC9xZjNYYnZkT2gyRTVlVktC?=
 =?utf-8?B?RzFwNWVIMjloOGZ5MnpWUUZvVHY3aXJBR1FCRy9OOGcrc3JQV0JZb2pKaWpV?=
 =?utf-8?B?Z2wrQXgwdzRzS1BpaFRRNFdxMVZJMXkrUHVsSzZybzhyOERGampiR1pNNW5W?=
 =?utf-8?B?czFnTVdUUld3RWV2cFdvWHBxZGE5R01CL0RFVnNxNkpqbTB2V2c4VDI2YUli?=
 =?utf-8?B?YUd1czRrWlRaRnYxaHRERTFENWxGbUdDeXNERmhraFUxRmFtakN2SUxFTE5m?=
 =?utf-8?B?OVZ0ZFpPOEpRS1RjVU44VXpkaUR0RzllQVpEcVhZOHczMzBJaDFFTWtia001?=
 =?utf-8?B?bGd0Z3lvTGFmN0FWNmpGOFlzMjFhdUxLWnhmck44czl1TkhRaW1KeDk5S0RD?=
 =?utf-8?B?dEJmVjJuaWZKdVEvTTdqQ1MzNTdYUFN3d1FhRFhPQWNZY3NLNzJ3cFF1RjZm?=
 =?utf-8?B?Q0N6V2tnYnlWY0lwaGIrRldQcTR4aUZsdTFsQXl6ZzU4bXFJWmdPOVBvMjVB?=
 =?utf-8?B?M0JVeEZsemkvbnBNYmdoSlB6ZXRldG1WSFBwblp0ekRPSlhJNTBCSC8xeTFU?=
 =?utf-8?B?c1V3bzBtazFqNWFNNUR5a2tEam9Ma21QTENweWJxUDNVVndKeklMUGlyRFpx?=
 =?utf-8?B?cTZQWEJnbjNlbmdCMm1hRG5STVB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xQC0A0ioxfNnjWu2KcMwwtK4EKeucVhpPDqHfSMGONrDnh9Ah7SbkbFn8H93mu/6jDRfhfL9xd1BkEHoorLDQl3UsqQpd9VbVWJbuBc4w0IBxsmjsa9t2teCArA9VD0slY7oxS4YfMW+l7BLH/tn9ARhwBLO29VF6TVkxwmC/B3xv1nLkqQrR55Gqh1bc9mHVsERXVZc/x4jMLJLShAEvPHkSjHAi28sEawkNn4O40US8smYizgw65bQ7KkNt9g4oOVkMYhPbJpKtvHuY3CZWuaORE5xC9FL6fIPm882fVdom/jFI0Qt+vmxrnVUEk1eFjodvnw8pqb4BOLya6KUoTCzTYSt9N14U9vzvjwviTvZjltA5DNIF5PTR90mI/NBnRiRgtbmtP/A0oxf9RxbBLbld80m4TzvLSU72cGL+49p/f3GMEj3cKWQdol83lqr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:36:48.3254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35c64d8-ee01-4961-f0eb-08de6ec8db3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4791215422F
X-Rspamd-Action: no action



On 17/02/2026 16:54, Jan Beulich wrote:
> On 17.02.2026 16:28, Orzel, Michal wrote:
>>
>>
>> On 16/02/2026 16:20, Jan Beulich wrote:
>>> Permitting writes when the P2M type says "read-only" can't be correct.
>>>
>>> Fixes: 1661158723a ("xen/arm: Extend copy_to_guest to support copying from/to guest physical address")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks.
> 
>>> ---
>>> What exactly p2m_ram_ro means on Arm is unclear: The comment next to its
>>> definition says one thing, its use in get_page_from_gfn() says another.
>>> (I remember raising this point before, i.e. it feels a little odd that the
>>> ambiguity still exists.) The patch here assumes the comment is what is
>>> wrong.
>>>
>>> --- a/xen/arch/arm/guestcopy.c
>>> +++ b/xen/arch/arm/guestcopy.c
>>> @@ -44,7 +44,7 @@ static struct page_info *translate_get_p
>>>      if ( !page )
>>>          return NULL;
>>>  
>>> -    if ( !p2m_is_ram(p2mt) )
>>> +    if ( write ? p2mt != p2m_ram_rw : !p2m_is_ram(p2mt) )
>>>      {
>>>          put_page(page);
>>>          return NULL;
>>
>> The ambiguity you mention is indeed problematic. This mixes page type with p2m
>> type. The comment "The p2m_type is based on the type of the page" admits this
>> conflation for DOMID_XEN.
>>
>> AFAICT, p2m_ram_ro is not used on Arm for normal domains. The only use is in
>> get_page_from_gfn() for DOMID_XEN. Maybe we could change get_page_from_gfn() to
>> always return p2m_ram_rw since DOMID_XEN has direct 1:1 access anyway?
> 
> But that's not correct for cases where share_xen_page_with_privileged_guest()
> is passed SHARE_ro. XENMAPSPACE_gmfn_foreign requests have to result in r/o
> mappings in that case.
Yes. Therefore, on Arm:
- p2m_ram_ro is never stored in P2M tables for normal domains
- it's only used by get_page_from_gfn() for DOMID_XEN pages
- it's used as a signal to install p2m_map_foreign_ro mappings

The code should stay as is then and we could modify the comment to say:
/* Read-only RAM; only used for DOMID_XEN */

~Michal


