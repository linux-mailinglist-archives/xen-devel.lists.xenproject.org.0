Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D459F91D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392502.630893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpEF-0008DK-4q; Wed, 24 Aug 2022 12:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392502.630893; Wed, 24 Aug 2022 12:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpEF-0008AS-0w; Wed, 24 Aug 2022 12:11:27 +0000
Received: by outflank-mailman (input) for mailman id 392502;
 Wed, 24 Aug 2022 12:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQpED-0008A9-KJ
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:11:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd8fc05f-23a5-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 14:11:23 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 08:11:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5167.namprd03.prod.outlook.com (2603:10b6:208:1e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 12:11:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 12:11:17 +0000
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
X-Inumbo-ID: dd8fc05f-23a5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661343083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=M+YZMYKtFtRpfMd4m+iQkjBRlTaZdDf6L0x1ytM5/iY=;
  b=NxxBoreAi8vACThmYGCT1zT3yuxz58y6FF0ob9hC4fLt7ZYQuFMuZy9c
   vbu10qepjq+Ty8cpfQ1bW7HD/0CsJCNDEpQXa1nR9eN4UA9jp6hkRa2NR
   B8ZGfwvDfLb0E17Ir2RHiZVDuCm+ArWz9xyISk4wln+/eMX9TQ0ve3EOy
   Y=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 78798913
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jY8HBK/v6U3RgxmRB896DrUDVH+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zcbDG+APqvcZ2T3Ko9/aIni9B5U6JXXyt9qSQFl+Hg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM14Kyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGNRA5Mqs33r1MK2Rxz
 dMBCRIiU0uSvrfjqF67YrEEasULCuDOZdpakVY5iDbTALAhXIzJRLjM6ZlAxjAsi8tSHPHYI
 c0EdT5oaxeGaBpKUrsVIMtmwKH02T+iLXsB9gL9SakfugA/yCRY1rT3PcWTUduNXchPxW6Tp
 37c/nS/CRYfXDCa4WXVrSP817aU9c/9cKEoL7206KZMu1m8/VUPSyxHVEeCrcDs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW8ywOQHG0NVDNCQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13qubqSOaPSkTMHMYYikFXU0J7rHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv5hX5njCijOo45POFwg841yOWnr/t10pIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF7n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:gSwIxKPM7BD5V8BcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78798913"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgeN/tPhnT0VJrbGIIf0Q5A61OzHiGlgTSDN1A2CIaqSITDkMpoKGmxARTtTZf0PffSwQTABe+CNOulMoKtDYw2Rx+rvLXlxl4uMQRK+ssQKq5DwyH8ZmSzMR6N4EjjF4/k1Tj7xiZ/xL3lYb3nN7wIp5/nx7xGpF7xDTO5qUxGo1Iu0lUuEhclVHycE9HPlAS0Pkcf0MM2bDREDq/ctcwsWP7xCL+rn+LOWh/bHMYYhsDeO8UHjOcMlyZUOlbp+YekeI3+yz+le2Lu/JYNDGHM/h4cxFABVhBws9NVXSkKo0kdFI1O51xpaitV0Eq8LHCiS0LcpOtA6edgAqYnlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+YZMYKtFtRpfMd4m+iQkjBRlTaZdDf6L0x1ytM5/iY=;
 b=Ia04B7VAwcjHzC+Oxz743PDqUlL87uY223B9u/r33nji/1FGe5AYku4JDx6XCwlCaIZkDNiaZLDkczvrP81NNt0CUGgORUbRpAzhE8c0sU42SssWqxGRVbv2Qud/G2QUZkKpJvrbSg6IFFOxRxfSbwci1LXyBv0xJqdjLdjMsvGV2RvxBaknesY4bRe5tnPZ+eU0SkVW7kVPigAXG/r7H5ps2b0RQmF0FcSo14EUw1DRofdXw338/wmom4n0PwZ5RMsYd5pBUVFOe2WFMtzo05cuSCR3kZi+lSZZOrvgHPGe/FJH4qegKVSLQxpfNvLlZeoVkzLMo8OY93/f3We6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+YZMYKtFtRpfMd4m+iQkjBRlTaZdDf6L0x1ytM5/iY=;
 b=O4B5EOuPjdbeU6gLcMuQSXXKduGcOYALJEafDcjeiLMGxBy+J2PGiI0HNwsDEcbRWSrZjo30IIUOz7P2y1iqioP0191BOreJpMyvxkf1Of15FGMmmXNBf6USOo7P3V/Dy4WNW7KIMInkY5nB/WTyLnuRuT6pXx/batLtCPoB9Ro=
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
Thread-Index: AQHYtrt8/1v0WOY/4kiCtfQ8qrAcS628L8cAgAAH3wCAABa0AIAAFEkAgAGVHgA=
Date: Wed, 24 Aug 2022 12:11:17 +0000
Message-ID: <61e209ea-4369-09b1-a26c-ff2aa28e5656@citrix.com>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
 <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
 <e9de03a3-77cf-bc90-be48-ef6b1f133661@suse.com>
In-Reply-To: <e9de03a3-77cf-bc90-be48-ef6b1f133661@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99faf367-2c93-45a1-daef-08da85c9bf73
x-ms-traffictypediagnostic: MN2PR03MB5167:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uV8VMcwqodldW/1T8exAJjdS1OLINcWbUD2hIi6/abdtmu7PN7vA6kAqbg+N73yIe3leHoHYp9eg71UbwpnCwhakcmFpfVbh9Owv3bXuDzsOR5T7JdSDFlibakGq46Yq2wJ6ChZCPzXeI56J2Ibl+j2wB/XPojSP91OF4B4guolNaAaLsydwambv/sMm2wDEs8rt6MpG3xGNYrmd04KTmOTIPX8IGYGfZvb+uK3X4dcKHtm9/0Ae/wVfQJjt+21GJbMWr1GKHBlsmb8Qlvm4VMXg39RstA01G023ByML8VDajaP/5dWae7EmxhaIFpKcDDZ0L+n15PuMgewf884D3fnUQ+U7JVmGXE5ihkJrc4Z9qY3OXNIGPGWEyZ3At3Ll6RyWNhLjwm7HHCc1IVvn/Ru5KHWxYsOiX8ym1C4DTCYiSVT00e97Vy5lYOD+da1neaWfBTqQUZV3dm51GbgQFkaltbMGk3Z4pT77Vy1ukufrdQK6FAEcCvZalaXuUdNG8pesv6NMr9rADrZZsOBi1SEKDaWkUOH+rsx5tK7ZYsKSzKw9U0QsGXd1q2ALGGfWoUqZi6uFH7tAcELepkTuiw2Apr2EyIUgT/vtBIX2rX9hX0RPhFJRXURbxgP4cm+sQmoM+YHujDuSS2SE+/PRaChDbV3/SYJTPds1KjjEM3uEy5UwDVc9hkZVYsthHfX/nK9M4Vwui4y4OuVh1lUvtsWXcr5m9Br4ABZdOFBg5SzD8TdEXaF8tx1QsSezcXp4Hk1G2mSfOL1L02uE5Q5Ak5yBrbHZAwGM4jOmiZnSA+uKxksq3oVIIwDGS9CtyajZjq/SnaDij1kBmovpIbtzcQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(478600001)(71200400001)(83380400001)(316002)(26005)(6512007)(6486002)(6916009)(54906003)(36756003)(2616005)(31686004)(186003)(64756008)(66556008)(8676002)(38100700002)(38070700005)(76116006)(122000001)(4326008)(66476007)(66446008)(66946007)(41300700001)(53546011)(31696002)(2906002)(6506007)(5660300002)(82960400001)(86362001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajBBSHFid2RNSjlERFZ1YVVTRVJNSXMzNFR0SkVFWnpXRDViRFp0RDdKTVU3?=
 =?utf-8?B?K2NORWNnNGkydzQremxXOEZmRkFOMUdEU1BmOHRCWWFpS3V0cVdkZzIzRy8w?=
 =?utf-8?B?cEpHMzJ2c1ZuMmdEdkNqc213Zkx6UTZHMTI3VC94c1hoQzh5UlNVVW1vWXk1?=
 =?utf-8?B?R1NmYkxwQmwxRTJFQk9lb2RkaERZMS9Md01hU1p1eUd5YnYyZzh2alFrS29M?=
 =?utf-8?B?VSt3aDVCQTR1QldlVmx4N1dlNmNKSXhUbUd5Rk9uYlVKc1EybkJhd0NzT25y?=
 =?utf-8?B?WkNBS2dOTXAxaE5xdHVKdkRTb0dpVjYwYzBIbm80T0s1T0p1UForSEN5WDAr?=
 =?utf-8?B?QXMwalZuZmw3anhhMGtueTV5cDBZcEduSFQrUUdqWFY2eFA4aGlXTXN4K2di?=
 =?utf-8?B?Q0kyTzJuU05ZdVVWUkU2UzFZREZ0eDNrZDB4akVVeXJ6UTVHcmpodTFIbVVS?=
 =?utf-8?B?SE01bXMyYVJlTmRWSitKb1BqNE1kNXhMUlVEUDFxUGF3MVAvYno0b1JVUmVL?=
 =?utf-8?B?WURXSEZ6K1BsVmJJN0hnS0lmWkF2bEFEaU1HVzl3cWNSYlplN2g5MHNOT3Ji?=
 =?utf-8?B?anVJNWo1Z04wZmdIWGZRUFRDOHBLU1BxTEhoSFZEUUxvUk0wTUtpT01HK0Z0?=
 =?utf-8?B?ZHJPS01taG1pS0gyTnpHWXc2S3Q2RHpHbjdJK01HZWNuN1lQOFNHL1J4NTJa?=
 =?utf-8?B?VjhiQUF6V0RScjNTTkJFS2dlVjJoZUZ4UXo2cHhCa2czRnY3cmdjYUt0bTJX?=
 =?utf-8?B?ZXpHSE9ZSXlNc0M3MkdmeEs2RXl4MEc0S0lFMlQzQy9yUmEvanNDdEJkekE4?=
 =?utf-8?B?cEpFYWJNa3lHNVNqTlM0ZWRPQTlhMUxrc0h3Y3VkaHgzNGZRcSs3OFNBNDVB?=
 =?utf-8?B?QVE2bEtwejBuSnlnajkyd3NJOHdzUzJqU1VoZkw4dmptc1FYbjh5ZFZyQUQ2?=
 =?utf-8?B?d3hoNjRHWGJFOGlaeE9IcUtuTm1GT3ZqeFZabklPcnJSU0gxRlQ1MDFzNFpE?=
 =?utf-8?B?dVpBU0RNS25ZVWdVQzJTOUhCSEc0Y2xTSW0zWjhLdFJPM0wvN1JuRlhTZjNx?=
 =?utf-8?B?UzJ6NGFmTVNkL2t6TkluUGV0eUd1WksrSUUxclpDeDlOSG90cjJmK0QwaFJw?=
 =?utf-8?B?YTNsZGVTYkFFYmdXa3p6aVpzYS9jYkNsVlJQU01NQWRIUnZNclVnK09OYWMr?=
 =?utf-8?B?N2o5cXJlbWhpd0pzN096M1dReUwxTHB5VU5ROHlvb1prZFJXSkRJaUhuenM2?=
 =?utf-8?B?L1U1UTNlMkphcU9YZ0ZnemgwR2hFRFp3b0QrRUFjMjBLOW1pMWdQdmluN01M?=
 =?utf-8?B?dEVoeEJPNldsRzdZUEF5NGM5VDJBdFh3TlQ5bmVSSGZtcS9qMGVFbldoY09x?=
 =?utf-8?B?c2lBd3NCcWFQRTB2angvb2V2RUJCbUFzRUZIcWN5NTZ2L292U0IweUdyMlkz?=
 =?utf-8?B?VFdXMnJXVWlaMUlnYjMvODZtQzQ3WjRlUzU5VGhXQVlUdVBiRGM1Y2s3NlBX?=
 =?utf-8?B?NklmNVUxN1d2NHZWZnpUc3lHQjRFMGZFWWVBSkxIMndhdXFPczNicEI4bGpN?=
 =?utf-8?B?YlhsRHBDWUZvU1JWR0FWSHNlb3ZHempWYy9CR1lCWk4vMC94SkZUV05iZjZS?=
 =?utf-8?B?WkVkVVRsTE9yZTBvbnBQbWcrRGs1UWtyK3gwNWtqTUkyTGF6UFgxeG4rcjFJ?=
 =?utf-8?B?L0s4L0pYRVgzWWcrVWxUa0wvUWVtQmt2Q3Excy9DY1htSk5ET3E0NTZ0T2hQ?=
 =?utf-8?B?ZkJtc2xQQk5ZTVd4SCtUQ3RmRDJBcjA4Und1L21pbDdpWUJoWENYcEJ2am9P?=
 =?utf-8?B?WUdjd0d5R0IyeXF1bzZBK09HdmtVUEkxVlpJYzlrak95ckNuL01pWjc0di9k?=
 =?utf-8?B?Vm5zejVYd2Z6MXVUMkppRlZ6amQ4L0wzUGY1TDFEVFJVdXFtVnBtRkNLQnUw?=
 =?utf-8?B?N2pzV1YyY2dtVUdQK3lZMDB4NEJpaWFQbEhoNzROK2UyVEFnRGQzNCtBdnNo?=
 =?utf-8?B?Y3RCMTZIdmdyci9iL2cvY1I2R0pxNEY2RlY4QSt6dUFXRnVseW1IWTcrQVU4?=
 =?utf-8?B?eVdYV05lMW9tZklCdHppQ2UrN09NcjFZZ3BmL0t5ODE2N04yTXpDK1FwdmxB?=
 =?utf-8?Q?d4pSVkHFD/z7kpQTNN43rudce?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1774341D56E48241881D11F68E01614C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99faf367-2c93-45a1-daef-08da85c9bf73
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 12:11:17.2683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cL65JnPmeO+kr7LK7eNV51FPijdrG2HtR6jcbvSrnlZFF5r4U3L0om+fEFublF1byaVtgkxDIQsiV8RNeWwvqJ/V8+7tt31TedTy2VmEtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5167

T24gMjMvMDgvMjAyMiAxMzowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA4LjIwMjIg
MTI6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMy8wOC8yMDIyIDEwOjI3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMy4wOC4yMDIyIDEwOjU5LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAyMy8wOC8yMDIyIDA3OjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4g
QnV0IHRoaXMgaXMgZ29pbmcgdG8gZnVydGhlciBjb21wbGljYXRlIG15IHNldmVyYWwteWVhci1v
bGQgc2VyaWVzDQo+Pj4+IHRyeWluZyB0byBnZXQgWGVuJ3MgWFNUQVRFIGhhbmRsaW5nIGludG8g
YSBwb3NpdGlvbiB3aGVyZSB3ZSBjYW4gc3RhcnQNCj4+Pj4gdG8gb2ZmZXIgc3VwZXJ2aXNvciBz
dGF0ZXMuDQo+Pj4gV2hlcmUgZG8geW91IHNlZSBmdXJ0aGVyIGNvbXBsaWNhdGlvbj8gVGhlIG5l
Y2Vzc2FyeSBmaWRkbGluZyB3aXRoIFhTUw0KPj4+IGhlcmUgd291bGQgb2YgY291cnNlIGJlIGRl
cGVuZGVudCB1cG9uIHAtPnhzdGF0ZS54c2F2ZXMgYWxvbmUgKG9yLA0KPj4+IG1heWJlIGJldHRl
ciwgb24gdGhlIHNldCBvZiBlbmFibGVkIGZlYXR1cmVzIGluIFhTUyBiZWluZyBub24tZW1wdHkp
LA0KPj4+IGJ1dCB0aGF0J3Mgc2ltcGx5IGFub3RoZXIgKGlubmVyKSBpZigpLg0KPj4+DQo+Pj4g
QXMgYW4gYXNpZGUsIEkgYWN0dWFsbHkgd29uZGVyIHdoYXQgdXNlIHRoZSBzdXBwbGllZCBzaXpl
IGlzIHRvIHVzZXINCj4+PiBtb2RlIGNvZGUgd2hlbiBhbnkgWFNTLWNvbnRyb2xsZWQgZmVhdHVy
ZSBpcyBlbmFibGVkOiBUaGV5J2QgYWxsb2NhdGUNCj4+PiBhIG5lZWRsZXNzbHkgbGFyZ2UgYmxv
Y2sgb2YgbWVtb3J5LCBhcyB0aGV5IHdvdWxkIG9ubHkgYmUgYWJsZSB0byB1c2UNCj4+PiBYU0FW
RUMuDQo+PiBUaGlzIGZpZWxkIGlzIGFuIGFscmVhZHkga25vd24ga2VybmVsPT51c2VyIGluZm9s
ZWFrLsKgIFRoZXJlIGFyZSB0aHJlYWRzDQo+PiBhYm91dCBpdCBvbiBMS01MLg0KPj4NCj4+IEJ1
dCBpdCBkb2VzIGhpZ2hsaWdodCBhbm90aGVyIHByb2JsZW0uwqAgVGhpcyBjaGFuZ2UgZG9lcyBu
b3QgZml4IExpbnV4DQo+PiBvbiBBTUQgWmVuMyBoYXJkd2FyZSwgd2hlcmUgdGhlIGtlcm5lbCB3
aWxsIGZpbmQgdGhlIENQVUlEIHZhbHVlIGxhcmdlcg0KPj4gdGhhbiBpdCBjYW4gY2FsY3VsYXRl
IHRoZSBzaXplIHRvIGJlLCBiZWNhdXNlIFhlbidzIHVzZSBvZiBDRVQtU1Mgd2lsbA0KPj4gc2hv
dyB1cCBpbiB0aGUgQ1BVSUQgdmFsdWUuDQo+Pg0KPj4gTGludXggbmVlZHMgYW4gYWRqdXN0bWVu
dCBmcm9tICE9IHRvIDw9IGZvciB0aGlzIGNoZWNrLg0KPiBJIHdhcyB3b25kZXJpbmcgYWJvdXQg
dGhhdCB0b28sIGJ1dCBpZiBJJ20gbm90IG1pc3Rha2VuIHRoZSBjaGFuZ2UgeW91DQo+IHN1Z2dl
c3QgaXMgdGhlIG9wcG9zaXRlIG9mIHdoYXQgd291bGQgYmUgYXBwYXJlbnRseSBzYWZlIHRoZXJl
IChhZ2FpbnN0DQo+IG92ZXJydW5uaW5nIGJ1ZmZlcnMpLiBIZW5jZSBpdCBtYXkgdGFrZSBtb3Jl
IHRoYW4ganVzdCB0aGUgY29tcGFyaXNvbg0KPiB0eXBlIHRvIGJlIG1vZGlmaWVkLg0KDQpUaGUg
aXNzdWUgaXMgdGhhdCB0aGUgQ1BVSUQgbGVhZiByZXBvcnRzIHRoZSBjb21wcmVzc2VkIHNpemUg
b2YNClhDUjB8WFNTLCB3aGljaCBpcyA+PSB3aGF0IHRoZSBYU0FWRUMgaW5zdHJ1Y3Rpb24gd2ls
bCB3cml0ZSB3aGVuIGl0J3MNCm9ubHkgb3BlcmF0aW5nIG9uIFhDUjAgc3RhdGVzLg0KDQpTbyBl
aXRoZXIgTGludXggdHJ1c3RzIHdoYXQgaXQgY2FsY3VsYXRlcyBmcm9tIHRoZSBvdGhlciBDUFVJ
RCBsZWF2ZXMsDQphbmQgZ2V0cyB0aGUgY29tcHJlc3NlZCBzaXplIHJpZ2h0LCBvciBpdCBuZWVk
cyB0byBhY2NvdW50IGZvciB0aGUgZmFjdA0KdGhhdCBpbiBYZW5QViBhdCBsZWFzdCAocHJvYmFi
bHkgVU1MIHRvbyksIHRoYXQgdGhlIENQVUlEIGxlYWYgb3Zlci1yZXBvcnRzLg0KDQp+QW5kcmV3
DQo=

