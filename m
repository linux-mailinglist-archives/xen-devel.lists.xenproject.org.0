Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD595759B69
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565978.884651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAN4-0007tE-L0; Wed, 19 Jul 2023 16:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565978.884651; Wed, 19 Jul 2023 16:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAN4-0007qt-Hj; Wed, 19 Jul 2023 16:49:50 +0000
Received: by outflank-mailman (input) for mailman id 565978;
 Wed, 19 Jul 2023 16:49:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMAN3-0007Ku-Am
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:49:49 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 446b9b3e-2654-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:49:47 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGnXA0033956
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:49:39 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGnXcG033955;
 Wed, 19 Jul 2023 09:49:33 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 446b9b3e-2654-11ee-b23a-6b7b168915f2
Date: Wed, 19 Jul 2023 09:49:33 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] docs/xen-tscmode: remove mention of numeric tsc_mode=
 values
Message-ID: <ZLgUHZ7U4s1XOb7v@mattapan.m5p.com>
References: <a8223a339a0b8ff3c0d04fb4ee2913c7558cc131.1689294071.git.ehem+xen@m5p.com>
 <ZLCj62XMBbspMWbY@mail-itl>
 <ZLDErKk8ziBuh1ZJ@mattapan.m5p.com>
 <b3db9387-8139-e7f8-d250-9933e288f9fc@suse.com>
 <ZLb9AhaoJDixR7Nf@mattapan.m5p.com>
 <98422c1d-ce7f-7700-20f7-54b5e68b63ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98422c1d-ce7f-7700-20f7-54b5e68b63ff@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Wed, Jul 19, 2023 at 08:24:15AM +0200, Jan Beulich wrote:
> On 18.07.2023 22:58, Elliott Mitchell wrote:
> > On Fri, Jul 14, 2023 at 09:21:59AM +0200, Jan Beulich wrote:
> >> On 14.07.2023 05:44, Elliott Mitchell wrote:
> >>> On Fri, Jul 14, 2023 at 03:24:59AM +0200, Marek Marczykowski-Górecki wrote:
> >>>> On Thu, Jul 13, 2023 at 05:16:40PM -0700, Elliott Mitchell wrote:
> >>>>> The better to encourage moving to setting via string mode names.
> >>>>
> >>>> The numeric values needs to remain documented, otherwise interpreting
> >>>> pre-existing configs (that may use them) will be tricky.
> >>>
> >>> Problem is the way it is documented tends to encourage continued use of
> >>> the numeric values (notice how reports irt Zen 4 mention "tsc_mode=1").
> >>>
> >>> `parse_config_data()` suggests the appropriate string value, so nominally
> >>> that should take care of older configurations.  If "xen-tscmode" really
> >>> needs to continue mentioning the numeric value, it should be in
> >>> parentheses and with "old value" to suggest moving away from that.
> >>
> >> I'm not sure about "old" (we can't change the values without breaking
> >> backwards compatibility), but the numeric values will want mentioning
> >> alongside their spelled out names.
> > 
> > Then why is there a warning message about numeric tsc_mode in
> > `parse_config_data()`?
> 
> I'm afraid this question can only be answered by whoever was involved
> in adding the warning.

I already tracked that down, commit af3b530c03 by Ian Campbell.  Appears
Ian Campbell has moved onto other things and may not be readily
accessible.

The messages themselves seem to suggest >10 years ago Ian Campbell wanted
to get rid of the numeric values for tsc_mode.  Problem is one debug
string was left in and the documentation doesn't discourage the numeric
values.  As such they may still be heavily used.

What needs to happen is a decision of which direction to push needs to be
made.  Then that direction needs to be consistently pushed.

Notice the immediately prior message trying to get rid of the
printf-debugging.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



