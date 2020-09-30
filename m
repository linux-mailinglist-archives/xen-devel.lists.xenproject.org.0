Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A027E3E2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.486.1545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXay-0004JX-CW; Wed, 30 Sep 2020 08:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486.1545; Wed, 30 Sep 2020 08:36:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXay-0004J7-8q; Wed, 30 Sep 2020 08:36:16 +0000
Received: by outflank-mailman (input) for mailman id 486;
 Wed, 30 Sep 2020 08:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNXax-0004Ix-17
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:36:15 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bc53844-51d7-4d95-a7c3-61d084efdb20;
 Wed, 30 Sep 2020 08:36:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t10so796849wrv.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:36:13 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id v17sm1704718wrc.23.2020.09.30.01.36.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:36:12 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNXax-0004Ix-17
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:36:15 +0000
X-Inumbo-ID: 0bc53844-51d7-4d95-a7c3-61d084efdb20
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0bc53844-51d7-4d95-a7c3-61d084efdb20;
	Wed, 30 Sep 2020 08:36:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t10so796849wrv.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=kgznG0vBW5d13wzA8i0goWQfq2Xlr3+NUkaBg5pXCgc=;
        b=nEMmc71Vcn8ejx3O7HdGp6Bxc7p3SWCK641pbqvxYXgEsk6qfZmMEP87gnFdzg0w2K
         Guc793lLUOXvlQ4D1DcSmKZKKgp0upAyWadkWUpHBpLkKhwUi2R9SV6jHw4ojp1eF+Dq
         6rLxqVGME37PbQEwOf+emCZuDNFfRL79rKMHgPFV3ZVvFJcwjOdZmNhdiY9k3sTYQ76P
         BT9rlGqYKaufUn1wCW9BqqxfMl5wOt0hObEfk5/Oth52Hwk2hYqIFNRebmDXU8kX6VCk
         lw1nRJx4ECAXTUbBtG51u/hlQOXlnUB2aoPqckD1hfVDtjbARBBlwi5k4aWeIzpSjjsT
         Ariw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=kgznG0vBW5d13wzA8i0goWQfq2Xlr3+NUkaBg5pXCgc=;
        b=Sdh3bDz4OlxFikSsbGXny/zdK4U3wWryrCfbdYwNhv+w4WJl2Kr0X3O6J5GJZueuvL
         wKSguxTyp4UfBySk9glleV6bFlLoPMRdvGwVIrChwUHZnmSlJMlZVOf2uvQH3EfnS61z
         Z4mWipweghGqVZKi24MV10MSBS9MAPGUNRYSaqDvBpcqEvSMlEuAzS7Am65foRJW2iOC
         qn8rb22JL2MP7bVnoj7vHGJ97lJydBsvsrS3RsjpKWJnYwJASh6lVp85E0YhssTetf79
         GjmQhL5dK08qApLkDOn+4IjZTgjUOHbK1UNATis88HSXgEObcn2ceenZkzRh7OQYTzYr
         RPfA==
X-Gm-Message-State: AOAM5302y/rtOX4U6JDQQ8UDzEFgMje/N6S7pzgZX2Qq15dzmW/PGMEr
	pOfc6SdjQBBkCOeU3aP1CuQ=
X-Google-Smtp-Source: ABdhPJzpF2QrSXkStLCYCTqmQusAxCC5O6EnOeoJnTqA4yEmXayi/VOXqGckPMGg8f+k6NXTbRfpbw==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr1955059wrn.220.1601454972889;
        Wed, 30 Sep 2020 01:36:12 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id v17sm1704718wrc.23.2020.09.30.01.36.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 01:36:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com> <004201d696fb$a5bd90b0$f138b210$@xen.org> <7b2c9760-63d4-ce3c-b47f-20827f2049fc@suse.com>
In-Reply-To: <7b2c9760-63d4-ce3c-b47f-20827f2049fc@suse.com>
Subject: RE: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
Date: Wed, 30 Sep 2020 09:36:11 +0100
Message-ID: <005f01d69704$c0c11130$42433390$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgH3Y/QXAi8EHwkCHXF85qkWqnBg

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 30 September 2020 09:32
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
> <George.Dunlap@eu.citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Julien Grall' <julien@xen.org>;
> 'Wei Liu' <wl@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>
> Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
> 
> On 30.09.2020 09:31, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 30 September 2020 07:42
> >> To: paul@xen.org
> >> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
> >> <George.Dunlap@eu.citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Julien Grall' <julien@xen.org>;
> >> 'Wei Liu' <wl@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>
> >> Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
> >>
> >> On 29.09.2020 18:31, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> >>>> Sent: 28 September 2020 11:58
> >>>> To: xen-devel@lists.xenproject.org
> >>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> >>>> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano
> >> Stabellini
> >>>> <sstabellini@kernel.org>
> >>>> Subject: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
> >>>>
> >>>> evtchn_fifo_set_pending() (invoked with the per-channel lock held) has
> >>>> two uses of the channel's priority field.
> >>>
> >>> AFAICT it is invoked with only the sending end's lock held...
> >>>
> >>>> The field gets updated by
> >>>> evtchn_fifo_set_priority() with only the per-domain event_lock held,
> >>>> i.e. the two reads may observe two different values. While the 2nd use
> >>>> could - afaict - in principle be replaced by q->priority, I think
> >>>> evtchn_set_priority() should acquire the per-channel lock in any event.
> >>>>
> >>>
> >>> ... so how is this going to help?
> >>
> >> I guess the reasoning needs to change here - it should focus solely
> >> on using the finer grained lock here (as holding the per-domain one
> >> doesn't help anyway). It would then be patch 10 which addresses the
> >> (FIFO-specific) concern of possibly reading inconsistent values.
> >>
> >
> > Yes, it looks like patch #10 should ensure consistency.
> >
> > Prior to ad34d0656fc at least the first layer of calls done in evtchn_send() didn't take the evtchn
> itself as an arg. Of course, evtchn_set_pending() then looked up the evtchn and passed it to
> evtchn_port_set_pending() without any locking in the interdomain case. I wonder whether, to make
> reasoning easier, there ought to be a rule that ABI entry points are always called with the evtchn
> lock held?
> 
> What do you mean by "ABI entry points" here? To me this would sound
> like what's directly accessible to guests, but that's hardly what
> you mean. Do you perhaps mean the hooks in struct evtchn_port_ops?

Yes, by ABI I mean 'fifo' or '2l'. (I guess that 'ABI' is just the name I chose to refer to them in the Windows PV driver code).

> As per the comment that got added there recently, the locking
> unfortunately is less consistent there.
> 

I looked to me that most functions were entered with channel lock held so wondered whether it could be a rule.

  Paul

> Jan


