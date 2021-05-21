Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99E38C8F3
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 16:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131323.245504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5qA-0005ZV-Pl; Fri, 21 May 2021 14:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131323.245504; Fri, 21 May 2021 14:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5qA-0005Wv-ML; Fri, 21 May 2021 14:09:26 +0000
Received: by outflank-mailman (input) for mailman id 131323;
 Fri, 21 May 2021 14:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNw9=KQ=tronnes.org=noralf@srs-us1.protection.inumbo.net>)
 id 1lk5q8-0005Wp-VP
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 14:09:25 +0000
Received: from smtp.domeneshop.no (unknown [2a01:5b40:0:3005::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a8d50dd-b3ba-4dba-a552-6ae1c2338342;
 Fri, 21 May 2021 14:09:23 +0000 (UTC)
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=50828)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lk5q6-0005ru-3Q; Fri, 21 May 2021 16:09:22 +0200
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
X-Inumbo-ID: 5a8d50dd-b3ba-4dba-a552-6ae1c2338342
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mzxTAoQKZErI0PSlV6Tx+3ILAHO7jFNRjBMhpv39Rlg=; b=bILOGlhtsDznJmhl3TFXvnvplE
	Ixe5T9HBrMiDZAMMx686k9FpKn1MoqOli+IjA8R8W5lHgPq/6V5gQAy0cvXVppCuGncYVYXrfJ1iA
	mDTQj4RQ0x2cVmKxxqif50mnzTNJd1YW5eYwJwKp0Ls9DwseAh9+YEu/yXcVzyi/ZHKjxENmXmIsj
	jJua4+BnHtIVIU6l/fRg8ZFtLHYf2pkbwZwOlWiMbiYsR03CkDUc5iDBh+KZW/j2/rKY1cGCxELJy
	qUoNtLvmohAEWOPP9E7yLiBxq7gf6X4HjlOOtsTm5+Jf46IQdc8hXtE1zPrKNoHY/NCKNzIbW8tjL
	fJseoIJg==;
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Emma Anholt <emma@anholt.net>, David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0b2b3fd7-7740-4c4e-78a5-142a6e9892ea@tronnes.org>
Date: Fri, 21 May 2021 16:09:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



Den 21.05.2021 11.09, skrev Daniel Vetter:
> Goes through all the drivers and deletes the default hook since it's
> the default now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Noralf Trønnes <noralf@tronnes.org>

