Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB17CD22D6
	for <lists+xen-devel@lfdr.de>; Sat, 20 Dec 2025 00:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191204.1511223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWjix-0001lk-1i; Fri, 19 Dec 2025 23:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191204.1511223; Fri, 19 Dec 2025 23:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWjiw-0001kJ-TS; Fri, 19 Dec 2025 23:17:26 +0000
Received: by outflank-mailman (input) for mailman id 1191204;
 Fri, 19 Dec 2025 23:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4//z=6Z=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vWjiw-0001kB-49
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 23:17:26 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0bbb4fa-dd30-11f0-b15b-2bf370ae4941;
 Sat, 20 Dec 2025 00:17:24 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E036640E0200; 
 Fri, 19 Dec 2025 23:17:23 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SQDhptCoBjrJ; Fri, 19 Dec 2025 23:17:20 +0000 (UTC)
Received: from rn.tnic (unknown [160.86.253.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 5F17C40E00DA; Fri, 19 Dec 2025 23:17:01 +0000 (UTC)
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
X-Inumbo-ID: e0bbb4fa-dd30-11f0-b15b-2bf370ae4941
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1766186240; bh=6boN+F4A/pT4AlbOs61ix3VzmmJwzgX0zEnSa5IGRCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwcXV0HYmY/lo4y7kDbE8NjeTDwJTUDod+wyslvgT+Y4EWnYPnCC9KEzZv30LbNZx
	 Ht2jxfnjkL53cShPwnKDYBgZoWSJ/GYJBNY0Di/tas0yP3jNwt84aAGuZENal6Ensa
	 8TEIZkJZX+zhnIMECHZESW7weKkF5LdRSppcXc7DzQg4t7kqlFVbA71tbTkVFh1siG
	 JKYOepyZsPaX/heFhkALGRizPE5YIdaqk3F9RdOsT79lkvab0ydk2OuTvrbfYsPUJz
	 8NW9LiMMGio65PtT9t4B4xza5rh6JYz2m6C11uFcWlf6fdygfEGIEL3kCmE85rSpIJ
	 /IYjn7SyRBiGZg6eDiuR8W1uCIIpPvPpoqaluBJ15fKegsDv6WSc7/8aK0RjN496Up
	 It8GkqEA0Kt0iB+hIlaLseQhwJBdDbm5PuaaVoSdOwn8fGNFqyrPl/biYY3xRYcAEw
	 yXe0un+E+w4Ubw9sQlYoWCH5mpu/zzEowfADeci/ON6R5kDkkgGwSUp0Qh4cKWLwEM
	 wcRBwv+1oYRTykj+mL7tgdm1zo8/hQxFX8ADm3Utn/48+Q5fKuyxzi0bZxX1d5xcc1
	 UBmh95cMRwkLJCmNZi5R7VAb2iD7ODGuiaTzrrJAIkm3Tm5JjwJm24NJuRi5ouY64O
	 YXrslqXWdbwbn6w6sHqNYbwg=
Date: Sat, 20 Dec 2025 00:16:53 +0100
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Ariadne Conill <ariadne@ariadne.space>, linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com, darwi@linutronix.de,
	sandipan.das@amd.com, kai.huang@intel.com, me@mixaill.net,
	yazen.ghannam@amd.com, riel@surriel.com, peterz@infradead.org,
	hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
Message-ID: <20251219231653.GBaUXc5c0GoVAvICoa@renoirsky.local>
References: <20251219010131.12659-1-ariadne@ariadne.space>
 <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
 <aUV4u0r44V5zHV5f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aUV4u0r44V5zHV5f@google.com>

On Fri, Dec 19, 2025 at 08:09:31AM -0800, Sean Christopherson wrote:
> LOL, Ariadne, be honest, how much did Boris pay you?  :-D

Ha, now there's a thought: win the lottery and then pay people to do
specially crafted reports influencing the kernel design. Woahahahah, /me
laughs ominously.

One problem though: winning the lottery.

;-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

