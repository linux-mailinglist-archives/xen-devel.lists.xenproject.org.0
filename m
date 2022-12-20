Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D49651F76
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 12:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466975.725958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7aV8-0005Lm-Vr; Tue, 20 Dec 2022 11:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466975.725958; Tue, 20 Dec 2022 11:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7aV8-0005K1-T6; Tue, 20 Dec 2022 11:09:38 +0000
Received: by outflank-mailman (input) for mailman id 466975;
 Tue, 20 Dec 2022 11:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pxk=4S=citrix.com=prvs=3460f7db1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7aV7-0005Jv-K6
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 11:09:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c781d455-8056-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 12:09:35 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Dec 2022 06:09:31 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB6951.namprd03.prod.outlook.com (2603:10b6:a03:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 11:09:27 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 11:09:27 +0000
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
X-Inumbo-ID: c781d455-8056-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671534575;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z0FkCiCsOFFuToE+3vYNKkCy8RMf3fGNsQ3NJ2FMVc8=;
  b=Q8uLLoWXuyQIVRngxzUaQrUm0O46GN6oTWiurYTaQ98pyImnwbuqiq7s
   lSnBYz78zK+ASgwTKhq6OuZlo958NSr+CweI0I8y3LfSzOeOtjXtroBJ7
   j0siLghbUNRsd3ViOJxXpcC5DIJI6aGCBCFueNPLYooLa5ZGGPHKU6QbQ
   s=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 89278979
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PGuv7KCWTLprqhVW/xHiw5YqxClBgxIJ4kV8jS/XYbTApGgmhDVSy
 2tMCmiGPKqLMGH2eNojPoTnpkkPuZSAzIAxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlC5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/PZ2Aj927
 cYkFm4ucBK9g8myzIy4Y7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrswA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE1r6VwnOqB9N6+LuQ+cRwgwyU7TAoSyJNBQehhOHgj1e5VIcKQ
 6AT0m90xUQoz2ShU8PvVhm/rHmbtzYTXtNRF6sx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S3iQ67OVpjOaIjUOICkJYipsZRQBy8nupsc0lB2nczp4OKu8j9mwHC6qx
 TmP9XI6n+9L0Z5N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLtm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:SAYlWa0UjH7fcCiwQEB54gqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-IronPort-AV: E=Sophos;i="5.96,259,1665460800"; 
   d="scan'208";a="89278979"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4qN8wZWhU0H8WQIcihaJ3lGHZGAxYSysCHYzvI7ISgMQr+vT3bxIUvcSDEeOhmAybsuALF8OpT8mMB0cnCOLw3UxlzvBE9DgQRgcIDZqKHbIdkAweUQphLh7Wx/abYBJ7oVxi58o1OjFFEGT005v7fPYV5zmMPCcr8TBgr81xS5WIqXzcK1xyBsOfJHtSMf+yQIpeW60i9j7w72Orzyt2VEdGB8TTW7ok6AR1FQSliyJG4fT7T9cAdzQagZqLttAIbOZuXTPz8RhUJRr5thghYV4oWovU/PJpd7WW1+GI8jA5bk3TF+I/D7rhrNP3YOoOD0+pRk8A1Qn6VHRourvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0FkCiCsOFFuToE+3vYNKkCy8RMf3fGNsQ3NJ2FMVc8=;
 b=DsA8cv+NfmDxRYxB0XC59ovo51bQpcvn13HzL513cKC/GKSON9lPeBMYC51cdwDGZgDimpYHa1cRbPQYJmCO26AkvgkKR42yeIC1hhepVsQF5uxpi9YoDfH6fqgrLEfXJUgcJzEI2neBJkhnuPVEWui0Rp7fPmcybrShSJkiWPg78YSkCbQcad4HYqW6GX3FaPlvUxjkdsbcQCYsv4XqH6kFGqU/pjRzrZBcf+Qzb5bFASHBg/1thFzm96hn6lXpvk0PocV9+ZV2vc6zKJn2HURyMK0RAHI9u68kejEP3OGcixODFJurQCpAQCNd0uLxTO3wE2GmMI1Tn5oXFZIu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0FkCiCsOFFuToE+3vYNKkCy8RMf3fGNsQ3NJ2FMVc8=;
 b=Ru5NnfKndvGx99hYXN/exgJ0nSrNIDgrl6cQL/zYzyZYzmNJzy56GZ2RtNKbRXB5RXE089+VIi74pjX1a+kc2Qt7XKKCuipOKEyB+fTKV8XLamyKmCG4UGXhMUaH6xa9MfqfCkskyMLDbyyTXVv20xMrmGlOW5x/9wY6Z5xGXg0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [RFC 5/7] x86/iommu: the code addressing CVE-2011-1898 is VT-d
 specific
Thread-Topic: [RFC 5/7] x86/iommu: the code addressing CVE-2011-1898 is VT-d
 specific
Thread-Index: AQHZE3QhgtEjjj3o3UG9yEmVkUBhi652oCIA
Date: Tue, 20 Dec 2022 11:09:27 +0000
Message-ID: <5a78ab9f-ce3a-a4f5-9768-725bd9f8a745@citrix.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-6-burzalodowa@gmail.com>
In-Reply-To: <20221219063456.2017996-6-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SJ0PR03MB6951:EE_
x-ms-office365-filtering-correlation-id: 5b7adbbe-40c3-4833-3774-08dae27aa903
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6QRiAFihIB/u+zNUmdYwW122as/vOE7cTPiuossUwCqm/nUs2/C/R3QTCZoUcp8y1oKqmk/AWpRCOUV1K6Kbi0s2PctP3baxRVE1JLnTBTqxn19TcQ819qMJ4PqenrnYPe+RKYTEcQXjE1jeHxJv1TEekuLhqnQGxtIzBp89cbIYeiWwQV69Jff57s+WJb/3ggg8wvH0R3I6IGRQMINqZn1ILkEj7k+aMcdCLnkaE1H/yxChAstgrpw5O0YdeQqsTkADrLHI2nRMpr0Z5fYSJ1xu2juDNqvGcqjxUIMvRA2uhev27xYEWEm+f8UE0AG3NIaHJs/RvDS1hvYLeYN1pGCB5OejP+sSxWMSnnDpU0YgL4IzqAjln1soSjqHaevf74JqRoJO8XK/ywOapR3SZg2Viwx0OqoezudsMM3WZJRWAtgff5fSdRsBS0J5lOMNbvrUsL84goYPVnBcBWNQg3OMZj9rjXi3vVhw7huA3zrKbn5tftfUQHKjD9o1apN0o+qygFa11ZpKoMel1wfLocdsJX7mO4zex2U2oyUqgrYShnEyJMweA5pqQHs2nZ2+jH7XfIlk4A4ZGlkcQQ/kl+RMPwpBHg1beH3xXSgotmaZvMDiRtZH/apaRLsyMj5+EqYvZISMg5U2fhSX3VL3qpbsR8Jr+JKoQhdlt9LmA96k3FJuGYONXn2T7aQlPBSPfgNClRjnjpeH54C94PRq+dI4myVl6HEg5GcmP6ds4dMZ4ud0NcrpncGxWzCZHi1xu6q0L06QBkv2xiqdIGY23w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(53546011)(6506007)(71200400001)(2906002)(478600001)(6486002)(31686004)(26005)(54906003)(110136005)(36756003)(91956017)(76116006)(2616005)(66946007)(316002)(41300700001)(8936002)(186003)(8676002)(6512007)(64756008)(83380400001)(66476007)(66556008)(122000001)(82960400001)(38100700002)(4326008)(5660300002)(86362001)(66446008)(38070700005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHFqWGwxMGlUUTBGM3U1OTBYL05DQkFFc3hyZXBXQmFmTEVCemhsb3NocHJP?=
 =?utf-8?B?ZFdQOGswdG8yS1BPclQzbnI5WTM4akV1eGc2VWIrY2dFbHVSUUFUcHltek4z?=
 =?utf-8?B?S1BGUGhiYUNXb2k4MHJSS3NvRS8rcXEzVm1aQithM2txV3ZzSlNDUmNaNTA1?=
 =?utf-8?B?dE1BVXJaaytVckRmM1NscHhTRi9pSzlTUVhLdkRGZjMzdGVQTTZTd2dCY2Vi?=
 =?utf-8?B?cm5ycisrSUthQzhoQ3oxaXNEN21BUUpRcmduemg3N0FsdTFYSzdDKzlGTXZt?=
 =?utf-8?B?V09YcHRhcGl0ZGJjZitSTHk2RVBRVnFIK2tjcXNOTlJ1c0srWEdZcUllQUk1?=
 =?utf-8?B?eDYwNWtqUndFOGhwbk1DY1J4WWVCZTZqemlrRnNDLzJ5WFV1MGtMZ3dNYlBz?=
 =?utf-8?B?UXFwYTJCMXlNbUNDdnRJWWhjbFJvTXRZZ2xWNjV1dUhxRUcwRUhTUjFpSjY2?=
 =?utf-8?B?MHB1RDJFYVJWMjlZQ1J0eDNWQU9EUStZY2VXNVZKcVI5VTZJM3BMb3JsZndt?=
 =?utf-8?B?SUY4TUZUd2lMZk4rVEZ0QjJXYkhJMGplamlwb0FnalVRbFRXZHRwWE11d3Ay?=
 =?utf-8?B?TDEwdzhWSmQ0cjBjekU2Wmx5aFduQlRxNk90WHpqSDlhQnNiQi84bmhKdDEx?=
 =?utf-8?B?SnBIdWdiaEsvOEVHRTYvR3lweG90bU1aU3FEdnhTVXJOOTBLeGlSeXpZWENK?=
 =?utf-8?B?QzYyK2xRYU9qZnVqZmRwdWJ5YlNybEUwUlVFT3RQMytTajBBNk9rWG1XSC9l?=
 =?utf-8?B?WXZBNGp3Qmx3em9SNkpaR29RenRtOVJ2RmFVVkxpblpNL2NuRDdEdXFtN3Nm?=
 =?utf-8?B?LzRJM1psbW1nY2R1d2hnZHUzRFZrUHg4aVNrOE16UWpvc2d0MUkxMlhOb0hI?=
 =?utf-8?B?cTFGWkVpWU1uUG0vODJYZFJQeTBhcExwdWt3NUYzQzkrdUkvNWpYSkZHQnhR?=
 =?utf-8?B?NkVocm9zblJyQjVoQnRNQmpmUlVUMHFxU0RBb0VONGd4dm1LR1JoUWowNmk1?=
 =?utf-8?B?WExsRHYvUU9qN2JaUzE5dThFZDlFMlNEbDdTVWVqbEtZL2EwNVhMU2F2cmZW?=
 =?utf-8?B?eFh2MnlKcWppM1lVNHpCZS8vdjBaUnZwNjQ4WWJPd0lCNFNUbWtnMml1TjVj?=
 =?utf-8?B?NURlQmkwUEg3aEtTakN4QkE3M0RmWVNGbGxxeHE0UDVWblJXTmQ1OGRGUytJ?=
 =?utf-8?B?OExUL1FCOG5QRS9acGNmK00ycW5YalJDNVlQaUR4d3N4SDJvNGFmUmVnemlQ?=
 =?utf-8?B?YUNSYnR3NHQzV2ZBdFhUWVFGOEJuUUhuQ3MwUWVkZThpOEppQk9rbmVOb0t1?=
 =?utf-8?B?Tld4TmxPdXZuOWhOSXZ3V3Jua3NKSGp3cHNDOXZHUEZtUGE4WWRPRlc1Ujln?=
 =?utf-8?B?OXNhVndsSndSaGhVRUQ5ZE96VzlSZ3RyYTd6eFdtSFBpMVNhQVdMK1Y4bFY0?=
 =?utf-8?B?dk5GWGthUmRjUjUwNHlMNmVvZHBlU0JQYTcvd3IwTmtnZFhYWUVKenQzNnZ6?=
 =?utf-8?B?SHhyWGpJWjBTNEExdlJ4Q29MUmV4U1prVnF4ZDRJMXo1TVZOUURySDd6MVhX?=
 =?utf-8?B?TFU2S014Y05mOFJmUFpEMzJodHJkbmRuTGNCYUl5STVPTktLcTZOcG9DQldU?=
 =?utf-8?B?OGZYU1F2TzZ0RkEvZVFCc2lzTTNJT1p4dDBaekIxQzRQSUVoS2FXQ2MxNHds?=
 =?utf-8?B?SWZFUjBSbi9OZ0s4MG04QVR1amxYN0ZML0dEa1JSTGdjY3VQZEM4dTlYZmJq?=
 =?utf-8?B?OTNEWjR5TElSeElhVzRRN1NKek1USFZVK3cwOWlGelhVbEQybkdCczA0RGJH?=
 =?utf-8?B?MllzMlFMQlZFT0xpcm9nWE1jcklQeEJ0c0txVitEZTVFUlZ0S0YvQlIyNFYx?=
 =?utf-8?B?VUhlNUQzRndESzlSK0xmdFdUOTExejNGelQwM2FmNTRQelZ4eUovbXoyMnQr?=
 =?utf-8?B?ekVBM0lMK0ZxWXVBWTFJelRBamZLY2pYMFRiQXdLRzR2QmJ6ZHhRVGd2L0tP?=
 =?utf-8?B?SGV4YkhXVE1CQzZER29XYUZxTDFna2lvY2RiajltMk0yM1VtbndNUzAySnBw?=
 =?utf-8?B?NzVqL1VhZlV5NVJES1FpVktjWWdBTFJkNXFOMld1K2tlMFh3Q2JGeXdKSWhq?=
 =?utf-8?Q?fCyr7cS7HtXcRhxLsm1QycA4e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9C7392AE08EDB469026E5EC92B67DFB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7adbbe-40c3-4833-3774-08dae27aa903
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 11:09:27.5481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7Yi0/kJT0FB58A06p98i47T6hQfB6xVPX5GErLqacKZneot4g1tTZmMh/5haHcecfgWy2UZe8t3OZ1Hhtb2PxuMZZklxSaqQFi/BMExTPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6951

T24gMTkvMTIvMjAyMiA2OjM0IGFtLCBYZW5pYSBSYWdpYWRha291IHdyb3RlOg0KPiBUaGUgdmFy
aWFibGUgdW50cnVzdGVkX21zaSBpbmRpY2F0ZXMgd2hldGhlciB0aGUgc3lzdGVtIGlzIHZ1bG5l
cmFibGUgdG8NCj4gQ1ZFLTIwMTEtMTg5OC4gVGhpcyB2dWxuZXJhYmxpdHkgaXMgVlQtZCBzcGVj
aWZpYy4NCj4gUGxhY2UgdGhlIGNvZGUgdGhhdCBhZGRyZXNzZXMgdGhlIGlzc3VlIHVuZGVyIENP
TkZJR19JTlRFTF9WVEQuDQo+DQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBYZW5pYSBSYWdpYWRha291IDxidXJ6YWxvZG93YUBnbWFpbC5jb20+
DQoNCkFjdHVhbGx5LCB0aGlzIHZhcmlhYmxlIGlzIHByZXR0eSBib2d1cy7CoCBJIHRoaW5rIEkn
ZCBsaWtlIHRvIGRlbGV0ZSBpdA0KZW50aXJlbHkuDQoNClRoZXJlIGFyZSBzeXN0ZW1zIHdpdGgg
bm8gSU9NTVUgYXQgYWxsLCBhbmQgd2UgY2VydGFpbmx5IHVzZWQgdG8gbGV0IFBWDQpQYXNzdGhy
b3VnaCBnbyBhaGVhZC7CoCAoTm90IHN1cmUgd2UgZG8gYW55IG1vcmUuKQ0KDQpUaGVyZSBhcmUg
c3lzdGVtcyB3aXRoIERNQSByZW1hcHBpbmcgb25seSwgYnV0IG5vIGludGVycnVwdCByZW1hcHBp
bmcuwqANClRoZXNlIGFyZSBrbm93biBpbnNlY3VyZS7CoCBJJ20gaG9uZXN0bHkgbm90IGNvbnZp
bmNlZCB0aGF0IGFuIElTUiByZWFkDQphbmQgY3Jhc2ggaXMgdXNlZnVsIHdoZW4gdGhlIHVzZXIg
aGFzIGFscmVhZHkgY29uc3RydWN0ZWQgYW4NCmtub3duLXVuc2FmZSBjb25maWd1cmF0aW9uLCBi
ZWNhdXNlIGEgbWFsaWNpb3VzIGd1ZXN0IGluIHRoYXQgY2FzZSBjYW4NCnN0aWxsIGZ1bGx5IG1l
c3Mgd2l0aCBkb20wIGJ5IHNlbmRpbmcgdmVjdG9ycyBvdGhlciB0aGFuIDB4ODAgYW5kIDB4ODIu
DQoNCkluIHBhcnRpY3VsYXIsIHRoaXMgb3B0aW9uIGRvZXMgbm90IGdldCBhY3RpdmF0ZWQgb24g
QU1EIHdoZW4gdGhlIHVzZXINCmVsZWN0cyB0byBkaXNhYmxlIGludGVycnVwdCByZW1hcHBpbmcs
IGFuZCBJJ20gZGlzaW5jbGluZWQgdG8gd2lyZSBpdCB1cA0KaW4gdGhhdCBjYXNlIHRvby4NCg0K
fkFuZHJldw0KDQpQLlMuIEl0IG9jY3VycyB0byBtZSB0aGF0IEZSRUQgb2Jzb2xldGVzIHRoZSBu
ZWVkIGZvciB0aGlzIGFueXdheSwNCnNlZWluZyBhcyBpdCBkb2VzIHByb3Blcmx5IGRpc3Rpbmd1
aXNoIHRoZSBzb3VyY2Ugb2YgYW4gZXZlbnQuDQo=

