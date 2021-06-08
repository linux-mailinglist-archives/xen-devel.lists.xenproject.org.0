Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE739FFE4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 20:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138918.257020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqghv-0001uT-D8; Tue, 08 Jun 2021 18:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138918.257020; Tue, 08 Jun 2021 18:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqghv-0001rK-9r; Tue, 08 Jun 2021 18:44:11 +0000
Received: by outflank-mailman (input) for mailman id 138918;
 Tue, 08 Jun 2021 18:44:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vz6+=LC=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lqghu-0001rE-Do
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 18:44:10 +0000
Received: from mail-oi1-x22b.google.com (unknown [2607:f8b0:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31d3982a-8049-49bd-93b8-a0f0bc821cac;
 Tue, 08 Jun 2021 18:44:06 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id a26so1829720oie.11;
 Tue, 08 Jun 2021 11:44:06 -0700 (PDT)
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
X-Inumbo-ID: 31d3982a-8049-49bd-93b8-a0f0bc821cac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=yMYHVO+ERtPmmmBOaX2eo+ZhIMxbzVu0YuG005cvwe8=;
        b=liOxfv1Wfeu3baNbBGqOD8Rcbq/Wz6hk3ewjAlBKfw85uynOXPtby3tHnInul6rlVn
         ZkRe1YByIAU2JtiISG96lPzOfZIKYevFFxJK9EtZexagTW91ULGFpI4eBBrv3Pf+MVRg
         HyEaODXMDLIUcgUZQFq6E3plHbQyL3UucKxf1OpBeqwqZbpu07T1U5+asBdyD5MhRU3l
         o096+D0z2yDNAXSC3g3pzP8UXkDKa8CYM2ckTdo1owuxQ26yAafs+Z8tvuWs8AbsPsW1
         O4DfLbdkUNNqD57nuQ/pFrSEdw8tVGZ+3guZFjuON9MpwLZG/bqMORhZ+tusu9Y3uiRR
         6FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=yMYHVO+ERtPmmmBOaX2eo+ZhIMxbzVu0YuG005cvwe8=;
        b=SXooLDoOCq2d5yBKU5/0siSEy/NchYBjSR0kJPDTVpNtAPWV3MdG9hcPQXY1/n3Iyz
         CzAYm1/QvsOwqZ7paYimyc7hv6urhJ+SEpsF2iv6livbA9WNhVkwFK/VEr1w0GklCH3Q
         ygxrfA1ksTJ4B/sggL1fSTwFQCoxq0+ae/sv18N/YjB2VQL01BwQAXnfu64DaDOH3YRY
         i0laptbASWTEdWOT8E5YQ/DOMSHsDbWKUIa8yD5rnmI7qu8M6oM/MRXPIb9o/jgXffoV
         gGIU+sut841TTyXt6pgPLpZpxFbol6dslb3wyizResqKOcUt1m6pJFeBJu9u1XzRfHs1
         E/tQ==
X-Gm-Message-State: AOAM530LeIQV5cdazkWnoThcF4CgrlI64qxSOphvjWoZ+W8BdYjZ8Sip
	hkcGN1JMkvP1ueIuQLgiQRU6qnrvcut/bxWL/U9ZXqwrcpibrQ==
X-Google-Smtp-Source: ABdhPJz9pbTtyhnyt9qsUHIxlUmnIvP+pQ89TpXICMW5WfNiJ10uPlkJEPb4KYWioy9tcgEWchfpc4LhajaEyCnsuB0=
X-Received: by 2002:aca:4554:: with SMTP id s81mr3807985oia.152.1623177845386;
 Tue, 08 Jun 2021 11:44:05 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 8 Jun 2021 11:43:52 -0700
Message-ID: <CACMJ4Ga47G1UZSiy=Ud=audqDr93+5vF8s-tPtoBiN69ZK=v-Q@mail.gmail.com>
Subject: Xen Summit Design Session notes: Hyperlaunch
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Rich Persaud <persaur@gmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>, 
	Scott Davis <scott.davis@starlab.io>, Christopher Clark <christopher.clark@starlab.io>, 
	quinnr@ainfosec.com, openxt <openxt@googlegroups.com>, 
	dgdegra <dgdegra@tycho.nsa.gov>, Artem Mygaiev <artem_mygaiev@epam.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, demi@invisiblethingslab.com, dfaggioli@suse.com, 
	mengxu@cis.upenn.edu, josh.whitehead@dornerworks.com, 
	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>, Juergen Gross <jgross@suse.com>, 
	trenchboot-devel@googlegroups.com, system-dt@lists.openampproject.org, 
	minios-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Design Session - Hyperlaunch
--------------------
Wednesday 26th May, at the Xen Design and Developer Summit 2021
Session Hosts: Christopher Clark & Daniel Smith

tl;dr:
- use cases for Hyperlaunch include supporting bare metal apps
    - latency is a critical requirement for workloads
        - determines success/failure of the system
        - scheduling is hard; Xen has options, including RTDS
- Zephyr in dom0 being explored in the Arm embedded community
- XSM Roles work is to support flexible deployment structure
- System Device Tree is important for Hyperlaunch to integrate
    - migration from dom0less to be supported
    - Lopper tool translates SDT to traditional Device Trees for domains
- Boot Domain could run Lopper
    - could be done as a unikraft unikernel
- US/EU Supply Chain SBOM need aligns with Hyperlaunch + Trenchboot
    - options for funding to accelerate the work:
        - PCI passthrough, Recovery Domain, XSM framework improvements
- Design docs for Hyperlaunch available [patch posted to merge to Xen tree]
https://lists.xenproject.org/archives/html/xen-devel/2021-05/pdfq6mIMNPNoM.pdf
https://lists.xenproject.org/archives/html/xen-devel/2021-05/pdfQlbS0F4suy.pdf

Slides from the Hyperlaunch Keynote:
https://static.sched.com/hosted_files/xen2021/d7/Hyperlaunch%20-%20Keynote_%20Xen%20Summit%202021%20-%20Clark%2C%20Smith.pdf
Video: https://www.youtube.com/watch?v=Xwtq2Q0ylj0&list=PLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&index=21

Slides from the XSM Roles presentation:
https://static.sched.com/hosted_files/xen2021/75/Tuesday_A%20new%20Role%20model%20XSM-.pdf
Video: https://www.youtube.com/watch?v=j1fDn8ZbyVE&list=PLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&index=6

Hyperlaunch at the Xen Project wiki:
https://wiki.xenproject.org/wiki/Hyperlaunch

--------------------
Open Discussion:
- floor open for audience requirements, use cases for Hyperlaunch

Stefano:
    - use case: fast unikernel boot (on embedded known as "bare metal
      applications")
        - boot to up as quickly as possible

    - difference between unikernels and bare metal applications:
        - a bare metal application is a tiny driver for a hardware block
        - ie. a hardware block in programmable logic so no existing driver

    - a bare metal application: typically just a driver that executes as the
      "unikernel"
        - usually only a few of them

    - latency is the biggest concern for bare metal apps
        - hypervisor scheduling: a concern
        - priority reason: _must_ respond to hardware action in a very limited
          amount of time
        - ie. Latency more important than anything else
            - losing latency is software failure: disaster happens
        - consequence: Adding a scheduler makes it a lot harder
            - not doing any scheduling is typically easier
            - also need to do cache partitioning, and more

    - a bare metal app doesn't need any PV drivers since it doesn't
      communicate with any other software, just the hardware block.
        - access to mmio + an interrupt or two sufficient

Christopher:
    - use of unikernels aligns with what is wanted for the boot domain:
        - ie. use short, single-purpose domains for platform services to
          avoid turning the boot domain into another dom0 by continuing to
          add functionality
        - eg. Qubes OS Mirage firewall VM, or something similar from unikraft

Daniel:
    - design: the hypervisor finishes the system, waits for boot domain to exit
          and complete the launch
        - enters 'finalization phase', finishes bringing everything up:
          eg. unpausing other domains not unpaused by boot domain
        - boot domain wiped from memory

--- topic: Scheduling

Christopher:
    - For small, single-purpose domains: have a need to schedule these

Stefano:
    - Illustrative example: 2 domains: dom0 Linux, domU bare metal app
    - no scheduling, to make sure deadlines not broken
    - made domU pause dom0 during critical execution:
        - Interesting inversion of priority.

Point is that domU is the most critical thing on the entire system.
ie. if domU meets deadlines and dom0 not present, system still functional.

Christopher:
    - related: Connor's talk at this Summit re: moving scheduling out of
      Xen into dom0;
https://xen2021.sched.com/event/jAEs/the-root-vm-a-new-xen-domain-species-connor-davis-ais
    - also the Bromium architecture, and Daniel's HAT architecture
https://xen2020.sched.com/event/baXt/design-session-talk-reliable-platform-security-xen-and-the-fidelis-platform-for-hardened-access-terminals-hat
        - has concept of protection domains
    - interested in DomU running the fundamental workload but not being
      Control Domain, doesn't have those permissions

For this use case -- domU pauses dom0 for domU to meet its deadlines --
permission model must have been changed.

Stefano:
    - adhoc provision of two hypercalls so domU could pause/unpause dom0
    - not easy to make generic:
        - not just vcpu, must pause _everything_ except self
    - 5 lines of code for a hack, 10 months to do it properly, upstream, etc!

    - Critical section: an interrupt occurs, must act within a very limited
      amount of time; else the whole thing fails

    - Critical section is way smaller than a slot of the scheduler

    - Make sure everything else is paused, to get the full bandwidth of not just
      the CPU, but also DDR, no interrupts. Don't screw up those 15 microseconds

George:
    - how long does it take to pause all the other VMs on the system?
    - eg: a foreach domain, foreach vcpu, and just pause them, but:
      involves sending interrupts, waiting for the thing to finish, etc

Stefano:
    - I knew which event started the critical section, so I made that event the
      trigger for pausing dom0.


[via chat:] Demi Marie: What if we had a hard real-time scheduler like
seL4 does?
[via chat:] Artem: RTDS? NULL?
[via chat:] Andy: yup - those
[via chat:] Julien: https://wiki.xenproject.org/wiki/RTDS-Based-Scheduler
[via chat:] Artem: also ARINC653
[via chat:] Scott: sounds like he wants the hypervisor to disable interrupt
virtualization and sit in a tight loop running a single guest on certain cores
[via chat:] Artem: core pooling?
[via chat:] Demi Marie: IIRC seL4 can do this with the mixed-criticality
scheduling work
[via chat:] Artem: RTDS can do that but AFAIK it cannot reschedule slack

Daniel:
    - you need a scheduler that is aware of these critical interrupts that
when they occur, it means that that domain has to have exclusivity over the
system and can take care of ensuring that you get scheduling exclusivity over
the system.

Stefano: responding to Demi, re: "seL4 can do this with the mixed-criticality
scheduling work"
    - Yes, other domains in the past used this technique

George: you don't actually need to pause the other domains;
    - you just need to make sure that the other CPUs stop doing stuff.

Stefano: what I did: slept in Xen, not even pause the CPU: busy-looping Xen

George: in a sense is correct; similar to core scheduling, sibling cores switch
to not doing anything

Daniel: yes, lots of academic papers on these problems, eg. implemented in seL4
and other kernels.
XSM Roles: was done to help more advanced Hyperlaunch scenarios'
    - (I don't like this idea but:) you could build a role-based scheduler

Christopher: ARINC653 scheduler mentioned - Artem, have you experience with it?

Artem: no, sticking with RTDS. Also used it with full preemption for Xen.
- Really interested in RTDS.
    - want to explore using slack time for domains with best effort priorities
    - RTDS seems like the best option for future development.

Our scenarios, on Arm:
- distinguish between: hardware-controlling domain, hardware domains,
  and controlling domain:
- using dom0 as a controlling domain, able to recreate domains if needed

- using device tree and don't have ACPI: split hardware between domains
    - each domain can talk directly to some piece of hardware
        - ie. they all are, in a sense, hardware domains
    - each can be independently restarted to deal with faulty hardware drivers
        - eg. we can restart the GPU from dom0

- dom0 path to safety certifications: working on Zephyr as a dom0
    - event channels working
    - an early draft implementation

- aims:
    - a small RTOS acting as a starter in dom0
    - don't put other domain kernels in dom0 - instead: a bootloader
        - dom0 starts a domain, gives a generic bootloader, common for all other
          domains, and then other domains have their own filesystems
        - guest domain's know which kernel to use, so dom0 becomes very small
          and very generic, and not depending on other domain's kernels, etc.
        - ie. dom0 is purely for control functions

--- topic: how does Hyperlaunch help?

Stefano:
    - domU should not be started from dom0
        - two domains, no PV drivers at all
        - a clear use case for dom0less
    - more detailed XSM policies allows dom0 to not be fully privileged
    - XSM policy can allows one domU to stop the other domU


--- topic: request to review the design doc

Daniel:
    - we want to make sure that we're good on this idea of the boot domain
    - that we understand how these handoffs are going
    - the roles work, the subtask to get that integrated in so that we can do
      these disaggregated boots.

New definitions for Roles within the Xen system:
    - get away from concepts of 'is_control_domain' and 'is_hardware_domain'
    - talk about what Role we're asking a domain to do and function as
    - want a common language for roles
     (eg. avoid (possibly unaware) misconceptions of current differences in
     views on what a Control Domain is and what a Hardware Domain is)

Review the design doc, give us some feedback; will be adding a design doc for
the Roles work as well -- have a draft form of it and just want to flush it out
further, and hopefully we can get all of that adopted.


--- topic: Question from Julien: is the plan to completely remove dom0less
or keep the two together?

Christopher: integrate, so no boundary between the two
    - Everything with dom0less should continue to work

Daniel: yes
    - dom0less constructing domains from the hypervisor will continue,
      become common code, used by both Arm and x86.
    - biggest difference: migration from dom0less to hyperlaunch trees;
      not sure what that migration period will be.
        - much broader Device Tree definition
        - trying to ensure aligned with System Device Tree
            - (dom0less today has own specific Device Tree configuration)
        - for some period of time, the parser for the dom0less Device Tree is
          going to have to coexist with the Hyperlaunch one


--- topic: System Device Tree and Lopper

Stefano:
System Device Tree:
    - very similar to Hyperlaunch and dom0less
    - defines 'domains': VMs for Xen, or could be bare metal things
      running on a coprocessor
    - next few months: finish cleaning up the definition of domains in
      System Device Tree, and cover VMs properly

Align Hyperlaunch with the System Device Tree domains.
- already need migration from dom0less to System Device Tree
- don't want to do two migrations

System Device Tree comes with a tool called 'Lopper':
    [ https://github.com/devicetree-org/lopper ]

Lopper takes a single System Device Tree and generates multiple
traditional Device Trees, one for each domain in the System Device Tree.
    - Device Tree for VMs can be very different from the one on the host
    - Device Tree for bare metal domains can be much closer

Lopper supports python plugins
- eg. a Lopper plugin to convert the System Device Tree format into dom0less
  format, so works with current Xen parsing
- changing the Xen parsing eventually would be better


Daniel:
- with Hyperlaunch: could boot with the System Device Tree, and pass it
  into the Boot Domain, where Lopper runs, and Lopper can generate domain device
  trees for guest domains to start

Stefano: would be very cool!
- System Device Tree (and Lopper, in python) so far always used at build time

Daniel: the unikraft project has its micropython unikernel
- for embedding scripts as a unikernel
- eg. a unikraft unikernel python domain with Lopper and Boot Domain logic
    - takes System Device Tree used to construct all the domains, and does
      the Device Tree generation
- from a security standpoint: nice: hypervisor's not generating Device Trees
    - all at runtime in a clean, safe architecture

Christopher: interesting for CI looping as well

--- topic: Scope, Funding, Alignment of work

Rich: Q: You said that you were managing the scope, because it could become
quite big: Could you talk about:
    - Some of the things that you have left out of scope?
    - Areas where funding would help?
    - Areas where other contributors would help?
    - How Trenchboot is connected to this or just launch integrity in general?

"In both the US and the EU, there is a top-down effort for supply chain
security, powered by ransomware and bitcoin, so " [ money is available ]
" to get more integrity in the software stack, and they're
pushing 'Secure Bill Of Materials (SBOM)', which we saw at the Yocto event.
So if you have a Secure Bill Of Materials, and your Hyperlaunch system with
Trenchboot can prove that the thing running matches the manifests, people might
want to pay money for that, and help drive your roadmap."

Daniel: Yes.

Trenchboot: Correct, the whole idea of this spawned out of the same thoughts
that created Trenchboot [ https://trenchboot.org/ ]

- proposed back in May/June 2018, driven by:
  how do we want to use Trenchboot in a Xen launch system where we had the
  security properties that we're seeking, but without blowing up, in terms of
  size and code and responsibility, into the hypervisor
    - ref: talk at Trenchboot Developer Forum
        - [ https://www.youtube.com/watch?v=qWMRcfQdc6c ]

- standard pattern following with Trenchboot: launch into a kernel that then
  launches into an integrity measurement system, a security engine
    - ie. for Xen: we do a DRTM launch into Xen, that starts a Boot Domain,
      our security engine that runs in a restricted environment that's protected
      to take measurements of the system that provides you attestable
      information, attestable evidence, to what's in your system, to the degree
      that's possible.
    - at the same time, not everybody wanted to have a capability specifically
      focussed on that, so there had already been discussions about a bootstrap
      domain, that we linked to when Daniel De Graaf did the original Hardware
      Domain - he posted an example Boot Domain capability,
        - so building all of this as the foundation

Rich: are there things you have wanted to do but have postponed or are there
tasks where you need external people to help, or external funding sources that
would allow those features to be addressed?

Christopher:
    - PCI passthrough is the big one
        - really important
        - highly complementary to Hyperlaunch to passthrough PCI devices
          right from start of all of initial VMs
        - but complex

    - the Recovery Domain
        - mentioned in the Design Document
        - ability to have a VM built, configured, and when failure is
          detected during host boot - eg. malfunction of a critical VM -
          can put rescue logic in there to enable recovery

Daniel:
    - For the Roles work, done the minimum Hyperlaunch needed
    - but could definitely go much further
        - get the XSM Framework cleaned up
        - get Flask in much better position
        - more advanced Roles
        - reevaluating all the XSM hooks in terms of Roles and everything
        - getting all of the security framework in a better state.

--------------------
The recording for this Design Session is available at:
https://www.youtube.com/watch?v=j75orDMXO2M&list=PLYyw7IQjL-zGcRPN6EjiTuFVGo4A6KCNf&index=13

