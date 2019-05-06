Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED7115257
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 19:10:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNh5s-0000jG-AK; Mon, 06 May 2019 17:08:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Pjh=TG=citrix.com=prvs=022dda640=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hNh5q-0000jB-Nn
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 17:07:58 +0000
X-Inumbo-ID: 75546ee6-7021-11e9-a06d-1f6b30261688
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75546ee6-7021-11e9-a06d-1f6b30261688;
 Mon, 06 May 2019 17:07:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,438,1549929600"; d="scan'208,217";a="89672415"
To: Mathieu Tarral <mathieu.tarral@protonmail.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
Date: Mon, 6 May 2019 18:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1224547363317200406=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1224547363317200406==
Content-Type: multipart/alternative;
	boundary="------------1F3550EACBCAD5C40C2DA673"
Content-Language: en-GB

--------------1F3550EACBCAD5C40C2DA673
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 06/05/2019 17:18, Mathieu Tarral wrote:
> Hi,
>
> I would like to submit a strange bug that i'm facing while using DRAKVUF to
> monitor applications from the hypervisor.
>
> I wanted to evaluate DRAKVUF's robustness, so I built a test suite, and began
> by executing reg.exe via shellexec injection, having the execution tracked by the procmon plugin.
>
> I quickly realized that sometimes applications were crashing in the guest, with different types of weird errors:
> - memory cannot be written
> - invalid opcode
> - unknown software exception (its a Windows message, not sure what type of processor exception is behind this)
>
> And more than that, I had lots of BSODs, in different places in the kernel.
>
> So heavy monitoring with DRAKVUF tends to make the guest unstable.
>
> It's important to emphasize that the more VCPUs you have, the more likely the bug will be triggered.
>
> For example, injecting on Windows with 1 VCPU, i was able to go through 5000 successives injections.
> Using 4 VCPUs on the other hand, it would crash around ~50th injection.
>
> My first suspicion was on DRAKVUF's custom injector, which hijacks the process control flow,
> and could have corrupted the guest memory.
>
> This is the most invasive method to start a process in the guest, so it was a good candidate.
>
> But last week, I replaced this injector by opening the WinRM service, and starting the remote process
> via Ansible win_command module.
>
> Unfortunately, the result was the same, the BSODs and appcrashes are still here.
>
> Which means that DRAKVUF, simply by calling the altp2m APIs and injecting stealth breakpoints,
> could somehow make the guest execute code in a page that would either be non present
> (I had PAGE_FAULT_IN_NONPAGED_AERA BSODs), or corrupted, which would explain
> the invalid opcode/access_violation errors.
>
> You can find my extensive bug reports and comments on the following Github issues:
> - [Injection BSOD on W7x64](https://github.com/tklengyel/drakvuf/issues/576)
> - [BSOD when injecting on Windows 10 protected by KPTI ](https://github.com/tklengyel/drakvuf/issues/622)
>
> The latest proof I have of this effect is the following analysis of a Win10 BSOD:
> https://gist.github.com/mtarral/f593e50d1d68b5a1071d8bc42affd542
>
> (Please note that KPTI was manually disabled, because it would crash guest quite quickly under monitoring, but that's another issue.)
>
> I managed to get a page containing 2 successive `int 3` (previously injected by DRAKVUF), in a location that I just wasn't monitoring.
>
> That's why I think that DRAKVUF is not responsible of this behavior.
>
> I'm using only 3 plugins:
> - procmon
>   - NtCreateUserProcess
>   - NtTerminateProcess
>   - NtOpenProcess
>   - NtProtectVirtualMemory
> - bsodmon
>   - KeBugCheck
> - crashmon
>   - CR3 load
>
> As altp2m seems like a really complicated to implement (EPT manipulation, CoW, ...),
> I suspect that there is a possible race condition that lies in there, which would trigger this bug.
>
> I would like your opinions on the matter, how I can investigate this,
> and ultimately debug it, with your help of course.

There is a lot in here.

As for your BSOD analysis, the first thing to be aware of is that Double
Fault is not necessarily precise, which means you can't necessarily
trust any of the registers.  That said, most double faults are precise
in practice, so if you're seeing it reliably at the same place, then it
is likely to be a precise example.

Your faulting address isn't the immediately after the pagetable switch. 
It is one instruction further on, after the stack switch, which means at
the very minimum that reading the new rsp out of the per-processor
storage succeeded.

The stack switch, combined with `push $0x2b` faulting is a clear sign
that the stack is bad.  As the stack pointer looks plausible, it is
almost certainly the pagewalk from %rsp which is bad.  Judging by the
Windbg guide, you want to use !pte to dump the pagewalk (but I have
never used it in anger before).

How exactly does DRAKVUF go about injecting silent breakpoints?  It
obviously has to allocate a new gfn from somewhere to begin with.  Do
the bifurcated frames end up in two different altp2ms, or one in the
host p2m and one in an alternative?  Does #VE ever get used?

Given how many EPT flushing bugs I've already found in this area, I
wouldn't be surprised if there are further ones lurking.  If it is an
EPT flushing bug, this delta should make it go away, but it will come
with a hefty perf hit.

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 283eb7b..019333d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4285,9 +4285,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
             }
         }
 
-        if ( inv )
-            __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
-                     inv == 1 ? single->eptp          : 0);
+        __invept(INVEPT_ALL_CONTEXT, 0);
     }
 
  out:

~Andrew

--------------1F3550EACBCAD5C40C2DA673
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06/05/2019 17:18, Mathieu Tarral
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com">
      <pre class="moz-quote-pre" wrap="">Hi,

I would like to submit a strange bug that i'm facing while using DRAKVUF to
monitor applications from the hypervisor.

I wanted to evaluate DRAKVUF's robustness, so I built a test suite, and began
by executing reg.exe via shellexec injection, having the execution tracked by the procmon plugin.

I quickly realized that sometimes applications were crashing in the guest, with different types of weird errors:
- memory cannot be written
- invalid opcode
- unknown software exception (its a Windows message, not sure what type of processor exception is behind this)

And more than that, I had lots of BSODs, in different places in the kernel.

So heavy monitoring with DRAKVUF tends to make the guest unstable.

It's important to emphasize that the more VCPUs you have, the more likely the bug will be triggered.

For example, injecting on Windows with 1 VCPU, i was able to go through 5000 successives injections.
Using 4 VCPUs on the other hand, it would crash around ~50th injection.

My first suspicion was on DRAKVUF's custom injector, which hijacks the process control flow,
and could have corrupted the guest memory.

This is the most invasive method to start a process in the guest, so it was a good candidate.

But last week, I replaced this injector by opening the WinRM service, and starting the remote process
via Ansible win_command module.

Unfortunately, the result was the same, the BSODs and appcrashes are still here.

Which means that DRAKVUF, simply by calling the altp2m APIs and injecting stealth breakpoints,
could somehow make the guest execute code in a page that would either be non present
(I had PAGE_FAULT_IN_NONPAGED_AERA BSODs), or corrupted, which would explain
the invalid opcode/access_violation errors.

You can find my extensive bug reports and comments on the following Github issues:
- [Injection BSOD on W7x64](<a class="moz-txt-link-freetext" href="https://github.com/tklengyel/drakvuf/issues/576">https://github.com/tklengyel/drakvuf/issues/576</a>)
- [BSOD when injecting on Windows 10 protected by KPTI ](<a class="moz-txt-link-freetext" href="https://github.com/tklengyel/drakvuf/issues/622">https://github.com/tklengyel/drakvuf/issues/622</a>)

The latest proof I have of this effect is the following analysis of a Win10 BSOD:
<a class="moz-txt-link-freetext" href="https://gist.github.com/mtarral/f593e50d1d68b5a1071d8bc42affd542">https://gist.github.com/mtarral/f593e50d1d68b5a1071d8bc42affd542</a>

(Please note that KPTI was manually disabled, because it would crash guest quite quickly under monitoring, but that's another issue.)

I managed to get a page containing 2 successive `int 3` (previously injected by DRAKVUF), in a location that I just wasn't monitoring.

That's why I think that DRAKVUF is not responsible of this behavior.

I'm using only 3 plugins:
- procmon
  - NtCreateUserProcess
  - NtTerminateProcess
  - NtOpenProcess
  - NtProtectVirtualMemory
- bsodmon
  - KeBugCheck
- crashmon
  - CR3 load

As altp2m seems like a really complicated to implement (EPT manipulation, CoW, ...),
I suspect that there is a possible race condition that lies in there, which would trigger this bug.

I would like your opinions on the matter, how I can investigate this,
and ultimately debug it, with your help of course.</pre>
    </blockquote>
    <br>
    There is a lot in here.<br>
    <br>
    As for your BSOD analysis, the first thing to be aware of is that
    Double Fault is not necessarily precise, which means you can't
    necessarily trust any of the registers.  That said, most double
    faults are precise in practice, so if you're seeing it reliably at
    the same place, then it is likely to be a precise example.<br>
    <br>
    Your faulting address isn't the immediately after the pagetable
    switch.  It is one instruction further on, after the stack switch,
    which means at the very minimum that reading the new rsp out of the
    per-processor storage succeeded.<br>
    <br>
    The stack switch, combined with `push $0x2b` faulting is a clear
    sign that the stack is bad.  As the stack pointer looks plausible,
    it is almost certainly the pagewalk from %rsp which is bad.  Judging
    by the Windbg guide, you want to use !pte to dump the pagewalk (but
    I have never used it in anger before).<br>
    <br>
    How exactly does DRAKVUF go about injecting silent breakpoints?  It
    obviously has to allocate a new gfn from somewhere to begin with. 
    Do the bifurcated frames end up in two different altp2ms, or one in
    the host p2m and one in an alternative?  Does #VE ever get used?<br>
    <br>
    Given how many EPT flushing bugs I've already found in this area, I
    wouldn't be surprised if there are further ones lurking.  If it is
    an EPT flushing bug, this delta should make it go away, but it will
    come with a hefty perf hit.<br>
    <br>
    <pre>diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 283eb7b..019333d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4285,9 +4285,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
             }
         }
 
-        if ( inv )
-            __invept(inv == 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CONTEXT,
-                     inv == 1 ? single-&gt;eptp          : 0);
+        __invept(INVEPT_ALL_CONTEXT, 0);
     }
 
  out:

</pre>
    ~Andrew<br>
  </body>
</html>

--------------1F3550EACBCAD5C40C2DA673--


--===============1224547363317200406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1224547363317200406==--

