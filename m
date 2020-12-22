Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E92E0DC9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 18:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58025.101813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krlI7-0007iy-5F; Tue, 22 Dec 2020 17:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58025.101813; Tue, 22 Dec 2020 17:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krlI7-0007iZ-1v; Tue, 22 Dec 2020 17:17:43 +0000
Received: by outflank-mailman (input) for mailman id 58025;
 Tue, 22 Dec 2020 17:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krlI5-0007iT-In
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 17:17:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ca87cfc-b817-4056-b6f9-80a632fa953c;
 Tue, 22 Dec 2020 17:17:38 +0000 (UTC)
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
X-Inumbo-ID: 4ca87cfc-b817-4056-b6f9-80a632fa953c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608657458;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to;
  bh=mh0ymQQ3gDNCPt/GLY7WFyRa7I00o86mRISmR7oJmTU=;
  b=PBIcEeWgjB0mtDnNfMVRVs8AYtu1PUgUerZnySsVkrRgibEhTeAs8YZQ
   itZ7v2CvFOA4spwZOp/EgpAHu/ON4ULv/OmYQa8g0O6qhJHY+LSSWX8KA
   1aS96ERoGRxC0MJDCGKMs7QWpoFGU0Gwr4Bfs70+95p9EUOj3oV9rn24/
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: a4l3tJXjTm+T1MWHl69EpkmLVntjKzuuHHNCwmrCDOH6hG6hm7daHhYfQFZKb50JC+RTRtk9lt
 aL7Hs3F06keezw+xJvSGuFmGDUwOYDi0wQsg+mOyj1nk5VkCAKnBuq8DbVPCl6FN03NAydG62Z
 b+q8s1PO7coDTKbAX40eh09PpeyZ73Hp5+U+2wHh7hesdylcNH4TOpPm+D9qOOMn9IGeRguNUv
 DCkJlKB98VbUbZHM0H0isEt6o5YRbhPLYZ6/B631lifOsQy6PnVSsQV5MMwLJb1YmxxKzLy9fI
 +6Y=
X-SBRS: 5.2
X-MesageID: 33786538
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,439,1599537600"; 
   d="scan'208,217";a="33786538"
Subject: Re: Hypercall fault injection (Was [PATCH 0/3] xen/domain: More
 structured teardown)
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com>
 <983a3fef-c80f-ec2a-bf3c-5e054fc6a7a9@suse.com>
 <760969b0-743e-fdd7-3577-72612e3a88b7@citrix.com>
 <CABfawh=nS2nuFEyx+7Hi5S5HUYtqXTJ6LMTLpZErs5_d22GWgQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5f6a3bbd-c688-c628-9b1e-a838d3c31d8e@citrix.com>
Date: Tue, 22 Dec 2020 17:17:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=nS2nuFEyx+7Hi5S5HUYtqXTJ6LMTLpZErs5_d22GWgQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------46C7FD4784E30F01E79F7FD1"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

--------------46C7FD4784E30F01E79F7FD1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 22/12/2020 15:47, Tamas K Lengyel wrote:
>
>
> On Tue, Dec 22, 2020 at 6:14 AM Andrew Cooper
> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 22/12/2020 10:00, Jan Beulich wrote:
>     > On 21.12.2020 20:36, Andrew Cooper wrote:
>     >> Hello,
>     >>
>     >> We have some very complicated hypercalls, createdomain, and
>     max_vcpus a
>     >> close second, with immense complexity, and very hard-to-test
>     error handling.
>     >>
>     >> It is no surprise that the error handling is riddled with bugs.
>     >>
>     >> Random failures from core functions is one way, but I'm not
>     sure that
>     >> will be especially helpful.  In particular, we'd need a way to
>     exclude
>     >> "dom0 critical" operations so we've got a usable system to run
>     testing on.
>     >>
>     >> As an alternative, how about adding a fault_ttl field into the
>     hypercall?
>     >>
>     >> The exact paths taken in {domain,vcpu}_create() are sensitive
>     to the
>     >> hardware, Xen Kconfig, and other parameters passed into the
>     >> hypercall(s).  The testing logic doesn't really want to care
>     about what
>     >> failed; simply that the error was handled correctly.
>     >>
>     >> So a test for this might look like:
>     >>
>     >> cfg = { ... };
>     >> while ( xc_create_domain(xch, cfg) < 0 )
>     >>     cfg.fault_ttl++;
>     >>
>     >>
>     >> The pro's of this approach is that for a specific build of Xen on a
>     >> piece of hardware, it ought to check every failure path in
>     >> domain_create(), until the ttl finally gets higher than the
>     number of
>     >> fail-able actions required to construct a domain.  Also, the test
>     >> doesn't need changing as the complexity of domain_create() changes.
>     >>
>     >> The main con will mostly likely be the invasiveness of code in
>     Xen, but
>     >> I suppose any fault injection is going to be invasive to a
>     certain extent.
>     > While I like the idea in principle, the innocent looking
>     >
>     > cfg = { ... };
>     >
>     > is quite a bit of a concern here as well: Depending on the precise
>     > settings, paths taken in the hypervisor may heavily vary, and hence
>     > such a test will only end up being useful if it covers a wide
>     > variety of settings. Even if the number of tests to execute turned
>     > out to still be manageable today, it may quickly turn out not
>     > sufficiently scalable as we add new settings controllable right at
>     > domain creation (which I understand is the plan).
>
>     Well - there are two aspects here.
>
>     First, 99% of all VMs in practice are one of 3 or 4
>     configurations.  An
>     individual configuration is O(n) time complexity to test with
>     fault_ttl,
>     depending on the size of Xen's logic, and we absolutely want to be
>     able
>     to test these deterministically and to completion.
>
>     For the plethora of other configurations, I agree that it is
>     infeasible
>     to test them all.  However, a hypercall like this is easy to wire up
>     into a fuzzing harness.
>
>     TBH, I was thinking of something like
>     https://github.com/intel/kernel-fuzzer-for-xen-project with a PVH Xen
>     and XTF "dom0" poking just this hypercall.  All the other complicated
>     bits of wiring AFL up appear to have been done.
>
>     Perhaps when we exhaust that as a source of bugs, we move onto fuzzing
>     the L0 Xen, because running on native will give it more paths to
>     explore.  We'd need some way of reporting path/trace data back to
>     AFL in
>     dom0 which might require a bit plumbing.
>
>
> This is a pretty cool idea, I would be very interested in trying this
> out. If running Xen nested in a HVM domain is possible (my experiments
> with nested setups using Xen have only worked on ancient hw last time
> I tried) then running the fuzzer would be entirely possible using VM
> forks. You don't even need a special "dom0", you could just add the
> fuzzer's CPUID harness to Xen's hypercall handler and the only thing
> needed from the nested dom0 would be to trigger the hypercall with a
> normal config. The fuzzer would take it from there and replace the
> config with the fuzzed version directly in VM forks. Defining what to
> report as a "crash" to AFL would still need to be defined manually for
> Xen as the current sink points are Linux specific
> (https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/src/sink.h),
> but that should be straight forward.
>
> Also, running the fuzzer with PVH guests hasn't been tested but since
> all VM forking needs is EPT it should work.

Xen running inside Xen definitely works, and is even supported as far as
PV-Shim goes (i.e. no nested virt).  That would limit testing to just
creation of PV guests at L1, which is plenty to get started with.

Xen nested under Xen does work to a first approximation, and for the
purposes of fuzzing areas other than the nested-virt logic, might even
be ok.  (I use this configuration for a fair chunk of hvm development).

~Andrew

--------------46C7FD4784E30F01E79F7FD1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 22/12/2020 15:47, Tamas K Lengyel
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABfawh=nS2nuFEyx+7Hi5S5HUYtqXTJ6LMTLpZErs5_d22GWgQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Dec 22, 2020 at 6:14
            AM Andrew Cooper &lt;<a
              href="mailto:andrew.cooper3@citrix.com"
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On 22/12/2020 10:00, Jan
            Beulich wrote:<br>
            &gt; On 21.12.2020 20:36, Andrew Cooper wrote:<br>
            &gt;&gt; Hello,<br>
            &gt;&gt;<br>
            &gt;&gt; We have some very complicated hypercalls,
            createdomain, and max_vcpus a<br>
            &gt;&gt; close second, with immense complexity, and very
            hard-to-test error handling.<br>
            &gt;&gt;<br>
            &gt;&gt; It is no surprise that the error handling is
            riddled with bugs.<br>
            &gt;&gt;<br>
            &gt;&gt; Random failures from core functions is one way, but
            I'm not sure that<br>
            &gt;&gt; will be especially helpful.  In particular, we'd
            need a way to exclude<br>
            &gt;&gt; "dom0 critical" operations so we've got a usable
            system to run testing on.<br>
            &gt;&gt;<br>
            &gt;&gt; As an alternative, how about adding a fault_ttl
            field into the hypercall?<br>
            &gt;&gt;<br>
            &gt;&gt; The exact paths taken in {domain,vcpu}_create() are
            sensitive to the<br>
            &gt;&gt; hardware, Xen Kconfig, and other parameters passed
            into the<br>
            &gt;&gt; hypercall(s).  The testing logic doesn't really
            want to care about what<br>
            &gt;&gt; failed; simply that the error was handled
            correctly.<br>
            &gt;&gt;<br>
            &gt;&gt; So a test for this might look like:<br>
            &gt;&gt;<br>
            &gt;&gt; cfg = { ... };<br>
            &gt;&gt; while ( xc_create_domain(xch, cfg) &lt; 0 )<br>
            &gt;&gt;     cfg.fault_ttl++;<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; The pro's of this approach is that for a specific
            build of Xen on a<br>
            &gt;&gt; piece of hardware, it ought to check every failure
            path in<br>
            &gt;&gt; domain_create(), until the ttl finally gets higher
            than the number of<br>
            &gt;&gt; fail-able actions required to construct a domain. 
            Also, the test<br>
            &gt;&gt; doesn't need changing as the complexity of
            domain_create() changes.<br>
            &gt;&gt;<br>
            &gt;&gt; The main con will mostly likely be the invasiveness
            of code in Xen, but<br>
            &gt;&gt; I suppose any fault injection is going to be
            invasive to a certain extent.<br>
            &gt; While I like the idea in principle, the innocent
            looking<br>
            &gt;<br>
            &gt; cfg = { ... };<br>
            &gt;<br>
            &gt; is quite a bit of a concern here as well: Depending on
            the precise<br>
            &gt; settings, paths taken in the hypervisor may heavily
            vary, and hence<br>
            &gt; such a test will only end up being useful if it covers
            a wide<br>
            &gt; variety of settings. Even if the number of tests to
            execute turned<br>
            &gt; out to still be manageable today, it may quickly turn
            out not<br>
            &gt; sufficiently scalable as we add new settings
            controllable right at<br>
            &gt; domain creation (which I understand is the plan).<br>
            <br>
            Well - there are two aspects here.<br>
            <br>
            First, 99% of all VMs in practice are one of 3 or 4
            configurations.  An<br>
            individual configuration is O(n) time complexity to test
            with fault_ttl,<br>
            depending on the size of Xen's logic, and we absolutely want
            to be able<br>
            to test these deterministically and to completion.<br>
            <br>
            For the plethora of other configurations, I agree that it is
            infeasible<br>
            to test them all.  However, a hypercall like this is easy to
            wire up<br>
            into a fuzzing harness.<br>
            <br>
            TBH, I was thinking of something like<br>
            <a
              href="https://github.com/intel/kernel-fuzzer-for-xen-project"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/intel/kernel-fuzzer-for-xen-project</a>
            with a PVH Xen<br>
            and XTF "dom0" poking just this hypercall.  All the other
            complicated<br>
            bits of wiring AFL up appear to have been done.<br>
            <br>
            Perhaps when we exhaust that as a source of bugs, we move
            onto fuzzing<br>
            the L0 Xen, because running on native will give it more
            paths to<br>
            explore.  We'd need some way of reporting path/trace data
            back to AFL in<br>
            dom0 which might require a bit plumbing.</blockquote>
          <div><br>
          </div>
          <div>This is a pretty cool idea, I would be very interested in
            trying this out. If running Xen nested in a HVM domain is
            possible (my experiments with nested setups using Xen have
            only worked on ancient hw last time I tried) then running
            the fuzzer would be entirely possible using VM forks. You
            don't even need a special "dom0", you could just add the
            fuzzer's CPUID harness to Xen's hypercall handler and the
            only thing needed from the nested dom0 would be to trigger
            the hypercall with a normal config. The fuzzer would take it
            from there and replace the config with the fuzzed version
            directly in VM forks. Defining what to report as a "crash"
            to AFL would still need to be defined manually for Xen as
            the current sink points are Linux specific (<a
href="https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/src/sink.h"
              moz-do-not-send="true">https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/src/sink.h</a>),
            but that should be straight forward.</div>
          <div><br>
          </div>
          <div>Also, running the fuzzer with PVH guests hasn't been
            tested but since all VM forking needs is EPT it should work.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Xen running inside Xen definitely works, and is even supported as
    far as PV-Shim goes (i.e. no nested virt).  That would limit testing
    to just creation of PV guests at L1, which is plenty to get started
    with.<br>
    <br>
    Xen nested under Xen does work to a first approximation, and for the
    purposes of fuzzing areas other than the nested-virt logic, might
    even be ok.  (I use this configuration for a fair chunk of hvm
    development).<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------46C7FD4784E30F01E79F7FD1--

