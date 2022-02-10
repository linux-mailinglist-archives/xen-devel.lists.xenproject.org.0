Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93A4B06E5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 08:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269604.463687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI3mx-000689-2u; Thu, 10 Feb 2022 07:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269604.463687; Thu, 10 Feb 2022 07:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI3mw-00064m-Vx; Thu, 10 Feb 2022 07:22:46 +0000
Received: by outflank-mailman (input) for mailman id 269604;
 Thu, 10 Feb 2022 07:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWaC=SZ=yahoo.com=akm2tosher@srs-se1.protection.inumbo.net>)
 id 1nI3mv-00064g-5A
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 07:22:45 +0000
Received: from sonic304-20.consmr.mail.ne1.yahoo.com
 (sonic304-20.consmr.mail.ne1.yahoo.com [66.163.191.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c213fbe-8a42-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 08:22:43 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Thu, 10 Feb 2022 07:22:41 +0000
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
X-Inumbo-ID: 3c213fbe-8a42-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644477761; bh=ZZvgsyCTeXRtOZQ4sm+l1YfOSFuNPEZ1SjzTGrBqYEA=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=F3yslocUaGBRpdDh+ktnCyagxKKx0CsxvHZMSnP1uIjmQcMKQwCn/2UJrN/NHBo/8I8KWoQ8P2fTfZ7eMFzYNv3o6QAI8QMv72y1r4XXI+m+eAY0aICHUUp5KPMmPvincdOdLk1D6sM/iKuZv1vUGcQsqnX9ROimHgIW2nk9tqRscgEedxx/IRTJcWbYWFpVdaUZHd/OZ5nupN6LVgo6l/yJg/RBL9jvtk7froNoy42dkRvhEKdbImNePJzwoLGfkrNxlNE4ZXRlLklWRwCzNZTNGUa+momhNlUEEL9Uh7qjwBjNTJH1NHRl4aLeJ9bgtw6UCk4UpuRENPL/2d89Kg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1644477761; bh=26KO92rtqrsbK4XOLuVx/PfFStUx8PVTd6b4W1sw/89=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Z9krgNefy3Fa2eJOTphp9RE8V7gA/6GtJEDKaHON/8kdFoSs2Ts6EVQP4KXveyWvgZYqRYxURWeaACrpEuKKCvfjRk8/2oUNqc8f80Mky4uoS2eNGFwRpUiA6kCRLLcnpO0OweYnfHujBCerCVlhw0oSQE+M6KW74i8W+BPINcVmP5BBS3aQmpqufLD2JTVD2BzJ8dk2BcMuV7KGXA+uLtI4SVkquHuNGEhDVlTV04tW28cvFCwLz2Dc8NE0aIZfqqs+Rtgy/EiBuHaBMuZsLJLnCS/drL056kdWR72004o5ebnXc2L7iLtVPYu0McDTlgTYFmYeL/JtUq7AVOJw6Q==
X-YMail-OSG: 60k44.QVM1n6wI5z_gjJ9F8MpArsaaYqPKOA5qFY.uEJvXj7hvZ1DUXNQhaWnf8
 oZ9Rophda97btyivQxnFul9pEgvCfVBvYY64B.Qb4mFzzBZ1rEH3iZBTH2Kr3WMe48teK4AW6Kqd
 b3CGD.uDeHb9U9Ry8kR2RGQ8m5s3Pn5alHIAOjCgCmpBvELY.7ZVyRnxIuyEHbW.aL.HOu7UhEnv
 OICLkONchXMd.owl0Uw20z3L8bnT8U6Io21sZrR8u9QARdEAXu7cgsUlfyoppZzloeanWk68inDk
 .TbHhexwfLlUQBZ2zaliqF6Lr141EVDN0YfI7DwqfQfr3yo0cHMl3zrdmrfDYRZXPNmxNkRKvBPD
 H10YRaaePUq_GNoNorhLPMAg2ovHj7pg9K.s2iDFRHXgsV5PRFCPPMiN4NbLNL28IebuKY3Iaa4q
 fXgXn3CLveizesYBpwwWr_h4m9kiop_U2VS6oGX_GDSc8X4uZjWOFGAl4PGAvl8iCy6D1zMZDp47
 IYsbRCTLcsztxrJSXEF0D1o7QpgdcZxjPAeXYTQ7pJUH9bbt2FRpIb9U6_I3adDPRW1t58FIyUn5
 5K76XNv1t6eL9cbE1q1jypyypzBnqqbPVfib5Ho9f.4eNb9itSdZU3uqoKd08H4QZhThOKQULSe5
 IhiXFx1CXWhyo6x2EgCDaOu9.3R9v9R2NNSw0rFt3Tf0XzveamfRhrh2LecPvU24oOTT9tnwWDi6
 Bcf8TEeWPZwwRCO3JMYNkvom3z_wd9O2y3un13q8dzCUeFXJ5A_7lNOOZmtX2MQ5ambNtPx3VdAf
 TnTRjFlVcNNGvOSEMBVJ_p0sq_mjsv5c.05yDPZsGUm5EXdo6RDi1QN96Ew.gkLH0V5Wt0anH9bl
 IufLdTb1QAAOIcsuemaljOjS3EVkgKDLxe3x2_araRq6Baoyi.Rrx07SuynVrm_eOUOHb0QTb.Pl
 FeYcm9Fj5Ym8omOlthCTzwTAe9ZD_AUEDsD3iIHUY3wOvNUPT0_kHkPUVu8UY.KklaVRruv7tgOY
 Yz5De1hNTeg0W7QeKnlBSF7Oy3TaKQP.DF1D5qUkrHVpKaPnyGrEPVqWw9p5vtDkx6za7qMcI7kq
 o_4bTejg0sRgdCPoQr6onVryq_dPzeszwc7FZR2WNrVGdiMPAWld52VF_JOURlyOu8n0i5oTCVUz
 AUE3AzVW6Qmv9QwhLv9PoUwewVsz3xvBH9n7bCgBFCRWKTNxQOvk8vgGYOWeDeBJOsbPM.DxuauJ
 F8jZne2a.E60_EUOt_I48yVGG.ONFJVg89f0nrp1AP45xw1HxG0VsSIVdavGjz8qJLLO9Lv77gVJ
 p6l78OfWdyBzf4OmSdHgEI2XM6.qOR6CQ1U18qGWlOOmYlY.t7eu0CRxOwGlDnNSe.FJoGvknOpg
 IavsQ7AjxtOrHHh0diPXRBpu1XCa271OhbFGTD5CIeQKkNI7VBoA_TwlY__VnvKYqOgbKpFBgRVQ
 oNsO5w.f70Ag6QLtAFGNJmHRe5xxhLvzUO8XMMHdBlYcWE1PuKtp1i2etqqWnjRcXm3mdysRTysQ
 YCxhRlsXHv8gSCz7EqBJ3VVv03Q52Y8xkx4Y4dXdZcpqYV6dYpmFZRdhUo9MLlek.ara3FiR.7iS
 NME2AXSPM.vwyQaYxiBhzTPg8Yzt6IkavdwfsD8Y59KnEnFwfSI9CRXHs2jMp5LYzPj.R0CBjqFn
 nYeppYGXVFcgw0G1QrY4.Qf3eTNDyMkO0WrerZoHHka4S7M5MJm1b9bUsJQURsA._qGk5Tg2jTeE
 1.io8fMi9eRGVlgKrtMc1sllSsoq8Gpt1evw.ytlQ3O.4ZvS9sTBLAAn2o.d5omPy0eTQZkdN0Li
 E8jdx40D2yuK5WStGStRhrXPEDEV_.SKljQXywr6GIbd3TrD33pS.CnVuIAIAwN8IhMzQVUdxQN.
 bQzj03y7kpwVNyXos.GPfKVjBUtBW4Fz_zE31pusuzYQ0sloY1IT0szDJonfPz7CqczyOg9PPjQi
 RrHSvFN2hAsODZvrOSTRy.EHW_scHO.aAC2WqOVctgSY5acR53gmLRO0jtwrqcwyRhtxVjTpluZ2
 5DOq1pWNdnghYlA2k5nGd5fXje05GUo1R4sUSfCaIlwVxbavcaomdUTCyv629Y0B4EaaApQNL7AN
 z8RbUwDylAIqpUshKrBnJNu5faBQoxJ4fOQZWMY1WiQ313OnbpSDfJs4hQXnW.DaA96Nbjwbc6Gv
 2TjBNlOULNjv7oxFM07xpihyw6ICZJ5NJGNBkpVEbjU73KuZ.AFvQoMU-
X-Sonic-MF: <akm2tosher@yahoo.com>
Date: Thu, 10 Feb 2022 07:22:38 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>, 
	"xadimgnik@gmail.com" <xadimgnik@gmail.com>, 
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <303292590.682317.1644477758255@mail.yahoo.com>
In-Reply-To: <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com> <709142925.628001.1644127197288@mail.yahoo.com> <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com>
Subject: Re: PCI passthrough support for PVH mode
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.19724 YMailNorrin

Hi Jan,

Thanks for letting me know this status.

I am wondering if PCI passthrough is at least available in Arm for other virtualization modes like PV, HVM, or PVHVM. For example, is it possible for someone to attach a PCI device to a guest domain on an Arm machine and use that domain as a driver domain, like we can do with the Xen on x86?

Please let me know.

Regards,
Mehrab




On Monday, February 7, 2022, 02:57:45 AM EST, Jan Beulich <jbeulich@suse.com> wrote: 





On 06.02.2022 06:59, tosher 1 wrote:

> Back in the year 2020, I was inquiring into the status of PCI passthrough support for PVH guests. At that time, Arm people were working on using vPCI for guest VMs. The expectation was to port that implementation to x86 once ready.
> 
> I was wondering if there is any update on this. Does Xen support PCI passthrough for PVH mode yet? Please let me know.


The Arm work is still WIP, and in how far it's going to be straightforward to
re-use that code for x86 is still unclear (afaict at least).

Jan



