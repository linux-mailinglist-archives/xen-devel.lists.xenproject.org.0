Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9767FCA78
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 00:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643593.1003971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r878y-0006Lc-BO; Tue, 28 Nov 2023 23:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643593.1003971; Tue, 28 Nov 2023 23:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r878y-0006IP-7o; Tue, 28 Nov 2023 23:05:28 +0000
Received: by outflank-mailman (input) for mailman id 643593;
 Tue, 28 Nov 2023 23:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/XcL=HJ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r878x-0006IJ-BM
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 23:05:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ba1b122-8e42-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 00:05:23 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3ASN4qvY066886
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 28 Nov 2023 18:04:58 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3ASN4oY6066885;
 Tue, 28 Nov 2023 15:04:50 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 9ba1b122-8e42-11ee-9b0e-b553b5be7939
Date: Tue, 28 Nov 2023 15:04:50 -0800
From: Elliott Mitchell <ehem+freebsd@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Mario Marietto <marietto2008@gmail.com>,
        Chuck Zmudzinski <brchuckz@netscape.net>,
        Demi Marie Obenour <demi@invisiblethingslab.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Message-ID: <ZWZyEtGMhjRba/Z2@mattapan.m5p.com>
References: <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
 <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
 <ZWXvBMaRJ5Lbb5S9@macbook>
 <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com>
 <ZWYC-omtTOxIHNwF@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWYC-omtTOxIHNwF@macbook>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Tue, Nov 28, 2023 at 04:10:50PM +0100, Roger Pau Monné wrote:
> On Tue, Nov 28, 2023 at 03:09:14PM +0100, Mario Marietto wrote:
> > For booting a FreeBSD kernel as a guest OS on XEN,should we install xen
> > 4.18 from source ?

> I don't think so, I'm not aware of the FreeBSD port requiring a
> specific version of Xen.  I do think the work is limited to aarch64
> however, so there's no support in sight for arm32 FreeBSD guests as
> far as I'm aware.

I've only ever tried arm64, but since arm32 didn't appear to need much
to have operational I tried to make it possible.  In theory it /should/
work on arm32, but I've never tried it.  What was missing was I had never
added it to the configuration and one link was needed.  Updated "submit"
branch has the tiny adjustment.

(the only difference is the hypercall wrappers, register naming and where
the op code goes, very simple compatibility)


On Tue, Nov 28, 2023 at 02:45:40PM +0100, Roger Pau Monné wrote:
> On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrote:
> > BTW Roger Pau Monné, now that Xen 4.18 is out, take a look at the
> > "royger" branch?
> 
> I've pushed a bunch of those, there are still some, I've made comments
> on the branch.
> 
> I think there isn't much left after the swept I've done.
> 
> If you can rebase and reply to the comments I will take a look at
> what's remaining.

Done.  I'm unsure you'll like the xs_attach_children() approach.  Thing
is that really is appropriate given the situation.  #2 is the urgent one
as that is the handy approach to the hypercall declarations.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



