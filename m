Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D15B03256
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jul 2025 19:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042359.1412512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ub0Vt-0006bg-GQ; Sun, 13 Jul 2025 17:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042359.1412512; Sun, 13 Jul 2025 17:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ub0Vt-0006ZP-Cw; Sun, 13 Jul 2025 17:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1042359;
 Sun, 13 Jul 2025 17:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OXgA=Z2=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1ub0Vq-0006Z3-EF
 for xen-devel@lists.xenproject.org; Sun, 13 Jul 2025 17:29:19 +0000
Received: from 4.mo582.mail-out.ovh.net (4.mo582.mail-out.ovh.net
 [87.98.184.159]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d63a40-600e-11f0-b894-0df219b8e170;
 Sun, 13 Jul 2025 19:29:15 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.254.28])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4bgC9k4zqxz6TBt
 for <xen-devel@lists.xenproject.org>; Sun, 13 Jul 2025 17:29:14 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ljzkm (unknown [10.111.174.42])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B011CC28A3;
 Sun, 13 Jul 2025 17:29:13 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-5b5ff79f4f-ljzkm with ESMTPSA
 id C6hBGunsc2jnoRUA1Xz1Aw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 13 Jul 2025 17:29:13 +0000
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
X-Inumbo-ID: e5d63a40-600e-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-101G004b5b99750-376e-457d-8061-7b10743240a1,
                    2DE9640A253108A2126106CA1255C693440FBD44) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 13 Jul 2025 20:29:03 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
Message-ID: <aHPs32HEu86NgUvQ@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
 <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com>
 <aGqqisydEetf5mJ_@MjU3Nj>
 <faaa96f7-918e-4130-bde4-bb17194e1c25@suse.com>
 <aGwEZfKKXwO4ZYOe@MjU3Nj>
 <05229135-00ef-4e8b-bb2d-fe9022a5023b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05229135-00ef-4e8b-bb2d-fe9022a5023b@suse.com>
X-Ovh-Tracer-Id: 17071457341316183129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegleeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=XzEan7sS0RxOp1ntQq5Cw8h64N+xrZrjEk7hnVY+Qf8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1752427754; v=1;
 b=Hg5dBa9VGHE7W64DvaFfmJzqYhEoLoLWehz95gaoGOKd+xgJ7YVg7br1lLvNFEh6dFpHggbc
 aH/5tdkmTUVDNrMjPsmsmFgdMzJJGwmnyWcxS/xHsfqjjY8vPQK/tHpvPfPNAzCOEBI10KKDGza
 ocH0V0oMGJbgY7+SWF/H5ZOgx9UBOsrGbL9+8j0p5JdP+/ek+7/eCUV52BVNdp9CrVZBsiNshFJ
 FTpB1JCQL4BcGiakr+YKKRyUAZ1URExjJeR3qCmyWsXZsEF3oSWZhdOY4scFyD3i3mn58SvEp9C
 0WhJ2b+MYvvEIKIkGzGn+jzW+rE2vo3DHqFplrUrVmZqQ==

On Tue, Jul 08, 2025 at 08:52:36AM +0200, Jan Beulich wrote:
> On 07.07.2025 19:31, Sergii Dmytruk wrote:
> > On Mon, Jul 07, 2025 at 10:29:46AM +0200, Jan Beulich wrote:
> >>>> ... then isn't used right here, instead requiring a cast somewhere (presumably,
> >>>> as code using this isn't visible in this patch).
> >>>
> >>> As was mentioned earlier: because size of a pointer between Xen and a
> >>> bootloader doesn't necessarily match.  What you're proposing can break
> >>> under certain conditions.
> >>
> >> But the header isn't shared with a bootloader's code base. It's private to
> >> Xen.
> >
> > Yes, but sources of Xen be compiled with different size of a pointer
> > which messes up the interpretation of the data.  I tried using
> > BUILD_BUG_ON() to enforce the pointer is 64-bit and early code stopped
> > compiling.  The structures must not vary like that.
>
> Hmm. Does early code actually need to have this struct exposed to it?
>
> Jan

It doesn't use this particular structure, but it uses some other ones in
the header (also SLRT entries, but of different types).  Making a
separate header just to get rid of a cast doesn't seem to be worth it.

Regards

