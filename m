Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09037AA7F
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 17:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125785.236762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUA0-0005xo-Vn; Tue, 11 May 2021 15:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125785.236762; Tue, 11 May 2021 15:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgUA0-0005up-Sn; Tue, 11 May 2021 15:19:00 +0000
Received: by outflank-mailman (input) for mailman id 125785;
 Tue, 11 May 2021 15:18:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgU9z-0005uj-NT
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 15:18:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 010bd790-90e9-4f7b-93d1-6ecf39dd8287;
 Tue, 11 May 2021 15:18:58 +0000 (UTC)
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
X-Inumbo-ID: 010bd790-90e9-4f7b-93d1-6ecf39dd8287
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620746338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jze14czM65N3ND9Hzys2dewBaD36ReStQXcZaSi3C0w=;
  b=MCmBw3eXbwpvoMGbV1xIrO5hTh4PaGJBn5w9PtbWSUOzzdD804+XAnOp
   J6uaaFysPw9yT8J04BSjPXKck/QKcgpV1p1rb5ozX2+A+IOuxukvAGlLo
   wpZNBTFnnVtBdAq5YWKwePQrf/Ki1KgmRVM0v7pMUGDua0Uxsa3vUQWHP
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: S2mVILq5LMBUghPiJ8hIufZTUZkpE2kBGKqhBCdC45bvBgXGCsenxB7CLNhu8PhJgg6UR5m3fj
 5UzMFmG68p4JXtzY364+g84f65UeW3VBszPImKXV0uyZbImbgLj8344JfsKoRm538ywycJ010S
 wtsa4nJCjXfcmEfHbiqbfNjEIWkZ8IagWx3nySYRJLk3DufSBIniK5TMdTM5PpHwcQmctwWgu6
 +0u+IIWw8/sLSiq8hPUuC5h6RXUBoU096Fly351wmqXMJx9wPvzbYo0HqXwDXcGAUzSYbsUiPy
 gys=
X-SBRS: 5.1
X-MesageID: 43935543
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kq9hF6ryfWJjgxxiF5W9TNkaV5oheYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx8ZJhNo7+90cq7MBDhHPxOgLX5VI3KNGOKhILBFvAH0WKI+V3d8kPFmNK0is
 xbGJSWoueAamRHsQ==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43935543"
Date: Tue, 11 May 2021 16:18:55 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 09/14] tools/console: Use const whenever we point to
 literal strings
Message-ID: <YJqgXz1s8N3T4+Fo@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-10-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-10-julien@xen.org>

On Mon, Apr 05, 2021 at 04:57:08PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
> index 4af27ffc5d02..6a8a94e31b65 100644
> --- a/tools/console/daemon/io.c
> +++ b/tools/console/daemon/io.c
> @@ -109,9 +109,9 @@ struct console {
>  };
>  
>  struct console_type {
> -	char *xsname;
> -	char *ttyname;
> -	char *log_suffix;
> +	const char *xsname;

I think that const of `xsname` is lost in console_init() in the same
file.
We have:

    static int console_init(.. )
    {
        struct console_type **con_type = (struct console_type **)data;
        char *xsname, *xspath;
        xsname = (char *)(*con_type)->xsname;
    }

So constify "xsname" in console_init() should be part of the patch, I
think.

Thanks,

-- 
Anthony PERARD

