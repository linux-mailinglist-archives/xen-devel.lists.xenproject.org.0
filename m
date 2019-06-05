Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2536031
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 17:19:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYXdz-0003Xe-PQ; Wed, 05 Jun 2019 15:16:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYXdy-0003XZ-On
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 15:16:02 +0000
X-Inumbo-ID: d417ce3d-87a4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d417ce3d-87a4-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 15:16:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 09:16:01 -0600
Message-Id: <5CF7DCAD02000078002359C4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 09:15:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <20190605145259.656jjucllbepchpq@Air-de-Roger>
In-Reply-To: <20190605145259.656jjucllbepchpq@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 09/10] microcode: remove
 microcode_update_lock
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
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDE2OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDA0OjMxOjMwUE0gKzA4MDAsIENoYW8gR2FvIHdyb3Rl
Ogo+PiBtaWNyb2NvZGVfdXBkYXRlX2xvY2sgaXMgdG8gcHJldmVudCBsb2dpYyB0aHJlYWRzIG9m
IGEgc2FtZSBjb3JlIGZyb20KPj4gdXBkYXRpbmcgbWljcm9jb2RlIGF0IHRoZSBzYW1lIHRpbWUu
IEJ1dCBkdWUgdG8gdXNpbmcgYSBnbG9iYWwgbG9jaywgaXQKPj4gYWxzbyBwcmV2ZW50ZWQgcGFy
YWxsZWwgbWljcm9jb2RlIHVwZGF0aW5nIG9uIGRpZmZlcmVudCBjb3Jlcy4KPiAKPiBPaCwgT0ss
IHNvIHRoYXQncyB3aGF0IEkgd2FzIG1pc3NpbmcgZnJvbSBwYXRjaCA4IGFuZCB3aGF0IHNlcmlh
bGl6ZXMKPiB0aGUgdXBkYXRpbmcuCj4gCj4+IFJlbW92ZSB0aGlzIGxvY2sgaW4gb3JkZXIgdG8g
dXBkYXRlIG1pY3JvY29kZSBpbiBwYXJhbGxlbC4gSXQgaXMgc2FmZQo+PiBiZWNhdXNlIHdlIGhh
dmUgYWxyZWFkeSBlbnN1cmVkIHNlcmlhbGl6YXRpb24gb2Ygc2libGluZyB0aHJlYWRzIGF0IHRo
ZQo+PiBjYWxsZXIgc2lkZS4KPiAKPiBUaGVuIHlvdSBjZXJ0YWlubHkgbmVlZCB0byBmaXggdGhl
IHdhaXQgbG9vcCBpbiBkb19taWNyb2NvZGVfdXBkYXRlIHRvCj4gb25seSB3YWl0IGZvciBNSUNS
T0NPREVfVVBEQVRFX1RJTUVPVVRfVVMgcmVnYXJkbGVzcyBvZiB0aGUgbnVtYmVyIG9mCj4gQ1BV
cyBpbiB0aGUgc3lzdGVtPwoKV2VsbCwgbm8sIG5vdCBleGFjdGx5LiBPbiBodWdlIHN5c3RlbXMg
aXQgbWF5IGluZGVlZCBzdGlsbCB0YWtlIGxvbmdlcgp0aGFuIG9uIHNtYWxsZXIgb25lcy4gVGhl
IHdheSB0aGUgd2FpdGluZyBpcyBjb2RlZCBub3cgKGV4cGVjdGluZwpmb3J3YXJkIHByb2dyZXNz
IGluIGV2ZXJ5IE1JQ1JPQ09ERV9VUERBVEVfVElNRU9VVF9VUyBwZXJpb2QsIGlzLApJIHRoaW5r
LCBhY2NlcHRhYmxlLiBQbHVzIGxlYXZpbmcgdGhhdCBsb2dpYyBhbG9uZSB3aWxsIGF2b2lkIHRv
dWNoaW5nIGl0CnlldCBhZ2FpbiB3aGVuIGludHJvZHVjaW5nIHNlcmlhbCBhcHBsaWNhdGlvbiBw
b2xpY3kgYXMgYW4gb3B0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
