Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJsjBwxQ52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:23:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77343971A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288790.1569034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8Fn-0005z3-6M; Tue, 21 Apr 2026 10:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288790.1569034; Tue, 21 Apr 2026 10:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8Fn-0005xI-2F; Tue, 21 Apr 2026 10:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1288790;
 Tue, 21 Apr 2026 10:22:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wF8Fm-0005xC-1u
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:22:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8Fl-00E7n3-Ei
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:22:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e74fe7-5cb7-0a2a0a5109dd-0a2a450be6ee-44
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:22:49 +0200
Received: from [52.101.62.53]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e74ff7-212f-0a2a450b0019-34653e352fd1-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:22:48 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH8PR03MB989185.namprd03.prod.outlook.com (2603:10b6:510:3b2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:22:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 10:22:45 +0000
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
 b=zKc2cJcwiEzvCjBbcIB4XEIeKMHZw0XNrAPHwb6SAlwvRWo1N5FvFcUedppxF//kulmbVDy0WEuy3vqIxxzrqkZ53cAVDEiaj/bCLNZJ4KT7V/Noq9MC7uRGydI/ry2GXm5iDxRQS4YUew8UXwCh6C9BvPJXS+Zy/Y8YS5jTFlAcNn0bkd9ueKnn1AbFmc9GSRwJJkjMLrZQcUGHJFUOHmRb/BT8BytQePl/cY3xhqVA1LPwpB344CS0dC4H8Fv0EYcpjf+yt+FFwFAGTpqU+eVDQWAGzCdfPYP29k/nAq4N8YqueA94YbphwaoHpH6A/6NYNpLGS0oyI4U6raB74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6QJr1WLo1JqSz348tl6tU8vhCnaDTrwQ4Itub6EcsY=;
 b=wk6/7mdsety65IcVas6ZKm+VhfAqPX2AiJiaBblQuMBe9vkXj8hkrbFFKMOPqs7W1ByU/XkTuFDXyk8Jq/RTRjneVNKqCzgwTYAla8sbAQ7757lIuWslbsw494qW3PKISI/19s5XgsnjeDNFefRu5YF6at3FsOMULHkq2R48GWHXpiJnU9n0nL9bCHATFklTKZ9bHkMcxrN1s6HET2GJ1r35v450IDn+f4a0Wk+3yyah3mdzzCp0f8BtGRgL8jU8HEn4VN5QCaf3VHbk2NLZUdw3UytaM3Wdq40hfTKry0oD5HA+2aXFFELpbqzC+HBporTsrk8zUFCXbHzTGn2c7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6QJr1WLo1JqSz348tl6tU8vhCnaDTrwQ4Itub6EcsY=;
 b=hgN7OOWG8ymPFLoAEmw76w4lCRlH4KjvvBkop9D37ubkkIRNHKWrSQfDOvHzpBaPP12ShFhXgs4QcqHGJa+cbiUKyci0RG9WLagXQT9vAMPOUqomkfQGiSciM6jn1Vkce0kBpR+tnNvKFh3LYYgFt7ExQy7kZvwEcDIjybLX41o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e7257423-bc5e-4a71-9c23-d9b939464b67@citrix.com>
Date: Tue, 21 Apr 2026 11:22:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH Xen 4.20] x86/apic: Fix asm() constraints in TMICT
 calculation
To: Jan Beulich <jbeulich@suse.com>
References: <20260420174605.706329-1-andrew.cooper3@citrix.com>
 <85fa4bf2-e288-4376-aa74-c3aef511c2b6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <85fa4bf2-e288-4376-aa74-c3aef511c2b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0109.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH8PR03MB989185:EE_
X-MS-Office365-Filtering-Correlation-Id: cad178ae-37a9-42a4-de31-08de9f8fee12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D6G+LFl3amrPP+Q0+P0JMl438mlL/3Y3xtWPaEHagSmOX+DsyjemUr/KF9y8UT4K3fxmEc1TrEBGXOwUtx5uqCxCXeLrjeqCklMJaBfZBoYi8r88r5x3lhEFe7C9UKlUUQoaPKk4amczEWqVjs3hgjWYet1n69H63A/94K7/J8t2fREdMyJNPpWSjQl67KaYyXGNPqLftgIAo+7q4PULX27hNaSKUrpL7tBmnoxQb5PZCsGrskTvlBAvlsKFn1mGdYfiJcAnry+9TU7+fxRjkl5Glf8bwZD50duHzqzNzH32sKU1X70k5CvnKuVYbzugmSMEbR7kn5ZVDu6VMhA5MxLmkEIVwhGQId5zTglG3fbAOwBB2Id2LfdEPs69cgmV2LJ3/F3u+yFUL2toFagQMbCqfRM/+jizAIjTexQa9lKCcM1stBVK01TpgaPkbFoI0u1t/69SkQOjRFS4rfiixcOYai8TsOfRDCbC8heWk1w6EWoluwZLZ+KFMFw1nyZ1b6V5pqJUYsNybCYtSMyS7znG4x04ELxk6lTcgPQWY6e4CwrnMUtY+BZqWgGdAAdr65UAOCXXw2SrG/e489hkeduCAO5fMOxpEXBSjU6DGd5wD7UByXY+9oM+rXnUvs+L+6QybqtsQA6PcGg0T8oQ/dPm762yiW1+z9pxZNytO07evnR5DQWr2SPxQwjtge76hpVLfKP1+Pk2hDEpePqz5sIg7VO5pE4gU7ZxDXpd7uU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk1ZaW1IdFNQa1NyTzRuRC9Udk9Zalg5eGVEU2tUT2VUalkrU1hqSGZmbDNs?=
 =?utf-8?B?S3dCMktKNlg1RlJoTjVIbDVvbEhJV2lod1VNZzVqOFFPV256eloxYXNGeC9R?=
 =?utf-8?B?bmtxamdSNmtPM3lWM3hXbTloQjBJQVM0UG9oYWx4VFVZR2dZcVBtaVVLd2ZL?=
 =?utf-8?B?YjJLRzBwb1hvWHN2WXgyVFBmNzZCT1c0d1VtWU52WXBUU0hJSEpkKzBEdkxz?=
 =?utf-8?B?LzdVbjkwbE1nZlFZU1l4VUc5Q0xiZ0lqU2wvZy96c1g1dzhSZWpVWjMrelRI?=
 =?utf-8?B?L3duTnlzMFpnYm9NcG5pYTNTeXo2T01tRk1nMzY0SCtOanA3RWJoaDVBU1Vu?=
 =?utf-8?B?NlhDeTJlcHNIc09vK0VZYTVIUHRGWVludld3QU13c29xQmpXNDJSd2lnYUoz?=
 =?utf-8?B?MGJtekxCRUlMQlRKOWJDYUt6KzJGMXIxT0dpRE1KcTNEbEtjWkl3ZkNGQjlo?=
 =?utf-8?B?M0N0Tnl0enp1bkpQZlJycmZ5dG1kTTQ4SzlLcWppbXJvSDJ0T0dlUjJJSk8y?=
 =?utf-8?B?bGZhNFIxaTEwZlFIY0xZRmxIMmdGdHptSWlMOHplR2h1dk5LSUVRZ01iSU96?=
 =?utf-8?B?eERuY3pKRmF2TVgzTWpyOVZYbGdGY2FGVWZrSHdLWisrSEhYL1VRbGRvbXZu?=
 =?utf-8?B?SmxVRWtWVVhnVW1zcDNPNWNJUit5b1h5aGlGNkEzWmM1Qm9aVVN3bWdNZ3c5?=
 =?utf-8?B?WUYvMlY0aEdQdE55eXB2dVR2SHZuRTh2K1ErQllxTjRJbVI5ZXEwT0M5ekVk?=
 =?utf-8?B?ZzY0MHFSNk1RWXJpZEtFTXlNWkpFSXdvamRPdG8wM0YwRVBXSVh4UzVVU213?=
 =?utf-8?B?K1VKQlBlb3E3Umpod0Rkd3VuSlJFOTQ5UDZMYkJBUFFCdGJsc1hmNU9YNGI3?=
 =?utf-8?B?c0ZuV3YvOFZ1YUhTcGZ5YlpoYTY2VjNKUzZBc2FtTjhkTy8yN2tITUgzU0dM?=
 =?utf-8?B?WDJmdTZVbjZpdVlMVU0wNDlEQ2EyRTZQaGRnN1dnL1pkQVlUeXJOU3h3UmJ3?=
 =?utf-8?B?bjlCcHhKOXhBZlFaUVBMNGxlaXpUR1Nld280TllndFJVTXNMMm0wRmxFSjdk?=
 =?utf-8?B?YVU0SjVPR1J4engxT3R0YmVORVVNbEMzUGRYZGpyNDRoOUtYMHVUcm8zMDNJ?=
 =?utf-8?B?Tjh2VnRHdDViSW5UR1RFU3FEQ2NiSmJqUGxpbVV6Y2RIL1crSUsreWRJSHpr?=
 =?utf-8?B?akYvek41TGd4UXMxdDlPVFNHQkgrZjRDWmExcUxUdG80Z0d2RnozNjdhcWxR?=
 =?utf-8?B?UjE2OEhJR3ZCbjg3UjRFTHNmWlN1cDhFei91azlxYlZoVXRKVFlkQlhNRVFT?=
 =?utf-8?B?aXpNUkVYa3FxbGx3RzJZK1ZLSWY5OHkrbXEzNThzVTAwSU1WTDg2UWlYa0RO?=
 =?utf-8?B?bkVjSFgyMUo1SFkvdFFKWkdkdm1qbVZ5V21od3g2ODZMQXNlNExUOURiTWNo?=
 =?utf-8?B?UWlXcHVQSlI0VmdDcTBsY2poSkl1S1gwbW5IMlRpTU9EWXlSaHcvUWJySXI1?=
 =?utf-8?B?VlZVWXZKQzhseUFoVjJSaHh2YWdZV2RPMHpzNm1EcTd6Tk9JQllvT1JMK3lL?=
 =?utf-8?B?NDZmLzVxMUFhS2xyenJINmNZVnhPOXNDOVJWeGV3dGgvVDlVeVpBeXNRVDJ1?=
 =?utf-8?B?cjFlZlJOc2RTamZXd01RaHlXdUJ0NkVoL2ZGMTVtK0RaUnY2eFZKUzNTV1NM?=
 =?utf-8?B?RzhWOGdDM3VIR3VNTWRmaFpOSVA3TGNXbk1pQmZzWWlpZVppOUl2VVpWTm1v?=
 =?utf-8?B?NHQ5R1FIQXpRTE00UFJWRGM5UThzWkRVQktmZ2QvM1BFYkhVb3BSaTVTSGFi?=
 =?utf-8?B?Z0l6L0pKWnk1WWQ5ajZpR1M5ZE9HaWVEYmRjVmxGSEZNTHN2VnVHY005MEZV?=
 =?utf-8?B?dmphRTYwaS81cG55bGhqK0k5OGdWcFdSREUzVVpib0NtVTFQMi8xU3ZzZjhq?=
 =?utf-8?B?aGJFUStvU1JOV3hZZEhqVnFKOU1DVEFUZ0hhRnRXY055bU1qS081cjZDalhC?=
 =?utf-8?B?M3ZBT1NQRTBTTWZjQk4yaWlvSkVJTnBpNkFxRytKMllSSkJpREovSGR3R3NN?=
 =?utf-8?B?SmsyU3U0cDdmSm9mQjJWdW1mWTQ4bHhXRU8yVWI2ZTRWc2RpRUU3N1JlMndU?=
 =?utf-8?B?a2pBcjJRQXpyMDdCbXN4dCs3cGs0YTNLamRoUVozWmhDZVlVRXc2T05zQ21F?=
 =?utf-8?B?OHFjYWFrQjFQaEtmOHVpeWhTVEgrOER0c21qMnFrSTlMYlZ2UFZyR3NSMDBw?=
 =?utf-8?B?R2Eycjg5V0FYdzdTbm8rUG01b1R6VTdPM3NYbGo2eVM5R01URXBTNmVrTHhD?=
 =?utf-8?B?OHJBWGduYlJZNFZWUks4ZGhUc1NmbG81c1diS0ptamZ5R1p0K0NSV2JJbkhI?=
 =?utf-8?Q?NwV01HA55MWPsC7k=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad178ae-37a9-42a4-de31-08de9f8fee12
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:22:45.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgvwhJbbavZlB7MfjWs+sEc22upr65Zw5WDvD0Q6vp56Au0muqZp++WaYvsfvxLVCVDAqFp/xVMFg8YnOq3EEv5rAfvkiLvLDL7ssS1Q6Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989185
X-purgate-ID: tlsNG-42698a/1776766969-7EB70F3B-D4BCD1D6/0/0
X-purgate-type: clean
X-purgate-size: 2159
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5B77343971A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/04/2026 7:39 am, Jan Beulich wrote:
> On 20.04.2026 19:46, Andrew Cooper wrote:
>> The encoded MUL is 64 bits, so writes %rdx too.  At a minimum, this needs
>> expressing as a clobber.
> I'm embarrassed of missing this.
>
>> Also fix a logical disconnect between 'overflow' being the carry flag not the
>> overflow flag.  CF and OF are always the same for MUL instructions, so use the
>> flag which matches the variable name.
> I don't mind this too much, but the use of CF was deliberate: Imo OF is
> relevant to signed arithmetic only, whereas CF is the flag to use with
> unsigned operations.
>
>> Fixes: d5c70a51bfbe ("x86/APIC: handle overflow in TMICT calculation")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.  I could rename the variable to carry instead then?  Either works.

>
>> I've kept this form because it produces best code generation for GCCs which
>> support flag outputs.
>>
>> An alternative would be to capture product_hi and check the nonzero-ness, as
>> that's how OF/CF are produced in hardware, which would be better code
>> generation on very old GCCs.
> We could fit both, by further widening the use of ASM_FLAG_OUT().
>
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -1317,9 +1317,10 @@ int reprogram_timer(s_time_t timeout)
>>  
>>          apic_tmict = UINT32_MAX;
>>          asm ( "mul %[expire]\n\t"
>> -              ASM_FLAG_OUT(, "setc %[cf]")
>> -              : "=a" (product), [cf] ASM_FLAG_OUT("=@ccc", "=qm") (overflow)
>> -              : "0" ((unsigned long)bus_scale), [expire] "r" (expire) );
>> +              ASM_FLAG_OUT(, "seto %[of]")
>> +              : "=a" (product), [of] ASM_FLAG_OUT("=@cco", "=qm") (overflow)
> Noticing only now - for the non-flag-output case this should be "=&a". With
>
>> +              : "0" ((unsigned long)bus_scale), [expire] "r" (expire)
> ... %rax also being an input, there's no risk of the compiler using the
> register for the other input, but still. Would you mind making that adjustment
> as well, while at it?

Ok.

~Andrew

