Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB7132BF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXg-00083Y-10; Fri, 03 May 2019 17:00:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXe-000839-NS
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:10 +0000
X-Inumbo-ID: e81792a7-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e81792a7-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085342"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:55 +0100
Message-ID: <20190503165957.5960-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 09/11] mg-repro-flight: Provide
 --rebuild to make variant build jobs too
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhbGxvd3MgYSBzaW5nbGUgY29tbWFuZCB0byByZXBybyBhIHBhcnRpY3VsYXIgam9iIHdp
dGggYSB2YXJpZXR5Cm9mIGRpZmZlcmVudCBzb3VyY2UgY29kZS4KClRoZSBpbXBsZW1lbnRhdGlv
biB0ZWNobmlxdWUgaXM6CiAgLSBydW4gdGhlIGJ1aWxkIGpvYiBpbiBhIHNlcGFyYXRlIGZsaWdo
dCwgc28gdGhhdCBpdCBjYW4gcnVuCiAgICB3aXRoIGEgc2VwYXJhdGUgdGFzayB3aGljaCBnaXZl
cyBpdHMgaG9zdCB1cCBhZnRlciB0aGUgYnVpbGQKICAtIGRvIG11Y2ggb2YgdGhlIGhlYXZ5IGxp
ZnRpbmcgb2YgcnVudmFyIGZpZGRsaW5nIGV0Yy4gaW4KICAgIGEgbmV3IGhlbHBlciByb3V0aW5l
IGluIGNzLWFkanVzdC1mbGlnaHQKClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KdjI6IEFkZCBhIG1pc3NpbmcgYGNvbnRpbnVlJyAod2l0
aG91dCB3aGljaCBldmVyeXRoaW5nIGdvZXMgcXVpdGUgd3JvbmcpCi0tLQogY3MtYWRqdXN0LWZs
aWdodCB8IDEwOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiBtZy1yZXByby1zZXR1cCAgIHwgIDg1ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTkzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9jcy1hZGp1c3QtZmxpZ2h0IGIvY3MtYWRqdXN0
LWZsaWdodAppbmRleCBjYzE2ODRiNC4uNWJlNWFmMzggMTAwNzU1Ci0tLSBhL2NzLWFkanVzdC1m
bGlnaHQKKysrIGIvY3MtYWRqdXN0LWZsaWdodApAQCAtNDY5LDYgKzQ2OSwxMTUgQEAgRU5ECiAJ
JHJ1bnZhcnEtPmV4ZWN1dGUoJG5ld2pvYiwgJGRzdGZsaWdodCwgJG9sZGpvYik7CiAgICAgfSkK
IH0KKworc3ViIGNoYW5nZV9fcmVwcm9fYnVpbGRqb2JzIHsKKyAgICAjIGhlbHBlciBmb3IgbWct
cmVwcm8tc2V0dXAKKyAgICAjIGFyZ3VtZW50cyB0byB0aGlzIGNoYW5nZSBhcmUKKyAgICAjICAg
IEVYQU1QTEUtRkxJR0hUIEVYQU1QTEUtSk9CIFRISU5HLi4uCisgICAgIyB3aGVyZSBUSElORyBp
cworICAgICMgICAgLkJVSUxESk9CID1CVUlMREpPQlJVTlZBUiArVFJFRT1VUkwjUkVWSVNJT04K
KyAgICAjICh3ZSBlYXQgYWxsIHVudGlsIGl0IGRvZXNuJ3Qgc3RhcnQgd2l0aCAuID0gKykKKyAg
ICAjIHN0ZG91dCBvdXRwdXQgaXMKKyAgICAjICAgIGxpc3Qgb2YgcnVudmFyIHNldHRpbmdzIGZv
ciByZXBybyBqb2IKKyAgICBkaWUgdW5sZXNzIEBjaGFuZ2VzID49IDI7CisgICAgbXkgJGVmbGln
aHQgPSBzaGlmdCBAY2hhbmdlczsKKyAgICBteSAkZWpvYiA9IHNoaWZ0IEBjaGFuZ2VzOworICAg
IG15IEByZWZzcGVjczsKKyAgICBteSBAdmFyc3BlY3M7CisgICAgbXkgJXRyZWVzcGVjczsKKyAg
ICB3aGlsZSAoQGNoYW5nZXMgJiYgJGNoYW5nZXNbMF0gPX4gbS9eWy49K10vKSB7CisJbG9jYWwg
JF8gPSBzaGlmdCBAY2hhbmdlczsKKwlpZiAobS9eWy49XS8pIHsKKwkgICAgcHVzaCBAcmVmc3Bl
Y3MsICRfOworCX0gZWxzaWYgKG0vXlwrKC4qPylcPSguKilcIyguKikkLykgeworCSAgICBkaWUg
JDEgaWYgJHRyZWVzcGVjc3skMX07CisJICAgICR0cmVlc3BlY3N7JDF9ID0gWyQyLCQzXTsKKwl9
IGVsc2lmIChtL14tci8pIHsKKwkgICAgcHVzaCBAdmFyc3BlY3MsICRfOworCX0gZWxzZSB7CisJ
ICAgIGRpZSAiYmFkIC5CVUlMREpPQiAvID1CVUlMREpPQlJVTlZBUiAvICtUUkVFPVVSTCNSRVZJ
U0lPTik6ICRfXG4iOworCX0KKyAgICB9CisgICAgbXkgJHRlc3RxID0gZGJfcHJlcGFyZSg8PEVO
RCk7CitTRUxFQ1QgbmFtZSwgdmFsIEZST00gcnVudmFycyBXSEVSRSBmbGlnaHQ9PyBBTkQgam9i
PT8gQU5EIG5hbWUgbGlrZSAnJWpvYic7CitFTkQKKyAgICBteSAkYnVpbGRxX3R4dCA9IDw8RU5E
OworU0VMRUNUIG5hbWUgRlJPTSBydW52YXJzIFdIRVJFIGZsaWdodD0/IEFORCBqb2I9PyBBTkQg
KCdmJworRU5ECisgICAgbXkgQGJ1aWxkcV94dmFyczsKKyAgICBmb3JlYWNoIG15ICR0IChzb3J0
IGtleXMgJXRyZWVzcGVjcykgeworCSRidWlsZHFfdHh0IC49ICIgT1IgbmFtZT0/IjsKKwlwdXNo
IEBidWlsZHFfeHZhcnMsICJ0cmVlXyR0IjsKKyAgICB9CisgICAgJGJ1aWxkcV90eHQgLj0gIiki
OworICAgIG15ICRidWlsZHEgPSBkYl9wcmVwYXJlKCRidWlsZHFfdHh0KTsKKworICAgIG15ICVi
am9iczsKKworICAgICR0ZXN0cS0+ZXhlY3V0ZSgkZWZsaWdodCwgJGVqb2IpOworICAgIHdoaWxl
IChteSAoJHJlZnZhciwgJGJqb2JyZWYpID0gJHRlc3RxLT5mZXRjaHJvd19hcnJheSgpKSB7CisJ
bXkgKCRiZmxpZ2h0LCAkYmpvYikgPSBmbGlnaHRfb3RoZXJqb2IoJGVmbGlnaHQsJGJqb2JyZWYp
OworCWlmIChAcmVmc3BlY3MpIHsKKwkgICAgbXkgJHkgPSAwOworCSAgICBmb3JlYWNoIG15ICRy
cyAoQHJlZnNwZWNzKSB7CisJCWlmICgkcnMgZXEgIi4kYmpvYiIgfHwgJHJzIGVxICI9JHJlZnZh
ciIpIHsKKwkJICAgICR5ID0gMTsKKwkJICAgIGxhc3Q7CisJCX0KKwkgICAgfQorCSAgICBuZXh0
IHVubGVzcyAkeTsKKwl9CisJJGJ1aWxkcS0+ZXhlY3V0ZSgkYmZsaWdodCwkYmpvYixAYnVpbGRx
X3h2YXJzKTsKKwlteSAlZ290OworCXdoaWxlIChteSAoJHRyZWV2YXIpID0gJGJ1aWxkcS0+ZmV0
Y2hyb3dfYXJyYXkoKSkgeworCSAgICAkdHJlZXZhciA9fiBtL150cmVlXy8gb3IgZGllICIkdHJl
ZXZhciA/IjsKKwkgICAgJGdvdHskJ30gPSAxOworCSAgICBuZXh0IHVubGVzcyAkdHJlZXNwZWNz
eyQnfTsKKwkgICAgJHRyZWVzcGVjc3skJ31bMl0rKzsKKwl9CisJbmV4dCB1bmxlc3MgJWdvdCB8
fCBAcmVmc3BlY3M7CisKKwkkYmpvYnN7JGJqb2J9IC8vPSB7IFRlbXBsYXRlID0+ICRiZmxpZ2h0
IH07CisJJGJqb2JzeyRiam9ifXtUZW1wbGF0ZX0gZXEgJGJmbGlnaHQgb3IKKwkgICAgZGllICJp
bmNvbnNpc3RlbnQgJGJqb2I6ICRiam9ic3skYmpvYn17VGVtcGxhdGV9ICE9ICRiZmxpZ2h0IjsK
KwlwdXNoIEB7ICRiam9ic3skYmpvYn17UmVmc30gfSwgJHJlZnZhcjsKKwkkYmpvYnN7JGJqb2J9
e1RyZWVzfXskX30gPSAxIGZvcmVhY2gga2V5cyAlZ290OworICAgIH0KKworICAgIGZvcmVhY2gg
bXkgJHRyZWUgKHNvcnQga2V5cyAldHJlZXNwZWNzKSB7CisJZGllICJ1bnVzZWQgdHJlZS9yZXZp
c2lvbiBhZGp1c3RtZW50ICR0cmVlIgorCSAgICAuKEByZWZzcGVjcworICAgICAgICAgICAgICA/
ICIgKG5vIHRyZWVfJHRyZWUgdmFyIGluIGFueSBvZiAiCisgICAgICAgICAgICAgIC4oam9pbiAn
ICcsIG1hcCB7ICIkYmpvYnN7JF99e1RlbXBsYXRlfS4kXyIgfQorICAgICAgICAgICAgICAgIHNv
cnQga2V5cyAlYmpvYnMpLiIpIgorICAgICAgICAgICAgICA6ICcnKQorICAgICAgICAgICAgdW5s
ZXNzICR0cmVlc3BlY3N7JHRyZWV9WzJdOworICAgIH0KKworICAgIG15IEBjb3B5X2pvYnNfcXMg
PSBjb3B5X2pvYnNfcXMoKTsKKyAgICBmb3JlYWNoIG15ICRiam9iIChzb3J0IGtleXMgJWJqb2Jz
KSB7CisJY29weV9qb2JzX2RvKFxAY29weV9qb2JzX3FzLCAkYmpvYnN7JGJqb2J9e1RlbXBsYXRl
fSwgJGJqb2IpOworCWZvcmVhY2ggbXkgJHRyZWUgKHNvcnQga2V5cyAleyAkYmpvYnN7JGJqb2J9
e1RyZWVzfSB9KSB7CisJICAgIHJ1bnZhcl9zZXQoJGJqb2IsICJ0cmVlXyR0cmVlIiwgICAgICR0
cmVlc3BlY3N7JHRyZWV9WzBdKTsKKwkgICAgcnVudmFyX3NldCgkYmpvYiwgInJldmlzaW9uXyR0
cmVlIiwgJHRyZWVzcGVjc3skdHJlZX1bMV0pOworCX0KKwlmb3JlYWNoIChAdmFyc3BlY3MpIHsK
KwkgICAgaWYgKG0vXi1yIXxeLXJeLykgeworCQkkcnVudmFyX3JtX3EtPmV4ZWN1dGUoJGRzdGZs
aWdodCwgJGJqb2IsICQnKTsKKwkgICAgfSBlbHNpZiAobS9eLXIoLio/KT0vKSB7CisJCXJ1bnZh
cl9zZXQoJGJqb2IsICQxLCAkJyk7CisJICAgIH0gZWxzZSB7CisJCWRpZSAiYmFkIC1yICRfID8i
OworCSAgICB9CisJfQorCWZvcmVhY2ggbXkgJHJlZnZhciAoQHsgJGJqb2JzeyRiam9ifXtSZWZz
fSB9KSB7CisJICAgIGRpZSAiJGJqb2IgJHJlZnZhciAkJiA/IiBpZgorICAgICAgICAgICAgICAg
ICIkYmpvYi4kcmVmdmFyIiA9fiBte1teKz1fLi8sOjAtOWEtei1dfWk7CisJICAgIHByaW50ICJy
dW52YXItc2V0IC4gJHJlZnZhciAkZHN0ZmxpZ2h0LiRiam9iXG4iIG9yIGRpZSAkITsKKwl9Cisg
ICAgfQorfQorCiBzdWIgY2hhbmdlcyAoKSB7CiAgICAgZGVidWcoIkNIQU5HRVMuLi5cbiIpOwog
CmRpZmYgLS1naXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNldHVwCmluZGV4IDJlMWQz
Yjg4Li43ZjA3NWY0ZSAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAKKysrIGIvbWctcmVwcm8t
c2V0dXAKQEAgLTE5LDcgKzE5LDcgQEAKIAogdXNhZ2UgKCkgeyBjYXQgPDxFTkQKIAotLi9tZy1y
ZXByby1zZXR1cCBbT1BUSU9OLi4uXSBFWEFNUExFLUZMSUdIVCBKT0IgVEVTVElEIFtIT1NUU1BF
Qy4uLl0KKy4vbWctcmVwcm8tc2V0dXAgW09QVElPTi4uLl0gRVhBTVBMRS1GTElHSFQgSk9CIFRF
U1RJRCBbUkVCVUlMRHxIT1NUU1BFQy4uLl0KIAogIENyZWF0ZXMgYSBuZXcgZmxpZ2h0IGNvbnRh
aW5nIGEgY29weSBvZiBKT0IgZnJvbSBFWEFNUExFLUZMSUdIVAogIGFkanVzdGVkIHRvIHVzZSB0
aGUgc2FtZSBidWlsZHMgYXMgSk9CIChpZSwgbm8gcmVidWlsZHMpLApAQCAtNDIsNiArNDIsNDkg
QEAgdXNhZ2UgKCkgeyBjYXQgPDxFTkQKICAgIC1FLi4uIC1mLi4uIC1QICAgICAgIGFzIGZvciBt
Zy1leGVjdXRlLWZsaWdodAogICAgLS1hdXRvYWxsb2Mtbm9mcmVlICAgYWxsb2NhdGUgaG9zdHMg
YXMgZm9yIHByb2R1Y3Rpb24sIGJ1dCBrZWVwIHRoZW0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAoc3BlY2lmeSBubyBIT1NUU1BFQ1M7IHJlbWVtYmVyIHRvIGRlYWxsb2NhdGUgbGF0ZXIpCisK
KyBSRUJVSUxEIGlzCisgICAtLXJlYnVpbGQgWy1CPGJsZXNzaW5nPl0gWy1yLi4uXQorICAgICAg
ICAgICAgIFsuQlVJTERKT0IgfCA9QlVJTERKT0JSVU5WQVIuLi5dCisgICAgICAgICAgICAgK1RS
RUU9VVJMI1JFVklTSU9OLi4uCisgICAgICAgQWxzbyB1c2UgYSBkaWZmZXJlbnQgYnVpbGQuICBT
cGVjaWZpY2FsbHksIHVzZSBVUkwgYW5kIFJFVklTSU9OCisgICAgICAgZm9yIGNlcnRhaW4gYnVp
bGRzIHdoaWNoIG1lbnRpb24gVFJFRSBhbmQgd2hpY2ggYXJlIHJlZmVyZW5jZWQgCisgICAgICAg
KGRpcmVjdGx5KSBpbiB0aGUgam9iIEpPQiBpbiBFWEFNUExFLUZMSUdIVC4gIFRoZSBhZmZlY3Rl
ZCBidWlsZHMKKyAgICAgICBhcmUgdGhvc2UgcmVmZXJlbmNlZCBieSBhbnkgb2YgdGhlIHJ1bnZh
cnMgQlVJTERKT0JSVU5WQVIgKGluCisgICAgICAgd2hpY2ggY2FzZSBvbmx5IHRoYXQgam9iIHJl
ZmVyZW5jZSBpcyBlZGl0ZWQpIG9yIGFueSB3aG9zZSBqb2IKKyAgICAgICBuYW1lIGlzIGFueSBv
ZiB0aGUgQlVJTERKT0IgKGluIHdoaWNoIGNhc2UgYWxsIHJlZmVyZW5jZXMgdG8gdGhhdAorICAg
ICAgIGpvYiBhcmUgYWRqdXN0ZWQpLiAgSWYgbm8gLkJVSUxESk9CIGFuZCBubyA9QlVJTERKT0JS
VU5WQVIgYXJlCisgICAgICAgc3BlY2lmaWVkLCB0aGVuIGFsbCBqb2JzIHJlZmVycmVkIHRvIGZy
b20gdGhlIGV4YW1wbGUgSk9CCisgICAgICAgd2hpY2ggbWVudGlvbiBUUkVFIGFyZSBhZmZlY3Rl
ZC4KKworICAgICAgIEZvciBleGFtcGxlLAorICAgICAgICAgICAtLXJlYnVpbGQgPXhlbmJ1aWxk
am9iIFwKKyAgICAgICAgICAgICAgICAgK3hlbj1naXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxl
L2FsaWNlL3hlbi5naXQjZml4ZXMKKyAgICAgICB3b3VsZCBsb29rIGZvciB4ZW5idWlsZCBhbmQg
KHNheSkgZmluZCB0aGF0IGl0IHJlZmVycmVkIHRvCisgICAgICAgYnVpbGQtYW1kNjQ7IGl0IHdv
dWxkIHRoZW4gY29weSBhbmQgdXNlIHRoZSBidWlsZC1hbWQ2NCBqb2IKKyAgICAgICB0aGF0IEVY
QU1QTEUtRkxJR0hULkpPQiB1c2VkLCBhZGp1c3RpbmcgXGB0cmVlX3hlbicgYW5kCisgICAgICAg
XGByZXZpc2lvbl94ZW4nIGFzIHNwZWNpZmllZCwgYW5kIHVzZSB0aGF0IGZvciBcYHhlbmJ1aWxk
am9iJyBpbgorICAgICAgIHRoZSByZXBybyAoYnV0IG5vdCBmb3IgXGBidWlsZGpvYicpCisKKyAg
ICAgICBXaGVyZWFzCisgICAgICAgICAgIC0tcmVidWlsZCAuYnVpbGQtYW1kNjQgXAorICAgICAg
ICAgICAgICAgICArbGludXg9Z2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9hbGljZS9saW51
eC5naXQjZml4ZXMKKyAgICAgICB3b3VsZCByZXBsYWNlIGFsbCByZWZlcmVuY2VzIHRvIGFueSBq
b2IgbmFtZWQgYnVpbGQtYW1kNjQKKyAgICAgICB3aXRoIGEgbmV3IGJ1aWxkLWFtZDY0IGpvYi4K
KworICAgICAgIEFuZAorICAgICAgICAgICAtLXJlYnVpbGQgXAorICAgICAgICAgICAgICAgICAr
eGVuPWdpdDovL3hlbmJpdHMueGVuLm9yZy9wZW9wbGUvYWxpY2UvbGludXguZ2l0I2ZpeGVzCisg
ICAgICAgd291bGQgcmVwbGFjZSBhbGwgYnVpbGRzIG1lbnRpb25pbmcgeGVuLCBpbmNsdWRpbmcg
Zm9yIGV4YW1wbGUKKyAgICAgICBidWlsZC1hbWQ2NCAoZm9yIHhlbmJ1aWxkam9iKSBhbmQgYnVp
bGQtaTM4NiAoZm9yIGJ1aWxkam9iKQorICAgICAgIGluIGFuIHg4NiAzMi1vbi02NCBmbGlnaHQu
CisKKyAgICAgICBIb3N0IGFsbG9jYXRpb24gZm9yIHRoZSBidWlsZCBpcyBkb25lICJub3JtYWxs
eSIgKGllLCB0aGUgaG9zdAorICAgICAgIGlzIHRocm93biBhd2F5IGFmdGVyIHRoZSBidWlsZCBp
cyBjb21wbGV0ZSksIHdpdGggYSBkZWZhdWx0CisgICAgICAgYmxlc3Npbmcgb2YgXGBhZGhvYycu
CisKKyAgICAgICAtLXJlYnVpbGQgaXMgYWZmZWN0ZWQgYnkgLUUgb3IgLVAgYnV0IG5vdCBnZW5l
cmFsIC1CIG9yIC1mLgorCiBFTkQKIAogfQpAQCAtMTIyLDEwICsxNjUsMzggQEAgcHJvZ3Jlc3Mg
ImxvZ2dpbmcgdG8gJGxvZ2ZpbGUiCiBzYXZlbG9nICIkbG9nZmlsZSIKIGV4ZWMgMz4iJGxvZ2Zp
bGUiCiAKK3JlYnVpbGRzX2ZsaWdodD0nJworCiB3aGlsZSBbICQjIC1uZSAwIF07IGRvCiAJYXJn
PSQxOyBzaGlmdAogCiAJY2FzZSAiJGFyZyIgaW4KKworCS0tcmVidWlsZCkKKwkJcmVidWlsZHNf
Ymxlc3Npbmc9YWRob2MKKwkJcmVidWlsZF9zcGVjcz0oKQorCQl3aGlsZSB0cnVlOyBkbworCQkJ
Y2FzZSAiJDEiIGluCisJCQlbLj0rXSp8LXIpIHJlYnVpbGRfc3BlY3MrPSgiJDEiKTsgICAgICAg
c2hpZnQgOzsKKwkJICAgICAgICAtQj8qKQlyZWJ1aWxkc19ibGVzc2luZz0kezEjLUJ9OyAgICAg
IHNoaWZ0IDs7CisJCQktKikJYmFkdXNhZ2UgJzogYmFkIC0tcmVidWlsZCBvcHRpb24nICAgICA7
OworICAgICAgICAgICAgICAgICAgICAgICAgKikgICAgICBicmVhayAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDs7CisJCQllc2FjCisJCWRvbmUKKwkJaWYgWyB4JHJlYnVpbGRzX2Zs
aWdodCA9IHggXTsgdGhlbgorCQkJcmVidWlsZHNfZmxpZ2h0PSQoCisJCQkJLi9jcy1hZGp1c3Qt
ZmxpZ2h0IG5ldzokcmVidWlsZHNfYmxlc3NpbmcKKwkJCSkKKwkJZmkKKworCQlhZGp1c3RzKz0o
JCgKKwkJCS4vY3MtYWRqdXN0LWZsaWdodCAkcmVidWlsZHNfZmxpZ2h0IFwKKwkJCQlyZXByby1i
dWlsZGpvYnMgJGV4YW1wbGVfZmxpZ2h0ICRqb2IgXAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiJHtyZWJ1aWxkX3NwZWNzW0BdfSIKKwkJKSkKKyAgICAgICAgICAgICAgICBjb250
aW51ZQorCQk7OworCiAJbm9uZTopCiAJCSMgcHJvdmlkZWQgc28gd2UgY2FuIHJlcHJvIGEgam9i
IHdpdGggbm8gaG9zdHMKIAkJOzsKQEAgLTE3MCw2ICsyNDEsMTggQEAgZG9uZQogZmxpZ2h0PSQo
Li9jcy1hZGp1c3QtZmxpZ2h0IG5ldzokYmxlc3NpbmcpCiBwcm9ncmVzcyAibmV3IGZsaWdodCBp
cyAkZmxpZ2h0IgogCitpZiBbICJ4JHJlYnVpbGRzX2ZsaWdodCIgIT0geCBdOyB0aGVuCisJcHJv
Z3Jlc3MgInJ1bm5pbmcgYnVpbGQocykgJHJlYnVpbGRzX2ZsaWdodCIKKwkuL21nLWV4ZWN1dGUt
ZmxpZ2h0IC1CJHJlYnVpbGRzX2JsZXNzaW5nIC0tcHJvZ3Jlc3MtZmQ9MiBcCisJCSIke21nZXhl
Y2ZsYWdzW0BdfSIgJHJlYnVpbGRzX2ZsaWdodAorCisJbXJvPXRtcC8kcmVidWlsZHNfZmxpZ2h0
Lm1ybworCWlmICEgZWdyZXAgJ15wZXJmZWN0JyA+L2Rldi9udWxsICRtcm87IHRoZW4KKwkJZWNo
byA+JjIgImJ1aWxkKHMpIGZhaWxlZCAobm8gJ3BlcmZlY3QnIGluICRtcm8pIgorCQlleGl0IDEK
KwlmaQorZmkKKwogT1NTVEVTVF9UQVNLPSQocGVybCAtZSAnCiAJdXNlIE9zc3Rlc3Q7CiAJdXNl
IE9zc3Rlc3Q6OkV4ZWN1dGl2ZTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
