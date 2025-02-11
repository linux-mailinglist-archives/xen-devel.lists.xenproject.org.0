Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29572A3132B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 18:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885826.1295629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thu8O-0003NC-PR; Tue, 11 Feb 2025 17:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885826.1295629; Tue, 11 Feb 2025 17:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thu8O-0003LV-Mq; Tue, 11 Feb 2025 17:33:20 +0000
Received: by outflank-mailman (input) for mailman id 885826;
 Tue, 11 Feb 2025 17:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zckm=VC=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1thu8M-0003LN-U2
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 17:33:18 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 470f5337-e89e-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 18:33:16 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8E1FA40E01A3; 
 Tue, 11 Feb 2025 17:33:14 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1AVrtT9nhL4M; Tue, 11 Feb 2025 17:33:10 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D21C540E01AE;
 Tue, 11 Feb 2025 17:32:44 +0000 (UTC)
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
X-Inumbo-ID: 470f5337-e89e-11ef-b3ef-695165c68f79
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739295189; bh=EDPPB5pchJ3PRDuHl4/eMwbaqvfmU9GnhCPfxyCt6A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glQWEIx2q9bjFG6PmueoiyukaePapW3D33jKqhOxc2rdgmUWM20s/zvTLa7MeuHZR
	 Mc440i8zn5xR/bnl3R3Gq1lSPsmlRWR0LFEz/XvMunUZZ/ESPV+1AXfj394pnlc6gF
	 WZ8AMZP3rbFfuMlL9msyanR9Kb9m3HjlnS70O4M+9W9nf92A3GyikWJNgVPD/+Mp+I
	 ml4oawXWH263IanQmISY1HZMoYK2MLjsms33gWB9lLrBHqgnTcEq7rVcTP7aewKgWK
	 /kZG9FRFrMTcyqWLXkwe0/pvUPbVCP4/CaVt1WprSmfVJn1h35GKVv9KJumMRhePpr
	 WkxLlG1+Ali1lrvR3PiRAi1imSA38MxWOC4sOrDIT5zHbgr+wvXt1WW1gvJnxUblDz
	 cTm+XFhqWztTxTzsPg6zH/bmR5sqrpgOz6GlMHdZrbnPLNB43rHinsnjmRNBC55Uy7
	 F1RFtaz7MnerSzE214n+BE0wBbw3YirsuCgqu/MvP2MB+NEQrzi+QLnfDSWwdngjAr
	 9CJDrtszu/9W1zN3oxRvPAGC8fdvXy7k5GdpzB9GU2j71c3LPXy/mx/aXSmWxIdoYH
	 34PGLyH3rcWSFfr72qDMKzLahLR1mcO+zaCXili21ybDKAASqdF0wKBvkOMfCseBEa
	 hUcLD14V3tnJtgTsJg8wOtzc=
Date: Tue, 11 Feb 2025 18:32:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, Nikunj A Dadhania <nikunj@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 03/16] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
Message-ID: <20250211173238.GDZ6uJtkVBi8_X7kia@fat_crate.local>
References: <20250201021718.699411-1-seanjc@google.com>
 <20250201021718.699411-4-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250201021718.699411-4-seanjc@google.com>

On Fri, Jan 31, 2025 at 06:17:05PM -0800, Sean Christopherson wrote:

Drop:

jailhouse-dev@googlegroups.com
Alexey Makhalov <alexey.amakhalov@broadcom.com>

from Cc as they're bouncing.

> Add a TODO to call out that AMD_MEM_ENCRYPT is a mess and doesn't depend on
> HYPERVISOR_GUEST because it gates both guest and host code.

Why is it a mess?

I don't see it, frankly.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

