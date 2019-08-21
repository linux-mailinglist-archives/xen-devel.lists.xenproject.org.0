Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1E97FD6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 18:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0THV-0000dD-UO; Wed, 21 Aug 2019 16:16:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EZkk=WR=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i0THV-0000d8-1C
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 16:16:17 +0000
X-Inumbo-ID: ff6942f8-c42e-11e9-951b-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff6942f8-c42e-11e9-951b-bc764e2007e4;
 Wed, 21 Aug 2019 16:16:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1053DA3EA7;
 Wed, 21 Aug 2019 16:16:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-79.ams2.redhat.com
 [10.36.117.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3BE05C1D6;
 Wed, 21 Aug 2019 16:16:12 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190813113119.14804-1-anthony.perard@citrix.com>
 <741727b8-7f89-9e81-bc99-c28206810c5f@redhat.com>
Message-ID: <21ded0d6-71c5-65b6-abe0-069bed272742@redhat.com>
Date: Wed, 21 Aug 2019 18:16:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <741727b8-7f89-9e81-bc99-c28206810c5f@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 21 Aug 2019 16:16:14 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v5 00/35] Specific platform to
 run OVMF in Xen PVH and HVM guests
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
Reply-To: devel@edk2.groups.io, lersek@redhat.com
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTUvMTkgMTM6MDMsIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwOC8xMy8xOSAxMzoz
MCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhp
cyBnaXQgYnJhbmNoOgo+PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUv
YXBlcmFyZC9vdm1mLmdpdCBici5wbGF0Zm9ybS14ZW4tcHZoLXY1Cj4+Cj4+IENoYW5nZXMgaW4g
djU6Cj4+IC0gcGF0Y2ggMjMgZ290IGEgcmV3b3JrIG9mIHRoZSBsYXBpYyByYW5nZSBza2lwcGlu
Zwo+PiAtIHNtYWxsIGZpeHVwcyBpbiBwYXRjaCAyMCwgMjIsIDIzLCAzMSwgMzIsIDMzLgo+PiAg
IHNlZSBub3RlcyBmb3IgZGV0YWlsLgo+IAo+IFRoaXMgc2VyaWVzIGlzIG5vdyBmdWxseSBjb3Zl
cmVkIHdpdGggbWFpbnRhaW5lciBSLWIncyBhbmQgQS1iJ3MuCj4gCj4gSSd2ZSBhbHNvIGRvbmUg
c29tZSByZWdyZXNzaW9uLXRlc3RzLCBhZnRlciBhcHBseWluZyB0aGUgc2V0IGluIGEgdG9waWMK
PiBicmFuY2ggb24gdG9wIG9mIGNvbW1pdCBjYWE3ZDNhODk2ZjYgKCJCYXNlVG9vbHMvU2NyaXB0
czogQWRkCj4gR2V0VXRjRGF0ZVRpbWUgc2NyaXB0LiIsIDIwMTktMDgtMTUpLiBJbmNsdWRpbmcg
YnVpbGQgdGVzdHMgYW5kIG15IHVzdWFsCj4gYm9vdCAmIFMzIHRlc3RzLgo+IAo+IEJ1aWxkaW5n
IGZvciBERUJVRyAod2l0aCBHQ0M0OCkgcmVxdWlyZXMgdGhlIGluZGVwZW5kZW50IGZpeAo+IAo+
ICAgW2VkazItZGV2ZWxdIFtQQVRDSCAxLzFdCj4gICBNZGVNb2R1bGVQa2cvRHhlSXBsUGVpbTog
SW5pdGlhbGl6ZSBwb2ludGVyIFBhZ2VNYXBMZXZlbDVFbnRyeQo+IAo+IHdoaWNoIHdhcyBwb3N0
ZWQgYXQKPiAKPiAgIGh0dHA6Ly9taWQubWFpbC1hcmNoaXZlLmNvbS8yMDE5MDgxNDA3Mzc0MS4x
NjA4MC0xLXNoZW5nbGVpLnpoYW5nQGludGVsLmNvbQo+ICAgaHR0cHM6Ly9lZGsyLmdyb3Vwcy5p
by9nL2RldmVsL21lc3NhZ2UvNDU1OTEKPiAKPiAoYWdhaW4sIHRoYXQgaXNzdWUgaXMgaW5kZXBl
bmRlbnQgb2YgdGhpcyBzZXJpZXMpLiBXaXRoIHRoYXQgaW5kZXBlbmRlbnQKPiBmaXgsIFJFTEVB
U0UgYnVpbGRzIGZpbmUgdG9vLgo+IAo+IEdpdmVuIHRoYXQgdGhpcyB2NSBmZWF0dXJlIHNlcmll
cyBoYXMgbm93IGJlZW4gZnVsbHkgcmV2aWV3ZWQgYmVmb3JlCj4gZW50ZXJpbmcgdGhlIFNvZnQg
RmVhdHVyZSBGcmVlemUgZm9yIGVkazItc3RhYmxlMjAxOTA4IC0tIHdoaWNoIHdpbGwKPiBjb21t
ZW5jZSBvbiAyMDE5LTA4LTE2IGF0IDAwOjAwOjAwIFVUQy04KSAtLSwgdGhlIHNldCBpcyBlbGln
aWJsZSBmb3IKPiBwdXNoaW5nIGR1cmluZyB0aGUgU29mdCBGZWF0dXJlIEZyZWV6ZToKPiAKPiAg
IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvdGlhbm9jb3JlLmdpdGh1Yi5pby93aWtpL0VE
Sy1JSS1SZWxlYXNlLVBsYW5uaW5nCj4gICBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL3Rp
YW5vY29yZS5naXRodWIuaW8vd2lraS9Tb2Z0RmVhdHVyZUZyZWV6ZQo+IAo+IFRoZXJlZm9yZSBJ
J2xsIHB1c2ggdjUgbm8gbGF0ZXIgdGhhbiAyMDE5LUF1Zy0yMSwgdW5sZXNzIGEgTkFDSyBhcnJp
dmVzCj4gYmVmb3JlIHRoYXQgZGF0ZSwgZnJvbSB4ZW4tZGV2ZWwgb3IgZWxzZXdoZXJlLgoKUHVz
aGVkIGFzIGNvbW1pdCByYW5nZSAzMDc4MWZlYmUyMTAuLjEyMzc1MTdiMjEzMC4KClRoYW5rcyEK
TGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
