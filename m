Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDwzCijWrmlhJAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:16:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DE23A59B
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 15:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249525.1547002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbOW-0006jH-1I; Mon, 09 Mar 2026 14:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249525.1547002; Mon, 09 Mar 2026 14:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzbOV-0006gz-Us; Mon, 09 Mar 2026 14:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1249525;
 Mon, 09 Mar 2026 14:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vzbOU-0006gs-3p
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 14:15:38 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70cbc5a7-1bc2-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 15:15:36 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA6PR03MB7830.namprd03.prod.outlook.com (2603:10b6:806:42a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 14:15:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 14:15:29 +0000
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
X-Inumbo-ID: 70cbc5a7-1bc2-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUVf/R6q+LHYBCiF9piyj1uuWEH+7m3ElnZjC4Eokc9jq2xwdcUxjT3DJ0HkbDS+JUpz7mJzxjzyXDPWoTAKpTJINOzI6EtyT0ewa9qFxhVpjkM7kYrfkEViD3jCoIjEqezi/LVXQLfduW29eJT7M/WLDAXNOZ1Zhxboo478vfJfhXwLdBQwfJtfgJ/ULKyD9C38F/2qCPboY9oipwYe2J3LZ3HwZoP67tZ8qqBKj0+XoOYEDUZLfNzwOcI9XY/JfETnbYOGqWJQwdYfYf5Ej6H58a7ABLn+rbzJ35FzV0nwvyTn+9Yle3AqGW6gL5aQ3liCzDnrA3eiTWK48/F97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80fCUVdzrqGKZAn6+lCyvIb3dy6nmA1vd/zWivUKgGA=;
 b=f9K4R/leup7uDzOoVoQHyGvqz4rnmgzYh7DY0HWp3set9J55YdR3HqntDqHd3LB5HB0fuSyy+jJJ4YR//giBj7j4jWWS9HP63v+k9y1MB/at+Z6lBn/dZ963W6iTgaUXVGWp5a27pBs78ne+vqw3nVwXAH0YNknuZevnn/CO13yoOxTZXNmbOR8LewBuyVqd2Fom6wADDCFu1Dbu+fOw/t20C4Q87xU+V4i0oJ3biJAVwquYNJ1UhWvqutTnIO16ydXvqN7ZBqdlFR5zrols/kBV0hbshcl96/OG0xOGu8lfvDNfHEz6owUWwO+z2mdEIpW0QnsKMMSqjazaDVcbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80fCUVdzrqGKZAn6+lCyvIb3dy6nmA1vd/zWivUKgGA=;
 b=zmiT2dquSlEUM3kCcD4oRK1j7FtGsGo2wEmNbC4RB9DJeYu5bpzZs7oHkQZcj7YfPFsrT2S5K4OTCTqcPUSqhjhC4l5xf3nAAbdHZ99YWCNe5d1j0WM21US5oJGOs/m9UyAVuP8xdgYH9CjCGgjRCk8qbQ+D78d8gW0FFGyVHVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Mar 2026 15:15:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Edwin =?utf-8?B?VMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
Message-ID: <aa7V_nOG0ctnjxH3@macbook.local>
References: <d0178858e5f3ff7a8b64e822b55c6179adc92ea6.1773052835.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0178858e5f3ff7a8b64e822b55c6179adc92ea6.1773052835.git.edwin.torok@citrix.com>
X-ClientProxiedBy: MA2P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA6PR03MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 986a7618-eb85-4f7e-c607-08de7de65123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	kjnGVeKdISmXwx1mK2dlriFjC6uZ86cQZl8jgWT159efEdjl7IRyBFwKxhMG5l54i4qAiPY8b+OJP2RQsrEUYkOM/F6rjNXplnmL2a+FAKgzYOkfS55wCMPQVu7XamHwoaxON39IEaXhsXYBoAL+7NBmtX72hscsYBiCGR56GmWpslKwT4jMRvkV2b+Pk0CRMz8suwIPzawigI8T+xw+PmeKXosxJMhuZ5yuxTnGRFCwjA37+zKGUYaHpwKHp7aZB/SjvcE57y/dgFGThj4ZgUxSHe9YJ1RN7/W6YRKGdIAsHgEkmYnBaVVnKA7CzgjFXCTNuepzBkVpeeORmbhWyxQzVc7G9En8HFYvQR+NGaZAXWwUznHaTymZkIRDLL/rd46vvw+Km84RgXgm9iS7Gj7Ji13j5C5PNmssfZDByELypEdeRwSI/nYB6BNZ3USjAFVrnyZIipu8wKR22kaA1qYfji8+l3R6aqjT7+JWS7vO3hJ0Y1+BUifaJpGoPFuiaQI1xi26Xeve6dU49zJgmKfsrbm7wTs7Eyq9CfsFTWmpscsq0exS2EKhVExPdCDgdme+0Wc7LJn8J7jUq5+eDEIejlvmAx1EwZZ1SfuK+rmmnJMt6LLcrREtzfAsPJqtKW8x5FsPAWIe2ey/DlEr9fbdzu56OrDl2e51YzYdUP07SmkSnsdMKuYe3tp6Qba+aM65QMDjhY9KBqMkJ8YTprEEsx8zjRYFFDQy2tbRVac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU5NZHFrUVRENFNTNzA0cnAwbC9BQytzcDlUMFBKY044LzNwWSs3KzNpbVU4?=
 =?utf-8?B?dkNHOCtXWlk4ZGVhbVZWSCs1TndHMWVNaHhTdDRtYU9oZWZtM2hRRlZnYmVX?=
 =?utf-8?B?MmorSEN2U044QkJmN0NMZGZKY081dS9QcURaYVF6R2NLWUNmK0NKK25BMWkv?=
 =?utf-8?B?bEZaY1k1cHFPeFRVR0dRQ3VwU1MvQjlvQTFqTFA0MDNvNHBMOWhnZUVTREdV?=
 =?utf-8?B?VmFXTlFuL0tSejZQb1RDL1NGUjBXUWtWNysza0liUTZaNEo5QWNjTnN4RXhS?=
 =?utf-8?B?ck5ZbjI3VHNoWklhOVA2SWc0WFlJQVJFRVVVbkVoRDBiQndwZy9YZmNOTzF4?=
 =?utf-8?B?MlZGRVFwUnVocy85VXlXcUVYMEpJaGdoSVZIcUs1eFFBd2lmckQ5bGtjOFBh?=
 =?utf-8?B?YjBxdlkyL2g0cEdtbzdsZ01ZdXBxLzRMN1hWa1hpbE96ZmJBWVpqclpDN1N2?=
 =?utf-8?B?aUQrQm1rM0x6MFVxdkZ0eTVvWVp4dUU3TWFqZ1YrNytNNDRmVHlVUnhBTEVC?=
 =?utf-8?B?ZitEbG5HcktYQjM5SEJmWWdIN2c2NmZoeENTaG4xWUpWdHZSOE8rYTAvZWl0?=
 =?utf-8?B?MVdnY1F4QTE5T2hSenpKMlN2TG9qN05wY3p2b1VTQnliZWZLa3oxeU11WU1Z?=
 =?utf-8?B?TVNEcDAvUlhoaWNZMS9wU2JobjlkRENRRHlxT3BoL0E4UzIrcUkxMHRSVUFi?=
 =?utf-8?B?QU5YdHVrMkxON25xYTByOWgzNmZPekpvWGhROHN4WWxPb05GQ2twLzUrMWtD?=
 =?utf-8?B?MU9udFpOcER5RzlGRm5aK1Q2QmhKR3FmOVZvdjdKYUZjWjR1NXVDb1RoQ2xW?=
 =?utf-8?B?cTVXV2duMzhhSmVhU2VEajdaWjkrYnA4c3ByVENERExJWVIzT1oxWThlcGRR?=
 =?utf-8?B?TzRRbUZTM0IxaWFZOUpPRStVOVR1Z3RMT0hmR1FUTW5wZlozVXhnOHdZNUhn?=
 =?utf-8?B?Mm91WFI0bWJvMzZlWlIzaW9nb0l0aklGU0hkcUZoS1BrMEgrSU8ycGhBUU5D?=
 =?utf-8?B?ckNaN0lKZkM0b29YWWlWYmE0SEFYczZCdnNMT0ZYQ3RXSGJmWVlpZzNlMDd1?=
 =?utf-8?B?VnpYRERKbG9XVTRpZjlxNWYyK21DaEkyeGxGTGF6a3ZqbDR1cWMyK1dmTXZB?=
 =?utf-8?B?YWhIVG9ZTjdCU0ExaEpHUHljWVkvUWRIQ3pXQUdGbUkxNGFzQUZ3alp0OFNn?=
 =?utf-8?B?WDkvWWdnTUVJcWlZTEQwejdMV1Q1SjBQbkRzSU44MXBJZUVEc203bXJWRHBH?=
 =?utf-8?B?NGpTUGpXTkM0YllYNXJCVXlKYll2aVlxS0NJY3FxUU4zQ0xzeE9PQnZnZGNk?=
 =?utf-8?B?ZFpiOWRieUQ3QXhnTWdHeU5DckRyRzlIWlJtNzEzY3pmdXlmcFFLZVRMMkdo?=
 =?utf-8?B?THc1Z0tidXF4YWVNNWlRSWxPblRjckJoTmRlK1FUQkkrZWs0NzVmRGZxaEZQ?=
 =?utf-8?B?bi9ITC9rOS9YTnkvNUV2aDJjLzZ3UUZOYUxEVm5WLzhuVHJLb1RLN0E5MnAy?=
 =?utf-8?B?bHlrci9NMVovYnB0eGpKSllUNHg2V3k5TXVuYWRNZXlUQUgvVkppOVpUMVhJ?=
 =?utf-8?B?YU5ZQ0NCamRHaVZFWmc1T2wyZW5rc3hVODUya1VrM1hhS2hJR2x2YnIyNzd0?=
 =?utf-8?B?R2svOUswUVdpcld4YVc4RmpHMTdBZ1hVbiswM3BHcHlUZTZMZE9YM0Qwd3VQ?=
 =?utf-8?B?L3NUaVBaVEVQV0pZaFgzUnhzS2RIUUhScmtYZWpxSHYzOUk3Q2FkbXQ4UTZZ?=
 =?utf-8?B?TlhPc2Iza0ZuRXJSbFQvcDIyc012aHd3TmpqMGxENUhMMkk5d2I1N0RmTXJz?=
 =?utf-8?B?VTF3UlM5UDdCWlZNbStPMHNhRWJhWExaangvOXRtMFVSb0lpMmI4ZlRjYklU?=
 =?utf-8?B?d2Y3OTB1bzBhRmpLbEttNTc4NDVSMCt0bUE5U3BON3RnUVNMQmRxa0Z0VjJl?=
 =?utf-8?B?THNDQU9WQzBkdGJscTNmYlVrRUh5Umt6WThmdzNOQ1NPQ09CZEVuZjhDVVRY?=
 =?utf-8?B?Z1NVNnNPN3A0TUF2SDBtVDF5eTArWGNKellTYjk3SGlRa2taakFuc3A5Z2RZ?=
 =?utf-8?B?dFpyODdKKzdYNlhOWVY0NDJkMkFuaHFRN2tBeXhITjhidVFzZnQxOENzUmVP?=
 =?utf-8?B?VWJMMDRGaEZiMWhKSkdTTTlBL0FKeXdUU1VSOUdmckR2ZXgzQllZLzFnUUxk?=
 =?utf-8?B?NXdvZmFrZ1JtU0JFVnRDbFJmbENqRGYzZmlPaFdaYnFEeVFsdExhbXdmYmZN?=
 =?utf-8?B?bERjYlJ0MDRDRmR1WlZUZlo5clduVTJLUSs4S3JHTWsxMlBzSjFNS0ZjWHpS?=
 =?utf-8?B?eEZuL0pBMGJRLy84SWNJK080K1pRT01PR3lLYndHSUpVSjZteFhaUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986a7618-eb85-4f7e-c607-08de7de65123
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:15:29.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV2JQ7RgZMvrxFy4dmr0LLpCGSoZUkwdlck4HpgJ8rmbn7CCyJXFSGct7zy2CBvIqI8JjtAsGwYmMLs5bXka5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7830
X-Rspamd-Queue-Id: 847DE23A59B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 10:41:35AM +0000, Edwin Török wrote:
> clang would duplicate the loop body and end up with a double definition
> of the symbol:
> ```
> /tmp/test_x86_emulator-0f3576.s:27823: Error: symbol `vmovsh_to_mem' is already defined
> /tmp/test_x86_emulator-0f3576.s:27825: Error: symbol `.Lvmovsh_to_mem_end' is already defined
> ```
> 
> Until a better solution is found: reduce optimizations in the test runner.
> 
> Using -Os might also work, but we can't rely on the size optimization
> always avoiding the duplication of asm blocks.
> This is test code, not performance critical code, and -O0 is more future
> proof.
> However for debugging -Og is recommended over -O0, and this still
> avoids the duplicate label problem.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>

Building the x86 emulator test harness is currently gated on:

ifneq ($(clang),y)
SUBDIRS-$(CONFIG_X86) += x86_emulator
endif

So I think there should be a further patch (or done here) that removed
this check.  And then we should also run the test harness from one of
the LLVM FreeBSD builds ideally.

Have you tested with a full LLVM based toolchain (so also using LLVM
linker?)

Thanks, Roger.

