Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318AAFA69F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 18:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034865.1407211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYSeb-0006NC-VH; Sun, 06 Jul 2025 16:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034865.1407211; Sun, 06 Jul 2025 16:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYSeb-0006Kz-ST; Sun, 06 Jul 2025 16:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1034865;
 Sun, 06 Jul 2025 16:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYSea-0006Kt-Vw
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 16:55:48 +0000
Received: from 9.mo582.mail-out.ovh.net (9.mo582.mail-out.ovh.net
 [87.98.171.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 103c6682-5a8a-11f0-a315-13f23c93f187;
 Sun, 06 Jul 2025 18:55:47 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.249.167])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4bZtmL745Yz6SMB
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 16:55:46 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-l24jl (unknown [10.111.182.11])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C2B5E1000EB;
 Sun,  6 Jul 2025 16:55:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-l24jl with ESMTPSA
 id Y33jHpGqamjdZQgAJYd1Eg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 16:55:45 +0000
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
X-Inumbo-ID: 103c6682-5a8a-11f0-a315-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-98R002f2619002-e119-4fe6-b6fe-91579b54864b,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 19:55:38 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
Message-ID: <aGqqisydEetf5mJ_@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
 <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com>
X-Ovh-Tracer-Id: 12290886333198480473
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=fn/ZDKjNE5cX+14ihIw7UDyunyS/Iwl+P9LA2mpB8z8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751820947; v=1;
 b=I3+gqKOtlNsxe8RlxdEdC5UQkWHRRqh1/vUuDenjUIUQwF3Uq8q8fKe1rfiaWo8m89aX7iAF
 0qcyniVjt12cw0KbIiIlvFDNQ3c0qaNgQpzZFYFNVIPYZap4j2rfpgN7lHntmV00lE8/qFD1W8r
 wHA/vDozvJsGOaTX694PR7/zauKNts74f0TjmR3q3+aAujz1l6pxonoeibwNAz8J1vGpO+UT364
 5dPPhF3qFEbsZgrcNWK0J1//vkroINVUWmAye12OTYWTQx0RodhK8v0FqLerOv+9ZkCry6HyjLd
 tyzGFqEvEPENSnqEUiW1mr9O9TSEjWLT/fCyvg7HPpz4g==

On Wed, Jul 02, 2025 at 04:36:27PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > The file provides constants, structures and several helper functions for
> > parsing SLRT.
> >
> > The data described by the structures is passed to Xen by a bootloader
> > which initiated DRTM.
> >
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> > Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> > ---
> >  xen/include/xen/slr-table.h | 276 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 276 insertions(+)
> >  create mode 100644 xen/include/xen/slr-table.h
>
> Btw, please don't forget to Cc maintainers of code you're changing / adding.

What do you mean?  I'm running add_maintainers.pl on the patches.

> > +/*
> > + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
> > + */
> > +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);
>
> I keep wondering why this ...
>
> > +/*
> > + * DRTM Dynamic Launch Configuration
> > + */
> > +struct slr_entry_dl_info
> > +{
> > +    struct slr_entry_hdr hdr;
> > +    uint64_t dce_size;
> > +    uint64_t dce_base;
> > +    uint64_t dlme_size;
> > +    uint64_t dlme_base;
> > +    uint64_t dlme_entry;
> > +    struct slr_bl_context bl_context;
> > +    uint64_t dl_handler;
>
> ... then isn't used right here, instead requiring a cast somewhere (presumably,
> as code using this isn't visible in this patch).

As was mentioned earlier: because size of a pointer between Xen and a
bootloader doesn't necessarily match.  What you're proposing can break
under certain conditions.

> > +} __packed;
>
> I similarly keep wondering why there are all these packed attributes here, when
> (afaics) all of the structures are defined in a way that any padding is explicit
> anyway.

As before: it won't hurt, it's future-proof, just in case and to let
reader of the code know the structure must have no padding.  If you want
them gone, I can do that, but I think it will make the code harder to
maintain.

> > +static inline const struct slr_entry_hdr *
> > +slr_next_entry(const struct slr_table *table, const struct slr_entry_hdr *curr)
> > +{
> > +    const struct slr_entry_hdr *next = (void *)curr + curr->size;
> > +
> > +    if ( (void *)next + sizeof(*next) > slr_end_of_entries(table) )
> > +        return NULL;
> > +    if ( next->tag == SLR_ENTRY_END )
> > +        return NULL;
> > +    if ( (void *)next + next->size > slr_end_of_entries(table) )
> > +        return NULL;
> > +
> > +    return next;
> > +}
> > +
> > +static inline const struct slr_entry_hdr *
> > +slr_next_entry_by_tag(const struct slr_table *table,
> > +                      const struct slr_entry_hdr *entry,
> > +                      uint16_t tag)
> > +{
> > +    if ( !entry ) /* Start from the beginning */
> > +        entry = (void *)table + sizeof(*table);
> > +
> > +    for ( ; ; )
> > +    {
> > +        if ( entry->tag == tag )
> > +            return entry;
> > +
> > +        entry = slr_next_entry(table, entry);
> > +        if ( !entry )
> > +            return NULL;
> > +    }
> > +
> > +    return NULL;
> > +}
>
> For both of the functions, again: Please don't cast away const-ness.
>
> Jan

You had commented on v2 after v3 was already sent.

Regards

