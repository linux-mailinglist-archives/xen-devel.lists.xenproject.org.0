Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B261DB605
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 16:14:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbPU4-0007PY-BZ; Wed, 20 May 2020 14:14:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIPQ=7C=net-space.pl=dkiper@srs-us1.protection.inumbo.net>)
 id 1jbPU2-0007PP-AE
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:14:10 +0000
X-Inumbo-ID: 2b35deb9-9aa4-11ea-aa29-12813bfff9fa
Received: from dibed.net-space.pl (unknown [84.10.22.86])
 by us1-amaz-eas2.inumbo.com (Halon) with SMTP
 id 2b35deb9-9aa4-11ea-aa29-12813bfff9fa;
 Wed, 20 May 2020 14:14:09 +0000 (UTC)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:38256 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S1953456AbgETNko (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Wed, 20 May 2020 15:40:44 +0200
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity
 as: dkiper
Date: Wed, 20 May 2020 15:40:40 +0200
From: Daniel Kiper <dkiper@net-space.pl>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [GRUB PATCH 0/2] Better Xen support
Message-ID: <20200520134040.kwyugkbmel7y4i6q@tomti.i.net-space.pl>
References: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 01:14:18PM +0100, Ian Jackson wrote:
> Hi. As maintainer of the Xen Project upstream CI, I do testing of
> upstream Xen builds onto Debian systems.
>
> We use grub's 20_linux_xen to do the bootloader setup.  However, it is
> missing some features so we are carrying some patches.  Here they are
> for your consideration.
>
> Regards, Ian.
>
> Ian Jackson (2):
>   20_linux_xen: Ignore xenpolicy and config files too
>   20_linux_xen: Support Xen Security Modules (XSM/FLASK)

Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

Daniel

