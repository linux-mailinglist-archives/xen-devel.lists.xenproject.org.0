Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5703377227
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 15:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124320.234634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfNAd-0007lm-IP; Sat, 08 May 2021 13:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124320.234634; Sat, 08 May 2021 13:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfNAd-0007jR-F5; Sat, 08 May 2021 13:39:03 +0000
Received: by outflank-mailman (input) for mailman id 124320;
 Sat, 08 May 2021 13:39:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfNAc-0007SV-Cm
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 13:39:02 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acbeae16-8fd2-4386-ad98-355af3bcd79d;
 Sat, 08 May 2021 13:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id D290D201C6;
 Sat,  8 May 2021 13:43:17 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RLLTE32nPYN; Sat,  8 May 2021 13:43:17 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A5E43201C5;
 Sat,  8 May 2021 13:43:17 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLMb-00BMU6-16; Sat, 08 May 2021 13:43:17 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:43:16 +0200
Resent-Message-ID: <20210508114316.3cqqtlc3mgm37v4r@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 iwj@xenproject.org, wl@xen.org, dgdegra@tycho.nsa.gov,
 quan.xu0@gmail.com
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLDg-00BM7y-Gf; Sat, 08 May 2021 13:34:04 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:34:04 +0200
Resent-Message-ID: <20210508113404.ymmnt2qrs6gijzm6@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 iwj@xenproject.org, wl@xen.org, QuanXu@begin
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
X-Inumbo-ID: acbeae16-8fd2-4386-ad98-355af3bcd79d
Date: Thu, 6 May 2021 23:35:44 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 04/13] vtpmmgr: Allow specifying srk_handle for TPM2
Message-ID: <20210506213544.6twiioapinyzajb4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-5-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506135923.161427-5-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:14 -0400, a ecrit:
> Bypass taking ownership of the TPM2 if an srk_handle is specified.
> 
> This srk_handle must be usable with Null auth for the time being.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> v2: Use "=" seperator
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
> index 1506735051..130e4f4bf6 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -302,6 +302,11 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
>              goto err_invalid;
>           }
>        }
> +      else if(!strncmp(argv[i], "srk_handle=", 11)) {
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

-- 
Samuel
"...[Linux's] capacity to talk via any medium except smoke signals."
(By Dr. Greg Wettstein, Roger Maris Cancer Center)

