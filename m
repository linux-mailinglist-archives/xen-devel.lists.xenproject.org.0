Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH7FKts4C2qWEwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:05:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F869570932
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312130.1582303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0T3-0006C3-Dt; Mon, 18 May 2026 16:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312130.1582303; Mon, 18 May 2026 16:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0T3-000699-BI; Mon, 18 May 2026 16:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1312130;
 Mon, 18 May 2026 16:05:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wP0T1-000693-RA
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:05:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP0T1-00Gk4t-3b
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:05:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0b38a7-5cb7-0a2a0a5109dd-0a2a450c9c38-46
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:05:19 +0200
Received: from [52.101.70.73]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 6a0b38be-62f1-0a2a450c0019-34654649b241-4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:05:18 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AS2PR03MB9467.eurprd03.prod.outlook.com (2603:10a6:20b:59c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 16:05:16 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 16:05:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdVedvT9DbHMD+nD7Q4Fz/uwqoIeVkHw2EzkOUkuFRLybZwmB4jp4yLGE9lg+NjbgnxkczyYbZMnNWFHGYvsSWoyiAkSyZJkq3AA/TSpl3bA8nKR4TufCabYrNRzWLbsALAuZkImgidDTdQd66bvRP+vUhdEMBVaeUv09Mb68/PENIHdesmZbDxKLlXhPsx6CkMA3xqS6UUEX4s5P1m3mE43PpIYxUgKeyUEowfN9eO2bSnBCwXChqbL7YYMAoS/I73gM5JkvakrKyW4h6uN61/3dPNFi4nFKWuh4PaD2jhGVI0rTdFQ1n4LVx8Ib9LFSkQlhGWxBZsnMbZ0Jf74Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5wUnsDaUBq/j/iG6V3G8/zSJ6iPPLZuqhd9Pgpuc7g=;
 b=a8Qkq573bdtzVXv+8KLuhB8U6W975IlSFN61fvYDFNplGEQxsadBTgIev4W690PTkwT7itSniiBAVmiv+4MDg68+Uk71aG9dGYpM0hHEnJqd6Nzf9Ss/lrqpknJASLdNGee/XFfHhTcnDJQVD858XUWsDEpFZwbmGz84ApU6b2+VlyQH6x2m7Wnn9Y8qVFtsGM5uoOtLMitYavpplB5Sq8KLhnSQam+bHSl2pnRKBgFTXazeI97lbcuCCu9yPQQQdGf3ceCxXLcuhk6TpcErE/WmPPR3AdZxNSDGRsxB/eVfC47+NTeWwn/7Ku+Cne93VsrYAH/t81GN53HegEbv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5wUnsDaUBq/j/iG6V3G8/zSJ6iPPLZuqhd9Pgpuc7g=;
 b=Jd2qkqIgbLMHmMvCt8aDUTRHikZmSf8OdBxQMzOblP+1OdTo2ag9NB5rJ8esNTKa+HL0sFW2e+VUFdWBt0XkhKxe2rnFbsirVT8YUCsGTkwHsA1o5TKftV+o8utBsVpoiBuIgcRtUCuwWxd8HulenZMmrao+IQIrhjFm85gXKlf8htk5en6XBGA2BjLrdHZ5/Bav4wbWJMy2mB8Zvhy928h3DY/mDgJsz8aOI/fqRKqI/DFzM14b8WzxYNM3grg0fbYXLGO+NdA7Dg+E4o17vMPKk5mIX7YZvdWEiiapNJUjywU1YA02vVmnTTX1WU7VjTsslk8O5dlXhkdsWfHAiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <07643fba-5e1b-449c-955b-949ef38bdb61@epam.com>
Date: Mon, 18 May 2026 19:05:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: RTDS scheduler patches
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0049.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::38) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|AS2PR03MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e382cd2-d0f0-400d-9942-08deb4f7400f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|4133799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JrZxVc+md2Aj46OkZ0jwSt76BjGW2CdVMM5rS6XrHM/XKc46s5g78IjHXTos2KJWcZVT1QjceKT6GhsnIb55WIG2t4jpYgCsIlg5f5VFMowsm70T0qhTbazaiAqzRZEfavpbew54iTlPf4LRc37RuAt1CdZqsnWpMUDRsW+4iegX4E5uiDhWEpOJbkuDxrXeysdAhz0GqdiOxdayyVIhsYsYZfKctiTVQuLyAGH6DsPZshEWomwrKKaLwfG1m4YcQjS3zP4uOC6IMPQzu8ZCf3PwvT9viwajWEH4xmP/EQDI4jF/1vvX4ijlRefdp8+NgFKcti64Ugx/6MiKyrCn0Aw42qVR9K6L8tdDDSOwRgZlhawECOwO4gmeXoTB2/APkYozFI/c2bCjOlz+BtIidUklhVNSAP5opF11WnW15m86nnqeE0UeiIsnQ0U/o8m6+RBAasziPEX61epkzJZ29/gST00evqmFn4oYITU7bU5VsxbfzcSVfPXHYpMJbjMA/SboYUcFyNr7JfKMnedJEWeGfTju9T2n85wyRIYs3ySPJW8ZB07IyN9HNGTnyPAbR/xGax49x7TGp9jJr8XxwncsLMPLJ26qR/itygwE2m4uxv2KQHqzHdTCVRTtjito4sQ/lswp3aSwJL9ifhLpKS3pTnGZgOrQQrME5hL9F59VvRR4HBvxEMjKCFgYIcpJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(4133799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ky8zVmQvRHovVDBUREdqTWcyeVREeWFlaWVTWlpyYkwrOFNHWjl2QzFTNEgy?=
 =?utf-8?B?VHNFRFA2dHBpcGxObitaa2QrMzBSOXpMdXExNTJtbENuWXA0clc1Vi9Dem9l?=
 =?utf-8?B?ekxtVGdJb01HUm1MN25jeWhpekYydmltblJuaU5kdUZQZnBOS1lGUjc1T05L?=
 =?utf-8?B?TndndnpKM28yaTAyNDNmQkt1cEZFVXFIUExyNm5kQUk3cGJTSGJ0T2pyN0NW?=
 =?utf-8?B?WTB0MUFWbEZSV0RmUnluRUhqN3JBOXArZ2ZzU2NReW9FQmw1ZmUxM25YSHU1?=
 =?utf-8?B?RG84Q1hXejVwV3pEU1NFOGFkb2IzODloUmd5YURFU0RObSttUUtlSWZzbzZS?=
 =?utf-8?B?dFp1LzVOSWdPcDNQWlN4TUJDQzZVSE1qWFJQb3dhc0VrLzN1ekg2cVNWRFlv?=
 =?utf-8?B?dmFERytMZitrK3ppbDJuNjNMYUVFNXN5TjNyakt2bE8wU0gvOWtoZ1g1eSti?=
 =?utf-8?B?eDF2UVpYM0hQVHhUaDdOT1ltN2FTRlNtdW9zYzUwbWZyd2ZnUldXT0p0ekxj?=
 =?utf-8?B?dkVUazIwckM4V0ViTlpSVVBjMFZHeG1TdHIyYkpwaUQ1TTc0dGpXZzJBTXQx?=
 =?utf-8?B?SEQrUHV0Y3BlaFlOUEIrNzV4dGpPQ2h3ZzM5MWdHaFdnWTh6a3EzSEErQ0l3?=
 =?utf-8?B?blpReGkxZVJ1NllFb2M1aVg0RFMraEh0Q1EveElYQXkwVEoyME5rWFF0SUhT?=
 =?utf-8?B?MEJZUTFLaGhDdlhvd2xNcnZDUUo2cFBiN21DZDlBQnFqWU9tclVYSjVYUG41?=
 =?utf-8?B?Rks1bjJOTzB5bCtkVEFJeHVxbGMzNWppSWlyN1dwZTRYd3N1ckhIYUE4OTcx?=
 =?utf-8?B?T3BLY1lCbTZ5K3A2bGNpK05WSklqdVdRUkVuS0dzcmVvVHZMUjB4MWhNZnBT?=
 =?utf-8?B?TFNKbTIzbGs2bXdhSDhSbEQ3TGdYVVJXQi91RDRYRWNLdVlIalFWTFpWSWc4?=
 =?utf-8?B?dlRUK29LS2cxeHNhazRKSEJ5NHNVZEw3UmJBL3o5Qy9yZjhZOFlyc2ttVHBm?=
 =?utf-8?B?d3J1d1p3NGpmc3BoeWM0K1FIckZoOTRmUFFrUlA3cmk5ZW4wcDN2cFJ2bDB5?=
 =?utf-8?B?YStMTC9jK0g5U2pISXdZZ0VnTm5IdU45dldFR0pLVE1zRnpUVGpQcEFiU3U0?=
 =?utf-8?B?QVhyS3o5MFJnTUFVUC90dE5HM0tWVVBxd0pTY1pBbHp2c1dHZzNreHFMcU1K?=
 =?utf-8?B?V1I1SHVmSWlmYlR1S3NEVDV6UXZXcjJuUWpSWUtURSswcVFKcGVka3ZVdDRp?=
 =?utf-8?B?S0RaNDYyclk5U1lkdkJaNi9sL3FobkpVSkhNRmpqZEV0dWdPcnBoZko5aGE5?=
 =?utf-8?B?bW05eW1KVmwvaEZoSXFZR1pNaGJyYUo0NHZJNjg1eUdjbFV1ZmlON01DN3RO?=
 =?utf-8?B?MEdGS2tCWUNWYnFCQmVmUW95Z2IwdjdVSlFqQ0tKYW9HVWUyNXB2SExjV1Aw?=
 =?utf-8?B?MXRqUTVPUW5UOXIvVXQ3OGYyT0JXQVVYeDc4a2VzaWtJK2tERFFXNTFHcW1w?=
 =?utf-8?B?QXJzTEdlMzN4UXhuM2xiRVE1RHd2VDN0ZlRQV3hDcUJyY0R2YVNteEEzcTgr?=
 =?utf-8?B?bE1wMmI2dkxNSlBsYkJ2NWIvMldoa2xuQUhWazBUdkoxa1Vuc0VVRkZLcW9x?=
 =?utf-8?B?eDZBMit3SC9qbWVMNXM3aG9GQjRDSkxHVG5CUE8yWGM2TGFWZGdhTnRJN0gv?=
 =?utf-8?B?M2xyOE01YlVSM1lVTWJsem1Xd3VlZTdpSlFkeEluRkprOHlPYTRuWGFCMTFx?=
 =?utf-8?B?Kyt1Lzk0V0NpWG5scUUxZTRpZWI4U3dqR1BGbER6cGVwZmx4eUQyRnRoTnAw?=
 =?utf-8?B?dWVtOHFTL0lnNllXTXpCd1VzVG5raGVhUWpmWnk1QTVMbm94WXJTeWJkUncr?=
 =?utf-8?B?V0RicWVNRm80cjF2WTNYSno0SUZWTVRmdDJHZ2hqTjA3NmdLWHFoWlYrcWIw?=
 =?utf-8?B?V3Z5YXdBT0V6N2VqNWNBMHFIYUgrQjU0TW02VEoxNlRLSm1HK2lIR1RpNWtC?=
 =?utf-8?B?dnA1emtMM1VJVlpnTHl0b2hzdlFIbFdNTjZOYUQzTXZiakFud1Z5Y1lxUk1C?=
 =?utf-8?B?QllMRGNCSnVWT3VuaVFXTW9MNnNXOXBPRUcyWXVNUVkwdnBVSm04NUlHZzdO?=
 =?utf-8?B?L3B4VHo3akdWakU4MWkxSVBINzFqM2dpWEdySmdZOWMyeGhwNWJBU0huQ2da?=
 =?utf-8?B?a3NJVlFMS3A5VHZpZk9YZkFER3NCQzlQd0lPZ2p2SmhaWGg0RUNOQWhuV1V4?=
 =?utf-8?B?bVdvQVk0d3ZBR2taR0dCaVY4SmV2YXIxUFVReEZValRCSk5wa1hQaGxYUU5o?=
 =?utf-8?B?ajdYOFVPT3RSeEFvTzh6R1QzN2QvUnBOeU1SNVVHM1hhRlFvc2xpWXo0OXlT?=
 =?utf-8?Q?00O4XcmB2AcEI5OY=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e382cd2-d0f0-400d-9942-08deb4f7400f
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:05:15.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxNr5t0qYo9lVvr4OsMUE8jpMdwVu87x0bVxwbU/lWDteNmolKGohEeuAj/VEViK69PqvSfv+Oc1mfkvnsBEQLEdjwRwVB1VPojZtvQ9jfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9467
X-purgate-ID: tlsNG-d25034/1779120319-F5784CF5-9E92512E/0/0
X-purgate-type: clean
X-purgate-size: 761
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dfaggioli@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F869570932
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

Sure. Will do it tomorrow. Also I found another bug in RTDS. Still need 
some extra checks to be done. I planning to post it tomorrow as well.

Oleksii.

On 18/05/2026 18:08, Jan Beulich wrote:
> Hello,
>
> would you mind taking a look at two patches, both of which were reviewed by
> Jürgen and hence hopefully should be relatively straightforward to given an
> ack for:
> https://lists.xen.org/archives/html/xen-devel/2026-03/msg01341.html
> https://lists.xen.org/archives/html/xen-devel/2026-04/msg00162.html
>
> In case of continued lack of response, I guess I'm going to commit the
> patches as-is towards the end of this week.
>
> Oleksii, fyi: Generally it is the submitter's responsibility to chase acks.
>
> Thanks, Jan

