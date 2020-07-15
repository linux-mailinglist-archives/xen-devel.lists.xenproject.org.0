Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7C220991
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:09:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveLL-0006JF-CY; Wed, 15 Jul 2020 10:08:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jveLK-0006J3-Fo
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:08:50 +0000
X-Inumbo-ID: 2d58c5f6-c683-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d58c5f6-c683-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594807730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cGrDsOEoLyOteeerMRk2P3sBspylXAN/qJf+Rk+bvt0=;
 b=S+yPkYyUq7rNJ07tH4UiBhVRd5h3lo2vOSGX9nfV1WYY7l93GpCD3A9k
 6a12i7Fiu0Wl29UBe8TEuYA86jbC1z6HHJ2A/NidhorIAE61PUcpWhX2z
 kOFUQiCqI+AXjvAc3D7XtvJ3q+eLbOTnUxFsLQBntHaBHFPlS3JiI+03I 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yEpYYOSdvyTEluRmTLmNzznYnwMoMBgGUgl8/4owaGDjcTXjy8O9JVfXGOt1lG05WgawR5UN3X
 WsSyFRGEBwxujyKrDTaCiit20my6J/YCBOvdN9KOUIiaZFl77ZngML+gWyp8fgT88FWZQg9iG6
 T33B9dK+4cQwYl3/XV1/+X1tF+AN7KPc+gnm4zqjQrDDCdrdDQTlVTMVXHK0mLZyCwszXe8tQ6
 yjRnW/7He9becOyLZEpIMxrj03v3aeuNeL4q9Uz+1XgjUidprw+8k2w6O/YWqWT2RRKtqZeUIA
 yeE=
X-SBRS: 2.7
X-MesageID: 22413213
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,354,1589256000"; d="scan'208";a="22413213"
Date: Wed, 15 Jul 2020 12:08:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 6/7] flask: drop dead compat translation code
Message-ID: <20200715100841.GW7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <7711f68d-394e-a74f-81fa-51f8447174ce@suse.com>
 <20200714145800.GO7191@Air-de-Roger>
 <937a51c5-7563-0ac2-4ada-b4dfd7a5d636@suse.com>
 <20200715084115.GS7191@Air-de-Roger>
 <9dc3e0fd-3e1a-5bd0-b8c7-01287e5c2c93@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dc3e0fd-3e1a-5bd0-b8c7-01287e5c2c93@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 10:52:28AM +0200, Jan Beulich wrote:
> On 15.07.2020 10:41, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 08:42:44AM +0200, Jan Beulich wrote:
> >> On 14.07.2020 16:58, Roger Pau Monné wrote:
> >>> On Wed, Jul 01, 2020 at 12:28:07PM +0200, Jan Beulich wrote:
> >>>> Translation macros aren't needed at all (or else a devicetree_label
> >>>> entry would have been missing), and userlist has been removed quite some
> >>>> time ago.
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> --- a/xen/include/xlat.lst
> >>>> +++ b/xen/include/xlat.lst
> >>>> @@ -148,14 +148,11 @@
> >>>>  ?	xenoprof_init			xenoprof.h
> >>>>  ?	xenoprof_passive		xenoprof.h
> >>>>  ?	flask_access			xsm/flask_op.h
> >>>> -!	flask_boolean			xsm/flask_op.h
> >>>>  ?	flask_cache_stats		xsm/flask_op.h
> >>>>  ?	flask_hash_stats		xsm/flask_op.h
> >>>> -!	flask_load			xsm/flask_op.h
> >>>>  ?	flask_ocontext			xsm/flask_op.h
> >>>>  ?	flask_peersid			xsm/flask_op.h
> >>>>  ?	flask_relabel			xsm/flask_op.h
> >>>>  ?	flask_setavc_threshold		xsm/flask_op.h
> >>>>  ?	flask_setenforce		xsm/flask_op.h
> >>>> -!	flask_sid_context		xsm/flask_op.h
> >>>>  ?	flask_transition		xsm/flask_op.h
> >>>
> >>> Shouldn't those become checks then?
> >>
> >> No, checking will never succeed for structures containing
> >> XEN_GUEST_HANDLE(). But there's no point in generating xlat macros
> >> when they're never used. There are two fundamentally different
> >> strategies for handling the compat hypercalls: One is to wrap a
> >> translation layer around the native hypercall. That's where the
> >> xlat macros come into play. The other, used here, is to compile
> >> the entire hypercall function a second time, arranging for the
> >> compat structures to get used in place of the native ones. There
> >> are no xlat macros involved here, all that's needed are correctly
> >> translated structures. (For completeness, x86's MCA hypercall
> >> uses yet another, quite adhoc strategy for handling, but also not
> >> involving any xlat macro use. Hence the consideration there to
> >> possibly drop the respective lines from the file here.)
> > 
> > Thanks, I think this explanation is helpful and I wonder whether it
> > would be possible to have something along this lines in a file or as a
> > comment somewhere, maybe at the top of xlat.lst?
> 
> To be honest - I'm not sure: Such a comment may indeed be helpful
> to have, but I don't think I can see any single good place for it
> to live. For people editing xlat.lst (a file the existence of which
> many aren't even aware of), this would be a good place. But how
> would others have any chance of running into this comment?

I would add it to xlat.lst rather than not adding it at all.

If we can find a better place to add it I'm all in, but as said I
would rather add it somewhere right now than just defer adding it
until the perfect placement is found.

> > Also could you add a line to the commit message noting that flask code
> > doesn't use any of the translation macros because it follows a
> > different approach to compat handling?
> 
> I've made the sentence start "Translation macros aren't used (and
> hence needed) at all ..." - is that enough of an adjustment?

Yes, that's fine.

Thanks.

