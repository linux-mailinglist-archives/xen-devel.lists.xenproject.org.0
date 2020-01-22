Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F96145D83
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 22:07:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuNBb-0001nK-MN; Wed, 22 Jan 2020 21:05:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JraP=3L=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iuNBZ-0001nF-WA
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 21:05:14 +0000
X-Inumbo-ID: e1ae2c38-3d5a-11ea-bd5f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1ae2c38-3d5a-11ea-bd5f-12813bfff9fa;
 Wed, 22 Jan 2020 21:05:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09D1E2467A;
 Wed, 22 Jan 2020 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579727112;
 bh=oPaTIOVVDh8/IDkTDrps0S3weMbf1rotv25CnqXwvso=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0UUZ2nLbib10tgqPakmUpmiH9aYXDz6obcyxLteJz3ZnQnT6Jc8KqLj3sqmCDEuI0
 Co/WbLEoLm0JQOzwWzGv6q78RiNgD8CnvAt6k8CTrmjj9cijGjZUNSHXulAabCoad2
 UmyT3BVlkEoEuGuw1/tbRDIZRWH0dltoTNQN/o8o=
Date: Wed, 22 Jan 2020 13:05:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
Message-ID: <alpine.DEB.2.21.2001221302400.16648@sstabellini-ThinkPad-T480s>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1449927802-1579727112=:16648"
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1449927802-1579727112=:16648
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Jan 2020, Andrew Cooper wrote:
> > My big questions are:
> > 	Does the Xen project have interest in RISC-V?
> 
> There is very large downstream interest in RISC-V.  So a definite yes.

Definite Yes from me too


> > 	What can be done to make the RISC-V port as upstreamable as
> > 		possible?
> > 	Any major pitfalls?
> >
> > It would be great to hear all of your feedback.
> 
> Both RISC-V and Power9 are frequently requested things, and both suffer
> from the fact that, while we as a community would like them, the
> upstream intersection of "people who know Xen" and "people who know
> enough arch $X to do an initial port" is 0.
> 
> This series clearly demonstrates a change in the status quo, and I think
> a lot of people will be happy.
> 
> To get RISC-V to being fully supported, we will ultimately need to get
> hardware into the CI system, and an easy way for developers to test
> changes.  Do you have any thoughts on production RISC-V hardware
> (ideally server form factor) for the CI system, and/or dev boards which
> might be available fairly cheaply?

My understanding is that virtualization development for RISC-V is done
on QEMU right now (which could still be hooked into the CI system if
somebody wanted to do the work I think.)
--8323329-1449927802-1579727112=:16648
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1449927802-1579727112=:16648--

