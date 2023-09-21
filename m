Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE97A904B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 02:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606036.943701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj7z7-0001e1-5X; Thu, 21 Sep 2023 00:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606036.943701; Thu, 21 Sep 2023 00:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj7z7-0001bu-1k; Thu, 21 Sep 2023 00:56:01 +0000
Received: by outflank-mailman (input) for mailman id 606036;
 Thu, 21 Sep 2023 00:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fi77=FF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qj7z5-0001Xo-SB
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 00:55:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e78f5c6-5819-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 02:55:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEFEF61D9D;
 Thu, 21 Sep 2023 00:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59052C433CA;
 Thu, 21 Sep 2023 00:55:53 +0000 (UTC)
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
X-Inumbo-ID: 9e78f5c6-5819-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695257754;
	bh=tjOxBymd6v+ZCkaH5zR2nm02vOudmydPHsbAMqVrnRM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jobD05phliXnrb1R0yGjQQls14candWkNLmUZhMQva5mWo89HLESeUFnG1DU3S8+c
	 qkiLy5tolSiRy24JUcJIW1qDmcOCNIxC9If3xi7wQWGwQQZ8XTfCHTbyn0RwJGL7Dy
	 GjevE2ayDOoeNOOiU72le7IChjJqeYXj/sKWMznkSbkPj0eGe66QZKHhTAKncPS8Bj
	 qwtrB7K7jEI4cNzQyZt6XZWoGcWSzjgazis65T7aTCocmdRPwiip3UmvMdWdZaaf1e
	 Eymr9+nap9WLgpUIA37xcqmvgH7dkKedvSKUPEYW4+zyiAvoGSR2EOMFT6BDbf4+II
	 SgzwnTT1T1oeg==
Date: Wed, 20 Sep 2023 17:55:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v3 0/4] python: Support setuptools
In-Reply-To: <1967aed1-3c46-963c-687b-50feb09781aa@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2309201755320.3563@ubuntu-linux-20-04-desktop>
References: <cover.1695102101.git.javi.merino@cloud.com> <1967aed1-3c46-963c-687b-50feb09781aa@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-604739729-1695257754=:3563"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-604739729-1695257754=:3563
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 20 Sep 2023, Andrew Cooper wrote:
> On 19/09/2023 7:30 am, Javi Merino wrote:
> > This series adds support for setuptools as distutils will be
> > deprecated in python 3.12.
> >
> > Not done for this series:
> >   - Andrew suggested simplifying the code in m4/python_devel.m4[0] and
> >     this is not done yet.
> >
> > [0] https://lore.kernel.org/xen-devel/fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com/
> >
> > Changes since v2:
> >   - These containers used for gitlab ci were missing setuptools in the
> >     previous series and now they have it:
> >     * alpine/3.18-arm64v8
> >     * opensuse-tumbleweed
> >     * debian/bookworm-i386
> >     * debian/bookworm-arm64v8
> >   - These containers used for gitlab ci are being kept without
> >     setuptools to test installations that don't have it:
> >     * centos/7
> >     * debian/stretch
> >     * ubuntu/trusty
> >     * ubuntu/xenial
> >     * ubuntu/bionic
> >   - Fix commit messages that talked about removing distutils support
> >     as we are keeping it.
> >   - Add my Signed-off-by to all commits
> >   - Clarify in the readme that python's minimum version is 2.7.
> >   - Fold the changes to the ./configure script into the patch that
> >     changes `m4/python_devel.m4`.  Create ./configure using autoconf
> >     2.69.
> >
> > Changes since v1:
> >   - Update all containers to have setuptools, as python 3.12
> >     deprecates distutils in favour of setuptools
> >   - Keep python2's support by falling back to distutils if setuptools
> >     is not installed
> >   - Drop the commit about raising the baseline requirement for python,
> >     as we keep supporting python2
> >
> > v1: https://lore.kernel.org/xen-devel/20230316171634.320626-1-marmarek@invisiblethingslab.com/
> > v2: https://lore.kernel.org/xen-devel/cover.1694450145.git.javi.merino@cloud.com/
> >
> > Javi Merino (2):
> >   automation: add python3's setuptools to containers
> >   README: update to remove old note about the build system's python
> >     expectation
> >
> > Marek Marczykowski-Górecki (2):
> >   tools: convert setup.py to use setuptools
> >   tools: don't use distutils in configure nor Makefile
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I'll rebuild the containers and regenerate autoconf.

Thanks Andrew, go ahead
--8323329-604739729-1695257754=:3563--

