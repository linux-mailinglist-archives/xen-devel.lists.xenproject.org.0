Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469393F6288
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 18:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171648.313201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIZ43-0001g7-97; Tue, 24 Aug 2021 16:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171648.313201; Tue, 24 Aug 2021 16:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIZ43-0001eE-5f; Tue, 24 Aug 2021 16:14:15 +0000
Received: by outflank-mailman (input) for mailman id 171648;
 Tue, 24 Aug 2021 16:14:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIZ42-0001e8-97
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 16:14:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5221a1ac-04f6-11ec-a8ed-12813bfff9fa;
 Tue, 24 Aug 2021 16:14:13 +0000 (UTC)
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
X-Inumbo-ID: 5221a1ac-04f6-11ec-a8ed-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629821653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nhUzP7HAvHJr1hVjG/Qc7XgAkV3VKwQYu6D33ue6rUw=;
  b=XSnjWtfp8TjDNeLScfpccK0NEASagzyNcgZJJUK3geWdmXnm4NYq8g4S
   D8Ew1R0ppgQHiDayZ+lAzdsalDGB/F5B07BCq1JxDkBad2OU8KPq0spWi
   MZMJBpXtwgXh09sCFT856RsTqJh73laDoIuqphjEx9vqkCZoOQQtsRH1J
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dnobXopqdNOXJpsLdB+i3ZgDPoXLve/USjRuXDvs42LtpRzhOTVWW4DFZ5gVcImctyK18PRpdm
 gCmtz9BerTHZ89n5Nsx3oD13kZoXMBy5bZhAU5/0XUi0KA1QCTgWrptIvvQbxVlCObg3sRTgvD
 oRKZOFf48GogU1r58vM6cPzMhDoUi8P4KMDvtm+RvPd+WVemLKk2Tr5kMLke574NLe9JdMVr2O
 YA+Ao1XRKGj9A6aeOG+5CmA1yBD1Iq2oV+Nx+Na/f97mmbMiTtKPmWLdZ0EQo44Y9D4QVrIGPc
 nSSmNVdTWLc7LGENE7bBfUeq
X-SBRS: 5.1
X-MesageID: 51573784
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8Hu7YKGzzSUIetaPpLqEJMeALOsnbusQ8zAXPhhKOHhomszxra
 yTdYcgpHjJYVcqKQwdcL+7WJVoLUm3yXcx2/h1AV7AZnibhILLFvAA0WKK+VSJcBEWtNQtt5
 uIGJIQNDSENzlHZLHBjjVQfexM/DDNytHPuQ6X9QYVcSh6L6174xp4B2+gYzdLbRgDCYA0CY
 GR/NZDulObCA8qh+qAdwE4Y9Q=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51573784"
Date: Tue, 24 Aug 2021 17:14:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v7 10/51] build,arm: move LDFLAGS change to arch.mk
Message-ID: <YSUa0QPR1IauJo3J@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-11-anthony.perard@citrix.com>
 <b5c93c83-1d32-c71b-c4c5-36d2fc00dfa2@xen.org>
 <YSUJfGcyBXxPNg8B@perard>
 <6ac5daae-c3ee-4854-1480-111a9378e7ab@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6ac5daae-c3ee-4854-1480-111a9378e7ab@xen.org>

On Tue, Aug 24, 2021 at 04:23:22PM +0100, Julien Grall wrote:
> Hi Anthony,
> 
> On 24/08/2021 16:00, Anthony PERARD wrote:
> >      Changes to XEN_LDFLAGS may or may not apply to targets in for
> >      example "common/" depending on whether one runs `make` or `make
> >      common/`.
> > 
> >      But arch.mk is loaded before doing any build, so changes to LDFLAGS
> >      there mean that the value of XEN_LDFLAGS won't depends on the
> >      initial target.
> 
> An explanation in the commit message would be useful. This one you provided
> looks good. So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Can it be merged before the previous patch? If so, I can update the commit
> message and commit it.

Yes, that should be fine, thanks!

-- 
Anthony PERARD

