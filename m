Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67017CE278
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 18:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618726.962753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt9AW-0003VV-ED; Wed, 18 Oct 2023 16:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618726.962753; Wed, 18 Oct 2023 16:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt9AW-0003Sr-AX; Wed, 18 Oct 2023 16:13:12 +0000
Received: by outflank-mailman (input) for mailman id 618726;
 Wed, 18 Oct 2023 16:13:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4j4C=GA=citrix.com=prvs=648c180f0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qt9AU-0003Sl-Ra
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 16:13:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 393e3238-6dd1-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 18:13:08 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Oct 2023 12:13:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6569.namprd03.prod.outlook.com (2603:10b6:303:128::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 16:13:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::17e3:6cff:b087:fc64%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 16:13:01 +0000
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
X-Inumbo-ID: 393e3238-6dd1-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697645588;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DCWeesufpX4Jx/xDEbYF9J/S99Wsdw/u71csJi3Wzqw=;
  b=if3F2f+v5iLvjxGWcT5GwLRCSLZE+rA1xkwbK6PtgCCT+YtiouViQ/al
   bvQBlIxRN21okjnniJDkhwk11lnh6x0mIMX+YsCESJpSW19UtX/JUl4Ux
   PV7dzfbNFi0k6XWjzBvyBCQwO2s187iZo2HSD28FDl+043hk70P5MnDzs
   E=;
X-CSE-ConnectionGUID: jSuojjOeR9Sq2BocmwaXcA==
X-CSE-MsgGUID: uHpI7K6qSXeBn8rrAimpHQ==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 125832903
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4JuN7a0DnM7UauswsvbD5RNwkn2cJEfYwER7XKvMYLTBsI5bpzNSy
 WtNDT3Sa/uOM2Hze9skO9yy/B8Fu5LUyIQ1G1ZopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRnNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfA1pT8
 v4aDz03Pyua3cixy7ekQ9lnr5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LKfxnmqANl6+LuQ695yoQKwmHUoOBA8Uwuhu9C4j1aeYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUSyAyL0LuS3A+fCUANVDsHY9sj3OcpQRQ62
 1nPmMnmbRR3uaCRYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yuiqSE/g/AZi54N3qDip1Tf2Wvy9t7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lR9lFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:N+tmP6MHREMfw8BcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-Talos-CUID: =?us-ascii?q?9a23=3ADjFTl2n9eQXhq8l0XcA9Sbb3w/DXOX/m0XDSIWi?=
 =?us-ascii?q?1MzdSUee/TlSV56pUmOM7zg=3D=3D?=
X-Talos-MUID: 9a23:8xTXpwuWODUuAvUlsc2nmRF6FZhLvb2VOE0nl8UcoeCFMDRQAmLI
X-IronPort-AV: E=Sophos;i="6.03,235,1694750400"; 
   d="scan'208";a="125832903"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKpE2hAHyGzSP975yjeZ18jWyt7oy/1W7N5IULwhfaVIiknt66UdpEk10yb9ezXCJPbNRkGDsqmuMn/EhTQ+PIbhGFJM7K1BM88gCOHvL8i7wDua5we73HCEAsL9eoy6qZIS/SJGJBX2+3hvxTxdZcjIRik3ibwD40VnWtI7BxZ0+bzh/WegRVbG/+hD5Nz+7+IpZcTZ7xTvLY1Krqy3b1rFXQ5u0ip10xdeuWashsOHZcsf1zL5B1eEx0rW18VEnT1seRTz2+k2ZgyfmBqMxkhMWCFX+WK7U6RbBOJWDpeDnCASHN8sXgV/plAj6jyc+11GGQHafm53wsNQBq4B8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ImUFCvbRcnRGlo1h1B+NH6f0YDU46KvTsjMng3UQXk=;
 b=W9kAioEOhNFGZ8ycsQ/DSwo9oEHebVUmUAueVTY283PUwYfKWRdiuOPKB6fY3PSYFXzZTqjupFavoY8iI5ZKFZLHqsr2Ky5pwbhO9sraPPohAbBLzcuLrV8AcUBNR8YgbwZSM7nhuv1ls1iGPnhsity+MeTbuz5NwcKUggGcsfk7L4uAKMbtmtv9Bivhhl6Fpt1N26vlHD6c/fSetvrqovhJv9p901fKjthERwHeofz+y91Pt+1gejiOZjGdG6XvqKbhhDjGXNZGzNEnKPKX398XB2sNrR+6J/JvxYYvihAWDYRYjykZEiS1Qrq3AFbaY4fuySBsHRhKI1jO8JaCDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ImUFCvbRcnRGlo1h1B+NH6f0YDU46KvTsjMng3UQXk=;
 b=VdkPHYOkW7z47h2FP87W3Pa9b0dfJkS3hsWrD+lAufuGIBG2QzYqqjic3xnZv+UFx59uIB9j69h/fuZTNJ17mnYKbFvgVbPXdTIn5/z5LUxj0LRvxnDsbsee2ABAoSk5uQaI3hGT4sUGJbQ84H6kOA/wQx04RjxK3NGJbxiLS54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 18 Oct 2023 18:12:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.18 v3] x86/pvh: fix identity mapping of low 1MB
Message-ID: <ZTAEBxMjHAHdlfS3@macbook>
References: <20231017082907.14455-1-roger.pau@citrix.com>
 <f1ef0a3d-fbca-51ad-f282-fe3b9d49414b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1ef0a3d-fbca-51ad-f282-fe3b9d49414b@suse.com>
X-ClientProxiedBy: LO2P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 13656dfd-a4a0-4086-e7ee-08dbcff519c2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTLOFNMQ+FuswctwAfekJ1xq6aGaYryL4NLC/o5UNj8Q2metTXcsECN/cZXaLmVuElOpx8j+Uo5QJx0aUulNcnT3by4tLN1DsWB16TaBNYEyXWuUqR5M/LQEaMuDS6qRB+LLY1kAsBUcJO+P1cqVXHxkawj1s350YC+sljV7QsLKA/OwC8QN8pD212Y94uGMLfRDqC5aWvCuh3rrsXY937W5/FNcx0MDOgarPOCiOeVbT/Gsb2sdXdohwozjbLY478U112u+1lH7EYt43en185sVedHJfscUPMmFgtBoU8p4eFHvIoJ0MbuT/vdIIN7zFXXOwqKwwVHJu64DXwCsuEgGQ3TOuIpU+GBTAGv4Zlw4hPzbWyxpR/Zi/3BVa1s5E6tPrDTUrPpIUW8ZDbj10UdMkFX90nJ2sPyNaekkpE+Q1rSndrxEYzwyBTCUTxZceUBgI1FyRaw/ZlXC8yMbR5lD6wuxXwduupYyAYL7zcEuxw1zJ8bzWqRp/sHv8+39hgasZ59Q9FD7mo2yAbrM4H06ay65QeIMogVkwZ01RGdOonDkBhWz8InDgM8PD9ma
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(376002)(39860400002)(346002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6486002)(316002)(478600001)(6916009)(54906003)(2906002)(6506007)(66476007)(66946007)(66556008)(9686003)(5660300002)(4326008)(33716001)(8676002)(26005)(6512007)(41300700001)(86362001)(8936002)(85182001)(38100700002)(83380400001)(6666004)(82960400001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhITXZWYVpia3VCZUROSDl2RmxFTTBrMFowU0ZzbGJ4NzRrUFAxOUt2WUJp?=
 =?utf-8?B?VlUvQWRTMldWM3B0Wm1CSHpSZURVSEpOdDNuMXdaeVlqWko4aGt4cnE3a0hs?=
 =?utf-8?B?WGVmckZKb3pmVCtNaCszbk1JY2d5ZEh0dVU1amJDWlM1T3dVOWFsT3k1cWFI?=
 =?utf-8?B?WWNVbjZRZ3V4RzZBWHBRUlF3SzkwaEovblpmeEFzNGl1OVk5ZEFldkF6T1hH?=
 =?utf-8?B?SlZIajQ5dXRzcmpOYklJUmZIS2VHMG9Jckl3ODFTQzRsczdYYlZveHRiVGsw?=
 =?utf-8?B?VDBEZ3VwTXhnV085eVowZEhJR2hxWExlTUJ1eE1JNy9PKzNzQ2VZcXUvZElu?=
 =?utf-8?B?UkV6YVlHZjNkbUtidHB1NGpkNHZDTlgwSkFNNnV0cVBqWmd4ck4vdmhESzlz?=
 =?utf-8?B?VGRpeFNpdWJwa2F5emRwTVRvUDBiK0lRNjd2YjA5Rm1xdHRvN1ZiUUxpTkxX?=
 =?utf-8?B?TWRCV3JoWndYY1RhT3kxUEpKVzJBR0RLSDZ4Z3RseU1IemRXNnlJMzkrNi9r?=
 =?utf-8?B?aktZa2wrZ3ZPUzZaWHZldUloUGk5VUF6TWxVQkxjM0RrazRPSDh2cmVCK042?=
 =?utf-8?B?Q0hFWEJrcUkvcWw5R3RzRE85N2ZsV3lJVWtpMUJMYjkxQzlRWmZOU1ZYb05j?=
 =?utf-8?B?NXExajh0ZEJzYnhwb1ByOVA0UjA2bzF2eXEwQk8xTlpwdHB6eWh1eXg2dllT?=
 =?utf-8?B?czVQRE9OQXBQLzVoMW15ZGVCbmpodXA1MG14eWVod0xSZ3c2WVcybTNPdTlI?=
 =?utf-8?B?UXBWblNSRDZ3c0ZhcmZPbDB2emxZNTQ1Y0dnYmxkZ2ZoSG1DaFpwRFZJOFBR?=
 =?utf-8?B?SFRtRk82UG0xR1BwcDhwMDhzdUQ3RGo2b3hCbnc0VHlPbHJIZjFUMHRRdmt2?=
 =?utf-8?B?QWJOOUVvL2VWdUllRnc4aEpmcm1kNTRpRlRPcXBEMDZhbHdZYWs2cVlYV1JP?=
 =?utf-8?B?cm0xNEsyZ2pNUkxVQXNpR1F1djZ6eVcyTzNwbEJGSXFQdWhQYnh2bW5GNHRr?=
 =?utf-8?B?eHJlWFVQcCtwQ1JjQWJIL1g4OStFaVNKczNaVkVSeFcxRzlRaStnb2hYeEEx?=
 =?utf-8?B?K3pDenRoUStXeHFHb0xhQzZEL05iNDdBMFBGc0JWOVNNRzRaSEtEL212YzBF?=
 =?utf-8?B?TEFOMlhHejVsWGlENnpXQ2UyYnZOdUtRU1paQlJZOXFEWmZSVkJ0U3J2eWVC?=
 =?utf-8?B?T09COFhPYXNsTTl4SVlDVTR3SDdUTEh6SHlPR3RtT1JjUG0yb285VmYzWWps?=
 =?utf-8?B?TXl0anJza0JDMVZjVjd0MG9HNkhNTzRpMU9qUHNqMEJ6SzhEKy9ScXROcUVi?=
 =?utf-8?B?WWVWNGlMYXNCeEs5czZEdnFDYjNUN2V4ZFN2QVBEdlgzSU5pYS83SDg2cDBG?=
 =?utf-8?B?a3FWcThlYXVKSUtNWEFnOG1LVEJyYnVRbUtxcldGZkJ1TnJjSkNCanlpZERU?=
 =?utf-8?B?UGhnb2hWQVBlK0Nsd1hUazZUZ09wSExJbTlJcW83eWx3NWxzcm5hcWpralJ3?=
 =?utf-8?B?VXFuYU9RdmNsdmtVMEtIMUV6Q0ZybVBZNDR3dVlvdFQvNTBDZ2V2L29BUjh4?=
 =?utf-8?B?VWZaWWVMd2xRay9ObktKeWsyMFY2UElpZ2FjeGpIVzR1NWJVYlQvY1lOZVM1?=
 =?utf-8?B?dDFzYklmRVVJWld0YTBlZHFQT0U2cmhyNkpqZzFpUG9xSHZTQjlCNUJ3QTVM?=
 =?utf-8?B?SXhCL3cvS2NnUWdXMVU0eEFQS1pGMkV0YTY0QWRjL0hlcFpmMjJZM0hFeURL?=
 =?utf-8?B?MHNQMEFKM1pwYndsOWFEb3VzM0dML1A3T2s2Tm9lc29LRFg4RmpPaTJyTjJk?=
 =?utf-8?B?RUxXN21GK21Kdm1QVHp4L3JscUcxU0tMSEx6ei9LREJ0RVRYK3lvQ0RNTmVk?=
 =?utf-8?B?aVBJQXlKMU9yeFZaUHNoZ29TSkpwSFpZOHNhZThMdDFUOHROQm1KTFhwVU5r?=
 =?utf-8?B?VUtERjJZT2N1Mmt3TUNtcmNPek1KWExMR3BjYjRkQ0kwMXdjeW56Tmdqb0Jz?=
 =?utf-8?B?NU9kR1BzV29pcU5hdkdOcTd6eGZ3S2VUUGpPWXU4b1lHOGdVbWgvNUNOaTh2?=
 =?utf-8?B?a1VDcWtTcEhCRUNGVGkyN2h0cFdLcGNYNjh6ci9MTXBnSVRhNkV2Ync3d1N4?=
 =?utf-8?Q?0ja6CS8T5FEXTVZRTF43WuIHi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VSBjJUY8wbaH1YvESnKNKElUSpyFttkHzvJVPjOiGsy04Dym3hgf2K6yMAByQ/QcMQ4OWWuFQhD9v49r9tDpc+/xs5kOHbD5516FUiC4rI0Y2w0lqrzL55IRN2s0L6DP3wCGPBNZ8j9LXEfmFewPtRFrEA46bEW4tGNgbfDfyjwTcp48qrJEbvFGfVHNH3Xo1hq+az9xuSNq1BPqqHSb2WL0x/cnw07OCz/Vo4NS21w0yJAo1TV9SLpw8gV59J/riRo9Ev3gUL370Xn4/lEJK4yhdx8Xi08o18mNsRJ6QoUT9lVw0sm2Lh7B1hduoZWBDxEhoWHqWgMxzHyGd5uQzjdjHOi3di/vZl6G3ngj0o/lg4Vhyw8QlfqIdzWClQoPjnDl54bAar8g82VnZBEV0PhE11HmDjrUpEqoTmpNdhRRCz/mGYsiW1UskzVdfb/Nwqrka9TY5bkzzVqK/bbsJHdELmW27Toc1jrO3BTyyu5n5JYovRPEbMl/p8ZBSv83R+nzb+jEGA3B6t+E42v78IansDB3EZYl8W24dRbJy58mqjt/TzpYFXs+3uoA9XaPBU9nxHYBoZjtoSWn+ErzC71GTFCqVez4jBaOzKbiq4sl3hcn31kCB7EepL8fuxESwuXF0ch6Zjy23qZL1cO42saZbcXijgi2MsL2dyMbaG0ehGW3G876k8UD0tchMSHUX1xEQ5DfJygpthlKz1vQAvA5gTBYHDo780pJvwZTcNQu/3V4v7rTA+3v7KupUIJKabz2Dt/9oDCA3Mr77jHQ5GM8swuSVDAMa6i8UEqJriQoZLkdCIdl7SMLz0noC2TnwRxuCgogH0rBC3d5rcf8oWEBLPBumm4Ei9PrlY16QCU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13656dfd-a4a0-4086-e7ee-08dbcff519c2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:13:01.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VakbY6aGWnxhokUZbEdcpKvF4+febGYdNg3FFlqJWu5bNg4U8eJiGEdpFvqCPQ5ohhPMW/GxKHSrtMQxl7bDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6569

On Wed, Oct 18, 2023 at 05:11:58PM +0200, Jan Beulich wrote:
> On 17.10.2023 10:29, Roger Pau Monne wrote:
> > The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> > builder code, causing the region to be avoided by the arch specific IOMMU
> > hardware domain initialization code.  That lead to the IOMMU being enabled
> > without reserved regions in the low 1MB identity mapped in the p2m for PVH
> > hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
> > describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
> > faults until the p2m is populated by the PVH dom0 builder:
> > 
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> > 
> > Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
> > Opteron(tm) Processor 3350 HE).
> > 
> > Rely on the IOMMU arch init code to create any identity mappings for reserved
> > regions in the low 1MB range (like it already does for reserved regions
> > elsewhere), and leave the mapping of any holes to be performed by the dom0
> > builder code.
> > 
> > Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one suggestion:
> 
> > --- a/xen/arch/x86/hvm/dom0_build.c
> > +++ b/xen/arch/x86/hvm/dom0_build.c
> > @@ -449,7 +449,7 @@ static int __init pvh_populate_p2m(struct domain *d)
> >          }
> >      }
> >  
> > -    /* Non-RAM regions of space below 1MB get identity mapped. */
> > +    /* Identity map everything below 1MB that's not already mapped. */
> >      for ( i = rc = 0; i < MB1_PAGES; ++i )
> >      {
> >          p2m_type_t p2mt;
> > @@ -459,8 +459,8 @@ static int __init pvh_populate_p2m(struct domain *d)
> >              rc = set_mmio_p2m_entry(d, _gfn(i), _mfn(i), PAGE_ORDER_4K);
> >          else
> >              /*
> > -             * If the p2m entry is already set it must belong to a RMRR and
> > -             * already be identity mapped, or be a RAM region.
> > +             * If the p2m entry is already set it must belong to a RMRR/IVMD or
> > +             * reserved region and be identity mapped, or else be a RAM region.
> >               */
> >              ASSERT(p2mt == p2m_ram_rw || mfn_eq(mfn, _mfn(i)));
> 
> Would you mind wording the comment slightly differently, e.g.
> 
> "If the p2m entry is already set it must belong to a reserved region
>  (e.g. RMRR/IVMD) and be identity mapped, or else be a RAM region."
> 
> This is because such RMRR/IVMD regions are required to be in reserved
> ranges anyway.

IIRC there's an option to provide extra RMRR/IVMD regions on the
command line, and those are not required to be on reserved regions?

Otherwise LGTM, so would you mind adjusting at commit?

Thanks, Roger.

