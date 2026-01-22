Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNsnKdL6cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:24:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EC765349
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210731.1522351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virr5-0003c9-6r; Thu, 22 Jan 2026 10:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210731.1522351; Thu, 22 Jan 2026 10:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virr5-0003aF-3k; Thu, 22 Jan 2026 10:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1210731;
 Thu, 22 Jan 2026 10:23:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1virr3-0003Zt-OW
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:23:57 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 729c38e4-f77c-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 11:23:53 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5177.namprd03.prod.outlook.com (2603:10b6:5:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Thu, 22 Jan
 2026 10:23:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:23:47 +0000
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
X-Inumbo-ID: 729c38e4-f77c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmFf3n8OHQgdnRbrp6JU1Y2TCe5/TS2YyN1rmoYzhrPo7O7EynBkLmmOCenJZvjKGHewVmJg6YWD1ZHIHFLGWL+e5pLsuIgFIy5iNXwOpsOuzVMMyJr1Li4ApMT86aQ88U4m8ECMzn2tlBq7Sn57AidaSBeQELqM/Yn7w+8pNyMxlXS4CTzsHaenzTZTNiLgWhoe7NaMckKTwsU5RmJIy+JyPJR3R6iZfxjcmqyfRAcr5GHgqvZQxYkJUa/+uDHCUVgWDIK6QP1/EMl/YKIr5gujgQYWtyI4hMu8IHYJraGhqawTVZnJsNqvKcUB7zPvYac4cDW4F3C1BNsX8I2XNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVF/8qbQOIejmy75Xasc0uICoy3EWmNEGvLlAINjnE4=;
 b=w3HHfhhWuIgRP4V5Zcj5eIykvNhqK23eFfbFDjcvzrRjZPiolRqdch7wJLPQ8iu1SXKrNYFiOfwlYHN5k5TK7d7Z7lFxPCoHUpbPAGlXht1uZOwjsGAMu83aNfs51FaljotXA8Aqr0vTKLl3bCgljSy6SOyD1U/xqre8nK00t5t6koVBin9H0Uz8vottJ2zpd0/DnhIwt2ZYemjOw1XeN45w/X9O27ySAFiDPnCPuBkbiohpETVsbOtSAVtUruIRrUlVlRA0el45/WIUx6gqTVfe8cUZpV1keddvljioEYw9az9jh/TUlnOsnfU2YD2zYXVjEBnfYQ66fZG03dnM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVF/8qbQOIejmy75Xasc0uICoy3EWmNEGvLlAINjnE4=;
 b=f1/+q7B0geYH3GCsDEyfCMH/X6z4i07tzdHW/I6K4hjUX15UqOl85pFdsq6PRf6hDzgP9c6NlknaUNVhJ/JfEfdbf18xTOqk9YdjcZr87meoO03+kS1dpOjpjklLcbgguJtGC48QW98gI6yEjhwXy1Wer6aneijzd91hoSU3ws4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 11:23:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 8/8] x86/HPET: don't arbitrarily cap delta in
 reprogram_hpet_evt_channel()
Message-ID: <aXH6rwF7pJbPpxOV@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <37cdba83-9bf8-493a-9a7b-5ec11c32159a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37cdba83-9bf8-493a-9a7b-5ec11c32159a@suse.com>
X-ClientProxiedBy: PR3P193CA0050.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::25) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 205086a2-d452-405e-13a1-08de59a05443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTJNY1JSM2JjTk9rMWNtMU9xVDdrQlZtNFVIR3c4NUdlM014OGVXTktuVzRB?=
 =?utf-8?B?WHZFVVMxeG9mVlN2RlRmUWFxSHdTcGcrVFM2U0VZeEZ3S3FuTm1PaTVocFd0?=
 =?utf-8?B?OGRQdDBZNk80SWp2Tlk0djE4amw4U2FHTXpvZXQ4MDRDMEx3UU80RnkrZFlG?=
 =?utf-8?B?VnQvSi8zcm11cnZQK2JQUys0UUVLeTdLY3JSRlR4TDB4STJxbTRoZEpCQ0ZE?=
 =?utf-8?B?ajN1YVE5SXNLUVRSbFFhbFJ6d253RGk3THdxcEpDRmc4UzB2Mm9pcEJCNGgr?=
 =?utf-8?B?TG5EdTZTZVpveG0xQksvZWlZK3JkSlRWbHdmRHlEcWRWazY1K080Z2RkYXZ6?=
 =?utf-8?B?UnBuUnNnalVGRmxrMFFRSmJFSHZDZy9HWEhhcDhhd2xielIwbGxxSnYxL3k4?=
 =?utf-8?B?ZjNjd0JUdGxvelhWbjJKZG9SWEo5cjV0bFhxSWtHVmNPbDNCcWtDbnNRWjVn?=
 =?utf-8?B?aWNIQVBLWFdPeG9PU3prSHc1R0JTV1lSSFNEUGUxR01WRnlXaEdYcEJkMTM2?=
 =?utf-8?B?M1llQUcxTjRPMXUyWjJSMXp3QTR2OG1mM055aFJJN0gvOUFySWxlMldjU0VB?=
 =?utf-8?B?b1pGK09tUGN0bFIxa3lleGR5WU5KTU44NVdrSjc2b09kZlZBdy9rZWRFV29W?=
 =?utf-8?B?dkxicmZZUDFmekw1Z1FKR1pNRlBuUFUvSU9OSGw1cnNtU1JjM0w2alFrVHFm?=
 =?utf-8?B?dE90K2Z5bUwxdDVScVF3NG95N0h5TEZsWVU0dFN4UEpZcXJIRnJ5YVlHQ1U1?=
 =?utf-8?B?OHNERXJHQzZnQVI2RDkwSEZVbFh3aUVpTTFhR3I5WDR3NTljcnFPcGFmbUpE?=
 =?utf-8?B?RUtVYmUyanVUWGJBdG5QZjg0RGhPSTZoTmhJWTRCYkducHZwYm80YjZQSVZ5?=
 =?utf-8?B?RmtSdWNUK0xLc2J2bzRWcm1Ocmt5RFBXVXpMZU9CelhhcUVuNU1RcUF2Qkcy?=
 =?utf-8?B?TDRjTVBRNmNoQ3A4VDk2OE5RQWdKeHNPSDhGTitoNzJzZ3AxUUZ1aUdERnB5?=
 =?utf-8?B?MG5lbXdLdGpKWFZjUHdqTDJmdXUzRmlNSU5NZlc3OXpVQ3BiS0t6cGRGcUhw?=
 =?utf-8?B?ZlZJbDB4VnUxUW1jM3l4aTI5MFhaOTBMZ2lva0Z3S0hmRVozTjNSMlR2MnU0?=
 =?utf-8?B?bW9DUXdPa3c5MElPWXd5NW0zTzVKc2xaZUZZeUJkUDF4bkExNWNsVFpFQVJV?=
 =?utf-8?B?aEljUWZYNSt2VXIxd0lES2o2UkVqemwrN0Rub1JpZmc2TDBxck8wQ0dlclVF?=
 =?utf-8?B?OGNBYmc3bDRmbU1HYjQwMXViVjk4aVB5ckNkL1dXblF5bzhUUG5mZGNtY1VB?=
 =?utf-8?B?NkNkZ3FBektHb09kR3BwSWxxZFZBb2hoUExzU1hkZHlpRGJkQzI0cFQzY3ZB?=
 =?utf-8?B?eW10T2pYaDRjaGkzTDBOMVUwbkhrREZ2K3Z0Slk5elFTOEsvUnlBbytIL2VN?=
 =?utf-8?B?MEhqWkZjZVRUVmFpZkpQdS9pOFRMcDJ2SFFncVAvRU9QeTN2SnM1RXhqWmNM?=
 =?utf-8?B?eks0bVVweGFHVjlvcWlrTElvOHEwUlFxdXBDMlJDQnUrUU02ZmV4RXlLOXVT?=
 =?utf-8?B?V0VhM0N3SHltSGh4cm1xdTU2b1ZNK3hMeHFscStBZGhXdTduYmNYc3hrNWYw?=
 =?utf-8?B?Tms3bkExMmY5RENOQ3JKNDQ4eDVNU3hmUWNkb3M2RW5OSVJReERkSzlZWnNn?=
 =?utf-8?B?ZnN4d1hvdS94dG5SVklWcGh2REh1TWdWTDVLN1FhOTVRV0pQUFNWZ0FoQTV6?=
 =?utf-8?B?VlZuNTIvT01OUGkra0pyUU0wYzd3ZUtqSjYrN1RmY1ZwQXNSby96VVgxMFEz?=
 =?utf-8?B?Q1NrdXdMWFJMeWlxbGlmZzJZd21UVk9ZSWRDL0NZRXpDVzFQSHdPamcrUnQr?=
 =?utf-8?B?VHZmYzlrTmUveWkvTlc2alN4RGtaNHdOTGVpN0Y1VnhFTVZtMnFHang2d1kv?=
 =?utf-8?B?akZHUjhHSjdNQk9HSlNJLzFPdklqbE9jRmhjQ2VSSEpPM29ycGU1QXhIWjVR?=
 =?utf-8?B?cXlvMXVaZEJQMWU4akNsUFRsbS9BRzdZUkhaeHJycys2K0kvdG14Uk0zOFdE?=
 =?utf-8?B?YThrVVpXRmE5aFYxNWRkVGxvMW9SazBkdjVIanlDMTUxTU94b3hkdTJBTXRI?=
 =?utf-8?Q?qTT8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmFtcEtJMERDSzY2MW9ZUE11YU16eUhGSXpkUkR5eEd2b3NwY2JFWGYwMStD?=
 =?utf-8?B?UmltVm5BdUFmNFFtRTEyVGs2OWdHOEREODJPaCt2U2k5eTRPVDQ0TUU3cnFM?=
 =?utf-8?B?V1pNZUNKU1BOWEUwbnBaQXZvVzM2ekJ1SVdyaG4wNlc0RERXQVhYTHkxa09q?=
 =?utf-8?B?V2RRd0J6dzh3NWlBRzFWTEpLUEEwSGh2NjNFNjI2VDBJRUJsQWFVZ1EvOURF?=
 =?utf-8?B?U2VYWkZnck5rV3hteHlHb0RQcys1c3RUUk82Q2dTckZJT2kvUWFrUC8vL1A5?=
 =?utf-8?B?ZHNQblhkcTBURWxMb1VId0dwbTVCUnl1bWEreDRkU2FzZFpNTTk2Ukl3dHBL?=
 =?utf-8?B?TnloSFNjM1pycUF0MFZ0TC9VcEFza2J2K0JmM2FTYTlRZHJPMGxHQzZDcHdy?=
 =?utf-8?B?YUdNTENuMk9OMGF0ZUltL0FzSnJvSUNSODZSWWxVbFhLTm9yMzBISE9Kb0Nk?=
 =?utf-8?B?TlR3WkxCMEp1TWZnZTdZUHA3UkUvTDdJcHFMRGZDQkkrZWx3ZHZkUnB5VVpU?=
 =?utf-8?B?Qm4zSVFsR1ppZTZwc3hEcHY5SU4vQSs2TE9sMHFsQUJOdnNVTFlZR3l3V2c5?=
 =?utf-8?B?cnpIZXkvcHVqNmx4V0hRLzk1aFcrQlgrR2ZOekc1R3hWZUVYVlpTWlJnb2JT?=
 =?utf-8?B?SU8zckJMZDMvc2tmOURkb3h6S2Q4Nk9sdTZTQ2pkTk4reHZjVXVGeW9vRlk4?=
 =?utf-8?B?UVZhWUJsQzhMekF1c0FEdmZkUEJZcTNhVG9QdGlzL1J6S214ZmxBM2lSTkR5?=
 =?utf-8?B?RVhCVHpkamlvNmFxOVE0YThZRjBia2VYSGZETDlsdHZPRllqK0s4VGdMenhC?=
 =?utf-8?B?aFBtUWhtc0d2Wm0wRHhhWDlhOUo3Smw2S1hEQ25LWmZkSmhWaXNTUmNRRjRU?=
 =?utf-8?B?WjZXejRUNGF0RHgyK3BpblF1R0IrNXc0NVdsOXh0dnRZZWU2dFQvbkVZaERW?=
 =?utf-8?B?Z05kMUFmUDRnVDYzdGgrTUkvZlFNQU9ROEk0Q2J0c0tqREcyVTRhditXem00?=
 =?utf-8?B?OEJpdjRPRGlZQzJBdE5HZFQ1V0kvNTZRWjdpM2JYbHl6U05JYkcrYW40TDNP?=
 =?utf-8?B?dllBTHhjMy80bkkvSzNFSzFzNlZ0ODl4UFZQY0t0dThyTnZPcHJEWTlJZE8v?=
 =?utf-8?B?Znh2MGNwcWhYZjAvQ3FRdnRBZGZmRk1yQU9PR0hiR2NhVytESVhGTUVWZE1a?=
 =?utf-8?B?SjRNZ0xBaWtRS0Q3M3NiQlpkQmxlb0t3ZDRDbllRRkJNQW15MnQ2UDFHeG05?=
 =?utf-8?B?REd6cjBxVC9CTURKK2ovdmpoRnBpczBzWGNEMzJuZkNQTUF4bWkyUlBDdkxj?=
 =?utf-8?B?TkNBR1ozRkxKZCszUU0vZVJmbkFaS1g5alFGYmFFc0FYZnZTemlXMlN4UXhl?=
 =?utf-8?B?bWVKc0xoelcrTkdiZkVTbE02M012M1RHaXJvakNnQzJzS21hbkVlLzlKelZz?=
 =?utf-8?B?bFR1aEhnUlgvbSszL2FPS2dsMjhnWmFMamsxRnJqR2p6aGlUck1EUnBGdG1N?=
 =?utf-8?B?S0dySTlkYkxNY2FDN1FFZlNxQ09ZcjBoTFRLWG9BM2Y4TmJYeWlReWhiYkN0?=
 =?utf-8?B?Um1KU0FLVkgvNCtzNlEvU0o4cUxqeXlGSVd1OHdPc3B6TEpldElHYkJaNHd4?=
 =?utf-8?B?bGdRblk1TVpERUk1RFp0c0daUGZRNG5PTlA1WVd2bkhSL3IrdDVmZ1RjMGRt?=
 =?utf-8?B?NDdOaVk1LzVpNlVGam00d2UyVHo1d0FDbEFad2oyMkVSOVRLQmJoSWZTV0FI?=
 =?utf-8?B?WHluRFlRN3JTV3dRVXZhZWxVNjNRRHB5eWw1RTUyeEh5aGNXUmFtYjhNdG44?=
 =?utf-8?B?M2l1azk0UmVqaXZpdkxWNlBMT3FrMGlpc0pueGt0L1JxYjBFNUw1TTNwVk5o?=
 =?utf-8?B?Qi9JVktnVGRFOS96bWxWUjRzV0lPVkVyY1lKR29mMnRWWmJUdkFKMDJOa2R6?=
 =?utf-8?B?VEhEMm0rbFFHeVJLRGIzSGsvcjU4NTJGYTBsYjRHOTRqRFhzbVVxb2VWMkhE?=
 =?utf-8?B?blltT2daRTZjSlp0ZExCdHNsZ2VHQkJNUlR2ckpyRFRFbWcybUxLdmR1d0hm?=
 =?utf-8?B?UGJYSHg0MzBaUkFkdkN1QkpFcHJvU0xlZ2hBaUZ0ZTNkakVSMUM1RXhtNHFi?=
 =?utf-8?B?K1R4NlV4RWF6U2ZQbUJQTnB1NWdhdG5SNFdRanRBdG1nb25lamR0eUNNclNR?=
 =?utf-8?B?TllYTjd2Wko2Q1ZPZDBOY2VmQ0wzRVE1K3FwTWhzUWZtbHI3QXFvSGQxbVdD?=
 =?utf-8?B?VUhBV3RvRGtJeWIzRUhSS0pLWWFEbTJMU0gxMFVRODFBd1V6cVlpaGFmSDVZ?=
 =?utf-8?B?TVgwbkN0R2dLcmpQWXhaSFdhR3lHV3dQbkNDQ1NqMUlWSStHSGtSZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205086a2-d452-405e-13a1-08de59a05443
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:23:47.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qov2ZTe39s1dPu34vLwUecuBYaEqCnab2ql651WRAjaLpuggxBOerRZq2ff6N6f7VJlLsWj50AdWTpXOcvF0+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5177
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 06EC765349
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 03:40:08PM +0100, Jan Beulich wrote:
> There's no reason to set an arbitrary upper bound of 10 seconds. We can
> simply set the comparator such that it'll take a whole cycle through all
> 32-bit values until the next interrupt would be raised. (For an extremely
> fast-running HPET [400 MHz and up] 10 seconds would also be too long.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: New.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -23,7 +23,6 @@
>  #include <asm/irq-vectors.h>
>  #include <asm/msi.h>
>  
> -#define MAX_DELTA_NS MILLISECS(10*1000)
>  #define MIN_DELTA_NS MICROSECS(20)
>  
>  #define HPET_EVT_USED_BIT    0
> @@ -162,10 +161,15 @@ static int reprogram_hpet_evt_channel(
>  
>      ch->next_event = expire;
>  
> -    delta = min_t(int64_t, delta, MAX_DELTA_NS);
>      delta = max_t(int64_t, delta, MIN_DELTA_NS);
>      delta = ns2ticks(delta, ch->shift, ch->mult);
>  
> +    if ( delta > UINT32_MAX )
> +    {
> +        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));

Should Xen disable interrupts around this call to avoid unexpected
latency between the counter read and the comparator write?

Thanks, Roger.

