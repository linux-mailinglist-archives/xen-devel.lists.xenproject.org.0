Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A7ACCA04
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 17:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004616.1384352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMTRV-0007Du-5w; Tue, 03 Jun 2025 15:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004616.1384352; Tue, 03 Jun 2025 15:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMTRV-0007An-2c; Tue, 03 Jun 2025 15:20:45 +0000
Received: by outflank-mailman (input) for mailman id 1004616;
 Tue, 03 Jun 2025 15:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOop=YS=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uMTRT-00079Q-7k
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 15:20:44 +0000
Received: from 13.mo561.mail-out.ovh.net (13.mo561.mail-out.ovh.net
 [188.165.33.202]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4faf0af2-408e-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 17:20:41 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.25.35])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4bBZCs2Tyzz1TcZ
 for <xen-devel@lists.xenproject.org>; Tue,  3 Jun 2025 15:20:41 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-fr2dt (unknown [10.111.182.11])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 79B42C1A5C;
 Tue,  3 Jun 2025 15:20:39 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.112])
 by ghost-submission-5b5ff79f4f-fr2dt with ESMTPSA
 id 3Y3fCscSP2i6zAAA8fgr3w
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 03 Jun 2025 15:20:39 +0000
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
X-Inumbo-ID: 4faf0af2-408e-11f0-a300-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-112S00639f4f7c0-0b7e-4de7-8627-021896060042,
                    22913471B39E4060B5DF5B2870BF10C0EF5640C4) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 3 Jun 2025 18:20:16 +0300
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
Message-ID: <aD8SsMJhxcK6bAf0@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <bf892a80-fe3c-4163-b857-9d073a093451@suse.com>
 <aDDRrOviNNSvFig8@MjU3Nj>
 <31c7faf1-d393-40d5-87f9-1a01d1ab39cb@suse.com>
 <aD4fBA6ouCrtdfX4@MjU3Nj>
 <ad0ee5a5-0fa2-465f-a774-a8c0707c0e86@suse.com>
 <aD63Qo3DLsr2iJaS@MjU3Nj>
 <70310915-478c-460c-b7be-44002a15922b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70310915-478c-460c-b7be-44002a15922b@suse.com>
X-Ovh-Tracer-Id: 1353613165104116825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=/7jwljHWEo6BH4mdXV7mdM8WMyUE0FU/S8nFAxCmD7Q=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748964041; v=1;
 b=YhswgaQEysClvGIX+DVMKOALkptV7zHLyK9waLu68RP5jh3LIaJxLqnTfd5PXioomqunDzcx
 +7WBlIfYYI4mGoPPKOHGLcEqByaecEfWJ4FbTwP2NpIYtXQSEbs+ZHHUA8MX4WeoUh6CVytLs5E
 77aRrH8H1G/BsXkETScYtWCiNrB0fHGK14c+RtiiK6d7u7R6M/bM63vYi2wSENiDFoMfHiOBuzv
 MfD0bnq8Eo1OuTggF5yvlYrvFRITIUpRST4a68umQoBz4Svj2EMg5j909hSx49uKnEiXpPnpZJu
 NadKpDd3ra5JzIMSYyqCDJ6VOEnPtZm2LIUf0KMNflIXA==

On Tue, Jun 03, 2025 at 10:52:09AM +0200, Jan Beulich wrote:
> On 03.06.2025 10:50, Sergii Dmytruk wrote:
> > On Tue, Jun 03, 2025 at 09:06:53AM +0200, Jan Beulich wrote:
> >> On 03.06.2025 00:00, Sergii Dmytruk wrote:
> >>> On Mon, Jun 02, 2025 at 09:17:37AM +0200, Jan Beulich wrote:
> >>>> On 23.05.2025 21:51, Sergii Dmytruk wrote:
> >>>>> On Wed, May 21, 2025 at 05:19:57PM +0200, Jan Beulich wrote:
> >>>>>>> +static inline uint64_t txt_bios_data_size(void *heap)
> >>>>>>
> >>>>>> Here, below, and in general: Please try to have code be const-correct, i.e.
> >>>>>> use pointers-to-const wherever applicable.
> >>>>>
> >>>>> I assume this doesn't apply to functions returning `void *`.  The
> >>>>> approach used in libc is to accept pointers-to-const but then cast the
> >>>>> constness away for the return value, but this header isn't a widely-used
> >>>>> code.
> >>>>
> >>>> Which is, from all I know, bad practice not only by my own view.
> >>>
> >>> I actually ended up doing that to have const-correctness in v3.  In the
> >>> absence of function overloads the casts have to be somewhere, can put
> >>> them in the calling code instead.
> >>
> >> Casts of which kind? For context: There shouldn't be any casting away of
> >> const-ness (or volatile-ness, for the sake of completeness).
> >>
> >> Jan
> >
> > Casting away const-ness inside of functions like
> >
> >     static inline void *txt_bios_data_start(const void *heap)
> >
> > If a function accepts a const pointer and returns it, this turns a
> > non-const incoming pointer into a const one.  Without duplicating the
> > code (either having const and non-const versions or repeating code in
> > other ways), nothing can be made const cleanly in here including
> > *_size() functions because they call *_start() functions:
> >
> >     static inline uint64_t txt_os_mle_data_size(const void *heap)
> >     {
> >         return *((const uint64_t *)(txt_bios_data_start(heap) +
> >                                                      // ^^^^ -- const
> >                                     txt_bios_data_size(heap))) -
> >                sizeof(uint64_t);
> >     }
>
> Yet just to repeat: Besides myself (and maybe others), Misra objects to
> the casting away of const-ness.
>
> Jan

OK, I'll change it back then unless I'll find a way to preserve some
const-ness without duplication.

Regards

