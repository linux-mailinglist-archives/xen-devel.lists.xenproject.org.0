Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C2AFA6E0
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 19:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034889.1407252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYTGB-00054z-FC; Sun, 06 Jul 2025 17:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034889.1407252; Sun, 06 Jul 2025 17:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYTGB-00052j-CX; Sun, 06 Jul 2025 17:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1034889;
 Sun, 06 Jul 2025 17:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYTG9-00052d-TK
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 17:34:37 +0000
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c65c7b6-5a8f-11f0-a315-13f23c93f187;
 Sun, 06 Jul 2025 19:34:36 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.254.117])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4bZvd76ZfRz6T9l
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 17:34:35 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hnlmg (unknown [10.110.101.69])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 19A2810020F;
 Sun,  6 Jul 2025 17:34:35 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-5b5ff79f4f-hnlmg with ESMTPSA
 id wqiONKqzamii6jYA/pVrlw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 17:34:35 +0000
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
X-Inumbo-ID: 7c65c7b6-5a8f-11f0-a315-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-96R00153b27ae6-6b01-4969-bf11-a346388896fd,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 20:34:28 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 07/22] x86/mtrr: expose functions for pausing caching
Message-ID: <aGqzpGfK5arnH-VF@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d6e871f055c2456ab194e49bd470eafd04e454e.1748611041.git.sergii.dmytruk@3mdeb.com>
 <edef4d83-25d0-4191-bd7b-c13c38af34bf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edef4d83-25d0-4191-bd7b-c13c38af34bf@suse.com>
X-Ovh-Tracer-Id: 12946441556070675545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=suVvpyASVCUkdqvVexf4rpL6qqiRoTDTDHSQX9CVKgQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751823275; v=1;
 b=ff926O5TjJ2U+UsbwG/NbqFV6h7eMjBhTdVOcl97+Bma9Ge4oazOZULaLGBE6YXZJKzxgkkc
 0Ec90Xfb87z5PaceY5aqDA8XER1OxqKR9CVapX3ggOAhiAz0tKAllYSHxdOKIVQlR01KBDLuLBX
 iDQOl9ws2tniIEGpKITNjw4ohY/0gDQOH4Y9xSd7ZIPIPiAFyruqgNYtywrGWyx4ZylQNwdSb+M
 MrtIX2iRW8oBscBZSA/ZS2+WcBvooR6Vvu/zUvIbu2KQKDEy5JEG1layTOw18NpNC4yAi1QLQYB
 nAEQ2gJJlfinDsOjXsjqqPb5vk3ntoX38JpQ7THphmjbA==

On Wed, Jul 02, 2025 at 04:57:12PM +0200, Jan Beulich wrote:
> > @@ -440,9 +436,10 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
> >   * has been called.
> >   */
> >
> > -static bool prepare_set(void)
> > +struct mtrr_pausing_state mtrr_pause_caching(void)
>
> These becoming non-static without being called from anywhere else isn't going to
> be liked by Misra. Hence the part of static -> extern may need to be deferred
> until the new user(s) appear(s).

Sounds like small part needs to be moved into the next patch.

> Furthermore this returning of a struct by value isn't very nice, and looks to be
> easy to avoid here.
>
> Jan

Are you suggesting to use an output parameter instead?  Out of
curiosity, what's bad in returning trivial structs by value?

Regards

