Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB0AFA6C6
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 19:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034876.1407231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYT0J-0001Sw-TU; Sun, 06 Jul 2025 17:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034876.1407231; Sun, 06 Jul 2025 17:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYT0J-0001QZ-QF; Sun, 06 Jul 2025 17:18:15 +0000
Received: by outflank-mailman (input) for mailman id 1034876;
 Sun, 06 Jul 2025 17:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYT0H-0001QT-Vv
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 17:18:13 +0000
Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net
 [46.105.36.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 322ef305-5a8d-11f0-a315-13f23c93f187;
 Sun, 06 Jul 2025 19:18:12 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.58.95])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4bZvGD3sVhz6THn
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 17:18:12 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tgdnw (unknown [10.110.164.49])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CB0F2C2DAC;
 Sun,  6 Jul 2025 17:18:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
 by ghost-submission-5b5ff79f4f-tgdnw with ESMTPSA
 id ndNSKNOvamiY0TwAwA6J4g
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 17:18:11 +0000
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
X-Inumbo-ID: 322ef305-5a8d-11f0-a315-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-109S00375a7925e-88d1-4fca-a1a8-8b83d632b2d3,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 20:18:09 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 17/22] x86/acpi: disallow S3 on Secure Launch boot
Message-ID: <aGqv0RghImIcJGF8@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ddf81a75f5afc404a3e52d4de5a25bae6b7801f8.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ebdd128d-971b-4aed-b2be-af114bd9ea14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebdd128d-971b-4aed-b2be-af114bd9ea14@suse.com>
X-Ovh-Tracer-Id: 12669751653277283417
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=q2KymjIV1zSmaEvUifmf5bVP+4azULc0yqDCGvylTkc=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751822292; v=1;
 b=N3K2SmbpR/CsU6UXhb9Jo+SOcN7D/TgWu1whkNy2ZOg2cOshyawwq0X1xytXWdaaekBMyI88
 2jA+5eFCQqkA4g3wI2iQEvxn/VENogx68gDg/DLKGSFPjieLH+GhXyT8RnLOpU32GXEUDZ8iyYL
 5pDM9TljDDUZ7m6yblo8oFRPWJU+xYcSggX7GOnNjLC0RfkjgpxdS/6agwsBKZ4VlhAMfbkd2rN
 lYs0fsLLMBsa/OQ2BDJ/a+S+3rpZNN4rdowbBq9JYrh0TX+RJxFKjZ34ZOB9nW55ee9VZdUdWaT
 DVq0RmPk/UgILTm8DM3K/jEOh0ExwU7Z+s/Wx50imc26w==

On Wed, Jul 02, 2025 at 04:48:38PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > @@ -356,6 +357,13 @@ int acpi_enter_sleep(const struct xenpf_enter_acpi_sleep *sleep)
> >             PAGE_SIZE - acpi_sinfo.vector_width / 8)) )
> >          return -EOPNOTSUPP;
> >
> > +    /* Secure Launch won't initiate DRTM on S3 resume, so abort S3 suspend. */
> > +    if ( sleep->sleep_state == ACPI_STATE_S3 && slaunch_active )
> > +    {
> > +        printk(XENLOG_INFO "SLAUNCH: refusing switching into ACPI S3 state.\n");
> > +        return -EPERM;
>
> Not sure about the error code here: Generally we prefer to limit EPERM to
> what XSM has to say. Could I talk you into using e.g. EACCES instead?
>
> Jan

I have nothing against EACCES.  I went with EPERM because I saw it
being used twice in this function.

Regards

