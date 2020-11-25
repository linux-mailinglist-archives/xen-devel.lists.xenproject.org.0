Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC092C378F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 04:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37121.69311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khlcq-0004ZX-Kl; Wed, 25 Nov 2020 03:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37121.69311; Wed, 25 Nov 2020 03:37:48 +0000
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
	id 1khlcq-0004Z8-HJ; Wed, 25 Nov 2020 03:37:48 +0000
Received: by outflank-mailman (input) for mailman id 37121;
 Wed, 25 Nov 2020 03:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOsx=E7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1khlco-0004Z3-Or
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 03:37:46 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dc2baf2-2a8a-441f-abf9-0552551c23a6;
 Wed, 25 Nov 2020 03:37:45 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AP3bXaX027586
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 24 Nov 2020 22:37:39 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0AP3bWYN027585;
 Tue, 24 Nov 2020 19:37:32 -0800 (PST) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TOsx=E7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1khlco-0004Z3-Or
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 03:37:46 +0000
X-Inumbo-ID: 7dc2baf2-2a8a-441f-abf9-0552551c23a6
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7dc2baf2-2a8a-441f-abf9-0552551c23a6;
	Wed, 25 Nov 2020 03:37:45 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AP3bXaX027586
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2020 22:37:39 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0AP3bWYN027585;
	Tue, 24 Nov 2020 19:37:32 -0800 (PST)
	(envelope-from ehem)
Date: Tue, 24 Nov 2020 19:37:32 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

I finally have U-Boot -> GRUB -> Xen sort-of operational as an
alternative to Tianocore -> GRUB -> Xen on a Raspberry PI 4B.

Stefano Stabellini, how much of the Raspberry PI 4B hardware have you
observed being operational under Linux on Xen?  In particular, have you
ever observed operational graphical output from a Raspberry Pi 4B running
Xen?

Presently I'm using a 5.8 kernel with your patches and haven't seen
graphical output under Xen with either boot stack.  I've confirmed fully
operational graphics without Xen on Tianocore, I've confirmed operational
virtual terminals with U-Boot and not Xen.

I had been planning to wait a bit before moving to 5.9, but if that is
the crucial ingredient I'll move early.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



