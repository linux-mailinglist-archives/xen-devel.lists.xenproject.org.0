Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AA109B0
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 16:58:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLqev-0005YD-G6; Wed, 01 May 2019 14:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWPJ=TB=citrix.com=prvs=017aa8cf0=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hLqeu-0005Y8-Ps
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 14:56:32 +0000
X-Inumbo-ID: 4c31bf18-6c21-11e9-821c-fb0971a0c107
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c31bf18-6c21-11e9-821c-fb0971a0c107;
 Wed, 01 May 2019 14:56:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,418,1549929600"; d="scan'208";a="84859903"
To: <xen-devel@lists.xenproject.org>
References: <20190405171342.10902-1-george.dunlap@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <65357ff6-3328-f8e4-7c34-79a9c0d4fe48@citrix.com>
Date: Wed, 1 May 2019 15:56:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190405171342.10902-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 1/2] scripts: Add script to do the
 repetitive bits of the release process
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
Cc: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCk9uIDQvNS8xOSA2OjEzIFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IFdpdGggdGhp
cyBzY3JpcHQsIG9uY2UgdGhlIG1haW4gY2hlY2tzIGFyZSBvdXQgb2YgdGhlIHdheSwgZG9pbmcg
YQo+IHJlbGVhc2UgKGVpdGhlciBhbiBSQyBvciB0aGUgZmluYWwgcmVsZWFzZSkgc2hvdWxkIG1v
c3RseSBiZSBhIG1hdHRlcgo+IG9mIGV4ZWN1dGluZyBhIHNlcXVlbmNlIG9mIDQgY29tbWFuZHMg
Z2l2ZW4gYnkgdGhlIGBoZWxwYCBmdW5jdGlvbiBpbgo+IHRoaXMgc2NyaXB0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiAtLS0K
PiBUaGVyZSdzIG9uZSBoYXJkLWNvZGVkICJkZWZhdWx0IiBwYXRoIGluIGhlcmUgdGhhdCByZWZl
cnMgdG8gbXkgb3duCj4gZGlyZWN0b3J5IHN0cnVjdHVyZS4gIElmIElhbiBmaW5kcyB0aGVzZSBz
Y3JpcHRzIHVzZWZ1bCwgd2Ugc2hvdWxkCj4gcHJvYmFibHkgbW92ZSB0aGF0IHRvIGEgY29weSBv
biBtYWlsLnhlbnByb2plY3Qub3JnIHNvbWV3aGVyZSBpbnN0ZWFkLgo+IAo+IFRoZXJlIGFyZSBh
bHNvIGxvdHMgb2Ygb3Bwb3J0dW5pdGllcyBmb3IgdGhpcyBzY3JpcHQgdG8gYmUgaW1wcm92ZWQs
Cj4gYnkgKGZvciBpbnN0YW5jZSkgaW1wbGVtZW50aW5nIHByb2dyYW1tYXRpYyBjaGVja3MgZm9y
IHRoZSB2YXJpb3VzCj4gY2hlY2tzIGxpc3RlZCBhcyAnbWFudWFsJyBhdCB0aGUgbW9tZW50Lgo+
IAo+IEkgcGxhbiB0byBpbXBsZW1lbnQgY29udGFpbmVyaXplLWFibGUgdGVzdHMgZm9yIHRoZSBm
aXJzdCB0aHJlZSBzdGVwcwo+ICh0YWcsIG1ha2UgdGFyYmFsbCwgcHVzaCB0YWcpLCB1c2luZyAi
ZHVtbXkiIHBhdGhzIGFuZCBncGcga2V5cy4gIEkndmUKPiBtYWRlIHJldmlzaW9ucyB0byB0YXJi
YWxsLWN2cy1jaGVja2luLWFuZC1wb3N0IHdoaWNoIEkgaGF2ZW4ndCBoYWQgdGhlCj4gb3Bwb3J0
dW5pdHkgdG8gdGVzdCB5ZXQ7IGlkZWFzIGZvciBob3cgdG8ga2VlcCB0aGlzICJmcmVzaCIgYXJl
Cj4gd2VsY29tZS4KPiAKPiBDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+
Cj4gLS0tCj4gIHNjcmlwdHMvcmVsZWFzZSB8IDQ1MCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ1MCBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL3JlbGVhc2UKPiAKPiBkaWZmIC0tZ2l0
IGEvc2NyaXB0cy9yZWxlYXNlIGIvc2NyaXB0cy9yZWxlYXNlCj4gbmV3IGZpbGUgbW9kZSAxMDA3
NTUKPiBpbmRleCAwMDAwMDAwMDAwLi4wNDQyY2Q0ZWY5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3NjcmlwdHMvcmVsZWFzZQo+IEBAIC0wLDAgKzEsNDUwIEBACj4gKyMhL2Jpbi9iYXNoCj4gKwo+
ICsjIyMKPiArIyBHZW9yZ2UncyBiYXNoIGxpYnJhcnkgY29yZQo+ICsjIyMKPiArCj4gKyMgYXJn
LXBhcnNlIGRlYnVnCj4gK19hcGQ9ZmFsc2UKPiArCj4gK2FyZ19wYXJzZV9jbWQ9XAo+ICsibG9j
YWwgLWEgYXJnczsKPiArbG9jYWwgX2E7Cj4gK2xvY2FsIF92bjsKPiArbG9jYWwgX207Cj4gK2xv
Y2FsIENMVkw9XCQoKFwkQ0xWTCsxKSkKPiArCj4gK19tPXRydWU7Cj4gKwo+ICtmb3IgX2EgaW4g
XCJcJEBcIiA7IGRvCj4gKyAgICAkX2FwZCAmJiBlY2hvIFwiRXZhbHVhdGluZyBcJHtfYX0gW1sg
XCJcJHtfYS89fVwiID0gXCJcJHtfYX1cIiBdXVwiOwo+ICsgICAgaWYgXCRfbSAmJiBbWyBcIlwk
e19hLz19XCIgIT0gXCJcJHtfYX1cIiBdXSA7IHRoZW4KPiArICAgICAgICAkX2FwZCAmJiBlY2hv
IFBhcmFtZXRlcjsKPiArICAgICAgICBfdm49XCR7X2ElJT0qfTsKPiArICAgICAgICBldmFsIFwi
bG9jYWwgXCRfdm5cIjsKPiArICAgICAgICBldmFsIFwiXCRfYVwiOwo+ICsgICAgZWxpZiBcJF9t
ICYmIFtbIFwiXCR7X2F9XCIgPT0gXCItLVwiIF1dIDsgdGhlbgo+ICsgICAgICAgICRfYXBkICYm
IGVjaG8gU2VwYXJhdG9yOwo+ICsgICAgICAgIF9tPWZhbHNlOwo+ICsgICAgZWxzZQo+ICsgICAg
ICAgICRfYXBkICYmIGVjaG8gQXJndW1lbnQ7Cj4gKyAgICAgICAgX209ZmFsc2U7Cj4gKyAgICAg
ICAgYXJncys9KFwiXCRfYVwiKTsKPiArICAgIGZpOwo+ICtkb25lIgo+ICsKPiArYXJnX3BhcnNl
PSJldmFsICRhcmdfcGFyc2VfY21kIgo+ICsKPiArIyBQYXNzIGluIGVpdGhlciB0aGUgY3VycmVu
dCBmdW5jdGlvbiBuYW1lLCBvciB0aGUgbmFtZSBvZiB0aGUgc2NyaXB0Cj4gK3JlcXVpcmVhcmdz
PSJldmFsIF9mdW5jPVwiXCRGVU5DTkFNRVwiIDsgZXZhbCBbWyAtbiBcXFwiXCRfZnVuY1xcXCIg
XV0gfHwgX2Z1bmM9XCQwIDsgZXZhbCBfcmVxdWlyZS1hcmdzIFwkX2Z1bmMiCj4gKwo+ICtmdW5j
dGlvbiBfcmVxdWlyZS1hcmdzKCkKPiArewo+ICsgICAgbG9jYWwgX2FyZwo+ICsgICAgbG9jYWwg
X2FyZ3MKPiArCj4gKyAgICBfYXJncz0oJEApCj4gKwo+ICsgICAgZm9yIF9hcmcgaW4gJHtfYXJn
c1tAXToxfSA7IGRvCj4gKwlldmFsICJbWyAtbiBcIlwkeyRfYXJnfVwiIF1dIHx8IGZhaWwgXCIk
e19hcmdzWzBdfTogTWlzc2luZyAkX2FyZ1wiIgo+ICsgICAgZG9uZQo+ICt9Cj4gKwo+ICtmdW5j
dGlvbiBkZWZhdWx0KCkKPiArewo+ICsgICAgIyBsMDogZXZhbCBpPSI1Igo+ICsgICAgIyBsMTog
ZGVmYXVsdF9wb3N0PSJldmFsICQxPVwiJDJcIiIKPiArICAgICMgbDM6IGV2YWwgImlmIFtbIC16
IFwiXCQkMVwiIF1dIDsgdGhlbiBkZWZhdWx0X3Bvc3Q9XCJldmFsIFwkMT1cXFwiJDJcXFwiXCIg
OyBmaSIKPiArICAgIGV2YWwgImlmIFtbIC16IFwiXCQkMVwiIF1dIDsgdGhlbiBkZWZhdWx0X3Bv
c3Q9XCJldmFsIGxvY2FsIFwkMT1cXFwiJDJcXFwiXCIgOyBlbHNlIHVuc2V0IGRlZmF1bHRfcG9z
dCA7IGZpIgo+ICt9Cj4gKwo+ICtmdW5jdGlvbiBmYWlsKCkKPiArewo+ICsgICBlY2hvIEZBVEFM
ICRACj4gKyAgIFtbIC1uICIkZmFpbF9jbGVhbnVwIiBdXSAmJiAkZmFpbF9jbGVhbnVwCj4gKyAg
IGV4aXQgMQo+ICt9Cj4gKwo+ICtmdW5jdGlvbiBpbmZvKCkKPiArewo+ICsgICBlY2hvIElORk8g
JENMVkwgJEAgMT4mMgo+ICt9Cj4gKwo+ICtmdW5jdGlvbiBlcnJvcigpCj4gK3sKPiArICAgZWNo
byBFUlJPUiAkQCAxPiYyCj4gK30KPiArCj4gK2Z1bmN0aW9uIHN0YXR1cygpCj4gK3sKPiArICAg
ZWNobyBTVEFUVVMgJENMVkwgJEAgMT4mMgo+ICsgICByZXR1cm4gMAo+ICt9Cj4gKwo+ICtmdW5j
dGlvbiByZXBvcnQtcmVzdWx0KCkKPiArewo+ICsgICAgaWYgW1sgLW4gIiR2YXIiIF1dIDsgdGhl
bgo+ICsJZXZhbCAiJHt2YXJ9PVwiJDFcIiIKPiArICAgIGVsc2UKPiArCWlmIFtbIC1uICIkMSIg
XV0gOyB0aGVuCj4gKwkgICAgZWNobyAiJDEiCj4gKwllbHNlCj4gKwkgICAgZWNobyAiKGVtcHR5
KSIKPiArCWZpCj4gKyAgICBmaQo+ICt9Cj4gKwo+ICtmdW5jdGlvbiBjbWRsaW5lKCkKPiArewo+
ICsgICAgbG9jYWwgY21kOwo+ICsKPiArICAgIGlmIFtbICIkIyIgLWVxICIwIiBdXSA7IHRoZW4K
PiArCWhlbHAKPiArCWV4aXQgMQo+ICsgICAgZmkKPiArCj4gKyAgICAkYXJnX3BhcnNlCj4gKyAg
ICBpbmZvIFJ1bm5pbmcgIiR7YXJnc1swXX0iCj4gKyAgICAiJHthcmdzWzBdfSIgIiR7YXJnc1tA
XToxfSIgfHwgZXhpdCAxCj4gKwo+ICsgICAgaWYgISBbWyAteiAiJFJFVCIgXV0gOyB0aGVuCj4g
KwllY2hvICRSRVQKPiArICAgIGZpCj4gK30KPiArCj4gKyMjIwo+ICsjIHJlbGVhc2Utc3BlY2lm
aWMgY29kZQo+ICsjIyMKPiArCj4gKyMgR2xvYmFsIC8gbWV0YSB2YXJpYWJsZXM6Cj4gKyMKPiAr
IyB0ZGlyOiAicm9vdCIgZGlyZWN0b3J5IHRvIGRvIHRhcmJhbGwgd29yay4KPiArIyByZGlyOiBE
aXJlY3Rvcnkgd2hlcmUgdGFyYmFsbCAmIHNpZyB3aWxsIGJlIHB1dCAoPT0kdGRpci8kdikKPiAr
IyBydGd6OiBCYXNlIGZpbGVuYW1lIGZvciB0YXJiYWxsICgkcmRpci94ZW4tJHYudGFyLmd6KQo+
ICsjCj4gKyMgdjogRnVsbCByZWxlYXNlIHZlcnNpb24gKGUuZy4sIDQuMTIuMC1yYzUsIDQuMTAu
MykKPiArIyB4OiBNYWpvcittaW5vciB4ZW4gcmVsZWFzZSB2ZXJzaW9uIChlLmcuLCA0LjEyLCA0
LjEwKQo+ICsjIHA6IHBvaW50IHJlbGVhc2UgKGUuZy4sIDAgaW4gNC4xMi4wOyAzIGluIDQuMTAu
MykKPiArIyAjcjogTnVtYmVycy1vbmx5IHJlbGVhc2UgKGUuZy4sIDQuMTIuMCwgNC4xMC4zKSAj
IFBST0JBQkxZIE5PVCBORUVERUQKPiArIyByYzogLXJjTgo+ICsjCj4gKyMgczogYnJhbmNoIG5h
bWUgKGUuZy4sIG1hc3Rlciwgc3RhYmxlLTQuMTIsIHN0YWJsZS00LjEwKQo+ICsjIHQ6IFRhZyBm
cm9tIGEgZ2l2ZW4gcmVsZWFzZSAoZS5nLC4gNC4xMi4wLXJjNSwgUkVMRUFTRS00LjEwLjMpCj4g
KyMgaXNyYzogQm9vbGVhbiBpbmRpY2F0aW5nIHdoZXRoZXIgdGhlIHZlcnNpb24gaXMgYW4gcmMg
KGUuZy4sIHRydWUgZm9yIDQuMTIuMC1yYzUsIGZhbHNlIGZvciA0LjEwLjMpCj4gKwo+ICsKPiAr
Cj4gK2Z1bmN0aW9uIHhlbi1tYWtlLXByZWZpeC1jb25maWcoKSB7Cj4gKyAgICAkYXJnX3BhcnNl
Cj4gKwo+ICsgICAgIyBUT0RPOiBQaW5nIGRyYWxsLnVrLnhlbnNvdXJjZS5jb20gdG8gc2VlIGlm
IHdlIGNhbiByZWFjaCBpdD8KPiArICAgIAo+ICsgICAgZGVmYXVsdCBjYWNoZV9wcmVmaXggImdp
dDovL2RyYWxsLnVrLnhlbnNvdXJjZS5jb206OTQxOS8iIDsgJGRlZmF1bHRfcG9zdAo+ICsKPiAr
ICAgIHBlcmwgLW5lICJpZigvXihbQS1aX10rX1VSTCkgXD89IChnaXQuKikvKSB7IHByaW50IFwi
XCQxID89ICR7Y2FjaGVfcHJlZml4fVwkMlxuXCI7IH0iIENvbmZpZy5tayA+PiAuY29uZmlnIHx8
IGZhaWwgIkdlbmVyYXRpbmcgLmNvbmZpZyIKPiArICAgIGNhdCAuY29uZmlnCj4gK30KPiArCj4g
K2Z1bmN0aW9uIHNldC10ZGlyKCkgewo+ICsgICAgaWYgW1sgLXogIiR0ZGlyIiB8fCAhIC1lICIk
dGRpciIgXV0gOyB0aGVuCj4gKwlpbmZvICIkdGRpciBkb2Vzbid0IGV4aXN0LCB1c2luZyAvdG1w
Igo+ICsJdGRpcj0iL3RtcCIKPiArICAgIGZpCj4gK30KPiArCj4gKyMgVGFrZSBgdmAgYW5kIGdl
bmVyYXRlIHRoZSBhcHByb3ByaWF0ZSBtZXRhdmFyaWFibGVzIHZhcmlhYmxlcy4KPiArZnVuY3Rp
b24gcGFyc2UtdmVyc2lvbigpIHsKPiArICAgICRhcmdfcGFyc2UKPiArCj4gKyAgICAkcmVxdWly
ZWFyZ3Mgdgo+ICsKPiArICAgIGlmIFtbIC1uICIkeCIgJiYgLW4gIiRwIiBdXSA7IHRoZW4KPiAr
CWVjaG8gIlZlcnNpb24gYWxyZWFkeSBwYXJzZWQiCj4gKwlyZXR1cm4KPiArICAgIGZpCj4gKwo+
ICsgICAgaWYgW1sgJHYgPX4gKFswLTldK1wuWzAtOV0rKVwuKFswLTldKSgtcmNbMC05XSkgXV0g
OyB0aGVuCj4gKwl4PSR7QkFTSF9SRU1BVENIWzFdfQo+ICsJcD0ke0JBU0hfUkVNQVRDSFsyXX0K
PiArCXJjPSR7QkFTSF9SRU1BVENIWzNdfQo+ICsJaXNyYz10cnVlCj4gKyAgICBlbGlmIFtbICR2
ID1+IChbMC05XStcLlswLTldKylcLihbMC05XSkgXV0gOyB0aGVuCj4gKwl4PSR7QkFTSF9SRU1B
VENIWzFdfQo+ICsJcD0ke0JBU0hfUkVNQVRDSFsyXX0KPiArCWlzcmM9ZmFsc2UKPiArICAgIGVs
c2UKPiArCWZhaWwgIkJhZCB2ZXJzaW9uIgo+ICsgICAgZmkKPiArCj4gKyAgICBpZiAkaXNyYyA7
IHRoZW4KPiArCXQ9JHYKPiArICAgIGVsc2UKPiArCXQ9UkVMRUFTRS0kdgo+ICsgICAgZmkKPiAr
fQo+ICsKPiArZnVuY3Rpb24gY2hlY2soKSB7Cj4gKyAgICAjIFRPRE86IEF1dG9tYXRlIHNvbWUg
b2YgdGhlc2UKPiArICAgIGluZm8gIlBsZWFzZSBwZXJmb3JtIG1hbnVhbGx5OiBBbGwgWFNBcyAg
aGF2ZSBiZWVuIGFwcGxpZWQiCj4gKyAgICBpbmZvICJQbGVhc2UgcGVyZm9ybSBtYW51YWxseTog
Q2hlY2sgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9yZXN1bHRz
L2FsbC1icmFuY2gtc3RhdHVzZXMudHh0Igo+ICsgICAgaW5mbyAiUGxlYXNlIHBlcmZvcm0gbWFu
dWFsbHk6IENoZWNrIHZlcnNpb24gaW4gUkVBRE1FIgo+ICsgICAgaW5mbyAiUGxlYXNlIHBlcmZv
cm0gbWFudWFsbHk6IENoZWNrIHZlcnNpb24gaW4gU1VQUE9SVC5tZCIKPiArICAgIGluZm8gIlBs
ZWFzZSBwZXJmb3JtIG1hbnVhbGx5OiBUYWdzIGZvciBhcHByb3ByaWF0ZSAqX1JFVklTSU9OJ3Mg
aW4gQ29uZmlnLm1rIgo+ICsgICAgaW5mbyAiUGxlYXNlIHBlcmZvcm0gbWFudWFsbHk6IHhlbi9N
YWtlZmlsZTpYRU5fRVhUUkFWRVJTSU9OIHNldCB0byAwIgo+ICsgICAgaW5mbyAiUGxlYXNlIHBl
cmZvcm0gbWFudWFsbHk6IHRvb2xzL1J1bGVzLm1rOiBkZWJ1ZyA/PSBuIgo+ICsgICAgaW5mbyAi
UGxlYXNlIHBlcmZvcm0gbWFudWFsbHk6IHhlbi9LY29uZmlnLmRlYnVnOmNvbmZpZyBERUJVRyBz
aG91bGQgZGVmYXVsdCB0byBgbmAiCj4gK30KPiArCj4gKyMgVXNhZ2U6Cj4gKyMgICB0YWcgdj1b
dmVyc2lvbiB5b3Ugd2FudCB0byByZWxlYXNlXSBbYz1jb21taXRoYXNoXQo+ICsjIGVnLgo+ICsj
ICAgdGFnIHY9NC4xMi4wLXJjNgo+ICsjIE90aGVyIGFyZ3VtZW50czoKPiArIyAga2V5OiAgTmFt
ZSBvZiBrZXkgdG8gc2lnbiB0aGUgY29tbWl0IHdpdGgKPiArIyAgdGRpcjogTmFtZSBvZiB0b3At
bGV2ZWwgdGFyYmFsbCBkaXJlY3RvcnkKPiArZnVuY3Rpb24gdGFnKCkgewo+ICsgICAgJGFyZ19w
YXJzZQo+ICsKPiArICAgIGRlZmF1bHQga2V5ICIyM0UzMjIyQzE0NUY0NDc1RkE4MDYwQTc4M0ZF
MTRDOTU3RTgyQkQ5IjsgJGRlZmF1bHRfcG9zdAo+ICsKPiArICAgICRyZXF1aXJlYXJncyB2Cj4g
Kwo+ICsgICAgc2V0LXRkaXIKPiArCj4gKyAgICAkcmVxdWlyZWFyZ3MgdGRpcgo+ICsKPiArICAg
IHBhcnNlLXZlcnNpb24KPiArCj4gKyAgICAkcmVxdWlyZWFyZ3MgdAo+ICsKPiArICAgIGdpdCBm
ZXRjaCBvcmlnaW4KPiArCj4gKyAgICBpZiBbWyAtbiAiJGMiIF1dIDsgdGhlbgo+ICsJaW5mbyAi
Q2hlY2tpbmcgb3V0IGNvbW1pdCAkYyIKPiArCWdpdCBjaGVja291dCAkYyB8fCBmYWlsCj4gKyAg
ICBlbHNlCj4gKwlsb2NhbCBxCj4gKwlnaXQgY2hlY2tvdXQgc3RhYmxlLSR4IHx8IGZhaWwgIkNv
dWxkbid0IGNoZWNrIG91dCBzdGFibGUgYnJhbmNoIgo+ICsJZ2l0IG1lcmdlIHx8IGZhaWwgIk1l
cmdlIgo+ICsJZ2l0IGxvZyAtbiAxMAo+ICsJcmVhZCAtcCAiRW50ZXIgdG8gY29udGludWUsIGFu
eXRoaW5nIGVsc2UgdG8gcXVpdDogIiBxCj4gKwlbWyAteiAiJHEiIF1dIHx8IHJldHVybgo+ICsg
ICAgZmkKPiArCj4gKyAgICAjIEZJWE1FOiBBZGQgY2hlY2tzOgo+ICsgICAgIyAtIE1ha2Ugc3Vy
ZSBDb25maWcubWsgaGFzIHRhZ3MsIG5vdCBoYXNoZXMKPiArICAgICMgLSBzb25hbWVzPwo+ICsg
ICAgIyAtIEFwcHJvcHJpYXRlIHZlcnNpb24gbnVtYmVycyBpbiBTVVBQT1JULm1kLCB4ZW4vTWFr
ZWZpbGUsICZjCj4gKwo+ICsgICAgZWNobyBnaXQgdGFnIC11ICIka2V5IiAtcyAtbSAiWGVuICR2
IiAkdCA7IHNsZWVwIDEKPiArICAgIGdpdCB0YWcgLXUgIiRrZXkiIC1zIC1tICJYZW4gJHYiICR0
IHx8IGZhaWwgIkNyZWF0aW5nIHNpZ25lZCB0YWciCj4gKwo+ICsgICAgaW5mbyAiUmVsZWFzZSB0
YWdnZWQuICBOb3cgcnVuIHJlbGVhc2UgbWFrZS10YXJiYWxsIHY9JHYiCj4gK30KPiArCj4gK2Z1
bmN0aW9uIHB1c2gtdGFnKCkgewo+ICsgICAgJGFyZ19wYXJzZQo+ICsKPiArICAgICRyZXF1aXJl
YXJncyB2Cj4gKwo+ICsgICAgcGFyc2UtdmVyc2lvbgo+ICsKPiArICAgIGdpdCBwdXNoIG9yaWdp
biAkdCB8fCBmYWlsICJQdXNoaW5nIHRhZyIKPiArICAgICMgRklYTUU6IFRoaXMgaXMgaW4gdGhl
IHJlbGVhc2UgY2hlY2tsaXN0LCBidXQgSSdtIG5vdCBzdXJlIHdoeQo+ICsgICAgIyBnaXQgcHVz
aCBvcmlnaW4gc3RhZ2luZy0keCB8fCBmYWlsICJQdXNoaW5nIHRhZyBjb21taXQiCj4gKwo+ICsg
ICAgaW5mbyAiVGFnIHB1c2hlZC4gIE5vdyBydW4gcmVsZWFzZSB0YXJiYWxsLWN2cy1jaGVja2lu
LWFuZC1wb3N0IHY9JHYiCj4gK30KPiArCj4gK2Z1bmN0aW9uIG1ha2UtdGFyYmFsbC1vbmx5KCkK
PiArewo+ICsgICAgJGFyZ19wYXJzZQo+ICsKPiArICAgICRyZXF1aXJlYXJncyB2IHRkaXIKPiAr
Cj4gKyAgICBwYXJzZS12ZXJzaW9uCj4gKwo+ICsgICAgZ2l0IGZldGNoIHx8IGZhaWwgImdpdCBm
ZXRjaCIKPiArICAgIAo+ICsgICAgZ2l0IGNoZWNrb3V0ICR0IHx8IGZhaWwgIkNoZWNraW5nIG91
dCB0YWcgJHQiCj4gKwo+ICsgICAgZ2l0IGNsZWFuIC1mZmR4Cj4gKwo+ICsgICAgeGVuLW1ha2Ut
cHJlZml4LWNvbmZpZwo+ICsKPiArICAgIC4vY29uZmlndXJlIHx8IGZhaWwgIkNvbmZpZ3VyaW5n
Igo+ICsgICAgCj4gKyAgICBpZiAkaXNyYyA7IHRoZW4KPiArCW1ha2Ugc3JjLXRhcmJhbGwgfHwg
ZmFpbCAiTWFraW5nIHNyYy10YXJiYWxsIgo+ICsgICAgZWxzZQo+ICsJbWFrZSBzcmMtdGFyYmFs
bC1yZWxlYXNlIHx8IGZhaWwgIk1ha2luZyBzcmMtdGFyYmFsbCIKPiArICAgIGZpCj4gKwo+ICsg
ICAgcm0gLXJmICR0ZGlyLyR2Cj4gKwo+ICsgICAgbWtkaXIgLXAgJHRkaXIvJHYgfHwgZmFpbCAi
Q291bGRuJ3QgbWFrZSB0YXJnZXQgZGlyZWN0b3J5Igo+ICsKPiArICAgIGNwIGRpc3QveGVuLSR2
LnRhci5neiAkdGRpci8kdiB8fCBmYWlsICJDb3VsZG4ndCBjb3B5IHRhcmJhbGwiCj4gK30KPiAr
Cj4gK2Z1bmN0aW9uIGJ1aWxkdGVzdC10YXJiYWxsKCkgewo+ICsgICAgJGFyZ19wYXJzZQo+ICsK
PiArICAgIGRlZmF1bHQgYmRpciAiL3RtcCIgOyAkZGVmYXVsdF9wb3N0Cj4gKwo+ICsgICAgJHJl
cXVpcmVhcmdzIHRkaXIgdgo+ICsgICAgCj4gKyAgICBjZCAkYmRpciB8fCBmYWlsICJjZCAkYmRp
ciIKPiArCj4gKyAgICBybSAtcmYgYnVpbGQtJHYKPiArICAgIG1rZGlyIGJ1aWxkLSR2IHx8IGZh
aWwgIm1rZGlyIgo+ICsKPiArICAgIGNkIGJ1aWxkLSR2Cj4gKwo+ICsgICAgdGFyIHhmeiAkdGRp
ci8kdi94ZW4tJHYudGFyLmd6IHx8IGZhaWwgIlVudGFyIgo+ICsKPiArICAgIGNkIHhlbi0kdiB8
fCBmYWlsICJjZCIKPiArCj4gKyAgICB4ZW4tbWFrZS1wcmVmaXgtY29uZmlnCj4gKyAgICBpbmZv
ICJUZXN0aW5nIGJ1aWxkICh0YWlsIC1mICRiZGlyL2J1aWxkLSR2L2xvZy4kdikuLi4iCj4gKyAg
ICAoLi9jb25maWd1cmUgJiYgbWFrZSAtajQgJiYgdG91Y2ggJHRkaXIvJHYvYnVpbGQtdGVzdGVk
ICYmIGVjaG8gT0spIDI+JjEgPiAuLi9sb2cuJHYKPiArCj4gKyAgICBbWyAtZSAkdGRpci8kdi9i
dWlsZC10ZXN0ZWQgXV0gfHwgZmFpbCAiQnVpbGQgZmFpbGVkOyBsb2cgYXQgJGJkaXIvYnVpbGQt
JHYvbG9nLiR2Igo+ICt9Cj4gKwo+ICtmdW5jdGlvbiBzaWduLXRhcmJhbGwoKSB7Cj4gKyAgICAk
YXJnX3BhcnNlCj4gKwo+ICsgICAgJHJlcXVpcmVhcmdzIHYKPiArCj4gKyAgICBpZiBbWyAteiAi
JHJ0Z3oiIF1dIDsgdGhlbgo+ICsJc2V0LXRkaXIKPiArCXJ0Z3o9JHRkaXIvJHYveGVuLSR2LnRh
ci5nego+ICsgICAgZmkKPiArCj4gKyAgICBkZWZhdWx0IGtleSAiMjNFMzIyMkMxNDVGNDQ3NUZB
ODA2MEE3ODNGRTE0Qzk1N0U4MkJEOSIgOyAkZGVmYXVsdF9wb3N0Cj4gKwo+ICsgICAgaWYgISBn
cGcgLS1saXN0LXNlY3JldC1rZXlzIHwgZ3JlcCAka2V5IDsgdGhlbgo+ICsJaW5mbyAiU2lnbmF0
dXJlIHJlcXVpcmVkOyBwbGVhc2UgcnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZCB3aXRoIHRoZSBw
dWJsaWMga2V5IGF2YWlsYWJsZSIKPiArCWluZm8gIiBncGcgLS1kZXRhY2gtc2lnbiAtdSAneGVu
IHRyZWUnICRydGd6Igo+ICsJZXhpdCAwCj4gKyAgICBmaQo+ICsKPiArICAgIGdwZyAtLWRldGFj
aC1zaWduIC11ICRrZXkgJHJ0Z3ogfHwgZmFpbCAiU2lnbmluZyAkcnRneiIKPiArfQo+ICsKPiAr
ZnVuY3Rpb24gdGFyYmFsbC1jaGVja3NpZygpIHsKPiArICAgIGdwZyAtLXZlcmlmeSAkcnRnei5z
aWcgfHwgZmFpbCAiU2lnbmF0dXJlIGZhaWxlZCIKPiArfQo+ICsKPiArZnVuY3Rpb24gbWFrZS10
YXJiYWxsKCkgewo+ICsgICAgbG9jYWwgcmRpcgo+ICsgICAgbG9jYWwgcnRnego+ICsgICAgCj4g
KyAgICAkYXJnX3BhcnNlCj4gKwo+ICsgICAgJHJlcXVpcmVhcmdzIHYKPiArCj4gKyAgICBzZXQt
dGRpcgo+ICsKPiArICAgICRyZXF1aXJlYXJncyB0ZGlyCj4gKwo+ICsgICAgcGFyc2UtdmVyc2lv
bgo+ICsgICAgCj4gKyAgICBpbmZvICJVc2luZyB0YWcgJHQiCj4gKwo+ICsgICAgcmRpcj0kdGRp
ci8kdgo+ICsKPiArICAgIHJ0Z3o9JHJkaXIveGVuLSR2LnRhci5nego+ICsKPiArICAgIGlmIFtb
ICEgLWUgJHJ0Z3ogXV0gOyB0aGVuCj4gKwlpbmZvICIkcnRneiBub3QgcHJlc2VudCwgZ2VuZXJh
dGluZyIKPiArCW1ha2UtdGFyYmFsbC1vbmx5Cj4gKyAgICBmaQo+ICsKPiArICAgIGluZm8gIlRh
cmJhbGwgY3JlYXRlZCIKPiArCj4gKyAgICBpZiBbWyAhIC1lICRyZGlyL2J1aWxkLXRlc3RlZCBd
XSA7IHRoZW4KPiArCWJ1aWxkdGVzdC10YXJiYWxsCj4gKyAgICBmaQo+ICsKPiArICAgIGluZm8g
IkJ1aWxkIHRlc3RlZCIKPiArCj4gKyAgICBpZiBbWyAhIC1lICRydGd6LnNpZyBdXSA7IHRoZW4K
PiArCXNpZ24tdGFyYmFsbAo+ICsgICAgZWxzZQo+ICsJdGFyYmFsbC1jaGVja3NpZwo+ICsgICAg
ZmkKPiArCj4gKyAgICBpbmZvICJUYXJiYWxsIG1hZGUsIHNpZ25lZCwgYW5kIGJ1aWxkLXRlc3Rl
ZC4gIE5vdyBydW4gcmVsZWFzZSBwdXNoLXRhZyB2PSR2Igo+ICt9Cj4gKwo+ICtmdW5jdGlvbiB0
YXJiYWxsLWN2cy1jaGVja2luLWFuZC1wb3N0KCkgewo+ICsgICAgJGFyZ19wYXJzZQo+ICsKPiAr
ICAgICRyZXF1aXJlYXJncyB2Cj4gKwo+ICsgICAgIyBUT0RPOiBUaGlzIHRyZWUgcHJvYmFibHkg
d2FudHMgdG8gYmUgcHV0IHNvbWV3aGVyZSBvbgo+ICsgICAgIyBtYWlsLnhlbnByb2plY3Qub3Jn
Cj4gKyAgICAKPiArICAgIGRlZmF1bHQgY3ZzZGlyICIvYnVpbGQvaGcvcHVzaC94ZW4ub3JnLyIg
OyAkZGVmYXVsdF9wb3N0Cj4gKwo+ICsgICAgaWYgW1sgISAtZSAkY3ZzZGlyIF1dIDsgdGhlbgo+
ICsJZmFpbCAiJGN2c2RpciBkb2VzIG5vdCBleGlzdCIKPiArICAgIGZpCj4gKwo+ICsgICAgaWYg
W1sgLXogIiRydGd6IiBdXSA7IHRoZW4KPiArCXNldC10ZGlyCj4gKwlydGd6PSR0ZGlyLyR2L3hl
bi0kdi50YXIuZ3oKPiArICAgIGZpCj4gKwo+ICsgICAgY2QgJGN2c2RpciB8fCBmYWlsICJjZCIK
PiArCj4gKyAgICBta2RpciAtcCBvc3MteGVuL3JlbGVhc2UvJHYgfHwgZmFpbCAiQ3JlYXRpbmcg
ZGlyZWN0b3J5IGluIENWUyIKPiArCj4gKyAgICBjdnMgYWRkIC1rYiBvc3MteGVuL3JlbGVhc2Uv
JHYvIHx8IGZhaWwgImN2cyBhZGQgcmVsZWFzZSBkaXJlY3RvcnkiCj4gKwo+ICsgICAgY2Qgb3Nz
LXhlbi9yZWxlYXNlLyR2IHx8IGZhaWwgImNkIgo+ICsKPiArICAgIGNwICR0ZGlyLyR2L3hlbi0k
di50YXIuZ3ogLiB8fCBmYWlsICJDb3B5aW5nIHRhcmJhbGwiCj4gKyAgICBjcCAkdGRpci8kdi94
ZW4tJHYudGFyLmd6LnNpZyAuIHx8IGZhaWwgIkNvcHlpbmcgc2lnIgo+ICsgICAgCj4gKyAgICBj
dnMgYWRkIC1rYiB4ZW4tJHYudGFyLmd6IHx8IGZhaWwgImN2cyBhZGQgdGFyYmFsbCIKPiArICAg
IGN2cyBhZGQgLWtiIHhlbi0kdi50YXIuZ3ouc2lnIHx8IGZhaWwgImN2cyBhZGQgc2lnIgo+ICsg
ICAgCj4gKyAgICBjZCAuLi8uLi8uLgo+ICsKPiArICAgIGN2cyBjaSAtbSAkdiB8fCBmYWlsICJj
dnMgY2hlY2tpbiIKPiArCj4gKyAgICBzc2ggbWFpbC54ZW5wcm9qZWN0Lm9yZyAiY2QgL2RhdGEv
ZG93bmxvYWRzLnhlbnByb2plY3Qub3JnL3hlbi5vcmcgJiYgY3ZzIC1xIHVwIC1kIiB8fCBmYWls
ICJEZXBsb3lpbmcgdGFyYmFsbCIKPiArCj4gKyAgICBpbmZvICJUYXJiYWxsIFVwbG9hZGVkLiAg
WGVuIHZlcnNpb24gJHYgcmVsZWFzZWQuIgo+ICt9Cj4gKwo+ICtmdW5jdGlvbiBoZWxwKCkgewo+
ICsgICAgY2F0IDw8RU9GCj4gK0dlbmVyYWwgd29ya2Zsb3c6Cj4gKwo+ICsqIERvIGEgbnVtYmVy
IG9mIHByZS1yZWxlYXNlIHNhbml0eSBjaGVja3MKPiArICByZWxlYXNlIGNoZWNrIHY9NC4xMi4w
LXJjNQo+ICsKPiArKiBUYWcgYW5kIHNpZ24gYSBYZW4gY29tbWl0Cj4gKyAgcmVsZWFzZSB0YWcg
dj00LjEyLjAtcmM1Cj4gKyAgIG9yCj4gKyAgcmVsZWFzZSB0YWcgdj00LjEyLjAtcmM1IGM9MDdj
MTgxYwo+ICsKPiArKiBDcmVhdGUsIHRlc3QsIGFuZCBzaWduIGEgcmVsZWFzZSB0YXJiYWxsCj4g
KyAgcmVsZWFzZSBtYWtlLXRhcmJhbGwgdj00LjEyLjAtcmM1Cj4gKwo+ICsqIFB1c2ggdGFncwo+
ICsgIHJlbGVhc2UgcHVzaC10YWcgdj00LjEyLjAtcmM1Cj4gKwo+ICsqIFB1Ymxpc2ggdGFyYmFs
bAo+ICsgIHJlbGVhc2UgdGFyYmFsbC1jdnMtY2hlY2tpbi1hbmQtcG9zdCB2PTQuMTIuMC1yYzUK
PiArRU9GCj4gK30KPiArCj4gKyMjIwo+ICsjIFRoZSBhY3R1YWwgY29tbWFuZC1saW5lCj4gKyMj
Iwo+ICtjbWRsaW5lICIkQCIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
