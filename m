Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE36E734
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:15:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTca-0008KZ-OZ; Fri, 19 Jul 2019 14:12:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoTcZ-0008KU-2k
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:12:27 +0000
X-Inumbo-ID: 3afe04b2-aa2f-11e9-9876-f728a16c217e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3afe04b2-aa2f-11e9-9876-f728a16c217e;
 Fri, 19 Jul 2019 14:12:24 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hk5jSJd5Dn67eXOjwjwZWJIJo/BOz650tlx7WYu2TgCtG/Hf2jC4WPQ58GpbLGhY0OLR2NrZiC
 v3H90hUJ8+wJicaf5MTat2nZgUuIHNmp416nODgXTtzDnht9Mbe4aWRTgye9TII+HXRek9i33d
 KkZo0n1x73GclDihAX/txYkhEiFyVCBR2E4/uGMERV6QER7huhRpQDU+f5VNHh7nDPddSxwLqC
 0oMW6Zz5lg3tO74DZanjJYChX4aEzJIRHisoLFioTvS9nP3q6w12X9B88rEpFDI8ufRLuIIcvf
 7f0=
X-SBRS: 2.7
X-MesageID: 3275893
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3275893"
To: Jan Beulich <JBeulich@suse.com>
References: <3f24285c-b984-1dc5-7783-a1604a966bd0@citrix.com>
 <aefbb38a-430e-e712-e17e-40d6946de5cc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <86602816-bde2-d2a9-b69a-4c37ae578ca2@citrix.com>
Date: Fri, 19 Jul 2019 15:12:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <aefbb38a-430e-e712-e17e-40d6946de5cc@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen backports
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDcvMjAxOSAxNDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTYuMDcuMjAxOSAx
NDoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQnVnZml4ZXM6Cj4+Cj4+IDY1YzE2NWQ2NTk1
ZiAtIHg4Ni94c3RhdGU6IERvbid0IHNwZWNpYWwgY2FzZSBmZWF0dXJlIGNvbGxlY3Rpb24KPj4g
MDEzODk2Y2I4YjJmIC0geDg2L21zcjogRml4IGhhbmRsaW5nIG9mCj4+IE1TUl9BTURfUEFUQ0hM
RVZFTC9NU1JfSUEzMl9VQ09ERV9SRVYKPj4gN2QxNjFmNjUzNzU1IC0geDg2L3N2bTogRml4IHN2
bV92bWNiX2R1bXAoKSB3aGVuIHVzZWQgaW4gY3VycmVudCBjb250ZXh0Cj4+IDliNzU3YmRjMTc5
NCAtIHg4Ni9ib290OiBEb24ndCBsZWFrIHRoZSBtb2R1bGVfbWFwIGFsbG9jYXRpb24gaW4KPj4g
X19zdGFydF94ZW4oKQo+Pgo+PiBUaGUgYmFja3BvcnQgZm9yIHRoZSBtaWNyb2NvZGUgTVNSIGlz
IHJhdGhlciB0cmlja3kgdG8gcmViYXNlIG92ZXIgdGhlCj4+IHg4Nl92ZW5kb3IgYml0bWFwIGNo
YW5nZXMuwqAgSSd2ZSBhbHJlYWR5IGdvdCBpdCBsb2NhbGx5Lgo+IE5vdCBvdmVybHkgdHJpY2t5
IEkgd291bGQgc2F5LCBidXQgcmVxdWlyaW5nIGF0dGVudGlvbi4gV2hpbGUgZG9pbmcKPiB0aGlz
IEkndmUgcnVuIGludG8gdHdvIHF1ZXN0aW9uczoKPgo+IDEpIFdhcyBpdCByZWFsbHkgYSBnb29k
IGlkZWEgdG8gcmVtb3ZlIHRoZSB3cml0ZSB0byB0aGUgTVNSIGFuZCB0aGUKPiBDUFVJRCBpbnZv
Y2F0aW9uIGZyb20gdGhlIHJlYWQgcGF0aD8gVGhlIGNvbW1lbnQgc2F5cyAnQSBndWVzdCBtaWdo
dAo+IGl0c2VsZiBwZXJmb3JtIHRoZSAid3JpdGUgMCwgQ1BVSUQsIHJlYWQiIHNlcXVlbmNlJywg
YnV0IHRoYXQgd29uJ3QKPiBoZWxwIGF0IGFsbCBpZiB0aGUgc3BlY2lmaWMgdkNQVSBnZXRzIHJl
LXNjaGVkdWxlZCBpbiB0aGUgbWlkZGxlLiBBbmQKPiB0aGVyZSBtYXkgbm90IGhhdmUgYmVlbiBh
bnkgdWNvZGUgbG9hZCB3ZSd2ZSBkb25lLCB3aGljaCB3ZSBjb3VsZAo+IHRoZW4gZ3VhcmFudGVl
IHdhcyBmb2xsb3dlZCBieSBhIENQVUlEIGludm9jYXRpb24uCgpZb3UgYXNrZWQgdGhlIHNhbWUg
b24gdGhlIG9yaWdpbmFsIHBhdGNoLsKgIFRoZSAid3JpdGUgMCwgQ1BVSUQiIGlzIGEKYm9kZ2Ug
Zm9yIHRoZSBQNSB3aGljaCBoYWQgdG8gaW50cm9kdWNlIHRoZSBVQ09ERV9SRVYgTVNSIGluIG1p
Y3JvY29kZSwKaW4gYSBjb21wYXRpYmxlIGZhc2hpb24uwqAgVGhlIHdyaXRlIDAgaXMgdW5uZWNl
c3Nhcnkgb24gYWxsIHN1YnNlcXVlbnQKcHJvY2Vzc29ycy4KCkFsbCB0aGF0IG1hdHRlcnMsIGZv
ciBhbnkgQ1BVIFhlbiB3aWxsIGJvb3Qgb24sIGlzIHRoYXQgYSBDUFVJRAppbnN0cnVjdGlvbiBo
YXMgZXhlY3V0ZWQgcHJldmlvdXNseSBvbiB0aGUgY3VycmVudCBDUFUsIHdoaWNoIGlzCmd1YXJh
bnRlZWQgYnkgb3VyIEFQIGJvb3QgbG9naWMsIGV2ZW4gaWYgd2UgaGF2ZW4ndCBleHBsaWNpdGx5
IGxvYWRlZAptaWNyb2NvZGUuCgo+IDIpIFdlIHN0aWxsIGhhdmVuJ3QgZ290IGNvbmZpcm1hdGlv
biB0aGF0IEh5Z29uIGJlaGF2ZXMgdGhlIHNhbWUgdWNvZGUtCj4gd2lzZSwgaGF2ZSB3ZT8KClVu
dGlsIHdlIGdldCBhbiBhbnN3ZXIgdG8gdGhlIHF1ZXN0aW9uLCBJJ20gdHJ1c3QgdHJlYXRpbmcg
SHlnb24gYXMgIm5vCm1pY3JvY29kZSBmYWNpbGl0aWVzIi4KCj4KPj4gRW5oYW5jZW1lbnRzOgo+
Pgo+PiA3ODc2MTlhMDY0MGUgLSB0b29sczogcmUtc3luYyBDUFVJRCBsZWFmIDcgdGFibGVzIChw
ZXJoYXBzIG9ubHkgdGhlCj4+IHhlbi1jcHVpZCBiaXRzLikKPj4gMjYwYWNjNTIxZGI0IC0geDg2
L2NsZWFyX3BhZ2U6IFVwZGF0ZSBjbGVhcl9wYWdlX3NzZTIoKSBhZnRlciBkcm9wcGluZwo+PiAz
MmJpdCBYZW4KPj4gNTY0ZDI2MTY4N2MwIC0geDg2L2N0eHQtc3dpdGNoOiBEb2N1bWVudCBhbmQg
aW1wcm92ZSBHRFQgaGFuZGxpbmcKPiBUaGUgbGFzdCBvbmUgZG9lc24ndCBldmVuIGNvbWUgY2xv
c2UgdG8gYXBwbHlpbmcsIGR1ZSB0byBpdHMgZGVwZW5kZW5jeQo+IG9uIDEyZGNlN2VhNWEuIFdo
aWxlIEkgdGhpbmsgdGhhdCdzIGEgbGl0dGxlIHRvbyBtdWNoLCBJJ3ZlIHN0aWxsCj4gZGVjaWRl
ZCB0byBwdWxsIGluIGJvdGggKGJ1dCBmb3Igbm93IEknbGwgcGVyaGFwcyBkbyB0aGlzIG9ubHkg
Zm9yIDQuMTIpCj4gaW4gYW50aWNpcGF0aW9uIG9mIHVzIHdhbnRpbmcgdG8gYXQgbGVhc3QgY29u
c2lkZXIgYSBiYWNrcG9ydCBvZiB0aGUKPiBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzIChhc3N1bWlu
ZyBpdCB3b24ndCB0YWtlIHRvbyBsb25nIHRvIGdldCBmdWxseQo+IHJlYWR5KS4KPgo+PiBBbHRw
Mm06IFdoaWxlIGFsdHAybSBpc24ndCBzdXBwb3J0ZWQgeWV0LCBpdCB3b3VsZCBiZSB2ZXJ5IGhl
bHBmdWwgdG8KPj4gdHdvIGRvd25zdHJlYW1zIHRvIHRha2UgdGhlc2UgZml4ZXMgd2hpbGUgd2Ug
d29yayBvbiBnZXR0aW5nIGl0IGZ1bGx5Cj4+IHN1cHBvcnRlZC4KPj4KPj4gNDRmM2MzY2RkMzE1
IC0geDg2L2FsdHAybTogdHJlYXQgdmlldyAwIGFzIHRoZSBob3N0cDJtIGluCj4+IHAybV9nZXRf
bWVtX2FjY2VzcygpCj4+IDgyMjg1NzdhZDFiYSAtIHg4Ni9odm06IEZpeCBhbHRwMm1fb3AgaHlw
ZXJjYWxsIGNvbnRpbnVhdGlvbnMKPj4gOWFiY2FjN2ZmMTQ1IC0geDg2L2FsdHAybTogY2xlYW51
cCBwMm1fYWx0cDJtX2xhenlfY29weQo+PiBkZjRlNGNhZmQyOGQgLSB4ODYvYWx0cDJtOiBGaXgg
c3R5bGUgZXJyb3JzIGludHJvZHVjZWQgd2l0aCBjL3MgOWFiY2FjN2ZmCj4gSSdsbCBhcHBseSBh
bGwgb2YgdGhlc2Ugc29vbi4KClRoYW5rcywKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
