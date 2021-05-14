Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F7380E97
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 19:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127443.239550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhbHD-0006Vv-7o; Fri, 14 May 2021 17:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127443.239550; Fri, 14 May 2021 17:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhbHD-0006U7-4a; Fri, 14 May 2021 17:07:03 +0000
Received: by outflank-mailman (input) for mailman id 127443;
 Fri, 14 May 2021 17:07:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhbHC-0006Tz-Fv
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 17:07:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhbH9-0005NK-IF; Fri, 14 May 2021 17:06:59 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhbH9-0001Rw-Bn; Fri, 14 May 2021 17:06:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gBlQfvOBxzjOWX42sl46nGkap3E0WFYLA4l92rq7CdI=; b=oMc5PbkYRznNH8DFyTnoiARuSa
	Oiimk6wNH9B0jMWhWwa6BIweuJ0Os1BkvOYdE04PDOOlpIwONlJSq77XzEt/Id3aH1Adg80nkFeAO
	1E06zXVXHDUL7+49RPXj1gQDwnXmiTPBo4+IIoqkoaMYd1H/qjXDZ5f1NsUYtURtYMag=;
Subject: Re: [PATCH] tools/xenstore: cleanup Makefile and gitignore
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210514090116.21002-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a67f922a-935e-2b8b-dde6-2362ca3371c3@xen.org>
Date: Fri, 14 May 2021 18:06:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514090116.21002-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/05/2021 10:01, Juergen Gross wrote:
> The Makefile of xenstore and related to that the global .gitignore
> file contain some leftovers from ancient times. Remove those.
> 
> While at it sort the tools/xenstore/* entries in .gitignore.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   .gitignore              | 7 +++----
>   tools/xenstore/Makefile | 2 +-
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 1c2fa1530b..4aad2ddd65 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -288,15 +288,15 @@ tools/xenpaging/xenpaging
>   tools/xenpmd/xenpmd
>   tools/xenstore/xenstore
>   tools/xenstore/xenstore-chmod
> +tools/xenstore/xenstore-control
>   tools/xenstore/xenstore-exists
>   tools/xenstore/xenstore-list
> +tools/xenstore/xenstore-ls
>   tools/xenstore/xenstore-read
>   tools/xenstore/xenstore-rm
> +tools/xenstore/xenstore-watch
>   tools/xenstore/xenstore-write
> -tools/xenstore/xenstore-control
> -tools/xenstore/xenstore-ls
>   tools/xenstore/xenstored
> -tools/xenstore/xenstored_test
>   tools/xenstore/xs_tdb_dump
>   tools/xentop/xentop
>   tools/xentrace/xentrace_setsize
> @@ -428,7 +428,6 @@ tools/firmware/etherboot/ipxe.tar.gz
>   tools/firmware/etherboot/ipxe/
>   tools/python/xen/lowlevel/xl/_pyxl_types.c
>   tools/python/xen/lowlevel/xl/_pyxl_types.h
> -tools/xenstore/xenstore-watch
>   tools/xl/_paths.h
>   tools/xl/xl
>   
> diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
> index 01c9ccc70f..292b478fa1 100644
> --- a/tools/xenstore/Makefile
> +++ b/tools/xenstore/Makefile
> @@ -90,7 +90,7 @@ xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
>   .PHONY: clean
>   clean:
>   	rm -f *.a *.o xenstored_probes.h
> -	rm -f xenstored xs_random xs_stress xs_crashme
> +	rm -f xenstored
>   	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
>   	rm -f xenstore $(CLIENTS)
>   	$(RM) $(DEPS_RM)
> 

-- 
Julien Grall

