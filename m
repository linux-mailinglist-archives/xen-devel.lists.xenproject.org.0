Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C5C0FD6
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2019 07:13:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iE4z3-0007al-Co; Sat, 28 Sep 2019 05:09:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rlNr=XX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iE4z1-0007ag-OS
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2019 05:09:27 +0000
X-Inumbo-ID: 2400718a-e1ae-11e9-968d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2400718a-e1ae-11e9-968d-12813bfff9fa;
 Sat, 28 Sep 2019 05:09:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E8540ACA0;
 Sat, 28 Sep 2019 05:09:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 28 Sep 2019 07:09:23 +0200
Message-Id: <20190928050923.23540-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Reply-To: xen-devel@lists.xenproject.org, jgross@suse.com
Cc: jgross@suse.com, luwei.kang@intel.com, wl@xen.org,
 andrew.cooper3@citrix.com, marmarek@invisiblethingslab.com,
 olekstysh@gmail.com, paul.durrant@citrix.com, JBeulich@suse.com,
 puwen@hygon.cn, chao.gao@intel.com, Volodymyr_Babchuk@epam.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgbXVsdGlwbGUgcmF0aGVyIGltcG9ydGFudCBwYXRjaCBzZXJpZXMgYXJlIHZlcnkgc2hvcnQg
YmVmb3JlIGJlaW5nIHJlYWR5CkkgaGF2ZSBkZWNpZGVkIHRvIHB1c2ggdGhlIGhhcmQgY29kZSBm
cmVlemUgb25lIHdlZWsgYmFjayB0byBPY3RvYmVyIDR0aC4KClRoaXMgZW1haWwgb25seSB0cmFj
a3MgYmlnIGl0ZW1zIGZvciB4ZW4uZ2l0IHRyZWUuIFBsZWFzZSByZXBseSBmb3IgaXRlbXMgeW91
CndvdWxkIGxpa2UgdG8gc2VlIGluIDQuMTMgc28gdGhhdCBwZW9wbGUgaGF2ZSBhbiBpZGVhIHdo
YXQgaXMgZ29pbmcgb24gYW5kCnByaW9yaXRpc2UgYWNjb3JkaW5nbHkuCgpZb3UncmUgd2VsY29t
ZSB0byBwcm92aWRlIGRlc2NyaXB0aW9uIGFuZCB1c2UgY2FzZXMgb2YgdGhlIGZlYXR1cmUgeW91
J3JlCndvcmtpbmcgb24uCgo9IFRpbWVsaW5lID0KCldlIG5vdyBhZG9wdCBhIGZpeGVkIGN1dC1v
ZmYgZGF0ZSBzY2hlbWUuIFdlIHdpbGwgcmVsZWFzZSBhYm91dCBldmVyeSA4IG1vbnRocy4KVGhl
IHVwY29taW5nIDQuMTMgdGltZWxpbmUgYXJlIGFzIGZvbGxvd2VkOgoKKiBMYXN0IHBvc3Rpbmcg
ZGF0ZTogU2VwdGVtYmVyIDEzdGgsIDIwMTkKLS0tPiBXZSBhcmUgaGVyZQoqIEhhcmQgY29kZSBm
cmVlemU6IE9jdG9iZXIgNHRoLCAyMDE5CiogUkMxOiBUQkQKKiBSZWxlYXNlOiBOb3ZlbWJlciA3
dGgsIDIwMTkKCk5vdGUgdGhhdCB3ZSBkb24ndCBoYXZlIGZyZWV6ZSBleGNlcHRpb24gc2NoZW1l
IGFueW1vcmUuIEFsbCBwYXRjaGVzCnRoYXQgd2lzaCB0byBnbyBpbnRvIDQuMTMgbXVzdCBiZSBw
b3N0ZWQgaW5pdGlhbGx5IG5vIGxhdGVyIHRoYW4gdGhlCmxhc3QgcG9zdGluZyBkYXRlIGFuZCBm
aW5hbGx5IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuIEFsbApwYXRjaGVzIHBv
c3RlZCBhZnRlciB0aGF0IGRhdGUgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHF1ZXVlZCBpbnRvIG5l
eHQKcmVsZWFzZS4KClJDcyB3aWxsIGJlIGFycmFuZ2VkIGltbWVkaWF0ZWx5IGFmdGVyIGZyZWV6
ZS4KCldlIHJlY2VudGx5IGludHJvZHVjZWQgYSBqaXJhIGluc3RhbmNlIHRvIHRyYWNrIGFsbCB0
aGUgdGFza3MgKG5vdCBvbmx5IGJpZykKZm9yIHRoZSBwcm9qZWN0LiBTZWU6IGh0dHBzOi8veGVu
cHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9pc3N1ZXMuCgpTb21lIG9mIHRoZSB0
YXNrcyB0cmFja2VkIGJ5IHRoaXMgZS1tYWlsIGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRpbmcgamly
YSB0YXNrCnJlZmVycmVkIGJ5IFhFTi1OLgoKSSBoYXZlIHN0YXJ0ZWQgdG8gaW5jbHVkZSB0aGUg
dmVyc2lvbiBudW1iZXIgb2Ygc2VyaWVzIGFzc29jaWF0ZWQgdG8gZWFjaApmZWF0dXJlLiBDYW4g
ZWFjaCBvd25lciBzZW5kIGFuIHVwZGF0ZSBvbiB0aGUgdmVyc2lvbiBudW1iZXIgaWYgdGhlIHNl
cmllcwp3YXMgcG9zdGVkIHVwc3RyZWFtPwoKPSBQcm9qZWN0cyA9Cgo9PSBIeXBlcnZpc29yID09
IAoKKiAgQ29yZSBzY2hlZHVsaW5nICh2NCkKICAtICBKdWVyZ2VuIEdyb3NzCgo9PT0geDg2ID09
PSAKCiogIEludGVsIFByb2Nlc3NvciBUcmFjZSB2aXJ0dWFsaXphdGlvbiBlbmFibGluZyAodjEp
CiAgLSAgTHV3ZWkgS2FuZwoKKiAgTGludXggc3R1YiBkb21haW5zIChSRkMgdjIpCiAgLSAgTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpCgoqICBJbXByb3ZlIGxhdGUgbWljcm9jb2RlIGxvYWRp
bmcgKHYxMikKICAtICBDaGFvIEdhbwoKKiAgRml4ZXMgdG8gI0RCIGluamVjdGlvbgogIC0gIEFu
ZHJldyBDb29wZXIKCiogIENQVUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJvdmVtZW50cwogIC0g
IEFuZHJldyBDb29wZXIKCiogIEltcHJvdmVtZW50cyB0byBkb21haW5fY3Jhc2goKQogIC0gIEFu
ZHJldyBDb29wZXIKCiogIEVJQlJTCiAgLSAgQW5kcmV3IENvb3BlcgoKKiAgWGVuIGlvcmVxIHNl
cnZlciAodjIpCiAgLSAgUm9nZXIgUGF1IE1vbm5lCgo9PT0gQVJNID09PSAKCj09IENvbXBsZXRl
ZCA9PSAKCiogIERyb3AgdG1lbQogIC0gIFdlaSBMaXUKCiogIEFkZCBzdXBwb3J0IGZvciBIeWdv
biBEaHlhbmEgRmFtaWx5IDE4aCBwcm9jZXNzb3IKICAtICBQdSBXZW4KCiogIGh5cGVydmlzb3Ig
eDg2IGluc3RydWN0aW9uIGVtdWxhdG9yIGFkZGl0aW9ucyBmb3IgQVZYNTEyCiAgLSAgSmFuIEJl
dWxpY2gKCiogIHgyQVBJQyBzdXBwb3J0IGZvciBBTUQKICAtICBKYW4gQmV1bGljaAoKKiAgYWRk
IHBlci1kb21haW4gSU9NTVUgY29udHJvbAogIC0gIFBhdWwgRHVycmFudAoKKiAgVEVFIG1lZGlh
dG9yIChhbmQgT1AtVEVFKSBzdXBwb3J0IGluIFhFTgogIC0gIFZvbG9keW15ciBCYWJjaHVrCgoq
ICBSZW5lc2FzIElQTU1VLVZNU0Egc3VwcG9ydCArIExpbnV4J3MgaW9tbXVfZndzcGVjCiAgLSAg
T2xla3NhbmRyIFR5c2hjaGVua28KCgpKdWVyZ2VuIEdyb3NzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
