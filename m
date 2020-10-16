Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822BB2901E3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 11:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7853.20693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTM69-0006Eq-Uc; Fri, 16 Oct 2020 09:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7853.20693; Fri, 16 Oct 2020 09:32:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTM69-0006ER-RJ; Fri, 16 Oct 2020 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 7853;
 Fri, 16 Oct 2020 09:32:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTM68-0006EM-CT
 for xen-devel@lists.xen.org; Fri, 16 Oct 2020 09:32:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5f72749-a7be-438b-8077-20b35450b082;
 Fri, 16 Oct 2020 09:32:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32C3BAD82;
 Fri, 16 Oct 2020 09:32:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTM68-0006EM-CT
	for xen-devel@lists.xen.org; Fri, 16 Oct 2020 09:32:28 +0000
X-Inumbo-ID: f5f72749-a7be-438b-8077-20b35450b082
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f5f72749-a7be-438b-8077-20b35450b082;
	Fri, 16 Oct 2020 09:32:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602840746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYDPGZrXdyi46y7fj9XtittCt4pGBBzOezx1Qmnham4=;
	b=GYq8SQwC0brftuO1X2jjp6UT1ZNhZ8PGhPWINDzUJ4aPqRMgqA+cd6YVsUXAtTw/D/Q3Ya
	fc9uYcmzBvBoAn7yvEj8PXHlnURHUg+mGPUjwdDb5Im8vz55zYPJzom+nJ6N4HAD3QLHN3
	mdQbTRVa7Z9fGaYvdOU3yjivwRYASog=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 32C3BAD82;
	Fri, 16 Oct 2020 09:32:26 +0000 (UTC)
Subject: Re: [Xen-devel] [XEN PATCH v14 8/8] Add xentrace to vmware_port
To: Don Slutz <don.slutz@gmail.com>
Cc: xen-devel@lists.xen.org,
 Aravind Gopalakrishnan <Aravind.Gopalakrishnan@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Eddie Dong <eddie.dong@intel.com>, Ian Campbell <ian.campbell@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Keir Fraser <keir@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Don Slutz <dslutz@verizon.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <1bfc92ee47f425235821c3655564a5a4b3d34593.1597854908.git.don.slutz@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ad14acd-eff3-ea34-93f3-cdc195a3b9bb@suse.com>
Date: Fri, 16 Oct 2020 11:32:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1bfc92ee47f425235821c3655564a5a4b3d34593.1597854908.git.don.slutz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.08.2020 18:52, Don Slutz wrote:
> From: Don Slutz <dslutz@verizon.com>
> 
> Also added missing TRAP_DEBUG & VLAPIC.
> 
> Signed-off-by: Don Slutz <dslutz@verizon.com>
> CC: Don Slutz <don.slutz@gmail.com>
> ---
> Acked-by: Ian Campbell <ian.campbell@citrix.com>
> 
> v14:
>   Reworked to current code.
>   Added VMPORT_SEND because I wanted to see it during testing.
> 
> v13:
>     Please do this by extending the existing infrastructure rather
>     than special-casing 7 on the side.  (i.e. extend ND to take 7
>     parameters, and introduce HVMTRACE_7D)
>     = { d1, d2, d3, d4, d5, d6, d7 } will be far shorter, linewise.

I think this would have wanted to split into two patches right
at the time: One for the extension, and another for the new
VMware logic. But see below.

> @@ -62,6 +63,7 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
>      if ( port == BDOOR_PORT && regs->eax == BDOOR_MAGIC )
>      {
>          uint32_t new_eax = ~0u;
> +        uint16_t cmd = regs->ecx;
>          uint64_t value;
>          struct vcpu *curr = current;
>          struct domain *currd = curr->domain;
> @@ -72,7 +74,7 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
>           * leaving the high 32-bits unchanged, unlike what one would
>           * expect to happen.
>           */
> -        switch ( regs->ecx & 0xffff )
> +        switch ( cmd )
>          {
>          case BDOOR_CMD_GETMHZ:
>              new_eax = currd->arch.tsc_khz / 1000;
> @@ -147,14 +149,22 @@ static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
>              break;
>  
>          default:
> +            HVMTRACE_6D(VMPORT_SEND, cmd, regs->ebx, regs->ecx,
> +                        regs->edx, regs->esi, regs->edi);

With cmd derived from regs->ecx, why pass the same value twice here?

>              /* Let backing DM handle */
>              return X86EMUL_UNHANDLEABLE;
>          }
> +        HVMTRACE_7D(VMPORT_HANDLED, cmd, new_eax, regs->ebx, regs->ecx,
> +                    regs->edx, regs->esi, regs->edi);

None of the cases making it here consumes or alter regs->edi. Why
record / report its value? Without this, the entire widening to 7
parameters becomes unnecessary for now, afaics.

Jan

