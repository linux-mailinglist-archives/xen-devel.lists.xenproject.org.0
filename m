Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE625843A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 00:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCsi7-000334-ES; Mon, 31 Aug 2020 22:55:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zoll=CJ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kCsi5-00032z-W9
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 22:55:34 +0000
X-Inumbo-ID: 4faa554f-035f-4b12-b45f-9ece0dccd9e8
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4faa554f-035f-4b12-b45f-9ece0dccd9e8;
 Mon, 31 Aug 2020 22:55:33 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07VMtIux014355
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 31 Aug 2020 18:55:23 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07VMtH4x014354;
 Mon, 31 Aug 2020 15:55:17 -0700 (PDT) (envelope-from ehem)
Date: Mon, 31 Aug 2020 15:55:17 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
Message-ID: <20200831225517.GA11156@mattapan.m5p.com>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
 <20200831063748.GB1522@mattapan.m5p.com>
 <ccab621e-9962-6715-896d-30e6bb8b9520@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccab621e-9962-6715-896d-30e6bb8b9520@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 31, 2020 at 10:04:54AM +0000, George Dunlap wrote:
> 
> Storing the extra paragraph in git is cheap; trying to reconstruct why someone made a change 10 years after the fact is often difficult.  Probably not worth a re-send ??? it can be moved into the commit message by the committer; but if you???re going to send v2 anyway, might as well move it in.
> 

I'm pretty sure there will be at this point.  Just an issue of how many
more adjustments there will be.


On Mon, Aug 31, 2020 at 08:52:45AM +0200, Jan Beulich wrote:
> On 31.08.2020 08:37, Elliott Mitchell wrote:
> > On Fri, Aug 28, 2020 at 09:24:41AM +0200, Jan Beulich wrote:
> >> On 28.08.2020 04:57, Elliott Mitchell wrote:
> >>> Subdirectories which have .gitignore files should not be referenced in
> >>> the global .gitignore files.  Move several lines to appropriate subdirs.
> >>>
> >>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> >>>
> >>> ---
> >>> Hopefully the commit message covers it.  When moved to the subdirectories
> >>> I'm using "./<file>" as otherwise any file sharing the name in a deeper
> >>> subdirectory would be subject to the match.
> >>
> >> May I ask why this last sentence isn't part of the commit message?
> > 
> > My thinking is it was pretty straightforward to figure out when looking.
> > Not /quite/ obvious enough to avoid commenting in e-mail, but not quite
> > obscure enough to have in commit message.  This can go either way really.
> 
> Your statements below really look to me as if this wasn't this obvious
> at all - ...

Things were sufficiently obvious when it was important.  This though is
not an issue worthy of more discussion since I've got no real objection
to including the extra sentence.  I suspect there will be more changes
though...


> > The .gitignore files aren't very consistent.  I'm unsure whether it is
> > worth going after the inconsistencies, but it is certainly there.
> > 
> > Before this I noticed xen/xsm/flask/.gitignore had "/policy.c", which
> > overlapped with "xen/xsm/flask/policy.*" in the top-level .gitignore.
> > Checking the documentation on .gitignore files if it simply had
> > "policy.c", git would have ignored any file name "policy.c" in
> > subdirectories.
> > 
> > Is it better to prefix lines in the current directory with "./" versus
> > "/"?  (I kind of like "./" since it looks like a relative path, but it
> > *isn't* actually a relative path)
> 
> ... you even look to suggest here that there are two alternative
> forms which both have the same meaning. Personally I agree that
> ./ may be more "natural" to use than /, but the question then is
> what the conventions are. I can't answer this.
> 
> > Should files in subdirectories also include "./"?
> 
> If "no prefix at all" includes, as you say, also files in subdirs,
> then the answer probably is "depends".
> 
> > Preferences in sorting?
> 
> Alphabetical sorting is what we generally aim for here.

Going into specific example since those best demonstrate what I
observed.

Before this patch the top-level .gitignore included the lines:
@@
-tools/misc/cpuperf/cpuperf-perfcntr
-tools/misc/cpuperf/cpuperf-xen
-tools/misc/xc_shadow
-tools/misc/xen_cpuperf
-tools/misc/xen-cpuid
@@
-xen/xsm/flask/policy.*
-xen/xsm/flask/xenpolicy-*
 tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
 xen/xen
@@

tools/misc/.gitignore had the single line:
xen-ucode

xen/xsm/flask/.gitignore had the single line:
/policy.c


You'll note from the second batch, .gitignore isn't consistently sorted.

xen/xsm/flask/.gitignore was actually good since it caused me to look at
the documentation for gitignore.  The effect is xen/xsm/flask/policy.c
is ignored, but xen/xsm/flask/policy/policy.c and
xen/xsm/flask/ss/policy.c will *not* be ignored.

tools/misc/.gitignore's format means if in the future subdirectories "a"
or "b" got created, tools/misc/a/xen-ucode and tools/misc/b/xen-ucode
*would* be ignored in addition to tools/misc/xen-ucode.  When looking at
the situation I decided this was /likely/ wrong, and so changed to
"./xen-ucode".

So there are a few variants of how tools/misc/.gitignore could look
after a patch.  Two sets of lines demonstrating the possibilities:

Example 0:
./cpuperf/cpuperf-perfcntr
./cpuperf/cpuperf-xen
./lowmemd
./xc_shadow

Example 1:
cpuperf/cpuperf-perfcntr
cpuperf/cpuperf-xen
/lowmemd
/xc_shadow

So which prefix is better for files in the current directory, "./" or
"/"?  "./" looks more like a reference to the current directory, "/" is
shorter and the single pre-existing example used the latter.

Should the paths "cpuperf/cpuperf-perfcntr" and "cpuperf/cpuperf-xen"
include that prefix?  I'm inclined towards having it everywhere for
greater consistency, but I'm not fully set in this strategy.


In other news, I think the tools/ and xen/ directories need their own
.gitignore files.  They are the largest portion of targeted filenames
and thus seem likely candidates for breaking off.

docs/ and stubdom/ are also candidates for similar action, though not as
big as the former.

This falls under the same heading of moving things from top-level
.gitignore to subdirectories, but since the above didn't already have
.gitignore files this could be worthy of a separate patch.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



