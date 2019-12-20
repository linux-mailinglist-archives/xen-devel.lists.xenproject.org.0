Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CAE128294
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:06:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiNWi-0000eU-3h; Fri, 20 Dec 2019 19:01:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DXd/=2K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iiNWf-0000eM-NZ
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:01:25 +0000
X-Inumbo-ID: 1dbd368f-235b-11ea-93df-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dbd368f-235b-11ea-93df-12813bfff9fa;
 Fri, 20 Dec 2019 19:01:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so10398337wrn.7
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XYu6RaE5BOyWjF+jD754vZ0uPdlPagUB07aLVg7jBr0=;
 b=KcpZ3zFDse+1mQAv7a7teXrfzr2N5RwpbUKzbIE+MT5/VvukQ6+vW+EZ+t98UZ1kLj
 LfUv70y7uT+9tzZJjBUJg7nnbe1SBPE6HYjlLsnr5uYg9rulGKrFjb5s1Zwpg2MDcq34
 +wK6xNbM00zglw+Zo2JQS0DM/MEQ4EVMI8JZ+Ejh6KfS8nDOM4UT++54JdohhdbNScDn
 jZA/FyDHFzLQXq3WXfrc8YNs+o8hC7/l1l55bWLn+AAmwMnkKn6GarmAaMgxrjE9v6o1
 lAXOOhT+VahYsvvYeI+fQ8AjSURqE/tSZH+8J/LinjOnp8MFrOfGTe4y+yhAIkOrUYi4
 3xfg==
X-Gm-Message-State: APjAAAXBRmaY3CiLcRrcF6giWlU5utIWeuBDvvNaquFSqfF+o7g12qhM
 1qC6rV8nJETapR58w3/2Cfg=
X-Google-Smtp-Source: APXvYqzOGBvrkvjVhjVy21ChZkFMh5aFWv0EGIZ/QZfkOYcu8kPSjfT/RV/xY5PZAwv9rfcu9wlKeA==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr16732797wrr.116.1576868483719; 
 Fri, 20 Dec 2019 11:01:23 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id d14sm11337914wru.9.2019.12.20.11.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 11:01:23 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
References: <20191220173502.15615-1-andrew.cooper3@citrix.com>
 <24061.4572.799452.523703@mariner.uk.xensource.com>
 <ac3f416e-94fb-fd93-a4fb-b9db3cdc25bc@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <34880194-b2d6-b4cc-d516-2187043c0ec9@xen.org>
Date: Fri, 20 Dec 2019 19:01:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <ac3f416e-94fb-fd93-a4fb-b9db3cdc25bc@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain
 types
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8xMi8yMDE5IDE4OjMwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIwLzEy
LzIwMTkgMTg6MjQsIElhbiBKYWNrc29uIHdyb3RlOgo+PiBBbmRyZXcgQ29vcGVyIHdyaXRlcyAo
IltQQVRDSF0gbGlieGMvbWlncmF0aW9uOiBEcm9wIHVuaW1wbGVtbmV0ZWQgZG9tYWluIHR5cGVz
Iik6Cj4+PiB4ODYgUFZIIGlzIGNvbXBsZXRlbHkgb2Jzb2xldGUgLSBpdCB3YXMgaW50ZW5kZWQg
Zm9yIGxlZ2FjeSBQVkggYmVmb3JlIHRoYXQKPj4+IGlkZWEgd2FzIGFiYW5kb25lZC4gIFRoZXJl
IHdhcyBhbiBSRkMgc2VyaWVzIGZvciBBUk0gaW4gMjAxNSwgYnV0IHRoZXJlIGlzCj4+PiBwbGVu
dHkgb2Ygb3V0c3RhbmRpbmcgd29yayB3aGljaCBoYXNuJ3QgYmVlbiBkb25lIHlldC4KPj4+Cj4+
PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4gIE5ldyB0eXBlcyBjYW4gYmUgKHJlKWludHJvZHVjZWQg
d2l0aCB0aGUgY29kZSB3aGljaAo+Pj4gYWN0dWFsbHkgaW1wbGVtZW50cyB0aGVtLgo+PiAuLi4K
Pj4+IC0gICAgICAgICAgICAweDAwMDM6IHg4NiBQVkguCj4+PiAtCj4+PiAtICAgICAgICAgICAg
MHgwMDA0OiBBUk0uCj4+PiAtCj4+PiAtICAgICAgICAgICAgMHgwMDA1IC0gMHhGRkZGRkZGRjog
UmVzZXJ2ZWQuCj4+PiArICAgICAgICAgICAgMHgwMDAzIC0gMHhGRkZGRkZGRjogUmVzZXJ2ZWQu
Cj4+IFRoaXMgaXMgcmVjbGFpbWluZyB0aG9zZSBudW1iZXJzLgo+IAo+IFllcwo+IAo+PiBDb3Vs
ZCB0aGVyZSBiZSBhbnkgc29mdHdhcmUgd2hpY2ggdXNlcyB0aGVtID8KPiAKPiBOb3QgcGxhdXNp
Ymx5LCBubywgZ2l2ZW4uLi4KPiAKPj4gRWcsIG1heWJlIHNvbWVvbmUgcHV0IHRoZSBSRkMgc2Vy
aWVzIGludG8gcHJvZHVjdGlvbiA/Cj4gCj4gLi4uIHRoZSByYXRoZXIgbGFyZ2Ugc2V0IG9mIG91
dHN0YW5kaW5nIFRPRE8gaXRlbXMgaW4gSWFuQydzIFJGQyBzZXJpZXMsCj4gd2hpY2ggaW5jbHVk
ZWQgInRoZSBoeXBlcnZpc29yIGlzIHVuc3RhYmxlIHdoZW4gbG9nZGlydHkgZ2V0cyBlbmFibGVk
IiBJSVJDLgoKU29tZSBwZW9wbGUgYWZ0ZXIgSWFuIHBpY2tlZCB1cCB0aGUgd29yayAoQUZBSUsg
TGluYXJvIHdlcmUgdGhlIGxhc3QgCm9uZXMpLCBidXQgeWVzIHRoZSBjb2RlIHdhcyBzdGlsbCBh
biBSRkMgZXZlbiBhZnRlciB0aGF0LgoKU28gSSB3b3VsZCBub3Qgd29ycnkgdG9vIG11Y2ggb24g
cG90ZW50aWFsIHVzZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
