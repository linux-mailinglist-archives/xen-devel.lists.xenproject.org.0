Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJOZHdm6HGqRRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE66182C8
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323461.1589218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxF-0006MP-VS; Sun, 31 May 2026 22:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323461.1589218; Sun, 31 May 2026 22:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxF-0006LK-Lp; Sun, 31 May 2026 22:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1323461;
 Sun, 31 May 2026 22:48:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxD-0005nO-AF
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxC-00261G-N4
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-40
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:22 +0200
Received: from [52.101.229.101]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbab2-2497-0a2a45090019-3465e565b3a6-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:22 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:20 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:20 +0000
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
 b=gW+CU3kSAev9Ela4g0kgVb3ptm9d98zD9IOSYIsltsCzYUse9/xFbMyQaqjzQQu0M3iqDr/4k24kU+myrXvcznPq44JVkVJpxXQEX+/nUWzWs7DfWzvqF71NfZI6zFK+2CVdh01Z3hLoL2csjMJG5ihBeLeWC6M2hFQS3JfOfjtylM3NHaAYR9ekhiwagbqZmO/xUsfLgECBrwvpGrA0/j/syslmRl0p3RXRgCuyjt2bfapUKEa3EuOc6Irjp9i/xV1gNrMkfmDvu3PlM5tPp1S2fuEGwG/BDiUVtsLNYRppwcN/NSwjc6m5/Rri/7LLmE7K9O9JNbNoozqQRsf91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lteRRVaFbxsp6aSXOgwn6Y3jyynAQKzJoiRSSUgWbfU=;
 b=wEAQgGzmIpdSXvF9uKWdI7u5XAJaOnpDTmYw+G4kJFZdSONg/+m2QcCrszpDRc8jDfTSxXpNBCoPPKEnsBY/nYyRDvDneGMEOZawKrPhsd0rZXWcAve0oULJ1CnYmShUe+xjN96KVddUoT9yV1JzsitF0ofYvkIcARRJ/jiE4RUFLqZoxCSQt98zZXrXhpCbVKActHRFAXXZn7KEs4a7dX6+d2Kqg96OfbBf50Pgy9qnzA+yd2l1BPpJgbrYVzIWUuCcoyBW9ccgMv3MVSdafK+7DGozy5Tw9C57iLl2BvGEEk3YhDB5MB7IXWJjUsbimCLg533QtTbeDDfcpjvafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lteRRVaFbxsp6aSXOgwn6Y3jyynAQKzJoiRSSUgWbfU=;
 b=OddtpVDGGgQbfqsqlghBniDhyVDgtWjgMmPwwylDTCHgZtSyKWStvbfNzqL8npZVRIB/QI5tPe2i3VJE1S6KiOkXQsmq/9sXgOPpkLrJr8cMFZNrTialoYN2HsXELgWmP0zkbJLugjBOnhG42mf6ogAch/hYZfA9bPkVxk+yi8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 10/24] xen/common: Allow building ARM32 Xen with CONFIG_NUMA
Date: Mon,  1 Jun 2026 07:47:40 +0900
Message-ID: <20260531224755.9481-11-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcebcaf-2693-47bb-5f41-08debf66b661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	U3/PkD8s02vQPQn8tWZBFJWgRGSFeS1l8gn9USZlL6RaIJ/xjbXFGxKFfvxaQKU2yixKz0f1i4pSq/4zu2DeWAD/juGhd4BXD0TYQVN5TNqXFdevrgfpmDSEaAOS+UaMm+uIIuZvBuZZDYSSg6gkZaiBcyB4PGir9Cpb7mxP3LrXE1Z2qnfHgEQUf/suhGmbCpXO7EObC/bbUAY6Q5jbO+5LeiZ73XTnP8XpaPh8JCi/2RsTUt5Vz4/ehvbrL6Gw2U40RnRDFm367jSnRFXlAbsAmR5XB142qqXmJ65uCTD73wLZsszOVriufndg9KDYM0Hj7BfvNz9ZISypCjLAdqAZhKG7TzZ+Vh4tGmfMtpPgbzVOlGDpaaefMo+XQhI+XJojn9bK60Nb/JhEX5ibyMOi4Fm6aSqEGqYvG4HWnKOCp+6ntXaRZiFJjIdzvtQTgCcLmgHo9i/FvOxZ6SUHqBP9VQ74E4egn7QT3qVGSLpLVz7bDsl/rLfISFWvpPRJctCyMKj+Lk+4+FL18Mcso8OCyqv0h47KYt6CpqS9TPeAdUvLrSfm9mraRwirs+JiPkF3DASSwbwwQlFUKZISRjK7kww3fP8rX17rT4hQHxx+V+uxUwPJP5asR2t/ZCGD2vTqfpf2cG8ay2RRIgNZP4cgwKDDXHzT09YIx9ZVupEim/G3iXp+rYyaNIVLjOOO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O8UmhziLjNSy9T3fpzrXj76g6cc5xV7Y9jrmPVd82BgLbZ9dWbb9zO7375eQ?=
 =?us-ascii?Q?AP4j6s+mq+1U7Cz+VWUxT9Jl3LlCPY2cbTHIKljwymugTvvjZs3vHaizNtED?=
 =?us-ascii?Q?akghbeL3mV+JfY9RWW38781QoosA46+lJTBFHZ00RO+2pP0VSooXjR0RYGHR?=
 =?us-ascii?Q?8UUXwztbzDOOKm9j5Kt3q5iYEaLpwsMYGrAhodj3pjRvXNFfa1uq/eCvkDN4?=
 =?us-ascii?Q?jM5zKiKJs1+OBm7fWuz7G6hbHJoNEgeRa4EqqPu0U07eU80Cz0LrHMBLFOUd?=
 =?us-ascii?Q?700fIaZuqDwtyLbmmbd3dg2N5YobSNzLbkZ+zLt6CaER5RbuP8R/K7k7K7FI?=
 =?us-ascii?Q?TGjojqbhHj8wPSWYIFWuE4gOibxmeBY8VPO2qK2TXHvIarz7C9cn5iry9/Lg?=
 =?us-ascii?Q?cE3iSXoeYqHD11twzy00akOQuOx/ELB9wZ+aSPUbSVFjQqmADB9sipgZ24ix?=
 =?us-ascii?Q?hOruxKZT/9amGVO/x4o5eMEy105Qkfm8MxTt4YVuKpE0Umgr1YXbKEy7hEN5?=
 =?us-ascii?Q?+wASTnsAdH42Idpe1mU98tX2dXPzELs55fO+JE+b51Znlx6bIoFL0fE6lIgB?=
 =?us-ascii?Q?6ndGdzBIBBZb58nD0oEe3NQfmEzU1TI5e2RbGhiPqpQxtAXrCoqpBWeBjKTU?=
 =?us-ascii?Q?qdmf62lhP+YXbnQX6FqiPzAjEXei+OMgYBMSlHO03ThVX/bhJl291fPjECWs?=
 =?us-ascii?Q?RK4OnoilDNd7di4IiJiAD/v0ixvCnZViPi9gqulg9CZ/Wldd/qjhtgE4qnqM?=
 =?us-ascii?Q?D3Uytkmn7zeNB2n7mditfcfbtEHH+0M48358lguK1/5cAGzhAlG6i95F9w8T?=
 =?us-ascii?Q?IEEh2qJI+U8OmJNsQqW9N0kzqGSY9PetP64PeozX00Kyg0RRLbKFlG4Tq6Ss?=
 =?us-ascii?Q?8GGtEDsQaxvdzTINxj15hCwkGJTMvgeq7Fns61eR1zeoOHSxUlqGU0Lqm3VJ?=
 =?us-ascii?Q?ecNTH9u1t6j3YfuGmFhakpOYjKGkjjRf4tcqCsz2vcLkFQl3iDZCN2tSKL8H?=
 =?us-ascii?Q?4i8rMOZpSNZwgYwH9Mr5+USs/fkyyDWj0bRdAP//A9oCqMV/mYi7bfbDYph3?=
 =?us-ascii?Q?MCezBf/lqf97mGlX1NZ3hWx+30VsPuxOOasQ/WQBVBvbGeGK0D46jvrTDbUp?=
 =?us-ascii?Q?u1RNlwO+CSEOcZ3pCy7q5jFMc98/+CPvi4eK5ldilJd4VuMmlTnqdl4vkesM?=
 =?us-ascii?Q?TI5V+YBNVUv4+unkyz/NwW44HoPc3+hL9CiCVp1ON6bA0aoEUHmHE46BWcwu?=
 =?us-ascii?Q?F+faOhi6tOSyjgTXIkyF3WWRp6mcIiNxFdaB5hnVA0AJHCAg3/F0v6b8PCYW?=
 =?us-ascii?Q?sWKKtkkQJKrDN5xoM75C6TCXLYft4C1EPz3XAwSCTGH8FuuQk99puTcjcnZn?=
 =?us-ascii?Q?RdOlfxHqduuw5XAGY7sWSVDZbVnYPQzbjUIcebEQXs0sbtrUCdzqyTfcaWMa?=
 =?us-ascii?Q?h1jlmtJkpSb3t+5rwhGFuLetTU+r1uIZZu7c/PzXch15AKtVzXG8WICC0Wii?=
 =?us-ascii?Q?xkrCmgIFLubwuELXgR/9p5fWmId4PriDVj+QurqVvNWzw5r/gkVMzWxl8XQA?=
 =?us-ascii?Q?ziS9X8uoyJWgAgxTDdcA1yJxQN7eIclrg0I7IFWWMIRAq0F88Arja+JmRXIJ?=
 =?us-ascii?Q?qgmTC8IR3ZAtaUJHj2hjFF/dRcVgO5B0ISuYMc0RFxRC/yF2WRBrpP5nvFEO?=
 =?us-ascii?Q?6OmjM2aclsogiScG0OvsYTGlKqNm5wPKaqhcxdCWSIyPYTlVCLiXFV1viiPI?=
 =?us-ascii?Q?JMB5J10PCnvVd59Hy08t4/iJrJTDa+44on9lIIKctknmrfgm8JnaNKr81j29?=
X-MS-Exchange-AntiSpam-MessageData-1: vqHlevb7/hekMA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcebcaf-2693-47bb-5f41-08debf66b661
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:20.1213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL7KDvdTLvhhojZK9zVwxPHW9HMVORT5oHtn0UcFJNFFsX9ApUHgzXNXPNcbG0DHIHjWS//z7YvrUYvPaUuo0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267702-43D7FA53-E8AA1C4A/0/0
X-purgate-type: clean
X-purgate-size: 765
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2BEE66182C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow ARM32 Xen to be built with NUMA configurations.
---
 xen/common/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a16..81121e571e 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -431,7 +431,7 @@ static int __init allocate_cachealigned_memnodemap(void)
     if ( !memnodemap )
         panic("Unable to map the NUMA node map. Retry with numa=off");
     size <<= PAGE_SHIFT;
-    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
+    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %"PRIpaddr" - %"PRIpaddr"\n",
            mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
     memnodemapsize = size / sizeof(*memnodemap);
 
-- 
2.43.0


