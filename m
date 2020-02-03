Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D423F1507EE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:04:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycJ7-00026e-Pg; Mon, 03 Feb 2020 14:02:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iycJ6-00026Z-I9
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:02:32 +0000
X-Inumbo-ID: d1717320-468d-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1717320-468d-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 14:02:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C425B237;
 Mon,  3 Feb 2020 14:02:30 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-2-jgross@suse.com>
 <58b1a2e5-d63f-ba87-9f20-24b8c0e1097f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aece6da6-8e95-ce11-5d61-8934044f8a5f@suse.com>
Date: Mon, 3 Feb 2020 15:02:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <58b1a2e5-d63f-ba87-9f20-24b8c0e1097f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/9] xen: add a generic way to include
 binary files as variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAgMTQ6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAxLjIwMjAgMDk6
NDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIveGVuL3Rv
b2xzL2JpbmZpbGUKPj4gQEAgLTAsMCArMSwyOSBAQAo+PiArIyEvYmluL3NoCj4+ICsjIHVzYWdl
OiBiaW5maWxlIFstaV0gPHRhcmdldC1zcmMuUz4gPGJpbmFyeS1maWxlPiA8dmFybmFtZT4KPj4g
KyMgLWkgICAgIGFkZCB0byAuaW5pdC5yb2RhdGEgKGRlZmF1bHQ6IC5yb2RhdGEpIHNlY3Rpb24K
Pj4gKwo+PiArWyAiJDEiID0gIi1pIiBdICYmIHsKPj4gKyAgICBzaGlmdAo+PiArICAgIHNlY3Rp
b249Ii5pbml0Igo+PiArfQo+PiArCj4+ICt0YXJnZXQ9JDEKPj4gK2JpbnNvdXJjZT0kMgo+PiAr
dmFybmFtZT0kMwo+PiArCj4+ICtjYXQgPDxFT0YgPiR0YXJnZXQKPj4gKyNpbmNsdWRlIDxhc20v
YXNtX2RlZm5zLmg+Cj4+ICsKPj4gKyAgICAgICAgLnNlY3Rpb24gJHNlY3Rpb24ucm9kYXRhLCAi
YSIsICVwcm9nYml0cwo+PiArCj4+ICsgICAgICAgIC5nbG9iYWwgJHZhcm5hbWUKPj4gKyR2YXJu
YW1lOgo+PiArICAgICAgICAuaW5jYmluICIkYmluc291cmNlIgo+PiArLkxlbmQ6Cj4+ICsKPj4g
KyAgICAgICAgLnR5cGUgJHZhcm5hbWUsICVvYmplY3QKPj4gKyAgICAgICAgLnNpemUgJHZhcm5h
bWUsIC4gLSAkdmFybmFtZQo+IAo+IEknZCBwcmVmZXIgaWYgeW91IHVzZWQgLkxlbmQgaGVyZSBh
cyB3ZWxsLgoKT2theS4KCj4gSSB3b25kZXIgd2hldGhlciwgcmlnaHQgZnJvbSB0aGUgYmVnaW5u
aW5nLCB0aGVyZSB3b3VsZG4ndCBiZXR0ZXIKPiBiZSBhIHdheSB0byBhbHNvIHJlcXVlc3QgYmV0
dGVyIHRoYW4gYnl0ZSBhbGlnbm1lbnQgZm9yIHN1Y2ggYQo+IGJsb2IuCgpJIGNhbiBhZGQgdGhh
dC4gV2hhdCBhYm91dCAiLWEgPG4+IiBmb3IgMl5uIGFsaWdubWVudD8KCj4gCj4+IC0tLSBhL3hl
bi94c20vZmxhc2svTWFrZWZpbGUKPj4gKysrIGIveGVuL3hzbS9mbGFzay9NYWtlZmlsZQo+PiBA
QCAtMzAsNiArMzAsOSBAQCAkKEFWX0hfRklMRVMpOiAkKEFWX0hfREVQRU5EKQo+PiAgIG9iai1i
aW4tJChDT05GSUdfWFNNX0ZMQVNLX1BPTElDWSkgKz0gZmxhc2stcG9saWN5Lm8KPj4gICBmbGFz
ay1wb2xpY3kubzogcG9saWN5LmJpbgo+PiAgIAo+PiArZmxhc2stcG9saWN5LlM6ICQoWEVOX1JP
T1QpL3hlbi90b29scy9iaW5maWxlCj4+ICsJJChYRU5fUk9PVCkveGVuL3Rvb2xzL2JpbmZpbGUg
LWkgJEAgcG9saWN5LmJpbiB4c21fZmxhc2tfaW5pdF9wb2xpY3kKPiAKPiBEb2Vzbid0IG9iamNv
cHkgcHJvdmlkZSBhIG1lYW5zIHRvIGNvbnZlcnQgYSBiaW5hcnkgYmxvYiBpbnRvCj4gYW4gRUxG
IG9iamVjdCBjb250YWluaW5nIHRoZSBiaW5hcnkgZGF0YSBmcm9tIHRoZSBpbnB1dCBmaWxlPwo+
IElmIHNvLCB3aHkgaW52b2x2ZSB0aGUgYXNzZW1ibGVyIGFuZCBhbiBpbnRlcm1lZGlhdGUgZmls
ZSBoZXJlPwoKSSBjYW4gc2VlIGhvdyB0byBhZGQgYSBzeW1ib2wgZm9yIHRoYXQgcHVycG9zZSB1
c2luZyBhIGRlZGljYXRlZCBzZWN0aW9uCmZvciBlYWNoIGJsb2IsIGJ1dCBob3cgdG8gYWRkIHRo
ZSBzaXplIGluZm9ybWF0aW9uIG9mIHRoZSBibG9iPwoKSW4gdGhlIGVuZCBJIGp1c3QgZm9sbG93
ZWQgY29tbWl0IDhkNTY3MWViMzFlNGJmIGZvciB0aGUgaW5jbHVzaW9uIG9mCnRoZSBibG9iLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
