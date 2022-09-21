Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0AC5E4F80
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 20:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409877.652875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob4Xj-0007ks-Pq; Wed, 21 Sep 2022 18:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409877.652875; Wed, 21 Sep 2022 18:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob4Xj-0007hg-N2; Wed, 21 Sep 2022 18:33:55 +0000
Received: by outflank-mailman (input) for mailman id 409877;
 Wed, 21 Sep 2022 18:33:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAtj=ZY=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ob4Xh-0007ha-VS
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 18:33:53 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef86fb44-39db-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 20:33:51 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 28LIWOn8002873
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 21 Sep 2022 14:33:33 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 28LIWOv1002872;
 Wed, 21 Sep 2022 11:32:24 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ef86fb44-39db-11ed-9647-05401a9f4f97
Date: Wed, 21 Sep 2022 11:32:24 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Vipul Suneja <vsuneja63@gmail.com>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: How to do display sharing between guests or bring up guests
 display
Message-ID: <YytYuAcMh8WGDQTF@mattapan.m5p.com>
References: <CALAP8f91s0h0gjd_qsmJDz01SKdC8Rmut5KPiG-CKaov740m_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAP8f91s0h0gjd_qsmJDz01SKdC8Rmut5KPiG-CKaov740m_Q@mail.gmail.com>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Sep 21, 2022 at 10:54:55PM +0530, Vipul Suneja wrote:
> Now I have built a custom image with GUI & ported it as a guest2(DOMU2),
> guest2 came up as a console & couldn't see the GUI screen(Display screen
> connected to rpi4 via HDMI) coming up.
> 
> Can you please guide me on display sharing or how to bring up guests
> display?

This has already been answered in several locations.  The first place to
ask for help with the RP4 is their own forums.  Turns out the topic is
well known:

https://forums.raspberrypi.com/viewtopic.php?t=232323#p1775083

(huh, their forum moved to the raspberrypi.com domain; they really need
an entry for Xen in their other OSes area)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



