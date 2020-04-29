Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E81BE525
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqSK-00011f-Ou; Wed, 29 Apr 2020 17:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4OoD=6N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jTqSI-00011a-Ek
 for xen-devel@lists.xen.org; Wed, 29 Apr 2020 17:25:06 +0000
X-Inumbo-ID: 5d2b9262-8a3e-11ea-997e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d2b9262-8a3e-11ea-997e-12813bfff9fa;
 Wed, 29 Apr 2020 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588181105;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=Jxx3E0+xY6ycqkAc3LMwC7yiu3O28kLwU+Q8+HQtZXo=;
 b=O5RkZ3g88WOTwXrml/hmoXMcXYDC6IItEsM9qvjDyBj8Zj7ysAuIXrre
 52eBGjq3/W3z/WTFqozBDPMnmu9IR3tompxiaPPavjMgMXED3HpGnHGJI
 uGlyt26C4uBpsk2Rhcry+lLnTBrXYTjpcSPobqddLh3AnCo0FMQ4Jfkha Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ym6dmozcLmazND390vLhLMc2uWUqGlmXUySLhGrNPtYWfqTIbhRvqGHSbvf0jZtsrvAZTCgMSZ
 iU57ociEth7v9uwIJLgqy7rVvLDDJOvNGUn2FRWwUr4WqvdsC4cFDc4hY7AFwF7ZB9X+d27Zqk
 Mrph36Kv97DnQz++2lZJ4HrF9n5aih1PUgZ45MiHJALI+JZQFKLhTu3T3EjBnpwiVJ7BT8KJK0
 9zYwNJhZcljL1GshCZ3a4aKn6/Kw9XsDnMiCaE4K9A9Bkk45UGoamP8bk5nPdFUMkbI1VC0+Zf
 QgI=
X-SBRS: 2.7
X-MesageID: 16712695
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16712695"
Subject: Re: Xen Compilation Error on Ubuntu 20.04
To: Ayush Dosaj <ayushdosaj2313@gmail.com>, <xen-devel@lists.xen.org>
References: <CAOCxVi0s5X+=Hug2_M-AyXvYpiwqfkf7G2Y66kp44MQ-xgO+KA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e92bb8ab-3dd2-bb19-d524-d78279f9508a@citrix.com>
Date: Wed, 29 Apr 2020 18:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOCxVi0s5X+=Hug2_M-AyXvYpiwqfkf7G2Y66kp44MQ-xgO+KA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 29/04/2020 18:17, Ayush Dosaj wrote:
> Hi Xen development team,
> 
> I am Ayush. I compiled Xen Hypervisor from source on Ubuntu 20.04
> machine running on an intel-i9 CPU.
> I am getting compilation error due to the following two flags.
> Error: error: ‘-mindirect-branch’ and ‘-fcf-protection’ are not compatible.
> 
> Complete Error logs can be found at https://paste.ubuntu.com/p/xvvyPnhW5c/
> 
> And when I compiled Xen commenting the two flags in Rules.mk file, it
> compiles and installs properly but on boot-up i see a blank black screen
> and i am stuck there.

That is a GCC bug (these options are actually fine in combination).  It
got fixed earlier today in master, and backported for GCC 9.4

You can work around it by appending -fcf-protection=none to CFLAGS

I wouldn't try editing the logic around -mindirect-branch, as that is
related to retpoline safety for Spectre v2, and probably relies on the
build matching the code.

~Andrew

