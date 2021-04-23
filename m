Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D363368F9E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116000.221362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsM9-0002UE-Mm; Fri, 23 Apr 2021 09:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116000.221362; Fri, 23 Apr 2021 09:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsM9-0002TZ-JW; Fri, 23 Apr 2021 09:44:13 +0000
Received: by outflank-mailman (input) for mailman id 116000;
 Fri, 23 Apr 2021 09:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZsM7-0002RM-5t
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:44:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e2f2cae-99f2-4e0e-9e15-180bf96a0170;
 Fri, 23 Apr 2021 09:44:08 +0000 (UTC)
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
X-Inumbo-ID: 9e2f2cae-99f2-4e0e-9e15-180bf96a0170
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619171048;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=vEvV5Q91olLLSbwmXuAaRzs+3PgLT6WJnyn61OluzhM=;
  b=V7HqBVtShtzKUqJ+vG8vDjM4YSKpnrWzsA7syG2YQIgCjUUsF9gnInQ9
   YiueVy9Y7QLpZh7CU1aURgYH8qS9IQUx8zLXPmvXhuPLE0IabSFLPGvdx
   3sLIE+bw7OXNpfZkrinwbDi4ak56fMBIxm6YAQKrAgbzUgbtwSntWpXbg
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JsCLUEwg+2eE0WHFD765R4ps49tWBaYJ/FJIKWaxzDByBNYyg6yK6/ZSYt8UzUzv5d0kcitCJ6
 kc2+QGUd3oRCAf4hDLQNKZX8nCxEtsL+HqBTy7byxUpO8SGqWOGlEejS47RP2r1bylX6/1wVBP
 YRoJJ1K7gDwsgvZNH033eu0KucMgSbU4XXPqcRRYyiea4VUI3BacWChzIcAocFC/E3uhhTHCLr
 X0ZDIZ0QeQ5iKvD+695Q2NQScb4aSym2QGe1HZ/K+1HEWveuRF66X3Y7NkgezNStmmbvAjRmeJ
 yEw=
X-SBRS: 5.2
X-MesageID: 42379893
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+5Q4f6v8bo7E526BSTJCv2vc7skCkoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue77q7OSxgAGhIh9U2ynSqlgYSKaCSw8zU/d3d0wbkk+X
 XYiACR3Muemtyy1xO07R600714g93ko+EzZvCkrugwBnHShh2zZIJnMofywgwdhO208l4lnJ
 3tjn4bTr1OwkjcdG20vhfhsjOIuF1Fiw6AuC+lqEDuvNDjQ3YCA9dB7LgpDSfx0VYqv913zc
 twrgWknqdQZCmw+RjV1pzjUhFnkVeMunwykeIfpGw3a/pjVJZh6aMY509bC5EGAWbT750mCv
 BnCIXm6O9Rak7yVQGSgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i28V3tYWkHss/I80IqM0qt
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOCl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wj9uhuo7xC/pHsTrviNiOODHo0ldG7nvkZCsrHH9
 mpPpZ7BOLiMHvOFY5F0xaWYegTFVAuFOku/vorUVOHpczGbqfwsPbATfrVLL3xVRYoM1mPQU
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dez/9+gXw44dC51UvmEu+BaEz/DODQcHnr09fU
 N4Lr+iuLi8v3OK8WHB6HgsHRZBEEBP4vHFX2lRrQEHd2P4GIxz9+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQFENKoMmWTilMJv3KUR5IgmqmOjP2VO68QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fTk6m/tYcVA+vebtF4pw+uLadv2DfinHTZgftqamoQXjaoX8LSpQo1XTJbim
 d89LIljKOalSyiLnY+h+oEIERBAV7ncY5uPUCgXsF5i7rrcAZ/QSOxiTuWhwoaV0Dq+08R71
 aRZBG8SLXuOB5wq3pY2qHl/BdIbW2bZVt3cW0/m5Z6D376tnF61vKraqK/33CKUEYLxvgQPV
 j+EH8vCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N57UwXGgJeSz5NU7Ns4R2KwgEt/gsuUGC7
 3CPyCUKS71EOMv1Ui+oG0/NCx9tXkjlrfJ1XTenRqF9U96JcCXBlJsA4w/CZW7yUPPQv6Typ
 V3jd4vp4KLQxPMQ+/D7ZuSViJJLxPYnHW/QO4po61FpK5ajsoBI7DrFR/zkExd1BowLM3IhF
 oTbaRy7rfGIJJudaUpCldk12tssNyOKUcx2zaGetMWTBUIj3XBOcmO7KeNgb0zAleZrA+YAy
 jWzwRtu9PEVTCEz7gUFuYZJnlXclE17DBH8PmZf4PdTCWseOcrxivwDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27A4z/r1AELVZ5mwiKAWsO9AAWFBO5O/ZibAD2389aXyf/2qiz2Rzu9Y1kfnq
 tfeyUrH4N+tgU=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42379893"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPfcXgrhUzH9OjG9NubMB84zY/mxut9G6xk628hXUm53AiJrDIyYvHT+x0TrC1mdO+27gOko6C0C2HPyKnf3SJhmvf0vWDDfkTlRbK5gNNWmz60pl5YqcJp85VX5dns2CdTr1Sf2n//PxWKBQfswbdd4LNWtBcTGyIGVNRJemWUKVbhyT3aVaAwSBY0mwIk0M1598smbnLTzRWR3FWCfzdtfqbCb2+iq5ICaLmKXMQLWPgd8YLxXDiA4hsQXlUa4SBfKbcQxcPdb1io62lWdRnmtYWX5s7Q8VL+PtRU0mIqwy2iyVIVopt70kVwltM2h93Fob+FnlO3b9Ea1oK5Klg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhaDW6e0+dRbO1CeFbpdh34+OJp3prEs6XLckNbHW5Q=;
 b=AlZjcZxrLhRxlq9MSfnmABeFDfAay77poemmcX8wkmt3IH8UbjNOE7P2aHbW/RK0l5+EOt68cXQRsK1S9mcMC//LxXSD+qmI9XJWnHZl6KoKvyJiir1d0Mv+79Uu+sB1vAl7t6gTN4tn/sHykmUIrQhP30xgyb2+3hfCT639y7GGJuj1Fne+TmevqocZHrBer3MPi2P2v2HRZGfsh/DyUm1Q9tm/4cu59OREoOTWVUsHzYCeL2YTU4sa4tIyOH/L//HHbGXq2UGk/Jkvm7obj0C/f5ojnW6Idxl+p47CKBw63pgpXrX+RX6odyHntAhW6AQZnyNbxcHMZ+N+D7LP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhaDW6e0+dRbO1CeFbpdh34+OJp3prEs6XLckNbHW5Q=;
 b=vI6lRvsMsHRtF40rQjXONPT4iEQpDs12hkE/BqqSMIHP4v9Ej217qLAw9FM4nhbACLgXzsJGdS7X5BOGREQM7LhIikstoMW0qJRfWAuDmH/kSZmP1N2jks0QvK5vn2bsT8QAapCVXzQYYktkZvULa/P5H0m/+WyUzlrV2SNyHlc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86/clang: build fixes
Date: Fri, 23 Apr 2021 11:43:41 +0200
Message-ID: <20210423094343.5850-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd8c8a4-e09a-4328-4de4-08d9063c54f6
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB559189D667E58788519E90D18F459@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBBUKwzE1FfmL5EjgEXH68VFGgSYIRg9vSCUQW4ZKupqfhggUbq1pSUjeTL+Lf0ihMQyx36/ojXnVB+dlkAvHXTX00RMVpiSG8z1SsOxnS4OiM4hifXzXbv6mTl+S8b9BBxZl2Q/oi0BDd/puFd3/1caamSxAJ+pQ6iLQpqmWTWRzmeDnuJSwk2YiWJw0mPsj+MhxK9G1EORbZkUdl7egolDLGwIaJZ9j0o12nSlNW0/37s2PCKb3fDz8AcUwM92UgXw26T9Yh0rgoiMXXvOXDhMGBJjJzzp/MVSBl2jf7Cvdf8GTsbEibKTpdY5S+kXOCJmmJ09XXaroqKjNFRXnsSfTqSnJkEUMuR906OuRa2dyNHxfwvWp5T/dAkMVdZX7SDp8t8LMVQCWhH/wRZkWVpi/ZXQVznshYo3C/UUmqkXhFZ4Xo1SPK+3n8XLhGJMM3OKRdg46ZZ3wus3bcLfN0OyoTQy9vGoOz+fxG5tKRufM5wLlhQPST2tur71K3A4OgIREhn6NUm/yjeDovJ5OHza/yOLxqqJf7Vjoexsn+ZjIFfiYuABdNtrZjXxkZoxe4PSQZ5HGvrDjz443/WaIWVs/EE+0aFGAI6QTj8Uu1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(2906002)(2616005)(26005)(66556008)(66476007)(16526019)(186003)(956004)(38100700002)(4326008)(316002)(6496006)(8936002)(478600001)(54906003)(66946007)(86362001)(6666004)(4744005)(8676002)(1076003)(6486002)(83380400001)(36756003)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3FJTE9oZnZseXJReW9SdUlYM2drcFJmNm9xWDk0MkgzTGNjL0NKV3hNKyt2?=
 =?utf-8?B?Ri93OTdvRFMzWVpCYUViMnBWWWk2eUlRNjBWVS9HaGlHTGZtem1lOTBDNzgx?=
 =?utf-8?B?UG1oMFhoalFNZFlHOG1peCtFbnlsaENDU0VzZStJT0N5dnVUUGdTSGE3Q0Vw?=
 =?utf-8?B?MGxrQWVqNHV1L0tNYmhja3RIM2RuSnpaQVA2S2J2dVdHTHRKNUJuTlltZzNI?=
 =?utf-8?B?cDhhWVFKU2RaRTBadUs5ZnVvTDY4UVZZd1R6NXRRdTRRWFkxWUt6b29VRmdr?=
 =?utf-8?B?N21NbytqSG9TSmM1d0Q1K2RwaHpUUU1mTHJhQmhuaC9ib3EwV2NmL2tjTnZr?=
 =?utf-8?B?WlI4UWpkaHFCeVVnbWc2cGtaRE9lOSs2OVJON25aUTlPVmppWUVSNDhWSVAy?=
 =?utf-8?B?S0h4eGFZRG1lWkl4MlNwc0FKQ3Fxam1idURpMXRFVG91YVNKVDRKU2h5eHIz?=
 =?utf-8?B?OEVKdlo4UE96eFhKd0dibzVYeVFmTmd0eUVGNVRKQlVoUU1IcW4zdVBYU0ZC?=
 =?utf-8?B?Wmtlb2YrcXhlZnoyeWpxQ3JyVEFHczdtcExMb3ZXQVhINFkrVHJzTG4zMUx5?=
 =?utf-8?B?bCtpTkV6VXFranJtYUttenNPc2VaT0VFUlVvSUNYQjV3bk01NDV3anF1RFNE?=
 =?utf-8?B?dHRqZDF3bHF1SEZ1T0pTRzBZVUs4SHZUZUtpTFFMNDRRYUp2elpoSmRpbitL?=
 =?utf-8?B?OTU4eDV1R2tCcEZvSUtSeGFMaXhaUytFcnd5OVhydjAwUVNaUGdwYkJLaSt6?=
 =?utf-8?B?QVFUOHhVVVFMSmVvaklJVWFaVHpKYm04ZWJBaitubUk5MjJRZGVaYUlEMWpH?=
 =?utf-8?B?ZERoTHpYeGErekNXd3VwenNic1hoM2pOZHZhYTJzUFMvOWpuSXdWejdQRGNm?=
 =?utf-8?B?NEJjQ1RwWjgrL1lXaFRrbG1oN0M2N2tsN0o2bVFTNzZVMzg5MWI0WXljTElm?=
 =?utf-8?B?TVp4UGZvcjBpNTJEUUJiNXdEY2cvcjNHM1Mxc0JsWWFvbmpybm1IRGlxQVdL?=
 =?utf-8?B?L1ZxUkZwZHhrVmdhSGRFUzJ1TGxIVzQwWFljbGlrUnVWQzFKTFlCSWhPS1Mr?=
 =?utf-8?B?S3ZITlFTdDBUdk9UUDY4ZUxOeThENytTdjNXMHZSbUpOMmlQbUFPZjBQNzlq?=
 =?utf-8?B?bTVTeEJTQWM4ek45WDdMMTY2ZkRMcllXSmY1MHFxRGZObVFPbmlXRWNDd2wv?=
 =?utf-8?B?ZmNyQzF1TDFzU1Z1VTRvb2l4Vll5OU1pSVdNSktHNlRBQ2lRUGt4cWE2Vkhx?=
 =?utf-8?B?K3VXZGFRWm1YODQyUlJiazVZaXpOZHlFZE05YzdTYWFiS2dlellMT1QxeXZC?=
 =?utf-8?B?NGJWTERxbGJ1RWtsZEtkZVVCbVdrajFnMGNBUnhBblMzeDZEbTBqb2JXSGll?=
 =?utf-8?B?Q1Q1aDBuR2RPcXdudGQvMUlYR241Nlo3RE9tbDlBV3BLME83NTR4MFF2K05R?=
 =?utf-8?B?ZTFqOStZSUdENDF6N3MwNjRIL1Q3SUowV1Q2ZFdFSUFqL3J3TUtkdm50OVJO?=
 =?utf-8?B?djBoUVd5M2lRQmZFa2FUQnhwSlRieHhQZGlwVkVaSVNaeUlwajh0Wm1sWk1m?=
 =?utf-8?B?eUsvM0dmY21tWHB3THZWZHFoK3NiZkhZOVk4YlQ5TXhLZEVlM3ZpejlrRWhX?=
 =?utf-8?B?aHNjclRGeFptdWpGM1NiNXJ2RnVZdTNvSjZGNWcrOXBCeCtYV28wcFBwcHVP?=
 =?utf-8?B?d1duNmxYWlo0bm04T2JDa3E5QjAzWnp6ZmVnbzU3NGIvZFNJTEZrYWlOWTJU?=
 =?utf-8?Q?styVpz7x5oRHhdMvVuXb6/Xf8Ue2IlExGM0/9mv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acd8c8a4-e09a-4328-4de4-08d9063c54f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:44:04.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCyMPsb3HLurV3+bFhCZVJQv47a2WxzgWSD0nsBPNBtFZXI1ezTTMOFTU6Mh+G2EA9oQ8J+Wq94EOIs9wWmzcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

Hello,

Two clang related build fixes to get the hypervisor building again with
clang without CONFIG_PV32.

Thanks, Roger.

Roger Pau Monne (2):
  x86/oprofile: fix oprofile for clang build
  x86/pv: fix clang build without CONFIG_PV32

 xen/arch/x86/oprofile/backtrace.c |  2 ++
 xen/arch/x86/pv/hypercall.c       | 18 +++++++++---------
 2 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.30.1


