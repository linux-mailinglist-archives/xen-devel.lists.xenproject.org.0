Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLHZFFtzsmlbMwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:03:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4A26E909
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 09:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251777.1548647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0b01-0005Up-Jj; Thu, 12 Mar 2026 08:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251777.1548647; Thu, 12 Mar 2026 08:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0b01-0005Rl-Gb; Thu, 12 Mar 2026 08:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1251777;
 Thu, 12 Mar 2026 08:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNLd=BM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w0azz-0005Rf-U8
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 08:02:28 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cec9ec4d-1de9-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 09:02:26 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5740.namprd03.prod.outlook.com (2603:10b6:806:11b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.27; Thu, 12 Mar
 2026 08:02:00 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 08:02:21 +0000
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
X-Inumbo-ID: cec9ec4d-1de9-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLpfT80wsMpI2ZkKgRCGaaiSG9IpJLTj9+EPDz5GjsnHdzdU4hmJyMQIAO9efT1eUyloLYz/PDV6b6Zieweakj/Gj3029GA3lDFcadlodIYU9FrKzTqQIksDctcOB1W58Mi8xIUm98B+VFltBxA9mt4X85ANEJAsKwfH9Iz0Yhh7sw/gcIhQTj3D8XRuw6yfoWCShxO98XGNByvigyW+WvGM1Oa8cuQCGlNh/55VwlD5zTabYyAymfyJEOu0+YMWoTqMyfHvx2mhFuyfKFXPxdYvYMraZ7U4aGdV6H5zjmxQlazWFIXZjYnD+cCxshWbUhxbkWDegn2qduyIa9RkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08wODLFuN4N6BksfeVKCpF7yEiF0rthYfncaPcd8r/w=;
 b=AacP6j9ATZxRSxe4EGn8sHFGdlCZ4dhcwt/f2SP9dl12K6t6hyQJkO/0GtSxXjxhFd7N3wasOhuEeon19V6svqmq/m5k4aBpp3eUAdvzIQZ7vfCgmYX4dm4uojr6zxRXUwsn62feZpWVSrecldHGkOJ/Hq45VuicXdLJK2gv5eAj2e3ORj7/FneeImVAMwvFFdL9O0dUZHIG1de/ghB9oAIcc1FKDl6h3BCO05HEo8Gp09RzLMqYX6x1ohVC4kQ+S0DSQLGeREhX8+4npTv1TCn0XdZKJNkDXJQnOTlhr9VMUUk/5p5gB1aCN1UgnIPtcsTKb3Qaf81JMQDcMaVPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08wODLFuN4N6BksfeVKCpF7yEiF0rthYfncaPcd8r/w=;
 b=hCALmE5chMDT9dbJ5A3mM5U2kFiqyxxedMZNP8bQ1rnU6PgzqtfCgULvOlD5ZV6AQ3IyVQDS28Yfu2pAUXKCSi4/3yZ7k2supk0kT8jHIbGWjk6aYSE7K83u3Yp8yfePV9Yn1FcyvSdumF7Ch1/N7jhGb6qgUFrklEcKHAa2pDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
Subject: [PATCH] tests/pdx: fix overflow from conversion from page index to address on 32bit
Date: Thu, 12 Mar 2026 09:02:06 +0100
Message-ID: <20260312080206.52648-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0028.prod.exchangelabs.com (2603:10b6:208:71::41)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d00d893-a9ed-453b-b9bf-08de800db042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ut6IWUVzfrnAqUBKihHviQMvFSTogokElQPvBSb39za9g2rKrF5ongS2gaY2OWFkcvW/AemHWc/TK9R470dzE/W4AZCms5XBezYdoh7oBZ1Y8ryKc43/RY+sU3DiMUAUTu/otLR1+O9CmBXztvquiPGq7gR0gysUF7Rfs/owGzliIis8r+sm4u0YoJvD26+OfslHjuP/PPf2AfuxY/oMD5HctfucMSJGHUYbOXKVfKxQLRAoIxKyGQ7KFQYJHIJy3ZBt8DxsdvHPJ4BWHyuNLQIaUy8CZvruYZ2kY8AoB67+cvIw/MxgF0cq6Vvnv7/3gkQg1n4N6iLAsbAC1yfki3IndwjMsHZ/Q7lkc1J92Cxo89ZgUeNXkqqF/KWSDoRs/sT1LjIyIEx9JXhFK0SGk3k9Uk7EzYbW0rzYDjtNnZazaM6n+QaaWYbK8stprgiDD9k82zbqSgRCOp2J/EBn+6AxICLtMH470VFW+a+E0m/lRFtxK8XrysfX4auM3xJQnPcN76xFjKpl7xFHrcvQAbMQyBmbSRIMyyD99AYNEftMH96cgTO94Vngh1YVYQ3u+zBmjuHtKyXga2pnG7PYdx4g3aFfy/LzXOz/zdCkKt1KaHsDR60MSEAoidc52vbyPYnF/VyTWhhfBqaBgszvmntG1oCJXzCoaI+pAtWxWRN5y99HHRwjQtWDxQ99NSsu0/DWj5N93gvaF9lAVZqqmzWYR5Xkt14NOYTmELdYhwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dldOUHFOWmJDcmhuZWk4SDdwZUpySFB5WUtoVW5HSjVsWlF4ZTVVdnorWEpj?=
 =?utf-8?B?bTBqL1hPS0xmNHBLZUYrLzF5KzBzRjNwNStSWm9YNGVVelI4b2lWRzRXeWVx?=
 =?utf-8?B?WkgvbC93MWI3UU1GTzRmZjBZWlJIUzV2WkhhWGR1TGRFcW1GcjZzSFNuUjBI?=
 =?utf-8?B?cUpBNzJQRW9sbnU5VUVuSTBIdGx5TkxlSDRCZnF6ZzJFSDlZbmxFaFphVGtM?=
 =?utf-8?B?TG8xVnh0cVAycVFTYW4xcEs1Ry9oRDZOTTBkM2RkS3I1QURrZU4wTDdOWDVQ?=
 =?utf-8?B?ZEtadUE2TFhXMks0NGtlMFJJbEt6S0JoS0gvWHhPT29PSjZXQ21neGRnaVpr?=
 =?utf-8?B?SzgyK21YNHJzVXZ6cWZ6dDJ1ek51SHY0d0lhQllDVXFTYlprdkhCZEdlY3BE?=
 =?utf-8?B?SGo1R0pLOTZNQ2pmOFdhcFZMZi9RNThwTGozeXFmTkhqVG1hSWJ3cGplbEZV?=
 =?utf-8?B?cXJEb09iY2QwR2ZGMFFSek9XVkJmMTlJTGZyUUluY0tVOFhReWtVVTlpTEFF?=
 =?utf-8?B?SitNREZXMFZpTG9IMjQzU2FSd2FrTE9wbDF1TWM2UjZLZTg2NXRDOVRUV3NU?=
 =?utf-8?B?dnBraFdtZDlKdUI1cjlyMkIzeGsxeDNNOHVNUTR2TXB2VkNNalRaVGJnbEdq?=
 =?utf-8?B?ZmYwZFdWVS9FalUvYUN5ZUJZbjRyOVNWeEpZWVhvRnZQR3hHajdTV2wvbFNt?=
 =?utf-8?B?bU5ZTmE4TmR6cVZaZ041NkRSS0Y5SzM5UkRRRlZRSS8rVCs2blhzRTZ5T2h5?=
 =?utf-8?B?bDlhL0N0VnFVU3NiYnBGb2kwRDZZYW5TbTdYdlRDVy83THVEYXIvYW82Zy9h?=
 =?utf-8?B?WFY3ZGtyWGZnZEJ0MWlxYjBIQXU2Zk9YVUFsUytqY01FQ2ZrbE5ZUnUyUU9R?=
 =?utf-8?B?aVZENFpLdkd3b1BjMzExSkxPVDFiTWNkcEZnVWJmWmhkSmJldVhjbU44SDFW?=
 =?utf-8?B?YUpWN1d1cW8xSk9kWnNPbUtjd1ZiT3o3dEZrSGVOeHI2cytUa0w0c1IxMzVq?=
 =?utf-8?B?b0g5bEI4T2NNWk5Pd01qWEVWOVhPOC9TcUU4UXdhSGMvTHEwaFMzcVYzOUlw?=
 =?utf-8?B?eThSdDExZG10ZFVUb3JvL3hhTlBYRlpuZWxhYS9JTGpET256Q083M3RVbDlW?=
 =?utf-8?B?bTNTc1ZIbGlzRW1zOG90emdHMG5wdG13UmpFWG1RdXBvRjlmbDFkSXFndlF2?=
 =?utf-8?B?QUJJRHh3dVhNYkF0d1RWUUlxSThvVVVnaFlHdGFLTStjb3NOcTFvZVVMSjU3?=
 =?utf-8?B?K0UxVDV6ejZWMGY5a2FGWEJTd1o0RTFpb1BnbTkrRStSQlpCMFpIaVA0Vm9I?=
 =?utf-8?B?MVRLU00yMWZpSzVRM2JQaUxCVE40d1VobkNyRnlCcjRMTSsvRFc2bDhBcnR5?=
 =?utf-8?B?bVpJQktVc1FHQmYzemFFU2JBdm9abGhBNDhhckpmSnhhOHpNU0MzUzNud2x3?=
 =?utf-8?B?ZGhnUUZlTlRWNkp5a0pkcUZFaWpONVRXV1JaRFcwMTZMTmJwMnM4QnBYek5j?=
 =?utf-8?B?aVlXZW5nQ0VDNjBDZG81aldjZ2I0NGoybktWaUMzbWdad0VUY29CZVkvd1VM?=
 =?utf-8?B?aEg5S3MvWkJXWWM5MEJqT21HZkp6U2g0eTJ5SUlxbDF4T2dGb1l2TTh0S0Mz?=
 =?utf-8?B?S1pqYW1HbCs3dVhadEJyR0xhQmozbXY5aHdmcmpKSEk2dDdDRUxNL3hnZllB?=
 =?utf-8?B?MWN2cjhJbUFiR2p5Y1I3MGFtazN6bTFpemdnZyt2Y3ZOZXgrSW12dHhPQ2RX?=
 =?utf-8?B?V0NmWnBNd0x5aGZxYWxzZTdSSWt6a3Vod1RTb3Z3d0pIbDQyYVBldzJ5V2Fz?=
 =?utf-8?B?UWNzMEtTOEVPUVg5amVobFBWeDdSM2t4ZUF3aEhsS0VzMzk3RGFZb2h3T0RK?=
 =?utf-8?B?Y0h2eDhuREc1SW9GbE4wVFY5NkMvYUFEOXB4VDk4aC9tWFNvdENTZ1lOMDVK?=
 =?utf-8?B?K3UvYnFubkJuakRPQWJnREZVcjA2TG56NDExdTZNdU8vSkRSYjhHTU4zN3lR?=
 =?utf-8?B?blFIVFRVTG1oM216bXFjRkMvMkVvdTdZZmU1MkZqNThpbWlOaUhZc1ZqKytI?=
 =?utf-8?B?R0Y4SjBWMmJ6VGJNMXdLSEdBRGJIbEY1TVRLQ25XeHVrNEwwWk5ZOSs4R2xW?=
 =?utf-8?B?Y3ppK250NDgyRWhHUlFCWldwbjZkMyt4c0REcW5vajNOYXlPZ1ZIRUJodHpj?=
 =?utf-8?B?UjI4R2hRYmlMM0tYVXNEbXV6TXFBOFFyS3g4UkpNc2hCUUtONzNsWjVMbXA0?=
 =?utf-8?B?VjlwaGZkbzlvaEZGOVI1ak1FTXFzelF5WHQ2VStrTGFwa2lDTWs5TEVTbGk0?=
 =?utf-8?B?SXU4RHhhMDdwdmNQWWgxM2paNmdlVnBDWXBjOFFzZFU2eE5Db3VxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d00d893-a9ed-453b-b9bf-08de800db042
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:02:21.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02uOy07mhEVpvdZV0NO+Mj0yIH9xYsWERO2iFHZhO7sShrfSlIVTGN3PWZN7EBi5fL9aEsmwT0mNfKscY8IcYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5740
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:edwin.torok@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 93C4A26E909
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When building the PDX test harness as a 32bit executable the page shifts
done on unsigned long types can overflow.  Instead use pfn_to_paddr(),
which casts the values to paddr_t previous to doing the shift.

Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
Reported-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/pdx/test-pdx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index eefd54c76815..066bd3e7e569 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -208,8 +208,8 @@ int main(int argc, char **argv)
             if ( !tests[i].ranges[j].start && !tests[i].ranges[j].end )
                 break;
 
-            pfn_pdx_add_region(tests[i].ranges[j].start << PAGE_SHIFT,
-                               size << PAGE_SHIFT);
+            pfn_pdx_add_region(pfn_to_paddr(tests[i].ranges[j].start),
+                               pfn_to_paddr(size));
         }
 
         if ( pfn_pdx_compression_setup(0) != tests[i].compress )
@@ -233,8 +233,8 @@ int main(int argc, char **argv)
             if ( !start && !end )
                 break;
 
-            if ( !pdx_is_region_compressible(start << PAGE_SHIFT, 1) ||
-                 !pdx_is_region_compressible((end - 1) << PAGE_SHIFT, 1) )
+            if ( !pdx_is_region_compressible(pfn_to_paddr(start), 1) ||
+                 !pdx_is_region_compressible(pfn_to_paddr(end - 1), 1) )
             {
                 printf(
     "PFN compression invalid, pages %#lx and %#lx should be compressible\n",
-- 
2.51.0


