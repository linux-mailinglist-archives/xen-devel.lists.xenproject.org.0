Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763028E5EA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 20:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6972.18239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSl8v-0007Pz-NG; Wed, 14 Oct 2020 18:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6972.18239; Wed, 14 Oct 2020 18:04:53 +0000
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
	id 1kSl8v-0007Pa-KB; Wed, 14 Oct 2020 18:04:53 +0000
Received: by outflank-mailman (input) for mailman id 6972;
 Wed, 14 Oct 2020 18:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSl8u-0007PV-5j
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 18:04:52 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69f65ee3-45a0-4c28-8e51-5ae7fb18b630;
 Wed, 14 Oct 2020 18:04:51 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSl8u-0007PV-5j
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 18:04:52 +0000
X-Inumbo-ID: 69f65ee3-45a0-4c28-8e51-5ae7fb18b630
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 69f65ee3-45a0-4c28-8e51-5ae7fb18b630;
	Wed, 14 Oct 2020 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602698692;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QP9dZ/kf6WxmC+XFLjXj3iwd2bvWj8WJ3e4EPYelksU=;
  b=cbX8m2MVku/e5Qrxnq+oLOzUIsZFGod8c8cMGPzcqOQHRkpWR3/MycbY
   tSThLTTgL1UiSoPcA8epbj8K8U1RJynPo8KfDkdGUOYzp4zIRgA9lAXzK
   j8ZtX6/R9SkHMinRm7Y8A5KLHHQ7RfGDT19M8ohV40d2grCHEts8ESKP9
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RkRU6LoFb+K0uroA17V3eGSGvjuUUGMUujSWCqKRxmtq2qsv7vOw8BkkHt9zfs7MM0a9cL4/Ft
 2dUiIVTILpDeiiulU9gHbgx2gjg8+21xfs5GSiPybMgsipLEe8gUsLsaJNrwhMSLLMQsemLMrK
 wdiahS+UH2PIC8/GMR79mm8Bs/hMc8XQYiz5aXGXmdH8ykSz0VWu7I/DAiuKR6KfhXRT9DtM9v
 zbRh/CILhefBnCwff+hwhCnTEGRqgmAYgX+34s8k22jyocg6vnUZJwOQKaxQIPzmtyJ671KRly
 GoE=
X-SBRS: 2.5
X-MesageID: 28991967
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="28991967"
Subject: Re: [SUSPECTED SPAM][PATCH 0/2] Remove Xen PVH dependency on PCI
To: Jason Andryuk <jandryuk@gmail.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
CC: "H. Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>
References: <20201014175342.152712-1-jandryuk@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4973553f-fad2-83b9-fa19-26370ced2c2d@citrix.com>
Date: Wed, 14 Oct 2020 19:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014175342.152712-1-jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 18:53, Jason Andryuk wrote:
> A Xen PVH domain doesn't have a PCI bus or devices,

[*] Yet.

> so it doesn't need PCI support built in.

Untangling the dependences is a good thing, but eventually we plan to
put an optional PCI bus back in, e.g. for SRIOV usecases.

~Andrew

