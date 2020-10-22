Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF9295F03
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 14:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10418.27676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVa4O-0007UK-3L; Thu, 22 Oct 2020 12:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10418.27676; Thu, 22 Oct 2020 12:51:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVa4O-0007Tu-0N; Thu, 22 Oct 2020 12:51:52 +0000
Received: by outflank-mailman (input) for mailman id 10418;
 Thu, 22 Oct 2020 12:51:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L1Xo=D5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kVa4L-0007To-UV
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 12:51:50 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a25d93d5-bcef-4030-8aab-354a820dc891;
 Thu, 22 Oct 2020 12:51:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L1Xo=D5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kVa4L-0007To-UV
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 12:51:50 +0000
X-Inumbo-ID: a25d93d5-bcef-4030-8aab-354a820dc891
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a25d93d5-bcef-4030-8aab-354a820dc891;
	Thu, 22 Oct 2020 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603371108;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=0kl3Fme65YD3FrzucuH0C9HkwK3F3k97YMMsqg/NDA8=;
  b=DNGVj/7LYOaEbSKhZ81pMjARXXJ7K3g2GxY0/pBZEqReFBVxJ3miq9UZ
   eLKdypDWuNY/e/mKexHw/dBo5G8RytbzzwSHgSZUQUWF8woSvfsE7R6o/
   1m17JRku1iRSb6pHCLgK+PsQ78s+oKROz9AZacQYPVzgXILAJ2Ic4+ANG
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ayDclvKFRdNuUlZcvTc8wwZoFBH417P0zV7UvJO/5QTHiPLiq5XcF8jM+6u7hKMXDBAqxG9POO
 clqMeZnz9K3SevTcxf9yqypAvC48xd/+JqrnKPBWZW4cVjlbvfPCyW3nINQCT5SSBXYQRbPa7x
 pPuBNqPM6eRX6rY2mnMC+rUrhvzTpcwsCDMlKqGT33c1xo8Pad9Fs4bdooNBeCqjkOezXLBiCb
 EAik/6Yu/vPzmsnenLbBlhzPjQ/b/JcwwT3hAfBl1A/6XOORWwkcYc3uaJyPKKmzUo7FNvEtIw
 tWg=
X-SBRS: None
X-MesageID: 29618024
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,404,1596513600"; 
   d="scan'208";a="29618024"
Subject: Re: XSM and the idle domain
To: Hongyan Xia <hx242@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, <jbeulich@suse.com>, <jandryuk@gmail.com>,
	<dgdegra@tycho.nsa.gov>
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f8f5f354-aa8d-4bd0-9c0e-ef37702e80c5@citrix.com>
Date: Thu, 22 Oct 2020 13:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 21/10/2020 15:34, Hongyan Xia wrote:
> The first question came up during ongoing work in LiveUpdate. After an
> LU, the next Xen needs to restore all domains. To do that, some
> hypercalls need to be issued from the idle domain context and
> apparently XSM does not like it.

There is no such thing as issuing hypercalls from the idle domain
(context or otherwise), because the idle domain does not have enough
associated guest state for anything to make the requisite
SYSCALL/INT80/VMCALL/VMMCALL invocation.

I presume from this comment that what you mean is that you're calling
the plain hypercall functions, context checks and everything, from the
idle context?

If so, this is buggy for more reasons than just XSM objecting to its
calling context, and that XSM is merely the first thing to explode. 
Therefore, I don't think modifications to XSM are applicable to solving
the problem.

(Of course, this is all speculation because there's no concrete
implementation to look at.)

~Andrew

