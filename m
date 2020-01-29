Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C08014CAEF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:39:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmaF-0001ix-IA; Wed, 29 Jan 2020 12:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwmaE-0001is-Ac
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:36:38 +0000
X-Inumbo-ID: fcf25f27-4293-11ea-88a9-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcf25f27-4293-11ea-88a9-12813bfff9fa;
 Wed, 29 Jan 2020 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580301398; x=1611837398;
 h=from:to:cc:subject:date:message-id:mime-version:reply-to:
 content-transfer-encoding;
 bh=d0lj0zd8IIUJTSK1BmICHD/I9GwB2cL5OOeEg0IRMzM=;
 b=CKra96p3BGrd5c6qy0Og0uyF2dAccd7hOqbT05Q4GQx0dD2mjwHKg/m2
 vznwga/k0EXRqpW8gp2DETabh5PGiMsR3dj3RJbIEXo78ZDvAyb9558BK
 5M/AO8T0ZeJ94rEQ45Vt4JCy24RmRE7izbjRBYbJnlo6RZS+1mFoyq8er w=;
IronPort-SDR: kiXRcLTqwCKx1WSUH8jtFw7HlgWYQVaV3gi5XebDg09Edu8NLaRUNn0Qz3QMiDJuZVhZ7mUvI3
 o2NnRinbqR7g==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="13381772"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Jan 2020 12:36:23 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9BFADA21ED; Wed, 29 Jan 2020 12:36:22 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 12:36:21 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 12:36:21 +0000
Received: from CBG-R90WXYV0.cbg10.amazon.com (10.55.230.169) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 12:36:19 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 12:36:18 +0000
Message-ID: <20200129123618.1202-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: xen-devel@lists.xenproject.org, pdurrant@amazon.com
Cc: luwei.kang@intel.com, andrew.cooper3@citrix.com, pdurrant@amazon.com,
 marmarek@invisiblethingslab.com, dwmw@amazon.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNl
IHJlcGx5IGZvciBpdGVtcwp5b3Ugd291bGQgbGlrZSB0byBzZWUgaW4gNC4xNCBzbyB0aGF0IHBl
b3BsZSBoYXZlIGFuIGlkZWEgd2hhdAppcyBnb2luZyBvbiBhbmQgcHJpb3JpdGlzZSBhY2NvcmRp
bmdseS4KCllvdSdyZSB3ZWxjb21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNl
cyBvZiB0aGUgZmVhdHVyZSB5b3UncmUKd29ya2luZyBvbi4KCj0gVGltZWxpbmUgPQoKV2Ugbm93
IGFkb3B0IGEgZml4ZWQgY3V0LW9mZiBkYXRlIHNjaGVtZS4gV2Ugd2lsbCByZWxlYXNlIGFib3V0
IGV2ZXJ5IDgKIG1vbnRocy4KVGhlIGNyaXRpY2FsIGRhdGVzIGZvciBYZW4gNC4xNCBhcmUgYXMg
Zm9sbG93czoKCi0tLT4gV2UgYXJlIGhlcmUKKiBMYXN0IHBvc3RpbmcgZGF0ZTogTWF5IDFzdCwg
MjAyMAoqIEhhcmQgY29kZSBmcmVlemU6IE1heSAyMm5kLCAyMDIwCiogUmVsZWFzZTogSnVuZSAy
NnRoLCAyMDIwCgpOb3RlIHRoYXQgd2UgZG9uJ3QgaGF2ZSBhIGZyZWV6ZSBleGNlcHRpb24gc2No
ZW1lIGFueW1vcmUuIEFsbCBwYXRjaGVzCnRoYXQgd2lzaCB0byBnbyBpbnRvIDQuMTQgbXVzdCBi
ZSBwb3N0ZWQgaW5pdGlhbGx5IG5vIGxhdGVyIHRoYW4gdGhlCmxhc3QgcG9zdGluZyBkYXRlIGFu
ZCBmaW5hbGx5IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuCkFsbCBwYXRjaGVz
IHBvc3RlZCBhZnRlciB0aGF0IGRhdGUgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHF1ZXVlZCBpbnRv
IG5leHQKcmVsZWFzZS4KClJDcyB3aWxsIGJlIGFycmFuZ2VkIGltbWVkaWF0ZWx5IGFmdGVyIGZy
ZWV6ZS4KClRoZXJlIGlzIGFsc28gYSBqaXJhIGluc3RhbmNlIHRvIHRyYWNrIGFsbCB0aGUgdGFz
a3MgKG5vdCBvbmx5IGJpZykKZm9yIHRoZSBwcm9qZWN0LiBTZWU6IGh0dHBzOi8veGVucHJvamVj
dC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9pc3N1ZXMuCgpTb21lIG9mIHRoZSB0YXNrcyB0
cmFja2VkIGJ5IHRoaXMgZS1tYWlsIGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRpbmcgamlyYSB0YXNr
CnJlZmVycmVkIGJ5IFhFTi1OLgoKVGhlcmUgaXMgYSB2ZXJzaW9uIG51bWJlciBmb3IgcGF0Y2gg
c2VyaWVzIGFzc29jaWF0ZWQgdG8gZWFjaCBmZWF0dXJlLgpDYW4gZWFjaCBvd25lciBzZW5kIGFu
IHVwZGF0ZSBnaXZpbmcgdGhlIGxhdGVzdCB2ZXJzaW9uIG51bWJlciBpZiB0aGUKc2VyaWVzIGhh
cyBiZWVuIHJlLXBvc3RlZD8gQWxzbywgY2FuIHRoZSBvd25lcnMgb2YgYW55IGNvbXBsZXRlZCBp
dGVtcwpwbGVhc2UgcmVzcG9uZCBzbyB0aGF0IHRoZSBpdGVtIGNhbiBiZSBtb3ZlZCBpbnRvIHRo
ZSAnQ29tcGxldGVkJyBzZWN0aW9uLgoKPSBQcm9qZWN0cyA9Cgo9PSBIeXBlcnZpc29yID09IAoK
KiAgTGl2ZS1VcGRhdGluZyBYZW4KICAtICBEYXZpZCBXb29kaG91c2UKCiogIE5vbi1Db29wZXJh
dGl2ZSBMaXZlIE1pZ3JhdGlvbgogIC0gIFBhdWwgRHVycmFudAoKPT09IHg4NiA9PT0gCgoqICBJ
bnRlbCBQcm9jZXNzb3IgVHJhY2UgdmlydHVhbGl6YXRpb24gZW5hYmxpbmcgKHYxKQogIC0gIEx1
d2VpIEthbmcKCiogIExpbnV4IHN0dWIgZG9tYWlucyAoUkZDIHYyKQogIC0gIE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraQoKKiAgRml4ZXMgdG8gI0RCIGluamVjdGlvbgogIC0gIEFuZHJldyBD
b29wZXIKCiogIENQVUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJvdmVtZW50cwogIC0gIEFuZHJl
dyBDb29wZXIKCiogIEltcHJvdmVtZW50cyB0byBkb21haW5fY3Jhc2goKQogIC0gIEFuZHJldyBD
b29wZXIKCiogIEVJQlJTCiAgLSAgQW5kcmV3IENvb3BlcgoKKiAgWGVuIGlvcmVxIHNlcnZlciAo
djMpCiAgLSAgUm9nZXIgUGF1IE1vbm5lCgo9PT0gQVJNID09PSAKCj09IENvbXBsZXRlZCA9PSAK
CgpQYXVsIER1cnJhbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
