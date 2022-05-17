Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A752AC20
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 21:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331463.554994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr34t-0002RH-VR; Tue, 17 May 2022 19:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331463.554994; Tue, 17 May 2022 19:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr34t-0002OP-Qz; Tue, 17 May 2022 19:41:55 +0000
Received: by outflank-mailman (input) for mailman id 331463;
 Tue, 17 May 2022 19:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juf1=VZ=citrix.com=prvs=1294c2b73=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nr34r-0001wE-Oi
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 19:41:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 656cda25-d619-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 21:41:52 +0200 (CEST)
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
X-Inumbo-ID: 656cda25-d619-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652816512;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7CmCVRbGWxxf/cZI+wx0QRydisRwi8JPYEo/uVFZczw=;
  b=K6R2IkHAtauYhqcaGXvI90Vt8aru+k9q0fVVCqM6v9XpAaJygDi22BXZ
   q+1S65a7e6Ous8jRlMjznGanxVO2GavCa0kGwR/l2geX3qCTKMxMCKJxl
   VSZlxs2uFVkz8F0EAd54tFypBpXQxvGe/D5EN52+FGlVKcilEg2+ZaSKS
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70912451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nsfEzKDcqSVC0BVW/77jw5YqxClBgxIJ4kV8jS/XYbTApD530GMAm
 GtLCmDSaKreZjHyfYxzYI2+8kIG78KDzIRhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhKx
 MpIsduXFzsHAYDNkeFMQQRhGQxhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp8WTK+EO
 5dAAdZpRAv9XD5NeWtKNMgnlcv410TgYgd7hmvA8MLb5ECMlVcsgdABKuH9fsGBTINbl0CTq
 2bC4kzwGBRcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+X1ahveOwjEL4XttFM
 lEV4QInt610/0uuJvH2Vge0p3OstRcGV91dVeY97Wml0K3P6RyeAWsCZjFEYd0i8sQxQFQC1
 FCTmMjyLSdyq7DTQnWYnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdptH7ED7/w
 jeOrQAlmq4ey8UM0s2T/03Dgj+qjojESEgy/Aq/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpg
 ZQfs5HAtqZUV8jLzXHTBrVWdF202xqbGAbQnltrWL5/yxqS1n+qeNFC/Qh0CVg8Z67oZgTVS
 EPUvApQ4rpaM32rcbJ7buqNNig68UTzPY+7D66JN7KidrA0LVbap382OSZ8yki3yCARfbcD1
 YB3mCpGJVITEuxZwTW/XI/xOpd7l3lllQs/qX0WpilLMIZyhlbIEN/p03PUN4jVCZ9oRy2Mq
 r5i2zOikUk3bQEHSnC/HXQvBV4LN2MnIpv9ttZacOWOSiI/Rjx7W6aLne54Jdc990iwqgsv1
 ijtMnK0NXKl3SGXQel0Qi4LhEzTsWZX8itgYH1E0aeA0Hk/e4e/hJrzhLNsFYTLANdLlKYuJ
 9FcIp3oKq0WFlzvpmVGBbGg/dMKSfherV/XV8ZTSGNnL8AIqs2g0oKMQzYDAwFVUHbm7ZZk8
 uT5vu4ZKLJaLzlf4A/tQKrH5zuMUbI1wYqeg2OgzgFvRXjR
IronPort-HdrOrdr: A9a23:q0xgdqz8OFwG9K9/EiYcKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="70912451"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Luca Fancellu <luca.fancellu@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, George Dunlap <george.dunlap@eu.citrix.com>,
	"Nick Rosbrook" <rosbrookn@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/2] Fix some problems with "arm/dom0less: assign dom0less guests to cpupools"
Date: Tue, 17 May 2022 20:41:11 +0100
Message-ID: <20220517194113.2574-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ARM folks: Please be rather more careful when exposing hypervisor internals to
arbitrary user input.  Being domain_create, the fallout is unlikely to be an
security issue if it had gotten into a release, but Xen will definitely have
an unhappy time with unexpected scheduler state.

George/Nick: The Golang bindings seem pre-existingly broken.  I get the
following spew which is unrelated to this change:

  ./helpers.gen.go:800[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:1320]: cannot use _Ctype_ulong(numVcpus) * _Cconst_sizeof_libxl_sched_params (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:1292[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:1960]: cannot use _Ctype_ulong(numVcpuHardAffinity) * _Cconst_sizeof_libxl_bitmap (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:1302[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:1970]: cannot use _Ctype_ulong(numVcpuSoftAffinity) * _Cconst_sizeof_libxl_bitmap (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:1336[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:2008]: cannot use _Ctype_ulong(numVnumaNodes) * _Cconst_sizeof_libxl_vnode_info (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:1379[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:2063]: cannot use _Ctype_ulong(numIoports) * _Cconst_sizeof_libxl_ioport_range (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:1397[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:2081]: cannot use _Ctype_ulong(numIomem) * _Cconst_sizeof_libxl_iomem_range (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:2518[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:3919]: cannot use _Ctype_ulong(numConnectors) * _Cconst_sizeof_libxl_connector_param (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:2676[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:4182]: cannot use _Ctype_ulong(numVsndStreams) * _Cconst_sizeof_libxl_vsnd_stream (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:2741[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:4288]: cannot use _Ctype_ulong(numVsndPcms) * _Cconst_sizeof_libxl_vsnd_pcm (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:2930[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:4540]: cannot use _Ctype_ulong(numDisks) * _Cconst_sizeof_libxl_device_disk (type _Ctype_ulong) as type _Ctype_size_t in argument to _Cfunc__CMalloc
  ./helpers.gen.go:2930[/tmp/go-build762104750/_/local/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:4540]: too many errors

but this is where my knowledge ends.  Needless to say, the golang bindings
haven't been regenerated with this change in place.

Roger/Stefano/Doug: Given the golang breakage, we are presuamably lacking
golang from any of the CI containers.

Andrew Cooper (2):
  xen/cpupool: Reject attempts to add a domain to CPUPOOLID_NONE
  tools/ocaml: Fix stubs the introduction of domain_create.cpupool_id

 tools/ocaml/libs/xc/xenctrl.ml      | 1 +
 tools/ocaml/libs/xc/xenctrl.mli     | 1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 8 +++++++-
 xen/common/sched/cpupool.c          | 2 --
 4 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.11.0


