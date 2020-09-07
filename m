Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2325F65C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 11:21:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFDKd-0005Hx-VG; Mon, 07 Sep 2020 09:20:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFDKc-0005Hs-DN
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 09:20:58 +0000
X-Inumbo-ID: e9d2cbff-5e47-4475-847b-8128b4212df6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9d2cbff-5e47-4475-847b-8128b4212df6;
 Mon, 07 Sep 2020 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599470456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U0kkau9pt4nCUNyLGoQS230I9dt1/YPqZcLvc6f8wPI=;
 b=fWDyLcZLf7A5HGwmnEt91iuqvj2k18iBiRYNGwWVPpdVLUKKLaoj4Hwj
 QTR6+TeUvj70xiQoZZhY2+kKly7MKv+kW/L4T85EpLubR3P5Mzi+IFPJI
 38qbaNTOWF7MYxyi9/bnjvchl9nw8ruoMliNert1tTriQT7takE8PWXAD M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fopZMaNnEetw76fbDXqz6iy7wSkaJFrqJVTElUcHpZ3i8BDsuVEbldWZvXLOuFLhokq4V1cfma
 RVBzZ5/8gfIg0Ec1pdOeDA/oy3H7etj0GHD7OPKAWw+vfKXSV18dE1ud2jOb1rvcieVikqUnj0
 bK0YBJsJJcFhGt5BbddixjiiZmTykr83WVnmxKvjcRu96PrL6VDargL1ompKTsNMvbDLuL3yaR
 Sx2TWnGegZFUEWTZvmMIZGns09zYhLccJ0DLtWDn6m66j0cBmWE3MCIt4mzxbSGoKhKaylSQxL
 vkU=
X-SBRS: 2.7
X-MesageID: 26126303
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26126303"
Date: Mon, 7 Sep 2020 11:20:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, osstest service owner
 <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable bisection] complete test-amd64-i386-xl-shadow
Message-ID: <20200907092045.GS753@Air-de-Roger>
References: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
 <01e192ce-99ea-2fbd-317c-c9f4b99f6d2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <01e192ce-99ea-2fbd-317c-c9f4b99f6d2a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Mon, Sep 07, 2020 at 10:21:36AM +0200, Jan Beulich wrote:
> On 07.09.2020 00:48, osstest service owner wrote:
> > branch xen-unstable
> > xenbranch xen-unstable
> > job test-amd64-i386-xl-shadow
> > testid guest-saverestore
> > 
> > Tree: linux git://xenbits.xen.org/linux-pvops.git
> > Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> > Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> > Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> > Tree: xen git://xenbits.xen.org/xen.git
> > 
> > *** Found and reproduced problem changeset ***
> > 
> >   Bug is in tree:  xen git://xenbits.xen.org/xen.git
> >   Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
> >   Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
> >   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153833/
> > 
> > 
> >   commit 696c273f3d9a169911308fb7e0a702a3eb6a150d
> >   Author: Jan Beulich <jbeulich@suse.com>
> >   Date:   Fri Sep 4 11:13:01 2020 +0200
> >   
> >       x86: generalize padding field handling
> >       
> >       The original intention was to ignore padding fields, but the pattern
> >       matched only ones whose names started with an underscore. Also match
> >       fields whose names are in line with the C spec by not having a leading
> >       underscore. (Note that the leading ^ in the sed regexps was pointless
> >       and hence get dropped.)
> 
> I conclude this needs to be reverted, and there was a thinko of mine
> involved here: Avoiding translation of padding fields would be okay
> only when their values don't get checked in the native handler. We
> effectively have a not written down (afaict) rule here that _pad*
> fields get ignored (and hence don't need translation), while pad*
> fields may not be ignored and hence may need translation. I don't
> like this state, but I also can't think of a good way out of it, at
> least not just yet.

I think his stems from the fact that we don't have a rule whether
explicit padding fields in structs should be zeroed. IIRC there are
hypercalls that would check for padding fields to be 0, while others
don't.

At this point I assume we can only implement the least restrictive
one, which is to not force padding fields to be zeroed?

This would have the side effect that they cannot be later used to
introduce additional fields to the struct without signaling the
version in use.

Roger.

