Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963E2EAD93
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 15:46:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62021.109519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnaV-0002qY-V3; Tue, 05 Jan 2021 14:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62021.109519; Tue, 05 Jan 2021 14:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnaV-0002q9-Rk; Tue, 05 Jan 2021 14:45:31 +0000
Received: by outflank-mailman (input) for mailman id 62021;
 Tue, 05 Jan 2021 14:45:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V+iM=GI=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwnaU-0002q4-DK
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 14:45:30 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e8fb34-fe98-4704-9dbb-b1fc4020b6c0;
 Tue, 05 Jan 2021 14:45:29 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Eisf5062836;
 Tue, 5 Jan 2021 14:45:23 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35tgsks2va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 14:45:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105EjLwY118200;
 Tue, 5 Jan 2021 14:45:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35vct5xdrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 14:45:22 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105EjDhu027880;
 Tue, 5 Jan 2021 14:45:14 GMT
Received: from [10.39.197.37] (/10.39.197.37)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 14:45:13 +0000
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
X-Inumbo-ID: a5e8fb34-fe98-4704-9dbb-b1fc4020b6c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=YURjE9i6SLpMhiNU1nsYQ0Z9VL0H6kze5Bf3OHaUssE=;
 b=Y1ByHfgrVnKLS5ksM42qeM2nrc71FnYi55bveQfuZG8cJMUzBIui4oJtiT0+Ou1GVpei
 MbXUGvXBDY8DsB7xWCo5H/V0TW1YKMQDMVIX3mvKhC+2YPdEEQL/hocZ+Q9hLfyLP+ep
 jpwDQkhCHVnW8ffr9lg2Gnksn3Z111YdHkrxDuMC13cVRUtrj5lsodn6hghIXeUzd+4T
 rVnn6TiSoSL9N0q4H4uB7wMokPUaK/o1+R+qUYvE1PEj2PnNUKr8aUYF3H+c/vp7UQ6C
 OBnvptft8q8haeZNBmIO23zCimyYq7oCoLhtHdB8Xui52sYuTWj0DQ3Q1xXBes9CIvZz qw== 
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
 <ea05c086-3b0c-0deb-c4c6-08a25beecb38@oracle.com>
 <6a032d2ff0d52ee19b2a88ac6813e25c6efc3733.camel@infradead.org>
 <3c27abbb-2f1d-2641-51c6-2f6bdbcf559b@oracle.com>
 <8a61ecbf527f1402ea19f0d1910f0af651b11229.camel@infradead.org>
 <1cf261fd-0062-8bc5-c3de-53b281accb82@oracle.com>
 <575e71c6f0bb672770390d45a0218d3064ce4860.camel@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <312dff57-f7da-7c9e-0e1f-2bbb28d3c3a5@oracle.com>
Date: Tue, 5 Jan 2021 09:45:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <575e71c6f0bb672770390d45a0218d3064ce4860.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050094


On 1/4/21 8:41 PM, David Woodhouse wrote:
> On Mon, 2021-01-04 at 18:44 -0500, boris.ostrovsky@oracle.com wrote:
>> On 1/4/21 6:19 PM, David Woodhouse wrote:
>>> On Mon, 2021-01-04 at 18:04 -0500, boris.ostrovsky@oracle.com
>>> wrote:
>>>> Why not xen_hvm_cpu_die too? common_cpu_die() sounds like something
>>>> we should do, and the other three we call there will be nops.
>>> native_cpu_die() calls that, and isn't that the function that gets
>>> installed if we don't install our own?
>>
>> True.
>>
>>
>> Still, a Xen guest should call Xen-specific cpu_die() routine if
>> possible. Especially since (now) other cpu (i.e. non-IPI) ops will
>> call Xen versions.
> But as you said, the other three things that xen_hvm_cpu_die() does are
> all no-ops (or at least we'd have to make them no-ops; I haven't
> checked). I don't see the point in calling it, only for it to do
> nothing.


For maintenance purposes. When something gets added in initialization path (prepare_boot_cpu() and such) we likely want to tear it down in cpu_die(). Today both native and Xen cpu_die() ops work the same but things change. And chances are people will not test no_vector_callback case so we will then have to hunt down what broke when.


no_vector_callback is a pretty esoteric case already so making it take different code path from common case, when there is little or no penalty for doing the latter, seems undesirable to me.


>
>>>>>  	smp_ops.send_call_func_ipi = xen_smp_send_call_function_ipi;
>>>>>  	smp_ops.send_call_func_single_ipi = xen_smp_send_call_function_single_ipi;
>>>>> -	smp_ops.smp_prepare_boot_cpu = xen_hvm_smp_prepare_boot_cpu;
>>>>> -	smp_ops.smp_cpus_done = xen_smp_cpus_done;
>>>>>  }
>>>>>
>>>>>> Also, for the spinlock changes specifically --- I wonder whether it
>>>>>> would be better to reverse initial value of xen_pvspin and set it to
>>>>>> 'true' only if initialization succeeds.
>>>>> I looked at that but it would need to be tristate, since the
>>>>> 'xen_nopvspin' command line option clears it from its default of being
>>>>> enabled.
>>>> Ah, right. How about setting nopvspin in xen_parse_nopvspin()?
>>> That would make the xen_nopvspin command line option disable PV
>>> spinlocks even under KVM.
>>
>> xen_nopvspin is deprecated and nopvspin is recommended anyway so I think it should be OK, no?
> They do different things. If someone has an image (which might run on
> both Xen and KVM) which has xen_nopvspin, we don't suddenly want that
> to start disabling PV spinlocks on KVM too.


True, but this option is deprecated and will be removed in the future.


-boris


