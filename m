Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2748FEE3
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257952.443633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CUs-0001av-9e; Sun, 16 Jan 2022 20:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257952.443633; Sun, 16 Jan 2022 20:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CUs-0001Y5-6F; Sun, 16 Jan 2022 20:51:30 +0000
Received: by outflank-mailman (input) for mailman id 257952;
 Sun, 16 Jan 2022 20:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CUq-0001Xi-0P
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:51:28 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 120fea90-770e-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:51:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 9B7DA18A;
 Sun, 16 Jan 2022 21:51:25 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPmjaCNA4PIG; Sun, 16 Jan 2022 21:51:25 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id F3F819E;
 Sun, 16 Jan 2022 21:51:24 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CUm-005ubZ-7j;
 Sun, 16 Jan 2022 21:51:24 +0100
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
X-Inumbo-ID: 120fea90-770e-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:51:24 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/3] tools/libs/ctrl: remove file related handling
Message-ID: <20220116205124.xkjvtagk2fo7p6uk@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220116082346.26194-1-jgross@suse.com>
 <20220116082346.26194-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116082346.26194-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 9B7DA18A
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le dim. 16 janv. 2022 09:23:46 +0100, a ecrit:
> There is no special file handling related to libxenctrl in Mini-OS
> any longer, so the close hook can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - new patch
> ---
>  tools/libs/ctrl/xc_minios.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/tools/libs/ctrl/xc_minios.c b/tools/libs/ctrl/xc_minios.c
> index 1799daafdc..3dea7a78a5 100644
> --- a/tools/libs/ctrl/xc_minios.c
> +++ b/tools/libs/ctrl/xc_minios.c
> @@ -35,15 +35,6 @@
>  
>  #include "xc_private.h"
>  
> -void minios_interface_close_fd(int fd);
> -
> -extern void minios_interface_close_fd(int fd);
> -
> -void minios_interface_close_fd(int fd)
> -{
> -    files[fd].type = FTYPE_NONE;
> -}
> -
>  /* Optionally flush file to disk and discard page cache */
>  void discard_file_cache(xc_interface *xch, int fd, int flush)
>  {
> -- 
> 2.26.2
> 

-- 
Samuel
After watching my newly-retired dad spend two weeks learning how to make a new
folder, it became obvious that "intuitive" mostly means "what the writer or
speaker of intuitive likes".
(Bruce Ediger, bediger@teal.csn.org, in comp.os.linux.misc, on X the
intuitiveness of a Mac interface.)

