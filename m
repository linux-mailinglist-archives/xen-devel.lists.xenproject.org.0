Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64A640558
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 11:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451789.709561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13in-0003tO-Hz; Fri, 02 Dec 2022 10:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451789.709561; Fri, 02 Dec 2022 10:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13in-0003rb-Ew; Fri, 02 Dec 2022 10:56:45 +0000
Received: by outflank-mailman (input) for mailman id 451789;
 Fri, 02 Dec 2022 10:56:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Iy3=4A=citrix.com=prvs=3285f5271=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p13im-0003rQ-47
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 10:56:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe414016-722f-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 11:56:41 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fe414016-722f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669978601;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j12JT2NhnRPHOdAwEXBwqEt+xv989H3bF+2XQrMtQK0=;
  b=hqE5KY+D52a/3cRWChv2nBc89+ovoJW0g/RKBqRwIo1FaUz1sw6goW8C
   /1T7z+1mU7FI7yA3rY/crc7+ULTrrMgFM9MyL3LwHCfjvdOz0/ScARKOr
   ldtAF4HzlHtBO8QSc+49I24yPImgFJxrx6qHKMVQBiRSccvMLaNc6IMKL
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86240587
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OQWkM6uTJwT9y290L3b1hkl+iOfnVJReMUV32f8akzHdYApBsoF/q
 tZmKT+EPPqINmLxLt10Ptzn8UlXuMfXmtBlGgc9+SAwRSkT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMweCIWZTWPnOCK5rfqQ8tx1997PeDNM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XfjFGqVTTua0t5Gv7xw1tyrn9dtHSf7RmQO0FwBzE/
 j+WoAwVBDkWL+O87TDb7UuzobaRoAK4fLkcOfqno6sCbFq7mTVIVUx+uUGAifWwlEOWQd9UL
 E0QvC00osAa9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsUg8t89Tl5oYpgXrnTMtnEaOzps34H3f32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzlXFRWmA4hh7WKigNoWK9AnAtedpConMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgk0PSZ8PEi3yiDAdJ3T3
 r/FGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLF+ZUaQrQN7tntf7sTODpH
 zF3bpvi9vmieLemPnm/HXA7cjjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yN8O9v/tvpEKcFfkHtO3LUL8MOYh
 sItI62oasmjgByWolzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:WmwMHqBgH1QcdCrlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.96,212,1665460800"; 
   d="scan'208";a="86240587"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v2 0/4] OCaml bindings for hvm_param_get and xc_evtchn_status
Date: Fri, 2 Dec 2022 10:55:55 +0000
Message-ID: <cover.1669978356.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Changes since v1:
* dropped stdint.h patch, still being discussed on where to best fix it
* addressed review comments (see individual patches' changes section)

Edwin Török (4):
  CODING-STYLE: add .editorconfig to clarify indentation uses spaces
  tools/ocaml/libs/xc: add binding to xc_evtchn_status
  tools/ocaml/libs/xc: add hvm_param_get binding
  tools/ocaml: add .clang-format

 .editorconfig                       | 20 ++++++
 tools/ocaml/.clang-format           |  9 +++
 tools/ocaml/libs/Makefile           |  2 +-
 tools/ocaml/libs/xc/META.in         |  2 +-
 tools/ocaml/libs/xc/Makefile        |  2 +-
 tools/ocaml/libs/xc/xenctrl.ml      | 62 ++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl.mli     | 63 ++++++++++++++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c | 99 +++++++++++++++++++++++++++++
 8 files changed, 256 insertions(+), 3 deletions(-)
 create mode 100644 .editorconfig
 create mode 100644 tools/ocaml/.clang-format

-- 
2.34.1


