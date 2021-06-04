Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C139BAD3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136905.253689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAfs-0001IT-Oj; Fri, 04 Jun 2021 14:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136905.253689; Fri, 04 Jun 2021 14:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAfs-0001GK-Ll; Fri, 04 Jun 2021 14:19:48 +0000
Received: by outflank-mailman (input) for mailman id 136905;
 Fri, 04 Jun 2021 14:19:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wstn=K6=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lpAfq-0001GE-PS
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:19:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3758f57f-3505-486b-8a2d-fb9472de7be1;
 Fri, 04 Jun 2021 14:19:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-d0KNyPWbMnecfR-kXC7CQw-1; Fri, 04 Jun 2021 10:19:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF541034AF2;
 Fri,  4 Jun 2021 14:19:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-217.ams2.redhat.com
 [10.36.112.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C1C10074EF;
 Fri,  4 Jun 2021 14:19:39 +0000 (UTC)
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
X-Inumbo-ID: 3758f57f-3505-486b-8a2d-fb9472de7be1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622816385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7RaHb1L61pcCk/PK45uDzhk5w+i1nJDMw2mwl+TSD80=;
	b=hUs3uBNASaC9cKW8/2chsuBjb3ZjW26IwI2M/jws9k6VGnYV53iF9XAUBRBmJSLzJK56qR
	O7vSbYS+qoliqu/nHnZgGwtrP9QlGDKlL4/CPvGIXM7lJmSY0Qhl8/Y/hERDdGLa5sLPA0
	1ylPa73Egr/reNUT4NDyHAH4ufuHHhk=
X-MC-Unique: d0KNyPWbMnecfR-kXC7CQw-1
Subject: Re: [edk2-devel] [PATCH 00/43] OvmfPkg: remove Xen support from
 OvmfPkg*.dsc, in favor of OvmfXen.dsc
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel
 <ardb+tianocore@kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210526201446.12554-1-lersek@redhat.com>
 <71da2a3b-aab1-4ecf-7e01-16b537d841a2@redhat.com> <YLoyiqSYxPDJ7VRl@perard>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <49414f37-0e20-a45d-cf24-f186c69fb1bc@redhat.com>
Date: Fri, 4 Jun 2021 16:19:37 +0200
MIME-Version: 1.0
In-Reply-To: <YLoyiqSYxPDJ7VRl@perard>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/21 16:02, Anthony PERARD wrote:
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

Thank you very much!!!
Laszlo


