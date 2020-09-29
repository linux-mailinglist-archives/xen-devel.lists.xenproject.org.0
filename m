Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D827D421
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 19:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312.873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJ6K-0002Wd-5L; Tue, 29 Sep 2020 17:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312.873; Tue, 29 Sep 2020 17:07:40 +0000
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
	id 1kNJ6K-0002WE-2I; Tue, 29 Sep 2020 17:07:40 +0000
Received: by outflank-mailman (input) for mailman id 312;
 Tue, 29 Sep 2020 17:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNJ6I-0002W9-8a
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:07:38 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4779910f-3524-4f0c-8336-41c2f82a70b8;
 Tue, 29 Sep 2020 17:07:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j2so6251441wrx.7
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 10:07:37 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id i11sm6874803wre.32.2020.09.29.10.07.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 10:07:35 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNJ6I-0002W9-8a
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:07:38 +0000
X-Inumbo-ID: 4779910f-3524-4f0c-8336-41c2f82a70b8
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4779910f-3524-4f0c-8336-41c2f82a70b8;
	Tue, 29 Sep 2020 17:07:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j2so6251441wrx.7
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=pleJDWJPMTsf3JtHQJGJauEAUohrZs+NYo1YTGU+RQ0=;
        b=bZDJsZHm/JqaachzhXtqGs000ttR0T+PJADpeirph7vYASYf8omMnUnRcpTduSGI6T
         loICNIUCGBbrp513x1NUK5lEgQlaaZOx9DA74loK7r/8AChYFK++9xhmCjhinZtTkwNF
         Qu6UMkqZdFaKJW56lkcl3hSB4PDQ6gLK09+cMmsXi+ocZYo6gkc6HbSXCAG2AuaB0bt2
         ftX6XDx4rQMMMpsRN/AolnsoWNrGPVo+VN7TVR45ykX7pm4Rvpil2ZPBvaT2PdI34xav
         2N/2lqYZCqRRiAaDXzioj5aOoTvqGwMHRwWUpXgY1I+GM5dLGWnJsqnfeuZG3GB4262L
         5EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=pleJDWJPMTsf3JtHQJGJauEAUohrZs+NYo1YTGU+RQ0=;
        b=MtSi++ZDvDMmp9IyKrg3MnQuoPR7UnChQ8if8AMKue0L2XyJ3iFiAus83gLgf/csZP
         jRruMOPx/aSDLEgGZAkNhhElmiCjwX3dB9cTyFXyFx28DbnWhVfm9JxcO5BsVs05WfNF
         TDWyoQEJ6TI9aG8UVWVUylFuJAHyzdSxJVVT/pPD8GwEPmpcaFyFf/qFC+LKuN2galOy
         H3QmOnw8SOTCKTqSibW5BDwJyX8C3IvxaBLip6ptJ3+o5qgIp9XEleAqf4pwV4UP1G56
         tpU8ym7ME/WXeBILFhD7RVhNWTcE5G/jSvnlH2srb2HQTmGdBEdrFW/LmrgNSHZjbVt4
         Vavg==
X-Gm-Message-State: AOAM530qRbKDrRHiu7UnEQwDRLLiZnJfnowUC7FIc5lh57KJTuKWb/WH
	vognbThmCUCHU8TIkhCknMM=
X-Google-Smtp-Source: ABdhPJx031QpdCfU/TI0q+eXZQfqD9H/1dBsselhVMCYsNQX7AvfGHxW+1SdtOLXhtJgNlNCeo0x4Q==
X-Received: by 2002:adf:e852:: with SMTP id d18mr5784064wrn.40.1601399256455;
        Tue, 29 Sep 2020 10:07:36 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
        by smtp.gmail.com with ESMTPSA id i11sm6874803wre.32.2020.09.29.10.07.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 10:07:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <6add36f5-93de-dc8e-7c14-dc5ae1c794eb@suse.com>
In-Reply-To: <6add36f5-93de-dc8e-7c14-dc5ae1c794eb@suse.com>
Subject: RE: [PATCH 06/12] evtchn: don't bypass unlinking pIRQ when closing port
Date: Tue, 29 Sep 2020 18:07:34 +0100
Message-ID: <002f01d69683$06ce64c0$146b2e40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgKTfHsKqTMn5kA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 11:59
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 06/12] evtchn: don't bypass unlinking pIRQ when closing port
> 
> There's no other path causing a terminal unlink_pirq_port() to be called
> (evtchn_bind_vcpu() relinks it right away) and hence _if_ pirq can
> indeed be NULL when closing the port, list corruption would occur when
> bypassing the unlink (unless the structure never gets linked again). As
> we can't come here after evtchn_destroy() anymore, (late) domain
> destruction also isn't a reason for a possible exception, and hence the
> only alternative looks to be that the check was pointless in the first
> place. While I haven't observed the case, from code inspection I'm far
> from sure I can exclude this being possible, so it feels more safe to
> re-arrange the code instead.
> 
> Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -615,17 +615,18 @@ int evtchn_close(struct domain *d1, int
>      case ECS_PIRQ: {
>          struct pirq *pirq = pirq_info(d1, chn1->u.pirq.irq);
> 
> -        if ( !pirq )
> -            break;
> -        if ( !is_hvm_domain(d1) )
> -            pirq_guest_unbind(d1, pirq);
> -        pirq->evtchn = 0;
> -        pirq_cleanup_check(pirq, d1);
> -        unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
> +        if ( pirq )
> +        {
> +            if ( !is_hvm_domain(d1) )
> +                pirq_guest_unbind(d1, pirq);
> +            pirq->evtchn = 0;
> +            pirq_cleanup_check(pirq, d1);
>  #ifdef CONFIG_X86
> -        if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
> -            unmap_domain_pirq_emuirq(d1, pirq->pirq);
> +            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
> +                unmap_domain_pirq_emuirq(d1, pirq->pirq);
>  #endif
> +        }
> +        unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
>          break;
>      }
> 
> 



