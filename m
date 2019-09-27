Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899EC020F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:17:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmKc-0007SA-No; Fri, 27 Sep 2019 09:14:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDmKb-0007Rv-Pw
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:14:29 +0000
X-Inumbo-ID: 27c39916-e107-11e9-9671-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 27c39916-e107-11e9-9671-12813bfff9fa;
 Fri, 27 Sep 2019 09:14:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D50FAFCB;
 Fri, 27 Sep 2019 09:14:05 +0000 (UTC)
To: Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
Date: Fri, 27 Sep 2019 11:14:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
 Practice
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAyMTozOSwgTGFycyBLdXJ0aCB3cm90ZToKPiArIyMjIFZlcmJvc2UgdnMu
IHRlcnNlCj4gK0R1ZSB0byB0aGUgdGltZSBpdCB0YWtlcyB0byByZXZpZXcgYW5kIGNvbXBvc2Ug
Y29kZSByZXZpZXdlciwgcmV2aWV3ZXJzIG9mdGVuIGFkb3B0IGEKPiArdGVyc2Ugc3R5bGUuIEl0
IGlzIG5vdCB1bnVzdWFsIHRvIHNlZSByZXZpZXcgY29tbWVudHMgc3VjaCBhcwo+ICs+IHR5cG8K
PiArPiBzL3Jlc2lvbnMvcmVnaW9ucy8KPiArPiBjb2Rpbmcgc3R5bGUKPiArPiBjb2Rpbmcgc3R5
bGU6IGJyYWNrZXRzIG5vdCBuZWVkZWQKPiArZXRjLgo+ICsKPiArVGVyc2UgY29kZSByZXZpZXcg
c3R5bGUgaGFzIGl0cyBwbGFjZSBhbmQgY2FuIGJlIHByb2R1Y3RpdmUgZm9yIGJvdGggdGhlIHJl
dmlld2VyIGFuZAo+ICt0aGUgYXV0aG9yLiBIb3dldmVyLCBvdmVydXNlIGNhbiBjb21lIGFjcm9z
cyBhcyB1bmZyaWVuZGx5LCBsYWNraW5nIGVtcGF0aHkgYW5kCj4gK2NhbiB0aHVzIGNyZWF0ZSBh
IG5lZ2F0aXZlIGltcHJlc3Npb24gd2l0aCB0aGUgYXV0aG9yIG9mIGEgcGF0Y2guIFRoaXMgaXMg
aW4gcGFydGljdWxhcgo+ICt0cnVlLCB3aGVuIHlvdSBkbyBub3Qga25vdyB0aGUgYXV0aG9yIG9y
IHRoZSBhdXRob3IgaXMgYSBuZXdjb21lci4gVGVyc2UKPiArY29tbXVuaWNhdGlvbiBzdHlsZXMg
Y2FuIGFsc28gYmUgcGVyY2VpdmVkIGFzIHJ1ZGUgaW4gc29tZSBjdWx0dXJlcy4KCkFuZCBhbm90
aGVyIHJlbWFyayBoZXJlOiBOb3QgYmVpbmcgdGVyc2UgaW4gc2l0dWF0aW9ucyBsaWtlIHRoZSBv
bmVzCmVudW1lcmF0ZWQgYXMgZXhhbXBsZXMgYWJvdmUgaXMgYSBkb3VibGUgd2FzdGUgb2YgdGhl
IHJldmlld2VyJ3MgdGltZToKVGhleSBzaG91bGRuJ3QgZXZlbiBuZWVkIHRvIG1ha2Ugc3VjaCBj
b21tZW50cywgZXNwZWNpYWxseSBub3QgbWFueQp0aW1lcyBmb3IgYSBzaW5nbGUgcGF0Y2ggKHNl
ZSB5b3VyIG1lbnRpb24gb2YgIm92ZXJ1c2UiKS4gSSByZWFsaXplCndlIHN0aWxsIGhhdmUgbm8g
YXV0b21hdGVkIG1lY2hhbmlzbSB0byBjaGVjayBzdHlsZSBhc3BlY3RzLCBidXQKYW55Ym9keSBj
YW4gZWFzaWx5IGxvb2sgb3ZlciB0aGVpciBwYXRjaGVzIGJlZm9yZSBzdWJtaXR0aW5nIHRoZW0u
CkFuZCBmb3IgYW4gb2NjYXNpb25hbCBpc3N1ZSBJIHRoaW5rIGEgdGVyc2UgcmVwbHkgaXMgcXVp
dGUgcmVhc29uYWJsZQp0byBoYXZlLgoKT3ZlcmFsbCBJJ20gc2VlaW5nIHRoZSBnb29kIGludGVu
dGlvbnMgb2YgdGhpcyBkb2N1bWVudCwgeWV0IEknZCBzdGlsbAp2b3RlIGF0IGxlYXN0IC0xIG9u
IGl0IGlmIGl0IGNhbWUgdG8gYSB2b3RlLiBGb2xsb3dpbmcgZXZlbiBqdXN0IGEKZmFpciBwYXJ0
IG9mIGl0IGlzIGEgY29uc2lkZXJhYmxlIGV4dHJhIGFtb3VudCBvZiB0aW1lIHRvIGludmVzdCBp
bgpyZXZpZXdzLCB3aGVuIHdlIGFscmVhZHkgaGF2ZSBhIHNldmVyZSByZXZpZXdpbmcgYm90dGxl
bmVjay4gSWYgSSBoYXZlCnRvIGp1ZGdlIGJldHdlZW4gZG9pbmcgYSBiYWQgKHN0eWxpc3RpY2Fs
bHkgYWNjb3JkaW5nIHRvIHRoaXMgZG9jLCBub3QKdGVjaG5pY2FsbHkpIHJldmlldyBvciBub25l
IGF0IGFsbCAoYmVjYXVzZSBvZiB0aW1lIGNvbnN0cmFpbnRzKSwgSSdkCmZhdm9yIHRoZSBmb3Jt
ZXIuIFVubGVzcyBvZiBjb3Vyc2UgSSdtIGFza2VkIHRvIHN0b3AgZG9pbmcgc28sIGluCndoaWNo
IGNhc2UgSSdkIGV4cGVjdCB3aG9ldmVyIGFza3MgdG8gYXJyYW5nZSBmb3IgdGhlIHJldmlld3Mg
dG8gYmUKZG9uZSBieSBzb21lb25lIGVsc2UgaW4gZHVlIGNvdXJzZS4KCkknbSBzb3JyeSBmb3Ig
KGxpa2VseSkgc291bmRpbmcgZGVzdHJ1Y3RpdmUgaGVyZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
