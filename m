Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B636CA08
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 19:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118750.224991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbR7m-0004qa-FO; Tue, 27 Apr 2021 17:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118750.224991; Tue, 27 Apr 2021 17:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbR7m-0004qB-CD; Tue, 27 Apr 2021 17:03:50 +0000
Received: by outflank-mailman (input) for mailman id 118750;
 Tue, 27 Apr 2021 17:03:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJzn=JY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbR7l-0004pq-Hl
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 17:03:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d461ec2-0ce7-4af0-aafb-ac844c18bcde;
 Tue, 27 Apr 2021 17:03:48 +0000 (UTC)
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
X-Inumbo-ID: 8d461ec2-0ce7-4af0-aafb-ac844c18bcde
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619543027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K+bzGFivev2TuOEy70gfW124IELyRD9Yog4gYkyIE7c=;
  b=Q7L2Jc1fe6BY+GicxuZVRUuSevSw3Q+yu05UjsNFw47/YS8HPi8efBrY
   XMtHm6XdZiNlZmk3MX9aFVwE1867fdpDJ/mVOPFjCw4+qfFbdtLhivvE0
   V7PQN/nGF0p6cux+p77XeVAxmNPk74kXbODWdQP1rj/X5vbKqoZAtoDrS
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zT2tRsWY2XNK0qQkjmUU0r84hOFMapARpXDggJuwHT+3/qeGHvftO5bIiLDF97DYOaGKD+u4wj
 60rg7pd/fQSs6q6rMo5WbCdAz1AvPl+y7EgcHXMA+FDWEIOIuk9f9TflhX6Wcq+AsJ8tmdhk/c
 FnmuDHwthooqQ3BNwEEBIxSFsXAIZMEjDbKJ6zpa06WdtFyEGWwyZDXzAWO+1zvjyNHffMjjth
 EWz5aLp8lrvMnxp6m8R2o8MyxB6mxYQj6g2gXkbgqxkUuddAHd/nn3wquRTsq2/6M6+hXRl70r
 70I=
X-SBRS: 5.1
X-MesageID: 42541668
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5A5WaanKp+61jS8qdJkO+9F5DGLpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42541668"
Date: Tue, 27 Apr 2021 18:03:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 07/14] tools/xl: Use const whenever we point to literal
 strings
Message-ID: <YIhD2qF494Chg66+@perard>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-8-julien@xen.org> <YIg1+x/cR1Ft5H3u@perard>
 <7bda03dd-d943-98c5-e2e8-69f6a9677da0@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7bda03dd-d943-98c5-e2e8-69f6a9677da0@xen.org>

On Tue, Apr 27, 2021 at 05:28:30PM +0100, Julien Grall wrote:
> On 27/04/2021 17:04, Anthony PERARD wrote:
> > On Mon, Apr 05, 2021 at 04:57:06PM +0100, Julien Grall wrote:
> > >   struct cmd_spec {
> > > -    char *cmd_name;
> > > +    const char *cmd_name;
> > >       int (*cmd_impl)(int argc, char **argv);
> > >       int can_dryrun;
> > >       int modifies;
> > > -    char *cmd_desc;
> > > -    char *cmd_usage;
> > > -    char *cmd_option;
> > > +    const char *cmd_desc;
> > > +    const char *cmd_usage;
> > > +    const char *cmd_option;
> > >   };
> > 
> > Those const in cmd_spec feels almost the wrong things to do, but it is
> > also unlikely that we would want to modify the strings in a cmd_spec so
> > I guess that's fine.
> 
> May I ask why you think it feels wrong things to do?
> 
> Using char * to point to literal string [...]

Well, they are no literal string here as we only describe a struct, and
I though that having "const struct cmd_spec" would have been enough. But
I gave a try with only "const struct" and found that the strings could
be modified. So I don't have anything anymore to say about the patch,
and "const char" in the "struct" are necessary.

I just need to fix my intuition about how const works in C, even if I
already know the rule about it.

Cheers,

-- 
Anthony PERARD

