Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91C5B151F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 08:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402701.644549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBMH-0002nD-Um; Thu, 08 Sep 2022 06:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402701.644549; Thu, 08 Sep 2022 06:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBMH-0002lF-Rq; Thu, 08 Sep 2022 06:49:53 +0000
Received: by outflank-mailman (input) for mailman id 402701;
 Thu, 08 Sep 2022 06:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dixu=ZL=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oWBMG-0002l9-An
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 06:49:52 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f12c63e-2f42-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 08:49:50 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id g5so24930622ybg.11
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 23:49:50 -0700 (PDT)
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
X-Inumbo-ID: 6f12c63e-2f42-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6UU7RPsFxQr+5ujpTkN8WcG542NNzl57+boNHvVA5zY=;
        b=JG/SHVRfqPRHCrjuBmlApXDX/0abpJphKrT6tyZKJBPfjdSoDudABKV77zHlEN88Fn
         gauZaKg028mQXz4IhYxWZ6Al32CCP7yJWGueoM6BfqmIyFGbhNHc42e0XX3fkUwzZeB7
         iahq4zbGmhiQP33NCZ4T4eKaA3vZuTmEr9lnFAypcBd+txISnaxXaWXjTNPPmjg9GajS
         6tRoG+4jxmfz1oriGaY/Kn1wnCqhPvgpDkXyvbhPKfNgBFNHlvzvS89+D7eIK/a1Yl6T
         kxR18XZMyg4CCoy23A8LpUnI5xLUkeiu/ZUM9+hqU3uz7MWOC86ALqrtypYUZ97mcz9b
         OvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6UU7RPsFxQr+5ujpTkN8WcG542NNzl57+boNHvVA5zY=;
        b=CNIobWWDgFe0j4OZS/YD3JywJbf5ZOQHr4PwdWG4dRtbhQxZCuDJrWFS/vxsmsh8u5
         CaeRKdD3sDlp3dN6M/HAsEr9jy/5L1jEy9S3eYQMenLs0NDXw5HShPh/JTD00qNsKnbu
         W9dkoRYPjd9EPko6/MpebpVHfVsmSAmQFfyIjynZ4pbAo2qpBoRzMLk6xImejyQnCSkj
         04D/4FmLq6FhwJKAoxXjsmy+LBaHV89zFp+04bPbr0w2wS71jPBa+/iTJyzUUm59Oz7g
         WLy8MsafpVQd/copKl04wl5yLMMFqMR49lwxSZWp5mi8RxKWGPmG0LTxLS/bK0k7PvTP
         Ln4w==
X-Gm-Message-State: ACgBeo15GP+1nk713iEnc6iKdktLvTFb/xLDsUDpUYbzigTq7Lo929RX
	NOLV4ogVXSQly8yZuJFME412VLhm/xWPuZ+4s2aj+g==
X-Google-Smtp-Source: AA6agR5jgN0SarKose7cXaAc78GK8TgcCf+kCWZDJ6j/hZNw94xbAsDdKa9I2VH+YZqtbSZxUJOMS41d9AU0E7sKk2c=
X-Received: by 2002:a5b:cc4:0:b0:6ae:2a6c:59e6 with SMTP id
 e4-20020a5b0cc4000000b006ae2a6c59e6mr1980963ybr.59.1662619789134; Wed, 07 Sep
 2022 23:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <YxEE1vOwRPdzKxoq@dhcp22.suse.cz> <CAJuCfpHuzJGTA_-m0Jfawc7LgJLt4GztUUY4K9N9-7bFqJuXnw@mail.gmail.com>
 <20220901201502.sn6223bayzwferxv@moria.home.lan> <YxW4Ig338d2vQAz3@dhcp22.suse.cz>
 <20220905234649.525vorzx27ybypsn@kmo-framework> <Yxb1cxDSyte1Ut/F@dhcp22.suse.cz>
 <20220906182058.iijmpzu4rtxowy37@kmo-framework> <Yxh5ueDTAOcwEmCQ@dhcp22.suse.cz>
 <20220907130323.rwycrntnckc6h43n@kmo-framework> <20220907094306.3383dac2@gandalf.local.home>
 <20220908063548.u4lqkhquuvkwzvda@kmo-framework>
In-Reply-To: <20220908063548.u4lqkhquuvkwzvda@kmo-framework>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 7 Sep 2022 23:49:37 -0700
Message-ID: <CAJuCfpEQG3+d-45PXhS=pD6ktrmqNQQnpf_-3+c2CG7rzuz+2g@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.com>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	David Vernet <void@manifault.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com, 
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Benjamin Segall <bsegall@google.com>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	42.hyeyoo@gmail.com, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, jbaron@akamai.com, 
	David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 11:35 PM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Sep 07, 2022 at 09:45:18AM -0400, Steven Rostedt wrote:
> > On Wed, 7 Sep 2022 09:04:28 -0400
> > Kent Overstreet <kent.overstreet@linux.dev> wrote:
> >
> > > On Wed, Sep 07, 2022 at 01:00:09PM +0200, Michal Hocko wrote:
> > > > Hmm, it seems that further discussion doesn't really make much sense
> > > > here. I know how to use my time better.
> > >
> > > Just a thought, but I generally find it more productive to propose ideas than to
> > > just be disparaging.
> > >
> >
> > But it's not Michal's job to do so. He's just telling you that the given
> > feature is not worth the burden. He's telling you the issues that he has
> > with the patch set. It's the submitter's job to address those concerns and
> > not the maintainer's to tell you how to make it better.
> >
> > When Linus tells us that a submission is crap, we don't ask him how to make
> > it less crap, we listen to why he called it crap, and then rewrite to be
> > not so crappy. If we cannot figure it out, it doesn't get in.
>
> When Linus tells someone a submission is crap, he _always_ has a sound, and
> _specific_ technical justification for doing so.
>
> "This code is going to be a considerable maintenance burden" is vapid, and lazy.
> It's the kind of feedback made by someone who has looked at the number of lines
> of code a patch touches and not much more.

I would really appreciate if everyone could please stick to the
technical side of the conversation. That way we can get some
constructive feedback. Everything else is not helpful and at best is a
distraction.
Maintenance burden is a price we pay and I think it's the prerogative
of the maintainers to take that into account. Our job is to prove that
the price is worth paying.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

