Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B795488737
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254991.436978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N04-0005Nm-0g; Sun, 09 Jan 2022 01:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254991.436978; Sun, 09 Jan 2022 01:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N03-0005Ky-Tn; Sun, 09 Jan 2022 01:27:59 +0000
Received: by outflank-mailman (input) for mailman id 254991;
 Sun, 09 Jan 2022 01:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N02-0005IG-8B
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:27:58 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6cafa4-70eb-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:27:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 11CCC346;
 Sun,  9 Jan 2022 02:27:56 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVGfLPZ5rbkE; Sun,  9 Jan 2022 02:27:55 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8E0F0331;
 Sun,  9 Jan 2022 02:27:55 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6Mzz-006iQU-57;
 Sun, 09 Jan 2022 02:27:55 +0100
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
X-Inumbo-ID: 5f6cafa4-70eb-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:27:55 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 08/15] mini-os: eliminate fbfront union member in struct
 file
Message-ID: <20220109012755.cboatcoozf3ntwkt@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220106115741.3219-9-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 11CCC346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:34 +0100, a ecrit:
> Replace the fbfront specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  fbfront.c     | 2 +-
>  include/lib.h | 3 ---
>  lib/sys.c     | 4 ++--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fbfront.c b/fbfront.c
> index 6725da1..c8410af 100644
> --- a/fbfront.c
> +++ b/fbfront.c
> @@ -703,7 +703,7 @@ int fbfront_open(struct fbfront_dev *dev)
>  {
>      dev->fd = alloc_fd(FTYPE_FB);
>      printk("fb_open(%s) -> %d\n", dev->nodename, dev->fd);
> -    files[dev->fd].fb.dev = dev;
> +    files[dev->fd].dev = dev;
>      return dev->fd;
>  }
>  #endif
> diff --git a/include/lib.h b/include/lib.h
> index 0cedae6..2a9a01c 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -199,9 +199,6 @@ struct file {
>  	struct {
>  	    struct kbdfront_dev *dev;
>  	} kbd;
> -	struct {
> -	    struct fbfront_dev *dev;
> -	} fb;
>  #ifdef CONFIG_TPMFRONT
>  	struct {
>  	   struct tpmfront_dev *dev;
> diff --git a/lib/sys.c b/lib/sys.c
> index 62c2020..2d48657 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -287,7 +287,7 @@ int read(int fd, void *buf, size_t nbytes)
>          case FTYPE_FB: {
>              int ret, n;
>              n = nbytes / sizeof(union xenfb_in_event);
> -            ret = fbfront_receive(files[fd].fb.dev, buf, n);
> +            ret = fbfront_receive(files[fd].dev, buf, n);
>  	    if (ret <= 0) {
>  		errno = EAGAIN;
>  		return -1;
> @@ -480,7 +480,7 @@ int close(int fd)
>  #endif
>  #ifdef CONFIG_FBFRONT
>  	case FTYPE_FB:
> -            shutdown_fbfront(files[fd].fb.dev);
> +            shutdown_fbfront(files[fd].dev);
>              files[fd].type = FTYPE_NONE;
>              return 0;
>  #endif
> -- 
> 2.26.2
> 

-- 
Samuel
       La  fonction  memfrob() crypte les n premiers octets de la
       zone de mémoire  s  en  effectuant  un  OU-exclusif  entre
       chaque  octet  et le nombre 42.
(extrait de la page de man de memfrob -- Manuel du programmeur Linux)

