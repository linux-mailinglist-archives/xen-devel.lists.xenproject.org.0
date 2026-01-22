Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I/0C6zrcWl6ZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:19:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B4646AF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210545.1522190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqqN-0002k4-QZ; Thu, 22 Jan 2026 09:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210545.1522190; Thu, 22 Jan 2026 09:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqqN-0002hP-Nx; Thu, 22 Jan 2026 09:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1210545;
 Thu, 22 Jan 2026 09:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viqqL-0002hJ-Pv
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:19:09 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66fe9051-f773-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 10:19:08 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB7253.namprd03.prod.outlook.com (2603:10b6:806:2fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 09:19:03 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:19:03 +0000
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
X-Inumbo-ID: 66fe9051-f773-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO97ZJ8vY+PS9cI5p5YslZ3v4zQDo4G4xbVguYsw1bAxGP/TFqoMkqA4GS6Ixr980olZFKAMYu006thiPZiV6ma63spjUjI3s8+WrB+JgGnfhSfWTFPi5I+tyNkTu9eZ9E/SDvk8zG3v/v/mD2ZhI+zsZr427/+8aQ4at7bIj49cmy6+uzgoIMhwf3PERhjjo4rSPsvs5Dg+MzIIrysU1MOjgMQGpSIVk1GhnU48AEXlisXg296kVLDPxSTe7odD7P12DGKI9QSSotKu1KDUlPFk13oh5asEr8X3V/2z/9n6YWhX5ARGa/iWOModsFsI5Ri4clYcGiK3xo8nGZ7E5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHgE5m6QECRx5+eJgIROoUPUitr4gYlcUJhTZpAIDDQ=;
 b=nEPCScuZ4susrIDoHioe76vWT6vsun7nbTQbAX0774adb1pwhV+gunK0hC6ocr/YYebJy3JdsXx0IeX/Sths/V1kBS/6j7eH5IeknzMnrJspOMY5H6xMw5EHR/xlo46pR7IT/HTqJ9E9y9kOMQGpxdWDAhB8GEI1xWuSJLqeOFA7QYA5Myj63IMZERBQDNYA7DP2cHM7K3KFVb+2OGDtN7YWKM5jXYRyYhinhawEK3QUj4dUJwM7yZITwr0UW039JzzduSdZ9YDdkIflGRDUETrDEO/ydBP47n2kBf1dyJFwqLq+j06SjMVegPE+Y1JerUxPyvcbhZZf5j+NMRjMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHgE5m6QECRx5+eJgIROoUPUitr4gYlcUJhTZpAIDDQ=;
 b=aOvovKCXN9wk0lDfkKY+lLVoUDor1yHWOxHdiUXnJ2zGSwx0dA1UZP/6CasSXnxqXWltyzctKBHtKzmgS5w/swUt/6pLWnjjAMdqaIuor8bOEx2PXSvEijs0HqA5a13fVINkMaYe5I7l1c4n5mVuXDMfXEg+UyynXRa2TXb79GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 10:18:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 6/8] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
Message-ID: <aXHrgwifS3PDzdfa@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com>
X-ClientProxiedBy: MR1P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7334c5-af94-4479-c210-08de599748b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0lDYjdKTVo2UTN0dFE0TW9ZamtaMjNPbmUxSDN1TW5vc3I5aUVsUTk2dHZh?=
 =?utf-8?B?VWNUR0Q0TTBnN2tCelU1Qm9SVkRudVZUZ2paREdhNTFRNDhGck9RWXhWaDky?=
 =?utf-8?B?MkcrUlBrSGNzalVaSTZjV2k0K2huNEZibFpsM1lVbU1BT095MmQ4WTZZZG1D?=
 =?utf-8?B?djJUeGFlUEpUNXBoUHdzdWZyV1BpQXNWOHJVSmpLaTByNFd6VWxSWE9QeHNI?=
 =?utf-8?B?eDc2Tm84SWJzeGtDTmF0bUxMZ05HZHJ6TXZKc09aVXE4OEdHMlU2UndHclQy?=
 =?utf-8?B?WGRwL3lOazBSNGd1c0M4dDhPa0g1Q1lOLzNiS2drZVNZeUFja21SVVoxdTlG?=
 =?utf-8?B?VjBhdEZJZjA4eXIxNk5URGhvRWNmSWxrZU11OUhGZDRDUVpsYVo2azJwOE5H?=
 =?utf-8?B?emZoNTZ6dzB5SGcvYURWdDNqY2NndkR0ajJYQmM1TEQyMWE1VDdiRmVud1NB?=
 =?utf-8?B?ckxTNndJLzB1U3VRM2lnQnlIaXpaRzUzWVN0UC94d2UxNzVXQVFqdVZtUmRV?=
 =?utf-8?B?d3NLWkdtQW5jeXdUR041ZW1ReUE1VFI2N2lJT25rTm16azU0cmp6cGt2NzJR?=
 =?utf-8?B?MTNlWlFUbktBNXFTa1c5aWJPMGd2c05tVXo3a2N1R3dUdTRjZ0cva1A4UlZ5?=
 =?utf-8?B?eUZibTZwT3VUSXdSM2ZGTkdxYXA0MG5zdU1scHFHUTVraEhNV0xWL1JpQlhP?=
 =?utf-8?B?MXpKemhQSHF1aVJpR0VKTHppbFB6cEc1NTV1dmNoYjVSZUVVSDNKSzJnaVZz?=
 =?utf-8?B?ZC9qRjU4eGM1RE0vUXN2Z01lT2VZdnVocDQrTTFiZk1TSmJ6Y1VJQkVQMGVt?=
 =?utf-8?B?bUJpcW5aaDV5Z3pmWmZxVWU4ZENicGlLQUI1aDJVdkdGRXBEK0U2cU1Qb01L?=
 =?utf-8?B?bXBtSHMyTjlPaWJuOWZ4dVBlL0VBdDBsOCtpVmRGeW9SbE1hT3RZSjEreFgr?=
 =?utf-8?B?L3gwVjV0K2FrU3RSY25VcHhyZU9zUy9hSEMvUFpwdWpVMmRBWXJkeXFVTUxs?=
 =?utf-8?B?by9yN2FGL0hVQVpOb25jMXQveEhpMmRUM1dPUitoS0F5cHZoZHgwcHNFc1Jl?=
 =?utf-8?B?cGpHc1VMSXlsdWQrcmNRR3RNSUtzaTBhQUhkajZ5dFJFdENEZ1l3RENpNjg3?=
 =?utf-8?B?alEvK0tZNUQ5VnBWZlorR2daRi9jdkJaR0h4MXMvaTBhNkxMamZIdE1ncFpy?=
 =?utf-8?B?Q1NucHhzTndLNDhVN2lHc2ljMWI3RzJRSmdLekNxS2JTbGtzZUtRZktjdXV0?=
 =?utf-8?B?a3I5VFFiSzZZaGFLZ0F1UXBUbnNNL0Q3RGUzTVhtRURWQWlKYjJubmt3MFQx?=
 =?utf-8?B?Y3ZnV3dZbE1BSWVaLzhLMUxZcXZ0UFlrZGNzOVpXUmdKbUI4bzNZTXFLYVoy?=
 =?utf-8?B?OEhibjQxOURFS2U2a0xxY3NYbi8zdlV5RWpvdm5qaTVUVzZDMC9sd2h6WE5r?=
 =?utf-8?B?eGZDRjFHeU1YWVVMc0RUcThoUktFZUROa1NsTEY2MDk0SVQzTDUrMGp4SUNv?=
 =?utf-8?B?cjZVRmhSR3VtdkRSeDZzQklrSGJaZTArbWRFenE1WnpxVnJkNHZvQXcrWkc5?=
 =?utf-8?B?VlJ2WE1XWUY4VzU1d2VOZlF5cmpiVXh0dlJWdE9GNGZISGprYTdJMGhqVUdj?=
 =?utf-8?B?b3pyNGphM3hmdjh3cG0xZURtaURxVzBxcHIzcDdjUjVIVHFESGVOWmpjWVNT?=
 =?utf-8?B?bDk5VnV0L1RodFBJTXpSa09ad25lOGc5WUpuUmN0ZHZMVitjb2xDZTk3M3VT?=
 =?utf-8?B?b0FiWkhDVUNkRkZ0aEZUMnoxOHhQUXNzY2lqbVZsWWxMbzZSbjFMR2thTWtn?=
 =?utf-8?B?MWNGb1EzQmhNb2M4MjBvS1hJNXZmcjJwS2JQUnNEOGxpZG95Z1hLcjd1ekti?=
 =?utf-8?B?WjdFS3lPNHZRVUdJSGpUVXVHcnE0YXFwTFhmMGJDRDlZMTdBbEdPYzY1NUFP?=
 =?utf-8?B?TS9JUHVoVEU4eFE5N1NybCtTVi9YTHRPWkYvS1Z0N0FiSytaYUE3eitrWUcx?=
 =?utf-8?B?UUphMFFTZ1pXZ0JxTjlGY0JYL1EvY0N4K0VPS2haYzRTWmtDMElVVExjK3BV?=
 =?utf-8?B?aVpRY2JNckwzcTNJY0tTNUNscW0yRU1paHNjME9PRHhDR2xPMkh1d0hTYU9B?=
 =?utf-8?Q?t9Vo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWJ6bVkvZy9NRnlyK0lHd0lIbGFrZWtPaElNR3loWWdyeVNqOStNRXRQTEJO?=
 =?utf-8?B?bXNUTjFibjBnNGhoV0tYL0NvYTlCdlNLOTZqVEhqQmg5emluaElRd0xlRkE3?=
 =?utf-8?B?cVZ1RW9maWkraEREWnluRDZVWTV4YzZSUEFSc3ljWGRIK2p2YlZVb0FPaDBk?=
 =?utf-8?B?QzF1cGVTUklDSzk1Qm91UUd0UnJLVi9WZVRTbkNvc3VYNHByVnpYWGN4bkto?=
 =?utf-8?B?WXRwQUEwMmorYklYQTh5am84NlJrdmx1eWU3NisxK3Fyd3lsZkdHYlVDa0FT?=
 =?utf-8?B?U0RqMndlaHlWVGFqS2g4dWxCb0NzK2pTZXVZUnJwY2orQXl0SUxNT01yK1RL?=
 =?utf-8?B?OVVzZmJSbXBiMkl1QWhEUjNTeFJhNjdRNkV5SFpLZmFoZHpnTjdnY3oxWVdi?=
 =?utf-8?B?Ynh5b1FWOGpRWHRsY1c3OTlNOU9kQkk2cmZFWUhsUnM2bDhieEJJbDIrbVdW?=
 =?utf-8?B?UndJL0JGd2k4dzJMVnRTV2EvTHhqNjFUdzd6UTVpTlpZOGxFTmJvdzk1U1kr?=
 =?utf-8?B?TGU4NEZvSDZQQlNNQ2Q5Yy9jeGdLT05VcERGUm0wbVV5Qm1LcjRkRTFIQXlk?=
 =?utf-8?B?SWFVWncvUnR3NVlTNWRrcFAwWHBKRVVWc3NuaHpiOEtNNUUyREltbDQzWURP?=
 =?utf-8?B?YWx4aXpncjRKdnorYlNaOFZINjkwVGoveVl0N0YzL1QvZ2VsQUdNektwTVhR?=
 =?utf-8?B?bTBFNkxsOTI4OG9ILzVtKzEzZ09CeGpZUlM4YTdnTlA4NE8wNElMOHJiZGRE?=
 =?utf-8?B?SXB2LzdVeFo2THhSK3NpSCsxTVdwQ24zK3AvaHo4dkJvaUl0YjQxZ1J5WjQ0?=
 =?utf-8?B?bVk3VWZWb0NkbUxPNk50YW1RZ1RxcGNNNlJ4azg5d21BeEdBbG1mVzYxcHdL?=
 =?utf-8?B?RU5BZ2VPSjl5eVBjSytUbmd4NnlHZmdjSm5rTkxvN2pXeVcza0UrcXQ1VTZX?=
 =?utf-8?B?b2cybk95N201Vy9SeFZaUHlXc3Z0My9MMkd5VURFRmVBT09LeTNURGlGQnlq?=
 =?utf-8?B?ZmRla1JjU2JHcWFla3gwWVNPWEFJd01SMEw5czJGYzNCOE0yN3RGNC9wUmxv?=
 =?utf-8?B?eXVNM0lVWFgwZHJtUmhYYW4xUnJQLzVyQ1ludzhlajB3Y3hqQ1RlTnhjQkpS?=
 =?utf-8?B?L3lhdlhCa2NBQS9Fc0l5MDVtM2lkTHl2NFVqWmlsSjcvd05hVVhqZDY4b1ha?=
 =?utf-8?B?VlNYODB1UmVvU2FzWEJQNDkrUkIyL0d4TVROSTl1SnhzWlFHOUpDUjZtbkgr?=
 =?utf-8?B?cCtWbnZKZHVHZU9iVnQ3eGZGUHlSUTJIM1ArOWZVVEtCNVlPYVRJR2V6UEhx?=
 =?utf-8?B?cmlPcWhLSHhJM05PTUhFaDBnbDVEamhqbFNHWnJvNUFuWDNjUVBQQmZQRHFC?=
 =?utf-8?B?YTM5a1p5c2JPM29RYkpCc3JzaXFsRXdoeHltTkltbFY2SGIzWVhSMFg2TDVF?=
 =?utf-8?B?eTZVSTROZGt3L1BIZE14Q1FSL3ZGK2RYdzQvSVBZbU94NGE4U0xYSUhJYWNY?=
 =?utf-8?B?KzZQYzZJbmh5WXUvako3UzRvMWhwRW0zdkRCMmpLNGdiQWxiQnBvd00yRUF3?=
 =?utf-8?B?YjRFcEdNQ1k4WVV0dE5ZN2EySXk2dkZBS0lTWHhEVjQ2SytjT0t3d29HeXVG?=
 =?utf-8?B?OFFneHVQNkRSQUgvdms3Q1NzMkROanFxSlZHT2FveS9iR05sNTdzR0prbXN6?=
 =?utf-8?B?ZXFZejFHaTV6RXgyNHNrYlJ6L3Y2a0hDQWhTVEhBWUl1REZmNnYzYTk3NXNH?=
 =?utf-8?B?OVpFcDB3REIzY2N2R2hpS2o0dGdGSEl5RWRPTmJRUFBLZEVtS1I0MWdPQjdB?=
 =?utf-8?B?RUFoRXJxZUF0OEFONlIyZElJV24rbzBuVHNkSStvZjNlVGN5STJDWVdpcnRY?=
 =?utf-8?B?bkQ1N0FaU0hqUWZOZ1luQXVWNTY2WTdreW5FckNubGt2eWRmRnRXTkNDVmxF?=
 =?utf-8?B?SDJhRnJoL010MkxlV2lXM2dGSjNyUEhyZzVFN3EycnQ1SEpFb1dqZW1IL2VK?=
 =?utf-8?B?aHlRWFIwb0hQY3Y2b2lvTmRscVBNY3FWQnc1QXMxWGZ4QnFLVU8ydHd2RmU3?=
 =?utf-8?B?cDRpZk91UFlITEQ2MkltTml4OERSUFVxempYNERZR0VSd09oZ0dGOWYwTWx3?=
 =?utf-8?B?dTdxZDhCMGJnT1pNRUlLcmtWSVlIZFQ0THJQZ2xEakNpeE96Yko5Mm05ZnRY?=
 =?utf-8?B?S0ZEbG9YRFAzMFkzYXArRWo4b09IMzNvbUtlR0pjdFIrOTVmb2tJMlZPMjR1?=
 =?utf-8?B?NE5FbmdnZTE4dU9ZVUErNkVzQWpzVVk4RXdVbEJMTWxFeXcrWTk2QllOZkkr?=
 =?utf-8?B?ZGQ0c0NZbVZhZHRiT2NId01ZS1hVNHJxWDR6U2JNVnVIZUl0bThRZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7334c5-af94-4479-c210-08de599748b1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:19:03.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvuuLiupbAG7C2Uv/QJ7Z+gIZwaz/JKwiDTwEtQorBSFgZZgTwVYWY73ktex67zHhYvMmhiUnFTWlRku1FYEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7253
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,suse.com:email];
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
X-Rspamd-Queue-Id: 8F9B4646AF
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 03:39:30PM +0100, Jan Beulich wrote:
> When this was added, the log message was updated correctly, but the zero
> case was needlessly checked separately: hpet_broadcast_enter() had a zero
> check added at the same time, while handle_hpet_broadcast() can't possibly
> pass 0 here anyway.
> 
> Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Similar to the previous commit, I wonder whether it would make sense
to add an ASSERT_UNREACHABLE() if that error path is not reachable
given the logic in the callers.

Thanks, Roger.

