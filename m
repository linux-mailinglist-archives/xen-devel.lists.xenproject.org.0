Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1C2E9FD6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61504.108305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwY2X-0004Jt-V3; Mon, 04 Jan 2021 22:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61504.108305; Mon, 04 Jan 2021 22:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwY2X-0004JT-Rx; Mon, 04 Jan 2021 22:09:25 +0000
Received: by outflank-mailman (input) for mailman id 61504;
 Mon, 04 Jan 2021 22:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwY2V-0004JO-TD
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:09:24 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f906370-b59a-4e9f-b537-49a38c1cd0f3;
 Mon, 04 Jan 2021 22:09:22 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104Lwt4k020083;
 Mon, 4 Jan 2021 22:09:14 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35tebapg7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 22:09:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104M0Lkn103994;
 Mon, 4 Jan 2021 22:09:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35uxnrspkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 22:09:13 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 104M99Lm030769;
 Mon, 4 Jan 2021 22:09:09 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 14:09:09 -0800
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
X-Inumbo-ID: 0f906370-b59a-4e9f-b537-49a38c1cd0f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=w1iICc8RpQTghtzAucqo7w1SWB4r2GNKOu32L22ziFo=;
 b=NwLmQ9F/od7zAByUf4wMJCVdbVUzkmD38FMXesdsWy7jpzz2eJGEnSR9imrh8/2DGarN
 E/IygJnQTcBCLvT8fjvhjjwQBXGFE6JXQAyqyCzdCvlbxAOw2MfOSrzGwuU3xMaUfISe
 tW/XmNE4S/EthE7w7P9Q16wrzRIU9EP1GnV+2EkULHtKEb0M9l/xregm2swZdol2lsdY
 XGhEmpz6g9wDZGHF/0770pGQS9QdjZagLpckl1TfgcWZSiut8XiEE/0JDa7NM9fgvVpL
 IgEkqyrWTcuSdlr5Lo4FqZVXVzzQEkJa0tuVK3pygdshsH74SKZJTIH6lHVQBnw1GaPa tg== 
Subject: Re: [PATCH 5/5] x86/xen: Don't register PV spinlock IPI when it isn't
 going to be used
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-6-dwmw2@infradead.org>
 <b6681a06-4c00-61a9-2112-63ee3eb8d86d@oracle.com>
 <eb7378cdbbdbff2548d510c453ede8baa917647f.camel@infradead.org>
 <f681dfe6-d0fb-e451-a58f-ad5cafa1cd62@oracle.com>
 <706a569a1321deafb3ae7a4e8d569fb6f2291f50.camel@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <ea05c086-3b0c-0deb-c4c6-08a25beecb38@oracle.com>
Date: Mon, 4 Jan 2021 17:09:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <706a569a1321deafb3ae7a4e8d569fb6f2291f50.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040132


On 1/4/21 3:51 PM, David Woodhouse wrote:
> On Mon, 2021-01-04 at 14:06 -0500, boris.ostrovsky@oracle.com wrote:
>>
>> OK, but we still need to do something about virt_spin_lock_key.
> Right, I suppose we should just call xen_init_spinlocks() and then my
> defensive check stops being defensive and does what we need, including
> fixing virt_spin_lock_key.
>
> Normally it's xen_hvm_smp_prepare_boot_cpu() which calls
> xen_init_spinlocks(), and *also* calls xen_vcpu_setup() for CPU0...
> which brings me back to your other observation.
>
> I think we *should* be calling xen_vcpu_setup() for all CPUs, even when
> there's no vector callback. We can still have a per-vCPU vcpu_info page
> if we want it. It was relatively harmless that we didn't do it for
> CPU0, but it was wrong not to do so.
>
> So I think this fixes both. Will test:


I actually think this should go further in that only IPI-related ops should be conditioned on vector callback presence. The rest are generic VCPU routines that are not necessarily interrupt/event-related. And if they call something that *is* related then those specific routines should decide what to do based on xen_have_vector_callback.


Also, for the spinlock changes specifically --- I wonder whether it would be better to reverse initial value of xen_pvspin and set it to 'true' only if initialization succeeds.


-boris


>
> --- a/arch/x86/xen/smp_hvm.c
> +++ b/arch/x86/xen/smp_hvm.c
> @@ -64,6 +64,8 @@ static void xen_hvm_cpu_die(unsigned int cpu)
>  
>  void __init xen_hvm_smp_init(void)
>  {
> +       smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
> +
>         if (!xen_have_vector_callback)
>                 return;
>  
> @@ -72,6 +74,5 @@ void __init xen_hvm_smp_init(void)
>         smp_ops.cpu_die = xen_hvm_cpu_die;
>         smp_ops.send_call_func_ipi = xen_smp_send_call_function_ipi;
>         smp_ops.send_call_func_single_ipi = xen_smp_send_call_function_single_ipi;
> -       smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
>         smp_ops.smp_cpus_done = xen_smp_cpus_done;
>  }

