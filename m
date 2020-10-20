Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B6B293967
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 12:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9085.24432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUpFN-0008QA-MY; Tue, 20 Oct 2020 10:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9085.24432; Tue, 20 Oct 2020 10:52:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUpFN-0008Pl-JC; Tue, 20 Oct 2020 10:52:05 +0000
Received: by outflank-mailman (input) for mailman id 9085;
 Tue, 20 Oct 2020 10:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUpFL-0008Pg-L7
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:52:03 +0000
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b3c36b7-642d-4890-9e05-dfde22723f77;
 Tue, 20 Oct 2020 10:52:02 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x7so1972147eje.8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:52:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id yz15sm2130137ejb.9.2020.10.20.03.51.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 03:52:00 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUpFL-0008Pg-L7
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 10:52:03 +0000
X-Inumbo-ID: 3b3c36b7-642d-4890-9e05-dfde22723f77
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3b3c36b7-642d-4890-9e05-dfde22723f77;
	Tue, 20 Oct 2020 10:52:02 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x7so1972147eje.8
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=N9snk6wIxMy2vhViaLw1HdAzvnXDeCoIdpd888YMbN0=;
        b=pZ59wM4N3SxMPd4qf++rEbaom9ltWVJy55cGIrNG2eXy5MjNIkwvWfWpGQRq68c21B
         hH/ATinVvMCjuzh1nbfaUqL5aIHEZOoub3hwyRrRHyz8Bri7DYs83MiYLueOCwGYG6xD
         ir0ZRGDV9t3eAEO30MdZ88QBYVdFQC/TmKfa4naaaBmPaQqD/e1zypLLJCZIRp0hNhXZ
         cdvklksUdM9JocOQ86WUWXscR7B9FGA6Fk62xB6vvVQILUetstZ/8Jf/JCXRq35cyM3U
         E9erblTm6MlvooUHORpIzWw/7iRr09ldJn3EIaZDxuRfWYKjsu7dO19s2T6X3EL+6jz1
         yO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=N9snk6wIxMy2vhViaLw1HdAzvnXDeCoIdpd888YMbN0=;
        b=gO22N3KsWBFyuQjW/EWz5KGlSPkk3fYrqpuFwSP6wSuGLc1z7Be1Pe8v+GqIhWLwrb
         0Ni0OdN+7ttRIcSyJo/O7S/niXgxmk55DfDZI5eayOJk56ZottAbFgaUE8tLSWE+O0el
         VWdcOdxK+PeZUx9ki09fHE2sjCWLi8F+cQ58VJJaII3cPO88UPWA3xezpz42WE/Gb72i
         D5hck6f2Iz0Myk9h908/BqEeCL857pF4+VNSdZXZAVlKUKafSnqn/lr9FM48KuJSQ6SC
         RbEgcnc8QnkNiFRE5Daq2yvOYT2AdDkkT6EP7KlZKtr/Jq1/jlj8IBxFac4SxSGOn8T4
         5/IA==
X-Gm-Message-State: AOAM531+Kegg47/bHYYvDdB/6njUDl1jjuDI3C+gB5wYXEopQBgvloyJ
	05SsZfXdXjOJ/13cevJMaBs=
X-Google-Smtp-Source: ABdhPJxQ1TijZUERYfNl3SFDtw1yyNsIxuQHXTZpxMfmqctzj3EFwVrzPaEEEEp3VZTEBU7a38+kgw==
X-Received: by 2002:a17:906:364f:: with SMTP id r15mr2448472ejb.388.1603191121414;
        Tue, 20 Oct 2020 03:52:01 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id yz15sm2130137ejb.9.2020.10.20.03.51.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 03:52:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Tue, 20 Oct 2020 11:51:59 +0100
Message-ID: <004e01d6a6cf$09cd9f40$1d68ddc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAGr5WYaqmrtRJA=
Content-Language: en-gb



> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano Stabellini <sstabellini@kernel.org>;
> Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>; Paul Durrant
> <paul@xen.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces a helper the main purpose of which is to check
> if a domain is using IOREQ server(s).
> 
> On Arm the current benefit is to avoid calling handle_io_completion()
> (which implies iterating over all possible IOREQ servers anyway)
> on every return in leave_hypervisor_to_guest() if there is no active
> servers for the particular domain.
> Also this helper will be used by one of the subsequent patches on Arm.
> 
> This involves adding an extra per-domain variable to store the count
> of servers in use.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - new patch
> 
> Changes V1 -> V2:
>    - update patch description
>    - guard helper with CONFIG_IOREQ_SERVER
>    - remove "hvm" prefix
>    - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
>    - put suitable ASSERT()s
>    - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
>    - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()
> ---
>  xen/arch/arm/traps.c    | 15 +++++++++------
>  xen/common/ioreq.c      |  7 ++++++-
>  xen/include/xen/ioreq.h | 14 ++++++++++++++
>  xen/include/xen/sched.h |  1 +
>  4 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 507c095..a8f5fdf 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2261,14 +2261,17 @@ static bool check_for_vcpu_work(void)
>      struct vcpu *v = current;
> 
>  #ifdef CONFIG_IOREQ_SERVER
> -    bool handled;
> +    if ( domain_has_ioreq_server(v->domain) )
> +    {
> +        bool handled;
> 
> -    local_irq_enable();
> -    handled = handle_io_completion(v);
> -    local_irq_disable();
> +        local_irq_enable();
> +        handled = handle_io_completion(v);
> +        local_irq_disable();
> 
> -    if ( !handled )
> -        return true;
> +        if ( !handled )
> +            return true;
> +    }
>  #endif
> 
>      if ( likely(!v->arch.need_flush_to_ram) )
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index bcd4961..a72bc0e 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
>                               struct ioreq_server *s)
>  {
>      ASSERT(id < MAX_NR_IOREQ_SERVERS);
> -    ASSERT(!s || !d->ioreq_server.server[id]);
> +    ASSERT(d->ioreq_server.server[id] ? !s : !!s);

That looks odd. How about ASSERT(!s ^ !d->ioreq_server.server[id])?

  Paul

> 
>      d->ioreq_server.server[id] = s;
> +
> +    if ( s )
> +        d->ioreq_server.nr_servers++;
> +    else
> +        d->ioreq_server.nr_servers--;
>  }
> 
>  #define GET_IOREQ_SERVER(d, id) \
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index 7b03ab5..0679fef 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -55,6 +55,20 @@ struct ioreq_server {
>      uint8_t                bufioreq_handling;
>  };
> 
> +#ifdef CONFIG_IOREQ_SERVER
> +static inline bool domain_has_ioreq_server(const struct domain *d)
> +{
> +    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
> +

This seems like an odd place to put such an assertion.

> +    return d->ioreq_server.nr_servers;
> +}
> +#else
> +static inline bool domain_has_ioreq_server(const struct domain *d)
> +{
> +    return false;
> +}
> +#endif
> +

Can this be any more compact? E.g.

return IS_ENABLED(CONFIG_IOREQ_SERVER) && d->ioreq_server.nr_servers;

?

>  struct ioreq_server *get_ioreq_server(const struct domain *d,
>                                        unsigned int id);
> 
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index f9ce14c..290cddb 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -553,6 +553,7 @@ struct domain
>      struct {
>          spinlock_t              lock;
>          struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
> +        unsigned int            nr_servers;
>      } ioreq_server;
>  #endif
>  };
> --
> 2.7.4



