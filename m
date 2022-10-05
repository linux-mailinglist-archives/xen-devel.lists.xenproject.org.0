Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E185F55C7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416244.660893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4iQ-0007IY-90; Wed, 05 Oct 2022 13:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416244.660893; Wed, 05 Oct 2022 13:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4iQ-0007Gd-5n; Wed, 05 Oct 2022 13:45:38 +0000
Received: by outflank-mailman (input) for mailman id 416244;
 Wed, 05 Oct 2022 13:45:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iqu=2G=citrix.com=prvs=270658c04=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1og4iP-0007GX-3K
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:45:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbe4544a-44b3-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 15:45:35 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 09:45:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5230.namprd03.prod.outlook.com (2603:10b6:208:1f1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 13:45:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::988c:c9e4:ce0d:b37c%4]) with mapi id 15.20.5676.023; Wed, 5 Oct 2022
 13:45:25 +0000
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
X-Inumbo-ID: fbe4544a-44b3-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664977535;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZlQgQWd75HENPekjn1rV+kEHsr27SCsmfFJcgCfzhG4=;
  b=GHv4czevJ8T4akWbb3axKoRfzd0mTM+/Uyb0XW75osOmBTrVLbhje30X
   eRHYEYo/gTrZ2Me8PLXLYG0qPzeF5dKC+vqxesRoAcIqLgNRja0lex7H4
   1OHvb97U+6VqoFya+s+JBapf1p0SEGPNBLIQ88iz+qmACKB/JP4KCIUYk
   8=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 84545140
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oz6Xx6mc0r3OcLo+b2/OLkno5gxxJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXGrUaKmLZGOnLd9+Pt6wo0sH756BxtdhSARk/i88EiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRmOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfI0BH5
 dpDNQk3cj+m3/Ps0rj8VcRnv5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1YZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOnBd5PTeHgnhJsqF3P6FAyLgEtb0O2nsSdjWi6Zo0Fa
 GVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9THuH876OoDCaOC4LLHQDbysJUQsE5db4pIg5yBnIS75LHKOwj/X0Hy/x2
 DGAqCUih7QVgtUP3q/99lfC6xq8q56MQgMr6wH/WmO+8hg/dIOjf5av61XQ8bBHNonxc7Wal
 H0Nmszb5+dXC5iIzXWJWL9UQ+vv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9jZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:e+Tyy6+gj03eQHt6UlNuk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+/3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqjNT7krJ9R7GkmjJl+WiR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="84545140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBhoUa1NXa96DvW/AF5E75LY2vA16QUFIlsRs7LtquOmkMCnEwE4EyrJBYT22ozEtkFwA0/0MkBOtGqqAr/5TLuzm1H6PuSA7fj8zDTljkVr7013FI4phqY5ftS7/to7CwcX1b7vLsWM42iQGpBOjckf+VMTX6KgyhiuuUTHwm0z19+5c64uMzus/Hy+ngtlxNssklpiuDLB1FYxGCQeCTu4NpAeUn9Ks88C48LboqDEsHc+RhHQH+48wR6yUy3Mq7ruSEbmDGL48lhISb5nGQBpHfFp0wak1prxGRXxbUCXulNCWLg31P+uy3CafiETGP0u3OFKahdEi55tcEFJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlQgQWd75HENPekjn1rV+kEHsr27SCsmfFJcgCfzhG4=;
 b=mKSPtBIuqgWhN44Z+y+et/1nbBb4cxW8oU0EqKaYLLG75GxrwhffD1FcMJmxwBkBhxiQNZ9lUFtV2KkdfDox1A2gIR43cJ/iLpp42BtPW3WVp0Vb+8zNB2C5ew1oDLwao5rJ6Ga4t15alCgHC5f84nj7axTuCugfbKY3YUFIt2vBPbMdv3BJk3+W9mmCgABA64hmFJWemyUz/9QKQeEBW5DiHkvxHH5RdczZtQ6GSDnvIA4O/l8Fu89+WiS3+DNzJx7/wS3/DvlKtYg07Q5ZO9E24l0RxdSiL3i12Ga5xjyFgjgivpXfXqwQ+W3r0k+I+bUZnSLWXJYmCDy/BoSdEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlQgQWd75HENPekjn1rV+kEHsr27SCsmfFJcgCfzhG4=;
 b=R9gMi/jiCucBoZm359XFlFsYYh5NOa2f+2BTAm8wdjQ1OhR3b8limyqU3McvNx4saFNOjphraEj5+rqJJxb6dCbU+RZVrJ57IPrug/4v4FsOMRbZKqTDHl4LTPp+X0pqXOg7IT8bn8v6O3kWiUGka8oy2s9KjtLyXVYnSUnhzXo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Thread-Topic: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Thread-Index: AQHY2AuYxJImxml8GUGenwgOwsThN63/X+4AgABkSoCAAAOQAIAACZAA
Date: Wed, 5 Oct 2022 13:45:24 +0000
Message-ID: <478761b2-a47c-147d-b6ae-05c3596dfabf@citrix.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
 <50324b35-5b75-18b6-6ee7-fbe9b5f5d662@suse.com>
 <ccd05cfe-1f77-5bd3-996b-bfcaf2ae30f8@citrix.com>
 <e8142d80-217d-7053-1bae-cd7abff17b78@suse.com>
In-Reply-To: <e8142d80-217d-7053-1bae-cd7abff17b78@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5230:EE_
x-ms-office365-filtering-correlation-id: 51b4ab8a-3b4f-42c4-189d-08daa6d7db13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WffGVkY/L1r+yfj7ethDFZBMxcwfoXii4RXfsx3UD/oQSX15UUyiMeFJURkqo8DrX60BqynEbFsLLGfHNoh4ZNnNIoCGrqs566HAKENbm6m03AQ6LtiYMS4NMWT39Ho//mM2pBHxcQY0Giv9dp1tl8erCyCGet1yQR97g43PDjZGsMAvf7US+MNoCFb2n4eAMNJ2I1EQwc3NoSMR7/26WOk9thYIA+Ef6JS+6HfZgEbGI8DVNPT67KuA8QjUb4EIetXQ+fKQFQcL+uUFXbCxDrCqkpSVnfCdkO9hk9Dfvk9IEhWyl8KaCjFR/LXsTvckXHPvi1kP6ySus8ZrWaMYytYikfzD6jlGjfdF1UJ5cTNGG9H9yywJ44/yheqb0vvHOI84sf9+0VOcdow+offhO86Ag6AODYmoSLDhti7NBx9/4x8TR9nFwQp8T/LqjQ5mSL4pYCoZk27RX46qIgWOBAI0KCgs9zm3GFS70v4/P6DUI+yXU00phyQHNezlKeOgyeKpc8twR2iiEjVs7iNgOiMMc3PNy0ulgEBH6VIkMFyfzLflp2g2x7cXICEv3Va5HwFhikPJVJR3YYZJ4iKwqCRF/RM4pBZcxwx33F5myVybxLG8qRL/QX2r21hoFBujC0jzUzBWokEHjJwzi7srWAwaOGQDiyu5oFtaQJUrxsuV2k5SkAoRws5A6bwWAnFA2yG15NRKyFhVPdAEs2qbvCCTt+YbaUzJsaJmPXhULIaIQL8iYr94XBsNKw/LvJiwaBMpvEJXqbrJNaUrB8zV1V2LO4RqUinzbUVcajArRcNtkUSAxDejCxo/V7hAuo7gXQ7eRu2PKbyhA7Si9jK9yg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199015)(36756003)(31686004)(82960400001)(38100700002)(38070700005)(83380400001)(86362001)(122000001)(186003)(31696002)(2616005)(6506007)(6512007)(26005)(478600001)(2906002)(6486002)(5660300002)(6916009)(316002)(41300700001)(53546011)(71200400001)(8936002)(66556008)(4326008)(64756008)(66446008)(66476007)(91956017)(54906003)(66946007)(76116006)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekdHUVAxakI1VXdUOFV5bExxQ1VlSmFDVVppUk5UZHpwM1BRYzA0aFFlV1pG?=
 =?utf-8?B?ajVwaU1RclJOTGdqT2hsbytNMERXYk96SnRWN1JxcFgzczhyS1lSbVRKbHhI?=
 =?utf-8?B?U21Ya1NHdVo1SHBweE03N3JHNVJ1azJjTEpHR2xJWmZRY1drdVRKUXJ6M29t?=
 =?utf-8?B?V3hacUdyQzhNLzN6UDZqN3BuYjNLbjZmK3lQZG9LZUtMWFA1cGRqSC9zdytn?=
 =?utf-8?B?VERCUG5aMVBjSWRJdyttQUNLMVNnQzdjM3d6S1lSUm9WZlRkZkhoWU44a004?=
 =?utf-8?B?cGlTWmZHdnFTd2wyZEIzSDBZMlI3a1dlUEFjT1ErekpqWTkzTlNOMFF2VUkr?=
 =?utf-8?B?OVVCOUdCZ2lySXRFUVIvM1RjZmVKSk1oRy9uVUw2Ym9CNzk5bFplcit6VWdC?=
 =?utf-8?B?YmVQVkxUcVluczNUNm9SYVdEUFlHdytwRnpjblQxK2hhSzZYSHovV0NRckt0?=
 =?utf-8?B?WTRyOEw1UGpHaEkvYnZUVGFFZ2hkaG12OFBpbXZBS2E3emNJTEJMbTltZFdX?=
 =?utf-8?B?bTE4dWQzbEMzRlhoNWEzSnhHd2hXNWNJRW1mWXpZYnRRV0tQRFJ4R2Mxdjgv?=
 =?utf-8?B?MjdMZEtFbFB2SkttQlVYS0U3RDhqb2NaTDdHMjlWWkRGTkFTNkN4bWkrTXQ3?=
 =?utf-8?B?MGJERVhrV1FFRDRyU2NHb0lCNXVyLzBnOVVlSmVjSXNVZVU4bVB1Mk40RU00?=
 =?utf-8?B?bTVtZ2ZwaHllYzd5STh3Zlc0MllzSHppa2lGd08xRFVGUUJ0L3U3RE9sdXR3?=
 =?utf-8?B?dGVERUtZMXhESzdKRVcrRWJlZTMrVVRFUWpQK2JXV2N1S2Q2RE1BYnNXclpJ?=
 =?utf-8?B?L1J6ZHZmVUpDWVhqRkhuYWYrZ1NkcU03WmRUckFsY1J6SlJGNHhPdlVXaEVv?=
 =?utf-8?B?ZzZlUmZtVkJYMHhCMmZHYTZZc1NtbGJvYUw3MDdueHc4Y2VzYkdHQTBHeDNL?=
 =?utf-8?B?MzFvemxYODFZb0ZwcjlRTVkwWGR1cEl6OVNtMzZTRjcyRVoyaEdXWWdxNkNE?=
 =?utf-8?B?T3JvWE1hN2h3WjVpR3NPUnJIemdpNmgyTDdHWnNZcnVKdm5DTWZjVDA3aEFV?=
 =?utf-8?B?NE1FdWJXbXg2SHJzZFlnQnNCNTV4d3hBb1BxOWhHSGt3OUEzQkNBZnY1ZjBR?=
 =?utf-8?B?eWtLRGZUTmx4OUdhcDNwTEI3YTJLZFVFa0h5QWJaeGVJK2dEdWp6UXZlSGdC?=
 =?utf-8?B?c2VBOWtyMmFGUEF0YUFUUG0yYVFBR1owQU5WejVjT3JLVWl3bjdJNm1obW94?=
 =?utf-8?B?cnlzOFRPME01dFAxQ3NoOFZXVG5zcVZpZGNYL0tTYXdTcGIvOUxzSHVGTmM5?=
 =?utf-8?B?KzZ5SUdLcmlSa285Z2grUHlHVEJwWVhpVjAycUZKVGg3RmpucjJQM3RlMTlm?=
 =?utf-8?B?R1hkQVltTDV3SVpOcDV5NVQxY3hMN2lJZ2p5dk4rc3p0L3pWVFVoek13L3ZG?=
 =?utf-8?B?UFVNblVMSEJWTnljOEU5Tmc5ZDBNRlJ4bUZ5WHYzcjgzS2VHcGFPSDFSeU9O?=
 =?utf-8?B?Znhyak9hZkNxb2c3cUwwZGJ6Q2QrTFduR2FOV3MrOEYvZC9ITWhhbFd3Q1lF?=
 =?utf-8?B?MlIzVkgzUWlEUzJtSzRNVW1GMys0bHBBMkxvcmJ2cTV2MXdVQzQ4OFk1dXVL?=
 =?utf-8?B?QS82d3orU3M1NmN3SmI0UmlmalFHK09XRHNrS29Rc3h5THgzOHdmTmpaRGNa?=
 =?utf-8?B?UTRFTnhjUXFjNjFCMHQ3cjBQNDRTdG82TUF2NHVRT2pueFZvZHdQVHRkM29t?=
 =?utf-8?B?bklvMEozQkRBQUtDc0d6Z0ZISGg4Z1BEZTRReE1uOERlSXdKMXkwZUx2ZXo2?=
 =?utf-8?B?NmhiQjJsSElOdkxRRXBlcEJSWERoK2pCcGxtOUlsaFFzMjdYZ3RHTzFFMkhE?=
 =?utf-8?B?anAyY3d5WFdKbzByeUw5aEh3V05kalBVUjJVeGlqeXlWQ0JURktRYk5IdjFE?=
 =?utf-8?B?MDdZZXFaYUtNcjk5MTFQWlE4eFM5TVROVEQ5dGthNXMxTllTNXdIZ2xYUU1j?=
 =?utf-8?B?cnNLS2l5bFVsR0NsRDQ2S1RRL2xVQWVrRHk5YkYwU0dCNE1yZzdHMU9hUVFT?=
 =?utf-8?B?UlVLTmpDVjl1WElQYjhlbndFeXd0UjdqbFJFQ3pzb1ZYbVZyZXc5OUhFOGZR?=
 =?utf-8?B?Uk1CT3ArQlFVM1NWZ2R3RzhLblA3WEhUK2hET25QVWZDQXJzMkh0Z2RRM0NL?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A74BA47AC484246B3C9AE344EB6AE4C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?U3RkdjBXQzh2LzU1MGNTRmF6Rlc4aERjYlFGbUZna3M4V2xhRXpqS01jQWRo?=
 =?utf-8?B?UHM0L2htR0FXNU1sNVREK1hXQkRCNnJTN3lxUnFrc2hGUUl3QTVLdjVvODVs?=
 =?utf-8?B?ck9WOVBJWjd3ZkpWOGwySHFFYzF0UWxDSkM0MUMwS0pRUzJzNGhJaUlPc0ZW?=
 =?utf-8?B?TXNYR1BIT0ZNS2RyZ2hTbmdlZ1hEZ1VqMGRUQkRpMDIzcXI4V0hJQnp0N1VD?=
 =?utf-8?B?VzJlWGFrWFRCY0diVkUrbmMzbmZDZVZLZ3VyNC9ZYjB2VEU0dENjdmV0dVdq?=
 =?utf-8?B?S0M0bjlGVDd2THE0anFHTTcrT3FWOU5RcTNpbHB1aHJnVzNJNzdQOGZnL09Q?=
 =?utf-8?B?dytBNTdxSFFBZ3NKOVl5dS91ajY5d3pBK1dHZStybEZvUUI1TjN6VHpQZDNK?=
 =?utf-8?B?dWpXbzRnZ0VEYUwvWDZ3RHhCN2sxbXFpK1hHbENScUFsS2NBOWt0VThkZmdp?=
 =?utf-8?B?T2o2VldyYnhHa0c1QVZpNlVKVmQxZzAveXUxY2ZZbStDT05NSG5tc1R3Rlc5?=
 =?utf-8?B?YkREeDJVRkZWTHhvNUZwakw2SlhxR2xBTXArcllkelA4RnhEMmZZclNtNG9s?=
 =?utf-8?B?OXdCN3AwcUludHZveFJvZk1JLzMzR2E1Q0VkMG1SdzBEYXN5Yng5Rzk1MENL?=
 =?utf-8?B?aTdObm9qa2RtZ3IzUG9raUF2OGFxMStkdFVqbE92WW5aVFlwRHhIb29lWWti?=
 =?utf-8?B?Und3ajE2Yzd6MnlPdkViNC9HSUNFempzQmNjWEQ4OWcwVGsxZmVERkh6WE13?=
 =?utf-8?B?SFZLb1hkQ1I3VnFHY200TEZDNm94bXUxUmRhSzRnVHhVOFg3eUQvMkozekdv?=
 =?utf-8?B?dHl5ODJOekFkRjRIQmRsYzNxSDkwSVBVQUc1a3RuekpiYjh0L0JVNm9xUW5u?=
 =?utf-8?B?UXJMcXdBaE9zUzZYaDhqUng0Z1YzcWlFZDdnSDcvSUlHUVVJeUtVUzZ0N29y?=
 =?utf-8?B?aTd2WjBPcmFtdno0eEFFMVJWY1Z2RmYxSHlHbFM0WTExaHQ0MTZoYysxUjky?=
 =?utf-8?B?Qk1NTi9jcGwyS1ZCV01zWEZWSnZ4K0hOZ0VHbEcrQ2JpTlozQnNxWjBLUmdk?=
 =?utf-8?B?ZlFlemoyc0hCWlZDN0JRRWhXZGVRY2VSWnc3TGp4S1RGc1hmM1BReEJBcHlo?=
 =?utf-8?B?bzQ0bjRtV0xLOGpweStyNjc2M0w0bmVma0wxbCtDUHUrVE5PdFpsU1ltcERG?=
 =?utf-8?B?RlV0V0ZvaGwzbVE3ZEgrejlSU2Y0OFpWNEZCT3VzNXJsMDhqYXUzbFEvTm83?=
 =?utf-8?B?UCs3S0hsckxpZ0FQbmU1Uk5hd2JWMUtRUitHYWZac1NuMno4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b4ab8a-3b4f-42c4-189d-08daa6d7db13
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 13:45:24.9831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wfn/JhvR1IxUILXrcuITbnTZYYTKocsvm75pJHZjUOWF7vJpDOwJGei7WBlVoPUd8mbcF8Cl0jUZiri2i8LZpcHvsq6rlnKHaAuiRpbNITs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5230

T24gMDUvMTAvMjAyMiAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjEwLjIwMjIg
MTQ6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwNS8xMC8yMDIyIDA3OjU5LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwNC4xMC4yMDIyIDE4OjA4LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBBIGZ1dHVyZSBjaGFuZ2Ugd2lsbCB3YW50IGEgY3B1aWQtbGlrZSBpZGVudGlm
aWVyIHdoaWNoIGRvZXNuJ3QgaGF2ZSBhIG1hcHBpbmcNCj4+Pj4gdG8gYSBmZWF0dXJlIGJpdC4N
Cj4+Pj4NCj4+Pj4gICogUGFzcyB0aGUgZmVhdHVyZSBuYW1lIGludG8gdGhlIHBhcnNlIGNhbGxi
YWNrLg0KPj4+PiAgKiBFeGNsdWRlIGEgZmVhdHVyZSB2YWx1ZSBvZiB+MHUgZnJvbSBmYWxsaW5n
IGludG8gdGhlIGdlbmVyYWwgc2V0L2NsZWFyIGJpdA0KPj4+PiAgICBwYXRocy4NCj4+Pj4gICog
SW4gZ2VuLWNwdWlkLnB5LCBpbnNlcnQgYSBwbGFjZWhvbGRlciB0byBjb2xsZWN0IGFsbCB0aGUg
cHNldWRvIGZlYXR1cmUNCj4+Pj4gICAgbmFtZXMuDQo+Pj4gSG1tLCBJIHdhcyBlbnZpc2lvbmlu
ZyB0aGlzIHRvIGJlIGZpdHRlZCBpbnRvIHRoZSBleGlzdGluZyBtb2RlbCBpbiBhDQo+Pj4gbGVz
cyBhZGhvYyB3YXk6IChwYXJ0cyBvZikgTVNScyBob2xkaW5nIGZlYXR1cmUgYml0cyBhcmVuJ3Qg
dmVyeSBkaWZmZXJlbnQNCj4+PiBmcm9tIGluZGl2aWR1YWwgKHBhaXJzIG9mKSByZWdpc3RlcnMg
b2YgQ1BVSUQgb3V0cHV0IChpbiB0aGUgY2FzZSBvZg0KPj4+IEFSQ0hfQ0FQUyB0aGVyZSB3b3Vs
ZCBiZSBhIHBlcmhhcHMganVzdCBhYnN0cmFjdCBtYXNrIGxpbWl0aW5nIHRoaW5ncyB0bw0KPj4+
IHRoZSBzdWJzZXQgb2YgYml0cyB3aGljaCBhY3R1YWxseSBhY3QgYXMgZmVhdHVyZSBpbmRpY2F0
b3JzKS4gSGVuY2UgSSdkDQo+Pj4gaGF2ZSBleHBlY3RlZCB0aGVtIHRvIGdhaW4gcHJvcGVyIGVu
dHJpZXMgaW4gdGhlIHB1YmxpYyBpbnRlcmZhY2UNCj4+PiAoY3B1ZmVhdHVyZXNldC5oKSBhbmQg
dGhlbiBiZSByZXByZXNlbnRlZCAvIHByb2Nlc3NlZCB0aGUgc2FtZSB3YXkgaW4NCj4+PiBmZWF0
dXJlc2V0cyBhbmQgcG9saWNpZXMuIEFsbCB0aGF0IHdvdWxkIGJlIGxlZnQgb3V0IGF0IHRoaXMg
cG9pbnQgd291bGQNCj4+PiBiZSB0aGUgZXhwb3Npbmcgb2YgdGhlIGJpdCB0byBndWVzdHMgKGlu
IHBhdGNoIDIsIGFzc3VtaW5nIHRoZSBzcGxpdCBpbnRvDQo+Pj4gdHdvIHBhdGNoZXMgaXMgdGhl
biBhY3R1YWxseSBzdGlsbCB3YXJyYW50ZWQpLCBpbnRlZ3JhdGlvbiBpbnRvDQo+Pj4gZ3Vlc3Rf
cmRtc3IoKSwgYW5kIGF0IGxlYXN0IHNvbWUgb2YgdGhlIHRvb2wgc3RhY2sgc2lkZSAoeGVuLWNw
dWlkLCBmb3INCj4+PiBleGFtcGxlLCBjb3VsZCBlYXNpbHkgbGVhcm4gb2Ygc3VjaCByaWdodCBh
d2F5KS4NCj4+Pg0KPj4+IEhvd2V2ZXIsIHNpbmNlIEknbSBwcmV0dHkgc3VyZSB5b3UndmUgY29u
c2lkZXJlZCBzdWNoIGFuIGFwcHJvYWNoLCBJIGd1ZXNzDQo+Pj4gSSBtaWdodCBiZSBvdmVybG9v
a2luZyBzb21lIGNhdmVhdD8NCj4+IEkgaGF2ZSBvbiBtdWx0aXBsZSBvY2Nhc2lvbnMgY29uc2lk
ZXJlZCBwdXR0aW5nIE1TUl9BUkNIX0NBUFMgaW50byB0aGUNCj4+IGV4aXN0aW5nIFg4Nl9GRUFU
VVJFXyogaW5mcmFzdHJ1Y3R1cmUuwqAgSW4gdGhlIGZ1dHVyZSwgaXQncyBsaWtlbHkgdGhlDQo+
PiByaWdodCBjb3Vyc2Ugb2YgYWN0aW9uIHRvIHRha2UuDQo+Pg0KPj4gSG93ZXZlciwgZG9pbmcg
c28gbm93IHdpbGwgYnJlYWsgc3BlY3VsYXRpb24gc2FmZXR5IGZvciBndWVzdHMgaW4gc29tZQ0K
PiBDb25zaWRlcmluZyBmdXJ0aGVyIHRleHQgLSBzL3NwZWN1bGF0aW9uL21pZ3JhdGlvbi8sIEkg
Z3Vlc3M/DQoNCk1vcmUgInNwZWN1bGF0aW9uIHNhZmV0eSBvbiBtaWdyYXRlIi4NCg0KRXhjZXB0
IGl0cyBub3QganVzdCBvbiBtaWdyYXRlLsKgIEl0IGNhbiBnbyB3cm9uZyBmb3Igc3VzcGVuZC9y
ZXN1bWUgb24NCnRoZSBzYW1lIGhvc3QgYWNyb3NzIGEgcmVib290IHdoaWNoIGNoYW5nZXMgdGhl
IG1pY3JvY29kZSB2ZXJzaW9uLg0KDQo+PiBjYXNlcy7CoCBUaGUgZmVhdHVyZXNldCBBUEkgaW50
ZW5kZWQgdG8gYmUgc2FmZSB0byB0cmVhdCBhcyBhIHJlZ3VsYXINCj4+IGJpdG1hcCwgYW5kIHRo
aXMgaXMgaG93IGl0IGlzIHVzZWQgaW4gcHJhY3RpY2UuDQo+Pg0KPj4gSG9uZXN0bHksIEkgZGlk
bid0IGltYWdpbmUgdGhhdCB3ZSdkIGdldCBiaXRzIGxpa2UgUlNCQSBhbmQgUlJTQkEgdGhhdA0K
Pj4gbmVlZCB0byBiZSB0cmVhdGVkIHdpdGggb3Bwb3NpdGUgcG9sYXJpdHkgdG8gYmUgbGV2ZWxs
ZWQgc2FmZWx5Lg0KPj4NCj4+IEV2ZW4gaWYgd2UgZG8gZW5kIHVwIHB1dHRpbmcgTVNSX0FSQ0hf
Q0FQUyBpbiBYODZfRkVBVFVSRV8qLCB3ZSBzdGlsbA0KPj4gbmVlZCB0byByZW1vdmUgdGhlIGZl
YXR1cmVzZXQgYXBpIChyZXBsYWNlZCBieSB0aGUgY3B1IHBvbGljeQ0KPj4gaW5mcmFzdHJ1Y3R1
cmUgYW5kIGxpYng4NikgdG8gcmV0YWluIG1pZ3JhdGlvbiBzYWZldHkuDQo+IFdlbGwsIEkgZGlk
bid0IG1lYW4gdG8gc3VnZ2VzdCB0byBwdXQgYWxsIG9mIHRoZSBmZWF0dXJlLWxpa2UgYml0cyB0
aGVyZQ0KPiByaWdodCBhd2F5LiBKdXN0IHRoZSBvbmUgYml0IHdlJ3JlIGFmdGVyIHdvdWxkIGRv
IGZvciBub3cuIEFmYWljdCB0aGF0DQo+IHdvdWxkbid0IGFmZmVjdCBtaWdyYXRpb24gc2FmZXR5
LCB3aGlsZSBpdCB3b3VsZCBhbGxvdyBkb2luZyB0aGluZ3MgaW4NCj4gWGVuIGluIGEgbW9yZSAi
bmF0dXJhbCIgd2F5Lg0KDQpUaGF0IHJlcXVpcmVzIHJld29ya2luZyBob3cgdGhlIE1TUiBwb2xp
Y2llcyBnZXQgc2V0IHVwLCBwYXRjaGVzIGZvcg0Kd2hpY2ggaGF2ZSBiZWVuIHN0YWduZW50IG9u
IHhlbi1kZXZlbCwgYXMgd2VsbCBhcyBhIHJlYXNvbmFibGUgYW1vdW50IG9mDQpwbHVtYmluZyBi
ZWNhdXNlIHRoZSBmZWF0dXJlc2V0PC0+cG9saWN5IGNvbnZlcnNpb25zIHdoaWNoIG9ubHkgaGF2
ZQ0KQ1BVSUQgZGF0YSByaWdodCBub3cuDQoNCklmIEkgZ28gZG93biB0aGlzIHJvdXRlLCByZWFs
aXNlIGl0IGlzIGdvaW5nIHRvIGhhdmUgdG8gZ28gb3V0IGluIGFuIFhTQQ0Kc28gd2lsbCBiZSBi
YWNrcG9ydGVkLCBhbmQgdGhhdCB5b3UncmUgYWxzbyBjb21taXR0aW5nIHRvIHRha2luZyB0aGUg
Vk1YDQpNU1JzIGluIGR1ZSBjb3Vyc2UuwqAgKHdoaWNoIGlzIGFsbCBvbiBteSBwbGFuLCBidXQg
SSBkb24ndCB3YW50IHRvIHN0YXJ0DQp0aGUgd29yayBub3cgYW5kIGhhdmUgYW4gYXJndW1lbnQg
ZG93biB0aGUgbGluZS4pDQoNCn5BbmRyZXcNCg==

