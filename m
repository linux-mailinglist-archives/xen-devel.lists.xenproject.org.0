Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938BE739662
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 06:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553264.863724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCBso-0007g0-G0; Thu, 22 Jun 2023 04:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553264.863724; Thu, 22 Jun 2023 04:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCBso-0007dp-By; Thu, 22 Jun 2023 04:25:22 +0000
Received: by outflank-mailman (input) for mailman id 553264;
 Thu, 22 Jun 2023 04:25:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A2R=CK=gmail.com=jirislaby@srs-se1.protection.inumbo.net>)
 id 1qCBsn-0007dj-0y
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 04:25:21 +0000
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc08ec9d-10b4-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 06:25:19 +0200 (CEST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4f87592ecaeso5520903e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 21:25:19 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003f17848673fsm6553494wma.27.2023.06.21.21.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 21:25:18 -0700 (PDT)
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
X-Inumbo-ID: cc08ec9d-10b4-11ee-b237-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687407919; x=1689999919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5vC2aRsA2WDjAiqv/C0BR7ctU6hTo76uwUZaC8vGUs=;
        b=Yi8rHVOzf2rQQpLloKzuJ3iZzscTQus3+5cgb/ywYFaWFSOraizR3/5LSzDEuwoHnO
         d/ZPTeHMfPJzfDIwrjiwZzkdKvHaGjN2KdaZ3IW1BUDmfbcxgzlqdf67LfOUNWnoNHMC
         XDjJOE6/vLrbPy+82ZJTcbfqXF/6sLuc7/CUYUBc0sEFAJgfJB1m6zf7zFjMDmjvDcRn
         d0ZaCsfyvE/IbU818dgnySj8kdT5ShSWaEBRmd6+rqErwtZ67BsrK3FDHpQ1ZfzePuNS
         QdxMBFqLVniQM1JTfsq/TMQVNpSdb0IEeakLaHQzPsrZmAziz51GusRWyDhJc4Syl024
         Tz0Q==
X-Gm-Message-State: AC+VfDzaDrY9irFe/clJg5UJd6FGkn21ufYFw7sQyLSU1NR0cZSPIzIF
	gUcXDSzYMODF9HmToUHrPhs=
X-Google-Smtp-Source: ACHHUZ6mLLpZ2jzgBbisqW8BsQ34AJIZtXtyRLGlK/Pv18m3vLOsDnG3vORq9yee5CR+W4060ihrFA==
X-Received: by 2002:a05:6512:313c:b0:4f9:566f:1aab with SMTP id p28-20020a056512313c00b004f9566f1aabmr3597524lfd.29.1687407919067;
        Wed, 21 Jun 2023 21:25:19 -0700 (PDT)
Message-ID: <68038b83-3221-e351-909c-7f2722b612df@kernel.org>
Date: Thu, 22 Jun 2023 06:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/11] sysctl: Add size to register_sysctl_init
Content-Language: en-US
To: Joel Granados <j.granados@samsung.com>
Cc: mcgrof@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Benjamin LaHaise <bcrl@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Balbir Singh <bsingharora@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Amir Goldstein <amir73il@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Ogness <john.ogness@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
 Mark Rutland <mark.rutland@arm.com>, Miaohe Lin <linmiaohe@huawei.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 bpf@vger.kernel.org, kexec@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621091037eucas1p188e11d8064526a5a0549217d5a419647@eucas1p1.samsung.com>
 <20230621091000.424843-9-j.granados@samsung.com>
 <36fae2b0-4cd2-58b5-cc12-9abdd5ce235b@kernel.org>
 <20230621131147.c3jegl4hgjplcrpu@localhost>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230621131147.c3jegl4hgjplcrpu@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21. 06. 23, 15:11, Joel Granados wrote:
> On Wed, Jun 21, 2023 at 11:56:03AM +0200, Jiri Slaby wrote:
>> On 21. 06. 23, 11:09, Joel Granados wrote:
>>> In order to remove the end element from the ctl_table struct arrays, we
>>> explicitly define the size when registering the targes. We add a size
>>> argument to the register_sysctl_init call and pass an ARRAY_SIZE for all
>>> the callers.
>>
>> Hi, I am missing here (or in 00/00) _why_ you are doing that. Is it by a
> Not sure what happened. I used the kernels get_maintainers.pl script
> together with git-send-email. These are my settings:
> 
> "
> tocmd ="`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback --norolestats --m --nol --nor"
> cccmd ="`pwd`/scripts/get_maintainer.pl --nogit --nogit-fallback --norolestats --l --r --nom"
> "
> 
> Could it be that there is an error in MAINTAINERS?

Sorry, I don't see what you are asking about. I was asking about 
motivation behind the series. That is a must in commit logs.

thanks,
-- 
js
suse labs


