Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44552EF938
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 21:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63830.113203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyQ3-0003o8-KX; Fri, 08 Jan 2021 20:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63830.113203; Fri, 08 Jan 2021 20:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyQ3-0003nm-H8; Fri, 08 Jan 2021 20:31:35 +0000
Received: by outflank-mailman (input) for mailman id 63830;
 Fri, 08 Jan 2021 20:31:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVqY=GL=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxyQ2-0003nh-F4
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 20:31:34 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7acd0644-b23a-44aa-8709-d02812ddc4fa;
 Fri, 08 Jan 2021 20:31:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108KJUxp020866;
 Fri, 8 Jan 2021 20:31:31 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35wftxjccv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 08 Jan 2021 20:31:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108KLWOs013611;
 Fri, 8 Jan 2021 20:31:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35w3g4wf0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jan 2021 20:31:30 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 108KVS8B030128;
 Fri, 8 Jan 2021 20:31:29 GMT
Received: from [10.39.253.22] (/10.39.253.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Jan 2021 20:31:28 +0000
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
X-Inumbo-ID: 7acd0644-b23a-44aa-8709-d02812ddc4fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=G6XoKZ+h/hh/UaenneWEuiTaBXTMPvGSZ2Yxcf99hgU=;
 b=nLefOtLUte0CegNu+fh0SGTbUNjxGdPFzOlWjK7/zeKCBAU8QcQk3vC2lm6S2ioJuGwQ
 W8n/o4mt18RL8QrQzbmy0St1uaawBh9OAO3D0PF+CgcYf7GkLbA6lbGGLSPNQiFHURia
 70urSPJCp5ypnc7FySqkIDqA9koWs+ymTgI0n15NDQBZHpdoA46bM/R9GjTZNRHu/q/n
 VA6utHqBLXTche7YOjGSzP7asJqY11lEwlOWGyYNdCkeJ14gd9XJ1uKmZnaqJUv6lZX0
 zA17k5jpW+pnLUg9rWgjxlw95PQx1qqSRy/7TzazyJG1rkgrT4FHbxqg9S34MQLovzMq iw== 
Subject: Re: [PATCH 2/4] x86: Introduce MSR_UNHANDLED
To: Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrvsky@oracle.com, xen-devel@lists.xenproject.org
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
 <1610051698-23675-3-git-send-email-boris.ostrovsky@oracle.com>
 <63813bfa-28d9-c590-1aeb-afbd4fc2b6b2@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <5c6fbbd5-5de0-8e4b-f4b0-ca05e73be26d@oracle.com>
Date: Fri, 8 Jan 2021 15:31:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <63813bfa-28d9-c590-1aeb-afbd4fc2b6b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9858 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9858 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080106


On 1/8/21 9:55 AM, Jan Beulich wrote:
> On 07.01.2021 21:34, Boris Ostrovsky wrote:
>> --- a/xen/include/xen/lib/x86/msr.h
>> +++ b/xen/include/xen/lib/x86/msr.h
>> @@ -2,8 +2,21 @@
>>  #ifndef XEN_LIB_X86_MSR_H
>>  #define XEN_LIB_X86_MSR_H
>>  
>> +/*
>> + * Behavior on accesses to MSRs that are not handled by emulation:
> What about ones handled by emulation, when emulation decides to
> raise #GP and this still causes trouble to a guest? (Slightly
> orthogonal, so we may want to defer this aspect.)


Yes, that's a good point --- in some cases the situation is somewhat similar, e.g. when a new bit shows up in an MSR that until now was considered invalid.


>
>> + *  0 = return #GP, warning emitted
>> + *  1 = read as 0, writes are dropped, no warning
>> + *  2 = read as 0, writes are dropped, warning emitted
>> + */
>> +#define MSR_UNHANDLED_NEVER     0
>> +#define MSR_UNHANDLED_SILENT    1
>> +#define MSR_UNHANDLED_VERBOSE   2
>> +
>> +/* MSR that is not explicitly processed by emulation */
>> +#define MSR_UNHANDLED -1
> Not sure about this choice: I'd consider an MSR index in the Xen
> range more safe to use, not the least because this value
> effectively becomes part of the migration ABI. Or if you use one
> outside, then maybe a less prominent one than 0xffffffff (I
> guess -1, irrespective of the missing parentheses, isn't
> appropriate to use here).


All MSRs in Xen range are currently handled (although most return an exception). I can reserve the last one (0x400002ff) if you feel it's more appropriate.


>
>> @@ -77,7 +78,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
>>          if ( copy_from_buffer_offset(&data, msrs, i, 1) )
>>              return -EFAULT;
>>  
>> -        if ( data.flags ) /* .flags MBZ */
>> +        if ( data.idx != MSR_UNHANDLED && data.flags )
> You permit all flags bits set here, but ...
>
>> @@ -101,6 +102,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
>>  
>>          case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
>>          case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
>> +        case MSR_UNHANDLED:           p->ignore_msrs = data.flags & 0xff;       break;
> ... you use only the low 8 ones here. You want to forbid any we
> don't know of, and even restrict the low two ones to just the
> three values you define. E.g. for now
>
>         if ( data.idx != MSR_UNHANDLED ? data.flags
>                                        : data.flags > MSR_UNHANDLED_VERBOSE )
>         {
>             rc = -EINVAL;
>             goto err;
>
> Otoh I don't see why you need to use flags here - I think you
> could as well use the MSR value to convey the setting. And if
> you don't, you'd want to check the value to be zero.


Sure, using value will result in a slightly smaller diffstat too.



-boris


