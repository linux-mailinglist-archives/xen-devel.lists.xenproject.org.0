Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AAFD92D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 10:31:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVXtq-0004E4-He; Fri, 15 Nov 2019 09:28:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVXtp-0004Dw-4J
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 09:28:17 +0000
X-Inumbo-ID: 4042f5b4-078a-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4042f5b4-078a-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 09:28:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30973B0BF;
 Fri, 15 Nov 2019 09:28:14 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <3f17589409b24992a3aac0f357b1cd56@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32bd3ef3-8045-5fda-4a53-70adc20ad37e@suse.com>
Date: Fri, 15 Nov 2019 10:28:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3f17589409b24992a3aac0f357b1cd56@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxODoyOSwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuCj4+IEJldWxpY2gKPj4gU2VudDog
MTQgTm92ZW1iZXIgMjAxOSAxNjo0Mgo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBTYW5kZXIgRWlrZWxl
bmJvb20KPj4gPGxpbnV4QGVpa2VsZW5ib29tLml0PjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDAvMl0g
QU1EL0lPTU1VOiByZS13b3JrIG1vZGUgdXBkYXRpbmcKPj4KPj4gdXBkYXRlX3BhZ2luZ19tb2Rl
KCkgaW4gdGhlIEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUgaW52b2tlZCB3aXRoCj4+IHRo
ZSBQQ0kgZGV2aWNlcyBsb2NrIGhlbGQuIFRoZSBjaGVjayBvY2N1cnJpbmcgb25seSB3aGVuIHRo
ZSBtb2RlCj4+IGFjdHVhbGx5IG5lZWRzIHVwZGF0aW5nLCB0aGUgdmlvbGF0aW9uIG9mIHRoaXMg
cnVsZSBieSB0aGUgbWFqb3JpdHkKPj4gb2YgY2FsbGVycyBkaWQgZ28gdW5ub3RpY2VkIHVudGls
IHBlci1kb21haW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKPj4gdG8gZG8gYXdheSB3aXRoIG9u
LWRlbWFuZCBjcmVhdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcy4KPiAKPiBXb3VsZG4ndCBpdCBi
ZSBzYWZlciB0byBqdXN0IGdldCByaWQgb2YgdXBkYXRlX3BhZ2luZ19tb2RlKCkgYW5kIHN0YXJ0
Cj4gd2l0aCBhIHJlYXNvbmFibGUgbnVtYmVyIG9mIGxldmVscz8KCkFuZHJldyBkaWQgYmFzaWNh
bGx5IGFzayB0aGUgc2FtZSwgYnV0IEkgY29udGludWUgdG8gYmUgdW5jb252aW5jZWQ6CldlIGNh
bid0IHBpY2sgYSAicmVhc29uYWJsZSIgbGV2ZWwsIHdlIGhhdmUgdG8gcGljayB0aGUgbWF4aW11
bSBhCmd1ZXN0IG1heSBlbmQgdXAgdXNpbmcuIFlldCB3aHkgd291bGQgd2Ugd2FudCB0byBoYXZl
IGFsbCBndWVzdHMgcGF5CnRoZSBwcmljZSBvZiBhdCBsZWFzdCBvbmUgdW5uZWNlc3NhcnkgcGFn
ZSB3YWxrIGxldmVsPyBJIGRvbid0IG1lYW4KdG8gc2F5IEknbSBlbnRpcmVseSBvcHBvc2VkLCBi
dXQgdHJhZGluZyBjb2RlIHNpbXBsaWNpdHkgZm9yCnBlcmZvcm1hbmNlIGlzIGFsbW9zdCBuZXZl
ciBhbiBlYXN5IG9yIG9idmlvdXMgZGVjaXNpb24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
