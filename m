Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B46693F2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477107.739671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHBL-0001v3-Dq; Fri, 13 Jan 2023 10:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477107.739671; Fri, 13 Jan 2023 10:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHBL-0001sX-9l; Fri, 13 Jan 2023 10:21:07 +0000
Received: by outflank-mailman (input) for mailman id 477107;
 Fri, 13 Jan 2023 10:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGHBJ-0001sR-C3
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:21:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa90b132-932b-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 11:21:03 +0100 (CET)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jan 2023 05:20:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6797.namprd03.prod.outlook.com (2603:10b6:806:215::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 10:20:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Fri, 13 Jan 2023
 10:20:50 +0000
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
X-Inumbo-ID: fa90b132-932b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673605262;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W54dHoJM9P0PkAPwS0dPAtnXs0fXxsIPDOTFPoKcC3k=;
  b=fghC/TZxRourLR8R/MDPh4XXZHIx7iyce9fHbS9c7L8AqawxVSEubpim
   krMfncziELSrX6Xu9+/eZr/qj5+l90BlLIXascLCm2UqCFiYrfutfPoVt
   4iYq5x8fvNTx3mJuT/qlhXaBtpi0zZtXNdJr2zlWkwTkQNfh0iQooMK2T
   M=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 94931465
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HSj84aDGr26sUBVW/+fiw5YqxClBgxIJ4kV8jS/XYbTApGh20zwCn
 2JNWmmHMquLN2PxeN0kbYW1phsEsJ+GydFmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxeovC18W/
 KQjE2oXcRqxocyo7ZahRbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6TzHiiBNxPfFG+3thNmHafxEUZMx8xC3a1isuIsXa0SfsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaJSkQBX8PY2kDVwRty9P+upM6ihXDSclqOKGwh9zxXzr3x
 li3QDMWgrwSiYsH0vu99FWe2Ta0/MGWFUgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvZ5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:OM9PramWlvha6JR2rSvLpztwW67pDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.97,213,1669093200"; 
   d="scan'208";a="94931465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNTVRAtYLu8EH8Ey/dfwWM2tA4ZN2fJ/A7aRQJb8dg1Mkvi8G2rtPssdkqG9W/uC1uDxqgf2Sr1ciDsYc8XLTuzvSlUNQBjnt3lmALgcgZGAjvTNLoqeoihPKwqRd7N2iG5cPva/Chy+wTlipV4yVjbM9VGUIkBko3nVAx61xSmRTniPFxffsJul+K90SvBo2NAug70ZPzZ9BZVqFTU2YzsskDTGDu4EbR0MvmBUVYzZRvFGqMztKUxMTqBoPvIEewmIifm+X8H48CSXBuejDcEPUWm96/lcIRtMEsgyPBTZxcynp1qC9KNq9HfB9PrgFBAvLxFUTvEYFP4qVTH7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W54dHoJM9P0PkAPwS0dPAtnXs0fXxsIPDOTFPoKcC3k=;
 b=l8iYpImEG1u8ky9G7vxjBAh/nK8DSF1uQQPcaLGosaQhiDCXq/54NIMd8rd9YQwd/9zP8Hmt4l8sxhhYhN8cDxa47GGHalOMbWDyfUuQAIFJ5xcwnAm9fz5uGd17sCz8QsfpWVuft2KCvI46HKeAQwgT/D5CmF4ioX/HkNADTCJluh4qfnxDPkuwlQMwiq2Sub6T2qQgiJrZuwkFb/RG2StN3nexgtG6zt0DyFky52b4B0nZifck1MqXByRf/AmUr6YM6TUyjI81N4tAJEHqaPUkia7IaI7tW5ZwEIk8XLb3dz4izkbyjkFpXDOf7vCm9cesmmA7qHt4LWI9xD9UlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W54dHoJM9P0PkAPwS0dPAtnXs0fXxsIPDOTFPoKcC3k=;
 b=iPOJvJdM2wids4KnfLFnqDlziJd48OXBM5za5DuWilVZuAkv674wAjnN5k3OuyZWMc6bmP6OCNLw/LcAsWJjU+HFBglUIT1nZ9jJ9i2ay2EoqnCEmxTIt4Ac9sVAJe/hQwX+PDnR7uBCrwTcZ9VRSXq0GIaG3fLgVQPqMxjgvNQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 2/2] x86/shadow: further correct MMIO handling in
 _sh_propagate()
Thread-Topic: [PATCH 2/2] x86/shadow: further correct MMIO handling in
 _sh_propagate()
Thread-Index: AQHZJyvN3vLgdA26WkC1mtdAvOV/WK6cIxKA
Date: Fri, 13 Jan 2023 10:20:50 +0000
Message-ID: <18b606fd-e354-b43a-fa5c-bbdede7b7091@citrix.com>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <b05d3911-a6c7-68f1-0e48-255630ab6516@suse.com>
In-Reply-To: <b05d3911-a6c7-68f1-0e48-255630ab6516@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SN4PR03MB6797:EE_
x-ms-office365-filtering-correlation-id: 8a0f6c1f-172a-4f05-5bc2-08daf54fd804
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mt57nCfPR2bLBeeFcgrKysw2a7PnGCtxr2vSbbDkzmFKlWX8Jjh1owsELENkVxOBp20ZCAHkOLmdLkSG4VLIFpB/qJeP3saVw1pxikHFj6zqKmz/bdQBWnf+RCapx3aoR9wtpWOgA99uUggiYCp3yK1Ltw8XlRATO4mfstCBZAq4B87EDtuN79RUVF4kGuuuPX1zqst+xFLgx7c3mL5fE6FEfEDQ0k90lp0sZV5E+UfE0qfqEWZoIJQ7Fd6krrKKqPz6717Y/XKTuA2kJLINkIBH4dJeG4IZ6ukoacNPxkmaDbD2vLOtK98ctjelBS6gexEE6jgrJJjy0umuQbzLEdGb7oUahIS1SB0SHFwVtzCPEPB39zGp528gJSbII1G7ADleDFK67mxIK5HjxZfOMwEzAYmSt0EiyTLheSAJi050UWKwlE4lOtbMSfxY75atzxVOUk93RMdgGNaVAb8aEGEh9sR+cuECQQeQ+iiEVN2uf90DRpXnnm+/7mKCBM0Sfsicvur66wHt4TlPDJ/LT94A+MEITm0RbizXp+DQYVFuXOCMFpfRP4RX9+3cdiC8w/OvZtgah/GHNBSkstMc3qMpPp4OS+6Y2OpoXL81KN/BkTWQKVnEwfEAyN6c9ePByxNVUrPlm5PSmw1Un9BnWAVC7u6ZOGqVo177JqoUHan6SATUHdDG7Q0r6DD4SSLbYtXq5w2/CltWX9s1Cwj/5TzIMhWDawHSL35xvL89lRTOIyRz813vNAqPe1qcbuxRGtHr0ugmCK/pHOEG1q/Hmg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(6506007)(38100700002)(122000001)(82960400001)(107886003)(31686004)(53546011)(2906002)(6486002)(478600001)(5660300002)(2616005)(4744005)(86362001)(6512007)(186003)(316002)(26005)(71200400001)(8936002)(38070700005)(36756003)(8676002)(31696002)(41300700001)(91956017)(64756008)(110136005)(66556008)(76116006)(66946007)(54906003)(66476007)(66446008)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDBhTkFadEdhMXFjVUIxWmNvT2xLVTJiKzdVTWRYVWZ2ZnZ6V2huc25UbkYy?=
 =?utf-8?B?QnJINFZGQVZPOG4vVFJDM2VmM3V3SWIxd1p0NnQvUUFFZEdlTmxmaUs4V3lm?=
 =?utf-8?B?MWpZZEZHVks5YllNN21KYVVmSVZFcTZSMmFQR3l4N0RiTFVjeDBPRGJYSGRC?=
 =?utf-8?B?MlB2TFlaSXVCbXozY2o4blkwMXRmRW5GUGo3dGRRVTJPbGNoR1FIclBRZDVV?=
 =?utf-8?B?cy91QWN4dDFqUXZ3WGtDeGI5VnlxdDBnaGVtSG8rNVRMOEtWTldkQ1Jiall6?=
 =?utf-8?B?SnpKZnRvRG1CSmZMWlg4QTlxVkdqUnpaMk1PUjQwcEJCZktzOHdwcEVEM0FM?=
 =?utf-8?B?Rkd0b0VpT081R0l2R3MxWkVibERadWFVYU1YeVZ4ZWtNdFUxcTllWGloZDhx?=
 =?utf-8?B?RjVJUUZOUWNIQ1p4SVBvOU1sbVlMZUFDaGppM0c4ZGhtSVFmNE1VVlEyRURZ?=
 =?utf-8?B?Tlp0bjBwU0VoSzJqR2daOVlZd1M1OE5TdTZOc2FPeHNlZnIyazFheXhyci9R?=
 =?utf-8?B?cUFVb2ozZzBrb1h3SGhzS0VLVGxCenY3ZGlROEE3aTVWSkNOZU9rL3c1VzRK?=
 =?utf-8?B?LzUxakh6eWlaaHIrazI0dUUxL1U5SFBEVmwrSVVvNkg2a0FUYi9RRTV0MHVo?=
 =?utf-8?B?SzNtUWtBeWJoRTR5NVpqWnJFdFB1TnNqN0dJV3JaRlprU09RTHdjeVlxMkhw?=
 =?utf-8?B?RUMyV1A1S0Q5UzdzQjlNMVRzQll4VjVLUzFYeVpTWGJYUTFSZjJ2UXJHZTJ1?=
 =?utf-8?B?Mkd4alVUMU1wbUNtQXpIRmxQVFNiK0MrSW4zRjBDQ0IvcUludUwvN3V2cXBW?=
 =?utf-8?B?OEFneHhmVTFlcXF0amdTc2l0cFpGWVNsYTdiWTdpWjdCbXU4a1Ixa3oxTFRv?=
 =?utf-8?B?VG9PK0l6QVorZDVjN3lJRWc2SGJNaEhQb0xkZ3VTUmhzRGt3WXdjSzNLMjNP?=
 =?utf-8?B?ZnBQcnplbEFWQmN6U0kxNXVkV1VBbGhMWXVjclpxSnNOYms4ZmZWMkZtWTJq?=
 =?utf-8?B?T2J1VEk5cW85Rk9iNnRUWnJJL3QrSVdDQi9lWVNhZVcyY2xodkV1WWZZVWdl?=
 =?utf-8?B?ZVRMSU1sVld3RHloM1YwdzNxOS93L3VVVlp3V2hRYnRINVl1YzVkQTM5dEIy?=
 =?utf-8?B?VjFIVmVzZWg1czB3TVRkVmw4aTN4TUppZXY0aUFLSE1LTndOSG42dVg4dmNi?=
 =?utf-8?B?ZmR5RGl6NXNuTENDYUhhWmsrNTVPV1R4MjErZllBcG1rTU5NSE5Uc0xoYXhi?=
 =?utf-8?B?WmQyeTJPdTFZd3BjTUtBQkZvU0FwQjlDSUtTSTlQWWlyUVBBbkJxOWE5RjVX?=
 =?utf-8?B?aUE4M1paalhSVmhMZ25rUWJrNVdJVjhwZzN0NGJTQ2RIMjhMQmxYR3dwQ2xR?=
 =?utf-8?B?dWhiejh4Q1dYRnhxdW9WenFudlZDdTgxcUZBL1R5MmpLWTJNOG5hbi9xZUYv?=
 =?utf-8?B?Qkppa3FFK2RhbTlEQk95eE1RKzBNR2E3aG9xY0dpR0VvODVEN29UVThTWnFj?=
 =?utf-8?B?ZjRaY0N4Y2FuNHh4VHZsYkpIZUpzbDBFVmg1emVsY1Y4V3czejFmZkpqN0NY?=
 =?utf-8?B?ampJejdPc1puQUtJblgxM1AzN1dYeFRNWi9PV3doT2hpR3cvVGQ0aEpLR1BY?=
 =?utf-8?B?czRRZC9Ma0dsREZHajlTZzVhdWRURzBXMXVXMWs0ZXdYdEhuS21wbDd3b3Q1?=
 =?utf-8?B?TUt5dWhFcEdNMmFTeVB1TERCZVRvVkdCZlEveE1VN2o5KzZnOHZBRjBuZ2gx?=
 =?utf-8?B?aGtmVDdKZ0Q0Q2FGT0p6Q0M5enNXRk5CSmN3UDdVR2ozOE5xRG5tNHNTRDJE?=
 =?utf-8?B?M1hncUhUK1NKbUk0cGsxRGVlWVNqbkM4TTc4Vk1Nek1FdEU0MDRJNkNuRHVH?=
 =?utf-8?B?Z0liaXB4UDI4MldZd3NRaTBTM0Q5YzNuS2NvQUE4b24xV2oxRlFTMEQwVEsy?=
 =?utf-8?B?TnBCSnlOYk1oeE1vZHQ2Y3BkUEk0dTNYaHJlTk1kTHhOT1JYN2E1WGFJMG40?=
 =?utf-8?B?SnJ6UEYyczRRcS9iZzh3TnduT2hqSjRSd0pYZEdodlNYb0tHRS9VNDMxZDV1?=
 =?utf-8?B?SWMrVW1zQ3gvUXdDaUJVbnB1eHhaNy90L2lsd1pXOWx1NTdXeGM3NVlhaXFQ?=
 =?utf-8?Q?rmG0qI8t09b8Lc6I3yA8sD+gT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD56D441B254994AB99AFB3AF1A8F01F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tY1dnEjlqOo49f0MoknQhKzYysgZRFO4+lQqXOKwb9m6TxmiuaH6zyQg/52wkvQa9Np6/jHVToZV0vq1ylhXEntV8q5Y7x+N3dX/uBoatyi0QZGsdUkpx8mGegQRpKOBPmALzzvi0XZfpRiVk1eHissTA80D9eD6sGsUyHUK+2vl34e1bf6SgVT4cr2v85nq3OOdFfaNTEnoIomCJWd5jumVaxW1ChJ1y95YMogsOc8vVl5HVcCCBwmrrPOlzqDahHPpvC15w8GIlcHXBf8Gk1xfn7E2GyJ+o84q2qferIXfK7RVp2HIUYrxpfsP0w1qZyC386MDB0pORisXpfGcusUwFuq12Jjb4GJgKB/dkN3tQG41A4G2HcnSpJ/BKSOQL8smwMyRzER/O0n+GC4P6J/5jBzym2vcZXixaj9gsmRjOTsUKA1qSsQH25trcNZ5BupgCQJWE8NVFZ4IeYDh5mhHVGRdDFnv6I/5A6TMeY6MISzs8Aef5472u3EWaWJuCddHEGSk4fkMFjRYBIKm8tavYNou5N0s22mbj3BOOLdxfwZNGcQxMH7E1MSo6i8nnHSO7GPLiaeGTfTn1HfOpLEgJQgnKN79W5j+wCTDZTepgkENoVQzixSursrpMO6DFAevBYfiNVGqNSKr7mPLfmmlmfyq7wsiIAwOgksagbDLwbZC0rkahKA3LG+3loyl31tNWO6OkvepzIw3akt8oXyclrWH5ZywGAfJpNbZpiy2IqtKPNzB8YhVjBPUVJaB6dDfaRZodak90LaBZFu1+d31NsUzQLxe1JyHeZ8Z8tGLI9110BAvyz2vCu7W31+SX0PULntkITubgm341HEAvmE6002HqfkuYjRP205ynDs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0f6c1f-172a-4f05-5bc2-08daf54fd804
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 10:20:50.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjpU6snos1HtxLDrrlNdX2/OlDx0gzuZWVeQ51C3GqdYv/H6QvkZwnXf1Hr4WihuV9nR8XdYE3lSx7TdoXv3VfXAu81sY1bfiNZ6i/zwfWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6797

T24gMTMvMDEvMjAyMyA4OjQ4IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gV2hpbGUgYzYxYTZm
NzRmODBlICgieDg2OiBlbmZvcmNlIGNvbnNpc3RlbnQgY2FjaGFiaWxpdHkgb2YgTU1JTw0KPiBt
YXBwaW5ncyIpIGNvcnJlY3RseSBjb252ZXJ0ZWQgb25lICFtZm5fdmFsaWQoKSBjaGVjayB0aGVy
ZSwgdHdvIG90aGVycw0KPiB3ZXJlIHdyb25nbHkgbGVmdCB1bnRvdWNoZWQ6IEJvdGggY2FjaGFi
aWxpdHkgY29udHJvbCBhbmQgbG9nLWRpcnR5DQo+IHRyYWNraW5nIG91Z2h0IHRvIGJlIHVuaWZv
cm1seSBoYW5kbGVkL2V4Y2x1ZGVkIGZvciBhbGwgKG5vbi0pTU1JTw0KPiByYW5nZXMsIG5vdCBq
dXN0IG9uZXMgcXVhbGlmaWFibGUgYnkgbWZuX3ZhbGlkKCkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

