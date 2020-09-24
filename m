Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781B277051
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:51:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLPmP-0005jT-CV; Thu, 24 Sep 2020 11:51:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UqNy=DB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLPmN-0005jO-KN
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:51:15 +0000
X-Inumbo-ID: 6ed20372-0de2-4f3e-8945-5d5ce1451c69
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ed20372-0de2-4f3e-8945-5d5ce1451c69;
 Thu, 24 Sep 2020 11:51:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600948273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rTeiipXt/2Is64zitzL1Ik06kbCWEBljeVyDyTD9M18=;
 b=n1nYXFQ0TUEO0P+mdGIMg0I3dIvnUAURVLxogNOibYqZVe9aAGnCNwas9la1dLtvEtn5S+
 W6QvbPnrQfSEGXlm51lm/WouRJswi41MjwodR3q1It2jG6Het5nDm5/kkdrgRvNdRtGzfJ
 UuiDJaHNNJ8Hmn3978PzRWJiiBnR67o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19FB1B233;
 Thu, 24 Sep 2020 11:51:13 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Dropping Solaris support V2
Message-ID: <f9cc3975-8883-7286-7e8a-db9ddfa735b6@suse.com>
Date: Thu, 24 Sep 2020 13:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Time to ask once again: do we want to drop Solaris support?

Reason for asking: since commit 38eeb3864de40 Xenstore isn't supported
on Solaris any longer, as Solaris has no support for mapping memory via
libxengnttab.

There has been no activity at all on the related Open-Solaris branch
since Xen 3.4 (apart from a question to add Xen 4.2 or 4.3 support 7
years ago).

Thoughts?


Juergen

