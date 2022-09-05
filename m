Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC95AD8D5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 20:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399113.640170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGWR-0002cA-Lw; Mon, 05 Sep 2022 18:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399113.640170; Mon, 05 Sep 2022 18:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGWR-0002Yi-HV; Mon, 05 Sep 2022 18:08:35 +0000
Received: by outflank-mailman (input) for mailman id 399113;
 Mon, 05 Sep 2022 18:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Tfq=ZI=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oVGWQ-0002V4-Mc
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 18:08:34 +0000
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1045709-2d45-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 20:08:34 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id s11so4935141ilt.7
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 11:08:33 -0700 (PDT)
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
X-Inumbo-ID: c1045709-2d45-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hbTvjCqXtfZwCNAPDugxhLvbO4tPW4uXsytclFMPf88=;
        b=BWl6tEU0Jv/5Ok7izOy2X+2XFHIjW2yJwE8yMIwADusWnEOeQC8si1U6iks3IFTXtR
         5tbbeyYCmyTiKFNMcU3D2cV+gb/s5ohOcUII9kU6FU7ji/Zh8BrlwKsCQaRcerXV6BGZ
         8PlGGmZZYHPvdH+WgSsyR10w9r/j2bW/3D0lAGkx1tIn87fB5RB3pcjDyqMnvPGCsyas
         uH/yoycyrf5kaO5p9L7J37V/vDYJvxKCrEBpA8AorAMThecIv/vXA5VLdyTk9mhWPhlm
         xhk4J8Awk+fBDhqAh5Kc3xuDELqvWV7xGoRQ08TJNeQzRqgNOVW6ruxsZF0Lyj7+Dw3B
         m0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hbTvjCqXtfZwCNAPDugxhLvbO4tPW4uXsytclFMPf88=;
        b=KmxPidMrdXHyzghvYEE28ZN0F2ypzTETgVkhIshJ8oF+f2sVoT23RD+39D/Ccga4xI
         wFgzHU2tI6DA73lFXrGkstiCKUjVvXVGlnUDOOK19jxX5IoI9rMDZLS8CHbZWUKEpGl7
         zYLDmS84qP0YjuhcyLcen5gik3vE9ZGtnNHwhgwzZROMF7Dl/MHwkfLURSA6n2j1OOtZ
         HyaB/m3z0xLQOvbGvknMAMzk4U6gSKL6zOxIiUKeBdS5T16sBemGoCKFTBBRDYEuvh2f
         0peQHrOcBxlvX0mcLz+6WmG915JoJ0sO2SEwHr+uU0eKeDdrFOPgbp0u3swVA1Cpn0oe
         bEcQ==
X-Gm-Message-State: ACgBeo1ux6ZfSENqrsaVXoNasbFyz9vs8rIoTeDVkb8C3RJCYbUAGnQG
	ST3CgHThiVFjfNbtV4nwNGETsOkSDWAf1bAc+fhllQ==
X-Google-Smtp-Source: AA6agR4Rv/lC85vS43o4ySf3NvmJunla0lbszDaoWXhv+p4vulk9P6WBBoE0T5B+Wry+ZoXPm1CE94n4VZxipIKzyxQ=
X-Received: by 2002:a92:ca06:0:b0:2eb:391a:a2a4 with SMTP id
 j6-20020a92ca06000000b002eb391aa2a4mr16719486ils.199.1662401312639; Mon, 05
 Sep 2022 11:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz> <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz> <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
 <20220905110713.27304149@gandalf.local.home>
In-Reply-To: <20220905110713.27304149@gandalf.local.home>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 Sep 2022 11:08:21 -0700
Message-ID: <CAJuCfpF-O6Gz2o7YqCgFHV+KEFuzC-PTUoBHj25DNRkkSmhbUg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Hocko <mhocko@suse.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Benjamin Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 8:06 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Sun, 4 Sep 2022 18:32:58 -0700
> Suren Baghdasaryan <surenb@google.com> wrote:
>
> > Page allocations (overheads are compared to get_free_pages() duration):
> > 6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
> > 8.8% lookup_page_ext
> > 1237% call stack capture
> > 139% tracepoint with attached empty BPF program
>
> Have you tried tracepoint with custom callback?
>
> static void my_callback(void *data, unsigned long call_site,
>                         const void *ptr, struct kmem_cache *s,
>                         size_t bytes_req, size_t bytes_alloc,
>                         gfp_t gfp_flags)
> {
>         struct my_data_struct *my_data = data;
>
>         { do whatever }
> }
>
> [..]
>         register_trace_kmem_alloc(my_callback, my_data);
>
> Now the my_callback function will be called directly every time the
> kmem_alloc tracepoint is hit.
>
> This avoids that perf and BPF overhead.

Haven't tried that yet but will do. Thanks for the reference code!

>
> -- Steve

