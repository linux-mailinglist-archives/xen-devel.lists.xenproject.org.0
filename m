Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F129A36
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 16:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUBPv-0005Y4-25; Fri, 24 May 2019 14:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hUBPt-0005Xw-LL
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 14:43:29 +0000
X-Inumbo-ID: 493b961c-7e32-11e9-a419-57319acb2833
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 493b961c-7e32-11e9-a419-57319acb2833;
 Fri, 24 May 2019 14:43:26 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: yq3YcXGqPJwxkwMgPPffgxwkl0w++PGO5VFx5+POb1F8vjtrxyAdL6pbCoVwZaNb1RMkw2UEmq
 nqp/mJyEF0VDANc713P2lztfZWDVA63xZDQY0bfuBrrnD+oIL6GPdFkOZYTrkz0d+NtsR+1lLI
 ZW+uUUCdcqrkt7+qvcLpvTuLfphbj3SQfv8C/+yS67QcmaKVAkp0bZsXIt1W+8NH4aR8MI3Sw/
 Ty1wBcWT6jdmXvmcQjkAgSkEJHret+nLOTqYZvGmbN+LHJHYb1+ljPlOk8Z5azCDFWMaNcv9ap
 qvM=
X-SBRS: 2.7
X-MesageID: 863973
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="863973"
To: Jan Beulich <JBeulich@suse.com>
References: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
 <5CE7FD6B0200007800232126@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a06368e0-912f-6db9-09d9-171243965c82@citrix.com>
Date: Fri, 24 May 2019 15:43:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE7FD6B0200007800232126@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: Skip building on older
 versions of GCC
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMDUvMjAxOSAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDUuMTkg
YXQgMTU6MjksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gR0NDIDQuNCAo
YXMgaW5jbHVkZWQgaW4gQ2VudE9TIDYpIGlzIHRvbyBvbGQgdG8gaGFuZGxlIGRlc2lnbmF0ZWQg
aW5pdGlhbGlzZXJzCj4+IGluIGFub255bW91cyB1bmlvbnMuICBBcyB0aGlzIGlzIGp1c3QgYSBk
ZXZlbG9wZXIgdG9vbCwgc2tpcCB0aGUgdGVzdCBpbiB0aGlzCj4+IGNhc2UsIHJhdGhlciB0aGFu
IHNhY3JhZmljaW5nIHRoZSBsZWdpYmlsaXR5L2V4cHJlc2liaWxpdHkgb2YgdGhlIHRlc3QgY2Fz
ZXMuCj4+Cj4+IFRoaXMgZml4ZXMgdGhlIEdpdGxhYiBDSSB0ZXN0cy4KPj4KPj4gV2hpbGUgYWRk
aW5nIHRoaXMgbG9naWMgdG8gY3B1LXBvbGN5LCBhZGp1c3QgdGhlIGVxdWl2ZWxlbnQgbG9naWMg
ZnJvbQo+PiB4ODZfZW11bGF0b3Igb24gd2hpY2ggdGhpcyB3YXMgYmFzZWQuICBQcmludGluZzoK
Pj4KPj4gICBUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29tcGlsZXIgdGhhbiAi
Z2NjIgo+Pgo+PiBpc24ndCBoZWxwZnVsIGZvciBhbnlvbmUgdW5leHBlY3RlZGx5IGVuY291bnRl
cmluZyB0aGUgZXJyb3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gRnVuZGFtZW50YWxseQo+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQnV0IHRoZXJlIGFyZSByZW1hcmtzOgo+Cj4+
IC0tLSBhL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUKPj4gKysrIGIvdG9vbHMvdGVz
dHMvY3B1LXBvbGljeS9NYWtlZmlsZQo+PiBAQCAtMSw4ICsxLDIwIEBACj4+ICBYRU5fUk9PVCA9
ICQoQ1VSRElSKS8uLi8uLi8uLgo+PiAgaW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9SdWxlcy5t
awo+PiAgCj4+ICtUQVJHRVQteSA6PSB0ZXN0LWNwdS1wb2xpY3kKPj4gKwo+PiArIyBGb3IgYnJl
dml0eSwgdGhlc2UgdGVzdHMgbWFrZSBleHRlbnNpdmUgdXNlIG9mIGRlc2lnbmF0ZWQgaW5pdGlh
bGlzZXJzLCBidXQKPj4gKyMgR0NDcyBvbGRlciB0aGFuIDQuNiBjYW4ndCBjb3BlLiAgSWdub3Jl
IHRoZSB0ZXN0IGluIHRoaXMgY2FzZS4KPiBEZXNpZ25hdGVkIGluaXRpYWxpemVycyBhbG9uZSBh
cmUgbm8gcHJvYmxlbSBmb3Igb2xkIGdjYy4gVGhlIGlzc3VlIGlzCj4gd2l0aCBvbmVzIHVzZWQg
Zm9yIHN1Yi1zdHJ1Y3R1cmVzLy11bmlvbnMgd2l0aG91dCBmaWVsZCBuYW1lLgo+IFBlcmhhcHMg
d29ydGggc2xpZ2h0bHkgZXh0ZW5kaW5nIHRoZSBjb21tZW50IHRvIHRoaXMgZWZmZWN0PwoKIiBp
biBhbm9ueW1vdXMgdW5pb25zIiA/wqAgSSBjYW4gbmV2ZXIgcmVtZW1iZXIgZXhhY3RseSB3aGlj
aCBiaXQgaXQKY2hva2VzIG9uLCBidXQgSSB0aGluayB0aGVyZSBhcmUgdHdvIGRpZmZlcmVudCBv
bmVzIGluIHByYWN0aWNlIHdoaWNoCmludGVyZmVyZS4KCj4KPj4gLS0tIGEvdG9vbHMvdGVzdHMv
eDg2X2VtdWxhdG9yL01ha2VmaWxlCj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9N
YWtlZmlsZQo+PiBAQCAtOTcsNyArOTcsNyBAQCAkKGZvcmVhY2ggZmxhdm9yLCQoU0lNRCkgJChG
TUEpLCQoZXZhbCAkKGNhbGwgc2ltZC1jaGVjay1jYywkKGZsYXZvcikpKSkKPj4gIFRBUkdFVC0k
KHNoZWxsIGVjaG8gJ2FzbSgie2V2ZXh9IHZ6ZXJvYWxsIik7JyB8ICQoQ0MpIC14IGMgLWMgLW8g
L2Rldi9udWxsIAo+PiAtIHx8IGVjaG8geSkgOj0KPj4gIAo+PiAgaWZlcSAoJChUQVJHRVQteSks
KQo+PiAtJCh3YXJuaW5nIFRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBuZXdlciBjb21waWxl
ciB0aGFuICIkKENDKSIpCj4+ICskKHdhcm5pbmcgVGVzdCBoYXJuZXNzIG5vdCBidWlsdCwgdXNl
IG5ld2VyIGNvbXBpbGVyIHRoYW4gJChDQykgJChzaGVsbCAkKENDKSAtZHVtcHZlcnNpb24pIGFu
ZCBhbiAie2V2ZXh9IiBjYXBhYmxlIGFzc2VtYmxlcikKPj4gIGVuZGlmCj4gSSBhcHByZWNpYXRl
IHRoZSBpZGVhIG9mIHByb3ZpZGluZyBtb2RlIGluZm9ybWF0aW9uLCBidXQgSSdtIGFmcmFpZAo+
IHRoaXMgaXMgZ29pbmcgdG8gYmUgY2x1bXN5IGluIHRoZSBvdGhlciBkaXJlY3Rpb24gbm93Ogo+
Cj4gIlRlc3QgaGFybmVzcyBub3QgYnVpbHQsIHVzZSBuZXdlciBjb21waWxlciB0aGFuIGdjYy00
LjggNC44IGFuZCAuLi4iCj4KPiBOYW1pbmcgdGhlIGNvbXBpbGVyIGJpbmFyeSwgSSB0aG91Z2h0
LCBhbGxvd3MgdGhlIHVzZXIgdG8gZmlndXJlCj4gb3V0IHRoZSB2ZXJzaW9uIGVhc2lseSBlbm91
Z2guIFRoZXJlZm9yZSwgcGxlYXNlIGNvbnNpZGVyCj4gZHJvcHBpbmcgdGhhdCBwYXJ0IGFnYWlu
LgoKSSdtIGFmcmFpZCB5b3UgaGF2ZSBhIHNlbGVjdGlvbiBiaWFzIGhlcmUuwqAgWW91ciBjb21w
aWxlciBiaW5hcmllcyBtYXkKaGF2ZSBhIHZlcnNpb24gc3VmZml4LCBidXQgdGhlIG92ZXJ3aGVs
bWluZyBtYWpvcml0eSBvZiBwZW9wbGUgd2hvIGFyZQpnb2luZyB0byBoaXQgdGhhdCBlcnJvciBh
bmQgbmVlZCB0byBmaWd1cmUgb3V0IHdoYXQgdG8gZG8gd2lsbCBiZSB1c2luZwp0aGVpciBzeXN0
ZW0tcHJvdmlkZWQgYmluYXJpZXMsIGFzIHBlciB0aGUgY29tbWl0IG1lc3NhZ2UuCgpXaGF0IGFi
b3V0OgoKwqAgLi4uIHRoYW4gIiQoQ0MpIiAodmVyc2lvbiAkKHNoZWxsICQoQ0MpIC1kdW1wdmVy
c2lvbikpIGFuZCAuLi4KCndoaWNoIHNob3VsZCAoaW4geW91ciBleGFtcGxlKSByZW5kZXIgYXM6
CgrCoCAuLi4gdGhhbiAiZ2NjLTQuOCIgKHZlcnNpb24gNC44KSBhbmQgLi4uCgo/Cgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
