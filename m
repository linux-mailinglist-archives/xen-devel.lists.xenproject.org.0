Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05547FDDFC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644125.1004725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8O4j-0000sB-Ka; Wed, 29 Nov 2023 17:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644125.1004725; Wed, 29 Nov 2023 17:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8O4j-0000py-H0; Wed, 29 Nov 2023 17:10:13 +0000
Received: by outflank-mailman (input) for mailman id 644125;
 Wed, 29 Nov 2023 17:10:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L+uX=HK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r8O4i-0000ps-9o
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:10:12 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25f99c04-8eda-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 18:10:09 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3ATH9gjD071331
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 29 Nov 2023 12:09:48 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3ATH9fkb071330;
 Wed, 29 Nov 2023 09:09:41 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 25f99c04-8eda-11ee-98e3-6d05b1d4d9a1
Date: Wed, 29 Nov 2023 09:09:41 -0800
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
Message-ID: <ZWdwVVIV4gBJPsdu@mattapan.m5p.com>
References: <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
 <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
 <ZWXvBMaRJ5Lbb5S9@macbook>
 <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com>
 <ZWYC-omtTOxIHNwF@macbook>
 <ZWZyEtGMhjRba/Z2@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWZyEtGMhjRba/Z2@mattapan.m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Tue, Nov 28, 2023 at 03:04:50PM -0800, Elliott Mitchell wrote:
> On Tue, Nov 28, 2023 at 04:10:50PM +0100, Roger Pau Monné wrote:
> > On Tue, Nov 28, 2023 at 03:09:14PM +0100, Mario Marietto wrote:
> > > For booting a FreeBSD kernel as a guest OS on XEN,should we install xen
> > > 4.18 from source ?
> 
> > I don't think so, I'm not aware of the FreeBSD port requiring a
> > specific version of Xen.  I do think the work is limited to aarch64
> > however, so there's no support in sight for arm32 FreeBSD guests as
> > far as I'm aware.
> 
> I've only ever tried arm64, but since arm32 didn't appear to need much
> to have operational I tried to make it possible.  In theory it /should/
> work on arm32, but I've never tried it.  What was missing was I had never
> added it to the configuration and one link was needed.  Updated "submit"
> branch has the tiny adjustment.
> 
> (the only difference is the hypercall wrappers, register naming and where
> the op code goes, very simple compatibility)

Ugh, goof and send this before the final check completes...   Appears a
bit more work is needed to get this operational.  Mainly need to figure
out the Clang option to enable the key op code.

Issue is the arm hypercall.h header and the HYPERVISOR_*() wrappers.  I
fear the traditional approach might be easier to get working.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



