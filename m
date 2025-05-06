Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2FCAAB87C
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 08:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976646.1363842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCBu4-0002p1-Ar; Tue, 06 May 2025 06:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976646.1363842; Tue, 06 May 2025 06:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCBu4-0002lp-4u; Tue, 06 May 2025 06:35:44 +0000
Received: by outflank-mailman (input) for mailman id 976646;
 Tue, 06 May 2025 02:41:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrwm=XW=uniontech.com=chenlinxuan@srs-se1.protection.inumbo.net>)
 id 1uC8FN-0008H2-0X
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 02:41:29 +0000
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95b42aea-2a23-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 04:41:22 +0200 (CEST)
Received: from mail-yb1-f171.google.com ( [209.85.219.171])
 by bizesmtp.qq.com (ESMTP) with SMTP id 0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 10:41:11 +0800 (CST)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e6e1cd3f1c5so4199383276.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 19:41:12 -0700 (PDT)
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
X-Inumbo-ID: 95b42aea-2a23-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746499275;
	bh=dDn4W5v9t6AyHBHxLWO7FuLjj98KbpZnLxWf1Zria3s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=n8r4R3u7gzqMxHc2aQ3peYjPOWOKjtBW9b6RgtRAJNk6dHbpxJUR6DPrZeBXWPSF+
	 GczkkIOhC7KbRR9T2Skwi+6r4ccDpcJQF645RYV3AIcSq6bm92mzpeTq02mh5qfw7h
	 qDLlodeU0Vqb3lAfPTGJoozZFJW/oNaQXlsuI5BE=
X-QQ-mid: esmtpsz17t1746499273t630b486b
X-QQ-Originating-IP: 4wO1RVpWYuRmz1iqaXDmgWdmyHXV9qrlyAfAABcWJFU=
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17737050764760768362
X-Forwarded-Encrypted: i=1; AJvYcCUGXp1kBSkowvVxMJblx8erT58a8VX6M1MkWy+OEjoEi4Gel8nF2tKgs72C0MfkOXD9YWY4zwcr6/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzebVtWAqvEUuTSIXBPIwaN+Hor+QOmLgd2pj8IHXdLZqgaJrQo
	AEp/wVU3qM0TZmbPzcN+tGyAtX/09yeKP+lG7saWO4QmnFDS626NmRJojwUgLltDzSAIXSjc+wM
	0yI1PAC08mBvQMuBIbrGNGKicwi4=
X-Google-Smtp-Source: AGHT+IFgFFlMacdloLtgDC8BYlif3b1M5uLk0pWcJg25Fujp9vccWuhfsfXobAggGBnTnNta+8cIxYeCcW4lzf1hqZQ=
X-Received: by 2002:a05:6902:1ac5:b0:e6d:f3ca:3e15 with SMTP id
 3f1490d57ef6-e75c08b698bmr1960395276.3.1746499270786; Mon, 05 May 2025
 19:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
 <20250429123504.GA13093@lst.de> <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com>
 <20250501150229.GU4439@noisy.programming.kicks-ass.net> <D9KXE2YX8R2M.3L7Q6NVIXKPE9@google.com>
 <08163d8b-4056-4b84-82a1-3dd553ee6468@acm.org>
In-Reply-To: <08163d8b-4056-4b84-82a1-3dd553ee6468@acm.org>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 6 May 2025 10:40:59 +0800
X-Gmail-Original-Message-ID: <973B455678FC1BDD+CAC1kPDM2pUEwFRiUZFHKq_7sYpjARkFczJnp_FRu+r9-xYdgKg@mail.gmail.com>
X-Gm-Features: ATxdqUHhA0M6lhr1xavQzClQ8qzartLkG1qHh9aYbVlX-6LFgZ39KxjHPoTQnkI
Message-ID: <CAC1kPDM2pUEwFRiUZFHKq_7sYpjARkFczJnp_FRu+r9-xYdgKg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/8] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE
To: Bart Van Assche <bvanassche@acm.org>
Cc: Brendan Jackman <jackmanb@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Christoph Hellwig <hch@lst.de>, chenlinxuan@uniontech.com, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	Andrew Morton <akpm@linux-foundation.org>, Yishai Hadas <yishaih@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-integrity@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Winston Wen <wentao@uniontech.com>, kasan-dev@googlegroups.com, 
	xen-devel@lists.xenproject.org, Changbin Du <changbin.du@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: OH9BrnvZTfElGrk0Q+UcGL13NtIpBrfmPUi86ZY2KkfllqNFAYDgaUPV
	VZvCUUzOCij0nuQiYaPOgDiTD4unvG1IRatUdaoxL77lni/qTmQdoy/ziJTVvwQPRQCLSP+
	UWVPnBF3hxTykpaxkHQISpwNN5S4GTx8C/HvRPede4zDvdp40TBIg9pfQMQDoNOJQaYGIGu
	o9mbDBzIuiIVI/VXuY5xd+RH1iuWNUdibI0sAQh3as12Ue27r7JgCFBDeshb4L9pURKODNv
	OtK0AzvBPtoq/JyPjHBU9zjdJKALP6GXt7xfiueG03xs50BR8Mexq7F0rLNHMqmmW3z4mRS
	xLlB73rspaiZBp6Tj4IBXyG001C90qyMj43tdJlq/2W9VWzO1EeH0s27fOaVqibkhcVxgry
	o5v3McDa3EBRjZ7QJhHKbKpoa/0wCBvSKT1bs791DWg/NFzS6Hu32t8/a4kcIzArmC4NN5M
	pAxdaq2aOqOYn2JPEEMs67SsMKjaOeO2x821QgQ+UFr6I8pYG1fXU513x+NwPf0oqk2xXlx
	y+VhTq58W6Bv/QMwdP0F4yvqsfy/uyIU/ILOfYLMkxD91IDUU71/vdf6NKwinH1ek0sKbd6
	Z7HfMdFfLfrcl+l1gEKLMT5cUuB5urXgAg6sg5YqL68P5qa45mSB3REQ9p9lJrLQWFbrY/U
	tLQeqwpgzyDyszI+BvZvMAxbZAM1XPwxuVAfp21i1gnnp34nH9fFfMTldYimu6rH3ThdHkQ
	XFYC3jMDZb2a92TDn+bS8pW9xPAnUBRpwJGrJAFW0cS0a1ZJccTWlybYMDCK6kWzyIs/5SF
	sZHWdHNl3DB2TLuEkAXXWRFN4JYxaCxpCfjGBnJ9EYBEU2qbS8XoK1y3ZW3Ow6FUZgUy4PU
	UoDVD2kRdiJ0cYSKho3png0ZnlCZmPKM0QL76MibOc2eJ+9wF6wn4KJxIDtQfI0Hif+TTB4
	kukqkk3URjYZqLHuZSAznNm1UHfwaudBIVl+BTnrwV0di1n8e6Z1Sx7VKy+XuNUBceE+R0A
	X20OZ1qxKLut4syR/+OtozPCutGkj413SvYNnA8kOzU/VdUY3P
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Sun, May 4, 2025 at 3:14=E2=80=AFAM Bart Van Assche <bvanassche@acm.org>=
 wrote:

> If this is for test builds only, has it been consider to add
> -fno-inline-functions as a local change in the top-level Makefile?

The issue here is that the current kernel cannot be compiled when
these compiler options that reduce inlining behavior are added.

