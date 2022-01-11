Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F348B8CA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256140.439427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Nyl-0007Na-28; Tue, 11 Jan 2022 20:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256140.439427; Tue, 11 Jan 2022 20:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Nyk-0007K4-VE; Tue, 11 Jan 2022 20:42:50 +0000
Received: by outflank-mailman (input) for mailman id 256140;
 Tue, 11 Jan 2022 20:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7Nyj-0007Ce-VQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:42:49 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09fbecd2-731f-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:42:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id DE358678;
 Tue, 11 Jan 2022 21:42:48 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9ROnKIghYpM; Tue, 11 Jan 2022 21:42:48 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 81A25140;
 Tue, 11 Jan 2022 21:42:47 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7Nyh-00FFnE-3z;
 Tue, 11 Jan 2022 21:42:47 +0100
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
X-Inumbo-ID: 09fbecd2-731f-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:42:47 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 12/12] mini-os: make files array private to sys.c
Message-ID: <20220111204247.iqfobcpsnnqnx2el@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-13-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-13-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: DE358678
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le mar. 11 janv. 2022 16:12:15 +0100, a ecrit:
> There is no user of the files[] array outside of lib/sys.c left, so
> it can be made static.

Yay!

> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h | 2 --
>  lib/sys.c     | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index c171fe8..80e804b 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -199,8 +199,6 @@ struct file {
>      };
>  };
>  
> -extern struct file files[];
> -
>  struct file *get_file_from_fd(int fd);
>  int alloc_fd(unsigned int type);
>  void close_all_files(void);
> diff --git a/lib/sys.c b/lib/sys.c
> index 0f42e97..c0cad87 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -89,7 +89,7 @@ extern void minios_evtchn_close_fd(int fd);
>  extern void minios_gnttab_close_fd(int fd);
>  
>  pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
> -struct file files[NOFILE] = {
> +static struct file files[NOFILE] = {
>      { .type = FTYPE_CONSOLE }, /* stdin */
>      { .type = FTYPE_CONSOLE }, /* stdout */
>      { .type = FTYPE_CONSOLE }, /* stderr */
> -- 
> 2.26.2
> 

-- 
Samuel
#include <culture.h>

