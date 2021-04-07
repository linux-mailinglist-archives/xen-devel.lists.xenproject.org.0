Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AA356605
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106465.203594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3Ay-00045z-WB; Wed, 07 Apr 2021 08:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106465.203594; Wed, 07 Apr 2021 08:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3Ay-00045d-RF; Wed, 07 Apr 2021 08:04:36 +0000
Received: by outflank-mailman (input) for mailman id 106465;
 Wed, 07 Apr 2021 08:04:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dICN=JE=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lU3Ax-00045Y-Lu
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:04:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2d0268b1-a610-478d-8e41-a265eff2a063;
 Wed, 07 Apr 2021 08:04:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-KSnMusMUPpGi3c3V_F3oow-1; Wed, 07 Apr 2021 04:04:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6304F87A82A;
 Wed,  7 Apr 2021 08:04:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC4315D9CA;
 Wed,  7 Apr 2021 08:04:28 +0000 (UTC)
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
X-Inumbo-ID: 2d0268b1-a610-478d-8e41-a265eff2a063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617782673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9wKNfs/mx3B02u3rgk/SB38aU2+GaTZNcuqxhCzdps=;
	b=iunuBBc3R6wZShsjrWStJP3+/GBhWIwN9+z1EPUI4c0G0bpoJ8KzAgNPkyyE/g5t2cqTYZ
	to/8Yu8WXk650LvfIK82PxEbv7GqSHwF6dw9CZ92r+MKfJRqk+Wiy70pXZeOG4X25c5XHQ
	geH2GUNh9r84meV7ajcQxa2aUQ4K2Fs=
X-MC-Unique: KSnMusMUPpGi3c3V_F3oow-1
Subject: Re: [edk2-devel] [PATCH v2 4/7] OvmfPkg/IndustryStandard: Introduce
 PageTable.h
To: devel@edk2.groups.io, anthony.perard@citrix.com
Cc: xen-devel@lists.xenproject.org, Jordan Justen
 <jordan.l.justen@intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Julien Grall <julien@xen.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
 <20210325154713.670104-5-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <26db5675-e40d-9076-5fb3-238c975f9279@redhat.com>
Date: Wed, 7 Apr 2021 10:04:27 +0200
MIME-Version: 1.0
In-Reply-To: <20210325154713.670104-5-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/25/21 16:47, Anthony PERARD via groups.io wrote:
> We are going to use the page table structure in yet another place,
> collect the types and macro that can be used from another module
> rather that making yet another copy.

s/rather that/rather than/


