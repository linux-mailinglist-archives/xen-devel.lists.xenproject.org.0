Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E41156412
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 12:56:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0OfE-0003lb-5s; Sat, 08 Feb 2020 11:52:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UONU=34=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j0OfC-0003lW-RQ
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2020 11:52:42 +0000
X-Inumbo-ID: 82be329c-4a69-11ea-b2e5-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82be329c-4a69-11ea-b2e5-12813bfff9fa;
 Sat, 08 Feb 2020 11:52:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so5124453wmb.0
 for <xen-devel@lists.xenproject.org>; Sat, 08 Feb 2020 03:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wTdiel/9e+Tbh2XYgMeBzuVx81mJuf8hawjdPd5QFC4=;
 b=NiIRnosMHpH1mb/CPYOif+TK4KAbsJXPPrjULdPwlG6Zc59Stu1u4iJDEe0YEOjR5z
 zu2tuBrm/Ilg+jptLikmeogHddkXfaE5PgZA9ZPUFhFckH1thvqJcYql74VRTzfkhXMw
 QTi7HoRI3WtYDbze+Jifq0+u1YAP2Rx1wf5rJAqGFidzyzhuASR1dkSV//xELqPCqu4l
 ZiDjm6vrZN9rPotsp/ICwAd0mhZEXaYfOWJe2e2Bfb+0eHcrF3BjAwIlgIst9k9vOa4r
 EYjw6P/TA2T8sxOi6SMwHMpiIq79ocorMYFKm8e6FNFK9zcFyPgPoyT0RRNVwlqdj2r4
 uFFQ==
X-Gm-Message-State: APjAAAW9Hj/X2nRTd55vg0FHOX7h0mqzRFovMZyHek9qxgI0ws9ONPXn
 Q3pLJCTAhcj0Njdj/MSVzO4=
X-Google-Smtp-Source: APXvYqxJUS2nZiNNTFKWj1BzHnwzvHa7OiH752sicYpvtiYTUdrmD4brZaQUWNVLUDlwx3TkRrm9gg==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
 x5mr4298439wmj.72.1581162761046; 
 Sat, 08 Feb 2020 03:52:41 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id x6sm7131143wmi.44.2020.02.08.03.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2020 03:52:40 -0800 (PST)
To: Wei Liu <wl@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <20200206164810.30168-1-pdurrant@amazon.com>
 <20200206165256.5jmpfpfcsfs2q4k7@debian>
From: Julien Grall <julien@xen.org>
Message-ID: <9e11d2fa-cafd-ef79-aa85-c41180f525e7@xen.org>
Date: Sat, 8 Feb 2020 11:52:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206165256.5jmpfpfcsfs2q4k7@debian>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: cc community manager on
 patches to CHANGELOG.md
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNi8wMi8yMDIwIDE2OjUyLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFRodSwgRmViIDA2
LCAyMDIwIGF0IDA0OjQ4OjEwUE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gVGhlIHB1
cnBvc2Ugb2YgdGhlIGNoYW5nZS1sb2cgaXMgdG8gYmUgYSBodW1hbi1yZWFkYWJsZSBsaXN0IG9m
IG5vdGFibGUKPj4gY2hhbmdlcyBhbmQsIGFzIHN1Y2gsIGFkZGl0aW9ucyB0byBpdCBhcmUgbGlr
ZWx5IG9mIGludGVyZXN0IHRvIHRoZQo+PiBjb21tdW5pdHkgbWFuYWdlciBpbiBwcmVwYXJpbmcg
YmxvZyBlbnRyaWVzLCByZWxlYXNlIHN1bW1hcmllcywgZXRjLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gCj4gQWNrZWQtYnk6IFdlaSBM
aXUgPHdsQHhlbi5vcmc+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4K
CkkgdGhpbmsgd2UgbWF5IG5lZWQgYW4gYWNrIGZyb20gd2hvZXZlciByZWNlaXZlIGNvbW11bml0
eS5tYW5hZ2VyQC4gCkdlb3JnZSwgSWFuPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
