Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43B27E2BD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 09:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.458.1433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNWgL-00069C-1U; Wed, 30 Sep 2020 07:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458.1433; Wed, 30 Sep 2020 07:37:45 +0000
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
	id 1kNWgK-00068n-UJ; Wed, 30 Sep 2020 07:37:44 +0000
Received: by outflank-mailman (input) for mailman id 458;
 Wed, 30 Sep 2020 07:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNWgJ-00068i-Ew
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:37:43 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8838c02-2544-4372-8c01-db2b0ab4a785;
 Wed, 30 Sep 2020 07:37:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g4so594670wrs.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:37:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id o15sm1201403wmh.29.2020.09.30.00.37.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 00:37:41 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNWgJ-00068i-Ew
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:37:43 +0000
X-Inumbo-ID: b8838c02-2544-4372-8c01-db2b0ab4a785
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b8838c02-2544-4372-8c01-db2b0ab4a785;
	Wed, 30 Sep 2020 07:37:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g4so594670wrs.5
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=eK+E7jNgnPd7cRL+3cDdSESoS/pHOLivwO5LL3/fbbs=;
        b=fZdLviQAX3iZFE1NN7vIejNmBFJsBYcPe7WFsb9ZPp+1wmdUzTA+gBFrLd3h78aeWZ
         YdR5Fojt9u+fkhX0zg5JYZzwWgHWx/Xgc0jVVgoDvtGXJ/hUBfCF+cQZsh0lS627vKLI
         Yy8rLEYRuaewvK0WjxM0SEUypVfr7rLK2pu0HxsH4pQV+tDtRYd7D3ou5GAKhyAnL4dL
         ul0fW4fcnVYquwwED4UvGZaR8ug5VL7ArRnMZuIOG7S0blEEHvJbGjWmiMTocDDcKm4C
         6mlnLH4QtdTl5GbyEfYHRCYHmUluvdKNEuhdGeST70djdFsY2m9rQrIKYjVB0kVDC/pg
         p9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=eK+E7jNgnPd7cRL+3cDdSESoS/pHOLivwO5LL3/fbbs=;
        b=mbEz8vGQgy+jac/DPu8O3hyyUKFJEJKYMbn5hB/VxgrPyhPVFBE+adg7QZ0G9eyeSU
         8jHFE4Dl7/bS1sjDEveTWsfXE9eje06J+T+shyPnKhNNY/fXlY6VX4o2kGh2plNg+gIH
         G66WJyurhkFC7xgpWMqxj9/ZB2a7rz2CDiIR0afcI1HwRlkX17uaZtdUvZYokj9Nix8j
         2mzk+f+2aXzuCcH5DJ73q+bmGLsxt8a80vv7cN87fhqOgJqQ4+FQ2JxFGsgMR0zuC1U5
         McCs8X086aXwIjxS77XSaduo/qzKtO65ezjTjb/JCiFQmg5Sq6TrCP3XKqfXKpFcZ4xn
         Obow==
X-Gm-Message-State: AOAM532iABjH/GtCdivN2v9q7QwPd6B3zADps4EbUoWY4QX0rp9k+tBY
	vWn9lk1b5YqFmugau4MQylw=
X-Google-Smtp-Source: ABdhPJyKZkpPPRRTdUcQT1w/R1lMI9n1CbEnawG8FMjbA7HuQNFMbkfx98LwN+HimGQwUJAHS7rjFg==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr1672606wri.292.1601451461701;
        Wed, 30 Sep 2020 00:37:41 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id o15sm1201403wmh.29.2020.09.30.00.37.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 00:37:41 -0700 (PDT)
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
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
In-Reply-To: <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
Subject: RE: [PATCH 09/12] evtchn: move FIFO-private struct declarations
Date: Wed, 30 Sep 2020 08:37:39 +0100
Message-ID: <004601d696fc$93d800a0$bb8801e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgLI/pGjqTF/8YA=



> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 12:01
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 09/12] evtchn: move FIFO-private struct declarations
> 
> There's no need to expose them.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder whether we shouldn't do away with event_fifo.h altogether.
> 

+1

I can't see why it needs to exist. 2l doesn't have a header.

  Paul

> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -21,6 +21,27 @@
> 
>  #include <public/event_channel.h>
> 
> +struct evtchn_fifo_queue {
> +    uint32_t *head; /* points into control block */
> +    uint32_t tail;
> +    uint8_t priority;
> +    spinlock_t lock;
> +};
> +
> +struct evtchn_fifo_vcpu {
> +    struct evtchn_fifo_control_block *control_block;
> +    struct evtchn_fifo_queue queue[EVTCHN_FIFO_MAX_QUEUES];
> +};
> +
> +#define EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (PAGE_SIZE / sizeof(event_word_t))
> +#define EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES \
> +    (EVTCHN_FIFO_NR_CHANNELS / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE)
> +
> +struct evtchn_fifo_domain {
> +    event_word_t *event_array[EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES];
> +    unsigned int num_evtchns;
> +};
> +
>  static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>                                                         unsigned int port)
>  {
> --- a/xen/include/xen/event_fifo.h
> +++ b/xen/include/xen/event_fifo.h
> @@ -9,27 +9,6 @@
>  #ifndef __XEN_EVENT_FIFO_H__
>  #define __XEN_EVENT_FIFO_H__
> 
> -struct evtchn_fifo_queue {
> -    uint32_t *head; /* points into control block */
> -    uint32_t tail;
> -    uint8_t priority;
> -    spinlock_t lock;
> -};
> -
> -struct evtchn_fifo_vcpu {
> -    struct evtchn_fifo_control_block *control_block;
> -    struct evtchn_fifo_queue queue[EVTCHN_FIFO_MAX_QUEUES];
> -};
> -
> -#define EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (PAGE_SIZE / sizeof(event_word_t))
> -#define EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES \
> -    (EVTCHN_FIFO_NR_CHANNELS / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE)
> -
> -struct evtchn_fifo_domain {
> -    event_word_t *event_array[EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES];
> -    unsigned int num_evtchns;
> -};
> -
>  int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>  int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>  void evtchn_fifo_destroy(struct domain *domain);
> 



