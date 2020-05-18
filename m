Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3D1D91FB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:23:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxW9-00048n-Lp; Tue, 19 May 2020 08:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mazm=7B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jaxW8-00048i-Lh
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:22:28 +0000
X-Inumbo-ID: e0320fe0-99a9-11ea-a8e4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0320fe0-99a9-11ea-a8e4-12813bfff9fa;
 Tue, 19 May 2020 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Rc+qzUpe0T069lskf8TXNNcQCBC0VCFC0iUiW3PNpCA=; b=utrlcu0AgRkjLf/Rsyhse2WhB7
 kT1FLIx13BMfa4ikBcMl8hbyAQsf+qc8Oh1UqY51YSLy+8W6k8LPeBnWmXV8O+MsmslsO59RW8ZQv
 cJURxTrQWgTQEvKqlZ/IP9SmN/3VQDZ7QdooKQMZcggIKy8KZgdobJS1sE5m9PW1AJDM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jaxW5-000370-QD; Tue, 19 May 2020 08:22:25 +0000
Received: from 96.142.6.51.dyn.plus.net ([51.6.142.96] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jaxW5-00037u-G6; Tue, 19 May 2020 08:22:25 +0000
Date: Mon, 18 May 2020 23:24:38 +0100
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v7 00/19] Add support for qemu-xen runnning in a
 Linux-based stubdomain
Message-ID: <20200518222438.ar6e7fzkrjr5voau@debian>
References: <20200519015503.115236-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I have queued up the first 5 patches for committing today.

Wei.

