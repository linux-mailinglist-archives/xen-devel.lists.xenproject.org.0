Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1JEv/Xb2n8RwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 20:31:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F94A6EC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 20:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209313.1521371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viHR1-0001kg-BG; Tue, 20 Jan 2026 19:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209313.1521371; Tue, 20 Jan 2026 19:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viHR1-0001jC-80; Tue, 20 Jan 2026 19:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1209313;
 Tue, 20 Jan 2026 19:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wpuV=7Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1viHR0-0001j6-1W
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 19:30:38 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aee976e-f636-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 20:30:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D2024371F;
 Tue, 20 Jan 2026 19:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7E2C16AAE;
 Tue, 20 Jan 2026 19:30:27 +0000 (UTC)
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
X-Inumbo-ID: 7aee976e-f636-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768937429;
	bh=HCy+gefaPOQHIiQVT6+7rc0PqTa3aSWejYFbSe+K/sM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YVXAJBS7knwgvrIf0MH4ifgHEwPnIEoNO17FWM4dC0gc09GB9Zq3zhFeU3HKyWPPn
	 sP4XqQJIsxObYX14TET8wVkNqSzuzjinHz8czpTaGfkLQayPr7VVv1qhSG6/ffnxDQ
	 jPIv8KgUKN5NDpaHPy1XdZgk5pyWPrwL+S6N762MIQyTNc68Otf+hv50QLGoHwQH2W
	 NhJJ5quhvMveEbReQ0Ia1i7NDfKCyZfpoFJ18mAVjcTHOV3i3eychB+/V1KGp6rtKA
	 mV4kZgXj5juFKodyOSZDnrSop+sbK0w4kMUdgjmhihN/0dANplrRI8w2iv7s47hyh+
	 vK1I7EeAEvJJw==
Date: Tue, 20 Jan 2026 11:30:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v7 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
In-Reply-To: <4278b6df-11fc-403f-b498-16afe3e0c779@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601201130210.7192@ubuntu-linux-20-04-desktop>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com> <ee4995bf385f0ec691151fb797e14acdb5419c6b.1768415200.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2601141639070.72558@ubuntu-linux-20-04-desktop> <ed981ced-d5e5-45df-b424-cfc9866e993f@epam.com>
 <alpine.DEB.2.22.394.2601161220250.72558@ubuntu-linux-20-04-desktop> <5177397f-d596-40b3-9207-f0de63a24ee6@epam.com> <alpine.DEB.2.22.394.2601191311410.7192@ubuntu-linux-20-04-desktop> <4278b6df-11fc-403f-b498-16afe3e0c779@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-646006288-1768937429=:7192"
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,47ff3000:email,47ff0000:email,47ff1000:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 880F94A6EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-646006288-1768937429=:7192
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Jan 2026, Oleksii Moisieiev wrote:
> On 19/01/2026 23:12, Stefano Stabellini wrote:
> > On Mon, 19 Jan 2026, Oleksii Moisieiev wrote:
> >> On 16/01/2026 23:21, Stefano Stabellini wrote:
> >>> On Fri, 16 Jan 2026, Oleksii Moisieiev wrote:
> >>>> Hi Stefano,
> >>>> Please see below.
> >>>>
> >>>> On 15/01/2026 03:14, Stefano Stabellini wrote:
> >>>>> Hi Oleksii,
> >>>>>
> >>>>> I am fine with the goals and the strategy to achieve the goals but there
> >>>>> are some finer details that don't make sense to me. I apologize if I am
> >>>>> asking the same questions you have already answered as some time as
> >>>>> passed from the last interaction.
> >>>>>
> >>>>>
> >>>>> On Wed, 14 Jan 2026, Oleksii Moisieiev wrote:
> >>>>>> This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
> >>>>>> (TF-A) which provides SCMI interface with multi-agent support, as shown
> >>>>>> below.
> >>>>>>
> >>>>>>      +-----------------------------------------+
> >>>>>>      |                                         |
> >>>>>>      | EL3 TF-A SCMI                           |
> >>>>>>      +-------+--+-------+--+-------+--+-------++
> >>>>>>      |shmem1 |  |shmem0 |  |shmem2 |  |shmemX |
> >>>>>>      +-----+-+  +---+---+  +--+----+  +---+---+
> >>>>>> smc-id1 |        |         |           |
> >>>>>> agent1  |        |         |           |
> >>>>>>      +-----v--------+---------+-----------+----+
> >>>>>>      |              |         |           |    |
> >>>>>>      |              |         |           |    |
> >>>>>>      +--------------+---------+-----------+----+
> >>>>>>             smc-id0 |  smc-id2|    smc-idX|
> >>>>>>             agent0  |  agent2 |    agentX |
> >>>>>>                     |         |           |
> >>>>>>                +----v---+  +--v-----+  +--v-----+
> >>>>>>                |        |  |        |  |        |
> >>>>>>                | Dom0   |  | Dom1   |  | DomX   |
> >>>>>>                |        |  |        |  |        |
> >>>>>>                |        |  |        |  |        |
> >>>>>>                +--------+  +--------+  +--------+
> >>>>>>
> >>>>>> The EL3 SCMI multi-agent firmware is expected to provide SCMI SMC shared
> >>>>>> memory transport for every Agent in the system.
> >>>>>>
> >>>>>> The SCMI Agent transport channel defined by pair:
> >>>>>>     - smc-id: SMC id used for Doorbell
> >>>>>>     - shmem: shared memory for messages transfer, Xen page
> >>>>>>     aligned. Shared memort is mapped with the following flags:
> >>>>>>     MT_DEVICE_nGnRE.
> >>>>>>
> >>>>>> The follwoing SCMI Agents are expected to be defined by SCMI FW to enable SCMI
> >>>>>> multi-agent functionality under Xen:
> >>>>>> - Xen management agent: trusted agents that accesses to the Base Protocol
> >>>>>> commands to configure agent specific permissions
> >>>>>> - OSPM VM agents: non-trusted agent, one for each Guest domain which is
> >>>>>>      allowed direct HW access. At least one OSPM VM agent has to be provided
> >>>>>>      by FW if HW is handled only by Dom0 or Driver Domain.
> >>>>>>
> >>>>>> The EL3 SCMI FW is expected to implement following Base protocol messages:
> >>>>>> - BASE_DISCOVER_AGENT (optional if agent_id was provided)
> >>>>>> - BASE_RESET_AGENT_CONFIGURATION (optional)
> >>>>>> - BASE_SET_DEVICE_PERMISSIONS (optional)
> >>>>>>
> >>>>>> The SCI SCMI SMC multi-agent driver implements following
> >>>>>> functionality:
> >>>>>> - The driver is initialized from the Xen SCMI container ``xen_scmi_config``
> >>>>>>      (compatible ``xen,sci``) placed under ``/chosen/xen``. Only the
> >>>>>>      ``arm,scmi-smc`` node that is a child of this container will bind to Xen;
> >>>>>>      other SCMI nodes (for example under ``/firmware``) are ignored to avoid
> >>>>>>      stealing the host OSPM instance.
> >>>>>>
> >>>>>> scmi_shm_1: sram@47ff1000 {
> >>>>>>              compatible = "arm,scmi-shmem";
> >>>>>>              reg = <0x0 0x47ff1000 0x0 0x1000>;
> >>>>>> };
> >>>>>> scmi_xen: scmi {
> >>>>>>            compatible = "arm,scmi-smc";
> >>>>>>            arm,smc-id = <0x82000003>; <--- Xen management agent smc-id
> >>>>>>            #address-cells = < 1>;
> >>>>>>            #size-cells = < 0>;
> >>>>>>            #access-controller-cells = < 1>;
> >>>>>>            shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> >>>>>> };
> >>>>>>
> >>>>>> - The driver obtains Xen specific SCMI Agent's configuration from the
> >>>>>>      Host DT, probes Agents and builds SCMI Agents list. The Agents
> >>>>>>      configuration is taken from "scmi-secondary-agents" property where
> >>>>>>      first item is "arm,smc-id", second - "arm,scmi-shmem" phandle and
> >>>>>>      third is optional "agent_id":
> >>>>>>
> >>>>>> / {
> >>>>>>      chosen {
> >>>>>>        xen {
> >>>>>>          ranges;
> >>>>>>          xen_scmi_config {
> >>>>>>            compatible = "xen,sci";
> >>>>>>            #address-cells = <2>;
> >>>>>>            #size-cells = <2>;
> >>>>>>            ranges;
> >>>>>>
> >>>>>>            scmi_shm_0: sram@47ff0000 {
> >>>>>>              compatible = "arm,scmi-shmem";
> >>>>>>              reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>>>>>            };
> >>>>>>
> >>>>>>            /* Xen SCMI management channel */
> >>>>>>            scmi_shm_1: sram@47ff1000 {
> >>>>>>              compatible = "arm,scmi-shmem";
> >>>>>>              reg = <0x0 0x47ff1000 0x0 0x1000>;
> >>>>>>            };
> >>>>>>
> >>>>>>            scmi_shm_2: sram@47ff2000 {
> >>>>>>              compatible = "arm,scmi-shmem";
> >>>>>>              reg = <0x0 0x47ff2000 0x0 0x1000>;
> >>>>>>            };
> >>>>>>
> >>>>>>            scmi_shm_3: sram@47ff3000 {
> >>>>>>              compatible = "arm,scmi-shmem";
> >>>>>>              reg = <0x0 0x47ff3000 0x0 0x1000>;
> >>>>>>            };
> >>>>>>
> >>>>>>            scmi-secondary-agents = <
> >>>>>>              0x82000002 &scmi_shm_0 0
> >>>>> 0x82000002 is the same func_id as...
> >>>>>
> >>>>>
> >>>>>>              0x82000004 &scmi_shm_2 2
> >>>>>>              0x82000005 &scmi_shm_3 3>; <--- func_id, shmem, agent_id
> >>>>>>            #scmi-secondary-agents-cells = <3>;
> >>>>>>
> >>>>>>            scmi_xen: scmi {
> >>>>>>              compatible = "arm,scmi-smc";
> >>>>>>              arm,smc-id = <0x82000002>; <--- Xen management agent func_id
> >>>>> as the one used for Xen. This cannot be right?
> >>>>>
> >>>> That's right. Here should be 0x82000003.
> >>>>>>              #address-cells = <1>;
> >>>>>>              #size-cells = <0>;
> >>>>>>              #access-controller-cells = <1>;
> >>>>>>              shmem = <&scmi_shm_1>; <--- Xen management agent shmem
> >>>>>>            };
> >>>>>>          };
> >>>>>>        };
> >>>>>>      };
> >>>>>> };
> >>>>>>
> >>>>>> / {
> >>>>>>        /*
> >>>>>>         * Host SCMI OSPM channel - provided to the Dom0 as is if SCMI
> >>>>>>         * enabled for it, ignored by Xen multi-agent mediator
> >>>>>>         */
> >>>>>>        scmi_shm: sram@47ff0000 {
> >>>>>>                compatible = "arm,scmi-shmem";
> >>>>>>                reg = <0x0 0x47ff0000 0x0 0x1000>;
> >>>>>>        };
> >>>>> this is the same as &scmi_shm_0 which I guess is intended?
> >>>>>
> >>>> it is. to match Host DT.
> >>>>>>        firmware {
> >>>>>>          scmi: scmi {
> >>>>>>            compatible = "arm,scmi-smc";
> >>>>>>            arm,smc-id = <0x82000002>; <--- Host OSPM agent smc-id
> >>>>> but this again is the same smc-id meant to be used by Xen.
> >>>>>
> >>>>> If 0x82000002 is the privileged interface, then it is OK for Xen and
> >>>>> also baremetal Linux to use it, but Linux Dom0 should not be using it?
> >>>>> Or is the smc-id interchangeable and not necessarily tied to the
> >>>>> agent-id?
> >>>>>
> >>>>> I think either way this detail should be clarified in the docs. Speaking
> >>>>> of docs, the next patch introducing the doc is not up-to-date with this
> >>>>> patch.
> >>>>>
> >>>> In my current configuration, I have the following setup:
> >>>>
> >>>> The Xen privileged interface operates through func_id 0x82000003.
> >>>> func_id 0x82000002 is used for Domain-0, in order to keep the Device
> >>>> Tree (DT) consistent between Xen and bare-metal configurations.
> >>>> I am unsure how best to document this, since the implementation does
> >>>> not strictly require this specific configuration and allows flexibility
> >>>> for the
> >>>> end user. My intention is to provide an example configuration in the DT
> >>>> examples that is most likely to be used as a reference for real-world
> >>>> setups.
> >>> Yes, I am aligned with that
> >>>
> >>>
> >>>> At this stage, I believe the most appropriate approach is to include a note
> >>>> in the documentation stating that the examples illustrate a configuration
> >>>> that aligns well with the Xen architecture, but other configurations are
> >>>> possible depending on user requirements.
> >>> Yes. The important detail is to explain that the same configuration
> >>> works for both Linux baremetal and Linux Dom0. In the Linux Dom0 case,
> >>> the privileged SCMI connection differs from the one of Linux Dom0 and it
> >>> is the one used by Xen.
> >>>
> >>> Baremetal Linux: func_id 0x82000002, scmi-shmem 0x47ff0000
> >>> Dom0 Linux: func_id 0x82000002, scmi-shmem 0x47ff0000
> >>> Xen: func_id 0x82000003, scmi-shmem 0x47ff1000
> >>>
> >>> This works because, I am guessing, the privileged SCMI connection is not
> >>> tied to func_id 0x82000002, scmi-shmem 0x47ff0000.
> >>>
> >>> The problem occurs when there can be only one privileged SCMI connection
> >>> and it is tied to func_id 0x82000002, scmi-shmem 0x47ff0000 which is the
> >>> one described in the Host DT. In which case, Linux Dom0 ends up with the
> >>> privileged connection, not Xen.
> >>>
> >>> I think we should explain why this problem does not occur.
> >>>
> >>>
> >>>>>>            #address-cells = < 1>;
> >>>>>>            #size-cells = < 0>;
> >>>>>>            shmem = <&scmi_shm>; <--- Host OSPM agent shmem
> >>>>>>
> >>>>>>            protocol@X{
> >>>>>>            };
> >>>>>>          };
> >>>>>>       };
> >>>>>> };
> >>>>>>
> >>>>>> This approach allows defining multiple SCMI Agents by adding
> >>>>>> Xen-specific properties under the ``/chosen`` node to the Host Device
> >>>>>> Tree, leaving the main part unchanged. The Host DT SCMI channel will
> >>>>>> be passed to Dom0.
> >>>>>>
> >>>>>> The Xen management agent is described as a ``scmi_xen`` node under the
> >>>>>> ``xen,sci`` comaptible node, which is used by Xen to control other
> >>>>>> SCMI Agents in the system.
> >>>>>>
> >>>>>> All secondary agents' configurations are provided in the
> >>>>>> ``scmi-secondary-agents`` property with an optional ``agent_id`` field.
> >>>>>>
> >>>>>> The ``agent_id`` from the ``scmi-secondary-agents`` property is used
> >>>>>> to identify the agent in the system and can be omitted by setting
> >>>>>> ``#scmi-secondary-agents-cells = <2>``, so the Secondary Agents
> >>>>>> configuration will look like this:
> >>>>>>
> >>>>>> / {
> >>>>>>      chosen {
> >>>>>>        xen {
> >>>>>>          xen_scmi_config {
> >>>>>>            compatible = "xen,sci";
> >>>>>>            #address-cells = <2>;
> >>>>>>            #size-cells = <2>;
> >>>>>>            ranges;
> >>>>>>
> >>>>>>            /* Shared memory nodes as defined earlier */
> >>>>>>
> >>>>>>            scmi-secondary-agents = <
> >>>>>>              0x82000003 &scmi_shm_0
> >>>>>>              0x82000004 &scmi_shm_2
> >>>>>>              0x82000005 &scmi_shm_3
> >>>>>>              0x82000006 &scmi_shm_4>;
> >>>>>>            #scmi-secondary-agents-cells = <2>;
> >>>>>>          };
> >>>>>>        };
> >>>>>>      };
> >>>>>> }
> >>>>>>
> >>>>>> In this case, Xen will use the ``SCMI_BASE_DISCOVER_AGENT`` call to
> >>>>>> discover the ``agent_id`` for each secondary agent. Providing the
> >>>>>> ``agent_id`` in the ``scmi-secondary-agents`` property allows skipping
> >>>>>> the discovery call, which is useful when the secondary agent's shared
> >>>>>> memory is not accessible by Xen or when boot time is important because
> >>>>>> it allows skipping the agent discovery procedure.
> >>>>>>
> >>>>>>      Note that Xen is the only one entry in the system which need to know
> >>>>>>      about SCMI multi-agent support.
> >>>>>>
> >>>>>> - It implements the SCI subsystem interface required for configuring and
> >>>>>> enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
> >>>>>> SCMI functionality for domain it has to be configured with unique supported
> >>>>>> SCMI Agent_id and use corresponding SCMI SMC shared memory transport
> >>>>>> [smc-id, shmem] defined for this SCMI Agent_id.
> >>>>>> - Once Xen domain is configured it can communicate with EL3 SCMI FW:
> >>>>>>      -- zero-copy, the guest domain puts SCMI message in shmem;
> >>>>>>      -- the guest triggers SMC exception with smc-id (doorbell);
> >>>>>>      -- the Xen driver catches exception, do checks and synchronously forwards
> >>>>>>      it to EL3 FW.
> >>>>>> - the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
> >>>>>>      management agent channel on domain destroy event. This allows to reset
> >>>>>>      resources used by domain and so implement use-case like domain reboot.
> >>>>>>
> >>>>>> Dom0 Enable SCMI SMC:
> >>>>>>     - pass dom0_scmi_agent_id=<agent_id> in Xen command line. if not provided
> >>>>>>       SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
> >>>>>>       The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
> >>>>>>       node according to assigned agent_id.
> >>>>> Given that everything else, the entire configuration, is based on device
> >>>>> tree, I think it makes sense to also configure this via device tree
> >>>>> instead of a command line.
> >>>>>
> >>>>> This could be another parameter under xen_scmi_config. What do you
> >>>>> think?
> >>>>>
> >>>> The ``dom0_scmi_agent_id`` parameter was introduced to keep the Dom0
> >>>> configuration separate from the xen_scmi_config node, which is intended
> >>>> specifically for Xen SCMI configuration. In my opinion, adding Dom0-specific
> >>>> configuration to xen_scmi_config would mix the purposes of the node and
> >>>> reduce clarity.
> >>>>
> >>>> Additionally, the ``dom0_scmi_agent_id`` parameter is similar to the
> >>>> ``agent_id`` parameter used for arm_sci in xl.cfg. This approach ensures
> >>>> that
> >>>> the Dom0 configuration is as consistent as possible with the
> >>>> configuration for
> >>>> other domains.
> >>>>
> >>>> Overall, I believe this makes the configuration less confusing, as it allows
> >>>> us to set similar parameters for both Dom0 and other domains in a clear
> >>>> and organized manner.
> >>> We are heading in a direction where Dom0 has its own separate domain
> >>> node similarly to other Dom0less domains. Many of these changes have
> >>> already been committed as part of Hardware Domain / Control Domain
> >>> separation work by Jason.
> >>>
> >>> In a world where Dom0, like other DomUs, has its own configuration node
> >>> and also Dom0 can be split between Hardware Domain and Control Domain,
> >>> it doesn't make sense to use Dom0 command line options anymore. It is
> >>> already possible to assign Dom0 "powers" to a dom0less domain for
> >>> example.
> >>>
> >>> I can see it is worth discussing command line options for dom0 in
> >>> situations where Device Tree might not be present (datacenter
> >>> configuration on ACPI system) but in this case where Device Tree changes
> >>> are required, I think it doesn't make sense to add Dom0 command line
> >>> options as they are less flexible and a duplicate of other options we
> >>> must have anyway.
> >> That makes sense to me. Since we are moving to the Dom0 Device Tree
> >> configuration,
> >> I can move ``dom0_scmi_agent_id`` inside the ``xen,sci`` node and rename
> >> it as the
> >> ``agent_id`` property.
> >>
> >> Would you recommend dropping the ``dom0_scmi_agent_id`` command line
> >> parameter
> >> entirely, or should I keep it as a backup option?
> > I would drop the command line parameter entirely
> I would like to add one more observation from my
> implementation experience:
> 
> The main difference between Dom0 and dom0less configurations is that,
> for dom0less, we have a separate node for each domain, for example:
> 
> Dom0less configuration:
> 
>    xen,domain@1 {
>        compatible = "xen,domain";
>        xen,sci_type = "scmi_smc_multiagent";
>        xen,sci-agent-id = <2>;
>        /* other domain properties here */
>      };
> 
> However, for Dom0, we only have the following node:
> 
>    chosen {
>      xen {
>        ranges;
>        xen_scmi_config {
>          compatible = "xen,sci";
>          ....
>        };
>     };
> };
> 
> which describes the SCI configuration for Xen.
> 
> Therefore, I believe that using the property name
> ``agent_id``` could be confusing in this context.
> I suggest naming it xen,dom0-sci-agent-id instead.
> 
> The device tree would then look like this:
>    chosen {
>      xen {
>        ranges;
>        xen_scmi_config {
>          compatible = "xen,sci";
>          ....
>          xen,dom0-sci-agent-id = <0>;  /* Dom0 agent ID */ <-----
>        };
>     };
> };
> 
> Does this approach look good to you?

Yes, it look OK.

It is already possible to create a dom0less device tree node for Dom0,
simply by using capabilities. However, the older device tree bindings
where dom0 doesn't have a node is also still supported and for that it
makes sense to introduce xen,dom0-sci-agent-id.

--8323329-646006288-1768937429=:7192--

