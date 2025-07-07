Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B47AFB9ED
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 19:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035736.1408092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYpgj-0007ME-7L; Mon, 07 Jul 2025 17:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035736.1408092; Mon, 07 Jul 2025 17:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYpgj-0007JE-4C; Mon, 07 Jul 2025 17:31:33 +0000
Received: by outflank-mailman (input) for mailman id 1035736;
 Mon, 07 Jul 2025 17:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOF2=ZU=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYpgg-0007J8-JY
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 17:31:31 +0000
Received: from 9.mo583.mail-out.ovh.net (9.mo583.mail-out.ovh.net
 [178.32.96.204]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 360df9a6-5b58-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 19:31:27 +0200 (CEST)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.15])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4bbWW252dWz6WPR
 for <xen-devel@lists.xenproject.org>; Mon,  7 Jul 2025 17:31:26 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fs625 (unknown [10.110.96.9])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CB125C04F9;
 Mon,  7 Jul 2025 17:31:25 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-5b5ff79f4f-fs625 with ESMTPSA
 id UMghI20EbGjlUQEAgFEh5A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 07 Jul 2025 17:31:25 +0000
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
X-Inumbo-ID: 360df9a6-5b58-11f0-a316-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-102R00405336c59-4b3f-4ecc-b04f-a4af5aa3a1f0,
                    C93F419E6CD780C6B50CBD56D1356C63B9E8D154) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Mon, 7 Jul 2025 20:31:17 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
Message-ID: <aGwEZfKKXwO4ZYOe@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
 <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com>
 <aGqqisydEetf5mJ_@MjU3Nj>
 <faaa96f7-918e-4130-bde4-bb17194e1c25@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faaa96f7-918e-4130-bde4-bb17194e1c25@suse.com>
X-Ovh-Tracer-Id: 319192627095778393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=js70pWC6UF1iIy33bt4VddvSFFQ+1NfVCbl4t3zen10=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751909486; v=1;
 b=mgqqTyKZsvx6ZGfn/gfDqX97aV+0LeS1TrcxSqGwA2LguARuGQ0Y3x7mZbuoozXiaMHIpYyh
 5iuanUt2F3EOt5u7RSu/wHhQ05QhNFxJffiqXGU/fUlcwcoHW5Sdvgulh/cUPBBBznDo89gXgFW
 DJATHeSEWbEiOO7lQIe++rTGyW6ARVIZhg9Cuv0jd2bx+7Et+3CA0upMSatLcra/jQpe56yJJl9
 8VsZVZK7iFM+TZEk+H2gUp2ScabQ6XMrSg0FpqnrJkpy8/jXUiqzoFJfeGpqZWhcw8WL85aDkMn
 Zv/yXuSQej8g1mp7JElWSMgagSMHl0i/rDqVXllzE87Ng==

On Mon, Jul 07, 2025 at 10:29:46AM +0200, Jan Beulich wrote:
> >> Btw, please don't forget to Cc maintainers of code you're changing / adding.
> >
> > What do you mean?  I'm running add_maintainers.pl on the patches.
>
> The Cc: list had none of the REST maintainers. (Whether there's a bug in the
> script I can't tell.)

Oh, looks like adding new entries to MAINTAINERS prevented application
of THE REST.  Will try running the script from master next time to
address this.

> >> ... then isn't used right here, instead requiring a cast somewhere (presumably,
> >> as code using this isn't visible in this patch).
> >
> > As was mentioned earlier: because size of a pointer between Xen and a
> > bootloader doesn't necessarily match.  What you're proposing can break
> > under certain conditions.
>
> But the header isn't shared with a bootloader's code base. It's private to
> Xen.

Yes, but sources of Xen be compiled with different size of a pointer
which messes up the interpretation of the data.  I tried using
BUILD_BUG_ON() to enforce the pointer is 64-bit and early code stopped
compiling.  The structures must not vary like that.

> >>> +} __packed;
> >>
> >> I similarly keep wondering why there are all these packed attributes here, when
> >> (afaics) all of the structures are defined in a way that any padding is explicit
> >> anyway.
> >
> > As before: it won't hurt, it's future-proof, just in case and to let
> > reader of the code know the structure must have no padding.  If you want
> > them gone, I can do that, but I think it will make the code harder to
> > maintain.
>
> Well, if there's a maintenance concern, then I would of course like to learn
> about that. I could see such being the case if the file was imported from
> somewhere. But with neither description nor any code comment not saying so,
> that doesn't look to be the case.
>
> Jan

While there is some synchronization to do, that's not what I meant, I
don't think it warrants writing the header in a special way.  __packed
just relieves anyone from checking for padding, while just to remove the
attribute one needs to go through the structures and make sure nothing
will change.

Regard

