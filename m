Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D692E779D3B
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 07:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582820.912793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUhA7-00017n-W6; Sat, 12 Aug 2023 05:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582820.912793; Sat, 12 Aug 2023 05:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUhA7-00014i-SZ; Sat, 12 Aug 2023 05:27:43 +0000
Received: by outflank-mailman (input) for mailman id 582820;
 Sat, 12 Aug 2023 05:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qUhA6-00014b-OF
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 05:27:42 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1eedf90-38d0-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 07:27:37 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 37C5RL9m032320
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 12 Aug 2023 01:27:26 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 37C5RJVd032319;
 Fri, 11 Aug 2023 22:27:19 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f1eedf90-38d0-11ee-8613-37d641c3527e
Date: Fri, 11 Aug 2023 22:27:19 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
Message-ID: <ZNcYN12yW6c4l4ZH@mattapan.m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
 <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
 <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
 <8074634d-fd76-43fc-8e0f-4c3a70ea5360@xen.org>
 <ZMvnqAJuBQSVbKYc@mattapan.m5p.com>
 <82914e71-fa96-490c-b584-a90045a71567@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82914e71-fa96-490c-b584-a90045a71567@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Aug 03, 2023 at 06:48:33PM +0100, Julien Grall wrote:
> Hi,
> 
> On 03/08/2023 18:45, Elliott Mitchell wrote:
> > On Thu, Aug 03, 2023 at 05:34:31PM +0100, Julien Grall wrote:
> >>
> >> Not sure if this is related to the lack of answer. But I didn't receive
> >> any of your patches via xen-devel (I received your replies). Skimming
> >> through the bounce for the xenproject mail server, I noticed a lot of
> >> the following:
> >>
> >>       host gmail-smtp-in.l.google.com [142.250.123.26]
> >>       SMTP error from remote mail server after pipelined end of data:
> >>       550-5.7.1 This message is not RFC 5322 compliant. There are
> >> multiple Cc headers.
> >>       550-5.7.1 To reduce the amount of spam sent to Gmail, this message
> >> has been
> >>       550-5.7.1 blocked. Please visit
> >>       550 5.7.1
> >> https://support.google.com/mail/?p=RfcMessageNonCompliant
> >> t7-20020a81e447000000b005839e8b595dsi12027284ywl.554 - gsmtp
> > 
> > That seems to be repotting a bug in `scripts/add_maintainers.pl`.
> 
> I am curious to know why you think so?
> 
> I have been using scripts/add_maintainers.pl for quite a while and so 
> far never seen any of my e-mail blocked.
> 
> My usual runes are:
> 
> 42sh> scripts/add_maintainers.pl -d .
> 42sh> git-send-email *.patch
> 
> What's yours?

Final steps are:

scp -r snd mailserver:
for f in snd/0*.patch
do sendmail -t < "$f"
	sleep 45
done

Issue with `git send-email` is it really needs all the setup of a MUA,
and I prefer to keep `git` on a distinct host.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



