Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHPfEm2MxmlELgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D2345A80
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265691.1556492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67eo-0004xA-BO; Fri, 27 Mar 2026 13:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265691.1556492; Fri, 27 Mar 2026 13:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67eo-0004vV-88; Fri, 27 Mar 2026 13:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1265691;
 Fri, 27 Mar 2026 13:55:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w67en-0004vO-4a
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:55:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w67em-00006j-ET
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 14:55:24 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c44-2eae-0a2a0a5409dd-0a2a4502830e-12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:24 +0100
Received: from [52.101.48.23]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c4a-63bb-0a2a45020019-346530175dc9-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:24 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5370.namprd03.prod.outlook.com (2603:10b6:5:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 13:55:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 13:55:19 +0000
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
 b=hW0IwVEpoB6nu6nnnPftMw32GKkKJdWFEPE4gwkBoDjAvBy0aXRK4i7OBQ5uU3gLmMvRuZ3hFFw//Ixc8XbSKoWdfJha9xKZcmNuYnN1/DVGMYRhv3rn5OTbeYDWuax4mSR2zrMlGRwKcF5Wr32syzptVHiVBxhHSWqknXJ8CtuI8pc0WWoogElAhPMySxqWZXpZYOA13Ye7yzckqLlpSEiIIReRX7LT8JfXU0V5fzrjZJ6GfdsO717cEnn1QWr6uB8KD+GF8rGj5jBCaB6MNV3qmrU9qIHXhRO9QAzvjVITROXxDxkT3R2TCDF+WqpQbpKTmsBjCUe76gt2bzpJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9pb3sng9zipYA4/4IZ+bKnGfqk0Aeb69HVG0bun0+k=;
 b=XfT/BJhXJv1hxfRjy3YN6i/mnSWxI+mpXM9EH3SxC+VK100596wKcmCKrjxT0dIgFgrD8EN/D+7QitL3P3PGZjTmfwRRGdIl7LvFHFxdF9znOfrtZOhp/UCemes/qhSWP9KuEASqVIMe2A6UvNHzTyW8uP4rIZWUwQKoMj9aK1X4N7XegQWUGJ9aLM6OvarXQdrAkeBfO/Fea1wu5jLX9JtWlCqB1dmpVdAVPZNqHBdgvdSGd5/gVuMIZ2tblzyQ1vuXAK68/DmFxapulD1oUKfHbpys7Uuit25BM6XEGh2uDa1ABTMKvynL70wAcIjFIpLn62UitUVrXsoCIFSs4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9pb3sng9zipYA4/4IZ+bKnGfqk0Aeb69HVG0bun0+k=;
 b=oRIqew+GolKYH0WJQj+xYAQUn6W4jkErd2pm5KNKiIsV5itLHdu0j0jv6hPLbClHToki0UUNwLeAlL450xK2Vg53iN0yxw+9GKd5q0PzL3qk38ixBnLIthVpHmUVNZAFWdGIfkFIWpPW4H9DHP6QPbavNdnDJvdItIc4LLZKmfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] xen/uart: some fixes and improvements
Date: Fri, 27 Mar 2026 14:54:17 +0100
Message-ID: <20260327135420.7246-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0058.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b69511-260a-4626-ead9-08de8c087b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lniu2MvbTVoYLR09zqxpKxt7y6FhAVGZvXHx6pPhPbcl7NqRaTJUEqQbz/8OWCFhF+s+ydwylAdLaPsQHtUZe7K/gp6/f13qYmNuIXToHI99ivhDH+xLwzdcQl+aKbNPmnNVrOS2/RdnlGz3Tj2/OQrbyA/CM9CyFPOj0kvwggLrKO/OLgAVjkxm3Z83kflya2In1TKNXCjn/Z8VuJN8WQiZPcRzDSECMXUxUgGJswzDb+XQwiDfmQQc1QAUC3E/d0Yf10EESWaUmrxrLFQVduJ2LmOwN5krLQNlR9dSrNNPi/W5TGkRRTa8xRRGy/ZY+O61f01fQG4Bl8Naur/R2jTmngVyH2Q6gYbnnttxP9KJF3qfkBD6JYTDooqwYuBHbgIPKXeY1DJV7w2NfflBPY1CkJbBQ/FvPXppPM11SaZxOo9TqIkGkzMH/UlzB3B80GKJbZ6kp3KCCpIBiHYyEFwCGN9UVnEhw22g5y9AOC+rvddaw2DDWFw0RwXuLE4fj5Sh0p0CXkSfbD/gIS3SA0/vUz9YDzkdNUNs47CPw+wy78SyEZaSnVXYL0/6KrkttAi/YPrawW29WSKiPTSOg2vw9nTVZ954n3rkx+3uH6IXAXLpxL/BpM2EFph4+xBjvsQCFd0mOcKkTDR1G8OAONiztnbkrnLsHMAfvucMNn20r1XyvaQJ8MD5erV9edLaXqEYQNDuhYDJXqmOmGo+UIIHitxdFQIHK87f3iOEgWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3k4SzVCTVNmQTRiK3V5Vnh5MFRKNzVRdUVIYzRnZHR2REJqdnJzbnFpSTlu?=
 =?utf-8?B?NWR2TzU3dkx0UTd5UWswVkdDa3Bqb3J3ckV5Z1h1NmdOQ2FTV1B0OTZlUmJv?=
 =?utf-8?B?a1Y3ano3V2U2TitZYVFzYW9aRWxLTWFTQndWa2MzbVU0VitLaEdoUVkvY0pD?=
 =?utf-8?B?bkJiSVp3Zi95Mk0zaDZpOFFnaUt3T1QzUjJMSVFXTHBUU0lXOGtDWUpOTXZ5?=
 =?utf-8?B?bDIwT05wWWZtM09UMXZ2OWM2TEpkSjZKb2lHc3NPZmNCVXRXVHV0aDBBaDRU?=
 =?utf-8?B?Y0dSb3FsaGJVMVdKMXlNS29DNmNSa0prSjRBNFFGUkdESG5NdWgyaGR1a2NL?=
 =?utf-8?B?SWJzMnVJTktER2dzUWpwTjNiRkFpcHkyRlNoejBQN0RoZ25RMEdERjd1aVZQ?=
 =?utf-8?B?SVBxYmprR3c3bzlUNkxna3d2SG80NlhVSGJYaEdLSEl2VzJKcVdkMHZUSVFM?=
 =?utf-8?B?em1sb3J3d2NCUzJsNE5JSFNrK2pkdmttUGg3L2ZOTDNWRG8yZExZV01pdXRB?=
 =?utf-8?B?NEEvUzhDdkhDTE9JUnp1dEdjOGJCd1hWdE5QMXhYcG9mdHlaN0JPWlpoS3d0?=
 =?utf-8?B?dmdQN2MwckFnM3ZuZ1FXR0FpajQ4REdqWTBuSGVMZFZUUjBOUkVpbnREdytq?=
 =?utf-8?B?Ykl4a3JPbkJkc1dxZ2Fyc0dmWkNlNUZXeXhiZ3VFOTVrVzJyd3kxSWw4MzZ4?=
 =?utf-8?B?RmgzbTM3ZlFLUFBxa3ovOU5pTU02TE5leGpjamRuWG5nKzhqdlhhK0dkbzlK?=
 =?utf-8?B?TzJTNCtiNE9RNEJzYXdSUVVjSDNVTDRkbFZrSjgzam9YQnlqclQ3KzIrZU9p?=
 =?utf-8?B?NmpsTCs1NUxpQVhKY2pxc0p5Sm1xVW5CZTgzZkVTRzJOcGYwWHcrMUEzMFUy?=
 =?utf-8?B?TStHWmVxU1IzajFmTjZxMW5zZ2I3Q0VEUWpxL0hwZ1JrZGc1cWgwMHpjM3VD?=
 =?utf-8?B?aGUveTdQR1d2bGdzK2xRYVdLN1NKK2gxY0d4dkl4cjVaSzA5V25jVG1sR0My?=
 =?utf-8?B?ZjZVT21xV1IwY3M0cTFSMHRDaFlrR2FYMFNEK0lvMklWY2EycVZjazdCSUNJ?=
 =?utf-8?B?WU5yd3RRYjViWHZXdWlaM21VZFVXaFVFZnBzZlNIdWZEalBoNGU2MDN4Q2k2?=
 =?utf-8?B?QjZPMHZnSUlVb3NieStmY1d2bStrQXg2d1QweDE0NU1RZzQreDBQTzRaUWJZ?=
 =?utf-8?B?UXlHU3NVS1l0VkNtMFIxTzZUczVCNmFMMWhLOTF5dXU4dEw5SjlDUEZNTy9Q?=
 =?utf-8?B?WXpuNnE3TGk4SXZzTUZvdG5vMlN1TkRVZmZaMW9zelIvaExFdzZkZ0hObmM2?=
 =?utf-8?B?S0ZjWTVzN1JkNDNzSDhWcXUzVEs4OGJXOFhPYitIUFBxVURWTFFqbzYvbFo3?=
 =?utf-8?B?QU1FS3BMQlNyUDhBSUF0TzBCek1UaEZHMTJZaU9CTXU4YnJScVBTcW9KR3JF?=
 =?utf-8?B?Q3lXUnMzeVpvOWUxS0VtSUEyWkRBd2o5enNWSXZnZ1ZubnRaU3lmZHVUa1Vu?=
 =?utf-8?B?NytlQ2JXTzBpd0x4akUzdUl2bEYycjBFb0VqNENWVjdmSlFxc0hIVDBGWXND?=
 =?utf-8?B?VXQza3JaTkY0TjhDRzR2c21melRydTZWTjFvNmIrOWo1Mzh3L0R4Y3ZNbUlj?=
 =?utf-8?B?ZlAyaGNwZWdJNTFZOU9rNVVmaW85T0RFNDlXdXNVa0ZJb0FWMGhGcTdnVmJs?=
 =?utf-8?B?czljMllZNG5kRzcvL1BvMkYrQ2syQ0xEYTYvZ0JEeU1nRjgzdnlYaFVqN3JC?=
 =?utf-8?B?Y3VZelczRTBObW45S3pyTHVZbkY1dTk2eFBFaEJ2Z2Y0bmZnK1FZK2RxdFVP?=
 =?utf-8?B?aUs4REtCYmRReTcwTkErSGQ1UWxmT1hSWjU0N1NjWDNlNlYrUzd5bUxMNzJQ?=
 =?utf-8?B?MktDM3lrTHhHc0oxcTRYOHAwQ3d0S2c5c1o3KzcvczJmOHpTcXZMTnp1cktU?=
 =?utf-8?B?U0NkVTV0M2R2MUFiaHNpR0piRWhzWS96TnF3eldIUGdNSDlEMW4vMVBpT0Vq?=
 =?utf-8?B?WnRoYitKRVgzb0tnL3oxbjJTK3JxbUliVWw1UjJPQmMwbDhaT3UxV0RRa1NG?=
 =?utf-8?B?Nm5IdTVvRi9NSHE2QThCUTZCUkYzd0NnVE5TS2g3eG1qVHZNcjY4TWsyRnBB?=
 =?utf-8?B?YUZUekM3SlJSK2ZMRFVWUmlGMm80eXh4Z1ZhLzJFQUI0bys0VGJNb1I5eUxI?=
 =?utf-8?B?cDUxRThHLytSVHIxczQxRTd0RnJ3NDBjUTgvK1VoVHV4TkE3ZmllaDQrVUdP?=
 =?utf-8?B?Z1puOG5wZitVQlVjK2dheWpVMGhOQko2WHRGbWRsQmJabGJVdTZLa3UyWkND?=
 =?utf-8?B?TTQ5VFlxVFdiWk55amhzcldGaDNyVGdLeGpkWkMxUWtHTE1PZzNidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b69511-260a-4626-ead9-08de8c087b5e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:55:19.3583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH2u8mLdC1B5e6SlxelfmgE3t0YZ6tYlMNYEXq7gp6ar7NhpO3pzvchz+VrkEIyNE4t3J4TcsyATC0+iv9DApg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5370
X-purgate-ID: tlsNG-720697/1774619724-41290DB8-F632E9D0/0/0
X-purgate-type: clean
X-purgate-size: 474
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A91D2345A80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

First two patches are bugfixes, last patch switches the ns16550 driver
to use pci_sbdf_t.

Thanks, Roger.

Roger Pau Monne (3):
  xen/uart: uniformly set ->ps_bdf_enable for all PCI serial devices
  xen/uart: be more careful with changes to the PCI command register
  xen/uart: switch ns16550 to use pci_sbdf_t

 xen/drivers/char/ns16550.c | 145 +++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 78 deletions(-)

-- 
2.51.0


