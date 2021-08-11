Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D973E8BA4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 10:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165558.302528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDjQH-00019t-32; Wed, 11 Aug 2021 08:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165558.302528; Wed, 11 Aug 2021 08:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDjQG-00017P-Vu; Wed, 11 Aug 2021 08:17:12 +0000
Received: by outflank-mailman (input) for mailman id 165558;
 Wed, 11 Aug 2021 08:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxqi=NC=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mDjQE-00017I-Um
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 08:17:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49b876f1-98a6-47ec-b264-3c2a8fa97b82;
 Wed, 11 Aug 2021 08:17:09 +0000 (UTC)
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
X-Inumbo-ID: 49b876f1-98a6-47ec-b264-3c2a8fa97b82
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628669829;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aiMplrk+BqetM3E2zsjnR+pGPmUnWCbXCMBV2jqz1TM=;
  b=Cz7P6r2+xs2uu8Ya+wGL3R55JPrOXBf59mQjhbtQpGrVa7l8OtGOHu3N
   wIMslBHeZmHCOrDhA0TejA3C0b+GkKTmAibCYJ3qP4KcKc2K10Eo1xJG4
   jFZGi6HPT09JeIKHbJcR1veBPr7CO6wF4BzT7nFzswPhqLk5oZ6H37O2h
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Lk3BTADuc9PmmOJB0yWrThC4hlE0s7R/jN3a6Lpc8Jxgr7X4kOQeNfwtm7/M0LchFd+L+RdZTl
 zfPrZRta8QIcOmufYVIT2By+1mOf6XX2cGLO6+jJgcQqJUrvW5J1szYTgF/k7mjK/NDiA2ZyZ3
 bcHXNlE68c4xzI70ftYTjc+tWaEKwLeDuZwtPO1YrMkEPNWImDWsfX5BJzNDtAVaU3dM6gQZAt
 fieTdFH2wQG/wrQHKM9x3KdsJr6zwTMp7W8C3fjesxOvWyelUlORuAbPOgyYeJSYp2/N1ox1Wf
 KXfS2PzV3Tx42EZ4xkaeSfyD
X-SBRS: 5.1
X-MesageID: 51893910
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/Ark66gA9Xk1MQfK/ar9I9ZCP3BQX1p13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskqKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkGNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAU0+46MHf8LqQffng3OXNTLu
 v42iMonUvFRZ1aVLXAOpFTNNKz1uEj2aiWLyIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsl1P73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhP12dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1bkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjykB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11MfguBEZk5DWStuf3Jy/PB8i1Nt7SlEJgojtY8id047hdYAo8Iu3Z
 WdDkwA/4s+PPP/bspGda08qIWMezfwqb+lChPaHb3dLtBxB5v6ke+93FwE3pDfRHU29upFpH
 3gaiIViYdgQTOgNSWxtKc7uiwlBl/NBwjQ9g==
X-IronPort-AV: E=Sophos;i="5.84,311,1620705600"; 
   d="scan'208";a="51893910"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/P1+ux9mHVOLxMeDOBsoV9v4M6Cu8m/Pp+GYkISx1X7C+3GS1YexiZG4qKFytNTxZVvlG79xLiuCQeA+tPqE1zPAtWJb4rdUcH8bFAM9lX735gBgdTBwHSpF8/nITLPjXrfgXTCPjGyfhhzVBRKIaL0kWjnXi2BiGyZrT5YYBy2AUdmmUv28nUJ01OfOiSaiTpcMkn2IT9Prsv0FHRLVTQp80Gr7Xdwt4kR87w2UEJIk7Thy8fhzPvBH5oXar/PsNU/0M6UXupIEfKbUpGoXllml4NSJGD4lO2xFSmTEwW67JZ5/7gFuY0gDQC1011U7wsyBBMtoORA6dOQZJQFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI+Si/T6HhGUwGvoenX/9+kXhOBmrCtLoip7oz1VJhQ=;
 b=ZYKSHkzZ8aeHzVYLva5P450Y5bT7mTXHSIA1fDQVJKN1AR/mNSBQl7YfHRfBEmmzgnzZ8sSTBjD5Im6M2HtO0KoAavODEmffoZei6gJ8e++mfb7JcCeh2f49ktJ9byqoTk/pVHoCO3+1NPtBiGL+KT+0mvsRKQpfNs1QruReery0HLDTGP+Qf635cggZ34AR7ZY9+7jY+kpw8MBGwcsyZS+AAlQtsjL/jywv59STDqj010zTfrBHouzvpfmZGdd/PXpegsmHnwM/FQW/PUHv1C+IvHSPcCFeM6q4OIUcElA2YB/kyGiUvj4Q2tcChbg3w/Z+E/0n5znpAM1gQmteZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI+Si/T6HhGUwGvoenX/9+kXhOBmrCtLoip7oz1VJhQ=;
 b=HoB3XChtjno2iRi+f4uNslMSGfN7QWf3NGwKNFjLdKDLufCJEq1P0Kail6aNdaPdDtjGp+hEh5KYfX5ZUmGLlJpGrjhnstJ64Q3OZjeSBSHXPDZTeGZnIyYMPueVyzgWptZrxLPiKDEeqat5IXQgpesKuiZF8k9xHtglTxudk2U=
Subject: Re: [PATCH 1/2] xen/kexec: Remove use of TRUE/FALSE
To: Jan Beulich <jbeulich@suse.com>, Kevin Stefanov
	<kevin.stefanov@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <20210810174737.56297-1-kevin.stefanov@citrix.com>
 <20210810174737.56297-2-kevin.stefanov@citrix.com>
 <7117c3db-76d1-5550-c34f-c16e95c0e73f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <44223c86-2674-22a3-a055-1ea47ffc619f@citrix.com>
Date: Wed, 11 Aug 2021 09:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7117c3db-76d1-5550-c34f-c16e95c0e73f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4ae3ae1-92ae-409e-e4a6-08d95ca05f31
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5504:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5504805C924BCEC599915AA9BAF89@SJ0PR03MB5504.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79pvWhBh0wDLPuvSzZeKTQCMPKE5lt2jqgWpJisq+dqoJ265tw92gvs7JD5z5SmqW51OmESi3IrvpkeBQltD1jCT7DWiE478GGivVAOyOrKVo/GAfI10THkX+9pkRFuQOojE7giLaj2hCtSlb24VXoibQmMK4wGAFJaEd7AXxRjEr84tY+Y8l9RsEobSGNbcsnXjbFbTVQIicG4/XpSWbKxzB9dtZWETRer0LFDIoYAQBGilSLJnqPgJsMFFsYP0bmGHH9YDszWItAttdnjWAY1WXS1/F0ErlNAtQFgiTT8WGkLdLJzE60en+ChO8tmivHroZ33RiBKLz9C9qb+MfWT+lAFgbqx7OQIVXl6KmGmue34xyMMurMcRs2iJdkd1nW3N/GVR9dMFNYFSSaRi3lAm7wvpC2JRQ2jYks7/ovrG+fwh9smB9xR940MYsIWjuMJ1KJ1S4WnTDZYLIPw8ETjqAMq6P4gMPS1azar1qXrxN1OobIip90ZPE0Ina/WQGnEmZXKnW0SZFuWLypb3Tl12ccslheN74xL2IqTEV4EtNnpTakjnyq6l6KoOQuQfbvVpTLk2ZVbxlW27dCCa/b3YriNA/kJfZDsWmjKD4xm5I0geF5p659hIP/G2AIpc9kiaV/ckcTsZxAY/uXEAEa1g5PPLq8f7HFURFm5VvGitnUGPv8By/UPwww3CZZ+IBk5PyMiE77GWzqRk0H9ARAZ7jcho3EcGyaNWiyWntys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(66946007)(66556008)(26005)(66476007)(31696002)(8936002)(8676002)(31686004)(186003)(6486002)(6666004)(38100700002)(478600001)(956004)(86362001)(6636002)(2906002)(2616005)(83380400001)(4744005)(36756003)(316002)(5660300002)(53546011)(110136005)(4326008)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnlSM1dZRXdKcUtMVXBDZlJaWEl2ckJsS2ZiNTR5NkRBSk1vTTBDeTltYk1h?=
 =?utf-8?B?cnhwSUd4UVNtZURUWFB4MFNFMHp3VnF5ZEsvZWFPbk5TYzB0ZitUN1dUV2dD?=
 =?utf-8?B?bXE4S0prRTBsSTlYYldvT2RORnFaNXZGc2wrM2p1UGZSQlIySlpVRit4RjQy?=
 =?utf-8?B?NXljY3YzWGhuLzlrSjYvMDhNMjlycmJ6RkRBdm9obXZHUSsyVjE1L25vUmRJ?=
 =?utf-8?B?R1BZY3pCeFVxcElTQ2krL0dibHdiMWNua2o0OG96Vy9NK3lWL0QyblhxUzhO?=
 =?utf-8?B?OEJQOFdYRkM1dDNYRndvSVhjdkZEUjRjam5rUEhYUWQyOVFMbTRFa1QzbEl6?=
 =?utf-8?B?ejNMMWVIR29nVTBLdkZOVnlzRDU5YlZ1T2tTODBPMFpIMVVXcDVBUWNjZVV5?=
 =?utf-8?B?bmFIaVdURnc4QWhRVG9xZzMybGFnelcvZ2VuSmJqSWxRMHB1R3NNdm1Yc04w?=
 =?utf-8?B?L2RpVytrZEtObU5zZVoxMlovOTlZU0xuSzhxaXZBemxrRU5oaFVFSnVxc3No?=
 =?utf-8?B?VW9Xc2xVS09uZEdKN1JBOU5nTmdYUWRvcWpubVpWWExGV0RMbUYrWEIxQTRo?=
 =?utf-8?B?cXdKQkRkQktjaGZLUEtpbERlMkVGL2VZd0xDQTJidk5IUnNWczlBZ1lhdS9m?=
 =?utf-8?B?Y1Y4ZW5oZ3BjY2plbHJ1YmpUOG1pb2hOQllpWkhPR3ErbkpVbGxMWTZ3enBZ?=
 =?utf-8?B?a1BQeEJOZStodG1BNXVnckdBUFJXWEJGazVNdU9OOXpKaWxoeXZMU2piUXBO?=
 =?utf-8?B?eEtuVTFZRE1MdllPS3FnYkh4MzlpVkgrZ2Ewc2d6Y1AxYVQ2SFoyYmdDa3BB?=
 =?utf-8?B?RFloVlVSa1NwSC95MUxvdXU4RGN0MnFQSVM3eGJIWit4VCtmamRrZElrYUgy?=
 =?utf-8?B?RW00N05hZDhOZ0pET0NZSGRVL0NpMkx3WlROTGVGem80MWdJNjBIQnNIY0dP?=
 =?utf-8?B?V1I3TkNCcHZjMFlSOERLZWZBRWltWlZvUVNWbUg5OTRXUEdDREErRzBQRXht?=
 =?utf-8?B?TVBjU0gxWnZMQkVWN0l6OWVNY2tJUFJYR1BkTkNET0pCNVZUVExEdWpyNENC?=
 =?utf-8?B?UFdDWUZjc3JHcUtTd2Y4UGd3Y2Y4S1k0OWU3bXU0ZG5UQW1ZUW1DdjZCL1ZY?=
 =?utf-8?B?N1NJMzc0WEdrYUpjakZ1cHBrM25nZkRucXNoMVlVKzdDdHl2UE9xeWw4YThV?=
 =?utf-8?B?a2ZHUjUydGkwMTlKTUU5V1FzY1VPUXRZT2lJczVtUEU2Q3ZUZWloajBjblpD?=
 =?utf-8?B?N3F5aXdYWGZodW93cWV1d0FRT2F0bTVGTzdFMUc3a1VMZC9YVnM3OG80c1F4?=
 =?utf-8?B?RC96cEh1Q0NBeWVmbkduS3lMNWxJVmg3Mm1KNUhQTjd3Z09CdVhaZmxjQVdi?=
 =?utf-8?B?bm9tVWcxU09oUHFQZmJKTk5LWTNnT1AvK2s2QXQvQ1Z0MWJKQUJqbEpUTGJv?=
 =?utf-8?B?akdZbEI0Z1l2dUlreHNSWFdBMmxhRExvQ0tkSlJPTFJvQUkzNDBseTl5V1dq?=
 =?utf-8?B?bXloNGl2MXhQenpxN0llVmhBeGJnQnl1VjlCdUcweTVwVTJyWG55NnBIcWY1?=
 =?utf-8?B?ZyswY2xBNDBQbCtHeXNjV0lzMmFmNjBIaXJsTy9hQWk3TEsrMDR3YkpEVnRp?=
 =?utf-8?B?dkJXUmZiTnJjMk5pd0huaWdnRUU4WVZlL2J3blhLY3k3UThjWWczM3BnbVlz?=
 =?utf-8?B?cHVmdHYrTFNLc3lZZTd3cDlKcUhoOVhnUXlVcU9HU282aFFNZVlmSUM3L093?=
 =?utf-8?Q?SLZfwVJ8563cgzPlD7GQdVHNR79bSPRODUD4EDw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ae3ae1-92ae-409e-e4a6-08d95ca05f31
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:16:51.3192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYacipTP0ZjsnhQfby1f/uJPTJuE4DXYgqilOdHEJ9mBR+/E0B5+j/V3Smu7v+r1ZCAruQn5X0Q5WRElPPNaONnEwNouaN0rBwB4VYKvliQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5504
X-OriginatorOrg: citrix.com

On 11/08/2021 07:08, Jan Beulich wrote:
> On 10.08.2021 19:47, Kevin Stefanov wrote:
>> --- a/xen/common/kexec.c
>> +++ b/xen/common/kexec.c
>> @@ -35,7 +35,7 @@
>>  #include <compat/kexec.h>
>>  #endif
>>  
>> -bool_t kexecing = FALSE;
>> +bool kexecing;
> While not overly important for either of the two present readers,
> I nevertheless wonder whether at this occasion the variable
> couldn't also become __read_mostly. Andrew, thoughts?

Yeah - forgot that.

>
>> --- a/xen/include/xen/kexec.h
>> +++ b/xen/include/xen/kexec.h
>> @@ -17,7 +17,7 @@ typedef struct xen_kexec_reserve {
>>  extern xen_kexec_reserve_t kexec_crash_area;
>>  extern paddr_t kexec_crash_area_limit;
>>  
>> -extern bool_t kexecing;
>> +extern bool kexecing;
> Later in this file there's also a #define of this identifier, which
> imo then wants to also change from expanding to 0 to using "false".

Sounds good too.

~Andrew

