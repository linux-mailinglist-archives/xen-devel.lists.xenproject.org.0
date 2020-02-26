Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605C16F893
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 08:35:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6rAZ-0004Bj-2d; Wed, 26 Feb 2020 07:31:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cHzz=4O=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1j6rAX-0004Be-Ca
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 07:31:45 +0000
X-Inumbo-ID: 08e02c1e-586a-11ea-aba8-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08e02c1e-586a-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 07:31:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 23:31:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,487,1574150400"; d="scan'208";a="231307842"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.154])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2020 23:31:40 -0800
Date: Wed, 26 Feb 2020 15:37:50 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Chen, Farrah" <farrah.chen@intel.com>
Message-ID: <20200226073747.GA1329@gao-cwp>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1B925CC0CD9F3341B32D442251E7E1DC3E3DBF54@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [BUG]Nested virtualization, Xen on KVM,
 Xen cannot boot up as a guest of KVM
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDI6MjE6MjVQTSArMDgwMCwgQ2hlbiwgRmFycmFoIHdy
b3RlOgo+RGVzY3JpcHRpb246Cj4KPk5lc3RlZCB2aXJ0dWFsaXphdGlvbiwgdGFrZSBLVk0gaG9z
dCBhcyBMMCwgY3JlYXRlIGd1ZXN0IG9uIGl0LCBpbnN0YWxsIFhlbiBvbgo+Z3Vlc3QsIHRoZW4g
Z3Vlc3QgY2Fubm90IGJvb3QgdXAgZnJvbSBYZW4gYW5kIGtlZXAgcmVib290aW5nLgo+Cj4gCj4K
PlJlcHJvZHVjZSBzdGVwczoKPjEuIEVuYWJsZSBLVk0gbmVzdGVkIG9uIGhvc3QoTDApCj5ybW1v
ZCBrdm1faW50ZWwKPm1vZHByb2JlIGt2bV9pbnRlbCBuZXN0ZWQ9eQo+Y2F0IC9zeXMvbW9kdWxl
L2t2bV9pbnRlbC9wYXJhbWV0ZXJzL25lc3RlZAo+WQo+Cj4yLkNyZWF0ZSBMMSBndWVzdCB2aWEg
cWVtdToKPnFlbXUtc3lzdGVtLXg4Nl82NCAtYWNjZWwga3ZtIC1jcHUgaG9zdCAtZHJpdmUgZmls
ZT1yaGVsOC5pbWcsaWY9bm9uZSxpZD0KPnZpcnRpby1kaXNrMCAtZGV2aWNlIHZpcnRpby1ibGst
cGNpLGRyaXZlPXZpcnRpby1kaXNrMCAtbSA3MTY4IC1zbXAgOCAtbW9uaXRvcgo+cHR5IC1jcHUg
aG9zdCAtZGV2aWNlIHZpcnRpby1uZXQtcGNpLG5ldGRldj1uaWMwLG1hYz0wMDoxNjozZTo3Mjo1
ZTowYSAtbmV0ZGV2Cj50YXAsaWQ9bmljMCxicj12aXJicjAsaGVscGVyPS91c3IvbGliZXhlYy9x
ZW11LWJyaWRnZS1oZWxwZXIsdmhvc3Q9b24gLXNlcmlhbAo+c3RkaW8KPgo+My4gQnVpbGQgYW5k
IGluc3RhbGwgWGVuIG9uIEwxIGd1ZXN0Cj4KPjQuIFJlYm9vdCBMMSBhbmQgbWFrZSBpdCBib290
IGZyb20gWGVuCj4KPiAKPgo+VGhlbiBMMSBrZWVwIHJlYm9vdGluZywgZnVsbCBsb2cgYXR0YWNo
ZWQuCj4KPuKApuKApgo+Cj4oWEVOKSBSdW5uaW5nIHN0dWIgcmVjb3Zlcnkgc2VsZnRlc3RzLi4u
Cj4KPihYRU4pIHRyYXBzLmM6MTU5MDogR1BGICgwMDAwKTogZmZmZjgyZDBiZmZmZTA0MSBbZmZm
ZjgyZDBiZmZmZTA0MV0gLT4KPmZmZmY4MmQwODAzOGU0MGMKPgo+KFhFTikgdHJhcHMuYzo3ODU6
IFRyYXAgMTI6IGZmZmY4MmQwYmZmZmUwNDAgW2ZmZmY4MmQwYmZmZmUwNDBdIC0+Cj5mZmZmODJk
MDgwMzhlNDBjCj4KPihYRU4pIHRyYXBzLmM6MTEyNDogVHJhcCAzOiBmZmZmODJkMGJmZmZlMDQx
IFtmZmZmODJkMGJmZmZlMDQxXSAtPgo+ZmZmZjgyZDA4MDM4ZTQwYwo+Cj4oWEVOKSAtLS0tWyBY
ZW4tNC4xNC11bnN0YWJsZSAgeDg2XzY0ICBkZWJ1Zz15ICAgVGFpbnRlZDogIEMgICBdLS0tLQo+
Cj4oWEVOKSBDUFU6ICAgIDAKPgo+KFhFTikgUklQOiAgICBlMDA4Ols8ZmZmZjgyZDA4MDQzYThi
Yz5dIGNvcmUyX3ZwbXVfaW5pdCsweGE1LzB4MjIxCj4KPihYRU4pIFJGTEFHUzogMDAwMDAwMDAw
MDAxMDIwMiAgIENPTlRFWFQ6IGh5cGVydmlzb3IKPgo+KFhFTikgcmF4OiAwMDAwMDAwMDA4MzAw
ODAyICAgcmJ4OiAwMDAwMDAwMDAwMDAwMDAwICAgcmN4OiAwMDAwMDAwMDAwMDAwMzQ1Cj4KPihY
RU4pIHJkeDogMDAwMDAwMDAwMDAwMDAwNCAgIHJzaTogMDAwMDAwMDAwMDAwMDAwYSAgIHJkaTog
MDAwMDAwMDAwMDAwMDA2Mwo+Cj4oWEVOKSByYnA6IGZmZmY4MmQwODA0YjdkNjggICByc3A6IGZm
ZmY4MmQwODA0YjdkNTggICByODogIDAwMDAwMDAwMDAwMDAwMDQKPgo+KFhFTikgcjk6ICAwMDAw
MDAwMDAwMDAwMDA4ICAgcjEwOiBmZmZmODJkMDgwNWVmZmUwICAgcjExOiAwMDAwMDAwMDAwMDAw
MDMyCj4KPihYRU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwMiAgIHIxMzogMDAwMDAwMDAwMDAwMDAw
OCAgIHIxNDogZmZmZjgyZDA4MDVkZDBjMAo+Cj4oWEVOKSByMTU6IGZmZmY4MmQwODA1ZGUzMDAg
ICBjcjA6IDAwMDAwMDAwODAwNTAwM2IgICBjcjQ6IDAwMDAwMDAwMDAzNTI2ZTAKPgo+KFhFTikg
Y3IzOiAwMDAwMDAwMGJmY2E0MDAwICAgY3IyOiAwMDAwMDAwMDAwMDAwMDAwCj4KPihYRU4pIGZz
YjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzczogMDAwMDAw
MDAwMDAwMDAwMAo+Cj4oWEVOKSBkczogMDAwMCAgIGVzOiAwMDAwICAgZnM6IDAwMDAgICBnczog
MDAwMCAgIHNzOiAwMDAwICAgY3M6IGUwMDgKPgo+KFhFTikgWGVuIGNvZGUgYXJvdW5kIDxmZmZm
ODJkMDgwNDNhOGJjPiAoY29yZTJfdnBtdV9pbml0KzB4YTUvMHgyMjEpOgo+Cj4oWEVOKSAgMDAg
MDYgMDAgYjkgNDUgMDMgMDAgMDAgPDBmPiAzMiA0OCA4OSBjMSA0OCBjMSBlOSAwZCA4MyBlMSAw
MSA4OCAwZCAzMgo+MDAKClRoZSBtYWNoaW5lIGNvZGUgYWJvdmUgc2hvd3MgdGhhdCAjR1AgaXMg
Z2VuZXJhdGVkIHdoZW4geGVuIGlzIHJlYWRpbmcKTVNSX0lBMzJfUEVSRl9DQVBBQklMSVRJRVMu
IEluIGEgS1ZNIGd1ZXN0IHdpdGhvdXQgWGVuLCBjcHVpZCB0ZWxscyB0aGF0CnBlcmZtb24gaXNu
J3Qgc3VwcG9ydGVkLgoKIyAuL2NwdWlkIC0xIHxncmVwICJwZXJmbW9uIGFuZCBkZWJ1ZyIKIFBE
Q006IHBlcmZtb24gYW5kIGRlYnVnID0gZmFsc2UKClNvLCBpdCBsb29rcyBjb3JlMl92cG11X2lu
aXQoKSBsYWNrcyBhIGNoZWNrIHRvIGVuc3VyZSB0aGUgTVNSIGlzIHN1cHBvcnRlZC4KClRoYW5r
cwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
