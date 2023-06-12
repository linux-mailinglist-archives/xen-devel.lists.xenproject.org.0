Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6E72C90C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547279.854577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iyN-0003lG-AJ; Mon, 12 Jun 2023 14:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547279.854577; Mon, 12 Jun 2023 14:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iyN-0003i1-7L; Mon, 12 Jun 2023 14:56:47 +0000
Received: by outflank-mailman (input) for mailman id 547279;
 Mon, 12 Jun 2023 14:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=abR0=CA=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q8iyL-0003hv-00
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:56:45 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5758e4af-0931-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:56:42 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 2D236439D2;
 Mon, 12 Jun 2023 07:56:40 -0700 (PDT)
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
X-Inumbo-ID: 5758e4af-0931-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686581801; bh=Q7T+Nh3UpBYAq53y45AQNwBQCjqNk0W9lhapEHm+sIc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FxXFUY3xy7IhBczOXQjCH18fF9LnDhK+3YdIBo2Qk/qRTvw8C9+cerU5SKaRWM8ko
	 Uae5cuOqaN0Ip7//GXc90xXTwuBrH5v+C6Dp+8xBzpY8ws9beVGFI6hHmvDoRF8KL2
	 ZCT362w/U1WpTru6Gsa1jLE5MDCbc663UBYMRazBQkR6sQCqrsUNEzJ4EWUC+fK1Ht
	 o9RXkWshCyqE3htm/Umf+WH0XdSzvnVNhkTwssx2fuca2TE0eR76ZwtO9E/kouwcjm
	 8pdBOqqU+4ZVD4TEmdPRqZzJchQwGnu+8TPAGesEpgpnjytqGcqv+TMLyZx96YUCDR
	 DH0+eFVAGs3mA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jun 2023 09:56:39 -0500
Message-Id: <CTARCMC2X01K.3OTVJ5EQU3HX4@Shawns-Mac-mini.lan>
Cc: <tpearson@raptorengineering.com>, "Doug Goldstein" <cardoe@cardoe.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Wei
 Liu" <wl@xen.org>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v2 0/4] Initial support for Power
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Shawn Anastasio" <shawn@anastas.io>, <xen-devel@lists.xenproject.org>
References: <cover.1686580752.git.shawn@anastas.io>
In-Reply-To: <cover.1686580752.git.shawn@anastas.io>

On Mon Jun 12, 2023 at 9:51 AM CDT, Shawn Anastasio wrote:
> With an appropriate powerpc64le-linux-gnu cross-toolchain, the minimal
> image can be built with:
>
> $ make XEN_TARGET_ARCH=3Dppc64 -C xen openpower_defconfig
> $ make XEN_TARGET_ARCH=3Dppc64 SUBSYSTEMS=3Dxen -C xen TARGET=3Dppc64/hea=
d.o

Minor clarification to this cover letter, the manual TARGET=3D override
is not necessary. All that is needed is:

$ make XEN_TARGET_ARCH=3Dppc64 SUBSYSTEMS=3Dxen -C xen build

Thanks,
Shawn


