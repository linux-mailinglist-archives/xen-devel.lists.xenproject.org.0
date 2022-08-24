Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8813859F9A0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392516.630915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpLs-00017E-9r; Wed, 24 Aug 2022 12:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392516.630915; Wed, 24 Aug 2022 12:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpLs-00014f-6R; Wed, 24 Aug 2022 12:19:20 +0000
Received: by outflank-mailman (input) for mailman id 392516;
 Wed, 24 Aug 2022 12:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQpLp-00014Z-UN
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:19:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7ac5369-23a6-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 14:19:16 +0200 (CEST)
Received: from mail-bn1nam07lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 08:19:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5543.namprd03.prod.outlook.com (2603:10b6:5:2cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 12:19:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 12:19:10 +0000
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
X-Inumbo-ID: f7ac5369-23a6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661343556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IGcd5ZcjbmRQhx5gbt2DI9DYDAOyLUw4qv6d3xNMfm8=;
  b=WZMq7sbPSbjxBqSmqN+sbbt8pmLEOmMzJxG3SoY6Dgtd/cmHpH8KpEph
   RgcpQzJUmT74KTn2M/Mt6PcgMJnOJtzsqysZUE/xJ+oWvc+7q0VH4BNfW
   ClCQxmPWg/ScrlbmJN/PuJZ08mjadrfwqidewJGCN+HAeFH1VsK53sgpZ
   w=;
X-IronPort-RemoteIP: 104.47.51.48
X-IronPort-MID: 78014791
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w+3W16PXc58xIyzvrR1wlsFynXyQoLVcMsEvi/4bfWQNrUor0zcPz
 DQWC2qDMvvZazHyfNB1aY2+80NQvpPWmoc2Tgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/jf8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPn6MVOMhoHILQ64/x+Wk9C1
 dc+BGACO0Xra+KemNpXS8FKr+F7dozBGtpavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rrxwCWvG9FbgAv9Sa4fym7f1gFulpPqN8LYYIeiTsRJhEeI4
 GnB+gwVBzlFZITGlWXUqxpAgMfDuXK4eKQ5EYGi8/06x2yU2UIMMhAJAA7TTf6RzxTWt8hkA
 04e9zcqrKMy3Fe2VdS7VBq9yFabujYMVtwWFPc1gCmIw7DR6hyUBUAFSCBAc90ssMIqRT0s2
 USNltmvDjtq2JWJRnaN3rOVqy6uIy8TLH9EaSJsZRsI5ZzvrZ8+ijrLT81/C+ilg9vtAzbyz
 juW6i8kiN0uYdUj0qy6+RXNhWuqr52REQotvF2LDiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02zaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:L+3vKqn0aGQnSR7xDRKvEueKTa/pDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78014791"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgrWfAO5JlBcc9yHNuxbnrnbOblvGxP158DWaX56gic52nCnYLDLKC4cHgf4yFv9arGt1dyXgeeOaFK0a4sXCDK64nHRlRrAzcp4FzE+SgZy5tc9kp5t63lvdHIV/gRgSLFcWdPtRtjQjwviRDqzShHc2z0o3r1a3JaqO3e/sFWp6YwDm+FnVbIXmEOppJQVnoL7CD6+5I1CiWGvQwiIHKnC1SdgNXLnpeGdoyyWvQbBwXNaYndn0ukrPemfpelqNhk5msJ9/Q9I2gNeEvTZ3HXltGFbWbM1UsYQu7baTxSnfBUUlJWJlnv1FNpwtehWNbcyA4V8rTYxBphul16UEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGcd5ZcjbmRQhx5gbt2DI9DYDAOyLUw4qv6d3xNMfm8=;
 b=U1JxJ7c+duAGIHMS2e5teQ2dZQMmdCyOXpAyYqHZ7STIDEGTN5rq6de9XCQB8tWJw6l1a/d8Qp2+DgqBwmYFLbX+ErjpVGHVlxxynVuZuYD01lG0h/TjQG/7dSBwFJiK1RGCBImftr6ZMG00XDyfBscelIPJ5hfBjLRc5IYBb0apFFQmJHcSiDaHGIk6zf9DRHmbrKmIzskZhi5jo9i0eex+YIdRH2cDABeid1bCv7vdMPw3j69qX02Xowbig7hGqBSocOsew5iA4zBUsG8tLkSUlebdOgIDeW1NCowGAn+Wpf5OSeMh0lgcC+jDYRCnY4HeuxWr8QfRJOOFX0+F4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGcd5ZcjbmRQhx5gbt2DI9DYDAOyLUw4qv6d3xNMfm8=;
 b=cCsej18/Qv1VDJ7dglGSssHh/hI4YaQ5c0qzSNZOrDOKFKnJqtg6v4nb4QM6dh/HV4u8zZ4ujwRD+nAU0WZQVVUwFNco1257j7BPqGREfEl42rq7Kkuim4ULnce90hBdgdGq9rrq/oU/FDFnQp3j69AEUinmihYB5PF2Oe3YHsc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Topic: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Thread-Index: AQHYtrt8/1v0WOY/4kiCtfQ8qrAcS628L8cAgAAH3wCAABa0AIABQecAgABptQA=
Date: Wed, 24 Aug 2022 12:19:10 +0000
Message-ID: <fa15c1a4-8f28-d2f6-6582-e49af6ebf74e@citrix.com>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
 <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
 <0e846638-c23c-0ec7-54b8-e318527ffac5@suse.com>
In-Reply-To: <0e846638-c23c-0ec7-54b8-e318527ffac5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0e85b32-7f31-4c64-ab0d-08da85cad9a6
x-ms-traffictypediagnostic: DS7PR03MB5543:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e+hAi2gi2/nF+yr8w81g5XACXkvhPTWbd1pp6hOaDHSo2XFf99HA9iQnUXYU+wW+JKqraYZa/9GUBUAc+plmVWrLbMnMnvoBJihG2rtV7j613kCqT2+QdJva81/U7m8COJ1dBWQoJwFuOKumFRU98MVZ/srVU4cjwbJFPB3vMiW/+kVpeM9hOisCa9VIZEOgT1ovlKGcYGVAK0tzwbRoxU63oOj+8DSu1xZnbWjsb6BtLJajzgu1dOZeLH6yQ+obhDKBywI/rOTXstZR2T9o1MhHI7b1UeQUK1natyXn6p7IGzRFSMuNeikohJ7sAsrQKfck/NkGvNooAETYB0yJyy9mH5Nf2tgtF73EESz88VuxLssQzmqRb9iDL+Tzl/kZN92tRVI+RIziFysC6Eh/nzTjwgMFWuTVpydXjikMu998jRm9JveC4mkfZoQIe8r1HfBUSnse9MVFu0J9M7R1eqVVLOpJkgyFXNYBMrFvPM/hpddBQjzX5N4C/7zLG+pDJx3zNZE4UjFelSJcSVzZc5VbbyLti0IzBtCRZPm6JBkDqQ0ELn9moSmss0MU0i2H1lK1/OcTtPSSO7a0hAaUz/3GHd267kkQ9c50gDXnZZAnpUUpHg+x/k16La8vmfxyKraSg5ui6vfy/2fgkcYmVaelsUgXZYfn74DtKczhma1iIidIz02ia9aPpzyGrra12og/Bvyc5yiZ5xwuhNJnSIhzwJyvJKvk+hLL94jcxpkIzoG0Aqi+/88pHgH/rWi89It0SWNLgPbzGeycZgNUuRw0bQeLzYHFNuh/AvaXTFtlN63KQQm3tLLzeQAQ4NiOWrmTMooLBP6lRNe/qjYdhw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(2906002)(36756003)(66556008)(91956017)(64756008)(66946007)(4326008)(8676002)(66446008)(66476007)(76116006)(5660300002)(316002)(6506007)(54906003)(6916009)(53546011)(6512007)(6486002)(71200400001)(31686004)(41300700001)(478600001)(26005)(38100700002)(38070700005)(82960400001)(31696002)(86362001)(186003)(8936002)(122000001)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXNTK0FweU5jRkFEejY1Qzk5Z3RIWDhXR1pGNFlzSzhsc1p2V05LZUpWUnBZ?=
 =?utf-8?B?S0tPcGFTVnQ4eFZWTFZHRVRYL1BZY2hjUHo5UXJNOUcwY3k5a014MUk0MHVo?=
 =?utf-8?B?L1ZhUFY2MEd5MC9WT3BVYUdpVU1nVmg2dmRDLzBmOUJFVHFncjlnVGR5SFg1?=
 =?utf-8?B?ZkdhTEI3Mjl4b2VsM1EvYi9CNFBORng4TnpaUHU5dURXK2ZQSVozWDJDY2xN?=
 =?utf-8?B?TC9tU2ZkV2RzWE43K0dsMGtZeFpQMFNlWEdvaTJuaTl2SXIvaldlQUNFNlpU?=
 =?utf-8?B?eElsWUw4Qy9saDVudjF3Z3M4VTZ2QWNMVkQ4YmFoOFFjMjZaMDNnald6c0Zk?=
 =?utf-8?B?dUdEUDl1Rm0rNDV3b0dMcWFFWkErci9yU1Q2eE9zcjRzT0pFNzliY1JlckJ3?=
 =?utf-8?B?TExpcVI1cUVRQWFBdGtGcnJCL3RScnhiSEpOa1Z3VnNVOTBSdlNwYmJUdmpv?=
 =?utf-8?B?R2s1T0s0K1VvdzdRUHoxVzVKY3dCT2Exc2QrV2ZxZXpqYnVkVkl0ZjUxcVVK?=
 =?utf-8?B?MU1EY3dSTTBhS1dYaFY5cUQyMGFhT0RGOGlIbHFGcHZrVmJ3cmg2bXNOeVhw?=
 =?utf-8?B?V21jU0ZBekN5aGNzRGhibXd3eVRGUC9VcFpLK05lY2gwL2Y1UEQrTjdady9i?=
 =?utf-8?B?dmhoanNFaDdKMHgrVzM1RFgvektvVFRXY1Ntb3hRVmRIUkROU1R6QlYwdmJD?=
 =?utf-8?B?d25xS0d4T0VmQlpwb0xFQWs0eXBzSW5tZ041d3o3eDZpU2VkeTY1MVlLeFVu?=
 =?utf-8?B?RUpyT3NXVm93MEJWMVNNcjJub3NrbGpEaFFIMDFOODdjaWxxU0VhYWszTUU5?=
 =?utf-8?B?Nko4RW9nNE1JODNyVVpNQ2VJQklvZjRZeUNONWRKS1BlQmxSRktGV2VXYXNF?=
 =?utf-8?B?Z1FmcnpLWXFsY0VCT0dvYlF6UHZtNnM5ZkJPU0dNR0VQSkVzRTdhZCtCczc4?=
 =?utf-8?B?V0RNZUNKM2FNSEQwZGpYYlJRanU0cVgxdDhEQjd3dHcwYXhWcW9BMS9WOEJn?=
 =?utf-8?B?VEhRYkNBTzZRNW82Y1RvWlZiaGE4c3QzenIzU0toZkdUbjVvQmtiSmNra29E?=
 =?utf-8?B?YWxXRWgwNHZSb2QzdmQ1TWsxQUcyUmNUajVqWW5LY1d3cGNPQzJkVGdBZlp2?=
 =?utf-8?B?WUMvc0VVWmF3bkt0VnZGb0c4eEh6RE1wZVBPOElXZ1BSYXMwWnBRbVFhbE9V?=
 =?utf-8?B?cTJ1WC9YY3JsaDVpOXFmVHdZR0xiVVZHMktHWVBGcFZPMnN3TW1DV2VWNlF3?=
 =?utf-8?B?QWt4S0lyWEF1Mk51dGx5WWN5TnBLNGJZK3Z0N3lIaVBvck9Wa1VqWGU2MUtW?=
 =?utf-8?B?V2hBSTM3bk9WOGRyRnZRNGQ5V3V2T0FyWFRqRXVvTkZMZ3pTRTlvc1l4Szk3?=
 =?utf-8?B?YW40aS8vOXlMWC81cXJrQjlVZnJaam94UmFPVzdHUWN5N0tXMGdwQlJsczcx?=
 =?utf-8?B?YXNUa2RxZ0pZWStNcXVSb1RuZk9PdVIvSE1ycTQwdUg5OXJOcXdISTc0ZFdX?=
 =?utf-8?B?WE5YcjJuVkRxbC9YL2hVckgreHFUK3Y3dlZobGMrcndHK1A3SExZNGRaYzRk?=
 =?utf-8?B?OHVzbkV0WWhjUk8xd3dzUHM5Ym5FekVmNVlLdEVvMUkvSmRBWGVLNlFuYjJS?=
 =?utf-8?B?U3BSK21kUVF5L2c0ejl3NUdNVzA0YncvSmo3K3ZYcDlZZW1xZWQ5Z0VReGhV?=
 =?utf-8?B?UnpWVCtnam9jTDdpYTZBVzRkTmFaS1RmTGh5Q2tWTXNMNmc5dlozY240RHZh?=
 =?utf-8?B?cjM1Ry9NdFloQU1rOXJSajEycy84TlFEWHo3R21aZG5XZFF1cFVZNmZOT0ZF?=
 =?utf-8?B?K0VqWldTb2lNVWpENDczNmZROUw3V0N4UVdSeC9kNUp4a2VhVktocmt0QnMz?=
 =?utf-8?B?bVB6RnVMWWhpVHVpODJvVkJWUTFtUGs2NUZRQ2VIakQvTDU4d0lYOS9oYnFD?=
 =?utf-8?B?elR0akFkN0gwNDRPcnFIb1pLendXYXhBNCtNaFQvVVcyL2NwcVZhdkRTMXBT?=
 =?utf-8?B?NkxMeFhuQnVHTnY0QTg5cmg3b3lhTEZwblkvaVF2N3NVS2ZzLy9qdEFBdy9F?=
 =?utf-8?B?bTdxSDNzbjI5Y2hlQjVJMnFabWo1Tk0rYTNjNHVSZCtTWTdDUkFySWRBU1B0?=
 =?utf-8?Q?PeDwIEKG0mB9bZdz56yy2QpUi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78135FE27946FA42A64151BECAA39D21@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e85b32-7f31-4c64-ab0d-08da85cad9a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 12:19:10.7344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3R6U8ldXB+EU9MYqh9V8cEDd6h6qh/MRRT2aCkEXkePWqGbb/NzS4FRzpiGnpYyzg6gDiRatuBwQJ05yTBsOp019f9qGbhgLMyNgbfkza5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5543

T24gMjQvMDgvMjAyMiAwNzowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA4LjIwMjIg
MTI6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wOC8yMDIyIDEwOjI3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMy4wOC4yMDIyIDEwOjU5LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBCdXQgdGhpcyBpcyBnb2luZyB0byBmdXJ0aGVyIGNvbXBsaWNhdGUgbXkgc2V2
ZXJhbC15ZWFyLW9sZCBzZXJpZXMNCj4+Pj4gdHJ5aW5nIHRvIGdldCBYZW4ncyBYU1RBVEUgaGFu
ZGxpbmcgaW50byBhIHBvc2l0aW9uIHdoZXJlIHdlIGNhbiBzdGFydA0KPj4+PiB0byBvZmZlciBz
dXBlcnZpc29yIHN0YXRlcy4NCj4+PiBXaGVyZSBkbyB5b3Ugc2VlIGZ1cnRoZXIgY29tcGxpY2F0
aW9uPyBUaGUgbmVjZXNzYXJ5IGZpZGRsaW5nIHdpdGggWFNTDQo+Pj4gaGVyZSB3b3VsZCBvZiBj
b3Vyc2UgYmUgZGVwZW5kZW50IHVwb24gcC0+eHN0YXRlLnhzYXZlcyBhbG9uZSAob3IsDQo+Pj4g
bWF5YmUgYmV0dGVyLCBvbiB0aGUgc2V0IG9mIGVuYWJsZWQgZmVhdHVyZXMgaW4gWFNTIGJlaW5n
IG5vbi1lbXB0eSksDQo+Pj4gYnV0IHRoYXQncyBzaW1wbHkgYW5vdGhlciAoaW5uZXIpIGlmKCku
DQo+Pj4NCj4+PiBBcyBhbiBhc2lkZSwgSSBhY3R1YWxseSB3b25kZXIgd2hhdCB1c2UgdGhlIHN1
cHBsaWVkIHNpemUgaXMgdG8gdXNlcg0KPj4+IG1vZGUgY29kZSB3aGVuIGFueSBYU1MtY29udHJv
bGxlZCBmZWF0dXJlIGlzIGVuYWJsZWQ6IFRoZXknZCBhbGxvY2F0ZQ0KPj4+IGEgbmVlZGxlc3Ns
eSBsYXJnZSBibG9jayBvZiBtZW1vcnksIGFzIHRoZXkgd291bGQgb25seSBiZSBhYmxlIHRvIHVz
ZQ0KPj4+IFhTQVZFQy4NCj4+IFRoaXMgZmllbGQgaXMgYW4gYWxyZWFkeSBrbm93biBrZXJuZWw9
PnVzZXIgaW5mb2xlYWsuwqAgVGhlcmUgYXJlIHRocmVhZHMNCj4+IGFib3V0IGl0IG9uIExLTUwu
DQo+Pg0KPj4gQnV0IGl0IGRvZXMgaGlnaGxpZ2h0IGFub3RoZXIgcHJvYmxlbS7CoCBUaGlzIGNo
YW5nZSBkb2VzIG5vdCBmaXggTGludXgNCj4+IG9uIEFNRCBaZW4zIGhhcmR3YXJlLCB3aGVyZSB0
aGUga2VybmVsIHdpbGwgZmluZCB0aGUgQ1BVSUQgdmFsdWUgbGFyZ2VyDQo+PiB0aGFuIGl0IGNh
biBjYWxjdWxhdGUgdGhlIHNpemUgdG8gYmUsIGJlY2F1c2UgWGVuJ3MgdXNlIG9mIENFVC1TUyB3
aWxsDQo+PiBzaG93IHVwIGluIHRoZSBDUFVJRCB2YWx1ZS4NCj4gV2h5IHdvdWxkIHRoYXQgYmU/
IFdlIGRvbid0IGV2ZW4gaGF2ZSBDRVQgcmVsYXRlZCBkZWZpbmVzIGZvciBYQ1IwLCBzbw0KPiB3
ZSBkb24ndCBlbmFibGUgdGhlIHN0YXRlcyBpbiBYU1MuIEFuZCBJIGRvbid0IHNlZSB3aHkgd2Ug
d291bGQuIEV2ZW4NCj4gZm9yIG90aGVyIFhTVEFURS1tYW5hZ2VkIGJ1dCBub3QgWFNUQVRFLWVu
YWJsZWQgZmVhdHVyZXMgd2UgY291bGQNCj4gY2xlYXIgdGhlIHJlc3BlY3RpdmUgYml0cyBhcm91
bmQgdGhlIENQVUlEIGludm9jYXRpb24gKGp1c3QgbGlrZSB3ZQ0KPiBtYXkgbmVlZCB0byBzZXQg
c29tZSBpbiBYU1MpLiBXZSdkIGJlIGluIHRyb3VibGUgb25seSBmb3IgYW55IFhTVEFURS0NCj4g
ZW5hYmxlZCBmZWF0dXJlIHRoYXQgd2UgbWFrZSB1c2Ugb2Ygb3Vyc2VsdmVzLg0KDQpJdCdzIG5v
dCBYZW4ncyBDUFVJRCBpbnZvY2F0aW9uIHdoaWNoIGlzIHJlbGV2YW50LsKgIEl0J3MgdGhlIGd1
ZXN0DQprZXJuZWxzLCB3aGljaCBnb2VzIHN0cmFpZ2h0IHRvIGhhcmR3YXJlIGJlY2F1c2UgQU1E
IHN0aWxsIGRvZXNuJ3QgaGF2ZQ0KQ1BVSUQgZmF1bHRpbmcuDQoNCkFuZCB5ZXMsIHJpZ2h0IG5v
dyBub25lIG9mIFhlbidzIENFVCBzdGF0ZSBzaG93cyB1cCBpbiBYU1RBVEUsIGJ1dCB0aGF0DQpu
ZWVkcyB0byBjaGFuZ2UgaW4gb3JkZXIgdG8gc3VwcG9ydCBDRVQgaW4gSFZNIGd1ZXN0cyBpZiB3
ZSBkb24ndCB3YW50DQphbiBlbm9ybW91cyBleHRyYSBvdmVyaGVhZCBpbiB0aGUgZ2VuZXJhbCBj
b250ZXh0IHN3aXRjaCBwYXRoLg0KDQp+QW5kcmV3DQo=

