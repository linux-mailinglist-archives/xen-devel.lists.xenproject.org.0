Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D410937AA0C
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 16:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125774.236739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgTqf-0002py-Vt; Tue, 11 May 2021 14:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125774.236739; Tue, 11 May 2021 14:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgTqf-0002mU-Sv; Tue, 11 May 2021 14:59:01 +0000
Received: by outflank-mailman (input) for mailman id 125774;
 Tue, 11 May 2021 14:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgTqd-0002mO-M8
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 14:58:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e2ad1fb-5db9-4390-a90e-2d9f69239b0c;
 Tue, 11 May 2021 14:58:58 +0000 (UTC)
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
X-Inumbo-ID: 1e2ad1fb-5db9-4390-a90e-2d9f69239b0c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620745138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7lkkXU0a3GZrcNgZ/uu5jEOrp6kp8vqX57+wxJFGPME=;
  b=ACfC0JZoMNM/XCXrI5UJ+9uEaXobJFvPcTYuqii8noafqTyONHaOtVaO
   4zA1bbf8GPc09A1mYwL7Z7rOxVkjYvxUQPTg9WIDgY4KZPEcwjYThmOIt
   z6LC4/Iyp6HYGHlhAak/j4tUXxFli7qM0gVr/FpDbX56C87OdCGkLoXG4
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yjN3speGgGhHmE6x3mNoRBzKCJuVBWWgRhEmEBfNgdMjYdrmYr+mmjPe8870KyDN4q1keMFjy0
 mQPytvfjCJCKKAY/nRbLOdQJN74RqmbPdqBUiZMK7ivxDu8DiCFUEYoe+jLeSz9YND4kWqxggo
 3QvWF4K+uTmNcKzlWnz0t3HKA9MhxiVWYdK422FumHo9X4f+TwZl3c6P2OM6D2z3LFdWMCSCfp
 egkF61aNgKQIXQUcw1tnTCjr7peB1SD0wQ3aTxUZUQOtNh1Sef5qquMWtKQc4v6aWbDMSpS0SI
 zfQ=
X-SBRS: 5.1
X-MesageID: 45076739
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fq4U7altiTet/eAGhrxlP6ZM+ZTpDfIr3DAbv31ZSRFFG/GwvM
 ql9c5rsSMc6Qx8ZJhEo7u90ca7Lk80maQa3WByB9eftXjd2VdARbsKheGO/9SKIVycygcy79
 YET4FOTPH2EFhmnYLbzWCDYrEdKQC8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="45076739"
Date: Tue, 11 May 2021 15:58:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 05/14] tools/libs: guest: Use const whenever we point to
 literal strings
Message-ID: <YJqbrs482KY23QQE@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-6-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-6-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:04PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> literal strings are not meant to be modified. So we should use const
> *char rather than char * when we want to store a pointer to them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
> index 2953aeb90b35..e379b07f9945 100644
> --- a/tools/libs/guest/xg_dom_x86.c
> +++ b/tools/libs/guest/xg_dom_x86.c
> @@ -1148,11 +1148,12 @@ static int vcpu_hvm(struct xc_dom_image *dom)
>  
>  /* ------------------------------------------------------------------------ */
>  
> -static int x86_compat(xc_interface *xch, uint32_t domid, char *guest_type)
> +static int x86_compat(xc_interface *xch, uint32_t domid,
> +                      const char *guest_type)
>  {
>      static const struct {
> -        char           *guest;
> -        uint32_t        size;
> +        const char      *guest;
> +        uint32_t       size;

It seems that one space have been removed by mistake just before "size".

The rest looks good:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

