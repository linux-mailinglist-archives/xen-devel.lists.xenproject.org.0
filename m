Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DE6602B5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472746.733103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoHZ-0004mL-VN; Fri, 06 Jan 2023 15:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472746.733103; Fri, 06 Jan 2023 15:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDoHZ-0004j2-QD; Fri, 06 Jan 2023 15:05:21 +0000
Received: by outflank-mailman (input) for mailman id 472746;
 Fri, 06 Jan 2023 15:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDoHY-0004hP-5M
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 15:05:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868da59d-8dd3-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 16:05:17 +0100 (CET)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 10:05:14 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5713.namprd03.prod.outlook.com (2603:10b6:303:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:05:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 15:05:10 +0000
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
X-Inumbo-ID: 868da59d-8dd3-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673017517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pe0jS5A0aRzTdLML3t90WfHJv8bffJSIVdsTEe5UdMk=;
  b=dzuPRB/0bgkMBp4pYv3NwRhnGTyEvkPWMluqyWYi6trZVeCcVR2MYwFR
   vBQLov5cf8EP+Ljn7rOnLhQsyxOThKWHnpMbTRi53oKvwcsJcoAmJzuEL
   X96dFMGnL+Qood2bh+2GzNKpOcLC90EqgepFbTIzdb6oAIs0eh69ZZfHS
   Q=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 91903485
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OE9KcqN4zexMOkTvrR1GlsFynXyQoLVcMsEvi/4bfWQNrUor1zQBy
 mEWUW/UbPaOamqgLt1xOYuz9hkBuZTQzdAwTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5gJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uFlWTgU/
 s1AFDAqR0G9m6WnnpmrcsA506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexHKjA95CSdVU8NZrsFKXn1I3CyFVdni4ndW7lxSZXvB2f
 hl8Fi0G6PJaGFaQZt75Uh6joX/CvQMGXNFQEOoS5wSEy66S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZtliGaixk9b8MSvx3
 TeRrS41wb4UiKYj3Kyh8VfKqzmlvJTOQ0g+4QC/Y46+xgZwZYrgbIvx71HetK9ENNzAEQHHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGp9slePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:f6FWVqirmHkD/M179Y38v0gT1nBQXugji2hC6mlwRA09TyX4rb
 HJoB1/73XJYVkqKRMdcLy7Sc29qBDnm6Kdg7NhXouKZwXvsmqvMJxe9oPpwTH6chefygc178
 4JGJSWY+eAaGSS4/yKhzVQ0OxN/DBEys2VbCvloEuFhDsKV51d
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="91903485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxwcozv58hzWGjZOhl/wdeG1mja8/ArtjWt7beR03BTma8/G35ymEVAQh2KdamLVcfr8/XuZs57LikOKxv/AFktKe+dvfOixh0m8uhblFbVunAqduwmP/LlxAwyBE4HuilIK2SIe2YmEe29Z9b5WSF0/8euEjldETkb5iAddDQRXk06g5FGnFEhI0u3OvBFD2GZak3tU09NIhb26N5q6fWb1WZM2pQtaQ+VL7d5fc49CRRzx++/9kCs/4B1BopRlBFu0tEyK0HcDmSTiGp68AEz5FCCaliO+cMLsXt+CsAnzJIS/lNH5ZOd9VrDMapxouBympihPQ6I1d7IcfQjsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe0jS5A0aRzTdLML3t90WfHJv8bffJSIVdsTEe5UdMk=;
 b=VvKg+LCkeRYoVcIL3Xqy3msz+pOic9vIbFH0xgJ5pOUo2ywNcbkgCXj19b194dsrsbTlJeL7mvmvISvNBtbv9tcsYgJURuxVefIcwEei+/6BsEqVpoHVqi/HvJ2Ma7VkqC1BmCZGt5y8H5XLB+JZcPnVQtqvrVkClmLyV749L5LCr4cZOY3g9a3m0m0fYI86IeaifqAFVboIdxLbgcQXkYIKI73Mr+Qeb2CTuQZf+19lvWMJN4c5brhbay8Dk3suOe9wxkR2MidRO4B0yaYfYTTrxHHh8gsqeh0je7uZ0VDMnpd0DmF2WToy5fm6vtfOU1zulFGlMFg2PnhyJmNowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe0jS5A0aRzTdLML3t90WfHJv8bffJSIVdsTEe5UdMk=;
 b=UoovUS3/vEe2eI1HWSWP/fU+oAeaDkXD8NFw9sElyzvAL73nF9sCf8sHgWNzMdST6UiZUi8eYiBx3KTnIJRVrkortH/NCc5cVe0WvIaBcSiEemCW2nkBCDZ6dvZXkMXPjUdzxVJ35FBaylzxkkMs/ftTUV4ANqj+daoakHpmMTM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 8/8] automation: add RISC-V smoke test
Thread-Topic: [PATCH v1 8/8] automation: add RISC-V smoke test
Thread-Index: AQHZIdDdCltTrKYYX0C6LpSEFhyV666RfOgA
Date: Fri, 6 Jan 2023 15:05:10 +0000
Message-ID: <c55a0743-5433-205c-f40c-cd296576c0f4@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <90078a83982b37846e9845c8ffc50c92f3be1f47.1673009740.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <90078a83982b37846e9845c8ffc50c92f3be1f47.1673009740.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5713:EE_
x-ms-office365-filtering-correlation-id: c74696c0-0cd2-4e38-82d8-08daeff76814
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +pUFiG13bMbXd6hgK9ZV2vnYmoym7Dw7IDwZJ6gmzWwlWIXP1WnYqmHbDBvdiE0hp7DsPhjJavNE+o+EjIVRgxSHEofVfDRgsuocV51Ojj5MSQjuGxfIik++5kfydTxn324hZBaQcyEdlTWFA4dGpmqtMDVE4mONGoUlSRyXi47VBw5fb/1ipzUGuyxU9UC2ScGMyxgJNoD4lWs40EuyInybSxfdDq3/M9Jsaar2MxJUAcNSfeHYpLGSmSHRiA7gJ3Au1M9L3EDLSyRgnag1tWBMFIauUZW84wThYAyf8/jqffiE7xw5MMafljpQA4PjAAs1bXtx6miTWX8Y6/w1CnJhg3kGrMh6F2KK2vaxoIAP19KD6KaZx+1Jwuq/XkVUOAmLEK9BTD5MpHPFawDbY8iF6u5/4sCEvrl0dzYqTCsqwfv0kOx5L+zU3+LeHOQaVU6SGDdn9wRBmqxwounPL5SMjO7fEbFzFul0gJhSCuaf3e4et0qC9brDXb8a8NjZwNJQfVPBNejz+sEu/5Kq1j5SMB/2W2Iuo9KeEZGNFKCezGx4b7+TFANv8uTsLG17LpC/2CNOH7T8h66RBEnjpdbPJgSGxf/rtpI04Uu23N24VKSenxedYfxsoYXmgzN/jODCkW9Q9nTmSruxq1U009BmkO1k08CpztCmcymwHGYabd9/DMpzLGOVb47aWOXKX6Ke+XsUTKCT0oe8VHZFtceANCE4qUQ6/S30Ob5aQblMKqLvEA2hp6v6qfQ0NWgnUCnfbokPDE0HdkVjn/1mNA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(8936002)(31696002)(86362001)(31686004)(41300700001)(122000001)(6506007)(53546011)(478600001)(38070700005)(6486002)(64756008)(71200400001)(5660300002)(38100700002)(82960400001)(83380400001)(36756003)(26005)(6512007)(316002)(66556008)(4326008)(91956017)(76116006)(8676002)(186003)(66476007)(66446008)(2906002)(110136005)(2616005)(66946007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzR4cDR5Zm8rT2sveGNrcU53N0tFTEp1VTdER3V6RGxuQS9EajJHTDhyOTlj?=
 =?utf-8?B?NUhpWk1paytPamkzbkM2T3ZBM2UrVzdHWWVmaWt1VllTK2VrQ0k2ajV1eSsr?=
 =?utf-8?B?bGVRQXhDSW8rVWt2ZXhIdjhDbnhUZTNxcU9SeFNoY3RmOG93MXpmTmlDdDZI?=
 =?utf-8?B?K1plU0U4YWNObnBlZHg3MlNHNFJEakFsRGZSK3lVOHFBTklSSHZjWkd6UVp3?=
 =?utf-8?B?UWlSL1ZyRUZqRVMvM2ozS1RzWTlNc1FNMTRteVliSDhMUlQ2NVpCelEySHhY?=
 =?utf-8?B?aTBZMHF0OVhwUVE5dzlhSlRqeDJ0OHAzM1V4YndsTGZjeklhZGRZVTBTM0pr?=
 =?utf-8?B?Sk51UWdSZzdtNkVQeEZYb3ZURmVGWTJ3Tmx0ZEltcEl3cStUSE9JUHlXT3Vl?=
 =?utf-8?B?cTVuV2hUYnBSVmN4T01ZelNoUHh2WkgvcnBtb1N2amVHV2dYWEcvSE9PbUh0?=
 =?utf-8?B?MWZic2hFaHVuVDZYcVNDZldKSUtlUVJGNnZ5Wm9HbHlWOTFuek5OT0tZVEFk?=
 =?utf-8?B?UEMwT2Z3b3dtRzlBN0ZIcUNhemI1cXBzQ2JuYzVVN2pqNnMrTzVRemt1aUE1?=
 =?utf-8?B?V2RuQlhPbTBudzhUMUx6a2VOZmJLWS93WVlHejNhaGh0QTVORXBRdVR0ZFVJ?=
 =?utf-8?B?NGthK1JIUWNiNjVMdXJ0cDc2SzMwcmllRHdNWjZtVHl6TEk3aHF0QXJFZFVZ?=
 =?utf-8?B?LzVOYTJXV0R0SXNHSVJvMGZERGNIdmZzcytPZXg5Wm90OFo5RlRFODNlYm1K?=
 =?utf-8?B?L2lmV0laR0tKMWdRZW9Od05XT1BjZVloZGVvWjdIamJOakZTZ0QrY2JrWWhJ?=
 =?utf-8?B?d3BkN0VEejhuclhadysrakhFV3VhUmxOOWYzcnJEREFzZ1pNOGRqM00xQUFL?=
 =?utf-8?B?Y2tFN1NLdXVvMDR2YmRiVnN6NXJpS0NSL1ZkdEJqZmpZMUpodWlhUkFLc0Y1?=
 =?utf-8?B?ZTl3MWh1K1ZjckNQazVXSThkNzNSUnIrVG9ZSlBYNkV5VXJwN0FFYk81VzNt?=
 =?utf-8?B?cDl1Q200UzVSZGsrUjFTdm1rcTJGTzhab3dUMTcyS242S0FMMDBad3NFdENR?=
 =?utf-8?B?SThjQVVHL3hETnNDMU1sQ1ZFTkc0UlJGWHNXYU5QK3kzZ2dTczFYeHpyT0pi?=
 =?utf-8?B?MFhUREk3UDlEeFR5QW9yeHMyb3hiVisvNmFhSS9qa1gxMnZGN01lbU5yUTF2?=
 =?utf-8?B?M2NYRkE5RHJmTWRxRmRYang4bjFtbVZQaG1HVmZTMFdNZExJWE54ZFFhMW9W?=
 =?utf-8?B?YzZXbitvNk41WmJKRU5hUk1jODRFa0NvM0RNUUNRdjFxZEVSWXJ0MWtNaTdh?=
 =?utf-8?B?VnlmZll2TnNuaUl5MWZmLzg4MXpLMDkwKzZpNjJhMG0zRFF1WkUvWU5jZFhE?=
 =?utf-8?B?SGVUZXlZVFVRSUVkS0EwdENtNi9oTW1WUUNvazlnMDNTMWh4TGV0R29ORnYy?=
 =?utf-8?B?Qnc2ck91WWJ6L0lmYXBORGlKMUdPRENrbFFVSXdIc2FzVXlTOExSY0VtdGx3?=
 =?utf-8?B?L2tENlUwUW1GTnRjcW9WSnh3ZUNyUUpuVFR6TmRlVm5rbXIzYU9iTithWi9u?=
 =?utf-8?B?TW5hb2xyTCtsdHBEdkZkdUo1bVhKdVhGTkR3V3JPMFg5QnlUaXZVOUdOTlhw?=
 =?utf-8?B?Q1ZLZXpQYzd5UVY5bUh4QnNHZW1aY3dGa1JWZlVQSEUzcWJPZXVRTE5kNDJT?=
 =?utf-8?B?c2ErM1dETEpVLzFqeHFQYWJpNmNpZXZoWis1Y1ZjMExZTnZXVWgzWUJiSEJP?=
 =?utf-8?B?bDZhVHVqbzJYZjRhZnFFaFJZd2E5UE1VdmVzVnQyZ0pPVnJjVkdVdkhDOExW?=
 =?utf-8?B?TFhmM1FMYjl5N284NXh5a2dQSmpQeWY5QVJxeElITzJiTzgyb2ZQaHdsNWhR?=
 =?utf-8?B?YXNnSnhJTWtpVUxGckxabGlrREM5UFFKcm80Ty9IYWNLTEVncHdMTEVRRDA2?=
 =?utf-8?B?WUJ0U3dLT001UUE5SDR6a0xpWnprbEJBYVhwdTNUeU1DeXJ3cnFxc1lFWjZ5?=
 =?utf-8?B?ZzZEM3VaNWNua2V3eHVsNWZsTnRNc2lKUTBDSS9YM2IyUlkyY1E1cmg1K2Ni?=
 =?utf-8?B?ekt4dEZvS0tIOUpQbXV6Uk5wckUveTBXeW5ZbUdmeUFXVzB3T2oxTFhtWmhJ?=
 =?utf-8?B?UHdpVUh2OVNxRVhzam14N0MzYWZBa2l4c0Z6N3BDa3IvMmNVWjBpR3JQNjZ6?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BF3244BACA46F41A9BDC56E5F1021AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZLBDK3RI+Iyn3SMPH/NpdUYlyHEARYJ208Y7xZfzziH3Gda7EimquiZTOE4Nq+bI3m11UcqaWFqr5fD3zrgxYf+ilinTpzqcZ4cKOYDPZJG7Wc/GRX808zCa8DR1O72Y7Ce5S9XHheApMiICiwl1BMNdt/rodGeGMYs5S8Y7U5osqM0DR9TF46CtiD/xoAw9OUMMZzoGoMWINPyAymiUQnPWRzGllIdu1SMAokN6UJ5c9OGKl+GN65wRD1aOnkFLS9rh9ZeTn0F75ZAkibQlov3cUaA7sW9tuQqih5G0ZTCokKH1uc0ZEQM67/1B8EcNJYZ+fwio87Imy45Ni5I5oBcDvDrZPgRa0TsXUFFmkhoJsOpx0bI7RcjLvXdJzDFxr/HJAeCkI2UgvWROPGUY9+qrhm3aOAj4DzPBR01wi+vxUfvouUg7IHFy6KWtUPN8l6GZG2DouMY+bK6loNan0YmfB2GZ3ivOwlq2ufSYOx5GrurxcLGF6vKnUSyldpKzVMVokojH26uZk90AvmB5rYatmHDATQ5BYTR8ZmACyqnUHBeCn9f5Gjkn0nAQgoSmB/g/fqoU7K8gOw7LGkFdWvzI5EC93bxTMEnjnx+YQ/B1BgwqGWFupMZYcBOtAarIhQnxnA/gsOSiuvf/koJevTv6rwALxZ84u62vQy+mDJO1lIGGpS111R7f7efujGqzjW0eIq3sAvvFI2fgTDhaFuZvImVB3fir/Ep7VxsHyIs7fgoUNJmFvXv2nDFrhBYlkEx4D5pq8Y52KfQA0hLomKaxNZy2NlrJ1DfMtI+2jIJSPl8sUOmGNDiyn2Izw6vy5+duCgNXz9YpaMZL5iPn9q8wV0gHxPxGvb+jyvWRU1Ni9GbZNH9j2VePAc2Vz2RIBMuxjHetRyfHHkSyf+y6dQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74696c0-0cd2-4e38-82d8-08daeff76814
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 15:05:10.7856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJNFylVQzLs1MiBSYW3d/41lueGCMi+lSoOgQRrQvnWdcVePNIRQRctq5A+u8crvs9nfDwxz0v0Xr3CPV6WFHS3EjTiwU2If6rrkogEJlzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5713

T24gMDYvMDEvMjAyMyAxOjE0IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBBZGQgY2hl
Y2sgaWYgdGhlcmUgaXMgYSBtZXNzYWdlICdIZWxsbyBmcm9tIEMgZW52JyBwcmVzZW50cw0KPiBp
biBsb2cgZmlsZSB0byBiZSBzdXJlIHRoYXQgc3RhY2sgaXMgc2V0IGFuZCBDIHBhcnQgb2YgZWFy
bHkgcHJpbnRrDQo+IGlzIHdvcmtpbmcuDQo+DQo+IEFsc28gcWVtdS1zeXN0ZW0tcmlzY3Ygd2Fz
IGFkZGVkIHRvIHJpc2N2NjQuZG9ja2VyZmlsZSBhcyBpdCBpcw0KPiByZXF1aXJlZCBmb3IgUklT
Qy1WIHNtb2tlIHRlc3QuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9s
ZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KPiAtLS0NCj4gIGF1dG9tYXRpb24vYnVpbGQvYXJj
aGxpbnV4L3Jpc2N2NjQuZG9ja2VyZmlsZSB8ICAzICsrLQ0KPiAgYXV0b21hdGlvbi9zY3JpcHRz
L3FlbXUtc21va2UtcmlzY3Y2NC5zaCAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVh
dGUgbW9kZSAxMDA3NTUgYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUtc21va2UtcmlzY3Y2NC5zaA0K
DQpMb29raW5nIHRocm91Z2ggdGhlIGVudGlyZSBzZXJpZXMsIGFyZW4ndCB3ZSBtaXNzaW5nIGEg
aHVuayB0byB0ZXN0LnltbA0KdG8gd2lyZSB1cCB0aGUgc21va2UgdGVzdD8NCg0KSXQgd2FudHMg
dG8gbGl2ZSBpbiB0aGlzIHBhdGNoIGFsb25nIHdpdGggdGhlIGludHJvZHVjdGlvbiBvZg0KcWVt
dS1zbW9rZS1yaXNjdjY0LnNoDQoNCkhvd2V2ZXIsIHRoZSBtb2RpZmljYXRpb24gdG8gdGhlIGRv
Y2tlcmZpbGUgd2FudCBicmVha2luZyBvdXQgYW5kDQpzdWJtaXR0ZWQgc2VwYXJhdGVseS7CoCBJ
dCB3aWxsIGludm9sdmUgcmVidWlsZGluZyBhbmQgcmVkZXBsb3lpbmcgdGhlDQpjb250YWluZXIs
IHdoaWNoIGlzIGEpIGZpbmUgdG8gZG8gc2VwYXJhdGVseSwgYW5kIGIpIGEgbmVjZXNzYXJ5DQpw
cmVyZXF1aXNpdGUgZm9yIGFueW9uZSBlbHNlIHRvIHRha2UgdGhpcyBzZXJpZXMgYW5kIHRlc3Qg
aXQuDQoNCn5BbmRyZXcNCg==

