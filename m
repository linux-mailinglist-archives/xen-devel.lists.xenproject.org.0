Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D463A2B7077
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 21:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29271.58596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf7ty-0006Zh-Al; Tue, 17 Nov 2020 20:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29271.58596; Tue, 17 Nov 2020 20:48:34 +0000
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
	id 1kf7ty-0006ZI-7I; Tue, 17 Nov 2020 20:48:34 +0000
Received: by outflank-mailman (input) for mailman id 29271;
 Tue, 17 Nov 2020 20:48:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGex=EX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kf7tw-0006ZD-4J
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 20:48:32 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d18184dc-a9ba-4f50-ab49-18e1722e7722;
 Tue, 17 Nov 2020 20:48:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mGex=EX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kf7tw-0006ZD-4J
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 20:48:32 +0000
X-Inumbo-ID: d18184dc-a9ba-4f50-ab49-18e1722e7722
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d18184dc-a9ba-4f50-ab49-18e1722e7722;
	Tue, 17 Nov 2020 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605646110;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=VJ2M/ptrAly8AtOnX78VGBltMv23VCrNepqthOKPu3Q=;
  b=BMuJBGUO8MLm+/w/X80U6Om696WG/j7IxS7tpNAHVQa2BvlJQ/kVk3Dl
   ks3nqAR6CmewJIYN5s3JYIGD1x0p0Dpc0xYmHWlUYoBekyUeXoIVgQkjg
   nxfuh2JpMMxO57jqa1OiWxNqaW42H4uk+WhN7XfnfpDhBhaRQmk12LyID
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OivuvwWRjbdmj6IcnS0Zia2vrKz2p6hlpLjuDOgawEqndHxB7eYdgzB6Huj+OdeeJvH93Be1yr
 nJMXmwW2lc0RBFTc2xraICWOFO4ebDdX1XiToPH7b0XXPtmieRnfEJMWg4m1ZucFXIzLGDVmK+
 Ckof5lUZ5hDiXmxNVjf70cMqAZhFRCFcM1947hZhxfSx7rUYQHQQh8HBOxSM0vzwA90xz/QLbr
 hpAysAcw5g+gxYPBhOwP7tqxGZCAsmMZZIzpdw5f8OaiyjmPIGH/iBtO63uU8NFIMq1biA22GE
 s7w=
X-SBRS: None
X-MesageID: 31720347
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31720347"
Subject: Re: zstd compressed kernels
To: Michael Young <m.a.young@durham.ac.uk>, <xen-devel@lists.xenproject.org>
References: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com>
Date: Tue, 17 Nov 2020 20:48:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 17/11/2020 20:27, Michael Young wrote:
> Is anyone else looking at vmlinuz files which use zstd compression?
> Fedora has started doing so with its 5.9 kernels.

Well volunteered ;)

Yes - I'm aware that it is an area needing working on, but it is not
sufficiently urgent on my TODO stack to look at yet.

There are other compression schemes supported by Linux which aren't
supported by us, either.  I was planning to go through all of them and
check them all.


If you're willing to have a go:

For dom0 support, port Linux's decompressor into xen/common/ and plumb
it into xen/common/decompress.c

For domU's, tools/libs/guest/xg_dom_bzimageloader.c and
xc_dom_probe_bzimage_kernel()

(Wow this plumbing is ugly and in need of some rationalisation...)

~Andrew

