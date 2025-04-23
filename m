Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BDFA9998C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965277.1355873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gu9-0007lV-BK; Wed, 23 Apr 2025 20:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965277.1355873; Wed, 23 Apr 2025 20:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gu9-0007jO-8j; Wed, 23 Apr 2025 20:41:13 +0000
Received: by outflank-mailman (input) for mailman id 965277;
 Wed, 23 Apr 2025 20:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7gu7-0007jI-O0
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:41:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4930dc30-2083-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:41:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A52D2A4C1AC;
 Wed, 23 Apr 2025 20:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB864C4CEE2;
 Wed, 23 Apr 2025 20:41:06 +0000 (UTC)
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
X-Inumbo-ID: 4930dc30-2083-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745440868;
	bh=K280hemRMvhWfQuTVx2Dj0v++g0aYj2VBO5j4YUV15A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NYhtFqqIJ7G4Pjzso3siLRZ8c9sIzkxLqnWeQaIQdZoPGjcHt1IKUuMcL7RYi+4Ba
	 NJjD8YxK7IghmnlzpTY+ZIAbeoz9bfdhQAVTW1r7/ZRdYmapLS16gV7CQtsg6473On
	 kpZ6cDyyRyZBkAmWaxh1CCwHYrNrBGYFRF7j5l3jYTiC7doMMW4am5jc3ILRWKtqAQ
	 GaVyunywXD+MSllfni3luDhHiyeAqUOcktZNq5u+8IR+apKzC8EQbCzfD8IGN7jMMJ
	 ptuxB4gbqBE9zQTIt7ddEE9/CvvzVAwHuKrPMSdyEyD7m4ERiXyUgYmWz8E9cUgfTS
	 hyiTRR/btm31Q==
Date: Wed, 23 Apr 2025 13:41:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Lira, Victor M" <VictorM.Lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation of Rule 5.5
In-Reply-To: <d81178fe-82b8-434e-8610-e0ec71df6a28@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504231338140.785180@ubuntu-linux-20-04-desktop>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com> <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com> <d81178fe-82b8-434e-8610-e0ec71df6a28@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Lira, Victor M wrote:
> Continuing a discussion from before:
> 
> On 4/22/2025 11:44 PM, Jan Beulich wrote:
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> > 
> > 
> > On 23.04.2025 01:43, victorm.lira@amd.com wrote:
> > >          memmove.
> > >        - Tagged as `deliberate` for ECLAIR.
> > > 
> > > +   * - R5.5
> > > +     - Clashes between function-like macros and function names are
> > > +       deliberate
> > They may or may not be deliberate, depending on context. I don't think it's
> > a
> > good move to deviate this more widely than necessary. If I get the
> > expression
> > above (in deviations.ecl) right, even
> > 
> > void func1(int);
> > void func2(int);
> > 
> > #define func1() func2(0)
> > #define func2() func1(0)
> > 
> > would be deviated, which I don't think we want. Especially when, in a less
> > contrived scenario, the clash may not easily be visible.
>
> OK, I see the issue for different functions. Does it make sense to say it's
> deliberate when it's the same identifier?
>
> 	void func1(int);
> 	...
> 	#define func1() func1(0)
> 
> Could this be deviated?

I think it makes sense to be clear in deviations.rst and the doc text in
deviations.ecl that we are referring to the same identifier. That we can
do.

I am not sure it is possible to change the ecl rule accordingly to
narrow the check relaxation. If not possible, I'd keep it as it is in
this patch.

