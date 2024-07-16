Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE369327F5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 16:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759621.1169287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTikw-0005CC-Qk; Tue, 16 Jul 2024 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759621.1169287; Tue, 16 Jul 2024 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTikw-00059M-Nm; Tue, 16 Jul 2024 14:02:14 +0000
Received: by outflank-mailman (input) for mailman id 759621;
 Tue, 16 Jul 2024 13:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gqoP=OQ=aperard.fr=tony@srs-se1.protection.inumbo.net>)
 id 1sTiew-0003XU-Un
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 13:56:03 +0000
Received: from mail.aperard.fr (mail.aperard.fr [5.39.88.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 220152d9-437b-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 15:56:00 +0200 (CEST)
Received: from l14 (unknown [10.9.0.5])
 by mail.aperard.fr (Postfix) with ESMTPA id EFFE480EE9;
 Tue, 16 Jul 2024 14:55:58 +0100 (BST)
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
X-Inumbo-ID: 220152d9-437b-11ef-8776-851b0ebba9a2
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aperard.fr; s=k;
	t=1721138159; bh=daMXKN0z3Ri88Ksjk6enT7p1w98k+r/SYz0tqkUZMdo=;
	h=DKIM-Signature-Warning:DKIM-Signature-Warning:
	 DKIM-Signature-Warning:DKIM-Signature-Warning:
	 DKIM-Signature-Warning:DKIM-Signature-Warning:
	 DKIM-Signature-Warning:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=tqSftVjI8lalQ1RucWcinV0a8pDKxJpNKwktGsKJyFi+QWi9pRV6NI7oa9/KUtd3G
	 Ag8jn5X+OiJSbsP2S2IZDak98+abB5AIvKfEyicTKgEfTWG8klFHWIdIcqVqoeNzvP
	 T65wVyTwvdW5kvXPzrwqLoCp9tkf86XEQFYyTRkPm4bBsQn0aYk8vFfzq+TX2H3yTK
	 50QEPU94ui53gj5lgRVNhvQLaZhR12O2t254WTNxWhM8SnIYMEZVj3JhLmnA2qi6tv
	 aQd245Pp8ohfLCZEx/E4UXskx74OM0xY3FUrmPR0E3jYRtLE1t+1tT8iSem6Hj2bUZ
	 jifuQ+sOha4Tg==
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://aperard.fr/dkim-rotate/README.txt https://aperard.fr/dkim-rotate/67/6740e4466320c88d1a694cc3138ec888.pem
Date: Tue, 16 Jul 2024 15:55:58 +0200
From: Anthony PERARD <tony@aperard.fr>
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
Message-ID: <ZpZ77uJ/wuhoxR2p@l14>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
 <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
 <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
 <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
 <2bdf382a-cbad-454f-82ce-0b0d30d2e8ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bdf382a-cbad-454f-82ce-0b0d30d2e8ef@suse.com>

On Tue, Jul 16, 2024 at 10:22:18AM +0200, Juergen Gross wrote:
> On 16.07.24 09:46, Jan Beulich wrote:
> > On 16.07.2024 09:33, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 16/07/2024 08:24, Jan Beulich wrote:
> > > > On 16.07.2024 09:22, Julien Grall wrote:
> > > > > On 16/07/2024 07:47, Jan Beulich wrote:
> > > > > > On 15.07.2024 18:56, Julien Grall wrote:
> > > > > > > On 15/07/2024 16:50, Andrew Cooper wrote:
> > > > > > > > An earlier part of the checklist states:
> > > > > > > > 
> > > > > > > >       * change xen-unstable README. The banner (generated using figlet) should say:
> > > > > > > >           - "Xen 4.5" in releases and on stable branches
> > > > > > > >           - "Xen 4.5-unstable" on unstable
> > > > > > > >           - "Xen 4.5-rc" for release candidate
> > > > > > > > 
> > > > > > > > Update the notes about XEN_EXTRAVERSION to match.
> > > > 
> > > > When this is the purpose of the patch, ...
> > > > 
> > > > > > > We have been tagging the tree with 4.5.0-rcX. So I think it would be
> > > > > > > better to update the wording so we use a consistent naming.
> > > > > > 
> > > > > > I find:
> > > > > > 
> > > > > > 4.18-rc
> > > > > > 4.17-rc
> > > > > > 4.16-rc
> > > > > > 4.15-rc
> > > > > 
> > > > > Hmmm... I don't think we are looking at the same thing. I was
> > > > > specifically looking at the tag and *not* XEN_EXTRAVERSION.
> > > > 
> > > > ... why would we be looking at tags?
> > > 
> > > As I wrote, consistency across the naming scheme we use.
> > > 
> > > > The tags (necessarily) have RC numbers,
> > > 
> > > Right but they also *have* the .0.
> > > 
> > > > so are going to be different from XEN_EXTRAVERSION in any event.
> > > 
> > > Sure they are not going to be 100% the same. However, they could have
> > > some similarity.
> > > 
> > > As I pointed out multiple times now, to me it is odd we are tagging the
> > > tree with 4.19.0-rcX, but we use 4.19-rc.
> > > 
> > > Furthermore, if you look at the history of the document. It is quite
> > > clear that the goal was consistency (the commit mentioned by Andrew
> > > happened after). Yes it wasn't respected but I can't tell exactly why.
> > > 
> > > So as we try to correct the documentation, I think we should also look
> > > at consistency. If you *really* want to drop the .0, then I think it
> > > should happen for the tag as well (again for consistency).
> > 
> > I don't see why (but I also wouldn't mind the dropping from the tag).
> > They are going to be different. Whether they're different in one or two
> > aspects is secondary to me. I rather view the consistency goal to be
> > with what we've been doing in the last so many releases.
> 
> Another aspect to look at would be version sorting. This will be interesting
> when e.g. having a Xen rpm package installed and upgrading it with a later
> version. I don't think we want to regard replacing an -rc version with the
> .0 version to be a downgrade, so the the version numbers should be sorted by
> "sort -V" in the correct order.

Packages version from distribution is not something we have to deal with
upstream. It's for the one writing the package version to make sure
that -rc are older than actual release.

While trying to to find if SPEC files where dealing with "-rc" suffix,
I found a doc for fedora telling how to deal with RCs:
https://docs.fedoraproject.org/en-US/packaging-guidelines/Versioning/
They say to replace the dash with a tilde, so "-rc" become "~rc", and
package manager know what to do with it.

Some other distribution know how to deal with "rc" suffix, but the dash
"-" isn't actually allowed in the version string:
https://man.archlinux.org/man/vercmp.8

So unless we forgo "-rc" in tags, there's no way we can take into
account how distributions package manager sorts version numbers. Also,
there's no need to, it is the job of the packager to deal with version
number, we just need to make is simple enough and consistent.

Cheers,

-- 
Anthony PERARD

