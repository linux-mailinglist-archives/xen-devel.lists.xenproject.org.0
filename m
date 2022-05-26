Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED2B5353DF
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 21:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337719.562395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJ5r-0007er-0P; Thu, 26 May 2022 19:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337719.562395; Thu, 26 May 2022 19:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJ5q-0007cA-Tc; Thu, 26 May 2022 19:24:22 +0000
Received: by outflank-mailman (input) for mailman id 337719;
 Thu, 26 May 2022 19:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nuJ5p-0007c4-AO
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 19:24:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706d43fb-dd29-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 21:24:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BEC73B821FE;
 Thu, 26 May 2022 19:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3206EC385A9;
 Thu, 26 May 2022 19:24:16 +0000 (UTC)
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
X-Inumbo-ID: 706d43fb-dd29-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653593057;
	bh=FaQJZ2JMQvTP42Xv4Qw4xG99LJs/Cl0cyg56TOhbd2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b7e/ZpHl21quwhMedu0UPNtWDxSCDpKyMCdfjjxuo4G58HcYume7sLZ5s0C+HEpkE
	 E79q5Bopj87d90gsb0R8DTjrb5AxW93SpQiJdxrjeB+q2Ek1C8aHp/a9aNvIDwgc3A
	 g1KI/TvMNN28nGb4U1mcMk4iXg8sHDUlmto/6qpLOD8wzaLPLG/jd2JDJzbUx1HfUY
	 k+83B+3qaR0OWodglDbL6Tvt9rA0YiWSTKXHKcvA61YZ6bo+TqK+yAaRy5M3AuHwmR
	 MgYkUbKWdqaT7qTy62PsuHfzlLz5xeNfXzh99hTnF/pF/52p4SoNW+LQs/P0Rp6Rz9
	 Q1H+hZX2XTMJA==
Date: Thu, 26 May 2022 12:24:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Naresh Bhat <nareshb@marvell.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>
Subject: Re: [EXT] Xen MISRA C meeting
In-Reply-To: <DM6PR18MB3193122699AA7888B8765E44B9D99@DM6PR18MB3193.namprd18.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2205261223490.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2204251730000.915916@ubuntu-linux-20-04-desktop> <DM6PR18MB3193122699AA7888B8765E44B9D99@DM6PR18MB3193.namprd18.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1670394745-1653593057=:1905099"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1670394745-1653593057=:1905099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Here you go:

https://cryptpad.fr/sheet/#/2/sheet/view/D+wMnbxNO7Acp1NbXEFrJtcQoOJxpuxZMTXXl+w31og/


On Thu, 26 May 2022, Naresh Bhat wrote:
> Hi All,
> 
> Can someone please share the "MISRA C Rules For Xen" read-only excel sheet link?
> 
> Thanks and Regards
> -Naresh Bhat
> 
> ___________________________________________________________________________________________________________________________________________
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Stefano Stabellini <sstabellini@kernel.org>
> Sent: 26 April 2022 08:04
> To: jbeulich@suse.com <jbeulich@suse.com>; andrew.cooper3@citrix.com <andrew.cooper3@citrix.com>; julien@xen.org <julien@xen.org>;
> Bertrand.Marquis@arm.com <Bertrand.Marquis@arm.com>; roger.pau@citrix.com <roger.pau@citrix.com>
> Cc: sstabellini@kernel.org <sstabellini@kernel.org>; george.dunlap@citrix.com <george.dunlap@citrix.com>; xen-devel@lists.xenproject.org
> <xen-devel@lists.xenproject.org>; Artem_Mygaiev@epam.com <Artem_Mygaiev@epam.com>
> Subject: [EXT] Xen MISRA C meeting  
> External Email
> 
> ----------------------------------------------------------------------
> Hi all,
> 
> I would like to schedule a meeting to discuss Xen and MISRA C with the
> Xen community. I have a proposal on how to make progress in terms of
> MISRA C adoption in Xen and I would like to get your feedback on it.
> 
> The meeting is open to anybody. The Xen x86 and ARM maintainers' input
> is required to make progress, please fill the Doodle poll by the end of
> Wed Apr 27 if possible.
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__doodle.com_meeting_participate_id_elY67vja&d=DwIBAg&c=nKjWec2b6R0mOyPaz7xtfQ&r=RXJFzR
> OO9nXScR8aaDkNU6ZCmkfPIaIv0GMuOJ1P5rM&m=qEY_7qRui0kIvfEnpRFfdtfI2fE12_6V8maCMKbla1KKnepLZFDxyEWmawRDbWrf&s=_S_U8vNb535pEdAHS77PMn-zepxQNH
> _2gRu-qFht_ls&e=
> 
> If no slots work in the Doodle poll for everyone we could consider
> re-using the Xen Community call slot (it is one of the Doodle poll
> slots).
> 
> Cheers,
> 
> Stefano
> 
> 
> 
--8323329-1670394745-1653593057=:1905099--

