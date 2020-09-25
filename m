Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C3278D22
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 17:48:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLpxF-0003rQ-DY; Fri, 25 Sep 2020 15:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wxjq=DC=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kLpxD-0003rL-Kh
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 15:48:11 +0000
X-Inumbo-ID: aea96298-592e-4db2-9cfd-4108828ecc37
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aea96298-592e-4db2-9cfd-4108828ecc37;
 Fri, 25 Sep 2020 15:48:10 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 08PFltcw064709
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Sep 2020 11:48:01 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 08PFltxa064708;
 Fri, 25 Sep 2020 08:47:55 -0700 (PDT) (envelope-from ehem)
Date: Fri, 25 Sep 2020 08:47:55 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 03/11 RFC] gitignore: Add/Generalize entries
Message-ID: <20200925154755.GA64406@mattapan.m5p.com>
References: <202009092153.089LrA2R039188@m5p.com>
 <afe1939c-01b9-b6c6-a4d7-9762664b9447@suse.com>
 <20200924214829.GA58232@mattapan.m5p.com>
 <abaa602b-5eef-d3a4-4bee-9360dcf57031@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abaa602b-5eef-d3a4-4bee-9360dcf57031@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 25, 2020 at 08:49:01AM +0200, Jan Beulich wrote:
> I don't think so, no - new ports will similarly have asm-<arch>/config.h,
> and there shouldn't be a requirement to "git add -f" them at that point.
> The role of such named files really is too different to have such a top
> level entry imo.

Okay.  I had thought autoconf/configure was by far the most common source
of config.h files, and thus best to have in there, but my local copies
have been adjusted.  There aren't many config.h entries so dumping an
attempt at a common pattern is quite appropriate.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



