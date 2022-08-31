Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CAB5A827A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 17:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395832.635711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ4n-0007dE-Jw; Wed, 31 Aug 2022 15:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395832.635711; Wed, 31 Aug 2022 15:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ4n-0007bJ-HD; Wed, 31 Aug 2022 15:56:25 +0000
Received: by outflank-mailman (input) for mailman id 395832;
 Wed, 31 Aug 2022 15:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2E5=ZD=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTQ4l-0006yj-I9
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 15:56:23 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 759b266b-2945-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 17:56:22 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-33dce2d4bc8so311372277b3.4
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 08:56:22 -0700 (PDT)
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
X-Inumbo-ID: 759b266b-2945-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=cCRpuq5ugrZCMPNASqLzmnmQqSHwIbDaqesnsW6hpVY=;
        b=dp7ag/s/XswteEOQhIlZJ0Nr9OSh2piBWOaxYRC3sJJA1h7P9YiBLyTj5ZbqtTA5s/
         QVBATN/coisioHRuuIpGq3gJNfqJZeq14BoEa/ktEy7OjVkakgw2dN07PvsjfH2DKU0B
         bxLma1WzIl4FKw+quVea/qjMwPtAOmq0TevZHzdNCNncQhM1PD4uyKVu4HWZvLI6BqTx
         H7kaRy09fBu1xgcDeDqWrzFeKvin7yA3AAOKZ6MQsBsn3T/kb8YICvKVh7LgyXMq+5Bi
         FLuEciavzkBG7ruhxzyjiDdwLtfbNolH0swGrGj9z+IyuUE/sK6RMxqKOGNWiAhwfBa3
         5mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=cCRpuq5ugrZCMPNASqLzmnmQqSHwIbDaqesnsW6hpVY=;
        b=GZIIhwrGksC2yuZWGFDeRFIcZed7c5zV/vdS8bwWaA5px8ZF4UK7v/uimqVvOs3b0K
         YojICyLtcLZB0uy3bPkkNbbFQIdsOGgMCnLGQyez0dmEuYcvI8QJqVLumd/3rH40lt/J
         akjheXmQyQp7vKxpufT8NedxgTHZ/fFj7BktloNmP200Zoxezp1deZhsUpmivNcSFnUK
         E/RQDHC1EjmCJkEK2A+epTki3bnAdp+MTwFD01gKsJ/V4C9t4nOOR8wJ9P5+TxnXP02D
         4oIXZc+i61oPyQADom5fjJ28wEHX5EUUbLFsC6GdTue9rNL+yrmBOP8mpfBVpj/AU/kq
         JsHA==
X-Gm-Message-State: ACgBeo2HyAVf5PzMuDhOVJKMhQSYZtZWr8QQHDO+DecqgVcJQcVUR3F4
	W5oua5L7DStt664Ree0fxVFHrcnXucBYQ1Oe4+G9Iw==
X-Google-Smtp-Source: AA6agR7Lu6PK9CdXu23xIn3AG3MYNgxqZ4pzHv7Fy3xw9o0fL/gGGSH+N2uXtSf2ZsqL9IuP0dnF/6Y/gY//h7qjU0c=
X-Received: by 2002:a81:85c3:0:b0:33d:a4d9:4599 with SMTP id
 v186-20020a8185c3000000b0033da4d94599mr18562781ywf.237.1661961381492; Wed, 31
 Aug 2022 08:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <20220830214919.53220-23-surenb@google.com>
 <b252a4e0-57a1-0f27-f4b0-598e851b47ea@infradead.org>
In-Reply-To: <b252a4e0-57a1-0f27-f4b0-598e851b47ea@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 31 Aug 2022 08:56:10 -0700
Message-ID: <CAJuCfpFff1iVx50QeJWE7=sJUZ2enig34VTAOCz75u_SY2EXKw@mail.gmail.com>
Subject: Re: [RFC PATCH 22/30] Code tagging based fault injection
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mel Gorman <mgorman@suse.de>, 
	Davidlohr Bueso <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com, 
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Benjamin Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, dvyukov@google.com, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 30, 2022 at 6:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 8/30/22 14:49, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > This adds a new fault injection capability, based on code tagging.
> >
> > To use, simply insert somewhere in your code
> >
> >   dynamic_fault("fault_class_name")
> >
> > and check whether it returns true - if so, inject the error.
> > For example
> >
> >   if (dynamic_fault("init"))
> >       return -EINVAL;
> >
> > There's no need to define faults elsewhere, as with
> > include/linux/fault-injection.h. Faults show up in debugfs, under
> > /sys/kernel/debug/dynamic_faults, and can be selected based on
> > file/module/function/line number/class, and enabled permanently, or in
> > oneshot mode, or with a specified frequency.
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
>
> Missing Signed-off-by: from Suren.
> See Documentation/process/submitting-patches.rst:
>
> When to use Acked-by:, Cc:, and Co-developed-by:
> ------------------------------------------------
>
> The Signed-off-by: tag indicates that the signer was involved in the
> development of the patch, or that he/she was in the patch's delivery path.

Thanks for the note! Will fix in the next respin.

>
>
> --
> ~Randy

