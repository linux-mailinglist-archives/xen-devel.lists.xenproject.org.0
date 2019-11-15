Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC9FE014
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:30:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcZL-00055H-8H; Fri, 15 Nov 2019 14:27:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SiVl=ZH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iVcZJ-00055C-OF
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:27:25 +0000
X-Inumbo-ID: 0ab80da6-07b4-11ea-a26f-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ab80da6-07b4-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 14:27:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i10so11200856wrs.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 06:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9JhRcGLo4WGgDl0jYnb38T94OZsDjT7+Tm5v+BxoKxk=;
 b=Z1URmMcL7L6I1JSUN3gxrhb4V7Tz6uEgrkfKiIAjVa+z1LGgsthidJ+rU3fQwMAIvl
 D42XGDZz3a7hgbxB/mQSjpYO0jXcozPmoEeP2Gxiu82lCT09pRXsmV+usCzEbEpB3eR/
 0XTXd6LQGZNCCtPtBq8E0hX1UxFxqqZPKHz5wYT/b3ykt7p8RUFxZ5fcJwevftnyyKvE
 w7IevGEzQ6NJ1IC5jnebm+AJDyRqPIGYQ297D26DGJM4g+ozNL30sMabE3y8BgeQMkEE
 I+eANkM8eDbdgUuj8+W1Nq2k7E8dwYRXKl0PvTZ1z5xWg5/fFQRy8Dz+RMNUh4b/Ebzy
 PAHQ==
X-Gm-Message-State: APjAAAUFtq14Ngbbji6iXGqNLm6aciO/+XldNGBTFPeBvflGULpU7qX6
 WF6WI9RN6IzzTH5iQpTby9p6crmCPag=
X-Google-Smtp-Source: APXvYqyoRzfSB16wxmd0rRtm72qYKTxV7/kb7h8RwsKZ/ChBvD9vgt4oW/0PpZYCBTnK/m6E9nKPtA==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr17015099wrs.388.1573828043844; 
 Fri, 15 Nov 2019 06:27:23 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id a26sm2100593wmm.14.2019.11.15.06.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 06:27:23 -0800 (PST)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 14:27:20 +0000
Message-Id: <20191115142720.5588-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] docs: adjust xen release cycle text
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 committers@xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IHRleHQgYWJvdXQgcmVsZWFzZSBjeWNsZS4gRHJvcCB0aGUgY29uanVyZWQgdXAgZXhhbXBs
ZSB0aGF0J3Mgbm8KbG9uZ2VyIGFwcGxpY2FibGUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgotLS0KIGRvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRv
YyB8IDE1ICsrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9wcm9jZXNzL3hlbi1yZWxlYXNlLW1h
bmFnZW1lbnQucGFuZG9jIGIvZG9jcy9wcm9jZXNzL3hlbi1yZWxlYXNlLW1hbmFnZW1lbnQucGFu
ZG9jCmluZGV4IGQ2YWJjOTBhMDIuLmUxYWExZWRhOGYgMTAwNjQ0Ci0tLSBhL2RvY3MvcHJvY2Vz
cy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRvYworKysgYi9kb2NzL3Byb2Nlc3MveGVuLXJl
bGVhc2UtbWFuYWdlbWVudC5wYW5kb2MKQEAgLTE1LDEyICsxNSwxMSBAQCB0aGF0IHRoZXkgY2Fu
IGhhdmUgYW4gaWRlYSB3aGF0IHRvIGV4cGVjdCBmcm9tIHRoZSBSZWxlYXNlIE1hbmFnZXIuCiAK
ICMgWGVuIHJlbGVhc2UgY3ljbGUKIAotVGhlIFhlbiBoeXBlcnZpc29yIHByb2plY3Qgbm93IHJl
bGVhc2VzIHR3aWNlIGEgeWVhciwgYXQgdGhlIGJlZ2lubmluZyBvZgotSnVuZSBhbmQgdGhlIGJl
Z2lubmluZyBvZiBEZWNlbWJlci4gVGhlIGFjdHVhbCByZWxlYXNlIGRhdGUgZGVwZW5kcyBvbiBh
IGxvdAotb2YgZmFjdG9ycy4KK1RoZSBYZW4gaHlwZXJ2aXNvciBwcm9qZWN0IG5vdyByZWxlYXNl
cyBldmVyeSA4IG1vbnRocy4gVGhlIGFjdHVhbCByZWxlYXNlIGRhdGUKK2RlcGVuZHMgb24gYSBs
b3Qgb2YgZmFjdG9ycy4KIAogV2UgY2FuIHJvdWdobHkgZGl2aWRlIG9uZSByZWxlYXNlIGludG8g
dHdvIHBlcmlvZHMuIFRoZSBkZXZlbG9wbWVudCBwZXJpb2QKLWFuZCB0aGUgZnJlZXplIHBlcmlv
ZC4gVGhlIGZvcm1lciBpcyA0IG1vbnRocyBsb25nIGFuZCB0aGUgbGF0dGVyIGlzIGFib3V0IDIK
K2FuZCB0aGUgZnJlZXplIHBlcmlvZC4gVGhlIGZvcm1lciBpcyA2IG1vbnRocyBsb25nIGFuZCB0
aGUgbGF0dGVyIGlzIGFib3V0IDIKIG1vbnRocyBsb25nLgogCiBEdXJpbmcgZGV2ZWxvcG1lbnQg
cGVyaW9kLCBjb250cmlidXRvcnMgc3VibWl0IHBhdGNoZXMgdG8gYmUgcmV2aWV3ZWQgYW5kCkBA
IC0zNCwxNCArMzMsNiBAQCBEdXJpbmcgZnJlZXplIHBlcmlvZCwgdGhlIHRyZWUgaXMgY2xvc2Vk
IGZvciBuZXcgZmVhdHVyZXMuIE9ubHkgYnVnIGZpeGVzIGFyZQogYWNjZXB0ZWQuIFRoaXMgcGVy
aW9kIGNhbiBiZSBzaG9ydGVyIG9yIGxvbmdlciB0aGFuIDIgbW9udGhzLiBJZiBpdCBlbmRzIHVw
CiBsb25nZXIgdGhhbiAyIG1vbnRocywgaXQgZWF0cyBpbnRvIHRoZSBuZXh0IGRldmVsb3BtZW50
IHBlcmlvZC4KIAotSGVyZSBpcyBhIGNvbmp1cmVkIHVwIGV4YW1wbGUgKHVzZSBgYGBjYWwgMjAx
N2BgYCB0byBnZXQgYW4gaWRlYSk6Ci0KLSogRGV2ZWxvcG1lbnQgcGVyaW9kOiAyMDE3IEp1bmUg
MTEgLSAyMDE3IFNlcHRlbWJlciAyOQotICAgICogdGhlICJjdXQtb2ZmIGRhdGUiIGlzIDIwMTcg
U2VwdGVtYmVyIDI5Ci0gICAgKiB0aGUgImxhc3QgcG9zdGluZyBkYXRlIiBpcyAyMDE3IFNlcHRl
bWJlciAxNQotKiBGcmVlemUgcGVyaW9kOiAyMDE3IE9jdG9iZXIgMiAtIDIwMTcgRGVjZW1iZXIg
NwotICAgICogdGhlIGFudGljaXBhdGVkIHJlbGVhc2UgZGF0ZSBpcyAyMDE3IERlY2VtYmVyIDcK
LQogIyBUaGUgZGlmZmVyZW50IHJvbGVzIGluIGEgWGVuIHJlbGVhc2UKIAogIyMgUmVsZWFzZSBN
YW5hZ2VyCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
