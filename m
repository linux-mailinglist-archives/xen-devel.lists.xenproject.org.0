Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB8B1B3B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:55:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8iH0-0003bX-97; Fri, 13 Sep 2019 09:53:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8iGz-0003bS-2b
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:53:49 +0000
X-Inumbo-ID: 5ef19218-d60c-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ef19218-d60c-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 09:53:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A410AB6A1;
 Fri, 13 Sep 2019 09:53:42 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190912132813.6509-1-jgross@suse.com>
 <20190912132813.6509-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <786f5fc8-7907-fbb9-44ef-b4619cb8e960@suse.com>
Date: Fri, 13 Sep 2019 11:53:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912132813.6509-6-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/5] xen: add function name to lock
 profiling data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNToyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NwaW5sb2NrLmMKPiArKysgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKPiBAQCAtMzQ4LDYg
KzM0OCw3IEBAIHN0YXRpYyBzX3RpbWVfdCBsb2NrX3Byb2ZpbGVfc3RhcnQ7Cj4gIHN0YXRpYyBz
dHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqbG9ja19wcm9maWxlX2FuY3M7Cj4gIHN0YXRpYyBzdHJ1
Y3QgbG9ja19wcm9maWxlX3FoZWFkIGxvY2tfcHJvZmlsZV9nbGJfcTsKPiAgc3RhdGljIHNwaW5s
b2NrX3QgbG9ja19wcm9maWxlX2xvY2sgPSBTUElOX0xPQ0tfVU5MT0NLRUQ7Cj4gK3N0YXRpYyBj
b25zdCBjaGFyICpsb2NrX3Byb2ZpbGVfbm9mdW5jID0gX19QUkVUVFlfRlVOQ1RJT05fXzsKCmNv
bnN0IGFsc28gZm9yIHRoZSB2YXJpYWJsZSBpdHNlbGY/Cgo+IEBAIC0zNzEsOCArMzcyLDEwIEBA
IHN0YXRpYyB2b2lkIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRfZWxlbShzdHJ1Y3QgbG9ja19wcm9m
aWxlICpkYXRhLAo+ICAgICAgcHJpbnRrKCIlcyAiLCB0eXBlKTsKPiAgICAgIGlmICggaWR4ICE9
IExPQ0tQUk9GX0lEWF9OT05FICkKPiAgICAgICAgICBwcmludGsoIiVkICIsIGlkeCk7Cj4gLSAg
ICBwcmludGsoIiVzOiBhZGRyPSVwLCBsb2NrdmFsPSUwOHgsICIsIGRhdGEtPm5hbWUsIGxvY2ss
Cj4gLSAgICAgICAgICAgbG9jay0+dGlja2V0cy5oZWFkX3RhaWwpOwo+ICsgICAgcHJpbnRrKCIl
cyIsIGRhdGEtPm5hbWUpOwo+ICsgICAgaWYgKCBkYXRhLT5mdW5jICYmIHN0cmNtcChkYXRhLT5m
dW5jLCBsb2NrX3Byb2ZpbGVfbm9mdW5jKSApCj4gKyAgICAgICAgcHJpbnRrKCJAJXMiLCBkYXRh
LT5mdW5jKTsKPiArICAgIHByaW50aygiOiBhZGRyPSVwLCBsb2NrdmFsPSUwOHgsICIsIGxvY2ss
IGxvY2stPnRpY2tldHMuaGVhZF90YWlsKTsKCkFzIGxvbmcgYXMgdGhpcyBpcyB1c2VkIGZyb20g
YSBrZXkgaGFuZGxlciBvbmx5LCBJIGd1ZXNzIHRoZQpzcGxpdHRpbmcgb2YgdGhlIHByaW50aygp
cyBpc24ndCBtdWNoIG9mIGEgcHJvYmxlbS4KCj4gQEAgLTQyNyw3ICs0MzAsMTQgQEAgc3RhdGlj
IHZvaWQgc3BpbmxvY2tfcHJvZmlsZV91Y29weV9lbGVtKHN0cnVjdCBsb2NrX3Byb2ZpbGUgKmRh
dGEsCj4gIAo+ICAgICAgaWYgKCBwLT5wYy0+bnJfZWxlbSA8IHAtPnBjLT5tYXhfZWxlbSApCj4g
ICAgICB7Cj4gLSAgICAgICAgc2FmZV9zdHJjcHkoZWxlbS5uYW1lLCBkYXRhLT5uYW1lKTsKPiAr
ICAgICAgICBpZiAoIGRhdGEtPmZ1bmMgJiYgc3RyY21wKGRhdGEtPmZ1bmMsIGxvY2tfcHJvZmls
ZV9ub2Z1bmMpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHNucHJpbnRmKGVsZW0ubmFt
ZSwgc2l6ZW9mKGVsZW0ubmFtZSksICIlc0AlcyIsIGRhdGEtPm5hbWUsCj4gKyAgICAgICAgICAg
ICAgICAgICAgIGRhdGEtPmZ1bmMpOwo+ICsgICAgICAgICAgICBlbGVtLm5hbWVbc2l6ZW9mKGVs
ZW0ubmFtZSkgLSAxXSA9IDA7CgpUaGlzIGlzbid0IG5lZWRlZCBhZnRlciBzbnByaW50ZigpLCBp
cyBpdD8KCldpdGggdGhlIHR3byBzdWdnZXN0ZWQgYWRqdXN0bWVudHMgKHByb3ZpZGVkIHlvdSBh
Z3JlZSwgYW5kCndoaWNoIGNvdWxkIHByb2JhYmx5IGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZykK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
