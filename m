Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIZ3KfmY52kV+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:34:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C4143CC72
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 17:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289105.1569313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFD5z-0000Kd-OC; Tue, 21 Apr 2026 15:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289105.1569313; Tue, 21 Apr 2026 15:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFD5z-0000ID-Ky; Tue, 21 Apr 2026 15:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1289105;
 Tue, 21 Apr 2026 15:33:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wFD5x-0000I6-H7
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:33:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFD5v-00CQAw-1z
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 17:33:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e798a0-e002-0a2a0a5209dd-0a2a45069d4a-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:33:00 +0200
Received: from [52.101.48.2]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69e798a6-7371-0a2a45060019-3465300220a2-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:32:56 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7332.namprd03.prod.outlook.com (2603:10b6:a03:566::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:32:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 15:32:52 +0000
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
 b=leCdwQGxIw1icIqtJy/Ts0kTAXrteOxOZfH3tJQnjFEFAtdpJj8IwqCYgOFXJZa7IUXJMwC1wYn2IK04rLf+Br4adAk+IpJqzXbP7anDCzXo5zf8XkJhvQBSgAea0fbue4Z+RdTJr8NiAAYYyvaOUaXVIemJJWOQ/KB5l5kmkeGkbMQAnVx7/eU2qTf1SMB8BP+qGjeJuwbj7el5ZOK3B0U4DXdkSAAz/vFoPayiKODRyF+0wh1mrVEFdRg1tB+S1LXOWUUTNIfLzqPa/AGxJp+16rcZucO1sTcLLgDV/2/UmArrvhnnPQ48RkfPH3uZ9o7u0CuvJ/tShtXrKpvFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVw05xE/J8bBGrEM6+0jSt3r+aIt4XgzxTGKohABEzM=;
 b=brb5bqkiSMcB6KiXFcCQ4JTwCKNdLT9cpU1t/Stpzd1leKCpZHs3hofie7AZ5E1Q8MLTHD9BuRSKM736aZX2T/Ex9Q4jvSoG8Y1E7xuSaxM9N2m+mvRBqwlM2pSJl0WNfm/EhPv+wgiOxTkqA6/eF0bzv3YbKBYE783LFhCuLV0+s0s2JROEk+913cNDcJ8DIyg7q9ts980Yof4yEpI53kLwqS2eXAszmQEPHIq1/SgXUqINKoH9WK3Hs6+U8R3czFTJduQY5D6jQPLkDVG9OafMQrOeuvk3bu5fHa2RX6lz8ZC7tVWsUp300cPq4mCHC3VRH025IBYD9KhAWdUluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVw05xE/J8bBGrEM6+0jSt3r+aIt4XgzxTGKohABEzM=;
 b=bWEFq7TiX+S4lpJXtlShaFC7+9a4M3gLMb0Diec2TN0/imyi/1MBm3/CcbQJnFyi+6TjyGT8oqKFAeAaMCihhWeEFkCePHJMFy14BrbBck9wjRszr6YriKVmxRXp+NM56Cz7oOe6pwybfMuBiCLjoY43Zax0Eu33pQEHyA4AgnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] tools/xenpm: fix FreeBSD build
Date: Tue, 21 Apr 2026 17:32:24 +0200
Message-ID: <20260421153224.36368-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: afe2de1b-fed4-4202-0c01-08de9fbb4064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZnRmHteGn6aerwEVEguR1uNNOWgrq/7ktbRQw8thEz9C8pogF10Lz7nr72wwmwXmcKNwRg+kw2HQNlmsNLzlNpvkiekiI72mhjBQvT4qy3a/U76WiyR9ZKlingh6C4m+3ypddK6K3Sg0tAvNEOjs6tsufct9BLwoN0Js8NF1x0iWp5p5BM0spcTh4eN7p6Xof+kC/HO9uT/VO36zzS6hOZnl3Q36Yq24XFgBizBDUIUL67Dx9vP/JXHasRR21ru2vniQUaHQCcV+96UOYvSqDRZCFc6swgFPIx8neydp9FZdE9ps3tedO6/hJ2RLdwBo6iETolP9bKVmP9QFfodNEhrpNyC6sAqNHmApiXjOfmBxYDn7NPYmiJ4M2o4r8zVp8LTN6YK+frbY8kdRVY0V1b+QZzeJj96z04xoKp4pBbYI3iaz7Qe7uq9u4ioNDFtl/pT5amOz4iJv/9wg7HYjudCZas+AgI7Jm3QuGPzxHOKMEtSM809fmLrA5W4s4HPaNGaZ5/DxRNWa27inCwuMFVL9QiaPgDgUZb5cb9yua6ZkHTZh9NgqIcAm8/CMpkQLOdGMdD8pq4LrXZifnXR33LzP4zoAkpcj6d4bYMy+LhwpomtMlo60oh+fWTb361/A47Wyy9oWxycsNKuNYHrZTfXge+wokoLUcE5gNEJ38yXdM6h5hoh+5vcfvElFd7xKxrHPzGqr7gQ4J2N8jEABXlmfMjTzRHh+ENl0qg9ws5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHR3bWlGNUQwZWp5K1d3R3FpUzA4ZWxrbjFTRVEwMyttc0QxYk54TmV1WDg0?=
 =?utf-8?B?VmhJZ2grZ0ZMV3JCNVAvK2dSQ0laVlczdm5VVWcyS3MybWV1UGt6L0FsWjFF?=
 =?utf-8?B?OGU5Rk9wcHUwb3UvYkd1RFFmSmNGL1ZacmlaV01RU21ZUlZQbEcyd3drQ2Fj?=
 =?utf-8?B?S3hwVXZ6U0kzYWNtcWs5UHJjS29nT3VKNWpLd2JsbHNHMktIcmRjTGtqc1F0?=
 =?utf-8?B?b01qT2dDdkh6bnhqbXU4ZWhVMEIrS2VDbWlPU1BDL3JOL0VRdjVFRXdnMG9h?=
 =?utf-8?B?V3BYSWQ4ZmRBTGdQcDNQVzhXY1lVM3hRdEtIOWJFQTVIbnY2a0l3dWR6MFgz?=
 =?utf-8?B?VllMWklISXB2aGIyMmw2Slk3V1JEMmJsM2FiUUJhcURRZUtDSzhISEtWVTla?=
 =?utf-8?B?RGplQzBkaUtUNWx5N1VMUCt2L21xN1M3YkIvODc0bVp2aElEU1dDZE9IVUkv?=
 =?utf-8?B?UGpGRVVJWml5NWZ4UnR6WWw5WDhjVnZaOUlaMW90ZzlCYUlERGtyK0dNMkht?=
 =?utf-8?B?V01VZ1UyQ2FpZ1dPeld3ZDJjNUZmYjZwcEtrSUhYVHF2SDhBaXFFYWQwcVZ4?=
 =?utf-8?B?MytwVGhaRjlmOVMvTG5GT21tSExSMkZmRVF6ajh2bHNxRnU5bFEwN05oWmtx?=
 =?utf-8?B?cmR4a3dRZ1VNOWE1bUJWNS9qS1ZKSHRwT2hlYytJRURlamtJb3BwNnZNRWNT?=
 =?utf-8?B?aVJhalNHYXRPOHhmU2FwNVltZ1pZY0NHRlkyT2JLbUhqZkJYalJUR2NEdnhk?=
 =?utf-8?B?TUdZL2FibmxmS0xsRExrWnhac3UwTkwvYmU0ZHg3VHZMVjFvckVCbHlWUTJu?=
 =?utf-8?B?bDB2WlBHZFROZFdsZHRkN0g4Wmc3WTI0T1FibXJTUVRRT0ZKYlJMMFM4MUh5?=
 =?utf-8?B?RXRxTnQ5TnlRbWxHTXpwcjJNdkZVTlRqaDlQdXgrTGNocHhMUFJJRlNMbG5G?=
 =?utf-8?B?ME91MHYvRVR4dWR0L0lLbFZZdWw4SnpoaHFwOTdUNjlTalgxa3p5SmpKOGsw?=
 =?utf-8?B?dDhYb3FaY3R0NE95clBNdW45SG15ZnFyUDJoTFlNQ0FuRzZrWDhOeTBGYngw?=
 =?utf-8?B?QUttZGRRUjJ2MVV5RkFrR2I4eTczZklUdDV2M0dvQjhLVy91UDQ4UTFhd3dH?=
 =?utf-8?B?MWxxSFBDdHVtbGUyazVpQmhNWDZYWGhhMUdKUU5sOEV0SzR5QXVuVmFTUXNm?=
 =?utf-8?B?dE9heWZTcEFHU1VBUjcxSk9FclQ4TnhDR29nOTZFaU8rRU50eWh5YllKMmY3?=
 =?utf-8?B?WVFjOWoxejVuT0FLaTF0Qkg1NU5JanpwVVJodDZ6OGxudlFjaGYvVnJyaTBX?=
 =?utf-8?B?ckYvM20wamdqNU1PVHh5THFCaUhrQnIyZWFuaGdjUVhocHBKb3JTZjRlTCt5?=
 =?utf-8?B?eVc1SmhPY3pBZmo5bDlZa2dSVjZKRkUwR2oxTTVTZUhzSDg5TVlCVTY3alYr?=
 =?utf-8?B?dnlHdU91K1pBVGpkVWY5M1J0akhKTm5tM3g5ZnpVZWxKSG8wb2xoaW9LYlYv?=
 =?utf-8?B?bFZkbUlGMVhsd0NjUlNGMDFoVytzWmtWY0p1Sy8wZHNjVllzbjB4eVpNUFd2?=
 =?utf-8?B?aUtILzUxOU1nN0Y0R0RJVVlSa3JlODE2YUtOQkh5M2ZlR3RPZ0FueiszQ3Az?=
 =?utf-8?B?QkVzYlpDYmhxMm5CeFI1Ykw1Z21lQWRPTjArQ3hTVG04cG5FK0daVmJPWjBj?=
 =?utf-8?B?WmFUcGNUWWVIY0dPcHlUdmVVeTg0TDhaSmcvdGNnYy9PWXp3d0R3RjNJWG9D?=
 =?utf-8?B?bS96RW14T1BSOVJjK0RzcVY4YkpiVWUvWDR4M2NZL0ZnV2ZEek5ZbGp4TVhu?=
 =?utf-8?B?MTRTUUlKbG9leWFaVWZ6ZHd0QWxJSkhRRTYwUHZQZ2t5eHVTSk02K2hxbHNH?=
 =?utf-8?B?ZlA2dGRXMFlCNzJ4L291ZUFCS1ViTHdzczRxTXZURnQzZEVuMmcwMkkzMmVr?=
 =?utf-8?B?aWErSXlydnA2UzJPNHlkMzlKVzhCNG9mNVhNdURFMlVZRTdNSm1OZ1JIaHNL?=
 =?utf-8?B?eU03TTIzS0R0SGlVUXgvSEhzS1ZsN1J1dDRBaEJXa3BDSWZmbWRGWVFEbDRE?=
 =?utf-8?B?MDRVOVBvelVBWTRraE9sUlVnMXJRdUV3Y3dETWZueUdlRSt6OTR1MWdPSnJl?=
 =?utf-8?B?ZFBYMktVSTJya3lWdmZvdWhuUS9RVE4rbXY5dzl5cDh0L291d3lPOEE4bVdI?=
 =?utf-8?B?TFBmRzNQdmZkUjdTN3EwNnpBUkp2ajBWaUQzMjBSbUJNQmtwUFlJNHhGVncz?=
 =?utf-8?B?aGQ3ZnErbUZFK0ROZWpqcDZERGttWEttWGxQY3dWRUZYZ2ZNaDVDeWIzemE5?=
 =?utf-8?B?M1NNcWNNcURQS25NaUN1RkRTVGE3bWVyVXVxMlhlREJrYzRQcnJRZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe2de1b-fed4-4202-0c01-08de9fbb4064
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:32:52.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOuE7kRcmbK33TCPLfdqCI6jQTqzdLB70sjOmu6F9vZ6UedScDDMp2j94gRbMCmlLcVGf8kDuecUDmHdpHfY9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7332
X-purgate-ID: tlsNG-16d1c6/1776785576-CF371D75-C5CCF5DD/0/0
X-purgate-type: clean
X-purgate-size: 826
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B9C4143CC72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ENODATA is not defined on FreeBSD:

xenpm.c:1380:17: error: use of undeclared identifier 'ENODATA'
 1380 |         errno = ENODATA;
      |                 ^
1 error generated.

Fixes: edb657887a60 ("xenpm: Add get-core-temp subcommand")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/misc/xenpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 87107bd6c617..ecb39c911d84 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *te
     {
     case 0:
         /* This CPU isn't online or can't query this MSR */
-        errno = ENODATA;
+        errno = ENODEV;
         return -1;
 
     case 1:
-- 
2.53.0


