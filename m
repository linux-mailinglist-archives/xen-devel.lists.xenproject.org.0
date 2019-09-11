Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD62B000F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:30:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84W7-0002rO-ET; Wed, 11 Sep 2019 15:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i84W5-0002r5-Om
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:26:45 +0000
X-Inumbo-ID: 900951ca-d4a8-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 900951ca-d4a8-11e9-a337-bc764e2007e4;
 Wed, 11 Sep 2019 15:26:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F4F7AF26;
 Wed, 11 Sep 2019 15:26:44 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <b1d43169-aaa4-a875-2963-832efa88183a@citrix.com>
 <b48fd75b-67d2-8df0-3443-0142e4375e3f@suse.com>
 <02c7841c-1b16-97ec-c12d-695bfe0b766f@suse.com>
 <19e6dbb5-82c0-4d7e-321b-0255178b8e75@suse.com>
 <c66af277-f2e0-37ca-4aa3-274d20265ac5@suse.com>
 <b92f1173-c2b4-17b3-021a-fc2df69a40f9@suse.com>
 <5f423603-3c62-39bb-6829-b84ebe2ee4b4@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7cb1d65e-e783-4f7f-bfef-f839213ea5b9@suse.com>
Date: Wed, 11 Sep 2019 17:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5f423603-3c62-39bb-6829-b84ebe2ee4b4@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTc6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMTc6
MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDExLjA5LjE5IDE3OjAxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjA5LjIwMTkgMTU6MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQW5kIHdpdGggdGhlIGlkZWEgdG8gIm1vdW50IiBpdCBpbiB0aGUgZG9tMCBrZXJuZWwncyBz
eXNmcyBJIHRoaW5rCj4+Pj4geGVuc3lzZnMgKG9yIHhlbmh5cGZzPykgc2VlbXMgYXBwcm9wcmlh
dGUuCj4+Pgo+Pj4gV2VsbCwgc3VjaCAibW91bnRpbmciIGlzIGdvaW5nIHRvIGJlIGluZGlyZWN0
LCBJIHdvdWxkIGFzc3VtZT8KPj4+IEkuZS4gbm90IGRpcmVjdGx5IGZvcndhcmQgZmlsZXN5c3Rl
bSBsaWtlIHJlcXVlc3RzIGFzIHN1Y2ggdG8KPj4+IFhlbj8KPj4KPj4gRm9yIHBsYWluIGVudHJp
ZXMgKHJlYWRzIGFuZCBldmVudHVhbGx5IHdyaXRlcykgSSBzdXJlbHkgd291bGQganVzdAo+PiBm
b3J3YXJkIHRoZW0uIEluIGNhc2UgdGhpcyBpcyBwb3NzaWJsZSBmb3IgZGlyZWN0b3JpZXMsIHRv
bywgSSdkIHJhdGhlcgo+PiBkbyBubyBjYWNoaW5nIGluIHRoZSBrZXJuZWwsIHNvIGZvcndhcmRp
bmcgdGhlbSB3b3VsZCBzZWVtIHRvIGJlCj4+IGFwcHJvcHJpYXRlIChyZWplY3RpbmcgYW55dGhp
bmcgYnV0IHJlYWRpbmcgYSBkaXJlY3RvcnksIG9mIGNvdXJzZSkuCj4gCj4gQnV0IHRoYXQncyBz
dGlsbCBhIGtlcm5lbCBiYXNlZCBmaWxlIHN5c3RlbSwgc2ltcGx5IHRha2luZyBpdHMKPiBkYXRh
IGZyb20gWGVuLiBJdCdzIG5vdCBsaWtlIGZpbGUgc3lzdGVtIHJlcXVlc3RzIGFzIHN1Y2ggd291
bGQKPiBiZSBmb3J3YXJkZWQuCgpUcnVlLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
