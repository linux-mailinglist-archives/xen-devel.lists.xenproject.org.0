Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074212822F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:27:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMwH-0005Fq-Oc; Fri, 20 Dec 2019 18:23:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7iIf=2K=amazon.de=prvs=250d15ebf=wipawel@srs-us1.protection.inumbo.net>)
 id 1iiMwG-0005FQ-05
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:23:48 +0000
X-Inumbo-ID: dcff1234-2355-11ea-93c3-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcff1234-2355-11ea-93c3-12813bfff9fa;
 Fri, 20 Dec 2019 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576866227; x=1608402227;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=M8Rb7Uj4mlvACH9CECpyK0cEnNQ74FfuC/oyjBVrOV8=;
 b=C8NrqhkVGXj/NSIqDgglPGTyaIxxLihF4Mdv253qcbPo3J3ng876weng
 00DqK+TY8WmIEYS2KenYDVYP6x2ofj8ermXZiBwqv5TQJ0ZoBm6b51qCf
 TkVnaQdGZTZ4cbW4Nw5MooZ8AWfqSN/+A2EFGk/ZJi51FOS+uO4GMM94O k=;
IronPort-SDR: lmsM4W1C/Iy7qxAV8M8OiLtl1Wy+IXSQaL56WP0Xy91l93L3vcjCyQ73hnAse69opkFx6ckpeP
 TyEmuYJVA3ng==
X-IronPort-AV: E=Sophos;i="5.69,336,1571702400"; 
   d="scan'208";a="8537850"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 20 Dec 2019 18:23:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 132D6C1090; Fri, 20 Dec 2019 18:23:45 +0000 (UTC)
Received: from EX13D05EUC003.ant.amazon.com (10.43.164.207) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 20 Dec 2019 18:23:45 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC003.ant.amazon.com (10.43.164.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 20 Dec 2019 18:23:43 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Fri, 20 Dec 2019 18:23:41 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 18:23:39 +0000
Message-ID: <20191220182339.9094-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] livepatch: Fix typos and other errors in tests
 Makefile
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Julien
 Grall <julien@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgd2FzIGEgYnVuY2ggb2YgdHlwb3MgKHMvYWN0aW9ucy9hY3Rpb24vKSBhcyB3ZWxsIGFz
IG9uZSBtaXNzaW5nCmNvbmZpZy5oIHRhcmdldCBkZXBlbmRlbmN5LiBBbHNvLCB4ZW5fZXhwZWN0
YXRpb24gdGFyZ2V0IGhhcwp1bm5lY2Vzc2FyeSBjeWNsZSBkZXBlbmRlbmN5LgoKU2lnbmVkLW9m
Zi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgotLS0KIHhlbi90
ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZSB8IDEyICsrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vdGVzdC9s
aXZlcGF0Y2gvTWFrZWZpbGUgYi94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKaW5kZXggZWJi
MzQzYzMxNC4uODJhMDc2YWFjMSAxMDA2NDQKLS0tIGEveGVuL3Rlc3QvbGl2ZXBhdGNoL01ha2Vm
aWxlCisrKyBiL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZQpAQCAtMTY2LDI5ICsxNjYsMzEg
QEAgeGVuX3ByZXBvc3RfaG9va3NfZmFpbC5vOiBjb25maWcuaAogJChMSVZFUEFUQ0hfUFJFUE9T
VF9IT09LU19GQUlMKTogeGVuX3ByZXBvc3RfaG9va3NfZmFpbC5vIHhlbl9oZWxsb193b3JsZF9m
dW5jLm8gbm90ZS5vIHhlbl9ub3RlLm8KIAkkKExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlu
a2VyKSAtciAtbyAkKExJVkVQQVRDSF9QUkVQT1NUX0hPT0tTX0ZBSUwpICReCiAKLXhlbl9hY3Rp
b25zX2hvb2tzLm86IGNvbmZpZy5oCit4ZW5fYWN0aW9uX2hvb2tzLm86IGNvbmZpZy5oCiAKIC5Q
SE9OWTogJChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTKQogJChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tT
KTogeGVuX2FjdGlvbl9ob29rcy5vIHhlbl9oZWxsb193b3JsZF9mdW5jLm8gbm90ZS5vIHhlbl9u
b3RlLm8KIAkkKExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlua2VyKSAtciAtbyAkKExJVkVQ
QVRDSF9BQ1RJT05fSE9PS1MpICReCiAKK3hlbl9hY3Rpb25faG9va3Nfbm9mdW5jLm86IGNvbmZp
Zy5oCisKIC5QSE9OWTogJChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX05PRlVOQykKICQoTElWRVBB
VENIX0FDVElPTl9IT09LU19OT0ZVTkMpOiB4ZW5fYWN0aW9uX2hvb2tzX25vZnVuYy5vIG5vdGUu
byB4ZW5fbm90ZS5vCiAJJChMRCkgJChMREZMQUdTKSAkKGJ1aWxkX2lkX2xpbmtlcikgLXIgLW8g
JChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX05PRlVOQykgJF4KIAoteGVuX2FjdGlvbnNfaG9va3Nf
bWFya2VyLm86IGNvbmZpZy5oCit4ZW5fYWN0aW9uX2hvb2tzX21hcmtlci5vOiBjb25maWcuaAog
CiAuUEhPTlk6ICQoTElWRVBBVENIX0FDVElPTl9IT09LU19NQVJLRVIpCiAkKExJVkVQQVRDSF9B
Q1RJT05fSE9PS1NfTUFSS0VSKTogeGVuX2FjdGlvbl9ob29rc19tYXJrZXIubyB4ZW5faGVsbG9f
d29ybGRfZnVuYy5vIG5vdGUubyB4ZW5fbm90ZS5vCiAJJChMRCkgJChMREZMQUdTKSAkKGJ1aWxk
X2lkX2xpbmtlcikgLXIgLW8gJChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX01BUktFUikgJF4KIAot
eGVuX2FjdGlvbnNfaG9va3Nfbm9hcHBseS5vOiBjb25maWcuaAoreGVuX2FjdGlvbl9ob29rc19u
b2FwcGx5Lm86IGNvbmZpZy5oCiAKIC5QSE9OWTogJChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX05P
QVBQTFkpCiAkKExJVkVQQVRDSF9BQ1RJT05fSE9PS1NfTk9BUFBMWSk6IHhlbl9hY3Rpb25faG9v
a3NfbWFya2VyLm8geGVuX2hlbGxvX3dvcmxkX2Z1bmMubyBub3RlLm8geGVuX25vdGUubwogCSQo
TEQpICQoTERGTEFHUykgJChidWlsZF9pZF9saW5rZXIpIC1yIC1vICQoTElWRVBBVENIX0FDVElP
Tl9IT09LU19OT0FQUExZKSAkXgogCi14ZW5fYWN0aW9uc19ob29rc19ub3JldmVydC5vOiBjb25m
aWcuaAoreGVuX2FjdGlvbl9ob29rc19ub3JldmVydC5vOiBjb25maWcuaAogCiAuUEhPTlk6ICQo
TElWRVBBVENIX0FDVElPTl9IT09LU19OT1JFVkVSVCkKICQoTElWRVBBVENIX0FDVElPTl9IT09L
U19OT1JFVkVSVCk6IHhlbl9hY3Rpb25faG9va3NfbWFya2VyLm8geGVuX2hlbGxvX3dvcmxkX2Z1
bmMubyBub3RlLm8geGVuX25vdGUubwpAQCAtMTk4LDcgKzIwMCw3IEBAIEVYUEVDVF9CWVRFU19D
T1VOVCA6PSA4CiBDT0RFX0dFVF9FWFBFQ1Q9JChzaGVsbCAkKE9CSkRVTVApIC1kIC0taW5zbi13
aWR0aD0xICQoMSkgfCBzZWQgLW4gLWUgJy88JyQoMiknPjokJC8sL14kJC8gcCcgfCB0YWlsIC1u
ICsyIHwgaGVhZCAtbiAkKEVYUEVDVF9CWVRFU19DT1VOVCkgfCBhd2sgJ3skJDA9JCQyOyBwcmlu
dGYgIiVzIiwgc3Vic3RyKCQkMCxsZW5ndGgtMSl9JyB8IHNlZCAncy8uXHsyXH0vMHgmLC9nJyB8
IHNlZCAncy9eL3svO3MvLCQkL30vZycpCiAuUEhPTlk6IGV4cGVjdF9jb25maWcuaAogZXhwZWN0
X2NvbmZpZy5oOiBFWFBFQ1RfQllURVM9JChjYWxsIENPREVfR0VUX0VYUEVDVCwkKEJBU0VESVIp
L3hlbi1zeW1zLHhlbl9leHRyYV92ZXJzaW9uKQotZXhwZWN0X2NvbmZpZy5oOiB4ZW5fZXhwZWN0
YXRpb25zLm8KK2V4cGVjdF9jb25maWcuaDoKIAkoc2V0IC1lOyBcCiAJIGVjaG8gIiNkZWZpbmUg
RVhQRUNUX0JZVEVTICQoRVhQRUNUX0JZVEVTKSI7IFwKICAgICAgICAgIGVjaG8gIiNkZWZpbmUg
RVhQRUNUX0JZVEVTX0NPVU5UICQoRVhQRUNUX0JZVEVTX0NPVU5UKSIpID4gJEAKLS0gCjIuMTYu
NQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4g
MzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
Sm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
dW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
