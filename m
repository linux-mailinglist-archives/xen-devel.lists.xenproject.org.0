Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21732471755
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 00:54:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245485.423553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCBY-0006j3-Qv; Sat, 11 Dec 2021 23:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245485.423553; Sat, 11 Dec 2021 23:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCBY-0006gV-N2; Sat, 11 Dec 2021 23:53:48 +0000
Received: by outflank-mailman (input) for mailman id 245485;
 Sat, 11 Dec 2021 23:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1IHf=Q4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwCBX-0006gP-8k
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 23:53:47 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 930917c2-5add-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 00:53:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B0C03392;
 Sun, 12 Dec 2021 00:53:43 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFpEpRvR65lK; Sun, 12 Dec 2021 00:53:43 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id AFD9C181;
 Sun, 12 Dec 2021 00:53:42 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwCBR-001qKM-U2;
 Sun, 12 Dec 2021 00:53:41 +0100
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
X-Inumbo-ID: 930917c2-5add-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 00:53:41 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 57/57] stubdom: xenlibs linkfarm, ignore non-regular
 files
Message-ID: <20211211235341.zogxzqinhxoowkxw@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-58-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206170241.13165-58-anthony.perard@citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Queue-Id: B0C03392
X-Spamd-Result: default: False [1.90 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,xenproject.org,xen.org];
	 MID_RHS_NOT_FQDN(0.50)[];
	 SUSPICIOUS_RECIPS(1.50)[]

Anthony PERARD, le lun. 06 déc. 2021 17:02:40 +0000, a ecrit:
> When we will convert tools/ build system, their will be a need to
> replace some use of "vpath". This will done making symbolic links.
> Those symlinks are not wanted by stubdom build system when making a
> linkfarm for the Xen libraries. To avoid them, we will use `find`
> instead of plain shell globbing.
> 
> For example, there will be a link to "xen/lib/x86/cpuid.o" in
> "tools/libs/guest/".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 1fa075b9ad..b312f710cd 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -345,7 +345,7 @@ define do_links
>    mkdir -p $(dir $@)include
>    cd $(dir $@); \
>    ln -sf $(dir $<)include/*.h include/; \
> -  ln -sf $(dir $<)*.[ch] .; \
> +  find $(dir $<) -maxdepth 1 -type f -name '*.[ch]' -exec ln -sf {} . \; ; \
>    ln -sf $(dir $<)Makefile.common .
>    touch $@
>  endef
> -- 
> Anthony PERARD
> 

-- 
Samuel
$ du temp.iso 
2,0T    temp.iso
$ ls temp.iso -l
-r-xr-xr-x    1 samy     thibault      16E 2003-03-22 14:44 temp.iso*
 -+- je vous dirai pas la marque de mon disque dur, na :p -+- 

