Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE352DEAD5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 22:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56699.99334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqN5g-0004a4-Rl; Fri, 18 Dec 2020 21:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56699.99334; Fri, 18 Dec 2020 21:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqN5g-0004Zf-O2; Fri, 18 Dec 2020 21:15:08 +0000
Received: by outflank-mailman (input) for mailman id 56699;
 Fri, 18 Dec 2020 21:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCeU=FW=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1kqN5f-0004Za-SW
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 21:15:07 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5022b878-a54b-47f3-98f0-642aa90b78ac;
 Fri, 18 Dec 2020 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id F006328B05;
 Fri, 18 Dec 2020 16:15:06 -0500 (EST)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjEvRrHH1fWO; Fri, 18 Dec 2020 16:15:06 -0500 (EST)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id BF74928AFD; Fri, 18 Dec 2020 16:15:06 -0500 (EST)
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
X-Inumbo-ID: 5022b878-a54b-47f3-98f0-642aa90b78ac
References: <87h7oudcbx.fsf@vps.thesusis.net> <CAHD1Q_zcruQ6KVHApvhb=0+mG0m80T+tmg1UzjQBki8j+aR51A@mail.gmail.com> <87czzcdtir.fsf@vps.thesusis.net> <CAHD1Q_z+WW36rfr1RAFYKjU5bocA90OonBmSKECRnpacvWyPmQ@mail.gmail.com> <873604p1i6.fsf@vps.thesusis.net>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: "Guilherme G. Piccoli" <guilherme.piccoli@canonical.com>
Cc: kexec mailing list <kexec@lists.infradead.org>, xen-devel@lists.xenproject.org
Subject: Re: kexec not working in xen domU?
Date: Fri, 18 Dec 2020 15:59:02 -0500
In-reply-to: <873604p1i6.fsf@vps.thesusis.net>
Message-ID: <877dpevmsl.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Phillip Susi writes:

> I tried with -s and it didn't help.  So far I tried it originally on my
> Ubuntu 20.04 amazon vps, then on my debian testing ( linux 5.9.0 ) on my
> local xen server.  I'll try building the latest upstream kernel and
> kexec tomorrow.

Built the latest kexec-tools and linux kernel from git today and get
the same results.  Is there a minimum version of xen required for this
to work?  I have no idea what Amazon is running but my server has 4.9.

