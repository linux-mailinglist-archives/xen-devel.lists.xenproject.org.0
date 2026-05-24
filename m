Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKJrKlFAEmpExAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C435C0EFD
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318263.1586713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJM-0001Dc-6V; Sun, 24 May 2026 00:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318263.1586713; Sun, 24 May 2026 00:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJM-00019w-1m; Sun, 24 May 2026 00:03:20 +0000
Received: by outflank-mailman (input) for mailman id 1318263;
 Sun, 24 May 2026 00:03:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJK-0000sz-Oa
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJK-005yId-4f
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12403e-2eae-0a2a0a5409dd-0a2a450bb766-6
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:18 +0200
Received: from [40.107.74.85]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124043-212f-0a2a450b0019-286b4a55a710-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:17 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sun, 24 May
 2026 00:03:14 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTkHL1d+Pj+ghszLL6gLtY0iub/5MEqb2C65nUTMwyVjOkqLfgJFxJux2dOx55NuwDkKEHL9Q3duqaZt5j/zy9dxoPYBtB+LUeo8seDP0W2/QVngECQLpWuZlrK9YwaI6P/Y+ZKPa+cGWQuT5WDBEwQ6uovIRJ9cQ7SnqJEWP58l5sWQmHBXWq8yGIKvo2CqwfsFC0K/DvHuNMOjUKNNbcHjtsLM28nZcIlllAncHsevGNXVmWMowCgWaiW/umKWL/n0pryrB1EoCZbmTaeSsEH5cQQHKCY8I7WETeSPi1POLXAi5cql/1Ajc8pqL29G2rVDJeWLM87wWqnq8qsBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFbPS7jmT/c7ZeciURJLZIzacMWDfDdD4RLX/C8sWd0=;
 b=KEMqLlnv5geHRjamJxFZtRE2hnkLyHSvTyUhsU8bVa/xGzce5QuuNP5E8CXNlwDME6HJfH3QA0x250VOa2WnAwUjlYKkdx5MxTHu+Axq2fjhQbwjiVN4NygojI+lkm7gZohbNSv1BZBtx1wAjVj1l1LTajjrzgbGqF6iKEGKHY/AIEWykxEdRPdTeCIt5L3KQGV+E8wSHRV5Kb1cAryRi/SLI+gr9vgQF3uomDE1Z13zOyDnqFJgQ27kX/3IpONeOQ9CKrTF2qXaTNopRqLAL76g52EJlBDnyltDquRzmnCSB5kZw1Cw6HyoRqCzZcAax7IokBDtPXFD2vNG2O0edQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFbPS7jmT/c7ZeciURJLZIzacMWDfDdD4RLX/C8sWd0=;
 b=Ej2bAuqKg6eM1SOwWyXtfY1NUQ0/D3CA+eHfXonTukKQpsau9PBa8xJl4HWu3jJn/zYEm7pNs/G8gBfpa0P5CWuMTDnjBcwTF3Tn1GJiZ8IMBux89eDAlcHiMdAtVtwMlSS5qJ+ocJfNpXh8TfIAJKd4n9rLhKfb4kqyqYhlg1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 21/21] xen/arm: Support numa and numa_nodes boot options
Date: Sun, 24 May 2026 09:02:09 +0900
Message-ID: <20260524000209.292370-22-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 35831113-4086-4f6e-f4a2-08deb927da0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sVs47iqhlz4Auo7jLEFr/UcSe1q2oyUaR4WdsAqFWilvKUuiLuYuOlkNIxKtpEey2u4mysIrSvKA8KB6p4t9d4v2/GG+n5B4op1UNLALMEXY8C3EwByH4f0v3oe/lC1zHIK0ErBjuMMkHeMvbVcjquLLnG9vgeyljK75BxaArzb8RQI6Unc7i1cfnQZXbZhm+SG9yMCMiJckZ4MqXGRN3KiGVSAwlpWjDqtbOB/iTeC0PJFtfdQ9fsK9EqibNLzIr6uLDtte0ao9UBcr/LCLfYq5TL/aWr+4Tcuv8x7abaeEmuMe1TVFKx3Z0OlDVT5ANCplylXwmG1cSaOEBQHXr1b9Rr3qBGHfnC/tJOAEiDXfEh1FfNGGpcZYUwPSKJGy9YFl+ZIKawv9jI3RHcw6v9WRLfLsKk1q3kVIrQamJo3uVnq9sHC58QRIlD7x0R1pFVcLjGQs4hPTWMFs/DXuoSb6rlDMUkxwBFcWH3m8Se4WpCKz4aS/3TXymTDOcH10QW6OWF+K/dotPBdrA3e3Bm/jxfIUckliYEVjZ3vNtsgxo7m8PFrqDJzYIrxFOeFd/DR+pZrR0ftt4n++MOZ3Wyxs5JUe8iDy7CXyyUFnvxvYTJGDn3Mg1esxbcVl0PFdx7MpJYDR1LNdF72jENCUEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2PnHRslBYoboaKXpvAAqzmiGy9yMl2sAZLnU6IuKWpJ9alvpOtAxlfC06N7G?=
 =?us-ascii?Q?RockIEIxN5jC2HCClpMN3klBt3gk0WXvIiIsMigvcn5vn++/D0qEH5lUWVQR?=
 =?us-ascii?Q?xjwmSCyb9eMZN3hMr+Z/T82PbrZutj4Tmicx4IwyS9WJ8MruYXTv5drqXRJ8?=
 =?us-ascii?Q?4yvR2Ni+zkfJx0pE9Gp40D0DhJKUPEOIdKk1DBjPiPi5R8vDztdcDuuZOVWA?=
 =?us-ascii?Q?sqrCOF9O0o62qPRb915UxQWZDtqZXy3bGYF5k1sNxCMWSyl2TXlOSeIWqToM?=
 =?us-ascii?Q?4HZ8awYWewzBOA4GDcxqkVizO/3H12qTCr6oSUzKjsFtGeQKYlWUch9Tw7fD?=
 =?us-ascii?Q?729sHmv6rglQ2pEEGI431v6RCqrDu04h3lmRJX3p91HYWSvbJkg6KUX/Ufqs?=
 =?us-ascii?Q?Z2KQG+kXBDswJQrNajsVsWpeL3Y1V11K0xJ0I4ghuUcHAoVF4Tk3q+JuYRrs?=
 =?us-ascii?Q?9yaWQEsuEDH+iaYCaavDwXhI5uiF4rd9JTwFaHP+DuqjvmcEfPOTiOzPDQDL?=
 =?us-ascii?Q?krshy8GQ0myaEWCB4qq6SBRDaUjcX+Mij0JD295GIBzHgXn/yHh42HdEslZC?=
 =?us-ascii?Q?iwHyTWFZKfmYfKRGaBRMIcvbFq5AbOOlJ9Nw/g3RQyAgex4cNPV6qr+7jH0u?=
 =?us-ascii?Q?6u27f7zNadiRd49NRQeoA4QRq1SWIjvBnBaikfDmYlqRAoPGE5QvBy4jiYy/?=
 =?us-ascii?Q?ifkk+3C4SX64oTPXsbqRy7mVdtEhiMVPcVlSdXujWglKt7DvPd8zS3FBUv/H?=
 =?us-ascii?Q?LBCTqw2TiHrnnJ+CPFaEbpSIPOJhLJdIPVoT5wAlFhKqrjoN91EYqjCIkoma?=
 =?us-ascii?Q?kUhCOQoViJqSJn1Y/Ax5pneujP00SaZay7j1etwda126bnJrvjfCjBR0zPMZ?=
 =?us-ascii?Q?Erc1U49a8YaBmxvwzR17G9fV5KA81UeUUHB0laoxtXyk+WV7VmjcklB6CaBf?=
 =?us-ascii?Q?Gi+/EBjsf+vJBYmkobnwVsqY4BjhPQv/s2i7ABv06/dvOQJ/0PyNtCUFOaKA?=
 =?us-ascii?Q?dXVSbKd0xWg9J7XlVFwKPkf1i7pzvrJuAnAPKb9LkNzgW7XpVqLXl4HBIdEU?=
 =?us-ascii?Q?+VAQAkbLM0FUMrEozvE/8aTGqXeKitiKIq8S0rqEvY2uOInAw041AuIq7oEW?=
 =?us-ascii?Q?MpDzz3pZ9F7XiA1h0iwHuXaBU9Q7orBS3FlGqfaLxiUBBSoDMvmsS3fX1O4y?=
 =?us-ascii?Q?nM2kOxxWUj7LHypDPIFuXRvWRbg6Poj23l4Vy15tVw33AVmTma/UeGWXsO89?=
 =?us-ascii?Q?FmKDXL+uYE9uUHZtPsfLVozBWQHfnKgmDoTnObBgxuaF7Am+SNivOiw7jJUC?=
 =?us-ascii?Q?HqXL/OgKm+BQlDHjE3jBIF9uWYrv6ivafSgFHluryEfUXjIJ5/EZAzuK0gWJ?=
 =?us-ascii?Q?JthoM0ZTfAMBi0pvU4Zhy/ybEKf9qqJP4aoZAx0qYHiN0yRJ+l+Eyh5kWVlV?=
 =?us-ascii?Q?+tJjaMF5oqLIRXwqWComwCrOaAh1L3Rb6iWhuIHMhQTGiQVOglDjwpqIIyjd?=
 =?us-ascii?Q?YlkDtHIxOfGc0tyK5pPBzPWAhktzQvm6tPcPgrObSsviPnsa96fpIbNiiBju?=
 =?us-ascii?Q?8ZnuKNdX6g5bYiDvN+77gCFBQVyiSskhNdHK7pPmvTwOW3/NHQK2MGSpieCA?=
 =?us-ascii?Q?UlgIycSOSQ9e77QB6F12YHtj4gbvdevRoZcfnrJUphW6U5XySPRx6G0KBfcc?=
 =?us-ascii?Q?h+jijyUEw0plEYDaHU6lxloaw9TJ9Mhx/OaRLaVEeu6uNGm+MWJ/FTsy57++?=
 =?us-ascii?Q?myzVzrA1B5pMspMHZBtmtu2XEXytLT2V8mlWvlPajws0fVgdVy99jQ35An3F?=
X-MS-Exchange-AntiSpam-MessageData-1: T4gAhz11bXMQ8g==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 35831113-4086-4f6e-f4a2-08deb927da0b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:14.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4uWqq3II6P9vE/8RpVYhzn+K1yeq7vqZVF6VGQ94v2KIGZBam/V2GPjG54BXZ4HegGjKnkWjUYlPfD9nzYJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-42698a/1779580998-23374F3B-6E768BA4/0/0
X-purgate-type: clean
X-purgate-size: 1710
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 26C435C0EFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The numa_nodes command line option is now supported on ARM Xen.
Its usage is almost identical to x86 Xen. The key difference is that
while x86 uses ACPI PXM values to specify nodes, ARM uses the
values defined in the device tree (numa-node-id).
---
 docs/misc/xen-command-line.pandoc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 2da90548d8..0f1c0467f1 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1046,7 +1046,7 @@ Practices](https://wiki.xen.org/wiki/Xen_Best_Practices#Xen_dom0_dedicated_memor
 
 This option doesn't have effect if pv-shim mode is enabled.
 
-### dom0_nodes (x86)
+### dom0_nodes (x86, arm)
 
 > `= List of [ <integer> | relaxed | strict ]`
 
@@ -1055,8 +1055,9 @@ This option doesn't have effect if pv-shim mode is enabled.
 Specify the NUMA nodes to place Dom0 on. Defaults for vCPU-s created
 and memory assigned to Dom0 will be adjusted to match the node
 restrictions set up here. Note that the values to be specified here are
-ACPI PXM ones, not Xen internal node numbers. `relaxed` sets up vCPU
-affinities to prefer but be not limited to the specified node(s).
+ACPI PXM ones, not Xen internal node numbers, or node IDs in the device
+tree. `relaxed` sets up vCPU affinities to prefer but be not limited to
+the specified node(s).
 
 ### dom0_vcpus_pin
 > `= <boolean>`
@@ -1996,7 +1997,7 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
-### numa (x86)
+### numa (x86, arm)
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.43.0


