Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8749114D2F0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 23:18:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwvcf-0000m5-E1; Wed, 29 Jan 2020 22:15:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCRk=3S=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iwvce-0000lz-AU
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 22:15:44 +0000
X-Inumbo-ID: e3fb3244-42e4-11ea-a933-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3fb3244-42e4-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 22:15:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so1364540wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 14:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oqimezw/wnfDrwCNSvZYuZiFLy2j6zj598h6NyzeFhc=;
 b=QI28VoCCT5BhrAPit1QbH8LuKpYK8xymXw+S/bS/5qYZPmK755Gd4QfXk0ioRuYHYW
 fPcvc+Qi4ejLMFBZOgB4IqyhppXSU59Sb6lJl2MUQLZiyAPV+peehzoKu04Z8ItoZ19f
 0ewpgIfyzcLI577exwB1RJXr9uVXluKKbMC7daJHwnE+0kCKD519bgSz69/qe7Art4Hw
 rrwdRNqyDrWzCnAmo5wEWZTDfawzFs1GVpJalL/uua9KQWEy5b2mO6IGb+RdgcjIbrfi
 msnnx6DzZYuq4OYN4V8WVF2b3UEXK5YzXrAYYLQ/XpFwuN4GdW/PQa2jp5WVgoYVXL2m
 NEeQ==
X-Gm-Message-State: APjAAAW90zCbmPah4eUxrNIJIOL51CMJHYeTVCWvTpqQ1eud3pZvsU/G
 bnHJFqxTGeZfkEAxCX831R8=
X-Google-Smtp-Source: APXvYqwGe79r5JXCfW04B6BC4zb/ZY1SPo7VaAx73cPhhsHPonaXQLFO9NZ6hFSHa6sQUSCaU4tcaw==
X-Received: by 2002:adf:978a:: with SMTP id s10mr1021625wrb.69.1580336142987; 
 Wed, 29 Jan 2020 14:15:42 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id y8sm3696275wma.10.2020.01.29.14.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 14:15:42 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20191108190952.22163-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <6c453c03-c115-1f08-3d2d-986e8101d22c@xen.org>
Date: Wed, 29 Jan 2020 22:15:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191108190952.22163-1-sstabellini@kernel.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: lars.kurth@citrix.com, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGhhdmUgbm90aWNlZCBXZWkgYmVnYW4gdG8gdXNlIHRoZSB0YWcgdG9kYXkuIEl0IHJl
bWluZGVkIG1lIHRoYXQgSSAKbmV2ZXIgZm9sbG93ZWQtdXAgb24gdGhlIHBhdGNoLCBzb3JyeSBm
b3IgdGhhdC4KCk9uIDA4LzExLzIwMTkgMTk6MDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4
aWxpbnguY29tPgo+IENDOiBqYmV1bGljaEBzdXNlLmNvbQo+IENDOiBnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20KPiBDQzoganVsaWVuQHhlbi5vcmcKPiBDQzogbGFycy5rdXJ0aEBjaXRyaXguY29t
Cj4gQ0M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KPiBDQzogaWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbQo+IENDOiBrb25yYWQud2lsa0BvcmFjbGUuY29tCj4gQ0M6IHdsQHhlbi5vcmcKPiAt
LS0KPiAgIGRvY3MvcHJvY2Vzcy9iYWNrcG9ydC10YWcucGFuZG9jIHwgMjMgKysrKysrKysrKysr
KysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZG9jcy9wcm9jZXNzL2JhY2twb3J0LXRhZy5wYW5kb2MKPiAKPiBkaWZm
IC0tZ2l0IGEvZG9jcy9wcm9jZXNzL2JhY2twb3J0LXRhZy5wYW5kb2MgYi9kb2NzL3Byb2Nlc3Mv
YmFja3BvcnQtdGFnLnBhbmRvYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uZTU3MGVmZGNjOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kb2NzL3Byb2Nlc3MvYmFj
a3BvcnQtdGFnLnBhbmRvYwo+IEBAIC0wLDAgKzEsMjMgQEAKPiArQmFja3BvcnQgVGFnCj4gKy0t
LS0tLS0tLS0tLQo+ICsKPiArQSBiYWNrcG9ydCB0YWcgaXMgYW4gb3B0aW9uYWwgdGFnIGluIHRo
ZSBjb21taXQgbWVzc2FnZSB0byByZXF1ZXN0IGEKPiArZ2l2ZW4gY29tbWl0IHRvIGJlIGJhY2tw
b3J0ZWQgdG8gdGhlIHN0YWJsZSB0cmVlczoKPiArCj4gKyAgICBCYWNrcG9ydDogYWxsCj4gKwo+
ICtJdCBtYXJrcyBhIGNvbW1pdCBmb3IgYmVpbmcgYSBjYW5kaWRhdGUgZm9yIGJhY2twb3J0cyB0
byBhbGwgcmVsZXZhbnQKPiArdHJlZXMuCj4gKwo+ICsgICAgQmFja3BvcnQ6IDQuOSsKPiArCj4g
K0l0IG1hcmtzIGEgY29tbWl0IGZvciBiZWluZyBhIGNhbmRpZGF0ZSBmb3IgYmFja3BvcnRzIHRv
IGFsbCBzdGFibGUKPiArdHJlZXMgZnJvbSA0Ljkgb253YXJkLgo+ICsKPiArTWFpbnRhaW5lcnMg
cmVxdWVzdCB0aGUgQmFja3BvcnQgdGFnIHRvIGJlIGFkZGVkIG9uIGNvbW1pdC4KPiArQ29udHJp
YnV0b3JzIGFyZSBhbHNvIHdlbGNvbWUgdG8gbWFyayB0aGVpciBwYXRjaGVzIHdpdGggdGhlIEJh
Y2twb3J0Cj4gK3RhZyB3aGVuIHRoZXkgZGVlbSBhcHByb3ByaWF0ZS4gTWFpbnRhaW5lcnMgd2ls
bCByZXF1ZXN0IGZvciBpdCB0byBiZQo+ICtyZW1vdmVkIHdoZW4gdGhhdCBpcyBub3QgdGhlIGNh
c2UuCj4gKwo+ICtQbGVhc2Ugbm90ZSB0aGF0IHRoZSBCYWNrcG9ydCB0YWcgaXMgYSAqKnJlcXVl
c3QqKiBmb3IgYmFja3BvcnQsIHdoaWNoCj4gK3dpbGwgc3RpbGwgbmVlZCB0byBiZSBldmFsdWF0
ZWQgYnkgdGhlIHN0YWJsZSB0cmVlIG1haW50YWluZXJzLgoKVGhpcyBwcm9wb3NhbCBsb29rIGdv
b2QgdG8gbWUuIEFyZSB5b3UgcGxhbm5pbmcgdG8gcmVzZW5kIHRoZSBwYXRjaCB3aXRoIApHZW9y
Z2UncyBzdWdnZXN0aW9uPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
