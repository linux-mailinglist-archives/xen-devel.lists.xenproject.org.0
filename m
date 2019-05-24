Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFFA29343
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 10:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU5eV-0007s8-LP; Fri, 24 May 2019 08:34:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vjOl=TY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hU5eU-0007s3-03
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 08:34:10 +0000
X-Inumbo-ID: b24676c4-7dfe-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b24676c4-7dfe-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 08:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C00C3AEFE;
 Fri, 24 May 2019 08:34:06 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
 <5CE52014020000780023147E@prv1-mh.provo.novell.com>
 <316af0ff-904b-4cf7-1cb4-08c4ae69c4bd@suse.com>
 <5CE791650200007800231DEA@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 mQENBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAG0H0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT6JATkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPuQENBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAGJAR8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHf4kBrQQY
 AQgAIBYhBIUSZ3Lo9gSUpdCX97DendYovxMvBQJa3fDQAhsCAIEJELDendYovxMvdiAEGRYI
 AB0WIQRTLbB6QfY48x44uB6AXGG7T9hjvgUCWt3w0AAKCRCAXGG7T9hjvk2LAP99B/9FenK/
 1lfifxQmsoOrjbZtzCS6OKxPqOLHaY47BgEAqKKn36YAPpbk09d2GTVetoQJwiylx/Z9/mQI
 CUbQMg1pNQf9EjA1bNcMbnzJCgt0P9Q9wWCLwZa01SnQWFz8Z4HEaKldie+5bHBL5CzVBrLv
 81tqX+/j95llpazzCXZW2sdNL3r8gXqrajSox7LR2rYDGdltAhQuISd2BHrbkQVEWD4hs7iV
 1KQHe2uwXbKlguKPhk5ubZxqwsg/uIHw0qZDk+d0vxjTtO2JD5Jv/CeDgaBX4Emgp0NYs8IC
 UIyKXBtnzwiNv4cX9qKlz2Gyq9b+GdcLYZqMlIBjdCz0yJvgeb3WPNsCOanvbjelDhskx9gd
 6YUUFFqgsLtrKpCNyy203a58g2WosU9k9H+LcheS37Ph2vMVTISMszW9W8gyORSgmw==
Message-ID: <2a816b64-ae01-23e6-d287-1622e55bc295@suse.com>
Date: Fri, 24 May 2019 10:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE791650200007800231DEA@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDUvMjAxOSAwODozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDUuMTkg
YXQgMDc6NDEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyMi8wNS8yMDE5IDEyOjEw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIyLjA1LjE5IGF0IDExOjQ1LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+IEBAIC0zMTg1LDIyICszMTg1LDYgQEAg
c3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KAo+Pj4+ICAKPj4+
PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+Pj4gIAo+Pj4+IC0gICAgLyoKPj4+PiAt
ICAgICAqIFhYWCBEaXNhYmxlIGZvciA0LjEuMDogUFYtb24tSFZNIGRyaXZlcnMgd2lsbCBkbyBn
cmFudC10YWJsZSBvcHMKPj4+PiAtICAgICAqIHN1Y2ggYXMgcXVlcnlfc2l6ZS4gR3JhbnQtdGFi
bGUgY29kZSBjdXJyZW50bHkgZG9lcyBjb3B5X3RvL2Zyb21fZ3Vlc3QKPj4+PiAtICAgICAqIGFj
Y2Vzc2VzIHVuZGVyIHRoZSBiaWcgcGVyLWRvbWFpbiBsb2NrLCB3aGljaCB0aGlzIHRlc3Qgd291
bGQgZGlzYWxsb3cuCj4+Pj4gLSAgICAgKiBUaGUgdGVzdCBpcyBub3QgbmVlZGVkIHVudGlsIHdl
IGltcGxlbWVudCBzbGVlcGluZy1vbi13YWl0cXVldWUgd2hlbgo+Pj4+IC0gICAgICogd2UgYWNj
ZXNzIGEgcGFnZWQtb3V0IGZyYW1lLCBhbmQgdGhhdCdzIHBvc3QgNC4xLjAgbm93Lgo+Pj4+IC0g
ICAgICovCj4+Pj4gLSNpZiAwCj4+Pj4gLSAgICAvKgo+Pj4+IC0gICAgICogSWYgdGhlIHJlcXVp
cmVkIGd1ZXN0IG1lbW9yeSBpcyBwYWdlZCBvdXQsIHRoaXMgZnVuY3Rpb24gbWF5IHNsZWVwLgo+
Pj4+IC0gICAgICogSGVuY2Ugd2UgYmFpbCBpbW1lZGlhdGVseSBpZiBjYWxsZWQgZnJvbSBhdG9t
aWMgY29udGV4dC4KPj4+PiAtICAgICAqLwo+Pj4+IC0gICAgaWYgKCBpbl9hdG9taWMoKSApCj4+
Pj4gLSAgICAgICAgcmV0dXJuIEhWTVRSQU5TX3VuaGFuZGxlYWJsZTsKPj4+PiAtI2VuZGlmCj4+
Pgo+Pj4gRGVhbGluZyB3aXRoIHRoaXMgVE9ETyBpdGVtIGlzIG9mIGNvdXJzZSBtdWNoIGFwcHJl
Y2lhdGVkLCBidXQKPj4+IHNob3VsZCBpdCByZWFsbHkgYmUgZGVsZXRlZCBhbHRvZ2V0aGVyPyBU
aGUgYmlnLWRvbWFpbi1sb2NrIGlzc3VlCj4+PiBpcyBnb25lIGFmYWlyLCBpbiB3aGljaCBjYXNl
IGRyb3BwaW5nIHRoZSAjaWYgMCB3b3VsZCBzZWVtCj4+PiBwb3NzaWJsZSB0byBtZSwgZXZlbiBp
ZiBpdCdzIG5vdCBzdHJpY3RseSBuZWVkZWQgd2l0aG91dCB0aGUgc2xlZXAtCj4+PiBvbi13YWl0
cXVldWUgYmVoYXZpb3IgbWVudGlvbmVkLgo+Pgo+PiBJIGp1c3QgaGFkIGEgbG9vayBhbmQgZm91
bmQgdGhlIGZvbGxvd2luZyBwYXRoOgo+Pgo+PiBkb19kb21jdGwoKSAodGFrZXMgZG9tY3RsX2xv
Y2sgYW5kIGh5cGVyY2FsbF9kZWFkbG9ja19tdXRleCkKPj4gICBhcmNoX2RvX2RvbWN0bCgpCj4+
ICAgICByYXdfY29weV9mcm9tX2d1ZXN0KCkKPj4gICAgICAgY29weV9mcm9tX3VzZXJfaHZtKCkK
Pj4gICAgICAgICBodm1fY29weV9mcm9tX2d1ZXN0X2xpbmVhcigpCj4+ICAgICAgICAgICBfX2h2
bV9jb3B5KCkKPj4KPj4gU28gbm8sIHdlIGNhbid0IGRvIHRoZSBpbl9hdG9taWMoKSB0ZXN0IElN
Ty4KPiAKPiBPaCwgcmlnaHQgLSB0aGF0J3MgYSBQVkggY29uc3RyYWludCB0aGF0IGNvdWxkIHBy
b2JhYmx5IG5vdCBldmVuCj4gYmUgdGhvdWdodCBvZiB0aGF0IHRoZSB0aW1lIHRoZSBjb21tZW50
IHdhcyB3cml0dGVuLiBJJ20gc3RpbGwKPiBvZiB0aGUgb3BpbmlvbiB0aG91Z2ggdGhhdCBhdCBs
ZWFzdCB0aGUgc3RpbGwgYXBwbGljYWJsZSBwYXJ0IG9mCj4gdGhlIGNvbW1lbnQgc2hvdWxkIGJl
IGtlcHQgaW4gcGxhY2UuIFdoZXRoZXIgdGhpcyBtZWFucyBhbHNvCj4ga2VlcGluZyBpbl9hdG9t
aWMoKSBpdHNlbGYgaXMgdGhlbiBhbiBpbmRlcGVuZGVudCBxdWVzdGlvbiwgaS5lLgo+IEkgd291
bGRuJ3QgY29uc2lkZXIgaXQgb3Zlcmx5IGJhZCBpZiB0aGVyZSB3YXMgbm8gaW1wbGVtZW50YXRp
b24KPiBpbiB0aGUgdHJlZSwgYnV0IHRoZSBhYm92ZSBzdGlsbCBzZXJ2ZWQgYXMgZG9jdW1lbnRh
dGlvbiBvZiB3aGF0Cj4gd291bGQgbmVlZCB0byBiZSByZS1hZGRlZC4gU3RpbGwgbXkgcHJlZmVy
ZW5jZSB3b3VsZCBiZSBmb3IgaXQKPiB0byBiZSBrZXB0LgoKV291bGQgeW91IGJlIG9rYXkgd2l0
aCByZXBsYWNpbmcgdGhlIHJlbW92ZWQgc3R1ZmYgYWJvdmUgd2l0aDoKCi8qCiAqIElmIHRoZSBy
ZXF1aXJlZCBndWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0IHRoaXMgZnVuY3Rpb24gbWF5IHNsZWVw
LgogKiBTbyBpbiB0aGVvcnkgd2Ugc2hvdWxkIGJhaWwgb3V0IGlmIGNhbGxlZCBpbiBhdG9taWMg
Y29udGV4dC4KICogVW5mb3J0dW5hdGVseSB0aGlzIGlzIHRydWUgZm9yIFBWSCBkb20wIGRvaW5n
IGRvbWN0bCBjYWxscyB3aGljaAogKiBob2xkcyB0aGUgZG9tY3RsIGxvY2sgd2hlbiBhY2Nlc3Np
bmcgZG9tMCBtZW1vcnkuIE9UT0ggZG9tMCBtZW1vcnkKICogc2hvdWxkIG5ldmVyIGJlIHBhZ2Vk
IG91dCwgc28gd2UgYXJlIGZpbmUgd2l0aG91dCB0ZXN0aW5nIGZvcgogKiBhdG9taWMgY29udGV4
dC4KICovCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
