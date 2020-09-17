Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA3F26DCBF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 15:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kItuD-0006sR-On; Thu, 17 Sep 2020 13:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJEn=C2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kItuC-0006sK-Rz
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 13:24:56 +0000
X-Inumbo-ID: af29012b-e750-4cfa-baf1-0cddf69d2cba
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af29012b-e750-4cfa-baf1-0cddf69d2cba;
 Thu, 17 Sep 2020 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600349095;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FJlOoBR3XekNIEUfnRGzKCFaeJhSzTAtjGnO41L7dL8=;
 b=aE/fHyhIBW6RKNWvB+fyuorFOxNBLAdE53QLv1Z2LcW1nLkT882ymT8e
 yYESGfeuTrISkjDk6Oc98XEyYJwTHRCdZ/e5XJY2omF6xMBp9cvLk7RX8
 Hwol5qPUnPeMfUYeJZuUUh4Rk9e4+uG7nwoQdUQnhMVTEx3+sfGELzTHJ 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: MoHQUov0SqMssesG9q5Gl3B12dDn/yqW2FbflB0qSTtSJlSZ7Fr2ANZyEeMp7x7VHZcKuFM3wY
 JFk/sxWDVF5H5u7Rkm7AqUbRJccTtPhlFAPNg6l7EWm2wlyCTer0akLeak33k6HNrq/l1JAPe2
 3GvnRNTAsqcMaHBlR8HTAG6Um+qtthH10IVNbMcx5TKossAaP95dXLoYPObcRpzeVSOUTUfsYE
 FN38QL0STPwOnMw7BwFiKNwWxvnXjB2LwhkjJJD9apASW2SNP2HSc5ACok8ou/zbjv7QCnthaO
 JwM=
X-SBRS: 2.7
X-MesageID: 27913971
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,437,1592884800"; d="scan'208";a="27913971"
Subject: Re: [PATCH 1/5] sched/arinc653: Clean up comments
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 <xen-devel@lists.xenproject.org>
CC: <xen-devel@dornerworks.com>, Josh Whitehead
 <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-2-jeff.kubascik@dornerworks.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d91dfe61-5d7c-fe14-1015-71ed7177da7d@citrix.com>
Date: Thu, 17 Sep 2020 14:24:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916181854.75563-2-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 16/09/2020 19:18, Jeff Kubascik wrote:
> -/**
> - * Retrieve the idle UNIT for a given physical CPU
> +/*
> + * Retrieve the idle UNIT for a given pCPU
>   */

/** is also acceptable.  We've inherited quite a few doxygen-like
comments, and there is currently a plan to move some things formally to
kernel-doc as part of the automotive safety certification work, which
also uses /**.

~Andrew

