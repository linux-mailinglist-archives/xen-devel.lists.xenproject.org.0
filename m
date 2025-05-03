Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310DAA8251
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 21:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975433.1362909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBIJQ-0000zB-Jb; Sat, 03 May 2025 19:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975433.1362909; Sat, 03 May 2025 19:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBIJQ-0000x3-Go; Sat, 03 May 2025 19:14:12 +0000
Received: by outflank-mailman (input) for mailman id 975433;
 Sat, 03 May 2025 19:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BGFl=XT=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1uBIJP-0000wx-5x
 for xen-devel@lists.xenproject.org; Sat, 03 May 2025 19:14:11 +0000
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8eb5bf1-2852-11f0-9ffb-bf95429c2676;
 Sat, 03 May 2025 21:14:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZqcsV3dB1zm0yTv;
 Sat,  3 May 2025 19:14:06 +0000 (UTC)
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DqXzoqknLYju; Sat,  3 May 2025 19:13:58 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net
 [73.231.117.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZqcrR2bKbzm0yMS;
 Sat,  3 May 2025 19:13:09 +0000 (UTC)
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
X-Inumbo-ID: c8eb5bf1-2852-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1746299638; x=1748891639; bh=INtqWdF1ttpcGxLYcmEEmkHc
	r1sBjwlLz2bhiN/ZlGY=; b=RKuStUz1pg6Z4V5+H5A4kb2tpH0qoqhbIkzY5+Di
	0Mx4FqbPL+wKIdXv00tSUygKf7k37efg+NegA9USEA+BtS9sCBdNxuJsDmcEZkXo
	KGK//P45RgKzu8d8/alXy0VIGoamRPWPYuJuGoA+pRvHTZS5rvfZ8o0ph1X5HX6J
	iTP5Of7qhYNNVXT8DuQLC0J7+xnCouyLt/xHnb0fNLYt31jsZFJ6Oj4CRIgSwz0L
	IaOUfuFPOR6U+kODE48fdLjKvbhtxcv8R6c3Ms1Bh+fzGYiKJWiOfkB3GG1TY+aB
	jrLZOMGZ2glyEj1WRg+H+/FJlug51RvdD9ZeWxSGVVTS0g==
X-Virus-Scanned: by MailRoute
Message-ID: <08163d8b-4056-4b84-82a1-3dd553ee6468@acm.org>
Date: Sat, 3 May 2025 12:13:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/8] kernel-hacking: introduce
 CONFIG_NO_AUTO_INLINE
To: Brendan Jackman <jackmanb@google.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, chenlinxuan@uniontech.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Sagi Grimberg <sagi@grimberg.me>, Andrew Morton <akpm@linux-foundation.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-integrity@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 Winston Wen <wentao@uniontech.com>, kasan-dev@googlegroups.com,
 xen-devel@lists.xenproject.org, Changbin Du <changbin.du@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
 <20250429123504.GA13093@lst.de> <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com>
 <20250501150229.GU4439@noisy.programming.kicks-ass.net>
 <D9KXE2YX8R2M.3L7Q6NVIXKPE9@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <D9KXE2YX8R2M.3L7Q6NVIXKPE9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/25 8:22 AM, Brendan Jackman wrote:
> Personally I sometimes spam a bunch of `noinline` into code
> I'm debugging so this seems like a way to just slap that same thing on
> the whole tree without dirtying the code, right?

If this is for test builds only, has it been consider to add
-fno-inline-functions as a local change in the top-level Makefile?

Bart.

