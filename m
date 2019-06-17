Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51EC47F86
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 12:20:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcoiQ-0006Cj-TF; Mon, 17 Jun 2019 10:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWh3=UQ=126.com=lcy985a@srs-us1.protection.inumbo.net>)
 id 1hcoiO-0006Cb-Jo
 for xen-devel@lists.xen.org; Mon, 17 Jun 2019 10:18:17 +0000
X-Inumbo-ID: 34dbcbd2-90e9-11e9-8210-7769d0ef472a
Received: from m15-26.126.com (unknown [220.181.15.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 34dbcbd2-90e9-11e9-8210-7769d0ef472a;
 Mon, 17 Jun 2019 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=2b5r3
 FgbJTkQD2zJMYENIiWRwL0KD0Uc55w5F9L5sMg=; b=F0jNu7IeAZE0Y/0hAGGCr
 c3y4W4j9jceTnGe/nMUfL35ufqdXMW4pA8Rsle+JOObgEOjJQbWZvetqxzWRwSGS
 mkxI1DW6UUSGbnpjtbO+PlXI1fMb4MDLEQCb5TV5rLvWMQTJCNRnrT/+evDwAjb3
 muXtf+MemkVSmILaw3/nak=
Received: from lcy985a$126.com ( [14.18.236.70] ) by ajax-webmail-wmsvr26
 (Coremail) ; Mon, 17 Jun 2019 18:16:22 +0800 (CST)
X-Originating-IP: [14.18.236.70]
Date: Mon, 17 Jun 2019 18:16:22 +0800 (CST)
From: lcy985a <lcy985a@126.com>
To: xen-devel <xen-devel@lists.xen.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
X-CM-CTRLDATA: kTd8Y2Zvb3Rlcl9odG09MTU4NDo1Ng==
MIME-Version: 1.0
Message-ID: <12faee3a.750c.16b64f00e8e.Coremail.lcy985a@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GsqowADn1_x3aAddrlw9AA--.42475W
X-CM-SenderInfo: pof1mmkvd6ij2wof0z/1tbi8xzWiFpc1uxwEQACsu
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Subject: [Xen-devel] hvmloader crashed when passthrough bridge device but
 not intel piix4 acpi pm
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
Content-Type: multipart/mixed; boundary="===============2182562999658891206=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2182562999658891206==
Content-Type: multipart/alternative; 
	boundary="----=_Part_109685_86885651.1560766582413"

------=_Part_109685_86885651.1560766582413
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

ICAgIFdoZW4gcGFzc3Rocm91Z2ggYSBQTFggUENJOTA1NiBQQ0kgdG8gSU9CdXMgYnJpZGdlLAog
ICAgaHZtbG9hZGVyIHdpbGwgY3Jhc2hlZCBmb3IgaXQgZGlzYWxsb3cgaW5pdCBicmlkZ2UgY2xh
c3MgcGNpIGRldmljZQogICAgZXhjZXB0IGludGVsIFBJSVg0IEFDUEkgUE0uCiAgIAogICAgU2ln
bmVkLW9mZi1ieTogQmV5b25kIExlZSA8bGN5OTg1YUAxMjYuY29tPgpkaWZmIC0tZ2l0IGEvdG9v
bHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3Bj
aS5jCmluZGV4IDBiNzA4YmYuLjMzYWFkYzcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci9wY2kuYworKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvcGNpLmMKQEAgLTE4
OSw2ICsxODksOCBAQCB2b2lkIHBjaV9zZXR1cCh2b2lkKQogICAgICAgICAgICAgYnJlYWs7CiAg
ICAgICAgIGNhc2UgMHgwNjgwOgogICAgICAgICAgICAgLyogUElJWDQgQUNQSSBQTS4gU3BlY2lh
bCBkZXZpY2Ugd2l0aCBzcGVjaWFsIFBDSSBjb25maWcgc3BhY2UuICovCisgICAgICAgICAgICBp
ZiAoICh2ZW5kb3JfaWQgPT0gMHgxMGI1KSAmJiAoZGV2aWNlX2lkID09IDB4OTA1NikgKQorICAg
ICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgQVNTRVJUKCh2ZW5kb3JfaWQgPT0gMHg4
MDg2KSAmJiAoZGV2aWNlX2lkID09IDB4NzExMykpOwogICAgICAgICAgICAgcGNpX3dyaXRldyhk
ZXZmbiwgMHgyMCwgMHgwMDAwKTsgLyogTm8gc21iIGJ1cyBJTyBlbmFibGUgKi8KICAgICAgICAg
ICAgIHBjaV93cml0ZXcoZGV2Zm4sIDB4ZDIsIDB4MDAwMCk7IC8qIE5vIHNtYiBidXMgSU8gZW5h
YmxlICovCg==
------=_Part_109685_86885651.1560766582413
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IFdoZW4gcGFzc3Rocm91
Z2ggYSBQTFggUENJOTA1NiBQQ0kgdG8gSU9CdXMgYnJpZGdlLDxicj4mbmJzcDsmbmJzcDsmbmJz
cDsgaHZtbG9hZGVyIHdpbGwgY3Jhc2hlZCBmb3IgaXQgZGlzYWxsb3cgaW5pdCBicmlkZ2UgY2xh
c3MgcGNpIGRldmljZTxicj4mbmJzcDsmbmJzcDsmbmJzcDsgZXhjZXB0IGludGVsIFBJSVg0IEFD
UEkgUE0uPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyA8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7IFNpZ25l
ZC1vZmYtYnk6IEJleW9uZCBMZWUgJmx0O2xjeTk4NWFAMTI2LmNvbSZndDs8L2Rpdj48ZGl2PmRp
ZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvcGNpLmMgYi90b29scy9maXJtd2Fy
ZS9odm1sb2FkZXIvcGNpLmM8YnI+aW5kZXggMGI3MDhiZi4uMzNhYWRjNyAxMDA2NDQ8YnI+LS0t
IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jPGJyPisrKyBiL3Rvb2xzL2Zpcm13YXJl
L2h2bWxvYWRlci9wY2kuYzxicj5AQCAtMTg5LDYgKzE4OSw4IEBAIHZvaWQgcGNpX3NldHVwKHZv
aWQpPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBicmVhazs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNhc2UgMHgwNjgwOjxicj4mbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
LyogUElJWDQgQUNQSSBQTS4gU3BlY2lhbCBkZXZpY2Ugd2l0aCBzcGVjaWFsIFBDSSBjb25maWcg
c3BhY2UuICovPGJyPismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCAodmVuZG9yX2lkID09IDB4MTBiNSkgJmFtcDsm
YW1wOyAoZGV2aWNlX2lkID09IDB4OTA1NikgKTxicj4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IGJyZWFrOzxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgQVNTRVJUKCh2ZW5kb3JfaWQgPT0g
MHg4MDg2KSAmYW1wOyZhbXA7IChkZXZpY2VfaWQgPT0gMHg3MTEzKSk7PGJyPiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBwY2lfd3JpdGV3KGRldmZuLCAweDIwLCAweDAwMDApOyAvKiBObyBzbWIgYnVzIElPIGVu
YWJsZSAqLzxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcGNpX3dyaXRldyhkZXZmbiwgMHhkMiwgMHgwMDAw
KTsgLyogTm8gc21iIGJ1cyBJTyBlbmFibGUgKi88YnI+PC9kaXY+PC9kaXY+PGJyPjxicj48c3Bh
biB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_109685_86885651.1560766582413--



--===============2182562999658891206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2182562999658891206==--


