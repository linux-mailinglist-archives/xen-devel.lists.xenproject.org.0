Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD7ACBCFC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003822.1383427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDDP-0004Ns-Gm; Mon, 02 Jun 2025 22:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003822.1383427; Mon, 02 Jun 2025 22:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMDDP-0004LW-DB; Mon, 02 Jun 2025 22:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1003822;
 Mon, 02 Jun 2025 22:01:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nif+=YR=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uMDDM-0004LQ-Q9
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:01:05 +0000
Received: from 8.mo584.mail-out.ovh.net (8.mo584.mail-out.ovh.net
 [188.165.33.112]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b8142a-3ffd-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 00:01:00 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.139.212])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4bB78D1vX1z1XD6
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jun 2025 22:01:00 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-z7k6k (unknown [10.110.178.109])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 80FB68427D;
 Mon,  2 Jun 2025 22:00:58 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
 by ghost-submission-5b5ff79f4f-z7k6k with ESMTPSA
 id Ul6XDRofPmhoPwAAZZ0Mgw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 02 Jun 2025 22:00:58 +0000
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
X-Inumbo-ID: 11b8142a-3ffd-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-104R005fbf77e3d-68e7-4982-8eec-f06a31c6c116,
                    22913471B39E4060B5DF5B2870BF10C0EF5640C4) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 3 Jun 2025 01:00:36 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aD4fBA6ouCrtdfX4@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <bf892a80-fe3c-4163-b857-9d073a093451@suse.com>
 <aDDRrOviNNSvFig8@MjU3Nj>
 <31c7faf1-d393-40d5-87f9-1a01d1ab39cb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31c7faf1-d393-40d5-87f9-1a01d1ab39cb@suse.com>
X-Ovh-Tracer-Id: 2241666716339123289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkeekvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=oVm7ZC4ZeWySj8lX3Edhum+W60jZvZ4icN77j/Wnutk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748901660; v=1;
 b=WpOdxqDcfo6s+/igEzL74R3V3J86EJPM39DOPikCFAEQe5lXrIXX1NWW92LclhiVqlzlED9S
 IRVlrX7n5CxXQ18jQ+x4hR+K0gbSaXcXnVThhhuDZ/i1fuRJSEib/w1/eYtl0Q4PTvDdYGaVW1R
 EhUB+hqcWWYUUSFcJfHQ73lpMV0Gk66eP+0S3gy6K6WNFPoxhL7YnI+Q3pXywD9LC5skk0U1ZIu
 kM7uBP+Ed7HRFRClScmsiTQkBnKP5C26CdXqeNjkLvb5yzvWmsnyhvpL7wDTW/VNzByqlV3NOf+
 7MRFVt0wdjCbfY2OqhoW4Egoc3OX8Q6g+QUXrwRKq+nYw==

On Mon, Jun 02, 2025 at 09:17:37AM +0200, Jan Beulich wrote:
> On 23.05.2025 21:51, Sergii Dmytruk wrote:
> > On Wed, May 21, 2025 at 05:19:57PM +0200, Jan Beulich wrote:
> >>> +/*
> >>> + * Secure Launch defined OS/MLE TXT Heap table
> >>> + */
> >>> +struct txt_os_mle_data {
> >>> +    uint32_t version;
> >>> +    uint32_t reserved;
> >>> +    uint64_t slrt;
> >>> +    uint64_t txt_info;
> >>> +    uint32_t ap_wake_block;
> >>> +    uint32_t ap_wake_block_size;
> >>> +    uint8_t mle_scratch[64];
> >>> +} __packed;
> >>
> >> This being x86-specific, what's the __packed intended to achieve here?
> >
> > This structure is passed to Xen by a bootloader, __packed makes sure the
> > structure has a compatible layout.
>
> And it won't have a compatible layout without the attribute?

It will, but presence of __packed makes it trivial to see.

> >>> +/*
> >>> + * TXT specification defined BIOS data TXT Heap table
> >>> + */
> >>> +struct txt_bios_data {
> >>> +    uint32_t version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
> >>> +    uint32_t bios_sinit_size;
> >>> +    uint64_t reserved1;
> >>> +    uint64_t reserved2;
> >>> +    uint32_t num_logical_procs;
> >>> +    /* Versions >= 3 && < 5 */
> >>> +    uint32_t sinit_flags;
> >>> +    /* Versions >= 5 with updates in version 6 */
> >>> +    uint32_t mle_flags;
> >>> +    /* Versions >= 4 */
> >>> +    /* Ext Data Elements */
> >>> +} __packed;
> >>
> >> It does affect sizeof() here, which I'm unsure is going to matter.
> >
> > It doesn't hurt anything and makes sure offsets match those in the
> > specification.
>
> It similarly doesn't appear to hurt anything if the attribute was omitted.
> Imo we ought to use compiler extensions on when there is a need to do so.

I would argue that it hurts maintainability and code readability to some
extent:
 * when the attribute is used, there is no need to verify compatibility
   in any way (manually or using pahole) neither now nor on any future
   modification
 * when I see __packed, I immediately know the structure is defined
   externally and can't be changed at will
 * having the attribute only for some structures seems inconsistent

It would be nice if it was possible to verify the structure is packed
via a static assert using only standard C, but without such means I see
__packed as useful and harmless compiler extension.

I can of course drop unnecessary attributes if that's a standard
practice for Xen's sources, never thought it could be undesirable in
a context like this one.

> >>> +static inline uint64_t txt_bios_data_size(void *heap)
> >>
> >> Here, below, and in general: Please try to have code be const-correct, i.e.
> >> use pointers-to-const wherever applicable.
> >
> > I assume this doesn't apply to functions returning `void *`.  The
> > approach used in libc is to accept pointers-to-const but then cast the
> > constness away for the return value, but this header isn't a widely-used
> > code.
>
> Which is, from all I know, bad practice not only by my own view.
>
> Jan

I actually ended up doing that to have const-correctness in v3.  In the
absence of function overloads the casts have to be somewhere, can put
them in the calling code instead.

Regards

