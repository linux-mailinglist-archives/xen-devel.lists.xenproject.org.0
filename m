Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C46615F18
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435700.689394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9mT-0007SO-R4; Wed, 02 Nov 2022 09:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435700.689394; Wed, 02 Nov 2022 09:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9mT-0007Qc-Km; Wed, 02 Nov 2022 09:11:29 +0000
Received: by outflank-mailman (input) for mailman id 435700;
 Wed, 02 Nov 2022 09:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Od+H=3C=citrix.com=prvs=2980fda49=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1oq9mS-0007QQ-40
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:11:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5278ab42-5a8e-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 10:11:25 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 05:11:18 -0400
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 SJ0PR03MB5774.namprd03.prod.outlook.com (2603:10b6:a03:2da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 09:11:17 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::5de3:b6a7:8935:2731]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::5de3:b6a7:8935:2731%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:11:16 +0000
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
X-Inumbo-ID: 5278ab42-5a8e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667380284;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=L/h6dsfgncYhEPqHTBICIMVOyM5d4zj+ofmNBj6XvEY=;
  b=clEpTpUR0IyHCs/rWBTZ35ifopMPsQHwSxxKiQTyFHDj4fXZys0FfL9N
   DHL67jfWMgL+m+CI/HqWeV9DNWvVK1N5evAdROZ2yx11zzXb6saqmHO+q
   0g4GlsjAQi+J4tNesoXzyvSxsZ/HaaaDPpCXCnPK8AZnCNVnsBOWOLP3C
   o=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 86522324
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JpXY0avRyJRX0UgEtn5JFfJngufnVHRfMUV32f8akzHdYApBsoF/q
 tZmKTqCOq3cNDGne953aITi9xlU65LXn9I3TABpq3pgH3wV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5Vv0gnRkPaoR5QaGzSFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcSoGNzqqnMiM3LODbbF+tpx7ItWxBdZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Tp
 njH5Hj4CxdcMN2ZxTuK2nmtmvXOjWXwX4d6+LiQpqA32gfInDB75Bs+X1GphPCymkiHW4x+A
 RM40TI2jKEU+xn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 lOAgd7BHzFkt7yRD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ5iELJR9M6Saqt1ISrSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:4ieTfaNj/MLa0MBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+75xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa33ZdMRIZ4JEuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw5zvmWehTNYd3E8LAv27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="86522324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=be9V4yJeuumd5sM0UBVHvlNdCM35FVq+Zwyd298d/NUhjRTa1QxMNs5pmg6iJN7KA7qLDPHOv97FWfLHIds7aNG6+kt4BfcbaLMJfTSfD/xrrw0fc6CmIp0HkxVWOHOy6zB0wEtJv2YvwRc7n0wQaFoq+mB3fmmoZl5YL0HTU1VZSTOKZF1YBi7UnKL+1h3kIkLRc0kUWMpa1MJm8aYq7tVYHMFKnJO7OeGoMRWcEYlnqtGJ7fhuVgsf4ob2vpb6lASUfYNd/+TeC6igP4KLrbBNhc0AcXoXdxTSoVHhH5xCy+pkq/zXr9tZAGyYjzpolZrSCVtVl0gbGljhq5UQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/h6dsfgncYhEPqHTBICIMVOyM5d4zj+ofmNBj6XvEY=;
 b=iw/CfGDxJSm6XoOIzcgqTda5cRKId1aEeU56dR2n1EqnIOukM4A1oYdoiisvTwncN9oaAiOfLUm1mM2Vw0sgSxpTih8SeVHbDfY/DzNHCd1JCvlDFLUkbpAnl1x0Y7XGDHpM+GY8YTFKujJXxsFTjMvOwV91rk6QrQ3K5R/4Ax7viPgqT6MVhMdP+WfZlROXHKyT3JRRfqr/j+hff+U3HSeXq9LpQTOOMXEg8bmW8ayxPe36MBrpK0TVRlZeGBPVtODk5D0CXERWjGhJNYXR7ERCO+ME1JV26oWjH8M8t95KB6T5Mw/3Uaenvvz9FQFz/Aa3GtjJStslyoZswNonUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/h6dsfgncYhEPqHTBICIMVOyM5d4zj+ofmNBj6XvEY=;
 b=cS55c0dr3PJ5yFZHyGL30jRUt4gN9qceit+xqhhCM0Fsayn8cBDwMwePQ13k4d6kHea6IKqE2MS89mv1qiOvUjN9ZbAOP9HLpnb1cB8Gdcxr7JPMnGOCc4HEryOddxbK1ZAf2yCAmBuib/Md3JPZQ2FldbFFfWVz8aap1LwHnmc=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Pau Ruiz Safont
	<pau.safont@citrix.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of
 domain_getinfolist
Thread-Topic: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of
 domain_getinfolist
Thread-Index: AQHY7hu7nGK02b4G20+MH2/c4dYgF64rWegA
Date: Wed, 2 Nov 2022 09:11:16 +0000
Message-ID: <1FD039A8-AE3A-4D6E-A2E9-F446FD6653DD@citrix.com>
References: <cover.1667324874.git.edvin.torok@citrix.com>
In-Reply-To: <cover.1667324874.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|SJ0PR03MB5774:EE_
x-ms-office365-filtering-correlation-id: f4a3a856-a739-4791-3cf9-08dabcb232c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 K1qYkwn/HeULkS/vDm+2be33TxcMbVli1wZLbGwO43daMLExiLdI8zsgDjnXkayKqPXxLDazk64W8KZ2AVyra78T+jQYqzuj0Y5Q6M3YmwoAxo65Jdg2RdEuLQE2No02esOUN9bXCFEVObVlPgci732ufce7l97lpaCXU1X5S8lyZTexnx0M2i2hWsFpm+baj0OX/qcQDI1s8FuK/Db+9HPnuK0gvnVS1Zez1Bz9OcgMdBtIkmRaBBA6IoPX+RYdpkngy2O8gsA+FYbmUk/N/VGYUyhnXgRmZBROVWjhfc6HBy8i7OhBBi522Ls9pVpsFxTY6dpZ3bDV49/q+u5XDfa8FnM7tGkCbrxEIGXEeX91xnG7AiXAqg3G1g3/Gna4Xlzr+IGLMryBwFIVSYvQY9hUiE8mx56ScVu9Akn1ctYrnY228tW6+BxfT/xKUQsmdZ2C2JcaTPXMdr0QbjFQgYM4ENN8CoaSo8cQNbZvoeMszbmvxhnk5lQ2Sh5zSWolPw+RIDSWuHyymTGrOlaaTkFp80KSvn3CKfMLDbYbU8PlTf+xXfNMgsBIvbTtms+haf3bjqqsqsXE7POA13AbFo31ZKkjeN1wX0C58bHa1mimQmwsYxN91ZWrSiRKGaGzlCDrBNDjGaSU//mvMHgqXABpED6Eotu1Y+eCSxloLk5xYjP7WrmusASlePhatJN5EiN8BoeufNzEcF8YxvUQrOMvSfjQXYAGOg8GtGzMdEi+/nBc5qEqFDPUvnbEVuujNM6+HYf3yNcxurkQodXBe9+ORpTyJK4o72FT6v+QJaY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(6636002)(37006003)(54906003)(478600001)(107886003)(186003)(44832011)(6506007)(66476007)(66556008)(66946007)(6486002)(76116006)(8676002)(53546011)(71200400001)(91956017)(41300700001)(6512007)(26005)(2906002)(6862004)(5660300002)(8936002)(66574015)(66446008)(83380400001)(4326008)(38070700005)(33656002)(38100700002)(122000001)(316002)(64756008)(2616005)(36756003)(86362001)(4744005)(82960400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDhQb2x6U0FCcU5aSVJVVE5MZkRVcUFWTGxNcmxSRUFSSS8yL3JFRHk4MkZ6?=
 =?utf-8?B?WVFTOW5nWkZLOUFaYUNwbk9iUW00RmFDYkM4U3JjazJxcm9mdVNZRTN5UFBx?=
 =?utf-8?B?QjNZRzdHaXQ3ejNKZ2NjK3BXdkpBZittVjZ5WjlwY0FBRWNtNFpqTU0zN0x6?=
 =?utf-8?B?ektMaHQ5UGs5Z2Z3Y1h4ckRZelhaK3pRamVNbEQxdVVOcWVhWFkxbSs0bXBw?=
 =?utf-8?B?MUUxazFyMGxJWk9oR3h1dk9PalhDNUlKMDJaWXE5QzZrbHZNQk5McEFNS3JM?=
 =?utf-8?B?bC9UaExhOW1UZHloUGt0aWJIRjl2TVBiVXRqd0hWMEw3bENzZ2VTVUQ3RnV6?=
 =?utf-8?B?Mit4WkNmYnNGTWd3N3MxVHk3eC9Ob1RqUHF6VTBHY0IxV3NMRDVVWVIrMllZ?=
 =?utf-8?B?UnNGbEFWbUxDRnA4YmdSVzlmMGlPL201VFVUbG9tL01kTEFNMUpDdTE1bGFO?=
 =?utf-8?B?elQ4b0pZcG03bmJJM2VaeGRYbFRGMlZIRnlIYWhZNi9xcWNkZ2JOSGNPQWlO?=
 =?utf-8?B?TDNMSjhESnRxQy9Qbi9lRkpJVnhWSW1veHJsaC83LzhXdjBkWm1Td2pabjhB?=
 =?utf-8?B?dE5ZNEhqZ1l6L3luMkIxUUxUMU5HcWN4bjhVK2ltNjljMTBldUdyUWtwRy9S?=
 =?utf-8?B?dlFWSTArMnJSQll1VGFNZXhvQjF3eC8yYTZZZC9QY2NrZEM1TjFtMzdsLy9X?=
 =?utf-8?B?dzBUR0N2M2lXeDNaQnB2N0w3Y1RsbElvNTUvaFJQU2g4RFdmN0d6ek1SNzBK?=
 =?utf-8?B?TlRsTlNzeURqa3ZxVXVGOEZhMHFMUVdYajFNNXVmcE9QWDVIUHlkY05kMkFQ?=
 =?utf-8?B?dU5obXF6eDQxSHB0eWxjRFF2Tk9XTGF1VElKRUlFK044aHZ6RzVBd3lFZHFG?=
 =?utf-8?B?WnVkNE5lVjFzcG1mZjd6L2hPR2VJZ0ZTMDRLR3Zldm81MDVrVDJyRjZZWUxK?=
 =?utf-8?B?YmVQMFN1UzNCeDlFbW8xZ2xSL3JCaUZwMU5JdEJVelZNRXZDL2NpM1hsdS9U?=
 =?utf-8?B?WmhQR1ZJdkk2RnVVSmJ3NERTa2oxQTFqRUhQWGhBOU80TU9IQnk5ZExVRkc4?=
 =?utf-8?B?Q1VGTE5WYWUvcXpCZW84THhTVGZPRzVpOXYzdjNMcWxTRXFYTnk5aHRBOHll?=
 =?utf-8?B?eEpQNU9UWi9HZ3RpNHBVYUpGamNUbGVVQlh3dm5YWlRMWnFHc3cxTER3am9F?=
 =?utf-8?B?cTMrb1NVNHpHWU44OCtMTHhwVGZnQ0svczJBL3BCWXJNZ3djN0Eybk4wd2Jk?=
 =?utf-8?B?QnRhK2JPTG9lTzR4VS91NGRzVVdYZGZFUU1QaGlIeS95V3RUSHF2VnhGUm9P?=
 =?utf-8?B?Uk53UTJkblVQQVMyTjFOd3pEdmNtektPcC96b2ovckhZUmFUaGhVZWJLTks2?=
 =?utf-8?B?emluNzFOT2hham1CQ0MrMXN5ZVpmN0NpRG1zbzVxM2J2Qk1TUWRPOGVEL2lo?=
 =?utf-8?B?UElheTQwSkR3dmcrMDVSUjdqNTk3YzlQTzlQcFVQOVgyYVZDNkVFZWpGOTd4?=
 =?utf-8?B?R3Z4MHNuVDVpTTlNcUxLRGVpYk1XUkxpdE5XNGlML0VCbVJXNU94dmZxMmI1?=
 =?utf-8?B?YnJUU05PdFVPb0FjZWdjUHlBbi9EblVMcklGYTJ3V21pVDhkSC9zcUtCdkdz?=
 =?utf-8?B?NkM2MzJyaDRLVnBMTkZHeVVNWTEvOGxJZWticzFzWWdOVHo1MDFLcjNvaWtr?=
 =?utf-8?B?TVpUeEhsUS91bGZoc0MzejZsaWVsakJqdk16blVQSEJYZTRHUEl3b3c4VVl0?=
 =?utf-8?B?R3FIaDBIVjBxK0R2elNzVjJLbG1DTUtJbWhpaCtQS0dUcWZNcmpTTWlqQVNM?=
 =?utf-8?B?dW5yQ09xaVk4SE5KQW1BTjNDM2swSkFjM3J1WlBOTzlQcG51MkdRMjNNSnFT?=
 =?utf-8?B?L0hiQ3QxZ3pvR00yVUUwdjJ0cjhoQzRhZm1lY042R0p4SmxhK21EdE42U2JG?=
 =?utf-8?B?N2JoamFZRjdHcjY0NWRIaXB4Yy9YR0NWeW5PVHNPaXpSZTNFNDBhei91dW5q?=
 =?utf-8?B?cERhMFNodVE0TXIzbFpHWW44RzZZamx4REdzZlJZUjRLUWlIWVVnRW5qZWJy?=
 =?utf-8?B?SkYxTnpMaDB2aGxUZ2VDNlh4b2pBZVZyckJUT0tkdmRUdzVndHdYWVoyL1Jh?=
 =?utf-8?B?ZFhKUjhEdFVoazBCclltdnVScmliN2QwRzIvTjhwNkNuYzI2TmdJNVkvTndz?=
 =?utf-8?Q?5A5/aZwkxuIrvAbuNyD2QaQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19CDF95DD54768499DE4E51DBE5FD219@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a3a856-a739-4791-3cf9-08dabcb232c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:11:16.7759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UwoQKYD5erEDEeZWwJo1Q785TqYMB4m2g6p5Q7H0QhU73A3OYKCYqbF7ewCWowQo6HSYcGkFv40cBMJJbTznRPBpQOhyUkWNyD/XRLVo6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5774

DQoNCj4gT24gMSBOb3YgMjAyMiwgYXQgMTc6NTksIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IEVkd2luIFTDtnLDtmsgKDIpOg0KPiAgeGVu
Y3RybC5tbDogbWFrZSBkb21haW5fZ2V0aW5mb2xpc3QgdGFpbCByZWN1cnNpdmUNCj4gIHhlbmN0
cmw6IHVzZSBsYXJnZXIgY2h1bmtzaXplIGluIGRvbWFpbl9nZXRpbmZvbGlzdA0KPiANCj4gdG9v
bHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sIHwgMjUgKysrKysrKysrKysrKysrKysrLS0tLS0t
LQ0KPiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCg0K
QWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4N
Cg0KDQo+IEl0IHdhcyBjYWxsaW5nIHRoZSBYZW4gZG9tYWluZm9saXN0IGh5cGVyY2FsbCBOLzIg
dGltZXMuDQo+IE9wdGltaXplIHRoaXMgc3VjaCB0aGF0IGl0IGlzIGNhbGxlZCBhdCBtb3N0IDIg
dGltZXMgZHVyaW5nIG5vcm1hbCB1c2UuDQo+IA0KPiBJbXBsZW1lbnQgYSB0YWlsIHJlY3Vyc2l2
ZSBgcmV2X2NvbmNhdGAgZXF1aXZhbGVudCB0byBgY29uY2F0IHw+IHJldmAsDQo+IGFuZCB1c2Ug
aXQgaW5zdGVhZCBvZiBjYWxsaW5nIGBAYCBtdWx0aXBsZSB0aW1lcy4NCg0KQXJlIHRoZXJlIGFu
eSBhc3N1cmFuY2VzIGFib3V0IHRoZSBvcmRlciBpbiBlbGVtZW50cyByZXR1cm5lZCBieSBkb21h
aW5fZ2V0aW5mb2xpc3Q/IEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBjaGFuZ2UgbWFpbnRhaW5zIHRo
ZSBjdXJyZW50IGJlaGF2aW91ciBidXQgYXJlIHdlIGV2ZW4gcmVxdWlyZWQgdG8gbWFpbnRhaW4g
dGhhdCBvcmRlcj8gQmVjYXVzZSBvdGhlcndpc2Ugd2UgY291bGQgcmV0dXJuIHRoZSByZXZlcnNl
IGxpc3QgYW5kIHNhdmUgbW9yZSB3b3JrLg0KDQrigJQgQw0KDQoNCg==

