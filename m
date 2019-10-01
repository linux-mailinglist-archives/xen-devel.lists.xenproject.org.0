Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D7C4070
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 20:54:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFNFq-0001QZ-P1; Tue, 01 Oct 2019 18:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFNFo-0001QU-NB
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 18:52:08 +0000
X-Inumbo-ID: 912da856-e47c-11e9-9707-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 912da856-e47c-11e9-9707-12813bfff9fa;
 Tue, 01 Oct 2019 18:52:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F97B1000;
 Tue,  1 Oct 2019 11:52:07 -0700 (PDT)
Received: from [10.37.10.143] (unknown [10.37.10.143])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 399213F706;
 Tue,  1 Oct 2019 11:52:05 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20190913103953.8182-1-julien.grall@arm.com>
 <20190916102345.y5sfpzc6s46ox6qx@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <alpine.DEB.2.21.1910011130390.20899@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cf37428b-6a11-635e-0898-0d6a3493e8b3@arm.com>
Date: Tue, 1 Oct 2019 19:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910011130390.20899@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Add Skeleton for using
 configuring early printk using Kconfig
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xLzE5IDc6MzAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDE2IFNlcCAyMDE5LCBXZWkgTGl1IHdyb3RlOgo+PiBPbiBGcmksIFNlcCAxMywgMjAxOSBh
dCAxMTozOTo1M0FNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBBdCB0aGUgbW9tZW50
LCBlYXJseSBwcmludGsgY2FuIG9ubHkgYmUgY29uZmlndXJlZCBvbiB0aGUgbWFrZSBjb21tYW5k
Cj4+PiBsaW5lLiBJdCBpcyBub3QgdmVyeSBoYW5keSBiZWNhdXNlIGEgdXNlciBoYXMgdG8gcmVt
b3ZlIHRoZSBvcHRpb24KPj4+IGV2ZXJ5dGltZSBpdCBpcyB1c2luZyBhbm90aGVyIGNvbW1hbmQg
b3RoZXIgdGhhbiBjb21waWxpbmcgdGhlCj4+PiBoeXBlcnZpc29yLgo+Pj4KPj4+IEZ1cnRoZXJt
b3JlLCBlYXJseSBwcmludGsgaXMgb25lIG9mIHRoZSBmZXcgb2RkcyBvbmUgdGhhdCBhcmUgbm90
IHVzaW5nCj4+PiBLY29uZmlnLgo+Pj4KPj4+IFNvIHRoaXMgaXMgYWJvdXQgdGltZSB0byBtb3Zl
IGl0IHRvIEtjb25maWcuIEZvciBub3csIGEgc2tlbGV0b24gaXMKPj4+IGFkZGVkIHdpdGggb25l
IGV4YW1wbGUgYmFzZWQgb24gQ2FkZW5jZSBVQVJULiBGb2xsb3ctdXAgd2lsbCBjb250aW51ZSB0
bwo+Pj4gY29udmVydCBhbGwgdGhlIG9wdGlvbnMgdG8gS2NvbmZpZy4KPj4+Cj4+PiBCZWNhdXNl
IEtjb25maWcgd2lsbCBwcmVmaXggYWxsIHRoZSBjb25maWcgYnkgQ09ORklHXywgaXQgaXMgbmVj
ZXNzYXJ5Cj4+PiB0byBhZGFwdCB0aGUgZGVmaW5lIHdpdGhpbiB0aGUgY29kZS4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4KPj4+
IC0tLQo+Pj4KPj4+IEkgaGF2ZSBzZW50IGl0IGFzIFJGQyBiZWNhdXNlIHRoaXMgaXMgbm90IGNv
bXBsZXRlLiBJIHdpbGwgY29udmVydCB0aGUKPj4+IHJlc3Qgb25jZSB3ZSBhZ3JlZSB0aGUgYXBw
cm9hY2ggaXMgY29ycmVjdC4KPj4KPj4gSGF2aW5nIGEgdG9wLWxldmVsIEtjb25maWcuZGVidWcg
YW5kIGluY2x1ZGVzIGFyY2ggc3BlY2lmaWMgcnVsZXMgaXMgaG93Cj4+IExpbnV4IGRvZXMgaXQg
KGFsYmVpdCB3aXRoIGRpZmZlcmVudCBkaXJlY3Rvcnkgc3RydWN0dXJlKSwgc28gSSB0aGluawo+
PiB3ZSdyZSBqdXN0IGZvbGxvd2luZyB0aGUgbm9ybSBoZXJlLiBObyBvYmplY3Rpb24gZnJvbSBt
ZS4KPiAKPiBJIGFncmVlCgpJIGtub3cgdGhpcyBpcyBhbiBSRkMsIGJ1dCBkbyB5b3UgYW55IG9w
aW5pb24gb24gdGhlIHJlc3Qgb2YgdGhlIHBhdGNoPyAKSXMgdGhlIGludGVyZmFjZSB3aXRoIHRo
ZSB1c2VyIGdvb2QgZm9yIHlvdT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
