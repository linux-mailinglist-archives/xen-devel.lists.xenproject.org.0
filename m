Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9CD93959C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762449.1172623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0on-0006JE-R6; Mon, 22 Jul 2024 21:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762449.1172623; Mon, 22 Jul 2024 21:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0on-0006HT-OK; Mon, 22 Jul 2024 21:43:41 +0000
Received: by outflank-mailman (input) for mailman id 762449;
 Mon, 22 Jul 2024 21:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0om-0006FZ-GP
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:43:40 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 733011c9-4873-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 23:43:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 23556A02D3;
 Mon, 22 Jul 2024 23:43:36 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2fIxkPsJrLC; Mon, 22 Jul 2024 23:43:36 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 041FCA02CA;
 Mon, 22 Jul 2024 23:43:36 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0oh-0000000B70A-2UUt; Mon, 22 Jul 2024 23:43:35 +0200
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
X-Inumbo-ID: 733011c9-4873-11ef-8776-851b0ebba9a2
Date: Mon, 22 Jul 2024 23:43:35 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/3] mini-os: apply coding style to arch/x86/time.c
Message-ID: <20240722214335.cb2spwsgacs43w55@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722121643.18116-1-jgross@suse.com>
 <20240722121643.18116-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722121643.18116-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 14:16:41 +0200, a ecrit:
> Apply the preferred coding style to arch/x86/time.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/time.c | 194 +++++++++++++++++++++++-------------------------
>  1 file changed, 93 insertions(+), 101 deletions(-)
> 
> diff --git a/arch/x86/time.c b/arch/x86/time.c
> index 332c0260..a473a9e1 100644
> --- a/arch/x86/time.c
> +++ b/arch/x86/time.c
> @@ -1,7 +1,7 @@
>  /* -*-  Mode:C; c-basic-offset:4; tab-width:4 -*-
>   ****************************************************************************
>   * (C) 2003 - Rolf Neugebauer - Intel Research Cambridge
> - * (C) 2002-2003 - Keir Fraser - University of Cambridge 
> + * (C) 2002-2003 - Keir Fraser - University of Cambridge
>   * (C) 2005 - Grzegorz Milos - Intel Research Cambridge
>   * (C) 2006 - Robert Kaiser - FH Wiesbaden
>   ****************************************************************************
> @@ -18,20 +18,19 @@
>   * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>   * sell copies of the Software, and to permit persons to whom the Software is
>   * furnished to do so, subject to the following conditions:
> - * 
> + *
>   * The above copyright notice and this permission notice shall be included in
>   * all copies or substantial portions of the Software.
> - * 
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
> - * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> -
>  #include <mini-os/os.h>
>  #include <mini-os/traps.h>
>  #include <mini-os/types.h>
> @@ -46,44 +45,43 @@
>  
>  /* These are peridically updated in shared_info, and then copied here. */
>  struct shadow_time_info {
> -	uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
> -	uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
> -	uint32_t tsc_to_nsec_mul;
> -	uint32_t tsc_to_usec_mul;
> -	int tsc_shift;
> -	uint32_t version;
> +    uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
> +    uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
> +    uint32_t tsc_to_nsec_mul;
> +    uint32_t tsc_to_usec_mul;
> +    int tsc_shift;
> +    uint32_t version;
>  };
>  static struct timespec shadow_ts;
>  static uint32_t shadow_ts_version;
>  
>  static struct shadow_time_info shadow;
>  
> -
>  #ifndef rmb
> -#define rmb()  __asm__ __volatile__ ("lock; addl $0,0(%%esp)": : :"memory")
> +#define rmb()  __asm__ __volatile__ ("lock; addl $0,0(%%esp)" : : : "memory")
>  #endif
>  
> -#define HANDLE_USEC_OVERFLOW(_tv)          \
> -    do {                                   \
> +#define HANDLE_USEC_OVERFLOW(_tv)           \
> +    do {                                    \
>          while ( (_tv)->tv_usec >= 1000000 ) \
> -        {                                  \
> +        {                                   \
>              (_tv)->tv_usec -= 1000000;      \
>              (_tv)->tv_sec++;                \
> -        }                                  \
> +        }                                   \
>      } while ( 0 )
>  
>  static inline int time_values_up_to_date(void)
>  {
> -	struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time; 
> +    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
>  
> -	return (shadow.version == src->version);
> +    return shadow.version == src->version;
>  }
>  
>  static inline int wc_values_up_to_date(void)
>  {
> -	shared_info_t *s= HYPERVISOR_shared_info;
> +    shared_info_t *s = HYPERVISOR_shared_info;
>  
> -	return (shadow_ts_version == s->wc_version);
> +    return shadow_ts_version == s->wc_version;
>  }
>  
>  /*
> @@ -92,109 +90,104 @@ static inline int wc_values_up_to_date(void)
>   */
>  static inline uint64_t scale_delta(uint64_t delta, uint32_t mul_frac, int shift)
>  {
> -	uint64_t product;
> +    uint64_t product;
>  #ifdef __i386__
> -	uint32_t tmp1, tmp2;
> +    uint32_t tmp1, tmp2;
>  #endif
>  
> -	if ( shift < 0 )
> -		delta >>= -shift;
> -	else
> -		delta <<= shift;
> +    if ( shift < 0 )
> +        delta >>= -shift;
> +    else
> +        delta <<= shift;
>  
>  #ifdef __i386__
> -	__asm__ (
> -		"mul  %5       ; "
> -		"mov  %4,%%eax ; "
> -		"mov  %%edx,%4 ; "
> -		"mul  %5       ; "
> -		"add  %4,%%eax ; "
> -		"xor  %5,%5    ; "
> -		"adc  %5,%%edx ; "
> -		: "=A" (product), "=r" (tmp1), "=r" (tmp2)
> -		: "a" ((uint32_t)delta), "1" ((uint32_t)(delta >> 32)), "2" (mul_frac) );
> +    __asm__ (
> +        "mul  %5       ; "
> +        "mov  %4,%%eax ; "
> +        "mov  %%edx,%4 ; "
> +        "mul  %5       ; "
> +        "add  %4,%%eax ; "
> +        "xor  %5,%5    ; "
> +        "adc  %5,%%edx ; "
> +        : "=A" (product), "=r" (tmp1), "=r" (tmp2)
> +        : "a" ((uint32_t)delta), "1" ((uint32_t)(delta >> 32)), "2" (mul_frac) );
>  #else
> -	__asm__ (
> -		"mul %%rdx ; shrd $32,%%rdx,%%rax"
> -		: "=a" (product) : "0" (delta), "d" ((uint64_t)mul_frac) );
> +    __asm__ (
> +        "mul %%rdx ; shrd $32,%%rdx,%%rax"
> +        : "=a" (product) : "0" (delta), "d" ((uint64_t)mul_frac) );
>  #endif
>  
> -	return product;
> +    return product;
>  }
>  
> -
>  static unsigned long get_nsec_offset(void)
>  {
> -	uint64_t now, delta;
> -	rdtscll(now);
> -	delta = now - shadow.tsc_timestamp;
> -	return scale_delta(delta, shadow.tsc_to_nsec_mul, shadow.tsc_shift);
> -}
> +    uint64_t now, delta;
>  
> +    rdtscll(now);
> +    delta = now - shadow.tsc_timestamp;
> +
> +    return scale_delta(delta, shadow.tsc_to_nsec_mul, shadow.tsc_shift);
> +}
>  
>  static void get_time_values_from_xen(void)
>  {
> -	struct vcpu_time_info    *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
> -
> - 	do {
> -		shadow.version = src->version;
> -		rmb();
> -		shadow.tsc_timestamp     = src->tsc_timestamp;
> -		shadow.system_timestamp  = src->system_time;
> -		shadow.tsc_to_nsec_mul   = src->tsc_to_system_mul;
> -		shadow.tsc_shift         = src->tsc_shift;
> -		rmb();
> -	}
> -	while ((src->version & 1) | (shadow.version ^ src->version));
> -
> -	shadow.tsc_to_usec_mul = shadow.tsc_to_nsec_mul / 1000;
> +    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
> +
> +    do {
> +        shadow.version = src->version;
> +        rmb();
> +        shadow.tsc_timestamp     = src->tsc_timestamp;
> +        shadow.system_timestamp  = src->system_time;
> +        shadow.tsc_to_nsec_mul   = src->tsc_to_system_mul;
> +        shadow.tsc_shift         = src->tsc_shift;
> +        rmb();
> +    } while ( (src->version & 1) | (shadow.version ^ src->version) );
> +
> +    shadow.tsc_to_usec_mul = shadow.tsc_to_nsec_mul / 1000;
>  }
>  
> -
> -
> -
> -/* monotonic_clock(): returns # of nanoseconds passed since time_init()
> - *		Note: This function is required to return accurate
> - *		time even in the absence of multiple timer ticks.
> +/*
> + * monotonic_clock(): returns # of nanoseconds passed since time_init()
> + *        Note: This function is required to return accurate
> + *        time even in the absence of multiple timer ticks.
>   */
>  uint64_t monotonic_clock(void)
>  {
> -	uint64_t time;
> -	uint32_t local_time_version;
> -
> -	do {
> -		local_time_version = shadow.version;
> -		rmb();
> -		time = shadow.system_timestamp + get_nsec_offset();
> -		if (!time_values_up_to_date())
> -			get_time_values_from_xen();
> -		rmb();
> -	} while (local_time_version != shadow.version);
> -
> -	return time;
> +    uint64_t time;
> +    uint32_t local_time_version;
> +
> +    do {
> +        local_time_version = shadow.version;
> +        rmb();
> +        time = shadow.system_timestamp + get_nsec_offset();
> +        if ( !time_values_up_to_date() )
> +            get_time_values_from_xen();
> +        rmb();
> +    } while ( local_time_version != shadow.version );
> +
> +    return time;
>  }
>  
>  static void update_wallclock(void)
>  {
> -	shared_info_t *s = HYPERVISOR_shared_info;
> -
> -	do {
> -		shadow_ts_version = s->wc_version;
> -		rmb();
> -		shadow_ts.tv_sec  = s->wc_sec;
> -		shadow_ts.tv_nsec = s->wc_nsec;
> -		rmb();
> -	}
> -	while ((s->wc_version & 1) | (shadow_ts_version ^ s->wc_version));
> +    shared_info_t *s = HYPERVISOR_shared_info;
> +
> +    do {
> +        shadow_ts_version = s->wc_version;
> +        rmb();
> +        shadow_ts.tv_sec  = s->wc_sec;
> +        shadow_ts.tv_nsec = s->wc_nsec;
> +        rmb();
> +    } while ( (s->wc_version & 1) | (shadow_ts_version ^ s->wc_version) );
>  }
>  
> -
>  int gettimeofday(struct timeval *tv, void *tz)
>  {
>      uint64_t nsec = monotonic_clock();
>  
> -    if (!wc_values_up_to_date())
> -	update_wallclock();
> +    if ( !wc_values_up_to_date() )
> +        update_wallclock();
>  
>      nsec += shadow_ts.tv_nsec;
>  
> @@ -209,7 +202,7 @@ EXPORT_SYMBOL(gettimeofday);
>  void block_domain(s_time_t until)
>  {
>      ASSERT(irqs_disabled());
> -    if(monotonic_clock() < until)
> +    if ( monotonic_clock() < until )
>      {
>          HYPERVISOR_set_timer_op(until);
>  #ifdef CONFIG_PARAVIRT
> @@ -228,9 +221,8 @@ static void timer_handler(evtchn_port_t ev, struct pt_regs *regs, void *ign)
>      HYPERVISOR_set_timer_op(monotonic_clock() + MILLISECS(1));
>  }
>  
> -
> -
>  static evtchn_port_t port;
> +
>  void init_time(void)
>  {
>      port = bind_virq(VIRQ_TIMER, &timer_handler, NULL);
> -- 
> 2.43.0
> 

-- 
Samuel
"I don't know why, but first C programs tend to look a lot worse than
first programs in any other language (maybe except for fortran, but then
I suspect all fortran programs look like `firsts')"
(By Olaf Kirch)

