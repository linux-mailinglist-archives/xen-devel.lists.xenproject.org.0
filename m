Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2710473965B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 06:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553258.863713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCBpV-00075o-1K; Thu, 22 Jun 2023 04:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553258.863713; Thu, 22 Jun 2023 04:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCBpU-00073m-Ub; Thu, 22 Jun 2023 04:21:56 +0000
Received: by outflank-mailman (input) for mailman id 553258;
 Thu, 22 Jun 2023 04:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A2R=CK=gmail.com=jirislaby@srs-se1.protection.inumbo.net>)
 id 1qCBpT-00073d-8M
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 04:21:55 +0000
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50cd5e74-10b4-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 06:21:53 +0200 (CEST)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-311394406d0so4220834f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 21:21:53 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a5d604a000000b0031272fced4dsm5942680wrt.52.2023.06.21.21.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 21:21:51 -0700 (PDT)
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
X-Inumbo-ID: 50cd5e74-10b4-11ee-b237-6b7b168915f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687407713; x=1689999713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ECnfbr1yMldiaqGJ4AwBQXH8Qu2uEGTBBXNGiQr9KY=;
        b=UheQtAB2b2u42Ax2LhmteLdivPLRPUiikgmqNO2xoEhmcqAmIVXOw0PuIp6m9M3rUd
         E3h8IpDxrvYi7lEPOpXSWL3wmDlcs0+CX499h1mC7SzHuwN6Kmv/ZGEYRPNgnkl72NgW
         aUxSRJmLbao7ztXl+/32DWMvOsqxrprufLcbeRXkeZceHssRLlrM3qXGk1WE/Lxb7Akb
         hKdSbQ0U9WzNYAjBxWAOhWpjlHvQxikYT1hK6nLGD6mY8xxCctAVhupyeVuCYMSpP8/N
         ArhmiYQfOZ3UKv7bgCAvHqDouyBNzLUivPFasmCnqo7GCg99AbQS8zzO7WG2PkFk0aWm
         9BBQ==
X-Gm-Message-State: AC+VfDyfg2VXM1ZmH8zn307gjtbU90+b8vVPMmcILCYISnrH5Ow/z+6o
	59Lkfr62a8Rv7BJsNNai+2Q=
X-Google-Smtp-Source: ACHHUZ6noBUR8iTvT8VR1EETx/SJbcA6a56KL+Jlcz/+OUxvfjHqkrQVqSA29+PLsepDYKMNhlEycQ==
X-Received: by 2002:a05:6000:10ce:b0:312:9eb6:33da with SMTP id b14-20020a05600010ce00b003129eb633damr17577wrx.20.1687407712404;
        Wed, 21 Jun 2023 21:21:52 -0700 (PDT)
Message-ID: <fc37eccc-b9b3-d888-6b57-78cd61986a11@kernel.org>
Date: Thu, 22 Jun 2023 06:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/11] sysctl: Add size to register_sysctl_init
Content-Language: en-US
To: Joel Granados <j.granados@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mcgrof@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
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
 <2023062150-outbound-quiet-2609@gregkh>
 <20230621131552.pqsordxcjmiopciq@localhost>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230621131552.pqsordxcjmiopciq@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21. 06. 23, 15:15, Joel Granados wrote:
> On Wed, Jun 21, 2023 at 12:47:58PM +0200, Greg Kroah-Hartman wrote:
>> On Wed, Jun 21, 2023 at 11:09:57AM +0200, Joel Granados wrote:
>>>   static int __init random_sysctls_init(void)
>>>   {
>>> -	register_sysctl_init("kernel/random", random_table);
>>> +	register_sysctl_init("kernel/random", random_table,
>>> +			     ARRAY_SIZE(random_table));
>>
>> As mentioned before, why not just do:
>>
>> #define register_sysctl_init(string, table)	\
>> 	__register_sysctl_init(string, table, ARRAY_SIZE(table);
> Answered you in the original mail where you suggested it.

I am curious what that was, do you have a link?

-- 
js
suse labs


