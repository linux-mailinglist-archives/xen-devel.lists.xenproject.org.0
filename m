Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9B34D34
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCDP-00019R-RO; Tue, 04 Jun 2019 16:23:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYCDO-00019D-Po
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:23:10 +0000
X-Inumbo-ID: 0997eee6-86e5-11e9-912b-c3b5394dc7e5
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0997eee6-86e5-11e9-912b-c3b5394dc7e5;
 Tue, 04 Jun 2019 16:23:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 10:23:07 -0600
Message-Id: <5CF69AE60200007800235349@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 10:23:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-2-git-send-email-chao.gao@intel.com>
 <e3507e72-00c4-0e00-b2d3-3d11b4a54a59@citrix.com>
In-Reply-To: <e3507e72-00c4-0e00-b2d3-3d11b4a54a59@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 01/10] misc/xen-ucode: Upload a microcode
 blob to the hypervisor
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE4OjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjcvMDUvMjAxOSAwOTozMSwgQ2hhbyBHYW8gd3JvdGU6Cj4+IC0tLSAvZGV2L251
bGwKPj4gKysrIGIvdG9vbHMvbWlzYy94ZW4tdWNvZGUuYwo+PiBAQCAtMCwwICsxLDc4IEBACj4+
ICsjZGVmaW5lIF9HTlVfU09VUkNFCj4+ICsKPj4gKyNpbmNsdWRlIDxzdGRpby5oPgo+PiArI2lu
Y2x1ZGUgPHN0ZGxpYi5oPgo+PiArI2luY2x1ZGUgPHN5cy9tbWFuLmg+Cj4+ICsjaW5jbHVkZSA8
ZXJybm8uaD4KPj4gKyNpbmNsdWRlIDxzdHJpbmcuaD4KPj4gKyNpbmNsdWRlIDxpbnR0eXBlcy5o
Pgo+PiArI2luY2x1ZGUgPHVuaXN0ZC5oPgo+PiArI2luY2x1ZGUgPHN5cy90eXBlcy5oPgo+PiAr
I2luY2x1ZGUgPHN5cy9zdGF0Lmg+Cj4+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPj4gKyNpbmNsdWRl
IDx4ZW5jdHJsLmg+Cj4+ICsKPj4gK3ZvaWQgc2hvd19oZWxwKHZvaWQpCj4+ICt7Cj4+ICsgICAg
ZnByaW50ZihzdGRlcnIsCj4+ICsgICAgICAgICAgICAieGVubWljcm9jb2RlOiBYZW4gbWljcm9j
b2RlIHVwZGF0aW5nIHRvb2xcbiIKPj4gKyAgICAgICAgICAgICJVc2FnZTogeGVubWljcm9jb2Rl
IDxtaWNyb2NvZGUgYmxvYj5cbiIpOwo+IAo+IHMveGVubWljcm9jb2RlL3hlbi11Y29kZS8KCklz
bid0IGl0IGNvbW1vbiBwcmFjdGljZSB0byB1c2UgYXJndlswXSBmb3Igc3VjaD8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
