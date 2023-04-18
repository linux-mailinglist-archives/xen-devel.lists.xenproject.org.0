Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434BF6E68B9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 17:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522989.812696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponfi-000100-VL; Tue, 18 Apr 2023 15:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522989.812696; Tue, 18 Apr 2023 15:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ponfi-0000y3-Sa; Tue, 18 Apr 2023 15:55:10 +0000
Received: by outflank-mailman (input) for mailman id 522989;
 Tue, 18 Apr 2023 15:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ponfh-0000xu-AE
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 15:55:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61a00cfd-de01-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 17:55:05 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 11:55:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5055.namprd03.prod.outlook.com (2603:10b6:208:1aa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:54:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 15:54:55 +0000
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
X-Inumbo-ID: 61a00cfd-de01-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681833304;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5gkS6MMLCm9yrvjojfcGRnvcPbyUje4BRXnXYqdssbY=;
  b=cYkFvlfK4om1gpw4OGamBJKA5HE/q3FidyHFvA0bRjoP+XLIMRv88R0m
   dLZjiFDpL6gguDRHham/0j5CD5Nn8KH0qhxdeQ48tb0DZQCfAL7SBzyl6
   oBVm+OjrOyPWfbYWlTwpoa/LHf20RcuubMdiTqnDbzyqtlkP2Hj6MnRkr
   s=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 105879446
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8Kw5S6LhfI0DDYLzFE+RUpQlxSXFcZb7ZxGr2PjKsXjdYENS12cOx
 jEbDT2PaKyKZDHzLdt/bd7noUwBvZeAmoViQQJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c59RnkQ8
 KQceQwLazefp+68766eW9ZF05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHumCN1DSOHmnhJsqAGDwUBIUzw1b3Thr+v+sHGSV9tgG
 UNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YXma87KJqzKuKG4QJGkLaiIeZRsI5cH5p4M+hQ6JScxseIa3hNDoHTD7w
 xiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZkaFl
 GgJnY6Z9u9mMH2WvCmEQeFIFrf54f+AaWfYmQQ2QMRn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqu8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:ldI/Q6CCHF++z5TlHemU55DYdb4zR+YMi2TDtnoBLyC9Hfb4qy
 nDppQmPHzP+VEssRMb6LW90cC7KBu2n/MYjucs1NGZLWrbUQCTXeVfBOXZsl/d8/GXzJ8h6U
 4aSdkGNDQ1NykD/L2KmnjFL+od
X-Talos-CUID: 9a23:1bOvEmPYZiXApu5DUm5/qktMHpEZdHj60FfcKWCkLHdWYejA
X-Talos-MUID: 9a23:BBtSqwrw3N2Af/VMlisez21yM+szuIWNMm9Xn4dBgfaoOSVPCTjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105879446"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3OdhvvuCbEpKbUBK8RozxDt279oN0lrSZ/pqYpuw0c82MBScP5X3eRF2aGgKj4mf4Jvul1tvwOWfpALhHUO+SYW6jPkXlXhC8ZGy4hIRnRsgKDV9lFcbfTwtfvwcV3GJvDuzlBhw59LbftaI3M8N/T87+CYqFrclUAM30A77L18Pa5WB55jMGxnVy+whZKdfW7lkvhvrR1srRG6v5KmxXfD/bbUYDQQ8nXCwAXgEoJnlkc7wRzjm4sVLZz5zFvaGOjUm1HENfBV5QF0BryfMY1ukj/f7gvohDGe5V7KUi82TJggE7Tsi55I2MqdCIDF08/kxW/X1p5OzZ8SaPbJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcPbJuOJMLDO1T3Gj0DzKmnUAlE+EEb0FngBro3YOgM=;
 b=kqBkR8PjYI4LZD9rYUREiF+2zpAogvfZR/p8HZU2LrduXR4P2RbuYHqFYPZfCRt9vtOJ2FNO6/SoT2EC33qmhzOBjITgQLxJkVoOro6BjitE/h6SsCZN4GcmUxxvcJsdVohcwgAgPJHpAFXS3/a/D8AIMzEBu9Y0zB4wFUZ1SlswxT2buevuvqYgIxgGMX2leOJl8vc8Gv7T+03ceFi7dghwerui41U4JgMQYgq8aYL4h4gjwgcANR7FEfmoRLwoKvDeOWfnMA8TGUkVtEvveffA8rEOfDHrJ1MS/kfLpMrCMIz1RWpAH83DjiLuF9qUn9gZWd9x4/apclKnXjzcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcPbJuOJMLDO1T3Gj0DzKmnUAlE+EEb0FngBro3YOgM=;
 b=jxXVoOgAPxuca+JJH0xZiAKUW8ctMusfqt1d+o4rWpKw3NlyJlyVQG9OhJT3OLdJaa4CItewyIZCYqUuT9T0sVsBEoe8sicXTS7h9hNBvIsctSwLqqADsrarGwGiU0R3HPqykMztrW9vwuSRKapEKYfQe1BzNedl9GTPFrGFMRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <225aeacd-7d8d-3832-8043-4f565403c2d7@citrix.com>
Date: Tue, 18 Apr 2023 16:54:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/vcpu: remove vcpu_set_singleshot_timer flags field
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230418154223.20181-1-roger.pau@citrix.com>
In-Reply-To: <20230418154223.20181-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f3bed2-2fd6-49ca-b833-08db40254110
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/qoVwR/zFjJsNHqqf83OZGWhYcB3nELPmc6Ph81opV1GYVi2emL1z5hPifc9KaIa0sZ/3BqlR1oLnNSG9CbiaLviaeyEf8NysgwENQjE24QCk2V2uTp+xZ3OGurQLR842JE85E40M1P4ROwZYgthokYL3L0BfoDmrZIb6+QucomCa8tlDDLVLKip/6W1JvDq2epkGf0WHrgFg2TZPPaVCSP4d+CGP9dwACNifQIf5rAKeM4QKSYUxKy1TLORyxyhkoqYFE+5ygiSELNlel0diaVoEyp/zHFCW8jSALsaW+jVw2mH+ui8fsjVmdkYfuYrOENa5/m7N6xYgp7GRaITvL43gOQSDVoRj0qXsapHzpDEhTTJ6JqYTQicLMyl7c2qBtx0aIKAEpV1pM0zkL8pyqHhJFow2WWKr3BG1pp9v1FFqAWAB+9DXhLIW3JNSU/qU8+p9Vmz3V52AzHJW9caUW1jarTCzhG8S1S55vjb1ABVvbeOt4shg9+gWO/HgN1OdBQxQwHlofzcqdPFj0cs14EhSZtD0LEQF0tufXYelgoBgMssGpcbX7K6CdNHiL2xRPzqXTuIrHW5bMJAiWtRaI8fFnEKxNEEYEOe+/2Wu0DkaGPJya/r0ZBlOxHSaxjUtpZ2M6xS2bkcM8ZKaalH6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(31696002)(2906002)(82960400001)(478600001)(6666004)(6486002)(2616005)(38100700002)(83380400001)(26005)(53546011)(6506007)(6512007)(31686004)(86362001)(186003)(36756003)(41300700001)(316002)(8676002)(8936002)(5660300002)(54906003)(4326008)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zi95ZnNxa08yNEUremlIMlVLdUh6alpVUGY4TTlsbjlyeFYrWmhIUU5XWjF6?=
 =?utf-8?B?TnM1SVYyZDk5c2JnVTFnZVFoQmRnN1BRNXhhUmlkUGR3VHlnRHFQMWR3eEl6?=
 =?utf-8?B?ZlI0YUUwRWo1dCs2VGhmaDV3SUpNWWc4VUlzRDJyUlpuQlFWUVJDTDZ4OU5n?=
 =?utf-8?B?RGU0S2pwQWVHUUxGQjhMM0NTVlFTK2NEN0RxbTBJbXBiOTV3d3pLRU5aR0x1?=
 =?utf-8?B?cW5rT3pBbGtiL2trMERUOU0yQ1ZGRmNWM1BhcE5qU21PWnY4UHRYRzVqQlhn?=
 =?utf-8?B?Y2hLWm14bUlZRHZ6RlJPSUlSM2xuYzdJSTIxeERTMG5UU2pBenh0bnNoSk16?=
 =?utf-8?B?WTVMSnNBUk9DOVBoVTVQK09kVm1HY3FWWTZRZXRubGZxSElmVytMUmNOVkt0?=
 =?utf-8?B?TTdhbzRndG9Ia29MakUyeDAwVlp3UFVMZ2xMOEFyOVZzS1VaL3hNTVg3cGMr?=
 =?utf-8?B?Tk4vdFhxRGdsbVArbXJnWXhBMVNVK3JMY2lTYWIzaTlORlVFS1c4cnNmYjZD?=
 =?utf-8?B?ZGJ0YXJpaE1XUUJ4MU1CKzgxRkZiOTROdHJFd2VJRndacmU0cFA1Sm9OUlE5?=
 =?utf-8?B?RmJ2TlpOK3BlL3dDeHpIeksvRW5IeDNQZnhQSUsrMUE1ZldJajJ5ZGZ2bVhr?=
 =?utf-8?B?ZTU1akZrK0hiN25KZU5xVWxZVmlzVVYybmpTenNzR29pd3dveTBIanJCNkJS?=
 =?utf-8?B?clN5WXZGV0xlaFh3N08rU3d0T0FqazZNSE9RS1FXcGhXTUVERFA1SVpON25M?=
 =?utf-8?B?YVVZVzRnMkc4VlVuVk5lbU5MNnJ6V1ZxS2lrbUpVNHI2Z29YY21xcnArSEZq?=
 =?utf-8?B?OGNtWGRGMHdZUnhaQ3FxQVNaYmptczE3OWVyaFZmZUJJQzZlZFNwVUlKTmZz?=
 =?utf-8?B?UTNxS3RqYS9EZGZTUGU2RFh6RTVoWlVROGpjZ2EyQU56eDBIcGZQWHV4SU5p?=
 =?utf-8?B?RW9wZGxOalJpQmZtemhJYmdLOTBBVFhVSG1ZYzJhYUlubW0wNjgvUHRpTWpp?=
 =?utf-8?B?VTVFVTBRdSs3REVjRklNa3pycTNQcjJ0ZHh2NnZTWEJTYTVNWnlrZHVqbzh2?=
 =?utf-8?B?VjRDejdZRWdRVkM4V1B4cDUvYU1BUXJsbFZrK05FZnN4aEtNUExOT1I0eFpv?=
 =?utf-8?B?aVFpVGhFUm9yU2tGNzBER1htajFTL29MYjRkeE4xVUFuUmx0MFpUU0U3eXJY?=
 =?utf-8?B?QWFlTlFwQjN0WkYrL2dPYXk5bUN1RGpLMCtpcHgxeXVWV0d3ZDBmOXd0STRp?=
 =?utf-8?B?dE00ZkhsVVA3bkRVNEtrVEFWVDVEMTRmbVFHcThoMGkyVk1tVlc2U3RyVk13?=
 =?utf-8?B?TGR1ektqVzJsZzVKMTZkU254cmlpdzVNQXhhdlU1WStWeWMxcytFbDlaazA5?=
 =?utf-8?B?MVI3Uy8wcFJPaDk1V29WVnFnV2xQOExrK1Q2RnI1c05UUmZQSnNlZGsvWkhi?=
 =?utf-8?B?L3E4a1hndUdTMGk3K3pOdE41TTAwOTd5M2dFVGdhZzdlNmVvRForRnkzTlQy?=
 =?utf-8?B?MURjUVZZSm5KRkc3WHoxZzRBWmt6dUE2NzkzUTI4NjJEWFpjRHRVOUFqYnpp?=
 =?utf-8?B?dXpzay9jSFl2NFJMajd1VytlS2VJRFVZT2RyMWNQS0FvNEdieEZCQ1pYM3Br?=
 =?utf-8?B?SmtqUHppSndJWVczZXpkZXdJOHVScSsyM1dCeUY1WTBuNGY4QXpvMDV0NzE1?=
 =?utf-8?B?MnZwTWovNElyL1ZLalo2V3oxYmRRcDI1MXRsMnZlaXpUNmtuVm9Hb2Z3RHZq?=
 =?utf-8?B?K0hHa3JKUEpWZW5wYk1zaktZVmMrbFlRc0lIS21yVmt1RFdjUVRwT0J3WEFP?=
 =?utf-8?B?UjYwek90aTIzT2NqZnQ5L3dXUThhN0ZEeHY3UklIR1BsemU5S3RiekVRTVh6?=
 =?utf-8?B?dXIxTUhoYzNXeXdPaFZuK0puT2VuV3hNWEp6WmtudkVUOEpXdmxURjFObm1K?=
 =?utf-8?B?aVlOUFp5OGYrdVBMSHJMKzVjN0NJZmZQUWwxc0Fia1k4dVRWalNhUTRtSi9Q?=
 =?utf-8?B?Y0JkazN4d1p4QjFqb1RDOHNoVExYZVF2WGd4RVY5TVpEZWlOS01KLy9lY3VG?=
 =?utf-8?B?UXc4R01OM3VKMGQ1Zmpidko4WjkrZ0JtZDNqSUJ0TUk5bWlMS3NHTE1aR0tU?=
 =?utf-8?B?blFJUFllL0k5eTh0WWdyclcreVFTaTNWa2RWcHRLckMwL3dlSWdkemU3cDJV?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dcIZUCQZObzdM5/BwLtGwJd17hXYGJirBIQckWI2kPSj4fhESV8LfJML7SX4VelTgPdpsdNaL1+L3a02OJz3yTnoiY+d9txfHeVzO+gOIEURPqVgE77i/VfC87lYajCR2i2toQft6SGG5njMr1y9qRjxUnLWf0MGiJHRFpGrdbJ1c6opylGXWiCfCXk50Q16myjdwP4bg2Y093D96qL+pw9L8Qi7/wRt4rP9Eyey+xy1psCh92XVgoLOaEqyRi/fP/CjWGbfCFcJIQM1jDGG9lpFt1QGQTQZ3i187+QxEXFbpuWiAa8+l/pOSuL3XRu46NmEAOl5bghbcxlsMQtD+QrMvGHupF9TRh93Dde8/x6fGGYl8J0DDaylHGEB6jkI4VSrDzpouehHmUpVdqLu1+YlpyaRchBiCfnwYQW9Dy9VkQ9MDJ6x4kxNX2A2UxMyZ49qbe4FWL8RqNljRRxOKwdIKWB/qw/w4HJQe1juhpusiveYL86K81k7sa1YMKcHuaXkUNBrdCK5RlyWZVrKlnq3VkqdEu5JJ3yFGR10Q0mcjI22j0j4C6A/VgEklDY+VlKz642s781BNvASfJt0IN3XAJ8YBPOSw/Tu4TjJ/nWU0WjXKnzdZM93z4uM0Qs0U+ZNVJuPicKaIbdrMCTSa3uT8Z3QMXrXG/DzQ5IpDukTqnLiuxhwy7hYQ83iZMZz9jjQACRb/Fit8Fev621PLr9cZbb6GKliTUrn7cQR5Ufc6UvttotMwO0rSmYDnyWzYqW5eC1p59cfnEh72JpyYxczes8w+1eSwfg3hW103YJDvikpTII8mjPuZqUsxjkt/hYS5XP+wsxs+9Ik+B5sP8kdOt2yzHqlvwSPdWiRT2e/TWDc+PRNV3z2lHwzSJApMUSqLGJXw2bkOO6T3AWLVFQoEGTtsXEJJvhMaiJOkho=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f3bed2-2fd6-49ca-b833-08db40254110
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 15:54:55.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pv/mHCjIXlIMZSQxrmYB4pLTQYZxPNO2TYQs2CT11ptkK7yjV0/v062EgnERjNE6Q/Vk3ns17u0AA1slBTmH8ePKrjiVi8PbJu+lBaxboro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5055

On 18/04/2023 4:42 pm, Roger Pau Monne wrote:
> The addition of the flags field in the vcpu_set_singleshot_timer in
> 505ef3ea8687 is an ABI breakage, as the size of the structure is
> increased.
>
> Remove such field addition and drop the implementation of the
> VCPU_SSHOTTMR_future flag.  If a timer provides an expired timeout
> value just inject the timer interrupt.
>
> Bump the Xen interface version, and keep the flags field and
> VCPU_SSHOTTMR_future available for guests using the old interface.
>
> Note the removal of the field from the vcpu_set_singleshot_timer
> struct allows removing the compat translation of the struct.
>
> Fixes: 505ef3ea8687 ('Add flags field to VCPUOP_set_singlsehot_timer.')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

While everything said is true, this isn't the reason to to get rid of
VCPU_SSHOTTMR_future

It 505ef3ea8687 does appear to have been an ABI break, that's
incidental.  It dates from 2007 so whatever we have now is the de-facto
ABI, whether we like it or not.

The reason to delete this is because it is a monumentality and entirely
stupid idea which should have been rejected outright at the time, and
the only guest we can find which uses it also BUG_ON()'s in response to
-ETIME.

It can literally only be used to shoot yourself in the foot with, and
more recent Linuxes have dropped their use of it.

The structure needs to stay it's current shape, and while it's fine to
hide the VCPU_SSHOTTMR_future behind an interface version macro, we do
need to say that it is explicitly ignored.

~Andrew

