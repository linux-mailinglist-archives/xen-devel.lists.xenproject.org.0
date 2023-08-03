Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B16C76F362
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 21:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576581.902868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRdyG-0004AP-Jt; Thu, 03 Aug 2023 19:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576581.902868; Thu, 03 Aug 2023 19:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRdyG-00047d-H3; Thu, 03 Aug 2023 19:26:52 +0000
Received: by outflank-mailman (input) for mailman id 576581;
 Thu, 03 Aug 2023 19:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRdyF-00047X-Gh
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 19:26:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b07a597f-3233-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 21:26:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C26D260C5B;
 Thu,  3 Aug 2023 19:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80AAC433C8;
 Thu,  3 Aug 2023 19:26:45 +0000 (UTC)
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
X-Inumbo-ID: b07a597f-3233-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691090807;
	bh=ah2EhQb8tvf85Ee3ASO1btgn1Wfur/rLCfALJfIjU2U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HzMVsUDxB6LFSXW5SK/huZHYbEaXxfvW/vN5EJdQ38jlVXFt3sHkIS42lsHdJ5+gi
	 k5HDbBc87lA1wTbTLK9s5MZPrwroJlfSi98VIiQhNMgR2mM2xtQ77gL9ieTIiR23HQ
	 Lls1t0RVfO0mDR5UF/GXQRTR6LLlszwH6oxCENSGLg4gZQryM6SANneZhYEI65flHX
	 AhivZcS9i0cL4Aw++i/wFFQ6JQkfbLgkJxKC+V013g3LbKtxGy0cFqC4OyxplcoP+6
	 kWdXamwTQBlvnCqDlnjKwfF7ZwZWJKXMAn0c3NexFXu8yryT6GBFLYtYHaZiVkScqp
	 JrgeMphwMtJWA==
Date: Thu, 3 Aug 2023 12:26:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
In-Reply-To: <1e2d06ab-ad3a-4e5a-ac78-d20bad28bb20@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308031226010.2127516@ubuntu-linux-20-04-desktop>
References: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com> <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com> <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org> <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
 <1e2d06ab-ad3a-4e5a-ac78-d20bad28bb20@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-764670787-1691090807=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-764670787-1691090807=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Aug 2023, Julien Grall wrote:
> On 03/08/2023 12:52, Luca Fancellu wrote:
> > > On 3 Aug 2023, at 12:46, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi Luca,
> > > 
> > > On 03/08/2023 11:28, Luca Fancellu wrote:
> > > > > On 3 Aug 2023, at 09:26, Federico Serafini
> > > > > <federico.serafini@bugseng.com> wrote:
> > > > > 
> > > > > Add missing parameter names to address violation of MISRA C:2012
> > > > > rule 8.2 ("Function types shall be in prototype form with named
> > > > > parameters").
> > > > > 
> > > > > No functional changes.
> > > > > 
> > > > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > > > ---
> > > > > Changes in v2:
> > > > >   - memset() adjusted.
> > > > > ---
> > > > > xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
> > > > > 1 file changed, 21 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
> > > > > index b4d2217a96..e91e3112e0 100644
> > > > > --- a/xen/include/xen/string.h
> > > > > +++ b/xen/include/xen/string.h
> > > > > @@ -12,27 +12,27 @@
> > > > > #define strncpy __xen_has_no_strncpy__
> > > > > #define strncat __xen_has_no_strncat__
> > > > > 
> > > > > -size_t strlcpy(char *, const char *, size_t);
> > > > > -size_t strlcat(char *, const char *, size_t);
> > > > > -int strcmp(const char *, const char *);
> > > > > -int strncmp(const char *, const char *, size_t);
> > > > > -int strcasecmp(const char *, const char *);
> > > > > -int strncasecmp(const char *, const char *, size_t);
> > > > > -char *strchr(const char *, int);
> > > > > -char *strrchr(const char *, int);
> > > > > -char *strstr(const char *, const char *);
> > > > > -size_t strlen(const char *);
> > > > > -size_t strnlen(const char *, size_t);
> > > > > -char *strpbrk(const char *, const char *);
> > > > > -char *strsep(char **, const char *);
> > > > > -size_t strspn(const char *, const char *);
> > > > > -
> > > > > -void *memset(void *, int, size_t);
> > > > > -void *memcpy(void *, const void *, size_t);
> > > > > -void *memmove(void *, const void *, size_t);
> > > > > -int memcmp(const void *, const void *, size_t);
> > > > > -void *memchr(const void *, int, size_t);
> > > > > -void *memchr_inv(const void *, int, size_t);
> > > > > +size_t strlcpy(char *dest, const char *src, size_t size);
> > > > > +size_t strlcat(char *dest, const char *src, size_t size);
> > > > > +int strcmp(const char *cs, const char *ct);
> > > > > +int strncmp(const char *cs, const char *ct, size_t count);
> > > > > +int strcasecmp(const char *s1, const char *s2);
> > > > > +int strncasecmp(const char *s1, const char *s2, size_t len);
> > > > > +char *strchr(const char *s, int c);
> > > > > +char *strrchr(const char *s, int c);
> > > > > +char *strstr(const char *s1, const char *s2);
> > > > > +size_t strlen(const char *s);
> > > > > +size_t strnlen(const char *s, size_t count);
> > > > > +char *strpbrk(const char *cs, const char *ct);
> > > > > +char *strsep(char **s, const char *ct);
> > > > > +size_t strspn(const char *s, const char *accept);
> > > > > +
> > > > > +void *memset(void *s, int c, size_t count);
> > > > > +void *memcpy(void *dest, const void *src, size_t count);
> > > > There is a comment in arch/arm/rm32/lib/memcpy.S with this:
> > > > /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
> > > > > +void *memmove(void *dest, const void *src, size_t count);
> > > > There is a comment in arch/arm/rm32/lib/memmove.S with this:
> > > >   * Prototype: void *memmove(void *dest, const void *src, size_t n);
> > > > > +int memcmp(const void *cs, const void *ct, size_t count);
> > > > > +void *memchr(const void *s, int c, size_t n);
> > > > > +void *memchr_inv(const void *s, int c, size_t n);
> > > > @Stefano: would it make sense to remove it as part of this patch or
> > > > maybe not?
> > > 
> > > They are a verbatim copy of the Linux code. So I would rather no touch it.
> > 
> > Oh I see! Thank you for pointing that out, then I’m wondering if it’s there
> > a reason why we
> > are using ‘count’ instead of ’n’ as third parameter name, I know Stefano
> > suggested that, so
> > It’s just a curiosity. Maybe it’s for clarity?
> 
> I guess because the generic implementation of memset (see xen/lib/memset.c) is
> using 'count' rather than 'n'.

Yep


> Given what Andrew said, I would say we should rename the parameter to 'n'.

Yes, either way works. I was only trying to be consistent with
xen/lib/memset.c. It is also fine to change xen/lib/memset.c instead.
--8323329-764670787-1691090807=:2127516--

