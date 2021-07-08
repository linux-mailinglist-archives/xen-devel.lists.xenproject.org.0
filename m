Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63C3C192C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 20:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153273.283168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Yk9-0004EJ-C7; Thu, 08 Jul 2021 18:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153273.283168; Thu, 08 Jul 2021 18:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Yk9-0004Be-9A; Thu, 08 Jul 2021 18:27:25 +0000
Received: by outflank-mailman (input) for mailman id 153273;
 Thu, 08 Jul 2021 18:27:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GyU7=MA=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1m1Yk7-0004Av-TM
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 18:27:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ecc3bee-4222-436a-b8be-333e7cfc4143;
 Thu, 08 Jul 2021 18:27:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F252761624;
 Thu,  8 Jul 2021 18:27:21 +0000 (UTC)
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
X-Inumbo-ID: 1ecc3bee-4222-436a-b8be-333e7cfc4143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1625768842;
	bh=HLLd3yEwXW77mwQmJLlWxcwIg2HQCrgxTc0Cq671Rdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISvWTBqXNhkL5ubz3r4XbJLMQ+yC3qpd5DsGTvRh/ckjkwP0BF1LziVzEvFqLO9VI
	 cMEn5oBLMPQ4aAo1HMgXzqxVGKc2zI8tYNqHmTeWc2RC3Gw4uWvXqVcisP1BHGSVnp
	 bx+E3PYQBVz2dii2IdbAyeweqhVgbodTI68CZ2yY=
Date: Thu, 8 Jul 2021 20:27:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Backport of commit 3de218ff39b9e3f0d4
Message-ID: <YOdDh1I8bGqY7ded@kroah.com>
References: <194665ee-3a94-3c1a-23ca-f71c007c74a5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <194665ee-3a94-3c1a-23ca-f71c007c74a5@suse.com>

On Mon, Jul 05, 2021 at 01:58:09PM +0200, Juergen Gross wrote:
> Hi Greg,
> 
> the attached patch is a backport of upstream commit 3de218ff39b9e3f0d4
> for Linux 5.10 and older (I've checked it to apply down to 4.4).

Now applied, thanks.

greg k-h

