Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD1B488726
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:16:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254940.436829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mnq-0006It-Nk; Sun, 09 Jan 2022 01:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254940.436829; Sun, 09 Jan 2022 01:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mnq-0006Eo-Jt; Sun, 09 Jan 2022 01:15:22 +0000
Received: by outflank-mailman (input) for mailman id 254940;
 Sun, 09 Jan 2022 01:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6Mnp-0006ER-Qj
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:15:21 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b758187-70e9-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:15:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 6EF153A7;
 Sun,  9 Jan 2022 02:15:17 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVlYJJq80gBA; Sun,  9 Jan 2022 02:15:16 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 79BE1331;
 Sun,  9 Jan 2022 02:15:16 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6Mnj-006i1Q-2N;
 Sun, 09 Jan 2022 02:15:15 +0100
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
X-Inumbo-ID: 9b758187-70e9-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:15:15 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/2] mini-os: remove event channel specific struct file
 member
Message-ID: <20220109011515.sx2qynqslxhllred@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220107104706.9859-1-jgross@suse.com>
 <20220107104706.9859-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107104706.9859-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 6EF153A7
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

Juergen Gross, le ven. 07 janv. 2022 11:47:05 +0100, a ecrit:
> The event channel specific union member in struct file is no longer
> needed,

Doesn't xen/tools/libs/evtchn/minios.c use it?

> so remove it together with the associated structure
> definitions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  include/lib.h | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 7a0546b..cbfeea3 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -173,15 +173,6 @@ enum fd_type {
>      FTYPE_TPM_TIS,
>  };
>  
> -LIST_HEAD(evtchn_port_list, evtchn_port_info);
> -
> -struct evtchn_port_info {
> -        LIST_ENTRY(evtchn_port_info) list;
> -        evtchn_port_t port;
> -        unsigned long pending;
> -        int bound;
> -};
> -
>  struct file {
>      enum fd_type type;
>      bool read;	/* maybe available for read */
> @@ -189,9 +180,6 @@ struct file {
>      union {
>          int fd; /* Any fd from an upper layer. */
>          void *dev;
> -	struct {
> -	    struct evtchn_port_list ports;
> -	} evtchn;
>  	struct gntmap gntmap;
>      };
>  };
> -- 
> 2.26.2

