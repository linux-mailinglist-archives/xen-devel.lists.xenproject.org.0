Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F47D67FA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622798.969967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvath-0002RI-He; Wed, 25 Oct 2023 10:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622798.969967; Wed, 25 Oct 2023 10:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvath-0002PS-EZ; Wed, 25 Oct 2023 10:13:57 +0000
Received: by outflank-mailman (input) for mailman id 622798;
 Wed, 25 Oct 2023 10:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvatg-0008QC-8Q
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:13:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32ace38f-731f-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 12:13:54 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 06:13:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7107.namprd03.prod.outlook.com (2603:10b6:510:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 25 Oct
 2023 10:13:46 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 10:13:46 +0000
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
X-Inumbo-ID: 32ace38f-731f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698228834;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9DhhHKObvE2CqWAtiUneFfpTK24Jp1LOBj6h9Lo1NoA=;
  b=bpJlFQmyMyWnkI7xoBPnupfz4phzGAVFfEUYwONKzOr2MoLV84mG3nxg
   Xf6qgUBWjTW1lBknf4QkrSpdOlTH50nyAJ55dwoWjdT/oXMJtq1CTf48v
   jdTgfV7d1tdVAnajFML70LCM2PPrcXKl5tUiz4dJz3u0BL10kaXFadcYE
   Q=;
X-CSE-ConnectionGUID: fPOWoSl+QwGhvqrtTWAkAQ==
X-CSE-MsgGUID: qPN7souyRRubvvIW32cN9g==
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 126455225
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:iXTQzKOZveEKS0nvrR2DlsFynXyQoLVcMsEvi/4bfWQNrUp332BRn
 GRLUWmOb6yMYGOgf4h+O4+w9h5UuJfSn9VrSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5AFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uhPJl5Jz
 vhbES8ibg6anf6K/5u4Y9A506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjy2rKSx3mmMG4UPKSA0KFxh0CC/FYOAgMIdGTg+/Kf20HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoJYnYCRA5cut37+tht3lTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:gcBd5q7Hvd8L1GBceAPXwcGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc7wxhLU3I+OrwSpVoJEm9yXcb2/hgAV7PZnibhILsFvAA0WKA+UySJ8SdzJ8h6U
 4IScEXZLKQMbE5t7eZ3ODfKade/DDuytHduQ609QYdcegeUdAE0+4WMHfkLqQ6fngLObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Ln1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESiti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF6icEj2PbvgoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPci7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZGIMvD0vFgLA
 BSNrCf2B8WSyLYU5nhhBgu/DV4ZAV3Iv+EKnJy8vB9nQImxUxR/g89/og+hXcbsLYwVpFo7/
 nNW54Y7o2mdfVmJJ6VNN1xN/dfNVa9Ni4kEFjia2gPR5t3dk4l7aSHoYkd1aWUQqZN4IQ/n4
 mEcFRZqG47ZkT0YPf+paFjw1Tzel/4cSvgzdwbx594p731WbzxdQWYQlAv+vHQ28k3M4nlYc
 z2FI1bBOKmEHDvF4hExGTFKuJvAEhbb/cu/volV1WS5v/aM4GCjJ29TN/jYIXWK3IfUGXnDh
 I4LVzODfQF0XqQHkXliwLaQHP1Z0z4+tZRPcHhjo4u9LQ=
X-Talos-CUID: 9a23:DehzDGGnbQj4svgyqmJpzGkrHfshMUTC43fOOlWkNVlAS5SsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ACCpsaA4bAYXvXsG8aTAntr29xoxx24LxE0cQgK8?=
 =?us-ascii?q?8psOaKw1PYG2WqmW4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126455225"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQXzDa+sAaWx+dikqhhrJcz0kPN08ysKBOp2ULP2ZXXtnJSMKlJO/nFFbEZX82x6JBvzyTxNuqK8VEK1Tn6nZycuf2+9V3Ea9fRwQSnF6jsnV1uEHoHfYdW6XYUiX9SkXqoS7FIyQTYEg+fvfbdNdfrAYhjr2QBciq8to+DVTQltfXiLAkuwtyxrMWuAsVq48XuFnl4tzEP9OVomeagty8GkerXQwFfrAOXJcF3CIxvrXMA3twzCx1hLENBKLKIw+CAwi2FxCSqeIRMKiskvjB8bNZPfW+S7pPyQc9lzA/aJPA7keSd6f5mdlt9lqz8T+0qZ+dR8FNCYaieNK+/0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKpIPWAbwNNkHC6pCqCF07XWz1U58EjKJ5Jpd1HjDXE=;
 b=nZoUYqyJvgqtOzLIMcm9dNs7hWk6zyLlmdWsWRq1O4wMX4ubiaB0iVGberl0Z6gFs11vn+Vk6BEeIeO7kOhJ/IXZ1glTnkMd6eGDwi7b8z4NAP6VzB+LmpMmppLW/SYO2B41gDHH2JXmcHF5DE/9C6a4D97yDPo2CPuFoZ0sRiL2WmYL9f3yAa8Dp6JflapRvLhlu6w5DHPdGrbaZEarUl6TriJKJrQLpUHdDyapVlRFqATsf6vb5t/3xWYDDzMb9kk+dkbEINBzKFCRv/C1eFchH31JGNe2UIObkR7/aL0ce+yEEAU2KbQPQjKI4eHhBh5wjl1WYSP3o5WBjlh+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKpIPWAbwNNkHC6pCqCF07XWz1U58EjKJ5Jpd1HjDXE=;
 b=XeohVFdCfvTeKDhgHmfwFK25jLU5rBt16xKvIhl1RlRWqt2OxOqnqqK19jzqj0Tz8Z6bJU6afjtzpRPuQfP/8U2E6h3iuFoLYzO4W+nDNe8QASiLMyFgKkoVPX7ivEWXvb4u91IC/QCS+kWlHL4JAqyDx7Z7rLWqAu2DqPDmI0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 12:12:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vPIC: check values loaded from state save record
Message-ID: <ZTjp_LYGwvKKumYg@macbook>
References: <060ae425-2daf-9ce4-d291-215d483d592d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <060ae425-2daf-9ce4-d291-215d483d592d@suse.com>
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bce7f6-75b3-4946-c14e-08dbd5431324
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I8hJtwNpS7iD/PD826iPpEiaWoQOftTjHi/LS/zKMgXMcn6lAio47aukxQWrar7lXl0cacU3LT+5jFpNEm+18+z0jKkEvt6/4gp2I7DRpxFxupewAuXFXHb+CLZiM4pK/NytYRCT86WS8pqVvAD0llQCsc4BUU9tuOwyBqAyb8pgFdBQxb0BceuFysM/DDF6TX7ChZMO2JwwjAK2mziQ/eVasAS7R2nb97HxcaDFxAgzvrDYchIHZ61NkEr8fxQaAGxNyfwqzFgc56ckgvW03AKRN3cPi5wsXUdmB+pZ5oKiTasgsg+eCROrzk2Nv+CT7Nqu4dNyEu5FcE0sLTpYIxP5K/hUXpA3VCs6hzKF7EmNZ35Tw/mLY3Fq1BAiDUDW1RVTLNg+bDskqBrlJyRVBuBUqiqTd2Gw30TyJtgmoyTL7fx6axGJ6zaIdq46X8vjxOQr00Vcum1ly6VWaVlp8g8zkhaaUvEZUB8JxfnqQa/scHNL74rIOtal36Gykh9kDmZ2WXPzMh4anQ6ZRVxddE2Px+ZxHXIRjMt46OKAsxtEc43Ui1Bj1R1H2YqerWvr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(6486002)(66556008)(478600001)(66476007)(6916009)(41300700001)(8936002)(4326008)(8676002)(66946007)(54906003)(316002)(5660300002)(33716001)(6506007)(82960400001)(86362001)(6512007)(38100700002)(6666004)(9686003)(26005)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0FhNFQyN2s4TytwZzNXZFZOWmRYQS9kbDZJRkthYTVmZmNLV2RZV0RiS1pk?=
 =?utf-8?B?MDE3U2hGNThncUtMOG1iOWhyemtSNk05K3RLcVlSZm05L2V1aG9ScnNyYlA5?=
 =?utf-8?B?RzFLenBsdFRsZDhVNWtnQUc3bFFpTGhzTEVyZW5mM1Y5UmhwejlJdTFJbktZ?=
 =?utf-8?B?RG9zVHN1Yzk1WkhnYTFJRk1IeE0yZENSWlhlSmtxZWR1NTYweHpvdjJRYnJt?=
 =?utf-8?B?ZTFNTVpubEcrUFhsM1loK3pHMHdabDBEKzZsSXBzcXh6T01MMUZrTmo5azc1?=
 =?utf-8?B?OVBqNkYyeXhKR0hPZlhjdGY1eENyQUpXZDA2MVhTbTgyRWVLUWtyMy9XV2lQ?=
 =?utf-8?B?MllRTkV5eVNkNzZPa1d4bjRjUWJvMStWVmllT0xuSlFFM1VLY0xYN29rV2Mv?=
 =?utf-8?B?QlpGc2w3bTR4dWF1V2tLVURZMSs1bWNkeVcrVFRiRmNDN25QWC9BOHEzcDhZ?=
 =?utf-8?B?VDhZa3FsekZIY1oyVXJSWHlLTUJzT1VhS1F0YkdCUWNmU1dDc05HdFNPZTFT?=
 =?utf-8?B?UXN0dEd2OVJEcXNLMkRFcVlDaTF0a2FEd0pncVdFRzd6aCtuS241RVkzaUJ2?=
 =?utf-8?B?TnUyeU45VFBmRzE0cS8xWm9zVVpwMVduTG9vUWpFSVJTZ3YwUVJuWHd3cmd3?=
 =?utf-8?B?bGd5UW1uSlI0ZGwwdnZ5TVdOSzMrQWMwQWowamxaZ2FrUXBjdzA4WE4xTWg4?=
 =?utf-8?B?NGNUNmFRd3lqRVljVEJVcnV4MkNmb3k5TUxocm0yTW56bkErdWNkdXEwUXlT?=
 =?utf-8?B?VGw5dkxpejg4cmJTSzRmQUdYMW80THBZbzFNc1RaV2hobjJWUlBkcGt5L0ow?=
 =?utf-8?B?dmthYk1OYmtRSDZjK3JsWnJLdVhqVkFDWUMyd3NCWDFiV2JQb3JwZjZGNWxn?=
 =?utf-8?B?TG9pTGFVV0ZsR1RrOHZXS0dLYXZFSjVQajNPdExBMTJWTExKNkgrMDVHcFZL?=
 =?utf-8?B?L1NPK0hnTVgraVFQSW9MQVVFUEtQWTI2bmgxUzBQOVZWYXdVTlVraUxxSCty?=
 =?utf-8?B?eFF3RUtNakJjYjBEUHlzazMvUzFpYWUwS3pwTmpSN3ZYeGpqT3ZNN1BLbEpV?=
 =?utf-8?B?b3BmTnc1YWR4MXI2eVR3bEMrbkY3d2lYTXNLNk5CU0VFK21taDREb09ZbnFi?=
 =?utf-8?B?cGFqOFJuMDA0MVlXemsxdmdna2hYd0VqSUF4TFhsYThDWFpMYTJTeDFxZDh2?=
 =?utf-8?B?M3hFdXdoSlBXeVJzMk9udzM5dnJnZGpLMTFnSjZOMUV1OGRMQisrZjBwSGZO?=
 =?utf-8?B?RHpXbGJBYy9JYWE2YTlBaHY4YzJESGpZcmlZeHNDNzZnWjRKcHBKZlcza3VJ?=
 =?utf-8?B?empwTTRpREpTWlkzQlN6VjFYNEx4MEtqWEIyU2JUUnZsTzlrS3hDcEM5cmNN?=
 =?utf-8?B?cWdld1NaYkoxVGlIcmNUWERaRVVGUmdkczVPdW9ZcUxwZXUwUGNpYWoweHNI?=
 =?utf-8?B?dVNlQnNsWWUyRnJtM05EY3UyNHBzUFlMY3RLZldnT1IxcnFYYVNvcWROQmZ6?=
 =?utf-8?B?ZmIwVkNqTXY3UE1rVkd4TWNRcTM2MEg1UklPa0tBb0pCMk5vV0g3dHFIcTJU?=
 =?utf-8?B?KzZJVTExek1ZWmVpbXVSQ3lEK0g4VWU4OUZjWUdDcmhmSWdjODlLb3RUOE9U?=
 =?utf-8?B?cWZMR2dMc0QxYzZjVzVaMEZON1BsNE9OaWRsWk1RaTAzVjhDM1VMOXNBWnoz?=
 =?utf-8?B?MG85ZFJFVkE4VWVYUFdDSFY0U3RGalJjM0ZBbFFBRUdkUjRNNWRTMFpuRnA0?=
 =?utf-8?B?S0pGRFJsZ05TZW5PejZ5eGNZaVd3NFJyNmdFVnN4MHJUZlNFaGFpUkMyTlFv?=
 =?utf-8?B?S3lhc3lVZnNLRDVyK0xtaDhzWEZTWE1SWWhqNWFycDBXa09kVnFzWDg2Z1Nx?=
 =?utf-8?B?TUJESVBqYmw2S2RiK2NZNVV0RjhkNFd2b0RDVmRzVnZoY3Uvb3ZGck84V2Jh?=
 =?utf-8?B?c0F5RkNGSkcwQmZBYzVoWnFZbmsxM3pTNyt0amkxemdlNkxxbnBVcVVnd2pW?=
 =?utf-8?B?MWwzQVpXQ09QZEhjS05PZ0lxSXlkcjdLSDZLQjJoWEZlcDA0T2hDNVpQaXFQ?=
 =?utf-8?B?M2YvN1FaQWx6cGFKdmNHM1ZNeEpuYjQreTVEU2llQVhYTXF5ZEJRa1hyK2dm?=
 =?utf-8?B?YjBXajQyVzhPaFcvWEdTMGxoamRpdWJlOUpEWXVVdG4wQ3BLbGNZSjEzYkxk?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zR6he4ozTTUVriYoO2oTH60wBFjmMzLKNW8XdW8aZ8U9PINNygq0E52sPc7s3lUeE+VPPYnCml1qOKRAL/wyZt5MuPQ3oWh+3jtSQ6tUFwbsSLy2MGPRl22VSTX32V3q0oY2b9+uezxF4fjaX6P9kg5eoone8baY/JRBa6mWCMfyD85WxoJfhiDG4RqRCXBfIVwcskUar/O8zO9uP0/wQgbR21OccuzP5ZuefhkUTjOfwJd54HrSpkl5YeY3g09k2zNJU/2QKjgB6kCQ7KnIORUScgTuqCu9dvfsips+DHD5Fdd6AEgAOPW7jvUjpXpkax0CLulcitv1pdmrN7ROkslQmttuZ5dMQvs4L+sbh8AtxDfVsYHquQ5wCB5kgr/DlUyO6UWrJ5yaRIIDE8DcHyaNLV4Aw9ZQWl64Xtup51eEGLTZeFpsWpgKBOrAHtYKTocooguMm/vhAAEnAfmR0G0vJyA1oulHuUVFE69SpoofMIweleL4acBqZ4wWkoLt+7I0x4X1a/RMkU9i0vpju3wMgtaWQ2t49CC7asV3hYfv80w02DmzLPsO4vW0VOF2EIaeO8ATq7+tbUDdjgkP2jOr87/5c+wBS2ZnLcQLKb8CF2qabL7OVx9HwnX9dWnYZp9MRB325kH7H6nI55/d/u4HqLJd1N6HLTL2jIjOeAuL/BNoHsJDr70FSyQlCGSXQk0ZW5eHNY8RyaBNVbkmReipySlYle0Hj0aPijXIXBVhG4c+MGW+TZGFCkkSgfMUbL4tzdMRBp6t5onnbBGcRNlg/gE9qkpJYCjDNZgj5zBSdBJhcNELpipyk709sLMGvIWls05sJ+Lh0t+jL5N3nw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bce7f6-75b3-4946-c14e-08dbd5431324
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 10:13:46.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfGVPmhhy0KbEKIwB/fcM70B8wFvNdDXrsjN7M9ywpZfH9iNwlQv+svpBXHDAbsPlqAF4kYfOd8LYFhH5HtZhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7107

On Thu, May 11, 2023 at 01:50:33PM +0200, Jan Beulich wrote:
> Loading is_master from the state save record can lead to out-of-bounds
> accesses via at least the two container_of() uses by vpic_domain() and
> __vpic_lock(). Calculate the field from the supplied instance number
> instead. Adjust the public header comment accordingly.
> 
> For ELCR follow what vpic_intercept_elcr_io()'s write path and
> vpic_reset() do.
> 
> Convert ->int_output (which for whatever reason isn't a 1-bit bitfield)
> to boolean, also taking ->init_state into account.
> 
> While there also correct vpic_domain() itself, to use its parameter in
> both places.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course an alternative would be to simply reject state save records
> with bogus values.

Likewise on the vPIC one, I feel it might be better to just reject
such bogus entries, instead of attempting to amend them.

This one however just unconditionally reset some values, but might be
simpler to just test if is_master == !inst and if it's master than bit
2 in s->elcr is set?

Also if we are serious about doing some sanity checks in the loaded
records, we could introduce a checker function for the load machinery.

Thanks, Roger.

