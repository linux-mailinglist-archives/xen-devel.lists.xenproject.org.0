Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A315634A8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 13:00:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hknoi-00089Y-5Q; Tue, 09 Jul 2019 10:57:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFz=VG=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hknog-00089R-GO
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 10:57:46 +0000
X-Inumbo-ID: 6110ce0d-a238-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6110ce0d-a238-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 10:57:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p197so13108888lfa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2wDQWBqvAEoSuS/0J11fCkmm9yMFNHNL5CK5RJDB/K8=;
 b=vKL4r8lqc4imTKWXRrdyjJNiwvZbEYqxYUCiPiYmncevMn+000zS0umsVQa3khmzGl
 JTC89tAV4lzMdaVNqs1GhlvRLGdVcBEZ7ZOG2ywF2jsW9jr/UeK+Q/lxm+d1YjlKPZnH
 llPF7PSjzl/vIJlAemOiK7bU/a3sk5tKXCecrQ/HlC66SpMFK+wKioXY5fCHfgsH+Riz
 dbXhxgqzM+vSHbmlK8wHBWOAjm7dEfdYouVq/S4vDDte21U0LGx4f0AyRl697J+qcRXw
 2BNwQx/+FCRwDHrmwWLTAi06RCNsP94h2z1Vkxu0ZtWI0pAUE5zGY85S7ErPUzobx8tj
 CDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2wDQWBqvAEoSuS/0J11fCkmm9yMFNHNL5CK5RJDB/K8=;
 b=kYbBsIpPoyfrij9J5HYG8EtGcPUA0Bw6A+e/0QtUGzFup8QgGecgzpcscCujMzn48Z
 y/IgElvaUimJ6bh1PfOdTjbsFNHyHNddH/V4XI5CN5mvSksPQLatYYDW6M61YcoZMZQh
 EXp/bBSQv59evSI0kv035tPKDKGWRPqLUqDS/Lfggm2oR034N6KVs6MUocs/gs6nhnLZ
 +3ZsNAD5bVrM/qm/OdUW2Kk8Ri66D7kTPCZRNcet4PFz8pB7mydWYg2DHSibT3JWSXH1
 eDQXVaB3BrT6q5u17boC9/68YCqo4X4VO7oJuBupyHLvGvpFNQGbG3LMaX7nH/MSfOSe
 1xEw==
X-Gm-Message-State: APjAAAW5HRBtI2qhAI/1Gfsv/y0evoPTfhG8hYkjjijRoG0POJeP7gT6
 V7w9L51jgz7faomyEyX4+QrfcgK3FoI=
X-Google-Smtp-Source: APXvYqzbhBt3BmtWMoCRvzDgFzg7is8Xwkf35YVr1nzyRzULWU9eP6OZsLD6bEkqtK8H2KxIJ99ojg==
X-Received: by 2002:a19:ca4b:: with SMTP id h11mr10859656lfj.162.1562669863479; 
 Tue, 09 Jul 2019 03:57:43 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id t4sm4756986ljh.9.2019.07.09.03.57.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 03:57:43 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  9 Jul 2019 13:56:17 +0300
Message-Id: <20190709105617.16088-1-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/doc: remove obsolete warning about testing
 gcov on arm
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVtb3ZlIG9ic29sZXRlIHdhcm5pbmcgYWJvdXQgdGVzdGluZyBnY292IG9uIGFybS4KZ2NvdiBo
YXMgYmVlbiBmaXhlZCBhbmQgdGVzdGVkIHdpdGggYXJtIGh3IHByZXZpb3VzbHkKClNlZSBjb21t
aXQgNmFjNjZjOQoKU2lnbmVkLW9mZi1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3JfbWl0aW5AZXBh
bS5jb20+Ci0tLQogZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUtY292ZXJhZ2UucnN0IHwgNyAt
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2Nz
L2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QgYi9kb2NzL2h5cGVydmlzb3ItZ3Vp
ZGUvY29kZS1jb3ZlcmFnZS5yc3QKaW5kZXggM2NlYmYyZDk2ZS4uOTQ3ZWU0ODcwMSAxMDA2NDQK
LS0tIGEvZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUtY292ZXJhZ2UucnN0CisrKyBiL2RvY3Mv
aHlwZXJ2aXNvci1ndWlkZS9jb2RlLWNvdmVyYWdlLnJzdApAQCAtNiwxMyArNiw2IEBAIHRoZSBj
b3ZlcmFnZSBvZiBpdHMgb3duIGJhc2ljIGJsb2Nrcy4gIEJlaW5nIGEgcGllY2Ugb2Ygc3lzdGVt
IHNvZnR3YXJlIHJhdGhlcgogdGhhbiBhIHVzZXJzcGFjZSwgaXQgY2FuJ3QgYXV0b21hdGljYWxs
eSB3cml0ZSBjb3ZlcmFnZSBvdXQgdG8gdGhlIGZpbGVzeXN0ZW0sCiBzbyBzb21lIGV4dHJhIHN0
ZXBzIGFyZSByZXF1aXJlZCB0byBjb2xsZWN0IGFuZCBwcm9jZXNzIHRoZSBkYXRhLgogCi0uLiB3
YXJuaW5nOjoKLQotICBDb3ZlcmFnZSBoYXMgb25seSBiZWVuIHRlc3RlZCBvbiB4ODYgYXQgdGhl
IG1vbWVudC4gIEFSTSBkb2Vzbid0IGN1cnJlbnRseQotICBib290IHdoZW4gdGhlIGZpbmFsIGJp
bmFyeSBleGNlZWRzIDJNQiBpbiBzaXplLCBhbmQgdGhlIGNvdmVyYWdlIGJ1aWxkIHRlbmRzCi0g
IHRvIGV4Y2VlZHMgdGhpcyBsaW1pdC4KLQotCiBDb21waWxpbmcgWGVuCiAtLS0tLS0tLS0tLS0t
CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
