Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D62484F5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 14:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k80x0-00027d-JO; Tue, 18 Aug 2020 12:42:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eNH=B4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k80wz-00027W-39
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 12:42:49 +0000
X-Inumbo-ID: 258fc74d-7d4c-4669-8ae8-fc333fdfedcb
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 258fc74d-7d4c-4669-8ae8-fc333fdfedcb;
 Tue, 18 Aug 2020 12:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597754568;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=MtYHzTv5IxVIutVfJ4Odk0I/2x8IQzN1V2/gkdJ1BkE=;
 b=f0ZbqSl/lB1gqjlK+Pb3/OWAfIDapl6uL70tEYl9MsTaf6VMdcEZxS8H
 DrMZuNbA6l70ITXAJtevoC47GzxRel3yWuYNsLT5Ugqems+NnHasAorog
 miJrvQVcAw/G1JNdN5qdbrMtqiChpO5pPXQfk2nDe2NxOMcRGWGY+mFdd U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: W4ROQLnZfrIHrDtUmU6UFIa6ILXpfb5b7eNQd3RmdYskAjC2aLwOuMo+d+GFslOkGGxiMvLw5n
 BhKzFQzR+qGMyusz2vqbIkPNzWJuqYRbwuXdLJYsFcVq7tTlMsJImAt7WwKHGhjrpWwrasBdqN
 XsEww1NtvirQAOUzn6K+JxOP+jcL1RmctKc/0xLhuGlN9/OYUJuY3yfl7g0sdnD8dv83Tm/mYv
 9f6532O9iVguJSeNCEEgny4qaSl5R803RAhAe/48uSp87SaI0ueAd/MiJO1REjMpjGHtEnwijX
 /3I=
X-SBRS: 2.7
X-MesageID: 24777843
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="24777843"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24379.52418.438897.155721@mariner.uk.xensource.com>
Date: Tue, 18 Aug 2020 13:42:42 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
 <George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 01/14] kernel-doc: public/arch-arm.h
In-Reply-To: <20200806234933.16448-1-sstabellini@kernel.org>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <20200806234933.16448-1-sstabellini@kernel.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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

Stefano Stabellini writes ("[PATCH 01/14] kernel-doc: public/arch-arm.h"):
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Convert in-code comments to kernel-doc format wherever possible.

Thanks.  But, err, I think there is not yet any in-tree machinery for
actually building and publishing these kernel-doc comments ?

As I said I think replacing our ad-hoc in-tree system with kernel-doc
is a good idea, but...

> -/*
> - * `incontents 50 arm_abi Hypercall Calling Convention
> +/**
> + * DOC: Hypercall Calling Convention

... let us not replace the in-tree markup for that system until we
have its replacement.

Ian.

