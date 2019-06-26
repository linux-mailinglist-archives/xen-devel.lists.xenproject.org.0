Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E9156FCE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 19:46:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgBy2-0002De-7E; Wed, 26 Jun 2019 17:44:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgBy0-0002DZ-Ue
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 17:44:20 +0000
X-Inumbo-ID: 05e0bb75-983a-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 05e0bb75-983a-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 17:44:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31DD8214DA;
 Wed, 26 Jun 2019 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561571058;
 bh=YIj5rFh6rawOmy8vHnWPEfW8M3J6JFoVkoOFLFmve64=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fSXGLIbGSBIwl0QhYeUf43Hxes6tK30LZ1bEmlqjzG/b2xiQQtpwY2NKibc4OBx6e
 AEP0t6Wr4I+WxxNkVJfhyB+EBLuY7FWv7kZkq90bBFzv4hLoXBUcTkf9brCwfmUntU
 11uEj2rLRIUoUwU/gPi2jjC+iJg8QXHJYfXIEpmg=
Date: Wed, 26 Jun 2019 10:44:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rich Persaud <persaur@gmail.com>
In-Reply-To: <1EF23097-B883-4C3E-8C6D-0F144A4216A0@gmail.com>
Message-ID: <alpine.DEB.2.21.1906261039390.5851@sstabellini-ThinkPad-T480s>
References: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
 <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
 <FDD05784-1F9E-4654-8E79-3D432C571D4C@gmail.com>
 <8eff1449-3e65-ed1c-6359-342a3df34d62@arm.com>
 <23191F9A-BDE0-4D9B-8F50-A87E9AA783FC@gmail.com>
 <D35E81B7-B96D-40A6-A112-B36D70CFEB4F@citrix.com>
 <1EF23097-B883-4C3E-8C6D-0F144A4216A0@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1807946207-1561571058=:5851"
Subject: Re: [Xen-devel] Xen Project Community Call June 27th (instead of
 July 4th): @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1807946207-1561571058=:5851
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Jun 2019, Rich Persaud wrote:
> > On Jun 26, 2019, at 06:45, Lars Kurth <lars.kurth@citrix.com> wrote:
> > 
> > 
> > 
> > ﻿On 25/06/2019, 21:27, "Rich Persaud" <persaur@gmail.com> wrote:
> > 
> >> On Jun 25, 2019, at 16:17, Julien Grall <julien.grall@arm.com> wrote:
> >> 
> >> Hi Rich,
> >> 
> >> On 6/25/19 8:38 PM, Rich Persaud wrote:
> >>>> On Jun 25, 2019, at 12:36, Lars Kurth <lars.kurth@citrix.com> wrote:
> >>>> 
> >>>> Hi all:
> >>>> please add your agenda items. I had only ONE series which was highlighted as needing attention from others. Is this seriously the only one?
> > 
> > We had quite a few additions to the agenda. One problem I have is that cryptpad history does not tell me who added an agenda item. We will have to manage this appropriately in the meeting.
> > 
> >>> Proposed agenda item: in the absence of Jira tickets, would it be useful to have a list (e.g. generated by a script) with the lifecycle status of all outstanding patch series, e.g.
> >>> METADATA
> >>> - bug fix / improvement / refactor / cleanup / new feature
> >>> - impacted Xen subsystems/components/features
> >>> - targeted version of Xen
> >>> - contributing person/org
> >>> - relevance of patch series to the goals set by RM for the next Xen release
> >>> - related patch series (with below status info)
> >>> STATUS:
> >>> - patch series version
> >>> - date of patch series v1
> >>> - no responses received + ping count + days since submission + days since ping
> >>> - reviewed with objections
> >>> - reviewed without objections, awaiting ack
> >>> - acked, awaiting merge
> >>> From such a summary, patch series could be prioritized for review/triage in the community call, based on uniform criteria and project-wide context.
> >> 
> >> While I think raising awareness of the stuck series is a good idea. I still have some concern regarding the prioritization. Who is going to consume the result of the discussion? Is it the maintainers?
> > 
> >   Anyone who typically answers the question raised by Lars in this thread, presumably a subset of call attendees.
> > 
> > This would only work if there was consensus on the priority amongst the key stake-holders. I believe that some limited prioritization has happened in the past, e.g. for some Arm related features for Xen 4.12 where, if I recall correctly you, Stefano and EPAM did this. 
> > 
> > Maybe we can trial this type of approach for a small number of series first. At the end of the day this is about queue management. Right now, when a new series comes in it ends up in one big queue (xen-devel@). Most complex series have to go through a series of gates (aka code reviews from different people) before they get applied and when a new version comes out the series ends up in the queue again: each reviewer today prioritizes their own review queues, where no-one else sees the prioritisation of other reviewers. Unless there is lot of spare review capacity (which there isn't) we essentially end up in grid-lock, with an ever-growing queue. We seem to have specific additional complexity in Xen because most recent series, typically involve a large number of reviewers.
> > 
> > In theory, there are several ways to address this:
> > * Queue management either by a set of agreed criteria which all reviewers follow or through some agreement about which series we actively try and shepherd through the gates
> > * We have an additional issue that in many areas we have multiple reviewers/committers reviewing the same area of code, which also frequently leads to slow-downs, because the multiple reviewers/committers can disagree. We could look at a model where the reviewers/committers agree that one takes the lead on reviewing a specific series. We could try and streamline the ownership structure to create a clearer mapping.
> > * The queues of each reviewer are somehow made public (assuming this is possible) and we hope that the system self-regulates. Not sure this will actually work
> > 
> > The big problem I have is that mailing lists really don't lend themselves well to highlight what is going on. We have been grappling with this for years and things are getting worse, not better.
> >
> > In past community calls when we tried to do this with specific series, in practice we ended up discovering obstacles that were concerning a specific series, such as unexposed dependencies, lack of HW, specs against which to review being too complex, ...
> > 
> > In any case, given that quite a few series were added to the agenda, maybe we shouldn't talk about process in the meeting, but see whether we can unblock those series. I am going to annotate some of the agenda items to highlight WHO needs to take action on items added
> > 
> > We could have a wider discussion about the process at the summit, as everyone who would need to be involved is at the summit.
> 
> This has likely been raised before, but ... could the Xen community use Github/Gitlab PRs to reduce the overhead of managing a review queue?  PR-based workflows have helped open-source projects to better utilize teams for review queue management.
> 
> PRs could be used in parallel with the existing mailing list patch process.  To link the two workflows, PR review comments could be mirrored to the mailing list, and a link to the PR included in the first patch of the series revisions.
> 
> If PRs are used, Jira can automatically link PRs that are associated with a XEN-nnnn ticket number.  With  PR comment mirroring, the mailing list would remain the definitive archive of review comments.  There may also be opportunities for integration with Xen's Gitlab CI, e.g. series testing on multiple architectures.

Yes, this has been brought up in the past, and the majority (me
included) preferred doing doing reviews on a mailing list. However,
patchworks has been getting better and better and should now be able to
give you a github-like web interface to patch series submissions and
reviews while retaining the mailing list based workflow most still
prefer. I know patchworks has also been used to trigger testing by some.
I don't know the state of the patchworks instance for Xen.
--8323329-1807946207-1561571058=:5851
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1807946207-1561571058=:5851--

