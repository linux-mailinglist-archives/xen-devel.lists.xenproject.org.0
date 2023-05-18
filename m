Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D2708581
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 18:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536450.834801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzg4z-00074L-HP; Thu, 18 May 2023 16:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536450.834801; Thu, 18 May 2023 16:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzg4z-00071s-De; Thu, 18 May 2023 16:02:13 +0000
Received: by outflank-mailman (input) for mailman id 536450;
 Thu, 18 May 2023 16:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvkS=BH=citrix.com=prvs=495754ba3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pzg4y-0006xf-1V
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 16:02:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a52496-f595-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 18:02:08 +0200 (CEST)
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
X-Inumbo-ID: 56a52496-f595-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684425729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJjMOipmfKuyICk91c6ZWe8Uz+qr7h8zmhitlprumOg=;
  b=EP9kE8kSDxTdvTNgMivC45C/8Kwi6TpW2JoiERglNjvaw1PxUxIQMpRw
   aDHZHV9NbnfAkGErSBafYtA7Heyhz2qzM/vBKV8qc33iV5wJZazccJlFo
   U9IqjtrF38Rr40FfneeylCKKHLHvYcXO3IZfnJtP6csbU6xXLisUC4nEM
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109429920
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JpsXya4go2v6qEXt8K5yfwxRtO7HchMFZxGqfqrLsTDasY5as4F+v
 mIaWG7TPPrZYDemLtwiaYy/phxTvZPdnYRqSwE4rSg0Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 P0iMSACcUy/2LyLz5zrcbdSjMAzM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7J+
 jiXrj6hav0cHNmR5AKv3FCqv7T0ggylU6hKEJua0fE/1TV/wURMUUZLBDNXu8KRlE+9Qdtab
 UMd4CoxpKwa/UmnCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRu3OCMVJGtEYjUWQA8t6tzv5oo0i3rnUdJLAKOzyNrvFlnYy
 iiHtiEki50PjMQA0OOw+lWvvt63jsGXFEhvvFyRBz/7qFojP+ZJerBE93D+7MxZPImGEmXe4
 kULtZilst4ECYGSwXnlrPo2IJml4POMMTv5iFFpHoU8+znFx0NPbby88xkleh43b59slSvBJ
 RaK5FgPvMM70G6CN/cfXm6nNyg9IUEM//zBX+ucUNdBa4MZmOSvrHA3Ph74M4wAfSERfUAD1
 XWzK57E4ZUyU/4PIN+KqwA1j9cWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 YYDbJfalkwHDLSmCsUyzWL0BQFiEJTGLcqu95w/mhCreWKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ3K0PGHX3CWdQS3TMyALVV8adconxZ7NFXB2bAnANrlKSdrH0ZrzgLNrJOB9rLQ+kK4lJ
 xTHEu3Zaslypv3802x1RfHAQEZKL3xHWSrm0/KZXQUC
IronPort-HdrOrdr: A9a23:vPx2SK7N3J7BVCuYswPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-Talos-CUID: 9a23:t5ZgmW55Ush0crHkTtss0U8uA9AqbSHhkyntLGHoMjhXQrmFVgrF
X-Talos-MUID: 9a23:mpd9BAY2z5JYhOBTsjHBvBtMFsFRuJ+xJx4Gu80CneujOnkl
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109429920"
Date: Thu, 18 May 2023 17:01:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<michal.orzel@amd.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN][PATCH v6 19/19] tools/xl: Add new xl command overlay for
 device tree overlay support
Message-ID: <b5d77faa-e20d-4648-b900-8474e3574844@perard>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-20-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502233650.20121-20-vikram.garhwal@amd.com>

On Tue, May 02, 2023 at 04:36:50PM -0700, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

