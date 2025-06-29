Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01222AECF96
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jun 2025 20:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028745.1402490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVwrW-0001Qp-6z; Sun, 29 Jun 2025 18:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028745.1402490; Sun, 29 Jun 2025 18:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVwrW-0001OZ-41; Sun, 29 Jun 2025 18:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1028745;
 Sun, 29 Jun 2025 18:34:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVwrU-0001OS-S1
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 18:34:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVwrT-008jCP-2z;
 Sun, 29 Jun 2025 18:34:43 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVwrT-005gdx-1n;
 Sun, 29 Jun 2025 18:34:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=cJHHJpg3P2YjWBsr5KnOK6Po8+s5KsXgWgo/4gZ7VhY=; b=M4yV8Px1LL8kXqhztXX0RFVHFK
	AuO5OtX2JpzPSyE41G72m8iGVDvnRGjxW4IpY3vQpWlDbK2hk42bqtIbAG/BFKUPvRPIvluVom1ir
	259hdbPUDn25fyXkXBJ5Hsbpq5C7jDAw93+zC8otC1ixJ7JEeXNbwObUptsiY0GyS5VM=;
Message-ID: <41566d23-464b-4676-8e01-e2f27d377a94@xen.org>
Date: Sun, 29 Jun 2025 19:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 8/8] docs: armproposa: l to add separate SCMI node
 for Xen agent
Content-Language: en-GB
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <3f7e1e99f5d1018064f3c4825aff16bd487cf558.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231309090.147219@ubuntu-linux-20-04-desktop>
 <e5e8b7b3-a9c3-4e1a-9241-6776990b6e11@epam.com>
 <alpine.DEB.2.22.394.2506171720390.1780597@ubuntu-linux-20-04-desktop>
 <e4bf11e1-5bf5-4428-bd73-4fd2cb2029fb@epam.com>
 <alpine.DEB.2.22.394.2506221451440.8066@ubuntu-linux-20-04-desktop>
 <3468bb57-3178-460b-8fb2-3ce106475319@xen.org>
 <df2ee229-ec98-4097-a6bb-b16910c540e9@epam.com>
 <c8521929-50dd-4113-bb35-1d64e3a0645c@xen.org>
 <d92874cc-e8f3-46d3-815d-1c21c42dc96b@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d92874cc-e8f3-46d3-815d-1c21c42dc96b@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 29/06/2025 16:41, Oleksii Moisieiev wrote:
 > --->
> In the Virtualized system:

Thanks for the long explanation. In this section, you mention Xen all 
over the place. But as you previously agreed the multi-agent SCMI is not 
Xen specific. To put it differently, aside the fact...

> 
 > - The Xen is real OSPM which manages other Virtual OSPM and it needs> 
dedicated SCMI management channel through which
>    it can perform HW resources assignment for Virtual OSPM by
> communicating with EL2 SCMI FW
>    during Virtual OSPM creation or release HW resources during Virtual
> OSPM destruction.
>    In the future it also possible to enable such PM feature as SCMI based
> CpuFreq in Xen.
> 
>    The SCMI DT binding for Xen SCMI Agent expected to be exactly the same
> as for any OSPM (like Linux) as from
>    SCMI FW point of few it is just OS running on Application Core (which
> substitutes regular OS - Linux, RTOS).
>    So no new SCMI specific bindings (including compatibilities)
> introduced neither in this series nor in this proposal.
> 
>    In other words, Xen needs two DT to boot, kinda:
>    - Xen DT (with bootinfo, Application Core info, uart)
>    - Host Platform DT (source information to create domains)
>     and if there would be two separate DTs - each will have own standard
> (bindings) DT SCMI node.
> According to the current design Xen accepts DT which is Host Platform DT
> with added Xen configuration so Xen SCMI info is added in Xen
> configuration node under /chosen, and no Domains is expected to see it
> ever. After Xen initialization DT nodes from Xen DT are copied to the
> Dom0 device tree. Our proposal is to keep SCMI configuration from
> Platform Host DT the  same so it will be copied to the Dom0 device tree.
> 
> 
> - the number of Virtual Machines or Virtual OSPMs (in terms of SCMI)
> depends on hypervisor (Xen) configuration.
>    And Virtual OSPM is defined as VM which has direct access to HW
> (passthrough), so need access
>    SCMI services to get fine-grained and safe access to required Platform
> HW resources, and avoid interference.
> 
>    Every Virtual OSPM is SCMI agent, which sees it's own SCMI transport,
> and doesn't know about other agents.
>    In the case of DT - the standard SCMI bindings are used.
> 
> - So the Xen is the only entity in the platform which need to know about
> other Agents.
>     Therefore, this Xen specific configuration "xen,scmi-secondary-agents",
>     for the case of the EL2 SCMI FW, is introduced and added under the
> /chosen node (or xen-config).
>     Unfortunately, there is no way to discover Agent's configurations
> using SCMI protocol (base), like "func-id"
>     and shmem parameter (only can get Number of Agents, and discover own
> Agent id), so only option is to
>     define this info in DT for Xen. However, Xen can use shared memory
> regions and func_ids of the other Agents to   determine agent_id using
> base protocol. That's why it was decided to make agent_id in
> "xem,scmi-secondary-agents" optional.


... the name of this property contains "xen", I still don't understand 
why the binding could not be used by other hypervisors. IOW, what if 
above you s/xen/KVM/ (or any other hypervisor you come up with)? Are 
they all going to create their own bindings? I would guess not given the 
single agent is already generic (if I am not mistaken, both Linux and 
Xen are using it)

I will not insist on moving the binding outside of /chosen if the other 
maintainers think this is the best. But I think this is shortsighted to 
add "xen" in all the name or put it in a Xen specific position.

Ultimately what I want to avoid is we have to support multiple bindings 
in Xen because someone else decided to create a new binding as we didn't 
even attempt to make ours generic...

Cheers,

-- 
Julien Grall


