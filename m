Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8805D415
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:16:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLPC-00087x-FQ; Tue, 02 Jul 2019 16:13:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SKLB=U7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hiLPA-00087s-Pv
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:13:16 +0000
X-Inumbo-ID: 4b1a1c94-9ce4-11e9-96a2-03166ecaca47
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b1a1c94-9ce4-11e9-96a2-03166ecaca47;
 Tue, 02 Jul 2019 16:13:14 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6mDoWHiLVnMfMWsLWpEvC0cKmQM3YJf8dDLOEExch4+c+DPljpaMFDT34C8cvKOu6uFZI/HROs
 Bqmkf1xI6Iq93YnjtIZUoH0qy9DJSc4P5SOb0k3KC23DFzQmXeKdWN67kTbGSfTogXwl2wY66/
 t5k7dFMUoJC7xNBITmcqT0T66vbQu3xbmy9AGDoDSI08P4KOiM13zcnFI+JGincqKR6RLJgvr2
 5h3NomrWXtNBHhyu6X1OOYhef0Dbhlj6GYQucnIiMC3D1o4hPl6oA0WukBvWE2kXjbfBy+xRsX
 xbc=
X-SBRS: 2.7
X-MesageID: 2555719
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2555719"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-40-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABtClBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPokCOgQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86LkCDQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAYkC
 HwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
Message-ID: <9c499d2e-a241-5ebb-b62c-70d189926621@citrix.com>
Date: Tue, 2 Jul 2019 17:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190528103313.1343-40-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 39/60] x86: optimize loading of GDT at
 context switch
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxMTozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbnN0ZWFkIG9mIGR5
bmFtaWNhbGx5IGRlY2lkZSB3aGV0aGVyIHRoZSBwcmV2aW91cyB2Y3B1IHdhcyB1c2luZyBmdWxs
CgoiZGVjaWRpbmciCgo+IG9yIGRlZmF1bHQgR0RUIGp1c3QgYWRkIGEgcGVyY3B1IHZhcmlhYmxl
IGZvciB0aGF0IHB1cnBvc2UuIFRoaXMgYXQKCiJ3YXMgdXNpbmcgYSBmdWxsIG9yIGRlZmF1bHQg
R0RULCBqdXN0IGFkZCIKCj4gb25jZSByZW1vdmVzIHRoZSBuZWVkIGZvciB0ZXN0aW5nIHZjcHVf
aWRzIHRvIGRpZmZlciB0d2ljZS4KPgo+IENhY2hlIHRoZSBuZWVkX2Z1bGxfZ2R0KG5kKSB2YWx1
ZSBpbiBhIGxvY2FsIHZhcmlhYmxlLgoKV2hhdCdzIHRoZSBwb2ludCBvZiBkb2luZyB0aGlzP8Kg
IEkga25vdyB0aGUgbG9naWMgaXMgcmF0aGVyIGNvbXBsaWNhdGVkCmluIF9fY29udGV4dF9zd2l0
Y2goKSwgYnV0IGF0IGxlYXN0IGl0IGlzIHZpc3VhbGx5IGNvbnNpc3RlbnQuwqAgQWZ0ZXIKdGhp
cyBjaGFuZ2UsIGl0IGlzIGFzeW1tZXRyaWMgYW5kIGhhcmRlciB0byBmb2xsb3cuCgo+Cj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gUkZDIFYyOiBuZXcgcGF0
Y2ggKHNwbGl0IGZyb20gcHJldmlvdXMgb25lKQo+IFYxOiBpbml0IHBlcmNwdSBmbGFnIGF0IGNw
dSBzdGFydHVwCj4gICAgIHJlbmFtZSB2YXJpYWJsZSAoSmFuIEJldWxpY2gpCj4gLS0tCj4gIHhl
bi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgIHwgIDMgKysrCj4gIHhlbi9hcmNoL3g4Ni9kb21haW4u
YyAgICAgIHwgMTYgKysrKysrKysrKystLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2Rlc2Mu
aCB8ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJj
aC94ODYvY3B1L2NvbW1vbi5jCj4gaW5kZXggMzNmNWQzMjU1Ny4uOGI5MDM1NmZlNSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2Nw
dS9jb21tb24uYwo+IEBAIC00OSw2ICs0OSw4IEBAIHVuc2lnbmVkIGludCB2YWRkcl9iaXRzIF9f
cmVhZF9tb3N0bHkgPSBWQUREUl9CSVRTOwo+ICBzdGF0aWMgdW5zaWduZWQgaW50IGNsZWFyZWRf
Y2Fwc1tOQ0FQSU5UU107Cj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgZm9yY2VkX2NhcHNbTkNBUElO
VFNdOwo+ICAKPiArREVGSU5FX1BFUl9DUFUoYm9vbCwgZnVsbF9nZHRfbG9hZGVkKTsKPiArCj4g
IHZvaWQgX19pbml0IHNldHVwX2NsZWFyX2NwdV9jYXAodW5zaWduZWQgaW50IGNhcCkKPiAgewo+
ICAJY29uc3QgdWludDMyX3QgKmRmczsKPiBAQCAtNzQ1LDYgKzc0Nyw3IEBAIHZvaWQgbG9hZF9z
eXN0ZW1fdGFibGVzKHZvaWQpCj4gIAkJb2Zmc2V0b2Yoc3RydWN0IHRzc19zdHJ1Y3QsIF9fY2Fj
aGVsaW5lX2ZpbGxlcikgLSAxLAo+ICAJCVNZU19ERVNDX3Rzc19idXN5KTsKPiAgCj4gKyAgICAg
ICAgcGVyX2NwdShmdWxsX2dkdF9sb2FkZWQsIGNwdSkgPSBmYWxzZTsKCkluZGVudGF0aW9uLsKg
IChBbHRob3VnaCBJJ3ZlIGdvdCBoYWxmIGEgbWluZCB0byBkbyBhIGJsYW5rZXQgY29udmVydCBv
ZgpmaWxlcyBsaWtlIHRoaXMgdG8gWGVuIHN0eWxlLsKgIFRoZXkgYXJlIGFsbW9zdCBjb21wbGV0
ZWx5IGRpdmVyZ2VkIGZyb20KdGhlaXIgTGludXggaGVyaXRhZ2UuKQoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
