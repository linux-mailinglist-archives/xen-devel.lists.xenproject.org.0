Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB8F9171
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:06:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUWlf-0006Do-Ti; Tue, 12 Nov 2019 14:03:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUWle-0006Db-0L
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:03:38 +0000
X-Inumbo-ID: 37ae04ac-0555-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37ae04ac-0555-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 14:03:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCD02B5D7;
 Tue, 12 Nov 2019 14:03:34 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
 <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
 <6ca0c51b-eb61-338f-4592-e7dd6ea3dc61@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17af65cf-fdbe-928e-e018-ee3dad31b59d@suse.com>
Date: Tue, 12 Nov 2019 15:03:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6ca0c51b-eb61-338f-4592-e7dd6ea3dc61@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMjAxOSAxNDozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMS8yMDE5
IDA4OjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMTEuMjAxOSAyMToyNCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+Pj4gKysr
IGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCj4+PiBAQCAtMTA3Nyw3ICsxMDc3LDcgQEAgbG9u
ZyBkb19zZXRfc2VnbWVudF9iYXNlKHVuc2lnbmVkIGludCB3aGljaCwgdW5zaWduZWQgbG9uZyBi
YXNlKQo+Pj4gIH0KPj4+ICAKPj4+ICAKPj4+IC0vKiBSZXR1cm5zIFRSVUUgaWYgZ2l2ZW4gZGVz
Y3JpcHRvciBpcyB2YWxpZCBmb3IgR0RUIG9yIExEVC4gKi8KPj4+ICsvKiBSZXR1cm5zIHRydWUg
aWYgZ2l2ZW4gZGVzY3JpcHRvciBpcyB2YWxpZCBmb3IgR0RUIG9yIExEVC4gKi8KPj4+ICBpbnQg
Y2hlY2tfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3QgZG9tYWluICpkb20sIHNlZ19kZXNjX3QgKmQp
Cj4+IFdvdWxkbid0IGNoYW5nZXMgbGlrZSB0aGlzIG9uZSBiZXR0ZXIgYmUgYWNjb21wYW5pZWQg
YnkgYWxzbyBhZGp1c3RpbmcKPj4gdGhlIHJldHVybiB0eXBlIG9mIHRoZSBmdW5jdGlvbiAodGhl
cmUgYXJlIG1vcmUgZXhhbXBsZXMgZnVydGhlciBkb3duCj4+IGluIGNvbW1vbi90aW1lci5jKT8K
PiAKPiBOby7CoCBUaGF0IGlzIGFuIHVucmVsYXRlZCBjaGFuZ2UuCj4gCj4gSWYgSSB3ZXJlIGZs
dXNoIHdpdGggZnJlZSB0aW1lIHRoZW4gSSBtaWdodCBjb25zaWRlciBkb2luZyB0aGlzIGFuZAo+
IHN1YnN0YW50aWFsbHkgaW5jcmVhc2UgdGhlIHRlc3QgYnVyZGVuLgo+IAo+IEFzIGl0IHN0YW5k
cywgdGhpcyByZXF1ZXN0IGlzIHNjb3BlIGNyZWVwLgoKVGhlIG90aGVyIGFsdGVybmF0aXZlIHdv
dWxkIGhhdmUgYmVlbiB0byBhc2sgZm9yIHNjb3BlIHJlZHVjdGlvbiwKaS5lLiBsZWF2ZSBhbG9u
ZSBzdWNoIGNvbW1lbnRzICh0byBhdm9pZCB0aGUgcmVzdWx0aW5nIHZpc3VhbApkaXNjb25uZWN0
IGJldHdlZW4gY29tbWVudCBhbmQgYWN0dWFsIGRhdGEgdHlwZSkuIEFueXdheSAtIGl0IHdhcwpq
dXN0IGEgcXVlc3Rpb24gSSB3YW50ZWQgdG8gcmFpc2UsIG5vdCBhIHJlcXVlc3QgZm9yIGZ1cnRo
ZXIgd29yawpvbiB5b3VyIHBhcnQuCgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02
NC9lZmliaW5kLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvZWZpYmluZC5o
Cj4+PiBAQCAtMTA3LDcgKzEwNyw3IEBAIHR5cGVkZWYgdWludDY0X3QgICBVSU5UTjsKPj4+ICAj
ZGVmaW5lIFBPU1RfQ09ERShfRGF0YSkKPj4+ICAKPj4+ICAKPj4+IC0jZGVmaW5lIEJSRUFLUE9J
TlQoKSAgICAgICAgd2hpbGUgKFRSVUUpOyAgICAvLyBNYWtlIGl0IGhhbmcgb24gQmlvc1tEYmdd
MzIKPj4+ICsjZGVmaW5lIEJSRUFLUE9JTlQoKSAgICAgICAgd2hpbGUgKHRydWUpOyAgICAvLyBN
YWtlIGl0IGhhbmcgb24gQmlvc1tEYmddMzIKPj4gWW91IGRvIHJlYWxpemUgdGhhdCB0aGlzIGFu
ZCBvdGhlciBFRkkgaGVhZGVycyAoYW5kIHBlcmhhcHMgYWxzbwo+PiBBQ1BJIG9uZXMpIGFyZSBs
YXJnZWx5IHZlcmJhdGltIGltcG9ydHMgZnJvbSBvdGhlciBwcm9qZWN0cywKPj4gdXBkYXRpbmcg
b2Ygd2hpY2ggd2lsbCBiZWNvbWUgbGVzcyBzdHJhaWdodGZvcndhcmQgYnkgc3VjaAo+PiByZXBs
YWNlbWVudHM/IFdoZW4gcHVsbGluZyBpbiB0aGUgRUZJIG9uZXMgSSBpbnRlbnRpb25hbGx5IGRp
ZCBub3QKPj4gZmlkZGxlIHdpdGggdGhlbSBtb3JlIHRoYW4gYWJzb2x1dGVseSBuZWNlc3Nhcnku
Cj4gCj4gWWVzLCBhbmQ/Cj4gCj4gSXQgaXMgdW5hY2NlcHRhYmxlIGZvciB0aGUgYWNwaSBoZWFk
ZXJzIHRvIGZvcmNpYmx5IHJlZGVmaW5lIGFueXRoaW5nIGluCj4gdGhlaXIgc2NvcGUsIGFuZCBp
dHMgZGVmaW5pdGlvbiBvZiB2YV9hcmdzIGlzIGRvd25yaWdodCBkYW5nZXJvdXMuCj4gCj4gQWxs
IGp1bmsgbGlrZSB0aGlzIGluIGhlYWRlciBmaWxlcyBkb2VzIG5vdGhpbmcgYnV0IHdhc3RlIHNw
YWNlIGFuZAo+IGNvbXBpbGVyIGVmZm9ydCBkdXJpbmcgY29tcGlsYXRpb24sIGFuZCBsZWF2ZSBw
ZW9wbGUgd2l0aCBhbiBzbGltIGNoYW5jZQo+IG9mIHNob290aW5nIHRoZW1zZWx2ZXMgaW4gdGhl
IGZvb3QuCgpXZWxsLCBvbiBvbmUgaGFuZCBJJ20gd2l0aCB5b3UuIEJ1dCB0aGVuIEkgZGFyZSB0
byBndWVzcyB0aGF0IHRoZQpwZW9wbGUgaGF2aW5nIHdyaXR0ZW4gdGhlIGhlYWRlcnMgdGhlIHdh
eSB0aGV5IGFyZSBhbHNvIGFyZW4ndApjb21wbGV0ZWx5IHVuLWtub3dsZWRnZWFibGUsIGkuZS4g
ZGlkIHNvIGZvciBhIHJlYXNvbi4gVGhpcyBzZWVtcwooSSdtIHNvcnJ5IHRvIHNheSBpdCB0aGlz
IGJsdW50bHkpIG9uY2UgYWdhaW4gYSBjYXNlIHdoZXJlIHlvdQphcHBlYXIgdG8gbm90IGJlIHdp
bGxpbmcgdG8gYWNjZXB0IG90aGVyIHRoaW5raW5nIHRoYW4geW91ciBvd24uCkl0IGlzIHRoZXJl
Zm9yZSBvbmUgdGhpbmcgdG8gZ2V0IHJpZCBvZiBUUlVFL0ZBTFNFIF9vdXRzaWRlXyBvZgpzdWNo
IGhlYWRlcnMgKHdoZXJlIGl0IHdvdWxkIGJldHRlciBuZXZlciBoYXZlIGJlZW4gaW50cm9kdWNl
ZCksCmFuZCBhbm90aGVyIHRvIG1vZGlmeSB0aGVzZSBtb3JlIG9yIGxlc3MgdmVyYmF0aW0gaW1w
b3J0ZWQgaGVhZGVycwp0aGVtc2VsdmVzLgoKPiBIb3cgbWFueSB0aW1lcyBkbyB0aGVzZSBnZXQg
dG91Y2hlZD/CoCAoUmhldG9yaWNhbCBxdWVzdGlvbi7CoCBUaGUgYW5zd2VyCj4gaXMgb25jZSAo
bWUsIGNsYW5nIGJ1aWxkIGZpeCkgc2luY2UgdGhlaXIgaW50cm9kdWN0aW9uLCA4LCA5IGFuZCAx
MAo+IHllYXJzIGFnbykuCj4gCj4gRm9yIHRoZSAzMHMgb2YgZWZmb3J0IHJlcXVpcmVkIHRvIHR3
ZWFrIG9uY2UtaW4tYS1ibHVlLW1vb24gcGF0Y2hlcwo+IHdoaWNoIHRvdWNoIHRoZXNlIGhlYWRl
cnMsIHRyaW1taW5nIHRoZSBqdW5rIGlzIGEgbm8tYnJhaW5lci4KCldlbGwsIEkgYWdyZWUgdGhh
dCBmb3IganVzdCBfdGhpc18gY2hhbmdlIGl0J3Mgbm90IGEgYmlnIGRlYWwuCkJ1dCBhbnkgc3Vj
aCBhcHByb2FjaCBkb2Vzbid0IHNjYWxlOiBXaGF0IHdlIGFsbG93IG91cnNlbHZlcyB0byBkbwpv
bmNlIHdlIG1heSB0aGVuIGVhc2lseSBhbGxvdyBvdXJzZWx2ZXMgdG8gZG8gYW5vdGhlciB0aW1l
LCBhbmQKdGhlbiBkb3plbnMgbW9yZSB0aW1lcy4gT25jZSB0aGF0IGhhcyBoYXBwZW5lZCwgdGhl
IGVmZm9ydCBuZWVkZWQKdG8gZG8gYSByZS1zeW5jIG1heSBiZWNvbWUgbm9uLW5lZ2xpZ2libGUu
CgpCb3R0b20gbGluZSAtIEknbSBoYWxmIGNvbnZpbmNlZCBhbmQgd2lsbGluZyB0byBnaXZlIG15
IGFjaywgYnV0CkknbSBub3QgY29udmluY2VkIHlvdSB0cnVseSB0aG91Z2h0IHRocm91Z2ggdGhl
IGxvbmdlciB0ZXJtCmNvbnNlcXVlbmNlcy4gSSdkIHRoZXJlZm9yZSBiZSBmYXIgaGFwcGllciB0
byBzZWUgdGhpcyBwYXRjaApzcGxpdCBpbnRvIGEgbm9uLWNvbnRyb3ZlcnNpYWwgcGFydCAoYW55
dGhpbmcgdGhhdCdzIG5vdCB0aWVkIHRvCnRoZSBBQ1BJIGFuZCBFRkkgaGVhZGVyIGltcG9ydHMp
LCBhbiBBQ1BJLCBhbmQgYW4gRUZJIHBhcnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
