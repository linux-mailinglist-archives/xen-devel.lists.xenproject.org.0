Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0F488729
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254946.436855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mpf-0007Yk-Dk; Sun, 09 Jan 2022 01:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254946.436855; Sun, 09 Jan 2022 01:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6Mpf-0007Wu-AX; Sun, 09 Jan 2022 01:17:15 +0000
Received: by outflank-mailman (input) for mailman id 254946;
 Sun, 09 Jan 2022 01:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6Mpd-0007Wc-TT
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:17:13 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfdf7bbc-70e9-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:17:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8CD36331;
 Sun,  9 Jan 2022 02:17:12 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TK7gXm34arO3; Sun,  9 Jan 2022 02:17:12 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C094564;
 Sun,  9 Jan 2022 02:17:11 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6Mpb-006i5T-2w;
 Sun, 09 Jan 2022 02:17:11 +0100
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
X-Inumbo-ID: dfdf7bbc-70e9-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:17:11 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 01/15] mini-os: split struct file definition from its
 usage
Message-ID: <20220109011711.ft5xxxahzeixwxjm@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220106115741.3219-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 8CD36331
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:27 +0100, a ecrit:
> Make the struct file definition standalone and use it for the
> declaration of the files array.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 39d6a18..a638bc9 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -181,7 +181,7 @@ struct evtchn_port_info {
>          int bound;
>  };
>  
> -extern struct file {
> +struct file {
>      enum fd_type type;
>      union {
>  	struct {
> @@ -236,7 +236,9 @@ extern struct file {
>  #endif
>      };
>      int read;	/* maybe available for read */
> -} files[];
> +};
> +
> +extern struct file files[];
>  
>  int alloc_fd(enum fd_type type);
>  void close_all_files(void);
> -- 
> 2.26.2
> 

-- 
Samuel
> C'est vrai. FreeBSD pourrait être bien s'il avait une licence
> correcte.
Oh, mon troll-ô-meter vient d'exploser...
-+- OR in Guide du linuxien pervers - "Bien regler son troll-ô-meter"

