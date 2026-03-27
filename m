Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGl3D2mMxmlELgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50DB345A71
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 14:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265693.1556509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67es-0005Qe-T8; Fri, 27 Mar 2026 13:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265693.1556509; Fri, 27 Mar 2026 13:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w67es-0005Ni-QF; Fri, 27 Mar 2026 13:55:30 +0000
Received: by outflank-mailman (input) for mailman id 1265693;
 Fri, 27 Mar 2026 13:55:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w67er-0005Mk-5i
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:55:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w67eq-002tUt-HM
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 14:55:28 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c4e-bab6-0a2a0a5309dd-0a2a450ae2a4-8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:28 +0100
Received: from [40.93.196.2]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c68c4f-1772-0a2a450a0019-285dc402f33c-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 14:55:28 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5370.namprd03.prod.outlook.com (2603:10b6:5:249::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 13:55:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 13:55:25 +0000
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
 b=jXpBxFgmWHq+sRMVRK+Ges0s8czGkBxI5p8JPrpSSn6JD0Iq+dXheDM4iiSZzLdJ6l0XKy8mU2Eh3TNUGx2rj7sXeKdFBB3VO312ZLrXayT+gelLYprMYKDF0B1PoN2ziWaRGRpFvp2ghVC5i9MxYPZMCsN6tgqL3fzYuoohBsfpZtVyDQJc+EviwT70lq43bWKujyDm1rXoArxqvKnm3OfZUqLvVMvaUUupB5vGVCtzFMIbQ5PmQeAgroHNLp0/Ih6QYJdUSSyql53ZpS3Ejc8iKfzQy0F9tW7LntAlCcnSJtv8LasMrCEYz2z4mv/3PMjOzDIbnUBHLj8Rkw0S/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJ0Ji5W2h3aOIBrVtvdFNdAp9lxGhfHtiIvV+ocnmZg=;
 b=l/UwnxKfO8sEKlaZAw/GDCB7bNpKcphMcJhm/psk2vB2D0ZMWThsAwFeAFAtxJQagBB8MTnkJ4b1Sb95HHgGWEhJ6ms5ncQn9jZlYsHsbiY4LeATdSWCPrcVzECd80GHgb66zOpE1WoTt5DxildVQvJCCziJJUNS4UW6nttegl+gY3d/kxjBnpun/XNTNdtWyPuSDL8GZjWLmGomS6I2wLNq0u7hJUzqHYaqHmk2rD3LvgWA/tIrxoMQmeMkRGHMglIZ4nReUE+aqNl68n3LXZrLHmKSvxRAB0ixob2P0Sn8a4KaofWHZOStKUPvuytCAvs3VdXWn1jYNEwDpB/sbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ0Ji5W2h3aOIBrVtvdFNdAp9lxGhfHtiIvV+ocnmZg=;
 b=ukDUlovWCJrGE4StQxqz4WS7LDqMJENBiOCiYTp5yUiJNS6QP5Q0pu9aIt2w8Xk3/lVRtvz2r7HAAmwPy1+0iRJtKFbBpj1OFpXbIzZspaTDwxXILw1pNgnID7m0cQft0N3OwHj4GK8kyw7ipl/SlM2p0r/Xx1wwV7YA+0IPNrw=
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
Subject: [PATCH v2 2/3] xen/uart: be more careful with changes to the PCI command register
Date: Fri, 27 Mar 2026 14:54:19 +0100
Message-ID: <20260327135420.7246-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260327135420.7246-1-roger.pau@citrix.com>
References: <20260327135420.7246-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0053.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 4065a55a-1c13-4de4-c334-08de8c087f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ADQm7JzVMIdmKY9qo+YZU2j1GQaqIOfWdFmHPjssSBAno01T0f2mWfPgcG962IcWCZa38yUJQwW2RfuoZKp1GjglbyIeve+alu73LqMW2F14EAI+GXfQc9azDJBuvjeXiSK/BmwXhrGLZMn2CY8Z9OetGSEUim5ihqpgrezf0mMSMzQabwJMslnn8zpXIAHAlVA2yteLHvrrQmxl0T67/yGPa3xTzYhAb7DFmPC+aszC65usbybLsONXLxwxzI7iQjCnHqsN2luRKdEwNM/rJ4szftRXkEFbiDuFxoJ/ei1+u34WFahBkVRicDgZEFPeindYPlCFdD9/bK65whF3ylJ/DLiRHJ74tM7b5XlCBITBXj4TvmxG/WnzzQjFrlno7skIFD4xyjbjUXNK6CHR/r30G8Tw/fFR55kdGyX1GGU2W97K8hQVQOsShSQXILJdVmdEq7eaH0D67rOL5IFaqyDpyxvsjb4ILzM1trgteDt2nlysitO1rRONHObHIMaX2aRcy6bQzZDu7kVrzbb+NcmA1l8e4Bnw2NvHy4LiZyP3OlkvAb2REKkdZlCbgjUXHRfDL+HOfI2O+bsQweq7dA1P2galfUID/p4ONUS0G4IMSVo6tB7YpdL7BY8+LCI1muAS4OB11N6ZJG0RQ/Ax3yJbl8PIZfAa8e3HHKAeBd74D97Tnfsuiz1eW+YjQJG+GOkl7HKLmZKikErWGCWATDIzyKcDaYBK6Iwe9hCOlzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmZuWnRGQ3ZvZ0JXYUdxQVZoTzRtb3hPaWh6WUZoaW1qeUhXWC9hSFQ5ejhT?=
 =?utf-8?B?VDB2VDlkMEpVU09qb2tRQklYT01MM3kwczRmaE1mbDJQbERzayt0bXMyVXAr?=
 =?utf-8?B?OVJkUzNja0VQQXh2WEZBU2lHTHpqbVUwL2x0UU92TkFOMHU3cFdrNkkzSUpO?=
 =?utf-8?B?MjU3UzNqdzE1ckdRM0ZqZ2lWbHpUdEZZU3huWDg4dzErV1h4bnM5LzFzdXNP?=
 =?utf-8?B?SVoyUStqREhwWi9SSXYzTHZ1c0ttMlE0eXhVTWptTE5pS25KYmxkRlJ2emIx?=
 =?utf-8?B?NGp1UFBWZ3YwNjg3MHBWWUE4cW1rME1QcFhheWFpYjR3clZBVkxUa3pjZklo?=
 =?utf-8?B?V0EyNzI2VXhqUjFwVEljYXdHVWMvRUd4bzB6YitzQnRzSTRsUXFlQjk1UWpJ?=
 =?utf-8?B?WkFZOE03NVdqdFlCN01oNmI3YS94a2NhbTArRHFkSnBJWXRUdzhKRGl6UzRQ?=
 =?utf-8?B?bCtwSnpWMUZYZDZvc2xySk9xaFdwOUxqL0FtbjYvYzFWdzA5d3pZVXVXUEVu?=
 =?utf-8?B?b0VncVpscy9iN3NOeVJGUUJHSUpvMEdYVFgrS0lFcXZqbnNSRWJtM1ZtbG1U?=
 =?utf-8?B?OXFQcHZIY1NrQkFPZnNnK1U2ajhicVJyNndMd1AybW5tWXZPeDhDZlRHVXFw?=
 =?utf-8?B?NGgrZDNPK1ExK1Z4b1ZEcW4zbUlWUUk0cVdVNXkxL1ZjbGNjOVMxMHBydGxP?=
 =?utf-8?B?cG9DaXlYcmxkTytsMDJnT3RIb3hpdkMrWUluV2lQR0hFZ0lHVTBjZ1RDUDZF?=
 =?utf-8?B?Sm5wSERDbXVkVEdOdDd2TE9KakxSRFBxQlMrRlJqQThDWVkzaXVQVmhmdEZm?=
 =?utf-8?B?Wkt3bWR3OE83dGxjZjZHd1VOUVdIbWgxUnR3TXpYdE82eS9kWWpYUDZPMGdT?=
 =?utf-8?B?NkJNRExLWUdMODlsaDlYRVdhSzFtYXF2ajhtSGplam0yTWliSStEaUpScTdj?=
 =?utf-8?B?NFhnYVRLT3VRdmZ5TXBnbW92c295TmV5SncyaFJHMWVpcGxmTlZadHg2Vks1?=
 =?utf-8?B?V0M1Z1FXR1hQc2RKck55bzkxY1JjdURsTUVyNnBVWnBOSkdOVXRUTGZvcnRN?=
 =?utf-8?B?c1ZpWEJMZGxPK01ETENTNzBoK2JFYnRjS0lDeWhieGJ3N3Zuayt0TTIvbVNT?=
 =?utf-8?B?QjBEZDJJTG9HYWpMWWpjMnpqWDBKdElnR1hlbThrUEh4SlFrOVoweHFScFRp?=
 =?utf-8?B?N2Y1RjhvU0g4VTlzTjhLSHFVcTJvVk1KMUtUZlVEMkc0dTJrYnhMM2phNVN5?=
 =?utf-8?B?WFNEL2JLRVJUNGVmT2hYQ1JhMzJidVl2S2ZtZTJRYjVlN0VRa1FLa292Skhp?=
 =?utf-8?B?cHpqTGw3SnY0WnZkcnNUbUpKdllFY3RuV1U2QWNxenhiYWpkNjNDcWx0dnlD?=
 =?utf-8?B?bkxldERLZm5mSW1jMFcvdm91SFVzQVM4Q09KVzNGMnlmYktrZFUybmtac0ZM?=
 =?utf-8?B?TXdaWEFSUU1BNElVMHJUNmtLTEk4c3BhUnZTYVF4VnpObzB0cHdsZXBEWDMv?=
 =?utf-8?B?eFdHNHZ6U2VldnNJS2Nvcm0xT3hHNS9BMmVsVGxxRDNMU2xORjRhVEdVK0l0?=
 =?utf-8?B?c3JvR0hYeXAxdEhPTUhiLzNNbmZHcVJwMzUxazM5bGYrSXF4Ui8yZVIyaHZU?=
 =?utf-8?B?MWlBZXQzdjBhRkRvTVhVNWFLWWtzc2hXWmpseUNqUFBMQTZMbDc4SStja0pZ?=
 =?utf-8?B?Ums0b3MvUDkyQXZpTUtIUUkrRzNrUXVKUkJEREtMYWVjQS9SSlNwdFBTL25J?=
 =?utf-8?B?U0NEUVBNQTdRSENpZ3BxK0RYNmMrT1FZbTNNak5TblFkMVQxa2FWSnl2RzZn?=
 =?utf-8?B?RXRoSStwQVoxaEFRdjlRQitLYU9JeU1qQlh1YTBNSndBZEtvUDd6M2paZDR4?=
 =?utf-8?B?YmZ3ZkwxMTJxL0o2NXh3cGR6WG10bHMzM1hLS2FLUGlzL0Ryb3htbGlZcFdB?=
 =?utf-8?B?aWh1bG11a3J1dmRYS0VUQmJnY2FTZmcrSE5FWHJKaExpZXB5bEZLNTNzSWxq?=
 =?utf-8?B?MHpuZUtZNS9IRldyOGJjdmRUNW9aMS9BTlNSQk5JVHh1Q2pNbzkvc3puY3Mx?=
 =?utf-8?B?NnREU2ZXMC9Td3ZiODFyYldUb3VoUnRLNTdFMi84dUc4RDhoZVlNOWc2REFs?=
 =?utf-8?B?WU5aUHk0Z29WbWJ0QUg2ZkU0elVKL2tNNkpsOHR1NXFPTHNuQXpSby8waXAw?=
 =?utf-8?B?T0Q1ajdlQWxRcXlRZDNvSTMzeHd2ZnhOUmVQZDF0aE9mTGV0eVZrWkV5dk15?=
 =?utf-8?B?T3dBQk45OE9NRkhvZUxQVnc0S1p6alVHdVZOMVdmZ3pVZHVuWXhnU2JORCsw?=
 =?utf-8?B?b1VuKzZwV2YwZnBSZzBzK1FLdzZqTVhINzVqZGp0aWd5eElpVWt6UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4065a55a-1c13-4de4-c334-08de8c087f18
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:55:25.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QL9j5cEs4ViaHU19XCp9NOP+G2g15Zkn3mv47XNM4i0sCf6NmZcq9JbeXqycDJ1bvht5ui5Jzw9SLpJV3mS0ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5370
X-purgate-ID: tlsNG-4011c0/1774619728-BDE8D900-87EB11E9/0/0
X-purgate-type: clean
X-purgate-size: 1803
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
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
X-Rspamd-Queue-Id: E50DB345A71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Read the existing PCI command register and only add the required bits to
it, as to avoid clearing bits that might be possibly set by the firmware
already, which might put the device into a non-working state.

Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjusted over previous fixes.
---
 xen/drivers/char/ns16550.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index d05dc506ed9c..d16e447c0e76 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -283,14 +283,19 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 static void pci_serial_early_init(struct ns16550 *uart)
 {
 #ifdef NS16550_PCI
+    uint16_t cmd;
+
     if ( !uart->ps_bdf_enable )
         return;
 
+    cmd = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
+                                  uart->ps_bdf[2]), PCI_COMMAND);
+
     if ( uart->io_base >= 0x10000 )
     {
         pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                   uart->ps_bdf[2]),
-                         PCI_COMMAND, PCI_COMMAND_MEMORY);
+                         PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
         return;
     }
 
@@ -307,7 +312,7 @@ static void pci_serial_early_init(struct ns16550 *uart)
                      uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
     pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                               uart->ps_bdf[2]),
-                     PCI_COMMAND, PCI_COMMAND_IO);
+                     PCI_COMMAND, cmd | PCI_COMMAND_IO);
 #endif
 }
 
-- 
2.51.0


