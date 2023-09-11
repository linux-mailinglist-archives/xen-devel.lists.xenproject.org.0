Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C30079A717
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599225.934543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdi5-0006F8-Ig; Mon, 11 Sep 2023 10:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599225.934543; Mon, 11 Sep 2023 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdi5-0006CG-Ft; Mon, 11 Sep 2023 10:00:01 +0000
Received: by outflank-mailman (input) for mailman id 599225;
 Mon, 11 Sep 2023 09:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qfdi3-0006Ao-E6
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:59:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6312079-5089-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 11:59:58 +0200 (CEST)
Received: from mail-sn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 05:59:55 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4994.namprd03.prod.outlook.com (2603:10b6:408:da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 09:59:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:59:52 +0000
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
X-Inumbo-ID: f6312079-5089-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694426398;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lrlhVIWm5y5heiCQhO7jKJlpyWr9NUgj95emm4edy0s=;
  b=YEEWvuwRXlego/A7f9fXB/9yWaath7j0GzZB3uvQOmiIvSRhfUkgqRPf
   A2CpKpyEJLKvbKk1sEEM3NLdo5bFbY6+AlKEmbPKUVePMLWh6g3VPnn8K
   HsV8+mbq3so7gAGGkbUQeuI0+fZt/xMpInSU8Y4MEAeCMor0Lp7PSU5C2
   c=;
X-CSE-ConnectionGUID: sdt6kkT3RJS0odtZSIg/ug==
X-CSE-MsgGUID: poki8Lx6RyKjUNRZ9o84jA==
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 122660808
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tNERt6LESFYrCteZFE+RMpQlxSXFcZb7ZxGr2PjKsXjdYENS1GdRy
 mMcWW6OOPuMMDb0eYwgPoS08klVuZODy4QwQFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wVmPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5sDX0Q9
 v8kcwovVUiEi/6E+5O0DfRj05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWx3mlBtpCTO3QGvhCmFqQxzw3GEMsRHi5nN+DuB+5C45dA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97WmlyLfQ4gufLngJSHhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hSy2ETgYKykFfyBsZRsI5ZzvrZ8+ijrLT81/C+ilg9vtAzbyz
 juW6i8kiN07j8cV1uO+8ErGhTWErZzOUwJz7QLSNl9J9St8bY+hIpeusF7S6K4aKJ7DFgXf+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5dEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:WFtD2aMgI2V4fsBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-Talos-CUID: 9a23:axCECmztiN2/Qc6yIGIXBgUPFtx7cX7hl03yGBe/BXpbc5yaDkKfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ANcO/sw3Wh/uwID8BfT4KMsegAjUj+6OtCRApgcs?=
 =?us-ascii?q?8quqGCApKCWaa3Gi1a9py?=
X-IronPort-AV: E=Sophos;i="6.02,243,1688443200"; 
   d="scan'208";a="122660808"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc3bUoUKb2njMwA9wTBOTEzrKV8DTSoy275aR4cjapyWeTknQ5VF1ehtFJN9awbZgv9V3VkrBHddnjtqycKtfOHJSGopUoDWOnP+3UUJ8qc0Y2s7tZoAdtocZr+eZJieeoKVSP0MDiuersmxyarztuNOfq3wzh+UtQrGdxJkM0NzLeSZU6mXze6ipHgIWfG/cZFfzBwpuFniDf+eFUuX+E357B9WcRNMKcqxAVNzMM0h39A3XI+/CrszwhsJ5fuWK+H3kAdasaWrjpDcWJFD1mB5CL4xDLj/tQtbWyX4tBe7Oo4QmVlEz5zpt3hYFblQLwblkG4z0cQk/BOfLJMQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga+XuRzbufw66ZoM84Ke2eonqarSoIkRltvF+VB1wck=;
 b=muilFuK84OVQ7klE90jHf7RtvVv0XrXQ4bw8pt32nt/AIOhFAXg3VMk9Ka5k2dQDqXRpIcNBqriYvpcx63rLvk9a9WDIvg9ItUijKQjN8sl0F1NwMgiZhOd/kVfoHK0kPWPCt15Rhe9gZf/ltthPKzbUTyofslZQzOKbMAJh1ato7xgY83dMxxZfgaX+CnlIhskm4Dp47PXoLoe66ZLOLJe9kpBm9NXVi7BA4lY82f2FojlN66TuFMS5SyDIrsmxj2nx4enoiEuQKiQsAEf2P51xIaXO+IGZP3ro//rfgA+ZOMW7QNm4LpbY7yPoAY/zvyYXPehEEkjY5KNTAyK8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga+XuRzbufw66ZoM84Ke2eonqarSoIkRltvF+VB1wck=;
 b=mlHktvJQn9G8B5TRR7Sh9SqXKKW4LiLkmbM1dTb+Sf2PMlpMECdjPEy17BQ59CiSzX35qZeBFA/968S1Igk1JskdBUpfuev2EaZ8k1hSd0Eo5DoK1JSuWjc42pf0l/eEUqlzFWe6IZEZxENqq176Ysts+4YykNxVVfKIO2pYymo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <27b478c4-16a0-2e1e-b580-ebfcbd29d1c0@citrix.com>
Date: Mon, 11 Sep 2023 10:59:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the
 number of gcov counters depending on the gcc version
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Javi Merino <javi.merino@cloud.com>
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
 <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
 <4073db4a-0ccd-7047-4d34-25ad18100f12@citrix.com>
 <37f70cdf-a25f-5315-c005-0811ca801e3a@suse.com>
In-Reply-To: <37f70cdf-a25f-5315-c005-0811ca801e3a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0691.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: b377de0e-7e6f-4d41-39b9-08dbb2add782
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kEBTSfC1BbtWYkdMzaMkXcI6d/3eysZvbCf5a7TQdKWu4neBJ+W62EBPoWho0TnzWedEq7DWc9+X+fEn6m2VaPAeUSyOpYwJaYp1A+U34vK2oz5La5rsQN85MN+n3i5jYyhzB7kDvM1V7aidBAF62HkRNnxJ27srOimDY1DgI+l+ojDIa3iUxkCD0xHk62QMjXm/8wMEwjtq9ztkKURkHpp2HDH81LwMPZVLJ6sdYGfiiP2kZblG0R8L8XoKvCA0WkTKcSUst6Q23IJmLrlZGYOpDRxqP5nxrfDI406fb7YdQ9oMJe1zKUIcFsWcuXPn0PCjEqA5m1px68sHRSkMUA+kWrZjJpbhvtBhrTo9NObOzmTKA8fTxByoXX1Wbl5yT/a42mVzmg6fh9OzU/xMzp8BSxAo0SFLBr7IUUUJRd8U6L7s96zh8/0XGtpsB5sJ9HfeEGzEQwJHGnLwYX98J+qth9jKjea+VamOe9HEdVfSF/C1TUGZ90Tb8x0q+9/I9M4Ny1SuNOuK94NSrTuVX60Amb+6mfTJ3QNF5DN2/oWnkqLBuxCFMdXHcMdzZPd+ouP2qNF292LbS+4/KoJ4Lb58ZKDglhjU4WHOJZDwcrws0uBPP/cV3//MJFrWj2fuGX1lnBZNx+RuvjiA2o5T+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(186009)(451199024)(1800799009)(41300700001)(6916009)(316002)(26005)(31686004)(478600001)(2906002)(8676002)(8936002)(4326008)(66556008)(66476007)(66946007)(54906003)(5660300002)(6666004)(53546011)(6486002)(6506007)(6512007)(36756003)(2616005)(83380400001)(82960400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sy9ZQ1VablBZbjBYS1p1UHE1RGtielAvd1ZvODRIdW1TVUhSRjVrWTE0K0Jr?=
 =?utf-8?B?amdkV1FYUlNqaVg3WWpTRFlhaG14QnJPK0V1V2Y0emVBM3d5OU1lRUM4ZnJk?=
 =?utf-8?B?U3c1SVpEQlVQQVJRcW9sWWpubkhBbWUraTZnQzVUMHI1dE56dmczdGFtdEho?=
 =?utf-8?B?bnV6YXFqM1dIUmRiaUg5NkMyYUQvK296U3JjOVlRMjNYeHlWdjA2VlE5VjBJ?=
 =?utf-8?B?a29PeDRpbFMyazZQcmlvMUhObEpTZW9obld1d0s3Z1VwanFRRVVsby80SGRL?=
 =?utf-8?B?WmlKejc0MTBvTE53c0VqMjBIK1Z2RkNLUnFMK3hFdkF3MWJEZHN1akV2RTla?=
 =?utf-8?B?dWViSWtGVmt5dlJqdUwyWjN4RFhuQlRraTg2Y3FYUG5VZ2EwWVpidnJNeXgy?=
 =?utf-8?B?L3hjN0Y5YjNFNlNmSnFQUUJYNW5nSkh5MXByRGhEaHRvd0xqL2JYOXVXK21I?=
 =?utf-8?B?UXZqYzNXQks5UzNnWmhVcExUY2tqek9MdnRiUWhZdkE1OEFEa1lrL0tkZTRQ?=
 =?utf-8?B?L1N0YWE4UTlGWGk1dnJFbXc0bTFGcUlzYStkSTR5T1Bqb2twVS8wVkExNDhI?=
 =?utf-8?B?THFtdkU0MEFSanpLZXplVnFvUURqdWJvcHh3RklFWllYaVg3THBsVjJJM2VT?=
 =?utf-8?B?Q3RMaHJVTDVsMEttL0hKSVgzUGtpVCtCQVN2bE5LUUFqd3Jzd0lWbitqV1dh?=
 =?utf-8?B?UkF6L2lkNU14dFZHWGorRnVPQTNMQzJBQVNmNHI1YVkvRnpkcGlBZUtOTEI0?=
 =?utf-8?B?Z2c1MjNvVnc5S3ZiS1dEb0ZobVlWY0ZLWFk0RlhPaFJCbUNEUFFFOFZZK0g4?=
 =?utf-8?B?TG1tbHNBVkllL0JoNjlrSjF1azdTU0RHNFhHTG45WngwTFBWblM4ZWdaS01F?=
 =?utf-8?B?MEorWVZoY0I0K2MxRnNqbXNER2Q1N0M0VG1jalZxc0xKdll2YjZNSGZIRDFa?=
 =?utf-8?B?aDM0M1Z0YlBNTWc3c1JWM253K0hzZTNYN3hPbDliSzlodWpBRERIYzBlNUlt?=
 =?utf-8?B?Z0M1Y3dLdEF0bkJvTHFocGErTktCVmEvYTVwV0llck5RSEV1ZW1vYmlCSjdB?=
 =?utf-8?B?QkJqblNISWVBcUxDT2RZNXlTTm0xMjF6MTlQOTFaK211SnpRT0VIS2drVjRS?=
 =?utf-8?B?SnpxdlJSNXF1cjRqR2tNcVczeGNycWFQZXB1RGRuclJZdmxyMHNjaUlMa29C?=
 =?utf-8?B?b0UyNmFKQlZqSW9NN3QwZFlBYVRoajY1OXoxSEdidjBlU2pEQWMwSVBuS1Q1?=
 =?utf-8?B?SmhpNll6VlZ4YlNPZVNMWVdhbS9rQmNuM0dJbjJNU3lEZGJPdHMwQ2FWVTNz?=
 =?utf-8?B?S0RrVFNzbjZENGE1T1JLd3BXZnFqOFZHQzdqaXFZSUgvaGZPZm1Fc3VvbmUv?=
 =?utf-8?B?MTJ1UG9mVEs0cVM4N2JiVy9jdTM4UzdRcnRER0xBYm5SQVVBekJMQ1VCNGZC?=
 =?utf-8?B?MnE4ZE9xMkNPUVc5dFBsS3JlWkxUVEZHOEZnVmo3WkkrSzZ6Q25aOEFUdTBN?=
 =?utf-8?B?bzFoSmptTi9pTWVOTjFvRVVpcDNmQU1wbUJQUjgzTUF0dUFsN0xtZDFENzBV?=
 =?utf-8?B?M2dKc0hQbDBJblkyTEkwMnRiNjdYSjNpbS90a1ZtWnczREx1TWI5MUo4cUNy?=
 =?utf-8?B?N1NqWDh4MTJIdldiVzcvbzFnVDNNcXhQNUtNcmhNYXpSOEVGaXN3SXRKb29h?=
 =?utf-8?B?UHhsWWY3WXZnWWhYR0poUHVtNHROVFREbWlGVDQ1U1Vab05XVmdUVXNqMXhz?=
 =?utf-8?B?WlgxREluUWxqckhnWVhDc1pSTjZFakZRa0dYaGNOSFR6ODdTMG5XeHhRSm5w?=
 =?utf-8?B?TW9PK1Q2YnVyWXVBUXJRMlNJV3QvSG9uV0ZKcGNaOUhlNk1PcHcwbzdDR2I3?=
 =?utf-8?B?Nk1Ja05STjFhT3FvWmIxY0VWdnZtN21hY3U3dkNFUDl1K0FiQTh2bU1rSVEz?=
 =?utf-8?B?WEVKcjF4cktuYytiQUYzKzc5MWF2Y2RXTXZvUlEzVFNLK3hnOVBLY3IyY2ZO?=
 =?utf-8?B?TlZpNzFqVkQvbG91OGRxKzV5NDRPOUdyZlREbW1JSVdhSnAwSEk5czVLbENz?=
 =?utf-8?B?MGxoTzhwWWlpL2t1M29zd082blpMZk1pTC8vZ0QzWlEwMUd0eDh0ZjhkUi9w?=
 =?utf-8?B?SHBCM1hoMW1kMEJMWTdNaWk1Zzg0cVdLQ0tBU2NoSm5yYmZyMXhuZnY0R0xC?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/ei1Td3ixD4aIW424trACiL89JDIfF/byr25+8M6Oki4KUH5cimlpsXk+Jj9x2wrLwgI0gAUo3WXSHlNnJbrXkVc6w5PTDLe1HUo9F+WQIWuB3IeLIByIHkfRb24ETUdu1f2al3hI2YnICzi62Oxv6MdpKqhKwAZbVQcakeGwD5Ra1hJyowcppFotac7HELtGp5vRSn+5y+8db/+/jMlP3DY4lbPOrWlVQZ8lWvryYYUY1jS4C5psRoLmtVABU4mNQxOfy2iV0EXYpHO2IqXJF79UPIhPkuhw4kTJ8PkXOAH9ypCbH9f210dmmmhL9rwz5vPXw8o/6XLZZDGz4Wrgkj5JvPMYnGhHOaidyFMQiAuHiwhH81y8/uuJsoiKkJ+OY7k5+IAJ4FtdVYV1NgL5QtJ2wKR2Fbb2IjqOyRCd+CHAO/bVltTiokwwzQ+/sLf3jiKVUC5ZU9JzQ9qc6t/p6qVJ1S1y5e04LwvCToL/rHog5W9zjT8oRJoNP6Q9iDIqaZqE8Qt+v76xDjRzkAK/QXC95DfnRYBnW0KrAAmzK23r2BYaT7NlFwLG1+UPvK42Np89IQqhWERBX8llWjHkYMBc8T9dUAK/fUgnLC0D6aPc0t/fy9rXKQ524MmXdGm9lAZYf0jt6HtRVOQ5D6TwyQAw0kc+V+v9Z103U614CX0u1goSNJi8gVEAdnpV6LsvaDV0Dw74icLzPFODga4NP4TQC6ab9oqVaE9n7oZBFLtLh56tL4YT8f7jL5Hqa1vM/XzBzUb549XIbxWDaV80iBAfrEKJyn+sVcKosuRn/CCMxw4+sq6FsQrFBl4Qh75bTSozz0+hg1Gheg/lPHy799A8cekXmUzsYwIR8GBXxe29tMqfoifvx1XqZHc8B/3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b377de0e-7e6f-4d41-39b9-08dbb2add782
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:59:52.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyCyrd5b0W+aHUoZr1mpRa2uAyr92QbLRrkvfLDkXM9mH5AhqLJ4nvBma4QkvyKOIEJcFe0so5fZf8IFFK9ciYeVFRQ3bFGIFawMJ3TF9cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4994

On 11/09/2023 10:53 am, Jan Beulich wrote:
> On 11.09.2023 11:48, Andrew Cooper wrote:
>> On 11/09/2023 8:54 am, Jan Beulich wrote:
>>> On 08.09.2023 18:20, Javi Merino wrote:
>>>> The current structure of choosing the correct file based on the
>>>> compiler version makes us make 33 line files just to define a
>>>> constant.  The changes after gcc 4.7 are minimal, just the number of
>>>> counters.
>>>>
>>>> Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
>>>> remove a lot of the boilerplate and keep the logic of choosing the
>>>> GCOV_COUNTER in gcc_4_7.c.
>>>>
>>>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
>>>> ---
>>>>  xen/common/coverage/Makefile  |  6 +-----
>>>>  xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
>>>>  xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
>>>>  xen/common/coverage/gcc_5.c   | 33 ---------------------------------
>>>>  xen/common/coverage/gcc_7.c   | 30 ------------------------------
>>>>  5 files changed, 10 insertions(+), 109 deletions(-)
>>>>  delete mode 100644 xen/common/coverage/gcc_4_9.c
>>>>  delete mode 100644 xen/common/coverage/gcc_5.c
>>>>  delete mode 100644 xen/common/coverage/gcc_7.c
>>>>
>>>> diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
>>>> index 63f98c71d6..d729afc9c7 100644
>>>> --- a/xen/common/coverage/Makefile
>>>> +++ b/xen/common/coverage/Makefile
>>>> @@ -1,11 +1,7 @@
>>>>  obj-y += coverage.o
>>>>  ifneq ($(CONFIG_CC_IS_CLANG),y)
>>>>  obj-y += gcov_base.o gcov.o
>>>> -obj-y += $(call cc-ifversion,-lt,0407, \
>>>> -		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
>>>> -		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>>>> -		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>>>> -		gcc_5.o, gcc_7.o))))
>>>> +obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
>>>>  else
>>>>  obj-y += llvm.o
>>>>  endif
>>>> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
>>>> index 25b4a8bcdc..ddbc9f4bb0 100644
>>>> --- a/xen/common/coverage/gcc_4_7.c
>>>> +++ b/xen/common/coverage/gcc_4_7.c
>>>> @@ -18,15 +18,16 @@
>>>>  
>>>>  #include "gcov.h"
>>>>  
>>>> -/*
>>>> - * GCOV_COUNTERS will be defined if this file is included by other
>>>> - * source files.
>>>> - */
>>>> -#ifndef GCOV_COUNTERS
>>>> -# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>>> -#  error "Wrong version of GCC used to compile gcov"
>>>> -# endif
>>>> +#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>>>  #define GCOV_COUNTERS 8
>>>> +#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
>>>> +#define GCOV_COUNTERS 9
>>>> +#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
>>>> +#define GCOV_COUNTERS 10
>>>> +#elif GCC_VERSION >= 70000
>>>> +#define GCOV_COUNTERS 9
>>>> +#else
>>>> +#error "Wrong version of GCC used to compile gcov"
>>>>  #endif
>>> How about inverse order:
>>>
>>> #if GCC_VERSION >= 70000
>>> #define GCOV_COUNTERS 9
>>> #elif GCC_VERSION >= 50000
>>> #define GCOV_COUNTERS 10
>>> #elif GCC_VERSION >= 40900
>>> #define GCOV_COUNTERS 9
>>> #elif GCC_VERSION >= 40700
>>> #define GCOV_COUNTERS 8
>>> #else
>>> #error "Wrong version of GCC used to compile gcov"
>>> #endif
>> Forward order is the one that results in a smaller diff when inserting
>> new entries.
> Hmm, even in forward order one prior #elif will need touching

 #if GCC_VERSION < 40700
 #define GCOV_COUNTERS 8
 #elif GCC_VERSION < 40900
 #define GCOV_COUNTERS 9
 #elif GCC_VERSION < 50000
 #define GCOV_COUNTERS 10
 #elif GCC_VERSION < 70000
 #define GCOV_COUNTERS 9
+#elif GCC_VERSION < FOO
+#define GCOV_COUNTERS BAR
 #else
 #error "Wrong version of GCC used to compile gcov"
 #endif

~Andrew

