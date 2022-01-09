Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79023488746
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255018.437054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N36-00015T-2w; Sun, 09 Jan 2022 01:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255018.437054; Sun, 09 Jan 2022 01:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N35-000147-TY; Sun, 09 Jan 2022 01:31:07 +0000
Received: by outflank-mailman (input) for mailman id 255018;
 Sun, 09 Jan 2022 01:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N34-0007T5-N2
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:31:06 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc4a04f-70eb-11ec-81c1-a30af7de8005;
 Sun, 09 Jan 2022 02:31:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8F725346;
 Sun,  9 Jan 2022 02:31:04 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cH_o0_ByF5S; Sun,  9 Jan 2022 02:31:04 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id B03C564;
 Sun,  9 Jan 2022 02:31:03 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N31-006iTg-8O;
 Sun, 09 Jan 2022 02:31:03 +0100
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
X-Inumbo-ID: cfc4a04f-70eb-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:31:03 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 13/15] mini-os: eliminate tpmtis union member in struct
 file
Message-ID: <20220109013103.gapt7g7jw353c4md@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-14-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-14-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 8F725346
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:39 +0100, a ecrit:
> Replace the tpmtis specific union member in struct file with the
> common dev pointer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h | 5 -----
>  lib/sys.c     | 2 +-
>  tpm_tis.c     | 8 ++++----
>  3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 2ddc076..d6a29ba 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -193,11 +193,6 @@ struct file {
>  	    struct evtchn_port_list ports;
>  	} evtchn;
>  	struct gntmap gntmap;
> -#ifdef CONFIG_TPM_TIS
> -	struct {
> -	   struct tpm_chip *dev;
> -	} tpm_tis;
> -#endif
>  #ifdef CONFIG_XENBUS
>          struct {
>              /* To each xenbus FD is associated a queue of watch events for this
> diff --git a/lib/sys.c b/lib/sys.c
> index b042bf5..96fc769 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -468,7 +468,7 @@ int close(int fd)
>  #endif
>  #ifdef CONFIG_TPM_TIS
>  	case FTYPE_TPM_TIS:
> -            shutdown_tpm_tis(files[fd].tpm_tis.dev);
> +            shutdown_tpm_tis(files[fd].dev);
>  	    files[fd].type = FTYPE_NONE;
>  	    return 0;
>  #endif
> diff --git a/tpm_tis.c b/tpm_tis.c
> index 4127118..477f555 100644
> --- a/tpm_tis.c
> +++ b/tpm_tis.c
> @@ -1288,14 +1288,14 @@ int tpm_tis_open(struct tpm_chip* tpm)
>  
>     tpm->fd = alloc_fd(FTYPE_TPM_TIS);
>     printk("tpm_tis_open() -> %d\n", tpm->fd);
> -   files[tpm->fd].tpm_tis.dev = tpm;
> +   files[tpm->fd].dev = tpm;
>     return tpm->fd;
>  }
>  
>  int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count)
>  {
>     struct tpm_chip* tpm;
> -   tpm = files[fd].tpm_tis.dev;
> +   tpm = files[fd].dev;
>  
>     if(tpm->locality < 0) {
>        printk("tpm_tis_posix_write() failed! locality not set!\n");
> @@ -1323,7 +1323,7 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
>  {
>     int rc;
>     struct tpm_chip* tpm;
> -   tpm = files[fd].tpm_tis.dev;
> +   tpm = files[fd].dev;
>  
>     if(count == 0) {
>        return 0;
> @@ -1350,7 +1350,7 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
>  int tpm_tis_posix_fstat(int fd, struct stat* buf)
>  {
>     struct tpm_chip* tpm;
> -   tpm = files[fd].tpm_tis.dev;
> +   tpm = files[fd].dev;
>  
>     buf->st_mode = O_RDWR;
>     buf->st_uid = 0;
> -- 
> 2.26.2
> 

-- 
Samuel
<r> make
<r> oops
<m> make clean

