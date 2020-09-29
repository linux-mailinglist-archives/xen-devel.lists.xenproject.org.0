Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BF27D2BA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.275.713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHYs-0000ag-Fz; Tue, 29 Sep 2020 15:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275.713; Tue, 29 Sep 2020 15:29:02 +0000
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
	id 1kNHYs-0000aH-C7; Tue, 29 Sep 2020 15:29:02 +0000
Received: by outflank-mailman (input) for mailman id 275;
 Tue, 29 Sep 2020 15:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQvA=DG=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kNHYq-0000a0-4r
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:29:00 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3e69fa9-5abc-4964-96d8-e181eb2a4e37;
 Tue, 29 Sep 2020 15:28:59 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08TFSbpe090681
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 29 Sep 2020 11:28:43 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08TFSb7v090680;
 Tue, 29 Sep 2020 08:28:37 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hQvA=DG=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kNHYq-0000a0-4r
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:29:00 +0000
X-Inumbo-ID: f3e69fa9-5abc-4964-96d8-e181eb2a4e37
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f3e69fa9-5abc-4964-96d8-e181eb2a4e37;
	Tue, 29 Sep 2020 15:28:59 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08TFSbpe090681
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 29 Sep 2020 11:28:43 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 08TFSb7v090680;
	Tue, 29 Sep 2020 08:28:37 -0700 (PDT)
	(envelope-from ehem)
Date: Tue, 29 Sep 2020 08:28:37 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
        masami.hiramatsu@linaro.org, bertrand.marquis@arm.com,
        andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
Message-ID: <20200929152837.GA90520@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200927014708.GB72806@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927014708.GB72806@mattapan.m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Sat, Sep 26, 2020 at 06:47:08PM -0700, Elliott Mitchell wrote:
> On the ARM device I'm trying to get operational the boot got distinctly
> further along so appears to be a distinct ACPI improvement here.

Just in case it wasn't clear, that does amount to:

Tested-by: Elliott Mitchell <ehem+xen@m5p.com>

Now to look over a different set of shoulders and find out whether the
next problem is what they've been running into, or a distinct one...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



