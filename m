Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F2372ABB
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122361.230778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldurn-0001UZ-Cp; Tue, 04 May 2021 13:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122361.230778; Tue, 04 May 2021 13:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldurn-0001U8-8K; Tue, 04 May 2021 13:13:35 +0000
Received: by outflank-mailman (input) for mailman id 122361;
 Tue, 04 May 2021 13:13:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldurl-0001U3-Er
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:13:33 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef317a00-2862-44bd-baa3-f39faf501c39;
 Tue, 04 May 2021 13:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7A996140;
 Tue,  4 May 2021 15:13:30 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPl5ECzdqkG6; Tue,  4 May 2021 15:13:29 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 8C278AF;
 Tue,  4 May 2021 15:13:29 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldurg-00FpSo-Gn; Tue, 04 May 2021 15:13:28 +0200
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
X-Inumbo-ID: ef317a00-2862-44bd-baa3-f39faf501c39
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 15:13:28 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 4/9] vtpmmgr: Allow specifying srk_handle for TPM2
Message-ID: <20210504131328.wtoe4swz7nyzyuts@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-5-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504124842.220445-5-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 7A996140
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 08:48:37 -0400, a ecrit:
> Bypass taking ownership of the TPM2 if an srk_handle is specified.
> 
> This srk_handle must be usable with Null auth for the time being.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  docs/man/xen-vtpmmgr.7.pod |  7 +++++++
>  stubdom/vtpmmgr/init.c     | 11 ++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
> index 875dcce508..3286954568 100644
> --- a/docs/man/xen-vtpmmgr.7.pod
> +++ b/docs/man/xen-vtpmmgr.7.pod
> @@ -92,6 +92,13 @@ Valid arguments:
>  
>  =over 4
>  
> +=item srk_handle=<HANDLE>

Is this actually srk_handle= or srk_handle: ?

The code tests for the latter. The problem seems to "exist" also for
owner_auth: and srk_auth: but both = and : work actually because strncmp
is told not to check for = and :

We'd better clean this up to avoid confusions.

Samuel

> +
> +Specify a srk_handle for TPM 2.0.  TPM 2.0 uses a key hierarchy, and
> +this allow specifying the parent handle for vtpmmgr to create its own
> +key under.  Using this option bypasses vtpmmgr trying to take ownership
> +of the TPM.
> +
>  =item owner_auth=<AUTHSPEC>
>  
>  =item srk_auth=<AUTHSPEC>
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 1506735051..c01d03e9f4 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -302,6 +302,11 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
>              goto err_invalid;
>           }
>        }
> +      else if(!strncmp(argv[i], "srk_handle:", 11)) {
> +         if(sscanf(argv[i] + 11, "%x", &vtpm_globals.srk_handle) != 1) {
> +            goto err_invalid;
> +         }
> +      }
>        else if(!strncmp(argv[i], "tpmdriver=", 10)) {
>           if(!strcmp(argv[i] + 10, "tpm_tis")) {
>              opts->tpmdriver = TPMDRV_TPM_TIS;
> @@ -586,7 +591,11 @@ TPM_RESULT vtpmmgr2_create(void)
>  {
>      TPM_RESULT status = TPM_SUCCESS;
>  
> -    TPMTRYRETURN(tpm2_take_ownership());
> +    if ( vtpm_globals.srk_handle == 0 ) {
> +        TPMTRYRETURN(tpm2_take_ownership());
> +    } else {
> +        tpm2_AuthArea_ctor(NULL, 0, &vtpm_globals.srk_auth_area);
> +    }
>  
>     /* create SK */
>      TPM2_Create_Params_out out;
> -- 
> 2.30.2
> 

