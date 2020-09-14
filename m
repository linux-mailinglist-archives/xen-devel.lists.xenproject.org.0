Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E8268CCB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 16:05:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHp6N-0001k9-OE; Mon, 14 Sep 2020 14:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHp6M-0001k4-Pm
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:05:02 +0000
X-Inumbo-ID: 4c1916d7-a84b-4398-ba38-70bf2a9308f7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c1916d7-a84b-4398-ba38-70bf2a9308f7;
 Mon, 14 Sep 2020 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600092301;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/gg+BnRZ3uzGhXyDHVsmd56WqX26rgVOalTdzM7LvEc=;
 b=Jgy/gt/IKicBEaQtmOpBrG5iPjzb1gPmkrLWN2QJplIkoN34zNYh4TGe
 56XXReRvUNNrSafM9HcycQfW6uQSprlEUT+39sonjq5RdmJoK7HdRYLCO
 TxMoUKDeginL3FkJqy/Iu341g/jMsItm7aDceNXUMhCARylZ7rdhz4xLI Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: R4w9CeXpw9mZqgRl/E7LPEjR6xzhHZCoh+o6wEPBJSDmYEshyhID2XVRZtiksxjAmVVdUl12yW
 Cu5uxGWEgZF3zn+FUl1OWcYwtk21V5VTdfNMNEz4RZN9hSokhaFnSE9J1CMhRTbq2yy+XKB3G5
 bjJ9M4BetyFzLONsgQx53aqN5tzU4B3W7I5wM39faJDcMDgmJj6+2RKCBH+hljGigyXY0r+mWI
 sj99MxAzRFQoMbUqlaEnsczMunxiq8U1JdhdL33TnT3VGjm9hai4w6dMhKL548PzfQIvRKbmHa
 pus=
X-SBRS: 2.7
X-MesageID: 26928685
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26928685"
Subject: Re: [PATCH] tools: Delete XEN_DOMCTL_disable_migrate
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
 <Ian.Jackson@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200911190618.14708-1-andrew.cooper3@citrix.com>
 <d234c429-a42a-e8e0-3ef3-c48c8263f543@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4f887862-8f3c-4bbb-4fc5-96542ece4894@citrix.com>
Date: Mon, 14 Sep 2020 15:04:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d234c429-a42a-e8e0-3ef3-c48c8263f543@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/09/2020 09:43, Jan Beulich wrote:
> On 11.09.2020 21:06, Andrew Cooper wrote:
>> It is conceptually wrong for this information to exist in the hypervisor in
>> the first place.  Only the toolstack is capable of correctly reasoning about
>> the non-migrateability of guests.
> But isn't it the purpose of the domctl to tell Xen about the tool
> stack's decision in this regard?

There is nothing (not even ITSC handling, which was buggy) which Xen can
legitimately do with the information.

It is conceptually wrong, and a layering violation, for Xen to have this
information, or to be making any assumptions about it.

>> This hypercall has only ever existed to control the visibility of the
>> Invariant TSC flag to the guest.  Now that we have properly disentanged that
>> and moved ITSC into the guests CPUID policy, delete this hypercall.
>>
>> Furthermore, this fixes a corner case where Xen would override the toolstacks
>> choice of ITSC for a xenstore stubdomain.
> I'm afraid I don't fully understand: A xenstore stubdom can't be
> migrated (or at least it isn't supposed to be), can it?

That is some very wild assumptions.

What if someone is trying to debug a time related issue, and wants to
turn itsc off?

> In which
> case - what's wrong with exposing to it even by default a feature
> it may be able to make use of?

Because silently trampling the configuration chosen by the toolstack
isn't acceptable.

>  IOW ...
>
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -708,7 +708,8 @@ int init_domain_cpuid_policy(struct domain *d)
>>      if ( !p )
>>          return -ENOMEM;
>>  
>> -    if ( d->disable_migrate )
>> +    /* The hardware domain can't migrate.  Give it ITSC if available. */
>> +    if ( is_hardware_domain(d) )
>>          p->extd.itsc = cpu_has_itsc;
> ... why not include is_xenstore_domain() here that you remove from
> ...
>
>> @@ -452,9 +451,6 @@ struct domain *domain_create(domid_t domid,
>>          watchdog_domain_init(d);
>>          init_status |= INIT_watchdog;
>>  
>> -        if ( is_xenstore_domain(d) )
>> -            d->disable_migrate = true;
> ... here? On the tool stack side the change here only deletes code,
> i.e. I don't see you taking care of the default enabling there
> either. Am I overlooking any logic that now causes the feature to
> be requested for the xenstore domain without you needing to add
> any code?

The toolstack (legitimately) has knowledge of nomigrate, and will even
implicitly turn on ITSC as a side effect, but will also honour explicit
requests to turn it on or off.

>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -730,11 +730,6 @@ struct xen_domctl_hvmcontext_partial {
>>      XEN_GUEST_HANDLE_64(uint8) buffer;  /* OUT: buffer to write record into */
>>  };
>>  
>> -/* XEN_DOMCTL_disable_migrate */
>> -struct xen_domctl_disable_migrate {
>> -    uint32_t disable; /* IN: 1: disable migration and restore */
>> -};
>> -
>>  
>>  /* XEN_DOMCTL_gettscinfo */
>>  /* XEN_DOMCTL_settscinfo */
>> @@ -1191,7 +1186,7 @@ struct xen_domctl {
>>  #define XEN_DOMCTL_gethvmcontext_partial         55
>>  #define XEN_DOMCTL_vm_event_op                   56
>>  #define XEN_DOMCTL_mem_sharing_op                57
>> -#define XEN_DOMCTL_disable_migrate               58
>> +/* #define XEN_DOMCTL_disable_migrate            58 - Obsolete */
>>  #define XEN_DOMCTL_gettscinfo                    59
>>  #define XEN_DOMCTL_settscinfo                    60
>>  #define XEN_DOMCTL_getpageframeinfo3             61
>> @@ -1242,7 +1237,6 @@ struct xen_domctl {
>>          struct xen_domctl_ioport_permission ioport_permission;
>>          struct xen_domctl_hypercall_init    hypercall_init;
>>          struct xen_domctl_settimeoffset     settimeoffset;
>> -        struct xen_domctl_disable_migrate   disable_migrate;
>>          struct xen_domctl_tsc_info          tsc_info;
>>          struct xen_domctl_hvmcontext        hvmcontext;
>>          struct xen_domctl_hvmcontext_partial hvmcontext_partial;
> Deletion of sub-ops, just like their modification, requires the
> interface version to get bumped if it wasn't already during a
> release cycle. I know you dislike the underlying concept, but as
> long as the interface version continues to exist (with its
> present meaning) I'm afraid it needs bumping for any backwards-
> incompatible change.

I can fix it on commit.  I don't waste time tracking whether it has had
its conditional bump.

~Andrew

