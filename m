Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286126545
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 15:57:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTRi7-0002IQ-RR; Wed, 22 May 2019 13:55:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pibO=TW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hTRi6-0002IL-W1
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:55:15 +0000
X-Inumbo-ID: 389a5676-7c99-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 389a5676-7c99-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 13:55:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: qqdhikhhxJMfqd9o5GzezJuH6V5IjGtmER7jMVNhuKwSbO4cOabQEXc0ez/BNSfWPrLh9d8Xpv
 kKfnDvO2GDRB6U1j+nzg80hGZWk6uH/CzA/YnjSNlhlNmt/DidZQg1/PvuYAMSU5y+9Oq+nwyb
 CIfM3NAubFkuVXAy2O2Xep6isCI3RPknbYVtC1qg+IKaAv/93ekTsKB2vAbMq/BRyecgP1akpL
 TWFHEL+mMHF53aClQfUqRUjjOReqMxh95aem7ViBqaa886KjPsAnuvsZeTB+YQKE9J5Wwt+fO+
 xxU=
X-SBRS: 2.7
X-MesageID: 779313
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,499,1549947600"; 
   d="scan'208";a="779313"
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Alexandru Stefan ISAILA'
 <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <153d4f7da0a24805bb7112f6ff2beb80@AMSPEX02CL03.citrite.net>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <7924f83e-59b5-432d-06b8-d3b57c536c97@citrix.com>
Date: Wed, 22 May 2019 14:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <153d4f7da0a24805bb7112f6ff2beb80@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
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
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yMi8xOSAyOjEzIFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIFttYWlsdG86YWlz
YWlsYUBiaXRkZWZlbmRlci5jb21dCj4+IFNlbnQ6IDIwIE1heSAyMDE5IDEzOjU1Cj4+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gQ2M6IFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+OyBqYmV1bGljaEBzdXNlLmNvbTsgQW5kcmV3IENvb3Blcgo+PiA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsKPj4gcmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbTsgdGFtYXNAdGtsZW5neWVsLmNvbTsgR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBjaXRyaXguY29tPjsgQWxleGFuZHJ1Cj4+IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMS8yXSB4ODYvZW11bGF0ZTog
TW92ZSBodm1lbXVsX2xpbmVhcl90b19waHlzCj4+Cj4+IFRoaWlzIGlzIGRvbmUgc28gaHZtZW11
bF9saW5lYXJfdG9fcGh5cygpIGNhbiBiZSBjYWxsZWQgZnJvbQo+PiBodm1lbXVsX3NlbmRfdm1f
ZXZlbnQoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+Cj4+IC0tLQo+PiAgeGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgfCAx
ODEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDkwIGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+
PiBpbmRleCA4NjU5Yzg5ODYyLi4yNTRmZjY1MTVkIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYwo+PiBA
QCAtNTMwLDYgKzUzMCw5NSBAQCBzdGF0aWMgaW50IGh2bWVtdWxfZG9fbW1pb19hZGRyKHBhZGRy
X3QgbW1pb19ncGEsCj4+ICAgICAgcmV0dXJuIGh2bWVtdWxfZG9faW9fYWRkcigxLCBtbWlvX2dw
YSwgcmVwcywgc2l6ZSwgZGlyLCBkZiwgcmFtX2dwYSk7Cj4+ICB9Cj4+Cj4gCj4gSSBrbm93IHRo
aXMgaXMgY29kZSBtb3ZlbWVudCwgYnV0IGl0IHdvdWxkIHByb2JhYmx5IGdvb2QgdG8gYSBkbyBh
IGJpdCBvZiB0aWR5aW5nLi4uCgpJIHRoaW5rIHRoZXJlIGFyZSBkaWZmZXJlbnQgbWluZHMgb24g
dGhpczsgSSAqZ2VuZXJhbGx5KiBwcmVmZXIgcHVyZQpjb2RlIG1vdmVtZW50IHRvIGJlIHdpdGgg
YXMgZmV3IGNoYW5nZXMgYXMgcG9zc2libGUsIHRvIG1ha2Ugc3VyZSBhY3R1YWwKY2hhbmdlcyBh
cmUgZWFzeSB0byBjYWxsIG91dC4KClRoZSBjaGFuZ2VzIHlvdSd2ZSBhc2tlZCBmb3IgYXJlIHBy
ZXR0eSBtaW5vciAoYW5kIHlvdSdyZSB0aGUgbWFpbnRhaW5lcgpvZiB0aGUgZmlsZSBpdCdzIGJl
aW5nIG1vdmVkIHRvKSwgc28gSSB3b24ndCBhcmd1ZSBhYm91dCBpdCBpbiB0aGlzCnBhcnRpY3Vs
YXIgY2FzZS4gIEp1c3Qgd2FudCB0byBjb3VudGVyIHRoZSBpZGVhIHRoYXQgbW92ZSArIGNoYW5n
ZSBpcwp0aGUgbm9ybS4gOi0pCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
