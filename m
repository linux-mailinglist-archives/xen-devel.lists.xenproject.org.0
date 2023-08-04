Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910347708FD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 21:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577298.904312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS0PT-0007oC-Ge; Fri, 04 Aug 2023 19:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577298.904312; Fri, 04 Aug 2023 19:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS0PT-0007mW-D3; Fri, 04 Aug 2023 19:24:27 +0000
Received: by outflank-mailman (input) for mailman id 577298;
 Fri, 04 Aug 2023 19:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS0PR-0007mQ-Ob
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 19:24:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839ecebe-32fc-11ee-b271-6b7b168915f2;
 Fri, 04 Aug 2023 21:24:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB44E620B2;
 Fri,  4 Aug 2023 19:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BFEC433C7;
 Fri,  4 Aug 2023 19:24:18 +0000 (UTC)
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
X-Inumbo-ID: 839ecebe-32fc-11ee-b271-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691177060;
	bh=1scds7z8WNp0wU1Ynx2S061QaMbUsIDz+VM1EtTlCcc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kapeWdutUvjKza/FRgrvXs/aJDpt+nsdUzZh5B2hfDCByE+JkSRIXt3TS/q6H5PAs
	 2hvYn9Q/xZeoAzoipru2vB6YJR9OGOnMMEV4UQeKAe41Q8cmSl9pbdrFfQ0ZXLYvq+
	 7EcOs4WUjgdgr2VDXiB1MpQErZLffjle/R/mptQk8EyPqJS1/B1GylgTcnf0+LDTnY
	 bxlHZKybsY9txmKtl1ZWhFNH67YitV8DanwuQufUvOwOFgCi6aVfC4QsMzLwnzF81C
	 GF7LUJz9KWp0RYAEhzgcmCOryocmolYEmsa5s5xJjgSr822E6wmk1AXjTO4VKyKgar
	 gi/Xdd7+Bp1wA==
Date: Fri, 4 Aug 2023 12:24:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
In-Reply-To: <82f93d14-fd6e-417c-a970-645fd0719d3a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308041224110.2127516@ubuntu-linux-20-04-desktop>
References: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com> <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com> <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org> <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
 <1e2d06ab-ad3a-4e5a-ac78-d20bad28bb20@xen.org> <alpine.DEB.2.22.394.2308031226010.2127516@ubuntu-linux-20-04-desktop> <49fc793e-d0a3-7d9b-b501-d7a72dd9c736@bugseng.com> <82f93d14-fd6e-417c-a970-645fd0719d3a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-779768781-1691177060=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-779768781-1691177060=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 4 Aug 2023, Jan Beulich wrote:
> On 04.08.2023 09:55, Federico Serafini wrote:
> > On 03/08/23 21:26, Stefano Stabellini wrote:
> >> On Thu, 3 Aug 2023, Julien Grall wrote:
> >>> On 03/08/2023 12:52, Luca Fancellu wrote:
> >>>>> On 3 Aug 2023, at 12:46, Julien Grall <julien@xen.org> wrote:
> >>>>>
> >>>>> Hi Luca,
> >>>>>
> >>>>> On 03/08/2023 11:28, Luca Fancellu wrote:
> >>>>>>> On 3 Aug 2023, at 09:26, Federico Serafini
> >>>>>>> <federico.serafini@bugseng.com> wrote:
> >>>>>>>
> >>>>>>> Add missing parameter names to address violation of MISRA C:2012
> >>>>>>> rule 8.2 ("Function types shall be in prototype form with named
> >>>>>>> parameters").
> >>>>>>>
> >>>>>>> No functional changes.
> >>>>>>>
> >>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>>>>> ---
> >>>>>>> Changes in v2:
> >>>>>>>    - memset() adjusted.
> >>>>>>> ---
> >>>>>>> xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
> >>>>>>> 1 file changed, 21 insertions(+), 21 deletions(-)
> >>>>>>>
> >>>>>>> +void *memset(void *s, int c, size_t count);
> >>>>>>> +void *memcpy(void *dest, const void *src, size_t count);
> >>>>>> There is a comment in arch/arm/rm32/lib/memcpy.S with this:
> >>>>>> /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
> >>>>>>> +void *memmove(void *dest, const void *src, size_t count);
> >>>>>> There is a comment in arch/arm/rm32/lib/memmove.S with this:
> >>>>>>    * Prototype: void *memmove(void *dest, const void *src, size_t n);
> >>>>>>> +int memcmp(const void *cs, const void *ct, size_t count);
> >>>>>>> +void *memchr(const void *s, int c, size_t n);
> >>>>>>> +void *memchr_inv(const void *s, int c, size_t n);
> >>>>>> @Stefano: would it make sense to remove it as part of this patch or
> >>>>>> maybe not?
> >>>>>
> >>>>> They are a verbatim copy of the Linux code. So I would rather no touch it.
> >>>>
> >>>> Oh I see! Thank you for pointing that out, then I’m wondering if it’s there
> >>>> a reason why we
> >>>> are using ‘count’ instead of ’n’ as third parameter name, I know Stefano
> >>>> suggested that, so
> >>>> It’s just a curiosity. Maybe it’s for clarity?
> >>>
> >>> I guess because the generic implementation of memset (see xen/lib/memset.c) is
> >>> using 'count' rather than 'n'.
> >>
> >> Yep
> >>
> >>
> >>> Given what Andrew said, I would say we should rename the parameter to 'n'.
> >>
> >> Yes, either way works. I was only trying to be consistent with
> >> xen/lib/memset.c. It is also fine to change xen/lib/memset.c instead.
> > 
> > If you want to be consistent compared to the C99 Standard,
> > then other parameter names need to be changed, for example all the `cs`
> > and `ct` should become `s1` and `s2`, respectively.
> > The same goes for `dest` and `src`.
> > If you agree, I can propose a v3 that takes care of that.
> 
> Personally I'd prefer if we could limit code churn. Functions that need
> touching anyway can certainly be brought in line with names the standard
> uses (albeit I don't see a strong need for this). But function which
> won't otherwise be touched could easily be left alone.
 
+1
--8323329-779768781-1691177060=:2127516--

