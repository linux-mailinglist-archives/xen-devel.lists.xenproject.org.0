Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACCA33C769
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 21:05:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98113.185986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLtSi-0006L6-4Y; Mon, 15 Mar 2021 20:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98113.185986; Mon, 15 Mar 2021 20:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLtSi-0006Kh-1A; Mon, 15 Mar 2021 20:05:12 +0000
Received: by outflank-mailman (input) for mailman id 98113;
 Mon, 15 Mar 2021 20:05:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KFh+=IN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lLtSg-0006Kc-TR
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 20:05:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbb016f7-db19-4687-b512-49965c6f0784;
 Mon, 15 Mar 2021 20:05:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E96B64E12;
 Mon, 15 Mar 2021 20:05:09 +0000 (UTC)
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
X-Inumbo-ID: cbb016f7-db19-4687-b512-49965c6f0784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615838709;
	bh=Bqm/F5tvXhB5iCbk4OleFCmg5XUVqpi1wQu7OB6ptOQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LdwZ2bnNN40YcUqIIisIWTkEJ1cNlkLUV1gMKgBVhiVLYxDx6CtH5xxWskkHOvhg+
	 lpZFmA/NujOpT0OPav05BoollwcLZDIsU/PEMSUTpIDNeadBZFiWcighvDKNOUCoZO
	 RdyyUu92nBLBqMxrNSOOswk78KWC77qTxjAcUGLZfEOuhjhgL58EZeaz//cwOM+NGU
	 5Vf+CWZeR95O2sfzTEd7Ni0aqoWR7FYiasrcFVXKRHhL1kksMHDCb3BewgHiAzxJAp
	 Of+2O2g+BWo/x4pNPV+b3j/9QpT6u26WtRncoHHPL1z9xjVlHGkNDSaR3jMsqZKuCN
	 ssdfdr6lY98WQ==
Date: Mon, 15 Mar 2021 13:05:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, committers@xenproject.org, 
    Bertrand.Marquis@arm.com, cardoe@cardoe.com, fam@euphon.net
Subject: Re: patchew - gitlab-ci notifications during the Xen 4.16 cycle
In-Reply-To: <YEx8hW+2StdaUpH8@Air-de-Roger>
Message-ID: <alpine.DEB.2.21.2103151303551.5325@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2103121236430.18926@sstabellini-ThinkPad-T480s> <YEx8hW+2StdaUpH8@Air-de-Roger>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-602485141-1615838709=:5325"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-602485141-1615838709=:5325
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 13 Mar 2021, Roger Pau Monné wrote:
> On Fri, Mar 12, 2021 at 12:55:38PM -0800, Stefano Stabellini wrote:
> > Hi all,
> > 
> > During the last 6 months we have been working on improving the Xen
> > Project gitlab-ci and patchew infrastructure.
> > 
> > You can see the results from gitlab-ci tests on the staging branch here:
> > 
> > https://gitlab.com/xen-project/xen/-/pipelines
> > https://gitlab.com/xen-project/xen/-/pipelines/269678673
> > 
> > In addition, and more interestingly, now we have patchew integration.
> > Patchew picks up patch series sent to xen-devel by any contributor and
> > commits them to branches under this repository:
> > 
> > https://gitlab.com/xen-project/patchew/xen
> > 
> > Then, gitlab-ci tests start automatically. Patchew waits for the results
> > and send a notification email. You can see patchew pipelines here:
> > 
> > https://gitlab.com/xen-project/patchew/xen/-/pipelines
> > 
> > All this typically happens before patches are even reviewed. Today the
> > patchew notification emails are only sent to us in the Gitlab-CI working
> > group. But the good news is that we think the results got to the point
> > where they are reliable enough that it would be good to share them with
> > the community.
> 
> I'm not opposed to that, but we seem to have some random git clone
> failures during builds (at least on the x86 side), that are more
> frequent that expected. At least recently I had trouble getting a full
> gitlab CI pipeline run that didn't hit one of those.
> 
> I will try to figure out what's going on by adding some more debug to
> git to see if I can get more verbose information from git on exactly
> what's failing.

Yeah we brifly talked about those during the last gitlab-ci meeting.
The current theory is that they might be an infrastructure issue and
we ask Doug to have a look too.

Your idea to add more debug info to git is excellent.
--8323329-602485141-1615838709=:5325--

