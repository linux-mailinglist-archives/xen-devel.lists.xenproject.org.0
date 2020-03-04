Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022E1791A8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:45:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UIN-0007nK-Le; Wed, 04 Mar 2020 13:42:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9UIM-0007nC-HH
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:42:42 +0000
X-Inumbo-ID: 0510fbfe-5e1e-11ea-a3dd-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0510fbfe-5e1e-11ea-a3dd-12813bfff9fa;
 Wed, 04 Mar 2020 13:42:42 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e25so2366921edq.5
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 05:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ZoJpO9VtVeP33xZijY5wsonrDIX3x4BnbJ7HCinS/Q=;
 b=PZNkB2ol+1963zSADqG+He5tKQk75/xYknzqZF1Ey40I6TeliE8sk9mRB4tyxkGNoa
 ZceDgZUHnE0wpG8/l3UHIUwNVdM678W3Bok69L6v7+2SseuIogtgKupJCNo/ZIg5AB6B
 bCkSBcEaWoTCh246qj7hTwCOt/KkatQkyQi+hKFeEMD7T2qGE8woYLzfDcFhyFGihk0G
 kpXqaf7wCwFsittxvZ1PCBOozgcMM7qnmBeER4aWWmuVHM7ptVX/TLo3krUsVkB/Yt0O
 j9pb1t6ExfaSOGKQhbctOmL2A9JTkmejPwXRlHfqBR20MNpyNqfC2sWTi6VRcfKKgymB
 RJWA==
X-Gm-Message-State: ANhLgQ19b0bmYuNpFDonpYsWJAPFzK0WdJrYjPE8BjJq1IbtUdJgBdDq
 3KrCCM/7Iz1o7jcS2BaVnJE=
X-Google-Smtp-Source: ADFU+vuIP9wam68jxkWGQvv3X8JYImF0WX1VALSXunD3Fs626t/iTB19QB3Pe71rCON6PYdMMsanXg==
X-Received: by 2002:a17:906:b788:: with SMTP id
 dt8mr2632995ejb.206.1583329361149; 
 Wed, 04 Mar 2020 05:42:41 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id f25sm1528021edt.73.2020.03.04.05.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:42:40 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200304063212.20843-1-jgross@suse.com>
 <20200304063212.20843-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <de613cc1-d444-7290-d96b-0d3193fce276@xen.org>
Date: Wed, 4 Mar 2020 13:42:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304063212.20843-6-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/rcu: add assertions to debug
 build
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNC8wMy8yMDIwIDA2OjMyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaCBiL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0
ZS5oCj4gaW5kZXggMzFjOGI4NmQxMy4uOWY2ZDQyMDg5OCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vcmN1cGRhdGUuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oCj4g
QEAgLTM0LDEwICszNCw0MCBAQAo+ICAgI2luY2x1ZGUgPHhlbi9jYWNoZS5oPgo+ICAgI2luY2x1
ZGUgPHhlbi9zcGlubG9jay5oPgo+ICAgI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+Cj4gLSNpbmNs
dWRlIDx4ZW4vcHJlZW1wdC5oPgo+ICsjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgo+ICsjaW5jbHVk
ZSA8YXNtL2F0b21pYy5oPgo+ICAgCj4gICAjZGVmaW5lIF9fcmN1Cj4gICAKPiArI2lmbmRlZiBO
REVCVUcKPiArREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgcmN1X2xvY2tfY250KTsKPiAr
Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9kaXNhYmxlKHZvaWQpCj4gK3sKPiAr
ICAgIHRoaXNfY3B1KHJjdV9sb2NrX2NudCkrKzsKPiArICAgIGFyY2hfbG9ja19hY3F1aXJlX2Jh
cnJpZXIoKTsKCkkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFuZCB0aGUgZ29hbCBvZiB0aGlzIGJh
cnJpZXIuIFdoYXQgYXJlIHlvdSAKdHJ5aW5nIHRvIHByb3RlY3QgYWdhaW5zdD8KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
