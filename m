Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5F63FA26
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451249.708908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rYZ-0006eY-98; Thu, 01 Dec 2022 21:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451249.708908; Thu, 01 Dec 2022 21:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0rYZ-0006c4-5S; Thu, 01 Dec 2022 21:57:23 +0000
Received: by outflank-mailman (input) for mailman id 451249;
 Thu, 01 Dec 2022 21:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhpc=37=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1p0rYX-0006by-IH
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:57:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ecbb62a-71c3-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 22:57:18 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2B1LunS3065313
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 1 Dec 2022 16:56:54 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2B1Lunlf065312;
 Thu, 1 Dec 2022 13:56:49 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 1ecbb62a-71c3-11ed-91b6-6bf2151ebd3b
Date: Thu, 1 Dec 2022 13:56:49 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [ANNOUNCE] Call for agenda items for 1 December Community Call @
 1600 UTC
Message-ID: <Y4kjIaU6PxrR9UcB@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CDEE837E-887F-4386-9EF4-E57C2057C4EC@citrix.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Nov 24, 2022 at 05:11:36PM +0000, George Dunlap wrote:
> 
> == Dial-in Information ==
> ## Meeting time
> 16:00 - 17:00 UTC
> Further International meeting times:
> https://www.timeanddate.com/worldclock/meetingdetails.html?year=2022&month=12&day=1&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> 

I guess I have to ask, what is the goal of the Community Call?  Neither
this message, nor the wiki page
(https://wiki.xenproject.org/wiki/Community_Call) say much about the
Community Call.

Varies from place to place, but many places meeting times are more
aspirational than ridged.  As such I felt rather disparaged by being
careful about time, but no (obvious) effort spent prioritizing items.

This seemed to be being pointed out at the end of D.3, which was meant as
low-priority, but was dealt with first purely due to being added first.
Then most of the time was spent on D.4 when D.9 actually seemed a rather
timely issue (the idea to get a bit of consideration before 4.17).

Problem with D.1 being at the start is it was unexpected half the agenda
would be thrown in the garbage due to time.  Could I suggest the 10th as
better?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



