Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36A39BC88
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 18:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136938.253739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpCKR-0005B5-V6; Fri, 04 Jun 2021 16:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136938.253739; Fri, 04 Jun 2021 16:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpCKR-00058K-Rx; Fri, 04 Jun 2021 16:05:47 +0000
Received: by outflank-mailman (input) for mailman id 136938;
 Fri, 04 Jun 2021 16:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wstn=K6=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lpCKQ-00058E-Ne
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 16:05:46 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8085d1aa-5e0b-4978-a89d-93ed77fd757e;
 Fri, 04 Jun 2021 16:05:46 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-MHKNc94CNJKZJd34kIge5A-1; Fri, 04 Jun 2021 12:05:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F88100855C;
 Fri,  4 Jun 2021 16:05:37 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-217.ams2.redhat.com
 [10.36.112.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B1060C05;
 Fri,  4 Jun 2021 16:05:36 +0000 (UTC)
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
X-Inumbo-ID: 8085d1aa-5e0b-4978-a89d-93ed77fd757e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622822745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSvNMjrJSg2okctEAuNFak697PYcIBvfWIUhzGMZvR8=;
	b=hWPSDeodjWMbbrQYFsscrx3kXhLzKnackdHuDwbJh3H+Qa0U8Lj4+WcZ7FvJXhPnRxYyoB
	+hDItFBbxpyEhkSbZIkbjsuT4AZJ4p/Z9V6b/dJNwEUMTX2lRqLY7cM5uDja/4we0m3ZTT
	fXQHpTzbgiYect75HY6ww+G/ngyV5MI=
X-MC-Unique: MHKNc94CNJKZJd34kIge5A-1
Subject: Re: [edk2-devel] [PATCH 00/43] OvmfPkg: remove Xen support from
 OvmfPkg*.dsc, in favor of OvmfXen.dsc
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel
 <ardb+tianocore@kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210526201446.12554-1-lersek@redhat.com>
 <71da2a3b-aab1-4ecf-7e01-16b537d841a2@redhat.com> <YLoyiqSYxPDJ7VRl@perard>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <88389926-5982-d867-164e-b12ddbd2383d@redhat.com>
Date: Fri, 4 Jun 2021 18:05:34 +0200
MIME-Version: 1.0
In-Reply-To: <YLoyiqSYxPDJ7VRl@perard>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/21 16:02, Anthony PERARD via groups.io wrote:
> On Wed, Jun 02, 2021 at 10:36:49AM +0200, Laszlo Ersek wrote:
>> Anthony, Julien,
>>
>> (or anyone else subscribed to xen-devel -- CC'd now),
>>
>> On 05/26/21 22:14, Laszlo Ersek wrote:
>>> Bugzilla: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
>>> Repo:     https://pagure.io/lersek/edk2.git
>>> Branch:   xen_split_bz_2122
>>
>> can you please build the OvmfXen platform on this branch, and check if
>> there are any regressions?
> 
> Hi Laszlo,
> 
> OvmfXen seems to be working fine with that branch applied.

Series merged as commit range 924c2b847f0b..51adb689e1db, via
<https://github.com/tianocore/edk2/pull/1689>.

Thanks
Laszlo


