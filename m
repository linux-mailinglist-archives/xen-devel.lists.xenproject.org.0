Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620D6E8403
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 23:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523821.814239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppFmi-0003Pw-U7; Wed, 19 Apr 2023 21:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523821.814239; Wed, 19 Apr 2023 21:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppFmi-0003OF-Qx; Wed, 19 Apr 2023 21:56:16 +0000
Received: by outflank-mailman (input) for mailman id 523821;
 Wed, 19 Apr 2023 21:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDf1=AK=citrix.com=prvs=466cd93b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ppFmh-0003O9-9j
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 21:56:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe4de3b2-defc-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 23:56:11 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 17:55:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6738.namprd03.prod.outlook.com (2603:10b6:510:115::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 21:55:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 21:55:54 +0000
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
X-Inumbo-ID: fe4de3b2-defc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681941371;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TSlcUKq5mYScgZ1rUT638dakeHZvvjZczDBMwx3+0Ro=;
  b=follSvq2+MzVeEAz8pagjC7fUYfKG0Ub1bGU2a1N2zSSfK1gUNurJedU
   DcyIhgzgEWDV2vhmI74T4dFz6Mm5wgZA3U++75mBfpzBpjAA7vCN9Ii0m
   T2D/hUI6eC6RwzwOKAoQgWsDQdFRMfoaSgPtGKf8FsbSueuHUsbx27mht
   g=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 108604224
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IQOZB6I0aajNFvJoFE+RApQlxSXFcZb7ZxGr2PjKsXjdYENShDwBx
 jYWX2qAP/7cZWX8L9hxPYzl9EkBupPWnIRgTwJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vXUN05
 d0Vdwktbyiqtc6sh7OYStNz05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHurBtpOTufknhJsqHyOhUAjMyFNbEfh/t2fjHOYX8lPA
 ENBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9LmIcZClCUQoM5fHipp0+ilTESdMLOKyoiJvzEDL5w
 TGPpQA/gakeiYgA0KDTwLzcqzelp5yMSxFv4AzSBzqh9lkgPNDjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:ShNj66FkRUhon1T6pLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:Pz9gAmHveS5Ss+1iqmJ/qGwuCuEoLUT9zU/5EWOiTmdKSIeKHAo=
X-Talos-MUID: 9a23:uSr4YwkwEDf3x4gehRaAdnpDKYRE05+SU3kRy8oinc+5EyhrKxyS2WE=
X-IronPort-AV: E=Sophos;i="5.99,210,1677560400"; 
   d="scan'208";a="108604224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjMBJKLX0GI6hnmztJ6KEu3CrAWruyxlQAw7mmJ0TNSM1VLkws7+8sfhapvrBXHR1tDdr6ArGsifSvpAf4FKXeyg+G8tkB9N/yLTY+2+nVQ7Rvv9QgaUKxHQENX5+GvQsgDppH0IXUMJ1iU51jQQfDUelfLQhwvRvbe5zSynq6xkA60dcSq47dmvK+hwftImLygwG99kwrXP+6D9G8A1VVnAb4zWiqIRLc6maEav6kp38ChAbyiqEb6gI4ew9mq1LmXddmkwSPDUwuSwG5OvdWGObDSr0me0cHnwp5pHA8ccIItKyIU4xnF8Yvv13f5+A3QvzNAEQCyOGxPY1xFGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSlcUKq5mYScgZ1rUT638dakeHZvvjZczDBMwx3+0Ro=;
 b=EBEOVULBIkXU4xz4ht0LSzrPuioddaWRcVkEuC35sxJZRH37pwbVqYxTDWUMPF9ojO6EMKwwQfQSY3Us79JsDLjLBazO4NfabFWBIQNkN4Ull+stMKZd9hHb07yuvbyh6RlMsY4whOQxHNFo8RAccCVP78uBeT1Pkh+aXTlo72m4pVEBYuS+IKnJ060MyaUOlnyZ+e+WVIiwi7MM+QH/1+Kr4BqmvN9jpMX/X414oerEizQ7zXw/wHIp22j7jNa3138DAgdjIJNWkPxZxg5hgcB1EdrOVSlXGIpL+dvr66oTlLbYKXQpstg56H7/yGWwzk7h66lwouScs2wiON/EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSlcUKq5mYScgZ1rUT638dakeHZvvjZczDBMwx3+0Ro=;
 b=nSEG88zflEUzbaHFQNbuzQiabtlbTchc/CMa+Bxi5Lzmf0QL91kp5RplJwj6dsTw4A+/JrXMQ39vuFyDZPebSHIU2N7gVkaUzK68d2GJAAh85TbKmzaXVwJlrSURlLVql6o+l4SQoSLeSIBC2+7SQSv0lmmeCvYTBJ2YM47wz3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1c79060a-89c0-6dbd-47cf-964192b82020@citrix.com>
Date: Wed, 19 Apr 2023 22:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86/HVM: limit cache writeback overhead
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <18fcf499-a2ae-ab48-a66f-ca0499097e8a@suse.com>
In-Reply-To: <18fcf499-a2ae-ab48-a66f-ca0499097e8a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: f265d8cb-1a64-4081-bdca-08db4120d905
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5zfm9hII2Qcv1yZS647OWAuGZz2Q/gnAhPCPszrvvfqszRPWGCP/vp5R9vt3hCobsZ7G+T3fsxMlJI7JeVmfS3a++pUAH/+DFSYFgZJ43MOcbygtFunXCyVESqOEy4NwNtTuP5kbXfKQPg2Hza2ahlL94+BwvUi5uwy+4R7l7sldAXSnWbK2lycQ0xDyRuS5LXw8l32tkliPAFdTAoGc6iBuO5lxJSiehXf5hKieilpvmEDXHSkfatE74AuPszGbTlYMpPMF/lgIpEZQfM1lrgVLY8KcMkyO6pwsujNGeb6+VomhfXIhw7MOR9Qgnw0Hjjv+fvXKzo72J/CXRaHz96x7An4O89I3KyVh/Lu47CSRXQ66vWZNfzDlWyI0gPSj52CGRz1DQCl2ed3BhO2cReuV8ValLu4N9pWLyZxUvX9xfAwVAWJF0Hh9DIRdrDrrfTkcxs5V8f2klWJkV/kKhk0YSRyXnJZv+HQoe5ThFv5LEVLK2k9q0yZ3oNESVZFYoNC/IO24xYwDx6dzlfgmZMLY7NQm9dhnEayhxS0OqIPIyysYnRxCK9uAIepB2eSWDZ0w2fIl0QHJBb4rX/jttR0swRt4HmlvCMMrOHnYYIXX3pfEjKsT6D+q1bA2LlST8uDEHCY7empv6gWWmTXIHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(36756003)(53546011)(4326008)(54906003)(316002)(110136005)(66946007)(66556008)(66476007)(6486002)(41300700001)(6666004)(478600001)(5660300002)(8676002)(8936002)(2906002)(86362001)(31696002)(38100700002)(2616005)(6506007)(26005)(82960400001)(186003)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC9oMHhtUG51RjNFZnp0VWxvK1hIWW5KcDNqRXIrckQ2eDhCS2xGemFLSUt2?=
 =?utf-8?B?aHhVVXVZUFE4bFlXQ29VeTFpeW93bVhQSnB0TTQxeTlsVXVya2d6bDRaVWUx?=
 =?utf-8?B?ZzV0eHN5aFJ3MTNTSmJvVVZiT21QVTVVbGNwd3ZIWDIzZnZXZWJ2dC9LUTZo?=
 =?utf-8?B?TjY1Y093ZHpzVmQ4eWxkVUZ3VTJCNHJ3eUV5cjBZN2RoSmZ0SlZMd2dGeGQx?=
 =?utf-8?B?WjRPWmNPTzhCSDhheWo0TngzMURaOVBCem12NzlBZ053SGw2Rlc3Q3A4TXlR?=
 =?utf-8?B?V2NzUzBFdUlXWGJJTG9WWFRRR0Z5d3NLdmtRd2hwcHhZcWR6WWVQeUJvKzg1?=
 =?utf-8?B?aW5RRW56aXE3cnJ3TmcraERXd0VseE5GeER3bTUvZkd3aUlzREVnSW1wOEFo?=
 =?utf-8?B?OXc5S1A5dE5wQnloRTVKTUxKSlVJaFhsdTBTYlJTMFJ2WHMrUEdKcU5nek8x?=
 =?utf-8?B?bFdiWmtQL3RqZGwzSzlncTRoODQ0MEYwVzdzQjFkN1FGT3p3OWVLZVgzRVJI?=
 =?utf-8?B?N2ZpRUQxdWxqeGozU1dCbU5kc1lGN0p0c3BzUjR1RkRMZUJaSnFJQzdwcHp0?=
 =?utf-8?B?OEJHU04wTmVuVXA1TTlpYlUreW9WaVB6bG9lZjIrYlJKQ3FNLzl0V0Q0cGFB?=
 =?utf-8?B?Qm1xZEFRamZvM0V6SitwU2pkVitqQlg4NmpDeWphcmJNcDdCM1JhVS9GQkZR?=
 =?utf-8?B?eHowOGJ5L3RHQ3lRMi9IdWR1MExjcGgxOFpWWWZSYWJJem9tWjdNQTVhWm9R?=
 =?utf-8?B?dlNhTlNWRnA4UjZ6YjZaTDdXbTZVWHZrYmIrTjVoS2NrYjUvaXcrK1dKYmF6?=
 =?utf-8?B?WHBEcWtwSmRDOHk4NUtlcktSVXpQZkU2Sy9vMzFNQUZ4Uk5hMnY0YXJieWtX?=
 =?utf-8?B?R3N0dllGTDY1ckxYa1dzU09abXJLTHM5WkI2KzlFVy9BcGQrZ3RRempwYTVN?=
 =?utf-8?B?cVMrM0l2d1IxQm1UZ1RWdmhoeEx5OFlLNXhSS25MSzhyT3RzZEN3bFVab0gz?=
 =?utf-8?B?eUNnUUJWMkdPSTdOaXRsakpTVnltcWd2YlphSUpmR212YjlmTTFueTRXeU5t?=
 =?utf-8?B?VEtPNWhjbWFJK3BnWUFVOHRWSGlqRyttVVNkOGIxOExzckhMcVFqTVMyQUEz?=
 =?utf-8?B?RlBaWWpTRzZVTlhRdHlKUS9kTnRVOFhMS084eE8yb3FKMERjY2tEWnFhTGRE?=
 =?utf-8?B?bEFRYWc5dTc1T2Q3YTVsYk1DRkptWnBXWnNkcFZjaEQxUGtSNlVFNlllUWdT?=
 =?utf-8?B?L0NWVjNOR21BYnhnRHkvZnhUS3pqRzRwV3VtSVdSajNrNWpYa2hVS08vRHVO?=
 =?utf-8?B?Q2hQVTAwemplWXdLdndQeGw1M1h3Wm9LbUVuM3I3b0RpTmd4YmJ4c2xaSGFT?=
 =?utf-8?B?empKYWU3VzhRUHczZjNPTG5YbjdHVkk0OGw4SUtPSkdER255dDlQUjJ5VjVv?=
 =?utf-8?B?emRJd0NEUnJrMWRQeStwelFKV0VEMXRoejhpcFZjanJQdGZ6WVRXckh5WVNM?=
 =?utf-8?B?eWxwaHFLaDErZzZ5YkF1bkNDanI4ajJ1VjlXQjdZdmh4djVNWldYTHdDTS9u?=
 =?utf-8?B?WjB1M3NOUW55QWtHdWxjZ25rQXNMdlNHbnVOMHQ1azBjUU1JdGkzdm5CTXNC?=
 =?utf-8?B?MXNueEh2ck1RR1p5VXJwa1Y4aDNMdkNxSytjaFF0NXRjRlB5M1UwMGJXeEVH?=
 =?utf-8?B?elFRRTBkb1A3U1V4L2JNTHZCVDJtTmRXSGI5RjBSZnU5ZHkwYmd3TlBDcTA5?=
 =?utf-8?B?YklUM1RRU0tUUjd5YmFuT0M2Y2RzQUZvdWpORW5TcVNjcENrcFhrQ01XeThN?=
 =?utf-8?B?SXZmY2xmQktTNkptelE4TXVFSGxiU1orR0NCSk9hOThIZDVHeUo5eDc5SXZP?=
 =?utf-8?B?aFdrd095QzB4dFVqUUoweHJmVllXeWZPdVYrdWNGem9URFJURWkxTGNuOHlt?=
 =?utf-8?B?a1ZsSjVJYmZKdmFFc283YXZoY3J5VEJtWkp5Yyt1ZWdlTlNueVZvRHg3K3pJ?=
 =?utf-8?B?ZjdmdityU3h1WU5hVmw4a3E0YU1WS3dvb1M5RFVXTUxTclZQNzhqemc1bGVZ?=
 =?utf-8?B?SmxhVmtDQ0xvNXVmUWhJdEJGai9TTHpZczJPTDRkbC9XZ2xhNTRScktaQVlm?=
 =?utf-8?B?bG5EQ3lmQXgwQksraEFaOHpqa3JESzJRU05lSGZxM3plb0kzQk84YTJXaEJi?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fEa6xNeuZTg/QnmM0FFv81bRXja4MnLMASzEECgLQvIUQu3z/zXGK+EYnttrRPS9e/GuxFH5KOjSHM2botv/RvmlGmrpkRqdlnR0x3X81v+M2OW0tGvi7qN0xx5mJpOOba3+q2b1GAtJ+Z5T+GRvDlSJVBMqExAOaf4LnTWbH7eiEwTdesOk/x10qJrybp1rw89Hw2q4PSw570GyFvvx06zv8sMHu5IltfiSjYhpJqkL98DBUXFX/cImhk9MvTbHCbuoL/Sr0nGUCAKQTdSRXDOLv4OZfDNIqYUtEwkkdY8AMTLusBEbe2cXsQpADAvmslhIdS6K70xPbR05Ujyw463CIdd9KSRFXjULHjZ1NXZ+cQwyF4ZIkxNg6BcHFNdTDBfQgj/KEAaO3WvHeNfHtWLmV4OlG3npziqCWc2b961DhfA5MTMACadaQkhL6JsawA1LPv3UT+r5mEENlnAoz3wh4fHLDNxhyJxU2HE6YBJAk19T/jPL5l1XPOKJbLJEurZA1NvjtT9NMQjVpP6O9Qzza6hfJhE7AxYkG6GNpy6PnnO4TJiNfLe3KRVhPBbVXujzN4edD7Q+NffvQYRCeGh26wFH30YyMkyWTopRE5F3JDXSm4h+xeWCa5tAplf+zlih+n/dz8JSwbU2qTCEf1TnKSN77cSsPCWNnL9lxtLd81Vo3BvP2CQBjus15jHR8RNn4vMLLNgtzpRictasb1jmMI4pOryXfiruIoG37PcduM4A0pkI8o1BKmKV3McU6/TQx4CqnVJ5Px9QnRUDuN/ZP1MjKT7YPwtqYONvE7IC3tF3KClENuNHuwmx5UYgGZTxrV/7SYGfaUxTH0E0DGbs5AIYgmibDnaTqiO1S9w=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f265d8cb-1a64-4081-bdca-08db4120d905
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 21:55:54.2557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPFEdfGmbqsFvvV42oV2kRd53iG7u/+Xmn8oqT2m/kFt8P9VCHccQPelSbZbiSB7zMD2nVSIPVkDrGC1jNIKk/f6mt2RtwFp4oTkYgHSkLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6738

On 19/04/2023 11:46 am, Jan Beulich wrote:
> There's no need to write back caches on all CPUs upon seeing a WBINVD
> exit; ones that a vCPU hasn't run on since the last writeback (or since
> it was started) can't hold data which may need writing back.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I find it unlikely that this is an improvement in any way at all.

You're adding a memory allocation, and making the fastpath slower, for
all HVM domains even the ~100% of them in practice which never get given
a device in the first place.

Just so you can skip the WBINVD side effect on the L1/L2 caches of the
CPUs this domain happens not to have run on since the last time they
flushed (which is already an under estimate).  Note how this does not
change the behaviour for the L3 caches, which form the overwhelming
majority of the WBINVD overhead in the first place.

So my response was going to be "definitely not without the per-domain
'reduced cacheability permitted' setting we've discussed".  And even
then, not without numbers suggesting it's a problem in the first place,
or at least a better explanation of why it might plausibly be an issue.


But, in writing this, I've realised a real bug.

Cache snoops can occur and pull lines sideways for microarchitectural
reasons.  And even if we want to hand-wave that away as being unlikely
(it is), you can't hand-wave away rogue speculation in the directmap.

By not issuing WBINVD on all cores, you've got a real chance of letting
some lines escape the attempt to evict them.

But it's worse than that - even IPIing all cores, there's a speculation
pattern which can cause some lines to survive.  Rare, sure, but not
impossible.

Right now, I'm not sure that WBINVD can even be used safely without the
extra careful use of CR0.{CD,NW}, which provides a workaround for
native, but nothing helpful for hypervisors...

~Andrew

