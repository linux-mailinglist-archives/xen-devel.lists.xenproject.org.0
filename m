Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842E141170
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 20:09:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isWxR-0004PN-RM; Fri, 17 Jan 2020 19:07:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Omz=3G=amazon.com=prvs=2780aa402=elnikety@srs-us1.protection.inumbo.net>)
 id 1isWxQ-0004P7-DQ
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 19:07:00 +0000
X-Inumbo-ID: 89d02d07-395c-11ea-b5e7-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89d02d07-395c-11ea-b5e7-12813bfff9fa;
 Fri, 17 Jan 2020 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579288020; x=1610824020;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=V5VKD9zK2JZMJIWB8uMJOsUomszLIdFQ+vEOBFjd6To=;
 b=a3W9YVxFpMmSYXY6e7R/GveHubp6dfI9vf6ksSP8hT24EM1iTJsEKfw8
 W6f4yz94Pa/9SpiQ1nZI20fsgx5vvQ66xPfoNp56DPI6I+oiiUhPrIPD0
 UtFsgy/Y6+V/j+4VUS+yVjjuI/PktGrcF2EGTBuM2PllZUfQ1Yz82muCc A=;
IronPort-SDR: /9wnS2byrTXbOj8HZjhJU6UbXEFJog++H7WkRfzNP4vvSenI2t9r99Ck8Ov6Qbc9WsL+hvAJ+3
 hG/33wVSYzZg==
X-IronPort-AV: E=Sophos;i="5.70,331,1574121600"; d="scan'208";a="12879584"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 17 Jan 2020 19:06:58 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 724F4A1BA0; Fri, 17 Jan 2020 19:06:57 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 19:06:56 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.29) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 19:06:51 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
Date: Fri, 17 Jan 2020 20:06:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.29]
X-ClientProxiedBy: EX13D16UWB004.ant.amazon.com (10.43.161.170) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGlja2luZyB0aGlzIHVwIGFnYWluIGFmdGVyIHRoZSBicmVhay4gQXBvbG9naWVzIGZvciB0aGUg
ZGVsYXkuCgpPbiAyMC4xMi4xOSAxMDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTkuMTIu
MjAxOSAyMjowOCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+IE9uIDE4LjEyLjE5IDEyOjQ5LCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDE4LjEyLjIwMTkgMDI6MzIsIEVzbGFtIEVsbmlrZXR5
IHdyb3RlOgo+Pj4+IERlY291cGxlIHRoZSBtaWNyb2NvZGUgcmVmZXJlbmNpbmcgbWVjaGFuaXNt
IHdoZW4gdXNpbmcgR1JVQiB0byB0aGF0Cj4+Pj4gd2hlbiB1c2luZyBFRkkuIFRoaXMgYWxsb3dz
IHVzIHRvIGF2b2lkIHRoZSAidW5zcGVjaWZpZWQgZWZmZWN0IiBvZgo+Pj4+IHVzaW5nIGA8aW50
ZWdlcj4gfCBzY2FuYCBhbG9uZyB4ZW4uZWZpLgo+Pj4KPj4+IEkgZ3Vlc3MgInVuc3BlY2lmaWVk
IGVmZmVjdCIgaW4gdGhlIGRvYyB3YXMgcHJldHR5IHBvaW50bGVzcyAtIHN1Y2gKPj4+IG9wdGlv
bnMgaGF2ZSBiZWVuIGlnbm9yZWQgYmVmb3JlOyBpbiBmYWN0IC4uLgo+Pj4KPj4+PiBXaXRoIHRo
YXQsIFhlbiBjYW4gZXhwbGljaXRseQo+Pj4+IGlnbm9yZSB0aG9zZSBuYW1lZCBvcHRpb25zIHdo
ZW4gdXNpbmcgRUZJLgo+Pj4KPj4+IC4uLiBJIGRvbid0IHNlZSB0aGluZ3MgYmVjb21pbmcgYW55
IG1vcmUgZXhwbGljaXQgKG5vdCBldmVuIHBhcnNpbmcKPj4+IHRoZSBvcHRpb25zIHdhcyBxdWl0
ZSBleHBsaWNpdCB0byBtZSkuCj4+Pgo+Pgo+PiBJIGFncmVlIHRoYXQgdGhvc2Ugb3B0aW9ucyBo
YXZlIGJlZW4gaWdub3JlZCBzbyBmYXIgaW4gdGhlIGNhc2Ugb2YgRUZJLgo+PiBUaGUgZG9jdW1l
bnRhdGlvbiBjb250cmFkaWN0cyB0aGF0IGhvd2V2ZXIuIFRoZSBkb2N1bWVudGF0aW9uOgo+PiAq
IHNheXMgPGludGVnZXI+IGhhcyB1bnNwZWNpZmllZCBlZmZlY3QuCj4+ICogZG9lcyBub3QgbWVu
dGlvbiBhbnl0aGluZyBhYm91dCBzY2FuIGJlaW5nIGlnbm9yZWQuCj4+Cj4+IFdpdGggdGhpcyBw
YXRjaCwgaXQgaXMgZXhwbGljaXQgaW4gY29kZSBhbmQgaW4gZG9jdW1lbnRhdGlvbiB0aGF0IGJv
dGgKPj4gb3B0aW9ucyBhcmUgaWdub3JlZCBpbiBjYXNlIG9mIEVGSS4KPiAKPiBCdXQgaXNuJ3Qg
aXQgcmF0aGVyIHRoYXQgdWNvZGU9c2NhbiBjb3VsZCAoYW5kIGhlbmNlIHBlcmhhcHMgc2hvdWxk
KQo+IGFsc28gaGF2ZSBpdHMgdmFsdWUgb24gRUZJPwo+IAoKSSBkbyBub3Qgc2VlICJ1Y29kZT1z
Y2FuIiBhcHBsaWNhYmxlIGluIGFueXdheSBpbiB0aGUgY2FzZSBvZiBFRkkuIEluIApFRkksIHRo
ZXJlIGFyZSBub3QgIm1vZHVsZXMiIHRvIHNjYW4gdGhyb3VnaCwgYnV0IHJhdGhlciB0aGUgZWZp
IGNvbmZpZyAKcG9pbnRzIGV4YWN0bHkgdG8gdGhlIG1pY3JvY29kZSBibG9iLgoKPj4+PiAtLS0g
YS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiArKysgYi9kb2NzL21pc2Mv
eGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiBAQCAtMjEyOCw3ICsyMTI4LDEzIEBAIGxvZ2lj
IGFwcGxpZXM6Cj4+Pj4gICAgIyMjIHVjb2RlICh4ODYpCj4+Pj4gICAgPiBgPSBMaXN0IG9mIFsg
PGludGVnZXI+IHwgc2Nhbj08Ym9vbD4sIG5taT08Ym9vbD4gXWAKPj4+PiAgICAKPj4+PiAtU3Bl
Y2lmeSBob3cgYW5kIHdoZXJlIHRvIGZpbmQgQ1BVIG1pY3JvY29kZSB1cGRhdGUgYmxvYi4KPj4+
PiArICAgIEFwcGxpY2FiaWxpdHk6IHg4Ngo+Pj4+ICsgICAgRGVmYXVsdDogYG5taWAKPj4+PiAr
Cj4+Pj4gK0NvbnRyb2xzIGZvciBDUFUgbWljcm9jb2RlIGxvYWRpbmcuIEZvciBlYXJseSBsb2Fk
aW5nLCB0aGlzIHBhcmFtZXRlciBjYW4KPj4+PiArc3BlY2lmeSBob3cgYW5kIHdoZXJlIHRvIGZp
bmQgdGhlIG1pY3JvY29kZSB1cGRhdGUgYmxvYi4gRm9yIGxhdGUgbG9hZGluZywKPj4+PiArdGhp
cyBwYXJhbWV0ZXIgc3BlY2lmaWVzIGlmIHRoZSB1cGRhdGUgaGFwcGVucyB3aXRoaW4gYSBOTUkg
aGFuZGxlciBvciBpbgo+Pj4+ICthIHN0b3BfbWFjaGluZSBjb250ZXh0Lgo+Pj4KPj4+IEl0J3Mg
YWx3YXlzIHN0b3BfbWFjaGluZSBjb250ZXh0LCBpc24ndCBpdD8gSSBhbHNvIGRvbid0IHRoaW5r
IHRoaXMKPj4+IGltcGxlbWVudGF0aW9uIGRldGFpbCBiZWxvbmdzIGhlcmUuCj4+Pgo+Pgo+PiBO
ZWVkcyBhIGJldHRlciB3b3JkaW5nIGluZGVlZC4gTGV0IG1lIGtub3cgaWYgeW91IGhhdmUgcGFy
dGljdWxhcgo+PiBzdWdnZXN0aW9ucywgYW5kIEkgd2lsbCBpbmNvcnBvcmF0ZSBpbiB2My4KPiAK
PiBKdXN0IGRyb3AgZXZlcnl0aGluZyBmcm9tICJvciIgb253YXJkcz8KPiAKCkFjawoKPj4+PiBA
QCAtMTA1LDE2ICsxMDUsMTAgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3Jv
Y29kZV9jYWNoZTsKPj4+PiAgICAKPj4+PiAgICB2b2lkIF9faW5pdCBtaWNyb2NvZGVfc2V0X21v
ZHVsZSh1bnNpZ25lZCBpbnQgaWR4KQo+Pj4+ICAgIHsKPj4+PiAtICAgIHVjb2RlX21vZF9pZHgg
PSBpZHg7Cj4+Pj4gLSAgICB1Y29kZV9tb2RfZm9yY2VkID0gMTsKPj4+PiArICAgIHVjb2RlX21v
ZF9lZmlfaWR4ID0gaWR4Owo+Pj4KPj4+IElzIGl0IGd1YXJhbnRlZWQgKG5vdyBhbmQgZm9yZXZl
cikgdGhhdCB0aGUgaW5kZXggcGFzc2VkIGluIGlzCj4+PiBub24temVybz8gWW91IGNoYW5nZXMg
dG8gbWljcm9jb2RlX2dyYWJfbW9kdWxlKCkgaW1wbHkgc28sIGJ1dAo+Pj4ganVzdCBsb29raW5n
IGF0IHRoZSBjYWxsIHNpdGUgb2YgdGhlIGZ1bmN0aW9uIEkgY2FuJ3QgY29udmluY2UKPj4+IG15
c2VsZiB0aGlzIGlzIHRoZSBjYXNlLiBfSWZfIGl0IGlzICh0aG91Z2h0IHRvIGJlKSBndWFyYW50
ZWVkLAo+Pj4gdGhlbiBJIHRoaW5rIHlvdSBhdCBsZWFzdCB3YW50IHRvIEFTU0VSVCgpIGhlcmUs
IHBlcmhhcHMgd2l0aAo+Pj4gYSBjb21tZW50Lgo+Pj4KPj4KPj4gRm9yIHg4NiwgaXQgc2VlbXMg
d2UgaGF2ZSB0aGF0IGd1YXJhbnRlZSAoZ2l2ZW4gdGhhdCB3ZSBtdXN0IGhhdmUgYQo+PiBkb20w
KS4gUmlnaHQ/Cj4gCj4gRm9yIGZ1bGx5IGJyaW5naW5nIHVwIHRoZSBzeXN0ZW0gLSB5ZXMuIEJ1
dCB0aGVyZSdzIG5vIHJlYXNvbiB0bwo+IGhhdmUgYSBEb20wIGlmIGFsbCB5b3UncmUgYWZ0ZXIg
aXMgdGVzdGluZyBlYXJseSBYZW4gYm9vdC4gVGhlcmUnbGwKPiBiZSBhIHBhbmljKCkgaW4gdGhl
IGNhc2UsIGJ1dCB0aGVyZSBzaG91bGRuJ3QgYmUgYW55dGhpbmcgYnJlYWtpbmcKPiBwcm9wZXIg
YmVoYXZpb3IgcHJpb3IgdG8gdGhpcyBwb2ludC4KPiAKClRoYXQncyBhIHZhbGlkIHBvaW50IGlu
ZGVlZC4gdjMgd2lsbCBoYW5kbGUgaW5kZXggYmVpbmcgemVyby4KCj4+Pj4gICAgfQo+Pj4+ICAg
IAo+Pj4+IC0vKgo+Pj4+IC0gKiBUaGUgZm9ybWF0IGlzICdbPGludGVnZXI+fHNjYW49PGJvb2w+
LCBubWk9PGJvb2w+XScuIEJvdGggb3B0aW9ucyBhcmUKPj4+PiAtICogb3B0aW9uYWwuIElmIHRo
ZSBFRkkgaGFzIGZvcmNlZCB3aGljaCBvZiB0aGUgbXVsdGlib290IHBheWxvYWRzIGlzIHRvIGJl
Cj4+Pj4gLSAqIHVzZWQsIG9ubHkgbm1pPTxib29sPiBpcyBwYXJzZWQuCj4+Pj4gLSAqLwo+Pj4+
IC1zdGF0aWMgaW50IF9faW5pdCBwYXJzZV91Y29kZShjb25zdCBjaGFyICpzKQo+Pj4+ICtzdGF0
aWMgaW50IF9faW5pdCBwYXJzZV91Y29kZV9wYXJhbShjb25zdCBjaGFyICpzKQo+Pj4KPj4+IEFu
eSBwYXJ0aWN1bGFyIHJlYXNvbiBmb3IgdGhlIHJlbmFtaW5nPyBUaGUgZnVuY3Rpb24gbmFtZSB3
YXMgcXVpdGUKPj4+IGZpbmUgaW1vLgo+Pj4KPj4KPj4gVG8gbWUsICJwYXJzZV91Y29kZSIgaXMg
YSBtaXNub21lci4KPiAKPiBXZWxsLCBwYXJzZV8idWNvZGU9IGlzbid0IGEgdmFsaWQgaWRlbnRp
Zmllci4gcGFyc2VfdWNvZGUgaXMgd2hhdAo+IHJlc3VsdHMgd2hlbiBzdHJpcHBpbmcgZXZlcnl0
aGluZyB0aGF0IG1ha2VzIGl0IGludmFsaWQuIEkgY2FuCj4gc2VlIHRoZSBhbWJpZ3VpdHkgd2l0
aCBwYXJzaW5nIGFjdHVhbCB1Y29kZSwgYnV0IHRoZSBjb250ZXh0IGhlcmUKPiBtYWtlcyBpdCBw
cmV0dHkgY2xlYXIgd2hhdCB0aGUgZnVuY3Rpb24gaXMgYWJvdXQuIFBlcnNvbmFsbHkgSSdkCj4g
cHJlZmVyIHN1Y2ggdW5uZWNlc3NhcnkgcmVuYW1lcyB0byBiZSBhdm9pZGVkLgoKQWNrCgotLSBF
c2xhbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
