Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF457FAABD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 20:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642464.1001931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hkm-0007fn-Cd; Mon, 27 Nov 2023 19:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642464.1001931; Mon, 27 Nov 2023 19:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hkm-0007e4-9C; Mon, 27 Nov 2023 19:58:48 +0000
Received: by outflank-mailman (input) for mailman id 642464;
 Mon, 27 Nov 2023 19:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hkl-0006PP-32
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:58:47 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f23015a-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 20:58:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 2DBB920103;
 Mon, 27 Nov 2023 20:58:45 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTVClDYWgGBF; Mon, 27 Nov 2023 20:58:45 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 179DD20101;
 Mon, 27 Nov 2023 20:58:45 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hki-00000005cjK-3Nt0; Mon, 27 Nov 2023 20:58:44 +0100
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
X-Inumbo-ID: 5f23015a-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 20:58:44 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 05/32] Mini-OS: add EXPORT_SYMBOL() instances to
 sched.c
Message-ID: <20231127195844.xdimcqdqial2hx4f@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-6-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:24:56 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to sched.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  arch/x86/sched.c | 5 +++++
>  sched.c          | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/x86/sched.c b/arch/x86/sched.c
> index e7b6954e..dabe6fd6 100644
> --- a/arch/x86/sched.c
> +++ b/arch/x86/sched.c
> @@ -142,11 +142,13 @@ unsigned long __local_irq_save(void)
>      local_irq_save(flags);
>      return flags;
>  }
> +EXPORT_SYMBOL(__local_irq_save);
>  
>  void __local_irq_restore(unsigned long flags)
>  {
>      local_irq_restore(flags);
>  }
> +EXPORT_SYMBOL(__local_irq_restore);
>  
>  unsigned long __local_save_flags(void)
>  {
> @@ -155,13 +157,16 @@ unsigned long __local_save_flags(void)
>      local_save_flags(flags);
>      return flags;
>  }
> +EXPORT_SYMBOL(__local_save_flags);
>  
>  void __local_irq_disable(void)
>  {
>      local_irq_disable();
>  }
> +EXPORT_SYMBOL(__local_irq_disable);
>  
>  void __local_irq_enable(void)
>  {
>      local_irq_enable();
>  }
> +EXPORT_SYMBOL(__local_irq_enable);
> diff --git a/sched.c b/sched.c
> index 6f89ea4d..e162cb60 100644
> --- a/sched.c
> +++ b/sched.c
> @@ -128,6 +128,7 @@ void schedule(void)
>          }
>      }
>  }
> +EXPORT_SYMBOL(schedule);
>  
>  struct thread* create_thread(char *name, void (*function)(void *), void *data)
>  {
> @@ -147,6 +148,7 @@ struct thread* create_thread(char *name, void (*function)(void *), void *data)
>      local_irq_restore(flags);
>      return thread;
>  }
> +EXPORT_SYMBOL(create_thread);
>  
>  #ifdef HAVE_LIBC
>  static struct _reent callback_reent;
> @@ -184,6 +186,7 @@ struct _reent *__getreent(void)
>  #endif
>      return _reent;
>  }
> +EXPORT_SYMBOL(__getreent);
>  #endif
>  
>  void exit_thread(void)
> @@ -205,12 +208,14 @@ void exit_thread(void)
>          printk("schedule() returned!  Trying again\n");
>      }
>  }
> +EXPORT_SYMBOL(exit_thread);
>  
>  void block(struct thread *thread)
>  {
>      thread->wakeup_time = 0LL;
>      clear_runnable(thread);
>  }
> +EXPORT_SYMBOL(block);
>  
>  void msleep(uint32_t millisecs)
>  {
> @@ -219,12 +224,14 @@ void msleep(uint32_t millisecs)
>      clear_runnable(thread);
>      schedule();
>  }
> +EXPORT_SYMBOL(msleep);
>  
>  void wake(struct thread *thread)
>  {
>      thread->wakeup_time = 0LL;
>      set_runnable(thread);
>  }
> +EXPORT_SYMBOL(wake);
>  
>  void idle_thread_fn(void *unused)
>  {
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

