Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270F1688E8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5FRj-0004Ck-HD; Fri, 21 Feb 2020 21:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j5FRh-0004Cf-NE
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 21:02:49 +0000
X-Inumbo-ID: 833fa6b8-54ed-11ea-8700-12813bfff9fa
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 833fa6b8-54ed-11ea-8700-12813bfff9fa;
 Fri, 21 Feb 2020 21:02:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r21so4051489edq.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 13:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7JeGgFo2jiaMHdX3xPQ3Ejx0W0L0/3ph+i8wlCs29Lw=;
 b=ak5w4do7rzrYqV2d1guQOCNsy15XZmDFGwW+KHDMPIqqC0M2RMqUkAn6nIWKP4dqWe
 saTp1iSOk1tcPrvBAo86j7qcUVdFEFwOxF0vhG5u3fbibqd/FD1UW7dh1qTBqyKUWiUT
 eShmd23wHqgJKEtSAlbbSARKYgqDu42kM+sKBHKcJfAe0+Yvl2Y2hYVkNddNTHY6yWk3
 dKHAzCj/Z47doCXNx3W6hUjAo5d4P3n1MnkFBurH0TGKsiKbwYY640z3qwLoS8467uLw
 W+dSdmeBf4LjbYvBNwKvfL0tkGVPvc5kyn22htkBFw3Q87DMyxkgh7zyx54/72D/cCRY
 D60Q==
X-Gm-Message-State: APjAAAVPEByytjV3b6DGx6r68WV7PKGU7rLq+x6ULn9e0hgwT8LSO9Yw
 GNvr+5WTuPVg1EL/Q3JAkwY=
X-Google-Smtp-Source: APXvYqzlFQPfqcXvrpbGZ3XaZ8+Xa6N6B385/J7yxYPtP0FifQCm68bd3DDWE/OYrrrKOW3sfIHdLg==
X-Received: by 2002:a05:6402:1761:: with SMTP id
 da1mr37275913edb.41.1582318967033; 
 Fri, 21 Feb 2020 13:02:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id q3sm333140eju.88.2020.02.21.13.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 13:02:45 -0800 (PST)
To: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4b27cc09-8578-8fa1-2a7e-858d1767353a@xen.org>
Date: Fri, 21 Feb 2020 21:02:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v9 2/5] xen: add parent_domid field to
 createdomain domctl
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAyMS8wMi8yMDIwIDE4OjQ5LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
V2hlbiBjcmVhdGluZyBhIGRvbWFpbiB0aGF0IHdpbGwgYmUgdXNlZCBhcyBhIFZNIGZvcmsgc29t
ZSBpbmZvcm1hdGlvbiBpcwo+IHJlcXVpcmVkIHRvIHNldCB0aGluZ3MgdXAgcHJvcGVybHksIGxp
a2UgdGhlIG1heF92Y3B1cyBjb3VudC4gSW5zdGVhZCBvZiB0aGUKPiB0b29sc3RhY2sgaGF2aW5n
IHRvIGdhdGhlciB0aGlzIGluZm9ybWF0aW9uIGZvciBlYWNoIGZvcmsgaW4gYSBzZXBhcmF0ZQo+
IGh5cGVyY2FsbCB3ZSBjYW4ganVzdCBpbmNsdWRlIHRoZSBwYXJlbnQgZG9tYWluJ3MgaWQgaW4g
dGhlIGNyZWF0ZWRvbWFpbiBkb21jdGwKPiBzbyB0aGF0IFhlbiBjYW4gY29weSB0aGUgc2V0dGlu
ZyB3aXRob3V0IHRoZSBleHRyYSB0b29sc3RhY2sgcXVlcmllcy4KCkl0IGlzIG5vdCBlbnRpcmVs
eSBjbGVhciB3aHkgeW91IG9ubHkgd2FudCB0byBjb3B5IG1heF92Y3B1cy4gRnJvbSBteSAKdW5k
ZXJzdGFuZGluZywgIHdoZW4geW91IGFyZSBnb2luZyB0byBmb3JrIGEgZG9tYWluIHlvdSB3aWxs
IHdhbnQgdGhlIApkb21haW4gdG8gYmUgbmVhcmx5IGlkZW50aWNhbC4gU28gaG93IGRvIHlvdSBk
ZWNpZGUgd2hhdCB0byBjb3B5PwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgo+IC0tLQo+ICAgeGVuL2NvbW1vbi9kb21jdGwuYyAg
ICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwu
aCB8ICAzICsrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9u
L2RvbWN0bC5jCj4gaW5kZXggYTY5YjNiNTlhOC4uMjJhY2ViMzg2MCAxMDA2NDQKPiAtLS0gYS94
ZW4vY29tbW9uL2RvbWN0bC5jCj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwo+IEBAIC00ODks
NiArNDg5LDcgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9t
Y3RsX3QpIHVfZG9tY3RsKQo+ICAgICAgIGNhc2UgWEVOX0RPTUNUTF9jcmVhdGVkb21haW46Cj4g
ICAgICAgewo+ICAgICAgICAgICBkb21pZF90ICAgICAgICBkb207Cj4gKyAgICAgICAgZG9taWRf
dCAgICAgICAgcGFyZW50X2RvbTsKPiAgICAgICAgICAgc3RhdGljIGRvbWlkX3Qgcm92ZXIgPSAw
Owo+ICAgCj4gICAgICAgICAgIGRvbSA9IG9wLT5kb21haW47Cj4gQEAgLTUxNSw2ICs1MTYsMTkg
QEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVf
ZG9tY3RsKQo+ICAgICAgICAgICAgICAgcm92ZXIgPSBkb207Cj4gICAgICAgICAgIH0KPiAgIAo+
ICsgICAgICAgIHBhcmVudF9kb20gPSBvcC0+dS5jcmVhdGVkb21haW4ucGFyZW50X2RvbWlkOwo+
ICsgICAgICAgIGlmICggcGFyZW50X2RvbSApCgpJIHdvdWxkIHJhdGhlciBhdm9pZCB0byBhc3N1
bWUgdGhhdCBwYXJlbnRfZG9tIHdpbGwgbm90IGJlIDAgZm9yIGEgZmV3IApyZWFzb25zOgogICAg
MSkgTW9zdCBvZiBYZW4gKGlmIG5vdCBhbGwpIG5vdyBhdm9pZCB0byBhc3N1bWUgdGhhdCBkb20w
LT5kb21haW5faWQgCj09IDAuCiAgICAyKSBJIGNhbiBzZWUgdXNlY2FzZXMgd2hlcmUgaXQgd2Ug
bWF5IHdhbnQgdG8gcmVjcmVhdGUgZG9tMCBzZXR1cC4KClNvIHdlIHNob3VsZCBjb25zaWRlciBh
IGRpZmZlcmVudCB2YWx1ZSB0byBpbmRpY2F0ZSB3aGV0aGVyIHdlIHdhbnQgdG8gCmNsb25lIGZy
b20gYSBkb21haW4uIE1heWJlIGJ5IHNldHRpbmcgYml0IDE2IG9mIHRoZSBwYXJlbnRfZG9taWQ/
Cgo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqcGQgPSByY3VfbG9j
a19kb21haW5fYnlfaWQocGFyZW50X2RvbSk7Cj4gKwo+ICsgICAgICAgICAgICByZXQgPSAtRUlO
VkFMOwo+ICsgICAgICAgICAgICBpZiAoICFwZCApCj4gKyAgICAgICAgICAgICAgICBicmVhazsK
PiArCj4gKyAgICAgICAgICAgIG9wLT51LmNyZWF0ZWRvbWFpbi5tYXhfdmNwdXMgPSBwZC0+bWF4
X3ZjcHVzOwo+ICsgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihwZCk7Cj4gKyAgICAgICAg
fQo+ICsKPiAgICAgICAgICAgZCA9IGRvbWFpbl9jcmVhdGUoZG9tLCAmb3AtPnUuY3JlYXRlZG9t
YWluLCBmYWxzZSk7Cj4gICAgICAgICAgIGlmICggSVNfRVJSKGQpICkKPiAgICAgICAgICAgewo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9w
dWJsaWMvZG9tY3RsLmgKPiBpbmRleCBmZWM2ZjZmZGQxLi4yNTFjYzQwZWY2IDEwMDY0NAo+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9kb21jdGwuaAo+IEBAIC0zOCw3ICszOCw3IEBACj4gICAjaW5jbHVkZSAiaHZtL3NhdmUuaCIK
PiAgICNpbmNsdWRlICJtZW1vcnkuaCIKPiAgIAo+IC0jZGVmaW5lIFhFTl9ET01DVExfSU5URVJG
QUNFX1ZFUlNJT04gMHgwMDAwMDAxMgo+ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZF
UlNJT04gMHgwMDAwMDAxMwo+ICAgCj4gICAvKgo+ICAgICogTkIuIHhlbl9kb21jdGwuZG9tYWlu
IGlzIGFuIElOL09VVCBwYXJhbWV0ZXIgZm9yIHRoaXMgb3BlcmF0aW9uLgo+IEBAIC05Miw2ICs5
Miw3IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB7Cj4gICAgICAgdWludDMyX3Qg
bWF4X2V2dGNobl9wb3J0Owo+ICAgICAgIGludDMyX3QgbWF4X2dyYW50X2ZyYW1lczsKPiAgICAg
ICBpbnQzMl90IG1heF9tYXB0cmFja19mcmFtZXM7Cj4gKyAgICBkb21pZF90IHBhcmVudF9kb21p
ZDsKCkJ5IGp1c3QgbG9va2luZyBhdCB0aGUgbmFtZSwgaXQgaXMgbm90IGNsZWFyIHdoYXQgdGhl
IGZpZWxkIGlzIGZvci4gSXQgCmFsc28gc3VnZ2VzdCB0aGF0IG9uZSBkb21haW4gd2lsbCBiZSBs
aW5rZWQgdG8gdGhlIG90aGVyLiBCdXQgdGhpcyBpcyAKbm90IHRoZSBjYXNlIGhlcmUuIEkgd291
bGQgcmVjb21tZW5kIHRvIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyBob3cgCnRoaXMgaXMgdXNl
ZCBieSBYZW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
