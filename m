Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6297F6A9EE2
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 19:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506163.779212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYADO-0006fG-LO; Fri, 03 Mar 2023 18:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506163.779212; Fri, 03 Mar 2023 18:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYADO-0006dR-IN; Fri, 03 Mar 2023 18:33:10 +0000
Received: by outflank-mailman (input) for mailman id 506163;
 Fri, 03 Mar 2023 18:33:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pYADM-0006dL-Hv
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 18:33:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4a64990-b9f1-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 19:33:04 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 13:33:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5482.namprd03.prod.outlook.com (2603:10b6:806:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 18:32:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 18:32:58 +0000
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
X-Inumbo-ID: d4a64990-b9f1-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677868384;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QBi16lwtbExr4cVOx5opj4w0cXC34EV5pGAclm4uIEw=;
  b=OhVlbFcihpwVsirXS4PGzFq85GXIiZh6MDZ5jiMK397F0GW+WZ8fgw/r
   Vo2qyEMuDy4PHQZnPXLIDR4+d7PDqFAOw0SXkirg8TmqBW7vNF2DUbPaz
   x4RiKmGNB2aXV24UkjiTnGbNmTLwo47xUEhRpzZSt/p73InPHY7ari11T
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 99786819
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f5CFxqvOJucIlrye5ZPTDFoFuOfnVHRfMUV32f8akzHdYApBsoF/q
 tZmKT/VP66INDDxKNlwaonk90sG7cXQm4BhT1NoqilhF39H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASGzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKwE/cSiBttyPw6u9dfFHnPwffJjQFdZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzpqa400ATCroAVIEQaDXuXp6a0tmKZR4oYK
 WMLw3UnnYFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ5iELJR9M6Saqt1ISrSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:o8Ye4KkD8QWAWk81vyP3dMU8W7HpDfIR3DAbv31ZSRFFG/GwvM
 ql9c5rsiMc7wx8ZJhAo7+90cy7Kk80mqQa3WB8B9aftWvdyQiVxfBZjbcKqgeIc0eSygc379
 YDT0ERMqyVMXFKyer8/QmkA5IB7bC8gcaVbD7lvhJQcT0=
X-IronPort-AV: E=Sophos;i="5.98,231,1673931600"; 
   d="scan'208";a="99786819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWaZJT2neiL6UpsqCaoYNRklZdBoNlVyQWjcFJd2gB0QokJbQqf08WHWJtkOnd2E11bsoYuka8bRlofHG0JI0BFDxg+WAZLGs74JLSLD9ZibMaT7DoaSqwFmk/GpLUI5Tv8mu23Ot8TrZgvC0dZ4CQt+1okMnj1c4gdAwiKRYllzmik3uV8xu3hMfsoLHF9LflUFJk9oHVrD1ctcpgxTeI2cB/HW6ulkkfaIOHY1kFfXBgcULAbcqATJNTI41Jh+zz7oe6vmRySACQ1J1pPjQeCox6cKdET8p+gtr1M0EdOU1QdD4iSM+9C+JpzlfatuI4ikeduQpxaFfbtXAFz3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT/qFtyL5etcUL4kw9EP+A99YyKOwwvnOc9AHYczEfI=;
 b=g2Qo/eblGiiMC+WmUgC7dzfRxaOydH8SwZSM9oSMvKy0RScUAD/r+dtL7W8XELqLiPgil6aC4tgMQgBb4ybbqwXVijVq+I7S4a5txU/ugb17bDQ1xooBKY3LE9z7mwm7EyRehkZK3WUJwdqpclX5d+nF5dGUDEvU7EDBzxQ6FC/LAWg3dVG6e90hsjvjTpL0FKDWjduJe0RD0JdqGlVJrjlPblC1/KclQvxtX398v7v+KilJy9flVEw/9UoN0RWVsC3PkrFW0SKBqoCX9ceSjjobBj//QPDVYGlA+B3+Hb3fQ2TmIkNPlllugoVe0s/AKU3lqtm7ZpdayptIwAGpKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT/qFtyL5etcUL4kw9EP+A99YyKOwwvnOc9AHYczEfI=;
 b=U/3IiRVmI5i62ku6AKCkRr5a3dxobfYJzCqEf7E25V5c8PJ2U09IBqoBDa3DW3ZL0ho93erD/sqiMTyuaCNmpc6UgyMu1BvaYYezf1Zzqvnvh+ZFZFnzN7BCg5hgzSlBGi96GHia++bnyf11N9Myq/MJsycg4u583CiVUMI7AL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9f47f473-c9e2-5a35-f397-bb6e652354b1@citrix.com>
Date: Fri, 3 Mar 2023 18:32:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
 <20230104111146.2094-2-andrew.cooper3@citrix.com>
 <f62293e3-94f5-005b-dafd-4c9084f5d84b@suse.com>
In-Reply-To: <f62293e3-94f5-005b-dafd-4c9084f5d84b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0244.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: 358f109c-fa89-4575-402b-08db1c15b5f8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ynhSpRO4QX4P4JxS6cBUiuY05sVBWUe8cEK2Fbl0JRltialiqnnWRn3MqLbTppCUlxXsv8AmQPR2VYjBLbiqa8hWrhYAVYN1X9HDxhSuLg84K3YgXn4lEb4U6C9NiVVDhHXMBIlO6aU2Xufnih904ZOsqZ7vgONMgci+QrQ25XsaoA3uO+g90a8GVKalPeKS2WCA3n5Pw6HdNM6zaXJ4bHes2t5o2op+jv0eoihGxgisIbvQ2QHJGu8G6OJ9+3WM3TOwJa4sFygVqTaU/S5EPyi3O143bRjgF0Rt6RbGfw1FXjXIgL/WEoUZLz6OcVxsdiLgdgBUigb8B+Jn1cOLp5nT3POpM9nJJ0/0xKn+yPJvV/T+lBsvvxZQ1BUu/OF9f5wqMtWQy0sp21aREn1cHo595arGFPZVNpG6zETXipO+FFwyp5IvmYr/nUgHNqV1wKJ11AEZNXLatIFPdhyZxtFzeNovOVtinW681qZ3Rlke0N7CHqBBdc7m7EgSS+czjLuCaTrKH3oGBAU51ZIvCBgT7NSIKL44poMz/754JQ2o1Q9maqkhdiPVyDfOajE/1JF3KvRcrv2VBGfT756cUI9uTaihHf3hdkiM6vGE3vvDF+o4SKhHyXXUKC+2nap2X7hjrmKUgBURnHLqExJ9pPOrcktYkmt+/N32cOGo1VlmUe96hFJ5hyuQ3OYpvg32EdPl8F09taZqTCrQxvX1VFVKrc6/Fokut6MfP+1/zbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199018)(478600001)(186003)(8936002)(82960400001)(54906003)(316002)(41300700001)(31696002)(86362001)(38100700002)(36756003)(2616005)(83380400001)(5660300002)(26005)(4326008)(6916009)(66946007)(66476007)(66556008)(6486002)(31686004)(2906002)(8676002)(53546011)(6512007)(6506007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmRHSFJJRnFzSU51SFRPSFBVUlpqWEVmL0RVcUNJQ2FOeFlDbG42aVlkTnBa?=
 =?utf-8?B?Y1V1YXRnZVZHZTRza3JML2hxR1NGeVJkR0tPUHh4L3owQnIxcUIrQU5jbnI1?=
 =?utf-8?B?MXhMQXhCMVhnZ2grTU5WZy9mQWtaaFFzVGN0YUJvK3BBM3JMU3pZQ0FuOVVL?=
 =?utf-8?B?c2tSLzVKTVplMnlXTkRSWTd6U0dxUEh2Z3lOS1NJc0hTSGJjanE4WVlpZTVx?=
 =?utf-8?B?MUZ5R2ZrLzFXY2M5MGRqWW1xYUVRZWJzOVdyWEZoZEVPekc2S09PY3ByYUgx?=
 =?utf-8?B?aHAxUHlQVSt6d1NBQ1Q4OUIxZ2NHYnI2Y1VMdW85UXJoS0JXL1d6VlhkaHBx?=
 =?utf-8?B?VHBCSWh3cVpNYlRTckg4ejJUR1IvdDREdzBTSHVtS2xySkcvL2dhRURoN2ly?=
 =?utf-8?B?ckdPRm9PeVpkenNjbWQ3WkVMU0tRQ1QrOWZmOXMyM2kvNkptdGYrQzlhRTdZ?=
 =?utf-8?B?R3JzeHRWcldoaU1xVXEvLzJ2QVFRUFhWR1MxeGI3RFJtYXh4ei9xdmRJd0wv?=
 =?utf-8?B?UUVPZlhVemVCUGxOWW9SQ3pWQ3ZZRUFnNVVpNU4wVDRsbFN6b2lDR09wL1ls?=
 =?utf-8?B?eUhtYUVtdjF5c0RQS0hlYTR2NUF1Mnp5L2I3ZWRCSmg3RzJZRzJwb3RORm9F?=
 =?utf-8?B?NVg1eUptdUJZWHU1ZFN0L1l6RUZ4RlQ1L1hkUDZSZW4rTnMxZFVQL21JOS9R?=
 =?utf-8?B?NG9JK3hTTWlpaURLMVE1dW9RWE4ydnVmNUhVd1JWTEFsUlhDRGMzKy8rZlNx?=
 =?utf-8?B?OUxjV0kyamRVWXNnZ2RZL2t1RnlOYXlDVE0vMjg0R28veHkzTnA5em9aK1Jp?=
 =?utf-8?B?ck1FRGxsTjFMZHc4dWprMHN6WjhtUjVWenVmN01uWXpMQ3ZkZ0VsVTZlWWkr?=
 =?utf-8?B?WFN0YWNUKzBsN1RleVZQTnZCV3lxRjk1dWFEMXEzZXB1RnhySUptYVBuSCt6?=
 =?utf-8?B?bXlBTlJXTW12ZUxOYitpdzhUdXNMaC8rcjc5Ynpaams2Tjl4UTY1Yncxd1Zz?=
 =?utf-8?B?Z2F3d3k4TE42TzdmUCtaQ1JpdDRFWElLSnNPd3FIVWRGaHl0cWx1aDRiR2Y3?=
 =?utf-8?B?SEl2a2oyV1ZMV3piUzdJWDVRdVNEdWlMUkNyNXFKaldtd1l4Z0Z3YzlTK3c1?=
 =?utf-8?B?ZHk3VWlIQzFnUHRtcElRSXpXclljREVnN1Eyb0YrcnFJdEpTekRUR3JsZDJr?=
 =?utf-8?B?RzMwZjliUG1ocWtJK1NCNnFuUEFVT0RsMUVWdWhIWEtHMUx5d2lSakFzMUhW?=
 =?utf-8?B?U0hVcTdmMWpUaE0xUVdZR094djlUYnc2N1lJN2RLOW5oVlZqRUhJSXY1VWFU?=
 =?utf-8?B?LzYydGY1d3dxU2tXQzlUOTBBcTRUbGdlVklCVUdBdXhqZlFCNVlHeHRqQlQ2?=
 =?utf-8?B?SmdDdUpMbk5aYnNRTTBPd1lRT25zanM1SEwzci94OWxDNmFkMDVua0VNYnNX?=
 =?utf-8?B?NXdxS1FGR0x5aFNxT0czYlNzL21NL1pIU0ZSNWVSM3dNZjZvYUxaYjl0UVNL?=
 =?utf-8?B?TEhuZHhTNXlhK2llUklKdXpYVlhlU0FqazIyL2FrQzRwYng2R0VCMUZDQWVr?=
 =?utf-8?B?TkZNL1N0NlBHcEovUnhBQkRRNDlBSENkR0QxOG1zVzZCVHV5NXIyRHdDSjlR?=
 =?utf-8?B?ZURIRHp3dE9oaTBmRjNUR2lTL0tvUUdiVXEyNlorZ0EwM2JCbVByVmlHMXQr?=
 =?utf-8?B?WFRrbUhJcTBNRmxkL2M4VXZEVVRlL1BiKzRwWkV1UTc1Yysva3NyallORENO?=
 =?utf-8?B?THVrNlE2d2tEVWFWK2hCR1dwUWdIZVIxK2ZmYk1UclVXUDdrRFdxQUQyWFQ2?=
 =?utf-8?B?dzRNMWJwKytkdFRVMklzemRQZVg2czE1d2xrOURLV3NNb1I5djlWRFNtT0lR?=
 =?utf-8?B?VzdyMXdJeURaYndRTDVwYjM4eUFiOHN5U1NuY05ML1Vyc2Q3bmZYejlnUUQ0?=
 =?utf-8?B?Y0xkT3BmUnh3NEwxRWtia0MzRTY5Rzd6UkZzRDM2b1ZScWlQNms2QmFHZFZs?=
 =?utf-8?B?Z3RadmZtZkxGTHUrZVJleUxySUtPQlloMHVYMXBkN0Mzc0FvMkNGcTIyckdq?=
 =?utf-8?B?c3NUTlVZNFhlYk41ZTZRWHZhUGRlSlRaVHYzbElNSmprV1IvUXMvMHk5SG5p?=
 =?utf-8?B?eXNOZlk0OFV4VWxHemQ0dEo4V3p5MjVaa1hoU1dSUWxKdkFwQXR1WTJXeHBW?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kyT89W3PH4nPzBEHdVS6ceCJZZBYFjOAcA+qmJz9J4byQWGC4ZZ0Ioh7MsiN7DiSiKHnQKHVQTpXfnmLjVVvgPnyhlsMdzzOe+h3wPtZrzjxmL9HeCbrS1LD6WQlOE2R+sEpS9ynmv+jhRPwTLDv8zNn63kYPy3EQ/+KRQH3xYom5Yw1bCqmEAcONcJoLoI/ZQuPB7SBgbk5gkhBgKGM4zG/GW6UFQMWslCNSe82Ot8kpK4x9nDTrBe1Q9ZzpyhU8LKp02l37P4M4ml4JW831P2YhA0AgwLJ2KmHtlw75MjPLYsu2v9Z28PrQ/qgfX9UBBqA9R5CPgG3/4MUWA6HpUt6Mk7ELIVURGk5ZN7NEGyfDarln+LeqTNG3R9a4/DQh4hwfIFgEkfqIHPaE1j5f2+KP8mF23sBXOQtlnvGJtclUE278TQgdEgPghiFwEEI2iqD0luO4489r617u+ms9Sb+NaCJcHDA1MV2zJEaGVtcPvaZFY9J1suPQOuUAwmnfEhKcXu0XPIkYe5Gl7BB/WK3idPZ2lLJSxDn9BDolhCi383wfk+SMNunOgZ9GFakxKFjNczr1IB3ikTEvkiBzDT4LTIf/b2jTzBt82T5Dji+lNdFSsi9pXKkWaKKSTfPsScx0OKLM2ETVYrOGpli59K7DMtb1IC1WhRlDiSgp/mveNO6zETN3SB94LF+iaGCTW8kgRboxkVNJOrtzIky05Xfia9G1j/FtbjooFD8+46zA6rMdGOGilMb0xsmF3P1iWj944BrWduEcixEEu88VjdlwyQb9SaWNPo3+cNQP1X3cCDGJeNjwm6YDpviL9ps
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358f109c-fa89-4575-402b-08db1c15b5f8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 18:32:58.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coiufj3Vo95XNtZOtwJ2e2fOmfPdBxFNNNO8517dfzPl6TEpoyVU34DIBTFgySVtALLz/0a2eio6vlvT6YnFao+M3JslHOGKNEXM30Jt9TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5482

On 03/03/2023 7:23 am, Jan Beulich wrote:
> On 04.01.2023 12:11, Andrew Cooper wrote:
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -288,6 +288,9 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
>>  /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
>>  XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
>>  
>> +/* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
>> +/* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
> While committing the backports of this (where I normally test-build
> every commit individually) I came to notice that this introduces a
> transient (until the next commit) build breakage: FEATURESET_NR_ENTRIES
> is calculated from the highest entry found; the comments here don't
> matter at all. Therefore ...
>
>> @@ -343,6 +352,8 @@ static inline void cpuid_policy_to_featureset(
>>      fs[FEATURESET_e21a] = p->extd.e21a;
>>      fs[FEATURESET_7b1] = p->feat._7b1;
>>      fs[FEATURESET_7d2] = p->feat._7d2;
>> +    fs[FEATURESET_7c1] = p->feat._7c1;
>> +    fs[FEATURESET_7d1] = p->feat._7d1;
>>  }
>>  
>>  /* Fill in a CPUID policy from a featureset bitmap. */
>> @@ -363,6 +374,8 @@ static inline void cpuid_featureset_to_policy(
>>      p->extd.e21a  = fs[FEATURESET_e21a];
>>      p->feat._7b1  = fs[FEATURESET_7b1];
>>      p->feat._7d2  = fs[FEATURESET_7d2];
>> +    p->feat._7c1  = fs[FEATURESET_7c1];
>> +    p->feat._7d1  = fs[FEATURESET_7d1];
>>  }
> ... the compiler legitimately complains about out-of-bounds array
> accesses here. This is just fyi for the future (to arrange patch
> splitting differently); I've left the backports as they were.

Hmm.  c/s e3662437eb43 was designed to specifically allow CPUID patches
to be split like this.

Which compiler?  I think I agree with your analysis, but I've never seen
a complaint, hence not noticing.

I suspect we actually want FEATURESET_NR_ENTRIES defined in C, next to
the FEATURESET_* defines, and we want to BUILD_BUG_ON() if the autogen
length is larger than the C length.

~Andrew

