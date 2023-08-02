Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00476C15A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574606.900032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzQI-0001rs-MU; Wed, 02 Aug 2023 00:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574606.900032; Wed, 02 Aug 2023 00:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzQI-0001po-Ji; Wed, 02 Aug 2023 00:09:06 +0000
Received: by outflank-mailman (input) for mailman id 574606;
 Wed, 02 Aug 2023 00:09:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQzQH-0001pg-Iw
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:09:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c93d1eb4-30c8-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 02:09:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9152D6176B;
 Wed,  2 Aug 2023 00:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3689EC433C8;
 Wed,  2 Aug 2023 00:09:00 +0000 (UTC)
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
X-Inumbo-ID: c93d1eb4-30c8-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690934941;
	bh=roaBjhdPe5cHaDSRDczjRWCxieCCrBLzaiLSjYR+7Kg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QuBnPiMJzQv/hmQELFgBH0DASMeTOtQXkdaSAJToCtKpswiD86kHqPkp6XKff5SQu
	 haAMhb93r4yFJqiGr/6hdN0+4vSi0mAJtCBQ9AhgntsaaZFWJSSLOLAVXaTsJKfNMo
	 jCCzM5rL7CQPNRkJpbEs+XtOPntlsHr5JfOfQGPNW2aTld3zstjOti3qHsMzw3DjxE
	 pVfgXObLhUXor6ZDGVTu4MqXBa+FSyBJk2agA0IwnFoTBfU5Z0U3HCYkgbgplT1SN/
	 a92jZNnmXn4I2tXKyWOSz3CVbV2zJtZHCYxdrFgadR+6/VByLiLQYa8ZX+/Sh9iOZS
	 jzw3RgA8PqeDA==
Date: Tue, 1 Aug 2023 17:08:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/4] automation/eclair: add scheduled pipelines
In-Reply-To: <ZMmdvllVvfDz3T92@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2308011708240.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com> <76f3cdddcba485e8124659566b2f992b3b14da17.1690881495.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2308011545350.2127516@ubuntu-linux-20-04-desktop> <ZMmdvllVvfDz3T92@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1622732373-1690934941=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1622732373-1690934941=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 2 Aug 2023, Marek Marczykowski-Górecki wrote:
> On Tue, Aug 01, 2023 at 03:55:20PM -0700, Stefano Stabellini wrote:
> > On Tue, 1 Aug 2023, Simone Ballarin wrote:
> > > This patch introduces six new ECLAIR jobs that run only
> > > when triggered by a GitLab scheduled pipeline.
> > > 
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > > ---
> > > +.eclair-analysis:on-schedule:
> > > +  extends: .eclair-analysis
> > > +  rules:
> > > +    - if: $CI_PIPELINE_SOURCE == "schedule"
> > 
> > If I understand this right, the idea is that someone would schedule a
> > pipeline (Build -> "Pipeline Schedules") and as part of that, they would
> > also define the variable "CI_PIPELINE_SOURCE" to schedule.
> 
> No, this is pre-defined variable in gitlab:
> https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

Even better! Thanks! Then no need for a comment and the patch is OK as
is.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1622732373-1690934941=:2127516--

