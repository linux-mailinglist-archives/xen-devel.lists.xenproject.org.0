Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8410351A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 08:22:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXKGN-0005Pa-Cx; Wed, 20 Nov 2019 07:18:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXKGM-0005PV-FS
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 07:18:54 +0000
X-Inumbo-ID: 012506d0-0b66-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 012506d0-0b66-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 07:18:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C29A8B237;
 Wed, 20 Nov 2019 07:18:51 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d66b1da4-8096-9b77-1ca6-d6b9954b113c@suse.com>
 <09359c00-5769-0e0d-4af9-963897d3b498@suse.com>
 <40267a5b-8f1b-6463-72cd-f8f354c58bc4@oracle.com>
 <6d70b8e0-7acd-d8ea-fa41-6866ae1ffef9@oracle.com>
 <b308b5ab-7b25-414a-6153-8c4f70b1c6a1@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c35e9f9-d46a-b15e-84b0-b6018fbef6e7@suse.com>
Date: Wed, 20 Nov 2019 08:18:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b308b5ab-7b25-414a-6153-8c4f70b1c6a1@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH 0/2] x86/Xen/32: xen_iret_crit_fixup
 adjustments
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAwMzozOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDExLzE5LzE5
IDk6MTcgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMTEvMTkvMTkgMTI6NTAgUE0s
IEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDExLzE5LzE5IDc6NTggQU0sIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+IE9uIDExLjExLjIwMTkgMTU6MzAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4+PiBUaGUgZmlyc3QgcGF0Y2ggaGVyZSBmaXhlcyBhbm90aGVyIHJlZ3Jlc3Npb24gZnJvbSAz
Yzg4YzY5MmMyODcKPj4+Pj4gKCJ4ODYvc3RhY2tmcmFtZS8zMjogUHJvdmlkZSBjb25zaXN0ZW50
IHB0X3JlZ3MiKSwgYmVzaWRlcyB0aGUKPj4+Pj4gb25lIGFscmVhZHkgYWRkcmVzc2VkIGJ5Cj4+
Pj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwv
MjAxOS0xMC9tc2cwMTk4OC5odG1sLgo+Pj4+PiBUaGUgc2Vjb25kIHBhdGNoIGlzIGEgbWluaW1h
bCBiaXQgb2YgY2xlYW51cCBvbiB0b3AuCj4+Pj4+Cj4+Pj4+IDE6IG1ha2UgeGVuX2lyZXRfY3Jp
dF9maXh1cCBpbmRlcGVuZGVudCBvZiBmcmFtZSBsYXlvdXQKPj4+Pj4gMjogc2ltcGxpZnkgeGVu
X2lyZXRfY3JpdF9maXh1cCdzIHJpbmcgY2hlY2sKPj4+PiBTZWVpbmcgdGhhdCB0aGUgb3RoZXIg
cmVncmVzc2lvbiBmaXggaGFzIGJlZW4gdGFrZW4gaW50byAtdGlwLAo+Pj4+IHdoYXQgaXMgdGhl
IHNpdHVhdGlvbiBoZXJlPyBTaG91bGQgNS40IHJlYWxseSBzaGlwIHdpdGggdGhpcwo+Pj4+IHN0
aWxsIHVuZml4ZWQ/Cj4+PiBJIGFtIHN0aWxsIHVuYWJsZSB0byBib290IGEgMzItYml0IGd1ZXN0
IHdpdGggdGhvc2UgcGF0Y2hlcywgY3Jhc2hpbmcgaW4KPj4+IGludDNfZXhjZXB0aW9uX25vdGlm
eSB3aXRoIHJlZ3MtPnNwIHplcm8uCj4+Pgo+Pj4gV2hlbiBJIHJldmVydCB0byAzYzg4YzY5MmMy
ODcgdGhlIGd1ZXN0IGFjdHVhbGx5IGJvb3RzIHNvIG15ICg/KSBwcm9ibGVtCj4+PiB3YXMgaW50
cm9kdWNlZCBzb21ld2hlcmUgaW4tYmV0d2Vlbi4KPj4gTmV2ZXJtaW5kIHRoaXMuIEkgZGlkbid0
IHJlYWQgeW91ciBwYXRjaGVzIGNvcnJlY3RseS4KPiAKPiBCVFcsIEknZCByYXRoZXIgdGhpcyBu
b3QgZ28gaW50byA1LjQgdGhpcyBsYXRlLiAzYzg4YzY5MmMyODcgaGFzIGJlZW4KPiB0aGVyZSBz
aW5jZSA1LjIgYW5kIG5vb25lIGNvbXBsYWluZWQuCgpBZmFpY3QgdGhlIGlzc3VlcyB3ZXJlIGlu
dHJvZHVjZWQgaW4gNS4zLCBhbmQgbXkgZmlyc3QgcGF0Y2ggKGluY2x1ZGluZwphIG5vdGUgW2Nv
bXBsYWludCBpZiB5b3Ugd2lsbF0gb2YgdGhlIHNlY29uZCBpc3N1ZSkgd2FzIHNlbnQgYXJvdW5k
CjUuNC1yYzIuIFRoaXMgaGFzIGJlZW4gYmxvY2tpbmcgb3NzdGVzdCdzIGxpbnV4LWxpbnVzIGZv
cmV2ZXIgc2luY2UsIHNvCmV2ZW4gd2l0aG91dCBteSBtYWlsIGV2ZXJ5b25lIGNvdWxkIGhhdmUg
YmVlbiBhd2FyZSBieSBwYXlpbmcgYXR0ZW50aW9uCnRvIHRoZSBmbGlnaHQgcmVwb3J0cyAodGhl
IGJpc2VjdGlvbiBvbmVzLCB1bmZvcnR1bmF0ZWx5LCBhcmUgcHJldHR5CnVzZWxlc3MgaGVyZSwg
YXMgaW4gY2FzZXMgbGlrZSB0aGlzIG9uZSB0aGV5IHNlZW0gdG8gdGVuZCB0byBwb2ludCBhdApo
dWdlIG1lcmdlIGNvbW1pdHMpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
