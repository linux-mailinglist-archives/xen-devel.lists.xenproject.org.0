Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC424AA34
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 01:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Xwb-0007wq-IQ; Wed, 19 Aug 2020 23:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EXnn=B5=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1k8Xwa-0007wl-GB
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 23:56:36 +0000
X-Inumbo-ID: fa403bcb-da27-4069-bdb4-b0d56aed81bf
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa403bcb-da27-4069-bdb4-b0d56aed81bf;
 Wed, 19 Aug 2020 23:56:35 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB9D621744;
 Wed, 19 Aug 2020 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881394;
 bh=clNqGInZpcU+sLDTIvIChzWr8ATSGgZvfk4+nx2hB2U=;
 h=Date:From:To:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=cRPLAgRBIZGi9peqzU372KKon83fIunlNQQHRbXFGjy5YIyMydT3kzDJCgXkRKSYQ
 jVRDUpCIhk/RRyyhY19NHYyvjqLg1JEjwfdeeOTnONtCBShF5WTpi/iKtQ8btc5fIu
 08sS7p9x2nCBSoZsLGId8uw1E7FmuJTvfaSMKd4s=
Date: Wed, 19 Aug 2020 23:56:34 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org
Cc: sstabellini@kernel.org, dan.carpenter@oracle.com
Cc: <stable@vger.kernel.org>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
In-Reply-To: <20200813062113.11030-3-andr2000@gmail.com>
References: <20200813062113.11030-3-andr2000@gmail.com>
Message-Id: <20200819235634.BB9D621744@mail.kernel.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend").

The bot has tested the following trees: v5.8.1, v5.7.15, v5.4.58, v4.19.139.

v5.8.1: Build OK!
v5.7.15: Build OK!
v5.4.58: Failed to apply! Possible dependencies:
    4c1cb04e0e7a ("drm/xen: fix passing zero to 'PTR_ERR' warning")
    93adc0c2cb72 ("drm/xen: Simplify fb_create")

v4.19.139: Failed to apply! Possible dependencies:
    4c1cb04e0e7a ("drm/xen: fix passing zero to 'PTR_ERR' warning")
    93adc0c2cb72 ("drm/xen: Simplify fb_create")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha

