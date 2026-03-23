Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNimOshHwWlGSAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 15:01:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03C2F3A6C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 15:01:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259354.1552659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fpq-0006zo-Qy; Mon, 23 Mar 2026 14:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259354.1552659; Mon, 23 Mar 2026 14:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fpq-0006xh-OH; Mon, 23 Mar 2026 14:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1259354;
 Mon, 23 Mar 2026 14:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1w4fpp-0006xb-HN
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 14:00:49 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013028.outbound.protection.outlook.com
 [40.107.201.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afccfcb8-26c0-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 15:00:47 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5638.namprd03.prod.outlook.com (2603:10b6:5:2c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 14:00:20 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 14:00:22 +0000
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
X-Inumbo-ID: afccfcb8-26c0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwdqlW9UQLhSAfE3EwJAx8N3XDZBbwV0PMlyw6EndmUa1q4dd8+VDHIOD/pSgMHCGvVLeTWm3DTh5S3zYUPBu9cfe+3VjRF2GOVlwVT0K7nSQxCj2/zNWSC44HXfYFgQDxNiyYTzR1DpvQFqZW93ZsjWn1Lz+eevmroLEuc1J98ed9VQF02Yg4s2guaYoA2NyozeSGyDpN/J9bY+jiTGmnJBL/Ssi0kuikQWLXHf/PJx65bLDGMN3BCzVNG/xwjTXcU/dYcVZWDLwinQfk8Qnft0K1EbVxKZGRAjj2s2IUNSw47gDArqXB7MGu6EohQyFpTeaSZVtWQJ7c2oKjzkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Xsg3v6/ycOHJMQ0ON1oGuyXgWGjMeOrnkK2jNfCMMw=;
 b=LGINt6SxXCW7080Y772XZmu1eSnuK7oX7KeNtkfXDD/WF3cJRJi6GKZiXIp9h5zZh+FQoBizjFETxJAGJBeWCCbMFNN3mAYngLoGBlT1bbEbNemuZ1FDh6kVvcmp2qVVqa/D3Hq2RW1+ocQXHNNdSLVde20Wty5feOVE5vKwQX4k6K2Bw1MESBttT1a82452PyGk6lDlQj3Tba0dQqT5oweBI1PDoDG7FipgakEiAZqWBMD1HeWuSyP8GagN9WujcYRWDKrqHozce3dBZSxOuGqtYi7zIKPHCk4f8F4DlO+nWLPkxeZC6hKUK+xMnqmX1C4Q3V4lEipwBRyiQlJqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Xsg3v6/ycOHJMQ0ON1oGuyXgWGjMeOrnkK2jNfCMMw=;
 b=hgCKyVvpZpoOzSUmxGChx2GKqoptZV/7iRsU+8W0vKxTG3V+0ocaxZ4Z7KbeaoMrQRw5yY2kGDEljmqk7T7qVoN5S07aFDI/jmbvUdw+b9s+nYrj7r6WAoG+iDTfUM/cux1nAN4lzBBU89nHGC4dPN7fUPnKrlUH1t9ZAjeKdOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Mar 2026 15:00:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3] x86/S3: restore MCE (APs) init
Message-ID: <acFHhTFPdX7D_4Px@macbook.local>
References: <95b7ffb6-a088-49bb-bc14-894993de4f77@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95b7ffb6-a088-49bb-bc14-894993de4f77@suse.com>
X-ClientProxiedBy: MN2PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:208:239::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba23e16-9598-4e43-8980-08de88e4865a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k9gKWXaFFVv9fLS+ZbFYf27AAna8bL6TQtgwtdrp0TODVFa6nuUVgjPZlK4AL3I52Qvr+x/h3OKiUtXi7+PCaQXwuiAQ0BuX8ygP0UFyWG+vQ+sVeFM2vRLaiCKnevF5lCcnu1Fkjbbi6+mV1VnskQF6nv5uA1tw+WBzTRnnGo97VSRenIqx0oaVWIo6n7433STqKDaiBYlO0qP+MwDns2qG+Z+eBggFc3dWgpTvjSgvfNCK7C84wvoIKMhUG3IGExunzVWUTI37LUEMT3aHrKPq0qSz5mjIGBAIl00zvxF7EDbeXfmtBIyiu+peSgP++kHPCtgKzA27lNse3LACg4AbFMlcN9YnCadcHVgSWgLF4NOOoObAIMOGLLgmTVqXolrpOzqdJby4NMkL5vbFJI2cgS2jkQ5SmuDdvcX3VLLD8MB4IVxFJdBV8QYGt1Cx5i4G7/jL7aSzNB9FLBZFNovrd+tuB9W57jwtpXGeVPaHBXM/9S1nGfR/Hhudq2qHaXso/b7A9E42EAN/ijKwBFy6Rvy+2fbfzBFAlWM1xl0s8dlxi3IFrktEvr1XuYQa0w5s9PA54sJIxvrGQXf4fz3uS6hyT/88g+0v1SvpCYZPi4zIb19W0gQlv7uIECxgeboy7FpLCMtSGiPnvNDds8PcYdtEw/yzUB5EMbbDPT2z9M0Xz++N/hqs17RERzRwFVuDdjyT5fCnMKXbH54gLnq3p0POwoSodxuwzL8ypTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eittNmJXRE1oOFJJMEMrSmxrY1RKbSsxaGpCbXBlL2ZwN2xYVnBuUlp0cVFT?=
 =?utf-8?B?KzQ2aEw2QlB5bDFsT2xMdnRJMk5oN24zSXc1d2kvZmVjbzlUS2d4N0g0aE9I?=
 =?utf-8?B?R1FtcWxzaFFhVVBPNFFpUXdvTk1vVHlNaEZuZ1FST0dNb1dkOWVTRGVxMDNl?=
 =?utf-8?B?aHI5WDVmTXAvU213VGlhVnIyNDAvRU9NcHZpN0pzRGp4aXFpSkJva3F3WE1O?=
 =?utf-8?B?cWNGcE5vWTR5TmQ1UEwxQmhMcFNFZkFpaEhTL2JyYmRYUzFId01WTG5sL3ZT?=
 =?utf-8?B?bDA5bStwZE9na01CaHU3MDVVazVSWDl0MVBzODFWQ0V6cHUwZ3FBYUgwanlk?=
 =?utf-8?B?VjUwTkJFMFVMeGVGdFRoV2tWblBUMFpkNlB4VkNMMDBWVkQzTVRsbFZEcGRu?=
 =?utf-8?B?aTVZTk9qVGVWWW1SSHlHK1dSMiswNTNJcHh2Z1JWMWtwajFSQW1IRStnQlhJ?=
 =?utf-8?B?MGJlL0gwMGJrbzA4TFJ1K0NJS29xS3J5a0c2dXBrRmtNQitLc28rdXR2R1Ft?=
 =?utf-8?B?S0F1aXJJZzBvSnRsUFd5TTJRWm1Va2lGUHJmckVBTlduUDBkazB1djIzSzli?=
 =?utf-8?B?L21aeEgrUEgzMGhCVG5JbnlWY1pLUXlKNlg4d3YwZjBQa2FiQmQxNytqSEZm?=
 =?utf-8?B?ZWoyenNuRUNISkE3bWZFODRNQ0ZZWEdoSHdySUlBUjBaaDJUNkNVSWtEb3BD?=
 =?utf-8?B?c0VWRjBEaHZLWndZRzAxd1YrN1U1Wm9HQzc5eFNhTDYzSDV1WWtUeTRWUnBD?=
 =?utf-8?B?MWZtcnlSK1Z1T3RjWjY1enVmZktVb25GUFlwZXlQay9UalVLcy9BaTliek9y?=
 =?utf-8?B?ZEJkUE1NS1VDZmtwcnN6M0k3T3RMc1ZXbmQwcWl5WDJReHR4UU50bHpBeEl5?=
 =?utf-8?B?KzczbTBoLzg0Zk43bkpuNzB4VTF2RXU2UU11ZmJzQXlGcnpVQWEvOFBIT09u?=
 =?utf-8?B?WE9DL2FBS0U0VDdienc3dlVwMXlibnIzWmtnUFl5T013TVdTaDdGVGFsMnYr?=
 =?utf-8?B?UzdEeU1GbGgwWWE0bHpVVVQrRnJHYXlscUlQaE5UYlNCaWJlSDJPVytRcDRr?=
 =?utf-8?B?Wmx0T1NiY25tZUI3Yk9kU0d5TktHbm1xQUtyNzI2aGxIcEdEYnZuSUJTdmFa?=
 =?utf-8?B?amdrV3hXOFkxbUFHYXRXcHVKeEZvajVMa2I3NjN3WUsxb3ZONFVGZDVPZ3ow?=
 =?utf-8?B?WVZWRWFXUFU2ZXUrendnYXJPZmVLcy8yMFhLWXAzVS9CdEdyMmVZYjZFQ2NP?=
 =?utf-8?B?ZFptdlNsNU04ZXA0b3U0SXR3V3l2emU4dEwwdFB4UnNIK3F2TG1LVGNhVEhq?=
 =?utf-8?B?QkYrcjQwZWFKM1B2Q2ZGYldYRW9lbC9xTHlSR0VpUFFWdUtlaVF5Q0dBRGQ2?=
 =?utf-8?B?RVg0UEFwNXYvb2twaERMRzVqdXhzTXVnQ2wwN3puRk5ETWdFSXFhdDc1dk90?=
 =?utf-8?B?bzByb0x4YnRkdUdsK0tsQkM4U0JhL2YxbG1UaFdLb1pvNG1KWmNIOXVmR1Y5?=
 =?utf-8?B?OHp4RVZqYlFNWHByNUJLK0N3RWRSdEdUMTVjM2tWRGpBVVNZWHVlNmpGMWYr?=
 =?utf-8?B?T1k2TFBQc1BXNnVZYlpid2dFMkR5RklDcmhXM2pwenlGTkRsTkdrVVdGNEhs?=
 =?utf-8?B?Vmh3YjZxemhUOHYwOFVVWEFXdHlWdUU5Z1FPOUI1dkZUYjFPTUpnbXVxbHND?=
 =?utf-8?B?Nk94ZmM5VzBKVXBQN3JqcXVlWnVTTzQrNzVPVWNUaGt1dzcyWnAyci9mYmhH?=
 =?utf-8?B?NTFxN0M3MnA0QWYxdWYxOXNLTis1UTVFVTVaUUxPbUNmUUhjWWNqT1JsZXYy?=
 =?utf-8?B?eHY2NSt3YzNHNEpVc3grMWxsaXY1Qkt3QllUNGxMeHQ2WklqQVIrbGIzdEtJ?=
 =?utf-8?B?a09FN1hDV1NldlZlVGpudmdYY29SQnIzRnV1OXhPbXBoYm5OM3RHMVpFS1Vl?=
 =?utf-8?B?ejc2cW9pUGxTek1TRFNsbjhtZ1djODJVZ2FFQlU3MFlvdUwwTU9ETFZpREFH?=
 =?utf-8?B?ckNoOEtBNVl1emRuYVRIUjNTL2lUTE9IYUg4NG1IK3puNmxuOGlaSzk5ZkZR?=
 =?utf-8?B?Z0JSRGpjTytEbm1CUTBHa1lLSDlmalNqRGN3aHpnT0c0bkc1aTl5VTdlSkh1?=
 =?utf-8?B?RG5IN3B2UDBLTy9ybTRMSnpiQXRvSldnRlNBdVR6L3hsWnQvaUpUQ05PcHBF?=
 =?utf-8?B?RVMrUm5UTWhEdkpqbk9Xa0Z0Z3FnUDlIMDRCb1N4OHFXaGk4eFc5SEFScjRa?=
 =?utf-8?B?Njc5SzJTWFdpVnFndkozRkpsL1VsV2JjdndDbXhNWWRtdTlpeTdBR0tVWVFG?=
 =?utf-8?B?MU05bzJrYmRpTGNiQkZtZDhpZGo0MnNHREQ0VkJ1RDZielZUdU9yZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba23e16-9598-4e43-8980-08de88e4865a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:00:22.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMnHlDTqCRBBjPgxn4jNBxj8hWNBSgqx3HOjNCUsNT0rlrAqtEw7HVYfzHt5FG9T/pXvd2LviAT9HiRBAwgaPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5638
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid]
X-Rspamd-Queue-Id: 5F03C2F3A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:48:50PM +0100, Jan Beulich wrote:
> MCE init for APs was broken when CPU feature re-checking was added. At the
> same time make sure we don't bypass setup_doitm() (and whatever else may
> be added to the bottom of identify_cpu()).
> 
> Fixes: bb502a8ca592 ("x86: check feature flags after resume")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

