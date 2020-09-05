Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF125E593
	for <lists+xen-devel@lfdr.de>; Sat,  5 Sep 2020 07:18:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEQZz-00020l-0R; Sat, 05 Sep 2020 05:17:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hc6H=CO=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kEQZx-00020f-2L
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 05:17:33 +0000
X-Inumbo-ID: 52135aff-f5cb-46d8-b495-3783533c1cb1
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52135aff-f5cb-46d8-b495-3783533c1cb1;
 Sat, 05 Sep 2020 05:17:28 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0855H94s054509
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 5 Sep 2020 01:17:15 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0855H7mq054508;
 Fri, 4 Sep 2020 22:17:07 -0700 (PDT) (envelope-from ehem)
Date: Fri, 4 Sep 2020 22:17:07 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
Message-ID: <20200905051707.GA48373@mattapan.m5p.com>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
 <20200831063748.GB1522@mattapan.m5p.com>
 <ccab621e-9962-6715-896d-30e6bb8b9520@suse.com>
 <20200831225517.GA11156@mattapan.m5p.com>
 <67853b32-6aab-378b-556f-a96cd8dd950d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67853b32-6aab-378b-556f-a96cd8dd950d@suse.com>
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

On Tue, Sep 01, 2020 at 08:01:30AM +0200, Jan Beulich wrote:
> I'm aware, and hence I said "aim for". In cases like this what we
> often do is adjust things incrementally, as lines get touched anyway.
> Of course if you want to clean it up all in one go ...

What I've got has turned into a patch series.  There are some general
.gitignore cleanup patches, followed by large mechanical fixes.

Who should be included as Cc for submitting these?  Usual pattern would
end up including all the general maintainers on all patches.  The reason
is several of these are taking pieces off of the top-level .gitignore and
moving those to subdirectory .gitignore files which would have shorter Cc
lists.  There wouldn't be actual effects at the top-level, merely those
subdirectories.  Should only the maintainers for the subdirectories be
Cc'd?

These also have limited testing.  The testing which is possible is to
simply run `git check-ignore -vn <filename>` and I'm lacking appropriate
testers.  I'm hopeful I'll get it right, but there is always that sweaty
palms moment worrying I severely goof'd...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



