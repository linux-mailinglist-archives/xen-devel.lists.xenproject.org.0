Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP2vItNIoWkirwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 08:33:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E931B3F27
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 08:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242483.1542931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvsLd-0003rw-TA; Fri, 27 Feb 2026 07:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242483.1542931; Fri, 27 Feb 2026 07:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvsLd-0003po-QA; Fri, 27 Feb 2026 07:33:17 +0000
Received: by outflank-mailman (input) for mailman id 1242483;
 Fri, 27 Feb 2026 07:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vvsLc-0003P8-8i
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 07:33:16 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 939da2a3-13ae-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 08:33:14 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5703.namprd03.prod.outlook.com (2603:10b6:510:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 07:33:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:33:13 +0000
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
X-Inumbo-ID: 939da2a3-13ae-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJtoW1Cz720HUTRBe4380NcJfkeNk7MLnBfapSa6fb00CieE+F5jS2m/Ik0842Y8JlKQJutJz1ComPTXzRY9/KzEEHPC8v4NDKgi8UD808yYtK9sssC3qQqO7oQyLFUBclqob01sWnvk7FBdzPb2cqZOXP3GMkSd9aM/+fhTcovKeXMTxAkYmDnL98fJO+D0EyFgiOSCdUWOeHPZal7lqI3YdfjT0DGqjLoU9sbm80HVdk6JEjYRoDQ73L+dKhfLSAv/vwp9enzXGzy6smjF3CPvNMpF8fhRqxea1E9HQvINShSe1HGVvih0+g32sg6xiovZWA8od37CrLGnMA2zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Urh8wr5J46bIDyHt/VSWqgUO0+Dn2AXVKCUHBxW0PlI=;
 b=N/3gGoM22qw4iRM+01htD4ZWlfXSqflL+6M2cLi8XZouushhXf0A22CvbN13gXy8Ah28qS2CHRpXUyW82kWlX1iNU51JuRfnHN3wZS0ynUyFLxBaMBEd0OVRVLRDGo2voPACdAj3X1LVUTMC905SifKwCKGvZBRGInH4BFvbWkYHi+2M/jxugQysrx+ba0cN3lyxhCAz6cgq7amB0+0msrBu9h/I8lG1g7ummpNhJdUtx/qc10ZBCIJS/WwFkcJ6y0c/lXVaDbFe7TDPEBTvZFF/WeMPX8+u2QifULPdk1GKKhQT9nbdnoOLKKIGawbrS8yWYbmPyFyQqIeALVr0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Urh8wr5J46bIDyHt/VSWqgUO0+Dn2AXVKCUHBxW0PlI=;
 b=Y/HKGGPAzPpcataWaR20u7oEBgEuAbqTj4Ecqwbdm0OLGwPqigUkGm4L3nIjRw3TVGDmILW0URXh+Awjl5mV6+aRBIgyQ7FPDJcu42/SQl0QmdbRRe0yUkXaTlqFpQVHA0jZW6HirprzE9Yqm48nN2JknHF+gx09f6dkTt7ufSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/2] xen/cpufreq: fix usages of align_timer() in the on-demand governor
Date: Fri, 27 Feb 2026 08:32:59 +0100
Message-ID: <20260227073259.1200-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227073259.1200-1-roger.pau@citrix.com>
References: <20260227073259.1200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe9cd97-6320-4dac-ef6f-08de75d276bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	/gK9hHoonsgV4cbJtvfgqTm8vci9w6XYjlXb5bGtBMUKh1StLxm5DZe3uwZTLtiY5Wwfh4noHQmpE7mowoSNOtJ5d0KdjCJa5JzVCX9+YhQUNDifDZ1Cjm8mVM5wqXX3cx0MiUu9JYt7Y30NIaAfo5xxfrYATN68kd6BKWnDj6kuEQZIyLLER9sL/WCEbKI2YhE8Xpzc9VEeYrwDClsrbLn+z9FJZnh2ITViQmgW3XQbwOPVe3OOkCe7fZkMSHnmQRtsyKzLZasRR8dhJYMJIVI6bu4teSTSqSgdZdu9pSHc9jtuGcTbcLCqo4jphDmQqrUyLtKZAhPNNabsZRr+KT0+zaQuCbjrGXlgVkrfVTtJEkJ3AHDjJ6TPohObOfsHTmzvuohIWZUcG45yBgBbZ8TwtzfvpZbcPLlOmMdcpZpR74wV1rjpKkYKVFv1CkJADu6yKaTUdFwv+j3cPxNk0f6AveoZWo1+mPqB+RdZKdUdtnXnOtVqsJE6+uSvXb/XCPQW4h366wuKHSwq4gmBGuXq24Mb8FcQ53gpNkG287JFYk9xC9jdm7P+mZou4wr1tDbARKvG0FFjsHorMx1Jk8TT710g1BJw98VNeOGDlIXzMsom+8yI5kECAgJQpXjwtvRkvYPu3QMQAp755VKR7YCbg/AL7m5F5b+M7r/SAq7FeiJEG5TJW1Q8iug8ypNl5oavLg65M+OTvxKL3tr2olqzE0tGGSYcOQf4UMy/Q3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enFoWkhjam5rMEtIWDhuempNZW5EdTRnWWVwa045YmpxcjJZcTlwQmJzcTlZ?=
 =?utf-8?B?MVJYd3RnSVhlWlFoekRIMmx3SWZMVHcwTnNkRVA3bDNEMXRiQlVBazhnQlJY?=
 =?utf-8?B?N1ZQa2M2TWpqQlFaTWw1OWQzSU1FREJWNE4yckNESDBhL0RCY1JtWFlBR0E5?=
 =?utf-8?B?dkp2ODJOd2JycWN0ZDZkQ3ZzVFVZUU40Um1rQWFqNUVON1lKMUJlcnlUc01K?=
 =?utf-8?B?MDQxa3lNMGI0dnExL0l0YjAvSkhORFFLY1I2THhtQlJTSUprSXNGY05EZ0Nw?=
 =?utf-8?B?Y3phckNnMU9aLzdnMmdZcERQRXN6RXdHNXVUKzVrYi9MUTNlWkdWdFByd2Jj?=
 =?utf-8?B?Tm9PZDlMbUxOY1hrT3pBNUErVVJ0czZyZEVWM3gvNkdSNGIwT0lKSGhUeXQz?=
 =?utf-8?B?aUswdVhBNE5LcUo3K3A0WTlYa00vRlVUaHF4SnU2SEJoOXdGRC9Ha1l5MGdW?=
 =?utf-8?B?UVNhbXlUNUgxUTRYR2NMeXZzTVI2YXdEcGt5Wm9xVjBGWnloR3NwcE01WFd0?=
 =?utf-8?B?djNZdlJxSUM5cEhtVGpBT2NDRHVYTnFBaUNkSnI5Zmd0WXNHT2VHRkdXelVq?=
 =?utf-8?B?M2ExRkwrblJnc1lpektXL2FTaElwV21yOWR0b1BwZkQvTEV3aWFqN3lJRUYr?=
 =?utf-8?B?cm5HanFkMkNxS3Q0bkVnazN4TTMxcXAvQWlvU1hZdUFMRXVrNWlBR2dGbVNk?=
 =?utf-8?B?TG9qUUFlS1YrYVkydUdEMG51cDBFTTI4Um1SMER5S0NHRldyVVZNNzBVNUYy?=
 =?utf-8?B?QTg1TGlMTlN0YytwMm1iOTk3eDJRSDIyb2tWcGIrb0lJU0F5aDJQUU9DbW1x?=
 =?utf-8?B?dEtXczVSVHJLMy9QMW5MT0puRG96aGNOcUloK01ucnQ2TCtRN2ZpWkJkTHJo?=
 =?utf-8?B?enc5NS9GNUlDZVdkVVdhd1VqbFZwQkRKdWMra0d5QnJlbG02VStBUy9iR3BZ?=
 =?utf-8?B?bG9ndjlmVHFDVVlsLzdkOU0reEZEOUtMWFhsSkpWZndyWUNoS1ZFWUZJcmxR?=
 =?utf-8?B?Zk4vb3lrc3d2eVdxNldEa2hTdWsyQUJpUmdwUlFYeUF3ZGZkeXFCQnZEaHBj?=
 =?utf-8?B?b0VPUGZhR0gxZ0VkS0lHV1orNHA3REp5OHF1TC93czBXN3dnd255MXZQZnpy?=
 =?utf-8?B?bTcxWUFPQytYMFk2L2VBTVdjcEZKSGQvR0VOSGM3VUZPZzRZRE1taktCZys1?=
 =?utf-8?B?aWUzK1JnY081UE82TTV3L1BRMFdWcmNpVWs1cCtHMjFrWVhVVXBDV1c0QTR3?=
 =?utf-8?B?L203aVRlUStYSkoyNFFtNkYrazA1R3prY3JRSmxrSjl0RGxWcTBrVklLbUlT?=
 =?utf-8?B?YjUySzdMdnh5TVVYakVHRExpczJzWXh2UXZtb3h1T0R3Sis5R1ZyNmRjRTVM?=
 =?utf-8?B?UmphaE5PNndMdjBPUmRwU0ZFZXpzbjhCT3V0bDNGMCszNjNIY3ZLYjhCNUd6?=
 =?utf-8?B?NlpYYjBXcjAzTTRYYWpzNGZZTzEvWTA0MVM3TTlvVWZ5ZUI0cmY1RC9WdHh4?=
 =?utf-8?B?TXV1dUFjS1dMcTRvaGdGSVAwaVc4UEhISFhIS0NNZTI0Y2U5VUdUVGMyQUZu?=
 =?utf-8?B?b0hpRjN6cmRXaUZFMGZxbVZDU3FvRWdZbnpkajhuQjIxVEg3L0dNQnR5bmZo?=
 =?utf-8?B?Y05rUmNsMmxURTV3VFhxYzA2RHdENkJ2ZjNZYjk5MmVHeklwangxTUcxaUd6?=
 =?utf-8?B?YVdhWU9zU2NoV0lYbzdOaGsyczdNQ3F2UzJMdDlKcjVBZE5OcWJWOXZKRGtq?=
 =?utf-8?B?QWZuOVRvSmlkNFlJeWtRVnArQTIyMzNpVGtNVlZ1c2VoSXhUU3hTY0xQNDZY?=
 =?utf-8?B?VXV1MnFacDJLSDUvWXBlaDVZQzV4blpvSDdNeFdXZFRkQTZVQUpRZXFkUW00?=
 =?utf-8?B?b2lXeUhmS0svaW1MQkJLZXkwNGFkOExXWDczTmVCVWdXdDRvZEEzQ005K1Bj?=
 =?utf-8?B?N1Y5c2wzVFV5VnZDMklZa2RXbzV0emRyUWVsVE91cWZ6QWdXcDl4emp5SklM?=
 =?utf-8?B?U1JWUjdMdFlTbFgrWVVlZzZXbDErNGc2bWtOeGtuU1BrcG9GbEh1cTBJSUla?=
 =?utf-8?B?K0E4UXg4QTlLeUpVbHV5MXg5ZzNhM2tPZm10YnphNCtkZWlDYTR6cEVFelNR?=
 =?utf-8?B?VTFQUElpZE9LMCtQR2Q1MkV5Y0hTOXRxVTBZbDdmTndna2YrUkNuVHFycVdK?=
 =?utf-8?B?Z2V4QXREZlg4c2tyVEdqYUdpbkJlQlBYKzJKU3JaNzVUQ3ZmdjRuTGUyS0hv?=
 =?utf-8?B?Z3dRSzNUOGxhdVQ1MzRGcEhqbS96enlMaUQxWFExQVhxL0ZuTHpWTVpNRng5?=
 =?utf-8?B?bXhNc0tPYnlRS0NrN211S051b2k0UEpjU2hIMDVqU0o0RmQvc1FjQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe9cd97-6320-4dac-ef6f-08de75d276bc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:33:13.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExjLJYqKk5lAEusCu3nxSVssao2mNXqRJTzTiq8XcftxL9jVLFaKTfh4/Qa+Te1mwhnQxcwVr2sBIPa0uAW8rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5703
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E3E931B3F27
X-Rspamd-Action: no action

The first parameter passed to align_timer() is the timer expiration, not
the current time.  Adjust the calls to align_timer() in the on-demand
governor to pass the expected timer expiration as the first parameter.

Fixes: af74e3a15a83 ("cpufreq: align dbs timer for better package C state residency")
Fixes: 382b95f627a9 ("Fix cpufreq HW-ALL coordination handle")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/cpufreq/cpufreq_ondemand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 537695eaab19..0d94c0e464a6 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -185,7 +185,8 @@ static void cf_check do_dbs_timer(void *dbs)
     dbs_check_cpu(dbs_info);
 
     set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
-            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
+              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
+                          dbs_tuners_ins.sampling_rate));
 }
 
 static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
@@ -400,6 +401,6 @@ void cpufreq_dbs_timer_resume(void)
             (void)cmpxchg(stoppable, -1, 1);
         }
         else
-            set_timer(t, align_timer(now, dbs_tuners_ins.sampling_rate));
+            set_timer(t, align_timer(t->expires, dbs_tuners_ins.sampling_rate));
     }
 }
-- 
2.51.0


