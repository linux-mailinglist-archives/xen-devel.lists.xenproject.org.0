Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5632EF96C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 21:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63840.113228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyYD-0004HR-MV; Fri, 08 Jan 2021 20:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63840.113228; Fri, 08 Jan 2021 20:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyYD-0004H2-JD; Fri, 08 Jan 2021 20:40:01 +0000
Received: by outflank-mailman (input) for mailman id 63840;
 Fri, 08 Jan 2021 20:40:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVqY=GL=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxyYC-0004Gx-6h
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 20:40:00 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a135188-cf55-4605-9641-85a488505eea;
 Fri, 08 Jan 2021 20:39:58 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108KJNvo113124;
 Fri, 8 Jan 2021 20:39:54 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35wepmjud9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 08 Jan 2021 20:39:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 108KKdQG070011;
 Fri, 8 Jan 2021 20:39:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35v4rfptvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jan 2021 20:39:53 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 108Kdqm9003219;
 Fri, 8 Jan 2021 20:39:52 GMT
Received: from [10.39.253.22] (/10.39.253.22)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Jan 2021 20:39:52 +0000
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
X-Inumbo-ID: 0a135188-cf55-4605-9641-85a488505eea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jdNoowAPcwPxYa/KjsKtFLJ9xqQkH7y7qOXGYOihLSo=;
 b=COuMloOXBbANg1ky2/mmXy0HNobNLGXxLMUUih5VEJjeImA4l7MuviX+LJHDnSATe73L
 FIby5zaHiTZw+xuSaQK/hgKfv8o9M7KdSKNJZEj13z3BhjfNeeMhNJsns7S4ZARjARge
 3RSCixMLNdzNc6hTYJAdHOumpWvieWT0ihA7qgM/LK/TS3VfvUBJJF0DneigAV0fNbML
 raIr/1VcNJWfcZ+7fXFY4ls7LFeBcx4/ImoQuOaKxSZzb2ZQk/Xq2vWi9bCNoQPFIfFM
 av4cWnSc6/5JujxDymKLicDX3jM2TR3QwvUZYZDiUWsNmiMYzVHb3+nM2+T2HH6vcsii gw== 
Subject: Re: [PATCH 3/4] x86: Allow non-faulting accesses to non-emulated MSRs
 if policy permits this
To: Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        xen-devel@lists.xenproject.org
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
 <1610051698-23675-4-git-send-email-boris.ostrovsky@oracle.com>
 <0e5c0b85-5e3c-676c-e402-fa06e09cf5cb@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <b2de26e9-24b2-efdb-4bfb-627055f008a1@oracle.com>
Date: Fri, 8 Jan 2021 15:39:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0e5c0b85-5e3c-676c-e402-fa06e09cf5cb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9858 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9858 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080106


On 1/8/21 10:18 AM, Jan Beulich wrote:
> On 07.01.2021 21:34, Boris Ostrovsky wrote:
>> Starting with commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")
>> accesses to unhandled MSRs result in #GP sent to the guest. This caused a
>> regression for Solaris who tries to acccess MSR_RAPL_POWER_UNIT and (unlike,
> Nit: One c too many.
>
>> for example, Linux) does not catch exceptions when accessing MSRs that
>> potentially may not be present.
> Just to re-raise the question raised by Andrew already earlier
> on: Has Solaris been fixed in the meantime, or is this at least
> firmly planned to happen?


I was told they will open a bug.


>  done:
> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>               is_last_branch_msr(msr) )
>              break;
>  
> -        gdprintk(XENLOG_WARNING,
> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> -                 msr, msr_content);
> -        goto gp_fault;
> +        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
> +            goto gp_fault;
>      }
>  
>      return X86EMUL_OKAY;
> These functions also get used from the insn emulator, when it
> needs to fetch an MSR value (not necessarily in the context of
> emulating RDMSR or WRMSR). I wonder whether applying this
> behavior in that case is actually correct. It would only be if
> we would settle on it being a requirement that any such MSRs
> have to have emulation present in one of the handlers.


Hmm.. Yes, I did not consider this. I am not convinced this will always result in correct behavior for the emulator so I will need to pass down a parameter. Unless there is a way to figure out whether we are running in the emulator (which I don't immediately see)


-boris

