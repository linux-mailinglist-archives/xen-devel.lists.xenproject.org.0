Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 985FF5F3C72
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 07:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415180.659686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofaTR-0004rn-Cy; Tue, 04 Oct 2022 05:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415180.659686; Tue, 04 Oct 2022 05:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofaTR-0004pq-AF; Tue, 04 Oct 2022 05:28:09 +0000
Received: by outflank-mailman (input) for mailman id 415180;
 Tue, 04 Oct 2022 05:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zFdy=2F=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ofaTP-0004pk-E6
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 05:28:07 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 511fe64c-43a5-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 07:28:04 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2945RcoD063500
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 4 Oct 2022 01:27:44 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2945RcJE063499;
 Mon, 3 Oct 2022 22:27:38 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 511fe64c-43a5-11ed-964a-05401a9f4f97
Date: Mon, 3 Oct 2022 22:27:38 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Vipul Suneja <vsuneja63@gmail.com>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: How to do display sharing between guests or bring up guests
 display
Message-ID: <YzvESmY9xBKaKq0W@mattapan.m5p.com>
References: <CALAP8f91s0h0gjd_qsmJDz01SKdC8Rmut5KPiG-CKaov740m_Q@mail.gmail.com>
 <YytYuAcMh8WGDQTF@mattapan.m5p.com>
 <CALAP8f9+N4+Jk_hWh8XCc70g7xxbr7PTffE0By56TROOyS9rSg@mail.gmail.com>
 <CALAP8f8_TiDa4t9WbXtCf2erKwSv04y3HVv6ohKoU=geJwrp5Q@mail.gmail.com>
 <CALAP8f9nM08m0GS5WTqrGjFcR3Ap7UfsqRc1CyUaVrChnmmdJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAP8f9nM08m0GS5WTqrGjFcR3Ap7UfsqRc1CyUaVrChnmmdJQ@mail.gmail.com>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Tue, Oct 04, 2022 at 10:32:03AM +0530, Vipul Suneja wrote:
> Any input on this issue or any pointers on SDL to enable display?
> Looking forward to hearing from you.

I suspect you want xen-users@lists.xenproject.org.
https://lists.xenproject.org/cgi-bin/mailman/listinfo/xen-users

xen-devel@ is when you need developer attention, whereas what you're
asking sounds like basic user setup questions.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



