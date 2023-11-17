Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E357EEA90
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 02:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634788.990296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nId-0002OU-TM; Fri, 17 Nov 2023 01:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634788.990296; Fri, 17 Nov 2023 01:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nId-0002Mf-QA; Fri, 17 Nov 2023 01:05:35 +0000
Received: by outflank-mailman (input) for mailman id 634788;
 Fri, 17 Nov 2023 01:05:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nIb-0002MZ-Lb
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 01:05:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67b3e6c6-84e5-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 02:05:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7F3A6B81DF9;
 Fri, 17 Nov 2023 01:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7BBC433CA;
 Fri, 17 Nov 2023 01:05:30 +0000 (UTC)
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
X-Inumbo-ID: 67b3e6c6-84e5-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700183130;
	bh=y5hA3OIyjM3FGXQiQJZ0GgRRUAPkCMdb9P5Fj71ap0M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GRZfJBa9hmvg70SPD++lTvMf2O80ZN8sNKqIxbyBbKBBJGn39UDLxGWYvrE0t9WUZ
	 BZd31c31fvsuOeXI5tig83uHxhEQCEWzPkncjS4HSpK03SnRX1pbxVB0EkwcttjWdU
	 YWpgtutb/XJXrdHdjCr1waPKwlkvY7GRzC+5WIi0LoVZ+rK0Zw6nqbYsvFZPgkmjpg
	 UKpbTzwTkNXZbXoauFeVCkzzW+WAYjeDh+RDWnTde3wj0aWtwP23cLmKTULuLIN9MN
	 fnZFMCxnVyJrpzc0Yr59xTiMQEpHFWTRn+TcpG/ZCe6CbUmkM+YCp/lpjBc8ubezeL
	 12kS+Vi2on34w==
Date: Thu, 16 Nov 2023 17:05:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/6] automation: remove CR characters from QEMU serial
In-Reply-To: <20231116121310.72210-2-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311161701420.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-2-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-913588650-1700183115=:773207"
Content-ID: <alpine.DEB.2.22.394.2311161705260.773207@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-913588650-1700183115=:773207
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311161705261.773207@ubuntu-linux-20-04-desktop>

On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> The gitlab CI webpage seems to have issues displaying the \CR\CR\LF "\r\r\n"
> sequence on the web interface used as line returns by the Linux kernel serial
> output.  This leads to the QEMU tests output looking like:
> 
> (XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 664kB init memory
> mapping kernel into physical memory
> about to get started...
> qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)
> 
> This not helpful, so strip the CR characters from the output that goes to
> stdout, leaving the output in the smoke.serial untouched.
> 
> Fixes: 3030a73bf849 ('automation: add a QEMU based x86_64 Dom0/DomU test')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for the patch. Let me see if I understood correctly.

In the gitlab web UI everything after the last (XEN) log line
disappears, for instance:

https://gitlab.com/xen-project/xen/-/jobs/5556551478

(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
/ # qemu-system-aarch64: terminating on signal 15 from pid 145 (timeout)


While if I look at the full logs there are plenty of Linux kernel logs
after it:
https://cdn.artifacts.gitlab-static.net/ec/ad/ecad5145a0ec1eb179fd47d1590d5ec43d705e8af2f9a816607ac31891cb82b9/2023_11_16/5556551478/6032156805/job.log?response-content-type=text%2Fplain%3B%20charset%3Dutf-8&response-content-disposition=inline&Expires=1700183635&KeyName=gprd-artifacts-cdn&Signature=vT8CBwI2Th23OvRvQKvNPgHiT5Y=

And this patch aims at fixing that, is that correct?


But I went to check your pipeline
https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137
and the corresponding job
https://gitlab.com/xen-project/people/royger/xen/-/jobs/5549620441 has
the same issue?







> ---
>  automation/scripts/qemu-alpine-x86_64.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 8c8d0b0cd759..a1c41c030a47 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -84,7 +84,10 @@ qemu-system-x86_64 \
>      -monitor none -serial stdio \
>      -nographic \
>      -device virtio-net-pci,netdev=n0 \
> -    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
> +    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
> +        # Remove carriage returns from the stdout output, as gitlab
> +        # interface chokes on them
> +        tee smoke.serial | sed 's/\r//'
>  
>  set -e
>  (grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
> -- 
> 2.42.0
> 
--8323329-913588650-1700183115=:773207--

