Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5514DBFE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 14:32:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9tA-0003PX-0C; Thu, 30 Jan 2020 13:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix9t8-0003PS-RY
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 13:29:42 +0000
X-Inumbo-ID: 921c3e8e-4364-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 921c3e8e-4364-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 13:29:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E267CAD85;
 Thu, 30 Jan 2020 13:29:40 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-11-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09ad3bd6-0c4d-d8b0-85c4-c2f5455ffc05@suse.com>
Date: Thu, 30 Jan 2020 14:29:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-11-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 10/12] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gV2Ugd291bGQgbGlr
ZSB0byBjYWxjdWxhdGUgQ0ZMQUdTIG9uY2UgYW5kIGJlZm9yZSBjYWxsaW5nIFJ1bGVzLm1rLAo+
IHNvIHRoZSB2YXJpYWJsZSBDRkxBR1MgbmVlZHMgdG8gaGF2ZSB0aGUgc2FtZSB2YWx1ZSBhY3Jv
c3MgdGhlIHdob2xlCj4gYnVpbGQuIFRodXMgd2UgbmVlZCBhIG5ldyB2YXJpYWJsZSB3aGVyZSBz
b21lIGZsYWdzIGNhbiBjaGFuZ2UKPiBkZXBlbmRpbmcgb24gdGhlIHRhcmdldCBuYW1lLgo+IAo+
IEJvdGggdGhlIGRlcGVuZGVuY3kgYW5kIF9fT0JKRUNUX0ZJTEVfXyBhcmUgc3VjaCBmbGFncyB0
aGF0IGNoYW5nZQo+IGRlcGVuZGluZyBvbiB0aGUgdGFyZ2V0LCBzbyB0aGVyZSBhcmUgbW92ZSBv
dXQgb2YgJChDRkxBR1MpLgoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQ6IEJlaW5nIGEg
ZGVsYXllZCBleHBhbnNpb24gKG9yCiJyZWN1cnNpdmVseSBleHBhbmRlZCIpIHZhcmlhYmxlLCB3
aGF0IHByb2JsZW0gaXMgdGhlcmUgd2hlbiBDRkxBR1MKcmVmZXJlbmNlcyAkQD8gSXMgdGhlcmUg
YSBwbGFuIHRvIGNoYW5nZSB0aGUgdmFyaWFibGUncyBmbGF2b3I/IElmCnNvLCBJJ2QgbGlrZSB0
byBhc2sgZm9yIHRoaXMgdG8gYmUgbWVudGlvbmVkIGhlcmUuICJDYWxjdWxhdGUgb25jZSIsCmF0
IGxlYXN0IHRvIG1lLCBkb2Vzbid0IGltcGx5IHRoaXMuCgo+IEBAIC0xNDEsOSArMTM3LDE2IEBA
IGVuZGlmCj4gICMgQWx3YXlzIGJ1aWxkIG9iai1iaW4gZmlsZXMgYXMgYmluYXJ5IGV2ZW4gaWYg
dGhleSBjb21lIGZyb20gQyBzb3VyY2UuIAo+ICAkKG9iai1iaW4teSk6IENGTEFHUyA6PSAkKGZp
bHRlci1vdXQgLWZsdG8sJChDRkxBR1MpKQo+ICAKPiArY19mbGFncyA9IC1NTUQgLU1GICQoQEQp
Ly4kKEBGKS5kIFwKPiArICAgICAgICAgICQoQ0ZMQUdTKSBcCj4gKyAgICAgICAgICAnLURfX09C
SkVDVF9GSUxFX189IiRAIicKPiArCj4gK2FfZmxhZ3MgPSAtTU1EIC1NRiAkKEBEKS8uJChARiku
ZCBcCj4gKyAgICAgICAgICAkKEFGTEFHUykKCklzIHRoZXJlIGEgcmVhc29uIGJvdGggZ2V0IGV4
dGVuZGVkIG92ZXIgbXVsdGlwbGUgbGluZXM/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL01ha2VmaWxl
Cj4gKysrIGIveGVuL2luY2x1ZGUvTWFrZWZpbGUKPiBAQCAtNjQsNyArNjQsNyBAQCBjb21wYXQv
JS5oOiBjb21wYXQvJS5pIE1ha2VmaWxlICQoQkFTRURJUikvdG9vbHMvY29tcGF0LWJ1aWxkLWhl
YWRlci5weQo+ICAJbXYgLWYgJEAubmV3ICRACj4gIAo+ICBjb21wYXQvJS5pOiBjb21wYXQvJS5j
IE1ha2VmaWxlCj4gLQkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSAtTSUgJS5kIC1p
bmNsdWRlICUvaW5jbHVkZS94ZW4vY29uZmlnLmgsJChDRkxBR1MpKSAkKGNwcGZsYWdzLXkpIC1v
ICRAICQ8Cj4gKwkkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSAtTSUgJS5kIC1pbmNs
dWRlICUvaW5jbHVkZS94ZW4vY29uZmlnLmgsJChjX2ZsYWdzKSkgJChjcHBmbGFncy15KSAtbyAk
QCAkPAoKSSB0aGluayB0aGlzIHdhbnRzIHRvIGNvbnRpbnVlIHRvIHJlZmVyZW5jZSAkKENGTEFH
UykgYW5kIGluc3RlYWQgaGF2ZQp0aGUgLU0lIGFuZCAlLmQgcGF0dGVybnMgZHJvcHBlZC4gU2lt
aWxhcmx5IEkgZ3Vlc3MgYXMtaW5zbiBpbiBDb25maWcubWsKY291bGQgdGhlbiBoYXZlIHRoZXNl
IHR3byBwYXR0ZXJucyBkcm9wcGVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
