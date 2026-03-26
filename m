Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLVhOrdmxWkn+AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 18:02:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0C338DA3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 18:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264548.1556050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5o67-0000X5-IQ; Thu, 26 Mar 2026 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264548.1556050; Thu, 26 Mar 2026 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5o67-0000U0-F9; Thu, 26 Mar 2026 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1264548;
 Thu, 26 Mar 2026 17:02:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5o65-0000Tu-QJ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:02:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5o64-001SS2-Ct
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 18:02:16 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c56694-e002-0a2a0a5209dd-0a2a4507cf04-16
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 18:02:16 +0100
Received: from [40.107.209.59]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c56696-fd74-0a2a45070019-286bd13b4f5a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 18:02:15 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB5808.namprd03.prod.outlook.com (2603:10b6:a03:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 17:02:12 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 17:02:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM5lhlE2ZfjZdgeN/EMjgV2XydkcfNAllbqJr3nzL7PKh4SNJTUJYAWlC5d2CvthqGYzYoL9PpEnufFjkWfd9FxmC2SVvTGrMtDwkLysE82x/Cy9uxa0tAS0yS3CxJGEQ5R5H3/Ux0I2lwAyOSZFLfCbfH9fInrTP/a97D42tunRZJDppn/y6WEIx7G06a9DU4LO1/h9O7V7shrC2IE6RMEXM5vg4i88/GfcJrmzd6w0Aomr8Q8bGLqVYfN1TZqQqNzTVdDFFCWc4ebKOARDf5vYl2J8BsehNkCXPg0nz3LG3nxZdjXpQ9Ps1jTKj6zwsqlysa0pLA6CHBi7GJMY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6VK0tBK1USArK7lw3mvrKEzA8NfUXcwx2mbQe36k8I=;
 b=OE52pfmYrDojVzhflKhjMbbFPcpBe7yul90s0yuOBy6QaqHgjx8prdgHHrrwzvalDrxGq0TYvTfqyt/VHTPz/kWEIKg1rb4M0ZTPyE20JbdINfykpn9QE1W+VPvty2NUbLuN0UhlSKjSL20s9btkoN7MiM0QwrF+UldvCGtnzjffnTbOzuS/IQqmdTKIIfUzmV8+SC/mFayWt4+7H3WSjhXU1HzjI3GCuGtnLLdi0rlPlnlwUfkiL2ETJYHiocNhAV5aa58pN3AvQvyyHR3OmzY4Pj8sFDtQq9uXA6NR1hIo9Kd9gy1BkYJnYzCVAUBu+Y0uWYUuwi9uwn8rpsDSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6VK0tBK1USArK7lw3mvrKEzA8NfUXcwx2mbQe36k8I=;
 b=Oe4/+o2ZJx/s+tw2TLlpqy+62elLn36KU9CT2c9V11IOd4M+BBl94SuH80pUindY2Li1ZxosQDW5UY5drkeFioAP33GpGBynA7VxHUl0DdFIIO1lD7GaWpkda7wMUG+tInXnmNUDrAwiCz6ixCdowhEQ393sxHXKAH4VKobSq1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Mar 2026 18:02:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] xen/uart: be more careful with changes to the PCI
 command register
Message-ID: <acVmj-agJOAX9hGV@macbook.local>
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-2-roger.pau@citrix.com>
 <2a00a1d2-7017-4c76-8344-018eb3f30f50@suse.com>
 <acVNMQ_HqRpgkP7i@macbook.local>
 <b4b67bc1-c7e4-4872-a018-789d7e87dcb2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4b67bc1-c7e4-4872-a018-789d7e87dcb2@suse.com>
X-ClientProxiedBy: MR1P264CA0181.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 5510df7f-fe61-4468-4d00-08de8b596b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5SEaQ7aFOxTxP00pCHndLwAI8P+B+Pk3oko33yoISniSrO++QYLehisGQfrmzBhS5EN6a2GtCi0op+b2iuOK/p1RXXylhEcRWU5dYBekEhU49p8JEef+QAnZgVr3aCRYS+dvpZoce/ey9FxHxQN5v4WgkM18NGkT4Vu5rNDd1qX6MhnIDtRMlexvS30svrPg1iB3FComy+FiIl86k0h/P1vxcB3e1W7TC92mCngFWgxiNIp6o+25Q4phikomzxDKznzYxRumigEaSpkAPz57JjXaH7H1srpycx3eFt5PgUftNbJDLRJZrSb5WtB5P7+27HYEXcer0ns2Izq8Pi8AAariwe7Tl0giQp9kNH1qIHVze3zD7M7ac5WgKzqUHSanBXTk+ofJ/OiwS1MAEotVdI7RUxRKdq89Z5Ue5of0Inrc3PeOqgLsS0T3kq3DPnL6VTRb3Si+8N9S8+z204Db2TXBg3uYM8XvYMqWBx2ymvuy8y77WKOpFgBLdjNonREO5eo4DHatb7iudNKo/ly2BdhQZLeARRAdYP6kiKkyIfQtEWFHEQC9a6ZjZScW54fJ6xJaK7G2V46F0TYYG37VNSarhnkzhPHc0g6oQOBqjwtsWwAFV/9qIXjAXhqb9Qgtv9fUlLRqawnqUKih+ZRAZiijOAUZmL+OBHO3x5EWjYmyDMFhv9H6Pi0/jufBlYN5kX7In1xioxkWaxIxKgKkP0ROHQFKeQvBmQq/rM5b/RE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2hOTXZubUkvNGFZVnZxNFk2ZDlXOTF0WmY3TzhCTjJPdEszek5MTWI1c3p3?=
 =?utf-8?B?N1pOZUpqTW9QalRTMVd5MlhPWVdiSjV0Qmc0UFZYWkV3N0FBZFZGZTBPL2R3?=
 =?utf-8?B?RkVBTm1ZUTFud0VsWW43aTdhZ3BVNHk0bUkrWG9YUElxbTBPSGRnUkNBc3JY?=
 =?utf-8?B?V3BhbGQ1OGNSem5HaXEvMGpwTjEyem45Tk50Q0k5NlJVd2w3WGtHenUwcDY5?=
 =?utf-8?B?WmNKVXFabkZkdUdXMVYyWVNuSHpPcDM1eVhLTnJwSGtLSE52c0NCdEg3VG1K?=
 =?utf-8?B?aVc1a2ZPamxrRmMycHVEeUEraytSNS8yVlRRaUVwK1NSM0QyQlhwZGlTUGhm?=
 =?utf-8?B?VSs0aHBYTDROTDZYRzREQlIwY1FOQVhXZ2NrbUd2VUg3QlAzNmUvTk1sSDlr?=
 =?utf-8?B?ckpxOFpSUEk4M1gzK0toelQvMlZhalBXb09JUk5sRWFFRVdkM1ptM0UvV0E2?=
 =?utf-8?B?bUdGbklBQzYzUXAxTzNxMGZCRzFkMWt1TXIvZElMSHZ3S1Q4U0lHWnBIMk5a?=
 =?utf-8?B?L085aDhKK3J2VmE1SWp4VzNhb0puQzRqZ1hVQkdZUlFCZjdhaFZhS29aL1pv?=
 =?utf-8?B?cXBuTlByemxWVHBWK3VXcGEzVERQbi9zM01tYWVnWE9HZTVzSWV4UHlEa1Ja?=
 =?utf-8?B?c0tQY0tKQ0FLaXIvTi8vSElzbXowS2FhMllJRmk0eHo5T0xVZUhFeDFZcEV2?=
 =?utf-8?B?SUFsR2lpdy93RjVyN2tUaWlkRVlVVkpWaXdKN1JSSWU0Q3p2eXlZUXRqWW5F?=
 =?utf-8?B?Yy9sU1FnaEVKV21lckZmM3RHOXRzTTdScnpQRXdQZjhObnA0ZFp5MWpxRFh6?=
 =?utf-8?B?eUZPdXA3Z25lcjFscDJMN000Vm5sVkQySFc3Z3dkYnhDNUhaMEM2NVYrVllv?=
 =?utf-8?B?dHFtNHQ5MXRvMzlrcmNtWFVnT2RmblAwbzdReWc1cVFXR3hRcVZXa1U4U25B?=
 =?utf-8?B?Y2JMK1lUZXdDdGl3QUpvaE1qN2VoT2J6NHlEcUxqYVAweFJ6Skd4VG8rMXkx?=
 =?utf-8?B?ZWZoSjREZnpkai9uN29YYmM0cWsrcFZ3UjIzTzU5Zlk1NU5ST2xDNUJZYitZ?=
 =?utf-8?B?dnpJNElFSlh2eUxiUkdPeGFmNG15L0VPQldCL3pVcWEwSTExeHBUOEpRSUk3?=
 =?utf-8?B?bzNPYkUrU2k2Z1NYV2RoNFF6WCs0d01UUStWU0UyRk93Ymt4MlRZTko3eU8y?=
 =?utf-8?B?bEJnT0VYblUwQnlKS3AxdFQvMXZOakRHeDR0UmFRR2UzNk9PM2NQQTJXNldV?=
 =?utf-8?B?TFRsZUZDaWlMTFgzdWUwUUFxMjJoK0I3RjFnSU1POGRtZkFmcjhvS2hQQ21a?=
 =?utf-8?B?eTR4MkRaclBxV1lDdmdWTWZiY3BJQlBYa0FyOWZyOGdVVHZXUk5hTENBUGRM?=
 =?utf-8?B?c0hLaS9uRjZKaGcyb1V1NGNXVXZ2cTF5czdWQXZXWHFvQmM2aXdoT2ZheDl4?=
 =?utf-8?B?ZlZiT0prdGprQU95cnVBR0UxaVJOekJHekl1dHFUejhXTTlvVFJNdjI3dC9v?=
 =?utf-8?B?cVVuemZkOWthSCtFeDlMc0NnZTJVeUdQeW11ZEUycXVGdHVkK3JHOUFDczNq?=
 =?utf-8?B?U1d3QUN0TksxQjhCYUIzSXBKVXdFN2Y1NmlWYjN5N1ZTSzF2WkZTMDNTc0h1?=
 =?utf-8?B?SWVaR1NxM0llRGhDdjVnWkVMMUdUa2c1cU0vQjZPZjVhdlJBL0Y5bDYyZkFE?=
 =?utf-8?B?akFla3k4TzdBTDVJYkhzSDQ5UjFvZEVmSEpjUVNTSTZVOS9JNE41cC9FZllP?=
 =?utf-8?B?dXRuUDNNYUJMMFJZMGFrZ3NwK3REd09palIvby83MmUrYkNranI5a1M0UXFi?=
 =?utf-8?B?QjVuUE1vQTlvYTdqL2t2K3ZzMUZDeWlqRE5RVjJyQkJCREhlODRRdzg2VnNt?=
 =?utf-8?B?Y3hTRUtDL0xSWkF6SDlpZTlPUUJNd0xybjdWZU56NVpXc2RzOUczZk1VdXB2?=
 =?utf-8?B?Uk1UaGNGZGZXMHhVSjU3SjFXb3B3Z3pIM3dJSzlGbmRzNEFGeGNRalBsb1RM?=
 =?utf-8?B?Q1M2QzJobk4xVk41OTZibFRIOENLekphR1Y4aGhlKzhEcTdIc01vYzR0bnZv?=
 =?utf-8?B?WHlaekZLQkN4VTF0QVpWNENkUFhWVVArL25IRGt4SFdlWGFUUVhDMHFxZzlF?=
 =?utf-8?B?U0hIT2pTcHFNU280SmNBcEduSnRmaXV1VUx5Vzk3bTFaVVRhSjgvOXJVbGNP?=
 =?utf-8?B?cUVLczZpeFI0SURyUG9zdGV4TjVERzlSVExqaVlKS0luMGh4UEN4aGxDODN0?=
 =?utf-8?B?ZmRhbzh0eU1iRWRxNUtmMkFoYWhWZkVQOWFKU0xYY05FQnVHZS9DOGJCelo4?=
 =?utf-8?B?YnJhMm5veHczOWt0ZG91V01TaUVub2QvR2JDMWp6NGhWMXRGNTVXUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5510df7f-fe61-4468-4d00-08de8b596b78
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:02:10.6844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vo6FTANfrofrab6VDwRwWAJeCiec/DDI3Q0tbHoLBNIKDeVvpigimaMLrtbFXhmtiXcIbBzdzgVcDBcg6TzvFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5808
X-purgate-ID: tlsNG-ef75cf/1774544536-4E2B1303-2A0D6145/0/0
X-purgate-type: clean
X-purgate-size: 3901
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[roger.pau.citrix.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A4C0C338DA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 05:00:15PM +0100, Jan Beulich wrote:
> On 26.03.2026 16:13, Roger Pau Monné wrote:
> > On Thu, Mar 26, 2026 at 01:02:22PM +0100, Jan Beulich wrote:
> >> On 25.03.2026 15:58, Roger Pau Monne wrote:
> >>> Read the existing PCI command register and only add the required bits to
> >>> it, as to avoid clearing bits that might be possibly set by the firmware
> >>> already.
> >>>
> >>> This fixes serial output when booting with `com1=device=amt` on a system
> >>> using an "Alder Lake AMT SOL Redirection" PCI device (Vendor ID 0x8086 and
> >>> Device ID 0x51e3).  That device has both IO and memory decoding enabled by
> >>> the firmware, and disabling memory decoding causes the serial to stop
> >>> working (even when the serial register BAR is in the IO space).
> >>>
> >>> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> I'm not convinced Fixes: is appropriate here. There's nothing wrong with that
> >> commit, aiui. What's bogus is the device behavior.
> > 
> > Hm, I would argue that disabling command register bits for devices
> > that have those enabled is in general dangerous.  What about device
> > RMRR or similar residing in BARs, and Xen disabling memory decoding
> > unintentionally while attempting to enable IO decoding?
> 
> RMRRs in BARs seems unlikely (as BARs can be moved), but you have a
> point in general. Otoh devices are fully under our (later under Dom0's)
> control, so we may clear (or set) bits as we see fit to get a device
> to function. FTAOD, I'm not outright objecting to the tag, I'm merely
> questioning it some.
> 
> >>> --- a/xen/drivers/char/ns16550.c
> >>> +++ b/xen/drivers/char/ns16550.c
> >>> @@ -283,11 +283,17 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
> >>>  static void pci_serial_early_init(struct ns16550 *uart)
> >>>  {
> >>>  #ifdef NS16550_PCI
> >>> +    uint16_t cmd = 0;
> >>> +
> >>> +    if ( uart->ps_bdf_enable )
> >>> +        cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >>> +                                       uart->ps_bdf[2]), PCI_COMMAND);
> >>
> >> Why is this conditional? While fine for the use at the bottom, ...
> > 
> > The comment next to the field states:
> > 
> >     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
> > 
> > So it didn't seem like further checking was needed and that was the
> > sole filed to decide whether ps_bdf is populated or not.
> > 
> > However, I also found that when using device=amt|pci ps_bdf_enable
> > doesn't get set, and hence I'm not sure if that's intended or not.
> > Shouldn't ps_bdf_enable get set unconditionally when the serial device
> > is a PCI one?
> 
> I think this was deliberate, hence why ...
> 
> >>>      if ( uart->bar && uart->io_base >= 0x10000 )
> >>>      {
> >>>          pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> >>>                                    uart->ps_bdf[2]),
> >>> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> >>> +                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
> >>>          return;
> >>>      }
> >>
> >> ... it looks wrong(ish) for this path. Actually, in ns16550_init_postirq()
> >> we use
> >>     if ( uart->bar || uart->ps_bdf_enable )
> 
> ... this conditional is now in use.

Right, but then the logic in pci_serial_early_init() doesn't apply to
those devices (device=amt|pci) when the BARs are in IO space?

As uart->ps_bdf_enable == false, and uart->io_base < 0x10000, it will
return early from the function without attempting to enable the IO
BAR.  Is this really expected?  It looks like Xen should always make
sure the respective BARs are enabled if the device is to be used for
serial output?

Thanks, Roger.

