Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2896151B090
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 23:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321002.542006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmMXC-0003gQ-8E; Wed, 04 May 2022 21:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321002.542006; Wed, 04 May 2022 21:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmMXC-0003dT-4V; Wed, 04 May 2022 21:27:46 +0000
Received: by outflank-mailman (input) for mailman id 321002;
 Wed, 04 May 2022 21:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6ND=VM=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nmMX7-0003dN-Ri
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 21:27:44 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062a6930-cbf1-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 23:27:40 +0200 (CEST)
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nmMWW-0004FF-4B; Wed, 04 May 2022 23:27:04 +0200
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
X-Inumbo-ID: 062a6930-cbf1-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dpN78FnXP8xKsKthCe3ePYGrznnidWC78ijJKGIis+s=; b=VzNshjcWDWgTdIjmwACWbnjJ/H
	mQcB13lNG3fglzHQC/FUqdo2dvwKWsRAKNIc/TJuBa97Z8kYuf2lpVRvpBu62ga3ovDrsi08aDNiE
	OlqogXHjD4qsmKbgS2LbXN2AOGnhdCvdtCVo6IDt0imworVavUuV/zNlIT6mNaTQhnLm07TNtoK4m
	Ihl3ULKYuFP6cuYPQF485CZFlEA6oPcsLGDcH0IfHz/dstflDSmqrZB+ksN5MQ7uiQlVVpBT+K7Ib
	0RM9kXieFgdNepPjq9LySneGSuViPcHimXjyBUf5+knfLf159kvuFYr1c8xkwmLdvzZ/p8/HjZAHo
	dOADxIVQ==;
Message-ID: <976c2d62-09e7-9f8d-d978-12749a2f70e6@igalia.com>
Date: Wed, 4 May 2022 18:26:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 07/30] mips: ip22: Reword PANICED to PANICKED and remove
 useless header
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-edac@vger.kernel.org,
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
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-8-gpiccoli@igalia.com>
 <20220504203224.GA23475@alpha.franken.de>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220504203224.GA23475@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/05/2022 17:32, Thomas Bogendoerfer wrote:
> [...]
> 
> applied to mips-next.
> 
> Thomas.
> 

Thanks a bunch Thomas =)

