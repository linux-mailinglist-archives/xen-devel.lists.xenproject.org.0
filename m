Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD9D9395A0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762463.1172637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0qm-0006zD-Bn; Mon, 22 Jul 2024 21:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762463.1172637; Mon, 22 Jul 2024 21:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0qm-0006x9-8m; Mon, 22 Jul 2024 21:45:44 +0000
Received: by outflank-mailman (input) for mailman id 762463;
 Mon, 22 Jul 2024 21:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0qk-0006ux-T1
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:45:42 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9d1726-4873-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 23:45:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 1183EA02D3;
 Mon, 22 Jul 2024 23:45:41 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJUrgj4RGxnl; Mon, 22 Jul 2024 23:45:40 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EA9A4A02CA;
 Mon, 22 Jul 2024 23:45:40 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0qi-0000000BCk4-21vI; Mon, 22 Jul 2024 23:45:40 +0200
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
X-Inumbo-ID: bd9d1726-4873-11ef-bbfe-fd08da9f4363
Date: Mon, 22 Jul 2024 23:45:40 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/3] mini-os: remove some not needed stuff from
 arch/x86/time.c
Message-ID: <20240722214540.2stt5dzsw7ywltbf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722121643.18116-1-jgross@suse.com>
 <20240722121643.18116-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722121643.18116-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 14:16:42 +0200, a ecrit:
> Remove unused or not needed stuff from arch/x86/time.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/time.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/arch/x86/time.c b/arch/x86/time.c
> index a473a9e1..7fd7abef 100644
> --- a/arch/x86/time.c
> +++ b/arch/x86/time.c
> @@ -48,7 +48,6 @@ struct shadow_time_info {
>      uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
>      uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
>      uint32_t tsc_to_nsec_mul;
> -    uint32_t tsc_to_usec_mul;
>      int tsc_shift;
>      uint32_t version;
>  };
> @@ -57,19 +56,6 @@ static uint32_t shadow_ts_version;
>  
>  static struct shadow_time_info shadow;
>  
> -#ifndef rmb
> -#define rmb()  __asm__ __volatile__ ("lock; addl $0,0(%%esp)" : : : "memory")
> -#endif
> -
> -#define HANDLE_USEC_OVERFLOW(_tv)           \
> -    do {                                    \
> -        while ( (_tv)->tv_usec >= 1000000 ) \
> -        {                                   \
> -            (_tv)->tv_usec -= 1000000;      \
> -            (_tv)->tv_sec++;                \
> -        }                                   \
> -    } while ( 0 )
> -
>  static inline int time_values_up_to_date(void)
>  {
>      struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
> @@ -143,8 +129,6 @@ static void get_time_values_from_xen(void)
>          shadow.tsc_shift         = src->tsc_shift;
>          rmb();
>      } while ( (src->version & 1) | (shadow.version ^ src->version) );
> -
> -    shadow.tsc_to_usec_mul = shadow.tsc_to_nsec_mul / 1000;
>  }
>  
>  /*
> -- 
> 2.43.0
> 

-- 
Samuel
"I don't know why, but first C programs tend to look a lot worse than
first programs in any other language (maybe except for fortran, but then
I suspect all fortran programs look like `firsts')"
(By Olaf Kirch)

