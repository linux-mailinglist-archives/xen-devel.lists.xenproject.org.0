Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A83EED7D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167863.306460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFz9y-0002xy-HJ; Tue, 17 Aug 2021 13:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167863.306460; Tue, 17 Aug 2021 13:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFz9y-0002vl-CT; Tue, 17 Aug 2021 13:29:42 +0000
Received: by outflank-mailman (input) for mailman id 167863;
 Tue, 17 Aug 2021 13:29:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFz9x-0002vf-3O
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:29:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c29ce6c-ff5f-11eb-a4b5-12813bfff9fa;
 Tue, 17 Aug 2021 13:29:39 +0000 (UTC)
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
X-Inumbo-ID: 2c29ce6c-ff5f-11eb-a4b5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629206979;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N3z7UoN0fDFWDKVup/s95Gx8Dtwdmm/jO8VXDlGWjzE=;
  b=P8rQfZ/bL3Teyt/1Q19+KWeYVf28GGirXwHAVQRIr9YZDv4YiC/HoJYD
   YROBgFDaXZTtm6nxOAIs0SrrKJsik+wsyTdfHJKZTqMSne0FlOsKyarF+
   MrMQIvyuKdg68qA7S3o/MiqNHe3gWUf34ONGFjxTBGpzMRfXvXyWoiLpr
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UaP5wR5z87QXi2C9Zot0t/Gu8FA6hVO6V4JSCZxTEPjVzSP4JThGvqjRwETxIl3IwP72axNxC2
 4YMweIsLHOILVQV/aV/RQ9Qyt1/RPrOk0ecoJ797n3haosm+GPxgOU85WKUspzxf6EU5xZOcp/
 mVJKeSN7bRBRU1UNjAIS8C5cYUNOSOIbss+xqREpQuhPtRJHTXWubIgatf8Gayijr0DtEEjAP5
 Q01Rbj8swEqjQB5KFt2EtoLfpJJAqEx8Z0+31lmH9CZv3oI+UIK5YU65qSmwc56lFN1afDQn7c
 qGjPjUnMd4LKjfHZ1WPbCFRh
X-SBRS: 5.1
X-MesageID: 51023748
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:S4dqtKjj1O6uMNk/0XymWXMVC3BQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-IronPort-AV: E=Sophos;i="5.84,328,1620705600"; 
   d="scan'208";a="51023748"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaMJlgDNmkU/2UP6UfaPE/o2FN67QsuU+pLS0UEtsBM835UdgPL0MS5x3Mmqjf8zWted5k/KtYqc+x8JAYEJujE1Ai/hRe3dBa0YO1DY0wYC6AD8yEeQg8JJ1odlOoVWMJYgvLseYXZCjcOBIYBy21kGO6IJ5uyOEYFkuNBciuDdT4nKVZHheuGbIk9yJxz1urjjuGP91VgT5qVqtlcyYrtR2k0gHfMbNbFM26uo3QQCQdoW2/ff6ePXmJoeZF4S+2Zz30agUTLh5EsjTX+nm1KifFNFKAwLGH3qZrQN0/dfpJuUH4NHed6RfzKexhQSb/8ItuyiSg+yfq0+2USf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmSTbMcyqFYQARv6Xx0iZ9QnEzqoQ/xS14oClgrkyrU=;
 b=eiBx0s30Et7bZmhhged1MIv1o16qr6m5mFNJ6RfrCZDxCXX2eUkpAZ9DQlgcQkjogK9WPQGxILx/o3BmcSWMaHm1NGvdr4v/u4YVy2dIAD+dXEx8kAwoiKKzJbsJC7d09wFa2vIY3T7GQVe+XEHWfBaalCvZ7DAisCkIbEyKzG9M8pggHrALSCfNmfDZTougq6dZFd+IX5uSnWxqrdLMIjn9NEFN5obFr+3dZVfFfPUi+ODCgKthB9jK2YcbCRhcHhXmVxFt5AhYUhDOv1dMo+l83ChDWqCpMh5k7a4/267W47c9a40f8lIlsAAEuPyKHy9FBg6aWvG4jONXOLGULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmSTbMcyqFYQARv6Xx0iZ9QnEzqoQ/xS14oClgrkyrU=;
 b=izbknZB7JVPxemy9m92QsLkMLkuwW91SKgr61JS5HFrrCKDFRByGagvVROFzxKxz9iVLXqup1CiprahqEdtJmTyWWachxY8Nh4oQ2Zl0a26jTdTBN/kqxjVyE+BvOxWlb9SHRdLSDnS/M4UIxjKwpyQx2AWm0NOwv5J0vNhgDyY=
Subject: Re: S3 resume issue in xstate_init
To: Jan Beulich <jbeulich@suse.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
 <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
 <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com>
Date: Tue, 17 Aug 2021 14:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec9add12-54fa-4abd-191c-08d9618308a9
X-MS-TrafficTypeDiagnostic: BYAPR03MB4485:
X-Microsoft-Antispam-PRVS: <BYAPR03MB44851690B230BE7A126A758BBAFE9@BYAPR03MB4485.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6yhxAJr2ffAaJgUL3x4858Cg4tZ011v146a/dApFNxyjRZd5UyEBEW3l4tmefdUoxaTum/oMhQC+gHqPZvuwLAE4FuA2z0d+s2FlDM2XhmOGd8bkTd5eL1EENK5Z0TKQbMVsjtAEjvjS7VQPe8dEtbMC02uqT+ednQnLf+Y+grBksu3CTNY1WiWUWllE1DasmoMLa6C4tGMtXau3NIDA1rY6wpVxVeR1da9v2Pq1JcuH6PKMI8KfgZYe3vPOAE2ZScuHyDSG39OpIJVLTX1CWmqLkv6zJvUvBEhDGJMRrDZv4mKZC+9s07vgkzcd7WVDpXSs+lWzUH5Dg4PIecv9MWUUXFxNwyt9b3JvP58qijyXKIO9aCKm+cCrDwxxsQ+yROe079y2Hm0kShSsMnTc4JGOIomJBhHANHuVkp/921OCeVnR7099z7BZB2kE/NGbyAzznQIvNqghwkUGS8oLQ+pHyf3COI/PfugO0isGmApSO+Zx22WOJAoU5+TkFyWE5kVqtypJkJE9r56qUMz9sreweLTNchXXCXjwIrKXm/a1c4TPFwRmFxFbLeOfSv/783UYx5NCQTWBh2S8Ty2YmhGBRFiICYXaPzYHkgjyZd5NCw8Nn2E9BneNIFAJoCA2xnYuCu4uWupCg8jec1PlmzS1d8vM5zdFq2lKNu14rVAiO4IgVzN8MYBFTMBVuBcCDNvHeVok9VR2cXoIUYcKPFoHv+gV0CcokyNMtzwJ9RE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(16576012)(316002)(4326008)(478600001)(186003)(26005)(8936002)(54906003)(53546011)(8676002)(66946007)(66476007)(66556008)(2906002)(38100700002)(6916009)(5660300002)(6486002)(83380400001)(31686004)(6666004)(36756003)(956004)(2616005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am01OUJseTZybW9CS1M5VVhoZDBwQXNIOTZZeUVhZzFZdWZsNWwweDBBaGg5?=
 =?utf-8?B?aXlDa3N5WnozS3UyamY0U1hrOWVBb0hDUHl4Nmt1bzhkZUhOcUVxNUR6QURl?=
 =?utf-8?B?Y0xQbzU3TUk2bjZLUDk4WHBZU3llaDhxc2pZRW8rVnVYTFJ3cVpNbCt2RWZL?=
 =?utf-8?B?M28zalpodDZmL09EcnBsOXd6K1Jmanh6RnUvUk5EOXNVSWxwb2ljMHBJR3Q5?=
 =?utf-8?B?UGI0SFBKS205MTY3N0hOV1dTTG8rdWo3VGMrYUUvWUs3anAyWFhyZlFZc1JT?=
 =?utf-8?B?WVU1T1hhOW5CM3lUQTBjZjRWVEF5MUdRQWJSOE5mZVNncjJxSTgyWG8reFpW?=
 =?utf-8?B?bG5IZ2ZLUmlxeVR0ajVtS25rYTNKK3V3NDZ3K2FpNWdOdXR0bG9USC9YMFZE?=
 =?utf-8?B?ZFFGbXk2eXhUWmRDOTFwSC8yYVhMWHQ1RUtnVGE1VzNiS3ZHbVJveGZxMUYy?=
 =?utf-8?B?WWxWcjNaRFlsdHV2UXFXNlh6OVZkY3JOb2tCMnRKOXF6RnJwdkkwbk80cXpj?=
 =?utf-8?B?TkMra3p5MHFYOFlQSlZoZ2pTTmx0QmdzM1FSSHBsNjNDZjZSSXFVcTB1eU5V?=
 =?utf-8?B?SXRxM0FSWHB0eWV3OCtqT1hwNkc3VHgvT1dSbEh5VU1TaEtLalREOGtocDFz?=
 =?utf-8?B?eGtiV29wZENpRmVSb0E3dFF5a1NVL0V4S2NQbDdFSW1abkVoU1BBOWtmTU95?=
 =?utf-8?B?cmg3L2tJQzZxTlJEMDlRc0RtK3NoZHZLUUdIQjVqOThCUE5mWUhOOE1JNkor?=
 =?utf-8?B?K1Q5S3ZCbnZuU09IdTZOQ3RLMVFVVXZlMmo4S05OOTJLbmR4b0VhS2E1Wm94?=
 =?utf-8?B?aEpTL1JnZS9BQUxndVNJUTZrZm9mZm1qcGZuWG1pSkNIK1REV1ZrcithOWpV?=
 =?utf-8?B?ZUxKUXk2TUlQUnJKaVUyeVpzVTF0bVQ2WFVNbWpZMTZCZnRqRDhzQ3JMeTJC?=
 =?utf-8?B?d01QS2dycGdJNDdOS0hZN1lZOU5wYWtiRSsxSlNXTWYvdm1FVitrdWpSQU84?=
 =?utf-8?B?bjNCdFlsUjg2UDg4NnliVmdpazZzaTNyRG5OSDZvOWtqbFF0S2xFaWw1U0po?=
 =?utf-8?B?QmVpZHMwNGhIS1VoZ2ljcitkcXNaRGw1SjFRL3JBY1RQZzRyMDNhYVE5VEtQ?=
 =?utf-8?B?UUg2VjVWM2NzZjRwd3UzR3hONzdXV3l0L3hoc3haSDN3RTRCQmFvb0pqalcv?=
 =?utf-8?B?dEF0cnhBNzdGU0JPYkVzZ0tRaTBXOEZ4VnE2amFiMjBvUVJ5eWwzMjJVakRG?=
 =?utf-8?B?OFJyN1llaG5oQ2lxc0R0QjJLeGNjMEhLMUxDbmZycVA2RXdBckNMYTZkMERT?=
 =?utf-8?B?eHN5T0lzQXpNdWFwbXl2WnNMcjhCbndaS0dRalMwV1p1WjFyUjNwNkQ3NU5h?=
 =?utf-8?B?cDZvc1lPSHJoakwwSkpxZ3J3bTAxNkZZemVGaXVxaU1HenhCck5DTlhhT2Fk?=
 =?utf-8?B?NW4reW83aG9DeHRLZFFoKy9LdEtSWjFNRURQdTl1R2cyRSsrcUwxdE5ndnJl?=
 =?utf-8?B?UlJRT3UzVVVpNSs2Qyt3Zkw5TEtvSEpMbHI5anpralcvWWpMemZCOWlZSUxO?=
 =?utf-8?B?ZlZPVHhuS3RKUWU2cEVIV21VMHNFVk1DVEt3c2pmWUNlTWd5Wm9aM0ViMkRQ?=
 =?utf-8?B?K0p6ZU41a1k1ZkJnY293WXRTWHpCMlgwSjkyWlYwRC9tV3g3anRaaW5tb3dw?=
 =?utf-8?B?c0s5WkxHTHkwZVBEVFFDOWZWOUF1bXhtMTNUSVBuT0xIS1VTSlFWc1c3ajVv?=
 =?utf-8?Q?UGrwMbEBAbrmyfIctV63Jv9R6B1GTwcqZ0pS6aN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9add12-54fa-4abd-191c-08d9618308a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 13:29:26.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Orzcf/i1f7PRCrajYPsIGrREqCCqo56sWA7rnfZGEofz5SngybJs3pfwMF7t9gGvTyHml0D0BUH52PJpUAhxhEpKdAI9gXva/Y4/0tFLMRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4485
X-OriginatorOrg: citrix.com

On 17/08/2021 14:21, Jan Beulich wrote:
> On 17.08.2021 15:06, Andrew Cooper wrote:
>> On 17/08/2021 13:53, Andrew Cooper wrote:
>>> On 17/08/2021 13:21, Jan Beulich wrote:
>>>> I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
>>>> write, due to the cached value matching the to-be-written one, yet
>>>> the cache having gone stale across S3.
>>> This is a rats nest, and area for concern, but ...
>>>
>>>>  I think this is to be expected
>>>> for previously parked CPUs, as those don't have their per-CPU data
>>>> de-allocated (and hence also not re-setup, and thus also not starting
>>>> out as zero).
>>> ... we don't deallocate regular APs either, so I don't see why the smt=
>>> setting would make a difference in this case.
>>>
>>> To be clear - I think your guess about set_xcr0() skipping the write is
>>> correct, because 0x240 is correct for xcr0=X87, but I don't see why smt=
>>> makes a difference.
> Right - as per my later reply to Marek I don't see an immediate reason
> anymore either. I could see an indirect reason via different scheduler
> decisions, affecting what ran last on the respective CPUs.

Modern Linux has stripped all MPX support, so won't set
%xcr0.bnd{reg,csr} in the first place, and will differ from Xen's
default setting.

Therefore, I suppose we have a real difference in Xen's idea of the
lazily-cached value depending on whether we're in half or full idle context.

>>>>  I guess an easy fix would be to write 0 to
>>>> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
>>>> to the early "if ( bsp )".
>>>>
>>>> I'm not sure though this would be a good fix longer term, as there
>>>> might easily be other similar issues elsewhere. IOW we may need to
>>>> see whether per-CPU data initialization wouldn't want changing.
>>> We've got other registers too, like MSR_TSC_AUX, but I don't think we
>>> want to be doing anything as drastic as changing how the initialisation
>>> works.
>>>
>>> The S3 path needs to explicitly write every register we do lazy context
>>> switching of.
>> Actually no - that's a dumb suggestion because the APs don't know
>> better, and we don't want for_each_cpu() loops running from the BSP.
>>
>> Perhaps we want the cpu_down() logic to explicitly invalidate their
>> lazily cached values?
> I'd rather do this on the cpu_up() path (no point clobbering what may
> get further clobbered, and then perhaps not to a value of our liking),
> yet then we can really avoid doing this from a notifier and instead do
> it early enough in xstate_init() (taking care of XSS at the same time).

What we actually want to do is read the hardware register into the
cached location.  %xcr0 is possibly the only lazy register we also do
extra sanity checks on.

~Andrew

