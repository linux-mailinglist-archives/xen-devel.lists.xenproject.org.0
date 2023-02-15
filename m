Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757B569818B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 18:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496148.766734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLBl-0002JN-Qr; Wed, 15 Feb 2023 17:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496148.766734; Wed, 15 Feb 2023 17:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLBl-0002Gx-O8; Wed, 15 Feb 2023 17:03:25 +0000
Received: by outflank-mailman (input) for mailman id 496148;
 Wed, 15 Feb 2023 17:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EB96=6L=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pSLBk-0002Gr-Fl
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 17:03:24 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id a6b5bf7d-ad52-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 18:03:22 +0100 (CET)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173]) by
 acd012ecd2cd with SMTP id 63ed1058b561427b11a36b7c (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 15 Feb 2023 17:03:20 GMT
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-52eb7a5275aso275866877b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 09:03:20 -0800 (PST)
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
X-Inumbo-ID: a6b5bf7d-ad52-11ed-93b5-47a8fe42b414
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1676480600; x=1676487800; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=ejXJhI1pThHE4QtLK+ivTrF8YaMudOiofw7hrlyuj9w=;
 b=MaxD05eArIUa4iuig83tPXeF5Rbb3To70GAX7uFGnBo3DJMMIU688MtL33QHegKhHmi7ZYPt0sZc+yP2iutVdA2kZN9631vtDyUXDO9yArrnNN7qLVbaE9DlryHsW/YBRcQfEf8AbDlcLi7J/gvrScpujD+Nedp2PtvJHxV6qsMsg5TAcnWcBUK6kWe8HEcAa4zTFQQkimU0FNSR0D7R90q05CWS5YwT9YCJ4pdyZ6VAoUMThZuzJI5TBTwioo5gyufBKWhsNZOSjwHiTdsON1WQXvWI4YXcKh7pV6CwwNrWq8HP6IYAFAFjchpnyduaFEcaySm1I6EL/eGmT68BVw==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKUxO2IAtxrCgYjakj8nCeEvmFHsc07t88Kk/3GAAUz5+f20j+6g
	6tmzYI3KevtewFnxBut16S8QHTNS2hTwx0L0a7E=
X-Google-Smtp-Source: AK7set8xcFUTxMYWBNgm6JKRehaBjxBRrRmS3ZoNk//Ez3pZhDbzez59fqrI7JFxl3soas8RWIfcQZP8ZXxPAuEQfEg=
X-Received: by 2002:a81:6188:0:b0:52e:cb6b:4637 with SMTP id
 v130-20020a816188000000b0052ecb6b4637mr298959ywb.123.1676480599747; Wed, 15
 Feb 2023 09:03:19 -0800 (PST)
MIME-Version: 1.0
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <348063358f2ded237334b3cec7498a36296fd408.1676351034.git.tamas@tklengyel.com> <06cea9ac-cafd-4437-6e3e-639651a77349@suse.com>
In-Reply-To: <06cea9ac-cafd-4437-6e3e-639651a77349@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 15 Feb 2023 12:02:43 -0500
X-Gmail-Original-Message-ID: <CABfawhnRHSYBp233yqmaZEUnVZXb7bvU18X6i53bzcuhZyGyQw@mail.gmail.com>
Message-ID: <CABfawhnRHSYBp233yqmaZEUnVZXb7bvU18X6i53bzcuhZyGyQw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/mem_sharing: Add extra variable to track fork progress
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009ef51905f4c00ef8"

--0000000000009ef51905f4c00ef8
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 6:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.02.2023 06:07, Tamas K Lengyel wrote:
> > When VM forking is initiated a VM is not supposed to try to perform
mem_sharing
> > yet as the fork process hasn't completed all required steps. However,
the vCPU
> > bring-up paths trigger guest memory accesses that can lead to such
premature
> > sharing ops. However, the gating check to see whether a VM is a fork is
set
> > already (ie. the domain has a parent).
>
> I find this confusing, and I had to read the patch to understand what's
> meant. Since there are a total of three VMs involved here (the one
> driving the fork, the one being forked, and the new clone), "a VM" is
> insufficient. The sentence further reads as if that VM is performing
> sharing operations on itself, which according to my understanding is
> impossible.
>
> Furthermore "the vCPU bringup paths" is also not specific enough imo.
> The forked VM as well as the new clone are both paused if I'm not
> mistaken, so neither can be in the process of bringing up any vCPU-s.
> I assume you refer to bring_up_vcpus(), but I'm afraid I view this
> function as misnamed. vCPU-s are being _created_ there, not brought up.
> Furthermore there are no guest memory accesses from underneath
> bring_up_vcpus(), so with those accesses you may be referring to
> copy_settings() instead? Which in turn - I'm sorry for my ignorance -
> raises the question why (implicit) hypervisor side accesses to guest
> memory might trigger sharing: So far I was working from the assumption
> that it's only control tool requests which do. Otoh you talk of
> "sharing ops", which suggests it may indeed be requests coming from
> the control tool. Yet that's also what invoked the request to fork,
> so shouldn't it coordinate with itself and avoid issuing sharing ops
> prematurely?

I went back to double-check and here is the memory access during
vcpu_create:

(XEN) Xen call trace:
(XEN)    [<ffff82d0402ebf38>] R
mem_sharing.c#mem_sharing_gfn_alloc+0x5c/0x5e
(XEN)    [<ffff82d0402ecb12>] F mem_sharing.c#add_to_physmap+0x175/0x233
(XEN)    [<ffff82d0402ee81d>] F mem_sharing_fork_page+0x4ee/0x51e
(XEN)    [<ffff82d0402f244f>] F p2m_get_gfn_type_access+0x119/0x1a7
(XEN)    [<ffff82d0402e67ef>] F hap.c#hap_update_paging_modes+0xbe/0x2ee
(XEN)    [<ffff82d0402942a0>] F vmx_create_vmcs+0x981/0xb71
(XEN)    [<ffff82d040298884>] F vmx.c#vmx_vcpu_initialise+0x64/0x1a0
(XEN)    [<ffff82d0402acc59>] F hvm_vcpu_initialise+0x97/0x19e
(XEN)    [<ffff82d0403168db>] F arch_vcpu_create+0xf3/0x1db
(XEN)    [<ffff82d040206c69>] F vcpu_create+0x211/0x35d
(XEN)    [<ffff82d0402f00b7>] F mem_sharing_memop+0x16a9/0x1869
(XEN)    [<ffff82d0403317c5>] F subarch_memory_op+0x298/0x2c4
(XEN)    [<ffff82d04032ca26>] F arch_memory_op+0xa9f/0xaa4
(XEN)    [<ffff82d040221e66>] F do_memory_op+0x2150/0x2297
(XEN)    [<ffff82d04030bcfb>] F pv_do_multicall_call+0x22c/0x4c7
(XEN)    [<ffff82d040319727>] F arch_do_multicall_call+0x23/0x2c
(XEN)    [<ffff82d04022231f>] F do_multicall+0xd3/0x417
(XEN)    [<ffff82d04030c0e4>] F pv_hypercall+0xea/0x3a0
(XEN)    [<ffff82d040201292>] F lstar_enter+0x122/0x130

Any time any page is requested in a fork that's not present it gets
populated from the parent (if the parent has it). What I was worried about
is nominate_page being called on the fork but I was mistaken, it was called
on the parent before add_to_physmap is called on the fork - which is fine
and the expected behavior.

We can drop this patch, sorry for the noise.

Tamas

--0000000000009ef51905f4c00ef8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Feb 15, 2023 at 6:03 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 14.02.2023 06:07, Tamas K Lengyel wrote:<br>&gt; &gt; When VM f=
orking is initiated a VM is not supposed to try to perform mem_sharing<br>&=
gt; &gt; yet as the fork process hasn&#39;t completed all required steps. H=
owever, the vCPU<br>&gt; &gt; bring-up paths trigger guest memory accesses =
that can lead to such premature<br>&gt; &gt; sharing ops. However, the gati=
ng check to see whether a VM is a fork is set<br>&gt; &gt; already (ie. the=
 domain has a parent).<br>&gt;<br>&gt; I find this confusing, and I had to =
read the patch to understand what&#39;s<br>&gt; meant. Since there are a to=
tal of three VMs involved here (the one<br>&gt; driving the fork, the one b=
eing forked, and the new clone), &quot;a VM&quot; is<br>&gt; insufficient. =
The sentence further reads as if that VM is performing<br>&gt; sharing oper=
ations on itself, which according to my understanding is<br>&gt; impossible=
.<br>&gt;<br>&gt; Furthermore &quot;the vCPU bringup paths&quot; is also no=
t specific enough imo.<br>&gt; The forked VM as well as the new clone are b=
oth paused if I&#39;m not<br>&gt; mistaken, so neither can be in the proces=
s of bringing up any vCPU-s.<br>&gt; I assume you refer to bring_up_vcpus()=
, but I&#39;m afraid I view this<br>&gt; function as misnamed. vCPU-s are b=
eing _created_ there, not brought up.<br>&gt; Furthermore there are no gues=
t memory accesses from underneath<br>&gt; bring_up_vcpus(), so with those a=
ccesses you may be referring to<br>&gt; copy_settings() instead? Which in t=
urn - I&#39;m sorry for my ignorance -<br>&gt; raises the question why (imp=
licit) hypervisor side accesses to guest<br>&gt; memory might trigger shari=
ng: So far I was working from the assumption<br>&gt; that it&#39;s only con=
trol tool requests which do. Otoh you talk of<br>&gt; &quot;sharing ops&quo=
t;, which suggests it may indeed be requests coming from<br>&gt; the contro=
l tool. Yet that&#39;s also what invoked the request to fork,<br>&gt; so sh=
ouldn&#39;t it coordinate with itself and avoid issuing sharing ops<br><div=
>&gt; prematurely?</div><div><br></div><div>I went back to double-check and=
 here is the memory access during vcpu_create:</div><div><br></div><div>(XE=
N) Xen call trace:<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d0402ebf38&gt;] R mem_s=
haring.c#mem_sharing_gfn_alloc+0x5c/0x5e<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d=
0402ecb12&gt;] F mem_sharing.c#add_to_physmap+0x175/0x233<br>(XEN) =C2=A0 =
=C2=A0[&lt;ffff82d0402ee81d&gt;] F mem_sharing_fork_page+0x4ee/0x51e<br>(XE=
N) =C2=A0 =C2=A0[&lt;ffff82d0402f244f&gt;] F p2m_get_gfn_type_access+0x119/=
0x1a7<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d0402e67ef&gt;] F hap.c#hap_update_p=
aging_modes+0xbe/0x2ee<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d0402942a0&gt;] F v=
mx_create_vmcs+0x981/0xb71<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d040298884&gt;]=
 F vmx.c#vmx_vcpu_initialise+0x64/0x1a0<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d0=
402acc59&gt;] F hvm_vcpu_initialise+0x97/0x19e<br>(XEN) =C2=A0 =C2=A0[&lt;f=
fff82d0403168db&gt;] F arch_vcpu_create+0xf3/0x1db<br>(XEN) =C2=A0 =C2=A0[&=
lt;ffff82d040206c69&gt;] F vcpu_create+0x211/0x35d<br>(XEN) =C2=A0 =C2=A0[&=
lt;ffff82d0402f00b7&gt;] F mem_sharing_memop+0x16a9/0x1869<br>(XEN) =C2=A0 =
=C2=A0[&lt;ffff82d0403317c5&gt;] F subarch_memory_op+0x298/0x2c4<br>(XEN) =
=C2=A0 =C2=A0[&lt;ffff82d04032ca26&gt;] F arch_memory_op+0xa9f/0xaa4<br>(XE=
N) =C2=A0 =C2=A0[&lt;ffff82d040221e66&gt;] F do_memory_op+0x2150/0x2297<br>=
(XEN) =C2=A0 =C2=A0[&lt;ffff82d04030bcfb&gt;] F pv_do_multicall_call+0x22c/=
0x4c7<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d040319727&gt;] F arch_do_multicall_=
call+0x23/0x2c<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04022231f&gt;] F do_multic=
all+0xd3/0x417<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d04030c0e4&gt;] F pv_hyperc=
all+0xea/0x3a0<br>(XEN) =C2=A0 =C2=A0[&lt;ffff82d040201292&gt;] F lstar_ent=
er+0x122/0x130</div><div><br></div><div>Any time any page is requested in a=
 fork that&#39;s not present it gets populated from the parent (if the pare=
nt has it). What I was worried about is nominate_page being called on the f=
ork but I was mistaken, it was called on the parent before add_to_physmap i=
s called on the fork - which is fine and the expected behavior.<br></div><d=
iv><br></div><div>We can drop this patch, sorry for the noise.</div><div><b=
r></div><div>Tamas<br></div></div>

--0000000000009ef51905f4c00ef8--

