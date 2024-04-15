Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDC8A5D35
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 23:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706494.1103649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUDA-0004vR-MT; Mon, 15 Apr 2024 21:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706494.1103649; Mon, 15 Apr 2024 21:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwUDA-0004tp-Jl; Mon, 15 Apr 2024 21:50:00 +0000
Received: by outflank-mailman (input) for mailman id 706494;
 Mon, 15 Apr 2024 21:49:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNdO=LU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwUD9-0004tj-LM
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 21:49:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18f2b8e5-fb72-11ee-b909-491648fe20b8;
 Mon, 15 Apr 2024 23:49:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2AD8B60EC4;
 Mon, 15 Apr 2024 21:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2536FC32786;
 Mon, 15 Apr 2024 21:49:54 +0000 (UTC)
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
X-Inumbo-ID: 18f2b8e5-fb72-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713217794;
	bh=6RApfppfKQF0eOtxHZpl5wjOTkYOk1mCAKY4W3JHWw8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aBl8fWl1QU/vDv+O4MVGg4ecnZJoyRBqHXuNg45U2Pn3iWXD5u7dNadgEgLjSKHVm
	 ehMUVV96zD6SZGHwmGqA8zps/Wfqi+hl+R6fORZdJYrHs14aGI5LAGo8IXlx4Azk6Q
	 s5/T5AH/PMYKkSCH3JamqRPJ9Y2gYHwFf1JkuGUUSEMbfvEe1n9MRk0nfZO/7ZBCFf
	 t/D+4uswawUkDO44aL3JPOxGYiVAac8okmd+BwuEKUwNxTFhMk7Z26yHsUZYz0UPol
	 5f/Cw9RSw5LmK/d4mhDL/ftmmVpJvzUSws0uLXxHdcEUgj8DoXfC0apUD8rNVUlf5d
	 r3NJlxpP37dgQ==
Date: Mon, 15 Apr 2024 14:49:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/4] xen/xlat: Sort out whitespace
In-Reply-To: <20240415154155.2718064-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404151449240.997881@ubuntu-linux-20-04-desktop>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com> <20240415154155.2718064-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Apr 2024, Andrew Cooper wrote:
>  * Fix tabs/spaces mismatch for certain rows
>  * Insert lines between header files to improve legibility
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> ---
>  xen/include/xlat.lst | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
> index 9c41948514bf..e811342bb096 100644
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -20,19 +20,24 @@
>  # First column indicator:
>  # ! - needs translation
>  # ? - needs checking
> +
>  ?	dom0_vga_console_info		xen.h
>  ?	xenctl_bitmap			xen.h
>  ?	mmu_update			xen.h
>  !	mmuext_op			xen.h
>  !	start_info			xen.h
>  ?	vcpu_time_info			xen.h
> +
>  ?	pmu_amd_ctxt			arch-x86/pmu.h
>  ?	pmu_arch			arch-x86/pmu.h
>  ?	pmu_cntr_pair			arch-x86/pmu.h
>  ?	pmu_intel_ctxt			arch-x86/pmu.h
>  ?	pmu_regs			arch-x86/pmu.h
> +
>  !	cpu_user_regs			arch-x86/xen-@arch@.h
> +
>  !	trap_info			arch-x86/xen.h
> +
>  ?	cpu_offline_action		arch-x86/xen-mca.h
>  ?	mc				arch-x86/xen-mca.h
>  ?	mcinfo_bank			arch-x86/xen-mca.h
> @@ -50,6 +55,7 @@
>  ?	mc_notifydomain			arch-x86/xen-mca.h
>  !	mc_physcpuinfo			arch-x86/xen-mca.h
>  ?	page_offline_action		arch-x86/xen-mca.h
> +
>  ?	argo_addr			argo.h
>  !	argo_iov			argo.h
>  ?	argo_register_ring		argo.h
> @@ -59,6 +65,7 @@
>  ?	argo_ring_message_header	argo.h
>  ?	argo_send_addr			argo.h
>  ?	argo_unregister_ring		argo.h
> +
>  ?	evtchn_alloc_unbound		event_channel.h
>  ?	evtchn_bind_interdomain		event_channel.h
>  ?	evtchn_bind_ipi			event_channel.h
> @@ -74,6 +81,7 @@
>  ?	evtchn_set_priority		event_channel.h
>  ?	evtchn_status			event_channel.h
>  ?	evtchn_unmask			event_channel.h
> +
>  ?	gnttab_cache_flush		grant_table.h
>  !	gnttab_copy			grant_table.h
>  ?	gnttab_dump_table		grant_table.h
> @@ -86,9 +94,10 @@
>  ?	gnttab_get_version		grant_table.h
>  !	gnttab_get_status_frames	grant_table.h
>  ?	grant_entry_v1			grant_table.h
> -?       grant_entry_header              grant_table.h
> +?	grant_entry_header		grant_table.h
>  ?	grant_entry_v2			grant_table.h
>  ?	gnttab_swap_grant_ref		grant_table.h
> +
>  !	dm_op_buf			hvm/dm_op.h
>  ?	dm_op_create_ioreq_server	hvm/dm_op.h
>  ?	dm_op_destroy_ioreq_server	hvm/dm_op.h
> @@ -108,15 +117,20 @@
>  ?	dm_op_set_pci_intx_level	hvm/dm_op.h
>  ?	dm_op_set_pci_link_route	hvm/dm_op.h
>  ?	dm_op_track_dirty_vram		hvm/dm_op.h
> +
>  !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
> +
>  ?	vcpu_hvm_context		hvm/hvm_vcpu.h
>  ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
>  ?	vcpu_hvm_x86_64			hvm/hvm_vcpu.h
> +
>  ?	hypfs_direntry			hypfs.h
>  ?	hypfs_dirlistentry		hypfs.h
> +
>  ?	kexec_exec			kexec.h
>  !	kexec_image			kexec.h
>  !	kexec_range			kexec.h
> +
>  !	add_to_physmap			memory.h
>  !	add_to_physmap_batch		memory.h
>  !	foreign_memory_map		memory.h
> @@ -130,6 +144,7 @@
>  !	reserved_device_memory_map	memory.h
>  ?	vmemrange			memory.h
>  !	vnuma_topology_info		memory.h
> +
>  ?	physdev_eoi			physdev.h
>  ?	physdev_get_free_pirq		physdev.h
>  ?	physdev_irq			physdev.h
> @@ -143,6 +158,7 @@
>  ?	physdev_restore_msi		physdev.h
>  ?	physdev_set_iopl		physdev.h
>  ?	physdev_setup_gsi		physdev.h
> +
>  !	pct_register			platform.h
>  !	power_register			platform.h
>  ?	processor_csd			platform.h
> @@ -158,23 +174,30 @@
>  ?	xenpf_pcpu_version		platform.h
>  ?	xenpf_resource_entry		platform.h
>  ?	xenpf_ucode_revision		platform.h
> +
>  ?	pmu_data			pmu.h
>  ?	pmu_params			pmu.h
> +
>  !	sched_poll			sched.h
>  ?	sched_pin_override		sched.h
>  ?	sched_remote_shutdown		sched.h
>  ?	sched_shutdown			sched.h
> +
>  ?	t_buf				trace.h
> +
>  ?	vcpu_get_physid			vcpu.h
>  ?	vcpu_register_vcpu_info		vcpu.h
>  !	vcpu_runstate_info		vcpu.h
>  ?	vcpu_set_periodic_timer		vcpu.h
>  !	vcpu_set_singleshot_timer	vcpu.h
> -?	build_id                        version.h
> -?	compile_info                    version.h
> -?	feature_info                    version.h
> +
> +?	build_id			version.h

This is misaligned after this patch. You might want to fix this on
commit.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +?	compile_info			version.h
> +?	feature_info			version.h
> +
>  ?	xenoprof_init			xenoprof.h
>  ?	xenoprof_passive		xenoprof.h
> +
>  ?	flask_access			xsm/flask_op.h
>  ?	flask_cache_stats		xsm/flask_op.h
>  ?	flask_hash_stats		xsm/flask_op.h
> 
> base-commit: c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429
> -- 
> 2.30.2
> 

