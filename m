Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A346255BC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 09:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442365.696466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otPjQ-0001Ar-P1; Fri, 11 Nov 2022 08:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442365.696466; Fri, 11 Nov 2022 08:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otPjQ-00018T-MB; Fri, 11 Nov 2022 08:49:48 +0000
Received: by outflank-mailman (input) for mailman id 442365;
 Fri, 11 Nov 2022 08:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xehc=3L=citrix.com=prvs=307a7835b=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1otPjP-00018J-01
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 08:49:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5cfe499-619d-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 09:49:43 +0100 (CET)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Nov 2022 03:48:01 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DS7PR03MB5415.namprd03.prod.outlook.com (2603:10b6:5:2cf::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.13; Fri, 11 Nov 2022 08:47:58 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 08:47:58 +0000
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
X-Inumbo-ID: c5cfe499-619d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668156584;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qfyL22txZXfv/J2TntjZ5eSLwm+hAxB0tQgn76UqQbg=;
  b=IJLkQ6hfR8e/n6MbvZPmszvr+D6hE2H28M7avenYDPCHb0hySLMYUl12
   sG7nAxqIO17nO/VeFEeUCUY+gRSs2gT1ei5L2RXJ0SHFaQbXQ5P+yqnoH
   HBviBvGDuDqXGs/UJJU4yQACrf2M+LG9X7pI9GE+g40QOohi7tIdooPGl
   k=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 83701194
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:h88Dtq2GSpBd571Y7fbD5epwkn2cJEfYwER7XKvMYLTBsI5bpzUPz
 2MbWDiAO6mINDDyKN11bou2pkwG6J7QnN9nHgJopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnPKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfQj9nr
 vZHKAs3bh3dvaW95ZeWF+BrmZF2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6PnWSd05C0WDbRUteKX8ROgkeRo
 CTC/mL1Ax4yP92D0zuVtHmrg4cjmAurA91KTeTpqpaGhnXN/3AuEhlIR2G3pKSckWK7ZfFge
 1ILr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqR/6mZhSm/Mi8UKSkFfyBsZRQBy8nupsc0lB2nczp4OKu8j9mwFTSux
 TmP9HQ6n+9L0Z9N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlQU/lhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:oJP/FaF2EQy2x9UrpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZKz+dRj8EC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.96,156,1665460800"; 
   d="scan'208";a="83701194"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZn9AsSVi7iJnxyYIpyysm1hM2X+rFnuLVQNwQpzNca0RgxIcNR+47qI/tQ+1Jaiw02sEgBDPe148dbxrUyw3X/qvGBCrYmKWkCsCYXSOlqhDJkoaXw2QiH/42Z7TGu4ivTnqBAwSJ6ZYZGUbeP2148SMWIEZtiyp+bLJBvPNt2EboOV5b8oCzGHW3XZtesft9c5866Er/cjoIhzeq8zRR3K23Rxl8aPsbH2CMvtL367SbYkcnV8LANVmKJkYP5rCl66/qZgh4e9kpWxbY6n2KxTMWzVEETPzaUUs+6ecTDbrVWNwlBPURmEpRm6nbxlvlFsDy8zaPhTCHcAWtdCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfyL22txZXfv/J2TntjZ5eSLwm+hAxB0tQgn76UqQbg=;
 b=hzbk63mQgVjorUqV7hmSgsOo6IvR2/tWFBZ++EUpPq6EhYQeQXQh755AHyRWzMvCaygpP8UfNFXqwM9Y35gu2QmhraEFK7rRhmTpx0715KywY0agZ7JD6r7eTjYCG+eMInz/XjpJwxDNTMZjek/tgs4X4VtBtT89zMFDmwMBwWVxlPSAJLpqRJvnsWN3JnSq8TFAvBg5OOCqGSxnUOQyK3GwrIMDhVO0/j6U5yGUEmqIVFnRBLImLvzqZglsIFoufs4WNAyWDbc3njUVkf52wsTn7KU6W0GTAlPsfRiTBeDPc4ZelaaQebtZrs5dYG75/Nj6hRzkssEuhqyXO0jw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfyL22txZXfv/J2TntjZ5eSLwm+hAxB0tQgn76UqQbg=;
 b=a5sAVnww/22eVSMv4+dgsG4G6SJ9yHcT84tY2T7qcptYPkXYmQ3kz8yfcVV817aQnU7R1zirmRWK1RNlfJFlHZKaczPBVZA9MfITyw7o1zQ4EpH4djvrfbRkyHKwXOHo/HlCA+4MMadqXmmpqOFgZAb7oz2qPC6O2kLtfdfCvqk=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [[PATCH for-4.17 v1]] tools/ocaml/xenstored/xenstored.ml: fix
 incorrect scope
Thread-Topic: [[PATCH for-4.17 v1]] tools/ocaml/xenstored/xenstored.ml: fix
 incorrect scope
Thread-Index: AQHY9TJA3NadmOqYwUG//a2f83zQw645ajKA
Date: Fri, 11 Nov 2022 08:47:57 +0000
Message-ID: <53AB1B57-4156-4AB7-B284-05BEFBD47B2D@citrix.com>
References:
 <356deefe1251ac353b346762df94a134c02508f0.1668104890.git.edvin.torok@citrix.com>
In-Reply-To:
 <356deefe1251ac353b346762df94a134c02508f0.1668104890.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DS7PR03MB5415:EE_
x-ms-office365-filtering-correlation-id: 5a3b9fd6-86db-40f5-2c07-08dac3c16eb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FHt1qlmi+Zsm96zyg2A01GWH/bx+HcsEfs8+MKOIMqU3LLyNMfjpbVNg867yA6IAfpvHCq9nlBBr1jMhM7SfsCnLCbpbnii6+DmbY9Ucw7d1Ad/2j6A9Q24jzEezd2lVJSkZkCeNSoZacd5tq+OGJrG2Hm53R+KGAGg7EIC0jfy1deYZDtkYebAR7yB5MTSO9svQycac3C5pJfwtW3um9vHW5CeOhfL4ckknAcAUR/Q81njHWwVFEvb/vBtvdQD5GMGgB7GcMyl5m6hmdZAFwILUKT+nc2Yb7pZegQws8bLbcKsKWBhLaoojEtHR9xaYYwiLkfF0+AqqoZhoj5U1SSzMVJrUz0bXrDzQS4T+Qy3PS+KM0NgCuc/SJ+PpoRmdIjbwDYSaTI46troPPGo/jB5iL5Ph33mLJYG5H/ufBV71qNPuX2iaWqc/T+LSEXImj1kb8stdosIp37dt+LQkMO3/GnYcslII7cm8t5p0Gbi17h1gzNIcgGsTM9C5ryRMuITAuh6wv/p1+ur3UzP36tbvkEKEK3M8nOwfm9E4ZtWRAuW4pP47AhauTVwAdDpAQ56D9WweBAGSIDnn9gfvp2yWFaLx04xnhE1+PsH47vrH0rZJ7CJJ8mkNiz8MqmPEjczspshtWPKJh2PVSVO8/32lSCIvkm6xD7YMRsq3hIbrwQPjeCeC4D+RDcizDs77bqusoMA7lvjYdIb3P00Di1x3sv2J7eMYLo/l6YPs46GontXar/BsuyzyIhVwMlrgFH5c7ny4qgkghwIAV5z//eweR7t5PUgg6KecV3T2o+I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(6512007)(6506007)(26005)(2616005)(478600001)(38070700005)(53546011)(6486002)(107886003)(82960400001)(83380400001)(86362001)(38100700002)(186003)(36756003)(66574015)(122000001)(33656002)(8936002)(6862004)(5660300002)(41300700001)(2906002)(4744005)(44832011)(316002)(91956017)(54906003)(37006003)(6636002)(4326008)(66556008)(66476007)(64756008)(66446008)(8676002)(76116006)(66946007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1ZscEJiQmcxYXhUQ09aRWNmZVFncll4UVJGdEhhTU9zTzk0dW5ZNlFxbWcy?=
 =?utf-8?B?T0F4TitBTldiVXFHZDBXelJFUHR2YWdUMmxFYXkybzhPOUxvSjZ6V0pVWVl1?=
 =?utf-8?B?NXZ1eUdXL1d0eWpOTmJydUJLUjVqa0hkS2FkRDFxQ21wS0tCNUpQVllYVzJ0?=
 =?utf-8?B?UCt4bmNjWG1TdFgvazIwODVnbCt3blY1YjdZaXVVT0QyYmhaLzBNYVFvK2dt?=
 =?utf-8?B?OGlKL0M4VWZTS3ZMbCtobXdXeXdtaEJGeHZHVFpoaWo5Nm9Ib2J1Y2FpLzRv?=
 =?utf-8?B?RTdGbWNmL2pYaDdHYVZlUHNKL09iTDU4enFFS2dFUnJiSU1NUzRxSmNuREsx?=
 =?utf-8?B?cmtWSnhudmRmQjNIUUQzV01Ec3U0THAyR0VKaEtpVEhTaXQyWm0yY2ZWY1Jx?=
 =?utf-8?B?Sm10TVBteW51NEIwSFZpSFYwdXFqMHdwbnlwWWJ2aHZ0SFFOODJlZmFiUXZu?=
 =?utf-8?B?UWRBNmVBM1BOanpUc1RpWkM1cVJmQ095M2lrdFFrYmd6SjRaeDR1RlNJNUM4?=
 =?utf-8?B?bGN5dzRMc2Z5YWtXd1V6NWN5NmFFZlBMQ2J5ek91aXBVc0g1ek9iOTRqWjhB?=
 =?utf-8?B?ZzA0RzBVNTRyL21wRTlocEhaNkVuMVdZeXpyUGlacXZYMkp0dE1taWN6UHR6?=
 =?utf-8?B?NkZkamxPNThTaTRNZFJLRjhNMGp1TG1mQ1B0a01aTmhCMG9nWW4zS1VVSi9C?=
 =?utf-8?B?V2NjWWZTUWdXUXRzYmRseUg4anZCSytkeU1RZWFCY0dVNUozZGdQRm5TVll6?=
 =?utf-8?B?UXl1TGYrMDBxdGdPRjloZmp1NDZIWlY2d3JsS0NhdXpITnpJZG9pTDMrNGlV?=
 =?utf-8?B?Y3dBNVl4a1ArYUtkc2tkK24xTjR2Yk5uMk43WjhDQ0IzVndzR3pQaTA2bW40?=
 =?utf-8?B?RlAvOTF1UURFNkF3QWpBeTNxUHA0bGQyREtzZkNBQ0w0Mkg1bVRwcnZMdUxF?=
 =?utf-8?B?S2JPaGRneHFZUzFhL3UzZFBHclk3S1VCeW1jbUV3QXpNSzdvQXUvdHB1SlNV?=
 =?utf-8?B?MER5dHRaVklqSDBqa3p3RlhrRGdKMG9Lb2xNZTBNTXRZN2dtVWZ0WEhSQUVR?=
 =?utf-8?B?ekIrKzc5UVZZdG1DNytTQWV4VlptRnNWdHRWeXkreVU4V3hwSXhHb2MzcWQ0?=
 =?utf-8?B?NmU3czBVc2lzQmV2eVlFcStXZjM0cmFoVWRMYUtVTm9peTVWZk5NQ09ERVNv?=
 =?utf-8?B?K1VqWG92amduWXZxL0tqdEhYRytYMXNPTk9waWZoRTgxcWFUYlk5SG5UQmZT?=
 =?utf-8?B?S08xejhIUkpHWS9iMXRzK2ZZNlY5SmZ3NDkrcTV2YXhzWlpKSU00S0lvdWc4?=
 =?utf-8?B?c3R0TGY1aDh0cVZsUGdLMzVSd1RsckdmS3lEaEg5alJQQVc0RXZpYUFvYUFw?=
 =?utf-8?B?VDl2cmpTSVNzUjNkTXpYeGhJN0hNejRSdTB6RGlsUmU0S1JvQ3U2QkJCZElE?=
 =?utf-8?B?SzZsS0dMVjA4TGRReS8vRTlwZ0lHdlBWQVZSM292WnVheFNLTVJJSDhnc0Va?=
 =?utf-8?B?NEc0TE03ZW9Rd2JwblVXNkNnaU5QZHdXQTF4Yk9FYmRRRmk0Y2N2K1ZyZmRo?=
 =?utf-8?B?bFBkaTFxSHNiVGU0ZmJRT3hMZmxUL3E0SnhOSXdqTGJnUWtOcEJzVWU0K0hl?=
 =?utf-8?B?TFhTRjRKeWs5WEdqMGs3VjJicUMySXRIVmJoRm1XZEgrbVYzbzlCeXpuU0Zq?=
 =?utf-8?B?azk4TVZ4SW4vR0xXUlRiMjdaL0RyRjNIV0owODdoN2J4cDI1UGs1VFVyL1lF?=
 =?utf-8?B?YzVuNXMxUlZNT2ZZTTkzYnIxZE1yMGJ1WSt0SzM3Z1lTcnE0WEdOMnNzL05j?=
 =?utf-8?B?eC84eU5qcDdqVVFCR0o0bHE0ZEx4RUhzRzdOenlNMy9kTFErN1Q4ZGR5TEZw?=
 =?utf-8?B?ejRaclpLb0d6dW9SK3ZleE02RzludDJCRVhxTnVHMFhCSXpuQnhzV0JyVGps?=
 =?utf-8?B?bnQ4c09KMUhIaTFsVTE5K3NIQ21sK0Y2OS92Q2syWERWcUI2WTludFQ0b0lK?=
 =?utf-8?B?ODh5N2hyVjFZWXVMVjRMTXlBQmxUWlU0ZjhVK0UxY2JiMmx4Qmc3WmtIeXVT?=
 =?utf-8?B?V25KZUJUOWh1WFQ2TkJpRTNFWktaR2N1ZmZrQ2VHVnBEczhSYkx0VUNRbG8y?=
 =?utf-8?B?K1Z2cnRnZXl2WWhZaDVPNEZqZzlYaTJYNU1TWnpIQlBYZW1TSFdSb2VTZGg3?=
 =?utf-8?Q?psihPf49g7qE46f0JhbmxMw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A42AAD6433F14AA095F7D6517F2A13@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3b9fd6-86db-40f5-2c07-08dac3c16eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 08:47:57.9414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/slITA3UgDl7uI7qWgAOCg2sZDerRbrxVINNuyclf+YU8y0cLAwsug/7eENeGZN7VsqdTNK+Sv/Xt9ehHO+20I5mBSA/HmxtwsFYEopgrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5415

DQoNCj4gT24gMTAgTm92IDIwMjIsIGF0IDE4OjI4LCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEEgZGVidWcgc3RhdGVtZW50IGdvdCBpbnRyb2R1
Y2VkIGFuZCBjb2RlIG5vdCByZWluZGVudGVkDQo+IChhcyBpdCB3YXMgcGFydCBvZiBhIHNlY3Vy
aXR5IGZpeCBhbmQgd2FzIHRyeWluZyB0byBhdm9pZCB0aGF0KSwNCj4gaG93ZXZlciB0aGF0IHJl
c3VsdGVkIGluICpvbmx5KiB0aGUgZGVidWcgc3RhdGVtZW50IGJlaW5nIHBhcnQgb2YgdGhlICdp
ZicsDQo+IGFuZCBldmVyeXRoaW5nIGVsc2Ugb3V0c2lkZSBvZiBpdC4NCj4gVGhpcyByZXN1bHRz
IGluIHNvbWUgdW5uZWNlc3NhcnkgcmluZyBjaGVja3MgZm9yIGRvbWFpbnMgd2hpY2ggb3RoZXJ3
aXNlDQo+IGhhdmUgSU8gY3JlZGl0Lg0KPiANCj4gUmVtb3ZlIHRoZSBkZWJ1ZyBsaW5lLg0KPiAN
Cj4gRml4ZXM6IDQyZjA1ODFhOTEgKCJ0b29scy9veGVuc3RvcmVkOiBJbXBsZW1lbnQgbGl2ZSB1
cGRhdGUgZm9yIHNvY2tldCBjb25uZWN0aW9ucyIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZHdp
biBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiAtLS0NCj4gUmVhc29uIGZvciBp
bmNsdXNpb24gaW4gNC4xNzoNCj4gLSBidWdmaXggZm9yIGNvbW1pdCBhbHJlYWR5IGluIG1hc3Rl
cg0KDQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXgu
Y29tPg0KDQo=

