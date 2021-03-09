Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5813323AF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 12:11:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95351.179998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaGi-0006Xe-O1; Tue, 09 Mar 2021 11:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95351.179998; Tue, 09 Mar 2021 11:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaGi-0006XF-KP; Tue, 09 Mar 2021 11:11:16 +0000
Received: by outflank-mailman (input) for mailman id 95351;
 Tue, 09 Mar 2021 11:11:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vget=IH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lJaGg-0006XA-Fe
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 11:11:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03ccdb0f-88ae-4940-b7aa-b15d09ca0022;
 Tue, 09 Mar 2021 11:11:13 +0000 (UTC)
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
X-Inumbo-ID: 03ccdb0f-88ae-4940-b7aa-b15d09ca0022
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615288273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nuLgex0bJypwLNAxe/D3orQ34UA6EXiqXrSwoWSjkug=;
  b=cGSX+6kCqGtXlp3Eh71pCofAknSHG98I8+4iDCiGiu3JFzM0O5Y2z7ym
   bIJcAjLGfNFgFJIvIYXRVZncki+u0u16mP5986FNP/xdYd1COylHDS75m
   GC0uvQ1dUGwL6CDE2abg7zj4/inA5x4lP5GZmvIseCf9Gpu7qqjEPjIZS
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: w8D7hOM+UpfoH4b+bPIL6/4y5zvGJ5UKx7IZ1KQcXfvliApeTmSBm/o3Dd8ENhprPY3CH+k2T1
 78v8sXnBg8DScDR4aplnT/NaBmqYoPxmWqwsRRktzLxsjX2MADM/XErDjJZujCQndej0noxD7a
 E5e5QW8BpPzEdIg3HLS554FFH0+bqP6M3t8EseNQ5yXfkzmrq0CIqXdKVfIiUj+2SfKJFKMAw6
 vCFxtY85UhQ2BhQMRwIxvmu8vYexCePi+NwEUoN5d/FXuzVvF9W7F1wH6yPccYZBLegzDX6lbo
 6i0=
X-SBRS: 4.0
X-MesageID: 38840490
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38840490"
Date: Tue, 9 Mar 2021 11:11:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	<famzheng@amazon.com>, <cardoe@cardoe.com>, <wl@xen.org>,
	<Bertrand.Marquis@arm.com>, <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@eu.citrix.com>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
Message-ID: <YEdXzH0t26WFLb7Q@perard.uk.xensource.com>
References: <161507188317.11025.6744028462008264481@c667a6b167f6>
 <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
 <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
 <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org>
 <YEdOz4B4rtXbjKOS@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YEdOz4B4rtXbjKOS@Air-de-Roger>

On Tue, Mar 09, 2021 at 11:32:47AM +0100, Roger Pau Monné wrote:
> Does CentOS has something like Debian backports to get updated major
> versions of packages?

Something similar, it's done via SIG. We have SIG virt in which we
build Xen packages among others. And there's a SIG which building newer
version of GCC, we already use it to build the Linux kernel with a newer
version of GCC.

So we should be able to setup the Xen packages to build with a newer
version of GCC, at least in CentOS 7. (I still have to look again at
CentOS 8 or Stream.)

> Also, I think we do maintain Xen on CentOS using a separate
> repository, so newer versions of Xen will be added to CentOS. Adding
> George and Anthony since they know about that.
> 
> Thanks, Roger.

-- 
Anthony PERARD

