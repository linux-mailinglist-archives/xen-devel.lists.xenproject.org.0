Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758D2257FD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 08:48:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxPZM-0005rp-2a; Mon, 20 Jul 2020 06:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxPZK-0005rk-JW
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 06:46:34 +0000
X-Inumbo-ID: bfc5b85c-ca54-11ea-98e4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfc5b85c-ca54-11ea-98e4-12813bfff9fa;
 Mon, 20 Jul 2020 06:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595227593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NtlnAFJyO621aeblpWvmd5JeyG0HHI28kn0Wz3kJP5Y=;
 b=ZRnLz8k2nqEzUjyZvZeG+3893Tn897AjiW9rgf5rSrsB25o13NhOr0nj
 dZNUBaAFsarWChcMo9s7KzzwhCBQuxlPPVtg5nEDH2SQaFhpUj+5JpC9I
 C/GP02jh2a1jJu0fGaKEjRM9GGK8Y9Bi9Sgb64s3M+rrrNGn4XfQ8QGaN Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VFr09NkDrYS42i9obUHyjr82PKMu92rZUtpouukdHRu+cQmC3VxLMeQ1thqx9s2Y9kRE4+NXy3
 aEadU6+6RJcMaPRVUgp5o12jfXPbGOPt0lKeF04QyIr7PDYzvfqH2o/NQtcuQ8BV89e2zCvDz5
 Zn+aspZMSj7WYKaCCUmT0mgDRIKmytRFi5FSTF6M1e7SQ5TS4CLR2pTbTu6AzjmG4JxFAmuqtx
 IKZQ6kjvFbKqMPvXgftGe7IizuBMgy6vJ+rIa4COpn6nt/62zhDJyIpOr9RMGs7CSf8vq9m0gw
 7io=
X-SBRS: 2.7
X-MesageID: 22920836
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22920836"
Date: Mon, 20 Jul 2020 08:45:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 152004: tolerable trouble: fail/pass/starved
Message-ID: <20200720064517.GB7191@Air-de-Roger>
References: <osstest-152004-mainreport@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <osstest-152004-mainreport@xen.org>
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jul 19, 2020 at 02:05:59PM +0000, osstest service owner wrote:
> flight 152004 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/152004/
[...]
>  test-amd64-amd64-dom0pvh-xl-amd                              pass    
>  test-amd64-amd64-dom0pvh-xl-intel                            pass    

First pass of the PVH dom0 tests after the XSA fixes :).

Roger.

