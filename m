Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6889B0461B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 19:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043020.1413134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubMdm-0003tG-66; Mon, 14 Jul 2025 17:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043020.1413134; Mon, 14 Jul 2025 17:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubMdm-0003qp-30; Mon, 14 Jul 2025 17:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1043020;
 Mon, 14 Jul 2025 17:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5BW=Z3=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1ubMdj-0003qh-Ho
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 17:06:56 +0000
Received: from 17.mo561.mail-out.ovh.net (17.mo561.mail-out.ovh.net
 [87.98.178.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee4662a2-60d4-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 19:06:49 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.249])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4bgpdP2TPDz6VcH
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 17:06:49 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-q7sb7 (unknown [10.108.42.46])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5C0DA81633;
 Mon, 14 Jul 2025 17:06:48 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-5b5ff79f4f-q7sb7 with ESMTPSA
 id cBBPBig5dWjxpg0Axp3qJA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 14 Jul 2025 17:06:48 +0000
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
X-Inumbo-ID: ee4662a2-60d4-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-105G006193b2fb0-92af-4a14-ba4c-b576ab072fe4,
                    F9CCBD732446D59499E475C9BEABBBB7B13AFED4) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Mon, 14 Jul 2025 20:06:41 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
Message-ID: <aHU5IWOYlkMwKnRq@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
 <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com>
 <aGqqisydEetf5mJ_@MjU3Nj>
 <faaa96f7-918e-4130-bde4-bb17194e1c25@suse.com>
 <aGwEZfKKXwO4ZYOe@MjU3Nj>
 <05229135-00ef-4e8b-bb2d-fe9022a5023b@suse.com>
 <aHPs32HEu86NgUvQ@MjU3Nj>
 <c7f4291c-5ac4-4682-a4aa-06877cf0bc64@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f4291c-5ac4-4682-a4aa-06877cf0bc64@suse.com>
X-Ovh-Tracer-Id: 4118823336394273881
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=jJocp4MSFmXXjhfW9c2CyFpkMZtAWG4GMrTkoSigDSQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1752512809; v=1;
 b=mzse4JkFl3BU9uAPNjpkmgcZR7WL3tKFqYd0Ok3gdFRODULLeYldFW65hZktDeqZKHROjgZF
 7jvk8wPNnE3wYmENzUSkI/Zj1PQaGhdxosNKPcKck/YZXBLDepiQcb7+b0hqWkR2jTOl/o4t++2
 lsrUUk2/6r71msC4ooFHDB4Q1+RkSqCOKkuI6bwkUfTxlfY+UuW9SLk+CHSZyhZT7RxR9vsPXXh
 gvIVds5M2zrCYXQHdZg9Wz/iwIJf/lSe0KoKnLbHqshEVhGtUph3iQOjd7uie67wtdodLSvAGEQ
 aC/rgTLa28jqMpqEFaARvsD8iyNqJlKVKZjI4tITdWzjg==

On Mon, Jul 14, 2025 at 09:33:09AM +0200, Jan Beulich wrote:
> On 13.07.2025 19:29, Sergii Dmytruk wrote:
> > On Tue, Jul 08, 2025 at 08:52:36AM +0200, Jan Beulich wrote:
> >> On 07.07.2025 19:31, Sergii Dmytruk wrote:
> >>> On Mon, Jul 07, 2025 at 10:29:46AM +0200, Jan Beulich wrote:
> >>>>>> ... then isn't used right here, instead requiring a cast somewhere (presumably,
> >>>>>> as code using this isn't visible in this patch).
> >>>>>
> >>>>> As was mentioned earlier: because size of a pointer between Xen and a
> >>>>> bootloader doesn't necessarily match.  What you're proposing can break
> >>>>> under certain conditions.
> >>>>
> >>>> But the header isn't shared with a bootloader's code base. It's private to
> >>>> Xen.
> >>>
> >>> Yes, but sources of Xen be compiled with different size of a pointer
> >>> which messes up the interpretation of the data.  I tried using
> >>> BUILD_BUG_ON() to enforce the pointer is 64-bit and early code stopped
> >>> compiling.  The structures must not vary like that.
> >>
> >> Hmm. Does early code actually need to have this struct exposed to it?
> >
> > It doesn't use this particular structure, but it uses some other ones in
> > the header (also SLRT entries, but of different types).  Making a
> > separate header just to get rid of a cast doesn't seem to be worth it.
>
> Which I also didn't suggest. Didn't I see an EARLY_<something> #define-d
> somewhere? Couldn't you key exposure of the structure to that not being
> defined?
>
> Jan

That's possible, but it seems rather adhoc to conditionally provide a
declaration which would also make normal and early sources differ a bit
more.  __EARLY_SLAUNCH__ was added out of necessity, I wouldn't use it
for anything new unless there is no better option.

Regards

