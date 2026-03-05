Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEOcIad3qWl77wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 13:31:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C8211B31
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 13:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246528.1545668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy7r2-00020l-N2; Thu, 05 Mar 2026 12:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246528.1545668; Thu, 05 Mar 2026 12:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy7r2-0001yc-J2; Thu, 05 Mar 2026 12:31:00 +0000
Received: by outflank-mailman (input) for mailman id 1246528;
 Thu, 05 Mar 2026 12:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy7r1-0001yG-06
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 12:30:59 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28650ce5-188f-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 13:30:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6574.namprd03.prod.outlook.com (2603:10b6:510:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 12:30:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 12:30:48 +0000
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
X-Inumbo-ID: 28650ce5-188f-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnPka8K5FSteA72ZHnOsZm+EXKf0l7weB1vSJXD7uKYs5y22j7s9i9luTe/lzGfM+0wVimMu1WjGrZxaBPylgOSwFlkXQk3jz5HVIBOd+xsAVQzEa9Gd/s4i4o1zVxRmjo/+Ul/0Pa+Rswbpkxug0v92gG+flMsFDLNoJsnjkbNtUNfvI5FaEqyU428zhRDhg98PBrpCxvGyZWQROOSfi4pa3Uy6wlm2dgGEs8xB14GjKiUf5wyWx/NQq3NxDHwikVvl6XDDuo/QGs3sQgspeFdQmtv/MXMtL8yyf/yLVFKcTcew5h3KVk7AGWMgqKyySzDnxFQGJlDwyo/gVDyNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ltwjFMFfeRmyH6Gs179sHmeC8jGqbOZYAFzKBCMILY=;
 b=HeEn90tI3L7Uol/r4jPJCytfAfDlfJ0KL1GQAmobf/QxAksuDzqgaA7xiSMxicDwvN8WAYIMzndaDRDxx51lU8MI6AeMkSMHzhEN1yOg14mJRpRAKkr2Yg4RocKuVmn10nP+PCKJParZmHJ3mB5xmDpHZNU/7McM9Bb/f6HDMWprkuBRI9DUfZTlXNUw8s4uwQvHkzcjsZQQFXJMyfPL60jmIZ4FRBCoiXxAphLK9s+qTLajo9QPOoMypk313uMlIHY5YqNXGFDdT7RF3bRP2At9aBKKdX8grbIXYmjLUs0Y07NClh6W2n4PrSrncTjoC0uHWxAX7d8yHR1Cl1TrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ltwjFMFfeRmyH6Gs179sHmeC8jGqbOZYAFzKBCMILY=;
 b=bVtA6fof+xZEj4QKQyj216pzPc66/CRN0UKi4sUKhgA7WWRFDb3Df0mzjWXJvOFftCLibwBmcKRnA9T40gVNwwUEAojkL4+s+ZlmMtZbmhTPt+mSDOeDs39HsSDfEfbjMB5FrLDQ1glbpvgKghGmuLOGpYlT73167XXYofFN/DA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 13:30:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
Message-ID: <aal3dVPUyh2_4g4z@macbook.local>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
 <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
 <aalD5VRBBuM16pxN@macbook.local>
 <73dd0000-4044-486a-915d-6381d0820cf6@suse.com>
 <aalYScWQQx_vMqII@macbook.local>
 <cf959649-139b-4e9a-84ef-f7548edd7f42@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf959649-139b-4e9a-84ef-f7548edd7f42@suse.com>
X-ClientProxiedBy: MA4P292CA0004.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: ea84c95d-8a93-4776-3b9b-08de7ab30800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	tVc0M3iSaqBNgX8iJyqMrOJWWI8xIWv9+IhUuiNNDibv+oAw6HoemaZDuGimtPpC26cNCYvf7yLrStzeNpn+Q8IZ8A4SHmqejYiLHoFVVdcQ8RNO3QGdoyqRKx+UMNswstrzuAIPG0Yon8o79dXJFG/xgg07OiDYl90wlh0XD/va7ouf3VnahJolyEEHRqF7aXmmutCOg2ILVbzrnjVrLLXabD9h5eM2+qFLfsN5t6q8WCEbtiZ16FlAWmjbo7rbrH+sVaE8GwMNA305K2YfnnWgR9lt8RB6CaP7gla5o+Na9Dlqg2aNWvCdoH1BPom84SXIHgqV++Sk9RpGBe0B8ycq29yILrSTY1d/+ykomA58NcW3QrPa9S7uW23xnBNI6ZeMzDF8ZkNOavfNvky/dSwLHc0UMLNh7LgBVhtTYyofHTRGQOobd468PrDMxvK3iE3j33ZgqDf2MSsfEWKuToxWddGyv/E7thmaDkt12X2D8egSGfhyrZpusAQ0k6n6pE8GNRo9eKChP0bdTSX6p0tmGdc0A1GwgBYM9U2K5kHtqYNSt1FrMuBTPp9Xxa+lnfBDm2rNVYNSpX7LZ9JYKsmgwNWAWfxrcwp2cabrSeNRdkHXXzx1k4I5N4U5tuIOrjGeZGbpbuSlVHBdzFhQb+5TFupd2Oz3k9zD0u8ey880QJU5I6c0JApoK8TBfHSwrw3az+hpQyHQKWqgt38Oxv0uOjKXVMtnuaNlBWAWCsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWgyUFJKUDRIZGdoaFJPQnVmZ2kwZFFWVkliZ1FFMHRoZG56VkRDUVFhUEVI?=
 =?utf-8?B?OUxTZFFGWEUrczZtaFRHKy83c2RRamhoeFRWZGY2eTB3M24zS2NoZXlML1pH?=
 =?utf-8?B?UzJjQzFla1Fxb0RTcVZZK3dlRjh6NmRRWjlad05hc092dEI5NGpoYkVWTFBu?=
 =?utf-8?B?cUhocmtsZHBUVHVrcllDR2RVbE40czM3OTRSMy9sMndzcUgzR0YrMUQ0aDNI?=
 =?utf-8?B?eXM0MkFEcVRuQ0R3VVBaS1hLb25pT09aQklTRk0vOU9SVzFZbjMxbFVmODVP?=
 =?utf-8?B?d0Frd0NjQUMvVW43M2JrSk96ZGZiUmE3ZDNCTFZzZlJ6blN6OExUVGNZOEhn?=
 =?utf-8?B?NHhDVVo5Z2hJblZTbDlITjJxMEZzbk1MRm8vUWFpRnQ1QzFJSzNtUjlxYnBL?=
 =?utf-8?B?U3UrY1FtV2E4RDkxeU1aTDJXdTYyZHFvN3I0MWdrVTRheUtHVE1aOUFkN2Vk?=
 =?utf-8?B?NTVWSWVnYzFGa2pwQ3g1NGdZZ2M0VmhWdGRjeTRYOWJtQ2tPQnZPL0xDMmsv?=
 =?utf-8?B?cjVvU0dGU3N4NEtHUDVvQmlIVWt3aEJKRmNFWmZrNlZYdkRZM3p6TG5IeTd4?=
 =?utf-8?B?M3liUDlkblI4cHdZMjkyTnc0VERWYjQxcXhNMm9DNTdScmVFUjJML3hhdldV?=
 =?utf-8?B?eDYvaC9GZ1V3SmxiYkExNVAvRUM1MzM3Z0h2Uk5VaWF0Y0NxdGRtc1ZkYndP?=
 =?utf-8?B?d2ZmcnUxMEtJaDJKU0tpZ3UxMVFWZjNhM1MyeFdqTzJpbzVYM0Jaak1USm5p?=
 =?utf-8?B?dGRRMXp1VVh1R1g5c05qM1VxVEVINEdJZHNxaUV4QXNNd1kzWVMwSG1qdXMv?=
 =?utf-8?B?a0xxcnlCT1Njc1BWNC85a1F4UDBZZmdSQkc3d1pxK25JTjhIL0xGeWtkK0ls?=
 =?utf-8?B?bkJhcFN3WUM4QTN2ODhkdnpmYjQ3eDZJbDlhWEZQQVRxandPQ0JkRHVWTnAx?=
 =?utf-8?B?Y1lXdGlzVkhWSll3OHNyWHF2eUZjTVJidlVWdEV3MTZYcWN4UzJVSGlwNnp1?=
 =?utf-8?B?djdFOEtaYzdhNWlReEVpUnlQbmFFR1VoWjljRTFYQjNYYVdQbEZJM3RoUDlG?=
 =?utf-8?B?Tyt4WGpwS0RuRUdTWEJNM0lpN3QwNTdRdUhMMjhIWFhNd2dXN0hoZDV2UDlt?=
 =?utf-8?B?QVVHMThZTUFUQzFqRGlUZzRKRU5CMG1rSElCNXhUcGJyT1FKRC9DSm1URklR?=
 =?utf-8?B?NEVyQnNXVlB5MG5xUkc5eGhKeGZ0aXhPa1pWQkdBMFNMVTRBUVk4alFpUFlR?=
 =?utf-8?B?ZjVVNC8rbjNGTCtSVUwyZ2EyYk53U0lUZUpiNjdWTThLR0hVV3J5SXN5endU?=
 =?utf-8?B?K2dOMkNpK0pLdkhKVGxtYXdraURWcm1VM252UGZSMEhRVUFPS1ZFZXY1K0pF?=
 =?utf-8?B?ajUxOTV4T1BjbnVkejZVbythTzdWMFhydUdYdUtoQm0ybUtnRGhwbUpmNStI?=
 =?utf-8?B?OE1hV21LNTcxYzhJRUhnOE1Rb2RUaFpuRVFNZEtZbVVXeFovczdvbm52Tnp3?=
 =?utf-8?B?MUFZMnp4R1FScjliSWRsRVY5SDBMQmpqQVNDL3lEMVFTNzVMa3VBRFFBUlA4?=
 =?utf-8?B?cS9FQ3RiTzMwZmY4RloyWUtFOEVNUjRNaVo1NWVOY3kxbzFibXZwT2xiaTU1?=
 =?utf-8?B?bGdSTTBJM1hzYVBWNmNkV0tMTXhtMi92L0hSZVRNcjg2Zmw3bHM0RnpLbFNk?=
 =?utf-8?B?UGtUWHQwblFKcXdiUWtydHMrOVRINkhjTFIwMXFOd1BJNW9JQVN5MG5nLzRG?=
 =?utf-8?B?MWdXK3MvV0hTdGNybFJEcEViY2ZoM09aaURwK0wyV21qd252VXc4OXpkeFJL?=
 =?utf-8?B?TzJxeGM5emxmcU5JSThwaEJOakNlc1cvcC9kODExSW9ySWt0ME9mWUpob1Rk?=
 =?utf-8?B?NzA0QjVpOGRjS0htam1MWXVDZGg4SDBoVUxSVmUzdVQyTDZHMnlDOHpQcFhn?=
 =?utf-8?B?aDd4QkpZM1JRMkwwb3M4Wm5PWVlUdTBwcDY4QUpmc2RjVTM3eUJ4ZkptaGpo?=
 =?utf-8?B?WTRnUzBWeWw0eGk4YlV4cFpWTXhiOGZuajFrUEhKUTlBeVpOR0FpN0NFZnJq?=
 =?utf-8?B?ZU14R05QS3FpQXV2ZVZ1NmMrd2Yyc0p2RXcwbHZXcXMzYnNHamN3WWlaMEI4?=
 =?utf-8?B?LzJJNUdRUks4VHJ1VWMzaGhPS25XZmJlMytyNEpnVjlNNjdHNkY3T3p3Uldt?=
 =?utf-8?B?ZEIzSnFsKzJBOW1FdWZMc0ZFK1I1Zm1RUkRRRWNGVW1ZTExuNDJScVhVQzBp?=
 =?utf-8?B?WGxscCtFUXFrcXNhdGU2S1JnUUZiazJyUHFST0NKWEFxUTNORjNtTUdhY1Za?=
 =?utf-8?B?TDduVWJtcHc0WW9WSnRMdnA2bmxlTnovdmhta1pSTzNtNUJiNVBGUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea84c95d-8a93-4776-3b9b-08de7ab30800
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:30:48.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glhJorzCVFZVBm3OFdnfGtal2Y3RohcVBIE8z0DLN6jv3d8JtqBTKseZWMdNXw9Dl9CoNg6dCzh6YDSAeuvGjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6574
X-Rspamd-Queue-Id: DE7C8211B31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 12:39:51PM +0100, Jan Beulich wrote:
> On 05.03.2026 11:17, Roger Pau Monné wrote:
> > On Thu, Mar 05, 2026 at 10:20:02AM +0100, Jan Beulich wrote:
> >> On 05.03.2026 09:50, Roger Pau Monné wrote:
> >>> Since we have the parsing of the ACPI related data done from dom0 it's
> >>> not only Xen that needs to support the feature, but dom0 also needs to
> >>> know how to parse it.  Or we just assume the driver in dom0 must
> >>> strictly know how to parse data from the features enabled by Xen.
> >>>
> >>> Maybe Xen supported bits should be & with the dom0 ones?  So dom0
> >>> would set what it can parse, and Xen would AND that with what the
> >>> cpufreq drivers support?  However that would be an ABI change.
> >>
> >> What cpufreq drivers are you talking about here?
> > 
> > I was talking about the Xen cpufreq driver, sorry the context was
> > confusing.
> > 
> >> When Xen handles P-
> >> state transitions, the drivers in Dom0 would preferably not even be
> >> loaded. That's what the forward-port did. Upstream they may be loaded,
> >> but they then can't actually do anything (and they may exit early).
> > 
> > Well, yes, on FreeBSD I simply overtake the native ACPI Processor
> > driver with a Xen specific one that has higher priority.  So the
> > native ACPI Processor driver doesn't even attach.  I think Linux is
> > slightly different in that it allows the native driver to do the
> > fetching of the information, and then the Xen driver only does the
> > uploading.
> > 
> >> Coordination is necessary only with the ACPI driver(s), and that's what
> >> this function is about.
> > 
> > I think Xen also needs coordination with the driver in dom0 that
> > fetches the information from ACPI?
> 
> That's what I meant with "ACPI driver(s)".
> 
> >  It's not only Xen that needs to
> > report what the cpufreq driver support, but also dom0 would need to
> > expose what it can correctly parse.
> 
> Hmm, yes, strictly speaking we should tie setting of respective bits to
> Dom0 having uploaded corresponding data. The order of these operations
> may, however, be at best undefined (and possibly be well defined in the
> unhelpful - for us - order). I don't think I see anything we can do
> about this.

I'm afraid it's the other way around, you need to first call _PDC, and
then fetch the data.  As I've learned the hard way while doing the
FreeBSD driver: you must call _PDC before attempting to fetch the
data, as ACPI will modulate what gets returned/is present on the
Processor objects based on what support the OSPM has specified in the
_PDC bits.

Anyway, not sure there's much we can do now about any of this, it's
too late to change the interface, and what we have seems to kind of
work on for the purpose.

Thanks, Roger.

