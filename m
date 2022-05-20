Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7F52EAC6
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 13:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333857.557771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0no-0006mg-Ng; Fri, 20 May 2022 11:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333857.557771; Fri, 20 May 2022 11:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0no-0006jL-KQ; Fri, 20 May 2022 11:28:16 +0000
Received: by outflank-mailman (input) for mailman id 333857;
 Fri, 20 May 2022 11:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns0nn-0006jD-2D
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 11:28:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee9e26d6-d82f-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 13:28:13 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 07:28:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB3043.namprd03.prod.outlook.com (2603:10b6:404:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 11:28:04 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 11:28:04 +0000
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
X-Inumbo-ID: ee9e26d6-d82f-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653046093;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Gb4Paz7mlRR1t6gPuETGi5qsncvBztt0ZpDRZhOCyyc=;
  b=MV5ihEbHbK6C5Jada1NyT5O4bYdIvki0cSJDpPN21r32fP7BrVWBqI64
   Pa8lJkBsGQn2sd5bXHIFE9vidu5VhfqO5/4KFQtRGkmgHeLalAaPGUXzV
   wgd9NEKdVVMD0YRZ8FSNBLgmr9hCdC7kgGDd8xfqvSRc1VTYEZgo0G2gQ
   g=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 74297645
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:P6JLSalj0fItB1tUUmPWPyvo5gz7J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZXj2EaauOZDfzKY9+bt7kphwP7ZKEmt82TwpurnhkQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWVvV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVzUPFKrSmP4kWUNYOXxSN/VD4+7oLi3q2SCT5xWun3rE5dxLVRhzF6tIv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXtZkBg2pYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH9AjE+vRrvgA/yiRA06Doa8v0SuXUQNoPjkTJq
 E3/+EfAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUS9wWl2qfSpQGDCQA5oiVpbdUnsIo8Q2ws3
 1rQxtfxX2Uw7fuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:AR97pasoBbCLyd0w89rK2ugO7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="74297645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvTHf+TVuGk/FoHNXYW0y+9wjxrGpfBN5/b6n2KRWcqza6nb8PidQi2+u5s5crL93mbMB70A85niIPl3sMAzrGf+vOW5OePoi41Acj5D0IRPRdv9PXmN4GTkwoQtOF+zg5YC8xmMLs3w9Z93Ks10wjYtn2VReBuks89SH1VQ9MY3xPtTDqgrV2+FpORK1V6glN/bjoULtFZoOP7VjmPLweTuIcL3rqD0oSjLToGw+yY6tVHSGX2SMG62Ujt2U5zEEJzg1ajN2+i89FrSKp8fn4R1oIMFwqmiMkN97zVYlCPFAdyB5h2b4uX3KUdz8XeyQh4uiavHAYomm9EHUNa7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgJ/TOj0IFlk5oTaYicaTNHipKMiEfLk19bhZDp75aU=;
 b=f7FpQp9IDQBOEIIfCSKhPOMkZ2X2oY5MLoTxdujGyrYccEJQiCdgkHciUIhp4DmU+KUyoleKYI+pMCuZzYNrdXilhUHfftyjhqOixYVkC3DgXK3XBsJ2KFSUAztccFdn4a4GLmXS/WICn4ndoBjrGm785OCpBAUOCNDIKOv1cso9TThms5322k7ClGSJIL3Pz5fvb8WtOi1LiLY6lC0wwhztO3lip+oKVA+lIxCW7p3/BLI6pZKD1T9+HdB7xcVyaAt0d6NzB1zrmMg/l+ykm7QFZOKaEximdHsChPxhQPBBYxSJN5fElBXoa9WSCOqVlPAwaHuP1I/BmI7bmD+3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgJ/TOj0IFlk5oTaYicaTNHipKMiEfLk19bhZDp75aU=;
 b=BfHf3pQJxLR3wENdZXyi4D2Z22ao0XUaCnnffCNNoGO/CnonwjyY4x9ze+8OHSTR4w9XGBWbC+nCSNOSn+16Ng3nJX9otUhtbMfDnE8xbVKD3AQ3DIbmqqAU9o/TZo/0f29s7Cbyq73a2J7v/fFHkDGGJ/dCMXMWDLU0GAX7wIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 13:27:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 14/21] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <Yod7PyBJbCcUcU+v@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
 <YnUh4ZbDMZZdCw9w@Air-de-Roger>
 <80487976-5d72-5388-139c-422210bca73b@suse.com>
 <Yodr+fnu2AxmNdO/@Air-de-Roger>
 <b35a82b4-36ef-6337-fb6b-a0ebb6c68841@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b35a82b4-36ef-6337-fb6b-a0ebb6c68841@suse.com>
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3789d0e4-79ff-4602-64ce-08da3a53ce0f
X-MS-TrafficTypeDiagnostic: BN6PR03MB3043:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB3043A1770478BACD1C3E1C038FD39@BN6PR03MB3043.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aWbazRo3uLAzCSv7/T/Yp+ktsn4DGPpNd/J7QjYquC2fF5lJ8HMO2/bGRjIjlCx8Ld9THt0pItEM4hXO/MlSk78YDlH0mger7vJPJpwWSMpjHVV9r/YJXIWH3gcTwI2D7mj2klvhOEdL0vhjgGuwwV8MKxABn7Cb/leuDjFPp8jT9ctVtdQGJ1dgl/E4FhwooN14u9fe/pzWoDcAOPLmF3F7iGjOzzkgQxSJicukrz7cwyTE/OrRS68iSNX7vQG28k5re/kx02UjRadHHBD/3shZPaHscCGDVTX3CAab2r7z1VKA5hrZGTLknlrBDODt6RSufqn27qZJGcPaVMFb91Slb9eg2JzJZFcDVTshC3/Fw0ouA7r+XODWqOFILyXN0AiMyQB9+bcVdPLoM7rK6yX30HlFlk88XLwNpRx1fIewcAzNRFAXoWOm425Ik5RO8QUAI+5ZDe+eEsyu8KJpeB9LcBj1dYAc/dHsArEr/VqEWTRpv9SSywLuLj40sH4QwJAeUtmrm+0HbAvkPwr9UIn6mhIEuBqEwwm9mtYMlZsjzoBXn/TG5SN1R/eX5jMep6iTDGnUJbcYrG/Hoda6pjT+mqPZY0lHvogp4FD1OZvfYDa19CkdBCg4lDWcbxPl2Zva+PqPhUC1mL7EUtX5YI7DJVL1oitzP7n2OVl7vvqTyapIj2DveDEJ567q4IcCyGRkx49VSK+uexSxeVWacw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(38100700002)(316002)(9686003)(26005)(6512007)(2906002)(82960400001)(6506007)(85182001)(6486002)(6666004)(8936002)(8676002)(5660300002)(33716001)(86362001)(66476007)(508600001)(66556008)(186003)(66946007)(54906003)(83380400001)(6916009)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDYrVjNtZ05PdGdkbjJwcm0xQXh3UWxlMDl6bmNiUktIbnNxRjRpWFU1bGxl?=
 =?utf-8?B?VmFJWGg3ZDNYYUVxL2d6VWJnZStRYU5pVmNsbVVMWkRIeFoxdGltWERFQVhC?=
 =?utf-8?B?WGtKbGRXc0RyZE1PdjhQZDRRbnVTOHMrampRYUkzZ1FKR3Vmc0s1T1FDQXg3?=
 =?utf-8?B?RFBsMG1JY1BsZTNZam5lcC9jRGp4SXo3V3h5U0wwZjdDQXc1ZFNBdlFiVUsw?=
 =?utf-8?B?UVhtODgycmtmMmhyb2tkMkdlRy9wWDhYNDdYQm54NENmalI2eWdVYUZmdUFj?=
 =?utf-8?B?aGF3ci9EbmYrQ3BESXF2aXBzY1R6SUJIKzd4UEMxNmEyTjRzM3AwZ0VISloz?=
 =?utf-8?B?V1duQ21NVXNHTVhuY2ZEeGZRM2N0bU9nN2tPZkYzTFFiWElkZHdORTNRS1Bz?=
 =?utf-8?B?enBkUEs2Wm92OUttM0FRcXE3UHRDdDE2VUVDOVJRQW9heDUwZGpxR2czeXhK?=
 =?utf-8?B?ZTg3cnl4ZDUyNmVhY2I1TmV2ZTZpWGRCeUpMVzMzVXg5UVNtSlhNZHVUMkdO?=
 =?utf-8?B?Q3d2RndwaEUvUG1uS05IMUM1ZnpwblJPOElzeUdiQkgzbUZCVitkNlA0WXp3?=
 =?utf-8?B?ZkxzK1lkd3AwQk1ZN0p2QVN4Q1JzZXRsdUoxVjM3Unh6S1h5Z2QyT1Z6QW5l?=
 =?utf-8?B?czc3SHVQQ1FKTWZKSGxpMjh3UHF0YUVBbUhqWUVyQWc0TDRyYlhNK3cwTkpT?=
 =?utf-8?B?UXM0RCtoRWZMbm5UYWIwU1NheG9KQ2oyYmUwN1o0YUNGeVNaMm9oUDJGY0FT?=
 =?utf-8?B?VkVuYVpDQ0V1c0RuU0k4by9Kb2ZlaWtNSEFWWHF3SUUyd1FhMkhtSzMzU3dt?=
 =?utf-8?B?MGZyRlhUZ1p4bzQ2cXpEUm9NaVV6OVBScmd4RUxiZHYxVEJuUHJLSmVvSDBN?=
 =?utf-8?B?alo0NzBmd3VPTWVNdFg3QVlNbTFBWmdXa3FiZm42RHQveUZ4STRNV1pQNFB4?=
 =?utf-8?B?OWVkbDA4cTRRM0RmbEgzWXhpUXh0cktTL0hoZ05BMWx2UnZ4Q0NMRjRJNTVY?=
 =?utf-8?B?M25HMjRkTE1aUjJCSE50ZGxPTGxxV3YrR0t0dnhERHZnRE9wL0hKOWRkajBB?=
 =?utf-8?B?bkszdEZ4MXFuMHQ2b0ZDOEhlSDUvSzZLcTJXdzJHOEkrZFk1aG9ZQy9CM3hR?=
 =?utf-8?B?M0h3L3M5UFA1UEN1VHlCOHVkLzFHejZCSGVpQlRHVUJwc2xldk56TU4rUnA3?=
 =?utf-8?B?ellDMXlZdFBaSlFqTFNoTmRaRHlXMVg3M211UktQSjhDRjN2RitINmZyZHlQ?=
 =?utf-8?B?OWlRcmtXRXJRTlA4REIxQ00wZ0VwblVZekZVOVN4RGJGbzlrZTlLZ2dFMS9V?=
 =?utf-8?B?dnFxemhpQWhjYzdYUXNXeno2ajNzSE90Si9oQW9yMTdrRk9BbDFQWFZETFZN?=
 =?utf-8?B?M253U2EwY08xMkIvK2lyTjdkYzRiTGI3cjdWYysrMUFoNEIwZ0VtQzlMbldn?=
 =?utf-8?B?c2dRVW5yOE9DVU1nelpVRFl4WGFKakNyZ3EzN0FsTFNROEtXL2tYZFJlb04y?=
 =?utf-8?B?SjBTTFpZY3A5dlJnZENCMnR6WGdKSzVzS2NmM0d1OWxmd21vUlRTSUdNR1Fj?=
 =?utf-8?B?ZjFQTjJ3VHM1NGdYYW9Gam1CUldFVFRHSERyem1SV3gwR2w1cFRBajg0cDg0?=
 =?utf-8?B?UERybkxUSHpsbEJCaGp5MTQyeEZVQlMxNjZhbklZa2RoYnI2eExtM2JzSjJ4?=
 =?utf-8?B?SVhtdDdJUFUvbWozMHVpY2R6cnFiaThId2IxT2MzWi9DaWUza21jT2gxZkVn?=
 =?utf-8?B?cjJVNDJOYzlpS0QvUzVleEQzOGRHSFVycjRxeDNnMDVnOWYxZ1JsVE5uZWN2?=
 =?utf-8?B?ZlduRlVQLzZ1VFlXM3lJRDBZTXE3T2ZjYnNQemxjOVFCTmhIODlKZGJ1djU1?=
 =?utf-8?B?UlgwYzhQNGhBNWdHbUNwKzgwd3MvdkViakQvZ2RQMU1ERjRhSE5VM05FRWdB?=
 =?utf-8?B?WXYxVHJhdUxVUTNib3dNSUdtcVhySTk3R1lGVSt1N05DM2RvZDRVMEJFcmVH?=
 =?utf-8?B?dmZTQ21ZY3VjZWRzdXA3KyttdUJmRVlOcnNkaE5JOHJ3YUtNZjdFL0Z1UUxD?=
 =?utf-8?B?b1R1V2RCSmJUZEpLeXB5WW5wRjdkbFNMYlV1bHo1N0V5d0J6ZHdjMzRwUVpY?=
 =?utf-8?B?eWcrNjlub1lTaUZFVGlHdkdWYk5BWTVhaW9ScnVwTDU5ZWg4RHp4cTFTelkv?=
 =?utf-8?B?a1Z4OGRFZ0RwenpDMzZqZUt1YlY3M2Q0ZWNpK1hnV2tHLzM5N2gwa2ZWaUJv?=
 =?utf-8?B?QlNmTWF2YXNWa25PMGlCbTc2OXp3aHEwV3czNFgwVzFDT2MxNVNoV09YSlVF?=
 =?utf-8?B?NW1tNFBkQlhMK0ZJVHJxK0RERzdiQ050TUQzRlMzVHJQbEZKSjBIWVVLdE9m?=
 =?utf-8?Q?xOJOrA4TREmDWf7c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3789d0e4-79ff-4602-64ce-08da3a53ce0f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:28:04.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPEToBVlA0VoWTZXBLZTkMkCEPGFsHYvb30C2q2vyxeawofgBh2/6VcvDAsvFRdnhBqEicX5RYWEdzeQbbWNdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3043

On Fri, May 20, 2022 at 12:59:55PM +0200, Jan Beulich wrote:
> On 20.05.2022 12:22, Roger Pau Monné wrote:
> > On Wed, May 18, 2022 at 12:06:29PM +0200, Jan Beulich wrote:
> >> On 06.05.2022 15:25, Roger Pau Monné wrote:
> >>> On Mon, Apr 25, 2022 at 10:41:23AM +0200, Jan Beulich wrote:
> >>>> --- /dev/null
> >>>> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
> >>>> @@ -0,0 +1,105 @@
> >>>> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
> >>>> +#define __ASM_X86_PT_CONTIG_MARKERS_H
> >>>> +
> >>>> +/*
> >>>> + * Short of having function templates in C, the function defined below is
> >>>> + * intended to be used by multiple parties interested in recording the
> >>>> + * degree of contiguity in mappings by a single page table.
> >>>> + *
> >>>> + * Scheme: Every entry records the order of contiguous successive entries,
> >>>> + * up to the maximum order covered by that entry (which is the number of
> >>>> + * clear low bits in its index, with entry 0 being the exception using
> >>>> + * the base-2 logarithm of the number of entries in a single page table).
> >>>> + * While a few entries need touching upon update, knowing whether the
> >>>> + * table is fully contiguous (and can hence be replaced by a higher level
> >>>> + * leaf entry) is then possible by simply looking at entry 0's marker.
> >>>> + *
> >>>> + * Prereqs:
> >>>> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> >>>> + *   contiguous bits (ignored by hardware), before including this file,
> >>>> + * - page tables to be passed here need to be initialized with correct
> >>>> + *   markers.
> >>>
> >>> Not sure it's very relevant, but might we worth adding that:
> >>>
> >>> - Null entries must have the PTE zeroed except for the CONTIG_MASK
> >>>   region in order to be considered as inactive.
> >>
> >> NP, I've added an item along these lines.
> >>
> >>>> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
> >>>> +                                     unsigned int level, enum PTE_kind kind)
> >>>> +{
> >>>> +    unsigned int b, i = idx;
> >>>> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> >>>> +
> >>>> +    ASSERT(idx < CONTIG_NR);
> >>>> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> >>>> +
> >>>> +    /* Step 1: Reduce markers in lower numbered entries. */
> >>>> +    while ( i )
> >>>> +    {
> >>>> +        b = find_first_set_bit(i);
> >>>> +        i &= ~(1U << b);
> >>>> +        if ( GET_MARKER(pt[i]) > b )
> >>>> +            SET_MARKER(pt[i], b);
> >>>
> >>> Can't you exit early when you find an entry that already has the
> >>> to-be-set contiguous marker <= b, as lower numbered entries will then
> >>> also be <= b'?
> >>>
> >>> Ie:
> >>>
> >>> if ( GET_MARKER(pt[i]) <= b )
> >>>     break;
> >>> else
> >>>     SET_MARKER(pt[i], b);
> >>
> >> Almost - I think it would need to be 
> >>
> >>         if ( GET_MARKER(pt[i]) < b )
> >>             break;
> >>         if ( GET_MARKER(pt[i]) > b )
> >>             SET_MARKER(pt[i], b);
> > 
> > I guess I'm slightly confused, but if marker at i is <= b, then all
> > following markers will also be <=, and hence could be skipped?
> 
> Your use of "following" is ambiguous here, because the iteration
> moves downwards as far as PTEs inspected are concerned (and it's
> b which grows from one iteration to the next). But yes, I think I
> agree now that ...

Right, 'following' here would be the next item processed by the loop.

> > Not sure why we need to keep iterating if GET_MARKER(pt[i]) == b.
> 
> ... this isn't needed. At which point ...
> 
> > FWIW, you could even do:
> > 
> > if ( GET_MARKER(pt[i]) <= b )
> >     break;
> > SET_MARKER(pt[i], b);
> > 
> > Which would keep the conditionals to 1 like it currently is.
> > 
> >>
> >> or, accepting redundant updates, 
> >>
> >>         if ( GET_MARKER(pt[i]) < b )
> >>             break;
> >>         SET_MARKER(pt[i], b);
> >>
> >> . Neither the redundant updates nor the extra (easily mis-predicted)
> >> conditional looked very appealing to me, but I guess I could change
> >> this if you are convinced that's better than continuing a loop with
> >> at most 9 (typically less) iterations.
> > 
> > Well, I think I at least partly understood the logic.  Not sure
> > whether it's worth adding the conditional or just assuming that
> > continuing the loop is going to be cheaper.  Might be worth adding a
> > comment that we choose to explicitly not add an extra conditional to
> > check for early exit, because we assume that to be more expensive than
> > just continuing.
> 
> ... this resolves without further action.

OK, since we agree, and that was the only comment I had, you can add:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

