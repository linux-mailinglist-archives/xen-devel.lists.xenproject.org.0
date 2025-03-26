Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99FA71597
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927614.1330338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOpn-0007To-MZ; Wed, 26 Mar 2025 11:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927614.1330338; Wed, 26 Mar 2025 11:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txOpn-0007SM-JQ; Wed, 26 Mar 2025 11:22:11 +0000
Received: by outflank-mailman (input) for mailman id 927614;
 Wed, 26 Mar 2025 11:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9c7=WN=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1txOpm-0007SG-1t
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:22:10 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d7d2203-0a34-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:22:08 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5C77140E01FF; 
 Wed, 26 Mar 2025 11:22:06 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2BBJubJfUa6X; Wed, 26 Mar 2025 11:22:02 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C404F40E0213;
 Wed, 26 Mar 2025 11:21:48 +0000 (UTC)
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
X-Inumbo-ID: 8d7d2203-0a34-11f0-9ea3-5ba50f476ded
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1742988121; bh=HHmqfeWTgw3N+abSgf1eEvtMfI5HsocYTyjY2Y/8nZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aG/ouA9ViexZdNByT93a5dwhb+1CXWJcAuelsphHkx8e93/dO0BW1QldVxlT9POsa
	 uGIHfghooDUE8UFtzBQJShNq9eWsTf1h5D2SFODw1iTLNZFWC2zgi2DX27SnIVUhc+
	 D71sAU2AQuc45meB6zxxyyBSlsj7SMExaWoCarLZh7jsG8rNUYXnJzkst+yDYhF5Mx
	 xI2NSoRS1NRZvOo9YV9SR1ATS5WIVilgPupFFyojgZo9lFV/itBpeg4rmr/NJMjmLf
	 SeqYr0XOCnP83ZiQkXleMWhrli3lID3a+wyNLM80+hqdEFWJ2LWv2hdKPKnfXekRM/
	 bhWIxM9kqiMA503IXOgaNLy1KhusZXcIrXuIrY0s+rMhcr4tZQBys6CkihfLea7MBg
	 3Lvkwe/cVm509IBItBSAPMDAl6T+NF6A3fZtTohN/kGmiH3QnGJF0hcknp5/XE9sDM
	 IOjD6SpFKC9GrW5Sz53udRR9m1aiyWrrBgtFpFqNLsuesT7wnDpKoPAOnqg5MQjWHG
	 x2hwZR2a9dcwAaXe1i9FrnWiFcGrc1czzhIRIgjs4XeMfn06CC/bS/4LRbMP8b54jz
	 trB3+9FUr29rdPAhSMmtdM8HkhvqB76OvR1ND63Ax06DLZrRWbCf4qMOl72ZZKcfBn
	 Fffh7UZj/O7uuDigVra8WASU=
Date: Wed, 26 Mar 2025 12:21:43 +0100
From: Borislav Petkov <bp@alien8.de>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <20250326112143.GAZ-PjR5xrN1GyzXzE@fat_crate.local>
References: <20250219092059.90850-1-roger.pau@citrix.com>
 <20250219092059.90850-4-roger.pau@citrix.com>
 <20250326110455.GAZ-PfV3kOiQw97fDj@fat_crate.local>
 <Z-PhgWQMHjxbac3b@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-PhgWQMHjxbac3b@macbook.local>
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 12:14:09PM +0100, Roger Pau Monn=C3=A9 wrote:
> Sorry, not on KVM, I've tested on Xen and native.  It also seems to be
> somewhat tied to the Kconfig, as I couldn't reproduce it with my
> Kconfig, maybe didn't have the required VirtIO options enabled.

Right.

> It's fixed by:
>=20
> https://lore.kernel.org/xen-devel/87v7rxzct0.ffs@tglx/
>=20
> Waiting for Thomas to formally sent that.

Yap, he just pointed me to that one.

Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

