Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF60521C5B
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325743.548455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQv0-0007QJ-W3; Tue, 10 May 2022 14:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325743.548455; Tue, 10 May 2022 14:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQv0-0007Nt-Qn; Tue, 10 May 2022 14:32:54 +0000
Received: by outflank-mailman (input) for mailman id 325743;
 Tue, 10 May 2022 14:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETdG=VS=citrix.com=prvs=12211c048=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1noQuy-0007Nj-Uq
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:32:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 118c426e-d06e-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 16:32:51 +0200 (CEST)
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
X-Inumbo-ID: 118c426e-d06e-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652193171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wtDnE8O9gH7ClDAx5krhI8a68miaq6DilvRU+KMtMkc=;
  b=X9hLoULZv3LtXOyHvSvf61xlE7mr2NZ6rZb6QsOA1jIl6qwHppJN9Sjz
   nenX2q4hWi32b4PUpbclTgAgA1FqXvvlTJ/Jq+F14k4g06RFEImQqK2RG
   MtbQ/4Kyu/3zdMFUmpLGXz8FCnpybBUssliRS865mbUatIEWWq9XUYq57
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70372801
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8FF75KD2uwdNcRVW/zrjw5YqxClBgxIJ4kV8jS/XYbTApDsmgjIBm
 2MXXGiFP/2NMGr1c9t0bI229U1Su5bQm9RjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhp+
 tpdrp2ITD1yM/3zvrUXUxZWMh1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8WRqmEN
 5JAAdZpRDrcTh9LHncQM7UZhf+Gq2S4YQx/q03A8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHMOb4SqI9DSrnOCntSHmXIMfEpWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwajvHeOsxoYWtxRO+438geAzuzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmKWnRmKG94+Rl2i/aRczfGUCaiElcSJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaVUwYnY1RvHNEghBHFb5JOhtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/W6TI68CaCEMoITCnSUSONg1Hs1DXN8Iki3yBR8+U3BE
 cnznTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVLfQ5iwLlSLc2elvG7gcbZfFU8RDF6W6+5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:2qc6QKpwP2R2F4oc/CfVWYcaV5oTeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc7wxhPk3I+OrwXJVoLkmxyXcY2+Ys1PKZLXDbUQiTXeRfBOnZsl7d8kTFn4Y3v8
 pdmupFeb/N5DBB/L7HCWKDc+rIruPozJyV
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70372801"
Date: Tue, 10 May 2022 15:32:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Lin Liu <lin.liu@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Message-ID: <Ynp3jTdIy9Qzmi8d@perard.uk.xensource.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>

On Tue, May 10, 2022 at 06:15:22AM -0400, Lin Liu wrote:
> Update to use byteswap to swap bytes.
> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

FYI, this patch breaks build of stubdomain:

In file included from /var/tmp/git.xen.lU52/stubdom/include/../../xen/common/unxz.c:124,
                 from xg_dom_decompress_unsafe_xz.c:40:
/var/tmp/git.xen.lU52/stubdom/include/../../xen/common/xz/dec_stream.c: In function ‘dec_stream_header’:
/var/tmp/git.xen.lU52/stubdom/include/../../xen/common/xz/private.h:31:21: error: implicit declaration of function ‘le32_to_cpu’; did you mean ‘le32_to_cpup’? [-Werror=implicit-function-declaration]
   31 | #define get_le32(p) le32_to_cpu(*(const uint32_t *)(p))
      |                     ^~~~~~~~~~~
/var/tmp/git.xen.lU52/stubdom/include/../../xen/common/xz/dec_stream.c:393:7: note: in expansion of macro ‘get_le32’
  393 |    != get_le32(s->temp.buf + HEADER_MAGIC_SIZE + 2))
      |       ^~~~~~~~
cc1: all warnings being treated as errors
make[2]: *** [/var/tmp/git.xen.lU52/stubdom/libs-x86_64/guest/../../../tools/Rules.mk:150: xg_dom_decompress_unsafe_xz.o] Error 1
make[1]: *** [Makefile:367: libs-x86_64/guest/libxenguest.a] Error 2
make: *** [Makefile:73: build-stubdom] Error 2

Cheers,

-- 
Anthony PERARD

