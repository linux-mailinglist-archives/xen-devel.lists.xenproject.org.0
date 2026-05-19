Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL2nHJOtC2omLAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 02:23:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE446575840
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 02:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312330.1582465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP8Em-00041Q-U0; Tue, 19 May 2026 00:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312330.1582465; Tue, 19 May 2026 00:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP8Em-0003zk-QA; Tue, 19 May 2026 00:23:08 +0000
Received: by outflank-mailman (input) for mailman id 1312330;
 Tue, 19 May 2026 00:23:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wP8Ek-0003ze-UP
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 00:23:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP8Ek-00BNkp-6s
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 02:23:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a0bad30-2eae-0a2a0a5409dd-0a2a450ad01a-12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:23:05 +0200
Received: from [52.101.48.66]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a0bad67-56b3-0a2a450a0019-34653042ca89-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:23:05 +0200
Received: from SJ0PR13CA0116.namprd13.prod.outlook.com (2603:10b6:a03:2c5::31)
 by DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 00:22:59 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::96) by SJ0PR13CA0116.outlook.office365.com
 (2603:10b6:a03:2c5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 00:22:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 00:22:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 18 May
 2026 19:22:58 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 19:22:58 -0500
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
 b=eGNNR0WyilJn5pE3+Y35AOEej7vHgO5cRia9Mb9y35uyEPpw6OgFEIN96vAYZzUU3AMfgwBHIr0JRjUL42/OYJQQut81/I6uGF0oeHClTZip3eOCUfHKvOre155otNSTT+M+HbqxTz2yj2e43r1wZ9inzqf2oedTgcEvM7GGIAI24JpkXn1w+M8gfpAQeOMPxw0js7YAEed9JMCOqeno30i2QAqhzTZ/0nugkQXRxHmtLsMRY09CBLk8WhF02AGAS6bxAG2Bp/dtDh/q9UChEo0dmUxBQhoUwPZ2+b7mD6Xa1zmwXtiSXOnXLBD83kuifyxzWCUSw0E0bWRqvf5iMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIziPShW5JvZAXG/Lgmsjf5KGUiDMQxRult1tOt+ci8=;
 b=Nnw1tD+fY4ONHV61OwzoCO+qJSQy8h+jSCgUkJCP0laMcxheJjaTOzhKdEMp782GT2aFxhVn/UqpClazl1EYXMwHuIkhtUeimF3Y0ummIAVhUo5JrHwpKSgwk1BFiF3hi/iqeJatXyXWPLi8G4fV7lE+L4C3FyW3oU9mo1fs7zTSd/szsF+2Sul6Wiqq0oPvr4Iv0tDdiGwilWgKaAjQHzaVrYTvy6qTGTLf3RsSZ42Mom4Z5AfulfNWIgRHRwZIgIzE9xq+m9mNzkJZAqI98lp9HDDMvoa3mBmqgN1eATgBsIxmNmjIVWgOzWA5ID3pZdRLBw3iL93NdhRP2EpzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIziPShW5JvZAXG/Lgmsjf5KGUiDMQxRult1tOt+ci8=;
 b=nr+WSZfi05wCN7vlYDCZh0xOWUwxYApZ23wPkeiXU4Igo9gHF9EBE/3fM0OSIF7jooa2TaF4oZUTIbhppsOMmTIZjEI6yAaYTxBegcSBRj9o1TnDDQqJF0P/zAu0tVODvwJOEczFJ3dIO5lpAM4YUVFoqYR3joFg7y50jaycHX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86/irq: Return -EEXIST from map_domain_pirq()
Date: Mon, 18 May 2026 20:15:59 -0400
Message-ID: <20260519001559.28129-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ca9e19-53ba-46f9-8785-08deb53cc81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|11063799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hQW8wzDyLnsXIsE2+Q3H6kC/wMp+4BvRzXYzpqTHr1R5Z9EDgw8MRPF1uBmECxAvhaydBpxzvACFVle8Qq8Beu1lJCXtH8BLMHcqqhFzi3Yxszes4fVp/JoFJVP7S26yW2pfger5hI6TTNBEREe8nkvxTHjbaKDSh64dShmenMLO22LvpGB5CUSueshD4oqo/NAStf/3eXfYbCh8HLYzoYy8lZdMHrKijfMYu1+of5c8a9Pxey5v6TnB9r4GD0vmNpjqH2wXNgKoPxxWWYLyBfhlEkgvIOXVUzjiRmzxPpQ4brV4i0ubactK3tpPyI8Aa0wKwTrf5OeSiRf/H4KkqmLOPD5QzJUnLi8/t9seLZlk5U/sQI3N096np8eamCn1S6IpTMsSoq8m+/EAhtuBqtLzEAvKYlScVy0WZA+5DBY/03RX4E8UEQSTZjdPRwGWGMMNdNBPdH4X6exnpjh20dmOSuSvOP4TkMCnwsE635gatdu5RXtA8Fnl3lYJFA3LaNZO1Q06rXKD8oMQOrG9j8n80Hlf0DAOxiowM4COJs8Z+cjSaK3UX/m9utbAaQWbaT7a1LYsDhmxC4nL1J4gu6pNaUtCIlFD9J8V4gS8ehjGSlq0tmo9vAXEPSehp5FqNkMXIopQR0TGkJIVD0Raf1dpNGfbAnODbbjRKmc+7aRr43sr9PFxp7YSxXq3IwmVFDY/2CmWOSi1CUAQkI5szsKK+pRtlXUqOqK/qFruAEM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(11063799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BnonSPGH5efWJWj0U/LsDp8cAkQ7J+DDzz0XAAgpB6BzW3UqmNjJnrw3hJnOC3N9Em36nbc79HvG/NeEnU+wk8u5p/EU77r390O0w7rob+zkFMjkA8MmcI+Cn03uHJSvecyfhSDcuVEUBw4DP6jV08yj4Cv0dv7LIqKFGDW4b5OgDITGI+/O/mTUlY5u6tYTe1uHV4XYGK5bA7GwoVzpts9xFfCREWfNzYKg14Mt2g9wGdVNKtgxyy/9CWdBWFhFLY5strbMRrcINzP0stC0ukW/GD2bVq72LHbvgJ33dlNAahSyav9dhGLZyciJnWjjyJA/+B2V7ZyD79rriefaLWdZCv6AN8+bYqECCFRS+7oIMjBeDfknivs9d7YBYW0T3JGIENbO20xNEZ+YxKMK37vEo5jGIEhAQ8Rl9pHxdwQV5Fq7aFqzoKoZWbnTp6lz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 00:22:59.2194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ca9e19-53ba-46f9-8785-08deb53cc81e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
X-purgate-ID: tlsNG-4011c0/1779150185-709668B7-F7AC5490/0/0
X-purgate-type: clean
X-purgate-size: 2041
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: CE446575840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

commit bfc341a65cfb ("x86: Make the hypercall PHYSDEVOP_alloc_irq_vector
hypercall dummy.") modified map_domain_pirq() to return 0 when an irq or
pirq is already mapped, when it previously returned -EINVAL.  This
occured when moving map_domain_pirq()'s call from
PHYSDEVOP_alloc_irq_vector into PHYSDEVOP_apic_write.

However, this means other callers cannot detect when a pirq or irq is
already mapped.  Since success is returned but the pirq is not
connected, it will never fire.

Modify map_domain_pirq() to return -EEXIST.  -EINVAL is already returned
elsewhere in map_domain_pirq(), so -EEXIST allows identifying this case.
With that, squash -EEXIST in ioapic_guest_write() so the behavior does not
change.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I'm not sure whether or not this warrants a Fixes.  Nothing in tree
today is broken, so I did not add one.

 xen/arch/x86/io_apic.c | 2 ++
 xen/arch/x86/irq.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 46c2a43dac..2b928fc236 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2315,6 +2315,8 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
         ret = map_domain_pirq(hardware_domain, pirq, irq,
                               MAP_PIRQ_TYPE_GSI, NULL);
         write_unlock(&hardware_domain->event_lock);
+        if ( ret == -EEXIST )
+            ret = 0;
         if ( ret < 0 )
             return ret;
     }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 739fc04bd1..938cca6203 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2210,7 +2210,7 @@ int map_domain_pirq(
         dprintk(XENLOG_G_WARNING,
                 "dom%d: pirq %d or irq %d already mapped (%d,%d)\n",
                 d->domain_id, pirq, irq, old_pirq, old_irq);
-        return 0;
+        return -EEXIST;
     }
 
     ret = xsm_map_domain_irq(XSM_HOOK, d, irq, data);
-- 
2.54.0


