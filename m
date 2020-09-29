Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8627D447
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 19:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318.897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJEv-0003bE-GY; Tue, 29 Sep 2020 17:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318.897; Tue, 29 Sep 2020 17:16:33 +0000
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
	id 1kNJEv-0003ap-DP; Tue, 29 Sep 2020 17:16:33 +0000
Received: by outflank-mailman (input) for mailman id 318;
 Tue, 29 Sep 2020 17:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNJEt-0003ak-G8
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:16:31 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a18f2aa7-fc45-4f02-8e53-751b4096fce0;
 Tue, 29 Sep 2020 17:16:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k15so6264334wrn.10
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 10:16:30 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id u66sm6218592wme.12.2020.09.29.10.16.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 10:16:28 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNJEt-0003ak-G8
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:16:31 +0000
X-Inumbo-ID: a18f2aa7-fc45-4f02-8e53-751b4096fce0
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a18f2aa7-fc45-4f02-8e53-751b4096fce0;
	Tue, 29 Sep 2020 17:16:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k15so6264334wrn.10
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=rAfnshNpug8Y/H53tjGSqJf3UPWGYGpaUF0OymuAqlU=;
        b=ewd5ZSOGD9xWI0ArOaZOkqVHXb290T2DC56GS/8jgnzdXeQjDQOlG+XKjYscs2W6DR
         DAsRpaYVlnJQ06nOxbnKYzCHQotBkyQQR0boTav4urXNykN7M6n7dgI+UsYiOD0k1jOy
         n8/rYOGZmduszoIOd7kK9GWbIzEUV8o+IQKA+ri3kgL4arw0Pw7zzMcj0Cgr/rnXYkco
         siZsKVqBdTo32WqtM7Nl3sFfwpkwLLM56lOqGMxgzZVxNz/BDRVvs6CIT5aFiIwFvx+V
         WQtja/0FVKjoCLaaQFWSHvemv9OwrIpyazBEbkkpvR0w4jxvt2RWMWEdKFfkZ3hxkLNv
         T19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=rAfnshNpug8Y/H53tjGSqJf3UPWGYGpaUF0OymuAqlU=;
        b=Xdz1+e5tb6Rzx8XQ1S0P6aDB8pZdJD+prwpT0Q0g5XFOn9ZKyNxAuXfUJyOKXHftBZ
         NSciCbmMD+STybsbwb+AeU2FB0PzIlZS7uQdbFGI4MbWsUjCKXOGPjuegF7ofB4P14Kp
         39+Twp4nJun+UafGwLyrB4gDXdGPajJMkJHhFQhZ5eKSTEpShDegW3SbIruTg0kezfLX
         jVn6z0KtrAow9OtCn/UAA7uZglfs/U+QdIS6CxJ8/FDUskq8lwGu9kM5YDsZUnYjdIDy
         wQALaeed9hFNSP1+2uyWPxyiPi5m3R3QjGv9CmU7SVCNyYCGqDeRdxozqMSGyayLv+6R
         2xog==
X-Gm-Message-State: AOAM530/rCcXhfpscQrrkNYamRfNlr3snoUpv3CFF9cpE+KIcgA7IU1x
	yo3XM+dD6DgX+8JEnIrVI58=
X-Google-Smtp-Source: ABdhPJyBU7lOTRvfOz+j4K/a/To0zzaeHtI9jbnrz5oRAVLEXAUtv7r/R69zxKvBhB0gBmm8M1f9og==
X-Received: by 2002:adf:8285:: with SMTP id 5mr5240420wrc.97.1601399789349;
        Tue, 29 Sep 2020 10:16:29 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
        by smtp.gmail.com with ESMTPSA id u66sm6218592wme.12.2020.09.29.10.16.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 10:16:28 -0700 (PDT)
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
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <0577c62d-b349-6a60-d8bc-5b23a74342e0@suse.com>
In-Reply-To: <0577c62d-b349-6a60-d8bc-5b23a74342e0@suse.com>
Subject: RE: [PATCH 07/12] evtchn: cut short evtchn_reset()'s loop in the common case
Date: Tue, 29 Sep 2020 18:16:27 +0100
Message-ID: <003101d69684$44ae4750$ce0ad5f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgI+kJZ0qTXRsVA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 12:00
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 07/12] evtchn: cut short evtchn_reset()'s loop in the common case
> 
> The general expectation is that there are only a few open ports left
> when a domain asks its event channel configuration to be reset.
> Similarly on average half a bucket worth of event channels can be
> expected to be inactive. Try to avoid iterating over all channels, by
> utilizing usage data we're maintaining anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -232,7 +232,11 @@ void evtchn_free(struct domain *d, struc
>      evtchn_port_clear_pending(d, chn);
> 
>      if ( consumer_is_xen(chn) )
> +    {
>          write_atomic(&d->xen_evtchns, d->xen_evtchns - 1);
> +        /* Decrement ->xen_evtchns /before/ ->active_evtchns. */
> +        smp_wmb();
> +    }
>      write_atomic(&d->active_evtchns, d->active_evtchns - 1);
> 
>      /* Reset binding to vcpu0 when the channel is freed. */
> @@ -1073,6 +1077,19 @@ int evtchn_unmask(unsigned int port)
>      return 0;
>  }
> 
> +static bool has_active_evtchns(const struct domain *d)
> +{
> +    unsigned int xen = read_atomic(&d->xen_evtchns);
> +
> +    /*
> +     * Read ->xen_evtchns /before/ active_evtchns, to prevent
> +     * evtchn_reset() exiting its loop early.
> +     */
> +    smp_rmb();
> +
> +    return read_atomic(&d->active_evtchns) > xen;
> +}
> +
>  int evtchn_reset(struct domain *d, bool resuming)
>  {
>      unsigned int i;
> @@ -1097,7 +1114,7 @@ int evtchn_reset(struct domain *d, bool
>      if ( !i )
>          return -EBUSY;
> 
> -    for ( ; port_is_valid(d, i); i++ )
> +    for ( ; port_is_valid(d, i) && has_active_evtchns(d); i++ )
>      {
>          evtchn_close(d, i, 1);
> 
> @@ -1340,6 +1357,10 @@ int alloc_unbound_xen_event_channel(
> 
>      spin_unlock_irqrestore(&chn->lock, flags);
> 
> +    /*
> +     * Increment ->xen_evtchns /after/ ->active_evtchns. No explicit
> +     * barrier needed due to spin-locked region just above.
> +     */
>      write_atomic(&ld->xen_evtchns, ld->xen_evtchns + 1);
> 
>   out:
> 



