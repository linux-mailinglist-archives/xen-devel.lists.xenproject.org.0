Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533536508F2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 09:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465903.724714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7BwT-0000p9-QL; Mon, 19 Dec 2022 08:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465903.724714; Mon, 19 Dec 2022 08:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7BwT-0000nC-NV; Mon, 19 Dec 2022 08:56:13 +0000
Received: by outflank-mailman (input) for mailman id 465903;
 Mon, 19 Dec 2022 08:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M8sX=4R=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1p7BwS-0000n6-9Y
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 08:56:12 +0000
Received: from neowutran.ovh (vps-eb112777.vps.ovh.net [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa612a8b-7f7a-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 09:56:08 +0100 (CET)
Received: from neowutran.ovh (82-65-208-184.subs.proxad.net [82.65.208.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 7F58260BCE;
 Mon, 19 Dec 2022 08:56:08 +0000 (UTC)
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
X-Inumbo-ID: fa612a8b-7f7a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh;
	s=my-selector-name; t=1671440168;
	bh=ApYA0fwAovgiooHHpBkLqMfMdf306pviSglOzwi/5S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nyQC0DcazV4382XSfFrA0pn5GfjbTS0f0YzceoHHidMOL7TI2GavATK4QbbhnvqUo
	 Ma3tzLzjf5LKGHbmAXdJ4O6/wb1grSFWboD0/QtQ/oFIDphoVZucJ8DUcgO2LX018x
	 HMIxKV2mphvhWCLPPtGKp3VzefMS8yhWAZRrDFS4+VCMmCe0JZLL+HISUcjoQ0hkne
	 Iv42ZWn46vvTm5j/JIxsx8Ey1pMIxtuTIcZtkVlbIbIkBk0dMKT01rFRJ+thUW/U4t
	 aDqeHH0k6rzACojU+B90gyFeBX6np6sFXMU7Q5aH76v69A0ahS2qt0H3b+4VMzCWze
	 56QePyoIT6W00Z8GECr/hlaI97A3Wikhed+1uvw0nGA+/MTFD68TW1RziUIPWY1Lap
	 Nm9U58jOyrekf/ujqgSa+Mch/HuPCxM6jewAHWhD9pWZBAPEFjkeL8ZQXHaRVr0D8J
	 ZG4KUiwwqlkO9noBxnmybsLbSbXSPGFRIADhhcKlR80+gzLv2vdtPxQAP4ae9tTBxv
	 KDGHlmdlhc3OQB1RwTCxLqDbV6sCYHz6OL2lN+tF4h//bFNVYJT1gv3Qv3s49akC6k
	 tE6DBe+QFtPRTn4rALlmQkTpWgvzHW64SVZMJytDFX96vs/KSg31uIq3xsRHyqn/0D
	 /kIGC6GsQ9K475Iw3LevPmYo=
Date: Mon, 19 Dec 2022 09:55:54 +0100
From: Neowutran <xen@neowutran.ovh>
To: Jan Beulich <jbeulich@suse.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elliott Mitchell <ehem+xen@m5p.com>
Subject: Re: [PATCH v2] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Message-ID: <20221219085554.rvp4a5xdc6visbqm@archlinux>
References: <d018f50f439c4d8dff8add022d28698a2af3c320.1671365645.git.xen@neowutran.ovh>
 <Y5+KgBxxmlYfq7e2@mattapan.m5p.com>
 <be1e0ba4-cd88-330a-aad4-2ffc14b075a6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be1e0ba4-cd88-330a-aad4-2ffc14b075a6@suse.com>

On 2022-12-19 09:12, Jan Beulich wrote:
> On 18.12.2022 22:47, Elliott Mitchell wrote:
> > On Sun, Dec 18, 2022 at 01:14:07PM +0100, Neowutran wrote:
> >> xen/x86: prevent overflow with high frequency TSCs
> >>
> >> Pr 
omote tsc_khz to a 64-bit type before multiplying by 1000 to avoid a
> >> 'overflow before widen' bug.
> >> Otherwise just above 4.294GHz the value will overflow.
> >> Processors with clocks this high are now in production and require this to work
> >> correctly.
> >>
> >> Signed-off-by: Neowutran <xen@neowutran.ovh>
> > 
> > Needing a bit of word-wrapping, but that can be adjusted during commit to
> > the Xen tree.
> 
> Right - also the first line of the body really wants to be the title.
> I'd be happy to make edits while committing, but as said in reply to
> v1 I also would prefer to suffix the literal "1000" instead of adding
> a cast. I'd also be happy to make that adjustment (including to the
> description), but I'd prefer to do so with your agreement.
> 
> Jan


No problem for me.
If you prefer I can also do a v3 later today. 

 

