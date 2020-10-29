Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F37829EDAB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 14:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14189.35225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY8ND-0006gc-5B; Thu, 29 Oct 2020 13:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14189.35225; Thu, 29 Oct 2020 13:53:51 +0000
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
	id 1kY8ND-0006gD-1U; Thu, 29 Oct 2020 13:53:51 +0000
Received: by outflank-mailman (input) for mailman id 14189;
 Thu, 29 Oct 2020 13:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY8NB-0006fU-J3
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:53:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8941dbe-b15e-406d-abae-65774beb4612;
 Thu, 29 Oct 2020 13:53:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 962FDAFB1;
 Thu, 29 Oct 2020 13:53:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY8NB-0006fU-J3
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 13:53:49 +0000
X-Inumbo-ID: c8941dbe-b15e-406d-abae-65774beb4612
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c8941dbe-b15e-406d-abae-65774beb4612;
	Thu, 29 Oct 2020 13:53:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603979627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcmxnvRUtgd5pwtZDJYRsRYYJtUit4eLtWDDXvSIsZA=;
	b=TyGlzbCkfrF50ZvWzg7t9ja1xNxsHc92k1r9iD/dDoAeBYlmV054eEvVjnpLSs2Dx+RHV3
	HsPqYAayMtG2EpBnDEIfMwVncrlWTM8iduIJnGBM0xDtA+yv7qzbi4AHiO70SpJ9JRhCop
	iUZb6ZBXTFvbTOhsDFu5op0IEeEQKvU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 962FDAFB1;
	Thu, 29 Oct 2020 13:53:47 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_make_post-migration_p?=
 =?UTF-8?Q?age_state_consistent?=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
Message-ID: <d1e9190e-a3be-8500-41f7-406af18458fc@suse.com>
Date: Thu, 29 Oct 2020 14:53:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f7ed53c1-768c-cc71-a432-553b56f7f0a7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.09.2020 12:34, Jan Beulich wrote:
> When a page table page gets de-validated, its type reference count drops
> to zero (and PGT_validated gets cleared), but its type remains intact.
> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
> such pages. An intermediate write to such a page via e.g.
> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
> return. In libxc the decision which pages to normalize / localize
> depends solely on the type returned from the domctl. As a result without
> further precautions the guest won't be able to tell whether such a page
> has had its (apparent) PTE entries transitioned to the new MFNs.
> 
> Add a check of PGT_validated, thus consistently avoiding normalization /
> localization in the tool stack.
> 
> Alongside using XEN_DOMCTL_PFINFO_NOTAB instead of plain zero for the
> change at hand, also change the variable's initializer to use this
> constant, too. Take the opportunity and also adjust its type.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think I did address all questions here.

Jan

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -215,7 +215,8 @@ long arch_do_domctl(
>  
>          for ( i = 0; i < num; ++i )
>          {
> -            unsigned long gfn = 0, type = 0;
> +            unsigned long gfn = 0;
> +            unsigned int type = XEN_DOMCTL_PFINFO_NOTAB;
>              struct page_info *page;
>              p2m_type_t t;
>  
> @@ -255,6 +256,8 @@ long arch_do_domctl(
>  
>                  if ( page->u.inuse.type_info & PGT_pinned )
>                      type |= XEN_DOMCTL_PFINFO_LPINTAB;
> +                else if ( !(page->u.inuse.type_info & PGT_validated) )
> +                    type = XEN_DOMCTL_PFINFO_NOTAB;
>  
>                  if ( page->count_info & PGC_broken )
>                      type = XEN_DOMCTL_PFINFO_BROKEN;
> 


