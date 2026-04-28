Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BFqMbN48GlgTwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 11:06:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE9480EAA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 11:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295491.1572163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHeOK-0006tv-5c; Tue, 28 Apr 2026 09:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295491.1572163; Tue, 28 Apr 2026 09:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHeOK-0006rz-29; Tue, 28 Apr 2026 09:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1295491;
 Tue, 28 Apr 2026 09:06:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wHeOI-0006rr-0N
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 09:06:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHeOH-0019Aq-Ak
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 11:06:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f07876-e002-0a2a0a5209dd-0a2a45029412-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 11:06:01 +0200
Received: from [52.101.56.46]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69f07877-af86-0a2a45020019-3465382ecaa1-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 11:06:00 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA5PR03MB8477.namprd03.prod.outlook.com (2603:10b6:806:47a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:05:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 09:05:57 +0000
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
 b=fqZABbfnLJHhR20sWDtKySTjjOzJphmaTjsMrZzfrugVJBXg7lCub1x6rYwseNixSpo92FG28LKF1YdkltAY6qEVR5UN8wOC/651ZwY4QimWXTtstmsHM+Olk8Anpjj4iAAqSpOiLUu4/vFQn+GdWaxCYVkWPsO2e11YqnipwJz/bBReqZ2LLHyS63394+7BRyruoDXpDaPtAXTRyJ736QTJGEFLON9GovNym/E/xHSxx7iBKVnetWicKEaY7TJBtPj02lmKV2bWaqQHeHip/GT2Jajg2X/Ffh8rPNagOtI3LHLI2MjFc08TiM13KlPb+0HCJhDxou7hu2uwZevCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vDDNiIKsmcKALdOpS+E9Ym58fArODipZkkixjnxWOk=;
 b=HxJD3bb6z7ysiwyTBZmym23n4YpERGQfrxV3T2KaiOXR44EAY8JIB1jY4k4ZP4aKqwEhtNcaKtmHTHPzxrpM5F4Oe/Jj+zEHZCWkkXthXPalVhVNsQqc/qv/FAQ1j9Zzum2VxO4IHPlKVeXVP/RqmW+Wrur60ey8vaW6oBAPLiHm6bnHQ8jrkWRQDXB7BMb0pFAliOA9nghDV+prhAFO8ssPANko8js3Hhb/NlYUA+mOvqYGqnTaLGZu+nSshC04Rkq1rCNbORoQ1KaP7Bp21FOBEeC4A4Eg2wkFvVTOrzY8zP4rCoqaQytTwzhoPxV4u3aBIW815sMi0Nz3lb+4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vDDNiIKsmcKALdOpS+E9Ym58fArODipZkkixjnxWOk=;
 b=Jh5dyKL3W8WKoHP9amBgh83PCUM27mCZBWLOebc8GH2r+AP6N6n9Z4yD7ZVvjO/Y0lePXznzf6fmEoBkPAwFuEVJUbYkIIuF7doeF1tZGzgZGKJlh4YuJn0syHq3AEyzpzv+Mg6nA/+sG4kkeburlb1tnC9ZOBJBlze7jtvaKtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Apr 2026 11:05:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 01/17] libacpi: Split dsdt.asl file and extract i440
 specific parts
Message-ID: <afB4cc8wI__auaJu@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-2-thierry.escande@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-2-thierry.escande@vates.tech>
X-ClientProxiedBy: MR1P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA5PR03MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: c37216cd-7573-4df4-0ff6-08dea5055bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	04SisD8vobZzwvnvMSF0Kg1lkKwWVMzsBQ41wq1cXtwP7L2D2UkUZhMo7kTkl5Tlse+Snc+FBgbTJ+NfTftu/AGT6f5glvXQkzeC7DNxWfJjRPNirjvDAQEF3HJQaxvmcqCURED4uR1CCrWGojq9+Z26Tp6lfKf9+QK/UrasOnysHiFSpNbaAFA7o7FM8sl/I426MhSMOn7DzXAuEU3A5dH04vi9NFh+IGss7DOdypYATnsqFZ5n4mD8jac/8UFMsO30yudEfMBJSMsxcjCzbwui8e5FAPLouib/fCr6USKkPPhnu2448aZXBCTBqXyffTGSqWtnQBQiU+wbTBj7pLBMCiXJYkbTA5wioQUF99225YfzVmYm+yI9jcZ9cLqpthzOdsLEgJWJmkhqGlJt1YTu0W6ojt9UJX0lwPf3ssmEVIPBcgjKndW9dIHjxf+nWUi6dqxn8ogRFtQtV03lryqnc5acZ38PncWPKAM3+TMlWIyRta1GKp3L3MVqDskOjYyHHiXmZVpDcPHriEEl7g8ry9MLIBXy2rfOZfi6MJ34CRKxgwMoBMRKiRas0fQ4gGk9ThL3jO4c8e9vRxaK9bUMLXF2UFfACb3Mr0Cc1qagvelM6DjPDPjK4yW5Dg6AwvJo4MawJ+kHf02ZhVoUYSCj8K/fo26FKEgfVon3Q1iwy2l5u8+L+plUdsC7eJHR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkgydFBQdUc3SzdVa0Z0UDdBOWtSblZtRnBzSFY4T254OTZTOWdaK3dCZE5N?=
 =?utf-8?B?VkJ0LzVVeE01dXFXWUhYdE9PZStvMHlQbHhMN0wreW1jMVBkZXkzYytoUzBE?=
 =?utf-8?B?cSs3RUxlZE95NXdob21aYjhLbSt0Y3M1cStsTmhwQU5VcENrblRUK1hRbWFO?=
 =?utf-8?B?QVROWFN0eU1DUUJlajlEMDZaSVRJNDhaZVRTanY0OGhqaFlmSTJYVEFFeStp?=
 =?utf-8?B?T0pTQUt2RndNQUtoV1NGYU5RUVVSb3ZzL0NhM0RQY1FFaksxcDR3WFZzM1FF?=
 =?utf-8?B?bnpzN2ZHdVM1Wm9VREtLSk9vU25WT3lHT056V1NHZUkycHM0Sm14TjNaK1hl?=
 =?utf-8?B?L3FLYUhDL0xiT3JEdmNwY2dURmNqSW5TWUlsOXNhdUFJTmhaMldiVHgxQng4?=
 =?utf-8?B?RkJYcTR6eW1xZkRyRnNuNE5lYlYwTDdQNWFLdGI0VUhjSE10bUorUHp1U1dx?=
 =?utf-8?B?UUp5RlhvQUlWcGFySjlJSUNoc3JiMEZDMnBOSVZDRjRMWmhOREsvTTJtNDJD?=
 =?utf-8?B?QVgxd3RjK04vSTMyOG9zZVZMTStBYUJSaW1HL0NMRFpSanAwUGJhMElkTnJh?=
 =?utf-8?B?dEdmbXNxZk1Ya3E3TzFVOUtnTXpHNFRkUXplYzU0ZXhLVU5DeDFQVHZoWTAx?=
 =?utf-8?B?UmVHRytnalRzQjJVZG01Z0pwUEFHQ0ZKTnp5NjlzbzFudFVXU013eEp1cE5P?=
 =?utf-8?B?S1dBeHR0NWdaeTh4ekVUSnNqcFFwV3QrZjZKR0tZd0NGQ2NTZDBkcXBYNEFH?=
 =?utf-8?B?VnVnYWp0ZGdhdDl3dkZ0c2taNnFMd0VmcmdVUVdNYjZJaWQxdlQzNFZzZEty?=
 =?utf-8?B?V3N6Y2tUemRDVTAvU0FFcjBsZHpjMWpFWkk0bVBnTllhTEE3OXpnZkh4ZVhQ?=
 =?utf-8?B?VEU5NGk4K08vbjZtTXdpbiswZWgxWGxJMHZqanpMODBSamFLRHR5R3dKcjNu?=
 =?utf-8?B?U0c5NGhSRmdGSERYVDN4WjlTM3RXM05TK25XV25yUG9wc2hDYzF6eUVXaVU4?=
 =?utf-8?B?SFBMemlQZGJDcUFQLzErZDVjbzBvL3dYS2lxZ254dzRJM0paUjk4MWh2Rm9G?=
 =?utf-8?B?QUVvQjgvRjJESUtSNkw2YU1lRjRFN0Y0TWJhai9Wdi9UbEdRY2JoRjZ2UEtV?=
 =?utf-8?B?dm9odUM3SlpjeDZUemliN3NFRitHa1JyQVdLdEJKeWNqUXB2RUNHRjRyaWJB?=
 =?utf-8?B?UWtwRTlUSFlmVFA4UzhsUzV5cGN6UGRKVW1WQWFWZ1dNV1ovdWhLdlZNWFhC?=
 =?utf-8?B?T2FLSTRDVzZOZ0tZS0RVejVKcWlHTDB6OU9Rc3F3dGVScysrbXdFcktCc2gz?=
 =?utf-8?B?OEFjd3BwamFjd0lpeWVwZVFwa0YwdnNodHA2YUQrQlJGWEk4bFdCT09RNkNz?=
 =?utf-8?B?cG5XdCtoTXNwNU0zV0h5VEpZQUhqQlJ2VHBjUW1uMVBjV3BKelJ6RDUwUzdy?=
 =?utf-8?B?VWRSeTBuaDJabnZkd2VRWStxVTZiTlE0enVnMUVwNk1LRk5BQ09PUFdNKzdk?=
 =?utf-8?B?bnhkV1ZOM0JpMy9vRWVxeHRQQTVXQm1sM0xPOTdjbmgwS282WnpDWkVmaUIx?=
 =?utf-8?B?cHUzM3o1UXdLNEpOdFBReU5QYXBDQXJoVUxUTEovd3N3TGJYcTU5cEEya0hw?=
 =?utf-8?B?NkVjY0pkeDNnN2x1aisrRmd4K2h0NHUyWVprcXZnd3pLUFNkMHZsVUp1VjN2?=
 =?utf-8?B?RFZvQytuWmJacVhNVWFjNHZDNjBIdkxIcWp3MzdySGlRQVN3SkNnUGlnU29k?=
 =?utf-8?B?ekNLSmhjVmxXZHBxaDB6bzFoeDFRSUg0TXlPYVkvUFNQUzNOMGNSN2l2eDl0?=
 =?utf-8?B?Q0hadmQ5VHRWdEFJZzUwektvb3NQTWduZ3hheXhOTGRoYUhpeUZoK3NMSnpa?=
 =?utf-8?B?cmNURTJiR3NwODJySHcrM2NGbzVGVUVwTmtxaUlISWNxNjZmZlNwQVN0WkhS?=
 =?utf-8?B?bzZlOEs4OXAvWkRrOCtGUzRFbERUUmQrcFlyMFp0MjV1VVMxUlE1MWlMOVly?=
 =?utf-8?B?cmFLMXVuTmNva3BNdnNDNDRQdTBRdFc4RW1KQURhRk1tUU1EK0s2OWlITHVq?=
 =?utf-8?B?eWV4a3BlaGtwWDJaOWZzam51dG1oZU0vOWYzZ1FoeG5hc2ZnaFNjZ3I5NWRT?=
 =?utf-8?B?RWl1TVRLVVpGakNwMUZwNndTcUlTRnhDTUpMVHc1QkdCblgxclkyMlBHVGhQ?=
 =?utf-8?B?NmhNL0NjaVplaDBRTXB0Zm9iMFBpWlZHQ0NodEU2a2JxZGFRWnRtOWlNOFd4?=
 =?utf-8?B?ZUN4ZmpEd2poRW1nbUxBajNTTldFWlF2YkdWTU1XYnk3Yy94aVRMeGVIZ20z?=
 =?utf-8?B?TUV4RFdDeXlER0pEQ2lJRElDWmRsSjNxNEh4cGNTM2ZBbnd3ZTlQQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37216cd-7573-4df4-0ff6-08dea5055bfd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 09:05:57.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTBhBKr48Pid/QT81pOJ5PrgtyXzSATA7MG4DXgUU3g3NvjaEc4Xd7rIE46z+80n5aucizAt6WeuTBYtD4m9JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8477
X-purgate-ID: tlsNG-720697/1777367161-B3D67161-D0B8D5FE/0/0
X-purgate-type: clean
X-purgate-size: 11277
X-Rspamd-Queue-Id: 0CFE9480EAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roms.inc:url,macbook.local:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
> In order to factorize the common parts between i440 and q35 dsdt files,
> this patch splits dsdt.asl and put the i440 specific parts into
> dsdt_i400.asl.
> 
> This also makes use of #include directives instead of file
> concatenations to build the asl files.
> 
> Also, the anycpu asl files generation makes use of makefile pattern
> rules to avoid duplication for i440 and q35.
> 
> Becuase the LPC controller BDF (which differs between i440 and q35) must

s/Becuase/Because/

> be set at device declaration, it is still set in dsdt.asl by checking
> for a MACHINE_TYPE_I440 macro defined in dsdt_i400.asl.

s/i400/i440/

> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  tools/firmware/hvmloader/Makefile  |  2 +-
>  tools/firmware/hvmloader/ovmf.c    |  4 ++--
>  tools/firmware/hvmloader/seabios.c |  4 ++--
>  tools/firmware/hvmloader/util.c    |  4 ++--
>  tools/firmware/hvmloader/util.h    |  4 ++--
>  tools/libacpi/Makefile             | 10 ++++-----
>  tools/libacpi/dsdt.asl             | 25 ++++-----------------
>  tools/libacpi/dsdt_i440.asl        | 36 ++++++++++++++++++++++++++++++
>  8 files changed, 53 insertions(+), 36 deletions(-)
>  create mode 100644 tools/libacpi/dsdt_i440.asl
> 
> diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
> index 21de72187d..bdc33a877f 100644
> --- a/tools/firmware/hvmloader/Makefile
> +++ b/tools/firmware/hvmloader/Makefile
> @@ -78,7 +78,7 @@ rombios.o: roms.inc
>  smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
>  
>  ACPI_PATH = ../../libacpi
> -DSDT_FILES += dsdt_anycpu_qemu_xen.c
> +DSDT_FILES += dsdt_i440_anycpu_qemu_xen.c
>  ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
>  $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
>  CFLAGS += -I$(ACPI_PATH)
> diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
> index 23610a0717..d264a50c73 100644
> --- a/tools/firmware/hvmloader/ovmf.c
> +++ b/tools/firmware/hvmloader/ovmf.c
> @@ -119,8 +119,8 @@ static void ovmf_load(const struct bios_config *config,
>  static void ovmf_acpi_build_tables(void)
>  {
>      struct acpi_config config = {
> -        .dsdt_anycpu = dsdt_anycpu_qemu_xen,
> -        .dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len,
> +        .dsdt_anycpu = dsdt_i440_anycpu_qemu_xen,
> +        .dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len,
>          .dsdt_15cpu = NULL, 
>          .dsdt_15cpu_len = 0
>      };
> diff --git a/tools/firmware/hvmloader/seabios.c b/tools/firmware/hvmloader/seabios.c
> index 444d118ddb..74b0406b5a 100644
> --- a/tools/firmware/hvmloader/seabios.c
> +++ b/tools/firmware/hvmloader/seabios.c
> @@ -90,8 +90,8 @@ static void seabios_acpi_build_tables(void)
>  {
>      uint32_t rsdp = (uint32_t)scratch_alloc(sizeof(struct acpi_20_rsdp), 0);
>      struct acpi_config config = {
> -        .dsdt_anycpu = dsdt_anycpu_qemu_xen,
> -        .dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len,
> +        .dsdt_anycpu = dsdt_i440_anycpu_qemu_xen,
> +        .dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len,
>          .dsdt_15cpu = NULL,
>          .dsdt_15cpu_len = 0,
>      };
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index e651342681..f1ed1eb48d 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -843,8 +843,8 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>      s = xenstore_read("platform/device-model", "");
>      if ( !strncmp(s, "qemu_xen", 9) )
>      {
> -        config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
> -        config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
> +        config->dsdt_anycpu = dsdt_i440_anycpu_qemu_xen;
> +        config->dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len;
>          config->dsdt_15cpu = NULL;
>          config->dsdt_15cpu_len = 0;
>      }
> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> index 765a013ddd..3c5eeff5e7 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -381,8 +381,8 @@ extern struct e820map memory_map;
>  bool check_overlap(uint64_t start, uint64_t size,
>                     uint64_t reserved_start, uint64_t reserved_size);
>  
> -extern const unsigned char dsdt_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
> -extern const int dsdt_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
> +extern const unsigned char dsdt_i440_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
> +extern const int dsdt_i440_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;

While there you can make this unsigned int, like the dsdt_anycpu_len
field.

>  
>  unsigned long acpi_pages_allocated(void);
>  
> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
> index b21a64c6b4..d3d4bc9543 100644
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -11,7 +11,7 @@ endif
>  
>  MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
>  
> -C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh.c
> +C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_i440_anycpu_qemu_xen.c dsdt_pvh.c
>  C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
>  DSDT_FILES ?= $(C_SRC-y)
>  C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
> @@ -39,18 +39,16 @@ $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl
>  $(MK_DSDT): mk_dsdt.c
>  	$(HOSTCC) $(HOSTCFLAGS) $(MKDSDT_CFLAGS-y) $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -o $@ mk_dsdt.c
>  
> -$(ACPI_BUILD_DIR)/dsdt_anycpu_qemu_xen.asl: dsdt.asl dsdt_acpi_info.asl $(MK_DSDT)
> +$(ACPI_BUILD_DIR)/dsdt_%_anycpu_qemu_xen.asl: dsdt_%.asl dsdt.asl dsdt_acpi_info.asl $(MK_DSDT)
>  	# Remove last bracket
>  	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
> -	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
>  	$(MK_DSDT) --debug=$(debug) --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
>  	mv -f $@.$(TMP_SUFFIX) $@
>  
>  # NB. awk invocation is a portable alternative to 'head -n -1'
> -$(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
> +$(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt_i440.asl dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
>  	# Remove last bracket
>  	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
> -	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
>  	$(MK_DSDT) --debug=$(debug) --maxcpu $*  >> $@.$(TMP_SUFFIX)
>  	mv -f $@.$(TMP_SUFFIX) $@
>  
> @@ -65,7 +63,7 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_arm.asl: $(MK_DSDT)
>  	mv -f $@.$(TMP_SUFFIX) $@
>  
>  $(C_SRC): $(ACPI_BUILD_DIR)/%.c: $(ACPI_BUILD_DIR)/%.asl
> -	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
> +	$(IASL) -vs -I $(CURDIR) -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
>  	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex > $@.$(TMP_SUFFIX)
>  	echo "int $*_len=sizeof($*);" >> $@.$(TMP_SUFFIX)
>  	mv -f $@.$(TMP_SUFFIX) $@
> diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
> index 32b42f85ae..130826fdcc 100644
> --- a/tools/libacpi/dsdt.asl
> +++ b/tools/libacpi/dsdt.asl
> @@ -5,8 +5,6 @@
>   * Copyright (c) 2004, Intel Corporation.
>   */
>  
> -DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
> -{
>      Name (\PMBS, 0x0C00)
>      Name (\PMLN, 0x08)
>      Name (\IOB1, 0x00)
> @@ -199,7 +197,10 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
>  
>              Device (ISA)
>              {
> -                Name (_ADR, 0x00010000) /* device 1, fn 0 */
> +                /* Error will be raised if the machine type is not defined */
> +                #ifdef MACHINE_TYPE_I440
> +                    Name (_ADR, 0x00010000) /* device 1, fn 0 */
> +                #endif

I think we want the preprocessor directives not indented the same as
asl code, like we do in C, iow:

            Device (ISA)
            {
                /* Error will be raised if the machine type is not defined */
#ifdef MACHINE_TYPE_I440
                Name (_ADR, 0x00010000) /* device 1, fn 0 */
#endif

Same with the includes and defines below.

>  
>                  OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
>                  Scope(\) {
> @@ -329,23 +330,6 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
>                      })
>                  }
>  
> -                Device (FDC0)
> -                {
> -                    Name (_HID, EisaId ("PNP0700"))
> -                    Method (_STA, 0, NotSerialized)
> -                    {
> -                          Return (0x0F)
> -                    }
> -
> -                    Name (_CRS, ResourceTemplate ()
> -                    {
> -                        IO (Decode16, 0x03F0, 0x03F0, 0x01, 0x06)
> -                        IO (Decode16, 0x03F7, 0x03F7, 0x01, 0x01)
> -                        IRQNoFlags () {6}
> -                        DMA (Compatibility, NotBusMaster, Transfer8) {2}
> -                    })
> -                }

I need to look at the Q35 changes, but ff the only differences are the
Name() method at the top and this, we might as well use an #ifdef
here, and there's no need to split into so many separate files?  I
need to look at further patches.

The ACPI table generation stuff could certainly do with an overall
rework.

>                  Device (UAR1)
>                  {
>                      Name (_HID, EisaId ("PNP0501"))
> @@ -444,4 +428,3 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
>      Method(_PIC, 1) {
>          Store(Arg0, PICD)
>      }
> -}
> diff --git a/tools/libacpi/dsdt_i440.asl b/tools/libacpi/dsdt_i440.asl
> new file mode 100644
> index 0000000000..e80c454ad9
> --- /dev/null
> +++ b/tools/libacpi/dsdt_i440.asl
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only */
> +/******************************************************************************
> + * DSDT for Xen with Qemu device model (for i440 machine)
> + *
> + * Copyright (c) 2004, Intel Corporation.
> + */
> +
> +DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
> +{
> +    #define MACHINE_TYPE_I440

IMO we probably want to define this outside of the DefinitionBlock
section, just after the copyright header.

> +
> +    #include "dsdt.asl"
> +
> +    Scope (\_SB.PCI0.ISA)
> +    {
> +         Device (FDC0)
> +         {
> +             Name (_HID, EisaId ("PNP0700"))
> +
> +             Method (_STA, 0, NotSerialized)
> +             {
> +                   Return (0x0F)
> +             }
> +
> +             Name (_CRS, ResourceTemplate ()
> +             {
> +                 IO (Decode16, 0x03F0, 0x03F0, 0x01, 0x06)
> +                 IO (Decode16, 0x03F7, 0x03F7, 0x01, 0x01)
> +                 IRQNoFlags () {6}
> +                 DMA (Compatibility, NotBusMaster, Transfer8) {2}
> +             })
> +        }
> +    }
> +
> +    #include "dsdt_acpi_info.asl"
> +}
> -- 
> 2.51.0
> 
> 
> 
> --
> Thierry Escande | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

