Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048DC575DE8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 10:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367974.599156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCH4p-0003Fo-1X; Fri, 15 Jul 2022 08:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367974.599156; Fri, 15 Jul 2022 08:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCH4o-0003E0-Sz; Fri, 15 Jul 2022 08:53:34 +0000
Received: by outflank-mailman (input) for mailman id 367974;
 Fri, 15 Jul 2022 08:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yizK=XU=protonmail.com=mathieu.tarral@srs-se1.protection.inumbo.net>)
 id 1oCH4m-0003Dp-PR
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 08:53:33 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 999bb09b-041b-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 10:53:31 +0200 (CEST)
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
X-Inumbo-ID: 999bb09b-041b-11ed-bd2d-47488cf2e6aa
Date: Fri, 15 Jul 2022 08:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1657875210; x=1658134410;
	bh=DKp8LYg+guIukYB1LLpLmqp/yuSY1kfQ9mOFW6QmJK4=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=nhFy0t58ITp+i3b14mevJRP5GHUPxkwn86VRedxBn2yqO+bZTw+3D+8oLITc3MwgU
	 09jPNC32+dJnEn0O9eF5EZ3MyXVhx4FtVqZT80f32qYzu/fidB843D6LOfRz9QuiKB
	 H7fUQZmntQM7MVGrCr7FV+Q64J7gVnaFeAnDdyemK33qRdSMvTk8L0ShsgdvkTfGuU
	 QnnDTMLe4FTUCPJaGl1rXejc986dZUwIaMplo5SKJ8ti1KzRaiHgxYw5//OaUyqKB9
	 oVzI9Ks764nQRvBDHQjQf872KkBHOot/mL6L62/JHfqx5g4mrbgnpNcFflTym95Jzp
	 yKhv21O0M4GjA==
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xen-users <xen-users@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than all-addrs
Message-ID: <8xw3d1YneEfFrFwF4YmilgJ0_F-AsJxCZMUFdsGm_TJOKc7q1IzeQ33kC0XKLdfRGRWQLJ1vUfIa7tNDnHxjN9Bb9g5PJlJ_TO22uT25OO8=@protonmail.com>
In-Reply-To: <2e761a65-f24b-edb5-6a7f-cebf47d51c68@citrix.com>
References: <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com> <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com> <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com> <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com> <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com> <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com> <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com> <2fad8072-e5f1-2302-f01d-82f744606d9b@suse.com> <2e761a65-f24b-edb5-6a7f-cebf47d51c68@citrix.com>
Feedback-ID: 279104:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> > > (We're trying some new project management tools.) Can you try opening=
 a
> > > bug here: https://gitlab.com/xen-project/xen/-/issues about the
> > > check-endbr.sh issue?

I'm getting a Gitlab 404 page when trying to access this link.
Are there access restrictions in place ?

And same for:
https://gitlab.com/xen-project/xen/-/issues/26

I see the fix is already on its way !
Thank you for the great support.

Mathieu

