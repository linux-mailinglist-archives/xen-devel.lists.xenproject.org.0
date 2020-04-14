Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CC1A860A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 18:55:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOOpk-0003lO-3v; Tue, 14 Apr 2020 16:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5lL2=56=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOOpj-0003lH-51
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 16:54:47 +0000
X-Inumbo-ID: a511ad7a-7e70-11ea-83d8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a511ad7a-7e70-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 16:54:46 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 236962076A;
 Tue, 14 Apr 2020 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586883285;
 bh=qzL6FDsFZCDJUSJEtA0V8eaxVB8g+SePx4SqY88TjuU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ylK8sQ6OYXJxDlPoY4d6SLJAm4MBMaVU32p7W3em8GDAacVNgGAwOqDlrlvFCZBKr
 Y7cti+LSL210cIaiYBnHruMuSVhug3sLoXNOXHbbvmixfGPbcE9Gyi0TH5L0MBm8WX
 nXmDSF5B8gyfMZXcBo3iIQxxbY2sNz3YclCXXPdU=
Date: Tue, 14 Apr 2020 09:54:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
In-Reply-To: <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
Message-ID: <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 14 Apr 2020, Jan Beulich wrote:
> On 10.04.2020 18:49, Stefano Stabellini wrote:
> > Create a new document under docs/process to describe our special tags.
> > For now, only add the new backport tag.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > Acked-by: Wei Liu <wl@xen.org>
> > CC: jbeulich@suse.com
> > CC: george.dunlap@citrix.com
> > CC: julien@xen.org
> > CC: lars.kurth@citrix.com
> > CC: andrew.cooper3@citrix.com
> > CC: konrad.wilk@oracle.com
> > 
> > ---
> > 
> > This is the original thread: https://marc.info/?l=xen-devel&m=157324027614941
> > 
> > The backport tag was agreed upon.
> 
> Well, sort of.
> 
> > George requested the file to be
> > renamed to something more generic, where we could add more information
> > later.
> > 
> > I kept the original content and acked-by. I renamed the file to
> > tags.pandoc.
> > ---
> >  docs/process/tags.pandoc | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 docs/process/tags.pandoc
> > 
> > diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
> > new file mode 100644
> > index 0000000000..e570efdcc8
> > --- /dev/null
> > +++ b/docs/process/tags.pandoc
> > @@ -0,0 +1,23 @@
> > +Backport Tag
> > +------------
> > +
> > +A backport tag is an optional tag in the commit message to request a
> > +given commit to be backported to the stable trees:
> 
> Insert "fully maintained"?

Yep I'll add.


> > +    Backport: all
> > +
> > +It marks a commit for being a candidate for backports to all relevant
> > +trees.
> 
> I'm unconvinced of the utility of this form - what "all" resolves to
> changes over time. There's almost always a first version where a
> particular issue was introduced. If we want this to be generally
> useful, imo we shouldn't limit the scope of the tag to the upstream
> maintained stable trees.

The reason why I suggested also to have a "wildcard" version of this
tag, is that the person adding the tag (could be the contributor trying
to be helpful) might not know exactly to which stable trees the patch
should be backported to.

Writing this sentence, I realize that I really meant "any" rather than
"all". Would you prefer if I used "any"? Or we could even suggest to leave
it black like this:

  Backport:

But it looks a bit weird.


> > +    Backport: 4.9+
> > +
> > +It marks a commit for being a candidate for backports to all stable
> > +trees from 4.9 onward.
> > +
> > +Maintainers request the Backport tag to be added on commit.
> > +Contributors are also welcome to mark their patches with the Backport
> > +tag when they deem appropriate. Maintainers will request for it to be
> > +removed when that is not the case.
> > +
> > +Please note that the Backport tag is a **request** for backport, which
> > +will still need to be evaluated by the stable tree maintainers.
> 
> Now that we see more widespread use of the Fixes: tag, with there
> being effectively some overlap between the information conveyed I
> think there should be some mention of this. Not the least there's the
> risk of the Backport: one to become stale when a flaky commit gets
> backported - the Fixes: tag doesn't have this issue.

Yes, that's true, but "Fixes" cannot always be used. I can add a
statement like: "When possible use the Fixes tag."

Also, I can pull in the description of Fixes and add it to this file
too.


Fixes tag
---------

If your patch fixes a bug in a specific commit, e.g. you found an issue using
``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
parsing scripts.  For example::

	Fixes: 41548c5472a "mem_sharing: VM forking"

The following ``git config`` settings can be used to add a pretty format for
outputting the above style in the ``git log`` or ``git show`` commands::

	[core]
		abbrev = 12
	[pretty]
		fixes = Fixes: %h (\"%s\")

