Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527A11E4C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:38:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifl68-0007Fi-1s; Fri, 13 Dec 2019 13:35:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifl66-0007Fd-De
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:35:10 +0000
X-Inumbo-ID: 5cdc635c-1dad-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cdc635c-1dad-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 13:35:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2B6BB1E5;
 Fri, 13 Dec 2019 13:35:00 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <d48d495dc3ab4ba1869221be36fac343@EX13D32EUC003.ant.amazon.com>
 <7f6254b6-a19a-5bf8-0ba7-e0b2479c868b@suse.com>
 <ccddbcf10d734cdbaf494a55ad4f6d06@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de79ffb5-9be8-18e7-86d2-119902c911b1@suse.com>
Date: Fri, 13 Dec 2019 14:35:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ccddbcf10d734cdbaf494a55ad4f6d06@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNDoyOSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTZW50OiAxMyBEZWNlbWJlciAyMDE5IDEzOjI2
Cj4+Cj4+IE9uIDEzLjEyLjIwMTkgMTQ6MTIsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4gRnJv
bTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24g
QmVoYWxmIE9mIEphbgo+Pj4+IEJldWxpY2gKPj4+PiBTZW50OiAxMyBEZWNlbWJlciAyMDE5IDEy
OjUzCj4+Pj4KPj4+PiArI2RlZmluZSBJT01NVV9xdWFyYW50aW5lX25vbmUgIDAKPj4+PiArI2Rl
ZmluZSBJT01NVV9xdWFyYW50aW5lX2Jhc2ljIDEKPj4+PiArI2RlZmluZSBJT01NVV9xdWFyYW50
aW5lX2Z1bGwgIDIKPj4+PiArdWludDhfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3F1YXJhbnRpbmUg
PSBJT01NVV9xdWFyYW50aW5lX2Jhc2ljOwo+Pj4KPj4+IElmIHdlIGhhdmUgJ0lPTU1VX3F1YXJh
bnRpbmVfc2luaycgaW5zdGVhZCBvZiAnSU9NTVVfcXVhcmFudGluZV9mdWxsJywKPj4+IHRoZW4g
aG93IGFib3V0ICdJT01NVV9xdWFyYW50aW5lX3dyaXRlX2ZhdWx0JyBpbnN0ZWFkIG9mCj4+PiAn
SU9NTVVfcXVhcmFudGluZV9iYXNpYyc/Cj4+Cj4+IFdoeSAid3JpdGVfZmF1bHQiPyBFdmVuIGlu
ICJmdWxsIiBtb2RlIHlvdSBvbmx5IGF2b2lkIHJlYWQgZmF1bHRzCj4+IGFpdWkgKHNlZSBhbHNv
IGFib3ZlKS4gU28gaWYgYW55dGhpbmcgIndyaXRlX2ZhdWx0IiB3b3VsZCBiZSBhCj4+IHJlcGxh
Y2VtZW50IGZvciAiZnVsbCI7ICJiYXNpYyIgY291bGQgYmUgcmVwbGFjZWQgYnkganVzdCAiZmF1
bHQiCj4+IHRoZW4uCj4gCj4gU29ycnksIHllcywgSSBoYWQgdGhpbmdzIHRoZSB3cm9uZyB3YXkg
cm91bmQuICJmYXVsdCIgYW5kICJ3cml0ZV9mYXVsdCIgc291bmQgZ29vZC4KCkJ1dCB0aGUgcmVz
dWx0aW5nIGNvbW1hbmQgbGluZSBvcHRpb24gKGlvbW11PXF1YXJhbnRpbmU9d3JpdGUtZmF1bHQp
CndvdWxkIHRoZW4gYmUgcXVpdGUgYSBiaXQgbGVzcyBuaWNlIGltbywgY29tcGFyZSB0byB0aGUg
YnJpZWYgImZ1bGwiLgooSSdtIHRlbXB0ZWQgdG8gc3VnZ2VzdCAibnJmIiBmb3IgIm5vIHJlYWQg
ZmF1bHQiLCBidXQgSSBndWVzcyB0aGF0J3MKdG9vIHVnbHkgYW4gYWNyb255bS4pCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
