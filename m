Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E169BDB92
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD41f-0006xy-Tm; Wed, 25 Sep 2019 09:55:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mY+w=XU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iD41e-0006xt-Ab
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:55:58 +0000
X-Inumbo-ID: ab6afe1e-df7a-11e9-962f-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by localhost (Halon) with ESMTPS
 id ab6afe1e-df7a-11e9-962f-12813bfff9fa;
 Wed, 25 Sep 2019 09:55:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so5947509wrw.9
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 02:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aZqp2TQM4c2/jbahQWKPLUKPJpg2mZI1pcRtyBZzlqs=;
 b=ldw0wKbH/s2Pb/7E77s5wH1h4gL9e0EVNVeM1yPTn/svdQUr9z2OGqWc17M2GoD9fW
 RQkxXvjYIyyOgs4bTEEnfTNPD47Sezick2WLVjOjmzOkwVKq1sbngh0qHTs4QgmLYHm6
 /ztvGQEGl+5kOPDzklkgbWYczENZvUF+L8DnBo09hwu00jYrvT1HixypXazpVSqF+yzt
 3nTsrXcGzgA+sNbZ8vRdbw18//dL/Ad0DYefL0Pjd02YPN5+n5MQ9EJ0VhhaR08MMXKU
 bjZPv3abfVHreniQhCzRqES7dfK/4Vmg73CZtAMNpSsv1uwdrm7G3gn4kfMeyjv7iK46
 xzXg==
X-Gm-Message-State: APjAAAWy30yrE3GgOjD9x5iLPBOgw+m6JeAatUHJd8pNIkxkMfHNRCrZ
 x4AOJagNEIzWmSmvjRf2FgE=
X-Google-Smtp-Source: APXvYqxuaM3wzfejhdD6443h/yOyy8kd4a/rpEZSo4o+hXlsV6c4Xb3RbJfAUEBCmQ+eSvpWTcwtkg==
X-Received: by 2002:adf:f5cc:: with SMTP id k12mr8116430wrp.278.1569405356306; 
 Wed, 25 Sep 2019 02:55:56 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id r28sm7293038wrr.94.2019.09.25.02.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 02:55:55 -0700 (PDT)
Date: Wed, 25 Sep 2019 10:55:54 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190925095554.a6v4gfdoxtcdm6lr@debian>
References: <c88502e8-3342-3bae-a670-2780c56b54c6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c88502e8-3342-3bae-a670-2780c56b54c6@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] ACPI/cpuidle: bump maximum number of power
 states we support
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTE6MTI6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ29tbWl0IDRjNmNkNjQ1MTkgKCJtd2FpdF9pZGxlOiBTa3lsYWtlIENsaWVudCBTdXBw
b3J0IikgYWRkZWQgYSB0YWJsZQo+IHdpdGggOCBlbnRyaWVzLCB3aGljaCAtIHRvZ2V0aGVyIHdp
dGggQzAgLSByZW5kZXJlZCB0aGUgY3VycmVudCBsaW1pdAo+IHRvbyBsb3cuIEl0IHNob3VsZCBo
YXZlIGJlZW4gYWNjb21wYW5pZWQgYnkgYW4gaW5jcmVhc2Ugb2YgdGhlIGNvbnN0YW50Owo+IGRv
IHRoaXMgbm93LiBEb24ndCBidW1wIGJ5IHRvbyBtdWNoIHRob3VnaCwgYXMgdGhlcmUgYXJlIGEg
bnVtYmVyIG9mIG9uLQo+IHN0YWNrIGFycmF5cyB3aGljaCBhcmUgZGltZW5zaW9uZWQgYnkgdGhp
cyBjb25zdGFudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
