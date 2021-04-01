Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5035155B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104493.199897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxij-0008Ly-4C; Thu, 01 Apr 2021 13:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104493.199897; Thu, 01 Apr 2021 13:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxij-0008LT-0l; Thu, 01 Apr 2021 13:50:49 +0000
Received: by outflank-mailman (input) for mailman id 104493;
 Thu, 01 Apr 2021 13:50:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRxih-0008LM-OJ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:50:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e40da771-d78a-4ad9-ae9c-2453c5c395c6;
 Thu, 01 Apr 2021 13:50:46 +0000 (UTC)
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
X-Inumbo-ID: e40da771-d78a-4ad9-ae9c-2453c5c395c6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617285046;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KOhBR+TwmHONKP8NUKnlbDgNAxDW7eUvuXoXcKdhAdU=;
  b=IOAS6hji6Qch0kWYXEFeskyJeYlPcx9QFv/N5bXiS5zdlJyauwRig3e5
   HnJNvzmerqqnMkoZDCeVmceOBjLPphdAw9aRXVFfwLRCll1nhUNzmplLG
   2KRU5sVdJ/GTFiiC5zRYEW+W62yPw42xJ+coCOP2bOFqJCXgW0hw0xBE9
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FIuuEByxvXXqzSTHx6zWX5n3C1J+XpSEZUJbsuwMN3BN43c+JZnDNk5et+/i2M5lB0U6qT5X6T
 VMl8/pTotN7LkmYBVsvnFXTJOp3hykT0R69DcpFuhK3uxmxaVRXpLYB51h7A6XR9eeu11I2UGa
 MCeT9LB48wnJZu0MJjzW7kn39ERik03MxDNY1Y7U5QLqA5lOA2vaJXozYJrXYkL/nYrEp8apMs
 Sq9Q4ktRlDr21IHpSX+zkxdtcJlFiyBObo8nG+8NFIgkZo5D5/+wt5tppsT0aOKLKhxT8SteZu
 4Xc=
X-SBRS: 5.2
X-MesageID: 41077323
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c3prV6EocDe/9joJpLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41077323"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu4BJv4d/hweqghaY+7fAQSPqlyP3yToD9n+CpB68TeHDi8VjUONzQhrpaKAa2XNxg2dVwI2CH4MnLZ7Bl/Du+zu+lc9kvuOhicFMvICXNYrtoWMQOiS2fwACIPmxqlGuUBt9HU/50UklLpocSrJuH43ZR8xK3gRHMoMESbwoix8zi/9KGWpORbYAjUhqaTFNRdCiO/pjJGVpYRXpc+Nr5BIHMZG4dMHYw1fFSx3M/P4vttqaHPBj0NOb7tuY8Qy7EMKO6nnaZ9PsnshbMOFvvzLJafbUVm3CRyLb6CPwglakpmcrEZ8rhckJEPKQ6tcVk9r1aPPvU2LmmTtI9Ln0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zwZqYz71LYljQ/uFikr8FzWhvV4VF3i5ow+RwmBpf0=;
 b=EYDHclIJbNKRwpNDaYlvpZ2Y/2T38/amvEDFYPa+vjdl+Uhp45hoV0ERaIGmFQH9Yt55uo3LRB7+xuzpDKTXSMIbNhyN3mHBGE68y/7zQuzJOfeJLiA6B/GJD+J+QtERYOYgA2s+qd97LsOrGPLjaiu5hAGKsfRrM+ySj6CM0GdVK//HUEUXwDNQ2ZwKeEqG1v0kBYJ8iHndpALNDxd0tmBUiM6PsRRUrKZDH8ueWsw5FOB3B2tzfym0IgWQijteWdGupoUxGLVmfw9Y9pVtB4mJJW7jb2MYA4eq0R4+lIwtG1uawsC49GEJwT6fxc7hhe2soQXMeOLHmN2hFCVUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zwZqYz71LYljQ/uFikr8FzWhvV4VF3i5ow+RwmBpf0=;
 b=ufu+aboN958pMtMo3Srb7LNFIY7vKjqaIRifl5ExtQHSHTKFUyh1MaFYsCYKkv7zT92CohiKlnKfpJtHbcOgbgVWijDFNEQUH45OiEU0jWgKxNyoFoYGbzF1WamAnIAni8j0NqCkNYy44TG0iH/7YmUKXMA8bnbST8y+uNqedmg=
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
 <95d8688b-2e54-ae02-09ce-45203959e08a@suse.com>
 <ac94721d-1741-5523-e70d-1eac15c23603@citrix.com>
 <d4d0df58-58a3-b21d-db5f-4895a36bb917@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <defcd279-6ed5-f086-51c3-321c8b90ce3c@citrix.com>
Date: Thu, 1 Apr 2021 14:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d4d0df58-58a3-b21d-db5f-4895a36bb917@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27df3d95-37f7-409a-570d-08d8f51523f3
X-MS-TrafficTypeDiagnostic: BN3PR03MB2132:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB21324E1B5FBE5A20B6916CDDBA7B9@BN3PR03MB2132.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TYla9HZ0Pc7n5EUT7IKFyXAqKfwvzeVN8vphDEr0jfBV5aTIBCBAWbUSEw8ndgnN/pN0UQ5a+f6aZ2oE2itYD9RIuKzluv1YLEX4QogKH9yeAbhBxopzsgsWfktg1rvIGQ1i+aWHEVNrv65Z38XBBZgsrMu9lqsHQ3sMsrtKinFRMzUHuFyCMoQgQYCKU7jo4oJMrbLoT96aG+MJ+RKc+PI495YIRquKC8QpTZ3BlPW8RFBLxBfjrxcG9ja7CSj6jdp5qRyhGgdzx1JIqBnPjEPU8tzikm9B+SNMnCxCGsbmP5PPObPi0Fg3JE4qNYoVsE2r4Bg0qRKO3adxdqnnhAJ11jjfcn1X2ny+xuJ7XbO3U2i1+OXg7kfiCxtHiHKTSTdQbAMLEGQgRp3mtDZCX1375Dy3c2dRNoouLuembTOBMMnznykFhib6YeotCwUI2XWh6tMxst4Z+C1NaH6xMvawUyvHz1zdAocmhP0X8rGqVX8rd25MDnncAoTAKL4ghsL2EgoTRGQX7UXWvRIwYXRRg19CrvKrbHWY/jcYdaC1zgvlpRan1pZfVdn9+yLp9A5o/72ezYLRTvq2FJtin22peVwy+gaxDJacYCpbfOBm45P2skTtuMb14rTVVr8G2CWCs/3hx3U6jlKvGobIip+eLgObktFU3pwTe/o2Ut6O4vwJZqlenNlSY9lLbKL5JMYuN+0/Rz0EnNqBHzahBxr/qGIP4TP+BUcaLPrReOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(26005)(16576012)(36756003)(4326008)(54906003)(2906002)(5660300002)(16526019)(186003)(2616005)(316002)(956004)(6666004)(6486002)(478600001)(83380400001)(86362001)(8676002)(38100700001)(31696002)(6916009)(66556008)(66476007)(66946007)(8936002)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlNGOGxkVXNKekRHOE02UlFZREVRYmpydFozMFhkT0pvYlV5SkJRUFhnU09L?=
 =?utf-8?B?cE9raGRQTUx4ZlI0SEh1d3FEL0E2TnJzb2hFRHRGd0dWSkQ1alJSbUQzWW9X?=
 =?utf-8?B?VytqTkxXZW1zTTY1eURoRTk2eDFWRXl5TEo4c2czQy9ZbFRLMzVWY2ZyOTJT?=
 =?utf-8?B?ZFZXZWFQM2krVmJiRXQvcUhIVUZTSUFLOWZJNGd2WEUzWWcra1JoQm10czN1?=
 =?utf-8?B?c20vSkxidjA1K2VCNnV2YmFDOUVZaVV3eGhYMHMvUEd0RlplcU05WEt6YWNO?=
 =?utf-8?B?eTdWclNpcUtvNU9mdHNPR0tBWVQ3ajZHRE5TNzArN3FXaW1BcXU3WkFDMjkw?=
 =?utf-8?B?UWF4OWI4S2pya3pocEk3VFNtekVHdlJ1NDd0dm9mUktxaUFnei82YkJBbUdo?=
 =?utf-8?B?ejlWUytQQlFLWHZEaTlETEFlZzlGL1Q4Z3BpalFxaFpJNU9FbVJ2eGxJV2Z2?=
 =?utf-8?B?U29QNTJhamV2Rm55Rld5em5iUVQyN1M1OCszaS83Y3k5RXptTmpWOHJPak9W?=
 =?utf-8?B?R1JHanNpVVNrSEIyZjdmeTRCeEZkLzVQSXA5bzJCUVFFT3FGTDYyM1pzNTdv?=
 =?utf-8?B?RzF6dUtQKzhzdEZtbFVCb2Q3dG5uVW1ob3ppOVJvSDZCVnlrbHYzZ2VIdFlh?=
 =?utf-8?B?YU5KNFc3VitiVkR1UC9Scjg3SHJ5VjBLTGw0b1kyVXROeEZ0cE82Ymd5SSsy?=
 =?utf-8?B?NytTcW40d0pyNUNnVFBnWWRSaUIyelMxSGFmQmtQWGpCWTlQbWJGVXh6cFdN?=
 =?utf-8?B?cVhEM3h6VDRSejIrdEo3Qkd3MXk0YWxxTVlQbTEzamI5ZXpDUE5zeEg0dFo1?=
 =?utf-8?B?cVZsdTRVMEhrSWJkZUNobmRMbFVsc3I0NlFZS0V2YTVzbU1oak1UNlowbTRj?=
 =?utf-8?B?Z3hUdmtKc05CRkRacTNTU01FV2w4Tm16SVpnRU5jbi83ZUJHdjVBUzlCMVlw?=
 =?utf-8?B?QjBlU0dpZWt4cFJKRmNVNERkK3d0ekR2NnROTEd3VGRZWVVaRjJwUXFQVlFR?=
 =?utf-8?B?RTdQSkJxNTdTdGpiaWthYkFlMjZqRnBFVDNVc1kxYXRrdjNYemMrNENON1Zq?=
 =?utf-8?B?TVlRaDZEWnZ4cWdGNDQ2NlZ2OU4xVWJyR2h6UDhUTExVMDNFejVFMUFnbkQw?=
 =?utf-8?B?ZGhNdnVpdFJWVkNNQWs0OThYM1FDU0VqS01HSktsVitwRDVXbmNmT05jbWJL?=
 =?utf-8?B?SEFpUXhibnFXdHJHVCtxTUVIS2tZSTBNdWJNRmhwNXorMFFFNEpETTZGdUFP?=
 =?utf-8?B?WXNTZFl0WjdiclFNclo1UUFIUlM3TEp3WEczeTRNWkNBQzJqWkR3TkNWdzlQ?=
 =?utf-8?B?YTdKaUpuNjVXUmhGcXo5UERMb1pkTitKbFJqOHFsZFJFcVJqU2F1WkMrZ1pt?=
 =?utf-8?B?bVlRSlZPOGZJRHh0TXkzZTVQL3JmekFxemhMODcvc01aeXYzOHVKT0MvekZm?=
 =?utf-8?B?ZWsreURWUThTMENxLzlCWFRielg5M2grdmpQazUzSzlkRngzMklXK0pFUjFL?=
 =?utf-8?B?alJORFZLajZob1FZQVJINlRsdkhJcWtnUXFMVVlWRmEzT0JGeUVBM1RXVkFj?=
 =?utf-8?B?RGlNZXBDWnRTdEc1blVVaGF2NWtEVlIzazZyZldwTG5aMmRjVkpQcS90VFpt?=
 =?utf-8?B?cUlKKzJEbmRlRzNOYUFTQnl0QkxiUUUxSkhBb1dwVkhnMzhodFhvblVoQ3NQ?=
 =?utf-8?B?V2JiMHNSTnlqS25DR2N3cVZJYmJoMkdJSDZyalFkOW9abEtHd1E5ZmxUa1di?=
 =?utf-8?Q?8JyVZNot22ys2mI0zDo0vOY94yrb/ljNzXtoYP/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27df3d95-37f7-409a-570d-08d8f51523f3
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 13:50:42.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKOfuio1+nMOxbZQ1o64EpnBZvqhu42eJG9zYxXhSwPOV8rVPbAmvZPeK6Lv1U10nzj51m0O0IV5yQy8xyfaUMRS1HfBVU+ulNXJz5HF/kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2132
X-OriginatorOrg: citrix.com

On 01/04/2021 14:45, Jan Beulich wrote:
> On 01.04.2021 15:20, Andrew Cooper wrote:
>> On 31/03/2021 15:03, Jan Beulich wrote:
>>> On 31.03.2021 15:31, Andrew Cooper wrote:
>>>> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
>>>> path from __map_domain_page_global() failing would doubly free
>>>> vlapic->regs_page.
>>> I'm having difficulty seeing this. What I find at present is
>>>
>>>     rc = vlapic_init(v);
>>>     if ( rc != 0 ) /* teardown: vlapic_destroy */
>>>         goto fail2;
>>>
>>> and then
>>>
>>>  fail3:
>>>     vlapic_destroy(v);
>>>  fail2:
>>>
>>> Am I missing some important aspect?
>> No - I'm blind.  (although I do blame the code comment for being
>> actively misleading.)
>>
>> I retract the patch at this point.  It needs to be part of a bigger
>> series making changes like this consistently across the callers.
>>
>>>> Rework vlapic_destroy() to be properly idempotent, introducing the necessary
>>>> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
>>>>
>>>> Rearrange vlapic_init() to group all trivial initialisation, and leave all
>>>> cleanup to the caller, in line with our longer term plans.
>>> Cleanup functions becoming idempotent is what I understand is the
>>> longer term plan. I didn't think this necessarily included leaving
>>> cleanup after failure in a function to it caller(s).
>> That's literally the point of the exercise.
>>
>>>  At least in the
>>> general case I think it would be quite a bit better if functions
>>> cleaned up after themselves - perhaps (using the example here) by
>>> vlapic_init() calling vlapic_destroy() in such a case.
>> That pattern is the cause of code duplication (not a problem per say),
>> and many bugs (the problem needing solving) caused by the duplicated
>> logic not being equivalent.
>>
>> We've got the start of the top-level pattern in progress, with
>> {domain,vcpu}_create() calling {d,v}_teardown() then {d,v}_destroy() for
>> errors.
> Hmm, in which case you mean to shift the responsibility not to "the
> caller" (many instances) but "the top level caller" (a single
> instance)?

Yes, but the route to managing that needs to move the responsibility up
one level at a time for us not to break things.

i.e. we'd next want to make {pv,hvm}_*_create/initialise() call the
appropriate {pv,hvm}_*_destroy() covering the entire sub-call-tree.

Moving the responsibility across the arch_{d,v}_*() boundaries in
particular needs careful coordination.

~Andrew

