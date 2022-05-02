Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA13E517336
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 17:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318991.539030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlYIE-0006jP-Bk; Mon, 02 May 2022 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318991.539030; Mon, 02 May 2022 15:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlYIE-0006gL-8n; Mon, 02 May 2022 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 318991;
 Mon, 02 May 2022 15:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iax=VK=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nlYI9-0006gE-Uh
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 15:48:56 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce7e187-ca2f-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 17:48:52 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nlYHE-0006n9-M1; Mon, 02 May 2022 17:47:57 +0200
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
X-Inumbo-ID: 5ce7e187-ca2f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lSY7Wy5DSWONSGouYm7Vnq+8PpTXyI6/GSbK7cQgCdQ=; b=RlBNIlGd1Uln2EauUT9Bs8LHDK
	lsVxakNgNxOntg3zLwYjCz6zOIS7+wkzSqZEsUYLo84tU2IRVM3hBykPTK2LYoUlT7/mcdyUpbUFn
	8zsviqZPpC67uRPZkrddN0YT9DyHem+ksVhTVubBHX9U/sp2ORRnik8vQd9AygK72JtMh2IYdh8l4
	tTpjZfKpvJI67kl00fIHJVuD+e4FxpA6/fe+9WzqT6PUlM32LuzphP5qVuRzYjTVTCNB0OrF3F4Xd
	tFHwZ3zAtgZeXLXoEMwxv3kOugrwYBERBngMA0b8PvfrRDptBdxsqHAO3vzW13Xb6GPVwUXCxoyeQ
	X1mlzNhw==;
Message-ID: <baf65246-a012-93ad-1ba0-6c6d67e501b5@igalia.com>
Date: Mon, 2 May 2022 12:47:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/30] soc: bcm: brcmstb: Document panic notifier action
 and remove useless header
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
 alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com,
 dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
 gregkh@linuxfoundation.org, mikelley@microsoft.com,
 hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de,
 keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Justin Chen <justinpopo6@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Markus Mayer <mmayer@broadcom.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-7-gpiccoli@igalia.com>
 <a02821ab-db4f-5bff-2a98-7d74032a0652@gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <a02821ab-db4f-5bff-2a98-7d74032a0652@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2022 12:38, Florian Fainelli wrote:
> [...] 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Likewise, I am not sure if the Fixes tag is necessary here.

Perfect Florian, thanks!  I'll add your Acked-by tag and remove the
fixes for V2 =)
Cheers,


Guilherme

