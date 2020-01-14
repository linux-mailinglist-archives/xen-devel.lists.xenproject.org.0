Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939013AB29
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 14:33:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irMG2-0002h3-10; Tue, 14 Jan 2020 13:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irMG0-0002gy-HC
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 13:29:20 +0000
X-Inumbo-ID: d9a88b80-36d1-11ea-a985-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9a88b80-36d1-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 13:29:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d16so12161768wre.10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 05:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fTm6KSm1wgQQSieGwd7fpiQI97YLx5QoQeW71HBcJpc=;
 b=GFE5T60qLEeHNEyyyqU+3ZZ9eLFzRlbsELcCJDu/b8sfQc9AArt0AvC5/IvQxumOSy
 e1E6/Er00gAkMD2i+yaTRCSs1hTffWGUkUedZrkA8Yb4rLb+x1HYf39Mn0lnWjQCnMHh
 AU1fCXSo/2xneprRSRnLkXR/7CrzNH0Airql4WDkW0xe7t39gak+T4KeeOaruOkWY5of
 nbgHENzS2JuBIbncxxT3gpt0m5TEaU+blQ1N/uta8fDkU9UPAoox9yRCNbYPyapcsoAO
 cGxTNkwXvY9jiHHE6Bb/XzopqVu9RDNS5Fz58HLT904t9YgPdpJNMfJBYAdQh711/rW/
 W3Sg==
X-Gm-Message-State: APjAAAXFZZmYwgL+jcNITiB1jjbtDEDqo60cPmoBe+DzWqIQu6d8jpe5
 bxrKlR6XKn8cK1kHyKq+mRw=
X-Google-Smtp-Source: APXvYqxNc3WCkltN18omxZeNmDW2NJvoJpPqBypBVhl78mKMKWIyg0HhKHw/549tcpAbRAirMaqvAg==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr24149370wrj.325.1579008551280; 
 Tue, 14 Jan 2020 05:29:11 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id 25sm18194845wmi.32.2020.01.14.05.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 05:29:10 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200113221227.20857-1-julien@xen.org>
 <b73c17351c23402196b8998f8438f397@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <64ae4ff2-a647-88ef-59f4-243a53f009fc@xen.org>
Date: Tue, 14 Jan 2020 13:29:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b73c17351c23402196b8998f8438f397@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] docs/misc: livepatch: Espace backslash
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDE0LzAxLzIwMjAgMDk6NTMsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJv
dW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZgo+PiBKdWxpZW4gR3JhbGwK
Pj4gU2VudDogMTMgSmFudWFyeSAyMDIwIDIzOjEyCj4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKPj4gQ2M6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXgu
Y29tPjsgV2llY3pvcmtpZXdpY3osIFBhd2VsCj4+IDx3aXBhd2VsQGFtYXpvbi5kZT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrCj4gV2lsawo+PiA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIXSBkb2Nz
L21pc2M6IGxpdmVwYXRjaDogRXNwYWNlIGJhY2tzbGFzaAo+Pgo+IAo+IHMvRXNwYWNlL0VzY2Fw
ZSwgSSBhc3N1bWUKCkhtbSwgeWVzLiBUaGFuayB5b3UgZm9yIHNwb3R0aW5nIGl0IQoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
