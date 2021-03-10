Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CBD334016
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 15:15:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96126.181625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJzcG-0000NM-2S; Wed, 10 Mar 2021 14:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96126.181625; Wed, 10 Mar 2021 14:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJzcF-0000Mx-Vp; Wed, 10 Mar 2021 14:15:11 +0000
Received: by outflank-mailman (input) for mailman id 96126;
 Wed, 10 Mar 2021 14:15:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8s4R=II=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lJzcF-0000Mr-2Q
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 14:15:11 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e439a53-8e6e-41b2-94b1-c37858b2e74b;
 Wed, 10 Mar 2021 14:15:08 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0a9900452923910729ca7d.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:9900:4529:2391:729:ca7d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0D6E01EC026F;
 Wed, 10 Mar 2021 15:15:08 +0100 (CET)
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
X-Inumbo-ID: 2e439a53-8e6e-41b2-94b1-c37858b2e74b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1615385708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xInftdEM72Yr3cDyfCScGyACeH4pMYE+757zoD3NCTM=;
	b=Ypf/zLPu/DN+SzbMFOoHUaGduzDPcW4G6qiHGNzRZljOMuLTfcQsSq9WJmae4/MHG38EQR
	R3FTVdXqG5bR/i75nBy7m9HXmVtedaR6EZ36Wdkp35HgcYrQG2Hz+QCG2kFottyNxE5TMc
	QjAl70dhe8qXdLHzBPjBD28Brsyvu1g=
Date: Wed, 10 Mar 2021 15:15:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v6 04/12] x86/alternative: support not-feature
Message-ID: <20210310141510.GG23521@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-5-jgross@suse.com>
 <20210310060705.GB23521@zn.tnic>
 <1b95376a-56e1-ab3e-aa85-73a9d38aaaf7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b95376a-56e1-ab3e-aa85-73a9d38aaaf7@suse.com>

On Wed, Mar 10, 2021 at 08:52:40AM +0100, Jürgen Groß wrote:
> Did you look at patch 13? :-)

Well, I usually review in increasing patch order. :-P

But make that change here pls because otherwise unnecessary churn.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

