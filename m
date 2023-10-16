Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D27CA84B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 14:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617518.960158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMxh-00054G-9I; Mon, 16 Oct 2023 12:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617518.960158; Mon, 16 Oct 2023 12:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMxh-00051k-6D; Mon, 16 Oct 2023 12:44:45 +0000
Received: by outflank-mailman (input) for mailman id 617518;
 Mon, 16 Oct 2023 12:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fZZ=F6=citrix.com=prvs=646b5f8ff=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qsMxf-00051a-6B
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 12:44:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4633894-6c21-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 14:44:40 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2023 08:44:36 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BL1PR03MB6152.namprd03.prod.outlook.com (2603:10b6:208:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 12:44:32 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::831e:28d1:34dc:f518%5]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 12:44:32 +0000
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
X-Inumbo-ID: c4633894-6c21-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697460280;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6XraHbviahjomvp/YvQCj3qJrnKbz6q2Bx5IgdEk+G0=;
  b=LHJMceZb1UMuCn2zc2Lo9hocW4eKTO6l8za5rviG/ghKS4jZuwp2Ow/m
   Xw3TRQc2oYgMLK81L19qXC2Hp0OfQPDYRuH2TqKeqQMXSeqQKbrIf/9XT
   inTr4cgsc76l/zdnGa6w8kUlWWVpy0PdZg+HJvWsW8AFqc6unwira5qdv
   0=;
X-CSE-ConnectionGUID: Tlqp4NIVT6Wdgm0PAb7tSQ==
X-CSE-MsgGUID: oQiAVn+mTfmXvtC4YQCqiQ==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 125567345
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:lDT4Qa3WBt8Z7EAZR/bD5Qlwkn2cJEfYwER7XKvMYLTBsI5bp2QAz
 zAdXmzXbq3cZGGnfNh+PY/i9E1SvJKGmtAyGQI/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRnO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPWVX7
 aA+CQ4xMC+PiOfu+JuxFfVXv5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LKSw3ygBN96+LuQ8cdrqWOVhWkvBhgmS0eQ/ciAoVe/YocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUSyAyL0LuS3A+fCUANVDsHY9sj3Oc0WDgr2
 1mhj97vQzt1v9W9UmmB/72ZqTezPyk9LmIYYyIACwwf7LHLv4Ubnh/JCNF5H8adntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJjPZ/S3SV2Ohqwl/NIisYtXy7UCBtKgQaoGEUlOGo
 X4I3dCE6/wDBo2MkyrLR/gRGLau5LCONzi0bUNTIqTNPg+FoxaLFb28KhknTKu1Gq7ooQPUX
 XI=
IronPort-HdrOrdr: A9a23:yUGHXKt+quwYFvamkPlAZsXI7skDjNV00zEX/kB9WHVpm6yj+v
 xG+85rsSMc6QxhPU3I/OrrBEDuexzhHPJOj7X5Xo3SPjUO2lHJEGgK1+KLrwEIcxeUygc379
 YCT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-Talos-CUID: 9a23:jiflxW1LcRylo6E6v0UXCLxfJsQ8aiH77UnsfXC0BmMxcJSfFkOrwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AKVmv6g/aBsDn4+yrufoq+xyQf8BR4o2QDgMIrZs?=
 =?us-ascii?q?Di9eYHnBBAhyEjQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,229,1694750400"; 
   d="scan'208";a="125567345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWtallO9Et7Jaycphxzk5WPsfV2zOVKryZ8gxvNonCfh4+NaVIqwt9ODeliQc6j80iuz/cUJDjphefIRx99nKT0sK1MA+JLoTmLR9mAT957S4gKdws2orV03k6I6WdXkVrQS3OPan6bpaV4Anjl+1HEBG0b9RoLm5I4ay9bysw9hkB0dKkyoWjaKSIN7+jUZ25LfKn4KhSCAFAXt1DP1ZCygr1RN7wfowyh+QfdojN3UgMmpnQVgTRCwdolHmNP9UXEmhsuuPguWgSov7QpofvAVNtGgjNblWosGp/m7fRhvqObVo6uvMvgmeZmR77WXDYQk5fnj73GcjKi75zNM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzKPBiwIo3gncxI6c/W5XVQRYmsaYfOt39nGJp8DiAY=;
 b=Oihl6JbSQ60PplmcQ1QR4dnhJYFmdUc9mWQc/vFRboIQWi0a6LsrnIyet+5m5xP8qh425y+zhNvEEzebntsP9thLUWk9pccgcHXUcTvy1crL3zE42PjGGlyzFWJBeVPOqhJZSq4pSnrAlwdCq4mDguylUnxVyCeUX1DQCVAQI7WJBKo1DpPYV/SmIcLwPnlT6SmVjZzWDRwDIVjEhNxvw9Wsh3TeM6TbSIB9iuXmfPG/45+WQ+7KiSaPjR0wlX3l1/E5s+0lCRoRCKJt/+d4vO44aBcUFVmwCXZiyXBZy0+sWQZTlm3hpjDy9wFvntz+B2NAX3ih/FDu5nkgOReV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzKPBiwIo3gncxI6c/W5XVQRYmsaYfOt39nGJp8DiAY=;
 b=Xjchx625Vke4T+bVsXXy+IkgRLepBjqHyTJ49CUU7GuBCpgB3tyu7z5nhYVb9hQ96YkYszMiCyfpcPRy0zxawRd8x8JLD8untL90SDuKfPh4k8PzIXvaBXu4POpqiCQQHvCTyyC5AuQgTCe0oSDcHOSxq+H3MpSBbKOKzTbvw2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Oct 2023 14:44:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] domain: fix misaligned unmap address in
 {,un}map_guest_area()
Message-ID: <ZS0wKWr8yjwwdpk8@macbook>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-2-roger.pau@citrix.com>
 <6442445a-458d-3ccd-057c-f8d2ac208232@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6442445a-458d-3ccd-057c-f8d2ac208232@suse.com>
X-ClientProxiedBy: LO3P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::16) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BL1PR03MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 3589a695-db67-4b53-62f2-08dbce45a529
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IEu3lKEGjNwQto79XO4TmSSC0z6BZLwTy9KHblG4ogHSU47enL/xAAk08g2eLkw75G2yCVwBjoMMaTyUR52X+eIaCeaqoOFw5mpoaFrg++UYEF+KKWe2B88krLUO6W8eJJVdp+pWTwJZKp7NYc0BEV7CrKrxz7r61u/OzjsiJ53ekZv1xRg/AIOPGP7QwYE5rFquSxlfeoYdpxKjbYsR1GtcwYrPXMgZW+pyDDB5PuAM25pE0hZ01Jx/9ausiy4EOlKawT5R40H7MomT3IY5Udb6mCQibaeZZNvMsQLEqqh3UxVOdtsvgqKaln1P/Dh8puUeeogpXeni4daXdMqCIt4Y5zZoAaHrmZ1klKebJY6BnkOEtMKBrwmRfqX5rS4FjHp+2CNgv6tmvgWkv2PFzdnKR46xM8lnGh7IAFz2v4qsiKXJpPBEgqlNPfESpq8rD6+wmef76HUhkrEiL+k/rYKbpR8zhtm0M+nSo7pQq/3UcVbhL/dJeKlKilA9mqVlKEuqaEKTIO8h2tWEg43okXhWgbYZswvShlGscofzRQdmnKLF88sm8MP4vbkphMtt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6916009)(316002)(66946007)(66476007)(54906003)(66556008)(26005)(85182001)(83380400001)(9686003)(6512007)(82960400001)(38100700002)(86362001)(478600001)(33716001)(6486002)(6666004)(6506007)(41300700001)(5660300002)(2906002)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlFrZ2RPK1RpTTVIWTdiLzJTbkc1bDFhOXJPc0dJc1A5UVU2Q3RiUHUvWC9Y?=
 =?utf-8?B?L3NGSzFUMmd3Y1JIbzJDUStjUWV0SUZNZ3ZmUEJSTHpuNnVYOVFoTGlEUXN1?=
 =?utf-8?B?aThsYWJWWTJpYmxGc2w3aUtIeHQySUdveS9nUTB5OG1maTNtT0FmRlYwS3lG?=
 =?utf-8?B?WGltb2ZPRE1Hb2lFWE41OUd3Wkdzdk8vcWYzUzhDSDJPRFFRdk5UR3d6MkZK?=
 =?utf-8?B?ckNkUUpSY3ljQUhGNmFQdGxSbU92NndSdDR5RHhGaXJsSnV5ZVlHS3k1eGFt?=
 =?utf-8?B?T3Z1bHUyNDlnVUJjZk5kaEFpQk1QUzNpWTZ6Vm96c3NwTmJyS3FyZXgzcE5Z?=
 =?utf-8?B?aHlqTHRsNmlxYmRSRlNpNUZtUGtnT1FzWFpiRE9xcEFVWXZKZlo2bWpxWGx6?=
 =?utf-8?B?eVZFaDBicjNSUEZXMUJvNlRoSGN5bVNZNEJwWjZ5TlNDd0lxaUs5M0pPTkJG?=
 =?utf-8?B?WDA3WE9pQ1plSWVGU0kvOTNTSUNCUlJpblFTNW9MMnN2UGJ1Tm0yb1JBdTQ0?=
 =?utf-8?B?b0ZOWENlSW1KZW1PVSs5c2RkRTY4WkhZckVUaENYRUxCaWxHek5CUXpjN2Ri?=
 =?utf-8?B?a2ZzNkg3TUh4WTJLeEZ2bjgwcHpoMUszR0FIQzJUVEZGa2t2aTJTdzNFN05h?=
 =?utf-8?B?bGdWMVJGanVpNUFYcGVhU2x1b0MxZnlnNlhYemxTdDJpUDJ3eWZPSHZQZ1p2?=
 =?utf-8?B?RkpVdkUrZFlSUjJDUUVtU2JQZ3p6OFVaazhNQlRUN1k2RlM2N1lrZzlvZnVi?=
 =?utf-8?B?RFgrQkwzZ1J5cTUvemhsLzBmVFRpWkQvRGFNRU5LSnhZbzV1SWNnTURpNlpG?=
 =?utf-8?B?dXRqU243Zm1UQVJJVjRaeDA1ZHJaR1cwTXdEaUplZ2psY1JJMHMzdjFvV2Vq?=
 =?utf-8?B?WWkvT3NOTHdEVW5vdGdPd0oxandYZWhtMzQ4RVdoRHN5ZlAycW9UTUJlZ2Fj?=
 =?utf-8?B?eE81SHFTUXR1eUtxQi9XbTlDNHcvSnJWN0Nyc1RUSXpsWFgwUnk2UHpFazRW?=
 =?utf-8?B?aFphNkNKQTN5OW91WTRlVDJKNFhJR1RrSGxJa1Y0T2FGVFpFM2xJM2MwWnFR?=
 =?utf-8?B?V1NiVVIzbk1IUXpaSVJONGJrdDFDd28yb24raVhaZG9GcndiV2Z5SVRTYURh?=
 =?utf-8?B?QUxsN0tKSEtxVStLa3M1MzNCT3pLaHZmR3BDb3g1b0RZSElNOWlPZkVmWlBK?=
 =?utf-8?B?bVozdjM4MnhkVWdWSFRnZXpUWGlpdG9XV1BJenVwMS9FMWxnU1l0dFZmS3h2?=
 =?utf-8?B?SVJSYmk1WnVtaWNHVTIxOFF2L3NlUC8vQlNkSkd5Qm9URmM5SnBENlJJaUd6?=
 =?utf-8?B?NnZCM1NpbEt4Y0RQTDRqYkhtQi85U29iTVJ1K01IMmprWHlvUW1HNFNKQTJT?=
 =?utf-8?B?TzJvTFlFaWtmbHVpemhlK0FkMDNneU1reXZqRmdUZko4anBKUVpUdm5nSHVR?=
 =?utf-8?B?NHIvcVpVT1hXZHdQdmV1R2NLWE1PMUFCcFVLYWtCR3BDZFMvZTN6b2RieTVO?=
 =?utf-8?B?ZnYveUpjelpqbXBGcVIrdm9qTEtvaDY4UktOWGhwTGExSXl1UW1zc1lWVnFz?=
 =?utf-8?B?eWg5VjEvaG0wZStZNHB2NVdsNHliTnVUOVJ4T2JDc1FvWFlzSElNLzljSWl6?=
 =?utf-8?B?YThmOVArVytZTUpWL1JpRzg1OVlBOW0rM3FYUERMNm4xMGRYNjREUXNYdXZD?=
 =?utf-8?B?ZHEybXVDdXg4ZWo1ekJPL1VjUVMrQkNJTGQyS0w5d3hYYVZHR3gzWUEzNjVN?=
 =?utf-8?B?RWt3YVg2VWlVTmcyOTJEcWlLa3M0ZHNDTXVqbHRVblVaNkZuZjhxcDNaZjVk?=
 =?utf-8?B?NWx2ZXBiRklpc0hLaGlTamJuTWJIVkxheFVGRGJob3ZselpDUVRkdUVCOGMz?=
 =?utf-8?B?TDJvcEI2Y1ZvcG9Pd3llaEIwK3o1Q0s3cTBKK1VlTHZ0RHBrUmhkQVJBdHhN?=
 =?utf-8?B?ZGlBbCtxNkJ0Wml4c1hObDdncXlzOURSaDNLcDlGendHNmxobStwZThuUWlo?=
 =?utf-8?B?Lys2WGlKQTNMdGhKYmFxU0xsQVhmR3VRc1gxVTNmdzRSVVpITEthSDJHdkdi?=
 =?utf-8?B?dTI4VlQ4VFBtaEZCaFZvdFhoZDlIWkdabm5RWGI2ZUVSRkM1cmxoN1ZaWFlu?=
 =?utf-8?Q?5WEqBJ1qZ4ub3qjO8uJCfBoNQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ahThfwDEL3eRMgl2BGD/tB5CV+D9lnqVbPb5JfeMUlq9i0pAJ0cVsoq8ZDoeFI6sliWZYlprnAMtJ3O6y/pG06TWKTOB3FJLNvP+QyjWQaHW54M9xqKrnYxahpGVK7iaAn8UhFkcNNI7JfFISClI86idT6UYu317wGHOW99/j3OkPbvUNzt/4D4APH6sxul9mMFS+rlBXW6MihzjZf37mzp4r3T9rdyB5CkXvh5Rn2mZWtPhxuAJO48YyapddrAg6462VqRnk2a9hGmYHuzt/mGMUs6xTLKvh9Kw+65GLHYkYZLE7egX8DGlDCqmVw9H6M5aV7u57U9krTNBzZ0saC3tafs2f764jl29wwddT0Al4617R51iGAa1Viv4IykL47Pd7S0OHgqDO/axvsdqlBZx4r6kU7XEWdWz8XP2WyUdHj0Np8HWIsn61dZsi9rNo2IPc6P+UaKoYcJiL4d4aQ7v1wooaeR/TObtGO0k/Hnalc31JTibroK3nG21mHC5IpsRxywXab50u9YqKnxbydphQmHN7BCjJWeI05gkB3nNTXkTj1gNPELugYuFxiIaZioHVRVNDF/ET1jXw7N+r44rE/sIl/y/g3mImskavuxrVBRkI/IE0KjQIa5yy2EDxBnmhAzgBfDo8FrkgM9bUPQ/B9+Td6NbmGY2Tn5Z0jkxnWhhX6Yt5Om/nmACdAYT2nCilB8i+5/qD0RFd3jH+AOWKFzinlqkIzJDG7IDpdmnz6Ek9MghfcmL9RcIzwgvSQ4RE8hEHp+BmkhR7BeQG2ddhCKxklwtXMhSsBFWZAJxeG4FeNR4Qr1OMDkTgv3OJcqoH970Ik6RkxH4Rl5nmqsrfPgTTEg6rBVLMtM64uUFZu2a3s9hzOkSkioqA6Jx
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3589a695-db67-4b53-62f2-08dbce45a529
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 12:44:32.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3X+HYi/plMb6YFT0Z2WJIXI4gQErbiX+1e6dW52qM7McKj5obSftk+XsD7Pq0um0kRrbNJUALCfzoz9pY1heg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6152

On Mon, Oct 16, 2023 at 02:30:12PM +0200, Jan Beulich wrote:
> On 06.10.2023 15:00, Roger Pau Monne wrote:> --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1601,7 +1601,7 @@ int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
> >   unmap:
> >      if ( pg )
> >      {
> > -        unmap_domain_page_global(map);
> > +        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
> >          put_page_and_type(pg);
> >      }
> >  
> > @@ -1634,7 +1634,7 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
> >  
> >      if ( pg )
> >      {
> > -        unmap_domain_page_global(map);
> > +        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
> >          put_page_and_type(pg);
> >      }
> >  }
> 
> On v1 in a reply to Julien you talk of "limiting misuse" by not relaxing
> expecations in Arm's backing code, but I wonder what kind of misuse you
> think about. Aiui there's no strong need to insist on page aligned input,
> and relaxing things there may simplify code elsewhere as well.

destroy_xen_mappings() both on Arm and x86 will trigger asserts if the
passed address is not page aligned.  I do think it makes sense to call
unmap_domain_page_global() with page-aligned addresses, as that could
help detect bogus callers or corrupted data passed as input.

IMO an assert for page aligned input address should be placed at
vunmap() in order to not get differing expectations on input address
being page aligned or not whether destroy_xen_mappings() or
map_pages_to_xen() is used.  map_pages_to_xen() doesn't require
page-aligned virtual addresses as input.

Roger.

