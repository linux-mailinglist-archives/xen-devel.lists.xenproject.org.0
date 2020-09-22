Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2E2744C1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:53:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjfY-00017g-4N; Tue, 22 Sep 2020 14:53:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKjfW-00017O-2G
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:53:22 +0000
X-Inumbo-ID: d47f1757-8e9f-4611-85bf-8f9058bdbe3e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d47f1757-8e9f-4611-85bf-8f9058bdbe3e;
 Tue, 22 Sep 2020 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600786400;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uJ9XKl8LgusD4KsOqMZToomCeIq5dpAbBMI8z4myazY=;
 b=BzAIMNoyyktW+4IS2+fri/DIRzycICkcLXBzlAY+6vdj0wu2ZSlL9kjl
 +fG3bdTVchI+Td8qdfWUd+oROU/7bUOFlqGYRhL9BgIuTAX0HIoRddprA
 +Z/bfRmjOZrU7TdJhWzSmBL+C0feCP+O8PvciX90bK2eOQ4QUHtp25vUA 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZT8B4C1+GUt52s63co0uDwluD42Mr7QMa1ogfn8oyEmM60ptRI0uyYLSiI+t4zq8nLtFPeyzUq
 +kt9xUWxxDoBsLqeFxCdq5gxwxNnzkmmSjsvXfWllVTPzZqPm0pKP/UtV4pyUc8+xIvnbr1bJ2
 tm5MfjiZdXG4OYgpLcWk1ULUmXqR2ubJSmugwrBkHQ4ejKrRoFiLXbm7g1nyh6d8DuKYs6AYdi
 +qrrqMjHcllXFm6OXYCh62BRObMyd4ehzgtHTptw9mYW25CPPsZysgYX1FVCGWZrmylHhazbRm
 fqk=
X-SBRS: 2.7
X-MesageID: 27370901
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27370901"
Subject: Re: [PATCH 0/2] XSA-337 followup cleanup
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <20200922143245.44595-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <da381bb1-7bfc-c3e0-2583-70b2f7ad7f96@citrix.com>
Date: Tue, 22 Sep 2020 15:53:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922143245.44595-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On 22/09/2020 15:32, Roger Pau Monne wrote:
> Hello,
>
> Followup patches from XSA-337 to cleanup unused code.
>
> Thanks, Roger.
>
> Roger Pau Monne (2):
>   x86/hpet: remove hpet_msi_read
>   x86/iommu: remove code to fetch MSI message from remap table

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

