Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F362F1B17
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 17:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65044.115104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0Bz-0003ty-Kj; Mon, 11 Jan 2021 16:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65044.115104; Mon, 11 Jan 2021 16:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0Bz-0003tc-Hg; Mon, 11 Jan 2021 16:37:19 +0000
Received: by outflank-mailman (input) for mailman id 65044;
 Mon, 11 Jan 2021 16:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cm4Z=GO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kz0Bx-0003tX-Rs
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 16:37:17 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdcce1ad-d7d3-43f1-a150-dbe8ec5c461c;
 Mon, 11 Jan 2021 16:37:16 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BGMQOr145177;
 Mon, 11 Jan 2021 16:37:13 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kcyj4qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 16:37:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BGGQil018740;
 Mon, 11 Jan 2021 16:35:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 360kf3t5vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 16:35:12 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10BGZAZg004659;
 Mon, 11 Jan 2021 16:35:10 GMT
Received: from [10.39.223.157] (/10.39.223.157)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 11 Jan 2021 08:35:10 -0800
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
X-Inumbo-ID: cdcce1ad-d7d3-43f1-a150-dbe8ec5c461c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=nYnPjW8JwXe949sNMXfd5j5z3mRHCXlAxF7qyyRMPy8=;
 b=tYp2Zzi1zc0VMfOdLLI92jE+qtYEtorxECa1TVDJifcRM4SWY4kevpfNp6up9nKtOKpE
 0IxUjjmXXlyfrsq/d45zHDehrIkb0gglbGZagSMu81A4p2Q24ux9V0UwsbzP1877IjC0
 GmAJq/sMs/Rp6Xam5uMVxGbFjPXrR+Tyk6sXZLUyhiaXL4p5895sv08RjXAUBPpCtqOa
 bLXZyKwt0nCS/0Vb971LWEOcenHrdOCeNtH26cZMoIrfEGDnfdf6L5nZYNyhtHHrVBhe
 B2r44DN+RlGr4sXWR4CQq4KbOede1LY2zxci2WeSKDtji/TEQq7yMqyy61+P11NVMzKm Uw== 
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
 <b2de26e9-24b2-efdb-4bfb-627055f008a1@oracle.com>
 <9896a1af-e4cc-b171-f7a9-e6b74976770c@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <7e49af04-4642-84ba-35b4-e5d134ec1885@oracle.com>
Date: Mon, 11 Jan 2021 11:35:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9896a1af-e4cc-b171-f7a9-e6b74976770c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110097


On 1/11/21 2:48 AM, Jan Beulich wrote:
> On 08.01.2021 21:39, boris.ostrovsky@oracle.com wrote:
>> On 1/8/21 10:18 AM, Jan Beulich wrote:
>>
>>>
>>> Just to re-raise the question raised by Andrew already earlier
>>> on: Has Solaris been fixed in the meantime, or is this at least
>>> firmly planned to happen?
>> I was told they will open a bug.
> "Will", not "did"?


I can't say for sure, I don't have access to their bugDB, they typically keep bugs private (or so I am told). All I can say is that they are aware of this issue.


>
>>> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>>               is_last_branch_msr(msr) )
>>>              break;
>>>  
>>> -        gdprintk(XENLOG_WARNING,
>>> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>>> -                 msr, msr_content);
>>> -        goto gp_fault;
>>> +        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
>>> +            goto gp_fault;
>>>      }
>>>  
>>>      return X86EMUL_OKAY;
>>> These functions also get used from the insn emulator, when it
>>> needs to fetch an MSR value (not necessarily in the context of
>>> emulating RDMSR or WRMSR). I wonder whether applying this
>>> behavior in that case is actually correct. It would only be if
>>> we would settle on it being a requirement that any such MSRs
>>> have to have emulation present in one of the handlers.
>>
>> Hmm.. Yes, I did not consider this. I am not convinced this will
>> always result in correct behavior for the emulator so I will
>> need to pass down a parameter. Unless there is a way to figure
>> out whether we are running in the emulator (which I don't
>> immediately see)
> Passing a parameter for this is sort of ugly, but I presume
> unavoidable. The more that what you need to know is not "running
> in emulator", but "guest RDMSR/WRMSR" - this can also happen
> through the emulator.


Right, that's what I meant.


-boris



