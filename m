Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8D3D15B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 17:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haizR-0006VT-II; Tue, 11 Jun 2019 15:47:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+3hp=UK=intel.com=ashok.raj@srs-us1.protection.inumbo.net>)
 id 1haizQ-0006VM-63
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 15:47:12 +0000
X-Inumbo-ID: 2c7f1651-8c60-11e9-8980-bc764e045a96
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c7f1651-8c60-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 15:47:10 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 08:47:09 -0700
X-ExtLoop1: 1
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.145])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2019 08:47:08 -0700
Date: Tue, 11 Jun 2019 08:47:08 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190611154708.GA44426@otc-nc-03>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-9-git-send-email-chao.gao@intel.com>
 <5CF7CD2702000078002358F4@prv1-mh.provo.novell.com>
 <20190611123615.GA22930@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611123615.GA22930@gao-cwp>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [Xen-devel] [PATCH v7 08/10] x86/microcode: Synchronize late
 microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de,
 Borislav Petkov <bp@suse.de>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2FvLCBKYW4KCk9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA4OjM2OjE3UE0gKzA4MDAsIENo
YW8gR2FvIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDA1LCAyMDE5IGF0IDA4OjA5OjQzQU0gLTA2MDAs
IEphbiBCZXVsaWNoIHdyb3RlOgo+ID4KPiA+VGhlcmUncyBubyBjb21tZW50IGhlcmUgYW5kIG5v
dGhpbmcgaW4gdGhlIGRlc2NyaXB0aW9uOiBJIGRvbid0Cj4gPnJlY2FsbCBjbGFyaWZpY2F0aW9u
IGFzIHRvIHdoZXRoZXIgUkRUU0MgaXMgZmluZSB0byBiZSBpc3N1ZWQgYnkgYQo+ID50aHJlYWQg
d2hlbiB1Y29kZSBpcyBiZWluZyB1cGRhdGVkIGJ5IGFub3RoZXIgdGhyZWFkIG9uIHRoZQo+ID5z
YW1lIGNvcmUuCj4gCj4gWWVzLiBJIHRoaW5rIGl0IGlzIGZpbmUuCj4gCj4gQXNob2ssIGNvdWxk
IHlvdSBzaGFyZSB5b3VyIG9waW5pb24gb24gdGhpcyBxdWVzdGlvbj8KPiAKClllcywgcmR0c2Mg
c2hvdWxkIGJlIGZpbmUgZm9yIG90aGVyIHRocmVhZHMgdG8gZXhlY3V0ZSB3aGlsZSB3YWl0aW5n
IGZvciB0aGUgCm1pY3JvY29kZSB1cGRhdGUgdG8gY29tcGxldGUgb24gb3RoZXJzLiBXZSBkbyB0
aGUgc2FtZSBpbiBMaW51eCBhcyB3ZWxsLgoKQ2hlZXJzLApBc2hvawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
