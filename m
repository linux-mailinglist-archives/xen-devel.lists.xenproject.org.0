Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658D8118488
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:12:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecSo-00063H-MH; Tue, 10 Dec 2019 10:09:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecSn-00062w-1s
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:09:53 +0000
X-Inumbo-ID: 347567f8-1b35-11ea-8913-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347567f8-1b35-11ea-8913-12813bfff9fa;
 Tue, 10 Dec 2019 10:09:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 06C83ADF1;
 Tue, 10 Dec 2019 10:09:51 +0000 (UTC)
To: jgross@suse.com
References: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1042aef4-c873-6cf9-c7b4-cca1214d61af@suse.com>
Date: Tue, 10 Dec 2019 11:10:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAwMDo1NiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSWYgdGhlIGZlYXR1
cmUgaXMgbm90IHByZXNlbnQgWGVuIHdpbGwgdHJ5IHRvIGZvcmNlIFg4Nl9CVUdfRlBVX1BUUlMK
PiBmZWF0dXJlIGF0IENQVSBpZGVudGlmaWNhdGlvbiB0aW1lLiBUaGlzIGlzIGVzcGVjaWFsbHkg
bm90aWNlYWJsZSBpbgo+IFBWLXNoaW0gdGhhdCB1c3VhbGx5IGhvdHBsdWdzIGl0cyB2Q1BVcy4g
V2UgZWl0aGVyIG5lZWQgdG8gcmVzdHJpY3QgdGhpcwo+IGFjdGlvbiBmb3IgYm9vdCBDUFUgb25s
eSBvciBhbGxvdyBzZWNvbmRhcnkgQ1BVcyB0byBtb2RpZnkKPiBmb3JjZWQgQ1BVIGNhcGFiaWxp
dGllcyBhdCBydW50aW1lLiBDaG9vc2UgdGhlIGZvcm1lciBzaW5jZSBtb2RpZnlpbmcKPiBmb3Jj
ZWQgY2FwYWJpbGl0aWVzIG91dCBvZiBib290IHBhdGggbGVhdmVzIHRoZSBzeXN0ZW0gaW4gcG90
ZW50aWFsbHkKPiBpbmNvbnNpc3RlbnQgc3RhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpJJ3ZlIGNvbW1pdHRlZCB0aGlz
IHRvIHVuc3RhYmxlLCBhcyBwZXIgdGhlIG91dGNvbWUgb2YgdGhlCmNvbW11bml0eSBjYWxsLiBX
aGF0IGFib3V0IHRoaXMgZm9yIDQuMTM/IElpcmMgdGhlIGJyZWFrYWdlIHdhcwppbnRyb2R1Y2Vk
IGR1cmluZyB0aGlzIGRldmVsb3BtZW50IGN5Y2xlLgoKSmFuCgo+IC0tLQo+IENoYW5nZXMgaW4g
djI6Cj4gLSBwaWNrIHRoZSBmb3JtZXIgYXBwcm9hY2ggaW5zdGVhZCBvZiB0aGUgbGF0dGVyCj4g
LS0tCj4gIHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvY3B1L2FtZC5jIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+IGluZGV4IGZlYzI4MzAuLjhi
NWYwZjIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9jcHUvYW1kLmMKPiBAQCAtNTgzLDcgKzU4Myw3IEBAIHN0YXRpYyB2b2lkIGluaXRf
YW1kKHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKPiAgCSAqIE9sZGVyIEFNRCBDUFVzIGRvbid0IHNh
dmUvbG9hZCBGT1AvRklQL0ZEUCB1bmxlc3MgYW4gRlBVIGV4Y2VwdGlvbgo+ICAJICogaXMgcGVu
ZGluZy4gIFhlbiB3b3JrcyBhcm91bmQgdGhpcyBhdCAoRilYUlNUT1IgdGltZS4KPiAgCSAqLwo+
IC0JaWYgKCFjcHVfaGFzKGMsIFg4Nl9GRUFUVVJFX1JTVFJfRlBfRVJSX1BUUlMpKQo+ICsJaWYg
KGMgPT0gJmJvb3RfY3B1X2RhdGEgJiYgIWNwdV9oYXMoYywgWDg2X0ZFQVRVUkVfUlNUUl9GUF9F
UlJfUFRSUykpCj4gIAkJc2V0dXBfZm9yY2VfY3B1X2NhcChYODZfQlVHX0ZQVV9QVFJTKTsKPiAg
Cj4gIAkvKgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
