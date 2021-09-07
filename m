Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30C402AB5
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181122.328136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbzd-00075D-Ly; Tue, 07 Sep 2021 14:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181122.328136; Tue, 07 Sep 2021 14:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbzd-00072G-Ix; Tue, 07 Sep 2021 14:22:33 +0000
Received: by outflank-mailman (input) for mailman id 181122;
 Tue, 07 Sep 2021 14:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZpi=N5=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNbzb-000720-I5
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:22:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3002f295-b139-440b-a5a1-88b580df7c90;
 Tue, 07 Sep 2021 14:22:30 +0000 (UTC)
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
X-Inumbo-ID: 3002f295-b139-440b-a5a1-88b580df7c90
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631024550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JdChk7sqL2oApxqAlGiteoD3KNkhWtQhRpFCQ+N8VY=;
  b=H+mQnH5zu+/L9vKU+6lfbId3r2y53eivyzp6AbYJKTWgr8Ussxld8ED4
   6eCCW2BBB5xNXbz/Fcy4FnG2YS6I5a0ZBJECpAV93mXy0M0PbFjPX9JRC
   FPwcsWv6soKPWoe4jmOQc0wXQUWMYYFFOYuLt7Z8L3Yb11FPpaszRRik3
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LA5RXG2VTDD8kaiTVULn1g4JGu2Bryc+aJ6sVvCuW0cZfV2HVkIJMXEF2ovF84au77QyqyCTXi
 2w+8JQoFDrYi+if5XpC3Ir3oTRiUNC0u/GRVm4vyE2aaMWJApUSbiEVgAxPRMWQzWmF4QcIEMi
 Heh1Hv8Ivfq0eifXuVngLVTxGrOc10YYy6V8kPem6zJxnVYeuLVQF/zlvZ3vJ1jRoRNoNZ8JV2
 Lq6vKpA2ZAfgESnfdZrR8eMfV6dWfWGmH/X+Ncc1fmByG7dCxMibFJIUDvGgxkhoHkr4rqE3Kj
 Dn58NISckNv3LcyM//YrhEfv
X-SBRS: 5.1
X-MesageID: 52563678
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hhJAtKxiDUUl0/HmY+nLKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="52563678"
Date: Tue, 7 Sep 2021 15:22:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [XEN PATCH v7 04/51] build: factorise generation of the linker
 scripts
Message-ID: <YTd1oV8kzz0MJ3L7@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-5-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210824105038.1257926-5-anthony.perard@citrix.com>

(dropping most CC)

On Tue, Aug 24, 2021 at 11:49:51AM +0100, Anthony PERARD wrote:
> In Arm and X86 makefile, generating the linker script is the same, so
> we can simply have both call the same macro.
> 
> We need to add *.lds files into extra-y so that Rules.mk can find the
> .*.cmd dependency file and load it.
> 
> Change made to the command line:
> - Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
> - Added -D__LINKER__ even it is only used by Arm's lds.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hi Julian,

Could you give a Ack to this patch? I think it only misses an ack from
Arm maintainers.

And if you don't mind, could you commit it with the two other arm patch
that are ready?

  - build,arm: move LDFLAGS change to arch.mk
    ( you proposed to edit the commit message before committing )
  - build: avoid building arm/arm/*/head.o twice

Cheers,

> ---
>  xen/Rules.mk          | 4 ++++
>  xen/arch/arm/Makefile | 6 ++++--
>  xen/arch/x86/Makefile | 6 ++++--
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index eaf770414305..3f61682ceab7 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -255,6 +255,10 @@ cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
>  %.s: %.S FORCE
>  	$(call if_changed,cpp_s_S)
>  
> +# Linker scripts, .lds.S -> .lds
> +quiet_cmd_cpp_lds_S = LDS     $@
> +cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
> +
>  # Add intermediate targets:
>  # When building objects with specific suffix patterns, add intermediate
>  # targets that the final targets are derived from.
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b440..0edd9dee6f49 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -66,6 +66,8 @@ obj-y += vpsci.o
>  obj-y += vuart.o
>  extra-y += $(TARGET_SUBARCH)/head.o
>  
> +extra-y += xen.lds
> +
>  #obj-bin-y += ....o
>  
>  ifneq ($(CONFIG_DTB_FILE),"")
> @@ -133,8 +135,8 @@ $(TARGET)-syms: prelink.o xen.lds
>  .PHONY: include
>  include:
>  
> -xen.lds: xen.lds.S
> -	$(CPP) -P $(a_flags) -D__LINKER__ -MQ $@ -o $@ $<
> +xen.lds: xen.lds.S FORCE
> +	$(call if_changed,cpp_lds_S)
>  
>  dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>  

-- 
Anthony PERARD

