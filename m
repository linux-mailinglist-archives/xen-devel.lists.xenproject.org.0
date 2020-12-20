Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5072DF65F
	for <lists+xen-devel@lfdr.de>; Sun, 20 Dec 2020 19:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57160.99964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kr31j-0006mo-Ut; Sun, 20 Dec 2020 18:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57160.99964; Sun, 20 Dec 2020 18:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kr31j-0006mP-RB; Sun, 20 Dec 2020 18:01:51 +0000
Received: by outflank-mailman (input) for mailman id 57160;
 Sun, 20 Dec 2020 18:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jG8K=FY=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kr31h-0006mK-Ra
 for xen-devel@lists.xenproject.org; Sun, 20 Dec 2020 18:01:49 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4545f5df-9278-4e0b-b19d-f40a66fe48c4;
 Sun, 20 Dec 2020 18:01:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BKI1bFc058821;
 Sun, 20 Dec 2020 18:01:37 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35h8xqtubq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 20 Dec 2020 18:01:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BKHtv2q125058;
 Sun, 20 Dec 2020 18:01:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35hudvtgav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Dec 2020 18:01:36 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BKI1RJ3007047;
 Sun, 20 Dec 2020 18:01:27 GMT
Received: from [10.39.209.146] (/10.39.209.146)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 20 Dec 2020 10:01:26 -0800
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
X-Inumbo-ID: 4545f5df-9278-4e0b-b19d-f40a66fe48c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=zGs8oLs0SuV93YX7bMLXBG/KlOIK88g4RdW0mF6sRB4=;
 b=YKT1MtB5XQvvQQSomWbNeCVx2/hWgNCfTP/MtFgNjtAn3GxplMU6EEgo3381YH7hO1bh
 k/JhMOMiUmH1rgmgQs0A6UHdlOGsMEb4dv2EDOdZZQHNYP89wn2tRqtbOrOvzEFzb2n9
 eKZGaOdmAgflGyFl7o8btoYQPtaUg2rp1Ne90PrS+oB6SCTHC6O3k4airsCsx37ys63Z
 566dsr7Ifeqf+CWRU/u2lCvBUGfJasodrPUg0sxmn54H8O/hzYYSvsw8+cq23FrDm4hC
 btPpp0+2huQLvJlz8MhqUJ+S9HqTCWHkGFKSTTCEaNUvnvJV+LSsBiXqCbLH4NfvEAPW vQ== 
Subject: Re: [PATCH] xen: Fix event channel callback via INTX/GSI
To: David Woodhouse <dwmw2@infradead.org>, "x86@kernel.org" <x86@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <5ba658b2d8a2bce63622f5bb8ef8d5e6114276eb.camel@infradead.org>
 <6b6544ac-06b3-2525-aed9-39015715f71d@oracle.com>
 <a02cb64ba5680c0f2076da714d06b8704e3411c2.camel@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <5fa6ba65-2420-8b79-fd20-299166651f0c@oracle.com>
Date: Sun, 20 Dec 2020 13:01:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a02cb64ba5680c0f2076da714d06b8704e3411c2.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012200134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012200134


On 12/19/20 3:05 AM, David Woodhouse wrote:
> On Fri, 2020-12-18 at 17:20 -0500, boris.ostrovsky@oracle.com wrote:
>> Are there other cases where this would be useful? If it's just to
>> test a hypervisor under development I would think that people who are
>> doing that kind of work are capable of building their own kernel. My
>> concern is mostly about having yet another boot option that is of
>> interest to very few people who can easily work around not having it.
> For hypervisor testing we can just set the Xen major version number in
> CPUID to 3, and that stops xs_reset_watches() from doing anything.
>
> cf. https://lkml.org/lkml/2017/4/10/266
>
> Karim ripped out all this INTX code in 2017 because it was broken, and
> subsequently put it back because it *was* working for older versions of
> Xen, due to that "coincidence". The conclusion back then was that if it
> was put back it should at least *work* consistently, and he was going
> to send a patch "shortly". This is a that patch :)


Right, I am not arguing about usefulness of the fix, only of the new boot option.


>
>>> Add a 'no_vector_callback' command line argument to test it.
>> This last one should be a separate patch I think.
> Could do.
>
>>> +		/*
>>> +		 * It doesn't strictly *have* to run on CPU0 but it sure
>>> +		 * as hell better process the event channel ports delivered
>>> +		 * to CPU0.
>>> +		 */
>>> +		irq_set_affinity(pdev->irq, cpumask_of(0));
>>> +
>>
>> Is the concern here that it won't be handled at all?
> Indeed, the events don't get handled at all if the PCI interrupt lands
> on a CPU other than zero. When the handler calls
> xen_hvm_evtchn_do_upcall() that processes pending events for whichever
> CPU it happens to be running on, and *not* the events pending for CPU0.
> And the boot stops in xs_reset_watches() waiting (without a timeout)
> for an interrupt that never gets processed, as before.


Yes, I see. Then please do it in a separate patch.


>
>> And is this related to the issue this patch is addressing?
> It is required to fix the event channel callback via INTX/GSI, yes.
> Although it could reasonably be lifted out into a separate patch too.
>
>>>  static int __init xenbus_probe_initcall(void)
>>>  {
>>> -	if (!xen_domain())
>>> -		return -ENODEV;
>>> -
>>> -	if (xen_initial_domain() || xen_hvm_domain())
>>> -		return 0;
>>> +	/*
>>> +	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
>>> +	 * need to wait for the platform PCI device to come up, which is
>>> +	 * the (XEN_PVPVM && !xen_have_vector_callback) case.
>>> +	 */
>>> +	if (xen_store_domain_type == XS_PV ||
>>> +	    (xen_store_domain_type == XS_HVM &&
>>> +	     (!IS_ENABLED(CONFIG_XEN_PVHVM) || xen_have_vector_callback)))
>>> +		xenbus_probe();
>>>  
>>> -	xenbus_probe(NULL);
>>>  	return 0;
>>>  }
>>> -
>>>  device_initcall(xenbus_probe_initcall);
>>>  
>>> +int xen_set_callback_via(uint64_t via)
>>> +{
>>> +	struct xen_hvm_param a;
>>> +	int ret;
>>> +
>>> +	a.domid = DOMID_SELF;
>>> +	a.index = HVM_PARAM_CALLBACK_IRQ;
>>> +	a.value = via;
>>> +
>>> +	ret = HYPERVISOR_hvm_op(HVMOP_set_param, &a);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/*
>>> +	 * If xenbus_probe_initcall() deferred the xenbus_probe()
>>> +	 * due to the callback not functioning yet, we can do it now.
>>> +	 */
>>> +	if (!xenstored_ready && xen_store_domain_type == XS_HVM &&
>>> +	    IS_ENABLED(CONFIG_XEN_PVHVM) && !xen_have_vector_callback)
>>
>> I'd create an is_callback_ready() (or something with a better name)
>> helper.
> I pondered that, and indeed dropping the XVM/vector conditions and
> doing it literally based on whether xen_set_callback_via() had been
> called at all (and not too early). But it looks like there are cases
> where Arm doesn't call xen_set_callback_via() at all, and it made more
> sense to me to live xen_set_callback_via() to sit right here and have
> those two conditions within a page of each other in juxtaposition, with
> suitable comments. I think that's probably easier to understand and
> work with than a "helper".


OK.


>
>>> +		xenbus_probe();
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(xen_set_callback_via);
>>> +
>>>  /* Set up event channel for xenstored which is run as a local process
>>>   * (this is normally used only in dom0)
>>>   */
>>> @@ -817,11 +851,17 @@ static int __init xenbus_init(void)
>>>  		break;
>>>  	}
>>>  
>>> -	/* Initialize the interface to xenstore. */
>>> -	err = xs_init();
>>> -	if (err) {
>>> -		pr_warn("Error initializing xenstore comms: %i\n", err);
>>> -		goto out_error;
>>> +	/*
>>> +	 * HVM domains may not have a functional callback yet. In that
>>> +	 * case let xs_init() be called from xenbus_probe(), which will
>>> +	 * get invoked at an appropriate time.
>>> +	 */
>>> +	if (xen_store_domain_type != XS_HVM) {
>>
>> Can we delay xs_init() for !XS_HVM as well? In other words wait until
>> after PCI platform device has been probed (on HVM) and then call
>> xs_init() for everyone.
> We're half-way there already, because xenbus_probe() *does* happen
> later as a device_initcall, and I've just made it call xs_init().
>
> We could make it avoid calling xs_init() from xenbus_init() in the
> XS_HVM *and* XS_PV cases fairly easily, and let xenbus_probe() do it.


Yes, that's along the lines of what I was thinking.


>
> But right now xenbus_probe() doesn't run for the other cases, so
> there'd have to be a mode where it *only* calls xs_init() and doesn't
> do the notifier chain. That seems like more churn that was needed so I
> didn't do it.


You think so? Yes, there would be a couple more places where you'd need to call xenbus_probe() but then you won't have to explain (with comments) why you call xs_init() here and not there and vice versa. It just looks to me a bit more complicated the way you do this but I suppose it's a matter of personal preference.


-boris


