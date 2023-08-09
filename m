Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4EA774FF9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 02:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580626.908980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXJK-0004xF-18; Wed, 09 Aug 2023 00:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580626.908980; Wed, 09 Aug 2023 00:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXJJ-0004uE-Th; Wed, 09 Aug 2023 00:44:25 +0000
Received: by outflank-mailman (input) for mailman id 580626;
 Wed, 09 Aug 2023 00:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTXJI-0003tO-43
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 00:44:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e101da2f-364d-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 02:44:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97F81621E5;
 Wed,  9 Aug 2023 00:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED40C433C8;
 Wed,  9 Aug 2023 00:44:18 +0000 (UTC)
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
X-Inumbo-ID: e101da2f-364d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691541860;
	bh=7D+P9K07J5ED2+m1dphwVZo4e3lgK4BSZDueqQ3XM3k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bqhrA2vc33gfPzdWfPjwNiKBU55KjcfljbtQhq+hj47jtaMlGOZfdDGZrzCJIo6nA
	 70PCuqfDfcrufZtwF747+OP4nQLRThiTwDqddxmONu2ApnpZTfdkvyHjOVG7Hr2o9I
	 liCOBMvRGySlifFegdgtLOOuV25++ffJOua+enbBe5ZEF4+BhAhM5P8o01vRE9zq4W
	 HLUJrFxkJxGciEUUqF5L5tvuhhZPLh5VhzIU66Eufipixa84M21VqI94OEGmgMZRq1
	 2s1tmli7MlO/I0qB6sV882c21z6klRfZ9EM019JKrXjQPZp3Yo3V9zrbkQeL6d+o1+
	 TkEAmUEkZaY1Q==
Date: Tue, 8 Aug 2023 17:44:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
In-Reply-To: <f0c7b8cb-e5e0-40bd-951c-da732e65730a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308081655350.2127516@ubuntu-linux-20-04-desktop>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com> <20230803104438.24720-2-dpsmith@apertussolutions.com> <3ddab6ee-54fc-49a0-8f14-79ca258d04af@xen.org> <76249714-6d1d-a2ad-cfe5-d7eae0ce3a1b@apertussolutions.com>
 <f0c7b8cb-e5e0-40bd-951c-da732e65730a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1287296653-1691539381=:2127516"
Content-ID: <alpine.DEB.2.22.394.2308081703050.2127516@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1287296653-1691539381=:2127516
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308081703051.2127516@ubuntu-linux-20-04-desktop>

On Tue, 8 Aug 2023, Julien Grall wrote:
> On 08/08/2023 21:49, Daniel P. Smith wrote:
> > On 8/4/23 05:03, Julien Grall wrote:
> > > Hi Daniel,
> > > 
> > > On 03/08/2023 11:44, Daniel P. Smith wrote:
> > > > +compatible
> > > > +  Identifies which hypervisors the configuration is compatible.
> > > > Required.
> > > > -    hypervisor {
> > > > -        compatible = “hypervisor,xen”
> > > > +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
> > > 
> > > I read "e.g" as "for example". You don't explicitely say which compatible
> > > will be supported by Xen, so one could write "hypervisor,foo" and expect
> > > to work.
> > > 
> > > Also, it is not fully clear why you need both the hypervisor and each
> > > domain node to have a compatible with the hypervisor name in it.
> > 
> > Ack, it should be explicit to what is expected for a Xen configuration. As
> > for compatible on the domain node, I think that was from being overly
> > cautious, it can be dropped.
> > 
> > This did get me reflecting that the compatibility was added there as there
> > was some initial participation in standardization efforts going on at the
> > time. I am not sure what has come of those, but the question it raised is
> > that domain is a Xen specific term, whereas generally vm is accepted as the
> > generic term. Maybe this node needs renaming?
> 
> IIRC Stefano attempted to (partially?) standardized the Device-Tree
> configuration for domains. So I will let him comment here.

Yes it is called System Device Tree there is a public version of it
here:
https://github.com/devicetree-org/lopper/tree/master/specification/source
https://github.com/devicetree-org/lopper/blob/3e501d6c87f32d26fe5906760d1f661dbc0b4400/specification/source/system-device-tree.dts#L797

Here is what I would suggest for the hyperlaunch DT interface:

- try to minimize changes with the existing dom0less DT interface
- only introduce changes that are strictly necessary
- when changes are necessary, try to align with the System DT
  specification (which I can update if required)
- try to avoid changes that are different from dom0less and SystemDT
  both


> > > > +compatible
> > > > +  Identifies the hypervisor the confiugration is intended. Required.
> > > 
> > > Also typo: s/confiugration/configuration/
> > 
> > Ack.
> > 
> > > > -The modules that would be supplied when using the above config would
> > > > be:
> > > > +  Format: "<hypervisor name>,config", e.g "xen,config"
> > > > -* (the above config, compiled into hardware tree)
> > > > -* CPU microcode
> > > > -* XSM policy
> > > > -* kernel for boot domain
> > > > -* ramdisk for boot domain
> > > > -* boot domain configuration file
> > > > -* kernel for the classic dom0 domain
> > > > -* ramdisk for the classic dom0 domain
> > > > +bootargs
> > > > +  This is used to provide the boot params for Xen.
> > > 
> > > How is this different from the command line parameter chosen? And if you
> > > want to keep both, what is the expected priority if a user provides both?
> > 
> > A DT file for x86, there is only a need to provide the hypervisor node, for
> > which we already needed a hypervisor config section to describe XSM policy
> > and microcode, at this point at least. It was decided in an effort to
> > provide flexibility, the ability to specify command line parameters to the
> > hypervisor in DT config. It is expected these parameters would function as a
> > base parameters that would be overridden by those provided via the multiboot
> > kernel entry.
> ]>
> > Now as you point out for Arm, this becomes a bit redundant, to a degree, as
> > the Xen command line is already under the /chosen node. But even here it
> > would be beneficial, as a hyperlaunch configuration could be distributed
> > consisting of a dtb that has core parameters set with base values along with
> > a set of kernels and ramdisks. At boot, the hyperlaunch dtb could then be
> > concatenated with the device specific dtb.
> 
> I don't have a strong opinions on how it should be done. My point is more that
> the priority should be document.

Any change we make to the existing interface is more effort for us. I
would try to avoid changes. But of course we'll need new properties to
define domain roles (e.g. hardware domain, control domain).

For instance, do we need a hypervisor node? The XSM policy can be
specified already in dom0less and we could use the same strategy for
microcode.

 
> > > > -The hypervisor device tree would be compiled into the hardware device
> > > > tree and
> > > > -provided to Xen using the standard method currently in use. The
> > > > remaining
> > > > -modules would need to be loaded in the respective addresses specified
> > > > in the
> > > > -`module-addr` property.
> > > > +  Format: String, e.g. "flask=silo"
> > > > +Child Nodes
> > > > +"""""""""""
> > > > -The Hypervisor node
> > > > --------------------
> > > > +* module
> > > > -The hypervisor node is a top level container for the domains that will
> > > > be built
> > > > -by hypervisor on start up. On the ``hypervisor`` node the
> > > > ``compatible``
> > > > -property is used to identify the type of hypervisor node present..
> > > > +Domain Node
> > > > +-----------
> > > > -compatible
> > > > -  Identifies the type of node. Required.
> > > > +A ``domain`` node is for describing the construction of a domain. Since
> > > > there
> > > > +may be one or more domain nodes, each one requires a unique, DTB
> > > > compliant name
> > > > +and a ``compatible`` property to identify as a domain node.
> > > > -The Config node
> > > > ----------------
> > > > +A ``domain`` node  may provide a ``domid`` property which will be used
> > > > as the
> > > > +requested domain id for the domain with a value of “0” signifying to
> > > > use the
> > > > +next available domain id, which is the default behavior if omitted. It
> > > > should
> > > > +be noted that a domain configuration is not able to request a domid of
> > > > “0”
> > > 
> > > Why do you need this restriction? And more importantly how would you
> > > describe dom0 in hyperlaunch?
> > 
> > I would start by saying one of the goals/purposes behind hyperlaunch is to
> > remove the binding that "dom0" is identified by having domid 0. That is what
> > the roles patch recently submitted is working to achieve. "Dom0" is a role
> > in the system, which I tried calling the "unbounded role" but that seems to
> > have caused some confusion.
> > 
> > That aside, IMHO because of the legacy around domid 0, I don't think it
> > should be assignable through hyperlaunch.
> 
> I understand the end goal. But I am not entirely convinced this will be wanted
> for everyone. So it might be preferable to avoid using '0' as 'assign any free
> domid' as this would not prevent to describe dom0 in hyperlaunch if needed in
> the future.

In general I find that forcing people to adopt security features is
detrimental because:
- people that wants the security feature would have used it anyway
- people that doesn't want it, still doesn't want it and now they are
  frustrated

So I think we should let users specify domid 0. Is that a configuration
for a secure or a safe system? It is not. But some systems are just for
handling cats pictures.

If after the hyperlaunch patches domid 0 becomes meaningless then at
that point I would make a change to the DT interface potentially for Xen
to refuse to continue because the feature requested is unavailable.


> > Additionally, there should be an identifier that signifies auto-assign the
> > domid and that value should not conflict/limit what domids are usable by the
> > hypervisor.
> 
> Why is this requirement? Why can't we simply rely on the property is not
> present?
> 
> >  Given we should not be assigning domid 0 through this interface, it makes
> > it the perfect candidate value.
> To be honest, even if you don't want to allow an admin to allocate ID 0,  I
> think using it is confusing because of the legacy meaning behind it.
> 
> I would likely be confused every time I read a device-tree.

I agree


> Also, given you
> already have a way to say 'assign a domain ID', it is not clear to me why you
> really need a second way to do it.
> 
> [...]
> 
> > > > +
> > > > +capability
> > > > +  This identifies what system capabilities a domain may have beyond the
> > > > role it
> > > > +  was assigned.
> > > >     Optional, the default is none.
> > > > -.. note::  The `functions` bits that have been selected to indicate
> > > > -   ``FUNCTION_XENSTORE`` and ``FUNCTION_LEGACY_DOM0`` are the last two
> > > > bits
> > > > -   (30, 31) such that should these features ever be fully retired, the
> > > > flags may
> > > > -   be dropped without leaving a gap in the flag set.
> > > > +  Format: Bitfield, e.g <3221225487> or <0xC0000007>
> > > 
> > > I thik we should favor the hexadecimal version because this will be
> > > somewhat easier to read.
> > 
> > I too favor the hex version, but as I recall, DT/libfdt doesn't
> > care/enforce.
> 
> Indeed the device-tree compiler is able to cope with both. However, we don't
> have to mention the two. It would be ok to only mention the one we prefer
> (i.e. hexadecimal) so the reader will more naturally use it.
> 
> > 
> > > Also, the Device-Tree values work in term of 32-bit cell. Also, how do you
> > > plan to handle the case where you have more than 32 capabilities?
> > 
> > I would add a capabalities2 field, this is how SELinux/Flask handle the same
> > problem.
> 
> You should not need to introduce a new field. Instead you can add a second
> cell. But we would need to describe the ordering because for backward
> compatibility the cell 0 would want to cover bits [0:31] and cell 2 bits
> [64:31].
> 
> [...]
> 
> > > > +
> > > >   memory
> > > > -  The amount of memory to assign to the domain, in KBs.
> > > > +  The amount of memory to assign to the domain, in KBs. This field uses
> > > > a DTB
> > > > +  Reg which contains a start and size. For memory allocation start may
> > > > or may
> > > > +  not have significance but size will always be used for the amount of
> > > > memory
> > > >     Required.
> > > 
> > > The description doesn't match...
> > 
> > Ack, others caught that as well. Will be fixed.
> > 
> > > > +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
> > > 
> > > ... the format. But strings are difficult to parse. If you want to provide
> > > 3 different values (possibly optional), then it would be best to have 3
> > > different properties.
> > 
> > That format comes from the command line dom0 memory parameter, in the
> > hyperlaunch series I reused that existing parser that I am fairly confident
> > will be maintained.
> 
> Fair enough. However, I am still unconvinced this is the way to go. I don't
> have a strong argument other than 'memory' is already a number for dom0less DT
> and it sounds strange to change it.
> 
> Stefano, Bertrand, any opinions?

The current way to express domain memory in dom0less is not my favorite.
However, for the sake of minimizing changes, I think we should re-use it
as-is. That is my preference.

If the min/max parameters, currently unsupported, are must-have, then
yes we could introduce them as a change to the dom0less interface. 

I think we have 3 options:

- Expand the existing memory node in a backware compatible way, i.e. min
  and max could be the second and third cell of "memory"

- Introduce a new parameter to express memory, min and max, it cannot be
  called "memory" as it would conflict with the same name we use in
  dom0less
    - for instance, memory_string or memory_str if we use a string type
    - or memory_limits or memory_amounts if we use numerical types

- Introduce 2 new parameters to specify min and max separately in
  addition to memory

I am fine with all three, but I think this is not a high-priority item
as most domains would work fine with just memory specified (without min
and max).
--8323329-1287296653-1691539381=:2127516--

