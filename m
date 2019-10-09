Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA4D0D6F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 13:14:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9qn-000635-Hp; Wed, 09 Oct 2019 11:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cw47=YC=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iI9qm-000630-2v
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:09:48 +0000
X-Inumbo-ID: 4cfaaad0-ea85-11e9-96dc-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cfaaad0-ea85-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 11:09:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 04:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="368715679"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 09 Oct 2019 04:09:43 -0700
Date: Wed, 9 Oct 2019 19:13:45 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191009111343.GA16457@gao-cwp>
References: <20191009083321.1743-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009083321.1743-1-roger.pau@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v2] pci: clear {host/guest}_maskall field on
 assign
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Spassov,
 Stanislav" <stanspas@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMTA6MzM6MjFBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaG9zdF9tYXNrYWxsIG1ha2Vz
IGl0IHN0aWNreSBhY3Jvc3MKPmFzc2lnbiBhbmQgZGVhc3NpZ24gY2FsbHMsIHdoaWNoIG1lYW5z
IHRoYXQgb25jZSBhIGd1ZXN0IGZvcmNlcyBYZW4gdG8KPnNldCBob3N0X21hc2thbGwgdGhlIG1h
c2thbGwgYml0IGlzIG5vdCBnb2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPmNhbGwgdG8gUEhZ
U0RFVk9QX3ByZXBhcmVfbXNpeCBpcyBwZXJmb3JtZWQuIFN1Y2ggY2FsbCBob3dldmVyCj5zaG91
bGRuJ3QgYmUgcGFydCBvZiB0aGUgbm9ybWFsIGZsb3cgd2hlbiBkb2luZyBQQ0kgcGFzc3Rocm91
Z2gsIGFuZAo+aGVuY2UgdGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFzc2lnbmlu
ZyBpbiBvcmRlciB0byBwcmV2ZW50Cj5ob3N0X21hc2thbGwgYmVpbmcgY2FycmllZCBvdmVyIGZy
b20gcHJldmlvdXMgYXNzaWduYXRpb25zLgo+Cj5Ob3RlIHRoYXQgdGhlIGVudHJ5IG1hc2tiaXQg
aXMgcmVzZXQgd2hlbiB0aGUgbXNpeCBjYXBhYmlsaXR5IGlzCj5pbml0aWFsaXplZCwgYW5kIHRo
ZSBndWVzdF9tYXNrYWxsIGZpZWxkIGlzIGFsc28gY2xlYXJlZCBzbyB0aGF0IHRoZQo+aGFyZHdh
cmUgdmFsdWUgbWF0Y2hlcyBYZW4ncyBpbnRlcm5hbCBzdGF0ZSAoaGFyZHdhcmUgbWFza2FsbCA9
Cj5ob3N0X21hc2thbGwgfMKgZ3Vlc3RfbWFza2FsbCkuCj4KPkFsc28gbm90ZSB0aGF0IGRvaW5n
IHRoZSByZXNldCBvZiBob3N0X21hc2thbGwgdGhlcmUgd291bGQgYWxsb3cgdGhlCj5ndWVzdCB0
byByZXNldCBzdWNoIGZpZWxkIGJ5IGVuYWJsaW5nIGFuZCBkaXNhYmxpbmcgTVNJWCwgd2hpY2gg
aXMgbm90Cj5pbnRlbmRlZC4KPgo+U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4tLS0KPkNjOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29t
Pgo+Q2M6ICJTcGFzc292LCBTdGFuaXNsYXYiIDxzdGFuc3Bhc0BhbWF6b24uZGU+Cj5DYzogUGFz
aSBLw6Rya2vDpGluZW4gPHBhc2lrQGlraS5maT4KPi0tLQo+Q2hhbywgU3RhbmlzbGF2LCBjYW4g
eW91IHBsZWFzZSBjaGVjayBpZiB0aGlzIHBhdGNoIGZpeGVzIHlvdXIKPmlzc3Vlcz8KClRlc3Rl
ZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KCkkgZ290IHRoZSBhc3NlcnRpb24g
ZmFpbHVyZSBiZWxvdyB3aGVuIHN0YXJ0aW5nIHhlbmNvbW1vbnMgd2l0aCB0aGUKbmV3ZXN0IHN0
YWdpbmc6CgpTZXR0aW5nIGRvbWFpbiAwIG5hbWUsIGRvbWlkIGFuZCBKU09OIGNvbmZpZy4uLgp4
ZW4taW5pdC1kb20wOiBfbGlieGxfdHlwZXMuYzoyMTYzOiBsaWJ4bF9kb21haW5fYnVpbGRfaW5m
b19pbml0X3R5cGU6IEFzc2VydGlvbiBgcC0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9JTlZB
TElEJyBmYWlsZWQuCi9ldGMvaW5pdC5kL3hlbmNvbW1vbnM6IGxpbmUgNTQ6ICAyMDA2IEFib3J0
ZWQgICAgICAgICAgICAgICAgIChjb3JlIGR1bXBlZCkgJHtMSUJFWEVDX0JJTn0veGVuLWluaXQt
ZG9tMCAke1hFTl9ET00wX1VVSUR9CgpJdCBzaG91bGQgYmUgaXJyZWxhdGVkIHRvIHRoaXMgcGF0
Y2guIFNvIEkgYXBwbHkgdGhpcyBwYXRjaCBvbgpjZDkzOTUzNTM4YWFjIGFuZCBpdCB3b3Jrcy4K
ClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
