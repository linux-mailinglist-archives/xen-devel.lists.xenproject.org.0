Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310CA640F1B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 21:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452273.710092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1CUc-0002Rn-4W; Fri, 02 Dec 2022 20:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452273.710092; Fri, 02 Dec 2022 20:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1CUc-0002Oz-0n; Fri, 02 Dec 2022 20:18:42 +0000
Received: by outflank-mailman (input) for mailman id 452273;
 Fri, 02 Dec 2022 20:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cQDv=4A=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1p1CUa-0002Ot-G5
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 20:18:40 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80c87af7-727e-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 21:18:38 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2B2KIFl5075715
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 2 Dec 2022 15:18:21 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2B2KIF5f075714;
 Fri, 2 Dec 2022 12:18:15 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 80c87af7-727e-11ed-91b6-6bf2151ebd3b
Date: Fri, 2 Dec 2022 12:18:15 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [ANNOUNCE] Call for agenda items for 1 December Community Call @
 1600 UTC
Message-ID: <Y4pdhzQBdI77b5oR@mattapan.m5p.com>
References: <Y4kjIaU6PxrR9UcB@mattapan.m5p.com>
 <A28E972F-8F8E-4370-9BCC-A56E8D19674E@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A28E972F-8F8E-4370-9BCC-A56E8D19674E@citrix.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Dec 02, 2022 at 11:17:18AM +0000, George Dunlap wrote:
> 
> 
> > On 1 Dec 2022, at 21:56, Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > 
> > On Thu, Nov 24, 2022 at 05:11:36PM +0000, George Dunlap wrote:
> >> 
> >> == Dial-in Information ==
> >> ## Meeting time
> >> 16:00 - 17:00 UTC
> >> Further International meeting times:
> >> https://www.timeanddate.com/worldclock/meetingdetails.html?year=2022&month=12&day=1&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> >> 
> 
> Ellliot,
> 
> Thanks for your feedback.  Replies in-line.
> 
> > I guess I have to ask, what is the goal of the Community Call?  Neither
> > this message, nor the wiki page
> > (https://wiki.xenproject.org/wiki/Community_Call) say much about the
> > Community Call.
> 
> The goal of the call in general is just to talk about things that need talking about.  We obviously have the mailing list, but sometimes discussions here are easy to miss; and sometimes a discussion can get sorted out more quickly with a fast back-and-forth than with long email chains.  The intent has always been that if we start getting one topic that consistently 1) takes up a large amount of time and 2) only requires a subset of the attendees, to split it off into a separate meeting.
> 

The page on the wiki and announcement should provide some sort of
statement.  I'm still unsure the two items I was proposing were good
candidates as they're more "these two /should/ be getting more
attention".

> > This seemed to be being pointed out at the end of D.3, which was meant as
> > low-priority, but was dealt with first purely due to being added first.
> > Then most of the time was spent on D.4 when D.9 actually seemed a rather
> > timely issue (the idea to get a bit of consideration before 4.17).
> 
> To be honest, part of my reluctance to move that one up in the agenda was because it was my own item.  Even with the number of items ahead of it, I didn’t expect it to be a problem to get to — there were several items which took much longer to discuss than I was expecting.  In the future I’ll be more pro-active about trying to prioritize things.
> 

First there is a need to know whether things can run long or not.  If
key people need to drop out right at the end of the specified time,
prioritization is important.  If everyone can run long, then in-order is
fine.

> > Problem with D.1 being at the start is it was unexpected half the agenda
> > would be thrown in the garbage due to time.  Could I suggest the 10th as
> > better?
> 
> The 10th of January instead of the 12th of January?  Why is that better?
> 
> I work as a stay-at-home dad on Tuesdays, so I wouldn’t be able to chair the meeting if it was on the 10th.
> 

As stated, I didn't expect everything to get dropped on the floor and so
didn't comment on the 12th being no-go for me.  I've no idea which dates
work better for whom, but the 10th or before is workable for me (heck,
even the 29th is viable, but I suspect that will be worse for others).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



