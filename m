Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B479E36CAE0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118828.225135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS62-0003AW-1s; Tue, 27 Apr 2021 18:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118828.225135; Tue, 27 Apr 2021 18:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS61-0003A7-Tt; Tue, 27 Apr 2021 18:06:05 +0000
Received: by outflank-mailman (input) for mailman id 118828;
 Tue, 27 Apr 2021 18:06:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbS60-0003A2-Kv
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:06:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fb75646-08d9-4a58-9c5b-9bec28cea720;
 Tue, 27 Apr 2021 18:06:03 +0000 (UTC)
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
X-Inumbo-ID: 0fb75646-08d9-4a58-9c5b-9bec28cea720
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619546763;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ARRrqWngyUsTEGqu04kX5fw2ebzwQT6Y5Jr8DNKc7JM=;
  b=dcDzlvuJyCViueox2+pgmjmNCp+jJHujTZlGyFhejv+CUTkOoTTrySAk
   nZRcpvDx0dau6uEZu6YdCnNECH5+S9YeV0iB02U5jHE95LZku1TjGSxcI
   P5zk5Ji8oecaFNx2orS1mll73LiOIWewtc1dTv51xDIOMz0g4/KVdn/i/
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 88DkJtVLEn5oSbeLruBjn8A3t8OJLEkFQ5YXhfrlqS/myBJgxVmLCmdCB7N8mOii5hdDqPdyKf
 TcrjVN4f6+tk+YQ7viAoeuiQluGPCh6n2fu039wnp7gYnM8Bzc9Bb7fv6TxUyYEMAsab8ATQov
 y64suw29zEKbqogoQvN9E68gSSBL8tafpCzNNPJx8AWUws3ik8y1rvCd0GmWn6mGpiztux5xwy
 Drn407NT+EghdH2iXXVq33DPaOfkM/QrzTnph9kVTDl3Qh7Zp5mMDoUt6X8BFAVvHWp9A197oX
 vSQ=
X-SBRS: 5.1
X-MesageID: 44041930
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fMmuyqva7ew9O0331zVN8ZgU7skCrIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde544NMbC+GDT3oWfAFvAG0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JaDqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ8bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUtpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zU0IidDq0nkGup
 3hpAohItRS5hrqDx2IiCqo4SbM+nIP7GLv0lCRi3eLm72HeBsKT/BvqKgcVzmx0TtFgPhMlJ
 hl8kjcir9sSTTHpyj578igbWATqmOE5UAMvMRWs2ZSSuIlGdhshL1axmx5OrEaEhn37Yg2ed
 Med/301bJtfVSWY2uxhBgI/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv50s9yA==
X-IronPort-AV: E=Sophos;i="5.82,255,1613451600"; 
   d="scan'208";a="44041930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdcvkmpVhacNnANTd1oWofQuP6SHe1Dmy4g01hLG9cmAk2YFpL7tlAlExM2OF2OWg/lA07QqvbsdVB011DUl0nK7rpXEfgcWNskthJ1SVvMwgv2ewrKTwgv8urhxRHT9yMcKUzp99ETOUcwkWIo7rkN0JPKhSecP3HNYW9S5PUfd8FgEheB7hCIaxWHeChX2IZCWQcJeuH6obiertaehHyyR1D1h2QmB58bXGyjqsDjUHoE2Rv7JZrXE6w6zMGTehL7GJJwwIJ7sVICQw4kNV5yUqej0dgza+Te+bpqAjVQztmGL9VIel70Ba344G69E3iMMY8GguTvFgc555FCtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AwccjTeH6mHGrlVLGtmNRrlrzvyZQE3qRjnJ1R6P1Q=;
 b=O88T3txHTTV4IzasBYM5VaQwTDL9N0Oco/hmk9BTeQULxwlyMdQbtvKHZY4tVZR05MzqUejirVLWeGBpjUjL9mVcZ5sSGe2hfgncjtn9oJrG36Yqcf/067XKd4o7pGWWQr2VHK6Gc7MC4PWI9SnzkRU77ibCbkm+l3DRKRwJ4mJZ2wEjMOJpqXDP1ApcU7bgm5956vhai4Og2uzbRp+oN/JZ5lvmxgtGeo3/qy0g4JkbwIw8j/FIBUo8UhclclOVl4k26QRfFFgaVx0S5xIa+wXHdTX1J++8Xawei+Vs7zjGQw4Dt3U2UALeIi3TrMKr1q9p178PKD8XeQh1tPteZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AwccjTeH6mHGrlVLGtmNRrlrzvyZQE3qRjnJ1R6P1Q=;
 b=G0fehtwD7u8WB/PUAJr0WXn/toAQtmk7sdM2hJjOhQr3V6Mgyao2rMxjqi197C1omow/Bw0eF9OEIYsTUxsUymQbdyzVbcpmBDtIowk3/qspb6Zy2GGeXXVOzDWqBdWtNl5Tc9ekYV2FvdY4xsDL0ZJHgkIK5S3gVi4A+VV4zKc=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210427130201.2142-1-andrew.cooper3@citrix.com>
 <bdc85c8d-db7c-e9cb-d436-317a31f96e69@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: Drop HYPERVISOR_COMPAT_VIRT_START()
Message-ID: <bdd45821-5164-a785-67bd-8f660c6353cf@citrix.com>
Date: Tue, 27 Apr 2021 19:05:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bdc85c8d-db7c-e9cb-d436-317a31f96e69@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0285.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2beefd9a-2bc2-4861-dcf4-08d909a71d37
X-MS-TrafficTypeDiagnostic: BYAPR03MB3799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3799F0F2BB45E92D1D5EF207BA419@BYAPR03MB3799.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMyc8mqwI1K4wjnUcTJyHE6rV/R3DmVFEXsgfJAVbrtYIy1tR4IIQBmwy2WF0Z7pCcX2YymUaKrEKhxIfFulsP4K59PR8jEEhzXpDGeokDhrcjByJ6c4Af38j1sWTGHi3mL9Hv9XfWkXpfbTYS90oA0M9/GWfKqjdhzAQXrU/BgV1ZuKWy2BaC5Du7acko2VVyPm2i7i0XW67Z0s7m+r76DiGFgAMVh+Z8M9+XXHKlEm43re17Jl8E3RFo+NPPqNCts2ztYoxbSzI0OwDZCBmGW4MD8IFzhuxxC6fq2AWziQB8ssZXDopCoR80ShSRyso1/pfHQuagdAq3lWrudegMnbpcdz3M0g02MPtBRwklaKXa070d0WK4dtg09GTIUsFDQAAjj4AIVtSovhtnE202VLzPrTlGNwfVB5azf7shJZgzFvIKGfBGOOHveEniOGtgDkbUDQWJ1oINY389/vOFDj2tVY0ohURhtSxKbBD0n2LLczMYYgZZzi6eEehXGmqIBqQyN+HzjiVRn1vURG5qRTRHhGq2WtU7/kMBVPczUfAX2t1o2uHCS7r22qGW2TpmbQrVHXZybKsSipC+ntjqxeXk6G5Q3fS/mOeef2rLbtdHECvd0cJuuWqYpRVFCl0JzZfxzbPYsYRlVeQXY+HgaaTdT/SRhR+sq//ZAOKQFVzs/t1F0Eps5Yftebapsq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(6486002)(53546011)(2616005)(86362001)(36756003)(956004)(66946007)(31696002)(66476007)(66556008)(2906002)(83380400001)(8936002)(8676002)(316002)(478600001)(26005)(6916009)(54906003)(4326008)(31686004)(186003)(6666004)(16526019)(38100700002)(5660300002)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZDBQWURwbXNiWDdsQTd4eFhwSjFPWHhNREJNK3gyTnZ3UFVZQ2w0R09iQnB1?=
 =?utf-8?B?a2k2eXp1Q0NkbmtLZ09sYzMvSENyemt2bUxyRUFmY3ovOXFtSHdlUlBXek95?=
 =?utf-8?B?a0k0QzFMUm9tWkxleFk5WnFJb0ZKSURNUlErYnRYRURYL1VJenRHOGNucVAx?=
 =?utf-8?B?UFZoMHdRcEtTb3h3OHR1Ty9hT2FVUzNKQXZJTm13Y0FlZ1VSTHorRkdvTmcz?=
 =?utf-8?B?UmxkVTN0ZG1IbDNidWVOZHFnNHowRlpmR0NIZEIxTk1Pb1hsVWs0SFJGN2x4?=
 =?utf-8?B?WVJZc25NWTJrTU5jdnp0ZS9HaVlqQ01hWUlrWUZzS3g5TFRFeEM4MHZzZjZ2?=
 =?utf-8?B?VSt0d0NlTDZJT0pIRHJJYzZ5V1d1S3NLMEFJMWFmVkFIZVFZQmlzRFY3VUU0?=
 =?utf-8?B?ODczaDE5aEtJRUJUdFdSYlpPelFzR3F4QWF5RWxLUUxpTXM5dWFBUU9DOEFj?=
 =?utf-8?B?L2loY1ZBQmQvU1VMYlNxd05lWEFnSFRFbmR1L05RMVR2U1dCQlNOMitmY0VN?=
 =?utf-8?B?OWV1aGUzc2IxYzA2aThSZUFSdjgvZGpjc3hOMzV2Z2F0bGdja0tER3dqak1R?=
 =?utf-8?B?Z0dKOGg3SEs0cnJaOC9EU0JVdjlXSjJyaFh5MlNuZWV5VndVb296dG41M0ZE?=
 =?utf-8?B?YnFWRzZHc2FLbGFVUW5uM24rVlFobkljcm9GNmkvaUJNYWF5dHpHL0Nuc21W?=
 =?utf-8?B?dzY0NG5COVVFVWlIVlFXOThLK2ZKTkswWWtaVUs0LzhHQTZ0bTF0cFRlWFMv?=
 =?utf-8?B?OEF2TnJGTWZrT25QZXgvY3ZJY2cyY1Q1cVNuWkVIM2xYRUd1TDJhS0NiZnll?=
 =?utf-8?B?OW13R2ZwYmJGUU83RHVWbjQ5S0sya2JURVpRaFJRazY1bk9DSnZhbzlUaHJm?=
 =?utf-8?B?S25OUy9GcGRNZDI1UWJ4aUw5TDN3UjRuRVp6bU0rVnBURVJEOEx6QjVtS09W?=
 =?utf-8?B?eEFvVnl0QTVSdmRYQXNCNCtUcTd0Q2VaMzVlRTRPVE9rQnJVdWFSb204UzU5?=
 =?utf-8?B?ZTdSNkZNYm5na2k2T29UZHI1QU9CZ1FnTmdCZFhDWTJxYVNlcFNhbFlNL2xI?=
 =?utf-8?B?TDEyWXZGbVBqUXVkUTJMMFJQbHZLamZTb2lhSG84NUNLdDlFWU1uZFBIcmQr?=
 =?utf-8?B?QkR5UjJSQkI0ZWxBUVpsQWlTdFkwc3hRamptZWQxVWhBKytMclB6SWhDQjNu?=
 =?utf-8?B?dnBQVjVpZUZVWHh4MUpXTDVVWm5uQmx4TGpiZjVOZ242TjQzbkQ5MUlXSkhN?=
 =?utf-8?B?SXlLK3VLaWc3L2NQNjZLMjFmTTg3WjB6Znl0L3FtcTNHblFkODdTNVJOL3M2?=
 =?utf-8?B?NTJpOC90VFd2L1IvbTBvR1plQnpsNXpPSzJhQ0pCZzAwNTQzMjFyRnZqU2NL?=
 =?utf-8?B?b3QzeXFxcFFTWWVuU3cyYXhVSS9qMFhHeVlCdlFiTEs1eHhEU3NISUJ6SjNU?=
 =?utf-8?B?aHZLbVV1SHJiSjBwMW9DQS96dm5BOTZmT2tGNjg0MkpkTXY0T3R1RTF4UC9w?=
 =?utf-8?B?OTV3c3VmKzliTUxRamFsczhqYTlQMGt0OWJpVGgwV3VwMFRpMG9ENlJlK3pM?=
 =?utf-8?B?T3pwcCs0QnYvM25qZ0E1RVBKZ2tYdUNnSm9jRWRJb0R4Q2lCMExma2pCR3cx?=
 =?utf-8?B?ODlKWlduQmN5VGJweEJhOGJLWk51dWJwRkRFWVVCaW1VYTg0YTBYM0JVQ0sv?=
 =?utf-8?B?aGwxUDRqekR5NWFwYnk5VXhQTzc1VnQrL0JTZnhPczdPZCtud0JOSGZ4WG94?=
 =?utf-8?Q?91sBe26SR19VvfeG7t48b/1b5TNhXZmsa0bqm/1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beefd9a-2bc2-4861-dcf4-08d909a71d37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 18:06:00.7662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQZmRkZmnAIK4x+R8Mc+Lp5pEBSVcfpZ+zOUmCGiivOf0JJMw4CxCnSRJVNGfN3R77rgpGuSJ2vy5KRaUPHZC3fFbFZVRRzyLbA92IudpqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3799
X-OriginatorOrg: citrix.com

On 27/04/2021 14:18, Jan Beulich wrote:
> On 27.04.2021 15:02, Andrew Cooper wrote:
>> This is pure obfuscation (in particular, hiding the two locations where =
the
>> variable gets set), and is longer than the code it replaces.
> Obfuscation - not just; see below.
>
>> Also fix MACH2PHYS_COMPAT_VIRT_START to be expressed as a 1-parameter ma=
cro,
>> which is how it is used.  The current construct only works because
>> HYPERVISOR_COMPAT_VIRT_START was also a 1-parameter macro.
> I don't mind this getting changed, but I don't think there's any
> "fixing" involved here. Omitting macro parameters from macros
> forwarding to other macros (or functions) is well defined and imo
> not a problem at all. In fact, if at the end of all expansions a
> macro evaluates to a function, it may be necessary to do so in case
> covering not just function invocations is intended, but also taking
> of its address.

It might be well formed, but it doesn't help at all with trying to
follow what the code does.

>
>> --- a/xen/arch/x86/pv/descriptor-tables.c
>> +++ b/xen/arch/x86/pv/descriptor-tables.c
>> @@ -235,7 +235,7 @@ static bool check_descriptor(const struct domain *do=
m, seg_desc_t *d)
>>              if ( b & _SEGMENT_G )
>>                  limit <<=3D 12;
>> =20
>> -            if ( (base =3D=3D 0) && (limit > HYPERVISOR_COMPAT_VIRT_STA=
RT(dom)) )
>> +            if ( (base =3D=3D 0) && (limit > dom->arch.hv_compat_vstart=
) )
> I expect this (and a few more instances) to fail to build when !PV32.
> It was the purpose of ...
>
>> --- a/xen/include/asm-x86/config.h
>> +++ b/xen/include/asm-x86/config.h
>> @@ -254,21 +254,16 @@ extern unsigned char boot_edid_info[128];
>> =20
>>  /* This is not a fixed value, just a lower limit. */
>>  #define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
>> -#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
>> -
>> -#else /* !CONFIG_PV32 */
>> -
>> -#define HYPERVISOR_COMPAT_VIRT_START(d) ((void)(d), 0)
> ... this to allow things to build in the absence of the actual struct
> member.

Hmm - I really should have got this change in earlier, shouldn't I...

For this example you've pointed out, feeding 0 into the limit
calculation is not a correct thing to do in the slightest.

~Andrew


