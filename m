Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6515B4421B2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 21:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219402.380187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhdzH-0006gL-7D; Mon, 01 Nov 2021 20:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219402.380187; Mon, 01 Nov 2021 20:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhdzH-0006e0-48; Mon, 01 Nov 2021 20:32:59 +0000
Received: by outflank-mailman (input) for mailman id 219402;
 Mon, 01 Nov 2021 20:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mhdzG-0006du-6I
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 20:32:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e57d2133-3b52-11ec-854e-12813bfff9fa;
 Mon, 01 Nov 2021 20:32:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEF6660296;
 Mon,  1 Nov 2021 20:32:55 +0000 (UTC)
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
X-Inumbo-ID: e57d2133-3b52-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635798776;
	bh=yGX4aeZxiq6+2zhk5O2CgfOFMx9RTmRmQz+TT5j8d4M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cPNhoq6Neq69A69sWuTfGFPuex5MB4yBuLRY7LtF2HPeYh4MB+IsRmNGYHMLtgm1k
	 oTn77vjt+F3hA5gAeescRNh9HYUx6wVm8ALu9DY670Q/kbQAn+5+1ahF2uqNJDd65i
	 fvwO7+BjMPF5nKfVJ9ZBTOR7RlFvyZ3wNqw/VoVidDFQ9Ygrr8uanlqOmIJ13ifEz4
	 BfwCfvj2jwWJa0bBGjYcGpVD5ZttYjf3srP9ECt2hBkAsGXUVUhQWt8zfiFn6qhZ2t
	 9H2r17vdgMBgUvmqCedRxNWNixxUKxKdW2C2j9rAz/CknesvKu8vT/RMT03URZmoFG
	 sq8GUX6Q+eeeg==
Date: Mon, 1 Nov 2021 13:32:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jane Malalane <jane.malalane@citrix.com>, 
    Bobby Eshleman <bobbyeshleman@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, Bertrand.Marquis@arm.com
Subject: Re: Arch-neutral name for hardware interrupt support
In-Reply-To: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
Message-ID: <alpine.DEB.2.21.2111011330310.20134@sstabellini-ThinkPad-T480s>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1818251338-1635798734=:20134"
Content-ID: <alpine.DEB.2.21.2111011332200.20134@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1818251338-1635798734=:20134
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2111011332201.20134@sstabellini-ThinkPad-T480s>

+Bertrand

On Mon, 1 Nov 2021, Andrew Cooper wrote:
> Hello,
> 
> On ARM, the GIC is a hard prerequisite for VMs.
> 
> I can't remember what the state of RISCV is, but IIRC there is still
> some debate over how interrupts are expected to work under virt.
> 
> On x86, the story is very different.  PV have no hardware assistance,
> while HVM hardware assistance depends on hardware support.  Therefore we
> want to introduce a new CDF flag so we can control the setting per
> domain, rather than globally as it is done now.
> 
> This brings us to the question of what a suitable architecture name
> would be.
> 
> Hardware Virtual Interrupts is a little too close to Hardware Virtual
> (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
> HAP) doesn't seem great either.
> 
> Thoughts / ideas / suggestions?

Maybe "hardware-enabled virtualized interrupts"
--8323329-1818251338-1635798734=:20134--

