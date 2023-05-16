Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A5705649
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 20:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535450.833161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzgd-0008Vd-Lt; Tue, 16 May 2023 18:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535450.833161; Tue, 16 May 2023 18:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyzgd-0008Th-I7; Tue, 16 May 2023 18:46:15 +0000
Received: by outflank-mailman (input) for mailman id 535450;
 Tue, 16 May 2023 18:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyzgb-0008Tb-Ac
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 18:46:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb40b857-f419-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 20:46:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E74B63DDE;
 Tue, 16 May 2023 18:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03A2C433EF;
 Tue, 16 May 2023 18:46:05 +0000 (UTC)
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
X-Inumbo-ID: eb40b857-f419-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684262766;
	bh=1Y2StiZOojJk/Xg/VTyj/LVT3Er3HprFlZgifKkAtW8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ItI/DVGnVZCAb9XdzTBz+uWME/BrzEyL9EyDhdDpdOYrRQ7zvLjCt2z9JZiiNsAHb
	 46X6Lwpd6cnW53kBEQzbdX/CEZp2r2OJz4ozZpL0X+rp1ue5QEhBl3ACk0hTGjBvGL
	 d+UO6f8nMS3tOI5L+lzVXBwKmofix/9P4jK3Wn3ftgXMR9eNW04VHfP6I+DPSMph/J
	 k33g3keARRuLXdqp5gv557y0Yf5c5TWtWdqdGfM8yHuWFKAnzdFiEIgSnkE985jwxT
	 58P2Tq6rr2PPhjYvbAP+fkGAlP8WhDkjGaDg2i3df4dXqdLNCEeHUrM0z6YTu/df/K
	 s3qbALaeD4yQg==
Date: Tue, 16 May 2023 11:46:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: provide example for downloading an existing
 container
In-Reply-To: <20230516105155.0c59143a@sender>
Message-ID: <alpine.DEB.2.22.394.2305161145540.62578@ubuntu-linux-20-04-desktop>
References: <20230502201444.6532-1-olaf@aepfle.de> <alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop> <20230516105155.0c59143a@sender>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 May 2023, Olaf Hering wrote:
> Am Mon, 15 May 2023 16:03:01 -0700 (PDT)
> schrieb Stefano Stabellini <sstabellini@kernel.org>:
> 
> > Given that opensuse-tumbleweed is still broken (doesn't complete the
> > Xen build successfully) even after these patches, I suggest we use a
> > different example?
> 
> I think the example in automation/build/README.md needs to be fixed.
> Right now it does something different than the Gitlab CI.
> 
> The CI runs automation/scripts/build with some environment variables
> set, the example runs automation/scripts/containerize.
 
I think you have a point that automation/build/README.md should also
describe how to do what gitlab-ci does but locally (i.e. call
automation/scripts/build). It should not only describe
automation/scripts/containerize.

 
> For me qemu-xen builds, I assume it is supposed to be 'master ==
> "8c51cd9705 (HEAD -> dummy, origin/staging, origin/master, origin/HEAD,
> master) hw/xen/xen_pt: fix uninitialized variable", but we do not know
> what GI tests, because scripts/git-checkout.sh does not show what HEAD
> actually is. I think it needs to run "$GIT --no-pager log --oneline
> -n1" at the end, so everyone knows what 'dummy' actually is.

Gitlab-ci only runs automation/scripts/build which builds QEMU as part
of a regular Xen build.

If you want to see details of a failure:
https://gitlab.com/xen-project/xen/-/jobs/4284741849

---
In file included from /builds/xen-project/xen/tools/qemu-xen-dir-remote/include/qemu/coroutine.h:18,
                 from /builds/xen-project/xen/tools/qemu-xen-dir-remote/include/block/aio.h:20,
                 from ../qemu-xen-dir-remote/util/async.c:28:
../qemu-xen-dir-remote/util/async.c: In function 'aio_bh_poll':
/builds/xen-project/xen/tools/qemu-xen-dir-remote/include/qemu/queue.h:303:22: error: storing the address of local variable 'slice' in '*ctx.bh_slice_list.sqh_last' [-Werror=dangling-pointer=]
  303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
      |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
../qemu-xen-dir-remote/util/async.c:161:5: note: in expansion of macro 'QSIMPLEQ_INSERT_TAIL'
  161 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
      |     ^~~~~~~~~~~~~~~~~~~~
../qemu-xen-dir-remote/util/async.c:156:17: note: 'slice' declared here
  156 |     BHListSlice slice;
      |                 ^~~~~
../qemu-xen-dir-remote/util/async.c:154:29: note: 'ctx' declared here
  154 | int aio_bh_poll(AioContext *ctx)
      |                 ~~~~~~~~~~~~^~~
cc1: all warnings being treated as errors
---

> I think it is perfectly fine that both examples refer to Tumbleweed,
> because one may need to fix future build errors, not test on something
> from which we already know that it works.

Sure I see your point. On the other hand Tumbleweed jobs are the ones
and only with "allow_failure". So among all the possible choices as
example, do we really need to pick the one and only that has been
failing for months? :-)

