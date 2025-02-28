Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708CA49DE8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 16:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898905.1307362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Zw-0004E3-G0; Fri, 28 Feb 2025 15:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898905.1307362; Fri, 28 Feb 2025 15:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Zw-0004Bx-CP; Fri, 28 Feb 2025 15:47:08 +0000
Received: by outflank-mailman (input) for mailman id 898905;
 Fri, 28 Feb 2025 15:47:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1to2Zv-00046l-IQ
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 15:47:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to2Zp-00AMHm-1O;
 Fri, 28 Feb 2025 15:47:01 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1to2Zo-00FN1V-2C;
 Fri, 28 Feb 2025 15:47:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=wYrYPIeLMpXibk0d35LLmBJZ9i6aCN3miwYcK3/IlPk=; b=dV4NVDp+BT30jXxAqv8PE12Hw3
	4q30SXCAvJlWfLG5FwqTPZD+ut0UBkuBbi0qq9zgca+jNk4ME9NiMYfyvyUBid4wsDJ5BrtVszYny
	cqr8t77TP9CFQBC5jCs1l5gHFwumXqziRW/NU7d+U2hYG2diiZuYr0LlUE+rXr1//zLA=;
Date: Fri, 28 Feb 2025 16:46:57 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 5/8] hw/xen/xen-hvm: Reduce included headers
Message-ID: <Z8HacRL-K00TB1ye@l14>
References: <20250218162618.46167-1-philmd@linaro.org>
 <20250218162618.46167-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218162618.46167-6-philmd@linaro.org>

On Tue, Feb 18, 2025 at 05:26:15PM +0100, Philippe Mathieu-Daudé wrote:
> Have "hw/xen/xen-hvm-common.h" include the bare minimal set
> of headers. Adapt sources to avoid errors when refactoring
> unrelated headers such:
> 
>   include/hw/xen/xen-hvm-common.h:71:5: error: unknown type name ‘xenevtchn_handle’
>      71 |     xenevtchn_handle *xce_handle;
>         |     ^~~~~~~~~~~~~~~~
>   hw/xen/xen-hvm-common.c: In function ‘cpu_get_ioreq’:
>   hw/xen/xen-hvm-common.c:227:13: error: implicit declaration of function ‘hw_error’
>     227 |             hw_error("Fatal error while trying to get io event!\n");
>         |             ^~~~~~~~
>         |             herror
>   hw/xen/xen-hvm-common.c: In function ‘handle_ioreq’:
>   hw/xen/xen-hvm-common.c:446:34: error: ‘target_ulong’ undeclared (first use in this function)
>     446 |             (req->size < sizeof (target_ulong))) {
>         |                                  ^~~~~~~~~~~~
>   hw/i386/xen/xen-hvm.c: In function ‘xen_add_to_physmap’:
>   hw/i386/xen/xen-hvm.c:298:22: error: implicit declaration of function ‘xen_replace_cache_entry’
>     298 |         uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
>         |                      ^~~~~~~~~~~~~~~~~~~~~~~
>   hw/i386/xen/xen-hvm.c: In function ‘xen_log_global_start’:
>   hw/i386/xen/xen-hvm.c:465:9: error: implicit declaration of function ‘xen_enabled’
>     465 |     if (xen_enabled()) {
>         |         ^~~~~~~~~~~
>   hw/i386/xen/xen-hvm.c: In function ‘regs_to_cpu’:
>   hw/i386/xen/xen-hvm.c:487:5: error: unknown type name ‘X86CPU’
>     487 |     X86CPU *cpu;
>         |     ^~~~~~
>   hw/i386/xen/xen-hvm.c:492:15: error: ‘R_EAX’ undeclared (first use in this function)
>     492 |     env->regs[R_EAX] = req->data;
>         |               ^~~~~
>         |               REG_RAX
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

