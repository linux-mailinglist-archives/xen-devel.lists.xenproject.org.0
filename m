Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D147A7627
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605310.942915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qismh-0007oF-QP; Wed, 20 Sep 2023 08:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605310.942915; Wed, 20 Sep 2023 08:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qismh-0007li-N0; Wed, 20 Sep 2023 08:42:11 +0000
Received: by outflank-mailman (input) for mailman id 605310;
 Wed, 20 Sep 2023 08:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qismg-0007lX-61
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:42:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f5e6b1-5791-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 10:42:08 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 04:41:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6326.namprd03.prod.outlook.com (2603:10b6:a03:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 08:41:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:41:54 +0000
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
X-Inumbo-ID: 93f5e6b1-5791-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695199328;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Qz/s9mqoZvzaMk9cmBf1qBY25nbsPuCN8mm/RFoSAHw=;
  b=C0SJrJoG3S/uYf60I5UMr5sW6Vc8neK7S9GzKPTOOWPS9VvHnP7LuA1L
   bdFKRR+cNlcS0+h6tSTMhSVTrp4tzQu/uMvVJdeOcovlQqMICQF3JNiNw
   cC3UHVLFFEYfyp8n8hoJ+BFrVfqiWtXEadV44aqgWxacSPnROyJJQqjJT
   A=;
X-CSE-ConnectionGUID: U3NASulVTq2+22Fcpc6jpw==
X-CSE-MsgGUID: tHDX5Cq8T4Wfe8WZl1xqKg==
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 122451231
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RKTAWKmX01MFsnDSJPg5+GXo5gw3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOD2COaKnZMWejeY1+PYy/9kxXvpHSz9VhTlQ/pC9jEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K6aVA8w5ARkPqga5geGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cFDDhk2cxS9u/vsg+jhZOJ0jZohNNa+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmhBN9LTubhnhJsqEGz6lxOIwRGaQeEr/TptXy6AsJGC
 ENBr0LCqoB3riRHVOLVYRq8p3KVuw8GbPBZGeY69QKlx7Ld5kCSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRR0rLCKQGiBsLeVqT+/MzIcK2MqbCoICwAC5rHLh4U+jQnGSNp5J4ezgsfoAjH7w
 z2Mry8Wiq0aiIgA0KDT1VLahzOhoLDZQwhz4R/YNkq+9R9wboOhY42u6HDY4OxGIYLfSUOO1
 FAbn+CO4eZICouC/ASVSfgJNKGk4bCCKjK0qU5iGdwt+iqg/1anfJtM+3duKUFxKMEGdDT1J
 kjJtmtsCIR7OXKraep9Zd23AsFzlaz4T429DrbTc8ZEZYV3eEmf5iZyaEWM3mfr1k8xjaU4P
 pTdesGpZZoHNZlaIPONb791+dcWKuoWngs/mbiTI8yb7Iej
IronPort-HdrOrdr: A9a23:cggROa6W/ObU3Hp8ZgPXwDjXdLJyesId70hD6qkQc3Fom62j5q
 STdZEgvyMc5wx/ZJhNo7690cq7MBbhHPxOkOos1N6ZNWGLhILPFuBfBOPZqAEIcBeOlNK1u5
 0BT0EEMqyWMbB75/yKnDVREbwbsaa6GHbDv5ah859vJzsaGp2J921Ce2Cm+tUdfng9OXI+fq
 Dsn/Zvln6bVlk8SN+0PXUBV/irnay3qHq3CSR2fyLO8WO1/EiV1II=
X-Talos-CUID: 9a23:Er+2zG3P71SAWR05HkpCUrxfJ5sDW0bAyEnsOhX7UzxHQ6WeF12I5/Yx
X-Talos-MUID: 9a23:DCvswwsNNDcnSoYJLM2nmBFOBJpD+vSSVH8DnMU5ic3dJTVTNGLI
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="122451231"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJtv4m5/cJWC3xCcU0CU3eS44JHgGAruxSv63+t5Ahg0aHNlZGcyHTLCs7F6mUUrlMW11S8GztdJeLq48dMAHFK57ELcR4ZpyBwpzo5EqUBkwNcZCm+ZosqH4sGIoH8w0g2y4JgK87FuznVtiYSh8nl0bbB4a25H1HnGRxq+6CnCsbpmyR2ArFc7LJtw+abODUOeOVijLFx8KsFqvZlTLgJV7db/8hW0bHwQ0j7t5IpZdPRhMiZkQoORkr5Mo9ON2pmKFTh1E2kTkEcRK+ilBU3UoCmbWqfG7X7joae1D7bPd3f5hi8xJX4cX2ls7IFkQTIqxAvBOPctsXLtTDeg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLYPG3+XLKX87aX2BNbt6XEVI1IvRqOgNNa1Ts87+XY=;
 b=nLG85DVcEmeJfjIVYLro3GkCfQwF0C2+PovAPpgYG7+txaiygB9ub8tplmqV8+5fsWcsPqlbHon8QBMDmMXWiLQIEyhrCm2MJHTy6oe+ShudA/OkB83qH57/46zxWIUyKOs78eI9rXt8xb3G/vTT8b1ET+n6Soq5O7UvC9smwhsrOX/SYNHs4gKBbBeNdwsIgNwbUG70kQ70eQMKSbwaflfQhpzqlABX2UB046wh9Hh4RDTmt8MPm2X6/NAaaRtdxAhpmS1xJb4CPGzWk7JLn4prgPLZRJP2Pg9kKgKfB4uekliO5Bs/dZdZueDtglwKbZONMvph8wNuqPxxKQignA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLYPG3+XLKX87aX2BNbt6XEVI1IvRqOgNNa1Ts87+XY=;
 b=j7L72aueMExgNVhzDVEO6ems2vfYXQ6jPxZmEXHz/wA+7ZPld0duhhHZ0WE9mssvi1MU49hlbOHTr94id806nTqVEPnNmQyX2h6tC2p6BfAMQ0jo2drZTl/3hhXTlMLtwDr9t025ppUUxAdMKihR/2oozfSLF03NtSlgrcAFkzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 10:41:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Message-ID: <ZQqwTWdOqXnDYjvM@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
 <77e2dbc0-c224-4c1e-72a0-5b19aa76ba0b@suse.com>
 <874jjzhsd4.fsf@epam.com>
 <1f57bbf2-d6f3-2e3d-61e0-049b8e2e070a@suse.com>
 <87wmwthbos.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wmwthbos.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0619.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e2889b-91b1-4cf0-8b78-08dbb9b5711a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KcoZj47OD2l5ZrZNt/MLRQ9uxR4mJKn41HMz8g5xQMQMd0lYZs545D247P4QY8Z4xLdFMtpHC1VfivpDArUOPmreb458TqggorjFuzn5CoKzeS/F+D8Fze2ssMs4oxkY6q4UccZxRkgPT6tR2kwLxNg7QQ//+3k1H0CDIJZGNgFcFdr7ks/JtVonbHInnNEZAUKzIaPIDP8ehxG21joQqv9daDiLe4XqsnEHXZ0bddkduYg9bXQ3JaRWVb+UUjSEbeI6Zu3bcVFmv/41exrh8G2uY4QOtY3HOGRUNUhLZ+kZ4Gqo8prrLtmvL5S0eCDKAq8B8UHo4CWe2TunL9PuKbMWjeDXHUzrnvZvZxnsTxKKnli1Tq0GjZnZDziWxyahrOkXsmbHaX3hZ6p7OBFzb6OqnL+XKlUKEbHB6XoAv9FgiAWqwtfn/7TErqHE55rZEE6Lk8x5beDVj/Nk3Z0qfHfrRdCd39Q0GWRj3XmnqDC6U9J/LjA3FcnaYGHm3wuCzLpYpi93r2SW/8L2bEhbz9tdEv2vew8LGsZsTahhN3AuM942kQQKlr9UwgxB7w6P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(38100700002)(6666004)(6506007)(53546011)(6486002)(86362001)(82960400001)(85182001)(2906002)(26005)(6512007)(9686003)(83380400001)(478600001)(5660300002)(8936002)(6916009)(4326008)(8676002)(41300700001)(33716001)(316002)(7416002)(66556008)(54906003)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3dMYjVNOUhiRUZMbHBqd3ZuUGFQclIyNmNVOWdZV0E1YnN0WW5qK0VRbDNj?=
 =?utf-8?B?cFRuSVRweDgvVnNPaE51OEFSbHl0R0FBbW4zdUFqWFdYS21CSEl6Zm1DbVJ3?=
 =?utf-8?B?OGp1QXJvMDZQdkpZUWR5R3dmVFo3K0k1anp0cTZuS1czT3VJZ0dwempiTTF4?=
 =?utf-8?B?NVRZMzVrTVQvQ0diNkdrSjFic3JWNndhRHovdEZBelpGTXBuTVdYL3hPRDY0?=
 =?utf-8?B?cUR3ZExCaVZra0hrZHVTenRYVGl0bXRoRFhaQmpoeEw2bnBmeGdxZ0dOTTlG?=
 =?utf-8?B?TkNyU09qQWczNW1IbHBDRmNYZXNyOU03UUl3emk2UWtPM01ld2Y2R2lxblpQ?=
 =?utf-8?B?RUVuQkZ5aGxQRjJLVFNzb1gyOEdzdmpJMXNKODVqaUcvOGNEM0tZVHV4N3RS?=
 =?utf-8?B?K2FHQ3YwZzU0RTdYVjJia1NHd2VVNGxIVDVuRjZsUXo3ZU5jNFV4a2hRbjZN?=
 =?utf-8?B?d3FtS1NkTXhZTHlBaDVmT1F2aVdpd3h2ZjVsUU1lS1ZFMmhaQ1FWYm5EVDd1?=
 =?utf-8?B?bVdhWE9hN2VueG1YTWJ6VUhlcVFVdGw1YXNUbGZGZ1ltSXhSS1Mxa3NVZCt4?=
 =?utf-8?B?V1B2N1ZHM3RteHZFOGo4R0d4dFJMM1RoTlB0UDd0MTFrY2Jac25mV2dIejNV?=
 =?utf-8?B?VUVpSk91aGw5UlRhc0RiMURCUnJ6QWZVK0dQd1pNQnlUbjgrUnhLYkNrK1FN?=
 =?utf-8?B?TTdjcHgrQjgyMldhUWVRVTBRdUEycmtha2RUbkU0R3ZXZUZXTktkMkpJQ0pH?=
 =?utf-8?B?ZEpTUXFNQS9ZQWUzN0dESXFDY0dkYkk4Vm5BUHRvSS9CZ0J6NlBmbVgwUHRP?=
 =?utf-8?B?MVc3L1liRDZFWG9ZN1E5SG0xd3kwdG9tMFQxV1dJb3c4RHdNR2wvS1RaR0hO?=
 =?utf-8?B?Yk43eWZMblp1YVN1QldvZHhTQk52L1g0SW5QZFc5QStUSGtucTd2ejIvTFFw?=
 =?utf-8?B?VVh0STFpc3NtOXZYeFFVK3JrN00rRTAzSXFnUWhXek9aVFp0L3Z4VEtXSTgz?=
 =?utf-8?B?a2ZTcEJiWjYrTVRJRmZRWlR1eWJ4eUJFZE9iSWFjUDVFU2xmZUZUV0JYc0Np?=
 =?utf-8?B?VTlpNWdZUUxEVEFFMDhJQUthV2NmUlhtNGl2cm5sVHpyTjNtOWZwN1NwR1Zs?=
 =?utf-8?B?TWJvZHphWk1iQ2NDakNjT3JBN0Vlekk5Y2FLOHZXM3NIdzlITm9ZSVZGMkFp?=
 =?utf-8?B?Mmk3ZmtERHp4QVBMeHMzMFFua2xLNjVQRkhFZjlqcmVhZm5NNWcxWjV6Tlhz?=
 =?utf-8?B?dkFmbm8vaDZmQ3ZNSFlVMFJUeW1sR3ZMOFV2ZlRaazYrbTdNSlB4Q3JuQjM2?=
 =?utf-8?B?TlpYZFdzM2FGTTNEQk43YjRVNWhWZ1YzaWxCQzdXOEhrYzh2MDltamt3aURm?=
 =?utf-8?B?NWd0ZEl3WDlLVFZaWi9xT1R4OWNOekZQZE1QaTQ1TFZzZkRNeTNiSFdldmJO?=
 =?utf-8?B?NkY3OHJmdHBiWS80UXc2UzM4d21qR1R4UFpJUFJIMzJaTDZFdUtKVDZRazhL?=
 =?utf-8?B?bnFEVDh4VlVKcm9JTnhMVE1qZW1oa2txWDZuRVhMcDRsdUF4NGI1YVhUcVpa?=
 =?utf-8?B?TnBvbU02SGpCT3FQdkNsMVRqTWhsT0Z6Y09uMHQ5Z0FIMk5kQWRGRjFJTDdV?=
 =?utf-8?B?VjRZVm96bnM1dzIrNFVrQjFualNiNlE4enQzbjhIdzlRV2x0TWNhL0RVVkR0?=
 =?utf-8?B?VDRJdnFBZG9TZkVJWEowY0Mzc0pXMU9lTG5zNzVPRm9PbGFINXVJMFhXUnNL?=
 =?utf-8?B?Q1JnMC92OXFHK3oyT0o0K1hCb0oyMkIxY0ZKZDEzUnFGY1p6RlV5dDBmcnlx?=
 =?utf-8?B?OEJTZU94WTFmMEZpb1VDZDd4dVVRbnJWR2RlRlAxU2dQaklsUm1zUm5TSkVi?=
 =?utf-8?B?VlZQUk9JUVRmUGgzOGpka0VuQm1YZ1l6dStQOUVuZnBpdURFeUF6b3ZHTnFU?=
 =?utf-8?B?ZFR0bC9velg3bHRleEMvQ1BOL2J5cW5LcGtXcmU4dzdYUEJ6b05ZanJ2M0hU?=
 =?utf-8?B?UURxNlRwZUhnVFZ6N2d2allYK1R1VURETkV5Q1lYR1JCLzdiQmU5dWNKNUZZ?=
 =?utf-8?B?U1hSZlFmRW1VMzViV1FDWHBPUDBtTEdYcXN6c2g5WGNmWHhEVG9rWXMvd2w5?=
 =?utf-8?B?blhKQjR0dUdub3FPbFVldEdhTWJ0TjhSTGhrL2hCQVZHOHZpRmxYWVJIamdt?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wn3jzYgRkafx55nMB9rioWIVxCISjLseFNhyXsFs6SRvUJRbi3RR2PEwCQd+FhNRNHjfUEF6biphjL0Szs5GJrswaX+qozFQK4NeWZUyhti6G/6LH3aSY5t49Y1WwbCVZo4XNYRPTW3xwTu0LHCk/EIJ5uA09O5zKtP7AtLwxLpI0MSVvv200ER3czqR+0Cx5nSNKuoLYBESydezntTBv/Vhd2Nq84x+mhu9FvdZ4H2eeZC3wubWPF1fIhrsvhN03kSZx0zEw7xgDWH9NmND868xW6lwNKmT9/ZqlHJHqLAetMXXBRYtWbiN9dwiT97lio4EsMgBvSxmjHrO1uC/W6y50VZ+k6gxrEVSJ2XPCMwHQgV4A5jKcdab396+5N0pZIC+Xyu2c4YV5QQEGNlkQZ+GKPqCZpiQaC1/8OItMxPt4GW3+JNOnnL/eUgG87kkKFlz9wxUapWFfgyGGgbIBr4A0mRk6wybivS07FEQ3ary5kInecCG4uUNhii/AH1hxmjGU3+3R4a1JPQyQqRiKu08c+YFI9i2kEY/bbjyAt+skbSGIkhwNbSi7Evx0Wk0tppeSZKugoY/c3Eshi4vymRvJdBFkaINWXovFChQm5mJrQp0vo6Py/ywb1R13INOc8q+qBjybAW4N59RK61qQCXTftB6/73Hm5XKDAZ0buB5bdAnW43pM1aaq46wtyRwuV0u5jRLZfXnacBuzWZ4DeErpEjHY3dUuLKlFjoIAeT47XSf6bwu+EFr4YSe4IUTQElr+uRJ1AEWKLGZRMEpOzmcPgeiILzALaqvDSSmbPx8UiSxm7DRLj/l10655nChzHJAq9UFzCOoitvEzEeTJMDgrssC4iX8bpofnzN9RKNOflI1yklApD2WDGPBE/FPOZkkrPj2dTv+7aGZGQYoZg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e2889b-91b1-4cf0-8b78-08dbb9b5711a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:41:54.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU/mzaksAO2FkC0aKU62cjzrvRHmmghB54AR5eVrw11biShyi2o5coYklhzfdsrZ0NFj1zj+S2apTKLSbChXOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6326

On Wed, Sep 13, 2023 at 11:53:56PM +0000, Volodymyr Babchuk wrote:
> 
> Hi,
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
> > On 13.09.2023 01:41, Volodymyr Babchuk wrote:
> >> Jan Beulich <jbeulich@suse.com> writes:
> >>> On 30.08.2023 01:19, Volodymyr Babchuk wrote:
> >>>> @@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
> >>>>      if ( pdev->broken && d != hardware_domain && d != dom_io )
> >>>>          goto done;
> >>>>  
> >>>> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
> >>>> +    {
> >>>> +        write_lock(&pdev->domain->pci_lock);
> >>>> +        vpci_deassign_device(pdev);
> >>>> +        write_unlock(&pdev->domain->pci_lock);
> >>>> +    }
> >>>
> >>> Why is the DomIO special case ...
> >> 
> >> vpci_deassign_device() does nothing if vPCI was initialized for a
> >> domain. So it not wrong to call this function even if pdev belongs to dom_io.
> >
> > Well, okay, but then you acquire a lock just to do nothing (apart
> > from the apparent asymmetry).
> 
> Yes, I agree. I'll add the same check as below. Thanks for the review.

Hm, no, I would rather rely on the has_vpci check inside of
vpci_{,de}assign_device() than open coding dom_io checks elsewhere.

This is not a hot path, the extra lock taking is likely negligible
compared to the cost of assign operations.

Thanks, Roger.

