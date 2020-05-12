Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B411D0295
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 00:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYdnp-0003uG-1S; Tue, 12 May 2020 22:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eNOS=62=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1jYdno-0003uB-2I
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 22:55:08 +0000
X-Inumbo-ID: 9fb7f69c-94a3-11ea-b07b-bc764e2007e4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb7f69c-94a3-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 22:55:07 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 04CMswfQ001680
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 12 May 2020 18:55:04 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 04CMsw1C001679;
 Tue, 12 May 2020 15:54:58 -0700 (PDT) (envelope-from ehem)
Date: Tue, 12 May 2020 15:54:58 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: use of "stat -"
Message-ID: <20200512225458.GA1530@mattapan.m5p.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
 autolearn_force=no version=3.4.4
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 08:54:26PM +0100, Andrew Cooper wrote:
> On 12/05/2020 20:50, Elliott Mitchell wrote:
> > On Tue, May 12, 2020 at 11:52:25AM -0400, Jason Andryuk wrote:
> >> I was just looking to remove perl since it's a large dependency for
> >> this single use.  I'm not tied to a particular approach.

> > Removing dependancies is good.  Perhaps this is looking a few years into
> > the future where Perl is even less common.
> 
> Not everyone has a fully fat Linux running as dom0.?? There are real
> systems using Xen which have already successfully purged perl.

Gah!  Misread an earlier message.  Upon rereading the message seems my
thinking was wrong.  Yes, it is pretty reasonable to setup a system
without Perl.

Sorry for interrupting with the braindead comment.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



