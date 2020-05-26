Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7C21E1F5B
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 12:08:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdWVG-0008HS-64; Tue, 26 May 2020 10:08:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdWVE-0008HN-LR
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:08:08 +0000
X-Inumbo-ID: cb620d74-9f38-11ea-a5fe-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb620d74-9f38-11ea-a5fe-12813bfff9fa;
 Tue, 26 May 2020 10:08:07 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 725C6122804;
 Tue, 26 May 2020 12:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590487686;
 bh=hqRXSznMCr4tJH1FgF5vK1/580jutbWPg/BvlK0PEEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ns3/sJIXPIqV52TPuBJPwBfQJCtih9cK/sXO9G3+En8yA2D8lU/iLyddoJvZZM6U0
 +Ohcw1P6oSEaKtIznsl7bhChiJsoFMV3r2ysjRZzN0ICK2zkChTzPOesoW7FpI4fqf
 Hlneod7iPocEvVM0Lga6+xc7/d3gHFa1gSZYNajLfaVSyBnb800PWRCdTOfxKVmhmT
 EJzSRC55gqS6qW+TQXVrJv440cAWASK9qw7SZDflurmmJ8DDbgyGEIhgMmngs6HZqh
 5Ft6fSC9YvoYWJtAQlP3TzD7BpIARfxnxLGHdS2D0UxCcklMFzTY+MMav5JcGmK1g+
 rqbK3dB5M45Aw==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 14173268436E; Tue, 26 May 2020 12:08:06 +0200 (CEST)
Date: Tue, 26 May 2020 12:08:06 +0200
From: Martin Lucina <martin@lucina.net>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526100806.GD5942@nodbug.lucina.net>
Mail-Followup-To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526093421.GA38408@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, 26.05.2020 at 11:34, Roger Pau Monné wrote:
> On Tue, May 26, 2020 at 10:52:21AM +0200, Martin Lucina wrote:
> > On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> > > On 25/05/2020 17:42, Jürgen Groß wrote:
> > > > You need to setup virtual addressing and enable 64 bit mode before using
> > > > 64-bit GDT.
> > > >
> > > > See Mini-OS source arch/x86/x86_hvm.S
> > > 
> > > Or
> > > https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> > > 
> > > But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> > > will only load the bottom 32 bits of GDTR.base.
> > 
> > Ah, I missed Jurgen's and your reply here.
> > 
> > LGDT loading only the bottom 32 bits of GDTR.base shouldn't matter.
> > Examining gdt_ptr some more:
> > 
> >     (gdb) set architecture i386
> >     The target architecture is assumed to be i386
> >     (gdb) x /xh 0x108040
> >     0x108040:	0x002f
> >     (gdb) x /xw 0x108042
> >     0x108042:	0x00108000
> >     (gdb) x /6xb 0x108040
> >     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00
> >     (gdb) x /8xb 0x108040
> >     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00	0x00	0x00
> 
> Could you also print the GDT entry at 0x10 (ie: 0x108000 + 0x10), just
> to make sure it contains the right descriptor?

I triple-checked that on Friday, but here you go:

    (gdb) x /xg 0x108010
    0x108010:	0x00cf9b000000ffff
    (gdb) x /tg 0x108010
    0x108010:	0000000011001111100110110000000000000000000000001111111111111111

Translates to:

base_31_24 = { 0 }
g = 1 (4 kB)
b = 1 (32-bit)
l = 0 (32-bit)
avl = 0
limit_19_16 = { 1 }
p = 1
dpl = 0
s = 1
type = 1011 (code, exec/read, accessed)
base23_16 = { 0 }
base15_0 = { 0 }
limit_15_0 = { 1 }

type should technically not include accessed, but that shouldn't matter.
In any case, changing it to 1010 does not help.

Looks like I'll have to build a patched Xen as per Andrew's suggestion, and
dump the VMCS on the triple fault.

-mato

