Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE15071FB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308272.523939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpx2-0001Zl-J8; Tue, 19 Apr 2022 15:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308272.523939; Tue, 19 Apr 2022 15:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpx2-0001XA-G5; Tue, 19 Apr 2022 15:39:36 +0000
Received: by outflank-mailman (input) for mailman id 308272;
 Tue, 19 Apr 2022 15:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngpx0-0001X4-F9
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:39:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4d1a8f8-bff6-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:39:32 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 11:39:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5985.namprd03.prod.outlook.com (2603:10b6:610:e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 15:39:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 15:39:14 +0000
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
X-Inumbo-ID: e4d1a8f8-bff6-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650382772;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PAwZASUasGY0RMM6nJT+C6GVW5YFgqKorJo3o8ipHOY=;
  b=B7KeTwJ7OEnenH/QVNHpfVNnijGB3hUQLD75tTW04KZUWIR1Uk1UZ6Ly
   vnWthsTGH1xlg/F+oDnMbbrETnWLucHf0jxGueYwc+ED+XcpumKaDT70n
   1I4neNzSNLOwxyeDROHMXSOm/d3r61SpT7rkL+JGJX2NpRJDWO9qRV54j
   g=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 71845912
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wk+DHKkfXWszyZYA/kxa5CHo5gz9J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdCGjSb/+CYzDxe48ia9iwoUIE75GHytJjHQo9+C08RiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWlLV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYajoCG7LRsdQnfkdISCZPL5RUx4T4CC3q2SCT5xWun3rE5dxLVRlzF6tHv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvZkBhGpYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVuszSOnVUruFTrGPrJIezQQZ8EpUSJl
 ETc7UPwUh4FO8PKnFJp9Vrp3IcjhxjTWogfCbm5/f5Cm0CIyyoYDxh+fUOyvP2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCopc4+C6cD2kACzRHN9ovsZZuQSRwj
 wfU2dT0GTZorbuZD2qH8auZpi+zPi5TKnIeYSgDTk0O5NyLTJwPsy8jh+1LSMad5uAZ0xmqk
 1hmcABWa20vsPM2
IronPort-HdrOrdr: A9a23:mhaBraEbz9cXi1FRpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.90,273,1643691600"; 
   d="scan'208";a="71845912"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaxKK7QFRdY6QW/phFJwTUcQABfA8aTeicilQgZdoaOxRFxtm33DFzH78LRFfmRbTC7VgUak3Sd0Zdfn9escmq95CaPvgbdSz4oLVfGN2kotFT4m24W1txlDy10wbUfGgmZlvPtqfCv/P/NEdDYC0K9JmUc+ImT1nVSVLMUFbAmLDrccfPwuu3tSOonwqHBbKDaT348AHn5KzZZiVDdwXqsPwqLbvswxMSVQ8WLZOyDdRcidf9o8yj8Ugn1E9WBjfMclo4QezmH10VfPXwigdYBBmUUpakyfgH1enncPtTyyi+Mv6DaPXTZXa6Ytxjxk84+NqaXlcvuQ41o598JhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAwZASUasGY0RMM6nJT+C6GVW5YFgqKorJo3o8ipHOY=;
 b=TpaDcgqFFoOJAlzICG3vDsKDWi6L9driq07LtqN02A4xBV5WjkIYXH3EcjjTuj+yTjih1+oESb1nI50qrzOpJwTekmhJXT5ORgD9Oqz/5S1KyxRHmqAnwL1AZwEK135pAQZ3IILol0/Syb1oENkTz2nANSV8adUiFDjBaSvuTku4GQwr0YVvsZonwqLAROaWEXxhy/vFV4gdKAbVub+HO1GGHnlZhuc/Oqi34GY5tgb7iT16MDamXaB+LkaQnWVOYCEkbNhKGQX/Yos4GGHkBJO13n07ap9ozZH43xodhyq7vcTetzTvu62RLyNYW9MrsWo7P87YsdFCnLLQAUAGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAwZASUasGY0RMM6nJT+C6GVW5YFgqKorJo3o8ipHOY=;
 b=abiSeNt5lJ0p/F1O0vutcFspXFgI9Vmoi9vhQ/v62JrBK2rLM1wShg13MskJnUhS9QW/bKtaAn0y66Pj8QjHf0+B6zaPAP5gqK58Bvjkl6guZRpryTUYDI9KGJ6WMsZUdHUdb7MwRsDTPvt1thInmyws+dXBTKDlHZDkLQtfVro=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Topic: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Index: AQHYU9FUwjuogeCS0EWgGeBVFIanqKz3DoiAgAACxwCAAE5MAA==
Date: Tue, 19 Apr 2022 15:39:14 +0000
Message-ID: <cbbd3bb9-c76e-7ba6-7cef-66d47e6d367b@citrix.com>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <6732a3c3-fc19-cbdf-7483-9f5946f1935a@citrix.com>
 <48fe2a98-98de-8aa5-8d3b-e70427008edb@suse.com>
In-Reply-To: <48fe2a98-98de-8aa5-8d3b-e70427008edb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2b62176-e459-4924-019a-08da221ac1fe
x-ms-traffictypediagnostic: CH0PR03MB5985:EE_
x-microsoft-antispam-prvs:
 <CH0PR03MB5985BCAC3B3078D346EEECFABAF29@CH0PR03MB5985.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cid0RemNujOaGdNXsozCPljlG7edl8AwD+WlS0Z8sH2o2DVhohJosNhNHmS9f6gpTlwpJjZJdJJh/2W2q/q5g+xoaKP8b4VV+NWJsXBxnIKWzaw2e/rDXdqiFx1dUophxetgIjsNgIc/eIXovALC03zC2CUoW+3Eqh/RHbGHHbK35XPiK7+V81IO/nFTByhyLCYhc/PjqyBYHaCZAt84gbEVBA+lfkQhnCtCK6t6bUqyoPS2jqTjvWSsAPnvOMH424hJ71ba2AeoS53m9cQdSTw8zkPDSwVJ9V/ioSrTJSF3xj+J4cR1RCmcsFU+3MXewMO90QUpS2QzQ/DcF4z9RsAjP/KpZ6BS3WsDbFnx4G7ByZqS/cLQ270vT4PsTdgSyjqt2QPZ/6ZfKRxC2T1flzL1J21R2hKuNzCsbkz6dHq6GBdTTtqBBX46+PZUtfhVDE5KhtOo1we6mjVqQ/WpXSRCkqoe5TFFc6bIRg5cemvTTvL7J5FKfK2sT3t538/4jjCRWh1hsWgiClvealrvZqXfbVOebln/HLBVSmcKQqRN7ozAdcVYD2DzvvYkCy2cBgBBbMWW+RQovskLUIDZxjyl4Y1Z9UwxmvU/R5gJnk1VAI4rQ5nw66linHIqkQJmGDFF4ImoSaYP11wxc9PiMwAr8Ck519SHqIcdDVKhLiFgN9Di311WaooObRPu5OdS9gjEUe7fSiNwTUVNh7opgEUmFiFE/1JHbtxsNoXC592YG8DeE2rpFI3qSKYqzPo+AW274lXxoJzAn3nZXA2ueg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(508600001)(6486002)(6512007)(86362001)(8936002)(71200400001)(2616005)(2906002)(5660300002)(53546011)(6506007)(31696002)(91956017)(76116006)(66946007)(66476007)(36756003)(31686004)(4326008)(66446008)(64756008)(66556008)(8676002)(6916009)(54906003)(122000001)(82960400001)(38070700005)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHlTZlIzOUJ5cjZsMzNIRUZScGtKQjBpSktCZ3NuRy9FbU1ZYXZYSFM4VlZj?=
 =?utf-8?B?TTQ4bU5QUnc0UW9qL2JJRjBRNjFma2ZVN3ZseHZiWUR6U1c3TzVDUnVYZERw?=
 =?utf-8?B?Nmd3bHUrQUd1cE1na1hNR0NQT1c0a1h5djFwdWo2dDV6SHg1UnVaem1nL1Bt?=
 =?utf-8?B?NXVjeXE5TWxDQ1loRjl6N3hpRVdmRXNkZEJPc0pTdXNMOG14U085a2ZRdXBt?=
 =?utf-8?B?S2dMWE9CMWJYdW83VWRaNngyYlU2cG15U1d6aHJ1WlNKYVV2eFpWU0xiaW5I?=
 =?utf-8?B?UlUyT2V2U1lWbGdwYTA1QkFINzNCRHYvQ0Q2WTNVMG9kQlhaUVA2RnB1T29s?=
 =?utf-8?B?US85Ym9pVTlkSG40WUpaZXlPSDdvaFJtQUxieGRKZzNXMVZqV0JaZlJobnE0?=
 =?utf-8?B?UU1IYkNEUTZrWFZUTFJqck03eWxuU09UN3lkUGNUeW0zSXB0R242NW1MOHow?=
 =?utf-8?B?ZXQybTBUUE1jaGdhejNDNFFzRjgrSmcrTXFTZzk2ck1nMVF1K1hhR011eHJP?=
 =?utf-8?B?dnNHYjB3MkNpa0hHUUlRL3lkWEhNd1lUK2o4dXJTWUNmYmNDQjRjekF3a09s?=
 =?utf-8?B?NUQyU0hCVzdJQVdaUmVHb1poY1FiUUZCNUVVaTU2TzlPdjFvZWh1ZER3NjA2?=
 =?utf-8?B?aUx5cUtCU0s0VFl2VHB2YUNjVUdCdEJwd09qOXVGdm9qeURhdGswQXRydGN1?=
 =?utf-8?B?ZHF0KzYzaWpEUDdJMS9JVnF4aUwweXJWTUx6ejJNRnh0R3I5dzFnU0IyN0dW?=
 =?utf-8?B?YUgwSi9MbFZXYWU5WGphaG91TnpYaVlmOFNjZEx4ZTdacUVKRWhvMU9vNjlY?=
 =?utf-8?B?bjNUVFk3d0FmdG51dTFGRGErVjNKWjB1R0ttbWo4NU4vZklmQUVReGdDNlMv?=
 =?utf-8?B?bkphMElaWm0vRlhZZjdIdFBHVVR4SmVOeVFjb0dGeHlpbXU4cCtLVDhJTU5C?=
 =?utf-8?B?TStXVFI3Rmp6R0ZwMUdCQzYyRlYvRWFiRnJEbGhRcHo5NlZQaTJYMXRHZHFq?=
 =?utf-8?B?VUtLYzhwT1NrUHdzZE1hSnlaVkJCYTljOHpJcXJHZVdTRmozekIyU2E4TE9i?=
 =?utf-8?B?dkxvWlJaVVkwbDRyZENjTnVxZGxMNzBmSjNXNVpnVy9ucTlDTFVwSjBuMnVk?=
 =?utf-8?B?dlNYVFU4alV1RHNIZkNtNktiK0ttdVpoa1VDRGJyak1YVGFKalBHZ216ZUo1?=
 =?utf-8?B?WFYvaFRJcmovTWp3UURDL2luYVBjZGNZWUh5RGFGRytEczM2NjUxSkVsdUVi?=
 =?utf-8?B?VUtWK2xjNGx5Rml1bC9uVWZqM1ZkV0FrSWNMamovUlJqcHdyU2NHWVFHS1dz?=
 =?utf-8?B?ZUQ1MXNZbHQyaVp5cWhYWlZyZHBEam4wOHJyOFcweE1weURMUTdDOTd4eFpy?=
 =?utf-8?B?cTA4WmlHRzdUUHJ3NG5xUFB6SEdpc3NXb1V2VTNYMlVrb1BrWWc4RWJKZ2Ny?=
 =?utf-8?B?Ny91TGNQbFlpTlVidENLekZXYUM5N3pJMW44V1lXdnB6cUx2bmZoQithVDdE?=
 =?utf-8?B?WlM5WEd4M05tTDBxTE1WUUF3OHJFTUN4VkladUhVTUVlVEhWREJ1NkN1Skpw?=
 =?utf-8?B?bmMzSzNwRGhKOElFd0czK2NtSGEwOEdSK2ZxdSsyTGhndSthZERqeEZYQ1hE?=
 =?utf-8?B?cGRIalZ2Q2prRDVPK0FITUFPbnFUMS9QOGVINTJVU0FiU3ZIam1qc29PaUEy?=
 =?utf-8?B?eFlEYmZjRW5VT1huTU5pU2U5c3Y2WS9IdXVxWDFmb3NQV1JOQ3Q2U3Jkd2hW?=
 =?utf-8?B?OWNIRG1XZy9sWW1oTXVyUHhyYnFONmtwOEFvQU5ldGswUTRWem9qdU83cnpT?=
 =?utf-8?B?VmJXODBJYVFrdUJreEVIU3pEbFgyRlR6SVozTEdtWmVrYVBOU2pIZmRORUxs?=
 =?utf-8?B?T3JGS282aEZJSHBIQUZGdHdWbUlVWWhVTzEzNEErMzAwUTlLbkxTbEgzcHZU?=
 =?utf-8?B?cjNSK0t3VDIvdTJNS0VUWVhxNStzT3psaUNJUkR1cGlESDNFdE0zWGprZHBI?=
 =?utf-8?B?aFAxQWVFSTNqUVBQbnhTVUthTVRvVG1wSmZvd3RaVXJqV0lhMEdxaEhLVWdx?=
 =?utf-8?B?TE9XWUJaVFBPMUYwdW4vc0laWWpzdDRCTnJ1Q28vcXBvckZORE5mblNjd1Rt?=
 =?utf-8?B?aWtoRnpydHhCaG1GMDZhc3ZadWgydHROYUdPYkt2M2VrZXhybkV3NG5nV1pr?=
 =?utf-8?B?VEkxTStKMG50S1NOaTdZOVhVWHhVVy9zQ1NxY21WQmVuYjhwcEZNVWVhK2N1?=
 =?utf-8?B?QnlBc3I5Yjl4V3lBTXNnR29qNFp0RVg2R1dUT1RpRFNvNm1SK3h2TjNBU0gr?=
 =?utf-8?B?c0NQM2lxL2EwQ1BobWxoOG9nQWNSb0cyTEpoUHdleGhFUERSUXgxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18C482F7B1C13C41A21CCE2D38206D45@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b62176-e459-4924-019a-08da221ac1fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 15:39:14.4708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzXU5ZwSyQZeRJD+5aCdhBtaou+c4mbsLe0y/dx6L6G/PajYAd5k23/7/hBQ0Yxw9KQ1X6HzyD2lyfmaEU2HhY8Dbm65jHlwiJ0vZLFeyDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5985

T24gMTkvMDQvMjAyMiAxMTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE5LjA0LjIwMjIg
MTI6NDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOS8wNC8yMDIyIDEwOjM5LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+IEZ1cnRoZXJtb3JlLCB1bmRlciB3aGF0IGNpcmN1bXN0YW5jZXMg
aXMgdGVzdF9hc3NpZ25fZGV2aWNlIGxlZ2l0aW1hdGUNCj4+IHdoZW4gcGFzc2luZyBET01JRF9J
TlZBTElEID/CoCBUaGlzIGhhcyBiZWVuIGJyb2tlbiBmb3IgMyB5ZWFycyBub3cNCj4+IHdpdGhv
dXQgcmVwb3J0LCBzbyBpdCdzIGNsZWFybHkgYW4gdW51c2VkIGNvZGVwYXRoIHVuZGVyIGJvdGgg
eGwncyBhbmQNCj4+IHhhcGkncyBpZGVhIG9mIHBhc3N0aHJvdWdoLg0KPiBJIGd1ZXNzIHhlbmQg
aGFkIGEgd2F5IHRvIGRyaXZlIHRoZSBkb21jdGwgdGhpcyB3YXkuDQoNCkxvb2tpbmcgYXQgdGhl
IHhlbmQgY29kZSwgaXQgYWx3YXlzIGNhbGxlZCB3aXRoIGRvbWlkIDAuDQoNCkkgY2FuJ3Qgc2Vl
IGFueSBldmlkZW5jZSB0aGF0IHRoZXJlIGhhcyBhY3R1YWxseSBiZWVuIGEgY2FsbGVyIHBhc3Np
bmcNCkRPTUlEX0lOVkFMSUQsIGJ1dCB0aGlzIGlzIGFuIHV0dGVyIG1lc3MuDQoNCj4gIElpcmMg
dGhpcyB3YXMNCj4gdG8gZmluZCBvdXQgd2hldGhlciBhIGRldmljZSBpcyBhc3NpZ25hYmxlIGF0
IGFsbCwgd2l0aG91dCBuZWVkaW5nDQo+IHRvIGtub3cgb2YgYW55IHBhcnRpY3VsYXIgdmFsaWQg
ZG9tYWluLg0KDQpJbiBhIGNvcnJlY3RseSBhcmNoaXRlY3RlZCBJT01NVSBzdWJzeXN0ZW0gKHdo
aWNoIFhlbiBtb3N0IGRlZmluaXRlbHkNCmRvZXMgbm90IGhhdmUgYXQgdGhpcyBqdW5jdHVyZSks
IHRoYXQgcXVlc3Rpb24gaXMgIkRvZXMgdGhlIGRldmljZSBoYXZlDQphbiB1cHN0cmVhbSBJT01N
VSIuDQoNClhlbiBkb2Vzbid0IGN1cnJlbnRseSBoYXZlIGEgd29ya2luZyBpZGVhIG9mIGFuIHg4
NiBzeXN0ZW0gd2l0aCBJT01NVXMNCmJ1dCBub3QgY292ZXJpbmcgYWxsIGRldmljZXMuwqAgV2hp
bGUgc3VjaCBhIHN5c3RlbSBpcyB1bmxpa2VseSB0byBleGlzdA0KaW4gcmVhbGl0eSwgdGhlcmUg
YXJlIGNhc2VzIHdoZXJlIHF1aXJrcyBjcmVhdGUgYXN5bW1ldHJpYyBjb3ZlcmFnZS7CoA0KRWl0
aGVyIHdheSwgdGhpcyBpcyBmdWxseSBzdWJzdW1lZCBieSB0aGUgZnV0dXJlIHdvcmsgdG8gYXNz
aWduIElPTU1VDQpncm91cHMuDQoNCkFsc28gYXQgdGhlIG1vbWVudCwgYmVjYXVzZSBYZW4gZG9l
c24ndCBzdXBwb3J0IHBlci1kZXZpY2UgSU9NTVUNCmNvbnRleHRzLCBhbm90aGVyIGNoZWNrIG5v
dCBwZXJmb3JtZWQgaXMgd2hldGhlciB0aGlzIGRldmljZXMgaWRlbnRpdHkNCm1hcHMgYXJlIGNv
bXBhdGlibGUgd2l0aCB0aGUgaWRlbnRpdHkgbWFwcyBpbiB0aGUgdGFyZ2V0IGRvbWFpbi7CoCBF
eHRyYQ0KY29tcGxleGl0eSBoZXJlIGlzIHRoYXQgaXQgd2lsbCBub3Qgb2NjdXIgb24gYSBzaW5n
bGUgc3lzdGVtDQooQ29uZmxpY3RpbmcgUk1SUnMvSVZIRHMgb24gYSBzaW5nbGUgc3lzdGVtIGlz
IGRlZmluaXRlbHkgYSBmaXJtd2FyZQ0KYnVnLCBub3QgYW4gYWNjdXJhdGUgZGVzY3JpcHRpb24g
b2YgdGhlIHN5c3RlbSk7IG9ubHkgd2l0aCBtaWdyYXRpb24NCmJldHdlZW4gc3lzdGVtcyB3aGVy
ZSBlcXVpdmFsZW50IGxvZ2ljYWwgZGV2aWNlcyBoYXZlIGRpZmZlcmluZyBpZGVudGl0eQ0KcmVx
dWlyZW1lbnRzIG9uIGRpZmZlcmVudCBzeXN0ZW1zLg0KDQoNCkkgZG9uJ3Qgc2VlIGFueXRoaW5n
IHVzZWZ1bCB0aGUgIndpdGggYSBkb21pZCIgdmVyc2lvbiBnZXRzIHlvdS4NCg0KfkFuZHJldw0K

