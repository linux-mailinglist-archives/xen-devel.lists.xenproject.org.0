Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO5yIPfv+mlGUgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:38:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EFB4D7536
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301223.1575528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWpn-0005ld-9d; Wed, 06 May 2026 07:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301223.1575528; Wed, 06 May 2026 07:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWpn-0005k6-6S; Wed, 06 May 2026 07:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1301223;
 Wed, 06 May 2026 07:38:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKWpl-0005jU-MH
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:38:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKWpk-008hD3-VR
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:38:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faefe0-e002-0a2a0a5209dd-0a2a450bb674-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:38:16 +0200
Received: from [40.93.195.24]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faefe7-212f-0a2a450b0019-285dc318861d-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:38:16 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5397.namprd03.prod.outlook.com (2603:10b6:5:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 07:38:13 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 07:38:13 +0000
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
 b=WYTqF1l4alcMATFZ2XVqBtJDL9iYDuAP2/OoFma0KtvRQ8vPccmQjeweI6EIS6xLqt+WfJCaBPbQlFPK85Fzf7WqHB4vpcEFsFG6ObHQ+5lhvMjZy0FT6d3lASdU9GjJhcvouMvxyFEib8o4PV811heBB9qrqZ4AWqAjNjgAtEoIvIfl9+d3sihwUVOj6f3Cx0nivYdpcwQI6y8H+DiFsXZqsgH7ZwKnC7IOjExp17dkaBgVlZhMeBJP4YQPMnmrbvEE9c6AGIfVsbS4lJcLaLwU8Z3HykXeZB+qTsSixfLoB9irqkYRU/ei0J7RspEo6nm1amV6pd0GIkXpkxVvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOqAXfM7Rlhy7EjMS2OGtDITdoCH4UGlxIzZkMc1Lfg=;
 b=NCVAyAGba/zu/SsFiW5xtxn6IGjnBBz2bIZ/I9/jlQ45HVU5iSRrzzeUHL7J9+nTvBP2Nz+y33ARSLgVNZaPmK6Byk9a2W3ql/D+qXyCiKsCJ3RGfgJZ+mOAeloPHigjvFULz5KOVAZkqKUlVhTDklBX8NTEVRyYFDENUEvlw/kP2LxVBdhkC8qFYzf0GMlLCPgqVxEjTcRRq5y4GLbuliUQIfQbaiAk3VqpXSX2MSMNo9zW6ktWq8GachtPCPk/fhqhRWcd61bJ5wkkIGuerjkY/fbDLdUZsPFS8CoqC4YTUp6mmZoRd2j1zaIw9s1LkqUNHbGl/iZfnut7z3whXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOqAXfM7Rlhy7EjMS2OGtDITdoCH4UGlxIzZkMc1Lfg=;
 b=Xl7w26QzyeIMXs9DoJH1eDpCF6QLbQH6Fw+3CvxOmG4hsECShroLleJlxE+Sja8nig9i6yrU6BgtBx0kZ+574xbj3DHvIcebIid9F5Tfkdnu9QPAitXPIObC5FicLoBq+4glftGcCH+bakc+NfPSycIKEbpRD4qoTYLKEg9yedg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
Date: Wed,  6 May 2026 09:37:19 +0200
Message-ID: <20260506073719.40075-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506073719.40075-1-roger.pau@citrix.com>
References: <20260506073719.40075-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 69905622-d2ca-495e-dbcf-08deab426e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9FZ2K3lkjWnLCOUXHd/XZfy1Wc/G+YDP6DQ/o0M79JR3Als0YGs6vDdVz3gz2/F4BICUUah5e2ySc0d4CGC3XrobsBfup9liHa6MBJ32o1wgvFNRd+5IPrpDC/RJzadH2ZViAay+mtCpLnjNrDgYEVmXgXNQPBMQviXxgxcnrwGdkm6Eja3Vmip6dbUWjfkfOS3g+A/PjJuPlqVcyjIFZmisACrhrs9pRMnIjMuocpHopTStHUmLM5OZnKhj1r85s0yxZia/FK86qQvyePYvMKXQ3vKzixcNyTk4NGL7Vq+IDV05vfjzpyIzZbvXULq9q3gfpP897MG3VPgJcm/bPZAhDhq5LbC58VAUgJIDZOv32vrNlXkbRpKQu1LnxbcNY9tC74ChJBtYoP8zerK/pH0ai7SChxOjV0QZ0I5hPNpa9mwYdCSrMCi0yT7LXT5w/MJzow4eoZ1aa1xH2inKlewMun7rGGhVngaCbUGjqo9Ra1AA94xjoJXAZE7V5r18UQc6vR3OjSoFkaeE9PbTwyumWHIxCdzcwGdnYsiC/xAyD+jpG/my1IutqsO2pwF0K9IKi97kAnNpXC8fmV1zy1YnfarpqS1KemHWefEHgnqcw5cjSVngHdyUTTrHHi0eMuo7HTHgntPyXtn/sa8AStdviAP6Rz2tgBIe+9WDKt1gUESaB0oiDngHZtFShJD8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFBWTW1EWlJ6enF5d0R3ZnhmeG9KbUhLZ0RqMWtGbVAvSm10bEsxQ3ZDVWxs?=
 =?utf-8?B?VGtQRnJ2czNsRlkzdVMzY3VmSm5reDFWTTZaK0Y1TUI3UHhrNzFyVlk2TklT?=
 =?utf-8?B?VDV6VkJFRXhYOHkveVVDOHZWdDd2WWpWU29FbC9VdTdnWWFobU96NFBlejlI?=
 =?utf-8?B?cnFsb2tTYUIxM1BueVFTYjFtYjlGOTV1bzJFQWxzWmFrQ3ZwMFJsczZWYXow?=
 =?utf-8?B?Wk1kRkI3enFRNDdKS1hyK1pRM01ZREd4QXhJOHY0dWNmSkdYQXRSSlVXZkdz?=
 =?utf-8?B?dlNML1gyWXdvaXdzMzdoa1RPMjl4MUxNVVE5UjJLY2ZUOExDYjM1YnlnemdT?=
 =?utf-8?B?bWhQVDJWazd0dUpLM3hxRWh5MmhCcDd2bjYzQzFxSzBDSjJpM214Z2UvbVor?=
 =?utf-8?B?RTVnM0kvS0Uzei9SZ1Qzd2ZzSnJnQmtGOE5KOHhsUms1NTFUZVB5MEw2OUVC?=
 =?utf-8?B?OEhDZU4yNjlGN045aEEzMHYzWWdEbFdaYTdNd1M0UExIaVBiZHZVZW44V00x?=
 =?utf-8?B?Sk5jZlByTXJSMEllSm1IbCtvckFPdnFxbXlqVys4Vzk2dklXUkpLQTlzc1Bi?=
 =?utf-8?B?d2dFWEdKUnZJc0dXb3JqcmJjSk5xdU5xaXdNUTFVWS9sSmE2ZU9lUU41RVRD?=
 =?utf-8?B?RmhRMS9aK1BsNHNGVHpoYWxLSmJzME1ua1ZiUzZRUDVBMXF3ZTFab2xWQmlx?=
 =?utf-8?B?d0NmM3hXb3M5V1dXek5BY2RISTdDd3pxVE1IYktYNGZKempIbXowM3pGNEI5?=
 =?utf-8?B?YnBhc0FCcVBpMktrUDdhS2RuVmxHbWltSFhzZ29rWDRHN0JTeC9ZeFFITmtD?=
 =?utf-8?B?MDZma2dqM0doM094ekFjOEE1WDJtdHpETm1sdU1ZMDI5R21Wa2VNTlNTVGR5?=
 =?utf-8?B?Y2xaUVhPRm9XelI1ZTJvdERyektxbWF6SFQ0TjcrRkFqVWtUamFrYUZOZGVa?=
 =?utf-8?B?dGZqVjI1emZiejkveVZnR1dhWEZjMklHZWhLNWdrcS9SbEhlcnRhSWx0SCtT?=
 =?utf-8?B?b3dhQTQ0RHdsQ0FoZGNNOFhScTdkWVZ6MlBnUnZzY3dTMXVkaVJNeDlEYW83?=
 =?utf-8?B?eGU4Rlp2RER5aDJQcEF3dmxkVUNwSit6SjZvVjhKaXVYcmZ6ekpnL1grM2Y4?=
 =?utf-8?B?aE0xWUxVcER0czBLNy8wRTFxcEFhcVR6UFByWW02OTVnUXBuS0ZYbUovakor?=
 =?utf-8?B?LzZtdm0ybG03ZzcrWHRhZG5aQnViOWVVOVJESUZOS2FDMHgvb2w2SU13REt2?=
 =?utf-8?B?NnBxS3dpQ0pTNi9jVmdFbll4UUhrQ0Vab3BraGZqbVcxYnZ1S01jOE5sYUFq?=
 =?utf-8?B?VGJOeS9tSUMyYWRaamRBMEhzbW1iVVh6b1dXNkhZOWx2UTFZMnFTa01BVVNI?=
 =?utf-8?B?TlF5ODdMOUNncXBWb2hwRnZ4L2dKTE1WS3lpWnVYMFMzc0tFQTZneDZrZUJK?=
 =?utf-8?B?YUNQNEVjZzdvaTdBV2wzd0pJMGdlbnNubzdCT2E0bWNhK3dMZmJqcVdQVVBm?=
 =?utf-8?B?OWE2U1NLRWRnUXVRQkljNEpZRUlzV2RzZ3VKNjFvL3VrTG00RVUyQzdTWlp4?=
 =?utf-8?B?a1BWNC9xYTJoSVJtanJiSU1ZOEluV3FvcWJhOFhxcXZ3REdmSUc3eWI0VGZG?=
 =?utf-8?B?b2JGbTNjYWMwQ0F2V0NwUkdEc1h5Y0JrbW5kTG9HMzAxNW82UW5pbUtuOHZM?=
 =?utf-8?B?c3YxNUx6dWVwSFVUMFlBZE1UTGZjNUhBU0duZTZHbjB3cTlnUlVhclArUXZF?=
 =?utf-8?B?a2R3ajRkaHU5SnlIWFJ4MnpRbWFxekpvOVRRZGQ2aGlJY3dPYWpUSEtveDBr?=
 =?utf-8?B?R3NkK21JUGtGam5SbE43N0N3NTV2cHIrWFc3RnY1cWs0a2VSdE84RG4xWk5z?=
 =?utf-8?B?S0t1TkxFUnlYK05EdWNyRkduR0dReCtjTlZLQ29DcitjQS9JSmIra1JUTVVt?=
 =?utf-8?B?cFAwcFViRk5DZlphejhTL2FtR05zMWlTSDhCRHBtZ2xNRGl0MkpndnY5V3dR?=
 =?utf-8?B?R1ZvVHkrTjNZNWVxdlpzTkpSTzBqRndjQUsrbVRBS1VjTWF4Y3dLNVlRU2dZ?=
 =?utf-8?B?RlFlMTJGRytPaktoRmREY3hhMis4ZE50bWFOL1RyZ3pmUHNwNU9nNld3eUNv?=
 =?utf-8?B?c3Vhdnoxc2h4d3E4WXBqTEEwb3JVV3hqei9pb3JSVkd2QkcySzZWNVlRYW9n?=
 =?utf-8?B?L2pIMVRIUEEzME1GMEVPQU9jNWZBL25KMUg1REtDR0hzc29ORnRPMnlFS3Jp?=
 =?utf-8?B?SjV4bDcya0Y5REZXV0M5Q3hkRllnZDkxdHRmcjZ3Q3MydzV1SGhhNzloeHo1?=
 =?utf-8?B?UVZNYXhDWE1PVGh4QWtsS3B5OFpYSjNKUW45RjRSV1BodEJtMU1wdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69905622-d2ca-495e-dbcf-08deab426e01
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:38:13.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGsFo1vduHKW89EzdUZEPKgjUUs1HT+eVL3ypb+TaMVj6C7PvZgswkOrbq1iqMdWPL/idvZIeY/B/FCLzYYnOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5397
X-purgate-ID: tlsNG-42698a/1778053096-7E573F3B-912873B5/0/0
X-purgate-type: clean
X-purgate-size: 2541
X-Rspamd-Queue-Id: E3EFB4D7536
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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

Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
say the least.  We don't know what registers might be there, neither what
values might be safe for those registers.  On a forthcoming platform doing
the zeroing of the MMIO region can put the IOMMU in a broken state, which
is not recovered by the IOMMU initialization procedure in Xen.

Instead attempt to forcefully disable the IOMMU ahead of enabling it.  Fold
map_iommu_mmio_region() into it's only caller, as the function body is just
an ioremap() call after the removal of the memset().

Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 76ae78e5ea53..8bf5ca4de18f 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
     return iommu->ht_flags & mask;
 }
 
-static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
-{
-    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
-                               IOMMU_MMIO_REGION_LENGTH);
-    if ( !iommu->mmio_base )
-        return -ENOMEM;
-
-    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
-
-    return 0;
-}
-
 static void __init unmap_iommu_mmio_region(struct amd_iommu *iommu)
 {
     if ( iommu->mmio_base )
@@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
 {
     int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
 
-    if ( !rc )
-        rc = map_iommu_mmio_region(iommu);
     if ( rc )
         return rc;
 
+    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
+                               IOMMU_MMIO_REGION_LENGTH);
+    if ( !iommu->mmio_base )
+        return -ENOMEM;
+
     get_iommu_features(iommu);
 
     /*
@@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
     if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
         return -ERANGE;
 
+    /* Read current control register and forcefully disable the IOMMU. */
+    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+    disable_iommu(iommu, true);
+    iommu->ctrl.raw = 0;
+
     return 0;
 }
 
-- 
2.53.0


