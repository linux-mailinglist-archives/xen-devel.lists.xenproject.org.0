Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24143892CE
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 17:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130200.244024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOHp-0007ea-TC; Wed, 19 May 2021 15:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130200.244024; Wed, 19 May 2021 15:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljOHp-0007dJ-Pk; Wed, 19 May 2021 15:39:05 +0000
Received: by outflank-mailman (input) for mailman id 130200;
 Wed, 19 May 2021 15:39:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ljOHo-0007cS-Oi
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 15:39:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ljOHo-0004bL-Mw
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 15:39:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1ljOHo-000111-Lp
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 15:39:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1ljOHm-0004F8-Un; Wed, 19 May 2021 16:39:02 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=KDO5B+1IHs/ZjRDt6ZAGhi+fYL+oqJkh2SN66X1QhiQ=; b=etEbEcRnoa7qAxhJ7GKwXqHmoY
	FAxcsLP4r9+nOmEdFvk6B11OFc0URGwZHoDQB3qh6T7Qr4Y1x8YYR5GY08fJNFBm0F/0Txab4+rD0
	7QyInrfXwsDvFKKariFs8B4MQfhUYgPIHPQL6XGoC2BXAmXQthWrjKsthXuapHthV4xU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24741.12566.639691.461134@mariner.uk.xensource.com>
Date: Wed, 19 May 2021 16:39:02 +0100
To: xen-devel@lists.xenproject.org
CC: community.manager@xenproject.org
Subject: IRC networks
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Summary:

We have for many years used the Freenode IRC network for real-time
chat about Xen.  Unfortunately, Freenode is undergoing a crisis.

There is a dispute between, on the one hand, Andrew Lee, and on the
other hand, all (or almost all) Freenode volunteer staff.  We must
make a decision.

I have read all the publicly available materials and asked around with
my contacts.  My conclusions:

 * We do not want to continue to use irc.freenode.*.
 * We might want to use libera.chat, but:
 * Our best option is probably to move to OFTC https://www.oftc.net/


Discussion:

Firstly, my starting point.

I have been on IRC since at least 1993.  Currently my main public
networks are OFTC and Freenode.

I do not have any personal involvement with public IRC networks.  Of
the principals in the current Freenode dispute, I have only heard of
one, who is a person I have experience of in a Debian context but have
not worked closely with.

George asked me informally to use my knowledge and contacts to shed
light on the situation.  I decided that, having done my research, I
would report more formally and publicly here rather than just
informally to George.


Historical background:

 * Freenode has had drama before.  In about 2001 OFTC split off from
   Freenode after an argument over governance.  IIRC there was drama
   again in 2006.  Significant proportion of the Free Software world,
   including Debian, now use OFTC.  Debian switched in 2006.

Facts that I'm (now) pretty sure of:

 * Freenode's actual servers run on donated services; that is,
   the hardware is owned by those donating the services, and the
   systems are managed by Freenode volunteers, known as "staff".

 * The freenode domain names are currently registered to a limited
   liability company owned by Andrew Lee (rasengan).

 * At least 10 Freenode staff have quit in protest, writing similar
   resignation letters protesting about Andrew Lee's actions [1].  It
   does not appear that any Andrew Lee has the public support of any
   Freenode staff.

 * Andrew Lee claims that he "owns" Freenode.[2]

 * A large number of channel owners for particular Free Software
   projects who previously used Freenode have said they will switch
   away from Freenode.

Discussion and findings on Freenode:

There is, as might be expected, some murk about who said what to whom
when, what promises were made and/or broken, and so on.  The matter
was also complicated by the leaking earlier this week of draft(s) of
(at least one of) the Freenode staffers' resignation letters.

Andrew Lee has put forward a position statement [2].  A large part of
the thrust of that statement is allegations that the current head of
Freenode staff, tomaw, "forced out" the previous head, christel.  This
allegation is strongly disputed by by all those current (resigning)
Freenode staff I have seen comment.  In any case it does not seem to
be particularly germane; in none of my reading did tomaw seem to be
playing any kind of leading role.  tomaw is not mentioned in the
resignation letters.

Some of the links led to me to logs of discussions on #freenode.  I
read some of these in particular[3].  MB I haven't been able to verify
that these logs have not been tampered with.  Having said that and
taking the logs at face value, I found the rasengan writing there to
be disingenuous and obtuse.

Andrew Lee has been heavily involved in Bitcoin.  Bitcoin is a hive of
scum and villainy, a pyramid scheme, and an environmental disaster,
all rolled into one.  This does not make me think well of Lee.

Additionally, it seems that Andrew Lee has been involved in previous
governance drama involving a different IRC network, Snoonet.

I have come to the very firm conclusion that we should have nothing to
do with Andrew Lee, and avoid using services that he has some
effective control over.

Alternatives:

The departing Freenode staff are setting up a replacement,
"libera.chat".  This is operational but still suffering from teething
problems and of course has a significant load as it deals with an
influx of users on a new setup.

On the staff and trust question: As I say, I haven't heard of any of
the Freenode staff, with one exception.  Unfortunately the one
exception does not inspire confidence in me[4] - although NB that is
only one data point.

On the other hand, Debian has had many many years of drama-free
involvement with OFTC.  OFTC has a formal governance arrangement and
it is associated with Software in the Public Interest.  I notice that
the last few OFTC'[s annual officer elections have been run partly by
Steve McIntyre.  Steve is a friend of mine (and he is a former Debian
Project Leader) and I take his involvement as a good sign.

I recommend that we switch to using OFTC as soon as possible.


Ian.


References:

Starting point for the resigning Freenode staff's side [1]:
  https://gist.github.com/joepie91/df80d8d36cd9d1bde46ba018af497409

Andrew Lee's side [2]:
  https://gist.github.com/realrasengan/88549ec34ee32d01629354e4075d2d48

[3]
https://paste.sr.ht/~ircwright/7e751d2162e4eb27cba25f6f8893c1f38930f7c4

[4] I won't give the name since I don't want to be shitposting.

