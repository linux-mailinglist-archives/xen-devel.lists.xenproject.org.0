Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69520164
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:37:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBq7-0002LJ-VA; Thu, 16 May 2019 08:34:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRBq6-0002KQ-Hi
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:34:10 +0000
X-Inumbo-ID: 5e7e268a-77b5-11e9-9e6e-43036f83f7b6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e7e268a-77b5-11e9-9e6e-43036f83f7b6;
 Thu, 16 May 2019 08:34:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F91BAE27
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:34:06 +0000 (UTC)
To: Olaf Hering <ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516102706.4766f2c3.ohering@suse.com>
 <20190516103033.115ad35d.ohering@suse.com>
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
Message-ID: <50ea0819-2fc1-44a1-1dfc-fe5b1a212f02@suse.com>
Date: Thu, 16 May 2019 10:34:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516103033.115ad35d.ohering@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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

T24gMTYvMDUvMjAxOSAxMDozMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gVGh1LCAxNiBNYXkg
MjAxOSAxMDoyNzowNiArMDIwMAo+IHNjaHJpZWIgT2xhZiBIZXJpbmcgPG9oZXJpbmdAc3VzZS5j
b20+Ogo+IAo+PiBBbSBUaHUsIDE2IE1heSAyMDE5IDEwOjA5OjM4ICswMjAwCj4+IHNjaHJpZWIg
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoKPj4+IEhhcyB0aGlzIHBhdGNoIGV2ZXIg
YmVlbiB0ZXN0ZWQgdG8gd29yaz8gIAo+PiBXaXRoIFBWIG9ubHkuIEkgd2lsbCBoYXZlIGEgbG9v
ay4KPiAKPiBJdCBoYXBwZW5zIHRvIHdvcmsgZm9yIG1lOgo+IHhlbl9jaGFuZ2VzZXQgICAgICAg
ICAgOiAyMDE5LTA1LTE1IDE2OjE5OjU3ICswMTAwIGdpdDoyYTU1NmI2M2EyCj4gCj4gRG9tYWlu
LTAKPiBwdl9zbGUxMnNwMl9jX3Fjb3cyCj4gcHZfc2xlMTJzcDJfY19yYXcKPiBmdl9zbGUxMnNw
Ml9jX3Jhdwo+IGZ2X3NsZTEyc3AyX2NfcWNvdzIKPiAKPiBNYXliZSBJIG1pc3VuZGVyc3RhbmQg
YXNzZXJ0PyBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHRoZSBtZW1iZXIgaXMgbm90IHplcm8u
CgpIbW0sIHJldmVydGluZyB5b3VyIHBhdGNoZXMgbWFrZXMgaXQgd29yayBmb3IgbWUgYWdhaW4u
CgpNeSBkb21haW4gY29uZmlnOgoKbmFtZT0ic2xlczEyc3AyIgpkZXNjcmlwdGlvbj0iTm9uZSIK
dXVpZD0iYzU5YTVjZjQtZGM0MS0xNjJiLThhZTAtODMxNzRmNmQ4N2ViIgptZW1vcnk9MjA0OApt
YXhtZW09MjA0OAp2Y3B1cz0xCm1heHZjcHVzPTQKb25fcG93ZXJvZmY9ImRlc3Ryb3kiCm9uX3Jl
Ym9vdD0icmVzdGFydCIKb25fY3Jhc2g9ImRlc3Ryb3kiCmxvY2FsdGltZT0wCmtleW1hcD0iZW4t
dXMiCnR5cGU9InB2Igpjb25zb2xlPXR0eTAgeGVuLWZiZnJvbnQudmlkZW89MzIsMTAyNCw3Njgi
Cmtlcm5lbD0iL3Vzci9saWIvZ3J1YjIveDg2XzY0LXhlbi9ncnViLnhlbiIKZGlzaz1bICcvaG9t
ZS92bS9pbWFnZXMvc2xlczEyc3AyLHJhdyx4dmRhLHcsYmFja2VuZHR5cGU9cWRpc2snLCBdCnZp
Zj1bICdtYWM9MDA6MTY6M2U6MmE6OWU6ODcsYnJpZGdlPWJyMCcsIF0Kbm9ncmFwaGljPTEKCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
