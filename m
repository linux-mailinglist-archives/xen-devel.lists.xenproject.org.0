Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF7BA66BE8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 08:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918553.1323197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuRVC-0006gb-QW; Tue, 18 Mar 2025 07:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918553.1323197; Tue, 18 Mar 2025 07:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuRVC-0006dy-Mr; Tue, 18 Mar 2025 07:36:42 +0000
Received: by outflank-mailman (input) for mailman id 918553;
 Tue, 18 Mar 2025 07:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAjx=WF=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1tuRVB-0006ds-RL
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 07:36:41 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9652404-03cb-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 08:36:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52I7aYHu018933; Tue, 18 Mar 2025 03:36:36 -0400
Received: from XCH16-09-11.nos.boeing.com (xch16-09-11.nos.boeing.com
 [144.115.66.160])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52I7aNrW018874
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 18 Mar 2025 03:36:23 -0400
Received: from XCH16-04-10.nos.boeing.com (144.115.66.88) by
 XCH16-09-11.nos.boeing.com (144.115.66.160) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 00:36:22 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-04-10.nos.boeing.com (144.115.66.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Tue, 18 Mar 2025 00:36:22 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 18 Mar
 2025 00:36:21 -0700
Received: from SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:199::17)
 by BN2P110MB0977.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Tue, 18 Mar
 2025 07:36:20 +0000
Received: from SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::aaa7:3b2a:5a62:ceef]) by SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::aaa7:3b2a:5a62:ceef%4]) with mapi id 15.20.8511.031; Tue, 18 Mar 2025
 07:36:20 +0000
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
X-Inumbo-ID: b9652404-03cb-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1742283396;
	bh=BiZyAE7pOivKfsVqvhNN+6hIm0T4UB6wFg5v2xXOHqg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mnIUBHd7PkRgP5n9C1Q74pHwJUysRXl+3OoKNof+6E4IGjDdnkVpDCe/vCbHrABsg
	 hmDXDolSK3JgnSuIyZ4Kw33jbSdgLlxCb15phLYPHMNlo8Phb8sZD3mZ9tu0O2AtLh
	 J0KpsN5gEXud+81M8ts8NHPnRm2Q7Ns/GfypnqBEMgmYPpetb7GYi+8jA2B0Oyrkl5
	 clr6JEpir+6b9iq6BEf5Cz2e/Lw8g1NchtEoI9tyInrrF9W1gxKWlE1l7jE76RoKXP
	 6dxI/wQx5sS4X8yWBcKgyRK0aojztrII+3G+iATBpS8nzRVoek95RiAV8zqDBopE5z
	 DN0O6jaqahHGg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=a9kXNp689tV9cX+XARFhNYiVsDzAm4cCvvM9cLRkZDGlrgFclushSWSCPH7HYOWV6mMRdll96xtIERiPKdWGy+ufUeZwi/CS7A1BPQ2xPqJlc5apDApRnd3wcTcvi4zPVTNeB4xYr0XH0H91zUfHLGGATiuXjT7w6NeS2RiSkoMJwmDMm77B6+vApvw5AXYhhoa3XC3itYmSRH/yeoddjZXkHP1vFy6Bp8mEQvx6zoUYoa979igMeCBi360KxvwpN7F8h4wmOiZufvWKoEduYWqm8dHdXBDv1C6mAc8H56xSuSPl+qmRxHPWT24zFSd66RG6qfAHndRBsffwBe27FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiZyAE7pOivKfsVqvhNN+6hIm0T4UB6wFg5v2xXOHqg=;
 b=IxKx9Yla6kGV8NnduVaXtUf/3DLUbnqFuIRUBs4lJcbDqnY9c9fUQOL5OdUEWYRGPo47Vn66iNm1foHkn1tRIIfNZ7bLvExXVzhprPcCl+am74yZr6qouE1fqfTgmXUfxcsNKLl/EWsENOYLnwMFninAd3mmQAbCe+oyr8LmbOxvVt0ZKImbYfF7qd9dpQi7TnryPpbCKzy28FnjYT7jnn1hQoyqRcHd9+5YSPFX9azrHMMPalb9SvpR/6na4iGfs4nMHnPEZ96J3HNsovXvUxxtbl4AS/OMwYITUjXk0pvlhYYNhfiMBmXJRzdgcVwCLrGKRWwU/X3gPcSgSWEB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiZyAE7pOivKfsVqvhNN+6hIm0T4UB6wFg5v2xXOHqg=;
 b=QpaPQxUF8l72hbYGxrfGqf56w7uYtRtZcpoR+JccbSxJEk5pJleA7dX1RdDKqEqU0KCmStgMGGQz9KdYbfEAh/u13E7VFWFGWBQep/1r1Nzg8+344oKZfya72aFxkk5mkesW0v8hvyyXDEyx+W3hip0mnZ/K71RUToKzqs2uEmA=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
        "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "jgross@suse.com" <jgross@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [EXTERNAL] Re: [PATCH] xen/sched: call xfree() after local IRQ is
 enabled
Thread-Topic: [EXTERNAL] Re: [PATCH] xen/sched: call xfree() after local IRQ
 is enabled
Thread-Index: AQHbl7pa8XYzyg5nXUSh7JnHLN6wiLN4cbiAgAAPYpA=
Date: Tue, 18 Mar 2025 07:36:20 +0000
Message-ID: <SA1P110MB2155A80CDCF7E5E7F520EF0790DEA@SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM>
References: <20250318040023.4998-1-anderson.choi@boeing.com>
 <07bd83b1-8c59-4bb8-ab1a-a3b9a6bb7cf6@suse.com>
In-Reply-To: <07bd83b1-8c59-4bb8-ab1a-a3b9a6bb7cf6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2155:EE_|BN2P110MB0977:EE_
x-ms-office365-filtering-correlation-id: 7fd3a23c-e959-4082-3f7a-08dd65ef9375
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VFRicURnUkZ4aGhGd0JtMWhqdHo4MUJHQWtTT2NtbW5RdFR3d2JhenpiNFJQ?=
 =?utf-8?B?RlpTUm1tazhOUm1TbVRSYVhKUUZoY1hrTDhNK2xGYnJRWjl3ZXQrSW1hU1Fu?=
 =?utf-8?B?WHQ4Z0JVeDB0T3lyYTRHdFlzUFAzZkYvUU5uaWZhRFJRYTZBRkVHRGU0VmNO?=
 =?utf-8?B?UUl6aEhmMWdzbGNKRUhvUVMweTFDYW5ERW43OWJ6WkpkZWx2Y3dQZ2NLN0lW?=
 =?utf-8?B?T00xNU1kbEppbjNRMEFUVjIvREV5U1Y5WHllc0YraG4xUkpBcWp0V1lRUHVk?=
 =?utf-8?B?V0FoVmxGOUFqcFRmd1NHdlFzdnpJaUVsa2FOdzVjZElYb0hqQkszb0Ewcm9O?=
 =?utf-8?B?ZW1jS1Z5L0lXUTlqMXczVWRGWktVaU1Ja2lVdE5jTkdUL2phUVh1ZVlXeEtZ?=
 =?utf-8?B?SnNNeGNZSlVIZDZsNjFIYlJ5QTBhTWlpOFY4TjdiZWk5Z3pUU2pUVmF6N0Rl?=
 =?utf-8?B?VTF2eWM0VWdPM2xJeXpoQlphY2xjZ0dwQUJjUFNqQzdhK0liOFovZWpLMlJa?=
 =?utf-8?B?Z1FjRXZhQ0xKRVJaZ3dybDBiYW9WNyswZFJnNnZTcDBpZFcydXU5RkV4Q3NY?=
 =?utf-8?B?U0RWZ28zdWVXSWxjZHJiVkhHOVRQZFdyayt3RXZsZU5valFUT2VkT2hiVzha?=
 =?utf-8?B?WTU0MjVBM1BVL3pwVTBKM09ZSTQ4Q0lEU3BrUEU2ODlPL0xIZ2xhTjVqTjBB?=
 =?utf-8?B?d2swYUUwUndmVXFOWWs4aGRLQTY5ZnFPdzFXckZMbk9kQ2U5ZnF4NlA1cXFH?=
 =?utf-8?B?ODZxYldKUVFnMkFjSFFwQ0JYMm1OZU1Idzk4amQ4RmhSSVkrdnppRzliN3Zj?=
 =?utf-8?B?OWpNdy84NWMzV2tkc3hZOWx1d0lGOHpodFdQa2JTQlptRjZiZm5hWEVLdHhu?=
 =?utf-8?B?dkYrTFVuZ3R0RVAyN1h4OThVdjBJeGpNZ1dYTU94UjkxNFBCVWQ4OVl3a2hC?=
 =?utf-8?B?S01vU0h2YTRHaFk4ZjNvSVVIRzRCWUd5OEhLbHRPeXpuVmVGYnBNZGVmd1Q2?=
 =?utf-8?B?WmVkdmp1bW1IOUhtdzR1ZTA3MFhFTFZUS0drb3VqUmw2T1NzZHYrTVZMOVhM?=
 =?utf-8?B?VityTzZoOFFtNUtMaGNleCtFWS9NRTRqcUpKMWZtUHVGdFVjOFhXdnkrWHZk?=
 =?utf-8?B?NEZpMEtWbU94M1FyRnRLeTJLMXFLT2JnNHNWQTlIVkppZzgybkpOeFZKOWRz?=
 =?utf-8?B?V1k1OGVtLzhjKzJrNUc0SFBQbWFrendvbkR3UEs2QUtkOVR5emxWcDVZanhz?=
 =?utf-8?B?cW9oTFNaRzhxQ05NdkMvUWdoMUduQnpQa2syalFkR0lPVHBSNmZ5WldWdVI0?=
 =?utf-8?B?S2VJY1pzOUVncGlrNUhybGY5YmZ4eTVQZmc1dzNpZkhsVlZSZlFyQ0dyT1RC?=
 =?utf-8?B?Ynlha1JtVnZkOUhCQmpRdzV5WkVGRUhxbmdBYngwMWN6Z1JwcHdZSzRQYWxY?=
 =?utf-8?B?TUVyV3gyZjBKRmxZLytDRTI1VTEvK1U3bGhVU3pCVGxGblptd1J3MVVjQVpR?=
 =?utf-8?B?dDRzSWZrZC9wcjIzNWlSMUErZ2ZJSGlhYjVOS1luQis2M1VMSWQ3Rm01M3BB?=
 =?utf-8?B?U3VLMW0rYmNXbDh1Ujd3VUc5UWZ3TlpQQXN1L1NvOURHOFlUY3dHZUU2UVpZ?=
 =?utf-8?B?KzQ3WCtYdHJOanVuTjd2SWtOTGUyZFp6dm1OVnpDYjFZcWlpeFJhanp4dmtJ?=
 =?utf-8?B?NGhDZWRrU0dPRkk2RDRNa2pZS3BFNXJQYW1JMU45K2Fxa1FaQU1NVzNLQVpn?=
 =?utf-8?B?Z3RhaUkyTC8rWDdGMjdqK1IzSEl4WDVETUxockxObnAycm1MZGRBNjBGblJv?=
 =?utf-8?B?K0hEbFE2Ni9HNDNrRWpGVlZQajFPWTZNNGJxa01sa1NPT0xQK1U0WXlYa0ZJ?=
 =?utf-8?B?akt1ZVNieEtzRE4zZFhYUmxiYmZEOW8rbnE4LzEvaTdxcHVrU2tyN0MwZk5Y?=
 =?utf-8?Q?30TTfrV8jMOoKPHSc+sQGqiCpH15yLit?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGZhVE44NVdnb3RpdW0zdkgxREVzU09rVG5obTZUZm9ZS20zNVNzRUQ1Y0FV?=
 =?utf-8?B?RHpWNGxFMG45K21XZkwxU0JVUEV3WEtUOWFSaDE0NnFPd0I1Z3FNZXFVZEY4?=
 =?utf-8?B?RDgwUWlIdHNKWkNBNFZSS3Z4UTlrT3BXMVZpZW0wK3FRdjBvbjQ3bnMrelZQ?=
 =?utf-8?B?WGdwSGpHVkozTWNxSElXeWpTdmJaVjArdGtsZDBta3VLdDNHSkIxODlLR1N4?=
 =?utf-8?B?dlFhbjVMakNmMDlwaDdsUzNjV0dZQlhCR0FzaWZKbDF3MW00Qk43M3NSWmJD?=
 =?utf-8?B?aGlHVTZQU2RFMHJBbFRaM2RIR2h2MTg4cWRwZVNWTE43U2cvSENIOVpUUGNx?=
 =?utf-8?B?RU44MEhxcHBlSWNzNGpsaE44REpsYXR2OEtmNmNvT0pxUXpkZ3lCZVpDVDNh?=
 =?utf-8?B?YzI4TnNpZjl0UnNaYlJzUzJzaTR3aTlaVTRwWUJ1R0xGZW96V2VJT1J4em1w?=
 =?utf-8?B?cTkxS3lMb1NnNTRJaDI4WUdWdVVhZ0dFcVhMK0I2N0lPajJxNCtaZHBGdWEy?=
 =?utf-8?B?RW9GNmN6NllLR2ZtT090MzE5bFh1QXJHZUZ6YkJZb1dhU2xKbFdBc2U2Zzhk?=
 =?utf-8?B?MDJrVURldXBGU2J4M3RyYnBVK1lOQ1lTUFc5bHFvTEFEUGk3bFdmcEQxaDJZ?=
 =?utf-8?B?cStseHBjNXJNSkQ2TXpZTFpiSUF1TlNtTUh0dytyNkp0dDBha1c3bC9tREtI?=
 =?utf-8?B?T3k5WFRUNkFHTEdXeW9FR0ptK0gzT2pBTG5PL2FnemRYaE5OdG8rSnd1Q3JB?=
 =?utf-8?B?TXc1MUlJK2Fhd3pnSDJvQkg5Kyt2OUU2MGRJZU1ZWVJMSTJIZ01DMlhCYnNV?=
 =?utf-8?B?RUh1ajkxVndqaXhHQ05WcmFGSEtMNkJuUHdZY1h4eTFqM1YxRjEvaVN1bmlp?=
 =?utf-8?B?M0NSWWorOFJjaW1RMXlsMHdZd09rNklaQkU2amNXcmN5SWFEZWlKNkVmVGds?=
 =?utf-8?B?NE5rMWlJQ0JWWXU5Y3hDeXJOVE5mSDVOVDdsbDl5YzRxakNKQVJqVU9mL3JI?=
 =?utf-8?B?VEx2S1VRajVJZW01dmRXODQ4bzNxVGxiQWowVEFjRUZZY21aWnM0VHFON2Y4?=
 =?utf-8?B?R081MnlGYllDWHdhYWNSL1ljc3dPZy8wYkNkNUlJRWxwOXZFRTVqdDdsdTJj?=
 =?utf-8?B?WWoyZUQwVEdLTnhIdmY2NUN4a0Y2NFpwRjNNWXNsY2locVpaZ1NKemtOVGhq?=
 =?utf-8?B?UTZnQWRySEwwZ1VTOU1tU3NhQjRCTm0xYXBVZGk1K1F1NHowUFFjNUlTM3hS?=
 =?utf-8?B?NUs4ZTZOa0FETWFYQ0lJQnM0dDNkYWNBcDIyMFZ2alFDd21xSUN5ajBFVVR1?=
 =?utf-8?B?bWxzR1Y5cElONjFtblpnelh2ME0rUWt1QTg2UzRUNEJCUUN5b0VXYnF3TG9Y?=
 =?utf-8?B?TjBJa1FTOWpmZWk2Ujdyd283ZkN5NXJYeVBheWZhTnN4WklQSzArQzNvbzls?=
 =?utf-8?B?UmVJVEdrWmJ2eW5KeFgyV05HaEtUUUlxQ3JRWEY1dEFZKy95NUNFZEVNRHZh?=
 =?utf-8?B?ZUx6dUtFQjZIMldnS1lEMWJrQ1huQWhzU0hsWHg4T1pvMEc5cVhiKzdUS0NI?=
 =?utf-8?B?QjFiTzJOLzZaamJoTEVjbVNjbVcxempOZUR6SEtJcmhoSnZJVXJrUm9CN3VG?=
 =?utf-8?B?WXRGYnJ5L0JXZWRBZlRvdm9ldFBJME0rNmhwM0tEK29Xa2R1RWwwWk9LT1dD?=
 =?utf-8?B?WStFaDIyTS9tN2haWXNHcFNaaEJXQkVxeUMvcEVnSEk5WXRablpXMXdLTlNC?=
 =?utf-8?B?eENHRjdpaHhtd3lVMFNqRDcxbkpZeW53bHdibHRXOExMNXpOMHBtbG5aeWVT?=
 =?utf-8?B?UUJjRkdsR255Q2FTSFlBUlZTSlBpZFVEc21BV0w3eHNQajd5VEFwQVhsY3BY?=
 =?utf-8?B?MjhDUjFQSmxPVC9hSm1iMFl3a0ZkbEJxTjFnaWxTYWV6aVhzcitNNi9NTkR5?=
 =?utf-8?B?WkdpYjA0K2FKWlVZa0s1dUYxRS9oT2JEMHlEUFcxd1JDY2cxZk9sbHlWNmlv?=
 =?utf-8?B?cHo2YmxqWjlRQjBKQWs1ci9aZW50REJGTmRmU29oMVZGaXBpOUxUam5HdkxG?=
 =?utf-8?Q?CszTDR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd3a23c-e959-4082-3f7a-08dd65ef9375
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 07:36:20.1574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB0977
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

SmFuLA0KDQo+IEVYVCBlbWFpbDogYmUgbWluZGZ1bCBvZiBsaW5rcy9hdHRhY2htZW50cy4NCj4g
DQo+IE9uIDE4LjAzLjIwMjUgMDU6MDAsIEFuZGVyc29uIENob2kgd3JvdGU6DQo+PiB4ZW4gcGFu
aWMgaXMgb2JzZXJ2ZWQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb24uDQo+PiANCj4+
IDEuIERlYnVnIHhlbiBidWlsZCAoQ09ORklHX0RFQlVHPXkpDQo+PiAyLiBkb20xIG9mIGFuIEFS
SU5DNjUzIGRvbWFpbg0KPj4gMy4gc2h1dGRvd24gZG9tMSB3aXRoIHhsIGNvbW1hbmQNCj4+IA0K
Pj4gJCB4bCBzaHV0ZG93biA8ZG9tYWluX25hbWU+DQo+PiANCj4+IChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+IChYRU4pIFBhbmljIG9uIENQVSAyOg0K
Pj4gKFhFTikgQXNzZXJ0aW9uICchaW5faXJxKCkgJiYgKGxvY2FsX2lycV9pc19lbmFibGVkKCkg
fHwNCj4+IG51bV9vbmxpbmVfY3B1cygpIDw9IDEpJyBmYWlsZWQgYXQgY29tbW9uL3htYWxsb2Nf
dGxzZi5jOjcxNA0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKg0KPj4gDQo+PiBwYW5pYyB3YXMgdHJpZ2dlcmVkIHNpbmNlIHhmcmVlKCkgd2FzIGNhbGxl
ZCB3aXRoIGxvY2FsIElSUSBkaXNhYmxlZA0KPj4gYW5kIHRoZXJlZm9yZSBhc3NlcnRpb24gZmFp
bGVkLg0KPj4gDQo+PiBGaXggdGhpcyBieSBjYWxsaW5nIHhmcmVlKCkgYWZ0ZXIgbG9jYWwgSVJR
IGlzIGVuYWJsZWQuDQo+PiANCj4+IEZpeGVzOiAxOTA0OWY4ZDc5NmEgc2NoZWQ6IGZpeCBsb2Nr
aW5nIGluIGE2NTNzY2hlZF9mcmVlX3ZkYXRhKCkNCj4+IFNpZ25lZC1vZmYtYnk6IEFuZGVyc29u
IENob2kgPGFuZGVyc29uLmNob2lAYm9laW5nLmNvbT4NCj4gDQo+IEp1c3Qgb25lIG5pdCBvbiB0
aGUgcGF0Y2ggdGl0bGU6IFRoZXJlJ3Mgbm8gbWVudGlvbiBhdCBhbGwgdGhlcmUgb2Ygd2hpY2gg
c2NoZWR1bGVyDQo+IGl0IGlzLiBJbW8gInNjaGVkIiB0aGVyZSB3b3VsZCBiZXR0ZXIgYmUgcmVw
bGFjZWQgYnkgdGhlIHNjaGVkdWxlciBuYW1lLg0KPiANCj4gSmFuDQo+IA0KPj4gLS0tDQouLi4N
Cg0KVGhhbmtzIGZvciB0aGUgY29tbWVudC4gSSBoYXZlIGp1c3Qgc3VibWl0dGVkIHBhdGNoIHYy
IHdpdGggdGhlIGZvbGxvd2luZyB0aXRsZS4NCg0KW1BBVENIIHYyXSB4ZW4vYXJpbmM2NTM6IGNh
bGwgeGZyZWUoKSB3aXRoIGxvY2FsIElSUSBlbmFibGVkDQoNClJlZ2FyZHMsDQpBbmRlcnNvbg0K
DQoNCg==

